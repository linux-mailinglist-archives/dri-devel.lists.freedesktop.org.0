Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 832F04B2E6
	for <lists+dri-devel@lfdr.de>; Wed, 19 Jun 2019 09:12:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B3B36E313;
	Wed, 19 Jun 2019 07:11:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com
 [IPv6:2607:f8b0:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 531AD6E294
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jun 2019 05:27:37 +0000 (UTC)
Received: by mail-pf1-x444.google.com with SMTP id a186so9013630pfa.5
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jun 2019 22:27:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=86+1jUaVqNTDsIoNrTtwtftI7vuyj9YpQeH9VRCoSLE=;
 b=cl+WT7p7NnNnmK/MaCvRQTIIOkbwQmVzkOzW2+AeCU7Fyyb+dt6LUW0tlW8DX6Zalo
 2hNPiqNpwEGFSnGcDgHbUpBNLvDGO3jX3jwg1sG31HL77z1pgfsT7aw3pZeEznJqqCcs
 FqlWjMsHwoIVeuvC2DLdhFv6OdifDbWAF7313zCnmtZBIlLMSKZRAMuPjxnpqznS36YC
 NWFj4YpC7KmI0wpmVZm3Co4BBvOf5Fs4wYEymThFhvJDVsbYQYDvuLgidHWSYRQVD4k0
 G7kLnHoR6T54cu+MSzQi4lIPxsbvGTm49vdJKwRbjTsvdYr+jsjUJ1VzkJNQ1A9a4OE2
 GjDQ==
X-Gm-Message-State: APjAAAVQRJA6P6F2xr3dY4IzYWqmZXdoMCEiQ1dJiWHHizwq8aDbtWkB
 sbZQQFblVNe68hOzryVIw3qQdopWZlU=
X-Google-Smtp-Source: APXvYqy/NwrsbsV8O2WZ1PxlIU6unkeciyb5wSA0toK+1G9xdpATGCjyQnL6B4PUy8Qcm7GoQKtaMQ==
X-Received: by 2002:a17:90a:fa12:: with SMTP id
 cm18mr9111158pjb.137.1560922056542; 
 Tue, 18 Jun 2019 22:27:36 -0700 (PDT)
Received: from localhost.lan (c-24-22-235-96.hsd1.wa.comcast.net.
 [24.22.235.96])
 by smtp.gmail.com with ESMTPSA id l44sm534742pje.29.2019.06.18.22.27.35
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 18 Jun 2019 22:27:35 -0700 (PDT)
From: Andrey Smirnov <andrew.smirnov@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v6 03/15] drm/bridge: tc358767: Simplify polling in
 tc_link_training()
Date: Tue, 18 Jun 2019 22:27:04 -0700
Message-Id: <20190619052716.16831-4-andrew.smirnov@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190619052716.16831-1-andrew.smirnov@gmail.com>
References: <20190619052716.16831-1-andrew.smirnov@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 19 Jun 2019 07:10:14 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=86+1jUaVqNTDsIoNrTtwtftI7vuyj9YpQeH9VRCoSLE=;
 b=ETVjVs570hGEPhX3eVYxNEZszNuvFqfO6FnqddGwV2uWaCOLFWP2xy1Shdhqih4uJ6
 VtJOCup1WNZYUKXc9Stqt9l56xSnsJyrnneXaimRpEd/4GzC3IlQPg+AVPPD6IHlO+z4
 4vUY9g6LEySXPDKRNw+qK9pDDiuFKn9CRzkKIE9FN+JzeMbFUMxenDpe7oPpyZ9pgt6R
 wyrlL+kb6b0OsC+QuynTeH0K/bS7EOV1JXzLmb5KQSSgMrF5IRF6YyT6UeUyHZh1/ofi
 dm9Ac1dpn9VaRMOdb9b+Aqj6IO4VMliYn5AW6/qCM4RP6And7/UVZYdo2IptsIqzvMEo
 FSPw==
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
Cc: Cory Tusar <cory.tusar@zii.aero>, Andrey Smirnov <andrew.smirnov@gmail.com>,
 Andrey Gusakov <andrey.gusakov@cogentembedded.com>,
 linux-kernel@vger.kernel.org, Tomi Valkeinen <tomi.valkeinen@ti.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Chris Healy <cphealy@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

