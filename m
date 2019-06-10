Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 520153BE36
	for <lists+dri-devel@lfdr.de>; Mon, 10 Jun 2019 23:18:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2819489131;
	Mon, 10 Jun 2019 21:18:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com
 [IPv6:2607:f8b0:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B770C8914B
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Jun 2019 21:18:20 +0000 (UTC)
Received: by mail-pf1-x442.google.com with SMTP id d126so6014220pfd.2
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Jun 2019 14:18:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=vsVuZqN3BZSGA+LoVgx6ta+tF2PXiYDgRAf6MbHU3GI=;
 b=Y4WG7DUjJ8odUXLb4aJq0Ipd0kOywwIpCFQHHzTxTLKc7FY7saQ37uaX4WFOHx6o/b
 7ornCpZSkey8CXg6TaaHruW1865lawGv4ulgXaCIB0y8hvWgrC9b8gLJvOw5adVm2MiS
 Z/jaQ2Zecn5KolRyW1p5kdbVqWsV8+qqYYJ0K4OTStqGOyeCJ0plUOV3ruLqmZOFzlt8
 KSSA08cfLJWF6+ZQ0RfvDx7JaGocdQy1d5KEMOiyLuzRMErWdZmQT75yuNRdY7md6vbw
 rdvlcrdAbEOaeDKSTLhI9MLi4r0jaeiWIjW9qHdiAlsrnAkL6+ex0Mf2pldIsI1uTCn1
 A5hg==
X-Gm-Message-State: APjAAAVQGviogRvspyiQP3dpJ8QIBVxfmWZvbdzNpi40XnpFH8oXkwGH
 k4khEL71L0pRhSJADp5pfba8JA==
X-Google-Smtp-Source: APXvYqyAAVeRLFb2ZVyVA/0TT4TC0xtqnzO+EKpJMFECU/BWdHQEiQ+mA4zE+9LfkIxP0C4B1c4e9Q==
X-Received: by 2002:aa7:8188:: with SMTP id g8mr26139750pfi.221.1560201500417; 
 Mon, 10 Jun 2019 14:18:20 -0700 (PDT)
Received: from localhost ([2620:15c:202:1:e9ae:bd45:1bd9:e60d])
 by smtp.gmail.com with ESMTPSA id z15sm10573320pge.40.2019.06.10.14.18.19
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 10 Jun 2019 14:18:19 -0700 (PDT)
From: davidriley@chromium.org
To: Gerd Hoffmann <kraxel@redhat.com>, dri-devel@lists.freedesktop.org,
 virtualization@lists.linux-foundation.org
Subject: [PATCH v2 1/4] drm/virtio: Ensure cached capset entries are valid
 before copying.
Date: Mon, 10 Jun 2019 14:18:07 -0700
Message-Id: <20190610211810.253227-2-davidriley@chromium.org>
X-Mailer: git-send-email 2.22.0.rc2.383.gf4fbbf30c2-goog
In-Reply-To: <20190605234423.11348-1-davidriley@chromium.org>
References: <20190605234423.11348-1-davidriley@chromium.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=vsVuZqN3BZSGA+LoVgx6ta+tF2PXiYDgRAf6MbHU3GI=;
 b=iOFhp97OR2XlAA4aQQYWlKmqqKyQE7mzMS+NyecweCZB2em2RWpyOF7yGs/OR4EsPo
 HLRUd7mFxlWl/mhy46zcVHdx1fam2I7BLziF07sxeXDAmX7xJ84JATe1nfiqQpAWfxSH
 aTL2zNkINzYLA9wyQl5EnKhO2k505n8llkvpA=
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
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org
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
VDsKIAotLSAKMi4yMi4wLnJjMi4zODMuZ2Y0ZmJiZjMwYzItZ29vZwoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApk
cmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
