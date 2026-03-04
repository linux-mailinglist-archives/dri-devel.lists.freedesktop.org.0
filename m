Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sNZbHb7xp2mGmgAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 04 Mar 2026 09:47:58 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 30BFF1FCDA8
	for <lists+dri-devel@lfdr.de>; Wed, 04 Mar 2026 09:47:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8DCFA10E97D;
	Wed,  4 Mar 2026 08:47:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="CGJ1QxVS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A11A10E97D;
 Wed,  4 Mar 2026 08:47:54 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 7034943FAE;
 Wed,  4 Mar 2026 08:47:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A627BC19423;
 Wed,  4 Mar 2026 08:47:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1772614074;
 bh=q+uTTk+Tl69Kd6bd84m1ZhgW1BhIv3PD7PYeGemtd4Y=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=CGJ1QxVSx+yDBHFSGoiEA2QyfySvBh3UP/gWJq3VOBTvYMvejMq8Rzpzqmukquutx
 t2OTkdGkFfjSoNlRUuQHsgRR2xPyC48SdWHcHPMUqRWp8gTeKSSWi5DJpATFoDNtZ9
 6eXTKs6/AXKf3TjhGc64AYu971aZ4AAO/zQACZtsTZBjYnwb7TRHrdWWzPAuac4+uI
 uwf+ggXetFVdGtF6buvhLTW9e2UF/v1T5XqeceHaXg+bYpa0CX6BxkGll5sZcYS8Wk
 QY08VrLwU/YutzRmF/PxK5OygjVR6y6ITvSo4XVbV1CW+cGGQcFSGVrXVfj/KOs/S7
 pmv5gl2WFBVIQ==
Date: Wed, 4 Mar 2026 10:47:50 +0200
From: Leon Romanovsky <leon@kernel.org>
To: Peter Colberg <pcolberg@redhat.com>
Cc: Danilo Krummrich <dakr@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
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
 driver-core@lists.linux.dev, Jason Gunthorpe <jgg@ziepe.ca>
Subject: Re: [PATCH v3 00/10] rust: pci: add abstractions for SR-IOV capability
Message-ID: <20260304084750.GW12611@unreal>
References: <20260303-rust-pci-sriov-v3-0-4443c35f0c88@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260303-rust-pci-sriov-v3-0-4443c35f0c88@redhat.com>
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
X-Rspamd-Queue-Id: 30BFF1FCDA8
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
	FREEMAIL_CC(0.00)[kernel.org,google.com,gmail.com,garyguo.net,protonmail.com,umich.edu,collabora.com,arm.com,linuxfoundation.org,intel.com,ffwll.ch,lwn.net,redhat.com,vger.kernel.org,nvidia.com,lists.freedesktop.org,lists.linux.dev,ziepe.ca];
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

On Tue, Mar 03, 2026 at 04:15:20PM -0500, Peter Colberg wrote:
> Add Rust abstractions for the Single Root I/O Virtualization (SR-IOV)
> capability of a PCI device. Provide a minimal set of wrappers for the
> SR-IOV C API to enable and disable SR-IOV for a device, and query if
> a PCI device is a Physical Function (PF) or Virtual Function (VF).

<...>

> For PF drivers written in C, disabling SR-IOV on remove() may be opted
> into by setting the flag managed_sriov in the pci_driver structure. For
> PF drivers written in Rust, disabling SR-IOV on unbind() is mandatory.

Why? Could you explain the rationale behind this difference between C and
Rust? Let me remind you that SR‑IOV devices which do not disable VFs do so
for a practical and well‑established reason: maximizing hardware
utilization.

Thanks
