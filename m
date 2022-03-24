Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DFC54E60F1
	for <lists+dri-devel@lfdr.de>; Thu, 24 Mar 2022 10:15:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1FA2210E896;
	Thu, 24 Mar 2022 09:15:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 2130 seconds by postgrey-1.36 at gabe;
 Thu, 24 Mar 2022 09:15:43 UTC
Received: from out162-62-57-49.mail.qq.com (out162-62-57-49.mail.qq.com
 [162.62.57.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 44EEF10E895;
 Thu, 24 Mar 2022 09:15:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foxmail.com;
 s=s201512; t=1648113332;
 bh=8iITNHrVU17bPyPq/aCt5ijbzEpqeSpR6VGmt9fp4O4=;
 h=From:To:Cc:Subject:Date;
 b=vgnHeFjbP6S/4jy+ks6pkN/8CoyYrulcuHzewEWpTkBVa7qDnPX62nALt2sJvIqi8
 MvBYCmXtMJlaTst2f384fAOsuIy3TgX9hKEUb4rVqPZvrUZHiHQgiZ2crnVhG+R/mw
 lF1zCgpu2IuaYynYu1x4AZ2DIsGSGMPLo5wOUfMk=
Received: from localhost.localdomain ([43.227.136.188])
 by newxmesmtplogicsvrszc10.qq.com (NewEsmtp) with SMTP
 id 3DC9EA7E; Thu, 24 Mar 2022 17:15:28 +0800
X-QQ-mid: xmsmtpt1648113328tewr9hg0d
Message-ID: <tencent_B3E19486FF39415098B572B7397C2936C309@qq.com>
X-QQ-XMAILINFO: NwU0tZNR0OQK49YLfziyIHPVLwaNbOO/tFvzXnAVzMl7VOg4G7RENCCLyqN7nA
 tLvurzBiClpBgVRiyqmd+F9nkdhcn1k2NOXXctTq/gFvc5ys5Jy+IishhG5yPUzSCPOm3834w6RI
 hkFCQms90g6g22tWFTGotebD4OX+BrC2KgYWN+DHaHQxb3nLt2tgLXohme/2aqZbHkwvFXikq2jg
 LRiOeKNA20abjn+2idG0P8u7m/ZroCajqTfZa6gVQbsGPASLgKB8ECnFiHiFwThiate46xNh5XfP
 5u9jphWBfDcPQh1hoYEgZWaN5JdsbJN+nGsW7uR45wI2oIRVk+Vrbmy0OD4LDm6gfu2LYVQJu7T4
 O/bDt1LXhqR+SeaDcdolUU+D5p4xbYtwX96/EPA0MOkUeZd+sriIaltDp3pi4Fb6vz/JY1yePUGX
 j95zM2UANmdukPhCDAgvBE+MCP5NMiPZsYjiqFbgMTJdBuUcxZ6kYLli1/Pl3eBpONg8sTNmxbVy
 QD2SOmaVCuTldLp1hubrOlGYgcLGx35d0QEjO+UktOSQhErDz7Xd1Zkq/ZaPmHTYxHqSJX7NuSfI
 iLmW7iTCKZ2+nJ459P9HyxBOa4RhX3FgS4Cbt7ofX9btI0e2pPTgKJqOqhm+cDnNMrdfu9EoBtJ0
 txv3QXuE8XGEoOw/uJ5Xbok9+YlMiJJvXxMMIrhso2ftmMjeeLhDycZohbP6Rk+R7Mc+o7/korCv
 cjhPOhP9Mkb/0iBCRkQJT41oT69Q1SOZHvGGkORYQT3T5nQgCpjep/qHNfk4x/0t6D4b+p4rwFzf
 qEi4P0IjYvYzMMrY9JQaw972p6uV+9BQoBfIY5HuWecqz5flErRAkjeyA2ZC74t6xCsvmHI2nPrd
 XDc9X0f23UkOybqifkQRYO2hMEfJdw3rzZgto0PEstQouVY/tat+f6Xi3EtfUbSixP1A9ysCFAyk
 cD2QeUL1g=
From: xkernel.wang@foxmail.com
To: robdclark@gmail.com, sean@poorly.run, airlied@linux.ie, daniel@ffwll.ch
Subject: [PATCH] drm/msm/disp: check the return value of kzalloc()
Date: Thu, 24 Mar 2022 17:15:08 +0800
X-OQ-MSGID: <20220324091508.2854-1-xkernel.wang@foxmail.com>
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
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Xiaoke Wang <xkernel.wang@foxmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Xiaoke Wang <xkernel.wang@foxmail.com>

kzalloc() is a memory allocation function which can return NULL when
some internal memory errors happen. So it is better to check it to
prevent potential wrong memory access.

Signed-off-by: Xiaoke Wang <xkernel.wang@foxmail.com>
---
 drivers/gpu/drm/msm/disp/msm_disp_snapshot_util.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/msm/disp/msm_disp_snapshot_util.c b/drivers/gpu/drm/msm/disp/msm_disp_snapshot_util.c
index cabe151..369e57f 100644
--- a/drivers/gpu/drm/msm/disp/msm_disp_snapshot_util.c
+++ b/drivers/gpu/drm/msm/disp/msm_disp_snapshot_util.c
@@ -169,6 +169,8 @@ void msm_disp_snapshot_add_block(struct msm_disp_state *disp_state, u32 len,
 	va_list va;
 
 	new_blk = kzalloc(sizeof(struct msm_disp_state_block), GFP_KERNEL);
+	if (!new_blk)
+		return;
 
 	va_start(va, fmt);
 
-- 
