Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A9AE6E7187
	for <lists+dri-devel@lfdr.de>; Mon, 28 Oct 2019 13:37:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B1626E843;
	Mon, 28 Oct 2019 12:37:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D5C16E82B
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Oct 2019 12:37:33 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id n1so2245285wra.10
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Oct 2019 05:37:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=eD/3jzkhTttili1L+hDnKUUTcpzreCksFu7kaZ3nllc=;
 b=IrZgwdcvmV+EeHozkaBMOzDmdAc7Q4tgmjCiCR2l9tHDqbMQlU3IIldwl19jSZPMYk
 294Y0TVct8VvI8ZgI595YlMPDKvnB7feGIFrQS5LP7yn3Ruz+rird8HFtVixW0NpA9/b
 MB0m05c6G+Js0dRUSsUxZslo2XpsCc1YOy4ajD0Bi3u6rUDpDkswcNt43IIawL88jj/Y
 iaxmnlD/AH9Gud26QcC7gRMf6e3jDbfz29Ajdr8EyZd9TAgqkSTIjCOrJ/xyctsW53dG
 SS26KjpAF8x2lggQ7MCmVxZrktU+fKf9mopW3oibfGkX5YXgx7RcixpIfjbmazlYj/s+
 EbtQ==
X-Gm-Message-State: APjAAAVjeqUzw8Evumk4rtGW3XzYhyj4HNWIXBQPGff51agNfKzH6V+Z
 4v1Fbxm5kPd1nVY1ohwY6HU=
X-Google-Smtp-Source: APXvYqxJ5QBDdZwav0OKxoV+O0v7Le3RgZKyUoXTyLkXOi/tNWCgpHygWnpuqOrodFLzq79/6dt0cQ==
X-Received: by 2002:a5d:6b0e:: with SMTP id v14mr14576420wrw.280.1572266251823; 
 Mon, 28 Oct 2019 05:37:31 -0700 (PDT)
Received: from localhost (p2E5BE2CE.dip0.t-ipconnect.de. [46.91.226.206])
 by smtp.gmail.com with ESMTPSA id 12sm12290850wmk.13.2019.10.28.05.37.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Oct 2019 05:37:30 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH 05/12] gpu: host1x: Add direction flags to relocations
Date: Mon, 28 Oct 2019 13:37:11 +0100
Message-Id: <20191028123718.3890217-6-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191028123718.3890217-1-thierry.reding@gmail.com>
References: <20191028123718.3890217-1-thierry.reding@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=eD/3jzkhTttili1L+hDnKUUTcpzreCksFu7kaZ3nllc=;
 b=isl9SFetQ6uOtfd80K61+4EPWD8j7L9JcGCZc82nzVQm6CPSIHQRI2yGIbG5E/6SBk
 yERgD2OTnpMMGK4/d827BFzOocROI6zzASDv4tieJxYqDbJW5LRs+M/T11kuTnYnXuav
 EKLJZwoCkDQHy7nXEMyPBxcg+OboLtPg8YG9DK0tWaFtkhD7lrPHYPHE5xHzXgXjjqHh
 xxzbmxwZD9OATZa41ioak2XZGX6lm8cYPRgw/TBS4ha8obH78XN/Saqbm06+0ZK8df8E
 VwFYnooU5ONhF0lBEy2KQKfcZyhrZoginl47EfbxrR/LSUyeV5Aus94gNHYGdj/xz/ER
 tfuQ==
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
Cc: linux-tegra@vger.kernel.org, Sachin Nikam <snikam@nvidia.com>,
 dri-devel@lists.freedesktop.org, Puneet Saxena <puneets@nvidia.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogVGhpZXJyeSBSZWRpbmcgPHRyZWRpbmdAbnZpZGlhLmNvbT4KCkFkZCBkaXJlY3Rpb24g
