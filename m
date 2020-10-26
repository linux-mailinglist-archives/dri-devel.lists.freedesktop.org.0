Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 65766298AF0
	for <lists+dri-devel@lfdr.de>; Mon, 26 Oct 2020 11:58:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7772C6E9FD;
	Mon, 26 Oct 2020 10:58:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B2AE6E96E
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Oct 2020 10:58:41 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id h22so879394wmb.0
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Oct 2020 03:58:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=hp7lChw6Uow+58XPniSHemIeAoNErbB/sdK6im80Iug=;
 b=Cr+pmJXJLsWocfKRIRa/5RHLA7hSR2O/V8a+9H+OfOBLfntuyYXq0XvJAi9z0VTfHT
 o6muhLbGVgMDDFHz7pi7g0wbMI0xim0wkiLglb6gq1U7avKTlbLZaGt6brXdeBhZPYiG
 7tcXzotmBBEhyDhg4r894G/MEQ31CzKNdntL0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=hp7lChw6Uow+58XPniSHemIeAoNErbB/sdK6im80Iug=;
 b=HEKprQYftbgWrJKgynTZo9zceMvipeep641MkzfzBdWwU9NOkXKoyN/8xCCuJl5RBu
 ODQxUJDt/weuOhO7LzegPtfD16orXP0PVQqzsTjjS99mUEdY7I5FZblqB08Zy9ySF3gf
 u9WOiPijhzkKUGKs/fNgoyyfJD44ygXoVIt6ydfGvfarYYDey4G3jZUDVhKA2asY5i2N
 cgET4rSO6NW40cVrogTAHShlS1zr81Baxy+PhDTIv16tB+EjS1mB/JNaeUa1lYfU75UP
 vYUseExHiTvCDsGP2O5yqi+e7hTJLN+QuJHajOPn6N58RDhjGPCZ+i4gO/NkSbZtaxZK
 3CbA==
X-Gm-Message-State: AOAM533n8iKqf47jJdqcXQUV9r6I9d/6ZW3HPNG7yQ3v/zfsCfCsbltz
 maaQd029my+qcGYD7jgyz8eeqsXow2X1da6u
X-Google-Smtp-Source: ABdhPJyXE1xnVL9rMrbjHo2QW8UsY5WSv6Qb5ykdefmn1P9qttdIUjS9wMyJqMVtlrB26EUB1SiNdg==
X-Received: by 2002:a05:600c:25a:: with SMTP id
 26mr14957501wmj.39.1603709919599; 
 Mon, 26 Oct 2020 03:58:39 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id w83sm21165156wmg.48.2020.10.26.03.58.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Oct 2020 03:58:38 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>
Subject: [PATCH v4 10/15] vfio/type1: Mark follow_pfn as unsafe
Date: Mon, 26 Oct 2020 11:58:13 +0100
Message-Id: <20201026105818.2585306-11-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201026105818.2585306-1-daniel.vetter@ffwll.ch>
References: <20201026105818.2585306-1-daniel.vetter@ffwll.ch>
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
