Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 731252C67A1
	for <lists+dri-devel@lfdr.de>; Fri, 27 Nov 2020 15:16:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A0E3D6EDDC;
	Fri, 27 Nov 2020 14:16:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com
 [IPv6:2a00:1450:4864:20::542])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 140A66EDDC
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Nov 2020 14:16:07 +0000 (UTC)
Received: by mail-ed1-x542.google.com with SMTP id k1so5830342eds.13
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Nov 2020 06:16:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=jh99mZtX/gyTXwSc3BuNUiDLjxKwWwtKY5FELGfoCzk=;
 b=m2ak9CmZZEzZyDYe6dF8mnKcJz5GfWvTG1fYl23lk+C6pnc4aa6OcHhzYseMnC+Aox
 XXwGmuSDGcee1201myr31cuQpwTmTGf5Xsjq7iw4Dr0IDusZ2UE3GBz8m61fUGijRXXP
 Fv97kSBZTR2/QJ8Wu51T3wPYCylEz6gYZnnzymKZyDHGGg1buCeBX1T4e4SAfe55Q9/C
 lJHMYofM3ckTszSLpzi+gTQ1FPSKh6YmDT4xu3O7iHll3zWRcUph9JCX2dHpzNDU//RA
 exSEy0uBfHvi4KTGAiruR89wUa+fvrITv2mjO2txPPyYhZzbJKwa0r2hAbJWxv7USeqY
 GX5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=jh99mZtX/gyTXwSc3BuNUiDLjxKwWwtKY5FELGfoCzk=;
 b=KJ04MvSYmcjoy+2mj/7R1jBc+SfHuhThbCb8+QuUx1MnkxBnaYZ+J5G8e5xODIHX2e
 K7RrDb09bIWAOnvK7zzPc967I/sKm+Et/v3V2iqP+uMbRf2Tz5x/Z4cQHNNx05WsNBKY
 4NDGKYA+fOenh8hEld0C8hh5s0dEBjJVsgW/HFJ0N2jjcXXGBeEAmcYMaf+EUWQqANZp
 ulr0tL50gDJMvqUVlxfsy56OIvNPRllj+i5KidqDNgA7pPDmLGRs2vxKVFOLFO/iD1jT
 AAInUa9WQi5oi8g0bVoo+mQLDywINSuP310jlGP/oYq7pt+0G6u67qlM2z8qg02NeYPR
 pDVQ==
X-Gm-Message-State: AOAM530LLU1UD5A43nQnX86Kls71N9TMbnCbBVroyxhiIopv9BkpOnmi
 c3mxguXOz3607DgjmXFYUryF/B/mZFQ=
X-Google-Smtp-Source: ABdhPJxe3RlrMftz3j2WiDS/1ZdFOBxGwID4wWy/lno8+J+V2YbWvmHVGqJae4Nb/yh4XHKFjSmaxg==
X-Received: by 2002:a50:bec4:: with SMTP id e4mr8167089edk.65.1606486565412;
 Fri, 27 Nov 2020 06:16:05 -0800 (PST)
Received: from abel.fritz.box ([2a02:908:1252:fb60:8fd7:f9c5:9a69:4f4d])
 by smtp.gmail.com with ESMTPSA id d1sm4822229eje.82.2020.11.27.06.16.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Nov 2020 06:16:04 -0800 (PST)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 1/2] drm/ttm: use pin_count more extensively
Date: Fri, 27 Nov 2020 15:16:02 +0100
Message-Id: <20201127141603.70702-1-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
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

Q2hlY2sgdGhlIHBpbl9jb3VudCBpbnN0ZWFkIG9mIHRoZSBscnUgbGlzdCBpcyBlbXB0eSBoZXJl
LgoKU2lnbmVkLW9mZi1ieTogQ2hyaXN0aWFuIEvDtm5pZyA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQu
Y29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS90dG0vdHRtX2JvLmMgfCAzICstLQogMSBmaWxlIGNo
YW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZl
cnMvZ3B1L2RybS90dG0vdHRtX2JvLmMgYi9kcml2ZXJzL2dwdS9kcm0vdHRtL3R0bV9iby5jCmlu
ZGV4IDlhMDNjNzgzNGIxZS4uYTBiZGRjYzY0NTA0IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9k
cm0vdHRtL3R0bV9iby5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS90dG0vdHRtX2JvLmMKQEAgLTkz
Nyw5ICs5MzcsOCBAQCBpbnQgdHRtX2JvX21lbV9zcGFjZShzdHJ1Y3QgdHRtX2J1ZmZlcl9vYmpl
Y3QgKmJvLAogCX0KIAogZXJyb3I6Ci0JaWYgKGJvLT5tZW0ubWVtX3R5cGUgPT0gVFRNX1BMX1NZ
U1RFTSAmJiAhbGlzdF9lbXB0eSgmYm8tPmxydSkpIHsKKwlpZiAoYm8tPm1lbS5tZW1fdHlwZSA9
PSBUVE1fUExfU1lTVEVNICYmICFiby0+cGluX2NvdW50KQogCQl0dG1fYm9fbW92ZV90b19scnVf
dGFpbF91bmxvY2tlZChibyk7Ci0JfQogCiAJcmV0dXJuIHJldDsKIH0KLS0gCjIuMjUuMQoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1h
aWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
