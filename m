Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 59838AB2F1
	for <lists+dri-devel@lfdr.de>; Fri,  6 Sep 2019 09:02:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E0CEA6E190;
	Fri,  6 Sep 2019 07:01:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com
 [IPv6:2607:f8b0:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 938386E12B
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Sep 2019 16:18:18 +0000 (UTC)
Received: by mail-pf1-x444.google.com with SMTP id q10so2091056pfl.0
 for <dri-devel@lists.freedesktop.org>; Thu, 05 Sep 2019 09:18:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=oVyIDYAYI+VGDpI/lL7N1eH8i3MwtZKf3xtD/r8Rq24=;
 b=C6ixPfLP1hxSfS7QU/qjIxJpgKWSB/ZECV8KuOjG37VroB4oGJYfAqYcIjySpmuBeB
 gpUWzJj/HEjvpkaqL+2iyrZTmUTWSISElK156VH6KZJJcMn75tJWRDpwhpeH1bbYQWNY
 PxPAMS/SXh/8XE75Hsn/OePjFmM6MX1LTjP22HOXTEJ9WvbU0XjcDAMIz1dPILWFX2Ia
 fzPmTTFu51dU0M+zqeS+tS3E3giNgoVmjTjZLgK6kBfH87/UgTIh8RMy0ibWt6Yp4T1g
 Bot+bpc7wQDokTj+YsPw07TeS//Exw5KcF2oahBx8V3KfnV8fSUTMEziiOOI3ROmDmD7
 Z0CA==
X-Gm-Message-State: APjAAAVZqLAm/cwEeUdLXGKu12xOrQ6LIZwCs6EAixbYb1ylqEUDS4u7
 UY9XTRZ7RwMiUK0029QNVfa7VQ==
X-Google-Smtp-Source: APXvYqzhTRlr7lMleWMm7PihRHJXTyTnHKtYgBmHBckAchkD+HJXwuNJjzGA3Uqro4QttUg4ocqrjA==
X-Received: by 2002:a63:ea14:: with SMTP id c20mr3836155pgi.185.1567700298006; 
 Thu, 05 Sep 2019 09:18:18 -0700 (PDT)
Received: from xps15.cg.shawcable.net (S0106002369de4dac.cg.shawcable.net.
 [68.147.8.254])
 by smtp.gmail.com with ESMTPSA id m129sm6324005pga.39.2019.09.05.09.18.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Sep 2019 09:18:17 -0700 (PDT)
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: stable@vger.kernel.org
Subject: [BACKPORT 4.14.y 14/18] ASoC: davinci-mcasp: Handle return value of
 devm_kasprintf
Date: Thu,  5 Sep 2019 10:17:55 -0600
Message-Id: <20190905161759.28036-15-mathieu.poirier@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190905161759.28036-1-mathieu.poirier@linaro.org>
References: <20190905161759.28036-1-mathieu.poirier@linaro.org>
X-Mailman-Approved-At: Fri, 06 Sep 2019 07:01:00 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=oVyIDYAYI+VGDpI/lL7N1eH8i3MwtZKf3xtD/r8Rq24=;
 b=RxDSo4U5spH1guQJnwpIC/IDoB9wBeRnVHNJlU6ZkPdlDZGnci2vz8qQzeVqj6sHk8
 OIEP3Aw69I/XCmA2b4iKpZz7pSTX9yIxzmguy6LxNFNRQtOD1hZHZx50CRC8PIff6+Jn
 /PplH+b2d5ldVWpeCS9ka4uiFItzl73R1+KOe4NeD4/11/kYAn/1IySNj9Bit9gvqtaq
 BVSsW9xsV/zkaN+MU/3pg6WNWNHQQdNWpTw8n5BgEs56iSr3vf+9eqggw+5lcrUcaiuI
 sjZLImwlXI8C+gUp7XbIVlhEkMi75jmc05IAcQed1JPfpUYfVzvU+urgBPc0BaBeFAqr
 CjyQ==
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
Cc: linux-pm@vger.kernel.org, linux-pci@vger.kernel.org,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-mtd@lists.infradead.org,
 linux-i2c@vger.kernel.org, linux-omap@vger.kernel.org
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogQXJ2aW5kIFlhZGF2IDxhcnZpbmQueWFkYXYuY3NAZ21haWwuY29tPgoKY29tbWl0IDBj
OGI3OTRjNGExMGFhZjdhYzBkNGE0OWJlMmIyNjM4ZTIwMzhhZGIgdXBzdHJlYW0KCmRldm1fa2Fz
cHJpbnRmKCkgY2FuIGZhaWwgaGVyZSBhbmQgd2UgbXVzdCBjaGVjayBpdHMgcmV0dXJuIHZhbHVl
LgoKU2lnbmVkLW9mZi1ieTogQXJ2aW5kIFlhZGF2IDxhcnZpbmQueWFkYXYuY3NAZ21haWwuY29t
PgpBY2tlZC1ieTogUGV0ZXIgVWpmYWx1c2kgPHBldGVyLnVqZmFsdXNpQHRpLmNvbT4KU2lnbmVk
LW9mZi1ieTogTWFyayBCcm93biA8YnJvb25pZUBrZXJuZWwub3JnPgpTaWduZWQtb2ZmLWJ5OiBN
YXRoaWV1IFBvaXJpZXIgPG1hdGhpZXUucG9pcmllckBsaW5hcm8ub3JnPgotLS0KIHNvdW5kL3Nv
Yy9kYXZpbmNpL2RhdmluY2ktbWNhc3AuYyB8IDEyICsrKysrKysrKysrKwogMSBmaWxlIGNoYW5n
ZWQsIDEyIGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9zb3VuZC9zb2MvZGF2aW5jaS9kYXZp
bmNpLW1jYXNwLmMgYi9zb3VuZC9zb2MvZGF2aW5jaS9kYXZpbmNpLW1jYXNwLmMKaW5kZXggMDQ4
MGVjNGM4MDM1Li5hZjZjZDhiODc0ZjUgMTAwNjQ0Ci0tLSBhL3NvdW5kL3NvYy9kYXZpbmNpL2Rh
dmluY2ktbWNhc3AuYworKysgYi9zb3VuZC9zb2MvZGF2aW5jaS9kYXZpbmNpLW1jYXNwLmMKQEAg
LTE4OTQsNiArMTg5NCwxMCBAQCBzdGF0aWMgaW50IGRhdmluY2lfbWNhc3BfcHJvYmUoc3RydWN0
IHBsYXRmb3JtX2RldmljZSAqcGRldikKIAlpZiAoaXJxID49IDApIHsKIAkJaXJxX25hbWUgPSBk
ZXZtX2thc3ByaW50ZigmcGRldi0+ZGV2LCBHRlBfS0VSTkVMLCAiJXNfY29tbW9uIiwKIAkJCQkJ
ICBkZXZfbmFtZSgmcGRldi0+ZGV2KSk7CisJCWlmICghaXJxX25hbWUpIHsKKwkJCXJldCA9IC1F
Tk9NRU07CisJCQlnb3RvIGVycjsKKwkJfQogCQlyZXQgPSBkZXZtX3JlcXVlc3RfdGhyZWFkZWRf
aXJxKCZwZGV2LT5kZXYsIGlycSwgTlVMTCwKIAkJCQkJCWRhdmluY2lfbWNhc3BfY29tbW9uX2ly
cV9oYW5kbGVyLAogCQkJCQkJSVJRRl9PTkVTSE9UIHwgSVJRRl9TSEFSRUQsCkBAIC0xOTExLDYg
KzE5MTUsMTAgQEAgc3RhdGljIGludCBkYXZpbmNpX21jYXNwX3Byb2JlKHN0cnVjdCBwbGF0Zm9y
bV9kZXZpY2UgKnBkZXYpCiAJaWYgKGlycSA+PSAwKSB7CiAJCWlycV9uYW1lID0gZGV2bV9rYXNw
cmludGYoJnBkZXYtPmRldiwgR0ZQX0tFUk5FTCwgIiVzX3J4IiwKIAkJCQkJICBkZXZfbmFtZSgm
cGRldi0+ZGV2KSk7CisJCWlmICghaXJxX25hbWUpIHsKKwkJCXJldCA9IC1FTk9NRU07CisJCQln
b3RvIGVycjsKKwkJfQogCQlyZXQgPSBkZXZtX3JlcXVlc3RfdGhyZWFkZWRfaXJxKCZwZGV2LT5k
ZXYsIGlycSwgTlVMTCwKIAkJCQkJCWRhdmluY2lfbWNhc3BfcnhfaXJxX2hhbmRsZXIsCiAJCQkJ
CQlJUlFGX09ORVNIT1QsIGlycV9uYW1lLCBtY2FzcCk7CkBAIC0xOTI2LDYgKzE5MzQsMTAgQEAg
c3RhdGljIGludCBkYXZpbmNpX21jYXNwX3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBk
ZXYpCiAJaWYgKGlycSA+PSAwKSB7CiAJCWlycV9uYW1lID0gZGV2bV9rYXNwcmludGYoJnBkZXYt
PmRldiwgR0ZQX0tFUk5FTCwgIiVzX3R4IiwKIAkJCQkJICBkZXZfbmFtZSgmcGRldi0+ZGV2KSk7
CisJCWlmICghaXJxX25hbWUpIHsKKwkJCXJldCA9IC1FTk9NRU07CisJCQlnb3RvIGVycjsKKwkJ
fQogCQlyZXQgPSBkZXZtX3JlcXVlc3RfdGhyZWFkZWRfaXJxKCZwZGV2LT5kZXYsIGlycSwgTlVM
TCwKIAkJCQkJCWRhdmluY2lfbWNhc3BfdHhfaXJxX2hhbmRsZXIsCiAJCQkJCQlJUlFGX09ORVNI
T1QsIGlycV9uYW1lLCBtY2FzcCk7Ci0tIAoyLjE3LjEKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVs
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
