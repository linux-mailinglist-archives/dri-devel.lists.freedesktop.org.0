Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E9DED700E9
	for <lists+dri-devel@lfdr.de>; Mon, 22 Jul 2019 15:21:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F190789C63;
	Mon, 22 Jul 2019 13:21:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4717989C6E;
 Mon, 22 Jul 2019 13:21:27 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id v15so35190103wml.0;
 Mon, 22 Jul 2019 06:21:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:to:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=P5gDWsvKEH/zrwal+ryha9OPazvxzgKm/om5UncYFG0=;
 b=bBYhttj9ZohmpCUeZ6EzXblqhezd/cl1Olnf8M5MiJ1W/yJYbRzqQK8oIMDigDcllQ
 vwi1h2Rjh68ApsDqhEHh4tQtg1SM+/E1ZXeg0+6wMA8FJDLOnkc7WVfV2nOsi360hw3O
 xKu20ITP8uA4jmTP4eoTwaBTCaO1lMiAoq35G1SMiQcyZ4B5Ap3+2CjO9uAOf7tvAxOX
 SytzbTlXugVJAb9kPrRAdl57Egh1CcVa7N2VVQZRJpV47FUEcm9vVyzG5KnoMC/qHuA7
 R+3osUSHzOprbK7NJXtUT8YVO3xKtKxJdMimPjdO/13FBH8iVai990CbDRwMq/Eq/ycr
 RuUw==
X-Gm-Message-State: APjAAAULA617VOPPssyzWtyv7IVGKk2DVs2rlYlz3e34FvPBaY8U1jtD
 i88mgrE7cyLsLaveLPUPX555Nov5
X-Google-Smtp-Source: APXvYqx1dA/JPR7XcbdKII2zgWIYE9X0q+SR6RjqL/DBR1O5bfb7jCHvKPypUKiQh57rwK5scF7lXg==
X-Received: by 2002:a1c:cc0d:: with SMTP id h13mr62395558wmb.119.1563801685791; 
 Mon, 22 Jul 2019 06:21:25 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7?
 ([2a02:908:1252:fb60:be8a:bd56:1f94:86e7])
 by smtp.gmail.com with ESMTPSA id u18sm32706934wmd.19.2019.07.22.06.21.24
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 22 Jul 2019 06:21:25 -0700 (PDT)
Subject: Re: [PATCH] drm/syncobj: fix leaking dma_fence in
 drm_syncobj_query_ioctl
To: Lionel Landwerlin <lionel.g.landwerlin@intel.com>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
References: <20190722125938.43308-1-christian.koenig@amd.com>
 <fb8e26b0-c3f0-d4c8-8375-ec21e2cebea3@intel.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <a4c1c291-bff1-d7cb-f510-fdea63e1eb9b@gmail.com>
