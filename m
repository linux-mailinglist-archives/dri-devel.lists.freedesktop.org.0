Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 824E4195D0
	for <lists+dri-devel@lfdr.de>; Fri, 10 May 2019 01:52:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 29F2789CCE;
	Thu,  9 May 2019 23:52:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2840A89C2A
 for <dri-devel@lists.freedesktop.org>; Thu,  9 May 2019 20:19:27 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id o189so4836768wmb.1
 for <dri-devel@lists.freedesktop.org>; Thu, 09 May 2019 13:19:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=GJZ5Q6jA4O7aJU9I1R7Mdcv4Tb9to2ZldjQmNYgzvPA=;
 b=To7/nsu89pTWVw5bxMyauOHS2MNQXZNMpmUr88i4TFszorqBwtEwW4ckTzRuwl773K
 HxSQXcwFrqXH0E60BEVKnunjQW84kaQc3aQr12jfYkqroydE+hU4CVB4F1p3rAq9kBKd
 Uz8wfFUSzRT0SYif6dh9QkHx2ImkxTPr2RjLFETqTaex+a2naQVsjP4EvwJjTwLwo6V9
 wZGVpdRyDwRzCSXlE7GsrN50QEmvEwwavW3Gft8spo115A1tx6IXo9Lxj4DkvcLyhueD
 AN2HoRVnEtoFhem23I4V8YsR4vQyWyznU2h1GrAkQ/f5mQ9Wk6apoED7UCgHKNrYSkuS
 HHsQ==
X-Gm-Message-State: APjAAAXIN18h4MTjzRpHooP4A0zm7zjF+DHMtnz7PDXV4215ALj7cjkG
 ov4EY29wwgCvyWbKcUARq6ypJg==
X-Google-Smtp-Source: APXvYqzxxHBFuaNUV6bBo6nlGo/Tnntlk9agUnyauDkHld2lgHrK9FItg2MrJoRjimGw6vVaZIhwAg==
X-Received: by 2002:a1c:cb48:: with SMTP id b69mr4393573wmg.109.1557433165640; 
 Thu, 09 May 2019 13:19:25 -0700 (PDT)
Received: from andrea ([91.252.228.170])
 by smtp.gmail.com with ESMTPSA id z74sm9649240wmc.2.2019.05.09.13.19.23
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 09 May 2019 13:19:24 -0700 (PDT)
Date: Thu, 9 May 2019 22:19:15 +0200
From: Andrea Parri <andrea.parri@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/5] drm/msm: Fix improper uses of
 smp_mb__{before,after}_atomic()
Message-ID: <20190509201915.GA2931@andrea>
References: <1556568902-12464-1-git-send-email-andrea.parri@amarulasolutions.com>
 <1556568902-12464-2-git-send-email-andrea.parri@amarulasolutions.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1556568902-12464-2-git-send-email-andrea.parri@amarulasolutions.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Mailman-Approved-At: Thu, 09 May 2019 23:52:27 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=GJZ5Q6jA4O7aJU9I1R7Mdcv4Tb9to2ZldjQmNYgzvPA=;
 b=IO+KoQF0XExQgYMUQurYWk908PrOrvDWgPkKvUFydb54+mGRvonFr1iT+FubWy3OBA
 QpyEdwU8/OJ4+G9+lxN1J9UzAAXIDbt6s41pTK12AlT2em+Ibb/YaLYfaKzygpMPJPJC
 P3ICeH3z4JYLoMXM7xdSW1PhUn+yUn4epbKK8=
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
Cc: freedreno@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Peter Zijlstra <peterz@infradead.org>,
 "Paul E. McKenney" <paulmck@linux.ibm.com>, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBBcHIgMjksIDIwMTkgYXQgMTA6MTQ6NTdQTSArMDIwMCwgQW5kcmVhIFBhcnJpIHdy
