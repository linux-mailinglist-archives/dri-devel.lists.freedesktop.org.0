Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D9B1A5F3774
	for <lists+dri-devel@lfdr.de>; Mon,  3 Oct 2022 23:06:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B010510E403;
	Mon,  3 Oct 2022 21:06:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2FF4010E4DD;
 Mon,  3 Oct 2022 21:06:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1664831201; x=1696367201;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=NTANcti3jW61xJIsT3X4G9rN9EeZ+ba9f6aNeuuixeo=;
 b=UiWl6fqxDPkz8A7LM/s2PX317AtgYyJFKz4i5yT7Z0gWZ/17UoB43Mln
 MB07t/i+x/iNcoGplsma4MLxydpMQIhCPzbsPQbAD1Vg59RKNvZtIgZPc
 HDLUF7ghz2y0dC7CUygOsfiv6KXQ3guH++yynzJOMPkiT4N28brif0mey
 NGZmYzxuJ+SP9nEj5hZmQxyt5yTBTdJnfbHuISZoESEn3d52dhzG8SWPa
 Gn64NyNpeiEoRh9PRuzEVigT25LYJ1KcqxtFMZbqaj/vwFc1dzm3ZRrNv
 Is9UKVD43LUDPrd4x4TMAjb/odLFoE9Pg0r6ZKgkEzNRhwNhhqEvs2gTn A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10489"; a="329161018"
X-IronPort-AV: E=Sophos;i="5.93,366,1654585200"; d="scan'208";a="329161018"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Oct 2022 14:06:40 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10489"; a="625944838"
X-IronPort-AV: E=Sophos;i="5.93,366,1654585200"; d="scan'208";a="625944838"
Received: from nvishwa1-desk.sc.intel.com (HELO nvishwa1-DESK) ([172.25.29.76])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Oct 2022 14:06:40 -0700
Date: Mon, 3 Oct 2022 14:06:18 -0700
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: Andi Shyti <andi.shyti@linux.intel.com>
Subject: Re: [PATCH v2 10/17] drm/i915/vm_bind: Abstract out common execbuf
 functions
Message-ID: <20221003210617.GT22224@nvishwa1-DESK>
References: <20221003061245.12716-1-niranjana.vishwanathapura@intel.com>
 <20221003061245.12716-11-niranjana.vishwanathapura@intel.com>
 <YzsFgcxgwHGgqvW0@ashyti-mobl2.lan>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <YzsFgcxgwHGgqvW0@ashyti-mobl2.lan>
User-Agent: Mutt/1.5.24 (2015-08-30)
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
Cc: matthew.brost@intel.com, paulo.r.zanoni@intel.com,
 lionel.g.landwerlin@intel.com, tvrtko.ursulin@intel.com, jani.nikula@intel.com,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 thomas.hellstrom@intel.com, matthew.auld@intel.com, jason@jlekstrand.net,
 daniel.vetter@intel.com, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Oct 03, 2022 at 05:53:37PM +0200, Andi Shyti wrote:
>Hi Niranjana,
>
>[...]
>
>> +	for_each_child(ce, child) {
>> +		err = intel_context_pin_ww(child, ww);
>> +		GEM_BUG_ON(err);	/* perma-pinned should incr a counter */
>> +	}
>> +
>> +	for_each_child(ce, child) {
>> +		err = eb_pin_timeline(child, throttle, nonblock);
>> +		if (err)
>> +			goto unwind;
>> +		++i;
>> +	}
>
>any reason for having two separate for_each_child here?
>

This part is ported as is from i915_gem_execbuffer.c.
Probably the author found it easy to unwind in case of error.

Regards,
Niranjana

>Andi
>
>> +	err = eb_pin_timeline(ce, throttle, nonblock);
>> +	if (err)
>> +		goto unwind;
>> +
>> +	return 0;
>> +
>> +unwind:
>> +	for_each_child(ce, child) {
>> +		if (j++ < i) {
>> +			mutex_lock(&child->timeline->mutex);
>> +			intel_context_exit(child);
>> +			mutex_unlock(&child->timeline->mutex);
>> +		}
>> +	}
>> +	for_each_child(ce, child)
>> +		intel_context_unpin(child);
>
>[...]
