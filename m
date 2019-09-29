Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E3ABCC1BD1
	for <lists+dri-devel@lfdr.de>; Mon, 30 Sep 2019 08:57:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD3156E37F;
	Mon, 30 Sep 2019 06:57:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com
 [IPv6:2a00:1450:4864:20::244])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E3FCF6E32C
 for <dri-devel@lists.freedesktop.org>; Sun, 29 Sep 2019 19:53:32 +0000 (UTC)
Received: by mail-lj1-x244.google.com with SMTP id b20so7248469ljj.5
 for <dri-devel@lists.freedesktop.org>; Sun, 29 Sep 2019 12:53:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=W7zlmLnqflzMuImuGywOpRjtBgvUKXG365Da50lzcQ4=;
 b=M+T5NsyAcCezhRf019B78LqIeqJf4+UcJ203uXVZdSxyv4WXKgjsIbFQJcGh/kHhHW
 wD/MqldvYefuvz9LRqhQGJUvyajPX80vuCqxKKkz7vLRzrFQb0UNtRJM5ZS+bNnT3XPy
 D3BSyXAa9RTG4TNTa9eAydzsv+Y8kw/6OxFR8ZW7VeP7OgYNeCU0xY3Op7h9V88O8DQe
 KvuE2y23ElE34qB6a4JL+3Rvz+uc5OS4WILgpTxy4L01GvMMR4Lq73dGTNUpisdFO/O1
 ZoFjeZJgFlEx+j9ioRmpeEKqDfdDznuj5ivZCh2A9YzvtNmCRaxUKUdGixElJvNdsVPJ
 Y8zg==
X-Gm-Message-State: APjAAAV+SEZi9w0tLDdGT3fvZa6CHGF9zWv0srZYcmM3P+cnsygJ2tfB
 iy8QtIi0XiLBq1WRmj2lfWdqV16R
X-Google-Smtp-Source: APXvYqx0NwxTwpOpvSq7LIWowUj7dA0Mp8aKj8CBHdzJ8zBzsypi+wQa6FdQQfVilTTp7Hc3fvK5IA==
X-Received: by 2002:a2e:86d5:: with SMTP id n21mr6664854ljj.1.1569786811041;
 Sun, 29 Sep 2019 12:53:31 -0700 (PDT)
Received: from [192.168.2.145] (ppp94-29-32-67.pppoe.spdop.ru. [94.29.32.67])
 by smtp.googlemail.com with ESMTPSA id
 j17sm2481949lfb.11.2019.09.29.12.53.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 29 Sep 2019 12:53:30 -0700 (PDT)
Subject: Re: [PATCH] drm/tegra: Fix ordering of cleanup code
To: Thierry Reding <thierry.reding@gmail.com>
References: <20190925112659.2048-1-thierry.reding@gmail.com>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <b74304ef-de09-8c16-3178-b8bd439bff84@gmail.com>
Date: Sun, 29 Sep 2019 22:53:29 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <20190925112659.2048-1-thierry.reding@gmail.com>
Content-Language: en-US
X-Mailman-Approved-At: Mon, 30 Sep 2019 06:57:28 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=W7zlmLnqflzMuImuGywOpRjtBgvUKXG365Da50lzcQ4=;
 b=YjYCKNYjwjy7YGliAeN3wHzz6op+udBja2SoSnwxOBMv+5C8nvRDy6NmzIhXL7BVTM
 o4BtaVpXhfv2/s/30+LYa0KzZikmq4A6r8vzZEBZ5UcOhk0SXKoa8GqrC0fj+4r6h+gz
 zXOhXfoY1Vj0BnCPY5zphcQWAPeUqOfqMFTeYxYDDLqVepL2otWytY67r5vFakA2jUqW
 nVR4Cby3aeHg2f5LcG4zhLzXDDsnDiR5XS8C9a0RvdpjPH0c1rJxvdU0cuLdNhlxRu0d
 y1EMlJ0SG7rN35D79UkG69w4tZl7LjVdKx35xZtjPGMK6zczV9yNPCrrC/USBiKpnK3V
 5CgQ==
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
Cc: linux-tegra@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

