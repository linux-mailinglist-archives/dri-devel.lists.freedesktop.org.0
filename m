Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 26E6286BCB4
	for <lists+dri-devel@lfdr.de>; Thu, 29 Feb 2024 01:21:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 612E710E0DD;
	Thu, 29 Feb 2024 00:21:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="WcpJb+Z+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com
 [209.85.208.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B42910E0DD
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Feb 2024 00:21:30 +0000 (UTC)
Received: by mail-ed1-f44.google.com with SMTP id
 4fb4d7f45d1cf-5661b7b1f51so601143a12.2
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Feb 2024 16:21:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1709166088; x=1709770888;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2HVmQOCE5dsZxHVlTQMXFLciN4XwV4vxvdF0QHFS3GY=;
 b=WcpJb+Z+czPfpqAbqYJcflkH7Cd5C6D4zyrDEq88gX/Ve23lvLLZZgSvEh2317BES7
 z8imjYWNxpW3EA6R237xtaYwTHUf+PJ6VM4YkWFBM7tA2PirsH7Jh2tp0tm8NnycRAWC
 zCE/mZrmTcWst5/mttU0ttKLAv4FNuH5SHX0o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709166088; x=1709770888;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=2HVmQOCE5dsZxHVlTQMXFLciN4XwV4vxvdF0QHFS3GY=;
 b=f9cIjtKRG9tDbNLNqzOgjMCQsKwGEgXGFsFPLvtTMUDjDjkk1+8ZUSO+Y6Jd0Xpnpy
 hqW3PzPPj49Cu17CL5E6WwCym3CqiNVHnIGwOD8qePkMvW+7GU3XrPFMKwNnkI74OY/y
 jg2/wbfFCP6R530ukRLkeQau8+SCsVVqDOk8tB56Eb6r2pRdms0EmNn7T05W+HkBo1V0
 FNhm9dgNZ60piKBBmtQZcDA+Ts8mDil85kwij1tjEKugfwenbQ3EEfW5qQLZSYSa9DYB
 UU7lKlAeK02gk9KxJCxcvrLqA0Tp+qLjsweJoHg2lHUB4QLpkBGuupGDLyYhC9NTFXhj
 WPvQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVjEz4Kn2kZWji3blOAPYpWeWYCJDK02UO9QPJy2sQuRi335RPa5u2AKEs1hJVmk1wjKsmAwy051ZBps2cltESzYVjEYeL8jU95VsWRMcNZ
X-Gm-Message-State: AOJu0YwDTmifaAgMluw8gPjAh5WazNjRu/nhVHk8ieQfF3/veukvrHMb
 KV0ozQyW9t0QU8sQT0ZCKgqitHffBWURF3jOulTZl+TnQ/C8oS24jVr94rfm7HEIwbez/AtGm3s
 IhJX6
X-Google-Smtp-Source: AGHT+IEUtNQbLMgOzJPkc9EwFdB5FWZ6xbVAFEcvJ6H0VzywJkRR0LuTxcNOCQwbKVOwyBKDajrN6Q==
X-Received: by 2002:a05:6402:2153:b0:565:9fa4:dd59 with SMTP id
 bq19-20020a056402215300b005659fa4dd59mr334775edb.5.1709166088427; 
 Wed, 28 Feb 2024 16:21:28 -0800 (PST)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com.
 [209.85.128.53]) by smtp.gmail.com with ESMTPSA id
 m18-20020aa7c492000000b005662d3418dfsm58383edq.74.2024.02.28.16.21.23
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 28 Feb 2024 16:21:28 -0800 (PST)
Received: by mail-wm1-f53.google.com with SMTP id
 5b1f17b1804b1-4129a5f7b54so15455e9.1
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Feb 2024 16:21:23 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCWQeQPIfME303+zBbWBzSlHdoKqxeyTK+BJF4kkj8yUQ0vBpxuoGE7tZ3zJLvdLN5PB6aIBvUigHMYaFDPgq5usepNHYM0eBw+Uh2LrnVNg
X-Received: by 2002:a05:600c:34c7:b0:412:acde:4839 with SMTP id
 d7-20020a05600c34c700b00412acde4839mr1564wmq.3.1709166083091; Wed, 28 Feb
 2024 16:21:23 -0800 (PST)
MIME-Version: 1.0
References: <20240228011133.1238439-1-hsinyi@chromium.org>
 <20240228011133.1238439-2-hsinyi@chromium.org>
In-Reply-To: <20240228011133.1238439-2-hsinyi@chromium.org>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 28 Feb 2024 16:21:11 -0800
X-Gmail-Original-Message-ID: <CAD=FV=XCGCpLmCQhfTXfrOON99KLbR5pR59jaiD_V14szn6qsA@mail.gmail.com>
Message-ID: <CAD=FV=XCGCpLmCQhfTXfrOON99KLbR5pR59jaiD_V14szn6qsA@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] drm_edid: Support getting EDID through ddc without
 connector
To: Hsin-Yi Wang <hsinyi@chromium.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Sam Ravnborg <sam@ravnborg.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
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

Hi,

On Tue, Feb 27, 2024 at 5:11=E2=80=AFPM Hsin-Yi Wang <hsinyi@chromium.org> =
wrote:
>
> Some panels are interested in the EDID during early probe when connector
> is still unknown.
>
> Add a function drm_get_edid_no_connector() to get edid without connector.
> No functional change for existing usage.
>
> Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
> ---
> v1->v2:
> add a function to return the entire edid without updating connector.
> ---
>  drivers/gpu/drm/drm_edid.c | 45 ++++++++++++++++++++++++++++----------
>  include/drm/drm_edid.h     |  1 +
>  2 files changed, 34 insertions(+), 12 deletions(-)

I'll respond in the discussion in v1 too, but overall I'm not a fan of
reading the whole EDID twice at bootup. Personally I'd love to see us
to back to just reading the base block like in v1, but I guess we can
see what Jani and others say.


> @@ -2385,18 +2385,20 @@ static struct edid *_drm_do_get_edid(struct drm_c=
onnector *connector,
>         if (status =3D=3D EDID_BLOCK_READ_FAIL)
>                 goto fail;
>
> -       /* FIXME: Clarify what a corrupt EDID actually means. */
> -       if (status =3D=3D EDID_BLOCK_OK || status =3D=3D EDID_BLOCK_VERSI=
ON)
> -               connector->edid_corrupt =3D false;
> -       else
> -               connector->edid_corrupt =3D true;
> +       if (connector) {
> +               /* FIXME: Clarify what a corrupt EDID actually means. */
> +               if (status =3D=3D EDID_BLOCK_OK || status =3D=3D EDID_BLO=
CK_VERSION)
> +                       connector->edid_corrupt =3D false;
> +               else
> +                       connector->edid_corrupt =3D true;
>
> -       if (!edid_block_status_valid(status, edid_block_tag(edid))) {
> -               if (status =3D=3D EDID_BLOCK_ZERO)
> -                       connector->null_edid_counter++;
> +               if (!edid_block_status_valid(status, edid_block_tag(edid)=
)) {
> +                       if (status =3D=3D EDID_BLOCK_ZERO)
> +                               connector->null_edid_counter++;
>
> -               connector_bad_edid(connector, edid, 1);
> -               goto fail;
> +                       connector_bad_edid(connector, edid, 1);
> +                       goto fail;

This "goto fail" is now only run "if (connector)" which means that
you're not properly checking if the EDID is valid when "connector =3D=3D
NULL", right? That seems like a bug unless I missed something...
