Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 56599772CE9
	for <lists+dri-devel@lfdr.de>; Mon,  7 Aug 2023 19:28:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0DFAD10E35F;
	Mon,  7 Aug 2023 17:28:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 552D910E35F;
 Mon,  7 Aug 2023 17:28:48 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 377Cw8sv016125; Mon, 7 Aug 2023 17:28:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=EFlRnDM16Qlnu93ff6dNuQB500aAs11bDQ7gX9qeOCU=;
 b=E6CA+MEKlvAxsZCnjdTfb6DCpjhexPpXxjXzv8JTrBvA+wvHuSCQlXwMe6RJjYTKRW4Q
 Lauo3PfV0D0ezYq36qgiXJX2VyiFY6IVfXxuXJ28EE7BofL3px7KeJ/5KFYfYFThxxDJ
 IbsG70TH6ycH375mzy8oo8olgL1X3roQ9FaFs3i4+OFmimlk/jMnyxIj0xgv7YYLbFFE
 gpI6ce6yBtKRK2TO/23fxRyEL4+xHhaA0w+JOqwjvqO15cx/rIhdxWFsqX6SdZtFtCRy
 DtgEELUrVQkpK1WSm2FT9BP1Vk5xSTlta1DuISx17T8C6sqzrDqZufdNqBLK9NXYXRQb og== 
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3saxbbrwfv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 07 Aug 2023 17:28:35 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 377HSYab003076
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 7 Aug 2023 17:28:34 GMT
Received: from [10.134.70.142] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.30; Mon, 7 Aug
 2023 10:28:33 -0700
Message-ID: <a0596593-0215-99b3-4295-a8bcb6c05129@quicinc.com>
Date: Mon, 7 Aug 2023 10:28:32 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v5 1/8] drm/msm/dpu: fix the irq index in
 dpu_encoder_phys_wb_wait_for_commit_done
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Rob Clark
 <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, Marijn Suijten
 <marijn.suijten@somainline.org>
References: <20230802100426.4184892-1-dmitry.baryshkov@linaro.org>
 <20230802100426.4184892-2-dmitry.baryshkov@linaro.org>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20230802100426.4184892-2-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: xoP2wpLzAXdZ52YVJybKwG4U01p9G2ub
X-Proofpoint-GUID: xoP2wpLzAXdZ52YVJybKwG4U01p9G2ub
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-08-07_19,2023-08-03_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 bulkscore=0
 spamscore=0 clxscore=1015 impostorscore=0 malwarescore=0 phishscore=0
 priorityscore=1501 adultscore=0 suspectscore=0 mlxscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2306200000 definitions=main-2308070160
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
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 8/2/2023 3:04 AM, Dmitry Baryshkov wrote:
> Since commit 1e7ac595fa46 ("drm/msm/dpu: pass irq to
> dpu_encoder_helper_wait_for_irq()") the
> dpu_encoder_phys_wb_wait_for_commit_done expects the IRQ index rather
> than the IRQ index in phys_enc->intr table, however writeback got the
> older invocation in place. This was unnoticed for several releases, but
> now it's time to fix it.
> 

The reason it went unnoticed is because the IRQ index is used within 
dpu_encoder_helper_wait_for_irq() only for cases when the interrupt did 
not fire (in other words not the *working* or common cases). Its used 
only for the trace in dpu_encoder_helper_wait_event_timeout(). So this 
was not really breaking writeback as such because the encoder kickoff / 
wait mechanism largely relies on the kickoff_cnt increment/decrement.

Nonetheless, the patch LGTM and works fine, hence

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>

> Fixes: d7d0e73f7de3 ("drm/msm/dpu: introduce the dpu_encoder_phys_* for writeback")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
> index a466ff70a4d6..78037a697633 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
> @@ -446,7 +446,8 @@ static int dpu_encoder_phys_wb_wait_for_commit_done(
>   	wait_info.atomic_cnt = &phys_enc->pending_kickoff_cnt;
>   	wait_info.timeout_ms = KICKOFF_TIMEOUT_MS;
>   
> -	ret = dpu_encoder_helper_wait_for_irq(phys_enc, INTR_IDX_WB_DONE,
> +	ret = dpu_encoder_helper_wait_for_irq(phys_enc,
> +			phys_enc->irq[INTR_IDX_WB_DONE],
>   			dpu_encoder_phys_wb_done_irq, &wait_info);
>   	if (ret == -ETIMEDOUT)
>   		_dpu_encoder_phys_wb_handle_wbdone_timeout(phys_enc);
