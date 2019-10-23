Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EC591E1E08
	for <lists+dri-devel@lfdr.de>; Wed, 23 Oct 2019 16:23:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F6FC6EAE3;
	Wed, 23 Oct 2019 14:23:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com
 [IPv6:2a00:1450:4864:20::141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E9F96EAE3
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Oct 2019 14:23:21 +0000 (UTC)
Received: by mail-lf1-x141.google.com with SMTP id 195so16252070lfj.6
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Oct 2019 07:23:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=YH0z87/Zrtz0Lhp/VX5YSi7gAAWFFXFWThfAN9xrC5A=;
 b=U90/mK+Z8sKO+8lYk59fuc5n45CVNZVq3JOFfc7uGAv1S0hzBQ9JGXF7TVtm2Oiisj
 K5kKVVnyGIeI4wEF7MOR0y+qaJ8/0VIppejaarx4x0hCOqN0Bfz6x0H5KW2ZgxBzNYoV
 w9DrZxi/vRBp2Fb6Tn+XBsChydis/K3XWnSRxfHK1ODDDXax9kTdsvMnGAqiGRYW5UCE
 pycbGyHm9ifJp/RKMIJFCexumgXQ/l9PR6Q7uP6m888SrspTla93eUzcLPumqO1kPTap
 6Bf/CzJ/JB1BZIkhY6ktJIipwMBK0Y6/KyKcKp1DP2+vVHM3HiQrjLMEOasUK6W7dSSl
 PdTA==
X-Gm-Message-State: APjAAAUEz+oqzL6ZCfQGXMtNUewjk49W05T6riJxqw1dwWS+owjAzku6
 R3f1WwU1ZpscM5mSUlAGeayDMPE3WN34LBWZrGI=
X-Google-Smtp-Source: APXvYqzp6mMJKGG2NsuDu7fFREGtRLh/esmNHeuaAFC2lZsYWFDi3jPGmJ5h5h6sH0SLYyoa0JDTSQUh7r1Hkp6Z3Rs=
X-Received: by 2002:a19:4318:: with SMTP id q24mr8343971lfa.12.1571840599375; 
 Wed, 23 Oct 2019 07:23:19 -0700 (PDT)
MIME-Version: 1.0
References: <20191017081059.31761-1-u.kleine-koenig@pengutronix.de>
 <c89925bd-857d-874f-b74f-c5700d4c9fbd@ysoft.com>
 <20191017101116.3d5okxmto5coecad@pengutronix.de>
 <20191017111131.GB3122066@ulmo>
 <20191017120917.fcb7x4fq4tbl2iat@pengutronix.de>
 <20191017125932.GB3768303@ulmo>
 <aa73b430-527c-8066-ad9c-edab62a05fc9@ysoft.com>
 <20191017151437.GA85210@ulmo>
 <CAHCN7xJduG9yxAhuW6D1_kpd5=p7LhO_YCWjVxcCoW5bmSEJGQ@mail.gmail.com>
 <20191017171326.GA531411@ulmo>
 <CAHCN7xJWco5gTdjmJZRbNqi1aO+ytor5XMJWQX8a38tfGbz+xg@mail.gmail.com>
 <f6d2427d-21fe-e89c-0bfe-572bc1d00863@ysoft.com>
 <CAHCN7xJJH12sdeLb97OutJqThv+TzMaNj-Y50_C9G7UgEQCbxg@mail.gmail.com>
In-Reply-To: <CAHCN7xJJH12sdeLb97OutJqThv+TzMaNj-Y50_C9G7UgEQCbxg@mail.gmail.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Wed, 23 Oct 2019 11:23:11 -0300
Message-ID: <CAOMZO5AgUjA8eSNVM_rKi-7NAX8hj039STcJ4Ov4w-0m4WTf8w@mail.gmail.com>
Subject: Re: [PATCH] backlight: pwm_bl: configure pwm only once per backlight
 toggle
To: Adam Ford <aford173@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=YH0z87/Zrtz0Lhp/VX5YSi7gAAWFFXFWThfAN9xrC5A=;
 b=IFFUl64IT3oIzJIRHPUwGHNSOvF4UjGGjgVIj2F927PpQjnOSJtaHHqSkV159gwzeu
 AwhKtsmMAN+bp2BU40zR6xwzXFKoA3K2vytfQ8S3wjjquCIYqB04JincfVYAsXGAIjxO
 zN++lodFHzzLxO+ei3Yt3op+Ghnh0zBRyzsjuiWgkdn8uC/h0a1IWmtMSVr+l57qtbP4
 fMxMU6Xcj0hldg+QqKzuwwC9ETSji6noaEgk6U0L65bPa0DpljGY3pY7H2lUB/1cPSqd
 MgoZrqFcfZWZzryRkbaZHzHv7TYoWfx9o3AgkMM/r4EhhRkBBFEeoM8cB74le7zbw1ac
 Wsbw==
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Cc: linux-pwm@vger.kernel.org, Daniel Thompson <daniel.thompson@linaro.org>,
 =?UTF-8?B?TWljaGFsIFZva8OhxI0=?= <michal.vokac@ysoft.com>,
 Jingoo Han <jingoohan1@gmail.com>, linux-fbdev@vger.kernel.org,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Sascha Hauer <kernel@pengutronix.de>,
 =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 Lee Jones <lee.jones@linaro.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBPY3QgMjMsIDIwMTkgYXQgMTE6MTYgQU0gQWRhbSBGb3JkIDxhZm9yZDE3M0BnbWFp
bC5jb20+IHdyb3RlOgoKPiBXaGF0IGlzIHRoZSBwbGFuIHRvIGFkZHJlc3MgdGhlIHJlZ3Jlc3Np
b24gZm9yIDUuND8gIEkgd2Fzbid0IHN1cmUgaWYKPiB3ZSdyZSBnb2luZyB0byBhcHBseSB0aGUg
aS5teCBmaXhlcyBvciB0ZW1wb3JhcmlseSByZXZlcnQgdGhlCj4gb2ZmZW5kaW5nIHBhdGNoLCBv
ciBzb21ldGhpbmcgZWxzZS4gKG9yIG1heWJlIG5vdGhpbmcgYXQgYWxsKQoKWWVzLCBJIGRvIHNl
ZSB0aGUgcmVncmVzc2lvbiBvbiBhIGlteDUzIGJvYXJkIHdpdGggNS40LXJjIHRvbyBhbmQgYWxz
bwppbnRlcmVzdGVkIG9uIGEgZml4LgoKVGhhbmtzCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxp
c3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2RyaS1kZXZlbA==
