Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B0EE9D933
	for <lists+dri-devel@lfdr.de>; Tue, 27 Aug 2019 00:33:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B781D6E31E;
	Mon, 26 Aug 2019 22:33:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f194.google.com (mail-oi1-f194.google.com
 [209.85.167.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1BFA189CA8
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Aug 2019 22:33:25 +0000 (UTC)
Received: by mail-oi1-f194.google.com with SMTP id q8so13141005oij.5
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Aug 2019 15:33:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=R4jGmh892Y2Plh7rZR/Jz0sf/VgHSWV3z2nnmBNkYNk=;
 b=Ks3kMswmqfAqifmPDMBn1JhSFXjLOjMAzZpKKnfnKYE5WL3oFwwbSIZC+WcVkO8vGp
 dkA4BKt2eprVnWIalTWETa5vAQpS60c7GkeyxEihQF2kLccsbSQNX+wdsgFmWqFGnIjq
 IrXXz9S6EgeZrMUG6W7nE7FYW8BQvzRUhEcJOGa6QuroZnoKs+RyHG5tOm/GQeD9CQ9o
 izDDwO/vI1CtKkoVE2QRb+uusCZxLGp1SfJFmvGVj32vPNxN7GZ1auydXQIIwr0wkeVG
 al3lmCm4CqJb5hKXbGpAIP230z4aCZsdPjRlFqQyIxs4Kyi4seyYehruAcH0R0aRgTkV
 1Y0w==
X-Gm-Message-State: APjAAAVVzbvZmoZfRuxwTCIYTl8L9tJWQtcZR4bVKQaAUJsZFsB5rOHL
 KJs8X/cVUQXmDfnf3eXusoysZI4=
X-Google-Smtp-Source: APXvYqzUhKMJLgMrd/VxVJuLmPysaH39Is0rXN8TFL+hZPzYlSDwZaFKnaB6ybdju+EYv9SPaSxlFQ==
X-Received: by 2002:aca:55d6:: with SMTP id j205mr13622153oib.63.1566858804055; 
 Mon, 26 Aug 2019 15:33:24 -0700 (PDT)
Received: from xps15.herring.priv (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.googlemail.com with ESMTPSA id e22sm3668959oii.7.2019.08.26.15.33.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Aug 2019 15:33:23 -0700 (PDT)
From: Rob Herring <robh@kernel.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v3 5/8] drm/panfrost: Split mmu_hw_do_operation into locked
 and unlocked version
Date: Mon, 26 Aug 2019 17:33:14 -0500
Message-Id: <20190826223317.28509-6-robh@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190826223317.28509-1-robh@kernel.org>
References: <20190826223317.28509-1-robh@kernel.org>
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
Cc: Tomeu Vizoso <tomeu.vizoso@collabora.com>, David Airlie <airlied@linux.ie>,
 Steven Price <steven.price@arm.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Robin Murphy <robin.murphy@arm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SW4gcHJlcGFyYXRpb24gdG8gY2FsbCBtbXVfaHdfZG9fb3BlcmF0aW9uIHdpdGggdGhlIGFzX2xv
Y2sgYWxyZWFkeSBoZWxkLApBZGQgYSBtbXVfaHdfZG9fb3BlcmF0aW9uX2xvY2tlZCBmdW5jdGlv
bi4KCkZpeGVzOiA3MjgyZjc2NDVkMDYgKCJkcm0vcGFuZnJvc3Q6IEltcGxlbWVudCBwZXIgRkQg
YWRkcmVzcyBzcGFjZXMiKQpDYzogVG9tZXUgVml6b3NvIDx0b21ldS52aXpvc29AY29sbGFib3Jh
LmNvbT4KQ2M6IFN0ZXZlbiBQcmljZSA8c3RldmVuLnByaWNlQGFybS5jb20+CkNjOiBBbHlzc2Eg
Um9zZW56d2VpZyA8YWx5c3NhLnJvc2VuendlaWdAY29sbGFib3JhLmNvbT4KQ2M6IERhdmlkIEFp
cmxpZSA8YWlybGllZEBsaW51eC5pZT4KQ2M6IERhbmllbCBWZXR0ZXIgPGRhbmllbEBmZndsbC5j
aD4KU2lnbmVkLW9mZi1ieTogUm9iIEhlcnJpbmcgPHJvYmhAa2VybmVsLm9yZz4KLS0tCnYzOgog
LSBuZXcgcGF0Y2gKCiBkcml2ZXJzL2dwdS9kcm0vcGFuZnJvc3QvcGFuZnJvc3RfbW11LmMgfCAy
NiArKysrKysrKysrKystLS0tLS0tLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgMTMgaW5zZXJ0aW9u
cygrKSwgMTMgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3BhbmZy
b3N0L3BhbmZyb3N0X21tdS5jIGIvZHJpdmVycy9ncHUvZHJtL3BhbmZyb3N0L3BhbmZyb3N0X21t
dS5jCmluZGV4IDIyMDRlNjBmNzgwOC4uMzQwN2IwMGQwYTNhIDEwMDY0NAotLS0gYS9kcml2ZXJz
L2dwdS9kcm0vcGFuZnJvc3QvcGFuZnJvc3RfbW11LmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL3Bh
bmZyb3N0L3BhbmZyb3N0X21tdS5jCkBAIC04MCwxOSArODAsMTEgQEAgc3RhdGljIHZvaWQgbG9j
a19yZWdpb24oc3RydWN0IHBhbmZyb3N0X2RldmljZSAqcGZkZXYsIHUzMiBhc19uciwKIH0KCgot
c3RhdGljIGludCBtbXVfaHdfZG9fb3BlcmF0aW9uKHN0cnVjdCBwYW5mcm9zdF9kZXZpY2UgKnBm
ZGV2LAotCQkJICAgICAgIHN0cnVjdCBwYW5mcm9zdF9tbXUgKm1tdSwKLQkJCSAgICAgICB1NjQg
aW92YSwgc2l6ZV90IHNpemUsIHUzMiBvcCkKK3N0YXRpYyBpbnQgbW11X2h3X2RvX29wZXJhdGlv
bl9sb2NrZWQoc3RydWN0IHBhbmZyb3N0X2RldmljZSAqcGZkZXYsIGludCBhc19uciwKKwkJCQkg
ICAgICB1NjQgaW92YSwgc2l6ZV90IHNpemUsIHUzMiBvcCkKIHsKLQlpbnQgcmV0LCBhc19ucjsK
LQotCXNwaW5fbG9jaygmcGZkZXYtPmFzX2xvY2spOwotCWFzX25yID0gbW11LT5hczsKLQotCWlm
IChhc19uciA8IDApIHsKLQkJc3Bpbl91bmxvY2soJnBmZGV2LT5hc19sb2NrKTsKKwlpZiAoYXNf
bnIgPCAwKQogCQlyZXR1cm4gMDsKLQl9CgogCWlmIChvcCAhPSBBU19DT01NQU5EX1VOTE9DSykK
IAkJbG9ja19yZWdpb24ocGZkZXYsIGFzX25yLCBpb3ZhLCBzaXplKTsKQEAgLTEwMSwxMCArOTMs
MTggQEAgc3RhdGljIGludCBtbXVfaHdfZG9fb3BlcmF0aW9uKHN0cnVjdCBwYW5mcm9zdF9kZXZp
Y2UgKnBmZGV2LAogCXdyaXRlX2NtZChwZmRldiwgYXNfbnIsIG9wKTsKCiAJLyogV2FpdCBmb3Ig
dGhlIGZsdXNoIHRvIGNvbXBsZXRlICovCi0JcmV0ID0gd2FpdF9yZWFkeShwZmRldiwgYXNfbnIp
OworCXJldHVybiB3YWl0X3JlYWR5KHBmZGV2LCBhc19ucik7Cit9CgotCXNwaW5fdW5sb2NrKCZw
ZmRldi0+YXNfbG9jayk7CitzdGF0aWMgaW50IG1tdV9od19kb19vcGVyYXRpb24oc3RydWN0IHBh
bmZyb3N0X2RldmljZSAqcGZkZXYsCisJCQkgICAgICAgc3RydWN0IHBhbmZyb3N0X21tdSAqbW11
LAorCQkJICAgICAgIHU2NCBpb3ZhLCBzaXplX3Qgc2l6ZSwgdTMyIG9wKQoreworCWludCByZXQ7
CgorCXNwaW5fbG9jaygmcGZkZXYtPmFzX2xvY2spOworCXJldCA9IG1tdV9od19kb19vcGVyYXRp
b25fbG9ja2VkKHBmZGV2LCBtbXUtPmFzLCBpb3ZhLCBzaXplLCBvcCk7CisJc3Bpbl91bmxvY2so
JnBmZGV2LT5hc19sb2NrKTsKIAlyZXR1cm4gcmV0OwogfQoKLS0KMi4yMC4xCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxp
c3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
