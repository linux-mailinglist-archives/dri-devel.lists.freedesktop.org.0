Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FCA6ABF912
	for <lists+dri-devel@lfdr.de>; Wed, 21 May 2025 17:20:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2DA0B18AF85;
	Wed, 21 May 2025 15:20:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=web.de header.i=markus.elfring@web.de header.b="PiMrmf1h";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 354 seconds by postgrey-1.36 at gabe;
 Wed, 21 May 2025 15:19:42 UTC
Received: from mout.web.de (mout.web.de [212.227.17.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 50B3A10F171
 for <dri-devel@lists.freedesktop.org>; Wed, 21 May 2025 15:19:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
 s=s29768273; t=1747840776; x=1748445576; i=markus.elfring@web.de;
 bh=C5LycQNaw8orMGc+wS8N/VpLe9ZnVwajk9V2DYFxJTI=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
 cc:content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=PiMrmf1hAR8cSPEVvagODUWe42rDW1+UkXZEbmSPUS2W4X3F61C9Qlp1WZh0c8nd
 ANOvhxObZLaeO5WLipnudmZMjQDmBHbHTFZzBCtAztw3YuI5HbwE1oXfKb2jK5Vfj
 NFQB8Cv/ZwuRtKiuDBsLQwS2owDfq3dVXSS6o8CD0T+KFPWTKl55FLADWiagudu4G
 DBZgSe9Gs9N3ohEPleq3+NwH7vbBThN3GG4R6Ib4xMq7zcSNYV+dyxbyfVOZA2cC+
 +LxiMnhaM8A8qNco21LB+/b6VGGujYoSMgh5UiqamoXVb7Q473xAtaWYF/xKEccPH
 PNT+FSUL7mviANdUww==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.29] ([94.31.69.179]) by smtp.web.de (mrweb106
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MQxo5-1ucsWE39cN-00KZz5; Wed, 21
 May 2025 17:13:05 +0200
Message-ID: <94b0548b-e48a-4bff-8611-116ed89baec3@web.de>
Date: Wed, 21 May 2025 17:13:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Anusha Srivatsa <asrivats@redhat.com>, dri-devel@lists.freedesktop.org,
 David Airlie <airlied@gmail.com>, =?UTF-8?Q?Guido_G=C3=BCnther?=
 <agx@sigxcpu.org>, Icenowy Zheng <icenowy@aosc.io>,
 Jagan Teki <jagan@amarulasolutions.com>, Jagan Teki <jagan@edgeble.ai>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Jianhua Lu <lujianhua000@gmail.com>, Linus Walleij
 <linus.walleij@linaro.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Michael Trimarchi <michael@amarulasolutions.com>,
 Michael Walle <mwalle@kernel.org>, Neil Armstrong
 <neil.armstrong@linaro.org>, =?UTF-8?Q?Ond=C5=99ej_Jirman?= <megi@xff.cz>,
 Simona Vetter <simona@ffwll.ch>, Stefan Mavrodiev <stefan@olimex.com>,
 Thomas Zimmermann <tzimmermann@suse.de>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel@puri.sm
References: <20250520-drivers-mass-convert-part2-v3-0-f7ae7b723c68@redhat.com>
Subject: Re: [PATCH v3 00/30] drm/panel: Use refcounted allocation in place of
 devm_kzalloc() - Part2
Content-Language: en-GB, de-DE
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20250520-drivers-mass-convert-part2-v3-0-f7ae7b723c68@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:pIYsPsnqjhlvG+MZMM0Mt09AD7/edQVHm6fNlQ92k7YSphn40AE
 i7RgsJ6NvjGconXxuFxsFv4cFK24I3XoN9L/gpGWxB7xusG8UyvRfsWi2tr0jCU1OUGKi5C
 JA4M6/RvXaVkpcFc88WiEKre6WqRMbZCSVcR3TLxscVWmTpZ8Ees2yTWsjdoA7mG+Vkwoea
 JiF3vxSLKyt1FJHiCDZNA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:ondSsjl1MiI=;Jdukn4AZBw5zT55Zk54PUYa00ZA
 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
 UYWI=
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

=E2=80=A6
> There are a lot of occurences of the panel allocation across the
> subsystem. Much thanks to Maxime for the semanic patch which actually
> gives a list of panels allocated unsafely.

I imagine that the shown SmPL code can be improved another bit
(like the following).


@find_add@
identifier add_f, b, c;
type T;
@@
 add_f(...)
 {
 ... when any
 T *c;
 ... when any
 drm_panel_add(&c->b);
 ... when any
 }

@find_allocation@
identifier alloc_f, cal;
position p;
type find_add.T;
@@
 alloc_f(...)
 {
 ... when any
 T *cal;
 ... when any
 cal =3D
(      kzalloc
|      devm_kzalloc
)(...)@p;
 ... when any
 }

@script:python@
add_f << find_add.add_f;
alloc_f << find_allocation.alloc_f;
alloc_p << find_allocation.p;
@@
coccilib.report.print_report(alloc_p[0],
                             "ERROR: Panel driver is unsafely allocated in=
 %s and added in %s"
                             % (alloc_f, add_f))


Regards,
Markus
