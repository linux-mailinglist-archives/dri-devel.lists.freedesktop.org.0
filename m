Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 130822C262
	for <lists+dri-devel@lfdr.de>; Tue, 28 May 2019 11:04:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 562FE6E1D6;
	Tue, 28 May 2019 09:03:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x544.google.com (mail-ed1-x544.google.com
 [IPv6:2a00:1450:4864:20::544])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7302E89FEC
 for <dri-devel@lists.freedesktop.org>; Tue, 28 May 2019 09:03:50 +0000 (UTC)
Received: by mail-ed1-x544.google.com with SMTP id w37so30610811edw.4
 for <dri-devel@lists.freedesktop.org>; Tue, 28 May 2019 02:03:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=xdSAzTv9tDPr6PTxvMhXZVM/Er2L9zs7q0S7NNjW/ok=;
 b=GD2ze6gmcZTddeCGNPt8zc6+SJbAZ9aMHH4UTWo/Xm68M4jp1Eiu4/n7AXFKt1n36W
 kerxk3+2dcCUXBfwQgCQmpXzVs35/XKmocnsAXyP1mZOBEQz6wb3G8ApFTfv7Q0iC7Jc
 N2MaLgt5WVBsToRE91YdFjJMDHF0Jm6jgSwHVQjGiS+jC0nihce78JSS59MMfHgxrvPA
 cWobO4IkJGlaELZ1S/CO9kLIA7uUVpbeVlv8K+fnDIbYhjQ6bD7dGWlpBeC9fW4ls7Ht
 ReESE097AFEXaKHNcmkFq9q+Ikc+hS2qQ0NET+lmyuoPirS/cO+AEuKzzI5AG+FFUDI8
 8MPQ==
X-Gm-Message-State: APjAAAUXFSpop7vCCuo/J2nwWB30h5R6M9Sdv5/i+eLVcTbu5f7IbMUb
 2C0KmdeoPqhbYxvEWNbmQESw4A==
X-Google-Smtp-Source: APXvYqz7N+WGbx3CGIzAcTP4j/O/T91KOj5m1m+2vfXlGhtH0z7XZhnZ1uDp1ATj69H/KzvnZS3Kaw==
X-Received: by 2002:a50:f4fb:: with SMTP id v56mr128756589edm.13.1559034228987; 
 Tue, 28 May 2019 02:03:48 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:569e:0:3106:d637:d723:e855])
 by smtp.gmail.com with ESMTPSA id x49sm4072656edm.25.2019.05.28.02.03.47
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 28 May 2019 02:03:48 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: LKML <linux-kernel@vger.kernel.org>
Subject: [PATCH 26/33] fbdev: remove FBINFO_MISC_USEREVENT around fb_blank
Date: Tue, 28 May 2019 11:02:57 +0200
Message-Id: <20190528090304.9388-27-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190528090304.9388-1-daniel.vetter@ffwll.ch>
References: <20190528090304.9388-1-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=xdSAzTv9tDPr6PTxvMhXZVM/Er2L9zs7q0S7NNjW/ok=;
 b=XG2Xk6QdQnFvZNtT1FJSbJRUie40rMANdM0srLaNSg5DjS2kagtuP2RFgL4VendVOT
 BabNgErILkSIbHiZbTBTMTYqlOuoHuDBbXOVrWrUlgwpokq6/Wf0htlfVQ/vZhH8sFl9
 dkgrYC8vItg/cnP9Ums7sqMpu0F3/0mku30MA=
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
Cc: Daniel Thompson <daniel.thompson@linaro.org>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 linux-fbdev@vger.kernel.org, DRI Development <dri-devel@lists.freedesktop.org>,
 =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>,
 Yisheng Xie <ysxie@foxmail.com>, Hans de Goede <hdegoede@redhat.com>,
 Mikulas Patocka <mpatocka@redhat.com>, Daniel Vetter <daniel.vetter@intel.com>,
 Sam Ravnborg <sam@ravnborg.org>, Peter Rosin <peda@axentia.se>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

