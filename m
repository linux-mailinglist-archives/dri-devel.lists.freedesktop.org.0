Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CB029719467
	for <lists+dri-devel@lfdr.de>; Thu,  1 Jun 2023 09:37:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E943410E138;
	Thu,  1 Jun 2023 07:37:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x52e.google.com (mail-pg1-x52e.google.com
 [IPv6:2607:f8b0:4864:20::52e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC19D10E4B1
 for <dri-devel@lists.freedesktop.org>; Wed, 31 May 2023 11:32:02 +0000 (UTC)
Received: by mail-pg1-x52e.google.com with SMTP id
 41be03b00d2f7-5208be24dcbso3383101a12.1
 for <dri-devel@lists.freedesktop.org>; Wed, 31 May 2023 04:32:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=heitbaum.com; s=google; t=1685532722; x=1688124722;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=t+QshJt/PdyfRodhCY0yXtcG2lF/vT/ZBreOHflG6Y4=;
 b=UhOihmEs45qAYMynSTSjHQR1VfJ2+HA1k2nsMaDzrL3Lmv07qiXLvOtAGE09yFghLv
 mmvfwvn23QTlh8BzTtZB4xej33ZljTYY1+0uaAyXNy5xemBi9mVH+HfuMREXm/zTd1xw
 ONF3IfIuOkgK03fZZjL+ldMXhribgFz5p0ZmM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685532722; x=1688124722;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=t+QshJt/PdyfRodhCY0yXtcG2lF/vT/ZBreOHflG6Y4=;
 b=V0sLnZp99k2mwCRSIsoLm4/Oj0n93v19ilP+qir1NUFHO50sBJey12F4mv2IbjfGt3
 Y+1cDpbPkUFEOswKg1MqVFkLZEOPDSgpv/9vX+rI8YR+acejeRA6RloF+uRBq9+zl0Vb
 ZgbwwAheaqXPTOnSClJg94+4/hHfM5eeZTkXnEXz4jZcGrAmJ5M50wfOnh2F06lj+qXR
 Hvcz3l63qLvGMjEQNJQgWt48vg9WM2fc03K443UHudMzaIJuUp2ab63spNz6onSg7cq4
 cMBUEctCuyoDwvydk85wzgqguOrORMRuxasb4KrGnLIl0cY+ebw/6ZLr6dwNgqV1varS
 iA8g==
X-Gm-Message-State: AC+VfDyUCHeEJJa+raRliKbm5ljiIstzys0ON4mK+Vs6G2LGz93zZhnv
 Q5hxbG7ho99R8Iu1tN0M3BAgISxBxxd32SXlzKBa4aI9rUFbFoMPkyTNrw==
X-Google-Smtp-Source: ACHHUZ62xxeN0UvZ6AfOp3UiFMvl+rj1MK3P65nEgN+MksK2PakIdxE8i0in1vq/GVGJmdjdawbCXA2Xhomkv45ftEs=
X-Received: by 2002:a17:90a:b013:b0:247:ab52:d5d8 with SMTP id
 x19-20020a17090ab01300b00247ab52d5d8mr4436508pjq.26.1685532721781; Wed, 31
 May 2023 04:32:01 -0700 (PDT)
MIME-Version: 1.0
References: <20230510103131.1618266-2-imre.deak@intel.com>
 <20230530134907.GA8@5e905162a5a7> <ZHcJhs4ySOGojBvZ@ideak-desk>
In-Reply-To: <ZHcJhs4ySOGojBvZ@ideak-desk>
From: Rudi Heitbaum <rudi@heitbaum.com>
Date: Wed, 31 May 2023 21:31:49 +1000
Message-ID: <CAG9oJsnuSAveS1g6qyE7ZhSEdGOV1U6kogmiEg7vT9Le1t8wOw@mail.gmail.com>
Subject: Re: [v4,
 01/14] drm/i915: Fix PIPEDMC disabling for a bigjoiner configuration
To: imre.deak@intel.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Thu, 01 Jun 2023 07:37:12 +0000
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
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
 intel-gfx@lists.freedesktop.org, LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Dave Airlie <airlied@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Imre,

Raised the ticket and was able to capture the logs for you.

https://gitlab.freedesktop.org/drm/intel/-/issues/8559

Thanks
Rudi

On Wed, 31 May 2023 at 18:47, Imre Deak <imre.deak@intel.com> wrote:
>
> On Tue, May 30, 2023 at 01:49:07PM +0000, Rudi Heitbaum wrote:
> Hi Rudi,
>
> Could you open a ticket at
> https://gitlab.freedesktop.org/drm/intel/-/issues/new
>
> attaching a dmesg log after booting with drm.debug=3D0xe, with the
> messages from boot-up until the issue happens?
>
> Thanks,
> Imre
>
> > Hi Imre/Dave,
> >
> > Ref: [v4,01/14] drm/i915: Fix PIPEDMC disabling for a bigjoiner configu=
ration
> >      [git pull] drm fixes for 6.4-rc4
> >      drm-fixes-2023-05-26:
> >      drm fixes for 6.4-rc4
> >
> > This patch has caused a regression between 6.4-rc3 and 6.4-rc4. Other
> > tested kernels include 6.3.4 work fine. Dropping the patch allows the d=
ecode
> > playback of media via Kodi. Without dropping the patch - the media
> > starts and stutters then ceases to play.
> >
> > There is an additional issue that 6.4-rc4 audio playback is also failin=
g
> > (where 6.4-rc3 was fine), I have not yet tracked this down.
> >
> > This is all on:
> > DMI: Intel(R) Client Systems NUC12WSKi7/NUC12WSBi7, BIOS WSADL357.0087.=
2023.0306.1931 03/06/2023
> > 12th Gen Intel(R) Core(TM) i7-1260P (family: 0x6, model: 0x9a, stepping=
: 0x3)
> > microcode: updated early: 0x429 -> 0x42a, date =3D 2023-02-14
> >
> > Regards
> >
> > Rudi
> >
> > On Wed, May 10, 2023 at 01:31:18PM +0300, Imre Deak wrote:
> > > For a bigjoiner configuration display->crtc_disable() will be called
> > > first for the slave CRTCs and then for the master CRTC. However slave
> > > CRTCs will be actually disabled only after the master CRTC is disable=
d
> > > (from the encoder disable hooks called with the master CRTC state).
> > > Hence the slave PIPEDMCs can be disabled only after the master CRTC i=
s
> > > disabled, make this so.
> > >
> > > intel_encoders_post_pll_disable() must be called only for the master
> > > CRTC, as for the other two encoder disable hooks. While at it fix thi=
s
> > > up as well. This didn't cause a problem, since
> > > intel_encoders_post_pll_disable() will call the corresponding hook on=
ly
> > > for an encoder/connector connected to the given CRTC, however slave
> > > CRTCs will have no associated encoder/connector.
> > >
> > > Fixes: 3af2ff0840be ("drm/i915: Enable a PIPEDMC whenever its corresp=
onding pipe is enabled")
> > > Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > > Cc: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
> > > Reviewed-by: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
> > > Signed-off-by: Imre Deak <imre.deak@intel.com>
> > > ---
> > >  drivers/gpu/drm/i915/display/intel_display.c | 12 ++++++++++--
> > >  1 file changed, 10 insertions(+), 2 deletions(-)
> > >
> > > diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/g=
pu/drm/i915/display/intel_display.c
> > > index 1d5d42a408035..116fa52290b84 100644
> > > --- a/drivers/gpu/drm/i915/display/intel_display.c
> > > +++ b/drivers/gpu/drm/i915/display/intel_display.c
> > > @@ -1702,9 +1702,17 @@ static void hsw_crtc_disable(struct intel_atom=
ic_state *state,
> > >
> > >     intel_disable_shared_dpll(old_crtc_state);
> > >
> > > -   intel_encoders_post_pll_disable(state, crtc);
> > > +   if (!intel_crtc_is_bigjoiner_slave(old_crtc_state)) {
> > > +           struct intel_crtc *slave_crtc;
> > > +
> > > +           intel_encoders_post_pll_disable(state, crtc);
> > >
> > > -   intel_dmc_disable_pipe(i915, crtc->pipe);
> > > +           intel_dmc_disable_pipe(i915, crtc->pipe);
> > > +
> > > +           for_each_intel_crtc_in_pipe_mask(&i915->drm, slave_crtc,
> > > +                                            intel_crtc_bigjoiner_sla=
ve_pipes(old_crtc_state))
> > > +                   intel_dmc_disable_pipe(i915, slave_crtc->pipe);
> > > +   }
> > >  }
> > >
> > >  static void i9xx_pfit_enable(const struct intel_crtc_state *crtc_sta=
te)
