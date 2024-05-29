Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C60D8D37AF
	for <lists+dri-devel@lfdr.de>; Wed, 29 May 2024 15:33:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3526C10E6B0;
	Wed, 29 May 2024 13:33:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Rd++q3eQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com
 [209.85.210.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 55EEB10E88E;
 Wed, 29 May 2024 13:33:43 +0000 (UTC)
Received: by mail-pf1-f181.google.com with SMTP id
 d2e1a72fcca58-6f8ea3e9543so1563076b3a.2; 
 Wed, 29 May 2024 06:33:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1716989623; x=1717594423; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=G7ILJRHnZgMzPyXPFW/iuFELnWd2RBDR56tTLeE9Yro=;
 b=Rd++q3eQB/MzaN1n8+CrPB/7AQk4aImGvEaAPOW8c96v+vNezWnrU7od4dU20C4iuV
 21Ec10Z9jPyO+ytYQKHOxRg+2uKGajhzbLV/Wagk26h2BKURI6WBVna7d4QH2fmvNCCy
 AE0ybuu1LhgpyTg3rGQfgxTUV6jyxz43V+PeI1MgbAseikI8e5BpCuS4FUYOdVD/AVC+
 O/rDQlxX9eppbCqDCEXEr2WJ8KHB6LnL4fMG5aiMwGAoM4h1gS4irVaPl6KESjyBsU4f
 IBgv8e47+D01KjHkuj3KQ6Pl6eQlrjjYJGBUJCmqGxYUGCvUUGbvPTUtSZErtimDxbPw
 NWiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716989623; x=1717594423;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=G7ILJRHnZgMzPyXPFW/iuFELnWd2RBDR56tTLeE9Yro=;
 b=DKnhCSp2ritg+4oklvvIOyxkaYEw4X1A2u9jCi7VjkDfGJ3AbRKIGLWk0Jia10GVuI
 yK/gVgiwjb3XthcFKtDUEU8rzHPLXX8EQILpVtCReR7KGSjLKcX6szhbHtXgA/k6/q6d
 8Fae4/VR4ebeqmeh4BfbE9hPF7cXtnEWJwVvwjt8gEwe0JsZnOD1HaZjY6qAeJtwwzcg
 F0dLPHztFncPKOnCHZHa5CvbrfhcA+tqwNK6UZbYGH7KZgy3rhlc0Q8PT+/zLXbxTzNz
 H2rCSSHuYqkmNyfW/EGNluR6XntuxIyz+0p0inNE9XNOzptJmemTQPH2pbNVPHMg5lHi
 inKA==
X-Forwarded-Encrypted: i=1;
 AJvYcCV54HPndyKHrB8RI7CjWBkaJ4uPmRu5J3hhQndvVNNRHniBcsJzooTRFg3UI+NMoM76SbM/9s3rKSJW27RZ4CO8CNzjDGwWz6cb8HaFDg==
X-Gm-Message-State: AOJu0YzYf6IbBOb7n4TZYYSPoeMiX8HJsQDjkim6x8XepB/meut4cUmH
 G4I6zDqbFMZSWq7FSdIQ4k4Eb13leiCHvTfpDZ2dHdCJG70TkG4VjJk7Wr7mL1GB3rJ63RGCUYo
 xPTa1O3LrFvZAftdUPQnxMJ7dEhc=
X-Google-Smtp-Source: AGHT+IFouSqDbAzwBwM150OLwdPpTSB7m1v7Y6wLzV8Q4/OAKVxtUZrrKGrd7wE1YwGWYAvClEiQIVSFK8A+NznddFk=
X-Received: by 2002:a17:902:e5c5:b0:1f4:b43f:9c01 with SMTP id
 d9443c01a7336-1f4b43f9d2bmr86352715ad.64.1716989622493; Wed, 29 May 2024
 06:33:42 -0700 (PDT)
MIME-Version: 1.0
References: <20240528210319.1242-1-mario.limonciello@amd.com>
In-Reply-To: <20240528210319.1242-1-mario.limonciello@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Wed, 29 May 2024 09:33:31 -0400
Message-ID: <CADnq5_OzPT1MVnsqXs2vjr1L2_6jeM6x7jgs4ZtYpNzdDHM6uA@mail.gmail.com>
Subject: Re: [PATCH v2] drm/client: Detect when ACPI lid is closed during
 initialization
To: Mario Limonciello <mario.limonciello@amd.com>
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, 
 linux-kernel@vger.kernel.org, Chris Bainbridge <chris.bainbridge@gmail.com>, 
 hughsient@gmail.com
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

On Tue, May 28, 2024 at 5:03=E2=80=AFPM Mario Limonciello
<mario.limonciello@amd.com> wrote:
>
> If the lid on a laptop is closed when eDP connectors are populated
> then it remains enabled when the initial framebuffer configuration
> is built.
>
> When creating the initial framebuffer configuration detect the ACPI
> lid status and if it's closed disable any eDP connectors.
>
> Reported-by: Chris Bainbridge <chris.bainbridge@gmail.com>
> Closes: https://gitlab.freedesktop.org/drm/amd/-/issues/3349
> Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>

Reviewed-by: Alex Deucher <alexander.deucher@amd.com>

Do you have drm-misc access or do you need someone to apply this for you?

Alex

> ---
> Cc: hughsient@gmail.com
> v1->v2:
>  * Match LVDS as well
> ---
>  drivers/gpu/drm/drm_client_modeset.c | 30 ++++++++++++++++++++++++++++
>  1 file changed, 30 insertions(+)
>
> diff --git a/drivers/gpu/drm/drm_client_modeset.c b/drivers/gpu/drm/drm_c=
lient_modeset.c
> index 31af5cf37a09..0b0411086e76 100644
> --- a/drivers/gpu/drm/drm_client_modeset.c
> +++ b/drivers/gpu/drm/drm_client_modeset.c
> @@ -8,6 +8,7 @@
>   */
>
>  #include "drm/drm_modeset_lock.h"
> +#include <acpi/button.h>
>  #include <linux/module.h>
>  #include <linux/mutex.h>
>  #include <linux/slab.h>
> @@ -257,6 +258,34 @@ static void drm_client_connectors_enabled(struct drm=
_connector **connectors,
>                 enabled[i] =3D drm_connector_enabled(connectors[i], false=
);
>  }
>
> +static void drm_client_match_edp_lid(struct drm_device *dev,
> +                                    struct drm_connector **connectors,
> +                                    unsigned int connector_count,
> +                                    bool *enabled)
> +{
> +       int i;
> +
> +       for (i =3D 0; i < connector_count; i++) {
> +               struct drm_connector *connector =3D connectors[i];
> +
> +               switch (connector->connector_type) {
> +               case DRM_MODE_CONNECTOR_LVDS:
> +               case DRM_MODE_CONNECTOR_eDP:
> +                       if (!enabled[i])
> +                               continue;
> +                       break;
> +               default:
> +                       continue;
> +               }
> +
> +               if (!acpi_lid_open()) {
> +                       drm_dbg_kms(dev, "[CONNECTOR:%d:%s] lid is closed=
, disabling\n",
> +                                   connector->base.id, connector->name);
> +                       enabled[i] =3D false;
> +               }
> +       }
> +}
> +
>  static bool drm_client_target_cloned(struct drm_device *dev,
>                                      struct drm_connector **connectors,
>                                      unsigned int connector_count,
> @@ -844,6 +873,7 @@ int drm_client_modeset_probe(struct drm_client_dev *c=
lient, unsigned int width,
>                 memset(crtcs, 0, connector_count * sizeof(*crtcs));
>                 memset(offsets, 0, connector_count * sizeof(*offsets));
>
> +               drm_client_match_edp_lid(dev, connectors, connector_count=
, enabled);
>                 if (!drm_client_target_cloned(dev, connectors, connector_=
count, modes,
>                                               offsets, enabled, width, he=
ight) &&
>                     !drm_client_target_preferred(dev, connectors, connect=
or_count, modes,
> --
> 2.43.0
>
