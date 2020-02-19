Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F42151644C4
	for <lists+dri-devel@lfdr.de>; Wed, 19 Feb 2020 13:59:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 655BF6E5D5;
	Wed, 19 Feb 2020 12:59:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 807786E5B2;
 Wed, 19 Feb 2020 12:59:18 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id g3so365898wrs.12;
 Wed, 19 Feb 2020 04:59:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=8j5/kNs2THmmZJqIvqiDhfvU0TM48N+fj+MtL6vI19M=;
 b=J4WuRD16ngxEYmlnmMZAPVtqDQR3v1UPhrNxwbM3kx6kfUAbP95toCxkG26rF22r/A
 YmWIuME+ClLuCKh3VUUGQHNXuoVNeMLjhQ3yCWwMufYEqHLYewCUfvRPiixifWVrdyqp
 qvhDZFNyGX+oZGNyvsWiMVYNRPPSbEdUTtnNMMpBlirxuT1XVmB6wd2iR4o3LfHQRQGK
 bIYXaasns0YTpZocppiC1WLyLOXpuUMNAiJsaPilNu1edG+BnBwkQC3hlQgnzerG7r6r
 wYD+UG1ftj33FpQVURyyfcaqSCo1VzofJmgTodBOCOFi71nOnEbG3trCNbmjhMsExJs+
 SLJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=8j5/kNs2THmmZJqIvqiDhfvU0TM48N+fj+MtL6vI19M=;
 b=PA0tGipGQbcEtT9IJKwSWbErGDUNxL5cp1qbd6UvD7RWV5d3KqCPciAAyzAkA59ClS
 FMtcIoLOIp4L6oJSnJwEbl4xYwQWec0kKi6x8pMt2LG4IJLhQI5q2qMeR/pJj4RXG4WC
 gCAcDsBUWomK/nS2xYolcNofmA+5Yryp0SdYMPLyQXyQFahmYv3YDgxWwwwIggOGO4B9
 Ov1YUBDGZC1zCoPsH6PdJzyrN6MpqY0GpRa3w4sesUVxlln8riocG/IYuozS/TN9b9u7
 rQFFekHcNOptzlxWnln157RsSdTzUud2ZS+Y37e2jHFPeC+okb23hPwT1PjoGHIIuMQw
 1RMQ==
X-Gm-Message-State: APjAAAW/JvSqqL5k3rqy9Onf1u6SVoPTrk222R430bzM5fdCnvFaQmJ3
 ln1msHBW5OOr2ASHvYBQ+PHnjyCA
X-Google-Smtp-Source: APXvYqyccjbJFlo0ApV1/Ph6tQqkttn13pN8Qrc+oUbYn50TU/Ft80EhI7pYqS8u1nGZCY4dlwAULw==
X-Received: by 2002:a5d:4a89:: with SMTP id o9mr34478332wrq.32.1582117156928; 
 Wed, 19 Feb 2020 04:59:16 -0800 (PST)
Received: from abel.fritz.box ([2a02:908:1252:fb60:90ea:9d7:18a3:895e])
 by smtp.gmail.com with ESMTPSA id h2sm3079024wrt.45.2020.02.19.04.59.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Feb 2020 04:59:16 -0800 (PST)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 linux-media@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 daniel@ffwll.ch
Subject: [PATCH 7/7] dma-buf: make move_notify mandatory if importer_ops are
 provided
