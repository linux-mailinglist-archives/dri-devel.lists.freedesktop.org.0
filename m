Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B4C91B4CA7
	for <lists+dri-devel@lfdr.de>; Wed, 22 Apr 2020 20:28:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E2C6B6E34C;
	Wed, 22 Apr 2020 18:28:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 97B4A6E082;
 Wed, 22 Apr 2020 18:28:30 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id r26so3635615wmh.0;
 Wed, 22 Apr 2020 11:28:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=reply-to:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=0tlyk2uniOQ7hNjY6as+wntcWMQo2HCI80sdZEQDd3g=;
 b=f6Msi2hf+rqfeBb8OaBCctiUVe6KpLx3zYGANKDJ4o0h4xKRVVzy1RjdDrtNoYqOUZ
 ZivypzjFqrahjChsmyh/7K6Fts600oggJUTQezINwbVmxpYgajgaUYdEloZUXfDJ1G1Z
 D2/p4m271tRSyN9CBsIQchnxdDFR/cfDYIj39gfk40CMrt3doOiPU3SR3J2sUQHivtzM
 WcINzLu15t250eGBI9+yqxjB+/A5xWH85a2daH5azcf6dO0D9xwtQWrCkonRQhDhYpCX
 dN6LnLkabhOXyCjNriJdQrUyo586iCQr6kxigSsqoFQ2qKYbcxT8R0mMX+jTvlilYNlW
 xPiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:to:cc:references:from
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-transfer-encoding:content-language;
 bh=0tlyk2uniOQ7hNjY6as+wntcWMQo2HCI80sdZEQDd3g=;
 b=gSGJ7P9mevJi5m6aeRmfi3XeAha+qjtTgk4wrKqvaDYu0DMwZ68azpVajFT0E4SqQ7
 3zKz2uiugubbFD9IWnOCnvBRZMEFLgZXWaYB0gC0p0s7w+mYmeFSdmCEqhFflgs1tRQ0
 iXgPEna3A+mZJt023GCr+oj5GBVKDGiQrDAIroAof8p2gJ+L3PXF/WqbbE0W33pr2M2k
 RLpww+QN2hr7Z3Qkp6JprxXefhlwGcZFc9vS+mICQ5Ah6KZEuVFv+weHzi1HKOXlcq/u
 dMZmoblikl2Bmfl5a807ZkiAX6j2bW+Qr+0wrx5W3cBY1WIoZ0EpuJDgINa1KaJpB1wD
 IZDw==
X-Gm-Message-State: AGi0Pub9lUnOhcu26pAOmcRK9RVSJ85OP3b51X6VWgpMXcwiDpKg4X3/
 K6ft83tqDCHZ/+RY134yb+A=
X-Google-Smtp-Source: APiQypJvkVOjEtvzY+6jXDqxtreoyefr10gKKT7OmtuCna524jgl5Rt40TWMEHc0iMW9Co+wasJbOQ==
X-Received: by 2002:a1c:41d7:: with SMTP id o206mr12114002wma.89.1587580109179; 
 Wed, 22 Apr 2020 11:28:29 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7?
 ([2a02:908:1252:fb60:be8a:bd56:1f94:86e7])
 by smtp.gmail.com with ESMTPSA id p16sm55977wro.21.2020.04.22.11.28.25
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 22 Apr 2020 11:28:25 -0700 (PDT)
Subject: Re: [PATCH] amdgpu: fixes memleak issue when init failed
To: "Ruhl, Michael J" <michael.j.ruhl@intel.com>,
 Bernard Zhao <bernard@vivo.com>, Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 "David (ChunMing) Zhou" <David1.Zhou@amd.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Tom St Denis <tom.stdenis@amd.com>, Ori Messinger <Ori.Messinger@amd.com>,
 Sam Ravnborg <sam@ravnborg.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <20200421111715.1231-1-bernard@vivo.com>
 <14063C7AD467DE4B82DEDB5C278E8663010212C230@FMSMSX108.amr.corp.intel.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <8a6899eb-2078-51a4-9b14-b2f47c35f221@gmail.com>
