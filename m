Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 88AA39A549
	for <lists+dri-devel@lfdr.de>; Fri, 23 Aug 2019 04:12:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 626A66EBA3;
	Fri, 23 Aug 2019 02:12:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f195.google.com (mail-oi1-f195.google.com
 [209.85.167.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D0C256EAAA
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Aug 2019 02:12:20 +0000 (UTC)
Received: by mail-oi1-f195.google.com with SMTP id q8so5637206oij.5
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Aug 2019 19:12:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=CtVv9KmOH1uY8onE46Ao79LAatPRJtfqcOsRBmR2M9Q=;
 b=lm7NrdhvRCY0ZW8DYbYnmfw1iRUuCluNcwJFuHNbL96EkrCXtu42+sOfrdQ0Dil6Rd
 ClV5kppI0iM3yQUUDQImHO+dsWcmgCJJ6Nq/3oqykQt8OcwJQgrCXHN6XzsUaCSZ0twS
 AuRU3mcFxPOFhzAlkLLdZQJvuofpOcWlrjdfLkz3ICkdYyXd1IbKI23dX/13k+8S7y9W
 MvKhfD+jcNjukB9JxJGwWRJDQScYTbDXPwfCUYnMreqvmNRjkxHMk4QvYk+BFQvmrXm5
 ++vQ3O52l7shgpTwJ71xUeS/cC2Uc9WWOZDTi6g+/9JNy78373S/7G2vFsCdV+a0rnR0
 DJ8w==
X-Gm-Message-State: APjAAAXEf44elJACY+t3qMEidkjMpTQX58g6oanrZ44ZrC9UK3Yt3FYG
 DETiry1arIJ+CyoaHUd62eHZ36U=
X-Google-Smtp-Source: APXvYqzir6uWwX94/snHpAlAtSJKbbjaTQv3ggyGaYdZVf4/BH/JtPzHVSvvgX6k9Rn2YOmXNyPtow==
X-Received: by 2002:aca:dc88:: with SMTP id t130mr1435568oig.43.1566526339704; 
 Thu, 22 Aug 2019 19:12:19 -0700 (PDT)
Received: from xps15.herring.priv (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.googlemail.com with ESMTPSA id c1sm457747oic.31.2019.08.22.19.12.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Aug 2019 19:12:19 -0700 (PDT)
From: Rob Herring <robh@kernel.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 1/8] drm/panfrost: Fix possible suspend in panfrost_remove
Date: Thu, 22 Aug 2019 21:12:09 -0500
Message-Id: <20190823021216.5862-2-robh@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190823021216.5862-1-robh@kernel.org>
References: <20190823021216.5862-1-robh@kernel.org>
MIME-Version: 1.0
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
Cc: Maxime Ripard <maxime.ripard@bootlin.com>,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>, David Airlie <airlied@linux.ie>,
 Sean Paul <sean@poorly.run>, Steven Price <steven.price@arm.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Robin Murphy <robin.murphy@arm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Q2FsbHMgdG8gcGFuZnJvc3RfZGV2aWNlX2ZpbmkoKSBhY2Nlc3MgdGhlIGgvdywgYnV0IHdlIGFs
cmVhZHkgZG9uZSBhCnBtX3J1bnRpbWVfcHV0X3N5bmNfYXV0b3N1c3BlbmQoKSBiZWZvcmVoYW5k
LiBUaGlzIG9ubHkgd29ya3MgaWYgdGhlCmF1dG9zdXNwZW5kIGRlbGF5IGlzIGxvbmcgZW5vdWdo
LiBBIDBtcyBkZWxheSB3aWxsIGhhbmcgdGhlIHN5c3RlbSB3aGVuCnJlbW92aW5nIHRoZSBkZXZp
Y2UuIEZpeCB0aGlzIGJ5IG1vdmluZyB0aGUgcG1fcnVudGltZV9wdXRfc3luY19zdXNwZW5kKCkK
YWZ0ZXIgdGhlIHBhbmZyb3N0X2RldmljZV9maW5pKCkgY2FsbC4KCkNjOiBUb21ldSBWaXpvc28g
PHRvbWV1LnZpem9zb0Bjb2xsYWJvcmEuY29tPgpDYzogU3RldmVuIFByaWNlIDxzdGV2ZW4ucHJp
Y2VAYXJtLmNvbT4KQ2M6IEFseXNzYSBSb3Nlbnp3ZWlnIDxhbHlzc2Eucm9zZW56d2VpZ0Bjb2xs
YWJvcmEuY29tPgpDYzogRGF2aWQgQWlybGllIDxhaXJsaWVkQGxpbnV4LmllPgpDYzogRGFuaWVs
IFZldHRlciA8ZGFuaWVsQGZmd2xsLmNoPgpTaWduZWQtb2ZmLWJ5OiBSb2IgSGVycmluZyA8cm9i
aEBrZXJuZWwub3JnPgotLS0KdjI6IG5ldyBwYXRjaAoKIGRyaXZlcnMvZ3B1L2RybS9wYW5mcm9z
dC9wYW5mcm9zdF9kcnYuYyB8IDYgKysrKy0tCiAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25z
KCspLCAyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9wYW5mcm9z
dC9wYW5mcm9zdF9kcnYuYyBiL2RyaXZlcnMvZ3B1L2RybS9wYW5mcm9zdC9wYW5mcm9zdF9kcnYu
YwppbmRleCA0NGE1NThjNmUxN2UuLmQ3NDQ0MmQ3MTA0OCAxMDA2NDQKLS0tIGEvZHJpdmVycy9n
cHUvZHJtL3BhbmZyb3N0L3BhbmZyb3N0X2Rydi5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9wYW5m
cm9zdC9wYW5mcm9zdF9kcnYuYwpAQCAtNTcwLDExICs1NzAsMTMgQEAgc3RhdGljIGludCBwYW5m
cm9zdF9yZW1vdmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikKIAogCWRybV9kZXZfdW5y
ZWdpc3RlcihkZGV2KTsKIAlwYW5mcm9zdF9nZW1fc2hyaW5rZXJfY2xlYW51cChkZGV2KTsKKwog
CXBtX3J1bnRpbWVfZ2V0X3N5bmMocGZkZXYtPmRldik7Ci0JcG1fcnVudGltZV9wdXRfc3luY19h
dXRvc3VzcGVuZChwZmRldi0+ZGV2KTsKLQlwbV9ydW50aW1lX2Rpc2FibGUocGZkZXYtPmRldik7
CiAJcGFuZnJvc3RfZGV2ZnJlcV9maW5pKHBmZGV2KTsKIAlwYW5mcm9zdF9kZXZpY2VfZmluaShw
ZmRldik7CisJcG1fcnVudGltZV9wdXRfc3luY19zdXNwZW5kKHBmZGV2LT5kZXYpOworCXBtX3J1
bnRpbWVfZGlzYWJsZShwZmRldi0+ZGV2KTsKKwogCWRybV9kZXZfcHV0KGRkZXYpOwogCXJldHVy
biAwOwogfQotLSAKMi4yMC4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9k
cmktZGV2ZWw=
