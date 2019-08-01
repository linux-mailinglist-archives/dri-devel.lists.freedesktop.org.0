Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BED5F7D353
	for <lists+dri-devel@lfdr.de>; Thu,  1 Aug 2019 04:25:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5CFD16E329;
	Thu,  1 Aug 2019 02:25:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com
 [IPv6:2607:f8b0:4864:20::542])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A5AD46E329
 for <dri-devel@lists.freedesktop.org>; Thu,  1 Aug 2019 02:25:29 +0000 (UTC)
Received: by mail-pg1-x542.google.com with SMTP id f5so24336034pgu.5
 for <dri-devel@lists.freedesktop.org>; Wed, 31 Jul 2019 19:25:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=H9h2eOHI19m4MgM2BOei5v6mTo70vlCQrz3vNu1i0QM=;
 b=Ob3PHh/dsTJdCRThnm91aQS7QScMUOEJXUnMHhyhuz2MYRmBzEVobC5cs7wMozjMO0
 hhTDe8aWQX7M/hwDxTK7mLvUWJg1QT2LeGHfWPJT43ReWi7yPAPlnnnh1dVGOI6cFY69
 a0LJBNPz7x5CoBQMMjFf7TBB+xa3KIC1G8lf17xcy6XH8OiFOcX12TwGaDvVAzjnQSvP
 fguqiJpxT9SLpFM6tVSw62tfxV9WY9d2ecR6SGwCGlrTa1fowK4srb27HDvkyxLDmXWf
 VCMYTk9lvzzoR4DfVqpIdbul8X0wWqg4vth9nnXggw80ASdDG8AzA6uYYx5vDpINC4Sd
 uaxw==
X-Gm-Message-State: APjAAAXhI5kZTqn9T/e5kn72etjzZ0czBGdkC4OBRDWDCPa80Bk9tvwp
 MUvcRT8MYVpr+olTjYsnzR66LDK3BL0=
X-Google-Smtp-Source: APXvYqyRZkjhTL983RjLEs8pa8qMi9QOutiMIPQTpukWAodsn80ULJtGgESXHCbgbUl3rKBFfkLJqA==
X-Received: by 2002:a62:8c81:: with SMTP id
 m123mr50215315pfd.240.1564626329062; 
 Wed, 31 Jul 2019 19:25:29 -0700 (PDT)
