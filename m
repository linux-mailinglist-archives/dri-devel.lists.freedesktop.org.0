Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DC67136C8AF
	for <lists+dri-devel@lfdr.de>; Tue, 27 Apr 2021 17:32:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5CD0A6E983;
	Tue, 27 Apr 2021 15:32:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 717F96E0C8;
 Tue, 27 Apr 2021 15:32:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
 In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender
 :Reply-To:Content-ID:Content-Description;
 bh=LQWA5Vj4/vDTbjcIAJB1lIQbwCbGR7wOkwAKtHeU/fo=; b=LiBcd29YiOroBKZ3tf8wjAoMRx
 R7P9hHXyjzfRMPScN8KiVdQh1Fl4P/Vb3LNki7eNFchPrLYs+pAB/s8J5J7cghN5CQ2K1PCHOyryG
 D7TmrFM1yuBYk9EP7bZhOB7MsQb/qMaICJfzYsVRMMu034YNqKBmOiR2xCt9tkWv685bDt2JE1HLF
 H8TXCSrueLo9mxh8BJhmYc48h+ftoLHfd0EWmhjRpKo4HxuTymO/z6XzF8KF6kKKKQua7Pvs3RF5I
 Ng7kmJ2apAX9UOSaeY6AIAH2UXD1GcUNt24K55lxson17SN2gxeRKRbHPSNTZ+K5qnrIiJg+7y96q
 qLUHFS4Q==;
Received: from [2601:1c0:6280:3f0::df68]
 by casper.infradead.org with esmtpsa (Exim 4.94 #2 (Red Hat Linux))
 id 1lbPgt-0074eB-GM; Tue, 27 Apr 2021 15:32:10 +0000
Subject: Re: [PATCH] drm: i915: fix build when ACPI is disabled and BACKLIGHT=m
To: Jani Nikula <jani.nikula@intel.com>, linux-kernel@vger.kernel.org
References: <20210426183516.18957-1-rdunlap@infradead.org>
 <874kfs5f3d.fsf@intel.com>
From: Randy Dunlap <rdunlap@infradead.org>
Message-ID: <866940af-bbbf-a1cd-b1e3-aafe94686a22@infradead.org>
Date: Tue, 27 Apr 2021 08:31:54 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <874kfs5f3d.fsf@intel.com>
Content-Language: en-US
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Damien Lespiau <damien.lespiau@intel.com>, dri-devel@lists.freedesktop.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, intel-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 4/27/21 1:03 AM, Jani Nikula wrote:
> On Mon, 26 Apr 2021, Randy Dunlap <rdunlap@infradead.org> wrote:
>> When CONFIG_DRM_I915=y, CONFIG_ACPI is not set, and
>> CONFIG_BACKLIGHT_CLASS_DEVICE=m, not due to I915 config,
>> there are build errors trying to reference backlight_device_{un}register().
>>
>> Changing the use of IS_ENABLED() to IS_REACHABLE() in intel_panel.[ch]
>> fixes this.
> 
> I feel like a broken record...

Thanks! :)

I'll leave it b0rken as well.


> CONFIG_DRM_I915=y and CONFIG_BACKLIGHT_CLASS_DEVICE=m is an invalid
> configuration. The patch at hand just silently hides the problem,
> leaving you without backlight.
> 
> i915 should *depend* on backlight, not select it. It would express the
> dependency without chances for invalid configuration.
> 
> However, i915 alone can't depend on backlight, all users of backlight
> should depend on backlight, not select it. Otherwise, you end up with
> other configuration problems, circular dependencies and
> whatnot. Everyone should change. See also (*) why select is not a good
> idea here.
> 
> I've sent patches to this effect before, got rejected, and the same
> thing gets repeated ad infinitum.
> 
> Accepting this patch would stop the inflow of these reports and similar
> patches, but it does not fix the root cause. It just sweeps the problem
> under the rug.
> 
> 
> BR,
> Jani.
> 
> (*) Documentation/kbuild/kconfig-language.rst:
> 
> 	select should be used with care. select will force
> 	a symbol to a value without visiting the dependencies.
> 	By abusing select you are able to select a symbol FOO even
> 	if FOO depends on BAR that is not set.
> 	In general use select only for non-visible symbols
> 	(no prompts anywhere) and for symbols with no dependencies.
> 	That will limit the usefulness but on the other hand avoid
> 	the illegal configurations all over.

Yes, I'm well aware of that.

ta.
-- 
~Randy

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
