Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 04308101B1B
	for <lists+dri-devel@lfdr.de>; Tue, 19 Nov 2019 09:07:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A5F6F6EBFD;
	Tue, 19 Nov 2019 08:06:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com
 [IPv6:2a00:1450:4864:20::144])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 43B026E81F
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Nov 2019 20:05:43 +0000 (UTC)
Received: by mail-lf1-x144.google.com with SMTP id q28so953978lfp.2
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Nov 2019 12:05:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=PMxRk5+wnUUg0iU/ONgQRtpatlCjk39x02NkmMcM4Ic=;
 b=aft+xKkgHHX+kQgvvCjsOYlVB4rnqnTL05jCKBd0uywfTwpzvVjCLtoQ1ZTLoKUYqD
 3BrP7GFpdMSSYinJKNg9egSu1y0unYSmHORS9SJfjeWEqd0Y6AH0tVrA50aLmqY6Eb2f
 NQyEgEfnzIVqMTan3duO68dCNaYFVilo58hcZ2VuZbMFt4YUGRUuVtlyDV5dXlZ0KncE
 90Jp3sikmeJ2D1VoRmYOIjB4vn6Dw4TiUaVzbryBwnKYyaKjI3dX/zOroG6AzaOYXg4F
 4u7oHWi0G63QzU6Tkw76su10N6cmn6AUYWwZx9qyqTXDxpw1Gti1ThOb7D22kruHzpSA
 v4eQ==
X-Gm-Message-State: APjAAAWWxIMkcXvJKHIjm6jcjrv+BkcmvpiH/9ufsjHftbAdBzFCqUNg
 OkCzlAraC7OmqWrDCuPA7As=
X-Google-Smtp-Source: APXvYqxI6wtsMLrnPYDhgtHFQ96AQeDXAE5xVarMIEaB4V3z7umv4UaozwQFe4A1nX3jMF6rUUD+hg==
X-Received: by 2002:ac2:5305:: with SMTP id c5mr836180lfh.55.1574107541746;
 Mon, 18 Nov 2019 12:05:41 -0800 (PST)
Received: from localhost.localdomain (79-139-233-37.dynamic.spd-mgts.ru.
 [79.139.233.37])
 by smtp.gmail.com with ESMTPSA id j23sm9166942lji.41.2019.11.18.12.05.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Nov 2019 12:05:41 -0800 (PST)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Peter De Schrijver <pdeschrijver@nvidia.com>,
 Mikko Perttunen <mperttunen@nvidia.com>,
 Georgi Djakov <georgi.djakov@linaro.org>, Rob Herring <robh+dt@kernel.org>
Subject: [PATCH v1 11/29] ARM: tegra: Add interconnect properties to Tegra124
 device-tree
