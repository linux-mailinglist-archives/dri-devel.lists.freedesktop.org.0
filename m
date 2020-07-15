Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B1806220C08
	for <lists+dri-devel@lfdr.de>; Wed, 15 Jul 2020 13:40:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A9796EAC3;
	Wed, 15 Jul 2020 11:40:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 68C426EAC1;
 Wed, 15 Jul 2020 11:40:12 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id w3so5459773wmi.4;
 Wed, 15 Jul 2020 04:40:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=VdG50vh0bvv6u6Fo3R3hPlnSWDpEIu/D8UHTKBiWNxc=;
 b=GsEcUt3+vHnjqjk370zuGxTtmZO1B2XOfhhMdWK73+xWAK5x6oyCTct+zDfhg82riB
 FzZ2kZ6GDnO+gRVCYnuWauMVL71JWzzmR4+hwJMLHrEGJa5/r7EWvoQrhG9db3NFD7FS
 3GJqGMrinT+CHzbNz5dITgGpCC7w4b+j60uwDRmLELDxAZsj/I/d3pER4MfPUM4tC2RJ
 aulR0FhaUvnBafieaVJu6nx3JImRfrZWmr7+z9cOD2gRnGa5cQNOS0+xRrG4B1QZPIlB
 TpSWLa+i1eKIi4V9pD+cJgk3lioJ1zoqpivguvAGWyr4U0ertuGDJvcJRXV9ApSvKP7r
 00AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=VdG50vh0bvv6u6Fo3R3hPlnSWDpEIu/D8UHTKBiWNxc=;
 b=KNM4T6Bd8jcChQZ2EdX3WJ+fq2dnQm8Mof8bQaLoFdSTk32J/u2Xg2KFRohCl2h0uQ
 r6+y0lzJcMEiwW9y50E6FxI6+ICQ7kYVwBb0PdSyJYpRieY+310klfUlimiJoLU95XJd
 GNUZqmq/aABjMTDfqvPfSRZcP86yk/mmrtlpCFAnL40B33knungZM9eXvKIdPL3G+And
 Syu0MCoY6z529zyRnQpIcUN7I3ZelRktGc/ISdxnvI/UjxtjvJpL3/HnBselcIUuxWpu
 JFxmOGLQ4d0sk/paCTvImfG2gTiwnvHDB+GJJEzWyic79O1YcvVANlPp97SLQwK5CPH8
 3Pqg==
X-Gm-Message-State: AOAM530WCi5buwNnHOgowfyJZ0XKc/pV1pXisLXtLdk6aXh+kvmBXRhz
 A8ct22Ub4ZNAfYyGz2o08OmyROdD
X-Google-Smtp-Source: ABdhPJwn9alDEWeXCoqDybytYWwtU9kyGHcs9bcBp5PlwftlJV/orybKd2RHJ6xwF0qH9dHM7rSFzQ==
X-Received: by 2002:a7b:c921:: with SMTP id h1mr7819128wml.29.1594813208815;
 Wed, 15 Jul 2020 04:40:08 -0700 (PDT)
Received: from abel.fritz.box ([2a02:908:1252:fb60:a8d2:94ff:eefb:92dd])
 by smtp.gmail.com with ESMTPSA id 5sm2959586wmk.9.2020.07.15.04.40.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Jul 2020 04:40:08 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: nouveau@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 2/4] drm/ttm: cleanup io_mem interface with nouveau
Date: Wed, 15 Jul 2020 13:40:04 +0200
Message-Id: <20200715114006.2873-2-christian.koenig@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200715114006.2873-1-christian.koenig@amd.com>
References: <20200715114006.2873-1-christian.koenig@amd.com>
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
