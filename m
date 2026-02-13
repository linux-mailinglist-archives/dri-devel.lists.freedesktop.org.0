Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +D3+JZWXjmnXDAEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 13 Feb 2026 04:16:37 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 086B51329A7
	for <lists+dri-devel@lfdr.de>; Fri, 13 Feb 2026 04:16:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3331310E2D5;
	Fri, 13 Feb 2026 03:16:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="RFkkF/bF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-dl1-f54.google.com (mail-dl1-f54.google.com [74.125.82.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E5C510E2D5
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Feb 2026 03:16:33 +0000 (UTC)
Received: by mail-dl1-f54.google.com with SMTP id
 a92af1059eb24-1270adc5121so876283c88.0
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Feb 2026 19:16:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770952592; cv=none;
 d=google.com; s=arc-20240605;
 b=Hw5Mus3EXWdGwNN8iStpTBcmDABLEnmtM0+FBgkRkmyugNUudoudENIYfv/IKj41uR
 oUYO/xqWiAKYy8ELBDVjfddYJVSNH3uJrTwLOykkeXE+000UVjO5yvgAP3jhLRGE6uSc
 SBDV6AuI6lEJb9mTBmmYWQTU6DxzyTuMr0g7JoAFDoBpqv+iwQlzUXr8itf4+xDmUoqS
 qAsBQzMwJZNyF8Hn5o+CL97uiWhRLGvUSO/iCcOwq+LPEtdwoVDU30gDHMRcFzm2W2S9
 GJPUeNvwL4kQVmvTfp0t53QOQs7Qlc5RvVTFzx4kvydQwtr3A5QfX/x+SrXdgzHe2UZT
 ejPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=A9rVs9tfdzKqfLiEuYfz6qxedHCDF85xV49xx0uKo3k=;
 fh=qKLCvpWMx8sDyBxWr2R0WalEyHLB/Zj+DEKt6Dqaz34=;
 b=OlTv3N63nWKhJCek95WmltimtFx6c2vB3rDQC3hdyMrstHRR+7yeODGvH6bEa8tlAg
 P+vV8ggL9fKWjsfqYEHDBCmKVcwRnCKH1+lN9JICzJug+IpqZUdFNvcI0g6WHDEysh5K
 FbKL7s4/qWhp7zOn3VLIwzB9Cx/DvWb5FB4oG28m1VOmVr2BXNITcLiAIVORHVcxnRUx
 LIFWkmXdGqR1jsSZ5DBezu9hUyYZRmP2QnZvWzElLrvGx4ij9e1E3tJ+uxVw2D0ZFLPA
 d3RO3OqjTowWfeuyAF1EkxS7WTuYVIhgXX25+V+GT1/eKiRvFeCtj0iT5UQ18MjBQkZ+
 4oyw==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1770952592; x=1771557392; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=A9rVs9tfdzKqfLiEuYfz6qxedHCDF85xV49xx0uKo3k=;
 b=RFkkF/bFdYBz3OOlMJbMDVoiwIEQ5+9Asu29SrxzYQQb5ZDSbGCwxmxrksLMEM/apf
 0RZF4pS8mz0gUkmvtxyXMqUS9HcIR5BGXd2lqx69d0N7WTL9ov7wX6KeE/6ES6bcIiUn
 NeKdaJmEWkm7y9KHeTYog6uUQFJRANXJ2i2eOBLFZHhzQnFoFeNF4RUa7rfzdkqBGRdL
 b1NCmplFcKr4Xv1aznaXdsd3oMz1bdy5faNP7MsZKqsVG4aMfyRfDJqMokKwJnq3/G7k
 1PLFPwLlSXz4WqVqippbnTMwC70e7DWJ6nJ9Pn6eRQsbjL4RKiSoYkWUxgrIFy/CsHxz
 by9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770952592; x=1771557392;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=A9rVs9tfdzKqfLiEuYfz6qxedHCDF85xV49xx0uKo3k=;
 b=Y4WFQYDDqmOLhMuHHFsDca/4HoCyZ/X+qkA8zhne74h0vAMK9TlCcT1l/bm1HB9SLf
 7A8OBIv19Fn5KpoVc1H3WG7WJm/KgyIcl8cXzzGhVz/XYs9h2CVxjNdOJN8FKB9142SF
 m1jMC2XbV544auk++nxcFxjXnXOjW4H0IYzHahObo64mrU4cSxP14xXDgBcydRJcHhGC
 QFiaBYTcwOiHxqF06MQ1h7FbwUMec+H9vv9Ugp/oNHCMMqnFlWC2Agl5kbNcsOc9+h4s
 lzdzOd/77Q2CezKnJDUDPeAfO0/Z5r5IEus7sDrWwtz6Bc7V+kVJftIhYs1A/AjdYYHV
 QLQg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXfFkArsSe12PHJRDJf0hgtSYuINYDPAyKMDYvM6t5F9LcOdHwZSqpNLHz+E/lCRPOP/Ag39q1D51s=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw/tyQeLMqZ7r4RfM7cso4Kp63MLrAGCMGAF/yK+uHBnBjlovfC
 jRKkrrOz0N3URhpHdRVAppLkhwZ1xqz3VuQx5R2qJ28Tw2zwitSZ85YxhcZhG7zd2OoENuPBdgk
 QdST5NkP3BzJv9Vb8t5YkEAapPKMP5J4=
