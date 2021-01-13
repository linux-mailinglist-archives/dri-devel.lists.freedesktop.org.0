Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E9432F5D51
	for <lists+dri-devel@lfdr.de>; Thu, 14 Jan 2021 10:28:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 90A6D6E10E;
	Thu, 14 Jan 2021 09:28:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com
 [IPv6:2a00:1450:4864:20::22b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 439AE6E82B
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Jan 2021 16:29:57 +0000 (UTC)
Received: by mail-lj1-x22b.google.com with SMTP id u11so3196322ljo.13
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Jan 2021 08:29:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=2siudaJetlL4FSQZMNVVHzMkL7ELpV6uopIfOVvMWs8=;
 b=l8xop7pH+Setq82fKbZ4EFQTUoHmoBO+t6Pph1Vzjk1CYRrAOcfLtsKkFoL5ddaiW8
 SxVevzBvjl7o4Rha9onDBL5KVYidZ2YAWAk7Z6lQ4fF6s9ZE+x57O1ZW1S2nNhqLXA8v
 6HQAyjn/UVHjp2GqZAJZLnd+7TtaqiG4wQUpHcfc1dXL4cXmsyLUGxW3tw89IlSTAodI
 aFdfjT3Pz26d2/k9mCgIFIhZ/xAyuAKYDgT/wSf4WTkh9DHVGDITFgx2hewOMH2HIT3F
 3sLC41ibMjc4jlPswFQ3YAjSDGSZ0BIUVyBNBCIN/yz6uM7NKZlw1sWB+bi+WbDB4PAG
 fDFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=2siudaJetlL4FSQZMNVVHzMkL7ELpV6uopIfOVvMWs8=;
 b=XbtaYsYWrnNjsj4z1m+MPZF7411YIP5kVXDwpp4uua8zQveFowj4pkiZNQxtwOOA2F
 hwRCyummtESYmB/K+xLc352gptlKtizlQF4Od7Eq91RJ0X+EUCwwGE/u+0eqIQYDpROX
 etjYImnDxHffpbuChBIT/Thfpaxlyef9draQ259BnT9YCxK1nD/mGu9J+pWaENDcVtJp
 4gs0yswSIIErjIaaqU2dx9rJpXnDrXoxuR/9ACPSHwoVB7SBK0qEm7UcHjxx814LfjnY
 Mwn5dMpH7N1jJRbQ38nTzZz/mejq74LN8tfP/C9YJoHwR78G50ZmcOL/DurYjcAyhJ86
 2UKg==
X-Gm-Message-State: AOAM531Dz9IEnmGqrTwkEWiTZQmZhWlFMbALHBaywnSowG/EY7lRIMnP
 3Zw3b1CWybRu5w6a84yDB4s=
X-Google-Smtp-Source: ABdhPJxo5bxVwGtUe+l+R6oDxiDXlb5UzmCR9sb2VRDgxNSPyvKLX/oyuSi47L0DYwnaxTXsky5Ibw==
X-Received: by 2002:a2e:96c5:: with SMTP id d5mr1275164ljj.321.1610555395703; 
 Wed, 13 Jan 2021 08:29:55 -0800 (PST)
Received: from [192.168.2.145] (109-252-192-57.dynamic.spd-mgts.ru.
 [109.252.192.57])
 by smtp.googlemail.com with ESMTPSA id b141sm254508lfd.148.2021.01.13.08.29.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 13 Jan 2021 08:29:54 -0800 (PST)
Subject: Re: [PATCH v5 04/21] gpu: host1x: Remove cancelled waiters immediately
To: Mikko Perttunen <cyndis@kapsi.fi>, Mikko Perttunen
 <mperttunen@nvidia.com>, thierry.reding@gmail.com, jonathanh@nvidia.com,
 airlied@linux.ie, daniel@ffwll.ch
References: <20210111130019.3515669-1-mperttunen@nvidia.com>
 <20210111130019.3515669-5-mperttunen@nvidia.com>
 <1c2c4a31-68a2-c938-fe65-6059d9889126@gmail.com>
 <1f98ce42-dc6b-299c-f55e-f6dd87b99cab@kapsi.fi>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <b0a983a1-6379-1a27-5c8d-05fee58e696a@gmail.com>
Date: Wed, 13 Jan 2021 19:29:54 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.2
MIME-Version: 1.0
In-Reply-To: <1f98ce42-dc6b-299c-f55e-f6dd87b99cab@kapsi.fi>
Content-Language: en-US
X-Mailman-Approved-At: Thu, 14 Jan 2021 09:28:31 +0000
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
Cc: linux-tegra@vger.kernel.org, talho@nvidia.com, bhuntsman@nvidia.com,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

MTMuMDEuMjAyMSAwMToyMCwgTWlra28gUGVydHR1bmVuINC/0LjRiNC10YI6Cj4gT24gMS8xMy8y
MSAxMjowNyBBTSwgRG1pdHJ5IE9zaXBlbmtvIHdyb3RlOgo+PiAxMS4wMS4yMDIxIDE2OjAwLCBN
aWtrbyBQZXJ0dHVuZW4g0L/QuNGI0LXRgjoKPj4+IC12b2lkIGhvc3QxeF9pbnRyX3B1dF9yZWYo
c3RydWN0IGhvc3QxeCAqaG9zdCwgdW5zaWduZWQgaW50IGlkLCB2b2lkCj4+PiAqcmVmKQo+Pj4g
K3ZvaWQgaG9zdDF4X2ludHJfcHV0X3JlZihzdHJ1Y3QgaG9zdDF4ICpob3N0LCB1bnNpZ25lZCBp
bnQgaWQsIHZvaWQKPj4+ICpyZWYsCj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGJvb2wg
Zmx1c2gpCj4+PiDCoCB7Cj4+PiDCoMKgwqDCoMKgIHN0cnVjdCBob3N0MXhfd2FpdGxpc3QgKndh
aXRlciA9IHJlZjsKPj4+IMKgwqDCoMKgwqAgc3RydWN0IGhvc3QxeF9zeW5jcHQgKnN5bmNwdDsK
Pj4+IMKgIC3CoMKgwqAgd2hpbGUgKGF0b21pY19jbXB4Y2hnKCZ3YWl0ZXItPnN0YXRlLCBXTFNf
UEVORElORywKPj4+IFdMU19DQU5DRUxMRUQpID09Cj4+PiAtwqDCoMKgwqDCoMKgwqDCoMKgwqAg
V0xTX1JFTU9WRUQpCj4+PiAtwqDCoMKgwqDCoMKgwqAgc2NoZWR1bGUoKTsKPj4+ICvCoMKgwqAg
YXRvbWljX2NtcHhjaGcoJndhaXRlci0+c3RhdGUsIFdMU19QRU5ESU5HLCBXTFNfQ0FOQ0VMTEVE
KTsKPj4+IMKgIMKgwqDCoMKgwqAgc3luY3B0ID0gaG9zdC0+c3luY3B0ICsgaWQ7Cj4+PiAtwqDC
oMKgICh2b2lkKXByb2Nlc3Nfd2FpdF9saXN0KGhvc3QsIHN5bmNwdCwKPj4+IC3CoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqAgaG9zdDF4X3N5bmNwdF9sb2FkKGhvc3QtPnN5bmNwdCArIGlk
KSk7Cj4+PiArCj4+PiArwqDCoMKgIHNwaW5fbG9jaygmc3luY3B0LT5pbnRyLmxvY2spOwo+Pj4g
K8KgwqDCoCBpZiAoYXRvbWljX2NtcHhjaGcoJndhaXRlci0+c3RhdGUsIFdMU19DQU5DRUxMRUQs
IFdMU19IQU5ETEVEKSA9PQo+Pj4gK8KgwqDCoMKgwqDCoMKgIFdMU19DQU5DRUxMRUQpIHsKPj4+
ICvCoMKgwqDCoMKgwqDCoCBsaXN0X2RlbCgmd2FpdGVyLT5saXN0KTsKPj4+ICvCoMKgwqDCoMKg
wqDCoCBrcmVmX3B1dCgmd2FpdGVyLT5yZWZjb3VudCwgd2FpdGVyX3JlbGVhc2UpOwo+Pj4gK8Kg
wqDCoCB9Cj4+PiArwqDCoMKgIHNwaW5fdW5sb2NrKCZzeW5jcHQtPmludHIubG9jayk7Cj4+PiAr
Cj4+PiArwqDCoMKgIGlmIChmbHVzaCkgewo+Pj4gK8KgwqDCoMKgwqDCoMKgIC8qIFdhaXQgdW50
aWwgYW55IGNvbmN1cnJlbnRseSBleGVjdXRpbmcgaGFuZGxlciBoYXMKPj4+IGZpbmlzaGVkLiAq
Lwo+Pj4gK8KgwqDCoMKgwqDCoMKgIHdoaWxlIChhdG9taWNfcmVhZCgmd2FpdGVyLT5zdGF0ZSkg
IT0gV0xTX0hBTkRMRUQpCj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBjcHVfcmVsYXgoKTsK
Pj4+ICvCoMKgwqAgfQo+Pgo+PiBBIGJ1c3ktbG9vcCBzaG91bGRuJ3QgYmUgdXNlZCBpbiBrZXJu
ZWwgdW5sZXNzIHRoZXJlIGlzIGEgdmVyeSBnb29kCj4+IHJlYXNvbi4gVGhlIHdhaXRfZXZlbnQo
KSBzaG91bGQgYmUgdXNlZCBpbnN0ZWFkLgo+Pgo+PiBCdXQgcGxlYXNlIGRvbid0IGh1cnJ5IHRv
IHVwZGF0ZSB0aGlzIHBhdGNoLCB3ZSBtYXkgbmVlZCBvciB3YW50IHRvCj4+IHJldGlyZSB0aGUg
aG9zdDF4LXdhaXRlciBhbmQgdGhlbiB0aGVzZSBhbGwgd2FpdGVyLXJlbGF0ZWQgcGF0Y2hlcyB3
b24ndAo+PiBiZSBuZWVkZWQuCj4+Cj4gCj4gWWVzLCB3ZSBzaG91bGQgaW1wcm92ZSB0aGUgaW50
ciBjb2RlIHRvIHJlbW92ZSBhbGwgdGhpcyBjb21wbGV4aXR5LiBCdXQKPiBsZXQncyBtZXJnZSB0
aGlzIGZpcnN0IHRvIGdldCBhIGZ1bmN0aW9uYWwgYmFzZWxpbmUgYW5kIGRvIGxhcmdlciBkZXNp
Z24KPiBjaGFuZ2VzIGluIGZvbGxvdy11cCBwYXRjaGVzLgo+IAo+IEl0IGlzIGN1bWJlcnNvbWUg
Zm9yIG1lIHRvIGRldmVsb3AgZnVydGhlciBzZXJpZXMgKG9mIHdoaWNoIEkgaGF2ZQo+IHNldmVy
YWwgdW5kZXIgd29yayBhbmQgcGxhbm5pbmcpIHdpdGggdGhpcyBiYXNlbGluZSBzZXJpZXMgbm90
IGJlaW5nCj4gbWVyZ2VkLiBUaGUgdW5jZXJ0YWludHkgb24gdGhlIGFwcHJvdmFsIG9mIHRoZSBV
QVBJIGRlc2lnbiBhbHNvIG1ha2VzIGl0Cj4gaGFyZCB0byBrbm93IHdoZXRoZXIgaXQgbWFrZXMg
c2Vuc2UgZm9yIG1lIHRvIHdvcmsgb24gdG9wIG9mIHRoaXMgY29kZQo+IG9yIG5vdCwgc28gSSdk
IGxpa2UgdG8gZm9jdXMgb24gd2hhdCdzIG5lZWRlZCB0byBnZXQgdGhpcyBtZXJnZWQgaW5zdGVh
ZAo+IG9mIGZ1cnRoZXIgcmVkZXNpZ24gb2YgdGhlIGRyaXZlciBhdCB0aGlzIHRpbWUuCgpJcyB0
aGlzIHBhdGNoIChhbmQgc29tZSBvdGhlcnMpIG5lY2Vzc2FyeSBmb3IgdGhlIG5ldyBVQVBJPyBJ
ZiBub3QsCmNvdWxkIHdlIHBsZWFzZSBuYXJyb3cgZG93biB0aGUgcGF0Y2hlcyB0byB0aGUgbWlu
aW11bSB0aGF0IGlzIG5lZWRlZApmb3IgdHJ5aW5nIG91dCB0aGUgbmV3IFVBUEk/Cl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5n
IGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVk
ZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
