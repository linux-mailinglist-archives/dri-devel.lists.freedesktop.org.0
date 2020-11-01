Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 44CE82A25D8
	for <lists+dri-devel@lfdr.de>; Mon,  2 Nov 2020 09:09:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 24B936E433;
	Mon,  2 Nov 2020 08:08:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-002e3701.pphosted.com (mx0b-002e3701.pphosted.com
 [148.163.143.35])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B54CE6EB35;
 Sun,  1 Nov 2020 17:41:57 +0000 (UTC)
Received: from pps.filterd (m0134425.ppops.net [127.0.0.1])
 by mx0b-002e3701.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0A1HY60v007825; Sun, 1 Nov 2020 17:41:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hpe.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references; s=pps0720;
 bh=XKYXzHc3s326T/Mq3Yl8HKAAp7g4arn3+L3mg5rGF5E=;
 b=TglZpQGwnBtvM8RcKeFMcu7JVb72gaEzpG/MWSjhbuK5ZU2ubvGsdMHgQukIuFGJlt9H
 5P79ol/p8s416sI6S3cc24u+rUAPTDPHHvCmb1S/9k2CBi5y47M9x3cYo4uaKdzkpHoi
 ZFS8pYPFogAN4aY5vbej2bma0rCvk2NYQ65zI2pkQIpRSfJ5CUwVxV1JaDWV6iCZeywr
 qNyyQEejBpsc6Tst4jfgg9DbMPJWcMcn39GpWa0yzcl0mykf1+pJ9GkdRXgOAMjSjPcf
 O94sX4h05mJW33PKmi7kLifLB8NQYAP79ceB/+JNjCuw7MNeNT3u32mWgcs/9JFBjsBg EQ== 
Received: from g2t2352.austin.hpe.com (g2t2352.austin.hpe.com [15.233.44.25])
 by mx0b-002e3701.pphosted.com with ESMTP id 34h17n85e6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sun, 01 Nov 2020 17:41:43 +0000
Received: from g2t2360.austin.hpecorp.net (g2t2360.austin.hpecorp.net
 [16.196.225.135])
 by g2t2352.austin.hpe.com (Postfix) with ESMTP id 9D84F62;
 Sun,  1 Nov 2020 17:41:42 +0000 (UTC)
Received: from rfwz62.ftc.rdlabs.hpecorp.net (rfwz62.americas.hpqcorp.net
 [10.33.237.8])
 by g2t2360.austin.hpecorp.net (Postfix) with ESMTP id A413F36;
 Sun,  1 Nov 2020 17:41:41 +0000 (UTC)
From: rwright@hpe.com
To: jani.nikula@linux.intel.com, joonas.lahtinen@linux.intel.com,
 rodrigo.vivi@intel.com, airlied@linux.ie, daniel@ffwll.ch,
 sumit.semwal@linaro.org, christian.koenig@amd.com, hdegoede@redhat.com,
 wambui.karugax@gmail.com, chris@chris-wilson.co.uk,
 matthew.auld@intel.com, akeem.g.abodunrin@intel.com,
 prathap.kumar.valsan@intel.com, mika.kuoppala@linux.intel.com,
 rwright@hpe.com
Subject: [PATCH v3 1/3] drm/i915: Introduce quirk QUIRK_RENDERCLEAR_REDUCED
Date: Sun,  1 Nov 2020 10:41:30 -0700
Message-Id: <20201101174132.10513-2-rwright@hpe.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201101174132.10513-1-rwright@hpe.com>
References: <20201101174132.10513-1-rwright@hpe.com>
X-HPE-SCL: -1
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312, 18.0.737
 definitions=2020-11-01_05:2020-10-30,
 2020-11-01 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 clxscore=1015 mlxscore=0 mlxlogscore=626 malwarescore=0 phishscore=0
 adultscore=0 spamscore=0 impostorscore=0 suspectscore=2 bulkscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2011010145
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

Introduce quirk QUIRK_RENDERCLEAR_REDUCED, which will be used
to force a limited batch buffer size for clearing
residual contexts in gen7_renderclear.c.

Signed-off-by: Randy Wright <rwright@hpe.com>
---
 drivers/gpu/drm/i915/i915_drv.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/i915/i915_drv.h b/drivers/gpu/drm/i915/i915_drv.h
index e4f7f6518945..e8873462eb2c 100644
--- a/drivers/gpu/drm/i915/i915_drv.h
+++ b/drivers/gpu/drm/i915/i915_drv.h
@@ -525,6 +525,7 @@ struct i915_psr {
 #define QUIRK_PIN_SWIZZLED_PAGES (1<<5)
 #define QUIRK_INCREASE_T12_DELAY (1<<6)
 #define QUIRK_INCREASE_DDI_DISABLED_TIME (1<<7)
+#define QUIRK_RENDERCLEAR_REDUCED (1<<8)
 
 struct intel_fbdev;
 struct intel_fbc_work;
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
