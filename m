Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FAE11A9484
	for <lists+dri-devel@lfdr.de>; Wed, 15 Apr 2020 09:41:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A64E6E887;
	Wed, 15 Apr 2020 07:40:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BEB726E880
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Apr 2020 07:40:54 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id a201so17305876wme.1
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Apr 2020 00:40:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/DX0QsbRa63TTvCzzh1mF+p8stjcHGqiXL0nsgXQFuE=;
 b=cS8F2Da2ZcoqwL2CTn69oHiBMS1d+wCbQIkZbUZJ7vvdbFHy5Kln8opYhymiskD9fp
 W8AwUELWmXte0kaeLySKRlETlOON99xEKi28Spf+4v85aWOygk3bkpGXDzlRidlKf5fh
 vl5W5PYEsf6KYaiz30FDOwEEZS9LtQlX76Bhc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/DX0QsbRa63TTvCzzh1mF+p8stjcHGqiXL0nsgXQFuE=;
 b=hQ1WHjTZYVUTyOAFPV3pILgyAM1rETkVsZZi3fAcBqA2+dV/8CUkzngoZoizu9eRyA
 WRjEzvf84id+Q4h6qKposMmU46MVuX33nmmLVTr1D25eE4rU4RJD04IQ18REb+mHLhM1
 aOYbcd2BPglZ9K2UOmMP8BtTJgYJgRuPdBxcFJ55MYQ6pm1wvDeS/idcZCqBDZsqCKs8
 b1lvzO7J12XyWaxqHF4QZAIIhWP15rJLiC4s3VpmHxfi4c+bTyPpGx19To5gTCmKUKwE
 +d27douGbm7g5Ofy2YRdGyj9iDdtYNZc7ZdOipbmt+32w25xLlnIeJCcbxDWJXzrDeFq
 +Fhw==
X-Gm-Message-State: AGi0PuZZeQOXqMNt7gdzPROwxv5BiBMvc55TJ1eNXT3jdvIBOhibiRAq
 cIzPIawMEWIjlGzvNyQOYfnylA==
X-Google-Smtp-Source: APiQypKFSsZNvxWy2vdb4x3nq1YkV/oAq1dCFeUGmZgkoTZGxpVZDT5p3FooFMDAPfjA3f1tY0gxCA==
X-Received: by 2002:a1c:9e43:: with SMTP id h64mr3747898wme.0.1586936453453;
 Wed, 15 Apr 2020 00:40:53 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id u30sm1878552wru.13.2020.04.15.00.40.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Apr 2020 00:40:52 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: Intel Graphics Development <intel-gfx@lists.freedesktop.org>
Subject: [PATCH 12/59] drm/udl: don't set drm_device->dev_private
Date: Wed, 15 Apr 2020 09:39:47 +0200
Message-Id: <20200415074034.175360-13-daniel.vetter@ffwll.ch>
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
Cc: Sean Paul <sean@poorly.run>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Emil Velikov <emil.l.velikov@gmail.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Alexios Zavras <alexios.zavras@intel.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@intel.com>,
 =?UTF-8?q?Jos=C3=A9=20Roberto=20de=20Souza?= <jose.souza@intel.com>,
 Dave Airlie <airlied@redhat.com>, Thomas Gleixner <tglx@linutronix.de>,
 Sam Ravnborg <sam@ravnborg.org>, Allison Randal <allison@lohutok.net>,
 Gerd Hoffmann <kraxel@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

