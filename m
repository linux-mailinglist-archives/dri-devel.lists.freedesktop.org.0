Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1821B6CB09C
	for <lists+dri-devel@lfdr.de>; Mon, 27 Mar 2023 23:23:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B08110E767;
	Mon, 27 Mar 2023 21:23:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb2f.google.com (mail-yb1-xb2f.google.com
 [IPv6:2607:f8b0:4864:20::b2f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7631010E767
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Mar 2023 21:23:51 +0000 (UTC)
Received: by mail-yb1-xb2f.google.com with SMTP id n125so12525784ybg.7
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Mar 2023 14:23:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1679952230;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wRwaPJdNjZmcm9hJp392EALqZkQqEkTeWD1wr6f42IY=;
 b=CidMqviG1CVTU+wx0EfQQ3sUH/cjf8Dd7nelb7WgvTyS6PqzNdvqV0M4Lm9uwfolJl
 +N1NLYxxIW+6N5TAJcMdNbcdhoPmRw1zEnmm7YM1OgvWMk33fzRPH7MFC9VOPwNvHUXy
 4W6EEECa+7UfqFcaGPJ2NA1nx3gisuP3enofJkkdsGQaD4EcA54jU1DJ4F3xiFFxfd5p
 ka6p3MaULmB0KeXkS/Gm7r+MAMKWbdKo5e2/Nn3Qi/NvAF/s1bnPjT8mCOs2V2EW48vp
 4w+C9MjHfaf7F7I2OuSqnUPXZoJtMKoUWeDzkpZ07gWG0TX+zljVFlobcUM6O/1TMcko
 9AHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679952230;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=wRwaPJdNjZmcm9hJp392EALqZkQqEkTeWD1wr6f42IY=;
 b=iTfRZmZ7F4T74srLOjFFlBNnOo+/kl4/1oFrYtnkpq3dofqhYFOtlXWwTcmd0nHl3A
 uHbpwxCeFHerddX++SJ4XmrL5l0oMJiT+3LUT7hBwnA0K52H4Ab65qMLm7Z18rGG2GFj
 x7BpzBEebE69mjWcE3FDLMa3qXGClKK9dia6IEbTOgA0RvhBuETZEaFW5EGlrR6DO7fT
 ysFejF1Ud1TgAyPMuQL3cFVS5FuRcknLmFlNy9X7ufGB5Z9F8EGe08Qy4QvYHCfhj2fY
 Rgy3yqUv94yIkI7TMG5GcpO7HMjMjyL7UzWxuRg2MYNECkgOh1Pgng6Uj7RdDnnmzVHg
 ELhw==
X-Gm-Message-State: AAQBX9cRecWZeDzdYxX7LXEfvlPY4r4jsx6POdoiF9rC8TJlQSE2VA5D
 8PjTJGPtVmsbdrDWp+8P5cxJ1Dl5UtaqZm2vZvyO0w==
X-Google-Smtp-Source: AKy350aF5/L77S0EjVYQ52vhV3o7136405E00a7IO8owxz67hLYfSywE1LAZVDUR/2jjWTCviakaCuqAVj2MZkaWw5I=
X-Received: by 2002:a05:6902:10c2:b0:b6e:b924:b96f with SMTP id
 w2-20020a05690210c200b00b6eb924b96fmr10825453ybu.3.1679952230621; Mon, 27 Mar
 2023 14:23:50 -0700 (PDT)
MIME-Version: 1.0
References: <de0273a8-8910-4ac4-b4ed-f7691c4d2ca6@kili.mountain>
In-Reply-To: <de0273a8-8910-4ac4-b4ed-f7691c4d2ca6@kili.mountain>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 27 Mar 2023 23:23:39 +0200
Message-ID: <CACRpkdY9+HbODoJYku1EN7Swr9C+NbeS-GLNb=CtNkdQHQ2EQg@mail.gmail.com>
Subject: Re: [PATCH] drm/panel: magnachip: Prevent error pointer dereference
 in probe
To: Dan Carpenter <error27@gmail.com>
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
Cc: Chris Morgan <macromorgan@hotmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 kernel-janitors@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Maya Matuszczyk <maccraft123mc@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Mar 22, 2023 at 10:07=E2=80=AFAM Dan Carpenter <error27@gmail.com> =
wrote:

> Don't dereference "db->dsi_dev" when it is an error pointer.
>
> Fixes: 249a4f5e663c ("drm/panel: Add Magnachip D53E6EA8966 Panel Driver")
> Signed-off-by: Dan Carpenter <error27@gmail.com>

Patch applied to drm-misc-next!

Yours,
Linus Walleij
