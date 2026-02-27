Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id dgISEBrLoWncwQQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 27 Feb 2026 17:49:30 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 095391BAFE4
	for <lists+dri-devel@lfdr.de>; Fri, 27 Feb 2026 17:49:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 90DF210E125;
	Fri, 27 Feb 2026 16:49:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="BMGK66Il";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C80710E125;
 Fri, 27 Feb 2026 16:49:21 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 269B9444D5;
 Fri, 27 Feb 2026 16:49:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D3011C116C6;
 Fri, 27 Feb 2026 16:49:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1772210961;
 bh=jznU9LDSkQYILvcSIV46IxA3CrI9OTrcodpcP2KE/Rk=;
 h=Date:From:To:Cc:Subject:In-Reply-To:From;
 b=BMGK66IlpUYHanCwORkjV1r5gD4tZdmf3FdgQyvpYqd87OnPE/XYM3XTkW4Ksw/Y2
 Y3jxv1rvP5tPMlEvJt5tjaSTDHFbZ6E0cmQiJ4sJ1nQ4Fa0ouKncl5VoVtiCuVxIzZ
 wWKIJt52O1sSUx08jbmlf8//snPIjiC+zltv0lkdOUs2BhGHuFA3bE4uAUcyVVBSxy
 qaQx337ysm56rZiMRyNkrrziyLzOmk1FheLkVIlnP9JOrOh9Vg2yq723loCPFce4ld
 PQ+fWhfMBe0FBUqcD3yCDZF4bHUCb4tFZLXFqqmmZy1DAO7HVlmZIQO39PRRlHaFGU
 +2b9qvGprKjDg==
Date: Fri, 27 Feb 2026 10:49:19 -0600
From: Bjorn Helgaas <helgaas@kernel.org>
To: Vivian Wang <wangruikang@iscas.ac.cn>,
	Thomas Gleixner <tglx@kernel.org>
Cc: Mark Bloch <mbloch@nvidia.com>, Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Bjorn Helgaas <bhelgaas@google.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Brett Creeley <brett.creeley@amd.com>, Han Gao <gaohan@iscas.ac.cn>,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 netdev@vger.kernel.org, linux-pci@vger.kernel.org,
 linux-sound@vger.kernel.org, linux-riscv@lists.infradead.org,
 sophgo@lists.linux.dev, Takashi Iwai <tiwai@suse.de>,
 Maor Gottlieb <maorg@nvidia.com>
Subject: Re: [PATCH v4 1/4] PCI/MSI: Conservatively generalize no_64bit_msi
 into msi_addr_mask
Message-ID: <20260227164919.GA3897300@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c9329ae2-721d-4127-9380-b1ea454bd8f2@iscas.ac.cn>
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
	RCPT_COUNT_TWELVE(0.00)[32];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[nvidia.com,linux.ibm.com,ellerman.id.au,gmail.com,kernel.org,amd.com,ffwll.ch,lunn.ch,davemloft.net,google.com,redhat.com,perex.cz,suse.com,iscas.ac.cn,lists.ozlabs.org,vger.kernel.org,lists.freedesktop.org,lists.infradead.org,lists.linux.dev,suse.de];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[helgaas@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel,netdev];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 095391BAFE4
X-Rspamd-Action: no action

On Fri, Feb 27, 2026 at 01:25:03PM +0800, Vivian Wang wrote:
> On 2/27/26 02:25, Mark Bloch wrote:
> > On 29/01/2026 3:56, Vivian Wang wrote:
> >> Some PCI devices have PCI_MSI_FLAGS_64BIT in the MSI capability, but
> >> implement less than 64 address bits. This breaks on platforms where such
> >> a device is assigned an MSI address higher than what's reachable.
> >>
> >> Currently, the no_64bit_msi bit is set for these devices, meaning that
> >> only 32-bit MSI addresses are allowed for them. However, on some
> >> platforms the MSI doorbell address is above the 32-bit limit but within
> >> the addressable range of the device.
> >>
> >> As a first step to enabling MSI on those combinations of devices and
> >> platforms, conservatively generalize the single-bit flag no_64bit_msi
> >> into msi_addr_mask. (The name msi_addr_mask is chosen to avoid confusion
> >> with msi_mask.)
> >>
> >> The translation is essentially:
> >>
> >> - no_64bit_msi = 1    ->    msi_addr_mask = DMA_BIT_MASK(32)
> >> - no_64bit_msi = 0    ->    msi_addr_mask = DMA_BIT_MASK(64)
> >> - if (no_64bit_msi)   ->    if (msi_addr_mask < DMA_BIT_MASK(64))
> >>
> > Hey Vivian,
> >
> > We are seeing issues while reloading mlx5 on a PPC64 platform.
> 
> Mea culpa. There's a fix on the list [1] since last Friday. I'm not sure
> why it hasn't moved yet, but please take a look.
> 
> [1]: https://lore.kernel.org/all/20260220070239.1693303-1-nilay@linux.ibm.com/

We needed testing on powerpc and sparc, which has now been done,
thanks to Han Gao (SPARC Enterprise T5220), Nathaniel Roach (SPARC
T5-2), and Venkat Rao Bagalkote (IBM Power System LPAR (pseries)).

It would be ideal to have acks from the powerpc and sparc maintainers,
so I just solicited those.

Thomas merged 386ced19e9a3 ("PCI/MSI: Convert the boolean no_64bit_msi
flag to a DMA address mask"), and could merge the fixes.  Otherwise I
can merge via PCI.

Bjorn
