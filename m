Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 57A70A1A3FE
	for <lists+dri-devel@lfdr.de>; Thu, 23 Jan 2025 13:13:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4DF9310E7F4;
	Thu, 23 Jan 2025 12:13:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="gnpKJjIm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 090CF10E7F3;
 Thu, 23 Jan 2025 12:13:44 +0000 (UTC)
Received: from smtp2.mailbox.org (smtp2.mailbox.org
 [IPv6:2001:67c:2050:b231:465::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4Yf0GW75cTz9sX2;
 Thu, 23 Jan 2025 13:13:39 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; 
 t=1737634420; h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0+7fVHRTKElHIrMWMKEDgFUHTZ0B53rnunyjSKs1E10=;
 b=gnpKJjImu/YQ19v6Zpg9rBZulFKUFHnD/GH5+YNRjv2tZbJk2lBEyPvR5aXVjSjuxsHmyL
 azsdywWxONg3ylq7gFjBaDOErXHVrhsqAvdXndqulHzRKQ10SdEEzagz+4Z3dgtmUZHQil
 I+nHCW3ihPnRWxn1mJe3pP6lFPkc+JZl2G5umz8Ll84v3PMDEbrjzcDI9be4qNqj+ObLda
 viFV7BRw8Cjy5quxQKLqLMHeyOAnkgU1NJ2y3vmG3c06U9vzddGxWwO4eJtqtLrzjk33IQ
 RwlUQiV+HeVyh5daGwiSGWff1zHBxod4PkdwLjLgeaUowmil0D34K11LE0+Y3A==
Message-ID: <e7414579afbfc25d4027471bc265ee48e7d25932.camel@mailbox.org>
Subject: Re: [PATCH] drm/sched: Use struct for drm_sched_init() params
From: Philipp Stanner <phasta@mailbox.org>
To: =?ISO-8859-1?Q?Ma=EDra?= Canal <mcanal@igalia.com>, Philipp Stanner
 <phasta@kernel.org>, Alex Deucher <alexander.deucher@amd.com>, Christian
 =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>, Xinhui Pan
 <Xinhui.Pan@amd.com>, David Airlie <airlied@gmail.com>, Simona Vetter
 <simona@ffwll.ch>, Lucas Stach <l.stach@pengutronix.de>, Russell King
 <linux+etnaviv@armlinux.org.uk>,  Christian Gmeiner
 <christian.gmeiner@gmail.com>, Frank Binns <frank.binns@imgtec.com>, Matt
 Coster <matt.coster@imgtec.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>,  Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Qiang Yu <yuq825@gmail.com>,  Rob
 Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, Konrad Dybcio
 <konradybcio@kernel.org>,  Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Marijn Suijten
 <marijn.suijten@somainline.org>, Karol Herbst <kherbst@redhat.com>, Lyude
 Paul <lyude@redhat.com>, Danilo Krummrich <dakr@kernel.org>, Boris
 Brezillon <boris.brezillon@collabora.com>, Rob Herring <robh@kernel.org>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Luben Tuikov <ltuikov89@gmail.com>, Matthew Brost
 <matthew.brost@intel.com>, Melissa Wen <mwen@igalia.com>, Lucas De Marchi
 <lucas.demarchi@intel.com>, Thomas =?ISO-8859-1?Q?Hellstr=F6m?=
 <thomas.hellstrom@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Sunil Khatri <sunil.khatri@amd.com>,  Lijo Lazar <lijo.lazar@amd.com>,
 Mario Limonciello <mario.limonciello@amd.com>, Ma Jun <Jun.Ma2@amd.com>, 
 Yunxiang Li <Yunxiang.Li@amd.com>
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, etnaviv@lists.freedesktop.org, 
 lima@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, 
 freedreno@lists.freedesktop.org, nouveau@lists.freedesktop.org, 
 intel-xe@lists.freedesktop.org
Date: Thu, 23 Jan 2025 13:13:25 +0100
In-Reply-To: <ec4bb0f6-c366-40e7-a1df-332458b08eec@igalia.com>
References: <20250122140818.45172-3-phasta@kernel.org>
 <24f1c52f-1768-47de-88e3-d4104969d0a9@igalia.com>
 <9713798aa175aef2041e6d688ac4814006f789bc.camel@redhat.com>
 <ec4bb0f6-c366-40e7-a1df-332458b08eec@igalia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MBO-RS-META: atku7wpwx957w9o4ftqprfosj6p5jofp
X-MBO-RS-ID: d9273a22f3a7c793cfc
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
Reply-To: phasta@kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCAyMDI1LTAxLTIzIGF0IDA4OjEwIC0wMzAwLCBNYcOtcmEgQ2FuYWwgd3JvdGU6Cj4g
SGkgUGhpbGlwcCwKPiAKPiBPbiAyMy8wMS8yNSAwNToxMCwgUGhpbGlwcCBTdGFubmVyIHdyb3Rl
Ogo+ID4gT24gV2VkLCAyMDI1LTAxLTIyIGF0IDE5OjA3IC0wMzAwLCBNYcOtcmEgQ2FuYWwgd3Jv
dGU6Cj4gPiA+IEhpIFBoaWxpcHAsCj4gPiA+IAo+ID4gPiBPbiAyMi8wMS8yNSAxMTowOCwgUGhp
bGlwcCBTdGFubmVyIHdyb3RlOgo+ID4gPiA+IGRybV9zY2hlZF9pbml0KCkgaGFzIGEgZ3JlYXQg
bWFueSBwYXJhbWV0ZXJzIGFuZCB1cGNvbWluZyBuZXcKPiA+ID4gPiBmdW5jdGlvbmFsaXR5IGZv
ciB0aGUgc2NoZWR1bGVyIG1pZ2h0IGFkZCBldmVuIG1vcmUuIEdlbmVyYWxseSwKPiA+ID4gPiB0
aGUKPiA+ID4gPiBncmVhdCBudW1iZXIgb2YgcGFyYW1ldGVycyByZWR1Y2VzIHJlYWRhYmlsaXR5
IGFuZCBoYXMgYWxyZWFkeQo+ID4gPiA+IGNhdXNlZAo+ID4gPiA+IG9uZSBtaXNzbmFtaW5nIGlu
Ogo+ID4gPiA+IAo+ID4gPiA+IGNvbW1pdCA2ZjFjYWNmNGViYTcgKCJkcm0vbm91dmVhdTogSW1w
cm92ZSB2YXJpYWJsZSBuYW1lIGluCj4gPiA+ID4gbm91dmVhdV9zY2hlZF9pbml0KCkiKS4KPiA+
ID4gPiAKPiA+ID4gPiBJbnRyb2R1Y2UgYSBuZXcgc3RydWN0IGZvciB0aGUgc2NoZWR1bGVyIGlu
aXQgcGFyYW1ldGVycyBhbmQKPiA+ID4gPiBwb3J0Cj4gPiA+ID4gYWxsCj4gPiA+ID4gdXNlcnMu
Cj4gPiA+ID4gCj4gPiA+ID4gU2lnbmVkLW9mZi1ieTogUGhpbGlwcCBTdGFubmVyIDxwaGFzdGFA
a2VybmVsLm9yZz4KPiAKPiBbLi4uXQo+IAo+ID4gPiAKPiA+ID4gPiBkaWZmIC0tZ2l0IGEvZHJp
dmVycy9ncHUvZHJtL3YzZC92M2Rfc2NoZWQuYwo+ID4gPiA+IGIvZHJpdmVycy9ncHUvZHJtL3Yz
ZC92M2Rfc2NoZWQuYwo+ID4gPiA+IGluZGV4IDk5YWM0OTk1YjVhMS4uNzE2ZTZkMDc0ZDg3IDEw
MDY0NAo+ID4gPiA+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS92M2QvdjNkX3NjaGVkLmMKPiA+ID4g
PiArKysgYi9kcml2ZXJzL2dwdS9kcm0vdjNkL3YzZF9zY2hlZC5jCj4gPiA+ID4gQEAgLTgxNCw2
NyArODE0LDEyNCBAQCBzdGF0aWMgY29uc3Qgc3RydWN0Cj4gPiA+ID4gZHJtX3NjaGVkX2JhY2tl
bmRfb3BzCj4gPiA+ID4gdjNkX2NwdV9zY2hlZF9vcHMgPSB7Cj4gPiA+ID4gwqDCoMKgCS5mcmVl
X2pvYiA9IHYzZF9jcHVfam9iX2ZyZWUKPiA+ID4gPiDCoMKgIH07Cj4gPiA+ID4gwqDCoCAKPiA+
ID4gPiArLyoKPiA+ID4gPiArICogdjNkJ3Mgc2NoZWR1bGVyIGluc3RhbmNlcyBhcmUgYWxsIGlk
ZW50aWNhbCwgZXhjZXB0IGZvciBvcHMKPiA+ID4gPiBhbmQKPiA+ID4gPiBuYW1lLgo+ID4gPiA+
ICsgKi8KPiA+ID4gPiArc3RhdGljIHZvaWQKPiA+ID4gPiArdjNkX2NvbW1vbl9zY2hlZF9pbml0
KHN0cnVjdCBkcm1fc2NoZWRfaW5pdF9wYXJhbXMgKnBhcmFtcywKPiA+ID4gPiBzdHJ1Y3QKPiA+
ID4gPiBkZXZpY2UgKmRldikKPiA+ID4gPiArewo+ID4gPiA+ICsJbWVtc2V0KHBhcmFtcywgMCwg
c2l6ZW9mKHN0cnVjdAo+ID4gPiA+IGRybV9zY2hlZF9pbml0X3BhcmFtcykpOwo+ID4gPiA+ICsK
PiA+ID4gPiArCXBhcmFtcy0+c3VibWl0X3dxID0gTlVMTDsgLyogVXNlIHRoZSBzeXN0ZW1fd3Eu
ICovCj4gPiA+ID4gKwlwYXJhbXMtPm51bV9ycXMgPSBEUk1fU0NIRURfUFJJT1JJVFlfQ09VTlQ7
Cj4gPiA+ID4gKwlwYXJhbXMtPmNyZWRpdF9saW1pdCA9IDE7Cj4gPiA+ID4gKwlwYXJhbXMtPmhh
bmdfbGltaXQgPSAwOwo+ID4gPiA+ICsJcGFyYW1zLT50aW1lb3V0ID0gbXNlY3NfdG9famlmZmll
cyg1MDApOwo+ID4gPiA+ICsJcGFyYW1zLT50aW1lb3V0X3dxID0gTlVMTDsgLyogVXNlIHRoZSBz
eXN0ZW1fd3EuICovCj4gPiA+ID4gKwlwYXJhbXMtPnNjb3JlID0gTlVMTDsKPiA+ID4gPiArCXBh
cmFtcy0+ZGV2ID0gZGV2Owo+ID4gPiA+ICt9Cj4gPiA+IAo+ID4gPiBDb3VsZCB3ZSB1c2Ugb25s
eSBvbmUgZnVuY3Rpb24gdGhhdCB0YWtlcyBzdHJ1Y3QgdjNkX2RldiAqdjNkLAo+ID4gPiBlbnVt
Cj4gPiA+IHYzZF9xdWV1ZSwgYW5kIHNjaGVkX29wcyBhcyBhcmd1bWVudHMgKGluc3RlYWQgb2Yg
b25lIGZ1bmN0aW9uCj4gPiA+IHBlcgo+ID4gPiBxdWV1ZSk/IFlvdSBjYW4gZ2V0IHRoZSBuYW1l
IG9mIHRoZSBzY2hlZHVsZXIgYnkgY29uY2F0ZW5hdGluZwo+ID4gPiAidjNkXyIKPiA+ID4gdG8K
PiA+ID4gdGhlIHJldHVybiBvZiB2M2RfcXVldWVfdG9fc3RyaW5nKCkuCj4gPiA+IAo+ID4gPiBJ
IGJlbGlldmUgaXQgd291bGQgbWFrZSB0aGUgY29kZSBtdWNoIHNpbXBsZXIuCj4gPiAKPiA+IEhl
bGxvLAo+ID4gCj4gPiBzbyBqdXN0IHRvIGdldCB0aGF0IHJpZ2h0Ogo+ID4gWW91J2QgbGlrZSB0
byBoYXZlIG9uZSB1bml2ZXJzYWwgZnVuY3Rpb24gdGhhdCBzd2l0Y2gtY2FzZXMgb3ZlciBhbgo+
ID4gZW51bSwgc2V0cyB0aGUgb3BzIGFuZCBjcmVhdGVzIHRoZSBuYW1lIHdpdGggc3RyaW5nIGNv
bmNhdGVuYXRpb24/Cj4gPiAKPiA+IEknbSBub3QgY29udmluY2VkIHRoYXQgdGhpcyBpcyBzaW1w
bGVyIHRoYW4gYSBmZXcgc21hbGwgZnVuY3Rpb25zLAo+ID4gYnV0Cj4gPiBpdCdzIG5vdCBteSBj
b21wb25lbnQsIHNv4oCmCj4gPiAKPiA+IFdoYXRldmVyIHdlJ2xsIGRvIHdpbGwgYmUgc2ltcGxl
ciB0aGFuIHRoZSBleGlzdGluZyBjb2RlLCB0aG91Z2guCj4gPiBSaWdodAo+ID4gbm93IG5vIHJl
YWRlciBjYW4gc2VlIGF0IGZpcnN0IGdsYW5jZSB3aGV0aGVyIGFsbCB0aG9zZSBzY2hlZHVsZXJz
Cj4gPiBhcmUKPiA+IGlkZW50aWNhbGx5IHBhcmFtZXRyaXplZCBvciBub3QuCj4gPiAKPiAKPiBU
aGlzIGlzIG15IHByb3Bvc2FsIChqdXN0IGEgcXVpY2sgZHJhZnQsIHBsZWFzZSBjaGVjayBpZiBp
dAo+IGNvbXBpbGVzKToKPiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3YzZC92M2Rf
c2NoZWQuYyAKPiBiL2RyaXZlcnMvZ3B1L2RybS92M2QvdjNkX3NjaGVkLmMKPiBpbmRleCA5NjE0
NjUxMjhkODAuLjdjYzQ1YTBjNmNhMCAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vdjNk
L3YzZF9zY2hlZC5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3YzZC92M2Rfc2NoZWQuYwo+IEBA
IC04MjAsNjcgKzgyMCw2MiBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IGRybV9zY2hlZF9iYWNrZW5k
X29wcyAKPiB2M2RfY3B1X3NjaGVkX29wcyA9IHsKPiDCoMKgwqDCoMKgwqDCoMKgIC5mcmVlX2pv
YiA9IHYzZF9jcHVfam9iX2ZyZWUKPiDCoCB9Owo+IAo+ICtzdGF0aWMgaW50Cj4gK3YzZF9zY2hl
ZF9xdWV1ZV9pbml0KHN0cnVjdCB2M2RfZGV2ICp2M2QsIGVudW0gdjNkX3F1ZXVlIHF1ZXVlLAo+
ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBjb25zdCBzdHJ1Y3QgZHJt
X3NjaGVkX2JhY2tlbmRfb3BzICpvcHMsIGNvbnN0CgpJcyBpdCBhIHF1ZXVlLCB0aG91Z2g/CgpI
b3cgYWJvdXQgX3YzZF9zY2hlZF9pbml0KCk/CgpQLgoKPiBjaGFyIAo+ICpuYW1lKQo+ICt7Cj4g
K8KgwqDCoMKgwqDCoCBzdHJ1Y3QgZHJtX3NjaGVkX2luaXRfcGFyYW1zIHBhcmFtcyA9IHsKPiAr
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAuc3VibWl0X3dxID0gTlVMTCwKPiArwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAubnVtX3JxcyA9IERSTV9TQ0hFRF9QUklPUklUWV9DT1VO
VCwKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAuY3JlZGl0X2xpbWl0ID0gMSwKPiAr
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAuaGFuZ19saW1pdCA9IDAsCj4gK8KgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqAgLnRpbWVvdXQgPSBtc2Vjc190b19qaWZmaWVzKDUwMCksCj4g
K8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgLnRpbWVvdXRfd3EgPSBOVUxMLAo+ICvCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIC5zY29yZSA9IE5VTEwsCj4gK8KgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqAgLmRldiA9IHYzZC0+ZHJtLmRldiwKPiArwqDCoMKgwqDCoMKgIH07Cj4g
Kwo+ICvCoMKgwqDCoMKgwqAgcGFyYW1zLm9wcyA9IG9wczsKPiArwqDCoMKgwqDCoMKgIHBhcmFt
cy5uYW1lID0gbmFtZTsKPiArCj4gK8KgwqDCoMKgwqDCoCByZXR1cm4gZHJtX3NjaGVkX2luaXQo
JnYzZC0+cXVldWVbcXVldWVdLnNjaGVkLCAmcGFyYW1zKTsKPiArfQo+ICsKPiDCoCBpbnQKPiDC
oCB2M2Rfc2NoZWRfaW5pdChzdHJ1Y3QgdjNkX2RldiAqdjNkKQo+IMKgIHsKPiAtwqDCoMKgwqDC
oMKgIGludCBod19qb2JzX2xpbWl0ID0gMTsKPiAtwqDCoMKgwqDCoMKgIGludCBqb2JfaGFuZ19s
aW1pdCA9IDA7Cj4gLcKgwqDCoMKgwqDCoCBpbnQgaGFuZ19saW1pdF9tcyA9IDUwMDsKPiDCoMKg
wqDCoMKgwqDCoMKgIGludCByZXQ7Cj4gCj4gLcKgwqDCoMKgwqDCoCByZXQgPSBkcm1fc2NoZWRf
aW5pdCgmdjNkLT5xdWV1ZVtWM0RfQklOXS5zY2hlZCwKPiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgICZ2M2RfYmluX3NjaGVkX29wcywgTlVM
TCwKPiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgIERSTV9TQ0hFRF9QUklPUklUWV9DT1VOVCwKPiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGh3X2pvYnNfbGltaXQsIGpvYl9oYW5nX2xp
bWl0LAo+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqAgbXNlY3NfdG9famlmZmllcyhoYW5nX2xpbWl0X21zKSwgTlVMTCwKPiAtwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIE5VTEwsICJ2M2Rf
YmluIiwgdjNkLT5kcm0uZGV2KTsKPiArwqDCoMKgwqDCoMKgIHJldCA9IHYzZF9zY2hlZF9xdWV1
ZV9pbml0KHYzZCwgVjNEX0JJTiwgJnYzZF9iaW5fc2NoZWRfb3BzLAo+ICvCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgInYz
ZF9iaW4iKTsKPiDCoMKgwqDCoMKgwqDCoMKgIGlmIChyZXQpCj4gwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqAgcmV0dXJuIHJldDsKPiAKPiAtwqDCoMKgwqDCoMKgIHJldCA9IGRybV9z
Y2hlZF9pbml0KCZ2M2QtPnF1ZXVlW1YzRF9SRU5ERVJdLnNjaGVkLAo+IC3CoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgJnYzZF9yZW5kZXJfc2No
ZWRfb3BzLCBOVUxMLAo+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqAgRFJNX1NDSEVEX1BSSU9SSVRZX0NPVU5ULAo+IC3CoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgaHdfam9ic19saW1pdCwg
am9iX2hhbmdfbGltaXQsCj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoCBtc2Vjc190b19qaWZmaWVzKGhhbmdfbGltaXRfbXMpLCBOVUxMLAo+
IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAg
TlVMTCwgInYzZF9yZW5kZXIiLCB2M2QtPmRybS5kZXYpOwo+ICvCoMKgwqDCoMKgwqAgcmV0ID0g
djNkX3NjaGVkX3F1ZXVlX2luaXQodjNkLCBWM0RfUkVOREVSLAo+ICZ2M2RfcmVuZGVyX3NjaGVk
X29wcywKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgICJ2M2RfcmVuZGVyIik7Cj4gwqDCoMKgwqDCoMKgwqDCoCBpZiAo
cmV0KQo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGdvdG8gZmFpbDsKPiAKPiBb
Li4uXQo+IAo+IEF0IGxlYXN0IGZvciBtZSwgdGhpcyBsb29rcyBtdWNoIHNpbXBsZXIgdGhhbiBv
bmUgZnVuY3Rpb24gZm9yIGVhY2gKPiBWM0QgcXVldWUuCj4gCj4gQmVzdCBSZWdhcmRzLAo+IC0g
TWHDrXJhCj4gCj4gPiBQLgo+ID4gCj4gPiAKPiA+ID4gCj4gPiA+IEJlc3QgUmVnYXJkcywKPiA+
ID4gLSBNYcOtcmEKPiA+ID4gCj4gCgo=

