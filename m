Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DF6F955A96
	for <lists+dri-devel@lfdr.de>; Sun, 18 Aug 2024 04:27:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 14E0510E163;
	Sun, 18 Aug 2024 02:27:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Xb/2NYQF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com
 [209.85.219.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 76B5210E145
 for <dri-devel@lists.freedesktop.org>; Sun, 18 Aug 2024 02:27:42 +0000 (UTC)
Received: by mail-qv1-f41.google.com with SMTP id
 6a1803df08f44-6bf7707dbb6so22684506d6.0
 for <dri-devel@lists.freedesktop.org>; Sat, 17 Aug 2024 19:27:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1723948061; x=1724552861; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wCUZss5UGlk8Yb6DPWfInlcX9mugrcEG4f0aPMm2bCE=;
 b=Xb/2NYQFTFM82J0ncDE0GI/K644Qxtds7snmZX9EKYUandaoIxn/1E7ZqvDaygutgt
 i1IcYAQzFwsT++cBHudZpZwu+QzPTVXB2dVJRtuuQY8an7eJBEtJRITSjA0HSI8XUmVr
 23tIlXDCpyDpeLxPD0XtVD9ciz0FwfPUyShDE1ZR/HGCLeu2WDjXuNK1sojDyRYGD4Id
 6IixakW+fMvDCfuR5QlAtX23v7c1S46xial/Qg2w5FgPWCKv5vV5hM7iaskGO5RZQOy4
 dXr69MOurmZFTifGXS7IBcuM0Fm22yHK+fU3NK2tGCERqt90wh2TKR+ZEY6yX6wC4ljF
 wxOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1723948061; x=1724552861;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=wCUZss5UGlk8Yb6DPWfInlcX9mugrcEG4f0aPMm2bCE=;
 b=HJOjbcitjATJ4EdS4ITamzCSna7KcaHHTgGtuPd/zStl8FI4nNQdAer5w4ydwiTJYE
 CKnuOX+iEgxJedhzf6sPgUfEFpRg14a1ZEgVc9K7vaQFTS5wxPD4sfqIJZuXDQeL07Wv
 zuaIxHCzM1ZcTnVg++zfrfu+T1jAi+dGE7PHsBCAEKN1AV7BLx25+AMoUf+PSP99FvHH
 O4qjW2U3RSfq8fDdxaJWFQv2FVZz20N3/sHPd7YVnl2krIMwmoWg7kQol/GR6Uxi2osd
 9IaX578f34CpYWfEHUmT8QvI71p/kINNTb7rXyBjXeJnu9aEzhCw8TmqVEWzh58t6RMS
 HprA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVYuNTfCT+0Tt+y00LiJkj1Ko0cgyTOZ7MCxmffDBxwq9+FCI9dGxfa0RoCr0HhCoZgNNP90ClbeVObnPXuIqWQRuApcQqK2UI6Bhv7G6HS
X-Gm-Message-State: AOJu0YzWJmeSlHkiuFthAcz+tCF5JceZr8VFbrLffLVu+VXqFuK8Ri2Z
 0fxPHysacpVby+9tplsSYdlQEM566gAccKCdjln9TI0Zu+1jBkFihkgBFt+C/qeJO6Kauwn4KX/
 2r0Q0T2MJuaeWLhks5Jgf66VsdD4=
X-Google-Smtp-Source: AGHT+IF6fsYhsqIGmUj8T8nAX8ZPHa9aPPiBT0MCECGu/PEHdrCH4USnvIhXgIzMD1DqBj/lqnH5UAtX5RLYSKjl0r4=
X-Received: by 2002:ad4:5894:0:b0:6bf:7ae1:9a8f with SMTP id
 6a1803df08f44-6bf7ae19b89mr122178546d6.19.1723948061122; Sat, 17 Aug 2024
 19:27:41 -0700 (PDT)
MIME-Version: 1.0
References: <20240817025624.13157-1-laoar.shao@gmail.com>
 <20240817025624.13157-5-laoar.shao@gmail.com>
 <teajtay63uw2ukcwhna7yfblnjeyrppw4zcx2dfwtdz3tapspn@rntw3luvstci>
In-Reply-To: <teajtay63uw2ukcwhna7yfblnjeyrppw4zcx2dfwtdz3tapspn@rntw3luvstci>
From: Yafang Shao <laoar.shao@gmail.com>
Date: Sun, 18 Aug 2024 10:27:01 +0800
Message-ID: <CALOAHbAzSAQMtts5x+OMDDy1ZY5icUJv2wAM5w74ffhtEbN1mQ@mail.gmail.com>
Subject: Re: [PATCH v7 4/8] bpftool: Ensure task comm is always NUL-terminated
To: Alejandro Colomar <alx@kernel.org>
Cc: akpm@linux-foundation.org, torvalds@linux-foundation.org, 
 justinstitt@google.com, ebiederm@xmission.com, alexei.starovoitov@gmail.com, 
 rostedt@goodmis.org, catalin.marinas@arm.com, 
 penguin-kernel@i-love.sakura.ne.jp, linux-mm@kvack.org, 
 linux-fsdevel@vger.kernel.org, linux-trace-kernel@vger.kernel.org, 
 audit@vger.kernel.org, linux-security-module@vger.kernel.org, 
 selinux@vger.kernel.org, bpf@vger.kernel.org, netdev@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, Quentin Monnet <qmo@kernel.org>
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

On Sat, Aug 17, 2024 at 4:39=E2=80=AFPM Alejandro Colomar <alx@kernel.org> =
wrote:
>
> Hi Yafang,
>
> On Sat, Aug 17, 2024 at 10:56:20AM GMT, Yafang Shao wrote:
> > Let's explicitly ensure the destination string is NUL-terminated. This =
way,
> > it won't be affected by changes to the source string.
> >
> > Signed-off-by: Yafang Shao <laoar.shao@gmail.com>
> > Reviewed-by: Quentin Monnet <qmo@kernel.org>
> > ---
> >  tools/bpf/bpftool/pids.c | 2 ++
> >  1 file changed, 2 insertions(+)
> >
> > diff --git a/tools/bpf/bpftool/pids.c b/tools/bpf/bpftool/pids.c
> > index 9b898571b49e..23f488cf1740 100644
> > --- a/tools/bpf/bpftool/pids.c
> > +++ b/tools/bpf/bpftool/pids.c
> > @@ -54,6 +54,7 @@ static void add_ref(struct hashmap *map, struct pid_i=
ter_entry *e)
> >               ref =3D &refs->refs[refs->ref_cnt];
> >               ref->pid =3D e->pid;
> >               memcpy(ref->comm, e->comm, sizeof(ref->comm));
> > +             ref->comm[sizeof(ref->comm) - 1] =3D '\0';
>
> Why doesn't this use strscpy()?

bpftool is a userspace tool, so strscpy() is only applicable in kernel
code, correct?

> Isn't the source terminated?

It is currently terminated, but I believe we should avoid relying on
the source. Making it independent of the source would reduce potential
errors.

>
> Both the source and the destination measure 16 characters.  If it is
> true that the source is not terminated, then this copy might truncate
> the (non-)string by overwriting the last byte with a NUL.  Is that
> truncation a good thing?

It's not ideal, but we should still convert it to a string, even if it
ends up being truncated.

--
Regards
Yafang
