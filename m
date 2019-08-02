Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C9797FABE
	for <lists+dri-devel@lfdr.de>; Fri,  2 Aug 2019 15:35:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DCB606EE53;
	Fri,  2 Aug 2019 13:35:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com
 [IPv6:2607:f8b0:4864:20::644])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5638D6EE52;
 Fri,  2 Aug 2019 13:35:07 +0000 (UTC)
Received: by mail-pl1-x644.google.com with SMTP id k8so33685291plt.3;
 Fri, 02 Aug 2019 06:35:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:date:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=FUKwvsUakiLdWHeLmkm41eeKrCNSJsxR9s2deeLtAuU=;
 b=IOL7LhcZJW0IlSC1iJrxlr86zWVrjdGnCiTUd+I+fECAe7DVCVgcXrp4mrIrHYb3oQ
 OQMBM5taOYBGtoM6fciDW/IeIkURRtXFNweSTqCk7OUiMIPewAAW/JBumk3H00d9Uhmr
 weiGwzrGlJzqBPawwwY+58B6oWcy9cORLMGwlNfO9cj/s8FxMIvMFOIGUcernKl/91Xg
 oYVhvOR7TfOpcFFJ8RnNZ2UykKa4d2XA4axTV87mbvatwvFBzTnfhWMQjKM8JMRHrPcH
 IyAUKzXCR4KJxx1ZHQi9srWy1sOvJKWa2kmjCvzCEskb2L6DcvROokpBUoboL8gb0hMX
 +pKQ==
X-Gm-Message-State: APjAAAUu1lSUdQRga0oOTQXlijwlj4wR83x4MO6j1427KQkgY3G9WDYb
 Crwwu747Iz9+stXuYp4BWbA=
X-Google-Smtp-Source: APXvYqwCXqnpwkproCYUNPLmAwfyhMI2JJoAiWiv9cKeSy9WaCOxpDHDV717uA6xD2DJ2hwr19LRfA==
X-Received: by 2002:a17:902:aa88:: with SMTP id
 d8mr124580948plr.274.1564752906788; 
 Fri, 02 Aug 2019 06:35:06 -0700 (PDT)
Received: from localhost ([121.137.63.184])
 by smtp.gmail.com with ESMTPSA id g66sm73903121pfb.44.2019.08.02.06.35.05
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Fri, 02 Aug 2019 06:35:06 -0700 (PDT)
From: Sergey Senozhatsky <sergey.senozhatsky@gmail.com>
X-Google-Original-From: Sergey Senozhatsky <sergey.senozhatsky.work@gmail.com>
Date: Fri, 2 Aug 2019 22:35:03 +0900
To: Chris Wilson <chris@chris-wilson.co.uk>
Subject: Re: [PATCH 2/2] i915: do not leak module ref counter
Message-ID: <20190802133503.GA18318@tigerII.localdomain>
References: <20190802123956.2450-1-sergey.senozhatsky@gmail.com>
 <20190802123956.2450-2-sergey.senozhatsky@gmail.com>
 <156475071634.6598.8668583907388398632@skylake-alporthouse-com>
 <156475141863.6598.6809215010139776043@skylake-alporthouse-com>
 <20190802131523.GB466@tigerII.localdomain>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190802131523.GB466@tigerII.localdomain>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:date:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to
 :user-agent;
 bh=FUKwvsUakiLdWHeLmkm41eeKrCNSJsxR9s2deeLtAuU=;
 b=FMAo8/vMKAG3Z081LK7599yv8zpQ5D1bMJw/Chyc6hnWkWEUo3NtEviyx4qmTuoLAu
 s/81LhUqS6pnSzJ5KEV/XM744D5k8ZgDTQNogZU5IMvzmejd4Y2sMifoYG/ikmpctugZ
 EUnXnEtqKJgtRF1tcCwX916sa8aGaIcKWLMRm6BZGPuNbE4Z3F2ErVvlwPnmxtweyF2K
 SS779zE83lL5bpAS8mOJ/opldu5ZFMsAFgxmimKF4D1NeOyGLnt6z9by0WJB/TUTEr/Y
 /q7HO6go55GE33Vt0iklPJzIUXu4OQD66lPdunc9FCEeTv6ceu+Immxa0kkzPac8IKw5
 jd5Q==
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

