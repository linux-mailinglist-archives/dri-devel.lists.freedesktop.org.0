Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 31388894F9B
	for <lists+dri-devel@lfdr.de>; Tue,  2 Apr 2024 12:10:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DCE1B10FBFD;
	Tue,  2 Apr 2024 10:10:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="yALmyE4v";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0589E10FBFA
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Apr 2024 10:10:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1712052619;
 bh=0kebiPk3tKa7/IHwyWmTQTorTf80HcI+vNk71eLMMfw=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=yALmyE4v5Uk7/0unVC+y/UOxPUvStllE+5MALfnESMk/JZnZY2xEGUMFxLXHXmOYZ
 DDR8xv67oMX6e0PabhS+CU7bsYYMORlBGN7WK1LmSzwmeJZNMOQfgt1JOlEK3WiwXs
 rs+LOrM/FPBTNRUOhGsyWvIctp0xDzdsQ4oHpxZT7oOtpP62tYvIieFRkVeQOf0cOq
 0MoBi1S/8C/5pvOP0WlDF1qP1x3wAaG3mgesYR7vJStVdLUOfMp92hRqqNPoxN/iBo
 haLCdCu03AxewvFtNfVtgznCxrf2O2rG7Uu/qxNhEhqZ7UTx9TIW8M7NIa/E4GunlL
 n6tL3q1UjIGbA==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: kholk11)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id A4FA237820EE;
 Tue,  2 Apr 2024 10:10:18 +0000 (UTC)
Message-ID: <e3746b1b-fe23-4205-a5f4-2fb8ff6a9fe7@collabora.com>
Date: Tue, 2 Apr 2024 12:10:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/mediatek: Init `ddp_comp` with devm_kcalloc()
To: Douglas Anderson <dianders@chromium.org>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: CK Hu <ck.hu@mediatek.com>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@gmail.com>, "Jason-JH.Lin"
 <jason-jh.lin@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 Nathan Lu <nathan.lu@mediatek.com>, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org
References: <20240328092248.1.I2e73c38c0f264ee2fa4a09cdd83994e37ba9f541@changeid>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20240328092248.1.I2e73c38c0f264ee2fa4a09cdd83994e37ba9f541@changeid>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Il 28/03/24 17:22, Douglas Anderson ha scritto:
> In the case where `conn_routes` is true we allocate an extra slot in
> the `ddp_comp` array but mtk_drm_crtc_create() never seemed to
> initialize it in the test case I ran. For me, this caused a later
> crash when we looped through the array in mtk_drm_crtc_mode_valid().
> This showed up for me when I booted with `slub_debug=FZPUA` which
> poisons the memory initially. Without `slub_debug` I couldn't
> reproduce, presumably because the later code handles the value being
> NULL and in most cases (not guaranteed in all cases) the memory the
> allocator returned started out as 0.
> 
> It really doesn't hurt to initialize the array with devm_kcalloc()
> since the array is small and the overhead of initting a handful of
> elements to 0 is small. In general initting memory to zero is a safer
> practice and usually it's suggested to only use the non-initting alloc
> functions if you really need to.
> 
> Let's switch the function to use an allocation function that zeros the
> memory. For me, this avoids the crash.
> 
> Fixes: 01389b324c97 ("drm/mediatek: Add connector dynamic selection capability")
> Signed-off-by: Douglas Anderson <dianders@chromium.org>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

P.S.: I really dislike the dynamic selection stuff, as that's only a partial
solution for something that should've been in DT from day 1 instead.
P.P.S.: I took care of that already - a series is about to come in a few days.

Cheers,
Angelo

