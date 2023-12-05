Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DAFED805FAB
	for <lists+dri-devel@lfdr.de>; Tue,  5 Dec 2023 21:45:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 160B510E61B;
	Tue,  5 Dec 2023 20:45:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [IPv6:2a00:1450:4864:20::529])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6033F10E61B
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Dec 2023 20:45:27 +0000 (UTC)
Received: by mail-ed1-x529.google.com with SMTP id
 4fb4d7f45d1cf-54c77e0835bso4742577a12.2
 for <dri-devel@lists.freedesktop.org>; Tue, 05 Dec 2023 12:45:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1701809124; x=1702413924;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0Y+jY+0Fv8pe8Zjgn3mhV8qrJZdO/zPS1zfBF2bsh/g=;
 b=fM8lducLZMdpQmmbQVKHnqnd0KSx5R3EuWJOhS7danEXnAciB7cPMX7SuhpCJFW3H1
 YYUpwTtsroWaTRswwlFsf/JwtVmXGEgZ83+MzYiSrthSql77gCGlLLSf8O5xJTQYyDkF
 kjlbBeAbGr9o0kOrQiUfsLZpddres5XtWsDZo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701809124; x=1702413924;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0Y+jY+0Fv8pe8Zjgn3mhV8qrJZdO/zPS1zfBF2bsh/g=;
 b=Edv+we4gUcoCkjLvhwpzjs9+sHtrPlxjbwn5ZhVv6KAMBtwnz+FHkPS/6n1WwcDfBz
 K0MnYupEyMDopmKRzT1wvU9hXl4rnHCobHw5kYlWLUKR2xfg4rgZhvm/D+AHtcj4FZoG
 SHc3RIWxpzbdQhSXnXKjxXJMbycgD9cZ/loKwCzMcxCJ0zp450h2FeD2BqLcIvMRjZyn
 t+0iGYHPBDFB1R/I+p+HqpZGE5JzVej0juHBOIpM/MDqw28DjlsZO057yZEHMeunxlCJ
 MxYnBsj/O/0CXA+ndIdHKbvsoNMW+AL4EQW8lIiOihE49k9gNgBA0L9TNZOgZp51SpmB
 r3Ow==
X-Gm-Message-State: AOJu0YzKsFKP3JkLa8qFS7pG/ThNQH8HCiyGaGRcyvxC546BtIM/cjbz
 m85CjaJ/2SMuBnUJgD5uODbW1J5jk1PEeHbSIWZojyHZ
X-Google-Smtp-Source: AGHT+IEXlWuLvxvxG16lB1vGhEmM0bbSb0FjJC2t8TDnuprBZk5Eov7ikthViZcJHaGxzvXCzsFk4g==
X-Received: by 2002:a17:906:5184:b0:a19:a19b:78a8 with SMTP id
 y4-20020a170906518400b00a19a19b78a8mr922315ejk.107.1701809124395; 
 Tue, 05 Dec 2023 12:45:24 -0800 (PST)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com.
 [209.85.128.43]) by smtp.gmail.com with ESMTPSA id
 c5-20020a170906d18500b00a1859bc527fsm7374140ejz.10.2023.12.05.12.45.23
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 05 Dec 2023 12:45:23 -0800 (PST)
Received: by mail-wm1-f43.google.com with SMTP id
 5b1f17b1804b1-40b422a274dso16255e9.0
 for <dri-devel@lists.freedesktop.org>; Tue, 05 Dec 2023 12:45:23 -0800 (PST)
X-Received: by 2002:a05:600c:4e8d:b0:40a:483f:f828 with SMTP id
 f13-20020a05600c4e8d00b0040a483ff828mr15612wmq.4.1701809123285; Tue, 05 Dec
 2023 12:45:23 -0800 (PST)
MIME-Version: 1.0
References: <20230921192749.1542462-1-dianders@chromium.org>
 <20230921122641.RFT.v2.4.Ie7588ec6e0f93e8bc700e76b265ad1a7ad6b15ad@changeid>
 <2f7fbd1b606b4d08b8c8c6eefff5898c8faa697c.camel@redhat.com>
 <CAD=FV=XkeicQ3Gq4yaFtXsF7yM_7pXbpNKB56DbOwBmsEsrF_g@mail.gmail.com>
In-Reply-To: <CAD=FV=XkeicQ3Gq4yaFtXsF7yM_7pXbpNKB56DbOwBmsEsrF_g@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 5 Dec 2023 12:45:07 -0800
X-Gmail-Original-Message-ID: <CAD=FV=XDhkstFX3e2qPGeYGkFWefRMH24BjNgRujBX5PQyE6MA@mail.gmail.com>
Message-ID: <CAD=FV=XDhkstFX3e2qPGeYGkFWefRMH24BjNgRujBX5PQyE6MA@mail.gmail.com>
Subject: Re: [RFT PATCH v2 04/12] drm/nouveau: Call
 drm_atomic_helper_shutdown() or equiv at shutdown time
To: Lyude Paul <lyude@redhat.com>
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
Cc: kherbst@redhat.com, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Maxime Ripard <mripard@kernel.org>,
 dri-devel@lists.freedesktop.org, bskeggs@redhat.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Fri, Nov 17, 2023 at 3:00=E2=80=AFPM Doug Anderson <dianders@chromium.or=
g> wrote:
>
> Hi,
>
> On Fri, Sep 22, 2023 at 2:06=E2=80=AFPM Lyude Paul <lyude@redhat.com> wro=
te:
> >
> > actually very glad to see this because I think I've seen one bug in the=
 wild
> > as a result of things not getting shut down :)
> >
> > Reviewed-by: Lyude Paul <lyude@redhat.com>
> > Tested-by: Lyude Paul <lyude@redhat.com>
>
> Any idea of where / how this patch should land. Would you expect me to
> land it through drm-misc, or would you expect it to go through someone
> else's tree?

Still hoping to find a way to land this patch, since it's been
reviewed and tested. Would anyone object if I landed it via drm-misc?

-Doug
