Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BCD531FF0
	for <lists+dri-devel@lfdr.de>; Sat,  1 Jun 2019 18:20:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 86B9589354;
	Sat,  1 Jun 2019 16:20:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C660D89354
 for <dri-devel@lists.freedesktop.org>; Sat,  1 Jun 2019 16:20:36 +0000 (UTC)
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
 [83.86.89.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id A256B27753;
 Sat,  1 Jun 2019 16:20:35 +0000 (UTC)
Date: Sat, 1 Jun 2019 09:19:29 -0700
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Sasha Levin <sashal@kernel.org>
Subject: Re: [PATCH AUTOSEL 4.4 44/56] video: imsttfb: fix potential NULL
 pointer dereferences
Message-ID: <20190601161929.GA5028@kroah.com>
References: <20190601132600.27427-1-sashal@kernel.org>
 <20190601132600.27427-44-sashal@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190601132600.27427-44-sashal@kernel.org>
User-Agent: Mutt/1.12.0 (2019-05-25)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1559406036;
 bh=nKe8XKOVM5oAWjQWs73h5gY//PZ5JoisK7aclAP9fL0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=pZHp1glx3ON5yINQU+hCJ6dIP1rq7wpCsbYs1VmbQnlHfNOMaaFs+XKGpjdIHHjjC
 Ov/Lp1qesJlmwiSeGdxjcWxt+lrJ7KYwm5vvSwdzdB67A7kNxdo6Wo4gdNmrDqj+dm
 OuwBDTo2egTzWOx7AD0NXd7SNmnaTzxo7llEQ6cY=
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
Cc: linux-fbdev@vger.kernel.org,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 dri-devel@lists.freedesktop.org, Kangjie Lu <kjlu@umn.edu>,
 linux-kernel@vger.kernel.org, Finn Thain <fthain@telegraphics.com.au>,
 stable@vger.kernel.org, Aditya Pakki <pakki001@umn.edu>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gU2F0LCBKdW4gMDEsIDIwMTkgYXQgMDk6MjU6NDhBTSAtMDQwMCwgU2FzaGEgTGV2aW4gd3Jv
dGU6Cj4gRnJvbTogS2FuZ2ppZSBMdSA8a2psdUB1bW4uZWR1Pgo+IAo+IFsgVXBzdHJlYW0gY29t
bWl0IDFkODQzNTNkMjA1YTk1M2UyMzgxMDQ0OTUzYjdmYTMxYzhjOTcwMmQgXQo+IAo+IEluIGNh
c2UgaW9yZW1hcCBmYWlscywgdGhlIGZpeCByZWxlYXNlcyByZXNvdXJjZXMgYW5kIHJldHVybnMK
PiAtRU5PTUVNIHRvIGF2b2lkIE5VTEwgcG9pbnRlciBkZXJlZmVyZW5jZXMuCj4gCj4gU2lnbmVk
LW9mZi1ieTogS2FuZ2ppZSBMdSA8a2psdUB1bW4uZWR1Pgo+IENjOiBBZGl0eWEgUGFra2kgPHBh
a2tpMDAxQHVtbi5lZHU+Cj4gQ2M6IEZpbm4gVGhhaW4gPGZ0aGFpbkB0ZWxlZ3JhcGhpY3MuY29t
LmF1Pgo+IENjOiBSb2IgSGVycmluZyA8cm9iaEBrZXJuZWwub3JnPgo+IENjOiBHcmVnIEtyb2Fo
LUhhcnRtYW4gPGdyZWdraEBsaW51eGZvdW5kYXRpb24ub3JnPgo+IFtiLnpvbG5pZXJraWU6IG1p
bm9yIHBhdGNoIHN1bW1hcnkgZml4dXBdCj4gU2lnbmVkLW9mZi1ieTogQmFydGxvbWllaiBab2xu
aWVya2lld2ljeiA8Yi56b2xuaWVya2llQHNhbXN1bmcuY29tPgo+IFNpZ25lZC1vZmYtYnk6IFNh
c2hhIExldmluIDxzYXNoYWxAa2VybmVsLm9yZz4KPiAtLS0KPiAgZHJpdmVycy92aWRlby9mYmRl
di9pbXN0dGZiLmMgfCA1ICsrKysrCj4gIDEgZmlsZSBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKykK
CldoeSBvbmx5IDQuNC55PyAgU2hvdWxkbid0IHRoaXMgYmUgcXVldWVkIHVwIGZvciBldmVyeXRo
aW5nIG9yIG5vbmU/Cgp0aGFua3MsCgpncmVnIGstaApfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1h
bi9saXN0aW5mby9kcmktZGV2ZWw=
