Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YPGzHeTgeGkGtwEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 27 Jan 2026 16:59:32 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 034B597436
	for <lists+dri-devel@lfdr.de>; Tue, 27 Jan 2026 16:59:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 69A0C10E078;
	Tue, 27 Jan 2026 15:59:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="T/E/D/dw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8317B10E078
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Jan 2026 15:59:28 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 3836A43822;
 Tue, 27 Jan 2026 15:59:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0ECDFC116C6;
 Tue, 27 Jan 2026 15:59:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1769529568;
 bh=7Kk/UgKEDwgrwdHPW1Qb4FsfRBGa894DRsv61HEBlPo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=T/E/D/dwBt5kVbbO8bwnkCjjkCAq3PpXqmisYsbKBkm0ZcKh81GU73LIt5Zcm4a78
 l5GykXn2JhUe04/5ff9tTKqmUP44V7K3ipY7ELJzk+RmY7SYlStzSa+DrTW7g8wJ0I
 eD287DqKnKscPd2bDn2BC7RZe2bobC34DK1ZEIdoFGSymaks+oKZ4z/+ZGnkzc3VC+
 De4BDYbqW59bLOEoZiydufhmE0E6YFo1dFZLto3cg7ls/ywsFzWzO/b20tJ2SQueYb
 n/cmw+Mdriht+8UqbF3bJuuGkAD9Ma10uqidau23CssVi3zQrf+cKblHMgcmBW0LnL
 bsIO3L35A8C5A==
Received: from johan by xi.lan with local (Exim 4.98.2)
 (envelope-from <johan@kernel.org>) id 1vklTM-00000000754-2PMD;
 Tue, 27 Jan 2026 16:59:20 +0100
Date: Tue, 27 Jan 2026 16:59:20 +0100
From: Johan Hovold <johan@kernel.org>
To: Philipp Zabel <p.zabel@pengutronix.de>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org, imx@lists.linux.dev,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 Frank Li <Frank.Li@nxp.com>
Subject: Re: [PATCH v2] drm/imx/tve: fix probe device leak
Message-ID: <aXjg2C0XeVGEtdDy@hovoldconsulting.com>
References: <20251030163456.15807-1-johan@kernel.org>
 <aR8TWJurF1a0LLGJ@hovoldconsulting.com>
 <aWd2xizOQAnVRaSs@hovoldconsulting.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aWd2xizOQAnVRaSs@hovoldconsulting.com>
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
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,lists.freedesktop.org,lists.linux.dev,vger.kernel.org,nxp.com];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:p.zabel@pengutronix.de,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:imx@lists.linux.dev,m:linux-kernel@vger.kernel.org,m:stable@vger.kernel.org,m:Frank.Li@nxp.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER(0.00)[johan@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[johan@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,hovoldconsulting.com:mid,pengutronix.de:email,nxp.com:email]
X-Rspamd-Queue-Id: 034B597436
X-Rspamd-Action: no action

On Wed, Jan 14, 2026 at 11:58:14AM +0100, Johan Hovold wrote:
> On Thu, Nov 20, 2025 at 02:10:48PM +0100, Johan Hovold wrote:
> > On Thu, Oct 30, 2025 at 05:34:56PM +0100, Johan Hovold wrote:
> > > Make sure to drop the reference taken to the DDC device during probe on
> > > probe failure (e.g. probe deferral) and on driver unbind.
> > > 
> > > Fixes: fcbc51e54d2a ("staging: drm/imx: Add support for Television Encoder (TVEv2)")
> > > Cc: stable@vger.kernel.org	# 3.10
> > > Cc: Philipp Zabel <p.zabel@pengutronix.de>
> > > Reviewed-by: Frank Li <Frank.Li@nxp.com>
> > > Signed-off-by: Johan Hovold <johan@kernel.org>
> > > ---
> > > 
> > > Changes in v2:
> > >  - add missing NULL ddc check
> > 
> > Can this one be picked up for 6.19?
> 
> It's been two more months so sending another reminder.
> 
> Can this one be merged now?

Can someone please merge this for 6.20?

Johan
