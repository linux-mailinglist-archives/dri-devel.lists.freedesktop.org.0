Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 26393D2229
	for <lists+dri-devel@lfdr.de>; Thu, 10 Oct 2019 09:54:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E3E46EABE;
	Thu, 10 Oct 2019 07:54:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C805F6EABC;
 Thu, 10 Oct 2019 07:54:21 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id r19so5820805wmh.2;
 Thu, 10 Oct 2019 00:54:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:to:cc:references:from
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-transfer-encoding:content-language;
 bh=LdNfEg6ShiKdTWBOrm1JXzB9eIwJvqXOXCWkiTk/tIQ=;
 b=B9ZEm7Bmzn7T/2PMQjX5VzJMWesPgdzWsjeROlORuCsCdHFzTnTfytJ0euf7lr7Dsa
 vr2KUSjc6VAqj2yBMy4MLlExKaiIJZw19LcvZfH9mwizsvy6gp/fgpvX7J9wiJlnYVH7
 unfc9Wm0jjMYxn8K4OF6ZsdEwZ61xwb91I2XCxImQA5HZM8Aqd2ck204PGocmT84hHlH
 7UXHC0o+TzPNty4vrq5z6819VEhJaafuW/CB+Zi++82cdVNd0tVIPyszZgzE+RCkUcxw
 T2/umW37zLJonKo63uEgcizkHz3LgFSM/Ng07nEgKuXdS0xNAxwIfFkj+EilIY1KiaFg
 y+rA==
X-Gm-Message-State: APjAAAUI6KxLjzCQugP4PBnua9SPpNoLnQYBF/d1dpyvfzatH+8c0Jzr
 /rgV59VsfYqjxo10l5pgaGjaG+UG
X-Google-Smtp-Source: APXvYqywU+JYcAflNEicSBJjWc8H0O1qwGZEnGVV5d+f4TZ4//RnWOOQXz2bsKdbuDfKyK4c5FLIGg==
X-Received: by 2002:a1c:ed0d:: with SMTP id l13mr6332675wmh.54.1570694060212; 
 Thu, 10 Oct 2019 00:54:20 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7?
 ([2a02:908:1252:fb60:be8a:bd56:1f94:86e7])
 by smtp.gmail.com with ESMTPSA id 36sm7135719wrp.30.2019.10.10.00.54.19
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 10 Oct 2019 00:54:19 -0700 (PDT)
Subject: Re: [PATCH 1/2] drm/nouveau: move io_reserve_lru handling into the
 driver
To: Daniel Vetter <daniel@ffwll.ch>
References: <20190930131254.31071-1-christian.koenig@amd.com>
 <20191009153934.GJ16989@phenom.ffwll.local>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <0c20edc1-f336-c194-f4a5-bc0ce9d67fd8@gmail.com>
