Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 49E20E4C28
	for <lists+dri-devel@lfdr.de>; Fri, 25 Oct 2019 15:30:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E211C6EA29;
	Fri, 25 Oct 2019 13:30:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 181686EA29
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Oct 2019 13:30:10 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id 11so2158631wmk.0
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Oct 2019 06:30:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
 :organization:message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=vfDfZETDTu5bhJuHRpXEV9uL96NkUW1XHV8mqXLjaPY=;
 b=RqUcSjzLGyW4XZmJcxgDv8ytD3VEMOwbQMsI/kk5bj1z5/cw4nqt0uquwZcizKWU02
 wn+2kc66j9IefG5NWTzUVIf1lT4QmdkOX6fm/7QSiXa7keUzjN6vcxjgj0viCbbRNjGY
 xIZ5Q4zIq9q3rNNl3Z5m4sggFcKyTry9xlpSxX4mW3tJ7ns+VlAkobubJs8V2t2D2qsU
 0MDxRO2lXCNIMbaHo6s1mMJ9SGpPVDUu1xtKuP4XKLfRb7+VvbZJS4ALFHcabj/ZbdMU
 oUb804DiWCCXWyOwlbN+cc3aYXP8mLb7ZRJi7gwBme6qW5AmbnrQnPNxb6kB/aFJUOVo
 yJBA==
X-Gm-Message-State: APjAAAV+pMieqVtiudantnX9R9ouYr+42dIYIgRflpRr1lYnJ/LDJtpd
 iPzJGM8wxRrNWnWr+X7uyHgRdQ==
X-Google-Smtp-Source: APXvYqwaOlLHBZMFJLBoaurtppNfcWCCKGWECV4zB1oXmKgfoaoAqV0yNYXiN0NrroeQRVw7xnaUbA==
X-Received: by 2002:a7b:c40a:: with SMTP id k10mr3845187wmi.115.1572010208457; 
 Fri, 25 Oct 2019 06:30:08 -0700 (PDT)
Received: from [192.168.1.62] (176-150-251-154.abo.bbox.fr. [176.150.251.154])
 by smtp.gmail.com with ESMTPSA id
 a13sm2381942wrf.73.2019.10.25.06.30.06
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 25 Oct 2019 06:30:08 -0700 (PDT)
Subject: Re: [PATCH v3 08/21] drm/bridge: Add the
 drm_for_each_bridge_in_chain() helper
To: Boris Brezillon <boris.brezillon@collabora.com>,
 dri-devel@lists.freedesktop.org
References: <20191023154512.9762-1-boris.brezillon@collabora.com>
 <20191023154512.9762-9-boris.brezillon@collabora.com>
From: Neil Armstrong <narmstrong@baylibre.com>
Openpgp: preference=signencrypt
Autocrypt: addr=narmstrong@baylibre.com; prefer-encrypt=mutual; keydata=
 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
 ZaTUOEkgIor5losDrePdPgE=
Organization: Baylibre
Message-ID: <2f82bf72-8b08-0b75-229f-45e0d3300a2d@baylibre.com>
Date: Fri, 25 Oct 2019 15:30:06 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191023154512.9762-9-boris.brezillon@collabora.com>
Content-Language: en-US
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:openpgp:autocrypt:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=vfDfZETDTu5bhJuHRpXEV9uL96NkUW1XHV8mqXLjaPY=;
 b=y3Uly+KVGprEAOdi0n8zYW4zxyGJ87qSfTdrJpxkZ0f47diY+v8TshIsakTvDeMX7i
 upNJxDqHdpTDQBjDfDq3RUJzZRj/ifMNMvgiJZFalS8BOOb+vsN1+dcuhTEMRCT88HKq
 +IOzWy5fr7XOD4ZzO/hxjbHI37CS0y2rRzLykFTIO2Iupa8J6UdUPKZ1QNlUE/47E9Ej
 5qn0YmcxkxjbGnk8659dRepm2fr7Xl+XKHwSe1endXWq1jE/o7Gk32B9YHX48yh5ctjY
 qrWCVz/eAjLVZEKeu3eF2BJjtf89n5fFgl9+K+sUqJdwsDx8HCFccNOCat/ix3QDcEJN
 iLpg==
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
 Mark Rutland <mark.rutland@arm.com>, Jernej Skrabec <jernej.skrabec@siol.net>,
 Jonas Karlman <jonas@kwiboo.se>, Andrey Smirnov <andrew.smirnov@gmail.com>,
 Seung-Woo Kim <sw0312.kim@samsung.com>, Rob Herring <robh+dt@kernel.org>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, kernel@collabora.com,
 Sam Ravnborg <sam@ravnborg.org>, devicetree@vger.kernel.org,
 Chris Healy <cphealy@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMjMvMTAvMjAxOSAxNzo0NCwgQm9yaXMgQnJlemlsbG9uIHdyb3RlOgo+IFRvIGl0ZXJhdGUg
