Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2500B395905
	for <lists+dri-devel@lfdr.de>; Mon, 31 May 2021 12:36:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C38106E508;
	Mon, 31 May 2021 10:36:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE5596E0ED;
 Mon, 31 May 2021 10:36:17 +0000 (UTC)
IronPort-SDR: ClF+75aU29sOccABLZkcrM2YnMvobmFXBUIfEowxosOn7SSelFetSPQm/+isYfZ1wddY5LvlYO
 f7X1w+sGFX3g==
X-IronPort-AV: E=McAfee;i="6200,9189,10000"; a="201463579"
X-IronPort-AV: E=Sophos;i="5.83,236,1616482800"; d="scan'208";a="201463579"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 May 2021 03:36:15 -0700
IronPort-SDR: HtVCOtOiT+hoRPoQF93NTuFq5tj2wMUpN+om1cuqCAjxvjgzyh/V9aoQDSIXheVSYSJEz7VgFm
 6QFytasDk19Q==
X-IronPort-AV: E=Sophos;i="5.83,236,1616482800"; d="scan'208";a="478865479"
Received: from masayag-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.52.77])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 May 2021 03:36:12 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: "Leizhen \(ThunderTown\)" <thunder.leizhen@huawei.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 linux-kernel <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1/1] drm/i915/hdcp: Simplify code in
 intel_hdcp_auth_downstream()
In-Reply-To: <86f64463-87df-9e62-a5ea-f411fcb54c19@huawei.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20210527090421.9172-1-thunder.leizhen@huawei.com>
 <87sg28a3xg.fsf@intel.com> <86f64463-87df-9e62-a5ea-f411fcb54c19@huawei.com>
Date: Mon, 31 May 2021 13:36:08 +0300
Message-ID: <87wnrfqjfr.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
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

On Fri, 28 May 2021, "Leizhen (ThunderTown)" <thunder.leizhen@huawei.com> wrote:
> On 2021/5/27 18:04, Jani Nikula wrote:
>> On Thu, 27 May 2021, Zhen Lei <thunder.leizhen@huawei.com> wrote:
>>> If intel_hdcp_validate_v_prime() has been successful within the allowed
>>> number of tries, we can directly call drm_dbg_kms() and "goto out" without
>>> jumping out of the loop and repeatedly judging whether the operation is
>>> successful. This can help us reduce an unnecessary if judgment. And it's
>>> a little clearer to read.
>> 
>> Generally I think the "happy day scenario" should be at the topmost
>> indentation level and not buried in the ifs with a goto exit.
>
> for (xxx) {
>    if (a == b)
>        return found;
> }
>
> At least this way of writing is common.

Yes, if the loop is abstracted to a separate function.

BR,
Jani.

>
>
>> 
>> BR,
>> Jani.
>> 
>>>
>>> No functional change.
>>>
>>> Signed-off-by: Zhen Lei <thunder.leizhen@huawei.com>
>>> ---
>>>  drivers/gpu/drm/i915/display/intel_hdcp.c | 24 ++++++++++-------------
>>>  1 file changed, 10 insertions(+), 14 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/i915/display/intel_hdcp.c b/drivers/gpu/drm/i915/display/intel_hdcp.c
>>> index d8570e14fe60..c32a854eda66 100644
>>> --- a/drivers/gpu/drm/i915/display/intel_hdcp.c
>>> +++ b/drivers/gpu/drm/i915/display/intel_hdcp.c
>>> @@ -663,13 +663,13 @@ int intel_hdcp_auth_downstream(struct intel_connector *connector)
>>>  
>>>  	ret = shim->read_ksv_fifo(dig_port, num_downstream, ksv_fifo);
>>>  	if (ret)
>>> -		goto err;
>>> +		goto out;
>>>  
>>>  	if (drm_hdcp_check_ksvs_revoked(&dev_priv->drm, ksv_fifo,
>>>  					num_downstream) > 0) {
>>>  		drm_err(&dev_priv->drm, "Revoked Ksv(s) in ksv_fifo\n");
>>>  		ret = -EPERM;
>>> -		goto err;
>>> +		goto out;
>>>  	}
>>>  
>>>  	/*
>>> @@ -680,20 +680,16 @@ int intel_hdcp_auth_downstream(struct intel_connector *connector)
>>>  		ret = intel_hdcp_validate_v_prime(connector, shim,
>>>  						  ksv_fifo, num_downstream,
>>>  						  bstatus);
>>> -		if (!ret)
>>> -			break;
>>> -	}
>>> -
>>> -	if (i == tries) {
>>> -		drm_dbg_kms(&dev_priv->drm,
>>> -			    "V Prime validation failed.(%d)\n", ret);
>>> -		goto err;
>>> +		if (!ret) {
>>> +			drm_dbg_kms(&dev_priv->drm,
>>> +				    "HDCP is enabled (%d downstream devices)\n",
>>> +				    num_downstream);
>>> +			goto out;
>>> +		}
>>>  	}
>>>  
>>> -	drm_dbg_kms(&dev_priv->drm, "HDCP is enabled (%d downstream devices)\n",
>>> -		    num_downstream);
>>> -	ret = 0;
>>> -err:
>>> +	drm_dbg_kms(&dev_priv->drm, "V Prime validation failed.(%d)\n", ret);
>>> +out:
>>>  	kfree(ksv_fifo);
>>>  	return ret;
>>>  }
>> 
>

-- 
Jani Nikula, Intel Open Source Graphics Center
