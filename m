Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DEF117A0E5
	for <lists+dri-devel@lfdr.de>; Thu,  5 Mar 2020 09:14:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1249B6EB85;
	Thu,  5 Mar 2020 08:14:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 901 seconds by postgrey-1.36 at gabe;
 Wed, 04 Mar 2020 12:34:25 UTC
Received: from mickerik.phytec.de (mickerik.phytec.de [195.145.39.210])
 by gabe.freedesktop.org (Postfix) with ESMTP id 5A43F6E165
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Mar 2020 12:34:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; d=phytec.de; s=a1; c=relaxed/simple;
 q=dns/txt; i=@phytec.de; t=1583324362; x=1585916362;
 h=From:Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=P67BHzOadaD+8Z+VUpCLR7FEnHnX3tGG0aKP75ZSUuM=;
 b=DPpoiHIKpJjZX/MqzWPMtcGUWbL0oLXw1SB3fiIlH+o5fpQXC2YIFztmt5jyOAca
 SpOcG3tzI3+hK+Gh3z2N4gbq37uhpDUF6nxavSNepOVqi/y++s8hOkxcXuhG0wRp
 pWVfy1W7bWpdv5DGicw3yuL5e20ZAJrDheNiZwrrXzo=;
X-AuditID: c39127d2-dcfff7000000245c-c6-5e5f9cca8577
Received: from idefix.phytec.de (Unknown_Domain [172.16.0.10])
 by mickerik.phytec.de (PHYTEC Mail Gateway) with SMTP id 1F.5E.09308.ACC9F5E5;
 Wed,  4 Mar 2020 13:19:22 +0100 (CET)
Received: from [172.16.23.108] ([172.16.23.108])
 by idefix.phytec.de (IBM Domino Release 9.0.1FP7)
 with ESMTP id 2020030413192272-274053 ;
 Wed, 4 Mar 2020 13:19:22 +0100 
Subject: Re: [PATCH 10/33] drm/panel-simple: Fix dotclock for AUO G104SN02 V2
To: chf.fritz@googlemail.com, Ville Syrjala <ville.syrjala@linux.intel.com>,
 dri-devel@lists.freedesktop.org
References: <20200302203452.17977-1-ville.syrjala@linux.intel.com>
 <20200302203452.17977-11-ville.syrjala@linux.intel.com>
 <c6dac7c9ba4eb02ec60419e03b5a0afe0160a2ec.camel@googlemail.com>
From: =?UTF-8?Q?Stefan_Riedm=c3=bcller?= <s.riedmueller@phytec.de>
Message-ID: <0c145d7e-ab26-dc04-c475-b99ee181efd0@phytec.de>
Date: Wed, 4 Mar 2020 13:19:22 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <c6dac7c9ba4eb02ec60419e03b5a0afe0160a2ec.camel@googlemail.com>
X-MIMETrack: Itemize by SMTP Server on Idefix/Phytec(Release 9.0.1FP7|August
 17, 2016) at 04.03.2020 13:19:22,
 Serialize by Router on Idefix/Phytec(Release 9.0.1FP7|August  17, 2016) at
 04.03.2020 13:19:22
X-TNEFEvaluated: 1
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrCLMWRmVeSWpSXmKPExsWyRoCBS/fUnPg4gx1zdSye3bzFZnHl63s2
 i/97drBb3P7NZ/H930ImB1aPpxMms3tsWtXJ5jHvZKDH/e7jTB69ze/YAlijuGxSUnMyy1KL
 9O0SuDIePLnDUvCCo2Ljg3mMDYxN7F2MnBwSAiYS37tmM3YxcnEICWxllPiy5QMrhHOaUeLZ
 i/UsXYwcHMICvhJLFuiCmCICORK3jxSD9DILuEncfrafHaJ8H6NEa/8FNpAEm4CTxOLzHWA2
 r4CNxNpHe8FsFgEVib6l05hAbFGBCInn228wQtQISpyc+YQFxOYU8JH482wu2FAJgSuMErdP
 3maDuFRI4vTis8wQm80k5m1+CGWLS9x6Mp8JwtaWWLbwNfMERqFZSObOQtIyC0nLLCQtCxhZ
 VjEK5WYmZ6cWZWbrFWRUlqQm66WkbmIExsThieqXdjD2zfE4xMjEwXiIUYKDWUmEV9g0Pk6I
 NyWxsiq1KD++qDQntfgQozQHi5I47wbekjAhgfTEktTs1NSC1CKYLBMHp1QD49KNHbweohdC
 H/mu+fL885YLhREfVXZlSp66u2iVW9KyhFDL9/kpbzh2mr8+Grz1ooHQ+s9vk0L+KTusjKoQ
 PnpWOf7i2nkFD1ju6fnrnnG7X/XavDPmmOjmRuegw5YZP18x+6WtOjGxKndaitrFjqdPRTI7
 nPmbjsoUNVhofM1XcBX7L54TpsRSnJFoqMVcVJwIAJ66T0V3AgAA
