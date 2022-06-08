Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 65763543E47
	for <lists+dri-devel@lfdr.de>; Wed,  8 Jun 2022 23:10:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 237A1113A57;
	Wed,  8 Jun 2022 21:10:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x22d.google.com (mail-oi1-x22d.google.com
 [IPv6:2607:f8b0:4864:20::22d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 234AA113A57
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Jun 2022 21:10:37 +0000 (UTC)
Received: by mail-oi1-x22d.google.com with SMTP id k11so29596823oia.12
 for <dri-devel@lists.freedesktop.org>; Wed, 08 Jun 2022 14:10:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=vQ5zV0B7pOGodfXiebn/fw6Qsn79wg3GSx0QkLVitEw=;
 b=ObCYZH59GDh91oJjS1g4NaYPr30Lr7f0wbDD095I4UXcHZtR0hrOM+MBUuvujHIXDT
 /zkhcfJu5oxzatY1oEFxUHt241rMRO12JUOZAxXWXEETh6M9woaTvh2v/CnSQ+VC/vUN
 Qma3Pqt0uBLifXvw2Kn/wmDwqAnwyRD1xJ58E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=vQ5zV0B7pOGodfXiebn/fw6Qsn79wg3GSx0QkLVitEw=;
 b=Y8Zk0i3rXjJlpv2GpnjTI278A4jddbaYd4mlDUzJGfa4sD9QY3v3a9gqqGFiUtNkz8
 LC7Zr7QEawV48JidB/lQrLoj8KdGo3A/DMfA4Rw9Ul5J0WJCHGCqhRipZuvrIGv2xgRa
 TH4f2Fb/2d3QZzkGXyeB2NE6cX9ukGHAYl5tX9B/eZ7I7P8LKgYqCbmDtfrcfIY62IOm
 Qu/XYxFxZJjE3fZfZdoHCkNtPPtaQxnclyzfo2Vgc9DDAlA6lD3P/DD7H8VFGkb7yZ5E
 DHM9MH9qWyr1oTf+eua5oXHkpNWC+CTlgXv2iMMgpXhTN5peot59yLr7WKUkObuD1U6i
 KF9w==
X-Gm-Message-State: AOAM531v7AkHjdNWv3IGyWy2YDLzHgrvJnbgSoymdqNvq2X5/mRHgAvn
 AnnCE7cJyaC6nsmhzM0UJThJUst0NU0INlhQCW31Zg==
X-Google-Smtp-Source: ABdhPJxThNPxKm6DBWNVQmje3sZQD/b9lnb/4/mWaU3otxajRxIYi8mOZwrmJwbJ1u1zTAMvjt2M+t4QGTd/X6Bb1gk=
X-Received: by 2002:a05:6808:e87:b0:32e:4789:d2c with SMTP id
 k7-20020a0568080e8700b0032e47890d2cmr3382495oil.193.1654722636454; Wed, 08
 Jun 2022 14:10:36 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 8 Jun 2022 14:10:36 -0700
MIME-Version: 1.0
In-Reply-To: <20220608094816.2898692-4-hsinyi@chromium.org>
References: <20220608094816.2898692-1-hsinyi@chromium.org>
 <20220608094816.2898692-4-hsinyi@chromium.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Wed, 8 Jun 2022 14:10:35 -0700
Message-ID: <CAE-0n53Ey7wyc274krmFDk4x1HH5fVniCpNoxU5Vs_vBdzeamA@mail.gmail.com>
Subject: Re: [PATCH v6 3/8] drm/panel: panel-edp: Implement .get_orientation
 callback
To: Douglas Anderson <dianders@chromium.org>,
 Hans de Goede <hdegoede@redhat.com>, 
 Hsin-Yi Wang <hsinyi@chromium.org>, Sam Ravnborg <sam@ravnborg.org>
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
Cc: Rob Clark <robdclark@chromium.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Thierry Reding <thierry.reding@gmail.com>,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Hsin-Yi Wang (2022-06-08 02:48:11)
> To return the orientation property to drm/kms driver.
>
> Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
> Reviewed-by: Hans de Goede <hdegoede@redhat.com>
> Reviewed-by: Douglas Anderson <dianders@chromium.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
