Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 06938A5941
	for <lists+dri-devel@lfdr.de>; Mon,  2 Sep 2019 16:25:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C194E89BF0;
	Mon,  2 Sep 2019 14:25:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6812589BF3
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Sep 2019 14:25:45 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id g7so14263768wrx.2
 for <dri-devel@lists.freedesktop.org>; Mon, 02 Sep 2019 07:25:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=64RniZUBOHsmwSSgTA4fYAdA6NiXYyvWILrlKoCeDF0=;
 b=jy6ro35lPKSeqvYbjtT329z9ONyF76z74mKi4nPrpOFbGOGiMhssU1YRIlHMd82qFC
 A7TGx/OUcdV6o1ohjaMjRFmGWgzqxdXvq294UblIkqbp3gmywuwCNKupv5KjJUpp2dM2
 w2em5oQjkZLfv+BwrK4BCRZk/qsvqsD0x4L51E7B4OdM4N7qswBj6qppsl0v9tzZt87l
 x0/9iUXs44LCs5pwh3HQOAXbm4awolocrwHBbiZ5GXQ+Ph3EtVUQzTAMMi9gWfvrPEqa
 toVClNF4ArxLqyFvIUs3lhh2J1bgYhaNV4qQ744upYhSt2hOELTpwCX5yFyEMSd+xj/+
 Plmw==
X-Gm-Message-State: APjAAAXH8ZwjffIfSAITF5p93gHX5kCryUcaw/CbRLnz9Y3REXj/sbYn
 eavvem4DJoy9WqIFymzr6Nl8nA==
X-Google-Smtp-Source: APXvYqzYpcGtUVUKW7CZn7pKyAnsOlxrzf/t7Mhe+wvVK65FTIQL0LP6IDkEXYl8JKeqkLyyMGgnjA==
X-Received: by 2002:adf:ed42:: with SMTP id u2mr4594147wro.330.1567434344033; 
 Mon, 02 Sep 2019 07:25:44 -0700 (PDT)
Received: from HeinrichFink-DPT-IR1433.local ([213.86.25.14])
 by smtp.gmail.com with ESMTPSA id j1sm4509692wrg.24.2019.09.02.07.25.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Sep 2019 07:25:43 -0700 (PDT)
From: Heinrich Fink <heinrich.fink@daqri.com>
To: daniel.vetter@ffwll.ch
Subject: [PATCH v2] drm: Add high-precision time to vblank trace event
Date: Mon,  2 Sep 2019 16:24:12 +0200
Message-Id: <20190902142412.27846-2-heinrich.fink@daqri.com>
X-Mailer: git-send-email 2.23.0.rc1
In-Reply-To: <20190902142412.27846-1-heinrich.fink@daqri.com>
References: <20190814171518.GL7444@phenom.ffwll.local>
 <20190902142412.27846-1-heinrich.fink@daqri.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daqri.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=64RniZUBOHsmwSSgTA4fYAdA6NiXYyvWILrlKoCeDF0=;
 b=WComJ5M5BXGVvvB/T1enUMMt3ADqrqmJsudgE/GdiK0gAfGHSamE1f2JpD8k6mVkAi
 IkG/cqy1Fd5P2hF+vkQHY0QARa5t33ijHg/uDajn16vzgMc6WrnFuwLLZ1p6P6X7lOBC
 v08QBae2gAuuzpWEbs8mRqVkluTNiGDAVmCpg=
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
Cc: heinrich.fink@daqri.com, intel-gfx@lists.freedesktop.org, keithp@keithp.com,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

