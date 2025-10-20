Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 43D15BEEFFD
	for <lists+dri-devel@lfdr.de>; Mon, 20 Oct 2025 03:31:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB40D10E13D;
	Mon, 20 Oct 2025 01:31:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from unicom146.biz-email.net (unicom146.biz-email.net
 [210.51.26.146])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1582810E13D
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Oct 2025 01:31:40 +0000 (UTC)
Received: from Jtjnmail201615.home.langchao.com
 by unicom146.biz-email.net ((D)) with ASMTP (SSL) id 202510200931350950;
 Mon, 20 Oct 2025 09:31:35 +0800
Received: from jtjnmailAR01.home.langchao.com (10.100.2.42) by
 Jtjnmail201615.home.langchao.com (10.100.2.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Mon, 20 Oct 2025 09:31:35 +0800
Received: from inspur.com (10.100.2.112) by jtjnmailAR01.home.langchao.com
 (10.100.2.42) with Microsoft SMTP Server id 15.1.2507.58 via Frontend
 Transport; Mon, 20 Oct 2025 09:31:35 +0800
Received: from localhost.localdomain.com (unknown [10.94.6.246])
 by app8 (Coremail) with SMTP id cAJkCsDweM_xkPVonp8FAA--.3685S5;
 Mon, 20 Oct 2025 09:31:35 +0800 (CST)
From: Chu Guangqing <chuguangqing@inspur.com>
To: <alain.volmat@foss.st.com>, <rgallaispou@gmail.com>,
 <maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
 <tzimmermann@suse.de>, <airlied@gmail.com>, <simona@ffwll.ch>
CC: <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>, Chu
 Guangqing <chuguangqing@inspur.com>
Subject: [PATCH v2 1/1] drm/sti: hdmi: call drm_edid_connector_update when
 edid is NULL
Date: Mon, 20 Oct 2025 09:30:39 +0800
Message-ID: <20251020013039.1800-2-chuguangqing@inspur.com>
X-Mailer: git-send-email 2.43.7
In-Reply-To: <20251020013039.1800-1-chuguangqing@inspur.com>
References: <20251020013039.1800-1-chuguangqing@inspur.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: cAJkCsDweM_xkPVonp8FAA--.3685S5
X-Coremail-Antispam: 1UD129KBjvdXoW7Xw1ktw1UtF4DuFWrGFW8Xrb_yoW3Arg_WF
 y8WrsxXrsIkr92yw129r45ZF9avayruFWkWrn3t34xtr47XrW5G3yqgFyjva17Xr47tF9x
 K3ZagFy5ZrZ3WjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUIcSsGvfJTRUUUbmAFF20E14v26ryj6rWUM7CY07I20VC2zVCF04k26cxKx2IYs7xG
 6rWj6s0DM7CIcVAFz4kK6r1j6r18M28IrcIa0xkI8VA2jI8067AKxVWUGwA2048vs2IY02
 0Ec7CjxVAFwI0_JFI_Gr1l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxSw2x7M28EF7xv
 wVC0I7IYx2IY67AKxVWDJVCq3wA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxVW0oVCq3wA2z4
 x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVW0oVCq3wAS0I0E
 0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67
 AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48I
 cxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwACI402YVCY1x02628vn2kIc2xKxw
 CY1x0262kKe7AKxVWUtVW8ZwCF04k20xvY0x0EwIxGrwCF54CYxVCY1x0262kKe7AKxVWU
 tVW8ZwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E74
 80Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0
 I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04
 k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7Cj
 xVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x0JUqkskUUUUU=
X-CM-SenderInfo: 5fkxw35dqj1xlqj6x0hvsx2hhfrp/
X-CM-DELIVERINFO: =?B?SuPnyZRRTeOiUs3aOqHZ50hzsfHKF9Ds6CbXmDm38RucXu3DYXJR7Zlh9zE0nt/Iac
 D+KRKcCvnU13bfTavh8qDh7wpVeTP1+UOyPMuJaEqgFRzKPJ3x6eximEcQXY3QjC6OBhQE
 uc4sWHR35ub3F0GruH4=
Content-Type: text/plain
tUid: 202510200931356bf3cea568d6eba256712eab3259955b
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

call drm_edid_connector_update to reset the information when edid is NULL.
We can see the following comments in drm_edid.c
If EDID is NULL, reset the information.

Signed-off-by: Chu Guangqing <chuguangqing@inspur.com>
---
 drivers/gpu/drm/sti/sti_hdmi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/sti/sti_hdmi.c b/drivers/gpu/drm/sti/sti_hdmi.c
index 4e7c3d78b2b9..e0be1be8bcdd 100644
--- a/drivers/gpu/drm/sti/sti_hdmi.c
+++ b/drivers/gpu/drm/sti/sti_hdmi.c
@@ -1008,7 +1008,7 @@ static int sti_hdmi_connector_get_modes(struct drm_connector *connector)
 	return count;
 
 fail:
-	DRM_ERROR("Can't read HDMI EDID\n");
+	drm_edid_connector_update(connector, NULL);
 	return 0;
 }
 
-- 
2.43.7

