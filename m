Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 16ACB2A25D4
	for <lists+dri-devel@lfdr.de>; Mon,  2 Nov 2020 09:09:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 81CE66E425;
	Mon,  2 Nov 2020 08:08:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-002e3701.pphosted.com (mx0a-002e3701.pphosted.com
 [148.163.147.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F5E16E1D6;
 Sun,  1 Nov 2020 17:41:52 +0000 (UTC)
Received: from pps.filterd (m0150241.ppops.net [127.0.0.1])
 by mx0a-002e3701.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0A1HY2bd003992; Sun, 1 Nov 2020 17:41:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hpe.com;
 h=from : to : cc : subject
 : date : message-id : mime-version; s=pps0720;
 bh=yv27s7RCBX/TWQjfzBWzQfYgerna7orjR+8Y7ZUqguI=;
 b=o9nkoHu3Vbo1NR+UYOy1rCbguRWTdbu04eIFOgF1ueAZ4CSTStFnI/dCduhbI7+FvIsE
 mC+FLPGgseNEYTNSpaCqPIz6fd8Kw855vC+oLXHTP2qEDJ9zVyJiSqdHYcikcgoRWpGK
 fhmmAyzZRVIIah0qCJuY7kSdwG3QZA0Gdo4ShogHZ/ApZU3RHDpDPOQdVuSJCGravD+8
 xDjfz5n77Y5kRo00a9ZjiluMrTn7WhUjFd/2W8EHjFR7q7E/7/7OIhM5rxFbzF0wSHg3
 SEIe9XFDTWjeRAWzP6htQ5fkRlbvTVHhWiRjrGRh7K0Kfi5/EJo8BCLOMmTdZjE5DFFH oQ== 
Received: from g2t2352.austin.hpe.com (g2t2352.austin.hpe.com [15.233.44.25])
 by mx0a-002e3701.pphosted.com with ESMTP id 34hhavm18c-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sun, 01 Nov 2020 17:41:40 +0000
Received: from g2t2360.austin.hpecorp.net (g2t2360.austin.hpecorp.net
 [16.196.225.135])
 by g2t2352.austin.hpe.com (Postfix) with ESMTP id 370E685;
 Sun,  1 Nov 2020 17:41:39 +0000 (UTC)
Received: from rfwz62.ftc.rdlabs.hpecorp.net (rfwz62.americas.hpqcorp.net
 [10.33.237.8])
 by g2t2360.austin.hpecorp.net (Postfix) with ESMTP id 2FBFD36;
 Sun,  1 Nov 2020 17:41:35 +0000 (UTC)
From: rwright@hpe.com
To: jani.nikula@linux.intel.com, joonas.lahtinen@linux.intel.com,
 rodrigo.vivi@intel.com, airlied@linux.ie, daniel@ffwll.ch,
 sumit.semwal@linaro.org, christian.koenig@amd.com, hdegoede@redhat.com,
 wambui.karugax@gmail.com, chris@chris-wilson.co.uk,
 matthew.auld@intel.com, akeem.g.abodunrin@intel.com,
 prathap.kumar.valsan@intel.com, mika.kuoppala@linux.intel.com,
 rwright@hpe.com
Subject: [PATCH v3 0/3] Reduce context clear batch size to avoid gpu hang
Date: Sun,  1 Nov 2020 10:41:29 -0700
Message-Id: <20201101174132.10513-1-rwright@hpe.com>
X-Mailer: git-send-email 2.17.1
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-HPE-SCL: -1
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312, 18.0.737
 definitions=2020-11-01_05:2020-10-30,
 2020-11-01 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 mlxlogscore=792
 adultscore=0 suspectscore=0 malwarescore=0 bulkscore=0 spamscore=0
 impostorscore=0 lowpriorityscore=0 priorityscore=1501 mlxscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
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
