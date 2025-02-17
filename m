Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BA96A3843C
	for <lists+dri-devel@lfdr.de>; Mon, 17 Feb 2025 14:14:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F1ED10E0B9;
	Mon, 17 Feb 2025 13:14:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="U/0oSzGg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 84C4610E0B9
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Feb 2025 13:14:54 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 4EBF85C563C;
 Mon, 17 Feb 2025 13:14:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 61A3FC4CED1;
 Mon, 17 Feb 2025 13:14:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1739798093;
 bh=13SPp22CZVN6xo7eWbjLFTp4tb5+gOXnGjqBpfPpjO4=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=U/0oSzGgoTnI9k06MhPJaHbBvs2FoX445vtnucfIyVQbPLR/+GhQis54mxIHZ/rOx
 YWeY/JHgHAxM2ByitJ5DML0s04ByPBxMVo5M7Dr+rgrYJOXBHeoTP6aIMg0GZe3Rud
 wYhNYQ2jAGAjfRxcOrJryrFUNfBHVw+neugbJV5sJpNlxLHVonm143OABc+JcbJFOa
 +SEQDUnmoSyo7oDoqU3xN9s9e5sCeZt7fteyeKjHoX+NuSa6Iw4bnixQayBGdMLXVL
 SpPcauyMFgJ9sbPLtLMmlmMcK+98RImLjxSdL8RNfjBD7dFTToIF9Xm0aVEKlZhpXg
 dkJfaPwQBe+kw==
From: Robert Foss <rfoss@kernel.org>
To: Andrzej Hajda <andrzej.hajda@intel.com>, Vitalii Mordan <mordan@ispras.ru>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Sui Jingfeng <sui.jingfeng@linux.dev>, 
 Aleksandr Mishin <amishin@t-argos.ru>, Al Viro <viro@zeniv.linux.org.uk>, 
 Tomi Valkeinen <tomi.valkeinen@ti.com>, Jyri Sarha <jsarha@ti.com>, 
 Quentin Schulz <quentin.schulz@free-electrons.com>, 
 Swapnil Jakhade <sjakhade@cadence.com>, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, Fedor Pchelkin <pchelkin@ispras.ru>, 
 Alexey Khoroshilov <khoroshilov@ispras.ru>, 
 Vadim Mutilin <mutilin@ispras.ru>, lvc-project@linuxtesting.org
In-Reply-To: <20250214154632.1907425-1-mordan@ispras.ru>
References: <20250214154632.1907425-1-mordan@ispras.ru>
Subject: Re: [PATCH v3] gpu: cdns-mhdp8546: fix call balance of mhdp->clk
 handling routines
Message-Id: <173979808601.704013.18168573749410463976.b4-ty@kernel.org>
Date: Mon, 17 Feb 2025 14:14:46 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
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

On Fri, 14 Feb 2025 18:46:32 +0300, Vitalii Mordan wrote:
> If the clock mhdp->clk was not enabled in cdns_mhdp_probe(), it should not
> be disabled in any path.
> 
> The return value of clk_prepare_enable() is not checked. If mhdp->clk was
> not enabled, it may be disabled in the error path of cdns_mhdp_probe()
> (e.g., if cdns_mhdp_load_firmware() fails) or in cdns_mhdp_remove() after
> a successful cdns_mhdp_probe() call.
> 
> [...]

Applied, thanks!

[1/1] gpu: cdns-mhdp8546: fix call balance of mhdp->clk handling routines
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/f65727be3fa5



Rob


