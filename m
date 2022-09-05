Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B34895ADF71
	for <lists+dri-devel@lfdr.de>; Tue,  6 Sep 2022 08:12:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 99C4F10E569;
	Tue,  6 Sep 2022 06:11:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb2a.google.com (mail-yb1-xb2a.google.com
 [IPv6:2607:f8b0:4864:20::b2a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B128E10E221;
 Mon,  5 Sep 2022 08:53:41 +0000 (UTC)
Received: by mail-yb1-xb2a.google.com with SMTP id 11so11924933ybu.0;
 Mon, 05 Sep 2022 01:53:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date;
 bh=/pV2O0LzRWD83l6/jD0rtHLxlqUObMDm7uvvnSIQmGc=;
 b=JKD28+KNbsLLTDcJUSuELgoPlKu5YIRp5QZSmrEOFawOF6K5/5DChQtAhhxGF8ONCn
 +QRJ7TgPO7CQOHuoeTcAfrnr2OigYoscUzd3BOTJwSVJdttD3w+6V4pkabYRKuQbiu6Y
 WW7VVU/LS8FX76Q3i45nCYnAd3FiYxTLpGEwoZ8GPZD4jXg7s/rl7x2tYCkzjRAhtXgF
 z/CbHtbJYrM8B5PERGv4gQZaJ2lJ9PoTPvPaYwYaDXEBXtg1w6CRbo4XY4+8HGBU4G/N
 UZ/uyEZSDfPrjimlDN9R8dw4mswE59Y7MnANy1BpyQxR9mEpTTeAOPakRIAOqpWD9jLN
 12Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date;
 bh=/pV2O0LzRWD83l6/jD0rtHLxlqUObMDm7uvvnSIQmGc=;
 b=mF6yeGI62Yl8kv0TO4xMu/7NWCV4Wjf89aa0poW3FQo8zbyN9MQS7jFTSzHI6VX4PS
 AvIUwWUm0Sf/SwV024eNbnoMGaMCNXAPrXAqpurHgDUL0CTlHYsn6aRIWBkWCywQ2Ins
 1ja7HK9C6q+0iywWA+OtjbnVyiVpJl9WgChBN4L2Uj5r4U74KPjbuc/p+ePyUJ1GKJeW
 igFaeHYSgPYvl4MnxhiYH6rIyROACK/9brkBEz/d1YLV5Ew2LROhVwnUzuVAmdmwGFNd
 vtLG4sve9LT8ILMDnk2muxInPZecLyC1LsnMGEjsZyxIhXoFYOSgO+kxL5FsIk5Gs1vB
 BZtg==
X-Gm-Message-State: ACgBeo2SrTbDM4Hq6W1a5Mp07PGDyuTjKddr9PBLu//4ZpfeRF1igex6
 ew04EE3sB2QGgpOYprOTVBVtCbJ41nyqkoixEyw=
X-Google-Smtp-Source: AA6agR5ZoT8N/kx3Hp+YXfHmKmfG/qcnkF+Mi6m8yvrs5x8843emp7V1dIC4jkLetItugqNAEs6WUpxoVUdeZuRVj2U=
X-Received: by 2002:a25:d087:0:b0:6a9:1991:d3fb with SMTP id
 h129-20020a25d087000000b006a91991d3fbmr3544564ybg.130.1662368020106; Mon, 05
 Sep 2022 01:53:40 -0700 (PDT)
MIME-Version: 1.0
References: <tencent_E1BBF05904DFB73C478DCD592740AAE0780A@qq.com>
 <CAJedcCxVW++iH49UFZp9ruUuTcNubWCH6Wsqe11K4COB3E8msg@mail.gmail.com>
 <CAJedcCw1eJqjSK+yR7eQMDheNtH3Mjm+viwt00xAhnmrfpq2pw@mail.gmail.com>
 <CAJedcCweHjD78F7iydiq6Xc2iH=t_3m=H9JKnaCooToUk32FvQ@mail.gmail.com>
 <YxWtfjfpNsoPUrgh@kroah.com>
In-Reply-To: <YxWtfjfpNsoPUrgh@kroah.com>
From: Alex Young <alex000young@gmail.com>
Date: Mon, 5 Sep 2022 16:53:28 +0800
Message-ID: <CAFC++j0_11fpgGaAdDsQUyTzCG8KU0cO1ufMYFzACWquJALuZg@mail.gmail.com>
Subject: Re: [PATCH] drm/i915/gvt: fix double-free bug in split_2MB_gtt_entry.
To: Greg KH <gregkh@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Tue, 06 Sep 2022 06:11:24 +0000
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
Cc: tvrtko.ursulin@linux.intel.com, security@kernel.org,
 dri-devel@lists.freedesktop.org, airlied@linux.ie,
 intel-gfx@lists.freedesktop.org, Zheng Hacker <hackerzheng666@gmail.com>,
 linux-kernel@vger.kernel.org, xmzyshypnc <1002992920@qq.com>,
 rodrigo.vivi@intel.com, intel-gvt-dev@lists.freedesktop.org,
 zhi.a.wang@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Thanks for your reply.

We think that when intel_gvt_dma_map_guest_page() fails,
ppgtt_invalidate_spt is called to handle this error.

If the ppgtt_invalidate_spt is successful to kfree the spt object,
then in the ppgtt_populate_spt function there  is no need to kfree the
spt again.

And if the ppgtt_invalidate_spt failed, then in the ppgtt_populate_spt
function there is need to kfree the spt for error handling.

This is our fix, if it's not right, we are glad to discuss with you.

Greg KH <gregkh@linuxfoundation.org> =E4=BA=8E2022=E5=B9=B49=E6=9C=885=E6=
=97=A5=E5=91=A8=E4=B8=80 16:04=E5=86=99=E9=81=93=EF=BC=9A
>
> On Mon, Sep 05, 2022 at 03:46:09PM +0800, Zheng Hacker wrote:
> > I rewrote the letter. Hope it works.
> >
> > There is a double-free security bug in split_2MB_gtt_entry.
> >
> > Here is a calling chain :
> > ppgtt_populate_spt->ppgtt_populate_shadow_entry->split_2MB_gtt_entry.
> > If intel_gvt_dma_map_guest_page failed, it will call
> > ppgtt_invalidate_spt, which will finally call ppgtt_free_spt and
> > kfree(spt). But the caller does not notice that, and it will call
> > ppgtt_free_spt again in error path.
> >
> > Fix this by returning the result of ppgtt_invalidate_spt to split_2MB_g=
tt_entry.
> >
> > Signed-off-by: Zheng Wang
> >
> > ---
> >  drivers/gpu/drm/i915/gvt/gtt.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/i915/gvt/gtt.c b/drivers/gpu/drm/i915/gvt/=
gtt.c
> > index ce0eb03709c3..9f14fded8c0c 100644
> > --- a/drivers/gpu/drm/i915/gvt/gtt.c
> > +++ b/drivers/gpu/drm/i915/gvt/gtt.c
> > @@ -1215,7 +1215,7 @@ static int split_2MB_gtt_entry(struct intel_vgpu =
*vgpu,
> >                 ret =3D intel_gvt_dma_map_guest_page(vgpu, start_gfn + =
sub_index,
> >                                                    PAGE_SIZE, &dma_addr=
);
> >                 if (ret) {
> > -                       ppgtt_invalidate_spt(spt);
> > +                       ret =3D ppgtt_invalidate_spt(spt);
> >                         return ret;
>
> But now you just lost the original error, shouldn't this succeed even if
> intel_gvt_dma_map_guest_page() failed?
>
> And how are you causing intel_gvt_dma_map_guest_page() to fail in a real
> system?
>
> thanks,
>
> greg k-h
