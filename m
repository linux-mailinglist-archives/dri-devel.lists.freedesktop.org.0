Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A39F21A94B5
	for <lists+dri-devel@lfdr.de>; Wed, 15 Apr 2020 09:42:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F354389E33;
	Wed, 15 Apr 2020 07:41:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 15FEE89022
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Apr 2020 07:41:20 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id j2so17882523wrs.9
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Apr 2020 00:41:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=XedkJmxjsSw5iGyEbJMrjH+8XvxXV8jZNQZcH9D7ls4=;
 b=hlBUuEnw0cvcyM55N5GFKDKVz+iuS4rDb0JUNP5hF7k0Y7wzt5kiTqJQGXl9/dbUwV
 PmsBpzrAslauDltt9RncT+iL42zTVBDvLhgh7r1WWFBc1cCdUta5QUTXfhXhHmsLA8Cy
 LQFR2QK8dg0UrplcwHpX77mK6U++eM8/+KWSI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=XedkJmxjsSw5iGyEbJMrjH+8XvxXV8jZNQZcH9D7ls4=;
 b=jgd76tJ0GoNg4k2Ueh5aqznOp5RUtnjee8vTRN8wXhCWOgk9dFyVmn8MYIkP9WDg9C
 MTyt3UFDa/eR3eV//lVSJ9iY5i17nAmfv/yowamTroRbNa30j6JmhwLRD6meeWNMYDGH
 MxzdSI3HF0AOtCrCMtDdZKDeowaVoTK4agdmzZaNZqoIsZcEUhLYr/F2fdxORW9iFSYz
 7ciE8KrOeb4xTLS5ovRMU/3SP2OZ4OR1FSZkcTeGY/GgW+0zmgOhtlRKAjVKPbvIKdGX
 E79cykp6kO8QM5WVIMVilqr/QVuLz2M/Oa04ZNZtDRWQAxH5b5OBQD1uz3uK5Ep/gW4Z
 PhqQ==
X-Gm-Message-State: AGi0PuY7I1W2Ie3YdyqiBpE37k/MgaHLxiRRvin6U9dbfwcWYUhpyLkA
 aXHjdElzUPAWpeoSyl5ngdH9YA==
X-Google-Smtp-Source: APiQypImEFWjI/mCGsxrHaTlwwEuBcDEHWeOGY/Vgwm1Ce7LQXsW12usA7t3oLVS57so3p0UqpfgCg==
X-Received: by 2002:a5d:404a:: with SMTP id w10mr1080324wrp.397.1586936478721; 
 Wed, 15 Apr 2020 00:41:18 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id u30sm1878552wru.13.2020.04.15.00.41.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Apr 2020 00:41:18 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: Intel Graphics Development <intel-gfx@lists.freedesktop.org>
Subject: [PATCH 36/59] drm/cirrus: Don't use drm_device->dev_private
Date: Wed, 15 Apr 2020 09:40:11 +0200
Message-Id: <20200415074034.175360-37-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200415074034.175360-1-daniel.vetter@ffwll.ch>
References: <20200415074034.175360-1-daniel.vetter@ffwll.ch>
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
 DRI Development <dri-devel@lists.freedesktop.org>,
 virtualization@lists.linux-foundation.org, Gerd Hoffmann <kraxel@redhat.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Dave Airlie <airlied@redhat.com>,
 Daniel Vetter <daniel.vetter@intel.com>, Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VXBjYXN0aW5nIHVzaW5nIGEgY29udGFpbmVyX29mIG1hY3JvIGlzIG1vcmUgdHlwZXNhZmUsIGZh
