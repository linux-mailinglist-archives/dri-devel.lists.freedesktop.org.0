Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 85AD96A46A5
	for <lists+dri-devel@lfdr.de>; Mon, 27 Feb 2023 17:02:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD49C10E42F;
	Mon, 27 Feb 2023 16:02:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D17A910E42F
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Feb 2023 16:02:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1677513754; x=1709049754;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=GzUcXJBiPN1dZra43WnMj0WTwuVeYjywGsI5YJvho1g=;
 b=SRb8HHmJ4Oij6LLhoCF2Xrh+tYZFXjGoSvAehtaIu0aJc3s0doNK7E6q
 BRxSBLQZYpaRn2667HCajatKQZSwhii68n1+hhEalWfJd361XSxlJQb2/
 qv+CI7SpbMDOf3L31mJBHNjjEqS9vm6/GyKtZCvfcy7RtnjrfgIoyfTsR
 wTGQduD0m/6ez8F79qBfv1RwuazukjQDZArkFgoM5B7XXXkgokIiz7rrb
 4KaUMt01JBO1E0BHTF+ye8FXCyuTVYKfAJDzTLZkLnsLj/NWYleCO3ui8
 d6Gi9vJbiwlSiMVA1WcxvkPYUxZNBBA/WOtxGZuIrZbkjucB8ga7wQ6yj g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10634"; a="420153544"
X-IronPort-AV: E=Sophos;i="5.98,219,1673942400"; d="scan'208";a="420153544"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2023 08:02:34 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10634"; a="706233045"
X-IronPort-AV: E=Sophos;i="5.98,219,1673942400"; d="scan'208";a="706233045"
Received: from jkaisrli-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.56.158])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2023 08:02:30 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Siddh Raman Pant <code@siddh.me>
Subject: Re: [PATCH v7 1/7] drm/print: Fix and add support for NULL as first
 argument in drm_* macros
In-Reply-To: <18693900367.2ce71ba5548919.6872574648582795181@siddh.me>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <cover.1677395403.git.code@siddh.me>
 <89f0aa1f26696846c2303527fe4d133bb4ff4bf6.1677395403.git.code@siddh.me>
 <87ilfn30li.fsf@intel.com>
 <18693900367.2ce71ba5548919.6872574648582795181@siddh.me>
Date: Mon, 27 Feb 2023 18:02:25 +0200
Message-ID: <878rgj14ha.fsf@intel.com>
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
Cc: thomas zimmermann <tzimmermann@suse.de>, sam ravnborg <sam@ravnborg.org>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 27 Feb 2023, Siddh Raman Pant <code@siddh.me> wrote:
> On Mon, 27 Feb 2023 15:13:21 +0530, Jani Nikula wrote:
>> First of all, that's two distinct changes in one patch. The subject says
>> one thing, but it's really two.
>
> Sorry, my bad.
>
>> But the main question is, do we *really* want to let callers pass either
>> struct drm_device * or struct device *? It will be type safe with
>> generics, but if it's okay to use either, people *will* use either. The
>> call sites will end up being a mixture of both. You can't control it. It
>> will be very tedious if you ever want to revert that decision.
>> 
>> Do we want to promote a style where you can pass either? To me, in C
>> context, it seems awfully sloppy and confusing rather than convenient.
>> 
>> I'd argue the struct mipi_dsi_host stuff should use dev_* calls
>> directly, as it's more of a special case, rather than allow struct
>> device * in drm_* logging macros.
>
> I agree. I thought direct dev_* calls would not be ideal, as there is a
> TODO to move away from that, and also incorrectly expected to have more
> such dev ptr problems. But on a second thought, you are correct.
>
> Should I post a new patch, with using __drm_dev_ptr instead and
> removing the __get_dev_ptr generic macro, and using dev_* in
> drm_mipi_dsi.c as `dev_err(dev, "*ERROR* [drm] <msg>", ...);`?

I think commit 1040e424353f ("drm: mipi-dsi: Convert logging to drm_*
functions.") and any similar ones should just be reverted. It worked by
accident. You're supposed to pass struct drm_device * to the drm_*
logging functions, and that passes struct mipi_dsi_host *.

BR,
Jani.



>
>> BR,
>> Jani.
>
> Thanks,
> Siddh

-- 
Jani Nikula, Intel Open Source Graphics Center
