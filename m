Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0769E101AD5
	for <lists+dri-devel@lfdr.de>; Tue, 19 Nov 2019 09:04:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D61236EB96;
	Tue, 19 Nov 2019 08:04:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x142.google.com (mail-il1-x142.google.com
 [IPv6:2607:f8b0:4864:20::142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EFCA989CB5
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Nov 2019 09:34:42 +0000 (UTC)
Received: by mail-il1-x142.google.com with SMTP id q15so15366835ils.8
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Nov 2019 01:34:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=lr/4E5ZW9jz9oShySXGCc5V6Txdcr0g9QJ5gIXifIGk=;
 b=mkxb/NuzijK1AhTQwAC2t9QhjACBp8jYH1Md6IEEui151UsdIten7K/j0Xuc1LWf2m
 e1qh83dGZ7GWI98ybN0AmahJLsHdcMtQgZYtWq61/RAw+sIZTUA7k9eRMBGiL8F8zfPI
 eM33+VgzbXW4nPqBAamV0XU70u5eOAX1T026ohr+FSzDJ5ewidnfYi8P4/mo2WjPNB/U
 dtCUiC19obE+4Z9Xxkf+g0a9oxkPGRxLJGAW6PVeqsbfUmpaLpfZypRInOmwfNzEJSIi
 RLooeWMwstdbL9/X/myZGK4g/qmZKJV6a1/GC0mn1P/NFdwZtwi25hplvFolzAgz0Sil
 E7/Q==
X-Gm-Message-State: APjAAAUV3/1FKxuqR4q0arsGAMbHK5abTyjYXRKHndbcIIihS5igaHJT
 sX9TtHKlIvIwPQUetU+gnGQtssnHn4oVvH9sdg10MA==
X-Google-Smtp-Source: APXvYqxLrh5aVv3p0xE1Cuv2M9Lu4EqPeULGldZRnOqi6Hjy+4RMLF1tR9vxtOQ6RJa0zB6OkWOb0ZxRDT43EqGIS1Q=
X-Received: by 2002:a92:d608:: with SMTP id w8mr14471824ilm.308.1574069682145; 
 Mon, 18 Nov 2019 01:34:42 -0800 (PST)
MIME-Version: 1.0
References: <20190830074103.16671-1-bibby.hsieh@mediatek.com>
 <20190830074103.16671-3-bibby.hsieh@mediatek.com>
In-Reply-To: <20190830074103.16671-3-bibby.hsieh@mediatek.com>
From: Hsin-Yi Wang <hsinyi@chromium.org>
Date: Mon, 18 Nov 2019 17:34:16 +0800
Message-ID: <CAJMQK-ir=8ukNZw8XN=prLuh3znjbjNszVB=dcDxa_bVnFwVAQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] drm/mediatek: Apply CMDQ control flow
To: Bibby Hsieh <bibby.hsieh@mediatek.com>
X-Mailman-Approved-At: Tue, 19 Nov 2019 08:04:07 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=lr/4E5ZW9jz9oShySXGCc5V6Txdcr0g9QJ5gIXifIGk=;
 b=W6V9SCS3NzD7+ytXHksdvuTMYaJofAh3nWAX40damlaaJWjWjZHtQ+k6ikYy6z6QM1
 VHwrlguvhMqY7NmZM9gTooG0Z9XHILEXYgbysYUT6DYzcl/XH1wIjioMeK/75YCyLtb/
 aUi3Yq3X/P9iXf6Kg85iW+swL8ttWmJ0SlonE=
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
Cc: Nicolas Boichat <drinkcat@chromium.org>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, lkml <linux-kernel@vger.kernel.org>,
 dri-devel@lists.freedesktop.org, tfiga@chromium.org,
 Thierry Reding <thierry.reding@gmail.com>, linux-mediatek@lists.infradead.org,
 Yongqiang Niu <yongqiang.niu@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBBdWcgMzAsIDIwMTkgYXQgNzo0MSBBTSBCaWJieSBIc2llaCA8YmliYnkuaHNpZWhA
bWVkaWF0ZWsuY29tPiB3cm90ZToKCj4gQEAgLTQwNSwyNiArNDU4LDY5IEBAIHZvaWQgbXRrX2Ry
bV9jcnRjX2N1cnNvcl91cGRhdGUoc3RydWN0IGRybV9jcnRjICpjcnRjLCBzdHJ1Y3QgZHJtX3Bs
YW5lICpwbGFuZSwKPiAgICAgICAgICAgICAgICAgcmV0dXJuOwo+Cj4gICAgICAgICBtdXRleF9s
b2NrKCZwcml2LT5od19sb2NrKTsKPiAtICAgICAgIHBsYW5lX2hlbHBlcl9mdW5jcy0+YXRvbWlj
X3VwZGF0ZShwbGFuZSwgcGxhbmVfc3RhdGUpOwo+IC0gICAgICAgZm9yIChpID0gMDsgaSA8IG10
a19jcnRjLT5sYXllcl9ucjsgaSsrKSB7Cj4gLSAgICAgICAgICAgICAgIHN0cnVjdCBkcm1fcGxh
bmUgKnBsYW5lID0gJm10a19jcnRjLT5wbGFuZXNbaV07Cj4gLSAgICAgICAgICAgICAgIHN0cnVj
dCBtdGtfcGxhbmVfc3RhdGUgKnBsYW5lX3N0YXRlOwo+ICsgICAgICAgaWYgKElTX0VOQUJMRUQo
Q09ORklHX01US19DTURRKSAmJiBtdGtfY3J0Yy0+Y21kcV9jbGllbnQpIHsKPiArICAgICAgICAg
ICAgICAgc3RydWN0IG10a19jcnRjX3N0YXRlICptdGtfY3J0Y19zdGF0ZSA9Cj4gKyAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICB0b19tdGtfY3J0Y19zdGF0ZShjcnRjLT5zdGF0ZSk7Cj4g
KyAgICAgICAgICAgICAgIHN0cnVjdCBtdGtfY21kcV9jYl9kYXRhICpjYl9kYXRhOwo+ICsKPiAr
ICAgICAgICAgICAgICAgbXRrX2NydGNfc3RhdGUtPmNtZHFfaGFuZGxlID0KPiArICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIGNtZHFfcGt0X2NyZWF0ZShtdGtfY3J0Yy0+Y21kcV9jbGll
bnQsCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgUEFH
RV9TSVpFKTsKPiArICAgICAgICAgICAgICAgY21kcV9wa3RfY2xlYXJfZXZlbnQobXRrX2NydGNf
c3RhdGUtPmNtZHFfaGFuZGxlLAo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICBtdGtfY3J0Yy0+Y21kcV9ldmVudCk7Cj4gKyAgICAgICAgICAgICAgIGNtZHFfcGt0X3dmZSht
dGtfY3J0Y19zdGF0ZS0+Y21kcV9oYW5kbGUsIG10a19jcnRjLT5jbWRxX2V2ZW50KTsKPiArICAg
ICAgICAgICAgICAgcGxhbmVfaGVscGVyX2Z1bmNzLT5hdG9taWNfdXBkYXRlKHBsYW5lLCBwbGFu
ZV9zdGF0ZSk7Cj4gKyAgICAgICAgICAgICAgIGNiX2RhdGEgPSBrbWFsbG9jKHNpemVvZigqY2Jf
ZGF0YSksIEdGUF9LRVJORUwpOwpDaGVjayBrbWFsbG9jIGZhaWx1cmU/Cj4gKyAgICAgICAgICAg
ICAgIGNiX2RhdGEtPmNtZHFfaGFuZGxlID0gbXRrX2NydGNfc3RhdGUtPmNtZHFfaGFuZGxlOwo+
ICsgICAgICAgICAgICAgICBjbWRxX3BrdF9mbHVzaF9hc3luYyhtdGtfY3J0Y19zdGF0ZS0+Y21k
cV9oYW5kbGUsCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGRkcF9jbWRx
X2N1cnNvcl9jYiwgY2JfZGF0YSk7Cgo+IEBAIC00OTQsMTMgKzU5OSwyOSBAQCBzdGF0aWMgdm9p
ZCBtdGtfZHJtX2NydGNfYXRvbWljX2ZsdXNoKHN0cnVjdCBkcm1fY3J0YyAqY3J0YywKPiAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHN0cnVjdCBkcm1fY3J0Y19zdGF0ZSAq
b2xkX2NydGNfc3RhdGUpCj4gIHsKPiAgICAgICAgIHN0cnVjdCBkcm1fYXRvbWljX3N0YXRlICpv
bGRfYXRvbWljX3N0YXRlID0gb2xkX2NydGNfc3RhdGUtPnN0YXRlOwo+ICsgICAgICAgc3RydWN0
IGRybV9jcnRjX3N0YXRlICpjcnRjX3N0YXRlID0gY3J0Yy0+c3RhdGU7Cj4gKyAgICAgICBzdHJ1
Y3QgbXRrX2NydGNfc3RhdGUgKnN0YXRlID0gdG9fbXRrX2NydGNfc3RhdGUoY3J0Y19zdGF0ZSk7
Cj4gKyAgICAgICBzdHJ1Y3QgY21kcV9wa3QgKmNtZHFfaGFuZGxlID0gc3RhdGUtPmNtZHFfaGFu
ZGxlOwo+ICAgICAgICAgc3RydWN0IG10a19kcm1fY3J0YyAqbXRrX2NydGMgPSB0b19tdGtfY3J0
YyhjcnRjKTsKPiAgICAgICAgIHN0cnVjdCBtdGtfZHJtX3ByaXZhdGUgKnByaXYgPSBjcnRjLT5k
ZXYtPmRldl9wcml2YXRlOwo+ICsgICAgICAgc3RydWN0IG10a19jbWRxX2NiX2RhdGEgKmNiX2Rh
dGE7Cj4gICAgICAgICB1bnNpZ25lZCBpbnQgcGVuZGluZ19wbGFuZXMgPSAwOwo+ICAgICAgICAg
aW50IGk7Cj4KPiAtICAgICAgIGlmIChtdGtfY3J0Yy0+ZXZlbnQpCj4gLSAgICAgICAgICAgICAg
IG10a19jcnRjLT5wZW5kaW5nX25lZWRzX3ZibGFuayA9IHRydWU7Cj4gKyAgICAgICBEUk1fREVC
VUdfRFJJVkVSKCJbQ1JUQzoldV0gW1NUQVRFOiVwKCVwKS0+JXAoJXApXVxuIiwgY3J0Yy0+YmFz
ZS5pZCwKPiArICAgICAgICAgICAgICAgICAgICAgICAgb2xkX2NydGNfc3RhdGUsIG9sZF9jcnRj
X3N0YXRlLT5zdGF0ZSwKPiArICAgICAgICAgICAgICAgICAgICAgICAgY3J0Y19zdGF0ZSwgY3J0
Y19zdGF0ZS0+c3RhdGUpOwo+ICsKPiArICAgICAgIGlmIChJU19FTkFCTEVEKENPTkZJR19NVEtf
Q01EUSkgJiYgbXRrX2NydGMtPmNtZHFfY2xpZW50KSB7Cj4gKyAgICAgICAgICAgICAgIGRybV9h
dG9taWNfc3RhdGVfZ2V0KG9sZF9hdG9taWNfc3RhdGUpOwo+ICsgICAgICAgICAgICAgICBjYl9k
YXRhID0ga21hbGxvYyhzaXplb2YoKmNiX2RhdGEpLCBHRlBfS0VSTkVMKTsKQ2hlY2sga21hbGxv
YyBmYWlsdXJlPwo+ICsgICAgICAgICAgICAgICBjYl9kYXRhLT5zdGF0ZSA9IG9sZF9jcnRjX3N0
YXRlOwo+ICsgICAgICAgICAgICAgICBjYl9kYXRhLT5jbWRxX2hhbmRsZSA9IGNtZHFfaGFuZGxl
OwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2
ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