Date: Wed, 22 Apr 2020 20:28:24 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <14063C7AD467DE4B82DEDB5C278E8663010212C230@FMSMSX108.amr.corp.intel.com>
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
Reply-To: christian.koenig@amd.com
Cc: "opensource.kernel@vivo.com" <opensource.kernel@vivo.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMjIuMDQuMjAgdW0gMTc6NTEgc2NocmllYiBSdWhsLCBNaWNoYWVsIEo6Cj4+IC0tLS0tT3Jp
Z2luYWwgTWVzc2FnZS0tLS0tCj4+IEZyb206IGRyaS1kZXZlbCA8ZHJpLWRldmVsLWJvdW5jZXNA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnPiBPbiBCZWhhbGYgT2YKPj4gQmVybmFyZCBaaGFvCj4+IFNl
bnQ6IFR1ZXNkYXksIEFwcmlsIDIxLCAyMDIwIDc6MTcgQU0KPj4gVG86IEFsZXggRGV1Y2hlciA8
YWxleGFuZGVyLmRldWNoZXJAYW1kLmNvbT47IENocmlzdGlhbiBLw7ZuaWcKPj4gPGNocmlzdGlh
bi5rb2VuaWdAYW1kLmNvbT47IERhdmlkIChDaHVuTWluZykgWmhvdQo+PiA8RGF2aWQxLlpob3VA
YW1kLmNvbT47IERhdmlkIEFpcmxpZSA8YWlybGllZEBsaW51eC5pZT47IERhbmllbCBWZXR0ZXIK
Pj4gPGRhbmllbEBmZndsbC5jaD47IFRvbSBTdCBEZW5pcyA8dG9tLnN0ZGVuaXNAYW1kLmNvbT47
IE9yaSBNZXNzaW5nZXIKPj4gPE9yaS5NZXNzaW5nZXJAYW1kLmNvbT47IFNhbSBSYXZuYm9yZyA8
c2FtQHJhdm5ib3JnLm9yZz47IEJlcm5hcmQKPj4gWmhhbyA8YmVybmFyZEB2aXZvLmNvbT47IGFt
ZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnOyBkcmktCj4+IGRldmVsQGxpc3RzLmZyZWVkZXNr
dG9wLm9yZzsgbGludXgta2VybmVsQHZnZXIua2VybmVsLm9yZwo+PiBDYzogb3BlbnNvdXJjZS5r
ZXJuZWxAdml2by5jb20KPj4gU3ViamVjdDogW1BBVENIXSBhbWRncHU6IGZpeGVzIG1lbWxlYWsg
aXNzdWUgd2hlbiBpbml0IGZhaWxlZAo+Pgo+PiBWUkFNIG1hbmFnZXIgYW5kIERSTSBNTSB3aGVu
IGluaXQgZmFpbGVkLCB0aGVyZSBpcyBubyBvcGVyYWN0aW9uCj4+IHRvIGZyZWUga3phbGxvYyBt
ZW1vcnkgJiByZW1vdmUgZGV2aWNlIGZpbGUuCj4+IFRoaXMgd2lsbCBsZWFkIHRvIG1lbWxlYWsg
JiBjYXVzZSBzdGFiaWxpdHkgaXNzdWUuCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IEJlcm5hcmQgWmhh
byA8YmVybmFyZEB2aXZvLmNvbT4KPj4gLS0tCj4+IGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1
L2FtZGdwdV92cmFtX21nci5jIHwgMjQKPj4gKysrKysrKysrKysrKysrKy0tLS0KPj4gMSBmaWxl
IGNoYW5nZWQsIDE5IGluc2VydGlvbnMoKyksIDUgZGVsZXRpb25zKC0pCj4+Cj4+IGRpZmYgLS1n
aXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdnJhbV9tZ3IuYwo+PiBiL2Ry
aXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV92cmFtX21nci5jCj4+IGluZGV4IDgyYTMy
OTllNTNjMC4uNGM1ZmIxNTNlNmI0IDEwMDY0NAo+PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1k
L2FtZGdwdS9hbWRncHVfdnJhbV9tZ3IuYwo+PiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Ft
ZGdwdS9hbWRncHVfdnJhbV9tZ3IuYwo+PiBAQCAtMTc1LDMwICsxNzUsNDQgQEAgc3RhdGljIGlu
dCBhbWRncHVfdnJhbV9tZ3JfaW5pdChzdHJ1Y3QKPj4gdHRtX21lbV90eXBlX21hbmFnZXIgKm1h
biwKPj4gCXJldCA9IGRldmljZV9jcmVhdGVfZmlsZShhZGV2LT5kZXYsCj4+ICZkZXZfYXR0cl9t
ZW1faW5mb192cmFtX3RvdGFsKTsKPj4gCWlmIChyZXQpIHsKPj4gCQlEUk1fRVJST1IoIkZhaWxl
ZCB0byBjcmVhdGUgZGV2aWNlIGZpbGUKPj4gbWVtX2luZm9fdnJhbV90b3RhbFxuIik7Cj4+IC0J
CXJldHVybiByZXQ7Cj4+ICsJCWdvdG8gVlJBTV9UT1RBTF9GQUlMOwo+PiAJfQo+PiAJcmV0ID0g
ZGV2aWNlX2NyZWF0ZV9maWxlKGFkZXYtPmRldiwKPj4gJmRldl9hdHRyX21lbV9pbmZvX3Zpc192
cmFtX3RvdGFsKTsKPiBIYXZlIHlvdSBsb29rZWQgYXQgdGhlIERFVklDRV9BVFRSIG1lY2hhbmlz
bT8KClllYWgsIEkndmUgdGhvdWdodCBhYm91dCB0aGF0IGFzIHdlbGwuIEJ1dCBkaWRuJ3QgaGFk
IHRpbWUgdG8gbG9vayBpbnRvIApkZXRhaWwgaWYgdGhhdCBjb3VsZCBiZSBhcHBsaWVkIGhlcmUg
b3Igbm90LgoKUmVnYXJkcywKQ2hyaXN0aWFuLgoKPgo+IEl0IGlzIHNldCB1cCB0byBhZGQgZGV2
aWNlIGZpbGVzLiAgWW91IHdvbid0IGdldCB0aGUgZ3JhbnVsYXJpdHkgb2YgZWFjaCBmaWxlLAo+
IGJ1dCBpdCBoYXMgYSBsb3QgbW9yZSBhdXRvbWF0aWMtbmVzcyB0byBzZXR0aW5nIHRoaXMgc3R1
ZmYgdXAuCj4KPiBNaWtlCj4KPj4gCWlmIChyZXQpIHsKPj4gCQlEUk1fRVJST1IoIkZhaWxlZCB0
byBjcmVhdGUgZGV2aWNlIGZpbGUKPj4gbWVtX2luZm9fdmlzX3ZyYW1fdG90YWxcbiIpOwo+PiAt
CQlyZXR1cm4gcmV0Owo+PiArCQlnb3RvIFZJU19WUkFNX1RPVEFfRkFJTDsKPj4gCX0KPj4gCXJl
dCA9IGRldmljZV9jcmVhdGVfZmlsZShhZGV2LT5kZXYsCj4+ICZkZXZfYXR0cl9tZW1faW5mb192
cmFtX3VzZWQpOwo+PiAJaWYgKHJldCkgewo+PiAJCURSTV9FUlJPUigiRmFpbGVkIHRvIGNyZWF0
ZSBkZXZpY2UgZmlsZQo+PiBtZW1faW5mb192cmFtX3VzZWRcbiIpOwo+PiAtCQlyZXR1cm4gcmV0
Owo+PiArCQlnb3RvIFZSQU1fVVNFRF9GQUlMOwo+PiAJfQo+PiAJcmV0ID0gZGV2aWNlX2NyZWF0
ZV9maWxlKGFkZXYtPmRldiwKPj4gJmRldl9hdHRyX21lbV9pbmZvX3Zpc192cmFtX3VzZWQpOwo+
PiAJaWYgKHJldCkgewo+PiAJCURSTV9FUlJPUigiRmFpbGVkIHRvIGNyZWF0ZSBkZXZpY2UgZmls
ZQo+PiBtZW1faW5mb192aXNfdnJhbV91c2VkXG4iKTsKPj4gLQkJcmV0dXJuIHJldDsKPj4gKwkJ
Z290byBWSVNfVlJBTV9VU0VEX0ZBSUw7Cj4+IAl9Cj4+IAlyZXQgPSBkZXZpY2VfY3JlYXRlX2Zp
bGUoYWRldi0+ZGV2LAo+PiAmZGV2X2F0dHJfbWVtX2luZm9fdnJhbV92ZW5kb3IpOwo+PiAJaWYg
KHJldCkgewo+PiAJCURSTV9FUlJPUigiRmFpbGVkIHRvIGNyZWF0ZSBkZXZpY2UgZmlsZQo+PiBt
ZW1faW5mb192cmFtX3ZlbmRvclxuIik7Cj4+IC0JCXJldHVybiByZXQ7Cj4+ICsJCWdvdG8gVlJB
TV9WRVJET1JfRkFJTDsKPj4gCX0KPj4KPj4gCXJldHVybiAwOwo+PiArCj4+ICtWUkFNX1ZFUkRP
Ul9GQUlMOgo+PiArCWRldmljZV9yZW1vdmVfZmlsZShhZGV2LT5kZXYsCj4+ICZkZXZfYXR0cl9t
ZW1faW5mb192aXNfdnJhbV91c2VkKTsKPj4gK1ZJU19WUkFNX1VTRURfRkFJTDoKPj4gKwlkZXZp
Y2VfcmVtb3ZlX2ZpbGUoYWRldi0+ZGV2LCAmZGV2X2F0dHJfbWVtX2luZm9fdnJhbV91c2VkKTsK
Pj4gK1JWQU1fVVNFRF9GQUlMOgo+PiArCWRldmljZV9yZW1vdmVfZmlsZShhZGV2LT5kZXYsCj4+
ICZkZXZfYXR0cl9tZW1faW5mb192aXNfdnJhbV90b3RhbCk7Cj4+ICtWSVNfVlJBTV9UT1RBX0ZB
SUw6Cj4+ICsJZGV2aWNlX3JlbW92ZV9maWxlKGFkZXYtPmRldiwgJmRldl9hdHRyX21lbV9pbmZv
X3ZyYW1fdG90YWwpOwo+PiArVlJBTV9UT1RBTF9GQUlMOgo+PiArCWtmcmVlKG1ncik7Cj4+ICsJ
bWFuLT5wcml2ID0gTlVMTDsKPj4gKwo+PiArCXJldHVybiByZXQ7Cj4+IH0KPj4KPj4gLyoqCj4+
IC0tCj4+IDIuMjYuMgo+Pgo+PiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwo+PiBkcmktZGV2ZWwgbWFpbGluZyBsaXN0Cj4+IGRyaS1kZXZlbEBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKPj4gaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9kcmktZGV2ZWwKPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwo+IGFtZC1nZnggbWFpbGluZyBsaXN0Cj4gYW1kLWdmeEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKPiBodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2FtZC1nZngKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
