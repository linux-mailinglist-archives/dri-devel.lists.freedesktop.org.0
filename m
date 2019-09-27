Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B446CC07D1
	for <lists+dri-devel@lfdr.de>; Fri, 27 Sep 2019 16:44:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ABB686EEF9;
	Fri, 27 Sep 2019 14:44:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E93286EEF9
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Sep 2019 14:44:26 +0000 (UTC)
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 3727F8763B
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Sep 2019 14:44:26 +0000 (UTC)
Received: by mail-wr1-f70.google.com with SMTP id n18so1130851wro.11
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Sep 2019 07:44:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=tKJlXVu+C+SUSWhFcHR/cVLK3eVfpegwLk/6ZeTU4Lw=;
 b=tGFA1E1aAEQlmkGF1q5WEW+w9x5k/KbE010csd+oAHooOl+KLf6KCXgv1sU0Bj6b/b
 BEeeVn9y58ZH3xzbDWdIXK6wsQs/G49PyhFlSE6cRLi193Xh71fGkrKZppOhSORZG9iA
 LzwoBEUlfFbZQo4m+ORytAbm04z3vsF8TX8bQkaBgqAaM/H4jFPypIljx4S0O3aB6NpB
 1nJ3f9ILby3wIL9jks3SbS9TLR2CeVFx8DnKnIc057Bd+3Pw/o5TfkyI7uxuUsi0vv3I
 hCJVeRfv6KGQlvy3RWyXKMxAEFc5mKplXeDkKHQyoIEaRf1rozeeTi9w0NG3eCavlzt5
 bFAA==
X-Gm-Message-State: APjAAAUhHJTz4uvQlPWDYHmnvWhK24PXA3vxkKFV3TpAN4iTyV77Vh78
 OIQI3j06aRfDZWV25zzqf4aPSHptt+0fhNfNvdrjNUrBSHEiDKCbzlqERuUzGAgaftOUk3P1B6k
 /X+weup7RNAJ0zVk11XKpqf4dyHcW
X-Received: by 2002:a1c:1c7:: with SMTP id 190mr395784wmb.23.1569595464976;
 Fri, 27 Sep 2019 07:44:24 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxC2IYP1DXa/fMg1u9ig7ZhBeyIkZ56QIfJYKHZiecxua/UDg6iVgqlCp0MKwat0LoPX/Jjxg==
X-Received: by 2002:a1c:1c7:: with SMTP id 190mr395767wmb.23.1569595464744;
 Fri, 27 Sep 2019 07:44:24 -0700 (PDT)
Received: from kherbst.pingu.com ([2a02:8308:b0be:6900:6174:20eb:3f66:382f])
 by smtp.gmail.com with ESMTPSA id e18sm4580926wrv.63.2019.09.27.07.44.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Sep 2019 07:44:23 -0700 (PDT)
From: Karol Herbst <kherbst@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [RFC PATCH] pci: prevent putting pcie devices into lower device
 states on certain intel bridges
Date: Fri, 27 Sep 2019 16:44:21 +0200
Message-Id: <20190927144421.22608-1-kherbst@redhat.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
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
Cc: Karol Herbst <kherbst@redhat.com>, linux-pci@vger.kernel.org,
 dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 Bjorn Helgaas <bhelgaas@google.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Rml4ZXMgcnVucG0gYnJlYWthZ2UgbWFpbmx5IG9uIE52aWRpYSBHUFVzIGFzIHRoZXkgYXJlIG5v
