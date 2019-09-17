Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DE005B4DA7
	for <lists+dri-devel@lfdr.de>; Tue, 17 Sep 2019 14:17:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A42A96EC1D;
	Tue, 17 Sep 2019 12:17:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x544.google.com (mail-ed1-x544.google.com
 [IPv6:2a00:1450:4864:20::544])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 23DB46EC1D
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Sep 2019 12:17:45 +0000 (UTC)
Received: by mail-ed1-x544.google.com with SMTP id y91so3099774ede.9
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Sep 2019 05:17:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=cW76BSl9fB1oYY03ZiNGHrIPtWDPxjyGCAoI5vPWVrg=;
 b=sjqZpngdlkwz8bH3j6nfyPd61cIC8nSiSu4uLRbuZRJl6cd5Gar6AjojDjBQiRt0bL
 knZd//wSchWRQ+ouF1Uoot55u14p5D4hhOKpN0OeDbIwQM8hZeVzuHsjeG6spCzmcsb3
 sYPJKn6+GZ6E7SqBvlvjX+DKRVP4T9EPk/aCu3Uqw8toxBQvsnJAc5WbtnqLfHjEjpBE
 1FXlFj+l3+CT8wss9iVx6rdLlcvl9dbts8Csv8wLVEX1Lw3LEQp3FhFliTt0dxnZZFLi
 ibOtchHHV0SuNFprE1Bw8Wnuh/Lzd0fZ8AhGazConi5nQBF9VZ4MBA5Lta3HM8grBP2U
 MZnA==
X-Gm-Message-State: APjAAAVe0PWJcK98FKih6LEyJ+XgDmnULARdc+uWZTcXlmGtAx5Bi9vK
 PCsADYq3LzD5T/qx26hL78l2Xw==
X-Google-Smtp-Source: APXvYqzLz7Ut5dbk0akJ4r9jdaNIWc2JeMpN8N3NcR+zXGpoibsAcWeLrQS6Z2BEqaZNtHMMhwAFCA==
X-Received: by 2002:aa7:cd6f:: with SMTP id ca15mr4359376edb.172.1568722663721; 
 Tue, 17 Sep 2019 05:17:43 -0700 (PDT)
Received: from phenom.ffwll.local (212-51-149-96.fiber7.init7.net.
 [212.51.149.96])
 by smtp.gmail.com with ESMTPSA id ba28sm404665edb.4.2019.09.17.05.17.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Sep 2019 05:17:42 -0700 (PDT)
Date: Tue, 17 Sep 2019 14:17:40 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: [PATCH v4 00/17] drm: add gem ttm helpers, rework mmap workflow.
Message-ID: <20190917121740.GK3958@phenom.ffwll.local>
References: <20190808134417.10610-1-kraxel@redhat.com>
 <510b8714-2b9a-ee1d-3b03-f2704c69637e@suse.de>
 <CAKMK7uFWbmxrTbh21fL6iW9de0cRyDsnUMa5rvFLg_0a-BidXg@mail.gmail.com>
 <20190827051341.tjnjhfih7noqaijl@sirius.home.kraxel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190827051341.tjnjhfih7noqaijl@sirius.home.kraxel.org>
X-Operating-System: Linux phenom 5.2.0-2-amd64 
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=cW76BSl9fB1oYY03ZiNGHrIPtWDPxjyGCAoI5vPWVrg=;
 b=EQIkze9dK8B2M08WnrEHZ03H8CnY9HOw5+vavx5wsTbEk2eXkNifF2nH7Qy6zklM4z
 5dwnBbQZa0QcjW+w9ROvu/iRYSOnKiBomaW+S4YUv0BRi3F7bVwEJrP/VLfHholJZkQg
 JlhWnVUUlNfG5m447i7XCrizSngVqyGhz+w0U=
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
Cc: dri-devel <dri-devel@lists.freedesktop.org>,
 Thomas Zimmermann <tzimmermann@suse.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBBdWcgMjcsIDIwMTkgYXQgMDc6MTM6NDFBTSArMDIwMCwgR2VyZCBIb2ZmbWFubiB3
cm90ZToKPiAgIEhpLAo+IAo+ID4gQWxzbyB0aGlzIHBhdGNoIHNlcmllcyBhbHNvIGFkanVzdCB2
cmFtIGhlbHBlcnMsIGFuZCBJIHRoaW5rIGl0IGhhcyBhCj4gPiBzbGlnaHRseSBkaWZmZXJlbnQg
Z29hbDogSnVzdCBhbGlnbmluZyBtbWFwIHBhdGhzIGEgYml0IG1vcmUgYmV0d2Vlbgo+ID4gdHRt
IGFuZCBub3QtdHRtIGJhc2VkIGRyaXZlcnMuCj4gCj4gTm90IGp1c3QgdHRtL25vdC10dG0uICBn
ZW1fZHJpdmVyLT5mb3BzLT5tbWFwIGlzIHRoZSBvbmx5IGZvcHMgY2FsbGJhY2sKPiB3aGVyZSB3
ZSBjYW4ndCB1c2UgYSBnZW5lcmljIGdlbSBjYWxsYmFjayB0b2RheS4gIFRoaXMgc2VyaWVzIHRy
aWVzIHRvCj4gZml4IHRoYXQgd2l0aCB0aGUgbmV3IGRybV9nZW1fb2JqZWN0X2Z1bmNzLT5tbWFw
IGhvb2ssIHNvIHRoZSBtbWFwKCkKPiBjb2RlIHBhdGggaXNuJ3QgdGhlIG9kZCBvbmUgd2hpY2gg
d29ya3MgZGlmZmVyZW50IHRoYW4gZXZlcnkgb3RoZXIKPiBkcm1fZ2VtX29iamVjdCBvcGVyYXRp
b24uCj4gCj4gPiBTZWVtcyBsaWtlIGEgZ29vZCBnb2FsLCBkZXRhaWxzIG1pZ2h0IG5lZWQgYWRq
dXN0bWVudC4KPiAKPiBXaGljaCBkZXRhaWxzPwoKSnVzdCBhIGdlbmVyYWwgY29tbWVudCB0aGF0
IHRoZSB0cmlja3kgcGFydHMgYXJlIGFsd2F5cyBpbiB0aGUgZGV0YWlscyAuLi4KLURhbmllbAot
LSAKRGFuaWVsIFZldHRlcgpTb2Z0d2FyZSBFbmdpbmVlciwgSW50ZWwgQ29ycG9yYXRpb24KaHR0
cDovL2Jsb2cuZmZ3bGwuY2gKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJp
LWRldmVs
