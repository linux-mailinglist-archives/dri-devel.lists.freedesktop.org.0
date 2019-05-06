Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D640615E0E
	for <lists+dri-devel@lfdr.de>; Tue,  7 May 2019 09:20:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3009489DB5;
	Tue,  7 May 2019 07:20:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd42.google.com (mail-io1-xd42.google.com
 [IPv6:2607:f8b0:4864:20::d42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 825CA8987A
 for <dri-devel@lists.freedesktop.org>; Mon,  6 May 2019 11:16:04 +0000 (UTC)
Received: by mail-io1-xd42.google.com with SMTP id v7so4355838iob.10
 for <dri-devel@lists.freedesktop.org>; Mon, 06 May 2019 04:16:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:newsgroups:references
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=Ll4tLtKAz5QfqQNpJ8SOOQ8DBmPbzjjbapAWPj5NxaA=;
 b=mT0oOx1ri9ghEfYTO40av/ZC3XhAuHDvgEociU3KZWS/QtmUWnZmrTGpYQq38wYUzc
 d12UbxJFDBxsaEelCnEnfgEMZkftaFBfO3oLMNf/sH52ManaxhFSXJxIwX7DqvUxiAFM
 9/BejoQmw0w4MpBxHeJCyzhDmHgmOQgY/u6LRT4cc8HlRNsvwI7XuqsBVeJviviaJ/i4
 bUIedXN7V5egNqxNPcsILV34xJIbNiVMKaKtvP+nhDrvOQWEX8xo1jlV+8IrmrYngEyw
 hOMlhKfKS7HjdYHRk5DZgvNkV2g74S8WJknhLFxw2rgzsoDjb+yey88FrfHbENjLRUg5
 ym8w==
X-Gm-Message-State: APjAAAUrNUki1twB6BbYzsRnkWaEz8N6avp7jKo+a6N/PYzMqcXSnyZY
 Mf5pqWW6iuqAvBMcLuSlGVXYFwbU
X-Google-Smtp-Source: APXvYqzaAZaaReBRZqOTq7QjKFbI3hBW0J8EDh/qu8rPIMmtrAExjTwBy18jZSWfdty949f+TWigcA==
X-Received: by 2002:a5e:d503:: with SMTP id e3mr17129537iom.46.1557141363901; 
 Mon, 06 May 2019 04:16:03 -0700 (PDT)
Received: from [192.168.2.145] (ppp94-29-35-107.pppoe.spdop.ru. [94.29.35.107])
 by smtp.googlemail.com with ESMTPSA id 12sm8361952itm.2.2019.05.06.04.16.02
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 06 May 2019 04:16:03 -0700 (PDT)
Subject: Re: [PATCH v1 3/3] drm/tegra: Support PM QoS memory bandwidth
 management
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>
Newsgroups: gmane.linux.kernel, gmane.comp.video.dri.devel,
 gmane.linux.ports.tegra
References: <20190505173707.29282-1-digetx@gmail.com>
 <20190505173707.29282-4-digetx@gmail.com>
Message-ID: <e1dc16d2-db9e-6869-81dc-8ffe5d5fd6fe@gmail.com>
Date: Mon, 6 May 2019 14:15:59 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190505173707.29282-4-digetx@gmail.com>
Content-Language: en-US
X-Mailman-Approved-At: Tue, 07 May 2019 07:20:13 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=subject:from:to:cc:newsgroups:references:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Ll4tLtKAz5QfqQNpJ8SOOQ8DBmPbzjjbapAWPj5NxaA=;
 b=O4ELULrFzjuXLVhmIJ0iWCRsqi2vpscptwlzxT8ncscRH0fiSg4ocaplwaW1Vq4DS8
 8kknL+jkrRMKRGTlD20UwPPQ5wztsRxHlwnHaSfWjIR8Cz1tEneerB6MPBIm1mSY0f/W
 bDswQ3/9zD164+sFqKRjjLNnLN2ThRE9FZCBJ3aIWN7hldnjnZPR4wFdsthmnJDzbU+q
 VMDf3ulbbylpVBo4K92BKLw6cUEzFrDLDXop3FhLQw/gaxwMT+oSlR2zeHlixCM2ocDf
 HjgkAVh+moZ67ZDzd43pQn0uFNSkzJnm2oMW1Hm76w1L5MrkS2AATYLINtXX/ggJfak+
 6fsA==
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
Cc: linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

MDUuMDUuMjAxOSAyMDozNywgRG1pdHJ5IE9zaXBlbmtvINC/0LjRiNC10YI6Cj4gRGlzcGxheSBj
b250cm9sbGVyIChEQykgcGVyZm9ybXMgaXNvY2hyb25vdXMgbWVtb3J5IHRyYW5zZmVycyBhbmQg
dGh1cwo+IGhhcyBhIHJlcXVpcmVtZW50IGZvciBhIG1pbmltdW0gbWVtb3J5IGJhbmR3aWR0aCB0
aGF0IHNoYWxsIGJlIGZ1bGZpbGxlZCwKPiBvdGhlcndpc2UgZnJhbWVidWZmZXIgZGF0YSBjYW4n
dCBiZSBmZXRjaGVkIGZhc3QgZW5vdWdoIGFuZCB0aGlzIHJlc3VsdHMKPiBpbiBhIERDJ3MgZGF0
YS1GSUZPIHVuZGVyZmxvdyB0aGF0IGZvbGxvd3MgYnkgYSB2aXN1YWwgY29ycnVwdGlvbi4KPiAK
PiBUaGUgRXh0ZXJuYWwgTWVtb3J5IENvbnRyb2xsZXIgZHJpdmVycyB3aWxsIHByb3ZpZGUgbWVt
b3J5IGJhbmR3aWR0aAo+IG1hbmFnZW1lbnQgZmFjaWxpdHkgdmlhIHRoZSBnZW5lcmljIFBvd2Vy
IE1hbmFnZW1lbnQgUW9TIEFQSSBzb29uaXNoLgo+IFRoaXMgcGF0Y2ggd2lyZXMgdXAgdGhlIFBN
IFFvUyBBUEkgc3VwcG9ydCBmb3IgdGhlIGRpc3BsYXkgZHJpdmVyCj4gYmVmb3JlaGFuZC4KPiAK
PiBEaXNwbGF5IHdvbid0IGhhdmUgdmlzdWFsIGNvcnJ1cHRpb24gb24gY29taW5nIHVwIGZyb20g
c3VzcGVuZCBzdGF0ZSB3aGVuCj4gZGV2ZnJlcSBkcml2ZXIgaXMgYWN0aXZlIG9uY2UgYWxsIHBy
ZXJlcXVpc2l0ZSBiaXRzIHdpbGwgZ2V0IHVwc3RyZWFtZWQuCj4gVGhlIGRldmZyZXEgcmVhY3Rp
b24gaGFzIGEgcXVpdGUgc2lnbmlmaWNhbnQgbGF0ZW5jeSBhbmQgaXQgYWxzbyBkb2Vzbid0Cj4g
dGFrZSBpbnRvIGFjY291bnQgdGhlIElTTyB0cmFuc2ZlcnMgd2hpY2ggbWF5IHJlc3VsdCBpbiBh
c3N1bXB0aW9uIGFib3V0Cj4gbG93ZXIgbWVtb3J5IGJhbmR3aWR0aCByZXF1aXJlbWVudCB0aGFu
IGFjdHVhbGx5IG5lZWRlZC4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBEbWl0cnkgT3NpcGVua28gPGRp
Z2V0eEBnbWFpbC5jb20+Cj4gLS0tCj4gIGRyaXZlcnMvZ3B1L2RybS90ZWdyYS9kYy5jICAgIHwg
MjE2ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKy0KPiAgZHJpdmVycy9ncHUvZHJt
L3RlZ3JhL2RjLmggICAgfCAgIDggKysKPiAgZHJpdmVycy9ncHUvZHJtL3RlZ3JhL2RybS5jICAg
fCAgMTggKysrCj4gIGRyaXZlcnMvZ3B1L2RybS90ZWdyYS9wbGFuZS5jIHwgICAxICsKPiAgZHJp
dmVycy9ncHUvZHJtL3RlZ3JhL3BsYW5lLmggfCAgIDQgKy0KPiAgNSBmaWxlcyBjaGFuZ2VkLCAy
NDUgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVy
cy9ncHUvZHJtL3RlZ3JhL2RjLmMgYi9kcml2ZXJzL2dwdS9kcm0vdGVncmEvZGMuYwo+IGluZGV4
IDQxY2I2N2RiNmRiYy4uOGM1YjllNzFjYTZmIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2Ry
bS90ZWdyYS9kYy5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3RlZ3JhL2RjLmMKPiBAQCAtNTE0
LDYgKzUxNCwxMDcgQEAgc3RhdGljIHZvaWQgdGVncmFfZGNfc2V0dXBfd2luZG93KHN0cnVjdCB0
ZWdyYV9wbGFuZSAqcGxhbmUsCj4gIAkJdGVncmFfcGxhbmVfc2V0dXBfYmxlbmRpbmcocGxhbmUs
IHdpbmRvdyk7Cj4gIH0KPiAgCj4gK3N0YXRpYyB1bnNpZ25lZCBsb25nCj4gK3RlZ3JhX3BsYW5l
X21lbW9yeV9iYW5kd2lkdGgoc3RydWN0IGRybV9wbGFuZV9zdGF0ZSAqc3RhdGUsCj4gKwkJCSAg
ICAgc3RydWN0IHRlZ3JhX2RjX3dpbmRvdyAqd2luZG93KQo+ICt7Cj4gKwlzdHJ1Y3QgdGVncmFf
cGxhbmVfc3RhdGUgKnRlZ3JhX3N0YXRlOwo+ICsJc3RydWN0IGRybV9jcnRjX3N0YXRlICpjcnRj
X3N0YXRlOwo+ICsJc3RydWN0IHRlZ3JhX2RjX3dpbmRvdyB3aW47Cj4gKwl1bnNpZ25lZCBpbnQg
bXVsOwo+ICsJdW5zaWduZWQgaW50IGJwcDsKPiArCWJvb2wgcGxhbmFyOwo+ICsJYm9vbCB5dXY7
Cj4gKwo+ICsJaWYgKCFzdGF0ZS0+ZmIgfHwgIXN0YXRlLT52aXNpYmxlKQo+ICsJCXJldHVybiAw
Owo+ICsKPiArCWNydGNfc3RhdGUgPSBkcm1fYXRvbWljX2dldF9uZXdfY3J0Y19zdGF0ZShzdGF0
ZS0+c3RhdGUsIHN0YXRlLT5jcnRjKTsKPiArCXRlZ3JhX3N0YXRlID0gdG9fdGVncmFfcGxhbmVf
c3RhdGUoc3RhdGUpOwo+ICsKPiArCWlmICghd2luZG93KQo+ICsJCXdpbmRvdyA9ICZ3aW47Cj4g
Kwo+ICsJd2luZG93LT5zcmMudyA9IGRybV9yZWN0X3dpZHRoKCZzdGF0ZS0+c3JjKSA+PiAxNjsK
PiArCXdpbmRvdy0+c3JjLmggPSBkcm1fcmVjdF9oZWlnaHQoJnN0YXRlLT5zcmMpID4+IDE2Owo+
ICsJd2luZG93LT5kc3QudyA9IGRybV9yZWN0X3dpZHRoKCZzdGF0ZS0+ZHN0KTsKPiArCXdpbmRv
dy0+ZHN0LmggPSBkcm1fcmVjdF9oZWlnaHQoJnN0YXRlLT5kc3QpOwo+ICsJd2luZG93LT5mb3Jt
YXQgPSB0ZWdyYV9zdGF0ZS0+Zm9ybWF0Owo+ICsJd2luZG93LT50aWxpbmcgPSB0ZWdyYV9zdGF0
ZS0+dGlsaW5nOwo+ICsKPiArCXl1diA9IHRlZ3JhX3BsYW5lX2Zvcm1hdF9pc195dXYod2luZG93
LT5mb3JtYXQsICZwbGFuYXIpOwo+ICsJaWYgKCF5dXYgfHwgIXBsYW5hcikKPiArCQlicHAgPSBz
dGF0ZS0+ZmItPmZvcm1hdC0+Y3BwWzBdICogODsKPiArCWVsc2UKPiArCQlicHAgPSAxNjsKCkl0
IG9jY3VycmVkIHRvIG1lIHRoYXQgaXQgd2lsbCBiZSBtdWNoIGJldHRlciB0byB1c2UgdGhlIGRy
bV9mb3JtYXRfKgpoZWxwZXJzIGhlcmUgdG8gY2FsY3VsYXRlIHRoZSBiaXRzLXBlci1waXhlbCBi
ZWNhdXNlIHRoZSBhYm92ZSB2YXJpYW50Cmlzbid0IHJlYWxseSBnb29kIGZvciBhbGwgb2YgcG9z
c2libGUgZm9ybWF0cy4gSSdsbCBzd2l0Y2ggdG8gdGhlCmdlbmVyaWMgaGVscGVycyBpbiB2Mi4K
ClRoaWVycnksIGZvciBub3cgSSdsbCB3YWl0IGZvciBhd2hpbGUgZm9yIHlvdXJzIGNvbW1lbnRz
LiBQbGVhc2UgbGV0IG1lCmtub3cgaWYgeW91J2xsIHdhbnQgdG8gc2VlIGFueXRoaW5nIGVsc2Ug
Y2hhbmdlZCBpbiB2Mi4gSSB0aGluayB0aGVyZSBpcwphIGdvb2QgY2hhbmNlIHRoYXQgd2UgY291
bGQgZ2V0IGV2ZXJ5dGhpbmcgcmVhZHkgaW4gcmVnYXJkcyB0byBtZW1vcnkKYmFuZHdpZHRoIG1h
bmFnZW1lbnQgYmFzaWNzIGZvciB2NS4zLCBwbGVhc2UgaGVscCB3aXRoIHJldmlld2luZyBhbmQK
Z2V0dGluZyB0aGUgcGF0Y2hlcyB1cHN0cmVhbWVkLgoKLS0gCkRtaXRyeQpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0
CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
