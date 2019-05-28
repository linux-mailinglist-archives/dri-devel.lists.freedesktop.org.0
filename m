Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BE2332C245
	for <lists+dri-devel@lfdr.de>; Tue, 28 May 2019 11:04:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A6D1389FCE;
	Tue, 28 May 2019 09:03:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x541.google.com (mail-ed1-x541.google.com
 [IPv6:2a00:1450:4864:20::541])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D38C89F55
 for <dri-devel@lists.freedesktop.org>; Tue, 28 May 2019 09:03:43 +0000 (UTC)
Received: by mail-ed1-x541.google.com with SMTP id s19so2499796edq.7
 for <dri-devel@lists.freedesktop.org>; Tue, 28 May 2019 02:03:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=l8PYij8neDId3ryticKg/a8o/KS0Lg5p8XO7y5/XF6o=;
 b=RwVRakKrYpv4xC0sXhuWkLN0+OuthVb9Ulw0ZHHw5AuY/+kr2R+vquzjXqfAxRnLjM
 X30FC9wcGCSBN5ouXl7U9dOQSIzF8p3WuGYd7VNRwfvgjIYZpCHVwvyoaABONxEZjITg
 Ld5Rlidi0aG4Izj9w24Ybgo//WreIJxSqycPMhRwBfAU6PZjGQCWKCnzzYIcnuPHl7yh
 uSw8uI5stclQK+bhDTDOHI7bDhinQ0NhZCE+WyhNqjzJ2K85YQnrWg0ANAV2kkWXJ9uw
 q4Kmd7Zxqv0EAL8/NmhTZSSkCN02crQ8T5CJ1PCg8eSWMy/liRes+XqycxvoKCdTXh/8
 eNRA==
X-Gm-Message-State: APjAAAUhv2Wgqp8f6+mWq+JvZu+gBDg8bo55i49wgVHJpKvFuc5+kLD2
 N+s7ZeCIphlLY3CWgR9z/f6nJw==
X-Google-Smtp-Source: APXvYqzumxJgc9HSaOSwBQskNq870ESW7zvYMn/AJyD4+7IHP8Wkq4KJBKohlJDANMT2w6DOnmCTrQ==
X-Received: by 2002:a50:8a46:: with SMTP id
 i64mr126933097edi.177.1559034220244; 
 Tue, 28 May 2019 02:03:40 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:569e:0:3106:d637:d723:e855])
 by smtp.gmail.com with ESMTPSA id x49sm4072656edm.25.2019.05.28.02.03.38
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 28 May 2019 02:03:39 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: LKML <linux-kernel@vger.kernel.org>
Subject: [PATCH 20/33] fbdev/sh_mob: Remove fb notifier callback
Date: Tue, 28 May 2019 11:02:51 +0200
Message-Id: <20190528090304.9388-21-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190528090304.9388-1-daniel.vetter@ffwll.ch>
References: <20190528090304.9388-1-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=l8PYij8neDId3ryticKg/a8o/KS0Lg5p8XO7y5/XF6o=;
 b=jHDbHakQeNwnznvXASvVWl7yvcYBqpw2pEJjIlODz4RNjgcrPAWF5fDWm+8CRW99mj
 +7xQ5CZDwyO//HITpeFemyBkOaJ0JKfiLJv+ZlmHcyvjUsvZpGih+aUcSqpRGHs/pn05
 cki+OyKVOY+239GGqpg6Av8ilLiYl6+XuyA2U=
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
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 linux-fbdev@vger.kernel.org, DRI Development <dri-devel@lists.freedesktop.org>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Daniel Vetter <daniel.vetter@intel.com>, Sam Ravnborg <sam@ravnborg.org>,
 Markus Elfring <elfring@users.sourceforge.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhpcyBzZWVtcyB0byBiZSBlbnRpcmVseSBkZWZ1bmN0OgoKLSBUaGUgRkJfRVZFTl9TVVNQRU5E
