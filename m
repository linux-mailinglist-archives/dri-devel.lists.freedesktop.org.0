Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CCD3F72A680
	for <lists+dri-devel@lfdr.de>; Sat, 10 Jun 2023 01:01:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A86910E117;
	Fri,  9 Jun 2023 23:01:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 95D0B10E044;
 Fri,  9 Jun 2023 23:01:14 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 359MqWjM006850; Fri, 9 Jun 2023 23:01:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : subject :
 date : message-id : mime-version : content-type :
 content-transfer-encoding : to : cc; s=qcppdkim1;
 bh=RW6y4AoaNMZuV35hSkokUrFCMJK3XIXlv+7UunJer1Q=;
 b=GKGZKB900vq8su0xS2LRCSBsHDKWljSKY9E0hjrlG6QAKfnU1MVh2Z+mJqf0Ngw21TMh
 qzwy3RXOKKIW/o5TDRXenxEWbZbKYLMyq2bjH2Jdk5bstxp5fG3OeqPK25Nlrmrhdmf5
 xTpVg1R/uxDMPn78bsmTes+TGkKPQsQb2AXZMY793uPWwiJg61diR/b8wZ342GexsvM3
 xBb3WbgT93m+/gIpmyAeEWCIX5KED/Ez4YhOubN3wwBDZ+gNvqSsj/wusSsawhIEQaBh
 CcFFtX0FLPOYZg6Ru7h5iOhsK3uPh174PLt2pvUC3Z+5WZL4lgSHZv2BPAKvw/AJd39P Dg== 
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3r3xyx9tu1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 09 Jun 2023 23:01:11 +0000
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com
 [10.46.141.250])
 by NASANPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 359N1ADk028085
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 9 Jun 2023 23:01:10 GMT
Received: from jesszhan-linux.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.42; Fri, 9 Jun 2023 16:01:09 -0700
From: Jessica Zhang <quic_jesszhan@quicinc.com>
Subject: [PATCH v6 0/6] Add DSC v1.2 Support for DSI
Date: Fri, 9 Jun 2023 15:57:12 -0700
Message-ID: <20230405-add-dsc-support-v6-0-95eab864d1b6@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAEiug2QC/4XOSW7DMAwF0KsEWlcFNVruqvcostBA1Vp4qOQYC
 QLfvVJ2hVF4+UnwfT5JwZywkI/Lk2TcUknzVIN+uxA/2OkbaQo1Ew5cgARFbQg0FE/LbVnmvNK
 ITICzsjeSkXrlbEHqsp380O7GMtIJ72tbLRljur/Kvq41D6msc368ujfWpv/XbIwC1c7rCMJiJ
 9Tnzy35NPl3P4+kaRs/EXgVGHTcd4B9Z/RRECeCaD8gC0JZDtqJoyBPBNl+UMFGI6MJ3h0FdSK
 oKgA3noFRIHv2V9j3/ReWSHd+0wEAAA==
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 Marijn Suijten <marijn.suijten@somainline.org>
X-Mailer: b4 0.13-dev-c6835
X-Developer-Signature: v=1; a=ed25519-sha256; t=1686351669; l=4770;
 i=quic_jesszhan@quicinc.com; s=20230329; h=from:subject:message-id;
 bh=r51T/pbHSIIRGx8mkag7YafO3PQtpa78HE5QGJ64cGE=;
 b=q0nEP9jg5ZuV7t2Ffx/XAhZ4V9wldLH+TfFEEsYI/m1gHdRDkapH/AA9ADIiOxf7S7OPKCFXb
 4keJfPDp9QfAQNA/C+OTLf/7WHqDSkLPKh3J5YMUjiSoFjU1j2HQORr
X-Developer-Key: i=quic_jesszhan@quicinc.com; a=ed25519;
 pk=gAUCgHZ6wTJOzQa3U0GfeCDH7iZLlqIEPo4rrjfDpWE=
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: jDnwVn21H8cIi9lQDxu4b12ePqAc1QRH
X-Proofpoint-GUID: jDnwVn21H8cIi9lQDxu4b12ePqAc1QRH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-06-09_16,2023-06-09_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0
 suspectscore=0 priorityscore=1501 impostorscore=0 spamscore=0 bulkscore=0
 clxscore=1015 mlxscore=0 lowpriorityscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2305260000
 definitions=main-2306090195
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

Depends-on:
 - "add DSC 1.2 dpu supports" [1]
 - "Introduce MSM-specific DSC helpers" [2]
 - "drm/msm/dsi: use mult_frac for pclk_bpp calculation" [3]

[1] https://patchwork.freedesktop.org/series/116789/
[2] https://patchwork.freedesktop.org/series/115833/
[3] https://patchwork.freedesktop.org/patch/538273/?series=118072&rev=1

Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
---
Changes in v6:
- "Adjust" --> "Reduce" in pclk patch title (Marijn)
- dsi_adjust_compressed_pclk() --> dsi_adjust_pclk_for_compression()
  (Marijn)
- Moved dsi_adjust_pclk_for_compression() to before is_bonded_dsi pclk
  adjustment (Dmitry)
- Added documentation comments explaining the pclk_rate and hdisplay
  adjustments related to DSC (Dmitry)
- Only set DATA_COMPRESS bit if DSC is enabled (Abhinav)
- Rebased on top of latest msm-next-lumag branch
- Link to v5: https://lore.kernel.org/r/20230405-add-dsc-support-v5-0-028c10850491@quicinc.com

Changes in v5:
- Added newline before enable_compression() function pointer definition
- Rebased on top of "drm/msm/dsi: use mult_frac for pclk_bpp calculation"
- Reworded commit messages for clarity
- Dropped mentions of "soft slice" in commit messages
- "slice_per_packet" -> "slice_per_pkt"
- Picked up reviewed-by tags
- Link to v4: https://lore.kernel.org/r/20230405-add-dsc-support-v4-0-15daf84f8dcb@quicinc.com

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
Jessica Zhang (6):
      msm/drm/dsi: Round up DSC hdisplay calculation
      drm/msm/dsi: Reduce pclk rate for compression
      drm/msm/dpu: Add DPU_INTF_DATA_COMPRESS feature flag for DPU >= 7.0
      drm/msm/dpu: Set DATA_COMPRESS on command mode for DCE/DSC 1.2
      drm/msm/dsi: Remove incorrect references to slice_count
      drm/msm/dsi: Document DSC related pclk_rate and hdisplay calculations

 .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c   |  3 ++
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c     |  2 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h     |  2 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c        | 13 +++++
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h        |  3 ++
 drivers/gpu/drm/msm/dsi/dsi_host.c                 | 59 +++++++++++++++++-----
 6 files changed, 67 insertions(+), 15 deletions(-)
---
base-commit: 8dc20f06b90af85c083866df73dae69236183b62
change-id: 20230405-add-dsc-support-fe130ba49841

Best regards,
-- 
Jessica Zhang <quic_jesszhan@quicinc.com>

