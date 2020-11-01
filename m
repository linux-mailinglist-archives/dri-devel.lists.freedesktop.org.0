Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 06E422A25D7
	for <lists+dri-devel@lfdr.de>; Mon,  2 Nov 2020 09:09:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C692A6E42F;
	Mon,  2 Nov 2020 08:08:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-002e3701.pphosted.com (mx0b-002e3701.pphosted.com
 [148.163.143.35])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 052F86EB35;
 Sun,  1 Nov 2020 17:41:56 +0000 (UTC)
Received: from pps.filterd (m0150244.ppops.net [127.0.0.1])
 by mx0b-002e3701.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0A1HY8QX029485; Sun, 1 Nov 2020 17:41:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hpe.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references; s=pps0720;
 bh=OA1AyoIUxAdKprQIlZ9yrzznCb8iuBhc83hjN12ArsA=;
 b=Aj26bR01ZtQciS+1SIw3E3fM4+fT5TilHJ6bFFsTSe1GGYYARcGbDw4jVQYS5Gpuf3Fw
 elKtF2LFQYOetSjBLTaaUya8g0JemFXASG9vaGmtYK7edoL0NOapGaGmoa80cw3G8XMb
 X6EsBP0G4iYlva4AhR4ee6V0kldZ9UBK+xnnRQ5xlTo3DfdsaliatTaZtdMy2sraQnBF
 0ElnkrSHOEOVlN23di1SYmZf0cRIMPvDgMLq1vs3tn8iPRbB9Y8jPAzr/NT5xxm7X2Cx
 mApYJpgnWf5oxDqmdKnVoNQ7+/G/5JMiLWizpMk9lmjNAFVL89ag9dZvvIO97/LDwnJU 0A== 
Received: from g2t2353.austin.hpe.com (g2t2353.austin.hpe.com [15.233.44.26])
 by mx0b-002e3701.pphosted.com with ESMTP id 34h0k1rc21-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sun, 01 Nov 2020 17:41:47 +0000
Received: from g2t2360.austin.hpecorp.net (g2t2360.austin.hpecorp.net
 [16.196.225.135])
 by g2t2353.austin.hpe.com (Postfix) with ESMTP id 0B46565;
 Sun,  1 Nov 2020 17:41:46 +0000 (UTC)
Received: from rfwz62.ftc.rdlabs.hpecorp.net (rfwz62.americas.hpqcorp.net
 [10.33.237.8])
 by g2t2360.austin.hpecorp.net (Postfix) with ESMTP id 1F68D36;
 Sun,  1 Nov 2020 17:41:45 +0000 (UTC)
From: rwright@hpe.com
To: jani.nikula@linux.intel.com, joonas.lahtinen@linux.intel.com,
 rodrigo.vivi@intel.com, airlied@linux.ie, daniel@ffwll.ch,
 sumit.semwal@linaro.org, christian.koenig@amd.com, hdegoede@redhat.com,
 wambui.karugax@gmail.com, chris@chris-wilson.co.uk,
 matthew.auld@intel.com, akeem.g.abodunrin@intel.com,
 prathap.kumar.valsan@intel.com, mika.kuoppala@linux.intel.com,
 rwright@hpe.com
Subject: [PATCH v3 2/3] drm/i915/display: Add function
 quirk_renderclear_reduced
Date: Sun,  1 Nov 2020 10:41:31 -0700
Message-Id: <20201101174132.10513-3-rwright@hpe.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201101174132.10513-1-rwright@hpe.com>
References: <20201101174132.10513-1-rwright@hpe.com>
X-HPE-SCL: -1
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312, 18.0.737
 definitions=2020-11-01_05:2020-10-30,
 2020-11-01 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=2 adultscore=0
 clxscore=1015 mlxlogscore=940 lowpriorityscore=0 mlxscore=0 spamscore=0
 malwarescore=0 phishscore=0 priorityscore=1501 bulkscore=0 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2011010145
X-Mailman-Approved-At: Mon, 02 Nov 2020 08:08:52 +0000
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
Cc: intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Randy Wright <rwright@hpe.com>

Added function quirk_renderclear_reduced to set QUIRK_RENDERCLEAR_REDUCED
for designated platforms.  Applying QUIRK_RENDERCLEAR_REDUCED for
the HP Pavilion Mini 300-020 prevents a GPU hang.

Signed-off-by: Randy Wright <rwright@hpe.com>
---
 drivers/gpu/drm/i915/display/intel_quirks.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_quirks.c b/drivers/gpu/drm/i915/display/intel_quirks.c
index 46beb155d835..630b984ba49c 100644
--- a/drivers/gpu/drm/i915/display/intel_quirks.c
+++ b/drivers/gpu/drm/i915/display/intel_quirks.c
@@ -53,6 +53,16 @@ static void quirk_increase_ddi_disabled_time(struct drm_i915_private *i915)
 	drm_info(&i915->drm, "Applying Increase DDI Disabled quirk\n");
 }
 
+/*
+ * Force use of smaller batch size in gen7_renderclear.c
+ * Needed on (at least) HP Pavilion Mini 300-020 to avoid GPU hang.
+ */
+static void quirk_renderclear_reduced(struct drm_i915_private *i915)
+{
+	i915->quirks |= QUIRK_RENDERCLEAR_REDUCED;
+	drm_info(&i915->drm, "Applying Renderclear Reduced quirk\n");
+}
+
 struct intel_quirk {
 	int device;
 	int subsystem_vendor;
@@ -141,6 +151,9 @@ static struct intel_quirk intel_quirks[] = {
 	/* HP Chromebook 14 (Celeron 2955U) */
 	{ 0x0a06, 0x103c, 0x21ed, quirk_backlight_present },
 
+	/* HP Mini 300-020 */
+	{ 0x0a06, 0x103c, 0x2b38, quirk_renderclear_reduced },
+
 	/* Dell Chromebook 11 */
 	{ 0x0a06, 0x1028, 0x0a35, quirk_backlight_present },
 
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
