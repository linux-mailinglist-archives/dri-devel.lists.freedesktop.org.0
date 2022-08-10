Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 854BC58E8D5
	for <lists+dri-devel@lfdr.de>; Wed, 10 Aug 2022 10:34:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AFBADF2164;
	Wed, 10 Aug 2022 08:33:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x232.google.com (mail-oi1-x232.google.com
 [IPv6:2607:f8b0:4864:20::232])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA752F20F7
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Aug 2022 08:33:34 +0000 (UTC)
Received: by mail-oi1-x232.google.com with SMTP id w197so3880814oie.5
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Aug 2022 01:33:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc;
 bh=qng18ezuViFS4JHv1suUwHMOD3dA0ddp/TS8ruYkzxY=;
 b=Xo7HewGoXQ93vdJ673ZkR+tcoUdDl9VfPro55Vby9VrJvIMSVQRWW+l8IzswksIecM
 FJ23GJpiXQh/pyuvnpU5g3iQbV02xodcvNiDJwDMgL67ZXX2fNtmG9OBAvT/AJiLKz1O
 m57OQJzScr8ptLkEC3wAZsB50Mtf/5dHx8myw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc;
 bh=qng18ezuViFS4JHv1suUwHMOD3dA0ddp/TS8ruYkzxY=;
 b=ol2hj98cRLq0uZClvcgPHq1HcFl5P1yMkdH2Nb1BH+O+HPf4xZ+9r0YsfiOc1APs6E
 IKu9Ml/UAgT7xPvQbpgi3rYMHpLQJdc0Jrio4R+fcxwG/duisi5obD65lvMkAICnq4Eh
 FRX4IyqybICrBHcWkHWV7HeziwXXfWO9Uxe1DlbAljef0B2vYaQQsZBDw5/WGT6bmlGP
 ZpDnOEPZ36Viegq3bqCfTXjvehihSQipQP+3haruX1xbGay0OdBQFOk+SqlGiUqUAeIn
 GHWbJ/FQvAGxZlxNM/LizzccNgxYNm0Ky1N5q3KTBVJFQPGoNPmc2yU2uRIsl6ET/IoT
 As1g==
X-Gm-Message-State: ACgBeo0gCppW7WtD4bZ3E7NaBVW6TmifEdGRAe9IeGKFArdVpqZTDtSe
 yZga34MjzD+oL+pe5lVyGb7g1PPpKE0tKBTW5w5bgQ==
X-Google-Smtp-Source: AA6agR6cStCNNsa+U2EXzNpks0Z071z2RD/SJln63AZJsOezVgSlE5S5WcCDeNCK/XxqGOBfJDhs4RSMetdDlNSIpBY=
X-Received: by 2002:a05:6808:1489:b0:33a:861c:838e with SMTP id
 e9-20020a056808148900b0033a861c838emr895072oiw.228.1660120413972; Wed, 10 Aug
 2022 01:33:33 -0700 (PDT)
MIME-Version: 1.0
References: <20220701090240.1896131-1-dmitry.osipenko@collabora.com>
 <20220701090240.1896131-2-dmitry.osipenko@collabora.com>
 <a42237c9-6304-4b06-cede-2175c7e7b87d@amd.com>
 <YvKO5r5Sr56e9vBf@phenom.ffwll.local>
 <e760f555-7f2d-dea9-70b2-c0881adc3afc@amd.com>
In-Reply-To: <e760f555-7f2d-dea9-70b2-c0881adc3afc@amd.com>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Wed, 10 Aug 2022 10:33:22 +0200
Message-ID: <CAKMK7uEd1xX6P4YRgYOfjvqpwVmQ0YZPkHdK=4auwrkBE9CEzQ@mail.gmail.com>
Subject: Re: [PATCH v8 1/2] drm/gem: Properly annotate WW context on
 drm_gem_lock_reservations() error
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
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
Cc: dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@linux.ie>, Emil Velikov <emil.l.velikov@gmail.com>,
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas_os@shipmail.org>,
 linux-kernel@vger.kernel.org, Gurchetan Singh <gurchetansingh@chromium.org>,
 Gerd Hoffmann <kraxel@redhat.com>,
 Dmitry Osipenko <dmitry.osipenko@collabora.com>, linux-tegra@vger.kernel.org,
 Dmitry Osipenko <digetx@gmail.com>, kernel@collabora.com,
 virtualization@lists.linux-foundation.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 10 Aug 2022 at 08:52, Christian K=C3=B6nig <christian.koenig@amd.co=
m> wrote:
>
> Am 09.08.22 um 18:44 schrieb Daniel Vetter:
> > On Tue, Jul 05, 2022 at 01:33:51PM +0200, Christian K=C3=B6nig wrote:
> >> Am 01.07.22 um 11:02 schrieb Dmitry Osipenko:
> >>> Use ww_acquire_fini() in the error code paths. Otherwise lockdep
> >>> thinks that lock is held when lock's memory is freed after the
> >>> drm_gem_lock_reservations() error. The ww_acquire_context needs to be
> >>> annotated as "released", which fixes the noisy "WARNING: held lock fr=
eed!"
> >>> splat of VirtIO-GPU driver with CONFIG_DEBUG_MUTEXES=3Dy and enabled =
lockdep.
> >>>
> >>> Cc: stable@vger.kernel.org
> >>> Fixes: 7edc3e3b975b5 ("drm: Add helpers for locking an array of BO re=
servations.")
> >>> Reviewed-by: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>
> >>> Signed-off-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
> >> Reviewed-by: Christian K=C3=B6nig <christian.koenig@amd.com>
> > Also added this r-b tag when merging to drm-misc-next-fixes.
>
> IIRC I've already pushed this to drm-misc-fixes with a CC stable tag
> about 2 weeks ago.
>
> Please double check, it probably just hasn't come down the stream again y=
et.

Hm quickly check and I didn't spot it? There's a few patches from
Dmitry in the last few pulls, and some more stuff pending, but not
these two afaics?
-Daniel

>
> Christian.
>
> > -Daniel
> >
> >>> ---
> >>>    drivers/gpu/drm/drm_gem.c | 4 ++--
> >>>    1 file changed, 2 insertions(+), 2 deletions(-)
> >>>
> >>> diff --git a/drivers/gpu/drm/drm_gem.c b/drivers/gpu/drm/drm_gem.c
> >>> index eb0c2d041f13..86d670c71286 100644
> >>> --- a/drivers/gpu/drm/drm_gem.c
> >>> +++ b/drivers/gpu/drm/drm_gem.c
> >>> @@ -1226,7 +1226,7 @@ drm_gem_lock_reservations(struct drm_gem_object=
 **objs, int count,
> >>>             ret =3D dma_resv_lock_slow_interruptible(obj->resv,
> >>>                                                              acquire_=
ctx);
> >>>             if (ret) {
> >>> -                   ww_acquire_done(acquire_ctx);
> >>> +                   ww_acquire_fini(acquire_ctx);
> >>>                     return ret;
> >>>             }
> >>>     }
> >>> @@ -1251,7 +1251,7 @@ drm_gem_lock_reservations(struct drm_gem_object=
 **objs, int count,
> >>>                             goto retry;
> >>>                     }
> >>> -                   ww_acquire_done(acquire_ctx);
> >>> +                   ww_acquire_fini(acquire_ctx);
> >>>                     return ret;
> >>>             }
> >>>     }
>


--=20
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
