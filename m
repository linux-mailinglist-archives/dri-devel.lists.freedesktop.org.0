Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CC5473E01E
	for <lists+dri-devel@lfdr.de>; Mon, 26 Jun 2023 15:05:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F34610E1FC;
	Mon, 26 Jun 2023 13:05:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 56DFD10E1F7;
 Mon, 26 Jun 2023 13:05:23 +0000 (UTC)
Received: from [192.168.2.254] (109-252-154-132.dynamic.spd-mgts.ru
 [109.252.154.132])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: dmitry.osipenko)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 265C96606EF9;
 Mon, 26 Jun 2023 14:05:18 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1687784720;
 bh=1sBMM2PRRV9h1R/j/rMSloE9aC2lpEqWGuljd40xwbM=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=lGBeuXWb01fFSzJ2pFOwmMEqBs2rZQZVQpaA/TuCvDVDtXQgBurZ7wQBDEiRk+D0g
 kFY6B96C8DgjTQOg4y+E15Bi2zbWx2hRzPT+TCeWBvlq/z3x9mLE/zZBSmqvOaVYg4
 BNutK+oH87OC2/6/PhJ6UJyTyOQqs0eLny9I4cuW2DyKxbXTbei0YwBov4cLtLAWr1
 NJrEfrJLFtxEKT4oyQogTfqonglyJRyKBfA5hiByacbQOSwuTg3+ej8OHo2WvybNiJ
 5eb75PHN01929Km2K0XGC2iOSUpP7IGjp0mhGtjQI9Xhu87S4NVhdTC4ov//7BmKtx
 YFN46CpVsU7WQ==
Message-ID: <2b932742-0637-3b7a-acb5-ab643781caa3@collabora.com>
Date: Mon, 26 Jun 2023 16:05:14 +0300
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
> Same problem with this renaming: it's confusing because this function
> was previously taking care of the locking, and it's no longer the case.
> That's actually true for other public functions your patching, but I
> won't go over all of them.
> 
> I know this patch has been under discussion for quite some time, and has
> been validated by other devs/maintainers, but I'd like to understand the
> reasoning behind these decisions. Not the decision to replace all locks
> by dma_resv, which I kinda understand, but the decision to change the
> behavior of functions without making the name reflect the new behavior
> (_locked prefix), or the fact we now prohibit some functions to
> succeed when the dma_resv lock is taken by the driver beforehand (which,
> unless I'm mistaken, will happen in the VM_BIND logic, and can happen
> in the SUBMIT ioctl too depending on the driver).

Adding explicit _locked/unlocked postfix to all function names indeed
won't hurt to do. There was no decision made about the function names,
the old functions kept the old name where possible to minimize code
changes during transition to the resv lock. Improving the names could be
the next step.

Thanks for the feedback!

-- 
Best regards,
Dmitry

