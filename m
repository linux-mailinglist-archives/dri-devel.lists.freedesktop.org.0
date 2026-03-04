Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yEKoKWddqGmZtgAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 04 Mar 2026 17:27:19 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 134962043C8
	for <lists+dri-devel@lfdr.de>; Wed, 04 Mar 2026 17:27:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 220FA10EA5B;
	Wed,  4 Mar 2026 16:27:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="KV8L5eiQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 050F910EA5B;
 Wed,  4 Mar 2026 16:27:16 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 9291E419F6;
 Wed,  4 Mar 2026 16:27:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CB2EBC4CEF7;
 Wed,  4 Mar 2026 16:27:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1772641635;
 bh=AfCEMFEFaW523pTkeEMztclMFG542ecaBMBKu13UGZU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=KV8L5eiQbBVOpo+OeokNyKPYBoKK5g7vSE/nknwa473tAFw/QjlmcNO0ix4gySsJR
 P8HGEuYKgLhs2iM5qBup4aRAoDdpXBSoN6aXuQpuSZQdcyK32b9CU44GBf06JQKrxe
 A0138itmdBGIzt7qc/FuKDjEYCSXJY2vYvZFDzZpkQ24AdU2CATXVuKtzKQ417beN1
 1HdgzguxGjgcfat/rasyFw88NZA2mgp2RTQ+oZK6lzIyI5/4MvYgarsiLUsmNN3co+
 4kUUCcvOouTRL65YcHGShRf++I/qi/7S9VXcwYBddr2f7ugd4CGFQAwpy46t5yyczu
 ppjBkqA5Ki4Cg==
Date: Wed, 4 Mar 2026 18:27:11 +0200
From: Leon Romanovsky <leon@kernel.org>
To: Danilo Krummrich <dakr@kernel.org>
Cc: Jason Gunthorpe <jgg@ziepe.ca>, Peter Colberg <pcolberg@redhat.com>,
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
Message-ID: <20260304162711.GI12611@unreal>
References: <20260303-rust-pci-sriov-v3-0-4443c35f0c88@redhat.com>
 <20260304084750.GW12611@unreal> <20260304141852.GF964116@ziepe.ca>
 <20260304142600.GB12611@unreal>
 <DGU347RJX5BV.1CZYELSZ9GS9D@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <DGU347RJX5BV.1CZYELSZ9GS9D@kernel.org>
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
X-Rspamd-Queue-Id: 134962043C8
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
	FREEMAIL_CC(0.00)[ziepe.ca,redhat.com,google.com,kernel.org,gmail.com,garyguo.net,protonmail.com,umich.edu,collabora.com,arm.com,linuxfoundation.org,intel.com,ffwll.ch,lwn.net,vger.kernel.org,nvidia.com,lists.freedesktop.org,lists.linux.dev];
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

On Wed, Mar 04, 2026 at 03:57:57PM +0100, Danilo Krummrich wrote:
> On Wed Mar 4, 2026 at 3:26 PM CET, Leon Romanovsky wrote:
> > On Wed, Mar 04, 2026 at 10:18:52AM -0400, Jason Gunthorpe wrote:
> >> On Wed, Mar 04, 2026 at 10:47:50AM +0200, Leon Romanovsky wrote:
> >> > On Tue, Mar 03, 2026 at 04:15:20PM -0500, Peter Colberg wrote:
> >> > > Add Rust abstractions for the Single Root I/O Virtualization (SR-IOV)
> >> > > capability of a PCI device. Provide a minimal set of wrappers for the
> >> > > SR-IOV C API to enable and disable SR-IOV for a device, and query if
> >> > > a PCI device is a Physical Function (PF) or Virtual Function (VF).
> >> > 
> >> > <...>
> >> > 
> >> > > For PF drivers written in C, disabling SR-IOV on remove() may be opted
> >> > > into by setting the flag managed_sriov in the pci_driver structure. For
> >> > > PF drivers written in Rust, disabling SR-IOV on unbind() is mandatory.
> >> > 
> >> > Why? Could you explain the rationale behind this difference between C and
> >> > Rust? Let me remind you that SR‑IOV devices which do not disable VFs do so
> >> > for a practical and well‑established reason: maximizing hardware
> >> > utilization.
> >> 
> >> Personally I think drivers doing this are wrong. That such a driver
> >> bug was allowed to become UAPI is pretty bad. The rust approach is
> >> better.
> >
> > We already had this discussion. I see this as a perfectly valid
> > use-case.
> 
> Can you remind about a specific use-case for this please? (Ideally, one that
> can't be solved otherwise.)

You create X VFs through sriov_configure, unbind PF, bind it to vfio
instead and forward (X + 1) functions to different VMs.

If you destroy VFs on PF unbind, you will find yourself with one
function less per-device, as you will have not-utilized PF now,
which consumes HW resources anyway.

Thanks 
