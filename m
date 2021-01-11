Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 998F72F1EDF
	for <lists+dri-devel@lfdr.de>; Mon, 11 Jan 2021 20:20:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7000289DFE;
	Mon, 11 Jan 2021 19:19:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B224B89E0E
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Jan 2021 19:19:48 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id k10so243504wmi.3
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Jan 2021 11:19:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=bXFKZa9JjVse7+5giwTOAXSXYikkRKBfRN4TR1AbnV8=;
 b=Q9535ah1toYRZ7VlqwLDBDjQYfMfUYLA55rRtLkTMCTwmD5CzFWXNAVjehFjlap/TL
 MXSD01bPe7YrIvBgydU8YLuFUEqZ0AUoo9ikS76apFToPKRioQgaXnbjyXRMB6nmGgKc
 NPwBpeK8MR1KnLKTEwtKy+UfcL+uJZNqwVSZ4xfIVKlrLD7FPEYfSVjb4lVfdGbNE1wE
 1XmsAJ+oNGYUbrm0kZTvO54T9yVqRnP8byP30PPfSuDZAiBewofkUpEO3ALMw4QF5SJa
 IYHVmBt/aHbAefEsRw7Ge8rYYH+nSYIfdVy3gs+idI7Ae/0qvaiW45i+HoUqcEzaFlKb
 w+zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=bXFKZa9JjVse7+5giwTOAXSXYikkRKBfRN4TR1AbnV8=;
 b=ezCjb2hlZqpnUEr/vj56joIMaaEOJ2mqj5MV4WtQj8xF5HFhV20EUWf+oCWJySFk/a
 +FB5Q/+v8DcXUW5ZdYsPglZsESrrWMh+4jsxkzWCVRMib9S9Ncy4b3MXNkTzyvGqPx3T
 7Yfh4naJenPngTNcPlgYq6TY4GvDoJ0HXIlI5w5AOAgvcIfhvGBWmVgqhf6SXMUtLrqS
 p7JbpcddyHNXJcJrQigUEuzf4vVkAXtn5FcqtukKhqvjzJEUqmShfuwNDctoGINLWUFG
 PL6aibORnfWSbI+v28H+YqpInR+7fQ283DiB1jbOI6mP+TNB7fsG5ByeiJsE0QWN9kX3
 lc5w==
X-Gm-Message-State: AOAM531tRo7FB5IjQdseUWcpR7Z7biJTJjdncKTyYxr2UnXqPyEinxsT
 UFDNBp/BJodHiDDkfAhpzMZFnA==
X-Google-Smtp-Source: ABdhPJztYQkuCVcTKJHKAb8YIg6UUqhAqQg50fyXnz/xR2qnfE6mLbt8/fD3cfvLlHesR1meF5lx5w==
X-Received: by 2002:a1c:a1c1:: with SMTP id k184mr260298wme.101.1610392787408; 
 Mon, 11 Jan 2021 11:19:47 -0800 (PST)
Received: from dell.default ([91.110.221.229])
 by smtp.gmail.com with ESMTPSA id n3sm778090wrw.61.2021.01.11.11.19.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Jan 2021 11:19:46 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 13/40] drm/amd/display/dc/calcs/dce_calcs: Move some large
 variables from the stack to the heap
Date: Mon, 11 Jan 2021 19:18:59 +0000
Message-Id: <20210111191926.3688443-14-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210111191926.3688443-1-lee.jones@linaro.org>
References: <20210111191926.3688443-1-lee.jones@linaro.org>
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
L2RjL2NhbGNzL2RjZV9jYWxjcy5jICB8IDIxICsrKysrKysrKysrKysrKy0tLS0KIDEgZmlsZSBj
aGFuZ2VkLCAxNyBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9jYWxjcy9kY2VfY2FsY3MuYyBiL2RyaXZlcnMv
Z3B1L2RybS9hbWQvZGlzcGxheS9kYy9jYWxjcy9kY2VfY2FsY3MuYwppbmRleCAxNThkOTI3YzAz
ZTU1Li5hMGM2OWZhZTQwY2VkIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3Bs
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
IAllbnVtIGJ3X2RlZmluZXMgaHNyX2NoZWNrOwpAQCAtMTIyLDYgKzEyMiwxNCBAQCBzdGF0aWMg
dm9pZCBjYWxjdWxhdGVfYmFuZHdpZHRoKAogCWludDMyX3QgbnVtYmVyX29mX2Rpc3BsYXlzX2Vu
YWJsZWRfd2l0aF9tYXJnaW4gPSAwOwogCWludDMyX3QgbnVtYmVyX29mX2FsaWduZWRfZGlzcGxh
eXNfd2l0aF9ub19tYXJnaW4gPSAwOwogCisJeWNsayA9IGt6YWxsb2Moc2l6ZW9mKCp5Y2xrKSAq
IDMsIEdGUF9LRVJORUwpOworCXNjbGsgPSBremFsbG9jKHNpemVvZigqc2NsaykgKiA4LCBHRlBf
S0VSTkVMKTsKKworCXRpbGluZ19tb2RlID0ga3phbGxvYyhzaXplb2YoKnRpbGluZ19tb2RlKSAq
CisJCQkgICAgICBtYXhpbXVtX251bWJlcl9vZl9zdXJmYWNlcywgR0ZQX0tFUk5FTCk7CisJc3Vy
ZmFjZV90eXBlID0ga3phbGxvYyhzaXplb2YoKnN1cmZhY2VfdHlwZSkgKgorCQkJICAgICAgIG1h
eGltdW1fbnVtYmVyX29mX3N1cmZhY2VzLCBHRlBfS0VSTkVMKTsKKwogCXljbGtbbG93XSA9IHZi
aW9zLT5sb3dfeWNsazsKIAl5Y2xrW21pZF0gPSB2Ymlvcy0+bWlkX3ljbGs7CiAJeWNsa1toaWdo
XSA9IHZiaW9zLT5oaWdoX3ljbGs7CkBAIC0yMDEzLDYgKzIwMjEsMTEgQEAgc3RhdGljIHZvaWQg
Y2FsY3VsYXRlX2JhbmR3aWR0aCgKIAkJCX0KIAkJfQogCX0KKworCWtmcmVlKHRpbGluZ19tb2Rl
KTsKKwlrZnJlZShzdXJmYWNlX3R5cGUpOworCWtmcmVlKHljbGspOworCWtmcmVlKHNjbGspOwog
fQogCiAvKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioq
KioqKioqKioqKioqKioqKioqKioqKioqKioqKgotLSAKMi4yNS4xCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRy
aS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5v
cmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
