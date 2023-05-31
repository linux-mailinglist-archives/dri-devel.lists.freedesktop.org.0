Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C4F2718922
	for <lists+dri-devel@lfdr.de>; Wed, 31 May 2023 20:13:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 86FB110E065;
	Wed, 31 May 2023 18:13:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D913289233;
 Wed, 31 May 2023 18:13:43 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 34V8H132017586; Wed, 31 May 2023 18:13:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : subject :
 date : message-id : mime-version : content-type :
 content-transfer-encoding : to : cc; s=qcppdkim1;
 bh=jnC3UWZnuMssmGRIBn9FSVa8jE7AqeAfSgZoP5/O3N0=;
 b=D0nisQ/26DSNKKyF35ki3qG9qNt2DjpqAsKYI/e3wepbdvzl2IOJN4x1MUgCT3r6l6RN
 5F9ezzTrtv8EXxtU0qqtv00jwPrIbIPIb2V9hr5414uV1x4fEPiAnCOogXaquEyfYKpW
 nglfxm8hiwaBIE5UaBsk/rbspNosEynBt7ZA0jENVd2RZbUXkA2EoUoMFWCbpy6ut+8r
 KWJc0X6ZTStwdHhx5/OJd+pOdu0Xdz8eauwMTf6eyrzv7W+Z3xdKnowOV+Vy96CIcl05
 D/VHqMrLjrIx+kFTJrPOzoV+rvZPHkOXbwKVdtmW49w28UL2ybW/oOB63zefnlsKYoex SA== 
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3qwwbtj24a-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 31 May 2023 18:13:23 +0000
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com
 [10.46.141.250])
 by NASANPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 34VID2OU003020
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 31 May 2023 18:13:02 GMT
Received: from jesszhan-linux.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.42; Wed, 31 May 2023 11:13:02 -0700
From: Jessica Zhang <quic_jesszhan@quicinc.com>
Subject: [PATCH v2 0/2] Add support for Visionox R66451 AMOLED DSI panel
Date: Wed, 31 May 2023 11:12:31 -0700
Message-ID: <20230516-b4-r66451-panel-driver-v2-0-9c8d5eeef579@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAA+Od2QC/4WOQQ6CMBBFr0K6dkxbComuXHsEDYtOGWASKNgCw
 RDuLnABl+/nv/y/ikiBKYp7sopAM0fu/Q76kgjXWF8TcLmz0FKnMlM5oIGQ5yZTMFhPLZSBZwq
 AlTSYVZiWmRa7jDYSYLDeNYf+fEEXO/C0jNBOna2PzhCo4uUcfxc7NxzHPnzPL7M60r+zswIJR
 iuJDlHl5vb4TOzYu6vrO1Fs2/YDjmxi8eIAAAA=
To: Neil Armstrong <neil.armstrong@linaro.org>, Sam Ravnborg
 <sam@ravnborg.org>, David Airlie <airlied@gmail.com>, Daniel Vetter
 <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>
X-Mailer: b4 0.13-dev-02a79
X-Developer-Signature: v=1; a=ed25519-sha256; t=1685556782; l=1788;
 i=quic_jesszhan@quicinc.com; s=20230329; h=from:subject:message-id;
 bh=B/0asQMdL/LaMmqd6zsaL7/B67ZX+CdyB2w5irB73ZM=;
 b=rmN+Kn7iTcoh9RA9AcHB6gM4BSHF0ITtk9n0jy/bl0XRVSbg+hepYYe8i7cFWhqVnY6yzy1FC
 /fJOBnlo96yAs2RmG5f6KCcaJcHvlSaE+dPXGuZI4GEjdauMwhw5dXU
X-Developer-Key: i=quic_jesszhan@quicinc.com; a=ed25519;
 pk=gAUCgHZ6wTJOzQa3U0GfeCDH7iZLlqIEPo4rrjfDpWE=
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: zZgrGm3JFetZolnrrAtLk7x9Ba-dU8eK
X-Proofpoint-ORIG-GUID: zZgrGm3JFetZolnrrAtLk7x9Ba-dU8eK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-05-31_12,2023-05-31_03,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015
 impostorscore=0 lowpriorityscore=0 priorityscore=1501 mlxscore=0
 malwarescore=0 mlxlogscore=719 adultscore=0 spamscore=0 suspectscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2304280000 definitions=main-2305310154
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add support for the 1080x2340 Visionox R66451 AMOLED DSI panel that
comes with the Qualcomm HDK8350 display expansion pack.

The driver will come with display compression (DSC v1.2) enabled by
default.

Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
---
Changes in v2:
- Reworded panel bindings commit message for brevity (Krzysztof)
- Used corresponding *_set_column_address() and *_set_page_address() DCS
  helper methods (Dmitry)
- Moved *_set_display_[on|off]() and *_[exit|enter]_sleep_mode() calls
  into _enable() and _disable(), respectively (Dmitry)
- Dropped cpu_to_le16() conversion for
  mipi_dsi_dcs_set_display_brightness() (Dmitry)
- Unset LPM flag after DCS commands are sent in _on() (Dmitry)
- Used real numbers for mode values (Dmitry)
- Used drm_connector_helper_get_modes_fixed() in get_modes() (Dmitry)
- Added BACKLIGHT_CLASS_DEVICE as a Kconfig dependency (Neil)
- Added error handling for mipi_dsi_picture_parameter_set() (Marijn)
- Dropped "0x" for dcs->bits_per_pixel value (Marijn)
- Link to v1: https://lore.kernel.org/r/20230516-b4-r66451-panel-driver-v1-0-4210bcbb1649@quicinc.com

---
Jessica Zhang (2):
      dt-bindings: display: panel: Add Visionox R66451 AMOLED DSI panel
      drm/panel: Add driver for Visionox r66451 panel

 .../bindings/display/panel/visionox,r66451.yaml    |  59 ++++
 drivers/gpu/drm/panel/Kconfig                      |   9 +
 drivers/gpu/drm/panel/Makefile                     |   1 +
 drivers/gpu/drm/panel/panel-visionox-r66451.c      | 390 +++++++++++++++++++++
 4 files changed, 459 insertions(+)
---
base-commit: a5abc0900af0cfb1b8093200a265d2791864f26b
change-id: 20230516-b4-r66451-panel-driver-bf04b5fb3d52

Best regards,
-- 
Jessica Zhang <quic_jesszhan@quicinc.com>

