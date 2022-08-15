Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DFEF45935D6
	for <lists+dri-devel@lfdr.de>; Mon, 15 Aug 2022 20:45:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 63A0EC1DAC;
	Mon, 15 Aug 2022 18:45:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 47A81D17C9
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Aug 2022 18:44:04 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 27FHMNaK030017;
 Mon, 15 Aug 2022 18:43:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=qcppdkim1;
 bh=vw2aEgsbaIt5/Zw31YZ4lk+xe6hLeF7vbcJ2MnvxF6k=;
 b=phk4YWV6PTYU+9EHaLJECmxMb0kLbT9vsI9iiBRG/5vsoI2ZupaeyQJRmrkgYAlJfs5d
 fr6A7lwlNRWaPLdchYSso+Ry7bMsVN5HgB/ZUECeOwK9KPc+E/d8vWfbAB1pCevJB7tX
 dJ3llJOrKM+GZbmg8nLlho1qTl8mAqF27X02cH5Nd3kCtot5dE8YUz+Y5eVj4TzwWVCi
 bjRCS2llK7/q8B/tYd0cZEcYiTGmTCv755jXYjM7Z1MRpBTAExFs3B/cUVgmttVDHZjb
 MAuxOlKoYM3yf2/nqZIL6OCizJqO1Cktp/Si4JLrWKyDiL9oWUkDTxe2pr37nZIF68Iy 7g== 
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3hx1nkpcyp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 15 Aug 2022 18:43:00 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 27FIgxH2002139
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 15 Aug 2022 18:42:59 GMT
Received: from jhugo-lnx.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Mon, 15 Aug 2022 11:42:58 -0700
From: Jeffrey Hugo <quic_jhugo@quicinc.com>
To: <airlied@linux.ie>, <daniel@ffwll.ch>, <maarten.lankhorst@linux.intel.com>,
 <mripard@kernel.org>, <tzimmermann@suse.de>
Subject: [RFC PATCH 00/14] QAIC DRM accelerator driver
Date: Mon, 15 Aug 2022 12:42:22 -0600
Message-ID: <1660588956-24027-1-git-send-email-quic_jhugo@quicinc.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: FszHdqSkAcX3-nHcj_vrX0c14wKRl-Dw
X-Proofpoint-ORIG-GUID: FszHdqSkAcX3-nHcj_vrX0c14wKRl-Dw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-15_08,2022-08-15_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0
 spamscore=0 priorityscore=1501 lowpriorityscore=0 suspectscore=0
 clxscore=1011 malwarescore=0 mlxscore=0 impostorscore=0 mlxlogscore=980
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2207270000 definitions=main-2208150070
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
Cc: Jeffrey Hugo <quic_jhugo@quicinc.com>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 quic_ajitpals@quicinc.com, quic_pkanojiy@quicinc.com, quic_carlv@quicinc.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This patchset introduces a Linux Kernel driver (QAIC - Qualcomm AIC) for the
Qualcomm Cloud AI 100 product (AIC100).

Qualcomm Cloud AI 100 is a PCIe adapter card that hosts a dedicated machine
learning inference accelerator.  Tons of documentation in the first patch of
the series.

The driver was a misc device until recently.  In accordance with the 2021
Ksummit (per LWN), it has been converted to a DRM driver due to the use of
dma_buf.

For historical purposes, the last revision that was on list is:
https://lore.kernel.org/all/1589897645-17088-1-git-send-email-jhugo@codeaurora.org/
The driver has evolved quite a bit in the two years since.

Regarding the open userspace, it is currently a work in progress (WIP) but will
be delivered.  The motivation for this RFC series is to get some early feedback
on the driver since Daniel Vetter and David Airlie indicated that would good
idea while the userspace is being worked on.

We are a bit new to the DRM area, and appreciate all guidence/feedback.

Questions we are hoping to get an answer to:

1. Does Qualcomm Cloud AI 100 fit in DRM?

2. Would a "QAIC" directory in the GPU documentation be acceptable?
   We'd like to split up the documentation into multiple files as we feel that
   would make it more organized.  It looks like only AMD has a directory,
   everyone else has a single file.

Things that are still a todo (in no particular order):

-Open userspace (see above)

-Figure out what to do with the device partitioning feature.  The uAPI for it
 is clunky.  Seems like perhaps it should fall under a cgroup.  The intent is
 to start a discussion over in the cgroup area to see what the experts say.

-Add proper documentation for our sysfs additions

