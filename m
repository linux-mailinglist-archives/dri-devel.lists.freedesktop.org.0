Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 68D262B40C
	for <lists+dri-devel@lfdr.de>; Mon, 27 May 2019 14:04:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF45A89ABE;
	Mon, 27 May 2019 12:03:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-xe41.google.com (mail-vs1-xe41.google.com
 [IPv6:2607:f8b0:4864:20::e41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E7EF06E102
 for <dri-devel@lists.freedesktop.org>; Fri, 24 May 2019 12:33:19 +0000 (UTC)
Received: by mail-vs1-xe41.google.com with SMTP id l20so5611437vsp.3
 for <dri-devel@lists.freedesktop.org>; Fri, 24 May 2019 05:33:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=yIpPNoIC1GN9SZAPFrAZ1DEWNYJLtZRJh/8Vm70kdQY=;
 b=arssCvL7/i1fyLhikBTuObE0Fgcq9ddHZimEzcKmqTIQrAomcReC+tPdYAKqMJ9zR9
 73UNm8hDwcIKb8pEbzIiHD21EUBaOYvdXr9mxgoNZRB4YMBBHYqAQCQdLteA2IWjU060
 0ngLCyzAFqoBbkgkwDWVvww/w3H0wlOVAf/y8rsFECcF5Ktd9eXx+OCkDquwi1kokcJ3
 kpVaJBJmM0X0cCYKQ6Rn7nnzIEb+xHXxgEBJuP8GnqVyLrN+myNN7CbvHv6Vgzta53UA
 clbKVu4yyOyuPsRVGf3AWU+P+22MzHVVsXFHs13WknRoyvGLeu3uTnpYuygkDuoTKgFs
 +FAg==
X-Gm-Message-State: APjAAAUIksEj8jCNiFUoKVOZRydV8kUUNet1mqyYw2kRIaKGbfRPzicD
 NEgdet9KtsJYDymDK3hL7r9YnFWCE8M=
X-Google-Smtp-Source: APXvYqxocOPWqazKpYvK52ldaWs3QWs6ADA0TDILFcNg/N/v82vBtE3OmFd+neCaIGMF4lnF+tWsWQ==
X-Received: by 2002:a67:f245:: with SMTP id y5mr44003746vsm.210.1558701198882; 
 Fri, 24 May 2019 05:33:18 -0700 (PDT)
Received: from Qians-MBP.fios-router.home
 (pool-71-184-117-43.bstnma.fios.verizon.net. [71.184.117.43])
 by smtp.gmail.com with ESMTPSA id o66sm661717vke.17.2019.05.24.05.33.17
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Fri, 24 May 2019 05:33:18 -0700 (PDT)
From: Qian Cai <cai@lca.pw>
To: airlied@linux.ie,
	daniel@ffwll.ch
Subject: [PATCH v2] drm/vmwgfx: fix a warning due to missing dma_parms
Date: Fri, 24 May 2019 08:33:03 -0400
Message-Id: <20190524123303.915-1-cai@lca.pw>
X-Mailer: git-send-email 2.20.1 (Apple Git-117)
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 27 May 2019 12:03:54 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lca.pw; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=yIpPNoIC1GN9SZAPFrAZ1DEWNYJLtZRJh/8Vm70kdQY=;
 b=h5Wo0W4wYQSNbEtBUOtEjv2mFS7sx5PLQyT6f+FgCDnFqm4c/BA8RLbPBKn2W0vncJ
 HREMO01fI1VIGxVlRczxWVnh93X0XJsdP46jPef2BpqFNB4JceGw/Ux1MLwQBefwPjR6
 BK8GbyWL1/+EzqZYeYQWCanHYPdSnOoXJjngj8z9u139FabvHux0wch3HBjZaLBL1p0j
 ob/Sf6P1iESiqMwF9mkfhW1i+ZjuvzuJXRnfT5IK4PGNkVAYqO0orlv2gU2T7ug8jnpM
 wiqOkTu7Gi4c6KAR9V2kYsgs+MaSfjbA0Vyg2mKlYYF8PizoVrrWOSCvdbO670Fxduz9
 kCkg==
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
Cc: thellstrom@vmware.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-graphics-maintainer@vmware.com,
 Qian Cai <cai@lca.pw>, robin.murphy@arm.com, hch@lst.de,
 m.szyprowski@samsung.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Qm9vdGluZyB1cCB3aXRoIERNQV9BUElfREVCVUdfU0c9eSBnZW5lcmF0ZXMgYSB3YXJuaW5nIGR1
ZSB0byB0aGUgZHJpdmVyCmZvcmdvdCB0byBzZXQgZG1hX3Bhcm1zIGFwcHJvcHJpYXRlbHkuIFNl
dCBpdCBqdXN0IGFmdGVyIHZtd19kbWFfbWFza3MoKQppbiB2bXdfZHJpdmVyX2xvYWQoKS4KCkRN
QS1BUEk6IHZtd2dmeCAwMDAwOjAwOjBmLjA6IG1hcHBpbmcgc2cgc2VnbWVudCBsb25nZXIgdGhh
biBkZXZpY2UKY2xhaW1zIHRvIHN1cHBvcnQgW2xlbj0yMDk3MTUyXSBbbWF4PTY1NTM2XQpXQVJO
SU5HOiBDUFU6IDIgUElEOiAyNjEgYXQga2VybmVsL2RtYS9kZWJ1Zy5jOjEyMzIKZGVidWdfZG1h
X21hcF9zZysweDM2MC8weDQ4MApIYXJkd2FyZSBuYW1lOiBWTXdhcmUsIEluYy4gVk13YXJlIFZp
cnR1YWwgUGxhdGZvcm0vNDQwQlggRGVza3RvcApSZWZlcmVuY2UgUGxhdGZvcm0sIEJJT1MgNi4w
MCAwNC8xMy8yMDE4ClJJUDogMDAxMDpkZWJ1Z19kbWFfbWFwX3NnKzB4MzYwLzB4NDgwCkNhbGwg
VHJhY2U6CiB2bXdfdHRtX21hcF9kbWErMHgzYjEvMHg1YjAgW3Ztd2dmeF0KIHZtd19ib19tYXBf
ZG1hKzB4MjUvMHgzMCBbdm13Z2Z4XQogdm13X290YWJsZXNfc2V0dXArMHgyYTgvMHg3NTAgW3Zt
d2dmeF0KIHZtd19yZXF1ZXN0X2RldmljZV9sYXRlKzB4NzgvMHhjMCBbdm13Z2Z4XQogdm13X3Jl
cXVlc3RfZGV2aWNlKzB4ZWUvMHg0ZTAgW3Ztd2dmeF0KIHZtd19kcml2ZXJfbG9hZC5jb2xkKzB4
NzU3LzB4ZDg0IFt2bXdnZnhdCiBkcm1fZGV2X3JlZ2lzdGVyKzB4MWZmLzB4MzQwIFtkcm1dCiBk
cm1fZ2V0X3BjaV9kZXYrMHgxMTAvMHgyOTAgW2RybV0KIHZtd19wcm9iZSsweDE1LzB4MjAgW3Zt
d2dmeF0KIGxvY2FsX3BjaV9wcm9iZSsweDdhLzB4YzAKIHBjaV9kZXZpY2VfcHJvYmUrMHgxYjkv
MHgyOTAKIHJlYWxseV9wcm9iZSsweDFiNS8weDYzMAogZHJpdmVyX3Byb2JlX2RldmljZSsweGEz
LzB4MWEwCiBkZXZpY2VfZHJpdmVyX2F0dGFjaCsweDk0LzB4YTAKIF9fZHJpdmVyX2F0dGFjaCsw
eGRkLzB4MWMwCiBidXNfZm9yX2VhY2hfZGV2KzB4ZmUvMHgxNTAKIGRyaXZlcl9hdHRhY2grMHgy
ZC8weDQwCiBidXNfYWRkX2RyaXZlcisweDI5MC8weDM1MAogZHJpdmVyX3JlZ2lzdGVyKzB4ZGMv
MHgxZDAKIF9fcGNpX3JlZ2lzdGVyX2RyaXZlcisweGRhLzB4ZjAKIHZtd2dmeF9pbml0KzB4MzQv
MHgxMDAwIFt2bXdnZnhdCiBkb19vbmVfaW5pdGNhbGwrMHhlNS8weDQwYQogZG9faW5pdF9tb2R1
bGUrMHgxMGYvMHgzYTAKIGxvYWRfbW9kdWxlKzB4MTZhNS8weDFhNDAKIF9fc2Vfc3lzX2Zpbml0
X21vZHVsZSsweDE4My8weDFjMAogX194NjRfc3lzX2Zpbml0X21vZHVsZSsweDQzLzB4NTAKIGRv
X3N5c2NhbGxfNjQrMHhjOC8weDYwNgogZW50cnlfU1lTQ0FMTF82NF9hZnRlcl9od2ZyYW1lKzB4
NDQvMHhhOQoKRml4ZXM6IGZiMWQ5NzM4Y2EwNSAoImRybS92bXdnZng6IEFkZCBEUk0gZHJpdmVy
IGZvciBWTXdhcmUgVmlydHVhbCBHUFUiKQpTaWduZWQtb2ZmLWJ5OiBRaWFuIENhaSA8Y2FpQGxj
YS5wdz4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vdm13Z2Z4L3Ztd2dmeF9kcnYuYyB8IDIgKysKIDEg
ZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9k
cm0vdm13Z2Z4L3Ztd2dmeF9kcnYuYyBiL2RyaXZlcnMvZ3B1L2RybS92bXdnZngvdm13Z2Z4X2Ry
di5jCmluZGV4IGJmNmMzNTAwZDM2My4uZTEwZmUxMDllZTQ4IDEwMDY0NAotLS0gYS9kcml2ZXJz
L2dwdS9kcm0vdm13Z2Z4L3Ztd2dmeF9kcnYuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vdm13Z2Z4
L3Ztd2dmeF9kcnYuYwpAQCAtNzQ3LDYgKzc0Nyw4IEBAIHN0YXRpYyBpbnQgdm13X2RyaXZlcl9s
b2FkKHN0cnVjdCBkcm1fZGV2aWNlICpkZXYsIHVuc2lnbmVkIGxvbmcgY2hpcHNldCkKIAlpZiAo
dW5saWtlbHkocmV0ICE9IDApKQogCQlnb3RvIG91dF9lcnIwOwogCisJZG1hX3NldF9tYXhfc2Vn
X3NpemUoZGV2LT5kZXYsIFUzMl9NQVgpOworCiAJaWYgKGRldl9wcml2LT5jYXBhYmlsaXRpZXMg
JiBTVkdBX0NBUF9HTVIyKSB7CiAJCURSTV9JTkZPKCJNYXggR01SIGlkcyBpcyAldVxuIiwKIAkJ
CSAodW5zaWduZWQpZGV2X3ByaXYtPm1heF9nbXJfaWRzKTsKLS0gCjIuMjAuMSAoQXBwbGUgR2l0
LTExNykKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRy
aS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
