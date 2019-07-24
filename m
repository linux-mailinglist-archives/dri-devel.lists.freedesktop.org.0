Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 04EE87377D
	for <lists+dri-devel@lfdr.de>; Wed, 24 Jul 2019 21:10:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 78BFD6E62D;
	Wed, 24 Jul 2019 19:10:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
 [209.85.221.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0DC846E62D
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Jul 2019 19:10:11 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id x1so33146870wrr.9
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Jul 2019 12:10:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=HSdo9ZmudjoY5QfVd80yVoDhymQ27WsVZ3uLmAFSang=;
 b=JYJYQF0Vh+DrSeFOn4VMiWgScFoihSJoFIRJVc/Qu/GxzGyBdRRbGGVIHJbdDnRlDS
 A9F6f8Et7HVPfyE/lVAlHGaQZz4NQRnNlYiCBerPs2DVUXKN7b5pT5vad4cQVVdjVt9x
 yr5uc72UevINVWY+AScFWudbvARyw3y4fPItuwdnB2JmxUOxxw9UlwH3Fa9JvMtUSqRS
 FexgGGgJ36WWkMjIt45Sita1FTRR4PTX+ZZ8fljsSUjsUUIkt5xGQ5WFGeRGqD9NrNqw
 wNLvon6kpjHsAoue9n8XfYv3NpL3tKaC4CSJQn+ll/sNQ3oQhHv5BydImAC7ZTkzJTuV
 GvZQ==
X-Gm-Message-State: APjAAAWoyreaiL8YcrKJsM3wNJS0lI/Sdou9WiWzAheh9KdTgGbFpvpZ
 WcSvdMcAp4IU9kNgaD0BZOE=
X-Google-Smtp-Source: APXvYqyWQBOON9MCwlXaZ8Eic8a5Grk22K3A0wrcZg+IPuNCk48LkzoWpj7xmqjgI5qwVDbGSZBdAQ==
X-Received: by 2002:a5d:4d81:: with SMTP id b1mr6533715wru.27.1563995409586;
 Wed, 24 Jul 2019 12:10:09 -0700 (PDT)
Received: from kozik-lap ([194.230.155.239])
 by smtp.googlemail.com with ESMTPSA id v4sm44882540wmg.22.2019.07.24.12.10.08
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 24 Jul 2019 12:10:08 -0700 (PDT)
Date: Wed, 24 Jul 2019 21:10:06 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Artur =?utf-8?B?xZp3aWdvxYQ=?= <a.swigon@partner.samsung.com>
Subject: Re: [RFC PATCH 03/11] devfreq: exynos-bus: Change goto-based logic
 to if-else logic
Message-ID: <20190724191006.GF14346@kozik-lap>
References: <20190723122016.30279-1-a.swigon@partner.samsung.com>
 <CGME20190723122024eucas1p1ff060d072132bfbc8a8a1d10fa1f90f8@eucas1p1.samsung.com>
 <20190723122016.30279-4-a.swigon@partner.samsung.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190723122016.30279-4-a.swigon@partner.samsung.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
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
Cc: devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 linux-pm@vger.kernel.org, sw0312.kim@samsung.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, cw00.choi@samsung.com,
 myungjoo.ham@samsung.com, georgi.djakov@linaro.org,
 linux-arm-kernel@lists.infradead.org, m.szyprowski@samsung.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBKdWwgMjMsIDIwMTkgYXQgMDI6MjA6MDhQTSArMDIwMCwgQXJ0dXIgxZp3aWdvxYQg
d3JvdGU6Cj4gVGhpcyBwYXRjaCBpbXByb3ZlcyBjb2RlIHJlYWRhYmlsaXR5IGJ5IGNoYW5naW5n
IHRoZSBmb2xsb3dpbmcgY29uc3RydWN0Ogo+IAo+ID4gICAgaWYgKGNvbmQpCj4gPiAgICAgICAg
Z290byBwYXNzaXZlOwo+ID4gICAgZm9vKCk7Cj4gPiAgICBnb3RvIG91dDsKPiA+cGFzc2l2ZToK
PiA+ICAgIGJhcigpOwo+ID5vdXQ6Cj4gCj4gaW50byB0aGlzOgo+IAo+ID4gICAgaWYgKGNvbmQp
Cj4gPiAgICAgICAgYmFyKCk7Cj4gPiAgICBlbHNlCj4gPiAgICAgICAgZm9vKCk7Cj4gCj4gU2ln
bmVkLW9mZi1ieTogQXJ0dXIgxZp3aWdvxYQgPGEuc3dpZ29uQHBhcnRuZXIuc2Ftc3VuZy5jb20+
Cj4gLS0tCj4gIGRyaXZlcnMvZGV2ZnJlcS9leHlub3MtYnVzLmMgfCAyNCArKysrKysrKystLS0t
LS0tLS0tLS0tLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDkgaW5zZXJ0aW9ucygrKSwgMTUgZGVsZXRp
b25zKC0pCgpDb2RlIGxvb2tzIG11Y2ggYmV0dGVyOgpSZXZpZXdlZC1ieTogS3J6eXN6dG9mIEtv
emxvd3NraSA8a3J6a0BrZXJuZWwub3JnPgoKQmVzdCByZWdhcmRzLApLcnp5c3p0b2YKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxp
bmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