b3RlOgo+IFRoZXNlIGJhcnJpZXJzIG9ubHkgYXBwbHkgdG8gdGhlIHJlYWQtbW9kaWZ5LXdyaXRl
IG9wZXJhdGlvbnM7IGluCj4gcGFydGljdWxhciwgdGhleSBkbyBub3QgYXBwbHkgdG8gdGhlIGF0
b21pY19zZXQoKSBwcmltaXRpdmUuCj4gCj4gUmVwbGFjZSB0aGUgYmFycmllcnMgd2l0aCBzbXBf
bWIoKXMuCj4gCj4gRml4ZXM6IGIxZmMyODM5ZDJmOTIgKCJkcm0vbXNtOiBJbXBsZW1lbnQgcHJl
ZW1wdGlvbiBmb3IgQTVYWCB0YXJnZXRzIikKPiBDYzogc3RhYmxlQHZnZXIua2VybmVsLm9yZwo+
IFJlcG9ydGVkLWJ5OiAiUGF1bCBFLiBNY0tlbm5leSIgPHBhdWxtY2tAbGludXguaWJtLmNvbT4K
PiBSZXBvcnRlZC1ieTogUGV0ZXIgWmlqbHN0cmEgPHBldGVyekBpbmZyYWRlYWQub3JnPgo+IFNp
Z25lZC1vZmYtYnk6IEFuZHJlYSBQYXJyaSA8YW5kcmVhLnBhcnJpQGFtYXJ1bGFzb2x1dGlvbnMu
Y29tPgo+IENjOiBSb2IgQ2xhcmsgPHJvYmRjbGFya0BnbWFpbC5jb20+Cj4gQ2M6IFNlYW4gUGF1
bCA8c2VhbkBwb29ybHkucnVuPgo+IENjOiBEYXZpZCBBaXJsaWUgPGFpcmxpZWRAbGludXguaWU+
Cj4gQ2M6IERhbmllbCBWZXR0ZXIgPGRhbmllbEBmZndsbC5jaD4KPiBDYzogSm9yZGFuIENyb3Vz
ZSA8amNyb3VzZUBjb2RlYXVyb3JhLm9yZz4KPiBDYzogbGludXgtYXJtLW1zbUB2Z2VyLmtlcm5l
bC5vcmcKPiBDYzogZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+IENjOiBmcmVlZHJl
bm9AbGlzdHMuZnJlZWRlc2t0b3Aub3JnCgpSb2IsIFNlYW4sIEpvcmRhbjogYW55IHN1Z2dlc3Rp
b25zIHRvIG1vdmUgdGhpcyBwYXRjaCBmb3J3YXJkPwoKVGhhbngsCiAgQW5kcmVhCgoKPiAtLS0K
PiAgZHJpdmVycy9ncHUvZHJtL21zbS9hZHJlbm8vYTV4eF9wcmVlbXB0LmMgfCA0ICsrLS0KPiAg
MSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKPiAKPiBkaWZm
IC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL21zbS9hZHJlbm8vYTV4eF9wcmVlbXB0LmMgYi9kcml2
ZXJzL2dwdS9kcm0vbXNtL2FkcmVuby9hNXh4X3ByZWVtcHQuYwo+IGluZGV4IDNkNjIzMTBhNTM1
ZmIuLmVlMDgyMGVlMGM2NjQgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL21zbS9hZHJl
bm8vYTV4eF9wcmVlbXB0LmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vbXNtL2FkcmVuby9hNXh4
X3ByZWVtcHQuYwo+IEBAIC0zOSwxMCArMzksMTAgQEAgc3RhdGljIGlubGluZSB2b2lkIHNldF9w
cmVlbXB0X3N0YXRlKHN0cnVjdCBhNXh4X2dwdSAqZ3B1LAo+ICAJICogcHJlZW1wdGlvbiBvciBp
biB0aGUgaW50ZXJydXB0IGhhbmRsZXIgc28gYmFycmllcnMgYXJlIG5lZWRlZAo+ICAJICogYmVm
b3JlLi4uCj4gIAkgKi8KPiAtCXNtcF9tYl9fYmVmb3JlX2F0b21pYygpOwo+ICsJc21wX21iKCk7
Cj4gIAlhdG9taWNfc2V0KCZncHUtPnByZWVtcHRfc3RhdGUsIG5ldyk7Cj4gIAkvKiAuLi4gYW5k
IGFmdGVyKi8KPiAtCXNtcF9tYl9fYWZ0ZXJfYXRvbWljKCk7Cj4gKwlzbXBfbWIoKTsKPiAgfQo+
ICAKPiAgLyogV3JpdGUgdGhlIG1vc3QgcmVjZW50IHdwdHIgZm9yIHRoZSBnaXZlbiByaW5nIGlu
dG8gdGhlIGhhcmR3YXJlICovCj4gLS0gCj4gMi43LjQKPiAKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2
ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21h
aWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
