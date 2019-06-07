Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CBFA38576
	for <lists+dri-devel@lfdr.de>; Fri,  7 Jun 2019 09:45:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7909489A83;
	Fri,  7 Jun 2019 07:43:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com
 [IPv6:2607:f8b0:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 81087899C4
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Jun 2019 04:46:40 +0000 (UTC)
Received: by mail-pf1-x444.google.com with SMTP id a23so463544pff.4
 for <dri-devel@lists.freedesktop.org>; Thu, 06 Jun 2019 21:46:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=nDwCywSe61AQ1huKdlpoPGgNH/JzLRb7/WTxXy4tPVM=;
 b=ekejrOxa0GBPaGFZj1OzvR5NkxlUxdICvAB3njeuNHgJ/QVKM4PcWo6O0MeSIOy/8w
 KZZP9gu4XyngZ95Fm5DlvxymnVXTBtjpCb22Nq8tClg/qmhcFChCv2okZXWZb8CsWy2O
 SYFT8yklHjvzxYCypOt86IqH7Dzn6y99TMsZiWqMH4eQ2MRkOlKQNdRwuH5zNY16yuk2
 JCNwvV6EzM9iwPBvKf4FWpwf9Yy+JjMkb9Amc6g/CSkQI0OBjQdP2vDJp3Upfvg8Cfxd
 AZZZEXl3dsPSeTrKqC9dAz3/E2H/LiRAyFJwJW7ifj88AS55I/bUi9TR+eiSkbch/GiO
 Z2ZA==
X-Gm-Message-State: APjAAAXz4waACGnZM3hg4LqgFC26DUr8Coc68BlCoMTnmEoOy/M6cXUb
 HaI9KTpBMR5s0BZwCyoShtkzBLNK7AU=
X-Google-Smtp-Source: APXvYqySat2DyZ9xoRjJ9Wpbr9PIP1MKA0v9pw1oAYWGEsVd0BXbMu98JyCubWUknFwPYp3UOgHPrQ==
X-Received: by 2002:a17:90a:1951:: with SMTP id
 17mr3432822pjh.79.1559882799751; 
 Thu, 06 Jun 2019 21:46:39 -0700 (PDT)
Received: from localhost.lan (c-24-22-235-96.hsd1.wa.comcast.net.
 [24.22.235.96])
 by smtp.gmail.com with ESMTPSA id o13sm919516pfh.23.2019.06.06.21.46.38
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Thu, 06 Jun 2019 21:46:38 -0700 (PDT)
From: Andrey Smirnov <andrew.smirnov@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v4 09/15] drm/bridge: tc358767: Use reported AUX transfer size
Date: Thu,  6 Jun 2019 21:45:44 -0700
Message-Id: <20190607044550.13361-10-andrew.smirnov@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190607044550.13361-1-andrew.smirnov@gmail.com>
References: <20190607044550.13361-1-andrew.smirnov@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 07 Jun 2019 07:43:41 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=nDwCywSe61AQ1huKdlpoPGgNH/JzLRb7/WTxXy4tPVM=;
 b=rqkuosh7bus1+CQNj1IUovSeUOrdago6Q35nYRMGgLHqAi0vBgspWZgqbfYaIMa4ff
 rg5KytX4vwhB/koX5Fk7aVH7Q8QcEog+0o9I90Jqa97phlmZgYw16KHHA6lytcNWyp7N
 TjUnzHAM3Pq6tsIPpCBiL8wW6rNpe7oaZgcVYIvsC6H1BLQ/yJjB0sdLaxzf7BdGUAKq
 hwtR6quXURXz/heBxGjj1e4WolkLoIuEb6EZx//C16Ii80YfR6g4lo0xXxmrLXjPqotf
 YTIRa0kt3joBYhkQJ0lh75JfKkRQj8OY/qANmrixbScx4IgPGXVOynnVHtJBky0d6YSC
 LCFQ==
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

