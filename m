Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D086CBCA73B
	for <lists+dri-devel@lfdr.de>; Thu, 09 Oct 2025 19:58:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 23FC110EACD;
	Thu,  9 Oct 2025 17:58:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="KSQbhaHV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f41.google.com (mail-io1-f41.google.com
 [209.85.166.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 135A410EAD4
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Oct 2025 17:58:53 +0000 (UTC)
Received: by mail-io1-f41.google.com with SMTP id
 ca18e2360f4ac-937b40137b4so98980839f.0
 for <dri-devel@lists.freedesktop.org>; Thu, 09 Oct 2025 10:58:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1760032732; x=1760637532; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+5lAaOOjCc4ULiFrsiLFYK9hqRtLQli7F1TlUXtnya4=;
 b=KSQbhaHVff3etj+Um7dySfayvj9UMe8TeQJs4CTfYe09P7fe/7QbQjuJwIQCjvRmCk
 sXEK1G949wUN9rRFz9SzNKi44Ss0H9F7Iy0dtJ3lo3tTVOgZISdq+jaExv5JhovrmTTb
 6pwVJ5LuGeKYzxzV+VxUX7gPpvHqeH3YTTcXtW0RwSGkYHWLtx3thZg9BxIcQORtFzbp
 RipvvCxZLvlfLHJqSWlh098SkjS3Ywu+eI9j2sB8TzMS71hIHODSOesJkPGNvuOXH2O9
 Q6sz0+iIrFjCZzKj+cnvq7J25epwyHf+S7C8e3dtFiz4M9uuFDFF+7IAs2i5v76tP5jZ
 Ssbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760032732; x=1760637532;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+5lAaOOjCc4ULiFrsiLFYK9hqRtLQli7F1TlUXtnya4=;
 b=F0tB80hksHoIpvpZ6LFZHbWvhp6jao5zzLGMPtzoEIYvnSeMY28zQwIQJdcuKsklK+
 kze9l8Nls1/kuQgziQnEoAkrm97DmdS0hKM0sN/MkGFM+xgB9P8KdpMRsvldfRPI76P7
 C+FTGzA9KtzyX0iU4/7cwBsA7zy1ATpVYYqusZSNQGnpjWSFXRpME2B3ac3iiWH4wTbl
 u31k2RZs0LNbp+ciLb5H8wZ/zAU0NTcuL2NM1/xStozfmVMstYxqyOp6iCAhBTflRrC5
 BVFNZJEq+8OFYhC/X6sYJhS+UWM61omR1uTVeTBBUbuG1Uh6gbxMJaDcoedTLHXMn2Jh
 4OXQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVMyiQt+CK61C9ryw3EB0YYUDgBLgc8mfByOuiwcQmxPLDZhNnxs1Tyd8wTlfgMOpuOlgw6SLgyzpk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzgpE7MyFGYWMLlOAcHd6vvDE5AkUrDhG3LieFjMMkBxk8Z5Qlr
 3yXuVSM/G4cFz+gGgfYpAY1XuowvAOsfrKQotXkrbqtPcZIJzNO9/8qhenRaEw==
X-Gm-Gg: ASbGncvUOQdcbfN85GGsMuEn/I40dvFmy0DR0r/YQQyRoW/j38f06J6K9jTA7F5uXeM
 eaFiTD7+jic8QN396PARlRkLK6ilp2Vb7+Pvf45PeRoMYIHbQy2vUhTuSb3cpgLLLvZvFuA19uE
 EJznf/zdvMLq3mrnO2PcKVn3KD1xi1cY+BkhYIzeBLQe5QDBGDzUUe+eUyHrErMeMLIQ/RpEse/
 qrVcYhgStddkqoDXwhLHJDipAAqabcEs+h2TXbciO9uiVEtPOS0nO/hwp5HZzFRi/iufckPxht4
 /qMb70++5PG9TnK8jQy351uRTT2XX9RPwL0GZBAjyblkPaVGvpBpnaaWt74CfommdD2a5qMH1PI
 +8zctNqQKKkIQRP6F+EqutRnc0nynKoi9XRzdskeF6axcminJVEPuipp8AoAuSkH1edK3eioi+U
 3p3zPolRPLiSIv2vJ+a5T8PtUCzPCQQXhn663MFQ==
X-Google-Smtp-Source: AGHT+IFFRLinxOs/9OTcYHa0TTaGH+h0f+hAtiRcea3Rwbgg5dAqda5gTWAF7gYArlA/stW+upYWUA==
X-Received: by 2002:a92:cdac:0:b0:405:d8c4:ab8f with SMTP id
 e9e14a558f8ab-42f7c3b2655mr137425675ab.14.1760032732136; 
 Thu, 09 Oct 2025 10:58:52 -0700 (PDT)
Received: from godzilla.raven-morpho.ts.net
 (c-98-38-17-99.hsd1.co.comcast.net. [98.38.17.99])
 by smtp.googlemail.com with ESMTPSA id
 8926c6da1cb9f-58f7200c4afsm30256173.35.2025.10.09.10.58.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Oct 2025 10:58:51 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: jbaron@akamai.com
Cc: gregkh@linuxfoundation.org, ukaszb@chromium.org, louis.chauvet@bootlin.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, daniel.vetter@ffwll.ch,
 tvrtko.ursulin@linux.intel.com, jani.nikula@intel.com,
 ville.syrjala@linux.intel.com, Jim Cromie <jim.cromie@gmail.com>
Subject: [PATCH v5 05/30] dyndbg: make ddebug_class_param union members same
 size
Date: Thu,  9 Oct 2025 11:58:09 -0600
Message-ID: <20251009175834.1024308-6-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251009175834.1024308-1-jim.cromie@gmail.com>
References: <20251009175834.1024308-1-jim.cromie@gmail.com>
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
2.51.0

