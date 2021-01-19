Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 504D02FB492
	for <lists+dri-devel@lfdr.de>; Tue, 19 Jan 2021 09:52:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD2BF6E02A;
	Tue, 19 Jan 2021 08:52:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [IPv6:2a00:1450:4864:20::634])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F21EA6E02A;
 Tue, 19 Jan 2021 08:52:24 +0000 (UTC)
Received: by mail-ej1-x634.google.com with SMTP id rv9so8582710ejb.13;
 Tue, 19 Jan 2021 00:52:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=reply-to:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=4/oZNRe26+B/fg5KXSuP4+KipVl3+C1lcQHB6qew5D8=;
 b=mzBStPCk3D89ZE9nfB/Faymbzac2mwxZKY8nqWx7DLxAmpOjbMAmV0mnofPeeMf2ab
 SaMV5zBxKhf00UZT+15/s6m36A68AOSZ0/IiAAR63WifPP9U5PZCdduTaKJPk9Ieap1P
 4OEDkgZodIWsAB6b+YRMVj/XWVka86+Hw3r4ErdeF9n0v2pF1bgriMaU/h0v5rQB0DRV
 xMI7EBlXlRzBJivrQnE8ssIAEkIdFPWGi1B4pshuk5rcneNagi1VWdf1itVQ/sV2OzR9
 L95y7WZoIRE9L6HO+iL0lDpfTllmtmJw+kT6Ul43nJt6URd2aPIq8ng8UZ5hUEHkPkvL
 3Gaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:to:cc:references:from
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-transfer-encoding:content-language;
 bh=4/oZNRe26+B/fg5KXSuP4+KipVl3+C1lcQHB6qew5D8=;
 b=cZAwoBkBdeOcK2yG0D/GfTtDoiqI3sBur6zbJot5XWMwK43DzLg3jxovNTKvb460f6
 EplzUXy73w0yZ6wukDeC6o5zE+50pJPQSkIZ3VUvrH2GrXF1LBvnMupsZd2zjsnDrH5S
 PlcZXTP7fMNUeOMH+mgzfW9A1oIMlQil5XBiNSO54VW6Aa2iLwtiUbYVxwgGSRRZiMF2
 sn3isj4JHa+E9al0xAQ6CvgbRRDMwgmcFNbhrvC3eP//3+zTSQAecRBvWF0DnQjRqaLh
 zx8utoOU5Uphcjh03zdcIz77idWF84SfOGEazswmex8X67ZYqw1GX6ssxKQuAM3xFHQR
 iEBw==
X-Gm-Message-State: AOAM5332sJkuZftCDYEQVTnzv1XQCnv7TTfSNWS1cinkbInq6HSxfOw5
 1UqTug5xaVi0XlfUWW53plo=
X-Google-Smtp-Source: ABdhPJxGn9g3FeZanavjewouxWe3XaBUgsvPPbxFazkqPhVQnCC51QVDBxiApH085gHu8LMN4iltZw==
X-Received: by 2002:a17:906:2747:: with SMTP id
 a7mr2389202ejd.250.1611046343727; 
 Tue, 19 Jan 2021 00:52:23 -0800 (PST)
Received: from ?IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7?
 ([2a02:908:1252:fb60:be8a:bd56:1f94:86e7])
 by smtp.gmail.com with ESMTPSA id hs18sm10383875ejc.45.2021.01.19.00.52.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 19 Jan 2021 00:52:23 -0800 (PST)
Subject: Re: [PATCH v4 09/14] drm/amdgpu: Remap all page faults to per process
 dummy page.
To: Andrey Grodzovsky <andrey.grodzovsky@amd.com>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 daniel.vetter@ffwll.ch, robh@kernel.org, l.stach@pengutronix.de,
 yuq825@gmail.com, eric@anholt.net
References: <1611003683-3534-1-git-send-email-andrey.grodzovsky@amd.com>
 <1611003683-3534-10-git-send-email-andrey.grodzovsky@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <98fb005e-8300-a4ab-f224-2fb14b3cf9d6@gmail.com>
