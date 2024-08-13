Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 17D68950C17
	for <lists+dri-devel@lfdr.de>; Tue, 13 Aug 2024 20:17:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 939C910E3CE;
	Tue, 13 Aug 2024 18:17:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="TwUO2SzP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vk1-f170.google.com (mail-vk1-f170.google.com
 [209.85.221.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 513EF10E3CE
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Aug 2024 18:17:56 +0000 (UTC)
Received: by mail-vk1-f170.google.com with SMTP id
 71dfb90a1353d-4f50dd3eab9so1989662e0c.1
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Aug 2024 11:17:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1723573073; x=1724177873;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=imsr1IM3T+HpLuQNUoryQ7eKcRg7fznV3Mgf+zxJJ6s=;
 b=TwUO2SzPeXy8njL4tnK+3cLas9R72AMybsfpI/QhkM+ZdUztlN1qn8GqAGhg5Ct0OZ
 iwv9mIjMoDuXL963LhKNF5tBsmuPh1mnW4uUl6VTctFjgEnE5Z/dryXX5eUubga9Q0AX
 /aeOYXgHrLHIx79D6t5buqKNJyv2sqJxYR4Zc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1723573073; x=1724177873;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=imsr1IM3T+HpLuQNUoryQ7eKcRg7fznV3Mgf+zxJJ6s=;
 b=xO6dDFh7FoTQf8rjvj6DU2XUHOTnaUvn0ySnsmd9Ibl4hAhEYAQx2lWpEws2XPRWWY
 WVEt/h0vwHLuSloSimOhyOpGjqlXQ2ZD1EpNBz3AO92TXItYw1fTHIUiM59VjbvmM5dK
 oFuWvaIBE3LruLVdj1S3yH0OsfyART9GoKJsN3+L7stJs8nEy/ScnubCmC/xJAIT1zB8
 IZTowevUKQhT7GxflwXM8rNmcv+8KK9Qs0VB6G0hVDaVhArQmLWA5PsXyUoV/97DOQGE
 DHw5XaaxIMSLR2BEdTk5wTWUZ+PFFFLiEm2hNWX0jV5Emn4D4u3weOHjpP/VT8PXfuaT
 6/vw==
X-Forwarded-Encrypted: i=1;
 AJvYcCW8bOFme9ggOaT4cW5RLwTR0m1wLYp4zmLnu7UfYI/wEWjKG4rhINmazhY4qq3+HgdOda//QyEqZu7ZiJknv/jLV61+dtFEmqJ6zy2d6bFK
X-Gm-Message-State: AOJu0Yx1IryOk2pfBR8hsUPa+V8NkG00U3Q6z7Rwt0bupUFUc2RsVhzw
 WvwiW4cxxAu6NAqwXD6mlaCLizgZjIr7fsU8Q743WUtAO3mxy5qxJdqXc3oYmxjcozwJCPDNWtA
 =
X-Google-Smtp-Source: AGHT+IEB+phZ4ZJc0gNKww/iDYxc+1qmQyIN9LD5zELP1OFSH5BJ3Sf2+TlCtjzh/AhjcLpig/a4gA==
X-Received: by 2002:a05:6122:2a04:b0:4ec:f996:5d84 with SMTP id
 71dfb90a1353d-4fad1c16970mr646326e0c.2.1723573073482; 
 Tue, 13 Aug 2024 11:17:53 -0700 (PDT)
Received: from mail-ua1-f53.google.com (mail-ua1-f53.google.com.
 [209.85.222.53]) by smtp.gmail.com with ESMTPSA id
 71dfb90a1353d-4f91f31c62bsm970553e0c.23.2024.08.13.11.17.52
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 13 Aug 2024 11:17:52 -0700 (PDT)
Received: by mail-ua1-f53.google.com with SMTP id
 a1e0cc1a2514c-81ff08e24f8so1879288241.3
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Aug 2024 11:17:52 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCVIVH3ReEJr//+oh4HHrELvFz29Wpl9cwGcHzk0jTU68kj5LUwGG0I+Ewt8FljHHtxQLZHEJ4gPon0YFMJ7mknlNDHY2vxtxcjnMdTsG5DG
X-Received: by 2002:a05:6102:3048:b0:48f:e802:4b26 with SMTP id
 ada2fe7eead31-49759944e85mr582438137.18.1723573071902; Tue, 13 Aug 2024
 11:17:51 -0700 (PDT)
MIME-Version: 1.0
References: <20240813062912.467280-1-tejasvipin76@gmail.com>
 <20240813062912.467280-3-tejasvipin76@gmail.com>
In-Reply-To: <20240813062912.467280-3-tejasvipin76@gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 13 Aug 2024 11:17:40 -0700
X-Gmail-Original-Message-ID: <CAD=FV=UtZdh4hMqT7ATtQ+g=jGV568sCnFgJzFLVDRj2qAkVcQ@mail.gmail.com>
Message-ID: <CAD=FV=UtZdh4hMqT7ATtQ+g=jGV568sCnFgJzFLVDRj2qAkVcQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] drm/panel: jdi-fhd-r63452: transition to mipi_dsi
 wrapped functions
To: Tejas Vipin <tejasvipin76@gmail.com>
Cc: maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 neil.armstrong@linaro.org, quic_jesszhan@quicinc.com, airlied@gmail.com, 
 daniel@ffwll.ch, dri-devel@lists.freedesktop.org, 
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

On Mon, Aug 12, 2024 at 11:31=E2=80=AFPM Tejas Vipin <tejasvipin76@gmail.co=
m> wrote:
>
> Changes the jdi-fhd-r63452 panel to use multi style functions for
> improved error handling.
>
> Signed-off-by: Tejas Vipin <tejasvipin76@gmail.com>
> ---
>  drivers/gpu/drm/panel/panel-jdi-fhd-r63452.c | 150 ++++++-------------
>  1 file changed, 49 insertions(+), 101 deletions(-)

Looks nice to me now.

Reviewed-by: Douglas Anderson <dianders@chromium.org>

...as per usual, I'll give this a snooze for a week or so and plan to
apply it if nothing comes up.
