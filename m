Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 366748DB4A
	for <lists+dri-devel@lfdr.de>; Wed, 14 Aug 2019 19:24:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 39B5D6E795;
	Wed, 14 Aug 2019 17:24:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com
 [IPv6:2a00:1450:4864:20::542])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A77F6E795
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Aug 2019 17:24:20 +0000 (UTC)
Received: by mail-ed1-x542.google.com with SMTP id w20so110535037edd.2
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Aug 2019 10:24:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=T3esLEuHvcHBDKeS44Dlxzgj16ZGe90Wnaw14SiLC6E=;
 b=Rv4vu7JBzq/X0HOsAGCdK+OaIH3WBP3lY5TP7Zumm3XP8I8drYZ6FA9JYVQDlDEhxl
 sdMXc1wr4z6/oHmoKD5gKOfXjCU1uoYgDOa6uwIS7yDMfcPtObh550OcDdsSioAKga9Y
 odxCalEpPidvesVTAgvWr4CS9x6bFhkWBT+04LIPYY1BCu+Mo/EUnffwctOCHgZn9OKn
 mxN1z/e9yzhp6M8GqViZWAEP9ZIaUqN08vZhP4os5lFbgcNHv9jORau9pYIjjwpKzIAc
 I3zMy9MlUeaWkcpN3v8ouFFWrSE5NYC3CeirVCQ7Vd086pmZCWTjNdGE0zIP7JSaM/Sv
 JC9A==
X-Gm-Message-State: APjAAAUY+D7lfXNwHguZRiD4eaSY+lSAUmNKejvmD/CYGRBIRkpX6uyc
 T7TAOKwGma/3FFYcSA7XLM6RHA==
X-Google-Smtp-Source: APXvYqxnSM2oBc0b/HZFh2/UJm5weJKUxzZHuzDZdcLlO5+ialydTPWw0kXkytQ0nR4G9r1rM2Pssg==
X-Received: by 2002:a17:906:6bd4:: with SMTP id
 t20mr634986ejs.294.1565803458771; 
 Wed, 14 Aug 2019 10:24:18 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:569e:0:3106:d637:d723:e855])
 by smtp.gmail.com with ESMTPSA id oh24sm31281ejb.35.2019.08.14.10.24.17
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 14 Aug 2019 10:24:18 -0700 (PDT)
Date: Wed, 14 Aug 2019 19:24:15 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Sasha Levin <sashal@kernel.org>
Subject: Re: [PATCH] dma-buf/sw_sync: Synchronize signal vs syncpt free
Message-ID: <20190814172415.GN7444@phenom.ffwll.local>
References: <20190812154247.20508-1-chris@chris-wilson.co.uk>
 <20190812190548.450CF20684@mail.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190812190548.450CF20684@mail.kernel.org>
X-Operating-System: Linux phenom 4.19.0-5-amd64 
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=T3esLEuHvcHBDKeS44Dlxzgj16ZGe90Wnaw14SiLC6E=;
 b=CqqMWX3gUNMnm4h8mhKJO+3gyrAbIK/Q8ElN6LwKqSQinmE3OvInDx6wzXjqiM2ndX
 /A0wWOLdTfc6+pmlAODlL9seeB3uDEdoE8MgK5uYYn66tpmIyREpKrkhYDZPj6W5emwL
 oJJGHxlCKvH6BCOEenRMUgzHGUYf84ThYAjG0=
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
Cc: Gustavo Padovan <gustavo@padovan.org>, intel-gfx@lists.freedesktop.org,
 stable@vger.kernel.org, Sean Paul <seanpaul@chromium.org>,
 dri-devel@lists.freedesktop.org,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgU2FzaGEsCgpPbiBNb24sIEF1ZyAxMiwgMjAxOSBhdCAwNzowNTo0N1BNICswMDAwLCBTYXNo
YSBMZXZpbiB3cm90ZToKPiBIaSwKPiAKPiBbVGhpcyBpcyBhbiBhdXRvbWF0ZWQgZW1haWxdCj4g
Cj4gVGhpcyBjb21taXQgaGFzIGJlZW4gcHJvY2Vzc2VkIGJlY2F1c2UgaXQgY29udGFpbnMgYSAi
Rml4ZXM6IiB0YWcsCj4gZml4aW5nIGNvbW1pdDogZDM4NjJlNDRkYWE3IGRtYS1idWYvc3ctc3lu
YzogRml4IGxvY2tpbmcgYXJvdW5kIHN5bmNfdGltZWxpbmUgbGlzdHMuCj4gCj4gVGhlIGJvdCBo
YXMgdGVzdGVkIHRoZSBmb2xsb3dpbmcgdHJlZXM6IHY1LjIuOCwgdjQuMTkuNjYsIHY0LjE0LjEz
OCwgdjQuOS4xODkuCj4gCj4gdjUuMi44OiBCdWlsZCBPSyEKPiB2NC4xOS42NjogQnVpbGQgT0sh
Cj4gdjQuMTQuMTM4OiBCdWlsZCBPSyEKPiB2NC45LjE4OTogRmFpbGVkIHRvIGFwcGx5ISBQb3Nz
aWJsZSBkZXBlbmRlbmNpZXM6Cj4gICAgIFVuYWJsZSB0byBjYWxjdWxhdGUKPiAKPiAKPiBOT1RF
OiBUaGUgcGF0Y2ggd2lsbCBub3QgYmUgcXVldWVkIHRvIHN0YWJsZSB0cmVlcyB1bnRpbCBpdCBp
cyB1cHN0cmVhbS4KPiAKPiBIb3cgc2hvdWxkIHdlIHByb2NlZWQgd2l0aCB0aGlzIHBhdGNoPwoK
VGhlIGJhY2twb3J0aW5nIGluc3RydWN0aW9uIGhhcyBhbiBleHBsaWNpdCAjIHY0LjE0KyBpbiB0
aGVyZSwgc28gZmFpbHVyZQp0byBhcHBseSB0byBvbGRlciBrZXJuZWxzIGlzIGV4cGVjdGVkLgoK
Q2FuIHlvdSBwZXJoYXBzIHRlYWNoIHRoaXMgdHJpY2sgdG8geW91ciBzY3JpcHQgcGVyaGFwcz8g
SWlyYyB3ZSdyZSB1c2luZwp0aGUgb2ZmaWNpYWwgZm9ybWF0IGV2ZW4uCi1EYW5pZWwKLS0gCkRh
bmllbCBWZXR0ZXIKU29mdHdhcmUgRW5naW5lZXIsIEludGVsIENvcnBvcmF0aW9uCmh0dHA6Ly9i
bG9nLmZmd2xsLmNoCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9y
ZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZl
bA==
