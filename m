Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SKYiJtH+iWluFQAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 09 Feb 2026 16:35:45 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EEC6B111F31
	for <lists+dri-devel@lfdr.de>; Mon, 09 Feb 2026 16:35:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0EDF310E418;
	Mon,  9 Feb 2026 15:35:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="BZAfX8oe";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8695210E418
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Feb 2026 15:35:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1770651340;
 bh=U15/F91JTKEekYShyiR6dUHXzcOCFPKVIlg/bRPTaAI=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=BZAfX8oeM74obJfB9jbkW5ibDvMSdYszm/4kicoQIfE7r7NQx378ig4ngcSNN7OQF
 NJaoHq6H56xEzf0KJYHWe8CzU2T7owLlCNGO2zINtknrR81jP7rW2gw8sX9WzqpECc
 u+gz4Cxq6w38fmMg3/gzFnYCHEeaSgHlWiBedFn0jtw8O5LC2d4LWXOaDskn5VUZ5f
 ojRlSJL2jT95WK4kG4Ipg3n3eGwBlHX8XRpweiulTl1BLWNA+SYZWMAt1q6sP5oCQx
 xjdUNiThoYONG4rCZO6J29fEqsqYyprXGK+IJvzvlOTwBcXq9aGAGxsNpMZvc+U0X9
 82mMJKT+6bLVg==
Received: from fedora (unknown [IPv6:2a01:e0a:2c:6930:d919:a6e:5ea1:8a9f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id A441117E0699;
 Mon,  9 Feb 2026 16:35:39 +0100 (CET)
Date: Mon, 9 Feb 2026 16:35:34 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Liviu Dudau <liviu.dudau@arm.com>
Cc: Steven Price <steven.price@arm.com>, Will Deacon <will@kernel.org>,
 Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>, Rob
 Clark <robin.clark@oss.qualcomm.com>, linux-arm-kernel@lists.infradead.org,
 iommu@lists.linux.dev, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Karunika Choo <karunika.choo@arm.com>, Liviu
 Dudau <liviu@dudau.co.uk>
Subject: Re: [RFC PATCH] iommu/io-pgtable: Add support for Arm Mali v10+
 GPUs page table format
Message-ID: <20260209163534.45b0ec7a@fedora>
In-Reply-To: <aYn7obNImaI72MhK@e142607>
References: <20260209112542.194140-1-liviu.dudau@arm.com>
 <0af5b5f3-912a-4f16-a68b-032617576537@arm.com>
 <aYngwtq_GtBYGjOC@e142607>
 <ac5c3df0-1d94-4a1c-9eec-a359096cfce5@arm.com>
 <aYn7obNImaI72MhK@e142607>
Organization: Collabora
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[collabora.com,none];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[collabora.com:s=mail];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:liviu.dudau@arm.com,m:steven.price@arm.com,m:will@kernel.org,m:robin.murphy@arm.com,m:joro@8bytes.org,m:robin.clark@oss.qualcomm.com,m:linux-arm-kernel@lists.infradead.org,m:iommu@lists.linux.dev,m:linux-kernel@vger.kernel.org,m:karunika.choo@arm.com,m:liviu@dudau.co.uk,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[boris.brezillon@collabora.com,dri-devel-bounces@lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[collabora.com:+];
	HAS_ORG_HEADER(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[boris.brezillon@collabora.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[arm.com:email,collabora.com:dkim,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: EEC6B111F31
X-Rspamd-Action: no action

On Mon, 9 Feb 2026 15:22:09 +0000
Liviu Dudau <liviu.dudau@arm.com> wrote:

> > > Ultimately the role of this RFC is to start a discussion and to figure out a path
> > > forward for CSF GPUs where we want now to tighen a bit the formats we support and
> > > add PBHA and in the future we want to add support for v15+ page formats.  
> > 
> > PBHA is definitely an area for discussion. AIUI there are out-of-tree
> > patches floating about for CPU support, but it hasn't been upstreamed. I
> > don't know if any serious attempt has been made to push it upstream, but
> > it's tricky because the architecture basically just says "IMPLEMENTATION
> > DEFINED" which means you are no longer coding to the architecture but a
> > specific implementation - and there's remarkably little documentation
> > about what PBHA is used for in practice.
> > 
> > I haven't looked into the GPU situation with PBHA - again it would be
> > good to have more details on how the bits would be set.  
> 
> I have a patch series that adds support in Panthor to apply some PBHA bits defined
> in the DT based on an ID also defined in the DT and passed along as a VM_BIND parameter
> if you want to play with it. However I have no direct knowledge on which PBHA values
> would make a difference on the supported platforms (RK3xxx for example).

I don't know if that's what it's going be used for, but one very
specific use case I'd like to see this PBHA extension backed by is
"read-zero/write-discard" behavior that's needed for sparse bindings.
Unfortunately, I've not heard on any HW-support for that in older
gens...
