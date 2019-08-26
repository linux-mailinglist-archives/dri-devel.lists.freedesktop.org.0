Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 37DC99D752
	for <lists+dri-devel@lfdr.de>; Mon, 26 Aug 2019 22:14:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3803288F2D;
	Mon, 26 Aug 2019 20:14:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x543.google.com (mail-ed1-x543.google.com
 [IPv6:2a00:1450:4864:20::543])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8579288E53
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Aug 2019 20:14:38 +0000 (UTC)
Received: by mail-ed1-x543.google.com with SMTP id h13so28117570edq.10
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Aug 2019 13:14:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Bew81wZtU1Y0ks/RIjoWK2FqRSw2UObINLTLlREzuuI=;
 b=Ygy9KWvDg4ka3/hAXj76tmYzDwgzvmqABp5KaMHAra0em644bm4SMUjUuKrPi9TaLv
 J49b3xWz3bmL/XBlQSyI0smqbeqbnn/t/e8YIUZqMnDgz/BGXPHxfkC2yXkWMvyAmn1V
 qJPxsUFULEhRlyGAanOcYbRnOikX6zK+ASNqD+yAzNJBjqJzecN924vkABzIvmNkTqXv
 PC0x/QheZKrZc5QtSWG6w4y0JPe93PDFdj/EKsjawQ5zP/U1l0UQX8NdYLyVwTMhEm9Z
 /+qRFLZZ0xya+mm3L/cGz7H+r1x6df/sRnR5RBlDa+jVhhqH76auaWyUOcaL+FZmLYYa
 2oYw==
X-Gm-Message-State: APjAAAWzjQAMavVUcCWsmCqtqNc3TF8p0DhCJEVXZPF1J1oeA215ACxu
 e9zo21u4NXPuDBw+Pl/MvxiTfw==
X-Google-Smtp-Source: APXvYqw8z9afSvhgONVa7l2XkwoZjbx6t7Y2tVjSzj6EiE5l88NiQj8YRIrJNGWJ+8ua4BQqqD4zVA==
X-Received: by 2002:a17:907:207a:: with SMTP id
 qp26mr18160870ejb.12.1566850477119; 
 Mon, 26 Aug 2019 13:14:37 -0700 (PDT)
Received: from phenom.ffwll.local (212-51-149-96.fiber7.init7.net.
 [212.51.149.96])
 by smtp.gmail.com with ESMTPSA id j25sm3000780ejb.49.2019.08.26.13.14.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Aug 2019 13:14:36 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: LKML <linux-kernel@vger.kernel.org>
