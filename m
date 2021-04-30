Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C632936FCA1
	for <lists+dri-devel@lfdr.de>; Fri, 30 Apr 2021 16:43:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B06746F543;
	Fri, 30 Apr 2021 14:43:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf2c.google.com (mail-qv1-xf2c.google.com
 [IPv6:2607:f8b0:4864:20::f2c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F09016F543
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Apr 2021 14:43:29 +0000 (UTC)
Received: by mail-qv1-xf2c.google.com with SMTP id u1so2864932qvg.11
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Apr 2021 07:43:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=6DA+iWuarwewxIHCjN3w/dR8eNfYqdFSJS7dMZFghBI=;
 b=GFC77jcw+TJsYBydMDeK0nlny9x+A+Pdb3UO2UArIkriJ7tpYXJne/sJkt5kxbcTRX
 Uyvpd092IOpkWE7ts91mAz5DBVNrxNqyWw8Jy3KeF7JDWEHUQ3ZfetManJJ3cGs7l/EZ
 BzB576kMJsZQPstxKSWkIx/GB3G8VkqSF4CtUrnLc4sbApxE3n8XbBf8Qlzjc86xFu1J
 mAQaqZ1EFlf5GDEgitPxNS0ACbe8gvCvqmG/YwffmyM+nl/yB7Kk7PLkoe2lVgGxv23e
 lVS+nweUUFeW23VbKzlB3ysFaArVhyOv+11/+ioRs9s9So2pUiZsUzxJ4zHQ1lXhq5O5
 1CQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=6DA+iWuarwewxIHCjN3w/dR8eNfYqdFSJS7dMZFghBI=;
 b=GqLGLhoI2GyKq4OSGZyoq3fAYWhQ3A/bVbGKdybu1izWIqYogY9NmISrxaBHWeIy+u
 HQMjD1hUvA3pK1SZ8rgrEgKsj0/k05yOpCPSWMGItMzNrYVQ4JbmiN2r+v5jvdmDYHKE
 cyO4ueFFL/c+g69ChB7as8JDJNu2f/ejClolAITv/dcl/Ip27aU6SUk6vASZQoZMsye2
 oSR03nYRqPLia0wLa8J8pnrs8mJQ6JgXSmCbUYNVYo3hcBflDcTiNAvLMu/+5Yuv9E4P
 pJaq4iBw0WUTlGk+3fosuMIUmou/HRhgA1AEsVUSAPnmRKkybYq8Ia7gKZu+bIVDdkku
 lQGw==
X-Gm-Message-State: AOAM533OhHHlhl0YhAn6Xh2Xkha0HCFBzXyrpX+TImI53lAeDlIAQz2Y
 WLUpFdgdZVD0dACz8EMWSxLjIoTmolE2D0cugfQ=
X-Google-Smtp-Source: ABdhPJxLUItUtNH5Ta0DUzE+goisl24lBKrTb498xcPYGtvra5S9niLr9uUN7r6kNrSasyaFnn1xQ+GOcbR3ll5Lu6Y=
X-Received: by 2002:ad4:4109:: with SMTP id i9mr6039149qvp.30.1619793809034;
 Fri, 30 Apr 2021 07:43:29 -0700 (PDT)
MIME-Version: 1.0
References: <20210430092508.60710-1-christian.koenig@amd.com>
 <20210430092508.60710-9-christian.koenig@amd.com>
In-Reply-To: <20210430092508.60710-9-christian.koenig@amd.com>
From: Matthew Auld <matthew.william.auld@gmail.com>
Date: Fri, 30 Apr 2021 15:43:01 +0100
Message-ID: <CAM0jSHM5LBtgdL0ht4gwpg==CPk9x1g6iDKZ49YfKbeOJyWcWg@mail.gmail.com>
Subject: Re: [PATCH 09/13] drm/amdgpu: switch the GTT backend to self alloc
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
