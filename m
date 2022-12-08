Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EDBEE647266
	for <lists+dri-devel@lfdr.de>; Thu,  8 Dec 2022 16:03:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 72C8110E4AF;
	Thu,  8 Dec 2022 15:03:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC66B10E4AE;
 Thu,  8 Dec 2022 15:03:17 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2B86KHk2008719; Thu, 8 Dec 2022 15:03:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=1ZutQiq09d9f+9p1SPqnaMr6I0W7Z5/+WNBzbiAIRpk=;
 b=JLvRNPY2FhDk5Rho+LAHbSkn3sGDxbPOon30zT8Sk54NIdnt70eqYyc2g9lSvbOipJ1i
 bMMnIQTROtEuPrlH78PowygLWaG1MTy33aDPAqKZq+OMrCJlm53P1k07Yqj3w9/3/5ts
 2NKDltHu7PJzuZrX5mKucIJZ1yXqDKxW8JL2lvkgqmNh3pHroRwlsmjZLRqyFs14Byik
 PnWas1MwRNJS6JWDWzKu8tVaRikfJ0LWK+Eq4OJtkBPhMZJxn/r7ZwJqwphYhKSfC8Ue
 WaTuuHpo0iec0ZvGbQ7ysbnxmUjqY3zASt8FvtuszD/6R3FSTqfUMpOP0TeCHhbs5PXw jg== 
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3majt4ctjj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 08 Dec 2022 15:03:07 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 2B8F36qf007742
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 8 Dec 2022 15:03:06 GMT
Received: from [10.216.54.36] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Thu, 8 Dec 2022
 07:03:00 -0800
Message-ID: <9726a08f-266e-2949-8141-3a726ffd2795@quicinc.com>
Date: Thu, 8 Dec 2022 20:32:57 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: Re: [PATCH v7 3/6] clk: qcom: gdsc: Add a reset op to poll gdsc
 collapse
Content-Language: en-US
To: Ulf Hansson <ulf.hansson@linaro.org>
References: <1664960824-20951-1-git-send-email-quic_akhilpo@quicinc.com>
 <20221005143618.v7.3.I162c4be55f230cd439f0643f1624527bdc8a9831@changeid>
 <CAPDyKFpMUQo-Q2sbm3YXPeagt88zsRFWgc06GmNm0TVUPmPY_g@mail.gmail.com>
From: Akhil P Oommen <quic_akhilpo@quicinc.com>
In-Reply-To: <CAPDyKFpMUQo-Q2sbm3YXPeagt88zsRFWgc06GmNm0TVUPmPY_g@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: ytwsmVnTBekg-BcnS9tXUJe47KKT6SaZ
X-Proofpoint-ORIG-GUID: ytwsmVnTBekg-BcnS9tXUJe47KKT6SaZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-08_08,2022-12-08_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0
 mlxlogscore=999 bulkscore=0 clxscore=1015 adultscore=0 mlxscore=0
 priorityscore=1501 impostorscore=0 phishscore=0 spamscore=0 malwarescore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2212080124
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
Cc: linux-clk@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>,
 linux-arm-msm@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Douglas Anderson <dianders@chromium.org>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, krzysztof.kozlowski@linaro.org,
 Andy Gross <agross@kernel.org>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno <freedreno@lists.freedesktop.org>,
 Michael Turquette <mturquette@baylibre.com>, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 12/7/2022 9:15 PM, Ulf Hansson wrote:
> On Wed, 5 Oct 2022 at 11:08, Akhil P Oommen <quic_akhilpo@quicinc.com> wrote:
>> Add a reset op compatible function to poll for gdsc collapse. This is
>> required because:
>>   1. We don't wait for it to turn OFF at hardware for VOTABLE GDSCs.
>>   2. There is no way for client drivers (eg. gpu driver) to do
>>   put-with-wait for these gdscs which is required in some scenarios
>>   (eg. GPU recovery).
> What puzzles me a bit, who is the typical consumer of the reset.
>
> I looked at patch4 and tried to figure it out, but let's discuss that
> in that thread instead. Some more comments, see below.

