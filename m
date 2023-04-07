Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B9056DB5F8
	for <lists+dri-devel@lfdr.de>; Fri,  7 Apr 2023 23:54:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 110F610E0E6;
	Fri,  7 Apr 2023 21:54:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com
 [IPv6:2a00:1450:4864:20::230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A19A10E0E6
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Apr 2023 21:54:21 +0000 (UTC)
Received: by mail-lj1-x230.google.com with SMTP id b6so24590179ljr.1
 for <dri-devel@lists.freedesktop.org>; Fri, 07 Apr 2023 14:54:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1680904459;
 h=cc:to:subject:message-id:date:user-agent:from:references
 :in-reply-to:mime-version:from:to:cc:subject:date:message-id
 :reply-to; bh=QUf+hItRUlAyl8Odc+K+o9OQqV17J58V+aP3v0kFHhk=;
 b=e4b7IjwzMFLzp4j8C3SqmoeHb2RxJ6eU99DdsPfTzlc8cZP7EZ8WJHOHPWOHM0wKNg
 Udh/G5mBxNssdH1VKBE9FOFo0HmiiIw3iRIVGetu+g6G3dZuZ3+y8jRqslT7oCoizblo
 UWLYV8i0/wjHNcDEU6PWm/KjN7DiR3YxRcdZs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680904459;
 h=cc:to:subject:message-id:date:user-agent:from:references
 :in-reply-to:mime-version:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QUf+hItRUlAyl8Odc+K+o9OQqV17J58V+aP3v0kFHhk=;
 b=oeXx28n7V/ENMcAj/0U0WfptsclyNqAouTid77Ed8tTY1+nY+HeCwIFZxlPGswAs5R
 Se4QsHjYb4N2CixhtLZE06QxrC3cLXUtlGYWZ3edFCHT8ulQEqpfZhSGjm81r3Ha4qgv
 GJjdpqHMKfvoy1CyyXhArciTQlj8m8kPXqjaaiQRByubdGWhmfNsZ0ZfDcM7SsYq7U0P
 mWfqU8OdGc6zQ4bTZT1SE1OZ6e2gPZNY1Gfr5XPYAGT5rXZkqPMKmc8f0ZmTAGH+2NZA
 wZ387eeGos+29aTeITsLo8dO4IKvPfN9JeBx86QqJH2h4V5jOhqZaHf0bVvoujwY3Ngf
 uyDA==
X-Gm-Message-State: AAQBX9fNBFT4BO8gcJyWzoD/MVEpSEjLDuEDJ9N0JUGFlMeUskoLnPK4
 FRYoYurqRZf6kuJ+aLI5bkpDJH+p//mdrEPfOoX7VQ==
X-Google-Smtp-Source: AKy350bK2tfa/ifMpJd99S5lA9yyNvRN8J9D6TZLrauRv7sSWhzgZZFM6h20BylS5hhLgn59vMCdcBgqoUJ4xAgeXvY=
X-Received: by 2002:a05:651c:1035:b0:2a5:f6f2:1ff4 with SMTP id
 w21-20020a05651c103500b002a5f6f21ff4mr917513ljm.10.1680904458705; Fri, 07 Apr
 2023 14:54:18 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 7 Apr 2023 14:54:18 -0700
MIME-Version: 1.0
In-Reply-To: <20230331091145.737305-2-treapking@chromium.org>
References: <20230331091145.737305-1-treapking@chromium.org>
 <20230331091145.737305-2-treapking@chromium.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Fri, 7 Apr 2023 14:54:18 -0700
Message-ID: <CAE-0n53Dw1tk0vVuToTwGYrKD76O_F97QgSGricBuvuPJnG60g@mail.gmail.com>
Subject: Re: [PATCH v15 01/10] device property: Add remote endpoint to devcon
 matcher
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Benson Leung <bleung@chromium.org>, 
 Daniel Scally <djrscally@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@gmail.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Guenter Roeck <groeck@chromium.org>, 
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Jonas Karlman <jonas@kwiboo.se>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>,
 Pin-yen Lin <treapking@chromium.org>, 
 Prashant Malani <pmalani@chromium.org>,
 "Rafael J . Wysocki" <rafael@kernel.org>, 
 Rob Herring <robh+dt@kernel.org>, Robert Foss <rfoss@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Marek Vasut <marex@denx.de>, devicetree@vger.kernel.org,
 =?UTF-8?B?TsOtY29sYXMgRiAuIFIgLiBBIC4gUHJhZG8=?= <nfraprado@collabora.com>,
 chrome-platform@lists.linux.dev, Javier Martinez Canillas <javierm@redhat.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-acpi@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Hsin-Yi Wang <hsinyi@chromium.org>, Xin Ji <xji@analogixsemi.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Pin-yen Lin (2023-03-31 02:11:36)
> From: Prashant Malani <pmalani@chromium.org>
>
> When searching the device graph for device matches, check the
> remote-endpoint itself for a match.
>
> Some drivers register devices for individual endpoints. This allows
> the matcher code to evaluate those for a match too, instead
> of only looking at the remote parent devices. This is required when a
> device supports two mode switches in its endpoints, so we can't simply
> register the mode switch with the parent node.

Looking at this in isolation I have no idea what a mode switch is and
how it is related to drivers/base/property.c. Can you expand on this
commit text? Maybe say two "usb typec mode switches"? And maybe include
an example graph node snippet?
