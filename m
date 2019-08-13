Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 26EEB8E6E3
	for <lists+dri-devel@lfdr.de>; Thu, 15 Aug 2019 10:37:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE2606E946;
	Thu, 15 Aug 2019 08:35:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x74a.google.com (mail-qk1-x74a.google.com
 [IPv6:2607:f8b0:4864:20::74a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B863E6E0EF
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Aug 2019 11:03:43 +0000 (UTC)
Received: by mail-qk1-x74a.google.com with SMTP id x28so19364970qki.21
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Aug 2019 04:03:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=suzgW5VW6Ng90prgpz/ghvx/fVcho6Pl4urYZ0d0Q0c=;
 b=fLsrGDNmxxkou+/lqzAkdGse01GQ75mWbDNm6118FGFJVNJieyQEIymdVnByV63U2Y
 eNh3d2l0FK63/rMnf6PgWBOZGT079wCqnlB+2Sl/vEhuR9fcadcR+CTXnlYO/0rKKhW/
 u8ykGwcGJRF4J9nlrPITq9dsURV15xHAsvZoFwDdSwCq3JXH63vUgvK6MtOU8KfqYTcT
 sJBFzLydh8KXCFAJegz5V863rgbSAZJiSydPVHyJlihD0piThyauofC/NxDdgk65IKL+
 YWIiGDeDQg7L5zpT/89nGqm76fSf3IF5YmctQke39NvLNZ9HdG+s4lBsQ2YHmjqxcjGT
 H7hQ==
X-Gm-Message-State: APjAAAVQcHyyfFHvbBbpFYpo88Hm9paZC4NSTmaanFHMFaViV+dF8oCY
 KQTzEyKMEGATfSljlEF4/i5voZubBAQ8Kgoo0/IzK3rf68aLFfTd3cE1NUrDfKkYEMwGgE04LxR
 fgOSZb4K2HltsJwY9DBhLhy/Q+V+Xh460DV52FvimZYcNtLRepP9BOjQ6hI45Z8L/sS9Uy+iugg
 ==
X-Google-Smtp-Source: APXvYqxH0s5mm6hwQ1otgCG0chGHch91z1fgqZDyPSZRLZ3zhyi2y9k5EKBX3ssntH2nkvkmJsnKCHjxCiI=
X-Received: by 2002:a37:aec7:: with SMTP id x190mr7822514qke.420.1565694222662; 
 Tue, 13 Aug 2019 04:03:42 -0700 (PDT)
Date: Tue, 13 Aug 2019 13:02:33 +0200
In-Reply-To: <20190813110300.83025-1-darekm@google.com>
Message-Id: <20190813110300.83025-2-darekm@google.com>
Mime-Version: 1.0
References: <20190813110300.83025-1-darekm@google.com>
X-Mailer: git-send-email 2.23.0.rc1.153.gdeed80330f-goog
Subject: [PATCH v6 1/8] drm/i915/intel_hdmi: use cec_notifier_conn_(un)register
From: Dariusz Marcinkiewicz <darekm@google.com>
To: dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org, 
 hverkuil-cisco@xs4all.nl
X-Mailman-Approved-At: Thu, 15 Aug 2019 08:34:55 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20161025;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc;
 bh=suzgW5VW6Ng90prgpz/ghvx/fVcho6Pl4urYZ0d0Q0c=;
 b=mAwTBif5SbxpYaq2IikX38jkOeszeUCovNEYab4cHeVN+v697Wp2h3UHSPoj6PQEsx
 gWErNctQhzZZtEathfy//4/gyuApE+oiS/w6iVDZKnkz+CoezIRW4AxGxBuSUH2Vy5mF
 7xblnVtiwRzWYhRluLub87aOD2EYsxBrPidHFfxkOz9l5amojS0yJpWbP6Su1HrpxNc3
 kWT5XLunbopN/uGkEZe7JDJXXDr5wqe1v5U+JvF6UW36PXO+ZA9c2Z8M6mzWjWMmijH4
 c5f6NIh0A1W1Og+SU2pIQAHDrxScIO/Ezb2xFf/KG9z2fMUfhfmORLA9Q0ahhKKDrTGY
 PzdQ==
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
Cc: David Airlie <airlied@linux.ie>, open list <linux-kernel@vger.kernel.org>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Dariusz Marcinkiewicz <darekm@google.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VXNlIHRoZSBuZXcgY2VjX25vdGlmaWVyX2Nvbm5fKHVuKXJlZ2lzdGVyKCkgZnVuY3Rpb25zIHRv
Cih1bilyZWdpc3RlciB0aGUgbm90aWZpZXIgZm9yIHRoZSBIRE1JIGNvbm5lY3RvciwgYW5kIGZp
bGwgaW4KdGhlIGNlY19jb25uZWN0b3JfaW5mby4KClNpZ25lZC1vZmYtYnk6IERhcml1c3ogTWFy
Y2lua2lld2ljeiA8ZGFyZWttQGdvb2dsZS5jb20+ClNpZ25lZC1vZmYtYnk6IEhhbnMgVmVya3Vp
bCA8aHZlcmt1aWwtY2lzY29AeHM0YWxsLm5sPgpUZXN0ZWQtYnk6IEhhbnMgVmVya3VpbCA8aHZl
cmt1aWwtY2lzY29AeHM0YWxsLm5sPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkv
aW50ZWxfaGRtaS5jIHwgMTMgKysrKysrKysrLS0tLQogMSBmaWxlIGNoYW5nZWQsIDkgaW5zZXJ0
aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vaTkx
NS9kaXNwbGF5L2ludGVsX2hkbWkuYyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50
ZWxfaGRtaS5jCmluZGV4IGIxY2E4ZTViZGI1NmQuLjlmY2YyYzU4YzI5YzUgMTAwNjQ0Ci0tLSBh
L2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfaGRtaS5jCisrKyBiL2RyaXZlcnMv
Z3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfaGRtaS5jCkBAIC0yNzUyLDggKzI3NTIsOSBAQCBp
bnRlbF9oZG1pX2Nvbm5lY3Rvcl9yZWdpc3RlcihzdHJ1Y3QgZHJtX2Nvbm5lY3RvciAqY29ubmVj
dG9yKQogCiBzdGF0aWMgdm9pZCBpbnRlbF9oZG1pX2Rlc3Ryb3koc3RydWN0IGRybV9jb25uZWN0
b3IgKmNvbm5lY3RvcikKIHsKLQlpZiAoaW50ZWxfYXR0YWNoZWRfaGRtaShjb25uZWN0b3IpLT5j
ZWNfbm90aWZpZXIpCi0JCWNlY19ub3RpZmllcl9wdXQoaW50ZWxfYXR0YWNoZWRfaGRtaShjb25u
ZWN0b3IpLT5jZWNfbm90aWZpZXIpOworCXN0cnVjdCBjZWNfbm90aWZpZXIgKm4gPSBpbnRlbF9h
dHRhY2hlZF9oZG1pKGNvbm5lY3RvciktPmNlY19ub3RpZmllcjsKKworCWNlY19ub3RpZmllcl9j
b25uX3VucmVnaXN0ZXIobik7CiAKIAlpbnRlbF9jb25uZWN0b3JfZGVzdHJveShjb25uZWN0b3Ip
OwogfQpAQCAtMzA2OCw2ICszMDY5LDcgQEAgdm9pZCBpbnRlbF9oZG1pX2luaXRfY29ubmVjdG9y
KHN0cnVjdCBpbnRlbF9kaWdpdGFsX3BvcnQgKmludGVsX2RpZ19wb3J0LAogCXN0cnVjdCBkcm1f
ZGV2aWNlICpkZXYgPSBpbnRlbF9lbmNvZGVyLT5iYXNlLmRldjsKIAlzdHJ1Y3QgZHJtX2k5MTVf
cHJpdmF0ZSAqZGV2X3ByaXYgPSB0b19pOTE1KGRldik7CiAJZW51bSBwb3J0IHBvcnQgPSBpbnRl
bF9lbmNvZGVyLT5wb3J0OworCXN0cnVjdCBjZWNfY29ubmVjdG9yX2luZm8gY29ubl9pbmZvOwog
CiAJRFJNX0RFQlVHX0tNUygiQWRkaW5nIEhETUkgY29ubmVjdG9yIG9uIHBvcnQgJWNcbiIsCiAJ
CSAgICAgIHBvcnRfbmFtZShwb3J0KSk7CkBAIC0zMTIwLDggKzMxMjIsMTEgQEAgdm9pZCBpbnRl
bF9oZG1pX2luaXRfY29ubmVjdG9yKHN0cnVjdCBpbnRlbF9kaWdpdGFsX3BvcnQgKmludGVsX2Rp
Z19wb3J0LAogCQlJOTE1X1dSSVRFKFBFR19CQU5EX0dBUF9EQVRBLCAodGVtcCAmIH4weGYpIHwg
MHhkKTsKIAl9CiAKLQlpbnRlbF9oZG1pLT5jZWNfbm90aWZpZXIgPSBjZWNfbm90aWZpZXJfZ2V0
X2Nvbm4oZGV2LT5kZXYsCi0JCQkJCQkJIHBvcnRfaWRlbnRpZmllcihwb3J0KSk7CisJY2VjX2Zp
bGxfY29ubl9pbmZvX2Zyb21fZHJtKCZjb25uX2luZm8sIGNvbm5lY3Rvcik7CisKKwlpbnRlbF9o
ZG1pLT5jZWNfbm90aWZpZXIgPQorCQljZWNfbm90aWZpZXJfY29ubl9yZWdpc3RlcihkZXYtPmRl
diwgcG9ydF9pZGVudGlmaWVyKHBvcnQpLAorCQkJCQkgICAmY29ubl9pbmZvKTsKIAlpZiAoIWlu
dGVsX2hkbWktPmNlY19ub3RpZmllcikKIAkJRFJNX0RFQlVHX0tNUygiQ0VDIG5vdGlmaWVyIGdl
dCBmYWlsZWRcbiIpOwogfQotLSAKMi4yMy4wLnJjMS4xNTMuZ2RlZWQ4MDMzMGYtZ29vZwoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1h
aWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
