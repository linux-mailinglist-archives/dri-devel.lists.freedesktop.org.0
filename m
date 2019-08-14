Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 141DD8E6D4
	for <lists+dri-devel@lfdr.de>; Thu, 15 Aug 2019 10:37:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2FF796E92C;
	Thu, 15 Aug 2019 08:35:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vk1-xa4a.google.com (mail-vk1-xa4a.google.com
 [IPv6:2607:f8b0:4864:20::a4a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3DAB06E529
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Aug 2019 10:45:46 +0000 (UTC)
Received: by mail-vk1-xa4a.google.com with SMTP id x71so38019047vkd.15
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Aug 2019 03:45:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=suzgW5VW6Ng90prgpz/ghvx/fVcho6Pl4urYZ0d0Q0c=;
 b=Vw4KKCjzDhH06wwYONQQUicxJhvK7eoRSfchJqmDYYjKmBqbkjr1KTe1tGV4U5mC2Q
 OI9iorhK3UIvqMJKm17tEchKt00yGc0uHoe2jRSWzwZoJngL0RkCdbjKgVShZogfRouC
 NHCRIzkifuynK+rNNUlyvOwFMiJq+PIWm8gkMfcl48slATY/AcMZBdM0HjRHOos5dhMT
 9d/bw2yQzoZOJtpm8jfD84c+3+nRcBO2Thk2+MGcWsjdsFe/9AKoTZY47/I+JWqoXBEJ
 0EiOW4uFJuLpzO4Wu/kNZECMeWb6AUqOqmqRuYv/Qu7DiZguPj4myybDfYcO7yitdwp/
 cmwQ==
X-Gm-Message-State: APjAAAX5mkTrQjKRdOGwjUO4bwdybdGEB9Mu45LTw8YZ9PCR1RPM5EPf
 lSd6JG7KFvxP8lfnPBsX1k08i2Xlphf15Be0zyuztvaVwj0qXtv7WHmI95sCdFvrSnjH4daXcBL
 GhHq0AzxmOJXiHQyyq6GFMfaTDsjpfzPIPHcJBq9rHAa7FAlveSPgTaELKKT6G73LZbYT7MfuRA
 ==
X-Google-Smtp-Source: APXvYqy2T8ZzD5xkHgUSqk7raFy1jd0urGCFCByhxKXfqSbhhtzmjZm/8Oyftss+nvV1arSJ2jUJFkSDHpQ=
X-Received: by 2002:a1f:93cd:: with SMTP id v196mr11075937vkd.84.1565779544819; 
 Wed, 14 Aug 2019 03:45:44 -0700 (PDT)
Date: Wed, 14 Aug 2019 12:45:00 +0200
In-Reply-To: <20190814104520.6001-1-darekm@google.com>
Message-Id: <20190814104520.6001-3-darekm@google.com>
Mime-Version: 1.0
References: <20190814104520.6001-1-darekm@google.com>
X-Mailer: git-send-email 2.23.0.rc1.153.gdeed80330f-goog
Subject: [PATCH v7 2/9] drm/i915/intel_hdmi: use cec_notifier_conn_(un)register
From: Dariusz Marcinkiewicz <darekm@google.com>
To: dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org, 
 hverkuil-cisco@xs4all.nl
X-Mailman-Approved-At: Thu, 15 Aug 2019 08:34:55 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20161025;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc;
 bh=suzgW5VW6Ng90prgpz/ghvx/fVcho6Pl4urYZ0d0Q0c=;
 b=Mv4TEqYa23uJDtobaDY6OSoe+shBIF5XVxXALV+QFVPinFL0cqfxETuiYnTHfikeS0
 beLlJ1+BBIyTAhKd1JqnpQo3tivf3SZ9z9nk7oObNoNce/6RSi9vJcKeItZ2Ap6i16TF
 sO16PNkbi+BrhuokCdIAorhyUJfLy4AtshgXt9ebmMQnJJ4M0k+SuwLsbI7Bsm4wqfct
 I0WU4v/LGzR40UT/Gan8eztP4Nk3Z3k9qcxdtOaJVCJucEb4gb4HXBGf3mNS7bdkYmZf
 laScErz8C4mR2ZvF1JR64oYbIgVooQF19lNDFb3YDWHqMnlxLTlgGCYy+McMlra+GR7H
 AOwQ==
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
Cc: David Airlie <airlied@linux.ie>, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Rodrigo Vivi <rodrigo.vivi@intel.com>,
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
