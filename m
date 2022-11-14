Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A094627CC0
	for <lists+dri-devel@lfdr.de>; Mon, 14 Nov 2022 12:46:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D79F10E077;
	Mon, 14 Nov 2022 11:46:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C4A3F10E068;
 Mon, 14 Nov 2022 11:46:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1668426388; x=1699962388;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=QnB8NT/BvHFT1lucPppdmRjJR8BHn93fAYcT0w+9YvI=;
 b=AkgYO3JMr3J6LVs5BKfbckGqH8VblL3/g+IHmhEJzZF4C+Lkb1JdiARy
 hZG4esDLvUVHe8TNvFWeMeWL/dOHzRk3v6KJ0k8lFtic8KTV+bksPamk5
 ZKbYJg7+lLj46E56bPd0pKO3RycWTL32/pczWZ5yiTj9izJeofL6J2loP
 kpn+iQ6UGYDd2Pny+KKQZVJAyiom7GMGB9MFGPVAFdN545IxNRryqtwN0
 aiuniI+kMmx2obkIx5qzW2wdpSGIuyDxdkYIu5CwfJdQ7FKEGCcTt1wRB
 OsZ+1g9hdSrTwjjbLf9VKNhtUfD1NxB61o/M5B/CtAM+ROANMVJKiJzbh Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10530"; a="291664564"
X-IronPort-AV: E=Sophos;i="5.96,161,1665471600"; d="scan'208";a="291664564"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2022 03:46:27 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10530"; a="671529151"
X-IronPort-AV: E=Sophos;i="5.96,161,1665471600"; d="scan'208";a="671529151"
Received: from tursulin-desk.ger.corp.intel.com (HELO [10.213.208.165])
 ([10.213.208.165])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2022 03:46:24 -0800
Message-ID: <293aa829-df02-8049-9225-964b0c93e107@linux.intel.com>
Date: Mon, 14 Nov 2022 11:46:22 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
Subject: Re: [Intel-gfx] [PATCH] drm/i915: Simplify internal helper function
 signature
Content-Language: en-US
To: Mika Kuoppala <mika.kuoppala@linux.intel.com>,
 Intel-gfx@lists.freedesktop.org
References: <20221110124633.3135026-1-tvrtko.ursulin@linux.intel.com>
 <87pmduho0x.fsf@mkuoppal-desk>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <87pmduho0x.fsf@mkuoppal-desk>
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
Cc: dri-devel@lists.freedesktop.org, Andrzej Hajda <andrzej.hajda@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 10/11/2022 14:39, Mika Kuoppala wrote:
> Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com> writes:
> 
>> From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
>>
>> Since we are now storing the GT backpointer in the wa list we can drop the
>> explicit struct intel_gt * argument to wa_list_apply.
> 
> There is room for more dropping, all the platform lists inits.

Indeed! I'll put that on the back burner, time permitting.

>> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
>> Cc: Andrzej Hajda <andrzej.hajda@intel.com>
> 
> Reviewed-by: Mika Kuoppala <mika.kuoppala@linux.intel.com>

Thanks Mika, pushed!

Regards,

Tvrtko
