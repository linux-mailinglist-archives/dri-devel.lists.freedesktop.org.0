Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 74619AC309F
	for <lists+dri-devel@lfdr.de>; Sat, 24 May 2025 19:35:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 991FF10E0CF;
	Sat, 24 May 2025 17:35:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Mssptrco";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com
 [209.85.218.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 860A510E10F
 for <dri-devel@lists.freedesktop.org>; Sat, 24 May 2025 17:35:07 +0000 (UTC)
Received: by mail-ej1-f41.google.com with SMTP id
 a640c23a62f3a-ad564b7aea9so375683166b.1
 for <dri-devel@lists.freedesktop.org>; Sat, 24 May 2025 10:35:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1748108106; x=1748712906; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6esos0NCbJWOrHjcUciV7jdqA8qN5ZRshgoZfehNMKs=;
 b=MssptrcoftbbCRqiGrfe+UMMSYvfx+/L5J7fp6eJ2hd27dQZmIXUnTN7Av7E1OzEIP
 0Sk9ItKZ8pbEhD+tnXCuR+AhIQYvBCHcEyH5nro3jSDfYmVa3qQx0OjgtwkJW1tdREI2
 NxiG2eaGSGBqKDGrEKhgvtOZI4/5uiuKBq4FUjNyNH+hBLJKiJWkIEuKU9LM7Q/bnfhm
 XykjuLGf8eoqf1QF06kKx1bCTa6gzsLXZRjyvOXQC6iQq/+nJAS6RsAnA8zoYFAzuoQp
 2cXHzKhyHiumtbhGQLOhQVknNZNSylw1rGvOQArQNH0P2ESmXyh+JfNjCVey3SKQEV/7
 y7nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748108106; x=1748712906;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6esos0NCbJWOrHjcUciV7jdqA8qN5ZRshgoZfehNMKs=;
 b=MzKBpWjrQDJXuYhP2QZnwDCky5Yc4ZfpBamxHcDM59pKFvchlNmFMr+OzImQDmpIjH
 9gtF+XmV5dSQzLxquYKXRbJWMntmbg1dzU22oGYrUsWG7NX+xveR9+H0jCOICXR/2m/5
 8muCiW7ZS8hLO8d6HESGvBzXeLMuZW7IAGJld3YroJ0dzdZQ5F/uH7/jnBCZOKvU/ObL
 uqEJdU8EuSrJUXW1/yF13093tP9FbIXksBt9Mp0ItoiYPa6CtaDiVPjaK3zu1SzeRr8m
 TE7LUlUj4ekZT6MjRwYbsj7+wsfqA/fBysYCyb7thdg07BzSUn64WqdBrV7vFxqpG5Us
 u5KQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWXg4appbQFLSXaA+onpaWnUSr5Zl+eIVXdh3IAy+PE4/NR7/V54AbPaD+SZKHMmPPQzKf6yJmbatI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzeVmZWvrklB9KkSnYRW3zknjfl4P33rVeXEcLwW4aKNGrinU1I
 g16BYxy9a3wQWm6XFpTCO+rQ9EnthwPx7IOHazV9zUd1V9SZd6wmqOThlsMhNhoK+x+AmOfs8p+
 eGduDF29XGe950QehQ3TzWQku2EhGoP89GH8R5Yhwxg==
X-Gm-Gg: ASbGncuH+UvW6frLjwrR2ujktNIEFNYUQzLUQRPGX6Sm8DNwVwOEQTj64V+RRXlhNus
 DrjQuJLJR7aZLYE4WTuYX5mTWeB2n5tV6wfRuv+a8TjDyW3jUXRdJDazXzJiSjR55aWpLotw3zF
 FpC54vQIUS4HJQCO7JI6HNoZh+Z21Pa44/M0uS3iA5XFjyj0BUVmY5LFtya7F5tG+5Vg==
X-Google-Smtp-Source: AGHT+IH7TxQKxV5rqnlT4lgf1dRHo65M8Huun796jND/WC3MPI6epVJVwGlHgQV8HtghIxJJCAIRdYl+87zUl5rXFss=
X-Received: by 2002:a17:906:6a26:b0:ad5:4998:9f1a with SMTP id
 a640c23a62f3a-ad63f984b0fmr718065366b.5.1748108105950; Sat, 24 May 2025
 10:35:05 -0700 (PDT)
MIME-Version: 1.0
References: <20250522-drm-doc-updates-v1-1-d1efd54740bd@gmail.com>
 <87ecwfczcw.fsf@trenco.lwn.net>
In-Reply-To: <87ecwfczcw.fsf@trenco.lwn.net>
From: Abdulrasaq Lawani <abdulrasaqolawani@gmail.com>
Date: Sat, 24 May 2025 13:34:55 -0400
X-Gm-Features: AX0GCFsi-MN0UA4uRCGebgf9C8Rt3Zsaglwx2_dkVsiyykORTxqO9nOADvqJFIA
Message-ID: <CAC0Z3JtyP+QKdP9WiuyURfnU9ccobzvChCBK1i=eENm5DEyQNw@mail.gmail.com>
Subject: Re: [PATCH] drm: add overview diagram for drm stack
To: Jonathan Corbet <corbet@lwn.net>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org, 
 linux-kernel@vger.kernel.org
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

Thanks for the feedback. I have added the fix and sent another version
(v2) of the patch.

https://lore.kernel.org/all/20250523-drm-doc-updates-v2-0-e517df152cf6@gmai=
l.com/

best regards,
Abdulrasaq


On Fri, May 23, 2025 at 7:58=E2=80=AFAM Jonathan Corbet <corbet@lwn.net> wr=
ote:
>
> Abdulrasaq Lawani <abdulrasaqolawani@gmail.com> writes:
>
> > Add an overview diagram of Linux DRM architecture for
> > graphics and compute to introduction.rst
> >
> > ---
> > Signed-off-by: Abdulrasaq Lawani <abdulrasaqolawani@gmail.com>
> > ---
> >  Documentation/gpu/introduction.rst | 38 ++++++++++++++++++++++++++++++=
+++++++-
> >  1 file changed, 37 insertions(+), 1 deletion(-)
> >
> > diff --git a/Documentation/gpu/introduction.rst b/Documentation/gpu/int=
roduction.rst
> > index 3cd0c8860b949408ed570d3f9384edd5f03df002..91bb0efc96d69921a122c52=
65b1431fa18110a7a 100644
> > --- a/Documentation/gpu/introduction.rst
> > +++ b/Documentation/gpu/introduction.rst
> > @@ -14,7 +14,43 @@ including the TTM memory manager, output configurati=
on and mode setting,
> >  and the new vblank internals, in addition to all the regular features
> >  found in current kernels.
> >
> > -[Insert diagram of typical DRM stack here]
> > +Overview of the Linux DRM Architecture
> > +-----------------------------------------------
> > ++-----------------------------+
> > +|     User-space Apps         |
> > +| (Games, Browsers, ML, etc.) |
> > ++-----------------------------+
>
> [...]
>
> Please actually build the docs after a change like this and look at the
> results; they will not be what you expect here.  You need to put that
> diagram into a literal block.
>
> Thanks,
>
> jon