V2UncmUgbW9zdGx5IHRoZXJlIGFscmVhZHksIGp1c3QgYSBoYW5kZnVsIG9mIHBsYWNlcyB0aGF0
IGRpZG4ndCB1c2UKdGhlIHRvX3VkbCBjb250YWluZXJfb2YgY2FzdC4gVG8gbWFrZSBzdXJlIG5v
IG5ldyBhcHBlYXIsIGRvbid0IHNldAotPmRldl9wcml2YXRlLgoKUmV2aWV3ZWQtYnk6IFRob21h
cyBaaW1tZXJtYW5uIDx0emltbWVybWFubkBzdXNlLmRlPgpBY2tlZC1ieTogU2FtIFJhdm5ib3Jn
IDxzYW1AcmF2bmJvcmcub3JnPgpTaWduZWQtb2ZmLWJ5OiBEYW5pZWwgVmV0dGVyIDxkYW5pZWwu
dmV0dGVyQGludGVsLmNvbT4KQ2M6IERhdmUgQWlybGllIDxhaXJsaWVkQHJlZGhhdC5jb20+CkNj
OiBTZWFuIFBhdWwgPHNlYW5AcG9vcmx5LnJ1bj4KQ2M6IEVtaWwgVmVsaWtvdiA8ZW1pbC5sLnZl
bGlrb3ZAZ21haWwuY29tPgpDYzogVGhvbWFzIFppbW1lcm1hbm4gPHR6aW1tZXJtYW5uQHN1c2Uu
ZGU+CkNjOiBEYW5pZWwgVmV0dGVyIDxkYW5pZWwudmV0dGVyQGZmd2xsLmNoPgpDYzogQWxleGlv
cyBaYXZyYXMgPGFsZXhpb3MuemF2cmFzQGludGVsLmNvbT4KQ2M6IExhdXJlbnQgUGluY2hhcnQg
PGxhdXJlbnQucGluY2hhcnRAaWRlYXNvbmJvYXJkLmNvbT4KQ2M6IFRob21hcyBHbGVpeG5lciA8
dGdseEBsaW51dHJvbml4LmRlPgpDYzogIkpvc8OpIFJvYmVydG8gZGUgU291emEiIDxqb3NlLnNv
dXphQGludGVsLmNvbT4KQ2M6IFNhbSBSYXZuYm9yZyA8c2FtQHJhdm5ib3JnLm9yZz4KQ2M6IEdl
cmQgSG9mZm1hbm4gPGtyYXhlbEByZWRoYXQuY29tPgpDYzogQWxsaXNvbiBSYW5kYWwgPGFsbGlz
b25AbG9odXRvay5uZXQ+Ci0tLQogZHJpdmVycy9ncHUvZHJtL3VkbC91ZGxfY29ubmVjdG9yLmMg
fCA0ICsrLS0KIGRyaXZlcnMvZ3B1L2RybS91ZGwvdWRsX2Rydi5jICAgICAgIHwgMSAtCiBkcml2
ZXJzL2dwdS9kcm0vdWRsL3VkbF9tb2Rlc2V0LmMgICB8IDYgKysrLS0tCiAzIGZpbGVzIGNoYW5n
ZWQsIDUgaW5zZXJ0aW9ucygrKSwgNiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJz
L2dwdS9kcm0vdWRsL3VkbF9jb25uZWN0b3IuYyBiL2RyaXZlcnMvZ3B1L2RybS91ZGwvdWRsX2Nv
bm5lY3Rvci5jCmluZGV4IDBhZmRmYjBkMWZlMS4uY2RjMWM0MmUxNjY5IDEwMDY0NAotLS0gYS9k
cml2ZXJzL2dwdS9kcm0vdWRsL3VkbF9jb25uZWN0b3IuYworKysgYi9kcml2ZXJzL2dwdS9kcm0v
dWRsL3VkbF9jb25uZWN0b3IuYwpAQCAtNTksNyArNTksNyBAQCBzdGF0aWMgaW50IHVkbF9nZXRf
bW9kZXMoc3RydWN0IGRybV9jb25uZWN0b3IgKmNvbm5lY3RvcikKIHN0YXRpYyBlbnVtIGRybV9t
b2RlX3N0YXR1cyB1ZGxfbW9kZV92YWxpZChzdHJ1Y3QgZHJtX2Nvbm5lY3RvciAqY29ubmVjdG9y
LAogCQkJICBzdHJ1Y3QgZHJtX2Rpc3BsYXlfbW9kZSAqbW9kZSkKIHsKLQlzdHJ1Y3QgdWRsX2Rl
dmljZSAqdWRsID0gY29ubmVjdG9yLT5kZXYtPmRldl9wcml2YXRlOworCXN0cnVjdCB1ZGxfZGV2
aWNlICp1ZGwgPSB0b191ZGwoY29ubmVjdG9yLT5kZXYpOwogCWlmICghdWRsLT5za3VfcGl4ZWxf
bGltaXQpCiAJCXJldHVybiAwOwogCkBAIC03Miw3ICs3Miw3IEBAIHN0YXRpYyBlbnVtIGRybV9t
b2RlX3N0YXR1cyB1ZGxfbW9kZV92YWxpZChzdHJ1Y3QgZHJtX2Nvbm5lY3RvciAqY29ubmVjdG9y
LAogc3RhdGljIGVudW0gZHJtX2Nvbm5lY3Rvcl9zdGF0dXMKIHVkbF9kZXRlY3Qoc3RydWN0IGRy
bV9jb25uZWN0b3IgKmNvbm5lY3RvciwgYm9vbCBmb3JjZSkKIHsKLQlzdHJ1Y3QgdWRsX2Rldmlj
ZSAqdWRsID0gY29ubmVjdG9yLT5kZXYtPmRldl9wcml2YXRlOworCXN0cnVjdCB1ZGxfZGV2aWNl
ICp1ZGwgPSB0b191ZGwoY29ubmVjdG9yLT5kZXYpOwogCXN0cnVjdCB1ZGxfZHJtX2Nvbm5lY3Rv
ciAqdWRsX2Nvbm5lY3RvciA9CiAJCQkJCWNvbnRhaW5lcl9vZihjb25uZWN0b3IsCiAJCQkJCXN0
cnVjdCB1ZGxfZHJtX2Nvbm5lY3RvciwKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS91ZGwv
dWRsX2Rydi5jIGIvZHJpdmVycy9ncHUvZHJtL3VkbC91ZGxfZHJ2LmMKaW5kZXggNTIzZjYwZTAy
YTg1Li5kMWFhNTBmZDZkNjUgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS91ZGwvdWRsX2Ry
di5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS91ZGwvdWRsX2Rydi5jCkBAIC02Myw3ICs2Myw2IEBA
IHN0YXRpYyBzdHJ1Y3QgdWRsX2RldmljZSAqdWRsX2RyaXZlcl9jcmVhdGUoc3RydWN0IHVzYl9p
bnRlcmZhY2UgKmludGVyZmFjZSkKIAkJcmV0dXJuIHVkbDsKIAogCXVkbC0+dWRldiA9IHVkZXY7
Ci0JdWRsLT5kcm0uZGV2X3ByaXZhdGUgPSB1ZGw7CiAKIAlyID0gdWRsX2luaXQodWRsKTsKIAlp
ZiAocikKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS91ZGwvdWRsX21vZGVzZXQuYyBiL2Ry
aXZlcnMvZ3B1L2RybS91ZGwvdWRsX21vZGVzZXQuYwppbmRleCA4Y2FkMDFmM2QxNjMuLjk5NTE4
YTgyNjQzNSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL3VkbC91ZGxfbW9kZXNldC5jCisr
KyBiL2RyaXZlcnMvZ3B1L2RybS91ZGwvdWRsX21vZGVzZXQuYwpAQCAtMjE1LDcgKzIxNSw3IEBA
IHN0YXRpYyBjaGFyICp1ZGxfZHVtbXlfcmVuZGVyKGNoYXIgKndycHRyKQogc3RhdGljIGludCB1
ZGxfY3J0Y193cml0ZV9tb2RlX3RvX2h3KHN0cnVjdCBkcm1fY3J0YyAqY3J0YykKIHsKIAlzdHJ1
Y3QgZHJtX2RldmljZSAqZGV2ID0gY3J0Yy0+ZGV2OwotCXN0cnVjdCB1ZGxfZGV2aWNlICp1ZGwg
PSBkZXYtPmRldl9wcml2YXRlOworCXN0cnVjdCB1ZGxfZGV2aWNlICp1ZGwgPSB0b191ZGwoZGV2
KTsKIAlzdHJ1Y3QgdXJiICp1cmI7CiAJY2hhciAqYnVmOwogCWludCByZXR2YWw7CkBAIC0zNjks
NyArMzY5LDcgQEAgdWRsX3NpbXBsZV9kaXNwbGF5X3BpcGVfZW5hYmxlKHN0cnVjdCBkcm1fc2lt
cGxlX2Rpc3BsYXlfcGlwZSAqcGlwZSwKIAlzdHJ1Y3QgZHJtX2NydGMgKmNydGMgPSAmcGlwZS0+
Y3J0YzsKIAlzdHJ1Y3QgZHJtX2RldmljZSAqZGV2ID0gY3J0Yy0+ZGV2OwogCXN0cnVjdCBkcm1f
ZnJhbWVidWZmZXIgKmZiID0gcGxhbmVfc3RhdGUtPmZiOwotCXN0cnVjdCB1ZGxfZGV2aWNlICp1
ZGwgPSBkZXYtPmRldl9wcml2YXRlOworCXN0cnVjdCB1ZGxfZGV2aWNlICp1ZGwgPSB0b191ZGwo
ZGV2KTsKIAlzdHJ1Y3QgZHJtX2Rpc3BsYXlfbW9kZSAqbW9kZSA9ICZjcnRjX3N0YXRlLT5tb2Rl
OwogCWNoYXIgKmJ1ZjsKIAljaGFyICp3cnB0cjsKQEAgLTQ2NCw3ICs0NjQsNyBAQCBzdGF0aWMg
Y29uc3Qgc3RydWN0IGRybV9tb2RlX2NvbmZpZ19mdW5jcyB1ZGxfbW9kZV9mdW5jcyA9IHsKIGlu
dCB1ZGxfbW9kZXNldF9pbml0KHN0cnVjdCBkcm1fZGV2aWNlICpkZXYpCiB7CiAJc2l6ZV90IGZv
cm1hdF9jb3VudCA9IEFSUkFZX1NJWkUodWRsX3NpbXBsZV9kaXNwbGF5X3BpcGVfZm9ybWF0cyk7
Ci0Jc3RydWN0IHVkbF9kZXZpY2UgKnVkbCA9IGRldi0+ZGV2X3ByaXZhdGU7CisJc3RydWN0IHVk
bF9kZXZpY2UgKnVkbCA9IHRvX3VkbChkZXYpOwogCXN0cnVjdCBkcm1fY29ubmVjdG9yICpjb25u
ZWN0b3I7CiAJaW50IHJldDsKIAotLSAKMi4yNS4xCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1h
bi9saXN0aW5mby9kcmktZGV2ZWwK
