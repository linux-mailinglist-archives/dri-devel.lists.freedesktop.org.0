Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BC9DE2EC9
	for <lists+dri-devel@lfdr.de>; Thu, 24 Oct 2019 12:26:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B32CF6E201;
	Thu, 24 Oct 2019 10:26:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A55E6E1F4;
 Thu, 24 Oct 2019 10:26:02 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id n7so1354439wmc.3;
 Thu, 24 Oct 2019 03:26:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=pYCwuvgTQdYrDj2Px6CRQM89iEVVohZKJJZpy41b42U=;
 b=UalDMnVkqrvowJB29AbDmvqaPgsZf8MoZBhloOSnF0A5HCiIdJZM8jcvyQyeGoLNhB
 8ofqKmot8o50MOKdOly+k75nnAr9SKOByHZNWqbVbRnWzt+waz+RltrWfxEH7Gfi67UR
 Cp0nOl2P6DtkgzScl01aeMTD9DClG32Dx7rJPbYMxItOGY0XJOClU3v9tPcr4ZCR/Ske
 t6heaRd7rTXDq3ddoVYzy4qsWLwl77L9b5p/c1YqGzGYpuiVW104btIgSc8wOlYtvsET
 2tsoX1pNkW/0F9L94lVMk1u/PqwhVO65f1xwjZ4QoSE8gBTRCGFdHn4IOej/oyUB+PTm
 8F9A==
X-Gm-Message-State: APjAAAW3uHDTKJ5TG4vj5xwlhoDM9oDxF3YpZlqVoDHzXW248haTLWpW
 WpCjMCzhgpaW98YJAkW9deohpRS8
X-Google-Smtp-Source: APXvYqwstaG7X8XIMUWEkvXxwohyFbfwO2qPcTruCEz/lQ5/CXAJAQI+R60uXqR9AjV0SWzYZhBa4g==
X-Received: by 2002:a1c:108:: with SMTP id 8mr4114688wmb.25.1571912760727;
 Thu, 24 Oct 2019 03:26:00 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7?
 ([2a02:908:1252:fb60:be8a:bd56:1f94:86e7])
 by smtp.gmail.com with ESMTPSA id e3sm1835279wme.36.2019.10.24.03.25.59
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 24 Oct 2019 03:26:00 -0700 (PDT)
Subject: Re: [PATCH] drm/ttm: use the parent resv for ghost objects v2
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
To: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 "Zhou, David(ChunMing)" <David1.Zhou@amd.com>, Huang Rui <ray.huang@amd.com>
References: <20191018115831.14951-1-christian.koenig@amd.com>
Message-ID: <01bf3c2a-e178-6083-01a8-bb06aaef10bf@gmail.com>
Date: Thu, 24 Oct 2019 12:25:59 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191018115831.14951-1-christian.koenig@amd.com>
Content-Language: en-US
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=subject:from:to:references:message-id:date:user-agent:mime-version
 :in-reply-to:content-transfer-encoding:content-language;
 bh=pYCwuvgTQdYrDj2Px6CRQM89iEVVohZKJJZpy41b42U=;
 b=SJ/cSo/Efj3wg9v2BaP123rHCcf/tKrVr8GS5TDIgnhg+blYKjc6yijjySypcGRuxu
 UF4fYDI3guSQ3uYCftIu6DQoqe0LvVYqj/FPUKmXudVDtcfo/lhknVp0oIikt77CXGdy
 vumLaomGpvSQA0QjbwQeIqIdJZ98aavTbGs0M3HYMAjwoluL2e0ftW1Zc79KBP+ZW2oY
 HY9TGT2szD5JSo/PDwZZQIVeEaMV9d9NoVsoRYWzn/ltEho5lm29W+YLHO56uuITLWPL
 oDjopRmQiOSw5OJIGsoHe84Z0r931yfaaYNNYi9T28YeXzgWrCE6AdeBlomSU7VjLxsF
 tGgw==
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

