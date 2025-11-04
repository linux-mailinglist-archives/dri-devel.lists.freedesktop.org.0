Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C64F2C2FBF2
	for <lists+dri-devel@lfdr.de>; Tue, 04 Nov 2025 09:01:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B4ED810E042;
	Tue,  4 Nov 2025 08:00:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=web.de header.i=markus.elfring@web.de header.b="P7NDqxTr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.web.de (mout.web.de [212.227.17.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 40A1110E042
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Nov 2025 08:00:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
 s=s29768273; t=1762243251; x=1762848051; i=markus.elfring@web.de;
 bh=hhz2X8iMqr1a8u4yGbTY7EoJyJceNYVntNcmYCAHrUA=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=P7NDqxTr2hlhDoWkTKklPgckrapgdF6B+4UVdBaNfLRUA35EsDZbr6HG47KT1gnj
 PGY2xa1teu2jt6t22gFYqsjtB5XkC9M4baQH9kwOiewGeQ01vQdjJnOGvwn2bQRBC
 kgjAd0HMaNCBDeVzYiNebE/a/bHZ0wFK8idKKeXSlh2iRy+l9wPN4pMKYHYPARz4/
 q5Wt3YGKMWWOt/wyITiZPSy8YF3sZ6ptm8yxQJxQH63btNLmLEG7eb3Zs5UQxKjb2
 CfOdWzjJ8e/jEfmN3SAZNfyrvUbozObD7u5iY9BjoVdhexCXEwJSnlM2/sFVSNHpX
 McAnuCE1VQxYBFsiqA==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.29] ([94.31.92.227]) by smtp.web.de (mrweb105
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1N8n08-1wLieD0x0A-00vqsJ; Tue, 04
 Nov 2025 09:00:51 +0100
Message-ID: <4f6f8ef7-0095-4d76-a96b-9a78031e9ca3@web.de>
Date: Tue, 4 Nov 2025 09:00:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm: sti: fix device leaks at component probe
To: =?UTF-8?Q?Rapha=C3=ABl_Gallais-Pou?= <rgallaispou@gmail.com>,
 Johan Hovold <johan@kernel.org>, dri-devel@lists.freedesktop.org
Cc: stable@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
 Alain Volmat <alain.volmat@foss.st.com>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 David Airlie <airlied@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 Thomas Zimmermann <tzimmermann@suse.de>
References: <20250922122012.27407-1-johan@kernel.org>
 <d1c2e56b-2ef9-4ab1-a4f8-3834d1857386@web.de> <aQj69wzTceDklx2Y@thinkstation>
Content-Language: en-GB, de-DE
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <aQj69wzTceDklx2Y@thinkstation>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:qmSNMYXLjCRUwbqJNYdpA1qr1VQNU89RD+9UtJMfiOpgeoOOfPJ
 +AtYkOj6H5hHIkXEqLw6WQ5xmXjOiwhG+ck5argKQ7xYGVclBh91BuEiiyCoFFOeeFZaDQ1
 7cDde+nGGZRESvuZQM7CJrp/T8kR3fyS2ov5gfcn4uLr++iFJ1fICtXsH3iO/XxJOm1HWCl
 xnD2QOvWTTGkbBc2eZkKQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:3lZRLDAHVv4=;+O2K6/ugtZpAHTPwVOaxR53lq8L
 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
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

=E2=80=A6> +++ w/drivers/gpu/drm/sti/sti_vtg.c
> @@ -142,7 +142,7 @@ struct sti_vtg {
>=20
>  struct sti_vtg *of_vtg_find(struct device_node *np)
>  {
> -       struct platform_device *pdev;
> +       struct platform_device *pdev __free(put_device) =3D NULL;
=E2=80=A6

The scope may be reduced for such a variable.

Regards,
Markus
