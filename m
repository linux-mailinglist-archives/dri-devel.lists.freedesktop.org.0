Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 24CB87C7430
	for <lists+dri-devel@lfdr.de>; Thu, 12 Oct 2023 19:22:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B43CD10E523;
	Thu, 12 Oct 2023 17:21:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd2e.google.com (mail-io1-xd2e.google.com
 [IPv6:2607:f8b0:4864:20::d2e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1890410E525;
 Thu, 12 Oct 2023 17:21:50 +0000 (UTC)
Received: by mail-io1-xd2e.google.com with SMTP id
 ca18e2360f4ac-76c64da0e46so48025039f.0; 
 Thu, 12 Oct 2023 10:21:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1697131309; x=1697736109; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1C+2NMg1JH09l8lpRwB0Ubzh+mfktnl5vVkwETAlRt8=;
 b=IiCT3Fut0W+gJEcdJ35TMyDgLn1pMENPN4MlDK+MKIltYiiI0FlptdFuzpfRgi8/n7
 bwBRD9FlNjrqIIvuicwn4nWjyrA5Rh/WSeZUBh3DSGluY6akUh0zCIo7wi4p8Vv1EH4Q
 +DiyMM6ElYSquMSQ7ukb0gAOP8kejaP8mbfM1INnohA4lpxbXj4BKXrBKz+z0MWwD05B
 9sPTR7sAaAh8wSaRIcisfYEHwpIdUYEpLciNDaitDm5Cz3pm8WiB9Zqfl7DWi+ebaGzK
 XhTP6Y/BjvAY6Ny8hL5LU3CY8U5+HBzSKklWvjJPLdFS3PwPxtcbbma49qF++dG2cBCO
 3nBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697131309; x=1697736109;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1C+2NMg1JH09l8lpRwB0Ubzh+mfktnl5vVkwETAlRt8=;
 b=U67lYZ//7sXRkFCl2rT2+iuZyN+gKe99VPjUi9U7d2BoNJ0LXUqQwGXN6WUI847w+W
 XyGcnTylyP4k2gWxg6LNrpFiAlghUOKncI6fE8EETqKaz849xDOM6xNu9dIP/ewoEklF
 /70VWQNXUCy+Cd/Ftiy4YIeq5PcPvb88r0ZfhTIG/W1SdDead7klZEXPaWn5Ifpf9mgZ
 TXspM8RpcLKqhVIXMJp9zuHa3scEEtvE2lOHpj9RZqMOZMGfFwfPYkN23pGEJgH+SBuz
 ht8PJYnKY9h2ps86/zMbnf69qyzyYUXdRH17+W1Wa+k+RU6vX+uvkqAQ1l5YowuQt9Al
 szPQ==
X-Gm-Message-State: AOJu0YxEKLVl//5Z0u315hS66UTa9aRYZ1Y15tI5q6hWeqDjGlqW8KNE
 iUWwC1NPNlJsbLzW7rLxeGk=
X-Google-Smtp-Source: AGHT+IFv9+9ZSJVEOdNuMEayE6v+GU7M5y/7ncblYUcEZI8Bcli8ik/hEPbo6CFkwlP3gRTVK7jmtA==
X-Received: by 2002:a5e:aa0c:0:b0:794:e96f:b87d with SMTP id
 s12-20020a5eaa0c000000b00794e96fb87dmr27629465ioe.0.1697131309330; 
 Thu, 12 Oct 2023 10:21:49 -0700 (PDT)
Received: from frodo.. (c-73-78-62-130.hsd1.co.comcast.net. [73.78.62.130])
 by smtp.googlemail.com with ESMTPSA id
 r25-20020a028819000000b0043cef0711c1sm3992211jai.158.2023.10.12.10.21.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Oct 2023 10:21:48 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: linux-kernel@vger.kernel.org, jbaron@akamai.com,
 gregkh@linuxfoundation.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org
Subject: [PATCH v7 03/25] dyndbg: make ddebug_class_param union members same
 size
Date: Thu, 12 Oct 2023 11:21:14 -0600
Message-ID: <20231012172137.3286566-4-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231012172137.3286566-1-jim.cromie@gmail.com>
References: <20231012172137.3286566-1-jim.cromie@gmail.com>
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
Cc: groeck@google.com, linux-doc@vger.kernel.org, jani.nikula@intel.com,
 daniel.vetter@ffwll.ch, yanivt@google.com, seanpaul@chromium.org,
 bleung@google.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

struct ddebug_class_param keeps a ref to the state-storage of the
param, make both flavors use the same unsigned long under-type.
ISTM this is simpler and safer.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 include/linux/dynamic_debug.h | 2 +-
 lib/dynamic_debug.c           | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/include/linux/dynamic_debug.h b/include/linux/dynamic_debug.h
index 4fcbf4d4fd0a..5231aaf361c4 100644
--- a/include/linux/dynamic_debug.h
+++ b/include/linux/dynamic_debug.h
@@ -124,7 +124,7 @@ struct _ddebug_info {
 struct ddebug_class_param {
 	union {
 		unsigned long *bits;
-		unsigned int *lvl;
+		unsigned long *lvl;
 	};
 	char flags[8];
 	const struct ddebug_class_map *map;
diff --git a/lib/dynamic_debug.c b/lib/dynamic_debug.c
index ceb3067a5c83..b984ce338921 100644
--- a/lib/dynamic_debug.c
+++ b/lib/dynamic_debug.c
@@ -796,7 +796,7 @@ int param_get_dyndbg_classes(char *buffer, const struct kernel_param *kp)
 
 	case DD_CLASS_TYPE_LEVEL_NAMES:
 	case DD_CLASS_TYPE_LEVEL_NUM:
-		return scnprintf(buffer, PAGE_SIZE, "%d\n", *dcp->lvl);
+		return scnprintf(buffer, PAGE_SIZE, "%ld\n", *dcp->lvl);
 	default:
 		return -1;
 	}
-- 
2.41.0

