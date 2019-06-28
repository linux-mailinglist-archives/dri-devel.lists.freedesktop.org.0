Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DCF7D5B14A
	for <lists+dri-devel@lfdr.de>; Sun, 30 Jun 2019 20:27:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B753489DE3;
	Sun, 30 Jun 2019 18:27:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com
 [IPv6:2607:f8b0:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 64CC16E964;
 Fri, 28 Jun 2019 16:28:43 +0000 (UTC)
Received: by mail-pf1-x441.google.com with SMTP id m30so3231582pff.8;
 Fri, 28 Jun 2019 09:28:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=f4FlYc0tSnypgxsXvd2ujjNQ+KDCveBa8PK0MgXP0hA=;
 b=SFEALjS5Y13fFLg3YRIBetTY1I5ahiVKxhJ5tU4rJ4srrZv4mdBkM89V9VthCwVJx2
 w5hkl+6TS4+kj/+fDqkFiSlm8UR5o1NcqZBHvsJKEyZ5752wkym5vqrhm8PMl4ff1Esb
 4WyiGNkbkoy6UcUTuuEfG2XKudL9YFRFCOTl21BebwqlFTwQBHiLijju5HxDy4zOeaPZ
 VO0coGCl5apDazRfYWn9Q27V8BkTipjj7G4PeLY8CLz1VsdZ5wCU90b4TOgumKgqQ3Qi
 cN/cHzGz7yyEMgMtL+kKKgEFnHvneebAn1Q0Nxh+uueMsLZ3bKV2r2IhESmqDj8/6pRB
 4XVQ==
X-Gm-Message-State: APjAAAWhFXTd6c2pAC65bKEaVQUmZbuw31C2J7R+KePltNuVFgpd4p4K
 Ra2zpAMugTpCaocMp+EWU2A=
X-Google-Smtp-Source: APXvYqw3Bw+hLp2MAVECsGm8rf8acNLXkxx83ZHcJivruGjgLxWwHArI17NwKh3uIAOcVzMz1gE9yA==
X-Received: by 2002:a65:664d:: with SMTP id z13mr9071896pgv.99.1561739322946; 
 Fri, 28 Jun 2019 09:28:42 -0700 (PDT)
Received: from aw-bldr-10.qualcomm.com (i-global254.qualcomm.com.
 [199.106.103.254])
 by smtp.gmail.com with ESMTPSA id x14sm3525257pfq.158.2019.06.28.09.28.41
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 28 Jun 2019 09:28:42 -0700 (PDT)
From: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
To: robdclark@gmail.com, sean@poorly.run, airlied@linux.ie, daniel@ffwll.ch
Subject: [PATCH] drm/msm: Transition console to msm framebuffer
Date: Fri, 28 Jun 2019 09:28:31 -0700
Message-Id: <20190628162831.20645-1-jeffrey.l.hugo@gmail.com>
X-Mailer: git-send-email 2.17.1
X-Mailman-Approved-At: Sun, 30 Jun 2019 18:26:11 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=f4FlYc0tSnypgxsXvd2ujjNQ+KDCveBa8PK0MgXP0hA=;
 b=H+xRChrJemigNIk4GdKOAlcpb/8FWPAxL9stcUcChcmvMaWjtoyU51GdN+YJ3KviB2
 MqqC3NWJCoPqstrRo+bB+UVHkfD/t1Vy5X7UejLPsPePzXVN8MKLlTaHVEXimybNeBk1
 X6dkyUNW9v1H3gzKPEsQ0/gM8V4ehjc+XKtUhsB0W5ysUFBu8yp/oboBaTS9sajNltOB
 yLWFO0HVJLkkvq4b0clhS4lj3BeqP1pijHV5/N84NM9x9pt7nnNhUEijPKvczEhLyOlD
 UZdE+fUa/M8SR9w7LXV12GFlerEhqHqCNS8uRpM5hoY9qZAOHR1BXpDZZGW+qgrgocOI
 jAgw==
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
Cc: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 bjorn.andersson@linaro.org, freedreno@lists.freedesktop.org
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SWYgYm9vdGluZyBhIGRldmljZSB1c2luZyBFRkksIGVmaWZiIHdpbGwgbGlrZWx5IGNvbWUgdXAg
YW5kIGNsYWltIHRoZQpjb25zb2xlLiAgV2hlbiB0aGUgbXNtIGRpc3BsYXkgc3RhY2sgZmluYWxs
eSBjb21lcyB1cCwgd2Ugd2FudCB0aGUKY29uc29sZSB0byBtb3ZlIG92ZXIgdG8gdGhlIG1zbSBm
Yiwgc28gYWRkIHN1cHBvcnQgdG8ga2ljayBvdXQgYW55CmZpcm13YXJlIGJhc2VkIGZyYW1lYnVm
ZmVycyB0byBhY2NvbXBsaXNoIHRoZSBjb25zb2xlIHRyYW5zaXRpb24uCgpTdWdnZXN0ZWQtYnk6
IFJvYiBDbGFyayA8cm9iZGNsYXJrQGdtYWlsLmNvbT4KU2lnbmVkLW9mZi1ieTogSmVmZnJleSBI
dWdvIDxqZWZmcmV5LmwuaHVnb0BnbWFpbC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL21zbS9t
c21fZmJkZXYuYyB8IDMgKysrCiAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspCgpkaWZm
IC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL21zbS9tc21fZmJkZXYuYyBiL2RyaXZlcnMvZ3B1L2Ry
bS9tc20vbXNtX2ZiZGV2LmMKaW5kZXggMjQyOWQ1ZTZjZTlmLi5lMzgzNmM3NzI1YTYgMTAwNjQ0
Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9tc20vbXNtX2ZiZGV2LmMKKysrIGIvZHJpdmVycy9ncHUv
ZHJtL21zbS9tc21fZmJkZXYuYwpAQCAtMTY5LDYgKzE2OSw5IEBAIHN0cnVjdCBkcm1fZmJfaGVs
cGVyICptc21fZmJkZXZfaW5pdChzdHJ1Y3QgZHJtX2RldmljZSAqZGV2KQogCWlmIChyZXQpCiAJ
CWdvdG8gZmluaTsKIAorCS8qIHRoZSBmdyBmYiBjb3VsZCBiZSBhbnl3aGVyZSBpbiBtZW1vcnkg
Ki8KKwlkcm1fZmJfaGVscGVyX3JlbW92ZV9jb25mbGljdGluZ19mcmFtZWJ1ZmZlcnMoTlVMTCwg
Im1zbSIsIGZhbHNlKTsKKwogCXJldCA9IGRybV9mYl9oZWxwZXJfaW5pdGlhbF9jb25maWcoaGVs
cGVyLCAzMik7CiAJaWYgKHJldCkKIAkJZ290byBmaW5pOwotLSAKMi4xNy4xCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBs
aXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVz
a3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