X-Mailman-Approved-At: Thu, 05 Mar 2020 08:14:30 +0000
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
Cc: Thierry Reding <treding@nvidia.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgVmlsbGUsIGhpIENocmlzdG9waCwKCk9uIDAzLjAzLjIwIDE0OjEzLCBDaHJpc3RvcGggRnJp
dHogd3JvdGU6Cj4gT24gTW9uLCAyMDIwLTAzLTAyIGF0IDIyOjM0ICswMjAwLCBWaWxsZSBTeXJq
YWxhIHdyb3RlOgo+PiBGcm9tOiBWaWxsZSBTeXJqw6Rsw6QgPHZpbGxlLnN5cmphbGFAbGludXgu
aW50ZWwuY29tPgo+Pgo+PiBUaGUgY3VycmVudGx5IGxpc3RlZCBkb3RjbG9jayBkaXNhZ3JlZXMg
d2l0aCB0aGUgY3VycmVudGx5Cj4+IGxpc3RlZCB2cmVmcmVzaCByYXRlLiBDaGFuZ2UgdGhlIGRv
dGNsb2NrIHRvIG1hdGNoIHRoZSB2cmVmcmVzaC4KPj4KPj4gU29tZW9uZSB0ZWxsIG1lIHdoaWNo
IChpZiBlaXRoZXIpIG9mIHRoZSBkb3RjbG9jayBvciB2cmVyZXNoIGlzCj4+IGNvcnJlY3Q/CgpU
aGUgNDAgTUh6IGNsb2NrIGNvbWVzIGZyb20gdGhlIGRhdGFzaGVldCB3aGljaCBzdGF0ZXMgdGhp
cyBhcyB0aGUgdHlwaWNhbCAKY2xvY2sgZnJlcXVlbmN5LiBCdXQgdGhlIHZhbGlkIHJhbmdlIHJl
YWNoZXMgZnJvbSAzMCBNSHogdG8gNTAgTUh6LiBUaGUgCmRhdGFzaGVldCBhbHNvIHN0YXRlcyBh
IDYwIEh6IGZyYW1lIHJhdGUgc28gc2V0dGluZyB0aGUgY2xvY2sgdG8gdGhlIApjb3JyZXNwb25k
aW5nIGZyZXF1ZW5jeSBtYWtlcyBzZW5zZSB0byBtZS4KCkkgZ2F2ZSBpdCBhIGxpdHRsZSB0ZXN0
IGhlcmUgYW5kIGJvdGggdmFsdWVzIHdvcmsgZm9yIG1lLgoKUmVnYXJkcywKU3RlZmFuCgo+IAo+
IFRoaXMgZGlzcGxheSAoYSBjb250cm9sbGVyIGlzIGluY2x1ZGVkKSBoYXMgYSB3aWRlIHRvbGVy
YW5jZSByYW5nZS4KPiAKPiBBZGFwdGluZyBjbG9jayBzaG91bGQgYmUgZmluZSB3aGlsZSBrZWVw
aW5nIHZyZWZyZXNoIHJhdGUgYXQgNjAgSHouCj4gCj4gSSBndWVzcyBhbiBldmVuIGJldHRlciBh
bHRlcm5hdGl2ZSB3b3VsZCBiZSB0byBjaGFuZ2UgdGhpcyBjb25maWcgdG8gYQo+IHBpeGVsY2xv
Y2sgZGVzY3JpYmluZyBvbmUgbGlrZSB0aGUgb3RoZXIgYXVvIHBhbmVscy4KPiAKPiBCdXQgYXQg
dGhlIG1vbWVudCBJJ20gbm90IGhhdmluZyBhIGRpc3BsYXkgaGVyZS4KPiAKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlz
dApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
