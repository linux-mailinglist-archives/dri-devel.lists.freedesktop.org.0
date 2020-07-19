Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 45EEF22587E
	for <lists+dri-devel@lfdr.de>; Mon, 20 Jul 2020 09:30:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C482B89F92;
	Mon, 20 Jul 2020 07:30:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 380 seconds by postgrey-1.36 at gabe;
 Sun, 19 Jul 2020 15:52:18 UTC
Received: from fudan.edu.cn (mail.fudan.edu.cn [202.120.224.73])
 by gabe.freedesktop.org (Postfix) with ESMTP id 87CD56E117
 for <dri-devel@lists.freedesktop.org>; Sun, 19 Jul 2020 15:52:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fudan.edu.cn; s=dkim; h=Received:Date:From:To:Cc:Subject:
 Message-ID:MIME-Version:Content-Type:Content-Disposition:
 Content-Transfer-Encoding; bh=nLgoWePWpiGRb9MQLcDy7kVpH9lYYEUHpm
 +ppMx20Fc=; b=V2x5CcAbYVxuE1BKBUl7fMe39rKDy2n2vkeMYT3NzlPFht9v3n
 Zcvtb3NAl/a8BeD8oktsga0a9lxDUQE86jqGfsjQj3gJWmJF/ks/0d3tZICg57F8
 djnO3voddKoUdWRp0OQQZEdOj/QRQ7bZlnXFfJgiTXSaBRrlixPrwbQEI=
Received: from xin-virtual-machine (unknown [111.192.165.241])
 by app2 (Coremail) with SMTP id XQUFCgCHjLypahRfupwJAg--.48S3;
 Sun, 19 Jul 2020 23:45:48 +0800 (CST)
Date: Sun, 19 Jul 2020 23:45:45 +0800
From: Xin Xiong <xiongx18@fudan.edu.cn>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH] drm: fix drm_dp_mst_port refcount leaks in
 drm_dp_mst_allocate_vcpi
Message-ID: <20200719154545.GA41231@xin-virtual-machine>
MIME-Version: 1.0
Content-Disposition: inline
X-CM-TRANSID: XQUFCgCHjLypahRfupwJAg--.48S3
X-Coremail-Antispam: 1UD129KBjvJXoW7ZFWktF47Cr17JrW5ZFyDGFg_yoW8CF1xpF
 W7Kryjvr9Yva1Dta1Uu3WkCr4kuanFvF1xJrWUCw17u34Utr1FqF15Gw1aqFy7ArWxtFyF
 qanFkF48CF129aDanT9S1TB71UUUUUDqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUPj14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
 1l84ACjcxK6xIIjxv20xvE14v26F1j6w1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4j
 6r4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVW0oV
 Cq3wAac4AC62xK8xCEY4vEwIxC4wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC
 0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr
 1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIF
 xwACI402YVCY1x02628vn2kIc2xKxwCY1x0262kKe7AKxVWUAVWUtwCY02Avz4vE14v_Xr
 Wl42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWU
 JVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7V
 AKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j
 6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWrJr0_WFyUJwCI42IY6I8E87Iv67AKxVWUJVW8Jw
 CI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjfU8fHUUUUU
 U
X-CM-SenderInfo: arytiiqsuqiimz6i3vldqovvfxof0/
X-Mailman-Approved-At: Mon, 20 Jul 2020 07:30:36 +0000
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
Cc: Xin Tan <tanxin.ctf@gmail.com>, yuanxzhang@fudan.edu.cn,
 Xin Xiong <xiongx18@fudan.edu.cn>, Xiyu Yang <xiyuyang19@fudan.edu.cn>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

