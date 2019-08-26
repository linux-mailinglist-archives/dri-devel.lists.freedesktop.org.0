Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B0199D210
	for <lists+dri-devel@lfdr.de>; Mon, 26 Aug 2019 16:57:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AFAC089F4F;
	Mon, 26 Aug 2019 14:57:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7901D89F43
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Aug 2019 14:57:35 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id u16so15661739wrr.0
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Aug 2019 07:57:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=+7mU6x0kAtNzznIM6tbGCzx9BmVJw914gebmRmVgVcA=;
 b=edeDAQGW9qVwebKs065eepoQYxRfKW2WjLDDF96jYTKoqC4PnXMCuRjUSFCk8fBbKW
 di9NhlQsDCx044TNLsAV3HNEp/mFeRct3gxiXCogZSWDcDbhv2EmAUaBbpPsyUL84x9L
 ARtUQudNH6+QEUKFT/7An5kK6qIGOAttOmpCO0IIyds0rFuRkxyo+0FvOfuVQZlu4fLQ
 JRaV7i/6OaquADzpRPDOtgiP370salJv+WGoLaca1AbGsR6AAv3WrOej/mqCJW9zGFW3
 SGqPsHhR2TIntxXu2junaGoqhWWnzNUq5hXspOEdGz7T9ViWQ60C6+4Uo6iBYPDza4tV
 lzBg==
X-Gm-Message-State: APjAAAX6P3vTY3oaOJNkXitz9fdpg0OUzaxq5uuhau2m177RAW/v9vnd
 Q5yi2xldRSVAHoiLjrgcPtMIrSIF
X-Google-Smtp-Source: APXvYqzJ01QKAXqhYjRzFJkpaImbzq9fBgrlnwuss9AvGR+yjNVevlG9yokk3U3+ulZOCQnkNGkrTA==
X-Received: by 2002:adf:e887:: with SMTP id d7mr22846695wrm.282.1566831453592; 
 Mon, 26 Aug 2019 07:57:33 -0700 (PDT)
Received: from abel.fritz.box ([2a02:908:1252:fb60:b0e3:7a12:98e5:ca6])
 by smtp.gmail.com with ESMTPSA id z8sm9865624wmi.7.2019.08.26.07.57.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Aug 2019 07:57:32 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: dri-devel@lists.freedesktop.org, chris@chris-wilson.co.uk,
 daniel.vetter@ffwll.ch, sumit.semwal@linaro.org,
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
Subject: Use dma_fence_array for implementing shared dma_resv fences
Date: Mon, 26 Aug 2019 16:57:22 +0200
Message-Id: <20190826145731.1725-1-christian.koenig@amd.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=+7mU6x0kAtNzznIM6tbGCzx9BmVJw914gebmRmVgVcA=;
 b=bM5bgM6n7KLOsSzjB5IqRgzcrPS0YEt9EDnkXtZEIaYP13lfh+vYfvXjSTTbd7JgOl
 HdGCSm4vsjY6K2Xbv7rD4GGOXEo3f9tjGojgKb5356NSHspjJ7+ZlfAY0vEC9HhwYV6P
 MlUKq0FOg7mBPBnD/Buz9APdawKEba7fd1LBZN2HWWT6L8ru6djbzZlZVOvPWbYIKhG3
 BU4eZJ7u/aH1z5tS8wb96c+ItPzpKQuMzLgt4XcpGoJ+AlM6OMwZndbEXVHIJFQxm+TG
 HS2elVpcTxP3HP0V9NzG+v2PnYbPktKDzxZFMohM4QvLZ6/cW9H7HQ2jM8DwW2vtm91V
 d2Cw==
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhpcyBpcyB0aGUgbmV3IGRtYV9mZW5jZV9hcnJheSBiYXNlZCBjb250YWluZXIgZm9yIHNoYXJl
ZCBmZW5jZXMgaW4gdGhlIGRtYV9yZXN2IG9iamVjdC4KCkFkdmFudGFnZSBvZiB0aGlzIGFwcHJv
YWNoIGlzIHRoYXQgeW91IGNhbiBncmFiIGEgcmVmZXJlbmNlIHRvIHRoZSBjdXJyZW50IHNldCBv
ZiBzaGFyZWQgZmVuY2VzIGF0IGFueSB0aW1lLCB3aGljaCBhbGxvd3MgdXMgdG8gZHJvcCB0aGUg
c2VxdWVuY2UgbnVtYmVyIGluY3JlbWVudCBhbmQgbWFrZXMgdGhlIHdob2xlIFJDVSBoYW5kbGlu
ZyBtdWNoIG1vcmUgZWFzaWVyLgoKRGlzYWR2YW50YWdlIGlzIHRoYXQgUkNVIHVzZXJzIG5vdyBo
YXZlIHRvIGdyYWIgYSByZWZlcmVuY2UgaW5zdGVhZCBvZiB1c2luZyB0aGUgc2VxdWVuY2UgY291
bnRlci4gQXMgZmFyIGFzIEkgY2FuIHNlZSBpOTE1IHdhcyBhY3R1YWxseSB0aGUgb25seSBkcml2
ZXIgZG9pbmcgdGhpcy4KClNvIHdlIG9wdGltaXplIGZvciBhZGRpbmcgbW9yZSBmZW5jZXMgaW5z
dGVhZCBvZiByZWFkaW5nIHRoZW0gbm93LgoKQW5vdGhlciBiZWhhdmlvciBjaGFuZ2Ugd29ydGgg
bm90aW5nIGlzIHRoYXQgdGhlIHNoYXJlZCBmZW5jZXMgYXJlIG5vdyBvbmx5IHZpc2libGUgYWZ0
ZXIgdW5sb2NraW5nIHRoZSBkbWFfcmVzdiBvYmplY3Qgb3IgY2FsbGluZyBkbWFfcmVzdl9mZW5j
ZXNfY29tbWl0KCkgbWFudWFsbHkuCgpQbGVhc2UgcmV2aWV3IGFuZC9vciBjb21tZW50LApDaHJp
c3RpYW4uCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
ZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0
dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
