Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E10B8A2720D
	for <lists+dri-devel@lfdr.de>; Tue,  4 Feb 2025 13:48:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8549E10E339;
	Tue,  4 Feb 2025 12:48:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mblankhorst.nl (lankhorst.se [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A594C10E339;
 Tue,  4 Feb 2025 12:48:38 +0000 (UTC)
From: Maarten Lankhorst <dev@lankhorst.se>
To: intel-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Maarten Lankhorst <dev@lankhorst.se>, Ingo Molnar <mingo@kernel.org>,
 David Lechner <dlechner@baylibre.com>,
 Peter Zijlstra <peterz@infradead.org>, Will Deacon <will@kernel.org>,
 Waiman Long <longman@redhat.com>, Boqun Feng <boqun.feng@gmail.com>
Subject: [PATCH 1/8] header/cleanup.h: Add _init_args to
 DEFINE_LOCK_GUARD_1(_COND)
Date: Tue,  4 Feb 2025 13:49:02 +0100
Message-ID: <20250204124909.158315-2-dev@lankhorst.se>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250204124909.158315-1-dev@lankhorst.se>
References: <20250204124909.158315-1-dev@lankhorst.se>
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

This makes it possible to use the lock guards for guards that need
extra arguments.

I've been attempting to add a guard to xe_force_wake handling, but that
required an extra argument specifying the domain. For nested spinlock
handling, it could also be beneficial to be able to do something like
this.

For example:
DEFINE_LOCK_GUARD_1_COND(spinlock_irqsave, _nested,
			 spin_lock_irqsave_nested(_T->lock, _T->flags, nest),
			 unsigned nest);

guard(spinlock_irqsave_nested, &lock, SINGLE_DEPTH_NESTING);

The first optional argument in DEFINE_LOCK_GUARD_1 is now used for the struct members,
the remainder goes to init_args to allow the same usage in the base case..

I'm abusing the preprocessor to add an extra meaning to the first optional
argument is done by creating a __DO_DEFINE_LOCK_GUARD_1, and passing
__VA_ARGS__ not ##__VA_ARGS__ to it to ensure _struct_members is empty
when not passed explicitly.

Cc: Ingo Molnar <mingo@kernel.org>
Cc: David Lechner <dlechner@baylibre.com>
Cc: Peter Zijlstra <peterz@infradead.org>
Cc: Will Deacon <will@kernel.org>
Cc: Waiman Long <longman@redhat.com>
Cc: Boqun Feng <boqun.feng@gmail.com>
---
 include/linux/cleanup.h | 30 +++++++++++++++++++-----------
 1 file changed, 19 insertions(+), 11 deletions(-)

diff --git a/include/linux/cleanup.h b/include/linux/cleanup.h
index ec00e3f7af2b3..dbaf02447f206 100644
--- a/include/linux/cleanup.h
+++ b/include/linux/cleanup.h
@@ -349,19 +349,23 @@ _label:									\
  * locks that don't have a native type (eg. RCU, preempt) or those that need a
  * 'fat' pointer (eg. spin_lock_irqsave).
  *
- * DEFINE_LOCK_GUARD_0(name, lock, unlock, ...)
- * DEFINE_LOCK_GUARD_1(name, type, lock, unlock, ...)
- * DEFINE_LOCK_GUARD_1_COND(name, ext, condlock)
+ * DEFINE_LOCK_GUARD_0(name, lock, unlock, _lock_members...)
+ * DEFINE_LOCK_GUARD_1(name, type, lock, unlock, (opt)_lock_members, _init_args...)
+ * DEFINE_LOCK_GUARD_1_COND(name, ext, condlock, _init_args...)
  *
  * will result in the following type:
  *
  *   typedef struct {
  *	type *lock;		// 'type := void' for the _0 variant
- *	__VA_ARGS__;
+ *	_lock_members;		// use ; as separator to add multiple members
  *   } class_##name##_t;
  *
  * As above, both _lock and _unlock are statements, except this time '_T' will
  * be a pointer to the above struct.
+ *
+ * For DEFINE_LOCK_GUARD_1 and DEFINE_LOCK_GUARD_1_COND, it adds all
+ * _init_args as local variables available to the lock statement.
+ * They need to be passed to all guard() functions as extra argument.
  */
 
 #define __DEFINE_UNLOCK_GUARD(_name, _type, _unlock, ...)		\
@@ -381,8 +385,8 @@ static inline void *class_##_name##_lock_ptr(class_##_name##_t *_T)	\
 }
 
 
-#define __DEFINE_LOCK_GUARD_1(_name, _type, _lock)			\
-static inline class_##_name##_t class_##_name##_constructor(_type *l)	\
+#define __DEFINE_LOCK_GUARD_1(_name, _type, _lock, ...)			\
+static inline class_##_name##_t class_##_name##_constructor(_type *l, ##__VA_ARGS__)	\
 {									\
 	class_##_name##_t _t = { .lock = l }, *_T = &_t;		\
 	_lock;								\
@@ -398,23 +402,27 @@ static inline class_##_name##_t class_##_name##_constructor(void)	\
 	return _t;							\
 }
 
-#define DEFINE_LOCK_GUARD_1(_name, _type, _lock, _unlock, ...)		\
+#define __DO_DEFINE_LOCK_GUARD_1(_name, _type, _lock, _unlock, _lock_members, _init_args...) \
 __DEFINE_CLASS_IS_CONDITIONAL(_name, false);				\
-__DEFINE_UNLOCK_GUARD(_name, _type, _unlock, __VA_ARGS__)		\
-__DEFINE_LOCK_GUARD_1(_name, _type, _lock)
+__DEFINE_UNLOCK_GUARD(_name, _type, _unlock, _lock_members)		\
+__DEFINE_LOCK_GUARD_1(_name, _type, _lock, ##_init_args)
+
+/* Call __DO_DEFINE_LOCK_GUARD_1 here because of the 2 optional arguments */
+#define DEFINE_LOCK_GUARD_1(_name, _type, _lock, _unlock, ...)		\
+	__DO_DEFINE_LOCK_GUARD_1(_name, _type, _lock, _unlock, __VA_ARGS__)
 
 #define DEFINE_LOCK_GUARD_0(_name, _lock, _unlock, ...)			\
 __DEFINE_CLASS_IS_CONDITIONAL(_name, false);				\
 __DEFINE_UNLOCK_GUARD(_name, void, _unlock, __VA_ARGS__)		\
 __DEFINE_LOCK_GUARD_0(_name, _lock)
 
-#define DEFINE_LOCK_GUARD_1_COND(_name, _ext, _condlock)		\
+#define DEFINE_LOCK_GUARD_1_COND(_name, _ext, _condlock, ...)		\
 	__DEFINE_CLASS_IS_CONDITIONAL(_name##_ext, true);		\
 	EXTEND_CLASS(_name, _ext,					\
 		     ({ class_##_name##_t _t = { .lock = l }, *_T = &_t;\
 		        if (_T->lock && !(_condlock)) _T->lock = NULL;	\
 			_t; }),						\
-		     typeof_member(class_##_name##_t, lock) l)		\
+		     typeof_member(class_##_name##_t, lock) l, ##__VA_ARGS__)		\
 	static inline void * class_##_name##_ext##_lock_ptr(class_##_name##_t *_T) \
 	{ return class_##_name##_lock_ptr(_T); }
 
-- 
2.47.1

