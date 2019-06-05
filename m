Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 30050357DE
	for <lists+dri-devel@lfdr.de>; Wed,  5 Jun 2019 09:33:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 910D4895EE;
	Wed,  5 Jun 2019 07:33:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com
 [IPv6:2607:f8b0:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 32DC18901E
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Jun 2019 07:05:32 +0000 (UTC)
Received: by mail-pf1-x444.google.com with SMTP id c85so5505987pfc.1
 for <dri-devel@lists.freedesktop.org>; Wed, 05 Jun 2019 00:05:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=RWa3xMhIG7h2ZDJedBrnEPzMrydSyBPoX1txGwYk6+U=;
 b=ZDBGB/we/CicYZinN4nBT7IDvs3oAaXyIlwMWDXHA/EXKk1WYsQYmXg/PEliYR+6nE
 aN1o2+lWf+ZmZ2WKGuTskwB3cG6VHJdkGkVcSQtcMatZS927dLCJvjqa62oGhp1ZK2zp
 7Mu/daC6Nhyn2dQEUW529fbdCa8pX3+7jkR66DXDp19UDmAIuSGe+FtHo3jlCngy9r85
 B8/8QpOspjU0zx9VkOfKgiQYWE6xDKOgEaWinhKn7JtCshsn4a5S7rC0B2gsKovLGzeb
 WRQCfDjyWFmMBkp1R0G5u4SLMMdGBdIYHV0VdLjHaaEtFXAlyOGTFFASqDXjKbfOA1sJ
 Nn3A==
X-Gm-Message-State: APjAAAWX5OWhK2Op/JdUMY+rFsKO7u4M2Ea/sxN1Jd1WysOckIFiIRB5
 PFs+Fioqm4UdfGeW6lk4KOWkiOYDffA=
X-Google-Smtp-Source: APXvYqzfIFPHQiaOX73DfBXVOSKeNpTqj0fwulD+Nk3oYEtTenve0VlAKDYYowF5v2VUvbCDLrLCrA==
X-Received: by 2002:a17:90a:ae10:: with SMTP id
 t16mr42228780pjq.51.1559718331351; 
 Wed, 05 Jun 2019 00:05:31 -0700 (PDT)
Received: from localhost.lan (c-24-22-235-96.hsd1.wa.comcast.net.
 [24.22.235.96])
 by smtp.gmail.com with ESMTPSA id d132sm6527348pfd.61.2019.06.05.00.05.29
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 05 Jun 2019 00:05:30 -0700 (PDT)
From: Andrey Smirnov <andrew.smirnov@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v3 06/15] drm/bridge: tc358767: Simplify AUX data read
Date: Wed,  5 Jun 2019 00:04:58 -0700
Message-Id: <20190605070507.11417-7-andrew.smirnov@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190605070507.11417-1-andrew.smirnov@gmail.com>
References: <20190605070507.11417-1-andrew.smirnov@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 05 Jun 2019 07:33:23 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=RWa3xMhIG7h2ZDJedBrnEPzMrydSyBPoX1txGwYk6+U=;
 b=pjTQEQM/NCzvm3rKIdA/jf1ynZxiZDf1SDBIDA4M3O+FwsyScIvnbcO2uajRBeDUtB
 H8KwDgjBWXNTr778cITsLegfEbxsGpzdjdTK2zo6F2G4Iy0xZDr9X2D9/0I3P5O51IiJ
 ITp6L+msYtdfxpBb5c+q+0dWFCgZTqojOjEjocVxnPZGZzwE5BHpVOVZZskAAsXR2Ij1
 l5iMa1GGT5zjOTltNAP63i3RWMc2hHDu1xt1opU8JDqDW9EXuaOdOCj9fKVJLzDZ5lPK
 l/CFuL1ntsYHcdvBYjgg5CfcnQaSxnTuzQcLJr9XizuEUxe0QIMS44IbHJkiTP5KDtxV
 QHLg==
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
Cc: Cory Tusar <cory.tusar@zii.aero>, Archit Taneja <architt@codeaurora.org>,
 Andrey Smirnov <andrew.smirnov@gmail.com>,
 Andrey Gusakov <andrey.gusakov@cogentembedded.com>,
 linux-kernel@vger.kernel.org, Tomi Valkeinen <tomi.valkeinen@ti.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Chris Healy <cphealy@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

