Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 841AC8E4FF
	for <lists+dri-devel@lfdr.de>; Thu, 15 Aug 2019 08:47:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E55C6E8A4;
	Thu, 15 Aug 2019 06:47:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com
 [IPv6:2a00:1450:4864:20::542])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B557A6E89D
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Aug 2019 06:47:11 +0000 (UTC)
Received: by mail-ed1-x542.google.com with SMTP id w20so1312655edd.2
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Aug 2019 23:47:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=/idpduwU3yD5MGOQLN6gjyI1d75hHNv0VgVkPg7YETw=;
 b=A65xuENPOcqZwFexbzZ1ReDvYIkUqz4li5AP9FST3Zp+RyO2id4mvmTHu3JXagV7fm
 VjKD0ERr8crO81NIBMq7TpwhPZg5weGCvyW2JHVPDIA3LGtlGfdLRRgd9/VPi0NSQkCj
 c2YyYdsmzYHsnjKLAX8nYwAizeBCAMvIfYt9rA5G2MEous+bdAh4UXcMu6nWSQCSO4Sw
 w5uYnlUC+m61XNd2d2nKybonCZRfFKVcjgFpinMtQx0LbW5HoYAy+RL97d76KC4KLdMQ
 1h4fvw5xFqKsoZdk/m72Cao4exkzx7GCbl8lhTbZloYy8nEKafHttKXN4znpGohkg+dT
 8NQA==
X-Gm-Message-State: APjAAAVk9F8qe/YwT55RI7qZVEQ2AiK2Dg3EfXqWSQC/s4ZL9V+BxlEc
 y5J38RqcOqlmk2EVNaooWdzySg==
X-Google-Smtp-Source: APXvYqxFGwsM+EcdAlO9gCHLw0NIpBqHxiER+gQMaHy6Yf4506bh6Wm4Tl54o4hXSHxdHPO5jattrg==
X-Received: by 2002:a17:906:2401:: with SMTP id
 z1mr2992716eja.292.1565851630285; 
 Wed, 14 Aug 2019 23:47:10 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:569e:0:3106:d637:d723:e855])
 by smtp.gmail.com with ESMTPSA id n42sm386177edd.31.2019.08.14.23.47.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Aug 2019 23:47:09 -0700 (PDT)
Date: Thu, 15 Aug 2019 08:47:07 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Sasha Levin <sashal@kernel.org>
Subject: Re: [PATCH] dma-buf/sw_sync: Synchronize signal vs syncpt free
Message-ID: <20190815064707.GY7444@phenom.ffwll.local>
References: <20190812154247.20508-1-chris@chris-wilson.co.uk>
 <20190812190548.450CF20684@mail.kernel.org>
 <20190814172415.GN7444@phenom.ffwll.local>
 <20190815014641.GB31807@sasha-vm>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190815014641.GB31807@sasha-vm>
X-Operating-System: Linux phenom 4.19.0-5-amd64 
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=/idpduwU3yD5MGOQLN6gjyI1d75hHNv0VgVkPg7YETw=;
 b=J207I9Z4SslLflfMR/XiSnmlB6tzNPwaIxRnAOejLFSgUOLlPVWp6OcNlR0KgTa6sl
 XpDlTYDrRFtA2pIH74aPdRnMYr6xzb8D2UK/ph4kKHAhmSq+1Kqwjq0PJ+93XyFy87x0
 tN+6091XBib5jq+ZtSPvgSp0zWTJ9Jhs3Ih/A=
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

