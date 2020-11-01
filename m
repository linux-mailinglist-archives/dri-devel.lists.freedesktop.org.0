Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2821C2A2076
	for <lists+dri-devel@lfdr.de>; Sun,  1 Nov 2020 18:38:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1313D6EB25;
	Sun,  1 Nov 2020 17:38:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-002e3701.pphosted.com (mx0a-002e3701.pphosted.com
 [148.163.147.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 672DA6E0BC
 for <dri-devel@lists.freedesktop.org>; Sun,  1 Nov 2020 15:01:30 +0000 (UTC)
Received: from pps.filterd (m0134422.ppops.net [127.0.0.1])
 by mx0b-002e3701.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0A1EgrGU020387; Sun, 1 Nov 2020 14:42:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hpe.com;
 h=from : to : cc : subject
 : date : message-id : mime-version; s=pps0720;
 bh=yv27s7RCBX/TWQjfzBWzQfYgerna7orjR+8Y7ZUqguI=;
 b=bjNLOQV5RV9jjfxMpG3nFxY0LXe/XIeyukJ+GfkwB++Mcbo1UX3z7ZhUTsw8rEAb+z/n
 QeqD43pRxexMm5y5S/CTyqg8fIDJPlqftnQWT6sq6nq6U4uwNDREYx9Rb9OYfSf7Ej4J
 VS7msfjhWcdH5yDIJsX+I8Sbe+9c8/nz8Xmk6NWLLqXrfYY0fgtHPHhtmv/1esPy4ef3
 MhfAZkOfYNmvvZsx58PtA33zB5m4WQhy7onvx7IEN5G84AXE42/9VyzVjuBX09/i5OcE
 ExeNu9jRcEs60zXVFzqtuepUWGcYC7ecslfNa1MSHzwbH5HRMnGKE00cgsGu+T055F8p gw== 
Received: from g9t5008.houston.hpe.com (g9t5008.houston.hpe.com [15.241.48.72])
 by mx0b-002e3701.pphosted.com with ESMTP id 34hhn5b68e-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sun, 01 Nov 2020 14:42:53 +0000
Received: from g4t3433.houston.hpecorp.net (g4t3433.houston.hpecorp.net
 [16.208.49.245])
 by g9t5008.houston.hpe.com (Postfix) with ESMTP id F3C7A53;
 Sun,  1 Nov 2020 14:42:50 +0000 (UTC)
Received: from rfwz62.ftc.rdlabs.hpecorp.net (rfwz62.americas.hpqcorp.net
 [10.33.237.8])
 by g4t3433.houston.hpecorp.net (Postfix) with ESMTP id 74F1949;
 Sun,  1 Nov 2020 14:42:49 +0000 (UTC)
From: rwright@hpe.com
To: jani.nikula@linux.intel.com, joonas.lahtinen@linux.intel.com,
 rodrigo.vivi@intel.com, airlied@linux.ie, daniel@ffwll.ch,
 sumit.semwal@linaro.org, christian.koenig@amd.com, hdegoede@redhat.com,
 wambui.karugax@gmail.com, chris@chris-wilson.co.uk,
 matthew.auld@intel.com, akeem.g.abodunrin@intel.com,
 prathap.kumar.valsan@intel.com, mika.kuoppala@linux.intel.com,
 rwright@hpe.com
Subject: [PATCH v3 0/3] Reduce context clear batch size to avoid gpu hang
Date: Sun,  1 Nov 2020 07:42:41 -0700
Message-Id: <20201101144244.10086-1-rwright@hpe.com>
X-Mailer: git-send-email 2.17.1
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-HPE-SCL: -1
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312, 18.0.737
 definitions=2020-11-01_05:2020-10-30,
 2020-11-01 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 mlxlogscore=915
 suspectscore=0 clxscore=1011 lowpriorityscore=0 impostorscore=0
 priorityscore=1501 mlxscore=0 bulkscore=0 phishscore=0 spamscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2011010120
X-Mailman-Approved-At: Sun, 01 Nov 2020 17:36:56 +0000
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Randy Wright <rwright@hpe.com>

For several months, I've been experiencing GPU hangs when  starting
Cinnamon on an HP Pavilion Mini 300-020 if I try to run an upstream
kernel.  I reported this recently in
https://gitlab.freedesktop.org/drm/intel/-/issues/2413 where I have
attached the requested evidence including the state collected from
/sys/class/drm/card0/error and debug output from dmesg.

I ran a bisect to find the problem, which indicates this is the
troublesome commit:

  [47f8253d2b8947d79fd3196bf96c1959c0f25f20] drm/i915/gen7: Clear all EU/L3 residual contexts

The nature of that commit suggested to me that reducing the
batch size used in the context clear operation might help this
relatively low-powered system to avoid the hang.... and it did!
I simply forced this system to take the smaller batch length that is
already used for non-Haswell systems.

The first two versions of this patch were posted as RFC
patches to the Intel-gfx list, implementing the same
algorithmic change in function batch_get_defaults,
but without employing a properly constructed quirk.

I've now cleaned up the patch to employ a new QUIRK_RENDERCLEAR_REDUCED.
The quirk is presently set only for the aforementioned HP Pavilion Mini
300-020.  The patch now touches three files to define the quirk, set it,
and then check for it in function batch_get_defaults.

Randy Wright (3):
  drm/i915: Introduce quirk QUIRK_RENDERCLEAR_REDUCED
  drm/i915/display: Add function quirk_renderclear_reduced
  drm/i915/gt: Force reduced batch size if new QUIRK_RENDERCLEAR_REDUCED
    is set.

 drivers/gpu/drm/i915/display/intel_quirks.c | 13 +++++++++++++
 drivers/gpu/drm/i915/gt/gen7_renderclear.c  |  2 +-
 drivers/gpu/drm/i915/i915_drv.h             |  1 +
 3 files changed, 15 insertions(+), 1 deletion(-)

-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
