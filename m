Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 83FAAA5D06
	for <lists+dri-devel@lfdr.de>; Mon,  2 Sep 2019 22:16:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5AE8089A56;
	Mon,  2 Sep 2019 20:16:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 000B38911A
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Sep 2019 12:35:01 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id l11so5034659wrx.5
 for <dri-devel@lists.freedesktop.org>; Mon, 02 Sep 2019 05:35:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/jAAQVre0ugDaUipQgqAVWSbxc2RrUvIHMN/mo5I6Jk=;
 b=GVGJ6X3s2WwGr1J1gZpi2CS+tNXtAdznHsaQwijVTe6r7X8d7/MdikcVcZlQVdUPKL
 QgWt4oD2BwjK8ox8xM24htGvXG9ou/qUuRnGs2mlmHsSwoF8idoNV2nFv7PCEOdPLwJ6
 B3m8ZjdK/rxWn+5GZt4QQIkEjzxyknBuE5Mz0rw5qciqgfxhEQqoEaOiwcJ01S9Z0803
 130ncMafZ9Dqd+vmv1ww2UcYOUbum8pemRK2KvA1iquls57YWGQkdWMDTtm5R1G3GbRn
 FeL9urxpbICUiAqFo+YrBUJi16fBk+vNdM/iC7RFQGPMgVWpsLuzdxLz2tLEMocQKjw1
 LRrg==
X-Gm-Message-State: APjAAAWmmmkmwXgO1d2ddoQUubCzjX4WZJUigrWW5qacao8wY8seWH3g
 QP7jfr4iwjIA6aoPTCyZ6F2VRQ==
X-Google-Smtp-Source: APXvYqwj4ObCHBjkI+G6B9G9wba9BtxdUwO5yxmXy1uG3RpakaYj27cBRQ5d9KFAlmxR7q5FsHOggg==
X-Received: by 2002:a5d:5612:: with SMTP id l18mr18125016wrv.177.1567427700581; 
 Mon, 02 Sep 2019 05:35:00 -0700 (PDT)
Received: from localhost.localdomain
 (amontpellier-652-1-281-69.w109-210.abo.wanadoo.fr. [109.210.96.69])
 by smtp.gmail.com with ESMTPSA id k9sm22645759wrd.7.2019.09.02.05.34.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Sep 2019 05:35:00 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Yoshinori Sato <ysato@users.sourceforge.jp>, Rich Felker <dalias@libc.org>,
 Lee Jones <lee.jones@linaro.org>,
 Daniel Thompson <daniel.thompson@linaro.org>,
 Jingoo Han <jingoohan1@gmail.com>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [RESEND PATCH v3 7/7] backlight: gpio: use a helper variable for
 &pdev->dev
Date: Mon,  2 Sep 2019 14:34:44 +0200
Message-Id: <20190902123444.19924-8-brgl@bgdev.pl>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190902123444.19924-1-brgl@bgdev.pl>
References: <20190902123444.19924-1-brgl@bgdev.pl>
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 02 Sep 2019 20:15:58 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/jAAQVre0ugDaUipQgqAVWSbxc2RrUvIHMN/mo5I6Jk=;
 b=ix2RLbgRG+/MjkM1kHz/0CXUG+C5ZIK5V64NA/yDf8xWlkJ4nTutymQGoPCwn476MX
 QXnJ5G0wXg3iB0Z4oVOp1Fg9IF7rmCU24zFapX9nuNXsKCIyzOSR+ELh6CK177dlLV3p
 IbtSs2c6+mOp0J4Qg2WnET15lEKl3g/BPWztmy9be0IQiAH5qV8Fs3GYmQGjow3GTwdZ
 77nl9rDpzIJuaxNNfSJe3LyACtKBt3cuB53O2TpphtrZ52yJjxFytYCLcCUcxuAnoN2J
 0IMhGJfREq3FqBDrhOm1266/WCKLM1kqXAM8TnhvADcIcWigXhae1L6iap5xxZRkGnWD
 bcKw==
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
 linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-sh@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogQmFydG9zeiBHb2xhc3pld3NraSA8YmdvbGFzemV3c2tpQGJheWxpYnJlLmNvbT4KCklu
