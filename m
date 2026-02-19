Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ABUcGvYwl2kcvgIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 19 Feb 2026 16:49:10 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F0D3E1605B8
	for <lists+dri-devel@lfdr.de>; Thu, 19 Feb 2026 16:49:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB788890BE;
	Thu, 19 Feb 2026 15:49:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="euVSCPcV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D8E3890BE
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Feb 2026 15:49:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1771516145;
 bh=qZyc7S2pnypUfMT9iqtILOLjkgz49Qxah5rmq/l0rZY=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=euVSCPcVcbq1yi4/RraGyuXZhvdD13iMhCfRzP9nKhRMKPXmYhLXOqsikcV5ptaXa
 TBsHo8g0/Do3vBasu3CG8npoI4ADNXuWtmHrVpibNlF+wA4YlkcY2GaktU0koW5ihv
 SUSnF7OuhMscQM7jr/VBSzNy2d1JYe3uSnHIBDRG8AUCMYO+xgNaqc7nCdDnSp7VQJ
 ucL4IZcrdoNYK1WfZSAeqlRnJYe8uAlAvLUGrZEroX+7yB4jKJt6gW4K6k57L3Xdgh
 9JBetvQ4IkvtfrZpLbuept4mkoQ8wQXmlN5QgRUb2g4FjYhFQx3dJWnDSB3HC+cf68
 G/fTmFpnJA1Ww==
Received: from fedora (unknown [IPv6:2a01:e0a:2c:6930:d919:a6e:5ea1:8a9f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id BF92C17E137B;
 Thu, 19 Feb 2026 16:49:04 +0100 (CET)
Date: Thu, 19 Feb 2026 16:49:01 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Christian =?UTF-8?B?S8O2bmln?= <christian.koenig@amd.com>
Cc: phasta@mailbox.org, matthew.brost@intel.com, sumit.semwal@linaro.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org
Subject: Re: [PATCH 2/8] dma-buf: detach fence ops on signal v2
Message-ID: <20260219164901.02b7409f@fedora>
In-Reply-To: <10fa03cc-6575-48ce-b2ff-401b6a8bf4ce@amd.com>
References: <20260210102232.1642-1-christian.koenig@amd.com>
 <20260210102232.1642-3-christian.koenig@amd.com>
 <20260213152257.2651e2bb@fedora>
 <10fa03cc-6575-48ce-b2ff-401b6a8bf4ce@amd.com>
Organization: Collabora
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
X-Spamd-Result: default: False [-0.81 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[collabora.com,none];
	MID_RHS_NOT_FQDN(0.50)[];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[collabora.com:s=mail];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_RECIPIENTS(0.00)[m:christian.koenig@amd.com,m:phasta@mailbox.org,m:matthew.brost@intel.com,m:sumit.semwal@linaro.org,m:linaro-mm-sig@lists.linaro.org,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[boris.brezillon@collabora.com,dri-devel-bounces@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	HAS_ORG_HEADER(0.00)[];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[boris.brezillon@collabora.com,dri-devel-bounces@lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DKIM_TRACE(0.00)[collabora.com:+];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,collabora.com:dkim]
X-Rspamd-Queue-Id: F0D3E1605B8
X-Rspamd-Action: no action

On Thu, 19 Feb 2026 13:52:43 +0100
Christian K=C3=B6nig <christian.koenig@amd.com> wrote:

> On 2/13/26 15:22, Boris Brezillon wrote:
> >> ---
> >>  drivers/dma-buf/dma-fence.c | 16 ++++++++++++----
> >>  include/linux/dma-fence.h   |  4 ++--
> >>  2 files changed, 14 insertions(+), 6 deletions(-)
> >>
> >> diff --git a/drivers/dma-buf/dma-fence.c b/drivers/dma-buf/dma-fence.c
> >> index de9bf18be3d4..ba02321bef0b 100644
> >> --- a/drivers/dma-buf/dma-fence.c
> >> +++ b/drivers/dma-buf/dma-fence.c
> >> @@ -371,6 +371,14 @@ void dma_fence_signal_timestamp_locked(struct dma=
_fence *fence,
> >>  				      &fence->flags)))
> >>  		return;
> >> =20
> >> +	/*
> >> +	 * When neither a release nor a wait operation is specified set the =
ops
> >> +	 * pointer to NULL to allow the fence structure to become independent
> >> +	 * from who originally issued it. =20
> >=20
> > I think this deserves some comment in the dma_fence_ops doc, so that
> > people know what to expect when they implement this interface. =20
> There was already a warning added like ~5years ago that implementations s=
houldn't use the wait callback.
>=20
> Completely independent of this patch set here we already had tons of trou=
ble with it because it can't take into account when userpsace waits for mul=
tiple fences from different implementations.
>=20
> It potentially was never a good idea to have in the first place, we basic=
ally only had it because radeon (and IIRC nouveau at that point) depended o=
n it.

Fair enough. If it's flagged deprecated already, let's keep things like
that.
