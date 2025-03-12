Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F22A2A5D9A6
	for <lists+dri-devel@lfdr.de>; Wed, 12 Mar 2025 10:36:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 54D7010E71B;
	Wed, 12 Mar 2025 09:36:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="ZEBzLpcb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A4E6510E71B
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Mar 2025 09:36:29 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 54AD35C58C6
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Mar 2025 09:34:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C61AFC4CEEC
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Mar 2025 09:36:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1741772188;
 bh=8PCB/qX+omXHOsFHBh6+ImDcq7aHjwbUaKNYTgAx65M=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=ZEBzLpcbPuj4e5LEPxjlMn5ET6BzLahR0WZPFffQnWR0rtFt8wO6JlM9UtruojUPn
 p/NW6fh1grHD0hWfmEwgleZcXQSatUauD+3F2xfYIBLoOb9l/EVqGGrNr8ttO3XVTh
 kwZgRoB214xmiw4XZtRf2D5ndjGqyTxwSeRRcqU0p9qWrlNOv4I3c2l3nO3LbPnNhz
 dvHyaaJl6J+VqV3LCLN2WI4HU+O0m3z1vcNkGGHD7/XpOSyhkSmPiR/jjV6f9Liv+S
 SN+fcz/eZYE20DMy/RaG89CGZiddoH6Ua9eGCBb67ggGOkOn0jsJm4roxLD5WTCbpk
 +B8B+DyNYVt8Q==
Received: by mail-yw1-f169.google.com with SMTP id
 00721157ae682-6fee63b9139so6333077b3.1
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Mar 2025 02:36:28 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCXPcPwlNyEFh+zG8vMdyxojssFI65iZoCdJwDgYAj7nS/pDC4BPmpZ5i2eCO/Lm4OGAMKMwz7XbjUY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxmI5nk/crqswvBg0BPd8lEcbsuR3BZzc7cfwcqWiawqPG9VO+R
 7Um8Kvs2mHP5JxVLnUKDCCkfOaa8WOVJ8hA6saS69ecqs59wh+stFgpNkKkUmZZc4Ug6WAc0RR/
 c5su73ZLXxEi59lWgCarhwtkBAFxPaOl77Rl4Yg==
X-Google-Smtp-Source: AGHT+IHS3can8YTqoJneu0xqWWYflo47tYvjFtQtHgO34GoAaFcy5Te+GS9aJB6DmOJN+G2yDVqsacbPbmbCFOL5/7M=
X-Received: by 2002:a05:690c:2e0a:b0:6fe:8fe:f5c2 with SMTP id
 00721157ae682-6ff0a2ab572mr69759157b3.8.1741772187605; Wed, 12 Mar 2025
 02:36:27 -0700 (PDT)
MIME-Version: 1.0
References: <20250312090132.1624445-1-nichen@iscas.ac.cn>
In-Reply-To: <20250312090132.1624445-1-nichen@iscas.ac.cn>
From: Robert Foss <rfoss@kernel.org>
Date: Wed, 12 Mar 2025 10:36:16 +0100
X-Gmail-Original-Message-ID: <CAN6tsi7k=fo6V5Mqp_yOkaW25rhTYEgAdC+fCfB_72q9ObKuxw@mail.gmail.com>
X-Gm-Features: AQ5f1JqTE66ahaBB-lj6ixl6TplWwGh5gTDicN8Z2hQ9Cq7gqe8waoTJ4QjaNVY
Message-ID: <CAN6tsi7k=fo6V5Mqp_yOkaW25rhTYEgAdC+fCfB_72q9ObKuxw@mail.gmail.com>
Subject: Re: [PATCH] drm/bridge: anx7625: Remove redundant 'flush_workqueue()'
 calls
To: Chen Ni <nichen@iscas.ac.cn>
Cc: andrzej.hajda@intel.com, neil.armstrong@linaro.org, 
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se, jernej.skrabec@gmail.com, 
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de, 
 airlied@gmail.com, simona@ffwll.ch, lumag@kernel.org, dianders@chromium.org, 
 yuanhsinte@chromium.org, jani.nikula@intel.com, xji@analogixsemi.com, 
 robh@kernel.org, sui.jingfeng@linux.dev, dri-devel@lists.freedesktop.org, 
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

On Wed, Mar 12, 2025 at 10:02=E2=80=AFAM Chen Ni <nichen@iscas.ac.cn> wrote=
:
>
> 'destroy_workqueue()' already drains the queue before destroying it, so
> there is no need to flush it explicitly.
>
> Remove the redundant 'flush_workqueue()' calls.
>
> This was generated with coccinelle:
>
> @@
> expression E;
> @@
> - flush_workqueue(E);
>   destroy_workqueue(E);
>
> Signed-off-by: Chen Ni <nichen@iscas.ac.cn>
> ---
>  drivers/gpu/drm/bridge/analogix/anx7625.c | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/bridge/analogix/anx7625.c b/drivers/gpu/drm/=
bridge/analogix/anx7625.c
> index 0b97b66de577..591ec8e5b642 100644
> --- a/drivers/gpu/drm/bridge/analogix/anx7625.c
> +++ b/drivers/gpu/drm/bridge/analogix/anx7625.c
> @@ -2771,7 +2771,6 @@ static void anx7625_i2c_remove(struct i2c_client *c=
lient)
>
>         if (platform->hdcp_workqueue) {
>                 cancel_delayed_work(&platform->hdcp_work);
> -               flush_workqueue(platform->hdcp_workqueue);
>                 destroy_workqueue(platform->hdcp_workqueue);
>         }

Reviewed-by: Robert Foss <rfoss@kernel.org>

>
> --
> 2.25.1
>
