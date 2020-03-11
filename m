Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 997BE181A41
	for <lists+dri-devel@lfdr.de>; Wed, 11 Mar 2020 14:52:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 640406E988;
	Wed, 11 Mar 2020 13:52:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D4876E461;
 Wed, 11 Mar 2020 13:52:05 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id a25so2739481wrd.0;
 Wed, 11 Mar 2020 06:52:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=EdSiddoWJSbLr+HoD/rzQuDxDnh96tXalnlSTnjDyNk=;
 b=uyovfVmHoUpJGca3KPR3hEuZGZPkjcpdS+oPRNeqe3FtcmEkco8RfEZ2xTLTtEi8lS
 RYds8e20jUlD9+jclVVXCmCVJf73noEot1YssBGGUbb3i0ZsythHwvkjU1NXZopwyfOG
 vQ5jVXhjU5H2EFzJyOVvhLg1Y1z7SrBPaE2buNnnixU6mjAwqmTITAodgyukgpqZdQ0A
 MA3IhakWtrS2dIRD4VGSQxVa5Rr0uO3TnQBt5s1rK8wP9KPcq/+uYQ+XKRo1Y6M8LoG6
 jAfv6lYa/nz2nfKB5zqIMiHnLdyovUdsYNF5zGcZqdYwav3UyaX8/g8BO19BzmJ5QI1b
 spFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=EdSiddoWJSbLr+HoD/rzQuDxDnh96tXalnlSTnjDyNk=;
 b=iEQOVVPUbSK1nYAY2TVqJR0Iz+lqQc7aYZfXWoyPwDey9KOIy/RCEunyHgSV5k/nQl
 e+Bm5GxRkslT5rFyD/rSEwoh/l+zopV5StCgx6sdmJidSjCjdL/VUVVdfNPIY/K6pSMS
 UnIqsgGwz/UMFtivaiv4gNJ3exD5iYgQQHMcfVMjTRZCwHTY6x1goEPCb5S4WPZHa5rn
 SP54h8b/d7xwPB/oE1V6tFUE+dT6NjR/C47VoRCQzv2GOuGLaGFY1mcnIMKdnC00yHts
 SPvUgd6JJwXYP0Olkzq0oPfKLMXosq83f00+rMsJkasrsVRVOOcLLRXVV0HIizb+EIvf
 kioQ==
X-Gm-Message-State: ANhLgQ1ejqpSdBR/yrvFaIb9dyxoIDAV+xr0O2UH6qELi/03bkrhsphk
 L5pC2mC7XS+L4lD0FFYcpqA=
X-Google-Smtp-Source: ADFU+vvDQZoAP5t9Kngx119jPf9FnMzZ0/34dIRh4GcUnTweoHDleFgPZOnhX6aF+GPkB1qrkgUMDg==
X-Received: by 2002:a5d:410a:: with SMTP id l10mr4361775wrp.380.1583934723968; 
 Wed, 11 Mar 2020 06:52:03 -0700 (PDT)
Received: from abel.fritz.box ([2a02:908:1252:fb60:8dc:e796:e7da:a319])
 by smtp.gmail.com with ESMTPSA id 138sm3183811wmb.21.2020.03.11.06.52.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Mar 2020 06:52:03 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: David1.Zhou@amd.com, hch@infradead.org, jgg@ziepe.ca, daniel@ffwll.ch,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 linux-media@vger.kernel.org, intel-gfx@lists.freedesktop.org
Subject: [PATCH 3/6] drm/amdgpu: note that we can handle peer2peer DMA-buf
Date: Wed, 11 Mar 2020 14:51:55 +0100
Message-Id: <20200311135158.3310-4-christian.koenig@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200311135158.3310-1-christian.koenig@amd.com>
References: <20200311135158.3310-1-christian.koenig@amd.com>
MIME-Version: 1.0
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
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

SW1wb3J0aW5nIHNob3VsZCB3b3JrIG91dCBvZiB0aGUgYm94LgoKU2lnbmVkLW9mZi1ieTogQ2hy
aXN0aWFuIEvDtm5pZyA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPgotLS0KIGRyaXZlcnMvZ3B1
L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9kbWFfYnVmLmMgfCAxICsKIDEgZmlsZSBjaGFuZ2VkLCAx
IGluc2VydGlvbigrKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2Ft
ZGdwdV9kbWFfYnVmLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZG1hX2J1
Zi5jCmluZGV4IGZmZWIyMGYxMWMwNy4uYWVmMTJlZTJmMWUzIDEwMDY0NAotLS0gYS9kcml2ZXJz
L2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZG1hX2J1Zi5jCisrKyBiL2RyaXZlcnMvZ3B1L2Ry
bS9hbWQvYW1kZ3B1L2FtZGdwdV9kbWFfYnVmLmMKQEAgLTUxNCw2ICs1MTQsNyBAQCBhbWRncHVf
ZG1hX2J1Zl9tb3ZlX25vdGlmeShzdHJ1Y3QgZG1hX2J1Zl9hdHRhY2htZW50ICphdHRhY2gpCiB9
CiAKIHN0YXRpYyBjb25zdCBzdHJ1Y3QgZG1hX2J1Zl9hdHRhY2hfb3BzIGFtZGdwdV9kbWFfYnVm
X2F0dGFjaF9vcHMgPSB7CisJLmFsbG93X3BlZXIycGVlciA9IHRydWUsCiAJLm1vdmVfbm90aWZ5
ID0gYW1kZ3B1X2RtYV9idWZfbW92ZV9ub3RpZnkKIH07CiAKLS0gCjIuMTcuMQoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcg
bGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRl
c2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
