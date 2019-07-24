Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D3D1073918
	for <lists+dri-devel@lfdr.de>; Wed, 24 Jul 2019 21:37:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 702A66E640;
	Wed, 24 Jul 2019 19:37:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-f196.google.com (mail-qt1-f196.google.com
 [209.85.160.196])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA97B6E640
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Jul 2019 19:36:59 +0000 (UTC)
Received: by mail-qt1-f196.google.com with SMTP id h21so46638884qtn.13
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Jul 2019 12:36:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Z7pnaGuYc9LFLbT5aUxNfUlnE7ek1gcnJ4zW5L3HylM=;
 b=Nk7uC9cdagmPLbXxcATIePcimzL4SuYskxoEDboSij439bsRMyA8mCi37j9C8DG84C
 JgjF8pbzZb4DwDMtC2nHTYFL8V/FO+9wxB4ZICs3Jh6SmqTHKce8ylg1UnIW9nvWNVIB
 +xa63iHSJvfIvsTFbnanHiWht0sWROW0p1rpYCqbQgAj2nxP4VBMx/g7R+a/K8FjcM2A
 rFk0ZdvLE1I2rJbXW8dfpkvrZCXFBCvQ7rfzR3nxFFvqj0K2R+OBYRm4oAYa0TODldm6
 Pm0+kwyFgAkPJNhBULXTG8qCMkbyOJHIN2Rf/WIE+tAAzpz0gnlKKyQOAb3aVLH0fowV
 cxBw==
X-Gm-Message-State: APjAAAV2RI0D5/ujpyqBzBquPVrrt5eRQg41pGO/x28hlR8yeiVT35tO
 8RWzxWVzx+q4gYGNwRR/SqqtyA==
X-Google-Smtp-Source: APXvYqwNTwfZ7UhOrUsmMJREZDSG4r+F8zrpdIk7pUPLDp8e5SLJxmNngfBQGNr0NG9bBAHOHmh5zA==
X-Received: by 2002:ac8:1887:: with SMTP id s7mr59031081qtj.220.1563997018800; 
 Wed, 24 Jul 2019 12:36:58 -0700 (PDT)
