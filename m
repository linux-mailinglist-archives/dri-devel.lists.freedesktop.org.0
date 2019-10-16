Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CCB98D91F5
	for <lists+dri-devel@lfdr.de>; Wed, 16 Oct 2019 15:06:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C754D89CBA;
	Wed, 16 Oct 2019 13:06:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com
 [IPv6:2a00:1450:4864:20::144])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BDCCC89CBA
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Oct 2019 13:06:11 +0000 (UTC)
Received: by mail-lf1-x144.google.com with SMTP id u16so4848263lfq.3
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Oct 2019 06:06:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version;
 bh=D1Q3y1XiyfGPLdt0Kwlj+vJr71csqXEX7e/fFOgzrkg=;
 b=drM0ek2HEMS3PHLtNiJyr301zIimcUUoXkR+BSMlrytSD/0cpCjgPV8FePM8nA7cib
 syncXE1bKDGklCkNkHkptVY/3iUikDPySRy+oMbN/xO7jPmgAHqIg2x9wEgEA+ok/MkZ
 UqQhkbARy9o8R/VaZRTntd4ZdVbzgjWVOSuF6rsL1McfGjsOwLvHh/ugO+Pn1PX4/No1
 xEinezOafmYF6E7RNknQPt04B+4VFvIdBhxYeIEM+qBIzz5oVLA5bcgSrd0W2vFZ4ueO
 +VFZ0UpuPWK7r1xL5gCSi/Si3aQEkmJj+UvJ+0eRj5jg1ZiU6w8gubTI+inR//0ro1qB
 7bWw==
X-Gm-Message-State: APjAAAXbGWcDso5yKVjG+dhg2suunM9tCRIqzm3G5G0/QOWRUb7HlOx8
 EQP1jqvmn8yi8IGsOALSLS0=
X-Google-Smtp-Source: APXvYqxawmKJI+Jfv2yBTtl6xDC6ZC9g1DPTAE5PaFYSz5cj31BYWPCYxupu7ozHSRYLnWDUr/heow==
X-Received: by 2002:a19:f610:: with SMTP id x16mr22684770lfe.139.1571231169995; 
 Wed, 16 Oct 2019 06:06:09 -0700 (PDT)
Received: from eldfell.localdomain ([194.136.85.206])
 by smtp.gmail.com with ESMTPSA id 196sm6147595ljj.76.2019.10.16.06.06.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Oct 2019 06:06:09 -0700 (PDT)
Date: Wed, 16 Oct 2019 16:05:57 +0300
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: Re: [PATCH] drm: Funnel drm logs to tracepoints
Message-ID: <20191016160557.73b634c9@eldfell.localdomain>
In-Reply-To: <CAKMK7uE_DiXH_Gz6JBObv_Fs7cUhkH1wTVw4LDx2GZVueqYAPA@mail.gmail.com>
References: <20191010204823.195540-1-sean@poorly.run>
 <242462f0-ac8d-ab8a-e567-74678da3f68f@suse.de>
 <20191015191156.GW85762@art_vandelay>
 <20191015200233.GK1208@intel.com>
 <CAKMK7uE_DiXH_Gz6JBObv_Fs7cUhkH1wTVw4LDx2GZVueqYAPA@mail.gmail.com>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version;
 bh=D1Q3y1XiyfGPLdt0Kwlj+vJr71csqXEX7e/fFOgzrkg=;
 b=CLExWxvER+1bTyz+KQrMV0mmTsvVGg09MXPanslu5nGiphIcDPO4ifLW46X+86pTiM
 1U+4FR9G0qEEii1eG8dJ26r4Tt0sK3I9ZAJa1AhBhHzagNBeoKaQiZIee3EhgsBhNRcY
 PNRBiyy8V9atvq64vVNXjn+e68fiTQYsKArQoPQht+IONhEXcBiw8dS7zvgbfQLmPtyh
 0+wR16adA4OiXcp7e9viGgE039USHLKaBAl/OgD3n0Yj73+eIYoRUdNWrERdl2IsTyy1
 MuXm3Ue3Aj6kkD5+1fkoKL/4zPP3+1KSuqMbPfnCKrF0Up2SNbLwH4DQ8NAIPZNeMjR9
 wXYA==
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Cc: David Airlie <airlied@linux.ie>,
 dri-devel <dri-devel@lists.freedesktop.org>, Sean Paul <seanpaul@chromium.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Sean Paul <sean@poorly.run>
