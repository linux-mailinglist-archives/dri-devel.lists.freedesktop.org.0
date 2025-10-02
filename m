Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 97B36BB6151
	for <lists+dri-devel@lfdr.de>; Fri, 03 Oct 2025 09:02:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4EC7C10E877;
	Fri,  3 Oct 2025 07:01:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from invmail4.hynix.com (exvmail4.hynix.com [166.125.252.92])
 by gabe.freedesktop.org (Postfix) with ESMTP id 744C310E008
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Oct 2025 08:28:19 +0000 (UTC)
X-AuditID: a67dfc5b-c2dff70000001609-9b-68de340df55b
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
 yunseong.kim@ericsson.com, ysk@kzalloc.com, yeoreum.yun@arm.com,
 netdev@vger.kernel.org, matthew.brost@intel.com, her0gyugyu@gmail.com,
 corbet@lwn.net, catalin.marinas@arm.com, bp@alien8.de,
 dave.hansen@linux.intel.com, x86@kernel.org, hpa@zytor.com,
 luto@kernel.org, sumit.semwal@linaro.org, gustavo@padovan.org,
 christian.koenig@amd.com, andi.shyti@kernel.org, arnd@arndb.de,
 lorenzo.stoakes@oracle.com, Liam.Howlett@oracle.com, rppt@kernel.org,
 surenb@google.com, mcgrof@kernel.org, petr.pavlu@suse.com,
 da.gomez@kernel.org, samitolvanen@google.com, paulmck@kernel.org,
 frederic@kernel.org, neeraj.upadhyay@kernel.org, joelagnelf@nvidia.com,
 josh@joshtriplett.org, urezki@gmail.com, mathieu.desnoyers@efficios.com,
 jiangshanlai@gmail.com, qiang.zhang@linux.dev, juri.lelli@redhat.com,
 vincent.guittot@linaro.org, dietmar.eggemann@arm.com, bsegall@google.com,
 mgorman@suse.de, vschneid@redhat.com, chuck.lever@oracle.com,
 neil@brown.name, okorniev@redhat.com, Dai.Ngo@oracle.com, tom@talpey.com,
 trondmy@kernel.org, anna@kernel.org, kees@kernel.org,
 bigeasy@linutronix.de, clrkwllms@kernel.org, mark.rutland@arm.com,
 ada.coupriediaz@arm.com, kristina.martsenko@arm.com,
 wangkefeng.wang@huawei.com, broonie@kernel.org, kevin.brodsky@arm.com,
 dwmw@amazon.co.uk, shakeel.butt@linux.dev, ast@kernel.org, ziy@nvidia.com,
 yuzhao@google.com, baolin.wang@linux.alibaba.com, usamaarif642@gmail.com,
 joel.granados@kernel.org, richard.weiyang@gmail.com,
 geert+renesas@glider.be, tim.c.chen@linux.intel.com, linux@treblig.org,
 alexander.shishkin@linux.intel.com, lillian@star-ark.net,
 chenhuacai@kernel.org, francesco@valla.it, guoweikang.kernel@gmail.com,
 link@vivo.com, jpoimboe@kernel.org, masahiroy@kernel.org,
 brauner@kernel.org, thomas.weissschuh@linutronix.de, oleg@redhat.com,
 mjguzik@gmail.com, andrii@kernel.org, wangfushuai@baidu.com,
 linux-doc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
 linux-i2c@vger.kernel.org, linux-arch@vger.kernel.org,
 linux-modules@vger.kernel.org, rcu@vger.kernel.org,
 linux-nfs@vger.kernel.org, linux-rt-devel@lists.linux.dev
Subject: [PATCH v17 12/47] dept: record the latest one out of consecutive
 waits of the same class
