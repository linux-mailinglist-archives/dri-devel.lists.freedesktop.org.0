Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oDQrHs3ggGleCAMAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 02 Feb 2026 18:37:17 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 11F6DCFAAD
	for <lists+dri-devel@lfdr.de>; Mon, 02 Feb 2026 18:37:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5985E10E52F;
	Mon,  2 Feb 2026 17:37:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dggsgout11.his.huawei.com (dggsgout11.his.huawei.com
 [45.249.212.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 41C3710E4B5
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Feb 2026 12:42:13 +0000 (UTC)
Received: from mail.maildlp.com (unknown [172.19.163.170])
 by dggsgout11.his.huawei.com (SkyGuard) with ESMTPS id 4f4R7S4q26zYQv21
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Feb 2026 20:41:24 +0800 (CST)
Received: from mail02.huawei.com (unknown [10.116.40.112])
 by mail.maildlp.com (Postfix) with ESMTP id 5DA7240572
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Feb 2026 20:42:10 +0800 (CST)
Received: from hulk-vt.huawei.com (unknown [10.67.174.121])
 by APP1 (Coremail) with SMTP id cCh0CgDXj+WWm4Bpt7ipFw--.14648S3;
 Mon, 02 Feb 2026 20:42:10 +0800 (CST)
From: Chen Ridong <chenridong@huaweicloud.com>
To: dev@lankhorst.se, mripard@kernel.org, natalie.vock@gmx.de, tj@kernel.org,
 hannes@cmpxchg.org, mkoutny@suse.com
Cc: cgroups@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, lujialin4@huawei.com,
 chenridong@huaweicloud.com
Subject: [PATCH -next v2 1/4] cgroup/dmem: fix NULL pointer dereference when
 setting max
Date: Mon,  2 Feb 2026 12:27:16 +0000
Message-Id: <20260202122719.414466-2-chenridong@huaweicloud.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260202122719.414466-1-chenridong@huaweicloud.com>
References: <20260202122719.414466-1-chenridong@huaweicloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: cCh0CgDXj+WWm4Bpt7ipFw--.14648S3
X-Coremail-Antispam: 1UD129KBjvJXoW7CFWrtF1xXryrAryDtF4ruFg_yoW8uFyxpr
 1rGryUCr48tr1UAF40vF15Zry5GF4xAa17Jwn7Jwn5JF1UKw1UtrykJ3yUJF98Jry7uw4I
 qFn8Zw4Iq345taUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUm014x267AKxVW5JVWrJwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_Jr4l82xGYIkIc2
 x26xkF7I0E14v26r4j6ryUM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2z4x0
 Y4vE2Ix0cI8IcVAFwI0_Ar0_tr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr1j6F4UJw
 A2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVW0oVCq3wAS
 0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2
 IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0
 Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwACI402YVCY1x02628vn2kIc2
 xKxwCY1x0262kKe7AKxVWUtVW8ZwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWU
 JVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67
 kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY
 6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0x
 vEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVj
 vjDU0xZFpf9x0JU2dgAUUUUU=
X-CM-SenderInfo: hfkh02xlgr0w46kxt4xhlfz01xgou0bp/
X-Mailman-Approved-At: Mon, 02 Feb 2026 17:37:09 +0000
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.89 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[lankhorst.se,kernel.org,gmx.de,cmpxchg.org,suse.com];
	DMARC_NA(0.00)[huaweicloud.com];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_RECIPIENTS(0.00)[m:dev@lankhorst.se,m:mripard@kernel.org,m:natalie.vock@gmx.de,m:tj@kernel.org,m:hannes@cmpxchg.org,m:mkoutny@suse.com,m:cgroups@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:lujialin4@huawei.com,m:chenridong@huaweicloud.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[chenridong@huaweicloud.com,dri-devel-bounces@lists.freedesktop.org];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[chenridong@huaweicloud.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_NONE(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	RCPT_COUNT_SEVEN(0.00)[11];
	R_DKIM_NA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[huaweicloud.com:mid,huawei.com:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 11F6DCFAAD
X-Rspamd-Action: no action

From: Chen Ridong <chenridong@huawei.com>

An issue was triggered:

 BUG: kernel NULL pointer dereference, address: 0000000000000000
 #PF: supervisor read access in kernel mode
 #PF: error_code(0x0000) - not-present page
 PGD 0 P4D 0
 Oops: Oops: 0000 [#1] SMP NOPTI
 CPU: 15 UID: 0 PID: 658 Comm: bash Tainted: 6.19.0-rc6-next-2026012
 Tainted: [O]=OOT_MODULE
 Hardware name: QEMU Standard PC (i440FX + PIIX, 1996),
 RIP: 0010:strcmp+0x10/0x30
 RSP: 0018:ffffc900017f7dc0 EFLAGS: 00000246
 RAX: 0000000000000000 RBX: 0000000000000000 RCX: ffff888107cd4358
 RDX: 0000000019f73907 RSI: ffffffff82cc381a RDI: 0000000000000000
 RBP: ffff8881016bef0d R08: 000000006c0e7145 R09: 0000000056c0e714
 R10: 0000000000000001 R11: ffff888107cd4358 R12: 0007ffffffffffff
 R13: ffff888101399200 R14: ffff888100fcb360 R15: 0007ffffffffffff
 CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
 CR2: 0000000000000000 CR3: 0000000105c79000 CR4: 00000000000006f0
 Call Trace:
  <TASK>
  dmemcg_limit_write.constprop.0+0x16d/0x390
  ? __pfx_set_resource_max+0x10/0x10
  kernfs_fop_write_iter+0x14e/0x200
  vfs_write+0x367/0x510
  ksys_write+0x66/0xe0
  do_syscall_64+0x6b/0x390
  entry_SYSCALL_64_after_hwframe+0x76/0x7e
 RIP: 0033:0x7f42697e1887

It was trriggered setting max without limitation, the command is like:
"echo test/region0 > dmem.max". To fix this issue, add check whether
options is valid after parsing the region_name.

Fixes: b168ed458dde ("kernel/cgroup: Add "dmem" memory accounting cgroup")
Signed-off-by: Chen Ridong <chenridong@huawei.com>
---
 kernel/cgroup/dmem.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/kernel/cgroup/dmem.c b/kernel/cgroup/dmem.c
index e12b946278b6..1f0d6caaf2fb 100644
--- a/kernel/cgroup/dmem.c
+++ b/kernel/cgroup/dmem.c
@@ -700,6 +700,9 @@ static ssize_t dmemcg_limit_write(struct kernfs_open_file *of,
 		if (!region_name[0])
 			continue;
 
+		if (!options || !*options)
+			return -EINVAL;
+
 		rcu_read_lock();
 		region = dmemcg_get_region_by_name(region_name);
 		rcu_read_unlock();
-- 
2.34.1

