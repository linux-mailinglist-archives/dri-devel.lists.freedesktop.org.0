Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 556E4D3F1C
	for <lists+dri-devel@lfdr.de>; Fri, 11 Oct 2019 13:59:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B86F6E243;
	Fri, 11 Oct 2019 11:59:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com
 [IPv6:2a00:1450:4864:20::244])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D9286E243
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Oct 2019 11:59:15 +0000 (UTC)
Received: by mail-lj1-x244.google.com with SMTP id m7so9576808lji.2
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Oct 2019 04:59:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=qZxcysWcGBjK40AA/XUOIdw3iHtZgIgHG9FtdNWtwBI=;
 b=k1+1/0/RK9MaNPRQoKOVGWS22mNfpXOIeEepScq2epWcrR4OCBZGtx1nzIknZa1jfe
 /AG7UqtxhZROTd/qowxYhTnqgBmbfvfANP5+4lSt3MUm/pY2OLz3f7BjQe7YAb7EYQaE
 dIoLlh/OisuKuA9hGflZD4sw9h907GlF6+LzuSs7QwWdvG9HFBhwvF1R6G/opHgg3u04
 HW+iOXBnTJaiy195Y5/q4GoVwXcpAtzs4P5QzS/pM7zd4iCu2L94W5wS3ElyB62D7/LK
 O2pFGdToX3mpJzdYL+LxvkuSwkfwb5RlNdlP+urK1+Pv2rfSM5cQja4AkNk46htKx0QL
 Cc7Q==
X-Gm-Message-State: APjAAAWV8lN3R7gzFFXEt/N1psIup/NORWDBoausNuFSriJbNZYuKVr7
 SP8ZpMudS30Vg0A1QOjlvQ39hjIKNRreNGJneZBdcg==
X-Google-Smtp-Source: APXvYqyu8ngFvs0Ijr0BcLjn77SktYZ8O5FQq+oWdsZebG5H9lIAvGxp6elULEAs295/M0RD9pF16TysYOraX+QU4KA=
X-Received: by 2002:a2e:957:: with SMTP id 84mr8958337ljj.245.1570795153555;
 Fri, 11 Oct 2019 04:59:13 -0700 (PDT)
MIME-Version: 1.0
References: <20191011111813.20851-1-andrzej.p@collabora.com>
 <20191011111813.20851-3-andrzej.p@collabora.com>
In-Reply-To: <20191011111813.20851-3-andrzej.p@collabora.com>
From: Daniel Stone <daniel@fooishbar.org>
Date: Fri, 11 Oct 2019 12:59:02 +0100
Message-ID: <CAPj87rNb=Sa2Hg8KZK5ioocdv0BMj9c3NHK2v4UZibMmw2DdGA@mail.gmail.com>
Subject: Re: [PATCH 2/2] drm/rockchip: Add support for afbc
To: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fooishbar-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=qZxcysWcGBjK40AA/XUOIdw3iHtZgIgHG9FtdNWtwBI=;
 b=Zk7zrYDiiAloCyPwmmtaBGLskO2Fx1VMfLtS0bvFGEfrMXwqWjgwR0fLfvMCm0mhNb
 CvaDy0a+1pSt6z/9qZkexB2994P9n/iUPRpzZL7ZHOUacbuyY2ZAbPSQJQcTp3Xkl99p
 Py83bspMfff+i7yzB2pP/ZM5cHgVwagS0RKJHIFBsklI6O44CO+pY/NF8aZBbb+WT7Ep
 e3UTNNptN5s+r5NWbU+5gAv2U4bxSS2MOHZbK4rmM2X+fRvYidMhfxKcE3+6y+zc5SrG
 kSFEpHjXj3MNmevmM1KqxBJSl7swdsnabGzHoo9gG3j6zN818LNg0U24WI49R/W+Jq6d
 m+SA==
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
Cc: David Airlie <airlied@linux.ie>, Liviu Dudau <liviu.dudau@arm.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-rockchip <linux-rockchip@lists.infradead.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, kernel@collabora.com,
 Sean Paul <sean@poorly.run>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgQW5kcnplaiwKCk9uIEZyaSwgMTEgT2N0IDIwMTkgYXQgMTI6MTgsIEFuZHJ6ZWogUGlldHJh
