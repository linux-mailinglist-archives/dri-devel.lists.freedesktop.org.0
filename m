Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F5F211DE6F
	for <lists+dri-devel@lfdr.de>; Fri, 13 Dec 2019 08:11:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA8C46E27F;
	Fri, 13 Dec 2019 07:11:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0031E6E27F;
 Fri, 13 Dec 2019 07:11:01 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 12 Dec 2019 23:11:01 -0800
X-IronPort-AV: E=Sophos;i="5.69,308,1571727600"; d="scan'208";a="204240351"
Received: from peterhae-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.49.100])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 12 Dec 2019 23:10:56 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>,
 Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: [PATCH] drm/i915/bios: fix off by one in parse_generic_dtd()
In-Reply-To: <20191212172707.GF85422@mdroper-desk1.amr.corp.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20191212091130.zf2g53njf5u24wk6@kili.mountain>
 <20191212172707.GF85422@mdroper-desk1.amr.corp.intel.com>
Date: Fri, 13 Dec 2019 09:10:58 +0200
Message-ID: <87r2181z0d.fsf@intel.com>
MIME-Version: 1.0
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
Cc: David Airlie <airlied@linux.ie>, kernel-janitors@vger.kernel.org,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 =?utf-8?Q?Jos=C3=A9?= Roberto de Souza <jose.souza@intel.com>,
 dri-devel@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 intel-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 12 Dec 2019, Matt Roper <matthew.d.roper@intel.com> wrote:
> On Thu, Dec 12, 2019 at 12:11:30PM +0300, Dan Carpenter wrote:
>> The "num_dtd" variable is the number of elements in the
>> generic_dtd->dtd[] array so the > needs to be >= to prevent reading one
>> element beyond the end of the array.
>> 
>> Fixes: 33ef6d4fd8df ("drm/i915/vbt: Handle generic DTD block")
>> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
>
> Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

Pushed to drm-intel-next-queued, thanks for the patch and review.

BR,
Jani.

>
>> ---
>>  drivers/gpu/drm/i915/display/intel_bios.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>> 
>> diff --git a/drivers/gpu/drm/i915/display/intel_bios.c b/drivers/gpu/drm/i915/display/intel_bios.c
>> index 1aeecdd02293..d1e27ee86e53 100644
>> --- a/drivers/gpu/drm/i915/display/intel_bios.c
>> +++ b/drivers/gpu/drm/i915/display/intel_bios.c
>> @@ -338,7 +338,7 @@ parse_generic_dtd(struct drm_i915_private *dev_priv,
>>  
>>  	num_dtd = (get_blocksize(generic_dtd) -
>>  		   sizeof(struct bdb_generic_dtd)) / generic_dtd->gdtd_size;
>> -	if (dev_priv->vbt.panel_type > num_dtd) {
>> +	if (dev_priv->vbt.panel_type >= num_dtd) {
>>  		DRM_ERROR("Panel type %d not found in table of %d DTD's\n",
>>  			  dev_priv->vbt.panel_type, num_dtd);
>>  		return;
>> -- 
>> 2.11.0
>> 

-- 
Jani Nikula, Intel Open Source Graphics Center
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
