Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DE0E9848E6
	for <lists+dri-devel@lfdr.de>; Tue, 24 Sep 2024 17:56:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D49E410E2BA;
	Tue, 24 Sep 2024 15:56:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Bnz1SJdl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9BD8510E060;
 Tue, 24 Sep 2024 15:56:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727193409; x=1758729409;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=lrEd6i6i7xgPntzRbEX0QK0P0YV1nArIBR9sQYZmzeo=;
 b=Bnz1SJdlnW63ZhHkJiU94zhwtwUJG99IjfvtgOQyETfKuVd4YGyDVcub
 IsXl8vDuuJnyDh0aPgpukmalJteKG7ji6NUW07640z8uivvD2ITrUJCpV
 DSajizF/dX6P1wZ1Ob/XEXo/yV6gLf4BJ5kJSXb2a79MYmaMAPKwV6sC9
 aU44P8FB4d1XYJKeylvXh6l7fKlWOynAo5i2quVGmeFdHhH+61OahkoaF
 mnC93I1vFS0Z22iK4kAx45F5HHdEBc1iTjV1P88FARnLSioDA4cT3C/sK
 +HH7hGps3/75h6/DU/vB6Bfq8xPQe96SFlHeSfcPV93dHjo1xKV5AXvVt w==;
X-CSE-ConnectionGUID: tljmpSzBRZGdV88YNUI1kw==
X-CSE-MsgGUID: 7WkvNlq4Q3e1V2M21Ry0cA==
X-IronPort-AV: E=McAfee;i="6700,10204,11205"; a="51612160"
X-IronPort-AV: E=Sophos;i="6.10,255,1719903600"; d="scan'208";a="51612160"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Sep 2024 08:56:33 -0700
X-CSE-ConnectionGUID: dZ4aipcrTwCN1P7GFqMi7w==
X-CSE-MsgGUID: +L+2VjvvRruUgDl8uf3dFA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,255,1719903600"; d="scan'208";a="75852164"
Received: from sschumil-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.246.183])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Sep 2024 08:56:30 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Guenter Roeck <linux@roeck-us.net>, Maxime Ripard <mripard@kernel.org>
Cc: Simona Vetter <simona.vetter@ffwll.ch>, dri-devel@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, Carlos Eduardo Gallo Filho
 <gcarlos@disroot.org>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann
 <tzimmermann@suse.de>, Jeff Johnson <quic_jjohnson@quicinc.com>
Subject: Re: [PATCH 0/2] drm: revert some framebuffer API tests
In-Reply-To: <4accd038-9624-43de-96ad-7ecd0876b607@roeck-us.net>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <cover.1726594684.git.jani.nikula@intel.com>
 <ZvKPJGQyZmdWNOmd@phenom.ffwll.local>
 <20240924-refined-nocturnal-starfish-2947b8@houat>
 <f3f8bec1-884b-46ac-82a6-6e5cb8840146@roeck-us.net>
 <20240924-handsome-labrador-of-shopping-b1dce5@houat>
 <4accd038-9624-43de-96ad-7ecd0876b607@roeck-us.net>
Date: Tue, 24 Sep 2024 18:56:26 +0300
Message-ID: <87ed593v11.fsf@intel.com>
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

On Tue, 24 Sep 2024, Guenter Roeck <linux@roeck-us.net> wrote:
>>>> On Tue, Sep 24, 2024 at 12:06:28PM GMT, Simona Vetter wrote:
>>>>> Yeah I think long-term we might want a kunit framework so that we can
>>>>> catch dmesg warnings we expect and test for those, without those warnings
>>>>> actually going to dmesg. Similar to how the lockdep tests also reroute
>>>>> locking validation, so that the expected positive tests don't wreak
>>>>> lockdep for real.
>>>>>
>>>>> But until that exists, we can't have tests that splat in dmesg when they
>>>>> work as intended.
>
> FWIW, that is arguable. More and more tests are added which do add such splats,
> and I don't see any hesitance by developers to adding more. So far I counted
> two alone in this commit window, and that does not include new splats from
> tests which I had already disabled. I simply disable those tests or don't
> enable them in the first place if they are new. I did the same with the drm
> unit tests due to the splats generated by the scaling unit tests, so any
> additional drm unit test splats don't make a difference for me since the
> tests are already disabled.

What's the point of having unit tests that CI systems routinely have to
filter out of test runs? Or filter warnings generated by the tests,
potentially missing new warnings. Who is going to run the tests if the
existing CI systems choose to ignore them?

Automation on a massive scale is key here, and making that harder is
counter-productive.


BR,
Jani.


-- 
Jani Nikula, Intel
