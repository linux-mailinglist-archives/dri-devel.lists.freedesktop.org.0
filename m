Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A4F6D94B02
	for <lists+dri-devel@lfdr.de>; Mon, 19 Aug 2019 18:57:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D22F6E22D;
	Mon, 19 Aug 2019 16:57:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E57816E22D
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Aug 2019 16:57:06 +0000 (UTC)
Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com
 [209.85.222.181])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 5BD1222CE9
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Aug 2019 16:57:06 +0000 (UTC)
Received: by mail-qk1-f181.google.com with SMTP id m2so1985180qki.12
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Aug 2019 09:57:06 -0700 (PDT)
X-Gm-Message-State: APjAAAVjPb3k8jXmGBtHLNN/LsNNcxo8CgCvPbIbtRG6lEgJxTRcJGpz
 ALYQdTzyq/tlmhN3b4Qrb64HCiY7I/BCCloyNA==
X-Google-Smtp-Source: APXvYqwyhVlHcIl2LSHoMRx34pbpzeBY+xCk/huOncGRal9Z7YkSOH9Kh4xBNYxtoK3PB7VAUcXiqzLAuT5UcSFiTx8=
X-Received: by 2002:a37:a48e:: with SMTP id
 n136mr22456622qke.223.1566233825565; 
 Mon, 19 Aug 2019 09:57:05 -0700 (PDT)
MIME-Version: 1.0
References: <20190814044814.102294-1-weiyongjun1@huawei.com>
In-Reply-To: <20190814044814.102294-1-weiyongjun1@huawei.com>
From: Rob Herring <robh@kernel.org>
Date: Mon, 19 Aug 2019 11:56:53 -0500
X-Gmail-Original-Message-ID: <CAL_JsqJA5kZo5_uJPJdgdPyLL5FwBDjcV9EWzPotef2=LrSNHQ@mail.gmail.com>
Message-ID: <CAL_JsqJA5kZo5_uJPJdgdPyLL5FwBDjcV9EWzPotef2=LrSNHQ@mail.gmail.com>
Subject: Re: [PATCH -next] drm/panfrost: Fix missing unlock on error in
 panfrost_mmu_map_fault_addr()
To: Wei Yongjun <weiyongjun1@huawei.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1566233826;
 bh=J9Qn/aVNhFBb93Jqnzfg6I63rHYdO74sYQm4uyr9my0=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=aQsWow5e9kjAe5ypPL1Rm+4zrlD7JRZi9a2g8a2c3/W81hO6g0OYrWr0i1RhdsQ2t
 QFlzS8V5cXL8XRC4P3byVp31RfrFy9Xyvypk/14/hPyanl94SayeU3PjN8I4FNbv1T
 uFPK6bh29Vj6Kt1H0sJUac39L+wmG+zwM6hu18Ac=
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
Cc: Tomeu Vizoso <tomeu.vizoso@collabora.com>, David Airlie <airlied@linux.ie>,
 kernel-janitors@vger.kernel.org,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBBdWcgMTMsIDIwMTkgYXQgMTE6NDQgUE0gV2VpIFlvbmdqdW4gPHdlaXlvbmdqdW4x
QGh1YXdlaS5jb20+IHdyb3RlOgo+Cj4gQWRkIHRoZSBtaXNzaW5nIHVubG9jayBiZWZvcmUgcmV0
dXJuIGZyb20gZnVuY3Rpb24gcGFuZnJvc3RfbW11X21hcF9mYXVsdF9hZGRyKCkKPiBpbiB0aGUg
ZXJyb3IgaGFuZGxpbmcgY2FzZS4KPgo+IEZpeGVzOiAxODdkMjkyOTIwNmUgKCJkcm0vcGFuZnJv
c3Q6IEFkZCBzdXBwb3J0IGZvciBHUFUgaGVhcCBhbGxvY2F0aW9ucyIpCj4gU2lnbmVkLW9mZi1i
eTogV2VpIFlvbmdqdW4gPHdlaXlvbmdqdW4xQGh1YXdlaS5jb20+Cj4gLS0tCj4gIGRyaXZlcnMv
Z3B1L2RybS9wYW5mcm9zdC9wYW5mcm9zdF9tbXUuYyB8IDUgKysrKy0KPiAgMSBmaWxlIGNoYW5n
ZWQsIDQgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQoKQXBwbGllZCwgdGhhbmtzLgoKUm9i
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZl
bCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xp
c3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
