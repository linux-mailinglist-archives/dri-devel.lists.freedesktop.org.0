Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AA8475A69B7
	for <lists+dri-devel@lfdr.de>; Tue, 30 Aug 2022 19:22:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5AE8310E269;
	Tue, 30 Aug 2022 17:22:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1372810E265;
 Tue, 30 Aug 2022 17:22:12 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 81C0D6179E;
 Tue, 30 Aug 2022 17:22:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D88CFC4314E;
 Tue, 30 Aug 2022 17:22:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1661880130;
 bh=V/y6vfSDcUetwyJjbM6hcPYtOEU327f2QJuNariEauc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=VACfEL0ZpA/L/Vja9AZEfZGIPXyYD7A3jM1fXAaOowzgyRnVva5AlM9KH+hVqtTXK
 EdL/FRXOnTLOcvnvEzjTK9Xh9X/MF0J8bau7IyzUVQclW/vhwStMej5jQtJ8BjQclZ
 VrycihYKUdDYAFXQEvaXNahZ6HQbL2bcNq+OhMSAqb27l2Z7przYS9qgWor9a+atpD
 /qkvXrkMInnjoX02vMKPW4rveNZI83MoJBdoxip9iJYviN6dpEQw2k8Kvl5jpa/lSt
 PJPIXNsm8oMTUAcs1z6cZHQb+j5t5M+A37FWqTz8XuKTan3hqHNX1ugEbN7MkRXPLw
 sXrriMdvJFKXQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.15 08/23] drm/radeon: add a force flush to delay
 work when radeon
Date: Tue, 30 Aug 2022 13:21:25 -0400
Message-Id: <20220830172141.581086-8-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220830172141.581086-1-sashal@kernel.org>
References: <20220830172141.581086-1-sashal@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-stable: review
X-Patchwork-Hint: Ignore
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
Cc: Sasha Levin <sashal@kernel.org>, airlied@linux.ie, Xinhui.Pan@amd.com,
 Zhenneng Li <lizhenneng@kylinos.cn>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Zhenneng Li <lizhenneng@kylinos.cn>

[ Upstream commit f461950fdc374a3ada5a63c669d997de4600dffe ]

Although radeon card fence and wait for gpu to finish processing current batch rings,
there is still a corner case that radeon lockup work queue may not be fully flushed,
and meanwhile the radeon_suspend_kms() function has called pci_set_power_state() to
put device in D3hot state.
Per PCI spec rev 4.0 on 5.3.1.4.1 D3hot State.
> Configuration and Message requests are the only TLPs accepted by a Function in
> the D3hot state. All other received Requests must be handled as Unsupported Requests,
> and all received Completions may optionally be handled as Unexpected Completions.
This issue will happen in following logs:
Unable to handle kernel paging request at virtual address 00008800e0008010
CPU 0 kworker/0:3(131): Oops 0
pc = [<ffffffff811bea5c>]  ra = [<ffffffff81240844>]  ps = 0000 Tainted: G        W
pc is at si_gpu_check_soft_reset+0x3c/0x240
ra is at si_dma_is_lockup+0x34/0xd0
v0 = 0000000000000000  t0 = fff08800e0008010  t1 = 0000000000010000
t2 = 0000000000008010  t3 = fff00007e3c00000  t4 = fff00007e3c00258
t5 = 000000000000ffff  t6 = 0000000000000001  t7 = fff00007ef078000
s0 = fff00007e3c016e8  s1 = fff00007e3c00000  s2 = fff00007e3c00018
s3 = fff00007e3c00000  s4 = fff00007fff59d80  s5 = 0000000000000000
s6 = fff00007ef07bd98
a0 = fff00007e3c00000  a1 = fff00007e3c016e8  a2 = 0000000000000008
a3 = 0000000000000001  a4 = 8f5c28f5c28f5c29  a5 = ffffffff810f4338
t8 = 0000000000000275  t9 = ffffffff809b66f8  t10 = ff6769c5d964b800
t11= 000000000000b886  pv = ffffffff811bea20  at = 0000000000000000
gp = ffffffff81d89690  sp = 00000000aa814126
Disabling lock debugging due to kernel taint
Trace:
[<ffffffff81240844>] si_dma_is_lockup+0x34/0xd0
[<ffffffff81119610>] radeon_fence_check_lockup+0xd0/0x290
[<ffffffff80977010>] process_one_work+0x280/0x550
[<ffffffff80977350>] worker_thread+0x70/0x7c0
[<ffffffff80977410>] worker_thread+0x130/0x7c0
[<ffffffff80982040>] kthread+0x200/0x210
[<ffffffff809772e0>] worker_thread+0x0/0x7c0
[<ffffffff80981f8c>] kthread+0x14c/0x210
[<ffffffff80911658>] ret_from_kernel_thread+0x18/0x20
[<ffffffff80981e40>] kthread+0x0/0x210
 Code: ad3e0008  43f0074a  ad7e0018  ad9e0020  8c3001e8  40230101
 <88210000> 4821ed21
So force lockup work queue flush to fix this problem.

Acked-by: Christian König <christian.koenig@amd.com>
Signed-off-by: Zhenneng Li <lizhenneng@kylinos.cn>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/radeon/radeon_device.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/radeon/radeon_device.c b/drivers/gpu/drm/radeon/radeon_device.c
index 4f0fbf6674316..92905ebb7b459 100644
--- a/drivers/gpu/drm/radeon/radeon_device.c
+++ b/drivers/gpu/drm/radeon/radeon_device.c
@@ -1617,6 +1617,9 @@ int radeon_suspend_kms(struct drm_device *dev, bool suspend,
 		if (r) {
 			/* delay GPU reset to resume */
 			radeon_fence_driver_force_completion(rdev, i);
+		} else {
+			/* finish executing delayed work */
+			flush_delayed_work(&rdev->fence_drv[i].lockup_work);
 		}
 	}
 
-- 
2.35.1