T24gV2VkLCBBdWcgMTQsIDIwMTkgYXQgMDk6NDY6NDFQTSAtMDQwMCwgU2FzaGEgTGV2aW4gd3Jv
dGU6Cj4gT24gV2VkLCBBdWcgMTQsIDIwMTkgYXQgMDc6MjQ6MTVQTSArMDIwMCwgRGFuaWVsIFZl
dHRlciB3cm90ZToKPiA+IEhpIFNhc2hhLAo+ID4gCj4gPiBPbiBNb24sIEF1ZyAxMiwgMjAxOSBh
dCAwNzowNTo0N1BNICswMDAwLCBTYXNoYSBMZXZpbiB3cm90ZToKPiA+ID4gSGksCj4gPiA+IAo+
ID4gPiBbVGhpcyBpcyBhbiBhdXRvbWF0ZWQgZW1haWxdCj4gPiA+IAo+ID4gPiBUaGlzIGNvbW1p
dCBoYXMgYmVlbiBwcm9jZXNzZWQgYmVjYXVzZSBpdCBjb250YWlucyBhICJGaXhlczoiIHRhZywK
PiA+ID4gZml4aW5nIGNvbW1pdDogZDM4NjJlNDRkYWE3IGRtYS1idWYvc3ctc3luYzogRml4IGxv
Y2tpbmcgYXJvdW5kIHN5bmNfdGltZWxpbmUgbGlzdHMuCj4gPiA+IAo+ID4gPiBUaGUgYm90IGhh
cyB0ZXN0ZWQgdGhlIGZvbGxvd2luZyB0cmVlczogdjUuMi44LCB2NC4xOS42NiwgdjQuMTQuMTM4
LCB2NC45LjE4OS4KPiA+ID4gCj4gPiA+IHY1LjIuODogQnVpbGQgT0shCj4gPiA+IHY0LjE5LjY2
OiBCdWlsZCBPSyEKPiA+ID4gdjQuMTQuMTM4OiBCdWlsZCBPSyEKPiA+ID4gdjQuOS4xODk6IEZh
aWxlZCB0byBhcHBseSEgUG9zc2libGUgZGVwZW5kZW5jaWVzOgo+ID4gPiAgICAgVW5hYmxlIHRv
IGNhbGN1bGF0ZQo+ID4gPiAKPiA+ID4gCj4gPiA+IE5PVEU6IFRoZSBwYXRjaCB3aWxsIG5vdCBi
ZSBxdWV1ZWQgdG8gc3RhYmxlIHRyZWVzIHVudGlsIGl0IGlzIHVwc3RyZWFtLgo+ID4gPiAKPiA+
ID4gSG93IHNob3VsZCB3ZSBwcm9jZWVkIHdpdGggdGhpcyBwYXRjaD8KPiA+IAo+ID4gVGhlIGJh
Y2twb3J0aW5nIGluc3RydWN0aW9uIGhhcyBhbiBleHBsaWNpdCAjIHY0LjE0KyBpbiB0aGVyZSwg
c28gZmFpbHVyZQo+ID4gdG8gYXBwbHkgdG8gb2xkZXIga2VybmVscyBpcyBleHBlY3RlZC4KPiA+
IAo+ID4gQ2FuIHlvdSBwZXJoYXBzIHRlYWNoIHRoaXMgdHJpY2sgdG8geW91ciBzY3JpcHQgcGVy
aGFwcz8gSWlyYyB3ZSdyZSB1c2luZwo+ID4gdGhlIG9mZmljaWFsIGZvcm1hdCBldmVuLgo+IAo+
IEhleSBEYW5pZWwsCj4gCj4gVGhlIHNjcmlwdCBrbm93cyBob3cgdG8gcmVhZCBzdGFibGUgdGFn
cyA6KQo+IAo+IEl0IHRlc3RlZCBvdXQgNC45IGJlY2F1c2UgdGhlIGNvbW1pdCBhbHNvIGhhcyBh
IGZpeGVzIHRhZyBwb2ludGluZyB0bwo+IGQzODYyZTQ0ZGFhNyAoImRtYS1idWYvc3ctc3luYzog
Rml4IGxvY2tpbmcgYXJvdW5kIHN5bmNfdGltZWxpbmUKPiBsaXN0cy4iKSwgd2hpY2ggd2FzIGJh
Y2twb3J0ZWQgdG8gNC45LgoKQWggbWFrZXMgc2Vuc2UsIG1pZ2h0IGJlIGdvb2QgdG8gYWRkIGEg
Yml0IG9mIG91dHB1dCBleHBsYWluaW5nIHRoYXQuCgo+IFNob3VsZCB0aGlzIG5vdCBiZSBiYWNr
cG9ydGVkIHRvIDQuOSwgZXZlbiB0aG91Z2ggdGhlIGNvbW1pdCBpdCBmaXhlcyBpcwo+IHRoZXJl
PwoKSSBndWVzcyBpdCBtaWdodCBhY3R1YWxseSBiZSBuZWVkZWQgdGhlcmUuCi1EYW5pZWwKLS0g
CkRhbmllbCBWZXR0ZXIKU29mdHdhcmUgRW5naW5lZXIsIEludGVsIENvcnBvcmF0aW9uCmh0dHA6
Ly9ibG9nLmZmd2xsLmNoCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1k
ZXZlbA==
