Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D9D3B5AE6B4
	for <lists+dri-devel@lfdr.de>; Tue,  6 Sep 2022 13:37:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C36410E622;
	Tue,  6 Sep 2022 11:37:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [IPv6:2a00:1450:4864:20::52e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 735A110E620;
 Tue,  6 Sep 2022 11:37:09 +0000 (UTC)
Received: by mail-ed1-x52e.google.com with SMTP id b16so14751102edd.4;
 Tue, 06 Sep 2022 04:37:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date;
 bh=M2uKdk7Tp89RSg1nNky+wcqDqkwDzuiMCD1W37dZrH0=;
 b=ZQTLztfGcVGjBsblOMebM+NFagwGsHE86jaN0nn5Ucp+OVvrMMNQeKea7Erer2AZTv
 8WSgYVetr0SUIrYJZ0+e7yU/SKcRDrTPrm58bXWa26qdTJev+OTiAIpybgolEHth6ER3
 7SqWSK6DRK/PqWU0dmWaTzvxR4ExDaYuiAPOEC0fxGVOdBtdfGSj5XnM6mi+0s+0pTZs
 udNATEjqtglI137EMLEmHkW7K7Ix/djafa4Y4qjJhPMUq/Thni4rH0q1ZvkDF40LuGto
 rXj9JnAls09vHek6yKWp4go5hBfkz26YX4cC4Zt42WRC2CpFdzGS4kzpB6DZgdXUeCvB
 PPnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date;
 bh=M2uKdk7Tp89RSg1nNky+wcqDqkwDzuiMCD1W37dZrH0=;
 b=3t1F2NWEyec1vT6w98sWbXUwoblR1YdRoqFpaGSxTbAWHEl/jw9+oOyEr5VyCkslDj
 0P0lo4qHM5gLs1SDZNgYEaMh6XJTiMBqGYcqK/BZuJrNq4XQuc60S/djA6Vs5PXwUu4Q
 2XlhmZR9k49yoqzcJxMONzCMLt5m0SDZ6cJIkXCLB2Zr9z/YAfO9CmWRj5TBxR4EcBon
 bKToSlp/z5U8R3bqIrchRTSRcCwt8u844BPT1e47FvdF5KMFs348WRv5zz/c/MpFiCQM
 Wt4g5hHPiRB/qUMWePFmCgtmCAkNjhzgpHxj4/7qRbQRAwaTpI7CluZzBHA3nuZOIDtF
 eYCA==
X-Gm-Message-State: ACgBeo33hmwIiVFx5RfkMrJpzvo0o0Hh6o4zt9sJaOgZCkn7gzIuhORH
 YW1NsAaY86iiuYepe7AZAX0gnvYLymfaTSiub6M=
X-Google-Smtp-Source: AA6agR7IKf/e9xKyzj81LJcXChDsfXfQhD46/b5OzVDrIs69K0v464O0PVRKlwhKyEF/Q3Jqvn8Le1k13liwXyHRDMw=
X-Received: by 2002:aa7:df87:0:b0:44e:2851:7e8d with SMTP id
 b7-20020aa7df87000000b0044e28517e8dmr10684584edy.106.1662464227838; Tue, 06
 Sep 2022 04:37:07 -0700 (PDT)
MIME-Version: 1.0
References: <tencent_E1BBF05904DFB73C478DCD592740AAE0780A@qq.com>
 <CAJedcCxVW++iH49UFZp9ruUuTcNubWCH6Wsqe11K4COB3E8msg@mail.gmail.com>
 <CAJedcCw1eJqjSK+yR7eQMDheNtH3Mjm+viwt00xAhnmrfpq2pw@mail.gmail.com>
 <CAJedcCweHjD78F7iydiq6Xc2iH=t_3m=H9JKnaCooToUk32FvQ@mail.gmail.com>
 <YxWtfjfpNsoPUrgh@kroah.com>
In-Reply-To: <YxWtfjfpNsoPUrgh@kroah.com>
From: Zheng Hacker <hackerzheng666@gmail.com>
Date: Tue, 6 Sep 2022 19:36:56 +0800
Message-ID: <CAJedcCzMo51aiy=Dv7zn7VmL3gwkw7JgzwAPAB2Z27C9CnhoYA@mail.gmail.com>
Subject: Re: [PATCH] drm/i915/gvt: fix double-free bug in split_2MB_gtt_entry.
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
Cc: alex000young@gmail.com, security@kernel.org,
 dri-devel@lists.freedesktop.org, tvrtko.ursulin@linux.intel.com,
 airlied@linux.ie, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, xmzyshypnc <1002992920@qq.com>,
 rodrigo.vivi@intel.com, intel-gvt-dev@lists.freedesktop.org,
 zhi.a.wang@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Greg,

Alex has explained how we figured out the patch. We did analyze the
code and found it possible to reach the vulnerability code. But we
have no physical device in hand to test the driver. So we'd like to
discuss with developers to see if the issue exists or not.

Best regards,
Zheng Wang.

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
