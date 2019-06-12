Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B4B1A433A9
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jun 2019 09:31:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 42F3F89359;
	Thu, 13 Jun 2019 07:28:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x341.google.com (mail-ot1-x341.google.com
 [IPv6:2607:f8b0:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7AF99892D8
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jun 2019 16:45:40 +0000 (UTC)
Received: by mail-ot1-x341.google.com with SMTP id r6so11794174oti.3
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jun 2019 09:45:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=CNP0NMj08mCW8K02m4hUNCl6YwEYelJXNU37gxYzY+0=;
 b=lA74XTAQjao9lxu+EPESGAs7dIK+h7uyGPdZ/juiyCksUykGRmpek4ASilRe0QJOcJ
 rUW+HL/Yi1SFsrAM5p4oBkjaeI4eYrpz8fGgmEarF4b1MOzR69/QMvKd/QmatNhl4Um6
 jqvt6RGralChvqfsxuZqLcXljRNdn4k81lcN90YrL+jTmZa4Pp3Zxgfwfy1jFPq1Di5+
 ZHS6NkEBRQLwWbRy27Z0k8Xr2RK07EyzqHnj+gM+G+N6w2LVxYaJGoFKM4t4vY6YoxCO
 eR6A6YT3QW4QBdG6aIwxSCQ1kO6UzmlgFlwaNUFj5Os4FCI74rBgvxD689fay1vCS7RU
 Pn5g==
X-Gm-Message-State: APjAAAUHfDZRmWdO8bg5M85PwhMgKoHv61W06R+meVub4BOTGqnT0AZu
 07QtZY+Aa61cz76pxOvrOUi4oZPHtHk7AUGqHZM=
X-Google-Smtp-Source: APXvYqzkwPKG3MvQBPORpC53QvynuIczHv42PmmLzCUVFQwWpdtKUdtJiqMBX55VXg2Id5JAuafgUPageUVjwVdpsQE=
X-Received: by 2002:a05:6830:16:: with SMTP id
 c22mr4458945otp.116.1560357939699; 
 Wed, 12 Jun 2019 09:45:39 -0700 (PDT)
MIME-Version: 1.0
References: <20190611110052.iw6qbw2yvypxus6t@shell.armlinux.org.uk>
 <E1haeXI-0001y0-S5@rmk-PC.armlinux.org.uk>
 <CAGngYiWT5xsVgP4R=LPozpxFwdoCtpGSn76fwWEDiNXtYzBA9g@mail.gmail.com>
 <20190612162812.ovy6wu3fmck5mmp4@shell.armlinux.org.uk>
 <CAGngYiWiKUknxkMxyoKVDHk07EiPGdxVaOiXfTd3ieDow3roAA@mail.gmail.com>
 <20190612164219.vkzprvfp4mesycct@shell.armlinux.org.uk>
In-Reply-To: <20190612164219.vkzprvfp4mesycct@shell.armlinux.org.uk>
From: Sven Van Asbroeck <thesven73@gmail.com>
Date: Wed, 12 Jun 2019 12:45:28 -0400
Message-ID: <CAGngYiXq9YtFFxjff8eK6o8ydiVum_jWQ5ZEmACqB=XjYg+KZg@mail.gmail.com>
Subject: Re: [PATCH 04/13] drm/i2c: tda998x: derive CTS_N value from aclk
 sample rate ratio
To: Russell King - ARM Linux admin <linux@armlinux.org.uk>
X-Mailman-Approved-At: Thu, 13 Jun 2019 07:27:23 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=CNP0NMj08mCW8K02m4hUNCl6YwEYelJXNU37gxYzY+0=;
 b=uHaGts3gBALAB3zQeYki0mD6HTaUYL/fV1IULiIc/mAqZ9HsROqnpdDXF+qrzp4w0n
 2SZQpdEsyu5vmDGy0VvB+MG9BDtP3aBEw/kRWyC/C4PLkhQGrQhxbmLMhyTfll1s9PfT
 BEezMNgz9bUkONT+qNKS2Ps+nxDVXJkTbKpMgZNyVh/+2d1yjoizb4irXMhQZLsmEyJP
 MC7B99KGyRgH4ZnA9xUKFyf18aD26Icf7w339M0TwKECIMt8dQnXciU9998/ZbEkEIgg
 RXCoM+9EGs6mRkzI2SA3l4HC8sSp72d3G75bNunbbsbu0hjfov1UVSNbTJcFakpdWn+V
 /WCA==
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
Cc: David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 Peter Ujfalusi <peter.ujfalusi@ti.com>, Mark Brown <broonie@kernel.org>,
 Jyri Sarha <jsarha@ti.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBKdW4gMTIsIDIwMTkgYXQgMTI6NDIgUE0gUnVzc2VsbCBLaW5nIC0gQVJNIExpbnV4
IGFkbWluCjxsaW51eEBhcm1saW51eC5vcmcudWs+IHdyb3RlOgo+Cj4gSSB0aGluayB5b3UncmUg
Y29uZnVzaW5nIHRkYTk5OHhfZGVyaXZlX2N0c19uKCkgYW5kIHRkYTk5OHhfZ2V0X2FkaXYoKS4K
PiB0ZGE5OTh4X2Rlcml2ZV9jdHNfbigpIG9ubHkgcmV0dXJucyAwIG9yIC1FSU5WQUwuCj4KClRy
dWUuIEFwb2xvZ2llcyBmb3IgdGhlIGNvbmZ1c2lvbi4KX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vZHJpLWRldmVs
