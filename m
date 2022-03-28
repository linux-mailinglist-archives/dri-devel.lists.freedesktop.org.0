Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C2AE24E9F09
	for <lists+dri-devel@lfdr.de>; Mon, 28 Mar 2022 20:36:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C464810E771;
	Mon, 28 Mar 2022 18:36:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E090510E246;
 Mon, 28 Mar 2022 18:36:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1648492590; x=1680028590;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=yzeVvCY6eqwG29hVG/giVQ00H2WTTuSc9twI97r1Ap8=;
 b=ZO2VNwVETm+XQq7Wk6Dhp4fErg1pvoL4EWNYAGAe11n/LEIQNKoj024w
 a8BAkFA1231gKc4gmjSpmrWjMVoPxFuEq8toqMJCkaebXHEN9Z4nDXiDr
 WGG/r+0rh66P0634XBkz8optsh9Q035rVf5i1Ci2omNgHYKgJjdeFwbF4
 ngXEHMRs/1LjRv9QVJ4Y3JmISuLYw9kl/8AbUJl42xpE4eWJ6TG/rLbX/
 XeBKtajdNJKvBMAKMeYwjkXJ0uSSRwSnDENsZDXn4zDeF2rSwd6IamjwM
 505JWbpSDXj7Mux9Xai97Bc1F7l1yb9NglipHqELEVYkBvkJII3UtPLwE g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10300"; a="322264360"
X-IronPort-AV: E=Sophos;i="5.90,218,1643702400"; d="scan'208";a="322264360"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Mar 2022 11:36:30 -0700
X-IronPort-AV: E=Sophos;i="5.90,218,1643702400"; d="scan'208";a="546070526"
Received: from aysivtso-mobl.ccr.corp.intel.com (HELO localhost)
 ([10.252.62.56])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Mar 2022 11:36:28 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Emil Velikov <emil.l.velikov@gmail.com>
Subject: Re: [PATCH v3 00/12] drm/edid: constify EDID parsing, with fixes
In-Reply-To: <CACvgo53Mx7qMt7_xC32vG+yQu8xEOF9N-iruS1FDRmVMUKaHDQ@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <cover.1648477901.git.jani.nikula@intel.com>
 <CACvgo53Mx7qMt7_xC32vG+yQu8xEOF9N-iruS1FDRmVMUKaHDQ@mail.gmail.com>
Date: Mon, 28 Mar 2022 21:36:19 +0300
Message-ID: <875ynxexgc.fsf@intel.com>
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
Cc: Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 ML dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 28 Mar 2022, Emil Velikov <emil.l.velikov@gmail.com> wrote:
> On Mon, 28 Mar 2022 at 15:34, Jani Nikula <jani.nikula@intel.com> wrote:
>>
>> v3 of https://patchwork.freedesktop.org/series/101787/ and
>> https://patchwork.freedesktop.org/series/101862/
>>
>> I screwed up with the struct renamings in v2, so there's some falling
>> back to v1 and general confusion here. Sorry.
>>
>
> The mutation and casting was doing my head - thanks for sorting this out.
>
> IMHO in the future we might want to (re)move the final mutation -
> header fixup - out of drm_edid_is_valid (drm_edid_block_valid really).
> Say by making it explicit and applying on DP only (as per the inline
> spec mention).
> But that is for another day.

Yes, there's a bunch more things to do, and patches will follow!

> As-is the series is:
> Reviewed-by: Emil Velikov <emil.l.velikov@gmail.com>

Thanks!

BR,
Jani.

>
> HTH
> Emil

-- 
Jani Nikula, Intel Open Source Graphics Center
