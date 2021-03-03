Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3217D32B850
	for <lists+dri-devel@lfdr.de>; Wed,  3 Mar 2021 14:48:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D82C89C59;
	Wed,  3 Mar 2021 13:47:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.domeneshop.no (smtp.domeneshop.no
 [IPv6:2a01:5b40:0:3005::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 72DCD89C59
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Mar 2021 13:47:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=tronnes.org
 ; s=ds202012;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ufZ6a7L3pPkoSKdOl6MYUEDajN3hR4/+EwZf1uJ3iZ4=; b=keU4KEuZLWbJBigK/vQdYWMRzo
 l5RzuNnmBmAVUx+zhtZTOYn8nUWPJLIwaim4EzrLAn2gmf9FiQ3CBsEFl6wUMsNTKNJKOk6qnHlsw
 oZB2trUrKJlQDvDhtb9OslR/UTsAAZi/IqjhHdihN1ZyBKtIsnwBbu4M2zH2PG7A/8yPBwkt8mE5f
 nsp89trYdks9EXPIjPQGJ6DA48u/79sVqxgFzE+6tT+rjy0ANL69dh0sjVVSsiYESCXP3U5Cmrixn
 E2AyrnH6rtHNpFxp2Z1I98eipYP8T+42l6ahum0yCdn05VFw/xAMN1RsTgPhlUzL2FkGQwBj+8y9o
 U0b8S2tw==;
Received: from 211.81-166-168.customer.lyse.net ([81.166.168.211]:65356
 helo=[192.168.10.61])
 by smtp.domeneshop.no with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.92) (envelope-from <noralf@tronnes.org>)
 id 1lHRr1-00068F-CX; Wed, 03 Mar 2021 14:47:55 +0100
Subject: Re: [PATCH v8] drm: Use USB controller's DMA mask when importing
 dmabufs
To: Thomas Zimmermann <tzimmermann@suse.de>, daniel@ffwll.ch,
 airlied@linux.ie, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 sumit.semwal@linaro.org, christian.koenig@amd.com,
 gregkh@linuxfoundation.org, hdegoede@redhat.com, sean@poorly.run,
 stern@rowland.harvard.edu, dan.carpenter@oracle.com
References: <20210303133229.3288-1-tzimmermann@suse.de>
From: =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>
Message-ID: <fcf3faa6-f742-9b73-17a1-5ad6ead76a02@tronnes.org>
Date: Wed, 3 Mar 2021 14:47:52 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210303133229.3288-1-tzimmermann@suse.de>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, stable@vger.kernel.org,
 Pavel Machek <pavel@ucw.cz>, dri-devel@lists.freedesktop.org,
 Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

CgpEZW4gMDMuMDMuMjAyMSAxNC4zMiwgc2tyZXYgVGhvbWFzIFppbW1lcm1hbm46Cj4gVVNCIGRl
dmljZXMgY2Fubm90IHBlcmZvcm0gRE1BIGFuZCBoZW5jZSBoYXZlIG5vIGRtYV9tYXNrIHNldCBp
biB0aGVpcgo+IGRldmljZSBzdHJ1Y3R1cmUuIFRoZXJlZm9yZSBpbXBvcnRpbmcgZG1hYnVmIGlu
dG8gYSBVU0ItYmFzZWQgZHJpdmVyCj4gZmFpbHMsIHdoaWNoIGJyZWFrcyBqb2luaW5nIGFuZCBt
aXJyb3Jpbmcgb2YgZGlzcGxheSBpbiBYMTEuCj4gCj4gRm9yIFVTQiBkZXZpY2VzLCBwaWNrIHRo
ZSBhc3NvY2lhdGVkIFVTQiBjb250cm9sbGVyIGFzIGF0dGFjaG1lbnQgZGV2aWNlLgo+IFRoaXMg
YWxsb3dzIHRoZSBEUk0gaW1wb3J0IGhlbHBlcnMgdG8gcGVyZm9ybSB0aGUgRE1BIHNldHVwLiBJ
ZiB0aGUgRE1BCj4gY29udHJvbGxlciBkb2VzIG5vdCBzdXBwb3J0IERNQSB0cmFuc2ZlcnMsIHdl
J3JlIG91dCBvZiBsdWNrIGFuZCBjYW5ub3QKPiBpbXBvcnQuIE91ciBjdXJyZW50IFVTQi1iYXNl
ZCBEUk0gZHJpdmVycyBkb24ndCB1c2UgRE1BLCBzbyB0aGUgYWN0dWFsCj4gRE1BIGRldmljZSBp
cyBub3QgaW1wb3J0YW50Lgo+IAo+IFRlc3RlZCBieSBqb2luaW5nL21pcnJvcmluZyBkaXNwbGF5
cyBvZiB1ZGwgYW5kIHJhZGVvbiB1bmRlciBHbm9tZS9YMTEuCj4gCj4gdjg6Cj4gCSogcmVsZWFz
ZSBkbWFkZXYgaWYgZGV2aWNlIGluaXRpYWxpemF0aW9uIGZhaWxzIChOb3JhbGYpCj4gCSogZml4
IGNvbW1pdCBkZXNjcmlwdGlvbiAoTm9yYWxmKQo+IHY3Ogo+IAkqIGZpeCB1c2UtYmVmb3JlLWlu
aXQgYnVnIGluIGdtMTJ1MzIwIChEYW4pCj4gdjY6Cj4gCSogaW1wbGVtZW50IHdvcmthcm91bmQg
aW4gRFJNIGRyaXZlcnMgYW5kIGhvbGQgcmVmZXJlbmNlIHRvCj4gCSAgRE1BIGRldmljZSB3aGls
ZSBVU0IgZGV2aWNlIGlzIGluIHVzZQo+IAkqIHJlbW92ZSBkZXZfaXNfdXNiKCkgKEdyZWcpCj4g
CSogY29sbGFwc2UgVVNCIGhlbHBlciBpbnRvIHVzYl9pbnRmX2dldF9kbWFfZGV2aWNlKCkgKEFs
YW4pCj4gCSogaW50ZWdyYXRlIERhbmllbCdzIFRPRE8gc3RhdGVtZW50IChEYW5pZWwpCj4gCSog
Zml4IHR5cG9zIChHcmVnKQo+IHY1Ogo+IAkqIHByb3ZpZGUgYSBoZWxwZXIgZm9yIFVTQiBpbnRl
cmZhY2VzIChBbGFuKQo+IAkqIGFkZCBGSVhNRSBpdGVtIHRvIGRvY3VtZW50YXRpb24gYW5kIFRP
RE8gbGlzdCAoRGFuaWVsKQo+IHY0Ogo+IAkqIGltcGxlbWVudCB3b3JrYXJvdW5kIHdpdGggVVNC
IGhlbHBlciBmdW5jdGlvbnMgKEdyZWcpCj4gCSogdXNlIHN0cnVjdCB1c2JfZGV2aWNlLT5idXMt
PnN5c2RldiBhcyBETUEgZGV2aWNlIChUYWthc2hpKQo+IHYzOgo+IAkqIGRyb3AgZ2VtX2NyZWF0
ZV9vYmplY3QKPiAJKiB1c2UgRE1BIG1hc2sgb2YgVVNCIGNvbnRyb2xsZXIsIGlmIGFueSAoRGFu
aWVsLCBDaHJpc3RpYW4sIE5vcmFsZikKPiB2MjoKPiAJKiBtb3ZlIGZpeCB0byBpbXBvcnRlciBz
aWRlIChDaHJpc3RpYW4sIERhbmllbCkKPiAJKiB1cGRhdGUgU0hNRU0gYW5kIENNQSBoZWxwZXJz
IGZvciBuZXcgUFJJTUUgY2FsbGJhY2tzCj4gCj4gU2lnbmVkLW9mZi1ieTogVGhvbWFzIFppbW1l
cm1hbm4gPHR6aW1tZXJtYW5uQHN1c2UuZGU+Cj4gRml4ZXM6IDZlYjAyMzNlYzJkMCAoInVzYjog
ZG9uJ3QgaW5oZXJpdHkgRE1BIHByb3BlcnRpZXMgZm9yIFVTQiBkZXZpY2VzIikKPiBUZXN0ZWQt
Ynk6IFBhdmVsIE1hY2hlayA8cGF2ZWxAdWN3LmN6Pgo+IFJldmlld2VkLWJ5OiBHcmVnIEtyb2Fo
LUhhcnRtYW4gPGdyZWdraEBsaW51eGZvdW5kYXRpb24ub3JnPgo+IEFja2VkLWJ5OiBDaHJpc3Rp
YW4gS8O2bmlnIDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+Cj4gQWNrZWQtYnk6IERhbmllbCBW
ZXR0ZXIgPGRhbmllbC52ZXR0ZXJAZmZ3bGwuY2g+Cj4gQ2M6IENocmlzdG9waCBIZWxsd2lnIDxo
Y2hAbHN0LmRlPgo+IENjOiBHcmVnIEtyb2FoLUhhcnRtYW4gPGdyZWdraEBsaW51eGZvdW5kYXRp
b24ub3JnPgo+IENjOiA8c3RhYmxlQHZnZXIua2VybmVsLm9yZz4gIyB2NS4xMCsKPiBTaWduZWQt
b2ZmLWJ5OiBUaG9tYXMgWmltbWVybWFubiA8dHppbW1lcm1hbm5Ac3VzZS5kZT4KPiAtLS0KCkFj
a2VkLWJ5OiBOb3JhbGYgVHLDuG5uZXMgPG5vcmFsZkB0cm9ubmVzLm9yZz4KX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlz
dApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
