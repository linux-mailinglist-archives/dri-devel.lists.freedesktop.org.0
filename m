Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C42570CAFF
	for <lists+dri-devel@lfdr.de>; Mon, 22 May 2023 22:30:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F283A10E37D;
	Mon, 22 May 2023 20:30:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 724D210E28C;
 Mon, 22 May 2023 20:30:42 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 34MJq6h3008604; Mon, 22 May 2023 20:30:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : subject :
 date : message-id : mime-version : content-type :
 content-transfer-encoding : to : cc; s=qcppdkim1;
 bh=vLqKLO1BUpzQZwWunNwMNnH6hu7BMla/ZM9oufiLLSQ=;
 b=DyidkjpsPoEsw5Sa+oWmszCWkwzKpkcFXxECxrIu2M74NyI2DjlBtzKbZRmPyMt7V87I
 afGa2YXCCJPYn1YiRZJa8h14sxgf+2Hd9nPNiwqwbOyA8cGuS0pdHyl9h9kfxVNyJfWU
 7DxFdYSjzzwIgzJeubH7HFegEb4Bw+g51xxMsSqadViPiOB485NNFG5Vzgf7JvBQJsr9
 UpL/YzJ88Bjkhu4vpKgf75EBeXeevQuqTNGwqoqv9Ni6Lus0Lu0WIXrGiqDX6jfrTJYn
 egPIkBh5gLZbAEHqkEhDEJtWpB4kpgr0LMchs52S7QSHQ6fvArfu59UcLN4TuHku/Fta Vw== 
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3qre8p03ye-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 22 May 2023 20:30:40 +0000
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com
 [10.46.141.250])
 by NASANPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 34MKUdKp032333
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 22 May 2023 20:30:39 GMT
Received: from jesszhan-linux.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.42; Mon, 22 May 2023 13:30:38 -0700
From: Jessica Zhang <quic_jesszhan@quicinc.com>
Subject: [PATCH v4 0/5] Add DSC v1.2 Support for DSI
Date: Mon, 22 May 2023 13:30:19 -0700
Message-ID: <20230405-add-dsc-support-v4-0-15daf84f8dcb@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANvQa2QC/4WOOw7CMBBErxK5ZtHazgeouAei8GdDXMQJdhKBU
 O6OnQ4hRDmzmvf2xSIFR5GdihcLtLjoBp9CuSuY6ZS/ETibMhMoJJZYgbIWbDQQ53EcwgQtcYl
 alcdDyVlaaRUJdFDedHnXxx48PaZ8GgO17rHJLteUOxenITw398Jz+1uzcECotalblIoaWZ3vs
 zPOm70ZepZpi/hDEInAsRGmQTo2h/qbIP8QZP6BuJWVElhr+UlY1/UNBqs8l08BAAA=
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 Marijn Suijten <marijn.suijten@somainline.org>
X-Mailer: b4 0.13-dev-bfdf5
X-Developer-Signature: v=1; a=ed25519-sha256; t=1684787438; l=3535;
 i=quic_jesszhan@quicinc.com; s=20230329; h=from:subject:message-id;
 bh=e6Fl0fdsd/cKcvWsiYtQZ3LOz/0x54V8DgWbX2TkeYA=;
 b=MFXYpjihrnAStLaSuYj96wxZPkzsRf4VWeHkM8KYlHyljroh5wPrmjTY4vGe56baUwKJj6Vn8
 DaNirYWcDKWBPKiXYh8AP7MfhzNEc5af3kL9MbDbabRBzg9Jy5KkYJ5
X-Developer-Key: i=quic_jesszhan@quicinc.com; a=ed25519;
 pk=gAUCgHZ6wTJOzQa3U0GfeCDH7iZLlqIEPo4rrjfDpWE=
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: EzLYt6cECu4ZwKwKzlk5J8NcTUtcX2qQ
X-Proofpoint-GUID: EzLYt6cECu4ZwKwKzlk5J8NcTUtcX2qQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-05-22_14,2023-05-22_03,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 suspectscore=0 adultscore=0 mlxlogscore=999 mlxscore=0 malwarescore=0
 bulkscore=0 lowpriorityscore=0 spamscore=0 impostorscore=0 clxscore=1015
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2304280000 definitions=main-2305220173
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
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Konrad Dybcio <konrad.dybcio@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is a series of changes for DSI to enable command mode support
for DSC v1.2.

