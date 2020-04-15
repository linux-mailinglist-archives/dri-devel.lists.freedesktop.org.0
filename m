Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B5D301A94C9
	for <lists+dri-devel@lfdr.de>; Wed, 15 Apr 2020 09:42:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F39A76E8B8;
	Wed, 15 Apr 2020 07:41:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C453B6E8A1
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Apr 2020 07:41:24 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id x18so13585756wrq.2
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Apr 2020 00:41:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=9YLUlKZaUtM4Forfwro10xQxgCvUy2+rdwZQ9G36jRA=;
 b=au/6GXsR962lWxHERPC6f5V2H/uwDoLBNfhGEyskC/NR14Bf8mMYthZcxaPVnh29zq
 2Q6e0Aqo1OJZnWshnWHySNKmJ3OJ1FMwsBVBEvpvSMhTQZ3U/KZioJAuPCBeelRwRrwq
 LM4+kt3V6TxnsbWbii4XJDAvDKvRyPsGBCv04=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9YLUlKZaUtM4Forfwro10xQxgCvUy2+rdwZQ9G36jRA=;
 b=kdlhXOWPpztAnCpuTk+qStotYuwv/hT0M/sZ0vH6MThxYY6vsuFsem8vXgMntiaf9p
 Q7pIqQPKKx1ysj/i0heFz/ozROkTyz71cohc2GMJ/dNvTo33WdELoShJMZuUi2K5qXRm
 9aTesNo3TskNWoCS057pYBMGkI9SNtPJ2d1ob0CvH1D45ngYPVUpNkVZdaDZMGCkEkIr
 hdK5I4udTbgNU5TLyU0vl5S5tlgLjepBhgYMpc6Qk9aoCqlvPxo8nTnqRbBdnnffBE1r
 TD4lpHo3GD9uQd65wAYIpj3yGlnwtzuSFOKwC95b2TznAs7nyUMqkFnu4pggWW1MLasQ
 utBQ==
X-Gm-Message-State: AGi0Pub6mbiaQXwAeaykNy1gVF4pVC4X21mFkCe8n4fIxhmwiTO3Xjt/
 wLDthhV6JW/2cejoVAFVypCbIw==
X-Google-Smtp-Source: APiQypJp6M2iPDeyh4Ts6IiJYaZH3ULti8aKsQCruTMAu+HpHofy6Uw5K2ShviOt48qbXzhV4w8+Bg==
X-Received: by 2002:adf:ed86:: with SMTP id c6mr26496505wro.286.1586936483588; 
 Wed, 15 Apr 2020 00:41:23 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id u30sm1878552wru.13.2020.04.15.00.41.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Apr 2020 00:41:23 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: Intel Graphics Development <intel-gfx@lists.freedesktop.org>
Subject: [PATCH 41/59] drm/arcpgu: Delete arcpgu_priv->fb
Date: Wed, 15 Apr 2020 09:40:16 +0200
Message-Id: <20200415074034.175360-42-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200415074034.175360-1-daniel.vetter@ffwll.ch>
References: <20200415074034.175360-1-daniel.vetter@ffwll.ch>
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
 Alexey Brodkin <abrodkin@synopsys.com>,
 DRI Development <dri-devel@lists.freedesktop.org>
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
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