Date: Thu,  2 Oct 2025 17:12:12 +0900
Message-Id: <20251002081247.51255-13-byungchul@sk.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20251002081247.51255-1-byungchul@sk.com>
References: <20251002081247.51255-1-byungchul@sk.com>
X-Brightmail-Tracker: H4sIAAAAAAAAAzWSa0xTdxTA/f/v/z5aLbspRK+6h2tEN+ZjM2w5H9S4RePNMjaiiR/Yh9mN
 m7WxFNPy6jITHI9h50LtVp1FESSySotlZaDAMAylaBgDgmKBtohgKyKQdNRlIrDC5peTX37n
 kZOTw1FKH72O0+qzJINerVMxciKfWlW5NS45qHnb7H4FBo63ETjndjFQ4jlLQ+8VJ4KRaAmC
 oqZFAvNWLwuLrV4Erl+PY5i8EUFgGx1nwB4qY2GiYz8sBsIY7j19gqB6fAHDhYv1DMx191Dw
 qO5bBK2Obxh4aGmgoH88Du5EZxi4bfuOgam+cxjOl1kRFFS5GWi638yC/7QVg9OTAiPVIQJd
 losYzkwwcPqXNVB2pgDHwiMMttoWDH9U+QlU5ydCWXc/DQ8c9tiOFZngdYZZCJTaCFyZ6qFh
 MmRlYKSzmIar+fdZ8Ax2IJi9M4rBdTJEQUlzlIBnbICG1qG34Gy5P3aA+VkE3msPMJysa6Ah
 6FqkwR32Yejy3iJw236ZQE9zLQ2X7vXhPeliTX0jFl3lLiTOPbMicfZSASXeeDJDic+idxnx
 VPdWsckeYMXC60OsWOHJFusdSWLVbxNYrIxEaXFocpfoqTnBiJ6IlU19M02+M13SaXMkw/bd
 h+WalpHz5OjDlXnBilNsPropMyMZJ/DJQvEPfuoFB0sr6SVm+M2Cz/fPsk/gNwj134eWPcV3
 vSwM9G0xI46L59VCtMS0pAmfKPTdsiyXKPj3hGDI/v/I1wRnXdsyy2K+f7SLLLGSf1cominE
 ZiSP1fwsE9rGw+x/DWuF3x0+YkGKCrSiBim1+pwMtVaXvE1j0mvztn2RmeFBsX+rPvb802so
 0nuwHfEcUq1S9CYGNEpanWM0ZbQjgaNUCYrDDr9GqUhXm76SDJmfGbJ1krEdreeIao1ix9Pc
 dCX/pTpLOiJJRyXDiyzmZOvy0Z6rRYFNj1dGOl9KGQ5bwhsJ94k9vnZ07Zj2gx0ZX2c9/nt4
 n37ho7S8643OP9+IC093Ng07cgYGbdMpzeA2Hdg7RPaGWi640wYXWmoLdY3v++ZylX+9Pviq
 ND91aLrYbEzYNfxx6U+fZ8ffTN38vHiTbWH1j8dSkzpyPxwr1989aGhQEaNG/U4SZTCq/wWf
 HeRmawMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAAzWSfUhTexjH+51zds7ZvKvD0jy9QDWQICqLUh6ucrn3n/pxvUV/BEEQOezQ
 hrrJpiuDQtN1pZfbXGyWy+syHKaWy2lky5DNzDJz02q9uC1rrTdtl64rfMum0T8Pn+f7/fLw
 /eNhSVm7aBmrUhcKWrUiT05LKMmOjLL10i1B5caHrlR4UtpFQWy8goILLc00VLSeF4H3ahOC
 UKwCwdcpKwmGjlkKZkw9DIxPvGBgtrMHgcVnIqG5rZSA/x3faPjo+YzAPBKmoep9KQVR+ykE
 1RErA+/vbIOxkEsEs4G3BPi/jCKwh78REO76G8GMJRdq65w0TPUPkFBl9iK4OBIg4Z0jbrb1
 BBF0Nhyj4Y2xnYSh8EJ4FIvScM98koYx3wUCPjlosB3rFEGN1YSg7FILDZaaVgo6Xt5kwPdx
 moBhi4mAptbtELJHKOgz1hHxfvHUtWSwVpUR8fGOAPMVFwET9kYGHlwapsBekgLW/iERvGqo
 ZmB6ZBPM2jTQ0/SWgcAZMwVXxwZEv5sR/mr4h8KNzusENgzO0Lj532aEpyZNCI/Xl5HYYIyv
 ntEoicudB3F93yiNJ2OPadz5xUbh+3U8ruxfjzuqAwwuv/2c2fnrHknmfiFPpRe0qb9lS5Su
 UA1V8CbhUNBWyZSgbvEJJGZ5bgsfPHNRNMc0t4Z/+nSCnONEbhXvPB2Z10mubwX/xLfuBGLZ
 xZyCj1UUz8kUl8L7eo3zESmXzgcj1eSPkyv5JkfXPIvj+tBIHzXHMi6NN0TLCSOS2NCCRpSo
 UuvzFaq8tA26XGWxWnVoQ44mvxXFn8l+ZLryBhof2uZGHIvkv0h9KQGlTKTQ64rz3YhnSXmi
 NLthWCmT7lcUHxa0mn3aojxB50bLWUqeLP1zt5At4w4oCoVcQSgQtD9dghUvK0E54tys20kZ
 gt5vntTcfE1vfOhOCK30FI56/EXbT9Wu3rV16Uvbdc+HrCODJ7uPe5M/ec8NhNPPPovqlnj9
 WXs//MFeySyPZKoS4PIgdvylb6/3HsXdbSVJS6ZL7973E5b0ImeGGzarC5KqbqFFut7/JtNe
 rFteq6k9KnPF7tyTUzqlYtNaUqtTfAeSC7G1SAMAAA==
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Fri, 03 Oct 2025 07:00:55 +0000
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

The current code records all the waits for later use to track relation
between waits and events within each context.  However, since the same
class is handled the same way, it'd be okay to record only one on behalf
of the others if they all have the same class.

Even though it's the ideal to search the whole history buffer for that,
since it'd cost too high, alternatively, let's keep the latest one when
the same class'ed waits consecutively appear.

Signed-off-by: Byungchul Park <byungchul@sk.com>
---
 kernel/dependency/dept.c | 21 ++++++++++++++++++++-
 1 file changed, 20 insertions(+), 1 deletion(-)

diff --git a/kernel/dependency/dept.c b/kernel/dependency/dept.c
index 1b16a6095b3c..f4c08758f8db 100644
--- a/kernel/dependency/dept.c
+++ b/kernel/dependency/dept.c
@@ -1486,9 +1486,28 @@ static struct dept_wait_hist *new_hist(void)
 	return wh;
 }
 
+static struct dept_wait_hist *last_hist(void)
+{
+	int pos_n = hist_pos_next();
+	struct dept_wait_hist *wh_n = hist(pos_n);
+
+	/*
+	 * This is the first try.
+	 */
+	if (!pos_n && !wh_n->wait)
+		return NULL;
+
+	return hist(pos_n + DEPT_MAX_WAIT_HIST - 1);
+}
+
 static void add_hist(struct dept_wait *w, unsigned int wg, unsigned int ctxt_id)
 {
-	struct dept_wait_hist *wh = new_hist();
+	struct dept_wait_hist *wh;
+
+	wh = last_hist();
+
+	if (!wh || wh->wait->class != w->class || wh->ctxt_id != ctxt_id)
+		wh = new_hist();
 
 	if (likely(wh->wait))
 		put_wait(wh->wait);
-- 
2.17.1

