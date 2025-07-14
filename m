Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 49CF1B044F9
	for <lists+dri-devel@lfdr.de>; Mon, 14 Jul 2025 18:04:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2419110E055;
	Mon, 14 Jul 2025 16:04:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=darkrefraction-com.20230601.gappssmtp.com header.i=@darkrefraction-com.20230601.gappssmtp.com header.b="0Busqj+r";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com
 [209.85.218.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 664E710E093
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Jul 2025 16:04:30 +0000 (UTC)
Received: by mail-ej1-f53.google.com with SMTP id
 a640c23a62f3a-ae0e0271d82so814190166b.3
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Jul 2025 09:04:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=darkrefraction-com.20230601.gappssmtp.com; s=20230601; t=1752509069;
 x=1753113869; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dqXm/T0vczF/8wwedbnGXW3hQmadLRteatm7i2xnx2o=;
 b=0Busqj+rnoQmPv+fk4IXJMD3Rsh0MaavvekD3e1zY7f2MO5mgZ6TQ4aWCiUXI1zhkQ
 A4koF0E+c8AJK7nr4LeQMCRZLUVF5UY0S5wg+OpoUhqAslS+Y0xpkfqz0jH8hRAJIQ6q
 rCKHqlDFTpz3eJl0flTSTfvIPYNODJNPhEOuO4CgQv7Y2fuF4ocT1p9agp3epZReI0V3
 /YQSPvkt0kcV0Tl7KHIHW0npBhtkNzbG6CXp6cyydHxJ+q6TuGATJoZit1BvjxBWZpFn
 20sNVi3IFhiU9aG2PNeKOVi2ZlavuM+GEZZ1IVCw+xzcE6/dE0aOXF1BHQleYXxb7fmD
 roAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752509069; x=1753113869;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=dqXm/T0vczF/8wwedbnGXW3hQmadLRteatm7i2xnx2o=;
 b=PGMj+7EqgEoC5xjTsm7XXdvOYNl7EgKdIrFuatme74Wt/32GWTY8adLbMZFvxfOLU2
 coEYHvfqJGfsPzZ+Zn6FebDZ3xPP2O4iT1m8OW3CtpqUIfErUveKyhtXiO8KUq3JkV07
 24fg4uvKOsQPiOTR7Qg+TY60JJ2oV/nj0+1GasMe5RXFfv0z57X8zabBBVBKcwaNb6We
 sihegX5xoSTC9OkknkAvTSAAr3L5MFWJzn0SHj9PUCk3kdIdZr3ML0NVMjvi/w83S+XT
 jppeKvN4jlYk9cu15zqQDJ9l1DkxwfP4gPoZf0UcuVnCt4bGJYFHYRP0WPrLDok+ZAK4
 mAXw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXxSguCqQVumX9anPnE06NCTx7JPczzQ23MAXP06yMUnxQl5I0wsFcru4ow24RrIvEDzNot4BgIFQk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw0vknYp3oxD7bstxPBFVxgCz4qD+G26yGi7HNBHnoCyCX+uJS6
 hpEUE5sLTmY7bvb1aWLgnVXni6/k4HZih5psHPsN/ssC1o0JwkJ8X4rMaY6wGdvLhssuf0YCKTG
 +KDbz2wxINUjsJypf5+dCC5yW+JV9WmZpAyY8yFFK3Q==
X-Gm-Gg: ASbGnctakIf4eguEpSD/6G3BBMVqOzyYjWJJQpUgxb1hN8LMigGMQ3Ds0ogpFBbN4kN
 okgH/fNzEBw7M021n8Krp0Dm53ucpmNqxK5wQX5qVtygyOe1qU14FnurkXNKdBH+2pBs21Gam9H
 0S5IaGHajDL+ejJHbxJ9hFVc5MEvtU1lKUhuv+opbIX52uTdrgsnukAtcz6a25FTWl3m81i8izV
 XOJlYvgwxP3LZrSo8o=
X-Google-Smtp-Source: AGHT+IEa9/U8ZoI5SDlaH2Qpt+vmCSoSI5qreRFwcJbAXp/1OEwu7K55Iz/uHKxKmngvp65qOqd3vx9FoH0G4HY1bJw=
X-Received: by 2002:a17:907:9811:b0:ad5:2328:e39b with SMTP id
 a640c23a62f3a-ae6fbf20e29mr1465673366b.31.1752509068346; Mon, 14 Jul 2025
 09:04:28 -0700 (PDT)
MIME-Version: 1.0
References: <20250623220909.7591-1-mhenning@darkrefraction.com>
 <20250623220909.7591-3-mhenning@darkrefraction.com>
 <c3902fcf8bc963cf315e9bfbb9ca4c66e28857cf.camel@nvidia.com>
 <CAAgWFh05pj_9rk7Wcx24tFWR2sgMZH4WtBsm3hYrqM3svwniOQ@mail.gmail.com>
 <127e866b4bb4fd3a77e1cbfc5b709bcb2533c744.camel@nvidia.com>
 <CAAgWFh2vZt7Oay0NGs4ttSTdJ5oP7qv+wWeRz0MRr=L5LeF8JA@mail.gmail.com>
 <3c368bab-8f66-45f8-8b07-b8e62d43c8a9@nvidia.com>
In-Reply-To: <3c368bab-8f66-45f8-8b07-b8e62d43c8a9@nvidia.com>
From: M Henning <mhenning@darkrefraction.com>
Date: Mon, 14 Jul 2025 12:04:02 -0400
X-Gm-Features: Ac12FXzcvAj5jkGMjkyBym67HuBrbs9ZybatNox9USZXyOeycmxfaXT6qmdGEVM
Message-ID: <CAAgWFh1N1_j+jXpMm+fcC9tPTs99QKACb8Ox7mph=UWx28zVjQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] drm/nouveau: Remove nvkm_gsp_fwif.enable
To: Ben Skeggs <bskeggs@nvidia.com>
Cc: Timur Tabi <ttabi@nvidia.com>, "kherbst@redhat.com" <kherbst@redhat.com>, 
 "martin.peres@free.fr" <martin.peres@free.fr>, 
 "faith.ekstrand@collabora.com" <faith.ekstrand@collabora.com>, 
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, 
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 "dakr@kernel.org" <dakr@kernel.org>, "lyude@redhat.com" <lyude@redhat.com>
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

On Sun, Jul 13, 2025 at 11:19=E2=80=AFPM Ben Skeggs <bskeggs@nvidia.com> wr=
ote:
> Yeah, the GPUs that don't support GSP-RM can't hit the code that used
> fwif.enable anyway, so the series should be fine as it is.

We're actually talking about the reverse case. That is, on Ada what
happens if you set nouveau.config=3DNvGspRm=3D0 on the kernel command
line?
