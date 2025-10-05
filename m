Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E0C9BB9CE0
	for <lists+dri-devel@lfdr.de>; Sun, 05 Oct 2025 22:22:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 54D7C89F1B;
	Sun,  5 Oct 2025 20:22:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=antispam.mailspamprotection.com header.i=@antispam.mailspamprotection.com header.b="ZYyW2gQk";
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=valla.it header.i=@valla.it header.b="aCxm8IDv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from delivery.antispam.mailspamprotection.com
 (delivery.antispam.mailspamprotection.com [185.56.87.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 74DC089580
 for <dri-devel@lists.freedesktop.org>; Sun,  5 Oct 2025 20:22:12 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256;
 d=outgoing.instance-europe-west4-g56w.prod.antispam.mailspamprotection.com;
 s=arckey; t=1759695732; 
 b=Ba4Tpch9h7qA1WFuYRGndpFsKXO7QNxFy8U2ctrFiqAoOQq1Px3pQwhA3oRk5gyhkOq3lcRjZw
 g5jwWmr7uhNDlwxay1Q4PLhGvUYI91tLPir2EDw0G5R1XmislH+MW9eDEU05a8mmTaQW/3qOEv
 GSjzky0YKIXGECyULTLOOnvBkrtGLO1k4Y9lffoEujRK9dikjrxpUbjwEJFkpP9jesl4DOEm4s
 Qx9VbCkqprc3Z5UgWqfxBHR/iugfmcaHikmXmCApfON+GtFyYoFDa9NaEpxaRQBfO0ZFbNY/g3
 /eGZha5fFO0z3XozxND2QGot3qZym+6q4SqabIiOHouXDA==;
ARC-Authentication-Results: i=1;
 outgoing.instance-europe-west4-g56w.prod.antispam.mailspamprotection.com;
 smtp.remote-ip=35.214.173.214; 
 iprev=pass (214.173.214.35.bc.googleusercontent.com)
 smtp.remote-ip=35.214.173.214; 
 auth=pass (LOGIN) smtp.auth=esm19.siteground.biz;
 dkim=pass header.d=valla.it header.s=default header.a=rsa-sha256;
 arc=none
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed;
 d=outgoing.instance-europe-west4-g56w.prod.antispam.mailspamprotection.com;
 s=arckey; t=1759695732; 
 bh=FXZJZnHFm7AcCELiEKqAF4gqy7DH+gDol0yrbGFFqMA=;
 h=Cc:To:Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:
 Subject:From:DKIM-Signature:DKIM-Signature;
 b=NBaEzqyRO05Kf/+kShm7eViF7k0dkoASvNTeTAoC39b2+YXZIBlJhk3XUaZYefsNIeeOBoOqdt
 BRg1y4ibKJP7vvbrZ0AZW8DKggLEbOIaG/y0Z2QmT3vq1RPr02JWCkbiB1G6YHh2Xgg23Pi2dA
 0U0l9RpCpF1H2XlyHrx4+vX0z1cg4wBmwej/44AJUdj3wcxelDI2bWU5Xt58Fj5eBfXZZOoOVB
 TQh4v+5raNKZQGyOWALYvbTJO/QcoedliOXHKc70Dj7EynYOxPriI4C9Q2PZiHDTinwJPetkNE
 I8Zi4YxwHRBTyQk1J7OK29775D6qeWtMGHoHXb9pitxYsg==;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=antispam.mailspamprotection.com; s=default; h=CFBL-Feedback-ID:CFBL-Address
 :Cc:To:Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:
 Subject:From:Reply-To:List-Unsubscribe;
 bh=zSVYyYOYyhfyYwoqIZwjause6u3NI8YS2rCw9RIrS0k=; b=ZYyW2gQkfjIA6H8VndJMeVu0J1
 6T7cz4M8aOTTaE8uQ9A7/OkHhq+wgSwwxhRzRbd66otfdTEuSFQGYcbqw/H2L98HC5peSz44p7/YZ
 o3yNd8ae0pIky1kM/nhryr1wFnPtLgtPjYygT3HH2xwIeL2Ex1rlvEqVlcraoLesShbU=;
Received: from 214.173.214.35.bc.googleusercontent.com ([35.214.173.214]
 helo=esm19.siteground.biz)
 by instance-europe-west4-g56w.prod.antispam.mailspamprotection.com with
 esmtpsa (TLS1.3) tls TLS_AES_256_GCM_SHA384 (Exim 4.98.1)
 (envelope-from <francesco@valla.it>) id 1v5VF9-00000003Jyt-46NX
 for dri-devel@lists.freedesktop.org; Sun, 05 Oct 2025 20:22:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=valla.it;
 s=default; h=Cc:To:Date:Subject:From:list-help:list-unsubscribe:
 list-subscribe:list-post:list-owner:list-archive;
 bh=zSVYyYOYyhfyYwoqIZwjause6u3NI8YS2rCw9RIrS0k=; b=aCxm8IDvaUEG7mhEdRVuHDaZRx
 hPJNPCAJT8RMaKw0j2SPj/0MkPToRFxiBdI9QzFR+CkTLsJgUDq8V770b94WfuOkUwrZWUciuWnRh
 xtkhzniAi2uSUnlkwAEjuZ/DqsvjMDINarSR7Va5OBayVsJhA1XXbHR61ZUMZPO+88gk=;
Received: from [87.16.13.60] (port=64461 helo=fedora.fritz.box)
 by esm19.siteground.biz with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
 (Exim 4.98.1) (envelope-from <francesco@valla.it>)
 id 1v5VEu-000000001im-02Nc; Sun, 05 Oct 2025 20:21:52 +0000
From: Francesco Valla <francesco@valla.it>
Subject: [PATCH 0/3] drm/draw: add check API to avoid spurious WARN
Date: Sun, 05 Oct 2025 22:21:33 +0200
Message-Id: <20251005-drm_draw_conv_check-v1-0-9c814d9362f6@valla.it>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAE3T4mgC/x3M0QpAQBBA0V/RPNsatIlfkTZmB5MszRZK/t3m8
 Tzc+0BkFY7QZg8onxJlDwlFngEtQ5jZiE+GEktbIFbG6+a8DpejPZyOFqbVNEQVWuTR2xpSeSh
 Pcv/Xrn/fD1Vs9yJlAAAA
X-Change-ID: 20251003-drm_draw_conv_check-9cc3050ebd57
To: Jocelyn Falempe <jfalempe@redhat.com>, 
 Javier Martinez Canillas <javierm@redhat.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Francesco Valla <francesco@valla.it>
X-Mailer: b4 0.14.2
X-AntiAbuse: This header was added to track abuse,
 please include it with any abuse report
X-AntiAbuse: Primary Hostname - esm19.siteground.biz
X-AntiAbuse: Original Domain - lists.freedesktop.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - valla.it
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-SGantispam-id: 55ea3c5b63772e344251e8a0dc3e95a8
AntiSpam-DLS: false
AntiSpam-DLSP: 
AntiSpam-DLSRS: 
AntiSpam-TS: 1.0
CFBL-Address: feedback@antispam.mailspamprotection.com; report=arf
CFBL-Feedback-ID: 1v5VF9-00000003Jyt-46NX-feedback@antispam.mailspamprotection.com
Authentication-Results: outgoing.instance-europe-west4-g56w.prod.antispam.mailspamprotection.com; 
 iprev=pass (214.173.214.35.bc.googleusercontent.com)
 smtp.remote-ip=35.214.173.214; 
 auth=pass (LOGIN) smtp.auth=esm19.siteground.biz;
 dkim=pass header.d=valla.it header.s=default header.a=rsa-sha256;
 arc=none
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

When using the DRM draw support, the only way to check if a color can be
converted from XRGB8888 to a target format is currently to attempt an
actual conversion using drm_draw_color_from_xrgb8888(). This function
however will print a WARN the first time a conversion cannot be
performed, leading to two potential issues:

 - a WARN is emitted without a real reason if the caller is only
   attempting a conversion to check if a format can be supported (which
   is the case for two of the current user of this API);
 - a failing call following the first one is not emitting a WARN, but a
   "valid" color value (0x00000000) is returned nevertheless.

The first issue was observed while using drm_log on a Beagleplay, which
lists AR12 as the first format for its HDMI modesets.

The target of this patch set is to improve this situation; the first
patch introduces a new API devoted only to check if a conversion from
XRGB8888 to the specified format can be performed, while the other two
substitute drm_draw_color_from_xrgb8888() with this new API in the
current users (drm_panic and drm_log) where relevant.

Signed-off-by: Francesco Valla <francesco@valla.it>
---
Francesco Valla (3):
      drm/draw: add drm_draw_can_convert_from_xrgb8888
      drm/log: avoid WARN when searching for usable format
      drm/log: avoid WARN when checking format support

 drivers/gpu/drm/clients/drm_log.c   |  2 +-
 drivers/gpu/drm/drm_draw.c          | 84 +++++++++++++++++++++++++++----------
 drivers/gpu/drm/drm_draw_internal.h |  2 +
 drivers/gpu/drm/drm_panic.c         |  2 +-
 4 files changed, 65 insertions(+), 25 deletions(-)
---
base-commit: 7a405dbb0f036f8d1713ab9e7df0cd3137987b07
change-id: 20251003-drm_draw_conv_check-9cc3050ebd57

Best regards,
-- 
Francesco Valla <francesco@valla.it>

