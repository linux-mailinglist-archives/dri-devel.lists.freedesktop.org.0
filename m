Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E51FD630A
	for <lists+dri-devel@lfdr.de>; Mon, 14 Oct 2019 14:51:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 77A896E2C0;
	Mon, 14 Oct 2019 12:51:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 383656E2C0
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Oct 2019 12:51:12 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id p7so17157896wmp.4
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Oct 2019 05:51:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=B5fuJB7QmtV9h7aBVewhTK71Ks0pgNS4kdo609/xFbo=;
 b=LLREryzL7B+3EGPYryJAuGJsjaOKnIOKd7PGEeOHWpielP9nrp526ZW927GsmRFGfl
 turZlTP5kxZSM1XlboGA3BcmXQisqAeiKw/HN/38qti2QriSs86Q88l7CG3Dmh7TpjRZ
 eRMWa5n1rJN1dLaF9BngI2xvVTFtcUC2qh6uBbbf9iSwdCLWVWERodBc+QS+rA+z6MeH
 WYymjXJXG90Jwlcbur8j95DGM3EKRO7ODEwk+OJHNtjfuIKZwGMFCzJNVnIljvVdNgaT
 T0jE84jDsn7sF/I8g9Odkq8hl+OXRomaru8SOcGgGGtpyZNuFbBSy5ulFhowRbCkB2Ti
 kpyg==
X-Gm-Message-State: APjAAAXsQacAOCWVOYaBy+edKkE1Pd6N97VJ5250n60mipQcIxGhYeu+
 Xlc1Lkko5LNhM466hSGURWs=
X-Google-Smtp-Source: APXvYqxCDvHffZXht1XHuIbS0QlRApgWVwhVUWF+hNratzEVbOVK6iZZnoRmz0hhM8KUZR4o03xguA==
X-Received: by 2002:a1c:1dc9:: with SMTP id d192mr15685966wmd.51.1571057470705; 
 Mon, 14 Oct 2019 05:51:10 -0700 (PDT)
Received: from localhost (p2E5BE2CE.dip0.t-ipconnect.de. [46.91.226.206])
 by smtp.gmail.com with ESMTPSA id a192sm16440048wma.1.2019.10.14.05.51.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Oct 2019 05:51:09 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH 09/14] drm/tegra: vic: Use common IOMMU attach/detach code
