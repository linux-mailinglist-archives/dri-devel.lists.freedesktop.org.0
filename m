Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F1C510F494
	for <lists+dri-devel@lfdr.de>; Tue,  3 Dec 2019 02:36:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0DAF56E147;
	Tue,  3 Dec 2019 01:36:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com
 [IPv6:2607:f8b0:4864:20::644])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B62E6E25D
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Dec 2019 01:36:42 +0000 (UTC)
Received: by mail-pl1-x644.google.com with SMTP id ay6so941735plb.0
 for <dri-devel@lists.freedesktop.org>; Mon, 02 Dec 2019 17:36:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=LICdhzdPL2HSftzAOCs7MLzTsFAWvzORdwz9P5dMvlA=;
 b=XG1qgn4uWMkiaxS1c8hTrYV13BAwXhykUQNUebcPsVsod/PweiUzjIp+Er5m3gEleJ
 1PZj6jJ4kHaxYsrfQragEXDkJF5kgNuysGHdge7PjGge2IqQ4J4Q7sFpOrOgcYva1Gv8
 EAlzYBq6slyJbMqdJ2ZlsMkEe5sZKFYCNn6z5M6P2gjzwC7x1LnJcwxkGMRopev63++5
 dxmexVqj5q5ODjl1ym+lbFYE/PP7fg8oVM7Q6rzPFzbyRP1N8yVS8vjfTjXFFHU+cqlZ
 gGfuX/eXr6pBJfrM/Ap3KOhlyIBKp7oyEa/2CK6jp+8FD/7K8TF5Un2WUWD7kLAWqKBI
 hq5g==
X-Gm-Message-State: APjAAAUtL5dR5SRyiOb25K0ovIZGscVcxWG0gjQA8Kqlnqx8iVMEELI5
 xxaa7ptJGAqDgtZC/ryt+2eaREhqJ0g=
X-Google-Smtp-Source: APXvYqxDfa5iKKsbrpvlvX8fhBHYdMswm4nGazoq4NlHIq8ZBJKRQMMTPcxGZCscL0e+sbekHGdS3A==
X-Received: by 2002:a17:902:7b82:: with SMTP id
 w2mr2420352pll.92.1575337001558; 
 Mon, 02 Dec 2019 17:36:41 -0800 (PST)
Received: from gurchetansingh0.mtv.corp.google.com
 ([2620:15c:202:201:bc97:5740:52a7:6875])
 by smtp.gmail.com with ESMTPSA id r4sm581916pji.11.2019.12.02.17.36.40
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Mon, 02 Dec 2019 17:36:41 -0800 (PST)
From: Gurchetan Singh <gurchetansingh@chromium.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 3/4] udmabuf: separate out creating/destroying scatter-table
Date: Mon,  2 Dec 2019 17:36:26 -0800
Message-Id: <20191203013627.85991-3-gurchetansingh@chromium.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191203013627.85991-1-gurchetansingh@chromium.org>
References: <20191203013627.85991-1-gurchetansingh@chromium.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=LICdhzdPL2HSftzAOCs7MLzTsFAWvzORdwz9P5dMvlA=;
 b=mS5zaMwU/sZmEUX/WkMrz/LIFmrqQarkFTQtjni4vznUW4G5/V1XLmnXXEOCtEuEKT
 46P4Fvj0m5QL0rmq+kikGkBWvCUsEweLUoUOXOOhDGlddeeWa1RvAdopKD6iQtxpa5Mg
 LgROWS5XR/Z0dKPW/PO7CSMAavNZD6iFzKyek=
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

