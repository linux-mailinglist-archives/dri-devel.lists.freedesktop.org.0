Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 26C8283A958
	for <lists+dri-devel@lfdr.de>; Wed, 24 Jan 2024 13:15:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F1C9F10F6E6;
	Wed, 24 Jan 2024 12:15:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from invmail4.hynix.com (exvmail4.skhynix.com [166.125.252.92])
 by gabe.freedesktop.org (Postfix) with ESMTP id 3506F10F731
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Jan 2024 12:15:11 +0000 (UTC)
X-AuditID: a67dfc5b-d85ff70000001748-96-65b0fbb71d9f
From: Byungchul Park <byungchul@sk.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v11 21/26] dept: Apply timeout consideration to dma fence wait
Date: Wed, 24 Jan 2024 20:59:32 +0900
Message-Id: <20240124115938.80132-22-byungchul@sk.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20240124115938.80132-1-byungchul@sk.com>
References: <20240124115938.80132-1-byungchul@sk.com>
X-Brightmail-Tracker: H4sIAAAAAAAAAzWSa0hTYRjHfc/lPcfV6jCDjkkUC+lGF8vqKSKMiA5EVgR9KKhGHtpom7GZ
 lyCynGUru9G0UsIba23q1lZppaKWlxXlylVLVNTsIs0L1iybXTajLw8/nj/P7/nyZ0nZQ3oW
 q9KmiDqtQi3HEkoyOLV4SVXQIS63d8XD5fPLIfAth4JCezkGT6UNQfndkwQMNG2Bt2N+BMHn
 bSTkmzwIinu7SLjb3I2g1nIKQ3v/NPAGhjG4TecwZJXaMbz8MkFAZ94VAmzObfDsUgkB9eOf
 KMgfwFCQn0WExmcCxs1WBsyZsdBnucHARG8cuLvf0FDbsRiu3+zEUFPrpqC5uo+A9oeFGLrL
 /9DwrLmVAs/lXBoqhkowfBkzk2AODDPwqr6IAIchJDr99TcNLbn1BJwuu0OA990jBHU5PQQ4
 y99geBzwE+Bymkj4easJQd+FQQayz48zUHDyAoJz2XkUtP1qocHQuQqCPwpxwjrhsX+YFAyu
 NKF2rIgSnpbwwoMbXYxgqOtghCLnUcFlWSSU1gwQQvFogBac1rNYcI5eYQTjoJcQhl68YITW
 a0FK6PfmEzti9kjWJ4lqVaqoW7bhgET5/X0WPtLOprc6fEwmsjFGxLI8F8+73XojipzEJ/d6
 UJgxN5/3+cbJMM/g5vKu3I+0EUlYkjszhbeMPMfhIIpL5PsfVTJhprhY/laVcZKl3Gq+zV6F
 /0nn8DZH/aQoMrSvuN5BhVnGreJ7rBeZsJTnsiL5lroK5t9BNN9g8VGXkLQIRViRTKVN1ShU
 6vilygytKn3pwWSNE4UaZT4+sbcajXp2NSKORfKp0gSrXZTRilR9hqYR8SwpnyH1RVeKMmmS
 IuOYqEverzuqFvWNKIal5DOlK8bSkmTcIUWKeFgUj4i6/ynBRs7KDP3VyHcs2Bht28nlvf6g
 juVc8rnSxJjYvLW9tyOiMhwS//3NNpOv7aqRq5tH9hhGlE2qrXG2g56E5Ha5tvrqkvQ73aqh
 19qykU/K6R3WtJrsM8MNwYIu//a4lREbN605dsKkKUvZneRaeHP7h305SnaBN/HpfGlURe7M
 2T/TGoJySq9UxC0idXrFX55lJ+hNAwAA
