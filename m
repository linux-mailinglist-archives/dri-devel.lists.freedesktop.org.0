Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6501134174F
	for <lists+dri-devel@lfdr.de>; Fri, 19 Mar 2021 09:24:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B5AA26E9A4;
	Fri, 19 Mar 2021 08:24:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [IPv6:2a00:1450:4864:20::62c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F4A56E42C
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Mar 2021 08:24:39 +0000 (UTC)
Received: by mail-ej1-x62c.google.com with SMTP id t18so8255839ejc.13
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Mar 2021 01:24:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Ef573ga7uPK4RT11JA+ndmyIfMn9BA+VJVp6MRgehP8=;
 b=dMHEsAJifnq9SaoiVy6a4jAv6q5TgWHN0bw6c6p3hNz495FrJQDoE9OcCaF22eFfWM
 Y271i2mpcSMboBFlLIBl0HPweJHQ9jYdxFp5oFiuxwtfjnf6q/kbycrsC8IFNA4kC4cF
 m0XAxOa8plu+zF0uFSTocoWXQ9K9Q2WcmWW7Xq3ZqXEkPtXxW5XulFE0GhOsikSqMZM+
 sVC7XhxYnKZ2UGxJTo2kCE/42j7NpETrP4WatfhcT9v2OIHbCChuRqGsPRueln8Tcfwd
 0PoQFgtpj8igf0PkSn56Xbc4kWtZl+VsTMZTz1wsXRo/UVdvlFTnVNOIO0Qkok15BohC
 tTFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Ef573ga7uPK4RT11JA+ndmyIfMn9BA+VJVp6MRgehP8=;
 b=MgsayXa/SXu4PXt6rVSFLO5dwpaB/+YlXZvh8TB+gCpKwrXjY4T3Ff8K7pXEoKdgak
 /CY5fmydpgCoVDSk+HuFRuWW7ydU7Dqg+KAfNQH/j8+7zbkROt7SgPa+i7oNRDFmOrF6
 6LhH5NL5aCw7ma142zEKBf7X5OjfjWRgEBIx2ndcENwA/dZNdKEjCCHGRr64HMqJjg4I
 Wbeans4M9sVCIGKOQ0pgsiNRAqJqbDjmmLEuGKns6iLy0lFx0SmGhRJoAoJhYw1r+67d
 tw1oyTO+ehcDxugE+WQBFKgSzkW3yax9D564a1m1zluJjacKfNOQA9lqmAkCtOBIozjK
 KCWQ==
X-Gm-Message-State: AOAM533q+LQfJqELkBkFpY6Q2MDze8aSJV+GNvNGKU47wMkG+AZ9vUKf
 +cTZKpg3rW/U/7CJUeVbImMVPg==
X-Google-Smtp-Source: ABdhPJxdXVbdpgPImlGPZFJsAxubAlxjpG/iiUI8Oy7R25y473Q7mKlKgIPTVMWOSyzTGqHj8qZ/Mg==
X-Received: by 2002:a17:906:400b:: with SMTP id
 v11mr2984223ejj.194.1616142278182; 
 Fri, 19 Mar 2021 01:24:38 -0700 (PDT)
Received: from dell.default ([91.110.221.194])
 by smtp.gmail.com with ESMTPSA id b18sm3273727ejb.77.2021.03.19.01.24.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Mar 2021 01:24:37 -0700 (PDT)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 06/19] drm/amd/display/dc/calcs/dce_calcs: Move some large
 variables from the stack to the heap
Date: Fri, 19 Mar 2021 08:24:15 +0000
Message-Id: <20210319082428.3294591-7-lee.jones@linaro.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210319082428.3294591-1-lee.jones@linaro.org>
References: <20210319082428.3294591-1-lee.jones@linaro.org>
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
L2RjL2NhbGNzL2RjZV9jYWxjcy5jICB8IDMyICsrKysrKysrKysrKysrKystLS0KIDEgZmlsZSBj
aGFuZ2VkLCAyOCBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9jYWxjcy9kY2VfY2FsY3MuYyBiL2RyaXZlcnMv
Z3B1L2RybS9hbWQvZGlzcGxheS9kYy9jYWxjcy9kY2VfY2FsY3MuYwppbmRleCBlNjMzZjhhNTFl
ZGI2Li45ZDhmMjUwNWE2MWMyIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3Bs
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
Yyg4LCBzaXplb2YoKnNjbGspLCBHRlBfS0VSTkVMKTsKKwlpZiAoIXNjbGspCisJCWdvdG8gZnJl
ZV95Y2xrOworCisJdGlsaW5nX21vZGUgPSBrY2FsbG9jKG1heGltdW1fbnVtYmVyX29mX3N1cmZh
Y2VzLCBzaXplb2YoKnRpbGluZ19tb2RlKSwgR0ZQX0tFUk5FTCk7CisJaWYgKCF0aWxpbmdfbW9k
ZSkKKwkJZ290byBmcmVlX3NjbGs7CisKKwlzdXJmYWNlX3R5cGUgPSBrY2FsbG9jKG1heGltdW1f
bnVtYmVyX29mX3N1cmZhY2VzLCBzaXplb2YoKnN1cmZhY2VfdHlwZSksIEdGUF9LRVJORUwpOwor
CWlmICghc3VyZmFjZV90eXBlKQorCQlnb3RvIGZyZWVfdGlsaW5nX21vZGU7CisKIAl5Y2xrW2xv
d10gPSB2Ymlvcy0+bG93X3ljbGs7CiAJeWNsa1ttaWRdID0gdmJpb3MtPm1pZF95Y2xrOwogCXlj
bGtbaGlnaF0gPSB2Ymlvcy0+aGlnaF95Y2xrOwpAQCAtMjAxMyw2ICsyMDI5LDE0IEBAIHN0YXRp
YyB2b2lkIGNhbGN1bGF0ZV9iYW5kd2lkdGgoCiAJCQl9CiAJCX0KIAl9CisKKwlrZnJlZShzdXJm
YWNlX3R5cGUpOworZnJlZV90aWxpbmdfbW9kZToKKwlrZnJlZSh0aWxpbmdfbW9kZSk7CitmcmVl
X3ljbGs6CisJa2ZyZWUoeWNsayk7CitmcmVlX3NjbGs6CisJa2ZyZWUoc2Nsayk7CiB9CiAKIC8q
KioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioq
KioqKioqKioqKioqKioqKioqKioqCi0tIAoyLjI3LjAKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVs
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
