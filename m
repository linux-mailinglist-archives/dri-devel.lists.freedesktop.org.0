Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8255AA1334
	for <lists+dri-devel@lfdr.de>; Thu, 29 Aug 2019 10:02:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 449BD6E029;
	Thu, 29 Aug 2019 08:02:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com
 [IPv6:2607:f8b0:4864:20::544])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 01B3B89DEC
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Aug 2019 04:30:13 +0000 (UTC)
Received: by mail-pg1-x544.google.com with SMTP id n190so901591pgn.0
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Aug 2019 21:30:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=WjPTSP9KK2QsqjmhzaDx1khiUa3+dCf9cZMoVMaAshk=;
 b=knkN6OA/8KEjMqRF2QJllT+X6DuF9+1YrmuNQz4c+BUGYtv4xZPveBDKc0DlYts5gF
 CQgzR3AQi5kEc/cDjK2dCFNaP1ZrTZ9YbysToDlNItAGft2qXEpZCgOkMYxJo09KWsnB
 K8DC0ufFayQZIcdC2mOynjzDK6SaHXxHvvegOSAn4nBmxYqiHSiTsj2tTB9hIMacXsu6
 306hS7kmyI3arKwMFvxj+RZsDo4IDTIPWagyjWHMoaXp9OW05r9uTiL2LkWJXdffQUoa
 BdU+moglMEUCQLjJ8BsjivBF0TLbyMqoq4GkNSF1wPQGJioh9FF77Dh6/hkPeLXmdrHE
 tnKQ==
X-Gm-Message-State: APjAAAU8+5r4wOTsbK9OnK/JlZXENIbg202CWS5KpdrFslSyFQlxCdAh
 OAXzFIjInaNDgg7FMJoWiuv6mQ==
X-Google-Smtp-Source: APXvYqyPaVF6cNmZOG33dRsz6I4yq7+2LHI4Ys4JgoXMTN5eZVkbgzvy71GI5pd6/ByGdtUhZbRStg==
X-Received: by 2002:a17:90a:2525:: with SMTP id
 j34mr8022406pje.11.1567053013589; 
 Wed, 28 Aug 2019 21:30:13 -0700 (PDT)
Received: from localhost ([2401:fa00:1:10:79b4:bd83:e4a5:a720])
 by smtp.gmail.com with ESMTPSA id s72sm717756pgc.92.2019.08.28.21.30.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 28 Aug 2019 21:30:12 -0700 (PDT)
From: Cheng-Yi Chiang <cychiang@chromium.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH] drm: dw-hdmi-i2s: enable audio clock in audio_startup
Date: Thu, 29 Aug 2019 12:29:57 +0800
Message-Id: <20190829042957.150929-1-cychiang@chromium.org>
X-Mailer: git-send-email 2.23.0.187.g17f5b7556c-goog
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 29 Aug 2019 08:01:00 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=WjPTSP9KK2QsqjmhzaDx1khiUa3+dCf9cZMoVMaAshk=;
 b=MMK7O5IUDss97+ZReyNXw062RBZnNuHPYc45XAcCIE0DL5/DB+mNF+5x81uwfZZ9fh
 LrEZ3DrQ4CCRN2P4AHfiQxbBoS/6fKM2ZqMmGV4BBMpM31+fR4kYqVAjtWFGBilNpbqJ
 XVYy0EPLnGvGvc2zVSJPSyF8gdUOu4Vu4gvIg=
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
Cc: alsa-devel@alsa-project.org, tzungbi@chromium.org, zhengxing@rock-chips.com,
 kuninori.morimoto.gx@renesas.com, airlied@linux.ie, jeffy.chen@rock-chips.com,
 dianders@chromium.org, dri-devel@lists.freedesktop.org,
 cain.cai@rock-chips.com, linux-rockchip@lists.infradead.org,
 eddie.cai@rock-chips.com, Laurent.pinchart@ideasonboard.com,
 enric.balletbo@collabora.com, dgreid@chromium.org, sam@ravnborg.org,
 linux-arm-kernel@lists.infradead.org, cychiang@chromium.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SW4gdGhlIGRlc2lnbndhcmUgZGF0YWJvb2ssIHRoZSBzZXF1ZW5jZSBvZiBlbmFibGluZyBhdWRp
