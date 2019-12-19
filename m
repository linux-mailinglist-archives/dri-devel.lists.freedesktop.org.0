Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EBF3612648D
	for <lists+dri-devel@lfdr.de>; Thu, 19 Dec 2019 15:23:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D6DFF89DB7;
	Thu, 19 Dec 2019 14:23:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A5E9889DB7;
 Thu, 19 Dec 2019 14:23:53 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 19 Dec 2019 06:23:53 -0800
X-IronPort-AV: E=Sophos;i="5.69,332,1571727600"; d="scan'208";a="210472851"
Received: from jnikula-mobl3.fi.intel.com (HELO localhost) ([10.237.66.161])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 19 Dec 2019 06:23:51 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH 4/8] drm/gem-fb-helper: convert to drm device based logging
In-Reply-To: <20191217185712.GC30809@ravnborg.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20191210123050.8799-1-jani.nikula@intel.com>
 <20191210123050.8799-4-jani.nikula@intel.com>
 <20191217185712.GC30809@ravnborg.org>
Date: Thu, 19 Dec 2019 16:23:49 +0200
Message-ID: <87woaswg0a.fsf@intel.com>
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
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 17 Dec 2019, Sam Ravnborg <sam@ravnborg.org> wrote:
> On Tue, Dec 10, 2019 at 02:30:46PM +0200, Jani Nikula wrote:
>> Prefer drm_dbg_kms() and drm_err() over all other logging.
>> 
>> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
> Reviewed-by: Sam Ravnborg <sam@ravnborg.org>

Thanks for the review, pushed up to this patch.

BR,
Jani.

>
>> ---
>>  drivers/gpu/drm/drm_gem_framebuffer_helper.c | 5 ++---
>>  1 file changed, 2 insertions(+), 3 deletions(-)
>> 
>> diff --git a/drivers/gpu/drm/drm_gem_framebuffer_helper.c b/drivers/gpu/drm/drm_gem_framebuffer_helper.c
>> index b9bcd310ca2d..3a7ace19a902 100644
>> --- a/drivers/gpu/drm/drm_gem_framebuffer_helper.c
>> +++ b/drivers/gpu/drm/drm_gem_framebuffer_helper.c
>> @@ -74,8 +74,7 @@ drm_gem_fb_alloc(struct drm_device *dev,
>>  
>>  	ret = drm_framebuffer_init(dev, fb, funcs);
>>  	if (ret) {
>> -		DRM_DEV_ERROR(dev->dev, "Failed to init framebuffer: %d\n",
>> -			      ret);
>> +		drm_err(dev, "Failed to init framebuffer: %d\n", ret);
>>  		kfree(fb);
>>  		return ERR_PTR(ret);
>>  	}
>> @@ -160,7 +159,7 @@ drm_gem_fb_create_with_funcs(struct drm_device *dev, struct drm_file *file,
>>  
>>  		objs[i] = drm_gem_object_lookup(file, mode_cmd->handles[i]);
>>  		if (!objs[i]) {
>> -			DRM_DEBUG_KMS("Failed to lookup GEM object\n");
>> +			drm_dbg_kms(dev, "Failed to lookup GEM object\n");
>>  			ret = -ENOENT;
>>  			goto err_gem_object_put;
>>  		}
>> -- 
>> 2.20.1
>> 
>> _______________________________________________
>> dri-devel mailing list
>> dri-devel@lists.freedesktop.org
>> https://lists.freedesktop.org/mailman/listinfo/dri-devel
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel

-- 
Jani Nikula, Intel Open Source Graphics Center
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
