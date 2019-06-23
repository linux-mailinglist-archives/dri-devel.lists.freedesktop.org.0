Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BCC014FDA4
	for <lists+dri-devel@lfdr.de>; Sun, 23 Jun 2019 20:32:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 72D2289958;
	Sun, 23 Jun 2019 18:32:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x841.google.com (mail-qt1-x841.google.com
 [IPv6:2607:f8b0:4864:20::841])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 73B1F89824
 for <dri-devel@lists.freedesktop.org>; Sun, 23 Jun 2019 17:38:04 +0000 (UTC)
Received: by mail-qt1-x841.google.com with SMTP id j19so12134531qtr.12
 for <dri-devel@lists.freedesktop.org>; Sun, 23 Jun 2019 10:38:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=pU2ySpgeuPIDehUiqqbX8/63SN6HD4vkGtCiMTUdjZo=;
 b=ObjDXojGXASm0V4FlCTn3ZIV8pbsTj8HvkL+U1IEswQRNhnqEu5MOTmVLxcSHsrNN5
 QohfZ2N6PamTPlYs/zi9GE5BS+TCdr9aNDBWTxtw3pj8PdYM6eaxT7bgUd2YYnoY0T/d
 Lr4EmizE/v67J8PpUPP8+6rB0fcXS5bN5fCBNoKw5wLcOJ4BAXN2mxXOPxYWqfi/KwaQ
 rn8cbiJRJc4+6PObu1WeZOx43EhSSgVjPglFJLqG69su2+8kqkAfFwZnmgAEbMBup2Vk
 4u+ASYpZT4zU2mPSLFSIGTtktKdGejAp+DheVsVfiHcXOPcAc5ibH6S9C6fXy2Qd7seA
 wA1Q==
X-Gm-Message-State: APjAAAUYG310YOTuhPhv51RoXkymnlcCL2NPXV1GqhyksVPanTNgCWgI
 YUzIywLCk1sjDUX0Sv9zZu8=
X-Google-Smtp-Source: APXvYqyTZWTsrXwrIZibYOusfJL78o9yLKMY/cHHOd0dx04WanYQvMb/lt5vUtmyvIHDzHPgAtqQ5w==
X-Received: by 2002:a0c:818f:: with SMTP id 15mr26657878qvd.162.1561311483688; 
 Sun, 23 Jun 2019 10:38:03 -0700 (PDT)
Received: from localhost.localdomain (ppp91-79-162-197.pppoe.mtu-net.ru.
 [91.79.162.197])
 by smtp.gmail.com with ESMTPSA id c55sm5342498qtk.53.2019.06.23.10.38.02
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 23 Jun 2019 10:38:03 -0700 (PDT)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH v1 3/3] drm/tegra: vic: Use common helpers to attach/detach
 from IOMMU domain
Date: Sun, 23 Jun 2019 20:37:43 +0300
Message-Id: <20190623173743.24088-3-digetx@gmail.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190623173743.24088-1-digetx@gmail.com>
References: <20190623173743.24088-1-digetx@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Sun, 23 Jun 2019 18:32:00 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=pU2ySpgeuPIDehUiqqbX8/63SN6HD4vkGtCiMTUdjZo=;
 b=kkueY8ivVKNH+tWI8+mgANJNDQk80xpHteXLuYEKu+lR1WYRUseu4LuAVB74j8fXqW
 Y5zo0vxu/p5xBjvtGK649WCz5M2jPoI6k94WYGaW3yAY0BMF52cvGkRZ0IkQGHuM9e7m
 9Z6fA559SeuiSSw7YCjb0X9vuW6H1T5miQZI0qiL6zEWwu5PqvD3zxmuppBGc5qACIIi
 /8cwmppSsalGvtm2Seork2xRsAcdcWQ3562Y8ObQtIPomQ0dXP7dcb7RwXyT/1VgAZC6
 jSgz1FJmJoR7AX+pmdBVZnDaA4OUwPp+YCc4TYAI3+nuL9cwOo8nTR/k+hcuXxtjJ2sE
 o1tQ==
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
Cc: linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

