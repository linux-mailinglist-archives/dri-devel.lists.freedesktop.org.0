Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D47BDE06D
	for <lists+dri-devel@lfdr.de>; Sun, 20 Oct 2019 22:34:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 76265897B5;
	Sun, 20 Oct 2019 20:34:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com
 [IPv6:2a00:1450:4864:20::241])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 30288897B5
 for <dri-devel@lists.freedesktop.org>; Sun, 20 Oct 2019 20:34:29 +0000 (UTC)
Received: by mail-lj1-x241.google.com with SMTP id y23so11081873lje.9
 for <dri-devel@lists.freedesktop.org>; Sun, 20 Oct 2019 13:34:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Ye1QdFc2HG6Bs/Phl7WOBKeZvuv3ZW6GRUU9gkkbJF0=;
 b=XqZX1eqS14SNKPxEYf09xsWCPmAwT/9CcEJWlJvqprz4xR1hJzHgyrHl+JMzLMAYLi
 m2eQyEN6LFv5fQaggN87pLW+SH0+VSygNCXdb1J3sO8AuZY0yc0837I+tAdWf8rdVzgR
 UwKb+dJbffl1T4OIMIs+7KInZGCi3qRuytLlTLXMS0/wlzmH6wvKGhnwVcB/+lQAtT2W
 OjvpRjSCeE8eFR1WP1t+tqx9rJHewlM/LgJBuLnPrCFI2q/8qvDF0B96RqHNxLN9UL8r
 R4Rrmoi+nuXdVSS0+RJQm5XMh2Xb6GqXcAEJWJJUm2MNmL21WjAbHfN0Q8mctqygmddS
 JzxQ==
X-Gm-Message-State: APjAAAWrW7PLNHh1cFSecFrAseEE/++ZIuJoS6bL7eZ6ltBWzrpmtG+E
 tdKnqZv7ZMZ7HV9TPI+CrJwx53YIbr0=
X-Google-Smtp-Source: APXvYqxDGh9W21UIEW0nIPERdzp7zQY8Ml62fpVUFLqGJ8gIzW2ijBDgLoWBZjEV+AxmDqJExsNMVg==
X-Received: by 2002:a2e:6a04:: with SMTP id f4mr12351538ljc.97.1571603665694; 
 Sun, 20 Oct 2019 13:34:25 -0700 (PDT)
Received: from localhost.bredbandsbolaget
 (c-79c8225c.014-348-6c756e10.bbcust.telenor.se. [92.34.200.121])
 by smtp.gmail.com with ESMTPSA id m17sm15032290lje.0.2019.10.20.13.34.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 20 Oct 2019 13:34:24 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
