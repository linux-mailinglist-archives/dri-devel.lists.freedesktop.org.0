Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A1FBD0FAE
	for <lists+dri-devel@lfdr.de>; Wed,  9 Oct 2019 15:10:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B8AD6E9A2;
	Wed,  9 Oct 2019 13:10:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D0C16E9A0;
 Wed,  9 Oct 2019 13:10:13 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id b9so2954363wrs.0;
 Wed, 09 Oct 2019 06:10:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:to:cc:references:from
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-transfer-encoding:content-language;
 bh=vzaTTrF4KJIoLtgxoj5PluvZsZC/0i3InXaG/lQH1VA=;
 b=LtDP7EiHABOc2TzMbdrYGEUN+P2Xi2RbELiqqVxisX7bbXWXWCEKK7CBNik6f8Gg3z
 oG14P/U9Rev9Uom57lH2iHfxdQN4/W3FUNcHk32G2xgNBYblAWaY6fWZwGWGRYUfWBTC
 YKhy26xkhPg6mJzarxPcUHT1mG3qzBg0LDl/heHYwqtzpyWMrbAcR4iyTyKAyXvIaVkW
 cduI/9qBMpBiqKPFGwvidoQRNRwlF7EUG0n3KFlH7u1rR+9f6GYPz22gwrZVd8q4hyop
 HESbEf7ocj/xvrGCbwTP8rxXbt61puGo4qaaejAuHRk5B6Xy6c+EyQNuNVURALVlpe+l
 ZuxA==
X-Gm-Message-State: APjAAAW4pueTS7t1taReFPchZ6+UrKlmMnCkjYeu8/3/yijbz/IA8HbX
 wnM4XoJovboJbnG3lVcDNIETN/R1
X-Google-Smtp-Source: APXvYqyUsoeQL71x6y1pF4VHQfKQaKru0b/PZKZyqJoIWa5aQSip6LHZ4aCzy10h821zYOyXbBUF3Q==
X-Received: by 2002:adf:814d:: with SMTP id 71mr2969304wrm.193.1570626611493; 
 Wed, 09 Oct 2019 06:10:11 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7?
 ([2a02:908:1252:fb60:be8a:bd56:1f94:86e7])
 by smtp.gmail.com with ESMTPSA id a2sm3526687wrt.45.2019.10.09.06.10.10
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 09 Oct 2019 06:10:10 -0700 (PDT)
Subject: Re: [PATCH 2/4] drm/ttm: use the parent resv for ghost objects v2
To: Daniel Vetter <daniel@ffwll.ch>
References: <20190829142917.13058-1-christian.koenig@amd.com>
 <20190829142917.13058-3-christian.koenig@amd.com>
 <20191008092552.GG16989@phenom.ffwll.local>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <d36c1631-1262-8c73-e62b-bbbddb708f1e@gmail.com>
