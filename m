Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BBD00820A0
	for <lists+dri-devel@lfdr.de>; Mon,  5 Aug 2019 17:46:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 67CC56E495;
	Mon,  5 Aug 2019 15:45:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D08FD6E492;
 Mon,  5 Aug 2019 15:45:57 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id f9so5985422wre.12;
 Mon, 05 Aug 2019 08:45:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=r9iyE3YOKUeG5ZizxulW4D4UK5rsERFOEpq/DiuLZko=;
 b=W4OH4rrWHtt8VnJ/1hWHz0MAt+P/xZ87cwMuevsXSfVZbSAhNpFPAWIHfbt4dc6UW4
 eKTigP7KUkHOxJ7jtWqUGI5djxwZUwLtiTaMIIcNc/ywRNtNIOiVAZI1YHpmsbI95lh4
 pETgB8dkaT3ZbtsNUDSZc+d8SNheUyeKdb6N5B5QZzh74ncaaKdqChuybFayWdGi82Ct
 qOwkSH0JGKtQemjp+sA5e5x/oC7bHUuBEANuwcrENWJeLE08/fnNFSUPYFE4RCav8R5q
 eBkvkN4+F3MquIoYSppwQFjeUow4JPXjFWttuQXjZPthASVWdpmZCrUnFV9ssAqpS7vf
 JUmg==
X-Gm-Message-State: APjAAAVPnrjRbDXpG0W5S4nau+IF2NyKIX7T2Dlt8J7Qp0F6sTVEdTUC
 Q9FQED3lzHx+Px6UuokBMwStGNiH
X-Google-Smtp-Source: APXvYqwCfN2jELpOVXfZqazfG5tJI+AkZ8uPPiqhfPSXd+Hfql7qg3WBGsEluL6UnV4wSsPytaVFDA==
X-Received: by 2002:a05:6000:14b:: with SMTP id
 r11mr11212622wrx.196.1565019956350; 
 Mon, 05 Aug 2019 08:45:56 -0700 (PDT)
Received: from abel.fritz.box ([2a02:908:1252:fb60:fdbd:6233:4990:5a8d])
 by smtp.gmail.com with ESMTPSA id 91sm171836865wrp.3.2019.08.05.08.45.55
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 05 Aug 2019 08:45:55 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: intel-gfx@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
 chris@chris-wilson.co.uk
Subject: [PATCH 1/5] drm/i915: stop pruning reservation object after wait
Date: Mon,  5 Aug 2019 17:45:50 +0200
Message-Id: <20190805154554.3476-1-christian.koenig@amd.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=r9iyE3YOKUeG5ZizxulW4D4UK5rsERFOEpq/DiuLZko=;
 b=r9V02blzsn/6sU9/5govctOIYa39rlzhhnCWUYpMiBr5RPzdlvmSKgAYjBwfpWrye3
 GIK3Z0ZsnMO+mIW7sB6C9vQSUBjvGPMf9zOz9aEj6gdIUn3pcZ/tQ0qooolgGvNZepz8
 FaPAT4RqE1dpCNs8ZzPAtC773iHBIz96czJ0t6bBJzOnt4p+Q+2D2+ZnCttlZ6+jO4Pa
 8aPnXDJe/Z0fJtACdcGBKFxrlejBuusaM+n5JrCM4ta2LG/MSd9uho9HFVxSEJa9JkTj
 yFCpY3TQfzmD8E024Pzjk7wIcO7LSPBYD8jj6yKYumTylx2nIs0rWabchkJmVBZDT81z
 1mvw==
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

