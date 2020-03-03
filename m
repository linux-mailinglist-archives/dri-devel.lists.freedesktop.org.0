Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E425A178BE4
	for <lists+dri-devel@lfdr.de>; Wed,  4 Mar 2020 08:48:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 52A9A6EABC;
	Wed,  4 Mar 2020 07:48:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from huawei.com (szxga07-in.huawei.com [45.249.212.35])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 409196EA74
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Mar 2020 14:30:28 +0000 (UTC)
Received: from DGGEMS414-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id 44C59CB55BA70598217E;
 Tue,  3 Mar 2020 22:30:24 +0800 (CST)
Received: from [127.0.0.1] (10.173.220.145) by DGGEMS414-HUB.china.huawei.com
 (10.3.19.214) with Microsoft SMTP Server id 14.3.439.0;
 Tue, 3 Mar 2020 22:30:14 +0800
Subject: Re: [PATCH] vgacon: Fix a UAF in vgacon_invert_region
To: =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
References: <20200303032036.40560-1-zhangxiaoxu5@huawei.com>
 <20200303135940.GS13686@intel.com>
From: "zhangxiaoxu (A)" <zhangxiaoxu5@huawei.com>
Message-ID: <67073029-8477-5f5a-ed2a-bb5ad4896878@huawei.com>
Date: Tue, 3 Mar 2020 22:30:14 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.1
MIME-Version: 1.0
In-Reply-To: <20200303135940.GS13686@intel.com>
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

CgrlnKggMjAyMC8zLzMgMjE6NTksIFZpbGxlIFN5cmrDpGzDpCDlhpnpgZM6Cj4gVGhhdCBkb2Vz
bid0IG1hdGNoIGhvdyB2Y19zY3JlZW5idWZfc2l6ZSBpcyBjb21wdXRlZCBlbHNld2hlcmUuIEFs
c28KPiBhIGxvdCBvZiBwbGFjZXMgc2VlbSB0byBhc3N1bWUgdGhhdCB0aGUgc2NyZWVuYnVmIGNh
biBiZSBsYXJnZXIgdGhhbgo+IHZnYV92cmFtX3NpemUgKGVnLiBhbGwgdGhlIG1lbWNweSgpcyBw
aWNrIHRoZSBzbWFsbGVyIHNpemUgb2YgdGhlCj4gdHdvKS4KWWVzLCBpbiB0aGUgdmdhIHNvdXJj
ZSBjb2RlLCB3ZSBhbHNvIHBpY2sgdGhlIHNtYWxsZXIgc2l6ZSBvZiB0d28uIEJ1dAppbiBvdGhl
ciBwbGFjZSwgZWc6IHZjX2RvX3Jlc2l6ZSwgY29weSB0aGUgb2xkX29yaWdpbiB0byBuZXdfb3Jp
Z2luLCB3ZQpub3QgZG8gdGhhdC4gSXQgYWxzbyBtYWtlIGJhZCBhY2Nlc3MgaGFwcGVuLiBpdCBt
YXliZSBDVkUtMjAyMC04NjQ3LgoKSSB0aGluayB3ZSBzaG91bGQganVzdCBhc3N1bWUgdGhlIHdp
ZHRoL2hlaWdodCBtYXliZSBsYXJnZXIgdGhhbiB0aGUKZGVmYXVsdCwgbm90IHRoZSBzY3JlZW5i
dWYgbGFyZ2VyIHRoYW4gdmdhX3ZyYW1fc2l6ZS4KCklmIG5vdCwgYW55IHVzZWZ1bCBvZiB0aGUg
bGFyZ2VyIHNjcmVlbmJ1Zj8KCj4gCj4gQW5kIHlvdSdyZSBjaGFuZ2luZyB0aGUgYmVoYXZpb3Vy
IG9mIHRoZSBjb2RlIHdoZW4KPiAnd2lkdGggJSAyICYmIHVzZXInIGlzIHRydWUKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5n
IGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVk
ZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
