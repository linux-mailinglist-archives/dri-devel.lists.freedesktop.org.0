Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kAJJAf5doWmksQQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 27 Feb 2026 10:03:58 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 14DFF1B4E22
	for <lists+dri-devel@lfdr.de>; Fri, 27 Feb 2026 10:03:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 20DAA10EA77;
	Fri, 27 Feb 2026 09:03:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="PxrugUa8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 693C710EA6C
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Feb 2026 09:03:53 +0000 (UTC)
Received: from smtp202.mailbox.org (smtp202.mailbox.org [10.196.197.202])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4fMj6t0sqyz9vL3;
 Fri, 27 Feb 2026 10:03:50 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; 
 t=1772183030; h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/NXjcTkuD3aRbR7gfflMrcpfLEtYsWBoih2zwblvwN8=;
 b=PxrugUa8rAdV5Nx4yO8oy9Fhh7oKpMVEX8d9kesky03rbf4WbhqrLzqnkX8Ui7uNgIBCJC
 YAJWvK4iCDxUV5F0flGVKKyYSpAhm3eRWLMOdGoMC2GakqGFnRRhDPx6KlFVC+y/w2pb++
 Xd7x6X6z6//B+GTClPA3GSsPongzkkSAEcP6nG4HiRmaNIDwiv9v49/v+MEs7b5PC81EZI
 oMc6YLzPLXHMJCCh9KgXqsQHm7iH6Ta/Ekj5H0L8OM1IsRxD9BEtwtZkCeCF4I/stWX3si
 /vv+GKtrKnBqDMT0ZnPPT/3Ny/Az6IL0gl8fSUtrNAd2dxwwCAL0BWWQ1g91Wg==
Message-ID: <322d889e904b8f8f1cf348ef847cd30c0ff8bbe6.camel@mailbox.org>
Subject: Re: [PATCH] drm/sched: Remove racy hack from drm_sched_fini()
From: Philipp Stanner <phasta@mailbox.org>
To: Danilo Krummrich <dakr@kernel.org>, Philipp Stanner <phasta@kernel.org>
Cc: Matthew Brost <matthew.brost@intel.com>, Christian
 =?ISO-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Date: Fri, 27 Feb 2026 10:03:46 +0100
In-Reply-To: <DGHAX6G7ZROR.2244FXWGESPNH@kernel.org>
References: <20260108083019.63532-2-phasta@kernel.org>
 <DGHAX6G7ZROR.2244FXWGESPNH@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MBO-RS-META: gi6y8c4ccn9zuma9b5gbwy9o66ycdm77
X-MBO-RS-ID: 1735c179929255b0358
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
Reply-To: phasta@kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.19 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[mailbox.org,reject];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[mailbox.org:s=mail20150812];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:dakr@kernel.org,m:phasta@kernel.org,m:matthew.brost@intel.com,m:ckoenig.leichtzumerken@gmail.com,m:linux-kernel@vger.kernel.org,m:ckoenigleichtzumerken@gmail.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	REPLYTO_DOM_EQ_TO_DOM(0.00)[];
	FORGED_SENDER(0.00)[phasta@mailbox.org,dri-devel-bounces@lists.freedesktop.org];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	FROM_HAS_DN(0.00)[];
	HAS_REPLYTO(0.00)[phasta@kernel.org];
	NEURAL_HAM(-0.00)[-0.992];
	MID_RHS_MATCH_FROM(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[phasta@mailbox.org,dri-devel-bounces@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FREEMAIL_CC(0.00)[intel.com,gmail.com,lists.freedesktop.org,vger.kernel.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DKIM_TRACE(0.00)[mailbox.org:+];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6]
X-Rspamd-Queue-Id: 14DFF1B4E22
X-Rspamd-Action: no action

On Tue, 2026-02-17 at 15:20 +0100, Danilo Krummrich wrote:
> On Thu Jan 8, 2026 at 9:30 AM CET, Philipp Stanner wrote:
> > drm_sched_fini() contained a hack to work around a race in amdgpu.
> > According to AMD, the hack should not be necessary anymore. In case
> > there should have been undetected users,
> >=20
> > commit 975ca62a014c ("drm/sched: Add warning for removing hack in drm_s=
ched_fini()")
> >=20
> > had added a warning one release cycle ago.
> >=20
> > Thus, it can be derived that the hack can be savely removed by now.
> >=20
> > Remove the hack.
> >=20
> > Signed-off-by: Philipp Stanner <phasta@kernel.org>
>=20
> Acked-by: Danilo Krummrich <dakr@kernel.org>

Pushed to drm-misc-next, thx.

P.