UGluZz8KCkFtIDE4LjEwLjE5IHVtIDEzOjU4IHNjaHJpZWIgQ2hyaXN0aWFuIEvDtm5pZzoKPiBU
aGlzIHdheSB0aGUgVFRNIGlzIGRlc3Ryb3llZCB3aXRoIHRoZSBjb3JyZWN0IGRtYV9yZXN2IG9i
amVjdAo+IGxvY2tlZCBhbmQgd2UgY2FuIGV2ZW4gcGlwZWxpbmUgaW1wb3J0ZWQgQk8gZXZpY3Rp
b25zLgo+Cj4gdjI6IExpbWl0IHRoaXMgdG8gb25seSBjYXNlcyB3aGVuIHRoZSBwYXJlbnQgb2Jq
ZWN0IHVzZXMgYSBzZXBhcmF0ZQo+ICAgICAgcmVzZXJ2YXRpb24gb2JqZWN0IGFzIHdlbGwuIFRo
aXMgZml4ZXMgYW5vdGhlciBPT00gcHJvYmxlbS4KPgo+IFNpZ25lZC1vZmYtYnk6IENocmlzdGlh
biBLw7ZuaWcgPGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4KPiAtLS0KPiAgIGRyaXZlcnMvZ3B1
L2RybS90dG0vdHRtX2JvX3V0aWwuYyB8IDE2ICsrKysrKysrKy0tLS0tLS0KPiAgIDEgZmlsZSBj
aGFuZ2VkLCA5IGluc2VydGlvbnMoKyksIDcgZGVsZXRpb25zKC0pCj4KPiBkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9ncHUvZHJtL3R0bS90dG1fYm9fdXRpbC5jIGIvZHJpdmVycy9ncHUvZHJtL3R0bS90
dG1fYm9fdXRpbC5jCj4gaW5kZXggZTAzMGMyN2Y1M2NmLi40NWU0NDBmODBiN2IgMTAwNjQ0Cj4g
LS0tIGEvZHJpdmVycy9ncHUvZHJtL3R0bS90dG1fYm9fdXRpbC5jCj4gKysrIGIvZHJpdmVycy9n
cHUvZHJtL3R0bS90dG1fYm9fdXRpbC5jCj4gQEAgLTUxMiw3ICs1MTIsOSBAQCBzdGF0aWMgaW50
IHR0bV9idWZmZXJfb2JqZWN0X3RyYW5zZmVyKHN0cnVjdCB0dG1fYnVmZmVyX29iamVjdCAqYm8s
Cj4gICAJa3JlZl9pbml0KCZmYm8tPmJhc2Uua3JlZik7Cj4gICAJZmJvLT5iYXNlLmRlc3Ryb3kg
PSAmdHRtX3RyYW5zZmVyZWRfZGVzdHJveTsKPiAgIAlmYm8tPmJhc2UuYWNjX3NpemUgPSAwOwo+
IC0JZmJvLT5iYXNlLmJhc2UucmVzdiA9ICZmYm8tPmJhc2UuYmFzZS5fcmVzdjsKPiArCWlmIChi
by0+YmFzZS5yZXN2ID09ICZiby0+YmFzZS5fcmVzdikKPiArCQlmYm8tPmJhc2UuYmFzZS5yZXN2
ID0gJmZiby0+YmFzZS5iYXNlLl9yZXN2Owo+ICsKPiAgIAlkbWFfcmVzdl9pbml0KGZiby0+YmFz
ZS5iYXNlLnJlc3YpOwo+ICAgCXJldCA9IGRtYV9yZXN2X3RyeWxvY2soZmJvLT5iYXNlLmJhc2Uu
cmVzdik7Cj4gICAJV0FSTl9PTighcmV0KTsKPiBAQCAtNzExLDcgKzcxMyw3IEBAIGludCB0dG1f
Ym9fbW92ZV9hY2NlbF9jbGVhbnVwKHN0cnVjdCB0dG1fYnVmZmVyX29iamVjdCAqYm8sCj4gICAJ
CWlmIChyZXQpCj4gICAJCQlyZXR1cm4gcmV0Owo+ICAgCj4gLQkJZG1hX3Jlc3ZfYWRkX2V4Y2xf
ZmVuY2UoZ2hvc3Rfb2JqLT5iYXNlLnJlc3YsIGZlbmNlKTsKPiArCQlkbWFfcmVzdl9hZGRfZXhj
bF9mZW5jZSgmZ2hvc3Rfb2JqLT5iYXNlLl9yZXN2LCBmZW5jZSk7Cj4gICAKPiAgIAkJLyoqCj4g
ICAJCSAqIElmIHdlJ3JlIG5vdCBtb3ZpbmcgdG8gZml4ZWQgbWVtb3J5LCB0aGUgVFRNIG9iamVj
dAo+IEBAIC03MjQsNyArNzI2LDcgQEAgaW50IHR0bV9ib19tb3ZlX2FjY2VsX2NsZWFudXAoc3Ry
dWN0IHR0bV9idWZmZXJfb2JqZWN0ICpibywKPiAgIAkJZWxzZQo+ICAgCQkJYm8tPnR0bSA9IE5V
TEw7Cj4gICAKPiAtCQl0dG1fYm9fdW5yZXNlcnZlKGdob3N0X29iaik7Cj4gKwkJZG1hX3Jlc3Zf
dW5sb2NrKCZnaG9zdF9vYmotPmJhc2UuX3Jlc3YpOwo+ICAgCQl0dG1fYm9fcHV0KGdob3N0X29i
aik7Cj4gICAJfQo+ICAgCj4gQEAgLTc2Nyw3ICs3NjksNyBAQCBpbnQgdHRtX2JvX3BpcGVsaW5l
X21vdmUoc3RydWN0IHR0bV9idWZmZXJfb2JqZWN0ICpibywKPiAgIAkJaWYgKHJldCkKPiAgIAkJ
CXJldHVybiByZXQ7Cj4gICAKPiAtCQlkbWFfcmVzdl9hZGRfZXhjbF9mZW5jZShnaG9zdF9vYmot
PmJhc2UucmVzdiwgZmVuY2UpOwo+ICsJCWRtYV9yZXN2X2FkZF9leGNsX2ZlbmNlKCZnaG9zdF9v
YmotPmJhc2UuX3Jlc3YsIGZlbmNlKTsKPiAgIAo+ICAgCQkvKioKPiAgIAkJICogSWYgd2UncmUg
bm90IG1vdmluZyB0byBmaXhlZCBtZW1vcnksIHRoZSBUVE0gb2JqZWN0Cj4gQEAgLTc4MCw3ICs3
ODIsNyBAQCBpbnQgdHRtX2JvX3BpcGVsaW5lX21vdmUoc3RydWN0IHR0bV9idWZmZXJfb2JqZWN0
ICpibywKPiAgIAkJZWxzZQo+ICAgCQkJYm8tPnR0bSA9IE5VTEw7Cj4gICAKPiAtCQl0dG1fYm9f
dW5yZXNlcnZlKGdob3N0X29iaik7Cj4gKwkJZG1hX3Jlc3ZfdW5sb2NrKCZnaG9zdF9vYmotPmJh
c2UuX3Jlc3YpOwo+ICAgCQl0dG1fYm9fcHV0KGdob3N0X29iaik7Cj4gICAKPiAgIAl9IGVsc2Ug
aWYgKGZyb20tPmZsYWdzICYgVFRNX01FTVRZUEVfRkxBR19GSVhFRCkgewo+IEBAIC04MzYsNyAr
ODM4LDcgQEAgaW50IHR0bV9ib19waXBlbGluZV9ndXR0aW5nKHN0cnVjdCB0dG1fYnVmZmVyX29i
amVjdCAqYm8pCj4gICAJaWYgKHJldCkKPiAgIAkJcmV0dXJuIHJldDsKPiAgIAo+IC0JcmV0ID0g
ZG1hX3Jlc3ZfY29weV9mZW5jZXMoZ2hvc3QtPmJhc2UucmVzdiwgYm8tPmJhc2UucmVzdik7Cj4g
KwlyZXQgPSBkbWFfcmVzdl9jb3B5X2ZlbmNlcygmZ2hvc3QtPmJhc2UuX3Jlc3YsIGJvLT5iYXNl
LnJlc3YpOwo+ICAgCS8qIExhc3QgcmVzb3J0LCB3YWl0IGZvciB0aGUgQk8gdG8gYmUgaWRsZSB3
aGVuIHdlIGFyZSBPT00gKi8KPiAgIAlpZiAocmV0KQo+ICAgCQl0dG1fYm9fd2FpdChibywgZmFs
c2UsIGZhbHNlKTsKPiBAQCAtODQ1LDcgKzg0Nyw3IEBAIGludCB0dG1fYm9fcGlwZWxpbmVfZ3V0
dGluZyhzdHJ1Y3QgdHRtX2J1ZmZlcl9vYmplY3QgKmJvKQo+ICAgCWJvLT5tZW0ubWVtX3R5cGUg
PSBUVE1fUExfU1lTVEVNOwo+ICAgCWJvLT50dG0gPSBOVUxMOwo+ICAgCj4gLQl0dG1fYm9fdW5y
ZXNlcnZlKGdob3N0KTsKPiArCWRtYV9yZXN2X3VubG9jaygmZ2hvc3QtPmJhc2UuX3Jlc3YpOwo+
ICAgCXR0bV9ib19wdXQoZ2hvc3QpOwo+ICAgCj4gICAJcmV0dXJuIDA7CgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0
CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
