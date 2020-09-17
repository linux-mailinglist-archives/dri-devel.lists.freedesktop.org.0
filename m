Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ED0A826D4A7
	for <lists+dri-devel@lfdr.de>; Thu, 17 Sep 2020 09:26:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A71D06E180;
	Thu, 17 Sep 2020 07:26:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kapsi.fi (mail.kapsi.fi [IPv6:2001:67c:1be8::25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F26AA6E180
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Sep 2020 07:26:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
 s=20161220; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=GGGsLVujs/uHJ07NhvsVtGBnxX9a+r2uLCeXPx2mgvc=; b=ILiIQABHWh6z0TH/lsqyKjIXiH
 WAG2OJjXIfYuiNHFwpYZbehPJlQtYs2ITFs50ImmzWB5gxVDACtbEWqWbu+MEtgAEon/RYQR/ribf
 Weg0ipJpjJZTJJ48AOTV1BrI4dU0EI4d2AScqb5uQ/rLrS3gl5JhHhpmQ7HMB04wfm0kyNc0lQ64/
 6+shy4IIhQceJY1eMJOnPJNiQTen2ZkTKvD/muFvmx1DluBnXz8DHxZi8fn5vV+ELzA5gaBt4lQv9
 d+E+O3UZ9vzSDSiREWxz5F0qfIEjf/rXaQQqq0AIU5KOw1R9nXfa4pHzb/AUfeErPBrrPGjBH7MQ0
 FZpP895g==;
Received: from dsl-hkibng22-54f986-236.dhcp.inet.fi ([84.249.134.236]
 helo=[192.168.1.10])
 by mail.kapsi.fi with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.89) (envelope-from <cyndis@kapsi.fi>)
 id 1kIoIy-0002cj-Lf; Thu, 17 Sep 2020 10:26:08 +0300
Subject: Re: [RFC PATCH v2 13/17] gpu: host1x: Reset max value when freeing a
 syncpoint
To: Dmitry Osipenko <digetx@gmail.com>,
 Mikko Perttunen <mperttunen@nvidia.com>, thierry.reding@gmail.com,
 jonathanh@nvidia.com, airlied@linux.ie, daniel@ffwll.ch
References: <20200905103420.3021852-1-mperttunen@nvidia.com>
 <20200905103420.3021852-14-mperttunen@nvidia.com>
 <b4b3ae98-4ccb-152a-deda-2da81d1c46ef@gmail.com>
 <0d12991e-3599-c5bf-11e5-78031f0f8088@kapsi.fi>
 <343e4518-e132-6ea8-6169-0685f000b89c@gmail.com>
From: Mikko Perttunen <cyndis@kapsi.fi>
Message-ID: <04e2ddf9-c1d9-0a43-fbf2-85bfcd3a5a6a@kapsi.fi>
Date: Thu, 17 Sep 2020 10:25:55 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <343e4518-e132-6ea8-6169-0685f000b89c@gmail.com>
Content-Language: en-US
X-SA-Exim-Connect-IP: 84.249.134.236
X-SA-Exim-Mail-From: cyndis@kapsi.fi
X-SA-Exim-Scanned: No (on mail.kapsi.fi); SAEximRunCond expanded to false
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
Cc: linux-tegra@vger.kernel.org, talho@nvidia.com, bhuntsman@nvidia.com,
 dri-devel@lists.freedesktop.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gOS8xNy8yMCAxMjozNyBBTSwgRG1pdHJ5IE9zaXBlbmtvIHdyb3RlOgo+IDE2LjA5LjIwMjAg
MjM6NDMsIE1pa2tvIFBlcnR0dW5lbiDQv9C40YjQtdGCOgo+IC4uLgo+Pj4gUGxlYXNlIG5vdGUg
dGhhdCB0aGUgc3luYyBwb2ludCBzdGF0ZSBhY3R1YWxseSBuZWVkcyB0byBiZSBjb21wbGV0ZWx5
Cj4+PiByZXNldCBhdCB0aGUgc3luYyBwb2ludCByZXF1ZXN0LXRpbWUgYmVjYXVzZSBib3RoIGRv
d25zdHJlYW0gZmFzdGJvb3QKPj4+IGFuZCB1cHN0cmVhbSB1LWJvb3QgWzFdIGFyZSBuZWVkbGVz
c2x5IGVuYWJsaW5nIGRpc3BsYXkgVkJMQU5LIGludGVycnVwdAo+Pj4gdGhhdCBjb250aW51b3Vz
bHkgaW5jcmVtZW50cyBzeW5jIHBvaW50ICMyNiBkdXJpbmcgb2Yga2VybmVsIGJvb3QgdW50aWwK
Pj4+IGRpc3BsYXkgY29udHJvbGxlciBpcyByZXNldC4KPj4+Cj4+PiBbMV0KPj4+IGh0dHBzOi8v
Z2l0aHViLmNvbS91LWJvb3QvdS1ib290L2Jsb2IvbWFzdGVyL2RyaXZlcnMvdmlkZW8vdGVncmEu
YyNMMTU1Cj4+Pgo+Pj4gSGVuY2Ugb25jZSBzeW5jIHBvaW50ICMyNiBpcyByZXF1ZXN0ZWQsIGl0
IHdpbGwgaGF2ZSBhIGRpcnR5IHN0YXRlLiBTbwo+Pj4gZmFyIHRoaXMgZG9lc24ndCBoYXZlIGFu
eSB2aXNpYmxlIGVmZmVjdCBiZWNhdXNlIHN5bmMgcG9pbnRzIGFyZW4ndCB1c2VkCj4+PiBtdWNo
Lgo+Pj4KPj4KPj4gTWF5YmUgd2UgY2FuIGluc3RlYWQgcmVzZXJ2ZSBzeW5jcG9pbnRzIHRoYXQg
bWlnaHQgYmUgdXNlZCBieSB0aGUgYm9vdAo+PiBjaGFpbiwgYW5kIG9ubHkgYWxsb3cgYWxsb2Nh
dGluZyB0aGVtIG9uY2UgdGhlIGRpc3BsYXkgZHJpdmVyIGhhcyBhY2tlZAo+PiB0aGF0IHRoZSBz
eW5jcG9pbnQgd2lsbCBubyBsb25nZXIgYmUgaW5jcmVtZW50ZWQ/IFRoYXQgd2F5IGlmIHRoZQo+
PiBkaXNwbGF5IGRyaXZlciBpcyBkaXNhYmxlZCBmb3Igc29tZSByZWFzb24gd2UnbGwgc3RpbGwg
YmUgZmluZS4KPiAKPiBzb3VuZHMgZ29vZAo+IAo+PiBMb29raW5nIGF0IHRoZSBkb3duc3RyZWFt
IGRyaXZlciwgaXQgKHN0aWxsLCBvbiBuZXcgY2hpcHMuLikgcmVzZXJ2ZXMKPj4gdGhlIGZvbGxv
d2luZyBzeW5jcG9pbnRzOgo+Pgo+PiAtIDEwIChBVlApCj4+IC0gMjIgKDNEKQo+PiAtIDI2IChW
QkxBTkswKQo+PiAtIDI3IChWQkxBTksxKQo+Pgo+PiBhbmQgc2F5cyB0aGF0IHRoaXMgYXBwbGll
cyB0byBUMjAsIFQzMCwgVDExNCBhbmQgVDE0OC4KPj4KPj4gSSBzdXBwb3NlIGlmIHlvdSBoYXZl
bid0IG9ic2VydmVkIHRoaXMgaGFwcGVuaW5nIHRvIG90aGVyIHN5bmNwb2ludHMKPj4gdGhhbiAy
NiwgdGhlbiByZXNlcnZpbmcgMjYgd291bGQgcHJvYmFibHkgYmUgZW5vdWdoLgo+IAo+IEkgb25s
eSBzYXcgU1AgMjYgYmVpbmcgdXNlZCBieSB0aGUgREMsIGJ1dCBwZXJoYXBzIHRoYXQgbWF5IHZh
cnkgZnJvbQo+IGRldmljZSB0byBkZXZpY2UgYW5kIFNQIDI3IGNvdWxkIGFjdHVhbGx5IGJlIHVz
ZWQgaW4gYSB3aWxkIGFzIHdlbGwuCj4gCj4gSSB0aGluayB0aGUgQVZQIFNQIHNob3VsZCBvbmx5
IHJlbGF0ZSB0byB0aGUgQVZQLWZpcm13YXJlIHRoYXQgdXBzdHJlYW0KPiBkb2Vzbid0IHN1cHBv
cnQsIHNvIHdlIGNhbiBpZ25vcmUgaXRzIHJlc2VydmF0aW9uLgo+IAo+IEkndmUgbm8gaWRlYSB3
aGF0IG1heSB1c2UgdGhlIDNEIFNQLgo+IAoKTXkgZ3Vlc3MgaXMgdGhhdCBzb21lIHZlcnkgb2xk
IGNvZGUgdXNlZCBmaXhlZCBzeW5jcG9pbnQgbnVtYmVycyBzbyAKdGhlc2Ugd2VyZSBhZGRlZCB0
byB0aGUgcmVzZXJ2YXRpb24gbGlzdC4gTGV0J3MgcmVzZXJ2ZSAyNiBhbmQgMjcsIHRoYXQgCnNo
b3VsZCBiZSBzaW1wbGUgZW5vdWdoIHNpbmNlIGJvdGggd291bGQgYmUgInJlbGVhc2VkIiBieSB0
aGUgZGlzcGxheSAKZHJpdmVyLgoKTWlra28KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlz
dGluZm8vZHJpLWRldmVsCg==
