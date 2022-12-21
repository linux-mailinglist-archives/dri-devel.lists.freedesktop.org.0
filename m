Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F2BF6534D9
	for <lists+dri-devel@lfdr.de>; Wed, 21 Dec 2022 18:16:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E105610E486;
	Wed, 21 Dec 2022 17:15:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B7FB410E46A;
 Wed, 21 Dec 2022 17:15:47 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2BLFsCh4010831; Wed, 21 Dec 2022 17:15:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=1oxQmQwiIenoFfxBXVP/PxDgwVG72FR62Q+9mRgzxps=;
 b=Z8ObkR+wJaOsGV3+N4M4pUt3zlAz45cFfkX0nlySOZ4nuYIMYbfW4duGCgUHF/S8aRzZ
 uO+MGXDBwxDxGsn6PrwogMsXSr9KAYDzfnk/xms/MRUmx2qD9Uxx+qqUBH4kTvdGoq1j
 SKe18fgfFhPaOETT9RiR4CfyffVD3QhUjZj+KQVPZPqUVzuPmCODr5CQoQvDyPQOsOOy
 +ELK1dowxJurCFuVI8/YxZEplRNwR/CE8WSk6A+EhCd98u9vjsnSLQtRd7sNEIAKHAkw
 L9+nB/zJ6AVrcTbK5alBMXtb6Me1sCEMGkOoMXzeX43h9/lLd5q3REOjGn514ljZD7rr uQ== 
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3mm3cjrdwm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 21 Dec 2022 17:15:40 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 2BLHFcnw003686
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 21 Dec 2022 17:15:38 GMT
Received: from [10.216.38.32] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Wed, 21 Dec
 2022 09:15:33 -0800
Message-ID: <84ab14d8-8177-a921-7ae2-7d05248a190b@quicinc.com>
Date: Wed, 21 Dec 2022 22:45:29 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: Re: [PATCH v3 1/5] PM: domains: Allow a genpd consumer to require a
 synced power off
Content-Language: en-US
To: Ulf Hansson <ulf.hansson@linaro.org>
References: <1671522257-38778-1-git-send-email-quic_akhilpo@quicinc.com>
 <20221220131255.v3.1.I3e6b1f078ad0f1ca9358c573daa7b70ec132cdbe@changeid>
 <CAPDyKFr6Hf5gbJ9T9scYqDrg9tmKmVAm=h1J7r3GZzcogk5HpQ@mail.gmail.com>
From: Akhil P Oommen <quic_akhilpo@quicinc.com>
In-Reply-To: <CAPDyKFr6Hf5gbJ9T9scYqDrg9tmKmVAm=h1J7r3GZzcogk5HpQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: okB0CZmVtG-v0eCEsgLc9zJvsRiBbtBG
X-Proofpoint-ORIG-GUID: okB0CZmVtG-v0eCEsgLc9zJvsRiBbtBG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-21_10,2022-12-21_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 mlxlogscore=999
 impostorscore=0 spamscore=0 phishscore=0 clxscore=1015 priorityscore=1501
 suspectscore=0 malwarescore=0 lowpriorityscore=0 adultscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2212070000
 definitions=main-2212210144
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
Cc: Len Brown <len.brown@intel.com>, Pavel Machek <pavel@ucw.cz>,
 Kevin Hilman <khilman@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
 linux-arm-msm@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-pm@vger.kernel.org,
 freedreno <freedreno@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 12/21/2022 8:13 PM, Ulf Hansson wrote:
