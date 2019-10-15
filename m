Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A964D7BF4
	for <lists+dri-devel@lfdr.de>; Tue, 15 Oct 2019 18:39:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B0BF46E85C;
	Tue, 15 Oct 2019 16:38:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F5738958E;
 Tue, 15 Oct 2019 10:11:04 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id v17so19614478wml.4;
 Tue, 15 Oct 2019 03:11:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=WvSHBpX9lS7H/7h03OBUZGWizg4wyuzQ6h+W62egxjQ=;
 b=c2aUzdHTd0PbEx/ykX7CNoCHYMvTXp94pldGORUy/wSRNwFlwadyjh8wxdlAKX1b5k
 KCPM1DWI/+6g5j3MNziA2UJfYSpdbJRfBbNoNDX7+hz8W0CXRZ9AVfNxCZYBoqACp9ww
 KknVLTj3mZhUZjQDte7eI1TD5Io7VUy/kUzMU9js1g0QIogE/4bB2rjQZsnWXYZVfNeu
 wRizztxu+1lONDCjXmgZjsA0EVNdbBlAKubojS7vb3vCD7X3j2Zkhja3RxFJKDe3iDI6
 O0ugyx3IjlvU9kNjjnJU01geAY8JySu5xfXL8d+qIj3Aasx+wppRzpS3AxOnTP4mW7jx
 eA4g==
X-Gm-Message-State: APjAAAWH465pnTxA00P20R+o0yVDo7vdp3uCeo8teL3fENKAGs1Cmb7e
 dlFY6ipP6e6wQPmSQHD8y4Q=
X-Google-Smtp-Source: APXvYqwaRv8ZYQC8dAYjJc6iVKtoY8zuWRF0nJk+OnWTd2Ku/I5N1E6aLiEh9IxXvvzNWM2HsNdcGw==
X-Received: by 2002:a7b:c413:: with SMTP id k19mr19955698wmi.175.1571134262527; 
 Tue, 15 Oct 2019 03:11:02 -0700 (PDT)
Received: from IcarusMOD.eternityproject.eu ([93.51.16.173])
 by smtp.gmail.com with ESMTPSA id y186sm42778837wmd.26.2019.10.15.03.11.01
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 15 Oct 2019 03:11:02 -0700 (PDT)
From: kholk11@gmail.com
To: linux-arm-msm@vger.kernel.org
Subject: [PATCH v3 1/7] drm/msm/mdp5: Add optional TBU and TBU_RT clocks
Date: Tue, 15 Oct 2019 12:10:52 +0200
Message-Id: <20191015101058.37157-2-kholk11@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191015101058.37157-1-kholk11@gmail.com>
References: <20191015101058.37157-1-kholk11@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 15 Oct 2019 16:38:12 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=WvSHBpX9lS7H/7h03OBUZGWizg4wyuzQ6h+W62egxjQ=;
 b=eyWWTg+jLxtt84nZoM5D4rcr+PH8MheESX0TLZRqE997hzCQdhz8dLvGO1VIIvIR7k
 MYDiERgsu9eEtbsu+2xlQ0ddekGD3+1i2qdFjDIg+NsDWJj0Ov3CWAJMGIZiEBdqhVt8
 vDFRVm7pRnp85QftR8jftnJWImEweu+8K8Fca9lRFVtjugbvev3io6jZz1Bk/6Sv58oG
 pMVLkwOShw0uczWIyZmjNOdasg+kdkbz+NQbdzlQdG2eEnPvhRrQuZMg/v4/I4baEQBy
 BLrFyqJJ0ICw4XY+aAA57VJcDR3u1u9h4ywlyUqRs9pV8tixLkUnuAYH0QIh9WgdQmbq
 XGRg==
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
Cc: mark.rutland@arm.com, freedreno@lists.freedesktop.org, marijns95@gmail.com,
 jonathan@marek.ca, airlied@linux.ie, gregkh@linuxfoundation.org,
 dri-devel@lists.freedesktop.org, bjorn.andersson@linaro.org,
 robh+dt@kernel.org, tglx@linutronix.de, kholk11@gmail.com, sean@poorly.run,
 georgi.djakov@linaro.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogQW5nZWxvR2lvYWNjaGlubyBEZWwgUmVnbm8gPGtob2xrMTFAZ21haWwuY29tPgoKU29t
