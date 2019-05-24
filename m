Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 99EBD293BE
	for <lists+dri-devel@lfdr.de>; Fri, 24 May 2019 10:55:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 474806E0F6;
	Fri, 24 May 2019 08:54:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x543.google.com (mail-ed1-x543.google.com
 [IPv6:2a00:1450:4864:20::543])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 51BE96E0C6
 for <dri-devel@lists.freedesktop.org>; Fri, 24 May 2019 08:54:39 +0000 (UTC)
Received: by mail-ed1-x543.google.com with SMTP id a8so13343061edx.3
 for <dri-devel@lists.freedesktop.org>; Fri, 24 May 2019 01:54:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6wlvzPyopdMS/Vqi7fihj+Pgrsm5UtYg+GKB7zvM9Ww=;
 b=ezHzAbMtmhLtKJkRCfhKA32bJBgaADPduz3MTbUPaXyAaPbNEQ0J649raLVdCzU6cL
 CKy/Vb+tsrUN/kaDSpS9InM4fC6xoP3GxsnF1k0roI5vBpB+o3cqheAxlywToXW2mhsF
 zU0LPB/+lA+QmUugEi8y4hqeIQRwlV6WMlfmfziPUm7f+LsIAkKC4MEhrMMoqCgIiUnT
 lRilArbryAOvoaN7Y7aZI4Z2hwDm2zdBGTdmfPzBQg0oIUv84n5bIGp2xSG/5lRItRCG
 Pt0tqoZFF6jp3/XuSdNTa6p0+ButMDoNbyiZ/cizTQ0k6x+J2oh/ObDFhs6cIMtOiJp5
 zXIw==
X-Gm-Message-State: APjAAAVwJLiftqwolOfPGydqqqoSskTULoJDtDUdK1iRVeFO3qr7N86g
 5Epq51cn4qUXTiliymMFlMX+Eg==
X-Google-Smtp-Source: APXvYqw2aq2VDkx0vVgS+ThS5od8hiF+BIlIE1kSz2PY3WHsyf90xuR/T5niYrFxJJEPwniXENLz/w==
X-Received: by 2002:a50:c31a:: with SMTP id
 a26mr103918601edb.289.1558688076259; 
 Fri, 24 May 2019 01:54:36 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:569e:0:3106:d637:d723:e855])
 by smtp.gmail.com with ESMTPSA id 96sm567082edq.68.2019.05.24.01.54.34
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 24 May 2019 01:54:35 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: LKML <linux-kernel@vger.kernel.org>
Subject: [PATCH 26/33] fbdev: remove FBINFO_MISC_USEREVENT around fb_blank
Date: Fri, 24 May 2019 10:53:47 +0200
Message-Id: <20190524085354.27411-27-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190524085354.27411-1-daniel.vetter@ffwll.ch>
References: <20190524085354.27411-1-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=6wlvzPyopdMS/Vqi7fihj+Pgrsm5UtYg+GKB7zvM9Ww=;
 b=ebWf7hY9yJ6blUgMPShPsTw3/gxUhMPZxFy9KfHVvDIZ8jSIsvpx6Y8UEZ55sMqgu4
 WLg3Wix9vBZNuo7A4sGMPRSTsB0XR+rVBgxHhIGSCkqYfRtEtonlaYbqDNlnZfV43v3k
 1TCuNVlRlrlT/gzj/oIjC+5tKw2iW9+WcRFBU=
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
Cc: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>,
 Yisheng Xie <ysxie@foxmail.com>, Hans de Goede <hdegoede@redhat.com>,
 Mikulas Patocka <mpatocka@redhat.com>, Daniel Vetter <daniel.vetter@intel.com>,
 Peter Rosin <peda@axentia.se>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

