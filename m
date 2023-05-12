Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 79390701157
	for <lists+dri-devel@lfdr.de>; Fri, 12 May 2023 23:32:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A7FA710E2FD;
	Fri, 12 May 2023 21:32:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B2FEA10E2C1;
 Fri, 12 May 2023 21:32:27 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 34CCjOXk022798; Fri, 12 May 2023 21:32:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : date :
 subject : mime-version : content-type : content-transfer-encoding :
 message-id : references : in-reply-to : to : cc; s=qcppdkim1;
 bh=yXyDWVgAOzXv6sYKfdbWH9j43X8wFYL+51bYCU8cy/0=;
 b=PATJWYcGpi8I8TemRXMqcnZZRq7jGhsoJB/K2cRgxA/2iA6U6bU0B1+JQbP+PvUS3cmD
 BhEqoy7kzdyk0eVWlAqDAPSml2Z0ulJRohWkJXOZ9eLKA2T7jAfBDWPZhbi0zYkKuF2O
 VNI51qhIJE5wiSVlr8KRh+3d+mfvqXvgUxHU2bJ3hw7O9gaTrENoZawhluhLJiH08Ze/
 Y0Jwfl4IWs3PTmR065y8aJtZDYaO5/xXofswiG6zjQ0tva6J6Np3Ppkd2TNM4mm0d5Tz
 vybkCrWIDhSTV2rB+z3GMvgzehnm9O/xHa6wiSLZ1JVcxv+kbueEOIwovKpD5LkAqBhi 6A== 
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3qhfww1wdf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 12 May 2023 21:32:25 +0000
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com
 [10.46.141.250])
 by NASANPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 34CLWOQR027691
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 12 May 2023 21:32:24 GMT
Received: from jesszhan-linux.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.42; Fri, 12 May 2023 14:32:24 -0700
From: Jessica Zhang <quic_jesszhan@quicinc.com>
Date: Fri, 12 May 2023 14:32:17 -0700
Subject: [PATCH v10 7/8] drm/msm/dsi: Use MSM and DRM DSC helper methods
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20230329-rfc-msm-dsc-helper-v10-7-4cb21168c227@quicinc.com>
References: <20230329-rfc-msm-dsc-helper-v10-0-4cb21168c227@quicinc.com>
In-Reply-To: <20230329-rfc-msm-dsc-helper-v10-0-4cb21168c227@quicinc.com>
To: <freedreno@lists.freedesktop.org>
X-Mailer: b4 0.13-dev-bfdf5
X-Developer-Signature: v=1; a=ed25519-sha256; t=1683927142; l=1884;
 i=quic_jesszhan@quicinc.com; s=20230329; h=from:subject:message-id;
 bh=Vt6g7AnRrOnFcPoYEFn0xzpPbonaTGXhpijGn/4YB70=;
 b=0MhfR1JSzYne17cK9OaUBcHvQLu1v74WXT+J6Qcc6VK1IFAl4jU1FkY/qPuBrGWTYR1zb3rXH
 45cl18VCItvDqfPiF2yFNgdFnmx0vd5rfz8X3bgJGaAABNYJiKRdMAD
X-Developer-Key: i=quic_jesszhan@quicinc.com; a=ed25519;
 pk=gAUCgHZ6wTJOzQa3U0GfeCDH7iZLlqIEPo4rrjfDpWE=
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: D0zEjU85DKF7USr3_S6OzKKWsGzN5VKp
X-Proofpoint-GUID: D0zEjU85DKF7USr3_S6OzKKWsGzN5VKp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-05-12_14,2023-05-05_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0
 priorityscore=1501 lowpriorityscore=0 mlxlogscore=843 malwarescore=0
 spamscore=0 clxscore=1015 adultscore=0 mlxscore=0 phishscore=0 bulkscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2304280000 definitions=main-2305120181
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
Cc: linux-arm-msm@vger.kernel.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 dri-devel@lists.freedesktop.org, Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>, Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Use MSM and DRM DSC helper methods to configure DSC for DSI.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>
Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
---
 drivers/gpu/drm/msm/dsi/dsi_host.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
index 74d38f90398a..9eeda018774e 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_host.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
@@ -28,6 +28,7 @@
 #include "dsi.xml.h"
 #include "sfpb.xml.h"
 #include "dsi_cfg.h"
+#include "msm_dsc_helper.h"
 #include "msm_kms.h"
 #include "msm_gem.h"
 #include "phy/dsi_phy.h"
@@ -848,7 +849,7 @@ static void dsi_update_dsc_timing(struct msm_dsi_host *msm_host, bool is_cmd_mod
 	/* first calculate dsc parameters and then program
 	 * compress mode registers
 	 */
-	slice_per_intf = DIV_ROUND_UP(hdisplay, dsc->slice_width);
+	slice_per_intf = msm_dsc_get_slice_per_intf(dsc, hdisplay);
 
 	/*
 	 * If slice_count is greater than slice_per_intf
@@ -858,7 +859,7 @@ static void dsi_update_dsc_timing(struct msm_dsi_host *msm_host, bool is_cmd_mod
 	if (dsc->slice_count > slice_per_intf)
 		dsc->slice_count = 1;
 
-	total_bytes_per_intf = dsc->slice_chunk_size * slice_per_intf;
+	total_bytes_per_intf = msm_dsc_get_bytes_per_intf(dsc, hdisplay);
 
 	eol_byte_num = total_bytes_per_intf % 3;
 	pkt_per_line = slice_per_intf / dsc->slice_count;
@@ -1759,7 +1760,7 @@ static int dsi_populate_dsc_params(struct msm_dsi_host *msm_host, struct drm_dsc
 		return ret;
 	}
 
-	dsc->initial_scale_value = 32;
+	dsc->initial_scale_value = drm_dsc_initial_scale_value(dsc);
 	dsc->line_buf_depth = dsc->bits_per_component + 1;
 
 	return drm_dsc_compute_rc_parameters(dsc);

-- 
2.40.1