byBjbG9jayBhbmQKc2V0dGluZyBmb3JtYXQgaXMgbm90IGNsZWFybHkgc3BlY2lmaWVkLgpDdXJy
ZW50bHksIGF1ZGlvIGNsb2NrIGlzIGVuYWJsZWQgaW4gdGhlIGVuZCBvZiBod19wYXJhbSBvcHMg
YWZ0ZXIKc2V0dGluZyBmb3JtYXQuCgpPbiBzb21lIG1vbml0b3JzLCB0aGVyZSBpcyBhIHBvc3Np
YmlsaXR5IHRoYXQgYXVkaW8gZG9lcyBub3QgY29tZSBvdXQuCkZpeCB0aGlzIGJ5IGVuYWJsaW5n
IGF1ZGlvIGNsb2NrIGluIGF1ZGlvX3N0YXJ0dXAgb3BzCmJlZm9yZSBod19wYXJhbSBvcHMgc2V0
dGluZyBmb3JtYXQuCgpTaWduZWQtb2ZmLWJ5OiBDaGVuZy1ZaSBDaGlhbmcgPGN5Y2hpYW5nQGNo
cm9taXVtLm9yZz4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3N5bm9wc3lzL2R3LWhkbWkt
aTJzLWF1ZGlvLmMgfCA5ICsrKysrKysrKwogMSBmaWxlIGNoYW5nZWQsIDkgaW5zZXJ0aW9ucygr
KQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2Uvc3lub3BzeXMvZHctaGRtaS1p
MnMtYXVkaW8uYyBiL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2Uvc3lub3BzeXMvZHctaGRtaS1pMnMt
YXVkaW8uYwppbmRleCA1Y2JiNzFhODY2ZDUuLjA4YjRhZGJiMWRkYyAxMDA2NDQKLS0tIGEvZHJp
dmVycy9ncHUvZHJtL2JyaWRnZS9zeW5vcHN5cy9kdy1oZG1pLWkycy1hdWRpby5jCisrKyBiL2Ry
aXZlcnMvZ3B1L2RybS9icmlkZ2Uvc3lub3BzeXMvZHctaGRtaS1pMnMtYXVkaW8uYwpAQCAtNjks
NiArNjksMTQgQEAgc3RhdGljIGludCBkd19oZG1pX2kyc19od19wYXJhbXMoc3RydWN0IGRldmlj
ZSAqZGV2LCB2b2lkICpkYXRhLAogCWhkbWlfd3JpdGUoYXVkaW8sIGNvbmYwLCBIRE1JX0FVRF9D
T05GMCk7CiAJaGRtaV93cml0ZShhdWRpbywgY29uZjEsIEhETUlfQVVEX0NPTkYxKTsKIAorCXJl
dHVybiAwOworfQorCitzdGF0aWMgaW50IGR3X2hkbWlfaTJzX2F1ZGlvX3N0YXJ0dXAoc3RydWN0
IGRldmljZSAqZGV2LCB2b2lkICpkYXRhKQoreworCXN0cnVjdCBkd19oZG1pX2kyc19hdWRpb19k
YXRhICphdWRpbyA9IGRhdGE7CisJc3RydWN0IGR3X2hkbWkgKmhkbWkgPSBhdWRpby0+aGRtaTsK
KwogCWR3X2hkbWlfYXVkaW9fZW5hYmxlKGhkbWkpOwogCiAJcmV0dXJuIDA7CkBAIC0xMDUsNiAr
MTEzLDcgQEAgc3RhdGljIGludCBkd19oZG1pX2kyc19nZXRfZGFpX2lkKHN0cnVjdCBzbmRfc29j
X2NvbXBvbmVudCAqY29tcG9uZW50LAogfQogCiBzdGF0aWMgc3RydWN0IGhkbWlfY29kZWNfb3Bz
IGR3X2hkbWlfaTJzX29wcyA9IHsKKwkuYXVkaW9fc3RhcnR1cCA9IGR3X2hkbWlfaTJzX2F1ZGlv
X3N0YXJ0dXAsCiAJLmh3X3BhcmFtcwk9IGR3X2hkbWlfaTJzX2h3X3BhcmFtcywKIAkuYXVkaW9f
c2h1dGRvd24JPSBkd19oZG1pX2kyc19hdWRpb19zaHV0ZG93biwKIAkuZ2V0X2RhaV9pZAk9IGR3
X2hkbWlfaTJzX2dldF9kYWlfaWQsCi0tIAoyLjIzLjAuMTg3LmcxN2Y1Yjc1NTZjLWdvb2cKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBt
YWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
