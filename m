Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CE6146A4BFA
	for <lists+dri-devel@lfdr.de>; Mon, 27 Feb 2023 21:06:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF6B210E40B;
	Mon, 27 Feb 2023 20:06:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C3D0410E40B;
 Mon, 27 Feb 2023 20:06:03 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 31RJDGKf018065; Mon, 27 Feb 2023 20:05:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=qgndGnIFIELrslxCS5zP1o2/OZoiO2ETrIEWwAJWI3Y=;
 b=HuwjgfqKblmR1/Ak7PXdjfB7g7a0ANDbJpTynrxrRltNjUGaX9LMwt+OYYaTSI2N7XnY
 NEqvQErO3/GtGlqq6EhKGAB0+D87NklLSIWkseGwujoQ8qgVe5Vm99g2QBo++SeuRdcZ
 pDunTgyEX3kq7XTotDBwwcAimnY5YvbusL8SNIHwcnszNffWyhiEFGbJlklUIzzysvIB
 UnkKs7kfPhpEX2nxPuiXPJluWUKsksGVqUp548kLvXiwpuIrsOCz/9e20VQE+kPuVePX
 o9qPodCL/STfuKqELP9HBoRujzPk5Dv1gcXWDTgxJ5IlrXnLMa+G44I2Rx6dvJABDeeg Jg== 
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3nybmh5xgr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 27 Feb 2023 20:05:56 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 31RK5tCb004830
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 27 Feb 2023 20:05:55 GMT
Received: from [10.110.126.127] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.41; Mon, 27 Feb
 2023 12:05:54 -0800
Message-ID: <846439be-77db-7311-3bb3-3647dc6d0622@quicinc.com>
Date: Mon, 27 Feb 2023 12:05:53 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCH] drm/msm/dp: check core_initialized flag at both
 host_init() and host_deinit()
Content-Language: en-US
To: Stephen Boyd <swboyd@chromium.org>, Kuogee Hsieh
 <quic_khsieh@quicinc.com>, <agross@kernel.org>,
 <airlied@gmail.com>, <andersson@kernel.org>, <daniel@ffwll.ch>,
 <dianders@chromium.org>, <dmitry.baryshkov@linaro.org>,
 <robdclark@gmail.com>, <sean@poorly.run>, <vkoul@kernel.org>
References: <1677263398-13801-1-git-send-email-quic_khsieh@quicinc.com>
 <CAE-0n514WpXDhE17DzqF9X7DYg_3DYuYSGzhvx-=eXVJpgq3Yg@mail.gmail.com>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <CAE-0n514WpXDhE17DzqF9X7DYg_3DYuYSGzhvx-=eXVJpgq3Yg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: hW9hgsjV4l20HIjaOlDVuJGnUrGM1GU3
X-Proofpoint-ORIG-GUID: hW9hgsjV4l20HIjaOlDVuJGnUrGM1GU3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.170.22
 definitions=2023-02-27_17,2023-02-27_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0
 phishscore=0 impostorscore=0 adultscore=0 mlxlogscore=999
 lowpriorityscore=0 priorityscore=1501 spamscore=0 clxscore=1015 mlxscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2302270159
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
Cc: linux-arm-msm@vger.kernel.org, quic_sbillaka@quicinc.com,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Stephen

On 2/27/2023 11:53 AM, Stephen Boyd wrote:
> Quoting Kuogee Hsieh (2023-02-24 10:29:58)
>> There is a reboot/suspend test case where system suspend is forced during
>> system booting up. Since host_init() of external DP is executed at hpd
> 
> dp_display_host_init()?
> 
>> thread context, this test case may created a scenario that host_deinit()
> 
> dp_display_host_deinit()?
> 
ack for both.
>> from pm_suspend() run before host_init() if hpd thread has no chance to
>> run during booting up while suspend request command was issued.
>> At this scenario system will crash at aux register access at host_deinit()
>> since aux clock had not yet been enabled by host_init().  Therefore we
> 
> The aux clk is enabled in dp_power_clk_enable() right? Can you clarify?
> 

Yes, thats right. Its mapped to core_*** in the dts hence the name goes 
to the DP_CORE_PM case in the dp_power_clk_enable()

3092 				clocks = <&dispcc DISP_CC_MDSS_AHB_CLK>,
3093 					 <&dispcc DISP_CC_MDSS_DP_AUX_CLK>,
3094 					 <&dispcc DISP_CC_MDSS_DP_LINK_CLK>,
3095 					 <&dispcc DISP_CC_MDSS_DP_LINK_INTF_CLK>,
3096 					 <&dispcc DISP_CC_MDSS_DP_PIXEL_CLK>;
3097 				clock-names = "core_iface", "core_aux"

>> have to ensure aux clock enabled by checking core_initialized flag before
>> access aux registers at pm_suspend.
> 
> I'd much more like to get rid of 'core_initialized'. What is preventing
> us from enabling the power (i.e. dp_power_init()), or at least enough
> clks and pm runtime state, during probe? That would fix this problem and
> also clean things up. As I understand, the device is half initialized in
> probe and half initialized in the kthread. If we put all power
> management into the runtime PM ops and synced that state during probe so
> that runtime PM state matched device probe state we could make runtime
> PM be the only suspend function and then push the power state tracking
> into the device core.
> 

You are correct. https://patchwork.freedesktop.org/patch/523879/ will be 
doing that. Its still in review.

>>
>> Fixes: 989ebe7bc446 ("drm/msm/dp: do not initialize phy until plugin interrupt received")
>> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
> 
> The code looks OK to me, so
> 
> Reviewed-by: Stephen Boyd <swboyd@chromium.org>
> 
> once the commit text is cleaned up to indicate the proper function
> names.

Thanks , will fix all those.
