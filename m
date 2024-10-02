Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 90F4598D2CB
	for <lists+dri-devel@lfdr.de>; Wed,  2 Oct 2024 14:10:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 41DD210E341;
	Wed,  2 Oct 2024 12:10:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hATPXc+K";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3097010E341;
 Wed,  2 Oct 2024 12:10:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727871021; x=1759407021;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=ljppMGga7HHIaQ2C8q5qgGTYYrsqjXivx9zFiKpi1Xc=;
 b=hATPXc+KFWhRVbs2lq1a+9EMWswbx/Xmz765FCGa2bvcGcSfCZSPffqt
 EwxBSZ3IRxEanvZ10NV7hvEXiv0iOmtPmNILai3HJriWMhESBRqH0yJMJ
 fmQDNb3ZuEi5hmxvPlt+nSYQZK1vwlthPRKNLRyOy3oIczDyhKvYz8WvW
 8fE8qy2emc1owpdFzUJPApAyFK8yz2QrQ0H7FXd/sljcN0CA00tJTZ6gz
 1j9dToY9R2mQZxtDEXIgj9hJJ7OfeHGl1QZ5L8xOwp/yCYfVXZPY5888N
 JwLTMNzY2tL6bmdY4ytKb3EUjUbtDAH2S9FJu+IsNXieEqanWobwFj9Aa g==;
X-CSE-ConnectionGUID: hxnwAT57RNO5pCk3hEv23A==
X-CSE-MsgGUID: I9C3cQhARCKc/BR5kafTQg==
X-IronPort-AV: E=McAfee;i="6700,10204,11213"; a="26912783"
X-IronPort-AV: E=Sophos;i="6.11,171,1725346800"; d="scan'208";a="26912783"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Oct 2024 05:10:21 -0700
X-CSE-ConnectionGUID: 6h9jxrIfR5qBHBWf0Vt0xA==
X-CSE-MsgGUID: 8VKf2UCkT2aBHxkgKrBLxA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,171,1725346800"; d="scan'208";a="73573394"
Received: from lbogdanm-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.246.49])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Oct 2024 05:10:17 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Maxime Ripard <mripard@kernel.org>, Simona Vetter <simona.vetter@ffwll.ch>
Cc: Guenter Roeck <linux@roeck-us.net>, dri-devel@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, Carlos Eduardo Gallo Filho
 <gcarlos@disroot.org>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann
 <tzimmermann@suse.de>, Jeff Johnson <quic_jjohnson@quicinc.com>
Subject: Re: [PATCH 0/2] drm: revert some framebuffer API tests
In-Reply-To: <20240925-fresh-artichoke-boa-1a673f@houat>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <cover.1726594684.git.jani.nikula@intel.com>
 <ZvKPJGQyZmdWNOmd@phenom.ffwll.local>
 <20240924-refined-nocturnal-starfish-2947b8@houat>
 <f3f8bec1-884b-46ac-82a6-6e5cb8840146@roeck-us.net>
 <20240924-handsome-labrador-of-shopping-b1dce5@houat>
 <4accd038-9624-43de-96ad-7ecd0876b607@roeck-us.net>
 <ZvP5YhON49Z5TMI7@phenom.ffwll.local>
 <20240925-fresh-artichoke-boa-1a673f@houat>
Date: Wed, 02 Oct 2024 15:10:14 +0300
Message-ID: <877caqu2mx.fsf@intel.com>
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

On Wed, 25 Sep 2024, Maxime Ripard <mripard@kernel.org> wrote:
> On Wed, Sep 25, 2024 at 01:52:02PM GMT, Simona Vetter wrote:
>> I think for at least drm the consensus is clear, we won't have kunit tests
>> that splat.
>
> Where was that ever discussed?

Well, where was it ever agreed that it's okay for drm kunit tests to
emit warnings? :p

>> Personally I really don't see the point of unit tests that are
>> somewhere between unecessarily hard or outright too much pain to
>> deploy in a test rig: Either you don't run them (not great), or you
>> filter splats and might filter too much (not great either) or you
>> filter as little as possible and fight false positives (also kinda
>> suboptimal).
>
> Or you don't do any of that, and just rely on the canonical way to run
> kunit test and trust it's going to pass tests that do indeed pass, and
> fail / warn on those that don't.

That still doesn't address code being tested emitting *unexpected*
warnings.


BR,
Jani.


-- 
Jani Nikula, Intel
