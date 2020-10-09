Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F524288456
	for <lists+dri-devel@lfdr.de>; Fri,  9 Oct 2020 10:00:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 331966EC7E;
	Fri,  9 Oct 2020 08:00:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC9B06ECD2
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Oct 2020 08:00:09 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id n6so8948627wrm.13
 for <dri-devel@lists.freedesktop.org>; Fri, 09 Oct 2020 01:00:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=le1GUptU9JjBH114uU563JmUcYegKwYn9xh0zAQdRv8=;
 b=D1VJi6UDBiQk2hO8dFve4gh+DKwL/4hvYIL5H14t+/WkC6EkC0QuzB+xVNaIVhimgb
 u3J/6YYVnKsy9E3ATy/UWE+cLNXaPddTma9scUgc+w9imr71cIasK3qOPcYgE9YB/pK2
 huXf9HsnQzVH0icRGFbigbp5CUz+XW5pf1/tI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=le1GUptU9JjBH114uU563JmUcYegKwYn9xh0zAQdRv8=;
 b=GK3S/IG9ISYnm3WhOF0j8q7w539WLwY5Vg0Orruwz/119W/qdyfYATozvfdHAn3Y7u
 6MMcapOSH767P06TZYZKyFrZdzAsvL1+ICcGmtllI+dDNkgF29gAWA58zvQJYzVSV5rZ
 j5PzRgRe+fyOQUjixh0gci8y+RNAnnCmocjc0jDA7CTorawD/qtDFnO5rHibKiCNLTpp
 Oh1n1ZasiUS2kjEuUlqZkjsheG+V02NI4AIIhfr3iUJNTbo7V+OH1fghvWA/LQ9O/pxi
 0v5aJ1DKZks7DQIf4MWaNE4muqP+R9sFAvny28CxL3HnMSLLfq+bY2BDMbGHZDz5BlaL
 Vwlg==
X-Gm-Message-State: AOAM533PgKHviOjrniyp/Gm3Dg3W4TBwDoKwUSQ5zmaHoeB2k+x4xNmD
 KLNC+8KbEoSc/4AKsv/lxfWBmVo9VWTQLW5N
X-Google-Smtp-Source: ABdhPJz4MKP5KGohAdR58eqqZNbRUjATksd5quRpBzCsMu6hT8STZxdOkUvTUNe8EYXb+jIiohIVBA==
X-Received: by 2002:adf:bc14:: with SMTP id s20mr14299261wrg.220.1602230408064; 
 Fri, 09 Oct 2020 01:00:08 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id u17sm11634118wri.45.2020.10.09.01.00.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 Oct 2020 01:00:07 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>
Subject: [PATCH v2 11/17] vfio/type1: Mark follow_pfn as unsafe
Date: Fri,  9 Oct 2020 09:59:28 +0200
Message-Id: <20201009075934.3509076-12-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201009075934.3509076-1-daniel.vetter@ffwll.ch>
References: <20201009075934.3509076-1-daniel.vetter@ffwll.ch>
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
Cc: linux-s390@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 Jan Kara <jack@suse.cz>, Kees Cook <keescook@chromium.org>,
 kvm@vger.kernel.org, Jason Gunthorpe <jgg@ziepe.ca>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, Cornelia Huck <cohuck@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>, linux-mm@kvack.org,
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
bGlhIEh1Y2sgPGNvaHVja0ByZWRoYXQuY29tPgpDYzoga3ZtQHZnZXIua2VybmVsLm9yZwotLS0K
IGRyaXZlcnMvdmZpby92ZmlvX2lvbW11X3R5cGUxLmMgfCA0ICsrLS0KIDEgZmlsZSBjaGFuZ2Vk
LCAyIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy92
ZmlvL3ZmaW9faW9tbXVfdHlwZTEuYyBiL2RyaXZlcnMvdmZpby92ZmlvX2lvbW11X3R5cGUxLmMK
aW5kZXggNWZiZjBjMWY3NDMzLi5hNGQ1M2YzZDBhMzUgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvdmZp
by92ZmlvX2lvbW11X3R5cGUxLmMKKysrIGIvZHJpdmVycy92ZmlvL3ZmaW9faW9tbXVfdHlwZTEu
YwpAQCAtNDIxLDcgKzQyMSw3IEBAIHN0YXRpYyBpbnQgZm9sbG93X2ZhdWx0X3BmbihzdHJ1Y3Qg
dm1fYXJlYV9zdHJ1Y3QgKnZtYSwgc3RydWN0IG1tX3N0cnVjdCAqbW0sCiB7CiAJaW50IHJldDsK
IAotCXJldCA9IGZvbGxvd19wZm4odm1hLCB2YWRkciwgcGZuKTsKKwlyZXQgPSB1bnNhZmVfZm9s
bG93X3Bmbih2bWEsIHZhZGRyLCBwZm4pOwogCWlmIChyZXQpIHsKIAkJYm9vbCB1bmxvY2tlZCA9
IGZhbHNlOwogCkBAIC00MzUsNyArNDM1LDcgQEAgc3RhdGljIGludCBmb2xsb3dfZmF1bHRfcGZu
KHN0cnVjdCB2bV9hcmVhX3N0cnVjdCAqdm1hLCBzdHJ1Y3QgbW1fc3RydWN0ICptbSwKIAkJaWYg
KHJldCkKIAkJCXJldHVybiByZXQ7CiAKLQkJcmV0ID0gZm9sbG93X3Bmbih2bWEsIHZhZGRyLCBw
Zm4pOworCQlyZXQgPSB1bnNhZmVfZm9sbG93X3Bmbih2bWEsIHZhZGRyLCBwZm4pOwogCX0KIAog
CXJldHVybiByZXQ7Ci0tIAoyLjI4LjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2RyaS1kZXZlbAo=
