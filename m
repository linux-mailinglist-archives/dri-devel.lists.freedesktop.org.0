Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EB4E4296EF6
	for <lists+dri-devel@lfdr.de>; Fri, 23 Oct 2020 14:24:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6DAB06E5D1;
	Fri, 23 Oct 2020 12:23:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 23AD16F614
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Oct 2020 12:23:10 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id l15so1299048wmi.3
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Oct 2020 05:23:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=hp7lChw6Uow+58XPniSHemIeAoNErbB/sdK6im80Iug=;
 b=URbjYqZvij6vMp6zpIk/3WlniapSCelkh8qPhM9XSJmSi3JP0Pkq6JfYZq+gC0V2Ja
 Jq8vCQ4Ho/GAm6SQXrzJhiajzuA2XAwJXKB1Cll6tMyrVwJYz4NCmG2PdfE0KkUS7bh0
 l5/AnqPDLrJU4JyaIv3jCsFac60g5JtxDcFVQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=hp7lChw6Uow+58XPniSHemIeAoNErbB/sdK6im80Iug=;
 b=ptSDF6us8i4xU1aAOELfLnBZtL2D5MoOanAkSh52bCg0c8uVHvdEblXaCfjLP0EIJQ
 fUmXIKqtKPUWK11X12arg3WlkSVYwTmDpMixmd4XSgA1N9mHnr40jTvppwQicdlj2t95
 +ssPtiDglZvddScV+8v+t16AiPwMXQTARkqCN2LSkNlC4Fy3hHF0ZPxgFRp9sFihtLrs
 jsHwBvL+ycSKKYeXcnNQhU5QCB+gCGW5eB2j2N+npdSQs9Ez1ptzpFnW42MCw31+MaBn
 DIiyYt06gK1+VmOKB8aROOGQTVt2aVz4H6yuLKMN083kx1J5YJ17wyG2Gp4TdgDWTtCE
 u/Tg==
X-Gm-Message-State: AOAM530w+Ti+JicXRAYLzdE/Xl7hCXLKD+/QZEFAWdUk+GfrI5oHqaHz
 8DUCgXW+/AZVsbEZEwJUrMNDs68U/H9zjHtt
X-Google-Smtp-Source: ABdhPJwqZWBmXRQ8vY8ZKJrjdPXGP2WILf15a1TrVl8Pgis8iT7Odd2hX51Nk7fKP5ClvyukHiQ2vg==
X-Received: by 2002:a1c:4d05:: with SMTP id o5mr1994877wmh.94.1603455788583;
 Fri, 23 Oct 2020 05:23:08 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id y4sm3056484wrp.74.2020.10.23.05.23.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Oct 2020 05:23:08 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH 39/65] vfio/type1: Mark follow_pfn as unsafe
Date: Fri, 23 Oct 2020 14:21:50 +0200
Message-Id: <20201023122216.2373294-39-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201023122216.2373294-1-daniel.vetter@ffwll.ch>
References: <20201021163242.1458885-1-daniel.vetter@ffwll.ch>
 <20201023122216.2373294-1-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
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
Cc: linux-samsung-soc@vger.kernel.org, Jan Kara <jack@suse.cz>,
 Kees Cook <keescook@chromium.org>, kvm@vger.kernel.org, linux-mm@kvack.org,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Cornelia Huck <cohuck@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>, Jason Gunthorpe <jgg@ziepe.ca>,
 =?UTF-8?q?J=C3=A9r=C3=B4me=20Glisse?= <jglisse@redhat.com>,
 John Hubbard <jhubbard@nvidia.com>, Daniel Vetter <daniel.vetter@intel.com>,
 Dan Williams <dan.j.williams@intel.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhlIGNvZGUgc2VlbXMgdG8gc3R1ZmYgdGhlc2UgcGZucyBpbnRvIGlvbW11IHB0cyAob3Igc29t
