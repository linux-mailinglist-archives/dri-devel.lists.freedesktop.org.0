Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DEE9647313
	for <lists+dri-devel@lfdr.de>; Thu,  8 Dec 2022 16:32:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3228A10E4B6;
	Thu,  8 Dec 2022 15:32:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A937610E4B4;
 Thu,  8 Dec 2022 15:31:59 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2B88kqKc021923; Thu, 8 Dec 2022 15:31:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=LM5YJiIIQHzZVko3xQniNEQ2CBOP5OwNzA70mtUHKrs=;
 b=bCoZooQEuKaWlzk6bdy0c2Ptu8z59DqqpDRXn9C6wVHuJ1Q5qI8bKc5q25/+fBezsJh+
 o2JAlVOSxx7YUDIvEHZ6ViplY5QV3/NMVa85ngkXlDsKwkUFJnoj8TpX5CD/fRnm2jTh
 TfuryNAO+xfYhWwFmYb7DiIrav7TksgNMn14wbQjYlICljSIY77z7jhTlmX75EZNTr55
 d3Kl10rTpclaYvdlDvPeQqL0/P7dyWbIV0S2Rg91YRaLzmLTYZLN7ZgWPv/ElbUyrob/
 J/rh35P9hieJ2n2NA20/P4rhJiIoL1Cmlo+TIjU/g0AGf6Kcws0eI5rZq04gpKFWMVLT Hg== 
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3majt4cwxb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 08 Dec 2022 15:31:52 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 2B8FVpwA031956
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 8 Dec 2022 15:31:51 GMT
Received: from [10.216.54.36] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Thu, 8 Dec 2022
 07:31:44 -0800
Message-ID: <f0660569-46f6-e0cd-1a33-4d1381c3c59e@quicinc.com>
Date: Thu, 8 Dec 2022 21:01:41 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: Re: [PATCH v7 0/6] clk/qcom: Support gdsc collapse polling using
 'reset' interface
Content-Language: en-US
To: Ulf Hansson <ulf.hansson@linaro.org>, Bjorn Andersson
 <andersson@kernel.org>
References: <1664960824-20951-1-git-send-email-quic_akhilpo@quicinc.com>
 <20221201225705.46r2m35ketvzipox@builder.lan>
 <CAPDyKFofsqcoFbYt-9BcisbPdreLGqAAMWorqHi0_D1kwCdYhg@mail.gmail.com>
From: Akhil P Oommen <quic_akhilpo@quicinc.com>
In-Reply-To: <CAPDyKFofsqcoFbYt-9BcisbPdreLGqAAMWorqHi0_D1kwCdYhg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: WqcdAXbPxAKoXe_pORMT2o17qAD1WF60
X-Proofpoint-ORIG-GUID: WqcdAXbPxAKoXe_pORMT2o17qAD1WF60
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-08_09,2022-12-08_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0
 mlxlogscore=999 bulkscore=0 clxscore=1015 adultscore=0 mlxscore=0
 priorityscore=1501 impostorscore=0 phishscore=0 spamscore=0 malwarescore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2212080127
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
Cc: David Airlie <airlied@linux.ie>,
 Michael Turquette <mturquette@baylibre.com>, Konrad
 Dybcio <konrad.dybcio@somainline.org>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-clk@vger.kernel.org, Andy Gross <agross@kernel.org>,
 devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Stephen Boyd <swboyd@chromium.org>,
 Rob Herring <robh+dt@kernel.org>, Sean Paul <sean@poorly.run>,
 Stephen Boyd <sboyd@kernel.org>, Douglas Anderson <dianders@chromium.org>,
 krzysztof.kozlowski@linaro.org, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno <freedreno@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 12/7/2022 9:30 PM, Ulf Hansson wrote:
> On Thu, 1 Dec 2022 at 23:57, Bjorn Andersson <andersson@kernel.org> wrote:
>> On Wed, Oct 05, 2022 at 02:36:58PM +0530, Akhil P Oommen wrote:
>> @Ulf, Akhil has a power-domain for a piece of hardware which may be
>> voted active by multiple different subsystems (co-processors/execution
>> contexts) in the system.
>>
>> As such, during the powering down sequence we don't wait for the
>> power-domain to turn off. But in the event of an error, the recovery
>> mechanism relies on waiting for the hardware to settle in a powered off
>> state.
>>
>> The proposal here is to use the reset framework to wait for this state
>> to be reached, before continuing with the recovery mechanism in the
>> client driver.
> I tried to review the series (see my other replies), but I am not sure
> I fully understand the consumer part.
>
> More exactly, when and who is going to pull the reset and at what point?
Explained in the other patch.

-Akhil.
>
>> Given our other discussions on quirky behavior, do you have any
>> input/suggestions on this?
>>
>>> Some clients like adreno gpu driver would like to ensure that its gdsc
>>> is collapsed at hardware during a gpu reset sequence. This is because it
>>> has a votable gdsc which could be ON due to a vote from another subsystem
>>> like tz, hyp etc or due to an internal hardware signal. To allow
>>> this, gpucc driver can expose an interface to the client driver using
>>> reset framework. Using this the client driver can trigger a polling within
>>> the gdsc driver.
>> @Akhil, this description is fairly generic. As we've reached the state
>> where the hardware has settled and we return to the client, what
>> prevents it from being powered up again?
>>
>> Or is it simply a question of it hitting the powered-off state, not
>> necessarily staying there?
> Okay, so it's indeed the GPU driver that is going to assert/de-assert
> the reset at some point. Right?
>
> That seems like a reasonable approach to me, even if it's a bit
> unclear under what conditions that could happen.
>
> [...]
>
> Kind regards
> Uffe

