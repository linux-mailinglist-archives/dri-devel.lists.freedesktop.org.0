Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F9E85ED64D
	for <lists+dri-devel@lfdr.de>; Wed, 28 Sep 2022 09:37:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9704310E26B;
	Wed, 28 Sep 2022 07:37:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE21010E2F4;
 Wed, 28 Sep 2022 07:37:28 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 28S5tXa8017510;
 Wed, 28 Sep 2022 07:37:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=bQwSbPWV9aAjDmT4q4/mNCIIU53Tgr6fPJA432P0lyw=;
 b=OEhgxZYQx9YO+fnXyZAWMPl2Ig0ip4bcHULQ9iplT6hsEXN6Ab1KHdg2r3Adgr+2xHqL
 OFKbT/WzmnP/dcZ5hD9EbK0RYS3ImRaeXZ7XjTjwoGd23XcE/fs22Kto5LBM79LqUKcE
 vDWFR3clmj6Gv2SyPJeK1vuMs6cuvkMDPlk/KludvvMrliz0RbTutBBtpinXzLjaUD6j
 TGdJBut8qVZGZ57SsgQrvGr4qRxt6dr1VsNp3sSx73DCMMFl+XKtvQrp5s6NliGeVRtw
 zW2yNif1cSGGo3EEO4fjripduQO2NI8e7PS2csG/FOkpNTEFnS8Y8BNPUTt8DKMh9s3b jA== 
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3jvbf0gtfm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 28 Sep 2022 07:37:23 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 28S7bM0L015786
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 28 Sep 2022 07:37:22 GMT
Received: from [10.204.67.102] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.29; Wed, 28 Sep
 2022 00:37:17 -0700
Message-ID: <e4794dcb-8450-a1b5-244d-abff800d60f1@quicinc.com>
Date: Wed, 28 Sep 2022 13:07:14 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: Re: [PATCH v3 3/5] clk: qcom: gdsc: Add a reset op to poll gdsc
 collapse
Content-Language: en-US
To: Bjorn Andersson <andersson@kernel.org>
References: <1660853919-987-1-git-send-email-quic_akhilpo@quicinc.com>
 <20220819014758.v3.3.I162c4be55f230cd439f0643f1624527bdc8a9831@changeid>
 <20220927172626.cwxpmrqkb7zsuolx@builder.lan>
From: Akhil P Oommen <quic_akhilpo@quicinc.com>
In-Reply-To: <20220927172626.cwxpmrqkb7zsuolx@builder.lan>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: YTqevWIvWo1srfz329B86bAwax0Drikb
X-Proofpoint-ORIG-GUID: YTqevWIvWo1srfz329B86bAwax0Drikb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-28_02,2022-09-27_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0
 mlxscore=0 priorityscore=1501 phishscore=0 impostorscore=0
 lowpriorityscore=0 mlxlogscore=999 adultscore=0 clxscore=1011 bulkscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2209280045
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
Cc: Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
 Michael Turquette <mturquette@baylibre.com>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Douglas Anderson <dianders@chromium.org>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, krzysztof.kozlowski@linaro.org,
 Andy Gross <agross@kernel.org>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 freedreno <freedreno@lists.freedesktop.org>, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 9/27/2022 10:56 PM, Bjorn Andersson wrote:
