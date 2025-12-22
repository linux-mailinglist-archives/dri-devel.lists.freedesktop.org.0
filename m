Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 947ABCD4FBA
	for <lists+dri-devel@lfdr.de>; Mon, 22 Dec 2025 09:22:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F3E2610E569;
	Mon, 22 Dec 2025 08:22:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="neBQnuVn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com
 [209.85.210.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0869210E57B
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Dec 2025 08:22:50 +0000 (UTC)
Received: by mail-pf1-f175.google.com with SMTP id
 d2e1a72fcca58-7b9387df58cso6062295b3a.3
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Dec 2025 00:22:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1766391769; x=1766996569; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kbNTI65sKfDeAaHShpwIIW/4QzYcWu3sc0P4jYcnBH4=;
 b=neBQnuVnzqt1H6VYOlP3M8KKFRI/cdKsOs3057KO5vNhsv1HbmMwGjaVH15rsyMKo/
 N4ZdO94JS47LXLlFvUizmZFqWUnevi51Zgx1usHTPggd09nMkqZTs2OIV3Uvvw2fBV+c
 0+eacWIonCw1Pxvbvx49TWdjkDpuo0AgR+d7B2mAdf2tWg65Icad4FES8F+s3A+5Qpog
 gBJEHIf8vEB6jIuFnXyLLg15qascLywGhdyt5Ni7672afCUd5aM6lmmiK/n+Lu0jEf2X
 bYMcs7+8Xixtmzz0NSjUX4jhTUnKompVNPl6Oh8iCSeJ+QzrUsInR1N8oZ1KyL5H5nYM
 vgjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766391769; x=1766996569;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=kbNTI65sKfDeAaHShpwIIW/4QzYcWu3sc0P4jYcnBH4=;
 b=NUkDol1OFZ/gUEnaVp7yNdOE5G94duH4joRQcRpI+6p6vM05FPT9izpyJnCQNWGsHR
 V2eKT+KKLtHnooVhpdSkz24aD/3vCLIlGqOmWipgRW3gDHHOiKFHHcznCwVvWkBaPZQR
 jYIk7UIDt/zSFrQwaCqSwMq6jmZFNKSq437j9hf1e4IKJ1VJA8Vrau2dR0V6HPMel2dv
 B1v5I6prK90Qk+hhOU43RhiIy/0F2xj17+GLG+HIkRCMHp9kMfuzXHLjLVsRYWm/739X
 yiWPDkjesnUUuIVBn6TxzjCxXoPSSnZ9LQtnuACW/QpogskKGzIWZxw1KtQ0YDQrrMPW
 qKZA==
X-Gm-Message-State: AOJu0YzomBnULtG55suydpo9oZybzaCbSQ0kzDpJ8QwhZK2PvBgpQCNG
 qGt2/yQW3RNZLWTa/Dq+96LUc/wvcWlu/RiPrTol7rl5JzrsL6ejL+vY
X-Gm-Gg: AY/fxX5MaksXNAvT4frdRtJusNP/iNos9zzrH5k7R+NnzmAxNR/jmouz9uLJCpSzzpU
 2ah8Qb3UKDoDczpJoUrPhpShC+e8fjn9db11T5UjMPTY84XQ6M07m5jFDKv1dvXMOjiWN0wwdBq
 6yifJxaoq6uNquyBPbKPJYtta3B8jFCchNaU2uq+aiwp+ZB0057jMYakeGJlr4KxdHVHqexSwl5
 q/T6Wy2FyQXmRoAWeXVGi+gXbEf1NaD/ru2MWTfxmwvpNvjaEdwmG79J9+xts9NABHX4AycRtx5
 /ItFV3dumU0a1Dwl6y3jmgWx0idu3uzE80seTETDXmlTXVNGIg5OESm3Nbq/kdndxMRitDUj2YB
 2KAI29dJxCEO9K/YNdI1ol9sGrQbmciQewNCk/ilBqUqR1hmHiLiHMgR+CKcGrbkdWb4nJ5WF2D
 DLXfr+vrDi
X-Google-Smtp-Source: AGHT+IGD08I50soJcdL+xzw0QhupyvnNGdXij4KQgDOgK8/wl2+Is9lHSt1ytu+E7hNdpFYZDBEOMA==
X-Received: by 2002:a05:6a00:1d12:b0:7b8:16af:3bbc with SMTP id
 d2e1a72fcca58-7ff650ce054mr9986499b3a.31.1766391769458; 
 Mon, 22 Dec 2025 00:22:49 -0800 (PST)
Received: from frodo ([2404:4400:417e:3d00:8b90:7f55:1261:772f])
 by smtp.googlemail.com with ESMTPSA id
 d2e1a72fcca58-7ff7e493123sm9540699b3a.50.2025.12.22.00.22.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Dec 2025 00:22:49 -0800 (PST)
From: Jim Cromie <jim.cromie@gmail.com>
To: linux-kernel@vger.kernel.org, jbaron@akamai.com,
 gregkh@linuxfoundation.org, ukaszb@chromium.org, louis.chauvet@bootlin.com
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gvt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 daniel.vetter@ffwll.ch, tvrtko.ursulin@linux.intel.com,
 jani.nikula@intel.com, ville.syrjala@linux.intel.com,
 seanpaul@chromium.org, robdclark@gmail.com, groeck@google.com,
 yanivt@google.com, bleung@google.com, quic_saipraka@quicinc.com,
 will@kernel.org, catalin.marinas@arm.com, quic_psodagud@quicinc.com,
 maz@kernel.org, arnd@arndb.de, linux-arm-kernel@lists.infradead.org,
 linux-arm-msm@vger.kernel.org, mingo@redhat.com, jim.cromie@gmail.com
Subject: [PATCH v7 08/31] dyndbg: drop NUM_TYPE_ARRAY
Date: Mon, 22 Dec 2025 21:20:25 +1300
Message-ID: <20251222082049.1782440-9-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251222082049.1782440-3-jim.cromie@gmail.com>
References: <20251222082049.1782440-3-jim.cromie@gmail.com>
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

