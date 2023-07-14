Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DD80F753381
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jul 2023 09:49:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9FB1E10E7FB;
	Fri, 14 Jul 2023 07:48:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D84210E7FB
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jul 2023 07:48:57 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-3fbc244d384so15002325e9.0
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jul 2023 00:48:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1689320935; x=1691912935;
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
 :date:message-id:reply-to;
 bh=3QpjptWEe+VIO/fnSv61CBVGJqoodwQcJwlBI1/HFzc=;
 b=MQU8BC23rfL4Dy56JGTZFq3hrCDJrWs/CrxfYiAoWhKVmMF/bK3V4DcbQ7RqddmjHM
 FCkutIIwNM0Y2t0pK6V1NY5UTWSertqVCqoESckkVTu0z9RFb+BoQPCxXdvha6bSCViC
 Y0vfyFL6xoyxR7fIp4K2u0S+Z55BjGyvgr8CDLJJgXoc541ro0QZ9w7+wibyL3iv+ykT
 Y6qbylRbPqhUrNFF8ot4oRJlnR/Eiyu7jHgLvalU0uzPwd6mQt88Wis3cTEMawCKcxk7
 xoM/94qFzntqDrfkypbS6xLO/Fzu6HpixHcC7a1M1bGEKdRU5PLthSFLwsTfEdsQNfz5
 yCEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689320935; x=1691912935;
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=3QpjptWEe+VIO/fnSv61CBVGJqoodwQcJwlBI1/HFzc=;
 b=XE98yvLQ5Q7UA8XqfQc0Y0h49rppalsPR/9b3fwC3FlU0/bljO5ouCYsdCSu6A+4rq
 nZaHVeXY0/ypDuUo/0SQcWr9Jdn9qEgwuiio3x1DcpV2heXtLEfQ7Uk2y/Pc23x5EMhh
 WpHKx73uZZ8bl1fk5bwfdS5vQEV/ayLKxgoRV21+e3DM68HEfkUJ7kRfidYXld42d2xd
 2KdnF0RMtT+VG87InGe2DlKCqm+xbLrFGSnDcqiEYqfUfgreol3/lls1KpTnT5NKcDC6
 TJk0FrVe1cuvX0YFfDxKEIpjiDzCRKQXUoOvGVy0Ac3Df0hTjMPy64SLU7eg1nl1T0qD
 RuAw==
X-Gm-Message-State: ABy/qLYP08jC+6F8pJRpfIUpcKYjUyA93H0do9zrhYKKdkGlOhUZ8KK0
 D3fguY6OmUhMvwGaRbWjLjI=
X-Google-Smtp-Source: APBJJlHEKf5mwrmYXECNSguayI7QvgnO7Xg9DEangRk0h9LE6wpUnDrG1u3sWpiikIq8dGUA4Usuvw==
X-Received: by 2002:a05:600c:214c:b0:3fb:dbd0:a7ea with SMTP id
 v12-20020a05600c214c00b003fbdbd0a7eamr3335602wml.37.1689320934886; 
 Fri, 14 Jul 2023 00:48:54 -0700 (PDT)
Received: from ?IPv6:2003:f6:ef05:8700:4ac8:4223:8b53:53c1?
 (p200300f6ef0587004ac842238b5353c1.dip0.t-ipconnect.de.
 [2003:f6:ef05:8700:4ac8:4223:8b53:53c1])
 by smtp.gmail.com with ESMTPSA id
 z16-20020a05600c221000b003fbaa2903f4sm806599wml.19.2023.07.14.00.48.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Jul 2023 00:48:54 -0700 (PDT)
Message-ID: <27105a1712cd7be1d3d36702873f5702999566e7.camel@gmail.com>
Subject: Re: [PATCH] drm: adv7511: Fix low refresh rate register for ADV7533/5
From: Nuno =?ISO-8859-1?Q?S=E1?= <noname.nuno@gmail.com>
To: Fabio Estevam <festevam@gmail.com>, Alexandru Ardelean <alex@shruggie.ro>
Date: Fri, 14 Jul 2023 09:51:23 +0200
In-Reply-To: <CAOMZO5Br-nMxLSekZL5jLHNpyfOH_KgL1WUgAZ25wu86S2eYwA@mail.gmail.com>
References: <20230516164416.11616-1-alex@shruggie.ro>
 <CAOMZO5Br-nMxLSekZL5jLHNpyfOH_KgL1WUgAZ25wu86S2eYwA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.4 
MIME-Version: 1.0
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Bogdan Togorean <bogdan.togorean@analog.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hey Alex,

On Thu, 2023-07-13 at 17:19 -0300, Fabio Estevam wrote:
> On Wed, May 17, 2023 at 4:08=E2=80=AFAM Alexandru Ardelean <alex@shruggie=
.ro> wrote:
> >=20
> > From: Bogdan Togorean <bogdan.togorean@analog.com>
> >=20
> > For ADV7533 and ADV7535 low refresh rate is selected using
> > bits [3:2] of 0x4a main register.
> > So depending on ADV model write 0xfb or 0x4a register.
> >=20
> > Signed-off-by: Bogdan Togorean <bogdan.togorean@analog.com>
> > Signed-off-by: Alexandru Ardelean <alex@shruggie.ro>
>=20
> Should this contain a Fixes tag so that it could be backported to
> stable kernels?

Yeah, most likely yes... With that:

Reviewed-by: Nuno Sa <nuno.sa@analog.com>


