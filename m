Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 81A3D6F0881
	for <lists+dri-devel@lfdr.de>; Thu, 27 Apr 2023 17:39:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D7CBF10E2FA;
	Thu, 27 Apr 2023 15:39:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [IPv6:2a00:1450:4864:20::633])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D29810E2FA
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Apr 2023 15:39:02 +0000 (UTC)
Received: by mail-ej1-x633.google.com with SMTP id
 a640c23a62f3a-94f6c285d92so1652546466b.3
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Apr 2023 08:39:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1682609940; x=1685201940;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=EOPDPkAjGzQYhj/N9AfC0/FiIQg/4kHF1MpXLBODbrU=;
 b=X9t2jGz30JwLt/PazaQEWGLfYPZkIF37KQmCx2z4Hm2ob+W5fnI+K2LrOlzdHrNULt
 bGWGO/s3s71/qqPo2O/YAO4nhDpB0IKCMACtUpkzpNpp+h2Zqf9N4t+bmYrABAQnyy9y
 IJY9QPMePcXwTXWpAAw4AtFgo4IyvlnGsUnbA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682609940; x=1685201940;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=EOPDPkAjGzQYhj/N9AfC0/FiIQg/4kHF1MpXLBODbrU=;
 b=cGG4iPxc9c1cIM6hAzxrKfVhM1NixyhwvfXjTZpnL3xE7+7pjDfMZMHUZDkqPtLkXW
 OncsKd59YQwuyJuQWw1EVRMaaHdQs/jKAWAUPcQ/iv/DynEC3s2z8QQra3GglE3jSVV+
 Bt18Ud8NpDbpXW10ZKewR+iHxco7jCDPOf/gIlfoNlr89O2nE58tHjxlYeFtWLKCZ1oG
 tw35yI514+L3i0VOcUHDRNDsBUF9E+VUwhze14qUtuIVZQeaNB+557LQIAp2KNkaqqIo
 iilSdsUvbABsnK0dcSgxG4X8StE1GczT9NsmNIxaK5K+trBS37ueIEETbUH7aBOgyxOe
 XHqQ==
X-Gm-Message-State: AC+VfDye+JIC+FCivYKfGczXP6jlPXIze+1atVQZKV958AZulpqfH8ub
 w9sKard8fiMX/gQFJ5Klbgi7LRMVy4LD4oAip0tX6g==
X-Google-Smtp-Source: ACHHUZ75fyQS2us799wFSgpQ60UyXEh77QAXXkqadjqvav6g00rxd7oVOyDkdGsWAnIw7yivR/zgDw==
X-Received: by 2002:a17:907:d1d:b0:8ae:11ca:81de with SMTP id
 gn29-20020a1709070d1d00b008ae11ca81demr2394518ejc.34.1682609939732; 
 Thu, 27 Apr 2023 08:38:59 -0700 (PDT)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com.
 [209.85.128.43]) by smtp.gmail.com with ESMTPSA id
 pv4-20020a170907208400b0094f49f58019sm9765238ejb.27.2023.04.27.08.38.57
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 Apr 2023 08:38:58 -0700 (PDT)
Received: by mail-wm1-f43.google.com with SMTP id
 5b1f17b1804b1-3f19afc4f60so41225755e9.1
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Apr 2023 08:38:57 -0700 (PDT)
X-Received: by 2002:a1c:7211:0:b0:3f1:830a:a345 with SMTP id
 n17-20020a1c7211000000b003f1830aa345mr1817435wmc.11.1682609936875; Thu, 27
 Apr 2023 08:38:56 -0700 (PDT)
MIME-Version: 1.0
References: <20230421162749.360777-1-markyacoub@google.com>
 <20230421162749.360777-2-markyacoub@google.com>
 <ZEpHfxw5IhzGFStV@phenom.ffwll.local>
In-Reply-To: <ZEpHfxw5IhzGFStV@phenom.ffwll.local>
From: Sean Paul <seanpaul@chromium.org>
Date: Thu, 27 Apr 2023 11:38:07 -0400
X-Gmail-Original-Message-ID: <CAOw6vbKi5XRnBvAR1P+=pFYL7FUo3m=4xbHjBOEDU1BOoEowzQ@mail.gmail.com>
Message-ID: <CAOw6vbKi5XRnBvAR1P+=pFYL7FUo3m=4xbHjBOEDU1BOoEowzQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] drm: Create support for Write-Only property blob
To: Mark Yacoub <markyacoub@chromium.org>, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 seanpaul@chromium.org, 
 dianders@chromium.org, dmitry.baryshkov@linaro.org, 
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

