Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D3BF265D4
	for <lists+dri-devel@lfdr.de>; Wed, 22 May 2019 16:35:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B060289AAD;
	Wed, 22 May 2019 14:35:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com
 [IPv6:2607:f8b0:4864:20::642])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 03D2C8916D;
 Tue, 21 May 2019 15:00:37 +0000 (UTC)
Received: by mail-pl1-x642.google.com with SMTP id f97so8563557plb.5;
 Tue, 21 May 2019 08:00:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=B164xY76PAaJHCklCGNK3/SigqrJDxrGxeTBSbiHos0=;
 b=NheS/KGCPZOR7yBZsbVjE6DF9cQnzBVMdMU4qep4Ji77xFyBon/XMDPgXLt4FlC2DN
 qlSfxPEqodj2m7ZZgy65sZXm2wBQWu66CUrLyyuJ8ObJy49kYiuwNfXjFoHB4PTeVdQW
 vsg6MIWFKXdLJm5ZoX5YA48J3K5RuAXfLExkVBLXny4uThyrkFgoy4qSO/B/4cGQDruu
 pFUBBlwm++MZW9TrQpa4l2qiqYHfH3dcU0+lkW8hN4QzHtdcPcyTLqfMyddwFw/5Tn/k
 JH7h5TLQ3zxtp1bH5p1oQwJx/I4UR9jyIVSCPsQrxSxsuJqK2l2bsSHfPCjSiNA+VyJp
 qOgA==
X-Gm-Message-State: APjAAAWZ7XPqYlcxqbPVrT1mwBE4LgkJxDMDLYy+CtUPFEjPXIhRJgkM
 +Yz2j/5I3etG3jdOTyATDZg=
X-Google-Smtp-Source: APXvYqzZAZ+CyXG++ETYiVutSDrWxMIRF6XbmMWbrbKrMC0t8jGXSbHoO7Vuuee7o49qROXqWKttfw==
X-Received: by 2002:a17:902:294a:: with SMTP id
 g68mr58170042plb.169.1558450836681; 
 Tue, 21 May 2019 08:00:36 -0700 (PDT)
Received: from aw-bldr-10.qualcomm.com (i-global254.qualcomm.com.
 [199.106.103.254])
 by smtp.gmail.com with ESMTPSA id v2sm19953381pgr.2.2019.05.21.08.00.35
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 21 May 2019 08:00:36 -0700 (PDT)
From: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
To: robdclark@gmail.com, sean@poorly.run, airlied@linux.ie, daniel@ffwll.ch
Subject: [PATCH RESEND] drm/msm/mdp5: Fix mdp5_cfg_init error return
Date: Tue, 21 May 2019 08:00:30 -0700
Message-Id: <20190521150030.13609-1-jeffrey.l.hugo@gmail.com>
X-Mailer: git-send-email 2.17.1
X-Mailman-Approved-At: Wed, 22 May 2019 14:35:24 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=B164xY76PAaJHCklCGNK3/SigqrJDxrGxeTBSbiHos0=;
 b=uP7vqaIw/npd7e9gEqOrinrFsec9BTKODKGoZw61tOTGtHv4J/zw6OoVoXR0SviAZV
 +LZcJE/hbKYJEDNrozCL4FmpeB3jfQy4sMvHqtD/VBY0isLxcZutvrJciXzHq2B7NtSX
 3CL7Q7mhAvwk60CRUIyminErcMpt3cLicPyVhcmNvL8VwXbfVloRGGGDrO5Dp9dKPtqC
 WcPVWVpQssCutPdW/q0Niz+F30qJ37fCwwG8Mh078qzf5RsqBm/HMzytuxuO51eqim1l
 2BbOXujOAUngh7QWZ7znHGq5ubIJQMYn4qE+B8Ar3YCHAM1GlFQvl6lemCCUr3gdabKH
 e1MQ==
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
aHVnb0BnbWFpbC5jb20+ClJldmlld2VkLWJ5OiBCam9ybiBBbmRlcnNzb24gPGJqb3JuLmFuZGVy
c3NvbkBsaW5hcm8ub3JnPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9tc20vZGlzcC9tZHA1L21kcDVf
Y2ZnLmMgfCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24o
LSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbXNtL2Rpc3AvbWRwNS9tZHA1X2NmZy5j
IGIvZHJpdmVycy9ncHUvZHJtL21zbS9kaXNwL21kcDUvbWRwNV9jZmcuYwppbmRleCBlYThmN2Q3
ZGFmN2YuLjUyZTIzNzgwZmNlMSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL21zbS9kaXNw
L21kcDUvbWRwNV9jZmcuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vbXNtL2Rpc3AvbWRwNS9tZHA1
X2NmZy5jCkBAIC03MjEsNyArNzIxLDcgQEAgc3RydWN0IG1kcDVfY2ZnX2hhbmRsZXIgKm1kcDVf
Y2ZnX2luaXQoc3RydWN0IG1kcDVfa21zICptZHA1X2ttcywKIAlpZiAoY2ZnX2hhbmRsZXIpCiAJ
CW1kcDVfY2ZnX2Rlc3Ryb3koY2ZnX2hhbmRsZXIpOwogCi0JcmV0dXJuIE5VTEw7CisJcmV0dXJu
IEVSUl9QVFIocmV0KTsKIH0KIAogc3RhdGljIHN0cnVjdCBtZHA1X2NmZ19wbGF0Zm9ybSAqbWRw
NV9nZXRfY29uZmlnKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKmRldikKLS0gCjIuMTcuMQoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1h
aWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
