Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 60E97288C15
	for <lists+dri-devel@lfdr.de>; Fri,  9 Oct 2020 17:03:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F1A876ED0D;
	Fri,  9 Oct 2020 15:03:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x641.google.com (mail-ej1-x641.google.com
 [IPv6:2a00:1450:4864:20::641])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BCF986ED09
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Oct 2020 15:03:49 +0000 (UTC)
Received: by mail-ej1-x641.google.com with SMTP id lw21so13539684ejb.6
 for <dri-devel@lists.freedesktop.org>; Fri, 09 Oct 2020 08:03:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=aQ0/dy64GNY6E3PqMvkOeCw7tku1OiiEuNnrmc12zf0=;
 b=n2lSWZNpzrKXWTKd1W6mZN+iU+a03pL3chC65/ow10mL+TcHLgzGZy6LaSdOqRudg2
 6ZnCwN00jr16PIJT7A98Fh3R0/ILkQEqWtvrPP/EU7af/GK7xJj7ImO32dzizw+rTHBN
 UmGIHDUFMyX/UowHrHokTHnotADyzWToutWCXju6AkMzkRsX4dAzjjaZ38Jn1LDDk/rU
 kQk4B1CL3KlMA1w76fNMBa6Dag//EKTiATOsGcXZhdPTVPjgo08ilGkEuMmtxaTFsFcj
 LmSJsFK/XxxeDqkKIxFcIh2W6lZz/j27/KRVNINvUTONV0HOh9W4FwjbGGLfQiPc9voJ
 ZhbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=aQ0/dy64GNY6E3PqMvkOeCw7tku1OiiEuNnrmc12zf0=;
 b=SIkYG5JyKz2xp3fnvd+Tfh3aDONUyC8msHWdxah4odRSrKoUNeCndpGq6140ZPCuul
 DSnFc8qvpsUQalZYi9TRMKEjJpyMy+s8n4avnp5Rnmcvk5eHfpuaQZVh4swM8WRMMGc+
 BlXfRvzY2YeXA+dQa8m6iBeKgQ0u1OW4wqzhrY8aB4RzIyplKF64THjx7NzkWcEXvg/i
 qP2KorwG87qKcC20JnPNrLC7+rfDwIafp1ntWoCySGmuOaBBZQC0unnPx57gU24ayq43
 Iq6o9ANg/siZTK3s12iUMSsQ7hqFqnXbY+q81E839zROFB6YHBrzoT7694OT5+VaEogq
 TtTQ==
X-Gm-Message-State: AOAM5329hisr3rxYr8ogTLF0IHJ7qQimkOCMZ+nF081yPPI2pdgBrLfg
 Piaow1tLcDxZ420ide+Yzx0=
X-Google-Smtp-Source: ABdhPJwwEFyy7ezS1KLDN5XkqzgWY/1qVctpNR81azSANIwKr5bqZ2LqAFPivOFH8zfDpSVfOFDs8Q==
X-Received: by 2002:a17:906:2681:: with SMTP id
 t1mr15258406ejc.474.1602255828284; 
 Fri, 09 Oct 2020 08:03:48 -0700 (PDT)
Received: from abel.fritz.box ([2a02:908:1252:fb60:65f3:51d4:50d0:15b0])
 by smtp.gmail.com with ESMTPSA id v14sm789364edy.68.2020.10.09.08.03.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 Oct 2020 08:03:47 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org, chris@chris-wilson.co.uk, airlied@redhat.com,
 akpm@linux-foundation.org, daniel@ffwll.ch, sumit.semwal@linaro.org,
 willy@infradead.org, jhubbard@nvidia.com, jgg@ziepe.ca
Subject: [PATCH 4/6] drm/amdgpu: stop using pages with
 drm_prime_sg_to_page_addr_arrays
Date: Fri,  9 Oct 2020 17:03:40 +0200
Message-Id: <20201009150342.1979-4-christian.koenig@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201009150342.1979-1-christian.koenig@amd.com>
References: <20201009150342.1979-1-christian.koenig@amd.com>
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
