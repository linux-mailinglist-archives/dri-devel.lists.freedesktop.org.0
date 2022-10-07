Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 145275F7256
	for <lists+dri-devel@lfdr.de>; Fri,  7 Oct 2022 02:40:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D9D810E6BB;
	Fri,  7 Oct 2022 00:39:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x72d.google.com (mail-qk1-x72d.google.com
 [IPv6:2607:f8b0:4864:20::72d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C2B6510E6BB;
 Fri,  7 Oct 2022 00:39:53 +0000 (UTC)
Received: by mail-qk1-x72d.google.com with SMTP id o22so1695864qkl.8;
 Thu, 06 Oct 2022 17:39:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Mj2EKWpfo6LoRYDkuVsvJBcVKzsfzIJ++jT12GdLtjw=;
 b=NNuJ21y4cpn/LHDvmMlpXXSqwGlnw4Enf3ugrTMqCr9Enfv1BKIsoBIvPZeN4gB2wD
 T879SHPsMRPk6FVeTnWkejya9x9QHUfcnj6Q83rPN3ymPCEep7T/nIkC5AMEaJKaD8KP
 mIr5CcRrbc1gEvyKtD4tEopP+xlPYqj6JaAnHQOVXK+8kgPcnPV0l4/KRsXT12/6S3S2
 J7iOU2tiAuaEP/UlKH+M2Jcpluupd/AhHIkkVuaaEs+8O/pyCO4lc/LViZEwRCeI125M
 aIftgKO7UQJCU7wjfkkpD3NQzVkMgs/jNrD7cbtaCKT2TVO1W29qLh1bLAYEfDpDTTYr
 /0rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Mj2EKWpfo6LoRYDkuVsvJBcVKzsfzIJ++jT12GdLtjw=;
 b=PtMrm+epMBTwu9HlbAphad+3scuK//eYeu+VRaPMHRhs4fiHkAhOBPGf2v9iTbEwCt
 2zL8CyMbbtKvyfGHCBP+rME5XqqFuNI36fCXJy64gF5P6yJUQIkdL2uSWEyjBBGBYWHr
 YWSkw36ShIewhKigiqR6AUXQQOt8SByNJF5txcUKetOHK0esSWcnVkX7OqI392glQfZS
 qG/MZ53wBc1m5JH0246jTP8Wd5pX3765lFax/5OC9RZnc0Fz3stJgrdwGpz71/z2xoj3
 pg8UWXWOWdcaqkSBssf5DvVRW45H2jiX2ffC3ShQJfgj4YtQaqKPKuw29vIbWJc3A1F3
 Ho/A==
X-Gm-Message-State: ACrzQf2jkib8N3yCbsRuLnCXESg8QqgldKqVeAlv6l+55VbOizNw0qop
 CiiVz6vZ4vwZEqa4DwMZH4ilhStHRtwWhqTwZYU=
X-Google-Smtp-Source: AMsMyM5E1MzJ9JQuEPVSkfHBhXtesLAjNLwtvKUUNIgWqw4vmmVqwk5Lo475kuPJV7EdDHi5CwLpb51+OhgddVqUX1g=
X-Received: by 2002:ae9:e011:0:b0:6e4:41aa:eb0f with SMTP id
 m17-20020ae9e011000000b006e441aaeb0fmr2272174qkk.8.1665103192715; Thu, 06 Oct
 2022 17:39:52 -0700 (PDT)
MIME-Version: 1.0
References: <20220928033340.1063949-1-zyytlz.wz@163.com>
 <20221006165845.1735393-1-zyytlz.wz@163.com>
 <Yz8rIxV7bVCcfZb0@kroah.com>
In-Reply-To: <Yz8rIxV7bVCcfZb0@kroah.com>
From: Zheng Hacker <hackerzheng666@gmail.com>
Date: Fri, 7 Oct 2022 08:39:41 +0800
Message-ID: <CAJedcCwwNFWU0_RQ1aG4WQc9JGUYWKKhKtZx_drV3T3n9UD3sQ@mail.gmail.com>
Subject: Re: [PATCH v2] drm/i915/gvt: fix double free bug in
 split_2MB_gtt_entry
To: Greg KH <gregkh@linuxfoundation.org>
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
Cc: alex000young@gmail.com, security@kernel.org, tvrtko.ursulin@linux.intel.com,
 airlied@linux.ie, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 1002992920@qq.com, Zheng Wang <zyytlz.wz@163.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Greg KH <gregkh@linuxfoundation.org> =E4=BA=8E2022=E5=B9=B410=E6=9C=887=E6=
=97=A5=E5=91=A8=E4=BA=94 03:22=E5=86=99=E9=81=93=EF=BC=9A
>
> On Fri, Oct 07, 2022 at 12:58:45AM +0800, Zheng Wang wrote:
> > If intel_gvt_dma_map_guest_page failed, it will call
> > ppgtt_invalidate_spt, which will finally free the spt.
> > But the caller does not notice that, it will free spt again in error pa=
th.
> >
> > Fix this by spliting invalidate and free in ppgtt_invalidate_spt.
> > Only free spt when in good case.
> >
> > Reported-by: Zheng Wang <hackerzheng666@gmail.com>
> > Signed-off-by: Zheng Wang <zyytlz.wz@163.com>
> > ---
> > v2:
> > - split initial function into two api function suggested by Greg
> >
> > v1: https://lore.kernel.org/all/20220928033340.1063949-1-zyytlz.wz@163.=
com/
> > ---
> >  drivers/gpu/drm/i915/gvt/gtt.c | 31 +++++++++++++++++++++----------
> >  1 file changed, 21 insertions(+), 10 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/i915/gvt/gtt.c b/drivers/gpu/drm/i915/gvt/=
gtt.c
> > index ce0eb03709c3..55d8e1419302 100644
> > --- a/drivers/gpu/drm/i915/gvt/gtt.c
> > +++ b/drivers/gpu/drm/i915/gvt/gtt.c
> > @@ -959,6 +959,7 @@ static inline int ppgtt_put_spt(struct intel_vgpu_p=
pgtt_spt *spt)
> >       return atomic_dec_return(&spt->refcount);
> >  }
> >
> > +static int  ppgtt_invalidate_and_free_spt(struct intel_vgpu_ppgtt_spt =
*spt);
>
> Odd extra space after the 'int', why?
>

Hi Greg,

Sorry it's a spelling mistake. I'll correct it right away :)

Thanks,
Zheng Wang
