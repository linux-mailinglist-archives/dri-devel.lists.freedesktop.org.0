Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DD552EB4F3
	for <lists+dri-devel@lfdr.de>; Tue,  5 Jan 2021 22:42:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 847FC89D73;
	Tue,  5 Jan 2021 21:42:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 738AC89D63;
 Tue,  5 Jan 2021 21:42:28 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id E631822D71;
 Tue,  5 Jan 2021 21:42:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1609882948;
 bh=RV13AM04SAc6LnhsRXRgRzBjA8MJcHEMYVs3WSv1YU4=;
 h=Date:From:To:Cc:Subject:In-Reply-To:From;
 b=FnROa/W+BH0PRwdepuf4hbt3XxcxpJwCTOf/sNgiAkEdg5TrxHg0TSd3/7BUv9nlN
 G6Vdo3Kw4D766HGfhzoJPOV1jJGnP0MKrgwAI+ngrMWr1ceJ7VWiwutIC1Nb8BXofj
 niTCDDhgedr5jNEqEsL532UN9Hle9P+UxHUxDpflv38Ly2frAXoNWTVQnvEJ629xpH
 T3B0/1rZuPc06bGxpHZ1ncqjKQDEE/olagfNDkCRoL1GTLvKWQHNX50fdBvBiuvN8L
 Hhu2ndamXhGCDzkGNY0OLLDXcDlVPSvWUpju+vIcIZSdS68d6TscmvAgsZ/nWRUVW5
 4sE/IKKpf085g==
Date: Tue, 5 Jan 2021 15:42:26 -0600
From: Bjorn Helgaas <helgaas@kernel.org>
To: Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>
Subject: Re: A PCI quirk for resizeable BAR 0 on Navi10
Message-ID: <20210105214226.GA1263318@bjorn-Precision-5520>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210105134404.1545-1-christian.koenig@amd.com>
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
Cc: bhelgaas@google.com, devspam@moreofthesa.me.uk,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-pci@vger.kernel.org
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jan 05, 2021 at 02:44:00PM +0100, Christian K=F6nig wrote:
> Hi Bjorn,
> =

> Darren stumbled over an AMD GPU with nonsense in it's resizeable BAR capa=
bility dword.
> =

> This is most likely fixable with a VBIOS update, but we already sold quit=
e a bunch of those boards with the problem.
> =

> The driver still loads without this, but the performance isn't the best.
> =

> Do you have any objection to merge this through the drm branch?

I'm OK with this in general, but please pay attention to your commit
logs:

  - Subject line prefix is "PCI: " (capitalized).

  - First word of subject is capitalized ("Add ...", "Export ...").

  - No period at end of subject ("4/4 ... XT Pulse.").

  - No "v2" included in subject line ("PCI: Add BAR ... v2").

  - Include parentheses after function names, e.g.,
    "pci_rebar_get_possible_sizes()".

  - Commit logs should say directly what the patch does using
    imperative mood, not just "to assist with X".  E.g., "Export
    pci_rebar_get_possible_sizes() for use by modular drivers."
    This should make sense even without reading the subject line.

  - No "v2" verbiage included in commit log (you can include it after
    the "---" line if you want).  That verbiage in 2/4 also contains
    two typos.

  - 2/4 does two things, so split it into two patches.  Then the
    subject and commit logs will make more sense.

  - Splitting 2/4 will also give you an opportunity to explain why we
    need to change "static inline" to "static __always_inline".  If we
    don't need that change, don't change it.

    If we *do* need it, that means we likely need it for many other
    things in include/linux/pci.h, and I would want to fix all those
    places at once in a separate patch.

  - 4/4 should be more specific about what's wrong.  Based on the
    code, this device advertises support for BAR 0 being 256MB, 512MB,
    or 1GB, but it actually supports 2GB, 4GB, 8GB, and 16GB as well.
    Please spell that out in the commit log.  "Otherwise the CPU can't
    fully access the BAR" really doesn't tell me what the patch does.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
