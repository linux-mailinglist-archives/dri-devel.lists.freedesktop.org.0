Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E757AB5220
	for <lists+dri-devel@lfdr.de>; Tue, 13 May 2025 12:23:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C1C0810E57C;
	Tue, 13 May 2025 10:23:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from invmail4.hynix.com (exvmail4.skhynix.com [166.125.252.92])
 by gabe.freedesktop.org (Postfix) with ESMTP id A77DE10E568
 for <dri-devel@lists.freedesktop.org>; Tue, 13 May 2025 10:23:23 +0000 (UTC)
X-AuditID: a67dfc5b-681ff7000002311f-6e-682319f3d65e
From: Byungchul Park <byungchul@sk.com>
To: linux-kernel@vger.kernel.org
Cc: kernel_team@skhynix.com, torvalds@linux-foundation.org,
 damien.lemoal@opensource.wdc.com, linux-ide@vger.kernel.org,
 adilger.kernel@dilger.ca, linux-ext4@vger.kernel.org, mingo@redhat.com,
 peterz@infradead.org, will@kernel.org, tglx@linutronix.de,
 rostedt@goodmis.org, joel@joelfernandes.org, sashal@kernel.org,
 daniel.vetter@ffwll.ch, duyuyang@gmail.com, johannes.berg@intel.com,
 tj@kernel.org, tytso@mit.edu, willy@infradead.org, david@fromorbit.com,
 amir73il@gmail.com, gregkh@linuxfoundation.org, kernel-team@lge.com,
 linux-mm@kvack.org, akpm@linux-foundation.org, mhocko@kernel.org,
 minchan@kernel.org, hannes@cmpxchg.org, vdavydov.dev@gmail.com,
 sj@kernel.org, jglisse@redhat.com, dennis@kernel.org, cl@linux.com,
 penberg@kernel.org, rientjes@google.com, vbabka@suse.cz, ngupta@vflare.org,
 linux-block@vger.kernel.org, josef@toxicpanda.com,
 linux-fsdevel@vger.kernel.org, jack@suse.cz, jlayton@kernel.org,
 dan.j.williams@intel.com, hch@infradead.org, djwong@kernel.org,
 dri-devel@lists.freedesktop.org, rodrigosiqueiramelo@gmail.com,
 melissa.srw@gmail.com, hamohammed.sa@gmail.com, harry.yoo@oracle.com,
 chris.p.wilson@intel.com, gwan-gyeong.mun@intel.com,
 max.byungchul.park@gmail.com, boqun.feng@gmail.com, longman@redhat.com,
 yskelg@gmail.com, yunseong.kim@ericsson.com, yeoreum.yun@arm.com,
 netdev@vger.kernel.org, matthew.brost@intel.com, her0gyugyu@gmail.com
Subject: [PATCH v15 43/43] dept: call dept_hardirqs_off() in local_irq_*()
 regardless of irq state
