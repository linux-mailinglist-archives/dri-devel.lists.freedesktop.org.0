Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DD2AD293B1
	for <lists+dri-devel@lfdr.de>; Fri, 24 May 2019 10:55:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E0CF6E0D9;
	Fri, 24 May 2019 08:54:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x541.google.com (mail-ed1-x541.google.com
 [IPv6:2a00:1450:4864:20::541])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A49E76E0D1
 for <dri-devel@lists.freedesktop.org>; Fri, 24 May 2019 08:54:30 +0000 (UTC)
Received: by mail-ed1-x541.google.com with SMTP id f37so13272099edb.13
 for <dri-devel@lists.freedesktop.org>; Fri, 24 May 2019 01:54:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=P7tIrgwU7eV/tnp6z+MGMTB4sNqCdN7ed69YxIOeB/8=;
 b=ObfrtdOarIQb24SckrpJksBnNIEYy/OkaZMjhavPAFG49SqtMXhkdoAo4EwUpB3EAI
 ZITJ4Cw6+833BXiYDc8VYa/nLBGhaHGTH1Ad4D3b4nS8qwCAM4VsrAK8WP/trmJDBZJ7
 FXOQwBrWE+57nZm6RbxVYBGn54SjaEL0XjGzNHKDWicH4VW4z4+DDqVat8oEKxa/WqEK
 G1LGP+gbdt5WN39ta+YhrcRe/pu/yxkGBmvbLhrWZ2OegdTu47lUNIRWr+iHbTSq0H3y
 5dgefrNMwKOAXMSLbQIj837NBxFyfRDRjQ8uXTusQVvsCiSGI/rlLqfCgs04MkxPsahS
 F6dg==
X-Gm-Message-State: APjAAAUUI8lkPBCxa3RHvpo2209W4zV3C5kloQJwF7GOY/GQ4Kf8Bne9
 gxdRUlF3cXVJnqYOlOoK0S2f3w==
X-Google-Smtp-Source: APXvYqxMDc+MB2GzcxdSQS+P6KkuwPYcQbSOHZxvH6/HgzRjYRaM+LEjDMKiT80Ym/ek6JxYO7XvZg==
X-Received: by 2002:a17:906:f194:: with SMTP id
 gs20mr47317746ejb.177.1558688068453; 
 Fri, 24 May 2019 01:54:28 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:569e:0:3106:d637:d723:e855])
 by smtp.gmail.com with ESMTPSA id 96sm567082edq.68.2019.05.24.01.54.26
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 24 May 2019 01:54:27 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: LKML <linux-kernel@vger.kernel.org>
Subject: [PATCH 20/33] fbdev/sh_mob: Remove fb notifier callback
Date: Fri, 24 May 2019 10:53:41 +0200
Message-Id: <20190524085354.27411-21-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190524085354.27411-1-daniel.vetter@ffwll.ch>
References: <20190524085354.27411-1-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=P7tIrgwU7eV/tnp6z+MGMTB4sNqCdN7ed69YxIOeB/8=;
 b=N2a0XA0p9Nzm5STKQj70ji0mhzkZ/xfxYB2PMpEu/BQLvb4CnU9DbBWMxTs8SwbL0b
 Ct9CB35ETqZsHmnRsddzqoZV0c7Xtr1YtcIieAN9fX/X0JrtOD7aSyaXAZWqDhu+/GyA
 9UtwtG2Q41IP1MqfY2yvDKhJ+880HBSlYdMeo=
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
 DRI Development <dri-devel@lists.freedesktop.org>,
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
UmV2aWV3ZWQtYnk6IEdlZXJ0IFV5dHRlcmhvZXZlbiA8Z2VlcnQrcmVuZXNhc0BnbGlkZXIuYmU+
ClRlc3RlZC1ieTogR2VlcnQgVXl0dGVyaG9ldmVuIDxnZWVydCtyZW5lc2FzQGdsaWRlci5iZT4K
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
