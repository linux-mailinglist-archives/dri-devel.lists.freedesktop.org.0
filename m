Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AEC3B7D1244
	for <lists+dri-devel@lfdr.de>; Fri, 20 Oct 2023 17:08:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0008710E5C3;
	Fri, 20 Oct 2023 15:08:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B96510E5C3
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Oct 2023 15:08:53 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 39KEvt8r001272; Fri, 20 Oct 2023 15:08:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=S/ldu4kV5QqWZ/zlDCVZZlL7hgsQ1oDd+v7dHQC8c38=;
 b=n/ievmbGh5NbYizs9XLVPGz55aKPsQv+kCiSrshGuUf7k+T6ED/74LhHmUm8k1LnV+oK
 AfKvl4BQHMr3HK5pFnWrKNDHiDSNc5MrvMGj//j+x31szFgXtj/Ie5IvUtf1VGM+UotX
 OPToPNS6xhBxSghTZ3bKRRekhJH3dTCeeH6rwmySCUYHXutQNW5Rgc0tCjCPSpuv7Woz
 dqi2NcJoUYAKsT0eIg9nDHfTLMBfu4eSpt8sgRv1U3c+8+qCotMcWj58kGSbotzcWoiH
 2Kq51CPUTVG2KC/OXQskJjG2eAzA8WTz6QzPhPgcuy7xVc8vcz9vi30SIDvhhXkG7Bzq ag== 
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3tubxha8yd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 20 Oct 2023 15:08:47 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 39KF8kOg003040
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 20 Oct 2023 15:08:46 GMT
Received: from [10.226.59.182] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.39; Fri, 20 Oct
 2023 08:08:45 -0700
Message-ID: <5b196a12-9325-dab9-ec2a-cb81d6883d87@quicinc.com>
Date: Fri, 20 Oct 2023 09:08:45 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH] accel/ivpu: Don't enter d0i3 during FLR
Content-Language: en-US
To: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
References: <20231003064213.1527327-1-stanislaw.gruszka@linux.intel.com>
 <32e14a51-6c0a-efae-1601-07aa6e9537a2@quicinc.com>
 <20231017084307.GA525429@linux.intel.com>
From: Jeffrey Hugo <quic_jhugo@quicinc.com>
In-Reply-To: <20231017084307.GA525429@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: Yjp2BuCygHKKPtDMMMeYhRJWKx95n8vm
X-Proofpoint-ORIG-GUID: Yjp2BuCygHKKPtDMMMeYhRJWKx95n8vm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-20_10,2023-10-19_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 impostorscore=0
 lowpriorityscore=0 mlxscore=0 suspectscore=0 phishscore=0 bulkscore=0
 priorityscore=1501 spamscore=0 malwarescore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2310170001
 definitions=main-2310200125
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
Cc: Oded Gabbay <ogabbay@kernel.org>,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 10/17/2023 2:43 AM, Stanislaw Gruszka wrote:
> On Fri, Oct 06, 2023 at 09:25:29AM -0600, Jeffrey Hugo wrote:
>> On 10/3/2023 12:42 AM, Stanislaw Gruszka wrote:
>>> From: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
>>>
>>> Fix a bug on some platforms where FLR causes complete system
>>> hang when CPU is low power states (C8 or above).
>>
>> Why does FLR cause a complete system hang?
> 
> This HW bug is still under debug and it is not yet root caused.

Ouch.  Good luck with that.

