Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D128A833101
	for <lists+dri-devel@lfdr.de>; Fri, 19 Jan 2024 23:53:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F52610E009;
	Fri, 19 Jan 2024 22:53:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B0C4810E009
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Jan 2024 22:53:01 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id A35766163D;
 Fri, 19 Jan 2024 22:52:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 04AD9C433C7;
 Fri, 19 Jan 2024 22:52:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1705704772;
 bh=0ijwrmTk2cnJeJUszdORJ/iITtlbDTse4Ksm2/cj9MM=;
 h=Date:From:To:Cc:Subject:In-Reply-To:From;
 b=FPbd2X83mblIBLmExB3N0keu3JjEQwVSlmgpo4q/2+TuJMvG1HK0bnVCM2812dnyg
 hLcNc3LPVtMJMT4TKbum/Sp3ThwagoHU0Bbbj8vLxECywo5ZxTzLC8xRSdI7xRQheI
 Y3kENQ/KZdzF/aZh+H2qSe/lO99RoQ7FmZfxmFnmCNP+W9CyipXmEgA7huBOO2jOHD
 kYMTXCK2K5DJ7C4ZADJaBu48vGyjLv/NAJtv4Xn3W7wQ3Uova5V0sWsvt4P2umScLG
 P6ZZ+o5ub8Qk/n8TXsZ0G7Xx7Ewsb+8Dw3AtGyUO1xNLKfFkIJo2+YHjaKgJsL8l+z
 u5HrrXYQQNDhA==
Date: Fri, 19 Jan 2024 16:52:50 -0600
From: Bjorn Helgaas <helgaas@kernel.org>
To: Philipp Stanner <pstanner@redhat.com>
Subject: Re: [PATCH 01/10] pci: add new set of devres functions
Message-ID: <20240119225250.GA191270@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1983517bf5d0c98894a7d40fbec353ad75160cb4.camel@redhat.com>
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
Cc: Daniel Vetter <daniel@ffwll.ch>, Jonathan Corbet <corbet@lwn.net>,
 Sam Ravnborg <sam@ravnborg.org>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Maxime Ripard <mripard@kernel.org>,
 Hans de Goede <hdegoede@redhat.com>, dakr@redhat.com,
 dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 linux-pci@vger.kernel.org, Bjorn Helgaas <bhelgaas@google.com>,
 David Airlie <airlied@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jan 17, 2024 at 09:54:47AM +0100, Philipp Stanner wrote:
> On Tue, 2024-01-16 at 12:44 -0600, Bjorn Helgaas wrote:
> > On Mon, Jan 15, 2024 at 03:46:12PM +0100, Philipp Stanner wrote:
> > > PCI's devres API is not extensible to ranged mappings and has
> > > bug-provoking features. Improve that by providing better
> > > alternatives.
> > 
> > I guess "ranged mappings" means a mapping that doesn't cover an
> > entire BAR?  Maybe there's a way to clarify?
> 
> That's what it's supposed to mean, yes.  We could give it the longer
> title "mappings smaller than the whole BAR" or something, I guess.

"partial BAR mappings"?

> > > to the creation of a set of "pural functions" such as

s/pural/plural/ (I missed this before).

> > >         c) The iomap-table mechanism is over-engineered,
> > > complicated and
> > >            can by definition not perform bounds checks, thus,
> > > provoking
> > >            memory faults: pcim_iomap_table(pdev)[42]
> > 
> > Not sure what "pcim_iomap_table(pdev)[42]" means.
> 
> That function currently is implemented with this prototype:
> void __iomem * const *pcim_iomap_table(struct pci_dev *pdev);
> 
> And apparently, it's intended to index directly over the function. And
> that's how at least part of the users use it indeed.
> 
> Here in drivers/crypto/inside-secure/safexcel.c, L.1919 for example:
> 
> 	priv->base = pcim_iomap_table(pdev)[0];
> 
> I've never seen something that wonderful in C ever before, so it's not
> surprising that you weren't sure what I mean....
> 
> pcim_iomap_table() can not and does not perform any bounds check. If
> you do
> 
> void __iomem *mappy_map_mapface = pcim_iomap_table(pdev)[42];
> 
> then it will just return random garbage, or it faults. No -EINVAL or
> anything. You won't even get NULL.
> 
> That's why this function must die.

No argument except that this example only makes sense after one looks
up the prototype and connects the dots.

Bjorn
