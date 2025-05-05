Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EC359AA961A
	for <lists+dri-devel@lfdr.de>; Mon,  5 May 2025 16:45:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E1DC010E2AE;
	Mon,  5 May 2025 14:45:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="jvzkl9qC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com
 [209.85.221.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E96A010E2AE
 for <dri-devel@lists.freedesktop.org>; Mon,  5 May 2025 14:45:11 +0000 (UTC)
Received: by mail-wr1-f54.google.com with SMTP id
 ffacd0b85a97d-3a07a7b4ac7so1921252f8f.2
 for <dri-devel@lists.freedesktop.org>; Mon, 05 May 2025 07:45:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1746456310; x=1747061110; darn=lists.freedesktop.org;
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
 :date:message-id:reply-to;
 bh=Aak0zC7hFrMtPsSvTJIW47N4jkePCGca82zdtPNT7wQ=;
 b=jvzkl9qCCw+yOQcwAlWdWIyTFKIri+Xh6kqly7V6gINqS/rHQI3/IKzswVDkkTqLe2
 IdMEBhILP3QuoMiClPv3BdWxu7vcf4rM9/AJFhfLJlvUsAf3MsUxgpq2X5U+/TYsF0RZ
 cUaxtllOKes57x2L8xyIkH2Us+yMvv1agR7j/vx45VfKhQchMmq3GXlFiCHoCAMrpOHd
 smljEpiySt8p6vz++p8pkXeMCIxlNG8r8BtSivXBtDmH8uNwn13X2tK1k6SFsNex1Jrz
 gjp+v3eDWZ4rxWfco1NJYRWABiw+cSw6Edo7I8emp9Rw/MQPaWe2ARTpakiqKZTnU38M
 P10g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746456310; x=1747061110;
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Aak0zC7hFrMtPsSvTJIW47N4jkePCGca82zdtPNT7wQ=;
 b=FBv3+JLw+6T2utT1nYXenURYXkrNYsJbBcaMjXOvamO1OS2IS1L/EOdalWdj9Idiu0
 KQIn+43hKId66NIERJSeIZhFW+BHtWKxnUywfhQhyvdQEd4bD+0P62bNUUMlUtuwBBoO
 GUJU8JN4p8f7DGuE5xPd/a77bSB/3BMhtDNU300KxKu5lDN5UCCO5GKiMG7qfD0FHQSm
 jE2paO8K4UOUDRXVCQF0n7jRygBoWAGon2SCxgGoTmYadTHt5wCF+K8aGmaLkqgXpcIm
 sGHClJibj4jk3peF6zTRziCdCpDR/ul7PTpGhqKNLi9b9D9sTnxpR+FCNPQxD6sf7RfB
 5YGA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXM39JsTxzEKRrxKdos43ThvC526GvvG3G+lF2V5T3ry7Ouq15ZfTDl23arjZs3JfPToyvy445eX4A=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxwrVtHCDakEy47O1ToG1i6Ibrfl+JAN3XdwM+wdMcCEZVzdGMe
 zHAW+ecyw06GHT2s5PC6Q09WbykngEwXGPOUoQMKBQJ6bxLPJOnE
X-Gm-Gg: ASbGncsuIdBUdqOFOCzyq3/FPfY6l+P1Ps7ovjZbJq18c3GIXx6iydVqk+bnSjKEWGP
 Vl/zf+b4waiWfYdo6ZC/8EeJ4xzJR0MKGNMEbXojoms4+x5HtuB8YRSl8y1N5zDMSacV/EFEQTX
 Y/1IjpOe/Hl/0jMwMmHxJ0OKrqq2qHYaZDN+Z21DgCoVnlZ4ZYvkIovojbFSBwJ8MYSpjMCeh+p
 eE+hFxiY8gE6EVJd5JDjESxvdKXNSpG6TXgeC4i3T5DsvKeyhsFmfwdAYlRSoYPsEIqwEQhNpS7
 oEGqJ7nDCVMG2A/+cu02gHQINBQy6a4sKmgn8HmLeB79PRTL2licsOWDwIOPIVrtiIJ5iCCkU4a
 AANXVZJAw
X-Google-Smtp-Source: AGHT+IHjK1h3k/XdxelFNq/AmylJkok9PMTAM8PU6xwHm3aH5PDmmrprgcYcfC9J9d+yZNo3RyZVzg==
X-Received: by 2002:a5d:5f41:0:b0:3a0:85b5:463b with SMTP id
 ffacd0b85a97d-3a09fdd83bamr5193375f8f.48.1746456310282; 
 Mon, 05 May 2025 07:45:10 -0700 (PDT)
Received: from ?IPv6:2001:8a0:e602:d900:8437:41c5:1bd4:5790?
 ([2001:8a0:e602:d900:8437:41c5:1bd4:5790])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-441b2b28082sm180278025e9.34.2025.05.05.07.45.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 May 2025 07:45:09 -0700 (PDT)
Message-ID: <ec35d40dcd06ddbcfc0409ffa01aaee22c601716.camel@gmail.com>
Subject: Re: [PATCH v1] drm/bridge: cdns-dsi: Replace deprecated
 UNIVERSAL_DEV_PM_OPS()
From: Vitor Soares <ivitro@gmail.com>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: Vitor Soares <vitor.soares@toradex.com>,
 dri-devel@lists.freedesktop.org,  linux-kernel@vger.kernel.org, Aradhya
 Bhatia <aradhya.bhatia@linux.dev>,  Jayesh Choudhary <j-choudhary@ti.com>,
 stable@vger.kernel.org, Andrzej Hajda <andrzej.hajda@intel.com>, Neil
 Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman
 <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>,  Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>,  Simona Vetter <simona@ffwll.ch>
Date: Mon, 05 May 2025 15:45:08 +0100
In-Reply-To: <fbde0659-78f3-46e4-98cf-d832f765a18b@ideasonboard.com>
References: <20250428094048.1459620-1-ivitro@gmail.com>
 <fbde0659-78f3-46e4-98cf-d832f765a18b@ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.4-0ubuntu2 
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 2025-04-29 at 09:32 +0300, Tomi Valkeinen wrote:
> Hi,
>=20
> On 28/04/2025 12:40, Vitor Soares wrote:
> > From: Vitor Soares <vitor.soares@toradex.com>
> >=20
> > The deprecated UNIVERSAL_DEV_PM_OPS() macro uses the provided callbacks
> > for both runtime PM and system sleep. This causes the DSI clocks to be
> > disabled twice: once during runtime suspend and again during system
> > suspend, resulting in a WARN message from the clock framework when
> > attempting to disable already-disabled clocks.
> >=20
> > [=C2=A0=C2=A0 84.384540] clk:231:5 already disabled
> > [=C2=A0=C2=A0 84.388314] WARNING: CPU: 2 PID: 531 at /drivers/clk/clk.c=
:1181
> > clk_core_disable+0xa4/0xac
> > ...
> > [=C2=A0=C2=A0 84.579183] Call trace:
> > [=C2=A0=C2=A0 84.581624]=C2=A0 clk_core_disable+0xa4/0xac
> > [=C2=A0=C2=A0 84.585457]=C2=A0 clk_disable+0x30/0x4c
> > [=C2=A0=C2=A0 84.588857]=C2=A0 cdns_dsi_suspend+0x20/0x58 [cdns_dsi]
> > [=C2=A0=C2=A0 84.593651]=C2=A0 pm_generic_suspend+0x2c/0x44
> > [=C2=A0=C2=A0 84.597661]=C2=A0 ti_sci_pd_suspend+0xbc/0x15c
> > [=C2=A0=C2=A0 84.601670]=C2=A0 dpm_run_callback+0x8c/0x14c
> > [=C2=A0=C2=A0 84.605588]=C2=A0 __device_suspend+0x1a0/0x56c
> > [=C2=A0=C2=A0 84.609594]=C2=A0 dpm_suspend+0x17c/0x21c
> > [=C2=A0=C2=A0 84.613165]=C2=A0 dpm_suspend_start+0xa0/0xa8
> > [=C2=A0=C2=A0 84.617083]=C2=A0 suspend_devices_and_enter+0x12c/0x634
> > [=C2=A0=C2=A0 84.621872]=C2=A0 pm_suspend+0x1fc/0x368
> >=20
> > To address this issue, replace UNIVERSAL_DEV_PM_OPS() with
> > DEFINE_RUNTIME_DEV_PM_OPS(), which avoids redundant suspend/resume call=
s
> > by checking if the device is already runtime suspended.
> >=20
> > Cc: <stable@vger.kernel.org> # 6.1.x
> > Fixes: e19233955d9e ("drm/bridge: Add Cadence DSI driver")
> > Signed-off-by: Vitor Soares <vitor.soares@toradex.com>
> > ---
> > =C2=A0 drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c | 10 +++++-----
> > =C2=A0 1 file changed, 5 insertions(+), 5 deletions(-)
> >=20
> > diff --git a/drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c
> > b/drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c
> > index b022dd6e6b6e..62179e55e032 100644
> > --- a/drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c
> > +++ b/drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c
> > @@ -1258,7 +1258,7 @@ static const struct mipi_dsi_host_ops cdns_dsi_op=
s =3D {
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0.transfer =3D cdns_dsi_=
transfer,
> > =C2=A0 };
> > =C2=A0=20
> > -static int __maybe_unused cdns_dsi_resume(struct device *dev)
> > +static int cdns_dsi_resume(struct device *dev)
> > =C2=A0 {
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0struct cdns_dsi *dsi =
=3D dev_get_drvdata(dev);
> > =C2=A0=20
> > @@ -1269,7 +1269,7 @@ static int __maybe_unused cdns_dsi_resume(struct
> > device *dev)
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0return 0;
> > =C2=A0 }
> > =C2=A0=20
> > -static int __maybe_unused cdns_dsi_suspend(struct device *dev)
> > +static int cdns_dsi_suspend(struct device *dev)
> > =C2=A0 {
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0struct cdns_dsi *dsi =
=3D dev_get_drvdata(dev);
> > =C2=A0=20
> > @@ -1279,8 +1279,8 @@ static int __maybe_unused cdns_dsi_suspend(struct
> > device *dev)
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0return 0;
> > =C2=A0 }
> > =C2=A0=20
> > -static UNIVERSAL_DEV_PM_OPS(cdns_dsi_pm_ops, cdns_dsi_suspend,
> > cdns_dsi_resume,
> > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NULL);
> > +static DEFINE_RUNTIME_DEV_PM_OPS(cdns_dsi_pm_ops, cdns_dsi_suspend,
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 cdns_dsi_resume, NULL);
>=20
> I'm not sure if this, or the UNIVERSAL_DEV_PM_OPS, is right here. When=
=20
> the system is suspended, the bridge drivers will get a call to the=20
> *_disable() hook, which then disables the device. If the bridge driver=
=20
> would additionally do something in its system suspend hook, it would=20
> conflict with normal disable path.
>=20
> I think bridges/panels should only deal with runtime PM.
>=20
> =C2=A0 Tomi
>=20

In the proposed change, we make use of pm_runtime_force_suspend() during
system-wide suspend. If the device is already suspended, this call is a
no-op and disables runtime PM to prevent spurious wakeups during the
suspend period. Otherwise, it triggers the device=E2=80=99s runtime_suspend=
()
callback.

I briefly reviewed other bridge drivers, and those that implement runtime
PM appear to follow a similar approach, relying solely on runtime PM
callbacks and using pm_runtime_force_suspend()/resume() to handle
system-wide transitions.

Best regards,
Vitor Soares

