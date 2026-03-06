Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +DypDSDNqmkNXQEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 06 Mar 2026 13:48:32 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A980220F1D
	for <lists+dri-devel@lfdr.de>; Fri, 06 Mar 2026 13:48:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C27B810ED2A;
	Fri,  6 Mar 2026 12:48:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="iRSeNpC/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com
 [209.85.128.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EED3710ED2D
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Mar 2026 12:48:27 +0000 (UTC)
Received: by mail-wm1-f52.google.com with SMTP id
 5b1f17b1804b1-4807068eacbso77474135e9.2
 for <dri-devel@lists.freedesktop.org>; Fri, 06 Mar 2026 04:48:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1772801306; x=1773406106; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=WZcIBap9H45saVr2wDCS117JcXK6cZ88QtiSeq9q414=;
 b=iRSeNpC//SRKyAGoGUxqZzpAdFkeehr7vmmDbI6hG8uCTzZwb/usPJan/K12v5vaoe
 4BvUcgnGp8JQGDANldoUfameRJ2NoIRSKuXqVeGCH/MDPHXrnTlZv0qFmMr0nC5fhJcv
 DcTEFtZ7WkHkuP896qOGhEJOEI2xSJmx7O37Bg1bEp0W09MI4M8zRH+YMELSwXBD357u
 Vp2UtTlPY0Abpf1DZxL4vh5XWnMyRgDiXyOo4IVERBp+pz18YUxHAE7QWRh7Pm6yKAQ3
 SkG4EoxjZ+R3+gfryYkeKOWT+FeLO4aFRwpCAUaqPZF3Y+w+oNnB6FFTezO+fgXbtKou
 DXxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772801306; x=1773406106;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WZcIBap9H45saVr2wDCS117JcXK6cZ88QtiSeq9q414=;
 b=wNMYLOzKM+GS9sTITg1aLwxRRMaZ3higoEIZdNNu9hxLhu8cdlOHXpcoD2BcJQMxDy
 h6eT3nV0LUfLO/g/8c7J3JPXKB1oFUXcBLQ9cTMBteMB/Fe3TNj3nqIq8BlXl7DFXCwX
 qzGg2uygZ11joxrAi0gHsizHObw8XbgKov27B482y/MaipqOOXJJnDQx+B/AAiMMKn9a
 rOW0rZec5VLSIwXk8tcankXYsXJCwF2OPR2+8dkgGrm4ac1bdi/RrYGGLBZc81WjjXfT
 61glwUiGwJ/jQ2QgVGsmlNKc0ZHuguSA3EDT7lSJpmS6VVhOzWWKoI1K/LrmUrbutxv2
 Lddw==
X-Gm-Message-State: AOJu0Yx6ic6jr+cX2tBrOAc0BQauKzOTRlyAhIX78GM2rr4KC/GWI2+w
 ClUE3hYzaNJIIeRZBeSQQyOJ3nUu32wPeUg5ts9YzEUPE4O1thZOXpvC1fWQ5mBA
X-Gm-Gg: ATEYQzwgOWSLH4fblxGBL9s+q0fWdBoQ3hj9fCc6qyEByOVT5+dXwLnz9mcjrwsvCjG
 K0cUrrQVq4qkQIIcFVNXT24I0YQoqfQjJz+ieehHsJ+kBQLij6ulEgUVCr3MJvVaRgzDavfHs6E
 ggLxCvcWwPYgAIGhXz2nuyxVQ2G/H3imswMBK1Bsv9+GEfaFJ7fgMQuMpJAn8GG12GzM0lODNqC
 RlhrAh+gaVQbsuwbOBajK4FFd0x0J4Hy+mctgEJ2ElYEmrdXqie8rCGcKcqG6qdQaYxn2ecaK9f
 3Ff40qk0hcyoOL5DZqI6g/EZCcYMmmEji2W/Qu9CvewKzEsejvVz1WVDhQ2T8a5R9eBXeedk90p
 NHPvUbG3NM5NQs6i9brkQd6i3wbU5uOLU1WuUrjLirLBndf+hFq5kzWK/itxvF6ilZBbgP0BxnO
 PH2qH2hLKx/jNLK9wbqhQ=
X-Received: by 2002:a05:600c:45d1:b0:480:6ab1:ed0d with SMTP id
 5b1f17b1804b1-4852691d5f0mr32230205e9.9.1772801306031; 
 Fri, 06 Mar 2026 04:48:26 -0800 (PST)
Received: from luca-vm.lan ([154.61.61.58]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4852470b412sm32733815e9.8.2026.03.06.04.48.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Mar 2026 04:48:25 -0800 (PST)
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
To: dri-devel@lists.freedesktop.org
Cc: Luca Leonardo Scorcia <l.scorcia@gmail.com>, Jagan Teki <jagan@edgeble.ai>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <jesszhan0024@gmail.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v2] dt-bindings: display: panel: Document the rotation property
Date: Fri,  6 Mar 2026 12:44:21 +0000
Message-ID: <20260306124808.166776-1-l.scorcia@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
X-Rspamd-Queue-Id: 9A980220F1D
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_CC(0.00)[gmail.com,edgeble.ai,linaro.org,ffwll.ch,linux.intel.com,kernel.org,suse.de,vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[15];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[lscorcia@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[dri-devel,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo]
X-Rspamd-Action: no action

The Jadard jd9365da-h3 driver already allows DRM to get the panel orientation
via the device tree rotation property (described in panel-common.yaml),
but it's currently not documented.
Describe it in the driver documentation to fix a dtbs_check error in
Xiaomi Mi Smart Clock x04g, where the panel is landscape-oriented.

Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
---
v2: Review feedback: improved commit message to explain how the rotation
    property is used by the driver and why it's needed in the driver
    documentation.

 .../devicetree/bindings/display/panel/jadard,jd9365da-h3.yaml  | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/panel/jadard,jd9365da-h3.yaml b/Documentation/devicetree/bindings/display/panel/jadard,jd9365da-h3.yaml
index b8783eba3ddc..25024f4a63e1 100644
--- a/Documentation/devicetree/bindings/display/panel/jadard,jd9365da-h3.yaml
+++ b/Documentation/devicetree/bindings/display/panel/jadard,jd9365da-h3.yaml
@@ -33,9 +33,8 @@ properties:
     description: supply regulator for VCCIO, usually 1.8V
 
   reset-gpios: true
-
   backlight: true
-
+  rotation: true
   port: true
 
 required:
-- 
2.43.0

