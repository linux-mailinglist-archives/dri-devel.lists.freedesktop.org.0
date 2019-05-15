Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 35DAA1FA0E
	for <lists+dri-devel@lfdr.de>; Wed, 15 May 2019 20:36:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E60958914F;
	Wed, 15 May 2019 18:36:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-x941.google.com (mail-ua1-x941.google.com
 [IPv6:2607:f8b0:4864:20::941])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 31A7B89152
 for <dri-devel@lists.freedesktop.org>; Wed, 15 May 2019 18:36:49 +0000 (UTC)
Received: by mail-ua1-x941.google.com with SMTP id s30so241017uas.8
 for <dri-devel@lists.freedesktop.org>; Wed, 15 May 2019 11:36:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=3xAR9pN5InwiER09ljeYKEHWdfzCaHDHyTua6zX9tIs=;
 b=j1VIesUUAPYs+JNpjtqrm1dePOEOz8xKaE2uvSCDlZLjR3uyb2U/NGQnoFdlh1JBnN
 JjHUzL3ObZ8wYOTWz/T/5w6w6wS7RQmcNy3ciEGft7JBSnk1b92CX5nAYKmkpFeTMife
 duoqhaT8fuuTfAquudrHR5hkZrU58ImVL98BQL+g34kY8y9F6GKqTxTZBM9W9s4JxcBB
 LUtR15XmXRsO6HaomwPgFRXAGqm1pLQgLG/l1CoQAkqDrVf9zL/jITMzqKH9Bd1rAFKt
 /vCosNw+RP4z8bTkp/7PxwhnDoJty9K4ZXlTl0+Oc+KqVb73i9StjHu9WJP675mclRdh
 u29A==
X-Gm-Message-State: APjAAAUNCwg0WjbzYjhDt7bkBXJuMeDMqykB0Puc38ZKABqeWSFlgxFi
 1rvuRWqvdaRXbEAWRnbDTjiPERwIF9k=
X-Google-Smtp-Source: APXvYqxWd0g9upEdEpGRYaRsrKIlsGm9uw2UEo4wZlUwhrMQ+0YoQNII6EceAh6kAcFV52P3CJEHNg==
X-Received: by 2002:ab0:688b:: with SMTP id t11mr20645223uar.70.1557945407993; 
 Wed, 15 May 2019 11:36:47 -0700 (PDT)
Received: from mail-vs1-f51.google.com (mail-vs1-f51.google.com.
 [209.85.217.51])
 by smtp.gmail.com with ESMTPSA id w136sm2103562vkw.18.2019.05.15.11.36.46
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
 Wed, 15 May 2019 11:36:46 -0700 (PDT)
Received: by mail-vs1-f51.google.com with SMTP id o5so602546vsq.4
 for <dri-devel@lists.freedesktop.org>; Wed, 15 May 2019 11:36:46 -0700 (PDT)
X-Received: by 2002:a67:dd8e:: with SMTP id i14mr14360313vsk.149.1557945406002; 
 Wed, 15 May 2019 11:36:46 -0700 (PDT)
MIME-Version: 1.0
References: <20190502225336.206885-1-dianders@chromium.org>
 <20190502225336.206885-2-dianders@chromium.org>
 <20190515182038.GV17077@art_vandelay>
In-Reply-To: <20190515182038.GV17077@art_vandelay>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 15 May 2019 11:36:33 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WP-rFDAR28oZg+9DcrXbaYPjFCAD-dV1VR3-3_XDs-3A@mail.gmail.com>
Message-ID: <CAD=FV=WP-rFDAR28oZg+9DcrXbaYPjFCAD-dV1VR3-3_XDs-3A@mail.gmail.com>
Subject: Re: [PATCH 2/5] drm/bridge/synopsys: dw-hdmi: Add "unwedge" for ddc
 bus
To: Sean Paul <sean@poorly.run>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=3xAR9pN5InwiER09ljeYKEHWdfzCaHDHyTua6zX9tIs=;
 b=E9vPofboNKcy0FTkvpv3g/b9WDCcxyg+n3xLdnsOiOs2BDOldqtgH7ArPscDExXX0n
 GrzaTXoe/AzxIS0mIgOsDEk7BkbsJL2kuG0lJaj7BHIjjo2Zun1ez1IN4k8qlwFeoNqA
 k8fVPBfuKl9HBnvUOH+lzUb1Yjr12oKGw78uM=
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 Jernej Skrabec <jernej.skrabec@siol.net>,
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Sean Paul <seanpaul@chromium.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>,
 Matthias Kaehlcke <mka@chromium.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGksCgpPbiBXZWQsIE1heSAxNSwgMjAxOSBhdCAxMToyMCBBTSBTZWFuIFBhdWwgPHNlYW5AcG9v
cmx5LnJ1bj4gd3JvdGU6Cgo+ID4gKyAgICAgICAgICAgICAgICAgICAgIGlmIChJU19FUlIoaGRt
aS0+ZGVmYXVsdF9zdGF0ZSkgJiYKPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgIUlTX0VS
UihoZG1pLT51bndlZGdlX3N0YXRlKSkgewo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgZGV2X3dhcm4oZGV2LAo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIlVud2VkZ2UgcmVxdWlyZXMgZGVmYXVsdCBwaW5jdHJsXG4iKTsKPgo+IENhbiB5b3UgZG93
bmdyYWRlIHRoaXMgbWVzc2FnZSB0byBpbmZvIG9yIGRiZz8gR2l2ZW4gaG93IHJhcmUgdGhpcyBp
c3N1ZSBpcywgd2UKPiBwcm9iYWJseSBkb24ndCB3YW50IHRvIHNwYW0gZXZlcnlvbmUgd2hvIGlz
IGhhcHBpbHkgdXNpbmcgZHctaGRtaS4KCkkgZG9uJ3QgdGhpbmsgaXQgd2lsbCBzcGFtIGFueW9u
ZSwgd2lsbCBpdD8gIEl0IHdpbGwgb25seSBzcGFtIGlmIHlvdQpfZG9fIHNwZWNpZnkgYW4gdW53
ZWRnZSBzdGF0ZSBhbmQgeW91IF9kb24ndF8gc3BlY2lmeSBhIGRlZmF1bHQgc3RhdGUuClRoaXMg
c2VlbXMgbGlrZSBzb21ldGhpbmcgeW91J2Qgd2FudCBhIHByZXR0eSBzZXJpb3VzIHdhcm5pbmcg
YWJvdXQKYmVjYXVzZSBpdCBtZWFudCB0aGF0IHlvdSB3YW50ZWQgdG8gdXNlIHVud2VkZ2UgYnV0
IHlvdSBkaWRuJ3Qgc3BlY2lmeQppdCBwcm9wZXJseS4KCgo+IFJldmlld2VkLWJ5OiBTZWFuIFBh
dWwgPHNlYW5AcG9vcmx5LnJ1bj4KClRoYW5rcyEKCi1Eb3VnCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRl
dmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
