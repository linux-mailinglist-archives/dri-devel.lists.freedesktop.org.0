Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D755A793FC
	for <lists+dri-devel@lfdr.de>; Wed,  2 Apr 2025 19:42:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1738C10E880;
	Wed,  2 Apr 2025 17:42:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="BxN21pRm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f182.google.com (mail-il1-f182.google.com
 [209.85.166.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E9E2510E87F;
 Wed,  2 Apr 2025 17:42:19 +0000 (UTC)
Received: by mail-il1-f182.google.com with SMTP id
 e9e14a558f8ab-3d6d6d82633so489185ab.0; 
 Wed, 02 Apr 2025 10:42:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1743615739; x=1744220539; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=F1MDFYF/EJ2a7UGqvWTU6dzs01F9Q8UeZTgbtP6X+58=;
 b=BxN21pRma2WZp9aAqof2t010+vWvW6lH31NiaFn/AjPhLgRCvJ3tf43EUNX1puaPjC
 vpa2Vea4To3T6FMdowmevW+cCCIZ6NoN9AWXfabvgVK3afdWxKZ0YOQtwYpP6+ayg40N
 9QEMj4W2wGamP+JP+DyrsMMCOoosSSpAUfXE1SnOUPL157KSFlHEmwljxZoZtNsEZ374
 GfQRtTSyOPUHwdH/wTcN/3jjf5fzYoTiauExnENwtqtMbxSP84zUHX57BElKhjl02yiM
 Cab2AnvMMnyrRV++ummBYNzfM2euMZ9r6OzOLCSKtu0vKyGX9/KN9KLr905nmjn6X4OT
 qbSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743615739; x=1744220539;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=F1MDFYF/EJ2a7UGqvWTU6dzs01F9Q8UeZTgbtP6X+58=;
 b=aDd9HK9p6MT05BUJyrQLB2cOHoh/rws73MWE851rZWTU9XqFzwrrZDBIRCXellZcX5
 aixPwniGmJfEQuLUQ7JU12ARbnt9bVlVcxQdCsuQsVexrCt/zIhzSuoJmkLHgHdqqx4Q
 h7A76DprgnRkpzKdSRcaPo0QvOHGKsD+W99idkOLDC+4c7LjpwDd93D1+AhC9noGOppj
 av5sFjV9ap0ZZ89D5sKqzDjKez7/0905rj8ngwQcNEcxu0Z1wgOqJR5lK6NsGyHoZ+Rr
 OnOJAuZCTHz7rl7w7bwZrje0lwenkJz3QoZRX4xnd4MKvfyYko1qmnAkBMivJMkGH7jf
 Sm6Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCWEW32N0Ua/kJLZbAhqYqfQg+qHH6uWM0325tOQHlMzAZcJ0QJ4K+uFB8yDPGIpJwTCRMBLxHVN@lists.freedesktop.org,
 AJvYcCWzNZn8b6GODe4fHXoC7452wlK/6UUG4385ewR/sLZSkn+SIKfkkYXgV4eWpKLxrV6K4df6SlbcxBSc@lists.freedesktop.org,
 AJvYcCXBs3p4TeoAzUPkpTABJdvX0TfC1XUFVX4ijHWbnMhxQuO1+ufzCZfE71Iv7vKXlNLrMiAzpshJLPYuZk+Z0g==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwRtyZW5f93O6NlVo1ts//8TD949btAFEbkGJW2D9TrS/XI0n1W
 Rs2dWXf6OzOLsZGe+fvGANEtOQePJTVGJWZ4iGBlYDnFWJ9CwPUT
X-Gm-Gg: ASbGncsAThcACy+sOHazvfo+d1M5f1mBXdVF1HAa5X2JjgXbdhc3KGW1KJ9FNxKzYZe
 jiAAdVZ8/UWmON7cW2RPAqVwcwa8nYTYQvwR14choIcuSqidJ+Kt6mLVOTshR0SVf+3HQLpf1Kv
 AzxA2632RDxNP08IpSKG2mSnbxdptYPVjqd2LOe+L5u+eurS/XOH4G32mZGwLdLZCVlKS6V4/SQ
 dd2LhyMgFV4nArVqqAOc1u9SE/h92Kpm4fDEDQpRGvOucC8iD+abMsuXjMf/FKivaRwebMZgpuJ
 EEN/UUfoJaL6iN6KceC4V0XVEMaghDgE1dUhjJP7icPx3q2PHW7g0rynQKmG7Lch6QzohhVKgms
 BVw==
X-Google-Smtp-Source: AGHT+IFVWQtukqjbox+/BI8jH/gu5QsbtgxbaxR6JpDzTl89/ZDWJ5DbXCocb+GVCPq2mu6sIVRlLQ==
X-Received: by 2002:a05:6e02:1c26:b0:3d4:414c:6073 with SMTP id
 e9e14a558f8ab-3d6d548b68cmr40322985ab.8.1743615739132; 
 Wed, 02 Apr 2025 10:42:19 -0700 (PDT)
Received: from gandalf.. (c-67-165-245-5.hsd1.co.comcast.net. [67.165.245.5])
 by smtp.googlemail.com with ESMTPSA id
 e9e14a558f8ab-3d5d5af8369sm33439725ab.71.2025.04.02.10.42.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Apr 2025 10:42:18 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: jbaron@akamai.com, gregkh@linuxfoundation.org, ukaszb@chromium.org,
 louis.chauvet@bootlin.com, linux-kernel@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gvt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 daniel.vetter@ffwll.ch, tvrtko.ursulin@linux.intel.com,
 jani.nikula@intel.com, ville.syrjala@linux.intel.com,
 Jim Cromie <jim.cromie@gmail.com>
Subject: [PATCH v3 06/54] dyndbg: make ddebug_class_param union members same
 size
Date: Wed,  2 Apr 2025 11:41:08 -0600
Message-ID: <20250402174156.1246171-7-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250402174156.1246171-1-jim.cromie@gmail.com>
References: <20250402174156.1246171-1-jim.cromie@gmail.com>
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

struct ddebug_class_param keeps a ref to the state-storage of the
param; make both class-types use the same unsigned long storage type.

ISTM this is simpler and safer; it avoids an irrelevant difference,
and if 2 users somehow get class-type mixed up (or refer to the wrong
union member), at least they will both see the same value.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 include/linux/dynamic_debug.h | 2 +-
 lib/dynamic_debug.c           | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/include/linux/dynamic_debug.h b/include/linux/dynamic_debug.h
index ff44ec346162..b9afc7731b7c 100644
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
index 147540c57154..55df35df093b 100644
--- a/lib/dynamic_debug.c
+++ b/lib/dynamic_debug.c
@@ -799,7 +799,7 @@ int param_get_dyndbg_classes(char *buffer, const struct kernel_param *kp)
 
 	case DD_CLASS_TYPE_LEVEL_NAMES:
 	case DD_CLASS_TYPE_LEVEL_NUM:
-		return scnprintf(buffer, PAGE_SIZE, "%d\n", *dcp->lvl);
+		return scnprintf(buffer, PAGE_SIZE, "%ld\n", *dcp->lvl);
 	default:
 		return -1;
 	}
-- 
2.49.0

