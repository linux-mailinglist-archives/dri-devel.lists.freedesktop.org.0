Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A6BB655DD0
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jun 2019 03:38:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8701A6E1D3;
	Wed, 26 Jun 2019 01:38:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x744.google.com (mail-qk1-x744.google.com
 [IPv6:2607:f8b0:4864:20::744])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 206FC6E1D3
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jun 2019 01:38:37 +0000 (UTC)
Received: by mail-qk1-x744.google.com with SMTP id i125so346924qkd.6
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Jun 2019 18:38:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=VhvsA2mFJL5Xe5+RHkMF0VDR29nwFdCWp8jzkz78NKs=;
 b=JuEY+K+Q7LNXdcwF6pFIDekSRRucFs+z/FnytpMhGK59dGIdcaianMYbAbJjN5LILh
 gfLqZYVdxuaEMJeqiwlOkufhabGgsUM8CeLVMauzLramsxfiExbIGcPlwRD92YjxVRrN
 FpQ3fMnDNteGPEcjQkMLmEMBoRWatnOM5CeVjAFfX0ASC+1zCb0kh3AtuLKpSSRQd7Fx
 +LQMKnTdbSmwpjU4MZ5Yq1/MPEBHuqXSp9alTA7XS/0T2CE293K0H/EcEiijoduEf8BF
 BJnvLuK66TfOkihu6cm/V7W7ytlWOV7QOpdE8p5k03F1So1E3UTFD+XZbOi6bWNwpRXx
 FUMA==
X-Gm-Message-State: APjAAAX7PYi6IFMgKB1lHcSP6xhdXo1WkX0OqbK1onmwBBTTpPhsFNKT
 dRaMl0NmLDpMML+7UgPptaI=
X-Google-Smtp-Source: APXvYqxZZf0LF7ILRzNdTHyeclwzLjQ3OWXOXs+v+XxDfPqPWC8/3w4blmvuCJH391wQzNWiyx780A==
X-Received: by 2002:a37:668c:: with SMTP id a134mr1564017qkc.477.1561513116203; 
 Tue, 25 Jun 2019 18:38:36 -0700 (PDT)
Received: from smtp.gmail.com ([187.121.151.146])
 by smtp.gmail.com with ESMTPSA id h40sm9967150qth.4.2019.06.25.18.38.33
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 25 Jun 2019 18:38:35 -0700 (PDT)
Date: Tue, 25 Jun 2019 22:38:31 -0300
From: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>
To: Brian Starkey <brian.starkey@arm.com>,
 Liviu Dudau <liviu.dudau@arm.com>, Daniel Vetter <daniel@ffwll.ch>,
 Haneen Mohammed <hamohammed.sa@gmail.com>, Simon Ser <contact@emersion.fr>