On Thu, Apr 27, 2023 at 5:59=E2=80=AFAM Daniel Vetter <daniel@ffwll.ch> wro=
te:
>
> On Fri, Apr 21, 2023 at 12:27:47PM -0400, Mark Yacoub wrote:
> > From: Mark Yacoub <markyacoub@chromium.org>
> >
> > [Why]
> > User space might need to inject data into the kernel without allowing i=
t
> > to be read again by any user space.
> > An example of where this is particularly useful is secret keys fetched
> > by user space and injected into the kernel to enable content protection=
.
> >
> > [How]
> > Create a DRM_MODE_CREATE_BLOB_WRITE_ONLY flag used by user space to
> > create a blob and mark the blob as write only.
> > On reading back the blob, data will be not be copied if it's a write
> > only blob
>
> This makes no sense at all, why would you want to disallow reading?
> Userspace already knows the key, there's not much point in hiding it from
> userspace?

There are varying levels of trust amongst userspace applications. For
example, in CrOS we trust portions of Chrome to handle the key
securely, but would like to avoid access from other portions, or users
from exposing the key via modetest output. We could play whack-a-mole
and try to patch up all untrusted userspace, but that doesn't seem
like a scalable solution.

Sean

>
> Also for new uapi we need the igt patches and userspace, please link
> those.
> -Daniel
>
> >
> > Signed-off-by: Mark Yacoub <markyacoub@chromium.org>
> > ---
> >  drivers/gpu/drm/drm_property.c | 3 ++-
> >  include/drm/drm_property.h     | 2 ++
> >  include/uapi/drm/drm_mode.h    | 6 ++++++
> >  3 files changed, 10 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/drm_property.c b/drivers/gpu/drm/drm_prope=
rty.c
> > index dfec479830e49..afedf7109d002 100644
> > --- a/drivers/gpu/drm/drm_property.c
> > +++ b/drivers/gpu/drm/drm_property.c
> > @@ -765,7 +765,7 @@ int drm_mode_getblob_ioctl(struct drm_device *dev,
> >       if (!blob)
> >               return -ENOENT;
> >
> > -     if (out_resp->length =3D=3D blob->length) {
> > +     if (out_resp->length =3D=3D blob->length && !blob->is_write_only)=
 {
> >               if (copy_to_user(u64_to_user_ptr(out_resp->data),
> >                                blob->data,
> >                                blob->length)) {
> > @@ -800,6 +800,7 @@ int drm_mode_createblob_ioctl(struct drm_device *de=
v,
> >               ret =3D -EFAULT;
> >               goto out_blob;
> >       }
> > +     blob->is_write_only =3D out_resp->flags & DRM_MODE_CREATE_BLOB_WR=
ITE_ONLY;
> >
> >       /* Dropping the lock between create_blob and our access here is s=
afe
> >        * as only the same file_priv can remove the blob; at this point,=
 it is
> > diff --git a/include/drm/drm_property.h b/include/drm/drm_property.h
> > index 65bc9710a4702..700782f021b99 100644
> > --- a/include/drm/drm_property.h
> > +++ b/include/drm/drm_property.h
> > @@ -205,6 +205,7 @@ struct drm_property {
> >   *   &drm_mode_config.property_blob_list.
> >   * @head_file: entry on the per-file blob list in &drm_file.blobs list=
.
> >   * @length: size of the blob in bytes, invariant over the lifetime of =
the object
> > + * @is_write_only: user space can't read the blob data.
> >   * @data: actual data, embedded at the end of this structure
> >   *
> >   * Blobs are used to store bigger values than what fits directly into =
the 64
> > @@ -219,6 +220,7 @@ struct drm_property_blob {
> >       struct list_head head_global;
> >       struct list_head head_file;
> >       size_t length;
> > +     bool is_write_only;
> >       void *data;
> >  };
> >
> > diff --git a/include/uapi/drm/drm_mode.h b/include/uapi/drm/drm_mode.h
> > index 46becedf5b2fc..10403c9a73082 100644
> > --- a/include/uapi/drm/drm_mode.h
> > +++ b/include/uapi/drm/drm_mode.h
> > @@ -1168,6 +1168,9 @@ struct drm_format_modifier {
> >       __u64 modifier;
> >  };
> >
> > +#define DRM_MODE_CREATE_BLOB_WRITE_ONLY                               =
         \
> > +     (1 << 0) /* data of the blob can't be read by user space */
> > +
> >  /**
> >   * struct drm_mode_create_blob - Create New blob property
> >   *
> > @@ -1181,6 +1184,9 @@ struct drm_mode_create_blob {
> >       __u32 length;
> >       /** @blob_id: Return: new property ID. */
> >       __u32 blob_id;
> > +     /** Flags for special handling. */
> > +     __u32 flags;
> > +     __u32 pad;
> >  };
> >
> >  /**
> > --
> > 2.40.0.634.g4ca3ef3211-goog
> >
>
> --
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch
