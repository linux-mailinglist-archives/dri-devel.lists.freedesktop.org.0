Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E513622E85
	for <lists+dri-devel@lfdr.de>; Mon, 20 May 2019 10:23:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED739892B8;
	Mon, 20 May 2019 08:22:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x543.google.com (mail-ed1-x543.google.com
 [IPv6:2a00:1450:4864:20::543])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC80C892B8
 for <dri-devel@lists.freedesktop.org>; Mon, 20 May 2019 08:22:49 +0000 (UTC)
Received: by mail-ed1-x543.google.com with SMTP id a8so22560058edx.3
 for <dri-devel@lists.freedesktop.org>; Mon, 20 May 2019 01:22:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=v/s+u+a3caCaHYMTdWy6ZkddtDAnAEvZ2jDDvaMGNYA=;
 b=PTMoGGtnlnB6tsx87yruchn56KbmCBeM2lKWWC625KckpPsjtYnKcRnEVBKDHJAN8s
 ckDRVBaeR9LHqrG2vU4KzzBMcSUkVVQYG4xWHxcOJgZ9u1yxRfkaNArmVTFE/JK5KZom
 OxQi5Asp6inDN+3b+7pSYRQDrx0pwwfUhov6Dd4ycJs3c0bq6yXFoZkiX09hHVK3bAs2
 kHqF4Ei5fMARnm+ex2OcP1QFZmrBl4ks93sjJJI0Yzmh8v6UB3uSghpCJFyQPr4Dhvft
 c05k1j4B6ggqBtqGbCfRbi2dM40OCrstXl5cUHqx8EjXfcsmIGfbMTBTzWllhnMsJDyT
 AaBw==
X-Gm-Message-State: APjAAAUNwefK9TdVtp0srq4myPQmrCNc4x1IYH3LJauzp0RirvdPq+VH
 pJPi+ySAsSXWmeWg/JCmn38CHGm80Qk=
X-Google-Smtp-Source: APXvYqzLhoVVwMu2GYEtxzLVHTjujPVhcPA2aHmpjPD5I+daHWOweaULw644XMo3J/NOdhuKNOJdqg==
X-Received: by 2002:a17:906:1315:: with SMTP id
 w21mr21608204ejb.193.1558340565855; 
 Mon, 20 May 2019 01:22:45 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:569e:0:3106:d637:d723:e855])
 by smtp.gmail.com with ESMTPSA id t25sm3021263ejx.8.2019.05.20.01.22.44
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 20 May 2019 01:22:45 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH 20/33] fbdev/sh_mob: Remove fb notifier callback
Date: Mon, 20 May 2019 10:22:03 +0200
Message-Id: <20190520082216.26273-21-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190520082216.26273-1-daniel.vetter@ffwll.ch>
References: <20190520082216.26273-1-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=v/s+u+a3caCaHYMTdWy6ZkddtDAnAEvZ2jDDvaMGNYA=;
 b=VzX3I0qS4GrLLWfSpSSNrP7CAMGwoZGJKhcwchf7QZ7BvcXbuZZKJ5uSOyvS446dj4
 ZGaqCy84FOjRhoTTDad15AK3Q/HXp5EJIspUgGPRghZxCpoy0WCZ3D8cLngSRNv6Owtc
 WT7wxmgNirNNpJjN7KUjYDc04Q/lFSzz5jtMo=
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
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Daniel Vetter <daniel.vetter@intel.com>,
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
Q2M6IERhbmllbCBWZXR0ZXIgPGRhbmllbC52ZXR0ZXJAZmZ3bGwuY2g+CkNjOiBCYXJ0bG9taWVq
IFpvbG5pZXJraWV3aWN6IDxiLnpvbG5pZXJraWVAc2Ftc3VuZy5jb20+CkNjOiBNYXJrdXMgRWxm
cmluZyA8ZWxmcmluZ0B1c2Vycy5zb3VyY2Vmb3JnZS5uZXQ+CkNjOiBHZWVydCBVeXR0ZXJob2V2
ZW4gPGdlZXJ0K3JlbmVzYXNAZ2xpZGVyLmJlPgpDYzogV29sZnJhbSBTYW5nIDx3c2ErcmVuZXNh
c0BzYW5nLWVuZ2luZWVyaW5nLmNvbT4KLS0tCiBkcml2ZXJzL3ZpZGVvL2ZiZGV2L3NoX21vYmls
ZV9sY2RjZmIuYyB8IDM4IC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCiAxIGZpbGUgY2hhbmdl
ZCwgMzggZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy92aWRlby9mYmRldi9zaF9t
b2JpbGVfbGNkY2ZiLmMgYi9kcml2ZXJzL3ZpZGVvL2ZiZGV2L3NoX21vYmlsZV9sY2RjZmIuYwpp
bmRleCBjNTkyNGY1ZTk4YzYuLjBkN2EwNDQ4NTJkNyAxMDA2NDQKLS0tIGEvZHJpdmVycy92aWRl
by9mYmRldi9zaF9tb2JpbGVfbGNkY2ZiLmMKKysrIGIvZHJpdmVycy92aWRlby9mYmRldi9zaF9t
b2JpbGVfbGNkY2ZiLmMKQEAgLTIxMyw3ICsyMTMsNiBAQCBzdHJ1Y3Qgc2hfbW9iaWxlX2xjZGNf
cHJpdiB7CiAJc3RydWN0IHNoX21vYmlsZV9sY2RjX2NoYW4gY2hbMl07CiAJc3RydWN0IHNoX21v
YmlsZV9sY2RjX292ZXJsYXkgb3ZlcmxheXNbNF07CiAKLQlzdHJ1Y3Qgbm90aWZpZXJfYmxvY2sg
bm90aWZpZXI7CiAJaW50IHN0YXJ0ZWQ7CiAJaW50IGZvcmNlZF9mb3VyY2M7IC8qIDIgY2hhbm5l
bCBMQ0RDIG11c3Qgc2hhcmUgZm91cmNjIHNldHRpbmcgKi8KIH07CkBAIC0yMjU4LDM3ICsyMjU3
LDYgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBkZXZfcG1fb3BzIHNoX21vYmlsZV9sY2RjX2Rldl9w
bV9vcHMgPSB7CiAgKiBGcmFtZWJ1ZmZlciBub3RpZmllcgogICovCiAKLS8qIGxvY2tpbmc6IGNh
bGxlZCB3aXRoIGluZm8tPmxvY2sgaGVsZCAqLwotc3RhdGljIGludCBzaF9tb2JpbGVfbGNkY19u
b3RpZnkoc3RydWN0IG5vdGlmaWVyX2Jsb2NrICpuYiwKLQkJCQkgdW5zaWduZWQgbG9uZyBhY3Rp
b24sIHZvaWQgKmRhdGEpCi17Ci0Jc3RydWN0IGZiX2V2ZW50ICpldmVudCA9IGRhdGE7Ci0Jc3Ry
dWN0IGZiX2luZm8gKmluZm8gPSBldmVudC0+aW5mbzsKLQlzdHJ1Y3Qgc2hfbW9iaWxlX2xjZGNf
Y2hhbiAqY2ggPSBpbmZvLT5wYXI7Ci0KLQlpZiAoJmNoLT5sY2RjLT5ub3RpZmllciAhPSBuYikK
LQkJcmV0dXJuIE5PVElGWV9ET05FOwotCi0JZGV2X2RiZyhpbmZvLT5kZXYsICIlcygpOiBhY3Rp
b24gPSAlbHUsIGRhdGEgPSAlcFxuIiwKLQkJX19mdW5jX18sIGFjdGlvbiwgZXZlbnQtPmRhdGEp
OwotCi0Jc3dpdGNoKGFjdGlvbikgewotCWNhc2UgRkJfRVZFTlRfU1VTUEVORDoKLQkJc2hfbW9i
aWxlX2xjZGNfZGlzcGxheV9vZmYoY2gpOwotCQlzaF9tb2JpbGVfbGNkY19zdG9wKGNoLT5sY2Rj
KTsKLQkJYnJlYWs7Ci0JY2FzZSBGQl9FVkVOVF9SRVNVTUU6Ci0JCW11dGV4X2xvY2soJmNoLT5v
cGVuX2xvY2spOwotCQlzaF9tb2JpbGVfZmJfcmVjb25maWcoaW5mbyk7Ci0JCW11dGV4X3VubG9j
aygmY2gtPm9wZW5fbG9jayk7Ci0KLQkJc2hfbW9iaWxlX2xjZGNfZGlzcGxheV9vbihjaCk7Ci0J
CXNoX21vYmlsZV9sY2RjX3N0YXJ0KGNoLT5sY2RjKTsKLQl9Ci0KLQlyZXR1cm4gTk9USUZZX09L
OwotfQotCiAvKiAtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQogICogUHJvYmUvcmVtb3ZlIGFuZCBkcml2
ZXIgaW5pdC9leGl0CiAgKi8KQEAgLTIzMTYsOCArMjI4NCw2IEBAIHN0YXRpYyBpbnQgc2hfbW9i
aWxlX2xjZGNfcmVtb3ZlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCiAJc3RydWN0IHNo
X21vYmlsZV9sY2RjX3ByaXYgKnByaXYgPSBwbGF0Zm9ybV9nZXRfZHJ2ZGF0YShwZGV2KTsKIAl1
bnNpZ25lZCBpbnQgaTsKIAotCWZiX3VucmVnaXN0ZXJfY2xpZW50KCZwcml2LT5ub3RpZmllcik7
Ci0KIAlmb3IgKGkgPSAwOyBpIDwgQVJSQVlfU0laRShwcml2LT5vdmVybGF5cyk7IGkrKykKIAkJ
c2hfbW9iaWxlX2xjZGNfb3ZlcmxheV9mYl91bnJlZ2lzdGVyKCZwcml2LT5vdmVybGF5c1tpXSk7
CiAJZm9yIChpID0gMDsgaSA8IEFSUkFZX1NJWkUocHJpdi0+Y2gpOyBpKyspCkBAIC0yNzA3LDEw
ICsyNjczLDYgQEAgc3RhdGljIGludCBzaF9tb2JpbGVfbGNkY19wcm9iZShzdHJ1Y3QgcGxhdGZv
cm1fZGV2aWNlICpwZGV2KQogCQkJZ290byBlcnIxOwogCX0KIAotCS8qIEZhaWx1cmUgaWdub3Jl
ZCAqLwotCXByaXYtPm5vdGlmaWVyLm5vdGlmaWVyX2NhbGwgPSBzaF9tb2JpbGVfbGNkY19ub3Rp
Znk7Ci0JZmJfcmVnaXN0ZXJfY2xpZW50KCZwcml2LT5ub3RpZmllcik7Ci0KIAlyZXR1cm4gMDsK
IGVycjE6CiAJc2hfbW9iaWxlX2xjZGNfcmVtb3ZlKHBkZXYpOwotLSAKMi4yMC4xCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGlu
ZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVl
ZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
