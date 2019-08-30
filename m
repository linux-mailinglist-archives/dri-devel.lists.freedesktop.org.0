Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E77EFA4FBD
	for <lists+dri-devel@lfdr.de>; Mon,  2 Sep 2019 09:24:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF6C389BFB;
	Mon,  2 Sep 2019 07:24:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com
 [IPv6:2607:f8b0:4864:20::541])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0BB166E28A;
 Fri, 30 Aug 2019 08:07:09 +0000 (UTC)
Received: by mail-pg1-x541.google.com with SMTP id i18so3139935pgl.11;
 Fri, 30 Aug 2019 01:07:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
 :content-disposition:user-agent;
 bh=MXRSo7Bfbe6lDlHCJm+CIISENbRdG4l7siPy76JG7SU=;
 b=faF+hf7TZcnJLkT4IB/yLSJ80u2DIoD3DiT89FUmS7lmEAy+jHtm0cK5QeIKMlTk2x
 ZzLl9bXLdT7fqH3mLKA3JWPXdGQ3r3fZkm6X0/DwUW3ZjLSPF2+wfpf32uF2Q1zpWoH5
 3wo3xuRmfp2GVBrA5U8Antcih8YfP9TEXyTPpgHoOUEcYIzhUb9BZCJEuwgyD8On+not
 ZE34OZGLd9ehHrf9W/kNXtwUsVnLQqBMRKXbl/E2k7zIjo2TirivWEdMSs/e0GbWO6Vy
 i4mAS1mqyUzKKQWaRvFvuEYXIhqaWbgcSCImg8nw6P68WCeC7D9tk7HIHnWwrbuNEA39
 FQJw==
X-Gm-Message-State: APjAAAVPVcY4nRbZZPcb7QbCimEXBPBNoKVrFiTCwr+ubh3HYb1onWOc
 olnUBOmkud78BSTJZ4GEcgU=
X-Google-Smtp-Source: APXvYqxZAHJHRmuCjSumcB6MbQRPwIPCHRCI7QXFZ70Y2QZsOHTv528yreoK++9BGrbefLAeN/Cbhw==
X-Received: by 2002:a63:e44b:: with SMTP id i11mr11617071pgk.297.1567152429453; 
 Fri, 30 Aug 2019 01:07:09 -0700 (PDT)
Received: from LGEARND20B15 ([27.122.242.75])
 by smtp.gmail.com with ESMTPSA id v189sm5854894pfv.176.2019.08.30.01.07.07
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 30 Aug 2019 01:07:08 -0700 (PDT)
Date: Fri, 30 Aug 2019 17:07:04 +0900
From: Austin Kim <austindh.kim@gmail.com>
To: rex.zhu@amd.com, evan.quan@amd.com
Subject: [PATCH] drm/amdgpu: Move null pointer dereference check
Message-ID: <20190830080704.GA29599@LGEARND20B15>
MIME-Version: 1.0
Content-Disposition: inline
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Mailman-Approved-At: Mon, 02 Sep 2019 07:24:25 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:mime-version:content-disposition
 :user-agent;
 bh=MXRSo7Bfbe6lDlHCJm+CIISENbRdG4l7siPy76JG7SU=;
 b=lqWNiLgQRKoeRFx5gu3wvDbkipZoLgcIkAg7cNMOCVqf7X4rfBm+KpoYRqHhu9dw05
 /tNQVj7lqrk15NlFAa6ckxFZo20CEvy/CFkDB5dtBf9F4xxsoJwR2VvIfFH4jq7sl35d
 tvDgUC4x7mgnxniJO4br8Tb1OX9F72mVL1ACp51JPKY4O8T8YB9aXB9hJGVO/ePIDYiW
 ACA1f8zYp9MSxOSCfabML8xqwIKowg2j0VH74y9gJmQ6yK2Mg4QtMCSkM+pF2lxZ8xzn
 h53kiOouU7VOeTv2vs6h3jFgxj+fAp/A/qUtxR09wAGpLjtCU2IJA1KexOSAzixdQf7j
 czVQ==
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
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

TnVsbCBwb2ludGVyIGRlcmVmZXJlbmNlIGNoZWNrIHNob3VsZCBoYXZlIGJlZW4gY2hlY2tlZCwK
YWhlYWQgb2YgYmVsb3cgcm91dGluZS4KCXN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2ID0gaHdt
Z3ItPmFkZXY7CgpXaXRoIHRoaXMgY29tbWl0LCBpdCBjb3VsZCBhdm9pZCBwb3RlbnRpYWwgTlVM
TCBkZXJlZmVyZW5jZS4KClNpZ25lZC1vZmYtYnk6IEF1c3RpbiBLaW0gPGF1c3RpbmRoLmtpbUBn
bWFpbC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvc211bWdyL3NtdThf
c211bWdyLmMgfCA1ICsrKy0tCiAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCAyIGRl
bGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L3Nt
dW1nci9zbXU4X3NtdW1nci5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvc211bWdy
L3NtdThfc211bWdyLmMKaW5kZXggODE4OWZlNC4uNDcyOGFhMiAxMDA2NDQKLS0tIGEvZHJpdmVy
cy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvc211bWdyL3NtdThfc211bWdyLmMKKysrIGIvZHJpdmVy
cy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvc211bWdyL3NtdThfc211bWdyLmMKQEAgLTcyMiwxNiAr
NzIyLDE3IEBAIHN0YXRpYyBpbnQgc211OF9yZXF1ZXN0X3NtdV9sb2FkX2Z3KHN0cnVjdCBwcF9o
d21nciAqaHdtZ3IpCiAKIHN0YXRpYyBpbnQgc211OF9zdGFydF9zbXUoc3RydWN0IHBwX2h3bWdy
ICpod21ncikKIHsKLQlzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldiA9IGh3bWdyLT5hZGV2Owor
CXN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2OwogCiAJdWludDMyX3QgaW5kZXggPSBTTU5fTVAx
X1NSQU1fU1RBUlRfQUREUiArCiAJCQkgU01VOF9GSVJNV0FSRV9IRUFERVJfTE9DQVRJT04gKwog
CQkJIG9mZnNldG9mKHN0cnVjdCBTTVU4X0Zpcm13YXJlX0hlYWRlciwgVmVyc2lvbik7CiAKLQog
CWlmIChod21nciA9PSBOVUxMIHx8IGh3bWdyLT5kZXZpY2UgPT0gTlVMTCkKIAkJcmV0dXJuIC1F
SU5WQUw7CiAKKwlhZGV2ID0gaHdtZ3ItPmFkZXY7CisKIAljZ3Nfd3JpdGVfcmVnaXN0ZXIoaHdt
Z3ItPmRldmljZSwgbW1NUDBQVUJfSU5EX0lOREVYLCBpbmRleCk7CiAJaHdtZ3ItPnNtdV92ZXJz
aW9uID0gY2dzX3JlYWRfcmVnaXN0ZXIoaHdtZ3ItPmRldmljZSwgbW1NUDBQVUJfSU5EX0RBVEEp
OwogCXByX2luZm8oInNtdSB2ZXJzaW9uICUwMmQuJTAyZC4lMDJkXG4iLAotLSAKMi42LjIKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBt
YWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
