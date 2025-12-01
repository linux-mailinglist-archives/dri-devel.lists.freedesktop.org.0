Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 22E72C98348
	for <lists+dri-devel@lfdr.de>; Mon, 01 Dec 2025 17:16:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D36ED10E088;
	Mon,  1 Dec 2025 16:16:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Lt7eAstP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 80AEC10E088
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Dec 2025 16:16:26 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id A0DF46016B;
 Mon,  1 Dec 2025 16:16:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CA596C4CEF1;
 Mon,  1 Dec 2025 16:16:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1764605785;
 bh=jbDD+wSsL3QQpBOs8+TyGTak0H4rmonOZGSkap9RdyU=;
 h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
 b=Lt7eAstPQbS6xb37yExeyHfhp+lK0KhoTPbLWndI5IRha7Q8z0ntIZg5E45dN+CZL
 iyC/oiTrAEotKiJcfO9k5BHAMbf6OMf8b+eupzflbA7vtM89n1b/o+zIrEYlxqXywD
 DvOttvYKva1pwJZyUvOMk7siU7IjBLeRTKjeLAuRNh4Y9GFSd08iN1FCKHtxr8Vm3x
 H9s4SHTH9K8AHiRwmB+h5SngnOggkPZWlY12/5UBdI7f1Ouum/XGublIrr0TDPmLbv
 vkTwL2CZsQM32DxvptzPCSq+JZJsdEYSfuBXauLt1177D7zoTSRGBWXBY5rKr7J4TK
 aFl9ne9ez3ZMw==
Message-ID: <a1cd8e33e8cb3f21fb8a8b2d9543be4e@kernel.org>
Date: Mon, 01 Dec 2025 16:16:22 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Linus Walleij" <linusw@kernel.org>
Subject: Re: [PATCH v5 3/3] drm/rcar-du: Modify custom commit tail
In-Reply-To: <20251130-mcde-drm-regression-thirdfix-v5-3-aed71a32981d@kernel.org>
References: <20251130-mcde-drm-regression-thirdfix-v5-3-aed71a32981d@kernel.org>
Cc: dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
 "Aradhya
 Bhatia" <a-bhatia1@ti.com>, "David Airlie" <airlied@gmail.com>, "Dmitry
 Baryshkov" <lumag@kernel.org>, "Geert Uytterhoeven" <geert+renesas@glider.be>,
 "Geert Uytterhoeven" <geert@linux-m68k.org>,
 "Kieran Bingham" <kieran.bingham+renesas@ideasonboard.com>, "Laurent
 Pinchart" <laurent.pinchart+renesas@ideasonboard.com>,
 "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>, "Magnus
 Damm" <magnus.damm@gmail.com>, "Marek Vasut" <marek.vasut+renesas@mailbox.org>,
 "Maxime
 Ripard" <mripard@kernel.org>, "Simona Vetter" <simona@ffwll.ch>, "Thomas
 Zimmermann" <tzimmermann@suse.de>,
 "Tomi Valkeinen" <tomi.valkeinen+renesas@ideasonboard.com>, "Tomi
 Valkeinen" <tomi.valkeinen@ideasonboard.com>
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

On Sun, 30 Nov 2025 13:11:19 +0100, Linus Walleij wrote:
> commit c9b1150a68d9362a0827609fc0dc1664c0d8bfe1
> "drm/atomic-helper: Re-order bridge chain pre-enable and post-disable"
> caused regressions in all bridges that e.g. send DSI commands in
> their .prepare() and .unprepare() callbacks when used with R-Car DU.
> 
> 
> [ ... ]

Reviewed-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime
