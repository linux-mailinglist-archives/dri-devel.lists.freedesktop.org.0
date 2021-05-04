Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F49D373083
	for <lists+dri-devel@lfdr.de>; Tue,  4 May 2021 21:12:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5FF7B6EB42;
	Tue,  4 May 2021 19:12:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x22c.google.com (mail-oi1-x22c.google.com
 [IPv6:2607:f8b0:4864:20::22c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B94936EB42;
 Tue,  4 May 2021 19:12:29 +0000 (UTC)
Received: by mail-oi1-x22c.google.com with SMTP id i11so9808673oig.8;
 Tue, 04 May 2021 12:12:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=TPDeFE2c5Z76UvfNrVUjfTjEKbAvB781/8qEcRhYZ1A=;
 b=m7JXTIDzCRbD7Q0oeh8pOdJ5IV8K1Iq6vnxUIO2HTHoH8Grv+ZS8GntIPA+88v8FkJ
 qgn/EEMFJdPXK7sdH89yo6MHyHis/YtR62DpdPytSG6DXdd4lCLrJPhivSf8FFRDisG6
 95vg7J+aA8RPYLRbaICbd+62mjAVbK2+p6/OxyCPxXdfaRCAzi0JPUDW34+yii56dmj6
 QphCg8AnPHGX+LQnfGcDHXM7oOAA56UnDRC9BshzzVAwvy7WjFzikBYjuVUrJXHYZlLr
 wWYEJIGyY9hTRPVzM759mZ/9mt/z6zVeXhes4qEH6Wj+9o3oEkkIysdREvnCirpvQhv0
 pFIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=TPDeFE2c5Z76UvfNrVUjfTjEKbAvB781/8qEcRhYZ1A=;
 b=B9KT3zJvChalcdi5R06PE9TRN5QuUnB+W/soksTPCZPQ68/LcA0EuAu2IBM+8oXRnF
 2kLeAdyb3jsZdIAaGHgN1bUSHS+YUvx5sWnltIterzAWKMrrfFaS5e5iTHwzXZhDpdNi
 EIb7iHo7WFPl8k4CLSx2IPqiAX8Asjlv7fVTm3+6f7JLM5VQHE/c8a3J5KdgDtJNh1ut
 BRL+WdEstCixxV4oTnw942Gni1u+Lfa2slxE7yu6giztZbUV2KvyROaPF0sUz550lN+/
 yGhWRLxktfOoYikbGrF0Sgs1BhQJg9Dwb4U3ULthnFtsQDFG3uyhCodx53OWXzYM6Rfu
 MWfw==
X-Gm-Message-State: AOAM533dE7ExfN4t1/oY73tRkl7REv4RQgzaupwNy2KJUvFIn03WE+qe
 bS3e3h7lur83jSf9omqj+zbF3t1Vp8l4QCxH9qE=
X-Google-Smtp-Source: ABdhPJwHSTqjMM40PaZIK54FPHCHCVkrKAa7q6CSOKlSwlSvjS557Wz7M3OFOc+h6Q3dlx1eNVXDCCkVgaTOyRChhsI=
X-Received: by 2002:aca:fc50:: with SMTP id a77mr13095451oii.123.1620155549069; 
 Tue, 04 May 2021 12:12:29 -0700 (PDT)
MIME-Version: 1.0
References: <20210503050608.2158996-1-keescook@chromium.org>
In-Reply-To: <20210503050608.2158996-1-keescook@chromium.org>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 4 May 2021 15:12:17 -0400
Message-ID: <CADnq5_OtqZ5KPQsd=sOniOGEhTJTjyKm2KoLdbwG_MWORp31pA@mail.gmail.com>
Subject: Re: [PATCH 0/2] drm/radeon: Fix off-by-one power_state index heap
 overwrite
To: Kees Cook <keescook@chromium.org>
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
Cc: "Erhard F." <erhard_f@mailbox.org>, David Airlie <airlied@linux.ie>,
 LKML <linux-kernel@vger.kernel.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, May 3, 2021 at 1:06 AM Kees Cook <keescook@chromium.org> wrote:
>
> Hi,
>
> This is an attempt at fixing a bug[1] uncovered by the relocation of
> the slab freelist pointer offset, as well as some related clean-ups.
>
> I don't have hardware to do runtime testing, but it builds. ;)
>
> -Kees
>
> [1] https://bugzilla.kernel.org/show_bug.cgi?id=211537
>
> Kees Cook (2):
>   drm/radeon: Fix off-by-one power_state index heap overwrite
>   drm/radeon: Avoid power table parsing memory leaks

Applied.  Thanks!

Alex

>
>  drivers/gpu/drm/radeon/radeon_atombios.c | 26 ++++++++++++++++--------
>  1 file changed, 18 insertions(+), 8 deletions(-)
>
> --
> 2.25.1
>
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
