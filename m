Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 047CD95982
	for <lists+dri-devel@lfdr.de>; Tue, 20 Aug 2019 10:29:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 419BC6E830;
	Tue, 20 Aug 2019 08:19:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x543.google.com (mail-ed1-x543.google.com
 [IPv6:2a00:1450:4864:20::543])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C7B36E82A
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Aug 2019 08:19:15 +0000 (UTC)
Received: by mail-ed1-x543.google.com with SMTP id m44so5342304edd.9
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Aug 2019 01:19:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=qZjzrRlZLlBFvOCMrk8fj5ec19AHD7NWtYEFTJfXwxg=;
 b=Wr/gQR2G1Rx4KnK7WvGA2E3M2JbwqcJ8DpLpLglpiad8FInChXJEWsk77Nku34HCN/
 73FjYWRnEGMpJ6AXQ3sce1IYoUhoiohGrpLD3up0ZwBH7RlCGGWt6fRQRzaXld3VKkr2
 gbJCFUkwv/EFKkFCEERzIXAJDDy8Y33lSRQYgvGwZVs8v4KQQtKqTmu4lmgxwqt9lrIT
 lB9TG6FUy8Z8wSBLyBdGk5JHROAHmYBmiFJdRmxeNztX7fIaS6kJuQmvdZon43/3414x
 Llwh41Bj4AmLvgyERgrLiN/B0vIRz5LtjVlmjudR8MNwm3z+kOG8dvOGl/7a8kWljl7L
 7MgQ==
X-Gm-Message-State: APjAAAUxB9W1UpVUJePtv3KJcJQOxd3E5QBBCaK6UMNdkIel0+am4K4p
 npArj2I4SYpasFXpD2cIjzNyxw==
X-Google-Smtp-Source: APXvYqwpUTAeK0tqJjN6py6Pg1Ep5nMFRaQeoDTkIIz0n/eBEVwxM4rYPXYBIaOECS38AYG5tsgjYg==
X-Received: by 2002:a17:906:f2d0:: with SMTP id
 gz16mr24236150ejb.21.1566289153507; 
 Tue, 20 Aug 2019 01:19:13 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:569e:0:3106:d637:d723:e855])
 by smtp.gmail.com with ESMTPSA id fj15sm2469623ejb.78.2019.08.20.01.19.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Aug 2019 01:19:12 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: LKML <linux-kernel@vger.kernel.org>
Subject: [PATCH 4/4] mm, notifier: Catch sleeping/blocking for !blockable
Date: Tue, 20 Aug 2019 10:19:02 +0200
Message-Id: <20190820081902.24815-5-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.23.0.rc1
In-Reply-To: <20190820081902.24815-1-daniel.vetter@ffwll.ch>
References: <20190820081902.24815-1-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=qZjzrRlZLlBFvOCMrk8fj5ec19AHD7NWtYEFTJfXwxg=;
 b=k0TQLN1Nox1/M2ISzbAc4zHTlgcsKT0BXPGsZZPpOBqREaDXPeFdyc1XMaGAKvIGx9
 QxjK/4tpciokI/Wa88F954/rhr+3602xdbDv1jh7RSBhbC+T9zEzICLRcmUaOI2umUXJ
 dsXauR/20FNGp0zT6Wb3KfuJRD0AlIWDKNULA=
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
Cc: Michal Hocko <mhocko@suse.com>, Linux MM <linux-mm@kvack.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Jason Gunthorpe <jgg@ziepe.ca>,
 =?UTF-8?q?J=C3=A9r=C3=B4me=20Glisse?= <jglisse@redhat.com>,
 David Rientjes <rientjes@google.com>, Daniel Vetter <daniel.vetter@intel.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

