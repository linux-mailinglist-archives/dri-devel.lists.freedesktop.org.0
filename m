Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 250511B55D5
	for <lists+dri-devel@lfdr.de>; Thu, 23 Apr 2020 09:37:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 57FE46E277;
	Thu, 23 Apr 2020 07:36:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fudan.edu.cn (mail.fudan.edu.cn [202.120.224.73])
 by gabe.freedesktop.org (Postfix) with ESMTP id 0455B89A20
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Apr 2020 05:05:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fudan.edu.cn; s=dkim; h=Received:From:To:Cc:Subject:Date:
 Message-Id; bh=RW6+DhCuPTn9Zc9Tv2QQuj9tgtIM2k90v/0fdE1YbRs=; b=u
 WGR3OMQ+NCsLr1uXyCZu7zAxFdNBmfp8q5FcPjS587FbuiSNr3py/KTGy8wWSvzQ
 APPISvRuChpgKrQ8zPFYk6YR/iwXoluh34Zvl8vqUetf/DKL2HTaAg+fHOgpC+Jk
 V5/WP3/JYZvXKDxZRcCU/vaF1QPQsAgzqjb5g8aQBE=
Received: from localhost.localdomain (unknown [120.229.255.80])
 by app2 (Coremail) with SMTP id XQUFCgAXH__yIaFe3JNPAA--.37487S3;
 Thu, 23 Apr 2020 13:04:52 +0800 (CST)
From: Xiyu Yang <xiyuyang19@fudan.edu.cn>
To: Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 "David (ChunMing) Zhou" <David1.Zhou@amd.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>, Jun Lei <Jun.Lei@amd.com>,
 Anthony Koo <Anthony.Koo@amd.com>, Zhan Liu <Zhan.Liu@amd.com>,
 Eric Yang <Eric.Yang2@amd.com>, Wenjing Liu <Wenjing.Liu@amd.com>,
 Chris Park <Chris.Park@amd.com>, Roman Li <Roman.Li@amd.com>,
 David Galiffi <David.Galiffi@amd.com>, Lucy Li <lucy.li@amd.com>,
 Paul Hsieh <paul.hsieh@amd.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH] drm/amdgpu/display: Fix dc_sink refcnt leak in
 dc_link_detect_helper
Date: Thu, 23 Apr 2020 13:03:11 +0800
Message-Id: <1587618202-13283-1-git-send-email-xiyuyang19@fudan.edu.cn>
X-Mailer: git-send-email 2.7.4
X-CM-TRANSID: XQUFCgAXH__yIaFe3JNPAA--.37487S3
X-Coremail-Antispam: 1UD129KBjvJXoW7tF18Jr43WrWkCF15Gw4fuFg_yoW8JFW7pr
 W3GrW8u34YyF1IqFnxAa4kXFW3Z3WkGF4F9rySkan5Zr15Aws0yrWrXw42gryUZr93AF1x
 XFnFgr43ZFnxCFJanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUU9K14x267AKxVW5JVWrJwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
 1l84ACjcxK6xIIjxv20xvE14v26w1j6s0DM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26rxl
 6s0DM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I0E14v26rxl6s
 0DM2vYz4IE04k24VAvwVAKI4IrM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI
 64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r106r15McIj6I8E87Iv67AKxVWUJVW8Jw
 Am72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAG
 YxC7M4IIrI8v6xkF7I0E8cxan2IY04v7MxkIecxEwVAFwVW8WwCF04k20xvY0x0EwIxGrw
 CFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE
 14v26r106r1rMI8E67AF67kF1VAFwI0_GFv_WrylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2
 IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxK
 x2IYs7xG6Fyj6rWUJwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14
 v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjfUo6wZDUUUU
X-CM-SenderInfo: irzsiiysuqikmy6i3vldqovvfxof0/
X-Mailman-Approved-At: Thu, 23 Apr 2020 07:36:39 +0000
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
Cc: Xin Tan <tanxin.ctf@gmail.com>, yuanxzhang@fudan.edu.cn, kjlu@umn.edu,
 Xiyu Yang <xiyuyang19@fudan.edu.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

dc_link_detect_helper() invokes dc_sink_retain(), which increases the
refcount of the "prev_sink".

When dc_link_detect_helper() returns, local variable "prev_sink" becomes
invalid, so the refcount should be decreased to keep refcount balanced.

The reference counting issue happens in one exception handling path of
dc_link_detect_helper(). When alt mode times out, the function forgets
to decrease the refcnt increased by dc_sink_retain(), causing a refcnt
leak.

Fix this issue by calling dc_sink_release() when alt mode times out.

Signed-off-by: Xiyu Yang <xiyuyang19@fudan.edu.cn>
Signed-off-by: Xin Tan <tanxin.ctf@gmail.com>
---
 drivers/gpu/drm/amd/display/dc/core/dc_link.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/amd/display/dc/core/dc_link.c b/drivers/gpu/drm/amd/display/dc/core/dc_link.c
index a09119c10d7c..91550d9a1abb 100644
--- a/drivers/gpu/drm/amd/display/dc/core/dc_link.c
+++ b/drivers/gpu/drm/amd/display/dc/core/dc_link.c
@@ -832,6 +832,8 @@ static bool dc_link_detect_helper(struct dc_link *link,
 
 				/* if alt mode times out, return false */
 				if (wait_for_alt_mode(link) == false) {
+					if (prev_sink != NULL)
+						dc_sink_release(prev_sink);
 					return false;
 				}
 			}
-- 
2.7.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
