Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B26A1169F0
	for <lists+dri-devel@lfdr.de>; Mon,  9 Dec 2019 10:47:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 433946E340;
	Mon,  9 Dec 2019 09:46:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com
 [IPv6:2a00:1450:4864:20::143])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B11B96E131
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Dec 2019 00:40:29 +0000 (UTC)
Received: by mail-lf1-x143.google.com with SMTP id r14so9284313lfm.5
 for <dri-devel@lists.freedesktop.org>; Sun, 08 Dec 2019 16:40:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=JWPPzGUxy600qT3nVozIqBBAbKVQhABD8sIYsMTNlAc=;
 b=T2/+LcFrLiHwPCOCz9ujLF5gJf64v8wIeEwRqkqe4Fm5ehJI+UydxE/p1JomQx620m
 rKvg0wz0zI2Ic8qy5UU+wufEtzDdB3kxtIZu2sQ8PrelNEKVIn6OulazYTA8NPbU0QAJ
 F0H5HX6rH58Mdn4l2Z6BZMKFpGVjhNhHnaeMa3q7giHs3npdQ3/ohc7SANuUcaLlpuWU
 lhy8fBhTeq4xW2jf18G1gKwlefXh9I2R5Md7mWWcwc9+VpIQtWxdKDs+d1kISIqVU3Sp
 1N/iD8DB0Bh6FgYtfmoqoecpSaFrKopNXdar4shmeqp3djQLs0CXz2Pk5asYlwLB8v6a
 MnNw==
X-Gm-Message-State: APjAAAV++eoGmRiU/q+bUfe19U0uAIyDYxrvWvLe2Q/KSBlJhbRdWRhP
 Sdxj7a4G01EDmEqQYjxgMihulAzS
X-Google-Smtp-Source: APXvYqyxhVDpkaN4A/YvGquWaQ+iAcunN55sePH4puGOEmcRK9wgaVR7jQJEul9WvNyGs5ucC7t0iw==
X-Received: by 2002:ac2:5a43:: with SMTP id r3mr14235618lfn.150.1575852027918; 
 Sun, 08 Dec 2019 16:40:27 -0800 (PST)
Received: from [192.168.2.145] (79-139-233-37.dynamic.spd-mgts.ru.
 [79.139.233.37])
 by smtp.googlemail.com with ESMTPSA id m21sm42743lfh.53.2019.12.08.16.40.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 08 Dec 2019 16:40:26 -0800 (PST)
Subject: Re: [PATCH v2 5/9] drm/tegra: sor: Implement system suspend/resume
To: Thierry Reding <thierry.reding@gmail.com>
References: <20191203161914.1312555-1-thierry.reding@gmail.com>
 <20191203161914.1312555-5-thierry.reding@gmail.com>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <8b789b1c-c44e-f169-d0ca-fff333608c28@gmail.com>
Date: Mon, 9 Dec 2019 03:40:25 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20191203161914.1312555-5-thierry.reding@gmail.com>
Content-Language: en-US
X-Mailman-Approved-At: Mon, 09 Dec 2019 09:46:36 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=JWPPzGUxy600qT3nVozIqBBAbKVQhABD8sIYsMTNlAc=;
 b=oZoWY69BswrCKsIbIgt79QuxqjgV24TAFehsdHtK/O/44oR4w7iHbDnriwmKn6V6i8
 4hRgcToqBe5J7UZAa91Ex+dEzfTImi9fvT2begHeqSgAjnU+0u4zqr8fpFqyRcysQTF8
 9uQOzKpyCQWxRrpFGFoiTHGXz708xf4zn6FPD1/BQ1vL2IQHsDa/gCZ1MiS0kro/PBw1
 H4nGh72H8tXTVcJz2X/8T0NxqL6KEKns7wRVXfConjjHlOVFtd5J9ca6KNjMa8EsNqey
 lgzN+arsKGbUTQejmNKBmFD04dxfQicbA3ntwUqXQGzyr6QF78qn8yCNBAoNzQEq95p6
 D9qw==
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
Cc: linux-tegra@vger.kernel.org, Daniel Vetter <daniel.vetter@ffwll.ch>,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

