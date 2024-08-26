Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4538D95F28A
	for <lists+dri-devel@lfdr.de>; Mon, 26 Aug 2024 15:13:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD36910E20E;
	Mon, 26 Aug 2024 13:13:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="nRKK1TTL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com
 [209.85.219.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF99210E20E
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Aug 2024 13:13:53 +0000 (UTC)
Received: by mail-qv1-f47.google.com with SMTP id
 6a1803df08f44-6bf89e59ff8so23252256d6.0
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Aug 2024 06:13:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1724678033; x=1725282833; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vSwJhEnVRbE/lc1fBQhKHoYSdjJMMB9ydQkFXZg7Wl0=;
 b=nRKK1TTLiVdj6oSVe5pmVzkpEXfJ6FGDQIV0GExVEa1TkHbf9bqJavCAzO89PzTC8Z
 vwTLvqTXnOdYh42ctV2VKDafZQtZWXR+K6otLoSyybE55pGOXXkgUzE4ZsOV9KZDLTWb
 NZ8kB6rudw6nPI/zc0bL9DRD6NUkKTYNbBJoB5OFzhUudkz5qR1ktr6yb8Qx51GgyYgc
 aSibDoXDl6lWjmExU7iC9H/dElDu398/ZQC/T1O72ydLlsTSoxMZ/kwkeECY0KWuFyXO
 LBG9LReYcZjT56kfqn/OY+M5yIG+JTRdPLXDVOLG4+e9z5OEj7fb2JHPaTnC5Ty/UeDG
 t6NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724678033; x=1725282833;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vSwJhEnVRbE/lc1fBQhKHoYSdjJMMB9ydQkFXZg7Wl0=;
 b=uVtyWV4g8CYXMz8HyRZjOaWAGDpCvB/vFvmFsWcDh/kfF2j/XawKKWi9so16ppzW1I
 XTmc+Uy9MBZ+eDj3rQLoN8ulgualk7ElBhtfsJefKyQeGWuhwrZECrG4Cj/G0eJg392X
 B18nW9jLu5i6023yVIqd+Tzc0giQqMEbxlZ9BecllvfhTS0+ZfAwYmtClop4PB/nAJAh
 JhRymll/NAWyPnS4L98KD4ZccXJSijTaVWLB3FaCnYokAz+rq5bit/CgXOBblpF3uT1d
 OZ3TxxcMKP9bidY2cfiMlG4i/Xd6Y8sRniNwDkftc7jEbYQ9nBNkkaVGlDlI04kmQVZu
 Odrw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWdCPpnuLrLpewjex0K8foXV6ejNa1oqLAAOyQ7U95MAL7qyS9jCCAT6owyeXXokD3xbq5XLyrJxzY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz558JfaGPJnKWbFwO0cH4p+ZgqSJX96KImV0bQXCsnkDixKkm1
 CxYjW5G01FvvIlq1nf5GcvX+k1uSZcfxg2pSilA+GKanrFQbItHBG9D9i6Qet3WX0UzySuzdwip
 muzZxI3aK/fx35jIQhCFLgjvXDbc=
X-Google-Smtp-Source: AGHT+IEMzX23pNCTwUB3oEFnjtXMwQslYwQseElwS5dsww3heTV7mBPQDdBjGem5UqseBxKdUwlhHXFriIKrdvm/EEk=
X-Received: by 2002:a05:6214:2b82:b0:6bf:78e1:74e7 with SMTP id
 6a1803df08f44-6c16deb3b70mr122308516d6.50.1724678032741; Mon, 26 Aug 2024
 06:13:52 -0700 (PDT)
MIME-Version: 1.0
References: <20240817025624.13157-1-laoar.shao@gmail.com>
 <20240817025624.13157-7-laoar.shao@gmail.com>
 <nmhexn3mkwhgu5e6o3i7gvipboisbuwdoloshf64ulgzdxr5nv@3gwujx2y5jre>
 <ep44ahlsa2krmpjcqrsvoi5vfoesvnvly44icavup7dsfolewm@flnm5rl23diz>
In-Reply-To: <ep44ahlsa2krmpjcqrsvoi5vfoesvnvly44icavup7dsfolewm@flnm5rl23diz>
From: Yafang Shao <laoar.shao@gmail.com>
Date: Mon, 26 Aug 2024 21:13:16 +0800
Message-ID: <CALOAHbA5VDjRYcoMOMKcLMVR0=ZwTz5FBTvQZExi6w8We9JPHg@mail.gmail.com>
Subject: Re: [PATCH v7 6/8] mm/util: Deduplicate code in {kstrdup, kstrndup,
 kmemdup_nul}
To: Alejandro Colomar <alx@kernel.org>
Cc: akpm@linux-foundation.org, torvalds@linux-foundation.org, 
 justinstitt@google.com, ebiederm@xmission.com, alexei.starovoitov@gmail.com, 
 rostedt@goodmis.org, catalin.marinas@arm.com, 
 penguin-kernel@i-love.sakura.ne.jp, linux-mm@kvack.org, 
 linux-fsdevel@vger.kernel.org, linux-trace-kernel@vger.kernel.org, 
 audit@vger.kernel.org, linux-security-module@vger.kernel.org, 
 selinux@vger.kernel.org, bpf@vger.kernel.org, netdev@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, Simon Horman <horms@kernel.org>, 
 Matthew Wilcox <willy@infradead.org>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Aug 26, 2024 at 5:25=E2=80=AFPM Alejandro Colomar <alx@kernel.org> =
wrote:
>
> Hi Yafang,
>
> On Sat, Aug 17, 2024 at 10:58:02AM GMT, Alejandro Colomar wrote:
> > Hi Yafang,
> >
> > On Sat, Aug 17, 2024 at 10:56:22AM GMT, Yafang Shao wrote:
> > > These three functions follow the same pattern. To deduplicate the cod=
e,
> > > let's introduce a common helper __kmemdup_nul().
> > >
> > > Suggested-by: Andrew Morton <akpm@linux-foundation.org>
> > > Signed-off-by: Yafang Shao <laoar.shao@gmail.com>
> > > Cc: Simon Horman <horms@kernel.org>
> > > Cc: Matthew Wilcox <willy@infradead.org>
> > > ---
> > >  mm/util.c | 67 +++++++++++++++++++++--------------------------------=
--
> > >  1 file changed, 26 insertions(+), 41 deletions(-)
> > >
> > > diff --git a/mm/util.c b/mm/util.c
> > > index 4542d8a800d9..310c7735c617 100644
> > > --- a/mm/util.c
> > > +++ b/mm/util.c
> > > @@ -45,33 +45,40 @@ void kfree_const(const void *x)
> > >  EXPORT_SYMBOL(kfree_const);
> > >
> > >  /**
> > > - * kstrdup - allocate space for and copy an existing string
> > > - * @s: the string to duplicate
> > > + * __kmemdup_nul - Create a NUL-terminated string from @s, which mig=
ht be unterminated.
> > > + * @s: The data to copy
> > > + * @len: The size of the data, including the null terminator
> > >   * @gfp: the GFP mask used in the kmalloc() call when allocating mem=
ory
> > >   *
> > > - * Return: newly allocated copy of @s or %NULL in case of error
> > > + * Return: newly allocated copy of @s with NUL-termination or %NULL =
in
> > > + * case of error
> > >   */
> > > -noinline
> > > -char *kstrdup(const char *s, gfp_t gfp)
> > > +static __always_inline char *__kmemdup_nul(const char *s, size_t len=
, gfp_t gfp)
> > >  {
> > > -   size_t len;
> > >     char *buf;
> > >
> > > -   if (!s)
> > > +   buf =3D kmalloc_track_caller(len, gfp);
> > > +   if (!buf)
> > >             return NULL;
> > >
> > > -   len =3D strlen(s) + 1;
> > > -   buf =3D kmalloc_track_caller(len, gfp);
> > > -   if (buf) {
> > > -           memcpy(buf, s, len);
> > > -           /* During memcpy(), the string might be updated to a new =
value,
> > > -            * which could be longer than the string when strlen() is
> > > -            * called. Therefore, we need to add a null termimator.
> > > -            */
> > > -           buf[len - 1] =3D '\0';
> > > -   }
> > > +   memcpy(buf, s, len);
> > > +   /* Ensure the buf is always NUL-terminated, regardless of @s. */
> > > +   buf[len - 1] =3D '\0';
> > >     return buf;
> > >  }
> > > +
> > > +/**
> > > + * kstrdup - allocate space for and copy an existing string
> > > + * @s: the string to duplicate
> > > + * @gfp: the GFP mask used in the kmalloc() call when allocating mem=
ory
> > > + *
> > > + * Return: newly allocated copy of @s or %NULL in case of error
> > > + */
> > > +noinline
> > > +char *kstrdup(const char *s, gfp_t gfp)
> > > +{
> > > +   return s ? __kmemdup_nul(s, strlen(s) + 1, gfp) : NULL;
> > > +}
> > >  EXPORT_SYMBOL(kstrdup);
> > >
> > >  /**
> > > @@ -106,19 +113,7 @@ EXPORT_SYMBOL(kstrdup_const);
> > >   */
> > >  char *kstrndup(const char *s, size_t max, gfp_t gfp)
> > >  {
> > > -   size_t len;
> > > -   char *buf;
> > > -
> > > -   if (!s)
> > > -           return NULL;
> > > -
> > > -   len =3D strnlen(s, max);
> > > -   buf =3D kmalloc_track_caller(len+1, gfp);
> > > -   if (buf) {
> > > -           memcpy(buf, s, len);
> > > -           buf[len] =3D '\0';
> > > -   }
> > > -   return buf;
> > > +   return s ? __kmemdup_nul(s, strnlen(s, max) + 1, gfp) : NULL;
> > >  }
> > >  EXPORT_SYMBOL(kstrndup);
> > >
> > > @@ -192,17 +187,7 @@ EXPORT_SYMBOL(kvmemdup);
> > >   */
> > >  char *kmemdup_nul(const char *s, size_t len, gfp_t gfp)
> > >  {
> > > -   char *buf;
> > > -
> > > -   if (!s)
> > > -           return NULL;
> > > -
> > > -   buf =3D kmalloc_track_caller(len + 1, gfp);
> > > -   if (buf) {
> > > -           memcpy(buf, s, len);
> > > -           buf[len] =3D '\0';
> > > -   }
> > > -   return buf;
> > > +   return s ? __kmemdup_nul(s, len + 1, gfp) : NULL;
> > >  }
> > >  EXPORT_SYMBOL(kmemdup_nul);
> >
> > I like the idea of the patch, but it's plagued with all those +1 and -1=
.
> > I think that's due to a bad choice of value being passed by.  If you
> > pass the actual length of the string (as suggested in my reply to the
> > previous patch) you should end up with a cleaner set of APIs.
> >
> > The only remaining +1 is for kmalloc_track_caller(), which I ignore wha=
t
> > it does.
> >
> >       char *
> >       __kmemdup_nul(const char *s, size_t len, gfp_t gfp)
> >       {
> >               char *buf;
> >
> >               buf =3D kmalloc_track_caller(len + 1, gfp);
> >               if (!buf)
> >                       return NULL;
> >
> >               strcpy(mempcpy(buf, s, len), "");
>
> Changing these strcpy(, "") to the usual; =3D'\0' or =3D0, but I'd still
> recommend the rest of the changes, that is, changing the value passed in
> len, to remove several +1 and -1s.
>
> What do you think?

I will update it. Thanks for your suggestion.

--=20
Regards
Yafang
