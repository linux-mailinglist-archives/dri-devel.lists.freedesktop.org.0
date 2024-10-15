Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 743B899F8DC
	for <lists+dri-devel@lfdr.de>; Tue, 15 Oct 2024 23:16:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E634B10E2C9;
	Tue, 15 Oct 2024 21:16:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="nUQkFgk9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f180.google.com (mail-il1-f180.google.com
 [209.85.166.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 021C010E2C9
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Oct 2024 21:16:14 +0000 (UTC)
Received: by mail-il1-f180.google.com with SMTP id
 e9e14a558f8ab-3a3b28ac9a1so1229695ab.1
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Oct 2024 14:16:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1729026974; x=1729631774;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=O8t3MQX53gJacU2dQjrjSkqB49dUGpAYvqMTaTgZEsw=;
 b=nUQkFgk9X37cvZFzFrpbXDMbGEXmOkfHzycGvneLFwtdpwAko5JItV0hcD+oGNBKl6
 TAqed+sWTQPbrrw2qO5TDzodS1h0C6wGr1mllfH/G7hTlrGQgEcUFUzr2flgOEvGaPk0
 6FFXkC0cP1qa3x6K1bNDM2SNKorTts7RRSKodV7s5qp23i1h3psV9tA8ITi4ZGkVH4b3
 XwWbFY8m0y3OfvXlbuL3KzKYSWfW3ke0ZfwzRABlH4tlcUYr5WdIkJpC8fgg69gbPWUF
 i4cr1UbOBXJp68hQEyaKqYqb8jTMUM308o3N7DFFV2GjeAAIW2PqSBieWtdUbOp8HJ7z
 hbfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729026974; x=1729631774;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=O8t3MQX53gJacU2dQjrjSkqB49dUGpAYvqMTaTgZEsw=;
 b=GCypYEmv9qWkJCmO5ZPArLSW0/UUNFdPfwZQV9+5tqCfOeaE8RhSe0WoJAAO+M9XSk
 r4xjC18oNAmx4oaiRfph9CJ4sr2dYQyMMnq+5QYI6DioD0HOvqrC5eQRX8nMp8wDpeMF
 s/txz0A8/S1pFRi5CJJ9yHI823k2Kb1b4byhf+sizEw2AHPT8ozDDxDS3ohvolfFU8t4
 2JRFhqDEst/pQGBYEGiiDr70Cs4FgoguI54Uex51R3ulI3YUrQ+BuYJimbOhCOgNEOMB
 bxB10vk9WcqsBbh0sZJWf2GLSgqcltrg8gq9z6krGRsHSbJueFoex0VcZIQrjikXnrKG
 Us8Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCWgEaI8FiGgVPYsy8XVUokdmNkX2fEus/wHLO8IbJ5YIQurVP0L0o+86aK6qZx3ewvUhdZ7mY8G7VM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwnXa6txTBkkkPpzuEC/JrhCagvDVUYNq9lYORuiPPaGm2Pdv6B
 iwjcpeztQJln0h2DRdUKSlHH12vbDUDarTbZzOr8zeoo36mSQ13xHYWRSSHEfPpZXh2NiezRRNK
 CS2jILIgOZbYKXZRtR2seRosgpGqz3DNFINa5
X-Google-Smtp-Source: AGHT+IHINpXEi5bb/dccSxtN8wJyzozbPFXJh2tHJWT4nH0CEB3DhiR+erAYo6ijlB3wG61HmbFlaLAczJD9QPgiALM=
X-Received: by 2002:a05:6e02:1fc6:b0:39d:1b64:3551 with SMTP id
 e9e14a558f8ab-3a3de7d1385mr347375ab.19.1729026973940; Tue, 15 Oct 2024
 14:16:13 -0700 (PDT)
MIME-Version: 1.0
References: <20241015183824.1014964-1-irogers@google.com>
 <20241015203202.vyfi4nykkid35luj@illithid>
In-Reply-To: <20241015203202.vyfi4nykkid35luj@illithid>
From: Ian Rogers <irogers@google.com>
Date: Tue, 15 Oct 2024 14:16:00 -0700
Message-ID: <CAP-5=fU1Rh8z0RdRri7+yw5ORDes3sCSLyaHf9UqZ6o1rygkrg@mail.gmail.com>
Subject: Re: [PATCH v1 1/3] proc_pid_fdinfo.5: Reduce indent for most of the
 page
To: "G. Branden Robinson" <g.branden.robinson@gmail.com>
Cc: Alejandro Colomar <alx@kernel.org>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, Jonathan Corbet <corbet@lwn.net>,
 dri-devel@lists.freedesktop.org, 
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-man@vger.kernel.org
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

On Tue, Oct 15, 2024 at 1:32=E2=80=AFPM G. Branden Robinson
<g.branden.robinson@gmail.com> wrote:
>
> At 2024-10-15T11:38:22-0700, Ian Rogers wrote:
> > When /proc/pid/fdinfo was part of proc.5 man page the indentation made
> > sense. As a standalone man page the indentation doesn't need to be so
> > far over to the right.
> >
> > Signed-off-by: Ian Rogers <irogers@google.com>
> > ---
> >  man/man5/proc_pid_fdinfo.5 | 50 +++++++++++++++++++-------------------
> >  1 file changed, 25 insertions(+), 25 deletions(-)
> >
> > diff --git a/man/man5/proc_pid_fdinfo.5 b/man/man5/proc_pid_fdinfo.5
> > index 1e23bbe02..0c4950d5d 100644
> > --- a/man/man5/proc_pid_fdinfo.5
> > +++ b/man/man5/proc_pid_fdinfo.5
> > @@ -8,8 +8,9 @@
> >  .SH NAME
> >  /proc/pid/fdinfo/ \- information about file descriptors
> >  .SH DESCRIPTION
> > -.TP
> > +.TP 0
> >  .IR /proc/ pid /fdinfo/ " (since Linux 2.6.22)"
> > +.P
> >  This is a subdirectory containing one entry for each file which the
> >  process has open, named by its file descriptor.
> >  The files in this directory are readable only by the owner of the proc=
ess.
>
> I don't find this usage to be idiomatic.
>
> There's no point having a tagged paragraph if you want that paragraph's
> indentation to be zero.
>
> I'll grant that it's also unusual to have a man page's "Description"
> section lurch straight into a definition list without any preamble.
>
> Since the only topic of this man page is now the file (or class of
> files) in question, I suggest dropping the paragraph tag altogether
> since it duplicates the summary description.
>
> And as it happens, you can put font styling _in_ the summary desription.
>
> So I suggest something like:
>
> .SH NAME
> .IR /proc/ pid /fdinfo " \- information about file descriptors"
> .SH DESCRIPTION
> Since Linux 2.6.22,
> this subdirectory contains one entry for each file that process
> .I pid
> has open,
> named for its file descriptor.
>
> This renders fine with groff and mandoc(1).
>
> Sample page attached.

Thanks for the advice on how to make things more idiomatic. I'll try
to incorporate your feedback into v2.

Ian
