Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DEC041F766B
	for <lists+dri-devel@lfdr.de>; Fri, 12 Jun 2020 12:01:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7936D6E905;
	Fri, 12 Jun 2020 10:01:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 015B66E905;
 Fri, 12 Jun 2020 10:01:41 +0000 (UTC)
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
 [83.86.89.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 3DE6A207D8;
 Fri, 12 Jun 2020 10:01:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1591956101;
 bh=IBzrqa8288WHt0Vr+2XSR3sZwtmgNbA3oFvFtV3/1MQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=V2vPFMorhf1SoQns9I/vVtVFeBl5WXxk3cGLGvcK//oMZ6nuV87wkamGEdT9lVhuA
 5/Oh1w5iuhlsKrHP4iiWxu7+icB1Rf0xEcwk16Ht5CJX6iPxFHhhdRK7+eyyxemqAL
 jwWFREBmJhoD2QZdkNWo5iPAze0FaCHpdXyg46S8=
Date: Fri, 12 Jun 2020 12:01:32 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Markus Elfring <Markus.Elfring@web.de>
Subject: Re: [PATCH] drm/msm: Improve exception handling in
 msm_gpu_crashstate_capture()
Message-ID: <20200612100132.GB3157576@kroah.com>
References: <56a615b6-9881-ff01-fa0f-8ea070fc03e7@web.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <56a615b6-9881-ff01-fa0f-8ea070fc03e7@web.de>
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
 kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBKdW4gMTIsIDIwMjAgYXQgMDk6MzY6MDlBTSArMDIwMCwgTWFya3VzIEVsZnJpbmcg
d3JvdGU6Cj4gPiBGdW5jdGlvbiBtc21fZ3B1X2NyYXNoc3RhdGVfY2FwdHVyZSBtYXliZSBjYWxs
ZWQgZm9yIHNldmVyYWwKPiA+IHRpbWVzLCBhbmQgdGhlbiB0aGUgc3RhdGUtPmJvcyBpcyBhIHBv
dGVudGlhbCBtZW1sZWFrLiBBbHNvCj4gPiB0aGUgc3RhdGUtPnBvcyBtYXliZSBhbGxvYyBmYWls
ZWQsIGJ1dCBub3cgd2l0aG91dCBhbnkgaGFuZGxlLgo+ID4gVGhpcyBjaGFuZ2UgaXMgdG8gZml4
IHNvbWUgcG90ZW50aWFsIG1lbWxlYWsgYW5kIGFkZCBlcnJvcgo+ID4gaGFuZGxlIHdoZW4gYWxs
b2MgZmFpbGVkLgo+IAo+IEkgc3VnZ2VzdCB0byBpbXByb3ZlIHRoZSBwcm92aWRlZCBpbmZvcm1h
dGlvbi4KPiBIb3cgZG8geW91IHRoaW5rIGFib3V0IGEgd29yZGluZyB2YXJpYW50IGxpa2UgdGhl
IGZvbGxvd2luZz8KPiAKPiAgICBUaGUgZnVuY3Rpb24g4oCcbXNtX2dwdV9jcmFzaHN0YXRlX2Nh
cHR1cmXigJ0gY2FuIGJlIGNhbGxlZCBtdWx0aXBsZSB0aW1lcy4KPiAgICBUaGUgbWVtYmVycyDi
gJxjb21t4oCdLCDigJxjbWTigJ0gYW5kIOKAnGJvc+KAnSBvZiB0aGUgZGF0YSBzdHJ1Y3R1cmUg
4oCcbXNtX2dwdV9zdGF0ZeKAnQo+ICAgIGFyZSByZWFzc2lnbmVkIHdpdGggcG9pbnRlcnMgYWNj
b3JkaW5nIHRvIGR5bmFtaWMgbWVtb3J5IGFsbG9jYXRpb25zCj4gICAgaWYgdGhlIHByZXByb2Nl
c3NvciBzeW1ib2wg4oCcQ09ORklHX0RFVl9DT1JFRFVNUOKAnSB3YXMgZGVmaW5lZC4KPiAgICBC
dXQgdGhlIGZ1bmN0aW9uIOKAnGtmcmVl4oCdIHdhcyBub3QgY2FsbGVkIGZvciB0aGVtIGJlZm9y
ZS4KPiAKPiAgICBUaHVzIGFkZCBtaXNzaW5nIGFjdGlvbnMuCj4gICAgKiBSZWxlYXNlIHByZXZp
b3VzIG9iamVjdHMuCj4gICAgKiBVc2UgZnVydGhlciBudWxsIHBvaW50ZXIgY2hlY2tzLgo+ICAg
ICogQ29tcGxldGUgdGhlIGNvcnJlc3BvbmRpbmcgZXhjZXB0aW9uIGhhbmRsaW5nLgo+IAo+IAo+
IFdvdWxkIHlvdSBsaWtlIHRvIGFkZCB0aGUgdGFnIOKAnEZpeGVz4oCdIHRvIHRoZSBjb21taXQg
bWVzc2FnZT8KPiBodHRwczovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dp
dC90b3J2YWxkcy9saW51eC5naXQvdHJlZS9Eb2N1bWVudGF0aW9uL3Byb2Nlc3Mvc3VibWl0dGlu
Zy1wYXRjaGVzLnJzdD9pZD1iNzkxZDFiZGY5MjEyZDk0NGQ3NDlhNWM3ZmY2ZmViZGJhMjQxNzcx
I24xODMKPiAKPiAKCkhpLAoKVGhpcyBpcyB0aGUgc2VtaS1mcmllbmRseSBwYXRjaC1ib3Qgb2Yg
R3JlZyBLcm9haC1IYXJ0bWFuLgoKTWFya3VzLCB5b3Ugc2VlbSB0byBoYXZlIHNlbnQgYSBub25z
ZW5zaWNhbCBvciBvdGhlcndpc2UgcG9pbnRsZXNzCnJldmlldyBjb21tZW50IHRvIGEgcGF0Y2gg
c3VibWlzc2lvbiBvbiBhIExpbnV4IGtlcm5lbCBkZXZlbG9wZXIgbWFpbGluZwpsaXN0LiAgSSBz
dHJvbmdseSBzdWdnZXN0IHRoYXQgeW91IG5vdCBkbyB0aGlzIGFueW1vcmUuICBQbGVhc2UgZG8g
bm90CmJvdGhlciBkZXZlbG9wZXJzIHdobyBhcmUgYWN0aXZlbHkgd29ya2luZyB0byBwcm9kdWNl
IHBhdGNoZXMgYW5kCmZlYXR1cmVzIHdpdGggY29tbWVudHMgdGhhdCwgaW4gdGhlIGVuZCwgYXJl
IGEgd2FzdGUgb2YgdGltZS4KClBhdGNoIHN1Ym1pdHRlciwgcGxlYXNlIGlnbm9yZSBNYXJrdXMn
cyBzdWdnZXN0aW9uOyB5b3UgZG8gbm90IG5lZWQgdG8KZm9sbG93IGl0IGF0IGFsbC4gIFRoZSBw
ZXJzb24vYm90L0FJIHRoYXQgc2VudCBpdCBpcyBiZWluZyBpZ25vcmVkIGJ5CmFsbW9zdCBhbGwg
TGludXgga2VybmVsIG1haW50YWluZXJzIGZvciBoYXZpbmcgYSBwZXJzaXN0ZW50IHBhdHRlcm4g
b2YKYmVoYXZpb3Igb2YgcHJvZHVjaW5nIGRpc3RyYWN0aW5nIGFuZCBwb2ludGxlc3MgY29tbWVu
dGFyeSwgYW5kCmluYWJpbGl0eSB0byBhZGFwdCB0byBmZWVkYmFjay4gIFBsZWFzZSBmZWVsIGZy
ZWUgdG8gYWxzbyBpZ25vcmUgZW1haWxzCmZyb20gdGhlbS4KCnRoYW5rcywKCmdyZWcgay1oJ3Mg
cGF0Y2ggZW1haWwgYm90Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1k
ZXZlbAo=