Date: Wed, 9 Oct 2019 15:10:09 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20191008092552.GG16989@phenom.ffwll.local>
Content-Language: en-US
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=reply-to:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=vzaTTrF4KJIoLtgxoj5PluvZsZC/0i3InXaG/lQH1VA=;
 b=GnFLtj9EZ5d/HfgB5GBL2qwQ1VFDFmLQrT7d6vy9ec4i0oD0STil1BwTz7w/uskWoF
 2miBKROoD6snTohxmVVxczZqLQZuFppN9CPU59LZjqBcBJ9k2X+niZwMG37vaoxymsSi
 qGj+cQ3Btc3Dk3urId01qq+lAuQWOW1xTk4cSwPPuYEdu4lIS1nSa496Aq3ynqO45cy2
 GkKhAFISZFq9vrePCKsZ1eG91u3QKmOY/i+OkmkiO7qbcjwYFU2zrCH/O3WcPtRhTpo8
 RFRIwIbM8Q47bNxqdRU6tdEnwBiWWrBAmefa2N9YbdyzaQXss3iFkKFRajveSb1xWJIQ
 Mkig==
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
Cc: linaro-mm-sig@lists.linaro.org, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMDguMTAuMTkgdW0gMTE6MjUgc2NocmllYiBEYW5pZWwgVmV0dGVyOgo+IE9uIFRodSwgQXVn
IDI5LCAyMDE5IGF0IDA0OjI5OjE1UE0gKzAyMDAsIENocmlzdGlhbiBLw7ZuaWcgd3JvdGU6Cj4+
IFRoaXMgd2F5IHdlIGNhbiBldmVuIHBpcGVsaW5lIGltcG9ydGVkIEJPIGV2aWN0aW9ucy4KPj4K
Pj4gdjI6IExpbWl0IHRoaXMgdG8gb25seSBjYXNlcyB3aGVuIHRoZSBwYXJlbnQgb2JqZWN0IHVz
ZXMgYSBzZXBhcmF0ZQo+PiAgICAgIHJlc2VydmF0aW9uIG9iamVjdCBhcyB3ZWxsLiBUaGlzIGZp
eGVzIGFub3RoZXIgT09NIHByb2JsZW0uCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IENocmlzdGlhbiBL
w7ZuaWcgPGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4KPiBTaW5jZSBJIHJlYWQgcXVpdGUgYSBi
aXQgb2YgdHRtIEkgZmlndXJlZCBJJ2xsIHJldmlldyB0aGlzIHRvbywgYnV0IEknbQo+IHRvdGFs
bHkgbG9zdC4gQW5kIGdpdCBibGFtZSBnaXZlcyBtZSBhdCBiZXN0IGNvbW1pdHMgd2l0aCBvbmUt
bGluZXIgY29tbWl0Cj4gbWVzc2FnZXMsIGFuZCB0aGUgZG9jcyBhcmVuJ3QgZXhwbGFpbmluZyBt
dWNoIGF0IGFsbCBlaXRoZXIgKGFuZCBnZW5lcmFsbHkKPiB0aGV5IGRpZG4ndCBnZXQgdXBkYXRl
ZCBhdCBhbGwgd2l0aCBhbGwgdGhlIGNoYW5nZXMgaW4gdGhlIHBhc3QgeWVhcnMpLgo+Cj4gSSBo
YXZlIGEgdmFndWUgaWRlYSBvZiB3aGF0IHlvdSdyZSBkb2luZyBoZXJlLCBidXQgbm90IGVub3Vn
aCB0byBkbyByZXZpZXcKPiB3aXRoIGFueSBjb25maWRlbmNlLiBBbmQgZnJvbSBvdGhlciB0dG0g
cGF0Y2hlcyBmcm9tIGFtZCBpdCBmZWVscyBhIGxvdAo+IGxpa2Ugd2UgaGF2ZSBlc3NlbnRpYWxs
eSBhIGJ1cyBmYWN0b3Igb2YgMSBmb3IgYWxsIHRoaW5ncyB0dG0gOi0vCgpZZWFoLCB0aGF0J3Mg
b25lIG9mIGEgY291cGxlIG9mIHJlYXNvbnMgd2h5IEkgd2FudCB0byBnZXQgcmlkIG9mIFRUTSBp
biAKdGhlIGxvbmcgdGVybS4KCkJhc2ljYWxseSB0aGlzIGlzIGEgYnVnIGZpeCBmb3IgZGVsYXkg
ZnJlZWluZyB0dG0gb2JqZWN0cy4gV2hlbiB3ZSBoYW5nIAp0aGUgdHRtIG9iamVjdCBvbiBhIGdo
b3N0IG9iamVjdCB0byBiZSBmcmVlZCBhbmQgdGhlIHR0bSBvYmplY3QgaXMgYW4gCmltcG9ydGVk
IERNQS1idWYgd2UgcnVuIGludG8gdGhlIHByb2JsZW0gdGhhdCB3ZSB3YW50IHRvIGRyb3AgdGhl
IAptYXBwaW5nLCBidXQgaGF2ZSB0aGUgd3JvbmcgbG9jayB0YWtlbiAodGhlIGxvY2sgb2YgdGhl
IGdob3N0IGFuZCBub3Qgb2YgCnRoZSBwYXJlbnQpLgoKUmVnYXJkcywKQ2hyaXN0aWFuLgoKPiAt
RGFuaWVsCj4KPj4gLS0tCj4+ICAgZHJpdmVycy9ncHUvZHJtL3R0bS90dG1fYm9fdXRpbC5jIHwg
MTYgKysrKysrKysrLS0tLS0tLQo+PiAgIDEgZmlsZSBjaGFuZ2VkLCA5IGluc2VydGlvbnMoKyks
IDcgZGVsZXRpb25zKC0pCj4+Cj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vdHRtL3R0
bV9ib191dGlsLmMgYi9kcml2ZXJzL2dwdS9kcm0vdHRtL3R0bV9ib191dGlsLmMKPj4gaW5kZXgg
ZmU4MWM1NjVlN2VmLi4yZWJlOWZlN2Y2YzggMTAwNjQ0Cj4+IC0tLSBhL2RyaXZlcnMvZ3B1L2Ry
bS90dG0vdHRtX2JvX3V0aWwuYwo+PiArKysgYi9kcml2ZXJzL2dwdS9kcm0vdHRtL3R0bV9ib191
dGlsLmMKPj4gQEAgLTUxNyw3ICs1MTcsOSBAQCBzdGF0aWMgaW50IHR0bV9idWZmZXJfb2JqZWN0
X3RyYW5zZmVyKHN0cnVjdCB0dG1fYnVmZmVyX29iamVjdCAqYm8sCj4+ICAgCWtyZWZfaW5pdCgm
ZmJvLT5iYXNlLmtyZWYpOwo+PiAgIAlmYm8tPmJhc2UuZGVzdHJveSA9ICZ0dG1fdHJhbnNmZXJl
ZF9kZXN0cm95Owo+PiAgIAlmYm8tPmJhc2UuYWNjX3NpemUgPSAwOwo+PiAtCWZiby0+YmFzZS5i
YXNlLnJlc3YgPSAmZmJvLT5iYXNlLmJhc2UuX3Jlc3Y7Cj4+ICsJaWYgKGJvLT5iYXNlLnJlc3Yg
PT0gJmJvLT5iYXNlLl9yZXN2KQo+PiArCQlmYm8tPmJhc2UuYmFzZS5yZXN2ID0gJmZiby0+YmFz
ZS5iYXNlLl9yZXN2Owo+PiArCj4+ICAgCWRtYV9yZXN2X2luaXQoZmJvLT5iYXNlLmJhc2UucmVz
dik7Cj4+ICAgCXJldCA9IGRtYV9yZXN2X3RyeWxvY2soZmJvLT5iYXNlLmJhc2UucmVzdik7Cj4+
ICAgCVdBUk5fT04oIXJldCk7Cj4+IEBAIC03MTYsNyArNzE4LDcgQEAgaW50IHR0bV9ib19tb3Zl
X2FjY2VsX2NsZWFudXAoc3RydWN0IHR0bV9idWZmZXJfb2JqZWN0ICpibywKPj4gICAJCWlmIChy
ZXQpCj4+ICAgCQkJcmV0dXJuIHJldDsKPj4gICAKPj4gLQkJZG1hX3Jlc3ZfYWRkX2V4Y2xfZmVu
Y2UoZ2hvc3Rfb2JqLT5iYXNlLnJlc3YsIGZlbmNlKTsKPj4gKwkJZG1hX3Jlc3ZfYWRkX2V4Y2xf
ZmVuY2UoJmdob3N0X29iai0+YmFzZS5fcmVzdiwgZmVuY2UpOwo+PiAgIAo+PiAgIAkJLyoqCj4+
ICAgCQkgKiBJZiB3ZSdyZSBub3QgbW92aW5nIHRvIGZpeGVkIG1lbW9yeSwgdGhlIFRUTSBvYmpl
Y3QKPj4gQEAgLTcyOSw3ICs3MzEsNyBAQCBpbnQgdHRtX2JvX21vdmVfYWNjZWxfY2xlYW51cChz
dHJ1Y3QgdHRtX2J1ZmZlcl9vYmplY3QgKmJvLAo+PiAgIAkJZWxzZQo+PiAgIAkJCWJvLT50dG0g
PSBOVUxMOwo+PiAgIAo+PiAtCQl0dG1fYm9fdW5yZXNlcnZlKGdob3N0X29iaik7Cj4+ICsJCWRt
YV9yZXN2X3VubG9jaygmZ2hvc3Rfb2JqLT5iYXNlLl9yZXN2KTsKPj4gICAJCXR0bV9ib19wdXQo
Z2hvc3Rfb2JqKTsKPj4gICAJfQo+PiAgIAo+PiBAQCAtNzcyLDcgKzc3NCw3IEBAIGludCB0dG1f
Ym9fcGlwZWxpbmVfbW92ZShzdHJ1Y3QgdHRtX2J1ZmZlcl9vYmplY3QgKmJvLAo+PiAgIAkJaWYg
KHJldCkKPj4gICAJCQlyZXR1cm4gcmV0Owo+PiAgIAo+PiAtCQlkbWFfcmVzdl9hZGRfZXhjbF9m
ZW5jZShnaG9zdF9vYmotPmJhc2UucmVzdiwgZmVuY2UpOwo+PiArCQlkbWFfcmVzdl9hZGRfZXhj
bF9mZW5jZSgmZ2hvc3Rfb2JqLT5iYXNlLl9yZXN2LCBmZW5jZSk7Cj4+ICAgCj4+ICAgCQkvKioK
Pj4gICAJCSAqIElmIHdlJ3JlIG5vdCBtb3ZpbmcgdG8gZml4ZWQgbWVtb3J5LCB0aGUgVFRNIG9i
amVjdAo+PiBAQCAtNzg1LDcgKzc4Nyw3IEBAIGludCB0dG1fYm9fcGlwZWxpbmVfbW92ZShzdHJ1
Y3QgdHRtX2J1ZmZlcl9vYmplY3QgKmJvLAo+PiAgIAkJZWxzZQo+PiAgIAkJCWJvLT50dG0gPSBO
VUxMOwo+PiAgIAo+PiAtCQl0dG1fYm9fdW5yZXNlcnZlKGdob3N0X29iaik7Cj4+ICsJCWRtYV9y
ZXN2X3VubG9jaygmZ2hvc3Rfb2JqLT5iYXNlLl9yZXN2KTsKPj4gICAJCXR0bV9ib19wdXQoZ2hv
c3Rfb2JqKTsKPj4gICAKPj4gICAJfSBlbHNlIGlmIChmcm9tLT5mbGFncyAmIFRUTV9NRU1UWVBF
X0ZMQUdfRklYRUQpIHsKPj4gQEAgLTg0MSw3ICs4NDMsNyBAQCBpbnQgdHRtX2JvX3BpcGVsaW5l
X2d1dHRpbmcoc3RydWN0IHR0bV9idWZmZXJfb2JqZWN0ICpibykKPj4gICAJaWYgKHJldCkKPj4g
ICAJCXJldHVybiByZXQ7Cj4+ICAgCj4+IC0JcmV0ID0gZG1hX3Jlc3ZfY29weV9mZW5jZXMoZ2hv
c3QtPmJhc2UucmVzdiwgYm8tPmJhc2UucmVzdik7Cj4+ICsJcmV0ID0gZG1hX3Jlc3ZfY29weV9m
ZW5jZXMoJmdob3N0LT5iYXNlLl9yZXN2LCBiby0+YmFzZS5yZXN2KTsKPj4gICAJLyogTGFzdCBy
ZXNvcnQsIHdhaXQgZm9yIHRoZSBCTyB0byBiZSBpZGxlIHdoZW4gd2UgYXJlIE9PTSAqLwo+PiAg
IAlpZiAocmV0KQo+PiAgIAkJdHRtX2JvX3dhaXQoYm8sIGZhbHNlLCBmYWxzZSk7Cj4+IEBAIC04
NTAsNyArODUyLDcgQEAgaW50IHR0bV9ib19waXBlbGluZV9ndXR0aW5nKHN0cnVjdCB0dG1fYnVm
ZmVyX29iamVjdCAqYm8pCj4+ICAgCWJvLT5tZW0ubWVtX3R5cGUgPSBUVE1fUExfU1lTVEVNOwo+
PiAgIAliby0+dHRtID0gTlVMTDsKPj4gICAKPj4gLQl0dG1fYm9fdW5yZXNlcnZlKGdob3N0KTsK
Pj4gKwlkbWFfcmVzdl91bmxvY2soJmdob3N0LT5iYXNlLl9yZXN2KTsKPj4gICAJdHRtX2JvX3B1
dChnaG9zdCk7Cj4+ICAgCj4+ICAgCXJldHVybiAwOwo+PiAtLSAKPj4gMi4xNy4xCj4+CgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFp
bGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
