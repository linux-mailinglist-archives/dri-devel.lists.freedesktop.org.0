Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B552227981
	for <lists+dri-devel@lfdr.de>; Tue, 21 Jul 2020 09:32:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 012DB6E497;
	Tue, 21 Jul 2020 07:32:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 07A216E491
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Jul 2020 07:32:50 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id w3so1823779wmi.4
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Jul 2020 00:32:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=VdG50vh0bvv6u6Fo3R3hPlnSWDpEIu/D8UHTKBiWNxc=;
 b=RD8KwmtATC4J7W1rQpzbjgpV6KYJf4zHuuZZunVttUX/EHdtu0V/cC2Cn6U1TZd07D
 KKsIaJOnJC+yee00wR8RVQ7g+gl7C2+lGiwAiVixx9IJkLJMHXDGrFspHaKZ2vJpUHVT
 ny2UyRF+WBjqJcU4wpgybWTb5C6OZfm6H8E3gaJpbms0LbHoIWwuS02NlrxwY7M73vAE
 pAfP9AHcZPyr2jjGRdeYlN0DMF1dke7vjfhrfxG3YO/E1b4Raag97yAXNjNHSGDqEv3y
 yrXoCBVf5bkyrqLKr7D39frH3ewJIQw8Xntitp2wDHRUZ52Em4Ie6JY8Yrd29Za7VWw1
 SsLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=VdG50vh0bvv6u6Fo3R3hPlnSWDpEIu/D8UHTKBiWNxc=;
 b=hU5enOnUlS05l7AdehO5jbLvzhWDHgR0uB/22ESAdXgqlNcsYx2/xYeVgLeo2eNkWT
 wOQgum3Pl+bZ6IiayoCsvZj9mVwOjqr/sXNsMV226vIrcci30l56slTsHBQuKOPFycs8
 JnhmPVTC47Fd7rm7mK5yAmLDLvIhVGk2dl52zE1WjTWgCaYc/DD3GGbmOIlEIQQLI8dN
 tshPKsp4cA2Pu6gZQzTWL06S4QKoLzT77017vNoHDcOO998KqzjZDEtDcGjKEvh35Uvq
 y61AQMXb4k4sjwg0L4jwYWR6+LvPuK35Fd8ITBCb7Su0Mo2XQcnJhL8XIl9htaqTQpyN
 BDLQ==
X-Gm-Message-State: AOAM531h7guXjQkZT+Apw0yEFtU1HHvpwNoUqpNenG1QOl0gNE/9AKzw
 QzSvaumU0ftgqCKIkvzp+KOGDILF
X-Google-Smtp-Source: ABdhPJwovxiG67gvmMf4+BFaKJy7rC3ni2R/2wD87h9d8K8RA8v/VILSoD2edYYDak3hAJ2HnCwIKw==
X-Received: by 2002:a7b:c14a:: with SMTP id z10mr2654622wmi.19.1595316768424; 
 Tue, 21 Jul 2020 00:32:48 -0700 (PDT)
Received: from abel.fritz.box ([2a02:908:1252:fb60:5eb1:eb29:dadc:7fc5])
 by smtp.gmail.com with ESMTPSA id s4sm29740896wre.53.2020.07.21.00.32.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Jul 2020 00:32:48 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 02/11] drm/ttm: cleanup io_mem interface with nouveau
