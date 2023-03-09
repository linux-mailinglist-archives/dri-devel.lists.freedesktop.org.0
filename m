Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CF39E6B1CFF
	for <lists+dri-devel@lfdr.de>; Thu,  9 Mar 2023 08:54:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 420A810E79E;
	Thu,  9 Mar 2023 07:54:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 576EE10E79E
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Mar 2023 07:54:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1678348446; x=1709884446;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=kfBBH9S/jBmS2pos8qoUcFdaqbPQy+BVbUPg/4bsR0Y=;
 b=PVESUZ48D18VzlMWr5uBvXbw7qe7zvYsUgCHfTvykQBlcT1E1M6b3u7W
 oD3KaDUxhohsvyngerEfDDZybAoBfX56ZtsNqjx87DHPSrd+db5locyNV
 WQKHej9eQ753wu3J07YwB7XgSUZPaBSiFyZR9ky4U2MQjjjLhRoJidFUU
 4iMeNM0U4OoK3hG2KriihJCCEpSlfHB9szEEB134tJbikwSyzMkoT6OwD
 p12+9aeu9XPTgp3xyRtc7852sS6uw9gVmq+VVJkf9Ai5RmiODQoqBNbeu
 Nn0LnmIgiJqvxX7ROLaAYYEqQE6nupRcN4a3+0HiG5Z5ZgB3a5ErG14cD Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10643"; a="324701593"
X-IronPort-AV: E=Sophos;i="5.98,245,1673942400"; d="scan'208";a="324701593"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Mar 2023 23:54:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10643"; a="1006635679"
X-IronPort-AV: E=Sophos;i="5.98,245,1673942400"; d="scan'208";a="1006635679"
Received: from unknown (HELO localhost) ([10.237.66.145])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Mar 2023 23:54:03 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Helge Deller <deller@gmx.de>, harperchen <harperchen1110@gmail.com>
Subject: Re: [PATCH] fbdev: tgafb: Fix potential divide by zero
In-Reply-To: <123a52d8-baf0-e32b-3262-1e8619b1c3ad@gmx.de>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20230307130856.2295182-1-harperchen1110@gmail.com>
 <123a52d8-baf0-e32b-3262-1e8619b1c3ad@gmx.de>
Date: Thu, 09 Mar 2023 09:53:56 +0200
Message-ID: <87cz5ibbsb.fsf@intel.com>
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
Cc: linux-fbdev@vger.kernel.org, javierm@redhat.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 wsa+renesas@sang-engineering.com, tzimmermann@suse.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 08 Mar 2023, Helge Deller <deller@gmx.de> wrote:
> On 3/7/23 14:08, harperchen wrote:
>> fb_set_var would by called when user invokes ioctl with cmd
>> FBIOPUT_VSCREENINFO. User-provided data would finally reach
>> tgafb_check_var. In case var->pixclock is assigned to zero,
>> divide by zero would occur when checking whether reciprocal
>> of var->pixclock is too high.
>>
>> Similar crashes have happened in other fbdev drivers. There
>> is no check and modification on var->pixclock along the call
>> chain to tgafb_check_var. We believe it could also be triggered
>> in driver tgafb from user site.
>>
>> Signed-off-by: harperchen <harperchen1110@gmail.com>
>
> Could you provide a real name?
> Otherwise applied to fbdev git tree.

See commit d4563201f33a ("Documentation: simplify and clarify DCO
contribution example language").

BR,
Jani.


>
> Thanks!
> Helge
>
>> ---
>>   drivers/video/fbdev/tgafb.c | 3 +++
>>   1 file changed, 3 insertions(+)
>>
>> diff --git a/drivers/video/fbdev/tgafb.c b/drivers/video/fbdev/tgafb.c
>> index 14d37c49633c..b44004880f0d 100644
>> --- a/drivers/video/fbdev/tgafb.c
>> +++ b/drivers/video/fbdev/tgafb.c
>> @@ -173,6 +173,9 @@ tgafb_check_var(struct fb_var_screeninfo *var, struct fb_info *info)
>>   {
>>   	struct tga_par *par = (struct tga_par *)info->par;
>>
>> +	if (!var->pixclock)
>> +		return -EINVAL;
>> +
>>   	if (par->tga_type == TGA_TYPE_8PLANE) {
>>   		if (var->bits_per_pixel != 8)
>>   			return -EINVAL;
>

-- 
Jani Nikula, Intel Open Source Graphics Center
