Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E8BBF70177C
	for <lists+dri-devel@lfdr.de>; Sat, 13 May 2023 15:43:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5BE1C10E0BF;
	Sat, 13 May 2023 13:43:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 06D4810E0BF
 for <dri-devel@lists.freedesktop.org>; Sat, 13 May 2023 13:43:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683985432;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9DB3tShWsmKkupSG4kjkSPgdjSDVuKYI2Ix/HxUCEp4=;
 b=LBYaZTyg9JeTRgrq5b0RG9NGoWpWfb45uBcbo9s0TXNSCsfBlK9cQXDLUwuip2VCUPDRuz
 WQUUIp0A5ekT1Jbp91t+yQf2KPm1bA8shMH4da81MHbxOYrqYXbxi5+FjfZh0JINaB3lRf
 7odei2rnSurutWyqUkXcVyEIG9XqxjA=
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com
 [209.85.221.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-531-c8Pl_lCrMJmg0AtzDf_33w-1; Sat, 13 May 2023 09:43:51 -0400
X-MC-Unique: c8Pl_lCrMJmg0AtzDf_33w-1
Received: by mail-vk1-f198.google.com with SMTP id
 71dfb90a1353d-450ddbc9431so2322630e0c.2
 for <dri-devel@lists.freedesktop.org>; Sat, 13 May 2023 06:43:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683985430; x=1686577430;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9DB3tShWsmKkupSG4kjkSPgdjSDVuKYI2Ix/HxUCEp4=;
 b=f5gNsiQ6MG3J6i/7EWEdyzLNdOLRu1d5NQ8J6pgcK1+ziljtJQp9abugS1X3fl6L76
 EwFjYWYnMr0BRWq/d0V51FADE145H4uCQ5iGaXRFBYiPW/7BUmwQcgZEyC+DQbLZyQ4Q
 JP76xnZDNf8c+MBQum/L2syaF3rhJofVDwohX8WpYyzX0j1egaR5EbT6a1ZrYq7tTI0a
 X4TSHkg4jZqJXWk4R26eD4xpsW2QUYwHLM3gGTBcVhT2mVUhxDGThn6PzpH5j1ktliG+
 RJuduLFNX3b0FjlcUReB+INH39gh209OgoRX2kivuKEh9qA4HYUayTmU/1qKPjcZ/MBK
 SkEw==
X-Gm-Message-State: AC+VfDzqKWUYB8FBCZHn0vQRnrfMtS5C3+Z+xg/O3OFMSZMO+zymns+D
 AEWeyZqmbq+qg3FmkENUf5s/9yFpucXGFtxhmXR7t28WjgrfogmYZnVBrwgHI0N4yEBlL942ZlI
 uKxmG6KgyuaPkxaQ7rOvHNS9fG2QlWGvT1JNQsCknVXOk
X-Received: by 2002:a1f:cf44:0:b0:43c:6e7d:60b0 with SMTP id
 f65-20020a1fcf44000000b0043c6e7d60b0mr8278768vkg.15.1683985430632; 
 Sat, 13 May 2023 06:43:50 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6OKoxadeHskX30zk/2SxsIYXX7yuqtDMX0XJgUO0uD/088ZwUUrLZ6CEQ62Rv0aKLCGZw53hFwRxRMhCBVNTA=
X-Received: by 2002:a1f:cf44:0:b0:43c:6e7d:60b0 with SMTP id
 f65-20020a1fcf44000000b0043c6e7d60b0mr8278732vkg.15.1683985430363; Sat, 13
 May 2023 06:43:50 -0700 (PDT)
MIME-Version: 1.0
References: <20230512100620.36807-1-bagasdotme@gmail.com>
 <20230512100620.36807-9-bagasdotme@gmail.com>
 <CAC1cPGy=78yo2XcJPNZVvdjBr2-XzSq76JrAinSe42=sNdGv3w@mail.gmail.com>
 <ef31b33f-8e66-4194-37e3-916b53cf7088@gmail.com>
In-Reply-To: <ef31b33f-8e66-4194-37e3-916b53cf7088@gmail.com>
From: Richard Fontana <rfontana@redhat.com>
Date: Sat, 13 May 2023 09:43:39 -0400
Message-ID: <CAC1cPGzznK8zoLaT1gBjpHP1eKFvTKKi+SW6xuXF3B8aHN27=g@mail.gmail.com>
Subject: Re: [PATCH v2 08/10] drivers: watchdog: Replace GPL license notice
 with SPDX identifier
To: Bagas Sanjaya <bagasdotme@gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
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
Cc: Kate Stewart <kstewart@linuxfoundation.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Simon Horman <simon.horman@corigine.com>,
 Dominik Brodowski <linux@dominikbrodowski.net>,
 Eric Dumazet <edumazet@google.com>, Jonas Jensen <jonas.jensen@gmail.com>,
 Robert Jarzmik <robert.jarzmik@free.fr>, Andy Gospodarek <andy@greyhouse.net>,
 Sylver Bruneau <sylver.bruneau@googlemail.com>, Marc Zyngier <maz@kernel.org>,
 Linux Staging Drivers <linux-staging@lists.linux.dev>,
 Linux SPDX Licenses <linux-spdx@vger.kernel.org>,
 Oleg Drokin <green@crimea.edu>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Andrey Panin <pazke@donpac.ru>,
 Guenter Roeck <linux@roeck-us.net>, Sam Creasey <sammy@sammy.net>,
 Linux Watchdog Devices <linux-watchdog@vger.kernel.org>,
 Manivannan Sadhasivam <mani@kernel.org>, Jay Vosburgh <j.vosburgh@gmail.com>,
 Jan Kara <jack@suse.com>,
 Linux Kernel Actions <linux-actions@lists.infradead.org>,
 Haojian Zhuang <haojian.zhuang@gmail.com>, Andrew Sharp <andy.sharp@lsi.com>,
 Linux DRI Development <dri-devel@lists.freedesktop.org>,
 David Airlie <airlied@redhat.com>, Thomas Gleixner <tglx@linutronix.de>,
 Wim Van Sebroeck <wim@linux-watchdog.org>,
 Mika Westerberg <mika.westerberg@linux.intel.com>,
 Ray Lehtiniemi <rayl@mail.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Alan Cox <alan@linux.intel.com>, Alessandro Zummo <a.zummo@towertech.it>,
 Karsten Keil <isdn@linux-pingi.de>, Linux Networking <netdev@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 =?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>,
 Denis Turischev <denis@compulab.co.il>,
 Diederik de Haas <didi.debian@cknow.org>,
 Philippe Ombredanne <pombredanne@nexb.com>,
 "David S. Miller" <davem@davemloft.net>, Daniel Mack <daniel@zonque.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, May 13, 2023 at 6:53=E2=80=AFAM Bagas Sanjaya <bagasdotme@gmail.com=
> wrote:
>
> On 5/12/23 19:46, Richard Fontana wrote:
> > On Fri, May 12, 2023 at 6:07=E2=80=AFAM Bagas Sanjaya <bagasdotme@gmail=
.com> wrote:
> >
> >
> >> diff --git a/drivers/watchdog/sb_wdog.c b/drivers/watchdog/sb_wdog.c
> >> index 504be461f992a9..822bf8905bf3ce 100644
> >> --- a/drivers/watchdog/sb_wdog.c
> >> +++ b/drivers/watchdog/sb_wdog.c
> >> @@ -1,3 +1,4 @@
> >> +// SPDX-License-Identifier: GPL-1.0+
> >>  /*
> >>   * Watchdog driver for SiByte SB1 SoCs
> >>   *
> >> @@ -38,10 +39,6 @@
> >>   *     (c) Copyright 1996 Alan Cox <alan@lxorguk.ukuu.org.uk>,
> >>   *                                             All Rights Reserved.
> >>   *
> >> - *     This program is free software; you can redistribute it and/or
> >> - *     modify it under the terms of the GNU General Public License
> >> - *     version 1 or 2 as published by the Free Software Foundation.
> >
> > Shouldn't this be
> > // SPDX-License-Identifier: GPL-1.0 OR GPL-2.0
> > (or in current SPDX notation GPL-1.0-only OR GPL-2.0-only) ?
> >
>
> Nope, as it will fail spdxcheck.py. Also, SPDX specification [1]
> doesn't have negation operator (NOT), thus the licensing requirement
> on the above notice can't be expressed reliably in SPDX here.
>
> [1]: https://spdx.github.io/spdx-spec/v2.3/SPDX-license-expressions/

The GPL identifiers in recent versions of SPDX include an `-only` and
an `-or-later` variant. So I don't see why you can't represent it as
`GPL-1.0-only OR GPL-2.0-only`. From what I understand the kernel
requires/prefers use of the earlier approach to GPL identifiers (which
was better in my opinion) under which `GPL-1.0 OR GPL-2.0` would at
least be semantically similar. I don't see why you need a negation
operator in this case. You have other patches where you used the
`-only` identifiers.

Richard

