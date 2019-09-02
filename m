Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D52D4A593E
	for <lists+dri-devel@lfdr.de>; Mon,  2 Sep 2019 16:25:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8664789AAD;
	Mon,  2 Sep 2019 14:25:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2769589AAD
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Sep 2019 14:25:35 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id j16so14220308wrr.8
 for <dri-devel@lists.freedesktop.org>; Mon, 02 Sep 2019 07:25:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=EnfTPecX2+db21ftY9+dO6dPyijct3K+JxguAwUnYG4=;
 b=sd8zjAaqKwoI1VsSPkwvkgIbLFdH9HuB/9dbuFzUzqpXZfBmcH4cVgLTTsatAP79rH
 ybyythtVDO9rj/nPB9Udm8HStP+1m9nVL4MZwCWRA+4z/k/sJ1eySW53dMiZ/QuTZNfP
 1dz+Ba/M9PgisxzwUctwkFUuwJAHDYskYyPrs2fxNdFfEfbknEy6L7gPc3yVWpNOs85L
 b+vScC8FkhfNTA75yte/flD0M5f9UTT1FmqjpXgweKR/xOhBZSbH0w7VG4hUpf8DXDZ0
 QrRTQNiCJkmdty+k+leC4MjJgpTyvcqa7TIB5t0WheeNNkWfXLPFkD2pMVZP+OOBVA00
 7bMA==
X-Gm-Message-State: APjAAAWEH9TgPxIdoW9RXDvl3g4nqvEIRJ2TXgQJIKGz6xRW4mKtAeFH
 cpFRkFrT+XvV7VRVVFFr3A32Ig==
X-Google-Smtp-Source: APXvYqwTgtUQQpLwiP0MCFol1mfNQcOQBzNT/JReW5BXzTA+iAvCB169+Tf/K8jzywqakkIWIFpSJg==
X-Received: by 2002:adf:ef12:: with SMTP id e18mr7704047wro.65.1567434333418; 
 Mon, 02 Sep 2019 07:25:33 -0700 (PDT)
Received: from HeinrichFink-DPT-IR1433.local ([213.86.25.14])
 by smtp.gmail.com with ESMTPSA id j1sm4509692wrg.24.2019.09.02.07.25.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Sep 2019 07:25:31 -0700 (PDT)
From: Heinrich Fink <heinrich.fink@daqri.com>
To: daniel.vetter@ffwll.ch
Subject: Re: [PATCH] drm: Add high-precision time to vblank trace event
Date: Mon,  2 Sep 2019 16:24:11 +0200
Message-Id: <20190902142412.27846-1-heinrich.fink@daqri.com>
X-Mailer: git-send-email 2.23.0.rc1
In-Reply-To: <20190814171518.GL7444@phenom.ffwll.local>
References: <20190814171518.GL7444@phenom.ffwll.local>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daqri.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=EnfTPecX2+db21ftY9+dO6dPyijct3K+JxguAwUnYG4=;
 b=XEmtMZaVmj0Cj9s2cEhGOa5Z3ASvKoQ5iGYC/4kPwTghBEGW0GBV6Ydmb/a+wChC1j
 X9GJ7jpKXO7DR4x7cgqE6cA5gFGf6HizwVTvggWPt6pFR0RDPvLvFgcFA6QjpGAhFRn/
 g2snOFhHJ526OyCsH6au97a00ndysBtjoA8WU=
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
Cc: heinrich.fink@daqri.com, intel-gfx@lists.freedesktop.org, keithp@keithp.com,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhhbmtzIGZvciB0aGUgcmV2aWV3LCBEYW5pZWwuIEkgbm90aWNlZCB0aGF0IG15IGxhc3QgbmFt
ZSB3YXMgbWlzc2luZwppbiB0aGUgaW5pdGlhbCByZXZpc2lvbiAobXkgZ2l0IGNvbmZpZyB3YXMg
bWVzc2VkIHVwKS4gSSBhbSBzZW5kaW5nIHYyCm9mIHRoaXMgcGF0Y2ggdG8gZml4IHRoaXMsIGlu
Y2x1ZGluZyB5b3VyIHIvYiB0YWcuCgpDaGVlcnMsIEhlaW5yaWNoCgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApk
cmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