ZXRoaW5nIGxpa2UKdGhhdCwgSSBkaWRuJ3QgZm9sbG93KSwgYnV0IHRoZXJlJ3Mgbm8gbW11X25v
dGlmaWVyIHRvIGVuc3VyZSB0aGF0CmFjY2VzcyBpcyBzeW5jaHJvbml6ZWQgd2l0aCBwdGUgdXBk
YXRlcy4KCkhlbmNlIG1hcmsgdGhlc2UgYXMgdW5zYWZlLiBUaGlzIG1lYW5zIHRoYXQgd2l0aApD
T05GSUdfU1RSSUNUX0ZPTExPV19QRk4sIHRoZXNlIHdpbGwgYmUgcmVqZWN0ZWQuCgpSZWFsIGZp
eCBpcyB0byB3aXJlIHVwIGFuIG1tdV9ub3RpZmllciAuLi4gc29tZWhvdy4gUHJvYmFibHkgbWVh
bnMgYW55CmludmFsaWRhdGUgaXMgYSBmYXRhbCBmYXVsdCBmb3IgdGhpcyB2ZmlvIGRldmljZSwg
YnV0IHRoZW4gdGhpcwpzaG91bGRuJ3QgZXZlciBoYXBwZW4gaWYgdXNlcnNwYWNlIGlzIHJlYXNv
bmFibGUuCgpTaWduZWQtb2ZmLWJ5OiBEYW5pZWwgVmV0dGVyIDxkYW5pZWwudmV0dGVyQGludGVs
LmNvbT4KQ2M6IEphc29uIEd1bnRob3JwZSA8amdnQHppZXBlLmNhPgpDYzogS2VlcyBDb29rIDxr
ZWVzY29va0BjaHJvbWl1bS5vcmc+CkNjOiBEYW4gV2lsbGlhbXMgPGRhbi5qLndpbGxpYW1zQGlu
dGVsLmNvbT4KQ2M6IEFuZHJldyBNb3J0b24gPGFrcG1AbGludXgtZm91bmRhdGlvbi5vcmc+CkNj
OiBKb2huIEh1YmJhcmQgPGpodWJiYXJkQG52aWRpYS5jb20+CkNjOiBKw6lyw7RtZSBHbGlzc2Ug
PGpnbGlzc2VAcmVkaGF0LmNvbT4KQ2M6IEphbiBLYXJhIDxqYWNrQHN1c2UuY3o+CkNjOiBEYW4g
V2lsbGlhbXMgPGRhbi5qLndpbGxpYW1zQGludGVsLmNvbT4KQ2M6IGxpbnV4LW1tQGt2YWNrLm9y
ZwpDYzogbGludXgtYXJtLWtlcm5lbEBsaXN0cy5pbmZyYWRlYWQub3JnCkNjOiBsaW51eC1zYW1z
dW5nLXNvY0B2Z2VyLmtlcm5lbC5vcmcKQ2M6IGxpbnV4LW1lZGlhQHZnZXIua2VybmVsLm9yZwpD
YzogQWxleCBXaWxsaWFtc29uIDxhbGV4LndpbGxpYW1zb25AcmVkaGF0LmNvbT4KQ2M6IENvcm5l
bGlhIEh1Y2sgPGNvaHVja0ByZWRoYXQuY29tPgpDYzoga3ZtQHZnZXIua2VybmVsLm9yZwpTaWdu
ZWQtb2ZmLWJ5OiBEYW5pZWwgVmV0dGVyIDxkYW5pZWwudmV0dGVyQGZmd2xsLmNoPgotLS0KIGRy
aXZlcnMvdmZpby92ZmlvX2lvbW11X3R5cGUxLmMgfCA0ICsrLS0KIDEgZmlsZSBjaGFuZ2VkLCAy
IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy92Zmlv
L3ZmaW9faW9tbXVfdHlwZTEuYyBiL2RyaXZlcnMvdmZpby92ZmlvX2lvbW11X3R5cGUxLmMKaW5k
ZXggNWZiZjBjMWY3NDMzLi5hNGQ1M2YzZDBhMzUgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvdmZpby92
ZmlvX2lvbW11X3R5cGUxLmMKKysrIGIvZHJpdmVycy92ZmlvL3ZmaW9faW9tbXVfdHlwZTEuYwpA
QCAtNDIxLDcgKzQyMSw3IEBAIHN0YXRpYyBpbnQgZm9sbG93X2ZhdWx0X3BmbihzdHJ1Y3Qgdm1f
YXJlYV9zdHJ1Y3QgKnZtYSwgc3RydWN0IG1tX3N0cnVjdCAqbW0sCiB7CiAJaW50IHJldDsKIAot
CXJldCA9IGZvbGxvd19wZm4odm1hLCB2YWRkciwgcGZuKTsKKwlyZXQgPSB1bnNhZmVfZm9sbG93
X3Bmbih2bWEsIHZhZGRyLCBwZm4pOwogCWlmIChyZXQpIHsKIAkJYm9vbCB1bmxvY2tlZCA9IGZh
bHNlOwogCkBAIC00MzUsNyArNDM1LDcgQEAgc3RhdGljIGludCBmb2xsb3dfZmF1bHRfcGZuKHN0
cnVjdCB2bV9hcmVhX3N0cnVjdCAqdm1hLCBzdHJ1Y3QgbW1fc3RydWN0ICptbSwKIAkJaWYgKHJl
dCkKIAkJCXJldHVybiByZXQ7CiAKLQkJcmV0ID0gZm9sbG93X3Bmbih2bWEsIHZhZGRyLCBwZm4p
OworCQlyZXQgPSB1bnNhZmVfZm9sbG93X3Bmbih2bWEsIHZhZGRyLCBwZm4pOwogCX0KIAogCXJl
dHVybiByZXQ7Ci0tIAoyLjI4LjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2RyaS1kZXZlbAo=