Content-Type: multipart/mixed; boundary="===============0514383816=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============0514383816==
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/rpK=L38D3MW=dueU2DLbi6I"; protocol="application/pgp-signature"

--Sig_/rpK=L38D3MW=dueU2DLbi6I
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Wed, 16 Oct 2019 00:35:39 +0200
Daniel Vetter <daniel.vetter@ffwll.ch> wrote:

> Yeah I don't think tuning the spam level will ever work. What we need
> is some external input (most likely from the user clicking the "my
> external screen doesn't work" button, or maybe the compositor
> realizing something that should work didn't, or some other thing that
> indicates trouble), and then retroactively capture all
> debug/informational message leading up to doom.
>=20
> But without that external "houston we have a problem" input all the
> debug spam is really just spam and unwanted. btw even if we don't spam
> dmesg if we enable too much we might have simply trouble with all the
> printk formatting work we do for nothing. So maybe we need something
> like trace_printk which iirc delays the formatting until the stuff
> actually gets read from the log buffer. Plus trace_printk might make
> it clear enough that it's not stable uapi ... so maybe we do want
> trace_printk in the end?
>=20
> Just not really looking forward to reimplementing half the tracing
> infrastructure just for this ...

Hi,

a thought about the UAPI:

Debugfs is not good because it's not supposed to be touched or even
present in production, right? But we want something that will
specifically be available in production. So a new file in some fs
somewhere it should be, and userspace in production can read it at will
to attach to a bug report.

Those semantics, "only use this content for attaching into a bug
report" should be made very clear in the UAPI. Not just the kernel
function names, but in the UAPI that an end user might
see. /proc/driver/drm/bug-report-aid or whatever. And that file, while
a ring buffer, could be aggressively big, intended to be compressed
before sent out with a bug report. Or maybe it comes out as readily
compressed.

The file name itself would be stable UAPI, the contents not at all.

I believe it has to be a ring buffer that is being continuously written
also during normal operations, so that we don't have to ask end users
to reproduce the issue again just to get some logs. Maybe the issue
happens once in a fortnight. The information must be extractable after
the fact, without before-hand preparations.


Thanks,
pq

--Sig_/rpK=L38D3MW=dueU2DLbi6I
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAl2nFbUACgkQI1/ltBGq
qqfVIhAAkfVHe1ipKTi2v7h6T4kHvAjYuZf3ukL/I6FsCBr6yOe7SqJ+6WZY/mYo
X6/OM+1QKFqqhl8p2wBcyP5ESa/lxkCXTskJtQjm5VmZC9W65ImLzxey0xdq5q4p
/Vwv5AWLw5qH8Cj26EPdx20Fwk7G0yTkmUzLKEbYw1Tsmrj6YSeXRfaVZzvlzQqU
JgR8RaZ5Ii/FiA2NDQRxgmJXpoWVCleR6Q3ui+VsQEpj+vxkhsGi5+G7cOIg2VFW
T4oCnafoRiqXrc6+qpWoSZTXKhS8LOUrGyV09p6UvODd7SdmqTnDM9Ur/pNt4xig
V93AvvMspzlffdmiv6sE6bmLlGvyrKgAgvF2Wc4VvTWmrIgqNNnVtMf3NVMtDaJp
vQ8rygF0SfGsYeFnh9gPx8Re5Kt19LcQwc0J1lVUJ/L3DY72dvUWLUDXntPcd69A
spchOKDoONCE/WwfgwmB9/B1BgsZHsbwXMFwlAXLImXFvtDuJpw59s0RBjr32LTZ
e447Ik1PBq1cidj52Wt+ZXYSm3iybrR+n0/8rVvQz22IS3CerqOEKC9kQ8SNZrW+
nr/5gZYVvVF3e8vFt6ewUyuxucEnG5NUjaehb+juII5wXOqWGPFrdYMom1KW5XWa
JNcSlU/lPqPdPVOJL7IS9mMYz0NVB3aOnLAx2ei7f9hyTJkY3B8=
=X/Ng
-----END PGP SIGNATURE-----

--Sig_/rpK=L38D3MW=dueU2DLbi6I--

--===============0514383816==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0514383816==--