Date: Mon, 14 Oct 2019 14:50:44 +0200
Message-Id: <20191014125049.425101-10-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191014125049.425101-1-thierry.reding@gmail.com>
References: <20191014125049.425101-1-thierry.reding@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=B5fuJB7QmtV9h7aBVewhTK71Ks0pgNS4kdo609/xFbo=;
 b=uD7vU7d6OrpaUKwtuchmc0iH50x9zTlPXy7BcOJu4sWXI/SQQ2woE6sEm/DEqC7p1n
 t5RF6Jo+hCWPcJVl5l8AhEWEcVivkgdqVVEgZl1TPZtN2Kx/S4HwH+tkhkBRiTDZxPyo
 VYa2q0F7wCEf3x4dgzkS2OLKnCm22IAZEqDJEZNO+3Yp35cLQQwGwJGDk03BmvH3MKXi
 tuXsqzpUDTXvjtqu7+i3CkiuEV084bh/2vQxvncSjNbE0v+Pc1mwcPAyhhxY+zWcSod1
 syAETGIUdShjefqAwdh5yi085uQ/gOMEIyVZiu+dn1vJIkF8VN+cLxY1fdsa+4Fwokub
 5FgA==
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
Cc: linux-tegra@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogVGhpZXJyeSBSZWRpbmcgPHRyZWRpbmdAbnZpZGlhLmNvbT4KClJldXNlIGNvbW1vbiBj
b2RlIHRvIGF0dGFjaCB0byBvciBkZXRhY2ggZnJvbSBhbiBJT01NVSBkb21haW4uCgpTaWduZWQt
b2ZmLWJ5OiBUaGllcnJ5IFJlZGluZyA8dHJlZGluZ0BudmlkaWEuY29tPgotLS0KIGRyaXZlcnMv
Z3B1L2RybS90ZWdyYS92aWMuYyB8IDI3ICsrKysrKysrLS0tLS0tLS0tLS0tLS0tLS0tLQogMSBm
aWxlIGNoYW5nZWQsIDggaW5zZXJ0aW9ucygrKSwgMTkgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0
IGEvZHJpdmVycy9ncHUvZHJtL3RlZ3JhL3ZpYy5jIGIvZHJpdmVycy9ncHUvZHJtL3RlZ3JhL3Zp
Yy5jCmluZGV4IGQ2MGU0NzljZGU5Mi4uZTRiMTdjN2NlNzA4IDEwMDY0NAotLS0gYS9kcml2ZXJz
L2dwdS9kcm0vdGVncmEvdmljLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL3RlZ3JhL3ZpYy5jCkBA
IC0zNCw3ICszNCw3IEBAIHN0cnVjdCB2aWMgewogCXZvaWQgX19pb21lbSAqcmVnczsKIAlzdHJ1
Y3QgdGVncmFfZHJtX2NsaWVudCBjbGllbnQ7CiAJc3RydWN0IGhvc3QxeF9jaGFubmVsICpjaGFu
bmVsOwotCXN0cnVjdCBpb21tdV9kb21haW4gKmRvbWFpbjsKKwlzdHJ1Y3QgaW9tbXVfZ3JvdXAg
Kmdyb3VwOwogCXN0cnVjdCBkZXZpY2UgKmRldjsKIAlzdHJ1Y3QgY2xrICpjbGs7CiAJc3RydWN0
IHJlc2V0X2NvbnRyb2wgKnJzdDsKQEAgLTE4MywyMSArMTgzLDE2IEBAIHN0YXRpYyBjb25zdCBz
dHJ1Y3QgZmFsY29uX29wcyB2aWNfZmFsY29uX29wcyA9IHsKIHN0YXRpYyBpbnQgdmljX2luaXQo
c3RydWN0IGhvc3QxeF9jbGllbnQgKmNsaWVudCkKIHsKIAlzdHJ1Y3QgdGVncmFfZHJtX2NsaWVu
dCAqZHJtID0gaG9zdDF4X3RvX2RybV9jbGllbnQoY2xpZW50KTsKLQlzdHJ1Y3QgaW9tbXVfZ3Jv
dXAgKmdyb3VwID0gaW9tbXVfZ3JvdXBfZ2V0KGNsaWVudC0+ZGV2KTsKIAlzdHJ1Y3QgZHJtX2Rl
dmljZSAqZGV2ID0gZGV2X2dldF9kcnZkYXRhKGNsaWVudC0+cGFyZW50KTsKIAlzdHJ1Y3QgdGVn
cmFfZHJtICp0ZWdyYSA9IGRldi0+ZGV2X3ByaXZhdGU7CiAJc3RydWN0IHZpYyAqdmljID0gdG9f
dmljKGRybSk7CiAJaW50IGVycjsKIAotCWlmIChncm91cCAmJiB0ZWdyYS0+ZG9tYWluKSB7Ci0J
CWVyciA9IGlvbW11X2F0dGFjaF9ncm91cCh0ZWdyYS0+ZG9tYWluLCBncm91cCk7Ci0JCWlmIChl
cnIgPCAwKSB7Ci0JCQlkZXZfZXJyKHZpYy0+ZGV2LCAiZmFpbGVkIHRvIGF0dGFjaCB0byBkb21h
aW46ICVkXG4iLAotCQkJCWVycik7Ci0JCQlyZXR1cm4gZXJyOwotCQl9Ci0KLQkJdmljLT5kb21h
aW4gPSB0ZWdyYS0+ZG9tYWluOworCXZpYy0+Z3JvdXAgPSBob3N0MXhfY2xpZW50X2lvbW11X2F0
dGFjaChjbGllbnQsIGZhbHNlKTsKKwlpZiAoSVNfRVJSKHZpYy0+Z3JvdXApKSB7CisJCWVyciA9
IFBUUl9FUlIodmljLT5ncm91cCk7CisJCWRldl9lcnIodmljLT5kZXYsICJmYWlsZWQgdG8gYXR0
YWNoIHRvIGRvbWFpbjogJWRcbiIsIGVycik7CisJCXJldHVybiBlcnI7CiAJfQogCiAJdmljLT5j
aGFubmVsID0gaG9zdDF4X2NoYW5uZWxfcmVxdWVzdChjbGllbnQpOwpAQCAtMjI5LDggKzIyNCw3
IEBAIHN0YXRpYyBpbnQgdmljX2luaXQoc3RydWN0IGhvc3QxeF9jbGllbnQgKmNsaWVudCkKIGZy
ZWVfY2hhbm5lbDoKIAlob3N0MXhfY2hhbm5lbF9wdXQodmljLT5jaGFubmVsKTsKIGRldGFjaDoK
LQlpZiAoZ3JvdXAgJiYgdGVncmEtPmRvbWFpbikKLQkJaW9tbXVfZGV0YWNoX2dyb3VwKHRlZ3Jh
LT5kb21haW4sIGdyb3VwKTsKKwlob3N0MXhfY2xpZW50X2lvbW11X2RldGFjaChjbGllbnQsIHZp
Yy0+Z3JvdXApOwogCiAJcmV0dXJuIGVycjsKIH0KQEAgLTIzOCw3ICsyMzIsNiBAQCBzdGF0aWMg
aW50IHZpY19pbml0KHN0cnVjdCBob3N0MXhfY2xpZW50ICpjbGllbnQpCiBzdGF0aWMgaW50IHZp
Y19leGl0KHN0cnVjdCBob3N0MXhfY2xpZW50ICpjbGllbnQpCiB7CiAJc3RydWN0IHRlZ3JhX2Ry
bV9jbGllbnQgKmRybSA9IGhvc3QxeF90b19kcm1fY2xpZW50KGNsaWVudCk7Ci0Jc3RydWN0IGlv
bW11X2dyb3VwICpncm91cCA9IGlvbW11X2dyb3VwX2dldChjbGllbnQtPmRldik7CiAJc3RydWN0
IGRybV9kZXZpY2UgKmRldiA9IGRldl9nZXRfZHJ2ZGF0YShjbGllbnQtPnBhcmVudCk7CiAJc3Ry
dWN0IHRlZ3JhX2RybSAqdGVncmEgPSBkZXYtPmRldl9wcml2YXRlOwogCXN0cnVjdCB2aWMgKnZp
YyA9IHRvX3ZpYyhkcm0pOwpAQCAtMjUzLDExICsyNDYsNyBAQCBzdGF0aWMgaW50IHZpY19leGl0
KHN0cnVjdCBob3N0MXhfY2xpZW50ICpjbGllbnQpCiAKIAlob3N0MXhfc3luY3B0X2ZyZWUoY2xp
ZW50LT5zeW5jcHRzWzBdKTsKIAlob3N0MXhfY2hhbm5lbF9wdXQodmljLT5jaGFubmVsKTsKLQot
CWlmICh2aWMtPmRvbWFpbikgewotCQlpb21tdV9kZXRhY2hfZ3JvdXAodmljLT5kb21haW4sIGdy
b3VwKTsKLQkJdmljLT5kb21haW4gPSBOVUxMOwotCX0KKwlob3N0MXhfY2xpZW50X2lvbW11X2Rl
dGFjaChjbGllbnQsIHZpYy0+Z3JvdXApOwogCiAJcmV0dXJuIDA7CiB9Ci0tIAoyLjIzLjAKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBt
YWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
