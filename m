Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 635124B2DA
	for <lists+dri-devel@lfdr.de>; Wed, 19 Jun 2019 09:12:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 53E856E2E9;
	Wed, 19 Jun 2019 07:11:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com
 [IPv6:2607:f8b0:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BFF086E293
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jun 2019 05:27:53 +0000 (UTC)
Received: by mail-pf1-x442.google.com with SMTP id q10so9017212pff.9
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jun 2019 22:27:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ZCDVBhBSdQwjhUcz4qxkFwsgejbQrMll+z7BIFVYRDY=;
 b=hhLh150gSED5lFBmv1xlmqhvD2tlJgK/PXXpqZBSZtxc5//6WoEdCMZl1//L/vB/rP
 1nbBw2RvoB1CozLSR8EIFn3HhTV7ufvqxVRw+52SPvqayrsJG56Dr35sGaeZWFlkdQhl
 FbFn0VsvIZqI4J3Cpq947k5hxMJ7lm5Iz0Qm0VRgADJk+tMj/yMEpK4Xu/ijZ6pL2T6/
 hewLh2lybaMNP7IPeLQ9A8n+G4GdyQUwGCEeIfRuVyHaX4Q2rNbV2WkvPGgA4V0qzLgw
 AzNErHynJ9Vul8pZRMq2ZpR1awVIruF8WahhEztdvx+ILZbebo/sT8YtfHBHJazSrzTr
 JFJw==
X-Gm-Message-State: APjAAAUadiy4156cxLaX1/mijljyCq/J04QqMQj4gswgionzl9GVm/Jm
 EeG+Q0YD6YbiiZBTRm2AHZWukhAELO4=
X-Google-Smtp-Source: APXvYqxqix4U9U5bTiku1r37m+qTXtbfiKflyJpw4QKp2H3PoKmJStqAmpMW/smESx6oF15+HTWaRg==
X-Received: by 2002:a63:511b:: with SMTP id f27mr6001887pgb.135.1560922073067; 
 Tue, 18 Jun 2019 22:27:53 -0700 (PDT)
Received: from localhost.lan (c-24-22-235-96.hsd1.wa.comcast.net.
 [24.22.235.96])
 by smtp.gmail.com with ESMTPSA id l44sm534742pje.29.2019.06.18.22.27.51
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 18 Jun 2019 22:27:52 -0700 (PDT)
From: Andrey Smirnov <andrew.smirnov@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v6 14/15] drm/bridge: tc358767: Replace magic number in
 tc_main_link_enable()
Date: Tue, 18 Jun 2019 22:27:15 -0700
Message-Id: <20190619052716.16831-15-andrew.smirnov@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190619052716.16831-1-andrew.smirnov@gmail.com>
References: <20190619052716.16831-1-andrew.smirnov@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 19 Jun 2019 07:10:14 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ZCDVBhBSdQwjhUcz4qxkFwsgejbQrMll+z7BIFVYRDY=;
 b=S51k0hH7G/P3knDJiHETJE01QvNgGL4FJAvVIGm7IdT9TsBVy07Z1fRsXO0dQ3Fj+y
 yLM2/ieJvkGHUR7st1ZF/bxCaQ298ICHe1vqRdQo/4v10S7cX7Wkp2Rzj+NZ9sy/0BeZ
 zoD9CuTzDa1gfIiyqv3XOQ999loYFYjnB7joFJgKaCGLspk8e1H83a56sLFqdjcwcSPb
 AufVXzZfmes8LHv/qHxpzdODLAnAOMFH++cD5sGsoBjm7RUwJJZ16ZZDY+ImwJbSOLuy
 9qy2dOgt/M5I1N1tg3E9XsASOC3BeEteYdAFZxarPtdGSvlBdx6MjStziL47qlBaGokF
 tUkQ==
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

V2UgZG9uJ3QgbmVlZCA4IGJ5dGUgYXJyYXksIERQX0xJTktfU1RBVFVTX1NJWkUgKDYpIHNob3Vs
ZCBiZQplbm91Z2guIFRoaXMgYWxzbyBnZXRzIHJpZCBvZiBhIG1hZ2ljIG51bWJlciBhcyBhIGJv
bnVzLgoKU2lnbmVkLW9mZi1ieTogQW5kcmV5IFNtaXJub3YgPGFuZHJldy5zbWlybm92QGdtYWls
LmNvbT4KUmV2aWV3ZWQtYnk6IEFuZHJ6ZWogSGFqZGEgPGEuaGFqZGFAc2Ftc3VuZy5jb20+CkNj
OiBBbmRyemVqIEhhamRhIDxhLmhhamRhQHNhbXN1bmcuY29tPgpDYzogTGF1cmVudCBQaW5jaGFy
dCA8TGF1cmVudC5waW5jaGFydEBpZGVhc29uYm9hcmQuY29tPgpDYzogVG9taSBWYWxrZWluZW4g
PHRvbWkudmFsa2VpbmVuQHRpLmNvbT4KQ2M6IEFuZHJleSBHdXNha292IDxhbmRyZXkuZ3VzYWtv
dkBjb2dlbnRlbWJlZGRlZC5jb20+CkNjOiBQaGlsaXBwIFphYmVsIDxwLnphYmVsQHBlbmd1dHJv
bml4LmRlPgpDYzogQ29yeSBUdXNhciA8Y29yeS50dXNhckB6aWkuYWVybz4KQ2M6IENocmlzIEhl
YWx5IDxjcGhlYWx5QGdtYWlsLmNvbT4KQ2M6IEx1Y2FzIFN0YWNoIDxsLnN0YWNoQHBlbmd1dHJv
bml4LmRlPgpDYzogZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpDYzogbGludXgta2Vy
bmVsQHZnZXIua2VybmVsLm9yZwotLS0KIGRyaXZlcnMvZ3B1L2RybS9icmlkZ2UvdGMzNTg3Njcu
YyB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQoK
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2UvdGMzNTg3NjcuYyBiL2RyaXZlcnMv
Z3B1L2RybS9icmlkZ2UvdGMzNTg3NjcuYwppbmRleCBmMGJhZjZkN2NhODAuLjNmOGExNTM5MDgx
MyAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS90YzM1ODc2Ny5jCisrKyBiL2Ry
aXZlcnMvZ3B1L2RybS9icmlkZ2UvdGMzNTg3NjcuYwpAQCAtODU4LDcgKzg1OCw3IEBAIHN0YXRp
YyBpbnQgdGNfbWFpbl9saW5rX2VuYWJsZShzdHJ1Y3QgdGNfZGF0YSAqdGMpCiAJdTMyIGRwX3Bo
eV9jdHJsOwogCXUzMiB2YWx1ZTsKIAlpbnQgcmV0OwotCXU4IHRtcFs4XTsKKwl1OCB0bXBbRFBf
TElOS19TVEFUVVNfU0laRV07CiAKIAlkZXZfZGJnKHRjLT5kZXYsICJsaW5rIGVuYWJsZVxuIik7
CiAKLS0gCjIuMjEuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRl
dmVs
