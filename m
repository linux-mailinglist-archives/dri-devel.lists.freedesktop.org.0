Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D881496C0BC
	for <lists+dri-devel@lfdr.de>; Wed,  4 Sep 2024 16:35:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C88C10E733;
	Wed,  4 Sep 2024 14:35:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DTCvXS49";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4EDF510E733;
 Wed,  4 Sep 2024 14:35:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725460504; x=1756996504;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=8r6EuPlnJi9mUsYOOjILwOftRDA0bFTeEDM5pky9vGw=;
 b=DTCvXS49tmpgg/APwyXSZBJaZN1FeXyzKSFTg3xAcRKm34TgG/BYtop+
 y4rO82lbqDbkvQUDiZpkfQG1piEbqCDb1rokRH33sBA9i1FSutFmO6GG4
 N37bf4+nfsTOxSp7aJz8VBfnQXagXtW8eibq18JZwRUEAZwLGbBkOuzon
 yf3qGowzoc1dGqrMWceWLpgpHjtw54b4f/dWGGgnCCO5Ol4DEHlWcmxQC
 n6ilSv763FzcjRG85CM+AANQg+ElLNjqq+4J6yPmIs0dXpcHMoUjNtJi4
 2bpKYRRFazCHdNuOU0YrDvp1Tist716ioUMst2YD+iq4Kvm1Uj/bp52fb w==;
X-CSE-ConnectionGUID: qa2VPsyETBii9C6/5h2Blw==
X-CSE-MsgGUID: lTHWazM3S+CmxmL4CAwkdQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11185"; a="23635908"
X-IronPort-AV: E=Sophos;i="6.10,202,1719903600"; d="scan'208";a="23635908"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Sep 2024 07:35:03 -0700
X-CSE-ConnectionGUID: AfeS94guRWeSTgcBoCDTRQ==
X-CSE-MsgGUID: qtiP98v1Rp63HLrVtNh/IA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,202,1719903600"; d="scan'208";a="96029690"
Received: from cpetruta-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.18])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Sep 2024 07:35:00 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Andi Shyti <andi.shyti@linux.intel.com>, Daniel Vetter
 <daniel.vetter@ffwll.ch>
Cc: Andi Shyti <andi.shyti@linux.intel.com>, intel-gfx
 <intel-gfx@lists.freedesktop.org>, dri-devel
 <dri-devel@lists.freedesktop.org>, Tvrtko Ursulin <tursulin@ursulin.net>,
 Chris Wilson <chris.p.wilson@linux.intel.com>, Rodrigo Vivi
 <rodrigo.vivi@intel.com>
Subject: Re: [PATCH] drm/i915/gt: Continue creating engine sysfs files even
 after a failure
In-Reply-To: <ZtheoXODm_6AFgcV@ashyti-mobl2.lan>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20240819113140.325235-1-andi.shyti@linux.intel.com>
 <Zs4HQR-gcZ_VHMMF@phenom.ffwll.local> <ZtheoXODm_6AFgcV@ashyti-mobl2.lan>
Date: Wed, 04 Sep 2024 17:34:42 +0300
Message-ID: <87y147qygt.fsf@intel.com>
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

On Wed, 04 Sep 2024, Andi Shyti <andi.shyti@linux.intel.com> wrote:
> Hi Sima,
>
> On Tue, Aug 27, 2024 at 07:05:05PM +0200, Daniel Vetter wrote:
>> On Mon, Aug 19, 2024 at 01:31:40PM +0200, Andi Shyti wrote:
>> > The i915 driver generates sysfs entries for each engine of the
>> > GPU in /sys/class/drm/cardX/engines/.
>> > 
>> > The process is straightforward: we loop over the UABI engines and
>> > for each one, we:
>> > 
>> >  - Create the object.
>> >  - Create basic files.
>> >  - If the engine supports timeslicing, create timeslice duration files.
>> >  - If the engine supports preemption, create preemption-related files.
>> >  - Create default value files.
>> > 
>> > Currently, if any of these steps fail, the process stops, and no
>> > further sysfs files are created.
>> > 
>> > However, it's not necessary to stop the process on failure.
>> > Instead, we can continue creating the remaining sysfs files for
>> > the other engines. Even if some files fail to be created, the
>> > list of engines can still be retrieved by querying i915.
>> > 
>> > Signed-off-by: Andi Shyti <andi.shyti@linux.intel.com>
>> 
>> Uh, sysfs is uapi. Either we need it, and it _must_ be there, or it's not
>> needed, and we should delete those files probably.
>> 
>> This is different from debugfs, where failures are consistently ignored
>> because that's the conscious design choice Greg made and wants supported.
>> Because debugfs is optional.
>> 
>> So please make sure we correctly fail driver load if these don't register.
>> Even better would be if sysfs files are registered atomically as attribute
>> blocks, but that's an entire different can of worms. But that would really
>> clean up this code and essentially put any failure handling onto core
>> driver model and sysfs code.
>
> This comment came after I merged the patch. So far, we have been
> keeping the driver going even if sysfs fails to create, with the
> idea of "if there is something wrong let it go as far as it can
> and fail on its own".
>
> This change is just setting the behavior to what the rest of the
> interfaces are doing, so that either we change them all to fail
> the driver's probe or we have them behaving consistently as they
> are.
>
> Tvrtko, Chris, Rodrigo any opinion from your side? Shall we bail
> out as Sima is suggesting?

Are there any causes for sysfs creation errors that would be acceptable
to ignore? I didn't see any examples. Or is this just speculative?

IMO fail fast and loud. We get enough bug reports where there's some big
backtrace splash copy-pasted on the bug, but the root cause happened
much earlier and was ignored.

BR,
Jani.


-- 
Jani Nikula, Intel