X-Gm-Gg: AZuq6aKsWEsODASQS5CyuVlfFFw0xO5SK5HL8Qms746P7om+RyUSVmPxtXKpnqEbEbh
 T3vIJn2AJWCGqxxLPhmWA10v6b1WClSFq6O+tuYdGUn0CfSRjeimMug9T6F0H1GJl5j6vwfp+/X
 hnIbnHpfPVTypzeU2ivwFn0g52juL4EmRnsp1fjDhIaj/c73apN6Y1NjBAYsera/hdTLVWh1yYP
 WoB1n+nEj0mB5CU6LZ1FjVPGpMY7ZePj2pzDHZSNnQTjV5yXcT3lbQ8lAQjOsubsxoXn2DJOvFu
 Cv6LfIxxG2N4Ya5zRcFeSXL/C517xXfePj+LMgxLWbqi1sUHMMn3wFFGlUHOd+UP1eUd3nQbFOm
 xkEm2zf7C7T9MF3pmUSJUtFEKof0=
X-Received: by 2002:a05:7022:a91:b0:119:e56b:98ba with SMTP id
 a92af1059eb24-1273ae7fc16mr135317c88.33.1770952592138; Thu, 12 Feb 2026
 19:16:32 -0800 (PST)
MIME-Version: 1.0
References: <20260212-feature_bbge-v1-0-29014a212f35@bootlin.com>
 <20260212-feature_bbge-v1-1-29014a212f35@bootlin.com>
 <B3366A17-641F-4E02-A5D4-978F525E0A96@goldelico.com>
 <20260212174718.7daccb70@kemnade.info>
 <719BF710-26DF-49AB-A016-D2306F0389E2@goldelico.com>
 <20260212231907.6120a2e2@kemnade.info>