V2l0aCB0aGUgcmVjdXJzaW9uIGJyb2tlbiBpbiB0aGUgcHJldmlvdXMgcGF0Y2ggd2UgY2FuIGRy
b3AgdGhlCkZCSU5GT19NSVNDX1VTRVJFVkVOVCBmbGFnIGFyb3VuZCBjYWxscyB0byBmYl9ibGFu
ayAtIHJlY3Vyc2lvbgpwcmV2ZW50aW9uIHdhcyBpdCdzIG9ubHkgam9iLgoKU2lnbmVkLW9mZi1i
eTogRGFuaWVsIFZldHRlciA8ZGFuaWVsLnZldHRlckBpbnRlbC5jb20+CkNjOiBEYW5pZWwgVmV0
dGVyIDxkYW5pZWwudmV0dGVyQGZmd2xsLmNoPgpDYzogQmFydGxvbWllaiBab2xuaWVya2lld2lj
eiA8Yi56b2xuaWVya2llQHNhbXN1bmcuY29tPgpDYzogSGFucyBkZSBHb2VkZSA8aGRlZ29lZGVA
cmVkaGF0LmNvbT4KQ2M6IFlpc2hlbmcgWGllIDx5c3hpZUBmb3htYWlsLmNvbT4KQ2M6ICJNaWNo
YcWCIE1pcm9zxYJhdyIgPG1pcnEtbGludXhAcmVyZS5xbXFtLnBsPgpDYzogUGV0ZXIgUm9zaW4g
PHBlZGFAYXhlbnRpYS5zZT4KQ2M6IE1pa3VsYXMgUGF0b2NrYSA8bXBhdG9ja2FAcmVkaGF0LmNv
bT4KQ2M6IFJvYiBDbGFyayA8cm9iZGNsYXJrQGdtYWlsLmNvbT4KLS0tCiBkcml2ZXJzL3ZpZGVv
L2ZiZGV2L2NvcmUvZmJjb24uYyAgIHwgNSArKy0tLQogZHJpdmVycy92aWRlby9mYmRldi9jb3Jl
L2ZibWVtLmMgICB8IDMgLS0tCiBkcml2ZXJzL3ZpZGVvL2ZiZGV2L2NvcmUvZmJzeXNmcy5jIHwg
MiAtLQogMyBmaWxlcyBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDggZGVsZXRpb25zKC0pCgpk
aWZmIC0tZ2l0IGEvZHJpdmVycy92aWRlby9mYmRldi9jb3JlL2ZiY29uLmMgYi9kcml2ZXJzL3Zp
ZGVvL2ZiZGV2L2NvcmUvZmJjb24uYwppbmRleCBkOWY1NDVmMWE4MWIuLjhhNjc1MDUxNjdhZSAx
MDA2NDQKLS0tIGEvZHJpdmVycy92aWRlby9mYmRldi9jb3JlL2ZiY29uLmMKKysrIGIvZHJpdmVy
cy92aWRlby9mYmRldi9jb3JlL2ZiY29uLmMKQEAgLTIzODYsOSArMjM4Niw4IEBAIHN0YXRpYyBp
bnQgZmJjb25fYmxhbmsoc3RydWN0IHZjX2RhdGEgKnZjLCBpbnQgYmxhbmssIGludCBtb2RlX3N3
aXRjaCkKIAkJCWZiY29uX2N1cnNvcih2YywgYmxhbmsgPyBDTV9FUkFTRSA6IENNX0RSQVcpOwog
CQkJb3BzLT5jdXJzb3JfZmxhc2ggPSAoIWJsYW5rKTsKIAotCQkJaWYgKCEoaW5mby0+ZmxhZ3Mg
JiBGQklORk9fTUlTQ19VU0VSRVZFTlQpKQotCQkJCWlmIChmYl9ibGFuayhpbmZvLCBibGFuaykp
Ci0JCQkJCWZiY29uX2dlbmVyaWNfYmxhbmsodmMsIGluZm8sIGJsYW5rKTsKKwkJCWlmIChmYl9i
bGFuayhpbmZvLCBibGFuaykpCisJCQkJZmJjb25fZ2VuZXJpY19ibGFuayh2YywgaW5mbywgYmxh
bmspOwogCQl9CiAKIAkJaWYgKCFibGFuaykKZGlmZiAtLWdpdCBhL2RyaXZlcnMvdmlkZW8vZmJk
ZXYvY29yZS9mYm1lbS5jIGIvZHJpdmVycy92aWRlby9mYmRldi9jb3JlL2ZibWVtLmMKaW5kZXgg
ZDY3MTNkY2U5ZTMxLi4yNWFlNDY2YmE1OTMgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvdmlkZW8vZmJk
ZXYvY29yZS9mYm1lbS5jCisrKyBiL2RyaXZlcnMvdmlkZW8vZmJkZXYvY29yZS9mYm1lbS5jCkBA
IC0xMTk0LDEwICsxMTk0LDcgQEAgc3RhdGljIGxvbmcgZG9fZmJfaW9jdGwoc3RydWN0IGZiX2lu
Zm8gKmluZm8sIHVuc2lnbmVkIGludCBjbWQsCiAJY2FzZSBGQklPQkxBTks6CiAJCWNvbnNvbGVf
bG9jaygpOwogCQlsb2NrX2ZiX2luZm8oaW5mbyk7Ci0JCWluZm8tPmZsYWdzIHw9IEZCSU5GT19N
SVNDX1VTRVJFVkVOVDsKIAkJcmV0ID0gZmJfYmxhbmsoaW5mbywgYXJnKTsKLQkJaW5mby0+Zmxh
Z3MgJj0gfkZCSU5GT19NSVNDX1VTRVJFVkVOVDsKLQogCQkvKiBtaWdodCBhZ2FpbiBjYWxsIGlu
dG8gZmJfYmxhbmsgKi8KIAkJZmJjb25fZmJfYmxhbmtlZChpbmZvLCBhcmcpOwogCQl1bmxvY2tf
ZmJfaW5mbyhpbmZvKTsKZGlmZiAtLWdpdCBhL2RyaXZlcnMvdmlkZW8vZmJkZXYvY29yZS9mYnN5
c2ZzLmMgYi9kcml2ZXJzL3ZpZGVvL2ZiZGV2L2NvcmUvZmJzeXNmcy5jCmluZGV4IDI1MmQ0ZjUy
ZDJhNS4uODgyYjQ3MWQ2MTllIDEwMDY0NAotLS0gYS9kcml2ZXJzL3ZpZGVvL2ZiZGV2L2NvcmUv
ZmJzeXNmcy5jCisrKyBiL2RyaXZlcnMvdmlkZW8vZmJkZXYvY29yZS9mYnN5c2ZzLmMKQEAgLTMx
MCw5ICszMTAsNyBAQCBzdGF0aWMgc3NpemVfdCBzdG9yZV9ibGFuayhzdHJ1Y3QgZGV2aWNlICpk
ZXZpY2UsCiAKIAlhcmcgPSBzaW1wbGVfc3RydG91bChidWYsICZsYXN0LCAwKTsKIAljb25zb2xl
X2xvY2soKTsKLQlmYl9pbmZvLT5mbGFncyB8PSBGQklORk9fTUlTQ19VU0VSRVZFTlQ7CiAJZXJy
ID0gZmJfYmxhbmsoZmJfaW5mbywgYXJnKTsKLQlmYl9pbmZvLT5mbGFncyAmPSB+RkJJTkZPX01J
U0NfVVNFUkVWRU5UOwogCS8qIG1pZ2h0IGFnYWluIGNhbGwgaW50byBmYl9ibGFuayAqLwogCWZi
Y29uX2ZiX2JsYW5rZWQoZmJfaW5mbywgYXJnKTsKIAljb25zb2xlX3VubG9jaygpOwotLSAKMi4y
MC4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmkt
ZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6
Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
