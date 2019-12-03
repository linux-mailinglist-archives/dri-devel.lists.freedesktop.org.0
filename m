Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E521A10F493
	for <lists+dri-devel@lfdr.de>; Tue,  3 Dec 2019 02:36:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6AD906E12B;
	Tue,  3 Dec 2019 01:36:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com
 [IPv6:2607:f8b0:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 14D046E12B
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Dec 2019 01:36:40 +0000 (UTC)
Received: by mail-pf1-x443.google.com with SMTP id h14so878165pfe.10
 for <dri-devel@lists.freedesktop.org>; Mon, 02 Dec 2019 17:36:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=bFT261wHUPXLo9NFa/I8imKlcZ8J4KpDNRcWS6+ZDqI=;
 b=IRlY3NTWZpCLumFHdn0ND+6cWFK3XxA/qAQFCdLf6d9ZRMQLfA33AFC3+wOanNlTkK
 lDRoRhVHXqSiJKw5I7VbdvQxgrLyP5yuLBYu33ssjdxowq7BL81RMuVONds6otDR9dRG
 QMSg14HIY+u4HLBQzYTiX00j4+Qm9DqvAe8Z6osTCDaOKal0vHpoR7ebUnl/LdST8XYi
 FUrtt6e9OrrxDn+UTfWOftluCR49tdjvi7TI3S/UENCKRgI11fh7E1Kug8LhpbV7C0YF
 TklBG0w7T/zJ6nh4jFGP5rIi8NmQpyjf7t789dg4j3UxPsL2qKISo3GlJErSfYynu+I1
 oWyA==
X-Gm-Message-State: APjAAAWIHB/iJZI2TJwaTFXV86Gy6o0wrdNhQMT3YGguR/v5n9wVpCRN
 3XkwhJ6ny4zREzjbi2CFAjYtrrfWZ/Y=
X-Google-Smtp-Source: APXvYqzSNlfAM3i+NXvH3zKY4If39GEmxvFkh1nOzlPqefoiqkbJId+D0A7Kb0ey3TTnd3KScAX8XQ==
X-Received: by 2002:a63:214e:: with SMTP id s14mr2521727pgm.428.1575336999316; 
 Mon, 02 Dec 2019 17:36:39 -0800 (PST)
Received: from gurchetansingh0.mtv.corp.google.com
 ([2620:15c:202:201:bc97:5740:52a7:6875])
 by smtp.gmail.com with ESMTPSA id r4sm581916pji.11.2019.12.02.17.36.38
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Mon, 02 Dec 2019 17:36:38 -0800 (PST)
From: Gurchetan Singh <gurchetansingh@chromium.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 2/4] udmabuf: add a pointer to the miscdevice in dma-buf
 private data
Date: Mon,  2 Dec 2019 17:36:25 -0800
Message-Id: <20191203013627.85991-2-gurchetansingh@chromium.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191203013627.85991-1-gurchetansingh@chromium.org>
References: <20191203013627.85991-1-gurchetansingh@chromium.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=bFT261wHUPXLo9NFa/I8imKlcZ8J4KpDNRcWS6+ZDqI=;
 b=HOXmlk6dQIN7mVVcmk6BZdb883O3coGOpsncWEhYPOzNGdbiD8z3Q5bJzJLadCDKyR
 J9N6IkSNG9d36Ngz8xAO7SajKXvtPQdiKFJUcMwwS18Sbc4IUf9B3pUjmggA5EecQka2
 MAIi9r2iHVTm68WydVGNscs2mpyFgU2X3R/fk=
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
Cc: Gurchetan Singh <gurchetansingh@chromium.org>, kraxel@redhat.com,
 hch@lst.de
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

