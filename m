Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 234FCCB530
	for <lists+dri-devel@lfdr.de>; Fri,  4 Oct 2019 09:39:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC18B6EABB;
	Fri,  4 Oct 2019 07:38:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x649.google.com (mail-pl1-x649.google.com
 [IPv6:2607:f8b0:4864:20::649])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 279346E8CA
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Oct 2019 16:51:40 +0000 (UTC)
Received: by mail-pl1-x649.google.com with SMTP id q3so8903811pll.8
 for <dri-devel@lists.freedesktop.org>; Wed, 02 Oct 2019 09:51:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=4INGfYLGyLALjI2XEapvgZEklVw6KiRSbjc8hD/raH0=;
 b=UEOIib74Au8qR+JWzdHeMI1QR4V4SgL07v9RRXBp4Vn2pXJMYlUf8ESEIbXZks/9OA
 mcAcSN8Ao7PjwfLk9qaEPWyg3dZPwlFmdhU+enUxYK+v7RkBySyYEHtmsCO5naou+SAH
 KDSUMiEOn4JfVh5E6aUF8ck2YW402sXBo4TarAdVeBkka0R6HyctIsYRYy4ctx5sLwQs
 u570P8Lwc4xLk1b4Dy7rxp1JIjtiZ6E3PB73uUvJn6nW8HZgjl+Mefz+T0TZ65hDaruS
 JwDcAflBAMFf2PQ8g5jGikugCbMjtjPkZ/Tz8led5XRxqngW2PhKl6yrGcZlBnXNTEgA
 15hw==
X-Gm-Message-State: APjAAAV2jXKhYRBjbLHUuhwq7y2ALPHS4P+fWGLjkgiWJ+UapykfkMpk
 tRXh8jSXikrUrOp2L6v89gjPgzclxm2uV7PdW0A=
X-Google-Smtp-Source: APXvYqzqokz2U9Wh/jeAoe5hFd5+Jm6Iq6mS+TfQ3qt8KuD3T5573f6jW+N2W7bdqA+tpZGrZLlRlVZZvHAt9/vymno=
X-Received: by 2002:a63:dd0c:: with SMTP id t12mr4611244pgg.82.1570035099268; 
 Wed, 02 Oct 2019 09:51:39 -0700 (PDT)
Date: Wed,  2 Oct 2019 09:51:37 -0700
In-Reply-To: <20191002120136.1777161-7-arnd@arndb.de>
Message-Id: <20191002165137.15726-1-ndesaulniers@google.com>
Mime-Version: 1.0
References: <20191002120136.1777161-7-arnd@arndb.de>
X-Mailer: git-send-email 2.23.0.444.g18eeb5a265-goog
Subject: Re: [PATCH 6/6] [RESEND] drm/amdgpu: work around llvm bug #42576
From: Nick Desaulniers <ndesaulniers@google.com>
To: arnd@arndb.de
X-Mailman-Approved-At: Fri, 04 Oct 2019 07:38:50 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20161025;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc;
 bh=4INGfYLGyLALjI2XEapvgZEklVw6KiRSbjc8hD/raH0=;
 b=rmQ/UWjpQ9gSzRQMAE9Z2Xm1qYUhMcoVPefDNgkutcuhAi3dYBTO5gO3X0gTikcFBt
 A8aFY6lBh4YRc3ZV78aFfn9mcnZk7KNABwAsbR4rBLPsjkz7FkAd4W8JABWZtgwBuDRS
 qLf+e3Do4U0t5RzrMax6zl4/qxX2a2ca9jKJoTV9YMXCqsefR/zm+i6MoA40bIgWs0ef
 idGAQnt76kWKxc+sp4VlCpn/uEpphTcefYNTFu78VhpGeQerpQMrMGWrw4FOiaEEgZL+
 V6lhDzqU96Aa4+a1Wl2AY5D/AwQK7X6SwZaeXfsW6M/84YBqf1QCSC9wCDOjcD5nWs4w
 VBVw==
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Cc: le.ma@amd.com, airlied@linux.ie, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, clang-built-linux@googlegroups.com,
 ray.huang@amd.com, dri-devel@lists.freedesktop.org, alexander.deucher@amd.com,
 christian.koenig@amd.com, Hawking.Zhang@amd.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

PiBBcHBhcmVudGx5IHRoaXMgYnVnIGlzIHN0aWxsIHByZXNlbnQgaW4gYm90aCB0aGUgcmVsZWFz
ZWQgY2xhbmctOQo+IGFuZCB0aGUgY3VycmVudCBkZXZlbG9wbWVudCB2ZXJzaW9uIG9mIGNsYW5n
LTEwLgo+IEkgd2FzIGhvcGluZyB3ZSB3b3VsZCBub3QgbmVlZCBhIHdvcmthcm91bmQgaW4gY2xh
bmctOSssIGJ1dAo+IGl0IHNlZW1zIHRoYXQgd2UgZG8uCgpJIHRoaW5rIEknZCByYXRoZXI6CjEu
IG1hcmsgQU1ER1BVIEJST0tFTiBpZiBDQ19JU19DTEFORy4gVGhlcmUgYXJlIG51bWVyb3VzIG90
aGVyIGlzc3VlcyBidWlsZGluZwogICBhIHdvcmtpbmcgZHJpdmVyIGhlcmUuCjIuIEZpeCB0aGUg
Y29tcGlsZXIgYnVnLgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2
ZWw=
