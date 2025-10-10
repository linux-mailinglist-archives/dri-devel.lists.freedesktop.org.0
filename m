Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C29EBCE183
	for <lists+dri-devel@lfdr.de>; Fri, 10 Oct 2025 19:31:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EFC2C10EC5F;
	Fri, 10 Oct 2025 17:31:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.b="ReTpBktO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com
 [205.220.177.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 336F210EC5F
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Oct 2025 17:31:52 +0000 (UTC)
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59AFtuHH024282;
 Fri, 10 Oct 2025 17:31:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
 :content-transfer-encoding:date:from:message-id:mime-version
 :subject:to; s=corp-2025-04-25; bh=pvqj9d+nmeXKOy0CEZnhLNS80ooNK
 N6MuIq0IKC5Ikg=; b=ReTpBktOBu4s826Dr0WZ3h/pSlsod2VqzOluFcc5osMLj
 vZkNEjNg3gZ8BAL7aGlDrkDpJTpGPnVwT0ubx0Qrdz9UvdFH5yTlcdivakqUyW10
 zcGIvRamJpcCp4iDRdyBowEjvOiqSUgpKFZCrKp2hwPr6lWnilnsgSFBNXkzdXGh
 tTzKviBwoLLBYpJp/CkJNARwqYrmB8k2ng78rgiqoZb44eUgpFDK88rW81HOAvmd
 Gth96SrdifQIvlfywDj3ermkBLmbrQriGGZY5m6htrc3DsccNSL2GeNQXLoXbriF
 GyOc2XCB8VrcTMiaZLRfAhQACi4in/sPo/6p+FrRA==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 49nv6dv51x-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 10 Oct 2025 17:31:47 +0000 (GMT)
Received: from pps.filterd
 (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2)
 with ESMTP id 59AGj6SC037020; Fri, 10 Oct 2025 17:31:46 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id
 49nv65hg6j-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 10 Oct 2025 17:31:46 +0000
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 59AHRHoQ026524;
 Fri, 10 Oct 2025 17:31:46 GMT
Received: from ca-dev112.us.oracle.com (ca-dev112.us.oracle.com
 [10.129.136.47])
 by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTP id
 49nv65hg5t-1; Fri, 10 Oct 2025 17:31:45 +0000
From: Alok Tiwari <alok.a.tiwari@oracle.com>
To: dri-devel@lists.freedesktop.org, simona@ffwll.ch, airlied@gmail.com,
 tzimmermann@suse.de, mripard@kernel.org, hjc@rock-chips.com,
 heiko@sntech.de, andy.yan@rock-chips.com, maarten.lankhorst@linux.intel.com
Cc: alok.a.tiwari@oracle.com, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org
Subject: [PATCH] drm/rockchip: dw_hdmi: use correct SCLIN mask for RK3228
Date: Fri, 10 Oct 2025 10:31:41 -0700
Message-ID: <20251010173143.72733-1-alok.a.tiwari@oracle.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-10_04,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
 bulkscore=0 mlxlogscore=999
 phishscore=0 spamscore=0 adultscore=0 suspectscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2510020000
 definitions=main-2510100100
X-Proofpoint-ORIG-GUID: 1kCLmOmOeBvPerFi8ZXjR7rqpdlvd2mZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA4MDEyMSBTYWx0ZWRfX9ZT5rePrLrmb
 h8ZSgos+obPgt5kO5JNF2Wnh80tZXf+eYOEdbgI05FkHWwn9jBNTjnEgl0ENucH7d1fdT0gMcRf
 Fci+nkyQbiftHvvV34Dm9/8AYBMxVBcO56xMqvt4ij0T4FoQ6WZsNWmyjMnOHNqX5wS2RhHdqJ1
 7ssOtY/CJoxH0WheIfoCtPguCmOK+25IqjE4XLBh3tCpMcesdIzBXDAwy43XL5qKNCo57Ke4/U9
 tBHHr4/2H8GlooaS1cAUh/yJ4difs7BSG/LKkxjUqJI8M0vQaQVgtCj3Z4cQV/sb0jaNbpc582b
 c4ESVXLZvDzDks192Pw706231jxklDds3DmNxW8qX5sNst/MGYbED4yMkExVnjpbF3+XxcEfgFt
 MMPkaUvfmSL1dkqIehvZjyPqXxQLMH66arieYULxyK1ZJ039ML0=
X-Authority-Analysis: v=2.4 cv=etHSD4pX c=1 sm=1 tr=0 ts=68e94303 b=1 cx=c_pps
 a=e1sVV491RgrpLwSTMOnk8w==:117
 a=e1sVV491RgrpLwSTMOnk8w==:17
 a=x6icFKpwvdMA:10 a=yPCof4ZbAAAA:8 a=_APh9P-1HUCL8KmDz24A:9 cc=ntf
 awl=host:13624
X-Proofpoint-GUID: 1kCLmOmOeBvPerFi8ZXjR7rqpdlvd2mZ
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

In dw_hdmi_rk3228_setup_hpd(), the SCLIN mask incorrectly references
the RK3328 variant. This change updates it to the RK3228-specific mask
RK3228_HDMI_SCLIN_MSK using FIELD_PREP_WM16, ensuring proper HPD and
I2C pin configuration for RK3228.

Change: RK3328_HDMI_SCLIN_MSK -> RK3228_HDMI_SCLIN_MSK

Fixes: 63df37f3fc71 ("drm/rockchip: dw_hdmi: switch to FIELD_PREP_WM16* macros")
Signed-off-by: Alok Tiwari <alok.a.tiwari@oracle.com>
---
 drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c b/drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c
index 7b613997bb50..727cdf768161 100644
--- a/drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c
+++ b/drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c
@@ -361,7 +361,7 @@ static void dw_hdmi_rk3228_setup_hpd(struct dw_hdmi *dw_hdmi, void *data)
 
 	regmap_write(hdmi->regmap, RK3228_GRF_SOC_CON2,
 		     FIELD_PREP_WM16(RK3228_HDMI_SDAIN_MSK, 1) |
-		     FIELD_PREP_WM16(RK3328_HDMI_SCLIN_MSK, 1));
+		     FIELD_PREP_WM16(RK3228_HDMI_SCLIN_MSK, 1));
 }
 
 static enum drm_connector_status
-- 
2.50.1

