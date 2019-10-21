Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CD39DEA9A
	for <lists+dri-devel@lfdr.de>; Mon, 21 Oct 2019 13:15:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C1AE890AA;
	Mon, 21 Oct 2019 11:15:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 28A1E88FCF;
 Mon, 21 Oct 2019 11:15:30 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id v3so1442295wmh.1;
 Mon, 21 Oct 2019 04:15:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=7c5Qzq9KoeAeHZDAZpUJnWCjxxzWTWUy42GlQzoDXV0=;
 b=ZXRbcThPtQ1P23TsfOsyDwNM+1MDeZ5v2MxtE9RW8N3/cQ1xXY/AavIyW0EasiDOeZ
 CZL1NnAgxHnwy9y46V4ZgPTHd0dm4Ga2px+V1cTvJ5HeJCR6Kb51tEM6QAT57uYnhmFV
 YpPLQt0Fkxq2D8gpBr0L46/aMpZhdJxHsv8EUdAoy9pTPYYwVf2k0xsd92Vpxh7OgVw2
 ZKR7YJoS+uudhJAsQN/C8pIK7ax3KvHSnhWkr8PzNdF4wjJFPIzIibGcQLQfEjOISg0N
 f9kTIM4M5Lz9E2Ai1KR5LeAQcrIJ3e+UoZuLT7rmc6V+T+Plp6USb9GtA7AvSQ36EuwS
 eihw==
X-Gm-Message-State: APjAAAVPWkwh+V3PMaMvxlyHLGmL17I7OJm/6v/MxXEAQBL4SqZOEjT9
 6e8s+hYPbOc4SjinABQvyo71Mz2L
X-Google-Smtp-Source: APXvYqxW81KRS6pTbAx1n00iEXUv6tQFsMzKCBICUSmt+H08oQcDhMvCeGT/1W/4ZZq6o1rbXHhWtQ==
X-Received: by 2002:a1c:e912:: with SMTP id q18mr19108187wmc.29.1571656528599; 
 Mon, 21 Oct 2019 04:15:28 -0700 (PDT)
Received: from abel.fritz.box ([2a02:908:1252:fb60:c194:dd41:4bef:70cc])
 by smtp.gmail.com with ESMTPSA id l9sm13152415wme.45.2019.10.21.04.15.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Oct 2019 04:15:28 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: dri-devel@lists.freedesktop.org, sumit.semwal@linaro.org,
 linaro-mm-sig@lists.linaro.org, linux-media@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, daniel@ffwll.ch