MDMuMTIuMjAxOSAxOToxOSwgVGhpZXJyeSBSZWRpbmcg0L/QuNGI0LXRgjoKPiBGcm9tOiBUaGll
cnJ5IFJlZGluZyA8dHJlZGluZ0BudmlkaWEuY29tPgo+IAo+IFVwb24gc3lzdGVtIHN1c3BlbmQs
IG1ha2Ugc3VyZSB0aGUgKzVWIEhETUkgcmVndWxhdG9yIGlzIGRpc2FibGVkLiBUaGlzCj4gYXZv
aWRzIHBvdGVudGlhbGx5IGxlYWtpbmcgY3VycmVudCB0byB0aGUgSERNSSBjb25uZWN0b3IuIFRo
aXMgYWxzbwo+IG1ha2VzIHN1cmUgdGhhdCB1cG9uIHJlc3VtZSB0aGUgcmVndWxhdG9yIGlzIGVu
YWJsZWQgYWdhaW4sIHdoaWNoIGluCj4gc29tZSBjYXNlcyBpcyBuZWNlc3NhcnkgdG8gcHJvcGVy
bHkgcmVzdG9yZSB0aGUgc3RhdGUgb2YgdGhlIHN1cHBseSBvbgo+IHJlc3VtZS4KPiAKPiBSZXZp
ZXdlZC1ieTogRGFuaWVsIFZldHRlciA8ZGFuaWVsLnZldHRlckBmZndsbC5jaD4KPiBTaWduZWQt
b2ZmLWJ5OiBUaGllcnJ5IFJlZGluZyA8dHJlZGluZ0BudmlkaWEuY29tPgo+IC0tLQo+ICBkcml2
ZXJzL2dwdS9kcm0vdGVncmEvc29yLmMgfCAyNCArKysrKysrKysrKysrKysrKysrLS0tLS0KPiAg
MSBmaWxlIGNoYW5nZWQsIDE5IGluc2VydGlvbnMoKyksIDUgZGVsZXRpb25zKC0pCj4gCj4gZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS90ZWdyYS9zb3IuYyBiL2RyaXZlcnMvZ3B1L2RybS90
ZWdyYS9zb3IuYwo+IGluZGV4IDYxNWNiMzE5ZmE4Yi4uMjIwMGY0Y2QzOTdhIDEwMDY0NAo+IC0t
LSBhL2RyaXZlcnMvZ3B1L2RybS90ZWdyYS9zb3IuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS90
ZWdyYS9zb3IuYwo+IEBAIC0zOTEyLDggKzM5MTIsNyBAQCBzdGF0aWMgaW50IHRlZ3JhX3Nvcl9y
ZW1vdmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikKPiAgCXJldHVybiAwOwo+ICB9Cj4g
IAo+IC0jaWZkZWYgQ09ORklHX1BNCj4gLXN0YXRpYyBpbnQgdGVncmFfc29yX3N1c3BlbmQoc3Ry
dWN0IGRldmljZSAqZGV2KQo+ICtzdGF0aWMgaW50IHRlZ3JhX3Nvcl9ydW50aW1lX3N1c3BlbmQo
c3RydWN0IGRldmljZSAqZGV2KQo+ICB7Cj4gIAlzdHJ1Y3QgdGVncmFfc29yICpzb3IgPSBkZXZf
Z2V0X2RydmRhdGEoZGV2KTsKPiAgCWludCBlcnI7Cj4gQEAgLTM5MzUsNyArMzkzNCw3IEBAIHN0
YXRpYyBpbnQgdGVncmFfc29yX3N1c3BlbmQoc3RydWN0IGRldmljZSAqZGV2KQo+ICAJcmV0dXJu
IDA7Cj4gIH0KPiAgCj4gLXN0YXRpYyBpbnQgdGVncmFfc29yX3Jlc3VtZShzdHJ1Y3QgZGV2aWNl
ICpkZXYpCj4gK3N0YXRpYyBpbnQgdGVncmFfc29yX3J1bnRpbWVfcmVzdW1lKHN0cnVjdCBkZXZp
Y2UgKmRldikKPiAgewo+ICAJc3RydWN0IHRlZ3JhX3NvciAqc29yID0gZGV2X2dldF9kcnZkYXRh
KGRldik7Cj4gIAlpbnQgZXJyOwo+IEBAIC0zOTY3LDEwICszOTY2LDI1IEBAIHN0YXRpYyBpbnQg
dGVncmFfc29yX3Jlc3VtZShzdHJ1Y3QgZGV2aWNlICpkZXYpCj4gIAo+ICAJcmV0dXJuIDA7Cj4g
IH0KPiAtI2VuZGlmCj4gKwo+ICtzdGF0aWMgaW50IHRlZ3JhX3Nvcl9zdXNwZW5kKHN0cnVjdCBk
ZXZpY2UgKmRldikKPiArewo+ICsJc3RydWN0IHRlZ3JhX3NvciAqc29yID0gZGV2X2dldF9kcnZk
YXRhKGRldik7Cj4gKwo+ICsJcmV0dXJuIHJlZ3VsYXRvcl9kaXNhYmxlKHNvci0+aGRtaV9zdXBw
bHkpOwo+ICt9Cj4gKwo+ICtzdGF0aWMgaW50IHRlZ3JhX3Nvcl9yZXN1bWUoc3RydWN0IGRldmlj
ZSAqZGV2KQo+ICt7Cj4gKwlzdHJ1Y3QgdGVncmFfc29yICpzb3IgPSBkZXZfZ2V0X2RydmRhdGEo
ZGV2KTsKPiArCj4gKwlyZXR1cm4gcmVndWxhdG9yX2VuYWJsZShzb3ItPmhkbWlfc3VwcGx5KTsK
PiArfQoKVGhlc2UgZnVuY3Rpb25zIHNob3VsZCBiZSBhbm5vdGF0ZWQgd2l0aCBfX21heWJlX3Vu
dXNlZCBhdHRyaWJ1dGUuCgo+ICBzdGF0aWMgY29uc3Qgc3RydWN0IGRldl9wbV9vcHMgdGVncmFf
c29yX3BtX29wcyA9IHsKPiAtCVNFVF9SVU5USU1FX1BNX09QUyh0ZWdyYV9zb3Jfc3VzcGVuZCwg
dGVncmFfc29yX3Jlc3VtZSwgTlVMTCkKPiArCVNFVF9SVU5USU1FX1BNX09QUyh0ZWdyYV9zb3Jf
cnVudGltZV9zdXNwZW5kLCB0ZWdyYV9zb3JfcnVudGltZV9yZXN1bWUsCj4gKwkJCSAgIE5VTEwp
Cj4gKwlTRVRfU1lTVEVNX1NMRUVQX1BNX09QUyh0ZWdyYV9zb3Jfc3VzcGVuZCwgdGVncmFfc29y
X3Jlc3VtZSkKPiAgfTsKPiAgCj4gIHN0cnVjdCBwbGF0Zm9ybV9kcml2ZXIgdGVncmFfc29yX2Ry
aXZlciA9IHsKPiAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9y
ZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZl
bA==
