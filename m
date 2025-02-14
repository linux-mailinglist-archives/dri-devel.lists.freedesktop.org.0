Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 360D1A358C7
	for <lists+dri-devel@lfdr.de>; Fri, 14 Feb 2025 09:22:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1631B10E4AA;
	Fri, 14 Feb 2025 08:22:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YJ0mO69U";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 823E210E4AA
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Feb 2025 08:22:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739521367; x=1771057367;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=KCbafTIYvQEVerjHlCgAqPsDkqNPAmHAhQ0DFmXWdLg=;
 b=YJ0mO69U2cUGv42k1HhT4VSmdUuFTnawnD7Svcv7mhjO6SwUb7KBwbPo
 Y/tUHskC32IGc4NYRQAtxRa7bXhIlvOH85Dkg3gR8+7SrgeDijWwPztE6
 PK7vxYz7jQj4UeZ90nvsc/7u4gm6W1cmK+WX8hNY3Gr9WiBZ3d+eoH7or
 bTrYnjQs1YUv+pO7UgemO2XTudpZu/TcI914BWunqsDGa7zmUcV8WpLkH
 Laf4IIvZFnjUMNIPu7VAdAgzbOFcjTwKiALk/g0zX92d5XjwdAgu8gsKI
 BKZ/GjGD4vzI96IrfZBR/jRvffgNZCmXd4BpsUtO7QNXOGwY7pQIWvOr+ w==;
X-CSE-ConnectionGUID: 8baVU0ThQAOsLU+aiiGGTw==
X-CSE-MsgGUID: ao8jBTk+SoC1gsSg8K0mSQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11344"; a="50474319"
X-IronPort-AV: E=Sophos;i="6.13,285,1732608000"; d="scan'208";a="50474319"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Feb 2025 00:22:47 -0800
X-CSE-ConnectionGUID: QL9vGmoSSWeAk73o68yDmw==
X-CSE-MsgGUID: 25+1wuZYR4q3DBZU+Uf4GQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,285,1732608000"; d="scan'208";a="114039564"
Received: from slindbla-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.246.30])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Feb 2025 00:22:44 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Egor Vorontsov <sdoregor@sdore.me>, linux-kernel@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Egor Vorontsov <sdoregor@sdore.me>
Subject: Re: [PATCH v2] drm/edid: Implement DisplayID Type IX & X timing
 blocks parsing
In-Reply-To: <f0e0d4e7f5d552cb82cf3c9243f15772268fa311.camel@sdore.me>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <7cab8349bc8bb6fa08d2a7127a724efea155f154.camel@sdore.me>
 <87zfirzerp.fsf@intel.com>
 <f0e0d4e7f5d552cb82cf3c9243f15772268fa311.camel@sdore.me>
Date: Fri, 14 Feb 2025 10:22:40 +0200
Message-ID: <87h64xvstr.fsf@intel.com>
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

On Thu, 13 Feb 2025, Egor Vorontsov <sdoregor@sdore.me> wrote:
> On Wed, 2025-02-12 at 11:35 +0200, Jani Nikula wrote:
>> > +	/* TODO: support video-optimized refresh rate */
>> > +	if (timings->flags & (1 << 4))
>> > +		return NULL;
>> 
>> Mmh. I'm not sure I'd go this far. The bit indicates *two* timings, one
>> for which the below *is* correct, and another additional one with
>> vrefresh * (1000/1001).
>> 
>> We could just add a drm_dbg_kms(dev, "<message>") here about missing
>> fractional refresh rate, and proceed with the one non-fractional rate?
>> Or just have the TODO comment with no checks.
> I'll go with the former, for now.
>
>> Either way,
>> Reviewed-by: Jani Nikula <jani.nikula@intel.com>
> Thank you. ... But!
>
>> Are you up for the follow-ups too? And since you've got the hang of it,
>> maybe fix struct displayid_formula_timings_9 hactive/vactive to __be16
>> as well?
> ... at this moment I realised that both the specs and the legacy code
> actually indicate it's indeed *little*-endian shorts!
> I.e. `x[0] | x[1] << 8' -- that's LSB-first.
>
> Also, virtually no code in `drm_edid.c' uses big-endian.

Yes, I *obviously* meant __be16 and be16_to_cpu(). ;D

Good catch, and sorry about that, quite the *facepalm* for me.

> Thus, I'm fixing both my code and `displayid_detailed_timings_1' (I
> suppose you meant this struct instead) to use __le16.

Indeed.


Thanks,
Jani.


-- 
Jani Nikula, Intel