c3RlciBhbmQKZWFzaWVyIGZvciB0aGUgY29tcGlsZXIgdG8gb3B0aW1pemUuCgpBY2tlZC1ieTog
RXJpYyBBbmhvbHQgPGVyaWNAYW5ob2x0Lm5ldD4KQWNrZWQtYnk6IFNhbSBSYXZuYm9yZyA8c2Ft
QHJhdm5ib3JnLm9yZz4KU2lnbmVkLW9mZi1ieTogRGFuaWVsIFZldHRlciA8ZGFuaWVsLnZldHRl
ckBpbnRlbC5jb20+CkNjOiBEYXZlIEFpcmxpZSA8YWlybGllZEByZWRoYXQuY29tPgpDYzogR2Vy
ZCBIb2ZmbWFubiA8a3JheGVsQHJlZGhhdC5jb20+CkNjOiBEYW5pZWwgVmV0dGVyIDxkYW5pZWwu
dmV0dGVyQGZmd2xsLmNoPgpDYzogIk5vcmFsZiBUcsO4bm5lcyIgPG5vcmFsZkB0cm9ubmVzLm9y
Zz4KQ2M6IFNhbSBSYXZuYm9yZyA8c2FtQHJhdm5ib3JnLm9yZz4KQ2M6IEVyaWMgQW5ob2x0IDxl
cmljQGFuaG9sdC5uZXQ+CkNjOiBUaG9tYXMgWmltbWVybWFubiA8dHppbW1lcm1hbm5Ac3VzZS5k
ZT4KQ2M6IHZpcnR1YWxpemF0aW9uQGxpc3RzLmxpbnV4LWZvdW5kYXRpb24ub3JnCi0tLQogZHJp
dmVycy9ncHUvZHJtL2NpcnJ1cy9jaXJydXMuYyB8IDkgKysrKystLS0tCiAxIGZpbGUgY2hhbmdl
ZCwgNSBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMv
Z3B1L2RybS9jaXJydXMvY2lycnVzLmMgYi9kcml2ZXJzL2dwdS9kcm0vY2lycnVzL2NpcnJ1cy5j
CmluZGV4IDRiNjU2MzcxNDdiYS4uNzQ0YThlMzM3ZTQxIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dw
dS9kcm0vY2lycnVzL2NpcnJ1cy5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9jaXJydXMvY2lycnVz
LmMKQEAgLTU5LDYgKzU5LDggQEAgc3RydWN0IGNpcnJ1c19kZXZpY2UgewogCXZvaWQgX19pb21l
bQkJICAgICAgICptbWlvOwogfTsKIAorI2RlZmluZSB0b19jaXJydXMoX2RldikgY29udGFpbmVy
X29mKF9kZXYsIHN0cnVjdCBjaXJydXNfZGV2aWNlLCBkZXYpCisKIC8qIC0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLSAqLwog
LyoKICAqIFRoZSBtZWF0IG9mIHRoaXMgZHJpdmVyLiBUaGUgY29yZSBwYXNzZXMgdXMgYSBtb2Rl
IGFuZCB3ZSBoYXZlIHRvIHByb2dyYW0KQEAgLTMxMSw3ICszMTMsNyBAQCBzdGF0aWMgaW50IGNp
cnJ1c19tb2RlX3NldChzdHJ1Y3QgY2lycnVzX2RldmljZSAqY2lycnVzLAogc3RhdGljIGludCBj
aXJydXNfZmJfYmxpdF9yZWN0KHN0cnVjdCBkcm1fZnJhbWVidWZmZXIgKmZiLAogCQkJICAgICAg
IHN0cnVjdCBkcm1fcmVjdCAqcmVjdCkKIHsKLQlzdHJ1Y3QgY2lycnVzX2RldmljZSAqY2lycnVz
ID0gZmItPmRldi0+ZGV2X3ByaXZhdGU7CisJc3RydWN0IGNpcnJ1c19kZXZpY2UgKmNpcnJ1cyA9
IHRvX2NpcnJ1cyhmYi0+ZGV2KTsKIAl2b2lkICp2bWFwOwogCWludCBpZHgsIHJldDsKIApAQCAt
NDM2LDcgKzQzOCw3IEBAIHN0YXRpYyB2b2lkIGNpcnJ1c19waXBlX2VuYWJsZShzdHJ1Y3QgZHJt
X3NpbXBsZV9kaXNwbGF5X3BpcGUgKnBpcGUsCiAJCQkgICAgICAgc3RydWN0IGRybV9jcnRjX3N0
YXRlICpjcnRjX3N0YXRlLAogCQkJICAgICAgIHN0cnVjdCBkcm1fcGxhbmVfc3RhdGUgKnBsYW5l
X3N0YXRlKQogewotCXN0cnVjdCBjaXJydXNfZGV2aWNlICpjaXJydXMgPSBwaXBlLT5jcnRjLmRl
di0+ZGV2X3ByaXZhdGU7CisJc3RydWN0IGNpcnJ1c19kZXZpY2UgKmNpcnJ1cyA9IHRvX2NpcnJ1
cyhwaXBlLT5jcnRjLmRldik7CiAKIAljaXJydXNfbW9kZV9zZXQoY2lycnVzLCAmY3J0Y19zdGF0
ZS0+bW9kZSwgcGxhbmVfc3RhdGUtPmZiKTsKIAljaXJydXNfZmJfYmxpdF9mdWxsc2NyZWVuKHBs
YW5lX3N0YXRlLT5mYik7CkBAIC00NDUsNyArNDQ3LDcgQEAgc3RhdGljIHZvaWQgY2lycnVzX3Bp
cGVfZW5hYmxlKHN0cnVjdCBkcm1fc2ltcGxlX2Rpc3BsYXlfcGlwZSAqcGlwZSwKIHN0YXRpYyB2
b2lkIGNpcnJ1c19waXBlX3VwZGF0ZShzdHJ1Y3QgZHJtX3NpbXBsZV9kaXNwbGF5X3BpcGUgKnBp
cGUsCiAJCQkgICAgICAgc3RydWN0IGRybV9wbGFuZV9zdGF0ZSAqb2xkX3N0YXRlKQogewotCXN0
cnVjdCBjaXJydXNfZGV2aWNlICpjaXJydXMgPSBwaXBlLT5jcnRjLmRldi0+ZGV2X3ByaXZhdGU7
CisJc3RydWN0IGNpcnJ1c19kZXZpY2UgKmNpcnJ1cyA9IHRvX2NpcnJ1cyhwaXBlLT5jcnRjLmRl
dik7CiAJc3RydWN0IGRybV9wbGFuZV9zdGF0ZSAqc3RhdGUgPSBwaXBlLT5wbGFuZS5zdGF0ZTsK
IAlzdHJ1Y3QgZHJtX2NydGMgKmNydGMgPSAmcGlwZS0+Y3J0YzsKIAlzdHJ1Y3QgZHJtX3JlY3Qg
cmVjdDsKQEAgLTU3Myw3ICs1NzUsNiBAQCBzdGF0aWMgaW50IGNpcnJ1c19wY2lfcHJvYmUoc3Ry
dWN0IHBjaV9kZXYgKnBkZXYsCiAJCXJldHVybiBQVFJfRVJSKGNpcnJ1cyk7CiAKIAlkZXYgPSAm
Y2lycnVzLT5kZXY7Ci0JZGV2LT5kZXZfcHJpdmF0ZSA9IGNpcnJ1czsKIAogCWNpcnJ1cy0+dnJh
bSA9IGRldm1faW9yZW1hcCgmcGRldi0+ZGV2LCBwY2lfcmVzb3VyY2Vfc3RhcnQocGRldiwgMCks
CiAJCQkJICAgIHBjaV9yZXNvdXJjZV9sZW4ocGRldiwgMCkpOwotLSAKMi4yNS4xCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGlu
ZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVl
ZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