-Extend the driver to export a few of the MHI channels to userspace.  We are
 currently using an old driver which was proposed and rejected.  Need to
 refactor and make something QAIC specific.

-Covert the documentation (patch 1) to proper rst syntax

Jeffrey Hugo (14):
  drm/qaic: Add documentation for AIC100 accelerator driver
  drm/qaic: Add uapi and core driver file
  drm/qaic: Add qaic.h internal header
  drm/qaic: Add MHI controller
  drm/qaic: Add control path
  drm/qaic: Add datapath
  drm/qaic: Add debugfs
  drm/qaic: Add RAS component
  drm/qaic: Add ssr component
  drm/qaic: Add sysfs
  drm/qaic: Add telemetry
  drm/qaic: Add tracepoints
  drm/qaic: Add qaic driver to the build system
  MAINTAINERS: Add entry for QAIC driver

 Documentation/gpu/drivers.rst         |    1 +
 Documentation/gpu/qaic.rst            |  567 +++++++++
 MAINTAINERS                           |    7 +
 drivers/gpu/drm/Kconfig               |    2 +
 drivers/gpu/drm/Makefile              |    1 +
 drivers/gpu/drm/qaic/Kconfig          |   33 +
 drivers/gpu/drm/qaic/Makefile         |   17 +
 drivers/gpu/drm/qaic/mhi_controller.c |  575 +++++++++
 drivers/gpu/drm/qaic/mhi_controller.h |   18 +
 drivers/gpu/drm/qaic/qaic.h           |  396 ++++++
 drivers/gpu/drm/qaic/qaic_control.c   | 1788 +++++++++++++++++++++++++++
 drivers/gpu/drm/qaic/qaic_data.c      | 2152 +++++++++++++++++++++++++++++++++
 drivers/gpu/drm/qaic/qaic_debugfs.c   |  335 +++++
 drivers/gpu/drm/qaic/qaic_debugfs.h   |   33 +
 drivers/gpu/drm/qaic/qaic_drv.c       |  825 +++++++++++++
 drivers/gpu/drm/qaic/qaic_ras.c       |  653 ++++++++++
 drivers/gpu/drm/qaic/qaic_ras.h       |   11 +
 drivers/gpu/drm/qaic/qaic_ssr.c       |  889 ++++++++++++++
 drivers/gpu/drm/qaic/qaic_ssr.h       |   13 +
 drivers/gpu/drm/qaic/qaic_sysfs.c     |  113 ++
 drivers/gpu/drm/qaic/qaic_telemetry.c |  851 +++++++++++++
 drivers/gpu/drm/qaic/qaic_telemetry.h |   14 +
 drivers/gpu/drm/qaic/qaic_trace.h     |  493 ++++++++
 include/uapi/drm/qaic_drm.h           |  283 +++++
 24 files changed, 10070 insertions(+)
 create mode 100644 Documentation/gpu/qaic.rst
 create mode 100644 drivers/gpu/drm/qaic/Kconfig
 create mode 100644 drivers/gpu/drm/qaic/Makefile
 create mode 100644 drivers/gpu/drm/qaic/mhi_controller.c
 create mode 100644 drivers/gpu/drm/qaic/mhi_controller.h
 create mode 100644 drivers/gpu/drm/qaic/qaic.h
 create mode 100644 drivers/gpu/drm/qaic/qaic_control.c
 create mode 100644 drivers/gpu/drm/qaic/qaic_data.c
 create mode 100644 drivers/gpu/drm/qaic/qaic_debugfs.c
 create mode 100644 drivers/gpu/drm/qaic/qaic_debugfs.h
 create mode 100644 drivers/gpu/drm/qaic/qaic_drv.c
 create mode 100644 drivers/gpu/drm/qaic/qaic_ras.c
 create mode 100644 drivers/gpu/drm/qaic/qaic_ras.h
 create mode 100644 drivers/gpu/drm/qaic/qaic_ssr.c
 create mode 100644 drivers/gpu/drm/qaic/qaic_ssr.h
 create mode 100644 drivers/gpu/drm/qaic/qaic_sysfs.c
 create mode 100644 drivers/gpu/drm/qaic/qaic_telemetry.c
 create mode 100644 drivers/gpu/drm/qaic/qaic_telemetry.h
 create mode 100644 drivers/gpu/drm/qaic/qaic_trace.h
 create mode 100644 include/uapi/drm/qaic_drm.h

-- 
2.7.4