b3ZlciBhbGwgYnJpZGdlcyBhdHRhY2hlZCB0byBhIHNwZWNpZmljIGVuY29kZXIuCj4gCj4gU3Vn
Z2VzdGVkLWJ5OiBMYXVyZW50IFBpbmNoYXJ0IDxsYXVyZW50LnBpbmNoYXJ0QGlkZWFzb25ib2Fy
ZC5jb20+Cj4gU2lnbmVkLW9mZi1ieTogQm9yaXMgQnJlemlsbG9uIDxib3Jpcy5icmV6aWxsb25A
Y29sbGFib3JhLmNvbT4KPiAtLS0KPiBDaGFuZ2VzIGluIHYzOgo+ICogTm9uZQo+IAo+IENoYW5n
ZXMgaW4gdjI6Cj4gKiBOZXcgcGF0Y2gKPiAtLS0KPiAgaW5jbHVkZS9kcm0vZHJtX2JyaWRnZS5o
IHwgMTEgKysrKysrKysrKysKPiAgMSBmaWxlIGNoYW5nZWQsIDExIGluc2VydGlvbnMoKykKPiAK
PiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS9kcm0vZHJtX2JyaWRnZS5oIGIvaW5jbHVkZS9kcm0vZHJt
X2JyaWRnZS5oCj4gaW5kZXggM2FiMTZjOTVlNTllLi4yMzhlODRhYjYzYTMgMTAwNjQ0Cj4gLS0t
IGEvaW5jbHVkZS9kcm0vZHJtX2JyaWRnZS5oCj4gKysrIGIvaW5jbHVkZS9kcm0vZHJtX2JyaWRn
ZS5oCj4gQEAgLTQ0MSw2ICs0NDEsMTcgQEAgZHJtX2JyaWRnZV9jaGFpbl9nZXRfZmlyc3RfYnJp
ZGdlKHN0cnVjdCBkcm1fZW5jb2RlciAqZW5jb2RlcikKPiAgCQkJCQlzdHJ1Y3QgZHJtX2JyaWRn
ZSwgY2hhaW5fbm9kZSk7Cj4gIH0KPiAgCj4gKy8qKgo+ICsgKiBmb3JfZWFjaF9icmlkZ2VfaW5f
Y2hhaW4oKSAtIEl0ZXJhdGUgb3ZlciBhbGwgYnJpZGdlcyBwcmVzZW50IGluIGEgY2hhaW4KPiAr
ICogQGVuY29kZXI6IHRoZSBlbmNvZGVyIHRvIGl0ZXJhdGUgYnJpZGdlcyBvbgo+ICsgKiBAYnJp
ZGdlOiBhIGJyaWRnZSBwb2ludGVyIHVwZGF0ZWQgdG8gcG9pbnQgdG8gdGhlIGN1cnJlbnQgYnJp
ZGdlIGF0IGVhY2gKPiArICoJICAgIGl0ZXJhdGlvbgo+ICsgKgo+ICsgKiBJdGVyYXRlIG92ZXIg
YWxsIGJyaWRnZXMgcHJlc2VudCBpbiB0aGUgYnJpZGdlIGNoYWluIGF0dGFjaGVkIHRvIEBlbmNv
ZGVyLgo+ICsgKi8KPiArI2RlZmluZSBkcm1fZm9yX2VhY2hfYnJpZGdlX2luX2NoYWluKGVuY29k
ZXIsIGJyaWRnZSkJCQlcCj4gKwlsaXN0X2Zvcl9lYWNoX2VudHJ5KGJyaWRnZSwgJihlbmNvZGVy
KS0+YnJpZGdlX2NoYWluLCBjaGFpbl9ub2RlKQo+ICsKPiAgYm9vbCBkcm1fYnJpZGdlX2NoYWlu
X21vZGVfZml4dXAoc3RydWN0IGRybV9icmlkZ2UgKmJyaWRnZSwKPiAgCQkJCSBjb25zdCBzdHJ1
Y3QgZHJtX2Rpc3BsYXlfbW9kZSAqbW9kZSwKPiAgCQkJCSBzdHJ1Y3QgZHJtX2Rpc3BsYXlfbW9k
ZSAqYWRqdXN0ZWRfbW9kZSk7Cj4gCgpSZXZpZXdlZC1ieTogTmVpbCBBcm1zdHJvbmcgPG5hcm1z
dHJvbmdAYmF5bGlicmUuY29tPgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9k
cmktZGV2ZWw=
