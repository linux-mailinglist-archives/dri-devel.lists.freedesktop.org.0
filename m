Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9389C8E6B7
	for <lists+dri-devel@lfdr.de>; Thu, 15 Aug 2019 10:36:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F37D26E928;
	Thu, 15 Aug 2019 08:35:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb4a.google.com (mail-yb1-xb4a.google.com
 [IPv6:2607:f8b0:4864:20::b4a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5FECF6E48C
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Aug 2019 10:45:58 +0000 (UTC)
Received: by mail-yb1-xb4a.google.com with SMTP id 15so19145142ybj.12
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Aug 2019 03:45:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=rNr4ZPVQiRY9460rK+p/RjWfP2XiBB6EuRKjHiRo/qQ=;
 b=taYiOc2gjQIop7K+eUVL0X2hiYFkEkIQ+2njMiMj5R/0+wxeMtHSjHqs7I9yoLvh0o
 HrLWeY6fChI2NTGng2Ng/rO6yz81Pu7OVnjIxs7hkN+j5wxosgyMPGAb6Y70C0edrvsa
 CXTWrAMBI3qaw8ZXa3xuewdCFb7QCtDNTLrSQEUjpdcw+QlB5PAItOkZ5ft5Ynk/uAcQ
 /VhWOIo4HW5XmHKOFNT/LwLw3HKvDUDBAWuY5TU7fdZVMlQHrQ8rf8LnUEvIaWBy2Y3V
 I5H0REg1ED+zXe8XhDX0Ykc98GaHNCUmz3bqFtiXbNJgpxcHiRJLlFb62Dm5SQtsr8wj
 RcjQ==
X-Gm-Message-State: APjAAAVE/nNowEh5ciOehLu80kTuodYWWm6C5veHoJUQKez2TfSjtP2c
 GsjPzVr9+2MAkXo+rvBzsgbOVc2zve5pPyc4GlNQu0v7NsesP/4tTs/SIabSFY6NfM1O3WUGZQd
 XpTvqFaIZv5A9gBSggpI/68t+Pob2dSQGjdhqsV8HTBymXLE0r5arX55Ccoa2JcFip5pue/ntIg
 ==
X-Google-Smtp-Source: APXvYqz8wuc7rzzPcMc9pN4pp2/JhTt0TqdoYblYW39TykuwcgtmhPOpuh0zTFZfEq05jYjRSZf+uFC6HSU=
X-Received: by 2002:a81:70c7:: with SMTP id
 l190mr20647337ywc.280.1565779557384; 
 Wed, 14 Aug 2019 03:45:57 -0700 (PDT)
Date: Wed, 14 Aug 2019 12:45:02 +0200
In-Reply-To: <20190814104520.6001-1-darekm@google.com>
Message-Id: <20190814104520.6001-5-darekm@google.com>
Mime-Version: 1.0
References: <20190814104520.6001-1-darekm@google.com>
X-Mailer: git-send-email 2.23.0.rc1.153.gdeed80330f-goog
Subject: [PATCH v7 4/9] tda9950: use cec_notifier_cec_adap_(un)register
From: Dariusz Marcinkiewicz <darekm@google.com>
To: dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org, 
 hverkuil-cisco@xs4all.nl
X-Mailman-Approved-At: Thu, 15 Aug 2019 08:34:55 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20161025;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc;
 bh=rNr4ZPVQiRY9460rK+p/RjWfP2XiBB6EuRKjHiRo/qQ=;
 b=JpSL21bCCCvwbK2FjwB7E/jnKcDm9D41KjRfUN/ZMV7CAuObTU2sAjHT/9QBhYs1vA
 I0O2sbz4SZhkiL3bvhimKAowi+0b9jhvA+I9Qoyx0qUQxXPKNMHSGGg6PAoC31fKpGDk
 FaHmng7SEUEvXHHxyzi2lpMXoBFZK/QNPB3aEwjAnDzaTOQ/oiT1Ex7XJAR8Z0EEt+uA
 eZP4Vgt9tLhRZySmfka/MsnvyU6VjakU63Vc0P/Jcq03iFvt8kJ1LEwzecXQN9yLJa8z
 wJzSIzXSAO3eKnLA1Tbl6K0ZnzkKBZpHSkmkivhlLZOryY7AcVuDJ21jFv9c4oyt82L+
 6nww==
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
Cc: David Airlie <airlied@linux.ie>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 Hans Verkuil <hverkuil@xs4all.nl>, Russell King <rmk+kernel@armlinux.org.uk>,
 Colin Ian King <colin.king@canonical.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 Dariusz Marcinkiewicz <darekm@google.com>, Enrico Weigelt <info@metux.net>
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
