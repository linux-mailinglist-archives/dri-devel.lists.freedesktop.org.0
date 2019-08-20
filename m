Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5759296CC7
	for <lists+dri-devel@lfdr.de>; Wed, 21 Aug 2019 01:07:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 43B8E6E8D0;
	Tue, 20 Aug 2019 23:07:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com
 [IPv6:2607:f8b0:4864:20::541])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 490A66E8D0
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Aug 2019 23:07:07 +0000 (UTC)
Received: by mail-pg1-x541.google.com with SMTP id p3so146502pgb.9
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Aug 2019 16:07:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=kYV4kILdbKA8eyGmIfSZvQNIJi3JDyMCa7aHVJs5K24=;
 b=iGgkhR0PMbtAxF35WutzTpoy2c6xmUMVDTmQr9JPvpkQQlNAX1jUr17YhHnW7R2I1Y
 3yR5hjd6LPMdvEkGUeQz3kX+cmD5ZcfgvdSnSmZFL/SUYYiaRP0MHdJOU1/jGgitcyYj
 kdDsdS5lLPsrQyI6ftFB588PgXlKdi5VESdIQ9pPjmpo61xP7O4MC9u3A2gWjGewQ7jj
 f0ejHpFWIIoiDqU6o/a/L2NULrSldlaW9xd2p2SIVO0F8bxAFg1tE8QoLaNUqh/AxeQ1
 qJZi/YXuV17KH/oN0MT2hhb9iFR6TivOoTHGWyLCcfMOABYgs9vJ8a20eTJrBZGM+Llp
 bH2Q==
X-Gm-Message-State: APjAAAXP3ydFLe89Pz+QjJx3Xb5VGBDVT5Jko7CwJlgOcV4s44JUhDMg
 1w8N+bjh2y1vOECtHJZaJ6a7sw==
X-Google-Smtp-Source: APXvYqzk7Q18L54XsSE8B+hQfBteWjyw6GXtAXHv5na/lhxe1AhTuuoaZsEygqXrPAPNJJJfBzq22A==
X-Received: by 2002:aa7:93cc:: with SMTP id y12mr28989943pff.246.1566342426836; 
 Tue, 20 Aug 2019 16:07:06 -0700 (PDT)
Received: from localhost.localdomain ([2601:1c2:680:1319:692:26ff:feda:3a81])
 by smtp.gmail.com with ESMTPSA id
 q4sm27564747pff.183.2019.08.20.16.07.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Aug 2019 16:07:06 -0700 (PDT)
From: John Stultz <john.stultz@linaro.org>
To: lkml <linux-kernel@vger.kernel.org>
Subject: [PATCH v5 23/25] drm: kirin: Add alloc_hw_ctx/clean_hw_ctx ops in
 driver data
Date: Tue, 20 Aug 2019 23:06:24 +0000
Message-Id: <20190820230626.23253-24-john.stultz@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190820230626.23253-1-john.stultz@linaro.org>
References: <20190820230626.23253-1-john.stultz@linaro.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=kYV4kILdbKA8eyGmIfSZvQNIJi3JDyMCa7aHVJs5K24=;
 b=dSG1Ek3wXoduCZ6bdSuQJ6zGn1REdKK3dH8Owh1BVf8Ldw3GKyoUXKYaXn2HjvWsG8
 0MlCq97ext2U9uYXyV/org/3fYSxurxIps7pVnWIju7CTI40kNCZgjnfK+xgXP/3KceD
 YG5T4TWr78XkSbRdmtVXsdo6ODmzIGweCY6eclvmzUTmzIYugRMn3xIwL6/kLv9usAsJ
 EtvvPiZ7Rxryd4Y0jImrXwmpmsjFCAV0/ljtjkKlK0DeVe2IgpfJ0ZT+qQJOSKUfcYI1
 +kb3OeO4iytf1/eFRCRYE6vc7RenGQ1wX1UcNLIW/+ziqlO1DOjcD/rnuwwTMLpzJyXR
 Lu2Q==
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
Cc: Xu YiPing <xuyiping@hisilicon.com>, David Airlie <airlied@linux.ie>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Xinliang Liu <z.liuxinliang@hisilicon.com>,
 Rongrong Zou <zourongrong@gmail.com>, Sam Ravnborg <sam@ravnborg.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogWHUgWWlQaW5nIDx4dXlpcGluZ0BoaXNpbGljb24uY29tPgoKQXMgcGFydCBvZiByZWZh