V2lsbCBiZSB1c2VkIGxhdGVyLgoKdjI6IHJlbmFtZSAndWRtYWJ1Zl9taXNjJyB0byAnZGV2aWNl
JyAoa3JheGVsKQoKU2lnbmVkLW9mZi1ieTogR3VyY2hldGFuIFNpbmdoIDxndXJjaGV0YW5zaW5n
aEBjaHJvbWl1bS5vcmc+Ci0tLQogZHJpdmVycy9kbWEtYnVmL3VkbWFidWYuYyB8IDExICsrKysr
KystLS0tCiAxIGZpbGUgY2hhbmdlZCwgNyBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQoK
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvZG1hLWJ1Zi91ZG1hYnVmLmMgYi9kcml2ZXJzL2RtYS1idWYv
dWRtYWJ1Zi5jCmluZGV4IGJlMTVlYjZiMDU4Ni4uZjBiZjNiYTc0NDFlIDEwMDY0NAotLS0gYS9k
cml2ZXJzL2RtYS1idWYvdWRtYWJ1Zi5jCisrKyBiL2RyaXZlcnMvZG1hLWJ1Zi91ZG1hYnVmLmMK
QEAgLTE4LDYgKzE4LDcgQEAgc3RhdGljIGNvbnN0IHNpemVfdCBzaXplX2xpbWl0X21iID0gNjQ7
IC8qIHRvdGFsIGRtYWJ1ZiBzaXplLCBpbiBtZWdhYnl0ZXMgICovCiBzdHJ1Y3QgdWRtYWJ1ZiB7
CiAJcGdvZmZfdCBwYWdlY291bnQ7CiAJc3RydWN0IHBhZ2UgKipwYWdlczsKKwlzdHJ1Y3QgbWlz
Y2RldmljZSAqZGV2aWNlOwogfTsKIAogc3RhdGljIHZtX2ZhdWx0X3QgdWRtYWJ1Zl92bV9mYXVs
dChzdHJ1Y3Qgdm1fZmF1bHQgKnZtZikKQEAgLTEwNCw4ICsxMDUsOSBAQCBzdGF0aWMgY29uc3Qg
c3RydWN0IGRtYV9idWZfb3BzIHVkbWFidWZfb3BzID0gewogI2RlZmluZSBTRUFMU19XQU5URUQg
KEZfU0VBTF9TSFJJTkspCiAjZGVmaW5lIFNFQUxTX0RFTklFRCAoRl9TRUFMX1dSSVRFKQogCi1z
dGF0aWMgbG9uZyB1ZG1hYnVmX2NyZWF0ZShjb25zdCBzdHJ1Y3QgdWRtYWJ1Zl9jcmVhdGVfbGlz
dCAqaGVhZCwKLQkJCSAgIGNvbnN0IHN0cnVjdCB1ZG1hYnVmX2NyZWF0ZV9pdGVtICpsaXN0KQor
c3RhdGljIGxvbmcgdWRtYWJ1Zl9jcmVhdGUoc3RydWN0IG1pc2NkZXZpY2UgKmRldmljZSwKKwkJ
CSAgIHN0cnVjdCB1ZG1hYnVmX2NyZWF0ZV9saXN0ICpoZWFkLAorCQkJICAgc3RydWN0IHVkbWFi
dWZfY3JlYXRlX2l0ZW0gKmxpc3QpCiB7CiAJREVGSU5FX0RNQV9CVUZfRVhQT1JUX0lORk8oZXhw
X2luZm8pOwogCXN0cnVjdCBmaWxlICptZW1mZCA9IE5VTEw7CkBAIC0xNzIsNiArMTc0LDcgQEAg
c3RhdGljIGxvbmcgdWRtYWJ1Zl9jcmVhdGUoY29uc3Qgc3RydWN0IHVkbWFidWZfY3JlYXRlX2xp
c3QgKmhlYWQsCiAJZXhwX2luZm8ucHJpdiA9IHVidWY7CiAJZXhwX2luZm8uZmxhZ3MgPSBPX1JE
V1I7CiAKKwl1YnVmLT5kZXZpY2UgPSBkZXZpY2U7CiAJYnVmID0gZG1hX2J1Zl9leHBvcnQoJmV4
cF9pbmZvKTsKIAlpZiAoSVNfRVJSKGJ1ZikpIHsKIAkJcmV0ID0gUFRSX0VSUihidWYpOwpAQCAt
MjA5LDcgKzIxMiw3IEBAIHN0YXRpYyBsb25nIHVkbWFidWZfaW9jdGxfY3JlYXRlKHN0cnVjdCBm
aWxlICpmaWxwLCB1bnNpZ25lZCBsb25nIGFyZykKIAlsaXN0Lm9mZnNldCA9IGNyZWF0ZS5vZmZz
ZXQ7CiAJbGlzdC5zaXplICAgPSBjcmVhdGUuc2l6ZTsKIAotCXJldHVybiB1ZG1hYnVmX2NyZWF0
ZSgmaGVhZCwgJmxpc3QpOworCXJldHVybiB1ZG1hYnVmX2NyZWF0ZShmaWxwLT5wcml2YXRlX2Rh
dGEsICZoZWFkLCAmbGlzdCk7CiB9CiAKIHN0YXRpYyBsb25nIHVkbWFidWZfaW9jdGxfY3JlYXRl
X2xpc3Qoc3RydWN0IGZpbGUgKmZpbHAsIHVuc2lnbmVkIGxvbmcgYXJnKQpAQCAtMjI4LDcgKzIz
MSw3IEBAIHN0YXRpYyBsb25nIHVkbWFidWZfaW9jdGxfY3JlYXRlX2xpc3Qoc3RydWN0IGZpbGUg
KmZpbHAsIHVuc2lnbmVkIGxvbmcgYXJnKQogCWlmIChJU19FUlIobGlzdCkpCiAJCXJldHVybiBQ
VFJfRVJSKGxpc3QpOwogCi0JcmV0ID0gdWRtYWJ1Zl9jcmVhdGUoJmhlYWQsIGxpc3QpOworCXJl
dCA9IHVkbWFidWZfY3JlYXRlKGZpbHAtPnByaXZhdGVfZGF0YSwgJmhlYWQsIGxpc3QpOwogCWtm
cmVlKGxpc3QpOwogCXJldHVybiByZXQ7CiB9Ci0tIAoyLjI0LjAuMzkzLmczNGRjMzQ4ZWFmLWdv
b2cKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1k
ZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
