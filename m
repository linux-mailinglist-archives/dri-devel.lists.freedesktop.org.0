Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A14CF28733F
	for <lists+dri-devel@lfdr.de>; Thu,  8 Oct 2020 13:23:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B3926E3B2;
	Thu,  8 Oct 2020 11:23:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x543.google.com (mail-ed1-x543.google.com
 [IPv6:2a00:1450:4864:20::543])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D08286E342
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Oct 2020 11:23:48 +0000 (UTC)
Received: by mail-ed1-x543.google.com with SMTP id g4so5474270edk.0
 for <dri-devel@lists.freedesktop.org>; Thu, 08 Oct 2020 04:23:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=aQ0/dy64GNY6E3PqMvkOeCw7tku1OiiEuNnrmc12zf0=;
 b=oQGX/WsERCpgW2PogHIJy5UBog3JDnWJXgvx4OWfsN9DG11XTYcsi8LkNCKGUswsVJ
 I/ov2amMxLnqIS7y4T22v9Dpr4t+K5E5otszIUDv8ceaAoz9l1kOIpoAtfRbN0cW9vxW
 XoO6hAvzi/rD1B5/9Tib6A+YWTA/+ziwvMiiPNhRgQbJPSQ4i7ZPrHay6IredJCY7ywU
 oCXJOIQM3zfmTvuY/V4JGrac322do81ACOrYW/hQtAvN3pDSoZ8MvC7G8Yt1SQd6rg++
 FljU/RLi97GP7ZDzZTA8xdONUTEzhdw0OqO//PQqjZc4QERaSl6M+ThTNtf645yCZnqg
 FSwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=aQ0/dy64GNY6E3PqMvkOeCw7tku1OiiEuNnrmc12zf0=;
 b=irTHzUbXKoNdLW1D6CLCtfSqselsc7VxtkAMZIDIBd7kD6c8tToA+g01VSLt/JvgFM
 FiMghwrFyY8sXC2Glg1kxADP1gx9YwlZGtf7gniX4Zx+Qjbdh3/XUVhCZK8lN6/VHcZV
 XpW2PPfsCDIHCqrO4+RqMAzKIhnnRGQfm3qWAsmyXqG7M1WBAFu3dU1Ql6KrTi8luAcC
 xMzhCXcz45fG2ykigB2DIinJgf4Hmk0m6HwVKSALDSFmrwnQv3GQlmTDe8XcY3GfK6u5
 sLQKl3WlBWIw6cGsnUNGXk15iIvDzcqVN1ZQBvnaB5GH9454HWMh8nux4qY8Bu9qySlG
 0RMw==
X-Gm-Message-State: AOAM530h9TVxC5KzMSIlGkpNB2SLME3eik7cgu2cIyFXNKqbnT0737YM
 iqHlvPGz7FxFYAvPDCWSb3g=
X-Google-Smtp-Source: ABdhPJyiM0N9wnzLQ1YaVSJXHnbIsEHI6Q6KUCzWN69nNbgBewaYrw2PtECQxiDDM9OMzbILYW8xFw==
X-Received: by 2002:a05:6402:396:: with SMTP id
 o22mr8312612edv.361.1602156227564; 
 Thu, 08 Oct 2020 04:23:47 -0700 (PDT)
Received: from abel.fritz.box ([2a02:908:1252:fb60:4c64:a9a0:5e0:905a])
 by smtp.gmail.com with ESMTPSA id i20sm3529030edv.96.2020.10.08.04.23.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Oct 2020 04:23:47 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org, chris@chris-wilson.co.uk, airlied@redhat.com,
 akpm@linux-foundation.org, daniel@ffwll.ch, sumit.semwal@linaro.org
Subject: [PATCH 4/4] drm/amdgpu: stop using pages with
 drm_prime_sg_to_page_addr_arrays
Date: Thu,  8 Oct 2020 13:23:42 +0200
Message-Id: <20201008112342.9394-4-christian.koenig@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201008112342.9394-1-christian.koenig@amd.com>
References: <20201008112342.9394-1-christian.koenig@amd.com>
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

VGhpcyBpcyBkZXByZWNhdGVkLgoKU2lnbmVkLW9mZi1ieTogQ2hyaXN0aWFuIEvDtm5pZyA8Y2hy
aXN0aWFuLmtvZW5pZ0BhbWQuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2Ft
ZGdwdV90dG0uYyB8IDYgKysrLS0tCiAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCAz
IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2Ft
ZGdwdV90dG0uYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV90dG0uYwppbmRl
eCAzOTk5NjEwMzVhZTYuLmFjNDYzZTcwNmIxOSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJt
L2FtZC9hbWRncHUvYW1kZ3B1X3R0bS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1
L2FtZGdwdV90dG0uYwpAQCAtMTAxMSw4ICsxMDExLDggQEAgc3RhdGljIGludCBhbWRncHVfdHRt
X3R0X3Bpbl91c2VycHRyKHN0cnVjdCB0dG1fYm9fZGV2aWNlICpiZGV2LAogCQlnb3RvIHJlbGVh
c2Vfc2c7CiAKIAkvKiBjb252ZXJ0IFNHIHRvIGxpbmVhciBhcnJheSBvZiBwYWdlcyBhbmQgZG1h
IGFkZHJlc3NlcyAqLwotCWRybV9wcmltZV9zZ190b19wYWdlX2FkZHJfYXJyYXlzKHR0bS0+c2cs
IHR0bS0+cGFnZXMsCi0JCQkJCSBndHQtPnR0bS5kbWFfYWRkcmVzcywgdHRtLT5udW1fcGFnZXMp
OworCWRybV9wcmltZV9zZ190b19wYWdlX2FkZHJfYXJyYXlzKHR0bS0+c2csIE5VTEwsIGd0dC0+
dHRtLmRtYV9hZGRyZXNzLAorCQkJCQkgdHRtLT5udW1fcGFnZXMpOwogCiAJcmV0dXJuIDA7CiAK
QEAgLTEzNDUsNyArMTM0NSw3IEBAIHN0YXRpYyBpbnQgYW1kZ3B1X3R0bV90dF9wb3B1bGF0ZShz
dHJ1Y3QgdHRtX2JvX2RldmljZSAqYmRldiwKIAkJCXR0bS0+c2cgPSBzZ3Q7CiAJCX0KIAotCQlk
cm1fcHJpbWVfc2dfdG9fcGFnZV9hZGRyX2FycmF5cyh0dG0tPnNnLCB0dG0tPnBhZ2VzLAorCQlk
cm1fcHJpbWVfc2dfdG9fcGFnZV9hZGRyX2FycmF5cyh0dG0tPnNnLCBOVUxMLAogCQkJCQkJIGd0
dC0+dHRtLmRtYV9hZGRyZXNzLAogCQkJCQkJIHR0bS0+bnVtX3BhZ2VzKTsKIAkJdHRtX3R0X3Nl
dF9wb3B1bGF0ZWQodHRtKTsKLS0gCjIuMTcuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4v
bGlzdGluZm8vZHJpLWRldmVsCg==
