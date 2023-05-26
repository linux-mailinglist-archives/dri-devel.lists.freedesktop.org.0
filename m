Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 47A9B712ADA
	for <lists+dri-devel@lfdr.de>; Fri, 26 May 2023 18:40:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6BE5C10E812;
	Fri, 26 May 2023 16:40:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E817810E812
 for <dri-devel@lists.freedesktop.org>; Fri, 26 May 2023 16:40:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1685119247;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=w75dA4F6241A+HRi4qQsDvhEG9Ymk+yOcSdz/MwUoD0=;
 b=VN7dUFKMto3zJTxZfVaTeVBYTI4rkuOZ8k3OqXrXWZ3uH78kMExLXvAmrYlOILq1u7FZsc
 GvqwiTfIAMtyK0htRVcPpHZ4ZTjZMzRKBxdMv7lTIe22NYoFz7Q30tGLMI7gtOBNtocyb0
 gkvbAVcuy9DfSIsq/lnpZoO2uGDkFo8=
Received: from mail-lj1-f198.google.com (mail-lj1-f198.google.com
 [209.85.208.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-411-siKz10tFOnWQ47QCDjGEHQ-1; Fri, 26 May 2023 12:40:45 -0400
X-MC-Unique: siKz10tFOnWQ47QCDjGEHQ-1
Received: by mail-lj1-f198.google.com with SMTP id
 38308e7fff4ca-2af2cff231cso4111491fa.2
 for <dri-devel@lists.freedesktop.org>; Fri, 26 May 2023 09:40:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685119244; x=1687711244;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=w75dA4F6241A+HRi4qQsDvhEG9Ymk+yOcSdz/MwUoD0=;
 b=TDVhXDTXheZsQ9qY6kykYfDnX7WFpbJs6vi2AuYJHgqx/Jb82dr8GGspYi3WKU/dVJ
 3ll9FkXJFPtru/FfSdBFJUkqLqjSjB2+o7N/bgN77CuGxTHuWDm5SSpHDjOvhGbHA2WQ
 r2Tym3zC2Jg+h15ztYStcgiR4lmxGEXc+5M+x2rRdKKaCtHwc0cMRxEt6dCyaJQ6ivQe
 7BFzi9WWDMzsaqIRKQkrsAc5fIM6apNzdQp2JJ8Gg0Wn6HoJ7eCbfwmmxe0E6sm50osx
 g59HFHXuwpHq0GMHowFG4L838iDJQDatc00LfMQ4ZctdVrsjkOdS5bwYwESGfeCZKiGS
 qRSw==
X-Gm-Message-State: AC+VfDzG2sDu4NpJ+BLFqj12LZvL3ySQS72k1qR9MMa4QOHvn9bn0q2u
 6IIkhqklk4fsF+EHGVv6gCNuZhLyZX+Kw2v4u+q0PooKO86WfBEBIBQEV1kyBVVgG2zEwTsCEbx
 o7lRuPSLb2wfkGbJxeq7yl5I09RrTDv0rsyfyhuUdDBe/
X-Received: by 2002:a2e:9ec8:0:b0:2af:1817:26e1 with SMTP id
 h8-20020a2e9ec8000000b002af181726e1mr808652ljk.30.1685119244275; 
 Fri, 26 May 2023 09:40:44 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7jVUpzD1GyLxEFAk+PsM0QiyoZLcXZrV7pBvn/Z0+lnTqiys+uI/NveXsG/9zpq4xvnpLia5Fh83Oq5PO9iNo=
X-Received: by 2002:a2e:9ec8:0:b0:2af:1817:26e1 with SMTP id
 h8-20020a2e9ec8000000b002af181726e1mr808638ljk.30.1685119243974; Fri, 26 May
 2023 09:40:43 -0700 (PDT)
MIME-Version: 1.0
References: <20230525191809.3524-1-harry.wentland@amd.com>
 <20230525191809.3524-9-harry.wentland@amd.com>
In-Reply-To: <20230525191809.3524-9-harry.wentland@amd.com>
From: Sebastian Wick <sebastian.wick@redhat.com>
Date: Fri, 26 May 2023 18:40:32 +0200
Message-ID: <CA+hFU4w3yeXFNvxfFTRmzq25C5K5PMJZR_KJDT8W4wwvOaiXig@mail.gmail.com>
Subject: Re: [PATCH v4 08/13] drm/amd/display: Register Colorspace property
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
Cc: amd-gfx@lists.freedesktop.org, Melissa Wen <mwen@igalia.com>,
 Pekka Paalanen <ppaalanen@gmail.com>, dri-devel@lists.freedesktop.org,
 Joshua Ashton <joshua@froggi.es>, Vitaly.Prosyak@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, May 25, 2023 at 9:18=E2=80=AFPM Harry Wentland <harry.wentland@amd.=
com> wrote:
>
> We want compositors to be able to set the output
> colorspace on DP and HDMI outputs, based on the
> caps reported from the receiver via EDID.

This commit message seems wrong for multiple reasons. The Colorspace
property documentation explicitly says that user space has to check
the sink EDID for support:

> The expectation from userspace is that it should parse the EDID and get s=
upported colorspaces.

The code doesn't seem to care about EDID at all. Instead it exposes
the variants it knows how to support with e.g. the appropriate YCC
transform when necessary, independent of the sink support.

> Signed-off-by: Harry Wentland <harry.wentland@amd.com>
> Cc: Pekka Paalanen <ppaalanen@gmail.com>
> Cc: Sebastian Wick <sebastian.wick@redhat.com>
> Cc: Vitaly.Prosyak@amd.com
> Cc: Joshua Ashton <joshua@froggi.es>
> Cc: Simon Ser <contact@emersion.fr>
> Cc: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
> Cc: Melissa Wen <mwen@igalia.com>
> Cc: dri-devel@lists.freedesktop.org
> Cc: amd-gfx@lists.freedesktop.org
> ---
>  drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
>
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/=
gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> index ca093396d1ac..dc99a8ffac70 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> @@ -7238,6 +7238,12 @@ static int amdgpu_dm_connector_get_modes(struct dr=
m_connector *connector)
>         return amdgpu_dm_connector->num_modes;
>  }
>
> +static const u32 supported_colorspaces =3D
> +       BIT(DRM_MODE_COLORIMETRY_BT709_YCC) |
> +       BIT(DRM_MODE_COLORIMETRY_OPRGB) |
> +       BIT(DRM_MODE_COLORIMETRY_BT2020_RGB) |
> +       BIT(DRM_MODE_COLORIMETRY_BT2020_YCC);
> +
>  void amdgpu_dm_connector_init_helper(struct amdgpu_display_manager *dm,
>                                      struct amdgpu_dm_connector *aconnect=
or,
>                                      int connector_type,
> @@ -7318,6 +7324,15 @@ void amdgpu_dm_connector_init_helper(struct amdgpu=
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
> 2.40.1
>

