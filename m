Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B95B72F45CA
	for <lists+dri-devel@lfdr.de>; Wed, 13 Jan 2021 09:08:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD6F66E061;
	Wed, 13 Jan 2021 08:08:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E1CB6E06D
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Jan 2021 08:08:19 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id r4so708461wmh.5
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Jan 2021 00:08:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=UzSVTfnGeF4QxtWxeHYTIcFMIY4s6ebauA3+cdnRC38=;
 b=TY9K9YP3KeN4jJ31pGivkq0dF1YT54ldZJqLn6MYgdukuVkCp1zu+y0mPY6lahL/cy
 1RZcx437IV0+wAEUKVyLgcGDYpTDNEL1Ppn0vXUncrWgNbXQ1NAXE1SAV8ys9N81RnYq
 L80CoeEUDBznRtSXNf5aVJiLBgu/M3NW5YWML2KRwTpalTbHmI2lrvEOUNFIZGcJmyVN
 AN22iAp7L+Z2f5Prz8MYydOsJDYBrFjKJ6ueQI3EeMHXH6x5NltDhYkzPnWAsnjVgG1m
 3f+UnLYOmmG+9ZtdtXLtJus/mi94hGo7N9uqHpmNiDUIXrk0xJ0Ap+OMgc5sowuOA4BC
 Xa9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=UzSVTfnGeF4QxtWxeHYTIcFMIY4s6ebauA3+cdnRC38=;
 b=Wlxq7uSDxJD1uUnWOkeB3ijvJGS7qTB5tNsmOv55TBxVF4mUaFoNf6ZL33sApfJyUx
 dpphNPCZVkeoOhV7JC8nBCA1vQ1IKDp5V1rtXuycNZmxhS1vQCekjqbsjltEAzAT73t4
 ydG1sMRQSOElmdUjqgutF3bph5eYb4jazIIrg+9L/1EjITUp9cxw5/cxcsJOirYJxq+r
 Eh6/hBAvKj2o0RIhqf0YJGxR3opdLtCdZtYSrvo0vB0aNcgJMQhYItZwMJY9E1nD8/Y/
 Wv4Yml0euzqrdozfVQfJ1vn8WBjpbdjb7omqrQ/ubZNTu70p87PJwnGpVUhIp2o3W3uL
 4SuQ==
X-Gm-Message-State: AOAM532pa7xuKDhxn7PDrlmXXxkaiA0G6bjMBu2v/85K4gH8IcEMXILa
 szcHT3gqcHWHENlkK/BjHvSz0XX3aHcpi4KR
X-Google-Smtp-Source: ABdhPJysnmI+q/9hcXh4YnGhQ3w5WlvU1D7CpFhRu8UDUu/rw7x3VueRmXRn3MgpQ7OuewfpCDNVGg==
X-Received: by 2002:a1c:9d8b:: with SMTP id g133mr939751wme.189.1610525298154; 
 Wed, 13 Jan 2021 00:08:18 -0800 (PST)
Received: from dell.default ([91.110.221.229])
 by smtp.gmail.com with ESMTPSA id r20sm1642486wmh.15.2021.01.13.00.08.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Jan 2021 00:08:17 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 18/30] drm/amd/display/dc/core/dc_link: Move some local data
 from the stack to the heap
