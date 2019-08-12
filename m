Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C4058A6D2
	for <lists+dri-devel@lfdr.de>; Mon, 12 Aug 2019 21:05:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F3A508931D;
	Mon, 12 Aug 2019 19:05:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9AE9D8931D;
 Mon, 12 Aug 2019 19:05:48 +0000 (UTC)
Received: from localhost (unknown [40.117.208.15])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 450CF20684;
 Mon, 12 Aug 2019 19:05:48 +0000 (UTC)
Date: Mon, 12 Aug 2019 19:05:47 +0000
From: Sasha Levin <sashal@kernel.org>
To: Sasha Levin <sashal@kernel.org>
To: Chris Wilson <chris@chris-wilson.co.uk>
To: dri-devel@lists.freedesktop.org
Subject: Re: [PATCH] dma-buf/sw_sync: Synchronize signal vs syncpt free
In-Reply-To: <20190812154247.20508-1-chris@chris-wilson.co.uk>
References: <20190812154247.20508-1-chris@chris-wilson.co.uk>
Message-Id: <20190812190548.450CF20684@mail.kernel.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1565636748;
 bh=1SibqVTtFth5CBhb6xXi/7U4gTUuYQ9qggoJai7bnTw=;
 h=Date:From:To:To:To:Cc:Cc:Cc:Cc:Cc:Cc:Subject:In-Reply-To:
 References:From;
 b=0IgFErzwaoNvJ0ThUQbpiR8tu+AxgJRZY4cMb8x/WFdsi+WFMhZPf/+P0G+ajij/i
 cFwnKAoqNiQDgeOAYWLrSW7kFmdK6jPoMauGqsXpLI/XQQscREpFsFfpPAAhVW1hCW
 cmIh+NRNAvl/dsgqZO1nGJfkhjIcTAQmzU6Lfn3I=
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
Cc: , Gustavo Padovan <gustavo@padovan.org>, intel-gfx@lists.freedesktop.org, stable@vger.kernel.org, Christian König <christian.koenig@amd.com>, Sean Paul <seanpaul@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGksCgpbVGhpcyBpcyBhbiBhdXRvbWF0ZWQgZW1haWxdCgpUaGlzIGNvbW1pdCBoYXMgYmVlbiBw
cm9jZXNzZWQgYmVjYXVzZSBpdCBjb250YWlucyBhICJGaXhlczoiIHRhZywKZml4aW5nIGNvbW1p
dDogZDM4NjJlNDRkYWE3IGRtYS1idWYvc3ctc3luYzogRml4IGxvY2tpbmcgYXJvdW5kIHN5bmNf
dGltZWxpbmUgbGlzdHMuCgpUaGUgYm90IGhhcyB0ZXN0ZWQgdGhlIGZvbGxvd2luZyB0cmVlczog
djUuMi44LCB2NC4xOS42NiwgdjQuMTQuMTM4LCB2NC45LjE4OS4KCnY1LjIuODogQnVpbGQgT0sh
CnY0LjE5LjY2OiBCdWlsZCBPSyEKdjQuMTQuMTM4OiBCdWlsZCBPSyEKdjQuOS4xODk6IEZhaWxl
ZCB0byBhcHBseSEgUG9zc2libGUgZGVwZW5kZW5jaWVzOgogICAgVW5hYmxlIHRvIGNhbGN1bGF0
ZQoKCk5PVEU6IFRoZSBwYXRjaCB3aWxsIG5vdCBiZSBxdWV1ZWQgdG8gc3RhYmxlIHRyZWVzIHVu
dGlsIGl0IGlzIHVwc3RyZWFtLgoKSG93IHNob3VsZCB3ZSBwcm9jZWVkIHdpdGggdGhpcyBwYXRj
aD8KCi0tClRoYW5rcywKU2FzaGEKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8v
ZHJpLWRldmVs
