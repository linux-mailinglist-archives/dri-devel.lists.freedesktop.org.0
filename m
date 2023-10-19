Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 43CCA7CF0BA
	for <lists+dri-devel@lfdr.de>; Thu, 19 Oct 2023 09:07:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D68610E490;
	Thu, 19 Oct 2023 07:07:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 28E1D10E490
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Oct 2023 07:07:47 +0000 (UTC)
Received: from localhost.localdomain (unknown [103.93.195.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: vignesh)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 668C16607323;
 Thu, 19 Oct 2023 08:07:42 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1697699265;
 bh=B1diUinADNXWm3ntdscq3ZHYt8C+cQLYxftrutfyYY4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=aI13kLmXBTEgaMQYITB+frLxxPez9d5RjBe2/twup3GoZSM2nKcFccgrd0ZWetqVA
 o1PtgFu9xcejE39IXb4AkyvDuuFKbI2frmvTSkGJdXI+Sd2paRNq2LV/URNm0vssSP
 QPmSq/QAyZ+4uFEcqhTNYNBqioxq6uQPlu09aXO21Srq2XEx8igGyEip2zX37yJZDZ
 R/r/FM9kpYSLpY/PF39dBU68CqfVHofXM7j1UWctuwgOsO+2cMUlLlzE8grqMry1o3
 3R5ORPsi55ji5NEColzpB/ayzlDJyMlzrd0Izp9HnWaap4hdYmX5uTNNKmjbSxzMiw
 wP+OMB/LmE/Qw==
From: Vignesh Raman <vignesh.raman@collabora.com>
To: helen.koike@collabora.com,
	airlied@gmail.com,
	daniel@ffwll.ch
Subject: [PATCH v5 8/9] drm: ci: Add pipeline url to fails and flakes files
Date: Thu, 19 Oct 2023 12:36:49 +0530
Message-Id: <20231019070650.61159-9-vignesh.raman@collabora.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231019070650.61159-1-vignesh.raman@collabora.com>
References: <20231019070650.61159-1-vignesh.raman@collabora.com>
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
Cc: daniels@collabora.com, emma@anholt.net, gustavo.padovan@collabora.com,
 linux-arm-msm@vger.kernel.org, guilherme.gallo@collabora.com,
 sergi.blanch.torne@collabora.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org,
 david.heidelberg@collabora.com, linux-mediatek@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add or update pipeline url in the fails and flakes files.
It helps to check the pipeline where the failure was seen
and check artifacts for failure cases.

Signed-off-by: Vignesh Raman <vignesh.raman@collabora.com>
---

v5:
  - Added a new patch in the series to add pipeline url to fails and flakes files.

---
 drivers/gpu/drm/ci/xfails/update-xfails.py | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/ci/xfails/update-xfails.py b/drivers/gpu/drm/ci/xfails/update-xfails.py
index c401004ffd45..651f804721f2 100755
--- a/drivers/gpu/drm/ci/xfails/update-xfails.py
+++ b/drivers/gpu/drm/ci/xfails/update-xfails.py
@@ -63,6 +63,10 @@ def remove_unit_test_if_present(lines, unit_test_name):
         return
     lines[:] = [line for line in lines if unit_test_name not in line]
 
+def add_pipeline_url(lines, pipelines_urls):
+    for url in pipelines_urls:
+        pipeline_url = "# " + url + "\n"
+        lines.insert(0, pipeline_url)
 
 def add_unit_test_if_not_present(lines, unit_test_name, file_name):
     # core_getversion is mandatory
@@ -185,9 +189,11 @@ def main(pipelines_urls, only_flakes):
         flakes_txt.sort()
 
         if fails_txt != fails_txt_original:
+            add_pipeline_url(fails_txt, pipelines_urls)
             save_file(fails_txt, fails_txt_path)
             print_diff(fails_txt_original, fails_txt, os.path.basename(fails_txt_path))
         if flakes_txt != flakes_txt_original:
+            add_pipeline_url(flakes_txt, pipelines_urls)
             save_file(flakes_txt, flakes_txt_path)
             print_diff(flakes_txt_original, flakes_txt, os.path.basename(flakes_txt_path))
 
-- 
2.40.1

