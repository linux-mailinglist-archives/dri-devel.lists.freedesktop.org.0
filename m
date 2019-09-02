Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E36F6A54EC
	for <lists+dri-devel@lfdr.de>; Mon,  2 Sep 2019 13:31:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C16AF89C1C;
	Mon,  2 Sep 2019 11:31:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ABA9789C18
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Sep 2019 11:31:54 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id o184so14223092wme.3
 for <dri-devel@lists.freedesktop.org>; Mon, 02 Sep 2019 04:31:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=gPcDkSG7gGNdAp3jF4yBee9f6RzA+evCrH2htnpmEAI=;
 b=kIQ4g6JYb/jtUex34f+S0a6SzUhvQhPjL9ek6XNbpmQw53GOF5cBkvqlFQ2ZdO0ug/
 nMD4k64L27Ya91ucjLlZ7npm/QHawETV4ruFFJLq9gJRjRSJYqxLJhSyDnuDtoHpRsNs
 lWTfWFjACJG+u86vaiw8qb0irkRlpJNQbvPaQ5pIhrmpgnSky8nUUOir7ZXw1tn2DdDd
 /eVfh1cPhJiIrbdFBplp618h9gT5piFGtHRIQu8XwriNl4oIjKc9k6XSlZzj+i/4a+s0
 g+20nzxpAZG02AHJ3Qh33zYeZeAW9K49xHgRm0Ex4i31nqqjfpzIjgUHQNuL1s7SiFv+
 ebxg==
X-Gm-Message-State: APjAAAUIWOG4WCgnvemlHszo845+hz34fzGUO1DSAkwxZta+WIMjBxip
 +/8CQ0IVRH38NG/wWcE9IE+9v+Q6
X-Google-Smtp-Source: APXvYqxOREgolMdzNUytaoZjrD7kMzyGHI21uXVQD2wJ0yDQ4lKo4GZpkkVY+CWNKRxa1kQOg9qgfQ==
X-Received: by 2002:a7b:cf37:: with SMTP id m23mr7988392wmg.53.1567423912812; 
 Mon, 02 Sep 2019 04:31:52 -0700 (PDT)
Received: from localhost (pD9E51890.dip0.t-ipconnect.de. [217.229.24.144])
 by smtp.gmail.com with ESMTPSA id d9sm1189091wrc.39.2019.09.02.04.31.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Sep 2019 04:31:51 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 14/21] drm/dp: Use drm_dp_aux_rd_interval()
