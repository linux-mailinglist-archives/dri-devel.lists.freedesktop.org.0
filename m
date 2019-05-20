Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DE43922E8C
	for <lists+dri-devel@lfdr.de>; Mon, 20 May 2019 10:24:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1713C892BB;
	Mon, 20 May 2019 08:22:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x543.google.com (mail-ed1-x543.google.com
 [IPv6:2a00:1450:4864:20::543])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D14A892CA
 for <dri-devel@lists.freedesktop.org>; Mon, 20 May 2019 08:22:55 +0000 (UTC)
Received: by mail-ed1-x543.google.com with SMTP id b8so22489816edm.11
 for <dri-devel@lists.freedesktop.org>; Mon, 20 May 2019 01:22:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=CumxJ2NtVSEP5RNMzgMskkfGKnWkqYH9OWapQsg3Ykk=;
 b=JqHenjfZTgXON+9ZawEb2R3BoCuI5C0DC+x/NtYxre5DarA2WFXbtJLUoEGfBtmOVt
 FwrHLZgGa8l/X+6or73ZwFwwp4yGGD9QHsCZprVjbf3KcviwflG4RGZaiV5ZT2PFLUKz
 pNhYJ7ImTPiVSyIoISP4YW7gBa+v24FPLIcIQGDzFzlQQUAcah8v1gi/vQSBm6fLQFNQ
 Tvbld0EpnyiLkKAmlkGLneIBEfIla9xiaumuw/r8nRhsuz/wTI5aprpIyUkfJR6gGf8T
 RqtsALEj5qt6JuYcnYijd6UIK69vc6YAE5EWQjGqVo7psc3ehitXNAtBhJoCVXmVgr8I
 cxDw==
X-Gm-Message-State: APjAAAXALSR9mSZg5zU5RgxX7A3wa57ubmr1tklFfTEayhzJ70MAhfa5
 kur04dGPf03V3enu+KlqyswkPaSpFbs=
X-Google-Smtp-Source: APXvYqzKocCCpdIn3BgvIXkZbMH0Ck4pkHA663Xdj8pJGjwyoQ9kIknubmApc8RiuGcyohuJzMWALQ==
X-Received: by 2002:a17:906:af57:: with SMTP id
 ly23mr26150862ejb.98.1558340572842; 
 Mon, 20 May 2019 01:22:52 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:569e:0:3106:d637:d723:e855])
 by smtp.gmail.com with ESMTPSA id t25sm3021263ejx.8.2019.05.20.01.22.51
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 20 May 2019 01:22:52 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH 26/33] fbmem: pull fbcon_fb_blanked out of fb_blank
Date: Mon, 20 May 2019 10:22:09 +0200
Message-Id: <20190520082216.26273-27-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190520082216.26273-1-daniel.vetter@ffwll.ch>
References: <20190520082216.26273-1-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=CumxJ2NtVSEP5RNMzgMskkfGKnWkqYH9OWapQsg3Ykk=;
 b=BiYU87eY751NVue2WirSevA+JtWzXlDUBKxpdvOCuE9SFAZutDfx84Zsh7QinEw1+x
 /YP4ChXJX2Hz4luhn5VXlZYJ8A5mSJGredVJzSCu87xqgKtLxkmTzP1VmxfyzsBTNq8N
 ff45HA03UxQVhL9TWuRtiTxSXr2xq30e/D90Q=
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
 LKML <linux-kernel@vger.kernel.org>,
 =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>,
 Hans de Goede <hdegoede@redhat.com>, Mikulas Patocka <mpatocka@redhat.com>,
 Daniel Vetter <daniel.vetter@intel.com>, Peter Rosin <peda@axentia.se>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhlcmUncyBhIGNhbGxjaGFpbiBvZjoKCmZiY29uX2ZiX2JsYW5lZCAtPiBkb18odW4pYmxhbmtf