L1JFU1VNRSBldmVudHMgYXJlIG9ubHkgc2VudCBvdXQgYnkKICBmYl9zZXRfc3VzcGVuZC4gV2hp
Y2ggaXMgc3VwcG9zZWQgdG8gYmUgY2FsbGVkIGJ5IGRyaXZlcnMgaW4gdGhlaXIKICBzdXNwZW5k
L3Jlc3VtZSBob29rcywgYW5kIG5vdCBpdHNlbGYgY2FsbCBpbnRvIGRyaXZlcnMuIEx1Y2tpbHkK
ICBzaF9tb2IgZG9lc24ndCBjYWxsIGZiX3NldF9zdXNwZW5kLCBzbyB0aGlzIHNlZW1zIHRvIGRv
IG5vdGhpbmcKICB1c2VmdWwuCgotIFRoZSBub3RpZnkgaG9vayBjYWxscyBzaF9tb2JpbGVfZmJf
cmVjb25maWcoKSB3aGljaCBpbiB0dXJuIGNhbgogIGNhbGwgaW50byB0aGUgZmIgbm90aWZpZXIu
IE9yIGF0dGVtcHQgdG9vLCBzaW5jZSB0aGF0IHdvdWxkCiAgZGVhZGxvY2suCgpTbyBsb29rcyBs
aWtlIGxlZnRvdmVyIGhhY2tzIGZyb20gd2hlbiB0aGlzIHdhcyBvcmlnaW5hbGx5IGludHJvZHVj
ZWQKaW4KCmNvbW1pdCA2MDExYmRlYWE2MDg5ZDQ5YzAyZGU2OWYwNTk4MGRhN2JhZDMxNGFiCkF1
dGhvcjogR3Vlbm5hZGkgTGlha2hvdmV0c2tpIDxnLmxpYWtob3ZldHNraUBnbXguZGU+CkRhdGU6
ICAgV2VkIEp1bCAyMSAxMDoxMzoyMSAyMDEwICswMDAwCgogICAgZmJkZXY6IHNoLW1vYmlsZTog
SERNSSBzdXBwb3J0IGZvciBTSC1Nb2JpbGUgU29DcwoKU28gbGV0J3MganVzdCByZW1vdmUgaXQu
CgpTaWduZWQtb2ZmLWJ5OiBEYW5pZWwgVmV0dGVyIDxkYW5pZWwudmV0dGVyQGludGVsLmNvbT4K
UmV2aWV3ZWQtYnk6IEdlZXJ0IFV5dHRlcmhvZXZlbiA8Z2VlcnQrcmVuZXNhc0BnbGlkZXIuYmU+
ClRlc3RlZC1ieTogR2VlcnQgVXl0dGVyaG9ldmVuIDxnZWVydCtyZW5lc2FzQGdsaWRlci5iZT4K
UmV2aWV3ZWQtYnk6IFNhbSBSYXZuYm9yZyA8c2FtQHJhdm5ib3JnLm9yZz4KUmV2aWV3ZWQtYnk6
IE1hYXJ0ZW4gTGFua2hvcnN0IDxtYWFydGVuLmxhbmtob3JzdEBsaW51eC5pbnRlbC5jb20+CkNj
OiBEYW5pZWwgVmV0dGVyIDxkYW5pZWwudmV0dGVyQGZmd2xsLmNoPgpDYzogQmFydGxvbWllaiBa
b2xuaWVya2lld2ljeiA8Yi56b2xuaWVya2llQHNhbXN1bmcuY29tPgpDYzogTWFya3VzIEVsZnJp
bmcgPGVsZnJpbmdAdXNlcnMuc291cmNlZm9yZ2UubmV0PgpDYzogR2VlcnQgVXl0dGVyaG9ldmVu
IDxnZWVydCtyZW5lc2FzQGdsaWRlci5iZT4KQ2M6IFdvbGZyYW0gU2FuZyA8d3NhK3JlbmVzYXNA
c2FuZy1lbmdpbmVlcmluZy5jb20+Ci0tLQogZHJpdmVycy92aWRlby9mYmRldi9zaF9tb2JpbGVf
bGNkY2ZiLmMgfCAzOCAtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQogMSBmaWxlIGNoYW5nZWQs
IDM4IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvdmlkZW8vZmJkZXYvc2hfbW9i
aWxlX2xjZGNmYi5jIGIvZHJpdmVycy92aWRlby9mYmRldi9zaF9tb2JpbGVfbGNkY2ZiLmMKaW5k
ZXggMTQzNzY5NTQxNWM5Li4wMTVhMDJhMjlkMzcgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvdmlkZW8v
ZmJkZXYvc2hfbW9iaWxlX2xjZGNmYi5jCisrKyBiL2RyaXZlcnMvdmlkZW8vZmJkZXYvc2hfbW9i
aWxlX2xjZGNmYi5jCkBAIC0yMTMsNyArMjEzLDYgQEAgc3RydWN0IHNoX21vYmlsZV9sY2RjX3By
aXYgewogCXN0cnVjdCBzaF9tb2JpbGVfbGNkY19jaGFuIGNoWzJdOwogCXN0cnVjdCBzaF9tb2Jp
bGVfbGNkY19vdmVybGF5IG92ZXJsYXlzWzRdOwogCi0Jc3RydWN0IG5vdGlmaWVyX2Jsb2NrIG5v
dGlmaWVyOwogCWludCBzdGFydGVkOwogCWludCBmb3JjZWRfZm91cmNjOyAvKiAyIGNoYW5uZWwg
TENEQyBtdXN0IHNoYXJlIGZvdXJjYyBzZXR0aW5nICovCiB9OwpAQCAtMjIzOSwzNyArMjIzOCw2
IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgZGV2X3BtX29wcyBzaF9tb2JpbGVfbGNkY19kZXZfcG1f
b3BzID0gewogICogRnJhbWVidWZmZXIgbm90aWZpZXIKICAqLwogCi0vKiBsb2NraW5nOiBjYWxs
ZWQgd2l0aCBpbmZvLT5sb2NrIGhlbGQgKi8KLXN0YXRpYyBpbnQgc2hfbW9iaWxlX2xjZGNfbm90
aWZ5KHN0cnVjdCBub3RpZmllcl9ibG9jayAqbmIsCi0JCQkJIHVuc2lnbmVkIGxvbmcgYWN0aW9u
LCB2b2lkICpkYXRhKQotewotCXN0cnVjdCBmYl9ldmVudCAqZXZlbnQgPSBkYXRhOwotCXN0cnVj
dCBmYl9pbmZvICppbmZvID0gZXZlbnQtPmluZm87Ci0Jc3RydWN0IHNoX21vYmlsZV9sY2RjX2No
YW4gKmNoID0gaW5mby0+cGFyOwotCi0JaWYgKCZjaC0+bGNkYy0+bm90aWZpZXIgIT0gbmIpCi0J
CXJldHVybiBOT1RJRllfRE9ORTsKLQotCWRldl9kYmcoaW5mby0+ZGV2LCAiJXMoKTogYWN0aW9u
ID0gJWx1LCBkYXRhID0gJXBcbiIsCi0JCV9fZnVuY19fLCBhY3Rpb24sIGV2ZW50LT5kYXRhKTsK
LQotCXN3aXRjaChhY3Rpb24pIHsKLQljYXNlIEZCX0VWRU5UX1NVU1BFTkQ6Ci0JCXNoX21vYmls
ZV9sY2RjX2Rpc3BsYXlfb2ZmKGNoKTsKLQkJc2hfbW9iaWxlX2xjZGNfc3RvcChjaC0+bGNkYyk7
Ci0JCWJyZWFrOwotCWNhc2UgRkJfRVZFTlRfUkVTVU1FOgotCQltdXRleF9sb2NrKCZjaC0+b3Bl
bl9sb2NrKTsKLQkJc2hfbW9iaWxlX2ZiX3JlY29uZmlnKGluZm8pOwotCQltdXRleF91bmxvY2so
JmNoLT5vcGVuX2xvY2spOwotCi0JCXNoX21vYmlsZV9sY2RjX2Rpc3BsYXlfb24oY2gpOwotCQlz
aF9tb2JpbGVfbGNkY19zdGFydChjaC0+bGNkYyk7Ci0JfQotCi0JcmV0dXJuIE5PVElGWV9PSzsK
LX0KLQogLyogLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KICAqIFByb2JlL3JlbW92ZSBhbmQgZHJpdmVy
IGluaXQvZXhpdAogICovCkBAIC0yMjk3LDggKzIyNjUsNiBAQCBzdGF0aWMgaW50IHNoX21vYmls
ZV9sY2RjX3JlbW92ZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQogCXN0cnVjdCBzaF9t
b2JpbGVfbGNkY19wcml2ICpwcml2ID0gcGxhdGZvcm1fZ2V0X2RydmRhdGEocGRldik7CiAJdW5z
aWduZWQgaW50IGk7CiAKLQlmYl91bnJlZ2lzdGVyX2NsaWVudCgmcHJpdi0+bm90aWZpZXIpOwot
CiAJZm9yIChpID0gMDsgaSA8IEFSUkFZX1NJWkUocHJpdi0+b3ZlcmxheXMpOyBpKyspCiAJCXNo
X21vYmlsZV9sY2RjX292ZXJsYXlfZmJfdW5yZWdpc3RlcigmcHJpdi0+b3ZlcmxheXNbaV0pOwog
CWZvciAoaSA9IDA7IGkgPCBBUlJBWV9TSVpFKHByaXYtPmNoKTsgaSsrKQpAQCAtMjY4OCwxMCAr
MjY1NCw2IEBAIHN0YXRpYyBpbnQgc2hfbW9iaWxlX2xjZGNfcHJvYmUoc3RydWN0IHBsYXRmb3Jt
X2RldmljZSAqcGRldikKIAkJCWdvdG8gZXJyMTsKIAl9CiAKLQkvKiBGYWlsdXJlIGlnbm9yZWQg
Ki8KLQlwcml2LT5ub3RpZmllci5ub3RpZmllcl9jYWxsID0gc2hfbW9iaWxlX2xjZGNfbm90aWZ5
OwotCWZiX3JlZ2lzdGVyX2NsaWVudCgmcHJpdi0+bm90aWZpZXIpOwotCiAJcmV0dXJuIDA7CiBl
cnIxOgogCXNoX21vYmlsZV9sY2RjX3JlbW92ZShwZGV2KTsKLS0gCjIuMjAuMQoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcg
bGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRl
c2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