RG9uJ3QgYXNzdW1lIHRoYXQgcmVxdWVzdGVkIGRhdGEgdHJhbnNmZXIgc2l6ZSBpcyB0aGUgc2Ft
ZSBhcyBhbW91bnQKb2YgZGF0YSB0aGF0IHdhcyB0cmFuc2ZlcnJlZC4gQ2hhbmdlIHRoZSBjb2Rl
IHRvIGdldCB0aGF0IGluZm9ybWF0aW9uCmZyb20gRFAwX0FVWFNUQVRVUyBpbnN0ZWFkLgoKU2lu
Y2UgdGhlIGNoZWNrIGZvciBBVVhfQlVTWSBpbiB0Y19hdXhfZ2V0X3N0YXR1cygpIGlzIHBvaW50
bGVzcyAoaXQKd2lsbCBhbHdheXMgY2FsbGVkIGFmdGVyIHRjX2F1eF93YWl0X2J1c3koKSkgYW5k
IHRoZXJlJ3Mgb25seSBvbmUgdXNlcgpvZiBpdCwgaW5saW5lIGl0cyBjb2RlIGludG8gdGNfYXV4
X3RyYW5zZmVyKCkgaW5zdGVhZCBvZiB0cnlpbmcgdG8KYWNjb21tb2RhdGUgdGhlIGNoYW5nZSBh
Ym92ZS4KClNpZ25lZC1vZmYtYnk6IEFuZHJleSBTbWlybm92IDxhbmRyZXcuc21pcm5vdkBnbWFp
bC5jb20+CkNjOiBBbmRyemVqIEhhamRhIDxhLmhhamRhQHNhbXN1bmcuY29tPgpDYzogTGF1cmVu
dCBQaW5jaGFydCA8TGF1cmVudC5waW5jaGFydEBpZGVhc29uYm9hcmQuY29tPgpDYzogVG9taSBW
YWxrZWluZW4gPHRvbWkudmFsa2VpbmVuQHRpLmNvbT4KQ2M6IEFuZHJleSBHdXNha292IDxhbmRy
ZXkuZ3VzYWtvdkBjb2dlbnRlbWJlZGRlZC5jb20+CkNjOiBQaGlsaXBwIFphYmVsIDxwLnphYmVs
QHBlbmd1dHJvbml4LmRlPgpDYzogQ29yeSBUdXNhciA8Y29yeS50dXNhckB6aWkuYWVybz4KQ2M6
IENocmlzIEhlYWx5IDxjcGhlYWx5QGdtYWlsLmNvbT4KQ2M6IEx1Y2FzIFN0YWNoIDxsLnN0YWNo
QHBlbmd1dHJvbml4LmRlPgpDYzogZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpDYzog
bGludXgta2VybmVsQHZnZXIua2VybmVsLm9yZwotLS0KIGRyaXZlcnMvZ3B1L2RybS9icmlkZ2Uv
dGMzNTg3NjcuYyB8IDQwICsrKysrKysrKystLS0tLS0tLS0tLS0tLS0tLS0tLS0KIDEgZmlsZSBj
aGFuZ2VkLCAxMiBpbnNlcnRpb25zKCspLCAyOCBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9k
cml2ZXJzL2dwdS9kcm0vYnJpZGdlL3RjMzU4NzY3LmMgYi9kcml2ZXJzL2dwdS9kcm0vYnJpZGdl
L3RjMzU4NzY3LmMKaW5kZXggOGI1M2RjODkwOGQzLi43ZDBmYmIxMjE5NWIgMTAwNjQ0Ci0tLSBh
L2RyaXZlcnMvZ3B1L2RybS9icmlkZ2UvdGMzNTg3NjcuYworKysgYi9kcml2ZXJzL2dwdS9kcm0v
YnJpZGdlL3RjMzU4NzY3LmMKQEAgLTE1MiwxMCArMTUyLDEwIEBACiAjZGVmaW5lIERQMF9BVVhX
REFUQShpKQkJKDB4MDY2YyArIChpKSAqIDQpCiAjZGVmaW5lIERQMF9BVVhSREFUQShpKQkJKDB4
MDY3YyArIChpKSAqIDQpCiAjZGVmaW5lIERQMF9BVVhTVEFUVVMJCTB4MDY4YwotI2RlZmluZSBB
VVhfU1RBVFVTX01BU0sJCQkweGYwCi0jZGVmaW5lIEFVWF9TVEFUVVNfU0hJRlQJCTQKLSNkZWZp
bmUgQVVYX1RJTUVPVVQJCQlCSVQoMSkKLSNkZWZpbmUgQVVYX0JVU1kJCQlCSVQoMCkKKyNkZWZp
bmUgQVVYX0JZVEVTCQlHRU5NQVNLKDE1LCA4KQorI2RlZmluZSBBVVhfU1RBVFVTCQlHRU5NQVNL
KDcsIDQpCisjZGVmaW5lIEFVWF9USU1FT1VUCQlCSVQoMSkKKyNkZWZpbmUgQVVYX0JVU1kJCUJJ
VCgwKQogI2RlZmluZSBEUDBfQVVYSTJDQURSCQkweDA2OTgKIAogLyogTGluayBUcmFpbmluZyAq
LwpAQCAtMjk4LDI5ICsyOTgsNiBAQCBzdGF0aWMgaW50IHRjX2F1eF93YWl0X2J1c3koc3RydWN0
IHRjX2RhdGEgKnRjLCB1bnNpZ25lZCBpbnQgdGltZW91dF9tcykKIAkJCSAgICAgICAxMDAwLCAx
MDAwICogdGltZW91dF9tcyk7CiB9CiAKLXN0YXRpYyBpbnQgdGNfYXV4X2dldF9zdGF0dXMoc3Ry
dWN0IHRjX2RhdGEgKnRjLCB1OCAqcmVwbHkpCi17Ci0JaW50IHJldDsKLQl1MzIgdmFsdWU7Ci0K
LQlyZXQgPSByZWdtYXBfcmVhZCh0Yy0+cmVnbWFwLCBEUDBfQVVYU1RBVFVTLCAmdmFsdWUpOwot
CWlmIChyZXQgPCAwKQotCQlyZXR1cm4gcmV0OwotCi0JaWYgKHZhbHVlICYgQVVYX0JVU1kpIHsK
LQkJZGV2X2Vycih0Yy0+ZGV2LCAiYXV4IGJ1c3khXG4iKTsKLQkJcmV0dXJuIC1FQlVTWTsKLQl9
Ci0KLQlpZiAodmFsdWUgJiBBVVhfVElNRU9VVCkgewotCQlkZXZfZXJyKHRjLT5kZXYsICJhdXgg
YWNjZXNzIHRpbWVvdXQhXG4iKTsKLQkJcmV0dXJuIC1FVElNRURPVVQ7Ci0JfQotCi0JKnJlcGx5
ID0gKHZhbHVlICYgQVVYX1NUQVRVU19NQVNLKSA+PiBBVVhfU1RBVFVTX1NISUZUOwotCXJldHVy
biAwOwotfQotCiBzdGF0aWMgaW50IHRjX2F1eF93cml0ZV9kYXRhKHN0cnVjdCB0Y19kYXRhICp0
YywgY29uc3Qgdm9pZCAqZGF0YSwKIAkJCSAgICAgc2l6ZV90IHNpemUpCiB7CkBAIC0zNTYsNiAr
MzMzLDcgQEAgc3RhdGljIHNzaXplX3QgdGNfYXV4X3RyYW5zZmVyKHN0cnVjdCBkcm1fZHBfYXV4
ICphdXgsCiAJc3RydWN0IHRjX2RhdGEgKnRjID0gYXV4X3RvX3RjKGF1eCk7CiAJc2l6ZV90IHNp
emUgPSBtaW5fdChzaXplX3QsIERQX0FVWF9NQVhfUEFZTE9BRF9CWVRFUyAtIDEsIG1zZy0+c2l6
ZSk7CiAJdTggcmVxdWVzdCA9IG1zZy0+cmVxdWVzdCAmIH5EUF9BVVhfSTJDX01PVDsKKwl1MzIg
YXV4c3RhdHVzOwogCWludCByZXQ7CiAKIAlpZiAoc2l6ZSA9PSAwKQpAQCAtMzkzLDEwICszNzEs
MTYgQEAgc3RhdGljIHNzaXplX3QgdGNfYXV4X3RyYW5zZmVyKHN0cnVjdCBkcm1fZHBfYXV4ICph
dXgsCiAJaWYgKHJldCkKIAkJcmV0dXJuIHJldDsKIAotCXJldCA9IHRjX2F1eF9nZXRfc3RhdHVz
KHRjLCAmbXNnLT5yZXBseSk7CisJcmV0ID0gcmVnbWFwX3JlYWQodGMtPnJlZ21hcCwgRFAwX0FV
WFNUQVRVUywgJmF1eHN0YXR1cyk7CiAJaWYgKHJldCkKIAkJcmV0dXJuIHJldDsKIAorCWlmIChh
dXhzdGF0dXMgJiBBVVhfVElNRU9VVCkKKwkJcmV0dXJuIC1FVElNRURPVVQ7CisKKwlzaXplID0g
RklFTERfR0VUKEFVWF9CWVRFUywgYXV4c3RhdHVzKTsKKwltc2ctPnJlcGx5ID0gRklFTERfR0VU
KEFVWF9TVEFUVVMsIGF1eHN0YXR1cyk7CisKIAlzd2l0Y2ggKHJlcXVlc3QpIHsKIAljYXNlIERQ
X0FVWF9OQVRJVkVfUkVBRDoKIAljYXNlIERQX0FVWF9JMkNfUkVBRDoKLS0gCjIuMjEuMAoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1h
aWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