Date: Wed, 13 Jan 2021 08:07:40 +0000
Message-Id: <20210113080752.1003793-19-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210113080752.1003793-1-lee.jones@linaro.org>
References: <20210113080752.1003793-1-lee.jones@linaro.org>
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
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Rml4ZXMgdGhlIGZvbGxvd2luZyBXPTEga2VybmVsIGJ1aWxkIHdhcm5pbmcocyk6CgogZHJpdmVy
cy9ncHUvZHJtL2FtZC9hbWRncHUvLi4vZGlzcGxheS9kYy9jb3JlL2RjX2xpbmsuYzogSW4gZnVu
Y3Rpb24g4oCYZGNfbGlua19jb25zdHJ1Y3TigJk6CiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdw
dS8uLi9kaXNwbGF5L2RjL2NvcmUvZGNfbGluay5jOjE1ODg6MTogd2FybmluZzogdGhlIGZyYW1l
IHNpemUgb2YgMTE3NiBieXRlcyBpcyBsYXJnZXIgdGhhbiAxMDI0IGJ5dGVzIFstV2ZyYW1lLWxh
cmdlci10aGFuPV0KCkNjOiBIYXJyeSBXZW50bGFuZCA8aGFycnkud2VudGxhbmRAYW1kLmNvbT4K
Q2M6IExlbyBMaSA8c3VucGVuZy5saUBhbWQuY29tPgpDYzogQWxleCBEZXVjaGVyIDxhbGV4YW5k
ZXIuZGV1Y2hlckBhbWQuY29tPgpDYzogIkNocmlzdGlhbiBLw7ZuaWciIDxjaHJpc3RpYW4ua29l
bmlnQGFtZC5jb20+CkNjOiBEYXZpZCBBaXJsaWUgPGFpcmxpZWRAbGludXguaWU+CkNjOiBEYW5p
ZWwgVmV0dGVyIDxkYW5pZWxAZmZ3bGwuY2g+CkNjOiBhbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZwpDYzogZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpTaWduZWQtb2ZmLWJ5OiBM
ZWUgSm9uZXMgPGxlZS5qb25lc0BsaW5hcm8ub3JnPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQv
ZGlzcGxheS9kYy9jb3JlL2RjX2xpbmsuYyB8IDEyICsrKysrKysrKy0tLQogMSBmaWxlIGNoYW5n
ZWQsIDkgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJz
L2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvY29yZS9kY19saW5rLmMgYi9kcml2ZXJzL2dwdS9kcm0v
YW1kL2Rpc3BsYXkvZGMvY29yZS9kY19saW5rLmMKaW5kZXggOGNjZGE4YjlhYzJlYi4uMzM2NmE0
OWYxMWRjNyAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2NvcmUv
ZGNfbGluay5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9jb3JlL2RjX2xp
bmsuYwpAQCAtMTM2NCwxMyArMTM2NCwxNyBAQCBzdGF0aWMgYm9vbCBkY19saW5rX2NvbnN0cnVj
dChzdHJ1Y3QgZGNfbGluayAqbGluaywKIAlzdHJ1Y3QgZGNfY29udGV4dCAqZGNfY3R4ID0gaW5p
dF9wYXJhbXMtPmN0eDsKIAlzdHJ1Y3QgZW5jb2Rlcl9pbml0X2RhdGEgZW5jX2luaXRfZGF0YSA9
IHsgMCB9OwogCXN0cnVjdCBwYW5lbF9jbnRsX2luaXRfZGF0YSBwYW5lbF9jbnRsX2luaXRfZGF0
YSA9IHsgMCB9OwotCXN0cnVjdCBpbnRlZ3JhdGVkX2luZm8gaW5mbyA9IHt7eyAwIH19fTsKKwlz
dHJ1Y3QgaW50ZWdyYXRlZF9pbmZvICppbmZvOwogCXN0cnVjdCBkY19iaW9zICpiaW9zID0gaW5p
dF9wYXJhbXMtPmRjLT5jdHgtPmRjX2Jpb3M7CiAJY29uc3Qgc3RydWN0IGRjX3ZiaW9zX2Z1bmNz
ICpicF9mdW5jcyA9IGJpb3MtPmZ1bmNzOwogCXN0cnVjdCBicF9kaXNwX2Nvbm5lY3Rvcl9jYXBz
X2luZm8gZGlzcF9jb25uZWN0X2NhcHNfaW5mbyA9IHsgMCB9OwogCiAJRENfTE9HR0VSX0lOSVQo
ZGNfY3R4LT5sb2dnZXIpOwogCisJaW5mbyA9IGt6YWxsb2Moc2l6ZW9mKGluZm8pLCBHRlBfS0VS
TkVMKTsKKwlpZiAoIWluZm8pCisJCWdvdG8gY3JlYXRlX2ZhaWw7CisKIAlsaW5rLT5pcnFfc291
cmNlX2hwZCA9IERDX0lSUV9TT1VSQ0VfSU5WQUxJRDsKIAlsaW5rLT5pcnFfc291cmNlX2hwZF9y
eCA9IERDX0lSUV9TT1VSQ0VfSU5WQUxJRDsKIApAQCAtMTUzMiwxMiArMTUzNiwxMiBAQCBzdGF0
aWMgYm9vbCBkY19saW5rX2NvbnN0cnVjdChzdHJ1Y3QgZGNfbGluayAqbGluaywKIAl9CiAKIAlp
ZiAoYmlvcy0+aW50ZWdyYXRlZF9pbmZvKQotCQlpbmZvID0gKmJpb3MtPmludGVncmF0ZWRfaW5m
bzsKKwkJbWVtY3B5KGluZm8sIGJpb3MtPmludGVncmF0ZWRfaW5mbywgc2l6ZW9mKCppbmZvKSk7
CiAKIAkvKiBMb29rIGZvciBjaGFubmVsIG1hcHBpbmcgY29ycmVzcG9uZGluZyB0byBjb25uZWN0
b3IgYW5kIGRldmljZSB0YWcgKi8KIAlmb3IgKGkgPSAwOyBpIDwgTUFYX05VTUJFUl9PRl9FWFRf
RElTUExBWV9QQVRIOyBpKyspIHsKIAkJc3RydWN0IGV4dGVybmFsX2Rpc3BsYXlfcGF0aCAqcGF0
aCA9Ci0JCQkmaW5mby5leHRfZGlzcF9jb25uX2luZm8ucGF0aFtpXTsKKwkJCSZpbmZvLT5leHRf
ZGlzcF9jb25uX2luZm8ucGF0aFtpXTsKIAogCQlpZiAocGF0aC0+ZGV2aWNlX2Nvbm5lY3Rvcl9p
ZC5lbnVtX2lkID09IGxpbmstPmxpbmtfaWQuZW51bV9pZCAmJgogCQkgICAgcGF0aC0+ZGV2aWNl
X2Nvbm5lY3Rvcl9pZC5pZCA9PSBsaW5rLT5saW5rX2lkLmlkICYmCkBAIC0xNTg0LDYgKzE1ODgs
OCBAQCBzdGF0aWMgYm9vbCBkY19saW5rX2NvbnN0cnVjdChzdHJ1Y3QgZGNfbGluayAqbGluaywK
IAkJbGluay0+aHBkX2dwaW8gPSBOVUxMOwogCX0KIAorCWtmcmVlKGluZm8pOworCiAJcmV0dXJu
IGZhbHNlOwogfQogCi0tIAoyLjI1LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2RyaS1kZXZlbAo=
