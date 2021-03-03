Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 40A2C32B81F
	for <lists+dri-devel@lfdr.de>; Wed,  3 Mar 2021 14:43:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 499D56E8E7;
	Wed,  3 Mar 2021 13:43:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9CAB26E8E2
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Mar 2021 13:43:39 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id j2so10883546wrx.9
 for <dri-devel@lists.freedesktop.org>; Wed, 03 Mar 2021 05:43:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Quc2kUn4zxyJwPjFnwIzGGrQHrzECWlhqtsSXbJueZc=;
 b=ZsyMPRW9QBkC/Ih85kKhmz4YGoEObQ/YxdodsqQrvvAe4BorhfF8b0CVqsxplW4lZJ
 G6nXul6/Poxd7MlR+c60M/IowDeDVmsoSNAO7/XZofVeoq0Wx+U73wYVvL9gD+ecPCTa
 SdkbYZTluzU7XVX6LBWI1Z2WYNNfuTvs9rn7OWz/Ud1K5KnZJG5i5a7fj0LIB2MJE+bT
 hsjumX83elTXdLYYw/z3vZ9IxGOtgTVucQn18omtvAXrzksJoibAz0enmNfcdvJYIrib
 YrnNGjo+6n1FULBR+nT8xa26l3ctUCgLASQSzuE9nyZNcfID+1sRyXk+z/2C9uPVOH7n
 gD5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Quc2kUn4zxyJwPjFnwIzGGrQHrzECWlhqtsSXbJueZc=;
 b=Kwc1q2EotYhHQKcoWpuLVwl3HuAi+twdftKoeqChVFoq4ApSJOjjDlYuOkEpwluqsT
 65E5NTJeLn5VpcHWYl5Yqiko2JFD5jDhTqsFwo/sea/RxUbol/TnZ/vDOQdA+mLDti37
 jZpr/By5tpZt7SElKnS/ZTTEZpiWpbEVidfjkexAZlyiamQ4GtFP+uKWx7Pm1VLCfeiE
 idlBl3YwPuf8RepTwsOHFk4SlL0QzejK++pJGj4sJbnGdx2FEzZ8vvouiphTkNUdpUOd
 sgxOLx0ZoAgRBgAsvW8+IAevGs8+QWrX5ep+4G7igiJ92ZZ9cU8HsSX5Gu4aLrVS31k7
 wyig==
X-Gm-Message-State: AOAM533PmoukJCpKGH+HSKcVOhLBlL9UgiIwkVh9wXs/I5sQWyO5f1jQ
 vdqguv75drn+hEiObSX5FDm6wA==
X-Google-Smtp-Source: ABdhPJwoS+oCFNTWZ5t67qRoR7YW69ytGqSXrSMYfn60dFtl/bMIFBBKbbS7ueU75+L9BeANFKW4gg==
X-Received: by 2002:a5d:64ac:: with SMTP id m12mr27033016wrp.138.1614779018312; 
 Wed, 03 Mar 2021 05:43:38 -0800 (PST)
Received: from dell.default ([91.110.221.155])
 by smtp.gmail.com with ESMTPSA id w18sm6109524wrr.7.2021.03.03.05.43.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Mar 2021 05:43:37 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 08/53] drm/amd/display/dc/calcs/dce_calcs: Move some large
 variables from the stack to the heap
