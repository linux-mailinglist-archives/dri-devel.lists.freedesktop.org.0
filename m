Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 52C7E2A64BF
	for <lists+dri-devel@lfdr.de>; Wed,  4 Nov 2020 14:00:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 89E606ECE4;
	Wed,  4 Nov 2020 13:00:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com
 [IPv6:2a00:1450:4864:20::542])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 41E6A6ECE4
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Nov 2020 13:00:29 +0000 (UTC)
Received: by mail-ed1-x542.google.com with SMTP id t11so22239118edj.13
 for <dri-devel@lists.freedesktop.org>; Wed, 04 Nov 2020 05:00:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=t4zyr1HTUdyVEeqfKQwfA/ZWQ59fGCUSXunVxELwCro=;
 b=TWSArdOyRCtGNdYD6fO+1tHN3qQOGfGqwQPFpCf7f+tSkta61gH1uUM8i3ZEsS/jdc
 WWbcF7ab/NqgUYFNj2oXlcd5hOYcMVkGLEzxo1nbpyArZX/4E9CT+z7zQLZwTWHXnR2f
 TxANk2EV30yn44aiFSfD1JeOFR5d79YSvgL+lnj7ussMrPwNypDys72cD1Bp6q5K78gj
 9Us801fI8Qij9yMmZ2Y4ROpnMs8Cng8iRKZN9XmP9wTsvsiGz7dHT/VACOekNQEntBpq
 18JlJKYhJ+75SAILfE4QautphD+jxRPtHpGaMLamNG+IfCxqhnQSzBZwPohfri1zBN+N
 b2yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=t4zyr1HTUdyVEeqfKQwfA/ZWQ59fGCUSXunVxELwCro=;
 b=UxEO+naKaM3XOw4KCVmr7h2eIOlg+v/BVwHhHskrWdHO3n/Ncmjn07yuV5lUE8g8ee
 pjQxQ1rFfL4nwNUPhl/INyIHR3R86p2gNMiOWxNesv2zi6/FK8YQ5OQFmrCkRvzBvx/s
 gSJIp4r7JmSul1NVJr2AzI0jNUAEk2snZodHnIe8CrgeUmfqJmYhodAZwezESRUUENWa
 nxEe1AA/3e8LQ5g9iy/6wrF8Z1CM7Ic0k7UacBoqvCOMrSMD2ar5EdwhQEe9zq7SqZLh
 c5hWefCLxjm9CzDIERdwRvUNqJe30WAuSkcmmJjTx1DxaCIccgg4IupePWu3iYrBUGZZ
 FT2A==
X-Gm-Message-State: AOAM5339qTui0B96zCOxOBzJhJAIQ86d0SxYrK0JLod6L5ubuyeC1mTR
 hdAGUsCSOlnU/67vXVqEdp7v6djBRFQ=
X-Google-Smtp-Source: ABdhPJx5xULad1Gz6IGwOPndeH+i/eEm9a1BDRRuygUw7b7Pr4ll2LZtpbDzqygfOLb9oiKo7cy+ww==
X-Received: by 2002:aa7:c2c3:: with SMTP id m3mr14004846edp.361.1604494827656; 
 Wed, 04 Nov 2020 05:00:27 -0800 (PST)
Received: from abel.fritz.box ([2a02:908:1252:fb60:429e:5ba2:6ddc:d941])
 by smtp.gmail.com with ESMTPSA id l20sm978801eja.40.2020.11.04.05.00.26
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Nov 2020 05:00:27 -0800 (PST)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 3/4] drm/nouveau: stop using pages with
 drm_prime_sg_to_page_addr_arrays
Date: Wed,  4 Nov 2020 14:00:23 +0100
Message-Id: <20201104130024.264974-3-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201104130024.264974-1-christian.koenig@amd.com>
References: <20201104130024.264974-1-christian.koenig@amd.com>
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
bS9ub3V2ZWF1L25vdXZlYXVfYm8uYwppbmRleCA4MTMzMzc3ZDg2NWQuLmMxODQ3Y2Y4Nzk1MiAx
MDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvbm91dmVhdV9iby5jCisrKyBiL2Ry
aXZlcnMvZ3B1L2RybS9ub3V2ZWF1L25vdXZlYXVfYm8uYwpAQCAtMTMxNyw5ICsxMzE3LDkgQEAg
bm91dmVhdV90dG1fdHRfcG9wdWxhdGUoc3RydWN0IHR0bV9ib19kZXZpY2UgKmJkZXYsCiAJCXJl
dHVybiAwOwogCiAJaWYgKHNsYXZlICYmIHR0bS0+c2cpIHsKLQkJLyogbWFrZSB1c2Vyc3BhY2Ug
ZmF1bHRpbmcgd29yayAqLwotCQlkcm1fcHJpbWVfc2dfdG9fcGFnZV9hZGRyX2FycmF5cyh0dG0t
PnNnLCB0dG0tPnBhZ2VzLAotCQkJCQkJIHR0bV9kbWEtPmRtYV9hZGRyZXNzLCB0dG0tPm51bV9w
YWdlcyk7CisJCWRybV9wcmltZV9zZ190b19wYWdlX2FkZHJfYXJyYXlzKHR0bS0+c2csIE5VTEws
CisJCQkJCQkgdHRtX2RtYS0+ZG1hX2FkZHJlc3MsCisJCQkJCQkgdHRtLT5udW1fcGFnZXMpOwog
CQlyZXR1cm4gMDsKIAl9CiAKLS0gCjIuMjUuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4v
bGlzdGluZm8vZHJpLWRldmVsCg==
