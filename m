Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 484B99DEAE
	for <lists+dri-devel@lfdr.de>; Tue, 27 Aug 2019 09:26:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED65D89789;
	Tue, 27 Aug 2019 07:26:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3FBB489789
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Aug 2019 07:26:42 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id p74so1896058wme.4
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Aug 2019 00:26:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
 :organization:message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=w5+YkzJzeYMa5KseGsSnfKxgfk4J4VJ1bwcd/3Hc94A=;
 b=G1dmeyUZuTWbS1UttRGCq5b/tcCYE+11H+mxWvhjVL/RuQOMHgFvUaMhz8MBX/ZxeE
 gtV8xofN6SQxy2Dyd1iHhqDfe/u9YRfkjNtz9ufNEcc9OY4KrAUuuwYHTO2L1wCunMQz
 wJp5dSj4dlgZixuc06NFFbsVZEt5yHFP1DgBxm/wtdP08glZL3W6+q9frvO6pWFYvSL7
 CG9vB5vMdDfiQRcLE/UF6HGJtBoB/FsfIl0+VOYbfyty1GrH+CpT5MvBMvIdX9A/b2/P
 DB1xGHmzUJxJBb1sJDXwwXzW7o9iEmzqmouHfFQfXW3MHrmbPfXX7N4lFesj6K+qxY3k
 br4g==
X-Gm-Message-State: APjAAAUUFWxd+I4yIrWmirXWh1XDuD1Ayk1nxXzu6koyla6lk0/O7fCw
 1EllBbg6UQ3NwighqI0dZmqfYQ==
X-Google-Smtp-Source: APXvYqzQNdrrSAZAMpVDGI6xr0VsRTHPA7JKp0dgHH3dBp2a11ooYUQf/1D40gA+ZoocIu6F2rsGog==
X-Received: by 2002:a1c:f103:: with SMTP id p3mr25450322wmh.18.1566890800680; 
 Tue, 27 Aug 2019 00:26:40 -0700 (PDT)
