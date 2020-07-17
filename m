Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E9A632237A5
	for <lists+dri-devel@lfdr.de>; Fri, 17 Jul 2020 11:04:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F9536ED71;
	Fri, 17 Jul 2020 09:04:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F40B96ED69
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Jul 2020 09:04:41 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id z2so10234162wrp.2
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Jul 2020 02:04:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=8/C7LTabyP/9GYGp6X6gUqGdFf5QRFWdf1CwsFIoyY8=;
 b=OqXQyjlL1oq+SIaAXB910RR4gGeJfnmB94W/w7IjbhqqHxOacxm60kxxJj9IjKZ6bN
 RKqOFGFjOVI1YrNjjri3xo16u7XJlyDr0GRPUZvk5fLpvkOFE9Jy8yCwVojHeGOfUgqn
 FSG2nxlPtIYTeCt6bYsJBLEQ25DRPevkV8iX8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=8/C7LTabyP/9GYGp6X6gUqGdFf5QRFWdf1CwsFIoyY8=;
 b=OrREb4PrbYQr5phuGOtMGfD52VtfgRg4F6pJLRNi0ju7r2mizyoOj8a2GxvYuF/fem
 wYjeoPOPDWqcv+A62DWKCWGwECBPA5080u3A9OaTQp0OYCdOWAuCGdEWsNAgXmuYFC+H
 gujixncusMvYwN5ANL+wHlsebjUktXvCYjVxXj+x40JMOzsDDjGsJlAlL3mo9/3zBWLh
 0iblseWv8wnLZ364nOmeQbxmh4shAtLzg0XIUjbeq7sdRH8JhaEYQVuFUY3z4QB3k78i
 YJP/fREH6d4lEfXRV1OmdPGd0FD4W66RmPkUXAWMvN1uOuxm5ZexmgjmovLojsaO+OOX
 DXlA==
X-Gm-Message-State: AOAM530lRY54m5OWZ+X0dixHfPc1cDWtdU/J8VThy0Mjs5Uz8NiAG9eO
 rU2SKzYY9lE6DM+dF4AzFXhlov4YthY=
X-Google-Smtp-Source: ABdhPJyP8YGG5SbmFJ/IqHv2CqNMCgNkB2uSQvgvxoOsT0miCF4pmPRxlt0B0xRNC3w/M2laM7hGTg==
X-Received: by 2002:a5d:5450:: with SMTP id w16mr2023495wrv.155.1594976680174; 
 Fri, 17 Jul 2020 02:04:40 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id l67sm14520833wml.13.2020.07.17.02.04.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Jul 2020 02:04:39 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH 05/18] drm/arc: Delete arcpgu_priv->fb
Date: Fri, 17 Jul 2020 11:04:17 +0200
Message-Id: <20200717090430.1146256-5-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200717090430.1146256-1-daniel.vetter@ffwll.ch>
References: <20200717090430.1146256-1-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Alexey Brodkin <abrodkin@synopsys.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Leftover from the conversion to the generic fbdev emulation.

Signed-off-by: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: Alexey Brodkin <abrodkin@synopsys.com>
---
 drivers/gpu/drm/arc/arcpgu.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/arc/arcpgu.h b/drivers/gpu/drm/arc/arcpgu.h
index 87821c91a00c..ed77dd5dd5cb 100644
--- a/drivers/gpu/drm/arc/arcpgu.h
+++ b/drivers/gpu/drm/arc/arcpgu.h
@@ -12,7 +12,6 @@ struct arcpgu_drm_private {
 	struct drm_device	drm;
 	void __iomem		*regs;
 	struct clk		*clk;
-	struct drm_framebuffer	*fb;
 	struct drm_crtc		crtc;
 	struct drm_plane	*plane;
 };
-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
