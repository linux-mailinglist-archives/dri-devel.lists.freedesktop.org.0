Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 62A8C51DF7
	for <lists+dri-devel@lfdr.de>; Tue, 25 Jun 2019 00:10:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D1E8989E43;
	Mon, 24 Jun 2019 22:10:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [IPv6:2a00:1450:4864:20::12b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4030989E43
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jun 2019 22:10:08 +0000 (UTC)
Received: by mail-lf1-x12b.google.com with SMTP id p24so11150810lfo.6
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jun 2019 15:10:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=LhhVfDrREEcacsWd00iA0V8OqoBJ0apERHNi1TRB+H8=;
 b=sVrmmYS80BN2dkD1H2wmIjuSi7L3wKJUl0Z7LFWKaCXRPhbXDhOxyrMRemFdAxyvib
 /RxTsCGUdzsDrin2pEHIDYzwXrHU1lYIdsMvvvLRGqUqxr7tLRPywu8+vLVgmi5Va8ZP
 fIaDy5aajmayzyCQ0Q6wXPTQzk/HdtSEKFxfdcOjL2djkFm9N7ZKCueCCo9pWYLzn4yc
 0FzobqS3fi3B77gOSA3sIuw2t7xZE0OFWjW69x8sz/Kmu4T8KNPkG2IrHuoL1wkyjuZ+
 I1RMQMhUolDiuMQ4xAMNMjqHWTao5wkDgFLQkvJwF5Wlzaa1F29YCOXnK+Xptyx6Nx0P
 COhA==
X-Gm-Message-State: APjAAAUiQnnc+vFmfYGivp2Baj3Dyp+GOd5U52ylynh64Z6RxQPJg33F
 Da31IP88tHZKEIMaS30djcVFFcrowWZxV6H+Jm9yyw==
X-Google-Smtp-Source: APXvYqz4dqDdE3pjelAIpYdIaYEdUSugt+9zZub+F0V4ojuGDgBUOyuytfX/lFlgPEn4rpFBFxQuxclqI0gOjSHiHIs=
X-Received: by 2002:a19:6a01:: with SMTP id u1mr12069797lfu.141.1561414206681; 
 Mon, 24 Jun 2019 15:10:06 -0700 (PDT)
MIME-Version: 1.0
References: <20190618115245.13915-1-linus.walleij@linaro.org>
 <20190618123045.GF18776@kadam>
In-Reply-To: <20190618123045.GF18776@kadam>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 25 Jun 2019 00:09:54 +0200
Message-ID: <CACRpkdaqKzF=WaRiDPi6XmV_=30=A2rigWLSjuFw=PdG=cG4OQ@mail.gmail.com>
Subject: Re: [PATCH v2] drm/mcde: Fix uninitialized variable
To: Dan Carpenter <dan.carpenter@oracle.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=LhhVfDrREEcacsWd00iA0V8OqoBJ0apERHNi1TRB+H8=;
 b=QjydLotuGa2xqLBEYC2ul9ZabrvYGkmSEZ0uOU5ogMvoT5cJMzOTACp3uLvLxoyoiC
 WULj99w498hOFtQdyXio34y7xVPevRq7rAOqYS8fLDV843KofgnNpN92jeDaV/mlWTYX
 ZpRQgrGJKkHOBBej6IOtDj1wdB4wlKXtNDsoCULJfnrYGDBVUGoSUrbyihM/uXQKKd5s
 09g5CLmd8iy2/MkdMv889ppOzOY1f3SZrvqpEVYU9jhXxzwc+MuhVtnPWvgTxhL6C1zJ
 Sh+kDlUIknVTBjQwr2csdt8PFwKbaGuicp2qKE7vRS4Igiv+46f7f2qxrhWRDA4GHDa4
 LqHw==
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
Cc: Maxime Ripard <maxime.ripard@bootlin.com>, Sean Paul <sean@poorly.run>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBKdW4gMTgsIDIwMTkgYXQgMjozMSBQTSBEYW4gQ2FycGVudGVyIDxkYW4uY2FycGVu
dGVyQG9yYWNsZS5jb20+IHdyb3RlOgoKPiBUaGFua3MhCgpSZWNvcmRpbmcgdGhpcyBhcyBBY2tl
ZC1ieTogd2hlbiBhcHBseWluZy4KCllvdXJzLApMaW51cyBXYWxsZWlqCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QK
ZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
