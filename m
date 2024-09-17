Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0ABF397B19E
	for <lists+dri-devel@lfdr.de>; Tue, 17 Sep 2024 16:52:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 301B610E224;
	Tue, 17 Sep 2024 14:52:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="mQ07V7eM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 22E5210E224;
 Tue, 17 Sep 2024 14:52:19 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48H4nup4022480;
 Tue, 17 Sep 2024 14:52:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=uoeJcBQMFmqPhQZTMkUWS61i
 HoEJCARe4P2fr3s12lw=; b=mQ07V7eMcv0zD1hXPhsi4ljJVNKJmG7FpgpYyrsx
 fU1gTpYmMADt0trRvi117XSd6TmrqdIBybK7VEwDzvn0mlK07oW07KbZYeG4rnUA
 YxBbgYTcPC+1FgH5N0e/Bx3yAim8oeevkwey3GVTF4yvLfAKFXM9pv+V9Pn602X1
 iQXYjRe1homrJtbGLg+d+f0s0QYNLeeXNQctdg2GRsH1ZfFQsXGW8pwR9xPEgiD4
 eJpsu7zEkUgiGCqiLc4omXzHTbobtE0Kugon9nDOdzgeWr8lcq1YteT3S6We5MzO
 74zYeV7A9TSeHfYcjKADlinmyeYle+Jqvytv9pjqByRqMA==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41n4gnq2jn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 17 Sep 2024 14:52:12 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 48HEqBnL008974
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 17 Sep 2024 14:52:11 GMT
Received: from hu-akhilpo-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 17 Sep 2024 07:52:07 -0700
Date: Tue, 17 Sep 2024 20:22:03 +0530
From: Akhil P Oommen <quic_akhilpo@quicinc.com>
To: Konrad Dybcio <konradybcio@kernel.org>
CC: Rob Clark <robdclark@gmail.com>, <dri-devel@lists.freedesktop.org>,
 <linux-arm-msm@vger.kernel.org>, <freedreno@lists.freedesktop.org>, "Connor
 Abbott" <cwabbott0@gmail.com>,
 Rob Clark <robdclark@chromium.org>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, "Dmitry
 Baryshkov" <dmitry.baryshkov@linaro.org>, Marijn Suijten
 <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, "Daniel
 Vetter" <daniel@ffwll.ch>, open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] drm/msm/a6xx+: Insert a fence wait before SMMU table
 update
Message-ID: <20240917145203.2nznqdkrsfanttex@hu-akhilpo-hyd.qualcomm.com>
References: <20240913195132.8282-1-robdclark@gmail.com>
 <e6991910-5058-4ef0-bfdf-6d33953535dd@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <e6991910-5058-4ef0-bfdf-6d33953535dd@kernel.org>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: bQw_K9KxeX0BK0awkjyWmeW6Kc1ARqs2
X-Proofpoint-ORIG-GUID: bQw_K9KxeX0BK0awkjyWmeW6Kc1ARqs2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 adultscore=0
 mlxlogscore=869 malwarescore=0 suspectscore=0 clxscore=1011 phishscore=0
 lowpriorityscore=0 bulkscore=0 impostorscore=0 priorityscore=1501
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2408220000 definitions=main-2409170106
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

On Tue, Sep 17, 2024 at 03:47:09PM +0200, Konrad Dybcio wrote:
> On 13.09.2024 9:51 PM, Rob Clark wrote:
> > From: Rob Clark <robdclark@chromium.org>
> > 
> > The CP_SMMU_TABLE_UPDATE _should_ be waiting for idle, but on some
> > devices (x1-85, possibly others), it seems to pass that barrier while
> > there are still things in the event completion FIFO waiting to be
> > written back to memory.
> 
> Can we try to force-fault around here on other GPUs and perhaps
> limit this workaround?
> 
> Akhil, do we have any insight on this?

Nothing at the moment. I will check this further.

-Akhil.

> 
> Konrad
