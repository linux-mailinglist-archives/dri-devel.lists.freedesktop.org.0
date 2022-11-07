Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EF9F61FA9D
	for <lists+dri-devel@lfdr.de>; Mon,  7 Nov 2022 17:55:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F4E010E463;
	Mon,  7 Nov 2022 16:55:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8312B10E4BA;
 Mon,  7 Nov 2022 16:55:08 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2A7Gd7ln022962; Mon, 7 Nov 2022 16:55:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=KyO7Kqgqw3RkHRvFLoYkgPhFBPdHmz+orXJL+eEe4tY=;
 b=iME60Btir4MNYbfFDmBtQ6BbhvcWzU1R5OZ6ZvnYDDkQK6FCwx0AsTay4digvRXE6cGz
 QyUVjJHWx/Jw/RaKinjePftPCCfFDZuhItprCBvowd+Ir7FN9VZ/rMSFstPpVqEPKlMC
 vbSoqMbBjZD+T+vg3wc5DlVLiRCJZ8r/e0lVdyGfXgH0NIyN99p/EQW3AM8Go1IDQEsH
 3Sr0fNo7adtV0uf50vnSMYQTmEGA8WznKzjTE0JjQDV/rdFQ7xoSo/QZjoFNYQfL2nJf
 sRV/dv821LuWg7JqUCySeU5vjUKEhyOB+EY5zpJdsgBTrPQ94ahWtAj+cWCDmemNeixy jg== 
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3kpvge9f1t-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 07 Nov 2022 16:55:00 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 2A7GsxIJ011989
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 7 Nov 2022 16:54:59 GMT
Received: from [10.216.2.134] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.29; Mon, 7 Nov 2022
 08:54:52 -0800
Message-ID: <d4654169-6dc7-468f-d0e6-b6de4cbad418@quicinc.com>
Date: Mon, 7 Nov 2022 22:24:49 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: Re: [PATCH v7 0/6] clk/qcom: Support gdsc collapse polling using
 'reset' interface
Content-Language: en-US
To: freedreno <freedreno@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, <linux-arm-msm@vger.kernel.org>,
 Rob Clark <robdclark@gmail.com>, Bjorn Andersson <andersson@kernel.org>,
 Stephen Boyd <swboyd@chromium.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Philipp Zabel <p.zabel@pengutronix.de>
References: <1664960824-20951-1-git-send-email-quic_akhilpo@quicinc.com>
From: Akhil P Oommen <quic_akhilpo@quicinc.com>
In-Reply-To: <1664960824-20951-1-git-send-email-quic_akhilpo@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: GoWq44qxRLbz-4Al_VVhsdXIPLRL5Lvh
X-Proofpoint-GUID: GoWq44qxRLbz-4Al_VVhsdXIPLRL5Lvh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-07_08,2022-11-07_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 bulkscore=0
 phishscore=0 adultscore=0 malwarescore=0 lowpriorityscore=0 suspectscore=0
 mlxlogscore=999 impostorscore=0 clxscore=1011 spamscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2211070135
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
Cc: devicetree@vger.kernel.org, Krzysztof
 Kozlowski <krzysztof.kozlowski+dt@linaro.org>, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, Michael Turquette <mturquette@baylibre.com>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Douglas Anderson <dianders@chromium.org>, Rob Herring <robh+dt@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Stephen Boyd <sboyd@kernel.org>,
 krzysztof.kozlowski@linaro.org, Andy Gross <agross@kernel.org>,
 Sean Paul <sean@poorly.run>, linux-clk@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 10/5/2022 2:36 PM, Akhil P Oommen wrote:
> Some clients like adreno gpu driver would like to ensure that its gdsc
> is collapsed at hardware during a gpu reset sequence. This is because it
> has a votable gdsc which could be ON due to a vote from another subsystem
> like tz, hyp etc or due to an internal hardware signal. To allow
> this, gpucc driver can expose an interface to the client driver using
> reset framework. Using this the client driver can trigger a polling within
> the gdsc driver.
>
> This series is rebased on top of qcom/linux:for-next branch.
>
> Related discussion: https://patchwork.freedesktop.org/patch/493144/
>
> Changes in v7:
> - Update commit message (Bjorn)
> - Rebased on top of qcom/linux:for-next branch.
>
> Changes in v6:
> - No code changes in this version. Just captured the Acked-by tags
>
> Changes in v5:
> - Nit: Remove a duplicate blank line (Krzysztof)
>
> Changes in v4:
> - Update gpu dt-binding schema
> - Typo fix in commit text
>
> Changes in v3:
> - Use pointer to const for "struct qcom_reset_ops" in qcom_reset_map (Krzysztof)
>
> Changes in v2:
> - Return error when a particular custom reset op is not implemented. (Dmitry)
>
> Akhil P Oommen (6):
>    dt-bindings: clk: qcom: Support gpu cx gdsc reset
>    clk: qcom: Allow custom reset ops
>    clk: qcom: gdsc: Add a reset op to poll gdsc collapse
>    clk: qcom: gpucc-sc7280: Add cx collapse reset support
>    dt-bindings: drm/msm/gpu: Add optional resets
>    arm64: dts: qcom: sc7280: Add Reset support for gpu
>
>   .../devicetree/bindings/display/msm/gpu.yaml       |  6 +++++
>   arch/arm64/boot/dts/qcom/sc7280.dtsi               |  3 +++
>   drivers/clk/qcom/gdsc.c                            | 23 ++++++++++++++----
>   drivers/clk/qcom/gdsc.h                            |  7 ++++++
>   drivers/clk/qcom/gpucc-sc7280.c                    | 10 ++++++++
>   drivers/clk/qcom/reset.c                           | 27 +++++++++++++++++++++-
>   drivers/clk/qcom/reset.h                           |  8 +++++++
>   include/dt-bindings/clock/qcom,gpucc-sc7280.h      |  3 +++
>   8 files changed, 82 insertions(+), 5 deletions(-)
>
Bjorn,

The latest patchset has been in the mailing list for over a month now. 
Could you please share how soon we can pick this? That will give me some 
confidence to pull these patches into our chromeos kernel tree ASAP.

-Akhil.
