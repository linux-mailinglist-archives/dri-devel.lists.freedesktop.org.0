Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B8E0A245D03
	for <lists+dri-devel@lfdr.de>; Mon, 17 Aug 2020 09:06:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 36CB36E44B;
	Mon, 17 Aug 2020 07:06:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C6EE26E1B8
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Aug 2020 10:02:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1597312954;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=kkFMyNBbOdtaKP3s0IKVuqUHyo7Vk4EymQC6D+Rwakc=;
 b=Rc188J3Ps3oRYU00AsDTa1+Y+SB2tH10tfMeBK/g8iYgSv4+pcrwka9q
 DVknnN1SulQYeo1DKWY4HVnM3T/e51Of7gdbvcdHqP3FJcT1GwByHOMgL
 weBVYWy/QJ1Kd9R+OC+RUQ3P4tqdwFGutcwtnqNHqD6OL8TOVsDI5Kqsr w=;
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: wDtbUOGkC+v+QIiO9GW5InSj95+N5bZvHh0cz2sCfx8x8/0y/wKXIBeFTsdWA5IVAl9fHYeLN9
 bkgatnmpc6dbgREHUynY40qpDjj/p707iFysIZlm+vriXLDuiKG2hWjEZM5lJMCBJKbBHnmRzT
 Ek4wVev1cfJou5ZUSJS2/wZJUJSBFN8IxZXcndS/Kdi0ZOoHWEwqy1VaqoDA1I5FfmKdrqia00
 lv846+KFNsoIoemtWsa3un39WI8J3cPm1e5CBVfxjR5zuJsQM3Dozc/9+9CouCiP2ZBQIjfCnw
 Sa8=
X-SBRS: 2.7
X-MesageID: 24601489
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.76,307,1592884800"; d="scan'208";a="24601489"
Date: Thu, 13 Aug 2020 12:02:26 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH v4 2/2] xen: add helpers to allocate unpopulated memory
Message-ID: <20200813100226.GG975@Air-de-Roger>
References: <20200811094447.31208-1-roger.pau@citrix.com>
 <20200811094447.31208-3-roger.pau@citrix.com>
 <20200813073337.GA16160@infradead.org>
 <20200813075420.GC975@Air-de-Roger>
 <20200813094946.GJ2352366@phenom.ffwll.local>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200813094946.GJ2352366@phenom.ffwll.local>
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
X-Mailman-Approved-At: Mon, 17 Aug 2020 07:06:11 +0000
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
Cc: Juergen
 Gross <jgross@suse.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>,
 Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
 David Airlie <airlied@linux.ie>, Yan Yankovskyi <yyankovskyi@gmail.com>,
 David Hildenbrand <david@redhat.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Michal Hocko <mhocko@kernel.org>,
 Christoph Hellwig <hch@infradead.org>, linux-mm@kvack.org,
 xen-devel@lists.xenproject.org, Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Dan Williams <dan.j.williams@intel.com>, Dan
 Carpenter <dan.carpenter@oracle.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

