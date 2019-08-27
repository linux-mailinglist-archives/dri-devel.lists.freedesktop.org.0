Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BE3699F054
	for <lists+dri-devel@lfdr.de>; Tue, 27 Aug 2019 18:37:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B736389BAC;
	Tue, 27 Aug 2019 16:37:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [IPv6:2a00:1450:4864:20::536])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD75E89BAC
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Aug 2019 16:37:45 +0000 (UTC)
Received: by mail-ed1-x536.google.com with SMTP id f22so32147138edt.4
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Aug 2019 09:37:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition
 :content-transfer-encoding:in-reply-to:user-agent;
 bh=X6m6ji0wgVmeCJH3F3ZV9wKLZzsKCQSRHMJxqstYqj0=;
 b=kNU/nYTd1SGFxeCkmX0bMxXJXveftduNXP3j3TRS3+tb/Vi7B+ndXGdZdbFqrQZlx1
 epXjjlYf26Z4hJdrgGNUMX4h04H7qJyk/a4gq1K4vawVNQzxYPw3vXjDWgeqNjUwDeAn
 gvO1DeSv8w28RrtLODfaYTP96mYeHIFoQ4pBFdq6aIBaFm+D2c1Ddm2rpvVEbbDbntIa
 W3PIUexMTu2yhTLrfvbNVHUEcDhRl5aQmPwoHnQ7G3sZxyzKOOaDD3w11z5CcEWDDNAg
 juLOmo2sELynPy2uM/85BE3swyzRBwxmjwh2qfyUeY1URBttC/uB+bPf1VpmDisIdoAu
 uswA==
X-Gm-Message-State: APjAAAXIly0Flrc31YnJ1fo0pCJFoMeB9+oPXSztGPeR2WLiKGgi4pFA
 Aw5GOZy8jmHgkL+V8R4GkyNvig==
X-Google-Smtp-Source: APXvYqyeWUFA33qFqfl3sPquTqe6/sfRYpA7x0PgfM1qpojyxFDmNnmf7vo6xcpK8EEJHtHIbtO/AQ==
X-Received: by 2002:a17:906:3518:: with SMTP id
 r24mr22158673eja.133.1566923864171; 
 Tue, 27 Aug 2019 09:37:44 -0700 (PDT)
Received: from phenom.ffwll.local (212-51-149-96.fiber7.init7.net.
 [212.51.149.96])
 by smtp.gmail.com with ESMTPSA id br8sm3665083ejb.92.2019.08.27.09.37.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Aug 2019 09:37:43 -0700 (PDT)
Date: Tue, 27 Aug 2019 18:37:41 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>
Subject: Re: Use dma_fence_array for implementing shared dma_resv fences
Message-ID: <20190827163741.GD2112@phenom.ffwll.local>
References: <20190826145731.1725-1-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190826145731.1725-1-christian.koenig@amd.com>
X-Operating-System: Linux phenom 5.2.0-2-amd64 
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to
 :user-agent;
 bh=X6m6ji0wgVmeCJH3F3ZV9wKLZzsKCQSRHMJxqstYqj0=;
 b=ELmS9Cb3e++5pqjflPQtkofvROLhs5tvezuQztDFOIZOrL/RfK5A0hKz9A8lIkXlQg
 pkkDDw8o//CAsRG09I/kg++nFSxNItQ+8s6OBkrFqhDJYH/aeAPjHKIo78QGl27NIr2e
 DODtIGdVKSTrIUgmKtFqurRXZeH/xSgBeYOiI=
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
Cc: daniel.vetter@ffwll.ch, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, linux-media@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBBdWcgMjYsIDIwMTkgYXQgMDQ6NTc6MjJQTSArMDIwMCwgQ2hyaXN0aWFuIEvDtm5p
ZyB3cm90ZToKPiBUaGlzIGlzIHRoZSBuZXcgZG1hX2ZlbmNlX2FycmF5IGJhc2VkIGNvbnRhaW5l
ciBmb3Igc2hhcmVkIGZlbmNlcyBpbiB0aGUKPiBkbWFfcmVzdiBvYmplY3QuCj4gCj4gQWR2YW50
YWdlIG9mIHRoaXMgYXBwcm9hY2ggaXMgdGhhdCB5b3UgY2FuIGdyYWIgYSByZWZlcmVuY2UgdG8g
dGhlCj4gY3VycmVudCBzZXQgb2Ygc2hhcmVkIGZlbmNlcyBhdCBhbnkgdGltZSwgd2hpY2ggYWxs
b3dzIHVzIHRvIGRyb3AgdGhlCj4gc2VxdWVuY2UgbnVtYmVyIGluY3JlbWVudCBhbmQgbWFrZXMg
dGhlIHdob2xlIFJDVSBoYW5kbGluZyBtdWNoIG1vcmUKPiBlYXNpZXIuCj4gCj4gRGlzYWR2YW50
YWdlIGlzIHRoYXQgUkNVIHVzZXJzIG5vdyBoYXZlIHRvIGdyYWIgYSByZWZlcmVuY2UgaW5zdGVh
ZCBvZgo+IHVzaW5nIHRoZSBzZXF1ZW5jZSBjb3VudGVyLiBBcyBmYXIgYXMgSSBjYW4gc2VlIGk5
MTUgd2FzIGFjdHVhbGx5IHRoZQo+IG9ubHkgZHJpdmVyIGRvaW5nIHRoaXMuCj4gCj4gU28gd2Ug
b3B0aW1pemUgZm9yIGFkZGluZyBtb3JlIGZlbmNlcyBpbnN0ZWFkIG9mIHJlYWRpbmcgdGhlbSBu
b3cuCj4gCj4gQW5vdGhlciBiZWhhdmlvciBjaGFuZ2Ugd29ydGggbm90aW5nIGlzIHRoYXQgdGhl
IHNoYXJlZCBmZW5jZXMgYXJlIG5vdwo+IG9ubHkgdmlzaWJsZSBhZnRlciB1bmxvY2tpbmcgdGhl
IGRtYV9yZXN2IG9iamVjdCBvciBjYWxsaW5nCj4gZG1hX3Jlc3ZfZmVuY2VzX2NvbW1pdCgpIG1h
bnVhbGx5LgoKSSB0aGluayBtb3JlIHNwZWNpZmljIHBvaW50IGZvciBwdWJsaXNoaW5nIGZlbmNl
cyBtYWtlcyBhIGxvdCBvZiBzZW5zZSwgc28KdGhpcyBzb3VuZHMgbGlrZSBhIHNvbGlkIGltcHJv
dmVtZW50IG9uIHRoZSBkbWFfcmVzdiBhcGkuIEknbSB3b3JraW5nIG9uCnNvbWUgZG1hX2ZlbmNl
IGluc3RydW1lbnRhdGlvbiB3aGVyZSB0aGF0IGF0IGxlYXN0IG1pZ2h0IGJlIHVzZWZ1bC4KCi9t
ZSBiYWNrIHRvIGJ1cnJpZWQgc3RhdGUKCkNoZWVycywgRGFuaWVsCi0tIApEYW5pZWwgVmV0dGVy
ClNvZnR3YXJlIEVuZ2luZWVyLCBJbnRlbCBDb3Jwb3JhdGlvbgpodHRwOi8vYmxvZy5mZndsbC5j
aApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2
ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
