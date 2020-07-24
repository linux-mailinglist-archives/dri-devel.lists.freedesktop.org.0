Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 51F5A22BEF2
	for <lists+dri-devel@lfdr.de>; Fri, 24 Jul 2020 09:21:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B38D6E4C1;
	Fri, 24 Jul 2020 07:21:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x543.google.com (mail-ed1-x543.google.com
 [IPv6:2a00:1450:4864:20::543])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 706FF6E4C1
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Jul 2020 07:21:30 +0000 (UTC)
Received: by mail-ed1-x543.google.com with SMTP id bm28so6327681edb.2
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Jul 2020 00:21:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=reply-to:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=f18w2Y7RTZk7RKFX0NJk0iZEGFRZYAVEUH/3X0l6B4A=;
 b=LTVTSj9k4beaAYiZwPUHH45lutbAv9cLfdjn8EJotx29SVb/kHg8TZSHuvAKoEVP6V
 kndu2mhSczFmpAUTJ8j7wyf0nHLEv64babCt70DcLKLugR4jDKC4HveGTvCbZX8ZwMyv
 DtAJzWTrh/C75DoJ766GepdQnJETQUmf8VUaq3PPFgJAOE75WNrw4+qVmMEYmerfBYZm
 4O52454KvI/XZzUHnZnVZGxjtlnP+hToBtto165/mEjlKDLqA53O+HztQOMH5DedpVnz
 JGbeH6qba+37FeYWsragHipL78vqSlME3uiLHpZ2NK8AbzY/7f6x7K/jD8QO/Wop+JME
 awng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:to:cc:references:from
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-transfer-encoding:content-language;
 bh=f18w2Y7RTZk7RKFX0NJk0iZEGFRZYAVEUH/3X0l6B4A=;
 b=HdGwePwtxME+nfFE/7rRQmPYCmAD5F/WBwo+z++KAxIhPhpBXSsgQA9FChLTSJx9BF
 K2B7c0SsUORfozmWi/YZmWdqA6uILvFYjHaALZfcRWtXdM0TyvyfWiZo6tgYa6KGkidg
 shDRlAznMOooMRplr6Z7NVrPORX7ze5jHTI/8HR4bnbv2IOwSmNGztDbQOs5pjuxeGuF
 T3+qSgdcJewtts4+OfSLriGNRgIsgp48Z5EYRw6ITaCGd8cibC4x6aRjUQ/XEALXnbLD
 2+oAx0B9IcXjHWX/ZDD0RPgcyrfpNu07luMLd655xp9QElHAgBNEHy8hiwy0ei6Mhga9
 romQ==
X-Gm-Message-State: AOAM532qW9toWCn2GewBHrNKj8pvpI2HgYXY5eV/Qe2ym/lqPUpgPiou
 gNEmpVVVOXfirWnghQuE+hqOB1v8
X-Google-Smtp-Source: ABdhPJyI1B4GDZ5KF6uRhXsl1CEjqvo7KIetpytVfLF2THxDvtloYRYG3/QKK3igrYnvgt81rTLIJQ==
X-Received: by 2002:a05:6402:542:: with SMTP id
 i2mr7898405edx.318.1595575289034; 
 Fri, 24 Jul 2020 00:21:29 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7?
 ([2a02:908:1252:fb60:be8a:bd56:1f94:86e7])
 by smtp.gmail.com with ESMTPSA id bw7sm105185ejb.5.2020.07.24.00.21.27
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 24 Jul 2020 00:21:28 -0700 (PDT)
Subject: Re: [PATCH] drm/ttm: fix pipelined gutting for evictions
To: Felix Kuehling <felix.kuehling@amd.com>, philip yang <yangp@amd.com>,
 dri-devel@lists.freedesktop.org
References: <20200723090000.5725-1-christian.koenig@amd.com>
 <982ad05c-f2f8-0a53-9b90-119fe93a5374@amd.com>
 <a854df68-5487-552d-0ee0-335fbe2d6356@amd.com>
 <7faab05c-c956-8a82-7ec8-30438f614e02@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <3ba6d0a8-f7ca-7068-1e2e-5635d7f13e7d@gmail.com>
