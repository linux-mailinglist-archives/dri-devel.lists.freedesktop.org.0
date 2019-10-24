Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EE3ECE38C8
	for <lists+dri-devel@lfdr.de>; Thu, 24 Oct 2019 18:47:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B31F6E532;
	Thu, 24 Oct 2019 16:46:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 585216E503
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Oct 2019 16:46:33 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id v9so15587284wrq.5
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Oct 2019 09:46:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=J+teLrDmUq/g4c7wc3+RbjUGyVD2T7B6IPhjV4FrY+o=;
 b=f5br7k/8uS5k52zu6tRdgMK8wdRxL6CICBQ4UTBZsrVMqfo+qxoojr7MMB2GSo2mV3
 uA5Fp2cfrprvK/rlz58qMV3WIKyHc6GRbwO4pdJySjuDRzm9yUcBbOMOVjM3k1nb5YVW
 O32MR0g9Juuo/3D6D3YBKTvzYl0XccQfaf1xYDW3ISP265We63NjggeVVnqcuwfZh4bo
 ZVCR46mtYXhXVyIoRPPPGkvK9N+jfex5uXCOTJLRhUyYIg1mMpK3oyBVJSblGhsFzs4F
 PUaIM8h8+hPWg6DN/eOb8qllZA3pNVuqaDqQP8wdV2Mt27PgfEAFSbX4N1qIoXuEcAXb
 Lefw==
X-Gm-Message-State: APjAAAUSJoLPIKU5p7iL6AkMcDS+iUroZQidYcy1PMG0EVoQjfh/N0Tk
 jpyEeJm2kUO8aTcc6e4p9zVJsn+T
X-Google-Smtp-Source: APXvYqxILzNyOiSXsbSp1f4vtgYmepdyNF/ujbe8i31SrmYnTTz3zGzE96FmDDaPMXk7zs4FolzQig==
X-Received: by 2002:a5d:638f:: with SMTP id p15mr4963666wru.150.1571935591737; 
 Thu, 24 Oct 2019 09:46:31 -0700 (PDT)
Received: from localhost (p2E5BE2CE.dip0.t-ipconnect.de. [46.91.226.206])
 by smtp.gmail.com with ESMTPSA id r1sm19783003wrw.60.2019.10.24.09.46.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Oct 2019 09:46:30 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH 24/32] drm/tegra: sor: Implement pad clock for all SOR
 instances
