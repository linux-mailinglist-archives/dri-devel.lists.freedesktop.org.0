Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C1DBF38596
	for <lists+dri-devel@lfdr.de>; Fri,  7 Jun 2019 09:46:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E920189C27;
	Fri,  7 Jun 2019 07:44:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com
 [IPv6:2607:f8b0:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C3ED899D6
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Jun 2019 04:46:42 +0000 (UTC)
Received: by mail-pf1-x443.google.com with SMTP id u22so467941pfm.3
 for <dri-devel@lists.freedesktop.org>; Thu, 06 Jun 2019 21:46:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ZklS6pvicUZ0eZgV6GpKRPOoi/1A0xUpeNx3/aPjUOI=;
 b=TGQL8bYvgbpehnkpGjO4YzGhkCluMJtTwxfvjdqcMWVZCmmKcQjmGg9Hzc8w4WhHv1
 2hLD3zdjymA560NsoaS7JakSN+j9yiH+O8/ogbEUUG4qewgW2mun9dcSfbpylEo+W3pn
 bPcd3ucMlWp/r3F5thWV7C84nsccb2fioF5arwRf34I+6bTusKr647DwLjpx7ioG2GyV
 NILoZzjwtYEbUznwmq+tja3/wJNlAIgYT4yDOwaFfn8jAk1ce54kl46BqgWRDS9QIg5W
 jTS5UgYw8rdJDmc1MWZF6RedlVnF5rvHEFr+NWdpe7aafOgaEkfgqjYwxRa8WB6BLNsF
 m17Q==
X-Gm-Message-State: APjAAAVIg6uQCdrETXN/AhlUDq8ecPJQMPmxkAnxY23yI6h7kL6A9vmo
 +F+syfBIYxr7DB9Buqe/CVrGojX1pCU=
X-Google-Smtp-Source: APXvYqxjQbKhj2ZbX2wC2n96f6CvtKnLMTZtKZGyB/bfY7GaK4nGznNKTwUM0cAIyeS5maEECqbAgw==
X-Received: by 2002:a63:191b:: with SMTP id z27mr1076245pgl.327.1559882801111; 
 Thu, 06 Jun 2019 21:46:41 -0700 (PDT)
Received: from localhost.lan (c-24-22-235-96.hsd1.wa.comcast.net.
 [24.22.235.96])
 by smtp.gmail.com with ESMTPSA id o13sm919516pfh.23.2019.06.06.21.46.39
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Thu, 06 Jun 2019 21:46:40 -0700 (PDT)
From: Andrey Smirnov <andrew.smirnov@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v4 10/15] drm/bridge: tc358767: Add support for address-only
 I2C transfers
Date: Thu,  6 Jun 2019 21:45:45 -0700
Message-Id: <20190607044550.13361-11-andrew.smirnov@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190607044550.13361-1-andrew.smirnov@gmail.com>
References: <20190607044550.13361-1-andrew.smirnov@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 07 Jun 2019 07:43:41 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ZklS6pvicUZ0eZgV6GpKRPOoi/1A0xUpeNx3/aPjUOI=;
 b=jpv0d8+ZXAQ+2X61Nf7nBWIFtO5jUETkOgnHZOlrzKrjsGI+Nn6CALs52tXmnb2gKP
 W3dtrTyDXrsHnQcMfsXIlj22QjR4RPyQ65u1LcqyndTQwnqMXAStyB7Aq3zL7daA8gl/
 01/bV9eyRdVZ/PERH2ltdUb711QiZWR7MrIxvZPZcFEgB9V9f+dDuoE7ufyRMSb5nknI
 tpAsCXG9oaDgQsDjPbBdZQoOSJ1F2JSJzZXYkUqbMt2hkZ+iWGN+0rYx+pAj1xi8pVih
 BmoCcADuUdDn0khUzcpvevIsLtWiCsPSoS9OCk7gt4rAQv1bjh+C54KQ/WB4F/MeanFa
 N6Tw==
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

