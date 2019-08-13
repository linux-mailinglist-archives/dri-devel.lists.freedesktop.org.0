Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3967A8E6E7
	for <lists+dri-devel@lfdr.de>; Thu, 15 Aug 2019 10:37:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 054766E947;
	Thu, 15 Aug 2019 08:35:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-xc49.google.com (mail-yw1-xc49.google.com
 [IPv6:2607:f8b0:4864:20::c49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 74E7F89CD5
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Aug 2019 11:03:55 +0000 (UTC)
Received: by mail-yw1-xc49.google.com with SMTP id b195so79030306ywa.16
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Aug 2019 04:03:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=rNr4ZPVQiRY9460rK+p/RjWfP2XiBB6EuRKjHiRo/qQ=;
 b=Ydo4nyZdAN5hfEVDl+uvb2BD4mBXyQ/ZLiC0SA4r7SgT9eMeXyHHGuyyOkyLWnFyxr
 P7kJmL7ZVgUG3BCpr7irwpEYrsu0CR7CFVCU7lZP1GOI0mT0fmDQKutSbLvdpRpRPVGI
 4rJVHLcS2jGAQXEhFEDMBhjJA215imuvDnlwc9tbn/fV8Z3I0S6T6/jnZ/awUGvluPX2
 Lug46BC+PnzqHV6zyUITTDL2XgmvbAP8MN698rCc4a1Mmg699ZgSI6/28EqZcfAiGBfW
 dduWa4M50sMhmVSahuBjjtoJ2fHfDoGzkTI/ry+FK47XFZXOLzM31L8k6rCO69XSiawG
 m/iQ==
X-Gm-Message-State: APjAAAX0uUh2LkMj7DKuf31zMdPfKvOg9+nbCCqn9/ExWwI5f2LUxL7S
 zuj38hVjUYg4IZ5Yxqxq7CWKhPaFeYzmOxfDGv4KouUuV59AhNsgo0/LMIBEd4O+CQBvaIOuvDH
 ooDkODyGxr/1rO2XNpjjigzAqgZW2OIrU4aDcT6MJw/fkYv2aKcojWeEcsI+9fd8TMQSXV+Iuiw
 ==
X-Google-Smtp-Source: APXvYqzy3zyQSUtSJVRsXoVnBQExctrAHwWmKhG2weYA8xtqjiHkmA3bvc5GEwy/WQBRR+/id9TXLsPcW2M=
X-Received: by 2002:a81:9a93:: with SMTP id
 r141mr23669458ywg.469.1565694234480; 
 Tue, 13 Aug 2019 04:03:54 -0700 (PDT)
Date: Tue, 13 Aug 2019 13:02:35 +0200
In-Reply-To: <20190813110300.83025-1-darekm@google.com>
Message-Id: <20190813110300.83025-4-darekm@google.com>
Mime-Version: 1.0
References: <20190813110300.83025-1-darekm@google.com>
X-Mailer: git-send-email 2.23.0.rc1.153.gdeed80330f-goog
Subject: [PATCH v6 3/8] tda9950: use cec_notifier_cec_adap_(un)register
From: Dariusz Marcinkiewicz <darekm@google.com>
To: dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org, 
 hverkuil-cisco@xs4all.nl
X-Mailman-Approved-At: Thu, 15 Aug 2019 08:34:55 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20161025;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc;
 bh=rNr4ZPVQiRY9460rK+p/RjWfP2XiBB6EuRKjHiRo/qQ=;
 b=NB+nNxe2i9JPeP5p/K3KwWw72d/gd1uAP87BwA5SC2DlTXUqmewM1VyxSaR/9zpTfX
 7252HzgBSDCjnVqh52se43BMYdzuatZhL6hR56buIzY9Jz8wwkNXPWsdY/AoFp5c/BYo
 VfR7yjbue1o7BScHyYP/bEXF14+ByQOpyog/7bcoebzAU9mb66yCwNTn1me8pPEHrtOT
 f9suboV6sUrFWc3rm1bUAmvUNDJ4A4u60KC5LeWvHRCfYH8XrUpH4LeN4tvLbSu0qLw1
 bj3x4VBU070oy/BglfWGr4XnP43adYy7D+bKnt2eu9kc7X2ZCvwouORwwAN5eqIsGDl2
 LNOA==
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
Cc: Kate Stewart <kstewart@linuxfoundation.org>,
 Kees Cook <keescook@chromium.org>, David Airlie <airlied@linux.ie>,
 open list <linux-kernel@vger.kernel.org>, Hans Verkuil <hverkuil@xs4all.nl>,
 Russell King <rmk+kernel@armlinux.org.uk>,
 Colin Ian King <colin.king@canonical.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 Dariusz Marcinkiewicz <darekm@google.com>,
 Allison Randal <allison@lohutok.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VXNlIHRoZSBuZXcgY2VjX25vdGlmaWVyX2NlY19hZGFwXyh1bilyZWdpc3RlcigpIGZ1bmN0aW9u
cyB0bwoodW4pcmVnaXN0ZXIgdGhlIG5vdGlmaWVyIGZvciB0aGUgQ0VDIGFkYXB0ZXIuCgpTaWdu
ZWQtb2ZmLWJ5OiBEYXJpdXN6IE1hcmNpbmtpZXdpY3ogPGRhcmVrbUBnb29nbGUuY29tPgpTaWdu
ZWQtb2ZmLWJ5OiBIYW5zIFZlcmt1aWwgPGh2ZXJrdWlsLWNpc2NvQHhzNGFsbC5ubD4KVGVzdGVk
LWJ5OiBIYW5zIFZlcmt1aWwgPGh2ZXJrdWlsLWNpc2NvQHhzNGFsbC5ubD4KLS0tCiBkcml2ZXJz
L2dwdS9kcm0vaTJjL3RkYTk5NTAuYyB8IDEyICsrKysrKy0tLS0tLQogMSBmaWxlIGNoYW5nZWQs
IDYgaW5zZXJ0aW9ucygrKSwgNiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dw
dS9kcm0vaTJjL3RkYTk5NTAuYyBiL2RyaXZlcnMvZ3B1L2RybS9pMmMvdGRhOTk1MC5jCmluZGV4
IDgwMzlmYzBkODNkYjQuLmE1YTc1YmRlYjdhNWYgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2Ry
bS9pMmMvdGRhOTk1MC5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9pMmMvdGRhOTk1MC5jCkBAIC00
MjAsNyArNDIwLDggQEAgc3RhdGljIGludCB0ZGE5OTUwX3Byb2JlKHN0cnVjdCBpMmNfY2xpZW50
ICpjbGllbnQsCiAJCXByaXYtPmhkbWkgPSBnbHVlLT5wYXJlbnQ7CiAKIAlwcml2LT5hZGFwID0g
Y2VjX2FsbG9jYXRlX2FkYXB0ZXIoJnRkYTk5NTBfY2VjX29wcywgcHJpdiwgInRkYTk5NTAiLAot
CQkJCQkgIENFQ19DQVBfREVGQVVMVFMsCisJCQkJCSAgQ0VDX0NBUF9ERUZBVUxUUyB8CisJCQkJ
CSAgQ0VDX0NBUF9DT05ORUNUT1JfSU5GTywKIAkJCQkJICBDRUNfTUFYX0xPR19BRERSUyk7CiAJ
aWYgKElTX0VSUihwcml2LT5hZGFwKSkKIAkJcmV0dXJuIFBUUl9FUlIocHJpdi0+YWRhcCk7CkBA
IC00NTcsMTMgKzQ1OCwxNCBAQCBzdGF0aWMgaW50IHRkYTk5NTBfcHJvYmUoc3RydWN0IGkyY19j
bGllbnQgKmNsaWVudCwKIAlpZiAocmV0IDwgMCkKIAkJcmV0dXJuIHJldDsKIAotCXByaXYtPm5v
dGlmeSA9IGNlY19ub3RpZmllcl9nZXQocHJpdi0+aGRtaSk7CisJcHJpdi0+bm90aWZ5ID0gY2Vj
X25vdGlmaWVyX2NlY19hZGFwX3JlZ2lzdGVyKHByaXYtPmhkbWksIE5VTEwsCisJCQkJCQkgICAg
ICBwcml2LT5hZGFwKTsKIAlpZiAoIXByaXYtPm5vdGlmeSkKIAkJcmV0dXJuIC1FTk9NRU07CiAK
IAlyZXQgPSBjZWNfcmVnaXN0ZXJfYWRhcHRlcihwcml2LT5hZGFwLCBwcml2LT5oZG1pKTsKIAlp
ZiAocmV0IDwgMCkgewotCQljZWNfbm90aWZpZXJfcHV0KHByaXYtPm5vdGlmeSk7CisJCWNlY19u
b3RpZmllcl9jZWNfYWRhcF91bnJlZ2lzdGVyKHByaXYtPm5vdGlmeSk7CiAJCXJldHVybiByZXQ7
CiAJfQogCkBAIC00NzMsOCArNDc1LDYgQEAgc3RhdGljIGludCB0ZGE5OTUwX3Byb2JlKHN0cnVj
dCBpMmNfY2xpZW50ICpjbGllbnQsCiAJICovCiAJZGV2bV9yZW1vdmVfYWN0aW9uKGRldiwgdGRh
OTk1MF9jZWNfZGVsLCBwcml2KTsKIAotCWNlY19yZWdpc3Rlcl9jZWNfbm90aWZpZXIocHJpdi0+
YWRhcCwgcHJpdi0+bm90aWZ5KTsKLQogCXJldHVybiAwOwogfQogCkBAIC00ODIsOCArNDgyLDgg
QEAgc3RhdGljIGludCB0ZGE5OTUwX3JlbW92ZShzdHJ1Y3QgaTJjX2NsaWVudCAqY2xpZW50KQog
ewogCXN0cnVjdCB0ZGE5OTUwX3ByaXYgKnByaXYgPSBpMmNfZ2V0X2NsaWVudGRhdGEoY2xpZW50
KTsKIAorCWNlY19ub3RpZmllcl9jZWNfYWRhcF91bnJlZ2lzdGVyKHByaXYtPm5vdGlmeSk7CiAJ
Y2VjX3VucmVnaXN0ZXJfYWRhcHRlcihwcml2LT5hZGFwKTsKLQljZWNfbm90aWZpZXJfcHV0KHBy
aXYtPm5vdGlmeSk7CiAKIAlyZXR1cm4gMDsKIH0KLS0gCjIuMjMuMC5yYzEuMTUzLmdkZWVkODAz
MzBmLWdvb2cKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
