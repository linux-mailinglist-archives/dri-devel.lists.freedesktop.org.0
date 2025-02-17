Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E203FA38F0F
	for <lists+dri-devel@lfdr.de>; Mon, 17 Feb 2025 23:28:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 27FFE892FD;
	Mon, 17 Feb 2025 22:28:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="UfxWNC+/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB03C10E158;
 Mon, 17 Feb 2025 22:28:51 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51HAfIev026272;
 Mon, 17 Feb 2025 22:28:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 85rHUocnU9lklzB9BR0gJkyl7D6exIAQ63c0M02GufQ=; b=UfxWNC+/E3dM/UZ6
 Jv8Gv5WIEhs6rTWFo+sC61wnYOubkZlFsLck4JvG2z57atGeO8cHDCVySkmVmGef
 lKw520Qf2Dp7dHkDG6hCk3MpzbZ1v/49uDeSAxV/PIWbwlBfalSmlwrgcLygPDxV
 j9t+Bfojj38GMeFeqlb4P9CDR6uusgjyr+uKeYz481g2/6De49LU604OgGlgZX/n
 ORoQ8GwA3Xe2MPck6S74YpmONsXgHF7oyP7AdNRN95u5OUSv0YDuBEBs6Gc/lKDa
 MGUvik1YH/KuxvUVhc6zZdmS66EcTkq62P0Mj01Ent8ipEeH34KWyI3qxpNIg32G
 51S52Q==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44ut7ttyaa-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 17 Feb 2025 22:28:30 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 51HMSTWO009718
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 17 Feb 2025 22:28:29 GMT
Received: from abhinavk-linux1.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 17 Feb 2025 14:28:28 -0800
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, David Airlie
 <airlied@gmail.com>, Ethan Carter Edwards <ethan@ethancedwards.com>
CC: Abhinav Kumar <quic_abhinavk@quicinc.com>, Dmitry Baryshkov
 <dmitry.baryshkov@linaro.org>, Marijn Suijten
 <marijn.suijten@somainline.org>,
 Simona Vetter <simona@ffwll.ch>, <linux-arm-msm@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <freedreno@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <linux-hardening@vger.kernel.org>
Subject: Re: (subset) [PATCH v2] drm/msm/dpu: Fix uninitialized variable
Date: Mon, 17 Feb 2025 14:28:19 -0800
Message-ID: <173983118340.1710817.130011978241538683.b4-ty@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250209-dpu-v2-1-114dfd4ebefd@ethancedwards.com>
References: <20250209-dpu-v2-1-114dfd4ebefd@ethancedwards.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: oF4oUbUp5fgCIti7eZfx5lni0vTmDY6B
X-Proofpoint-GUID: oF4oUbUp5fgCIti7eZfx5lni0vTmDY6B
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-17_08,2025-02-13_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 mlxscore=0
 malwarescore=0 impostorscore=0 clxscore=1015 phishscore=0 adultscore=0
 spamscore=0 mlxlogscore=666 bulkscore=0 suspectscore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2501170000
 definitions=main-2502170174
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


On Sun, 09 Feb 2025 22:51:54 -0500, Ethan Carter Edwards wrote:
> There is a possibility for an uninitialized *ret* variable to be
> returned in some code paths.
> 
> Fix this by initializing *ret* to 0.
> 
> 


Applied to msm-fixes, thanks!

[1/1] drm/msm/dpu: Fix uninitialized variable
      https://gitlab.freedesktop.org/drm/msm/-/commit/978ca99d6bd8

Best regards,
-- 
Abhinav Kumar <quic_abhinavk@quicinc.com>
