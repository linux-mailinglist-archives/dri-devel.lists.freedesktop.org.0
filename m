Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 975AD101AE8
	for <lists+dri-devel@lfdr.de>; Tue, 19 Nov 2019 09:05:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6BE0D6EBCC;
	Tue, 19 Nov 2019 08:04:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com
 [IPv6:2a00:1450:4864:20::142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 325846E826
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Nov 2019 20:05:56 +0000 (UTC)
Received: by mail-lf1-x142.google.com with SMTP id f18so2544001lfj.6
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Nov 2019 12:05:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=rtrkjrjFdrCSY4w3UkoaopBMgCTAU9tc9NbxXmX2YTg=;
 b=renAoWL2S6m/bZ+fu14lcY17LR9+N/LimEYJyZ+9dIPzA/r63eUGwqjQSqQ/MDVrCz
 plnLyh4sDX9tMPkprYcj4pK5MkVGMgEIzF117PdKp0obh9VqOVQmOKPgIc0KxuFXlgZV
 PTJzy8AM78/RiHnYag7mswQYRvoKRp2MWY7vRpVsNPm91nCzbT7PVRdsXjOqWfSW9rJu
 LiNuSdMMarssgB7mM0pkCl/bz6QffRFxS6vim+qd2DS/PzY+1TkpZEHtIJwSEnZZfImP
 IxNd8rIJb2jTJGGTZ7onAGFVCSuXRB2/5bH8S7OhgGyfiIdZZKqx5ep2nWOYneeJk25w
 6Qtg==
X-Gm-Message-State: APjAAAW+vdL+qaIljiQtjpQGW4Mq/uxaIQZQEXOZMMd0nWs7rwtzVKrf
 /AYIiw2IuD+TwASp21yg8yo=
X-Google-Smtp-Source: APXvYqwvDSE0CmdElgXhtuj+X3izqvNU9SOYdSyw5i/wFKniJwWhRhcNQLraK3ba4bGSLwu1vA1bjw==
X-Received: by 2002:a19:ac08:: with SMTP id g8mr934655lfc.112.1574107554632;
 Mon, 18 Nov 2019 12:05:54 -0800 (PST)
Received: from localhost.localdomain (79-139-233-37.dynamic.spd-mgts.ru.
 [79.139.233.37])
 by smtp.gmail.com with ESMTPSA id j23sm9166942lji.41.2019.11.18.12.05.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Nov 2019 12:05:54 -0800 (PST)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Peter De Schrijver <pdeschrijver@nvidia.com>,
 Mikko Perttunen <mperttunen@nvidia.com>,
 Georgi Djakov <georgi.djakov@linaro.org>, Rob Herring <robh+dt@kernel.org>
Subject: [PATCH v1 24/29] drm/tegra: dc: Use devm_platform_ioremap_resource
Date: Mon, 18 Nov 2019 23:02:42 +0300
Message-Id: <20191118200247.3567-25-digetx@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191118200247.3567-1-digetx@gmail.com>
References: <20191118200247.3567-1-digetx@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 19 Nov 2019 08:04:07 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=rtrkjrjFdrCSY4w3UkoaopBMgCTAU9tc9NbxXmX2YTg=;
 b=bIVfal5TVp5xBuBX6ib+z1CzBJxpz6RaF2qAdEWAm9btjqcLZW4/Ah6i/EXi+X77vV
 PhqjrJDdznHgGQYBexXUTGuVqpa5110USfShOzHSTcvJDJH8dB/ZXVKtiL+yOUZ1fKzL
 cgL2KKrxnCNn7k6kCsm3t0aiOzj9nywSK2bmjLqTjRUSKMsGXXfU08ZW78R/DXS+gmPx
 DvmecJFJwWV+APIfPg+wsr+JjtYzcAw12XhS6aODRo9XLGDwpf6oVZhCCTNumEiByX+7
 lhY03Hdk5q/mcJhFuZCuW95zlgzwzmyYfIybzyKQFm8TNVLzCOe69QultsXAnnzUIGFS
 qBcQ==
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
Cc: linux-tegra@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-pm@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VXRpbGl6ZSB0aGF0IHJlbGF0aXZlbHkgbmV3IGhlbHBlciB3aGljaCBtYWtlcyBjb2RlIGEgYml0
IGNsZWFuZXIuCgpTaWduZWQtb2ZmLWJ5OiBEbWl0cnkgT3NpcGVua28gPGRpZ2V0eEBnbWFpbC5j
b20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL3RlZ3JhL2RjLmMgfCA0ICstLS0KIDEgZmlsZSBjaGFu
Z2VkLCAxIGluc2VydGlvbigrKSwgMyBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJz
L2dwdS9kcm0vdGVncmEvZGMuYyBiL2RyaXZlcnMvZ3B1L2RybS90ZWdyYS9kYy5jCmluZGV4IDVi
MWY5ZmY5NzU3Ni4uMTQ4MzRjYmE1NDU1IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vdGVn
cmEvZGMuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vdGVncmEvZGMuYwpAQCAtMjQyMSw3ICsyNDIx
LDYgQEAgc3RhdGljIGludCB0ZWdyYV9kY19jb3VwbGUoc3RydWN0IHRlZ3JhX2RjICpkYykKIAog
c3RhdGljIGludCB0ZWdyYV9kY19wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQog
ewotCXN0cnVjdCByZXNvdXJjZSAqcmVnczsKIAlzdHJ1Y3QgdGVncmFfZGMgKmRjOwogCWludCBl
cnI7CiAKQEAgLTI0NzgsOCArMjQ3Nyw3IEBAIHN0YXRpYyBpbnQgdGVncmFfZGNfcHJvYmUoc3Ry
dWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikKIAkJdGVncmFfcG93ZXJnYXRlX3Bvd2VyX29mZihk
Yy0+cG93ZXJnYXRlKTsKIAl9CiAKLQlyZWdzID0gcGxhdGZvcm1fZ2V0X3Jlc291cmNlKHBkZXYs
IElPUkVTT1VSQ0VfTUVNLCAwKTsKLQlkYy0+cmVncyA9IGRldm1faW9yZW1hcF9yZXNvdXJjZSgm
cGRldi0+ZGV2LCByZWdzKTsKKwlkYy0+cmVncyA9IGRldm1fcGxhdGZvcm1faW9yZW1hcF9yZXNv
dXJjZShwZGV2LCAwKTsKIAlpZiAoSVNfRVJSKGRjLT5yZWdzKSkKIAkJcmV0dXJuIFBUUl9FUlIo
ZGMtPnJlZ3MpOwogCi0tIAoyLjIzLjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2RyaS1kZXZlbA==
