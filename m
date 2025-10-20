Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C0A8ABEF000
	for <lists+dri-devel@lfdr.de>; Mon, 20 Oct 2025 03:31:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D4C9C10E234;
	Mon, 20 Oct 2025 01:31:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ssh248.corpemail.net (ssh248.corpemail.net [210.51.61.248])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4AF9310E234
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Oct 2025 01:31:44 +0000 (UTC)
Received: from Jtjnmail201617.home.langchao.com
 by ssh248.corpemail.net ((D)) with ASMTP (SSL) id 202510200931344451;
 Mon, 20 Oct 2025 09:31:34 +0800
Received: from jtjnmailAR02.home.langchao.com (10.100.2.43) by
 Jtjnmail201617.home.langchao.com (10.100.2.17) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Mon, 20 Oct 2025 09:31:34 +0800
Received: from inspur.com (10.100.2.112) by jtjnmailAR02.home.langchao.com
 (10.100.2.43) with Microsoft SMTP Server id 15.1.2507.58 via Frontend
 Transport; Mon, 20 Oct 2025 09:31:34 +0800
Received: from localhost.localdomain.com (unknown [10.94.6.246])
 by app8 (Coremail) with SMTP id cAJkCsDweM_xkPVonp8FAA--.3685S4;
 Mon, 20 Oct 2025 09:31:30 +0800 (CST)
From: Chu Guangqing <chuguangqing@inspur.com>
To: <alain.volmat@foss.st.com>, <rgallaispou@gmail.com>,
 <maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
 <tzimmermann@suse.de>, <airlied@gmail.com>, <simona@ffwll.ch>
CC: <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>, Chu
 Guangqing <chuguangqing@inspur.com>
Subject: [PATCH v2 0/1] drm/sti: hdmi: call drm_edid_connector_update when
 edid is NULL
Date: Mon, 20 Oct 2025 09:30:38 +0800
Message-ID: <20251020013039.1800-1-chuguangqing@inspur.com>
X-Mailer: git-send-email 2.43.7
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: cAJkCsDweM_xkPVonp8FAA--.3685S4
X-Coremail-Antispam: 1UD129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
 VFW2AGmfu7bjvjm3AaLaJ3UjIYCTnIWjp_UUUYv7AC8VAFwI0_Gr0_Xr1l1xkIjI8I6I8E
 6xAIw20EY4v20xvaj40_Wr0E3s1l1IIY67AEw4v_Jr0_Jr4l8cAvFVAK0II2c7xJM28Cjx
 kF64kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVWDJVCq3wA2z4x0Y4vE2Ix0cI8I
 cVCY1x0267AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aV
 CY1x0267AKxVW0oVCq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAq
 x4xG6I80ewAv7VC0I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6x
 CaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwAC
 I402YVCY1x02628vn2kIc2xKxwCF04k20xvY0x0EwIxGrwCF54CYxVCY1x0262kKe7AKxV
 WUtVW8ZwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E
 7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcV
 C0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF
 04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7
 CjxVAFwI0_Jr0_GrUvcSsGvfC2KfnxnUUI43ZEXa7VUbXdbUUUUUU==
X-CM-SenderInfo: 5fkxw35dqj1xlqj6x0hvsx2hhfrp/
X-CM-DELIVERINFO: =?B?51X2wpRRTeOiUs3aOqHZ50hzsfHKF9Ds6CbXmDm38RucXu3DYXJR7Zlh9zE0nt/Iac
 D+KcUHRPMO7b5eZS/A0Ic4NlVVeTP1+UOyPMuJaEqgFRzKPJ3x6eximEcQXY3QjC6OBvSL
 qs/5gMHa7fSBgmRZ9Sw=
Content-Type: text/plain
tUid: 202510200931342928152798095e869852fd7b7c23ce80
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

call drm_edid_connector_update to reset the information when edid is NULL

v2:
 - add hdmi: to the commit subject
 - remove DRM_ERROR after reset reset edid
v1:
  https://lore.kernel.org/all/20251014065406.4017-1-chuguangqing@inspur.com/

Chu Guangqing (1):
  drm/sti: hdmi: call drm_edid_connector_update when edid is NULL

 drivers/gpu/drm/sti/sti_hdmi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

-- 
2.43.7

