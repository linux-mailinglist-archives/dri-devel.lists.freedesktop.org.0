Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8CVDC8sqk2kI2AEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 16 Feb 2026 15:33:47 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A8827144B72
	for <lists+dri-devel@lfdr.de>; Mon, 16 Feb 2026 15:33:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 939F710E061;
	Mon, 16 Feb 2026 14:33:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="I8dxKtPn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB58E10E061;
 Mon, 16 Feb 2026 14:33:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771252423; x=1802788423;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=nBSds1d0p2lObzh6VWVEHAiLx+vJpOPDb3bg77hHCeY=;
 b=I8dxKtPn+qMpUfZb7OHHvQun6xGAF9YiP9cm/NYLHie3tC5aZOIRZZ1U
 j7wLbxYD6WNQqppep69K0caqNCA3bmk7r6PZHjhAK1i5nGn3ambXYbodp
 lOjxbGf2tNNK8gWHI3sRm/SqlORPjlIepyc2H4Ga/BFiX9GjXuF26i0sZ
 qPHdg4rwTuDQf5ndCbPJHwurqt3ccWJlB2N4uUPKpcn+4wGAHYUKi8InJ
 M4yN6w8G46uhp98avI9dbJGVpDAvJlGm7DqjUlOSCReNc5Z2ZzLzRZD9F
 k5kW3xu16wCsosT0INYqLZe6C/AF0dWnKwAFYL2VRofEc8eOmHKjdM9P9 A==;
X-CSE-ConnectionGUID: hMetCOALQ8WRxDktXSOZYQ==
X-CSE-MsgGUID: svXBD1GsTqqgPBnO5TCiGg==
X-IronPort-AV: E=McAfee;i="6800,10657,11702"; a="72505547"
X-IronPort-AV: E=Sophos;i="6.21,294,1763452800"; d="scan'208";a="72505547"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Feb 2026 06:33:43 -0800
X-CSE-ConnectionGUID: mfHeYKaFSRqtBKbkeL+MVQ==
X-CSE-MsgGUID: ldC5hNiDSI++rJ82NmwGqg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,294,1763452800"; d="scan'208";a="212177477"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO [10.245.244.231])
 ([10.245.244.231])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Feb 2026 06:33:40 -0800
Message-ID: <133fadf004fde9fe8a93b01bd6d282d52a838f6c.camel@linux.intel.com>
Subject: Re: [PATCH v4 4/4] drm/pagemap: Use dma-map IOVA alloc, link, and
 sync API for DRM pagemap
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Matthew Brost <matthew.brost@intel.com>, Jason Gunthorpe <jgg@ziepe.ca>
Cc: intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 leonro@nvidia.com, francois.dugast@intel.com,
 himal.prasad.ghimiray@intel.com
Date: Mon, 16 Feb 2026 15:33:38 +0100
In-Reply-To: <aY+C5Qaik1XRZGwZ@lstrano-desk.jf.intel.com>
References: <20260205041921.3781292-1-matthew.brost@intel.com>
 <20260205041921.3781292-5-matthew.brost@intel.com>
 <6289525edef2a1dca5d9de325ad0efbc1cb79a38.camel@linux.intel.com>
 <aYyiHQ0avcRcti8l@lstrano-desk.jf.intel.com>
 <1215d2ec94ecf13944d01bd4de29bf29bd4f8bf7.camel@linux.intel.com>
 <aYzPtCisUdv6FPEC@lstrano-desk.jf.intel.com>
 <20260213145646.GO750753@ziepe.ca>
 <aY+C5Qaik1XRZGwZ@lstrano-desk.jf.intel.com>
Organization: Intel Sweden AB, Registration Number: 556189-6027
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.2 (3.58.2-1.fc43) 
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
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	ARC_NA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:dkim];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	MIME_TRACE(0.00)[0:+];
	HAS_ORG_HEADER(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	RCPT_COUNT_SEVEN(0.00)[7];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[thomas.hellstrom@linux.intel.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+]
X-Rspamd-Queue-Id: A8827144B72
X-Rspamd-Action: no action

On Fri, 2026-02-13 at 12:00 -0800, Matthew Brost wrote:
> On Fri, Feb 13, 2026 at 10:56:46AM -0400, Jason Gunthorpe wrote:
> > On Wed, Feb 11, 2026 at 10:51:32AM -0800, Matthew Brost wrote:
> > > > So to be a little nicer on the IOVA allocator we could use the
> > > > below?
> > > >=20
> > > > 		dma_iova_try_alloc(dev, &state->dma_state,
> > > > 					=C2=A0=C2=A0 (npages - i) *
> > > > PAGE_SIZE >=3D
> > > > 					=C2=A0=C2=A0 HPAGE_PMD_SIZE ?
> > > > 					=C2=A0=C2=A0 HPAGE_PMD_SIZE : 0,
> > > > 					=C2=A0=C2=A0 (npages - i) *
> > > > PAGE_SIZE);
> > > >=20
> > >=20
> > > Yes, we can do that. No reason to force alignment if our copy
> > > code isn't
> > > going to try to use 2M GPU pages.
> >=20
> > When it comes to this I prefer we try to add alignment information
> > down to the iova allocator because I have other use cases for this
> > alignment optimization.
>=20
> Trying to parse this - what exactly is your preference here in the
> context of this patch?
>=20
> i.e., Is original code ok, is Thomas's suggestion ok, or should we do
> something entirely different?
>=20
> Matt

Interpreting this as Jason would want an alignment parameter to the
IOVA alloctor.

Although that's already the case, albeit somewhat awkwardly named.

Thanks,
Thomas


>=20
> >=20
> > Jason