Date: Mon, 22 Jul 2019 15:21:24 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <fb8e26b0-c3f0-d4c8-8375-ec21e2cebea3@intel.com>
Content-Language: en-US
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=reply-to:subject:to:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=P5gDWsvKEH/zrwal+ryha9OPazvxzgKm/om5UncYFG0=;
 b=TUEvNUi8ixVehVH/Z0aju8oYjcE6KQk6dfzc23ien6bmKkkmyj+XW/oKQvfen5yYcK
 JQ+dOxfiMDPB9w+UL+quwloB9uZw5dKMD+S0gkzMBKABo+YQjZWfEhdpChy0swOLulmK
 PrV4daDAtaoGmSFu+iKOu7GGFIZ+8NwHGwvh8UkEV3F0zCLZaGQ+BHWP9+0p+8pVfaH7
 QwQDif1Q1h3K8/Rtjk6bNqmxu0ziAjOWGTZgbMR0QucLgxa0djMZtugK41mhsvuuRhzd
 IWN/A48AV0hjrEE+DigRbcl+wR0ockq4NmNAS3vs7kLvjz2b0Xm6EiXrsrbmCOIMYmVq
 T4vw==
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
Reply-To: christian.koenig@amd.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMjIuMDcuMTkgdW0gMTU6MTYgc2NocmllYiBMaW9uZWwgTGFuZHdlcmxpbjoKPiBPbiAyMi8w
Ny8yMDE5IDE1OjU5LCBDaHJpc3RpYW4gS8O2bmlnIHdyb3RlOgo+PiBXZSBuZWVkIHRvIGNoZWNr
IHRoZSBjb250ZXh0IG51bWJlciBpbnN0ZWFkIGlmIHRoZSBwcmV2aW91cyBzZXF1ZW5jZSAKPj4g
dG8gZGV0ZWN0Cj4+IGFuIGVycm9yIGFuZCBpZiBhbiBlcnJvciBpcyBkZXRlY3RlZCB3ZSBuZWVk
IHRvIGRyb3AgdGhlIHJlZmVyZW5jZSB0byAKPj4gdGhlCj4+IGN1cnJlbnQgZmVuY2Ugb3Igb3Ro
ZXJ3aXNlIHdvdWxkIGxlYWsgaXQuCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IENocmlzdGlhbiBLw7Zu
aWcgPGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4KPgo+IEZpeGVzOiAyN2I1NzVhOWFhMmYgKCJk
cm0vc3luY29iajogYWRkIHRpbWVsaW5lIHBheWxvYWQgcXVlcnkgaW9jdGwgdjYiKQo+IFJldmll
d2VkLWJ5OiBMaW9uZWwgTGFuZHdlcmxpbiA8bGlvbmVsLmcubGFuZHdlcmxpbkBpbnRlbC5jb20+
CgpDQyBzdGFibGU/IEknbSBub3Qgc3VyZSB3aGVuIHRoaXMgZ290IHVwc3RyZWFtLgoKQ2hyaXN0
aWFuLgoKPgo+PiAtLS0KPj4gwqAgZHJpdmVycy9ncHUvZHJtL2RybV9zeW5jb2JqLmMgfCAxMCAr
KysrKy0tLS0tCj4+IMKgIDEgZmlsZSBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKyksIDUgZGVsZXRp
b25zKC0pCj4+Cj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vZHJtX3N5bmNvYmouYyAK
Pj4gYi9kcml2ZXJzL2dwdS9kcm0vZHJtX3N5bmNvYmouYwo+PiBpbmRleCA3NWNiNGJiNzYxOWUu
LjE0MzhkY2IzZWJiMSAxMDA2NDQKPj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2RybV9zeW5jb2Jq
LmMKPj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2RybV9zeW5jb2JqLmMKPj4gQEAgLTEyOTgsMTQg
KzEyOTgsMTQgQEAgaW50IGRybV9zeW5jb2JqX3F1ZXJ5X2lvY3RsKHN0cnVjdCBkcm1fZGV2aWNl
IAo+PiAqZGV2LCB2b2lkICpkYXRhLAo+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBzdHJ1
Y3QgZG1hX2ZlbmNlICppdGVyLCAqbGFzdF9zaWduYWxlZCA9IE5VTEw7Cj4+IMKgIMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgIGRtYV9mZW5jZV9jaGFpbl9mb3JfZWFjaChpdGVyLCBmZW5jZSkg
ewo+PiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGlmICghaXRlcikKPj4gLcKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGJyZWFrOwo+PiAtwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgIGRtYV9mZW5jZV9wdXQobGFzdF9zaWduYWxlZCk7Cj4+IC3CoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgbGFzdF9zaWduYWxlZCA9IGRtYV9mZW5jZV9nZXQo
aXRlcik7Cj4+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgaWYgKCF0b19kbWFfZmVu
Y2VfY2hhaW4obGFzdF9zaWduYWxlZCktPnByZXZfc2Vxbm8pCj4+ICvCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqAgaWYgKGl0ZXItPmNvbnRleHQgIT0gZmVuY2UtPmNvbnRleHQpIHsKPj4g
K8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGRtYV9mZW5jZV9wdXQoaXRl
cik7Cj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAvKiBJdCBp
cyBtb3N0IGxpa2VseSB0aGF0IHRpbWVsaW5lIGhhcwo+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAqIHVub3JkZXIgcG9pbnRzLiAqLwo+PiDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgYnJlYWs7Cj4+ICvCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqAgfQo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGRt
YV9mZW5jZV9wdXQobGFzdF9zaWduYWxlZCk7Cj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqAgbGFzdF9zaWduYWxlZCA9IGRtYV9mZW5jZV9nZXQoaXRlcik7Cj4+IMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgIH0KPj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcG9pbnQgPSBk
bWFfZmVuY2VfaXNfc2lnbmFsZWQobGFzdF9zaWduYWxlZCkgPwo+PiDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgIGxhc3Rfc2lnbmFsZWQtPnNlcW5vIDoKPgo+CgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBs
aXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVz
a3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
