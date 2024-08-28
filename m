Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 804239630E9
	for <lists+dri-devel@lfdr.de>; Wed, 28 Aug 2024 21:26:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 83DEE10E5B9;
	Wed, 28 Aug 2024 19:26:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="AzqilVvo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-f42.google.com (mail-vs1-f42.google.com
 [209.85.217.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 52A0210E5B9
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Aug 2024 19:26:49 +0000 (UTC)
Received: by mail-vs1-f42.google.com with SMTP id
 ada2fe7eead31-498d1e97214so2626477137.3
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Aug 2024 12:26:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1724873205; x=1725478005;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=C9b3TLjbnTz825v2LNHY3zO60OAKAYUhKNLWtiBOuhI=;
 b=AzqilVvoXC5y23sRAPXV963lkT/+KQV8eTev6WgR27iRIbkPYKoWaB/QEg2yvKLR8t
 vaxSYCZg8heU0FMR/vn17SDUAf/QGSZ6hvRNcTOq0Ii2YH5h2ew/VLnmG9iztPLPmrLM
 2DTnUTHw7OuIs7caw4XkZsPLd/vnkvtFRV2ow=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724873205; x=1725478005;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=C9b3TLjbnTz825v2LNHY3zO60OAKAYUhKNLWtiBOuhI=;
 b=X5t+/lXNTGvE7DHHC0w34cociL0uS3Hb6mQI9ikiVcIUIHTxnAqhEUyMxx+WiL4IY7
 km3kBY1DDXwB1gYa9T60Pb5EbJgzZgGn8KZdPC8XU2bZPgt9WIGe2JCXdrgrsWfQzzUa
 +CD7Ca52bd81dIDIvJxTJbG45kgGShTvKq621kpMl8+PXUbIwbnE/acIIPjaK6PJ8Vl3
 +B2ApdHF26W6W3+sg6rcYfjmoegx/LOrjfZ22L8JQaeijF/jL9PD2FsJqm7K2eHuP4Q9
 0a4BcpAYqGzbY4vUv4YBNGVSJ+D4TSW2qcttWoBfirOelvDOSWOsVe+ZfrVyN/I8coDG
 tRFg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXLc5I3403x5452l7Cd8MKImuWvuUMBu7tPhP9cOx6oZEsmHg8vQiVILWisOfz9mq2cez2dFucENAE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyZSTfWbuPrH3bEyp2JH8okHNFjUeDRbsqPqGrI/k+5lPsP93bB
 Y5XqEBw6LF5C0oJbRn6lFgInbEIMeup0dDj9sTsS71cuuVi05icbcGw9lMvob3z2YyRsyAZ7kBs
 =
X-Google-Smtp-Source: AGHT+IGeFDUz1/GuPlINgcOgkAunAHf3ZpdMeR5JPw/TvP1cQTe6uH3slFk3QSIwzgN33GPyEwIGZA==
X-Received: by 2002:a05:6102:dcb:b0:494:560b:6bd7 with SMTP id
 ada2fe7eead31-49a5ae78d93mr1081507137.15.1724873205354; 
 Wed, 28 Aug 2024 12:26:45 -0700 (PDT)
Received: from mail-vk1-f170.google.com (mail-vk1-f170.google.com.
 [209.85.221.170]) by smtp.gmail.com with ESMTPSA id
 ada2fe7eead31-498e47d51d0sm1792470137.14.2024.08.28.12.26.44
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 28 Aug 2024 12:26:44 -0700 (PDT)
Received: by mail-vk1-f170.google.com with SMTP id
 71dfb90a1353d-4fcfd6b870aso2362832e0c.0
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Aug 2024 12:26:44 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCWp+Qssj7TSnbEJkpN+GAP3APUxN5PgV1a+j16hzNyII8KNFw7vxAa88g6vJV6OSHWDfUBzCHp7EgQ=@lists.freedesktop.org
X-Received: by 2002:a05:6122:319a:b0:4ef:65b6:f3b5 with SMTP id
 71dfb90a1353d-4fff17072b6mr448863e0c.10.1724873203775; Wed, 28 Aug 2024
 12:26:43 -0700 (PDT)
MIME-Version: 1.0
References: <20240828182210.565861-1-tejasvipin76@gmail.com>
In-Reply-To: <20240828182210.565861-1-tejasvipin76@gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 28 Aug 2024 12:26:29 -0700
X-Gmail-Original-Message-ID: <CAD=FV=V71VzJk81YALO4ufohL0a4EQuqZVXavbpM=bqHgsf0sw@mail.gmail.com>
Message-ID: <CAD=FV=V71VzJk81YALO4ufohL0a4EQuqZVXavbpM=bqHgsf0sw@mail.gmail.com>
Subject: Re: [PATCH v2] drm/panel: novatek-nt35950: transition to mipi_dsi
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

On Wed, Aug 28, 2024 at 11:26=E2=80=AFAM Tejas Vipin <tejasvipin76@gmail.co=
m> wrote:
>
> Changes the novatek-nt35950 panel to use multi style functions for
> improved error handling.
>
> Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
> Signed-off-by: Tejas Vipin <tejasvipin76@gmail.com>
> ---
> Changes in v2:
>     - Style changes
>     - Fixed changes in logic
>
> v1: https://lore.kernel.org/all/20240824084422.202946-1-tejasvipin76@gmai=
l.com/
> ---
>  drivers/gpu/drm/panel/panel-novatek-nt35950.c | 211 ++++++------------
>  1 file changed, 66 insertions(+), 145 deletions(-)

Reviewed-by: Douglas Anderson <dianders@chromium.org>

Neil: Let me know if you want to land this or you want me to land it. Thank=
s!

-Doug