dCBhYmxlIHRvIHJlc3VtZS4KCldvcmtzIHBlcmZlY3RseSB3aXRoIHRoaXMgd29ya2Fyb3VuZCBh
cHBsaWVkLgoKUkZDIGNvbW1lbnQ6CldlIGFyZSBxdWl0ZSBzdXJlIHRoYXQgdGhlcmUgaXMgYSBo
aWdoZXIgYW1vdW50IG9mIGJyaWRnZXMgYWZmZWN0ZWQgYnkgdGhpcywKYnV0IEkgd2FzIG9ubHkg
dGVzdGluZyBpdCBvbiBteSBvd24gbWFjaGluZSBmb3Igbm93LgoKSSd2ZSBzdHJlc3N0ZXN0ZWQg
cnVucG0gYnkgZG9pbmcgNTAwMCBydW5wbSBjeWNsZXMgd2l0aCB0aGF0IHBhdGNoIGFwcGxpZWQK
YW5kIG5ldmVyIHNhdyBpdCBmYWlsLgoKSSBtYWlubHkgd2FudGVkIHRvIGdldCBhIGRpc2N1c3Np
b24gZ29pbmcgb24gaWYgdGhhdCdzIGEgZmVhc2FibGUgd29ya2Fyb3VuZAppbmRlZWQgb3IgaWYg
d2UgbmVlZCBzb21ldGhpbmcgYmV0dGVyLgoKSSBhbSBhbHNvIHN1cmUsIHRoYXQgdGhlIG5vdXZl
YXUgZHJpdmVyIGl0c2VsZiBpc24ndCBhdCBmYXVsdCBhcyBJIGFtIGFibGUKdG8gcmVwcm9kdWNl
IHRoZSBzYW1lIGlzc3VlIGJ5IHBva2luZyBpbnRvIHNvbWUgUENJIHJlZ2lzdGVycyBvbiB0aGUg
UENJZQpicmlkZ2UgdG8gcHV0IHRoZSBHUFUgaW50byBEM2NvbGQgYXMgaXQncyBkb25lIGluIEFD
UEkgY29kZS4KCkkndmUgd3JpdHRlbiBhIGxpdHRsZSBweXRob24gc2NyaXB0IHRvIHJlcHJvZHVj
ZSB0aGlzIGlzc3VlIHdpdGhvdXQgdGhlIG5lZWQKb2YgbG9hZGluZyBub3V2ZWF1OgpodHRwczov
L3Jhdy5naXRodWJ1c2VyY29udGVudC5jb20va2Fyb2xoZXJic3QvcGNpLXN0dWItcnVucG0vbWFz
dGVyL252X3J1bnBtX2J1Z190ZXN0LnB5CgpTaWduZWQtb2ZmLWJ5OiBLYXJvbCBIZXJic3QgPGto
ZXJic3RAcmVkaGF0LmNvbT4KQ2M6IEJqb3JuIEhlbGdhYXMgPGJoZWxnYWFzQGdvb2dsZS5jb20+
CkNjOiBMeXVkZSBQYXVsIDxseXVkZUByZWRoYXQuY29tPgpDYzogbGludXgtcGNpQHZnZXIua2Vy
bmVsLm9yZwpDYzogZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpDYzogbm91dmVhdUBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKLS0tCiBkcml2ZXJzL3BjaS9wY2kuYyB8IDM5ICsrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKwogMSBmaWxlIGNoYW5nZWQsIDM5IGluc2Vy
dGlvbnMoKykKCmRpZmYgLS1naXQgYS9kcml2ZXJzL3BjaS9wY2kuYyBiL2RyaXZlcnMvcGNpL3Bj
aS5jCmluZGV4IDA4OGZjZGM4ZDJiNC4uOWRiZDI5Y2VkMWFjIDEwMDY0NAotLS0gYS9kcml2ZXJz
L3BjaS9wY2kuYworKysgYi9kcml2ZXJzL3BjaS9wY2kuYwpAQCAtNzk5LDYgKzc5OSw0MiBAQCBz
dGF0aWMgaW5saW5lIGJvb2wgcGxhdGZvcm1fcGNpX2JyaWRnZV9kMyhzdHJ1Y3QgcGNpX2RldiAq
ZGV2KQogCXJldHVybiBwY2lfcGxhdGZvcm1fcG0gPyBwY2lfcGxhdGZvcm1fcG0tPmJyaWRnZV9k
MyhkZXYpIDogZmFsc2U7CiB9CiAKKy8qCisgKiBzb21lIGludGVsIGJyaWRnZXMgY2F1c2Ugc2Vy
aW91cyBpc3N1ZXMgd2l0aCBydW5wbSBpZiB0aGUgY2xpZW50IGRldmljZQorICogaXMgcHV0IGlu
dG8gRDEvRDIvRDNob3QgYmVmb3JlIHB1dHRpbmcgdGhlIGNsaWVudCBpbnRvIEQzY29sZCB2aWEK
KyAqIHBsYXRmb3JtIG1lYW5zIChnZW5lcmFsbHkgQUNQSSkuCisgKgorICogc2tpcHBpbmcgdGhp
cyBtYWtlcyBydW5wbSB3b3JrIHBlcmZlY3RseSBmaW5lIG9uIHN1Y2ggZGV2aWNlcy4KKyAqCisg
KiBBcyBmYXIgYXMgd2Uga25vdyBvbmx5IHNreWxha2UgYW5kIGthYnkgbGFrZSBTb0NzIGFyZSBh
ZmZlY3RlZC4KKyAqLworc3RhdGljIHVuc2lnbmVkIHNob3J0IGludGVsX2Jyb2tlbl9kM19icmlk
Z2VzW10gPSB7CisJLyoga2JsICovCisJMHgxOTAxLAorfTsKKworc3RhdGljIGlubGluZSBib29s
IGludGVsX2Jyb2tlbl9wY2lfcG0oc3RydWN0IHBjaV9idXMgKmJ1cykKK3sKKwlzdHJ1Y3QgcGNp
X2RldiAqYnJpZGdlOworCWludCBpOworCisJaWYgKCFidXMgfHwgIWJ1cy0+c2VsZikKKwkJcmV0
dXJuIGZhbHNlOworCisJYnJpZGdlID0gYnVzLT5zZWxmOworCWlmIChicmlkZ2UtPnZlbmRvciAh
PSBQQ0lfVkVORE9SX0lEX0lOVEVMKQorCQlyZXR1cm4gZmFsc2U7CisKKwlmb3IgKGkgPSAwOyBp
IDwgQVJSQVlfU0laRShpbnRlbF9icm9rZW5fZDNfYnJpZGdlcyk7IGkrKykgeworCQlpZiAoYnJp
ZGdlLT5kZXZpY2UgPT0gaW50ZWxfYnJva2VuX2QzX2JyaWRnZXNbaV0pIHsKKwkJCXBjaV9lcnIo
YnJpZGdlLCAiZm91bmQgYnJva2VuIGludGVsIGJyaWRnZVxuIik7CisJCQlyZXR1cm4gdHJ1ZTsK
KwkJfQorCX0KKworCXJldHVybiBmYWxzZTsKK30KKwogLyoqCiAgKiBwY2lfcmF3X3NldF9wb3dl
cl9zdGF0ZSAtIFVzZSBQQ0kgUE0gcmVnaXN0ZXJzIHRvIHNldCB0aGUgcG93ZXIgc3RhdGUgb2YK
ICAqCQkJICAgICBnaXZlbiBQQ0kgZGV2aWNlCkBAIC04MjcsNiArODYzLDkgQEAgc3RhdGljIGlu
dCBwY2lfcmF3X3NldF9wb3dlcl9zdGF0ZShzdHJ1Y3QgcGNpX2RldiAqZGV2LCBwY2lfcG93ZXJf
dCBzdGF0ZSkKIAlpZiAoc3RhdGUgPCBQQ0lfRDAgfHwgc3RhdGUgPiBQQ0lfRDNob3QpCiAJCXJl
dHVybiAtRUlOVkFMOwogCisJaWYgKHN0YXRlICE9IFBDSV9EMCAmJiBpbnRlbF9icm9rZW5fcGNp
X3BtKGRldi0+YnVzKSkKKwkJcmV0dXJuIDA7CisKIAkvKgogCSAqIFZhbGlkYXRlIGN1cnJlbnQg
c3RhdGU6CiAJICogQ2FuIGVudGVyIEQwIGZyb20gYW55IHN0YXRlLCBidXQgaWYgd2UgY2FuIG9u
bHkgZ28gZGVlcGVyCi0tIAoyLjIxLjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2RyaS1kZXZlbA==
