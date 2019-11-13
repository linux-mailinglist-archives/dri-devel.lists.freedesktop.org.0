Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 651C1FB57E
	for <lists+dri-devel@lfdr.de>; Wed, 13 Nov 2019 17:45:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4439C6EDAC;
	Wed, 13 Nov 2019 16:45:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [207.211.31.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 396CA6EDB0
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Nov 2019 16:45:02 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-163-tcumICipNAGYMyDQhwYdsQ-1; Wed, 13 Nov 2019 11:44:58 -0500
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 841FE107E28C;
 Wed, 13 Nov 2019 16:44:56 +0000 (UTC)
Received: from shalem.localdomain.com (ovpn-116-143.ams2.redhat.com
 [10.36.116.143])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E5A9B10E1B43;
 Wed, 13 Nov 2019 16:44:54 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Maxime Ripard <mripard@kernel.org>, Sean Paul <seanpaul@chromium.org>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>
Subject: [PATCH v2 11/13] drm/modes: parse_cmdline: Explicitly memset the
 passed in drm_cmdline_mode struct
Date: Wed, 13 Nov 2019 17:44:32 +0100
Message-Id: <20191113164434.254159-11-hdegoede@redhat.com>
In-Reply-To: <20191113164434.254159-1-hdegoede@redhat.com>
References: <20191113164434.254159-1-hdegoede@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-MC-Unique: tcumICipNAGYMyDQhwYdsQ-1
X-Mimecast-Spam-Score: 0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=redhat.com; 
 s=mimecast20190719; t=1573663501;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3dyWM2OCNFcaZOjXzH1Y6N6M49ofEjeKpRifqhvKJFA=;
 b=PHrxibO3zo4IHtFbpNwqLXHfa0ePFkth/sOVeriRUYrYBZsOREL4LcBmOE44CNJ/w0phBG
 WLQ28lmo4UbGStnn3KHo7tF4A18ARFTwEKtr3qpMRxON4K7MC0emGFNR/tBHVLeq/ecBTF
 v3mJpJmYa6dmpWqx72hywrXbifQtMMA=
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
Cc: Hans de Goede <hdegoede@redhat.com>,
 Derek Basehore <dbasehore@chromium.org>,
 =?UTF-8?q?Mathieu=20Alexandre-T=C3=A9treault?= <alexandretm@amotus.ca>,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SW5zdGVhZCBvZiBvbmx5IHNldHRpbmcgbW9kZS0+c3BlY2lmaWVkIG9uIGZhbHNlIG9uIGFuIGVh
cmx5IGV4aXQgYW5kCmxlYXZpbmcgZS5nLiBtb2RlLT5icHBfc3BlY2lmaWVkIGFuZCBtb2RlLT5y
ZWZyZXNoX3NwZWNpZmllZCBhcyBpcywKbGV0cyBiZSBjb25zaXN0ZW50IGFuZCBqdXN0IHplcm8g
b3V0IHRoZSBlbnRpcmUgcGFzc2VkIGluIHN0cnVjdCBhdAp0aGUgdG9wIG9mIGRybV9tb2RlX3Bh
cnNlX2NvbW1hbmRfbGluZV9mb3JfY29ubmVjdG9yKCkKClNpZ25lZC1vZmYtYnk6IEhhbnMgZGUg
R29lZGUgPGhkZWdvZWRlQHJlZGhhdC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2RybV9tb2Rl
cy5jIHwgNSArKy0tLQogMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlv
bnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vZHJtX21vZGVzLmMgYi9kcml2ZXJz
L2dwdS9kcm0vZHJtX21vZGVzLmMKaW5kZXggYmViNzY0ZWZlNmIzLi4xZmVlNGE3MWVmZjcgMTAw
NjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fbW9kZXMuYworKysgYi9kcml2ZXJzL2dwdS9k
cm0vZHJtX21vZGVzLmMKQEAgLTE3NDUsMTIgKzE3NDUsMTEgQEAgYm9vbCBkcm1fbW9kZV9wYXJz
ZV9jb21tYW5kX2xpbmVfZm9yX2Nvbm5lY3Rvcihjb25zdCBjaGFyICptb2RlX29wdGlvbiwKIAlj
aGFyICpicHBfZW5kX3B0ciA9IE5VTEwsICpyZWZyZXNoX2VuZF9wdHIgPSBOVUxMOwogCWludCBp
LCBsZW4sIHJldDsKIAorCW1lbXNldChtb2RlLCAwLCBzaXplb2YoKm1vZGUpKTsKIAltb2RlLT5w
YW5lbF9vcmllbnRhdGlvbiA9IERSTV9NT0RFX1BBTkVMX09SSUVOVEFUSU9OX1VOS05PV047CiAK
LQlpZiAoIW1vZGVfb3B0aW9uKSB7CisJaWYgKCFtb2RlX29wdGlvbikKIAkJbW9kZS0+c3BlY2lm
aWVkID0gZmFsc2U7Ci0JCXJldHVybiBmYWxzZTsKLQl9CiAKIAluYW1lID0gbW9kZV9vcHRpb247
CiAKLS0gCjIuMjMuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRl
dmVs
