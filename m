Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 18465338A29
	for <lists+dri-devel@lfdr.de>; Fri, 12 Mar 2021 11:33:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 476986E0D9;
	Fri, 12 Mar 2021 10:33:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf33.google.com (mail-qv1-xf33.google.com
 [IPv6:2607:f8b0:4864:20::f33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 383E66E0D9
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Mar 2021 10:33:27 +0000 (UTC)
Received: by mail-qv1-xf33.google.com with SMTP id j17so4006434qvo.13
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Mar 2021 02:33:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=6JjnzKMyPZADfkhBaHH2Qmx+NNF1mfiJaZditxOfZgc=;
 b=Xap/q7PkcjbkwkfWt5PL13wcd42c9JY/3296O83daXWevuiB0KCj1idFesiJaA6mJ7
 Uc8JqzbXRwcQB9kk3zB0ALGEyRkOMSZ9Pp7ipydcRpdhYXHpikejijnjshYiY3HjM5t3
 4sKKe8dctKfCoetMkni545xL/07o+PSho+9DpGmQcEzLvxvZ9sQMEiM15lRauhMDQdMk
 rjp/bJ5t8n8l8yPKHVeF/X7uouIo8mAmq3PASNzMfKky1QzRg4oWgz7fpifzkVwXfupp
 ZCtCqZXuG28yKgTsQz5g8o74itMLTKh8GOoMUxdLhbX+WrA5iep8Kb1MvTL5Jow49wvn
 L8JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=6JjnzKMyPZADfkhBaHH2Qmx+NNF1mfiJaZditxOfZgc=;
 b=ObP0GZ/BRkKsBJG7WvyUObe+lc3g/LAsn7sDyZ+e5nDOB78Ca155pD3Vp48BjgQofR
 PaPvpUhIs+iaemcAGajRDM6kuEkeg54YmKz/chpoCzyzST7gwvEcnW5zPuTYvvz0CVOg
 /SMfX6IxAT8d3tnsa682gCXuQZjsCNzcTDscQx4hdyl73zOThgFGJIJRSYz11x1VTcvl
 y5IDAG9RKO7P/8GXBdr1pVlRBfz6B1GNARobE6R1o+rvkCy97bg+NlkDSWM0RalwdUg7
 Cg+Q+AL0IaLmkX41oh3m3GATa3WNkp/FF3dDypaErk0enB5DSQyqUGueGstV2ABywWyD
 7LCQ==
X-Gm-Message-State: AOAM530CnJB+CNmKNiNd7QWKbTNF2oK0dTrqCNsAZxOXBt0rTKyMDwDZ
 6pSBpwGEuiM7kpaUSl2n+Wfr4Ml71u0jK/aKt78=
X-Google-Smtp-Source: ABdhPJxK0eR3YotLarJYqt/pP70RV0vR0ykltXxMiF2ANAggCtoI97JcnUhd7gIrUzEMRuU4cXhlFww0oisKZl6lPMk=
X-Received: by 2002:a05:6214:20a1:: with SMTP id
 1mr11855874qvd.30.1615545206315; 
 Fri, 12 Mar 2021 02:33:26 -0800 (PST)
MIME-Version: 1.0
References: <20210312093810.2202-1-christian.koenig@amd.com>
In-Reply-To: <20210312093810.2202-1-christian.koenig@amd.com>
From: Matthew Auld <matthew.william.auld@gmail.com>
Date: Fri, 12 Mar 2021 10:32:59 +0000
Message-ID: <CAM0jSHPKwgRhH4J+jTzRy0ZQQ=Ac1YHe_cLgGf9KWnzx4Oa0HA@mail.gmail.com>
Subject: Re: [PATCH] drm/ttm: make ttm_bo_unpin more defensive
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
Cc: ML dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCAxMiBNYXIgMjAyMSBhdCAwOTozOCwgQ2hyaXN0aWFuIEvDtm5pZwo8Y2tvZW5pZy5s
ZWljaHR6dW1lcmtlbkBnbWFpbC5jb20+IHdyb3RlOgo+Cj4gV2Ugc2VlbSB0byBoYXZlIHNvbWUg
bW9yZSBkcml2ZXIgYnVncyB0aGFuIHRob3VnaHQuCj4KPiBTaWduZWQtb2ZmLWJ5OiBDaHJpc3Rp
YW4gS8O2bmlnIDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+CkFja2VkLWJ5OiBNYXR0aGV3IEF1
bGQgPG1hdHRoZXcuYXVsZEBpbnRlbC5jb20+Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2RyaS1kZXZlbAo=
