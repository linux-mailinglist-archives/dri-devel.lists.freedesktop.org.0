Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 86C6E96CC3
	for <lists+dri-devel@lfdr.de>; Wed, 21 Aug 2019 01:07:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7680C6E8CA;
	Tue, 20 Aug 2019 23:07:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com
 [IPv6:2607:f8b0:4864:20::543])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A2196E8CA
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Aug 2019 23:07:06 +0000 (UTC)
Received: by mail-pg1-x543.google.com with SMTP id l21so162910pgm.3
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Aug 2019 16:07:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=kPTZRFMdlMvsVJLbNqEMp+KDg1p/2/PzTgB54sSjI/U=;
 b=RNo1ygLknKqgqIAhuxSxehS/ND80J9zNGrqN8F0k2ehX8PALx7xtqDOY/px61Ub4MR
 gJGoVAqPuEK15/J8jb5j9SGyTpQAlXQzgUtLIPwN0AeeEzmQDiPRuaMXiv6jsBE2WH7b
 nX21pZPWpN9m8zDu0bGaZmsQIGnrgQwIolA37v+WJ6a4zbBci1OW4ODi50JiaVKy+ptc
 rO7Cun3BpAC5YzQTcPXSIheOvr9OzkucC0hfD34O8jxloIZvsoTeia95LXfIScHwrnSj
 +qhnlk9qFiAPy/SCGa9seAX/5dqs4kWaPPkvFnY6jsrEa3xRhhxwflQ9PDlgZrAt/0c5
 o2YA==
X-Gm-Message-State: APjAAAXmZ/ecziRofI+evBzMP7T43OC50kqBrorVKIvfLA9GNQBJf8sr
 9sN9J1MglREXSJ9LrG0TK59Jrw==
X-Google-Smtp-Source: APXvYqwPWi3hV1aULI47BdH1J86xCw7uOXUE660dq+vqeuPuIugq7A8By+kPCr/L6d0RdR//xPBKqQ==
X-Received: by 2002:aa7:8488:: with SMTP id u8mr33269995pfn.229.1566342423834; 
 Tue, 20 Aug 2019 16:07:03 -0700 (PDT)
Received: from localhost.localdomain ([2601:1c2:680:1319:692:26ff:feda:3a81])
 by smtp.gmail.com with ESMTPSA id
 q4sm27564747pff.183.2019.08.20.16.07.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Aug 2019 16:07:03 -0700 (PDT)
