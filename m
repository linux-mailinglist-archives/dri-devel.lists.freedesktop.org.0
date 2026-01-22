Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IATtIIT0cWmvZwAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 22 Jan 2026 10:57:24 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A32064E4E
	for <lists+dri-devel@lfdr.de>; Thu, 22 Jan 2026 10:57:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 778C510E099;
	Thu, 22 Jan 2026 09:57:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=lankhorst.se header.i=@lankhorst.se header.b="G3R1cvny";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lankhorst.se (lankhorst.se [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A8C5A10E072;
 Thu, 22 Jan 2026 09:57:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lankhorst.se;
 s=default; t=1769075838;
 bh=/JU45qQU/U4TscsqjxZxkKtDMHrjLixZJWT1cZaiL0A=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=G3R1cvnyL1bGjQpCl6dcl91E8HwEW4oRL05F12JqlGHrLwezA7AqN910cwJM1DolE
 DkVDSbssdOrniiG8gv81N93Xd8rYIAYC//NeJYmVyuHP/nL3e+J7xdlxoCCM8yhsIq
 b9krCTDZXZT0/lQaXI4r3Gd57YTfSDOjlnMBqCG1FxoX6RLj5yaZ0z74OaaNsYilLE
 /vGMKPYTy6nor9QDDwoVjNqUTSbuAwNKP/giWqQzO4s9pjGbJHOnSqz/7/EfqfFS9y
 XFTp15mUeqPZy4DpsN7Ym7LIPpw64PUmPVxfJEarG0GBbUfaMASDyEWsW5RnWb9URK
 WBGpYhcpxsYeQ==
Message-ID: <6cfc4132-0a64-4dfc-85e5-122651202269@lankhorst.se>
Date: Thu, 22 Jan 2026 10:57:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 00/13] drm: Color pipeline teardown and follow-up
 fixes/improvements
To: Jani Nikula <jani.nikula@linux.intel.com>,
 Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>,
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 "Deucher, Alexander" <Alexander.Deucher@amd.com>
Cc: harry.wentland@amd.com, louis.chauvet@bootlin.com, mwen@igalia.com,
 contact@emersion.fr, alex.hung@amd.com, daniels@collabora.com,
 uma.shankar@intel.com, suraj.kandpal@intel.com, nfraprado@collabora.com,
 ville.syrjala@linux.intel.com, matthew.d.roper@intel.com
References: <20260113102303.724205-1-chaitanya.kumar.borah@intel.com>
 <513db214e2adcad6a70cea2461b7bfc26c2884db@intel.com>
Content-Language: en-US
From: Maarten Lankhorst <dev@lankhorst.se>
In-Reply-To: <513db214e2adcad6a70cea2461b7bfc26c2884db@intel.com>
Content-Type: text/plain; charset=UTF-8
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.31 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[lankhorst.se,none];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[lankhorst.se:s=default];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	ARC_NA(0.00)[];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCPT_COUNT_TWELVE(0.00)[18];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dev@lankhorst.se,dri-devel-bounces@lists.freedesktop.org];
	TAGGED_RCPT(0.00)[dri-devel];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,intel.com:email];
	DKIM_TRACE(0.00)[lankhorst.se:+]
X-Rspamd-Queue-Id: 5A32064E4E
X-Rspamd-Action: no action

Hey,

Den 2026-01-21 kl. 14:51, skrev Jani Nikula:
> On Tue, 13 Jan 2026, Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com> wrote:
>> This series contains follow-up fixes and improvements for the DRM color
>> pipeline infrastructure that was introduced in v6.19.[1][2]
>>
>> The central handling of clean up of colorop from the mode_config list
>> is missing. While vkms calls drm_colorop_pipeline_destroy() in vkms_destroy(),
>> amd driver calls it only during failure of the init path and i915/xe driver
>> does not call it at all. This means amd and intel leaks these objects on
>> driver removal.
>>
>> This series adds the teardown of mode_config.colorop_list in drm_mode_config_cleanup().
>> Since, i915/xe sub-classes the drm_colorop within intel_colorop it was not enough
>> to just use drm_colorop_pipeline_destroy(). Therefore, this series
>>
>> - Introduces driver-managed destruction for drm_colorop objects and
>>   updates core helpers to use driver-provided destroy callbacks.
>> - Ensures all colorop objects are correctly torn down during
>>   mode_config cleanup and driver removal.
>>
>> In addition to that following changes are made in the series
>> - Fixes enum name lifetime leaks in color pipeline init in i915, amdgpu_dm, and vkms
>> - Corrects the ordering of the 3D LUT block in the i915 plane color pipeline
>> - Refactors i915 plane color pipeline initialization to reliably clean
>>   up partially constructed pipelines on failure.
>>
>> Thanks for taking a look. Feedback is welcome.
> 
> I did not do detailed review, but
> 
> Acked-by: Jani Nikula <jani.nikula@intel.com>
> 
> for merging via drm-misc.
> 
> Please coordinate with drm and drm-misc maintainers on which branch
> these should merged through. IIUC there are memory leak fixes for
> changes heading to v6.19, which speaks for drm-misc-fixes. But is it too
> much at this stage? Up to drm and drm-misc maintainers I think.

I pushed the first 4 patches from this series as they have to be
addressed most urgently. It's a leak affecting each system and
incorrect UAPI being presented for intel/display colorops.

We need to discuss on how to merge patches 5-13. Should we put
it in a topic branch or push it to drm-misc-next-fixes?

Kind regards,
~Maarten Lankhorst
