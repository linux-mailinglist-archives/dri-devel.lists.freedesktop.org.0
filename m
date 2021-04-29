Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A101A36E599
	for <lists+dri-devel@lfdr.de>; Thu, 29 Apr 2021 09:09:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3150E6ED18;
	Thu, 29 Apr 2021 07:09:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [IPv6:2a00:1450:4864:20::62f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 59D456ECAD;
 Thu, 29 Apr 2021 07:09:16 +0000 (UTC)
Received: by mail-ej1-x62f.google.com with SMTP id u21so98335132ejo.13;
 Thu, 29 Apr 2021 00:09:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=fJ60lp/Vnw50Vur34GigsubluFywhAviHZLw7QnlBAQ=;
 b=ibVWxEmnYr7rMn6hIfTI5JAdGHeU0XHA0uuhd7n3YVRg1o7pDSavYAfwpKIKDmErSW
 eJGo/8jc9noRAOXU46xY5/W4VHngg14ErHAA6xu+D167XIjtNaxr81Y3XIf8SwDHhbcI
 YOyYMb9NX9FpjKo4zCj1VHa0kC5X4XiwyXeQkLak9GlHNlFkxcVpRi4UeIDmiX6p23SA
 nYJXMC+bN3ysSAkxOYXURPghdUitD1DlitGJT0mlLvDsFCHQ70H1prp6XVKnaBS/OvxK
 ooxfGZezddjOfRc0RS/iEpUZYm1i707S2D2J6l5W19FTMnQiQqftH8uJ93gAK42/Qqwc
 eCHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=fJ60lp/Vnw50Vur34GigsubluFywhAviHZLw7QnlBAQ=;
 b=n4bLTCFFtN/zw/BrsdL2G1XLgqY9IGXg1DiJ6rMsojAwVYyMyZ1nhhcXHsahO79W6G
 am415WPQqunlG9vKlSEewxqmy5Xb+tpAVBWPXJ41jVoEQrHnwDrEgcxhzYxgoypu//3h
 fPRLcpfWWAGwYzXrKGD+Svge+s7apRK5WH1hiXvbptCDveBOm9gJiJijhGRko9y9fWzL
 9VrHHgCg0i6v9bwl7x3YcS76Kn+vSdbue+ykoifFMuDlA9SVlsRDLZrGL9adk+JuxGcc
 fVatvWJIq0S9k8Y6Xa3tkgo0M96a5L2NIF6pTpn0fOYwJyd8jdqK/Lpmk4HzHzShIRWF
 MNvg==
X-Gm-Message-State: AOAM531bDuNQL6mImFfHme4PJX2zsyq04X6+BNeIhJRaLfDb7MTC/2qY
 iGJAj/7tk8aC+Jz9ju7KVwA=
X-Google-Smtp-Source: ABdhPJwP1LEe9bSRkNBoejBAGjjh+TiSX9ZWrbX9LSdYQZ42acp8oPY1wAG4xCk2H1bosXkKnduy3g==
X-Received: by 2002:a17:906:6544:: with SMTP id
 u4mr33130515ejn.455.1619680155095; 
 Thu, 29 Apr 2021 00:09:15 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:49f7:8b5a:d7ab:5e3e?
 ([2a02:908:1252:fb60:49f7:8b5a:d7ab:5e3e])
 by smtp.gmail.com with ESMTPSA id w13sm1627636edx.80.2021.04.29.00.09.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 29 Apr 2021 00:09:14 -0700 (PDT)
Subject: Re: [PATCH v5 07/27] drm/amdgpu: Remap all page faults to per process
 dummy page.
To: Andrey Grodzovsky <andrey.grodzovsky@amd.com>,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-pci@vger.kernel.org, daniel.vetter@ffwll.ch, Harry.Wentland@amd.com
References: <20210428151207.1212258-1-andrey.grodzovsky@amd.com>
 <20210428151207.1212258-8-andrey.grodzovsky@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <abeb278f-64a1-fa14-c0ed-3d8bf9681518@gmail.com>
Date: Thu, 29 Apr 2021 09:09:13 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210428151207.1212258-8-andrey.grodzovsky@amd.com>
Content-Language: en-US
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
Cc: Alexander.Deucher@amd.com, gregkh@linuxfoundation.org, helgaas@kernel.org,
 Felix.Kuehling@amd.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMjguMDQuMjEgdW0gMTc6MTEgc2NocmllYiBBbmRyZXkgR3JvZHpvdnNreToKPiBPbiBkZXZp
Y2UgcmVtb3ZhbCByZXJvdXRlIGFsbCBDUFUgbWFwcGluZ3MgdG8gZHVtbXkgcGFnZQo+IHBlciBk
cm1fZmlsZSBpbnN0YW5jZSBvciBpbXBvcnRlZCBHRU0gb2JqZWN0Lgo+Cj4gdjQ6Cj4gVXBkYXRl
IGZvciBtb2RpZmllZCB0dG1fYm9fdm1fZHVtbXlfcGFnZQo+Cj4gU2lnbmVkLW9mZi1ieTogQW5k
cmV5IEdyb2R6b3Zza3kgPGFuZHJleS5ncm9kem92c2t5QGFtZC5jb20+CgpSZXZpZXdlZC1ieTog
Q2hyaXN0aWFuIEvDtm5pZyA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPgoKPiAtLS0KPiAgIGRy
aXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV90dG0uYyB8IDIxICsrKysrKysrKysrKysr
KystLS0tLQo+ICAgMSBmaWxlIGNoYW5nZWQsIDE2IGluc2VydGlvbnMoKyksIDUgZGVsZXRpb25z
KC0pCj4KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3R0
bS5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3R0bS5jCj4gaW5kZXggYTc4
NWFjYzA5ZjIwLi45MzE2M2IyMjBlNDYgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2Ft
ZC9hbWRncHUvYW1kZ3B1X3R0bS5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUv
YW1kZ3B1X3R0bS5jCj4gQEAgLTQ5LDYgKzQ5LDcgQEAKPiAgIAo+ICAgI2luY2x1ZGUgPGRybS9k
cm1fZGVidWdmcy5oPgo+ICAgI2luY2x1ZGUgPGRybS9hbWRncHVfZHJtLmg+Cj4gKyNpbmNsdWRl
IDxkcm0vZHJtX2Rydi5oPgo+ICAgCj4gICAjaW5jbHVkZSAiYW1kZ3B1LmgiCj4gICAjaW5jbHVk
ZSAiYW1kZ3B1X29iamVjdC5oIgo+IEBAIC0xOTgyLDE4ICsxOTgzLDI4IEBAIHZvaWQgYW1kZ3B1
X3R0bV9zZXRfYnVmZmVyX2Z1bmNzX3N0YXR1cyhzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldiwg
Ym9vbCBlbmFibGUpCj4gICBzdGF0aWMgdm1fZmF1bHRfdCBhbWRncHVfdHRtX2ZhdWx0KHN0cnVj
dCB2bV9mYXVsdCAqdm1mKQo+ICAgewo+ICAgCXN0cnVjdCB0dG1fYnVmZmVyX29iamVjdCAqYm8g
PSB2bWYtPnZtYS0+dm1fcHJpdmF0ZV9kYXRhOwo+ICsJc3RydWN0IGRybV9kZXZpY2UgKmRkZXYg
PSBiby0+YmFzZS5kZXY7Cj4gICAJdm1fZmF1bHRfdCByZXQ7Cj4gKwlpbnQgaWR4Owo+ICAgCj4g
ICAJcmV0ID0gdHRtX2JvX3ZtX3Jlc2VydmUoYm8sIHZtZik7Cj4gICAJaWYgKHJldCkKPiAgIAkJ
cmV0dXJuIHJldDsKPiAgIAo+IC0JcmV0ID0gYW1kZ3B1X2JvX2ZhdWx0X3Jlc2VydmVfbm90aWZ5
KGJvKTsKPiAtCWlmIChyZXQpCj4gLQkJZ290byB1bmxvY2s7Cj4gKwlpZiAoZHJtX2Rldl9lbnRl
cihkZGV2LCAmaWR4KSkgewo+ICsJCXJldCA9IGFtZGdwdV9ib19mYXVsdF9yZXNlcnZlX25vdGlm
eShibyk7Cj4gKwkJaWYgKHJldCkgewo+ICsJCQlkcm1fZGV2X2V4aXQoaWR4KTsKPiArCQkJZ290
byB1bmxvY2s7Cj4gKwkJfQo+ICAgCj4gLQlyZXQgPSB0dG1fYm9fdm1fZmF1bHRfcmVzZXJ2ZWQo
dm1mLCB2bWYtPnZtYS0+dm1fcGFnZV9wcm90LAo+IC0JCQkJICAgICAgIFRUTV9CT19WTV9OVU1f
UFJFRkFVTFQsIDEpOwo+ICsJCSByZXQgPSB0dG1fYm9fdm1fZmF1bHRfcmVzZXJ2ZWQodm1mLCB2
bWYtPnZtYS0+dm1fcGFnZV9wcm90LAo+ICsJCQkJCQlUVE1fQk9fVk1fTlVNX1BSRUZBVUxULCAx
KTsKPiArCj4gKwkJIGRybV9kZXZfZXhpdChpZHgpOwo+ICsJfSBlbHNlIHsKPiArCQlyZXQgPSB0
dG1fYm9fdm1fZHVtbXlfcGFnZSh2bWYsIHZtZi0+dm1hLT52bV9wYWdlX3Byb3QpOwo+ICsJfQo+
ICAgCWlmIChyZXQgPT0gVk1fRkFVTFRfUkVUUlkgJiYgISh2bWYtPmZsYWdzICYgRkFVTFRfRkxB
R19SRVRSWV9OT1dBSVQpKQo+ICAgCQlyZXR1cm4gcmV0Owo+ICAgCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRy
aS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5v
cmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
