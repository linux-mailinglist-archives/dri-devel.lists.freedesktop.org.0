Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BA003983975
	for <lists+dri-devel@lfdr.de>; Tue, 24 Sep 2024 00:02:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E1869898F0;
	Mon, 23 Sep 2024 22:01:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Eew3I3sG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A76A898F0;
 Mon, 23 Sep 2024 22:01:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727128919; x=1758664919;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=jzjx/LT74DT5bwVFGjZkIuVYgVUY5JBAmgIOCgW1jkc=;
 b=Eew3I3sGEJ4nVUiX751210W0LdBMRfIe+u/CVMPBEpL/f1BkeV649xqz
 9DDeow8u222KTtQfLxJXHrqvqmNwWCHBX/S4SxTmLQ8JDwFarvL1Q4F00
 5PvdsQZlMxubZFRmhMl0Di6XZc8wN1b9i9EvphyYwE/wLNt0c7RpcVfl4
 B7pACjxMSbVOMhwojaiQYurAM7Egsrx6+Qg1c3UDc/0jZSZ1GnN5rg5Aw
 5i5AbPnFsPeaoZ7Ag4S01q3mqC82RElH2tl/neryGBEoIr74oSTk8wpDE
 +Foowo28sOnbcxzmX6j1ZFKNuGtVpTto3VFItCt6NkZ/BXISrTv3o4ZVq w==;
X-CSE-ConnectionGUID: fm3dALW1QJKR777eO73eTw==
X-CSE-MsgGUID: pWbAGXNiRHmL0npkCCi/DA==
X-IronPort-AV: E=McAfee;i="6700,10204,11204"; a="29816911"
X-IronPort-AV: E=Sophos;i="6.10,252,1719903600"; d="scan'208";a="29816911"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2024 15:01:59 -0700
X-CSE-ConnectionGUID: GqNDcfhmQaqUbYKXZlqbpQ==
X-CSE-MsgGUID: Q/I7vIAaRf6MhR2wPMN5pg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,252,1719903600"; d="scan'208";a="75732875"
Received: from sschumil-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.246.65])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2024 15:01:51 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Raag Jadav
 <raag.jadav@intel.com>
Cc: airlied@gmail.com, simona@ffwll.ch, lucas.demarchi@intel.com,
 thomas.hellstrom@linux.intel.com, rodrigo.vivi@intel.com,
 joonas.lahtinen@linux.intel.com, tursulin@ursulin.net, lina@asahilina.net,
 intel-xe@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, himal.prasad.ghimiray@intel.com,
 francois.dugast@intel.com, aravind.iddamsetty@linux.intel.com,
 anshuman.gupta@intel.com, andi.shyti@linux.intel.com,
 matthew.d.roper@intel.com
Subject: Re: [PATCH v6 1/4] drm: Introduce device wedged event
In-Reply-To: <ZvGB9P_JdXcnTfW2@smile.fi.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20240923035826.624196-1-raag.jadav@intel.com>
 <20240923035826.624196-2-raag.jadav@intel.com>
 <ZvEpH_po4bYmEISh@smile.fi.intel.com>
 <ZvF8q7xkbEegPzc9@black.fi.intel.com>
 <ZvGB9P_JdXcnTfW2@smile.fi.intel.com>
Date: Tue, 24 Sep 2024 01:01:48 +0300
Message-ID: <874j6658s3.fsf@intel.com>
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

On Mon, 23 Sep 2024, Andy Shevchenko <andriy.shevchenko@linux.intel.com> wrote:
> On Mon, Sep 23, 2024 at 05:35:23PM +0300, Raag Jadav wrote:
>> On Mon, Sep 23, 2024 at 11:38:55AM +0300, Andy Shevchenko wrote:
>> > On Mon, Sep 23, 2024 at 09:28:23AM +0530, Raag Jadav wrote:
>
> ...
>
>> > > +extern const char *const wedge_recovery_opts[];
>> > 
>> > It's not NULL terminated. How users will know that they have an index valid?
>> 
>> It's expected to be accessed using recovery_*() helpers.
>
> If so, this has to be static then.

Yeah, please make the helpers regular functions. Static inlines are just
harmful here.

BR,
Jani.

>
>> > Either you NULL-terminate that, or export the size as well (personally I would
>> > go with the first approach).

-- 
Jani Nikula, Intel
