Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E02A2B0A05A
	for <lists+dri-devel@lfdr.de>; Fri, 18 Jul 2025 12:08:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E1C710E33D;
	Fri, 18 Jul 2025 10:08:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="IGV1q4da";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 228CF10E33D
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Jul 2025 10:08:40 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 3DC8A5C631F;
 Fri, 18 Jul 2025 10:08:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 97FEBC4CEEB;
 Fri, 18 Jul 2025 10:08:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1752833318;
 bh=IqkcBZjildqfrYXTo8sxxwqovOo/lC+C2lAL0ChmSZY=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=IGV1q4da+2GQSwVGGR0gJYtMsgumakE8a/yzQ4ZDvybxYo4OiwyAtDhni7mlzNsoi
 8lbZlmmpxTTlbxUtpbVwzOos5RrWiuuPSaFEuJjq/3kJtGGU6EsEFWLTHcV2X66EMf
 g5SQYFaBMf6qqcJb5I/7vTMWERvdFpBtQS8m8JknCk1qRiJXeLLJYNUsw7utUAgPnu
 zlRQA5fdyMwtHjqcUH0qDs4ZTZW0ZH/P/fxa0MnSLgR9BxbqrNw0wybqLBivyuxV9U
 mItwG8pVGYE4YOuIgy+Ejqnk1oml1Dy1MnGYRjb22Ta3gaj9P3LyDtPJrEy3lTmuV7
 q6VDTA/gFQdog==
MIME-Version: 1.0
Date: Fri, 18 Jul 2025 12:08:34 +0200
From: Michael Walle <mwalle@kernel.org>
To: Jayesh Choudhary <j-choudhary@ti.com>
Cc: jyri.sarha@iki.fi, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, dri-devel@lists.freedesktop.org,
 devarsht@ti.com, tomi.valkeinen@ideasonboard.com, airlied@gmail.com,
 simona@ffwll.ch, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 0/3] Decouple max_pclk check from constant display feats
In-Reply-To: <20250704094851.182131-1-j-choudhary@ti.com>
References: <20250704094851.182131-1-j-choudhary@ti.com>
Message-ID: <c638ebecd9b01df5779d3f8931c2bf17@kernel.org>
X-Sender: mwalle@kernel.org
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
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

> In an effort to make the existing compatibles more usable, we are
> removing the max_pclk_khz form dispc_features structure and doing the
> correspondig checks using "curr_max_pclk[]".
> 
> Changes are fully backwards compatible.
> 
> After integration of OLDI support[0], we need additional patches in
> oldi to identify the VP that has OLDI. We have to do this since
> OLDI driver owns the VP clock (its serial clock) and we cannot perform
> clock operations on those VP clock from tidss driver. This issue was
> also reported upstream when DSI fixes[1] had some clock related calls
> in tidss driver. When "clk_round_rate()" is called, ideally it should
> have gone to "sci_clk_determine_rate()" to query DM but it doesn't 
> since
> clock is owned by OLDI not tidss.
> 
> So add a member is_oldi_vp[] in tidss_device structure to identify this
> and avoid performing clock operations for VP if it has OLDI panel.
> For the same checks in OLDI driver, atomic_check() hook is added to its
> bridge_funcs.
> In the atomic_check() chain, first the bridge_atomic_check() is called
> and then crtc_atomic_check() is called. So mode clock is first checked
> in oldi driver and then skipped in tidss driver.
> 
> Had the tidss_oldi structure been exposed to tidss_dispc.c, we could
> have directly checked VP type in dispc but since the structure is 
> defined
> in tidss_oldi.c , we have to add additional member to tidss_device
> structure.
> 
> [0]: 
> https://lore.kernel.org/all/20250528122544.817829-1-aradhya.bhatia@linux.dev/
> [1]: https://lore.kernel.org/all/DA6TT575Z82D.3MPK8HG5GRL8U@kernel.org/

For this series:
Tested-by: Michael Walle <mwalle@kernel.org> # on am67a

-michael
