Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 835FC6F0E77
	for <lists+dri-devel@lfdr.de>; Fri, 28 Apr 2023 00:46:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D38FF10E18D;
	Thu, 27 Apr 2023 22:46:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8617010E18D
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Apr 2023 22:46:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682635602;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0uOP6QjpCqnaQ0Jr5WnOAlZwPbe5PitpX/6uFN4BwUE=;
 b=Rgju1dGkz1+wxgDFyFKVr8/eQWmaYlMfy/OIsEf9pwIT+uMvuBH4SVRP1B4JyWVmI+QRt4
 gHEXgdovyrkul/k0BtXE1ZD0lLuEfzdSgbBeGaIywbyPC+US/PT5rALKcZuTfpHsPp0jof
 t3cofyecl/P7r176zJIy3fAN06MsRWs=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-125-sqd22WoEMz6HfV6jT59Pbw-1; Thu, 27 Apr 2023 18:46:39 -0400
X-MC-Unique: sqd22WoEMz6HfV6jT59Pbw-1
Received: by mail-qv1-f70.google.com with SMTP id
 6a1803df08f44-5ef81bca65aso127408826d6.2
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Apr 2023 15:46:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682635599; x=1685227599;
 h=mime-version:user-agent:content-transfer-encoding:organization
 :references:in-reply-to:date:cc:to:from:subject:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=0uOP6QjpCqnaQ0Jr5WnOAlZwPbe5PitpX/6uFN4BwUE=;
 b=M6/K7ZlTgUsnH1qx762iRh7/Tp2ZlI4TKI5w2W5yg3G9r9OwyMi8xBIqFCA6XEikZa
 TG9Br0m6neQ643rcdgtqV1J2IOR1CV8EVouDco3gdW9EQ2oh0YYvKi2dE8HPlZwWO1a1
 U8cQxlqUqBfYamn3w41b7sBS4KiUTkLYxhEB3EobdpTcHH7/1u2ocbF5q5XOeZnWnT54
 I8+CxsyTQkNHjmRX0T2L2AhVE4p7e20Vo31ndfSZ7T3A3PxDzgI2sk2shvV2Q1+50pDS
 24Gmcd/WPOW6OHuFtQBHblX3+swE3sLV+r8ZksZ0r6EAlWvA5dQ8DZlSuh9W1OVlyO7P
 cgcg==
X-Gm-Message-State: AC+VfDyOVJFmTFeQadnQUVz6ORsQec6f//Reh1He7pfA/tTGmKbM1qsa
 ZZe6Mft1dcECZFD/bfCWVtFfc6LG+vXnPi9AGh7+y0MjqhSyG7j89DaLzXiwFZ5qMtk+ffO60gb
 Axn3Hktq57dXjginuIgNVikiWMYY6
X-Received: by 2002:a05:6214:1c4c:b0:5f1:606b:a9bd with SMTP id
 if12-20020a0562141c4c00b005f1606ba9bdmr5889448qvb.26.1682635598899; 
 Thu, 27 Apr 2023 15:46:38 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7fPVyEtt/9kgNDyjBcu3Uydoi+UsOztYz07sDBkhuwPge5XYqH9lKydzc/axceKM8HxCpDsw==
X-Received: by 2002:a05:6214:1c4c:b0:5f1:606b:a9bd with SMTP id
 if12-20020a0562141c4c00b005f1606ba9bdmr5889422qvb.26.1682635598656; 
 Thu, 27 Apr 2023 15:46:38 -0700 (PDT)
Received: from ?IPv6:2600:4040:5c62:8200::feb? ([2600:4040:5c62:8200::feb])
 by smtp.gmail.com with ESMTPSA id
 p17-20020a0cf551000000b005ef59a383e6sm5966786qvm.119.2023.04.27.15.46.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Apr 2023 15:46:37 -0700 (PDT)
Message-ID: <529e56c85732b0bfcf277de9c651f6c58f47b3b4.camel@redhat.com>
Subject: Re: Disabling -Warray-bounds for gcc-13 too
From: Lyude Paul <lyude@redhat.com>
To: Kees Cook <kees@kernel.org>, Linus Torvalds
 <torvalds@linux-foundation.org>,  Kees Cook <keescook@chromium.org>
