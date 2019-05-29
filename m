Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4649B2FB06
	for <lists+dri-devel@lfdr.de>; Thu, 30 May 2019 13:40:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE9506E250;
	Thu, 30 May 2019 11:39:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.codeaurora.org (smtp.codeaurora.org [198.145.29.96])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 62C656E0D1
 for <dri-devel@lists.freedesktop.org>; Wed, 29 May 2019 20:43:37 +0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
 id 402FA60A00; Wed, 29 May 2019 20:43:37 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 pdx-caf-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=2.0 tests=ALL_TRUSTED,BAYES_00,
 DKIM_INVALID,DKIM_SIGNED,SPF_NONE autolearn=no autolearn_force=no
 version=3.4.0
Received: from [10.226.58.28] (i-global254.qualcomm.com [199.106.103.254])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: jhugo@smtp.codeaurora.org)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 77B97606DB;
 Wed, 29 May 2019 20:43:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 77B97606DB
Subject: Re: [PATCH] drm/msm/dsi: add protection against NULL dsi device
To: Abhinav Kumar <abhinavk@codeaurora.org>, Sean Paul <sean@poorly.run>
References: <1551922134-22518-1-git-send-email-abhinavk@codeaurora.org>
 <20190307215947.GG114153@art_vandelay>
 <cd4c2e25f2785bc09da77e715a3d6c30@codeaurora.org>
From: Jeffrey Hugo <jhugo@codeaurora.org>
Message-ID: <5ae613db-092c-f93d-dd96-a79a4e1eff3a@codeaurora.org>
Date: Wed, 29 May 2019 14:43:32 -0600
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <cd4c2e25f2785bc09da77e715a3d6c30@codeaurora.org>
Content-Language: en-US
X-Mailman-Approved-At: Thu, 30 May 2019 11:39:54 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=codeaurora.org; s=default; t=1559162617;
 bh=qBy4lmW9DGF9/YaBsWNd/qvMetf/baE4+9e9TucgeSs=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=PQIVOfZ18XZPxTjlgze5ceTwVT8YtzJN3LQdV41i6SPxLOPyInVk5CSQEfL7zDMAX
 TfKg3OU/2mh3yzCSNvxS5bvQiRLLxYpg1IYD6NzLF5Nn784/aneKzwyBsjgKR4Odxs
 URUZFt/MIlEJE8c7ZGKXR+848PC57ojR2OKLhc6U=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=codeaurora.org; s=default; t=1559162616;
 bh=qBy4lmW9DGF9/YaBsWNd/qvMetf/baE4+9e9TucgeSs=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=C967cVxnpJt/5AFVP1nto9BFxVfh0EFMGqw07CZTR4Gs6alujtc7WQ0OopW+80NIq
 TjmCHRUFZKJAqJZLhQo4iBRlFYB6ciJ3oXU+e0AvBYZ4hS8RsS7ovR2AejIsO9tlm5
 OtCnuloyXru/kMhcS9IvaCnTve77NnWJgrstcYTk=
X-Mailman-Original-Authentication-Results: pdx-caf-mail.web.codeaurora.org;
 dmarc=none (p=none dis=none)
 header.from=codeaurora.org
