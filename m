Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C3F2736F868
	for <lists+dri-devel@lfdr.de>; Fri, 30 Apr 2021 12:23:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 746F76E44D;
	Fri, 30 Apr 2021 10:23:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x82b.google.com (mail-qt1-x82b.google.com
 [IPv6:2607:f8b0:4864:20::82b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EAC526E44D
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Apr 2021 10:23:04 +0000 (UTC)
Received: by mail-qt1-x82b.google.com with SMTP id n22so11681386qtk.9
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Apr 2021 03:23:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=iFM3WV7B/i6UNzO2thshLvRgSaLaxHwLFpFNDHoPMJI=;
 b=T0olEx+peixoiDtK2ur7W8wHUy5RAEZ9nARXW8x+NooYWsMcUSTXtYXNpRQ18ls5R2
 xTuGT/ssGkpLloDQQqy8P2I9Ibi1Cus8D7k8eOsD5h/t05XVrbl1yF+XLW4Ah247DUrw
 P8TQNp5ovF++hCAXFIbloRzG2rlEwwAccsH/ONFyy2+Bl3wxeIjOWRyPXW6nDjTfZDLM
 oTxhJtSvbUvRTBTayrJcGBWEp63FSDTstImEl9MiJd8vNRduEXp+PCTXDSb/MDrlQiOr
 chw/T17DBKVF6L7H9lombcO5Zeyu2EYto0nP3AfDX7muMuXikfNVk9cD+MmG4sWutX3m
 ifMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=iFM3WV7B/i6UNzO2thshLvRgSaLaxHwLFpFNDHoPMJI=;
 b=tRvL+m1n65qCVRpm2zKTeceGkB251UpEf1GugCym3YHFVfcHOcOH/Y69urkXMjBzj/
 i359pUs0TurZNajvIowsrih0E3YABhf0cnZHjFH3UKtRxP5WQYqYOovB6nOQVZu70Gne
 n4mKjnqU2vEL1eFmflOxyxQKYQnvMSktbEHcLQu6orRKi/CSNvyvMiIEuPbYp6OgBrE2
 6+jYl0r4OLtZ9iFRA1f/COswOeAi1idnb07piNR2xQBLUNCMW6KXGRgosOz6O2MJ1pc4
 Cgru6y7Wq3+AhUjliHgL2J+4fo5E8/lVe7eFtVIf4/uAfIFiZVJbtaHwJTBNTw4X2Wyq
 +9eQ==
X-Gm-Message-State: AOAM5330YIJPKGkGeWaxY6rAStdhOblNN0b1mhNP0Oo0WO/2E4qtIqcb
 evy2PypZOSWrUdSEd8vPoAqkKZ85AnA2DDXluLU=
X-Google-Smtp-Source: ABdhPJxh69iGl3yiB6/+QL7E/KmXnzmXjnBiRrddoaDvsXIFCUjB/4lsulV6VdomZ1H/22g5qQbMfLsSo5cGIR2xVEM=
X-Received: by 2002:a05:622a:2c6:: with SMTP id
 a6mr3860004qtx.95.1619778184133; 
 Fri, 30 Apr 2021 03:23:04 -0700 (PDT)
MIME-Version: 1.0
References: <20210430092508.60710-1-christian.koenig@amd.com>
 <20210430092508.60710-3-christian.koenig@amd.com>
In-Reply-To: <20210430092508.60710-3-christian.koenig@amd.com>
From: Matthew Auld <matthew.william.auld@gmail.com>
Date: Fri, 30 Apr 2021 11:22:37 +0100
Message-ID: <CAM0jSHNCXePML34JE0RhNb7F_xJDcq8tKKJE+VadmB8A5bG4cA@mail.gmail.com>
Subject: Re: [PATCH 03/13] drm/ttm: properly allocate sys resource during
 swapout
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
ZWljaHR6dW1lcmtlbkBnbWFpbC5jb20+IHdyb3RlOgo+Cj4gRHJvcCB0aGUgc3BlY2lhbCBoYW5k
bGluZyBoZXJlLgo+Cj4gU2lnbmVkLW9mZi1ieTogQ2hyaXN0aWFuIEvDtm5pZyA8Y2hyaXN0aWFu
LmtvZW5pZ0BhbWQuY29tPgpSZXZpZXdlZC1ieTogTWF0dGhldyBBdWxkIDxtYXR0aGV3LmF1bGRA
aW50ZWwuY29tPgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
aHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
