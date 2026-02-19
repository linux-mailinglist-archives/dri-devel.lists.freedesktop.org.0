Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iJt+A77wlmlwrQIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 19 Feb 2026 12:15:10 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 882C015E349
	for <lists+dri-devel@lfdr.de>; Thu, 19 Feb 2026 12:15:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B12F210E6C6;
	Thu, 19 Feb 2026 11:15:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Ks3Wx294";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B82110E6C6;
 Thu, 19 Feb 2026 11:15:04 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id A364260054;
 Thu, 19 Feb 2026 11:15:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BBFB6C4CEF7;
 Thu, 19 Feb 2026 11:15:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1771499703;
 bh=5Owo9mIkJvWFX+NJb1WBa2mVOhdA3oziuI1G2bBFMIk=;
 h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
 b=Ks3Wx294fD9NMfSfgvoo6TvCmHHC/VF6amnW/Q1Mznd9OubccXYOar7bLYYsNaby1
 ED8j+xPS6YsBgT86Dx1wmqiAQ5Am7o45RhumotnE3sWMc/3PZ76zyaSCC08i5yJGsy
 7e7ex3QPk+bLg6YzH9oaMhNpw+KgGuF9klAxDyTrYDplKHS435kRqTpF1A04NNrILy
 TzNQNXEps0AmovyA7/7AtBDraPsM9J60+QDboVE9BzSrp6AfWFfSweiYM6CkiDac1p
 5VE2G/a1f7nPmR57sQfCuY2yaWf/BgwAfepK29dG0vZstaC6yLiWuscJJml+gFtAKT
 DhZCqKyrZd1RQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 19 Feb 2026 12:14:59 +0100
Message-Id: <DGIW8FA844O0.3AWFSWJRVZSXR@kernel.org>
Subject: Re: [PATCH v2] gpu: Fix uninitialized buddy for built-in drivers
Cc: "Koen Koning" <koen.koning@linux.intel.com>,
 <dri-devel@lists.freedesktop.org>, "Joel Fernandes"
 <joelagnelf@nvidia.com>, "Dave Airlie" <airlied@redhat.com>,
 <intel-xe@lists.freedesktop.org>, "Peter Senna Tschudin"
 <peter.senna@linux.intel.com>, "dri-devel"
 <dri-devel-bounces@lists.freedesktop.org>
To: "Matthew Auld" <matthew.auld@intel.com>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260213152047.179628-1-koen.koning@linux.intel.com>
 <20260216111902.110286-1-koen.koning@linux.intel.com>
 <DGIUZHKY84DC.W1UXLGE5HDIS@kernel.org>
 <318f1dcc-bc95-473e-bdb3-7ea03708395c@intel.com>
In-Reply-To: <318f1dcc-bc95-473e-bdb3-7ea03708395c@intel.com>
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,nvidia.com:email]
X-Rspamd-Queue-Id: 882C015E349
X-Rspamd-Action: no action

On Thu Feb 19, 2026 at 11:38 AM CET, Matthew Auld wrote:
> On 19/02/2026 10:16, Danilo Krummrich wrote:
>> On Mon Feb 16, 2026 at 12:19 PM CET, Koen Koning wrote:
>>> Use subsys_initcall instead of module_init for the GPU buddy allocator,
>>> so its initialization code runs before any gpu drivers.
>>> Otherwise, a built-in driver that tries to use the buddy allocator will
>>> run into a kernel NULL pointer dereference because slab_blocks is
>>> uninitialized.
>>>
>>> Specifically, this fixes drm/xe (as built-in) running into a kernel
>>> panic during boot, because it uses buddy during device probe.
>>=20
>> I just noticed that this patch was sent twice, and I posted my feedback =
on [1]
>> -- pasting it here as well.
>>=20
>>> Fixes: ba110db8e1bc ("gpu: Move DRM buddy allocator one level up (part =
two)")
>>=20
>> This Fixes: tag seems wrong. How is this code move related to this probl=
em?
>
> This popped up as a very recent regression for us internally. It looks=20
> like it worked before since link order ensured drm_buddy came before all=
=20
> the driver code. With above commit the link order changed and became=20
> drm/ and then buddy. See [1] also, which is maybe clearer to see this.

I see, I think this would be a good hint for the commit message. :)

However, I think it was never meant to rely on a build system implementatio=
n
detail, nor would this be correct. So, I think this should add both Fixes: =
tags.

Whether it should be backported is a different question though, as it seems=
 to
work by accident in previous versions, i.e. it is only a "potential bug".

My personal opinion is that it should be backported either way, however tha=
t's
ultimately up to the stable team.

- Danilo

>
> [1]=20
> https://lore.kernel.org/intel-xe/20260213152047.179628-1-koen.koning@linu=
x.intel.com/
>
>>=20
>> This should rather be:
>>=20
>> Fixes: 6387a3c4b0c4 ("drm: move the buddy allocator from i915 into commo=
n drm")
>>=20
>> Also, please add:
>>=20
>> Cc: stable@vger.kernel.org
>>=20
>>> Cc: Joel Fernandes <joelagnelf@nvidia.com>
>>> Cc: Dave Airlie <airlied@redhat.com>
>>> Cc: intel-xe@lists.freedesktop.org
>>> Cc: Peter Senna Tschudin <peter.senna@linux.intel.com>
>>> Cc: Matthew Auld <matthew.auld@intel.com>
>>> Signed-off-by: Koen Koning <koen.koning@linux.intel.com>
>>=20
>> [1] https://lore.kernel.org/all/DGIUUFLC31D5.2OZBF5FWQJWMZ@kernel.org/

