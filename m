Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 39F1F1D7E53
	for <lists+dri-devel@lfdr.de>; Mon, 18 May 2020 18:23:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 792A76E430;
	Mon, 18 May 2020 16:23:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-x941.google.com (mail-ua1-x941.google.com
 [IPv6:2607:f8b0:4864:20::941])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 911E26E431
 for <dri-devel@lists.freedesktop.org>; Mon, 18 May 2020 16:23:34 +0000 (UTC)
Received: by mail-ua1-x941.google.com with SMTP id i89so753346uad.5
 for <dri-devel@lists.freedesktop.org>; Mon, 18 May 2020 09:23:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=k4vcnXjI8RyihlZWriXT7skpQdkFXM1bMLhUE8HEess=;
 b=YggyP6ySOLsDqRAsg/hIk2+pXlEaZoBG/IECpSLbpbov1qrK1RVJUDub83tR+dM2yh
 85oOElBR799cD8+ufFXLzcZ1qwO8XIBTOVQ/zlbVXl+IaloOIj+ppxbXqloZThC2nLYs
 hUxounYmhUIoKy8vbUvQw3nTiQKxTr6deCZWN2nRaJ7vUShOYpREfQ0+d0/1yV5t4xEM
 YZi9EBA0PGTUzKJ3ETEC4Ut1lcvyPHATgdRMb7Z2RemRR55YYUmVAe7Q4U03GG2XCRko
 A4FAlo75RtpjTSD141LqoAK/H67dpKG5MhZAOIdfflcNc0V29iGmA6sXS7EfrG2AnsrO
 dcag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=k4vcnXjI8RyihlZWriXT7skpQdkFXM1bMLhUE8HEess=;
 b=C8DrYG2ysyjoqv4i15iUFDo1GGOGVDIc/kMipfv1e4A+RpJ+yAtMIYYl8WTab1Y/uy
 4aWDkbU5aiNlxNTY5vP3t2b+VIqD8nWRjzkBFy2XKJ9F7HerhsUBd457jx0UmrNmcazw
 v8nRQ13xfo8N6b42qftbH4/CMmXAqSZIc2TZunM3JKt0nasqo6l8m7EGmd/JoqchBtnn
 aSsxMvNU0a952W5Otzo+nTmrgS/0LQNm7TT4fmPUCASaahr3HsqHIlJ4VRlK5lXS4qtR
 2YWdASD8AwuqfezijNcTVhPItlvHXjGcjZXRtA1iy1Qsjvwb66gR3SXs5vVcqG2OJaHx
 9z4w==
X-Gm-Message-State: AOAM530y15Cwqp8GmDR9D5f73nC0yTbM9vMjfAHdPmtBZj27FrTBy76M
 GdTjb+w9kUrDT4ZEigUfJgbh2ExZrx5R7dYLaDdo9dQ4
X-Google-Smtp-Source: ABdhPJxj/ILRWGg+g0p0f6Tiild3EVoJh/eWr4w3mq2rqaHi8Q81anneUGkROS4v7wGlzDuPcv3TyrxRtC+aJ+KPXng=
X-Received: by 2002:ab0:4e0d:: with SMTP id g13mr4414099uah.64.1589819013595; 
 Mon, 18 May 2020 09:23:33 -0700 (PDT)
MIME-Version: 1.0
References: <20200516212330.13633-1-chris@chris-wilson.co.uk>
 <20200516212330.13633-2-chris@chris-wilson.co.uk>
In-Reply-To: <20200516212330.13633-2-chris@chris-wilson.co.uk>
From: Emil Velikov <emil.l.velikov@gmail.com>
Date: Mon, 18 May 2020 17:23:21 +0100
Message-ID: <CACvgo535juMCoP3Lkg3L6UM8WYsYKP_pkAiO480Z8eouqnPhtA@mail.gmail.com>
Subject: Re: [PATCH 2/4] drm: Help unconfuse gcc, avoid accidental impossible
 unsigned comparisons
To: Chris Wilson <chris@chris-wilson.co.uk>
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

T24gU2F0LCAxNiBNYXkgMjAyMCBhdCAyMjoyMywgQ2hyaXMgV2lsc29uIDxjaHJpc0BjaHJpcy13
aWxzb24uY28udWs+IHdyb3RlOgo+Cj4gZHJpdmVycy9ncHUvZHJtL2RybV9jbGllbnRfbW9kZXNl
dC5jOiBJbiBmdW5jdGlvbiDigJhkcm1fY2xpZW50X2Zpcm13YXJlX2NvbmZpZ+KAmToKPiAuL2lu
Y2x1ZGUvbGludXgvYml0cy5oOjI2OjI4OiB3YXJuaW5nOiBjb21wYXJpc29uIG9mIHVuc2lnbmVk
IGV4cHJlc3Npb24gPCAwIGlzIGFsd2F5cyBmYWxzZSBbLVd0eXBlLWxpbWl0c10KPiAgICBfX2J1
aWx0aW5fY29uc3RhbnRfcCgobCkgPiAoaCkpLCAobCkgPiAoaCksIDApKSkKPgpIbW0gdGhpcyBz
ZWVtcyBsaWtlIGEgaGFjayBhcm91bmQgYSBtYWNybyBidWcuIEknbGwgc2VuZCBhIGZpeCBmb3Ig
dGhlCm1hY3JvIGluIGEgZmV3IG1pbnV0ZXMuCldpdGggdGhhdCB5b3UgZG9uJ3QgaGF2ZSB0byB0
aW5rZXIgdG8gbWFrZSBpdCB1bnNpZ25lZCwgYWx0aG91Z2ggY29uc3QKd2lsbCBiZSBhcHByZWNp
YXRlZC4KCi1FbWlsCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9y
ZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZl
bAo=
