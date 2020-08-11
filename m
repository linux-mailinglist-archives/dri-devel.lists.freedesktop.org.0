Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 743652425D1
	for <lists+dri-devel@lfdr.de>; Wed, 12 Aug 2020 09:05:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 98AF96E8B8;
	Wed, 12 Aug 2020 07:05:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from merlin.infradead.org (merlin.infradead.org
 [IPv6:2001:8b0:10b:1231::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F10E86E7EC;
 Tue, 11 Aug 2020 20:21:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=merlin.20170209; h=Content-Transfer-Encoding:Content-Type:
 In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender
 :Reply-To:Content-ID:Content-Description;
 bh=mu8ZGHCtLzfb4Q1brYigGzESLOWdAu8Y0s2c7XTplC8=; b=284/OXxnHd747ZUgC23m/S9th+
 7fU/+S+BrIfZAzGbDCJ9hKskEz65vFxHjCYXwR4+nsltIHh+uEV/PLGeTNtQC67TxZlyxTE5fERG2
 NXdSnWsZnb/Br3YZBMqcz/n7ERi4JfJoRq4CuklWCIfbeneuN0b9BMPvKXOGFde8FCQ7gV/5EY9PW
 pZfsQHsKAwqKnIugSYP8VXO1scYbxv1Ti4ZmOQP0BlDCVlv01mHc9AYEw7lLzmQXUzL1u22oywuqC
 lXrNFtsh2UvZp5u61MAbyx9tQ/22xMJ+iZ1Du7AaVB5bNd8V+n7m8NM23Jiv/GMi2iAQPbVGGq32e
 bsdMdEgw==;
Received: from [2601:1c0:6280:3f0::19c2]
 by merlin.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k5amB-0001WQ-HM; Tue, 11 Aug 2020 20:21:39 +0000
Subject: Re: [PATCH v9 3/5] drm/msm/dp: add support for DP PLL driver
To: tanmay@codeaurora.org
References: <20200807071718.17937-1-tanmay@codeaurora.org>
 <20200807071718.17937-4-tanmay@codeaurora.org>
 <3b0d0e49-5fe8-e217-4ddc-1ff08e65ab48@infradead.org>
 <CAF6AEGv5Yf1x7aCEauP7XtzTjpUCxJt6_GzxFhFXyf_DX_Gi+g@mail.gmail.com>
 <159683184187.1360974.15575847254880429529@swboyd.mtv.corp.google.com>
 <75acac5a-b4a5-9c5a-4404-fb936d738e46@infradead.org>
 <639438051c1b2fe1d9bec5f6343a6dec@codeaurora.org>
From: Randy Dunlap <rdunlap@infradead.org>
Message-ID: <7222ceca-9fe2-f91b-4129-5a70952875f7@infradead.org>
Date: Tue, 11 Aug 2020 13:21:32 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <639438051c1b2fe1d9bec5f6343a6dec@codeaurora.org>
Content-Language: en-US
X-Mailman-Approved-At: Wed, 12 Aug 2020 07:05:21 +0000
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
Cc: David Airlie <airlied@linux.ie>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Stephen Boyd <swboyd@chromium.org>, khsieh@codeaurora.org,
 Sean Paul <seanpaul@chromium.org>, Abhinav Kumar <abhinavk@codeaurora.org>,
 Vara Reddy <varar@codeaurora.org>, aravindh@codeaurora.org,
 freedreno <freedreno@lists.freedesktop.org>,
 Chandan Uddaraju <chandanu@codeaurora.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gOC8xMS8yMCAxMjo0OSBQTSwgdGFubWF5QGNvZGVhdXJvcmEub3JnIHdyb3RlOgo+IE9uIDIw
MjAtMDgtMDcgMTM6MjgsIFJhbmR5IER1bmxhcCB3cm90ZToKPj4gT24gOC83LzIwIDE6MjQgUE0s
IFN0ZXBoZW4gQm95ZCB3cm90ZToKPj4+IFF1b3RpbmcgUm9iIENsYXJrICgyMDIwLTA4LTA3IDA4
OjUxOjQ4KQo+Pj4+IE9uIEZyaSwgQXVnIDcsIDIwMjAgYXQgODoyNyBBTSBSYW5keSBEdW5sYXAg
PHJkdW5sYXBAaW5mcmFkZWFkLm9yZz4KPj4+PiB3cm90ZToKPj4+Pj4KPj4+Pj4gT24gOC83LzIw
IDEyOjE3IEFNLCBUYW5tYXkgU2hhaCB3cm90ZToKPj4+Pj4+IGRpZmYgLS1naXQgYS9kcml2ZXJz
L2dwdS9kcm0vbXNtL0tjb25maWcgYi9kcml2ZXJzL2dwdS9kcm0vbXNtL0tjb25maWcKPj4+Pj4+
IGluZGV4IGVhM2M0ZDA5NGQwOS4uY2MxMzkyYjI5MDIyIDEwMDY0NAo+Pj4+Pj4gLS0tIGEvZHJp
dmVycy9ncHUvZHJtL21zbS9LY29uZmlnCj4+Pj4+PiArKysgYi9kcml2ZXJzL2dwdS9kcm0vbXNt
L0tjb25maWcKPj4+Pj4+IEBAIC02MCw2ICs2MCw3IEBAIGNvbmZpZyBEUk1fTVNNX0hETUlfSERD
UAo+Pj4+Pj4gwqBjb25maWcgRFJNX01TTV9EUAo+Pj4+Pj4gwqDCoMKgwqDCoCBib29sICJFbmFi
bGUgRFAgc3VwcG9ydCBpbiBNU00gRFJNIGRyaXZlciIKPj4+Pj4+IMKgwqDCoMKgwqAgZGVwZW5k
cyBvbiBEUk1fTVNNCj4+Pj4+PiArwqDCoMKgwqAgZGVmYXVsdCB5Cj4+Pj4+PiDCoMKgwqDCoMKg
IGhlbHAKPj4+Pj4+IMKgwqDCoMKgwqDCoMKgIENvbXBpbGUgaW4gc3VwcG9ydCBmb3IgRFAgZHJp
dmVyIGluIG1zbSBkcm0gZHJpdmVyLiBEUCBleHRlcm5hbAo+Pj4+Pj4gwqDCoMKgwqDCoMKgwqAg
ZGlzcGxheSBzdXBwb3J0IGlzIGVuYWJsZWQgdGhyb3VnaCB0aGlzIGNvbmZpZyBvcHRpb24uIEl0
IGNhbgo+Pj4+Pgo+Pj4+PiBIaSwKPj4+Pj4KPj4+Pj4gWW91IG5lZWQgYSB2ZXJ5IHN0cm9uZyBq
dXN0aWZpY2F0aW9uIHRvIG1ha2UgYW4gb3B0aW9uYWwgcGFydCBvZiBhCj4+Pj4+IGRyaXZlcgo+
Pj4+PiB0byBiZSAiZGVmYXVsdCB5Ii4KPj4+Pgo+Pj4+IE15IG9waW5pb24gaXMgdGhhdCBpZiB0
aGUgZHJpdmVyIGlzIGJ1aWx0LCBldmVyeXRoaW5nIHNob3VsZCBiZSBidWlsdC4KPj4+PiBUaGlz
IGlzIHdoYXQgbWFrZXMgc2Vuc2UgZm9yIGRpc3RybydzLsKgIEl0IGlzIG9ubHkgdGhlIGVtYmVk
ZGVkIGNhc2UKPj4+PiB3aGVyZSB5b3Ugd2FudCB0byB0cmltIGRvd24gdW5uZWVkZWQgZmVhdHVy
ZXMgd2hlcmUgeW91IG1pZ2h0IHdhbnQgdG8KPj4+PiBkaXNhYmxlIHNvbWUgcGFydHMuwqAgU28g
J2RlZmF1bHQgeScgbWFrZXMgc2Vuc2UgdG8gbWUuCj4+Cj4+IFdlIGRvbid0IHNldCBkZWZhdWx0
cyBmb3IgZGlzdHJvIGNvbnZlbmllbmNlLgo+Pgo+Pj4KPj4+IE1heWJlIHVzZSAnZGVmYXVsdCBE
Uk1fTVNNJyBzbyB0aGF0IGl0IGRvZXNuJ3QgdHJpZ2dlciB0aGUgJ2RlZmF1bHQgeScKPj4+IGZp
bHRlcnMgcGVvcGxlIGhhdmU/Cj4+Cj4+IE1vc3QgcGVvcGxlIGNhbiBmaWd1cmUgdGhhdCBvbmUg
b3V0LsKgIDspCj4+IEkgZG9uJ3QgaGF2ZSBhbnkgYXV0b21hdGVkIGZpbHRlcnMuCj4gCj4gQWZ0
ZXIgYWZ0ZXIgZnVydGhlciByZXZpZXdzLCBJIGFncmVlIHdpdGggUm9iLiBEaXNwbGF5IFBvcnQg
aXMgcmVxdWlyZWQgbW9kdWxlIGFzIG9mIG5vdyBzbyBpdCBtYWtlcyBzZW5zZSB0byBrZWVwICdk
ZWZhdWx0IHknLgoKSWYgaXQgaXMgcmVxdWlyZWQsIHRoZW4geW91IGRvbid0IG5lZWQgdG8gaGF2
ZSBhIEtjb25maWcgZW50cnkvc3ltYm9sIGZvciBpdC4KCgotLSAKflJhbmR5CgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBs
aXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVz
a3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
