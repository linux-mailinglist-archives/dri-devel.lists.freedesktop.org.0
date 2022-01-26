Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7708D49D345
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jan 2022 21:14:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE1BA10E267;
	Wed, 26 Jan 2022 20:14:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E7A810E267;
 Wed, 26 Jan 2022 20:14:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1643228077; x=1674764077;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=TOtSusnRGIqqe5tDw4C1foIfeJPzeRXEMemKoxZ1rD4=;
 b=Bqx+38gpoX9/W9upa70v/t6VYhgOMPd6/49SMvtb/MLF9gSKowdAVH/2
 96fhew9CFUI2bJPnkEJz21J1xVg+J5YABxXgaPFzvubIH41rBTrO0A1Oa
 uD2PzkI9xiotsjvGpd3/GUYel62/6xF1WncItA0Vc4NUNUAGXNMyxuwKK
 r+cyviTeTpO56VVDLRZcxesewGAaewwki1JC7oBymJs2QWi+qHunEiMsE
 a/vHaetHP4/O635x1zBM/n2fHiTwK+uRtaLqKjRf3WZsTc9IuZFBH1FSG
 7L4vzmbCmcxKGuXfRfr7O4NbVYcYJKhZU1r45ypmbBoTgEFCk/jQgEG0Q w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10239"; a="246419470"
X-IronPort-AV: E=Sophos;i="5.88,319,1635231600"; d="scan'208";a="246419470"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jan 2022 12:14:36 -0800
X-IronPort-AV: E=Sophos;i="5.88,319,1635231600"; d="scan'208";a="480008677"
Received: from richardt-mobl1.amr.corp.intel.com (HELO ldmartin-desk2)
 ([10.212.143.219])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jan 2022 12:14:36 -0800
Date: Wed, 26 Jan 2022 12:14:35 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Jani Nikula <jani.nikula@linux.intel.com>
Subject: Re: [Intel-gfx] [PATCH 1/3] drm: Stop spamming log with drm_cache
 message
Message-ID: <20220126201435.3qav6uuiiwlo4fik@ldmartin-desk2>
X-Patchwork-Hint: comment
References: <20220126004345.1137674-1-lucas.demarchi@intel.com>
 <20220126004345.1137674-2-lucas.demarchi@intel.com>
 <87ee4uxsll.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <87ee4uxsll.fsf@intel.com>
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
Cc: David Airlie <airlied@linux.ie>, Thomas Zimmermann <tzimmermann@suse.de>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jan 26, 2022 at 08:24:54PM +0200, Jani Nikula wrote:
>On Tue, 25 Jan 2022, Lucas De Marchi <lucas.demarchi@intel.com> wrote:
>> Only x86 and in some cases PPC have support added in drm_cache.c for the
>> clflush class of functions. However warning once is sufficient to taint
>> the log instead of spamming it with "Architecture has no drm_cache.c
>> support" every few millisecond.
>>
>> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
>> Cc: Maxime Ripard <mripard@kernel.org>
>> Cc: Thomas Zimmermann <tzimmermann@suse.de>
>> Cc: David Airlie <airlied@linux.ie>
>> Cc: Daniel Vetter <daniel@ffwll.ch>
>> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>> ---
>>  drivers/gpu/drm/drm_cache.c | 3 ---
>>  1 file changed, 3 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/drm_cache.c b/drivers/gpu/drm/drm_cache.c
>> index f19d9acbe959..2d5a4c463a4f 100644
>> --- a/drivers/gpu/drm/drm_cache.c
>> +++ b/drivers/gpu/drm/drm_cache.c
>> @@ -112,7 +112,6 @@ drm_clflush_pages(struct page *pages[], unsigned long num_pages)
>>  		kunmap_atomic(page_virtual);
>>  	}
>>  #else
>> -	pr_err("Architecture has no drm_cache.c support\n");
>>  	WARN_ON_ONCE(1);
>
>An alternative would be to replace the two lines with:
>
>	WARN_ONCE(1, "Architecture has no drm_cache.c support\n");
>
>But I'm not insisting.

I actually like that suggestion. I will change that in the next version.

Thanks
Lucas De Marchi
