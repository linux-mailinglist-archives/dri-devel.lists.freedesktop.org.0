Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CFC440464C
	for <lists+dri-devel@lfdr.de>; Thu,  9 Sep 2021 09:37:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE0C46E46B;
	Thu,  9 Sep 2021 07:37:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [IPv6:2a00:1450:4864:20::130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0BEB66E46B
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Sep 2021 07:37:16 +0000 (UTC)
Received: by mail-lf1-x130.google.com with SMTP id e23so1887821lfj.9
 for <dri-devel@lists.freedesktop.org>; Thu, 09 Sep 2021 00:37:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version; bh=DCV1rjnPU/eWBTbsbREshjAvLXRwCR7eXRDUcrw/S9o=;
 b=aw7Hbz+tV/RFQZc40mRAVzZPBR50uNdol/4xO2mZGKJGZFQYbNBju1dUabgmrF8qOu
 Gd7U/b5ScwZTDwEggwY9tvSERu2+M0i4O8PzqHLQZeHiHGySkAny2Setc/8Oo7I58U/b
 2M6iGXIbB/SHENxmxEUlscJtILDgO8GASINYJGpnrpCNp46wZ5jjGrztiDgqqmUjmoEu
 DMInfGUiOzmiDRxl4bqaVpdsLb3CFtEZtzbm1H6QS9f9OrhLeHVrWsH/fg7mDhjrxa0h
 o2/hd/MUjy4ayfynZgX5swP4sRgaXvJRuA1Eb05lvdB495Lr4CjmOjHc2/cDU8bowm+P
 tNgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version;
 bh=DCV1rjnPU/eWBTbsbREshjAvLXRwCR7eXRDUcrw/S9o=;
 b=t4J23uebA0pd+6fXZ2DT5fls/r0fvdT+FN6+TLrbOnmjwp9Ss+Dmd+szl1h8ZIaTJ4
 3+osxATnEahByEK3A5i/9m5yVhAbkAjQO26qN2KebpNmHSLxJrx1HT3A3zcbWD//FAC2
 dW3kdPj38Ht/sifh35fUh0Ux2TCTi7S9zJeeiMy354+rFUB+XK46jXKvIt0eVZRf39sD
 s+bsgwl8Cv3cj+QHDs2JOxr3+XTAWgUtnd+gaCMeo8ow+t4aayU2dp4Om8GJI1NeVewJ
 IiPBTfpPlFc5DXdmLILLCzglevHswjcRnNaM8e/IVisQ1aK9j9d2ExZQZ/wW2jmkgUfn
 d4eg==
X-Gm-Message-State: AOAM532GK6YovIelBxY2guWzxmuDrkyoyU2GC4AYgSuHpF5iZd5r8GdO
 duNPawtwblQNy2w73djrj4E=
X-Google-Smtp-Source: ABdhPJzEfp1qa5x+NDNHogaV0YkpyzWSGo6ElJ6FgEBlvWO05QitqfDsPNPCvNfHr4cp+1eUISE1zQ==
X-Received: by 2002:a19:c7d2:: with SMTP id x201mr1301858lff.155.1631173034251; 
 Thu, 09 Sep 2021 00:37:14 -0700 (PDT)
Received: from eldfell ([194.136.85.206])
 by smtp.gmail.com with ESMTPSA id k12sm105183ljm.65.2021.09.09.00.37.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Sep 2021 00:37:13 -0700 (PDT)
Date: Thu, 9 Sep 2021 10:37:03 +0300
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Daniel Vetter <daniel@ffwll.ch>
Cc: Hans de Goede <hdegoede@redhat.com>, Dennis Filder <d.filder@web.de>,
 dri-devel <dri-devel@lists.freedesktop.org>
Subject: Re: Handling DRM master transitions cooperatively
Message-ID: <20210909103703.09a573e4@eldfell>
In-Reply-To: <CAKMK7uGeuaZDYkr=mFiA4Okhod6KqKRnv_RfF-NJG=2KzG-=WQ@mail.gmail.com>
References: <YTJypepF1Hpc2YYT@reader> <20210907130746.7b667dac@eldfell>
 <ccdba09b-011d-093e-17d0-578ca8a3ec44@redhat.com>
 <20210908103603.44a533bb@eldfell>
 <CAKMK7uGeuaZDYkr=mFiA4Okhod6KqKRnv_RfF-NJG=2KzG-=WQ@mail.gmail.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/gIGwF6XX=3Y5rXMboVAMOBD";
 protocol="application/pgp-signature"; micalg=pgp-sha256
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

--Sig_/gIGwF6XX=3Y5rXMboVAMOBD
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Wed, 8 Sep 2021 18:27:09 +0200
Daniel Vetter <daniel@ffwll.ch> wrote:

> On Wed, Sep 8, 2021 at 9:36 AM Pekka Paalanen <ppaalanen@gmail.com> wrote:
> >
> > On Tue, 7 Sep 2021 14:42:56 +0200
> > Hans de Goede <hdegoede@redhat.com> wrote:
> > =20
> > > Hi,
> > >
> > > On 9/7/21 12:07 PM, Pekka Paalanen wrote: =20
> > > > On Fri, 3 Sep 2021 21:08:21 +0200
> > > > Dennis Filder <d.filder@web.de> wrote:
> > > > =20
> > > >> Hans de Goede asked me to take a topic from a private discussion h=
ere.
> > > >> I must also preface that I'm not a graphics person and my knowledg=
e of
> > > >> DRI/DRM is cursory at best.
> > > >>
> > > >> I initiated the conversation with de Goede after learning that the=
 X
> > > >> server now supports being started with an open DRM file descriptor
> > > >> (this was added for Keith Packard's xlease project).  I wondered if
> > > >> that could be used to smoothen the Plymouth->X transition somehow =
and
> > > >> asked de Goede if there were any such plans.  He denied, but menti=
oned
> > > >> that a new ioctl is in the works to prevent the kernel from wiping=
 the
> > > >> contents of a frame buffer after a device is closed, and that this
> > > >> would help to keep transitions smooth. =20
> > > >
> > > > Hi,
> > > >
> > > > I believe the kernel is not wiping anything on device close. If
> > > > something in the KMS state is wiped, it originates in userspace:
> > > >
> > > > - Plymouth doing something (e.g. RmFB on an in-use FB will turn the
> > > >   output off, you need to be careful to "leak" your FB if you want a
> > > >   smooth hand-over) =20
> > >
> > > The "kernel is not wiping anything on device close" is not true,
> > > when closing /dev/dri/card# any remaining FBs from the app closing
> > > it will be dealt with as if they were RmFB-ed, causing the screen
> > > to show what I call "the fallback fb", at least with the i915 driver.=
 =20
> >
> > No, that's not what should happen AFAIK.
> >
> > True, all FBs that are not referenced by active CRTCs or planes will
> > get freed, since their refcount drops to zero, but those CRTCs and
> > planes that are active will remain active and therefore keep their
> > reference to the respective FBs and so the FBs remain until replaced or
> > turned off explicitly (by e.g. fbcon if you switch to that rather than
> > another userspace KMS client). I believe that is the whole reason why
> > e.g. DRM_IOCTL_MODE_GETFB2 can be useful, otherwise the next KMS client
> > would not have anything to scrape.
> >
> > danvet, what is the DRM core intention? =20
>=20
> Historical accidents mostly. There's two things that foil easy
> handover to the next compositor:
> - RMFB instead of CLOSEFB semantics, especially when closing the
> drmfd. This is uapi, so anything we change needs to be opt-in

What does this mean and refer to?

Are you trying to say, that closing the DRM device fd (freeing the file
description) causes an implicit RmFB on all the FBs tied to that DRM
device file description?

I never realised that before.

> - Forced fbdev restore on final close of all drm fd. This is only
> prevented if there's a drm master left around (systemd-logind can keep
> that instead of forcing the compositor to survive until the other has
> taken over, which it needs to do anyway to prevent the drm master
> handover from going sideways). This can be fixed by simply disabling
> fbdev completely, which you really want to do anyway. Again it's uabi,
> people will complain if we break this I think.

Do you mean that it is not enough to leave the tty in KD_GRAPHICS mode
to stop fbcon/fbdev from taking over?

Is it really fbdev on its own rather than fbcon (poking at fbdev) that
will change the KMS state?

That is, it's not enough to disable fbcon?

> > Or am I confused because display servers do not tend to close the DRM
> > device fd on switch-out but Plymouth does (too early)? =20
>=20
> Yeah, that stops both forced restore/disable from kicking in.

Which "that"?

> > If so, why can't Plymouth keep the device open longer and quit only
> > when the hand-off is complete? Not quitting too early would be a
> > prerequisite for any explicit hand-off protocol as well. =20
>=20
> With closefb semantics and fbdev disabled plymouth could quit early,
> and things still work.

What is "closefb semantics"?


Thanks,
pq

--Sig_/gIGwF6XX=3Y5rXMboVAMOBD
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmE5uZ8ACgkQI1/ltBGq
qqdMDg//TY+a4ATeB/Q6mL0zDfUKlpRAHKqT8azjOmtP2slM7OcNKKdNsXUWZBsj
Pwia/oO9DtP+4q+yijhldtiPLJVuTrCdux5HMtG+dDcY2u3YytZeQFFffNubZ8Hk
IjICpJ07i/gzXUzrobyvW3U47DTtGdZJxsqYVvUD7Jw66PqTeJfuMyquK/03kMcx
VLOk6a9LD5SWp/rx6tqZ+T1o8a03lA7ab8zIfM5akn3tMlhq0EkfJbINutGoso5Z
taJa8yVlozjyk/zD5bHQBtNd+fNCnpZhVcfysdyrqzxbpFtWuKVEk48BJD3ouJTN
sVSdvR7blstOpFZkHJdcBXEzgOwiWqZG3it2C2jAm+H2Pf62+OwHMkfl+NLwZWlP
R6JRvWl9rtdLHhVqLLc3BOcLvupXS4M0F+PbMaaB11ENC/TwTquNtF1OllzaUruA
q9siXdEp3myRb0Upo5uZpG6D3wmbRu4ta57v5VswEit+8CpZEj4VtysBgvIbUQ29
dRCYo0M3H4b/NQaSIqruq5T6jhHanzfKPh5P4oYXWsPLZ3qkW7uylkcZgFmsEhVm
/ctg2qF+SCNLngBvyJsglf7Bhh2ATzBpt2i1EamiOi/LGc7lbbipATvdKGxBzIhC
Frj7McKsCZDSd8IXSAaYqWk2voz2gXODamogmAV/DDe/e4PB8h4=
=/Yp/
-----END PGP SIGNATURE-----

--Sig_/gIGwF6XX=3Y5rXMboVAMOBD--
