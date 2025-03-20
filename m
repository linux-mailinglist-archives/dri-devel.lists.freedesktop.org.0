Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CA2A4A6AF96
	for <lists+dri-devel@lfdr.de>; Thu, 20 Mar 2025 22:06:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F0EB10E6D0;
	Thu, 20 Mar 2025 21:06:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="XMT0udc+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E5EE310E6D0;
 Thu, 20 Mar 2025 21:06:47 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52KEIJpE005901;
 Thu, 20 Mar 2025 21:06:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 tATHTglTJM9UOHXhCrFGkpEE6lgCWEeNaBCm00pblL0=; b=XMT0udc+TIuEWqJx
 yewPmloMniiWPcvzNVhkFVDg+EwZHjSoBI13rEbe5Pe8DxwBCMBXmHdEHJYISWrx
 G+le01FJ6BWWm3IQcz+nKOvCWenvn4eD81pzHTdZzMR3rtgAcMZcjp9Mkyy6Fnvt
 4SpyCVSHDs15ALaK8eK2CQ7CEZsNMNtwSQoET0BHyPz74HQ2ZHn5FmTe6tcTP7eB
 3JsXu3XVSbBSzV0sXJSh9Oo8NeN684hfsD3SqnOg1T0UsmEA3swp1YOqYSfmM7nq
 s7ioLAoU+NWrFe0+1VH20mr/kyGofHZQaIZ4O9SrEtP6ORkDEJwCgHlb2mW99r6C
 OoD7PQ==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45etmc313e-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 20 Mar 2025 21:06:36 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com
 [10.46.141.250])
 by NASANPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 52KL6Zl6003583
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 20 Mar 2025 21:06:35 GMT
Received: from [10.216.3.194] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 20 Mar
 2025 14:06:25 -0700
Message-ID: <3abefb09-c1b6-4339-8cd9-cd86652c35d6@quicinc.com>
Date: Fri, 21 Mar 2025 02:36:21 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 08/10] drm/bridge: anx7625: enable HPD interrupts
To: Dmitry Baryshkov <lumag@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <freedreno@lists.freedesktop.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <robdclark@gmail.com>,
 <dmitry.baryshkov@linaro.org>, <sean@poorly.run>,
 <marijn.suijten@somainline.org>, <andersson@kernel.org>,
 <robh@kernel.org>, <robh+dt@kernel.org>, <krzk+dt@kernel.org>,
 <konradybcio@kernel.org>, <conor+dt@kernel.org>,
 <andrzej.hajda@intel.com>, <neil.armstrong@linaro.org>,
 <rfoss@kernel.org>, <Laurent.pinchart@ideasonboard.com>,
 <jonas@kwiboo.se>, <jernej.skrabec@gmail.com>,
 <quic_abhinavk@quicinc.com>, <quic_rajeevny@quicinc.com>,
 <quic_vproddut@quicinc.com>, <quic_jesszhan@quicinc.com>
References: <20250311122445.3597100-1-quic_amakhija@quicinc.com>
 <20250311122445.3597100-9-quic_amakhija@quicinc.com>
 <5hvpacx3qeqhjqemhqizws4esdhwg7reli77qey2nin2fggljp@ykgyayj2v3e6>
Content-Language: en-US
From: Ayushi Makhija <quic_amakhija@quicinc.com>
In-Reply-To: <5hvpacx3qeqhjqemhqizws4esdhwg7reli77qey2nin2fggljp@ykgyayj2v3e6>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: tRozAjq0hfhDi8U9-fjhIm8fjK2Givoe
X-Proofpoint-GUID: tRozAjq0hfhDi8U9-fjhIm8fjK2Givoe
X-Authority-Analysis: v=2.4 cv=aMLwqa9m c=1 sm=1 tr=0 ts=67dc835c cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10
 a=VNkCFBYSnlPScTfBtzoA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-20_07,2025-03-20_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0
 priorityscore=1501 spamscore=0 clxscore=1015 phishscore=0 mlxscore=0
 suspectscore=0 malwarescore=0 mlxlogscore=997 bulkscore=0 adultscore=0
 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503200136
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

On 3/11/2025 9:09 PM, Dmitry Baryshkov wrote:
> On Tue, Mar 11, 2025 at 05:54:43PM +0530, Ayushi Makhija wrote:
>> When device enters the suspend state, it prevents
>> HPD interrupts from occurring. To address this,
>> add an additional PM runtime vote in hpd_enable().
>> This vote is removed in hpd_disable().
> 
> Is it really enough to toggle the HPD interrupts? Is there any kind of
> programming that should be moved to .hpd_enable() too (so that by
> default the bridge doesn't generate HPD interrupts)?
> 

Hi Dmirty,

I couldn't find the ANX7625 bridge driver datasheet, where all the registers information are present.

As per my understanding, we have anx7625_hpd_timer_config(), where debounce timer registers are getting set, which help to manage the detection and stability of the HPD signal.

anx7625_hpd_timer_config() is getting called from anx7625_runtime_pm_resume().

anx7625_runtime_pm_resume
   anx7625_power_on_init
       anx7625_ocm_loading_check
           anx7625_disable_pd_protocol
              anx7625_hpd_timer_config

So, I think HPD programming is already taken care in anx7625_hpd_timer_config(). anx7625_runtime_pm_resume() is getting called for both eDP and DP configuration. 

If you suggest then, I can move the anx7625_hpd_timer_config() from anx7625_disable_pd_protocol() to anx7625_bridge_hpd_enable().

Thanks,
Ayushi

