Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B4EF4CCC541
	for <lists+dri-devel@lfdr.de>; Thu, 18 Dec 2025 15:46:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F096B10E14E;
	Thu, 18 Dec 2025 14:46:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="hNcJnGe8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A0A210E14E
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Dec 2025 14:46:21 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id D66181A22D1;
 Thu, 18 Dec 2025 14:46:19 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 9E1A6606B6;
 Thu, 18 Dec 2025 14:46:19 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id C4CBF102F0B4F; Thu, 18 Dec 2025 15:46:10 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1766069174; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=LY4nFPiOTkGww0ISgcKF6HSfdVYUtoR3hd0EwFScy1k=;
 b=hNcJnGe8TulQ23mUQr3WbbFPlKC5EDvNAgRcZijZy+tyGsTWp+wRWl8E4jXM7B1IQL7cvn
 G6YZ4ZMa2l0YCwXVjKALw7u2UKOPnE1uVqdjlEDn4H2w2ZqDM/F8D8MCeWSib7ksE9j0b4
 bZ6nmrdb4QIQmbi7OuwVzvuXiLPz9/6IoIG/zI7pEJAGyVLe82j8ObP5zrfHK/7elNAL2D
 KFldh5lezJs7QtQZzT8ZPIXUxLv0FDzhFnn+rFOR4EHizyUfow1SfCCPsdOxquMAR9xxfK
 5IfXqgn9FhEGVP5ygpRd9HY7rQEnyPa0T1LWlRfGAZMKqggzG4JE3Yjt7VtTXQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 18 Dec 2025 15:46:09 +0100
Message-Id: <DF1F9S3FL5XG.1D9IAMJ5FHV4Z@bootlin.com>
To: "Ludovic Desroches" <ludovic.desroches@microchip.com>, "Neil Armstrong"
 <neil.armstrong@linaro.org>, "Jessica Zhang" <jesszhan0024@gmail.com>,
 "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>, "Maxime Ripard"
 <mripard@kernel.org>, "Thomas Zimmermann" <tzimmermann@suse.de>, "David
 Airlie" <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Anusha
 Srivatsa" <asrivats@redhat.com>, "Jessica Zhang"
 <jessica.zhang@oss.qualcomm.com>
From: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
Subject: Re: [PATCH REGRESSION v3] drm/panel: simple: restore connector_type
 fallback
Cc: <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <stable@vger.kernel.org>
X-Mailer: aerc 0.20.1
References: <20251218-lcd_panel_connector_type_fix-v3-1-ddcea6d8d7ef@microchip.com>
In-Reply-To: <20251218-lcd_panel_connector_type_fix-v3-1-ddcea6d8d7ef@microchip.com>
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

On Thu Dec 18, 2025 at 2:34 PM CET, Ludovic Desroches wrote:
> The switch from devm_kzalloc() + drm_panel_init() to
> devm_drm_panel_alloc() introduced a regression.
>
> Several panel descriptors do not set connector_type. For those panels,
> panel_simple_probe() used to compute a connector type (currently DPI as a
> fallback) and pass that value to drm_panel_init(). After the conversion
> to devm_drm_panel_alloc(), the call unconditionally used
> desc->connector_type instead, ignoring the computed fallback and
> potentially passing DRM_MODE_CONNECTOR_Unknown, which
> drm_panel_bridge_add() does not allow.
>
> Move the connector_type validation / fallback logic before the
> devm_drm_panel_alloc() call and pass the computed connector_type to
> devm_drm_panel_alloc(), so panels without an explicit connector_type
> once again get the DPI default.
>
> Signed-off-by: Ludovic Desroches <ludovic.desroches@microchip.com>
> Fixes: de04bb0089a9 ("drm/panel/panel-simple: Use the new allocation in p=
lace of devm_kzalloc()")
> Cc: stable@vger.kernel.org

Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

Side note: this function is very long, it would be nice e.g. to move the
big mistake-checking switch (connector_type) to a function. Of course that
would be a separate series, after this fix is done.

Luca

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
