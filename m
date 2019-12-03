Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 456A410F495
	for <lists+dri-devel@lfdr.de>; Tue,  3 Dec 2019 02:36:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 45D826E25D;
	Tue,  3 Dec 2019 01:36:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com
 [IPv6:2607:f8b0:4864:20::1042])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 50B356E25D
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Dec 2019 01:36:44 +0000 (UTC)
Received: by mail-pj1-x1042.google.com with SMTP id r11so728200pjp.12
 for <dri-devel@lists.freedesktop.org>; Mon, 02 Dec 2019 17:36:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=UC12aMZjZVB0hw5FURRfqe7EjweoFXTZMR/s1F02Qgs=;
 b=F4ZV9h0fr9oyE+EPRtAduooTnOHguSgOiFoZ7ea5z2/TxvRuzXV6fpz/le9LzaMUuo
 1EeQ8r6jgq/x94kUv0uNp2G6eHDyjf+BEiSHAbg5PrgFnVQXz+rr1PifnbM781Fx+fGU
 t4RQiEca6099lrhlFiy4gVDPQSLGZkIHm/0kjD2Kd7pNFxWdBieGpixqCJhjPIzuyYTj
 /Sf1FqjC2nQD3BYvr3H/wWu9U18nY0vkHqH7/AC7uEMSCNqeaNnXdNV+shoO9fxxr/O3
 fXhMnkY19tz2BvpIX2dbxM2r4eVSXKsRPMX/9qQMVNcDeeT6cCLryL7NAUTXB5UPYClK
 tu2Q==
X-Gm-Message-State: APjAAAVyU0C+X7c/SQ5HzEGa2PDgEf8jN2M02LqBmmQUtAkDTOfTHbbY
 KWU5690nmOOOtHaoq35MqFy+mXurHCM=
X-Google-Smtp-Source: APXvYqwokl7QfCw9qi4P1gu6pROxJy+Fn7i1+joycJVc7sIxc0Oz0YQbc2txYevyMRkUSHjp6yAewQ==
X-Received: by 2002:a17:902:b90a:: with SMTP id
 bf10mr2444763plb.45.1575337003597; 
 Mon, 02 Dec 2019 17:36:43 -0800 (PST)
Received: from gurchetansingh0.mtv.corp.google.com
 ([2620:15c:202:201:bc97:5740:52a7:6875])
 by smtp.gmail.com with ESMTPSA id r4sm581916pji.11.2019.12.02.17.36.42
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Mon, 02 Dec 2019 17:36:42 -0800 (PST)
From: Gurchetan Singh <gurchetansingh@chromium.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 4/4] udmabuf: implement begin_cpu_access/end_cpu_access hooks
Date: Mon,  2 Dec 2019 17:36:27 -0800
Message-Id: <20191203013627.85991-4-gurchetansingh@chromium.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191203013627.85991-1-gurchetansingh@chromium.org>
References: <20191203013627.85991-1-gurchetansingh@chromium.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=UC12aMZjZVB0hw5FURRfqe7EjweoFXTZMR/s1F02Qgs=;
 b=fmpA6UfGacoKv242CuqlcAnMVr7Ie44cQh+ijNdlzpPQ70luiLYdsUP4Y7hvIqkGuY
 1CyXJiI8BK4lnXtgiczMzKl2DwYOMXFWlSCSKrz0sYdEPcd8lFLDgTjrYZCwv+G5Si6x
 OCE9NdXoTcGH9jxhpa1kV6EWECYfWoaGOMwjg=
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