V2UgbmVlZCB0byBtYWtlIHN1cmUgaW1wbGVtZW50YXRpb25zIGRvbid0IGNoZWF0IGFuZCBkb24n
dCBoYXZlIGEKcG9zc2libGUgc2NoZWR1bGUvYmxvY2tpbmcgcG9pbnQgZGVlcGx5IGJ1cnJpZWQg
d2hlcmUgcmV2aWV3IGNhbid0CmNhdGNoIGl0LgoKSSdtIG5vdCBzdXJlIHdoZXRoZXIgdGhpcyBp
cyB0aGUgYmVzdCB3YXkgdG8gbWFrZSBzdXJlIGFsbCB0aGUKbWlnaHRfc2xlZXAoKSBjYWxsc2l0
ZXMgdHJpZ2dlciwgYW5kIGl0J3MgYSBiaXQgdWdseSBpbiB0aGUgY29kZSBmbG93LgpCdXQgaXQg
Z2V0cyB0aGUgam9iIGRvbmUuCgpJbnNwaXJlZCBieSBhbiBpOTE1IHBhdGNoIHNlcmllcyB3aGlj
aCBkaWQgZXhhY3RseSB0aGF0LCBiZWNhdXNlIHRoZQpydWxlcyBoYXZlbid0IGJlZW4gZW50aXJl
bHkgY2xlYXIgdG8gdXMuCgp2MjogVXNlIHRoZSBzaGlueSBuZXcgbm9uX2Jsb2NrX3N0YXJ0L2Vu
ZCBhbm5vdGF0aW9ucyBpbnN0ZWFkIG9mCmFidXNpbmcgcHJlZW1wdF9kaXNhYmxlL2VuYWJsZS4K
CnYzOiBSZWJhc2Ugb24gdG9wIG9mIEdsaXNzZSdzIGFyZyByZXdvcmsuCgp2NDogUmViYXNlIG9u
IHRvcCBvZiBtb3JlIEdsaXNzZSByZXdvcmsuCgpDYzogSmFzb24gR3VudGhvcnBlIDxqZ2dAemll
cGUuY2E+CkNjOiBBbmRyZXcgTW9ydG9uIDxha3BtQGxpbnV4LWZvdW5kYXRpb24ub3JnPgpDYzog
TWljaGFsIEhvY2tvIDxtaG9ja29Ac3VzZS5jb20+CkNjOiBEYXZpZCBSaWVudGplcyA8cmllbnRq
ZXNAZ29vZ2xlLmNvbT4KQ2M6ICJDaHJpc3RpYW4gS8O2bmlnIiA8Y2hyaXN0aWFuLmtvZW5pZ0Bh
bWQuY29tPgpDYzogRGFuaWVsIFZldHRlciA8ZGFuaWVsLnZldHRlckBmZndsbC5jaD4KQ2M6ICJK
w6lyw7RtZSBHbGlzc2UiIDxqZ2xpc3NlQHJlZGhhdC5jb20+CkNjOiBsaW51eC1tbUBrdmFjay5v
cmcKUmV2aWV3ZWQtYnk6IENocmlzdGlhbiBLw7ZuaWcgPGNocmlzdGlhbi5rb2VuaWdAYW1kLmNv
bT4KUmV2aWV3ZWQtYnk6IErDqXLDtG1lIEdsaXNzZSA8amdsaXNzZUByZWRoYXQuY29tPgpTaWdu
ZWQtb2ZmLWJ5OiBEYW5pZWwgVmV0dGVyIDxkYW5pZWwudmV0dGVyQGludGVsLmNvbT4KLS0tCiBt
bS9tbXVfbm90aWZpZXIuYyB8IDggKysrKysrKy0KIDEgZmlsZSBjaGFuZ2VkLCA3IGluc2VydGlv
bnMoKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9tbS9tbXVfbm90aWZpZXIuYyBiL21t
L21tdV9ub3RpZmllci5jCmluZGV4IDUzOGQzYmI4N2Y5Yi4uODU2NjM2ZDA2ZWUwIDEwMDY0NAot
LS0gYS9tbS9tbXVfbm90aWZpZXIuYworKysgYi9tbS9tbXVfbm90aWZpZXIuYwpAQCAtMTgxLDcg
KzE4MSwxMyBAQCBpbnQgX19tbXVfbm90aWZpZXJfaW52YWxpZGF0ZV9yYW5nZV9zdGFydChzdHJ1
Y3QgbW11X25vdGlmaWVyX3JhbmdlICpyYW5nZSkKIAlpZCA9IHNyY3VfcmVhZF9sb2NrKCZzcmN1
KTsKIAlobGlzdF9mb3JfZWFjaF9lbnRyeV9yY3UobW4sICZyYW5nZS0+bW0tPm1tdV9ub3RpZmll
cl9tbS0+bGlzdCwgaGxpc3QpIHsKIAkJaWYgKG1uLT5vcHMtPmludmFsaWRhdGVfcmFuZ2Vfc3Rh
cnQpIHsKLQkJCWludCBfcmV0ID0gbW4tPm9wcy0+aW52YWxpZGF0ZV9yYW5nZV9zdGFydChtbiwg
cmFuZ2UpOworCQkJaW50IF9yZXQ7CisKKwkJCWlmICghbW11X25vdGlmaWVyX3JhbmdlX2Jsb2Nr
YWJsZShyYW5nZSkpCisJCQkJbm9uX2Jsb2NrX3N0YXJ0KCk7CisJCQlfcmV0ID0gbW4tPm9wcy0+
aW52YWxpZGF0ZV9yYW5nZV9zdGFydChtbiwgcmFuZ2UpOworCQkJaWYgKCFtbXVfbm90aWZpZXJf
cmFuZ2VfYmxvY2thYmxlKHJhbmdlKSkKKwkJCQlub25fYmxvY2tfZW5kKCk7CiAJCQlpZiAoX3Jl
dCkgewogCQkJCXByX2luZm8oIiVwUyBjYWxsYmFjayBmYWlsZWQgd2l0aCAlZCBpbiAlc2Jsb2Nr
YWJsZSBjb250ZXh0LlxuIiwKIAkJCQkJbW4tPm9wcy0+aW52YWxpZGF0ZV9yYW5nZV9zdGFydCwg
X3JldCwKLS0gCjIuMjMuMC5yYzEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2RyaS1kZXZlbA==
