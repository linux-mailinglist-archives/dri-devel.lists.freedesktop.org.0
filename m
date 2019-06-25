Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FF9F5640D
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jun 2019 10:12:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 808986E2CC;
	Wed, 26 Jun 2019 08:12:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D9F9A6E171
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Jun 2019 16:35:07 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id v14so18635866wrr.4
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Jun 2019 09:35:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ga+YwIrD2LqYZ2tJvuqiZTtIXkFbIASL3x6BxdYUV7E=;
 b=P487a+3zKsyfJDWl9t/FJ4ymtUIOMhm/izC25IZUBCOaehSIxsb6xn7tNN+BPBPhEU
 8iKb+am67yqKEipOXSLjm78m+9lkHGJJkRqkwk3yeHHcYGy3m+M9C3bA//QBzUCPI+63
 siJOHMjuIaJp6qIhont1Izs42mXG9LXnTyJM7AvX+XpcMxQDbtv2pyw0HOrWVmIlRDqB
 R5eusGdL91tdgsZT3wrhQpoykAk3cIaC5NJY5qEKyeQaw/ZjFw7ecqspXh+bnA5+GI4b
 1rbACqn/p7+3Hu0Cp7ESaM7o12A1HQe68eSk28G8L62wYH64c0RsR/YG598eDVlQhEYS
 DF3A==
X-Gm-Message-State: APjAAAVemwlyqD57c2lL94mchWC2WJVBt4b9KaxUJ5Plw77ALk2GkRQ1
 A146aOE/phRd0/QbCjpIZnyoUA==
X-Google-Smtp-Source: APXvYqyvWx9JbKk03RcDjA3pShyMvYT0hK97AL2s1HrAwQ3kyP6xBm3hM8uqoOdedFI3inNXlGh+zw==
X-Received: by 2002:a5d:528b:: with SMTP id c11mr299403wrv.25.1561480506602;
 Tue, 25 Jun 2019 09:35:06 -0700 (PDT)
Received: from debian-brgl.home ([2a01:cb1d:af:5b00:6d6c:8493:1ab5:dad7])
 by smtp.gmail.com with ESMTPSA id g8sm2683795wme.20.2019.06.25.09.35.05
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 25 Jun 2019 09:35:06 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Sekhar Nori <nsekhar@ti.com>, Kevin Hilman <khilman@kernel.org>,
 Lee Jones <lee.jones@linaro.org>,
 Daniel Thompson <daniel.thompson@linaro.org>,
 Jingoo Han <jingoohan1@gmail.com>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 David Lechner <david@lechnology.com>,
 Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 12/12] fbdev: da8xx: use resource management for dma
