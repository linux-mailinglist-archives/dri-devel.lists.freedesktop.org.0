Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E2C093DC4FB
	for <lists+dri-devel@lfdr.de>; Sat, 31 Jul 2021 10:26:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 29C7D6E5CE;
	Sat, 31 Jul 2021 08:26:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com
 [IPv6:2607:f8b0:4864:20::102a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F25FA6E5CE
 for <dri-devel@lists.freedesktop.org>; Sat, 31 Jul 2021 08:26:56 +0000 (UTC)
Received: by mail-pj1-x102a.google.com with SMTP id
 pj14-20020a17090b4f4eb029017786cf98f9so7125207pjb.2
 for <dri-devel@lists.freedesktop.org>; Sat, 31 Jul 2021 01:26:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=nd7PzJX7+jqe7frYn0qs43GsaGl8y9GB3YlzBIkjvSg=;
 b=In1GBHETrUvRO4qRIm5DeTr9wI4tS2t8opQEALIP1jBGe5Hu90iJag5PLov6HIl1u3
 PsaE8ivBkT4IPi1OBmBP9lkMKhJM5IySeGgBbhAmYeYBqDAXkZyOfrRbYJ7bUOCGYubO
 2h1ukuENnKKN88E5Gjv1NNTiWDiEdqPFzUIKvb0U3bB9CkChgYkQPBNSUZ2u1hMLPTpT
 EV/v/VKQe6tVFygm/++UjyeifcIF0XfeLUMQlRSCL/lDd/q2v2WMaeBqXjfSPpcN585/
 VEhCZwXYxH0vyppwdU0adJ6agqAk6Ia8+tg5zR4hoW81+xyc2Tanpp52FQZ5UPt3WC1i
 Xzfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=nd7PzJX7+jqe7frYn0qs43GsaGl8y9GB3YlzBIkjvSg=;
 b=O4oD5K2Q9tIYsucaniB31N0l+MqlOBQyVvuV+dsxPzXJf2tEebQgoddyJR61BN044B
 vybbOe1ZX/9JmGajqZ76zTxJlMrmLNQy2Jnfcw119aFclQ4M9gfgnp8CHlNWpRV6jfCf
 aOoTo3UNSE5wKeZRu7zL7MVpiFjesVAUTMVn3dtPVmE50JEyvLRpvoZSe8SqPsF7j+kW
 d6YXSkvRdk8qedoHWGmw2WwGBz9RVZjDZ5qwsU0u6GzGnLGkhG51TK2Saeoc0GpUm72/
 3/SsY1Lg9L15+yyE3MMDLrpCp9+agnByldlq2FnPo7xGdA4SuqqSgoVOLMSg9GtFewkd
 wwdQ==
X-Gm-Message-State: AOAM531/w6ls5MA7avtNFHe83Hx6TzsVFXMmJuG18VOqvWhDGqj+FtM0
 4L6cRXxY4Li2MxwoUbHNWJg=
X-Google-Smtp-Source: ABdhPJzGSOgepM9aYsge5ies+HiLoHnc7FISxhflo7Hd7sFszNH59EM+CFVFwjB6wvaZmoFx1t/XFw==
X-Received: by 2002:a63:4b0a:: with SMTP id y10mr5827758pga.437.1627720016657; 
 Sat, 31 Jul 2021 01:26:56 -0700 (PDT)
Received: from localhost.localdomain ([118.200.190.93])
 by smtp.gmail.com with ESMTPSA id mq7sm3182124pjb.50.2021.07.31.01.26.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 31 Jul 2021 01:26:56 -0700 (PDT)
From: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@linux.ie, daniel@ffwll.ch, peterz@infradead.org, mingo@redhat.com,
 will@kernel.org, longman@redhat.com, boqun.feng@gmail.com
Cc: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 skhan@linuxfoundation.org, gregkh@linuxfoundation.org,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [PATCH v2 1/2] locking/lockdep: Provide lockdep_assert{,
 _once}() helpers
Date: Sat, 31 Jul 2021 16:24:57 +0800
Message-Id: <20210731082458.1962043-2-desmondcheongzx@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210731082458.1962043-1-desmondcheongzx@gmail.com>
References: <20210731082458.1962043-1-desmondcheongzx@gmail.com>
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

From: Peter Zijlstra <peterz@infradead.org>

Extract lockdep_assert{,_once}() helpers to more easily write composite
assertions like, for example:

	lockdep_assert(lockdep_is_held(&drm_device.master_mutex) ||
		       lockdep_is_held(&drm_file.master_lookup_lock));

Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
Signed-off-by: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
Acked-by: Boqun Feng <boqun.feng@gmail.com>
Acked-by: Waiman Long <longman@redhat.com>
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