In-Reply-To: <20260212231907.6120a2e2@kemnade.info>
From: Robert Nelson <robertcnelson@gmail.com>
Date: Thu, 12 Feb 2026 21:16:05 -0600
X-Gm-Features: AZwV_Qh971-afroyUXRtMyj8ruGTY0KPplbW-K5wj0BVh1d4xjPlxLEG3ejv_GE
Message-ID: <CAOCHtYicmeSzH5Q2_qTwAZw3s+__JRwUrXvz01+KCsJJHAznUw@mail.gmail.com>
Subject: Re: [PATCH 1/5] ARM: dts: ti: Enable overlays for all DTB files
To: Andreas Kemnade <andreas@kemnade.info>
Cc: "H. Nikolaus Schaller" <hns@goldelico.com>,
 "Kory Maincent (TI)" <kory.maincent@bootlin.com>, 
 Aaro Koskinen <aaro.koskinen@iki.fi>, Kevin Hilman <khilman@baylibre.com>, 
 Roger Quadros <rogerq@kernel.org>, Tony Lindgren <tony@atomide.com>,
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Russell King <linux@armlinux.org.uk>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 linux-omap@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 dri-devel@lists.freedesktop.org, Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 Bajjuri Praneeth <praneeth@ti.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Louis Chauvet <louis.chauvet@bootlin.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.81 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[google.com:s=arc-20240605:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:andreas@kemnade.info,m:hns@goldelico.com,m:kory.maincent@bootlin.com,m:aaro.koskinen@iki.fi,m:khilman@baylibre.com,m:rogerq@kernel.org,m:tony@atomide.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux@armlinux.org.uk,m:thomas.petazzoni@bootlin.com,m:linux-omap@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:luca.ceresoli@bootlin.com,m:praneeth@ti.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:louis.chauvet@bootlin.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[robertcnelson@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[23];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[robertcnelson@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,bootlin.com:email,mail.gmail.com:mid,kemnade.info:email,goldelico.com:email]
X-Rspamd-Queue-Id: 086B51329A7
X-Rspamd-Action: no action

On Thu, Feb 12, 2026 at 4:19=E2=80=AFPM Andreas Kemnade <andreas@kemnade.in=
fo> wrote:
>
> On Thu, 12 Feb 2026 17:55:43 +0100
> "H. Nikolaus Schaller" <hns@goldelico.com> wrote:
>
> > > Am 12.02.2026 um 17:47 schrieb Andreas Kemnade <andreas@kemnade.info>=
:
> > >
> > > On Thu, 12 Feb 2026 16:49:43 +0100
> > > "H. Nikolaus Schaller" <hns@goldelico.com> wrote:
> > >
> > >>> Am 12.02.2026 um 16:26 schrieb Kory Maincent (TI) <kory.maincent@bo=
otlin.com>:
> > >>>
> > >>> Allow overlays to be applied to any DTB. This adds around ~40% to t=
he
> > >>> total size of the DTB files on average.
> > >>
> > >> Is this unconditionally enabled or can it be turned off by some CONF=
IG? We have
> > >> our own defconfig so I would not worry if if is enabled in omap2plus=
_defconfig
> > >> and disabled in ours.
> > >>
> > >> We have several devices where the boot loader can't handle overlays =
(never touch
> > >> a working boot-loader :) So this seems to only contribute to build a=
nd load time
> > >> without benefit.
> > >>
> > > As long as you do not add overlays, the bootloader does not care. I w=
ould
> > > like to simply carry around the 1-bit mmc overlay for one broken boar=
d.
> > > That would help me. So I think there is a benefit but nobody forces
> > > you to use it.
> >
> > Well, it does not force to use the really good feature, but it forces t=
o add
> > ~40% more file size and some more compile time, if I understand it corr=
ectly.
> >
> Compile time, hardly measurable even if you just do make dtbs.
>
> Size on disk:
> a) if it lives around in a /boot partitions with kernels and initrams in =
it,
>    then we are around 1% more space needed.
>
> b) if it has separate partitions maybe on some mtd: Looking around: GTA04
>    has quite some headroom left. Usage is still <50% even with symbols
>    enabled.
>
> But on the other no one else seems to enable that besides for devices wit=
h
> open expansion boards carrying "hats". So overall, should we really be th=
e
> exception?

Do we want to maybe transition like TI did for k3?

Start with board specific DTC_FLAGS flags for specific boards:

and then just enabling overlays by default :
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/a=
rch/arm64/boot/dts/ti/Makefile?id=3Dbca4146b1f66dbca07591bfd6ad695c699b5a09=
3

If we do board-specific, all the "Beagle" related items can be auto
enabled `-@`..

Regards,

--=20
Robert Nelson
https://rcn-ee.com/
