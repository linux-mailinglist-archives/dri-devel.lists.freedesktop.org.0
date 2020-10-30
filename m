Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DDB12A0231
	for <lists+dri-devel@lfdr.de>; Fri, 30 Oct 2020 11:09:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 475AC6ED8F;
	Fri, 30 Oct 2020 10:08:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF3B06ED88
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Oct 2020 10:08:53 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id w23so2302404wmi.4
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Oct 2020 03:08:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=oGBzVmmcnUwoCpcjwMRu//j69ndtXtCP0NS2ElhXzwU=;
 b=ddb3ur1/6UNkfQr4L91EGkmgAJ2WFlh64b3krQrxHdXICPqGD1U7KSjV8mliOcYT2T
 IQK1rF0Fay6IRnqi6Z1rjQW4mkT8UrxQsAja5X4I4Zb0BD7E8rZgI9L3j1sWoJXQiFP2
 XQzGN/xa46QCrVP1PNnx5Jw7AGsn+9JT27UuU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=oGBzVmmcnUwoCpcjwMRu//j69ndtXtCP0NS2ElhXzwU=;
 b=p2v3vK8wGEulBxQB0xNQPx4IZE2rh0mV+k0BPXTIVeKMhos+H/9EriJhjWFCD0OH9k
 f+WLetacp0KHa4cE2DrSbDxuFzxUtITCGQPsIYbPc2LKFczOsT2TeWxiGriem+60FEyY
 IGAR2uTM6QahEN+SJuBpB9wHnTgI0zPMW0trR+eTDtlVgXeCuyMiYzvj4bPUUdQw/Y27
 L+AxZyZZkWxubZafiJVfC4hLy8I1+f3QjSFJrj/6oKP/JHxhJMwKOL1wNCV5EuFEQYeA
 ZQoGWJ2oUlCBjNY82Ji10loiSXbTXOSnpOAh11QDY9IjoIYgviT5DL9ntF9H04IS5l6I
 y67A==
X-Gm-Message-State: AOAM530cjROLfG3aPU8UIuv33mcITIzsPZdzNv75/5IMjD4oSUjnSPfG
 nMLCbfVCwtAFUdscvXdbfMpwK8bgitrkrL70
X-Google-Smtp-Source: ABdhPJwf6UH/CcQRHOKUtt59ycYpiu3snU7M2hjeYaaPa8vODJopyC6lafOLMLKP7+MR3NDzcDgM5Q==
X-Received: by 2002:a7b:c309:: with SMTP id k9mr1632728wmj.125.1604052532224; 
 Fri, 30 Oct 2020 03:08:52 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id v189sm4430947wmg.14.2020.10.30.03.08.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Oct 2020 03:08:51 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>
Subject: [PATCH v5 10/15] vfio/type1: Mark follow_pfn as unsafe
Date: Fri, 30 Oct 2020 11:08:10 +0100
Message-Id: <20201030100815.2269-11-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201030100815.2269-1-daniel.vetter@ffwll.ch>
References: <20201030100815.2269-1-daniel.vetter@ffwll.ch>
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
 Kees Cook <keescook@chromium.org>, kvm@vger.kernel.org,
 Jason Gunthorpe <jgg@ziepe.ca>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Cornelia Huck <cohuck@redhat.com>,
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
ZXggYmIyNjg0Y2MyNDVlLi5lY2NmZWU5MDAwMzMgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvdmZpby92
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
