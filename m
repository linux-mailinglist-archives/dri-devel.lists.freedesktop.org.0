Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8139335E0A3
	for <lists+dri-devel@lfdr.de>; Tue, 13 Apr 2021 15:52:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E25589DD5;
	Tue, 13 Apr 2021 13:52:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [IPv6:2a00:1450:4864:20::52e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E136489CA8
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Apr 2021 13:52:51 +0000 (UTC)
Received: by mail-ed1-x52e.google.com with SMTP id 18so19516324edx.3
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Apr 2021 06:52:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=FVL0BgBsuCyt6x71yV2SuUPVTs3tOkFSsKQTRfH0RRY=;
 b=BekQEhlXUObKDvsRlauX6WCOaCRjtZApv5mNsu6OWJt8t0FGXb+vhP3DFI0bah+p60
 vjfSC7yVVOVBzrYnvxnnRjn6BxfZkWB0/TOtvmRRCRoiP6JvLnxAS8bfCUrxw53HoYk5
 2uvHvCSMFMzRtAWZbda9SVXjclpD8NgRsm0Nnfn8NqpkkPuGmpQRX9/26FFPaDaXFiR1
 tIzjrFq4AkMcFbqrGj+jHK2+o4TWJ4wdHcrlM50ADS6/+D+nQ0G7B9LBrWZFnPo4tk49
 2QkWKcJ9FCfBaGZH5BqfbVkj0v3GHPg5CeNt9RkXMkOuSd49exErWQKIFO94DF77VD2b
 1H4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=FVL0BgBsuCyt6x71yV2SuUPVTs3tOkFSsKQTRfH0RRY=;
 b=GEi+qCfPb88AiluT9x1glsPL3U9LAc4fJwU5JYvo6doy0PSl+eV9xpmSkQCXtVXBQT
 BkNql62hZm/qORGaJ4eI0XLIU31vEW5Nb79/6zqZCRAPrGF8d7QUYu5t593yYva5B2bO
 it483jqhbWgAPNQG8EWOYRN5OQOfKTWfXJ5lfxcbTwyJy3CifMdYuH3JcVvry64G/+W9
 sy1xTAPFJibcI5PX+sjqliXOidp9OZ6dAXmo6C3kocftZR6Dp+AOnOKQRMsNV9rcUF0q
 PmyZN9wFkM8tw09lq+Xu2sc/uoSbWSQheWjylM428WJHOZEBx/gj6ZSjLlWVgl0p9a0d
 0Qkg==
X-Gm-Message-State: AOAM533JUSCpjNc80jCtjhlxTR/HFNo7dD6IXi2MW6mZeB2dEY2XQV4N
 QEByLl78dKsuSqrwRkLEB28H8gMnuec=
X-Google-Smtp-Source: ABdhPJzpe8MjVnmnKuRwbgpvJoEP+Rl3O1P62Pf99V7ou4E7KV0+GOncPwlf7NxQN6vMr1YAXeIAeQ==
X-Received: by 2002:aa7:c654:: with SMTP id z20mr35410842edr.159.1618321970650; 
 Tue, 13 Apr 2021 06:52:50 -0700 (PDT)
Received: from abel.fritz.box ([2a02:908:1252:fb60:a061:9101:8418:4794])
 by smtp.gmail.com with ESMTPSA id m10sm491465ejc.32.2021.04.13.06.52.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Apr 2021 06:52:50 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 2/7] drm/amdgpu: check base size instead of mem.num_pages