X-Mailman-Original-Authentication-Results: pdx-caf-mail.web.codeaurora.org;
 spf=none
 smtp.mailfrom=jhugo@codeaurora.org
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
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 seanpaul@chromium.org, hoegsberg@google.com, chandanu@codeaurora.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMy83LzIwMTkgMzowMiBQTSwgQWJoaW5hdiBLdW1hciB3cm90ZToKPiBPbiAyMDE5LTAzLTA3
IDEzOjU5LCBTZWFuIFBhdWwgd3JvdGU6Cj4+IE9uIFdlZCwgTWFyIDA2LCAyMDE5IGF0IDA1OjI4
OjU0UE0gLTA4MDAsIEFiaGluYXYgS3VtYXIgd3JvdGU6Cj4+PiBXaGVuIHBhbmVsIHByb2JlIGhh
cHBlbnMgYWZ0ZXIgRFNJIHByb2JlLCB0aGUgRFNJIHByb2JlCj4+PiBpcyBkZWZlcnJlZCBhcyBw
ZXIgY3VycmVudCBkZXNpZ24uIEluIHRoZSBwcm9iZSBkZWZlciBwYXRoCj4+PiBkc2kgZGV2aWNl
IGlzIGRlc3Ryb3llZC4gVGhpcyBOVUxMIGRzaSBkZXZpY2UgY291bGQgYmUKPj4+IGRlZmVyZW5j
ZWQgYnkgdGhlIHBhbmVsIHByb2JlIGluIHRoZSBtaXBpX2RzaV9hdHRhY2ggcGF0aC4KPj4+Cj4+
PiBDaGVjayBmb3IgTlVMTCBkc2kgZGV2aWNlIGJlZm9yZSBhY2Nlc3NpbmcgaXQuCj4+Cj4+IEl0
IHdvdWxkIGJlIHJlYWxseSBuaWNlIHRvIHNvcnQgYWxsIG9mIHRoaXMgb3V0IGluIGEgbWFubmVy
IHRoYXQncyBub3QKPj4gc3ByaW5rbGluZyBOVUxMIGNoZWNrcyBhcm91bmQgdGhlIGRyaXZlci4g
SSBzcGVudCA1IG1pbnV0ZXMgbG9va2luZyAKPj4gYXJvdW5kIGFuZAo+PiBjb3VsZG4ndCByZWFs
bHkgbWFrZSBzZW5zZSBvZiBob3cgYWxsIG9mIHRoZXNlIHBpZWNlcyBpbnRlcmFjdCwgYnV0IAo+
PiB0aGlzIHNlZW1zCj4+IGxpa2UgaXQgbWlnaHQgYmUgYW4gYXJjaGl0ZWN0dXJhbCBwcm9ibGVt
IChwZXJoYXBzIHNpbmNlIGRwdSB3YXMgdXNpbmcgCj4+IGl0cyBvd24KPj4gcGFuZWwgc3R1ZmYg
aW5zdGVhZCBvZiBkcm1fcGFuZWw/KS4KPj4KPj4gQW55d2F5cywgaXQnZCBiZSBuaWNlIHRvIGZp
eCB0aGF0Lgo+Pgo+PiBJbiB0aGUgbWVhbnRpbWUsIGNvdWxkIHlvdSBwbGVhc2UgYWRkIGEgYmln
IGNvbW1lbnQgbGlrZSB0aGUgIWRldiAKPj4gY2hlY2sgaW4gdGhpcwo+PiBmdW5jdGlvbiBleHBs
YWluaW5nIGhvdyB0aGlzIHNpdHVhdGlvbiBjYW4gY29tZSB0byBwYXNzPyBUaGF0IHdheSB0aGUg
Cj4+IGtub3dsZWRnZQo+PiBpc24ndCBsb3N0IGFuZCB3aG9ldmVyIGNvbWVzIGFsb25nIHRvIGNs
ZWFuIHVwIGFsbCBvZiB0aGVzZSBwcm9iZSAKPj4gY2hlY2tzIHdpbGwKPj4gaGF2ZSBzb21lIGNs
dWUgYXMgdG8gd2hhdCdzIGdvaW5nIG9uLgo+Pgo+PiBTZWFuCj4gW0FiaGluYXZdIFN1cmUgU2Vh
biwgd2lsbCBhZGQgYSBkZXRhaWxlZCBjb21tZW50IHRvIGV4cGxhaW4gdGhlIHNjZW5hcmlvCgpB
YmhpbmF2LCBpdCBsb29rcyBsaWtlIHRoaXMgbWF5IGhhdmUgZHJvcHBlZCBvZmYgeW91ciByYWRh
ci4gIERvIHlvdSAKa25vdyB3aGVuIHlvdSdsbCBjb21lIGJhY2sgdG8gaXQ/Cgo+Pgo+Pj4KPj4+
IFJlcG9ydGVkLWJ5OiBKZWZmcmV5IEh1Z28gPGpodWdvQGNvZGVhdXJvcmEub3JnPgo+Pj4gVGVz
dGVkLWJ5OiBKZWZmcmV5IEh1Z28gPGpodWdvQGNvZGVhdXJvcmEub3JnPgo+Pj4gU2lnbmVkLW9m
Zi1ieTogQWJoaW5hdiBLdW1hciA8YWJoaW5hdmtAY29kZWF1cm9yYS5vcmc+Cj4+PiAtLS0KPj4+
IMKgZHJpdmVycy9ncHUvZHJtL21zbS9kc2kvZHNpX21hbmFnZXIuYyB8IDIgKy0KPj4+IMKgMSBm
aWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCj4+Pgo+Pj4gZGlmZiAt
LWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9tc20vZHNpL2RzaV9tYW5hZ2VyLmMgCj4+PiBiL2RyaXZl
cnMvZ3B1L2RybS9tc20vZHNpL2RzaV9tYW5hZ2VyLmMKPj4+IGluZGV4IDgwYWE2MzQuLmNjMjU2
OWQgMTAwNjQ0Cj4+PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vbXNtL2RzaS9kc2lfbWFuYWdlci5j
Cj4+PiArKysgYi9kcml2ZXJzL2dwdS9kcm0vbXNtL2RzaS9kc2lfbWFuYWdlci5jCj4+PiBAQCAt
NzY5LDcgKzc2OSw3IEBAIGJvb2wgbXNtX2RzaV9tYW5hZ2VyX2NtZF94ZmVyX3RyaWdnZXIoaW50
IGlkLCB1MzIgCj4+PiBkbWFfYmFzZSwgdTMyIGxlbikKPj4+IMKgdm9pZCBtc21fZHNpX21hbmFn
ZXJfYXR0YWNoX2RzaV9kZXZpY2UoaW50IGlkLCB1MzIgZGV2aWNlX2ZsYWdzKQo+Pj4gwqB7Cj4+
PiDCoMKgwqDCoCBzdHJ1Y3QgbXNtX2RzaSAqbXNtX2RzaSA9IGRzaV9tZ3JfZ2V0X2RzaShpZCk7
Cj4+PiAtwqDCoMKgIHN0cnVjdCBkcm1fZGV2aWNlICpkZXYgPSBtc21fZHNpLT5kZXY7Cj4+PiAr
wqDCoMKgIHN0cnVjdCBkcm1fZGV2aWNlICpkZXYgPSBtc21fZHNpID8gbXNtX2RzaS0+ZGV2IDog
TlVMTDsKPj4+IMKgwqDCoMKgIHN0cnVjdCBtc21fZHJtX3ByaXZhdGUgKnByaXY7Cj4+PiDCoMKg
wqDCoCBzdHJ1Y3QgbXNtX2ttcyAqa21zOwo+Pj4gwqDCoMKgwqAgc3RydWN0IGRybV9lbmNvZGVy
ICplbmNvZGVyOwo+Pj4gLS0gCj4+PiBUaGUgUXVhbGNvbW0gSW5ub3ZhdGlvbiBDZW50ZXIsIElu
Yy4gaXMgYSBtZW1iZXIgb2YgdGhlIENvZGUgQXVyb3JhIAo+Pj4gRm9ydW0sCj4+PiBhIExpbnV4
IEZvdW5kYXRpb24gQ29sbGFib3JhdGl2ZSBQcm9qZWN0Cj4+PgoKCi0tIApKZWZmcmV5IEh1Z28K
UXVhbGNvbW0gRGF0YWNlbnRlciBUZWNobm9sb2dpZXMgYXMgYW4gYWZmaWxpYXRlIG9mIFF1YWxj
b21tIApUZWNobm9sb2dpZXMsIEluYy4KUXVhbGNvbW0gVGVjaG5vbG9naWVzLCBJbmMuIGlzIGEg
bWVtYmVyIG9mIHRoZQpDb2RlIEF1cm9yYSBGb3J1bSwgYSBMaW51eCBGb3VuZGF0aW9uIENvbGxh
Ym9yYXRpdmUgUHJvamVjdC4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJp
LWRldmVs
