Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1976643360
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jun 2019 09:28:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 84923892B9;
	Thu, 13 Jun 2019 07:27:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com
 [IPv6:2607:f8b0:4864:20::643])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 388A589450
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jun 2019 08:33:10 +0000 (UTC)
Received: by mail-pl1-x643.google.com with SMTP id cl9so6318970plb.10
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jun 2019 01:33:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=86+1jUaVqNTDsIoNrTtwtftI7vuyj9YpQeH9VRCoSLE=;
 b=kYRrkamuaS30a5cBPCXujiFlTlP0kLR3Og4PPXJoWEml+BeDKkpLzjK+VrAZKlVg5F
 8KSiV/+QS1yst0QJoMFdklOdsr/I+tFt5L/hZLwJjAVtD91IwY4ti2DpeduHHTd/hoUN
 oyWcJ7TjYOwsdabyA5ytRVtPBJrO1ckdhiROgLnFn5GBYEgD5NP+1kHVdzDPJlCyEpkr
 h9OOXFzOHaS1JcU3yMAkQXLsSW+xXxQQ8/aV3suLnYjDaqfJxhSl2wdyOL1+RRq9yw5w
 5+MrQzoR/9iE1JgdyWdW9kTFS09xb0aEp2vCvyZq3yEUWyTdi+wH//Bi3tXF4S5FM3wT
 +ruw==
X-Gm-Message-State: APjAAAXuEUPalxc8Vbhqfa6BhdhjckwjPL91blvUO2Jb/Wm8meNzuWIL
 mtyqQn4ESZBehHIx0slFooMeZ2iVRUQ=
X-Google-Smtp-Source: APXvYqz0SCfmURsaGbalWFXaoUjBOrIErUa1pYVtdQJwdAbnXXHVgeg0Qtyu/jx9peDXZ5n/wM42Eg==
X-Received: by 2002:a17:902:7246:: with SMTP id
 c6mr20638789pll.248.1560328389392; 
 Wed, 12 Jun 2019 01:33:09 -0700 (PDT)
Received: from localhost.lan (c-24-22-235-96.hsd1.wa.comcast.net.
 [24.22.235.96])
 by smtp.gmail.com with ESMTPSA id d21sm18845991pfr.162.2019.06.12.01.33.07
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 12 Jun 2019 01:33:08 -0700 (PDT)
From: Andrey Smirnov <andrew.smirnov@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v5 03/15] drm/bridge: tc358767: Simplify polling in
 tc_link_training()
Date: Wed, 12 Jun 2019 01:32:40 -0700
Message-Id: <20190612083252.15321-4-andrew.smirnov@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190612083252.15321-1-andrew.smirnov@gmail.com>
References: <20190612083252.15321-1-andrew.smirnov@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 13 Jun 2019 07:27:23 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=86+1jUaVqNTDsIoNrTtwtftI7vuyj9YpQeH9VRCoSLE=;
 b=afohXmexYd3wJdVyxOx1FBcrsMl+tDot6Jng9UlzTGqxMXcYq+tgzttatlHemrQKND
 QeaKnTN+FkYrkunmEJVmuwWPe3/4x2FIddEC+yBK7Tl5JYVcTJR3xQV/8rkJowf99Z2o
 c7wNrZmPqJsWBnVpyO25HUg/GHR9YcnexkxczY2Z9bREN0caDhSBs3fUHU8DjmaV2IMg
 MuyWybBxEAenUYMLruBmEdUNpQvmjoaSdovTbMP31CbASi8JhOwZ6Dx1xuDOj21o4Dhw
 2wAJ78x/T1YIiDQbg1ccJscQbDxTH6XpJ4fhMZ8FFqsIOdJqnqMjT845JNNNYBJpCDh+
 CfXQ==
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
