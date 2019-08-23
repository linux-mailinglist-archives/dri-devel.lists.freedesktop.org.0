Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B4149A543
	for <lists+dri-devel@lfdr.de>; Fri, 23 Aug 2019 04:12:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 680476EB21;
	Fri, 23 Aug 2019 02:12:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f193.google.com (mail-oi1-f193.google.com
 [209.85.167.193])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0AB856EB21
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Aug 2019 02:12:22 +0000 (UTC)
Received: by mail-oi1-f193.google.com with SMTP id a127so5929085oii.2
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Aug 2019 19:12:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=fYbwrgvdXN8jjHtFDjFYgPFUHMXy/bFl85EmNqO4GoA=;
 b=tye3nwEsNxKHAwaBrGEfxPn74NCiu+2Vb9sHQkrrD8C2sFEMEtWPpwAN1erZvKPi8l
 jXhNxZWwQfm9LVt6ArqokHV52cNjOBrVcD9d6Pbhm7r++IwgBipPlUUiFSbDV2IsECT4
 uNUZY8064PGfBZLFWTpVqUW1aYICUPoHsCu54+Jj4N8mg8deO2nbOHiUiBbjlG69JETT
 EvK1k5G5HoCGAnRUnqCjmjwidhOg67MBontTblizGgPH+OTd8n9Lz5ULTN7tHbH0BQBs
 cftlyO91h0A/NAcGLAO10lJ5LbqrIhsgudSNvafOUTf/PsEN4MALh54z2UKgnEGdmrYv
 xGLQ==
X-Gm-Message-State: APjAAAUruB81TjmaYp1+5GP7mhrRiEO17VpwNHrRTFl8KESuwomE1jDp
 ptSq5LHZBGipvX3+RWpi9sfyMbs=
X-Google-Smtp-Source: APXvYqxJUCpP4bsc6Alog7GWQf8izkthXYaAczmSdeGCBlBSuGJfCHpbt+1KD3CwW4BGYMH2k74BEg==
X-Received: by 2002:aca:eb85:: with SMTP id j127mr1554378oih.177.1566526340953; 
 Thu, 22 Aug 2019 19:12:20 -0700 (PDT)
Received: from xps15.herring.priv (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.googlemail.com with ESMTPSA id c1sm457747oic.31.2019.08.22.19.12.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Aug 2019 19:12:20 -0700 (PDT)
From: Rob Herring <robh@kernel.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 2/8] drm/panfrost: Rework runtime PM initialization
Date: Thu, 22 Aug 2019 21:12:10 -0500
Message-Id: <20190823021216.5862-3-robh@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190823021216.5862-1-robh@kernel.org>
References: <20190823021216.5862-1-robh@kernel.org>
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
Cc: Maxime Ripard <maxime.ripard@bootlin.com>,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>, David Airlie <airlied@linux.ie>,
 Sean Paul <sean@poorly.run>, Steven Price <steven.price@arm.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Robin Murphy <robin.murphy@arm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhlcmUncyBhIGZldyBpc3N1ZXMgd2l0aCB0aGUgcnVudGltZSBQTSBpbml0aWFsaXphdGlvbi4K
