Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5ED58341899
	for <lists+dri-devel@lfdr.de>; Fri, 19 Mar 2021 10:41:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 973766E9C0;
	Fri, 19 Mar 2021 09:41:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x729.google.com (mail-qk1-x729.google.com
 [IPv6:2607:f8b0:4864:20::729])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 089A86E9BF
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Mar 2021 09:41:31 +0000 (UTC)
Received: by mail-qk1-x729.google.com with SMTP id o5so2172354qkb.0
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Mar 2021 02:41:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=ZdQbf+EBUXhMOGwhsST3dhHgVhSrputLm7uq5nv14OI=;
 b=idVTkr09O0FHr/hpxHoZCCJoeDcmAuir0T1RdKbEtACiV3aCb4sCS+Ak/9pK1YM7Az
 hvbo48nLKSRMuGVWlS2GDAzjKfhN7HW66HdL8jhRUWOSup45dXw3wjZZfmuJ080p3Dkd
 QO4sG8FHr3NgBvo/MK6FNups+Z5xcwFus6Y8Lq7DzmyYoW10csZwUz1Ke41ocinn5L2o
 dRQYb6YRicIvLo7YYV6shwegar5aYu6oMA7K8Q1YvkdDwIAaHL3V4W6EgP4cKWSKC+vY
 vx9eqj+yXDz/uV23i8lponuVO1wfPnJpxYAusz2XtmGT4YGg2XKuNzD3E99oiIoKi+uL
 +7iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=ZdQbf+EBUXhMOGwhsST3dhHgVhSrputLm7uq5nv14OI=;
 b=E93eVtVl0mGwUaeRXD3umUI41EBWxBbimND561Tz3b0Nm85jgXduAfIOy2j5D26hH0
 6ygxwplZbWt+uvUnvorQVW3XbGj/IVwlMwu+OwXgqq/c4/Ipp1b8e0UVQ8uIigNMbs4Z
 rd44QELTF6b3JbofuGWRxb9JFHC5NiWBpg4ig1EYIkdApu9eDL8X1OnfSVCJiTL2HL6o
 0T166mHJJiiido8cao+X0QLighAEvYgVIRLQAV5yQmD2hb0X+jT15DK21S6oUvKnrLfx
 pt82wmN44RLa/e6u6UiO27n+cAcfSo5He0r3YVpGxR/EhPCiPmqm1pPLftOdDDkC8PnZ
 dKWQ==
X-Gm-Message-State: AOAM532BA6w/dlu/w/wcolKmC5G2fMj4d1a3DwoNEY61mZ+fXQ87BdQK
 EBzGZXhzr2UD5x68rmmfm3no3WBxgdCo5DVqXmw=
X-Google-Smtp-Source: ABdhPJynIPNrGOYXn62OP1z2r15sNqQb2Plcb5tjY0ZNSnwuUvg9LwQ/neIw4O69+uXiyqVgVZ+Bd5slNXUh838aTTo=
X-Received: by 2002:a37:a0d1:: with SMTP id j200mr8479005qke.426.1616146891172; 
 Fri, 19 Mar 2021 02:41:31 -0700 (PDT)
MIME-Version: 1.0
References: <20210318124719.13656-1-christian.koenig@amd.com>
In-Reply-To: <20210318124719.13656-1-christian.koenig@amd.com>
From: Matthew Auld <matthew.william.auld@gmail.com>
Date: Fri, 19 Mar 2021 09:41:05 +0000
Message-ID: <CAM0jSHPUVw7jOUQgbWeo6i2CkmCvk6tb_XGzNDUU4+v+5yG5Sg@mail.gmail.com>
Subject: Re: [PATCH 1/3] drm/ttm: move swapout logic around v2
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
Cc: ray.huang@amd.com, ML dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCAxOCBNYXIgMjAyMSBhdCAxMjo0NywgQ2hyaXN0aWFuIEvDtm5pZwo8Y2tvZW5pZy5s
ZWljaHR6dW1lcmtlbkBnbWFpbC5jb20+IHdyb3RlOgo+Cj4gTW92ZSB0aGUgaXRlcmF0aW9uIG9m
IHRoZSBnbG9iYWwgbHJ1IGludG8gdGhlIG5ldyBmdW5jdGlvbgo+IHR0bV9nbG9iYWxfc3dhcG91
dCgpIGFuZCB1c2UgdGhhdCBpbnN0ZWFkIGluIGRyaXZlcnMuCj4KPiB2MjogY29uc2lzdGVudGx5
IHJldHVybiBpbnQKPgo+IFNpZ25lZC1vZmYtYnk6IENocmlzdGlhbiBLw7ZuaWcgPGNocmlzdGlh
bi5rb2VuaWdAYW1kLmNvbT4KCkZvciB0aGUgc2VyaWVzLApSZXZpZXdlZC1ieTogTWF0dGhldyBB
dWxkIDxtYXR0aGV3LmF1bGRAaW50ZWwuY29tPgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0
cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9kcmktZGV2ZWwK
