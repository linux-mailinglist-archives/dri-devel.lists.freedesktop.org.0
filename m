Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 17BCF11464
	for <lists+dri-devel@lfdr.de>; Thu,  2 May 2019 09:43:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 15F1E892C2;
	Thu,  2 May 2019 07:43:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com
 [IPv6:2607:f8b0:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C91F9892B6;
 Wed,  1 May 2019 16:14:45 +0000 (UTC)
Received: by mail-pf1-x442.google.com with SMTP id b3so8817211pfd.1;
 Wed, 01 May 2019 09:14:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=MtPcWFimi13xS3IBIx9BAJvwvZMDedknu7EfbmKtTWY=;
 b=DqBJq4gw0aAPC+Up5FUtAkH2lI5MxmGyQrc9+CZSWLnlo3iho3tJYX/AWkgMe0Qgfj
 a3eCRDjR6untLN8Jgu09Vlv7U2M8qu3wtQOkI1y81RzEkD5ZAT2W/Ori8+KrvaWo/ryg
 fpnIBgZLR74SgZVziThZgIUI0Fj6XK8np7XNATcjDllGQJPxgYPBsmAaOAV/tpfgH6R6
 3h2184/owM0KMfeeEfY2Y++39uOMJgMq9929kvPUU4eG2PEiwFvUBXnOQpg2rbDLISia
 zq8NI9sREXCqIIIXgOKkFXrdU5ZJh0jWoTq7K0dVI9mvkoeJcmS4YD1teWD9UBl1jcTr
 dXAg==
X-Gm-Message-State: APjAAAWPv6k6Q67XozRbZnvOMSaMC5Ug/LRiIpdrIUNNQJRbw4l3jntv
 FEfukqOBATsjJSk4+p+vzzo=
X-Google-Smtp-Source: APXvYqyHYU9WI4SIoemO/0OUMF/xgVkvo4cWypdtmSh6f0UJvj0k5fgpL7UiIzxsX9urC7r36EOPMg==
X-Received: by 2002:a62:2b4e:: with SMTP id r75mr28501975pfr.131.1556727285407; 
 Wed, 01 May 2019 09:14:45 -0700 (PDT)
Received: from aw-bldr-10.qualcomm.com (i-global254.qualcomm.com.
 [199.106.103.254])
 by smtp.gmail.com with ESMTPSA id 132sm32102040pfw.87.2019.05.01.09.14.44
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 01 May 2019 09:14:44 -0700 (PDT)
From: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
To: robdclark@gmail.com, sean@poorly.run, airlied@linux.ie, daniel@ffwll.ch
Subject: [PATCH] drm/msm/mdp5: Fix mdp5_cfg_init error return
Date: Wed,  1 May 2019 09:14:37 -0700
Message-Id: <20190501161437.15728-1-jeffrey.l.hugo@gmail.com>
X-Mailer: git-send-email 2.17.1
X-Mailman-Approved-At: Thu, 02 May 2019 07:42:58 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=MtPcWFimi13xS3IBIx9BAJvwvZMDedknu7EfbmKtTWY=;
 b=FQJpgIglCJ0STefvmKylU7hCbm9/3Ti8NdGAjxmYsarjZNYLDciepWCd3aHOjfpkWl
 wmAa5L2N7Y6yFny/vBSqk7W7BI5FhkmYq0U59el4Mybcq9InW0WjBJUGeg1ogQZNkGBt
 GueH03/qpPNvi2UpJ3QBCgx6ZCBgVneWvbOPXk8sqjB3KU3POR5rOPhmSvHQC3weufdw
 kEbZf44EgL+zNX3U/5tonWDsUuEK6IWRuorC++4JOoDBUps2fxX/Hw7Tr26dJOQ3PXif
 T4JTAF72jU1r+mHcH1yvPRUzjMAqDu7MU6iq+Kpv8QgvJu3MNZinuKTzg317rIpVEbHa
 i5jA==
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
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SWYgbWRwNV9jZmdfaW5pdCBmYWlscyBiZWNhdXNlIG9mIGFuIHVua25vd24gbWFqb3IgdmVyc2lv
biwgYSBudWxsIHBvaW50ZXIKZGVyZWZlcmVuY2Ugb2NjdXJzLiAgVGhpcyBpcyBiZWNhdXNlIHRo
ZSBjYWxsZXIgb2YgaW5pdCBleHBlY3RzIGVycm9yCnBvaW50ZXJzLCBidXQgaW5pdCByZXR1cm5z
IE5VTEwgb24gZXJyb3IuICBGaXggdGhpcyBieSByZXR1cm5pbmcgdGhlCmV4cGVjdGVkIHZhbHVl
cyBvbiBlcnJvci4KCkZpeGVzOiAyZTM2MmUxNzcyYjggKGRybS9tc20vbWRwNTogaW50cm9kdWNl
IG1kcDVfY2ZnIG1vZHVsZSkKU2lnbmVkLW9mZi1ieTogSmVmZnJleSBIdWdvIDxqZWZmcmV5Lmwu
aHVnb0BnbWFpbC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL21zbS9kaXNwL21kcDUvbWRwNV9j
ZmcuYyB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigt
KQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9tc20vZGlzcC9tZHA1L21kcDVfY2ZnLmMg
Yi9kcml2ZXJzL2dwdS9kcm0vbXNtL2Rpc3AvbWRwNS9tZHA1X2NmZy5jCmluZGV4IGVhOGY3ZDdk
YWY3Zi4uNTJlMjM3ODBmY2UxIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vbXNtL2Rpc3Av
bWRwNS9tZHA1X2NmZy5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9tc20vZGlzcC9tZHA1L21kcDVf
Y2ZnLmMKQEAgLTcyMSw3ICs3MjEsNyBAQCBzdHJ1Y3QgbWRwNV9jZmdfaGFuZGxlciAqbWRwNV9j
ZmdfaW5pdChzdHJ1Y3QgbWRwNV9rbXMgKm1kcDVfa21zLAogCWlmIChjZmdfaGFuZGxlcikKIAkJ
bWRwNV9jZmdfZGVzdHJveShjZmdfaGFuZGxlcik7CiAKLQlyZXR1cm4gTlVMTDsKKwlyZXR1cm4g
RVJSX1BUUihyZXQpOwogfQogCiBzdGF0aWMgc3RydWN0IG1kcDVfY2ZnX3BsYXRmb3JtICptZHA1
X2dldF9jb25maWcoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqZGV2KQotLSAKMi4xNy4xCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFp
bGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