VHJhbnNmZXIgc2l6ZSBvZiB6ZXJvIG1lYW5zIGEgcmVxdWVzdCB0byBkbyBhbiBhZGRyZXNzLW9u
bHkKdHJhbnNmZXIuIFNpbmNlIHRoZSBIVyBzdXBwb3J0IHRoaXMsIHdlIHByb2JhYmx5IHNob3Vs
ZG4ndCBiZSBqdXN0Cmlnbm9yaW5nIHN1Y2ggcmVxdWVzdHMuIFdoaWxlIGF0IGl0IGFsbG93IERQ
X0FVWF9JMkNfTU9UIGZsYWcgdG8gcGFzcwp0aHJvdWdoLCBzaW5jZSBpdCBpcyBzdXBwb3J0ZWQg
YnkgdGhlIEhXIGFzIHdlbGwuCgpTaWduZWQtb2ZmLWJ5OiBBbmRyZXkgU21pcm5vdiA8YW5kcmV3
LnNtaXJub3ZAZ21haWwuY29tPgpDYzogQW5kcnplaiBIYWpkYSA8YS5oYWpkYUBzYW1zdW5nLmNv
bT4KQ2M6IExhdXJlbnQgUGluY2hhcnQgPExhdXJlbnQucGluY2hhcnRAaWRlYXNvbmJvYXJkLmNv
bT4KQ2M6IFRvbWkgVmFsa2VpbmVuIDx0b21pLnZhbGtlaW5lbkB0aS5jb20+CkNjOiBBbmRyZXkg
R3VzYWtvdiA8YW5kcmV5Lmd1c2Frb3ZAY29nZW50ZW1iZWRkZWQuY29tPgpDYzogUGhpbGlwcCBa
YWJlbCA8cC56YWJlbEBwZW5ndXRyb25peC5kZT4KQ2M6IENvcnkgVHVzYXIgPGNvcnkudHVzYXJA
emlpLmFlcm8+CkNjOiBDaHJpcyBIZWFseSA8Y3BoZWFseUBnbWFpbC5jb20+CkNjOiBMdWNhcyBT
dGFjaCA8bC5zdGFjaEBwZW5ndXRyb25peC5kZT4KQ2M6IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKQ2M6IGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmcKLS0tCiBkcml2ZXJzL2dw
dS9kcm0vYnJpZGdlL3RjMzU4NzY3LmMgfCAzMCArKysrKysrKysrKysrKysrKysrKysrKy0tLS0t
LS0KIDEgZmlsZSBjaGFuZ2VkLCAyMyBpbnNlcnRpb25zKCspLCA3IGRlbGV0aW9ucygtKQoKZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2UvdGMzNTg3NjcuYyBiL2RyaXZlcnMvZ3B1
L2RybS9icmlkZ2UvdGMzNTg3NjcuYwppbmRleCA3ZDBmYmIxMjE5NWIuLjRiYjliMTVlMTMyNCAx
MDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS90YzM1ODc2Ny5jCisrKyBiL2RyaXZl
cnMvZ3B1L2RybS9icmlkZ2UvdGMzNTg3NjcuYwpAQCAtMTQ1LDYgKzE0NSw4IEBACiAKIC8qIEFV
WCBjaGFubmVsICovCiAjZGVmaW5lIERQMF9BVVhDRkcwCQkweDA2NjAKKyNkZWZpbmUgRFAwX0FV
WENGRzBfQlNJWkUJR0VOTUFTSygxMSwgOCkKKyNkZWZpbmUgRFAwX0FVWENGRzBfQUREUl9PTkxZ
CUJJVCg0KQogI2RlZmluZSBEUDBfQVVYQ0ZHMQkJMHgwNjY0CiAjZGVmaW5lIEFVWF9SWF9GSUxU
RVJfRU4JCUJJVCgxNikKIApAQCAtMzI3LDYgKzMyOSwxOCBAQCBzdGF0aWMgaW50IHRjX2F1eF9y
ZWFkX2RhdGEoc3RydWN0IHRjX2RhdGEgKnRjLCB2b2lkICpkYXRhLCBzaXplX3Qgc2l6ZSkKIAly
ZXR1cm4gc2l6ZTsKIH0KIAorc3RhdGljIHUzMiB0Y19hdXhjZmcwKHN0cnVjdCBkcm1fZHBfYXV4
X21zZyAqbXNnLCBzaXplX3Qgc2l6ZSkKK3sKKwl1MzIgYXV4Y2ZnMCA9IG1zZy0+cmVxdWVzdDsK
KworCWlmIChzaXplKQorCQlhdXhjZmcwIHw9IEZJRUxEX1BSRVAoRFAwX0FVWENGRzBfQlNJWkUs
IHNpemUgLSAxKTsKKwllbHNlCisJCWF1eGNmZzAgfD0gRFAwX0FVWENGRzBfQUREUl9PTkxZOwor
CisJcmV0dXJuIGF1eGNmZzA7Cit9CisKIHN0YXRpYyBzc2l6ZV90IHRjX2F1eF90cmFuc2Zlcihz
dHJ1Y3QgZHJtX2RwX2F1eCAqYXV4LAogCQkJICAgICAgIHN0cnVjdCBkcm1fZHBfYXV4X21zZyAq
bXNnKQogewpAQCAtMzM2LDkgKzM1MCw2IEBAIHN0YXRpYyBzc2l6ZV90IHRjX2F1eF90cmFuc2Zl
cihzdHJ1Y3QgZHJtX2RwX2F1eCAqYXV4LAogCXUzMiBhdXhzdGF0dXM7CiAJaW50IHJldDsKIAot
CWlmIChzaXplID09IDApCi0JCXJldHVybiAwOwotCiAJcmV0ID0gdGNfYXV4X3dhaXRfYnVzeSh0
YywgMTAwKTsKIAlpZiAocmV0KQogCQlyZXR1cm4gcmV0OwpAQCAtMzYyLDggKzM3Myw3IEBAIHN0
YXRpYyBzc2l6ZV90IHRjX2F1eF90cmFuc2ZlcihzdHJ1Y3QgZHJtX2RwX2F1eCAqYXV4LAogCWlm
IChyZXQpCiAJCXJldHVybiByZXQ7CiAJLyogU3RhcnQgdHJhbnNmZXIgKi8KLQlyZXQgPSByZWdt
YXBfd3JpdGUodGMtPnJlZ21hcCwgRFAwX0FVWENGRzAsCi0JCQkgICAoKHNpemUgLSAxKSA8PCA4
KSB8IHJlcXVlc3QpOworCXJldCA9IHJlZ21hcF93cml0ZSh0Yy0+cmVnbWFwLCBEUDBfQVVYQ0ZH
MCwgdGNfYXV4Y2ZnMChtc2csIHNpemUpKTsKIAlpZiAocmV0KQogCQlyZXR1cm4gcmV0OwogCkBA
IC0zNzcsOCArMzg3LDE0IEBAIHN0YXRpYyBzc2l6ZV90IHRjX2F1eF90cmFuc2ZlcihzdHJ1Y3Qg
ZHJtX2RwX2F1eCAqYXV4LAogCiAJaWYgKGF1eHN0YXR1cyAmIEFVWF9USU1FT1VUKQogCQlyZXR1
cm4gLUVUSU1FRE9VVDsKLQotCXNpemUgPSBGSUVMRF9HRVQoQVVYX0JZVEVTLCBhdXhzdGF0dXMp
OworCS8qCisJICogRm9yIHNvbWUgcmVhc29uIGFkZHJlc3Mtb25seSBEUF9BVVhfSTJDX1dSSVRF
IChNT1QpLCBzdGlsbAorCSAqIHJlcG9ydHMgMSBieXRlIHRyYW5zZmVycmVkIGluIGl0cyBzdGF0
dXMuIFRvIGRlYWwgd2UgdGhhdAorCSAqIHdlIGlnbm9yZSBhdXhfYnl0ZXMgZmllbGQgaWYgd2Ug
a25vdyB0aGF0IHRoaXMgd2FzIGFuCisJICogYWRkcmVzcy1vbmx5IHRyYW5zZmVyCisJICovCisJ
aWYgKHNpemUpCisJCXNpemUgPSBGSUVMRF9HRVQoQVVYX0JZVEVTLCBhdXhzdGF0dXMpOwogCW1z
Zy0+cmVwbHkgPSBGSUVMRF9HRVQoQVVYX1NUQVRVUywgYXV4c3RhdHVzKTsKIAogCXN3aXRjaCAo
cmVxdWVzdCkgewotLSAKMi4yMS4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5m
by9kcmktZGV2ZWw=