https://patchwork.freedesktop.org/patch/498397/
gpu driver side changes are already merged in upstream. We call this interface during a GPU recovery which is supposed to be a rare event.
>
>> Signed-off-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>> ---
>>
>> Changes in v7:
>> - Update commit message (Bjorn)
>>
>> Changes in v2:
>> - Minor update to function prototype
>>
>>  drivers/clk/qcom/gdsc.c | 23 +++++++++++++++++++----
>>  drivers/clk/qcom/gdsc.h |  7 +++++++
>>  2 files changed, 26 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/clk/qcom/gdsc.c b/drivers/clk/qcom/gdsc.c
>> index 7cf5e13..ccef742 100644
>> --- a/drivers/clk/qcom/gdsc.c
>> +++ b/drivers/clk/qcom/gdsc.c
>> @@ -17,6 +17,7 @@
>>  #include <linux/reset-controller.h>
>>  #include <linux/slab.h>
>>  #include "gdsc.h"
>> +#include "reset.h"
>>
>>  #define PWR_ON_MASK            BIT(31)
>>  #define EN_REST_WAIT_MASK      GENMASK_ULL(23, 20)
>> @@ -116,7 +117,8 @@ static int gdsc_hwctrl(struct gdsc *sc, bool en)
>>         return regmap_update_bits(sc->regmap, sc->gdscr, HW_CONTROL_MASK, val);
>>  }
>>
>> -static int gdsc_poll_status(struct gdsc *sc, enum gdsc_status status)
>> +static int gdsc_poll_status(struct gdsc *sc, enum gdsc_status status,
>> +               s64 timeout_us, unsigned int interval_ms)
>>  {
>>         ktime_t start;
>>
>> @@ -124,7 +126,9 @@ static int gdsc_poll_status(struct gdsc *sc, enum gdsc_status status)
>>         do {
>>                 if (gdsc_check_status(sc, status))
>>                         return 0;
>> -       } while (ktime_us_delta(ktime_get(), start) < TIMEOUT_US);
>> +               if (interval_ms)
>> +                       msleep(interval_ms);
>> +       } while (ktime_us_delta(ktime_get(), start) < timeout_us);
> Rather than continue to open code this polling loop, would it not make
> sense to convert the code into using readx_poll_timeout() (or some of
> its friends).
I was going for a minimal code churn to get this mainlined easily. I like the idea, perhaps we can have a refactor patch if there is consensus.

-Akhil.
>
> Down the road, this leads to that the msleep() above should become
> usleep_range() instead, which seems more correct to me.
>
>>         if (gdsc_check_status(sc, status))
>>                 return 0;
>> @@ -189,7 +193,7 @@ static int gdsc_toggle_logic(struct gdsc *sc, enum gdsc_status status)
>>                 udelay(1);
>>         }
>>
>> -       ret = gdsc_poll_status(sc, status);
>> +       ret = gdsc_poll_status(sc, status, TIMEOUT_US, 0);
>>         WARN(ret, "%s status stuck at 'o%s'", sc->pd.name, status ? "ff" : "n");
>>
>>         if (!ret && status == GDSC_OFF && sc->rsupply) {
>> @@ -360,7 +364,7 @@ static int _gdsc_disable(struct gdsc *sc)
>>                  */
>>                 udelay(1);
>>
>> -               ret = gdsc_poll_status(sc, GDSC_ON);
>> +               ret = gdsc_poll_status(sc, GDSC_ON, TIMEOUT_US, 0);
>>                 if (ret)
>>                         return ret;
>>         }
>> @@ -608,3 +612,14 @@ int gdsc_gx_do_nothing_enable(struct generic_pm_domain *domain)
>>         return 0;
>>  }
>>  EXPORT_SYMBOL_GPL(gdsc_gx_do_nothing_enable);
>> +
>> +int gdsc_wait_for_collapse(void *priv)
>> +{
>> +       struct gdsc *sc = priv;
>> +       int ret;
>> +
>> +       ret = gdsc_poll_status(sc, GDSC_OFF, 500000, 5);
>> +       WARN(ret, "%s status stuck at 'on'", sc->pd.name);
>> +       return ret;
>> +}
>> +EXPORT_SYMBOL_GPL(gdsc_wait_for_collapse);
>> diff --git a/drivers/clk/qcom/gdsc.h b/drivers/clk/qcom/gdsc.h
>> index 981a12c..5395f69 100644
>> --- a/drivers/clk/qcom/gdsc.h
>> +++ b/drivers/clk/qcom/gdsc.h
>> @@ -12,6 +12,7 @@
>>  struct regmap;
>>  struct regulator;
>>  struct reset_controller_dev;
>> +struct qcom_reset_map;
>>
>>  /**
>>   * struct gdsc - Globally Distributed Switch Controller
>> @@ -88,6 +89,7 @@ int gdsc_register(struct gdsc_desc *desc, struct reset_controller_dev *,
>>                   struct regmap *);
>>  void gdsc_unregister(struct gdsc_desc *desc);
>>  int gdsc_gx_do_nothing_enable(struct generic_pm_domain *domain);
>> +int gdsc_wait_for_collapse(void *priv);
>>  #else
>>  static inline int gdsc_register(struct gdsc_desc *desc,
>>                                 struct reset_controller_dev *rcdev,
>> @@ -97,5 +99,10 @@ static inline int gdsc_register(struct gdsc_desc *desc,
>>  }
>>
>>  static inline void gdsc_unregister(struct gdsc_desc *desc) {};
>> +
>> +static int gdsc_wait_for_collapse(void *priv)
>> +{
>> +       return  -ENOSYS;
>> +}
>>  #endif /* CONFIG_QCOM_GDSC */
>>  #endif /* __QCOM_GDSC_H__ */
> Kind regards
> Uffe

