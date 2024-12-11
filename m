Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A24E9EC2DA
	for <lists+dri-devel@lfdr.de>; Wed, 11 Dec 2024 04:08:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 73CBA10EA41;
	Wed, 11 Dec 2024 03:08:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="QI+OvhAN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5270810EA3A;
 Wed, 11 Dec 2024 03:08:30 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BADaaof019597;
 Wed, 11 Dec 2024 03:08:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 /tDBwUOTx9mIzdLxexBmtjcjcefKgdF/rlLWlMfugCE=; b=QI+OvhANY3JLOga6
 m5cYZnTTRYZKfztVtvn/Ge2IKu/mbKxpGL81QVIaH0WyiyI25z7SBBNILlcnxvrF
 f6wA05hOuPC0hqEEjbLF+H8+4UDysLcIjm7IY2RINkFKW0CSEqTGMMYv5k5ZABui
 f3z0U3UldPpnsllfVKqcq8CsXyR8dvNWL4H+XxY/I1VaCq91LjwTEl1SGuAqY/oo
 Vu42GVvLp3oKwW6x5Ns0nomVBupGYp7cm0dugjFyxnJrZYfGX66PqG3tVASDuY4w
 0Q55MftoGXCsDAwOAkrZdPyqXWUoiROj3cgMSp9J7cYleDgPIMcii6z3Jz+YVy06
 FaP3Bg==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43e341da11-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 11 Dec 2024 03:08:24 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BB38NcM021221
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 11 Dec 2024 03:08:23 GMT
Received: from [10.216.62.17] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 10 Dec
 2024 19:08:18 -0800
Message-ID: <1219b46d-2aea-4377-a8ca-024039ee1499@quicinc.com>
Date: Wed, 11 Dec 2024 08:38:15 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/msm/a6xx: Skip gpu secure fw load in EL2 mode
To: Bjorn Andersson <andersson@kernel.org>
CC: Rob Clark <robdclark@gmail.com>, Pavan Kondeti <quic_pkondeti@quicinc.com>,
 Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, "Dmitry
 Baryshkov" <dmitry.baryshkov@linaro.org>, Marijn Suijten
 <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, "Simona
 Vetter" <simona@ffwll.ch>, Elliot Berman <quic_eberman@quicinc.com>,
 <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <freedreno@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>
References: <20241209-drm-msm-kvm-support-v1-1-1c983a8a8087@quicinc.com>
 <CAF6AEGtKfWOGpd1gMfJ96BjCqwERZzBVmj5GzmjKxw8_vmSrJg@mail.gmail.com>
 <f4813046-5952-4d16-bae6-37303f22ad1a@quicinc.com>
 <iyknardi445n4h74am22arpgc4vlchh6z6cvkbff2xg76pd655@nozwz7snt476>
Content-Language: en-US
From: Akhil P Oommen <quic_akhilpo@quicinc.com>
In-Reply-To: <iyknardi445n4h74am22arpgc4vlchh6z6cvkbff2xg76pd655@nozwz7snt476>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: 0m9eFUcuyq9Ye7zYc1eZ8aC2lb1PuFwm
X-Proofpoint-ORIG-GUID: 0m9eFUcuyq9Ye7zYc1eZ8aC2lb1PuFwm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0
 priorityscore=1501 suspectscore=0 mlxlogscore=999 clxscore=1015 mlxscore=0
 spamscore=0 phishscore=0 malwarescore=0 adultscore=0 impostorscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412110022
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

On 12/11/2024 6:43 AM, Bjorn Andersson wrote:
> On Tue, Dec 10, 2024 at 02:22:27AM +0530, Akhil P Oommen wrote:
>> On 12/10/2024 1:24 AM, Rob Clark wrote:
>>> On Mon, Dec 9, 2024 at 12:20 AM Akhil P Oommen <quic_akhilpo@quicinc.com> wrote:
>>>>
>>>> When kernel is booted in EL2, SECVID registers are accessible to the
>>>> KMD. So we can use that to switch GPU's secure mode to avoid dependency
>>>> on Zap firmware. Also, we can't load a secure firmware without a
>>>> hypervisor that supports it.
>>>
>>> Shouldn't we do this based on whether zap node is in dtb (and not disabled)?
>>
>> This is better, isn't it? Otherwise, multiple overlays should be
>> maintained for each soc/board since EL2 can be toggled from bootloader.
>> And this feature is likely going to be more widely available.
>>
> 
> The DeviceTree passed to the OS needs to describe the world that said OS
> is going to operate in. If you change the world you need to change the
> description.
> There are several other examples where this would be necessary
> (remoteproc and watchdog to name two examples from the Qualcomm upstream
> world).

But basic things work without those changes, right? For eg: Desktop UI

> 
> So, if we can cover this by zap-shader being enabled or disabled, that
> sounds like a clean and scaleable solution.

I think we are focusing too much on zap shader. If the driver can
determine itself about access to its register, shouldn't it be allowed
to use that?

-Akhil

> 
> Regards,
> Bjorn