ZmxhZ3MgdG8gaG9zdDF4IHJlbG9jYXRpb25zIHBlcmZvcm1lZCBkdXJpbmcgam9iIHBpbm5pbmcu
ClRoZXNlIGZsYWdzIGluZGljYXRlIHRoZSBraW5kcyBvZiBhY2Nlc3NlcyB0aGF0IGhhcmR3YXJl
IGlzIGFsbG93ZWQgdG8KcGVyZm9ybSBvbiB0aGUgcmVsb2NhdGVkIGJ1ZmZlcnMuCgpTaWduZWQt
b2ZmLWJ5OiBUaGllcnJ5IFJlZGluZyA8dHJlZGluZ0BudmlkaWEuY29tPgotLS0KIGRyaXZlcnMv
Z3B1L2RybS90ZWdyYS9kcm0uYyB8IDIgKysKIGluY2x1ZGUvbGludXgvaG9zdDF4LmggICAgICB8
IDQgKysrKwogMiBmaWxlcyBjaGFuZ2VkLCA2IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9k
cml2ZXJzL2dwdS9kcm0vdGVncmEvZHJtLmMgYi9kcml2ZXJzL2dwdS9kcm0vdGVncmEvZHJtLmMK
aW5kZXggOWExYzE2OTQ2MDRhLi5lZmM4YTI3YjllNmEgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1
L2RybS90ZWdyYS9kcm0uYworKysgYi9kcml2ZXJzL2dwdS9kcm0vdGVncmEvZHJtLmMKQEAgLTE0
OSw2ICsxNDksOCBAQCBzdGF0aWMgaW50IGhvc3QxeF9yZWxvY19jb3B5X2Zyb21fdXNlcihzdHJ1
Y3QgaG9zdDF4X3JlbG9jICpkZXN0LAogCWlmIChlcnIgPCAwKQogCQlyZXR1cm4gZXJyOwogCisJ
ZGVzdC0+ZmxhZ3MgPSBIT1NUMVhfUkVMT0NfUkVBRCB8IEhPU1QxWF9SRUxPQ19XUklURTsKKwog
CWRlc3QtPmNtZGJ1Zi5ibyA9IGhvc3QxeF9ib19sb29rdXAoZmlsZSwgY21kYnVmKTsKIAlpZiAo
IWRlc3QtPmNtZGJ1Zi5ibykKIAkJcmV0dXJuIC1FTk9FTlQ7CmRpZmYgLS1naXQgYS9pbmNsdWRl
L2xpbnV4L2hvc3QxeC5oIGIvaW5jbHVkZS9saW51eC9ob3N0MXguaAppbmRleCAxYmEyM2E2YTIw
MjEuLjZmOGQ3NzI1OTFiYSAxMDA2NDQKLS0tIGEvaW5jbHVkZS9saW51eC9ob3N0MXguaAorKysg
Yi9pbmNsdWRlL2xpbnV4L2hvc3QxeC5oCkBAIC0xNzMsNiArMTczLDkgQEAgaW50IGhvc3QxeF9q
b2Jfc3VibWl0KHN0cnVjdCBob3N0MXhfam9iICpqb2IpOwogICogaG9zdDF4IGpvYgogICovCiAK
KyNkZWZpbmUgSE9TVDFYX1JFTE9DX1JFQUQJKDEgPDwgMCkKKyNkZWZpbmUgSE9TVDFYX1JFTE9D
X1dSSVRFCSgxIDw8IDEpCisKIHN0cnVjdCBob3N0MXhfcmVsb2MgewogCXN0cnVjdCB7CiAJCXN0
cnVjdCBob3N0MXhfYm8gKmJvOwpAQCAtMTgzLDYgKzE4Niw3IEBAIHN0cnVjdCBob3N0MXhfcmVs
b2MgewogCQl1bnNpZ25lZCBsb25nIG9mZnNldDsKIAl9IHRhcmdldDsKIAl1bnNpZ25lZCBsb25n
IHNoaWZ0OworCXVuc2lnbmVkIGxvbmcgZmxhZ3M7CiB9OwogCiBzdHJ1Y3QgaG9zdDF4X2pvYiB7
Ci0tIAoyLjIzLjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9y
ZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZl
bA==
