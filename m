Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 619F0D2C7C
	for <lists+dri-devel@lfdr.de>; Thu, 10 Oct 2019 16:28:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A920C6EB5A;
	Thu, 10 Oct 2019 14:28:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd44.google.com (mail-io1-xd44.google.com
 [IPv6:2607:f8b0:4864:20::d44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 646576EB5C;
 Thu, 10 Oct 2019 14:28:11 +0000 (UTC)
Received: by mail-io1-xd44.google.com with SMTP id b136so14149910iof.3;
 Thu, 10 Oct 2019 07:28:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=os8P3nNMDt7HcebkuGflsdPwamosXurV2zZudUfKRt4=;
 b=qzoBUSeDJOTLuZRwhZBu0hebs+1Sug/uv/f5Gf0hnTwU1rN4NwFHO/GcMhZUubXGRu
 7NO2Ln0R59s7vCIYK+R+1rqJKQLJUfGMAbpyLcprWW+H1Qcki9OVFqUMF5iY1pbU5hGB
 Corel/7wU9ts+XQAI2/bQ1lf1dNfoDPYw4A1Enaj0+RcSoAOwmRxobnv5gvdE1h+OtxP
 XsHaTcub2K4ues5btrU1F5yfqejGhZKRv8T1snMGDNFaT3wUvYylJb9cHSFaA1IyBEMP
 WN3rFXDiDR98JlA0IAhyo10ft9uuordzpGCXgxeYmGKrKvocsKHgJ1OT9FhQENeLEXZ1
 rAQQ==
X-Gm-Message-State: APjAAAUWxQudjC6IJSmTDtCzfiEOMJ16h4qYiRyQT8V7SWzX7xAyC1u4
 1lly5rzHeHx5jCIVvcEbGQAldytaGR5yo9cNEJdBHqHr
X-Google-Smtp-Source: APXvYqzRgJusDb5SXUqeLRtwooSCvIaK1zn2vFkb+aXiz/bpbr+P1Egw0XQw1q+zbpWvf2DIMmY3DdouJ1rgq7uBhvA=
X-Received: by 2002:a02:c608:: with SMTP id i8mr11045860jan.40.1570717690431; 
 Thu, 10 Oct 2019 07:28:10 -0700 (PDT)
MIME-Version: 1.0
References: <20190922074900.853-1-yuq825@gmail.com>
 <156915463935.21369.4938801884938429332@skylake-alporthouse-com>
 <156915661567.21369.17366014102480171128@skylake-alporthouse-com>
In-Reply-To: <156915661567.21369.17366014102480171128@skylake-alporthouse-com>
From: Qiang Yu <yuq825@gmail.com>
Date: Thu, 10 Oct 2019 22:27:59 +0800
Message-ID: <CAKGbVbv11BLiv3Mgn2o5PnOKn1H6+mY1ZsXVetpcqSsE98Dd9Q@mail.gmail.com>
Subject: Re: [PATCH] dma-buf/resv: fix exclusive fence get
To: dri-devel <dri-devel@lists.freedesktop.org>, 
 Chris Wilson <chris@chris-wilson.co.uk>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=os8P3nNMDt7HcebkuGflsdPwamosXurV2zZudUfKRt4=;
 b=itRPjQo1S6hGbE+jpIDRO2hUbipHm16V3mIEuB6Eicn/rPVzfjmD7I9/7syMGJ+4TT
 vhHIcGz0RPqdu8dTAtZqqPImx8lEmplVXdr+Ki/fL+lpPdeOIkg4nlBkHBMIhRsuAxlR
 Fl9fubWz7yBDlNhogLCX0oR6rPPAcjdNng5918vOQ0oMBGzltN2/eYrYkrCUtJH9R28D
 mk4n8d8fKgsZPYJm9snGbvzN89tLjHB16Fhy6CzOz2TpOa9qYpe6pAc5L56K5J9edFiw
 LDI4ngs8YUCKgMx5SKdJlpMg8Ma+ctLJGX8Ha3/52CxjgSAeGYt96vuJPtkdK8WHo9JX
 6PhA==
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
Cc: lima@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 linux-media@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgQ2hyaXMsCgpUaGlzIGZpeCBoYXMgYmVlbiBwdXNoZWQgdG8gZHJtLW1pc2MtbmV4dCBmb3Ig
YSB3aGlsZS4gQnV0IExpbnV4CjUuNC1yYyBrZXJuZWxzIHN0aWxsIGRvZXMgbm90IGhhdmUgdGhp
cyBmaXguClNob3VsZCBpdCBiZSBhbHNvIHB1c2hlZCB0byBkcm0tbWlzYy1maXhlcz8KClRoYW5r
cywKUWlhbmcKCgpPbiBTdW4sIFNlcCAyMiwgMjAxOSBhdCA4OjUwIFBNIENocmlzIFdpbHNvbiA8
Y2hyaXNAY2hyaXMtd2lsc29uLmNvLnVrPiB3cm90ZToKPgo+IFF1b3RpbmcgQ2hyaXMgV2lsc29u
ICgyMDE5LTA5LTIyIDEzOjE3OjE5KQo+ID4gUXVvdGluZyBRaWFuZyBZdSAoMjAxOS0wOS0yMiAw
ODo0OTowMCkKPiA+ID4gVGhpcyBjYXVzZXMga2VybmVsIGNyYXNoIHdoZW4gdGVzdGluZyBsaW1h
IGRyaXZlci4KPiA+ID4KPiA+ID4gQ2M6IENocmlzdGlhbiBLw7ZuaWcgPGNocmlzdGlhbi5rb2Vu
aWdAYW1kLmNvbT4KPiA+ID4gRml4ZXM6IGI4YzAzNmRmYzY2ZiAoImRtYS1idWY6IHNpbXBsaWZ5
IHJlc2VydmF0aW9uX29iamVjdF9nZXRfZmVuY2VzX3JjdSBhIGJpdCIpCj4gPiA+IFNpZ25lZC1v
ZmYtYnk6IFFpYW5nIFl1IDx5dXE4MjVAZ21haWwuY29tPgo+ID4gPiAtLS0KPiA+ID4gIGRyaXZl
cnMvZG1hLWJ1Zi9kbWEtcmVzdi5jIHwgMiArLQo+ID4gPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5z
ZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCj4gPiA+Cj4gPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJz
L2RtYS1idWYvZG1hLXJlc3YuYyBiL2RyaXZlcnMvZG1hLWJ1Zi9kbWEtcmVzdi5jCj4gPiA+IGlu
ZGV4IDQyYThmM2YxMTY4MS4uNzA5MDAyNTE1NTUwIDEwMDY0NAo+ID4gPiAtLS0gYS9kcml2ZXJz
L2RtYS1idWYvZG1hLXJlc3YuYwo+ID4gPiArKysgYi9kcml2ZXJzL2RtYS1idWYvZG1hLXJlc3Yu
Ywo+ID4gPiBAQCAtNDcxLDcgKzQ3MSw3IEBAIGludCBkbWFfcmVzdl9nZXRfZmVuY2VzX3JjdShz
dHJ1Y3QgZG1hX3Jlc3YgKm9iaiwKPiA+ID4gICAgICAgICBpZiAocGZlbmNlX2V4Y2wpCj4gPiA+
ICAgICAgICAgICAgICAgICAqcGZlbmNlX2V4Y2wgPSBmZW5jZV9leGNsOwo+ID4gPiAgICAgICAg
IGVsc2UgaWYgKGZlbmNlX2V4Y2wpCj4gPiA+IC0gICAgICAgICAgICAgICBzaGFyZWRbKytzaGFy
ZWRfY291bnRdID0gZmVuY2VfZXhjbDsKPiA+ID4gKyAgICAgICAgICAgICAgIHNoYXJlZFtzaGFy
ZWRfY291bnQrK10gPSBmZW5jZV9leGNsOwo+ID4KPiA+IE9vcHMuCj4gPgo+ID4gUmV2aWV3ZWQt
Ynk6IENocmlzIFdpbHNvbiA8Y2hyaXNAY2hyaXMtd2lsc29uLmNvLnVrPgo+Cj4gQXBwbGllZCwg
dGhhbmtzIGZvciB0aGUgZml4Lgo+IC1DaHJpcwpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0
cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9kcmktZGV2ZWw=