ZHJtX2RwX21zdF9hbGxvY2F0ZV92Y3BpKCkgaW52b2tlcwpkcm1fZHBfbXN0X3RvcG9sb2d5X2dl
dF9wb3J0X3ZhbGlkYXRlZCgpLCB3aGljaCBpbmNyZWFzZXMgdGhlIHJlZmNvdW50Cm9mIHRoZSAi
cG9ydCIuCgpUaGVzZSByZWZlcmVuY2UgY291bnRpbmcgaXNzdWVzIHRha2UgcGxhY2UgaW4gdHdv
IGV4Y2VwdGlvbiBoYW5kbGluZwpwYXRocyBzZXBhcmF0ZWx5LiBFaXRoZXIgd2hlbiDigJxzbG90
c+KAnSBpcyBsZXNzIHRoYW4gMCBvciB3aGVuCmRybV9kcF9pbml0X3ZjcGkoKSByZXR1cm5zIGEg
bmVnYXRpdmUgdmFsdWUsIHRoZSBmdW5jdGlvbiBmb3JnZXRzIHRvCnJlZHVjZSB0aGUgcmVmY250
IGluY3JlYXNlZCBkcm1fZHBfbXN0X3RvcG9sb2d5X2dldF9wb3J0X3ZhbGlkYXRlZCgpLAp3aGlj
aCByZXN1bHRzIGluIGEgcmVmY291bnQgbGVhay4KCkZpeCB0aGVzZSBpc3N1ZXMgYnkgcHVsbGlu
ZyB1cCB0aGUgZXJyb3IgaGFuZGxpbmcgd2hlbiAic2xvdHMiIGlzIGxlc3MKdGhhbiAwLCBhbmQg
Y2FsbGluZyBkcm1fZHBfbXN0X3RvcG9sb2d5X3B1dF9wb3J0KCkgYmVmb3JlIHRlcm1pbmF0aW9u
CndoZW4gZHJtX2RwX2luaXRfdmNwaSgpIHJldHVybnMgYSBuZWdhdGl2ZSB2YWx1ZS4KClNpZ25l
ZC1vZmYtYnk6IFhpeXUgWWFuZyA8eGl5dXlhbmcxOUBmdWRhbi5lZHUuY24+ClNpZ25lZC1vZmYt
Ynk6IFhpbiBUYW4gPHRhbnhpbi5jdGZAZ21haWwuY29tPgpTaWduZWQtb2ZmLWJ5OiBYaW4gWGlv
bmcgPHhpb25neDE4QGZ1ZGFuLmVkdS5jbj4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vZHJtX2RwX21z
dF90b3BvbG9neS5jIHwgNyArKysrLS0tCiAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCsp
LCAzIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fZHBfbXN0
X3RvcG9sb2d5LmMgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX2RwX21zdF90b3BvbG9neS5jCmluZGV4
IDFlMjZiODk2MjhmOS4uOTdiNDhiNTMxZWM2IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0v
ZHJtX2RwX21zdF90b3BvbG9neS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fZHBfbXN0X3Rv
cG9sb2d5LmMKQEAgLTQyNjEsMTEgKzQyNjEsMTEgQEAgYm9vbCBkcm1fZHBfbXN0X2FsbG9jYXRl
X3ZjcGkoc3RydWN0IGRybV9kcF9tc3RfdG9wb2xvZ3lfbWdyICptZ3IsCiB7CiAJaW50IHJldDsK
IAotCXBvcnQgPSBkcm1fZHBfbXN0X3RvcG9sb2d5X2dldF9wb3J0X3ZhbGlkYXRlZChtZ3IsIHBv
cnQpOwotCWlmICghcG9ydCkKKwlpZiAoc2xvdHMgPCAwKQogCQlyZXR1cm4gZmFsc2U7CiAKLQlp
ZiAoc2xvdHMgPCAwKQorCXBvcnQgPSBkcm1fZHBfbXN0X3RvcG9sb2d5X2dldF9wb3J0X3ZhbGlk
YXRlZChtZ3IsIHBvcnQpOworCWlmICghcG9ydCkKIAkJcmV0dXJuIGZhbHNlOwogCiAJaWYgKHBv
cnQtPnZjcGkudmNwaSA+IDApIHsKQEAgLTQyODEsNiArNDI4MSw3IEBAIGJvb2wgZHJtX2RwX21z
dF9hbGxvY2F0ZV92Y3BpKHN0cnVjdCBkcm1fZHBfbXN0X3RvcG9sb2d5X21nciAqbWdyLAogCWlm
IChyZXQpIHsKIAkJRFJNX0RFQlVHX0tNUygiZmFpbGVkIHRvIGluaXQgdmNwaSBzbG90cz0lZCBt
YXg9NjMgcmV0PSVkXG4iLAogCQkJICAgICAgRElWX1JPVU5EX1VQKHBibiwgbWdyLT5wYm5fZGl2
KSwgcmV0KTsKKwkJZHJtX2RwX21zdF90b3BvbG9neV9wdXRfcG9ydChwb3J0KTsKIAkJZ290byBv
dXQ7CiAJfQogCURSTV9ERUJVR19LTVMoImluaXRpbmcgdmNwaSBmb3IgcGJuPSVkIHNsb3RzPSVk
XG4iLAotLSAKMi4yNS4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmkt
ZGV2ZWwK