Received: from [10.1.3.173] (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr.
 [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id t14sm11710662wrs.58.2019.08.27.00.26.39
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 27 Aug 2019 00:26:40 -0700 (PDT)
Subject: Re: [PATCH v2 15/21] drm/bridge: Add the
 drm_bridge_chain_get_prev_bridge() helper
To: Boris Brezillon <boris.brezillon@collabora.com>,
 dri-devel@lists.freedesktop.org
References: <20190826152649.13820-1-boris.brezillon@collabora.com>
 <20190826152649.13820-16-boris.brezillon@collabora.com>
From: Neil Armstrong <narmstrong@baylibre.com>
Openpgp: preference=signencrypt
Autocrypt: addr=narmstrong@baylibre.com; prefer-encrypt=mutual; keydata=
 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
 ZaTUOEkgIor5losDrePdPgE=
Organization: Baylibre
Message-ID: <eb72b35d-ef55-5ac1-0ac1-70253d95876e@baylibre.com>
Date: Tue, 27 Aug 2019 09:26:39 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190826152649.13820-16-boris.brezillon@collabora.com>
Content-Language: en-US
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:openpgp:autocrypt:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=w5+YkzJzeYMa5KseGsSnfKxgfk4J4VJ1bwcd/3Hc94A=;
 b=uXJnXHlUUa1KW/mlGBzaZfzewbJssEIEyz9zcdgzbxqw0kJDPi3S0siB2bekxai3Qw
 E7CkahWv4zkLVdZe3rJVR29BJZ+uOeNVMaxn0CA3Bv+0YppKqCuZfiUhHY8GmwPQFfuH
 Loy9KP0EWUO7m0DgXHO5qmxetCCA+Bj4ZdEYZmAy77+PtW9uDydNvd3jAGJqbwAD2IqM
 htu9ObvNRNEBij8gd2rgWY7s4xZXE1CvgvAQvFPwDb3ntFEzRQPjCiCztArroa81sIP+
 fHKovBZ9QTiSZIwNNh2uMMibNR86FxJOv7mvHiKrW2ACeuGofth4FkUWPO0UqWY1kZlr
 CAOQ==
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
Cc: Nikita Yushchenko <nikita.yoush@cogentembedded.com>,
 Jernej Skrabec <jernej.skrabec@siol.net>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Andrey Smirnov <andrew.smirnov@gmail.com>,
 Seung-Woo Kim <sw0312.kim@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Thierry Reding <thierry.reding@gmail.com>, Chris Healy <Chris.Healy@zii.aero>,
 kernel@collabora.com, Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMjYvMDgvMjAxOSAxNzoyNiwgQm9yaXMgQnJlemlsbG9uIHdyb3RlOgo+IFdpbGwgYmUgdXNl
ZnVsIGZvciBicmlkZ2UgZHJpdmVycyB0aGF0IHdhbnQgdG8gZG8gYnVzIGZvcm1hdAo+IG5lZ290
aWF0aW9uIHdpdGggdGhlaXIgbmVpZ2hib3Vycy4KClJldmlld2VkLWJ5OiBOZWlsIEFybXN0cm9u
ZyA8bmFybXN0cm9uZ0BiYXlsaWJyZS5jb20+Cgo+IAo+IFNpZ25lZC1vZmYtYnk6IEJvcmlzIEJy
ZXppbGxvbiA8Ym9yaXMuYnJlemlsbG9uQGNvbGxhYm9yYS5jb20+Cj4gLS0tCj4gQ2hhbmdlcyBp
biB2MjoKPiAqIEZpeCB0aGUga2VybmVsZG9jCj4gKiBEcm9wIHRoZSAhYnJpZGdlIHx8ICFicmlk
Z2UtPmVuY29kZXIgY2hlY2sKPiAtLS0KPiAgZHJpdmVycy9ncHUvZHJtL2RybV9icmlkZ2UuYyB8
IDE3ICsrKysrKysrKysrKysrKysrCj4gIGluY2x1ZGUvZHJtL2RybV9icmlkZ2UuaCAgICAgfCAg
MiArKwo+ICAyIGZpbGVzIGNoYW5nZWQsIDE5IGluc2VydGlvbnMoKykKPiAKPiBkaWZmIC0tZ2l0
IGEvZHJpdmVycy9ncHUvZHJtL2RybV9icmlkZ2UuYyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fYnJp
ZGdlLmMKPiBpbmRleCA3ZjdlMGVhNWIwNmMuLjljNzRiMjg1ZGE5ZCAxMDA2NDQKPiAtLS0gYS9k
cml2ZXJzL2dwdS9kcm0vZHJtX2JyaWRnZS5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2RybV9i
cmlkZ2UuYwo+IEBAIC0yMzgsNiArMjM4LDIzIEBAIGRybV9icmlkZ2VfY2hhaW5fZ2V0X25leHRf
YnJpZGdlKHN0cnVjdCBkcm1fYnJpZGdlICpicmlkZ2UpCj4gIH0KPiAgRVhQT1JUX1NZTUJPTChk
cm1fYnJpZGdlX2NoYWluX2dldF9uZXh0X2JyaWRnZSk7Cj4gIAo+ICsvKioKPiArICogZHJtX2Jy
aWRnZV9jaGFpbl9nZXRfcHJldl9icmlkZ2UoKSAtIEdldCB0aGUgcHJldmlvdXMgYnJpZGdlIGlu
IHRoZSBjaGFpbgo+ICsgKiBAYnJpZGdlOiBicmlkZ2Ugb2JqZWN0Cj4gKyAqCj4gKyAqIFJFVFVS
TlM6Cj4gKyAqIHRoZSBwcmV2aW91cyBicmlkZ2UgaW4gdGhlIGNoYWluLCBvciBOVUxMIGlmIEBi
cmlkZ2UgaXMgdGhlIGxhc3QuCj4gKyAqLwo+ICtzdHJ1Y3QgZHJtX2JyaWRnZSAqCj4gK2RybV9i
cmlkZ2VfY2hhaW5fZ2V0X3ByZXZfYnJpZGdlKHN0cnVjdCBkcm1fYnJpZGdlICpicmlkZ2UpCj4g
K3sKPiArCWlmIChsaXN0X2lzX2ZpcnN0KCZicmlkZ2UtPmNoYWluX25vZGUsICZicmlkZ2UtPmVu
Y29kZXItPmJyaWRnZV9jaGFpbikpCj4gKwkJcmV0dXJuIE5VTEw7Cj4gKwo+ICsJcmV0dXJuIGxp
c3RfcHJldl9lbnRyeShicmlkZ2UsIGNoYWluX25vZGUpOwo+ICt9Cj4gK0VYUE9SVF9TWU1CT0wo
ZHJtX2JyaWRnZV9jaGFpbl9nZXRfcHJldl9icmlkZ2UpOwo+ICsKPiAgLyoqCj4gICAqIERPQzog
YnJpZGdlIGNhbGxiYWNrcwo+ICAgKgo+IGRpZmYgLS1naXQgYS9pbmNsdWRlL2RybS9kcm1fYnJp
ZGdlLmggYi9pbmNsdWRlL2RybS9kcm1fYnJpZGdlLmgKPiBpbmRleCA3ZmRjZTZkYzVmMjYuLjk1
ZGM1OGMzYTRlOCAxMDA2NDQKPiAtLS0gYS9pbmNsdWRlL2RybS9kcm1fYnJpZGdlLmgKPiArKysg
Yi9pbmNsdWRlL2RybS9kcm1fYnJpZGdlLmgKPiBAQCAtNTIxLDYgKzUyMSw4IEBAIGludCBkcm1f
YnJpZGdlX2F0dGFjaChzdHJ1Y3QgZHJtX2VuY29kZXIgKmVuY29kZXIsIHN0cnVjdCBkcm1fYnJp
ZGdlICpicmlkZ2UsCj4gIAo+ICBzdHJ1Y3QgZHJtX2JyaWRnZSAqCj4gIGRybV9icmlkZ2VfY2hh
aW5fZ2V0X25leHRfYnJpZGdlKHN0cnVjdCBkcm1fYnJpZGdlICpicmlkZ2UpOwo+ICtzdHJ1Y3Qg
ZHJtX2JyaWRnZSAqCj4gK2RybV9icmlkZ2VfY2hhaW5fZ2V0X3ByZXZfYnJpZGdlKHN0cnVjdCBk
cm1fYnJpZGdlICpicmlkZ2UpOwo+ICBib29sIGRybV9icmlkZ2VfY2hhaW5fbW9kZV9maXh1cChz
dHJ1Y3QgZHJtX2JyaWRnZSAqYnJpZGdlLAo+ICAJCQkJIGNvbnN0IHN0cnVjdCBkcm1fZGlzcGxh
eV9tb2RlICptb2RlLAo+ICAJCQkJIHN0cnVjdCBkcm1fZGlzcGxheV9tb2RlICphZGp1c3RlZF9t
b2RlKTsKPiAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
