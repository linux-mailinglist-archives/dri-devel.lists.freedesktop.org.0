Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 70FAF48ED41
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jan 2022 16:40:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC4D310E281;
	Fri, 14 Jan 2022 15:40:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 038FC10E281;
 Fri, 14 Jan 2022 15:40:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1642174845; x=1673710845;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=EmTaqi0mb1+xAu+Z1chEH+YXcMOWdceEHA+qZobfcY8=;
 b=AI88gEBwmpzLrL/asrejKpD2han+aRSn9+k/oV/L53LF2iQKdDjRVOXi
 +DqopqJS+SAT2SaYaszgG0ANBYyNkGOW4Qk46Vehi6GyLEFnQq7n788VA
 JPvidQ1KMVfyRq40Qfssz7/Hg6BsS8lGnOoD+zIycKmBYVzr0JzHm4UHE
 WaqJWcjcgxOdTxbIWnBqxP2YIH9uEDoQx2+YNbLL5arr5TPP/+ouXk6iM
 +Nghqpyh9jaIeIcaCyM6yPjWuWbyMTGjc82M4Y9QA/YfOFukCUfNv4bI7
 SH6vB0+A5eLiLaIXUyTkLK0JLx4fbX1F3hH3es0CIimnTjhupu/gDjFrk Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10226"; a="244222438"
X-IronPort-AV: E=Sophos;i="5.88,289,1635231600"; d="scan'208";a="244222438"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jan 2022 07:40:44 -0800
X-IronPort-AV: E=Sophos;i="5.88,289,1635231600"; d="scan'208";a="529368285"
Received: from alliang-mobl1.amr.corp.intel.com (HELO [10.212.42.120])
 ([10.212.42.120])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jan 2022 07:40:41 -0800
Message-ID: <037f9a23-6a90-bacb-5f9c-05f9a8be3be7@linux.intel.com>
Date: Fri, 14 Jan 2022 15:40:40 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.1
Subject: Re: [PATCH][RESEND] i915: make array flex_regs static const
Content-Language: en-US
To: Jani Nikula <jani.nikula@linux.intel.com>,
 Colin Ian King <colin.i.king@gmail.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
References: <20220112223435.949071-1-colin.i.king@gmail.com>
 <87h7a86lf8.fsf@intel.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <87h7a86lf8.fsf@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 13/01/2022 09:21, Jani Nikula wrote:
> On Wed, 12 Jan 2022, Colin Ian King <colin.i.king@gmail.com> wrote:
>> Don't populate the read-only array flex_regs on the stack but
>> instead it static const. Also makes the object code a little smaller.
>>
>> Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
>>
>> ---
>>
>> RESEND: Use correct e-mail address for sign-off and From: in e-mail.
> 
> There are a number of things at play here:
> 
> - Our tooling checks for certain things, such as author/signed-off-by
>    match, after applying the patch.
> 
> - You have an entry in the kernel git .mailmap.
> 
> - The git log.mailmap config default has changed from false to true.
> 
> We apply the patch, and, with the default options, git show will display
> a different author than the signed-off-by.
> 
> We should use --no-use-mailmap when examining a commit to ensure the
> commit is internally consistent, regardless of .mailmap.

Yes that sounds like the right thing to do.

In the meantime I have pushed this patch.

Regards,

Tvrtko

