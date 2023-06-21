Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E1141738E6A
	for <lists+dri-devel@lfdr.de>; Wed, 21 Jun 2023 20:17:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E9BF10E347;
	Wed, 21 Jun 2023 18:17:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 34B4A10E344;
 Wed, 21 Jun 2023 18:17:37 +0000 (UTC)
Received: from [192.168.2.254] (109-252-154-132.dynamic.spd-mgts.ru
 [109.252.154.132])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested)
 (Authenticated sender: dmitry.osipenko)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 574366606FAC;
 Wed, 21 Jun 2023 19:17:33 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1687371454;
 bh=zmKL+M3CGk6HThKHIP9ubJfE9b7029/+Mv8Ujzw+Hbk=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=bVOzuhAOq2uJZVaj/5XigJdh/I6rgUGxJUrtMGIZ5RNOsTocyNU6xHMZLHSfb0qOK
 BYAN6ioVATc9QAliy1MG/l7CSJVKuP21ALotoS/yqE8uZCZt4SP5TykgBFFyhxsgz9
 XBAJSlSbFCBuBpoe3TMaaGPTBYBJM2wK5/dnZ50Hkf8GXcbeRwY5Gxo6VvBaCZ4M74
 39eSteKg8Mlwp64C2wVVN/D6zzCt0xT6IaLw7m/iZE5evOkWrfOVbtnIH9ldGF++sG
 InvwtE2fxcXzpXjtDI2irEMmVHLQT3TZ1AmOxXrZc3xfIEsUYtnLdq3lMyllOY1LLj
 n+TS5qiJhS6VA==
Message-ID: <9d800e80-3860-d58c-3a96-0f5e73cb9309@collabora.com>
Date: Wed, 21 Jun 2023 21:17:30 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.1
Subject: Re: [PATCH v4 5/6] dma-buf: Change locking policy for mmap()
Content-Language: en-US
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Sumit Semwal <sumit.semwal@linaro.org>
References: <20230529223935.2672495-1-dmitry.osipenko@collabora.com>
 <20230529223935.2672495-6-dmitry.osipenko@collabora.com>
 <91466907-d4e1-1619-27a8-a49a01cbc8f1@collabora.com>
 <1a04706a-caee-114c-6b6e-e4fdb815e619@collabora.com>
 <3ddf2152-392f-095d-3db6-c0c5c56e0cbf@amd.com>
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
In-Reply-To: <3ddf2152-392f-095d-3db6-c0c5c56e0cbf@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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

On 6/21/23 08:42, Christian König wrote:
> Am 20.06.23 um 17:58 schrieb Dmitry Osipenko:
>> On 5/31/23 22:58, Dmitry Osipenko wrote:
>>> On 5/30/23 01:39, Dmitry Osipenko wrote:
>>>> Change locking policy of mmap() callback, making exporters responsible
>>>> for handling dma-buf reservation locking. Previous locking policy
>>>> stated
>>>> that dma-buf is locked for both importers and exporters by the dma-buf
>>>> core, which caused a deadlock problem for DRM drivers in a case of
>>>> self-imported dma-bufs which required to take the lock from the DRM
>>>> exporter side.
>>>>
>>>> Reviewed-by: Emil Velikov <emil.l.velikov@gmail.com>
>>>> Signed-off-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
>>>> ---
>>>>   drivers/dma-buf/dma-buf.c | 17 +++--------------
>>>>   1 file changed, 3 insertions(+), 14 deletions(-)
>>> Christian, you acked the drm patch of this series sometime ago, perhaps
>>> it also implies implicit ack to this patch, but I'd prefer to have the
>>> explicit ack. I'll apply this series to drm-misc later this week if
>>> you'll approve this dma-buf change. Thanks in advance!
>> I'll merge the patches tomorrow. If there are any additional comments,
>> then please don't hesitate to post them.
> 
> Sorry for not responding earlier, I have been moving both my office as
> well as my household and still catching up.
> 
> I don't have time for an in-deep review, but my ack stands for the whole
> series.

Thanks! I'll add yours ack and merge patches soon

-- 
Best regards,
Dmitry