> On Tue, 20 Dec 2022 at 08:44, Akhil P Oommen <quic_akhilpo@quicinc.com> wrote:
>> From: Ulf Hansson <ulf.hansson@linaro.org>
>>
>> Some genpd providers doesn't ensure that it has turned off at hardware.
>> This is fine until the consumer really requires during some special
>> scenarios that the power domain collapse at hardware before it is
>> turned ON again.
>>
>> An example is the reset sequence of Adreno GPU which requires that the
>> 'gpucc cx gdsc' power domain should move to OFF state in hardware at
>> least once before turning in ON again to clear the internal state.
>>
>> Signed-off-by: Ulf Hansson <ulf.hansson@linaro.org>
>> Signed-off-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
>> ---
>>
>> (no changes since v2)
>>
>> Changes in v2:
>> - Minor formatting fix
>>
>>  drivers/base/power/domain.c | 23 +++++++++++++++++++++++
>>  include/linux/pm_domain.h   |  5 +++++
>>  2 files changed, 28 insertions(+)
>>
>> diff --git a/drivers/base/power/domain.c b/drivers/base/power/domain.c
>> index 967bcf9d415e..53524a102321 100644
>> --- a/drivers/base/power/domain.c
>> +++ b/drivers/base/power/domain.c
>> @@ -519,6 +519,28 @@ ktime_t dev_pm_genpd_get_next_hrtimer(struct device *dev)
>>  }
>>  EXPORT_SYMBOL_GPL(dev_pm_genpd_get_next_hrtimer);
>>
>> +/*
>> + * dev_pm_genpd_synced_poweroff - Next power off should be synchronous
>> + *
>> + * @dev: A device that is attached to the genpd.
>> + *
>> + * Allows a consumer of the genpd to notify the provider that the next power off
>> + * should be synchronous.
> Nitpick; similar to other dev_pm_genpd_* function-descriptions, I
> think it's important to add the below information.
>
> "It is assumed that the users guarantee that the genpd wouldn't be
> detached while this routine is getting called."
>
> Can you please add that?
Thanks. Fixed in revision 4.

-Akhil.
>
>> + */
>> +void dev_pm_genpd_synced_poweroff(struct device *dev)
>> +{
>> +       struct generic_pm_domain *genpd;
>> +
>> +       genpd = dev_to_genpd_safe(dev);
>> +       if (!genpd)
>> +               return;
>> +
>> +       genpd_lock(genpd);
>> +       genpd->synced_poweroff = true;
>> +       genpd_unlock(genpd);
>> +}
>> +EXPORT_SYMBOL_GPL(dev_pm_genpd_synced_poweroff);
>> +
>>  static int _genpd_power_on(struct generic_pm_domain *genpd, bool timed)
>>  {
>>         unsigned int state_idx = genpd->state_idx;
>> @@ -562,6 +584,7 @@ static int _genpd_power_on(struct generic_pm_domain *genpd, bool timed)
>>
>>  out:
>>         raw_notifier_call_chain(&genpd->power_notifiers, GENPD_NOTIFY_ON, NULL);
>> +       genpd->synced_poweroff = false;
>>         return 0;
>>  err:
>>         raw_notifier_call_chain(&genpd->power_notifiers, GENPD_NOTIFY_OFF,
>> diff --git a/include/linux/pm_domain.h b/include/linux/pm_domain.h
>> index 1cd41bdf73cf..f776fb93eaa0 100644
>> --- a/include/linux/pm_domain.h
>> +++ b/include/linux/pm_domain.h
>> @@ -136,6 +136,7 @@ struct generic_pm_domain {
>>         unsigned int prepared_count;    /* Suspend counter of prepared devices */
>>         unsigned int performance_state; /* Aggregated max performance state */
>>         cpumask_var_t cpus;             /* A cpumask of the attached CPUs */
>> +       bool synced_poweroff;           /* A consumer needs a synced poweroff */
>>         int (*power_off)(struct generic_pm_domain *domain);
>>         int (*power_on)(struct generic_pm_domain *domain);
>>         struct raw_notifier_head power_notifiers; /* Power on/off notifiers */
>> @@ -235,6 +236,7 @@ int dev_pm_genpd_add_notifier(struct device *dev, struct notifier_block *nb);
>>  int dev_pm_genpd_remove_notifier(struct device *dev);
>>  void dev_pm_genpd_set_next_wakeup(struct device *dev, ktime_t next);
>>  ktime_t dev_pm_genpd_get_next_hrtimer(struct device *dev);
>> +void dev_pm_genpd_synced_poweroff(struct device *dev);
>>
>>  extern struct dev_power_governor simple_qos_governor;
>>  extern struct dev_power_governor pm_domain_always_on_gov;
>> @@ -300,6 +302,9 @@ static inline ktime_t dev_pm_genpd_get_next_hrtimer(struct device *dev)
>>  {
>>         return KTIME_MAX;
>>  }
>> +static inline void dev_pm_genpd_synced_poweroff(struct device *dev)
>> +{ }
>> +
>>  #define simple_qos_governor            (*(struct dev_power_governor *)(NULL))
>>  #define pm_domain_always_on_gov                (*(struct dev_power_governor *)(NULL))
>>  #endif
>> --
>> 2.7.4
>>
> Kind regards
> Uffe