ClRoZSBkb2N1bWVudGF0aW9uIHN0YXRlcyBwbV9ydW50aW1lX3NldF9hY3RpdmUoKSBzaG91bGQg
YmUgY2FsbGVkIGJlZm9yZQpwbV9ydW50aW1lX2VuYWJsZSgpLiBUaGUgcG1fcnVudGltZV9wdXRf
YXV0b3N1c3BlbmQoKSBjb3VsZCBzdXNwZW5kIHRoZSBHUFUKYmVmb3JlIHBhbmZyb3N0X3BlcmZj
bnRfaW5pdCgpIGlzIGNhbGxlZCB3aGljaCB0b3VjaGVzIHRoZSBoL3cuIFRoZQphdXRvc3VzcGVu
ZCBkZWxheSBrZWVwcyB0aGluZ3MgZnJvbSBicmVha2luZy4gVGhlcmUncyBubyBuZWVkIGV4cGxp
Y2l0bHkKcG93ZXIgb2ZmIHRoZSBHUFUgb25seSB0byB3YWtlIGJhY2sgdXAgd2l0aCBwbV9ydW50
aW1lX2dldF9zeW5jKCkuIEp1c3QKZGVsYXlpbmcgcG1fcnVudGltZV9lbmFibGUgdG8gdGhlIGVu
ZCBvZiBwcm9iZSBpcyBzdWZmaWNpZW50LgoKTGV0cyBtb3ZlIGFsbCB0aGUgcnVudGltZSBQTSBj
YWxscyBpbnRvIHRoZSBwcm9iZSgpIGZ1bmN0aW9uIHNvIHRoZXkgYXJlCmFsbCBpbiBvbmUgcGxh
Y2UgYW5kIGFyZSBkb25lIGFmdGVyIGFsbCBpbml0aWFsaXphdGlvbi4KCkNjOiBUb21ldSBWaXpv
c28gPHRvbWV1LnZpem9zb0Bjb2xsYWJvcmEuY29tPgpDYzogU3RldmVuIFByaWNlIDxzdGV2ZW4u
cHJpY2VAYXJtLmNvbT4KQ2M6IEFseXNzYSBSb3Nlbnp3ZWlnIDxhbHlzc2Eucm9zZW56d2VpZ0Bj
b2xsYWJvcmEuY29tPgpDYzogRGF2aWQgQWlybGllIDxhaXJsaWVkQGxpbnV4LmllPgpDYzogRGFu
aWVsIFZldHRlciA8ZGFuaWVsQGZmd2xsLmNoPgpTaWduZWQtb2ZmLWJ5OiBSb2IgSGVycmluZyA8
cm9iaEBrZXJuZWwub3JnPgotLS0KdjI6IG5ldyBwYXRjaAoKIGRyaXZlcnMvZ3B1L2RybS9wYW5m
cm9zdC9wYW5mcm9zdF9kZXZpY2UuYyB8ICA5IC0tLS0tLS0tLQogZHJpdmVycy9ncHUvZHJtL3Bh
bmZyb3N0L3BhbmZyb3N0X2Rydi5jICAgIHwgMTAgKysrKysrLS0tLQogMiBmaWxlcyBjaGFuZ2Vk
LCA2IGluc2VydGlvbnMoKyksIDEzIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMv
Z3B1L2RybS9wYW5mcm9zdC9wYW5mcm9zdF9kZXZpY2UuYyBiL2RyaXZlcnMvZ3B1L2RybS9wYW5m
cm9zdC9wYW5mcm9zdF9kZXZpY2UuYwppbmRleCA0ZGE3MWJiNTZjMjAuLjczODA1MjEwODM0ZSAx
MDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL3BhbmZyb3N0L3BhbmZyb3N0X2RldmljZS5jCisr
KyBiL2RyaXZlcnMvZ3B1L2RybS9wYW5mcm9zdC9wYW5mcm9zdF9kZXZpY2UuYwpAQCAtNSw3ICs1
LDYgQEAKICNpbmNsdWRlIDxsaW51eC9jbGsuaD4KICNpbmNsdWRlIDxsaW51eC9yZXNldC5oPgog
I2luY2x1ZGUgPGxpbnV4L3BsYXRmb3JtX2RldmljZS5oPgotI2luY2x1ZGUgPGxpbnV4L3BtX3J1
bnRpbWUuaD4KICNpbmNsdWRlIDxsaW51eC9yZWd1bGF0b3IvY29uc3VtZXIuaD4KIAogI2luY2x1
ZGUgInBhbmZyb3N0X2RldmljZS5oIgpAQCAtMTY2LDE0ICsxNjUsNiBAQCBpbnQgcGFuZnJvc3Rf
ZGV2aWNlX2luaXQoc3RydWN0IHBhbmZyb3N0X2RldmljZSAqcGZkZXYpCiAJaWYgKGVycikKIAkJ
Z290byBlcnJfb3V0NDsKIAotCS8qIHJ1bnRpbWUgUE0gd2lsbCB3YWtlIHVzIHVwIGxhdGVyICov
Ci0JcGFuZnJvc3RfZ3B1X3Bvd2VyX29mZihwZmRldik7Ci0KLQlwbV9ydW50aW1lX3NldF9hY3Rp
dmUocGZkZXYtPmRldik7Ci0JcG1fcnVudGltZV9nZXRfc3luYyhwZmRldi0+ZGV2KTsKLQlwbV9y
dW50aW1lX21hcmtfbGFzdF9idXN5KHBmZGV2LT5kZXYpOwotCXBtX3J1bnRpbWVfcHV0X2F1dG9z
dXNwZW5kKHBmZGV2LT5kZXYpOwotCiAJZXJyID0gcGFuZnJvc3RfcGVyZmNudF9pbml0KHBmZGV2
KTsKIAlpZiAoZXJyKQogCQlnb3RvIGVycl9vdXQ1OwpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUv
ZHJtL3BhbmZyb3N0L3BhbmZyb3N0X2Rydi5jIGIvZHJpdmVycy9ncHUvZHJtL3BhbmZyb3N0L3Bh
bmZyb3N0X2Rydi5jCmluZGV4IGQ3NDQ0MmQ3MTA0OC4uZjI3ZTNkNmFlYzEyIDEwMDY0NAotLS0g
YS9kcml2ZXJzL2dwdS9kcm0vcGFuZnJvc3QvcGFuZnJvc3RfZHJ2LmMKKysrIGIvZHJpdmVycy9n
cHUvZHJtL3BhbmZyb3N0L3BhbmZyb3N0X2Rydi5jCkBAIC01MjMsMTAgKzUyMyw2IEBAIHN0YXRp
YyBpbnQgcGFuZnJvc3RfcHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikKIAltdXRl
eF9pbml0KCZwZmRldi0+c2hyaW5rZXJfbG9jayk7CiAJSU5JVF9MSVNUX0hFQUQoJnBmZGV2LT5z
aHJpbmtlcl9saXN0KTsKIAotCXBtX3J1bnRpbWVfdXNlX2F1dG9zdXNwZW5kKHBmZGV2LT5kZXYp
OwotCXBtX3J1bnRpbWVfc2V0X2F1dG9zdXNwZW5kX2RlbGF5KHBmZGV2LT5kZXYsIDUwKTsgLyog
fjMgZnJhbWVzICovCi0JcG1fcnVudGltZV9lbmFibGUocGZkZXYtPmRldik7Ci0KIAllcnIgPSBw
YW5mcm9zdF9kZXZpY2VfaW5pdChwZmRldik7CiAJaWYgKGVycikgewogCQlpZiAoZXJyICE9IC1F
UFJPQkVfREVGRVIpCkBAIC01NDEsNiArNTM3LDEyIEBAIHN0YXRpYyBpbnQgcGFuZnJvc3RfcHJv
YmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikKIAkJZ290byBlcnJfb3V0MTsKIAl9CiAK
KwlwbV9ydW50aW1lX3NldF9hY3RpdmUocGZkZXYtPmRldik7CisJcG1fcnVudGltZV91c2VfYXV0
b3N1c3BlbmQocGZkZXYtPmRldik7CisJcG1fcnVudGltZV9zZXRfYXV0b3N1c3BlbmRfZGVsYXko
cGZkZXYtPmRldiwgMCk7IC8qIH4zIGZyYW1lcyAqLworCXBtX3J1bnRpbWVfbWFya19sYXN0X2J1
c3kocGZkZXYtPmRldik7CisJcG1fcnVudGltZV9lbmFibGUocGZkZXYtPmRldik7CisKIAkvKgog
CSAqIFJlZ2lzdGVyIHRoZSBEUk0gZGV2aWNlIHdpdGggdGhlIGNvcmUgYW5kIHRoZSBjb25uZWN0
b3JzIHdpdGgKIAkgKiBzeXNmcwotLSAKMi4yMC4xCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1h
bi9saXN0aW5mby9kcmktZGV2ZWw=
