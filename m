Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 53ABD6F0E8D
	for <lists+dri-devel@lfdr.de>; Fri, 28 Apr 2023 00:50:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 69D1210E1E5;
	Thu, 27 Apr 2023 22:50:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 05C0410E1EB
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Apr 2023 22:50:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682635821;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XYwE6J+8fhzVxHGIhBXfS5rnsX56X4uP+Tk4MmEmW4c=;
 b=YpJxBH3oMapd/dL1MPVaQYyyn691DPYNinH0C2hRYaSScEtGxxYgFgfLBzPnvszOoKT6je
 0WNy2ipe6bBJD0JKWyABagbW49XtiTn7vIA20HHlpcx0l3MNGHGDNte0xfHSg9vKp9N8eg
 Cv2HES4f/PTaMtp0VvPjYbQbXinaVfs=
Received: from mail-lf1-f72.google.com (mail-lf1-f72.google.com
 [209.85.167.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-662-QUOyeO40OZuAtSg4PJNFpA-1; Thu, 27 Apr 2023 18:50:20 -0400
X-MC-Unique: QUOyeO40OZuAtSg4PJNFpA-1
Received: by mail-lf1-f72.google.com with SMTP id
 2adb3069b0e04-4edc965fd01so636905e87.1
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Apr 2023 15:50:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682635818; x=1685227818;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=XYwE6J+8fhzVxHGIhBXfS5rnsX56X4uP+Tk4MmEmW4c=;
 b=YWahTHrr1IzIBt7pvreYlDgRwk09D+93+RzLRK+Wo2AvSIGvGs6ki+rzMXrGLyYWjr
 yL0KzSW/bpsk3u9nxTwyCP8Q9EGOshX7Bw/N1KvOHWcERRQ4rjfszf6PbHlDOqpE9Tax
 D4OWrMdKr4IvSBonvcuPmuEdaJCexsEK7h28k6TTYqosuRm3992Mu/d941fevzK/Z4P3
 qIfsIkVPekreMqWuLlTChjxTvIRhKwMrHtm7o1F72GsxIrMzlJtRxAoHjVvfyiQQaq+4
 xdyPJJvUIEvV6t/ke0iIojzn62Nvdqq94mOzcgoeabiv/Ug8n0qkxNXInkIaWjmsHzVD
 PDZw==
X-Gm-Message-State: AC+VfDxIxUDhvZv4KKuBNLJROz0faxpjP0l1hOqUExyB5HR7XfhuWs1V
 GDdzZgNEYCNKecaYhSBqmJrV021i9lJ6ObN/SUDQ8XPQNpqi8SaSsSJGsIkq/3KApm0v1aH8PP3
 a5WHYGP8XI5b/mUYm38bSJVlXbU/7yutMAITkp3FMHhxe
X-Received: by 2002:a05:651c:1590:b0:2ab:2801:1735 with SMTP id
 h16-20020a05651c159000b002ab28011735mr929722ljq.3.1682635818581; 
 Thu, 27 Apr 2023 15:50:18 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5FVGB+18TEDP08O0pAl9+pf4YrEeVgruqnJYSUblIZnaUtqwyJ1VdecyaJu9FFAUY4/+qLGMOJsDIuOIPBnV4=
X-Received: by 2002:a05:651c:1590:b0:2ab:2801:1735 with SMTP id
 h16-20020a05651c159000b002ab28011735mr929707ljq.3.1682635818083; Thu, 27 Apr
 2023 15:50:18 -0700 (PDT)
MIME-Version: 1.0
References: <CAHk-=whMiMqAv5ATKRkjrdgP2R7WgWmCS4hW2mPwBcL=gzdDNw@mail.gmail.com>
 <D57F9A07-AB77-4FF9-B0A6-C502DC60D093@kernel.org>
 <529e56c85732b0bfcf277de9c651f6c58f47b3b4.camel@redhat.com>
In-Reply-To: <529e56c85732b0bfcf277de9c651f6c58f47b3b4.camel@redhat.com>
From: Karol Herbst <kherbst@redhat.com>
Date: Fri, 28 Apr 2023 00:50:06 +0200
Message-ID: <CACO55tvJE4UvsAY8yfY7j4gMRkk4kLUPedfL0Sw2B7OF=s-rEw@mail.gmail.com>
Subject: Re: Disabling -Warray-bounds for gcc-13 too
To: Lyude Paul <lyude@redhat.com>
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
Cc: Kees Cook <keescook@chromium.org>, gustavo@embeddedor.com,
 Kees Cook <kees@kernel.org>, Linus Torvalds <torvalds@linux-foundation.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, qing.zhao@oracle.com,
 Ben Skeggs <bskeggs@redhat.com>, nouveau@lists.freedesktop.org,
 linux-hardening@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Apr 28, 2023 at 12:46=E2=80=AFAM Lyude Paul <lyude@redhat.com> wrot=
e:
>
> Hey Linus, Kees. Responses below
>
> On Sun, 2023-04-23 at 13:23 -0700, Kees Cook wrote:
> > On April 23, 2023 10:36:24 AM PDT, Linus Torvalds <torvalds@linux-found=
ation.org> wrote:
> > > Kees,
> > >  I made the mistake of upgrading my M2 Macbook Air to Fedora-38, and
> > > in the process I got gcc-13 which is not WERROR-clean because we only
> > > limited the 'array-bounds' warning to gcc-11 and gcc-12. But gcc-13
> > > has all the same issues.
> > >
> > > And I want to be able to do my arm64 builds with WERROR on still...
> > >
> > > I guess it never made much sense to hope it was going to go away
> > > without having a confirmation, so I just changed it to be gcc-11+.
> >
> > Yeah, that's fine. GCC 13 released without having a fix for at least on=
e (hopefully last) known array-bounds vs jump threading bug:
> > https://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D109071
> >
> > > And one of them is from you.
> > >
> > > In particular, commit 4076ea2419cf ("drm/nouveau/disp: Fix
> > > nvif_outp_acquire_dp() argument size") cannot possibly be right, It
> > > changes
> > >
> > > nvif_outp_acquire_dp(struct nvif_outp *outp, u8 dpcd[16],
> > >
> > > to
> > >
> > > nvif_outp_acquire_dp(struct nvif_outp *outp, u8 dpcd[DP_RECEIVER_CAP_=
SIZE],
> > >
> > > and then does
> > >
> > >        memcpy(args.dp.dpcd, dpcd, sizeof(args.dp.dpcd));
> > >
> > > where that 'args.dp.dpcd' is a 16-byte array, and DP_RECEIVER_CAP_SIZ=
E is 15.
> >
> > Yeah, it was an incomplete fix. I sent the other half here, but it fell=
 through the cracks:
> > https://lore.kernel.org/lkml/20230204184307.never.825-kees@kernel.org/
>
> Thanks for bringing this to our attention, yeah this definitely just look=
s
> like it got missed somewhere down the line. It looks like Karol responded
> already so I assume the patch is in the pipeline now, but let me know if
> there's anything else you need.
>

uhm, I didn't push anything, but I can push it through drm-misct asap,
just wanted to ask if somebody wants to pick a quicker route. But I
guess not?

> >
> >
> >
> > >
> >
> > > I think it's all entirely harmless from a code generation standpoint,
> > > because the 15-byte field will be padded out to 16 bytes in the
> > > structure that contains it, but it's most definitely buggy.
> >
> > Right; between this, that GCC 13 wasn't released yet, and I had no feed=
back from NV folks, I didn't chase down landing that fix.
> >
> > >
> > > So that warning does find real cases of wrong code. But when those
> > > real cases are hidden by hundreds of lines of unfixable false
> > > positives, we don't have much choice.
> >
> > Yup, totally agreed. The false positives I've looked at all seem to be =
similar to the outstanding jump threading bug, so I'm hoping once that gets=
 fixed we'll finally have a good signal with that warning enabled. :)
> >
> > -Kees
> >
> >
>
> --
> Cheers,
>  Lyude Paul (she/her)
>  Software Engineer at Red Hat
>

