Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BA5AB5D063
	for <lists+dri-devel@lfdr.de>; Tue,  2 Jul 2019 15:20:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC8C189812;
	Tue,  2 Jul 2019 13:20:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com
 [IPv6:2a00:1450:4864:20::542])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E48A897F0
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Jul 2019 13:20:08 +0000 (UTC)
Received: by mail-ed1-x542.google.com with SMTP id m10so27250831edv.6
 for <dri-devel@lists.freedesktop.org>; Tue, 02 Jul 2019 06:20:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=tzwvLHoODplnbHp8E5wmzRqBd3OOGVG/jeLS3EJmbkI=;
 b=YnZMldrsul/jR230o31dTlVcpzownV5GSVse9gdCSDGDQMOCiPwbQSfoi2B84ZQNnE
 ED5q/nfyNJOc0+Oql88WPmFsSgWP/ovAekfzyIt5vfcuRik4wLLApxNPoU3/pwJy7Xfq
 U00obmoQbh7JeIbcojDw19VjcVGdfQkE16YYBRXDvSIPrF3ODO2pZ1aht59UsyQ5LD2j
 XWR3qRJzYvAs1AbBgbWgkX8N6SHofv0AROBwb1JSK5b7hOUVsWpmCVxrf5m3ZaHAIWE5
 22ICeLLR2mEblAkV7zva/I/HGTbbOrTqa1KkfdJt0y5kP24bgRhic/6gG6bjF2LUpVzk
 PNYQ==
X-Gm-Message-State: APjAAAWTLsD6VYbmZVM+n7Ym9o5jLq9uGI2OuUnq53OdaGZT3EUha/Go
 NcYvEfWSY3U9jCd+Fpzr4Ce4Vg==
X-Google-Smtp-Source: APXvYqw7FGdmAU7xcVGE/u+98yQ6KUSJpvpjWVisE8v6s1ByxKG2c+sZUyC6EXgZQVbFuJbU9e7APQ==
X-Received: by 2002:aa7:d985:: with SMTP id u5mr6460651eds.222.1562073607031; 
 Tue, 02 Jul 2019 06:20:07 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:569e:0:3106:d637:d723:e855])
 by smtp.gmail.com with ESMTPSA id g3sm4558034edh.24.2019.07.02.06.20.05
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 02 Jul 2019 06:20:05 -0700 (PDT)
Date: Tue, 2 Jul 2019 15:20:03 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Kenny Ho <y2kenny@gmail.com>
Subject: Re: [RFC PATCH v3 09/11] drm, cgroup: Add per cgroup bw measure and
 control
Message-ID: <20190702132003.GB15868@phenom.ffwll.local>
References: <20190626150522.11618-1-Kenny.Ho@amd.com>
 <20190626150522.11618-10-Kenny.Ho@amd.com>
 <20190626162554.GU12905@phenom.ffwll.local>
 <CAOWid-dO5QH4wLyN_ztMaoZtLM9yzw-FEMgk3ufbh1ahHJ2vVg@mail.gmail.com>
 <20190627061153.GD12905@phenom.ffwll.local>
 <CAOWid-dCkevUiN27pkwfPketdqS8O+ZGYu8vRMPY2GhXGaVARA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAOWid-dCkevUiN27pkwfPketdqS8O+ZGYu8vRMPY2GhXGaVARA@mail.gmail.com>
X-Operating-System: Linux phenom 4.19.0-5-amd64 
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=tzwvLHoODplnbHp8E5wmzRqBd3OOGVG/jeLS3EJmbkI=;
 b=PLQgsPgYBC/G9Xu6IxvRYvzAvQRalruQEH0a8dsSrM/GzFFEwvOGcjPQPO8gkjDj6L
 VAPFPhiDO0tL24ASu834S6tk4flGYFc7iVwXREVPsrVkjby6PD3rjVTPaMDeUho627RR
 vug066EctcLUKndhQWVVmmH+MAXfdNRYxOHqw=
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
Cc: joseph.greathouse@amd.com, Kenny Ho <Kenny.Ho@amd.com>, jsparks@cray.com,
 amd-gfx list <amd-gfx@lists.freedesktop.org>, lkaplan@cray.com,
 Alex Deucher <alexander.deucher@amd.com>,
 dri-devel <dri-devel@lists.freedesktop.org>, Tejun Heo <tj@kernel.org>,
 cgroups@vger.kernel.org,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBKdW4gMjgsIDIwMTkgYXQgMDM6NDk6MjhQTSAtMDQwMCwgS2VubnkgSG8gd3JvdGU6
