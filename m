Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1504C310BFA
	for <lists+dri-devel@lfdr.de>; Fri,  5 Feb 2021 14:41:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B3DFB6E364;
	Fri,  5 Feb 2021 13:41:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2EC386E364
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Feb 2021 13:41:20 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id y187so5940864wmd.3
 for <dri-devel@lists.freedesktop.org>; Fri, 05 Feb 2021 05:41:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=GCaPcXl/zVoyH5ug7imo/Ptsoxk4zPxmqCZda8+3vCk=;
 b=Lg5I//U+jhljDep/tZbtlTBpL5Gqws3LZ1vaFmypVkTv0Zi1lCd9nNxhtmfF2IqrE1
 AQoLvMyrj7A6O41YXJiLwrrXzI1tgbvquIvcCydeB8vwCbH1Zfs/jKFez7Su+Qmo+EKL
 oFVBD8wgDQ3lhywMaJ/EF47zwno3jVpfMEiOg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=GCaPcXl/zVoyH5ug7imo/Ptsoxk4zPxmqCZda8+3vCk=;
 b=jQpsgl8kDaoXaoPH++KqJdVJulAgiSgdVguFhJJeJXmOZiGZZ1+X7FAjUHaqvCf9He
 gZ7wLwgXQ4MO6W/8XmldChA/8vAbH99mseAhGCifiGpjXQNcEIb5dTzD5a6vCikEHoMA
 FmWuyu431AwKHAZN2OAAI15BUtFIZauAhrhwpkJdm5d4M28X/Sun93LptINEwMpotCd0
 ZnoFdYTAfTmZsZwrEu9aN2rB9lE+7Pln414nx7agZUGU9G+2X2X1YuD8pctFhzU5xYFD
 /BjzTVUvOYRy/cD4oCHIKhEbl64B0oKrmJ+rRS/GJWOtb+QhcGrLU1pCwyggsPeTUiAE
 hguA==
X-Gm-Message-State: AOAM530i12FzX5Ke2bK+zDVC+l8JLWTNQCIcNXapCHHl7uYqSdExoR3Q
 TddFbg23WieNDVTraekndhE6FfrrqoMP9kkP
X-Google-Smtp-Source: ABdhPJxrEXwkznYjeTT/T1bKOmAFxHx1aF6QSVq23Pt2SeXnxTFe4vLc0aqZqhVVuO6mujFzLCYWAA==
X-Received: by 2002:a1c:2783:: with SMTP id n125mr3673907wmn.74.1612532478791; 
 Fri, 05 Feb 2021 05:41:18 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id b19sm8620382wmj.22.2021.02.05.05.41.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Feb 2021 05:41:18 -0800 (PST)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH] RFC: dma-buf: Require VM_PFNMAP vma for mmap
Date: Fri,  5 Feb 2021 14:41:13 +0100
Message-Id: <20210205134113.2834980-1-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210203211948.2529297-1-daniel.vetter@ffwll.ch>
References: <20210203211948.2529297-1-daniel.vetter@ffwll.ch>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Matthew Wilcox <willy@infradead.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 linaro-mm-sig@lists.linaro.org, Jason Gunthorpe <jgg@ziepe.ca>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Suren Baghdasaryan <surenb@google.com>, linux-media@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

