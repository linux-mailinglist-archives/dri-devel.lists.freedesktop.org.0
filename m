Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 021E572A67A
	for <lists+dri-devel@lfdr.de>; Sat, 10 Jun 2023 01:01:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA28010E0E6;
	Fri,  9 Jun 2023 23:01:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A57710E072;
 Fri,  9 Jun 2023 23:01:14 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 359MKHr8023367; Fri, 9 Jun 2023 23:01:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : date :
 subject : mime-version : content-type : content-transfer-encoding :
 message-id : references : in-reply-to : to : cc; s=qcppdkim1;
 bh=9vBfpXzZLqwFOhu+9A67oENBK77yXGBNcvNDeekEGt0=;
 b=Thjn6bbuV4kUmwq4qHdnlUH+OvYf2iHjYuJQuQUZwpf/j8bJOsa9jB+wESD+LHwdqN0M
 y8Z6D1gwESg8K6beApvqDJj6vM0bW6JtqhCIbyfV8rHnIge5d/cR2MSd3ZTOMy30y+wR
 JMa4C25uFXl0hpHMRESpWE+zFMgOwvOJed6yLMqf08FnVQxoewFHhoCKKGE7Xv2dhPBm
 egbtjrQ4bs7B+Bu5oYibYi0pqKJqJGn2OtWtMVUD5oczz/gXUr3D85xzuk0VVYHYMHZt
 s7Bo5NFnzCr15djPY8oPHxaPF+aD6Zoy6O6IsuZXrhX0CrG8KulptmSjWwXUjL+coizg YA== 
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3r3t70j9u8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 09 Jun 2023 23:01:11 +0000
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com
 [10.46.141.250])
 by NASANPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 359N1ADl028085
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 9 Jun 2023 23:01:10 GMT
Received: from jesszhan-linux.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.42; Fri, 9 Jun 2023 16:01:10 -0700
From: Jessica Zhang <quic_jesszhan@quicinc.com>
Date: Fri, 9 Jun 2023 15:57:13 -0700
Subject: [PATCH v6 1/6] msm/drm/dsi: Round up DSC hdisplay calculation
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20230405-add-dsc-support-v6-1-95eab864d1b6@quicinc.com>
References: <20230405-add-dsc-support-v6-0-95eab864d1b6@quicinc.com>
In-Reply-To: <20230405-add-dsc-support-v6-0-95eab864d1b6@quicinc.com>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 Marijn Suijten <marijn.suijten@somainline.org>
X-Mailer: b4 0.13-dev-c6835
X-Developer-Signature: v=1; a=ed25519-sha256; t=1686351669; l=1159;
 i=quic_jesszhan@quicinc.com; s=20230329; h=from:subject:message-id;
 bh=Z7rGYxUoEMDO6n2vIOFZD5Q+cCpRrXZUZzZaiIEp3qE=;
 b=96ZYlaWBOZRyER84/FzILXFq80g6gqtuur2f83tEprH710GhJFw1t8RfscwftKwu/xEyj7Nhb
 jMWQqYxmI5aBqELaeabi2RiXrKCjMWzOMzyp/A5je0knlSzSu43xLTz
X-Developer-Key: i=quic_jesszhan@quicinc.com; a=ed25519;
 pk=gAUCgHZ6wTJOzQa3U0GfeCDH7iZLlqIEPo4rrjfDpWE=
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: va_YVw9XiJP4DXrleTb4qz1eSQ3_9Y4D
X-Proofpoint-ORIG-GUID: va_YVw9XiJP4DXrleTb4qz1eSQ3_9Y4D
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-06-09_16,2023-06-09_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0
 lowpriorityscore=0 mlxscore=0 spamscore=0 clxscore=1015 suspectscore=0
 bulkscore=0 malwarescore=0 priorityscore=1501 mlxlogscore=999 phishscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2305260000 definitions=main-2306090195
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

Currently, when compression is enabled, hdisplay is reduced via integer
division. This causes issues for modes where the original hdisplay is
not a multiple of 3.

To fix this, use DIV_ROUND_UP to divide hdisplay.

Suggested-by: Marijn Suijten <marijn.suijten@somainline.org>
Fixes: 08802f515c3cf ("drm/msm/dsi: Add support for DSC configuration")
Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>
Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
---
 drivers/gpu/drm/msm/dsi/dsi_host.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
index 1a99d75025dc..a448931af804 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_host.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
@@ -949,7 +949,7 @@ static void dsi_timing_setup(struct msm_dsi_host *msm_host, bool is_bonded_dsi)
 		 * pulse width same
 		 */
 		h_total -= hdisplay;
-		hdisplay = msm_dsc_get_bytes_per_line(msm_host->dsc) / 3;
+		hdisplay = DIV_ROUND_UP(msm_dsc_get_bytes_per_line(msm_host->dsc), 3);
 		h_total += hdisplay;
 		ha_end = ha_start + hdisplay;
 	}

-- 
2.40.1

