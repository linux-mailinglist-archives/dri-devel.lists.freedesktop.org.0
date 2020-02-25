Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D5D9416BEA7
	for <lists+dri-devel@lfdr.de>; Tue, 25 Feb 2020 11:27:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 805EE6EA85;
	Tue, 25 Feb 2020 10:27:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com
 [210.118.77.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E1FF6EA80
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Feb 2020 10:27:05 +0000 (UTC)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20200225102703euoutp023ec26af60ba4266175d1e2df806afb2b~2nljUWXB12944729447euoutp02t
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Feb 2020 10:27:03 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20200225102703euoutp023ec26af60ba4266175d1e2df806afb2b~2nljUWXB12944729447euoutp02t
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1582626423;
 bh=wOSrejdDZ7hZo0kG4IgcL0rvap6+a55RADPjs1je5iE=;
 h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
 b=cmp3dBxS7U07RsSOqEetvEaNC6mXzVphtnXAQRBt15BfUZVAcAnsCUcTeLe758Bcz
 Zul6DdjQ7dPRLjJuryfbP4GYcGUB6nvbDGrlT0mH9N3SO6rAcgRWFOiav9rGApx8mz
 gOE1w4a9yfbvuEWDiQZmk7qF5py17NtXqstatc3s=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20200225102703eucas1p2302808efa3a8a948643b27e3a60a3948~2nljIFMKg1279212792eucas1p23;
 Tue, 25 Feb 2020 10:27:03 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges3new.samsung.com (EUCPMTA) with SMTP id 26.ED.60698.776F45E5; Tue, 25
 Feb 2020 10:27:03 +0000 (GMT)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20200225102702eucas1p120332ef5256504964c44df4e8f274f08~2nliuo1tk2692326923eucas1p1F;
 Tue, 25 Feb 2020 10:27:02 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20200225102702eusmtrp1cb1e82270bfbe2187bfda02873ec027b~2nliuCsW50864008640eusmtrp1W;
 Tue, 25 Feb 2020 10:27:02 +0000 (GMT)
X-AuditID: cbfec7f5-a29ff7000001ed1a-f7-5e54f6778c52
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
 eusmgms1.samsung.com (EUCPMTA) with SMTP id 84.28.08375.676F45E5; Tue, 25
 Feb 2020 10:27:02 +0000 (GMT)
Received: from [106.120.51.74] (unknown [106.120.51.74]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20200225102702eusmtip25036c3d418e7da51509ab0262cee8b16~2nliXrOU81019510195eusmtip2W;
 Tue, 25 Feb 2020 10:27:02 +0000 (GMT)
Subject: Re: [PATCH 03/51] drm: add managed resources tied to drm_device
To: Daniel Vetter <daniel.vetter@ffwll.ch>, DRI Development
 <dri-devel@lists.freedesktop.org>
From: Andrzej Hajda <a.hajda@samsung.com>
Message-ID: <c088ce3b-d409-3a66-1f45-72f8ee9d9784@samsung.com>
Date: Tue, 25 Feb 2020 11:27:01 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200221210319.2245170-4-daniel.vetter@ffwll.ch>
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrAKsWRmVeSWpSXmKPExsWy7djP87rl30LiDM738lgsfHiX2WL5mXXM
 Fle+vmezaF68ns1i9oTNTBadE5ewW8z9MpXZgd1j77cFLB6zO2ayeize85LJY9OqTjaP/XPX
 sHvc7z7OFMAWxWWTkpqTWZZapG+XwJXx8PNKloKbIhVfdu1kamDcLdDFyMkhIWAi8fnqPZYu
 Ri4OIYEVjBKLJ7QwQzhfGCW+z1zMBOF8ZpTYee80K0zL1mOTWUBsIYHljBKr+1Ugit4ySnS2
 rgVLCAt4SHTeOMMOYosIxEscnrGaHaSIWeA/o8T7y/fAJrEJaEr83XyTDcTmFbCTuD6vBcxm
 EVCVOD7lJFiNqECExLTt/xghagQlTs58ArSAg4MTqP5IE1iYWUBeonnrbGYIW1zi1pP5YFdL
 COxjl1i/cgYzxNUuEhdu9jBB2MISr45vYYewZSROT+5hgbDrJe6vgPhfQqCDUWLrhp1QzdYS
 d879YgNZzAx09Ppd+hBhR4m7i1eygoQlBPgkbrwVhLiBT2LStunMEGFeiY42IYhqRYn7Z7dC
 DRSXWHrhK9sERqVZSB6bheSbWUi+mYWwdwEjyypG8dTS4tz01GLjvNRyveLE3OLSvHS95Pzc
 TYzAdHT63/GvOxj3/Uk6xCjAwajEwyuxNzhOiDWxrLgy9xCjBAezkgivN2NQnBBvSmJlVWpR
 fnxRaU5q8SFGaQ4WJXFe40UvY4UE0hNLUrNTUwtSi2CyTBycUg2MLeKZSlVe2xyT5rG83Hyj
 ++TaxuBHn91v3N7jKlycoqD7N7L72o0mdzvlb6keezfcylZx5nPw2hux7JXSGova3nfBV846
 HNh4p/21oVagRNkiPYf9vB0XVk723nDIp4/fXuHKgb3MF6IebhcJSvj3v67RY/NeRa8VMS9K
 c3/Ot7EPsfack8ekxFKckWioxVxUnAgAeY9H4kMDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrCIsWRmVeSWpSXmKPExsVy+t/xe7pl30LiDJae07FY+PAus8XyM+uY
 La58fc9m0bx4PZvF7AmbmSw6Jy5ht5j7ZSqzA7vH3m8LWDxmd8xk9Vi85yWTx6ZVnWwe++eu
 Yfe4332cKYAtSs+mKL+0JFUhI7+4xFYp2tDCSM/Q0kLPyMRSz9DYPNbKyFRJ384mJTUnsyy1
 SN8uQS/j4eeVLAU3RSq+7NrJ1MC4W6CLkZNDQsBEYuuxySxdjFwcQgJLGSX2rXrGApEQl9g9
 /y0zhC0s8edaFxtE0WtGiccf94MlhAU8JDpvnGEHsUUE4iU6T5xmBCliFmhkknh56CQrRMdR
 RokLEzeyglSxCWhK/N18kw3E5hWwk7g+rwXMZhFQlTg+5SRYjahAhMTjie2MEDWCEidnPgE6
 iYODE6j+SBNYmFlAXeLPvEvMELa8RPPW2VC2uMStJ/OZJjAKzULSPQtJyywkLbOQtCxgZFnF
 KJJaWpybnltsqFecmFtcmpeul5yfu4kRGIPbjv3cvIPx0sbgQ4wCHIxKPLwSe4PjhFgTy4or
 cw8xSnAwK4nwejMGxQnxpiRWVqUW5ccXleakFh9iNAX6bSKzlGhyPjA95JXEG5oamltYGpob
 mxubWSiJ83YIHIwREkhPLEnNTk0tSC2C6WPi4JRqYIzSPbBkjyDncZ8UwY8L183byOQVmhaX
 UtST+pJ1Sa7Ps1d7e3e+/M0x7XzxJosbjxzCdvo96b1wOeL8/ReZivOL65/dmiKv8v3JTpEZ
 030jVBmZbtYemr1h66sne2qen+IqmCLFPnvKGU3fggn6Pw/Ubt6YrK+nNP3EQz7+aSIfirky
 JDKcpk5TYinOSDTUYi4qTgQAYHF0JNcCAAA=
X-CMS-MailID: 20200225102702eucas1p120332ef5256504964c44df4e8f274f08
X-Msg-Generator: CA
X-RootMTR: 20200221210354eucas1p1b9377cb5c64ae9f657191cf7d6c9e92c
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200221210354eucas1p1b9377cb5c64ae9f657191cf7d6c9e92c
References: <20200221210319.2245170-1-daniel.vetter@ffwll.ch>
 <CGME20200221210354eucas1p1b9377cb5c64ae9f657191cf7d6c9e92c@eucas1p1.samsung.com>
 <20200221210319.2245170-4-daniel.vetter@ffwll.ch>
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
Cc: Daniel Vetter <daniel.vetter@intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgRGFuaWVsLAoKClRoZSBwYXRjaHNldCBsb29rcyBpbnRlcmVzdGluZy4KCgpPbiAyMS4wMi4y
MDIwIDIyOjAyLCBEYW5pZWwgVmV0dGVyIHdyb3RlOgo+IFdlIGhhdmUgbG90cyBvZiB0aGVzZS4g
QW5kIHRoZSBjbGVhbnVwIGNvZGUgdGVuZHMgdG8gYmUgb2YgZHViaW91cwo+IHF1YWxpdHkuIFRo
ZSBiaWdnZXN0IHdyb25nIHBhdHRlcm4gaXMgdGhhdCBkZXZlbG9wZXJzIHVzZSBkZXZtXywgd2hp
Y2gKPiB0aWVzIHRoZSByZWxlYXNlIGFjdGlvbiB0byB0aGUgdW5kZXJseWluZyBzdHJ1Y3QgZGV2
aWNlLCB3aGVyZWFzCj4gYWxsIHRoZSB1c2Vyc3BhY2UgdmlzaWJsZSBzdHVmZiBhdHRhY2hlZCB0
byBhIGRybV9kZXZpY2UgY2FuIGxvbmcKPiBvdXRsaXZlIHRoYXQgb25lIChlLmcuIGFmdGVyIGEg
aG90dW5wbHVnIHdoaWxlIHVzZXJzcGFjZSBoYXMgb3Blbgo+IGZpbGVzIGFuZCBtbWFwJ2VkIGJ1
ZmZlcnMpLiBHaXZlIHBlb3BsZSB3aGF0IHRoZXkgd2FudCwgYnV0IHdpdGggbW9yZQo+IGNvcnJl
Y3RuZXNzLgoKCkkgYW0gbm90IGZhbWlsaWFyIHdpdGggdGhpcyBzdHVmZiwgc28gZm9yZ2l2ZSBt
ZSBzdHVwaWQgcXVlc3Rpb25zLgoKSXMgaXQgZG9jdW1lbnRlZCBob3cgdWFwaSBzaG91bGQgYmVo
YXZlIGluIHN1Y2ggY2FzZT8KCkkgZ3Vlc3MgdGhlIGdlbmVyYWwgcnVsZSBpcyB0byByZXR1cm4g
ZXJyb3JzIG9uIG1vc3QgaW9jdGxzIChFTk9ERVYsCkVJTz8pLCBhbmQgd2FpdCB1bnRpbCB1c2Vy
c3BhY2UgcmVsZWFzZXMgZXZlcnl0aGluZywgYXMgdGhlcmUgaXMgbm90Cm11Y2ggbW9yZSB0byBk
by4KCklmIHRoYXQgaXMgdHJ1ZSB3aGF0IGlzIHRoZSBwb2ludCBvZiBrZWVwaW5nIHRoZXNlIHN0
cnVjdHMgYW55d2F5IC0KdHJpdmlhbCBmdW5jdGlvbnMgd2l0aCBzbWFsbCBjb250ZXh0IGRhdGEg
c2hvdWxkIGRvIHRoZSBqb2IuCgpJIHN1c3BlY3QgSSBhbSBtaXNzaW5nIHNvbWV0aGluZyBidXQg
SSBkbyBub3Qga25vdyB3aGF0IDopCgoKPgo+IE1vc3RseSBjb3BpZWQgZnJvbSBkZXZyZXMuYywg
d2l0aCB0eXBlcyBhZGp1c3RlZCB0byBmaXQgZHJtX2RldmljZSBhbmQKPiBhIGZldyBzaW1wbGlm
aWNhdGlvbnMgLSBJIGRpZG4ndCAoeWV0KSBjb3B5IG92ZXIgZXZlcnl0aGluZy4gU2luY2UKPiB0
aGUgdHlwZXMgZG9uJ3QgbWF0Y2ggY29kZSBzaGFyaW5nIGxvb2tlZCBsaWtlIGEgaG9wZWxlc3Mg
ZW5kZWF2b3VyLgo+Cj4gRm9yIG5vdyBpdCdzIG9ubHkgc3VwZXIgc2ltcGxpZmllZCwgbm8gZ3Jv
dXBzLCB5b3UgY2FuJ3QgcmVtb3ZlCj4gYWN0aW9ucyAoYnV0IGtmcmVlIGV4aXN0cywgd2UnbGwg
bmVlZCB0aGF0IHNvb24pLiBQbHVzIGFsbCBzcGVjaWZpYyB0bwo+IGRybV9kZXZpY2Ugb2ZjLCBp
bmNsdWRpbmcgdGhlIGxvZ2dpbmcuIFdoaWNoIEkgZGlkbid0IGJvdGhlciB0byBtYWtlCj4gY29t
cGlsZS10aW1lIG9wdGlvbmFsLCBzaW5jZSBub25lIG9mIHRoZSBvdGhlciBkcm0gbG9nZ2luZyBp
cyBjb21waWxlCj4gdGltZSBvcHRpb25hbCBlaXRoZXIuCgoKSSBzYXcgaW4gdjEgdGhyZWFkIHRo
YXQgY29weS9wYXN0ZSBpcyBPSyBhbmQgbWVyZ2luZyBiYWNrIGRldnJlcyBhbmQKZHJtcmVzIGNh
biBiZSBkb25lIGxhdGVyLCBidXQgZXhwZXJpZW5jZSBzaG93cyB0aGF0IGFmdGVyIHNob3J0IHRp
bWUKdGhpbmdzIGdldCBkZS1zeW5jaHJvbml6ZWQgYW5kIG1lcmdpbmcgcHJvY2VzcyBiZWNvbWVz
IHF1aXRlIHBhaW5mdWwuCgpPbiB0aGUgb3RoZXIgc2lkZSBJIGd1ZXNzIGl0IHNob3VsZG4ndCBi
ZSBkaWZmaWN1bHQgdG8gc3BsaXQgZGV2cmVzIGludG8KY29uc3VtZXIgYWdub3N0aWMgY29yZSBh
bmQgInN0cnVjdCBkZXZpY2UiIGhlbHBlcnMgYW5kIHRoZW4gdXNlIHRoZSBjb3JlCmluIGRybS4K
CkZvciBleGFtcGxlIGN1cnJlbnRseSBkZXZyZXMgdXNlcyB0d28gZmllbGRzIGZyb20gc3RydWN0
IGRldmljZToKCsKgwqDCoCBzcGlubG9ja190wqDCoMKgIMKgwqDCoCBkZXZyZXNfbG9jazsKwqDC
oMKgIHN0cnVjdCBsaXN0X2hlYWTCoMKgwqAgZGV2cmVzX2hlYWQ7CgpMZXRzIHB1dCBpdCBpbnRv
IHNlcGFyYXRlIHN0cnVjdDoKCnN0cnVjdCBkZXZyZXMgewoKwqDCoMKgIHNwaW5sb2NrX3TCoMKg
wqAgwqDCoMKgIGxvY2s7CsKgwqDCoCBzdHJ1Y3QgbGlzdF9oZWFkwqDCoMKgIGhlYWQ7Cgp9OwoK
QW5kIGVtYmVkIHRoaXMgc3RydWN0IGludG8gInN0cnVjdCBkZXZpY2UiLgoKVGhlbiBjb252ZXJ0
IGFsbCBjb3JlIGRldnJlcyBmdW5jdGlvbnMgdG8gdGFrZSAic3RydWN0IGRldnJlcyAqIgphcmd1
bWVudCBpbnN0ZWFkIG9mICJzdHJ1Y3QgZGV2aWNlICoiIGFuZCB0aGVuIHRoZXNlIGNvcmUgZnVu
Y3Rpb25zIGNhbgpiZSB1c2FibGUgaW4gZHJtLgoKTG9va3MgcXVpdGUgc2ltcGxlIHNlcGFyYXRp
b24gb2YgYWJzdHJhY3Rpb24gKGRldnJlcykgYW5kIGl0cyBjb25zdW1lcgooc3RydWN0IGRldmlj
ZSkuCgpBZnRlciBzdWNoIHNwbGl0IG9uZSBjb3VsZCB0aGluayBhYm91dCBjaGFuZ2luZyBuYW1l
IGRldnJlcyB0byBzb21ldGhpbmcKbW9yZSByZWxpYWJsZS4KCgpSZWdhcmRzCgpBbmRyemVqCgoK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZl
bCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xp
c3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
