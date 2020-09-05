Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AA26425F3D1
	for <lists+dri-devel@lfdr.de>; Mon,  7 Sep 2020 09:22:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A77A46E129;
	Mon,  7 Sep 2020 07:22:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com
 [IPv6:2a00:1450:4864:20::241])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 77FF56E0F9
 for <dri-devel@lists.freedesktop.org>; Sat,  5 Sep 2020 14:30:06 +0000 (UTC)
Received: by mail-lj1-x241.google.com with SMTP id c2so11133634ljj.12
 for <dri-devel@lists.freedesktop.org>; Sat, 05 Sep 2020 07:30:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=xCjl3FtgQod729R+3QUkX9rN7e6gzfBjhz6n2Z97NJI=;
 b=DkAT/MrvPS6qWE9NHQ1l883kNCkCg+LaVCr+fC3o9Ns8GrnuxlJhb48ygIJXHXql0c
 UDPTx1U7/faSnOUJsmtse2c+c3Qv/MN5J94b1KOKYyG+Iy0/6Lu7N9C7lHjmWFxFc8yk
 /9JoccKOlG/OsWiZy7JeFCMUOa93SagMkmFcBUBSk+Akpxwm4bagehXXiTIkggqZVw6N
 dTGIjf6Jc3boMJaOBiTSpYJZNUVjbDTqbyyDC4ssTf6Ly/A5xCZbqs7ZCJcyzZm44NMB
 g4ss0ybVP5ihAeBkIxU238+Wc/stxEzWzockC6ebpO3S5NIs/W6b82uoYbobDM3c83r+
 B8Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=xCjl3FtgQod729R+3QUkX9rN7e6gzfBjhz6n2Z97NJI=;
 b=DbtRousGkREvjogbTXIn6MCwE3nPeU7r0T8bovXBkbrbE5e6KRA2kHJ9f7xmRPOGPX
 /i1OCVW4kaDHwa0bkLRaadJpRjVC/hApyiHNU1+NbWmmoOP2oPYibLkEgn4eLDyWVxD/
 Jk832Abofl/4dHa/TDJULFfMfsB4JfMlWWERbuxEtT3iOYLzRm3g1+LympAOQWFaZaax
 8mNkVETll94dXtdVFqEYS0VYu1nOiiHZGajcafVmtkyO0vv/9A4s+ZmwNQWtUOHaHHCG
 mkYtWoSsavoYd3M6P1a0WaoUQN9HLBZerY505QHIH4M0C5ZOsy4Jq6LNwQaa1nkFXawd
 0Yvw==
X-Gm-Message-State: AOAM533olXFoF72ON6XsxgRfXyewybhLKySCPNaXnMhq7yse2nacKWjc
 OHMqOM7QeDDft/xl78px5fo=
X-Google-Smtp-Source: ABdhPJz0PyoBnYDo6UOXMIMwbzMqcSEDGt3fj0ZX8OuCyPW1uEjLhCBwwWqDwyvwaCNAglyOv4Qp+Q==
X-Received: by 2002:a05:651c:106a:: with SMTP id
 y10mr6271673ljm.296.1599316204840; 
 Sat, 05 Sep 2020 07:30:04 -0700 (PDT)
Received: from [192.168.2.145] (109-252-170-211.dynamic.spd-mgts.ru.
 [109.252.170.211])
 by smtp.googlemail.com with ESMTPSA id s3sm2200207lfd.39.2020.09.05.07.30.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 05 Sep 2020 07:30:04 -0700 (PDT)
Subject: Re: [RFC PATCH v2 06/17] gpu: host1x: Cleanup and refcounting for
 syncpoints
To: Mikko Perttunen <mperttunen@nvidia.com>, thierry.reding@gmail.com,
 jonathanh@nvidia.com, airlied@linux.ie, daniel@ffwll.ch
References: <20200905103420.3021852-1-mperttunen@nvidia.com>
 <20200905103420.3021852-7-mperttunen@nvidia.com>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <913a625c-9630-92af-aba0-fdddf6bbdb29@gmail.com>
