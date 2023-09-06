Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 72DB9794091
	for <lists+dri-devel@lfdr.de>; Wed,  6 Sep 2023 17:42:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B2FC510E69C;
	Wed,  6 Sep 2023 15:42:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE00910E69C
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Sep 2023 15:42:14 +0000 (UTC)
Received: by mail-lf1-x132.google.com with SMTP id
 2adb3069b0e04-500c37d479aso6040826e87.2
 for <dri-devel@lists.freedesktop.org>; Wed, 06 Sep 2023 08:42:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1694014931; x=1694619731;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0jqWPBKKZ0w/uAPmZAAT8U8XfT3/SMs+PhVUdbN+Ymo=;
 b=OPOyKdEipVyBDnoEbYFEGQz5epFcC1r4OmYZbXgEQTE44O8xQKH8kSxZQRisuBe1HT
 COzLzH+ru56IlJBLWLofAezl2VBjn3WUD4R0kvRCIJd+4lEPq1m6EuwtzxwTTT757G8o
 WXjVHdpMemfj4XlJ04MgAKY53Fq2hXOCkEfaE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1694014931; x=1694619731;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0jqWPBKKZ0w/uAPmZAAT8U8XfT3/SMs+PhVUdbN+Ymo=;
 b=DMiOqx+AIIJrnh33PV25kc2luvlLTFkU5lb/KKhaaYVta7GfykAYFav083/6WR9wSn
 YDrLqPE5iiwAihxtcYNr3JEDqNXbBMCztJsrAzuu4ZHvieV1sQADSaJtoA9gusgR4fxW
 LHtqUbrdEZussmE38IONR0UAiXPMf+HT6Bk6UGZpmPEfqMWhMMYhaSJ/x0CPKgTOI0D1
 bQvNMSHaY6k5qBieM6uC9kGCJfZumgWyQdPgboC+6fnF3Zfy809xY6baoFBEWu/nao9R
 atzkpZutucq5c21XzWczxv4CAwNBQriFY/2eN5zQUNSMczbXQ1kosgGDO32rdDoRg3OT
 8VfQ==
X-Gm-Message-State: AOJu0YwF3nRGaxoqrUYB7oAJRfP4uPfXJEJRKm96XGvvc4Ez35IQzhO+
 s4warPuNUWgNr2ZJrNwhDfgeBQH8a3DtnFDl1/qFx6hW
X-Google-Smtp-Source: AGHT+IH3Skrew8ZIj+wt7wJe7Y7s/HtD1BuYUUfeJmmokMjZLGApwOoYFc/GqnS/qv6lfKQZg+YcnQ==
X-Received: by 2002:ac2:5e66:0:b0:500:91ac:c0b5 with SMTP id
 a6-20020ac25e66000000b0050091acc0b5mr2533261lfr.30.1694014930932; 
 Wed, 06 Sep 2023 08:42:10 -0700 (PDT)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com.
 [209.85.128.42]) by smtp.gmail.com with ESMTPSA id
 bm26-20020a0564020b1a00b005288f0e547esm8634623edb.55.2023.09.06.08.42.10
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 06 Sep 2023 08:42:10 -0700 (PDT)
Received: by mail-wm1-f42.google.com with SMTP id
 5b1f17b1804b1-4009fdc224dso84895e9.1
 for <dri-devel@lists.freedesktop.org>; Wed, 06 Sep 2023 08:42:10 -0700 (PDT)
X-Received: by 2002:a05:600c:5493:b0:3fe:eb42:7ec with SMTP id
 iv19-20020a05600c549300b003feeb4207ecmr129217wmb.1.1694014930015; Wed, 06 Sep
 2023 08:42:10 -0700 (PDT)
MIME-Version: 1.0
References: <20230831080938.47454-1-biju.das.jz@bp.renesas.com>
 <20230831080938.47454-2-biju.das.jz@bp.renesas.com>
In-Reply-To: <20230831080938.47454-2-biju.das.jz@bp.renesas.com>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 6 Sep 2023 08:41:53 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XSmtc=jaHghXYmdPi2VKtfi+AAZEmkbk_AbWRfHxawRA@mail.gmail.com>
Message-ID: <CAD=FV=XSmtc=jaHghXYmdPi2VKtfi+AAZEmkbk_AbWRfHxawRA@mail.gmail.com>
Subject: Re: [PATCH v6 1/4] drm/bridge/analogix/anx78xx: Drop ID table
To: Biju Das <biju.das.jz@bp.renesas.com>
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Zhu Wang <wangzhu9@huawei.com>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Robert Foss <rfoss@kernel.org>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Jonas Karlman <jonas@kwiboo.se>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Helen Koike <helen.koike@collabora.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Thu, Aug 31, 2023 at 1:09=E2=80=AFAM Biju Das <biju.das.jz@bp.renesas.co=
m> wrote:
>
> The driver has an ID table, but it uses the wrong API for retrieving matc=
h
> data and that will lead to a crash, if it is instantiated by user space o=
r
> using ID. From this, there is no user for the ID table and let's drop it
> from the driver as it saves some memory.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> Reviewed-by: Douglas Anderson <dianders@chromium.org>
> Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Reviewed-by: Helen Koike <helen.koike@collabora.com>
> ---
> v5->v6:
>  * No change.
> v4->v5:
>  * Added Rb tag from Andy and Helen.
> v3->v4:
>  * Added Rb tag from Laurent and Douglas Anderson.
> v2->v3:
>  * Updated commit header.
> v1->v2:
>  * Dropped ID table support.
> ---
>  drivers/gpu/drm/bridge/analogix/analogix-anx78xx.c | 7 -------
>  1 file changed, 7 deletions(-)

I think this has had enough time to marinate, so landed to drm-misc-next:

39e0b96d61b6 drm/bridge/analogix/anx78xx: Drop ID table
