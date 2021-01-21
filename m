Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C96732FE285
	for <lists+dri-devel@lfdr.de>; Thu, 21 Jan 2021 07:17:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 31C676E8D0;
	Thu, 21 Jan 2021 06:17:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [IPv6:2a00:1450:4864:20::531])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0EBDC6E8D0;
 Thu, 21 Jan 2021 06:17:27 +0000 (UTC)
Received: by mail-ed1-x531.google.com with SMTP id bx12so1066854edb.8;
 Wed, 20 Jan 2021 22:17:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=sU5tZaa9loX2gZuXGaMLadWvaUsvSbINc42odFCZ2z4=;
 b=JI3HDdSY1ImxcRbr79XwgQwBb9P+Vj3tOx7WGh3r3A34asc7XNyPUNeBIgGXA5GTzS
 34TR2mbSaQ/hunDDDr1+KQIy6+Q7NF7bEFTrXthAvWlE485opYllNz+p4nXoBwu6gRN3
 /CVRoqsGcD91YMwBKuxGoz822aWFm5pDQVENu/5k9Zq2kOdJOCYqjdoteHxghz7T5Fpd
 IyH4YqoQbfpd0kYgWHSZWMPYD2w4mCS4xUxi5gOCVtdTuOmoQMybq0ianytR4cmU6knE
 P7ZivSQWTa3ZM1ZDKCZJM/7Ei/Jj4ao34sORFpID7as0oEDz4fygWy2n4A/3P+Uz9QKU
 lUsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=sU5tZaa9loX2gZuXGaMLadWvaUsvSbINc42odFCZ2z4=;
 b=gKxymw0JKxnsPjfQ0E75n4uoFjrEljuI6MVB5+VlP2VTLQlp/xzDBAkGWr2sxTMiZH
 hCtEgItXh8hNRPzrQWUPiQXTFyavp1HZQt0ko7I6EzEyjodh0OEXbMvNab3/i+cp4IB+
 IV2Q7ZMHke+M78VpFfB23gx/z1cefoPIvJtR0wN0nlUN8OMb0uJYcHMeUwjYGLVnmfLo
 8B6nD0DBy1bi9LdKWxc/e4JHSw8jNL6B8f1HM6bO1RQnS5AD9PvMl4aks6mB8b+p9pQo
 OySNF3a8LsNqBtwGMQjZHuXOCXibDnkm7OWZKTAlQtK4/N6Geffhe75gvnwP06TfiILr
 3akQ==
X-Gm-Message-State: AOAM5336tZu95drdzaF4RugpR3QIImCZOhg0zf5vMFjBdgGGHL2htpxz
 u/Gknoj6Cf0C/Njm/e75m8b1WGOjAH0=
X-Google-Smtp-Source: ABdhPJyhM4uPcyfzvz030WVvKoKYua500bOaYDL1gPH4OypEYMA5jizMiMii7QN1mJUvFouDmdxKdQ==
X-Received: by 2002:a05:6402:31ae:: with SMTP id
 dj14mr9981087edb.364.1611209845584; 
 Wed, 20 Jan 2021 22:17:25 -0800 (PST)
Received: from twisty.localdomain
 (dynamic-2a01-0c22-c84c-8e00-6cbb-50d4-b91e-5b37.c22.pool.telefonica.de.
 [2a01:c22:c84c:8e00:6cbb:50d4:b91e:5b37])
 by smtp.gmail.com with ESMTPSA id w4sm2225551eds.40.2021.01.20.22.17.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Jan 2021 22:17:25 -0800 (PST)
From: Mario Kleiner <mario.kleiner.de@gmail.com>
To: dri-devel@lists.freedesktop.org,
	amd-gfx@lists.freedesktop.org
Subject: [PATCH 1/2] drm/amd/display: Fix 10/12 bpc setup in DCE output bit
 depth reduction.
Date: Thu, 21 Jan 2021 07:17:02 +0100
Message-Id: <20210121061704.21090-2-mario.kleiner.de@gmail.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20210121061704.21090-1-mario.kleiner.de@gmail.com>
References: <20210121061704.21090-1-mario.kleiner.de@gmail.com>
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
Cc: alexander.deucher@amd.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

In set_clamp(), the comments and definitions for the COLOR_DEPTH_101010
and COLOR_DEPTH_121212 cases directly contradict the code comment which
explains how this should work, whereas the COLOR_DEPTH_888 case
is consistent with the code comments. Comment says the bitmask should
be chosen to align to the top-most 10 or 12 MSB's on a 14 bit bus, but
the implementation contradicts that: 10 bit case sets a mask for 12 bpc
clamping, whereas 12 bit case sets a mask for 14 bpc clamping.

Note that during my limited testing on DCE-8.3 (HDMI deep color)
and DCE-11.2 (DP deep color), this didn't have any obvious ill
effects, neither did fixing it change anything obvious for the
better, so this fix may be inconsequential on DCE, and just
reduce the confusion of innocent bystanders when reading the code
and trying to investigate problems with 10 bpc+ output.

Fixes: 4562236b3bc0 ("drm/amd/dc: Add dc display driver (v2)")

Signed-off-by: Mario Kleiner <mario.kleiner.de@gmail.com>
Cc: Harry Wentland <harry.wentland@amd.com>
---
 drivers/gpu/drm/amd/display/dc/dce/dce_transform.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/dce/dce_transform.c b/drivers/gpu/drm/amd/display/dc/dce/dce_transform.c
index 130a0a0c8332..68028ec995e7 100644
--- a/drivers/gpu/drm/amd/display/dc/dce/dce_transform.c
+++ b/drivers/gpu/drm/amd/display/dc/dce/dce_transform.c
@@ -601,12 +601,12 @@ static void set_clamp(
 		clamp_max = 0x3FC0;
 		break;
 	case COLOR_DEPTH_101010:
-		/* 10bit MSB aligned on 14 bit bus '11 1111 1111 1100' */
-		clamp_max = 0x3FFC;
+		/* 10bit MSB aligned on 14 bit bus '11 1111 1111 0000' */
+		clamp_max = 0x3FF0;
 		break;
 	case COLOR_DEPTH_121212:
-		/* 12bit MSB aligned on 14 bit bus '11 1111 1111 1111' */
-		clamp_max = 0x3FFF;
+		/* 12bit MSB aligned on 14 bit bus '11 1111 1111 1100' */
+		clamp_max = 0x3FFC;
 		break;
 	default:
 		clamp_max = 0x3FC0;
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
