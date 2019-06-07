Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3990038573
	for <lists+dri-devel@lfdr.de>; Fri,  7 Jun 2019 09:45:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5DDD089B62;
	Fri,  7 Jun 2019 07:43:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com
 [IPv6:2607:f8b0:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6694C899DC
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Jun 2019 04:46:47 +0000 (UTC)
Received: by mail-pf1-x443.google.com with SMTP id c85so472957pfc.1
 for <dri-devel@lists.freedesktop.org>; Thu, 06 Jun 2019 21:46:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ATu26WvvNPiJ9Ah/tmZWwxGXI/i8AcwKGoFEMQ2U0A4=;
 b=RGhPs6Uq7NATo+axJ4o/G+uCQoWgoNg0778uyF1MesUOmdWRnpEwP3n4M8JTCXbWIt
 /n/KboTlO2/RW02AIg3cw4o/fjBU8tjYB92sT2XyaHJd2akkh3Qn51xz1lXNhR7oAvs1
 BWn39v00Qmq8YBKYEjgNPOQ+SSmSyWWGPHgTUdaSUXnt3xTBN4pZQdP8a2WRY+/hiW0L
 6KUWj3KbwODCekaFyQpX4cQKZFWIlnvlkdH65swUW+EVjuz51CxLEjZB0lZcjcQ+3FAo
 0cyCqzSlRDu+HTT0VyLRHvY55QLiePrWsZuK4BmzcA9Y0S8fNce0hfuDSTHVTF2G1Rke
 vg5A==
X-Gm-Message-State: APjAAAWNs3dUDrE+lAY8lgk2lC6LxGBGM1pXh5AXkCUNTX59cCXX3/RJ
 RW9ZMxmM7limQ92HBxzkUOw3MwLWbJg=
X-Google-Smtp-Source: APXvYqya01PmMslldpFFJmX9gxMsFDFW7DAkTuaAUIFFvO4jrqj3mnDiJc+NAIWK6NlFp8zLLAPNlQ==
X-Received: by 2002:a17:90a:ba81:: with SMTP id
 t1mr3370811pjr.139.1559882806633; 
 Thu, 06 Jun 2019 21:46:46 -0700 (PDT)
Received: from localhost.lan (c-24-22-235-96.hsd1.wa.comcast.net.
 [24.22.235.96])
 by smtp.gmail.com with ESMTPSA id o13sm919516pfh.23.2019.06.06.21.46.45
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Thu, 06 Jun 2019 21:46:45 -0700 (PDT)
From: Andrey Smirnov <andrew.smirnov@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v4 13/15] drm/bridge: tc358767: Simplify tc_aux_wait_busy()
Date: Thu,  6 Jun 2019 21:45:48 -0700
Message-Id: <20190607044550.13361-14-andrew.smirnov@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190607044550.13361-1-andrew.smirnov@gmail.com>
References: <20190607044550.13361-1-andrew.smirnov@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 07 Jun 2019 07:43:40 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ATu26WvvNPiJ9Ah/tmZWwxGXI/i8AcwKGoFEMQ2U0A4=;
 b=Qit71R6hsjTt2C4V/Wmws+Xb8tajqL1zmFx25XZOZkLaLnybvYDuq2g3DOfwRErqu4
 YUfs6BWhrZeulSYQPt0iTiYCnSiWyT0Q548h4FFds+OlzCOyu7ZaoK9GkfsLjKNomynO
 LIEGZ+rvvioEEtU2eqbUpTe8Ki6OMkD8VbIElvbUU6Lml4Xy9HW99/TL18ROZhaPf6Wm
 YownnNe5HLc+1BzuUy28y1uoOTzBUk+jxHZODcxx8fv/Iwv913Zp+PY9/v2QlHDHQoiE
 T5OwKc4trf32G6q3HsjgHFEeU6JEPWTLgVokIIm8xpEEbbacOTc3lEy+GhJ+6wEVLWr+
 ZcWg==
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

