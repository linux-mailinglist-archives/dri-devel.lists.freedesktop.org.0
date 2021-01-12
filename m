Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7572C2F2A32
	for <lists+dri-devel@lfdr.de>; Tue, 12 Jan 2021 09:44:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 38EB76E134;
	Tue, 12 Jan 2021 08:44:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 454556E133
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Jan 2021 08:44:09 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id k10so1134551wmi.3
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Jan 2021 00:44:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Xcgw/t3d5EmCEa0HjTO2HXlIf1q5mVwYK1d6MdDJUzs=;
 b=KcINr+4iX6P0n85bnjToTdFgB3oThsNSTw7GUjO5Ar/FbtKOR+/DxjoaKds4ern7u8
 nfKneDw7u+sBBIVa/Qj8ClpW30/lCdnEpE2L4pLZKHrLzBHE9iJ9jj3MO5bZm6PAtEg0
 Xgc+ATEKmHHO5cRiDQvTPDyL9Yj1nadIniZ2g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Xcgw/t3d5EmCEa0HjTO2HXlIf1q5mVwYK1d6MdDJUzs=;
 b=YpvXo8yhQLXfJDKhXwaS6f3SLhkIYQIONWTJvqWezFZew11Sgg2LpJjARxe/qiNUrC
 c8mDe6tI8bfdlvuL7RDhWbVtABfBYTc1A1TnixySjpKe/RXtyYQlFBf+yY/ZNGaHoHZN
 vNznl0I121DCE1dOn6N2jtEzr5FoIvxSf00N1RVIy99kKtsWFwF6/7QTCnDkcqRP1gNA
 Q0t7U4yxC6DIZ0o50lsyyXfzXGWUOkSySbFiiRd4GBluQYojGJ1j6MginGDRyvZ08gdy
 zlkduBUFiAjXIOHzX3wsSH9jNQsHD46/eTGAcrzRcIEgSXG8pdSwO1/l8/lDCYMqKnF7
 2b9g==
X-Gm-Message-State: AOAM532qxHfN/wGbzZN+GurxGUXSWIW5l4R/RfNCFs+BmuapGeEOQYE4
 KKE2b2mBimILy9aH5Wfvf9nQ5t2oJxFBN4c7
X-Google-Smtp-Source: ABdhPJz/dBubb8ek5XbBRCzBml18iEGVBoperExsEDa1bY1iBYew9Oj0ZUVb+1kTCFJ/WdX/IOjaUw==
X-Received: by 2002:a1c:2783:: with SMTP id n125mr2428267wmn.74.1610441047846; 
 Tue, 12 Jan 2021 00:44:07 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id j15sm3707017wrr.85.2021.01.12.00.44.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Jan 2021 00:44:07 -0800 (PST)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH 03/15] drm/arc: Delete arcpgu_priv->fb
Date: Tue, 12 Jan 2021 09:43:46 +0100
Message-Id: <20210112084358.2771527-3-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210112084358.2771527-1-daniel.vetter@ffwll.ch>
References: <20210112084358.2771527-1-daniel.vetter@ffwll.ch>
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
Cc: tiantao6@hisilicon.com, Alexey Brodkin <abrodkin@synopsys.com>,
 Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Leftover from the conversion to the generic fbdev emulation.

Cc: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>
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
2.29.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
