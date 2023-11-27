Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A5977FA5B2
	for <lists+dri-devel@lfdr.de>; Mon, 27 Nov 2023 17:08:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 21FEC10E1A2;
	Mon, 27 Nov 2023 16:08:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x1135.google.com (mail-yw1-x1135.google.com
 [IPv6:2607:f8b0:4864:20::1135])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1BB1710E3A1
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Nov 2023 16:08:53 +0000 (UTC)
Received: by mail-yw1-x1135.google.com with SMTP id
 00721157ae682-5cc66213a34so44022637b3.1
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Nov 2023 08:08:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1701101332; x=1701706132; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=D0s3YKSI0CCDl7Ip7+d2J2fh8HjXs5+Z5vnehpex76E=;
 b=sqUML/11EDwwTgc/KensHMOwTv+r/D4IRgjcDS/Xf7V4JItcjdXkKq40zg6a2M9FHP
 4MaSAaPxZSImRQgrSA96qwrSBFaf2fSRtwqSEpRD4qM5joebhY1QYggdIx/Bo2erp26O
 ArTfCtVlM/iIv1HR+E9Bh0zCa6dKMNaZdmtvLB6o6Xx8jDzWqTlT9YXvK/bPsPL0GzuB
 ihfYpW33FIAieexio+DvY8sJl3wB3vfMQsyLOOsa6G1tPhR1o8WTg3MuYSB+d3esPq/c
 fgSmKyJzMBbPuy5C6+rHI3x55B2sId23/jaeXs03dxURmb7VQsRGKhntGzPhP8rZKB2w
 2S/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701101332; x=1701706132;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=D0s3YKSI0CCDl7Ip7+d2J2fh8HjXs5+Z5vnehpex76E=;
 b=pdoqJMuTPK+Yqf9e0vw70O/EGGx49UUlCQqLzSI/saT4+Jmmh+QakASNgxM3jV6OAp
 Ow7SU6dYrdKvT8cMSepxhJFo8yyMqRIzQc26fujy1bQdXIfz+ptT7bvXraCVYzCw8ta8
 Hb9ZaJL0VYGCRxTOFse209eJcslRDqZNlY7r09QqlmxRkTBA7cvIQmi1De2e0RgYKWmn
 nLJllZsAvpcYAPJKrLGJ5m7Dz4eifXL6UFMUEudbBpApQ0BDflD4dpCj+l0IEAV7cAn4
 i7oS/q1IZ6bOgFeSsDw0GXCVzzv8C+CvUsLnxJV02mO7QXZQX/LIxiY9k7n9vIVl5JCL
 BtPQ==
X-Gm-Message-State: AOJu0Yz3Y2HrpJkOv2W1qNVY8lKeRJEpQzE4eJxRgz3WfzupG4pLKUkV
 mBUWAf5CLWwi53RsSAE9WWRXZCJALBI4ogICTaF5Ag==
X-Google-Smtp-Source: AGHT+IFzV7gAuBBlDiQ5hhcXqWBkE8td2GRohFvyvwsIY5ZRT0pwgUEhXPC3sHKmGhubSogJiQBVdEnyKAqOWo2j9kc=
X-Received: by 2002:a0d:d756:0:b0:5c1:8075:5a80 with SMTP id
 z83-20020a0dd756000000b005c180755a80mr7766008ywd.30.1701101331996; Mon, 27
 Nov 2023 08:08:51 -0800 (PST)
MIME-Version: 1.0
References: <20231123032615.3760488-1-victor.liu@nxp.com>
 <ZWSbKkgs8V4sdy8T@intel.com>
In-Reply-To: <ZWSbKkgs8V4sdy8T@intel.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 27 Nov 2023 17:08:40 +0100
Message-ID: <CACRpkdZG+8KPWGNcp1jGXnSodXqS0qXiwXDPqf1yqoDZw1aS8w@mail.gmail.com>
Subject: Re: [PATCH] drm/bridge: panel: Check device dependency before
 managing device link
To: =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
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
Cc: neil.armstrong@linaro.org, ulf.hansson@linaro.org, jernej.skrabec@gmail.com,
 rfoss@kernel.org, andrzej.hajda@intel.com, jonas@kwiboo.se,
 Liu Ying <victor.liu@nxp.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, mripard@kernel.org, tzimmermann@suse.de,
 angelogioacchino.delregno@collabora.com, Laurent.pinchart@ideasonboard.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Nov 27, 2023 at 2:36=E2=80=AFPM Ville Syrj=C3=A4l=C3=A4
<ville.syrjala@linux.intel.com> wrote:

> > +     panel_bridge->is_independent =3D !device_is_dependent(drm_dev->de=
v,
> > +                                                         panel->dev);
>
> This broke the build. Looks like device_is_dependent() is not even export=
ed.
> ERROR: modpost: "device_is_dependent" [drivers/gpu/drm/drm_kms_helper.ko]=
 undefined!

Yep Ying made a fix, I just applied and pushed it because it was obviously
correct.

> The recommended defconfigs in rerere-cache do seem to have CONFIG_DRM_KMS=
_HELPER=3Dm
> so this should have been caught before pushing. How did it slip through?

My neglect.

Neglect may have something to do with my desktop being 10 years+
old. Building random defconfigs on this machine takes so long time
that invariably other stuff has been pushed to the branch before
the compiles even complete.

Yeah I know. I should buy a better computer.

Yours,
Linus Walleij
