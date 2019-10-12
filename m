Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A6DE6D5C26
	for <lists+dri-devel@lfdr.de>; Mon, 14 Oct 2019 09:18:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1FAF16E0E9;
	Mon, 14 Oct 2019 07:18:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd43.google.com (mail-io1-xd43.google.com
 [IPv6:2607:f8b0:4864:20::d43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 09B4C6E0AA
 for <dri-devel@lists.freedesktop.org>; Sat, 12 Oct 2019 19:22:30 +0000 (UTC)
Received: by mail-io1-xd43.google.com with SMTP id v2so28518732iob.10
 for <dri-devel@lists.freedesktop.org>; Sat, 12 Oct 2019 12:22:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=HQJU3/LoSPot9T+dJMRPqRv4aXw0MOIpjtfyaywm/aQ=;
 b=K7hS1FK1iL175G+o/xEHANdfcu15HD+XxJFE5gjgO+Mk76AzrcwsMfI2YtyCTSTvIY
 AkHbOgGsqHloiLchjTeePir3X3nS7jSkUaMyqoN7PZSi8B13peMObhNMBTF3Tm3ZcIbu
 Fo9lD5Zqk5kX/MWAMEdUEKW4NowZDq2ooMzS2ioAOgfRRjHpBRl/UJEm8jh17PH+vARw
 U0rd7Z0PWcoJRX7eh77iLN6CDoaRkwpYBaQoU7Rflpr+SVYCR49SdDcryPVpLekpYmKu
 dcgL4lQsrjHdFvHCHz/czGT0oEVQZlmXtlf//3lI7QzrSRBC2yIdQi23+EEkICwuryON
 dUfA==
X-Gm-Message-State: APjAAAWzuMyH/VWVulyQZ7XQBDSqMnmVPy0oTK/rcDi6zJwJnu6SDyHJ
 GFikEBpnKPJP2tDSV0o0MNSR1j+floIdQAgPdRA=
X-Google-Smtp-Source: APXvYqyJteMzDjNIWw8MOM6EkZMsiXv/drPcqPJn3dGo9FtbSnM6zKB7jm0eZ0l/nvmkFQFosHWse+jWfLyMEYAymH0=
X-Received: by 2002:a02:7b0d:: with SMTP id q13mr25703029jac.114.1570908149253; 
 Sat, 12 Oct 2019 12:22:29 -0700 (PDT)
MIME-Version: 1.0
References: <20191004190938.15353-1-navid.emamdoost@gmail.com>
 <027fde47-86b3-35c8-85e6-ea7c191e772c@web.de>
 <f90d7b4a-c4af-eac1-f326-211e932dbd22@web.de>
In-Reply-To: <f90d7b4a-c4af-eac1-f326-211e932dbd22@web.de>
From: Navid Emamdoost <navid.emamdoost@gmail.com>
Date: Sat, 12 Oct 2019 14:22:18 -0500
Message-ID: <CAEkB2EQUrHpfCXDQ9HV9_hw7Ke5DmX3SvKWJd+wSwXB1Uqaf5g@mail.gmail.com>
Subject: Re: [PATCH] drm/imx: fix memory leak in imx_pd_bind
To: Markus Elfring <Markus.Elfring@web.de>
X-Mailman-Approved-At: Mon, 14 Oct 2019 07:17:47 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=HQJU3/LoSPot9T+dJMRPqRv4aXw0MOIpjtfyaywm/aQ=;
 b=ctY1dTvKbUjja1n+HmJ/0QdJo4l9dAMkFi10eQfrFjsqgOWit80kgCnq30q0OeiWfa
 /aUwSbUbZJTKgMLaQRHrc735ma+8k8xg3+RuKcs08/Y27Bvp2HmB3VCXVh53JIpeepH1
 Ex6BkyIFuWyhgQ4hj3IvriacAVaZFw7DIOvS0t56h7sEO7TnQ2FbSzJDxvuUFfVYZfpm
 8i8ceDDgjqJO4QPLbUuA7rjn5ssg3y1AC1+0v+G8txow0cuyM+hhZA63VbZBlCaXGXA2
 Cp4ZiJNXwdEapBQhk8X9d8hv+/l895BVSFvmchGs1gyzKBV8A4NRrRo6EFq1qAYA7zW9
 Z1YA==
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
Cc: kernel-janitors@vger.kernel.org, David Airlie <airlied@linux.ie>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Kangjie Lu <kjlu@umn.edu>, LKML <linux-kernel@vger.kernel.org>,
 dri-devel@lists.freedesktop.org, Navid Emamdoost <emamd001@umn.edu>,
 NXP Linux Team <linux-imx@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Stephen McCamant <smccaman@umn.edu>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Tm8sIHRoYXQgaXMgbm90IGNvcnJlY3QhIFlvdSBzaG91bGQgbm90IHRyeSB0byBmcmVlIGlteHBk
IGhlcmUgYXMgaXQKaXMgYSByZXNvdXJjZS1tYW5hZ2VkIGFsbG9jYXRpb24gdmlhIGRldm1fa3ph
bGxvYygpLiBJdCBtZWFucyBtZW1vcnkKYWxsb2NhdGVkIHdpdGggdGhpcyBmdW5jdGlvbiBpcyBh
dXRvbWF0aWNhbGx5IGZyZWVkIG9uIGRyaXZlciBkZXRhY2guClNvLCB0aGlzIHBhdGNoIGludHJv
ZHVjZXMgYSBkb3VibGUtZnJlZS4KCk9uIFNhdCwgT2N0IDEyLCAyMDE5IGF0IDY6NTQgQU0gTWFy
a3VzIEVsZnJpbmcgPE1hcmt1cy5FbGZyaW5nQHdlYi5kZT4gd3JvdGU6Cj4KPiA+ICtmcmVlX2Vk
aWQ6Cj4gPiArICAgICBrZnJlZShpbXhwZC0+ZWRpZCk7Cj4gPiArICAgICByZXR1cm4gcmV0Owo+
Cj4gSSBoYXZlIHRha2VuIGFub3RoZXIgbG9vayBhdCB0aGlzIGNoYW5nZSBpZGVhLgo+IENhbiB0
aGUgZnVuY3Rpb24gY2FsbCDigJxkZXZtX2tmcmVlKGRldiwgaW14cGQp4oCdIGJlY29tZSByZWxl
dmFudAo+IGFsc28gYXQgdGhpcyBwbGFjZT8KPgo+IFdvdWxkIHlvdSBsaWtlIHRvIGNvbWJpbmUg
aXQgd2l0aCB0aGUgdXBkYXRlIHN1Z2dlc3Rpb24KPiDigJxGaXggZXJyb3IgaGFuZGxpbmcgZm9y
IGEga21lbWR1cCgpIGNhbGwgaW4gaW14X3BkX2JpbmQoKeKAnT8KPiBodHRwczovL2xvcmUua2Vy
bmVsLm9yZy9yLzNmZDZhYThiLTI1MjktN2ZmNS0zZTE5LTA1MjY3MTAxYjJhNEB3ZWIuZGUvCj4g
aHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvcGF0Y2h3b3JrL3BhdGNoLzExMzg5MTIvCj4gaHR0cHM6
Ly9sa21sLm9yZy9sa21sLzIwMTkvMTAvMTIvODcKPgo+IFJlZ2FyZHMsCj4gTWFya3VzCgoKCi0t
IApOYXZpZC4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
ZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0
dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
