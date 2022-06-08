Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CB7C5543E4D
	for <lists+dri-devel@lfdr.de>; Wed,  8 Jun 2022 23:13:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E27011A402;
	Wed,  8 Jun 2022 21:13:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x336.google.com (mail-ot1-x336.google.com
 [IPv6:2607:f8b0:4864:20::336])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 389C311A408
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Jun 2022 21:13:00 +0000 (UTC)
Received: by mail-ot1-x336.google.com with SMTP id
 l9-20020a056830268900b006054381dd35so15991846otu.4
 for <dri-devel@lists.freedesktop.org>; Wed, 08 Jun 2022 14:13:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=zU2IqojqnmMw7oHCklReG2t+BVElCfqra7nD/0zeq60=;
 b=nL4lh+nhXy6KDiZMuEC7AZ+4T+CP3Ep054FT+G2lyrT98EsI9lclYve4NTngxRw4nj
 gYZnhWXCE+kV1tiFShrOpXOvU+rJpkUA8gsvKgpj3BnM5tTzUIxtVcWi4oo7qXu3+QW+
 p6qqZh7ij1fnnc73xDYW10Ir3V9zRzUW3F08M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=zU2IqojqnmMw7oHCklReG2t+BVElCfqra7nD/0zeq60=;
 b=n0tVicbpHxrAD2PkdgqbmaTmK+CoHanOnd2JqIBQse22Ho0SbhnXY4rnL0OdK+/pYh
 QJDN7OgjW+IBqJP68QeZcFT6x6F9qcfr/ra8d8vuxvbw8lMX5O0VQy1zIMdYkOhTwNkb
 g/EAXxRjD/7oRyLHSpDQCEgAWKnul+it+oeWI+ApXS3QtCYdn4/MgxWvG4pUg/FJwN+/
 nQ7yGW/Cd8zv5mlYe3PN4P9YJ40sfnPzfbwA1b+2eIlFHnuetRL53tAlvBUv74FZ68AM
 q3bcpo4aVzQd2sY129b9Ze/kmYEz89iME5LsE9tV6jRT1R2u7m2WHsuJgyFZGsyjzpzv
 /xgg==
X-Gm-Message-State: AOAM532hfWTGe4rAkC4BZQnFh+Pc4zRYyCyg4Nw1oCenkmgXpqHFLIDu
 XKH6I/7ik0AkNoXIfqXQMhnzyoCjKOgU+FLN3DqibA==
X-Google-Smtp-Source: ABdhPJyR4UOJKCdH5PXUeGUCZIN4eiKjKZgdVngW7ipxNAeZ+R7k6eQQUsVT11umQLjPb0Qz/kSYO1exywAyN9vRN+o=
X-Received: by 2002:a9d:729b:0:b0:60c:21bd:97c0 with SMTP id
 t27-20020a9d729b000000b0060c21bd97c0mr617497otj.77.1654722779429; Wed, 08 Jun
 2022 14:12:59 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 8 Jun 2022 14:12:59 -0700
MIME-Version: 1.0
In-Reply-To: <20220608094816.2898692-7-hsinyi@chromium.org>
References: <20220608094816.2898692-1-hsinyi@chromium.org>
 <20220608094816.2898692-7-hsinyi@chromium.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Wed, 8 Jun 2022 14:12:59 -0700
Message-ID: <CAE-0n50C0rJkoH=EPkXfqOPz9ZfODAfx6eimeV8VK8dxRXU_5Q@mail.gmail.com>
Subject: Re: [PATCH v6 6/8] drm/panel: ili9881c: Implement .get_orientation
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

Quoting Hsin-Yi Wang (2022-06-08 02:48:14)
> To return the orientation property to drm/kms driver.
>
> Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
> Reviewed-by: Hans de Goede <hdegoede@redhat.com>
> Reviewed-by: Douglas Anderson <dianders@chromium.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
