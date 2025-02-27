Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 15E9AA47C5D
	for <lists+dri-devel@lfdr.de>; Thu, 27 Feb 2025 12:39:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9019F10EAC0;
	Thu, 27 Feb 2025 11:38:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.nfschina.com (unknown [42.101.60.213])
 by gabe.freedesktop.org (Postfix) with SMTP id 635BA10EAA6;
 Thu, 27 Feb 2025 11:38:55 +0000 (UTC)
Received: from [172.30.20.101] (unknown [180.167.10.98])
 by mail.nfschina.com (MailData Gateway V2.8.8) with ESMTPSA id 2B7B8609B18F0; 
 Thu, 27 Feb 2025 19:38:49 +0800 (CST)
Message-ID: <28f9ca0e-136f-2cd6-0dba-4e3b7d172759@nfschina.com>
Date: Thu, 27 Feb 2025 19:38:48 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.1
Subject: Re: [PATCH] drm/xe: Select INTEL_VSEC to fix build dependency
Content-Language: en-US
To: Jani Nikula <jani.nikula@linux.intel.com>, lucas.demarchi@intel.com,
 thomas.hellstrom@linux.intel.com, rodrigo.vivi@intel.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch
Cc: ilpo.jarvinen@linux.intel.com, andriy.shevchenko@linux.intel.com,
 michael.j.ruhl@intel.com, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 kernel-janitors@vger.kernel.org
X-MD-Sfrom: suhui@nfschina.com
X-MD-SrcIP: 180.167.10.98
From: Su Hui <suhui@nfschina.com>
In-Reply-To: <87senz3br3.fsf@intel.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2025/2/27 18:47, Jani Nikula wrote:
> On Thu, 27 Feb 2025, Su Hui <suhui@nfschina.com> wrote:
>> When build randconfig, there is an error:
>> ld: drivers/gpu/drm/xe/xe_vsec.o: in function `xe_vsec_init':
>> xe_vsec.c:(.text+0x182): undefined reference to `intel_vsec_register'
>>
>> When CONFIG_DRM_XE=y and CONFIG_INTEL_VSEC=m is set, ld couldn't find
>> 'intel_vsec_register'. Select INTEL_VSEC to fix this error.
> Documentation/kbuild/kconfig-language.rst:
>
>    Note:
> 	select should be used with care. select will force
> 	a symbol to a value without visiting the dependencies.
> 	By abusing select you are able to select a symbol FOO even
> 	if FOO depends on BAR that is not set.
> 	In general use select only for non-visible symbols
> 	(no prompts anywhere) and for symbols with no dependencies.
> 	That will limit the usefulness but on the other hand avoid
> 	the illegal configurations all over.
>
> This should likely be either
>
> 	depends on INTEL_VSEC || INTEL_VSEC=n
>
> or
>
> 	depends on INTEL_VSEC

Hi, Jani:

I tried to use 'depends on' at first. But there is a recursive dependency:

     error: recursive dependency detected!
         symbol DRM_XE depends on INTEL_VSEC
         symbol INTEL_VSEC depends on X86_PLATFORM_DEVICES
         symbol X86_PLATFORM_DEVICES is selected by DRM_XE
         For a resolution refer to 
Documentation/kbuild/kconfig-language.rst
     subsection "Kconfig recursive dependency limitations".


I will try it again with 'depends on', need some time to check this 
recursive
dependency problem.

Su Hui

>
>
>
>> Fixes: 0c45e76fcc62 ("drm/xe/vsec: Support BMG devices")
>> Signed-off-by: Su Hui <suhui@nfschina.com>
>> ---
>>   drivers/gpu/drm/xe/Kconfig | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/drivers/gpu/drm/xe/Kconfig b/drivers/gpu/drm/xe/Kconfig
>> index b51a2bde73e2..7a60d96d2dd6 100644
>> --- a/drivers/gpu/drm/xe/Kconfig
>> +++ b/drivers/gpu/drm/xe/Kconfig
>> @@ -44,6 +44,7 @@ config DRM_XE
>>   	select WANT_DEV_COREDUMP
>>   	select AUXILIARY_BUS
>>   	select HMM_MIRROR
>> +	select INTEL_VSEC
>>   	help
>>   	  Experimental driver for Intel Xe series GPUs
