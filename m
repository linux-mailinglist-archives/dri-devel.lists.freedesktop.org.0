Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 65EA9667477
	for <lists+dri-devel@lfdr.de>; Thu, 12 Jan 2023 15:08:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9253610E8FB;
	Thu, 12 Jan 2023 14:08:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 55D6310E8FB;
 Thu, 12 Jan 2023 14:08:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=/D6SdhmLjn+WtMlBibpCqXPn/3+YjWpn0Sb57xAZI5E=; b=WN/i7uCYXlk0R0iuFEPtyY5xQZ
 xHJRnf7YD6HrOGeNyX6uY1LVUeffMcUES0Ox8+XR/zam0guSWq5GsY7WZ2tO5pA/kmwcXL7lvONF5
 C20Qye8N4kdBpbtC9bz6Jxoid8GpnRyCWJ+SuzKniDwyIh1fPQbLNnt6HlgtGreYkDwjq7f7MxT1X
 fHPlDhcu4rIVMhnBqaG3atcFAfoQ/qzXFZalwQZOlCarGViz1iRgyGJK+bnuPyW4FZ8+IeLzE/wyn
 WPaGSlpRHbDZJrfvu+3mOaUheY+qmvmxCFQo+xBxiljbo5blG46Qg1EBAc1LmTItGQiNkBUWuuoVH
 r6xbeEeA==;
Received: from [187.36.234.139] (helo=[192.168.1.195])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1pFyFT-006M8V-NT; Thu, 12 Jan 2023 15:08:08 +0100
Message-ID: <345279ff-680a-52ac-73ed-29e2ab84f0ae@igalia.com>
Date: Thu, 12 Jan 2023 11:07:59 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH 3/5] drm/i915: Remove redundant framebuffer format check
Content-Language: en-US
To: =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
References: <20230109105807.18172-1-mcanal@igalia.com>
 <20230109105807.18172-4-mcanal@igalia.com> <Y8AAdW2y7zN7DCUZ@intel.com>
From: =?UTF-8?Q?Ma=c3=adra_Canal?= <mcanal@igalia.com>
In-Reply-To: <Y8AAdW2y7zN7DCUZ@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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
Cc: dri-devel@lists.freedesktop.org,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 =?UTF-8?Q?Andr=c3=a9_Almeida?= <andrealmeid@igalia.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, intel-gfx@lists.freedesktop.org,
 Melissa Wen <mwen@igalia.com>,
 VMware Graphics Reviewers <linux-graphics-maintainer@vmware.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On 1/12/23 09:43, Ville Syrjälä wrote:
> On Mon, Jan 09, 2023 at 07:58:06AM -0300, Maíra Canal wrote:
>> Now that framebuffer_check() verifies that the format is properly
>> supported, there is no need to check it again on i915's inside
>> helpers.
>>
>> Therefore, remove the redundant framebuffer format check from the
>> intel_framebuffer_init() function, letting framebuffer_check()
>> perform the framebuffer validation.
>>
>> Signed-off-by: Maíra Canal <mcanal@igalia.com>
>> ---
>>   drivers/gpu/drm/i915/display/intel_fb.c | 9 ---------
>>   1 file changed, 9 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/i915/display/intel_fb.c b/drivers/gpu/drm/i915/display/intel_fb.c
>> index 63137ae5ab21..230b729e42d6 100644
>> --- a/drivers/gpu/drm/i915/display/intel_fb.c
>> +++ b/drivers/gpu/drm/i915/display/intel_fb.c
>> @@ -1914,15 +1914,6 @@ int intel_framebuffer_init(struct intel_framebuffer *intel_fb,
>>   		}
>>   	}
>>   
>> -	if (!drm_any_plane_has_format(&dev_priv->drm,
>> -				      mode_cmd->pixel_format,
>> -				      mode_cmd->modifier[0])) {
>> -		drm_dbg_kms(&dev_priv->drm,
>> -			    "unsupported pixel format %p4cc / modifier 0x%llx\n",
>> -			    &mode_cmd->pixel_format, mode_cmd->modifier[0]);
>> -		goto err;
>> -	}
>> -
> 
> This doesn't work for the legacy tiling->modifier path.

Do you have any idea on how we could remove drm_any_plane_has_format() from
i915? Or is it strictly necessary to validate the modifier in the legacy
path?

Best Regards,
- Maíra Canal

> 
>>   	/*
>>   	 * gen2/3 display engine uses the fence if present,
>>   	 * so the tiling mode must match the fb modifier exactly.
>> -- 
>> 2.39.0
> 
