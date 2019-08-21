Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CEA4C97974
	for <lists+dri-devel@lfdr.de>; Wed, 21 Aug 2019 14:32:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E36B36E316;
	Wed, 21 Aug 2019 12:32:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C8BB06E30B
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Aug 2019 12:31:51 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id 10so1936480wmp.3
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Aug 2019 05:31:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=vRxenyuPXTsYnahqRGyH5Yj5fC/fTi1KqSFOQ4JZ9Gw=;
 b=iiQdiTk1iL3t+hsiqC9YNBSy/1soAFvpf6PUiKjT3vtdArUMqt2PYcuhMwVBrNoIt8
 hez9ZPQFyhp7vaoixYFsy1nW2qCmqh1h0fy/hhngLSxGGtcXVlk2dUi2rgaoRz5pl97d
 TrJgRSMxeQkYcm7ygjlu+J+9utpLkJSOr+Bc+P7n5j6ShHTmgh8imek2kPlWBaKWMKU8
 BQoh91rqEKOI3HcAGpgtz+Yu4QBXfboQQHGttemAz5ODSNQJzWuGapU8gdBNnQv51G3x
 OWelGyrdfN5cKeCMp+FNL9R0eiG88tcAkG855yYoxWnkeaRR6yNNPR+t3ND8c4fDA9ur
 0kOw==
X-Gm-Message-State: APjAAAWXBbXGtm4Qql0r8St8r7JkGgroqgOwsj7kxmxNR5nf9SNBfaUS
 wH39A746bRjzpACqIuVb1f9pzYVV
X-Google-Smtp-Source: APXvYqytx4jIhEs5N7wdzTIPC5/5YonglEmhFRoN8cVyNZfDM3u68wy5ntVWhBf7ISyXWk0v2rofoQ==
X-Received: by 2002:a1c:1d4f:: with SMTP id d76mr6199693wmd.127.1566390710289; 
 Wed, 21 Aug 2019 05:31:50 -0700 (PDT)
Received: from abel.fritz.box ([2a02:908:1252:fb60:8189:dd33:a934:c4fa])
 by smtp.gmail.com with ESMTPSA id v3sm23084571wrq.34.2019.08.21.05.31.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Aug 2019 05:31:49 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: dri-devel@lists.freedesktop.org, chris@chris-wilson.co.uk,
 daniel.vetter@ffwll.ch, sumit.semwal@linaro.org,
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
Subject: [PATCH 01/10] dma-buf: make to_dma_fence_array NULL safe
Date: Wed, 21 Aug 2019 14:31:38 +0200
Message-Id: <20190821123147.110736-2-christian.koenig@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190821123147.110736-1-christian.koenig@amd.com>
References: <20190821123147.110736-1-christian.koenig@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=vRxenyuPXTsYnahqRGyH5Yj5fC/fTi1KqSFOQ4JZ9Gw=;
 b=NJrL3XmrnUWfBNkl8aiq8ei98CkVERx3HcNoujZ4cEQs+IfvAc53siSy0b2/FIwMJ6
 sJR/dmHEFSrwKbWVa1LEHcebpLkgdbesPcWukPLAaUqqOf7gOMlPgyk3go0qkg9bppx5
 qz17wLSdHAUgIj3c9Ve6dKIr4MhlLUMI2SgP8eIo+fSAObImyakpvmGE9bUikGfJJVTA
 BB5syatvbCcXs6ND2fhlK8NEPsLH8tfSa7Nan3DkVATJu11abImtVpLqGvLgGJBTb4o9
 xgIkChloADsd/scie8iJbbR0bT2o9PMlU4OZYTyQzILStwMPKCYTKiR5jWG1DCOQmpYn
 /zVw==
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QSBiaXQgc3VycHJpc2luZyB0aGF0IHRoaXMgd2Fzbid0IGFscmVhZHkgdGhlIGNhc2UuCgpTaWdu
ZWQtb2ZmLWJ5OiBDaHJpc3RpYW4gS8O2bmlnIDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+Ci0t
LQogaW5jbHVkZS9saW51eC9kbWEtZmVuY2UtYXJyYXkuaCB8IDIgKy0KIDEgZmlsZSBjaGFuZ2Vk
LCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2luY2x1ZGUvbGlu
dXgvZG1hLWZlbmNlLWFycmF5LmggYi9pbmNsdWRlL2xpbnV4L2RtYS1mZW5jZS1hcnJheS5oCmlu
ZGV4IDMwM2RkNzEyMjIwZi4uZjk5Y2Q3ZWIyNGUwIDEwMDY0NAotLS0gYS9pbmNsdWRlL2xpbnV4
L2RtYS1mZW5jZS1hcnJheS5oCisrKyBiL2luY2x1ZGUvbGludXgvZG1hLWZlbmNlLWFycmF5LmgK
QEAgLTY4LDcgKzY4LDcgQEAgc3RhdGljIGlubGluZSBib29sIGRtYV9mZW5jZV9pc19hcnJheShz
dHJ1Y3QgZG1hX2ZlbmNlICpmZW5jZSkKIHN0YXRpYyBpbmxpbmUgc3RydWN0IGRtYV9mZW5jZV9h
cnJheSAqCiB0b19kbWFfZmVuY2VfYXJyYXkoc3RydWN0IGRtYV9mZW5jZSAqZmVuY2UpCiB7Ci0J
aWYgKGZlbmNlLT5vcHMgIT0gJmRtYV9mZW5jZV9hcnJheV9vcHMpCisJaWYgKCFmZW5jZSB8fCBm
ZW5jZS0+b3BzICE9ICZkbWFfZmVuY2VfYXJyYXlfb3BzKQogCQlyZXR1cm4gTlVMTDsKIAogCXJl
dHVybiBjb250YWluZXJfb2YoZmVuY2UsIHN0cnVjdCBkbWFfZmVuY2VfYXJyYXksIGJhc2UpOwot
LSAKMi4xNy4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
aHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