V2Ugbm93IGhhdmUgaGVscGVycyBmb3IgdGhlIGRvbWFpbidzIGF0dGFjaG1lbnQsIGxldCdzIHVz
ZSB0aGVtLgoKU2lnbmVkLW9mZi1ieTogRG1pdHJ5IE9zaXBlbmtvIDxkaWdldHhAZ21haWwuY29t
PgotLS0KIGRyaXZlcnMvZ3B1L2RybS90ZWdyYS92aWMuYyB8IDI3ICsrKysrKysrLS0tLS0tLS0t
LS0tLS0tLS0tLQogMSBmaWxlIGNoYW5nZWQsIDggaW5zZXJ0aW9ucygrKSwgMTkgZGVsZXRpb25z
KC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3RlZ3JhL3ZpYy5jIGIvZHJpdmVycy9n
cHUvZHJtL3RlZ3JhL3ZpYy5jCmluZGV4IDk4MmNlMzdlY2RlMS4uYmFhMDBkYTc4MGQwIDEwMDY0
NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vdGVncmEvdmljLmMKKysrIGIvZHJpdmVycy9ncHUvZHJt
L3RlZ3JhL3ZpYy5jCkBAIC0zNiw3ICszNiw3IEBAIHN0cnVjdCB2aWMgewogCXZvaWQgX19pb21l
bSAqcmVnczsKIAlzdHJ1Y3QgdGVncmFfZHJtX2NsaWVudCBjbGllbnQ7CiAJc3RydWN0IGhvc3Qx
eF9jaGFubmVsICpjaGFubmVsOwotCXN0cnVjdCBpb21tdV9kb21haW4gKmRvbWFpbjsKKwlzdHJ1
Y3QgaW9tbXVfZ3JvdXAgKmdyb3VwOwogCXN0cnVjdCBkZXZpY2UgKmRldjsKIAlzdHJ1Y3QgY2xr
ICpjbGs7CiAJc3RydWN0IHJlc2V0X2NvbnRyb2wgKnJzdDsKQEAgLTE4MywyMSArMTgzLDE2IEBA
IHN0YXRpYyBjb25zdCBzdHJ1Y3QgZmFsY29uX29wcyB2aWNfZmFsY29uX29wcyA9IHsKIHN0YXRp
YyBpbnQgdmljX2luaXQoc3RydWN0IGhvc3QxeF9jbGllbnQgKmNsaWVudCkKIHsKIAlzdHJ1Y3Qg
dGVncmFfZHJtX2NsaWVudCAqZHJtID0gaG9zdDF4X3RvX2RybV9jbGllbnQoY2xpZW50KTsKLQlz
dHJ1Y3QgaW9tbXVfZ3JvdXAgKmdyb3VwID0gaW9tbXVfZ3JvdXBfZ2V0KGNsaWVudC0+ZGV2KTsK
IAlzdHJ1Y3QgZHJtX2RldmljZSAqZGV2ID0gZGV2X2dldF9kcnZkYXRhKGNsaWVudC0+cGFyZW50
KTsKIAlzdHJ1Y3QgdGVncmFfZHJtICp0ZWdyYSA9IGRldi0+ZGV2X3ByaXZhdGU7CiAJc3RydWN0
IHZpYyAqdmljID0gdG9fdmljKGRybSk7CiAJaW50IGVycjsKIAotCWlmIChncm91cCAmJiB0ZWdy
YS0+ZG9tYWluKSB7Ci0JCWVyciA9IGlvbW11X2F0dGFjaF9ncm91cCh0ZWdyYS0+ZG9tYWluLCBn
cm91cCk7Ci0JCWlmIChlcnIgPCAwKSB7Ci0JCQlkZXZfZXJyKHZpYy0+ZGV2LCAiZmFpbGVkIHRv
IGF0dGFjaCB0byBkb21haW46ICVkXG4iLAotCQkJCWVycik7Ci0JCQlyZXR1cm4gZXJyOwotCQl9
Ci0KLQkJdmljLT5kb21haW4gPSB0ZWdyYS0+ZG9tYWluOworCXZpYy0+Z3JvdXAgPSBob3N0MXhf
Y2xpZW50X2lvbW11X2F0dGFjaChjbGllbnQsIGZhbHNlKTsKKwlpZiAoSVNfRVJSKHZpYy0+Z3Jv
dXApKSB7CisJCWVyciA9IFBUUl9FUlIodmljLT5ncm91cCk7CisJCWRldl9lcnIoY2xpZW50LT5k
ZXYsICJmYWlsZWQgdG8gYXR0YWNoIHRvIGRvbWFpbjogJWRcbiIsIGVycik7CisJCXJldHVybiBl
cnI7CiAJfQogCiAJdmljLT5jaGFubmVsID0gaG9zdDF4X2NoYW5uZWxfcmVxdWVzdChjbGllbnQt
PmRldik7CkBAIC0yMjMsOCArMjE4LDcgQEAgc3RhdGljIGludCB2aWNfaW5pdChzdHJ1Y3QgaG9z
dDF4X2NsaWVudCAqY2xpZW50KQogZnJlZV9jaGFubmVsOgogCWhvc3QxeF9jaGFubmVsX3B1dCh2
aWMtPmNoYW5uZWwpOwogZGV0YWNoOgotCWlmIChncm91cCAmJiB0ZWdyYS0+ZG9tYWluKQotCQlp
b21tdV9kZXRhY2hfZ3JvdXAodGVncmEtPmRvbWFpbiwgZ3JvdXApOworCWhvc3QxeF9jbGllbnRf
aW9tbXVfZGV0YWNoKGNsaWVudCwgdmljLT5ncm91cCwgZmFsc2UpOwogCiAJcmV0dXJuIGVycjsK
IH0KQEAgLTIzMiw3ICsyMjYsNiBAQCBzdGF0aWMgaW50IHZpY19pbml0KHN0cnVjdCBob3N0MXhf
Y2xpZW50ICpjbGllbnQpCiBzdGF0aWMgaW50IHZpY19leGl0KHN0cnVjdCBob3N0MXhfY2xpZW50
ICpjbGllbnQpCiB7CiAJc3RydWN0IHRlZ3JhX2RybV9jbGllbnQgKmRybSA9IGhvc3QxeF90b19k
cm1fY2xpZW50KGNsaWVudCk7Ci0Jc3RydWN0IGlvbW11X2dyb3VwICpncm91cCA9IGlvbW11X2dy
b3VwX2dldChjbGllbnQtPmRldik7CiAJc3RydWN0IGRybV9kZXZpY2UgKmRldiA9IGRldl9nZXRf
ZHJ2ZGF0YShjbGllbnQtPnBhcmVudCk7CiAJc3RydWN0IHRlZ3JhX2RybSAqdGVncmEgPSBkZXYt
PmRldl9wcml2YXRlOwogCXN0cnVjdCB2aWMgKnZpYyA9IHRvX3ZpYyhkcm0pOwpAQCAtMjQ0LDEx
ICsyMzcsNyBAQCBzdGF0aWMgaW50IHZpY19leGl0KHN0cnVjdCBob3N0MXhfY2xpZW50ICpjbGll
bnQpCiAKIAlob3N0MXhfc3luY3B0X2ZyZWUoY2xpZW50LT5zeW5jcHRzWzBdKTsKIAlob3N0MXhf
Y2hhbm5lbF9wdXQodmljLT5jaGFubmVsKTsKLQotCWlmICh2aWMtPmRvbWFpbikgewotCQlpb21t
dV9kZXRhY2hfZ3JvdXAodmljLT5kb21haW4sIGdyb3VwKTsKLQkJdmljLT5kb21haW4gPSBOVUxM
OwotCX0KKwlob3N0MXhfY2xpZW50X2lvbW11X2RldGFjaChjbGllbnQsIHZpYy0+Z3JvdXAsIGZh
bHNlKTsKIAogCXJldHVybiAwOwogfQotLSAKMi4yMi4wCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZl
bEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFp
bG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