Subject: [PATCH V3 4/5] drm/vkms: Compute CRC without change input data
Message-ID: <ea7e3a0daa4ee502d8ec67a010120d53f88fa06b.1561491964.git.rodrigosiqueiramelo@gmail.com>
References: <cover.1561491964.git.rodrigosiqueiramelo@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <cover.1561491964.git.rodrigosiqueiramelo@gmail.com>
User-Agent: NeoMutt/20180716
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=VhvsA2mFJL5Xe5+RHkMF0VDR29nwFdCWp8jzkz78NKs=;
 b=rwstq9SV12XPNESW3bHDHzxMr1EbE9kLJvo0w/fufz8IIyTZmnFvZ5I0iflsdlXn1M
 EZ356wSG1KOO40stlTjAjI/D9Wm64ctkumXNZZIrSFfuyMpm68Xxn1/xGSpDuSxCfvyp
 nM81CeAOeXw3tiT6smx1EVrBpt08DuAqPWQyWS8yHQ7ZQrtZra7c+V5YSuk+Bm2da2O+
 8myyuA5/z5qJY4aB4EGlNih5NEihjgGWqddNIcPNnao0NReUTUpy8cLiiPq5DPM3haCa
 HpvJ6m7EtIhDXO9/mE+WUCaTmP/pWcHeGIStjWNU1VBab7O5vZ5c1WDOqx5g8OZ/fX+F
 40Jg==
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhlIGNvbXB1dGVfY3JjKCkgZnVuY3Rpb24gaXMgcmVzcG9uc2libGUgZm9yIGNhbGN1bGF0aW5n
IHRoZQpmcmFtZWJ1ZmZlciBDUkMgdmFsdWU7IGR1ZSB0byB0aGUgWFJHQiBmb3JtYXQsIHRoaXMg
ZnVuY3Rpb24gaGFzIHRvCmlnbm9yZSB0aGUgYWxwaGEgY2hhbm5lbCBkdXJpbmcgdGhlIENSQyBj
b21wdXRhdGlvbi4gVGhlcmVmb3JlLApjb21wdXRlX2NyYygpIHNldCB6ZXJvIHRvIHRoZSBhbHBo
YSBjaGFubmVsIGRpcmVjdGx5IGluIHRoZSBpbnB1dApmcmFtZWJ1ZmZlciwgd2hpY2ggaXMgbm90
IGEgcHJvYmxlbSBzaW5jZSB0aGlzIGZ1bmN0aW9uIHJlY2VpdmVzIGEgY29weQpvZiB0aGUgb3Jp
Z2luYWwgYnVmZmVyLiBIb3dldmVyLCBpZiB3ZSB3YW50IHRvIHVzZSB0aGlzIGZ1bmN0aW9uIGlu
IGEKY29udGV4dCB3aXRob3V0IGEgYnVmZmVyIGNvcHksIGl0IHdpbGwgY2hhbmdlIHRoZSBpbml0
aWFsIHZhbHVlLiBUaGlzCnBhdGNoIG1ha2VzIGNvbXB1dGVfY3JjKCkgY2FsY3VsYXRlIHRoZSBD
UkMgdmFsdWUgd2l0aG91dCBtb2RpZnlpbmcgdGhlCmlucHV0IGZyYW1lYnVmZmVyLgoKU2lnbmVk
LW9mZi1ieTogUm9kcmlnbyBTaXF1ZWlyYSA8cm9kcmlnb3NpcXVlaXJhbWVsb0BnbWFpbC5jb20+
Ci0tLQogZHJpdmVycy9ncHUvZHJtL3ZrbXMvdmttc19jb21wb3Nlci5jIHwgMzEgKysrKysrKysr
KysrKysrKystLS0tLS0tLS0tLQogMSBmaWxlIGNoYW5nZWQsIDE5IGluc2VydGlvbnMoKyksIDEy
IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS92a21zL3ZrbXNfY29t
cG9zZXIuYyBiL2RyaXZlcnMvZ3B1L2RybS92a21zL3ZrbXNfY29tcG9zZXIuYwppbmRleCA1MWEy
NzA1MTQyMTkuLjgxMjZhYTBmOTY4ZiAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL3ZrbXMv
dmttc19jb21wb3Nlci5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS92a21zL3ZrbXNfY29tcG9zZXIu
YwpAQCAtNiwzMyArNiw0MCBAQAogI2luY2x1ZGUgPGRybS9kcm1fYXRvbWljX2hlbHBlci5oPgog
I2luY2x1ZGUgPGRybS9kcm1fZ2VtX2ZyYW1lYnVmZmVyX2hlbHBlci5oPgogCitzdGF0aWMgdTMy
IGdldF9waXhlbF9mcm9tX2J1ZmZlcihpbnQgeCwgaW50IHksIGNvbnN0IHU4ICpidWZmZXIsCisJ
CQkJIGNvbnN0IHN0cnVjdCB2a21zX2NvbXBvc2VyICpjb21wb3NlcikKK3sKKwlpbnQgc3JjX29m
ZnNldCA9IGNvbXBvc2VyLT5vZmZzZXQgKyAoeSAqIGNvbXBvc2VyLT5waXRjaCkKKwkJCQkJICAr
ICh4ICogY29tcG9zZXItPmNwcCk7CisKKwlyZXR1cm4gKih1MzIgKikmYnVmZmVyW3NyY19vZmZz
ZXRdOworfQorCiAvKioKICAqIGNvbXB1dGVfY3JjIC0gQ29tcHV0ZSBDUkMgdmFsdWUgb24gb3V0
cHV0IGZyYW1lCiAgKgotICogQHZhZGRyX291dDogYWRkcmVzcyB0byBmaW5hbCBmcmFtZWJ1ZmZl
cgorICogQHZhZGRyOiBhZGRyZXNzIHRvIGZpbmFsIGZyYW1lYnVmZmVyCiAgKiBAY29tcG9zZXI6
IGZyYW1lYnVmZmVyJ3MgbWV0YWRhdGEKICAqCiAgKiByZXR1cm5zIENSQyB2YWx1ZSBjb21wdXRl
ZCB1c2luZyBjcmMzMiBvbiB0aGUgdmlzaWJsZSBwb3J0aW9uIG9mCiAgKiB0aGUgZmluYWwgZnJh
bWVidWZmZXIgYXQgdmFkZHJfb3V0CiAgKi8KLXN0YXRpYyB1aW50MzJfdCBjb21wdXRlX2NyYyh2
b2lkICp2YWRkcl9vdXQsIHN0cnVjdCB2a21zX2NvbXBvc2VyICpjb21wb3NlcikKK3N0YXRpYyB1
aW50MzJfdCBjb21wdXRlX2NyYyhjb25zdCB1OCAqdmFkZHIsCisJCQkgICAgY29uc3Qgc3RydWN0
IHZrbXNfY29tcG9zZXIgKmNvbXBvc2VyKQogewotCWludCBpLCBqLCBzcmNfb2Zmc2V0OworCWlu
dCB4LCB5OwogCWludCB4X3NyYyA9IGNvbXBvc2VyLT5zcmMueDEgPj4gMTY7CiAJaW50IHlfc3Jj
ID0gY29tcG9zZXItPnNyYy55MSA+PiAxNjsKIAlpbnQgaF9zcmMgPSBkcm1fcmVjdF9oZWlnaHQo
JmNvbXBvc2VyLT5zcmMpID4+IDE2OwogCWludCB3X3NyYyA9IGRybV9yZWN0X3dpZHRoKCZjb21w
b3Nlci0+c3JjKSA+PiAxNjsKLQl1MzIgY3JjID0gMDsKKwl1MzIgY3JjID0gMCwgcGl4ZWwgPSAw
OwogCi0JZm9yIChpID0geV9zcmM7IGkgPCB5X3NyYyArIGhfc3JjOyArK2kpIHsKLQkJZm9yIChq
ID0geF9zcmM7IGogPCB4X3NyYyArIHdfc3JjOyArK2opIHsKLQkJCXNyY19vZmZzZXQgPSBjb21w
b3Nlci0+b2Zmc2V0Ci0JCQkJICAgICArIChpICogY29tcG9zZXItPnBpdGNoKQotCQkJCSAgICAg
KyAoaiAqIGNvbXBvc2VyLT5jcHApOworCWZvciAoeSA9IHlfc3JjOyB5IDwgeV9zcmMgKyBoX3Ny
YzsgKyt5KSB7CisJCWZvciAoeCA9IHhfc3JjOyB4IDwgeF9zcmMgKyB3X3NyYzsgKyt4KSB7CiAJ
CQkvKiBYUkdCIGZvcm1hdCBpZ25vcmVzIEFscGhhIGNoYW5uZWwgKi8KLQkJCW1lbXNldCh2YWRk
cl9vdXQgKyBzcmNfb2Zmc2V0ICsgMjQsIDAsICA4KTsKLQkJCWNyYyA9IGNyYzMyX2xlKGNyYywg
dmFkZHJfb3V0ICsgc3JjX29mZnNldCwKLQkJCQkgICAgICAgc2l6ZW9mKHUzMikpOworCQkJcGl4
ZWwgPSBnZXRfcGl4ZWxfZnJvbV9idWZmZXIoeCwgeSwgdmFkZHIsIGNvbXBvc2VyKTsKKwkJCWJp
dG1hcF9jbGVhcigodm9pZCAqKSZwaXhlbCwgMCwgOCk7CisJCQljcmMgPSBjcmMzMl9sZShjcmMs
ICh2b2lkICopJnBpeGVsLCBzaXplb2YodTMyKSk7CiAJCX0KIAl9CiAKLS0gCjIuMjEuMApfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFp
bGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
