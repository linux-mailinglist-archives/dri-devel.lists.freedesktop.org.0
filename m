Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 68DADCAC3F7
	for <lists+dri-devel@lfdr.de>; Mon, 08 Dec 2025 07:59:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 66D6910E0E3;
	Mon,  8 Dec 2025 06:58:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=stgolabs.net header.i=@stgolabs.net header.b="eLZsg5dA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 1493 seconds by postgrey-1.36 at gabe;
 Mon, 08 Dec 2025 01:05:03 UTC
Received: from zebra.cherry.relay.mailchannels.net
 (zebra.cherry.relay.mailchannels.net [23.83.223.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 64A6210E04D
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Dec 2025 01:05:03 +0000 (UTC)
X-Sender-Id: dreamhost|x-authsender|dave@stgolabs.net
Received: from relay.mailchannels.net (localhost [127.0.0.1])
 by relay.mailchannels.net (Postfix) with ESMTP id 7E88B580F4C;
 Mon, 08 Dec 2025 00:40:09 +0000 (UTC)
Received: from pdx1-sub0-mail-a209.dreamhost.com
 (trex-green-4.trex.outbound.svc.cluster.local [100.99.173.173])
 (Authenticated sender: dreamhost)
 by relay.mailchannels.net (Postfix) with ESMTPA id D966B580E82;
 Mon, 08 Dec 2025 00:40:08 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; d=mailchannels.net; s=arc-2022; cv=none;
 t=1765154408;
 b=6HXSzrKXOmX3+0JU70WnKnCWJA4qeQVooHgLKXvAKYGqbyqppaG27x/xX8+bBC7c2XKZwp
 osJ/mlgO484d4QkXWawlP6wkZHW9vS2rtyBrW3ZvS92jYhO/8F9asARbsOH7ulBl3wiaMG
 u9EpEeI1LQ3mj5HVTHeUvcSPubfU/tpb3YmV+ux/Gtj+QYdeR81Sh0Jz1IsiCymfDBKH+5
 ynR0R6uTLc/2ozfYYtQHaEdeOw87jjTbKhRMgTRrKBpWRdy0CYDumvyJDnrJHHbB+E2+Vf
 Ayp9O+M4Wa6Mg9iDx3x17e86ca2G9JVwtQRk33/K13mW68Uzbtdbse7ilxTc5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mailchannels.net; s=arc-2022; t=1765154408;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references:dkim-signature;
 bh=qvyHVsSPFnZxnI1zKix3c7Zwa7r34V8O2M8XCXUtr8c=;
 b=D+q6KNl69rlMjRROIBEtcbjfoP+8/EAyK+TRltISUuza4PNChcOuXGKRnu1W6x3fvnQGMN
 xd+Mtr1JNuZZhw+MUIybDc920xNI8UeElKYeYVOV+qVEeFxSe1GUEABGQzlB9ZmUsvDOGB
 u0tzCEHH98wAXEGy8PBhFqhg0keHQ2ivATaHmzVjSGMtSbWsPhlJEojzE6eYnKTpZdbLoa
 YRmVADhn+3uoPUfhCTlivkTudf6jNCKgiIrHJaiRuJPFC7mwkpcxhZw1vjbK6N0upyWkxS
 os50pnoXG4Mmqm6OebPowJQ1z7XVY7wXgGLxpL20N17IYG0NkQY69+YIYoh/ZQ==
ARC-Authentication-Results: i=1; rspamd-858948c46c-s7g5t;
 auth=pass smtp.auth=dreamhost smtp.mailfrom=dave@stgolabs.net
X-Sender-Id: dreamhost|x-authsender|dave@stgolabs.net
X-MC-Relay: Neutral
X-MailChannels-SenderId: dreamhost|x-authsender|dave@stgolabs.net
X-MailChannels-Auth-Id: dreamhost
X-Celery-Suffer: 26de2ed2215a5864_1765154409224_3119032078
X-MC-Loop-Signature: 1765154409224:3925006635
X-MC-Ingress-Time: 1765154409223
Received: from pdx1-sub0-mail-a209.dreamhost.com (pop.dreamhost.com
 [64.90.62.162]) (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384)
 by 100.99.173.173 (trex/7.1.3); Mon, 08 Dec 2025 00:40:09 +0000
Received: from offworld (unknown [125.130.54.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 (Authenticated sender: dave@stgolabs.net)
 by pdx1-sub0-mail-a209.dreamhost.com (Postfix) with ESMTPSA id 4dPjn26V6Rz16; 
 Sun,  7 Dec 2025 16:40:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stgolabs.net;
 s=dreamhost; t=1765154408;
 bh=qvyHVsSPFnZxnI1zKix3c7Zwa7r34V8O2M8XCXUtr8c=;
 h=Date:From:To:Cc:Subject:Content-Type;
 b=eLZsg5dAje62uIOMtILxtPshwimwMnju8VCpq4mpxlJiCUc3KdL7xp/OBXhmr9xbu
 NczIOQcjFnV1Uh34qXEUGMv/bliHN6qonNZyM6wlBdVuW7So7BG9x1iZbi8gZFtYaW
 W6tdcaZSf+4lSsgB440mgBpFEBDhCCSFzeWHBi5WT1hnM4OfdsMhAzLpZ2hYczwT2I
 3P3uFTiQ8GUkvsjm0Nl9CWaWJ9266xWgiw9kgJRTS0LCrv+CPdG5grfKmBYzITwn6J
 4kGJezQYLW1q6ugzdsTc3sMWpx8x8k9oE9NuYrpitYUaHhzh6aznKC0+TEr4VfiCtJ
 OwK940fUgvdeQ==
Date: Sun, 7 Dec 2025 16:40:02 -0800
From: Davidlohr Bueso <dave@stgolabs.net>
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] gpu/drm: Use local kmap in drm_clflush_page()
Message-ID: <20251208004002.wgjjpbkf3ch3h4xb@offworld>
References: <20251117153057.1800631-1-dave@stgolabs.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20251117153057.1800631-1-dave@stgolabs.net>
User-Agent: NeoMutt/20220429
X-Mailman-Approved-At: Mon, 08 Dec 2025 06:58:56 +0000
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

ping?

On Mon, 17 Nov 2025, Davidlohr Bueso wrote:

>Replace the now deprecated kmap_atomic() with kmap_local_page().
>
>Optimize for the non-highmem cases and avoid disabling preemption and
>pagefaults as clflushopt does not require being CPU locality guarantees
>and the mapping will hold valid across context switches. Further, highmem
>is planned to to be removed[1].
>
>[1] https://lore.kernel.org/all/4ff89b72-03ff-4447-9d21-dd6a5fe1550f@app.fastmail.com/
>Signed-off-by: Davidlohr Bueso <dave@stgolabs.net>
>---
> drivers/gpu/drm/drm_cache.c | 4 ++--
> 1 file changed, 2 insertions(+), 2 deletions(-)
>
>diff --git a/drivers/gpu/drm/drm_cache.c b/drivers/gpu/drm/drm_cache.c
>index ea1d2d5d2c66..b6a309f827f8 100644
>--- a/drivers/gpu/drm/drm_cache.c
>+++ b/drivers/gpu/drm/drm_cache.c
>@@ -57,10 +57,10 @@ drm_clflush_page(struct page *page)
> 	if (unlikely(page == NULL))
> 		return;
>
>-	page_virtual = kmap_atomic(page);
>+	page_virtual = kmap_local_page(page);
> 	for (i = 0; i < PAGE_SIZE; i += size)
> 		clflushopt(page_virtual + i);
>-	kunmap_atomic(page_virtual);
>+	kunmap_local(page_virtual);
> }
>
> static void drm_cache_flush_clflush(struct page *pages[],
>-- 
>2.39.5
>