Date: Sat, 5 Sep 2020 17:30:03 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200905103420.3021852-7-mperttunen@nvidia.com>
Content-Language: en-US
X-Mailman-Approved-At: Mon, 07 Sep 2020 07:22:17 +0000
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

MDUuMDkuMjAyMCAxMzozNCwgTWlra28gUGVydHR1bmVuINC/0LjRiNC10YI6Ci4uLgo+ICsKPiAr
LyoqCj4gKyAqIGhvc3QxeF9zeW5jcHRfcHV0KCkgLSBmcmVlIGEgcmVxdWVzdGVkIHN5bmNwb2lu
dAo+ICsgKiBAc3A6IGhvc3QxeCBzeW5jcG9pbnQKPiArICoKPiArICogUmVsZWFzZSBhIHN5bmNw
b2ludCBwcmV2aW91c2x5IGFsbG9jYXRlZCB1c2luZyBob3N0MXhfc3luY3B0X3JlcXVlc3QoKS4g
QQo+ICsgKiBob3N0MXggY2xpZW50IGRyaXZlciBzaG91bGQgY2FsbCB0aGlzIHdoZW4gdGhlIHN5
bmNwb2ludCBpcyBubyBsb25nZXIgaW4KPiArICogdXNlLgo+ICsgKi8KPiArdm9pZCBob3N0MXhf
c3luY3B0X3B1dChzdHJ1Y3QgaG9zdDF4X3N5bmNwdCAqc3ApCj4gK3sKPiArCWlmICghc3ApCj4g
KwkJcmV0dXJuOwo+ICsKPiArCWtyZWZfcHV0KCZzcC0+cmVmLCBzeW5jcHRfcmVsZWFzZSk7Cj4g
K30KPiArRVhQT1JUX1NZTUJPTChob3N0MXhfc3luY3B0X3B1dCk7Cj4gIAo+ICB2b2lkIGhvc3Qx
eF9zeW5jcHRfZGVpbml0KHN0cnVjdCBob3N0MXggKmhvc3QpCj4gIHsKPiBAQCAtNDcxLDE2ICs0
NzgsNDggQEAgdW5zaWduZWQgaW50IGhvc3QxeF9zeW5jcHRfbmJfbWxvY2tzKHN0cnVjdCBob3N0
MXggKmhvc3QpCj4gIH0KPiAgCj4gIC8qKgo+IC0gKiBob3N0MXhfc3luY3B0X2dldCgpIC0gb2J0
YWluIGEgc3luY3BvaW50IGJ5IElECj4gKyAqIGhvc3QxeF9zeW5jcHRfZ2V0X2J5X2lkKCkgLSBv
YnRhaW4gYSBzeW5jcG9pbnQgYnkgSUQKPiArICogQGhvc3Q6IGhvc3QxeCBjb250cm9sbGVyCj4g
KyAqIEBpZDogc3luY3BvaW50IElECj4gKyAqLwo+ICtzdHJ1Y3QgaG9zdDF4X3N5bmNwdCAqaG9z
dDF4X3N5bmNwdF9nZXRfYnlfaWQoc3RydWN0IGhvc3QxeCAqaG9zdCwKPiArCQkJCQkgICAgICB1
bnNpZ25lZCBpbnQgaWQpCj4gK3sKPiArCWlmIChpZCA+PSBob3N0LT5pbmZvLT5uYl9wdHMpCj4g
KwkJcmV0dXJuIE5VTEw7Cj4gKwo+ICsJaWYgKGtyZWZfZ2V0X3VubGVzc196ZXJvKCZob3N0LT5z
eW5jcHRbaWRdLnJlZikpCj4gKwkJcmV0dXJuICZob3N0LT5zeW5jcHRbaWRdOwo+ICsJZWxzZQo+
ICsJCXJldHVybiBOVUxMOwo+ICt9Cj4gK0VYUE9SVF9TWU1CT0woaG9zdDF4X3N5bmNwdF9nZXRf
YnlfaWQpOwo+ICsKPiArLyoqCj4gKyAqIGhvc3QxeF9zeW5jcHRfZ2V0X2J5X2lkX25vcmVmKCkg
LSBvYnRhaW4gYSBzeW5jcG9pbnQgYnkgSUQgYnV0IGRvbid0Cj4gKyAqIAlpbmNyZWFzZSB0aGUg
cmVmY291bnQuCj4gICAqIEBob3N0OiBob3N0MXggY29udHJvbGxlcgo+ICAgKiBAaWQ6IHN5bmNw
b2ludCBJRAo+ICAgKi8KPiAtc3RydWN0IGhvc3QxeF9zeW5jcHQgKmhvc3QxeF9zeW5jcHRfZ2V0
KHN0cnVjdCBob3N0MXggKmhvc3QsIHVuc2lnbmVkIGludCBpZCkKPiArc3RydWN0IGhvc3QxeF9z
eW5jcHQgKmhvc3QxeF9zeW5jcHRfZ2V0X2J5X2lkX25vcmVmKHN0cnVjdCBob3N0MXggKmhvc3Qs
Cj4gKwkJCQkJCSAgICB1bnNpZ25lZCBpbnQgaWQpCj4gIHsKPiAgCWlmIChpZCA+PSBob3N0LT5p
bmZvLT5uYl9wdHMpCj4gIAkJcmV0dXJuIE5VTEw7Cj4gIAo+IC0JcmV0dXJuIGhvc3QtPnN5bmNw
dCArIGlkOwo+ICsJcmV0dXJuICZob3N0LT5zeW5jcHRbaWRdOwo+ICt9Cj4gK0VYUE9SVF9TWU1C
T0woaG9zdDF4X3N5bmNwdF9nZXRfYnlfaWRfbm9yZWYpOwo+ICsKPiArLyoqCj4gKyAqIGhvc3Qx
eF9zeW5jcHRfZ2V0KCkgLSBpbmNyZW1lbnQgc3luY3BvaW50IHJlZmNvdW50Cj4gKyAqIEBzcDog
c3luY3BvaW50Cj4gKyAqLwo+ICtzdHJ1Y3QgaG9zdDF4X3N5bmNwdCAqaG9zdDF4X3N5bmNwdF9n
ZXQoc3RydWN0IGhvc3QxeF9zeW5jcHQgKnNwKQo+ICt7Cj4gKwlrcmVmX2dldCgmc3AtPnJlZik7
Cj4gKwo+ICsJcmV0dXJuIHNwOwo+ICB9Cj4gIEVYUE9SVF9TWU1CT0woaG9zdDF4X3N5bmNwdF9n
ZXQpOwoKSGVsbG8sIE1pa2tvIQoKV2hhdCBkbyB5b3UgdGhpbmsgYWJvdXQgdG8gb3Blbi1jb2Rl
IGFsbCB0aGUgaG9zdDF4IHN0cnVjdHMgYnkgbW92aW5nCnRoZW0gYWxsIG91dCBpbnRvIHRoZSBw
dWJsaWMgbGludXgvaG9zdDF4Lmg/IFRoZW4gd2UgY291bGQgaW5saW5lIGFsbAp0aGVzZSB0cml2
aWFsIHNpbmdsZS1saW5lIGZ1bmN0aW9ucyBieSBoYXZpbmcgdGhlbSBkZWZpbmVkIGluIHRoZSBw
dWJsaWMKaGVhZGVyLiBUaGlzIHdpbGwgYXZvaWQgYWxsIHRoZSB1bm5lY2Vzc2FyeSBvdmVyaGVh
ZCBieSBhbGxvd2luZwpjb21waWxlciB0byBvcHRpbWl6ZSB0aGUgY29kZSBuaWNlbHkuCgpPZiBj
b3Vyc2UgdGhpcyBjb3VsZCBiZSBhIHNlcGFyYXRlIGNoYW5nZSBhbmQgaXQgY291bGQgYmUgZG9u
ZSBzb21ldGltZQpsYXRlciwgSSBqdXN0IHdhbnRlZCB0byBzaGFyZSB0aGlzIHF1aWNrIHRob3Vn
aHQgZm9yIHRoZSBzdGFydCBvZiB0aGUKcmV2aWV3LgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1h
bi9saXN0aW5mby9kcmktZGV2ZWwK