WW91ciBlbWFpbCBjbGllbnQgc2VlbXMgdG8gc2V0ICdSZXBseS10bzonIHRvIHBvaW50IHRvIGV2
ZXJ5b25lIG9uIHRoZQonQ2M6JyBmaWVsZCwgYnV0IG5vdCB5b3Vyc2VsZiwgd2hpY2ggaXMga2lu
ZCBvZiB3ZWlyZC4gSSd2ZSBtYW51YWxseQpmaXhlZCBpdCBvbiB0aGlzIHJlcGx5IGJ5IG1vdmlu
ZyBldmVyeW9uZSB0byB0aGUgJ0NjOicgZmllbGQgYW5kCnNldHRpbmcgeW91IG9uICdUbzonLgoK
T24gVGh1LCBBdWcgMTMsIDIwMjAgYXQgMTE6NDk6NDZBTSArMDIwMCwgRGFuaWVsIFZldHRlciB3
cm90ZToKPiBPbiBUaHUsIEF1ZyAxMywgMjAyMCBhdCAwOTo1NDoyMEFNICswMjAwLCBSb2dlciBQ
YXUgTW9ubsOpIHdyb3RlOgo+ID4gT24gVGh1LCBBdWcgMTMsIDIwMjAgYXQgMDg6MzM6MzdBTSAr
MDEwMCwgQ2hyaXN0b3BoIEhlbGx3aWcgd3JvdGU6Cj4gPiA+IE9uIFR1ZSwgQXVnIDExLCAyMDIw
IGF0IDExOjQ0OjQ3QU0gKzAyMDAsIFJvZ2VyIFBhdSBNb25uZSB3cm90ZToKPiA+ID4gPiBJZiBl
bmFibGVkIChiZWNhdXNlIFpPTkVfREVWSUNFIGlzIHN1cHBvcnRlZCkgdGhlIHVzYWdlIG9mIHRo
ZSBuZXcKPiA+ID4gPiBmdW5jdGlvbmFsaXR5IHVudGFuZ2xlcyBYZW4gYmFsbG9vbiBhbmQgUkFN
IGhvdHBsdWcgZnJvbSB0aGUgdXNhZ2Ugb2YKPiA+ID4gPiB1bnBvcHVsYXRlZCBwaHlzaWNhbCBt
ZW1vcnkgcmFuZ2VzIHRvIG1hcCBmb3JlaWduIHBhZ2VzLCB3aGljaCBpcyB0aGUKPiA+ID4gPiBj
b3JyZWN0IHRoaW5nIHRvIGRvIGluIG9yZGVyIHRvIGF2b2lkIG1hcHBpbmdzIG9mIGZvcmVpZ24g
cGFnZXMgZGVwZW5kCj4gPiA+ID4gb24gbWVtb3J5IGhvdHBsdWcuCj4gPiA+IAo+ID4gPiBTbyBw
bGVhc2UganVzdCBzZWxlY3QgWk9ORV9ERVZJQ0UgaWYgdGhpcyBpcyBzbyBtdWNoIGJldHRlciBy
YXRoZXIKPiA+ID4gdGhhbiBtYWludGFpbmluZyB0d28gdmFyaWFudHMuCj4gPiAKPiA+IFdlIHN0
aWxsIG5lZWQgdG8gb3RoZXIgdmFyaWFudCBmb3IgQXJtIGF0IGxlYXN0LCBzbyBib3RoIG5lZWQg
dG8gYmUKPiA+IG1haW50YWluZWQgYW55d2F5LCBldmVuIGlmIHdlIGZvcmNlIFpPTkVfREVWSUNF
IG9uIHg4Ni4KPiAKPiBXaHkgZG9lcyBhcm0gbm90IGhhdmUgWk9ORV9ERVZJQ0U/CgpJdCdzIG5v
dCB0aGF0IEFybSBkb2Vzbid0IGhhdmUgWk9ORV9ERVZJQ0UsIGl0J3MganVzdCB0aGF0IHRoZQph
cHByb2FjaCB1c2VkIGhlcmUgd29uJ3Qgd29yayBjb3JyZWN0bHkgb24gYW4gQXJtIFhlbiBkb20w
IGFzLWlzLgoKVGhpcyBpcyBkdWUgdG8gdGhlIHVzYWdlIG9mIGFuIGlkZW50aXR5IHNlY29uZCBz
dGFnZSB0cmFuc2xhdGlvbiBpbgpvcmRlciB0byB3b3JrYXJvdW5kIHRoZSBsYWNrIG9mIGFuIElP
TU1VIGluIHNvbWUgQXJtIGJvYXJkcy4KCkl0IGNhbiBiZSBtYWRlIHRvIHdvcmsgb24gQXJtLCBi
dXQgd2lsbCBsaWtlbHkgcmVxdWlyZSBzb21lb25lIGZyb20KdGhlIEFybSBzaWRlIGRvaW5nIHRo
YXQuCgpSb2dlci4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Cmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
Cg==
