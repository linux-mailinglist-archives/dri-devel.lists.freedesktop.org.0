Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WL2iHwRBqGl6rQAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 04 Mar 2026 15:26:12 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (unknown [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EB7F0201663
	for <lists+dri-devel@lfdr.de>; Wed, 04 Mar 2026 15:26:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 286DF10EA1C;
	Wed,  4 Mar 2026 14:26:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Ts/0Flsu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 72CE410EA1C;
 Wed,  4 Mar 2026 14:26:06 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 7737E6057A;
 Wed,  4 Mar 2026 14:26:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 833ACC2BC87;
 Wed,  4 Mar 2026 14:26:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1772634365;
 bh=B0weNWDunmwVDkkQkN0kc7eG+tPkHSnvIyKW9SWUWPk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Ts/0Flsu+WenzEZfA5RIGH5FOlyHpWYzSgcefBgKg2f19RaSYz+irtf4VdJbC766a
 NEaEpQ4umSV40OOs9ljryMEiSfaxm3WaBTUH3UGZdOvowqt/RrlEXVEAKUI6C31Gvf
 sG/yB38kxV7mnWG2tWKaBWl+zjobjnciujPIucg+/jacQpHmpX7sP2g5nZzJTR2aZw
 bKWY102ePDXk+dqRHGD/xD9P0Lzhe933nURcNLqi+A56D/2L2FMtcX/pA3iitdI5HO
 WVnC3yjobyeiqlz2mpolNYTWQuQHio4sAY+ArQ4J4bALd5gkWoYuv152zQoKTasSQM
 3hHcgssibybRg==
Date: Wed, 4 Mar 2026 16:26:00 +0200
From: Leon Romanovsky <leon@kernel.org>
To: Jason Gunthorpe <jgg@ziepe.ca>
Cc: Peter Colberg <pcolberg@redhat.com>, Danilo Krummrich <dakr@kernel.org>,
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
Message-ID: <20260304142600.GB12611@unreal>
References: <20260303-rust-pci-sriov-v3-0-4443c35f0c88@redhat.com>
 <20260304084750.GW12611@unreal> <20260304141852.GF964116@ziepe.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260304141852.GF964116@ziepe.ca>
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
X-Rspamd-Queue-Id: EB7F0201663
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.79 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2610:10:20:722:a800:ff:fe36:1795:c];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	ARC_NA(0.00)[];
	FREEMAIL_CC(0.00)[redhat.com,kernel.org,google.com,gmail.com,garyguo.net,protonmail.com,umich.edu,collabora.com,arm.com,linuxfoundation.org,intel.com,ffwll.ch,lwn.net,vger.kernel.org,nvidia.com,lists.freedesktop.org,lists.linux.dev];
	RCPT_COUNT_TWELVE(0.00)[40];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[leon@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[dri-devel];
	ASN(0.00)[asn:6366, ipnet:2610:10::/32, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo]
X-Rspamd-Action: no action

On Wed, Mar 04, 2026 at 10:18:52AM -0400, Jason Gunthorpe wrote:
> On Wed, Mar 04, 2026 at 10:47:50AM +0200, Leon Romanovsky wrote:
> > On Tue, Mar 03, 2026 at 04:15:20PM -0500, Peter Colberg wrote:
> > > Add Rust abstractions for the Single Root I/O Virtualization (SR-IOV)
> > > capability of a PCI device. Provide a minimal set of wrappers for the
> > > SR-IOV C API to enable and disable SR-IOV for a device, and query if
> > > a PCI device is a Physical Function (PF) or Virtual Function (VF).
> > 
> > <...>
> > 
> > > For PF drivers written in C, disabling SR-IOV on remove() may be opted
> > > into by setting the flag managed_sriov in the pci_driver structure. For
> > > PF drivers written in Rust, disabling SR-IOV on unbind() is mandatory.
> > 
> > Why? Could you explain the rationale behind this difference between C and
> > Rust? Let me remind you that SR‑IOV devices which do not disable VFs do so
> > for a practical and well‑established reason: maximizing hardware
> > utilization.
> 
> Personally I think drivers doing this are wrong. That such a driver
> bug was allowed to become UAPI is pretty bad. The rust approach is
> better.

We already had this discussion. I see this as a perfectly valid
use-case.

Thanks

> 
> Jason