Received: from [192.168.1.157] (pool-96-235-39-235.pitbpa.fios.verizon.net.
 [96.235.39.235])
 by smtp.gmail.com with ESMTPSA id q17sm16672031qtl.13.2019.07.24.12.36.57
 (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
 Wed, 24 Jul 2019 12:36:58 -0700 (PDT)
Subject: Re: Limits for ION Memory Allocator
To: alex.popov@linux.com, Sumit Semwal <sumit.semwal@linaro.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, arve@android.com,
 Todd Kjos <tkjos@android.com>, Martijn Coenen <maco@android.com>,
 Joel Fernandes <joel@joelfernandes.org>,
 Christian Brauner <christian@brauner.io>,
 Riley Andrews <riandrews@android.com>, devel@driverdev.osuosl.org,
 linaro-mm-sig@lists.linaro.org,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 dri-devel@lists.freedesktop.org, LKML <linux-kernel@vger.kernel.org>,
 Brian Starkey <brian.starkey@arm.com>,
 Daniel Vetter <daniel.vetter@intel.com>, Mark Brown <broonie@kernel.org>,
 Benjamin Gaignard <benjamin.gaignard@linaro.org>,
 Linux-MM <linux-mm@kvack.org>, Dmitry Vyukov <dvyukov@google.com>,
 Andrey Konovalov <andreyknvl@google.com>, syzkaller@googlegroups.com,
 John Stultz <john.stultz@linaro.org>
References: <3b922aa4-c6d4-e4a4-766d-f324ff77f7b5@linux.com>
From: Laura Abbott <labbott@redhat.com>
Message-ID: <40f8b7d8-fafa-ad99-34fb-9c63e34917e2@redhat.com>
Date: Wed, 24 Jul 2019 15:36:57 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <3b922aa4-c6d4-e4a4-766d-f324ff77f7b5@linux.com>
Content-Language: en-US
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

T24gNy8xNy8xOSAxMjozMSBQTSwgQWxleGFuZGVyIFBvcG92IHdyb3RlOgo+IEhlbGxvIQo+IAo+
IFRoZSBzeXprYWxsZXIgWzFdIGhhcyBhIHRyb3VibGUgd2l0aCBmdXp6aW5nIHRoZSBMaW51eCBr
ZXJuZWwgd2l0aCBJT04gTWVtb3J5Cj4gQWxsb2NhdG9yLgo+IAo+IFN5emthbGxlciB1c2VzIHNl
dmVyYWwgbWV0aG9kcyBbMl0gdG8gbGltaXQgbWVtb3J5IGNvbnN1bXB0aW9uIG9mIHRoZSB1c2Vy
c3BhY2UKPiBwcm9jZXNzZXMgY2FsbGluZyB0aGUgc3lzY2FsbHMgZm9yIHRlc3RpbmcgdGhlIGtl
cm5lbDoKPiAgIC0gc2V0cmxpbWl0KCksCj4gICAtIGNncm91cHMsCj4gICAtIHZhcmlvdXMgc3lz
Y3RsLgo+IEJ1dCB0aGVzZSBtZXRob2RzIGRvbid0IHdvcmsgZm9yIElPTiBNZW1vcnkgQWxsb2Nh
dG9yLCBzbyBhbnkgdXNlcnNwYWNlIHByb2Nlc3MKPiB0aGF0IGhhcyBhY2Nlc3MgdG8gL2Rldi9p
b24gY2FuIGJyaW5nIHRoZSBzeXN0ZW0gdG8gdGhlIG91dC1vZi1tZW1vcnkgc3RhdGUuCj4gCj4g
QW4gZXhhbXBsZSBvZiBhIHByb2dyYW0gZG9pbmcgdGhhdDoKPiAKPiAKPiAjaW5jbHVkZSA8c3lz
L3R5cGVzLmg+Cj4gI2luY2x1ZGUgPHN5cy9zdGF0Lmg+Cj4gI2luY2x1ZGUgPGZjbnRsLmg+Cj4g
I2luY2x1ZGUgPHN0ZGlvLmg+Cj4gI2luY2x1ZGUgPGxpbnV4L3R5cGVzLmg+Cj4gI2luY2x1ZGUg
PHN5cy9pb2N0bC5oPgo+IAo+ICNkZWZpbmUgSU9OX0lPQ19NQUdJQwkJJ0knCj4gI2RlZmluZSBJ
T05fSU9DX0FMTE9DCQlfSU9XUihJT05fSU9DX01BR0lDLCAwLCBcCj4gCQkJCSAgICAgIHN0cnVj
dCBpb25fYWxsb2NhdGlvbl9kYXRhKQo+IAo+IHN0cnVjdCBpb25fYWxsb2NhdGlvbl9kYXRhIHsK
PiAJX191NjQgbGVuOwo+IAlfX3UzMiBoZWFwX2lkX21hc2s7Cj4gCV9fdTMyIGZsYWdzOwo+IAlf
X3UzMiBmZDsKPiAJX191MzIgdW51c2VkOwo+IH07Cj4gCj4gaW50IG1haW4odm9pZCkKPiB7Cj4g
CXVuc2lnbmVkIGxvbmcgaSA9IDA7Cj4gCWludCBmZCA9IC0xOwo+IAlzdHJ1Y3QgaW9uX2FsbG9j
YXRpb25fZGF0YSBkYXRhID0gewo+IAkJLmxlbiA9IDB4MTNmNjVkOGMsCj4gCQkuaGVhcF9pZF9t
YXNrID0gMSwKPiAJCS5mbGFncyA9IDAsCj4gCQkuZmQgPSAtMSwKPiAJCS51bnVzZWQgPSAwCj4g
CX07Cj4gCj4gCWZkID0gb3BlbigiL2Rldi9pb24iLCAwKTsKPiAJaWYgKGZkID09IC0xKSB7Cj4g
CQlwZXJyb3IoIlstXSBvcGVuIC9kZXYvaW9uIik7Cj4gCQlyZXR1cm4gMTsKPiAJfQo+IAo+IAl3
aGlsZSAoMSkgewo+IAkJcHJpbnRmKCJpdGVyICVsdVxuIiwgaSk7Cj4gCQlpb2N0bChmZCwgSU9O
X0lPQ19BTExPQywgJmRhdGEpOwo+IAkJaSsrOwo+IAl9Cj4gCj4gCXJldHVybiAwOwo+IH0KPiAK
PiAKPiBJIGxvb2tlZCB0aHJvdWdoIHRoZSBjb2RlIG9mIGlvbl9hbGxvYygpIGFuZCBkaWRuJ3Qg
ZmluZCBhbnkgbGltaXQgY2hlY2tzLgo+IElzIGl0IGN1cnJlbnRseSBwb3NzaWJsZSB0byBsaW1p
dCBJT04ga2VybmVsIGFsbG9jYXRpb25zIGZvciBzb21lIHByb2Nlc3M/Cj4gCj4gSWYgbm90LCBp
cyBpdCBhIHJpZ2h0IGlkZWEgdG8gZG8gdGhhdD8KPiBUaGFua3MhCj4gCgpZZXMsIEkgZG8gdGhp
bmsgdGhhdCdzIHRoZSByaWdodCBhcHByb2FjaC4gV2UncmUgd29ya2luZyBvbiBtb3ZpbmcgSW9u
Cm91dCBvZiBzdGFnaW5nIGFuZCB0aGlzIGlzIHNvbWV0aGluZyBJIG1lbnRpb25lZCB0byBKb2hu
IFN0dWx0ei4gSSBkb24ndAp0aGluayB3ZSd2ZSB0aG91Z2h0IHRvbyBoYXJkIGFib3V0IGhvdyB0
byBkbyB0aGUgYWN0dWFsIGxpbWl0aW5nIHNvCnN1Z2dlc3Rpb25zIGFyZSB3ZWxjb21lLgoKVGhh
bmtzLApMYXVyYQoKPiBCZXN0IHJlZ2FyZHMsCj4gQWxleGFuZGVyCj4gCj4gCj4gWzFdOiBodHRw
czovL2dpdGh1Yi5jb20vZ29vZ2xlL3N5emthbGxlcgo+IFsyXTogaHR0cHM6Ly9naXRodWIuY29t
L2dvb2dsZS9zeXprYWxsZXIvYmxvYi9tYXN0ZXIvZXhlY3V0b3IvY29tbW9uX2xpbnV4LmgKPiAK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZl
bCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xp
c3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
