Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AD2E134D906
	for <lists+dri-devel@lfdr.de>; Mon, 29 Mar 2021 22:27:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8BA746E4F4;
	Mon, 29 Mar 2021 20:27:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [IPv6:2a00:1450:4864:20::12a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D1066E4F4
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Mar 2021 20:27:42 +0000 (UTC)
Received: by mail-lf1-x12a.google.com with SMTP id i26so20314018lfl.1
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Mar 2021 13:27:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=zBZP4X/Nh1fRrbRgQOPXvMs7zjDHJfPUlKL9Gu1Yu70=;
 b=V463bQkajIeMwgx+X0vqAKPGxk5FI5FU9aXSjWrSowaRMZLdFwFQa3URG2QCFruS1u
 Wt/gaNgzD7hY2Txe0DmRm0fDRA4EWyOm7C3QVhPpYZyCIcrNDgIVEj1KFnNSDWeXfNrQ
 Zu/KUOkFg9cR99VyGvsmnR8w98Q+bw0sTZmYxrO1FXeaU9sjQgkF869PKhGrf0DtUxNM
 MYgi59pp/5R+qm4cIqMCnbNj7LSsaopxkInLYEbf0VXLIDxObDuKnR8nPRqsYvktAQxw
 s6BMYYg2tMWkjXhir3Ri+gW0bAX2IrpBY0J9p5Gw/ioxOffre8R1WcQKCkg1Tp2Nd/fS
 rs3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=zBZP4X/Nh1fRrbRgQOPXvMs7zjDHJfPUlKL9Gu1Yu70=;
 b=Y9hPwNvOg5dZHfd3BydHkzPJlVwgNrfyfguAFTOYCKZUTuRxPEkmrdh3vUEr8a7pyS
 2Ey63YtLkcjYs0x9avIz8KZlygcWYLg0NE6/F2HKOkkj2UAKC6A1lRQNoxbleixgU4wD
 d5UgyrfTeRTU/h0ciYXayXjmCWayFzIzCL/mihNNzshTTj7rXYMiu6GIR1ba3WZks8ow
 B9ex7AYstTqRP89v77NYRJ6x0rVYn4TZEehWcW40q5HBg57MTgzvG55ti2vT4lMdVHcS
 /SxeaqJirTSLplUJKLuFB215/mEMI4bhLSv8+XWDsCnmW+1UXY6yjp1+JGIFxWsw3wXH
 rXeQ==
X-Gm-Message-State: AOAM533jT6/fZqjFrI/Qvr0tenf105H5seA357pTMcrP/LbodWyPqn4R
 2yOo8MjuHvOH/Kp20GnK5ZJGURm39pM=
X-Google-Smtp-Source: ABdhPJxugk52D7Ku1S1eEsrzkBBLCOQPvEbR3a09YIfBvPQpM+mzIAf//a++4IOx/Yjr+bPO3Zy9DA==
X-Received: by 2002:a05:6512:3e02:: with SMTP id
 i2mr17579971lfv.121.1617049660882; 
 Mon, 29 Mar 2021 13:27:40 -0700 (PDT)
Received: from ?IPv6:2a00:1370:814d:b259:a10:76ff:fe69:21b6?
 ([2a00:1370:814d:b259:a10:76ff:fe69:21b6])
 by smtp.googlemail.com with ESMTPSA id i3sm2555339ljj.82.2021.03.29.13.27.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 29 Mar 2021 13:27:40 -0700 (PDT)
Subject: Re: [PATCH v6 04/10] gpu: host1x: Remove cancelled waiters immediately
To: Mikko Perttunen <mperttunen@nvidia.com>, thierry.reding@gmail.com,
 jonathanh@nvidia.com
References: <20210329133836.2115236-1-mperttunen@nvidia.com>
 <20210329133836.2115236-5-mperttunen@nvidia.com>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <85ddc9a2-1355-1e3b-f164-f907c7fdb67c@gmail.com>
Date: Mon, 29 Mar 2021 23:27:39 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210329133836.2115236-5-mperttunen@nvidia.com>
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
Cc: linux-tegra@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

MjkuMDMuMjAyMSAxNjozOCwgTWlra28gUGVydHR1bmVuINC/0LjRiNC10YI6Cj4gQmVmb3JlIHRo
aXMgcGF0Y2gsIGNhbmNlbGxlZCB3YWl0ZXJzIHdvdWxkIG9ubHkgYmUgY2xlYW5lZCB1cAo+IG9u
Y2UgdGhlaXIgdGhyZXNob2xkIHZhbHVlIHdhcyByZWFjaGVkLiBNYWtlIGhvc3QxeF9pbnRyX3B1
dF9yZWYKPiBwcm9jZXNzIHRoZSBjYW5jZWxsYXRpb24gaW1tZWRpYXRlbHkgdG8gZml4IHRoaXMu
Cj4gCj4gU2lnbmVkLW9mZi1ieTogTWlra28gUGVydHR1bmVuIDxtcGVydHR1bmVuQG52aWRpYS5j
b20+Cj4gLS0tCj4gdjY6Cj4gKiBDYWxsIHNjaGVkdWxlIGluc3RlYWQgb2YgY3B1X3JlbGF4IHdo
aWxlIHdhaXRpbmcgZm9yIHBlbmRpbmcKPiAgIGludGVycnVwdCBwcm9jZXNzaW5nCj4gdjU6Cj4g
KiBBZGQgcGFyYW1ldGVyIHRvIGZsdXNoLCBpLmUuIHdhaXQgZm9yIGFsbCBwZW5kaW5nIHdhaXRl
cnMgdG8KPiAgIGNvbXBsZXRlIGJlZm9yZSByZXR1cm5pbmcuIFRoZSByZWFzb24gdGhpcyBpcyBu
b3QgYWx3YXlzIHRydWUKPiAgIGlzIHRoYXQgdGhlIHBlbmRpbmcgd2FpdGVyIG1pZ2h0IGJlIHRo
ZSBwbGFjZSB0aGF0IGlzIGNhbGxpbmcKPiAgIHRoZSBwdXRfcmVmLgo+IC0tLQo+ICBkcml2ZXJz
L2dwdS9ob3N0MXgvaW50ci5jICAgfCAyMyArKysrKysrKysrKysrKysrKy0tLS0tLQo+ICBkcml2
ZXJzL2dwdS9ob3N0MXgvaW50ci5oICAgfCAgNCArKystCj4gIGRyaXZlcnMvZ3B1L2hvc3QxeC9z
eW5jcHQuYyB8ICAyICstCj4gIDMgZmlsZXMgY2hhbmdlZCwgMjEgaW5zZXJ0aW9ucygrKSwgOCBk
ZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvaG9zdDF4L2ludHIuYyBi
L2RyaXZlcnMvZ3B1L2hvc3QxeC9pbnRyLmMKPiBpbmRleCA5MjQ1YWRkMjNiNWQuLjY5YjBlOGU0
MTQ2NiAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9ob3N0MXgvaW50ci5jCj4gKysrIGIvZHJp
dmVycy9ncHUvaG9zdDF4L2ludHIuYwo+IEBAIC0yNDIsMTggKzI0MiwyOSBAQCBpbnQgaG9zdDF4
X2ludHJfYWRkX2FjdGlvbihzdHJ1Y3QgaG9zdDF4ICpob3N0LCBzdHJ1Y3QgaG9zdDF4X3N5bmNw
dCAqc3luY3B0LAo+ICAJcmV0dXJuIDA7Cj4gIH0KPiAgCj4gLXZvaWQgaG9zdDF4X2ludHJfcHV0
X3JlZihzdHJ1Y3QgaG9zdDF4ICpob3N0LCB1bnNpZ25lZCBpbnQgaWQsIHZvaWQgKnJlZikKPiAr
dm9pZCBob3N0MXhfaW50cl9wdXRfcmVmKHN0cnVjdCBob3N0MXggKmhvc3QsIHVuc2lnbmVkIGlu
dCBpZCwgdm9pZCAqcmVmLAo+ICsJCQkgYm9vbCBmbHVzaCkKPiAgewo+ICAJc3RydWN0IGhvc3Qx
eF93YWl0bGlzdCAqd2FpdGVyID0gcmVmOwo+ICAJc3RydWN0IGhvc3QxeF9zeW5jcHQgKnN5bmNw
dDsKPiAgCj4gLQl3aGlsZSAoYXRvbWljX2NtcHhjaGcoJndhaXRlci0+c3RhdGUsIFdMU19QRU5E
SU5HLCBXTFNfQ0FOQ0VMTEVEKSA9PQo+IC0JICAgICAgIFdMU19SRU1PVkVEKQo+IC0JCXNjaGVk
dWxlKCk7Cj4gKwlhdG9taWNfY21weGNoZygmd2FpdGVyLT5zdGF0ZSwgV0xTX1BFTkRJTkcsIFdM
U19DQU5DRUxMRUQpOwo+ICAKPiAgCXN5bmNwdCA9IGhvc3QtPnN5bmNwdCArIGlkOwo+IC0JKHZv
aWQpcHJvY2Vzc193YWl0X2xpc3QoaG9zdCwgc3luY3B0LAo+IC0JCQkJaG9zdDF4X3N5bmNwdF9s
b2FkKGhvc3QtPnN5bmNwdCArIGlkKSk7Cj4gKwo+ICsJc3Bpbl9sb2NrKCZzeW5jcHQtPmludHIu
bG9jayk7Cj4gKwlpZiAoYXRvbWljX2NtcHhjaGcoJndhaXRlci0+c3RhdGUsIFdMU19DQU5DRUxM
RUQsIFdMU19IQU5ETEVEKSA9PQo+ICsJICAgIFdMU19DQU5DRUxMRUQpIHsKPiArCQlsaXN0X2Rl
bCgmd2FpdGVyLT5saXN0KTsKPiArCQlrcmVmX3B1dCgmd2FpdGVyLT5yZWZjb3VudCwgd2FpdGVy
X3JlbGVhc2UpOwo+ICsJfQo+ICsJc3Bpbl91bmxvY2soJnN5bmNwdC0+aW50ci5sb2NrKTsKCkxv
b2tzIGxpa2Ugd2UgbmVlZCB0byB1c2UgSVJRLXNhZmUgdmVyc2lvbiBvZiB0aGUgbG9ja2luZyBo
ZXJlIGluIG9yZGVyCm5vdCB0byByYWNlIHdpdGggdGhlIGludGVycnVwdCBoYW5kbGVyKD8pLCBw
cmV2ZW50aW5nIGxvY2t1cC4KCkJ1dCB3aGF0IHJlYWwgYnVnIGlzIGZpeGVkIGJ5IHRoaXMgcGF0
Y2g/IElmIG5vIHJlYWwgcHJvYmxlbSBpcyBmaXhlZCwKdGhlbiBtYXliZSB3aWxsIGJlIGJldHRl
ciB0byBkZWZlciB0b3VjaGluZyB0aGlzIGNvZGUgdGlsbCB3ZSB3aWxsIGp1c3QKcmVwbGFjZSBp
dCBhbGwgd2l0aCBhIHByb3BlciBkbWEtZmVuY2UgaGFuZGxlcnM/Cl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJp
LWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
