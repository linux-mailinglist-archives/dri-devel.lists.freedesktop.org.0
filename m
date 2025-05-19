Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CC555ABB890
	for <lists+dri-devel@lfdr.de>; Mon, 19 May 2025 11:19:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2775210E360;
	Mon, 19 May 2025 09:18:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from invmail4.hynix.com (exvmail4.hynix.com [166.125.252.92])
 by gabe.freedesktop.org (Postfix) with ESMTP id 862E210E2E2
 for <dri-devel@lists.freedesktop.org>; Mon, 19 May 2025 09:18:50 +0000 (UTC)
X-AuditID: a67dfc5b-669ff7000002311f-e7-682af770348a
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
Subject: [PATCH v16 34/42] dept: make dept stop from working on
 debug_locks_off()
Date: Mon, 19 May 2025 18:18:18 +0900
Message-Id: <20250519091826.19752-35-byungchul@sk.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20250519091826.19752-1-byungchul@sk.com>
References: <20250519091826.19752-1-byungchul@sk.com>
X-Brightmail-Tracker: H4sIAAAAAAAAAzWSWUxTeRTG+d+dSic3dbsgZpwmxhGjiII5JqMxPuj1wcTlwUQn4zRytdVS
 sWWdiRlQIFAWHSISELBUU5tSEG95wKUEQYqViBVqLQRQGjUiIA7Yjmxqi/py8sv58n3nezgM
 LuskoxiVJkXQahRqOSUhJOMRtevP/B+j3NhVxYD/Yz4BVTetFLga6hBYm7IxGOnYDc8DYwhm
 Hz/BobzMhaB2eBCHJscQArv5HAW9r34Ct3+CAmdZIQXnr92k4OnoHAYDl0sxqBP3wgvTGwK6
 LhoxKB+h4Er5eSw43mIwbbLQYMpaDT5zJQ1zw3HgHPKQYO9fBxU1AxTcszsJcDT7MOi9U0XB
 kPULCV2OhwQESlaA699iEurfGykYDZhwMPknaOhpNWDgMCyDxpxgYN7UZxI6i1sxyLt+CwN3
 310ELfkvMRCtHgra/WMY2MQyHGZudCDwlYzTkFs0TcOV7BIEhbmXCcgZSIDZT8HL1R/jIPtq
 IwH18x60YxtvrbEivn1sAudzbOn8jP8ZxdsDBoJ/ZOT425WDNJ/T0k/zBjGVt5lj+Gv3RjC+
 dtJP8qKlgOLFyVKa14+7Mf59dze9L/qw5LdEQa1KE7Sx2/+UKN9VfiCSh6UZ870rs1D1Ij0K
 Zzg2npvNm6d+8JQ+Fwsxxa7hvN5pPMRL2FWcrfgNqUcSBmc9i7jn1X0oJCxm93Men2PBQLCr
 OYv+MxliKbuF+9JThX8L/Zmra2xd4PDgvr+wfcErYxM4d10NEQrl2PJwrmXQ+r1FJHff7CUu
 IqkBhVmQTKVJS1Ko1PEblJkaVcaGY6eTRBR8L9PZuSPNaNJ1sA2xDJJHSBvta5UyUpGmy0xq
 QxyDy5dILbZflTJpoiLzL0F7+qg2VS3o2tAKhpAvl24KpCfK2BOKFOGUICQL2h8qxoRHZaGj
 1wl7lq7i7476PfPp1KqNkQVJYZJY99s1LbuTXx84MBP2T3TU1DZNfP2FzM5Tx5tjFaUdK0vG
 JgsN6gzjpz7XpV/O/Bd2yDnqPBHpS0XdYsrOPZsaHphnSyVbHvZsfb155uklnddYlL+fqVA9
 Pnls6UjTH7sSxOQbTQ2CV7qsOfV3OaFTKuJicK1O8RVrPZl9WgMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAAzWSfUzMcRzHfb+/p+ty9nMav7GG2zyF9KB8NoQZfmwM/9jM6OjH3XrQ7hJF
 VirLpYapJl2uh51ch9w183QtnTuSTpQr7YoaJuVKdRGFK/PPe6+933u/P/98RIT0BjVbpIxL
 EFRx8hgZLSbFO1anL4//HqAIGrfMA89wFglFt400NN2qRGCsTsPQY9sCrSN9CH41viSgIK8J
 QUlXBwHV9k4EloozNDR/mAYtnn4a6vOyaUgvu03Dq94xDK78SxgqTdvhnf4TCQ0XSjEU9NBw
 tSAde+UzhlG9gQF96gLorihkYKwrGOo7nRRYtfUUWNqXwpViFw2PLPUk2O91Y2h+UERDp/EP
 BQ32ZySM5M6Bpos5FNx0l9LQO6InQO/pZ+B1rQ6DXTcTqjK8q2eHflPwNKcWw9nyOxha3j5E
 UJP1HoPJ6KTB6unDYDblEfDzug1Bd+5XBjLPjzJwNS0XQXZmPgkZrjD49cN7WTscDGnXqki4
 Oe5E6yN4Y7ER8da+foLPMB/nf3re0LxlREfyz0s5/n5hB8Nn1LQzvM50jDdXBPBlj3owXzLo
 oXiT4RzNmwYvMbzmawvm3Q4Hs9N/r3hNlBCjTBRUKyIixYovhQNkfJfkxHizfyrS+mqQj4hj
 V3JDmkw8wTS7iGtrGyUm2I+dx5lzPlEaJBYRrNOXa9W+RRPBDHYX5+y2TxZIdgFn0PymJljC
 hnN/XhcR/0bncpVVtZPs4/Xbs62TXSkbxrVUFpMXkFiHphiQnzIuMVaujAkLVEcrkuKUJwIP
 HY01Ie8D6VPGLt5Dw81b6hArQrKpkirLEoWUkieqk2LrECciZH4Sg3mxQiqJkiclC6qjB1TH
 YgR1HZojImWzJNv2CJFS9og8QYgWhHhB9T/FIp/ZqSizcbfOVxO4Kbzjo/+M6s3JobZlG5Nt
 Dsv16h8py4K+v48+GPx4E+MOLz/n6FrljtCcyXct7D2s7awNWbJirXTfyT0D4lPv1tVsbbyh
 YLQrD8jnS5+0Octxlj1oKMQWNXh51ovTGxa7pftddw/7JBxUh5bEJz5cFOng1kRt/madHm6U
 kWqFPDiAUKnlfwGM1sM4PAMAAA==
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