dGxkcjsgRE1BIGJ1ZmZlcnMgYXJlbid0IG5vcm1hbCBtZW1vcnksIGV4cGVjdGluZyB0aGF0IHlv
dSBjYW4gdXNlCnRoZW0gbGlrZSB0aGF0IChsaWtlIGNhbGxpbmcgZ2V0X3VzZXJfcGFnZXMgd29y
a3MsIG9yIHRoYXQgdGhleSdyZQphY2NvdW50aW5nIGxpa2UgYW55IG90aGVyIG5vcm1hbCBtZW1v
cnkpIGNhbm5vdCBiZSBndWFyYW50ZWVkLgoKU2luY2Ugc29tZSB1c2Vyc3BhY2Ugb25seSBydW5z
IG9uIGludGVncmF0ZWQgZGV2aWNlcywgd2hlcmUgYWxsCmJ1ZmZlcnMgYXJlIGFjdHVhbGx5IGFs
bCByZXNpZGVudCBzeXN0ZW0gbWVtb3J5LCB0aGVyZSdzIGEgaHVnZQp0ZW1wdGF0aW9uIHRvIGFz
c3VtZSB0aGF0IGEgc3RydWN0IHBhZ2UgaXMgYWx3YXlzIHByZXNlbnQgYW5kIHVzZWFibGUKbGlr
ZSBmb3IgYW55IG1vcmUgcGFnZWNhY2hlIGJhY2tlZCBtbWFwLiBUaGlzIGhhcyB0aGUgcG90ZW50
aWFsIHRvCnJlc3VsdCBpbiBhIHVhcGkgbmlnaHRtYXJlLgoKVG8gc3RvcCB0aGlzIGdhcCByZXF1
aXJlIHRoYXQgRE1BIGJ1ZmZlciBtbWFwcyBhcmUgVk1fUEZOTUFQLCB3aGljaApibG9ja3MgZ2V0
X3VzZXJfcGFnZXMgYW5kIGFsbCB0aGUgb3RoZXIgc3RydWN0IHBhZ2UgYmFzZWQKaW5mcmFzdHJ1
Y3R1cmUgZm9yIGV2ZXJ5b25lLiBJbiBzcGlyaXQgdGhpcyBpcyB0aGUgdWFwaSBjb3VudGVycGFy
dCB0bwp0aGUga2VybmVsLWludGVybmFsIENPTkZJR19ETUFCVUZfREVCVUcuCgpNb3RpdmF0ZWQg
YnkgYSByZWNlbnQgcGF0Y2ggd2hpY2ggd2FudGVkIHRvIHN3aWNoIHRoZSBzeXN0ZW0gZG1hLWJ1
ZgpoZWFwIHRvIHZtX2luc2VydF9wYWdlIGluc3RlYWQgb2Ygdm1faW5zZXJ0X3Bmbi4KCnYyOgoK
SmFzb24gYnJvdWdodCB1cCB0aGF0IHdlIGFsc28gd2FudCB0byBndWFyYW50ZWUgdGhhdCBhbGwg
cHRlcyBoYXZlIHRoZQpwdGVfc3BlY2lhbCBmbGFnIHNldCwgdG8gY2F0Y2ggZmFzdCBnZXRfdXNl
cl9wYWdlcyAob24gYXJjaGl0ZWN0dXJlcwp0aGF0IHN1cHBvcnQgdGhpcykuIEFsbG93aW5nIFZN
X01JWEVETUFQIChsaWtlIFZNX1NQRUNJQUwgZG9lcykgd291bGQKc3RpbGwgYWxsb3cgdm1faW5z
ZXJ0X3BhZ2UsIGJ1dCBsaW1pdGluZyB0byBWTV9QRk5NQVAgd2lsbCBjYXRjaCB0aGF0LgoKRnJv
bSBhdWRpdGluZyB0aGUgdmFyaW91cyBmdW5jdGlvbnMgdG8gaW5zZXJ0IHBmbiBwdGUgZW50aXJl
cwoodm1faW5zZXJ0X3Bmbl9wcm90LCByZW1hcF9wZm5fcmFuZ2UgYW5kIGFsbCBpdCdzIGNhbGxl
cnMgbGlrZQpkbWFfbW1hcF93YykgaXQgbG9va3MgbGlrZSBWTV9QRk5NQVAgaXMgYWxyZWFkeSBy
ZXF1aXJlZCBhbnl3YXksIHNvCnRoaXMgc2hvdWxkIGJlIHRoZSBjb3JyZWN0IGZsYWcgdG8gY2hl
Y2sgZm9yLgoKUmVmZXJlbmNlczogaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGttbC9DQUtNSzd1
SGkrbUcwejBIVW1OdDEzUUNDdnV0dVJWanBjUjBOalJMMTJrLVdiV3prUmdAbWFpbC5nbWFpbC5j
b20vCkNjOiBKYXNvbiBHdW50aG9ycGUgPGpnZ0B6aWVwZS5jYT4KQ2M6IFN1cmVuIEJhZ2hkYXNh
cnlhbiA8c3VyZW5iQGdvb2dsZS5jb20+CkNjOiBNYXR0aGV3IFdpbGNveCA8d2lsbHlAaW5mcmFk
ZWFkLm9yZz4KQ2M6IEpvaG4gU3R1bHR6IDxqb2huLnN0dWx0ekBsaW5hcm8ub3JnPgpTaWduZWQt
b2ZmLWJ5OiBEYW5pZWwgVmV0dGVyIDxkYW5pZWwudmV0dGVyQGludGVsLmNvbT4KQ2M6IFN1bWl0
IFNlbXdhbCA8c3VtaXQuc2Vtd2FsQGxpbmFyby5vcmc+CkNjOiAiQ2hyaXN0aWFuIEvDtm5pZyIg
PGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4KQ2M6IGxpbnV4LW1lZGlhQHZnZXIua2VybmVsLm9y
ZwpDYzogbGluYXJvLW1tLXNpZ0BsaXN0cy5saW5hcm8ub3JnCi0tLQogZHJpdmVycy9kbWEtYnVm
L2RtYS1idWYuYyB8IDE1ICsrKysrKysrKysrKystLQogMSBmaWxlIGNoYW5nZWQsIDEzIGluc2Vy
dGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9kbWEtYnVmL2Rt
YS1idWYuYyBiL2RyaXZlcnMvZG1hLWJ1Zi9kbWEtYnVmLmMKaW5kZXggZjI2NGI3MGMzODNlLi4w
NmNiMWQyZTlmZGMgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZG1hLWJ1Zi9kbWEtYnVmLmMKKysrIGIv
ZHJpdmVycy9kbWEtYnVmL2RtYS1idWYuYwpAQCAtMTI3LDYgKzEyNyw3IEBAIHN0YXRpYyBzdHJ1
Y3QgZmlsZV9zeXN0ZW1fdHlwZSBkbWFfYnVmX2ZzX3R5cGUgPSB7CiBzdGF0aWMgaW50IGRtYV9i
dWZfbW1hcF9pbnRlcm5hbChzdHJ1Y3QgZmlsZSAqZmlsZSwgc3RydWN0IHZtX2FyZWFfc3RydWN0
ICp2bWEpCiB7CiAJc3RydWN0IGRtYV9idWYgKmRtYWJ1ZjsKKwlpbnQgcmV0OwogCiAJaWYgKCFp
c19kbWFfYnVmX2ZpbGUoZmlsZSkpCiAJCXJldHVybiAtRUlOVkFMOwpAQCAtMTQyLDcgKzE0Mywx
MSBAQCBzdGF0aWMgaW50IGRtYV9idWZfbW1hcF9pbnRlcm5hbChzdHJ1Y3QgZmlsZSAqZmlsZSwg
c3RydWN0IHZtX2FyZWFfc3RydWN0ICp2bWEpCiAJICAgIGRtYWJ1Zi0+c2l6ZSA+PiBQQUdFX1NI
SUZUKQogCQlyZXR1cm4gLUVJTlZBTDsKIAotCXJldHVybiBkbWFidWYtPm9wcy0+bW1hcChkbWFi
dWYsIHZtYSk7CisJcmV0ID0gZG1hYnVmLT5vcHMtPm1tYXAoZG1hYnVmLCB2bWEpOworCisJV0FS
Tl9PTighKHZtYS0+dm1fZmxhZ3MgJiBWTV9QRk5NQVApKTsKKworCXJldHVybiByZXQ7CiB9CiAK
IHN0YXRpYyBsb2ZmX3QgZG1hX2J1Zl9sbHNlZWsoc3RydWN0IGZpbGUgKmZpbGUsIGxvZmZfdCBv
ZmZzZXQsIGludCB3aGVuY2UpCkBAIC0xMjQ0LDYgKzEyNDksOCBAQCBFWFBPUlRfU1lNQk9MX0dQ
TChkbWFfYnVmX2VuZF9jcHVfYWNjZXNzKTsKIGludCBkbWFfYnVmX21tYXAoc3RydWN0IGRtYV9i
dWYgKmRtYWJ1Ziwgc3RydWN0IHZtX2FyZWFfc3RydWN0ICp2bWEsCiAJCSB1bnNpZ25lZCBsb25n
IHBnb2ZmKQogeworCWludCByZXQ7CisKIAlpZiAoV0FSTl9PTighZG1hYnVmIHx8ICF2bWEpKQog
CQlyZXR1cm4gLUVJTlZBTDsKIApAQCAtMTI2NCw3ICsxMjcxLDExIEBAIGludCBkbWFfYnVmX21t
YXAoc3RydWN0IGRtYV9idWYgKmRtYWJ1Ziwgc3RydWN0IHZtX2FyZWFfc3RydWN0ICp2bWEsCiAJ
dm1hX3NldF9maWxlKHZtYSwgZG1hYnVmLT5maWxlKTsKIAl2bWEtPnZtX3Bnb2ZmID0gcGdvZmY7
CiAKLQlyZXR1cm4gZG1hYnVmLT5vcHMtPm1tYXAoZG1hYnVmLCB2bWEpOworCXJldCA9IGRtYWJ1
Zi0+b3BzLT5tbWFwKGRtYWJ1Ziwgdm1hKTsKKworCVdBUk5fT04oISh2bWEtPnZtX2ZsYWdzICYg
Vk1fUEZOTUFQKSk7CisKKwlyZXR1cm4gcmV0OwogfQogRVhQT1JUX1NZTUJPTF9HUEwoZG1hX2J1
Zl9tbWFwKTsKIAotLSAKMi4zMC4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5m
by9kcmktZGV2ZWwK
