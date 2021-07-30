Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 453733DB228
	for <lists+dri-devel@lfdr.de>; Fri, 30 Jul 2021 06:16:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 709306F3B5;
	Fri, 30 Jul 2021 04:16:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com
 [IPv6:2607:f8b0:4864:20::631])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C98B6F3B5
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Jul 2021 04:16:08 +0000 (UTC)
Received: by mail-pl1-x631.google.com with SMTP id e21so9541850pla.5
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Jul 2021 21:16:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=sNpsX16ewG1iiORmtZLS9PvQb+EIL7dKmm9U42mmA8Q=;
 b=Ud7pUpMBgAV45KErEo5arYi0ZcWV1YkNk6F+QLPSB30bGRKkONHEmqIRmG2KMw2Azu
 kVhstTDTB5rjbdYv9QPkLWm+Rv1i1WwKTb7RvgVzPu5mkfgNZF20GrQi+jAVE5f3+azw
 oMPXalcmC0aS0bc8T7aHFlZKblk/EC7SyVGAHOTjrc9rXv9ddnfTK5dDuTYK+eSIwlPz
 uCrh5ASccN6GsO8hrS+WeI5tu9+Ra1jfnSg+dqn/oZBjIbgVW+lbnuOIJcEBG1TeB/g3
 8fqUS5eZXhV41aBF5xyk4RcX7dLEPjYXcR1TsbCCREqiAStlfropXNwTEa2dJCERam7V
 Py9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=sNpsX16ewG1iiORmtZLS9PvQb+EIL7dKmm9U42mmA8Q=;
 b=N2R0GcLa6kK6Jo4+YXM7jt/d29bK3nZ1/Jt9fVARlf5OY3Jh7tLckOdDGJrSyfNWx8
 WGpnfDM+hsHbG8fenBk0vE9BRydakCTgKtIcj+7faufS4RC1BuPIZut5+jMNoZgtwSkp
 WLgt4Bq68fuitnXRles2tluytpS8gNqWvgWwkf1MSlMc2OZ33Wf0xiMvoJZMFtdNsZNW
 EKOGsSbzybjiIVQc9WBnphkPf4jtoNXwFvDzj1rb7eWf8dR9+nCreE2reZ4kCpnkKr6w
 KLr+xOOba01wJCZdMZWv4q0WxPS9QTUwi3MkKfvBWIPGGRs1vGnZyLQivDHgWhpoaxoI
 VFvw==
X-Gm-Message-State: AOAM531tgmvYg1AaPKvTs52ujABqmht/4BEA5Wq6d9nBJGsn/ka1DCGz
 1YooCQbuCUA/xmxGO2zgAlw=
X-Google-Smtp-Source: ABdhPJy+yWGhf7xYZLTwb/KaVBrcXdWzABuAHT54038pNIzOFNYsKZwvgkD1vj1A8p77hKqIWyKIFA==
X-Received: by 2002:a63:dc15:: with SMTP id s21mr505834pgg.281.1627618567842; 
 Thu, 29 Jul 2021 21:16:07 -0700 (PDT)
Received: from localhost.localdomain ([118.200.190.93])
 by smtp.gmail.com with ESMTPSA id t19sm439322pfg.216.2021.07.29.21.16.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Jul 2021 21:16:07 -0700 (PDT)
From: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@linux.ie, daniel@ffwll.ch, peterz@infradead.org, mingo@redhat.com,
 will@kernel.org, longman@redhat.com, boqun.feng@gmail.com
Subject: [PATCH 1/2] locking/lockdep: Provide lockdep_assert{, _once}() helpers
Date: Fri, 30 Jul 2021 12:15:14 +0800
Message-Id: <20210730041515.1430237-2-desmondcheongzx@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210730041515.1430237-1-desmondcheongzx@gmail.com>
References: <20210730041515.1430237-1-desmondcheongzx@gmail.com>
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
Cc: gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, skhan@linuxfoundation.org,
 Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>,
 linux-kernel-mentees@lists.linuxfoundation.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Peter Zijlstra <peterz@infradead.org>

