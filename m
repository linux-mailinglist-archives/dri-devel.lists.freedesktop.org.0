Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B6E578ECF7
	for <lists+dri-devel@lfdr.de>; Thu, 31 Aug 2023 14:22:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA30F10E193;
	Thu, 31 Aug 2023 12:22:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6AA8A10E193
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Aug 2023 12:22:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1693484535;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZSOEGxFz87m0ye0g3IzP1/eXKvdkuFQz3xBGryZ7gJY=;
 b=dREiUUmDeojjgylkD4E+5lHhmuBVG1VoyxGPBeB36+0HZX0D+Gd6/96apDfhuGrYhg68qu
 X0qARLMihkK5wYtLzfAyWpatYCUzV1Nx2sfRqFbYPUrsp3o8S219sxOK6Dt6m9SY+IEcE1
 RFlBLUIgWnUdREyWs+KpQmneysuwi/o=
Received: from mail-lf1-f71.google.com (mail-lf1-f71.google.com
 [209.85.167.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-361-ZR_XWVn4NvarBk0HGfr5Zg-1; Thu, 31 Aug 2023 08:22:12 -0400
X-MC-Unique: ZR_XWVn4NvarBk0HGfr5Zg-1
Received: by mail-lf1-f71.google.com with SMTP id
 2adb3069b0e04-5009005a5fdso379209e87.0
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Aug 2023 05:22:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693484530; x=1694089330;
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ZSOEGxFz87m0ye0g3IzP1/eXKvdkuFQz3xBGryZ7gJY=;
 b=UbksBK6tZfxLjXre3e5oqq0HTb7YuVwncDM1qBXuCC/bpWAuxVaGgNy1DyrRnF9N24
 OWXhCYcBmY9Te+ki1kBKH6YTbmTSG5iFTGFO8HnebTzeniBRfbZQKTWG+01NOcKu9arZ
 WLQhuAGDY75tLj8fdVTlKMkHLfegqaaYMzbggY61iEGh5muuv/WSkzzqlIiUSjPZN91f
 ELotrZfxCG4hVIfU+FQByvgMRvSNSzK5mzlqm+aKZlvHCoEzULfL5mSMoLjdV+waoTfB
 gAvK8OtJcscYWwQVduKXlwsqH6rIGj/S9osJ5VgcvMAVn/01AMSCGJ/sH1rULObAGegS
 CHAw==
X-Gm-Message-State: AOJu0YzxMIkW7t1fdFbUgcsMBQx0HrxzUCLuQPpuQPnjUNaLJH14CtEo
 MwaBkdwtQ8TmZSFOUiQDIvy3wL78xW1JJvQCmcxvgd/728+hY2WQ1tqcEB5cYg9uIYXyfbCGCxR
 9E6Hrd9Zo5I6FVSdY0+0f6qdRuERC
X-Received: by 2002:ac2:4432:0:b0:4fd:cbd8:17c0 with SMTP id
 w18-20020ac24432000000b004fdcbd817c0mr3729087lfl.3.1693484530580; 
 Thu, 31 Aug 2023 05:22:10 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE5CjCYPDLiBCWT5zVq/nHUhJcr4QW0nSq7bjVUdz8KXgZTbSh2XNB92Vzw3Ab4jqk6Nh2Jcg==
X-Received: by 2002:ac2:4432:0:b0:4fd:cbd8:17c0 with SMTP id
 w18-20020ac24432000000b004fdcbd817c0mr3729057lfl.3.1693484530194; 
 Thu, 31 Aug 2023 05:22:10 -0700 (PDT)
Received: from [10.32.64.120] (nat-pool-muc-t.redhat.com. [149.14.88.26])
 by smtp.gmail.com with ESMTPSA id
 f3-20020a7bc8c3000000b00401c595fcc7sm5011941wml.11.2023.08.31.05.22.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 31 Aug 2023 05:22:09 -0700 (PDT)
Message-ID: <94b893ef37fe0cc0bcc52e8b54c62be3853a7bbb.camel@redhat.com>
Subject: Re: [PATCH 1/5] string.h: add array-wrappers for (v)memdup_user()
From: Philipp Stanner <pstanner@redhat.com>
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Thu, 31 Aug 2023 14:22:08 +0200
In-Reply-To: <CAHp75VfkzV-=XuEZwipYzfHNu4EXuwzbu6vfEKh1Uueseo2=wA@mail.gmail.com>
References: <cover.1693386602.git.pstanner@redhat.com>
 <46f667e154393a930a97d2218d8e90286d93a062.1693386602.git.pstanner@redhat.com>
 <CAHp75VfkzV-=XuEZwipYzfHNu4EXuwzbu6vfEKh1Uueseo2=wA@mail.gmail.com>
User-Agent: Evolution 3.48.4 (3.48.4-1.fc38)
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
Cc: Andy Shevchenko <andy@kernel.org>, Christian Brauner <brauner@kernel.org>,
 Siddh Raman Pant <code@siddh.me>, Kees Cook <keescook@chromium.org>,
 kexec@lists.infradead.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Maxime Ripard <mripard@kernel.org>,
 linux-hardening@vger.kernel.org, Luis Chamberlain <mcgrof@kernel.org>,
 VMware Graphics Reviewers <linux-graphics-maintainer@vmware.com>,
 Eric Biederman <ebiederm@xmission.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@redhat.com>,
 David Disseldorp <ddiss@suse.de>, Nick Alcock <nick.alcock@oracle.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 2023-08-30 at 17:11 +0300, Andy Shevchenko wrote:
> On Wed, Aug 30, 2023 at 4:46=E2=80=AFPM Philipp Stanner <pstanner@redhat.=
com>
> wrote:
> >=20
> > Currently, user array duplications are sometimes done without an
> > overflow check. Sometimes the checks are done manually; sometimes
> > the
> > array size is calculated with array_size() and sometimes by
> > calculating
> > n * size directly in code.
> >=20
> > Introduce wrappers for arrays for memdup_user() and vmemdup_user()
> > to
> > provide a standardized and safe way for duplicating user arrays.
> >=20
> > This is both for new code as well as replacing usage of
> > (v)memdup_user()
> > in existing code that uses, e.g., n * size to calculate array
> > sizes.
>=20
> ...
>=20
> > --- a/include/linux/string.h
> > +++ b/include/linux/string.h
>=20
> I'm wondering if this has no side-effects as string.h/string.c IIRC
> is
> used also for early stages where some of the APIs are not available.
>=20

I forgot to address this point in my previous reply.

Who's going to decide whether this is a problem or not?


My personal guess is that this is unlikely to be a problem because

   A. either (v)memdup_user() is available, in which case
      (v)memdup_array_user() will always work =E2=80=93=C2=A0
   B. or (v)memdup_user() is not available, which would cause the code
      that currently uses (v)memdup_user() for copying arrays to fail
      anyways.


P.

