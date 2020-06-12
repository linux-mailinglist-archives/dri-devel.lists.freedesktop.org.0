Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B3B0B1F7672
	for <lists+dri-devel@lfdr.de>; Fri, 12 Jun 2020 12:02:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D1B9F6E90E;
	Fri, 12 Jun 2020 10:02:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D38B6E90D;
 Fri, 12 Jun 2020 10:02:14 +0000 (UTC)
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
 [83.86.89.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id D2E41207D8;
 Fri, 12 Jun 2020 10:02:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1591956134;
 bh=l002a0NI7RcMCZFY1NEScRszB3jXR41FbOH3xKTIu0Q=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=cGQdHZmQx6Iz8xd3sx/auS+VvqT2rGKjwfQDZ8h/dBY2N2tzM5D3OjiRqCBIJdRNt
 k3ZsGLsKQ0VDgLNZVywYD8ZTtz+nDSJlguxS1fAIOQyJNqOCsAgLELeYzZMjTiVfh1
 0hwtFX08T7047fYPzwaBnokj2V2ZnBXqxMNnMqdI=
Date: Fri, 12 Jun 2020 12:02:05 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Markus Elfring <Markus.Elfring@web.de>
Subject: Re: [PATCH] drm/msm: Fix memory leak in msm_submitqueue_create()
Message-ID: <20200612100205.GD3157576@kroah.com>
References: <acd53f06-845b-75e0-24c5-40c751d12945@web.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <acd53f06-845b-75e0-24c5-40c751d12945@web.de>
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
Cc: Sean Paul <sean@poorly.run>, opensource.kernel@vivo.com,
 David Airlie <airlied@linux.ie>, Bernard Zhao <bernard@vivo.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBKdW4gMTIsIDIwMjAgYXQgMTE6Mzc6MzNBTSArMDIwMCwgTWFya3VzIEVsZnJpbmcg
d3JvdGU6Cj4gPiBJbiBmdWNudGluIG1zbV9zdWJtaXRxdWV1ZV9jcmVhdGUsIHRoZSBxdWV1ZSBp
cyBhIGxvY2FsCj4gPiB2YXJpYWJsZSwgaW4gcmV0dXJuIC1FSU5WQUwgYnJhbmNoLCBxdWV1ZSBk
aWRuYHQgYWRkIHRvIGN0eGBzCj4gPiBsaXN0IHlldCwgYW5kIGFsc28gZGlkbmB0IGtmcmVlLCB0
aGlzIG1heWJlIGJyaW5nIGluIHBvdGVudGlhbAo+ID4gbWVtbGVhay4KPiAKPiBJIHN1Z2dlc3Qg
dG8gaW1wcm92ZSBhbHNvIHRoaXMgY2hhbmdlIGRlc2NyaXB0aW9uLgo+IEhvdyBkbyB5b3UgdGhp
bmsgYWJvdXQgYSB3b3JkaW5nIHZhcmlhbnQgbGlrZSB0aGUgZm9sbG93aW5nPwo+IAo+ICAgIFJl
bGVhc2UgdGhlIEdQVSBzdWJtaXNzaW9uIHF1ZXVlIG9iamVjdCBhZnRlciBhbiBpbnB1dCBwYXJh
bWV0ZXIgdmFsaWRhdGlvbiBmYWlsZWQuCj4gCj4gCj4gV291bGQgeW91IGxpa2UgdG8gYWRkIHRo
ZSB0YWcg4oCcRml4ZXPigJ0gdG8gdGhlIGNvbW1pdCBtZXNzYWdlPwo+IGh0dHBzOi8vZ2l0Lmtl
cm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L3RvcnZhbGRzL2xpbnV4LmdpdC90cmVl
L0RvY3VtZW50YXRpb24vcHJvY2Vzcy9zdWJtaXR0aW5nLXBhdGNoZXMucnN0P2lkPWI3OTFkMWJk
ZjkyMTJkOTQ0ZDc0OWE1YzdmZjZmZWJkYmEyNDE3NzEjbjE4Mwo+IAo+IAo+IEhvdyBkbyB5b3Ug
dGhpbmsgYWJvdXQgdG8gcmVvcmRlciBhbnkgc3RhdGVtZW50cyBmb3IgdGhpcyBmdW5jdGlvbiBp
bXBsZW1lbnRhdGlvbj8KPiAKPiBSZWdhcmRzLAo+IE1hcmt1cwoKSGksCgpUaGlzIGlzIHRoZSBz
ZW1pLWZyaWVuZGx5IHBhdGNoLWJvdCBvZiBHcmVnIEtyb2FoLUhhcnRtYW4uCgpNYXJrdXMsIHlv
dSBzZWVtIHRvIGhhdmUgc2VudCBhIG5vbnNlbnNpY2FsIG9yIG90aGVyd2lzZSBwb2ludGxlc3MK
cmV2aWV3IGNvbW1lbnQgdG8gYSBwYXRjaCBzdWJtaXNzaW9uIG9uIGEgTGludXgga2VybmVsIGRl
dmVsb3BlciBtYWlsaW5nCmxpc3QuICBJIHN0cm9uZ2x5IHN1Z2dlc3QgdGhhdCB5b3Ugbm90IGRv
IHRoaXMgYW55bW9yZS4gIFBsZWFzZSBkbyBub3QKYm90aGVyIGRldmVsb3BlcnMgd2hvIGFyZSBh
Y3RpdmVseSB3b3JraW5nIHRvIHByb2R1Y2UgcGF0Y2hlcyBhbmQKZmVhdHVyZXMgd2l0aCBjb21t
ZW50cyB0aGF0LCBpbiB0aGUgZW5kLCBhcmUgYSB3YXN0ZSBvZiB0aW1lLgoKUGF0Y2ggc3VibWl0
dGVyLCBwbGVhc2UgaWdub3JlIE1hcmt1cydzIHN1Z2dlc3Rpb247IHlvdSBkbyBub3QgbmVlZCB0
bwpmb2xsb3cgaXQgYXQgYWxsLiAgVGhlIHBlcnNvbi9ib3QvQUkgdGhhdCBzZW50IGl0IGlzIGJl
aW5nIGlnbm9yZWQgYnkKYWxtb3N0IGFsbCBMaW51eCBrZXJuZWwgbWFpbnRhaW5lcnMgZm9yIGhh
dmluZyBhIHBlcnNpc3RlbnQgcGF0dGVybiBvZgpiZWhhdmlvciBvZiBwcm9kdWNpbmcgZGlzdHJh
Y3RpbmcgYW5kIHBvaW50bGVzcyBjb21tZW50YXJ5LCBhbmQKaW5hYmlsaXR5IHRvIGFkYXB0IHRv
IGZlZWRiYWNrLiAgUGxlYXNlIGZlZWwgZnJlZSB0byBhbHNvIGlnbm9yZSBlbWFpbHMKZnJvbSB0
aGVtLgoKdGhhbmtzLAoKZ3JlZyBrLWgncyBwYXRjaCBlbWFpbCBib3QKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApk
cmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