Date: Thu, 27 Apr 2023 18:46:36 -0400
In-Reply-To: <D57F9A07-AB77-4FF9-B0A6-C502DC60D093@kernel.org>
References: <CAHk-=whMiMqAv5ATKRkjrdgP2R7WgWmCS4hW2mPwBcL=gzdDNw@mail.gmail.com>
 <D57F9A07-AB77-4FF9-B0A6-C502DC60D093@kernel.org>
Organization: Red Hat Inc.
User-Agent: Evolution 3.44.4 (3.44.4-2.fc36)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
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
Cc: Karol Herbst <kherbst@redhat.com>, gustavo@embeddedor.com,
 nouveau@lists.freedesktop.org, dri-devel <dri-devel@lists.freedesktop.org>,
 qing.zhao@oracle.com, Ben Skeggs <bskeggs@redhat.com>,
 linux-hardening@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hey Linus, Kees. Responses below

On Sun, 2023-04-23 at 13:23 -0700, Kees Cook wrote:
> On April 23, 2023 10:36:24 AM PDT, Linus Torvalds <torvalds@linux-foundat=
ion.org> wrote:
> > Kees,
> >  I made the mistake of upgrading my M2 Macbook Air to Fedora-38, and
> > in the process I got gcc-13 which is not WERROR-clean because we only
> > limited the 'array-bounds' warning to gcc-11 and gcc-12. But gcc-13
> > has all the same issues.
> >=20
> > And I want to be able to do my arm64 builds with WERROR on still...
> >=20
> > I guess it never made much sense to hope it was going to go away
> > without having a confirmation, so I just changed it to be gcc-11+.
>=20
> Yeah, that's fine. GCC 13 released without having a fix for at least one =
(hopefully last) known array-bounds vs jump threading bug:
> https://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D109071
>=20
> > And one of them is from you.
> >=20
> > In particular, commit 4076ea2419cf ("drm/nouveau/disp: Fix
> > nvif_outp_acquire_dp() argument size") cannot possibly be right, It
> > changes
> >=20
> > nvif_outp_acquire_dp(struct nvif_outp *outp, u8 dpcd[16],
> >=20
> > to
> >=20
> > nvif_outp_acquire_dp(struct nvif_outp *outp, u8 dpcd[DP_RECEIVER_CAP_SI=
ZE],
> >=20
> > and then does
> >=20
> >        memcpy(args.dp.dpcd, dpcd, sizeof(args.dp.dpcd));
> >=20
> > where that 'args.dp.dpcd' is a 16-byte array, and DP_RECEIVER_CAP_SIZE =
is 15.
>=20
> Yeah, it was an incomplete fix. I sent the other half here, but it fell t=
hrough the cracks:
> https://lore.kernel.org/lkml/20230204184307.never.825-kees@kernel.org/

Thanks for bringing this to our attention, yeah this definitely just looks
like it got missed somewhere down the line. It looks like Karol responded
already so I assume the patch is in the pipeline now, but let me know if
there's anything else you need.

>=20
>=20
>=20
> >=20
>=20
> > I think it's all entirely harmless from a code generation standpoint,
> > because the 15-byte field will be padded out to 16 bytes in the
> > structure that contains it, but it's most definitely buggy.
>=20
> Right; between this, that GCC 13 wasn't released yet, and I had no feedba=
ck from NV folks, I didn't chase down landing that fix.
>=20
> >=20
> > So that warning does find real cases of wrong code. But when those
> > real cases are hidden by hundreds of lines of unfixable false
> > positives, we don't have much choice.
>=20
> Yup, totally agreed. The false positives I've looked at all seem to be si=
milar to the outstanding jump threading bug, so I'm hoping once that gets f=
ixed we'll finally have a good signal with that warning enabled. :)
>=20
> -Kees
>=20
>=20

--=20
Cheers,
 Lyude Paul (she/her)
 Software Engineer at Red Hat

