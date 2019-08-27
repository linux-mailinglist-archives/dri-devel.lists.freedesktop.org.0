Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C53F9F542
	for <lists+dri-devel@lfdr.de>; Tue, 27 Aug 2019 23:41:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7425289307;
	Tue, 27 Aug 2019 21:41:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com
 [IPv6:2607:f8b0:4864:20::643])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 86EE089307;
 Tue, 27 Aug 2019 21:41:18 +0000 (UTC)
Received: by mail-pl1-x643.google.com with SMTP id y8so165700plr.12;
 Tue, 27 Aug 2019 14:41:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=7+fSbMopRLMnridzw1P8dzUFCbFj/uVg1P8Nkx1MHXg=;
 b=qY9bTb0QaCRItB0iYBVNwnKTL9oqpZlgB7MVlyGZob1S/6rL5HurlbRtIkLP4+wuvg
 uYOemxcWwOf+LqbqqfPncLpFMrx66MVOkB6MkIu8lYqn3vU+DV8KEPYxHo8M4gkjODIN
 hzNeR1r9DnY58Vy38Sh1RTALCO7rlHyQiUxit7kzmVbHEJ6oKVwAbwFbRMz4OyGR/QxG
 r8gPCXTemOdDvL20xGO9vnHuBY+w7n6mZSSKRfHp2GZs5TowCJPx9pmYj83eLS8xjICz
 yMP/5BTxB8wOy6iP25dc9jnTTzNB/y7voceiXiuRlQkamUCpBSwZJOeN4jiD5KBSRqK8
 +3uQ==
X-Gm-Message-State: APjAAAU3/BBOQE4EUN5I1o7o5pp29iP88etVSBj5DowUuiWq7dU+qzNE
 UVMVWWLjei2ec4m0TyDTCaOHWh3BcTk=
X-Google-Smtp-Source: APXvYqynZaMt6R7MTGG7LcwrU+uap8vEDW0FRTXcMmh0PSz5vUl5+Xi9cvqe/DSDwOaBdjdm/XrYKg==
X-Received: by 2002:a17:902:b40f:: with SMTP id
 x15mr1040185plr.101.1566942077825; 
 Tue, 27 Aug 2019 14:41:17 -0700 (PDT)
Received: from localhost ([100.118.89.196])
 by smtp.gmail.com with ESMTPSA id m19sm293202pff.108.2019.08.27.14.41.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Aug 2019 14:41:17 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 2/9] drm/msm/dpu: add real wait_for_commit_done()
Date: Tue, 27 Aug 2019 14:33:32 -0700
Message-Id: <20190827213421.21917-3-robdclark@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190827213421.21917-1-robdclark@gmail.com>
References: <20190827213421.21917-1-robdclark@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=7+fSbMopRLMnridzw1P8dzUFCbFj/uVg1P8Nkx1MHXg=;
 b=Rcg7Rp6khY3tW2TmrSCr+uyiTa9Utqx+bbYWjGBT+biGN2/KR58GcsJewtRl+Ksm1c
 rPLdOQgtnUoFpEDQe2JU9NaZ8w0T0Xn0tpijmSPKor1eboA287tdio+SAA9uLqCoZWD/
 A7/sgqHFoDnxA2zVzwbVHEerzCXNOb974a0nWEi9nY+TxqxeJBlB5g7DQDe8yu9rl5iy
 1+IJmJnQakpvgl+IImkfCTSfi1vaL2HqoESEczvJ2rOsORMtO73nGi+TJ9zYn2qKHNOU
 7iQ0qNm9e5rnXRMTx/RP9nGT0yGSiaUKUkTWQkmQ+ydUhSGBckwUis8xVb5OxE2FRk19
 /IYQ==
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
Cc: Rob Clark <robdclark@chromium.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU"
 <freedreno@lists.freedesktop.org>, David Airlie <airlied@linux.ie>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>, Sean Paul <sean@poorly.run>,
 Thomas Gleixner <tglx@linutronix.de>, Allison Randal <allison@lohutok.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogUm9iIENsYXJrIDxyb2JkY2xhcmtAY2hyb21pdW0ub3JnPgoKSnVzdCB3YWl0aW5nIGZv