ZSBTb0NzLCBsaWtlIE1TTTg5NTYvODk3NiAoYW5kIEFQUSB2YXJpYW50cyksIGRvIGZlYXR1cmUg
dGhlc2UKY2xvY2tzIGFuZCB3ZSBuZWVkIHRvIGVuYWJsZSB0aGVtIGluIG9yZGVyIHRvIGdldCBi
b3RoIG9mIHRoZQpodyAobWRwNS9yb3QpIFRyYW5zbGF0aW9uIEJ1ZmZlciBVbml0cyAoVEJVcykg
dG8gcHJvcGVybHkgd29yay4KClNpZ25lZC1vZmYtYnk6IEFuZ2Vsb0dpb2FjY2hpbm8gRGVsIFJl
Z25vIDxraG9sazExQGdtYWlsLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vbXNtL2Rpc3AvbWRw
NS9tZHA1X2ttcy5jIHwgMTAgKysrKysrKysrKwogZHJpdmVycy9ncHUvZHJtL21zbS9kaXNwL21k
cDUvbWRwNV9rbXMuaCB8ICAyICsrCiAyIGZpbGVzIGNoYW5nZWQsIDEyIGluc2VydGlvbnMoKykK
CmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbXNtL2Rpc3AvbWRwNS9tZHA1X2ttcy5jIGIv
ZHJpdmVycy9ncHUvZHJtL21zbS9kaXNwL21kcDUvbWRwNV9rbXMuYwppbmRleCA1NDc2ODkyYTMz
NWYuLmU0M2VjZDRiZTEwYSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL21zbS9kaXNwL21k
cDUvbWRwNV9rbXMuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vbXNtL2Rpc3AvbWRwNS9tZHA1X2tt
cy5jCkBAIC0zMDksNiArMzA5LDEwIEBAIGludCBtZHA1X2Rpc2FibGUoc3RydWN0IG1kcDVfa21z
ICptZHA1X2ttcykKIAltZHA1X2ttcy0+ZW5hYmxlX2NvdW50LS07CiAJV0FSTl9PTihtZHA1X2tt
cy0+ZW5hYmxlX2NvdW50IDwgMCk7CiAKKwlpZiAobWRwNV9rbXMtPnRidV9ydF9jbGspCisJCWNs
a19kaXNhYmxlX3VucHJlcGFyZShtZHA1X2ttcy0+dGJ1X3J0X2Nsayk7CisJaWYgKG1kcDVfa21z
LT50YnVfY2xrKQorCQljbGtfZGlzYWJsZV91bnByZXBhcmUobWRwNV9rbXMtPnRidV9jbGspOwog
CWNsa19kaXNhYmxlX3VucHJlcGFyZShtZHA1X2ttcy0+YWhiX2Nsayk7CiAJY2xrX2Rpc2FibGVf
dW5wcmVwYXJlKG1kcDVfa21zLT5heGlfY2xrKTsKIAljbGtfZGlzYWJsZV91bnByZXBhcmUobWRw
NV9rbXMtPmNvcmVfY2xrKTsKQEAgLTMyOSw2ICszMzMsMTAgQEAgaW50IG1kcDVfZW5hYmxlKHN0
cnVjdCBtZHA1X2ttcyAqbWRwNV9rbXMpCiAJY2xrX3ByZXBhcmVfZW5hYmxlKG1kcDVfa21zLT5j
b3JlX2Nsayk7CiAJaWYgKG1kcDVfa21zLT5sdXRfY2xrKQogCQljbGtfcHJlcGFyZV9lbmFibGUo
bWRwNV9rbXMtPmx1dF9jbGspOworCWlmIChtZHA1X2ttcy0+dGJ1X2NsaykKKwkJY2xrX3ByZXBh
cmVfZW5hYmxlKG1kcDVfa21zLT50YnVfY2xrKTsKKwlpZiAobWRwNV9rbXMtPnRidV9ydF9jbGsp
CisJCWNsa19wcmVwYXJlX2VuYWJsZShtZHA1X2ttcy0+dGJ1X3J0X2Nsayk7CiAKIAlyZXR1cm4g
MDsKIH0KQEAgLTk2NSw2ICs5NzMsOCBAQCBzdGF0aWMgaW50IG1kcDVfaW5pdChzdHJ1Y3QgcGxh
dGZvcm1fZGV2aWNlICpwZGV2LCBzdHJ1Y3QgZHJtX2RldmljZSAqZGV2KQogCiAJLyogb3B0aW9u
YWwgY2xvY2tzOiAqLwogCWdldF9jbGsocGRldiwgJm1kcDVfa21zLT5sdXRfY2xrLCAibHV0Iiwg
ZmFsc2UpOworCWdldF9jbGsocGRldiwgJm1kcDVfa21zLT50YnVfY2xrLCAidGJ1IiwgZmFsc2Up
OworCWdldF9jbGsocGRldiwgJm1kcDVfa21zLT50YnVfcnRfY2xrLCAidGJ1X3J0IiwgZmFsc2Up
OwogCiAJLyogd2UgbmVlZCB0byBzZXQgYSBkZWZhdWx0IHJhdGUgYmVmb3JlIGVuYWJsaW5nLiAg
U2V0IGEgc2FmZQogCSAqIHJhdGUgZmlyc3QsIHRoZW4gZmlndXJlIG91dCBodyByZXZpc2lvbiwg
YW5kIHRoZW4gc2V0IGEKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9tc20vZGlzcC9tZHA1
L21kcDVfa21zLmggYi9kcml2ZXJzL2dwdS9kcm0vbXNtL2Rpc3AvbWRwNS9tZHA1X2ttcy5oCmlu
ZGV4IGQxYmY0ZmRmYzgxNS4uMTI4ODY2NzQyNTkzIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9k
cm0vbXNtL2Rpc3AvbWRwNS9tZHA1X2ttcy5oCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9tc20vZGlz
cC9tZHA1L21kcDVfa21zLmgKQEAgLTUzLDYgKzUzLDggQEAgc3RydWN0IG1kcDVfa21zIHsKIAlz
dHJ1Y3QgY2xrICphaGJfY2xrOwogCXN0cnVjdCBjbGsgKmNvcmVfY2xrOwogCXN0cnVjdCBjbGsg
Kmx1dF9jbGs7CisJc3RydWN0IGNsayAqdGJ1X2NsazsKKwlzdHJ1Y3QgY2xrICp0YnVfcnRfY2xr
OwogCXN0cnVjdCBjbGsgKnZzeW5jX2NsazsKIAogCS8qCi0tIAoyLjIxLjAKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxp
c3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
