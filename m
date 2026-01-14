Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 71130D1C02D
	for <lists+dri-devel@lfdr.de>; Wed, 14 Jan 2026 02:59:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BDD1010E396;
	Wed, 14 Jan 2026 01:59:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="SIqbJIoB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-f44.google.com (mail-oa1-f44.google.com
 [209.85.160.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8938210E396
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Jan 2026 01:59:16 +0000 (UTC)
Received: by mail-oa1-f44.google.com with SMTP id
 586e51a60fabf-3f13043e2fdso3061371fac.1
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jan 2026 17:59:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1768355956; x=1768960756; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kbNTI65sKfDeAaHShpwIIW/4QzYcWu3sc0P4jYcnBH4=;
 b=SIqbJIoB8CORLCgcl03WX0NKrJHBWBM02NtEneT8rwYYv/O9td5H7W/KzoIdBNTTUN
 SzDdA3z4WhIARXW8wWe68ZqapwkxVRaxgR6T2K0frxCrNrey0PeSEeXiikmBzM153Y06
 i6SRkpgiQn0Uv4TvcIBVfl7VBWj+erf0tADfdHAzgukVCnIoDir5RfrL6uBvVrxn7V7t
 hPJsr4kgsi8q2qWQTg2MUYP+n/3tbG9+ZadRCKwgFYU+sEqdM6q7a8DcUaS6BiRAXL30
 kWHTCpQkj1RXmy4A1Mr3S5DnzCxgyZ/PjPgcp4izHKU3ysJqxqH8H6qfFxfuUE/hhK+x
 a4dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768355956; x=1768960756;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=kbNTI65sKfDeAaHShpwIIW/4QzYcWu3sc0P4jYcnBH4=;
 b=G/HmrpnWQBlX5BGgX+RRPVuSn/om6b6mccPE/yLSoBRj9PJOjFF+DEBQrEMDyDWGuK
 mO8iuv0CRMj2DZ2r8UvbOnt5vY+oka1DEhvz8zndMsiFDNql+F5EPNRFL0PHumTyspu5
 A8hOVur00MzSM19Qi0w5rNe04KO8+b7mST4PhifJ/HOQ8njacNIy08xBauXsDqhc1VCL
 YvTEWcMPBFDxhX8zaGnZ5XaWaTqsc81sjl8kX9F/jW4p+pAWwssiPmSOPibm3mkvNeIA
 t4ts6JkQRJfe+vqM5dMGHvFi3U5uArblGW9b/zK2uuekJVeICkAFyjnakrj5EMHoE3dr
 VcKg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWheLRw0vRA5QFD/QK5HffZFava0muSX3ax/+cEjKoZ5Djybxr6GVsfwSNkLW5lyX5qfuJiPSi+q2s=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxDRxm0Lhm402A4MSxMvSoA044NsHMpsAPw8uVtxPJJo9rYQzpp
 7CYWpbhm4Lo0q1UiS67GqnZDZBLuqR3CBmVoV4btx/MyZhwa+QVuS4iO
X-Gm-Gg: AY/fxX5ZlaLvDtU+Rg+z6OURcrVQPcid6kt35dQmbSogT4lQsZIHaB1Hy+jWHN+Ikto
 wv6IPTWapebhnm78gQ85syz+V7n7wOi6oinqFD7+JoHDYzHwPNv8WD7RT3Z3nG3ELwVsa0b2V9c
 S1CMlaWDLrtNaKgH5ZXoUtBARV5kVO12gXVNKadG2y3PPZuKaIx9L/VkTO7hvMsYNkuDd/qvD/f
 v/67suC2mnAPGgaTlzihn9BD4udpD90LDdbiwcgJCq18s9+hUwLkMFOYBU1dCp8/41BEQl/Ol0K
 WR6Bgm0gr+KwoPr33kjrIQo2lxE3BnvptdtVfrwe9ZeVVpmtR+TV5nnMP72uNf0SieewaMV3pat
 5BMRrJKpr/fyYSMntSIDmnjz8r1M7iMevfye6zAkDH4r5kZRWrqRnbQgCCfra6iB4b55mBtmZ2H
 f4JqYmqQN+pT4xTJtWq6eVibZMkyrDyR9qH5/+
X-Received: by 2002:a05:6871:4e4c:b0:3f5:4172:21d with SMTP id
 586e51a60fabf-4040c0cbaeamr399585fac.56.1768355955607; 
 Tue, 13 Jan 2026 17:59:15 -0800 (PST)
Received: from frodo (c-98-38-17-99.hsd1.co.comcast.net. [98.38.17.99])
 by smtp.googlemail.com with ESMTPSA id
 586e51a60fabf-3ffa4e3a7bfsm15083510fac.8.2026.01.13.17.59.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Jan 2026 17:59:15 -0800 (PST)
From: Jim Cromie <jim.cromie@gmail.com>
To: gregkh@linuxfoundation.org,
	linux-kernel@vger.kernel.org
Cc: Jim Cromie <jim.cromie@gmail.com>, Jason Baron <jbaron@akamai.com>,
 =?UTF-8?q?=C5=81ukasz=20Bartosik?= <ukaszb@chromium.org>,
 Louis Chauvet <louis.chauvet@bootlin.com>,
 Bagas Sanjaya <bagasdotme@gmail.com>, Dave Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org,
 Petr Mladek <pmladek@suse.com>, Shuah Khan <skhan@linuxfoundation.org>,
 linux-doc@vger.kernel.org, Steven Rostedt <rostedt@goodmis.org>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>
Subject: [PATCH v8 08/31] dyndbg: drop NUM_TYPE_ARRAY
Date: Tue, 13 Jan 2026 18:57:24 -0700
Message-ID: <20260114015815.1565725-9-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260114015815.1565725-1-jim.cromie@gmail.com>
References: <20260114015815.1565725-1-jim.cromie@gmail.com>
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

Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
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
2.52.0

