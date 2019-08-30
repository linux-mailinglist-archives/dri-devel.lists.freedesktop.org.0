Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CA2FA3BE5
	for <lists+dri-devel@lfdr.de>; Fri, 30 Aug 2019 18:24:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D5C6892CD;
	Fri, 30 Aug 2019 16:24:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd43.google.com (mail-io1-xd43.google.com
 [IPv6:2607:f8b0:4864:20::d43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 85F87892CD
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Aug 2019 16:24:49 +0000 (UTC)
Received: by mail-io1-xd43.google.com with SMTP id b10so15247236ioj.2
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Aug 2019 09:24:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=RHySHF2uwEhmKQaEHe0OPL8GmZZ5+dREwVbeFYlqd3c=;
 b=mwzZ9Kl6WXaLOA7FKvL0Q7s81+A6Gn3juk4SNQKF71ycdPhpXID93yKx9F6IyjteyV
 9TceuvuzZ7hd80N/6btevI+5eCzF1JQtCSOjc/EShSyW7tY701zEmSeu12GFi4NnpleI
 mgOx/WelBR8r9T2iqn2qMw30xk53ytPvhg4Q3jFIHRBMK76P1l5bD1YO/aLQWxKXejB/
 +rYfqa4Yl3d6QrWNiCB+IP5m9H7mON7TVJqpCZM+wVfdUKSXpJgaXIsWcnuj0UnDU5ZP
 AVX3C3Rcth2mznULpMhwbyjiCqtIz+piFfZaYCxTQttyoLzK5ZGOKdN3kxau4nQOVeXd
 zJVg==
X-Gm-Message-State: APjAAAXiQ9DwAXC4Z39SRmCujIs2FflYyDiRd3W4G/s1oM0NDLtRuqkb
 O3Ym3TCUsfe08jTIpbUtO0A9OPXZH0hD25MsIjo=
X-Google-Smtp-Source: APXvYqwdBntb7kZCrsB+QQ9/2O7jjxtojMf474NZbsTPQdQ/YH+u5yW+U8plZem5ml3b+bETz1LpbVWveMMm96zRFJg=
X-Received: by 2002:a5d:96cb:: with SMTP id r11mr19355270iol.200.1567182288772; 
 Fri, 30 Aug 2019 09:24:48 -0700 (PDT)
MIME-Version: 1.0
References: <20190829212417.257397-1-davidriley@chromium.org>
 <20190830060857.tzrzgoi2hrmchdi5@sirius.home.kraxel.org>
 <CAASgrz2v0DYb_5A3MnaWFM4Csx1DKkZe546v7DG7R+UyLOA8og@mail.gmail.com>
 <20190830111605.twzssycagmjhfa45@sirius.home.kraxel.org>
In-Reply-To: <20190830111605.twzssycagmjhfa45@sirius.home.kraxel.org>
From: Chia-I Wu <olvaffe@gmail.com>
Date: Fri, 30 Aug 2019 09:24:37 -0700
Message-ID: <CAPaKu7QeYDqek7pBSHmg1E5A9h9E=njrvLxBMnkCtqeb3s77Cg@mail.gmail.com>
Subject: Re: [PATCH] drm/virtio: Use vmalloc for command buffer allocations.
To: Gerd Hoffmann <kraxel@redhat.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=RHySHF2uwEhmKQaEHe0OPL8GmZZ5+dREwVbeFYlqd3c=;
 b=dwn0RWHZ+Um+l/0l8KxAVtK9/XCUY5drIfMskunEhTk7upC2I0w2tmibG77Ds/21/4
 JJoGM8HWSM3DCAtH8AYBZ/LmZvoJJq0x1jKREkrFnk7jfkKC2BJRP3GFMnR6ic9Jffd0
 sVC0h7v9o6ui5kdqEwP0wwyIEkuJIVTh0SNgDPCZEdEajFrRJZ4SXg8ivCSGaTHeVhYn
 wm3/6YbtHhrI9Gq5JRL9k0wJZSUi7JTiSLGn5xb+NLTOkKT9BS73IUko0kK/Fd71nOj1
 joRjzfXCPtV8W9B/esh4Ea2p3xu9AEEt2gvLMkGyYH6BCRhnEKilZRSt3SHab1J21YR3
 8ihA==
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
Cc: David Airlie <airlied@linux.ie>, open list <linux-kernel@vger.kernel.org>,
 ML dri-devel <dri-devel@lists.freedesktop.org>,
 Gurchetan Singh <gurchetansingh@chromium.org>,
 =?UTF-8?Q?St=C3=A9phane_Marchesin?= <marcheu@chromium.org>,
 "open list:VIRTIO CORE,
 NET AND BLOCK DRIVERS" <virtualization@lists.linux-foundation.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBBdWcgMzAsIDIwMTkgYXQgNDoxNiBBTSBHZXJkIEhvZmZtYW5uIDxrcmF4ZWxAcmVk
aGF0LmNvbT4gd3JvdGU6Cj4KPiAgIEhpLAo+Cj4gPiA+ID4gLSAgICAga2ZyZWUodmJ1Zi0+ZGF0
YV9idWYpOwo+ID4gPiA+ICsgICAgIGt2ZnJlZSh2YnVmLT5kYXRhX2J1Zik7Cj4gPiA+Cj4gPiA+
IGlmIChpc192bWFsbG9jX2FkZHIodmJ1Zi0+ZGF0YV9idWYpKSAuLi4KPiA+ID4KPiA+ID4gbmVl
ZGVkIGhlcmUgSSBndWVzPwo+ID4gPgo+ID4KPiA+IGt2ZnJlZSgpIGhhbmRsZXMgdm1hbGxvYy9r
bWFsbG9jL2t2bWFsbG9jIGludGVybmFsbHkgYnkgZG9pbmcgdGhhdCBjaGVjay4KPgo+IE9rLgo+
Cj4gPiAtIHZpZGVvYnVmX3ZtYWxsb2NfdG9fc2cgaW4gZHJpdmVycy9tZWRpYS92NGwyLWNvcmUv
dmlkZW9idWYtZG1hLXNnLmMsCj4gPiBhc3N1bWVzIGNvbnRpZ3VvdXMgYXJyYXkgb2Ygc2NhdHRl
cmxpc3QgYW5kIHRoYXQgdGhlIGJ1ZmZlciBiZWluZyBjb252ZXJ0ZWQKPiA+IGlzIHBhZ2UgYWxp
Z25lZAo+Cj4gV2VsbCwgdm1hbGxvYyBtZW1vcnkgX2lzXyBwYWdlIGFsaWduZWQuCj4KPiBzZ19h
bGxvY190YWJsZV9mcm9tX3BhZ2VzKCkgZG9lcyBhbG90IG9mIHdoYXQgeW91IG5lZWQsIHlvdSBq
dXN0IG5lZWQgYQo+IHNtYWxsIGxvb3AgYXJvdW5kIHZtYWxsb2NfdG9fcGFnZSgpIGNyZWF0ZSBh
IHN0cnVjdCBwYWdlIGFycmF5Cj4gYmVmb3JlaGFuZC4KPgo+IENvbXBsZXRlbHkgZGlmZmVyZW50
IGFwcHJvYWNoOiB1c2UgZ2V0X3VzZXJfcGFnZXMoKSBhbmQgZG9uJ3QgY29weSB0aGUKPiBleGVj
YnVmZmVyIGF0IGFsbC4KSXQgd291bGQgYmUgcmVhbGx5IG5pY2UgaWYgZXhlY2J1ZmZlciBkb2Vz
IG5vdCBjb3B5LgoKVGhlIHVzZXIgc3BhY2Ugb3ducyB0aGUgYnVmZmVyIGFuZCBtYXkgb3Zlcndy
aXRlIHRoZSBjb250ZW50cwppbW1lZGlhdGVseSBhZnRlciB0aGUgaW9jdGwuICBXZSBhbHNvIG5l
ZWQgYSBmbGFnIHRvIGluZGljYXRlIHRoYXQgdGhlCm93bmVyc2hpcCBvZiB0aGUgYnVmZmVyIGlz
IHRyYW5zZmVycmVkIHRvIHRoZSBrZXJuZWwuCgoKCgo+Cj4gY2hlZXJzLAo+ICAgR2VyZAo+Cj4g
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiBkcmktZGV2
ZWwgbWFpbGluZyBsaXN0Cj4gZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+IGh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWls
aW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
