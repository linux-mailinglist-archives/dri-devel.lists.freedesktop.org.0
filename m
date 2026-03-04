Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qOd3IMRlqGl3uQAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 04 Mar 2026 18:03:00 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D3CEA204C78
	for <lists+dri-devel@lfdr.de>; Wed, 04 Mar 2026 18:02:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F2A2510EA78;
	Wed,  4 Mar 2026 17:02:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="hT9WUdDN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 372E510EA78;
 Wed,  4 Mar 2026 17:02:55 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id DEF684079B;
 Wed,  4 Mar 2026 17:02:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E299FC4CEF7;
 Wed,  4 Mar 2026 17:02:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1772643774;
 bh=aQJiY+2LCpzOcjrCyzcepEU8dJcqg8IvU44AMFz8v8M=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=hT9WUdDNSy78CtuA5kRf8mQTtoKTD2m4CXqf1thar1iHcKkmiNrxKPCHdoElX4ohB
 GJDqQsLP/WI73C6u7MnKL/Gb7KlEuu21xLrOKbYRwd9hh4ETIowZMcVQnwJMF+AW59
 EB+Tx62lWZlXgwqc23A2gC7Qy/YSjqMWXY5pw1ZrYR+nwYmCaXxLlqBaT4sWnEo64J
 kFp6WTGP1rKSUpvrvYKc8sFz6to48D29AXlhF3+Sth6C5ewzSWg61wqJBIfw2mHGO6
 CxQy0KUPVlSHwQUBw0X9FEkUIXbr6zoXZeMdEpLEiGVhiWv6rtRd9oAVIhrXmPhEaz
 pYUq2rUyfTtOA==
Date: Wed, 4 Mar 2026 19:02:49 +0200
From: Leon Romanovsky <leon@kernel.org>
To: Jason Gunthorpe <jgg@ziepe.ca>
Cc: Danilo Krummrich <dakr@kernel.org>, Peter Colberg <pcolberg@redhat.com>,
 Bjorn Helgaas <bhelgaas@google.com>,
 Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
 Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 Abdiel Janulgue <abdiel.janulgue@gmail.com>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Robin Murphy <robin.murphy@arm.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Dave Ertman <david.m.ertman@intel.com>,
 Ira Weiny <ira.weiny@intel.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Jonathan Corbet <corbet@lwn.net>,
 Xu Yilun <yilun.xu@intel.com>, Tom Rix <trix@redhat.com>,
 Moritz Fischer <mdf@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>,
 Boqun Feng <boqun@kernel.org>, linux-pci@vger.kernel.org,
 rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org,
 Alexandre Courbot <acourbot@nvidia.com>,
 Alistair Popple <apopple@nvidia.com>,
 Joel Fernandes <joelagnelf@nvidia.com>,
 John Hubbard <jhubbard@nvidia.com>, Zhi Wang <zhiw@nvidia.com>,
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-doc@vger.kernel.org, linux-fpga@vger.kernel.org,
 driver-core@lists.linux.dev
Subject: Re: [PATCH v3 00/10] rust: pci: add abstractions for SR-IOV capability
Message-ID: <20260304170249.GJ12611@unreal>
References: <20260303-rust-pci-sriov-v3-0-4443c35f0c88@redhat.com>
 <20260304084750.GW12611@unreal> <20260304141852.GF964116@ziepe.ca>
 <20260304142600.GB12611@unreal>
 <DGU347RJX5BV.1CZYELSZ9GS9D@kernel.org>
 <20260304162711.GI12611@unreal> <20260304164551.GG964116@ziepe.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260304164551.GG964116@ziepe.ca>
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
X-Rspamd-Queue-Id: D3CEA204C78
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[40];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[kernel.org,redhat.com,google.com,gmail.com,garyguo.net,protonmail.com,umich.edu,collabora.com,arm.com,linuxfoundation.org,intel.com,ffwll.ch,lwn.net,vger.kernel.org,nvidia.com,lists.freedesktop.org,lists.linux.dev];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[leon@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo]
X-Rspamd-Action: no action

On Wed, Mar 04, 2026 at 12:45:51PM -0400, Jason Gunthorpe wrote:
> On Wed, Mar 04, 2026 at 06:27:11PM +0200, Leon Romanovsky wrote:
> > On Wed, Mar 04, 2026 at 03:57:57PM +0100, Danilo Krummrich wrote:
> > > On Wed Mar 4, 2026 at 3:26 PM CET, Leon Romanovsky wrote:
> > > > On Wed, Mar 04, 2026 at 10:18:52AM -0400, Jason Gunthorpe wrote:
> > > >> On Wed, Mar 04, 2026 at 10:47:50AM +0200, Leon Romanovsky wrote:
> > > >> > On Tue, Mar 03, 2026 at 04:15:20PM -0500, Peter Colberg wrote:
> > > >> > > Add Rust abstractions for the Single Root I/O Virtualization (SR-IOV)
> > > >> > > capability of a PCI device. Provide a minimal set of wrappers for the
> > > >> > > SR-IOV C API to enable and disable SR-IOV for a device, and query if
> > > >> > > a PCI device is a Physical Function (PF) or Virtual Function (VF).
> > > >> > 
> > > >> > <...>
> > > >> > 
> > > >> > > For PF drivers written in C, disabling SR-IOV on remove() may be opted
> > > >> > > into by setting the flag managed_sriov in the pci_driver structure. For
> > > >> > > PF drivers written in Rust, disabling SR-IOV on unbind() is mandatory.
> > > >> > 
> > > >> > Why? Could you explain the rationale behind this difference between C and
> > > >> > Rust? Let me remind you that SR‑IOV devices which do not disable VFs do so
> > > >> > for a practical and well‑established reason: maximizing hardware
> > > >> > utilization.
> > > >> 
> > > >> Personally I think drivers doing this are wrong. That such a driver
> > > >> bug was allowed to become UAPI is pretty bad. The rust approach is
> > > >> better.
> > > >
> > > > We already had this discussion. I see this as a perfectly valid
> > > > use-case.
> > > 
> > > Can you remind about a specific use-case for this please? (Ideally, one that
> > > can't be solved otherwise.)
> > 
> > You create X VFs through sriov_configure, unbind PF, bind it to vfio
> > instead and forward (X + 1) functions to different VMs.
> 
> No, illegal, and it doesn't even work right. When VFIO FLRs the PF it
> will blow up the half baked SRIOV and break everything.

The FLR can be disabled. For example, PCI_DEV_FLAGS_NO_FLR_RESET flag
will do it.

> 
> VFIO already has its own sriov_config support, the right flow is to
> bind the PF to VFIO and then enable sriov and do your assignments.

VFIO started to support SR-IOV in 137e5531351d ("vfio/pci: Add
sriov_configure support"), which was added 8 years after VFIO core was
added cba3345cc494 ("vfio: VFIO core").

Thanks

> 
> Jason
> 
