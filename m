Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A390CE0F5
	for <lists+dri-devel@lfdr.de>; Mon,  7 Oct 2019 13:54:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CEC156E5B0;
	Mon,  7 Oct 2019 11:54:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E34366E5B0
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Oct 2019 11:54:08 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id j18so14121175wrq.10
 for <dri-devel@lists.freedesktop.org>; Mon, 07 Oct 2019 04:54:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
 :organization:message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=pBhXm94gb2aC/i1aOImAreyb5IoDhmivCtLzEb4Bwrk=;
 b=P0l+D/pFebEetkYsGtGcTbihukIjHgrD0+8w28HxwPSuq6gYCAtGbptNVni183SfkT
 jh+CKJmWAm+zNiTK3BrDGUoGj81pJkTRJlQ3eUYSiHyab9O4cNM8gslnNHklXhwUvI9W
 aV04pcCNUy5lKxbwLsodH0NpEEgkTD8Glt5r7RSgsEEDd4fDZEo6n8pFpsE9kFHu0qHr
 YmPl8FmhMAUjInxv6W4exq7QedHQf45IkT7pOZNNs14paa7nm76deGv1zMuehJReRMQa
 Cj1K6QbnfBPgsGiZyXDFyfW70q+YelQ5KNs45pLrlxGRt+qr6dVY5TdumytrBHLgRMbg
 M5tQ==
X-Gm-Message-State: APjAAAWCmEtLyHyVP7opSq0W5KFf2916MAvqXerdGaVk2wq2n8zMsMkh
 eGKWMOMpOek+pxR53jwOxthoCQ==
X-Google-Smtp-Source: APXvYqxnHuYDeHiGk0pb80Td6Eg1XjBr1SmhViheYgCD9/aZ86Wdmcox/0JSPXIuyMOCingwuFzQAQ==
X-Received: by 2002:a5d:67cc:: with SMTP id n12mr21067761wrw.359.1570449247183; 
 Mon, 07 Oct 2019 04:54:07 -0700 (PDT)