To: dri-devel@lists.freedesktop.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <maxime.ripard@bootlin.com>, Sean Paul <sean@poorly.run>
Subject: [PATCH] drm/mcde: Improve pixel fetcher FIFO depth setting
Date: Sun, 20 Oct 2019 22:34:18 +0200
Message-Id: <20191020203418.23921-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Ye1QdFc2HG6Bs/Phl7WOBKeZvuv3ZW6GRUU9gkkbJF0=;
 b=cBXYtI/62OK7Ws6TxcjxcrmodFX2ghsFMh8zhT4y/fjPQdUfUXR59PHtY6vDdUAgr+
 nsK2rjmXwU3BJQDMxBStoaw63bLpp71zH4K03Tp7sWSJp2eycUKxC46DcjK6+I5TtLK4
 44gj6+zmfE0ILZhWsyuX5oGg3mmWSVPyxqF7LFLPS2K6EVF2plgr+8uVBU82ulF/5HYI
 TzBsnQxjC8grYTCo743ByCl9wRZvWXP/h8/1DxIU42Iq1u8+v1Ol3VzcV11Ru9BBV4G6
 ozCTs5gH8tRgkKU4HXPdQ/VJhozI23OReryocWs33Len/OwF9Gb4t3WERT4BNjlhgVhn
 w8MA==
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
Cc: Stephan Gerhold <stephan@gerhold.net>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhlIHBpeGVsIGZldGNoZXIgRklGTyBkZXB0aCB3YXMganVzdCBoYXJkY29kZWQgdG8gNDgKd2hp
Y2ggd29ya3MgZmluZSBhcyBsb25nIGFzIHRoZSBmcmFtZWJ1ZmZlciBpcyAzMkJQUAphbmQgdGhl
IERTSSBvdXRwdXQgaXMgUkdCODg4LgoKV2Ugd2lsbCBuZWVkIG1vcmUgZWxhYm9yYXRlIGhhbmRs
aW5nIGZvciBzb21lIGJ1ZmZlcgpmb3JtYXRzIGFuZCBkaXNwbGF5cywgc28gc3RhcnQgdG8gaW1w
cm92ZSB0aGlzIGZ1bmN0aW9uCmJ5IHNldHRpbmcgcmVhc29uYWJsZSBkZWZhdWx0cyBmb3IgMzIs
IDI0IGFuZCAxNiBCUFAKZnJhbWVidWZmZXJzLgoKQ2M6IFN0ZXBoYW4gR2VyaG9sZCA8c3RlcGhh
bkBnZXJob2xkLm5ldD4KU2lnbmVkLW9mZi1ieTogTGludXMgV2FsbGVpaiA8bGludXMud2FsbGVp
akBsaW5hcm8ub3JnPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9tY2RlL21jZGVfZGlzcGxheS5jIHwg
MzQgKysrKysrKysrKysrKysrKysrKysrKysrKy0tLS0KIDEgZmlsZSBjaGFuZ2VkLCAzMCBpbnNl
cnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9t
Y2RlL21jZGVfZGlzcGxheS5jIGIvZHJpdmVycy9ncHUvZHJtL21jZGUvbWNkZV9kaXNwbGF5LmMK
aW5kZXggNzUxNDU0YWUzY2QxLi40MjNiYzcyYTQ3NzggMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1
L2RybS9tY2RlL21jZGVfZGlzcGxheS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9tY2RlL21jZGVf
ZGlzcGxheS5jCkBAIC0zMzMsNyArMzMzLDcgQEAgc3RhdGljIHZvaWQgbWNkZV9jb25maWd1cmVf
b3ZlcmxheShzdHJ1Y3QgbWNkZSAqbWNkZSwgZW51bSBtY2RlX292ZXJsYXkgb3ZsLAogCQkJCSAg
IGVudW0gbWNkZV9leHRzcmMgc3JjLAogCQkJCSAgIGVudW0gbWNkZV9jaGFubmVsIGNoLAogCQkJ
CSAgIGNvbnN0IHN0cnVjdCBkcm1fZGlzcGxheV9tb2RlICptb2RlLAotCQkJCSAgIHUzMiBmb3Jt
YXQpCisJCQkJICAgdTMyIGZvcm1hdCwgaW50IGNwcCkKIHsKIAl1MzIgdmFsOwogCXUzMiBjb25m
MTsKQEAgLTM0Miw2ICszNDIsNyBAQCBzdGF0aWMgdm9pZCBtY2RlX2NvbmZpZ3VyZV9vdmVybGF5
KHN0cnVjdCBtY2RlICptY2RlLCBlbnVtIG1jZGVfb3ZlcmxheSBvdmwsCiAJdTMyIGxqaW5jOwog
CXUzMiBjcjsKIAl1MzIgY29tcDsKKwl1MzIgcGl4ZWxfZmV0Y2hlcl93YXRlcm1hcms7CiAKIAlz
d2l0Y2ggKG92bCkgewogCWNhc2UgTUNERV9PVkVSTEFZXzA6CkBAIC00MjYsOCArNDI3LDMzIEBA
IHN0YXRpYyB2b2lkIG1jZGVfY29uZmlndXJlX292ZXJsYXkoc3RydWN0IG1jZGUgKm1jZGUsIGVu
dW0gbWNkZV9vdmVybGF5IG92bCwKIAkJCWZvcm1hdCk7CiAJCWJyZWFrOwogCX0KLQkvKiBUaGUg
ZGVmYXVsdCB3YXRlcm1hcmsgbGV2ZWwgZm9yIG92ZXJsYXkgMCBpcyA0OCAqLwotCXZhbCB8PSA0
OCA8PCBNQ0RFX09WTFhDT05GMl9QSVhFTEZFVENIRVJXQVRFUk1BUktMRVZFTF9TSElGVDsKKwor
CS8qCisJICogUGl4ZWwgZmV0Y2ggd2F0ZXJtYXJrIGxldmVsIGlzIG1heCAweDFGRkYgcGl4ZWxz
LgorCSAqIFR3byBiYXNpYyBydWxlcyBzaG91bGQgYmUgZm9sbG93ZWQ6CisJICogMS4gVGhlIHZh
bHVlIHNob3VsZCBiZSBhdCBsZWFzdCAyNTYgYml0cy4KKwkgKiAyLiBUaGUgc3VtIG9mIGFsbCBh
Y3RpdmUgb3ZlcmxheXMgcGl4ZWxmZXRjaCB3YXRlcm1hcmsgbGV2ZWwKKwkgKiAgICBtdWx0aXBs
aWVkIHdpdGggYml0cyBwZXIgcGl4ZWwsIHNob3VsZCBiZSBsb3dlciB0aGFuIHRoZQorCSAqICAg
IHNpemUgb2YgaW5wdXRfZmlmb19zaXplIGluIGJpdHMuCisJICogMy4gVGhlIHZhbHVlIHNob3Vs
ZCBiZSBhIG11bHRpcGxlIG9mIGEgbGluZSAoMjU2IGJpdHMpLgorCSAqLworCXN3aXRjaCAoY3Bw
KSB7CisJY2FzZSAyOgorCQlwaXhlbF9mZXRjaGVyX3dhdGVybWFyayA9IDEyODsKKwkJYnJlYWs7
CisJY2FzZSAzOgorCQlwaXhlbF9mZXRjaGVyX3dhdGVybWFyayA9IDk2OworCQlicmVhazsKKwlj
YXNlIDQ6CisJCXBpeGVsX2ZldGNoZXJfd2F0ZXJtYXJrID0gNDg7CisJCWJyZWFrOworCWRlZmF1
bHQ6CisJCXBpeGVsX2ZldGNoZXJfd2F0ZXJtYXJrID0gNDg7CisJCWJyZWFrOworCX0KKwlkZXZf
ZGJnKG1jZGUtPmRldiwgInBpeGVsIGZldGNoZXIgd2F0ZXJtYXJrIGxldmVsICVkIHBpeGVsc1xu
IiwKKwkJcGl4ZWxfZmV0Y2hlcl93YXRlcm1hcmspOworCXZhbCB8PSBwaXhlbF9mZXRjaGVyX3dh
dGVybWFyayA8PCBNQ0RFX09WTFhDT05GMl9QSVhFTEZFVENIRVJXQVRFUk1BUktMRVZFTF9TSElG
VDsKIAl3cml0ZWwodmFsLCBtY2RlLT5yZWdzICsgY29uZjIpOwogCiAJLyogTnVtYmVyIG9mIGJ5
dGVzIHRvIGZldGNoIHBlciBsaW5lICovCkBAIC05MDgsNyArOTM0LDcgQEAgc3RhdGljIHZvaWQg
bWNkZV9kaXNwbGF5X2VuYWJsZShzdHJ1Y3QgZHJtX3NpbXBsZV9kaXNwbGF5X3BpcGUgKnBpcGUs
CiAJICogY2hhbm5lbCAwCiAJICovCiAJbWNkZV9jb25maWd1cmVfb3ZlcmxheShtY2RlLCBNQ0RF
X09WRVJMQVlfMCwgTUNERV9FWFRTUkNfMCwKLQkJCSAgICAgICBNQ0RFX0NIQU5ORUxfMCwgbW9k
ZSwgZm9ybWF0KTsKKwkJCSAgICAgICBNQ0RFX0NIQU5ORUxfMCwgbW9kZSwgZm9ybWF0LCBjcHAp
OwogCiAJLyoKIAkgKiBDb25maWd1cmUgcGl4ZWwtcGVyLWxpbmUgYW5kIGxpbmUtcGVyLWZyYW1l
IGZvciBjaGFubmVsIDAgYW5kIHRoZW4KLS0gCjIuMjEuMAoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2
ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21h
aWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
