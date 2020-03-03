Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 581ED17796E
	for <lists+dri-devel@lfdr.de>; Tue,  3 Mar 2020 15:46:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D07889EB7;
	Tue,  3 Mar 2020 14:46:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E2F8389EB7
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Mar 2020 14:46:53 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 03 Mar 2020 06:46:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,511,1574150400"; d="scan'208";a="233636484"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by orsmga008.jf.intel.com with SMTP; 03 Mar 2020 06:46:49 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Tue, 03 Mar 2020 16:46:49 +0200
Date: Tue, 3 Mar 2020 16:46:49 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: "zhangxiaoxu (A)" <zhangxiaoxu5@huawei.com>
Subject: Re: [PATCH] vgacon: Fix a UAF in vgacon_invert_region
Message-ID: <20200303144649.GT13686@intel.com>
References: <20200303032036.40560-1-zhangxiaoxu5@huawei.com>
 <20200303135940.GS13686@intel.com>
 <67073029-8477-5f5a-ed2a-bb5ad4896878@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <67073029-8477-5f5a-ed2a-bb5ad4896878@huawei.com>
X-Patchwork-Hint: comment
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBNYXIgMDMsIDIwMjAgYXQgMTA6MzA6MTRQTSArMDgwMCwgemhhbmd4aWFveHUgKEEp
IHdyb3RlOgo+IAo+IAo+IOWcqCAyMDIwLzMvMyAyMTo1OSwgVmlsbGUgU3lyasOkbMOkIOWGmemB
kzoKPiA+IFRoYXQgZG9lc24ndCBtYXRjaCBob3cgdmNfc2NyZWVuYnVmX3NpemUgaXMgY29tcHV0
ZWQgZWxzZXdoZXJlLiBBbHNvCj4gPiBhIGxvdCBvZiBwbGFjZXMgc2VlbSB0byBhc3N1bWUgdGhh
dCB0aGUgc2NyZWVuYnVmIGNhbiBiZSBsYXJnZXIgdGhhbgo+ID4gdmdhX3ZyYW1fc2l6ZSAoZWcu
IGFsbCB0aGUgbWVtY3B5KClzIHBpY2sgdGhlIHNtYWxsZXIgc2l6ZSBvZiB0aGUKPiA+IHR3byku
Cj4gWWVzLCBpbiB0aGUgdmdhIHNvdXJjZSBjb2RlLCB3ZSBhbHNvIHBpY2sgdGhlIHNtYWxsZXIg
c2l6ZSBvZiB0d28uIEJ1dAo+IGluIG90aGVyIHBsYWNlLCBlZzogdmNfZG9fcmVzaXplLCBjb3B5
IHRoZSBvbGRfb3JpZ2luIHRvIG5ld19vcmlnaW4sIHdlCj4gbm90IGRvIHRoYXQuIEl0IGFsc28g
bWFrZSBiYWQgYWNjZXNzIGhhcHBlbi4gaXQgbWF5YmUgQ1ZFLTIwMjAtODY0Ny4KPiAKPiBJIHRo
aW5rIHdlIHNob3VsZCBqdXN0IGFzc3VtZSB0aGUgd2lkdGgvaGVpZ2h0IG1heWJlIGxhcmdlciB0
aGFuIHRoZQo+IGRlZmF1bHQsIG5vdCB0aGUgc2NyZWVuYnVmIGxhcmdlciB0aGFuIHZnYV92cmFt
X3NpemUuCj4gCj4gSWYgbm90LCBhbnkgdXNlZnVsIG9mIHRoZSBsYXJnZXIgc2NyZWVuYnVmPwoK
TWF5YmUgdXNlZCBmb3Igc2Nyb2xsaW5nPwoKPiAKPiA+IAo+ID4gQW5kIHlvdSdyZSBjaGFuZ2lu
ZyB0aGUgYmVoYXZpb3VyIG9mIHRoZSBjb2RlIHdoZW4KPiA+ICd3aWR0aCAlIDIgJiYgdXNlcicg
aXMgdHJ1ZQoKLS0gClZpbGxlIFN5cmrDpGzDpApJbnRlbApfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZl
bEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFp
bG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