Date: Fri, 24 Jul 2020 09:21:26 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <7faab05c-c956-8a82-7ec8-30438f614e02@amd.com>
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
Reply-To: christian.koenig@amd.com
Cc: Alex.Sierra@amd.com, Philip.Yang@amd.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMjQuMDcuMjAgdW0gMDQ6NTYgc2NocmllYiBGZWxpeCBLdWVobGluZzoKPiBBbSAyMDIwLTA3
LTIzIHVtIDk6NTggcC5tLiBzY2hyaWViIHBoaWxpcCB5YW5nOgo+PiBPbiAyMDIwLTA3LTIzIDc6
MDIgcC5tLiwgRmVsaXggS3VlaGxpbmcgd3JvdGU6Cj4+PiBBbSAyMDIwLTA3LTIzIHVtIDU6MDAg
YS5tLiBzY2hyaWViIENocmlzdGlhbiBLw7ZuaWc6Cj4+Pj4gV2UgY2FuJ3QgcGlwZWxpbmUgdGhh
dCBkdXJpbmcgZXZpY3Rpb24gYmVjYXVzZSB0aGUgbWVtb3J5IG5lZWRzCj4+Pj4gdG8gYmUgYXZh
aWxhYmxlIGltbWVkaWF0ZWx5Lgo+Pj4+Cj4+Pj4gU2lnbmVkLW9mZi1ieTogQ2hyaXN0aWFuIEvD
tm5pZyA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPgo+Pj4+IC0tLQo+Pj4+ICDCoCBkcml2ZXJz
L2dwdS9kcm0vdHRtL3R0bV9iby5jIHwgMTIgKysrKysrKysrKy0tCj4+Pj4gIMKgIDEgZmlsZSBj
aGFuZ2VkLCAxMCBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQo+Pj4+Cj4+Pj4gZGlmZiAt
LWdpdCBhL2RyaXZlcnMvZ3B1L2RybS90dG0vdHRtX2JvLmMKPj4+PiBiL2RyaXZlcnMvZ3B1L2Ry
bS90dG0vdHRtX2JvLmMKPj4+PiBpbmRleCBiYzIyMzBlY2I3ZTMuLjEyMjA0MDA1NmEwNyAxMDA2
NDQKPj4+PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vdHRtL3R0bV9iby5jCj4+Pj4gKysrIGIvZHJp
dmVycy9ncHUvZHJtL3R0bS90dG1fYm8uYwo+Pj4+IEBAIC02NTEsOCArNjUxLDE2IEBAIHN0YXRp
YyBpbnQgdHRtX2JvX2V2aWN0KHN0cnVjdAo+Pj4+IHR0bV9idWZmZXJfb2JqZWN0ICpibywKPj4+
PiAgwqDCoMKgwqDCoCBwbGFjZW1lbnQubnVtX2J1c3lfcGxhY2VtZW50ID0gMDsKPj4+PiAgwqDC
oMKgwqDCoCBiZGV2LT5kcml2ZXItPmV2aWN0X2ZsYWdzKGJvLCAmcGxhY2VtZW50KTsKPj4+PiAg
wqAgLcKgwqDCoCBpZiAoIXBsYWNlbWVudC5udW1fcGxhY2VtZW50ICYmICFwbGFjZW1lbnQubnVt
X2J1c3lfcGxhY2VtZW50KQo+Pj4+IC3CoMKgwqDCoMKgwqDCoCByZXR1cm4gdHRtX2JvX3BpcGVs
aW5lX2d1dHRpbmcoYm8pOwo+Pj4+ICvCoMKgwqAgaWYgKCFwbGFjZW1lbnQubnVtX3BsYWNlbWVu
dCAmJiAhcGxhY2VtZW50Lm51bV9idXN5X3BsYWNlbWVudCkgewo+Pj4+ICvCoMKgwqDCoMKgwqDC
oCB0dG1fYm9fd2FpdChibywgZmFsc2UsIGZhbHNlKTsKPj4+PiArCj4+Pj4gK8KgwqDCoMKgwqDC
oMKgIHR0bV90dF9kZXN0cm95KGJvLT50dG0pOwo+Pj4+ICsKPj4+PiArwqDCoMKgwqDCoMKgwqAg
bWVtc2V0KCZiby0+bWVtLCAwLCBzaXplb2YoYm8tPm1lbSkpOwo+Pj4gV2hlcmUgZG9lcyB0aGUg
bWVtb3J5IGluIHRoZSBiby0+bWVtICh0dG1fbWVtX3JlZykgZ2V0IGRlc3Ryb3llZD8gSXQKPj4+
IGRvZXNuJ3QgZ2V0IGF0dGFjaGVkIHRvIGEgZ2hvc3QgQk8gaW4gdGhpcyBjYXNlLCBzbyBzb21l
b25lIHdpbGwgaGF2ZSB0bwo+Pj4gY2FsbCB0dG1fYm9fbWVtX3B1dCBleHBsaWNpdGx5IGJlZm9y
ZSB5b3Ugd2lwZSBvdXQgYm8tPm1lbS4KPj4gQWZ0ZXIgbWlncmF0aW5nIHRvIHJhbSwKPj4gc3Zt
X3JhbmdlX2JvX3VucmVmLS0+YW1kZ3B1X3VucmVmX2JvLT50dG1fYm9fcHV0LT50dG1fYm9fcmVs
ZWFzZSBjYWxscwo+PiB0dG1fYm9fbWVtX3B1dC4KPiBhbWRncHVfYm9fdW5yZWYgd29uJ3QgZnJl
ZSBhbnl0aGluZyBpZiB0aGUgcmVmZXJlbmNlIGNvdW50IGRvZXNuJ3QgZ28gdG8KPiAwLiBBbmQg
VFRNIGlzIHN0aWxsIGhvbGRpbmcgYSByZWZlcmVuY2UgaGVyZS4gVGhlIEJPIHdvbid0IGJlIGZy
ZWVkCj4gdW50aWwgdHRtX21lbV9ldmljdF9maXJzdCBjYWxscyB0dG1fYm9fcHV0Lgo+Cj4gVGhl
IG1lbXNldCBhYm92ZSBvdmVyd3JpdGVzIHRoZSB0dG1fbWVtX3JlZyBzdHJ1Y3R1cmUsIHdoaWNo
IG1lYW5zIGl0Cj4gd2lsbCBmb3JnZXQgYWJvdXQgdGhlIFZSQU0gbm9kZXMgaGVsZCBieSB0aGUg
Qk8uIFRoZXkgbmVlZCB0byBiZQo+IHJlbGVhc2VkIGZpcnN0LiBUaGF0J3Mgd2hhdCBmcmVlcyB0
aGUgc3BhY2UgdGhhdCB0dG1fYm9fZXZpY3Qgd2FzIHRyeWluZwo+IHRvIG1ha2UgYXZhaWxhYmxl
IGluIHRoZSBmaXJzdCBwbGFjZS4KClllYWgsIEZlbGl4IGlzIHJpZ2h0IHRoYXQgdGhpcyBpcyBh
IGJ1Zy4KCkdvaW5nIHRvIHNlbmQgYSB2MiBpbiBhIG1pbnV0ZS4KClRoYW5rcywKQ2hyaXN0aWFu
LgoKPgo+IFJlZ2FyZHMsCj4gIMKgIEZlbGl4Cj4KPgo+PiB2cmFtIGlzIGFscmVhZHkgZnJlZWQg
YmVmb3JlIHdlIHNpZ25hbCBmZW5jZSwgcmlnaHQ/Cj4+Cj4+IFJlZ2FyZHMsCj4+Cj4+IFBoaWxp
cAo+Pgo+Pj4gUmVnYXJkcywKPj4+ICDCoMKgIEZlbGl4Cj4+Pgo+Pj4KPj4+PiArwqDCoMKgwqDC
oMKgwqAgYm8tPm1lbS5tZW1fdHlwZSA9IFRUTV9QTF9TWVNURU07Cj4+Pj4gK8KgwqDCoMKgwqDC
oMKgIGJvLT50dG0gPSBOVUxMOwo+Pj4+ICvCoMKgwqDCoMKgwqDCoCByZXR1cm4gMDsKPj4+PiAr
wqDCoMKgIH0KPj4+PiAgwqAgwqDCoMKgwqDCoCBldmljdF9tZW0gPSBiby0+bWVtOwo+Pj4+ICDC
oMKgwqDCoMKgIGV2aWN0X21lbS5tbV9ub2RlID0gTlVMTDsKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRl
dmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
