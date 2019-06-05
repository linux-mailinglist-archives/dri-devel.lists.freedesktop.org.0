Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1581F36841
	for <lists+dri-devel@lfdr.de>; Thu,  6 Jun 2019 01:44:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 262AB895C8;
	Wed,  5 Jun 2019 23:44:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com
 [IPv6:2607:f8b0:4864:20::544])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8025F895C8
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Jun 2019 23:44:27 +0000 (UTC)
Received: by mail-pg1-x544.google.com with SMTP id s27so227320pgl.2
 for <dri-devel@lists.freedesktop.org>; Wed, 05 Jun 2019 16:44:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=vyHkbOEMkgWVI1yREjgkQjgyvZb+xK4A4sfaT0UjXqc=;
 b=ETh5dDnU830JMwlzMylF9banL1LL2D7WXbU3m64fPWFXYpNzLYq2ddEHMeC/RpGIMA
 SoQw29z7UenKlOoGbydMTFekh5qiBFBJzlQwl+7pbZe3pC37Zyv4RXsen+0P2d46JJ+x
 ZTNYPT1s+QvefmXRkWwzvW61THXO7NOU13AXzVBhwQFyeRkBlztERSMbM78A2ggVMKJu
 j1fhKlvsf1VoeJ60sj7pPFZP6vA70rl97QZtiztfJnhw8Oo7DBflK6AdrI2EG3IdUIIL
 sAU+RMh8Zrh8QSEMQ95Fu0K8D/LPPZL3BQ4JFLTPjUvOGpdp1QLlHEAaBzVbnnEm8P44
 R7VA==
X-Gm-Message-State: APjAAAUtH8WiPb6sds/OmXr1bPYbqt+uZY0U+OVAXV9qTUYytgBVsRHR
 BiocqAxdRiINtwNDqiEOi0HVjae9bhY=
X-Google-Smtp-Source: APXvYqxR2BZjwTQAkG75ysAdGk8mlHNMgXAGJfJSmgUvu6H+vcz7IhZJ5J9HpwEQabmlAAHkJhMbVg==
X-Received: by 2002:a63:5ca:: with SMTP id 193mr446060pgf.232.1559778266823;
 Wed, 05 Jun 2019 16:44:26 -0700 (PDT)
Received: from localhost ([2620:15c:202:1:e9ae:bd45:1bd9:e60d])
 by smtp.gmail.com with ESMTPSA id y185sm68596pfy.110.2019.06.05.16.44.25
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 05 Jun 2019 16:44:26 -0700 (PDT)
From: davidriley@chromium.org
To: dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org
Subject: [PATCH 1/4] drm/virtio: Ensure cached capset entries are valid before
 copying.
