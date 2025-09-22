Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0206BB91342
	for <lists+dri-devel@lfdr.de>; Mon, 22 Sep 2025 14:49:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5CFC510E1B8;
	Mon, 22 Sep 2025 12:49:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hc3DlgTh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A3ADB10E1B8
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Sep 2025 12:49:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758545379; x=1790081379;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=O1eTW5Qzd6XZpHsKY7bhrGJpfVij3jG58O8kCrWcTtI=;
 b=hc3DlgTh6mGfZTyqb7pLg4Q1miCXydADc7kPAg/7Yn5ysGRq3JipxcPO
 ugLrJ9X3iWOlpJEkejrIVWWI8w0t1NPGRKyNf84Oft2q/nkCisPCT8v4o
 03vi4VaLYizah/jtjgoPSPUeJ0NlaC2ym7iMzOIzsJG7xP6sQZxAGI6PI
 R21HICh5LgKwkozG0l5NJBFrpc2IWPf9SvUFH7YBa+YfUE8e0yyl/oH9R
 VnzP/eGbICfMcYPrH6yu/CurIeFNVTNVB0iGZBM/oX5JUi4g0DkyuxqPI
 RxKaJxZ4YR/NA/H2nBEAoxmr4YHQI5ZlHlH128KWn/u9LG8GcySiXN4xd g==;
X-CSE-ConnectionGUID: iDCWSwaCTk2DYD3alYMcOQ==
X-CSE-MsgGUID: inRpdAFiS/iAGNzrzlE0NQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="60744769"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="60744769"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2025 05:49:39 -0700
X-CSE-ConnectionGUID: pA6+ToROTWSwoobEsrSSNQ==
X-CSE-MsgGUID: eRkbm5xtTj2V14ETXRHI8A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,285,1751266800"; d="scan'208";a="207421414"
Received: from mwiniars-desk2.ger.corp.intel.com (HELO localhost)
 ([10.245.246.61])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2025 05:49:37 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Samasth Norway Ananda <samasth.norway.ananda@oracle.com>,
 simona@ffwll.ch, deller@gmx.de
Cc: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, tzimmermann@suse.de
Subject: Re: [PATCH] fbcon: fix integer overflow in fbcon_do_set_font
In-Reply-To: <12cfe7be56a4eeed0f32d8da69d06f0490a9eec9@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20250912170023.3931881-1-samasth.norway.ananda@oracle.com>
 <12cfe7be56a4eeed0f32d8da69d06f0490a9eec9@intel.com>
Date: Mon, 22 Sep 2025 15:49:33 +0300
Message-ID: <9c7e4c1213c6a77680d8d5f454e1b7c27fc5db62@intel.com>
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

On Mon, 22 Sep 2025, Jani Nikula <jani.nikula@linux.intel.com> wrote:
> On Fri, 12 Sep 2025, Samasth Norway Ananda <samasth.norway.ananda@oracle.com> wrote:
>> Fix integer overflow vulnerabilities in fbcon_do_set_font() where font
>> size calculations could overflow when handling user-controlled font
>> parameters.
>>
>> The vulnerabilities occur when:
>> 1. CALC_FONTSZ(h, pitch, charcount) performs h * pith * charcount
>>    multiplication with user-controlled values that can overflow.
>> 2. FONT_EXTRA_WORDS * sizeof(int) + size addition can also overflow
>> 3. This results in smaller allocations than expected, leading to buffer
>>    overflows during font data copying.
>>
>> Add explicit overflow checking using check_mul_overflow() and
>> check_add_overflow() kernel helpers to safety validate all size
>> calculations before allocation.
>>
>> Signed-off-by: Samasth Norway Ananda <samasth.norway.ananda@oracle.com>
>> ---
>>  drivers/video/fbdev/core/fbcon.c | 11 +++++++++--
>>  1 file changed, 9 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/video/fbdev/core/fbcon.c b/drivers/video/fbdev/core/fbcon.c
>> index 55f5731e94c3..a507d05f8fea 100644
>> --- a/drivers/video/fbdev/core/fbcon.c
>> +++ b/drivers/video/fbdev/core/fbcon.c
>> @@ -2531,9 +2531,16 @@ static int fbcon_set_font(struct vc_data *vc, const struct console_font *font,
>>  	if (fbcon_invalid_charcount(info, charcount))
>>  		return -EINVAL;
>>  
>> -	size = CALC_FONTSZ(h, pitch, charcount);
>> +	/* Check for integer overflow in font size calculation */
>> +	if (check_mul_overflow(h, pitch, &size) ||
>> +	    check_mul_overflow(size, charcount, &size))
>> +		return -EINVAL;
>> +
>> +	/* Check for overflow in allocation size calculation */
>> +	if (check_add_overflow(FONT_EXTRA_WORDS * sizeof(int), size, &size))
>
> This change stores the intermediate value into size, but fails to take
> into account that size is used just a bit later in the function,
> expecting the original size:
>
> 	new_data += FONT_EXTRA_WORDS * sizeof(int);
> 	FNTSIZE(new_data) = size;
> 	REFCOUNT(new_data) = 0;	/* usage counter */
> 	for (i=0; i< charcount; i++) {
> 		memcpy(new_data + i*h*pitch, data +  i*vpitch*pitch, h*pitch);
> 	}
>
> 	/* Since linux has a nice crc32 function use it for counting font
> 	 * checksums. */
> 	csum = crc32(0, new_data, size);
>
> What was supposed to address an unlikely integer overflow seems to have
> caused a real buffer overflow [1].

The overflow of 16 bytes matches FONT_EXTRA_WORDS * sizeof(int):

memcmp: detected buffer overflow: 8208 byte read of buffer size 8192


> BR,
> Jani.
>
>
> [1] https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15020
>
>> +		return -EINVAL;
>>  
>> -	new_data = kmalloc(FONT_EXTRA_WORDS * sizeof(int) + size, GFP_USER);
>> +	new_data = kmalloc(size, GFP_USER);
>>  
>>  	if (!new_data)
>>  		return -ENOMEM;

-- 
Jani Nikula, Intel