Received: from gurchetansingh0.mtv.corp.google.com
 ([2620:15c:202:201:bc97:5740:52a7:6875])
 by smtp.gmail.com with ESMTPSA id v184sm64911342pgd.34.2019.07.31.19.25.28
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Wed, 31 Jul 2019 19:25:28 -0700 (PDT)
From: Gurchetan Singh <gurchetansingh@chromium.org>
To: dri-devel@lists.freedesktop.org
Subject: [RFC 3/6] udmabuf: enforce access flags
Date: Wed, 31 Jul 2019 19:25:14 -0700
Message-Id: <20190801022517.1903-4-gurchetansingh@chromium.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190801022517.1903-1-gurchetansingh@chromium.org>
References: <20190801022517.1903-1-gurchetansingh@chromium.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=H9h2eOHI19m4MgM2BOei5v6mTo70vlCQrz3vNu1i0QM=;
 b=AIra+EQEpb4wc6gCcFJv9rN3p6XwzOOoD5pQIW06Vzlmm6PTQBmTaiUJqpAyGzSWI5
 uIVDQ8aKyYv/6wzEBfZqWE9kEmcHgwGEpcrtIFlkO3s9oVWX4wClstkvlKYP728rPYKh
 WWFd0wDrmYYSmsPJDC0EGmAV2pf0L+CULBZyk=
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
Cc: kraxel@redhat.com, Gurchetan Singh <gurchetansingh@chromium.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RW5mb3JjZSB0aGUgYWNjZXNzIGZsYWdzIHRoYXQgd2VyZSBhZGRlZCBlYXJsaWVyLgoKU2lnbmVk
LW9mZi1ieTogR3VyY2hldGFuIFNpbmdoIDxndXJjaGV0YW5zaW5naEBjaHJvbWl1bS5vcmc+Ci0t
LQogZHJpdmVycy9kbWEtYnVmL3VkbWFidWYuYyB8IDkgKysrKysrKysrCiAxIGZpbGUgY2hhbmdl
ZCwgOSBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9kbWEtYnVmL3VkbWFidWYu
YyBiL2RyaXZlcnMvZG1hLWJ1Zi91ZG1hYnVmLmMKaW5kZXggNGVjZjJhOTRmZWQzLi4xMzRlNTNk
MjRjMmIgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZG1hLWJ1Zi91ZG1hYnVmLmMKKysrIGIvZHJpdmVy
cy9kbWEtYnVmL3VkbWFidWYuYwpAQCAtMTYsNiArMTYsNyBAQCBzdGF0aWMgY29uc3QgdTMyICAg
IGxpc3RfbGltaXQgPSAxMDI0OyAgLyogdWRtYWJ1Zl9jcmVhdGVfbGlzdC0+Y291bnQgbGltaXQg
Ki8KIHN0YXRpYyBjb25zdCBzaXplX3Qgc2l6ZV9saW1pdF9tYiA9IDY0OyAvKiB0b3RhbCBkbWFi
dWYgc2l6ZSwgaW4gbWVnYWJ5dGVzICAqLwogCiBzdHJ1Y3QgdWRtYWJ1ZiB7CisJdTMyIGZsYWdz
OwogCXBnb2ZmX3QgcGFnZWNvdW50OwogCXN0cnVjdCBwYWdlICoqcGFnZXM7CiB9OwpAQCAtMzcs
MTAgKzM4LDE3IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3Qgdm1fb3BlcmF0aW9uc19zdHJ1Y3QgdWRt
YWJ1Zl92bV9vcHMgPSB7CiBzdGF0aWMgaW50IG1tYXBfdWRtYWJ1ZihzdHJ1Y3QgZG1hX2J1ZiAq
YnVmLCBzdHJ1Y3Qgdm1fYXJlYV9zdHJ1Y3QgKnZtYSkKIHsKIAlzdHJ1Y3QgdWRtYWJ1ZiAqdWJ1
ZiA9IGJ1Zi0+cHJpdjsKKwlwZ3Byb3RfdCBwZ3Byb3QgPSB2bV9nZXRfcGFnZV9wcm90KHZtYS0+
dm1fZmxhZ3MpOwogCiAJaWYgKCh2bWEtPnZtX2ZsYWdzICYgKFZNX1NIQVJFRCB8IFZNX01BWVNI
QVJFKSkgPT0gMCkKIAkJcmV0dXJuIC1FSU5WQUw7CiAKKwlpZiAodWJ1Zi0+ZmxhZ3MgJiBVRE1B
QlVGX0ZMQUdTX1BST1RfTk9ORSkKKwkJcmV0dXJuIC1FSU5WQUw7CisKKwlpZiAoKHVidWYtPmZs
YWdzICYgVURNQUJVRl9GTEFHU19QUk9UX1JFQUQpID09IDApCisJCXZtYS0+dm1fcGFnZV9wcm90
ID0gcGdwcm90X3dyaXRlY29tYmluZShwZ3Byb3QpOworCiAJdm1hLT52bV9vcHMgPSAmdWRtYWJ1
Zl92bV9vcHM7CiAJdm1hLT52bV9wcml2YXRlX2RhdGEgPSB1YnVmOwogCXJldHVybiAwOwpAQCAt
MTkzLDYgKzIwMSw3IEBAIHN0YXRpYyBsb25nIHVkbWFidWZfY3JlYXRlKGNvbnN0IHN0cnVjdCB1
ZG1hYnVmX2NyZWF0ZV9saXN0ICpoZWFkLAogCWVsc2UgaWYgKGhlYWQtPmZsYWdzICYgVURNQUJV
Rl9GTEFHU19QUk9UX1dSSVRFKQogCQlleHBfaW5mby5mbGFncyA9IE9fV1JPTkxZOwogCisJdWJ1
Zi0+ZmxhZ3MgPSBoZWFkLT5mbGFnczsKIAlidWYgPSBkbWFfYnVmX2V4cG9ydCgmZXhwX2luZm8p
OwogCWlmIChJU19FUlIoYnVmKSkgewogCQlyZXQgPSBQVFJfRVJSKGJ1Zik7Ci0tIAoyLjE3LjEK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZl
bCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xp
c3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
