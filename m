Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D965B71242F
	for <lists+dri-devel@lfdr.de>; Fri, 26 May 2023 12:05:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 05A9010E7D9;
	Fri, 26 May 2023 10:05:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B44A10E7DE
 for <dri-devel@lists.freedesktop.org>; Fri, 26 May 2023 10:05:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1685095505;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LG3N8DT4XtkxWSup6j6+Ux4lt7ZzlfYQe6wlymM94BM=;
 b=QcCUCDbG7BFOfYJw0g+fGW/2818nl9GA+m7woPXGpHn59c6Z50F034naHz8kJLYCE+PgcT
 7M9G8HurJHml7XhnM7I/Jix4luYv3iJQdrI1cv9QdufBqJeMy1PhQj/vuanF8ZnUTsUJa0
 nwaBQLGFcchFZEJD8icGMUuCj+6oWQg=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-230-HB1_xgCxPYmehukbv_Zwug-1; Fri, 26 May 2023 06:05:04 -0400
X-MC-Unique: HB1_xgCxPYmehukbv_Zwug-1
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-3f42bcef2acso2838155e9.2
 for <dri-devel@lists.freedesktop.org>; Fri, 26 May 2023 03:05:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685095503; x=1687687503;
 h=content-transfer-encoding:mime-version:message-id:date:references
 :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=FUVjbXUCqsHJD5Imn0elHIyL11VBFby+G2+E5K6mj1w=;
 b=KNeBWeJ7g+nuzlUSiCyIrWSwx51hrXo1ovgA/Fx9gX6Yn7XTrpyDjYzqe2eDQWXyoK
 qFds1pG/qvopIkYBC8JgJ+G/FuEeMikluarWBcPS8qqm1nEslQ8P9Zl4d75WMgIq/D3C
 V+8AiaOwMgfS5wf2U2ZiWGfA5GuheLqL2OUh+DYPjejDKznBsM5YN8d+Aoz6OV3B8FmF
 NDX/97oaN3zU/uVHvYkj5o1AOrQDhQJlbp8BEsPo3h91+JNZ/3Jn/I3ZJHcJxB7ZpH/M
 sG3bF5iPG30HAFHf64lMdwSYqA8aIZER/nPz8MSfznuwD8u65ErvSR3sQsmHAX+GuMuA
 Qjag==
X-Gm-Message-State: AC+VfDwCPJcbXDZPaB4iJ1heuK/clbMvC2U0+oE2vU7OOmgCNgg/wOFa
 uGuYldFhmcCxOHujLrhtumCjaIDQ9HWxS6JsP7BJfXRXclS3MEbRWG4L/fjFsK3xIT+yx6l7DWh
 fG19YeB/+nQoYorYhrutzPYoPzO8b
X-Received: by 2002:a7b:c4d9:0:b0:3f6:244:55e3 with SMTP id
 g25-20020a7bc4d9000000b003f6024455e3mr895780wmk.35.1685095502957; 
 Fri, 26 May 2023 03:05:02 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4O+PGcB3hPDA3BOc3Y0NueCcMuKZ3kw+zpqPvuF3jNk8EKeK9Y2hx4flWckOsoGfT+sCY3HQ==
X-Received: by 2002:a7b:c4d9:0:b0:3f6:244:55e3 with SMTP id
 g25-20020a7bc4d9000000b003f6024455e3mr895759wmk.35.1685095502610; 
 Fri, 26 May 2023 03:05:02 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 m19-20020a7bcb93000000b003f605566610sm8353757wmi.13.2023.05.26.03.05.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 May 2023 03:05:02 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Kieran Bingham <kieran.bingham@ideasonboard.com>, Daniel Vetter
 <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>, Uwe =?utf-8?Q?Kleine?=
 =?utf-8?Q?-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Subject: Re: [PATCH v2] drm: Switch i2c drivers back to use .probe()
In-Reply-To: <168509448433.130277.3243909863879735319@Monstersaurus>
References: <20230526090709.1517297-1-u.kleine-koenig@pengutronix.de>
 <168509448433.130277.3243909863879735319@Monstersaurus>
Date: Fri, 26 May 2023 12:05:01 +0200
Message-ID: <87zg5rflwy.fsf@minerva.mail-host-address-is-not-set>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
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
Cc: Antonio Borneo <antonio.borneo@foss.st.com>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>, Crt Mori <cmo@melexis.com>,
 Martyn Welch <martyn.welch@collabora.co.uk>,
 Peter Senna Tschudin <peter.senna@gmail.com>,
 Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
 dri-devel@lists.freedesktop.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Guenter Roeck <groeck@chromium.org>,
 Liang He <windhl@126.com>, Marek =?utf-8?Q?Beh=C3=BAn?= <kabel@kernel.org>,
 chrome-platform@lists.linux.dev, Florian Fainelli <f.fainelli@gmail.com>,
 Robert Foss <rfoss@kernel.org>, Stefan Mavrodiev <stefan@olimex.com>,
 Sam Ravnborg <sam@ravnborg.org>, Russell King <linux@armlinux.org.uk>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
 Adrien Grassein <adrien.grassein@gmail.com>, Miguel Ojeda <ojeda@kernel.org>,
 Jagan Teki <jagan@amarulasolutions.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Jonas Karlman <jonas@kwiboo.se>,
 Jiasheng Jiang <jiasheng@iscas.ac.cn>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 linux-rpi-kernel@lists.infradead.org,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Ahmad Fatoum <a.fatoum@pengutronix.de>, Hsin-Yi Wang <hsinyi@chromium.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Xin Ji <xji@analogixsemi.com>, linux-arm-kernel@lists.infradead.org,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Douglas Anderson <dianders@chromium.org>, Phong LE <ple@baylibre.com>,
 kernel@pengutronix.de, Alvin =?utf-8?Q?=C5=A0ipraga?= <alsi@bang-olufsen.dk>,
 Martin Donnelly <martin.donnelly@ge.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Kieran Bingham <kieran.bingham@ideasonboard.com> writes:

Hello Uwe,

> Quoting Uwe Kleine-K=C3=B6nig (2023-05-26 10:07:09)
>> After commit b8a1a4cd5a98 ("i2c: Provide a temporary .probe_new()
>> call-back type"), all drivers being converted to .probe_new() and then
>> 03c835f498b5 ("i2c: Switch .probe() to not take an id parameter") conver=
t
>> back to (the new) .probe() to be able to eventually drop .probe_new() fr=
om
>> struct i2c_driver.
>>=20
>> Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>
>> ---
>> Hello,
>>=20
>> I didn't get feedback for (implicit) v1 that was sent with Message-Id:
>> <20230427175954.666464-1-u.kleine-koenig@pengutronix.de>. This is a
>> rebase on v6.4-rc1 as the former patch doesn't apply cleanly any more.
>>=20
>> I also added more people to Cc, maybe that helps to get feedback.
>
> Having been invovled in b8a1a4cd5a98 ("i2c: Provide a temporary
> .probe_new() call-back type") and definitley expected 'temporary' to
> mean less than 7 years, I very much approve of this patchset.
>
> Thank you for all your efforts Uwe.
>
> Reviewed-by: Kieran Bingham <kieran.bingham@ideasonboard.com>
>

I strongly second what Kieran just said. I was also involved in the commit
mentioned and it is so great to see your efforts to finish that change.

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

--=20
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