MjUuMDkuMjAxOSAxNDoyNiwgVGhpZXJyeSBSZWRpbmcg0L/QuNGI0LXRgjoKPiBGcm9tOiBUaGll
cnJ5IFJlZGluZyA8dHJlZGluZ0BudmlkaWEuY29tPgo+IAo+IENvbW1pdCBGaXhlczogYjlmOGIw
OWNlMjU2ICgiZHJtL3RlZ3JhOiBTZXR1cCBzaGFyZWQgSU9NTVUgZG9tYWluIGFmdGVyCj4gaW5p
dGlhbGl6YXRpb24iKSBjaGFuZ2VkIHRoZSBpbml0aWFsaXphdGlvbiBvcmRlciBvZiB0aGUgSU9N
TVUgcmVsYXRlZAo+IGJpdHMgYnV0IGRpZG4ndCB1cGRhdGUgdGhlIGNsZWFudXAgcGF0aCBhY2Nv
cmRpbmdseS4gVGhpcyBhc3ltbWV0cnkgY2FuCj4gY2F1c2UgZmFpbHVyZXMgZHVyaW5nIGVycm9y
IHJlY292ZXJ5Lgo+IAo+IEZpeGVzOiBiOWY4YjA5Y2UyNTYgKCJkcm0vdGVncmE6IFNldHVwIHNo
YXJlZCBJT01NVSBkb21haW4gYWZ0ZXIgaW5pdGlhbGl6YXRpb24iKQo+IFNpZ25lZC1vZmYtYnk6
IFRoaWVycnkgUmVkaW5nIDx0cmVkaW5nQG52aWRpYS5jb20+Cj4gLS0tCj4gIGRyaXZlcnMvZ3B1
L2RybS90ZWdyYS9kcm0uYyB8IDE0ICsrKysrKystLS0tLS0tCj4gIDEgZmlsZSBjaGFuZ2VkLCA3
IGluc2VydGlvbnMoKyksIDcgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMv
Z3B1L2RybS90ZWdyYS9kcm0uYyBiL2RyaXZlcnMvZ3B1L2RybS90ZWdyYS9kcm0uYwo+IGluZGV4
IDZmYjdkNzRmZjU1My4uYmM3Y2MzMjE0MGY4IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2Ry
bS90ZWdyYS9kcm0uYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS90ZWdyYS9kcm0uYwo+IEBAIC0y
MDEsMTkgKzIwMSwxOSBAQCBzdGF0aWMgaW50IHRlZ3JhX2RybV9sb2FkKHN0cnVjdCBkcm1fZGV2
aWNlICpkcm0sIHVuc2lnbmVkIGxvbmcgZmxhZ3MpCj4gIAlpZiAodGVncmEtPmh1YikKPiAgCQl0
ZWdyYV9kaXNwbGF5X2h1Yl9jbGVhbnVwKHRlZ3JhLT5odWIpOwo+ICBkZXZpY2U6Cj4gLQlob3N0
MXhfZGV2aWNlX2V4aXQoZGV2aWNlKTsKPiAtZmJkZXY6Cj4gLQlkcm1fa21zX2hlbHBlcl9wb2xs
X2ZpbmkoZHJtKTsKPiAtCXRlZ3JhX2RybV9mYl9mcmVlKGRybSk7Cj4gLWNvbmZpZzoKPiAtCWRy
bV9tb2RlX2NvbmZpZ19jbGVhbnVwKGRybSk7Cj4gLQo+ICAJaWYgKHRlZ3JhLT5kb21haW4pIHsK
PiAgCQltdXRleF9kZXN0cm95KCZ0ZWdyYS0+bW1fbG9jayk7Cj4gIAkJZHJtX21tX3Rha2Vkb3du
KCZ0ZWdyYS0+bW0pOwo+ICAJCXB1dF9pb3ZhX2RvbWFpbigmdGVncmEtPmNhcnZlb3V0LmRvbWFp
bik7Cj4gIAkJaW92YV9jYWNoZV9wdXQoKTsKPiAgCX0KPiArCj4gKwlob3N0MXhfZGV2aWNlX2V4
aXQoZGV2aWNlKTsKPiArZmJkZXY6Cj4gKwlkcm1fa21zX2hlbHBlcl9wb2xsX2ZpbmkoZHJtKTsK
PiArCXRlZ3JhX2RybV9mYl9mcmVlKGRybSk7Cj4gK2NvbmZpZzoKPiArCWRybV9tb2RlX2NvbmZp
Z19jbGVhbnVwKGRybSk7Cj4gIGRvbWFpbjoKPiAgCWlmICh0ZWdyYS0+ZG9tYWluKQo+ICAJCWlv
bW11X2RvbWFpbl9mcmVlKHRlZ3JhLT5kb21haW4pOwo+IAoKSGVsbG8gVGhpZXJyeSwKCkdvb2Qg
dGhhdCB5b3Ugc3BvdHRlZCB0aGlzISBJIGhhZCBhIHNpbWlsYXIgcGF0Y2ggc29tZXRpbWUgYWdv
LCBidXQgbXkKdmVyc2lvbiBoYWQgc29tZSBwcm9ibGVtIGFuZCB0aGVuIEkganVzdCBmb3Jnb3Qg
YWJvdXQgaXQuIEkgdHJpZWQgeW91cnMKcGF0Y2ggYW5kIGRpZG4ndCBub3RpY2UgYW55dGhpbmcg
d3JvbmcsIHRoYW5rcyEKClJldmlld2VkLWJ5OiBEbWl0cnkgT3NpcGVua28gPGRpZ2V0eEBnbWFp
bC5jb20+ClRlc3RlZC1ieTogRG1pdHJ5IE9zaXBlbmtvIDxkaWdldHhAZ21haWwuY29tPgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFp
bGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
