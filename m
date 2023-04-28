Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B00A6F1F29
	for <lists+dri-devel@lfdr.de>; Fri, 28 Apr 2023 22:11:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7644110E046;
	Fri, 28 Apr 2023 20:11:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4AA7210E046;
 Fri, 28 Apr 2023 20:11:43 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 33SJ2JiM025732; Fri, 28 Apr 2023 20:11:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=NmzPKiHPTpzSQrD+/KvTK1uftzm4HNIXAFsGzBC5mvo=;
 b=Nqdlm32mbfO6G47NWYYDH+wdiXmxCgJcjItWFJvTouvtQlBisnFrrwJGViVvyqElC/OP
 QVD6fm5BrAMA6CcTrkjrGZN7VpAACQENmGbMeGIxkxNPDrhKXA8ZP4ymtRKBs6Bk26Pg
 8MHstHoAHnQQhFYEAOdEoLs3UMZCfwh5fdYLLlF03W2kTt0FfKLxCGwhgsz8q2UXcj21
 FE419OAQGLLUAkUwxalk3rft8ILHMIb9djK+2phSfD0/fx1uxzIAbqqklM9Zuul4d9+c
 2Sp2q7FKpvCsaK3/JIKWL7135ok9oU3PEwPlXACQD/KeM2BJ7ykYbgFV0GpChq/j5Xsy 8w== 
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3q882gadn3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 28 Apr 2023 20:11:38 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 33SKBbHr001633
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 28 Apr 2023 20:11:37 GMT
Received: from abhinavk-linux.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.42; Fri, 28 Apr 2023 13:11:37 -0700
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
To: Rob Clark <robdclark@gmail.com>, Dmitry Baryshkov
 <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, David Airlie
 <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, Arnaud Vrac
 <avrac@freebox.fr>
Subject: Re: (subset) [PATCH 00/11] drm/msm/dpu: tweaks for better hardware
 resources allocation
Date: Fri, 28 Apr 2023 13:11:25 -0700
Message-ID: <168271262213.26574.9520116603206331818.b4-ty@quicinc.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230419-dpu-tweaks-v1-0-d1bac46db075@freebox.fr>
References: <20230419-dpu-tweaks-v1-0-d1bac46db075@freebox.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: o_jg3-kNES679s4icfuwS0EXML0Ru5J9
X-Proofpoint-ORIG-GUID: o_jg3-kNES679s4icfuwS0EXML0Ru5J9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-28_06,2023-04-27_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 spamscore=0 lowpriorityscore=0 mlxlogscore=738 phishscore=0
 mlxscore=0 clxscore=1015 bulkscore=0 impostorscore=0 adultscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2304280165
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
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On Wed, 19 Apr 2023 16:41:07 +0200, Arnaud Vrac wrote:
> This series include misc fixes related to hardware resource allocations
> in the msm dpu driver, some specifically for msm8998 (including hw
> catalog fixes and cursor sspp support for cursor planes, instead of
> using Smart DMA pipes).
> 
> This series has been tested on msm8998 with additional patches to enable
> hdmi support.
> 
> [...]

Applied, thanks!

[01/11] drm/msm/dpu: tweak msm8998 hw catalog values
        https://gitlab.freedesktop.org/abhinavk/msm/-/commit/3f23a52fc2b8
[10/11] drm/msm/dpu: tweak lm pairings in msm8998 hw catalog
        https://gitlab.freedesktop.org/abhinavk/msm/-/commit/686eb89b1036

Best regards,
-- 
Abhinav Kumar <quic_abhinavk@quicinc.com>