Date: Wed, 19 Feb 2020 13:59:10 +0100
Message-Id: <20200219125910.89147-7-christian.koenig@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200219125910.89147-1-christian.koenig@amd.com>
References: <20200219125910.89147-1-christian.koenig@amd.com>
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhpcyBtYWtlcyB0aGUgbW92ZV9ub3RpZnkgY2FsbGJhY2sgbWFuZGF0b3J5IHdoZW4gdGhlIGlt
cG9ydGVyX29wcyBhcmUKcHJvdmlkZWQuIFNpbmNlIGFtZGdwdSBpcyBub3cgbWlncmF0ZWQgaXQg
ZG9lc24ndCBtYWtlIG11Y2ggc2Vuc2UKYW55bW9yZSB0byBhbGxvdyB0aGlzLgoKU2lnbmVkLW9m
Zi1ieTogQ2hyaXN0aWFuIEvDtm5pZyA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPgotLS0KIGRy
aXZlcnMvZG1hLWJ1Zi9kbWEtYnVmLmMgfCAxNSArKysrKysrLS0tLS0tLS0KIDEgZmlsZSBjaGFu
Z2VkLCA3IGluc2VydGlvbnMoKyksIDggZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVy
cy9kbWEtYnVmL2RtYS1idWYuYyBiL2RyaXZlcnMvZG1hLWJ1Zi9kbWEtYnVmLmMKaW5kZXggNmQw
YTgyZDFiMjNkLi5mNGFjZTlhZjIxOTEgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZG1hLWJ1Zi9kbWEt
YnVmLmMKKysrIGIvZHJpdmVycy9kbWEtYnVmL2RtYS1idWYuYwpAQCAtNjc3LDEwICs2NzcsMTIg
QEAgZG1hX2J1Zl9keW5hbWljX2F0dGFjaChzdHJ1Y3QgZG1hX2J1ZiAqZG1hYnVmLCBzdHJ1Y3Qg
ZGV2aWNlICpkZXYsCiAJc3RydWN0IGRtYV9idWZfYXR0YWNobWVudCAqYXR0YWNoOwogCWludCBy
ZXQ7CiAKLQkvKiBUT0RPOiBtYWtlIG1vdmVfbm90aWZ5IG1hbmRhdG9yeSBpZiBpbXBvcnRlcl9v
cHMgYXJlIHByb3ZpZGVkLiAqLwogCWlmIChXQVJOX09OKCFkbWFidWYgfHwgIWRldikpCiAJCXJl
dHVybiBFUlJfUFRSKC1FSU5WQUwpOwogCisJaWYgKFdBUk5fT04oaW1wb3J0ZXJfb3BzICYmICFp
bXBvcnRlcl9vcHMtPm1vdmVfbm90aWZ5KSkKKwkJcmV0dXJuIEVSUl9QVFIoLUVJTlZBTCk7CisK
IAlhdHRhY2ggPSBremFsbG9jKHNpemVvZigqYXR0YWNoKSwgR0ZQX0tFUk5FTCk7CiAJaWYgKCFh
dHRhY2gpCiAJCXJldHVybiBFUlJfUFRSKC1FTk9NRU0pOwpAQCAtODc3LDggKzg3OSw3IEBAIHN0
cnVjdCBzZ190YWJsZSAqZG1hX2J1Zl9tYXBfYXR0YWNobWVudChzdHJ1Y3QgZG1hX2J1Zl9hdHRh
Y2htZW50ICphdHRhY2gsCiAKIAlpZiAoZG1hX2J1Zl9pc19keW5hbWljKGF0dGFjaC0+ZG1hYnVm
KSkgewogCQlkbWFfcmVzdl9hc3NlcnRfaGVsZChhdHRhY2gtPmRtYWJ1Zi0+cmVzdik7Ci0JCWlm
ICghYXR0YWNoLT5pbXBvcnRlcl9vcHMtPm1vdmVfbm90aWZ5IHx8Ci0JCSAgICAhSVNfRU5BQkxF
RChDT05GSUdfRE1BQlVGX01PVkVfTk9USUZZKSkgeworCQlpZiAoIUlTX0VOQUJMRUQoQ09ORklH
X0RNQUJVRl9NT1ZFX05PVElGWSkpIHsKIAkJCXIgPSBkbWFfYnVmX3BpbihhdHRhY2gpOwogCQkJ
aWYgKHIpCiAJCQkJcmV0dXJuIEVSUl9QVFIocik7CkBAIC04OTAsOCArODkxLDcgQEAgc3RydWN0
IHNnX3RhYmxlICpkbWFfYnVmX21hcF9hdHRhY2htZW50KHN0cnVjdCBkbWFfYnVmX2F0dGFjaG1l
bnQgKmF0dGFjaCwKIAkJc2dfdGFibGUgPSBFUlJfUFRSKC1FTk9NRU0pOwogCiAJaWYgKElTX0VS
UihzZ190YWJsZSkgJiYgZG1hX2J1Zl9pc19keW5hbWljKGF0dGFjaC0+ZG1hYnVmKSAmJgotCSAg
ICAoIWF0dGFjaC0+aW1wb3J0ZXJfb3BzLT5tb3ZlX25vdGlmeSB8fAotCSAgICAgIUlTX0VOQUJM
RUQoQ09ORklHX0RNQUJVRl9NT1ZFX05PVElGWSkpKQorCSAgICAgIUlTX0VOQUJMRUQoQ09ORklH
X0RNQUJVRl9NT1ZFX05PVElGWSkpCiAJCWRtYV9idWZfdW5waW4oYXR0YWNoKTsKIAogCWlmICgh
SVNfRVJSKHNnX3RhYmxlKSAmJiBhdHRhY2gtPmRtYWJ1Zi0+b3BzLT5jYWNoZV9zZ3RfbWFwcGlu
ZykgewpAQCAtOTM0LDggKzkzNCw3IEBAIHZvaWQgZG1hX2J1Zl91bm1hcF9hdHRhY2htZW50KHN0
cnVjdCBkbWFfYnVmX2F0dGFjaG1lbnQgKmF0dGFjaCwKIAlhdHRhY2gtPmRtYWJ1Zi0+b3BzLT51
bm1hcF9kbWFfYnVmKGF0dGFjaCwgc2dfdGFibGUsIGRpcmVjdGlvbik7CiAKIAlpZiAoZG1hX2J1
Zl9pc19keW5hbWljKGF0dGFjaC0+ZG1hYnVmKSAmJgotCSAgICAoIWF0dGFjaC0+aW1wb3J0ZXJf
b3BzLT5tb3ZlX25vdGlmeSB8fAotCSAgICAgIUlTX0VOQUJMRUQoQ09ORklHX0RNQUJVRl9NT1ZF
X05PVElGWSkpKQorCSAgICAhSVNfRU5BQkxFRChDT05GSUdfRE1BQlVGX01PVkVfTk9USUZZKSkK
IAkJZG1hX2J1Zl91bnBpbihhdHRhY2gpOwogfQogRVhQT1JUX1NZTUJPTF9HUEwoZG1hX2J1Zl91
bm1hcF9hdHRhY2htZW50KTsKQEAgLTk1NSw3ICs5NTQsNyBAQCB2b2lkIGRtYV9idWZfbW92ZV9u
b3RpZnkoc3RydWN0IGRtYV9idWYgKmRtYWJ1ZikKIAlkbWFfcmVzdl9hc3NlcnRfaGVsZChkbWFi
dWYtPnJlc3YpOwogCiAJbGlzdF9mb3JfZWFjaF9lbnRyeShhdHRhY2gsICZkbWFidWYtPmF0dGFj
aG1lbnRzLCBub2RlKQotCQlpZiAoYXR0YWNoLT5pbXBvcnRlcl9vcHMgJiYgYXR0YWNoLT5pbXBv
cnRlcl9vcHMtPm1vdmVfbm90aWZ5KQorCQlpZiAoYXR0YWNoLT5pbXBvcnRlcl9vcHMpCiAJCQlh
dHRhY2gtPmltcG9ydGVyX29wcy0+bW92ZV9ub3RpZnkoYXR0YWNoKTsKIH0KIEVYUE9SVF9TWU1C
T0xfR1BMKGRtYV9idWZfbW92ZV9ub3RpZnkpOwotLSAKMi4xNy4xCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRy
aS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5v
cmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
