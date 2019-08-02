Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D04E7F848
	for <lists+dri-devel@lfdr.de>; Fri,  2 Aug 2019 15:15:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 398A56EE0E;
	Fri,  2 Aug 2019 13:15:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com
 [IPv6:2607:f8b0:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B0E956EE0B;
 Fri,  2 Aug 2019 13:15:29 +0000 (UTC)
Received: by mail-pf1-x444.google.com with SMTP id y15so36050597pfn.5;
 Fri, 02 Aug 2019 06:15:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:date:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=ifLzeiN7RdoV2uCNP+IfzGizfQ9wvDhB0/Kk7Ly+1nw=;
 b=FZnElv5uZFZoo6jlg+VKLosPYD0aUaWJsfVm2W1PRw2z4bJekoatv1Z65L42J9h+J2
 +z+Z6web+FfwkpsMh+usY9/HzGVVGyz6cVWN6BZOGi308wYVDeRkL6gYzyZXIo0GuNXJ
 0n7e82H4rn/oEKnWM9r2JY+Y4uP3vDGWdI5e23/hwNO0CP0O+XDSivRVgYQFAnHMbUbl
 JiAMc36dci2qNKKhNYCxFV1nwCDSBxRhsA6ukHF6MGUHn+IE0ASRLB5NuHYbeURQj0eq
 htN07yzChr9FgGS7Wdrt6AYS7sDtE4Js/kxitoeiIBHKCsDtfA+E19j4L7Qao/uteucC
 1y6A==
X-Gm-Message-State: APjAAAUpKfq1jAQWUBDuU9nWDnbXOXvzJmUjHwkEb6REeGZvqn7axQcK
 b0YQGnhzjILFIMXjy3VVZlI=
X-Google-Smtp-Source: APXvYqxSa24tdlPjUU4ROAhn9QcEDkxcpmypjCQZoXQjxwLTalItXRTxEMj4hn5NQ/b8SHAhsCjt/w==
X-Received: by 2002:a17:90a:d343:: with SMTP id
 i3mr4480771pjx.15.1564751729134; 
 Fri, 02 Aug 2019 06:15:29 -0700 (PDT)
Received: from localhost ([121.137.63.184])
 by smtp.gmail.com with ESMTPSA id y12sm85622219pfn.187.2019.08.02.06.15.27
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Fri, 02 Aug 2019 06:15:28 -0700 (PDT)
From: Sergey Senozhatsky <sergey.senozhatsky@gmail.com>
X-Google-Original-From: Sergey Senozhatsky <sergey.senozhatsky.work@gmail.com>
Date: Fri, 2 Aug 2019 22:15:23 +0900
To: Chris Wilson <chris@chris-wilson.co.uk>
Subject: Re: [PATCH 2/2] i915: do not leak module ref counter
Message-ID: <20190802131523.GB466@tigerII.localdomain>
References: <20190802123956.2450-1-sergey.senozhatsky@gmail.com>
 <20190802123956.2450-2-sergey.senozhatsky@gmail.com>
 <156475071634.6598.8668583907388398632@skylake-alporthouse-com>
 <156475141863.6598.6809215010139776043@skylake-alporthouse-com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <156475141863.6598.6809215010139776043@skylake-alporthouse-com>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:date:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=ifLzeiN7RdoV2uCNP+IfzGizfQ9wvDhB0/Kk7Ly+1nw=;
 b=mijUeY9+6MiYDPyljJ3fpJLl5Awygf8JLF+LiHnz5X4Xw2WV6OinFyjc3LEyPf8elk
 FRSfdIrxlCaUXybHyrHLv3BaSsaRfBCZ5NW4hmRO6z0t/uyifEQyjKWORmHLqmdr9l9i
 XtmS7TGRcdnAdHxlviZdi0iBPjCflSOWFkkWQa5KSueiVKMFXuYly4sfizxxVENcuWvh
 dCocnAC6zUmQY2H55pO0OB3cP/zyh+HIlQNYQr5IHF1CJf0tBnBwk/U/xbizNCYUeGkW
 fWLp6HYrBzKPaXemGRK4YMUgjz8cIFemmKeTWG+WuPSGwKZ1aP6ca/O1U3dd/0uGOglH
 g1fA==
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
Cc: David Airlie <airlied@linux.ie>, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org,
 Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
 dri-devel@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gKDA4LzAyLzE5IDE0OjEwKSwgQ2hyaXMgV2lsc29uIHdyb3RlOgo+ID4gPiAgZHJpdmVycy9n
cHUvZHJtL2k5MTUvZ2VtL2k5MTVfZ2VtZnMuYyB8IDQgKysrLQo+ID4gPiAgMSBmaWxlIGNoYW5n
ZWQsIDMgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQo+ID4gPiAKPiA+ID4gZGlmZiAtLWdp
dCBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2dlbS9pOTE1X2dlbWZzLmMgYi9kcml2ZXJzL2dwdS9k
cm0vaTkxNS9nZW0vaTkxNV9nZW1mcy5jCj4gPiA+IGluZGV4IGNmMDViYTcyZGY5ZC4uZDQzNzE4
OGQxNzM2IDEwMDY0NAo+ID4gPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9nZW0vaTkxNV9n
ZW1mcy5jCj4gPiA+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2dlbS9pOTE1X2dlbWZzLmMK
PiA+ID4gQEAgLTI0LDggKzI0LDEwIEBAIGludCBpOTE1X2dlbWZzX2luaXQoc3RydWN0IGRybV9p
OTE1X3ByaXZhdGUgKmk5MTUpCj4gPiA+ICAgICAgICAgICAgICAgICByZXR1cm4gLUVOT0RFVjsK
PiA+ID4gIAo+ID4gPiAgICAgICAgIGdlbWZzID0ga2Vybl9tb3VudCh0eXBlKTsKPiA+IAo+ID4g
TG9va2luZyBhcm91bmQsIGl0IGxvb2tzIGxpa2Ugd2UgYWx3YXlzIG5lZWQgdG8gZHJvcCB0eXBl
IGFmdGVyCj4gPiBtb3VudGluZy4gU2hvdWxkIHRoZQo+ID4gICAgICAgICBwdXRfZmlsZXN5c3Rl
bSh0eXBlKTsKPiA+IGJlIGhlcmUgaW5zdGVhZD8KPiA+IAo+ID4gQW55d2F5LCBuaWNlIGNhdGNo
Lgo+IAo+IFNpZ2guIHB1dF9maWxlc3lzdGVtKCkgaXMgcGFydCBvZiBmcyBpbnRlcm5hbHMuIEkn
ZCBiZSB0ZW1wdGVkIHRvIGFkZAoKR29vZCBjYXRjaCEKClNvIHdlIGNhbiBzd2l0Y2ggdG8gdmZz
X2tlcm5fbW91bnQoKSwgSSBndWVzcywgYnV0IHBhc3MgZGlmZmVyZW50IG9wdGlvbnMsCmRlcGVu
ZGluZyBvbiBoYXNfdHJhbnNwYXJlbnRfaHVnZXBhZ2UoKS4KCgktc3MKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApk
cmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
