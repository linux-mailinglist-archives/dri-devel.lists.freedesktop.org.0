Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 267C3628A7E
	for <lists+dri-devel@lfdr.de>; Mon, 14 Nov 2022 21:33:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 24E0C10E0EB;
	Mon, 14 Nov 2022 20:33:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 452D510E318;
 Mon, 14 Nov 2022 20:33:37 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2AEKT0DT017845; Mon, 14 Nov 2022 20:33:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=pXFNkV/SxmNW6LxlT1roul8AOmGIMlXURfjeeBJ2KHQ=;
 b=RaiDNH1eLm2YzbK1YYPYo/+KSOtt72cAJW8zOcD8u/AD0BI28FTjGmkzqq/lYTW2+lTc
 XeXkCmz4F2L9KxG8+AjNhIj6UXMkgnGj47SLtju0edVf9BJTrm+sRZ7bAGdaUSjpvvLA
 30nhTwW0U0yJ5C+CWLX4+7fIVla8IaFhzvon3ZRNUlEFCSSvayoYT+3wmE3bGS5hduZN
 wvV2Evk0gd1yLMBL0DUrUyZzz6ZS549HyOkXVtZPYjmgkTlEh8yD+thqXsyK/wHHkKV6
 0kKtIHxa9LvTT+icAhDpPkGLjaNgTnINemjBKQeyy7iOCtbDyb/HShbX56SwLxLIkNx0 1w== 
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3kut23gj2h-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 14 Nov 2022 20:33:32 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 2AEKXRUX000885
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 14 Nov 2022 20:33:27 GMT
Received: from [10.216.50.94] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.29; Mon, 14 Nov
 2022 12:33:22 -0800
Message-ID: <61b0954d-d294-4c60-3188-aa29b6545465@quicinc.com>
Date: Tue, 15 Nov 2022 02:03:19 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: Re: [PATCH] drm/msm/a6xx: Fix speed-bin detection vs probe-defer
Content-Language: en-US
To: Doug Anderson <dianders@chromium.org>, Rob Clark <robdclark@gmail.com>
References: <20221114194133.1535178-1-robdclark@gmail.com>
 <CAD=FV=WB__v5TPFOqnQMajR6MvLGjLYrKrV+qosJYQFTCpROzQ@mail.gmail.com>
From: Akhil P Oommen <quic_akhilpo@quicinc.com>
In-Reply-To: <CAD=FV=WB__v5TPFOqnQMajR6MvLGjLYrKrV+qosJYQFTCpROzQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: Hm197p9GzJIb3apL3JHrtitJaUhHQ26c
X-Proofpoint-ORIG-GUID: Hm197p9GzJIb3apL3JHrtitJaUhHQ26c
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-14_13,2022-11-11_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0
 impostorscore=0 suspectscore=0 bulkscore=0 malwarescore=0
 priorityscore=1501 mlxscore=0 spamscore=0 mlxlogscore=797 phishscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2211140144
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
Cc: Rob Clark <robdclark@chromium.org>, linux-arm-msm@vger.kernel.org,
 Konrad Dybcio <konrad.dybcio@somainline.org>, Abhinav
 Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 open list <linux-kernel@vger.kernel.org>, Sean Paul <sean@poorly.run>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 11/15/2022 1:57 AM, Doug Anderson wrote:
> Hi,
>
> On Mon, Nov 14, 2022 at 11:41 AM Rob Clark <robdclark@gmail.com> wrote:
>> From: Rob Clark <robdclark@chromium.org>
>>
>> If we get an error (other than -ENOENT) we need to propagate that up the
>> stack.  Otherwise if the nvmem driver hasn't probed yet, we'll end up with
>> whatever OPP(s) are represented by bit zero.
> Can you explain the "whatever OPP(s) are represented by bit zero"
> part? This doesn't seem to be true because `supp_hw` is initiated to
> UINT_MAX. If I'm remembering how this all works, doesn't that mean
> that if we get an error we'll assume all OPPs are OK?
>
> I'm not saying that I'm against your change, but I think maybe you're
> misdescribing the old behavior.
>
> Speaking of the initialization of supp_hw, if we want to change the
> behavior like your patch does then we should be able to remove that
> initialization, right?
>
> I would also suspect that your patch will result in a compiler
> warning, at least on some compilers. The goto label `done` is no
> longer needed, right?
>
> -Doug
You are right about the commit message. The problem is we can't enable 
all bits in supp_hw anymore due to changes like this:
https://patchwork.kernel.org/project/linux-arm-msm/patch/20220829011035.1.Ie3564662150e038571b7e2779cac7229191cf3bf@changeid/

This creates 2 opps with same freq when supp_hw = UINT_MAX.

-Akhil.
