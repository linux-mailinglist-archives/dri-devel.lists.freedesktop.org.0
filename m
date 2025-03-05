Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 44CEEA503B5
	for <lists+dri-devel@lfdr.de>; Wed,  5 Mar 2025 16:43:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B42FF891C0;
	Wed,  5 Mar 2025 15:43:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from cstnet.cn (smtp81.cstnet.cn [159.226.251.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 63511891C0
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Mar 2025 15:43:09 +0000 (UTC)
Received: from localhost.localdomain (unknown [124.16.141.245])
 by APP-03 (Coremail) with SMTP id rQCowACXfTAAcchnVHqTEg--.44952S2;
 Wed, 05 Mar 2025 23:43:02 +0800 (CST)
From: Wentao Liang <vulab@iscas.ac.cn>
To: thierry.reding@gmail.com, mperttunen@nvidia.com, airlied@gmail.com,
 simona@ffwll.ch, jonathanh@nvidia.com
Cc: dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org,
 linux-kernel@vger.kernel.org, Wentao Liang <vulab@iscas.ac.cn>,
 stable@vger.kernel.org
Subject: [PATCH] drm/tegra: Handle EDID allocation failures in
 tegra_output_connector_get_modes()
Date: Wed,  5 Mar 2025 23:40:38 +0800
Message-ID: <20250305154038.2062-1-vulab@iscas.ac.cn>
X-Mailer: git-send-email 2.42.0.windows.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: rQCowACXfTAAcchnVHqTEg--.44952S2
X-Coremail-Antispam: 1UD129KBjvJXoW7Ww1UWryxArWrXFyxuF1Utrb_yoW8JFWUpF
 srtFyY9ryktrWFkF1jyF18uFy3uas2kFWUK3s5Ca1q9rs0yr9Fqr45tw1UWFWUGr98JF13
 tanFqrW7JFyxCF7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUU9j14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
 1l84ACjcxK6xIIjxv20xvE14v26r1j6r1xM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r1j
 6r4UM28EF7xvwVC2z280aVAFwI0_Cr1j6rxdM28EF7xvwVC2z280aVCY1x0267AKxVW0oV
 Cq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
 I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Gr0_Cr1lOx8S6xCaFVCjc4AY6r1j6r
 4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwACI402YVCY1x02628v
 n2kIc2xKxwCY1x0262kKe7AKxVWUtVW8ZwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7x
 kEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E
 67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCw
 CI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1x
 MIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Jr0_GrUvcSsGvf
 C2KfnxnUUI43ZEXa7VUb8hL5UUUUU==
X-Originating-IP: [124.16.141.245]
X-CM-SenderInfo: pyxotu46lvutnvoduhdfq/1tbiCQ4MA2fILwlxYQABsQ
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

The return values of `drm_edid_dup()` and `drm_edid_read_ddc()` must
be checked in `tegra_output_connector_get_modes()` to prevent NULL
pointer dereferences. If either function fails, the function should
immediately return 0, indicating that no display modes can be retrieved.

A proper implementation can be found in `vidi_get_modes()`, where the
return values are carefully validated, and the function returns 0 upon
failure.

Fixes: 98365ca74cbf ("drm/tegra: convert to struct drm_edid")
Cc: stable@vger.kernel.org # 6.12+
Signed-off-by: Wentao Liang <vulab@iscas.ac.cn>
---
 drivers/gpu/drm/tegra/output.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/tegra/output.c b/drivers/gpu/drm/tegra/output.c
index 49e4f63a5550..360c4f83a4f8 100644
--- a/drivers/gpu/drm/tegra/output.c
+++ b/drivers/gpu/drm/tegra/output.c
@@ -39,6 +39,9 @@ int tegra_output_connector_get_modes(struct drm_connector *connector)
 	else if (output->ddc)
 		drm_edid = drm_edid_read_ddc(connector, output->ddc);
 
+	if (!drm_edid)
+		return 0;
+
 	drm_edid_connector_update(connector, drm_edid);
 	cec_notifier_set_phys_addr(output->cec,
 				   connector->display_info.source_physical_address);
-- 
2.42.0.windows.2

