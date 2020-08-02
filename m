Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8504923567E
	for <lists+dri-devel@lfdr.de>; Sun,  2 Aug 2020 13:07:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A37116E118;
	Sun,  2 Aug 2020 11:07:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com
 [IPv6:2a00:1450:4864:20::244])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B1C36E113;
 Sun,  2 Aug 2020 11:07:39 +0000 (UTC)
Received: by mail-lj1-x244.google.com with SMTP id w25so1282069ljo.12;
 Sun, 02 Aug 2020 04:07:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=YhZiSwo2FT8qe30e3KBGpm31IIJdBDrqOAyu3Ioz/NQ=;
 b=aoEptO85GRVMmAktSx2Rndos7VSu5KGXxrKEoX8z8b8mq6aPrSVWQY5sqpP4APp9tk
 7o+8qLHqfslPKcz/BpX01H0RysiTgE1IlViRnZ6+9OFCR0tyiiua2P/5PDXw73n6uFB6
 1NsLx4QR4KWzQ1u9v3i2huHD0ksk3+1SNDk1hmYaQuzjFy5JPrsCp8jTBKCtKZEAnraY
 bt1KOHtaWKb358uPKgHplHgLFOvUwmj1Rj8pZ3gqz53HO8Oj78jl6bCznwW+kd4L/KNp
 x6Amm937ZoJnGWkdllhOZ3ysE2aqrQlf/Q6rCRBe4ZNKH6wZzv5BLOtSIlS40wYXB1c1
 bKMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=YhZiSwo2FT8qe30e3KBGpm31IIJdBDrqOAyu3Ioz/NQ=;
 b=AwUhD6oOKFTXeW9gNWNDxnAS80lYuMq/GcIHdTadSyF3ma5ZS+Om3I8tI5EPnEUdvo
 z2Xs2IK0TH+6rV4AuxTq23qP9R9WFAP5fiEYhk4zTQ0u20AM4ZJkWGLrQ2k8tEUW3/pp
 wha5Rq77ZjqeDYi6rg/z8QRbpictO650Qz3v4s+GT9XTQhxClFyYjWuOKL23q0DJOq5k
 UKu/lXwxOOrrKykdEqmeXanC9u5CaT8Si29XNcSwI5A9c3HS3aCH2JPGzdsPVJZNqJzC
 ODYfzLvJeML5nqCe9Lyw08JFITMgpMmK3bmvTZ1Z02tsZKHT9o/T0IVvyvs1eYedvY9Q
 Jq+A==
X-Gm-Message-State: AOAM531tBp/DBjQ4xQqkAsAhQC2LtgZtiFewjcBnKggLS0lFNj3qyVjp
 iGoewQs9QiRHu6ryMS2rrw+jotiKH38=
X-Google-Smtp-Source: ABdhPJzP79W+FXxyd4pkvRp0fVyoZymF5djt4/zWX1YLkjwO5aKs8fbThYCiKhaw2zE4iiNpudhqgg==
X-Received: by 2002:a2e:810c:: with SMTP id d12mr5287473ljg.34.1596366457667; 
 Sun, 02 Aug 2020 04:07:37 -0700 (PDT)
Received: from saturn.lan ([2a00:fd00:805f:db00:b9d6:7e3c:5453:a61c])
 by smtp.gmail.com with ESMTPSA id l3sm3045520lji.115.2020.08.02.04.07.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 02 Aug 2020 04:07:37 -0700 (PDT)
From: Sam Ravnborg <sam@ravnborg.org>
To: dri-devel@lists.freedesktop.org, Jingoo Han <jingoohan1@gmail.com>,
 Lee Jones <lee.jones@linaro.org>,
 Daniel Thompson <daniel.thompson@linaro.org>
Subject: [PATCH v1 19/22] drm/amdgpu/atom: Backlight update
Date: Sun,  2 Aug 2020 13:06:33 +0200
Message-Id: <20200802110636.1018743-20-sam@ravnborg.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200802110636.1018743-1-sam@ravnborg.org>
References: <20200802110636.1018743-1-sam@ravnborg.org>
MIME-Version: 1.0
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
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
Cc: Alex Deucher <alexander.deucher@amd.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, Sam Ravnborg <sam@ravnborg.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 amd-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

