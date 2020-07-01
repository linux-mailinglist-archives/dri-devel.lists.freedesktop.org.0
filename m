Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 63EC621048F
	for <lists+dri-devel@lfdr.de>; Wed,  1 Jul 2020 09:12:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 426AA6E7D3;
	Wed,  1 Jul 2020 07:12:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com
 [IPv6:2a00:1450:4864:20::142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 753F56E19C
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Jul 2020 01:45:50 +0000 (UTC)
Received: by mail-lf1-x142.google.com with SMTP id u25so12649217lfm.1
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Jun 2020 18:45:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=HczcFWcC6ZdwoUa650Xj9nL47iYNBcU34xhBNmcm5mQ=;
 b=qcXawn2WKloYEsPbetf6aagiDS45tW33ipg0zz3WpddTf5mEfIPl/RMM9F4K1UD0CA
 PyrZx3PgfMl6DntR2pNPLKuFwKF44YW5yhfETcUmTvZtwQys3Sa24F32CSHiXsXi+Zee
 tWrAu2tOdbV5ta2vdNmYg2bItojho4xB1/WO9czIGpsBqf3dPr67OrQwMj2W6NDqaf+T
 OCTVkIifGIabvdY9ZjZ6IRYTqrc9RJyqx1K6E8sxUmppsswEFsVxPJaC/H+INESMKHfC
 DyoaZC3gOoMtsEaGj5hUdAxFWGcDOTyMZJlKw35i76V0XWVl52wdzqVlxci/HIjlLUj1
 kLaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=HczcFWcC6ZdwoUa650Xj9nL47iYNBcU34xhBNmcm5mQ=;
 b=U0V7YCov174KY5dycXABrcA3/GmE5K3KhlS9T/AnpKZVsqEkfelc1dPDZuwqmlbS7C
 W/+lBdA5LbT8JyvWSKbJtaUbT+EEhyTeeC1tCESOa9dWIfojEQSbO7x7IyjQQVJO5bVL
 6et8AN0iBNtIOaULCC4PbIQpa5QbcP7qgSAmUtTVet4zA8kAyN9cgE2PTKzdn/IBPmGC
 Nc8cfJt6EbCndxCH7dcnk6ZqSFhWclGsHwjRQgLHHtvgCsn45pwQ6RxYUx0wvhve35UR
 UW5JNXTaLHIYc0zO7WwSHHwopLzMEQeW3tgfVFOa5qQhrKAiiVWOcupKDxLYr9RCY8pC
 UMQg==
X-Gm-Message-State: AOAM530QLw+qIeqgsaJvtc0kXrbroWNmfMJGaQoPPiHhvf7OP04qPL16
 gwyD82IqYAruNo3UQMAFM8M=
X-Google-Smtp-Source: ABdhPJwbkW9xT3ZwoL2zmgvISkNdI5MF+tmhowtU+Y/M+Llvwp1rA3SMtcAIZ5jfUBSevSSc5oW50A==
X-Received: by 2002:ac2:548a:: with SMTP id t10mr13826582lfk.142.1593567948716; 
 Tue, 30 Jun 2020 18:45:48 -0700 (PDT)
Received: from [192.168.2.145] (79-139-237-54.dynamic.spd-mgts.ru.
 [79.139.237.54])
 by smtp.googlemail.com with ESMTPSA id 193sm1594603lfa.90.2020.06.30.18.45.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 30 Jun 2020 18:45:47 -0700 (PDT)
Subject: Re: [PATCH v7 31/36] staging: tegra-vde: fix common struct sg_table
 related issues
To: Marek Szyprowski <m.szyprowski@samsung.com>
References: <20200619103636.11974-1-m.szyprowski@samsung.com>
 <CGME20200619103714eucas1p18db6efd1a380fc0bdb16174ee85036fa@eucas1p1.samsung.com>
 <20200619103636.11974-32-m.szyprowski@samsung.com>
 <20200621070015.0cf833ab@dimatab>
 <559970b6-e80f-90ec-7fb0-1fab742d99de@samsung.com>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <60aacf07-e263-85e0-9d45-1edb8ba3b954@gmail.com>
Date: Wed, 1 Jul 2020 04:45:46 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <559970b6-e80f-90ec-7fb0-1fab742d99de@samsung.com>
Content-Language: en-US
X-Mailman-Approved-At: Wed, 01 Jul 2020 07:12:04 +0000
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
Cc: devel@driverdev.osuosl.org,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 David Airlie <airlied@linux.ie>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Jonathan Hunter <jonathanh@nvidia.com>,
 linaro-mm-sig@lists.linaro.org, iommu@lists.linux-foundation.org,
 Thierry Reding <thierry.reding@gmail.com>, linux-tegra@vger.kernel.org,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Robin Murphy <robin.murphy@arm.com>, Christoph Hellwig <hch@lst.de>,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

MzAuMDYuMjAyMCAxMzowNywgTWFyZWsgU3p5cHJvd3NraSDQv9C40YjQtdGCOgo+IE9uIDIxLjA2
LjIwMjAgMDY6MDAsIERtaXRyeSBPc2lwZW5rbyB3cm90ZToKPj4g0JIgRnJpLCAxOSBKdW4gMjAy
MCAxMjozNjozMSArMDIwMAo+PiBNYXJlayBTenlwcm93c2tpIDxtLnN6eXByb3dza2lAc2Ftc3Vu
Zy5jb20+INC/0LjRiNC10YI6Cj4+Cj4+PiBUaGUgRG9jdW1lbnRhdGlvbi9ETUEtQVBJLUhPV1RP
LnR4dCBzdGF0ZXMgdGhhdCB0aGUgZG1hX21hcF9zZygpCj4+PiBmdW5jdGlvbiByZXR1cm5zIHRo
ZSBudW1iZXIgb2YgdGhlIGNyZWF0ZWQgZW50cmllcyBpbiB0aGUgRE1BIGFkZHJlc3MKPj4+IHNw
YWNlLiBIb3dldmVyIHRoZSBzdWJzZXF1ZW50IGNhbGxzIHRvIHRoZQo+Pj4gZG1hX3N5bmNfc2df
Zm9yX3tkZXZpY2UsY3B1fSgpIGFuZCBkbWFfdW5tYXBfc2cgbXVzdCBiZSBjYWxsZWQgd2l0aAo+
Pj4gdGhlIG9yaWdpbmFsIG51bWJlciBvZiB0aGUgZW50cmllcyBwYXNzZWQgdG8gdGhlIGRtYV9t
YXBfc2coKS4KPj4+Cj4+PiBzdHJ1Y3Qgc2dfdGFibGUgaXMgYSBjb21tb24gc3RydWN0dXJlIHVz
ZWQgZm9yIGRlc2NyaWJpbmcgYQo+Pj4gbm9uLWNvbnRpZ3VvdXMgbWVtb3J5IGJ1ZmZlciwgdXNl
ZCBjb21tb25seSBpbiB0aGUgRFJNIGFuZCBncmFwaGljcwo+Pj4gc3Vic3lzdGVtcy4gSXQgY29u
c2lzdHMgb2YgYSBzY2F0dGVybGlzdCB3aXRoIG1lbW9yeSBwYWdlcyBhbmQgRE1BCj4+PiBhZGRy
ZXNzZXMgKHNnbCBlbnRyeSksIGFzIHdlbGwgYXMgdGhlIG51bWJlciBvZiBzY2F0dGVybGlzdCBl
bnRyaWVzOgo+Pj4gQ1BVIHBhZ2VzIChvcmlnX25lbnRzIGVudHJ5KSBhbmQgRE1BIG1hcHBlZCBw
YWdlcyAobmVudHMgZW50cnkpLgo+Pj4KPj4+IEl0IHR1cm5lZCBvdXQgdGhhdCBpdCB3YXMgYSBj
b21tb24gbWlzdGFrZSB0byBtaXN1c2UgbmVudHMgYW5kCj4+PiBvcmlnX25lbnRzIGVudHJpZXMs
IGNhbGxpbmcgRE1BLW1hcHBpbmcgZnVuY3Rpb25zIHdpdGggYSB3cm9uZyBudW1iZXIKPj4+IG9m
IGVudHJpZXMgb3IgaWdub3JpbmcgdGhlIG51bWJlciBvZiBtYXBwZWQgZW50cmllcyByZXR1cm5l
ZCBieSB0aGUKPj4+IGRtYV9tYXBfc2coKSBmdW5jdGlvbi4KPj4+Cj4+PiBUbyBhdm9pZCBzdWNo
IGlzc3VlcywgbGV0cyB1c2UgYSBjb21tb24gZG1hLW1hcHBpbmcgd3JhcHBlcnMgb3BlcmF0aW5n
Cj4+PiBkaXJlY3RseSBvbiB0aGUgc3RydWN0IHNnX3RhYmxlIG9iamVjdHMgYW5kIHVzZSBzY2F0
dGVybGlzdCBwYWdlCj4+PiBpdGVyYXRvcnMgd2hlcmUgcG9zc2libGUuIFRoaXMsIGFsbW9zdCBh
bHdheXMsIGhpZGVzIHJlZmVyZW5jZXMgdG8gdGhlCj4+PiBuZW50cyBhbmQgb3JpZ19uZW50cyBl
bnRyaWVzLCBtYWtpbmcgdGhlIGNvZGUgcm9idXN0LCBlYXNpZXIgdG8gZm9sbG93Cj4+PiBhbmQg
Y29weS9wYXN0ZSBzYWZlLgo+Pj4KPj4+IFNpZ25lZC1vZmYtYnk6IE1hcmVrIFN6eXByb3dza2kg
PG0uc3p5cHJvd3NraUBzYW1zdW5nLmNvbT4KPj4+IFJldmlld2VkLWJ5OiBEbWl0cnkgT3NpcGVu
a28gPGRpZ2V0eEBnbWFpbC5jb20+Cj4+PiAtLS0KPj4+ICAgZHJpdmVycy9zdGFnaW5nL21lZGlh
L3RlZ3JhLXZkZS9pb21tdS5jIHwgNCArKy0tCj4+PiAgIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2Vy
dGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCj4+Pgo+Pj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvc3Rh
Z2luZy9tZWRpYS90ZWdyYS12ZGUvaW9tbXUuYwo+Pj4gYi9kcml2ZXJzL3N0YWdpbmcvbWVkaWEv
dGVncmEtdmRlL2lvbW11LmMgaW5kZXgKPj4+IDZhZjg2M2Q5MjEyMy4uYWRmOGRjN2VlMjVjIDEw
MDY0NCAtLS0KPj4+IGEvZHJpdmVycy9zdGFnaW5nL21lZGlhL3RlZ3JhLXZkZS9pb21tdS5jICsr
Kwo+Pj4gYi9kcml2ZXJzL3N0YWdpbmcvbWVkaWEvdGVncmEtdmRlL2lvbW11LmMgQEAgLTM2LDgg
KzM2LDggQEAgaW50Cj4+PiB0ZWdyYV92ZGVfaW9tbXVfbWFwKHN0cnVjdCB0ZWdyYV92ZGUgKnZk
ZSwKPj4+ICAgCWFkZHIgPSBpb3ZhX2RtYV9hZGRyKCZ2ZGUtPmlvdmEsIGlvdmEpOwo+Pj4gICAK
Pj4+IC0Jc2l6ZSA9IGlvbW11X21hcF9zZyh2ZGUtPmRvbWFpbiwgYWRkciwgc2d0LT5zZ2wsIHNn
dC0+bmVudHMsCj4+PiAtCQkJICAgIElPTU1VX1JFQUQgfCBJT01NVV9XUklURSk7Cj4+PiArCXNp
emUgPSBpb21tdV9tYXBfc2d0YWJsZSh2ZGUtPmRvbWFpbiwgYWRkciwgc2d0LAo+Pj4gKwkJCQkg
SU9NTVVfUkVBRCB8IElPTU1VX1dSSVRFKTsKPj4+ICAgCWlmICghc2l6ZSkgewo+Pj4gICAJCV9f
ZnJlZV9pb3ZhKCZ2ZGUtPmlvdmEsIGlvdmEpOwo+Pj4gICAJCXJldHVybiAtRU5YSU87Cj4+IEFo
aCwgSSBzYXcgdGhlIGJ1aWxkIGZhaWx1cmUgcmVwb3J0LiBZb3UncmUgY2hhbmdpbmcgdGhlIERN
QSBBUEkgaW4KPj4gdGhpcyBzZXJpZXMsIHdoaWxlIERNQSBBUEkgaXNuJ3QgdXNlZCBieSB0aGlz
IGRyaXZlciwgaXQgdXNlcyBJT01NVQo+PiBBUEkuIEhlbmNlIHRoZXJlIGlzIG5vIG5lZWQgdG8g
dG91Y2ggdGhpcyBjb2RlLiBTaW1pbGFyIHByb2JsZW0gaW4gdGhlCj4+IGhvc3QxeCBkcml2ZXIg
cGF0Y2guCj4gCj4gVGhlIGlzc3VlIGlzIGNhdXNlZCBieSB0aGUgbGFjayBvZiBpb21tdV9tYXBf
c2d0YWJsZSgpIHN0dWIgd2hlbiBubyAKPiBJT01NVSBzdXBwb3J0IGlzIGNvbmZpZ3VyZWQuIEkn
dmUgcG9zdGVkIGEgcGF0Y2ggZm9yIHRoaXM6Cj4gCj4gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcv
bGttbC8yMDIwMDYzMDA4MTc1Ni4xODUyNi0xLW0uc3p5cHJvd3NraUBzYW1zdW5nLmNvbS8KPiAK
PiBUaGUgcGF0Y2ggZm9yIHRoaXMgZHJpdmVyIGlzIGZpbmUsIHdlIGhhdmUgdG8gd2FpdCB1bnRp
bCB0aGUgYWJvdmUgZml4IAo+IGdldHMgbWVyZ2VkIGFuZCB0aGVuIGl0IGNhbiBiZSBhcHBsaWVk
IGR1cmluZyB0aGUgbmV4dCByZWxlYXNlIGN5Y2xlLgoKVGhhbmsgeW91IGZvciB0aGUgY2xhcmlm
aWNhdGlvbiEKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
ZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0
dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