VGhlIHJlc2VydmF0aW9uIG9iamVjdCBzaG91bGQgYmUgY2FwYWJsZSBvZiBoYW5kbGluZyBpdHMg
aW50ZXJuYWwgbWVtb3J5Cm1hbmFnZW1lbnQgaXRzZWxmLiBBbmQgc2luY2Ugd2Ugc2VhcmNoIGZv
ciBhIGZyZWUgc2xvdCB0byBhZGQgdGhlIGZlbmNlCmZyb20gdGhlIGJlZ2lubmluZyB0aGlzIGlz
IGFjdHVhbGx5IGEgd2FzdGUgb2YgdGltZSBhbmQgb25seSBtaW5pbWFsIGhlbHBmdWwuCgpEcm9w
IGl0IHRvIGFsbG93IHJlbW92YWwgb2YgdGhlIHNlcW5vIGhhbmRsaW5nIGluIHRoZSByZXNlcnZh
dGlvbiBvYmplY3QuCgpUaGlzIGVzc2VudGlhbGx5IHJldmVydHMgY29tbWl0ICJkcm0vaTkxNTog
UmVtb3ZlIGNvbXBsZXRlZCBmZW5jZXMgYWZ0ZXIgYSB3YWl0Ii4KClNpZ25lZC1vZmYtYnk6IENo
cmlzdGlhbiBLw7ZuaWcgPGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4KLS0tCiBkcml2ZXJzL2dw
dS9kcm0vaTkxNS9nZW0vaTkxNV9nZW1fd2FpdC5jIHwgMjcgLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tCiAxIGZpbGUgY2hhbmdlZCwgMjcgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVy
cy9ncHUvZHJtL2k5MTUvZ2VtL2k5MTVfZ2VtX3dhaXQuYyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1
L2dlbS9pOTE1X2dlbV93YWl0LmMKaW5kZXggMjZlYzY1NzliN2NkLi5iYjY0ZWM2YmVmOGUgMTAw
NjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2dlbS9pOTE1X2dlbV93YWl0LmMKKysrIGIv
ZHJpdmVycy9ncHUvZHJtL2k5MTUvZ2VtL2k5MTVfZ2VtX3dhaXQuYwpAQCAtMzUsOSArMzUsNyBA
QCBpOTE1X2dlbV9vYmplY3Rfd2FpdF9yZXNlcnZhdGlvbihzdHJ1Y3QgcmVzZXJ2YXRpb25fb2Jq
ZWN0ICpyZXN2LAogCQkJCSB1bnNpZ25lZCBpbnQgZmxhZ3MsCiAJCQkJIGxvbmcgdGltZW91dCkK
IHsKLQl1bnNpZ25lZCBpbnQgc2VxID0gX19yZWFkX3NlcWNvdW50X2JlZ2luKCZyZXN2LT5zZXEp
OwogCXN0cnVjdCBkbWFfZmVuY2UgKmV4Y2w7Ci0JYm9vbCBwcnVuZV9mZW5jZXMgPSBmYWxzZTsK
IAogCWlmIChmbGFncyAmIEk5MTVfV0FJVF9BTEwpIHsKIAkJc3RydWN0IGRtYV9mZW5jZSAqKnNo
YXJlZDsKQEAgLTYxLDE3ICs1OSw2IEBAIGk5MTVfZ2VtX29iamVjdF93YWl0X3Jlc2VydmF0aW9u
KHN0cnVjdCByZXNlcnZhdGlvbl9vYmplY3QgKnJlc3YsCiAJCWZvciAoOyBpIDwgY291bnQ7IGkr
KykKIAkJCWRtYV9mZW5jZV9wdXQoc2hhcmVkW2ldKTsKIAkJa2ZyZWUoc2hhcmVkKTsKLQotCQkv
KgotCQkgKiBJZiBib3RoIHNoYXJlZCBmZW5jZXMgYW5kIGFuIGV4Y2x1c2l2ZSBmZW5jZSBleGlz
dCwKLQkJICogdGhlbiBieSBjb25zdHJ1Y3Rpb24gdGhlIHNoYXJlZCBmZW5jZXMgbXVzdCBiZSBs
YXRlcgotCQkgKiB0aGFuIHRoZSBleGNsdXNpdmUgZmVuY2UuIElmIHdlIHN1Y2Nlc3NmdWxseSB3
YWl0IGZvcgotCQkgKiBhbGwgdGhlIHNoYXJlZCBmZW5jZXMsIHdlIGtub3cgdGhhdCB0aGUgZXhj
bHVzaXZlIGZlbmNlCi0JCSAqIG11c3QgYWxsIGJlIHNpZ25hbGVkLiBJZiBhbGwgdGhlIHNoYXJl
ZCBmZW5jZXMgYXJlCi0JCSAqIHNpZ25hbGVkLCB3ZSBjYW4gcHJ1bmUgdGhlIGFycmF5IGFuZCBy
ZWNvdmVyIHRoZQotCQkgKiBmbG9hdGluZyByZWZlcmVuY2VzIG9uIHRoZSBmZW5jZXMvcmVxdWVz
dHMuCi0JCSAqLwotCQlwcnVuZV9mZW5jZXMgPSBjb3VudCAmJiB0aW1lb3V0ID49IDA7CiAJfSBl
bHNlIHsKIAkJZXhjbCA9IHJlc2VydmF0aW9uX29iamVjdF9nZXRfZXhjbF9yY3UocmVzdik7CiAJ
fQpAQCAtODAsMjAgKzY3LDYgQEAgaTkxNV9nZW1fb2JqZWN0X3dhaXRfcmVzZXJ2YXRpb24oc3Ry
dWN0IHJlc2VydmF0aW9uX29iamVjdCAqcmVzdiwKIAkJdGltZW91dCA9IGk5MTVfZ2VtX29iamVj
dF93YWl0X2ZlbmNlKGV4Y2wsIGZsYWdzLCB0aW1lb3V0KTsKIAogCWRtYV9mZW5jZV9wdXQoZXhj
bCk7Ci0KLQkvKgotCSAqIE9wcG9ydHVuaXN0aWNhbGx5IHBydW5lIHRoZSBmZW5jZXMgaWZmIHdl
IGtub3cgdGhleSBoYXZlICphbGwqIGJlZW4KLQkgKiBzaWduYWxlZCBhbmQgdGhhdCB0aGUgcmVz
ZXJ2YXRpb24gb2JqZWN0IGhhcyBub3QgYmVlbiBjaGFuZ2VkIChpLmUuCi0JICogbm8gbmV3IGZl
bmNlcyBoYXZlIGJlZW4gYWRkZWQpLgotCSAqLwotCWlmIChwcnVuZV9mZW5jZXMgJiYgIV9fcmVh
ZF9zZXFjb3VudF9yZXRyeSgmcmVzdi0+c2VxLCBzZXEpKSB7Ci0JCWlmIChyZXNlcnZhdGlvbl9v
YmplY3RfdHJ5bG9jayhyZXN2KSkgewotCQkJaWYgKCFfX3JlYWRfc2VxY291bnRfcmV0cnkoJnJl
c3YtPnNlcSwgc2VxKSkKLQkJCQlyZXNlcnZhdGlvbl9vYmplY3RfYWRkX2V4Y2xfZmVuY2UocmVz
diwgTlVMTCk7Ci0JCQlyZXNlcnZhdGlvbl9vYmplY3RfdW5sb2NrKHJlc3YpOwotCQl9Ci0JfQot
CiAJcmV0dXJuIHRpbWVvdXQ7CiB9CiAKLS0gCjIuMTcuMQoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2
ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21h
aWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
