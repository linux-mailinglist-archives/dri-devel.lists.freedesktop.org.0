Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 23651992DCF
	for <lists+dri-devel@lfdr.de>; Mon,  7 Oct 2024 15:51:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 089B010E15D;
	Mon,  7 Oct 2024 13:51:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="CYOQYw+9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B2AB610E15D;
 Mon,  7 Oct 2024 13:51:27 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 541405C54D8;
 Mon,  7 Oct 2024 13:51:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5106AC4CEC6;
 Mon,  7 Oct 2024 13:51:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1728309086;
 bh=Af38W6K14UukOEOgx0/mvgFmNDN3th5anBo4M2ARqD8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=CYOQYw+9XtOkvTunR9e38VIVowN1HzmEpxK9oazjAOIT8u+nZpZOeZd+BHJW9NAZZ
 ffuG0u9XKF8lbBICED9/x6YC4Vpt7/zlQaTJpWBEq4uiiUuyRvhLn+N9LOgaeMeDP/
 VXnhsALO+3r57KtWSGLtebuB3nuDOcoQbPC2lUAJqOYkC8TqVnCO98oZmRwXNeWiis
 vPSMS0ca1LAPd3KcwpVQgX9PK4PJSTuBtp6z4hcsFc0Gm6/8w4lfAC1ay6sduoqTN/
 hn61yCmMmifgqJSeoy1ey1MJ1Zk6CWZZnqKf2unlTW0P2ur/TT2gozgx1sMC2US0/c
 9IjSzIHTFuYAQ==
Date: Mon, 7 Oct 2024 15:51:19 +0200
From: Danilo Krummrich <dakr@kernel.org>
To: Yonatan Maman <ymaman@nvidia.com>
Cc: nouveau@lists.freedesktop.org, Gal Shalom <GalShalom@nvidia.com>,
 kherbst@redhat.com, lyude@redhat.com, dakr@redhat.com,
 airlied@gmail.com, daniel@ffwll.ch, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] nouveau/dmem: Fix memory leak in `migrate_to_ram`
 upon copy error
Message-ID: <ZwPnV2OPJhOUcsU0@pollux>
References: <20240923135449.356244-1-Ymaman@Nvidia.com>
 <20240923135449.356244-3-Ymaman@Nvidia.com>
 <ZvqJgMVBs2kAWguk@pollux>
 <f9fa14c1-f487-4ad9-9bc9-7c1db6de1ae6@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f9fa14c1-f487-4ad9-9bc9-7c1db6de1ae6@nvidia.com>
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

On Mon, Oct 07, 2024 at 03:28:22PM +0300, Yonatan Maman wrote:
> 
> 
> On 30/09/2024 14:20, Danilo Krummrich wrote:
> > External email: Use caution opening links or attachments
> > 
> > 
> > On Mon, Sep 23, 2024 at 01:54:58PM +0000, Yonatan Maman wrote:
> > > A copy push command might fail, causing `migrate_to_ram` to return a
> > > dirty HIGH_USER page to the user.
> > > 
> > > This exposes a security vulnerability in the nouveau driver. To prevent
> > > memory leaks in `migrate_to_ram` upon a copy error, allocate a zero
> > > page for the destination page.
> > 
> > So, you refer to the case where this function fails in nouveau_dmem_copy_one()?
> > 
> > If so, can you please explain why adding __GFP_ZERO to alloc_page_vma() helps
> > with that?
> > 
> 
> The nouveau_dmem_copy_one function ensures that the copy push command is
> sent to the device firmware but does not track whether it was executed
> successfully.
> 
> In the case of a copy error (e.g., firmware or hardware error), the command
> will be sent in the firmware channel, and nouveau_dmem_copy_one might
> succeed, as well as the migrate_to_ram function. Thus, a dirty page could be
> returned to the user.
> 
> It’s important to note that we attempted to use nouveau_fence_wait status to
> handle migration errors, but it does not catch all error types.
> 
> To avoid this vulnerability, we allocate a zero page. So that, in case of an
> error, a non-dirty (zero) page will be returned to the user.

I see, I got confused by calling this a 'memory leak'.

Please add this description in the commit message and avoid the term 'memory
leak' in this context.

> 
> > > 
> > > Signed-off-by: Yonatan Maman <Ymaman@Nvidia.com>
> > > Signed-off-by: Gal Shalom <GalShalom@Nvidia.com>
> > 
> > Since this is a bug, please also add a 'Fixes' tag, CC stable and add a
> > 'Co-developed-by' tag if appropriate.
> 
> sure, thanks, I will add, and push it as V2 patch-series.
> > 
> > > ---
> > >   drivers/gpu/drm/nouveau/nouveau_dmem.c | 2 +-
> > >   1 file changed, 1 insertion(+), 1 deletion(-)
> > > 
> > > diff --git a/drivers/gpu/drm/nouveau/nouveau_dmem.c b/drivers/gpu/drm/nouveau/nouveau_dmem.c
> > > index 6fb65b01d778..097bd3af0719 100644
> > > --- a/drivers/gpu/drm/nouveau/nouveau_dmem.c
> > > +++ b/drivers/gpu/drm/nouveau/nouveau_dmem.c
> > > @@ -193,7 +193,7 @@ static vm_fault_t nouveau_dmem_migrate_to_ram(struct vm_fault *vmf)
> > >        if (!spage || !(src & MIGRATE_PFN_MIGRATE))
> > >                goto done;
> > > 
> > > -     dpage = alloc_page_vma(GFP_HIGHUSER, vmf->vma, vmf->address);
> > > +     dpage = alloc_page_vma(GFP_HIGHUSER | __GFP_ZERO, vmf->vma, vmf->address);
> > >        if (!dpage)
> > >                goto done;
> > > 
> > > --
> > > 2.34.1
> > > 
> 