From: John Stultz <john.stultz@linaro.org>
To: lkml <linux-kernel@vger.kernel.org>
Subject: [PATCH v5 21/25] drm: kirin: Fix dev->driver_data setting
Date: Tue, 20 Aug 2019 23:06:22 +0000
Message-Id: <20190820230626.23253-22-john.stultz@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190820230626.23253-1-john.stultz@linaro.org>
References: <20190820230626.23253-1-john.stultz@linaro.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=kPTZRFMdlMvsVJLbNqEMp+KDg1p/2/PzTgB54sSjI/U=;
 b=zyuDY+Dz9GS/ATmdo/KHEQi19IecSLdC2e6bTsUgY8jsteM9oMqvfXbaXAc221LP31
 yDMUOoUvjo/Bi9oOEz3JmkMbJIZIbvDJ9NOb6jy85smlKiLm+/XLeT245/yjrermAOY5
 IJyQFysEf15/jxU+Cv4Idz8tX4x6CfhARclR4mJwN+/o4teAp1RCRWNuFLhU2HFq8L/t
 Lvdu//m4AfDM1ZNAvfH7KbtLSJKvmK/agBLsSJHP/82IzWM8RBUtf8i6T+OerKLYFRho
 R7ljI1474mWznSb+KYDK0/c9Y5HW1lvd6goCAFrlpf9zCKH0OPMwy5y9GB7i73I8Zk/g
 9prQ==
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
d2FyZSByZXZpc2lvbnMsIHRoaXMgcGF0Y2ggY2hhbmdlcyB0aGUKZGV2LT5kcml2ZXJfZGF0YSB0
byBwb2ludCB0byBhIGRybV9kZXZpY2UsIG5vdCBhZGVfZGF0YS4KClRodXMgd2Ugc2V0IHRoZSBk
cml2ZXIgZGF0YSB0byBkcm0gZGV2aWNlIGFmdGVyIGFsbG9jLgoKQ2M6IFJvbmdyb25nIFpvdSA8
em91cm9uZ3JvbmdAZ21haWwuY29tPgpDYzogWGlubGlhbmcgTGl1IDx6LmxpdXhpbmxpYW5nQGhp
c2lsaWNvbi5jb20+CkNjOiBEYXZpZCBBaXJsaWUgPGFpcmxpZWRAbGludXguaWU+CkNjOiBEYW5p
ZWwgVmV0dGVyIDxkYW5pZWxAZmZ3bGwuY2g+CkNjOiBkcmktZGV2ZWwgPGRyaS1kZXZlbEBsaXN0
cy5mcmVlZGVza3RvcC5vcmc+CkNjOiBTYW0gUmF2bmJvcmcgPHNhbUByYXZuYm9yZy5vcmc+CkFj
a2VkLWJ5OiBYaW5saWFuZyBMaXUgPHoubGl1eGlubGlhbmdAaGlzaWxpY29uLmNvbT4KUmV2aWV3
ZWQtYnk6IFNhbSBSYXZuYm9yZyA8c2FtQHJhdm5ib3JnLm9yZz4KU2lnbmVkLW9mZi1ieTogWHUg
WWlQaW5nIDx4dXlpcGluZ0BoaXNpbGljb24uY29tPgpbanN0dWx0ejogUmV3b3JkZWQgY29tbWl0
IG1lc3NhZ2VdClNpZ25lZC1vZmYtYnk6IEpvaG4gU3R1bHR6IDxqb2huLnN0dWx0ekBsaW5hcm8u
b3JnPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9oaXNpbGljb24va2lyaW4va2lyaW5fZHJtX2FkZS5j
IHwgMSAtCiBkcml2ZXJzL2dwdS9kcm0vaGlzaWxpY29uL2tpcmluL2tpcmluX2RybV9kcnYuYyB8
IDMgKy0tCiAyIGZpbGVzIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAzIGRlbGV0aW9ucygtKQoK
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9oaXNpbGljb24va2lyaW4va2lyaW5fZHJtX2Fk
ZS5jIGIvZHJpdmVycy9ncHUvZHJtL2hpc2lsaWNvbi9raXJpbi9raXJpbl9kcm1fYWRlLmMKaW5k
ZXggZTM5MGIxYjY1N2I4Li5kOGU0MGZjZmYzODYgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2Ry
bS9oaXNpbGljb24va2lyaW4va2lyaW5fZHJtX2FkZS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9o
aXNpbGljb24va2lyaW4va2lyaW5fZHJtX2FkZS5jCkBAIC05OTksNyArOTk5LDYgQEAgc3RhdGlj
IGludCBhZGVfZHJtX2luaXQoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikKIAkJRFJNX0VS
Uk9SKCJmYWlsZWQgdG8gYWxsb2MgYWRlX2RhdGFcbiIpOwogCQlyZXR1cm4gLUVOT01FTTsKIAl9
Ci0JcGxhdGZvcm1fc2V0X2RydmRhdGEocGRldiwgYWRlKTsKIAogCWN0eCA9IGFkZV9od19jdHhf
YWxsb2MocGRldiwgJmFkZS0+Y3J0Yy5iYXNlKTsKIAlpZiAoSVNfRVJSKGN0eCkpIHsKZGlmZiAt
LWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9oaXNpbGljb24va2lyaW4va2lyaW5fZHJtX2Rydi5jIGIv
ZHJpdmVycy9ncHUvZHJtL2hpc2lsaWNvbi9raXJpbi9raXJpbl9kcm1fZHJ2LmMKaW5kZXggNjhk
ZTg4MzhkYTNjLi43ZjhkNDUzOWIxYTkgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9oaXNp
bGljb24va2lyaW4va2lyaW5fZHJtX2Rydi5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9oaXNpbGlj
b24va2lyaW4va2lyaW5fZHJtX2Rydi5jCkBAIC00NCw4ICs0NCw2IEBAIHN0YXRpYyBpbnQga2ly
aW5fZHJtX2ttc19pbml0KHN0cnVjdCBkcm1fZGV2aWNlICpkZXYpCiB7CiAJaW50IHJldDsKIAot
CWRldl9zZXRfZHJ2ZGF0YShkZXYtPmRldiwgZGV2KTsKLQogCS8qIGRldi0+bW9kZV9jb25maWcg
aW5pdGlhbGl6YXRpb24gKi8KIAlkcm1fbW9kZV9jb25maWdfaW5pdChkZXYpOwogCWRldi0+bW9k
ZV9jb25maWcubWluX3dpZHRoID0gMDsKQEAgLTE0MCw2ICsxMzgsNyBAQCBzdGF0aWMgaW50IGtp
cmluX2RybV9iaW5kKHN0cnVjdCBkZXZpY2UgKmRldikKIAlkcm1fZGV2ID0gZHJtX2Rldl9hbGxv
Yyhkcml2ZXJfZGF0YS0+ZHJpdmVyLCBkZXYpOwogCWlmIChJU19FUlIoZHJtX2RldikpCiAJCXJl
dHVybiBQVFJfRVJSKGRybV9kZXYpOworCWRldl9zZXRfZHJ2ZGF0YShkZXYsIGRybV9kZXYpOwog
CiAJcmV0ID0ga2lyaW5fZHJtX2ttc19pbml0KGRybV9kZXYpOwogCWlmIChyZXQpCi0tIAoyLjE3
LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1k
ZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