T24gKDA4LzAyLzE5IDIyOjE1KSwgU2VyZ2V5IFNlbm96aGF0c2t5IHdyb3RlOgpbLi5dCj4gPiA+
IExvb2tpbmcgYXJvdW5kLCBpdCBsb29rcyBsaWtlIHdlIGFsd2F5cyBuZWVkIHRvIGRyb3AgdHlw
ZSBhZnRlcgo+ID4gPiBtb3VudGluZy4gU2hvdWxkIHRoZQo+ID4gPiAgICAgICAgIHB1dF9maWxl
c3lzdGVtKHR5cGUpOwo+ID4gPiBiZSBoZXJlIGluc3RlYWQ/Cj4gPiA+IAo+ID4gPiBBbnl3YXks
IG5pY2UgY2F0Y2guCj4gPiAKPiA+IFNpZ2guIHB1dF9maWxlc3lzdGVtKCkgaXMgcGFydCBvZiBm
cyBpbnRlcm5hbHMuIEknZCBiZSB0ZW1wdGVkIHRvIGFkZAo+IAo+IEdvb2QgY2F0Y2ghCj4gCj4g
U28gd2UgY2FuIHN3aXRjaCB0byB2ZnNfa2Vybl9tb3VudCgpLCBJIGd1ZXNzLCBidXQgcGFzcyBk
aWZmZXJlbnQgb3B0aW9ucywKPiBkZXBlbmRpbmcgb24gaGFzX3RyYW5zcGFyZW50X2h1Z2VwYWdl
KCkuCgpIbW0uIFRoaXMgZG9lc24ndCBsb29rIGV4YWN0bHkgcmlnaHQuIEl0IGFwcGVhcnMgdGhh
dCB2ZnNfa2Vybl9tb3VudCgpCmhhcyBhIHNsaWdodGx5IGRpZmZlcmVudCBwdXJwb3NlLiBJdCdz
IGZvciBkcml2ZXJzIHdoaWNoIHJlZ2lzdGVyIHRoZWlyCm93biBmc3R5cGUgYW5kIGZzX2NvbnRl
eHQvc2IgY2FsbGJhY2tzLiBBIHR5cGljYWwgdXNhZ2Ugd291bGQgYmUKCglzdGF0aWMgc3RydWN0
IGZpbGVfc3lzdGVtX3R5cGUgbmZzZF9mc190eXBlID0gewoJCS5vd25lcuKGkiDihpIgICAgICAg
PSBUSElTX01PRFVMRSwKCQkubmFtZeKGkiAg4oaSICAgICAgID0gIm5mc2QiLAoJCS5pbml0X2Zz
X2NvbnRleHQgPSBuZnNkX2luaXRfZnNfY29udGV4dCwKCQkua2lsbF9zYuKGkiAgICAgICA9IG5m
c2RfdW1vdW50LAoJfTsKCU1PRFVMRV9BTElBU19GUygibmZzZCIpOwoKCXZmc19rZXJuX21vdW50
KCZuZnNkX2ZzX3R5cGUsIFNCX0tFUk5NT1VOVCwgIm5mc2QiLCBOVUxMKTsKCmk5MTUgaXMgYSBk
aWZmZXJlbnQgYmVhc3QsIGl0IGp1c3Qgd2FudHMgdG8gbW91bnQgZnMgYW5kIHJlY29uZmlndXJl
Cml0LCBpdCBkb2Vzbid0IHdhbnQgdG8gYmUgYW4gZnMuIFNvIGl0IHNlZW1zIHRoYXQgY3VycmVu
dCBrZXJuX21vdW50KCkKaXMgYWN0dWFsbHkgcmlnaHQuCgpNYXliZSB3ZSBuZWVkIHRvIGV4cG9y
dCBwdXRfZmlsZXN5c3RlbSgpIGluc3RlYWQuCgoJLXNzCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVs
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
