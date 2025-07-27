Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CD42B12EDE
	for <lists+dri-devel@lfdr.de>; Sun, 27 Jul 2025 11:51:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7341510E00B;
	Sun, 27 Jul 2025 09:51:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Na/2EA/N";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-f43.google.com (mail-oo1-f43.google.com
 [209.85.161.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A55110E00B;
 Sun, 27 Jul 2025 09:51:15 +0000 (UTC)
Received: by mail-oo1-f43.google.com with SMTP id
 006d021491bc7-610cbca60cdso2096481eaf.0; 
 Sun, 27 Jul 2025 02:51:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1753609874; x=1754214674; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=nFeZkLi3dXMjYKmhsyulgqSrNnECKk/svpVxCMAGOH4=;
 b=Na/2EA/NeZg4EylQOPQb+T56v39PI/R0VmA5Zvx7VpgHB2KvPOd706A+MU6iIw2RJN
 KfnpKDb5OKdyUGkx9pO9Vnb/a5FXajwpApeKt0TR+Ge29swFTtKuVpNV7efUkDzYBGJp
 iGRk2o1iarQ5iOA0eH3lVjazqtEvGALFJn/zUQSZv6Sppzi4XrcxyUZw+b679DSGmeXk
 z2FQvZA7Rlz7LHUOEsmOx8+boKqB8Z/b5hKGh76P6eSAHdEWoMU5APbR+bpBwJXJvq+o
 FomX4qJIaj4V3o7tNmzYk1TJsnjhcAe/vcKStkqauzdPk9OzLPlsCCCs+9Gnb8ilNIkF
 N/8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753609874; x=1754214674;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=nFeZkLi3dXMjYKmhsyulgqSrNnECKk/svpVxCMAGOH4=;
 b=RXsHH4FVsIynglorQMO/LeBVpGNCtNYazlWnAj6sZ3x5TowjeZyGEmQRI8Zt+m4tKc
 AiWnALaV4juTMj9HYxJyo1NSSguVQsj1W3WUsYUkTHJrARrCvTpHRB3hjtP+AUGGVYqN
 02YH67PWZI7VhV9Uv1XqmYvEwIBA8XPVPdaP0w/C2ZnP+vnGzFtI4GJ+PMwt4TPecB0N
 MGdzIYzxJbWHY0wUL/pdt+d/bLVe2dlECjm0NQ38MJWoqDZWXNR1/FvTbIIGELt9aXZy
 RXWZf34FNfnxvr4tSr9qQ84uU/d1LRqk4nXX7i7eRtUhfnVe6jHJNSt1DkHkH/r/uzDV
 o2rA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUp2PP8nHINWkRrkXmy0xJCQhmrlA+m5/L1+OlF9LLuGDLv19OirbCCFSI8BRrRHzVUTzW3JDPDdTo=@lists.freedesktop.org,
 AJvYcCWw+M4KPcQ7LRKk+Q+/xelF1EpyzJdL9vKnBLrTcXcC/j3tt6qmznbfziehFqqtWTIlxKpbyZFRAw==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwZk+4+DzxJetR4FkE9Y9LuRQVrczgKw0XldWF+4cTB6mive4gd
 Ej49UtPQJ8qXZmAY4+Yowe2Ly5eEYXylmavO3f2GVArZTkgnYZD14rPOOXJ4OF7iC01m7OkV0eK
 AgpKbVghmQ0/OVCL+UZ4UuqpFyZFfRE4=
X-Gm-Gg: ASbGncugKmiQHq+TepJS9Ll6rcDZnhoRc+qLh+FL9Wg867a6uS3ZT2DLf5KH6I6+r2I
 CiyrYETZUEi8I4sU9rcbpS4mC8hcxMDh6A9IWQ8CU6ZMYs0YjpOMIFKFeBynQZM5TjYQXh1dzD5
 d2LPaHdxba+qC4SJEyKTwbXRGkzbCAKHLxr/2uU3BLsgrH9gq6ANWIRzTu6C4NVdOVMuDy720dC
 8wNlBhNmcPwX1qa5+lLdaPUl+b1bpLyuFbmbWrE
X-Google-Smtp-Source: AGHT+IFrYgebhq8gmtJdDuLT1R1NJegqag8vHwHBlQ7UiW0xS1gBt/xj3wz+uraz0qf/jzt5q2P6fPA8Y+A+zhmLNyg=
X-Received: by 2002:a4a:ee0f:0:b0:609:dd17:795 with SMTP id
 006d021491bc7-6190c9b2767mr4863242eaf.6.1753609874595; Sun, 27 Jul 2025
 02:51:14 -0700 (PDT)
MIME-Version: 1.0
References: <20250718073633.194032-1-krakow20@gmail.com>
 <DBL6BUAHZ250.3UCFP2OB3UEIY@nvidia.com>
 <ab63103c-3b21-451e-b450-a1755b452d77@kernel.org>
In-Reply-To: <ab63103c-3b21-451e-b450-a1755b452d77@kernel.org>
From: Rhys Lloyd <krakow20@gmail.com>
Date: Sun, 27 Jul 2025 02:51:03 -0700
X-Gm-Features: Ac12FXz6IRrbu5D8lGdf-x7j5aaSoITICjmtxz8OWjJATTXn2XMK8AX82FcIyc8
Message-ID: <CAH7AjUzfc3+SFNKWDerOY62M3OU8=wX8Qs=Bj_S-uKo6w0nuYQ@mail.gmail.com>
Subject: Re: [PATCH] gpu: nova-core: vbios: use offset_of in
 PmuLookupTableHeader::new
To: Danilo Krummrich <dakr@kernel.org>
Cc: Alexandre Courbot <acourbot@nvidia.com>, rust-for-linux@vger.kernel.org,
 airlied@gmail.com, simona@ffwll.ch, nouveau@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
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

On Fri, Jul 25, 2025 at 7:04=E2=80=AFAM Danilo Krummrich <dakr@kernel.org> =
wrote:
>
> On 7/25/25 3:35 PM, Alexandre Courbot wrote:
> > This chunk does not apply - on nova-next PmuLookupTableHeader does not
> > seem to exist. I think I remember you split PmuLookupTableHeader in
> > another patch, so can you send all the relevant patches as a series tha=
t
> > applies cleanly on top of nova-next?
>
> If otherwise the series is ready, please wait for -rc1 to be out, and reb=
ase on
> -rc1.
>
> Thanks,
> Danilo

Strange that it does not apply.  I'll figure out how to send a patch
series and resend it without any changes.