U3RvcmUgdGhlIHRpbWVzdGFtcCBvZiB0aGUgY3VycmVudCB2YmxhbmsgaW4gdGhlIG5ldyBmaWVs
ZCAndGltZScgb2YgdGhlCnZibGFuayB0cmFjZSBldmVudC4gSWYgdGhlIHRpbWVzdGFtcCBpcyBj
YWxjdWxhdGVkIGJ5IGEgZHJpdmVyIHRoYXQKc3VwcG9ydHMgaGlnaC1wcmVjaXNpb24gdmJsYW5r
IHRpbWluZywgc2V0IHRoZSBmaWVsZCAnaGlnaC1wcmVjJyB0bwondHJ1ZScuCgpVc2VyIHNwYWNl
IGNhbiBub3cgYWNjZXNzIGFjdHVhbCBoYXJkd2FyZSB2YmxhbmsgdGltZXMgdmlhIHRoZSB0cmFj
aW5nCmluZnJhc3RydWN0dXJlLiBUcmFjaW5nIGFwcGxpY2F0aW9ucyAoc3VjaCBhcyBHUFVWaXMs
IHNlZSBbMF0gZm9yCnJlbGF0ZWQgZGlzY3Vzc2lvbiksIGNhbiB1c2UgdGhlIG5ld2x5IGFkZGVk
IGluZm9ybWF0aW9uIHRvIGNvbmR1Y3QgYQptb3JlIGFjY3VyYXRlIGFuYWx5c2lzIG9mIGRpc3Bs
YXkgdGltaW5nLgoKdjIgRml4IGF1dGhvciBuYW1lIChtaXNzaW5nIGxhc3QgbmFtZSkKClswXSBo
dHRwczovL2dpdGh1Yi5jb20vbWlrZXNhcnQvZ3B1dmlzL2lzc3Vlcy8zMAoKUmV2aWV3ZWQtYnk6
IERhbmllbCBWZXR0ZXIgPGRhbmllbC52ZXR0ZXJAZmZ3bGwuY2g+ClNpZ25lZC1vZmYtYnk6IEhl
aW5yaWNoIEZpbmsgPGhlaW5yaWNoLmZpbmtAZGFxcmkuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2Ry
bS9kcm1fdHJhY2UuaCAgfCAxNCArKysrKysrKysrLS0tLQogZHJpdmVycy9ncHUvZHJtL2RybV92
YmxhbmsuYyB8ICAzICsrLQogMiBmaWxlcyBjaGFuZ2VkLCAxMiBpbnNlcnRpb25zKCspLCA1IGRl
bGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fdHJhY2UuaCBiL2Ry
aXZlcnMvZ3B1L2RybS9kcm1fdHJhY2UuaAppbmRleCA0NzFlYjkyNzQ3NGIuLjExYzZkZDU3N2U4
ZSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2RybV90cmFjZS5oCisrKyBiL2RyaXZlcnMv
Z3B1L2RybS9kcm1fdHJhY2UuaApAQCAtMTMsMTcgKzEzLDIzIEBAIHN0cnVjdCBkcm1fZmlsZTsK
ICNkZWZpbmUgVFJBQ0VfSU5DTFVERV9GSUxFIGRybV90cmFjZQogCiBUUkFDRV9FVkVOVChkcm1f
dmJsYW5rX2V2ZW50LAotCSAgICBUUF9QUk9UTyhpbnQgY3J0YywgdW5zaWduZWQgaW50IHNlcSks
Ci0JICAgIFRQX0FSR1MoY3J0Yywgc2VxKSwKKwkgICAgVFBfUFJPVE8oaW50IGNydGMsIHVuc2ln
bmVkIGludCBzZXEsIGt0aW1lX3QgdGltZSwgYm9vbCBoaWdoX3ByZWMpLAorCSAgICBUUF9BUkdT
KGNydGMsIHNlcSwgdGltZSwgaGlnaF9wcmVjKSwKIAkgICAgVFBfU1RSVUNUX19lbnRyeSgKIAkJ
ICAgIF9fZmllbGQoaW50LCBjcnRjKQogCQkgICAgX19maWVsZCh1bnNpZ25lZCBpbnQsIHNlcSkK
KwkJICAgIF9fZmllbGQoa3RpbWVfdCwgdGltZSkKKwkJICAgIF9fZmllbGQoYm9vbCwgaGlnaF9w
cmVjKQogCQkgICAgKSwKIAkgICAgVFBfZmFzdF9hc3NpZ24oCiAJCSAgICBfX2VudHJ5LT5jcnRj
ID0gY3J0YzsKIAkJICAgIF9fZW50cnktPnNlcSA9IHNlcTsKLQkJICAgICksCi0JICAgIFRQX3By
aW50aygiY3J0Yz0lZCwgc2VxPSV1IiwgX19lbnRyeS0+Y3J0YywgX19lbnRyeS0+c2VxKQorCQkg
ICAgX19lbnRyeS0+dGltZSA9IHRpbWU7CisJCSAgICBfX2VudHJ5LT5oaWdoX3ByZWMgPSBoaWdo
X3ByZWM7CisJCQkpLAorCSAgICBUUF9wcmludGsoImNydGM9JWQsIHNlcT0ldSwgdGltZT0lbGxk
LCBoaWdoLXByZWM9JXMiLAorCQkJX19lbnRyeS0+Y3J0YywgX19lbnRyeS0+c2VxLCBfX2VudHJ5
LT50aW1lLAorCQkJX19lbnRyeS0+aGlnaF9wcmVjID8gInRydWUiIDogImZhbHNlIikKICk7CiAK
IFRSQUNFX0VWRU5UKGRybV92YmxhbmtfZXZlbnRfcXVldWVkLApkaWZmIC0tZ2l0IGEvZHJpdmVy
cy9ncHUvZHJtL2RybV92YmxhbmsuYyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fdmJsYW5rLmMKaW5k
ZXggZmQxZmJjNzc4NzFmLi5jOTlmZWRhMjVkZWEgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2Ry
bS9kcm1fdmJsYW5rLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2RybV92YmxhbmsuYwpAQCAtMTcz
MSw3ICsxNzMxLDggQEAgc3RhdGljIHZvaWQgZHJtX2hhbmRsZV92YmxhbmtfZXZlbnRzKHN0cnVj
dCBkcm1fZGV2aWNlICpkZXYsIHVuc2lnbmVkIGludCBwaXBlKQogCQlzZW5kX3ZibGFua19ldmVu
dChkZXYsIGUsIHNlcSwgbm93KTsKIAl9CiAKLQl0cmFjZV9kcm1fdmJsYW5rX2V2ZW50KHBpcGUs
IHNlcSk7CisJdHJhY2VfZHJtX3ZibGFua19ldmVudChwaXBlLCBzZXEsIG5vdywKKwkJCWRldi0+
ZHJpdmVyLT5nZXRfdmJsYW5rX3RpbWVzdGFtcCAhPSBOVUxMKTsKIH0KIAogLyoqCi0tIAoyLjIz
LjAucmMxCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpk
cmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
