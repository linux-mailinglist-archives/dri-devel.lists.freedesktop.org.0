Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B1BF1BD7BB3
	for <lists+dri-devel@lfdr.de>; Tue, 14 Oct 2025 08:54:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E875510E547;
	Tue, 14 Oct 2025 06:54:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ssh248.corpemail.net (ssh248.corpemail.net [210.51.61.248])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E5CF10E547
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Oct 2025 06:54:15 +0000 (UTC)
Received: from Jtjnmail201614.home.langchao.com
 by ssh248.corpemail.net ((D)) with ASMTP (SSL) id 202510141454085612;
 Tue, 14 Oct 2025 14:54:08 +0800
Received: from jtjnmailAR01.home.langchao.com (10.100.2.42) by
 Jtjnmail201614.home.langchao.com (10.100.2.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Tue, 14 Oct 2025 14:54:09 +0800
Received: from inspur.com (10.100.2.96) by jtjnmailAR01.home.langchao.com
 (10.100.2.42) with Microsoft SMTP Server id 15.1.2507.58 via Frontend
 Transport; Tue, 14 Oct 2025 14:54:08 +0800
Received: from localhost.localdomain.com (unknown [10.94.17.151])
 by app1 (Coremail) with SMTP id YAJkCsDwEnaP8+1oNfoWAA--.533S4;
 Tue, 14 Oct 2025 14:54:08 +0800 (CST)
From: Chu Guangqing <chuguangqing@inspur.com>
To: <alain.volmat@foss.st.com>, <rgallaispou@gmail.com>,
 <maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
 <tzimmermann@suse.de>, <airlied@gmail.com>, <simona@ffwll.ch>
CC: <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>, Chu
 Guangqing <chuguangqing@inspur.com>
Subject: [PATCH 1/1] drm/sti: call drm_edid_connector_update when edit is NULL
Date: Tue, 14 Oct 2025 14:54:06 +0800
Message-ID: <20251014065406.4017-1-chuguangqing@inspur.com>
X-Mailer: git-send-email 2.43.7
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: YAJkCsDwEnaP8+1oNfoWAA--.533S4
X-Coremail-Antispam: 1UD129KBjvdXoW7Xw4Uuw4rAF4rAry7XryxXwb_yoW3XFX_WF
 y8WFWfXrsIkr92yw129r45ZF9avayruFWkGrn3ta4xtr47X3y5G3yDtFyjva17Xr4UtF9I
 k3ZagFy5Zr93GjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUIcSsGvfJTRUUUb3xFF20E14v26r4j6ryUM7CY07I20VC2zVCF04k26cxKx2IYs7xG
 6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
 A2z4x0Y4vE2Ix0cI8IcVAFwI0_tr0E3s1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_GcCE
 3s1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_GcCE3s
 1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0
 cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8Jw
 ACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lFIxGxcIEc7CjxVA2Y2ka
 0xkIwI1lc7CjxVAaw2AFwI0_Jw0_GFyl42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7
 v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF
 1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIx
 AIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI
 42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4UJVWxJrUvcSsGvf
 C2KfnxnUUI43ZEXa7VUbGQ6JUUUUU==
X-CM-SenderInfo: 5fkxw35dqj1xlqj6x0hvsx2hhfrp/
X-CM-DELIVERINFO: =?B?4D1F9pRRTeOiUs3aOqHZ50hzsfHKF9Ds6CbXmDm38RucXu3DYXJR7Zlh9zE0nt/Iac
 D+Kbv0OT9rPYAOFMwQ4lF3QtMZ76xEoBV/ntrbBgynwF5g283VgfV0MswHKSjGP+0/JESk
 ZnH34Vg4+HwgcfDdH1s=
Content-Type: text/plain
tUid: 20251014145408de091ac489bfdb1d3b874b4e775fbbdb
X-Abuse-Reports-To: service@corp-email.com
Abuse-Reports-To: service@corp-email.com
X-Complaints-To: service@corp-email.com
X-Report-Abuse-To: service@corp-email.com
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

call drm_edid_connector_update to reset the information when edit is NULL.
We can see the following comments in drm_edid.c
If EDID is NULL, reset the information.

Signed-off-by: Chu Guangqing <chuguangqing@inspur.com>
---
 drivers/gpu/drm/sti/sti_hdmi.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/sti/sti_hdmi.c b/drivers/gpu/drm/sti/sti_hdmi.c
index 4e7c3d78b2b9..31a72f7f4d43 100644
--- a/drivers/gpu/drm/sti/sti_hdmi.c
+++ b/drivers/gpu/drm/sti/sti_hdmi.c
@@ -1008,6 +1008,7 @@ static int sti_hdmi_connector_get_modes(struct drm_connector *connector)
 	return count;
 
 fail:
+	drm_edid_connector_update(connector, NULL);
 	DRM_ERROR("Can't read HDMI EDID\n");
 	return 0;
 }
-- 
2.43.7

