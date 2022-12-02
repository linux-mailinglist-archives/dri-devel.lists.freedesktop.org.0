Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AAAFC6400CA
	for <lists+dri-devel@lfdr.de>; Fri,  2 Dec 2022 08:01:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 45D8210E6A1;
	Fri,  2 Dec 2022 07:01:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4951E10E18E;
 Fri,  2 Dec 2022 07:01:41 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2B26tWk6012953; Fri, 2 Dec 2022 07:01:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=g8AaoOcWjav9yHhLtP7OkCP+s8hEiKhuF1saYLuGe7E=;
 b=KB0Roms5bEV/DUcuOTPl7tY69igol1ym+43F2DQ1yza2KRkfQD2RQsfEHRlp3PdtGYhX
 ndFrKTnzjbY0abjGvKg0z7n0BlHw3C8G4J4FCD+iXzfMp8oM8DY8SaKU6zAgtJURdyco
 yEvI7f1DZwrHE0POKXfZXLl/5DqDcirPQ8D/RM9O1c0Ym+ODGp+m7QyWGBWjJyJrP+GY
 OsuSaU0QktbBYdDt51U6IFhR3CXVWJLiYyTuNlF2qM+ADmv0U8dGA3FKAbtr8pu8EVnf
 cgjgCv4CxW13sVQdaufDGgOcRjEMPBEzMcBkE9ROf/dGSWqB7vEA8xnoYpjfJ6SgBaLY TA== 
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3m6k3qv3nh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 02 Dec 2022 07:01:33 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 2B271VpH022412
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 2 Dec 2022 07:01:31 GMT
Received: from [10.216.20.84] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Thu, 1 Dec 2022
 23:01:24 -0800
Message-ID: <a0544298-f463-4994-1cf4-9e290f85bf37@quicinc.com>
Date: Fri, 2 Dec 2022 12:30:43 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: Re: [Freedreno] [PATCH v7 0/6] clk/qcom: Support gdsc collapse
 polling using 'reset' interface
Content-Language: en-US
To: Bjorn Andersson <andersson@kernel.org>, Ulf Hansson
 <ulf.hansson@linaro.org>
References: <1664960824-20951-1-git-send-email-quic_akhilpo@quicinc.com>
 <20221201225705.46r2m35ketvzipox@builder.lan>
From: Akhil P Oommen <quic_akhilpo@quicinc.com>
In-Reply-To: <20221201225705.46r2m35ketvzipox@builder.lan>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: _AKOKXU5dPUjwI0r9ojqEgdd0efFi5BV
X-Proofpoint-ORIG-GUID: _AKOKXU5dPUjwI0r9ojqEgdd0efFi5BV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-02_03,2022-12-01_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0
 mlxlogscore=999 bulkscore=0 suspectscore=0 lowpriorityscore=0 mlxscore=0
 adultscore=0 spamscore=0 priorityscore=1501 clxscore=1011 phishscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2212020053
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
 Michael Turquette <mturquette@baylibre.com>,
 Konrad Dybcio <konrad.dybcio@somainline.org>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Krzysztof
 Kozlowski <krzysztof.kozlowski+dt@linaro.org>, linux-clk@vger.kernel.org,
 Andy Gross <agross@kernel.org>, devicetree@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Stephen Boyd <swboyd@chromium.org>, Rob Herring <robh+dt@kernel.org>, Sean
 Paul <sean@poorly.run>, Stephen Boyd <sboyd@kernel.org>,
 Douglas Anderson <dianders@chromium.org>, krzysztof.kozlowski@linaro.org,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno <freedreno@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 12/2/2022 4:27 AM, Bjorn Andersson wrote:
> On Wed, Oct 05, 2022 at 02:36:58PM +0530, Akhil P Oommen wrote:
> @Ulf, Akhil has a power-domain for a piece of hardware which may be
> voted active by multiple different subsystems (co-processors/execution
> contexts) in the system.
>
> As such, during the powering down sequence we don't wait for the
> power-domain to turn off. But in the event of an error, the recovery
> mechanism relies on waiting for the hardware to settle in a powered off
> state.
>
> The proposal here is to use the reset framework to wait for this state
> to be reached, before continuing with the recovery mechanism in the
> client driver.
>
> Given our other discussions on quirky behavior, do you have any
> input/suggestions on this?
>
>> Some clients like adreno gpu driver would like to ensure that its gdsc
>> is collapsed at hardware during a gpu reset sequence. This is because it
>> has a votable gdsc which could be ON due to a vote from another subsystem
>> like tz, hyp etc or due to an internal hardware signal. To allow
>> this, gpucc driver can expose an interface to the client driver using
>> reset framework. Using this the client driver can trigger a polling within
>> the gdsc driver.
> @Akhil, this description is fairly generic. As we've reached the state
> where the hardware has settled and we return to the client, what
> prevents it from being powered up again?
>
> Or is it simply a question of it hitting the powered-off state, not
> necessarily staying there?
Correct. It doesn't need to stay there. The intention is to hit the powered-off state at least once to clear all the internal hw states (basically a hw reset).

-Akhil.
>
> Regards,
> Bjorn
>
>> This series is rebased on top of qcom/linux:for-next branch.
>>
>> Related discussion: https://patchwork.freedesktop.org/patch/493144/
>>
>> Changes in v7:
>> - Update commit message (Bjorn)
>> - Rebased on top of qcom/linux:for-next branch.
>>
>> Changes in v6:
>> - No code changes in this version. Just captured the Acked-by tags
>>
>> Changes in v5:
>> - Nit: Remove a duplicate blank line (Krzysztof)
>>
>> Changes in v4:
>> - Update gpu dt-binding schema
>> - Typo fix in commit text
>>
>> Changes in v3:
>> - Use pointer to const for "struct qcom_reset_ops" in qcom_reset_map (Krzysztof)
>>
>> Changes in v2:
>> - Return error when a particular custom reset op is not implemented. (Dmitry)
>>
>> Akhil P Oommen (6):
>>   dt-bindings: clk: qcom: Support gpu cx gdsc reset
>>   clk: qcom: Allow custom reset ops
>>   clk: qcom: gdsc: Add a reset op to poll gdsc collapse
>>   clk: qcom: gpucc-sc7280: Add cx collapse reset support
>>   dt-bindings: drm/msm/gpu: Add optional resets
>>   arm64: dts: qcom: sc7280: Add Reset support for gpu
>>
>>  .../devicetree/bindings/display/msm/gpu.yaml       |  6 +++++
>>  arch/arm64/boot/dts/qcom/sc7280.dtsi               |  3 +++
>>  drivers/clk/qcom/gdsc.c                            | 23 ++++++++++++++----
>>  drivers/clk/qcom/gdsc.h                            |  7 ++++++
>>  drivers/clk/qcom/gpucc-sc7280.c                    | 10 ++++++++
>>  drivers/clk/qcom/reset.c                           | 27 +++++++++++++++++++++-
>>  drivers/clk/qcom/reset.h                           |  8 +++++++
>>  include/dt-bindings/clock/qcom,gpucc-sc7280.h      |  3 +++
>>  8 files changed, 82 insertions(+), 5 deletions(-)
>>
>> -- 
>> 2.7.4
>>

