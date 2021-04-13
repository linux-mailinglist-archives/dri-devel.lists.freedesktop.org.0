Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D330035E39F
	for <lists+dri-devel@lfdr.de>; Tue, 13 Apr 2021 18:16:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A0F76E828;
	Tue, 13 Apr 2021 16:16:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x833.google.com (mail-qt1-x833.google.com
 [IPv6:2607:f8b0:4864:20::833])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B359F6E821
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Apr 2021 16:16:38 +0000 (UTC)
Received: by mail-qt1-x833.google.com with SMTP id i6so3523594qti.10
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Apr 2021 09:16:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=fM8xjKUkxDgJH68y5rfyDk03IRtTKEoqYSCBVuSOE7k=;
 b=EtDdXTGFfUd9arFqNywjyFcwOad9WmBK/9SvaC22n2+dx7M9XFf3DEVy5Vyrp+4m25
 YJINnezgvV4sI5kighvcwusNF4FAO6rFJffXLaSmkaaJvl4MST1LfdV04IoGw0TVkLzV
 m2jHDonCEC33y6XIJ6A1yjH0UfZaDCsLcH/gy7tt87fnCh+Bl2a1iaCTfuvjMjkx9XMl
 4laClIVZURAzTfocEaLFwehikSUYHN6kFGdvs+UagJtcU4T9HE61wAl1OjeW1kzYu+5f
 2n03IBj67KqEH1IAxmflsoBxMInkOXfmbIAjUT1RcypfacuSDj04ZpHRHZStfzq6e1M5
 HPew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=fM8xjKUkxDgJH68y5rfyDk03IRtTKEoqYSCBVuSOE7k=;
 b=hsgxQdV3rQJLCQCNTx5CQ40QnPHKHb/vElAcM5d7A8rGGCzEAYDubp5+/dPYw9KK85
 Cjz3xV/5NMmZandRgomilh514yekc4KHsBRHUnu8QS/wwVO0I2rBjYhwl+oZTRVj5fGQ
 ibpPZ+cYY88aTcek+XySreOclflWxq/sA4MiAg48idXBSkvPEKhKI1fcbe+saS7BlU0w
 ogWcB8IWQR8WAr+YkvesxfGmEj9i07+pH7rPus1pcseQkfNOjP8rfA7Go4V6C+w6WHZF
 VUf/E6PCItDCyp3BRIz0zsg+tAQvHb72g0pGXNX86ZAbIZYR9gRP3JJsfcO77WagjKHr
 FxFQ==
X-Gm-Message-State: AOAM533uPE3WgFwHVK/lkUMZv6GrMaD6qTrQrMi57HiEBWwWRK+p32vV
 mdqlyYkr3ctdgMbrXhfdN7BUBLRjqtYsY4XCGCI=
X-Google-Smtp-Source: ABdhPJwQ1MfqMezDzyYN6flaP1oUVNhbKV5SAQtjkHL/sCS0mLR3h5Oop4oSXlDiXLkMazMD6k/YlX/23dIk6vRBrc4=
X-Received: by 2002:ac8:7dc2:: with SMTP id c2mr31051805qte.341.1618330597841; 
 Tue, 13 Apr 2021 09:16:37 -0700 (PDT)
MIME-Version: 1.0
References: <20210413135248.1266-1-christian.koenig@amd.com>
 <20210413135248.1266-2-christian.koenig@amd.com>
In-Reply-To: <20210413135248.1266-2-christian.koenig@amd.com>
From: Matthew Auld <matthew.william.auld@gmail.com>
Date: Tue, 13 Apr 2021 17:16:11 +0100
Message-ID: <CAM0jSHP4bHrT2ybmeFMqCc0P5qSXeUC271tyegFVCT+aceWSJw@mail.gmail.com>
Subject: Re: [PATCH 2/7] drm/amdgpu: check base size instead of mem.num_pages
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
 ML dri-devel <dri-devel@lists.freedesktop.org>,
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCAxMyBBcHIgMjAyMSBhdCAxNDo1MiwgQ2hyaXN0aWFuIEvDtm5pZwo8Y2tvZW5pZy5s
ZWljaHR6dW1lcmtlbkBnbWFpbC5jb20+IHdyb3RlOgo+Cj4gRHJvcCBzb21lIHVzc2FnZSBvZiBt
ZW0gaW4gdGhlIGNvZGUuCgp1c2FnZQoKPgo+IFNpZ25lZC1vZmYtYnk6IENocmlzdGlhbiBLw7Zu
aWcgPGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4KUmV2aWV3ZWQtYnk6IE1hdHRoZXcgQXVsZCA8
bWF0dGhldy5hdWxkQGludGVsLmNvbT4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGlu
Zm8vZHJpLWRldmVsCg==