VGhlc2UgYXJlIG5pY2UgZnVuY3Rpb25zIGFuZCBjYW4gYmUgcmUtdXNlZC4KClNpZ25lZC1vZmYt
Ynk6IEd1cmNoZXRhbiBTaW5naCA8Z3VyY2hldGFuc2luZ2hAY2hyb21pdW0ub3JnPgotLS0KIGRy
aXZlcnMvZG1hLWJ1Zi91ZG1hYnVmLmMgfCAyNiArKysrKysrKysrKysrKysrKysrLS0tLS0tLQog
MSBmaWxlIGNoYW5nZWQsIDE5IGluc2VydGlvbnMoKyksIDcgZGVsZXRpb25zKC0pCgpkaWZmIC0t
Z2l0IGEvZHJpdmVycy9kbWEtYnVmL3VkbWFidWYuYyBiL2RyaXZlcnMvZG1hLWJ1Zi91ZG1hYnVm
LmMKaW5kZXggZjBiZjNiYTc0NDFlLi4wYTYxMGUwOWFlMjMgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMv
ZG1hLWJ1Zi91ZG1hYnVmLmMKKysrIGIvZHJpdmVycy9kbWEtYnVmL3VkbWFidWYuYwpAQCAtNDcs
MTAgKzQ3LDEwIEBAIHN0YXRpYyBpbnQgbW1hcF91ZG1hYnVmKHN0cnVjdCBkbWFfYnVmICpidWYs
IHN0cnVjdCB2bV9hcmVhX3N0cnVjdCAqdm1hKQogCXJldHVybiAwOwogfQogCi1zdGF0aWMgc3Ry
dWN0IHNnX3RhYmxlICptYXBfdWRtYWJ1ZihzdHJ1Y3QgZG1hX2J1Zl9hdHRhY2htZW50ICphdCwK
LQkJCQkgICAgZW51bSBkbWFfZGF0YV9kaXJlY3Rpb24gZGlyZWN0aW9uKQorc3RhdGljIHN0cnVj
dCBzZ190YWJsZSAqZ2V0X3NnX3RhYmxlKHN0cnVjdCBkZXZpY2UgKmRldiwgc3RydWN0IGRtYV9i
dWYgKmJ1ZiwKKwkJCQkgICAgIGVudW0gZG1hX2RhdGFfZGlyZWN0aW9uIGRpcmVjdGlvbikKIHsK
LQlzdHJ1Y3QgdWRtYWJ1ZiAqdWJ1ZiA9IGF0LT5kbWFidWYtPnByaXY7CisJc3RydWN0IHVkbWFi
dWYgKnVidWYgPSBidWYtPnByaXY7CiAJc3RydWN0IHNnX3RhYmxlICpzZzsKIAlpbnQgcmV0Owog
CkBAIC02Miw3ICs2Miw3IEBAIHN0YXRpYyBzdHJ1Y3Qgc2dfdGFibGUgKm1hcF91ZG1hYnVmKHN0
cnVjdCBkbWFfYnVmX2F0dGFjaG1lbnQgKmF0LAogCQkJCQlHRlBfS0VSTkVMKTsKIAlpZiAocmV0
IDwgMCkKIAkJZ290byBlcnI7Ci0JaWYgKCFkbWFfbWFwX3NnKGF0LT5kZXYsIHNnLT5zZ2wsIHNn
LT5uZW50cywgZGlyZWN0aW9uKSkgeworCWlmICghZG1hX21hcF9zZyhkZXYsIHNnLT5zZ2wsIHNn
LT5uZW50cywgZGlyZWN0aW9uKSkgewogCQlyZXQgPSAtRUlOVkFMOwogCQlnb3RvIGVycjsKIAl9
CkBAIC03NCwxMyArNzQsMjUgQEAgc3RhdGljIHN0cnVjdCBzZ190YWJsZSAqbWFwX3VkbWFidWYo
c3RydWN0IGRtYV9idWZfYXR0YWNobWVudCAqYXQsCiAJcmV0dXJuIEVSUl9QVFIocmV0KTsKIH0K
IAorc3RhdGljIHZvaWQgcHV0X3NnX3RhYmxlKHN0cnVjdCBkZXZpY2UgKmRldiwgc3RydWN0IHNn
X3RhYmxlICpzZywKKwkJCSBlbnVtIGRtYV9kYXRhX2RpcmVjdGlvbiBkaXJlY3Rpb24pCit7CisJ
ZG1hX3VubWFwX3NnKGRldiwgc2ctPnNnbCwgc2ctPm5lbnRzLCBkaXJlY3Rpb24pOworCXNnX2Zy
ZWVfdGFibGUoc2cpOworCWtmcmVlKHNnKTsKK30KKworc3RhdGljIHN0cnVjdCBzZ190YWJsZSAq
bWFwX3VkbWFidWYoc3RydWN0IGRtYV9idWZfYXR0YWNobWVudCAqYXQsCisJCQkJICAgIGVudW0g
ZG1hX2RhdGFfZGlyZWN0aW9uIGRpcmVjdGlvbikKK3sKKwlyZXR1cm4gZ2V0X3NnX3RhYmxlKGF0
LT5kZXYsIGF0LT5kbWFidWYsIGRpcmVjdGlvbik7Cit9CisKIHN0YXRpYyB2b2lkIHVubWFwX3Vk
bWFidWYoc3RydWN0IGRtYV9idWZfYXR0YWNobWVudCAqYXQsCiAJCQkgIHN0cnVjdCBzZ190YWJs
ZSAqc2csCiAJCQkgIGVudW0gZG1hX2RhdGFfZGlyZWN0aW9uIGRpcmVjdGlvbikKIHsKLQlkbWFf
dW5tYXBfc2coYXQtPmRldiwgc2ctPnNnbCwgc2ctPm5lbnRzLCBkaXJlY3Rpb24pOwotCXNnX2Zy
ZWVfdGFibGUoc2cpOwotCWtmcmVlKHNnKTsKKwlyZXR1cm4gcHV0X3NnX3RhYmxlKGF0LT5kZXYs
IHNnLCBkaXJlY3Rpb24pOwogfQogCiBzdGF0aWMgdm9pZCByZWxlYXNlX3VkbWFidWYoc3RydWN0
IGRtYV9idWYgKmJ1ZikKLS0gCjIuMjQuMC4zOTMuZzM0ZGMzNDhlYWYtZ29vZwoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcg
bGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRl
c2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