Date: Mon, 18 Nov 2019 23:02:29 +0300
Message-Id: <20191118200247.3567-12-digetx@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191118200247.3567-1-digetx@gmail.com>
References: <20191118200247.3567-1-digetx@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 19 Nov 2019 08:04:07 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=PMxRk5+wnUUg0iU/ONgQRtpatlCjk39x02NkmMcM4Ic=;
 b=nRsVcOLkGpoI+usSPfWzjgGrZRyGz9Uw6yP5tIZ3+LTQWwYscK1o8N0cIZ4QkjUxpe
 zXSliUsXnlexkVtiS8WWBVBtlsqa4Eo3q0CdEipr5fPHJnUx92Fms2aQ4yJboTCaU8NR
 g7nf3baq7mFKbPAx+g+zAYL4QaQizn02Fg/63P59KCM8+BhAW+WVI9HWUWKXk5qoJTPe
 cWn9XoH2aF3TFjzlWKpJT7ZDxG1Pyl+aR7z7KBHGvlgIiqMo1G1MKfdNtEpnU2A/XWPg
 /kp9ymh20a8EKwQtzJawJ7gSCRswOkBxRnwtS8N3K1LJctrePj4FHXv8V6rxPK84R4np
 /b1w==
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
Cc: linux-tegra@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-pm@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QWRkIGludGVyY29ubmVjdCBwcm9wZXJ0aWVzIHRvIHRoZSBtZW1vcnkgY29udHJvbGxlciwgZXh0
ZXJuYWwgbWVtb3J5CmNvbnRyb2xsZXIgYW5kIHRoZSBkaXNwbGF5IGNvbnRyb2xsZXIgbm9kZXMg
dG8gZGVzY3JpYmUgaW50ZXJjb25uZWN0aW9uCm9mIHRoZXNlIG5vZGVzLgoKU2lnbmVkLW9mZi1i
eTogRG1pdHJ5IE9zaXBlbmtvIDxkaWdldHhAZ21haWwuY29tPgotLS0KIGFyY2gvYXJtL2Jvb3Qv
ZHRzL3RlZ3JhMTI0LmR0c2kgfCAxMCArKysrKysrKysrCiAxIGZpbGUgY2hhbmdlZCwgMTAgaW5z
ZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2FyY2gvYXJtL2Jvb3QvZHRzL3RlZ3JhMTI0LmR0c2kg
Yi9hcmNoL2FybS9ib290L2R0cy90ZWdyYTEyNC5kdHNpCmluZGV4IDQxM2JmYjk4MWRlOC4uNTA2
OWFmMzAxMWNjIDEwMDY0NAotLS0gYS9hcmNoL2FybS9ib290L2R0cy90ZWdyYTEyNC5kdHNpCisr
KyBiL2FyY2gvYXJtL2Jvb3QvZHRzL3RlZ3JhMTI0LmR0c2kKQEAgLTMsNiArMyw3IEBACiAjaW5j
bHVkZSA8ZHQtYmluZGluZ3MvZ3Bpby90ZWdyYS1ncGlvLmg+CiAjaW5jbHVkZSA8ZHQtYmluZGlu
Z3MvbWVtb3J5L3RlZ3JhMTI0LW1jLmg+CiAjaW5jbHVkZSA8ZHQtYmluZGluZ3MvcGluY3RybC9w
aW5jdHJsLXRlZ3JhLmg+CisjaW5jbHVkZSA8ZHQtYmluZGluZ3MvaW50ZXJjb25uZWN0L3RlZ3Jh
LWljYy5oPgogI2luY2x1ZGUgPGR0LWJpbmRpbmdzL2ludGVycnVwdC1jb250cm9sbGVyL2FybS1n
aWMuaD4KICNpbmNsdWRlIDxkdC1iaW5kaW5ncy9yZXNldC90ZWdyYTEyNC1jYXIuaD4KICNpbmNs
dWRlIDxkdC1iaW5kaW5ncy90aGVybWFsL3RlZ3JhMTI0LXNvY3RoZXJtLmg+CkBAIC0xMTEsNiAr
MTEyLDkgQEAKIAkJCWlvbW11cyA9IDwmbWMgVEVHUkFfU1dHUk9VUF9EQz47CiAKIAkJCW52aWRp
YSxoZWFkID0gPDA+OworCisJCQlpbnRlcmNvbm5lY3RzID0gPCZtYyBURUdSQV9JQ0NfTUNfREMg
JmVtYyBURUdSQV9JQ0NfRU1FTT47CisJCQlpbnRlcmNvbm5lY3QtbmFtZXMgPSAiZG1hLW1lbSI7
CiAJCX07CiAKIAkJZGNANTQyNDAwMDAgewpAQCAtMTI2LDYgKzEzMCw5IEBACiAJCQlpb21tdXMg
PSA8Jm1jIFRFR1JBX1NXR1JPVVBfRENCPjsKIAogCQkJbnZpZGlhLGhlYWQgPSA8MT47CisKKwkJ
CWludGVyY29ubmVjdHMgPSA8Jm1jIFRFR1JBX0lDQ19NQ19EQ0IgJmVtYyBURUdSQV9JQ0NfRU1F
TT47CisJCQlpbnRlcmNvbm5lY3QtbmFtZXMgPSAiZG1hLW1lbSI7CiAJCX07CiAKIAkJaGRtaTog
aGRtaUA1NDI4MDAwMCB7CkBAIC02MjAsNiArNjI3LDcgQEAKIAkJaW50ZXJydXB0cyA9IDxHSUNf
U1BJIDc3IElSUV9UWVBFX0xFVkVMX0hJR0g+OwogCiAJCSNpb21tdS1jZWxscyA9IDwxPjsKKwkJ
I2ludGVyY29ubmVjdC1jZWxscyA9IDwxPjsKIAl9OwogCiAJZW1jOiBlbWNANzAwMWIwMDAgewpA
QCAtNjI3LDYgKzYzNSw4IEBACiAJCXJlZyA9IDwweDAgMHg3MDAxYjAwMCAweDAgMHgxMDAwPjsK
IAogCQludmlkaWEsbWVtb3J5LWNvbnRyb2xsZXIgPSA8Jm1jPjsKKworCQkjaW50ZXJjb25uZWN0
LWNlbGxzID0gPDE+OwogCX07CiAKIAlzYXRhQDcwMDIwMDAwIHsKLS0gCjIuMjMuMAoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxp
bmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
