Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E43EA2C208
	for <lists+dri-devel@lfdr.de>; Tue, 28 May 2019 11:03:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E55D589CF4;
	Tue, 28 May 2019 09:03:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x543.google.com (mail-ed1-x543.google.com
 [IPv6:2a00:1450:4864:20::543])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B34DD89D79
 for <dri-devel@lists.freedesktop.org>; Tue, 28 May 2019 09:03:16 +0000 (UTC)
Received: by mail-ed1-x543.google.com with SMTP id p27so30685641eda.1
 for <dri-devel@lists.freedesktop.org>; Tue, 28 May 2019 02:03:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=MkPaiys1FHkvX5Xasbg4uMlexzhS3Oo0c8bAmpggR9g=;
 b=H5p2ineacuwLfnVbTOVDsBwgvbAUtR/tJb9LrtM+zfeIAGHPtSsNDvfotrpGPZNRzF
 /udiWqkoC6AKyNJ8pme1r6uBHZRyM5gEc2buep815CZThJdIs2+2TbY3Kr4mU2a3215H
 ksg5uXbHh+AwaYX/XRjRS32+I/uB8ZiRo/KpvGSPueYf9soHmuX/z0tYksSuhD6oPuZ+
 WUlxFGuEcrnvXRM/WD0gM/oZ5aAdJR2+i7VNKdmbKSVT3AA4zYup7i13GWG98OWdoF7u
 nLu6tac/ZK5Jlg57jxLHAWm+nv2MPR+ko/956/vviBLnrvs2oZTHicRfmK9E8APR5oSs
 WO9A==
X-Gm-Message-State: APjAAAUoS/nS53QOZSToBh3LvMuhFtqh0Fys2CNh8iuw3z14uiOSMbEG
 FkECXjDUWHgwv2Z5t0iccs+dWA==
X-Google-Smtp-Source: APXvYqxNUG3PIbLtvNeH5i4uB4mGfl/Vclh7rWNvv07X8NGzMdCrtTYqdpxbhNGmaVceS0uzEWD3gQ==
X-Received: by 2002:a50:b7bc:: with SMTP id h57mr111959297ede.77.1559034194600; 
 Tue, 28 May 2019 02:03:14 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:569e:0:3106:d637:d723:e855])
 by smtp.gmail.com with ESMTPSA id x49sm4072656edm.25.2019.05.28.02.03.13
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 28 May 2019 02:03:13 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: LKML <linux-kernel@vger.kernel.org>
Subject: [PATCH 03/33] vt: might_sleep() annotation for do_blank_screen
Date: Tue, 28 May 2019 11:02:34 +0200
Message-Id: <20190528090304.9388-4-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190528090304.9388-1-daniel.vetter@ffwll.ch>
References: <20190528090304.9388-1-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=MkPaiys1FHkvX5Xasbg4uMlexzhS3Oo0c8bAmpggR9g=;
 b=chjJHMWFVuPfhW3A7wneTkspRz2zd+mGVI0vCAF6liTiOmsE5RMJw1G5cMrRnyNngC
 W2oQnkMN6UocrhEJ8dL6n810MNsuqxnBqMe8cuwYvDOWo8W60y/cNQRvGXu+RScDN24b
 yIAQaBhqHR1mwDhUGgUGALBnoax8FwNCAT8Ho=
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
Cc: Nicolas Pitre <nicolas.pitre@linaro.org>,
 Adam Borowski <kilobyte@angband.pl>,
 Daniel Thompson <daniel.thompson@linaro.org>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 linux-fbdev@vger.kernel.org, DRI Development <dri-devel@lists.freedesktop.org>,
 Martin Hostettler <textshell@uchuujin.de>,
 Mikulas Patocka <mpatocka@redhat.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Daniel Vetter <daniel.vetter@intel.com>, Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Rm9yIHN5bW1ldHJ5IHJlYXNvbnMgd2l0aCBkb191bmJsYW5rX3NjcmVlbiwgZXhjZXB0IHdpdGhv
dXQgdGhlCm9vcHNfaW5fcHJvZ3Jlc3Mgc3BlY2lhbCBjYXNlLgoKSnVzdCBhIGRyaXZlLWJ5IGFu
bm90YXRpb24gd2hpbGUgSSdtIHRyeWluZyB0byB1bnRhbmdsZSB0aGUgZmJjb24gdnMuCmZiZGV2
IHNjcmVlbiBibGFuay91bmJsYW5rIG1hemUuCgpTaWduZWQtb2ZmLWJ5OiBEYW5pZWwgVmV0dGVy
IDxkYW5pZWwudmV0dGVyQGludGVsLmNvbT4KUmV2aWV3ZWQtYnk6IFNhbSBSYXZuYm9yZyA8c2Ft
QHJhdm5ib3JnLm9yZz4KQWNrZWQtYnk6IEdyZWcgS3JvYWgtSGFydG1hbiA8Z3JlZ2toQGxpbnV4
Zm91bmRhdGlvbi5vcmc+ClJldmlld2VkLWJ5OiBNYWFydGVuIExhbmtob3JzdCA8bWFhcnRlbi5s
YW5raG9yc3RAbGludXguaW50ZWwuY29tPgpDYzogR3JlZyBLcm9haC1IYXJ0bWFuIDxncmVna2hA
bGludXhmb3VuZGF0aW9uLm9yZz4KQ2M6IE5pY29sYXMgUGl0cmUgPG5pY29sYXMucGl0cmVAbGlu
YXJvLm9yZz4KQ2M6IEFkYW0gQm9yb3dza2kgPGtpbG9ieXRlQGFuZ2JhbmQucGw+CkNjOiBNYXJ0
aW4gSG9zdGV0dGxlciA8dGV4dHNoZWxsQHVjaHV1amluLmRlPgpDYzogRGFuaWVsIFZldHRlciA8
ZGFuaWVsLnZldHRlckBmZndsbC5jaD4KQ2M6IE1pa3VsYXMgUGF0b2NrYSA8bXBhdG9ja2FAcmVk
aGF0LmNvbT4KLS0tCiBkcml2ZXJzL3R0eS92dC92dC5jIHwgMiArKwogMSBmaWxlIGNoYW5nZWQs
IDIgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvdHR5L3Z0L3Z0LmMgYi9kcml2
ZXJzL3R0eS92dC92dC5jCmluZGV4IGZkZDEyZjhjM2RlYi4uYmM5ODEzYjE0YzU4IDEwMDY0NAot
LS0gYS9kcml2ZXJzL3R0eS92dC92dC5jCisrKyBiL2RyaXZlcnMvdHR5L3Z0L3Z0LmMKQEAgLTQx
NTksNiArNDE1OSw4IEBAIHZvaWQgZG9fYmxhbmtfc2NyZWVuKGludCBlbnRlcmluZ19nZngpCiAJ
c3RydWN0IHZjX2RhdGEgKnZjID0gdmNfY29uc1tmZ19jb25zb2xlXS5kOwogCWludCBpOwogCisJ
bWlnaHRfc2xlZXAoKTsKKwogCVdBUk5fQ09OU09MRV9VTkxPQ0tFRCgpOwogCiAJaWYgKGNvbnNv
bGVfYmxhbmtlZCkgewotLSAKMi4yMC4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0
aW5mby9kcmktZGV2ZWw=