Date: Tue, 13 May 2025 19:07:30 +0900
Message-Id: <20250513100730.12664-44-byungchul@sk.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20250513100730.12664-1-byungchul@sk.com>
References: <20250513100730.12664-1-byungchul@sk.com>
X-Brightmail-Tracker: H4sIAAAAAAAAAzWSW0xTaRSF+f9zK9XKSb0d1HjpSDR4xajZkwxqMonz+2AyUTMPo4ke5Wgr
 V4simEjogAZBCDgDjVycUpjSQLlYTASlihAQRAG1IhJAQTFUihiwpQjoFIwvOyvf2mvtly2j
 lM3MMpkm4qykjRDDVKyclo/ML9g07v+Teuvjxg3g+pxMQ16FhYWO8lIElls6DI7G3+Cl24lg
 6kk7BfqsDgQF/b0U3GrqQ2Az/8XC83cLwO4aZaElK5WFxMIKFp4OT2Poyb6GodS6H16b3tPQ
 mmHEoHewkKtPxN4xhGHSVMKBKSEABsw5HEz3B0FLXycDtu4NcP1GDwu1thYamqoHMDy/k8dC
 n+UbA61NzTS405dDR2YaA2UfjSwMu00UmFyjHDyrM2BoMiyByiRv4eXxrww8TKvDcLnoJgb7
 q7sI7iW/wWC1dLLQ4HJiqLJmUfCluBHBQPoIB5euTnKQq0tHkHopm4aknh0w5fFezv8cBLp/
 K2kom+lEe4KJ5YYFkQbnKEWSqs6TL64XLLG5DTR5ZBRITU4vR5LudXPEYD1HqsyBpLDWgUnB
 mIsh1pIrLLGOXeNIyogdk49tbdzvK/6U/xIihWliJO2WXcfk6v72QRyl84t9O+niEtDIvBTk
 KxP47YIz8yvzQw8WDONZzfLrhK6uSWpWL+JXC1Vp7707chnFd84TXua/QrPGQv64UNQ3NRem
 +QDB6LHOBRT8TkFvv09/L10llFbWzXFfL58pbpvjSn6HkGEopWdLBf5vX+G/ijfU94C/8MDc
 RWcghQH5lCClJiImXNSEbd+sjovQxG4+ERluRd7/Ml2cPlyNxjoO1iNehlTzFc2ONWolI8ZE
 x4XXI0FGqRYpdLe9SBEixl2QtJFHtefCpOh6tFxGq5YqtrnPhyj5U+JZKVSSoiTtDxfLfJcl
 oCKz32Cau2Fo64d/YvSP0RFnfPvRjNvm0J89r9NX6JaqHMHB6xdPlLean6SKsa1lgZHjVyZ8
 svwPGgNWRi3+lHgg9NDeBYE5Z6ZnBu9PvLUcymcy/wj/JsYPVfvYi9UnN/oVxqXk1cR7ds+U
 rfUk55avFk9n13ssv9r2kcOgYYaiVHS0WgwKpLTR4v9PDQHqWwMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAAzWSa0iTYRTHe5736mz1tsTebpgLCZQuQsbBrkTSS1D4qSiKXPXSVrpiM80i
 cGlhmrICtTJrmkxxq9kmZRdNXG0zy1mulWGmVtLw1sVJ81JNoy+HH78/53++HJaQVVMLWJU6
 VdSoFclyWkJKdqzNWv5z/lLlql53OPhHcki4bjHT0HbHhMBcq8Pge7YV3o4OIBh/6SaguLAN
 QVnPBwJqHV0I6qvO0tD+eRZ4/MM0NBfm0ZB1y0LDq/4JDJ1FlzGYrNvho7GPhBZ9OYZiHw0l
 xVk4OL5iCBirGTBmRkFv1TUGJnpiobnLS4G9tJmC+vcxcPVGJw2P65tJcNT1Ymh/eJ2GLvMf
 ClocLhJGCxZC26V8Cm4PldPQP2okwOgfZuB1owGDwxAONdnB1vM/f1PgzG/EcL7iLgZPxyME
 DTndGKxmLw12/wAGm7WQgLHKZwh6CwYZOHcxwECJrgBB3rkiErI742D8V/By6Ugs6G7WkHB7
 0os2bRDMN8xIsA8ME0K2LV0Y87+hhfpRAyk8L+eFB9c+MEJ2w3tGMFhPCLaqaOHWYx8Wyn74
 KcFafYEWrD8uM0LuoAcLQ62tTOLiPZJ1h8RkVZqoWbkhSaLscX/Bx3WzT34K+JlMNBiai0JY
 nlvNfynrx1NMc8v4d+8CxBSHcUt4W34flYskLMF5Q/m3pR1oKpjLHeArusapKSa5KL78l3V6
 Qcqt4Ys9T8h/pRG8qaZx2ocE/WRl67SXcXG83mAi9UhiQDOqUZhKnZaiUCXHrdAeVWaoVSdX
 HDyWYkXBDzKembhUh0batzYhjkXymVKXL1IpoxRp2oyUJsSzhDxMqrsfVNJDioxToubYfs2J
 ZFHbhBaypHyedNsuMUnGHVakikdF8bio+Z9iNmRBJqpcNvFSt0a3c16dy9GoutfntK1vSYiP
 UEckvAqtTX+60Xl6bmfDi83606v5xMNG92tf3aRsUUJ3zEf07VRhIPJM+N5V+/6MHYzscMXE
 q2u2zDENuY+4LNvWl0WzOZbdbZaO31j3Iu/h0gsl8fYrTkV34rhnssLt7Cmyf5+dqk/3ykmt
 UhEbTWi0ir8OZ96uPQMAAA==
X-CFilter-Loop: Reflected
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

For dept to function properly, dept_task()->hardirqs_enabled must be set
correctly.  If it fails to set this value to false, for example, dept
may mistakenly think irq is still enabled even when it's not.

Do dept_hardirqs_off() regardless of irq state not to miss any
unexpected cases by any chance e.g. changes of the state by asm code.

Signed-off-by: Byungchul Park <byungchul@sk.com>
---
 include/linux/irqflags.h | 14 ++++++++++++++
 kernel/dependency/dept.c |  1 +
 2 files changed, 15 insertions(+)

diff --git a/include/linux/irqflags.h b/include/linux/irqflags.h
index d8b9cf093f83..586f5bad4da7 100644
--- a/include/linux/irqflags.h
+++ b/include/linux/irqflags.h
@@ -214,6 +214,13 @@ extern void warn_bogus_irq_restore(void);
 		raw_local_irq_disable();		\
 		if (!was_disabled)			\
 			trace_hardirqs_off();		\
+		/*					\
+		 * Just in case that C code has missed	\
+		 * trace_hardirqs_off() at the first	\
+		 * place e.g. disabling irq at asm code.\
+		 */					\
+		else					\
+			dept_hardirqs_off();		\
 	} while (0)
 
 #define local_irq_save(flags)				\
@@ -221,6 +228,13 @@ extern void warn_bogus_irq_restore(void);
 		raw_local_irq_save(flags);		\
 		if (!raw_irqs_disabled_flags(flags))	\
 			trace_hardirqs_off();		\
+		/*					\
+		 * Just in case that C code has missed	\
+		 * trace_hardirqs_off() at the first	\
+		 * place e.g. disabling irq at asm code.\
+		 */					\
+		else					\
+			dept_hardirqs_off();		\
 	} while (0)
 
 #define local_irq_restore(flags)			\
diff --git a/kernel/dependency/dept.c b/kernel/dependency/dept.c
index 50ba3e1c3fd5..9993222af73c 100644
--- a/kernel/dependency/dept.c
+++ b/kernel/dependency/dept.c
@@ -2258,6 +2258,7 @@ void noinstr dept_hardirqs_off(void)
 	 */
 	dept_task()->hardirqs_enabled = false;
 }
+EXPORT_SYMBOL_GPL(dept_hardirqs_off);
 
 void noinstr dept_update_cxt(void)
 {
-- 
2.17.1

