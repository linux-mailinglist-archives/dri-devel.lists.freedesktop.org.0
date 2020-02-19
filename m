Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BB89E1641BF
	for <lists+dri-devel@lfdr.de>; Wed, 19 Feb 2020 11:23:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ECE8A6EB86;
	Wed, 19 Feb 2020 10:22:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 387C16EB6A
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Feb 2020 10:22:26 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id q9so5842924wmj.5
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Feb 2020 02:22:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=tXkudR8aK7IJR2SljNAElZwmO8wxlaOwEYcl+XSJ+VU=;
 b=cXqemjNDFGLjSzx7iAP0izzqlaupE0KdKNUvLI15bw45Cy7BoefWeNzqjDge5V40Pl
 RjnF7WlI87YlCpnd+tZR2enSBYXzz75hrdBiUH+sSomNd9sbwbwcLCzaY34s5GKZvhAD
 QjkGI5fBIciqJjRf6/gVoerA6vhBEOoNuGOaw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=tXkudR8aK7IJR2SljNAElZwmO8wxlaOwEYcl+XSJ+VU=;
 b=tedCGyz2VeP+dPhvLxPESHR4ZhCYwn/S3R9n3x1EU+48P3s4zNVgFwpLcp2MEaqGPR
 boz3vnFEtspiM6VJFZRvkpUmkmmEDopLracTI9mv8r6+DP/46Jc7dWLkysDjI6itqDF5
 Hz1Vz0ZHJJTh60838cGvo7Fes1PAXARk41tcIG24I8Myr45b9jVbOBm04RFgrccJg7hY
 yVItbUZ96lda7hSmHlYkZi1DgDAY8tRFePqPsFIdbwywMVQgLY7LmSj91hVXbiClsnyS
 bIBvA8EL5DlclLcB9mjnR+4d7IXI63w4HBmE7vqFDTfeH8cKPmQjj+zHlbHeRe7G/IPL
 tGAg==
X-Gm-Message-State: APjAAAX59VvPX7Uq5Fl+yLdhIhJTaRPEN68Eg625+U8WWf0cxCTxVSJX
 8BVsduH0ppNXvP9XNXVQG4ar7kxHhlg=
X-Google-Smtp-Source: APXvYqwMYFxbQ5MZqZR/XFDSYqJOAHOwWhA68Sr2W+qaRwE+qqo7pKpmq/FWki/7EXuWT3jcAqVWMA==
X-Received: by 2002:a1c:ac46:: with SMTP id v67mr8893954wme.153.1582107744520; 
 Wed, 19 Feb 2020 02:22:24 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id s23sm2370339wra.15.2020.02.19.02.22.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Feb 2020 02:22:24 -0800 (PST)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH 45/52] drm/gm12u320: Use helpers for shutdown/suspend/resume