U2ltcGxpZnkgQVVYIGRhdGEgcmVhZCBieSByZW1vdmluZyBpbmRleCBhcml0aG1ldGljIGFuZCBz
aGlmdGluZyB3aXRoCmEgaGVscGVyIGZ1bmN0aW9ucyB0aGF0IGRvZXMgdGhyZWUgdGhpbmdzOgoK
ICAgIDEuIEZldGNoIGRhdGEgZnJvbSB1cCB0byA0IDMyLWJpdCByZWdpc3RlcnMgZnJvbSB0aGUg
Y2hpcAogICAgMi4gT3B0aW9uYWxseSBmaXggZGF0YSBlbmRpYW5uZXNzIChub3QgbmVlZGVkIG9u
IExFIGhvc3RzKQogICAgMy4gQ29weSByZWFkIGRhdGEgaW50byB1c2VyIHByb3ZpZGVkIGFycmF5
LgoKU2lnbmVkLW9mZi1ieTogQW5kcmV5IFNtaXJub3YgPGFuZHJldy5zbWlybm92QGdtYWlsLmNv
bT4KQ2M6IEFyY2hpdCBUYW5lamEgPGFyY2hpdHRAY29kZWF1cm9yYS5vcmc+CkNjOiBBbmRyemVq
IEhhamRhIDxhLmhhamRhQHNhbXN1bmcuY29tPgpDYzogTGF1cmVudCBQaW5jaGFydCA8TGF1cmVu
dC5waW5jaGFydEBpZGVhc29uYm9hcmQuY29tPgpDYzogVG9taSBWYWxrZWluZW4gPHRvbWkudmFs
a2VpbmVuQHRpLmNvbT4KQ2M6IEFuZHJleSBHdXNha292IDxhbmRyZXkuZ3VzYWtvdkBjb2dlbnRl
bWJlZGRlZC5jb20+CkNjOiBQaGlsaXBwIFphYmVsIDxwLnphYmVsQHBlbmd1dHJvbml4LmRlPgpD
YzogQ29yeSBUdXNhciA8Y29yeS50dXNhckB6aWkuYWVybz4KQ2M6IENocmlzIEhlYWx5IDxjcGhl
YWx5QGdtYWlsLmNvbT4KQ2M6IEx1Y2FzIFN0YWNoIDxsLnN0YWNoQHBlbmd1dHJvbml4LmRlPgpD
YzogZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpDYzogbGludXgta2VybmVsQHZnZXIu
a2VybmVsLm9yZwotLS0KIGRyaXZlcnMvZ3B1L2RybS9icmlkZ2UvdGMzNTg3NjcuYyB8IDQwICsr
KysrKysrKysrKysrKysrKysrKy0tLS0tLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCAyNyBpbnNlcnRp
b25zKCspLCAxMyBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYnJp
ZGdlL3RjMzU4NzY3LmMgYi9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3RjMzU4NzY3LmMKaW5kZXgg
ZTE5N2NlMGZiMTY2Li5kYTQ3ZDgxZTcxMDkgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9i
cmlkZ2UvdGMzNTg3NjcuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3RjMzU4NzY3LmMK
QEAgLTMyMSw2ICszMjEsMjkgQEAgc3RhdGljIGludCB0Y19hdXhfZ2V0X3N0YXR1cyhzdHJ1Y3Qg
dGNfZGF0YSAqdGMsIHU4ICpyZXBseSkKIAlyZXR1cm4gMDsKIH0KIAorc3RhdGljIGludCB0Y19h
dXhfcmVhZF9kYXRhKHN0cnVjdCB0Y19kYXRhICp0Yywgdm9pZCAqZGF0YSwgc2l6ZV90IHNpemUp
Cit7CisJdTMyIGF1eHJkYXRhW0RQX0FVWF9NQVhfUEFZTE9BRF9CWVRFUyAvIHNpemVvZih1MzIp
XTsKKwlpbnQgcmV0LCBpLCBjb3VudCA9IERJVl9ST1VORF9VUChzaXplLCBzaXplb2YodTMyKSk7
CisKKwlyZXQgPSByZWdtYXBfYnVsa19yZWFkKHRjLT5yZWdtYXAsIERQMF9BVVhSREFUQSgwKSwg
YXV4cmRhdGEsIGNvdW50KTsKKwlpZiAocmV0KQorCQlyZXR1cm4gcmV0OworCisJZm9yIChpID0g
MDsgaSA8IGNvdW50OyBpKyspIHsKKwkJLyoKKwkJICogT3VyIHJlZ21hcCBpcyBjb25maWd1cmVk
IGFzIExFIGZvciByZWdpc3RlciBkYXRhLAorCQkgKiBzbyB3ZSBuZWVkIHVuZG8gYW55IGJ5dGUg
c3dhcHBpbmcgdGhhdCBtaWdodCBoYXZlCisJCSAqIGhhcHBlbmVkIHRvIHByZXNlcnZlIG9yaWdp
bmFsIGJ5dGUgb3JkZXIuCisJCSAqLworCQlsZTMyX3RvX2NwdXMoJmF1eHJkYXRhW2ldKTsKKwl9
CisKKwltZW1jcHkoZGF0YSwgYXV4cmRhdGEsIHNpemUpOworCisJcmV0dXJuIHNpemU7Cit9CisK
IHN0YXRpYyBzc2l6ZV90IHRjX2F1eF90cmFuc2ZlcihzdHJ1Y3QgZHJtX2RwX2F1eCAqYXV4LAog
CQkJICAgICAgIHN0cnVjdCBkcm1fZHBfYXV4X21zZyAqbXNnKQogewpAQCAtMzc5LDE5ICs0MDIs
MTAgQEAgc3RhdGljIHNzaXplX3QgdGNfYXV4X3RyYW5zZmVyKHN0cnVjdCBkcm1fZHBfYXV4ICph
dXgsCiAJaWYgKHJldCkKIAkJcmV0dXJuIHJldDsKIAotCWlmIChyZXF1ZXN0ID09IERQX0FVWF9J
MkNfUkVBRCB8fCByZXF1ZXN0ID09IERQX0FVWF9OQVRJVkVfUkVBRCkgewotCQkvKiBSZWFkIGRh
dGEgKi8KLQkJd2hpbGUgKGkgPCBzaXplKSB7Ci0JCQlpZiAoKGkgJSA0KSA9PSAwKSB7Ci0JCQkJ
cmV0ID0gcmVnbWFwX3JlYWQodGMtPnJlZ21hcCwKLQkJCQkJCSAgRFAwX0FVWFJEQVRBKGkgPj4g
MiksICZ0bXApOwotCQkJCWlmIChyZXQpCi0JCQkJCXJldHVybiByZXQ7Ci0JCQl9Ci0JCQlidWZb
aV0gPSB0bXAgJiAweGZmOwotCQkJdG1wID0gdG1wID4+IDg7Ci0JCQlpKys7Ci0JCX0KKwlzd2l0
Y2ggKHJlcXVlc3QpIHsKKwljYXNlIERQX0FVWF9OQVRJVkVfUkVBRDoKKwljYXNlIERQX0FVWF9J
MkNfUkVBRDoKKwkJcmV0dXJuIHRjX2F1eF9yZWFkX2RhdGEodGMsIG1zZy0+YnVmZmVyLCBzaXpl
KTsKIAl9CiAKIAlyZXR1cm4gc2l6ZTsKLS0gCjIuMjEuMAoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2
ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21h
aWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