ciBuZXh0IHZibGFuayBpc24ndCBpZGVhbC4uIHdlIHNob3VsZCByZWFsbHkgYmUgbG9va2luZwph
dCB0aGUgaHcgRkxVU0ggcmVnaXN0ZXIgdmFsdWUgdG8ga25vdyBpZiB0aGVyZSBpcyBzdGlsbCBh
biBpbi1wcm9ncmVzcwpmbHVzaCB3aXRob3V0IHN0YWxsaW5nIHVubmVjZXNzYXJpbHkgd2hlbiB0
aGVyZSBpcyBubyBwZW5kaW5nIGZsdXNoLgoKU2lnbmVkLW9mZi1ieTogUm9iIENsYXJrIDxyb2Jk
Y2xhcmtAY2hyb21pdW0ub3JnPgotLS0KIC4uLi9kcm0vbXNtL2Rpc3AvZHB1MS9kcHVfZW5jb2Rl
cl9waHlzX3ZpZC5jICB8IDIyICsrKysrKysrKysrKysrKysrKy0KIDEgZmlsZSBjaGFuZ2VkLCAy
MSBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUv
ZHJtL21zbS9kaXNwL2RwdTEvZHB1X2VuY29kZXJfcGh5c192aWQuYyBiL2RyaXZlcnMvZ3B1L2Ry
bS9tc20vZGlzcC9kcHUxL2RwdV9lbmNvZGVyX3BoeXNfdmlkLmMKaW5kZXggNzM3ZmU5NjNhNDkw
Li43YzczYjA5ODk0ZjAgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9tc20vZGlzcC9kcHUx
L2RwdV9lbmNvZGVyX3BoeXNfdmlkLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL21zbS9kaXNwL2Rw
dTEvZHB1X2VuY29kZXJfcGh5c192aWQuYwpAQCAtNTI2LDYgKzUyNiwyNiBAQCBzdGF0aWMgaW50
IGRwdV9lbmNvZGVyX3BoeXNfdmlkX3dhaXRfZm9yX3ZibGFuaygKIAlyZXR1cm4gX2RwdV9lbmNv
ZGVyX3BoeXNfdmlkX3dhaXRfZm9yX3ZibGFuayhwaHlzX2VuYywgdHJ1ZSk7CiB9CiAKK3N0YXRp
YyBpbnQgZHB1X2VuY29kZXJfcGh5c192aWRfd2FpdF9mb3JfY29tbWl0X2RvbmUoCisJCXN0cnVj
dCBkcHVfZW5jb2Rlcl9waHlzICpwaHlzX2VuYykKK3sKKwlzdHJ1Y3QgZHB1X2h3X2N0bCAqaHdf
Y3RsID0gcGh5c19lbmMtPmh3X2N0bDsKKwlpbnQgcmV0OworCisJaWYgKCFod19jdGwpCisJCXJl
dHVybiAwOworCisJcmV0ID0gd2FpdF9ldmVudF90aW1lb3V0KHBoeXNfZW5jLT5wZW5kaW5nX2tp
Y2tvZmZfd3EsCisJCShod19jdGwtPm9wcy5nZXRfZmx1c2hfcmVnaXN0ZXIoaHdfY3RsKSA9PSAw
KSwKKwkJbXNlY3NfdG9famlmZmllcyg1MCkpOworCWlmIChyZXQgPD0gMCkgeworCQlEUFVfRVJS
T1IoInZibGFuayB0aW1lb3V0XG4iKTsKKwkJcmV0dXJuIC1FVElNRURPVVQ7CisJfQorCisJcmV0
dXJuIDA7Cit9CisKIHN0YXRpYyB2b2lkIGRwdV9lbmNvZGVyX3BoeXNfdmlkX3ByZXBhcmVfZm9y
X2tpY2tvZmYoCiAJCXN0cnVjdCBkcHVfZW5jb2Rlcl9waHlzICpwaHlzX2VuYykKIHsKQEAgLTY3
Niw3ICs2OTYsNyBAQCBzdGF0aWMgdm9pZCBkcHVfZW5jb2Rlcl9waHlzX3ZpZF9pbml0X29wcyhz
dHJ1Y3QgZHB1X2VuY29kZXJfcGh5c19vcHMgKm9wcykKIAlvcHMtPmRlc3Ryb3kgPSBkcHVfZW5j
b2Rlcl9waHlzX3ZpZF9kZXN0cm95OwogCW9wcy0+Z2V0X2h3X3Jlc291cmNlcyA9IGRwdV9lbmNv
ZGVyX3BoeXNfdmlkX2dldF9od19yZXNvdXJjZXM7CiAJb3BzLT5jb250cm9sX3ZibGFua19pcnEg
PSBkcHVfZW5jb2Rlcl9waHlzX3ZpZF9jb250cm9sX3ZibGFua19pcnE7Ci0Jb3BzLT53YWl0X2Zv
cl9jb21taXRfZG9uZSA9IGRwdV9lbmNvZGVyX3BoeXNfdmlkX3dhaXRfZm9yX3ZibGFuazsKKwlv
cHMtPndhaXRfZm9yX2NvbW1pdF9kb25lID0gZHB1X2VuY29kZXJfcGh5c192aWRfd2FpdF9mb3Jf
Y29tbWl0X2RvbmU7CiAJb3BzLT53YWl0X2Zvcl92YmxhbmsgPSBkcHVfZW5jb2Rlcl9waHlzX3Zp
ZF93YWl0X2Zvcl92Ymxhbms7CiAJb3BzLT53YWl0X2Zvcl90eF9jb21wbGV0ZSA9IGRwdV9lbmNv
ZGVyX3BoeXNfdmlkX3dhaXRfZm9yX3ZibGFuazsKIAlvcHMtPmlycV9jb250cm9sID0gZHB1X2Vu
Y29kZXJfcGh5c192aWRfaXJxX2NvbnRyb2w7Ci0tIAoyLjIxLjAKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJp
LWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