Date: Thu, 24 Oct 2019 18:45:26 +0200
Message-Id: <20191024164534.132764-25-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191024164534.132764-1-thierry.reding@gmail.com>
References: <20191024164534.132764-1-thierry.reding@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=J+teLrDmUq/g4c7wc3+RbjUGyVD2T7B6IPhjV4FrY+o=;
 b=NyyAEeonT461+ilpnoe9F3HqNKX94i5GlETWA3k3XcYZKsdNMiUKnSvbP/5deI4iKW
 ubNd2lZ9FTtDB+me9TNBpM9TiJy4UfNEHxQewT6OlHkvyePtViLsc7DzByadrucAw0kd
 Hr5fU9cLv0L+o2Pf3mdcnZum/u5tDcmKuVXFmz2+vnidYUhcqdX/IYTTDUiAGSRCEiNT
 JSHwpRAjc9vl4ppV7Ak0KuUZliyhLF+mgv+X6SsOm2SCkCy43viXwwHozx+G4OLDeRt6
 72J7ASNqun16rvb7fu1aHSMD2p38wPvNMPizTqreKikFzsKh46DxFGP+WYzn7jt63gNp
 IHYg==
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
Cc: linux-tegra@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogVGhpZXJyeSBSZWRpbmcgPHRyZWRpbmdAbnZpZGlhLmNvbT4KClNvIGZhciB0aGUgcGFk
IGNsb2NrIHdhcyBvbmx5IG5lZWRlZCBvbiB0aGUgc2Vjb25kIFNPUiBpbnN0YW5jZS4gVGhlCmNs
b2NrIGRvZXMgZXhpc3QgZm9yIGFsbCBTT1IgaW5zdGFuY2VzLCB0aG91Z2gsIHNvIG1ha2Ugc3Vy
ZSBpdCBpcwphbHdheXMgaW1wbGVtZW50ZWQuIFRoaXMgcHJlcGFyZXMgZm9yIGZ1cnRoZXIgdW5p
ZmljYXRpb24gb2YgdGhlIGNvZGUKaW4gc3Vic2VxdWVudCBwYXRjaGVzLgoKU2lnbmVkLW9mZi1i
eTogVGhpZXJyeSBSZWRpbmcgPHRyZWRpbmdAbnZpZGlhLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9k
cm0vdGVncmEvc29yLmMgfCAyMCArKysrKysrKysrKysrKy0tLS0tLQogMSBmaWxlIGNoYW5nZWQs
IDE0IGluc2VydGlvbnMoKyksIDYgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9n
cHUvZHJtL3RlZ3JhL3Nvci5jIGIvZHJpdmVycy9ncHUvZHJtL3RlZ3JhL3Nvci5jCmluZGV4IGM3
ZmFmMDg4Y2FiYy4uNzFhN2VkNTdjYjRmIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vdGVn
cmEvc29yLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL3RlZ3JhL3Nvci5jCkBAIC01MjIsOCArNTIy
LDkgQEAgc3RhdGljIGlubGluZSBzdHJ1Y3QgdGVncmFfY2xrX3Nvcl9wYWQgKnRvX3BhZChzdHJ1
Y3QgY2xrX2h3ICpodykKIAlyZXR1cm4gY29udGFpbmVyX29mKGh3LCBzdHJ1Y3QgdGVncmFfY2xr
X3Nvcl9wYWQsIGh3KTsKIH0KIAotc3RhdGljIGNvbnN0IGNoYXIgKiBjb25zdCB0ZWdyYV9jbGtf
c29yX3BhZF9wYXJlbnRzW10gPSB7Ci0JInBsbF9kMl9vdXQwIiwgInBsbF9kcCIKK3N0YXRpYyBj
b25zdCBjaGFyICogY29uc3QgdGVncmFfY2xrX3Nvcl9wYWRfcGFyZW50c1syXVsyXSA9IHsKKwl7
ICJwbGxfZF9vdXQwIiwgInBsbF9kcCIgfSwKKwl7ICJwbGxfZDJfb3V0MCIsICJwbGxfZHAiIH0s
CiB9OwogCiBzdGF0aWMgaW50IHRlZ3JhX2Nsa19zb3JfcGFkX3NldF9wYXJlbnQoc3RydWN0IGNs
a19odyAqaHcsIHU4IGluZGV4KQpAQCAtNTk0LDggKzU5NSw4IEBAIHN0YXRpYyBzdHJ1Y3QgY2xr
ICp0ZWdyYV9jbGtfc29yX3BhZF9yZWdpc3RlcihzdHJ1Y3QgdGVncmFfc29yICpzb3IsCiAKIAlp
bml0Lm5hbWUgPSBuYW1lOwogCWluaXQuZmxhZ3MgPSAwOwotCWluaXQucGFyZW50X25hbWVzID0g
dGVncmFfY2xrX3Nvcl9wYWRfcGFyZW50czsKLQlpbml0Lm51bV9wYXJlbnRzID0gQVJSQVlfU0la
RSh0ZWdyYV9jbGtfc29yX3BhZF9wYXJlbnRzKTsKKwlpbml0LnBhcmVudF9uYW1lcyA9IHRlZ3Jh
X2Nsa19zb3JfcGFkX3BhcmVudHNbc29yLT5pbmRleF07CisJaW5pdC5udW1fcGFyZW50cyA9IEFS
UkFZX1NJWkUodGVncmFfY2xrX3Nvcl9wYWRfcGFyZW50c1tzb3ItPmluZGV4XSk7CiAJaW5pdC5v
cHMgPSAmdGVncmFfY2xrX3Nvcl9wYWRfb3BzOwogCiAJcGFkLT5ody5pbml0ID0gJmluaXQ7CkBA
IC00MDE2LDYgKzQwMTcsOCBAQCBzdGF0aWMgaW50IHRlZ3JhX3Nvcl9wcm9iZShzdHJ1Y3QgcGxh
dGZvcm1fZGV2aWNlICpwZGV2KQogCSAqIHBhZCBvdXRwdXQgY2xvY2suCiAJICovCiAJaWYgKCFz
b3ItPmNsa19wYWQpIHsKKwkJY2hhciAqbmFtZTsKKwogCQllcnIgPSBwbV9ydW50aW1lX2dldF9z
eW5jKCZwZGV2LT5kZXYpOwogCQlpZiAoZXJyIDwgMCkgewogCQkJZGV2X2VycigmcGRldi0+ZGV2
LCAiZmFpbGVkIHRvIGdldCBydW50aW1lIFBNOiAlZFxuIiwKQEAgLTQwMjMsOCArNDAyNiwxMyBA
QCBzdGF0aWMgaW50IHRlZ3JhX3Nvcl9wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2
KQogCQkJZ290byByZW1vdmU7CiAJCX0KIAotCQlzb3ItPmNsa19wYWQgPSB0ZWdyYV9jbGtfc29y
X3BhZF9yZWdpc3Rlcihzb3IsCi0JCQkJCQkJICAic29yMV9wYWRfY2xrb3V0Iik7CisJCW5hbWUg
PSBkZXZtX2thc3ByaW50ZigmcGRldi0+ZGV2LCBHRlBfS0VSTkVMLCAic29yJXVfcGFkX2Nsa291
dCIsIHNvci0+aW5kZXgpOworCQlpZiAoIW5hbWUpIHsKKwkJCWVyciA9IC1FTk9NRU07CisJCQln
b3RvIHJlbW92ZTsKKwkJfQorCisJCXNvci0+Y2xrX3BhZCA9IHRlZ3JhX2Nsa19zb3JfcGFkX3Jl
Z2lzdGVyKHNvciwgbmFtZSk7CiAJCXBtX3J1bnRpbWVfcHV0KCZwZGV2LT5kZXYpOwogCX0KIAot
LSAKMi4yMy4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
aHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
