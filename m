Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D7FB2F2D2A
	for <lists+dri-devel@lfdr.de>; Tue, 12 Jan 2021 11:49:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5508E6E1B6;
	Tue, 12 Jan 2021 10:49:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [IPv6:2a00:1450:4864:20::62b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F3FB6E1B6
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Jan 2021 10:49:23 +0000 (UTC)
Received: by mail-ej1-x62b.google.com with SMTP id d17so2810102ejy.9
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Jan 2021 02:49:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:from:cc:references:message-id:date:user-agent:mime-version
 :in-reply-to:content-transfer-encoding:content-language;
 bh=e50Kfro41y/kqlYUs5TLASWzFPjOnEroOzgIUmXQDNg=;
 b=py6KnfgwYknH7R9oKOGiR54LjFrOaJHmlFi9OpwValqylzxzVLNMNHLeoqixk4uCOR
 tRAgZMidxRDYX/ylcmc99wssmJbMLOKuGTlkMOG2mnlNi1kS3aanoFv1KXDI93pRjOXb
 rjGCWPCP0sGoLu/wg5zAr0K8EZ5sjduNZSTfBgWxU80r4ukRHG5ScPKsfgjUdOamvuAM
 x3NL/j1HNwqIl/fxWW4k0dEAn1yI7Gwk8tOdDrJK2Vt5QV/ru3YVl9dlHsHnqPGmBK7y
 OTViV6Xb93p3Cdgust8zrTMLBhLgYOv/RygE+rXu36sQdlCcX+s2mfOmXbm4rC2SpdQk
 ja7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=e50Kfro41y/kqlYUs5TLASWzFPjOnEroOzgIUmXQDNg=;
 b=Ip2xnNTQD2aKzGP/DdRUUR1xoxsZyv6XSDwqvJBG8xHQvl71SOl2Qu4pGfh20f9HMm
 /DwUvTdP5Fd18NP+julRDC8hnTmRsWBU8fw6kMewHtmszGuc5NH5RScbEFxoHAW+aSgh
 enV1u5HcCk3qu8MBmYKmZs6qwmvJog5hBszmeCFzpaBvLzsFi5x5gm7uMSm3to9k+fQg
 vhNq3j90Av9ajirKTjOGt3Gqim1rYCptkUq9Gw/YCi0pOXh8W2Z0ZLu0MJExJk23yyR8
 Bn8e1HRH+6guzdrel53LyZkwPPZka2gKaGklC2k3T66iPxU+XksTxNCAFA4vAGWwV6Un
 hQbg==
X-Gm-Message-State: AOAM532BIoLS1sk+vbaLkS+6GRrshio+cJ4JBhtjqLRNyVthajUMlxf8
 N69ZSspm6kLUpxjkG/okBr0=
X-Google-Smtp-Source: ABdhPJwqp8EO3kaomnwINt6L67cc1F5fOZg4HBS21Vn0Z+DOV8g8Pik/nzSYjtr0O8CsXugLoBX7aQ==
X-Received: by 2002:a17:906:fb9b:: with SMTP id
 lr27mr2843776ejb.175.1610448562099; 
 Tue, 12 Jan 2021 02:49:22 -0800 (PST)
Received: from ?IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7?
 ([2a02:908:1252:fb60:be8a:bd56:1f94:86e7])
 by smtp.gmail.com with ESMTPSA id pg9sm1021834ejb.102.2021.01.12.02.49.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 12 Jan 2021 02:49:21 -0800 (PST)
Subject: Re: [PATCH] drm/ttm: make the pool shrinker lock a mutex
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
References: <20210111135721.2704-1-christian.koenig@amd.com>
Message-ID: <2595593a-59e7-3bc8-78e9-c31ee55f625d@gmail.com>
Date: Tue, 12 Jan 2021 11:49:18 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210111135721.2704-1-christian.koenig@amd.com>
Content-Language: en-US
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
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
Cc: Huang Rui <ray.huang@amd.com>, dri-devel@lists.freedesktop.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

UGluZz8gUmF5IGNhbiBJIGdldCBhbiBhY2tlZC1ieT8gSXQncyBhbiBpbXBvcnRhbnQgYnVnIGZp
eC4KClRoYW5rcywKQ2hyaXN0aWFuLgoKQW0gMTEuMDEuMjEgdW0gMTQ6NTcgc2NocmllYiBDaHJp
c3RpYW4gS8O2bmlnOgo+IHNldF9wYWdlc193YigpIG1pZ2h0IHNsZWVwIGFuZCBzbyB3ZSBjYW4n
dCBkbyB0aGlzIGluIGFuIGF0b21pYyBjb250ZXh0Lgo+Cj4gU2lnbmVkLW9mZi1ieTogQ2hyaXN0
aWFuIEvDtm5pZyA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPgo+IFJlcG9ydGVkLWJ5OiBNaWto
YWlsIEdhdnJpbG92IDxtaWtoYWlsLnYuZ2F2cmlsb3ZAZ21haWwuY29tPgo+IEZpeGVzOiBkMDk5
ZmM4ZjU0MGEgKCJkcm0vdHRtOiBuZXcgVFQgYmFja2VuZCBhbGxvY2F0aW9uIHBvb2wgdjMiKQo+
IC0tLQo+ICAgZHJpdmVycy9ncHUvZHJtL3R0bS90dG1fcG9vbC5jIHwgMjAgKysrKysrKysrKy0t
LS0tLS0tLS0KPiAgIDEgZmlsZSBjaGFuZ2VkLCAxMCBpbnNlcnRpb25zKCspLCAxMCBkZWxldGlv
bnMoLSkKPgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vdHRtL3R0bV9wb29sLmMgYi9k
cml2ZXJzL2dwdS9kcm0vdHRtL3R0bV9wb29sLmMKPiBpbmRleCBhMDBiN2FiOWMxNGMuLjZhNmVl
YmE0MjNkMSAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vdHRtL3R0bV9wb29sLmMKPiAr
KysgYi9kcml2ZXJzL2dwdS9kcm0vdHRtL3R0bV9wb29sLmMKPiBAQCAtNjYsNyArNjYsNyBAQCBz
dGF0aWMgc3RydWN0IHR0bV9wb29sX3R5cGUgZ2xvYmFsX3VuY2FjaGVkW01BWF9PUkRFUl07Cj4g
ICBzdGF0aWMgc3RydWN0IHR0bV9wb29sX3R5cGUgZ2xvYmFsX2RtYTMyX3dyaXRlX2NvbWJpbmVk
W01BWF9PUkRFUl07Cj4gICBzdGF0aWMgc3RydWN0IHR0bV9wb29sX3R5cGUgZ2xvYmFsX2RtYTMy
X3VuY2FjaGVkW01BWF9PUkRFUl07Cj4gICAKPiAtc3RhdGljIHNwaW5sb2NrX3Qgc2hyaW5rZXJf
bG9jazsKPiArc3RhdGljIHN0cnVjdCBtdXRleCBzaHJpbmtlcl9sb2NrOwo+ICAgc3RhdGljIHN0
cnVjdCBsaXN0X2hlYWQgc2hyaW5rZXJfbGlzdDsKPiAgIHN0YXRpYyBzdHJ1Y3Qgc2hyaW5rZXIg
bW1fc2hyaW5rZXI7Cj4gICAKPiBAQCAtMjQ5LDkgKzI0OSw5IEBAIHN0YXRpYyB2b2lkIHR0bV9w
b29sX3R5cGVfaW5pdChzdHJ1Y3QgdHRtX3Bvb2xfdHlwZSAqcHQsIHN0cnVjdCB0dG1fcG9vbCAq
cG9vbCwKPiAgIAlzcGluX2xvY2tfaW5pdCgmcHQtPmxvY2spOwo+ICAgCUlOSVRfTElTVF9IRUFE
KCZwdC0+cGFnZXMpOwo+ICAgCj4gLQlzcGluX2xvY2soJnNocmlua2VyX2xvY2spOwo+ICsJbXV0
ZXhfbG9jaygmc2hyaW5rZXJfbG9jayk7Cj4gICAJbGlzdF9hZGRfdGFpbCgmcHQtPnNocmlua2Vy
X2xpc3QsICZzaHJpbmtlcl9saXN0KTsKPiAtCXNwaW5fdW5sb2NrKCZzaHJpbmtlcl9sb2NrKTsK
PiArCW11dGV4X3VubG9jaygmc2hyaW5rZXJfbG9jayk7Cj4gICB9Cj4gICAKPiAgIC8qIFJlbW92
ZSBhIHBvb2xfdHlwZSBmcm9tIHRoZSBnbG9iYWwgc2hyaW5rZXIgbGlzdCBhbmQgZnJlZSBhbGwg
cGFnZXMgKi8KPiBAQCAtMjU5LDkgKzI1OSw5IEBAIHN0YXRpYyB2b2lkIHR0bV9wb29sX3R5cGVf
ZmluaShzdHJ1Y3QgdHRtX3Bvb2xfdHlwZSAqcHQpCj4gICB7Cj4gICAJc3RydWN0IHBhZ2UgKnAs
ICp0bXA7Cj4gICAKPiAtCXNwaW5fbG9jaygmc2hyaW5rZXJfbG9jayk7Cj4gKwltdXRleF9sb2Nr
KCZzaHJpbmtlcl9sb2NrKTsKPiAgIAlsaXN0X2RlbCgmcHQtPnNocmlua2VyX2xpc3QpOwo+IC0J
c3Bpbl91bmxvY2soJnNocmlua2VyX2xvY2spOwo+ICsJbXV0ZXhfdW5sb2NrKCZzaHJpbmtlcl9s
b2NrKTsKPiAgIAo+ICAgCWxpc3RfZm9yX2VhY2hfZW50cnlfc2FmZShwLCB0bXAsICZwdC0+cGFn
ZXMsIGxydSkKPiAgIAkJdHRtX3Bvb2xfZnJlZV9wYWdlKHB0LT5wb29sLCBwdC0+Y2FjaGluZywg
cHQtPm9yZGVyLCBwKTsKPiBAQCAtMzAyLDcgKzMwMiw3IEBAIHN0YXRpYyB1bnNpZ25lZCBpbnQg
dHRtX3Bvb2xfc2hyaW5rKHZvaWQpCj4gICAJdW5zaWduZWQgaW50IG51bV9mcmVlZDsKPiAgIAlz
dHJ1Y3QgcGFnZSAqcDsKPiAgIAo+IC0Jc3Bpbl9sb2NrKCZzaHJpbmtlcl9sb2NrKTsKPiArCW11
dGV4X2xvY2soJnNocmlua2VyX2xvY2spOwo+ICAgCXB0ID0gbGlzdF9maXJzdF9lbnRyeSgmc2hy
aW5rZXJfbGlzdCwgdHlwZW9mKCpwdCksIHNocmlua2VyX2xpc3QpOwo+ICAgCj4gICAJcCA9IHR0
bV9wb29sX3R5cGVfdGFrZShwdCk7Cj4gQEAgLTMxNCw3ICszMTQsNyBAQCBzdGF0aWMgdW5zaWdu
ZWQgaW50IHR0bV9wb29sX3Nocmluayh2b2lkKQo+ICAgCX0KPiAgIAo+ICAgCWxpc3RfbW92ZV90
YWlsKCZwdC0+c2hyaW5rZXJfbGlzdCwgJnNocmlua2VyX2xpc3QpOwo+IC0Jc3Bpbl91bmxvY2so
JnNocmlua2VyX2xvY2spOwo+ICsJbXV0ZXhfdW5sb2NrKCZzaHJpbmtlcl9sb2NrKTsKPiAgIAo+
ICAgCXJldHVybiBudW1fZnJlZWQ7Cj4gICB9Cj4gQEAgLTU2NCw3ICs1NjQsNyBAQCBpbnQgdHRt
X3Bvb2xfZGVidWdmcyhzdHJ1Y3QgdHRtX3Bvb2wgKnBvb2wsIHN0cnVjdCBzZXFfZmlsZSAqbSkK
PiAgIHsKPiAgIAl1bnNpZ25lZCBpbnQgaTsKPiAgIAo+IC0Jc3Bpbl9sb2NrKCZzaHJpbmtlcl9s
b2NrKTsKPiArCW11dGV4X2xvY2soJnNocmlua2VyX2xvY2spOwo+ICAgCj4gICAJc2VxX3B1dHMo
bSwgIlx0ICIpOwo+ICAgCWZvciAoaSA9IDA7IGkgPCBNQVhfT1JERVI7ICsraSkKPiBAQCAtNjAw
LDcgKzYwMCw3IEBAIGludCB0dG1fcG9vbF9kZWJ1Z2ZzKHN0cnVjdCB0dG1fcG9vbCAqcG9vbCwg
c3RydWN0IHNlcV9maWxlICptKQo+ICAgCXNlcV9wcmludGYobSwgIlxudG90YWxcdDogJThsdSBv
ZiAlOGx1XG4iLAo+ICAgCQkgICBhdG9taWNfbG9uZ19yZWFkKCZhbGxvY2F0ZWRfcGFnZXMpLCBw
YWdlX3Bvb2xfc2l6ZSk7Cj4gICAKPiAtCXNwaW5fdW5sb2NrKCZzaHJpbmtlcl9sb2NrKTsKPiAr
CW11dGV4X3VubG9jaygmc2hyaW5rZXJfbG9jayk7Cj4gICAKPiAgIAlyZXR1cm4gMDsKPiAgIH0K
PiBAQCAtNjQ0LDcgKzY0NCw3IEBAIGludCB0dG1fcG9vbF9tZ3JfaW5pdCh1bnNpZ25lZCBsb25n
IG51bV9wYWdlcykKPiAgIAlpZiAoIXBhZ2VfcG9vbF9zaXplKQo+ICAgCQlwYWdlX3Bvb2xfc2l6
ZSA9IG51bV9wYWdlczsKPiAgIAo+IC0Jc3Bpbl9sb2NrX2luaXQoJnNocmlua2VyX2xvY2spOwo+
ICsJbXV0ZXhfaW5pdCgmc2hyaW5rZXJfbG9jayk7Cj4gICAJSU5JVF9MSVNUX0hFQUQoJnNocmlu
a2VyX2xpc3QpOwo+ICAgCj4gICAJZm9yIChpID0gMDsgaSA8IE1BWF9PUkRFUjsgKytpKSB7Cgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwg
bWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
