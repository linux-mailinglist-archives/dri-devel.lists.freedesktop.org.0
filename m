Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A6B2458FB8D
	for <lists+dri-devel@lfdr.de>; Thu, 11 Aug 2022 13:44:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C879AD123;
	Thu, 11 Aug 2022 11:44:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 720 seconds by postgrey-1.36 at gabe;
 Thu, 11 Aug 2022 11:44:16 UTC
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C34DCAD0D3;
 Thu, 11 Aug 2022 11:44:15 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 27B6fSQJ018190;
 Thu, 11 Aug 2022 11:30:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=7KaiEaKQcKJR7xjpPNQ8FEdyIVIj3AxeDSRSxYpiISg=;
 b=Zoi//DwlVP2oGIHdR42tfOnYMU+wPMze4rwMbIDsnijoqWHaZD6a/WUok9yME9tj/BSZ
 4JeBDCFdnn4iECos+tfspdqez3Vntb+NtyiYsCRVgZnd9ixybOb+UBqBfEa0FpkduCBC
 21K1H3PkdPhSXf34HWvG+Cmtk2EU5zkgTwlD+AUOYEi4gcHxetaoQ1obnmgJ1ue7HUho
 a9YWMCpVYAWZ6yvqSKbaKFWQ2R2WbyugIqYnlRQ4UFPUfcMwhh7hCeuOID9n7iYr5Mjo
 rKn0Cnr52OuEifu9/hQadC7vqGOye29ltZp5VBVFbbpC0sSNlw4BOkWVSx0pTjjFOq5g jg== 
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3huwr8wuwk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 11 Aug 2022 11:30:54 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 27BBFhpQ024546
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 11 Aug 2022 11:15:43 GMT
Received: from [10.216.12.63] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Thu, 11 Aug
 2022 04:15:35 -0700
Message-ID: <647583a6-6e1f-b3d9-cc1d-2ca4564cceed@quicinc.com>
Date: Thu, 11 Aug 2022 16:45:31 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: Re: [PATCH 0/5] clk/qcom: Support gdsc collapse polling using 'reset'
 inteface
Content-Language: en-US
To: Bjorn Andersson <bjorn.andersson@linaro.org>
References: <1659172664-10345-1-git-send-email-quic_akhilpo@quicinc.com>
 <YvLMJ2yQRhBFp2y9@baldur>
From: Akhil P Oommen <quic_akhilpo@quicinc.com>
In-Reply-To: <YvLMJ2yQRhBFp2y9@baldur>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: fJhxWupsDssORr3TgLNUO8nf0c7zzTVK
X-Proofpoint-ORIG-GUID: fJhxWupsDssORr3TgLNUO8nf0c7zzTVK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-11_05,2022-08-11_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0
 impostorscore=0 adultscore=0 suspectscore=0 spamscore=0 clxscore=1011
 priorityscore=1501 mlxscore=0 phishscore=0 mlxlogscore=916 bulkscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2207270000 definitions=main-2208110034
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
Cc: devicetree@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>,
 linux-arm-msm@vger.kernel.org, Michael Turquette <mturquette@baylibre.com>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Douglas Anderson <dianders@chromium.org>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, Rob Herring <robh+dt@kernel.org>,
 Andy Gross <agross@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 freedreno <freedreno@lists.freedesktop.org>, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 8/10/2022 2:35 AM, Bjorn Andersson wrote:
> On Sat 30 Jul 04:17 CDT 2022, Akhil P Oommen wrote:
>
>> Some clients like adreno gpu driver would like to ensure that its gdsc
>> is collapsed at hardware during a gpu reset sequence. This is because it
>> has a votable gdsc which could be ON due to a vote from another subsystem
>> like tz, hyp etc or due to an internal hardware signal. To allow
>> this, gpucc driver can expose an interface to the client driver using
>> reset framework. Using this the client driver can trigger a polling within
>> the gdsc driver.
>>
>> This series is rebased on top of linus's master branch.
>>
>> Related discussion: https://patchwork.freedesktop.org/patch/493144/
>>
> Forgive me if I'm assuming too much, but isn't this an extension of:
>
> 85a3d920d30a ("clk: qcom: Add a dummy enable function for GX gdsc")
>
> With the additional requirement that disable should really ensure that
> the GDSC is turned off?
Also, gpu driver needs a way to ensure cx gdsc was collapsed at least 
once before it goes ahead with re-init.

Btw, the patch you mentioned is about gx gdsc in gpucc which is supposed 
to be owned by gmu (except when it is in bad shape). But the current 
series is about cx gdsc which is shared with other subsystems/drivers.

-Akhil.
>
> Regards,
> Bjorn
>
>> Akhil P Oommen (5):
>>    dt-bindings: clk: qcom: Support gpu cx gdsc reset
>>    clk: qcom: Allow custom reset ops
>>    clk: qcom: gpucc-sc7280: Add cx collapse reset support
>>    clk: qcom: gdsc: Add a reset op to poll gdsc collapse
>>    arm64: dts: qcom: sc7280: Add Reset support for gpu
>>
>>   arch/arm64/boot/dts/qcom/sc7280.dtsi          |  3 +++
>>   drivers/clk/qcom/gdsc.c                       | 23 +++++++++++++++++++----
>>   drivers/clk/qcom/gdsc.h                       |  7 +++++++
>>   drivers/clk/qcom/gpucc-sc7280.c               |  6 ++++++
>>   drivers/clk/qcom/reset.c                      |  6 ++++++
>>   drivers/clk/qcom/reset.h                      |  2 ++
>>   include/dt-bindings/clock/qcom,gpucc-sc7280.h |  3 +++
>>   7 files changed, 46 insertions(+), 4 deletions(-)
>>
>> -- 
>> 2.7.4
>>

