Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GAkSDrlXl2lPxAIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 19 Feb 2026 19:34:33 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BCA41161B77
	for <lists+dri-devel@lfdr.de>; Thu, 19 Feb 2026 19:34:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BFBD110E733;
	Thu, 19 Feb 2026 18:34:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="FrhnlnoN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 71CA610E733;
 Thu, 19 Feb 2026 18:34:28 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 1A37A43FDB;
 Thu, 19 Feb 2026 18:34:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5B842C116D0;
 Thu, 19 Feb 2026 18:34:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1771526067;
 bh=pTWmhIprRiC/ji+HpBxOF8rgPWS7rKyceI9UiXEDUuw=;
 h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
 b=FrhnlnoN6NE8n6+fp1C3TdtJh/xgzratHSBW8ZsjxRuD0kCOg7hUNYU5Zrtlq0ZmP
 8XRG6LbijkbuY8SEeQeyUtMRWLZHN5g9rYxVcLrd3/stWOIs5Y3eVUBLcl8I3HpZ9C
 gd9KDTEjFBkyL1Bp5JqjcXgo/28L76e/VPSTErOwb4X5xslWNWyNpAKYS13+O3KZPx
 9Q+kB81myUhHAp/cMPLUhGfu8Kd3N/e45LVRpMLWTo4/0z3chgc/e4GiqK54qF8Mpu
 TgOrTQ0LGRql2Og77VrfehuDkD4m8uBRCJVPSE2CvX1UAKKjn6uI9EW6ULSP5Cmf5h
 ojseY4kRvCX+Q==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 19 Feb 2026 19:34:24 +0100
Message-Id: <DGJ5KV1HS139.1NGB7NR2XM6JJ@kernel.org>
Subject: Re: [PATCH v2] gpu: Fix uninitialized buddy for built-in drivers
Cc: "Matthew Auld" <matthew.auld@intel.com>,
 <dri-devel@lists.freedesktop.org>, "Joel Fernandes"
 <joelagnelf@nvidia.com>, "Dave Airlie" <airlied@redhat.com>,
 <intel-xe@lists.freedesktop.org>, "Peter Senna Tschudin"
 <peter.senna@linux.intel.com>, "dri-devel"
 <dri-devel-bounces@lists.freedesktop.org>
To: "Koen Koning" <koen.koning@linux.intel.com>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260213152047.179628-1-koen.koning@linux.intel.com>
 <20260216111902.110286-1-koen.koning@linux.intel.com>
 <DGIUZHKY84DC.W1UXLGE5HDIS@kernel.org>
 <318f1dcc-bc95-473e-bdb3-7ea03708395c@intel.com>
 <DGIW8FA844O0.3AWFSWJRVZSXR@kernel.org>
 <1243e2a5-02bd-4b44-9008-6d18a706e44f@intel.com>
 <DGIYEDHZTNJL.VJVC0MLJWRN9@kernel.org>
 <b8536be7a1fc02191b4cad1b74d6b3ce5e47549f.camel@linux.intel.com>
In-Reply-To: <b8536be7a1fc02191b4cad1b74d6b3ce5e47549f.camel@linux.intel.com>
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
X-Spamd-Result: default: False [-0.81 / 15.00];
	MV_CASE(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	MID_RHS_MATCH_FROM(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dakr@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: BCA41161B77
X-Rspamd-Action: no action

On Thu Feb 19, 2026 at 7:28 PM CET, Koen Koning wrote:
> On Thu, 2026-02-19 at 13:56 +0100, Danilo Krummrich wrote:
>> On Thu Feb 19, 2026 at 1:44 PM CET, Matthew Auld wrote:
>> > On 19/02/2026 11:14, Danilo Krummrich wrote:
>> > > However, I think it was never meant to rely on a build system
>> > > implementation
>> > > detail, nor would this be correct. So, I think this should add
>> > > both Fixes: tags.
>> >=20
>> > Yeah, I'm really not sure tbh. From a quick grep there do seem to
>> > be=20
>> > other users relying on this:
>> >=20
>> > drm/drm_drv.c:1274:module_init(drm_core_init);
>> > drm/scheduler/sched_fence.c:238:module_init(drm_sched_fence_slab_in
>> > it);
>> >=20
>> > The sched one looks identical with the slab thing. Do these need to
>> > be=20
>> > fixed also?
>>=20
>> Yes, those should be fixed as well.
>>=20
>> Also note that module_init() compiles down to device_initcall() when
>> built-in,
>> i.e. the initcall stage that is mainly for drivers, not for subsystem
>> code.
>>=20
>> Do you want to send a fix for thise as well?
>
> Thanks for your input! The usage in drm_drv.c goes all the way back to
> before the git history, so I'm not sure there's a Fixes: tag that would
> make sense there. Do you have a recommendation for how to handle that
> patch?
>
> Overall, I don't think it makes sense to backport these fixes anyway -
> there's no actual issue unless there's some large refactoring (like
> what happened with drm/buddy).

It is always possible to Cc: stable without a Fixes: tag and a brief commen=
t.
However, as you say, there was never a report about this actually causing a=
ny
issues. Obviously, it also can't be an issue for OOT modules. So, a "normal=
"
patch with a brief note that this dates back to the historic tree seems to =
be
sufficient.