> On Fri, Aug 19, 2022 at 01:48:37AM +0530, Akhil P Oommen wrote:
>> Add a reset op compatible function to poll for gdsc collapse.
>>
>> Signed-off-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
>> ---
>>
>> (no changes since v2)
>>
>> Changes in v2:
>> - Minor update to function prototype
>>
>>   drivers/clk/qcom/gdsc.c | 23 +++++++++++++++++++----
>>   drivers/clk/qcom/gdsc.h |  7 +++++++
>>   2 files changed, 26 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/clk/qcom/gdsc.c b/drivers/clk/qcom/gdsc.c
>> index 44520ef..2d0f1d1 100644
>> --- a/drivers/clk/qcom/gdsc.c
>> +++ b/drivers/clk/qcom/gdsc.c
>> @@ -17,6 +17,7 @@
>>   #include <linux/reset-controller.h>
>>   #include <linux/slab.h>
>>   #include "gdsc.h"
>> +#include "reset.h"
>>   
>>   #define PWR_ON_MASK		BIT(31)
>>   #define EN_REST_WAIT_MASK	GENMASK_ULL(23, 20)
>> @@ -116,7 +117,8 @@ static int gdsc_hwctrl(struct gdsc *sc, bool en)
>>   	return regmap_update_bits(sc->regmap, sc->gdscr, HW_CONTROL_MASK, val);
>>   }
>>   
>> -static int gdsc_poll_status(struct gdsc *sc, enum gdsc_status status)
>> +static int gdsc_poll_status(struct gdsc *sc, enum gdsc_status status,
>> +		s64 timeout_us, unsigned int interval_ms)
>>   {
>>   	ktime_t start;
>>   
>> @@ -124,7 +126,9 @@ static int gdsc_poll_status(struct gdsc *sc, enum gdsc_status status)
>>   	do {
>>   		if (gdsc_check_status(sc, status))
>>   			return 0;
>> -	} while (ktime_us_delta(ktime_get(), start) < TIMEOUT_US);
>> +		if (interval_ms)
>> +			msleep(interval_ms);
> You effectively msleep(5) here, for which you shouldn't use msleep() -
> or more likely, this only happens in exceptional circumstances, so a
> longer interval_ms seems reasonable.
By reducing the overall polling time here, we can reduce any user 
visible impact like missing frame/janks due to gpu hang/recovery. I kept 
5ms here because in my local testing on sc7280 device I didn't see any 
benefit beyond decreasing below 5ms. Msleep() here also helps to quickly 
schedule other threads which holds pm_runtime refcount on cx_gdsc, which 
indirectly helps to reduce overall polling time here significantly in my 
testing.

>
>> +	} while (ktime_us_delta(ktime_get(), start) < timeout_us);
>>   
>>   	if (gdsc_check_status(sc, status))
>>   		return 0;
>> @@ -172,7 +176,7 @@ static int gdsc_toggle_logic(struct gdsc *sc, enum gdsc_status status)
>>   		udelay(1);
>>   	}
>>   
>> -	ret = gdsc_poll_status(sc, status);
>> +	ret = gdsc_poll_status(sc, status, TIMEOUT_US, 0);
>>   	WARN(ret, "%s status stuck at 'o%s'", sc->pd.name, status ? "ff" : "n");
>>   
>>   	if (!ret && status == GDSC_OFF && sc->rsupply) {
>> @@ -343,7 +347,7 @@ static int _gdsc_disable(struct gdsc *sc)
>>   		 */
>>   		udelay(1);
>>   
>> -		ret = gdsc_poll_status(sc, GDSC_ON);
>> +		ret = gdsc_poll_status(sc, GDSC_ON, TIMEOUT_US, 0);
>>   		if (ret)
>>   			return ret;
>>   	}
>> @@ -565,3 +569,14 @@ int gdsc_gx_do_nothing_enable(struct generic_pm_domain *domain)
>>   	return 0;
>>   }
>>   EXPORT_SYMBOL_GPL(gdsc_gx_do_nothing_enable);
>> +
>> +int gdsc_wait_for_collapse(void *priv)
>> +{
>> +	struct gdsc *sc = priv;
>> +	int ret;
>> +
>> +	ret = gdsc_poll_status(sc, GDSC_OFF, 500000, 5);
> So I presume the GPU driver will put() the GDSC and then issue a reset,
> which will wait up to 5 seconds for the GDSC to be turned off.
Not exactly. GPU driver will put() its GDSC vote and will wait for 500ms 
to allow other clients to drop their vote and the cx_gdsc to finally 
collapse at hw. There is no hw interface to 'reset' entire GPU 
subsystem. We have to pull the plug on gdsc to reset it.
>
> So essentially, this logic is needed because we don't wait for VOTABLE
> GDSCs to be turned off? And we have no way to do the put-with-wait for
> this specific case.
>
> I would like the commit message to capture this reasoning.
Agree. Will post a new patchset once we have consensus on the rest of 
the things here.

-Akhil.
>
> Thanks,
> Bjorn
>
>> +	WARN(ret, "%s status stuck at 'on'", sc->pd.name);
>> +	return ret;
>> +}
>> +EXPORT_SYMBOL_GPL(gdsc_wait_for_collapse);
>> diff --git a/drivers/clk/qcom/gdsc.h b/drivers/clk/qcom/gdsc.h
>> index ad313d7..d484bdb 100644
>> --- a/drivers/clk/qcom/gdsc.h
>> +++ b/drivers/clk/qcom/gdsc.h
>> @@ -12,6 +12,7 @@
>>   struct regmap;
>>   struct regulator;
>>   struct reset_controller_dev;
>> +struct qcom_reset_map;
>>   
>>   /**
>>    * struct gdsc - Globally Distributed Switch Controller
>> @@ -79,6 +80,7 @@ int gdsc_register(struct gdsc_desc *desc, struct reset_controller_dev *,
>>   		  struct regmap *);
>>   void gdsc_unregister(struct gdsc_desc *desc);
>>   int gdsc_gx_do_nothing_enable(struct generic_pm_domain *domain);
>> +int gdsc_wait_for_collapse(void *priv);
>>   #else
>>   static inline int gdsc_register(struct gdsc_desc *desc,
>>   				struct reset_controller_dev *rcdev,
>> @@ -88,5 +90,10 @@ static inline int gdsc_register(struct gdsc_desc *desc,
>>   }
>>   
>>   static inline void gdsc_unregister(struct gdsc_desc *desc) {};
>> +
>> +static int gdsc_wait_for_collapse(void *priv)
>> +{
>> +	return  -ENOSYS;
>> +}
>>   #endif /* CONFIG_QCOM_GDSC */
>>   #endif /* __QCOM_GDSC_H__ */
>> -- 
>> 2.7.4
>>

