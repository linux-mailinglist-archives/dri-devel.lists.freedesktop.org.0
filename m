Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B7B4993ED40
	for <lists+dri-devel@lfdr.de>; Mon, 29 Jul 2024 08:15:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3968510E112;
	Mon, 29 Jul 2024 06:15:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=web.de header.i=markus.elfring@web.de header.b="izVwNPzK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.web.de (mout.web.de [217.72.192.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5BB5010E112
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Jul 2024 06:15:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
 s=s29768273; t=1722233727; x=1722838527; i=markus.elfring@web.de;
 bh=/W4WAd4LZcskmNp9VbPLG3tCL/kPPOMZRrrIa9jaZBk=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=izVwNPzK+zItEVSPpFm5F/PTXQs/nX90f4cMo0mx7aOGDx+Q8ilst9mBg7fQrumN
 pwLnWF1aZmzr/mkFwJq39/GQ1/1iYQ2cVO90OjRuUvHanivPasQZn3IySkyfSXrQ0
 nW+K0rfZrgfqQnqD5IJlsgDXGP9Bpf8dPNoGw02G5HqMWzFMvZIH24hY4eUZfEk+g
 E/i5XdJqxThtNpYEuK5i6JvXXlQTJrwP8iZcnCt5ubAaSn0W8L2ioZ/LWMTdCqymP
 6xzuXAdoctKJD6sP1ypDTWGVS3ddXn1FjBNUifLLRwNYz49s8IOrXZbdGP6q+0XGk
 0d+19+xlbMogT5aRPA==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.91.95]) by smtp.web.de (mrweb106
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1Mm9Zi-1rqQG72xNo-00m3Kc; Mon, 29
 Jul 2024 08:15:27 +0200
Message-ID: <b4f71869-60e2-4e37-9844-58a4f56b12cb@web.de>
Date: Mon, 29 Jul 2024 08:15:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/2] drm/loongson: Introduce component framework support
To: Sui Jingfeng <sui.jingfeng@linux.dev>, dri-devel@lists.freedesktop.org
Cc: LKML <linux-kernel@vger.kernel.org>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>
References: <20240728152858.346211-1-sui.jingfeng@linux.dev>
 <20240728152858.346211-2-sui.jingfeng@linux.dev>
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20240728152858.346211-2-sui.jingfeng@linux.dev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:VXoH1w10BAhMcK6vKxEEaf0g71jR08ATLgbvjFAdW9j/KYwfia1
 a3+pbL+ruZ65I2RVcZPGBeZVKM6ZXiRBpTqRQGOT4xixN7TjMdsWLEbzGD0/3M/aoRgIyBr
 GaCtKqRf4uo0u58D/AFmYrAYxbwAj5OqQ4GiqqR701elIJrJJuLE62xuWPwcElIHDCQ+cF6
 8R83gsvWVWPY2Mr6sfKbQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:RptsJlPhc5o=;sYw1A4uZJKG1w0usXi18qwMayk7
 Di6j3JazHAIS3qmwAO7bHutvS/WhMk8NLlvFyJGW0iBL/5ykofMdRCsZ7jjO79Kb3FZDLQ3kV
 3C5kCWFyA6wn06IbXuFKO0ipblHkzM0r9/wrMcay+pMyiwvR5gv9i9eP2sV++qOOE3b2kiQ/8
 gRDO/kMuY8MrcC3va3NDbaVnJ1hmjLfWJOiSJUbC8A3BmiSS33ROhAFha55LyfSXNgkJbF+rt
 ku61H7NW5gSQrsIqlAMtXelA+xnjH9Mc1bhcQnA/+ZIYWCkUgkLTP1J5m4JrLByAbN6lb+aQg
 re0NaQbqK2UH0madZUZ0DOu2XFiBUWkSEC2OwhWu46pPwJX/KhlxxFR9PshnkwW6ZBZz+rKsV
 GVac16yApZKROtvvxafTDJAqO6q535iTCwhJXyFfq/1xqrdMGp4ihzaSjcK6kGbnKa6dhkOcE
 KIYCHFD/M9HRiGJJ4em6LytZR72y6vsK/NRcawzAdpP0DW4gwGD/eQG5XKcIH1OC0quABDZsJ
 91dFHX8+Ews3KYhWWOr/kjW9BLrmsIHJgRIs4YWKOfjz78IrhSchmgDjw7HwaLrkOYeCHd9gg
 2g/jLu/Nw4K+adA1TWi++YqRmx3jO8lW4Y/9lC9064jl22caWNTbBwjo+egZIndXf6wXzm3G8
 Ur05eumy+tu8xEGKwgC61Ur/s9npbYbxZkyRaA9bKe3PUMN03rl8vEIE+gb+PufGQn0pcACl2
 7U2tiUnmWS3p35sKimM1C+qjFkbzH0HH7+7ht8gYGZq1zVCFHvPW+xkukk9cXERliAzOFRbHx
 NCeTdcY6zN/QcyVDNjkg3bIw==
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
> +++ b/drivers/gpu/drm/loongson/loongson_drv.c
> @@ -0,0 +1,298 @@
=E2=80=A6
> +static int loongson_drm_freeze(struct drm_device *ddev)
> +{
=E2=80=A6
> +	/* unpin all of buffers in the VRAM */
> +	mutex_lock(&ldrm->gem.mutex);
=E2=80=A6
> +	mutex_unlock(&ldrm->gem.mutex);
> +
> +	lsdc_bo_evict_vram(ddev);
=E2=80=A6

Under which circumstances would you become interested to apply a statement
like =E2=80=9Cguard(mutex)(&ldrm->gem.mutex);=E2=80=9D?
https://elixir.bootlin.com/linux/v6.10.2/source/include/linux/mutex.h#L196

Regards,
Markus
