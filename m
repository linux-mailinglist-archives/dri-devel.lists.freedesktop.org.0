Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EAFE1374314
	for <lists+dri-devel@lfdr.de>; Wed,  5 May 2021 18:50:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 17C4A6E4D7;
	Wed,  5 May 2021 16:50:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x834.google.com (mail-qt1-x834.google.com
 [IPv6:2607:f8b0:4864:20::834])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 352F56E4D7
 for <dri-devel@lists.freedesktop.org>; Wed,  5 May 2021 16:50:10 +0000 (UTC)
Received: by mail-qt1-x834.google.com with SMTP id j11so1684088qtn.12
 for <dri-devel@lists.freedesktop.org>; Wed, 05 May 2021 09:50:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=6DA+iWuarwewxIHCjN3w/dR8eNfYqdFSJS7dMZFghBI=;
 b=Y545m+iZiu8+5zve9uKg4wQXNPUWbGZkIKu3i2GbsR5qQAolWA61L/nuxnHRI2Cng0
 QURCWxW/mKTNsiNaw4qwCl+EHyKZR5PGNBXonD0NFqD9MwWpmWmJ2qv6RFzF4w0BjP5s
 VedG2tpkHC8RwpDLtsBZln5SCOvQC10TTscUe8NwXhK9GVWDdDxRXJOpghW9X6vcb9Cd
 39Z1yVuBCSJ2Z4vhbaoQ4rxY/wTrv/I/vtlD2pgnU3iOc9lrMUqCLmzwyig+4bVxJzG6
 z0KPJ+wLIs1yeXRk7T3clYdPv4KirIKMrEfUhVxjbLX/+Tv+ShLrk6hhCaA9H/Vn04Wx
 qw/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=6DA+iWuarwewxIHCjN3w/dR8eNfYqdFSJS7dMZFghBI=;
 b=Yiu5XfGHD7D5OHdwSICZBGhR0cD0UBkhOteCgaq/TgUOnNXVaUKAWWsl8kY2+ESgys
 HN9TxXDryjSXg8TBbWtiu+BBC6tyvDfFYpDact67WjOkdhSdYvmIe+H+PbePKJTl+H4o
 +0hTqzIUMUJ/J6xQCYPa7uKjdZXUIl++QCOGm8ntpy7lhGJWsto8GSM2QxC4rUc6mmrB
 2tc8OhvgifVw/dsvgyGfb+RmWuIjjzrkEJG5MU151JST+49RFfvlAD/n7Pcw+p1IPo4y
 FfkQz9dTM5a2fV8gGEk3GuqVy9h1BC/4jF7mLH1O7E/dSr0L0nxqdOUR6b36T1J/gNIZ
 seJQ==
X-Gm-Message-State: AOAM533uGhx4d43XWCZ4lUs0MW0bUF7FiV/RLAlnoXD0LN5XUG/ich0Y
 2WCROGGsxrmDf1VlMbhIdl0sn55phQ3oeGju+kk=
X-Google-Smtp-Source: ABdhPJyTCiSsBMm/KU/y7CpQ4C2b3vXkFh63djcN3fqgctRx+c9SCChAsYU32vbZOY/zXmuRph+EmTIk9rUalYahFPs=
X-Received: by 2002:ac8:7f14:: with SMTP id f20mr27914072qtk.339.1620233405793; 
 Wed, 05 May 2021 09:50:05 -0700 (PDT)
MIME-Version: 1.0
References: <20210430092508.60710-1-christian.koenig@amd.com>
 <20210430092508.60710-12-christian.koenig@amd.com>
In-Reply-To: <20210430092508.60710-12-christian.koenig@amd.com>
From: Matthew Auld <matthew.william.auld@gmail.com>
Date: Wed, 5 May 2021 17:49:39 +0100
Message-ID: <CAM0jSHN1j_w6PMBxv=gqHbq9Yeq_vt6e0avw+NWV76gg=WRAxw@mail.gmail.com>
Subject: Re: [PATCH 12/13] drm/vmwgfx: switch the TTM backends to self alloc
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 ML dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCAzMCBBcHIgMjAyMSBhdCAxMDoyNSwgQ2hyaXN0aWFuIEvDtm5pZwo8Y2tvZW5pZy5s
ZWljaHR6dW1lcmtlbkBnbWFpbC5jb20+IHdyb3RlOgo+Cj4gU2ltaWxhciB0byB0aGUgVFRNIHJh
bmdlIG1hbmFnZXIuCj4KPiBTaWduZWQtb2ZmLWJ5OiBDaHJpc3RpYW4gS8O2bmlnIDxjaHJpc3Rp
YW4ua29lbmlnQGFtZC5jb20+ClJldmlld2VkLWJ5OiBNYXR0aGV3IEF1bGQgPG1hdHRoZXcuYXVs
ZEBpbnRlbC5jb20+Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9y
ZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZl
bAo=
