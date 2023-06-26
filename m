Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CBC2C73E024
	for <lists+dri-devel@lfdr.de>; Mon, 26 Jun 2023 15:05:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C943610E0EB;
	Mon, 26 Jun 2023 13:05:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 06F2C10E0EB;
 Mon, 26 Jun 2023 13:05:40 +0000 (UTC)
Received: from [192.168.2.254] (109-252-154-132.dynamic.spd-mgts.ru
 [109.252.154.132])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested)
 (Authenticated sender: dmitry.osipenko)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id BCCD36606EF9;
 Mon, 26 Jun 2023 14:05:35 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1687784737;
 bh=UduXksLELXstu/IT+fN/u2qfAoyq+jaxriMeJJQvIMM=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=NrgukjA1DHJj1g7zNjrN/5FsxxcF05ysjW5CddwQDyvmub9yTZmZfcfCi1zocvuQs
 tKnhwifaeyEv0gyFrsBp6pXUKEIJ/jD1c/vVStDTe71ma2gejUp/lAZSQNd2YRsOtK
 ZGqTay3e0HR9Y/knPtp+nSSlzp9ZoJ9w9E5wdGHJ5Yu0cCVFiNTAUJojSddZ/qoT5M
 osqOer+obrMLx/wHp7XfRlUOn7AmJmt+eNmgm6D5uDi81CFyspZ0ecmB+tRUDOvqNs
 b7ZDWOIvFbSmlfJL+d6Xs9g08fKOHWnL3rIJ65Re1zJ41jLzy/SMKKBFvqjwnhXW0Y
 2kOyALaDANEeQ==
Message-ID: <4f652b3b-8691-84f4-037a-64950a30d496@collabora.com>
Date: Mon, 26 Jun 2023 16:05:33 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.1
Subject: Re: [PATCH v4 6/6] drm/shmem-helper: Switch to reservation lock
Content-Language: en-US
To: Boris Brezillon <boris.brezillon@collabora.com>
References: <20230529223935.2672495-1-dmitry.osipenko@collabora.com>
 <20230529223935.2672495-7-dmitry.osipenko@collabora.com>
 <20230626114014.2c837255@collabora.com>
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
In-Reply-To: <20230626114014.2c837255@collabora.com>
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
Cc: dri-devel@lists.freedesktop.org, Thierry Reding <thierry.reding@gmail.com>,
 John Stultz <jstultz@google.com>, Gerd Hoffmann <kraxel@redhat.com>,
 kernel@collabora.com, Sumit Semwal <sumit.semwal@linaro.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 linux-media@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
 intel-gfx@lists.freedesktop.org, linux-tegra@vger.kernel.org,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Tomi Valkeinen <tomba@kernel.org>,
 Emil Velikov <emil.l.velikov@gmail.com>, linux-kernel@vger.kernel.org,
 Tomasz Figa <tfiga@chromium.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 6/26/23 12:40, Boris Brezillon wrote:
> I think here is the major problem I have with this patch: you've made
> drm_gem_shmem_{get_pages,pin}() private, which forces me to call
> drm_gem_shmem_pin() in a path where I already acquired the resv lock
> (using the drm_exec infra proposed by Christian). That would
> probably work if you were letting ret == -EALREADY go through, but I'm
> wondering if it wouldn't be preferable to expose
> drm_gem_shmem_pin_locked().

You should be free to expose the necessary functions. They are private
because nobody need them so far and we don't want to export unused
functions.

-- 
Best regards,
Dmitry

