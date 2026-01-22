Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yKakGbnwcWlKZwAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 22 Jan 2026 10:41:13 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BD7764AD3
	for <lists+dri-devel@lfdr.de>; Thu, 22 Jan 2026 10:41:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC7DB10E977;
	Thu, 22 Jan 2026 09:41:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="SIPtWEcK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B07DC10E96E;
 Thu, 22 Jan 2026 09:41:08 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id CC1CC600CB;
 Thu, 22 Jan 2026 09:41:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 789EFC116C6;
 Thu, 22 Jan 2026 09:41:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1769074867;
 bh=ULYW/RP0yu7Z99OE1vPmkiwP012bx0rlTW+FCdIDYmc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=SIPtWEcKNGS0u07v7qFDECVGvCyv6rnxV6zPa5z35e5MkBSDph9xXnxhQEcOtZgWX
 Jh2L561z4a8Eb9zXxgdha2KZPD/bVH8bRD8YYQVICHZ35W/rGQCZv13UmQqN+Q2mJ0
 +ZUJzyQPH8u7Sd0RkGIaY6w7zwXVTB9k77ChA0ciApSBDWnb/Y8g5C9kOM5ysua9TH
 fGrZLDTiXxAzczZnc8shj6Ig4r6ipMWehlkbVohJcjNBs6yS1h07XZG8VmWgPpZVQc
 +McUT7glVR8tz8o10wtWBm225RKY73eZMjI99lY3tMAWJ7m/C4xllU2OSlypEWZdVC
 nre+DhGxBEhug==
Received: from johan by xi.lan with local (Exim 4.98.2)
 (envelope-from <johan@kernel.org>) id 1virBW-000000003RU-2WW7;
 Thu, 22 Jan 2026 10:41:02 +0100
Date: Thu, 22 Jan 2026 10:41:02 +0100
From: Johan Hovold <johan@kernel.org>
To: Rob Clark <rob.clark@oss.qualcomm.com>
Cc: Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>,
 Akhil P Oommen <akhilpo@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Bjorn Andersson <andersson@kernel.org>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Subject: Re: [PATCH] drm/msm/a6xx: fix bogus hwcg register updates
Message-ID: <aXHwrnMS2aj_PYRj@hovoldconsulting.com>
References: <20251221164552.19990-1-johan@kernel.org>
 <aWdaLF_A5fghNZhN@hovoldconsulting.com>
 <aXDt6v_iO4EFCqyw@hovoldconsulting.com>
 <CACSVV039g9CcAKhtMAwn=hH4hMT2nV77vxiasgUSFF-sn=+JgA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CACSVV039g9CcAKhtMAwn=hH4hMT2nV77vxiasgUSFF-sn=+JgA@mail.gmail.com>
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
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[poorly.run,kernel.org,oss.qualcomm.com,linux.dev,gmail.com,somainline.org,vger.kernel.org,lists.freedesktop.org,ffwll.ch];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[johan@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 1BD7764AD3
X-Rspamd-Action: no action

[ +CC: Dave and Simona ]

On Wed, Jan 21, 2026 at 08:59:51AM -0800, Rob Clark wrote:
> On Wed, Jan 21, 2026 at 7:17 AM Johan Hovold <johan@kernel.org> wrote:
> >
> > On Wed, Jan 14, 2026 at 09:56:12AM +0100, Johan Hovold wrote:
> > > On Sun, Dec 21, 2025 at 05:45:52PM +0100, Johan Hovold wrote:
> > > > The hw clock gating register sequence consists of register value pairs
> > > > that are written to the GPU during initialisation.
> > > >
> > > > The a690 hwcg sequence has two GMU registers in it that used to amount
> > > > to random writes in the GPU mapping, but since commit 188db3d7fe66
> > > > ("drm/msm/a6xx: Rebase GMU register offsets") they trigger a fault as
> > > > the updated offsets now lie outside the mapping. This in turn breaks
> > > > boot of machines like the Lenovo ThinkPad X13s.
> > > >
> > > > Note that the updates of these GMU registers is already taken care of
> > > > properly since commit 40c297eb245b ("drm/msm/a6xx: Set GMU CGC
> > > > properties on a6xx too"), but for some reason these two entries were
> > > > left in the table.
> > > >
> > > > Fixes: 5e7665b5e484 ("drm/msm/adreno: Add Adreno A690 support")
> > > > Cc: stable@vger.kernel.org  # 6.5
> > > > Cc: Bjorn Andersson <andersson@kernel.org>
> > > > Cc: Konrad Dybcio <konradybcio@kernel.org>
> > > > Signed-off-by: Johan Hovold <johan@kernel.org>
> > > > ---
> > >
> > > This one does not seem to have been applied yet despite fixing a
> > > critical regression in 6.19-rc1. I guess I could have highlighted that
> > > further by also including:
> > >
> > > Fixes: 188db3d7fe66 ("drm/msm/a6xx: Rebase GMU register offsets")
> > >
> > > I realise some delays are expected around Christmas, but can you please
> > > try to get this fix to Linus now that everyone should be back again?
> >
> > I haven't received any reply so was going to send another reminder, but
> > I noticed now that this patch was merged to the msm-next branch last
> > week.
> >
> > Since it fixes a regression in 6.19-rc1 it needs to go to Linus this
> > cycle and I would have assumed it should have be merged to msm-fixes.
> >
> > (MSM) DRM works in mysterious ways, so can someone please confirm that
> > this regression fix is heading into mainline for 6.19-final?
> 
> Sorry, mesa 26.0 branchpoint this week so I've not had much time for
> kernel for last few weeks and didn't have time for a 2nd msm-fixes PR.
> But with fixes/cc tags it should be picked into 6.19.y

I'm afraid that's not good enough as this is a *regression* breaking the
display completely on machines like the X13s.

Regression fixes should go to mainline this cycle since we don't
knowingly break users' setups (and force them to debug/bisect when they
update to 6.19 while the fix has been available since before Christmas).

Can't you just send a PR with this single fix? Otherwise, perhaps Dave
or Simona can pick up the fix directly?

Johan