X-Brightmail-Tracker: H4sIAAAAAAAAAzWSfUxNYRzHPc855zmnw7Wzq3HI2+7WWN5f4jfM/OcZ87bZbNh06Ex33cru
 JUJTbpIUsiUqltgtt6tu97KuXizFVd6KWq7kqjQ0qdCNlJfK/PPbZ9/vvp+/fgKjvcxNEfSR
 +1VjpGLQEZEVN640zysZtKsLf7VqIS1lIfj6kljILrIRqC8sQGC7FY+h88FaeNnfhWDwaR0D
 Gen1CK62vWHgltuLoCL/OIGGjvHQ6OshUJt+moD5WhGB55+GMLRcOI+hwLEBHp/LxVA58IGF
 jE4CWRlmPHw+YhiwWHmwxAVCe34mD0Nti6DW28RB9eVaDiqa58ClKy0EyitqWXC72jE0lGYT
 8Nr+cPDYXcNCfVoqBze7cwl86rcwYPH18PCiMgeDPWHYlvjtNwcPUysxJF4vxtD4qgzB3aRW
 DA5bE4FqXxcGpyOdgZ95DxC0n/nMw4mUAR6y4s8gOH3iAgt1vx5ykNASDIM/ssmalbS6q4eh
 Cc6DtKI/h6WPcmV6J/MNTxPuNvM0x3GAOvOD6LXyTkyvfvVx1GE9Rajj63meJn9uxLT72TOe
 1lwcZGlHYwbePHW7uCpUNeijVeOC1SFi2Pd3ZrKvQThUY/fwcaiAT0Z+giwtle/fbkUjTKRZ
 ssczwIywvzRTdqa+55KRKDDSybFyfu9TMlJMkDbKHWWFo2NWCpTzSpJHWSMtk+uKSsg/6Qy5
 wF45KvIbzm9eamZHWCsFy63Ws/w5JOagMVbkr4+MjlD0huD5pvCwmEj9ofl7oiIcaPhpLLFD
 aS7U17C2CkkC0o3TrLEWqVpOiTbFRFQhWWB0/hrP5EJVqwlVYg6rxqhdxgMG1VSFAgRWN0mz
 bpsaopX2KvvVcFXdpxr/t1jwmxKHnNM0mWjx+u4bnoDYHdO3rjfLb6fbEpcsvR872+WqEQ9v
 16Q8WeHK2wQHcVxV8OvFifdcEle4K2SH4SJDj7w8RjK9xe4toV9uiO5Vz3f3lcNcS8gc5DW3
 KeZjpX+ME53i7TvK0Z12T1tA9OtZ5uKgPuPy+KbAqEmhx8f39mQl6VhTmLIoiDGalL/cQIe1
 MAMAAA==
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
Cc: hamohammed.sa@gmail.com, hdanton@sina.com, jack@suse.cz,
 peterz@infradead.org, daniel.vetter@ffwll.ch, amir73il@gmail.com,
 david@fromorbit.com, dri-devel@lists.freedesktop.org, mhocko@kernel.org,
 linux-mm@kvack.org, linux-ide@vger.kernel.org, adilger.kernel@dilger.ca,
 chris.p.wilson@intel.com, joel@joelfernandes.org, 42.hyeyoo@gmail.com,
 cl@linux.com, will@kernel.org, duyuyang@gmail.com, sashal@kernel.org,
 her0gyugyu@gmail.com, kernel_team@skhynix.com,
 damien.lemoal@opensource.wdc.com, willy@infradead.org, hch@infradead.org,
 mingo@redhat.com, djwong@kernel.org, vdavydov.dev@gmail.com,
 rientjes@google.com, dennis@kernel.org, linux-ext4@vger.kernel.org,
 ngupta@vflare.org, johannes.berg@intel.com, boqun.feng@gmail.com,
 dan.j.williams@intel.com, josef@toxicpanda.com, rostedt@goodmis.org,
 gwan-gyeong.mun@intel.com, linux-block@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, jglisse@redhat.com, viro@zeniv.linux.org.uk,
 longman@redhat.com, tglx@linutronix.de, vbabka@suse.cz, melissa.srw@gmail.com,
 sj@kernel.org, tytso@mit.edu, rodrigosiqueiramelo@gmail.com,
 kernel-team@lge.com, gregkh@linuxfoundation.org, jlayton@kernel.org,
 penberg@kernel.org, minchan@kernel.org, max.byungchul.park@gmail.com,
 hannes@cmpxchg.org, tj@kernel.org, akpm@linux-foundation.org,
 torvalds@linux-foundation.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Now that CONFIG_DEPT_AGGRESSIVE_TIMEOUT_WAIT was introduced, apply the
consideration to dma fence wait.

Signed-off-by: Byungchul Park <byungchul@sk.com>
---
 drivers/dma-buf/dma-fence.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/dma-buf/dma-fence.c b/drivers/dma-buf/dma-fence.c
index 76dba11f0dab..95121cbcc6b5 100644
--- a/drivers/dma-buf/dma-fence.c
+++ b/drivers/dma-buf/dma-fence.c
@@ -784,7 +784,7 @@ dma_fence_default_wait(struct dma_fence *fence, bool intr, signed long timeout)
 	cb.task = current;
 	list_add(&cb.base.node, &fence->cb_list);
 
-	sdt_might_sleep_start(NULL);
+	sdt_might_sleep_start_timeout(NULL, timeout);
 	while (!test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &fence->flags) && ret > 0) {
 		if (intr)
 			__set_current_state(TASK_INTERRUPTIBLE);
@@ -888,7 +888,7 @@ dma_fence_wait_any_timeout(struct dma_fence **fences, uint32_t count,
 		}
 	}
 
-	sdt_might_sleep_start(NULL);
+	sdt_might_sleep_start_timeout(NULL, timeout);
 	while (ret > 0) {
 		if (intr)
 			set_current_state(TASK_INTERRUPTIBLE);
-- 
2.17.1

