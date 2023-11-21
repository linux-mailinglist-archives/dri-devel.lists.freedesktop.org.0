Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AC9C07F365D
	for <lists+dri-devel@lfdr.de>; Tue, 21 Nov 2023 19:45:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DCF2810E2B0;
	Tue, 21 Nov 2023 18:45:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 10DF910E2B8;
 Tue, 21 Nov 2023 18:45:14 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 3ALIEZGJ001102; Tue, 21 Nov 2023 18:45:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=uBi3DtkV1kBFSIDxcBwcArhQghrRbJ9ECwzDoXE0Mmk=;
 b=jI5UO3/U/GTkrv9dACD7AIGluAx7ir0Eq07Lv7cWPqzrqjzA0C4OlSnB59OYVtRMqE09
 Yda+yfexmMORKsIZq4OZc5mvuC0fl+osCm4y3iE/EUJP2ao2t3RqBWLxFetQd71ZI40V
 RG8kXExDDzSRILwSwBBlamKJg6bxSUAtVPsSucPHmIh74Ikk5Xl6yk0HmgehvU/uSEzP
 03xQpZ82tle0hBKyjV4VUdxHT+x3PqX+DOlbf5aPx7aGczFcArIgIK92v8vSOnfhc9I7
 tV3ZuUiAb/ivTYwxCjdUVJJZoEYCfz+rRreiHSm8HsfG6WLq4iRhCDcBt7YdSFjau37u 2g== 
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3ugxn8gk6q-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 21 Nov 2023 18:45:09 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3ALIj8l5014548
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 21 Nov 2023 18:45:08 GMT
Received: from abhinavk-linux.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Tue, 21 Nov 2023 10:45:07 -0800
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, "Marijn
 Suijten" <marijn.suijten@somainline.org>, Dmitry Baryshkov
 <dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH v2 0/2] drm/msm/dp: fix DP subconnector handling
Date: Tue, 21 Nov 2023 10:44:58 -0800
Message-ID: <170059219222.23520.11858172389818758850.b4-ty@quicinc.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231025092711.851168-1-dmitry.baryshkov@linaro.org>
References: <20231025092711.851168-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: oVCE0wIdLQ71FCbsgpLT2f0IRoZ3wlhb
X-Proofpoint-GUID: oVCE0wIdLQ71FCbsgpLT2f0IRoZ3wlhb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-21_10,2023-11-21_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0
 suspectscore=0 priorityscore=1501 impostorscore=0 adultscore=0
 mlxlogscore=461 clxscore=1015 spamscore=0 phishscore=0 mlxscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311060000 definitions=main-2311210146
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
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, Abel Vesa <abel.vesa@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On Wed, 25 Oct 2023 12:23:08 +0300, Dmitry Baryshkov wrote:
> Fix two failovers in the DP subconnector's patch. I didn't notice that I
> had another patch adding the property in my tree and later Abel pointed
> out that we shouldn't use subconnector type for eDP panels.
> 
> Fixes since v1:
>  - Add Abel's patch.
> 
> [...]

Applied, thanks!

[1/2] drm/msm/dp: don't touch DP subconnector property in eDP case
      https://gitlab.freedesktop.org/drm/msm/-/commit/ebfa85c504cb
[2/2] drm/msm/dp: attach the DP subconnector property
      https://gitlab.freedesktop.org/drm/msm/-/commit/21133266ca12

Best regards,
-- 
Abhinav Kumar <quic_abhinavk@quicinc.com>