Date: Wed,  5 Jun 2019 16:44:20 -0700
Message-Id: <20190605234423.11348-1-davidriley@chromium.org>
X-Mailer: git-send-email 2.22.0.rc1.311.g5d7573a151-goog
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=vyHkbOEMkgWVI1yREjgkQjgyvZb+xK4A4sfaT0UjXqc=;
 b=MRxSI6zkTMXESmwtjNnyGJHwIuyYXxr3GsKIJLzp62KNe+JF4RahnVj735T5TQpjTJ
 1DmcVhwU5wSDdCbOUqKVzxah/TfKcYHnfXJmIwd7rFo3xD1LU0upA51lJQo8prBDT1uc
 7d7/Hz8UYsm1aD8AnuYU3GESzf2NT38q94dOE=
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
Cc: David Airlie <airlied@linux.ie>, Gerd Hoffmann <kraxel@redhat.com>,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogRGF2aWQgUmlsZXkgPGRhdmlkcmlsZXlAY2hyb21pdW0ub3JnPgoKdmlydGlvX2dwdV9n
ZXRfY2Fwc19pb2N0bCBjb3VsZCByZXR1cm4gc3VjY2VzcyB3aXRoIGludmFsaWQgZGF0YSBpZiBh
CnNlY29uZCBjYWxsZXIgdG8gdGhlIGZ1bmN0aW9uIG9jY3VycmVkIGFmdGVyIHRoZSBlbnRyeSB3
YXMgY3JlYXRlZCBpbgp2aXJ0aW9fZ3B1X2NtZF9nZXRfY2Fwc2V0IGJ1dCBwcmlvciB0byB0aGUg
dmlydGlvX2dwdV9jbWRfY2Fwc2V0X2NiCmNhbGxiYWNrIGJlaW5nIGNhbGxlZC4gIFRoaXMgY291
bGQgbGVhayBjb250ZW50cyBvZiBtZW1vcnkgYXMgd2VsbApzaW5jZSB0aGUgY2Fwc19jYWNoZSBh
bGxvY2F0aW9uIGlzIGRvbmUgd2l0aG91dCB6ZXJvaW5nLgoKU2lnbmVkLW9mZi1ieTogRGF2aWQg
UmlsZXkgPGRhdmlkcmlsZXlAY2hyb21pdW0ub3JnPgotLS0KIGRyaXZlcnMvZ3B1L2RybS92aXJ0
aW8vdmlydGdwdV9pb2N0bC5jIHwgMyArLS0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigr
KSwgMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vdmlydGlvL3Zp
cnRncHVfaW9jdGwuYyBiL2RyaXZlcnMvZ3B1L2RybS92aXJ0aW8vdmlydGdwdV9pb2N0bC5jCmlu
ZGV4IDk0OWEyNjQ5ODVmYy4uODhjMWVkNTdhM2M1IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9k
cm0vdmlydGlvL3ZpcnRncHVfaW9jdGwuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vdmlydGlvL3Zp
cnRncHVfaW9jdGwuYwpAQCAtNTI2LDcgKzUyNiw2IEBAIHN0YXRpYyBpbnQgdmlydGlvX2dwdV9n
ZXRfY2Fwc19pb2N0bChzdHJ1Y3QgZHJtX2RldmljZSAqZGV2LAogCWxpc3RfZm9yX2VhY2hfZW50
cnkoY2FjaGVfZW50LCAmdmdkZXYtPmNhcF9jYWNoZSwgaGVhZCkgewogCQlpZiAoY2FjaGVfZW50
LT5pZCA9PSBhcmdzLT5jYXBfc2V0X2lkICYmCiAJCSAgICBjYWNoZV9lbnQtPnZlcnNpb24gPT0g
YXJncy0+Y2FwX3NldF92ZXIpIHsKLQkJCXB0ciA9IGNhY2hlX2VudC0+Y2Fwc19jYWNoZTsKIAkJ
CXNwaW5fdW5sb2NrKCZ2Z2Rldi0+ZGlzcGxheV9pbmZvX2xvY2spOwogCQkJZ290byBjb3B5X2V4
aXQ7CiAJCX0KQEAgLTUzNyw2ICs1MzYsNyBAQCBzdGF0aWMgaW50IHZpcnRpb19ncHVfZ2V0X2Nh
cHNfaW9jdGwoc3RydWN0IGRybV9kZXZpY2UgKmRldiwKIAl2aXJ0aW9fZ3B1X2NtZF9nZXRfY2Fw
c2V0KHZnZGV2LCBmb3VuZF92YWxpZCwgYXJncy0+Y2FwX3NldF92ZXIsCiAJCQkJICAmY2FjaGVf
ZW50KTsKIAorY29weV9leGl0OgogCXJldCA9IHdhaXRfZXZlbnRfdGltZW91dCh2Z2Rldi0+cmVz
cF93cSwKIAkJCQkgYXRvbWljX3JlYWQoJmNhY2hlX2VudC0+aXNfdmFsaWQpLCA1ICogSFopOwog
CWlmICghcmV0KQpAQCAtNTQ0LDcgKzU0NCw2IEBAIHN0YXRpYyBpbnQgdmlydGlvX2dwdV9nZXRf
Y2Fwc19pb2N0bChzdHJ1Y3QgZHJtX2RldmljZSAqZGV2LAogCiAJcHRyID0gY2FjaGVfZW50LT5j
YXBzX2NhY2hlOwogCi1jb3B5X2V4aXQ6CiAJaWYgKGNvcHlfdG9fdXNlcigodm9pZCBfX3VzZXIg
KikodW5zaWduZWQgbG9uZylhcmdzLT5hZGRyLCBwdHIsIHNpemUpKQogCQlyZXR1cm4gLUVGQVVM
VDsKIAotLSAKMi4yMi4wLnJjMS4zMTEuZzVkNzU3M2ExNTEtZ29vZwoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApk
cmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