c2lld2ljego8YW5kcnplai5wQGNvbGxhYm9yYS5jb20+IHdyb3RlOgo+IEBAIC0zMiw2ICszNSw0
NiBAQCByb2NrY2hpcF9mYl9hbGxvYyhzdHJ1Y3QgZHJtX2RldmljZSAqZGV2LCBjb25zdCBzdHJ1
Y3QgZHJtX21vZGVfZmJfY21kMiAqbW9kZV9jbQo+ICAgICAgICAgaW50IHJldDsKPiAgICAgICAg
IGludCBpOwo+Cj4gKyAgICAgICBpZiAobW9kZV9jbWQtPm1vZGlmaWVyWzBdKSB7Cj4gKyAgICAg
ICAgICAgICAgIGNvbnN0IHN0cnVjdCBkcm1fZm9ybWF0X2luZm8gKmluZm87Cj4gKyAgICAgICAg
ICAgICAgIGludCBicHA7Cj4gKwo+ICsgICAgICAgICAgICAgICBpZiAobW9kZV9jbWQtPm1vZGlm
aWVyWzBdICYKClVzZSAhPSBoZXJlLCBub3QgJn4uCgo+ICsgICAgICAgY2FzZSBEUk1fRk9STUFU
X0JHUjg4ODoKPiArICAgICAgICAgICAgICAgcmV0dXJuIEFGQkNfRk1UX1U4VThVODsKPiArICAg
ICAgIGNhc2UgRFJNX0ZPUk1BVF9SR0I1NjU6Cj4gKyAgICAgICBjYXNlIERSTV9GT1JNQVRfQkdS
NTY1Ogo+ICsgICAgICAgICAgICAgICByZXR1cm4gQUZCQ19GTVRfUkdCNTY1Owo+ICsgICAgICAg
ZGVmYXVsdDoKPiArICAgICAgICAgICAgICAgRFJNX0VSUk9SKCJ1bnN1cHBvcnRlZCBhZmJjIGZv
cm1hdFslMDh4XVxuIiwgZm9ybWF0KTsKClRoaXMgc2hvdWxkIG5vdCBiZSByZWFjaGFibGUsIGJl
Y2F1c2UgeW91IHNob3VsZG4ndCBiZSBhYmxlIHRvIGNyZWF0ZQphIGZyYW1lYnVmZmVyIHdpdGgg
YW4gdW5zdXBwb3J0ZWQgZm9ybWF0L21vZGlmaWVyIGNvbWJpbmF0aW9uLgoKPiArc3RhdGljIGJv
b2wgcm9ja2NoaXBfbW9kX3N1cHBvcnRlZChzdHJ1Y3QgZHJtX3BsYW5lICpwbGFuZSwKPiArICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHUzMiBmb3JtYXQsIHU2NCBtb2RpZmllcikK
PiArewo+ICsgICAgICAgY29uc3Qgc3RydWN0IGRybV9mb3JtYXRfaW5mbyAqaW5mbzsKPiArCj4g
KyAgICAgICBpZiAoV0FSTl9PTihtb2RpZmllciA9PSBEUk1fRk9STUFUX01PRF9JTlZBTElEKSkK
PiArICAgICAgICAgICAgICAgcmV0dXJuIGZhbHNlOwo+ICsKPiArICAgICAgIGlmIChtb2RpZmll
ciA9PSBEUk1fRk9STUFUX01PRF9MSU5FQVIpCj4gKyAgICAgICAgICAgICAgIHJldHVybiB0cnVl
Owo+ICsKPiArICAgICAgIGlmIChtb2RpZmllciAmIH5EUk1fRk9STUFUX01PRF9BUk1fQUZCQygK
CkFnYWluIHVzZSAhPSBoZXJlLgoKPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIEFG
QkNfRk9STUFUX01PRF9CTE9DS19TSVpFXzE2eDE2IHwKPiArICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIEFGQkNfRk9STUFUX01PRF9TUEFSU0UKPiArICAgICAgICAgICAgICAgICAgICAg
ICApCj4gKyAgICAgICApIHsKPiArICAgICAgICAgICAgICAgRFJNX0RFQlVHX0tNUygiVW5zdXBw
b3J0ZWQgZm9ybWF0IG1vZGlmZXIgMHglbGx4XG4iLCBtb2RpZmllcik7Cj4gKwo+ICsgICAgICAg
ICAgICAgICByZXR1cm4gZmFsc2U7Cj4gKyAgICAgICB9Cj4gKwo+ICsgICAgICAgaW5mbyA9IGRy
bV9mb3JtYXRfaW5mbyhmb3JtYXQpOwo+ICsgICAgICAgaWYgKGluZm8tPm51bV9wbGFuZXMgIT0g
MSkgewo+ICsgICAgICAgICAgICAgICBEUk1fREVCVUdfS01TKCJBRkJDIGJ1ZmZlcnMgZXhwZWN0
IG9uZSBwbGFuZVxuIik7Cj4gKyAgICAgICAgICAgICAgIHJldHVybiBmYWxzZTsKPiArICAgICAg
IH0KClRoaXMgaXMgd2hlcmUgeW91IHNob3VsZCByZWplY3QgdW5zdXBwb3J0ZWQgZm9ybWF0ICsg
QUZCQwpjb21iaW5hdGlvbnMuIERvaW5nIGl0IGhlcmUgcHJldmVudHMgaXQgZnJvbSBldmVyIGJl
aW5nIGFkdmVydGlzZWQgdG8KdXNlcnNwYWNlIGluIHRoZSBmaXJzdCBwbGFjZS4KCj4gQEAgLTgw
OCw2ICs5MTksMjQgQEAgc3RhdGljIHZvaWQgdm9wX3BsYW5lX2F0b21pY191cGRhdGUoc3RydWN0
IGRybV9wbGFuZSAqcGxhbmUsCj4KPiAgICAgICAgIHNwaW5fbG9jaygmdm9wLT5yZWdfbG9jayk7
Cj4KPiArICAgICAgIGlmIChmYi0+bW9kaWZpZXIgPT0gRFJNX0ZPUk1BVF9NT0RfQVJNX0FGQkMo
Cj4gKyAgICAgICAgICAgICAgIEFGQkNfRk9STUFUX01PRF9CTE9DS19TSVpFXzE2eDE2IHwgQUZC
Q19GT1JNQVRfTU9EX1NQQVJTRSkpIHsKPiArICAgICAgICAgICAgICAgaW50IGFmYmNfZm9ybWF0
ID0gdm9wX2NvbnZlcnRfYWZiY19mb3JtYXQoZmItPmZvcm1hdC0+Zm9ybWF0KTsKPiArCj4gKyAg
ICAgICAgICAgICAgIFZPUF9BRkJDX1NFVCh2b3AsIGZvcm1hdCwgYWZiY19mb3JtYXQgfCAxIDw8
IDQpOwoKSSBhc3N1bWUgdGhlICgxIDw8IDQpIHByb2dyYW1zIHRoZSAxNngxNiBibG9jayBzaXpl
LiBDYW4gd2Ugc3VwcG9ydApvdGhlciBibG9jayBzaXplcz8KCj4gKyAgICAgICAgICAgICAgIFZP
UF9BRkJDX1NFVCh2b3AsIGhyZWdfYmxvY2tfc3BsaXQsIDApOwoKRG9lcyB0aGlzIG1lYW4gd2Ug
Y2FuIGFsc28gc3VwcG9ydCBBRkJDX0ZPUk1BVF9NT0RfU1BMSVQ/Cgo+ICsgICAgICAgICAgICAg
ICBWT1BfQUZCQ19TRVQodm9wLCB3aW5fc2VsLCBWT1BfV0lOX1RPX0lOREVYKHZvcF93aW4pKTsK
PiArICAgICAgICAgICAgICAgVk9QX0FGQkNfU0VUKHZvcCwgaGRyX3B0ciwgZG1hX2FkZHIpOwo+
ICsgICAgICAgICAgICAgICBWT1BfQUZCQ19TRVQodm9wLCBwaWNfc2l6ZSwgYWN0X2luZm8pOwo+
ICsKPiArICAgICAgICAgICAgICAgLyoKPiArICAgICAgICAgICAgICAgICogVGhlIHdpbmRvdyBi
ZWluZyB1ZGF0ZWQgYmVjb21lcyB0aGUgQUZCQyB3aW5kb3cKPiArICAgICAgICAgICAgICAgICov
Cj4gKyAgICAgICAgICAgICAgIHZvcC0+YWZiY193aW4gPSB2b3Bfd2luOwo+ICsKPiArICAgICAg
ICAgICAgICAgcHJfaW5mbygiQUZCQyBvbiBwbGFuZSAlc1xuIiwgcGxhbmUtPm5hbWUpOwoKUGxl
YXNlIGRvIG5vdCB1c2UgcHJfaW5mbygpIGhlcmUuIFVzZXJzcGFjZSBzaG91bGQgbm90IGJlIGFi
bGUgdG8KdHJpZ2dlciBsb2dnaW5nLCBhcGFydCBmcm9tIERSTV9ERUJVRy4KCj4gK3N0YXRpYyBj
b25zdCB1aW50NjRfdCBmb3JtYXRfbW9kaWZpZXJzX3dpbl9mdWxsW10gPSB7Cj4gKyAgICAgICBE
Uk1fRk9STUFUX01PRF9OT05FLAoKKkRSTV9GT1JNQVRfTU9EX0xJTkVBUgoKQ2hlZXJzLApEYW5p
ZWwKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRl
dmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8v
bGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