> 
>> Why does avoiding d0i3 fix the
>> issue?  Feels like there could be a lot more detail here.
> 
> We only know that we should avoid entering D0i3.
> 
> I will change the log this way:
> 
> Avoid HW bug on some platforms where we enter D0i3 state
> and CPU is in low power states (C8 or above).
> 
> Regards
> Stanislaw
> 
>>> Fixes: 852be13f3bd3 ("accel/ivpu: Add PM support")
>>> Cc: stable@vger.kernel.org
>>> Signed-off-by: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
>>> Reviewed-by: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
>>> Signed-off-by: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
>>> ---
>>>    drivers/accel/ivpu/ivpu_drv.c     | 11 ++++++++---
>>>    drivers/accel/ivpu/ivpu_drv.h     |  1 +
>>>    drivers/accel/ivpu/ivpu_hw.h      |  8 ++++++++
>>>    drivers/accel/ivpu/ivpu_hw_37xx.c |  1 +
>>>    drivers/accel/ivpu/ivpu_hw_40xx.c |  1 +
>>>    drivers/accel/ivpu/ivpu_pm.c      |  3 ++-
>>>    6 files changed, 21 insertions(+), 4 deletions(-)
>>>
>>> diff --git a/drivers/accel/ivpu/ivpu_drv.c b/drivers/accel/ivpu/ivpu_drv.c
>>> index 3f4efa07ce7c..1eb232e903e8 100644
>>> --- a/drivers/accel/ivpu/ivpu_drv.c
>>> +++ b/drivers/accel/ivpu/ivpu_drv.c
>>> @@ -367,14 +367,19 @@ int ivpu_boot(struct ivpu_device *vdev)
>>>    	return 0;
>>>    }
>>> -int ivpu_shutdown(struct ivpu_device *vdev)
>>> +void ivpu_prepare_for_reset(struct ivpu_device *vdev)
>>>    {
>>> -	int ret;
>>> -
>>>    	ivpu_hw_irq_disable(vdev);
>>>    	disable_irq(vdev->irq);
>>>    	ivpu_ipc_disable(vdev);
>>>    	ivpu_mmu_disable(vdev);
>>> +}
>>> +
>>> +int ivpu_shutdown(struct ivpu_device *vdev)
>>> +{
>>> +	int ret;
>>> +
>>> +	ivpu_prepare_for_reset(vdev);
>>>    	ret = ivpu_hw_power_down(vdev);
>>>    	if (ret)
>>> diff --git a/drivers/accel/ivpu/ivpu_drv.h b/drivers/accel/ivpu/ivpu_drv.h
>>> index 98380c1db9fa..a3b45032e6cf 100644
>>> --- a/drivers/accel/ivpu/ivpu_drv.h
>>> +++ b/drivers/accel/ivpu/ivpu_drv.h
>>> @@ -158,6 +158,7 @@ void ivpu_file_priv_put(struct ivpu_file_priv **link);
>>>    int ivpu_boot(struct ivpu_device *vdev);
>>>    int ivpu_shutdown(struct ivpu_device *vdev);
>>> +void ivpu_prepare_for_reset(struct ivpu_device *vdev);
>>>    static inline u8 ivpu_revision(struct ivpu_device *vdev)
>>>    {
>>> diff --git a/drivers/accel/ivpu/ivpu_hw.h b/drivers/accel/ivpu/ivpu_hw.h
>>> index ab341237bcf9..1079e06255ba 100644
>>> --- a/drivers/accel/ivpu/ivpu_hw.h
>>> +++ b/drivers/accel/ivpu/ivpu_hw.h
>>> @@ -13,6 +13,7 @@ struct ivpu_hw_ops {
>>>    	int (*power_up)(struct ivpu_device *vdev);
>>>    	int (*boot_fw)(struct ivpu_device *vdev);
>>>    	int (*power_down)(struct ivpu_device *vdev);
>>> +	int (*reset)(struct ivpu_device *vdev);
>>>    	bool (*is_idle)(struct ivpu_device *vdev);
>>>    	void (*wdt_disable)(struct ivpu_device *vdev);
>>>    	void (*diagnose_failure)(struct ivpu_device *vdev);
>>> @@ -91,6 +92,13 @@ static inline int ivpu_hw_power_down(struct ivpu_device *vdev)
>>>    	return vdev->hw->ops->power_down(vdev);
>>>    };
>>> +static inline int ivpu_hw_reset(struct ivpu_device *vdev)
>>> +{
>>> +	ivpu_dbg(vdev, PM, "HW reset\n");
>>> +
>>> +	return vdev->hw->ops->reset(vdev);
>>> +};
>>> +
>>>    static inline void ivpu_hw_wdt_disable(struct ivpu_device *vdev)
>>>    {
>>>    	vdev->hw->ops->wdt_disable(vdev);
>>> diff --git a/drivers/accel/ivpu/ivpu_hw_37xx.c b/drivers/accel/ivpu/ivpu_hw_37xx.c
>>> index edd4d860f135..1e842739e937 100644
>>> --- a/drivers/accel/ivpu/ivpu_hw_37xx.c
>>> +++ b/drivers/accel/ivpu/ivpu_hw_37xx.c
>>> @@ -1036,6 +1036,7 @@ const struct ivpu_hw_ops ivpu_hw_37xx_ops = {
>>>    	.power_up = ivpu_hw_37xx_power_up,
>>>    	.is_idle = ivpu_hw_37xx_is_idle,
>>>    	.power_down = ivpu_hw_37xx_power_down,
>>> +	.reset = ivpu_hw_37xx_reset,
>>>    	.boot_fw = ivpu_hw_37xx_boot_fw,
>>>    	.wdt_disable = ivpu_hw_37xx_wdt_disable,
>>>    	.diagnose_failure = ivpu_hw_37xx_diagnose_failure,
>>> diff --git a/drivers/accel/ivpu/ivpu_hw_40xx.c b/drivers/accel/ivpu/ivpu_hw_40xx.c
>>> index a48cd36f9931..d7b8ec0410af 100644
>>> --- a/drivers/accel/ivpu/ivpu_hw_40xx.c
>>> +++ b/drivers/accel/ivpu/ivpu_hw_40xx.c
>>> @@ -1186,6 +1186,7 @@ const struct ivpu_hw_ops ivpu_hw_40xx_ops = {
>>>    	.power_up = ivpu_hw_40xx_power_up,
>>>    	.is_idle = ivpu_hw_40xx_is_idle,
>>>    	.power_down = ivpu_hw_40xx_power_down,
>>> +	.reset = ivpu_hw_40xx_reset,
>>>    	.boot_fw = ivpu_hw_40xx_boot_fw,
>>>    	.wdt_disable = ivpu_hw_40xx_wdt_disable,
>>>    	.diagnose_failure = ivpu_hw_40xx_diagnose_failure,
>>> diff --git a/drivers/accel/ivpu/ivpu_pm.c b/drivers/accel/ivpu/ivpu_pm.c
>>> index 28a0d1111e12..da46f95b008a 100644
>>> --- a/drivers/accel/ivpu/ivpu_pm.c
>>> +++ b/drivers/accel/ivpu/ivpu_pm.c
>>> @@ -261,7 +261,8 @@ void ivpu_pm_reset_prepare_cb(struct pci_dev *pdev)
>>>    	ivpu_dbg(vdev, PM, "Pre-reset..\n");
>>>    	atomic_inc(&vdev->pm->reset_counter);
>>>    	atomic_set(&vdev->pm->in_reset, 1);
>>> -	ivpu_shutdown(vdev);
>>> +	ivpu_prepare_for_reset(vdev);
>>> +	ivpu_hw_reset(vdev);
>>>    	ivpu_pm_prepare_cold_boot(vdev);
>>>    	ivpu_jobs_abort_all(vdev);
>>>    	ivpu_dbg(vdev, PM, "Pre-reset done.\n");
>>

