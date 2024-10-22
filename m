Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 437919AB59F
	for <lists+dri-devel@lfdr.de>; Tue, 22 Oct 2024 19:58:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B738B10E6FB;
	Tue, 22 Oct 2024 17:58:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b="p5mJ/qLN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com
 [209.85.219.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E219110E6FB
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Oct 2024 17:58:49 +0000 (UTC)
Received: by mail-qv1-f47.google.com with SMTP id
 6a1803df08f44-6c5ab2de184so35000866d6.0
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Oct 2024 10:58:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1729619929; x=1730224729;
 darn=lists.freedesktop.org; 
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
 :date:message-id:reply-to;
 bh=bzWd8rKalKLnCDEJXyAj/PFeqHxExSaBmYI1WaZdk80=;
 b=p5mJ/qLNZh7QORl20S05rcxLNWPvMPfH3aPvmsPF1Knndfx5W3yd+Et4iW7Yz6K+8V
 hDGACGvnE0u/kjQ2fMx2WeGPTHpdkwXONVsX2xw7yBGLFmgWj6YRK2UevLQxujnHC/Dj
 TyHAf9UrYnf1YXAVYnys07Sjxwieflr7FGpGKNRjxIQtbSvJ+NAJ4q+G4vPUQJcVHPb9
 asKs5ileOcQ9oX3TxWUzGeNysidgMy09egGlnBzt6GtTC2HU/8lp9nG7VavPk/sFzvkV
 uwnRj7oU7cD+45IswIIm8ka45aV2kYXxACQnhffaAQSBLd+wa5c2eDB2yB7snlhVnukq
 VfoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729619929; x=1730224729;
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=bzWd8rKalKLnCDEJXyAj/PFeqHxExSaBmYI1WaZdk80=;
 b=BLFSpxm8qPU3yyLasUbW+fZeanHDdsk5NEf4UOfUcPIOZMdiE3bo6/BmSYg3Ejp6nv
 2HSMYvVKqI2FLa1F8v1qbw9l61G7gGK3CHSJ3cKb4k4qGrtZM75znF099SNehAs5tHOE
 HpGPrcJkU6bFweC/QMQtuDAyQDHgWuZ7J2/k4d5N9/76XhY47UvZ8qK86eGCRSZaWq3d
 Rmaxajkgi0fujys3rFJDBB4hAsqpIOpi+bg6PHcObgBtI38W7QestUWA2OovHiGTJQLj
 OWZhTb6U8iRiKoNoR/unLF5mSTzQVVWRutFYybW/i573KoeVKNCFgsS/4Ywjax+n0rkl
 GVRg==
X-Forwarded-Encrypted: i=1;
 AJvYcCU3nkkVechcF8I1tYPkUZUF2nQgV1wxjjhTht4bnHlvE3Au3SLrctykfLOxSY2jwkOY1I7xBww7vWo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YywcZ42a7W+LOQ/7JWf4usWX8Q/ALSQqw+9Zu0a3r2C4Vom4P6Z
 pfMM3BUdhO6WAmNUTbvpMdWn67D4HqWP7EfPkFb6Ff9DUr/avra/egU6MzNombk=
X-Google-Smtp-Source: AGHT+IFdA/p619PkELXaREfuUW3E6V0uE6dktYYNp3frR0HpWhrRRTYooq1Sbx8ODU8q4H36RgRX0g==
X-Received: by 2002:a05:6214:3991:b0:6ce:305e:324f with SMTP id
 6a1803df08f44-6ce305e3471mr15960826d6.23.1729619928754; 
 Tue, 22 Oct 2024 10:58:48 -0700 (PDT)
Received: from nicolas-tpx395.lan ([2606:6d00:15:862e::7a9])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6ce009996e0sm30984706d6.82.2024.10.22.10.58.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Oct 2024 10:58:48 -0700 (PDT)
Message-ID: <f8831b4e658b19a1df4cc02449bb74d730908de6.camel@ndufresne.ca>
Subject: Re: Requirements to merge new heaps in the kernel
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: John Stultz <jstultz@google.com>, Maxime Ripard <mripard@redhat.com>
Cc: Sumit Semwal <sumit.semwal@linaro.org>, Benjamin Gaignard
 <benjamin.gaignard@collabora.com>, Brian Starkey <Brian.Starkey@arm.com>, 
 "T.J. Mercier" <tjmercier@google.com>, Christian =?ISO-8859-1?Q?K=F6nig?=
 <christian.koenig@amd.com>,  linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org,  linaro-mm-sig@lists.linaro.org,
 linux-kernel@vger.kernel.org
Date: Tue, 22 Oct 2024 13:58:47 -0400
In-Reply-To: <CANDhNCoLgzy=CPBWjBKLiJzRdnf=SS3AgtFJNB-CBYAo=UEQJA@mail.gmail.com>
References: <20241022-macaw-of-spectacular-joy-8dcefa@houat>
 <CANDhNCoLgzy=CPBWjBKLiJzRdnf=SS3AgtFJNB-CBYAo=UEQJA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.4 (3.52.4-1.fc40) 
MIME-Version: 1.0
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

Hi,

Le mardi 22 octobre 2024 =C3=A0 09:19 -0700, John Stultz a =C3=A9crit=C2=A0=
:
> On Tue, Oct 22, 2024 at 1:38=E2=80=AFAM Maxime Ripard <mripard@redhat.com=
> wrote:
> >=20
> > I wanted to follow-up on the discussion we had at Plumbers with John an=
d
> > T.J. about (among other things) adding new heaps to the kernel.
> >=20
> > I'm still interested in merging a carve-out driver[1], since it seems t=
o be
> > in every vendor BSP and got asked again last week.
> >=20
> > I remember from our discussion that for new heap types to be merged, we
> > needed a kernel use-case. Looking back, I'm not entirely sure how one
> > can provide that given that heaps are essentially facilities for
> > user-space.
> >=20
> > Am I misremembering or missing something? What are the requirements for
> > you to consider adding a new heap driver?
>=20
> It's basically the same as the DRM subsystem rules.
> https://docs.kernel.org/gpu/drm-uapi.html#open-source-userspace-requireme=
nts
> ie: There has to be opensource user for it, and the user has to be
> more significant than a "toy" implementation (which can be a bit
> subjective and contentious when trying to get out of a chicken and egg
> loop).

If there is a generic logic to decide to use a carve-out when using some
specific device on specific platform, it would not be a problem to make
userspace for it. I'm happy to take DMABuf patches in GStreamer notably (wh=
ich
could greatly help ensuring zero-copy path).

But so far, all the proposals was just a base allocator, no way to know whe=
n to
use it and for which device. The actual mapping of heaps and device was lef=
t to
userspace, which to be honest would only work with a userspace Linux Alloca=
tor
library, with userspace drivers, or inside mesa if the devices are GPUs/NPU=
s.
This is a project Laurent Pinchard have hosted a workshop about during XDC.

Nicolas

p.s. libcamera have device specific knowledge, and could of course be a sho=
rter
term user. Note that major distro are not happy that there is no memory
accounting for dmabuf, bypassing sandboxes and limits.