Date: Wed, 19 Feb 2020 11:21:15 +0100
Message-Id: <20200219102122.1607365-46-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200219102122.1607365-1-daniel.vetter@ffwll.ch>
References: <20200219102122.1607365-1-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Hans de Goede <hdegoede@redhat.com>, Daniel Vetter <daniel.vetter@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QWxzbyB0aGVyZSdzIGEgcmFjZSBpbiB0aGUgZGlzY29ubmVjdCBpbXBsZW1lbmF0aW9uLiBGaXJz
dCBzaHV0CmRvd24sIHRoZW4gdW5wbHVnLCBsZWF2ZXMgYSB3aW5kb3cgd2hlcmUgdXNlcnNwYWNl
IGNvdWxkIHNuZWFrCmluIGFuZCByZXN0YXJ0IHRoZSBlbnRpcmUgbWFjaGluZXJ5LgoKV2l0aCB0
aGlzIHdlIGNhbiBhbHNvIGRlbGV0ZSB0aGUgdmVyeSB1bi1hdG9taWMgZ2xvYmFsIHBpcGVfZW5h
YmxlZAp0cmFja2luZy4KClNpZ25lZC1vZmYtYnk6IERhbmllbCBWZXR0ZXIgPGRhbmllbC52ZXR0
ZXJAaW50ZWwuY29tPgpDYzogSGFucyBkZSBHb2VkZSA8aGRlZ29lZGVAcmVkaGF0LmNvbT4KQ2M6
ICJOb3JhbGYgVHLDuG5uZXMiIDxub3JhbGZAdHJvbm5lcy5vcmc+Ci0tLQogZHJpdmVycy9ncHUv
ZHJtL3RpbnkvZ20xMnUzMjAuYyB8IDE2ICsrKy0tLS0tLS0tLS0tLS0KIDEgZmlsZSBjaGFuZ2Vk
LCAzIGluc2VydGlvbnMoKyksIDEzIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMv
Z3B1L2RybS90aW55L2dtMTJ1MzIwLmMgYi9kcml2ZXJzL2dwdS9kcm0vdGlueS9nbTEydTMyMC5j
CmluZGV4IDY1ZGZiODdjY2IxMy4uYzIyYjJlZTQ3MGViIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dw
dS9kcm0vdGlueS9nbTEydTMyMC5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS90aW55L2dtMTJ1MzIw
LmMKQEAgLTg4LDcgKzg4LDYgQEAgc3RydWN0IGdtMTJ1MzIwX2RldmljZSB7CiAJc3RydWN0IHVz
Yl9kZXZpY2UgICAgICAgICAgICAgICAqdWRldjsKIAl1bnNpZ25lZCBjaGFyICAgICAgICAgICAg
ICAgICAgICpjbWRfYnVmOwogCXVuc2lnbmVkIGNoYXIgICAgICAgICAgICAgICAgICAgKmRhdGFf
YnVmW0dNMTJVMzIwX0JMT0NLX0NPVU5UXTsKLQlib29sICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICBwaXBlX2VuYWJsZWQ7CiAJc3RydWN0IHsKIAkJYm9vbCAgICAgICAgICAgICAgICAgICAg
IHJ1bjsKIAkJc3RydWN0IHdvcmtxdWV1ZV9zdHJ1Y3QgKndvcmtxOwpAQCAtNTg5LDcgKzU4OCw2
IEBAIHN0YXRpYyB2b2lkIGdtMTJ1MzIwX3BpcGVfZW5hYmxlKHN0cnVjdCBkcm1fc2ltcGxlX2Rp
c3BsYXlfcGlwZSAqcGlwZSwKIAogCWdtMTJ1MzIwX2ZiX21hcmtfZGlydHkocGxhbmVfc3RhdGUt
PmZiLCAmcmVjdCk7CiAJZ20xMnUzMjBfc3RhcnRfZmJfdXBkYXRlKGdtMTJ1MzIwKTsKLQlnbTEy
dTMyMC0+cGlwZV9lbmFibGVkID0gdHJ1ZTsKIH0KIAogc3RhdGljIHZvaWQgZ20xMnUzMjBfcGlw
ZV9kaXNhYmxlKHN0cnVjdCBkcm1fc2ltcGxlX2Rpc3BsYXlfcGlwZSAqcGlwZSkKQEAgLTU5Nyw3
ICs1OTUsNiBAQCBzdGF0aWMgdm9pZCBnbTEydTMyMF9waXBlX2Rpc2FibGUoc3RydWN0IGRybV9z
aW1wbGVfZGlzcGxheV9waXBlICpwaXBlKQogCXN0cnVjdCBnbTEydTMyMF9kZXZpY2UgKmdtMTJ1
MzIwID0gcGlwZS0+Y3J0Yy5kZXYtPmRldl9wcml2YXRlOwogCiAJZ20xMnUzMjBfc3RvcF9mYl91
cGRhdGUoZ20xMnUzMjApOwotCWdtMTJ1MzIwLT5waXBlX2VuYWJsZWQgPSBmYWxzZTsKIH0KIAog
c3RhdGljIHZvaWQgZ20xMnUzMjBfcGlwZV91cGRhdGUoc3RydWN0IGRybV9zaW1wbGVfZGlzcGxh
eV9waXBlICpwaXBlLApAQCAtNzMzLDIyICs3MzAsMTcgQEAgc3RhdGljIGludCBnbTEydTMyMF91
c2JfcHJvYmUoc3RydWN0IHVzYl9pbnRlcmZhY2UgKmludGVyZmFjZSwKIHN0YXRpYyB2b2lkIGdt
MTJ1MzIwX3VzYl9kaXNjb25uZWN0KHN0cnVjdCB1c2JfaW50ZXJmYWNlICppbnRlcmZhY2UpCiB7
CiAJc3RydWN0IGRybV9kZXZpY2UgKmRldiA9IHVzYl9nZXRfaW50ZmRhdGEoaW50ZXJmYWNlKTsK
LQlzdHJ1Y3QgZ20xMnUzMjBfZGV2aWNlICpnbTEydTMyMCA9IGRldi0+ZGV2X3ByaXZhdGU7CiAK
LQlnbTEydTMyMF9zdG9wX2ZiX3VwZGF0ZShnbTEydTMyMCk7CiAJZHJtX2Rldl91bnBsdWcoZGV2
KTsKKwlkcm1fYXRvbWljX2hlbHBlcl9zaHV0ZG93bihkZXYpOwogfQogCiBzdGF0aWMgX19tYXli
ZV91bnVzZWQgaW50IGdtMTJ1MzIwX3N1c3BlbmQoc3RydWN0IHVzYl9pbnRlcmZhY2UgKmludGVy
ZmFjZSwKIAkJCQkJICAgcG1fbWVzc2FnZV90IG1lc3NhZ2UpCiB7CiAJc3RydWN0IGRybV9kZXZp
Y2UgKmRldiA9IHVzYl9nZXRfaW50ZmRhdGEoaW50ZXJmYWNlKTsKLQlzdHJ1Y3QgZ20xMnUzMjBf
ZGV2aWNlICpnbTEydTMyMCA9IGRldi0+ZGV2X3ByaXZhdGU7CiAKLQlpZiAoZ20xMnUzMjAtPnBp
cGVfZW5hYmxlZCkKLQkJZ20xMnUzMjBfc3RvcF9mYl91cGRhdGUoZ20xMnUzMjApOwotCi0JcmV0
dXJuIDA7CisJcmV0dXJuIGRybV9tb2RlX2NvbmZpZ19oZWxwZXJfc3VzcGVuZChkZXYpOwogfQog
CiBzdGF0aWMgX19tYXliZV91bnVzZWQgaW50IGdtMTJ1MzIwX3Jlc3VtZShzdHJ1Y3QgdXNiX2lu
dGVyZmFjZSAqaW50ZXJmYWNlKQpAQCAtNzU3LDEwICs3NDksOCBAQCBzdGF0aWMgX19tYXliZV91
bnVzZWQgaW50IGdtMTJ1MzIwX3Jlc3VtZShzdHJ1Y3QgdXNiX2ludGVyZmFjZSAqaW50ZXJmYWNl
KQogCXN0cnVjdCBnbTEydTMyMF9kZXZpY2UgKmdtMTJ1MzIwID0gZGV2LT5kZXZfcHJpdmF0ZTsK
IAogCWdtMTJ1MzIwX3NldF9lY29tb2RlKGdtMTJ1MzIwKTsKLQlpZiAoZ20xMnUzMjAtPnBpcGVf
ZW5hYmxlZCkKLQkJZ20xMnUzMjBfc3RhcnRfZmJfdXBkYXRlKGdtMTJ1MzIwKTsKIAotCXJldHVy
biAwOworCXJldHVybiBkcm1fbW9kZV9jb25maWdfaGVscGVyX3Jlc3VtZShkZXYpOwogfQogCiBz
dGF0aWMgY29uc3Qgc3RydWN0IHVzYl9kZXZpY2VfaWQgaWRfdGFibGVbXSA9IHsKLS0gCjIuMjQu
MQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRl
dmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8v
bGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