Date: Tue, 25 Jun 2019 18:34:34 +0200
Message-Id: <20190625163434.13620-13-brgl@bgdev.pl>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190625163434.13620-1-brgl@bgdev.pl>
References: <20190625163434.13620-1-brgl@bgdev.pl>
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 26 Jun 2019 08:12:13 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ga+YwIrD2LqYZ2tJvuqiZTtIXkFbIASL3x6BxdYUV7E=;
 b=AHkej/B1mfm2h6OHO9LRjul+QcnubPRDTF056QLWkadd6YmPrnjIQ0undO3cGCLteJ
 vDiXd6NaEvKkuA/Ov1EU6GibR2fq54JcogmaTLJSE1w8VxFhBCKMQa6nMSc7ama2AQUQ
 MXjYRzIQXao10HPHfkljNhFskfJ1miN0PiAO2WXQdrS+ZTVMirEH1Q6Xpg47b+c9njcv
 +AACxr8d7oedC2TVbLqVhCM7LVV6mcxDlsoJqTfbUea3qLJwtE8gHdguCFLj0gCiAbWC
 v37fEvz+TIlhi8gACKPDc1wJUhIQBhzZpszZhnPvYhMiEv2bxIIzjLBufGN9GEE3sxzT
 cfTA==
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
Cc: Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-fbdev@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogQmFydG9zeiBHb2xhc3pld3NraSA8YmdvbGFzemV3c2tpQGJheWxpYnJlLmNvbT4KClVz
ZSBtYW5hZ2VkIHZhcmlhbnRzIG9mIGRtYSBhbGxvYyBmdW5jdGlvbnMgaW4gdGhlIGRhOHh4IGZi
ZGV2IGRyaXZlci4KClNpZ25lZC1vZmYtYnk6IEJhcnRvc3ogR29sYXN6ZXdza2kgPGJnb2xhc3pl
d3NraUBiYXlsaWJyZS5jb20+Ci0tLQogZHJpdmVycy92aWRlby9mYmRldi9kYTh4eC1mYi5jIHwg
MzIgKysrKysrKysrKy0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCAxMCBp
bnNlcnRpb25zKCspLCAyMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL3ZpZGVv
L2ZiZGV2L2RhOHh4LWZiLmMgYi9kcml2ZXJzL3ZpZGVvL2ZiZGV2L2RhOHh4LWZiLmMKaW5kZXgg
NmIxMWE4MTA4MTA4Li4yMmY3OWIzYzIzMjYgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvdmlkZW8vZmJk
ZXYvZGE4eHgtZmIuYworKysgYi9kcml2ZXJzL3ZpZGVvL2ZiZGV2L2RhOHh4LWZiLmMKQEAgLTEw
ODcsMTAgKzEwODcsNiBAQCBzdGF0aWMgaW50IGZiX3JlbW92ZShzdHJ1Y3QgcGxhdGZvcm1fZGV2
aWNlICpkZXYpCiAKIAl1bnJlZ2lzdGVyX2ZyYW1lYnVmZmVyKGluZm8pOwogCWZiX2RlYWxsb2Nf
Y21hcCgmaW5mby0+Y21hcCk7Ci0JZG1hX2ZyZWVfY29oZXJlbnQocGFyLT5kZXYsIFBBTEVUVEVf
U0laRSwgcGFyLT52X3BhbGV0dGVfYmFzZSwKLQkJCSAgcGFyLT5wX3BhbGV0dGVfYmFzZSk7Ci0J
ZG1hX2ZyZWVfY29oZXJlbnQocGFyLT5kZXYsIHBhci0+dnJhbV9zaXplLCBwYXItPnZyYW1fdmly
dCwKLQkJCSAgcGFyLT52cmFtX3BoeXMpOwogCXBtX3J1bnRpbWVfcHV0X3N5bmMoJmRldi0+ZGV2
KTsKIAlwbV9ydW50aW1lX2Rpc2FibGUoJmRldi0+ZGV2KTsKIAlmcmFtZWJ1ZmZlcl9yZWxlYXNl
KGluZm8pOwpAQCAtMTQyOCwxMCArMTQyNCwxMCBAQCBzdGF0aWMgaW50IGZiX3Byb2JlKHN0cnVj
dCBwbGF0Zm9ybV9kZXZpY2UgKmRldmljZSkKIAlwYXItPnZyYW1fc2l6ZSA9IHJvdW5kdXAocGFy
LT52cmFtX3NpemUvOCwgdWxjbSk7CiAJcGFyLT52cmFtX3NpemUgPSBwYXItPnZyYW1fc2l6ZSAq
IExDRF9OVU1fQlVGRkVSUzsKIAotCXBhci0+dnJhbV92aXJ0ID0gZG1hX2FsbG9jX2NvaGVyZW50
KHBhci0+ZGV2LAotCQkJCQkgICAgcGFyLT52cmFtX3NpemUsCi0JCQkJCSAgICAmcGFyLT52cmFt
X3BoeXMsCi0JCQkJCSAgICBHRlBfS0VSTkVMIHwgR0ZQX0RNQSk7CisJcGFyLT52cmFtX3ZpcnQg
PSBkbWFtX2FsbG9jX2NvaGVyZW50KHBhci0+ZGV2LAorCQkJCQkgICAgIHBhci0+dnJhbV9zaXpl
LAorCQkJCQkgICAgICZwYXItPnZyYW1fcGh5cywKKwkJCQkJICAgICBHRlBfS0VSTkVMIHwgR0ZQ
X0RNQSk7CiAJaWYgKCFwYXItPnZyYW1fdmlydCkgewogCQlkZXZfZXJyKCZkZXZpY2UtPmRldiwK
IAkJCSJHTENEOiBrbWFsbG9jIGZvciBmcmFtZSBidWZmZXIgZmFpbGVkXG4iKTsKQEAgLTE0NDks
MjAgKzE0NDUsMjAgQEAgc3RhdGljIGludCBmYl9wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNl
ICpkZXZpY2UpCiAJCWRhOHh4X2ZiX2ZpeC5saW5lX2xlbmd0aCAtIDE7CiAKIAkvKiBhbGxvY2F0
ZSBwYWxldHRlIGJ1ZmZlciAqLwotCXBhci0+dl9wYWxldHRlX2Jhc2UgPSBkbWFfYWxsb2NfY29o
ZXJlbnQocGFyLT5kZXYsIFBBTEVUVEVfU0laRSwKLQkJCQkJCSAmcGFyLT5wX3BhbGV0dGVfYmFz
ZSwKLQkJCQkJCSBHRlBfS0VSTkVMIHwgR0ZQX0RNQSk7CisJcGFyLT52X3BhbGV0dGVfYmFzZSA9
IGRtYW1fYWxsb2NfY29oZXJlbnQocGFyLT5kZXYsIFBBTEVUVEVfU0laRSwKKwkJCQkJCSAgJnBh
ci0+cF9wYWxldHRlX2Jhc2UsCisJCQkJCQkgIEdGUF9LRVJORUwgfCBHRlBfRE1BKTsKIAlpZiAo
IXBhci0+dl9wYWxldHRlX2Jhc2UpIHsKIAkJZGV2X2VycigmZGV2aWNlLT5kZXYsCiAJCQkiR0xD
RDoga21hbGxvYyBmb3IgcGFsZXR0ZSBidWZmZXIgZmFpbGVkXG4iKTsKIAkJcmV0ID0gLUVJTlZB
TDsKLQkJZ290byBlcnJfcmVsZWFzZV9mYl9tZW07CisJCWdvdG8gZXJyX3JlbGVhc2VfZmI7CiAJ
fQogCiAJcGFyLT5pcnEgPSBwbGF0Zm9ybV9nZXRfaXJxKGRldmljZSwgMCk7CiAJaWYgKHBhci0+
aXJxIDwgMCkgewogCQlyZXQgPSAtRU5PRU5UOwotCQlnb3RvIGVycl9yZWxlYXNlX3BsX21lbTsK
KwkJZ290byBlcnJfcmVsZWFzZV9mYjsKIAl9CiAKIAlkYTh4eF9mYl92YXIuZ3JheXNjYWxlID0K
QEAgLTE0ODAsNyArMTQ3Niw3IEBAIHN0YXRpYyBpbnQgZmJfcHJvYmUoc3RydWN0IHBsYXRmb3Jt
X2RldmljZSAqZGV2aWNlKQogCiAJcmV0ID0gZmJfYWxsb2NfY21hcCgmZGE4eHhfZmJfaW5mby0+
Y21hcCwgUEFMRVRURV9TSVpFLCAwKTsKIAlpZiAocmV0KQotCQlnb3RvIGVycl9yZWxlYXNlX3Bs
X21lbTsKKwkJZ290byBlcnJfcmVsZWFzZV9mYjsKIAlkYTh4eF9mYl9pbmZvLT5jbWFwLmxlbiA9
IHBhci0+cGFsZXR0ZV9zejsKIAogCS8qIGluaXRpYWxpemUgdmFyX3NjcmVlbmluZm8gKi8KQEAg
LTE1MzQsMTQgKzE1MzAsNiBAQCBzdGF0aWMgaW50IGZiX3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9k
ZXZpY2UgKmRldmljZSkKIGVycl9kZWFsbG9jX2NtYXA6CiAJZmJfZGVhbGxvY19jbWFwKCZkYTh4
eF9mYl9pbmZvLT5jbWFwKTsKIAotZXJyX3JlbGVhc2VfcGxfbWVtOgotCWRtYV9mcmVlX2NvaGVy
ZW50KHBhci0+ZGV2LCBQQUxFVFRFX1NJWkUsIHBhci0+dl9wYWxldHRlX2Jhc2UsCi0JCQkgIHBh
ci0+cF9wYWxldHRlX2Jhc2UpOwotCi1lcnJfcmVsZWFzZV9mYl9tZW06Ci0JZG1hX2ZyZWVfY29o
ZXJlbnQocGFyLT5kZXYsIHBhci0+dnJhbV9zaXplLCBwYXItPnZyYW1fdmlydCwKLQkJICAgICAg
ICAgIHBhci0+dnJhbV9waHlzKTsKLQogZXJyX3JlbGVhc2VfZmI6CiAJZnJhbWVidWZmZXJfcmVs
ZWFzZShkYTh4eF9mYl9pbmZvKTsKIAotLSAKMi4yMS4wCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZl
bEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFp
bG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
