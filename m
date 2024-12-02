Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 359609E0758
	for <lists+dri-devel@lfdr.de>; Mon,  2 Dec 2024 16:44:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F95910E7AD;
	Mon,  2 Dec 2024 15:44:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YOtEoVbx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 428CF10E0F7;
 Mon,  2 Dec 2024 15:44:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733154284; x=1764690284;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=o0SnThjgTbO+1dWFV+Wnfa9zBCfQzejr437smpq0Yaw=;
 b=YOtEoVbxrxxDPCj1/vtYIERo/8dTbwOaO87r3bN4HNtS+1zi6J+in8HS
 9fqZ5wB52iutyKnZpuEIFJp1ej2vvVEI453zcU4IVdqhE9GdiU0+CCxed
 zjci+i1mVWIPukiE9F5xmiwURoOuggxT6kTrgzVuWNGECNSvnZdrr41Sp
 2niTh4t86LS9qT4h7370HvbQRHKW+Cgak2ZsxuWweBNXireqhPCt8LLmw
 z9f6hGdCiitlg9F+9xqKuNdiU61Rqb/TIXJ6dOGYI2+ulqwtAF8ibk/S4
 ca2KyaP/FHqiCu7PpaRlboJGKQhnAXNZGTh1hmUc1uc0IRxpzdbWQFYWY Q==;
X-CSE-ConnectionGUID: Wn82M9TLSbek/UIaSBQeaw==
X-CSE-MsgGUID: zXucnA84S7iT/mQRSekU+A==
X-IronPort-AV: E=McAfee;i="6700,10204,11274"; a="44704953"
X-IronPort-AV: E=Sophos;i="6.12,202,1728975600"; d="scan'208";a="44704953"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Dec 2024 07:44:44 -0800
X-CSE-ConnectionGUID: or46eqjzQZOl6jD30d8OWg==
X-CSE-MsgGUID: r4Kg0rIORECjMyhyFlpI2w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,202,1728975600"; d="scan'208";a="93046344"
Received: from slindbla-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.246.77])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Dec 2024 07:44:41 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: Maxime Ripard <mripard@kernel.org>
Cc: Imre Deak <imre.deak@intel.com>, intel-gfx@lists.freedesktop.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann
 <tzimmermann@suse.de>, Dave Airlie <airlied@redhat.com>, Daniel Vetter
 <daniel.vetter@ffwll.ch>, dri-devel@lists.freedesktop.org, Rodrigo Vivi
 <rodrigo.vivi@intel.com>
Subject: Re: [PATCH v2 1/4] drm/dp: Add a way to init/add a connector in
 separate steps
In-Reply-To: <20241202-accurate-jolly-hornet-8c2ca0@houat>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20241126161859.1858058-1-imre.deak@intel.com>
 <20241126161859.1858058-2-imre.deak@intel.com>
 <Z0nO-bwpbWPVryd6@ideak-desk.fi.intel.com>
 <20241129-wild-cobra-of-thunder-829d1f@houat>
 <Z0nn0VzawSCdOCKY@ideak-desk.fi.intel.com>
 <20241202-real-benevolent-skunk-a9f5e0@houat> <87ldwy5lvb.fsf@intel.com>
 <20241202-accurate-jolly-hornet-8c2ca0@houat>
Date: Mon, 02 Dec 2024 17:44:27 +0200
Message-ID: <87bjxu5btw.fsf@intel.com>
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
> On Mon, Dec 02, 2024 at 02:07:36PM +0200, Jani Nikula wrote:
>> On Mon, 02 Dec 2024, Maxime Ripard <mripard@kernel.org> wrote:
>> > It's not about whether we have a problem or not: you introduce new
>> > framework functions, you need to have kunit tests to check their
>> > behaviour.
>> 
>> I don't fundamentally disagree with that goal,
>
> You don't really have to agree. You asked for my review, you have it.
>
>> but it does seem like a pretty drastic policy change. I don't recall a
>> discussion where we made that decision, nor can I find any
>> documentation stating this. Or what exactly the requirement is; it's
>> totally unclear to me.
>
> There isn't, because there's no such policy, even though it's definitely
> something I'd like. This situation is different though:
> drm_connector_init is already a function that is being tested. It seems
> natural to not dilute testing when adding new variant, disregarding what
> the policy of the rest of the framework is.

"You do X, you need do have Y" coming from a maintainer sure sounded
like hard rules. I was surprised.

>> It's super tempting for people to just get their jobs done. If doing
>> the right thing adds yet another hurdle, we may see more stuff being
>> added in drivers instead of drm core.
>
> I really enjoy hidden threats.

None were implied. That's your interpretation of what I honestly think
is a plausible outcome. I try to push people towards contributing to drm
core instead of drivers, and it's not always easy as it is. It's just a
guess, but I'll bet the majority of drm contributors have never run
kunit tests themselves.

> And it's not like i915 is a great example there.

Sincerely, is this the level of discussion we really want to have?


BR,
Jani.


-- 
Jani Nikula, Intel
