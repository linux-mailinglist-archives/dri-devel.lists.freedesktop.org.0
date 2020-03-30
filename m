Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AC548197DA8
	for <lists+dri-devel@lfdr.de>; Mon, 30 Mar 2020 15:55:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E26976E392;
	Mon, 30 Mar 2020 13:55:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A0B9B6E39C;
 Mon, 30 Mar 2020 13:55:42 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id h9so21715168wrc.8;
 Mon, 30 Mar 2020 06:55:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=flGhpt37sp9XD/VKJktequW1z/Op/EL2iIAVEZzSQBY=;
 b=ukD1GMur4S+QTAoLF74CoIO1QIAlOXbes+YwAQgkkrnSRcEsyI3+k4LVHMo6Wf9gO+
 r8ePkc5xHo9Ai+wVWG15g+w7uZhvkhxpoAFKO6Hd0EzcBmnup0sFzPOSXUPpiDIHQ3i7
 OOryRgQa8ncZf683e9LoFy2Zq6/oh9uJYtvkxJgZDkmDs4p1w6Vk3QKMWw7zvuckVSKs
 tGPTT2PofymB/CtXzigsthqMHYEqP3nC1uDRK0JNfoVMYtzl1C7edM5AkcmbwdSS8qvB
 xIs/82L97m9LGJz84/C7G3Vej2rGfmAXziFpheIQ2NdVuGCxjarBCUv88RPJS1Ut5ikC
 B1MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=flGhpt37sp9XD/VKJktequW1z/Op/EL2iIAVEZzSQBY=;
 b=imffyoDZ1MA3insYWImDYesSoEK72FflCXhtU1DXc/55Yz+pkKIWE1Ktxgv0ubFobE
 pBaYll2nSl7jIdK4bt2MqvPf0OJAUPen/vCk27d19pMYRbNH1MQ+CLhsMusiaNTj/gap
 VZM5A0Q8Ebwv7WP6vEvMvEOTfwfZjoPVI88ftCVdChdlS3dhY/esAZ74nWCVjlm9e63A
 7Rf0uXy6mI1uNpAfYtOkdsemka9P7HRqWKai73LH0raGbszp9mhevK7CS+8wLm8KpcTD
 ugfdeWBiBHQeRQFadF7+0/mRAUBTsjQ459UDwaW6q9rzEDpXpwvK13oyJPWshtaq6h/Q
 6I9Q==
X-Gm-Message-State: ANhLgQ0oInvMqvJikQg2Bo6KgMojZsVnlP2PWZ/wD3XHTTZc8Udy310w
 56Csdzmtb+DoHlDSB0prJF7QKeyL
X-Google-Smtp-Source: ADFU+vtlYfEqAjI36K3qJBBMU3B5Z7OVQPlDIw+hWEBkANe8Q+PCMFNPsizZ5Ych+K/fj5ik3qzfCQ==
X-Received: by 2002:a5d:6ca7:: with SMTP id a7mr16350429wra.157.1585576541175; 
 Mon, 30 Mar 2020 06:55:41 -0700 (PDT)
Received: from abel.fritz.box ([2a02:908:1252:fb60:f999:5819:bfe0:10e8])
 by smtp.gmail.com with ESMTPSA id z16sm22267660wrr.56.2020.03.30.06.55.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Mar 2020 06:55:40 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 daniel@ffwll.ch
Subject: [PATCH 6/6] drm/amdgpu: improve amdgpu_gem_info debugfs file
Date: Mon, 30 Mar 2020 15:55:36 +0200
Message-Id: <20200330135536.2997-6-christian.koenig@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200330135536.2997-1-christian.koenig@amd.com>
References: <20200330135536.2997-1-christian.koenig@amd.com>
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

Tm90ZSBpZiBhIGJ1ZmZlciB3YXMgaW1wb3J0ZWQgdXNpbmcgcGVlcjJwZWVyLgoKU2lnbmVkLW9m
Zi1ieTogQ2hyaXN0aWFuIEvDtm5pZyA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPgotLS0KIGRy
aXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9nZW0uYyB8IDQgKysrLQogMSBmaWxlIGNo
YW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2RyaXZl
cnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9nZW0uYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQv
YW1kZ3B1L2FtZGdwdV9nZW0uYwppbmRleCA0Mjc3MTI1YTc5ZWUuLmU0MjYwODExNWM5OSAxMDA2
NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2dlbS5jCisrKyBiL2Ry
aXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9nZW0uYwpAQCAtMjksNiArMjksNyBAQAog
I2luY2x1ZGUgPGxpbnV4L21vZHVsZS5oPgogI2luY2x1ZGUgPGxpbnV4L3BhZ2VtYXAuaD4KICNp
bmNsdWRlIDxsaW51eC9wY2kuaD4KKyNpbmNsdWRlIDxsaW51eC9kbWEtYnVmLmg+CiAKICNpbmNs
dWRlIDxkcm0vYW1kZ3B1X2RybS5oPgogI2luY2x1ZGUgPGRybS9kcm1fZGVidWdmcy5oPgpAQCAt
ODU0LDcgKzg1NSw4IEBAIHN0YXRpYyBpbnQgYW1kZ3B1X2RlYnVnZnNfZ2VtX2JvX2luZm8oaW50
IGlkLCB2b2lkICpwdHIsIHZvaWQgKmRhdGEpCiAJYXR0YWNobWVudCA9IFJFQURfT05DRShiby0+
dGJvLmJhc2UuaW1wb3J0X2F0dGFjaCk7CiAKIAlpZiAoYXR0YWNobWVudCkKLQkJc2VxX3ByaW50
ZihtLCAiIGltcG9ydGVkIGZyb20gJXAiLCBkbWFfYnVmKTsKKwkJc2VxX3ByaW50ZihtLCAiIGlt
cG9ydGVkIGZyb20gJXAlcyIsIGRtYV9idWYsCisJCQkgICBhdHRhY2htZW50LT5wZWVyMnBlZXIg
PyAiIFAyUCIgOiAiIik7CiAJZWxzZSBpZiAoZG1hX2J1ZikKIAkJc2VxX3ByaW50ZihtLCAiIGV4
cG9ydGVkIGFzICVwIiwgZG1hX2J1Zik7CiAKLS0gCjIuMTcuMQoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmkt
ZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