Extract lockdep_assert{,_once}() helpers to more easily write composite
assertions like, for example:

	lockdep_assert(lockdep_is_held(&drm_device.master_mutex) ||
		       lockdep_is_held(&drm_file.master_lookup_lock));

Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
Signed-off-by: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
---
 include/linux/lockdep.h | 41 +++++++++++++++++++++--------------------
 1 file changed, 21 insertions(+), 20 deletions(-)

diff --git a/include/linux/lockdep.h b/include/linux/lockdep.h
index 5cf387813754..9fe165beb0f9 100644
--- a/include/linux/lockdep.h
+++ b/include/linux/lockdep.h
@@ -306,31 +306,29 @@ extern void lock_unpin_lock(struct lockdep_map *lock, struct pin_cookie);
 
 #define lockdep_depth(tsk)	(debug_locks ? (tsk)->lockdep_depth : 0)
 
-#define lockdep_assert_held(l)	do {					\
-		WARN_ON(debug_locks &&					\
-			lockdep_is_held(l) == LOCK_STATE_NOT_HELD);	\
-	} while (0)
+#define lockdep_assert(cond)		\
+	do { WARN_ON(debug_locks && !(cond)); } while (0)
 
-#define lockdep_assert_not_held(l)	do {				\
-		WARN_ON(debug_locks &&					\
-			lockdep_is_held(l) == LOCK_STATE_HELD);		\
-	} while (0)
+#define lockdep_assert_once(cond)	\
+	do { WARN_ON_ONCE(debug_locks && !(cond)); } while (0)
 
-#define lockdep_assert_held_write(l)	do {			\
-		WARN_ON(debug_locks && !lockdep_is_held_type(l, 0));	\
-	} while (0)
+#define lockdep_assert_held(l)		\
+	lockdep_assert(lockdep_is_held(l) != LOCK_STATE_NOT_HELD)
 
-#define lockdep_assert_held_read(l)	do {				\
-		WARN_ON(debug_locks && !lockdep_is_held_type(l, 1));	\
-	} while (0)
+#define lockdep_assert_not_held(l)	\
+	lockdep_assert(lockdep_is_held(l) != LOCK_STATE_HELD)
 
-#define lockdep_assert_held_once(l)	do {				\
-		WARN_ON_ONCE(debug_locks && !lockdep_is_held(l));	\
-	} while (0)
+#define lockdep_assert_held_write(l)	\
+	lockdep_assert(lockdep_is_held_type(l, 0))
 
-#define lockdep_assert_none_held_once()	do {				\
-		WARN_ON_ONCE(debug_locks && current->lockdep_depth);	\
-	} while (0)
+#define lockdep_assert_held_read(l)	\
+	lockdep_assert(lockdep_is_held_type(l, 1))
+
+#define lockdep_assert_held_once(l)		\
+	lockdep_assert_once(lockdep_is_held(l) != LOCK_STATE_NOT_HELD)
+
+#define lockdep_assert_none_held_once()		\
+	lockdep_assert_once(!current->lockdep_depth)
 
 #define lockdep_recursing(tsk)	((tsk)->lockdep_recursion)
 
@@ -407,6 +405,9 @@ extern int lock_is_held(const void *);
 extern int lockdep_is_held(const void *);
 #define lockdep_is_held_type(l, r)		(1)
 
+#define lockdep_assert(c)			do { } while (0)
+#define lockdep_assert_once(c)			do { } while (0)
+
 #define lockdep_assert_held(l)			do { (void)(l); } while (0)
 #define lockdep_assert_not_held(l)		do { (void)(l); } while (0)
 #define lockdep_assert_held_write(l)		do { (void)(l); } while (0)
-- 
2.25.1

