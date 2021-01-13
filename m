Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E21FF2F4C11
	for <lists+dri-devel@lfdr.de>; Wed, 13 Jan 2021 14:13:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B1E456E983;
	Wed, 13 Jan 2021 13:13:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [IPv6:2a00:1450:4864:20::629])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 160236E983
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Jan 2021 13:13:48 +0000 (UTC)
Received: by mail-ej1-x629.google.com with SMTP id f4so2985186ejx.7
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Jan 2021 05:13:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=zF3FdhzcKSer6OnbfatcnskPpVi9oPNG63TdEi7Fl2E=;
 b=TwUvmP5cflH8nLVRF6QzYKkcY2ALHZmZT5StBStxoRX5Wc4XmAGhT472MZ0jlAP369
 BdRwtc/zwp34iG0elOTY4/AjU/mLOhJUht3U8fEpZscxN8poQGsCOaC2PzTn4EtEj4rH
 lf2CJM/vveVeq1Ass/Q6rU3P8EnupcaxZ6mfFbeGIxDDV433L5lDFzEUVLdyILcML7zy
 DfIQPQlOz7fu+oJN73U4ZZDVDFgYj9eLjNILkvaumEXupVhhW7iTz5IiETaLozoQDi32
 24QA9tPHJvDmMuZaRs89qDbafq32f+L5ga4SR22/BlfTd1loaloa9cDJYU/dFbIFlzJU
 u7Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=zF3FdhzcKSer6OnbfatcnskPpVi9oPNG63TdEi7Fl2E=;
 b=gN3+E73sbodp8+9H9e3r2mRbUCQ8yLSWze6a/ohDWBILWAoewMQcDlDs0GhT2h1NWA
 Sj/O1ebnMiZFNo1m+aiJUJeqUZ3PtFJIadwyekSw+AYpRe7YR7Zb/CL5Ji15Wz8Peydw
 GP/LJ1VsdyCM8CpT2iuob5oigUHrSt9rLx5Fh21NBXmASEC+HYmH2WOMyaADe8OMPggA
 GGXMdCxC0f9yjBhbf5P4PgjkzRXjX1Rxfpnq/KX5P7qmu/md/HN4VYrTW5tuVQ4QwotZ
 aMvgRdMD1L2yHTYffbqu/W36xP4xpFJ3dlJpH+rU8FtBubr/EGyhUi4S8SRzes3O5IiA
 QUfg==
X-Gm-Message-State: AOAM532Y00zjLtV2IOMPxN/mio6DbwA3DNn3AyG3xf9ZOYYqr9giBAXE
 /dz3qI8r/Iq3jwHKcNLygjV5V2OQeH0=
X-Google-Smtp-Source: ABdhPJzS6dSGLGHYU5v5ma+s0gaWajA5+FBpiNdPvWloRYh5jzhlZ8NolNS6GN0a7jUvtlbWTT+uJA==
X-Received: by 2002:a17:906:60c3:: with SMTP id
 f3mr1503172ejk.65.1610543626734; 
 Wed, 13 Jan 2021 05:13:46 -0800 (PST)
Received: from laptop.fritz.box ([2a02:908:1252:fb60:be8a:bd56:1f94:86e7])
 by smtp.gmail.com with ESMTPSA id x16sm698044ejo.104.2021.01.13.05.13.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Jan 2021 05:13:33 -0800 (PST)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: hdegoede@redhat.com, ray.huang@amd.com, daniel@ffwll.ch,
 dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/ttm: stop using GFP_TRANSHUGE_LIGHT
Date: Wed, 13 Jan 2021 14:13:25 +0100
Message-Id: <20210113131325.223511-1-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhlIG9ubHkgZmxhZyB3ZSByZWFsbHkgbmVlZCBpcyBfX0dGUF9OT01FTUFMTE9DLCBoaWdobWVt
IGRlcGVuZHMgb24KZG1hMzIgYW5kIG1vdmVhYmxlL2NvbXBvdW5kIHNob3VsZCBuZXZlciBiZSBz
ZXQgaW4gdGhlIGZpcnN0IHBsYWNlLgoKU2lnbmVkLW9mZi1ieTogQ2hyaXN0aWFuIEvDtm5pZyA8
Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS90dG0vdHRtX3Bv
b2wuYyB8IDExICsrKysrKy0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgNiBpbnNlcnRpb25zKCspLCA1
IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS90dG0vdHRtX3Bvb2wu
YyBiL2RyaXZlcnMvZ3B1L2RybS90dG0vdHRtX3Bvb2wuYwppbmRleCA4Y2Q3NzZhZGM1OTIuLjEx
ZTAzMTNkYjBlYSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL3R0bS90dG1fcG9vbC5jCisr
KyBiL2RyaXZlcnMvZ3B1L2RybS90dG0vdHRtX3Bvb2wuYwpAQCAtNzksMTIgKzc5LDEzIEBAIHN0
YXRpYyBzdHJ1Y3QgcGFnZSAqdHRtX3Bvb2xfYWxsb2NfcGFnZShzdHJ1Y3QgdHRtX3Bvb2wgKnBv
b2wsIGdmcF90IGdmcF9mbGFncywKIAlzdHJ1Y3QgcGFnZSAqcDsKIAl2b2lkICp2YWRkcjsKIAot
CWlmIChvcmRlcikgewotCQlnZnBfZmxhZ3MgfD0gR0ZQX1RSQU5TSFVHRV9MSUdIVCB8IF9fR0ZQ
X05PUkVUUlkgfAorCS8qIERvbid0IHNldCB0aGUgX19HRlBfQ09NUCBmbGFnIGZvciBoaWdoZXIg
b3JkZXIgYWxsb2NhdGlvbnMuCisJICogTWFwcGluZyBwYWdlcyBkaXJlY3RseSBpbnRvIGFuIHVz
ZXJzcGFjZSBwcm9jZXNzIGFuZCBjYWxsaW5nCisJICogcHV0X3BhZ2UoKSBvbiBhIFRUTSBhbGxv
Y2F0ZWQgcGFnZSBpcyBpbGxlZ2FsLgorCSAqLworCWlmIChvcmRlcikKKwkJZ2ZwX2ZsYWdzIHw9
IF9fR0ZQX05PTUVNQUxMT0MgfCBfX0dGUF9OT1JFVFJZIHwKIAkJCV9fR0ZQX0tTV0FQRF9SRUNM
QUlNOwotCQlnZnBfZmxhZ3MgJj0gfl9fR0ZQX01PVkFCTEU7Ci0JCWdmcF9mbGFncyAmPSB+X19H
RlBfQ09NUDsKLQl9CiAKIAlpZiAoIXBvb2wtPnVzZV9kbWFfYWxsb2MpIHsKIAkJcCA9IGFsbG9j
X3BhZ2VzKGdmcF9mbGFncywgb3JkZXIpOwotLSAKMi4yNS4xCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1k
ZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcv
bWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
