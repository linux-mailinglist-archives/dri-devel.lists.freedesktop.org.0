Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 53FFFCF3346
	for <lists+dri-devel@lfdr.de>; Mon, 05 Jan 2026 12:20:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9FEBD10E257;
	Mon,  5 Jan 2026 11:20:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="aXC4ZQt/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D4BCD10E257
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Jan 2026 11:20:40 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 324E11A2657;
 Mon,  5 Jan 2026 11:20:39 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id EDAFE60726;
 Mon,  5 Jan 2026 11:20:38 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 0F7AD103C84F6; Mon,  5 Jan 2026 12:20:31 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1767612038; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=xHfSjWqxfxYko+txDt328icuQQjBRyghGWUrAKeMZGE=;
 b=aXC4ZQt/tBGsEBvst0PIkyYqOv3hYJstIf/OF8pstvJqyA0Y4aula3YQ0sHilDNmEf/ipm
 /IEBWpQ/gs3V/5bs88HH9Lmsrz/tWplLbOfp8r4GggLJ3/XL18wIi+xSkr9XuFsK6nXYgG
 762gW/GIPU+fBfEzSZHbhq/NALxbI6iYmZz7bBV3EFfn1oQSL49OLDuX6J61SZOyHFzBGW
 cFnOZclhfSbTm0/d0qvxDXzHlTxXoaQ1fH+lRTmN/tZcur9Cy9URVtPFvQyWLyT2muTNqd
 xetmz2PV/PctmCclnzH+p9q4hennbiLcYDIa34tL1Ro6ousggUuYLSGa6u3fGA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 05 Jan 2026 12:20:30 +0100
Message-Id: <DFGM64QKX8QF.28OD6W8F3JEJ8@bootlin.com>
Subject: Re: [PATCH v3] drm/bridge: synopsys: dw-dp: fix error paths of
 dw_dp_bind
Cc: <stable@vger.kernel.org>, "Andrzej Hajda" <andrzej.hajda@intel.com>,
 "Neil Armstrong" <neil.armstrong@linaro.org>, "Robert Foss"
 <rfoss@kernel.org>, "Laurent Pinchart" <Laurent.pinchart@ideasonboard.com>,
 "Jonas Karlman" <jonas@kwiboo.se>, "Jernej Skrabec"
 <jernej.skrabec@gmail.com>, "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>, "Maxime Ripard" <mripard@kernel.org>,
 "Thomas Zimmermann" <tzimmermann@suse.de>, "David Airlie"
 <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Dmitry Baryshkov"
 <dmitry.baryshkov@oss.qualcomm.com>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>
To: "Osama Abdelkader" <osama.abdelkader@gmail.com>, "Andy Yan"
 <andy.yan@rock-chips.com>
From: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
X-Mailer: aerc 0.20.1
References: <20260102155553.13243-1-osama.abdelkader@gmail.com>
In-Reply-To: <20260102155553.13243-1-osama.abdelkader@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
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

Hello Osama,

On Fri Jan 2, 2026 at 4:55 PM CET, Osama Abdelkader wrote:
> Fix several issues in dw_dp_bind() error handling:
>
> 1. Missing return after drm_bridge_attach() failure - the function
>    continued execution instead of returning an error.
>
> 2. Resource leak: drm_dp_aux_register() is not a devm function, so
>    drm_dp_aux_unregister() must be called on all error paths after
>    aux registration succeeds. This affects errors from:
>    - drm_bridge_attach()
>    - phy_init()
>    - devm_add_action_or_reset()
>    - platform_get_irq()
>    - devm_request_threaded_irq()
>
> 3. Bug fix: platform_get_irq() returns the IRQ number or a negative
>    error code, but the error path was returning ERR_PTR(ret) instead
>    of ERR_PTR(dp->irq).
>
> Use a goto label for cleanup to ensure consistent error handling.
>
> Fixes: 86eecc3a9c2e ("drm/bridge: synopsys: Add DW DPTX Controller suppor=
t library")
> Cc: stable@vger.kernel.org
>
> Signed-off-by: Osama Abdelkader <osama.abdelkader@gmail.com>

Thank you for the improvements!

Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

Luca

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
