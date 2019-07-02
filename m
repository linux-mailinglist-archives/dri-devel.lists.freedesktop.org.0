Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BEFB55D33E
	for <lists+dri-devel@lfdr.de>; Tue,  2 Jul 2019 17:44:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD28189FCC;
	Tue,  2 Jul 2019 15:44:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x844.google.com (mail-qt1-x844.google.com
 [IPv6:2607:f8b0:4864:20::844])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A30389FD1
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Jul 2019 15:44:41 +0000 (UTC)
Received: by mail-qt1-x844.google.com with SMTP id n11so18969824qtl.5
 for <dri-devel@lists.freedesktop.org>; Tue, 02 Jul 2019 08:44:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=JEGJ7Jmmm4upED98C8kMEX5v02Mgo/GN/6JJfLKfS2Y=;
 b=K+gwF6lMwv99Ei58M3gBADG9FSc8yVbz0B14GKgh778/D5vZkKcWCLbAtDyyfaP2Qw
 L0Iza6lujjY9RrS5G5/jV9VyTTuTx1IfmEe22xHktl+UpfmdNwF4Y64CJeZPVFrlUd76
 TLQzd4MEYvOi33DwjNXdhxVh1OsrOzpTwcH4KlPCrNFexXH8MXpl8SkxQQYaxZ+QOMRg
 hn/ajK/+oY8zhZNWOwEXBejnCoj+Xcr3bnbhhY1WqPDlbAdik8bfnQeq6tOdtpnbjjVg
 uEfC8FDHlvjNJ1Nw4SzpgKZ4kGMuhsD3RM+jp7X2xgA9gxLQTOYjM0mNqPGpDH9fvlUR
 CSuQ==
X-Gm-Message-State: APjAAAWTLrgDDS/g9E5BLCLv/zIYLX0fxA2WO1xqyTof31/dPLgpo8fY
 8xuyF1g/zonLqq80f7SPkHGURqE3GrY=
X-Google-Smtp-Source: APXvYqwrwmnTDvlh5LTDRzlineemj5kLLsGRS9iB6zoJcKryU4/iFBumhY4Vv/4jDgkmSlqD0v5qsw==
X-Received: by 2002:ac8:368a:: with SMTP id a10mr26019845qtc.143.1562082279992; 
 Tue, 02 Jul 2019 08:44:39 -0700 (PDT)
Received: from localhost ([2601:184:4780:7861:5010:5849:d76d:b714])
 by smtp.gmail.com with ESMTPSA id d123sm6828508qkb.94.2019.07.02.08.44.39
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 02 Jul 2019 08:44:39 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 3/3] drm/bridge: ti-sn65dsi86: correct dsi mode_flags
Date: Tue,  2 Jul 2019 08:44:18 -0700
Message-Id: <20190702154419.20812-4-robdclark@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190702154419.20812-1-robdclark@gmail.com>
References: <20190702154419.20812-1-robdclark@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=JEGJ7Jmmm4upED98C8kMEX5v02Mgo/GN/6JJfLKfS2Y=;
 b=beufamAHtcBoZt+Gwf86QpSPtt4WbjVUwHCf2J3m0/Ebb+ttFl5pzogaS/c+qjPv3v
 pBxg445g7S25YCjqZCD21hiVGf4r3GV2DfoZV0HCPb5Y0k+nsn/vP2ZX7RPUCroJ7E/2
 MP8z4inC06IWSaP1Yg9tkV6xe1nbciIh33iZrAJxgE1dzhZ1I+GMa0tjOZm2q6vx8GRB
 G3ipziXB7UDxBtjdYrV/w600Ndcm3OkRopY+Gn5fcrC3IXJjLvLKDbxSHzNtMyj9ZLa4
 qgscQ1owPKfAyORLW/xqf+nuvPkkEOjPpQfWTnjWaXbmR85AFbLr2JAn5uzAT7wpcOED
 kRDA==
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
Cc: Rob Clark <robdclark@chromium.org>, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 Sean Paul <seanpaul@chromium.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogUm9iIENsYXJrIDxyb2JkY2xhcmtAY2hyb21pdW0ub3JnPgoKTm90aWNlZCB3aGlsZSBj
b21wYXJpbmcgcmVnaXN0ZXIgZHVtcCBvZiBob3cgYm9vdGxvYWRlciBjb25maWd1cmVzIERTSQp2
cyBob3cga2VybmVsIGNvbmZpZ3VyZXMuICBJdCBzZWVtcyB0aGUgYnJpZGdlIHN0aWxsIHdvcmtz
IGVpdGhlciB3YXksCmJ1dCBmaXhpbmcgdGhpcyBjbGVhcnMgdGhlICdDSEFfREFUQVRZUEVfRVJS
JyBlcnJvciBzdGF0dXMgYml0LgoKU2lnbmVkLW9mZi1ieTogUm9iIENsYXJrIDxyb2JkY2xhcmtA
Y2hyb21pdW0ub3JnPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9icmlkZ2UvdGktc242NWRzaTg2LmMg
fCAzICstLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAyIGRlbGV0aW9ucygtKQoK
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2UvdGktc242NWRzaTg2LmMgYi9kcml2
ZXJzL2dwdS9kcm0vYnJpZGdlL3RpLXNuNjVkc2k4Ni5jCmluZGV4IGE2ZjI3NjQ4YzAxNS4uYzhm
YjQ1ZTdiMDZkIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3RpLXNuNjVkc2k4
Ni5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2UvdGktc242NWRzaTg2LmMKQEAgLTM0Miw4
ICszNDIsNyBAQCBzdGF0aWMgaW50IHRpX3NuX2JyaWRnZV9hdHRhY2goc3RydWN0IGRybV9icmlk
Z2UgKmJyaWRnZSkKIAkvKiBUT0RPOiBzZXR0aW5nIHRvIDQgbGFuZXMgYWx3YXlzIGZvciBub3cg
Ki8KIAlkc2ktPmxhbmVzID0gNDsKIAlkc2ktPmZvcm1hdCA9IE1JUElfRFNJX0ZNVF9SR0I4ODg7
Ci0JZHNpLT5tb2RlX2ZsYWdzID0gTUlQSV9EU0lfTU9ERV9WSURFTyB8IE1JUElfRFNJX01PREVf
VklERU9fU1lOQ19QVUxTRSB8Ci0JCQkgIE1JUElfRFNJX01PREVfRU9UX1BBQ0tFVCB8IE1JUElf
RFNJX01PREVfVklERU9fSFNFOworCWRzaS0+bW9kZV9mbGFncyA9IE1JUElfRFNJX01PREVfVklE
RU87CiAKIAkvKiBjaGVjayBpZiBjb250aW51b3VzIGRzaSBjbG9jayBpcyByZXF1aXJlZCBvciBu
b3QgKi8KIAlwbV9ydW50aW1lX2dldF9zeW5jKHBkYXRhLT5kZXYpOwotLSAKMi4yMC4xCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFp
bGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