Date: Tue, 13 Apr 2021 15:52:43 +0200
Message-Id: <20210413135248.1266-2-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210413135248.1266-1-christian.koenig@amd.com>
References: <20210413135248.1266-1-christian.koenig@amd.com>
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
Cc: daniel.vetter@ffwll.ch, thomas.hellstrom@linux.intel.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RHJvcCBzb21lIHVzc2FnZSBvZiBtZW0gaW4gdGhlIGNvZGUuCgpTaWduZWQtb2ZmLWJ5OiBDaHJp
c3RpYW4gS8O2bmlnIDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+Ci0tLQogZHJpdmVycy9ncHUv
ZHJtL2FtZC9hbWRncHUvYW1kZ3B1X29iamVjdC5jIHwgNyArKystLS0tCiAxIGZpbGUgY2hhbmdl
ZCwgMyBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMv
Z3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9vYmplY3QuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQv
YW1kZ3B1L2FtZGdwdV9vYmplY3QuYwppbmRleCA5ODRkY2Y1YTQ3NWUuLmUzMTZjZWJiMWZkYyAx
MDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X29iamVjdC5jCisr
KyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9vYmplY3QuYwpAQCAtMTMyNyw3
ICsxMzI3LDcgQEAgdm1fZmF1bHRfdCBhbWRncHVfYm9fZmF1bHRfcmVzZXJ2ZV9ub3RpZnkoc3Ry
dWN0IHR0bV9idWZmZXJfb2JqZWN0ICpibykKIAlzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldiA9
IGFtZGdwdV90dG1fYWRldihiby0+YmRldik7CiAJc3RydWN0IHR0bV9vcGVyYXRpb25fY3R4IGN0
eCA9IHsgZmFsc2UsIGZhbHNlIH07CiAJc3RydWN0IGFtZGdwdV9ibyAqYWJvID0gdHRtX3RvX2Ft
ZGdwdV9ibyhibyk7Ci0JdW5zaWduZWQgbG9uZyBvZmZzZXQsIHNpemU7CisJdW5zaWduZWQgbG9u
ZyBvZmZzZXQ7CiAJaW50IHI7CiAKIAkvKiBSZW1lbWJlciB0aGF0IHRoaXMgQk8gd2FzIGFjY2Vz
c2VkIGJ5IHRoZSBDUFUgKi8KQEAgLTEzMzYsOSArMTMzNiw4IEBAIHZtX2ZhdWx0X3QgYW1kZ3B1
X2JvX2ZhdWx0X3Jlc2VydmVfbm90aWZ5KHN0cnVjdCB0dG1fYnVmZmVyX29iamVjdCAqYm8pCiAJ
aWYgKGJvLT5tZW0ubWVtX3R5cGUgIT0gVFRNX1BMX1ZSQU0pCiAJCXJldHVybiAwOwogCi0Jc2l6
ZSA9IGJvLT5tZW0ubnVtX3BhZ2VzIDw8IFBBR0VfU0hJRlQ7CiAJb2Zmc2V0ID0gYm8tPm1lbS5z
dGFydCA8PCBQQUdFX1NISUZUOwotCWlmICgob2Zmc2V0ICsgc2l6ZSkgPD0gYWRldi0+Z21jLnZp
c2libGVfdnJhbV9zaXplKQorCWlmICgob2Zmc2V0ICsgYm8tPmJhc2Uuc2l6ZSkgPD0gYWRldi0+
Z21jLnZpc2libGVfdnJhbV9zaXplKQogCQlyZXR1cm4gMDsKIAogCS8qIENhbid0IG1vdmUgYSBw
aW5uZWQgQk8gdG8gdmlzaWJsZSBWUkFNICovCkBAIC0xMzYzLDcgKzEzNjIsNyBAQCB2bV9mYXVs
dF90IGFtZGdwdV9ib19mYXVsdF9yZXNlcnZlX25vdGlmeShzdHJ1Y3QgdHRtX2J1ZmZlcl9vYmpl
Y3QgKmJvKQogCW9mZnNldCA9IGJvLT5tZW0uc3RhcnQgPDwgUEFHRV9TSElGVDsKIAkvKiB0aGlz
IHNob3VsZCBuZXZlciBoYXBwZW4gKi8KIAlpZiAoYm8tPm1lbS5tZW1fdHlwZSA9PSBUVE1fUExf
VlJBTSAmJgotCSAgICAob2Zmc2V0ICsgc2l6ZSkgPiBhZGV2LT5nbWMudmlzaWJsZV92cmFtX3Np
emUpCisJICAgIChvZmZzZXQgKyBiby0+YmFzZS5zaXplKSA+IGFkZXYtPmdtYy52aXNpYmxlX3Zy
YW1fc2l6ZSkKIAkJcmV0dXJuIFZNX0ZBVUxUX1NJR0JVUzsKIAogCXR0bV9ib19tb3ZlX3RvX2xy
dV90YWlsX3VubG9ja2VkKGJvKTsKLS0gCjIuMjUuMQoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vZHJpLWRldmVsCg==
