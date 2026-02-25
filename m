Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kFbVEURCn2laZgQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 25 Feb 2026 19:41:08 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 96F9F19C602
	for <lists+dri-devel@lfdr.de>; Wed, 25 Feb 2026 19:41:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6720210E199;
	Wed, 25 Feb 2026 18:41:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Jjyg87s6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com
 [209.85.221.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7DFD610E199
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Feb 2026 18:41:02 +0000 (UTC)
Received: by mail-wr1-f46.google.com with SMTP id
 ffacd0b85a97d-436317c80f7so882365f8f.1
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Feb 2026 10:41:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1772044861; x=1772649661; darn=lists.freedesktop.org;
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
 :date:message-id:reply-to;
 bh=h0CMShhitdpQ//FqeZ9cEIzrxTRnPPpN5zlMplF2C/0=;
 b=Jjyg87s6oNlYYm3/chYVG2K5YEZB/WCocaHAwkDqWR9nSOrTOFEykIkxXDlZvDVA05
 VQtE4cCAWR87UfKinHCYuNqyq6QoQAWjcavjIEcs5CsN2OneyJJSiYJIxitCgSFks/Jl
 L5GSAQYAvS53riRwFZmPdR4BQxNJT/wqzDwrSOEUjQmWtvGJA/oZ2xHAZmiq+wQckixR
 h3Ov5rRvEAq5p3X79UCNuCI+WeHzbO4L3Gi7TxHFewN+l4S8F1Kq3GumAHezKIwjpveu
 1dqcivxyZV5I7GTz5EmcMux+XE9KXXQqw88j5/cFkfNDuGGDLkGW5K4DyuQ/GgDT/UjF
 dOKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772044861; x=1772649661;
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=h0CMShhitdpQ//FqeZ9cEIzrxTRnPPpN5zlMplF2C/0=;
 b=lm/hfeZx9BXcQYnQzudOoB4qiMRCVcrV2GRDU6Kp2W3E+Igr25WyCPj8b5rOI7+/36
 NGvCr8DoqQrQabr/Y1kqWkPVbzRqx6urfjg/XddkZu2Ild/p5iAKEVB6mjjcdWcvGssN
 agRo4zh9py+01xvSITQdczriZVFGNU5o9F1UiqihGT/X+gdsZ1daCNsOKR5wZbz9v5lh
 H+kinA0kYygre15avvPVlBqoZgqFdbVoxZ/iuvR20rzGMqfj1ue4EZKTJBJqOP5bLvd4
 L+vLDtSfJX32lSzs+PYzRYfA+KU1VX+Xe9ZdAtg/V77slL3In6+HKGDqQPbDo3tJcvpX
 ksHQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUl2mwYOd01r1QST5hMvuhu8XMYeNHA9HyURHGdrw0w/6BzvxCPV56KDSQY5hT0Ltp61PrZssknVhI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw5DhsrA4Lx94hromHiBMRBlji+vWKTyF/ZBkuPkEC387v08uND
 kgjW1p71y2WtXiYb9jOFSqgygKxTqhkI5uv4xys0XcSKUAj58zqUYM2l
X-Gm-Gg: ATEYQzwTRuITwRPJIAtH4zBF2IpBcZ6lFEJw801s9KnzotPXARWL6CjIX7LlwJdzCPG
 AGlR/onTD45hO7E+igPLj4EZFwIOccNEg7+KdbS3JEb26cs/83e7SlVBI+qOQo1g7pV9eRBl5nC
 gReI7GJI2b1xlt2kSAQDIa4kfCxYPzikPBiHMrK7xS9yQjjUjCxL+3yf/RX1K1HkC20BV8DNq6V
 Mfj+NcaL2q3rnpP0FjlzUmbgE0bJt1l/3UVqCCkCilRFgxplSNfO/KDsacQ6Lp8uurekO2/VQOP
 oqOYnMiZyk5ZL00i/WgsSut8Sq+tUG8Vl87vGqXMrdjHvdb2ROo1Bi3UbWnrVNb0m25IFFYrw3x
 jjL/AIGJgLNMKLA5mzoPiXJ3U+77biVkBP/pn/9sHA/3rEL8JMVNJ6020ik/dVvavWO8k5T7vrI
 ZPkcYoLtg/K2i5R2PVTiwuSce0VXdtS7WC1R35
X-Received: by 2002:a05:6000:290d:b0:439:96fc:e593 with SMTP id
 ffacd0b85a97d-4399716a3d9mr204358f8f.0.1772044860354; 
 Wed, 25 Feb 2026 10:41:00 -0800 (PST)
Received: from [192.168.100.3] ([105.163.157.182])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43970d4c977sm38378745f8f.32.2026.02.25.10.40.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Feb 2026 10:40:59 -0800 (PST)
Message-ID: <91997f8f105ca2ef150c605e1045e010524d1135.camel@gmail.com>
Subject: Re: [PATCH RFT] drm/bridge: dw-hdmi: Replace calls to deprecated
 HDMI/audio detection functions
From: Erick Karanja <karanja99erick@gmail.com>
To: Maxime Ripard <mripard@kernel.org>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong	
 <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, Maarten
 Lankhorst	 <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann
 <tzimmermann@suse.de>,  David Airlie <airlied@gmail.com>, Simona Vetter
 <simona@ffwll.ch>, Laurent Pinchart	 <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Liu Ying <victor.liu@nxp.com>, Dmitry Baryshkov	
 <dmitry.baryshkov@oss.qualcomm.com>, Luca Ceresoli
 <luca.ceresoli@bootlin.com>,  Shengjiu Wang <shengjiu.wang@nxp.com>, Andy
 Yan <andy.yan@rock-chips.com>, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org
Date: Wed, 25 Feb 2026 21:40:44 +0300
In-Reply-To: <20260225-lush-dexterous-chimpanzee-ebdb6a@houat>
References: <20260225093051.12031-1-karanja99erick@gmail.com>
 <20260225-lush-dexterous-chimpanzee-ebdb6a@houat>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-4 
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.19 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:mripard@kernel.org,m:andrzej.hajda@intel.com,m:neil.armstrong@linaro.org,m:rfoss@kernel.org,m:maarten.lankhorst@linux.intel.com,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:Laurent.pinchart@ideasonboard.com,m:jonas@kwiboo.se,m:jernej.skrabec@gmail.com,m:victor.liu@nxp.com,m:dmitry.baryshkov@oss.qualcomm.com,m:luca.ceresoli@bootlin.com,m:shengjiu.wang@nxp.com,m:andy.yan@rock-chips.com,m:linux-kernel@vger.kernel.org,m:jernejskrabec@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[karanja99erick@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	FREEMAIL_CC(0.00)[intel.com,linaro.org,kernel.org,linux.intel.com,suse.de,gmail.com,ffwll.ch,ideasonboard.com,kwiboo.se,nxp.com,oss.qualcomm.com,bootlin.com,rock-chips.com,lists.freedesktop.org,vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[karanja99erick@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-0.996];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 96F9F19C602
X-Rspamd-Action: no action

On Wed, 2026-02-25 at 11:11 +0100, Maxime Ripard wrote:
> Hi,
>=20
> On Wed, Feb 25, 2026 at 12:30:50PM +0300, Erick Karanja wrote:
> > Replace calls to the deprecated drm_detect_hdmi_monitor() and
> > drm_detect_monitor_audio() functions. Calling
> > drm_edid_connector_update()
> > updates connector->display_info.is_hdmi and connector-
> > >display_info.has_audio.
> > The driver should read these fields from connector->display_info
> > instead of
> > calling the deprecated functions directly.
> >=20
> > Signed-off-by: Erick Karanja <karanja99erick@gmail.com>
> > ---
> > =C2=A0drivers/gpu/drm/bridge/synopsys/dw-hdmi.c | 17 +++--------------
> > =C2=A01 file changed, 3 insertions(+), 14 deletions(-)
> >=20
> > diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
> > b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
> > index 3b77e73ac0ea..ddc4ae40d94e 100644
> > --- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
> > +++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
> > @@ -2472,7 +2472,6 @@ static const struct drm_edid
> > *dw_hdmi_edid_read(struct dw_hdmi *hdmi,
> > =C2=A0						struct
> > drm_connector *connector)
> > =C2=A0{
> > =C2=A0	const struct drm_edid *drm_edid;
> > -	const struct edid *edid;
> > =C2=A0
> > =C2=A0	if (!hdmi->ddc)
> > =C2=A0		return NULL;
> > @@ -2482,19 +2481,9 @@ static const struct drm_edid
> > *dw_hdmi_edid_read(struct dw_hdmi *hdmi,
> > =C2=A0		dev_dbg(hdmi->dev, "failed to get edid\n");
> > =C2=A0		return NULL;
> > =C2=A0	}
> > -
> > -	/*
> > -	 * FIXME: This should use connector->display_info.is_hdmi
> > and
> > -	 * connector->display_info.has_audio from a path that has
> > read the EDID
> > -	 * and called drm_edid_connector_update().
> > -	 */
> > -	edid =3D drm_edid_raw(drm_edid);
> > -
> > -	dev_dbg(hdmi->dev, "got edid: width[%d] x height[%d]\n",
> > -		edid->width_cm, edid->height_cm);
> > -
> > -	hdmi->sink_is_hdmi =3D drm_detect_hdmi_monitor(edid);
> > -	hdmi->sink_has_audio =3D drm_detect_monitor_audio(edid);
> > +	drm_edid_connector_update(connector, drm_edid);
> > +	hdmi->sink_is_hdmi =3D connector->display_info.is_hdmi;
> > +	hdmi->sink_has_audio =3D connector->display_info.has_audio;
>=20
> You should get rid of sink_is_hdmi and sink_has_audio, and you'll
> don't
> need to call any function anymore, deprecated or otherwise.
Thank you, sending v2
>=20
> Maxime