LSBVc2UgbWFjcm9zIGZvciBpbml0aWFsaXphdGlvbgotIFJlcGxhY2UgZGlyZWN0IGFjY2VzcyB0
byBiYWNrbGlnaHRfcHJvcGVydGllcyB3aXRoIGdldCBhbmQgc2V0CiAgb3BlcmF0aW9ucwoKU2ln
bmVkLW9mZi1ieTogU2FtIFJhdm5ib3JnIDxzYW1AcmF2bmJvcmcub3JnPgpDYzogQWxleCBEZXVj
aGVyIDxhbGV4YW5kZXIuZGV1Y2hlckBhbWQuY29tPgpDYzogQ2hyaXN0aWFuIEvDtm5pZyA8Y2hy
aXN0aWFuLmtvZW5pZ0BhbWQuY29tPgpDYzogYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
Q2M6IFNhbSBSYXZuYm9yZyA8c2FtQHJhdm5ib3JnLm9yZz4KLS0tCiBkcml2ZXJzL2dwdS9kcm0v
YW1kL2FtZGdwdS9hdG9tYmlvc19lbmNvZGVycy5jIHwgMTUgKysrKysrKy0tLS0tLS0tCiAxIGZp
bGUgY2hhbmdlZCwgNyBpbnNlcnRpb25zKCspLCA4IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBh
L2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2F0b21iaW9zX2VuY29kZXJzLmMgYi9kcml2ZXJz
L2dwdS9kcm0vYW1kL2FtZGdwdS9hdG9tYmlvc19lbmNvZGVycy5jCmluZGV4IDFlOTRhOWI2NTJm
Ny4uNDMzODU3N2ViN2JhIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9h
dG9tYmlvc19lbmNvZGVycy5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2F0b21i
aW9zX2VuY29kZXJzLmMKQEAgLTEyMiwxNSArMTIyLDE2IEBAIGFtZGdwdV9hdG9tYmlvc19lbmNv
ZGVyX3NldF9iYWNrbGlnaHRfbGV2ZWwoc3RydWN0IGFtZGdwdV9lbmNvZGVyICphbWRncHVfZW5j
b2RlCiAKIHN0YXRpYyB1OCBhbWRncHVfYXRvbWJpb3NfZW5jb2Rlcl9iYWNrbGlnaHRfbGV2ZWwo
c3RydWN0IGJhY2tsaWdodF9kZXZpY2UgKmJkKQogeworCWludCBicmlnaHRuZXNzID0gYmFja2xp
Z2h0X2dldF9icmlnaHRuZXNzKGJkKTsKIAl1OCBsZXZlbDsKIAogCS8qIENvbnZlcnQgYnJpZ2h0
bmVzcyB0byBoYXJkd2FyZSBsZXZlbCAqLwotCWlmIChiZC0+cHJvcHMuYnJpZ2h0bmVzcyA8IDAp
CisJaWYgKGJyaWdodG5lc3MgPCAwKQogCQlsZXZlbCA9IDA7Ci0JZWxzZSBpZiAoYmQtPnByb3Bz
LmJyaWdodG5lc3MgPiBBTURHUFVfTUFYX0JMX0xFVkVMKQorCWVsc2UgaWYgKGJyaWdodG5lc3Mg
PiBBTURHUFVfTUFYX0JMX0xFVkVMKQogCQlsZXZlbCA9IEFNREdQVV9NQVhfQkxfTEVWRUw7CiAJ
ZWxzZQotCQlsZXZlbCA9IGJkLT5wcm9wcy5icmlnaHRuZXNzOworCQlsZXZlbCA9IGJyaWdodG5l
c3M7CiAKIAlyZXR1cm4gbGV2ZWw7CiB9CkBAIC0xNjUsNiArMTY2LDcgQEAgc3RhdGljIGNvbnN0
IHN0cnVjdCBiYWNrbGlnaHRfb3BzIGFtZGdwdV9hdG9tYmlvc19lbmNvZGVyX2JhY2tsaWdodF9v
cHMgPSB7CiB2b2lkIGFtZGdwdV9hdG9tYmlvc19lbmNvZGVyX2luaXRfYmFja2xpZ2h0KHN0cnVj
dCBhbWRncHVfZW5jb2RlciAqYW1kZ3B1X2VuY29kZXIsCiAJCQkJICAgICBzdHJ1Y3QgZHJtX2Nv
bm5lY3RvciAqZHJtX2Nvbm5lY3RvcikKIHsKKwlERUNMQVJFX0JBQ0tMSUdIVF9JTklUX1JBVyhw
cm9wcywgMCwgQU1ER1BVX01BWF9CTF9MRVZFTCk7CiAJc3RydWN0IGRybV9kZXZpY2UgKmRldiA9
IGFtZGdwdV9lbmNvZGVyLT5iYXNlLmRldjsKIAlzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldiA9
IGRldi0+ZGV2X3ByaXZhdGU7CiAJc3RydWN0IGJhY2tsaWdodF9kZXZpY2UgKmJkOwpAQCAtMTkz
LDkgKzE5NSw2IEBAIHZvaWQgYW1kZ3B1X2F0b21iaW9zX2VuY29kZXJfaW5pdF9iYWNrbGlnaHQo
c3RydWN0IGFtZGdwdV9lbmNvZGVyICphbWRncHVfZW5jb2RlCiAJCWdvdG8gZXJyb3I7CiAJfQog
Ci0JbWVtc2V0KCZwcm9wcywgMCwgc2l6ZW9mKHByb3BzKSk7Ci0JcHJvcHMubWF4X2JyaWdodG5l
c3MgPSBBTURHUFVfTUFYX0JMX0xFVkVMOwotCXByb3BzLnR5cGUgPSBCQUNLTElHSFRfUkFXOwog
CXNucHJpbnRmKGJsX25hbWUsIHNpemVvZihibF9uYW1lKSwKIAkJICJhbWRncHVfYmwlZCIsIGRl
di0+cHJpbWFyeS0+aW5kZXgpOwogCWJkID0gYmFja2xpZ2h0X2RldmljZV9yZWdpc3RlcihibF9u
YW1lLCBkcm1fY29ubmVjdG9yLT5rZGV2LApAQCAtMjEyLDggKzIxMSw4IEBAIHZvaWQgYW1kZ3B1
X2F0b21iaW9zX2VuY29kZXJfaW5pdF9iYWNrbGlnaHQoc3RydWN0IGFtZGdwdV9lbmNvZGVyICph
bWRncHVfZW5jb2RlCiAJZGlnID0gYW1kZ3B1X2VuY29kZXItPmVuY19wcml2OwogCWRpZy0+Ymxf
ZGV2ID0gYmQ7CiAKLQliZC0+cHJvcHMuYnJpZ2h0bmVzcyA9IGFtZGdwdV9hdG9tYmlvc19lbmNv
ZGVyX2dldF9iYWNrbGlnaHRfYnJpZ2h0bmVzcyhiZCk7Ci0JYmQtPnByb3BzLnBvd2VyID0gRkJf
QkxBTktfVU5CTEFOSzsKKwliYWNrbGlnaHRfc2V0X2JyaWdodG5lc3MoYmQsIGFtZGdwdV9hdG9t
Ymlvc19lbmNvZGVyX2dldF9iYWNrbGlnaHRfYnJpZ2h0bmVzcyhiZCkpOworCWJhY2tsaWdodF9z
ZXRfcG93ZXJfb24oYmQpOwogCWJhY2tsaWdodF91cGRhdGVfc3RhdHVzKGJkKTsKIAogCURSTV9J
TkZPKCJhbWRncHUgYXRvbSBESUcgYmFja2xpZ2h0IGluaXRpYWxpemVkXG4iKTsKLS0gCjIuMjUu
MQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRl
dmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8v
bGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
