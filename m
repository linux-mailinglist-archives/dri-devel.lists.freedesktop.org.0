Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A4D493FBE3
	for <lists+dri-devel@lfdr.de>; Mon, 29 Jul 2024 18:55:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D6B4010E431;
	Mon, 29 Jul 2024 16:55:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bg5.exmail.qq.com (bg5.exmail.qq.com [43.154.209.5])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 12CEB10E06F;
 Mon, 29 Jul 2024 14:01:14 +0000 (UTC)
X-QQ-mid: bizesmtp81t1722261547tbxomzu2
X-QQ-Originating-IP: KlOB/YbZHQp8ShWuktjn3+RmM/yq6LbsM9i04JshJ8E=
Received: from localhost.localdomain ( [113.57.152.160])
 by bizesmtp.qq.com (ESMTP) with 
 id ; Mon, 29 Jul 2024 21:59:05 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 1796147500759734024
From: WangYuli <wangyuli@uniontech.com>
To: alexander.deucher@amd.com, christian.koenig@amd.com, Xinhui.Pan@amd.com,
 airlied@gmail.com, daniel@ffwll.ch, Jingwen.Chen2@amd.com,
 suhui@nfschina.com, dan.carpenter@linaro.org, bokun.zhang@amd.com,
 wangyuli@uniontech.com, chongli2@amd.com, Luqmaan.Irshad@amd.com
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, guanwentao@uniontech.com,
 shaoyang@uniontech.com, hongao@uniontech.com,
 wenlunpeng <wenlunpeng@uniontech.com>
Subject: [PATCH] drm/amd/amdgpu: Properly tune the size of struct
Date: Mon, 29 Jul 2024 21:58:25 +0800
Message-ID: <2BF9FDD63BBFB1AE+20240729135825.890138-1-wangyuli@uniontech.com>
X-Mailer: git-send-email 2.43.4
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:uniontech.com:qybglogicsvrgz:qybglogicsvrgz8a-1
X-Mailman-Approved-At: Mon, 29 Jul 2024 16:55:27 +0000
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

The struct assertion is failed because sparse cannot parse
`#pragma pack(push, 1)` and `#pragma pack(pop)` correctly.
GCC's output is still 1-byte-aligned. No harm to memory layout.

The error can be filtered out by sparse-diff, but sometimes
multiple lines queezed into one, making the sparse-diff thinks
its a new error. I'm trying to aviod this by fixing errors.

Link: https://lore.kernel.org/all/20230620045919.492128-1-suhui@nfschina.com/
Fixes: 1721bc1b2afa ("drm/amdgpu: Update VF2PF interface")
Signed-off-by: Su Hui <suhui@nfschina.com>
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
Signed-off-by: wenlunpeng <wenlunpeng@uniontech.com>
Signed-off-by: WangYuli <wangyuli@uniontech.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgv_sriovmsg.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgv_sriovmsg.h b/drivers/gpu/drm/amd/amdgpu/amdgv_sriovmsg.h
index fb2b394bb9c5..6e9eeaeb3de1 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgv_sriovmsg.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgv_sriovmsg.h
@@ -213,7 +213,7 @@ struct amd_sriov_msg_pf2vf_info {
 	uint32_t gpu_capacity;
 	/* reserved */
 	uint32_t reserved[256 - AMD_SRIOV_MSG_PF2VF_INFO_FILLED_SIZE];
-};
+} __packed;
 
 struct amd_sriov_msg_vf2pf_info_header {
 	/* the total structure size in byte */
@@ -273,7 +273,7 @@ struct amd_sriov_msg_vf2pf_info {
 	uint32_t mes_info_size;
 	/* reserved */
 	uint32_t reserved[256 - AMD_SRIOV_MSG_VF2PF_INFO_FILLED_SIZE];
-};
+} __packed;
 
 /* mailbox message send from guest to host  */
 enum amd_sriov_mailbox_request_message {
-- 
2.43.4

