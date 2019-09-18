Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 82DA9B743D
	for <lists+dri-devel@lfdr.de>; Thu, 19 Sep 2019 09:36:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A45676FA11;
	Thu, 19 Sep 2019 07:36:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd42.google.com (mail-io1-xd42.google.com
 [IPv6:2607:f8b0:4864:20::d42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BCAD36F929;
 Wed, 18 Sep 2019 19:05:44 +0000 (UTC)
Received: by mail-io1-xd42.google.com with SMTP id d17so1638116ios.13;
 Wed, 18 Sep 2019 12:05:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=RQSilxjATPMpO7L5/vQnnBs3bEydxYma+YlB5QOJU8U=;
 b=omOPseCQ9zCFch/48Z6+OcdOhowWrGxecdSI0mUtbQSLcBAgQmtVk34hqklSq66tdg
 Sg1rmgVKaQCK5mK9p9d5nUsUq1uEWtI4u3S1Jkug1R6azYIVnf0bgZQx0qo4TNV5vZfQ
 AGIHq+ayw0dINj8eLp+xvkY7BtOotCPqS3qT/4JPKOQVt36xsYpnh4nHxG+pUmsGsB1J
 QEX2m71dOklEkIon8hNFJdjgVEhnxyMLuhePgGCon9cdXPXkzq2uUKUmwWu2r2k3P5Xj
 KQBOplVUdcWdm6ZXEssad0HMJ4BMJtp2ljeG7EJ1ss4ROuza2us4t6asFMrE+KSWCtSy
 KCkg==
X-Gm-Message-State: APjAAAVyqbT4Q46VAcBkaW2BhICfQN1263FJY5vOzjneP99KyMdT2j4A
 dmZrnSw6z9Ttuok4HjnwLyQ=
X-Google-Smtp-Source: APXvYqzH8knGmzCb/BchfhU8WwYcB8gmZa9Y2tl3gP0Y2rEpGV7ELb7EsudkOS7JRk2eK3EFfvKVxQ==
X-Received: by 2002:a5d:9f4e:: with SMTP id u14mr7060740iot.106.1568833542230; 
 Wed, 18 Sep 2019 12:05:42 -0700 (PDT)
Received: from cs-dulles.cs.umn.edu (cs-dulles.cs.umn.edu. [128.101.35.54])
 by smtp.googlemail.com with ESMTPSA id s201sm8446830ios.83.2019.09.18.12.05.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Sep 2019 12:05:41 -0700 (PDT)
From: Navid Emamdoost <navid.emamdoost@gmail.com>
To: Christian.Koenig@amd.com
Subject: [PATCH v2] drm/amdgpu: fix multiple memory leaks
Date: Wed, 18 Sep 2019 14:05:26 -0500
Message-Id: <20190918190529.17298-1-navid.emamdoost@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <7bab24ff-ded7-9f76-ba25-efd07cdd30dd@amd.com>
References: <7bab24ff-ded7-9f76-ba25-efd07cdd30dd@amd.com>
X-Mailman-Approved-At: Thu, 19 Sep 2019 07:35:45 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=RQSilxjATPMpO7L5/vQnnBs3bEydxYma+YlB5QOJU8U=;
 b=fH/W/bytl72c1yo6ic3T73JClM0RD1+zcOzWusW39nEfIWb98Dy3nNh3bOpnmbyzNa
 Al+0Daj4pGv5Afco5DgNHMs8kQzM/+h7nEO+osniYUb+SZBHyh5IiSHLuWHEk0aT6LxK
 miTw/aYX3jHNGdAoVioD+ZqsdsejgaGe34TjP1VzeB2y9DtwDfFc8kVx7G8bqRas86GU
 91UIUblXCVULGGT4UkQf1klgMQ0aDyHzQ60Se/d10nnJiDYgjQjiWHFcS4Tb/OSZC65U
 zcCCYoFMLYWcUdb4QoL0SP6Is/f+VOGot/NF+/qLDiTvp1PZinTc4bkAgllrYGORdB0X
 RD/w==
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
Cc: David Airlie <airlied@linux.ie>, Sam Ravnborg <sam@ravnborg.org>,
 kjlu@umn.edu, linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 emamd001@umn.edu, dri-devel@lists.freedesktop.org, smccaman@umn.edu,
 Alex Deucher <alexander.deucher@amd.com>, Rex Zhu <Rex.Zhu@amd.com>,
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
dGhvc2UgYWxsb2NhdGlvbnMgc2hvdWxkIGJlIHJlbGVhc2VkIGlmIHBtX2dlbnBkX2FkZF9kZXZp
Y2UKZmFpbHMuCgp2MjogbW92ZWQgdGhlIHJlbGVhc2VkIGludG8gZ290byBlcnJvciBoYW5kbGlu
Z3MKClNpZ25lZC1vZmYtYnk6IE5hdmlkIEVtYW1kb29zdCA8bmF2aWQuZW1hbWRvb3N0QGdtYWls
LmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfYWNwLmMgfCAzMCAr
KysrKysrKysrKysrKysrKy0tLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgMjEgaW5zZXJ0aW9ucygr
KSwgOSBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdw
dS9hbWRncHVfYWNwLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfYWNwLmMK
aW5kZXggZWJhNDJjNzUyYmNhLi5jMGRiNzViNzE4NTkgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1
L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9hY3AuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Ft
ZGdwdS9hbWRncHVfYWNwLmMKQEAgLTE4NCw3ICsxODQsNyBAQCBzdGF0aWMgc3RydWN0IGRldmlj
ZSAqZ2V0X21mZF9jZWxsX2Rldihjb25zdCBjaGFyICpkZXZpY2VfbmFtZSwgaW50IHIpCiAgKi8K
IHN0YXRpYyBpbnQgYWNwX2h3X2luaXQodm9pZCAqaGFuZGxlKQogewotCWludCByLCBpOworCWlu
dCByLCBpLCByZXQ7CiAJdWludDY0X3QgYWNwX2Jhc2U7CiAJdTMyIHZhbCA9IDA7CiAJdTMyIGNv
dW50ID0gMDsKQEAgLTIzMSwyMCArMjMxLDIxIEBAIHN0YXRpYyBpbnQgYWNwX2h3X2luaXQodm9p
ZCAqaGFuZGxlKQogCWFkZXYtPmFjcC5hY3BfY2VsbCA9IGtjYWxsb2MoQUNQX0RFVlMsIHNpemVv
ZihzdHJ1Y3QgbWZkX2NlbGwpLAogCQkJCQkJCUdGUF9LRVJORUwpOwogCi0JaWYgKGFkZXYtPmFj
cC5hY3BfY2VsbCA9PSBOVUxMKQotCQlyZXR1cm4gLUVOT01FTTsKKwlpZiAoYWRldi0+YWNwLmFj
cF9jZWxsID09IE5VTEwpIHsKKwkJcmV0ID0gLUVOT01FTTsKKwkJZ290byBvdXQxOworCX0KIAog
CWFkZXYtPmFjcC5hY3BfcmVzID0ga2NhbGxvYyg1LCBzaXplb2Yoc3RydWN0IHJlc291cmNlKSwg
R0ZQX0tFUk5FTCk7CiAJaWYgKGFkZXYtPmFjcC5hY3BfcmVzID09IE5VTEwpIHsKLQkJa2ZyZWUo
YWRldi0+YWNwLmFjcF9jZWxsKTsKLQkJcmV0dXJuIC1FTk9NRU07CisJCXJldCA9IC1FTk9NRU07
CisJCWdvdG8gb3V0MjsKIAl9CiAKIAlpMnNfcGRhdGEgPSBrY2FsbG9jKDMsIHNpemVvZihzdHJ1
Y3QgaTJzX3BsYXRmb3JtX2RhdGEpLCBHRlBfS0VSTkVMKTsKIAlpZiAoaTJzX3BkYXRhID09IE5V
TEwpIHsKLQkJa2ZyZWUoYWRldi0+YWNwLmFjcF9yZXMpOwotCQlrZnJlZShhZGV2LT5hY3AuYWNw
X2NlbGwpOwotCQlyZXR1cm4gLUVOT01FTTsKKwkJcmV0ID0gLUVOT01FTTsKKwkJZ290byBvdXQz
OwogCX0KIAogCXN3aXRjaCAoYWRldi0+YXNpY190eXBlKSB7CkBAIC0zNDgsNyArMzQ5LDggQEAg
c3RhdGljIGludCBhY3BfaHdfaW5pdCh2b2lkICpoYW5kbGUpCiAJCXIgPSBwbV9nZW5wZF9hZGRf
ZGV2aWNlKCZhZGV2LT5hY3AuYWNwX2dlbnBkLT5ncGQsIGRldik7CiAJCWlmIChyKSB7CiAJCQlk
ZXZfZXJyKGRldiwgIkZhaWxlZCB0byBhZGQgZGV2IHRvIGdlbnBkXG4iKTsKLQkJCXJldHVybiBy
OworCQkJcmV0ID0gcjsKKwkJCWdvdG8gb3V0NDsKIAkJfQogCX0KIApAQCAtMzkzLDYgKzM5NSwx
NiBAQCBzdGF0aWMgaW50IGFjcF9od19pbml0KHZvaWQgKmhhbmRsZSkKIAl2YWwgJj0gfkFDUF9T
T0ZUX1JFU0VUX19Tb2Z0UmVzZXRBdWRfTUFTSzsKIAljZ3Nfd3JpdGVfcmVnaXN0ZXIoYWRldi0+
YWNwLmNnc19kZXZpY2UsIG1tQUNQX1NPRlRfUkVTRVQsIHZhbCk7CiAJcmV0dXJuIDA7CisKK291
dDQ6CisJa2ZyZWUoaTJzX3BkYXRhKTsKK291dDM6CisJa2ZyZWUoYWRldi0+YWNwLmFjcF9yZXMp
Oworb3V0MjoKKwlrZnJlZShhZGV2LT5hY3AuYWNwX2NlbGwpOworb3V0MToKKwlrZnJlZShhZGV2
LT5hY3AuYWNwX2dlbnBkKTsKKwlyZXR1cm4gcmV0OwogfQogCiAvKioKLS0gCjIuMTcuMQoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1h
aWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
