Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CAC9631E9BD
	for <lists+dri-devel@lfdr.de>; Thu, 18 Feb 2021 13:29:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A7DF6E239;
	Thu, 18 Feb 2021 12:28:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from z11.mailgun.us (z11.mailgun.us [104.130.96.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 26E726E239
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Feb 2021 12:28:55 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1613651336; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: To:
 Subject: Sender; bh=WEzANxiP3GHuNQy3hHp2JvLyxuMJKQC5W5/UU/dl9I4=;
 b=ogj+WmnZ7ocg360aA4CeSDC/DcFChyUfd8CVt2KF4NQb1lZu37hebL1A+gzshuZDEYiKj+gA
 UcNuc/qZZGwclqV2UTStrUwAHlJBXiWyraQnPMflWK9S1gJTwUfnNz3TeY96I5C4jZJj/0sm
 Uqapmi5U0WCPHDQurN1qE8g9ZZE=
X-Mailgun-Sending-Ip: 104.130.96.11
X-Mailgun-Sid: WyJkOTU5ZSIsICJkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n03.prod.us-east-1.postgun.com with SMTP id
 602e5d82e68a5ebff89bf3bc (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 18 Feb 2021 12:28:50
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id CBB7BC433C6; Thu, 18 Feb 2021 12:28:49 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
 NICE_REPLY_A,SPF_FAIL,URIBL_BLOCKED autolearn=no autolearn_force=no
 version=3.4.0
Received: from [192.168.1.105] (unknown [117.217.236.228])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: akhilpo)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 03C19C433C6;
 Thu, 18 Feb 2021 12:28:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 03C19C433C6
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=akhilpo@codeaurora.org
Subject: Re: [PATCH] drm/msm/a6xx: fix for kernels without CONFIG_NVMEM
To: Jonathan Marek <jonathan@marek.ca>, Rob Clark <robdclark@gmail.com>,
 freedreno <freedreno@lists.freedesktop.org>, Sean Paul <sean@poorly.run>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
 Eric Anholt <eric@anholt.net>, Sharat Masetty <smasetty@codeaurora.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <dri-devel@lists.freedesktop.org>,
 open list <linux-kernel@vger.kernel.org>
References: <20210216200909.19039-1-jonathan@marek.ca>
 <CAF6AEGv53nnzqMgTfSA6t2YpHx1dDW8UqnH9Gw0w3p8bf0mTLw@mail.gmail.com>
 <775436ba-c94a-ab22-d65b-b2391047ec65@codeaurora.org>
 <20210217190820.GA2229@jcrouse1-lnx.qualcomm.com>
 <CAF6AEGsHws23ozeJ8G23LFQ8J=CVVrx5xvkSgBuE_uSwT4YurQ@mail.gmail.com>
 <74d1277e-295f-0996-91c3-05cfce8d3a0e@marek.ca>
From: Akhil P Oommen <akhilpo@codeaurora.org>
Message-ID: <e4b62857-bd4d-cca6-0d6b-b9cc960b52a2@codeaurora.org>
Date: Thu, 18 Feb 2021 17:58:42 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <74d1277e-295f-0996-91c3-05cfce8d3a0e@marek.ca>
Content-Language: en-US
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMi8xOC8yMDIxIDI6MDUgQU0sIEpvbmF0aGFuIE1hcmVrIHdyb3RlOgo+IE9uIDIvMTcvMjEg
MzoxOCBQTSwgUm9iIENsYXJrIHdyb3RlOgo+PiBPbiBXZWQsIEZlYiAxNywgMjAyMSBhdCAxMTow
OCBBTSBKb3JkYW4gQ3JvdXNlIAo+PiA8amNyb3VzZUBjb2RlYXVyb3JhLm9yZz4gd3JvdGU6Cj4+
Pgo+Pj4gT24gV2VkLCBGZWIgMTcsIDIwMjEgYXQgMDc6MTQ6MTZQTSArMDUzMCwgQWtoaWwgUCBP
b21tZW4gd3JvdGU6Cj4+Pj4gT24gMi8xNy8yMDIxIDg6MzYgQU0sIFJvYiBDbGFyayB3cm90ZToK
Pj4+Pj4gT24gVHVlLCBGZWIgMTYsIDIwMjEgYXQgMTI6MTAgUE0gSm9uYXRoYW4gTWFyZWsgPGpv
bmF0aGFuQG1hcmVrLmNhPiAKPj4+Pj4gd3JvdGU6Cj4+Pj4+Pgo+Pj4+Pj4gSWdub3JlIG52bWVt
X2NlbGxfZ2V0KCkgRU9QTk9UU1VQUCBlcnJvciBpbiB0aGUgc2FtZSB3YXkgYXMgYSAKPj4+Pj4+
IEVOT0VOVCBlcnJvciwKPj4+Pj4+IHRvIGZpeCB0aGUgY2FzZSB3aGVyZSB0aGUga2VybmVsIHdh
cyBjb21waWxlZCB3aXRob3V0IENPTkZJR19OVk1FTS4KPj4+Pj4+Cj4+Pj4+PiBGaXhlczogZmU3
OTUyYzYyOWRhICgiZHJtL21zbTogQWRkIHNwZWVkLWJpbiBzdXBwb3J0IHRvIGE2MTggZ3B1IikK
Pj4+Pj4+IFNpZ25lZC1vZmYtYnk6IEpvbmF0aGFuIE1hcmVrIDxqb25hdGhhbkBtYXJlay5jYT4K
Pj4+Pj4+IC0tLQo+Pj4+Pj4gwqAgZHJpdmVycy9ncHUvZHJtL21zbS9hZHJlbm8vYTZ4eF9ncHUu
YyB8IDYgKysrLS0tCj4+Pj4+PiDCoCAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCAz
IGRlbGV0aW9ucygtKQo+Pj4+Pj4KPj4+Pj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0v
bXNtL2FkcmVuby9hNnh4X2dwdS5jIAo+Pj4+Pj4gYi9kcml2ZXJzL2dwdS9kcm0vbXNtL2FkcmVu
by9hNnh4X2dwdS5jCj4+Pj4+PiBpbmRleCBiYThlOWQzY2YwZmUuLjdmZTVkOTc2MDZhYSAxMDA2
NDQKPj4+Pj4+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9tc20vYWRyZW5vL2E2eHhfZ3B1LmMKPj4+
Pj4+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9tc20vYWRyZW5vL2E2eHhfZ3B1LmMKPj4+Pj4+IEBA
IC0xMzU2LDEwICsxMzU2LDEwIEBAIHN0YXRpYyBpbnQgYTZ4eF9zZXRfc3VwcG9ydGVkX2h3KHN0
cnVjdCAKPj4+Pj4+IGRldmljZSAqZGV2LCBzdHJ1Y3QgYTZ4eF9ncHUgKmE2eHhfZ3B1LAo+Pj4+
Pj4KPj4+Pj4+IMKgwqDCoMKgwqDCoMKgwqAgY2VsbCA9IG52bWVtX2NlbGxfZ2V0KGRldiwgInNw
ZWVkX2JpbiIpOwo+Pj4+Pj4gwqDCoMKgwqDCoMKgwqDCoCAvKgo+Pj4+Pj4gLcKgwqDCoMKgwqDC
oMKgICogLUVOT0VOVCBtZWFucyB0aGF0IHRoZSBwbGF0Zm9ybSBkb2Vzbid0IHN1cHBvcnQgCj4+
Pj4+PiBzcGVlZGJpbiB3aGljaCBpcwo+Pj4+Pj4gLcKgwqDCoMKgwqDCoMKgICogZmluZQo+Pj4+
Pj4gK8KgwqDCoMKgwqDCoMKgICogLUVOT0VOVCBtZWFucyBubyBzcGVlZCBiaW4gaW4gZGV2aWNl
IHRyZWUsCj4+Pj4+PiArwqDCoMKgwqDCoMKgwqAgKiAtRU9QTk9UU1VQUCBtZWFucyBrZXJuZWwg
d2FzIGJ1aWx0IHdpdGhvdXQgQ09ORklHX05WTUVNCj4+Pj4+Cj4+Pj4+IHZlcnkgbWlub3Igbml0
LCBpdCB3b3VsZCBiZSBuaWNlIHRvIGF0IGxlYXN0IHByZXNlcnZlIHRoZSBnaXN0IG9mIHRoZQo+
Pj4+PiAid2hpY2ggaXMgZmluZSIgKGllLiBzb21lIHZhcmlhdGlvbiBvZiAidGhpcyBpcyBhbiBv
cHRpb25hbCB0aGluZyBhbmQKPj4+Pj4gdGhpbmdzIHdvbid0IGNhdGNoIGZpcmUgd2l0aG91dCBp
dCIgOy0pKQo+Pj4+Pgo+Pj4+PiAod2hpY2ggaXMsIEkgYmVsaWV2ZSwgaXMgdHJ1ZSwgaG9wZWZ1
bGx5IEFraGlsIGNvdWxkIGNvbmZpcm0uLiBpZiBub3QKPj4+Pj4gd2Ugc2hvdWxkIGhhdmUgYSBo
YXJkZXIgZGVwZW5kZW5jeSBvbiBDT05GSUdfTlZNRU0uLikKPj4+PiBJSVJDLCBpZiB0aGUgZ3B1
IG9wcCB0YWJsZSBpbiB0aGUgRFQgdXNlcyB0aGUgJ29wcC1zdXBwb3J0ZWQtaHcnIAo+Pj4+IHBy
b3BlcnR5LAo+Pj4+IHdlIHdpbGwgc2VlIHNvbWUgZXJyb3IgZHVyaW5nIGJvb3QgdXAgaWYgd2Ug
ZG9uJ3QgY2FsbAo+Pj4+IGRldl9wbV9vcHBfc2V0X3N1cHBvcnRlZF9odygpLiBTbyBjYWxsaW5n
ICJudm1lbV9jZWxsX2dldChkZXYsIAo+Pj4+ICJzcGVlZF9iaW4iKSIKPj4+PiBpcyBhIHdheSB0
byB0ZXN0IHRoaXMuCj4+Pj4KPj4+PiBJZiB0aGVyZSBpcyBubyBvdGhlciBoYXJtLCB3ZSBjYW4g
cHV0IGEgaGFyZCBkZXBlbmRlbmN5IG9uIAo+Pj4+IENPTkZJR19OVk1FTS4KPj4+Cj4+PiBJJ20g
bm90IHN1cmUgaWYgd2Ugd2FudCB0byBnbyB0aGlzIGZhciBnaXZlbiB0aGUgc3F1aXNoaW5lc3Mg
YWJvdXQgCj4+PiBtb2R1bGUKPj4+IGRlcGVuZGVuY2llcy4gQXMgZmFyIGFzIEkga25vdyB3ZSBh
cmUgdGhlIG9ubHkgZHJpdmVyIHRoYXQgdXNlcyB0aGlzIAo+Pj4gc2VyaW91c2x5Cj4+PiBvbiBR
Q09NIFNvQ3MgYW5kIHRoaXMgaXMgb25seSBuZWVkZWQgZm9yIGNlcnRhaW4gdGFyZ2V0cy4gSSBk
b24ndCAKPj4+IGtub3cgaWYgd2UKPj4+IHdhbnQgdG8gZm9yY2UgZXZlcnkgdGFyZ2V0IHRvIGJ1
aWxkIE5WTUVNIGFuZCBRRlBST00gb24gb3VyIGJlaGFsZi4gCj4+PiBCdXQgbWF5YmUKPj4+IEkn
bSBqdXN0IHNheWluZyB0aGF0IGJlY2F1c2UgS2NvbmZpZyBkZXBlbmRlbmNpZXMgdGVuZCB0byBi
cmVhayBteSAKPj4+IGJyYWluIChhbmQKPj4+IHRoZW4gQXJuZCBoYXMgdG8gc2VuZCBhIHBhdGNo
IHRvIGZpeCBpdCkuCj4+Pgo+Pgo+PiBIbW0sIGdvb2QgcG9pbnQuLiBsb29rcyBsaWtlIENPTkZJ
R19OVk1FTSBpdHNlbGYgZG9lc24ndCBoYXZlIGFueQo+PiBvdGhlciBkZXBlbmRlbmNpZXMsIHNv
IEkgc3VwcG9zZSBpdCB3b3VsZG4ndCBiZSB0aGUgZW5kIG9mIHRoZSB3b3JsZAo+PiB0byBzZWxl
Y3QgdGhhdC4uIGJ1dCBJIGd1ZXNzIHdlIGRvbid0IHdhbnQgdG8gcmVxdWlyZSBRRlBST00KPj4K
Pj4gSSBndWVzcyBhdCB0aGUgZW5kIG9mIHRoZSBkYXksIHdoYXQgaXMgdGhlIGZhaWx1cmUgbW9k
ZSBpZiB5b3UgaGF2ZSBhCj4+IHNwZWVkLWJpbiBkZXZpY2UsIGJ1dCB5b3VyIGtlcm5lbCBjb25m
aWcgbWlzc2VzIFFGUFJPTSAoYW5kIHBvc3NpYmx5Cj4+IE5WTUVNKT/CoCBJZiB0aGUgcmVzdWx0
IGlzIGp1c3Qgbm90IGhhdmluZyB0aGUgaGlnaGVzdCBjbGsgcmF0ZShzKQoKQXRsZWFzdCBvbiBz
YzcxODAncyBncHUsIHVzaW5nIGFuIHVuc3VwcG9ydGVkIEZNQVggYnJlYWtzIGdtdS4gSXQgd29u
J3QgCmJlIHZlcnkgb2J2aW91cyB3aGF0IHdlbnQgd3Jvbmcgd2hlbiB0aGlzIGhhcHBlbnMhCgot
QWtoaWwuCgo+PiBhdmFpbGFibGUsIHRoYXQgaXNuJ3QgdGhlIGVuZCBvZiB0aGUgd29ybGQuwqAg
QnV0IGlmIGl0IG1ha2VzIHRoaW5ncwo+PiBub3Qtd29yaywgdGhhdCBpcyBzdWItb3B0aW1hbC7C
oCBHZW5lcmFsbHksIGVzcGVjaWFsbHkgb24gQVJNLCBrY29uZmlnCj4+IHNlZW1zIHRvIGJlIHdh
eSBoYXJkZXIgdGhhbiBpdCBzaG91bGQgYmUgdG8gYnVpbGQgYSBrZXJuZWwgdGhhdCB3b3JrcywK
Pj4gaWYgd2UgY291bGQgc29tZWhvdyBub3QgYWRkIHRvIHRoYXQgcHJvYmxlbSAoZm9yIGJvdGgg
cGVvcGxlIHdpdGggYTZ4eAo+PiBhbmQgb2xkZXIgZ2VucykgdGhhdCB3b3VsZCBiZSBuaWNlIDst
KQo+Pgo+IAo+IFRoZXJlIGlzIGEgImltcGx5IiBrY29uZmlnIG9wdGlvbiB3aGljaCBzb2x2ZXMg
ZXhhY3RseSB0aGlzIHByb2JsZW0uIAo+ICh5b3Ugd291bGQgImltcGx5IE5WTUVNIiBpbnN0ZWFk
IG9mICJzZWxlY3QgTlZNRU0iLiB0aGVuIGl0IHdvdWxkIGJlIAo+IHBvc3NpYmxlIHRvIGRpc2Fi
bGUgTlZNRU0gYnV0IGl0IHdvdWxkIGdldCBlbmFibGVkIGJ5IGRlZmF1bHQpCj4gCj4+IEJSLAo+
PiAtUgo+Pgo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Cj4gZHJpLWRldmVsIG1haWxpbmcgbGlzdAo+IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKPiBodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1k
ZXZlbAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJp
LWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
