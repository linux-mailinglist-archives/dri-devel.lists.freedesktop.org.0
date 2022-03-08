Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BCE6F4D16DF
	for <lists+dri-devel@lfdr.de>; Tue,  8 Mar 2022 13:08:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BEA8810E22E;
	Tue,  8 Mar 2022 12:08:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com
 [IPv6:2607:f8b0:4864:20::1032])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 315EF10E22E
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Mar 2022 12:08:08 +0000 (UTC)
Received: by mail-pj1-x1032.google.com with SMTP id
 mg21-20020a17090b371500b001bef9e4657cso2080044pjb.0
 for <dri-devel@lists.freedesktop.org>; Tue, 08 Mar 2022 04:08:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=wDBr7QwdywRBFUEWNO7fku9CwLpUz82JDlHdFDPI61w=;
 b=DANPnIyG86t/z+uB1cXDGqDG0Uj24La82z8cMs0plB99CyNr06Q68qpDjBLbrNZnr4
 PlxlglE4NneFjB1n8KOhmZkKLgab4doq0efazTaXmSclxU+DigWmo150iBBPhksXVC6Y
 2U7U25Zhqmiv7drUg/Tle6tvq0M0fsOD3Q0BNjW7FRJoeSdb59QkydeMgMeGknLPi6xQ
 iWTkxNcvJ9tABDFHua1CL1gzXssoDWDOcQ8bA5MHKddT86h97l40n64LgChS+xronDil
 /DAeUNSVoAK4C/JHWtH5okffqAn5vVqcnZvX+IrGenAm4qxPxPtAujkw+cSqU4jkeirn
 cr8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=wDBr7QwdywRBFUEWNO7fku9CwLpUz82JDlHdFDPI61w=;
 b=sJnSApEsbS5dzmSR9i23xfCP0/H2yTNslkU6NyRenkgChBcROp82EtQNTIaf61CPsv
 NGqCNbhDyDBLBnhIhB91yAkBSealIZafi/vBck/xQL8wiD//miVWfM/jGoyI6KeNzr2y
 b0jeGiGObMI00nMcwnFgeNjlTKT7TAIaWVga4XfE4P/ra6+prmjQLj7La2TNI3cpPoJd
 WGz2dEwMcyBsnLKn1/Pk1l4V3H1yPF5QWTenvRJBHI/yX5/+89ymMtK68qPL+wv1xAAy
 7SmV+RY2kugsosO/UMaYmMWU1rDTDozlZY5pzsCbDSZvcBhdiViCvl8kjeAXSnMCoZGW
 +/7A==
X-Gm-Message-State: AOAM532xduZbJXw+QWDE9BAhOrb2BK9+/E5x0L5IfCbU6ZrD3/imLB3e
 OFvME679LWGymVkSdjdMEsoEidZj3tDYyZyPM/0=
X-Google-Smtp-Source: ABdhPJzE5Mbg3JOF8e3Y08Z/he0m+EK26X+3jzC+JZ2xfUC+V1+vczk7bRBoTzh/d3KHiP91hUoSWJwpY08eNJRgqOY=
X-Received: by 2002:a17:90a:eb0b:b0:1be:ddea:3d7b with SMTP id
 j11-20020a17090aeb0b00b001beddea3d7bmr4292310pjz.90.1646741287661; Tue, 08
 Mar 2022 04:08:07 -0800 (PST)
MIME-Version: 1.0
References: <20220306203619.22624-1-tzimmermann@suse.de>
 <20220306203619.22624-7-tzimmermann@suse.de>
 <YiZYAFdM28igTrC3@ravnborg.org>
 <CAMeQTsY9VRvy8t4=GTOa9rD9HFBnRqFj9NxQ2ofig1JVkiLfKw@mail.gmail.com>
 <f8706174-c85c-94a5-b475-8b537dba7c1c@suse.de>
In-Reply-To: <f8706174-c85c-94a5-b475-8b537dba7c1c@suse.de>
From: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
Date: Tue, 8 Mar 2022 13:07:56 +0100
Message-ID: <CAMeQTsb7XheM-iEy8QKfaBU23LKu8mU_moy7qQw0iFAqLxVKcg@mail.gmail.com>
Subject: Re: [PATCH 06/10] drm/gma500: Move GTT resume logic out of
 psb_gtt_init()
