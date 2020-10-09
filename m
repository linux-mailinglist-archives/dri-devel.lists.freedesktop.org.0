Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EC685288C17
	for <lists+dri-devel@lfdr.de>; Fri,  9 Oct 2020 17:04:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 37C146ED12;
	Fri,  9 Oct 2020 15:03:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x644.google.com (mail-ej1-x644.google.com
 [IPv6:2a00:1450:4864:20::644])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D3A5C6ED09
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Oct 2020 15:03:50 +0000 (UTC)
Received: by mail-ej1-x644.google.com with SMTP id x7so3386660eje.8
 for <dri-devel@lists.freedesktop.org>; Fri, 09 Oct 2020 08:03:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=FmM++3symsvpVR4siwjDU9+9KxruIk1gOAMHnKd0AiE=;
 b=XrFUM15iMxnW5r+cZykWaD+5lUM1thhhsQebgkflHil7pUpsJux+fxxaFn2fgRiHuV
 brSdA99+/2bMKqfPsJXJn/FuisTltXZglFLs2uC19dzC+26EGNznnkVDdEZckz8ZF+rt
 q1Hwvaxg+1a2kKO/MDHWsn09yXrDZALU9AamwjPCGg93X0G0EgyT/fdezAD9ZWNqqkaO
 BvILBcWk38vWvJGK/2UGNTh0gaNq7ZQJ0np3vWb7pRbdpBWS/pAZjyAxjzAgDYd4AfUr
 my9kTq68lUQL8GpKWHuIeUW5QVBbid6EmrB4IAeqZY3sXqRGtOgob8ueY2ImHtIhcOF9
 f5vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=FmM++3symsvpVR4siwjDU9+9KxruIk1gOAMHnKd0AiE=;
 b=cD4oRhgj95EkUwywjTA3BsbE1zgUpfA7pzRYludiZDzGtL/CSlm5ezM5XWvH3m0gTk
 /IGYg/YYNuRGcnc1iyQUMwcXjvrjF7hXuxoxLBFv1h/Q2ehC6z5OuZ60SjptfmfzqwK/
 bJbad6xXC4cIA3OZsNPd2N7U+IGq1iNGSXhjdUUtUYDTsApKLuWSoJuZ+y3yCnCM6KiI
 YGcOfG6ZYx4vNkKFdAjAHG5z/TDtbMFa9JFZMQOilMGvIEEUkNuDhXK9e0Leg8R3fYU0
 eTCSSu87S+BVnUQNYSbSKABeZsMb2Kkj8o4S089YC36agBzoTJ4x7p4idM+5kBAwuG7g
 TwuA==
X-Gm-Message-State: AOAM532f8hOByqGrk6FzK2uzuGw7r4tudxba0E634W3PE9cDKWQ4fA/I
 4brKU6yl7l5BrVel0pzfT0s=
X-Google-Smtp-Source: ABdhPJyN5ELfE5Ze/1hZ+8RjxM7E1Du5RNH1vhDQ1NOfDbdJcYgRfdItr1lNkT4hlsX9OlPerKunKw==
X-Received: by 2002:a17:906:7f8d:: with SMTP id
 f13mr14847374ejr.540.1602255829532; 
 Fri, 09 Oct 2020 08:03:49 -0700 (PDT)
Received: from abel.fritz.box ([2a02:908:1252:fb60:65f3:51d4:50d0:15b0])
 by smtp.gmail.com with ESMTPSA id v14sm789364edy.68.2020.10.09.08.03.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 Oct 2020 08:03:49 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org, chris@chris-wilson.co.uk, airlied@redhat.com,
 akpm@linux-foundation.org, daniel@ffwll.ch, sumit.semwal@linaro.org,
 willy@infradead.org, jhubbard@nvidia.com, jgg@ziepe.ca
Subject: [PATCH 5/6] drm/nouveau: stop using pages with
 drm_prime_sg_to_page_addr_arrays
Date: Fri,  9 Oct 2020 17:03:41 +0200
Message-Id: <20201009150342.1979-5-christian.koenig@amd.com>
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

VGhpcyBpcyBkZXByZWNhdGVkLCBhbHNvIGRyb3AgdGhlIGNvbW1lbnQgYWJvdXQgZmF1bHRzLgoK
U2lnbmVkLW9mZi1ieTogQ2hyaXN0aWFuIEvDtm5pZyA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29t
PgotLS0KIGRyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L25vdXZlYXVfYm8uYyB8IDYgKysrLS0tCiAx
IGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdp
dCBhL2RyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L25vdXZlYXVfYm8uYyBiL2RyaXZlcnMvZ3B1L2Ry
bS9ub3V2ZWF1L25vdXZlYXVfYm8uYwppbmRleCAwYzBjYTQ0YTY4MDIuLmUzNzhiYjQ5MTY4OCAx
MDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvbm91dmVhdV9iby5jCisrKyBiL2Ry
aXZlcnMvZ3B1L2RybS9ub3V2ZWF1L25vdXZlYXVfYm8uYwpAQCAtMTI5OSw5ICsxMjk5LDkgQEAg
bm91dmVhdV90dG1fdHRfcG9wdWxhdGUoc3RydWN0IHR0bV9ib19kZXZpY2UgKmJkZXYsCiAJCXJl
dHVybiAwOwogCiAJaWYgKHNsYXZlICYmIHR0bS0+c2cpIHsKLQkJLyogbWFrZSB1c2Vyc3BhY2Ug
ZmF1bHRpbmcgd29yayAqLwotCQlkcm1fcHJpbWVfc2dfdG9fcGFnZV9hZGRyX2FycmF5cyh0dG0t
PnNnLCB0dG0tPnBhZ2VzLAotCQkJCQkJIHR0bV9kbWEtPmRtYV9hZGRyZXNzLCB0dG0tPm51bV9w
YWdlcyk7CisJCWRybV9wcmltZV9zZ190b19wYWdlX2FkZHJfYXJyYXlzKHR0bS0+c2csIE5VTEws
CisJCQkJCQkgdHRtX2RtYS0+ZG1hX2FkZHJlc3MsCisJCQkJCQkgdHRtLT5udW1fcGFnZXMpOwog
CQl0dG1fdHRfc2V0X3BvcHVsYXRlZCh0dG0pOwogCQlyZXR1cm4gMDsKIAl9Ci0tIAoyLjE3LjEK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZl
bCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xp
c3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