V2l0aCB0aGUgcmVjdXJzaW9uIGJyb2tlbiBpbiB0aGUgcHJldmlvdXMgcGF0Y2ggd2UgY2FuIGRy
b3AgdGhlCkZCSU5GT19NSVNDX1VTRVJFVkVOVCBmbGFnIGFyb3VuZCBjYWxscyB0byBmYl9ibGFu
ayAtIHJlY3Vyc2lvbgpwcmV2ZW50aW9uIHdhcyBpdCdzIG9ubHkgam9iLgoKU2lnbmVkLW9mZi1i
eTogRGFuaWVsIFZldHRlciA8ZGFuaWVsLnZldHRlckBpbnRlbC5jb20+ClJldmlld2VkLWJ5OiBT
YW0gUmF2bmJvcmcgPHNhbUByYXZuYm9yZy5vcmc+ClJldmlld2VkLWJ5OiBNYWFydGVuIExhbmto
b3JzdCA8bWFhcnRlbi5sYW5raG9yc3RAbGludXguaW50ZWwuY29tPgpDYzogRGFuaWVsIFZldHRl
ciA8ZGFuaWVsLnZldHRlckBmZndsbC5jaD4KQ2M6IEJhcnRsb21pZWogWm9sbmllcmtpZXdpY3og
PGIuem9sbmllcmtpZUBzYW1zdW5nLmNvbT4KQ2M6IEhhbnMgZGUgR29lZGUgPGhkZWdvZWRlQHJl
ZGhhdC5jb20+CkNjOiBZaXNoZW5nIFhpZSA8eXN4aWVAZm94bWFpbC5jb20+CkNjOiAiTWljaGHF
giBNaXJvc8WCYXciIDxtaXJxLWxpbnV4QHJlcmUucW1xbS5wbD4KQ2M6IFBldGVyIFJvc2luIDxw
ZWRhQGF4ZW50aWEuc2U+CkNjOiBNaWt1bGFzIFBhdG9ja2EgPG1wYXRvY2thQHJlZGhhdC5jb20+
CkNjOiBSb2IgQ2xhcmsgPHJvYmRjbGFya0BnbWFpbC5jb20+Ci0tLQogZHJpdmVycy92aWRlby9m
YmRldi9jb3JlL2ZiY29uLmMgICB8IDUgKystLS0KIGRyaXZlcnMvdmlkZW8vZmJkZXYvY29yZS9m
Ym1lbS5jICAgfCAzIC0tLQogZHJpdmVycy92aWRlby9mYmRldi9jb3JlL2Zic3lzZnMuYyB8IDIg
LS0KIDMgZmlsZXMgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCA4IGRlbGV0aW9ucygtKQoKZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvdmlkZW8vZmJkZXYvY29yZS9mYmNvbi5jIGIvZHJpdmVycy92aWRl
by9mYmRldi9jb3JlL2ZiY29uLmMKaW5kZXggYTQ2MTcwNjdmZjI0Li5iNWVlODlmMTZkNmMgMTAw
NjQ0Ci0tLSBhL2RyaXZlcnMvdmlkZW8vZmJkZXYvY29yZS9mYmNvbi5jCisrKyBiL2RyaXZlcnMv
dmlkZW8vZmJkZXYvY29yZS9mYmNvbi5jCkBAIC0yMzg2LDkgKzIzODYsOCBAQCBzdGF0aWMgaW50
IGZiY29uX2JsYW5rKHN0cnVjdCB2Y19kYXRhICp2YywgaW50IGJsYW5rLCBpbnQgbW9kZV9zd2l0
Y2gpCiAJCQlmYmNvbl9jdXJzb3IodmMsIGJsYW5rID8gQ01fRVJBU0UgOiBDTV9EUkFXKTsKIAkJ
CW9wcy0+Y3Vyc29yX2ZsYXNoID0gKCFibGFuayk7CiAKLQkJCWlmICghKGluZm8tPmZsYWdzICYg
RkJJTkZPX01JU0NfVVNFUkVWRU5UKSkKLQkJCQlpZiAoZmJfYmxhbmsoaW5mbywgYmxhbmspKQot
CQkJCQlmYmNvbl9nZW5lcmljX2JsYW5rKHZjLCBpbmZvLCBibGFuayk7CisJCQlpZiAoZmJfYmxh
bmsoaW5mbywgYmxhbmspKQorCQkJCWZiY29uX2dlbmVyaWNfYmxhbmsodmMsIGluZm8sIGJsYW5r
KTsKIAkJfQogCiAJCWlmICghYmxhbmspCmRpZmYgLS1naXQgYS9kcml2ZXJzL3ZpZGVvL2ZiZGV2
L2NvcmUvZmJtZW0uYyBiL2RyaXZlcnMvdmlkZW8vZmJkZXYvY29yZS9mYm1lbS5jCmluZGV4IGQ2
NzEzZGNlOWUzMS4uMjVhZTQ2NmJhNTkzIDEwMDY0NAotLS0gYS9kcml2ZXJzL3ZpZGVvL2ZiZGV2
L2NvcmUvZmJtZW0uYworKysgYi9kcml2ZXJzL3ZpZGVvL2ZiZGV2L2NvcmUvZmJtZW0uYwpAQCAt
MTE5NCwxMCArMTE5NCw3IEBAIHN0YXRpYyBsb25nIGRvX2ZiX2lvY3RsKHN0cnVjdCBmYl9pbmZv
ICppbmZvLCB1bnNpZ25lZCBpbnQgY21kLAogCWNhc2UgRkJJT0JMQU5LOgogCQljb25zb2xlX2xv
Y2soKTsKIAkJbG9ja19mYl9pbmZvKGluZm8pOwotCQlpbmZvLT5mbGFncyB8PSBGQklORk9fTUlT
Q19VU0VSRVZFTlQ7CiAJCXJldCA9IGZiX2JsYW5rKGluZm8sIGFyZyk7Ci0JCWluZm8tPmZsYWdz
ICY9IH5GQklORk9fTUlTQ19VU0VSRVZFTlQ7Ci0KIAkJLyogbWlnaHQgYWdhaW4gY2FsbCBpbnRv
IGZiX2JsYW5rICovCiAJCWZiY29uX2ZiX2JsYW5rZWQoaW5mbywgYXJnKTsKIAkJdW5sb2NrX2Zi
X2luZm8oaW5mbyk7CmRpZmYgLS1naXQgYS9kcml2ZXJzL3ZpZGVvL2ZiZGV2L2NvcmUvZmJzeXNm
cy5jIGIvZHJpdmVycy92aWRlby9mYmRldi9jb3JlL2Zic3lzZnMuYwppbmRleCAyNTJkNGY1MmQy
YTUuLjg4MmI0NzFkNjE5ZSAxMDA2NDQKLS0tIGEvZHJpdmVycy92aWRlby9mYmRldi9jb3JlL2Zi
c3lzZnMuYworKysgYi9kcml2ZXJzL3ZpZGVvL2ZiZGV2L2NvcmUvZmJzeXNmcy5jCkBAIC0zMTAs
OSArMzEwLDcgQEAgc3RhdGljIHNzaXplX3Qgc3RvcmVfYmxhbmsoc3RydWN0IGRldmljZSAqZGV2
aWNlLAogCiAJYXJnID0gc2ltcGxlX3N0cnRvdWwoYnVmLCAmbGFzdCwgMCk7CiAJY29uc29sZV9s
b2NrKCk7Ci0JZmJfaW5mby0+ZmxhZ3MgfD0gRkJJTkZPX01JU0NfVVNFUkVWRU5UOwogCWVyciA9
IGZiX2JsYW5rKGZiX2luZm8sIGFyZyk7Ci0JZmJfaW5mby0+ZmxhZ3MgJj0gfkZCSU5GT19NSVND
X1VTRVJFVkVOVDsKIAkvKiBtaWdodCBhZ2FpbiBjYWxsIGludG8gZmJfYmxhbmsgKi8KIAlmYmNv
bl9mYl9ibGFua2VkKGZiX2luZm8sIGFyZyk7CiAJY29uc29sZV91bmxvY2soKTsKLS0gCjIuMjAu
MQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRl
dmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8v
bGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
