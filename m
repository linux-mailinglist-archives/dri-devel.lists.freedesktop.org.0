Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 12A178C07A8
	for <lists+dri-devel@lfdr.de>; Thu,  9 May 2024 01:33:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F17CE10E33D;
	Wed,  8 May 2024 23:32:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="UdVmYjMt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F9A610E211;
 Wed,  8 May 2024 23:32:56 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 448C4Y75027303;
 Wed, 8 May 2024 23:32:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 message-id:date:mime-version:subject:to:cc:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=
 qcppdkim1; bh=1iu0bePOw83173L41461NVMwojOBNpiVdvT7Bl2/o+o=; b=Ud
 VmYjMtdvKcish+QgW9GTSAL4/oRSgvsTNSOi1FMnbLRQZYO9g+I7aqwkcsmvwBok
 wP8QqoTdXqDqYXDNqUEud88wkGgwZnbC3wPIRlGjEFaXOg5GO/CRCJrdqcYmhRKV
 XvcfYu2ddXjuo2/8ekSnk4M9pfYtROjbV0IjPEWAkocIrVof/refApVuQs1LdwiZ
 hQuTZRysiXuGdjjNJCsg9cdxDRQM7Tnq+15vAxNkgy5BBcxILF/B20AgkOvMLfHE
 BlVUl56Q5Xi/Kj114Juzz8zJNHCq/ZK0OhS5r6HkJ2p+Bbm9r+U7Jy4MecSjZn7I
 bZtCC2koss502AfVwDkQ==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3y0930scy5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 08 May 2024 23:32:40 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 448NWd75032048
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 8 May 2024 23:32:39 GMT
Received: from [10.71.109.81] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 8 May 2024
 16:32:39 -0700
Message-ID: <a0868c79-f93e-36f1-e1c1-7a069222ebc7@quicinc.com>
Date: Wed, 8 May 2024 16:32:38 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v2 1/2] drm/msm/gen_header: allow skipping the validation
Content-Language: en-US
To: Doug Anderson <dianders@chromium.org>, Dmitry Baryshkov
 <dmitry.baryshkov@linaro.org>
CC: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, Marijn
 Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Helen Koike <helen.koike@collabora.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <freedreno@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>, Stephen
 Rothwell <sfr@canb.auug.org.au>
References: <20240503-fd-fix-lxml-v2-0-f80a60ce21a1@linaro.org>
 <20240503-fd-fix-lxml-v2-1-f80a60ce21a1@linaro.org>
 <CAD=FV=XnpS-=CookKxzFM8og9WCSEMxfESmfTYH811438qg4ng@mail.gmail.com>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <CAD=FV=XnpS-=CookKxzFM8og9WCSEMxfESmfTYH811438qg4ng@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: MtBzCmbgcpFFUcFdwHfSfdimmt5lYR-Q
X-Proofpoint-ORIG-GUID: MtBzCmbgcpFFUcFdwHfSfdimmt5lYR-Q
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-05-08_09,2024-05-08_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 priorityscore=1501
 impostorscore=0 suspectscore=0 malwarescore=0 bulkscore=0 spamscore=0
 lowpriorityscore=0 adultscore=0 phishscore=0 mlxlogscore=981 clxscore=1015
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2405010000
 definitions=main-2405080176
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



On 5/8/2024 3:41 PM, Doug Anderson wrote:
> Hi,
> 
> On Fri, May 3, 2024 at 11:15 AM Dmitry Baryshkov
> <dmitry.baryshkov@linaro.org> wrote:
>>
>> @@ -941,6 +948,7 @@ def main():
>>          parser = argparse.ArgumentParser()
>>          parser.add_argument('--rnn', type=str, required=True)
>>          parser.add_argument('--xml', type=str, required=True)
>> +       parser.add_argument('--validate', action=argparse.BooleanOptionalAction)
> 
> FWIW, the above (argparse.BooleanOptionalAction) appears to be a
> python 3.9 thing. My own build environment happens to have python3
> default to python 3.8 and thus I get a build error related to this. I
> have no idea what the kernel usually assumes for a baseline, but
> others might get build errors too. I don't even see python listed in:
> 
> https://docs.kernel.org/process/changes.html
> 
> ...in any case, if it's easy to change this to not require python3.9
> that would at least help for my build environment. :-P
> 

Yes, I had posted this y'day as I also ran into this

https://patchwork.freedesktop.org/patch/593057/


> -Doug