Cj4gT24gVGh1LCBKdW4gMjcsIDIwMTkgYXQgMjoxMSBBTSBEYW5pZWwgVmV0dGVyIDxkYW5pZWxA
ZmZ3bGwuY2g+IHdyb3RlOgo+ID4gSSBmZWVsIGxpa2UgYSBiZXR0ZXIgYXBwcm9hY2ggd291bGQg
YnkgdG8gYWRkIGEgY2dyb3VwIGZvciB0aGUgdmFyaW91cwo+ID4gZW5naW5lcyBvbiB0aGUgZ3B1
LCBhbmQgdGhlbiBhbHNvIGFjY291bnQgYWxsIHRoZSBzZG1hIChvciB3aGF0ZXZlciB0aGUKPiA+
IG5hbWUgb2YgdGhlIGFtZCBjb3B5IGVuZ2luZXMgaXMgYWdhaW4pIHVzYWdlIGJ5IHR0bV9ibyBt
b3ZlcyB0byB0aGUgcmlnaHQKPiA+IGNncm91cC4gIEkgdGhpbmsgdGhhdCdzIGEgbW9yZSBtZWFu
aW5nZnVsIGxpbWl0YXRpb24uIEZvciBkaXJlY3QgdGhyYXNoaW5nCj4gPiBjb250cm9sIEkgdGhp
bmsgdGhlcmUncyBib3RoIG5vdCBlbm91Z2ggaW5mb3JtYXRpb24gYXZhaWxhYmxlIGluIHRoZQo+
ID4ga2VybmVsICh5b3UnZCBuZWVkIHNvbWUgcGVyZm9ybWFuY2UgY291bnRlcnMgdG8gd2F0Y2gg
aG93IG11Y2ggYmFuZHdpZHRoCj4gPiB1c2Vyc3BhY2UgYmF0Y2hlcy9DUyBhcmUgd2FzdGluZyks
IGFuZCBJIGRvbid0IHRoaW5rIHRoZSB0dG0gZXZpY3Rpb24KPiA+IGxvZ2ljIGlzIHJlYWR5IHRv
IHN0ZXAgb3ZlciBhbGwgdGhlIHByaW9yaXR5IGludmVyc2lvbiBpc3N1ZXMgdGhpcyB3aWxsCj4g
PiBicmluZyB1cC4gTWFuYWdpbmcgc2RtYSB1c2FnZSBvdG9oIHdpbGwgYmUgYSBsb3QgbW9yZSBz
dHJhaWdodGZvcndhcmQgKGJ1dAo+ID4gc3RpbGwgaGFzIGFsbCB0aGUgcHJpb3JpdHkgaW52ZXJz
aW9uIHByb2JsZW1zLCBidXQgaW4gdGhlIHNjaGVkdWxlciB0aGF0Cj4gPiBtaWdodCBiZSBlYXNp
ZXIgdG8gZml4IHBlcmhhcHMgd2l0aCB0aGUgZXhwbGljaXQgZGVwZW5kZW5jeSBncmFwaCAtIGlu
IHRoZQo+ID4gaTkxNSBzY2hlZHVsZXIgd2UgYWxyZWFkeSBoYXZlIHByaW9yaXR5IGJvb3N0aW5n
IGFmYWl1aSkuCj4gTXkgY29uY2VybiB3aXRoIGhvb2tpbmcgaW50byB0aGUgZW5naW5lLyBsb3dl
ciBsZXZlbCBpcyB0aGF0IHRoZQo+IGVuZ2luZSBtYXkgbm90IGJlIHByb2Nlc3MvY2dyb3VwIGF3
YXJlLiAgU28gdGhlIGJhbmR3aWR0aCB0cmFja2luZyBpcwoKV2h5IGlzIHRoZSBlbmdpbmUgbm90
IHByb2Nlc3MgYXdhcmU/IFRodXMgZmFyIGFsbCBjb21tYW5kIHN1Ym1pc3Npb24gSSdtCmF3YXJl
IG9mIGlzIGRvbmUgYnkgYSByZWFsIHByb2Nlc3MgZnJvbSB1c2Vyc3BhY2UgLi4uIHdlIHNob3Vs
ZCBiZSBhYmxlIHRvCnRyYWNrIHRoZXNlIHdpdGggY2dyb3VwcyBwZXJmZWN0bHkuCgo+IHBlciBk
ZXZpY2UuICBJIGFtIGFsc28gd29uZGVyaW5nIGlmIHRoaXMgaXMgYWxzbyBwb3RlbnRpYWxseSBi
ZSBhIGNhc2UKPiBvZiBwZXJmZWN0IGdldHRpbmcgaW4gdGhlIHdheSBvZiBnb29kLiAgV2hpbGUg
dHRtX2JvX2hhbmRsZV9tb3ZlX21lbQo+IG1heSBub3QgdHJhY2sgZXZlcnl0aGluZywgaXQgaXMg
c3RpbGwgYSBrZXkgZnVuY3Rpb24gZm9yIGEgbG90IG9mIHRoZQo+IG1lbW9yeSBvcGVyYXRpb24u
ICBBbHNvLCBpZiB0aGUgcHJvZ3JhbW1pbmcgbW9kZWwgaXMgZGVzaWduZWQgdG8KPiBieXBhc3Mg
dGhlIGtlcm5lbCB0aGVuIEkgYW0gbm90IHN1cmUgaWYgdGhlcmUgYXJlIGFueXRoaW5nIHRoZSBr
ZXJuZWwKPiBjYW4gZG8uICAoVGhpbmdzIGxpa2Uga2VybmVsLWJ5cGFzcyBuZXR3b3JrIHN0YWNr
IGNvbWVzIHRvIG1pbmQuKSAgQWxsCj4gdGhhdCBzYWlkLCBJIHdpbGwgY2VydGFpbmx5IGRpZyBk
ZWVwZXIgaW50byB0aGUgdG9waWMuCgpUaGUgcHJvYmxlbSBpcyB0aGVyZSdzIG5vdCBhIGZ1bGwg
YnlwYXNzIG9mIHRoZSBrZXJuZWwsIGFueSByZWFzb25hYmxlCndvcmtsb2FkIHdpbGwgbmVlZCBi
b3RoLiBCdXQgaWYgeW91IG9ubHkgY29udHJvbCBvbmUgc2lkZSBvZiB0aGUgYmFuZHdpZHRoCnVz
dWFnZSwgeW91J3JlIG5vdCByZWFsbHkgY29udHJvbGxpbmcgYW55dGhpbmcuCgpBbHNvLCB0aGlz
IGlzIHVhcGk6IFBlcmZlY3QgaXMgcHJldHR5IG11Y2ggdGhlIGJhciB3ZSBuZWVkIHRvIGNsZWFy
LCBhbnkKbWlzdGFrZSB3aWxsIGh1cnQgdXMgZm9yIHRoZSBuZXh0IDEwIHllYXJzIGF0IGxlYXN0
IDotKQoKYnR3IGlmIHlvdSBoYXZlbid0IHJlYWQgaXQgeWV0OiBUaGUgbHduIGFydGljbGUgYWJv
dXQgdGhlIG5ldyBibG9jayBpbwpjb250cm9sbGVyIGlzIHByZXR0eSBpbnRlcmVzdGluZy4gSSB0
aGluayB5b3UncmUgdHJ5aW5nIHRvIHNvbHZlIGEgc2ltaWxhcgpwcm9ibGVtIGhlcmU6CgpodHRw
czovL2x3bi5uZXQvU3Vic2NyaWJlckxpbmsvNzkyMjU2L2U2Njk4MjUyNGZhOTQ3N2IvCgpDaGVl
cnMsIERhbmllbAotLSAKRGFuaWVsIFZldHRlcgpTb2Z0d2FyZSBFbmdpbmVlciwgSW50ZWwgQ29y
cG9yYXRpb24KaHR0cDovL2Jsb2cuZmZ3bGwuY2gKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4v
bGlzdGluZm8vZHJpLWRldmVs
