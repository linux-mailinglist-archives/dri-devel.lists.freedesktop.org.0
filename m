Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A57C7D356
	for <lists+dri-devel@lfdr.de>; Thu,  1 Aug 2019 04:25:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 46C906E32D;
	Thu,  1 Aug 2019 02:25:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com
 [IPv6:2607:f8b0:4864:20::642])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 55C756E32D
 for <dri-devel@lists.freedesktop.org>; Thu,  1 Aug 2019 02:25:35 +0000 (UTC)
Received: by mail-pl1-x642.google.com with SMTP id c14so31321260plo.0
 for <dri-devel@lists.freedesktop.org>; Wed, 31 Jul 2019 19:25:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=QvbbRut7SYudiOsU2n2lA4sGJ4wUL896ZrZu2J1BsIE=;
 b=s1hd8K9q0LtOVNsqZ7JbhpwqnOFlSqVaMSFD7AWvvl9H7XikUqOqH03nTdfLMOsvrk
 gDvITRb0Geik3oBP+v6gTvsaKD0fbu0MzTUbU4GAz3JTfvRhB3uCeULAPhxqzACPGHoB
 mg5KpV7xCrtC61RADm5enzMIyib8SnTabHWydy/HTSuPry/j/zfjxIjcMjWPXS9I50xR
 LdM9DO3o1LwSsGiW1p3HZC4P89KZzJec9nMMNeeAGOX8HxpWeeLui8v/PQtbRvg84opl
 i5I9nnKrTuPiQ42/dHQrFvs96xMfP7r5Ss15ws7mM2wwuQ7YnomVZJyaqYh1txReR+DR
 QH5A==
X-Gm-Message-State: APjAAAUCJJXcuKM3jOiozwq0xhOYqhApaH/ox8upVyduCMieMO4evM+g
 KpSYapZSpfK5KVdkSyqM2rH940ycFG4=
X-Google-Smtp-Source: APXvYqx9EQ/iEridVSbs0VaWuU/mPMV71Wkv5KtiuINAgmBf1jnESf72OXp8uprn2SGBCr3WrG1xaQ==
X-Received: by 2002:a17:902:6b07:: with SMTP id
 o7mr120195283plk.180.1564626334404; 
 Wed, 31 Jul 2019 19:25:34 -0700 (PDT)
Received: from gurchetansingh0.mtv.corp.google.com
 ([2620:15c:202:201:bc97:5740:52a7:6875])
 by smtp.gmail.com with ESMTPSA id v184sm64911342pgd.34.2019.07.31.19.25.33
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Wed, 31 Jul 2019 19:25:33 -0700 (PDT)
From: Gurchetan Singh <gurchetansingh@chromium.org>
To: dri-devel@lists.freedesktop.org
Subject: [RFC 6/6] udmabuf: implement begin_cpu_access/end_cpu_access hooks
Date: Wed, 31 Jul 2019 19:25:17 -0700
Message-Id: <20190801022517.1903-7-gurchetansingh@chromium.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190801022517.1903-1-gurchetansingh@chromium.org>
References: <20190801022517.1903-1-gurchetansingh@chromium.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=QvbbRut7SYudiOsU2n2lA4sGJ4wUL896ZrZu2J1BsIE=;
 b=BEJ7kE6w6LUAMMFaU6XouTcalHjLQYWb3f0DILkf0ZEss4IGxMoefamHAxI7UuKcN8
 yKsyjHpPgV3tsIShO/uL94feNTy0Q49X9TcdhhasXhejdMKsTva7uKnZjQm0DNoTtYBz
 a9QM+bFH5UduqoOv/71JgM/u8Csha8+381myI=
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

