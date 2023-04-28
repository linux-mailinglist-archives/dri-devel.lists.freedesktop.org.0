Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EDA56F1F0B
	for <lists+dri-devel@lfdr.de>; Fri, 28 Apr 2023 22:00:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E94BB10EDED;
	Fri, 28 Apr 2023 20:00:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 545C510EDE0;
 Fri, 28 Apr 2023 20:00:49 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 33SIwwwU018235; Fri, 28 Apr 2023 20:00:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=enCByRO6b0ykPwBxtn+l8VqQuuFD2VtVHiDgiu6XVHo=;
 b=eWiujVF7bZbcaHy41a19XjWFTl3mRB9mhGmlBFlWkTTKK8Blaoev0rKESG1l+lkF9ncg
 Ps2yuKq2uJpxQa9fqkjhjFaBoaEk3tYlDtJKGQvICYjhJeaYVssiXUqS/jftBefPMRhS
 Q8/7MXrDAwmS+30QVzUEJK4NTcdZubn3qhYlZLYcQ/B96ztkQpSR/eJDoPRa2XhKmkn0
 2RaczffyC8CWZJkM+qTqGqj7EQRuZ/tZXCL2+g6u5v2lrUKtUbAUncRzOh7OMhN67PnB
 sU48O40lyqyhPE1GjYFEkinPUf+YkUo3Ybloni0vOm/mkTcPF1xF60/c82xRujyCyhXl MQ== 
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3q8k0w8813-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 28 Apr 2023 20:00:46 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 33SK0jRm021856
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 28 Apr 2023 20:00:45 GMT
Received: from abhinavk-linux.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.42; Fri, 28 Apr 2023 13:00:44 -0700
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
To: Rob Clark <robdclark@gmail.com>, Dmitry Baryshkov
 <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, David Airlie
 <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, Marijn Suijten
 <marijn.suijten@somainline.org>
Subject: Re: (subset) [PATCH v3 0/3] drm/msm/dpu: Drop useless for-loop HW
 block lookup
Date: Fri, 28 Apr 2023 13:00:30 -0700
Message-ID: <168271198315.17728.9108874132629533053.b4-ty@quicinc.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230418-dpu-drop-useless-for-lookup-v3-0-e8d869eea455@somainline.org>
References: <20230418-dpu-drop-useless-for-lookup-v3-0-e8d869eea455@somainline.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: A-vLA0Ir98ixbOmExFvWTHl_fL94vnIj
X-Proofpoint-ORIG-GUID: A-vLA0Ir98ixbOmExFvWTHl_fL94vnIj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-28_06,2023-04-27_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0
 phishscore=0 lowpriorityscore=0 malwarescore=0 adultscore=0
 mlxlogscore=738 clxscore=1015 impostorscore=0 priorityscore=1501
 mlxscore=0 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2304280163
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
Cc: Jami
 Kettunen <jami.kettunen@somainline.org>, linux-arm-msm@vger.kernel.org,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 Jordan Crouse <jordan@cosmicpenguin.net>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Martin Botka <martin.botka@somainline.org>,
 ~postmarketos/upstreaming@lists.sr.ht,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On Wed, 26 Apr 2023 01:11:08 +0200, Marijn Suijten wrote:
> Doing a for loop in every DPU HW block driver init to find a catalog
> entry matching the given ID is rather useless if the init function
> called by RM already has that catalog entry pointer, and uses exactly
> its ID to drive this init and for loop.  Remove all that machinery to
> drop quite some lines of unnecessarily-complicated code, and the
> fallibility that comes with it, by simply giving _init() the catalog
> entry pointers straight away.
> 
> [...]

Applied, thanks!

[1/3] drm/msm/dpu: Assign missing writeback log_mask
      https://gitlab.freedesktop.org/abhinavk/msm/-/commit/a432fc31f03d

Best regards,
-- 
Abhinav Kumar <quic_abhinavk@quicinc.com>
