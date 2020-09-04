Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B13EB25DC0B
	for <lists+dri-devel@lfdr.de>; Fri,  4 Sep 2020 16:40:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9BD1C6EC20;
	Fri,  4 Sep 2020 14:40:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F89A6EC19
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Sep 2020 14:40:07 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id c19so7660750wmd.1
 for <dri-devel@lists.freedesktop.org>; Fri, 04 Sep 2020 07:40:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=FuRI0Mh9qTrbpGFtaTRcx/6NFU2nISTNkH+iqCeYwJg=;
 b=YY6hV7NOdNhttFR9tP2o2MbKwVFq1C0vEjTJ9jNBhOEj+/4qMsZg9lKx9VNNs0aIuO
 yIsQc/dX82Jolbe6JurIsjkp6693P7z+31DB9ZPCQHSTv70nTa9JzpIo2i7Z4+XgYH1e
 D9VihatzOIdJyDnr7Xnv+Ykb7NgJx7PMXiVwo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=FuRI0Mh9qTrbpGFtaTRcx/6NFU2nISTNkH+iqCeYwJg=;
 b=QqArPVi4I2GYgzQMclrOpKpLUbQcSQ0VYVzWCgq3IKF7UwY8HBuCiGCor+4fl4c5Bg
 MfI495bZYA2zcL4aOMizvWmD+TpRJXWq32Pgy3F1jMOlwbXbDozNv1jCT4pmQFR1Q/Pw
 lZken34ZSe+c15un+vNwovW4qr0L5SvJE9D0Hv2lz4dL9RJ1ewzaSNVTiv2WvcYS7Ef/
 g98ku1G/ODF2uVD0zMx591fbP33ttR616QZVBSFBa5QiK5aqsizxw2szPJ2Usig8/d+H
 dYvD14V4dyMknD51n+kqsCuppdmNGKti/8/G32d1RF80zbAjkjC/ihdtHVJbfhJaPbw+
 On0w==
X-Gm-Message-State: AOAM530wYHKELqzH5SrN+pW43lUrvR9iUjZHyHboSOerjt88YmPrLZrD
 kC9waVspWpo1eMqcceFl4ZoDg1Q7nVrelpNq
X-Google-Smtp-Source: ABdhPJwMuCX23dKqFCcr5sRS/ER7/pNqZ2SczB+GuX8l3ZN5oPgRNiXcrfm0OZGQRw+gfxZaDn42RA==
X-Received: by 2002:a1c:2002:: with SMTP id g2mr7806779wmg.122.1599230403541; 
 Fri, 04 Sep 2020 07:40:03 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id z15sm11597949wrv.94.2020.09.04.07.40.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Sep 2020 07:40:02 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH 12/24] drm/arc: Delete arcpgu_priv->fb
Date: Fri,  4 Sep 2020 16:39:29 +0200
Message-Id: <20200904143941.110665-13-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200904143941.110665-1-daniel.vetter@ffwll.ch>
References: <20200904143941.110665-1-daniel.vetter@ffwll.ch>
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
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Alexey Brodkin <abrodkin@synopsys.com>,
 Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>
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
2.28.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
