Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 322B82EB267
	for <lists+dri-devel@lfdr.de>; Tue,  5 Jan 2021 19:23:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 95B5E6E081;
	Tue,  5 Jan 2021 18:23:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4653D893DB;
 Tue,  5 Jan 2021 18:23:12 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id k10so412860wmi.3;
 Tue, 05 Jan 2021 10:23:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Jdi1aew/RRDRQraRHLdBF/rQeDGFMlRxcbGjVTZuLvA=;
 b=pMBAkiBIvyJeEGrAHlbxLGOj7f3R4e1OQJyOzegtKKUkxMmvQMM1K/vo1UHtGzPdFm
 0JzT47or7Tkx23jmxAVLZfoe4RF6w6bckoTlHV92tRCfh6K6Xtbs+GmB1qeLpdrPZiEf
 d4uuXfRMVcuftLKM2bDeWpgX1Wk/Qsfj2HQuWGnE4bMvuK4zbxP1vFKfX7aq9z6gku+i
 upYvCF2LFxdqO7jKQmQJ9scugxjtQgRUey25bR5eRY4NDqrDH6N/aIwBhBiyj30HWz4P
 Q44qJjgIrGZK2JhfPeLLE+XWxNK5ECptzyMupmeV2yfOlB+29Zd/+8CTt3VdHLlwufgJ
 TyNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Jdi1aew/RRDRQraRHLdBF/rQeDGFMlRxcbGjVTZuLvA=;
 b=eo2t6PngaAJ+iDyMd70THvWf+iNBLrQcPm5YpJ0uEaF60FhfhjAGOcSFl/naJXQmOG
 T9WpSJ8Y8rTYR3P65Mj9QMRgAYSL5vbc5Ra2KUeFWSZlH55Y6TDTVSQ3tCPyW6Yk8gqr
 aFVrBYySNUTf5WQYOdrK9kBaeXobgysuQZoBlrIyYA9lUYV+xxktusz/hz8FNUH4BD3P
 8FCz3GSKqGCSSKvIZ2Wy/2hIIeX9GrZbKd+4HTCleokgTiuZg09Kgil+M9cnU8QY+MXW
 Gd6SKnlPlzV49LGTu0UNxHb0opNGgQqMNn1sYVATRqIn45qsI7CaYeFSXpjnf+lU4x96
 cf4w==
X-Gm-Message-State: AOAM531x3fNZOq8Du26VwnKCul2iHGC2Aab4uP0LNyblVQgHhfvosbJR
 cVU0ArEO/Xq5aEwbPolkziNg3liUcNw=
X-Google-Smtp-Source: ABdhPJyM2vQ9to2ECHUhVYKuJLlnGsrK7MupBlAZUjKNbKv3OfP91YwVYh2hHBg5BE7WNjiV10Lpcg==
X-Received: by 2002:a1c:48d:: with SMTP id 135mr355127wme.147.1609870991038;
 Tue, 05 Jan 2021 10:23:11 -0800 (PST)
Received: from abel.fritz.box ([2a02:908:1252:fb60:bc55:70b5:dce4:a5cb])
 by smtp.gmail.com with ESMTPSA id d9sm844587wrc.87.2021.01.05.10.23.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Jan 2021 10:23:10 -0800 (PST)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: bp@alien8.de,
	ray.huang@amd.com
Subject: [PATCH 2/2] drm/ttm: unexport ttm_pool_init/fini
Date: Tue,  5 Jan 2021 19:23:09 +0100
Message-Id: <20210105182309.1362-2-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210105182309.1362-1-christian.koenig@amd.com>
References: <20210105182309.1362-1-christian.koenig@amd.com>
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
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RHJpdmVycyBhcmUgbm90IHN1cHBvc2VkIHRvIHVzZSB0aGlzIGRpcmVjdGx5IGFueSBtb3JlLgoK
U2lnbmVkLW9mZi1ieTogQ2hyaXN0aWFuIEvDtm5pZyA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29t
PgotLS0KIGRyaXZlcnMvZ3B1L2RybS90dG0vdHRtX3Bvb2wuYyB8IDIgLS0KIDEgZmlsZSBjaGFu
Z2VkLCAyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS90dG0vdHRt
X3Bvb2wuYyBiL2RyaXZlcnMvZ3B1L2RybS90dG0vdHRtX3Bvb2wuYwppbmRleCBjODFlNmViNzJk
YTEuLjkwODlhMDQ3Y2I1MSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL3R0bS90dG1fcG9v
bC5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS90dG0vdHRtX3Bvb2wuYwpAQCAtNTI2LDcgKzUyNiw2
IEBAIHZvaWQgdHRtX3Bvb2xfaW5pdChzdHJ1Y3QgdHRtX3Bvb2wgKnBvb2wsIHN0cnVjdCBkZXZp
Y2UgKmRldiwKIAkJCQkJCSAgIHBvb2wsIGksIGopOwogCX0KIH0KLUVYUE9SVF9TWU1CT0wodHRt
X3Bvb2xfaW5pdCk7CiAKIC8qKgogICogdHRtX3Bvb2xfZmluaSAtIENsZWFudXAgYSBwb29sCkBA
IC01NDYsNyArNTQ1LDYgQEAgdm9pZCB0dG1fcG9vbF9maW5pKHN0cnVjdCB0dG1fcG9vbCAqcG9v
bCkKIAkJCQl0dG1fcG9vbF90eXBlX2ZpbmkoJnBvb2wtPmNhY2hpbmdbaV0ub3JkZXJzW2pdKTsK
IAl9CiB9Ci1FWFBPUlRfU1lNQk9MKHR0bV9wb29sX2ZpbmkpOwogCiAvKiBBcyBsb25nIGFzIHBh
Z2VzIGFyZSBhdmFpbGFibGUgbWFrZSBzdXJlIHRvIHJlbGVhc2UgYXQgbGVhc3Qgb25lICovCiBz
dGF0aWMgdW5zaWduZWQgbG9uZyB0dG1fcG9vbF9zaHJpbmtlcl9zY2FuKHN0cnVjdCBzaHJpbmtl
ciAqc2hyaW5rLAotLSAKMi4yNS4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5m
by9kcmktZGV2ZWwK