Subject: [PATCH 4/5] mm, notifier: Catch sleeping/blocking for !blockable
Date: Mon, 26 Aug 2019 22:14:24 +0200
Message-Id: <20190826201425.17547-5-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20190826201425.17547-1-daniel.vetter@ffwll.ch>
References: <20190826201425.17547-1-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Bew81wZtU1Y0ks/RIjoWK2FqRSw2UObINLTLlREzuuI=;
 b=eqf/zxHzmkxFzdusChJdtOxtD1T//2StyL+3IeJkwUOueNAgekF2+ClgnH/jmo0xK7
 qr4GW3Irit/IupsG1Na0ULH20pR7piGumm9IQOHaYtrHyUARGCU3fZukTvNoWL+1YqKl
 pT4WlAHyRMSIzeLbFjs0YtZDoFJZPwP/EgQ5o=
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
IHRvcCBvZiBtb3JlIEdsaXNzZSByZXdvcmsuCgp2NTogQWxzbyBhbm5vdGF0ZSBpbnZhbGlkYXRl
X3JhbmdlX2VuZCBpbiB0aGUgc2FtZSBzdHlsZS4gSSBob3BlIEkgZ290Ckphc29uJ3MgcmVxdWVz
dCBmb3IgdGhpcyByaWdodC4KCkNjOiBKYXNvbiBHdW50aG9ycGUgPGpnZ0B6aWVwZS5jYT4KQ2M6
IEFuZHJldyBNb3J0b24gPGFrcG1AbGludXgtZm91bmRhdGlvbi5vcmc+CkNjOiBNaWNoYWwgSG9j
a28gPG1ob2Nrb0BzdXNlLmNvbT4KQ2M6IERhdmlkIFJpZW50amVzIDxyaWVudGplc0Bnb29nbGUu
Y29tPgpDYzogIkNocmlzdGlhbiBLw7ZuaWciIDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+CkNj
OiBEYW5pZWwgVmV0dGVyIDxkYW5pZWwudmV0dGVyQGZmd2xsLmNoPgpDYzogIkrDqXLDtG1lIEds
aXNzZSIgPGpnbGlzc2VAcmVkaGF0LmNvbT4KQ2M6IGxpbnV4LW1tQGt2YWNrLm9yZwpSZXZpZXdl
ZC1ieTogQ2hyaXN0aWFuIEvDtm5pZyA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPiAodjEpClJl
dmlld2VkLWJ5OiBKw6lyw7RtZSBHbGlzc2UgPGpnbGlzc2VAcmVkaGF0LmNvbT4gKHY0KQpTaWdu
ZWQtb2ZmLWJ5OiBEYW5pZWwgVmV0dGVyIDxkYW5pZWwudmV0dGVyQGludGVsLmNvbT4KLS0tCiBt
bS9tbXVfbm90aWZpZXIuYyB8IDE1ICsrKysrKysrKysrKystLQogMSBmaWxlIGNoYW5nZWQsIDEz
IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvbW0vbW11X25vdGlm
aWVyLmMgYi9tbS9tbXVfbm90aWZpZXIuYwppbmRleCAwNTIzNTU1OTMzYzkuLmIxN2YzZmQzNzc5
YiAxMDA2NDQKLS0tIGEvbW0vbW11X25vdGlmaWVyLmMKKysrIGIvbW0vbW11X25vdGlmaWVyLmMK
QEAgLTE4MSw3ICsxODEsMTMgQEAgaW50IF9fbW11X25vdGlmaWVyX2ludmFsaWRhdGVfcmFuZ2Vf
c3RhcnQoc3RydWN0IG1tdV9ub3RpZmllcl9yYW5nZSAqcmFuZ2UpCiAJaWQgPSBzcmN1X3JlYWRf
bG9jaygmc3JjdSk7CiAJaGxpc3RfZm9yX2VhY2hfZW50cnlfcmN1KG1uLCAmcmFuZ2UtPm1tLT5t
bXVfbm90aWZpZXJfbW0tPmxpc3QsIGhsaXN0KSB7CiAJCWlmIChtbi0+b3BzLT5pbnZhbGlkYXRl
X3JhbmdlX3N0YXJ0KSB7Ci0JCQlpbnQgX3JldCA9IG1uLT5vcHMtPmludmFsaWRhdGVfcmFuZ2Vf
c3RhcnQobW4sIHJhbmdlKTsKKwkJCWludCBfcmV0OworCisJCQlpZiAoIW1tdV9ub3RpZmllcl9y
YW5nZV9ibG9ja2FibGUocmFuZ2UpKQorCQkJCW5vbl9ibG9ja19zdGFydCgpOworCQkJX3JldCA9
IG1uLT5vcHMtPmludmFsaWRhdGVfcmFuZ2Vfc3RhcnQobW4sIHJhbmdlKTsKKwkJCWlmICghbW11
X25vdGlmaWVyX3JhbmdlX2Jsb2NrYWJsZShyYW5nZSkpCisJCQkJbm9uX2Jsb2NrX2VuZCgpOwog
CQkJaWYgKF9yZXQpIHsKIAkJCQlwcl9pbmZvKCIlcFMgY2FsbGJhY2sgZmFpbGVkIHdpdGggJWQg
aW4gJXNibG9ja2FibGUgY29udGV4dC5cbiIsCiAJCQkJCW1uLT5vcHMtPmludmFsaWRhdGVfcmFu
Z2Vfc3RhcnQsIF9yZXQsCkBAIC0yMjQsOCArMjMwLDEzIEBAIHZvaWQgX19tbXVfbm90aWZpZXJf
aW52YWxpZGF0ZV9yYW5nZV9lbmQoc3RydWN0IG1tdV9ub3RpZmllcl9yYW5nZSAqcmFuZ2UsCiAJ
CQltbi0+b3BzLT5pbnZhbGlkYXRlX3JhbmdlKG1uLCByYW5nZS0+bW0sCiAJCQkJCQkgIHJhbmdl
LT5zdGFydCwKIAkJCQkJCSAgcmFuZ2UtPmVuZCk7Ci0JCWlmIChtbi0+b3BzLT5pbnZhbGlkYXRl
X3JhbmdlX2VuZCkKKwkJaWYgKG1uLT5vcHMtPmludmFsaWRhdGVfcmFuZ2VfZW5kKSB7CisJCQlp
ZiAoIW1tdV9ub3RpZmllcl9yYW5nZV9ibG9ja2FibGUocmFuZ2UpKQorCQkJCW5vbl9ibG9ja19z
dGFydCgpOwogCQkJbW4tPm9wcy0+aW52YWxpZGF0ZV9yYW5nZV9lbmQobW4sIHJhbmdlKTsKKwkJ
CWlmICghbW11X25vdGlmaWVyX3JhbmdlX2Jsb2NrYWJsZShyYW5nZSkpCisJCQkJbm9uX2Jsb2Nr
X2VuZCgpOworCQl9CiAJfQogCXNyY3VfcmVhZF91bmxvY2soJnNyY3UsIGlkKTsKIAlsb2NrX21h
cF9yZWxlYXNlKCZfX21tdV9ub3RpZmllcl9pbnZhbGlkYXRlX3JhbmdlX3N0YXJ0X21hcCk7Ci0t
IAoyLjIzLjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