Date: Thu, 10 Oct 2019 09:54:18 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20191009153934.GJ16989@phenom.ffwll.local>
Content-Language: en-US
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=reply-to:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=LdNfEg6ShiKdTWBOrm1JXzB9eIwJvqXOXCWkiTk/tIQ=;
 b=g4LsIdE7iTu8tjxjnfdGYyprLE5TpuXNzL0OOXeFx5+e/Z9q5OvgWuqT5xduYcbSST
 IblTrQTMly40nvGd8+7+Q+XV1+Bl7KNbqEXuOC92rkMdZFJ4XBp9DXj/P/VSYO0FlQ1f
 kwRAbNDSr7PSasCzXoDx5frDvJ8nDQiOdsHkEDAF672LLJNwZviqUg2Z5xAM4MjOUohM
 ON5HSIzI0APp5hwukojtM+0h6peEFIY/cQEx6PirfAab/yng7LnPlHQUcjGfygNFu10I
 grovmDyy29Lr0MSGQzW4QUrN8XcSf+Dr1V0JkCBYRXwp6I/WUo7442iISLWdUPW2hqut
 DJGA==
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
Reply-To: christian.koenig@amd.com
Cc: airlied@linux.ie, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, bskeggs@redhat.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMDkuMTAuMTkgdW0gMTc6Mzkgc2NocmllYiBEYW5pZWwgVmV0dGVyOgo+IE9uIE1vbiwgU2Vw
IDMwLCAyMDE5IGF0IDAzOjEyOjUzUE0gKzAyMDAsIENocmlzdGlhbiBLw7ZuaWcgd3JvdGU6Cj4g
W1NOSVBdCj4+ICtzdGF0aWMgdm1fZmF1bHRfdCBub3V2ZWF1X3R0bV9mYXVsdChzdHJ1Y3Qgdm1f
ZmF1bHQgKnZtZikKPj4gK3sKPj4gKwlzdHJ1Y3Qgdm1fYXJlYV9zdHJ1Y3QgKnZtYSA9IHZtZi0+
dm1hOwo+PiArCXN0cnVjdCB0dG1fYnVmZmVyX29iamVjdCAqYm8gPSB2bWEtPnZtX3ByaXZhdGVf
ZGF0YTsKPj4gKwlwZ3Byb3RfdCBwcm90Owo+PiArCXZtX2ZhdWx0X3QgcmV0Owo+PiArCj4+ICsJ
cmV0ID0gdHRtX2JvX3ZtX3Jlc2VydmUoYm8sIHZtZik7Cj4+ICsJaWYgKHJldCkKPj4gKwkJcmV0
dXJuIHJldDsKPj4gKwo+PiArCW5vdXZlYXVfYm9fZGVsX2lvX3Jlc2VydmVfbHJ1KGJvKTsKPiBJ
c24ndCB0aGlzIG9wZW5pbmcgdXAgYSBjYW4gb2Ygd29ybXMgKGluIHRoZW9yeSkgd2hlcmUgYSBs
b3Qgb2YgY29uY3VycmVudAo+IGZhdWx0cyB3aWxsIGFsbCBmYWlsIGJlY2F1c2UgdGhleSdyZSBh
bGwgcmVtb3ZlZCB0aGVtc2VsdmVzIGZyb20gdGhlIGxydSwKPiBzbyBjYW4ndCBzZWUgYW55b25l
IGVsc2UgdG8gdGhyb3cgb3V0Pwo+Cj4gU2FtZSBwcm9ibGVtIHJlYWxseSB0aGF0IHR0bSBoYWQg
KHdlbGwgc3RpbGwgaGFzIEkgdGhpbmsgZm9yICFhbWRncHUpIHdpdGgKPiBpdHMgb3RoZXIgbHJ1
IC4uLgo+Cj4gT3IgYW0gSSBnZXR0aW5nIHRvdGFsbHkgbG9zdCBhZ2FpbiBoZXJlPwoKTm8sIHlv
dXIgYXJlIHByZXR0eSBtdWNoIGNvcnJlY3QuIEJ1dCB3ZSBhcmUgbm90IG9wZW5pbmcgdXAgdGhh
dCBjYW4gb2YgCndvcm1zLCBpdCBoYXMgYmVlbiBoZXJlIGZvciBsaWtlIGFsd2F5cy4KCllvdSBq
dXN0IG5lZWQgdG8gaW1hZ2luZSB0aGF0IHlvdSBoYXZlIHR3byBwcm9jZXNzZXMga2lja2luZyBv
dXQgdGhlIApwYWdlIHRhYmxlcyBvZiBlYWNoIG90aGVyIGJlZm9yZSBzb21lYm9keSBoYWQgYSBj
aGFuY2UgdG8gbWFrZSBwcm9ncmVzcy4gClRoaXMgd2lsbCBqdXN0IGxvb3AgZm9yZXZlciA6KQoK
VGhlIGNvcnJlY3Qgc29sdXRpb24gaXMgdG8gbm90IHVzZSBhIEJPIGJhc2VkIGFwcHJvYWNoIGF0
IGFsbCwgYnV0IApyYXRoZXIgYSB3aW5kb3cgYmFzZWQgYXBwcm9hY2ggd2hlcmUgeW91IGhhdmUg
YW4gTFJVIG9mIHRoZSB3aW5kb3cgeW91IApnYXZlIG91dCBsYXN0IHRvIGFjY2VzcyBzb21ldGhp
bmcuIFRoaXMgd2F5IHlvdSBoYXZlIGEgbXVjaCBsYXJnZXIgCm51bWJlciBvZiB3aW5kb3dzIHlv
dSBjYW4gdXNlICg0ayBpZiB5b3UgdXNlIDY0a0Igd2luZG93IHNpemUgb24gYSAyNTZNQiAKQkFS
KS4KClRoaXMgd2F5IHlvdSBjYW4gc2FmZWx5IGFzc3VtZSB0aGF0IHRoZSBudW1iZXIgb2Ygd2lu
ZG93cyB5b3UgaGF2ZSAKYXZhaWxhYmxlIGlzIGFsd2F5cyBsYXJnZXIgdGhhbiB0aGUgbnVtYmVy
IG9mIGZhdWx0cyB5b3UgY2FuIHByb2Nlc3MgYXQgCnRoZSBzYW1lIHRpbWUuIEJ1dCB0aGF0IHdv
dWxkIHJlcXVpcmUgcXVpdGUgYSBidW5jaCBvZiBjaGFuZ2VzIGZvciBUVE0gCmFzIHdlbGwgYXMg
bm91dmVhdS4KCkJUVzogVGhpcyBpcyBvbmUgb2YgdGhlIHJlYXNvbnMgKGFkZGl0aW9uYWwgdG8g
dGhhdCBpdCBpcyBob3JyaWJsZSBzbG93KSAKd2h5IHdlIG5ldmVyIHVzZWQgdGhlIHJlbWFwcGlu
ZyBmZWF0dXJlIG9uIEFNRCBoYXJkd2FyZSBmb3IgTGludXguCgpSZWdhcmRzLApDaHJpc3RpYW4u
Cgo+IC1EYW5pZWwKPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRl
dmVs
