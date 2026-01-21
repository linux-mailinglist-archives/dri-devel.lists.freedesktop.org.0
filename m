Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4ADKLPTtcGk+awAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 21 Jan 2026 16:17:08 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B3855909B
	for <lists+dri-devel@lfdr.de>; Wed, 21 Jan 2026 16:17:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2067B10E7F3;
	Wed, 21 Jan 2026 15:17:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="sLntN/Uz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A41988FB2;
 Wed, 21 Jan 2026 15:17:04 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id EC2554379C;
 Wed, 21 Jan 2026 15:17:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C5D41C4CEF1;
 Wed, 21 Jan 2026 15:17:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1769008623;
 bh=3NufzOOUpRVgTlGEqPb/RONmrOLyphUBqbKNx+dznU8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=sLntN/UzKRS1L5Yxq76njol0e9ptYEOZv4qvwpfqqB4mLYZB9tu1wiRuRCqSuV4i7
 eH7260Y7tRhPKig6RYHI1XwvjmAGnfnyD32E6an1yJHUj2uKzQjB5mFbFV5nXghJ1E
 HiuzdWLPiusGMB7vXcXpQDb+jXZPfU1HVIOiQMYEdNC9k9waRlhJL20yWHXUkg2Is5
 K2AWvb7T2jUETGsZRWNuyXw3/Wf7s+reRTjxXLvh6EC6+Pcx/FEtCFuCqoTj2QIZ3f
 dGiZFVgLv0jSMgBeWqBxtz2jZsZt64ycvwzykCe30kcsN+MG113QsgMhRO28+OSg/h
 Vh+cjnO5IIVNg==
Received: from johan by xi.lan with local (Exim 4.98.2)
 (envelope-from <johan@kernel.org>) id 1viZx4-0000000067K-39Ms;
 Wed, 21 Jan 2026 16:16:59 +0100
Date: Wed, 21 Jan 2026 16:16:58 +0100
From: Johan Hovold <johan@kernel.org>
To: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>
Cc: Konrad Dybcio <konradybcio@kernel.org>,
 Akhil P Oommen <akhilpo@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Bjorn Andersson <andersson@kernel.org>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
Subject: Re: [PATCH] drm/msm/a6xx: fix bogus hwcg register updates
Message-ID: <aXDt6v_iO4EFCqyw@hovoldconsulting.com>
References: <20251221164552.19990-1-johan@kernel.org>
 <aWdaLF_A5fghNZhN@hovoldconsulting.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aWdaLF_A5fghNZhN@hovoldconsulting.com>
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
X-Spamd-Result: default: False [-1.31 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,oss.qualcomm.com,linux.dev,gmail.com,somainline.org,vger.kernel.org,lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo]
X-Rspamd-Queue-Id: 8B3855909B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Jan 14, 2026 at 09:56:12AM +0100, Johan Hovold wrote:
> On Sun, Dec 21, 2025 at 05:45:52PM +0100, Johan Hovold wrote:
> > The hw clock gating register sequence consists of register value pairs
> > that are written to the GPU during initialisation.
> > 
> > The a690 hwcg sequence has two GMU registers in it that used to amount
> > to random writes in the GPU mapping, but since commit 188db3d7fe66
> > ("drm/msm/a6xx: Rebase GMU register offsets") they trigger a fault as
> > the updated offsets now lie outside the mapping. This in turn breaks
> > boot of machines like the Lenovo ThinkPad X13s.
> > 
> > Note that the updates of these GMU registers is already taken care of
> > properly since commit 40c297eb245b ("drm/msm/a6xx: Set GMU CGC
> > properties on a6xx too"), but for some reason these two entries were
> > left in the table.
> > 
> > Fixes: 5e7665b5e484 ("drm/msm/adreno: Add Adreno A690 support")
> > Cc: stable@vger.kernel.org	# 6.5
> > Cc: Bjorn Andersson <andersson@kernel.org>
> > Cc: Konrad Dybcio <konradybcio@kernel.org>
> > Signed-off-by: Johan Hovold <johan@kernel.org>
> > ---
> 
> This one does not seem to have been applied yet despite fixing a
> critical regression in 6.19-rc1. I guess I could have highlighted that
> further by also including:
> 
> Fixes: 188db3d7fe66 ("drm/msm/a6xx: Rebase GMU register offsets")
> 
> I realise some delays are expected around Christmas, but can you please
> try to get this fix to Linus now that everyone should be back again?

I haven't received any reply so was going to send another reminder, but
I noticed now that this patch was merged to the msm-next branch last
week.

Since it fixes a regression in 6.19-rc1 it needs to go to Linus this
cycle and I would have assumed it should have be merged to msm-fixes.

(MSM) DRM works in mysterious ways, so can someone please confirm that
this regression fix is heading into mainline for 6.19-final?

Johan
