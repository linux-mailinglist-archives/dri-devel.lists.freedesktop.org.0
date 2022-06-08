Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 01A20543E4E
	for <lists+dri-devel@lfdr.de>; Wed,  8 Jun 2022 23:13:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C3B2511A412;
	Wed,  8 Jun 2022 21:13:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x35.google.com (mail-oa1-x35.google.com
 [IPv6:2001:4860:4864:20::35])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA22611A411
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Jun 2022 21:13:16 +0000 (UTC)
Received: by mail-oa1-x35.google.com with SMTP id
 586e51a60fabf-fe32122311so148522fac.7
 for <dri-devel@lists.freedesktop.org>; Wed, 08 Jun 2022 14:13:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=KJjsYc5Q+FB6nVGvxpVGic7XyzdqJCtqUxTU1078q0M=;
 b=Gc9L1/Mk7mWV/4QJF/gCpyklEm3nrwzE108+emduADQEs5E3Yfs7t1VmgeSm7ZtoDS
 X4ToRRe0h40UYzuAIXkCKg9zfmX2Yw5XBX2bOpNgglkLh+Q2hcCkAYWgRlCMdNmxJ3EL
 XhsDPen9KeraIcqoJgmxzfDsD93FEDV2a7wXU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=KJjsYc5Q+FB6nVGvxpVGic7XyzdqJCtqUxTU1078q0M=;
 b=0GxdioFfyur+Ux6mLSjtMe8WnygOP0QuwJVPQU8dg4OIv25u7J/qMX9jvRL2GxNaZ5
 1gS93ZqCWXyngdqcNC49wtBRufgSfTuBSxZKrUzwio0RGycaZzafuYe/ohd7FNbPc4Qr
 azdro3/Qpa2QN475soOR4kYiRXo/9u6/JoGdq/ld3aagC9UcVTlK7v83pjAOA/uPrd4o
 7bFBQjE0TjxjErWLS0KzqDjyapsT1Xlxi2fO/9h59eZa/PHflCngyllSibNDav1Oqe98
 P5ltPK87eJ7JAZdwX+hClHzj46aNYKMbWe8iDxMhfF+tkml+biYqWjW9dOUbG8q7uTkf
 YBOg==
X-Gm-Message-State: AOAM532ByMmMjjPiWMYgldhClWevGmr0mP+Xr3NzlglxR09B8Slps0II
 FQIrYRNDj27nHQZYvYrnTepl4xhYN3QW+wK4mXCKJqDKjjY=
X-Google-Smtp-Source: ABdhPJwQzs1bZwvLnqYeliieUkYLdQdpx/nYITaJw1lWaOSE5I7YZuUPgGWLIW/4CNZXvEIeqxzv3HsRQyon2FoXQYk=
X-Received: by 2002:a05:6870:b381:b0:fe:2004:b3b5 with SMTP id
 w1-20020a056870b38100b000fe2004b3b5mr1792742oap.63.1654722796290; Wed, 08 Jun
 2022 14:13:16 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 8 Jun 2022 14:13:15 -0700
MIME-Version: 1.0
In-Reply-To: <20220608094816.2898692-6-hsinyi@chromium.org>
References: <20220608094816.2898692-1-hsinyi@chromium.org>
 <20220608094816.2898692-6-hsinyi@chromium.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Wed, 8 Jun 2022 14:13:15 -0700
Message-ID: <CAE-0n51EMagNGQL8JPZXG8rek-a7+730FtRdj7jkzce4PwUD2w@mail.gmail.com>
Subject: Re: [PATCH v6 5/8] drm/panel: panel-simple: Implement
 .get_orientation callback
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

Quoting Hsin-Yi Wang (2022-06-08 02:48:13)
> To return the orientation property to drm/kms driver.
>
> Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
> Reviewed-by: Hans de Goede <hdegoede@redhat.com>
> Reviewed-by: Douglas Anderson <dianders@chromium.org>
> Reviewed-by: Sam Ravnborg <sam@ravnborg.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