To: Thomas Zimmermann <tzimmermann@suse.de>
Content-Type: text/plain; charset="UTF-8"
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
Cc: David Airlie <airlied@linux.ie>, Sam Ravnborg <sam@ravnborg.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Mar 8, 2022 at 9:48 AM Thomas Zimmermann <tzimmermann@suse.de> wrote:
>
> Hi Sam and Patrik
>
> Am 07.03.22 um 22:02 schrieb Patrik Jakobsson:
> > On Mon, Mar 7, 2022 at 8:07 PM Sam Ravnborg <sam@ravnborg.org> wrote:
> >>
> >> Hi Thomas,
> >>
> >> One comment below.
> >>
> >> On Sun, Mar 06, 2022 at 09:36:15PM +0100, Thomas Zimmermann wrote:
> >>> The current implementation of psb_gtt_init() also does resume
> >>> handling. Move the resume code into its own helper.
> >>>
> >>> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> >>> ---
> >>>   drivers/gpu/drm/gma500/gtt.c     | 122 ++++++++++++++++++++++++++-----
> >>>   drivers/gpu/drm/gma500/gtt.h     |   2 +-
> >>>   drivers/gpu/drm/gma500/psb_drv.c |   2 +-
> >>>   3 files changed, 104 insertions(+), 22 deletions(-)
> >>>
> >>> diff --git a/drivers/gpu/drm/gma500/gtt.c b/drivers/gpu/drm/gma500/gtt.c
> >>> index acd50ee26b03..43ad3ec38c80 100644
> >>> --- a/drivers/gpu/drm/gma500/gtt.c
> >>> +++ b/drivers/gpu/drm/gma500/gtt.c
> >>> @@ -209,7 +209,7 @@ static void psb_gtt_populate_resources(struct drm_psb_private *pdev)
> >>>        drm_dbg(dev, "Restored %u of %u gtt ranges (%u KB)", restored, total, (size / 1024));
> >>>   }
> >>>
> >>> -int psb_gtt_init(struct drm_device *dev, int resume)
> >>> +int psb_gtt_init(struct drm_device *dev)
> >>>   {
> >>>        struct drm_psb_private *dev_priv = to_drm_psb_private(dev);
> >>>        struct pci_dev *pdev = to_pci_dev(dev->dev);
> >>> @@ -218,10 +218,8 @@ int psb_gtt_init(struct drm_device *dev, int resume)
> >>>        struct psb_gtt *pg;
> >>>        int ret = 0;
> >>>
> >>> -     if (!resume) {
> >>> -             mutex_init(&dev_priv->gtt_mutex);
> >>> -             mutex_init(&dev_priv->mmap_mutex);
> >>> -     }
> >>> +     mutex_init(&dev_priv->gtt_mutex);
> >>> +     mutex_init(&dev_priv->mmap_mutex);
> >>>
> >>>        pg = &dev_priv->gtt;
> >>>
> >>> @@ -290,13 +288,6 @@ int psb_gtt_init(struct drm_device *dev, int resume)
> >>>        dev_dbg(dev->dev, "Stolen memory base 0x%x, size %luK\n",
> >>>                        dev_priv->stolen_base, vram_stolen_size / 1024);
> >>>
> >>> -     if (resume && (gtt_pages != pg->gtt_pages) &&
> >>> -         (stolen_size != pg->stolen_size)) {
> >>> -             dev_err(dev->dev, "GTT resume error.\n");
> >>> -             ret = -EINVAL;
> >>> -             goto out_err;
> >>> -     }
> >>> -
> >>>        pg->gtt_pages = gtt_pages;
> >>>        pg->stolen_size = stolen_size;
> >>>        dev_priv->vram_stolen_size = vram_stolen_size;
> >>> @@ -304,19 +295,14 @@ int psb_gtt_init(struct drm_device *dev, int resume)
> >>>        /*
> >>>         *      Map the GTT and the stolen memory area
> >>>         */
> >>> -     if (!resume)
> >>> -             dev_priv->gtt_map = ioremap(pg->gtt_phys_start,
> >>> -                                             gtt_pages << PAGE_SHIFT);
> >>> +     dev_priv->gtt_map = ioremap(pg->gtt_phys_start, gtt_pages << PAGE_SHIFT);
> >>>        if (!dev_priv->gtt_map) {
> >>>                dev_err(dev->dev, "Failure to map gtt.\n");
> >>>                ret = -ENOMEM;
> >>>                goto out_err;
> >>>        }
> >>>
> >>> -     if (!resume)
> >>> -             dev_priv->vram_addr = ioremap_wc(dev_priv->stolen_base,
> >>> -                                              stolen_size);
> >>> -
> >>> +     dev_priv->vram_addr = ioremap_wc(dev_priv->stolen_base, stolen_size);
> >>>        if (!dev_priv->vram_addr) {
> >>>                dev_err(dev->dev, "Failure to map stolen base.\n");
> >>>                ret = -ENOMEM;
> >>> @@ -333,11 +319,107 @@ int psb_gtt_init(struct drm_device *dev, int resume)
> >>>        return ret;
> >>>   }
> >>>
> >> The below is a lot of duplicated complex code.
> >> Can you add one more helper for this?
> >
>
> That makes a lot of sense.
>
> > I was thinking the same but figured it would be an easy follow up
> > patch. But sure, why not fix it here already.
> >
> > While at it, the gtt enable/disable code could be put in helpers as well.
>
> Patrik, do you know why the code re-reads all these values during
> resume? Do the values change?  The driver never seems to do anything
> with the updated values. For example, it doesn't update the GTT mapping
> if gtt_phys_start changes.  Can we remove all that code from the resume
> function?

In theory these values can change if you hibernate, make changes in
the bios and then resume. I think I've seen bioses that can change the
stolen size and/or aperture size. Not sure if that would also change
the value in eg. pge_ctl or the size of the gtt. I would have to do
some testing on real hardware to figure this out.
But as you say, the above scenario is already broken. For the time
being, can we perhaps just fail gracefully?
