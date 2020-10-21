Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 15F1B2949AF
	for <lists+dri-devel@lfdr.de>; Wed, 21 Oct 2020 10:57:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BBDA36F47A;
	Wed, 21 Oct 2020 08:57:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A2F76F474
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Oct 2020 08:57:20 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id d3so898854wma.4
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Oct 2020 01:57:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=8pur25W5Shkh1hHfFCpksS7ceNn2PKF9z82vTsiLN4c=;
 b=Ijq3ip5+wV7cd7njUb6RsVnXV8g8Owp5iMrdu9TyvAk5qDDhPeT5XCXN2ALGJhsrbp
 P5zOBKKXwRlNfH4L8OnR7mPoL971Mg4a7xN8q3N/PXmFtuMp/lDcW0snMDX7TnNSFxlk
 g5M5E6R5TEskXfmkH4sQcqsHcoV8Z7W9kahWs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=8pur25W5Shkh1hHfFCpksS7ceNn2PKF9z82vTsiLN4c=;
 b=tkFEr1AV3oAelL8+81xuQogH5m3l6RVsBAhclwAq+S0u0QxLi3aNbptF2u5gckByit
 pPoMSlcYXXWJIB6QnXDQ+mRlVTdjhAyQaPaXoCfWrG/+69ezp3DRt0HjvvbZXWJ4Y2mr
 MTOfEouZDdusTYZnRb4gpwHhCO+rzqqPKl3TwOxVIWoQy1z1V3/P3YW44VWVwo692wmL
 ID9eD5FNHWAVXM0nTYffkkBAOrOtAond4T144g5AaTUkuFXHnk7YNARARS4DZDAAOZjx
 eJvx0qycmyk6gXYbSFe1y1ZmJxT02a8+ZyFAVab6aTkjwuuzpVYkvykMMazqZMhjFLdV
 XgLg==
X-Gm-Message-State: AOAM5337RaHGSLtTMVhRv48AJd3IhN39OJqc42PFez+tFFoDDYFxa7Gs
 vT/XTNa18XpfPaINMyVE0ZD5X1O58BZHwdv9
X-Google-Smtp-Source: ABdhPJzNaFnr3EWeDP7k0cF2AHbtycSZcq0l7yhT5Nq82x3yeqTKgKPKUR9qmyptj9g+y8CFHwWMGg==
X-Received: by 2002:a1c:2c02:: with SMTP id s2mr2512532wms.66.1603270638556;
 Wed, 21 Oct 2020 01:57:18 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id q8sm2675939wro.32.2020.10.21.01.57.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Oct 2020 01:57:17 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>
Subject: [PATCH v3 11/16] vfio/type1: Mark follow_pfn as unsafe
Date: Wed, 21 Oct 2020 10:56:50 +0200
Message-Id: <20201021085655.1192025-12-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201021085655.1192025-1-daniel.vetter@ffwll.ch>
References: <20201021085655.1192025-1-daniel.vetter@ffwll.ch>
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
 Daniel Vetter <daniel.vetter@ffwll.com>,
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
ZWQtb2ZmLWJ5OiBEYW5pZWwgVmV0dGVyIDxkYW5pZWwudmV0dGVyQGZmd2xsLmNvbT4KLS0tCiBk
cml2ZXJzL3ZmaW8vdmZpb19pb21tdV90eXBlMS5jIHwgNCArKy0tCiAxIGZpbGUgY2hhbmdlZCwg
MiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvdmZp
by92ZmlvX2lvbW11X3R5cGUxLmMgYi9kcml2ZXJzL3ZmaW8vdmZpb19pb21tdV90eXBlMS5jCmlu
ZGV4IDVmYmYwYzFmNzQzMy4uYTRkNTNmM2QwYTM1IDEwMDY0NAotLS0gYS9kcml2ZXJzL3ZmaW8v
dmZpb19pb21tdV90eXBlMS5jCisrKyBiL2RyaXZlcnMvdmZpby92ZmlvX2lvbW11X3R5cGUxLmMK
QEAgLTQyMSw3ICs0MjEsNyBAQCBzdGF0aWMgaW50IGZvbGxvd19mYXVsdF9wZm4oc3RydWN0IHZt
X2FyZWFfc3RydWN0ICp2bWEsIHN0cnVjdCBtbV9zdHJ1Y3QgKm1tLAogewogCWludCByZXQ7CiAK
LQlyZXQgPSBmb2xsb3dfcGZuKHZtYSwgdmFkZHIsIHBmbik7CisJcmV0ID0gdW5zYWZlX2ZvbGxv
d19wZm4odm1hLCB2YWRkciwgcGZuKTsKIAlpZiAocmV0KSB7CiAJCWJvb2wgdW5sb2NrZWQgPSBm
YWxzZTsKIApAQCAtNDM1LDcgKzQzNSw3IEBAIHN0YXRpYyBpbnQgZm9sbG93X2ZhdWx0X3Bmbihz
dHJ1Y3Qgdm1fYXJlYV9zdHJ1Y3QgKnZtYSwgc3RydWN0IG1tX3N0cnVjdCAqbW0sCiAJCWlmIChy
ZXQpCiAJCQlyZXR1cm4gcmV0OwogCi0JCXJldCA9IGZvbGxvd19wZm4odm1hLCB2YWRkciwgcGZu
KTsKKwkJcmV0ID0gdW5zYWZlX2ZvbGxvd19wZm4odm1hLCB2YWRkciwgcGZuKTsKIAl9CiAKIAly
ZXR1cm4gcmV0OwotLSAKMi4yOC4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5m
by9kcmktZGV2ZWwK