c3RlYWQgb2YgZGVyZWZlcmVuY2luZyBwZGV2IGVhY2ggdGltZSwgdXNlIGEgaGVscGVyIHZhcmlh
YmxlIGZvcgp0aGUgYXNzb2NpYXRlZCBkZXZpY2UgcG9pbnRlci4KClNpZ25lZC1vZmYtYnk6IEJh
cnRvc3ogR29sYXN6ZXdza2kgPGJnb2xhc3pld3NraUBiYXlsaWJyZS5jb20+ClJldmlld2VkLWJ5
OiBMaW51cyBXYWxsZWlqIDxsaW51cy53YWxsZWlqQGxpbmFyby5vcmc+ClJldmlld2VkLWJ5OiBE
YW5pZWwgVGhvbXBzb24gPGRhbmllbC50aG9tcHNvbkBsaW5hcm8ub3JnPgpSZXZpZXdlZC1ieTog
QW5keSBTaGV2Y2hlbmtvIDxhbmRyaXkuc2hldmNoZW5rb0BsaW51eC5pbnRlbC5jb20+Ci0tLQog
ZHJpdmVycy92aWRlby9iYWNrbGlnaHQvZ3Bpb19iYWNrbGlnaHQuYyB8IDE5ICsrKysrKysrKy0t
LS0tLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCA5IGluc2VydGlvbnMoKyksIDEwIGRlbGV0aW9ucygt
KQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvdmlkZW8vYmFja2xpZ2h0L2dwaW9fYmFja2xpZ2h0LmMg
Yi9kcml2ZXJzL3ZpZGVvL2JhY2tsaWdodC9ncGlvX2JhY2tsaWdodC5jCmluZGV4IGNkNmE3NWJj
YTljYy4uN2RjNGY5MGQ5MjZiIDEwMDY0NAotLS0gYS9kcml2ZXJzL3ZpZGVvL2JhY2tsaWdodC9n
cGlvX2JhY2tsaWdodC5jCisrKyBiL2RyaXZlcnMvdmlkZW8vYmFja2xpZ2h0L2dwaW9fYmFja2xp
Z2h0LmMKQEAgLTU0LDI5ICs1NCwyOSBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IGJhY2tsaWdodF9v
cHMgZ3Bpb19iYWNrbGlnaHRfb3BzID0gewogCiBzdGF0aWMgaW50IGdwaW9fYmFja2xpZ2h0X3By
b2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCiB7Ci0Jc3RydWN0IGdwaW9fYmFja2xp
Z2h0X3BsYXRmb3JtX2RhdGEgKnBkYXRhID0KLQkJZGV2X2dldF9wbGF0ZGF0YSgmcGRldi0+ZGV2
KTsKKwlzdHJ1Y3QgZGV2aWNlICpkZXYgPSAmcGRldi0+ZGV2OworCXN0cnVjdCBncGlvX2JhY2ts
aWdodF9wbGF0Zm9ybV9kYXRhICpwZGF0YSA9IGRldl9nZXRfcGxhdGRhdGEoZGV2KTsKIAlzdHJ1
Y3QgYmFja2xpZ2h0X3Byb3BlcnRpZXMgcHJvcHM7CiAJc3RydWN0IGJhY2tsaWdodF9kZXZpY2Ug
KmJsOwogCXN0cnVjdCBncGlvX2JhY2tsaWdodCAqZ2JsOwogCWVudW0gZ3Bpb2RfZmxhZ3MgZmxh
Z3M7CiAJaW50IHJldCwgZGVmX3ZhbHVlOwogCi0JZ2JsID0gZGV2bV9remFsbG9jKCZwZGV2LT5k
ZXYsIHNpemVvZigqZ2JsKSwgR0ZQX0tFUk5FTCk7CisJZ2JsID0gZGV2bV9remFsbG9jKGRldiwg
c2l6ZW9mKCpnYmwpLCBHRlBfS0VSTkVMKTsKIAlpZiAoZ2JsID09IE5VTEwpCiAJCXJldHVybiAt
RU5PTUVNOwogCiAJaWYgKHBkYXRhKQogCQlnYmwtPmZiZGV2ID0gcGRhdGEtPmZiZGV2OwogCi0J
ZGVmX3ZhbHVlID0gZGV2aWNlX3Byb3BlcnR5X3JlYWRfYm9vbCgmcGRldi0+ZGV2LCAiZGVmYXVs
dC1vbiIpOworCWRlZl92YWx1ZSA9IGRldmljZV9wcm9wZXJ0eV9yZWFkX2Jvb2woZGV2LCAiZGVm
YXVsdC1vbiIpOwogCWZsYWdzID0gZGVmX3ZhbHVlID8gR1BJT0RfT1VUX0hJR0ggOiBHUElPRF9P
VVRfTE9XOwogCi0JZ2JsLT5ncGlvZCA9IGRldm1fZ3Bpb2RfZ2V0KCZwZGV2LT5kZXYsIE5VTEws
IGZsYWdzKTsKKwlnYmwtPmdwaW9kID0gZGV2bV9ncGlvZF9nZXQoZGV2LCBOVUxMLCBmbGFncyk7
CiAJaWYgKElTX0VSUihnYmwtPmdwaW9kKSkgewogCQlyZXQgPSBQVFJfRVJSKGdibC0+Z3Bpb2Qp
OwogCQlpZiAocmV0ICE9IC1FUFJPQkVfREVGRVIpIHsKLQkJCWRldl9lcnIoJnBkZXYtPmRldiwK
KwkJCWRldl9lcnIoZGV2LAogCQkJCSJFcnJvcjogVGhlIGdwaW9zIHBhcmFtZXRlciBpcyBtaXNz
aW5nIG9yIGludmFsaWQuXG4iKTsKIAkJfQogCQlyZXR1cm4gcmV0OwpAQCAtODUsMTEgKzg1LDEw
IEBAIHN0YXRpYyBpbnQgZ3Bpb19iYWNrbGlnaHRfcHJvYmUoc3RydWN0IHBsYXRmb3JtX2Rldmlj
ZSAqcGRldikKIAltZW1zZXQoJnByb3BzLCAwLCBzaXplb2YocHJvcHMpKTsKIAlwcm9wcy50eXBl
ID0gQkFDS0xJR0hUX1JBVzsKIAlwcm9wcy5tYXhfYnJpZ2h0bmVzcyA9IDE7Ci0JYmwgPSBkZXZt
X2JhY2tsaWdodF9kZXZpY2VfcmVnaXN0ZXIoJnBkZXYtPmRldiwgZGV2X25hbWUoJnBkZXYtPmRl
diksCi0JCQkJCSZwZGV2LT5kZXYsIGdibCwgJmdwaW9fYmFja2xpZ2h0X29wcywKLQkJCQkJJnBy
b3BzKTsKKwlibCA9IGRldm1fYmFja2xpZ2h0X2RldmljZV9yZWdpc3RlcihkZXYsIGRldl9uYW1l
KGRldiksIGRldiwgZ2JsLAorCQkJCQkgICAgJmdwaW9fYmFja2xpZ2h0X29wcywgJnByb3BzKTsK
IAlpZiAoSVNfRVJSKGJsKSkgewotCQlkZXZfZXJyKCZwZGV2LT5kZXYsICJmYWlsZWQgdG8gcmVn
aXN0ZXIgYmFja2xpZ2h0XG4iKTsKKwkJZGV2X2VycihkZXYsICJmYWlsZWQgdG8gcmVnaXN0ZXIg
YmFja2xpZ2h0XG4iKTsKIAkJcmV0dXJuIFBUUl9FUlIoYmwpOwogCX0KIAotLSAKMi4yMS4wCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwg
bWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
