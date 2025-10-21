Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 749E7BF5343
	for <lists+dri-devel@lfdr.de>; Tue, 21 Oct 2025 10:17:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A0F0C10E592;
	Tue, 21 Oct 2025 08:17:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="dQENnVoR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6FC2310E591
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Oct 2025 08:17:09 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 4FDEF4E4123E;
 Tue, 21 Oct 2025 08:17:08 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 246B260680;
 Tue, 21 Oct 2025 08:17:08 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 97572102F23E1; 
 Tue, 21 Oct 2025 10:16:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1761034627; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=6hr2CwECSFohFl/UTlSYv2yFtmQZ/yED1TgBrN5owQ8=;
 b=dQENnVoRWrvDEN78ISZ3v91HNEn4dYB9mzJSCpzoDrcbBeDSM1nD4nah+lUBngnsgK3IUm
 59pBmaUzNNM1QpZEi1f80WqFR0nrd6RGmN8f5pK15OoqcJcpB1JsEdWbLdUIGIzD0D2oXz
 cUAgBBZeAJWlt9i09nOj+cU9LbKZ6hfmHcSOPglVimCRzESLio0uzbH1kg+IA8FVPSlsuZ
 rurt8i6eEGTMsUBv9Os7iznd3OHli/CLiKvFq9vTotr4MtYVCZ5xfUGTH2jget2xtM6OrI
 eHZJ2XPAE2IMpwvZx+5esLLWULGUgoTVF+8ib4h1S/sy1sO/O2466zt1/YvS5A==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 21 Oct 2025 10:16:54 +0200
Message-Id: <DDNUO5AZOCHR.20G1B24U6C82R@bootlin.com>
Cc: <dri-devel@lists.freedesktop.org>, "Dmitry Baryshkov"
 <dmitry.baryshkov@oss.qualcomm.com>, "Tomi Valkeinen"
 <tomi.valkeinen@ideasonboard.com>, "dri-devel"
 <dri-devel-bounces@lists.freedesktop.org>
Subject: Re: [PATCH v2 01/16] drm/atomic: Add dev pointer to drm_private_obj
From: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
To: "Maxime Ripard" <mripard@kernel.org>, "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>, "Thomas Zimmermann"
 <tzimmermann@suse.de>, "David Airlie" <airlied@gmail.com>, "Simona Vetter"
 <simona@ffwll.ch>
X-Mailer: aerc 0.20.1
References: <20251014-drm-private-obj-reset-v2-0-6dd60e985e9d@kernel.org>
 <20251014-drm-private-obj-reset-v2-1-6dd60e985e9d@kernel.org>
In-Reply-To: <20251014-drm-private-obj-reset-v2-1-6dd60e985e9d@kernel.org>
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

Hello,

On Tue Oct 14, 2025 at 11:31 AM CEST, Maxime Ripard wrote:
> All the objects that need to implement some callbacks in KMS have a
> pointer in there structure to the main drm_device.
>
> However, it's not the case for drm_private_objs, which makes it harder
> than it needs to be to implement some of its callbacks. Let's add that
> pointer.
>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> Signed-off-by: Maxime Ripard <mripard@kernel.org>

Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Tested-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
