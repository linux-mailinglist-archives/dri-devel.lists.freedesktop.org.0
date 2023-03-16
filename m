Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 67A1E6BC2E2
	for <lists+dri-devel@lfdr.de>; Thu, 16 Mar 2023 01:37:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 21B8410E06C;
	Thu, 16 Mar 2023 00:37:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C726F10E06C
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Mar 2023 00:37:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678927058;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5ZGtUmmSwegvnSpt+LkTwc0U1bNplB2nqM1fOGP4KKw=;
 b=FT5D1JS+KzYDn4hDWHjeQ2GPQ4dXgrZ+s9M0q0EzxxLTFsZASibWd4/Bu5GBY8ffTtN4jl
 Pv5p5YmmItLWMIC+kkAISfmhymDoshSHoN5qg+Eo5NV/Kog3A58Sm+pi9+nKTe/06nl9JG
 A+ND6xAqm+xRgt6L1N+50O7TYxwVcQQ=
Received: from mail-lf1-f70.google.com (mail-lf1-f70.google.com
 [209.85.167.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-395-YsyxeeDaNeuHt0azCFNdRQ-1; Wed, 15 Mar 2023 20:37:37 -0400
X-MC-Unique: YsyxeeDaNeuHt0azCFNdRQ-1
Received: by mail-lf1-f70.google.com with SMTP id
 k7-20020ac257c7000000b004db20d1cf7fso87485lfo.18
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Mar 2023 17:37:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678927056;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5ZGtUmmSwegvnSpt+LkTwc0U1bNplB2nqM1fOGP4KKw=;
 b=4Rk1WHOrv9jtGq7iMPwMwBvHLbZc56oUpNtMUMU6JesgVwlAHwNGIoIA8s1L811eGg
 xe8RhDl79M08u8fQrxFKqw8q++UrQVORsbzT/b90SZ2yXQst5T0f7vfwYEhlk1U/e98A
 BfLOMs0GV4CNyLHwGbwYXE208ag0pO0mkoiSNoF2BQalaLdwi3El/rh6lCESKCqMLbmt
 oCA7fbW0bjfvFtKlVpiNyC+DFcrTSAg1lzeXXvQeHLTTwRnKJMaR9hyZWD+WL4uOoFUj
 7zkyfiOmyZNYtLr3EHMdtvkOipH3e+ds36t1CBqBAGDoZllL3H/D4T+oOOBZQ4zW3bk0
 BEUQ==
X-Gm-Message-State: AO0yUKWXkymMQVdAeV7pEH3CpXSvnnCVQf7tj5E0nPlHIkUEuEj/aZQt
 qK6OHF3CbU4l3HHa+l5LwAGPq0BQJIUsaxGXuLnfsNkGGZpwdHyMCRuCNE8gvFy4X8AVjl2Parx
 gg/GahLSrKyeqf3j1HZOUfjcXxdUAVnKrcFcz9bk4xH55
X-Received: by 2002:a2e:9b8a:0:b0:298:b337:c127 with SMTP id
 z10-20020a2e9b8a000000b00298b337c127mr929187lji.1.1678927056160; 
 Wed, 15 Mar 2023 17:37:36 -0700 (PDT)
X-Google-Smtp-Source: AK7set9ob8956XPzyOyB9AnsVyodoU7LE5U4DSy09na/EyTxhZ/WZvNgxE6Poz/JzPCkEBmm9TDvSSN1gIrUga69EVg=
X-Received: by 2002:a2e:9b8a:0:b0:298:b337:c127 with SMTP id
 z10-20020a2e9b8a000000b00298b337c127mr929184lji.1.1678927055861; Wed, 15 Mar
 2023 17:37:35 -0700 (PDT)
MIME-Version: 1.0
References: <20230307151107.49649-1-harry.wentland@amd.com>
 <20230307151107.49649-10-harry.wentland@amd.com>
In-Reply-To: <20230307151107.49649-10-harry.wentland@amd.com>
From: Sebastian Wick <sebastian.wick@redhat.com>
Date: Thu, 16 Mar 2023 01:37:24 +0100
Message-ID: <CA+hFU4yiniJdxWOxDKnD7bTGw3QA8uSLyG5sbeiQ5oWqitTZcQ@mail.gmail.com>
Subject: Re: [PATCH v3 09/17] drm/amd/display: Register Colorspace property
 for DP and HDMI
To: Harry Wentland <harry.wentland@amd.com>
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
Cc: Joshua Ashton <joshua@froggi.es>, Pekka Paalanen <ppaalanen@gmail.com>,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 Vitaly.Prosyak@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Mar 7, 2023 at 4:12=E2=80=AFPM Harry Wentland <harry.wentland@amd.c=
om> wrote:
>
> We want compositors to be able to set the output
> colorspace on DP and HDMI outputs, based on the
> caps reported from the receiver via EDID.

About that... The documentation says that user space has to check the
EDID for what the sink actually supports. So whatever is in
supported_colorspaces is just what the driver/hardware is able to set
but doesn't actually indicate that the sink supports it.

So the only way to enable bt2020 is by checking if the sink supports
both RGB and YUV variants because both could be used by the driver.
Not great at all. Something to remember for the new property.

> Signed-off-by: Harry Wentland <harry.wentland@amd.com>
> Cc: Pekka Paalanen <ppaalanen@gmail.com>
> Cc: Sebastian Wick <sebastian.wick@redhat.com>
> Cc: Vitaly.Prosyak@amd.com
> Cc: Joshua Ashton <joshua@froggi.es>
> Cc: dri-devel@lists.freedesktop.org
> Cc: amd-gfx@lists.freedesktop.org
> Reviewed-By: Joshua Ashton <joshua@froggi.es>
> ---
>  drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
>
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/=
gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> index f91b2ea13d96..2d883c6dae90 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> @@ -7184,6 +7184,12 @@ static int amdgpu_dm_connector_get_modes(struct dr=
m_connector *connector)
>         return amdgpu_dm_connector->num_modes;
>  }
>
> +static const u32 supported_colorspaces =3D
> +       BIT(DRM_MODE_COLORIMETRY_BT709_YCC) |
> +       BIT(DRM_MODE_COLORIMETRY_OPRGB) |
> +       BIT(DRM_MODE_COLORIMETRY_BT2020) |
> +       BIT(DRM_MODE_COLORIMETRY_BT2020_DEPRECATED);
> +
>  void amdgpu_dm_connector_init_helper(struct amdgpu_display_manager *dm,
>                                      struct amdgpu_dm_connector *aconnect=
or,
>                                      int connector_type,
> @@ -7264,6 +7270,15 @@ void amdgpu_dm_connector_init_helper(struct amdgpu=
_display_manager *dm,
>                                 adev->mode_info.abm_level_property, 0);
>         }
>
> +       if (connector_type =3D=3D DRM_MODE_CONNECTOR_HDMIA) {
> +               if (!drm_mode_create_hdmi_colorspace_property(&aconnector=
->base, supported_colorspaces))
> +                       drm_connector_attach_colorspace_property(&aconnec=
tor->base);
> +       } else if (connector_type =3D=3D DRM_MODE_CONNECTOR_DisplayPort |=
|
> +                  connector_type =3D=3D DRM_MODE_CONNECTOR_eDP) {
> +               if (!drm_mode_create_dp_colorspace_property(&aconnector->=
base, supported_colorspaces))
> +                       drm_connector_attach_colorspace_property(&aconnec=
tor->base);
> +       }
> +
>         if (connector_type =3D=3D DRM_MODE_CONNECTOR_HDMIA ||
>             connector_type =3D=3D DRM_MODE_CONNECTOR_DisplayPort ||
>             connector_type =3D=3D DRM_MODE_CONNECTOR_eDP) {
> --
> 2.39.2
>

