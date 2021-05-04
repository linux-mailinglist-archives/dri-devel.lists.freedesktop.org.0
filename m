Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F425372AF7
	for <lists+dri-devel@lfdr.de>; Tue,  4 May 2021 15:27:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 10F176E44E;
	Tue,  4 May 2021 13:27:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [IPv6:2a00:1450:4864:20::62a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 469086E44E
 for <dri-devel@lists.freedesktop.org>; Tue,  4 May 2021 13:27:35 +0000 (UTC)
Received: by mail-ej1-x62a.google.com with SMTP id b25so13159578eju.5
 for <dri-devel@lists.freedesktop.org>; Tue, 04 May 2021 06:27:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=jAD11aE5x8UuJF7B6T96XJzi1TBVlQUcGjgr07Irahw=;
 b=ipNuqzGGCOOkmfzxqbWJY7za4lUk2He9QTr3wfSD0nlweEiGgzApe2pBBEuzijaAUJ
 xJZb3Nwajj4+j/TTlaemZ/F2wIaVhRmJdx6TwK3B1affaYBSjj16MxVkMLp/5JcfEQo9
 qniZTuzqrn9IPo1qo8jK33/JJYjHPeW48pDpJkTkRGwc2uKYQVJEjpM0MYt/CXxias4j
 uGPe6kmjn6XDbla0tnpL5URPJal8A+gH/0xDH0Vc4NOA65kZPBSiL2lCg2WYCLIM/4fI
 GgP52nxkfuqAeC5eRSPl4WWN2HeY08AAsNsuu4jkyHb4FHuU2eE/trcWvMLP6bFApICP
 mYOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=jAD11aE5x8UuJF7B6T96XJzi1TBVlQUcGjgr07Irahw=;
 b=LwRk4ArRDhy1+Xjk0/JZpY/mnUkqYf2OJbuCBoB0CmY/AIm9gqWHNc7KbmBGBNocIZ
 BHVyDBH1pcKy1zUDuZ51XAL04MiFD1XWKbuB05IgrfiL0qA+JnE05MYZO4UgFR/yx55z
 zs1FObwFB5mnrUUuDGgU3P7iaPrAYN8fymc8nwW5DI+YuSYJ6l4s3rjVIFtdG5gwAFJ5
 YZz9PTgLHwmemU9jmYiSJlacjn+XatIRLYtV7EYkA6HD8ngM1uhvaYcklUr539ipkgVv
 CcHTzMaTtIx8X4JHSn6oSHGXfm2QnbfoaV3qGY901WRBhLS9v34Kdu7dpC7a8G+0MAgF
 qv4w==
X-Gm-Message-State: AOAM531elHg0qIS18E8yPOLgnGQl57ZJb0A8E+ec68zYKfipZUWICNEn
 rkqzVGdV5F7S+GfX8SIzSd0ZX6XMji4=
X-Google-Smtp-Source: ABdhPJzr+6H6RmbNdXZ3ZE4eeiMMULnBMXcvBV7rYmwRRYTDSJtcpYRMboB9FS4H569IsUcRZK3tOA==
X-Received: by 2002:a17:906:3989:: with SMTP id
 h9mr21665420eje.309.1620134853963; 
 Tue, 04 May 2021 06:27:33 -0700 (PDT)
Received: from abel.fritz.box ([2a02:908:1252:fb60:4a5c:1943:c73d:c4c9])
 by smtp.gmail.com with ESMTPSA id q18sm3114036edd.3.2021.05.04.06.27.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 May 2021 06:27:33 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 03/12] drm/amdgpu: add DMA-buf user fence support
Date: Tue,  4 May 2021 15:27:20 +0200
Message-Id: <20210504132729.2046-4-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210504132729.2046-1-christian.koenig@amd.com>
References: <20210504132729.2046-1-christian.koenig@amd.com>
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

SnVzdCBhZGQgdGhlIGNhbGwgYmVmb3JlIHRha2luZyBsb2Nrcy4KClNpZ25lZC1vZmYtYnk6IENo
cmlzdGlhbiBLw7ZuaWcgPGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4KLS0tCiBkcml2ZXJzL2dw
dS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfY3MuYyAgICAgIHwgNyArKysrKysrCiBkcml2ZXJzL2dw
dS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZGlzcGxheS5jIHwgNiArKysrKysKIDIgZmlsZXMgY2hh
bmdlZCwgMTMgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQv
YW1kZ3B1L2FtZGdwdV9jcy5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2Nz
LmMKaW5kZXggYjVjNzY2OTk4MDQ1Li5hZmQ1OGM2ZDg4YTQgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMv
Z3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9jcy5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQv
YW1kZ3B1L2FtZGdwdV9jcy5jCkBAIC01MzQsNiArNTM0LDEzIEBAIHN0YXRpYyBpbnQgYW1kZ3B1
X2NzX3BhcnNlcl9ib3Moc3RydWN0IGFtZGdwdV9jc19wYXJzZXIgKnAsCiAJCQlyZXR1cm4gcjsK
IAl9CiAKKwkvKiBTeW5jIHRvIHVzZXIgZmVuY2VzICovCisJYW1kZ3B1X2JvX2xpc3RfZm9yX2Vh
Y2hfZW50cnkoZSwgcC0+Ym9fbGlzdCkgeworCQlyID0gZG1hX3Jlc3Zfc3luY191c2VyX2ZlbmNl
KGUtPnR2LmJvLT5iYXNlLnJlc3YpOworCQlpZiAocikKKwkJCXJldHVybiByOworCX0KKwogCS8q
IE9uZSBmb3IgVFRNIGFuZCBvbmUgZm9yIHRoZSBDUyBqb2IgKi8KIAlhbWRncHVfYm9fbGlzdF9m
b3JfZWFjaF9lbnRyeShlLCBwLT5ib19saXN0KQogCQllLT50di5udW1fc2hhcmVkID0gMjsKZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9kaXNwbGF5LmMgYi9k
cml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZGlzcGxheS5jCmluZGV4IDlhMmY4MTE0
NTBlZC4uM2VkZDZkYmFlNzFmIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdw
dS9hbWRncHVfZGlzcGxheS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdw
dV9kaXNwbGF5LmMKQEAgLTE4MSw2ICsxODEsMTIgQEAgaW50IGFtZGdwdV9kaXNwbGF5X2NydGNf
cGFnZV9mbGlwX3RhcmdldChzdHJ1Y3QgZHJtX2NydGMgKmNydGMsCiAJb2JqID0gZmItPm9ialsw
XTsKIAluZXdfYWJvID0gZ2VtX3RvX2FtZGdwdV9ibyhvYmopOwogCisJciA9IGRtYV9yZXN2X3N5
bmNfdXNlcl9mZW5jZShvYmotPnJlc3YpOworCWlmICh1bmxpa2VseShyKSkgeworCQlEUk1fRVJS
T1IoImZhaWxlZCB0byB3YWl0IGZvciB1c2VyIGZlbmNlIGJlZm9yZSBmbGlwXG4iKTsKKwkJZ290
byBjbGVhbnVwOworCX0KKwogCS8qIHBpbiB0aGUgbmV3IGJ1ZmZlciAqLwogCXIgPSBhbWRncHVf
Ym9fcmVzZXJ2ZShuZXdfYWJvLCBmYWxzZSk7CiAJaWYgKHVubGlrZWx5KHIgIT0gMCkpIHsKLS0g
CjIuMjUuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
ZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0
dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