For many reasons, debug_locks_off() is called to stop lock debuging
feature e.g. on panic().  dept should also stop it in the conditions.

Signed-off-by: Byungchul Park <byungchul@sk.com>
---
 include/linux/dept.h     | 2 ++
 kernel/dependency/dept.c | 6 ++++++
 lib/debug_locks.c        | 2 ++
 3 files changed, 10 insertions(+)

diff --git a/include/linux/dept.h b/include/linux/dept.h
index 8b4d97fc4627..b164f74e86e5 100644
--- a/include/linux/dept.h
+++ b/include/linux/dept.h
@@ -390,6 +390,7 @@ struct dept_ext_wgen {
 	unsigned int wgen;
 };
 
+extern void dept_stop_emerg(void);
 extern void dept_on(void);
 extern void dept_off(void);
 extern void dept_init(void);
@@ -442,6 +443,7 @@ struct dept_ext_wgen { };
 
 #define DEPT_MAP_INITIALIZER(n, k) { }
 
+#define dept_stop_emerg()				do { } while (0)
 #define dept_on()					do { } while (0)
 #define dept_off()					do { } while (0)
 #define dept_init()					do { } while (0)
diff --git a/kernel/dependency/dept.c b/kernel/dependency/dept.c
index b154c1bb4ee5..b5ba6d939932 100644
--- a/kernel/dependency/dept.c
+++ b/kernel/dependency/dept.c
@@ -187,6 +187,12 @@ static void dept_unlock(void)
 	arch_spin_unlock(&dept_spin);
 }
 
+void dept_stop_emerg(void)
+{
+	WRITE_ONCE(dept_stop, 1);
+}
+EXPORT_SYMBOL_GPL(dept_stop_emerg);
+
 enum bfs_ret {
 	BFS_CONTINUE,
 	BFS_DONE,
diff --git a/lib/debug_locks.c b/lib/debug_locks.c
index a75ee30b77cb..14a965914a8f 100644
--- a/lib/debug_locks.c
+++ b/lib/debug_locks.c
@@ -38,6 +38,8 @@ EXPORT_SYMBOL_GPL(debug_locks_silent);
  */
 int debug_locks_off(void)
 {
+	dept_stop_emerg();
+
 	if (debug_locks && __debug_locks_off()) {
 		if (!debug_locks_silent) {
 			console_verbose();
-- 
2.17.1

