Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 226054C20BD
	for <lists+dri-devel@lfdr.de>; Thu, 24 Feb 2022 01:41:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 19DE310E181;
	Thu, 24 Feb 2022 00:41:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from alexa-out-sd-01.qualcomm.com (alexa-out-sd-01.qualcomm.com
 [199.106.114.38])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DAB1310E175;
 Thu, 24 Feb 2022 00:40:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1645663259; x=1677199259;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=T1BsiMbxSIkgWGJ3lFZKEyZTI31MdLBkfQ8ytEFnx0A=;
 b=XBudpUCe17DQh4F493v5dhTbm7+sahD+375rqzhoBTPodwqeIcfTSZ5v
 Yc9o5yZPBHW7nCCSr1k4iiFbghXV9rLAkhKZKyhy/IFP17ZgN0zCZEDf/
 8vvZNVE3S/9iuk460ktcCvI3Eyqy8KZeX745DXa8+iSQ0Jtrz7CzsruSp w=;
Received: from unknown (HELO ironmsg05-sd.qualcomm.com) ([10.53.140.145])
 by alexa-out-sd-01.qualcomm.com with ESMTP; 23 Feb 2022 16:40:59 -0800
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg05-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2022 16:40:58 -0800
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.15; Wed, 23 Feb 2022 16:40:58 -0800
Received: from [10.110.6.143] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.15; Wed, 23 Feb
 2022 16:40:57 -0800
Message-ID: <552d9809-0499-23b5-e437-a77c893b96c2@quicinc.com>
Date: Wed, 23 Feb 2022 16:40:56 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [RFC PATCH v2 4/5] drm/msm/dp: replace dp_connector with
 drm_bridge_connector
Content-Language: en-US
To: Stephen Boyd <swboyd@chromium.org>, Dmitry Baryshkov
 <dmitry.baryshkov@linaro.org>
References: <20220211224006.1797846-1-dmitry.baryshkov@linaro.org>
 <20220211224006.1797846-5-dmitry.baryshkov@linaro.org>
 <572c0402-55da-077b-1809-3d1caf7ce743@quicinc.com>
 <b25d422e-cdd8-bcb9-1815-1d89f170d421@linaro.org>
 <CAE-0n51afuHURLHaZBa77H_n+cm4Tj1Du-rpLH-HsrkY5xQVJA@mail.gmail.com>
 <CAA8EJpobtpc5mB48g6K=+KaZQ-o8m_QTZr-dQvwz-9cEwiJ_Kg@mail.gmail.com>
 <7f9e2181-bb1a-c734-2e90-c5922952acb4@quicinc.com>
 <493749c1-6305-1a94-4e05-519c825e9d4d@linaro.org>
 <a803c7a9-de4c-8fe5-d80d-56366df78611@quicinc.com>
 <CAE-0n50VWH9Mum_W9e+6X1vjxvS3KWDqBtPfKHL-weA7S+_3Hg@mail.gmail.com>
From: Kuogee Hsieh <quic_khsieh@quicinc.com>
In-Reply-To: <CAE-0n50VWH9Mum_W9e+6X1vjxvS3KWDqBtPfKHL-weA7S+_3Hg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
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
Cc: freedreno@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 dri-devel@lists.freedesktop.org, Bjorn Andersson <bjorn.andersson@linaro.org>,
 Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 2/23/2022 1:33 PM, Stephen Boyd wrote:
> Quoting Kuogee Hsieh (2022-02-23 10:27:26)
>> On 2/23/2022 10:22 AM, Dmitry Baryshkov wrote:
>>> On 23/02/2022 20:21, Kuogee Hsieh wrote:
>>>
>>> In the panel device node.
>>>
>>> Can you please share it too?
>>
>> &soc {
>>           edp_power_supply: edp_power {
>>                   compatible = "regulator-fixed";
>>                   regulator-name = "edp_backlight_power";
>>
>>                   regulator-always-on;
>>                   regulator-boot-on;
>>           };
>>
>>           edp_backlight: edp_backlight {
>>                   compatible = "pwm-backlight";
>>
>>                   pwms = <&pm8350c_pwm 3 65535>;
>>                   power-supply = <&edp_power_supply>;
>>                   enable-gpio = <&pm8350c_gpios 7 GPIO_ACTIVE_HIGH>;
>>
>>                   pinctrl-names = "default";
>>                   pinctrl-0 = <&backlight_pwm_default>;
>>           };
>>
>>           edp_panel: edp_panel {
>>                   compatible = "sharp_lq140m1jw46";
> Is that supposed to be sharp,lq140m1jw46 with a comma instead of an
> underscore?

Stephen,

This is our internal branch which does not have patches up to date yet.

I will cherry-pick newer edp related patches which are under review now 
to re test it.

