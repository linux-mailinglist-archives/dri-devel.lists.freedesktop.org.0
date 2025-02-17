Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 10E40A38EEB
	for <lists+dri-devel@lfdr.de>; Mon, 17 Feb 2025 23:20:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C14EB10E5EC;
	Mon, 17 Feb 2025 22:20:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="b0xCenwB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0EB0E10E5E7;
 Mon, 17 Feb 2025 22:20:14 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51HAgoQq025635;
 Mon, 17 Feb 2025 22:20:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 WVbOwd4rDC4+XI6orsMGTj2L4zMQLlpY8kWB5b5Dw/Q=; b=b0xCenwBs9GJuZwk
 8mXoe4a9nGWNjbNRQitvDm1FEmbm2mOGlFKy6/UHT6p3SkDit8fWdd7w580T5YmC
 oBUhCgOMbskTyKD2mXgeQDlXktQqXdQwJ6NZujoMDLAFgrrGoS5Jq/vgfYI5eal9
 HlziTJ2hdjQ2vsvoFEcwARbOjwDZbuGABHrYctp77W33iNpfXgrhyCKU68DvFUUM
 BDErvq2tTHFVzHNKqfpwPNsJtHxGjNlF5nnCWtbCfc3KUPxT4nEqVymqVkra/DWm
 /kEX33lbxnHGxUf7iV3Htyx7lM9Q5yxGw8sOXgdBx6PF9/uzo56Jx03jIVe6CHlk
 rttpjQ==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44ut7vtxhs-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 17 Feb 2025 22:20:12 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 51HMKBPt020550
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 17 Feb 2025 22:20:11 GMT
Received: from abhinavk-linux1.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 17 Feb 2025 14:20:11 -0800
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, "Marijn
 Suijten" <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: Abhinav Kumar <quic_abhinavk@quicinc.com>, Li Liu <quic_lliu6@quicinc.com>,
 Fange Zhang <quic_fangez@quicinc.com>, <linux-arm-msm@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <freedreno@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: (subset) [PATCH v2] drm/msm/dpu: correct LM pairing for SM6150
Date: Mon, 17 Feb 2025 14:20:01 -0800
Message-ID: <173983047014.1708530.3277590461422590844.b4-ty@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241217-dpu-fix-sm6150-v2-1-9acc8f5addf3@linaro.org>
References: <20241217-dpu-fix-sm6150-v2-1-9acc8f5addf3@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: BQGxw8OzYKV2Ynn4CkSywsaSLwTpZKBe
X-Proofpoint-ORIG-GUID: BQGxw8OzYKV2Ynn4CkSywsaSLwTpZKBe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-17_08,2025-02-13_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0
 phishscore=0 spamscore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 bulkscore=0 suspectscore=0 mlxscore=0 mlxlogscore=745
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2501170000
 definitions=main-2502170173
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


On Tue, 17 Dec 2024 14:35:40 +0200, Dmitry Baryshkov wrote:
> The SM6150 platform doesn't have 3DMux (MERGE_3D) block, so it can not
> split the screen between two LMs. Drop lm_pair fields as they don't make
> sense for this platform.
> 
> 

Applied to msm-fixes, thanks!

[1/1] drm/msm/dpu: correct LM pairing for SM6150
      https://gitlab.freedesktop.org/drm/msm/-/commit/24b50b7340ab

Best regards,
-- 
Abhinav Kumar <quic_abhinavk@quicinc.com>
