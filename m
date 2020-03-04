Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D36EC178BCF
	for <lists+dri-devel@lfdr.de>; Wed,  4 Mar 2020 08:48:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B6966EAF5;
	Wed,  4 Mar 2020 07:47:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from huawei.com (szxga04-in.huawei.com [45.249.212.190])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7BE826EA9C
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Mar 2020 01:31:34 +0000 (UTC)
Received: from DGGEMS401-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id 0AAACC87A8B01059C2C9;
 Wed,  4 Mar 2020 09:31:31 +0800 (CST)
Received: from [127.0.0.1] (10.173.220.145) by DGGEMS401-HUB.china.huawei.com
 (10.3.19.201) with Microsoft SMTP Server id 14.3.439.0;
 Wed, 4 Mar 2020 09:31:21 +0800
Subject: Re: [PATCH] vgacon: Fix a UAF in vgacon_invert_region
To: =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
References: <20200303032036.40560-1-zhangxiaoxu5@huawei.com>
 <20200303135940.GS13686@intel.com>
 <67073029-8477-5f5a-ed2a-bb5ad4896878@huawei.com>
 <20200303144649.GT13686@intel.com>
From: "zhangxiaoxu (A)" <zhangxiaoxu5@huawei.com>
Message-ID: <5c63d51f-b396-f2a7-a7c2-3b8af0bb54b0@huawei.com>
Date: Wed, 4 Mar 2020 09:31:20 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.1
MIME-Version: 1.0
In-Reply-To: <20200303144649.GT13686@intel.com>
X-Originating-IP: [10.173.220.145]
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Wed, 04 Mar 2020 07:47:28 +0000
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
Cc: akpm@osdl.org, pmladek@suse.com, wangkefeng.wang@huawei.com,
 b.zolnierkie@samsung.com, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, sergey.senozhatsky@gmail.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

CgrlnKggMjAyMC8zLzMgMjI6NDYsIFZpbGxlIFN5cmrDpGzDpCDlhpnpgZM6Cj4gT24gVHVlLCBN
YXIgMDMsIDIwMjAgYXQgMTA6MzA6MTRQTSArMDgwMCwgemhhbmd4aWFveHUgKEEpIHdyb3RlOgo+
Pgo+Pgo+PiDlnKggMjAyMC8zLzMgMjE6NTksIFZpbGxlIFN5cmrDpGzDpCDlhpnpgZM6Cj4+PiBU
aGF0IGRvZXNuJ3QgbWF0Y2ggaG93IHZjX3NjcmVlbmJ1Zl9zaXplIGlzIGNvbXB1dGVkIGVsc2V3
aGVyZS4gQWxzbwo+Pj4gYSBsb3Qgb2YgcGxhY2VzIHNlZW0gdG8gYXNzdW1lIHRoYXQgdGhlIHNj
cmVlbmJ1ZiBjYW4gYmUgbGFyZ2VyIHRoYW4KPj4+IHZnYV92cmFtX3NpemUgKGVnLiBhbGwgdGhl
IG1lbWNweSgpcyBwaWNrIHRoZSBzbWFsbGVyIHNpemUgb2YgdGhlCj4+PiB0d28pLgo+PiBZZXMs
IGluIHRoZSB2Z2Egc291cmNlIGNvZGUsIHdlIGFsc28gcGljayB0aGUgc21hbGxlciBzaXplIG9m
IHR3by4gQnV0Cj4+IGluIG90aGVyIHBsYWNlLCBlZzogdmNfZG9fcmVzaXplLCBjb3B5IHRoZSBv
bGRfb3JpZ2luIHRvIG5ld19vcmlnaW4sIHdlCj4+IG5vdCBkbyB0aGF0LiBJdCBhbHNvIG1ha2Ug
YmFkIGFjY2VzcyBoYXBwZW4uIGl0IG1heWJlIENWRS0yMDIwLTg2NDcuCj4+Cj4+IEkgdGhpbmsg
d2Ugc2hvdWxkIGp1c3QgYXNzdW1lIHRoZSB3aWR0aC9oZWlnaHQgbWF5YmUgbGFyZ2VyIHRoYW4g
dGhlCj4+IGRlZmF1bHQsIG5vdCB0aGUgc2NyZWVuYnVmIGxhcmdlciB0aGFuIHZnYV92cmFtX3Np
emUuCj4+Cj4+IElmIG5vdCwgYW55IHVzZWZ1bCBvZiB0aGUgbGFyZ2VyIHNjcmVlbmJ1Zj8KPiAK
PiBNYXliZSB1c2VkIGZvciBzY3JvbGxpbmc/ClRoZSBzY3JlZW5idWYganVzdCBhbGxvY2F0ZWQg
d2l0aCBjb2xzIGFuZCByb3dzLCBpdCBjYW4gYmUgc2F2ZSBqdXN0IG9uZQpzY3JlZW4/CnZjX2Rv
X3Jlc2l6ZSBpcyB0aGUgbGFyZ2VzdCBzaXplIHdoaWNoIG9uZSBzY3JlZW4gY2FuIGJlIHNob3du
PwoKSWYgc28sIHdlIGNhbid0IHNldCB0aGUgc2NyZWVuIHRvIHRoZSByZXNvbHV0aW9uIHdoaWNo
IG1vcmUgdGhhbiBpdCdzCmNhcGFiaWxpdHk/Cj4gCj4+Cj4+Pgo+Pj4gQW5kIHlvdSdyZSBjaGFu
Z2luZyB0aGUgYmVoYXZpb3VyIG9mIHRoZSBjb2RlIHdoZW4KPj4+ICd3aWR0aCAlIDIgJiYgdXNl
cicgaXMgdHJ1ZQo+IAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRl
dmVsCg==