V2UgbmV2ZXIgcGFzcyBhbnl0aGluZyBidXQgMTAwIGFzIHRpbWVvdXRfbXMgdG8gdGNfYXV4X3dh
aXRfYnVzeSgpLCBzbwp3ZSBtYXkgYXMgd2VsbCBoYXJkY29kZSB0aGF0IHZhbHVlIGFuZCBzaW1w
bGlmeSBmdW5jdGlvbidzIHNpZ25hdHVyZS4KClNpZ25lZC1vZmYtYnk6IEFuZHJleSBTbWlybm92
IDxhbmRyZXcuc21pcm5vdkBnbWFpbC5jb20+CkNjOiBBbmRyemVqIEhhamRhIDxhLmhhamRhQHNh
bXN1bmcuY29tPgpDYzogTGF1cmVudCBQaW5jaGFydCA8TGF1cmVudC5waW5jaGFydEBpZGVhc29u
Ym9hcmQuY29tPgpDYzogVG9taSBWYWxrZWluZW4gPHRvbWkudmFsa2VpbmVuQHRpLmNvbT4KQ2M6
IEFuZHJleSBHdXNha292IDxhbmRyZXkuZ3VzYWtvdkBjb2dlbnRlbWJlZGRlZC5jb20+CkNjOiBQ
aGlsaXBwIFphYmVsIDxwLnphYmVsQHBlbmd1dHJvbml4LmRlPgpDYzogQ29yeSBUdXNhciA8Y29y
eS50dXNhckB6aWkuYWVybz4KQ2M6IENocmlzIEhlYWx5IDxjcGhlYWx5QGdtYWlsLmNvbT4KQ2M6
IEx1Y2FzIFN0YWNoIDxsLnN0YWNoQHBlbmd1dHJvbml4LmRlPgpDYzogZHJpLWRldmVsQGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpDYzogbGludXgta2VybmVsQHZnZXIua2VybmVsLm9yZwotLS0KIGRy
aXZlcnMvZ3B1L2RybS9icmlkZ2UvdGMzNTg3NjcuYyB8IDkgKysrKy0tLS0tCiAxIGZpbGUgY2hh
bmdlZCwgNCBpbnNlcnRpb25zKCspLCA1IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZl
cnMvZ3B1L2RybS9icmlkZ2UvdGMzNTg3NjcuYyBiL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2UvdGMz
NTg3NjcuYwppbmRleCBjOTk0YzcyZWIzMzAuLmU3NDdmMTAwMjFlMyAxMDA2NDQKLS0tIGEvZHJp
dmVycy9ncHUvZHJtL2JyaWRnZS90YzM1ODc2Ny5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9icmlk
Z2UvdGMzNTg3NjcuYwpAQCAtMjk0LDEwICsyOTQsOSBAQCBzdGF0aWMgaW5saW5lIGludCB0Y19w
b2xsX3RpbWVvdXQoc3RydWN0IHRjX2RhdGEgKnRjLCB1bnNpZ25lZCBpbnQgYWRkciwKIAkJCQkJ
c2xlZXBfdXMsIHRpbWVvdXRfdXMpOwogfQogCi1zdGF0aWMgaW50IHRjX2F1eF93YWl0X2J1c3ko
c3RydWN0IHRjX2RhdGEgKnRjLCB1bnNpZ25lZCBpbnQgdGltZW91dF9tcykKK3N0YXRpYyBpbnQg
dGNfYXV4X3dhaXRfYnVzeShzdHJ1Y3QgdGNfZGF0YSAqdGMpCiB7Ci0JcmV0dXJuIHRjX3BvbGxf
dGltZW91dCh0YywgRFAwX0FVWFNUQVRVUywgQVVYX0JVU1ksIDAsCi0JCQkgICAgICAgMTAwMCwg
MTAwMCAqIHRpbWVvdXRfbXMpOworCXJldHVybiB0Y19wb2xsX3RpbWVvdXQodGMsIERQMF9BVVhT
VEFUVVMsIEFVWF9CVVNZLCAwLCAxMDAwLCAxMDAwMDApOwogfQogCiBzdGF0aWMgaW50IHRjX2F1
eF93cml0ZV9kYXRhKHN0cnVjdCB0Y19kYXRhICp0YywgY29uc3Qgdm9pZCAqZGF0YSwKQEAgLTM1
MCw3ICszNDksNyBAQCBzdGF0aWMgc3NpemVfdCB0Y19hdXhfdHJhbnNmZXIoc3RydWN0IGRybV9k
cF9hdXggKmF1eCwKIAl1MzIgYXV4c3RhdHVzOwogCWludCByZXQ7CiAKLQlyZXQgPSB0Y19hdXhf
d2FpdF9idXN5KHRjLCAxMDApOworCXJldCA9IHRjX2F1eF93YWl0X2J1c3kodGMpOwogCWlmIChy
ZXQpCiAJCXJldHVybiByZXQ7CiAKQEAgLTM3Nyw3ICszNzYsNyBAQCBzdGF0aWMgc3NpemVfdCB0
Y19hdXhfdHJhbnNmZXIoc3RydWN0IGRybV9kcF9hdXggKmF1eCwKIAlpZiAocmV0KQogCQlyZXR1
cm4gcmV0OwogCi0JcmV0ID0gdGNfYXV4X3dhaXRfYnVzeSh0YywgMTAwKTsKKwlyZXQgPSB0Y19h
dXhfd2FpdF9idXN5KHRjKTsKIAlpZiAocmV0KQogCQlyZXR1cm4gcmV0OwogCi0tIAoyLjIxLjAK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZl
bCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xp
c3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
