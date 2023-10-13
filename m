Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F054E7C90BA
	for <lists+dri-devel@lfdr.de>; Sat, 14 Oct 2023 00:49:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BFD7210E667;
	Fri, 13 Oct 2023 22:48:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x129.google.com (mail-il1-x129.google.com
 [IPv6:2607:f8b0:4864:20::129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA64910E658;
 Fri, 13 Oct 2023 22:48:38 +0000 (UTC)
Received: by mail-il1-x129.google.com with SMTP id
 e9e14a558f8ab-352a22e1471so10472835ab.0; 
 Fri, 13 Oct 2023 15:48:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1697237318; x=1697842118; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fEjUcd2gIGh+rcuXSmEeq7H3LSdL8L2dg7mL1DHpCLA=;
 b=UycOKGnWi0VpsiMHth8hRixZPQAH6dbf4sFDp+nxuZNPL7KK0+Wpjgf2iE4YDCUmz7
 rX+KNQthMhXsyudevoegAykYfi58QnL36kxl9kkbNku6ImzZltOqcbucFerUuP+s+Q3J
 SKtpAGmU7ZgEC7IGJ5KgAgcxy7btLR2NaQbYndCfBMNdAXkmxtA9d0mTB3XvFnSdrr97
 YrVJDD42RPgRML+2GSBP931ojSvf3mu2sZlsOlbWH3p6+YZb+ERfaixrVH9S8jitiiv7
 GyfZpQY7yzw0Y+kp5Hp2Kt0tQd3D590HRlfbW9vOz0wNF7OtW/qgNsFGVS9Z5Cf+VFwI
 oE1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697237318; x=1697842118;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=fEjUcd2gIGh+rcuXSmEeq7H3LSdL8L2dg7mL1DHpCLA=;
 b=VcO/dd5gGduq9vfBLDa6U4kC/m9p9+rdgvgVt3pjOwFtMMlSsKkPgsX3zMO+hVB8tK
 PczJophkdyCAy/9iGW5IazZzOyL9yrwbRD6jWMtqqhkTANX40U90WAeTZhwOOh2j2mAv
 Yhqxi+qGCPMn1DbB9lnfAOnvStaeIo6KjfNuA/Pl6ZoVJN6Oyb7nmoeGDTOkUWp7yObX
 EVJWy7oaHV0lxFXnIBoQmEFrbISYc8EB56JltyGrmxLoUpLHvvcjx7LYbQdOxR0TkBx2
 h3VO/L06EH4SKGYz+bx1a60cmxXPe8j3y9TvpKYqtCNa2H9bCs4/lyWTXPd4+ed3Gbna
 Uh+w==
X-Gm-Message-State: AOJu0YyMolLeMjf3FaiiNDYyrvFF+Hnu/pRGeUcyCwKUDqRhX60Guexn
 J8KvgFH7K3owPNifVl+ut/w=
X-Google-Smtp-Source: AGHT+IHo7yrBXRamtlyqRFU7QLO+/vsLx8/xPVHCeJyGOb8qAVk77cmrpeWyWFO6E5JV0+KuMjiYZA==
X-Received: by 2002:a05:6e02:20e6:b0:350:b7a9:514b with SMTP id
 q6-20020a056e0220e600b00350b7a9514bmr35371309ilv.8.1697237317961; 
 Fri, 13 Oct 2023 15:48:37 -0700 (PDT)
Received: from frodo.. (c-73-78-62-130.hsd1.co.comcast.net. [73.78.62.130])
 by smtp.googlemail.com with ESMTPSA id
 t10-20020a92dc0a000000b003512c3e8809sm1683071iln.71.2023.10.13.15.48.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Oct 2023 15:48:37 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: linux-kernel@vger.kernel.org, jbaron@akamai.com,
 gregkh@linuxfoundation.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org
Subject: [PATCH v7b 07/25] dyndbg: drop NUM_TYPE_ARRAY
Date: Fri, 13 Oct 2023 16:47:59 -0600
Message-ID: <20231013224818.3456409-8-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231013224818.3456409-1-jim.cromie@gmail.com>
References: <20231013224818.3456409-1-jim.cromie@gmail.com>
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
Cc: lb@semihalf.com, groeck@google.com, linux-doc@vger.kernel.org,
 jani.nikula@intel.com, daniel.vetter@ffwll.ch, linux@rasmusvillemoes.dk,
 mcgrof@kernel.org, seanpaul@chromium.org, joe@perches.com, bleung@google.com,
 yanivt@google.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

ARRAY_SIZE works here, since array decl is complete.

no functional change

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 include/linux/dynamic_debug.h | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/include/linux/dynamic_debug.h b/include/linux/dynamic_debug.h
index b53217e4b711..8116d0a0d33a 100644
--- a/include/linux/dynamic_debug.h
+++ b/include/linux/dynamic_debug.h
@@ -106,11 +106,9 @@ struct ddebug_class_map {
 		.mod_name = KBUILD_MODNAME,				\
 		.base = _base,						\
 		.map_type = _maptype,					\
-		.length = NUM_TYPE_ARGS(char*, __VA_ARGS__),		\
+		.length = ARRAY_SIZE(_var##_classnames),		\
 		.class_names = _var##_classnames,			\
 	}
-#define NUM_TYPE_ARGS(eltype, ...)				\
-        (sizeof((eltype[]){__VA_ARGS__}) / sizeof(eltype))
 
 /* encapsulate linker provided built-in (or module) dyndbg data */
 struct _ddebug_info {
-- 
2.41.0

