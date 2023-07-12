Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 66CE374FECE
	for <lists+dri-devel@lfdr.de>; Wed, 12 Jul 2023 07:43:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF55C10E48F;
	Wed, 12 Jul 2023 05:43:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A274210E48F;
 Wed, 12 Jul 2023 05:43:06 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id D54C5615AE;
 Wed, 12 Jul 2023 05:43:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CD1C4C433C8;
 Wed, 12 Jul 2023 05:43:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1689140584;
 bh=X5WCLxSc/gFxq+FunItuY2//SgfAsofnt1zHjwb5AiU=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=ah+DjOaiwgYFyKRzwtpHxRRyFxOm3D21AlLj9JHruB50mtI6ugoYM4kLSTM4YxY+9
 K/GIirYqpCorv2/f+20sFu1k2vOOM1FCVLBuJ1QNdDfyuspH3P2T/dIENIFqCYg6y/
 DBKqynmKpVqL3sNzGlxDLJDJO1za8OEAANcYU9dzGhTWHtNBoiT7kETY5FJn8a/7UC
 bIxEMbB5vsfsTGwtWHiwoLNDQmgDeuB0gSP3p2epeR4eq5d1FLbm442bytUXisBD16
 lN7m3txhCunJL2iT/aBJDDuk3qMFad3D9uyjhuFOBfD1ai8zk8CxkycsXyXKLKTwAV
 U8WqB7wUPsl2w==
Date: Wed, 12 Jul 2023 07:42:58 +0200
From: Mauro Carvalho Chehab <mchehab@kernel.org>
To: Randy Dunlap <rdunlap@infradead.org>
Subject: Re: scripts/kernel-doc does not handle duplicate struct & function
 names (e.g., in amdgpu)
Message-ID: <20230712074258.3602b6e8@coco.lan>
In-Reply-To: <58cafdc0-0209-cfdd-c8e0-2dd25d73a184@infradead.org>
References: <b5ebc891-ee63-1638-0377-7b512d34b823@infradead.org>
 <0475d177-4c01-0988-0b34-3099dd703498@gmail.com>
 <58cafdc0-0209-cfdd-c8e0-2dd25d73a184@infradead.org>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.37; x86_64-redhat-linux-gnu)
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
Cc: corbet@lwn.net, linux-doc@vger.kernel.org,
 Akira Yokosawa <akiyks@gmail.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Em Tue, 11 Jul 2023 20:45:18 -0700
Randy Dunlap <rdunlap@infradead.org> escreveu:

> On 7/11/23 20:32, Akira Yokosawa wrote:
> > Hi Randy,
> >   
> >> [just documenting this for posterity or in case someone wants to fix it.]
> >>
> >> In drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c, one can find both
> >>
> >> struct amdgpu_vm_tlb_seq_cb {...};
> >>
> >> and
> >> static void amdgpu_vm_tlb_seq_cb(...)
> >>
> >> Of course C has no problem with this, but kernel-doc reports:
> >>
> >> drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c:833: WARNING: Duplicate C declaration, also defined at gpu/amdgpu/driver-core:115.
> >>
> >> And of course, if the name of one of them is changed, kernel-doc is all happy...
> >> not that I am suggesting that one of them should be changed.
> >>
> >> I just want to make people aware of this. (or maybe people are already aware of this?)  
> > 
> > The duplicate warning is emitted from Sphinx, not kernel-doc.
> > 
> > This is a bug of Sphinx >=3.1, first reported by Mauro back in September 2020 at:
> > 
> >     https://github.com/sphinx-doc/sphinx/issues/8241
> > 
> > It was closed when a local fix was presented.  Unfortunately, it was not
> > merged at the time and a subsequent pull request was opened at:
> > 
> >     https://github.com/sphinx-doc/sphinx/pull/8313
> > 
> > It is not merged yet and carries a milestone of Sphinx 7.x.
> > 
> > Looks like we need to wait patiently.
> > 
> >         Thanks, Akira  
> 
> Ooooh, thanks for your assistance.  Waiting.... :)

Yeah, we've been waiting this since Sphinx version 3.x times :-(

It seems that applying the fix would break an extension
(intersphinx). We don't use at the Kernel, so it won't affect
us, but it seems to be a popular extension, as it allows one
web server to have cross-references to Sphinx docs produced
elsewhere. Btw, such extension could be interesting on partial
doc builds (e. g. make SPHNXDIRS="foo_dir" htmldocs), as the
non-existing cross-references would be pointing, for instance,
to the docs stored at kernel.doc latest docs.

Btw, I'm still using version 2.4.4 when building the docs
to avoid the wrong duplicate warnings with 3.1+ due to this bug.

Thanks,
Mauro