Y3RvcmluZyB0aGUga2lyaW4gZHJpdmVyIHRvIGJldHRlciBzdXBwb3J0CmRpZmZlcmVudCBoYXJk
d2FyZSByZXZpc2lvbnMsIHRoaXMgcGF0Y2ggY2hhbmdlcyB0aGUKYWxsb2MvY2xlYW5faHdfY3R4
IGZ1bmN0aW9ucyB0byBiZSBjYWxsZWQgdmlhIGRyaXZlcl9kYXRhCnNwZWNpZmljIGZ1bmNpdG9u
IHBvaW50ZXJzLgoKVGhpcyB3aWxsIGFsbG93IHRoZSBhZGVfZHJtX2luaXQgdG8gbGF0ZXIgYmUg
bWFkZSBnZW5lcmljIGFuZAptb3ZlZCB0byBraXJpbl9kcm1fZHJ2LmMKCkNjOiBSb25ncm9uZyBa
b3UgPHpvdXJvbmdyb25nQGdtYWlsLmNvbT4KQ2M6IFhpbmxpYW5nIExpdSA8ei5saXV4aW5saWFu
Z0BoaXNpbGljb24uY29tPgpDYzogRGF2aWQgQWlybGllIDxhaXJsaWVkQGxpbnV4LmllPgpDYzog
RGFuaWVsIFZldHRlciA8ZGFuaWVsQGZmd2xsLmNoPgpDYzogZHJpLWRldmVsIDxkcmktZGV2ZWxA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnPgpDYzogU2FtIFJhdm5ib3JnIDxzYW1AcmF2bmJvcmcub3Jn
PgpBY2tlZC1ieTogWGlubGlhbmcgTGl1IDx6LmxpdXhpbmxpYW5nQGhpc2lsaWNvbi5jb20+ClJl
dmlld2VkLWJ5OiBTYW0gUmF2bmJvcmcgPHNhbUByYXZuYm9yZy5vcmc+ClNpZ25lZC1vZmYtYnk6
IFh1IFlpUGluZyA8eHV5aXBpbmdAaGlzaWxpY29uLmNvbT4KW2pzdHVsdHo6IFJld29yZGVkIGNv
bW1pdCBtZXNzYWdlXQpTaWduZWQtb2ZmLWJ5OiBKb2huIFN0dWx0eiA8am9obi5zdHVsdHpAbGlu
YXJvLm9yZz4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vaGlzaWxpY29uL2tpcmluL2tpcmluX2RybV9h
ZGUuYyB8IDkgKysrKysrKystCiBkcml2ZXJzL2dwdS9kcm0vaGlzaWxpY29uL2tpcmluL2tpcmlu
X2RybV9kcnYuaCB8IDUgKysrKysKIDIgZmlsZXMgY2hhbmdlZCwgMTMgaW5zZXJ0aW9ucygrKSwg
MSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9oaXNpbGljb24va2ly
aW4va2lyaW5fZHJtX2FkZS5jIGIvZHJpdmVycy9ncHUvZHJtL2hpc2lsaWNvbi9raXJpbi9raXJp
bl9kcm1fYWRlLmMKaW5kZXggZDhlNDBmY2ZmMzg2Li5hMmJiMmI3NWJlNGIgMTAwNjQ0Ci0tLSBh
L2RyaXZlcnMvZ3B1L2RybS9oaXNpbGljb24va2lyaW4va2lyaW5fZHJtX2FkZS5jCisrKyBiL2Ry
aXZlcnMvZ3B1L2RybS9oaXNpbGljb24va2lyaW4va2lyaW5fZHJtX2FkZS5jCkBAIC0xMDAwLDcg
KzEwMDAsNyBAQCBzdGF0aWMgaW50IGFkZV9kcm1faW5pdChzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNl
ICpwZGV2KQogCQlyZXR1cm4gLUVOT01FTTsKIAl9CiAKLQljdHggPSBhZGVfaHdfY3R4X2FsbG9j
KHBkZXYsICZhZGUtPmNydGMuYmFzZSk7CisJY3R4ID0gYWRlX2RyaXZlcl9kYXRhLmFsbG9jX2h3
X2N0eChwZGV2LCAmYWRlLT5jcnRjLmJhc2UpOwogCWlmIChJU19FUlIoY3R4KSkgewogCQlEUk1f
RVJST1IoImZhaWxlZCB0byBpbml0aWFsaXplIGtpcmluX3ByaXYgaHcgY3R4XG4iKTsKIAkJcmV0
dXJuIC1FSU5WQUw7CkBAIC0xMDQwLDYgKzEwNDAsMTAgQEAgc3RhdGljIGludCBhZGVfZHJtX2lu
aXQoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikKIAlyZXR1cm4gMDsKIH0KIAorc3RhdGlj
IHZvaWQgYWRlX2h3X2N0eF9jbGVhbnVwKHZvaWQgKmh3X2N0eCkKK3sKK30KKwogc3RhdGljIHZv
aWQgYWRlX2RybV9jbGVhbnVwKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCiB7CiB9CkBA
IC0xMDg5LDYgKzEwOTMsOSBAQCBzdHJ1Y3Qga2lyaW5fZHJtX2RhdGEgYWRlX2RyaXZlcl9kYXRh
ID0gewogCS5wbGFuZV9mdW5jcyA9ICZhZGVfcGxhbmVfZnVuY3MsCiAJLm1vZGVfY29uZmlnX2Z1
bmNzID0gJmFkZV9tb2RlX2NvbmZpZ19mdW5jcywKIAorCS5hbGxvY19od19jdHggPSBhZGVfaHdf
Y3R4X2FsbG9jLAorCS5jbGVhbnVwX2h3X2N0eCA9IGFkZV9od19jdHhfY2xlYW51cCwKKwogCS5p
bml0ID0gYWRlX2RybV9pbml0LAogCS5jbGVhbnVwID0gYWRlX2RybV9jbGVhbnVwCiB9OwpkaWZm
IC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2hpc2lsaWNvbi9raXJpbi9raXJpbl9kcm1fZHJ2Lmgg
Yi9kcml2ZXJzL2dwdS9kcm0vaGlzaWxpY29uL2tpcmluL2tpcmluX2RybV9kcnYuaAppbmRleCA5
NWY1NmM5OTYwZDUuLjE2NjM2MTBkMmNkOCAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2hp
c2lsaWNvbi9raXJpbi9raXJpbl9kcm1fZHJ2LmgKKysrIGIvZHJpdmVycy9ncHUvZHJtL2hpc2ls
aWNvbi9raXJpbi9raXJpbl9kcm1fZHJ2LmgKQEAgLTQ5LDYgKzQ5LDExIEBAIHN0cnVjdCBraXJp
bl9kcm1fZGF0YSB7CiAJY29uc3Qgc3RydWN0IGRybV9wbGFuZV9oZWxwZXJfZnVuY3MgKnBsYW5l
X2hlbHBlcl9mdW5jczsKIAljb25zdCBzdHJ1Y3QgZHJtX3BsYW5lX2Z1bmNzICAqcGxhbmVfZnVu
Y3M7CiAJY29uc3Qgc3RydWN0IGRybV9tb2RlX2NvbmZpZ19mdW5jcyAqbW9kZV9jb25maWdfZnVu
Y3M7CisKKwl2b2lkICooKmFsbG9jX2h3X2N0eCkoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRl
diwKKwkJCSAgICAgIHN0cnVjdCBkcm1fY3J0YyAqY3J0Yyk7CisJdm9pZCAoKmNsZWFudXBfaHdf
Y3R4KSh2b2lkICpod19jdHgpOworCiAJaW50ICgqaW5pdCkoc3RydWN0IHBsYXRmb3JtX2Rldmlj
ZSAqcGRldik7CiAJdm9pZCAoKmNsZWFudXApKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYp
OwogfTsKLS0gCjIuMTcuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJp
LWRldmVs