Date: Tue, 21 Jul 2020 09:32:36 +0200
Message-Id: <20200721073245.2484-2-christian.koenig@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200721073245.2484-1-christian.koenig@amd.com>
References: <20200721073245.2484-1-christian.koenig@amd.com>
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
Cc: Madhav.Chauhan@amd.com, michael.j.ruhl@intel.com, tzimmermann@suse.de
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Tm91dmVhdSBpcyB0aGUgb25seSB1c2VyIG9mIHRoaXMgZnVuY3Rpb25hbGl0eSBhbmQgZXZpY3Rp
bmcgaW8gc3BhY2UKb24gLUVBR0FJTiBpcyByZWFsbHkgYSBtaXN1c2Ugb2YgdGhlIHJldHVybiBj
b2RlLgoKSW5zdGVhZCBzd2l0Y2ggdG8gdXNpbmcgLUVOT1NQQyBoZXJlIHdoaWNoIG1ha2VzIG11
Y2ggbW9yZSBzZW5zZSBhbmQKc2ltcGxpZmllcyB0aGUgY29kZS4KClNpZ25lZC1vZmYtYnk6IENo
cmlzdGlhbiBLw7ZuaWcgPGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4KLS0tCiBkcml2ZXJzL2dw
dS9kcm0vbm91dmVhdS9ub3V2ZWF1X2JvLmMgfCAyIC0tCiBkcml2ZXJzL2dwdS9kcm0vdHRtL3R0
bV9ib191dGlsLmMgICAgfCA0ICsrLS0KIDIgZmlsZXMgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCsp
LCA0IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L25v
dXZlYXVfYm8uYyBiL2RyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L25vdXZlYXVfYm8uYwppbmRleCA2
MTM1NWNmYjczMzUuLmE0ODY1MjgyNmY2NyAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL25v
dXZlYXUvbm91dmVhdV9iby5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L25vdXZlYXVf
Ym8uYwpAQCAtMTUwNSw4ICsxNTA1LDYgQEAgbm91dmVhdV90dG1faW9fbWVtX3Jlc2VydmUoc3Ry
dWN0IHR0bV9ib19kZXZpY2UgKmJkZXYsIHN0cnVjdCB0dG1fbWVtX3JlZyAqcmVnKQogCQkJaWYg
KHJldCAhPSAxKSB7CiAJCQkJaWYgKFdBUk5fT04ocmV0ID09IDApKQogCQkJCQlyZXR1cm4gLUVJ
TlZBTDsKLQkJCQlpZiAocmV0ID09IC1FTk9TUEMpCi0JCQkJCXJldHVybiAtRUFHQUlOOwogCQkJ
CXJldHVybiByZXQ7CiAJCQl9CiAKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS90dG0vdHRt
X2JvX3V0aWwuYyBiL2RyaXZlcnMvZ3B1L2RybS90dG0vdHRtX2JvX3V0aWwuYwppbmRleCA1ZTBm
M2E5Y2FlZGMuLjdkMmM1MGZlZjQ1NiAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL3R0bS90
dG1fYm9fdXRpbC5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS90dG0vdHRtX2JvX3V0aWwuYwpAQCAt
MTE2LDcgKzExNiw3IEBAIHN0YXRpYyBpbnQgdHRtX21lbV9pb19ldmljdChzdHJ1Y3QgdHRtX21l
bV90eXBlX21hbmFnZXIgKm1hbikKIAlzdHJ1Y3QgdHRtX2J1ZmZlcl9vYmplY3QgKmJvOwogCiAJ
aWYgKCFtYW4tPnVzZV9pb19yZXNlcnZlX2xydSB8fCBsaXN0X2VtcHR5KCZtYW4tPmlvX3Jlc2Vy
dmVfbHJ1KSkKLQkJcmV0dXJuIC1FQUdBSU47CisJCXJldHVybiAtRU5PU1BDOwogCiAJYm8gPSBs
aXN0X2ZpcnN0X2VudHJ5KCZtYW4tPmlvX3Jlc2VydmVfbHJ1LAogCQkJICAgICAgc3RydWN0IHR0
bV9idWZmZXJfb2JqZWN0LApAQCAtMTQzLDcgKzE0Myw3IEBAIGludCB0dG1fbWVtX2lvX3Jlc2Vy
dmUoc3RydWN0IHR0bV9ib19kZXZpY2UgKmJkZXYsCiAJICAgIG1lbS0+YnVzLmlvX3Jlc2VydmVk
X2NvdW50KysgPT0gMCkgewogcmV0cnk6CiAJCXJldCA9IGJkZXYtPmRyaXZlci0+aW9fbWVtX3Jl
c2VydmUoYmRldiwgbWVtKTsKLQkJaWYgKHJldCA9PSAtRUFHQUlOKSB7CisJCWlmIChyZXQgPT0g
LUVOT1NQQykgewogCQkJcmV0ID0gdHRtX21lbV9pb19ldmljdChtYW4pOwogCQkJaWYgKHJldCA9
PSAwKQogCQkJCWdvdG8gcmV0cnk7Ci0tIAoyLjE3LjEKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVs
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
