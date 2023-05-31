Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EE29A718AA5
	for <lists+dri-devel@lfdr.de>; Wed, 31 May 2023 21:58:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D562710E07B;
	Wed, 31 May 2023 19:58:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1369110E033;
 Wed, 31 May 2023 19:58:29 +0000 (UTC)
Received: from [192.168.2.24] (109-252-150-34.dynamic.spd-mgts.ru
 [109.252.150.34])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: dmitry.osipenko)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id E13B26605718;
 Wed, 31 May 2023 20:58:22 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1685563104;
 bh=dCBQxEeV0Iw3HAIDzbjdU57qicANUXXtSRWbBbZaZfY=;
 h=Date:Subject:From:To:Cc:References:In-Reply-To:From;
 b=ElE3acRDApuw17RRzTN9VV+kygun7yJqVN9+uz8G81714zkzjTrQA5ChZzqizOGba
 /RnQoS7Kr8cZ0LPALUF/bGZY/Zw4fiKDlksKoo7LBogbHFjvXPOI6wmr+uqi/mSpbc
 D1ASAqPqd77jLEyNeuU2YVQsP3P9WzR+qsV3cw8BvAa9v8ueC80IOLE4RwMGNOCJug
 caIWXEOMGOX/XgIvm9osJf0LnvYCqg4NyfD4rtcwZbRFVRu5gOth5CVW4ZXRoFUdv6
 tK1b0PzaaPNph//JupOGOcHkGUc48epxEbiN/BakIBdAQ8ZU5Y0N263W5HlyAMYhqJ
 P9Wd7TS1Auxww==
Message-ID: <91466907-d4e1-1619-27a8-a49a01cbc8f1@collabora.com>
Date: Wed, 31 May 2023 22:58:19 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v4 5/6] dma-buf: Change locking policy for mmap()
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
To: Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
References: <20230529223935.2672495-1-dmitry.osipenko@collabora.com>
 <20230529223935.2672495-6-dmitry.osipenko@collabora.com>
Content-Language: en-US
In-Reply-To: <20230529223935.2672495-6-dmitry.osipenko@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Arnd Bergmann <arnd@arndb.de>,
 Emil Velikov <emil.l.velikov@gmail.com>, intel-gfx@lists.freedesktop.org,
 Marek Szyprowski <m.szyprowski@samsung.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Tomasz Figa <tfiga@chromium.org>,
 Tomi Valkeinen <tomba@kernel.org>, Thierry Reding <thierry.reding@gmail.com>,
 John Stultz <jstultz@google.com>, Gerd Hoffmann <kraxel@redhat.com>,
 linux-tegra@vger.kernel.org, kernel@collabora.com, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 5/30/23 01:39, Dmitry Osipenko wrote:
> Change locking policy of mmap() callback, making exporters responsible
> for handling dma-buf reservation locking. Previous locking policy stated
> that dma-buf is locked for both importers and exporters by the dma-buf
> core, which caused a deadlock problem for DRM drivers in a case of
> self-imported dma-bufs which required to take the lock from the DRM
> exporter side.
> 
> Reviewed-by: Emil Velikov <emil.l.velikov@gmail.com>
> Signed-off-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
> ---
>  drivers/dma-buf/dma-buf.c | 17 +++--------------
>  1 file changed, 3 insertions(+), 14 deletions(-)

Christian, you acked the drm patch of this series sometime ago, perhaps
it also implies implicit ack to this patch, but I'd prefer to have the
explicit ack. I'll apply this series to drm-misc later this week if
you'll approve this dma-buf change. Thanks in advance!

-- 
Best regards,
Dmitry