c2NyZWVuIC0+IGNvbnN3LT5jb25fYmxhbmsKCS0+IGZiY29uX2JsYW5rIC0+IGZiX2JsYW5rCgpU
aGluZ3MgZG9uJ3QgZ28gaG9ycmlibHkgd3JvbmcgYmVjYXVzZSB0aGUgQktMIGNvbnNvbGVfbG9j
ayBzYWZlcyB0aGUKZGF5LCBidXQgdGhhdCdzIGFib3V0IGl0LiBBbmQgdGhlIHNlZW1pbmcgcmVj
dXJzaW9uIGlzIGJyb2tlbiBpbiAyCndheXM6Ci0gU3RhcnRpbmcgZnJvbSB0aGUgZmJkZXYgaW9j
dGwgd2Ugc2V0IEZCSU5GT19NSVNDX1VTRVJFVkVOVCwgd2hpY2gKICB0ZWxscyB0aGUgZmJjb25f
YmxhbmsgY29kZSB0byBub3QgY2FsbCBmYl9ibGFuay4gVGhpcyB3YXMgcmVxdWlyZWQKICB0byBu
b3QgZGVhZGxvY2sgd2hlbiByZWN1cnNpbmcgb24gdGhlIGZiX25vdGlmaWVyX2NoYWluIG11dGV4
LgotIFN0YXJ0aW5nIGZyb20gdGhlIGNvbl9ibGFuayBob29rIHdlJ3JlIGdldHRpbmcgc2F2ZWQg
YnkgdGhlCiAgY29uc29sZV9ibGFua2VkIGNoZWNrcyBpbiBkb19ibGFuay91bmJsYW5rX3NjcmVl
bi4gT3IgYXQgbGVhc3QKICB0aGF0J3MgbXkgdGhlb3J5LgoKQW55d2F5LCByZWN1cnNpb24gaXNu
J3QgYXdlc29tZSwgc28gbGV0J3Mgc3RvcCBpdC4gQnJlYWtpbmcgdGhlCnJlY3Vyc2lvbiBhdm9p
ZHMgdGhlIG5lZWQgdG8gYmUgaW4gdGhlIEZCSU5GT19NSVNDX1VTRVJFVkVOVCBjcml0aWNhbApz
ZWN0aW9uLCBzbyBsZXRzIG1vdmUgaXQgb3V0IG9mIHRoYXQgdG9vLgoKVGhlIGFzdHV0ZSByZWFk
ZXIgd2lsbCBub3RpY2UgdGhhdCBmYl9ibGFuayBzZWVtcyB0byByZXF1aXJlCmxvY2tfZmJfaW5m
bygpLCB3aGljaCB0aGUgZmJjb24gY29kZSBzZWVtcyB0byBpZ25vcmUuIEkgaGF2ZSBubyBpZGVh
CmhvdyB0byBmaXggdGhhdCBwcm9ibGVtLCBzbyBsZXQncyBrZWVwIGlnbm9yaW5nIGl0LgoKdjI6
IEkgZm9yZ290IHRoZSBzeXNmcyBibGFua2luZyBjb2RlLgoKU2lnbmVkLW9mZi1ieTogRGFuaWVs
IFZldHRlciA8ZGFuaWVsLnZldHRlckBpbnRlbC5jb20+CkNjOiBEYW5pZWwgVmV0dGVyIDxkYW5p
ZWwudmV0dGVyQGZmd2xsLmNoPgpDYzogQmFydGxvbWllaiBab2xuaWVya2lld2ljeiA8Yi56b2xu
aWVya2llQHNhbXN1bmcuY29tPgpDYzogIk1pY2hhxYIgTWlyb3PFgmF3IiA8bWlycS1saW51eEBy
ZXJlLnFtcW0ucGw+CkNjOiBQZXRlciBSb3NpbiA8cGVkYUBheGVudGlhLnNlPgpDYzogSGFucyBk
ZSBHb2VkZSA8aGRlZ29lZGVAcmVkaGF0LmNvbT4KQ2M6IE1pa3VsYXMgUGF0b2NrYSA8bXBhdG9j
a2FAcmVkaGF0LmNvbT4KQ2M6IFJvYiBDbGFyayA8cm9iZGNsYXJrQGdtYWlsLmNvbT4KLS0tCiBk
cml2ZXJzL3ZpZGVvL2ZiZGV2L2NvcmUvZmJtZW0uYyAgIHwgNCArKystCiBkcml2ZXJzL3ZpZGVv
L2ZiZGV2L2NvcmUvZmJzeXNmcy5jIHwgOCArKysrKystLQogMiBmaWxlcyBjaGFuZ2VkLCA5IGlu
c2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy92aWRlby9m
YmRldi9jb3JlL2ZibWVtLmMgYi9kcml2ZXJzL3ZpZGVvL2ZiZGV2L2NvcmUvZmJtZW0uYwppbmRl
eCA5OTMyMTMwYmY3MjguLjdmOTVjN2U4MDE1NSAxMDA2NDQKLS0tIGEvZHJpdmVycy92aWRlby9m
YmRldi9jb3JlL2ZibWVtLmMKKysrIGIvZHJpdmVycy92aWRlby9mYmRldi9jb3JlL2ZibWVtLmMK
QEAgLTEwNjgsNyArMTA2OCw2IEBAIGZiX2JsYW5rKHN0cnVjdCBmYl9pbmZvICppbmZvLCBpbnQg
YmxhbmspCiAJZXZlbnQuZGF0YSA9ICZibGFuazsKIAogCWVhcmx5X3JldCA9IGZiX25vdGlmaWVy
X2NhbGxfY2hhaW4oRkJfRUFSTFlfRVZFTlRfQkxBTkssICZldmVudCk7Ci0JZmJjb25fZmJfYmxh
bmtlZChpbmZvLCBibGFuayk7CiAKIAlpZiAoaW5mby0+ZmJvcHMtPmZiX2JsYW5rKQogIAkJcmV0
ID0gaW5mby0+ZmJvcHMtPmZiX2JsYW5rKGJsYW5rLCBpbmZvKTsKQEAgLTExOTgsNiArMTE5Nyw5
IEBAIHN0YXRpYyBsb25nIGRvX2ZiX2lvY3RsKHN0cnVjdCBmYl9pbmZvICppbmZvLCB1bnNpZ25l
ZCBpbnQgY21kLAogCQlpbmZvLT5mbGFncyB8PSBGQklORk9fTUlTQ19VU0VSRVZFTlQ7CiAJCXJl
dCA9IGZiX2JsYW5rKGluZm8sIGFyZyk7CiAJCWluZm8tPmZsYWdzICY9IH5GQklORk9fTUlTQ19V
U0VSRVZFTlQ7CisKKwkJLyogbWlnaHQgYWdhaW4gY2FsbCBpbnRvIGZiX2JsYW5rICovCisJCWZi
Y29uX2ZiX2JsYW5rZWQoaW5mbywgYXJnKTsKIAkJdW5sb2NrX2ZiX2luZm8oaW5mbyk7CiAJCWNv
bnNvbGVfdW5sb2NrKCk7CiAJCWJyZWFrOwpkaWZmIC0tZ2l0IGEvZHJpdmVycy92aWRlby9mYmRl
di9jb3JlL2Zic3lzZnMuYyBiL2RyaXZlcnMvdmlkZW8vZmJkZXYvY29yZS9mYnN5c2ZzLmMKaW5k
ZXggNWYzMjkyNzhlNTVmLi4yNTJkNGY1MmQyYTUgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvdmlkZW8v
ZmJkZXYvY29yZS9mYnN5c2ZzLmMKKysrIGIvZHJpdmVycy92aWRlby9mYmRldi9jb3JlL2Zic3lz
ZnMuYwpAQCAtMTgsNiArMTgsNyBAQAogI2luY2x1ZGUgPGxpbnV4L2tlcm5lbC5oPgogI2luY2x1
ZGUgPGxpbnV4L3NsYWIuaD4KICNpbmNsdWRlIDxsaW51eC9mYi5oPgorI2luY2x1ZGUgPGxpbnV4
L2ZiY29uLmg+CiAjaW5jbHVkZSA8bGludXgvY29uc29sZS5oPgogI2luY2x1ZGUgPGxpbnV4L21v
ZHVsZS5oPgogCkBAIC0zMDUsMTIgKzMwNiwxNSBAQCBzdGF0aWMgc3NpemVfdCBzdG9yZV9ibGFu
ayhzdHJ1Y3QgZGV2aWNlICpkZXZpY2UsCiB7CiAJc3RydWN0IGZiX2luZm8gKmZiX2luZm8gPSBk
ZXZfZ2V0X2RydmRhdGEoZGV2aWNlKTsKIAljaGFyICpsYXN0ID0gTlVMTDsKLQlpbnQgZXJyOwor
CWludCBlcnIsIGFyZzsKIAorCWFyZyA9IHNpbXBsZV9zdHJ0b3VsKGJ1ZiwgJmxhc3QsIDApOwog
CWNvbnNvbGVfbG9jaygpOwogCWZiX2luZm8tPmZsYWdzIHw9IEZCSU5GT19NSVNDX1VTRVJFVkVO
VDsKLQllcnIgPSBmYl9ibGFuayhmYl9pbmZvLCBzaW1wbGVfc3RydG91bChidWYsICZsYXN0LCAw
KSk7CisJZXJyID0gZmJfYmxhbmsoZmJfaW5mbywgYXJnKTsKIAlmYl9pbmZvLT5mbGFncyAmPSB+
RkJJTkZPX01JU0NfVVNFUkVWRU5UOworCS8qIG1pZ2h0IGFnYWluIGNhbGwgaW50byBmYl9ibGFu
ayAqLworCWZiY29uX2ZiX2JsYW5rZWQoZmJfaW5mbywgYXJnKTsKIAljb25zb2xlX3VubG9jaygp
OwogCWlmIChlcnIgPCAwKQogCQlyZXR1cm4gZXJyOwotLSAKMi4yMC4xCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0
CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
