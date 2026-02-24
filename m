Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oMlFGZWUnWnKQgQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 24 Feb 2026 13:07:49 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 16B04186B8E
	for <lists+dri-devel@lfdr.de>; Tue, 24 Feb 2026 13:07:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E39B10E28D;
	Tue, 24 Feb 2026 12:07:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DjKIgk58";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1979110E57B;
 Tue, 24 Feb 2026 12:07:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771934862; x=1803470862;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=/OcOQk2oMDzkyMxm6+Tl3gJyTTnWkvUgbDbcQuCM94M=;
 b=DjKIgk58posTioeTbgrPDsL+fneIKdyxydSjlIShoK+fP9OjckVmuOk5
 0ZP7zoResXJeMD4kpcKoao5RIPUcVd0z6ETpvai7ugZ7gVxVufWKOursK
 uwD2Boi+xt00h/HxgfRFxOpC3wCT5pfgEeSjG3osRBU8TqOoMRKf9Gppj
 zlUoJSahr7oC5i8bdtkVsbp3Y28l0BHLTGndHsJbtsxysbKPsU95WkQYX
 SqunsXl/LBjFtMw5mKGc3I6VJhYfXTeGazJ9h9aa9jTDwlh9nPBRtQC7s
 QmdnKcWygDvT3kz6l0zlV3YLa+FHMgx+je7bmo+bC3QME2+0q2LsMPRJ2 g==;
X-CSE-ConnectionGUID: HMQpTogqRq2kAFd6lvtt0g==
X-CSE-MsgGUID: d8MLemKtS9GcO15EdizbVw==
X-IronPort-AV: E=McAfee;i="6800,10657,11710"; a="60522553"
X-IronPort-AV: E=Sophos;i="6.21,308,1763452800"; d="scan'208";a="60522553"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2026 04:07:42 -0800
X-CSE-ConnectionGUID: YSx4KmV+QYyFfK7F7GsftA==
X-CSE-MsgGUID: z1zvR7+XTzOZp4g0CqRNAg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,308,1763452800"; d="scan'208";a="246462074"
Received: from ettammin-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.246.20])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2026 04:07:35 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: "Murthy, Arun R" <arun.r.murthy@intel.com>, Ville =?utf-8?B?U3lyasOk?=
 =?utf-8?B?bMOk?= <ville.syrjala@linux.intel.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David
 Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Rodrigo Vivi
 <rodrigo.vivi@intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>,
 xaver.hugl@kde.org, harry.wentland@amd.com, uma.shankar@intel.com,
 louis.chauvet@bootlin.com, naveen1.kumar@intel.com,
 ramya.krishna.yella@intel.com, dri-devel@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org, Suraj
 Kandpal <suraj.kandpal@intel.com>
Subject: Re: [PATCH v10 0/7] User readable error codes on atomic_ioctl failure
In-Reply-To: <1a39b9d5-ed57-4f6b-a4e2-9e26a2734c32@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260223-atomic-v10-0-f59c8def2e70@intel.com>
 <1a4462b8-def9-4474-8382-6e99b7c8276d@intel.com>
 <aZ1OIDsVfFvyHUK5@intel.com>
 <5f04b5f1-744e-449e-9a45-00fd477256fc@intel.com>
 <aZ1lbnop84k4du6N@intel.com>
 <f155fae0285684108e92887e963358ea0ea158e9@intel.com>
 <1a39b9d5-ed57-4f6b-a4e2-9e26a2734c32@intel.com>
Date: Tue, 24 Feb 2026 14:07:32 +0200
Message-ID: <21d7edcec1b6fd767b066de4ec6734cea8992904@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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
X-Spamd-Result: default: False [-0.31 / 15.00];
	MID_RHS_MATCH_TO(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	ARC_NA(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	FREEMAIL_CC(0.00)[linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,intel.com,ursulin.net,kde.org,amd.com,bootlin.com,lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[20];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[jani.nikula@linux.intel.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:mid,intel.com:dkim,intel.com:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 16B04186B8E
X-Rspamd-Action: no action

On Tue, 24 Feb 2026, "Murthy, Arun R" <arun.r.murthy@intel.com> wrote:
> On 24-02-2026 14:58, Jani Nikula wrote:
>> On Tue, 24 Feb 2026, Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.=
com> wrote:
>>> Although I kinda doubt its actual usefulness to drive useful
>>> fallback logic because often the restrictions might be a combination
>>> of many things, and the kernel can only realistically report one of
>>> those things.
>> Yeah, this is my main concern as well. The drivers will have to bail out
>> on the first issue they hit, whatever it is. The drivers may choose to
>> do the checks in different orders, resulting in different failure modes
>> for different drivers. And finally, accidentally making the order of the
>> checks part of the ABI contract is a scary prospect. Imagine user space
>> depending on certain checks happening first in order for the fallback
>> logic to work properly. Is it a kernel regression to change the order of
>> the checks then?
> We are just reporting the 1st error that we see in the KMD and return=20
> from there.

Yes. But we can't guarantee all drivers will report the *same* first
error in the same circumstances. We can't guarantee we will maintain the
*same* first error over time, we can't make that promise without
painting ourselves in the corner wrt driver maintenance.

BR,
Jani.

--=20
Jani Nikula, Intel