Date: Wed,  3 Mar 2021 13:42:34 +0000
Message-Id: <20210303134319.3160762-9-lee.jones@linaro.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210303134319.3160762-1-lee.jones@linaro.org>
References: <20210303134319.3160762-1-lee.jones@linaro.org>
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
Cc: Leo Li <sunpeng.li@amd.com>, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 Colin Ian King <colin.king@canonical.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Rml4ZXMgdGhlIGZvbGxvd2luZyBXPTEga2VybmVsIGJ1aWxkIHdhcm5pbmcocyk6CgogZHJpdmVy
cy9ncHUvZHJtL2FtZC9hbWRncHUvLi4vZGlzcGxheS9kYy9jYWxjcy9kY2VfY2FsY3MuYzogSW4g
ZnVuY3Rpb24g4oCYY2FsY3VsYXRlX2JhbmR3aWR0aOKAmToKIGRyaXZlcnMvZ3B1L2RybS9hbWQv
YW1kZ3B1Ly4uL2Rpc3BsYXkvZGMvY2FsY3MvZGNlX2NhbGNzLmM6MjAxNjoxOiB3YXJuaW5nOiB0
aGUgZnJhbWUgc2l6ZSBvZiAxMjE2IGJ5dGVzIGlzIGxhcmdlciB0aGFuIDEwMjQgYnl0ZXMgWy1X
ZnJhbWUtbGFyZ2VyLXRoYW49XQoKQ2M6IEhhcnJ5IFdlbnRsYW5kIDxoYXJyeS53ZW50bGFuZEBh
bWQuY29tPgpDYzogTGVvIExpIDxzdW5wZW5nLmxpQGFtZC5jb20+CkNjOiBBbGV4IERldWNoZXIg
PGFsZXhhbmRlci5kZXVjaGVyQGFtZC5jb20+CkNjOiAiQ2hyaXN0aWFuIEvDtm5pZyIgPGNocmlz
dGlhbi5rb2VuaWdAYW1kLmNvbT4KQ2M6IERhdmlkIEFpcmxpZSA8YWlybGllZEBsaW51eC5pZT4K
Q2M6IERhbmllbCBWZXR0ZXIgPGRhbmllbEBmZndsbC5jaD4KQ2M6IENvbGluIElhbiBLaW5nIDxj
b2xpbi5raW5nQGNhbm9uaWNhbC5jb20+CkNjOiBhbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9y
ZwpDYzogZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpTaWduZWQtb2ZmLWJ5OiBMZWUg
Sm9uZXMgPGxlZS5qb25lc0BsaW5hcm8ub3JnPgotLS0KIC4uLi9ncHUvZHJtL2FtZC9kaXNwbGF5
L2RjL2NhbGNzL2RjZV9jYWxjcy5jICB8IDI5ICsrKysrKysrKysrKysrKystLS0KIDEgZmlsZSBj
aGFuZ2VkLCAyNSBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9jYWxjcy9kY2VfY2FsY3MuYyBiL2RyaXZlcnMv
Z3B1L2RybS9hbWQvZGlzcGxheS9kYy9jYWxjcy9kY2VfY2FsY3MuYwppbmRleCBlNjMzZjhhNTFl
ZGI2Li40ZjA0NzRhM2JiY2FkIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3Bs
YXkvZGMvY2FsY3MvZGNlX2NhbGNzLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5
L2RjL2NhbGNzL2RjZV9jYWxjcy5jCkBAIC05OCwxNiArOTgsMTYgQEAgc3RhdGljIHZvaWQgY2Fs
Y3VsYXRlX2JhbmR3aWR0aCgKIAlpbnQzMl90IG51bV9jdXJzb3JfbGluZXM7CiAKIAlpbnQzMl90
IGksIGosIGs7Ci0Jc3RydWN0IGJ3X2ZpeGVkIHljbGtbM107Ci0Jc3RydWN0IGJ3X2ZpeGVkIHNj
bGtbOF07CisJc3RydWN0IGJ3X2ZpeGVkICp5Y2xrOworCXN0cnVjdCBid19maXhlZCAqc2NsazsK
IAlib29sIGQwX3VuZGVybGF5X2VuYWJsZTsKIAlib29sIGQxX3VuZGVybGF5X2VuYWJsZTsKIAli
b29sIGZiY19lbmFibGVkOwogCWJvb2wgbHB0X2VuYWJsZWQ7CiAJZW51bSBid19kZWZpbmVzIHNj
bGtfbWVzc2FnZTsKIAllbnVtIGJ3X2RlZmluZXMgeWNsa19tZXNzYWdlOwotCWVudW0gYndfZGVm
aW5lcyB0aWxpbmdfbW9kZVttYXhpbXVtX251bWJlcl9vZl9zdXJmYWNlc107Ci0JZW51bSBid19k
ZWZpbmVzIHN1cmZhY2VfdHlwZVttYXhpbXVtX251bWJlcl9vZl9zdXJmYWNlc107CisJZW51bSBi
d19kZWZpbmVzICp0aWxpbmdfbW9kZTsKKwllbnVtIGJ3X2RlZmluZXMgKnN1cmZhY2VfdHlwZTsK
IAllbnVtIGJ3X2RlZmluZXMgdm9sdGFnZTsKIAllbnVtIGJ3X2RlZmluZXMgcGlwZV9jaGVjazsK
IAllbnVtIGJ3X2RlZmluZXMgaHNyX2NoZWNrOwpAQCAtMTIyLDYgKzEyMiwyMiBAQCBzdGF0aWMg
dm9pZCBjYWxjdWxhdGVfYmFuZHdpZHRoKAogCWludDMyX3QgbnVtYmVyX29mX2Rpc3BsYXlzX2Vu
YWJsZWRfd2l0aF9tYXJnaW4gPSAwOwogCWludDMyX3QgbnVtYmVyX29mX2FsaWduZWRfZGlzcGxh
eXNfd2l0aF9ub19tYXJnaW4gPSAwOwogCisJeWNsayA9IGtjYWxsb2MoMywgc2l6ZW9mKCp5Y2xr
KSwgR0ZQX0tFUk5FTCk7CisJaWYgKCF5Y2xrKQorCQlyZXR1cm47CisKKwlzY2xrID0ga2NhbGxv
Yyg4LCBzaXplb2YoKnNjbGspLCBHRlBfS0VSTkVMKTsKKwlpZiAoIXNjbGspCisJCXJldHVybjsK
KworCXRpbGluZ19tb2RlID0ga2NhbGxvYyhtYXhpbXVtX251bWJlcl9vZl9zdXJmYWNlcywgc2l6
ZW9mKCp0aWxpbmdfbW9kZSksIEdGUF9LRVJORUwpOworCWlmICghdGlsaW5nX21vZGUpCisJCXJl
dHVybjsKKworCXN1cmZhY2VfdHlwZSA9IGtjYWxsb2MobWF4aW11bV9udW1iZXJfb2Zfc3VyZmFj
ZXMsIHNpemVvZigqc3VyZmFjZV90eXBlKSwgR0ZQX0tFUk5FTCk7CisJaWYgKCFzdXJmYWNlX3R5
cGUpCisJCXJldHVybjsKKwogCXljbGtbbG93XSA9IHZiaW9zLT5sb3dfeWNsazsKIAl5Y2xrW21p
ZF0gPSB2Ymlvcy0+bWlkX3ljbGs7CiAJeWNsa1toaWdoXSA9IHZiaW9zLT5oaWdoX3ljbGs7CkBA
IC0yMDEzLDYgKzIwMjksMTEgQEAgc3RhdGljIHZvaWQgY2FsY3VsYXRlX2JhbmR3aWR0aCgKIAkJ
CX0KIAkJfQogCX0KKworCWtmcmVlKHRpbGluZ19tb2RlKTsKKwlrZnJlZShzdXJmYWNlX3R5cGUp
OworCWtmcmVlKHljbGspOworCWtmcmVlKHNjbGspOwogfQogCiAvKioqKioqKioqKioqKioqKioq
KioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioq
KioqKgotLSAKMi4yNy4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmkt
ZGV2ZWwK
