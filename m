Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E6FD139401A
	for <lists+dri-devel@lfdr.de>; Fri, 28 May 2021 11:36:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03C946E29D;
	Fri, 28 May 2021 09:36:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from szxga08-in.huawei.com (szxga08-in.huawei.com [45.249.212.255])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D48306E29D;
 Fri, 28 May 2021 09:36:47 +0000 (UTC)
Received: from dggeml711-chm.china.huawei.com (unknown [172.30.72.54])
 by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4Frzwm4fBvz1BFYK;
 Fri, 28 May 2021 17:32:08 +0800 (CST)
Received: from dggpemm500006.china.huawei.com (7.185.36.236) by
 dggeml711-chm.china.huawei.com (10.3.17.122) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2176.2; Fri, 28 May 2021 17:36:44 +0800
Received: from [127.0.0.1] (10.174.177.72) by dggpemm500006.china.huawei.com
 (7.185.36.236) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.2; Fri, 28 May
 2021 17:36:44 +0800
Subject: Re: [PATCH 1/1] drm/i915/hdcp: Simplify code in
 intel_hdcp_auth_downstream()
To: Jani Nikula <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, intel-gfx
 <intel-gfx@lists.freedesktop.org>, dri-devel
 <dri-devel@lists.freedesktop.org>, linux-kernel
 <linux-kernel@vger.kernel.org>
References: <20210527090421.9172-1-thunder.leizhen@huawei.com>
 <87sg28a3xg.fsf@intel.com>
From: "Leizhen (ThunderTown)" <thunder.leizhen@huawei.com>
Message-ID: <86f64463-87df-9e62-a5ea-f411fcb54c19@huawei.com>
Date: Fri, 28 May 2021 17:36:43 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <87sg28a3xg.fsf@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.174.177.72]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 dggpemm500006.china.huawei.com (7.185.36.236)
X-CFilter-Loop: Reflected
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 2021/5/27 18:04, Jani Nikula wrote:
> On Thu, 27 May 2021, Zhen Lei <thunder.leizhen@huawei.com> wrote:
>> If intel_hdcp_validate_v_prime() has been successful within the allowed
>> number of tries, we can directly call drm_dbg_kms() and "goto out" without
>> jumping out of the loop and repeatedly judging whether the operation is
>> successful. This can help us reduce an unnecessary if judgment. And it's
>> a little clearer to read.
> 
> Generally I think the "happy day scenario" should be at the topmost
> indentation level and not buried in the ifs with a goto exit.

for (xxx) {
   if (a == b)
       return found;
}

At least this way of writing is common.


> 
> BR,
> Jani.
> 
>>
>> No functional change.
>>
>> Signed-off-by: Zhen Lei <thunder.leizhen@huawei.com>
>> ---
>>  drivers/gpu/drm/i915/display/intel_hdcp.c | 24 ++++++++++-------------
>>  1 file changed, 10 insertions(+), 14 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/i915/display/intel_hdcp.c b/drivers/gpu/drm/i915/display/intel_hdcp.c
>> index d8570e14fe60..c32a854eda66 100644
>> --- a/drivers/gpu/drm/i915/display/intel_hdcp.c
>> +++ b/drivers/gpu/drm/i915/display/intel_hdcp.c
>> @@ -663,13 +663,13 @@ int intel_hdcp_auth_downstream(struct intel_connector *connector)
>>  
>>  	ret = shim->read_ksv_fifo(dig_port, num_downstream, ksv_fifo);
>>  	if (ret)
>> -		goto err;
>> +		goto out;
>>  
>>  	if (drm_hdcp_check_ksvs_revoked(&dev_priv->drm, ksv_fifo,
>>  					num_downstream) > 0) {
>>  		drm_err(&dev_priv->drm, "Revoked Ksv(s) in ksv_fifo\n");
>>  		ret = -EPERM;
>> -		goto err;
>> +		goto out;
>>  	}
>>  
>>  	/*
>> @@ -680,20 +680,16 @@ int intel_hdcp_auth_downstream(struct intel_connector *connector)
>>  		ret = intel_hdcp_validate_v_prime(connector, shim,
>>  						  ksv_fifo, num_downstream,
>>  						  bstatus);
>> -		if (!ret)
>> -			break;
>> -	}
>> -
>> -	if (i == tries) {
>> -		drm_dbg_kms(&dev_priv->drm,
>> -			    "V Prime validation failed.(%d)\n", ret);
>> -		goto err;
>> +		if (!ret) {
>> +			drm_dbg_kms(&dev_priv->drm,
>> +				    "HDCP is enabled (%d downstream devices)\n",
>> +				    num_downstream);
>> +			goto out;
>> +		}
>>  	}
>>  
>> -	drm_dbg_kms(&dev_priv->drm, "HDCP is enabled (%d downstream devices)\n",
>> -		    num_downstream);
>> -	ret = 0;
>> -err:
>> +	drm_dbg_kms(&dev_priv->drm, "V Prime validation failed.(%d)\n", ret);
>> +out:
>>  	kfree(ksv_fifo);
>>  	return ret;
>>  }
> 

