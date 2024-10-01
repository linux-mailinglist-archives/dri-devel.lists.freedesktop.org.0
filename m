Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BD97D98C7A4
	for <lists+dri-devel@lfdr.de>; Tue,  1 Oct 2024 23:32:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF40B10E1AD;
	Tue,  1 Oct 2024 21:32:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="IP4JrUYP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com
 [209.85.167.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC18D10E1AD
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Oct 2024 21:31:59 +0000 (UTC)
Received: by mail-lf1-f48.google.com with SMTP id
 2adb3069b0e04-5399675e14cso3271275e87.3
 for <dri-devel@lists.freedesktop.org>; Tue, 01 Oct 2024 14:31:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1727818315; x=1728423115;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3oeKUFf/wvhOU5GpriVxkpEr3FfSq8JD4qSx8kz40jA=;
 b=IP4JrUYPBjHwcIYJW4d+pQO6B7ZAmAIbZvw0IPJzqxGgwKZpUXsUQJdFZkXyTt7cWf
 q60v9cgvtl7wTHJz//7vi6JnxDsznuZF6MNajbusnVp4HH7fbY8V+xrfE1Yjw9LWRmKf
 2ytfJEFJQ3+/u0Q1SAPILlrX6pP1V0qAmKB2s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727818315; x=1728423115;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3oeKUFf/wvhOU5GpriVxkpEr3FfSq8JD4qSx8kz40jA=;
 b=OvLaMOjh1H/C8XhVU99Qah3nQBm8xY6MkiuzX8HZLEfT1Z2nP20BWSXEkOKvlJirQS
 Xeq3GpxhF+FQuWaYo4pB84oHoI+G+QVi3EbPJFXvtlfDFxVUFexyabumFFGZO0OxUDLa
 KoYmheI0UMQnQl9pFEiOX860H5EF3yUlNep2VXF3DT6cEbdQ248mDVvBxPewuil2uBRE
 4gCHoRwmfeDqeAYDzrYnXXsorN+47XKaabPougxJ0Yd4rIeGLQRU/MBdBC34vR1IiZbF
 NfFh4WBgIX4cuqgcYcfgKqZcfMwgcmqKzlWq/LarATVoeusCIfJCi6F0X3hWlObv9YcY
 vpfg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUKmLgitRQbrVdUq+JhLJN0+lGAyUcaCA0KINR+oL3p3YzIA0822KSgq8qgfXaBkFP4I2/3lPlg93s=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwOiC/T+KzVAFF/t3Du0CU/rUq3dLt62bnrwzqQRYdVk6KgutLn
 Kvee/w4/R+w28BZlk2mnyfyL2gxGLfIN8UG3L0pLAEsu46Op8Kfh2cJt5P7E1uhEBUwO4XPsGPk
 nAw==
X-Google-Smtp-Source: AGHT+IH3pUWx0UTSZa2Aiu3DAb5zGNQWPetg8r/da3QWEqKzKC58hBijTqhko4J489p1dld2kZgZsA==
X-Received: by 2002:a05:6512:2348:b0:536:a695:942c with SMTP id
 2adb3069b0e04-539a065c4e2mr511194e87.7.1727818314676; 
 Tue, 01 Oct 2024 14:31:54 -0700 (PDT)
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com.
 [209.85.208.180]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-538a0439898sm1727641e87.186.2024.10.01.14.31.53
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Oct 2024 14:31:54 -0700 (PDT)
Received: by mail-lj1-f180.google.com with SMTP id
 38308e7fff4ca-2fad784e304so19690581fa.2
 for <dri-devel@lists.freedesktop.org>; Tue, 01 Oct 2024 14:31:53 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCUqtvz3+O3CXZUqb8EtDmO5y8Le5zBLTag2uP0K6bxmDPoeVZaQ8bxKNmXUlBVgB9pDFpg9E2n0vPA=@lists.freedesktop.org
X-Received: by 2002:a2e:b8c6:0:b0:2f7:a759:72a7 with SMTP id
 38308e7fff4ca-2fae1029a26mr7884751fa.22.1727818312721; Tue, 01 Oct 2024
 14:31:52 -0700 (PDT)
MIME-Version: 1.0
References: <20240925080003.1250448-1-tejasvipin76@gmail.com>
In-Reply-To: <20240925080003.1250448-1-tejasvipin76@gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 1 Oct 2024 14:31:37 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XorfckX5US7y1vwCuSYjd+8VbOT_rcHVOot=zv4LOP+g@mail.gmail.com>
Message-ID: <CAD=FV=XorfckX5US7y1vwCuSYjd+8VbOT_rcHVOot=zv4LOP+g@mail.gmail.com>
Subject: Re: [PATCH v3] drm/panel: elida-kd35t133: transition to mipi_dsi
 wrapped functions
To: Tejas Vipin <tejasvipin76@gmail.com>
Cc: neil.armstrong@linaro.org, maarten.lankhorst@linux.intel.com, 
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, daniel@ffwll.ch, 
 quic_jesszhan@quicinc.com, dri-devel@lists.freedesktop.org, 
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

Hi,


On Wed, Sep 25, 2024 at 1:00=E2=80=AFAM Tejas Vipin <tejasvipin76@gmail.com=
> wrote:
>
> Changes the elida-kd35t133 panel to use multi style functions for
> improved error handling.
>
> Reviewed-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Signed-off-by: Tejas Vipin <tejasvipin76@gmail.com>
> ---
> Changes in v3:
>     - Added back bytes that were removed
>     - Replaced mipi_dsi_dcs_write_buffer_multi with mipi_dsi_dcs_write_se=
q_multi
>
> Changes in v2:
>     - Changed mipi_dsi_dcs_write to mipi_dsi_dcs_write_buffer_multi
>     - Cleaned up error handling
>
> Link to v2: https://lore.kernel.org/all/20240923122558.728516-1-tejasvipi=
n76@gmail.com/
> Link to v1: https://lore.kernel.org/all/20240917071710.1254520-1-tejasvip=
in76@gmail.com/
> ---
>  drivers/gpu/drm/panel/panel-elida-kd35t133.c | 108 ++++++++-----------
>  1 file changed, 45 insertions(+), 63 deletions(-)

Pushed to drm-misc-next:

[1/1] drm/panel: elida-kd35t133: transition to mipi_dsi wrapped functions
      commit: a7b3bcc8e8495ff45128caab7ceee2534d1b8e8d

-Doug