Subject: [PATCH 2/4] dma-buf: stop using the dmabuf->lock so much
Date: Mon, 21 Oct 2019 13:15:22 +0200
Message-Id: <20191021111524.14793-2-christian.koenig@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191021111524.14793-1-christian.koenig@amd.com>
References: <20191021111524.14793-1-christian.koenig@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=7c5Qzq9KoeAeHZDAZpUJnWCjxxzWTWUy42GlQzoDXV0=;
 b=HSOPmb5Mmgc4EWngj+Xfe3rtVV7heQZosok7UrRHMB33Pd7lRsZqElsgybATdAb1Di
 6rzbSIh81Xiz0aLQSg6daozUrYKexTTIXpBjFfJKtyEnwJ1ybuVQE/GirIvb1SlWe89+
 dkFS8MMOG4DtJGguTymO7Ewcl/PI60apRJIEkohJp3OkEpLrbhbuPyoIHH1snw+etvPV
 HWdyu0LyGdOOIYBPHpNbRIf/+eS9aFU71au4MVPyk/mmm8fJuiFHq6ETd960GQGYDWzV
 nc0o+6UTIDgbo/iIyijmnRyNwdJk7syJ2cJouwk2yf7W/9PoXxDYZi5nFapyHQPIevcQ
 6Evw==
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhlIGF0dGFjaG1lbnQgbGlzdCBpcyBub3cgcHJvdGVjdGVkIGJ5IHRoZSBkbWFfcmVzdiBvYmpl
Y3QuClNvIHdlIGNhbiBkcm9wIGhvbGRpbmcgdGhpcyBsb2NrIHRvIGFsbG93IGNvbmN1cnJlbnQg
YXR0YWNoCmFuZCBkZXRhY2ggb3BlcmF0aW9ucy4KClNpZ25lZC1vZmYtYnk6IENocmlzdGlhbiBL
w7ZuaWcgPGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4KLS0tCiBkcml2ZXJzL2RtYS1idWYvZG1h
LWJ1Zi5jIHwgMTYgLS0tLS0tLS0tLS0tLS0tLQogMSBmaWxlIGNoYW5nZWQsIDE2IGRlbGV0aW9u
cygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZG1hLWJ1Zi9kbWEtYnVmLmMgYi9kcml2ZXJzL2Rt
YS1idWYvZG1hLWJ1Zi5jCmluZGV4IDc1M2JlODRiNWZkNi4uYzczNmU2N2FlMWExIDEwMDY0NAot
LS0gYS9kcml2ZXJzL2RtYS1idWYvZG1hLWJ1Zi5jCisrKyBiL2RyaXZlcnMvZG1hLWJ1Zi9kbWEt
YnVmLmMKQEAgLTY4NSw4ICs2ODUsNiBAQCBkbWFfYnVmX2R5bmFtaWNfYXR0YWNoKHN0cnVjdCBk
bWFfYnVmICpkbWFidWYsIHN0cnVjdCBkZXZpY2UgKmRldiwKIAlhdHRhY2gtPmRtYWJ1ZiA9IGRt
YWJ1ZjsKIAlhdHRhY2gtPmR5bmFtaWNfbWFwcGluZyA9IGR5bmFtaWNfbWFwcGluZzsKIAotCW11
dGV4X2xvY2soJmRtYWJ1Zi0+bG9jayk7Ci0KIAlpZiAoZG1hYnVmLT5vcHMtPmF0dGFjaCkgewog
CQlyZXQgPSBkbWFidWYtPm9wcy0+YXR0YWNoKGRtYWJ1ZiwgYXR0YWNoKTsKIAkJaWYgKHJldCkK
QEAgLTY5Niw4ICs2OTQsNiBAQCBkbWFfYnVmX2R5bmFtaWNfYXR0YWNoKHN0cnVjdCBkbWFfYnVm
ICpkbWFidWYsIHN0cnVjdCBkZXZpY2UgKmRldiwKIAlsaXN0X2FkZCgmYXR0YWNoLT5ub2RlLCAm
ZG1hYnVmLT5hdHRhY2htZW50cyk7CiAJZG1hX3Jlc3ZfdW5sb2NrKGRtYWJ1Zi0+cmVzdik7CiAK
LQltdXRleF91bmxvY2soJmRtYWJ1Zi0+bG9jayk7Ci0KIAkvKiBXaGVuIGVpdGhlciB0aGUgaW1w
b3J0ZXIgb3IgdGhlIGV4cG9ydGVyIGNhbid0IGhhbmRsZSBkeW5hbWljCiAJICogbWFwcGluZ3Mg
d2UgY2FjaGUgdGhlIG1hcHBpbmcgaGVyZSB0byBhdm9pZCBpc3N1ZXMgd2l0aCB0aGUKIAkgKiBy
ZXNlcnZhdGlvbiBvYmplY3QgbG9jay4KQEAgLTcyNiw3ICs3MjIsNiBAQCBkbWFfYnVmX2R5bmFt
aWNfYXR0YWNoKHN0cnVjdCBkbWFfYnVmICpkbWFidWYsIHN0cnVjdCBkZXZpY2UgKmRldiwKIAog
ZXJyX2F0dGFjaDoKIAlrZnJlZShhdHRhY2gpOwotCW11dGV4X3VubG9jaygmZG1hYnVmLT5sb2Nr
KTsKIAlyZXR1cm4gRVJSX1BUUihyZXQpOwogCiBlcnJfdW5sb2NrOgpAQCAtNzc2LDE0ICs3NzEs
MTIgQEAgdm9pZCBkbWFfYnVmX2RldGFjaChzdHJ1Y3QgZG1hX2J1ZiAqZG1hYnVmLCBzdHJ1Y3Qg
ZG1hX2J1Zl9hdHRhY2htZW50ICphdHRhY2gpCiAJCQlkbWFfcmVzdl91bmxvY2soYXR0YWNoLT5k
bWFidWYtPnJlc3YpOwogCX0KIAotCW11dGV4X2xvY2soJmRtYWJ1Zi0+bG9jayk7CiAJZG1hX3Jl
c3ZfbG9jayhkbWFidWYtPnJlc3YsIE5VTEwpOwogCWxpc3RfZGVsKCZhdHRhY2gtPm5vZGUpOwog
CWRtYV9yZXN2X3VubG9jayhkbWFidWYtPnJlc3YpOwogCWlmIChkbWFidWYtPm9wcy0+ZGV0YWNo
KQogCQlkbWFidWYtPm9wcy0+ZGV0YWNoKGRtYWJ1ZiwgYXR0YWNoKTsKIAotCW11dGV4X3VubG9j
aygmZG1hYnVmLT5sb2NrKTsKIAlrZnJlZShhdHRhY2gpOwogfQogRVhQT1JUX1NZTUJPTF9HUEwo
ZG1hX2J1Zl9kZXRhY2gpOwpAQCAtMTI0NywxNCArMTI0MCw2IEBAIHN0YXRpYyBpbnQgZG1hX2J1
Zl9kZWJ1Z19zaG93KHN0cnVjdCBzZXFfZmlsZSAqcywgdm9pZCAqdW51c2VkKQogCQkgICAic2l6
ZSIsICJmbGFncyIsICJtb2RlIiwgImNvdW50IiwgImlubyIpOwogCiAJbGlzdF9mb3JfZWFjaF9l
bnRyeShidWZfb2JqLCAmZGJfbGlzdC5oZWFkLCBsaXN0X25vZGUpIHsKLQkJcmV0ID0gbXV0ZXhf
bG9ja19pbnRlcnJ1cHRpYmxlKCZidWZfb2JqLT5sb2NrKTsKLQotCQlpZiAocmV0KSB7Ci0JCQlz
ZXFfcHV0cyhzLAotCQkJCSAiXHRFUlJPUiBsb2NraW5nIGJ1ZmZlciBvYmplY3Q6IHNraXBwaW5n
XG4iKTsKLQkJCWNvbnRpbnVlOwotCQl9Ci0KIAkJc2VxX3ByaW50ZihzLCAiJTA4enVcdCUwOHhc
dCUwOHhcdCUwOGxkXHQlc1x0JTA4bHVcdCVzXG4iLAogCQkJCWJ1Zl9vYmotPnNpemUsCiAJCQkJ
YnVmX29iai0+ZmlsZS0+Zl9mbGFncywgYnVmX29iai0+ZmlsZS0+Zl9tb2RlLApAQCAtMTMwNyw3
ICsxMjkyLDYgQEAgc3RhdGljIGludCBkbWFfYnVmX2RlYnVnX3Nob3coc3RydWN0IHNlcV9maWxl
ICpzLCB2b2lkICp1bnVzZWQpCiAKIAkJY291bnQrKzsKIAkJc2l6ZSArPSBidWZfb2JqLT5zaXpl
OwotCQltdXRleF91bmxvY2soJmJ1Zl9vYmotPmxvY2spOwogCX0KIAogCXNlcV9wcmludGYocywg
IlxuVG90YWwgJWQgb2JqZWN0cywgJXp1IGJ5dGVzXG4iLCBjb3VudCwgc2l6ZSk7Ci0tIAoyLjE3
LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1k
ZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
