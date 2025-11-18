Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B0361C6B8E3
	for <lists+dri-devel@lfdr.de>; Tue, 18 Nov 2025 21:19:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B89F010E51F;
	Tue, 18 Nov 2025 20:19:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="fXRjdzSk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f50.google.com (mail-io1-f50.google.com
 [209.85.166.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3701310E519
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Nov 2025 20:19:10 +0000 (UTC)
Received: by mail-io1-f50.google.com with SMTP id
 ca18e2360f4ac-9486354dcb2so257849939f.3
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Nov 2025 12:19:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1763497149; x=1764101949; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=q0LcLub/aNYx45CBVmAA9eCl59aPuMQxX3ceh0vpFBA=;
 b=fXRjdzSkS+PK1gjbsoAvx52tSQ01e64BnBk7bI/yiK2XSce4kmoaxNMGPcl5lM6+Fb
 NVVcYx9vZP4Nxn/UCLtNMs3uEtcIsgHLxV9sJSgoDyOPJkdtWTSsKFC6qXw5G5CdxxpU
 ZSefFsYxHv/qE135wFKOm4dvT/5Oz5yq+SKtbDx/EORuQ2xeWrxytx6bxyLKKct68vtx
 SsWTgH6Vy4Y33gQg2isWb5xNZ6dHB4Nt//U1x6m9PZN3qHedwOpWPWlGGDi/9A3Q/3TI
 jINbmXfn4UnaDXVxDR2qlc4tfUV4HHMFJTYpiumY91TgCThdU+bSarKUWIKazc7g2qqi
 crpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763497149; x=1764101949;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=q0LcLub/aNYx45CBVmAA9eCl59aPuMQxX3ceh0vpFBA=;
 b=o+154QMsiK2VXSFZiGd8xmYJIqMSLCsHYus0+Zv0ABMOFzMnrTwHWFaNsGOVczIG/Y
 wpBQUec/z1MsRPx1q0RuNK+idhMxgeo0KralIOsbU5r25v9/ycfJKfKkYIMjGRcKT7u3
 iOsVWCK4rltDIxTTwWW9loACzcBbvk1igq0ekK47kb7yoOCgAMwUO+qBA89tFcejNtX/
 UfoKbLB/A5xe4nuPflC/F0QGPQYECPf+nWhXS4cDRUS27V1erNNJ1WVqwFGE0Fma3saF
 BZMLgcaTZjUsTqspYe8jogV7wbm0ThHhMQfjXOsePq0zOxiWaJRN8wCJTlZrTsrzs0qY
 VBiA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUHyspu0jbVVO+cApPD2qcRJ+0cRF9wMicf4qI4IVy5zJK8hgh4NFwhs/vRC9T28p2xtRzUY8LP65I=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxb4NApVH+N7C6yslADN9XPVSXpPTqz2HWWr+z0ka++pMyd3+qF
 e8EN7cLze05YpWmBXeNJbIyqppmrAzNSyTuyLhzcR2AMi2uLwMfuCTYE
X-Gm-Gg: ASbGncsYl7YUpWSJ2MUMC90s+UVgk1tFOz4QIG8lKPbC4MMytfGYRtK0oT+LeNz5t5d
 4nTjMO0+l1KN7AVKr41YWo2mqo2LyUPIriYf90r3VVzsv94coB9iVn21vpROg3nwxStjXRy3nZE
 h+09q9lr7qtDV2mgq59Ih9BtQtbwFRta5zt4nt8Lotfm2hPOT4iIPVRv2Scx94JW1sVk8zetih9
 LBtquXtMDUUaDssXCXVFKKFXp4GMyEITsxSwijmM6clSuevYGAFDV5R10hArYk059lpThm0dpZq
 nKX9y/GF0J+9F831f6f0J3hE+Pu+GN9G6HfNbIRxkQix4zSwq6iQMdf/A4DQ4Mfq5Gd5bfM1JRO
 Pvf43TpJI0xbr7B49Jk3XFwytPBUkzLg7R6OtbMjIAAv/VOznEJ8rBGmQaisYoXGH2VKZZ+Lyhz
 /GUztugBHjq4gz3Em2oWNWf3KNC3r3WdhK6RW6kjuj4tt2mAd/f6Ln/j3IGLDbn/1fRzg=
X-Google-Smtp-Source: AGHT+IEdSCO1+n7RvJ1rZQQI1aUqPH/UMwfsqXn2Qmo68hCkIP4iTRfzfxbS0/RNj2ZoOT86zHegZg==
X-Received: by 2002:a05:6602:2d8c:b0:948:a2aa:edc8 with SMTP id
 ca18e2360f4ac-948e0d43f0cmr2217407739f.4.1763497149524; 
 Tue, 18 Nov 2025 12:19:09 -0800 (PST)
Received: from godzilla.raven-morpho.ts.net
 (c-98-38-17-99.hsd1.co.comcast.net. [98.38.17.99])
 by smtp.googlemail.com with ESMTPSA id
 ca18e2360f4ac-948fd4c273bsm419823939f.18.2025.11.18.12.19.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Nov 2025 12:19:09 -0800 (PST)
From: Jim Cromie <jim.cromie@gmail.com>
To: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 gregkh@linuxfoundation.org, jbaron@akamai.com
Cc: ukaszb@chromium.org, louis.chauvet@bootlin.com,
 Jim Cromie <jim.cromie@gmail.com>
Subject: [PATCH v6 08/31] dyndbg: drop NUM_TYPE_ARRAY
Date: Tue, 18 Nov 2025 13:18:18 -0700
Message-ID: <20251118201842.1447666-9-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251118201842.1447666-1-jim.cromie@gmail.com>
References: <20251118201842.1447666-1-jim.cromie@gmail.com>
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

ARRAY_SIZE works here, since array decl is complete.

no functional change

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 include/linux/dynamic_debug.h | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/include/linux/dynamic_debug.h b/include/linux/dynamic_debug.h
index 4b7c3b997657..c4ae79f934d9 100644
--- a/include/linux/dynamic_debug.h
+++ b/include/linux/dynamic_debug.h
@@ -131,11 +131,9 @@ struct ddebug_class_param {
 		.mod_name = KBUILD_MODNAME,				\
 		.base = _base,						\
 		.map_type = _maptype,					\
-		.length = NUM_TYPE_ARGS(char*, __VA_ARGS__),		\
+		.length = ARRAY_SIZE(_var##_classnames),		\
 		.class_names = _var##_classnames,			\
 	}
-#define NUM_TYPE_ARGS(eltype, ...)				\
-	(sizeof((eltype[]) {__VA_ARGS__}) / sizeof(eltype))
 
 extern __printf(2, 3)
 void __dynamic_pr_debug(struct _ddebug *descriptor, const char *fmt, ...);
-- 
2.51.1