V2l0aCB0aGUgbWlzYyBkZXZpY2UsIHdlIHNob3VsZCBlbmQgdXAgdXNpbmcgZG1hIGRpcmVjdCBv
cHMuClRoaXMgY2FuIGFsbG93IHVzIHRvIGhhdmUgV0MgbWFwcGluZ3MgaW4gdGhlIGd1ZXN0IGFm
dGVyIHNvbWUKc3luY2hyb25pemF0aW9uLCBpZiB3ZSBkaXNhbGxvdyBjYWNoZWQgbWFwcGluZ3Mg
aW4gdGhlIGhvc3QuCgpTaWduZWQtb2ZmLWJ5OiBHdXJjaGV0YW4gU2luZ2ggPGd1cmNoZXRhbnNp
bmdoQGNocm9taXVtLm9yZz4KLS0tCiBkcml2ZXJzL2RtYS1idWYvdWRtYWJ1Zi5jIHwgMzkgKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrCiAxIGZpbGUgY2hhbmdlZCwgMzkg
aW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZG1hLWJ1Zi91ZG1hYnVmLmMgYi9k
cml2ZXJzL2RtYS1idWYvdWRtYWJ1Zi5jCmluZGV4IDVmOGJlZTE4NjJkZS4uNTJkZTdiYTFlNzEy
IDEwMDY0NAotLS0gYS9kcml2ZXJzL2RtYS1idWYvdWRtYWJ1Zi5jCisrKyBiL2RyaXZlcnMvZG1h
LWJ1Zi91ZG1hYnVmLmMKQEAgLTE5LDYgKzE5LDcgQEAgc3RydWN0IHVkbWFidWYgewogCXUzMiBm
bGFnczsKIAlwZ29mZl90IHBhZ2Vjb3VudDsKIAlzdHJ1Y3QgcGFnZSAqKnBhZ2VzOworCXN0cnVj
dCBzZ190YWJsZSAqc2c7CiAJc3RydWN0IG1pc2NkZXZpY2UgKnVkbWFidWZfbWlzYzsKIH07CiAK
QEAgLTEwNiw4ICsxMDcsMTIgQEAgc3RhdGljIHZvaWQgdW5tYXBfdWRtYWJ1ZihzdHJ1Y3QgZG1h
X2J1Zl9hdHRhY2htZW50ICphdCwKIHN0YXRpYyB2b2lkIHJlbGVhc2VfdWRtYWJ1ZihzdHJ1Y3Qg
ZG1hX2J1ZiAqYnVmKQogewogCXN0cnVjdCB1ZG1hYnVmICp1YnVmID0gYnVmLT5wcml2OworCXN0
cnVjdCBkZXZpY2UgKmRldiA9IHVidWYtPnVkbWFidWZfbWlzYy0+dGhpc19kZXZpY2U7CiAJcGdv
ZmZfdCBwZzsKIAorCWlmICh1YnVmLT5zZykKKwkJcHV0X3NnX3RhYmxlKGRldiwgdWJ1Zi0+c2cs
IERNQV9CSURJUkVDVElPTkFMKTsKKwogCWZvciAocGcgPSAwOyBwZyA8IHVidWYtPnBhZ2Vjb3Vu
dDsgcGcrKykKIAkJcHV0X3BhZ2UodWJ1Zi0+cGFnZXNbcGddKTsKIAlrZnJlZSh1YnVmLT5wYWdl
cyk7CkBAIC0xMjgsNiArMTMzLDM4IEBAIHN0YXRpYyB2b2lkIGt1bm1hcF91ZG1hYnVmKHN0cnVj
dCBkbWFfYnVmICpidWYsIHVuc2lnbmVkIGxvbmcgcGFnZV9udW0sCiAJa3VubWFwKHZhZGRyKTsK
IH0KIAorc3RhdGljIGludCBiZWdpbl9jcHVfdWRtYWJ1ZihzdHJ1Y3QgZG1hX2J1ZiAqYnVmLAor
CQkJICAgICBlbnVtIGRtYV9kYXRhX2RpcmVjdGlvbiBkaXJlY3Rpb24pCit7CisJc3RydWN0IHVk
bWFidWYgKnVidWYgPSBidWYtPnByaXY7CisJc3RydWN0IGRldmljZSAqZGV2ID0gdWJ1Zi0+dWRt
YWJ1Zl9taXNjLT50aGlzX2RldmljZTsKKworCWlmICghdWJ1Zi0+c2cpIHsKKwkJdWJ1Zi0+c2cg
PSBnZXRfc2dfdGFibGUoZGV2LCBidWYsIGRpcmVjdGlvbik7CisJCWlmIChJU19FUlIodWJ1Zi0+
c2cpKQorCQkJcmV0dXJuIFBUUl9FUlIodWJ1Zi0+c2cpOworCX0gZWxzZSB7CisJCWRtYV9zeW5j
X3NnX2Zvcl9kZXZpY2UoZGV2LCB1YnVmLT5zZy0+c2dsLAorCQkJCSAgICAgICB1YnVmLT5zZy0+
bmVudHMsCisJCQkJICAgICAgIGRpcmVjdGlvbik7CisJfQorCisJcmV0dXJuIDA7Cit9CisKK3N0
YXRpYyBpbnQgZW5kX2NwdV91ZG1hYnVmKHN0cnVjdCBkbWFfYnVmICpidWYsCisJCQkgICBlbnVt
IGRtYV9kYXRhX2RpcmVjdGlvbiBkaXJlY3Rpb24pCit7CisJc3RydWN0IHVkbWFidWYgKnVidWYg
PSBidWYtPnByaXY7CisJc3RydWN0IGRldmljZSAqZGV2ID0gdWJ1Zi0+dWRtYWJ1Zl9taXNjLT50
aGlzX2RldmljZTsKKworCWlmICghdWJ1Zi0+c2cpCisJCXJldHVybiAtRUlOVkFMOworCisJZG1h
X3N5bmNfc2dfZm9yX2NwdShkZXYsIHVidWYtPnNnLT5zZ2wsIHVidWYtPnNnLT5uZW50cywgZGly
ZWN0aW9uKTsKKwlyZXR1cm4gMDsKK30KKwogc3RhdGljIGNvbnN0IHN0cnVjdCBkbWFfYnVmX29w
cyB1ZG1hYnVmX29wcyA9IHsKIAkuY2FjaGVfc2d0X21hcHBpbmcgPSB0cnVlLAogCS5tYXBfZG1h
X2J1ZgkgICA9IG1hcF91ZG1hYnVmLApAQCAtMTM2LDYgKzE3Myw4IEBAIHN0YXRpYyBjb25zdCBz
dHJ1Y3QgZG1hX2J1Zl9vcHMgdWRtYWJ1Zl9vcHMgPSB7CiAJLm1hcAkJICAgPSBrbWFwX3VkbWFi
dWYsCiAJLnVubWFwCQkgICA9IGt1bm1hcF91ZG1hYnVmLAogCS5tbWFwCQkgICA9IG1tYXBfdWRt
YWJ1ZiwKKwkuYmVnaW5fY3B1X2FjY2VzcyAgPSBiZWdpbl9jcHVfdWRtYWJ1ZiwKKwkuZW5kX2Nw
dV9hY2Nlc3MgICAgPSBlbmRfY3B1X3VkbWFidWYsCiB9OwogCiAjZGVmaW5lIFNFQUxTX1dBTlRF
RCAoRl9TRUFMX1NIUklOSykKLS0gCjIuMTcuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4v
bGlzdGluZm8vZHJpLWRldmVs
