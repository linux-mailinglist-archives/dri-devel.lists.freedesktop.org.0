Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C59D109231
	for <lists+dri-devel@lfdr.de>; Mon, 25 Nov 2019 17:52:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 92B8D6E162;
	Mon, 25 Nov 2019 16:52:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id D97A36E162;
 Mon, 25 Nov 2019 16:52:01 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C17E631B;
 Mon, 25 Nov 2019 08:52:00 -0800 (PST)
Received: from [10.1.194.43] (e112269-lin.cambridge.arm.com [10.1.194.43])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1AC9E3F68E;
 Mon, 25 Nov 2019 08:51:59 -0800 (PST)
Subject: Re: [PATCH v3 1/2] drm/sched: Avoid job cleanup if sched thread is
 parked.
To: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
References: <1574691041-5499-1-git-send-email-andrey.grodzovsky@amd.com>
From: Steven Price <steven.price@arm.com>
Message-ID: <93c692cb-5306-e024-57f1-463402cb2c44@arm.com>
Date: Mon, 25 Nov 2019 16:51:58 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <1574691041-5499-1-git-send-email-andrey.grodzovsky@amd.com>
Content-Language: en-US
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
Cc: Emily.Deng@amd.com, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, Christian.Koenig@amd.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMjUvMTEvMjAxOSAxNDoxMCwgQW5kcmV5IEdyb2R6b3Zza3kgd3JvdGU6Cj4gV2hlbiB0aGUg
c2NoZWQgdGhyZWFkIGlzIHBhcmtlZCB3ZSBhc3N1bWUgcmluZ19taXJyb3JfbGlzdCBpcwo+IG5v
dCBhY2Nlc3NlZCBmcm9tIGhlcmUuCgpGV0lXIEkgZG9uJ3QgdGhpbmsgdGhpcyBpcyBuZWNlc3Nh
cnkuIGt0aHJlYWRfcGFyaygpIHdpbGwgd2FpdCB1bnRpbCB0aGUKdGhyZWFkIGlzIHBhcmtlZCwg
YXQgd2hpY2ggcG9pbnQgdGhlIHRocmVhZCBpcyBzdHVjayBpbiBrdGhyZWFkX3BhcmttZSgpCnVu
dGlsIHVucGFya2VkLgoKU28gYWxsIHRoaXMgZG9lcyBpcyBhdm9pZCB3YWl0aW5nIGZvciBhbnkg
Y2xlYW51cCBqb2JzIGJlZm9yZSBwYXJraW5nIC0Kd2hpY2ggbWlnaHQgYmUgYSByZWFzb25hYmxl
IGdvYWwgaW4gaXRzZWxmLCBidXQgaWYgc28gbGV0cyBhdCBsZWFzdApkb2N1bWVudCB0aGF0LgoK
U3RldmUKCj4gCj4gU2lnbmVkLW9mZi1ieTogQW5kcmV5IEdyb2R6b3Zza3kgPGFuZHJleS5ncm9k
em92c2t5QGFtZC5jb20+Cj4gUmV2aWV3ZWQtYnk6IENocmlzdGlhbiBLw7ZuaWcgPGNocmlzdGlh
bi5rb2VuaWdAYW1kLmNvbT4KPiAtLS0KPiAgZHJpdmVycy9ncHUvZHJtL3NjaGVkdWxlci9zY2hl
ZF9tYWluLmMgfCAxMCArKysrKysrLS0tCj4gIDEgZmlsZSBjaGFuZ2VkLCA3IGluc2VydGlvbnMo
KyksIDMgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9zY2hl
ZHVsZXIvc2NoZWRfbWFpbi5jIGIvZHJpdmVycy9ncHUvZHJtL3NjaGVkdWxlci9zY2hlZF9tYWlu
LmMKPiBpbmRleCBkNGNjNzI4Li42Nzc0OTU1IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2Ry
bS9zY2hlZHVsZXIvc2NoZWRfbWFpbi5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3NjaGVkdWxl
ci9zY2hlZF9tYWluLmMKPiBAQCAtNjM1LDkgKzYzNSwxMyBAQCBkcm1fc2NoZWRfZ2V0X2NsZWFu
dXBfam9iKHN0cnVjdCBkcm1fZ3B1X3NjaGVkdWxlciAqc2NoZWQpCj4gIAlzdHJ1Y3QgZHJtX3Nj
aGVkX2pvYiAqam9iOwo+ICAJdW5zaWduZWQgbG9uZyBmbGFnczsKPiAgCj4gLQkvKiBEb24ndCBk
ZXN0cm95IGpvYnMgd2hpbGUgdGhlIHRpbWVvdXQgd29ya2VyIGlzIHJ1bm5pbmcgKi8KPiAtCWlm
IChzY2hlZC0+dGltZW91dCAhPSBNQVhfU0NIRURVTEVfVElNRU9VVCAmJgo+IC0JICAgICFjYW5j
ZWxfZGVsYXllZF93b3JrKCZzY2hlZC0+d29ya190ZHIpKQo+ICsJLyoKPiArCSogRG9uJ3QgZGVz
dHJveSBqb2JzIHdoaWxlIHRoZSB0aW1lb3V0IHdvcmtlciBpcyBydW5uaW5nICBPUiB0aHJlYWQK
PiArCSogaXMgYmVpbmcgcGFya2VkIGFuZCBoZW5jZSBhc3N1bWVkIHRvIG5vdCB0b3VjaCByaW5n
X21pcnJvcl9saXN0Cj4gKwkqLwo+ICsJaWYgKChzY2hlZC0+dGltZW91dCAhPSBNQVhfU0NIRURV
TEVfVElNRU9VVCAmJgo+ICsJICAgICAhY2FuY2VsX2RlbGF5ZWRfd29yaygmc2NoZWQtPndvcmtf
dGRyKSkgfHwKPiArCSAgICAgX19rdGhyZWFkX3Nob3VsZF9wYXJrKHNjaGVkLT50aHJlYWQpKQo+
ICAJCXJldHVybiBOVUxMOwo+ICAKPiAgCXNwaW5fbG9ja19pcnFzYXZlKCZzY2hlZC0+am9iX2xp
c3RfbG9jaywgZmxhZ3MpOwo+IAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8v
ZHJpLWRldmVs