This includes:

1) Rounding up `hdisplay / 3` in dsc_timing_setup()
2) Adjusting pclk_rate to account for compression
3) Fixing incorrect uses of slice_count in DSI DSC calculations
4) Setting the DATA_COMPRESS bit when DSC is enabled

With these changes (and the dependency below), DSC v1.2 should work over
DSI in command mode.

Note: Changes that add DSC v1.2 support for video mode will be posted
with the DP support changes.

Depends-on: "add DSC 1.2 dpu supports" [1] and "Introduce MSM-specific
DSC helpers" [2]

[1] https://patchwork.freedesktop.org/series/116789/
[2] https://patchwork.freedesktop.org/series/115833/

Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
---
Changes in v4:
- Clarified slice_per_pkt comment regarding pkt_per_line calculations
- Reworded commit message for "drm/msm/dsi: Remove incorrect references
  to slice_count"
- Wrapped INTF_SC7280_MASK macro definition in parentheses
- Fixed incorrect commit hash in "msm/drm/dsi: Round up DSC hdisplay
  calculation"
- Picked up Reviewed-by tag
- Link to v3: https://lore.kernel.org/r/20230405-add-dsc-support-v3-0-6e1d35a206b3@quicinc.com

Changes in v3:
- Added fix to round up hdisplay DSC adjustment
- Fixed inconsistent whitespace in dpu_hw_intf_ops comment doc
- Moved placement of dpu_hw_intf_enable_compression
- Picked up "drm/msm/dsi: Fix calculation for pkt_per_line" patch and
  squashed all slice_count fixes into a single patch
- Use drm_mode_vrefresh() to calculate adjusted pclk rate
- Moved compressed pclk adjustment to dsi_adjust_compressed_pclk() helper
- Rebased changes on top of updated dependencies
- Reworded commit message for "drm/msm/dpu: Set DATA_COMPRESS for
  command mode" for clarity
- Removed revision changelog in commit messages
- Link to v2: https://lore.kernel.org/r/20230405-add-dsc-support-v2-0-1072c70e9786@quicinc.com

Changes in v2:
- Changed has_data_compress dpu_cap to a DATA_COMPRESS INTF feature flag
- Changed pclk math to only divide hdisplay by compression ratio
- Reworded word count TODO comment
- Make DATA_COMPRESS an INTF flag
- Read INTF_CONFIG2 before writing to DATA_COMPRESS bit
- Fixed whitespace issue in macro definition
- Removed `inline` from dpu_hw_intf_enable_compression declaration
- Only set dpu_hw_intf_ops.data_compress if DATA_COMPRESS feature is set
- Reworded commit messages and cover letter for clarity
- Link to v1: https://lore.kernel.org/r/20230405-add-dsc-support-v1-0-6bc6f03ae735@quicinc.com

---
Jessica Zhang (5):
      msm/drm/dsi: Round up DSC hdisplay calculation
      drm/msm/dsi: Adjust pclk rate for compression
      drm/msm/dpu: Add DPU_INTF_DATA_COMPRESS feature flag
      drm/msm/dpu: Set DATA_COMPRESS for command mode
      drm/msm/dsi: Remove incorrect references to slice_count

 .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c   |  3 ++
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c     |  3 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h     |  2 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c        | 13 ++++++
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h        |  2 +
 drivers/gpu/drm/msm/dsi/dsi_host.c                 | 51 +++++++++++++++-------
 6 files changed, 58 insertions(+), 16 deletions(-)
---
base-commit: 2f0218fa4805d7c7eed8dc072e1bdf9f100492c7
change-id: 20230405-add-dsc-support-fe130ba49841

Best regards,
-- 
Jessica Zhang <quic_jesszhan@quicinc.com>