V2l0aCB0aGUgbWlzYyBkZXZpY2UsIHdlIHNob3VsZCBlbmQgdXAgdXNpbmcgdGhlIHJlc3VsdCBv
ZgpnZXRfYXJjaF9kbWFfb3BzKC4uKSBvciBkbWEtZGlyZWN0IG9wcy4KClRoaXMgY2FuIGFsbG93
IHVzIHRvIGhhdmUgV0MgbWFwcGluZ3MgaW4gdGhlIGd1ZXN0IGFmdGVyCnN5bmNocm9uaXphdGlv
bi4KClNpZ25lZC1vZmYtYnk6IEd1cmNoZXRhbiBTaW5naCA8Z3VyY2hldGFuc2luZ2hAY2hyb21p
dW0ub3JnPgotLS0KIGRyaXZlcnMvZG1hLWJ1Zi91ZG1hYnVmLmMgfCAzOSArKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysKIDEgZmlsZSBjaGFuZ2VkLCAzOSBpbnNlcnRpb25z
KCspCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9kbWEtYnVmL3VkbWFidWYuYyBiL2RyaXZlcnMvZG1h
LWJ1Zi91ZG1hYnVmLmMKaW5kZXggMGE2MTBlMDlhZTIzLi42MWIwYTJjZmY4NzQgMTAwNjQ0Ci0t
LSBhL2RyaXZlcnMvZG1hLWJ1Zi91ZG1hYnVmLmMKKysrIGIvZHJpdmVycy9kbWEtYnVmL3VkbWFi
dWYuYwpAQCAtMTgsNiArMTgsNyBAQCBzdGF0aWMgY29uc3Qgc2l6ZV90IHNpemVfbGltaXRfbWIg
PSA2NDsgLyogdG90YWwgZG1hYnVmIHNpemUsIGluIG1lZ2FieXRlcyAgKi8KIHN0cnVjdCB1ZG1h
YnVmIHsKIAlwZ29mZl90IHBhZ2Vjb3VudDsKIAlzdHJ1Y3QgcGFnZSAqKnBhZ2VzOworCXN0cnVj
dCBzZ190YWJsZSAqc2c7CiAJc3RydWN0IG1pc2NkZXZpY2UgKmRldmljZTsKIH07CiAKQEAgLTk4
LDIwICs5OSw1OCBAQCBzdGF0aWMgdm9pZCB1bm1hcF91ZG1hYnVmKHN0cnVjdCBkbWFfYnVmX2F0
dGFjaG1lbnQgKmF0LAogc3RhdGljIHZvaWQgcmVsZWFzZV91ZG1hYnVmKHN0cnVjdCBkbWFfYnVm
ICpidWYpCiB7CiAJc3RydWN0IHVkbWFidWYgKnVidWYgPSBidWYtPnByaXY7CisJc3RydWN0IGRl
dmljZSAqZGV2ID0gdWJ1Zi0+ZGV2aWNlLT50aGlzX2RldmljZTsKIAlwZ29mZl90IHBnOwogCisJ
aWYgKHVidWYtPnNnKQorCQlwdXRfc2dfdGFibGUoZGV2LCB1YnVmLT5zZywgRE1BX0JJRElSRUNU
SU9OQUwpOworCiAJZm9yIChwZyA9IDA7IHBnIDwgdWJ1Zi0+cGFnZWNvdW50OyBwZysrKQogCQlw
dXRfcGFnZSh1YnVmLT5wYWdlc1twZ10pOwogCWtmcmVlKHVidWYtPnBhZ2VzKTsKIAlrZnJlZSh1
YnVmKTsKIH0KIAorc3RhdGljIGludCBiZWdpbl9jcHVfdWRtYWJ1ZihzdHJ1Y3QgZG1hX2J1ZiAq
YnVmLAorCQkJICAgICBlbnVtIGRtYV9kYXRhX2RpcmVjdGlvbiBkaXJlY3Rpb24pCit7CisJc3Ry
dWN0IHVkbWFidWYgKnVidWYgPSBidWYtPnByaXY7CisJc3RydWN0IGRldmljZSAqZGV2ID0gdWJ1
Zi0+ZGV2aWNlLT50aGlzX2RldmljZTsKKworCWlmICghdWJ1Zi0+c2cpIHsKKwkJdWJ1Zi0+c2cg
PSBnZXRfc2dfdGFibGUoZGV2LCBidWYsIGRpcmVjdGlvbik7CisJCWlmIChJU19FUlIodWJ1Zi0+
c2cpKQorCQkJcmV0dXJuIFBUUl9FUlIodWJ1Zi0+c2cpOworCX0gZWxzZSB7CisJCWRtYV9zeW5j
X3NnX2Zvcl9kZXZpY2UoZGV2LCB1YnVmLT5zZy0+c2dsLAorCQkJCSAgICAgICB1YnVmLT5zZy0+
bmVudHMsCisJCQkJICAgICAgIGRpcmVjdGlvbik7CisJfQorCisJcmV0dXJuIDA7Cit9CisKK3N0
YXRpYyBpbnQgZW5kX2NwdV91ZG1hYnVmKHN0cnVjdCBkbWFfYnVmICpidWYsCisJCQkgICBlbnVt
IGRtYV9kYXRhX2RpcmVjdGlvbiBkaXJlY3Rpb24pCit7CisJc3RydWN0IHVkbWFidWYgKnVidWYg
PSBidWYtPnByaXY7CisJc3RydWN0IGRldmljZSAqZGV2ID0gdWJ1Zi0+ZGV2aWNlLT50aGlzX2Rl
dmljZTsKKworCWlmICghdWJ1Zi0+c2cpCisJCXJldHVybiAtRUlOVkFMOworCisJZG1hX3N5bmNf
c2dfZm9yX2NwdShkZXYsIHVidWYtPnNnLT5zZ2wsIHVidWYtPnNnLT5uZW50cywgZGlyZWN0aW9u
KTsKKwlyZXR1cm4gMDsKK30KKwogc3RhdGljIGNvbnN0IHN0cnVjdCBkbWFfYnVmX29wcyB1ZG1h
YnVmX29wcyA9IHsKIAkuY2FjaGVfc2d0X21hcHBpbmcgPSB0cnVlLAogCS5tYXBfZG1hX2J1Zgkg
ICA9IG1hcF91ZG1hYnVmLAogCS51bm1hcF9kbWFfYnVmCSAgID0gdW5tYXBfdWRtYWJ1ZiwKIAku
cmVsZWFzZQkgICA9IHJlbGVhc2VfdWRtYWJ1ZiwKIAkubW1hcAkJICAgPSBtbWFwX3VkbWFidWYs
CisJLmJlZ2luX2NwdV9hY2Nlc3MgID0gYmVnaW5fY3B1X3VkbWFidWYsCisJLmVuZF9jcHVfYWNj
ZXNzICAgID0gZW5kX2NwdV91ZG1hYnVmLAogfTsKIAogI2RlZmluZSBTRUFMU19XQU5URUQgKEZf
U0VBTF9TSFJJTkspCi0tIAoyLjI0LjAuMzkzLmczNGRjMzQ4ZWFmLWdvb2cKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxp
c3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
