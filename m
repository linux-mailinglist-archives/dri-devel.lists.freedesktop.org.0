Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DE8C92433F0
	for <lists+dri-devel@lfdr.de>; Thu, 13 Aug 2020 08:21:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 82E106E283;
	Thu, 13 Aug 2020 06:21:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com
 [IPv6:2a00:1450:4864:20::243])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F00996E283;
 Thu, 13 Aug 2020 06:21:20 +0000 (UTC)
Received: by mail-lj1-x243.google.com with SMTP id w25so4882488ljo.12;
 Wed, 12 Aug 2020 23:21:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=mV6j1YOlt73/vZbx39+AFv7LWnETp8Vud91G3AB3D38=;
 b=X1HwcSp96q0CP6XQhQs1GPo4nvPWoE+L2nDF9ZIDpZERw+rLiB/bEU8Te/A/TZJwkY
 mzhpjqBC43Z7FmQs5BkoYUSqU00bNuiM9TP22ps5RBUCgoV4ZKi60dhMorf9RPuguvA6
 4fJcM/d1wkeekHTE4FSDqDmLHrjLrQIS3JmTLdjKyngRnCxATKCAbkC3rOV0A8YSslEe
 TwMAWkKQvK3XwuP5Np6ZFuqdw+2z2u6WSfh88ZM2rvbGA9OIbIlxxnOWSJYEK8z1AU4o
 xnKrJYGQ/x7V3n1WM+bFyErLhocUGoQ8HA9vmdK2oTnr1U1XZiQuXYUXxCIbxRnGYR7N
 tvDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=mV6j1YOlt73/vZbx39+AFv7LWnETp8Vud91G3AB3D38=;
 b=tMu3KgT2jUqzF5RgfcDlYkaEU5OHmVVObePk11ZYQNygfbVQhCZOqCbjFADySqU4NW
 6EJfyHOeFc/8TS7x8hyC21r00SheeVkBLdBifZ1Me75tKYcGL1eVbTHKdnwUCBa9plVi
 KtFwJwQOz6+NTEoF+vCJA5dCCxNRVqSZ5J4+bBzGXE89WYeTIVe4l/tkBdh/Fw1jETHr
 OgVjGU42HkurrNK1QaW7zU6BrSt9/uSAf1G3s1CHq9cOHpLZxDLVcsCGCfqlGLbxGk5H
 +jhmPt6QEcVKMIIL6BVquzBq6ikReq0AIrxNfPe+FiuWN/HZpwG7vhA6QmS0YPq2z6V8
 qI1A==
X-Gm-Message-State: AOAM532zXI3MZpvQa0Q978uzhc5LXV7oTv8v93cAu7WaDH8A9iA7IcMD
 fe1vgqGQuwduVq57WLAwFrM=
X-Google-Smtp-Source: ABdhPJyccRfWxWmuepWebwNoe1LCZJoc+bCL+PgtqKkfshXws5t6wobDOmvACsoPZG83M+Ft4/SImQ==
X-Received: by 2002:a2e:3c03:: with SMTP id j3mr1259425lja.397.1597299679335; 
 Wed, 12 Aug 2020 23:21:19 -0700 (PDT)
Received: from a2klaptop.localdomain ([185.199.97.5])
 by smtp.gmail.com with ESMTPSA id f14sm964060lfd.2.2020.08.12.23.21.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Aug 2020 23:21:18 -0700 (PDT)
From: Oleksandr Andrushchenko <andr2000@gmail.com>
To: xen-devel@lists.xenproject.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, boris.ostrovsky@oracle.com, jgross@suse.com,
 airlied@linux.ie, daniel@ffwll.ch
Subject: [PATCH v2 3/5] drm/xen-front: Add YUYV to supported formats
Date: Thu, 13 Aug 2020 09:21:11 +0300
Message-Id: <20200813062113.11030-4-andr2000@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200813062113.11030-1-andr2000@gmail.com>
References: <20200813062113.11030-1-andr2000@gmail.com>
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
Cc: intel-gfx@lists.freedesktop.org, sstabellini@kernel.org,
 dan.carpenter@oracle.com,
 Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogT2xla3NhbmRyIEFuZHJ1c2hjaGVua28gPG9sZWtzYW5kcl9hbmRydXNoY2hlbmtvQGVw
YW0uY29tPgoKQWRkIFlVWVYgdG8gc3VwcG9ydGVkIGZvcm1hdHMsIHNvIHRoZSBmcm9udGVuZCBj
YW4gd29yayB3aXRoIHRoZQpmb3JtYXRzIHVzZWQgYnkgY2FtZXJhcyBhbmQgb3RoZXIgSFcuCgpT
aWduZWQtb2ZmLWJ5OiBPbGVrc2FuZHIgQW5kcnVzaGNoZW5rbyA8b2xla3NhbmRyX2FuZHJ1c2hj
aGVua29AZXBhbS5jb20+CkFja2VkLWJ5OiBOb3JhbGYgVHLDuG5uZXMgPG5vcmFsZkB0cm9ubmVz
Lm9yZz4KLS0tCiBkcml2ZXJzL2dwdS9kcm0veGVuL3hlbl9kcm1fZnJvbnRfY29ubi5jIHwgMSAr
CiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKykKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dw
dS9kcm0veGVuL3hlbl9kcm1fZnJvbnRfY29ubi5jIGIvZHJpdmVycy9ncHUvZHJtL3hlbi94ZW5f
ZHJtX2Zyb250X2Nvbm4uYwppbmRleCA0NTk3MDJmYTk5MGUuLjQ0ZjFmNzBjMGFlZCAxMDA2NDQK
LS0tIGEvZHJpdmVycy9ncHUvZHJtL3hlbi94ZW5fZHJtX2Zyb250X2Nvbm4uYworKysgYi9kcml2
ZXJzL2dwdS9kcm0veGVuL3hlbl9kcm1fZnJvbnRfY29ubi5jCkBAIC0zMyw2ICszMyw3IEBAIHN0
YXRpYyBjb25zdCB1MzIgcGxhbmVfZm9ybWF0c1tdID0gewogCURSTV9GT1JNQVRfQVJHQjQ0NDQs
CiAJRFJNX0ZPUk1BVF9YUkdCMTU1NSwKIAlEUk1fRk9STUFUX0FSR0IxNTU1LAorCURSTV9GT1JN
QVRfWVVZViwKIH07CiAKIGNvbnN0IHUzMiAqeGVuX2RybV9mcm9udF9jb25uX2dldF9mb3JtYXRz
KGludCAqZm9ybWF0X2NvdW50KQotLSAKMi4xNy4xCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1h
bi9saXN0aW5mby9kcmktZGV2ZWwK