Date: Mon,  2 Sep 2019 13:31:14 +0200
Message-Id: <20190902113121.31323-15-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190902113121.31323-1-thierry.reding@gmail.com>
References: <20190902113121.31323-1-thierry.reding@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=gPcDkSG7gGNdAp3jF4yBee9f6RzA+evCrH2htnpmEAI=;
 b=dHubGBMv74RuakGRYYWlVjNHgjyyuqS2zA0Uc4+AYhweoJ5fh2ihEdSGRhVFEO3ToU
 rcVepDTM26lfRoY9AT75RiX+4JgA3rfd3Mcw+NDUTM1nHZ2FxurVvyQZO+6rgam2PrkQ
 Sf8JPLUKYGJ9WBS4Ql5EuWk8j/JJ0CsHi8bBtqjAWVWozzzxqGEY8NSzCBl7UOuByt5l
 jAkoVaMVNUCNE04tY4862pZFL7lbQpadviaYpdU9k3CfMmSSDcLxp49Cy/l0puXn7npL
 84QIzc7D6DIhejF2PRgqMrQNFz8Cs7WGkN5bZ//TGhJs5AKXO+MOAGGm/dMKMivKirny
 0zSA==
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogVGhpZXJyeSBSZWRpbmcgPHRyZWRpbmdAbnZpZGlhLmNvbT4KCk1ha2UgdXNlIG9mIHRo
ZSBuZXdseSBhZGRlZCBkcm1fZHBfYXV4X3JkX2ludGVydmFsKCkgaGVscGVyIGluIGV4aXN0aW5n
CkRQIGxpbmsgdHJhaW5pbmcgaGVscGVycy4KCnYyOiBkcm9wIHN0YWxlIHNlbnRlbmNlIGZyb20g
Y29tbWl0IG1lc3NhZ2UgKFBoaWxpcHAgWmFiZWwpCgpTaWduZWQtb2ZmLWJ5OiBUaGllcnJ5IFJl
ZGluZyA8dHJlZGluZ0BudmlkaWEuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9kcm1fZHBfaGVs
cGVyLmMgfCAyNiArKystLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQogMSBmaWxlIGNoYW5nZWQsIDMg
aW5zZXJ0aW9ucygrKSwgMjMgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUv
ZHJtL2RybV9kcF9oZWxwZXIuYyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fZHBfaGVscGVyLmMKaW5k
ZXggNjgxZDI4OTg4Nzc2Li4xZmIzYzI3Y2QwMTIgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2Ry
bS9kcm1fZHBfaGVscGVyLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2RybV9kcF9oZWxwZXIuYwpA
QCAtMTIyLDE3ICsxMjIsNyBAQCBFWFBPUlRfU1lNQk9MKGRybV9kcF9nZXRfYWRqdXN0X3JlcXVl
c3RfcHJlX2VtcGhhc2lzKTsKIAogdm9pZCBkcm1fZHBfbGlua190cmFpbl9jbG9ja19yZWNvdmVy
eV9kZWxheShjb25zdCB1OCBkcGNkW0RQX1JFQ0VJVkVSX0NBUF9TSVpFXSkKIHsKLQl1bnNpZ25l
ZCBpbnQgcmRfaW50ZXJ2YWwgPSBkcGNkW0RQX1RSQUlOSU5HX0FVWF9SRF9JTlRFUlZBTF0gJgot
CQkJCQlEUF9UUkFJTklOR19BVVhfUkRfTUFTSzsKLQotCWlmIChyZF9pbnRlcnZhbCA+IDQpCi0J
CURSTV9ERUJVR19LTVMoIkFVWCBpbnRlcnZhbCAldSwgb3V0IG9mIHJhbmdlIChtYXggNClcbiIs
Ci0JCQkgICAgICByZF9pbnRlcnZhbCk7Ci0KLQlpZiAocmRfaW50ZXJ2YWwgPT0gMCB8fCBkcGNk
W0RQX0RQQ0RfUkVWXSA+PSBEUF9EUENEX1JFVl8xNCkKLQkJcmRfaW50ZXJ2YWwgPSAxMDA7Ci0J
ZWxzZQotCQlyZF9pbnRlcnZhbCAqPSA0ICogVVNFQ19QRVJfTVNFQzsKKwl1bnNpZ25lZCBpbnQg
cmRfaW50ZXJ2YWwgPSBkcm1fZHBfYXV4X3JkX2ludGVydmFsKGRwY2QpOwogCiAJdXNsZWVwX3Jh
bmdlKHJkX2ludGVydmFsLCByZF9pbnRlcnZhbCAqIDIpOwogfQpAQCAtMTQwLDE5ICsxMzAsOSBA
QCBFWFBPUlRfU1lNQk9MKGRybV9kcF9saW5rX3RyYWluX2Nsb2NrX3JlY292ZXJ5X2RlbGF5KTsK
IAogdm9pZCBkcm1fZHBfbGlua190cmFpbl9jaGFubmVsX2VxX2RlbGF5KGNvbnN0IHU4IGRwY2Rb
RFBfUkVDRUlWRVJfQ0FQX1NJWkVdKQogewotCXVuc2lnbmVkIGludCByZF9pbnRlcnZhbCA9IGRw
Y2RbRFBfVFJBSU5JTkdfQVVYX1JEX0lOVEVSVkFMXSAmCi0JCQkJCURQX1RSQUlOSU5HX0FVWF9S
RF9NQVNLOwotCi0JaWYgKHJkX2ludGVydmFsID4gNCkKLQkJRFJNX0RFQlVHX0tNUygiQVVYIGlu
dGVydmFsICV1LCBvdXQgb2YgcmFuZ2UgKG1heCA0KVxuIiwKLQkJCSAgICAgIHJkX2ludGVydmFs
KTsKKwl1bnNpZ25lZCBpbnQgbWluID0gZHJtX2RwX2F1eF9yZF9pbnRlcnZhbChkcGNkKTsKIAot
CWlmIChyZF9pbnRlcnZhbCA9PSAwKQotCQlyZF9pbnRlcnZhbCA9IDQwMDsKLQllbHNlCi0JCXJk
X2ludGVydmFsICo9IDQgKiBVU0VDX1BFUl9NU0VDOwotCi0JdXNsZWVwX3JhbmdlKHJkX2ludGVy
dmFsLCByZF9pbnRlcnZhbCAqIDIpOworCXVzbGVlcF9yYW5nZShtaW4sIG1pbiAqIDIpOwogfQog
RVhQT1JUX1NZTUJPTChkcm1fZHBfbGlua190cmFpbl9jaGFubmVsX2VxX2RlbGF5KTsKIAotLSAK
Mi4yMi4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpk
cmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
