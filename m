Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A4E23358385
	for <lists+dri-devel@lfdr.de>; Thu,  8 Apr 2021 14:44:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE7826EACB;
	Thu,  8 Apr 2021 12:44:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [IPv6:2a00:1450:4864:20::52f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B6EB6EACB
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Apr 2021 12:44:19 +0000 (UTC)
Received: by mail-ed1-x52f.google.com with SMTP id 18so2253152edx.3
 for <dri-devel@lists.freedesktop.org>; Thu, 08 Apr 2021 05:44:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=hHNEukPPV1vSNkpPzVIANeiA4L23mc7++MpMy606/vU=;
 b=kNPCbNjB5c6CSsECNwF98VsP5hxouLKhO7lHDeDIOq+ejI0ZkZVNloTIhHnEfQrB8j
 2n+WUzYP6b1ggImvFRd5PDqeMSc/Bj7eGMdsu7hI7SCm7tCHHap8EJbraOkM8ydo/zCn
 o+qIiDaMEqBsXgZK+sMwoyXrsL23ZeUgI/6FyuO6WhcJzeRVHaWgRxlEDOSYr6eOby7p
 PH0Ujl7G6KHK4HIhjdomRYc0kIugcxV/9J4K3uX/BFK7Xug1bvg3zymJvL5AAIX7stnF
 BkltKPf/ocgg1C3zUVMyDTAZuW0IibbZrSYmZ/fZmWyKdxxvh4OcUcBHvOsow4eHQZ69
 jJCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=hHNEukPPV1vSNkpPzVIANeiA4L23mc7++MpMy606/vU=;
 b=spAdVcQfmEZivcodLiNN7FBAWZQkV280BUTseLG8nOnKkiYf6/G9XHIkK7HyNzJk24
 02psx9fhC7MTGS6P5c1ibKqZ5aXELn7L+gQD1iUvkKUzVPJd6nYzV6OpFJTBW4CLG7HC
 hZ4FtXs9c9n720HGpZ1/YltR11XDAs7SQpLRaTn2GCmNIOOhGul/bfFARTGiX2XSQQ+t
 AjxstN1frA+otmkUAWG3svble2VW6VJg5sYk0Yts0gvoDYRTHbhoafcx/AXckoMzmVlx
 TQo79EpeIEmHZvh4g1MnPHYY71MZw+KSjEix+gtWBBJdy34CTAM7dk3txgvDX40OR66D
 q/ag==
X-Gm-Message-State: AOAM530v/+yJDSm14e6U6CQ30qmiGkpN7cb7p2SmHsd1r52bT8dl6iSN
 9p6FUBzgW/xf0rekE6gY9v0m9hxNINA=
X-Google-Smtp-Source: ABdhPJwZG0l5Li9HesUeumJ/eYPadl2eEYfcsoOC0yJPCeLbghg3PfPu+YGm6mX3PFWsth3sbcOPgw==
X-Received: by 2002:a05:6402:3511:: with SMTP id
 b17mr11139411edd.98.1617885857914; 
 Thu, 08 Apr 2021 05:44:17 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:f469:f66d:5260:18ab?
 ([2a02:908:1252:fb60:f469:f66d:5260:18ab])
 by smtp.gmail.com with ESMTPSA id b21sm2863920ejz.123.2021.04.08.05.44.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 08 Apr 2021 05:44:17 -0700 (PDT)
Subject: Re: [PATCH] drm/ttm: optimize the pool shrinker a bit
To: Daniel Vetter <daniel@ffwll.ch>
References: <20210401135413.1416-1-christian.koenig@amd.com>
 <YG7kNLwYbDPkyGKx@phenom.ffwll.local>
 <8f38a064-8afa-492d-251f-4ff715d9f9bf@gmail.com>
 <YG7pqs50QXkLQUz3@phenom.ffwll.local>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <ede33f9c-e86d-7859-74d6-b28067080573@gmail.com>
Date: Thu, 8 Apr 2021 14:44:16 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <YG7pqs50QXkLQUz3@phenom.ffwll.local>
Content-Language: en-US
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
Cc: daniel.vetter@ffwll.ch, dri-devel@lists.freedesktop.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMDguMDQuMjEgdW0gMTM6MzEgc2NocmllYiBEYW5pZWwgVmV0dGVyOgo+IE9uIFRodSwgQXBy
IDA4LCAyMDIxIGF0IDAxOjE3OjMyUE0gKzAyMDAsIENocmlzdGlhbiBLw7ZuaWcgd3JvdGU6Cj4+
IEFtIDA4LjA0LjIxIHVtIDEzOjA4IHNjaHJpZWIgRGFuaWVsIFZldHRlcjoKPj4+IE9uIFRodSwg
QXByIDAxLCAyMDIxIGF0IDAzOjU0OjEzUE0gKzAyMDAsIENocmlzdGlhbiBLw7ZuaWcgd3JvdGU6
Cj4+Pj4gW1NOSVBdCj4+Pj4gICAgRVhQT1JUX1NZTUJPTCh1bnJlZ2lzdGVyX3Nocmlua2VyKTsK
Pj4+PiArLyoqCj4+Pj4gKyAqIHN5bmNfc2hyaW5rZXIgLSBXYWl0IGZvciBhbGwgcnVubmluZyBz
aHJpbmtlcnMgdG8gY29tcGxldGUuCj4+Pj4gKyAqLwo+Pj4+ICt2b2lkIHN5bmNfc2hyaW5rZXJz
KHZvaWQpCj4+PiBUaGlzIG9uZSBzaG91bGQgcHJvYmFibHkgYmUgaW4gaXRzIG93biBwYXRjaCwg
d2l0aCBhIGJpdCBtb3JlIGNvbW1pdAo+Pj4gbWVzc2FnZSBhYm91dCB3aHkgd2UgbmVlZCBpdCBh
bmQgYWxsIHRoYXQuIEknZCBhc3N1bWUgdGhhdCBqdXN0Cj4+PiB1bnJlZ2lzdGVyaW5nIHRoZSBz
aHJpbmtlciBzaG91bGQgc3luYyBldmVyeXRoaW5nIHdlIG5lZWRlZCB0byBzeW5jCj4+PiBhbHJl
YWR5LCBhbmQgZm9yIG90aGVyIHN5bmMgbmVlZHMgd2UgY2FuIGRvIGxvY2tpbmcgd2l0aGluIG91
ciBvd24KPj4+IHNocmlua2VyPwo+PiBDb3JyZWN0LiBSZWFzb24gd2h5IHdlIG5lZWQgdGhlIGJh
cnJpZXIgaXMgdGhhdCB3ZSBuZWVkIHRvIGRlc3Ryb3kgdGhlCj4+IGRldmljZSAoZHVyaW5nIGhv
dHBsdWcpIGJlZm9yZSB0aGUgc2hyaW5rZXIgaXMgdW5yZWdpc3RlcmVkIChkdXJpbmcgbW9kdWxl
Cj4+IHVubG9hZCkuCj4+Cj4+IEdvaW5nIHRvIHNlcGFyYXRlIHRoYXQsIHdyaXRlIHNvbWV0aGlu
ZyB1cCBpbiB0aGUgY29tbWl0IG1lc3NhZ2UgYW5kIHNlbmQgaXQKPj4gdG8gdGhlIGFwcHJvcHJp
YXRlIGF1ZGllbmNlLgo+IEhtIHdoeSBkbyB3ZSBuZWVkIHRoYXQ/CgpXaGVuIHRoZSBzaHJpbmtl
ciBydW5zIGluIHBhcmFsbGVsIHdpdGggKGZvciBleGFtcGxlKSBhIGhvdHBsdWcgZXZlbnQgCmFu
ZCB1bm1hcHMgcGFnZXMgZnJvbSB0aGUgZGV2aWNlcyBJT01NVSBJIG11c3QgbWFrZSBzdXJlIHRo
YXQgeW91IGNhbid0IApkZXN0cm95IHRoZSBkZXZpY2Ugb3IgcG9vbCBzdHJ1Y3R1cmUgYXQgdGhl
IHNhbWUgdGltZS4KClByZXZpb3VzbHkgaG9sZGluZyB0aGUgbXV0ZXggd2hpbGUgdXBkYXRpbmcg
dGhlIElPTU1VIHdvdWxkIHRha2UgY2FyZSBvZiAKdGhhdCwgYnV0IG5vdyB3ZSBuZWVkIHRvIHBy
ZXZlbnQgdGhpcyBvdGhlcndpc2UuCgpDb3VsZCBiZSB0aGF0IHRoaXMgaXMgYWxzbyBoYW5kbGVk
IHNvbWV3aGVyZSBlbHNlLCBidXQgSSdtIGJldHRlciBzYXZlIAp0aGFuIHNvcnJ5IGhlcmUgYW5k
IGdyYWJiaW5nL3JlbGVhc2luZyB3cml0ZSBzaWRlIG9mIHRoZSBzaHJpbmtlcl9yd3NlbSAKaXMg
cmF0aGVyIGxpZ2h0d2VpZ2h0LgoKPiBFaXRoZXIgd2F5IHNvdW5kcyBsaWtlIGFuIG9ydGhvZ29u
YWwgc2VyaWVzIGZvcgo+IHRoZSBob3R1bnBsdWcgd29yaywgbm90IGp1c3Qgc2hyaW5rZXIgb3B0
aW1pemF0aW9uLgoKSXQgaXMgdW5yZWxhdGVkIHRvIHRoZSBob3RwbHVnIHdvcmsgaW4gZ2VuZXJh
bC4KClJlZ2FyZHMsCkNocmlzdGlhbi4KCj4gLURhbmllbAo+Cj4+IFRoYW5rcywKPj4gQ2hyaXN0
aWFuLgo+Pgo+Pj4gLURhbmllbAo+Pj4KPj4+PiArewo+Pj4+ICsJZG93bl93cml0ZSgmc2hyaW5r
ZXJfcndzZW0pOwo+Pj4+ICsJdXBfd3JpdGUoJnNocmlua2VyX3J3c2VtKTsKPj4+PiArfQo+Pj4+
ICtFWFBPUlRfU1lNQk9MKHN5bmNfc2hyaW5rZXJzKTsKPj4+PiArCj4+Pj4gICAgI2RlZmluZSBT
SFJJTktfQkFUQ0ggMTI4Cj4+Pj4gICAgc3RhdGljIHVuc2lnbmVkIGxvbmcgZG9fc2hyaW5rX3Ns
YWIoc3RydWN0IHNocmlua19jb250cm9sICpzaHJpbmtjdGwsCj4+Pj4gLS0gCj4+Pj4gMi4yNS4x
Cj4+Pj4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRy
aS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
