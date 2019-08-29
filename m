Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 45EFFA1CC1
	for <lists+dri-devel@lfdr.de>; Thu, 29 Aug 2019 16:29:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7AB786E131;
	Thu, 29 Aug 2019 14:29:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 112B16E10B;
 Thu, 29 Aug 2019 14:29:21 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id j16so3642885wrr.8;
 Thu, 29 Aug 2019 07:29:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=7g/y5PId58FBV9AxP3wgyIbUubszr2SWr/wxO3+PHsU=;
 b=XFQI5neu/cuuaeuj/Ewz0Fp5onJwmPLHN76vhG+sG0ExK5lJHEaF5abIowSfmKZIAr
 wUbG8s+nXjefy0JNCiXeuLkvjUyClXhy4HvpphOtUMASvEPhazrlPMcgwqNM4ZW3tYZO
 HgYNKwJzaY1DpKGD6f4eDph6+J4D6P8Z0aQ7eA2dZ0O1l8oZSzioJb4vLrhEtoHy22mS
 JZP8v0jwAXYwgh8DzunVlx+2bbNzvQuTIQoM0R1osksuEQ/UkINiMgM1B/7yKIeALalF
 i3/TOVX7UliAxoTYCFhEagJG6IU7koNj7OZcG5PQLnPSxwWspxCHC5i++p58Dq2KvexF
 Y60Q==
X-Gm-Message-State: APjAAAX1G+cGJCgFpbxGvk3keX1B8BREwI+1wAe3a9d9cJOzShRdiGu0
 lN1DIYZPX2LrFK3m91rtezQ=
X-Google-Smtp-Source: APXvYqzKZLIfFnwS40rzEl1kixT8OInSOURUhvtrE3VQ3sE80yvzvGSQu1j7qToXBv93Lgqkywqd8g==
X-Received: by 2002:adf:f1cc:: with SMTP id z12mr11776405wro.125.1567088959682; 
 Thu, 29 Aug 2019 07:29:19 -0700 (PDT)
Received: from abel.fritz.box ([2a02:908:1252:fb60:d57:5a0b:4833:fc9f])
 by smtp.gmail.com with ESMTPSA id w13sm6188214wre.44.2019.08.29.07.29.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Aug 2019 07:29:19 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: daniel@ffwll.ch, dri-devel@lists.freedesktop.org, sumit.semwal@linaro.org,
 linaro-mm-sig@lists.linaro.org, linux-media@vger.kernel.org,
 intel-gfx@lists.freedesktop.org
Subject: Dynamic DMA-buf locking changes
Date: Thu, 29 Aug 2019 16:29:13 +0200
Message-Id: <20190829142917.13058-1-christian.koenig@amd.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=7g/y5PId58FBV9AxP3wgyIbUubszr2SWr/wxO3+PHsU=;
 b=j7m8iv0cW+Jilj9SPwqtiCaJI3B4NAX3dD0V8vU61bH4EOHO61FNULtvTypveHZ9ya
 Fcx5OqZTwTG8xwpUVEv2qHg7DQ3xCPLvFTLrmXyfgkHyrd4H4q5cvW/KkE1RGCC6GZQI
 GSFzWaoyR/uRD3mRAJot61HMACX/GNgX7c+Qp140R6jUU6wF33dt0x3S94TBtkWqt2gq
 mvF5BffSFxD/AfHf7pVuJwfhtxXd7gJi8BEoUL2whbFrynixVSZthB5SN+jrOSJI6JZo
 9LCWMWTmndRowXD9E1+N+LriHhZOMpIxKw+WC0Tzozm0ld0Zo4Oi+fiZL3k464dbPxOD
 YIIA==
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

SGkgZXZlcnlvbmUsCgpzaW5jZSB1cHN0cmVhbWluZyB0aGUgZnVsbCBkeW5hbWljIERNQS1idWYg
Y2hhbmdlcyB0dXJuZWQgb3V0IG1vcmUgcHJvYmxlbWF0aWMgdGhhbiBwcmV2aW91c2x5IHRob3Vn
aHQgSSd2ZSByZXZlcnRlZCBiYWNrIHRvIGluZGl2aWR1YWwgcGF0Y2hlcyBhbmQgc2VwYXJhdGVk
IG91dCBvbmx5IHRoZSBsb2NraW5nIGNoYW5nZXMuCgpTbyB0aGlzIHBhdGNoIGRvZXMgTk9UIGNv
bnRhaW4gYW55IG5ldyBjYWxsYmFja3MgZm9yIHBpbm5pbmcvdW5waW5uaW5nIGFuZCBtb3ZlIG5v
dGlmaWNhdGlvbiwgYnV0IG9ubHkgdGhlIGxvY2tpbmcgY2hhbmdlcyBuZWNlc3NhcnkuCgpBcyBw
cmV2aW91c2x5IGRpc2N1c3NlZCB3aGVuIHRoZSBmcmFtZXdvcmsgZGV0ZWN0cyB0aGF0IHRoZSBs
b2NraW5nIHNlbWFudGljcyBiZXR3ZWVuIGV4cG9ydGVyIGFuZCBpbXBvcnRlciBhcmUgZGlmZmVy
ZW50IGl0IGp1c3QgZmFsbHMgYmFjayB0byB1c2luZyBhIGNhY2hlZCBzZ3QgY3JlYXRlZCBkdXJp
bmcgYXR0YWNoIHRpbWUuCgpXaGlsZSBzZXBhcmF0aW5nIHRoZSBwYXRjaCBzZXQgSSd2ZSBtb3N0
IGxpa2VseSBzdHVtYmxlZCBvdmVyIHRoZSBwcm9ibGVtIHdoeSB0aGlzIHByZXZpb3VzbHkgcmFp
c2VkIHNvbWUgbG9ja2RlcCB3YXJuaW5nIHdpdGggaTkxNSwgaXQgdHVybmVkIG91dCB0byBiZSBq
dXN0IGEgbWlnaHRfbG9jaygpIGF0IHRoZSB3cm9uZyBwbGFjZS4KClBsZWFzZSByZXZpZXcgYW5k
L29yIGNvbW1lbnQsCkNocmlzdGlhbi4KCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0
aW5mby9kcmktZGV2ZWw=
