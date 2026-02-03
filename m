Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EFaKAOBrgmlkUAMAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 03 Feb 2026 22:42:56 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 537E0DEE95
	for <lists+dri-devel@lfdr.de>; Tue, 03 Feb 2026 22:42:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1438E10E274;
	Tue,  3 Feb 2026 21:42:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="DpU4g0kC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E6F7B10E274
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Feb 2026 21:42:50 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 019B660129;
 Tue,  3 Feb 2026 21:42:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 66DF6C116D0;
 Tue,  3 Feb 2026 21:42:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1770154969;
 bh=oqPMzGAG5KMEHrIwKA5YTd8Lbt2oI10dM6i5k6UVFrc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=DpU4g0kCw9ey7GmcmscShGofjjBh5MW+swf4E9UnuZQutdAaLEElQ/oqVZ3ek5CtI
 Ko8BaTF94AbDdBgm1pyTTJ3dpp4+Rhj7keIEPwnYWeLGeXJdMJIyrXOzp+9v7F6YGP
 n863B4T/CqepDiUbToyBdIWWTPqHXES33pqjY2dAy2lo1q2hr9VEPC+6BuydEMNg9x
 sBxA04jYMluuU2tM2RBCXFZ0ecacv8DQbzHkHJQKOboJhvg1foqMmpke4zX1n7QM7+
 zEQmT92cQGByeD6vrwIbKRi0iGS1mByRpl/CjJyp8iA16yZYPaNoVLzjVTuSI9uCDa
 AbtfMP6gE0sfA==
Date: Tue, 3 Feb 2026 15:42:46 -0600
From: Bjorn Andersson <andersson@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Jianping <jianping.li@oss.qualcomm.com>, srini@kernel.org, 
 amahesh@qti.qualcomm.com, arnd@arndb.de, gregkh@linuxfoundation.org, 
 linux-arm-msm@vger.kernel.org, thierry.escande@linaro.org, abelvesa@kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 quic_chennak@quicinc.com, Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
Subject: Re: [PATCH v2 4/4] misc: fastrpc: Allocate entire reserved memory
 for Audio PD in probe
Message-ID: <4hnmij6jufkomwlb47fgg7ahwsjkamkaqx6h2t5cxoshfcdlpr@uh6n5tqofxdo>
References: <20260115082851.570-1-jianping.li@oss.qualcomm.com>
 <20260115082851.570-5-jianping.li@oss.qualcomm.com>
 <ewiz36hwffy4egxpm7z3icvk4vd4fp7ktnny2vyiuzcsmzft5x@nsfvnpip26nd>
 <3ba77da6-4a43-4e2b-b4d6-3d58c403ca0e@oss.qualcomm.com>
 <pm7lequ6lqrgu3mloytfph5opz6aynaa4ag6uedc62fprpskoz@qqvonfthnk6n>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <pm7lequ6lqrgu3mloytfph5opz6aynaa4ag6uedc62fprpskoz@qqvonfthnk6n>
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
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:dmitry.baryshkov@oss.qualcomm.com,m:jianping.li@oss.qualcomm.com,m:srini@kernel.org,m:amahesh@qti.qualcomm.com,m:arnd@arndb.de,m:gregkh@linuxfoundation.org,m:linux-arm-msm@vger.kernel.org,m:thierry.escande@linaro.org,m:abelvesa@kernel.org,m:linux-kernel@vger.kernel.org,m:quic_chennak@quicinc.com,m:ekansh.gupta@oss.qualcomm.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[andersson@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[andersson@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[dri-devel];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 537E0DEE95
X-Rspamd-Action: no action

On Tue, Feb 03, 2026 at 11:19:39PM +0200, Dmitry Baryshkov wrote:
> On Mon, Feb 02, 2026 at 03:06:59PM +0800, Jianping wrote:
> > 
> > 
> > On 1/16/2026 4:49 AM, Dmitry Baryshkov wrote:
> > > On Thu, Jan 15, 2026 at 04:28:51PM +0800, Jianping Li wrote:
> > > > The entire reserved-memory region is now assigned to DSP VMIDs during
> > > > channel setup and stored in cctx->remote_heap. Memory is reclaimed in
> > > > rpmsg_remove by revoking DSP permissions and freeing the buffer, tying
> > > > heap lifecycle to the rpmsg channel.
> > > 
> > > > @@ -1370,8 +1346,15 @@ static int fastrpc_init_create_static_process(struct fastrpc_user *fl,
> > > >   	args[1].length = inbuf.namelen;
> > > >   	args[1].fd = -1;
> > > > -	pages[0].addr = fl->cctx->remote_heap->dma_addr;
> > > > -	pages[0].size = fl->cctx->remote_heap->size;
> > > > +	if (!fl->cctx->audio_init_mem) {
> > > > +		pages[0].addr = fl->cctx->remote_heap->dma_addr;
> > > > +		pages[0].size = fl->cctx->remote_heap->size;
> > > 
> > > Do we need a flag? Can't we assume that remote_heap is always to be
> > > allocated to the PD?
> > We do need the audio_init_mem flag.
> > Once the PD starts and daemon takes the memory for the first time, PD will
> > start using the memory,
> > meanwhile, the daemon can be killed and restarted. In this case, the memory
> > is still with the PD and the next
> > daemon connection should not take any memory for the next request. This flag
> > is maintained to ensure that.
> > The memory needs to be resent only if Audio PD on DSP restarts(due to
> > PD-restart or Subsystem-restart)
> 
> This needs to be explained in the changelog.
> 

Not in the "changelog", in the commit message.


@Jianping please read https://docs.kernel.org/process/submitting-patches.html#describe-your-changes 

Your commit messages should "Describe your problem". From this
description it should be clear why the change is needed and why the
change is done in the specific way.

Regards,
Bjorn

> > 
> > > 
> > > > +		fl->cctx->audio_init_mem = true;
> 
> What if there are two racing IOCTLs, trying to init AudioPD process?
> 
> > > > +		inbuf.pageslen = 1;
> > > > +	} else {
> > > > +		pages[0].addr = 0;
> > > > +		pages[0].size = 0;
> > > > +	}
> > > >   	args[2].ptr = (u64)(uintptr_t) pages;
> > > >   	args[2].length = sizeof(*pages);
> 
> -- 
> With best wishes
> Dmitry
> 