UmVwbGFjZSBleHBsaWNpdCBwb2xsaW5nIGluIHRjX2xpbmtfdHJhaW5pbmcoKSB3aXRoIGVxdWl2
YWxlbnQgY2FsbCB0bwp0Y19wb2xsX3RpbWVvdXQoKSBmb3Igc2ltcGxpY2l0eS4gTm8gZnVuY3Rp
b25hbCBjaGFuZ2UgaW50ZW5kZWQgKG5vdAppbmNsdWRpbmcgc2xpZ2h0bHkgYWx0ZXJlZCBkZWJ1
ZyBvdXRwdXQpLgoKU2lnbmVkLW9mZi1ieTogQW5kcmV5IFNtaXJub3YgPGFuZHJldy5zbWlybm92
QGdtYWlsLmNvbT4KUmV2aWV3ZWQtYnk6IEFuZHJ6ZWogSGFqZGEgPGEuaGFqZGFAc2Ftc3VuZy5j
b20+CkNjOiBBbmRyemVqIEhhamRhIDxhLmhhamRhQHNhbXN1bmcuY29tPgpDYzogTGF1cmVudCBQ
aW5jaGFydCA8TGF1cmVudC5waW5jaGFydEBpZGVhc29uYm9hcmQuY29tPgpDYzogVG9taSBWYWxr
ZWluZW4gPHRvbWkudmFsa2VpbmVuQHRpLmNvbT4KQ2M6IEFuZHJleSBHdXNha292IDxhbmRyZXku
Z3VzYWtvdkBjb2dlbnRlbWJlZGRlZC5jb20+CkNjOiBQaGlsaXBwIFphYmVsIDxwLnphYmVsQHBl
bmd1dHJvbml4LmRlPgpDYzogQ29yeSBUdXNhciA8Y29yeS50dXNhckB6aWkuYWVybz4KQ2M6IENo
cmlzIEhlYWx5IDxjcGhlYWx5QGdtYWlsLmNvbT4KQ2M6IEx1Y2FzIFN0YWNoIDxsLnN0YWNoQHBl
bmd1dHJvbml4LmRlPgpDYzogZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpDYzogbGlu
dXgta2VybmVsQHZnZXIua2VybmVsLm9yZwotLS0KIGRyaXZlcnMvZ3B1L2RybS9icmlkZ2UvdGMz
NTg3NjcuYyB8IDE1ICsrKysrKy0tLS0tLS0tLQogMSBmaWxlIGNoYW5nZWQsIDYgaW5zZXJ0aW9u
cygrKSwgOSBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYnJpZGdl
L3RjMzU4NzY3LmMgYi9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3RjMzU4NzY3LmMKaW5kZXggZjQ2
M2VmNmQ0MjcxLi4zMWY1MDQ1ZTdlNDIgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9icmlk
Z2UvdGMzNTg3NjcuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3RjMzU4NzY3LmMKQEAg
LTc0OCwyMiArNzQ4LDE5IEBAIHN0YXRpYyBpbnQgdGNfc2V0X3ZpZGVvX21vZGUoc3RydWN0IHRj
X2RhdGEgKnRjLAogCiBzdGF0aWMgaW50IHRjX3dhaXRfbGlua190cmFpbmluZyhzdHJ1Y3QgdGNf
ZGF0YSAqdGMpCiB7Ci0JdTMyIHRpbWVvdXQgPSAxMDAwOwogCXUzMiB2YWx1ZTsKIAlpbnQgcmV0
OwogCi0JZG8gewotCQl1ZGVsYXkoMSk7Ci0JCXRjX3JlYWQoRFAwX0xUU1RBVCwgJnZhbHVlKTsK
LQl9IHdoaWxlICgoISh2YWx1ZSAmIExUX0xPT1BET05FKSkgJiYgKC0tdGltZW91dCkpOwotCi0J
aWYgKHRpbWVvdXQgPT0gMCkgeworCXJldCA9IHRjX3BvbGxfdGltZW91dCh0YywgRFAwX0xUU1RB
VCwgTFRfTE9PUERPTkUsCisJCQkgICAgICBMVF9MT09QRE9ORSwgMSwgMTAwMCk7CisJaWYgKHJl
dCkgewogCQlkZXZfZXJyKHRjLT5kZXYsICJMaW5rIHRyYWluaW5nIHRpbWVvdXQgd2FpdGluZyBm
b3IgTFRfTE9PUERPTkUhXG4iKTsKLQkJcmV0dXJuIC1FVElNRURPVVQ7CisJCXJldHVybiByZXQ7
CiAJfQogCi0JcmV0dXJuICh2YWx1ZSA+PiA4KSAmIDB4NzsKKwl0Y19yZWFkKERQMF9MVFNUQVQs
ICZ2YWx1ZSk7CiAKKwlyZXR1cm4gKHZhbHVlID4+IDgpICYgMHg3OwogZXJyOgogCXJldHVybiBy
ZXQ7CiB9Ci0tIAoyLjIxLjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Ry
aS1kZXZlbA==
