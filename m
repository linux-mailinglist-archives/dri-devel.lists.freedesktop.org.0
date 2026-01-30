Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sKR0Nh7NfGlHOwIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 30 Jan 2026 16:24:14 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B0D1BBBFEC
	for <lists+dri-devel@lfdr.de>; Fri, 30 Jan 2026 16:24:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 18BC010EA0A;
	Fri, 30 Jan 2026 15:24:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="epvsSdVu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 63A5E10E02F;
 Fri, 30 Jan 2026 15:24:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769786650; x=1801322650;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=GVG6h9UxiVPKBf7FR7ftcFkKeNjwmjse+rf2+9R2Trc=;
 b=epvsSdVufYwbmJN4TCJsrUROJuNf4s/mHHzN+gQLT3kLcsn+akVS4A7g
 m01AApomN675Djl8wwXAz9P+v/BAB1oR5oMqrW7yRaEYstSnr9V0fXto9
 VN5qxPmdzKGeChoWhqcakHiXQDQLlGhhWIFwWwOTS0pm8XnM+WWqA6wWT
 EFRZqWS2bpLvKcD/q6R3P5MnYnaRQm4rRoqc+mSy18RluPixz7iOvLJus
 Cxqlzu+yrVPVOiw0DR0EqhYWONgnMlg1vFWvH+7dKAUeAfbLQxqzPcMg8
 QwXg25ZHe7ZWm4mPm7MmJ/8VtAlUp72bRS84TybKFvgMvUIolWRIikQGf w==;
X-CSE-ConnectionGUID: b2GjFm5rTCW0v51xbzHrXw==
X-CSE-MsgGUID: 40FxSB9sRtCd/YcHEWW1Bw==
X-IronPort-AV: E=McAfee;i="6800,10657,11686"; a="73639636"
X-IronPort-AV: E=Sophos;i="6.21,263,1763452800"; d="scan'208";a="73639636"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jan 2026 07:24:10 -0800
X-CSE-ConnectionGUID: JaEgrHpMQ0a376xVz/g1xg==
X-CSE-MsgGUID: wJaL/d4gQkaQ6f9nQ3t9UQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,263,1763452800"; d="scan'208";a="207996639"
Received: from ettammin-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.246.77])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jan 2026 07:24:07 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, Patrik Jakobsson
 <patrik.r.jakobsson@gmail.com>
Cc: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, ville.syrjala@linux.intel.com
Subject: Re: [PATCH 6/6] drm/gma500: use drm_crtc_vblank_crtc()
In-Reply-To: <5aec1964-072c-4335-8f37-35e6efb4910e@suse.de>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <cover.1762513240.git.jani.nikula@intel.com>
 <27b2c6772c68120d0d5ec28477db0d993743e955.1762513240.git.jani.nikula@intel.com>
 <CAMeQTsaU7nS9K=UkQW73L6TS6PBLw26s_-jiOchEyT7dcfz-7Q@mail.gmail.com>
 <5aec1964-072c-4335-8f37-35e6efb4910e@suse.de>
Date: Fri, 30 Jan 2026 17:24:04 +0200
Message-ID: <ee3b272aeab7dd88d2285e9234c75f8c14d8ddad@intel.com>
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[suse.de,gmail.com];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	HAS_ORG_HEADER(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[jani.nikula@intel.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,intel.com:mid,intel.com:dkim,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: B0D1BBBFEC
X-Rspamd-Action: no action

On Fri, 30 Jan 2026, Thomas Zimmermann <tzimmermann@suse.de> wrote:
> This patch breaks the driver with a NULL-ptr oops on startup. This is 
> because the IRQ initialization in gma_irq_install() now uses CRTCs that 
> are only allocated later in psb_modeset_init(). Stack trace is below.
>
> There's a nearby comment about preserving the order of the operations, 
> so I don't dare touching it. But reverting commit d930ffa5d6e8 
> ("drm/gma500: use drm_crtc_vblank_crtc()") resolves the issue.

Thanks for the report. Since we're at -rc7 and there's going to be -rc8,
I think the only reasonable approach at this time is to revert [1].

BR,
Jani.


[1] https://lore.kernel.org/r/20260130151319.31264-1-jani.nikula@intel.com



-- 
Jani Nikula, Intel
