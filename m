Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 688DFF35B1
	for <lists+dri-devel@lfdr.de>; Thu,  7 Nov 2019 18:29:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D96EC6F754;
	Thu,  7 Nov 2019 17:29:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vk1-xa42.google.com (mail-vk1-xa42.google.com
 [IPv6:2607:f8b0:4864:20::a42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 18D736E369;
 Thu,  7 Nov 2019 17:29:13 +0000 (UTC)
Received: by mail-vk1-xa42.google.com with SMTP id k19so771867vke.10;
 Thu, 07 Nov 2019 09:29:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=FJ/5JzEIC2cnc/t+SlFWINjO7/ar6sP5zFsCO5J2xb4=;
 b=js/W9V4fEFJDRyQf6DnmxXlHPlF0+GtnNRnA1q2g5CDsyB8aWJV4Ly4yqNf5LnwArc
 t1cf1ecdpxeAY22dQRbfAdbo3FCiH9Qf7WsjkHM3W4yVDKYaoZCKklW0nxNXmp55io7/
 x1P2agekwH4OeNfPiNyv/gRZTYhDn9QnL8sgnxDGubgJdqoirv5as4XCnplsnPX3gxUT
 7xl+4bHRfJ1NPadxKhIyyP2PtQ0LuMLaEDRc8ynnyLyYCysAqnXYxxpOT6e0UqLIrwZn
 ZyuouE+eqBKmsB1DuEn0xM5itPo/tDtbVeQBMmKbwNezUVzONPCCnk8iAmXCp4JUx7Bf
 MABA==
X-Gm-Message-State: APjAAAVUyhQDyDo109qS3Xk0SOgYZnmF+M76iiSfAifbFurzQHTWPP5j
 UGacWwTABVU2MNuthWqBykMJzHB2qSR/C2gEjrImFpy4
X-Google-Smtp-Source: APXvYqwREzjllY2jsbweOMHpVSvs1NCwn1J3nRboPoGNGWoBaBidgKb+rCcb95rMsplVBIqtP9VRSqTwxPPiaE1ZlUc=
X-Received: by 2002:a1f:5f08:: with SMTP id t8mr3594845vkb.87.1573147751967;
 Thu, 07 Nov 2019 09:29:11 -0800 (PST)
MIME-Version: 1.0
References: <20191106142432.14022-1-chris@chris-wilson.co.uk>
 <20191106142432.14022-4-chris@chris-wilson.co.uk>
In-Reply-To: <20191106142432.14022-4-chris@chris-wilson.co.uk>
From: Matthew Auld <matthew.william.auld@gmail.com>
Date: Thu, 7 Nov 2019 17:28:45 +0000
Message-ID: <CAM0jSHO-SDrc0ZiDx+HtGigVhbB2wv_59JQEyod+G8drOJ=-xQ@mail.gmail.com>
Subject: Re: [Intel-gfx] [PATCH v3 3/5] drm/i915/selftests: Replace mock_file
 hackery with drm's true fake
To: Chris Wilson <chris@chris-wilson.co.uk>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=FJ/5JzEIC2cnc/t+SlFWINjO7/ar6sP5zFsCO5J2xb4=;
 b=qqnxT7XS955uDINTdxb9ayib1SBOVUuOJYp9kCSVuCadmx1UMxcdEDoKJvARjoTQDJ
 grVSiq2jvl9T54UDpiABga+zYrcJIHdgc5HsdujUvKuGfVUJykDiW1o3bbSseJgdM0FD
 iujOjPySNYoHC385w31x3qz6BDShkolY9462LIsBVqPw2fEkq0tPkwfe0ETRtr+WroW8
 XqintwxVOM5i4GoPyjNdvkUEv3ECbTNokX3kx0UPZXbPo340PY0D0cKzr4pQ/WLofqae
 CMVXsYt4Cj+odecm4vbDD3REFESrdqQne+3CVUP/Yn+lU4NIQ6DSpt/4FawTn8JEeTb+
 +v9A==
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
Cc: Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 ML dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCA2IE5vdiAyMDE5IGF0IDE0OjI0LCBDaHJpcyBXaWxzb24gPGNocmlzQGNocmlzLXdp
bHNvbi5jby51az4gd3JvdGU6Cj4KPiBBcyBkcm0gbm93IGV4cG9ydHMgYSBtZXRob2QgdG8gY3Jl
YXRlIGFuIGFub255bW91cyBzdHJ1Y3QgZmlsZSBhcm91bmQgYQo+IGRybV9kZXZpY2UgZm9yIGlu
dGVybmFsIHVzZSwgbWFrZSB1c2Ugb2YgaXQgdG8gYXZvaWQgb3VyIGhvcnJpYmxlIGhhY2tzLgo+
Cj4gU2lnbmVkLW9mZi1ieTogQ2hyaXMgV2lsc29uIDxjaHJpc0BjaHJpcy13aWxzb24uY28udWs+
CgpBcyBwZXIgeW91ciBldmVudHVhbCBwbGFuLCBmd2l3LApSZXZpZXdlZC1ieTogTWF0dGhldyBB
dWxkIDxtYXR0aGV3LmF1bGRAaW50ZWwuY29tPgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0
cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9kcmktZGV2ZWw=
