Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6396110AEB7
	for <lists+dri-devel@lfdr.de>; Wed, 27 Nov 2019 12:31:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 765BF6E516;
	Wed, 27 Nov 2019 11:31:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8027E6E516
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Nov 2019 11:31:48 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id b11so6677405wmj.4
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Nov 2019 03:31:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to:user-agent;
 bh=x90tXPKX7SXXKqBD4RPtG2IIq5qjnnSo5Z0/fEo6WeM=;
 b=FZdIx95QNXqDVpUi5IhdThPo6CaJL1S8MeUG+WvjrqLBq1kYsZgISFUry8i6nKne7Q
 1u26/6XLxre7QrtXpyLMlaHLe2QMbnwJnuLF9mwFthIfhW3OdGq9ocLRIV3FvXiSVHt6
 A0RqKuiGgtxCOMtKkcgvema1Udrgxb3ImBUVus5fbbk7PBRSpJPnJyWP7AfswOR/BRsO
 ZlEqnqOSRMeKRWGA9gEkpRzW8757tyFNcgHREPpI4osLeqQ+7u5fe8b7yj4xpggjM8xZ
 u9lcIzCLrAvxWjQOrX3BQqWqMuvPZTNfdxMUyva9cyW4MPDmsAWitk/0Zbuw6UoIQtbs
 o37w==
X-Gm-Message-State: APjAAAX28OVQfrzpjzFTXuIkqO0ho7cFJ4GKheUd8SOz1iE92aY7CKr2
 pnp6j1KdfLt+lhdjwSDxPzDZew==
X-Google-Smtp-Source: APXvYqxyxbbkKMh7d55C6ytzARLcPhLeP1snQ1/wcdRHhfg+jyfNB1sXnfk0WrYvAds5Kp0J5NPfnA==
X-Received: by 2002:a7b:ca57:: with SMTP id m23mr3820456wml.65.1574854307107; 
 Wed, 27 Nov 2019 03:31:47 -0800 (PST)
Received: from phenom.ffwll.local (212-51-149-96.fiber7.init7.net.
 [212.51.149.96])
 by smtp.gmail.com with ESMTPSA id y8sm19160341wru.59.2019.11.27.03.31.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Nov 2019 03:31:46 -0800 (PST)
Date: Wed, 27 Nov 2019 12:31:41 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Mihail Atanassov <Mihail.Atanassov@arm.com>
Subject: Re: [PATCH 01/30] drm: Introduce drm_bridge_init()
Message-ID: <20191127113141.GA406127@phenom.ffwll.local>
Mail-Followup-To: Mihail Atanassov <Mihail.Atanassov@arm.com>,
 Sam Ravnborg <sam@ravnborg.org>, nd <nd@arm.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 David Airlie <airlied@linux.ie>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <20191126131541.47393-1-mihail.atanassov@arm.com>
 <11447519.fzG14qnjOE@e123338-lin>
 <20191126192445.GA2044@ravnborg.org>
 <2196368.mua8KTRpvS@e123338-lin>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <2196368.mua8KTRpvS@e123338-lin>
X-Operating-System: Linux phenom 5.3.0-2-amd64 
User-Agent: Mutt/1.12.2 (2019-09-21)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=x90tXPKX7SXXKqBD4RPtG2IIq5qjnnSo5Z0/fEo6WeM=;
 b=Si/wqXv43/+mCQD2Ob59KWepPVhzTOFtpYdFBsZ+xxYWlVuDHZJAgsVBNclLRoCIGz
 lHd5apR/IOGkAJR44eeiAtC+oQ0yHMXQ4m9NIeqnURvfM7tBGobb1UuVJgolXqCEF1sp
 bwS9M3wq81CKMuS1h4MRfHlJ7HOeqcUAlMDvU=
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
Cc: David Airlie <airlied@linux.ie>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 nd <nd@arm.com>, Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBOb3YgMjcsIDIwMTkgYXQgMTE6MDU6NTZBTSArMDAwMCwgTWloYWlsIEF0YW5hc3Nv
diB3cm90ZToKPiBPbiBUdWVzZGF5LCAyNiBOb3ZlbWJlciAyMDE5IDE5OjI0OjQ1IEdNVCBTYW0g
UmF2bmJvcmcgd3JvdGU6Cj4gPiBIaSBNaWhhaWwuCj4gCj4gSGkgU2FtLAo+IAo+ID4gCj4gPiA+
IEFjaywgYnV0IHdpdGggb25lIGNhdmVhdDogYnJpZGdlLT5kZXYgaXMgdGhlIHN0cnVjdCBkcm1f
ZGV2aWNlIHRoYXQgaXMKPiA+ID4gdGhlIGJyaWRnZSBjbGllbnQsIHdlIG5lZWQgdG8gYWRkIGEg
YnJpZGdlLT5kZXZpY2UgKHBhdGNoIDI5IGluIHRoaXMKPiA+ID4gc2VyaWVzKSB3aGljaCBpcyB0
aGUgc3RydWN0IGRldmljZSB0aGF0IHdpbGwgbWFuYWdlIHRoZSBicmlkZ2UgbGlmZXRpbWUuCj4g
PiBPdGhlciBwbGFjZXMgdXNlcyB0aGUgdmFyaWFibGUgbmFtZSAiZHJtIiBmb3IgYSBkcm1fZGV2
aWNlLgo+ID4gVGhpcyBpcyBsZXNzIGNvbmZ1c2lvbiB0aGFuIHRoZSAiZGV2IiBuYW1lLgo+ID4g
Cj4gPiBJdCBzZWVtcyBhIHJlY2VudCB0cmVuZCB0byB1c2UgdGhlIHZhcmlhYmxlIG5hbWUgImRy
bSIgc28geW91IGNhbiBmaW5kIGEKPiA+IGxvdCBvZiBwbGFjZXMgdXNpbmcgImRldiIuCj4gPiAK
PiA+IGJpa2Utc2hlZGRpbmcgLSBidXQgYWxzbyBhYm91dCByZWFkYWJpbGl0eS4KPiA+IAo+ID4g
CVNhbQo+ID4gCj4gCj4gSSdtIG9rYXkgd2l0aCB0aGUgaWRlYSwgSSBjYW4gZG8gYSBmb2xsb3ct
dXAgcGF0Y2ggb3Igc2VyaWVzIGZvciB0aGUKPiByZW5hbWU7IEkgZXhwZWN0IGl0IHdvdWxkIGJl
IGEgYml0IGhlZnR5IHRvIGRvIGl0IHByaW9yIHRvIHRoaXMuCj4gCj4gQERhbmllbCwgdGhvdWdo
dHMgb24gcy9icmlkZ2UuZGV2L2JyaWRnZS5kcm0vIGFuZAo+IHMvYnJpZGdlLmRldmljZS9icmlk
Z2UuZGV2LyBhZnRlciB0aGlzIHNlcmllcz8KCkknbSBmaXJtbHkgaW4gdGhlICJubyBvcGlvbm9u
IiBvbiB0aGlzLgotRGFuaWVsCi0tIApEYW5pZWwgVmV0dGVyClNvZnR3YXJlIEVuZ2luZWVyLCBJ
bnRlbCBDb3Jwb3JhdGlvbgpodHRwOi8vYmxvZy5mZndsbC5jaApfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1k
ZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcv
bWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
