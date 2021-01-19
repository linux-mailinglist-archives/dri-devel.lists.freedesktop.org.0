Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A3A92FC02F
	for <lists+dri-devel@lfdr.de>; Tue, 19 Jan 2021 20:41:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 13ED86E241;
	Tue, 19 Jan 2021 19:41:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C90176E884;
 Tue, 19 Jan 2021 19:41:43 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 2375922AAA;
 Tue, 19 Jan 2021 19:41:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1611085303;
 bh=TnO8ugrL48XJWa3g2ivpjW9IGaxfuzLgSivb6haGxSI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=fCuoFvqxwF3jwgzRIl992WtFbHrECE5onOMaHYlH20ANmvVHcgV+bnWugwew1P7Ad
 8nBKq1cdLoiQ5B7/doMTSZltIZaOR2R4NODIbtZS3O7Dx/ObqXRxXzwFL0/NxxLtH5
 RAY03hgFxQBW+CN1VbkvpitvivyWbSDw1l03OoQk=
Date: Tue, 19 Jan 2021 20:41:40 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Alex Deucher <alexdeucher@gmail.com>
Subject: Re: [PATCH v4 10/14] dmr/amdgpu: Move some sysfs attrs creation to
 default_attr
Message-ID: <YAc19FJNeDprTyL6@kroah.com>
References: <1611003683-3534-1-git-send-email-andrey.grodzovsky@amd.com>
 <1611003683-3534-11-git-send-email-andrey.grodzovsky@amd.com>
 <YAaLmBMlDRr56erH@kroah.com>
 <3650d98a-2d73-06b8-7f06-ca7728b5c4b5@amd.com>
 <YAcbIF8xaMcuSWG3@kroah.com>
 <CADnq5_PNFQ+3tmRXjY2m22Pnx=neqMC_PTtqrObrdeg0LQUo_w@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CADnq5_PNFQ+3tmRXjY2m22Pnx=neqMC_PTtqrObrdeg0LQUo_w@mail.gmail.com>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>,
 "Deucher, Alexander" <Alexander.Deucher@amd.com>, Qiang Yu <yuq825@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jan 19, 2021 at 02:04:48PM -0500, Alex Deucher wrote:
> On Tue, Jan 19, 2021 at 1:26 PM Greg KH <gregkh@linuxfoundation.org> wrote:
> >
> > On Tue, Jan 19, 2021 at 11:36:01AM -0500, Andrey Grodzovsky wrote:
> > >
> > > On 1/19/21 2:34 AM, Greg KH wrote:
> > > > On Mon, Jan 18, 2021 at 04:01:19PM -0500, Andrey Grodzovsky wrote:
> > > > >   static struct pci_driver amdgpu_kms_pci_driver = {
> > > > >           .name = DRIVER_NAME,
> > > > >           .id_table = pciidlist,
> > > > > @@ -1595,6 +1607,7 @@ static struct pci_driver amdgpu_kms_pci_driver = {
> > > > >           .shutdown = amdgpu_pci_shutdown,
> > > > >           .driver.pm = &amdgpu_pm_ops,
> > > > >           .err_handler = &amdgpu_pci_err_handler,
> > > > > + .driver.dev_groups = amdgpu_sysfs_groups,
> > > > Shouldn't this just be:
> > > >     groups - amdgpu_sysfs_groups,
> > > >
> > > > Why go to the "driver root" here?
> > >
> > >
> > > Because I still didn't get to your suggestion to propose a patch to add groups to
> > > pci_driver, it's located in 'base' driver struct.
> >
> > You are a pci driver, you should never have to mess with the "base"
> > driver struct.  Look at commit 92d50fc1602e ("PCI/IB: add support for
> > pci driver attribute groups") which got merged in 4.14, way back in
> > 2017 :)
> 
> Per the previous discussion of this patch set:
> https://www.mail-archive.com/amd-gfx@lists.freedesktop.org/msg56019.html

Hey, at least I'm consistent :)
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
