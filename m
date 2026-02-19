Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MEKxGEhWl2lPxAIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 19 Feb 2026 19:28:24 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 92EC9161AB9
	for <lists+dri-devel@lfdr.de>; Thu, 19 Feb 2026 19:28:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CCE6F10E730;
	Thu, 19 Feb 2026 18:28:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Q6Ar8GSS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 43E3D10E730;
 Thu, 19 Feb 2026 18:28:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771525700; x=1803061700;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=9+gGLkiGO4nRcgDwQ1w9iawesc3/8VzMeMlgJpn++gQ=;
 b=Q6Ar8GSSGBZixS6ILT9UTuzCiBS0AcgPFuO+0meIc74x6jAX5YOX/Dva
 7Lm1iYmmWcbwDYxO6Ej9zCCAshcEjBj3ri2KM401JCB1RmFVsKO3OtyIk
 yRx8uCYsx8/kiQKqlWGtxr8Ax/QraxF6iNWdT3gdeJ2p/S90cNqBaCr7k
 LB6rRDdJuyigRh+kn6zcyef4RZgFofmoJqk0tvtNk5A9T9cZ00A5tDFFq
 js2/kPAXRUpetPTbq2DOnQfhzeXZjm4hIuG7mV6Rj7Yt5HiZ+yYZDLmo6
 ks89o6uOBp59651/BGJIlmbxhFfmygimwNkwgh6ySVv1tNZKc7RrK/X9P A==;
X-CSE-ConnectionGUID: lup/oRVcSJ2cD0Ned9a4KQ==
X-CSE-MsgGUID: 5sw4sVb9Tfij0yI7Qk8vKw==
X-IronPort-AV: E=McAfee;i="6800,10657,11706"; a="90029872"
X-IronPort-AV: E=Sophos;i="6.21,300,1763452800"; d="scan'208";a="90029872"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Feb 2026 10:28:19 -0800
X-CSE-ConnectionGUID: rkOXWvazQ722rFmGoyj/7w==
X-CSE-MsgGUID: NccRldxVSDGP5p24MWMghw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,300,1763452800"; d="scan'208";a="245196143"
Received: from vpanait-mobl.ger.corp.intel.com ([10.245.244.197])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Feb 2026 10:28:17 -0800
Message-ID: <b8536be7a1fc02191b4cad1b74d6b3ce5e47549f.camel@linux.intel.com>
Subject: Re: [PATCH v2] gpu: Fix uninitialized buddy for built-in drivers
From: Koen Koning <koen.koning@linux.intel.com>
To: Danilo Krummrich <dakr@kernel.org>, Matthew Auld <matthew.auld@intel.com>
Cc: dri-devel@lists.freedesktop.org, Joel Fernandes <joelagnelf@nvidia.com>,
 Dave Airlie <airlied@redhat.com>, intel-xe@lists.freedesktop.org, Peter
 Senna Tschudin	 <peter.senna@linux.intel.com>, dri-devel	
 <dri-devel-bounces@lists.freedesktop.org>
Date: Thu, 19 Feb 2026 19:28:14 +0100
In-Reply-To: <DGIYEDHZTNJL.VJVC0MLJWRN9@kernel.org>
References: <20260213152047.179628-1-koen.koning@linux.intel.com>
 <20260216111902.110286-1-koen.koning@linux.intel.com>
 <DGIUZHKY84DC.W1UXLGE5HDIS@kernel.org>
 <318f1dcc-bc95-473e-bdb3-7ea03708395c@intel.com>
 <DGIW8FA844O0.3AWFSWJRVZSXR@kernel.org>
 <1243e2a5-02bd-4b44-9008-6d18a706e44f@intel.com>
 <DGIYEDHZTNJL.VJVC0MLJWRN9@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0-1ubuntu0.1 
MIME-Version: 1.0
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
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:dkim,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,linux.intel.com:mid];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	MIME_TRACE(0.00)[0:+];
	TAGGED_RCPT(0.00)[dri-devel];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[koen.koning@linux.intel.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	FORGED_SENDER_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+]
X-Rspamd-Queue-Id: 92EC9161AB9
X-Rspamd-Action: no action

On Thu, 2026-02-19 at 13:56 +0100, Danilo Krummrich wrote:
> On Thu Feb 19, 2026 at 1:44 PM CET, Matthew Auld wrote:
> > On 19/02/2026 11:14, Danilo Krummrich wrote:
> > > However, I think it was never meant to rely on a build system
> > > implementation
> > > detail, nor would this be correct. So, I think this should add
> > > both Fixes: tags.
> >=20
> > Yeah, I'm really not sure tbh. From a quick grep there do seem to
> > be=20
> > other users relying on this:
> >=20
> > drm/drm_drv.c:1274:module_init(drm_core_init);
> > drm/scheduler/sched_fence.c:238:module_init(drm_sched_fence_slab_in
> > it);
> >=20
> > The sched one looks identical with the slab thing. Do these need to
> > be=20
> > fixed also?
>=20
> Yes, those should be fixed as well.
>=20
> Also note that module_init() compiles down to device_initcall() when
> built-in,
> i.e. the initcall stage that is mainly for drivers, not for subsystem
> code.
>=20
> Do you want to send a fix for thise as well?

Thanks for your input! The usage in drm_drv.c goes all the way back to
before the git history, so I'm not sure there's a Fixes: tag that would
make sense there. Do you have a recommendation for how to handle that
patch?

Overall, I don't think it makes sense to backport these fixes anyway -
there's no actual issue unless there's some large refactoring (like
what happened with drm/buddy).
