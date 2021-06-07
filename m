Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E9E939DDEA
	for <lists+dri-devel@lfdr.de>; Mon,  7 Jun 2021 15:42:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2EDCC6E8C9;
	Mon,  7 Jun 2021 13:42:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x235.google.com (mail-oi1-x235.google.com
 [IPv6:2607:f8b0:4864:20::235])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2966A6E8C7;
 Mon,  7 Jun 2021 13:42:52 +0000 (UTC)
Received: by mail-oi1-x235.google.com with SMTP id z3so18062670oib.5;
 Mon, 07 Jun 2021 06:42:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=PBl1oQb0REvQQKwpKMpTQoTdXm5nunxZT4Ar8PjX/i4=;
 b=APbMb91gD1zIPIZTawQsDQLPOx+rb2op11WQRTpSn+xBFsVowr7scb7WdSPA9hWZUJ
 AC3VYMUhRCmedN6If9GhtwC5ZFepZqexOxHytKONlL57LU+YqPMVe9JDo76vt/rCiSlp
 CISlolqHTQk5Cp5lXyaOOYYWvKUziDDRZjPuNqB1kBGJAS2RsIgBk2peV+42ra2UrUtQ
 ald8PqhSl2dM3avyYWumR/QZAxFySDdVsO4oymrNMw2G3RPfo+17GEO2vynXMaY1Dbs9
 eBdxr8vFkVqYhcjNXLIaf1HuVgHtOz6qmoNKVQ0fmcBIbKGQeEXA9py239srn67H+ntB
 7yRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=PBl1oQb0REvQQKwpKMpTQoTdXm5nunxZT4Ar8PjX/i4=;
 b=cQfJTaMskXG09AcOaM2wERWFBpDKQ9zTCnnwKwsxglyWJxsh6SRH2lCT3Dn/80bKrq
 tJ0KsQ47qHgEugJ2pvNaLFR/r6mO+6LI7qMbE+WPBgv19eq4xl+IvZkR/953qLeeFZgN
 kF3KqdT6KQzbygU0SzMFOF9YyjAZgLimDvbW1CHuV+GG00OaKbRkoE4ut8LG6KPOxeqU
 HPW3Qx1asMCZ9o8rjMji2XDNMD0V66X5LQI8a5PljPs2/clXUZHucrbDrW8Wn1Ty95EO
 x7JiJbaaTJ4bf8VrZoBs6E5ah5YRDdq8fWUhG+zYmMhGEPZFS90IHtlJGAOCbifFP8XN
 5Mcw==
X-Gm-Message-State: AOAM533RtY9P/f3qMpUybxf0kl7D56DLXa9AIlShbVfkUcWnE2Ebktg2
 v3kn5rC7M4OfuFU5tghI3BFpatIWS3U2RbrNCdc=
X-Google-Smtp-Source: ABdhPJyJai1JHNwwk+/qjkmNo3l3kzPLjZMtG9Ot8j4cMwfxFgwzzQTR0Mg4g027PYF+cdH5DFhuKuTjlhKOBZkQvTE=
X-Received: by 2002:a05:6808:c3:: with SMTP id t3mr2097628oic.5.1623073370050; 
 Mon, 07 Jun 2021 06:42:50 -0700 (PDT)
MIME-Version: 1.0
References: <1623068820-2479-1-git-send-email-yangtiezhu@loongson.cn>
 <0d1b517f-797f-e87d-4edd-8474b16993ed@amd.com>
In-Reply-To: <0d1b517f-797f-e87d-4edd-8474b16993ed@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 7 Jun 2021 09:42:39 -0400
Message-ID: <CADnq5_PvZRu0h60dn-=4v0aXBOaNy=s0KjmeuSndDzU3C8qFog@mail.gmail.com>
Subject: Re: [PATCH] drm/radeon: Always call radeon_suspend_kms() in
 radeon_pci_shutdown()
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: David Airlie <airlied@linux.ie>, LKML <linux-kernel@vger.kernel.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Jianmin Lv <lvjianmin@loongson.cn>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>, Tiezhu Yang <yangtiezhu@loongson.cn>,
 Xuefeng Li <lixuefeng@loongson.cn>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jun 7, 2021 at 8:30 AM Christian K=C3=B6nig <christian.koenig@amd.c=
om> wrote:
>
> Am 07.06.21 um 14:27 schrieb Tiezhu Yang:
> > radeon_suspend_kms() puts the hw in the suspend state (all asics),
> > it should always call radeon_suspend_kms() in radeon_pci_shutdown(),
> > this is a normal cleanup process to avoid more operations on radeon,
> > just remove #ifdef CONFIG_PPC64 and the related comments.
>
> Well NAK.
>
> Alex knows more about the details but suspending should not be part of
> the pci shotdown process at all.
>
> We just add that here to enforce a GPU reset on PPC64 boards for some
> reason.

Everything in the comment still applies.

Alex

>
> Regards,
> Christian.
>
> >
> > Co-developed-by: Jianmin Lv <lvjianmin@loongson.cn>
> > Signed-off-by: Jianmin Lv <lvjianmin@loongson.cn>
> > Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
> > ---
> >   drivers/gpu/drm/radeon/radeon_drv.c | 9 ---------
> >   1 file changed, 9 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/radeon/radeon_drv.c b/drivers/gpu/drm/rade=
on/radeon_drv.c
> > index efeb115..0b1f43d 100644
> > --- a/drivers/gpu/drm/radeon/radeon_drv.c
> > +++ b/drivers/gpu/drm/radeon/radeon_drv.c
> > @@ -386,16 +386,7 @@ radeon_pci_shutdown(struct pci_dev *pdev)
> >       if (radeon_device_is_virtual())
> >               radeon_pci_remove(pdev);
> >
> > -#ifdef CONFIG_PPC64
> > -     /*
> > -      * Some adapters need to be suspended before a
> > -      * shutdown occurs in order to prevent an error
> > -      * during kexec.
> > -      * Make this power specific becauase it breaks
> > -      * some non-power boards.
> > -      */
> >       radeon_suspend_kms(pci_get_drvdata(pdev), true, true, false);
> > -#endif
> >   }
> >
> >   static int radeon_pmops_suspend(struct device *dev)
>
