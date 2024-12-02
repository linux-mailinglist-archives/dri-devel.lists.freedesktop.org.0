Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ED2589E0188
	for <lists+dri-devel@lfdr.de>; Mon,  2 Dec 2024 13:07:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D65B10E708;
	Mon,  2 Dec 2024 12:07:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KxNExCnw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0AAE410E708;
 Mon,  2 Dec 2024 12:07:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733141273; x=1764677273;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=fOU/S4oUDE/hjQVQOFSJF1sFnSg8KnhfYYQKiCqEG5E=;
 b=KxNExCnw9JYsyBjZqneGKnjdiFxFlTd3IFmsxB2NSAxsKmchXVGoU34Q
 Vg1/2hgI2CwUDySQ8IlUOwwfTwUNvmVF3wuqfof55LHVeNB9NPvVqVoFr
 tVumTIpo1SStN/FDqWSCnyv0CKODPWf+xHEoR5dTiymtYIQKcSN3TsPOO
 uby1C4L4rE9Xx6HLRtzV5433zlbx3HgOFCEDBqoPSQ6VMtTA4yVvN9Ybu
 5FCn7ZgEqowhYUnPf8gSSqDE7OXoQcV0lmUDIIfYp7FAfW74QXiWBD/l1
 EoqxP6Aw2yj/y1NHzwHNxHB/Gg9uiVwi/uBtd3KmiZiFfl48B1KfkCk+h w==;
X-CSE-ConnectionGUID: f2rdcIakRyyMO2xQVfl6Dw==
X-CSE-MsgGUID: 5MCvuJ5TTdyr233U2SgDyA==
X-IronPort-AV: E=McAfee;i="6700,10204,11274"; a="43917078"
X-IronPort-AV: E=Sophos;i="6.12,202,1728975600"; d="scan'208";a="43917078"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Dec 2024 04:07:52 -0800
X-CSE-ConnectionGUID: LAiXbn+0TdaTWG1Erq+GUQ==
X-CSE-MsgGUID: qQ8yMfiWS2W6luHXtuEZjg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="98120309"
Received: from slindbla-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.246.77])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Dec 2024 04:07:50 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: Maxime Ripard <mripard@kernel.org>, Imre Deak <imre.deak@intel.com>
Cc: intel-gfx@lists.freedesktop.org, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann
 <tzimmermann@suse.de>, Dave Airlie <airlied@redhat.com>, Daniel Vetter
 <daniel.vetter@ffwll.ch>, dri-devel@lists.freedesktop.org, Rodrigo Vivi
 <rodrigo.vivi@intel.com>
Subject: Re: [PATCH v2 1/4] drm/dp: Add a way to init/add a connector in
 separate steps
In-Reply-To: <20241202-real-benevolent-skunk-a9f5e0@houat>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20241126161859.1858058-1-imre.deak@intel.com>
 <20241126161859.1858058-2-imre.deak@intel.com>
 <Z0nO-bwpbWPVryd6@ideak-desk.fi.intel.com>
 <20241129-wild-cobra-of-thunder-829d1f@houat>
 <Z0nn0VzawSCdOCKY@ideak-desk.fi.intel.com>
 <20241202-real-benevolent-skunk-a9f5e0@houat>
Date: Mon, 02 Dec 2024 14:07:36 +0200
Message-ID: <87ldwy5lvb.fsf@intel.com>
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

On Mon, 02 Dec 2024, Maxime Ripard <mripard@kernel.org> wrote:
> It's not about whether we have a problem or not: you introduce new
> framework functions, you need to have kunit tests to check their
> behaviour.

I don't fundamentally disagree with that goal, but it does seem like a
pretty drastic policy change. I don't recall a discussion where we made
that decision, nor can I find any documentation stating this. Or what
exactly the requirement is; it's totally unclear to me.

Had I been involved, I would've pointed out that while adding tests is
good, it inevitably increases the friction of adding new stuff to drm
core. It's super tempting for people to just get their jobs done. If
doing the right thing adds yet another hurdle, we may see more stuff
being added in drivers instead of drm core.

(Case in point, we already hacked around the problem being solved here
with commit d58f65df2dcb ("drm/i915/dp_mst: Fix connector initialization
in intel_dp_add_mst_connector()"). We could've just dropped the ball
right there.)

BR,
Jani.


-- 
Jani Nikula, Intel
