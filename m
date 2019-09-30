Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 01E3BC2DD0
	for <lists+dri-devel@lfdr.de>; Tue,  1 Oct 2019 09:13:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A42A6E499;
	Tue,  1 Oct 2019 07:13:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd43.google.com (mail-io1-xd43.google.com
 [IPv6:2607:f8b0:4864:20::d43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B0F0289C27;
 Mon, 30 Sep 2019 21:26:55 +0000 (UTC)
Received: by mail-io1-xd43.google.com with SMTP id v2so42160203iob.10;
 Mon, 30 Sep 2019 14:26:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=gtzmZPAVj6PcCAW/gCFtani94tf/hKkhMopNIaCQ7ds=;
 b=L5Ssyn5X+lSvNh3LRC1fHv47uUI+x0tn8l1DV/82P1BqykjbMChYH7QQXsPj0dx9vP
 1lNefAb/EmStYJjTeYkhTwQMD+TmDm6skYGceFgkNyE2nCvv7Bgz/NQ0J9hpSX09Xtr+
 2vb3v7pkz30ySYkG/+Dez76jhLgDK+pu5gRTI0xvlFe4031xWU8+mCUa3+R1mUNYmZqF
 kxJgLVWYtoq7jPV6UzgktQ4gneZ3TBTSSYUgFm51H8AzMl3XSCGwTXpoS5j78RE6Mpdj
 5/0fN0QwQ1/zP4Z6lWyKuU0naN0GZgd8A8OSEDUmnb4cqtHWi+lA9aI9H3PeXKnLwgLl
 1AAw==
X-Gm-Message-State: APjAAAVoqz9zfMdkuqPs3Lilx6bOggtn0f6iWkHsTIjenc6/BfspftFb
 d3dG6z+QPz9tvm4tTGxfcHk=
X-Google-Smtp-Source: APXvYqwqKrouifY+TUn3+EnzlbHCJts4Y8+G3uZGOt53gcb1+rRpxiIr456oNIBCAHqtJbFFdjFrag==
X-Received: by 2002:a92:91d0:: with SMTP id e77mr22402443ill.10.1569878814906; 
 Mon, 30 Sep 2019 14:26:54 -0700 (PDT)
Received: from cs-dulles.cs.umn.edu (cs-dulles.cs.umn.edu. [128.101.35.54])
 by smtp.googlemail.com with ESMTPSA id i6sm6190116ile.60.2019.09.30.14.26.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Sep 2019 14:26:54 -0700 (PDT)
From: Navid Emamdoost <navid.emamdoost@gmail.com>
To: Christian.Koenig@amd.com
Subject: [PATCH v3] drm/amdgpu: fix multiple memory leaks in acp_hw_init
Date: Mon, 30 Sep 2019 16:26:40 -0500
Message-Id: <20190930212644.9372-1-navid.emamdoost@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <88fc639a-32ed-b6c6-f930-552083d5887d@amd.com>
References: <88fc639a-32ed-b6c6-f930-552083d5887d@amd.com>
X-Mailman-Approved-At: Tue, 01 Oct 2019 07:13:05 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=gtzmZPAVj6PcCAW/gCFtani94tf/hKkhMopNIaCQ7ds=;
 b=FD5o0cLnuDAFLJqEhrrC31vOT5SzTRN0LzNpf9asGEXan9ZkJpInwrIG+HJ5diLOfh
 oPJo4CiDaE7KPqS65fIQ1oc9f5z0ndEZeBMtRin2bG/cAKtF9KOZ8MlqTm98Zb3dVMxA
 k9e5B8X4gupvZ19gRf3hnYXBOUwnmMO/qnMYDHhf1ctHhPuAaiAux9EecsxF4hGGHIld
 sJIEk65xE2Q5ojHW5JpkDyVMda/d/p8VzeADkR+5G5Y/6k8SqMVltk/2WU/Nnw9CVkWe
 v04gDbT9a6iga3WfXrkcGleApgfuPEzx1j6YGgmkwPA1oSGNowzWIhDjV9CTr34IWwaT
 wMZA==
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
Cc: David Airlie <airlied@linux.ie>, Rex Zhu <Rex.Zhu@amd.com>, kjlu@umn.edu,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org, emamd001@umn.edu,
 dri-devel@lists.freedesktop.org, smccaman@umn.edu,
 Alex Deucher <alexander.deucher@amd.com>, Sam Ravnborg <sam@ravnborg.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Navid Emamdoost <navid.emamdoost@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SW4gYWNwX2h3X2luaXQgdGhlcmUgYXJlIHNvbWUgYWxsb2NhdGlvbnMgdGhhdCBuZWVkcyB0byBi
ZSByZWxlYXNlZCBpbgpjYXNlIG9mIGZhaWx1cmU6CgoxLSBhZGV2LT5hY3AuYWNwX2dlbnBkIHNo
b3VsZCBiZSByZWxlYXNlZCBpZiBhbnkgYWxsb2NhdGlvbiBhdHRlbXAgZm9yCmFkZXYtPmFjcC5h
Y3BfY2VsbCwgYWRldi0+YWNwLmFjcF9yZXMgb3IgaTJzX3BkYXRhIGZhaWxzLgoyLSBhbGwgb2Yg
dGhvc2UgYWxsb2NhdGlvbnMgc2hvdWxkIGJlIHJlbGVhc2VkIGlmCm1mZF9hZGRfaG90cGx1Z19k
ZXZpY2VzIG9yIHBtX2dlbnBkX2FkZF9kZXZpY2UgZmFpbC4KMy0gUmVsZWFzZSBpcyBuZWVkZWQg
aW4gY2FzZSBvZiB0aW1lIG91dCB2YWx1ZXMgZXhwaXJlLgoKU2lnbmVkLW9mZi1ieTogTmF2aWQg
RW1hbWRvb3N0IDxuYXZpZC5lbWFtZG9vc3RAZ21haWwuY29tPgotLS0KQ2hhbmdlcyBpbiB2MjoK
CS0tIG1vdmVkIHRoZSByZWxlYXNlcyB1bmRlciBnb3RvCgpDaGFuZ2VzIGluIHYzOgoJLS0gZml4
ZWQgbXVsdGlwbGUgZ290byBpc3N1ZQoJLS0gYWRkZWQgZ290byBmb3IgMyBvdGhlciBmYWlsdXJl
IGNhc2VzOiBvbmUgd2hlbgptZmRfYWRkX2hvdHBsdWdfZGV2aWNlcyBmYWlscywgYW5kIHR3byB3
aGVuIHRpbWUgb3V0IHZhbHVlcyBleHBpcmVzLgotLS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1k
Z3B1L2FtZGdwdV9hY3AuYyB8IDQxICsrKysrKysrKysrKysrKystLS0tLS0tLS0KIDEgZmlsZSBj
aGFuZ2VkLCAyNyBpbnNlcnRpb25zKCspLCAxNCBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9k
cml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfYWNwLmMgYi9kcml2ZXJzL2dwdS9kcm0v
YW1kL2FtZGdwdS9hbWRncHVfYWNwLmMKaW5kZXggZWJhNDJjNzUyYmNhLi43ODA5NzQ1ZWMwZjEg
MTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9hY3AuYworKysg
Yi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfYWNwLmMKQEAgLTE4NCwxMiArMTg0
LDEyIEBAIHN0YXRpYyBzdHJ1Y3QgZGV2aWNlICpnZXRfbWZkX2NlbGxfZGV2KGNvbnN0IGNoYXIg
KmRldmljZV9uYW1lLCBpbnQgcikKICAqLwogc3RhdGljIGludCBhY3BfaHdfaW5pdCh2b2lkICpo
YW5kbGUpCiB7Ci0JaW50IHIsIGk7CisJaW50IHIsIGksIHJldDsKIAl1aW50NjRfdCBhY3BfYmFz
ZTsKIAl1MzIgdmFsID0gMDsKIAl1MzIgY291bnQgPSAwOwogCXN0cnVjdCBkZXZpY2UgKmRldjsK
LQlzdHJ1Y3QgaTJzX3BsYXRmb3JtX2RhdGEgKmkyc19wZGF0YTsKKwlzdHJ1Y3QgaTJzX3BsYXRm
b3JtX2RhdGEgKmkyc19wZGF0YSA9IE5VTEw7CiAKIAlzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRl
diA9IChzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqKWhhbmRsZTsKIApAQCAtMjMxLDIwICsyMzEsMjEg
QEAgc3RhdGljIGludCBhY3BfaHdfaW5pdCh2b2lkICpoYW5kbGUpCiAJYWRldi0+YWNwLmFjcF9j
ZWxsID0ga2NhbGxvYyhBQ1BfREVWUywgc2l6ZW9mKHN0cnVjdCBtZmRfY2VsbCksCiAJCQkJCQkJ
R0ZQX0tFUk5FTCk7CiAKLQlpZiAoYWRldi0+YWNwLmFjcF9jZWxsID09IE5VTEwpCi0JCXJldHVy
biAtRU5PTUVNOworCWlmIChhZGV2LT5hY3AuYWNwX2NlbGwgPT0gTlVMTCkgeworCQlyZXQgPSAt
RU5PTUVNOworCQlnb3RvIGZhaWx1cmU7CisJfQogCiAJYWRldi0+YWNwLmFjcF9yZXMgPSBrY2Fs
bG9jKDUsIHNpemVvZihzdHJ1Y3QgcmVzb3VyY2UpLCBHRlBfS0VSTkVMKTsKIAlpZiAoYWRldi0+
YWNwLmFjcF9yZXMgPT0gTlVMTCkgewotCQlrZnJlZShhZGV2LT5hY3AuYWNwX2NlbGwpOwotCQly
ZXR1cm4gLUVOT01FTTsKKwkJcmV0ID0gLUVOT01FTTsKKwkJZ290byBmYWlsdXJlOwogCX0KIAog
CWkyc19wZGF0YSA9IGtjYWxsb2MoMywgc2l6ZW9mKHN0cnVjdCBpMnNfcGxhdGZvcm1fZGF0YSks
IEdGUF9LRVJORUwpOwogCWlmIChpMnNfcGRhdGEgPT0gTlVMTCkgewotCQlrZnJlZShhZGV2LT5h
Y3AuYWNwX3Jlcyk7Ci0JCWtmcmVlKGFkZXYtPmFjcC5hY3BfY2VsbCk7Ci0JCXJldHVybiAtRU5P
TUVNOworCQlyZXQgPSAtRU5PTUVNOworCQlnb3RvIGZhaWx1cmU7CiAJfQogCiAJc3dpdGNoIChh
ZGV2LT5hc2ljX3R5cGUpIHsKQEAgLTM0MCwxNSArMzQxLDE4IEBAIHN0YXRpYyBpbnQgYWNwX2h3
X2luaXQodm9pZCAqaGFuZGxlKQogCiAJciA9IG1mZF9hZGRfaG90cGx1Z19kZXZpY2VzKGFkZXYt
PmFjcC5wYXJlbnQsIGFkZXYtPmFjcC5hY3BfY2VsbCwKIAkJCQkJCQkJQUNQX0RFVlMpOwotCWlm
IChyKQotCQlyZXR1cm4gcjsKKwlpZiAocikgeworCQlyZXQgPSByOworCQlnb3RvIGZhaWx1cmU7
CisJfQogCiAJZm9yIChpID0gMDsgaSA8IEFDUF9ERVZTIDsgaSsrKSB7CiAJCWRldiA9IGdldF9t
ZmRfY2VsbF9kZXYoYWRldi0+YWNwLmFjcF9jZWxsW2ldLm5hbWUsIGkpOwogCQlyID0gcG1fZ2Vu
cGRfYWRkX2RldmljZSgmYWRldi0+YWNwLmFjcF9nZW5wZC0+Z3BkLCBkZXYpOwogCQlpZiAocikg
ewogCQkJZGV2X2VycihkZXYsICJGYWlsZWQgdG8gYWRkIGRldiB0byBnZW5wZFxuIik7Ci0JCQly
ZXR1cm4gcjsKKwkJCXJldCA9IHI7CisJCQlnb3RvIGZhaWx1cmU7CiAJCX0KIAl9CiAKQEAgLTM2
Nyw3ICszNzEsOCBAQCBzdGF0aWMgaW50IGFjcF9od19pbml0KHZvaWQgKmhhbmRsZSkKIAkJCWJy
ZWFrOwogCQlpZiAoLS1jb3VudCA9PSAwKSB7CiAJCQlkZXZfZXJyKCZhZGV2LT5wZGV2LT5kZXYs
ICJGYWlsZWQgdG8gcmVzZXQgQUNQXG4iKTsKLQkJCXJldHVybiAtRVRJTUVET1VUOworCQkJcmV0
ID0gLUVUSU1FRE9VVDsKKwkJCWdvdG8gZmFpbHVyZTsKIAkJfQogCQl1ZGVsYXkoMTAwKTsKIAl9
CkBAIC0zODQsNyArMzg5LDggQEAgc3RhdGljIGludCBhY3BfaHdfaW5pdCh2b2lkICpoYW5kbGUp
CiAJCQlicmVhazsKIAkJaWYgKC0tY291bnQgPT0gMCkgewogCQkJZGV2X2VycigmYWRldi0+cGRl
di0+ZGV2LCAiRmFpbGVkIHRvIHJlc2V0IEFDUFxuIik7Ci0JCQlyZXR1cm4gLUVUSU1FRE9VVDsK
KwkJCXJldCA9IC1FVElNRURPVVQ7CisJCQlnb3RvIGZhaWx1cmU7CiAJCX0KIAkJdWRlbGF5KDEw
MCk7CiAJfQpAQCAtMzkzLDYgKzM5OSwxMyBAQCBzdGF0aWMgaW50IGFjcF9od19pbml0KHZvaWQg
KmhhbmRsZSkKIAl2YWwgJj0gfkFDUF9TT0ZUX1JFU0VUX19Tb2Z0UmVzZXRBdWRfTUFTSzsKIAlj
Z3Nfd3JpdGVfcmVnaXN0ZXIoYWRldi0+YWNwLmNnc19kZXZpY2UsIG1tQUNQX1NPRlRfUkVTRVQs
IHZhbCk7CiAJcmV0dXJuIDA7CisKK2ZhaWx1cmU6CisJa2ZyZWUoaTJzX3BkYXRhKTsKKwlrZnJl
ZShhZGV2LT5hY3AuYWNwX3Jlcyk7CisJa2ZyZWUoYWRldi0+YWNwLmFjcF9jZWxsKTsKKwlrZnJl
ZShhZGV2LT5hY3AuYWNwX2dlbnBkKTsKKwlyZXR1cm4gcmV0OwogfQogCiAvKioKLS0gCjIuMTcu
MQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRl
dmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8v
bGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