Received: from [10.1.2.12] (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr.
 [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id 33sm22757591wra.41.2019.10.07.04.54.06
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 07 Oct 2019 04:54:06 -0700 (PDT)
Subject: Re: [PATCH v2] drm/bridge: dw-hdmi: Refuse DDC/CI transfers on the
 internal I2C controller
To: Matthias Kaehlcke <mka@chromium.org>,
 Archit Taneja <architt@codeaurora.org>, Andrzej Hajda <a.hajda@samsung.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 David Airlie <airlied@linux.ie>
References: <20191002124354.v2.1.I709dfec496f5f0b44a7b61dcd4937924da8d8382@changeid>
From: Neil Armstrong <narmstrong@baylibre.com>
Openpgp: preference=signencrypt
Autocrypt: addr=narmstrong@baylibre.com; prefer-encrypt=mutual; keydata=
 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
 ZaTUOEkgIor5losDrePdPgE=
Organization: Baylibre
Message-ID: <5640bf2f-a90f-d424-a0d7-1bd19602525d@baylibre.com>
Date: Mon, 7 Oct 2019 13:54:05 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20191002124354.v2.1.I709dfec496f5f0b44a7b61dcd4937924da8d8382@changeid>
Content-Language: en-US
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:openpgp:autocrypt:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=pBhXm94gb2aC/i1aOImAreyb5IoDhmivCtLzEb4Bwrk=;
 b=Lex3lcU6Um9qIdLI8D05BFzgN700xT6KeQ+sai8L9/9PQ4Dz27+taEn0OPo/AjfnMR
 bruWJtk8Mo3EQ2r8Lh4cE0KKZxA4fBKqXqtB4Xtk9LR6kdLvEfgMsoKIsTnyD2HajMQz
 n637u0kudXmQijzd1JFWvMvVTxqZ/XLztHgMmqNRaJIcbfvrRHey/RMIkPYRzVlKXK+K
 qHfZToFgWBEWb5GkURR85QVFwL+zDTOlYY2PIvcr4CB5A5ExiCO9VEIqqqDxwOZJqdjo
 YKE5zVvI6GsUeQ9ih3q/pBRqX35uzQwHabb4TkRWTWQIO2H9VLpmdvTeTIkpP02+uDim
 v7Mw==
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
Cc: Jernej Skrabec <jernej.skrabec@siol.net>,
 Tzung-Bi Shih <tzungbi@chromium.org>, Sean Paul <sean@poorly.run>,
 Douglas Anderson <dianders@chromium.org>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Cheng-Yi Chiang <cychiang@chromium.org>,
 Yakir Yang <kuankuan.y@gmail.com>, Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgTWF0dGhpYXMsCgpPbiAwMi8xMC8yMDE5IDIxOjQ0LCBNYXR0aGlhcyBLYWVobGNrZSB3cm90
ZToKPiBUaGUgRERDL0NJIHByb3RvY29sIGludm9sdmVzIHNlbmRpbmcgYSBtdWx0aS1ieXRlIHJl
cXVlc3QgdG8gdGhlCj4gZGlzcGxheSB2aWEgSTJDLCB3aGljaCBpcyB0eXBpY2FsbHkgZm9sbG93
ZWQgYnkgYSBtdWx0aS1ieXRlCj4gcmVzcG9uc2UuIFRoZSBpbnRlcm5hbCBJMkMgY29udHJvbGxl
ciBvbmx5IGFsbG93cyBzaW5nbGUgYnl0ZQo+IHJlYWRzL3dyaXRlcyBvciByZWFkcyBvZiA4IHNl
cXVlbnRpYWwgYnl0ZXMsIGhlbmNlIEREQy9DSSBpcyBub3QKPiBzdXBwb3J0ZWQgd2hlbiB0aGUg
aW50ZXJuYWwgSTJDIGNvbnRyb2xsZXIgaXMgdXNlZC4gVGhlIEkyQwo+IHRyYW5zZmVycyBjb21w
bGV0ZSB3aXRob3V0IGVycm9ycywgaG93ZXZlciB0aGUgZGF0YSBpbiB0aGUgcmVzcG9uc2UKPiBp
cyBnYXJiYWdlLiBBYm9ydCB0cmFuc2ZlcnMgdG8vZnJvbSBzbGF2ZSBhZGRyZXNzIDB4MzcgKERE
Qykgd2l0aAo+IC1FT1BOT1RTVVBQLCB0byBtYWtlIGl0IGV2aWRlbnQgdGhhdCB0aGUgY29tbXVu
aWNhdGlvbiBpcyBmYWlsaW5nLgo+IAo+IFNpZ25lZC1vZmYtYnk6IE1hdHRoaWFzIEthZWhsY2tl
IDxta2FAY2hyb21pdW0ub3JnPgo+IFJldmlld2VkLWJ5OiBEb3VnbGFzIEFuZGVyc29uIDxkaWFu
ZGVyc0BjaHJvbWl1bS5vcmc+Cj4gUmV2aWV3ZWQtYnk6IFNlYW4gUGF1bCA8c2VhbkBwb29ybHku
cnVuPgo+IEFja2VkLWJ5OiBOZWlsIEFybXN0cm9uZyA8bmFybXN0cm9uZ0BiYXlsaWJyZS5jb20+
Cj4gLS0tCj4gU29ycnkgZm9yIHRoZSBkZWxheSB3aXRoIHNlbmRpbmcgdjIsIEkgY29tcGxldGVs
eSBmb3Jnb3QgYWJvdXQgdGhpcyBwYXRjaCAuLi4KPiAKPiBDaGFuZ2VzIGluIHYyOgo+IC0gdXBk
YXRlZCBjb21tZW50IHdpdGggJ1RPRklYJyBlbnRyeSBhcyByZXF1ZXN0ZWQgYnkgTmVpbAo+IC0g
YWRkZWQgTmVpbCdzICdBY2tlZC1ieScgdGFnCj4gCj4gIGRyaXZlcnMvZ3B1L2RybS9icmlkZ2Uv
c3lub3BzeXMvZHctaGRtaS5jIHwgMTAgKysrKysrKysrKwo+ICAxIGZpbGUgY2hhbmdlZCwgMTAg
aW5zZXJ0aW9ucygrKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3N5
bm9wc3lzL2R3LWhkbWkuYyBiL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2Uvc3lub3BzeXMvZHctaGRt
aS5jCj4gaW5kZXggNTJkMjIwYTcwMzYyLi5hYzI0YmNlYWY0MTUgMTAwNjQ0Cj4gLS0tIGEvZHJp
dmVycy9ncHUvZHJtL2JyaWRnZS9zeW5vcHN5cy9kdy1oZG1pLmMKPiArKysgYi9kcml2ZXJzL2dw
dS9kcm0vYnJpZGdlL3N5bm9wc3lzL2R3LWhkbWkuYwo+IEBAIC00MSw2ICs0MSw3IEBACj4gIAo+
ICAjaW5jbHVkZSA8bWVkaWEvY2VjLW5vdGlmaWVyLmg+Cj4gIAo+ICsjZGVmaW5lIEREQ19DSV9B
RERSCQkweDM3Cj4gICNkZWZpbmUgRERDX1NFR01FTlRfQUREUgkweDMwCj4gIAo+ICAjZGVmaW5l
IEhETUlfRURJRF9MRU4JCTUxMgo+IEBAIC00MzksNiArNDQwLDE1IEBAIHN0YXRpYyBpbnQgZHdf
aGRtaV9pMmNfeGZlcihzdHJ1Y3QgaTJjX2FkYXB0ZXIgKmFkYXAsCj4gIAl1OCBhZGRyID0gbXNn
c1swXS5hZGRyOwo+ICAJaW50IGksIHJldCA9IDA7Cj4gIAo+ICsJaWYgKGFkZHIgPT0gRERDX0NJ
X0FERFIpCj4gKwkJLyoKPiArCQkgKiBUaGUgaW50ZXJuYWwgSTJDIGNvbnRyb2xsZXIgZG9lcyBu
b3Qgc3VwcG9ydCB0aGUgbXVsdGktYnl0ZQo+ICsJCSAqIHJlYWQgYW5kIHdyaXRlIG9wZXJhdGlv
bnMgbmVlZGVkIGZvciBEREMvQ0kuCj4gKwkJICogVE9GSVg6IEJsYWNrbGlzdCB0aGUgRERDL0NJ
IGFkZHJlc3MgdW50aWwgd2UgZmlsdGVyIG91dAo+ICsJCSAqIHVuc3VwcG9ydGVkIEkyQyBvcGVy
YXRpb25zLgo+ICsJCSAqLwo+ICsJCXJldHVybiAtRU9QTk9UU1VQUDsKPiArCj4gIAlkZXZfZGJn
KGhkbWktPmRldiwgInhmZXI6IG51bTogJWQsIGFkZHI6ICUjeFxuIiwgbnVtLCBhZGRyKTsKPiAg
Cj4gIAlmb3IgKGkgPSAwOyBpIDwgbnVtOyBpKyspIHsKPiAKCkFwcGx5aW5nIHRvIGRybS1taXNj
LW5leHQKClRoYW5rcyAhCk5laWwKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8v
ZHJpLWRldmVs