Date: Tue, 19 Jan 2021 09:52:20 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <1611003683-3534-10-git-send-email-andrey.grodzovsky@amd.com>
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
Reply-To: christian.koenig@amd.com
Cc: Alexander.Deucher@amd.com, gregkh@linuxfoundation.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMTguMDEuMjEgdW0gMjI6MDEgc2NocmllYiBBbmRyZXkgR3JvZHpvdnNreToKPiBPbiBkZXZp
Y2UgcmVtb3ZhbCByZXJvdXRlIGFsbCBDUFUgbWFwcGluZ3MgdG8gZHVtbXkgcGFnZQo+IHBlciBk
cm1fZmlsZSBpbnN0YW5jZSBvciBpbXBvcnRlZCBHRU0gb2JqZWN0Lgo+Cj4gdjQ6Cj4gVXBkYXRl
IGZvciBtb2RpZmllZCB0dG1fYm9fdm1fZHVtbXlfcGFnZQo+Cj4gU2lnbmVkLW9mZi1ieTogQW5k
cmV5IEdyb2R6b3Zza3kgPGFuZHJleS5ncm9kem92c2t5QGFtZC5jb20+CgpSZXZpZXdlZC1ieTog
Q2hyaXN0aWFuIEvDtm5pZyA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPgoKPiAtLS0KPiAgIGRy
aXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV90dG0uYyB8IDIxICsrKysrKysrKysrKysr
KystLS0tLQo+ICAgMSBmaWxlIGNoYW5nZWQsIDE2IGluc2VydGlvbnMoKyksIDUgZGVsZXRpb25z
KC0pCj4KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3R0
bS5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3R0bS5jCj4gaW5kZXggOWZk
MjE1Ny4uNTUwZGM1ZSAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9h
bWRncHVfdHRtLmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdHRt
LmMKPiBAQCAtNDksNiArNDksNyBAQAo+ICAgCj4gICAjaW5jbHVkZSA8ZHJtL2RybV9kZWJ1Z2Zz
Lmg+Cj4gICAjaW5jbHVkZSA8ZHJtL2FtZGdwdV9kcm0uaD4KPiArI2luY2x1ZGUgPGRybS9kcm1f
ZHJ2Lmg+Cj4gICAKPiAgICNpbmNsdWRlICJhbWRncHUuaCIKPiAgICNpbmNsdWRlICJhbWRncHVf
b2JqZWN0LmgiCj4gQEAgLTE5ODIsMTggKzE5ODMsMjggQEAgdm9pZCBhbWRncHVfdHRtX3NldF9i
dWZmZXJfZnVuY3Nfc3RhdHVzKHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2LCBib29sIGVuYWJs
ZSkKPiAgIHN0YXRpYyB2bV9mYXVsdF90IGFtZGdwdV90dG1fZmF1bHQoc3RydWN0IHZtX2ZhdWx0
ICp2bWYpCj4gICB7Cj4gICAJc3RydWN0IHR0bV9idWZmZXJfb2JqZWN0ICpibyA9IHZtZi0+dm1h
LT52bV9wcml2YXRlX2RhdGE7Cj4gKwlzdHJ1Y3QgZHJtX2RldmljZSAqZGRldiA9IGJvLT5iYXNl
LmRldjsKPiAgIAl2bV9mYXVsdF90IHJldDsKPiArCWludCBpZHg7Cj4gICAKPiAgIAlyZXQgPSB0
dG1fYm9fdm1fcmVzZXJ2ZShibywgdm1mKTsKPiAgIAlpZiAocmV0KQo+ICAgCQlyZXR1cm4gcmV0
Owo+ICAgCj4gLQlyZXQgPSBhbWRncHVfYm9fZmF1bHRfcmVzZXJ2ZV9ub3RpZnkoYm8pOwo+IC0J
aWYgKHJldCkKPiAtCQlnb3RvIHVubG9jazsKPiArCWlmIChkcm1fZGV2X2VudGVyKGRkZXYsICZp
ZHgpKSB7Cj4gKwkJcmV0ID0gYW1kZ3B1X2JvX2ZhdWx0X3Jlc2VydmVfbm90aWZ5KGJvKTsKPiAr
CQlpZiAocmV0KSB7Cj4gKwkJCWRybV9kZXZfZXhpdChpZHgpOwo+ICsJCQlnb3RvIHVubG9jazsK
PiArCQl9Cj4gICAKPiAtCXJldCA9IHR0bV9ib192bV9mYXVsdF9yZXNlcnZlZCh2bWYsIHZtZi0+
dm1hLT52bV9wYWdlX3Byb3QsCj4gLQkJCQkgICAgICAgVFRNX0JPX1ZNX05VTV9QUkVGQVVMVCwg
MSk7Cj4gKwkJIHJldCA9IHR0bV9ib192bV9mYXVsdF9yZXNlcnZlZCh2bWYsIHZtZi0+dm1hLT52
bV9wYWdlX3Byb3QsCj4gKwkJCQkJCVRUTV9CT19WTV9OVU1fUFJFRkFVTFQsIDEpOwo+ICsKPiAr
CQkgZHJtX2Rldl9leGl0KGlkeCk7Cj4gKwl9IGVsc2Ugewo+ICsJCXJldCA9IHR0bV9ib192bV9k
dW1teV9wYWdlKHZtZiwgdm1mLT52bWEtPnZtX3BhZ2VfcHJvdCk7Cj4gKwl9Cj4gICAJaWYgKHJl
dCA9PSBWTV9GQVVMVF9SRVRSWSAmJiAhKHZtZi0+ZmxhZ3MgJiBGQVVMVF9GTEFHX1JFVFJZX05P
V0FJVCkpCj4gICAJCXJldHVybiByZXQ7Cj4gICAKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxp
c3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2RyaS1kZXZlbAo=
