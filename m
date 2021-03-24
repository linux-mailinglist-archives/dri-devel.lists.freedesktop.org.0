Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DED533475B5
	for <lists+dri-devel@lfdr.de>; Wed, 24 Mar 2021 11:19:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 360F26E9AE;
	Wed, 24 Mar 2021 10:19:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from pio-pvt-msa1.bahnhof.se (pio-pvt-msa1.bahnhof.se [79.136.2.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B8AD78928B;
 Wed, 24 Mar 2021 10:19:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by pio-pvt-msa1.bahnhof.se (Postfix) with ESMTP id 35AF340786;
 Wed, 24 Mar 2021 11:19:19 +0100 (CET)
Authentication-Results: pio-pvt-msa1.bahnhof.se; dkim=pass (1024-bit key;
 unprotected) header.d=shipmail.org header.i=@shipmail.org header.b="p/ga4rbK";
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at bahnhof.se
X-Spam-Flag: NO
X-Spam-Score: -2.1
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 tagged_above=-999 required=6.31
 tests=[BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 URIBL_BLOCKED=0.001] autolearn=ham autolearn_force=no
Received: from pio-pvt-msa1.bahnhof.se ([127.0.0.1])
 by localhost (pio-pvt-msa1.bahnhof.se [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Nkyg8rexJ_mO; Wed, 24 Mar 2021 11:19:17 +0100 (CET)
Received: by pio-pvt-msa1.bahnhof.se (Postfix) with ESMTPA id DD0D03F59B;
 Wed, 24 Mar 2021 11:19:15 +0100 (CET)
Received: from [192.168.0.209] (unknown [192.198.151.43])
 by mail1.shipmail.org (Postfix) with ESMTPSA id 954323605CC;
 Wed, 24 Mar 2021 11:19:14 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=shipmail.org; s=mail;
 t=1616581155; bh=ReL4kU6p0A3xJmm5e9+5DjGbG6+nH8ClqOXvHRKPGkg=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=p/ga4rbKAZToQyMybhElmaK3KaJG2OfJ8rJTiUUZ60fnYIQVNXq+hUGO9ItWCrRn/
 kkjfPaPXKWL43jWPF028fu94NPagzTH2vO4+6TmU5FGGRqyShfeSdSQUVUg4EoC4Ly
 9eKH7HTw77F9aha3mOYK6x/u4msl+c8Na6jhF2pM=
Subject: Re: [PATCH] drm/ttm: stop warning on TT shrinker failure
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Michal Hocko <mhocko@suse.com>
References: <c78457bb-d93a-ff84-1cce-0fb3fa9f0cec@gmail.com>
 <YFma+ZxncvfBd++o@dhcp22.suse.cz> <YFnQ1Lk6BTo8L7pr@phenom.ffwll.local>
 <cd17d2ca-140e-1e69-37ac-c2726cc1ef9f@gmail.com>
 <YFnZMzs2wYGWqowi@dhcp22.suse.cz>
 <75ff80c5-a054-d13d-85c1-0040addb45d2@gmail.com>
 <YFng9qXM3NdrGHTx@dhcp22.suse.cz>
 <20808d08-b66c-13c3-f672-ebce216b2fa2@gmail.com>
 <YFnwBTF0YntCXFeG@dhcp22.suse.cz>
 <e5659cd0-61b2-82bd-64c3-76bd631b4522@amd.com>
 <YFoFdOtYDAezpSLv@dhcp22.suse.cz>
 <03889c00-bb5d-ef20-12c6-7e77df073dd9@amd.com>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m_=28Intel=29?= <thomas_os@shipmail.org>
Message-ID: <762c4597-e9bd-6d8d-51b5-16b04f913eb8@shipmail.org>
Date: Wed, 24 Mar 2021 11:19:13 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <03889c00-bb5d-ef20-12c6-7e77df073dd9@amd.com>
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
Cc: Matthew Wilcox <willy@infradead.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, Linux MM <linux-mm@kvack.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Dave Chinner <dchinner@redhat.com>, Leo Liu <Leo.Liu@amd.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Ck9uIDMvMjMvMjEgNDo0NSBQTSwgQ2hyaXN0aWFuIEvDtm5pZyB3cm90ZToKPiBBbSAyMy4wMy4y
MSB1bSAxNjoxMyBzY2hyaWViIE1pY2hhbCBIb2NrbzoKPj4gT24gVHVlIDIzLTAzLTIxIDE0OjU2
OjU0LCBDaHJpc3RpYW4gS8O2bmlnIHdyb3RlOgo+Pj4gQW0gMjMuMDMuMjEgdW0gMTQ6NDEgc2No
cmllYiBNaWNoYWwgSG9ja286Cj4+IFsuLi5dCj4+Pj4gQW55d2F5LCBJIGFtIHdvbmRlcmluZyB3
aGV0aGVyIHRoZSBvdmVyYWxsIGFwcHJvYWNoIGlzIHNvdW5kLiBXaHkgCj4+Pj4gZG9uJ3QKPj4+
PiB5b3Ugc2ltcGx5IHVzZSBzaG1lbSBhcyB5b3VyIGJhY2tpbmcgc3RvcmFnZSBmcm9tIHRoZSBi
ZWdpbm5pbmcgYW5kIAo+Pj4+IHBpbgo+Pj4+IHRob3NlIHBhZ2VzIGlmIHRoZXkgYXJlIHVzZWQg
YnkgdGhlIGRldmljZT8KPj4+IFllYWgsIHRoYXQgaXMgZXhhY3RseSB3aGF0IHRoZSBJbnRlbCBn
dXlzIGFyZSBkb2luZyBmb3IgdGhlaXIgCj4+PiBpbnRlZ3JhdGVkCj4+PiBHUFVzIDopCj4+Pgo+
Pj4gUHJvYmxlbSBpcyBmb3IgVFRNIEkgbmVlZCB0byBiZSBhYmxlIHRvIGhhbmRsZSBkR1BVcyBh
bmQgdGhvc2UgaGF2ZSBhbGwKPj4+IGtpbmRzIG9mIGZ1bm55IGFsbG9jYXRpb24gcmVzdHJpY3Rp
b25zLiBJbiBvdGhlciB3b3JkcyBJIG5lZWQgdG8gCj4+PiBndWFyYW50ZWUKPj4+IHRoYXQgdGhl
IGFsbG9jYXRlZCBtZW1vcnkgaXMgY29oZXJlbnQgYWNjZXNzaWJsZSB0byB0aGUgR1BVIHdpdGhv
dXQgCj4+PiB1c2luZwo+Pj4gU1dJT1RMQi4KPj4+Cj4+PiBUaGUgc2ltcGxlIGNhc2UgaXMgdGhh
dCB0aGUgZGV2aWNlIGNhbiBvbmx5IGRvIERNQTMyLCBidXQgeW91IGFsc28gZ290Cj4+PiBkZXZp
Y2Ugd2hpY2ggY2FuIG9ubHkgZG8gNDBiaXRzIG9yIDQ4Yml0cy4KPj4+Cj4+PiBPbiB0b3Agb2Yg
dGhhdCB5b3UgYWxzbyBnb3QgQUdQLCBDTUEgYW5kIHN0dWZmIGxpa2UgQ1BVIGNhY2hlIGJlaGF2
aW9yCj4+PiBjaGFuZ2VzICh3cml0ZSBiYWNrIHZzLiB3cml0ZSB0aHJvdWdoLCB2cy4gdW5jYWNo
ZWQpLgo+PiBPSywgc28gdGhlIHVuZGVybHlpbmcgcHJvYmxlbSBzZWVtcyB0byBiZSB0aGF0IGdm
cCBtYXNrICh0aHVzCj4+IG1hcHBpbmdfZ2ZwX21hc2spIGNhbm5vdCByZWFsbHkgcmVmbGVjdCB5
b3VyIHJlcXVpcmVtZW50cywgcmlnaHQ/wqAgV291bGQKPj4gaXQgaGVscCBpZiBzaG1lbSB3b3Vs
ZCBhbGxvdyB0byBwcm92aWRlIGFuIGFsbG9jYXRpb24gY2FsbGJhY2sgdG8KPj4gb3ZlcnJpZGUg
YWxsb2NfcGFnZV92bWEgd2hpY2ggaXMgdXNlZCBjdXJyZW50bHk/IEkgYW0gcHJldHR5IHN1cmUg
dGhlcmUKPj4gd2lsbCBiZSBtb3JlIHRvIGhhbmRsZSBidXQgZ29pbmcgdGhyb3VnaCBzaG1lbSBm
b3IgdGhlIHdob2xlIGxpZmUgdGltZQo+PiBpcyBqdXN0IHNvIG11Y2ggZWFzaWVyIHRvIHJlYXNv
biBhYm91dCB0aGFuIHNvbWUgdHJpY2tzIHRvIGFidXNlIHNobWVtCj4+IGp1c3QgZm9yIHRoZSBz
d2Fwb3V0IHBhdGguCj4KPiBXZWxsIGl0J3MgYSBzdGFydCwgYnV0IHRoZSBwYWdlcyBjYW4gaGF2
ZSBzcGVjaWFsIENQVSBjYWNoZSBzZXR0aW5ncy4gCj4gU28gZGlyZWN0IElPIGZyb20vdG8gdGhl
bSB1c3VhbGx5IGRvZXNuJ3Qgd29yayBhcyBleHBlY3RlZC4KPgo+IEFkZGl0aW9uYWwgdG8gdGhh
dCBmb3IgQUdQIGFuZCBDTUEgSSBuZWVkIHRvIG1ha2Ugc3VyZSB0aGF0IEkgZ2l2ZSAKPiB0aG9z
ZSBwYWdlcyBiYWNrIHRvIHRoZSByZWxldmFudCBzdWJzeXN0ZW1zIGluc3RlYWQgb2YganVzdCBk
cm9wcGluZyAKPiB0aGUgcGFnZSByZWZlcmVuY2UuCj4KPiBTbyBJIHdvdWxkIG5lZWQgdG8gYmxv
Y2sgZm9yIHRoZSBzd2FwaW8gdG8gYmUgY29tcGxldGVkLgo+Cj4gQW55d2F5IEkgcHJvYmFibHkg
bmVlZCB0byByZXZlcnQgdGhvc2UgcGF0Y2hlcyBmb3Igbm93IHNpbmNlIHRoaXMgCj4gaXNuJ3Qg
d29ya2luZyBhcyB3ZSBob3BlZCBpdCB3b3VsZC4KPgo+IFRoYW5rcyBmb3IgdGhlIGV4cGxhbmF0
aW9uIGhvdyBzdHVmZiB3b3JrcyBoZXJlLgoKQW5vdGhlciBhbHRlcm5hdGl2ZSBoZXJlIHRoYXQg
SSd2ZSB0cmllZCBiZWZvcmUgd2l0aG91dCBiZWluZyBzdWNjZXNzZnVsIAp3b3VsZCBwZXJoYXBz
IGJlIHRvIGRyb3Agc2htZW0gY29tcGxldGVseSBhbmQsIGlmIGl0J3MgYSBub3JtYWwgcGFnZSAo
bm8gCmRtYSBvciBmdW5ueSBjYWNoaW5nIGF0dHJpYnV0ZXMpIGp1c3QgdXNlIGFkZF90b19zd2Fw
X2NhY2hlKCk/IElmIGl0J3MgCnNvbWV0aGluZyBlbHNlLCB0cnkgYWxsb2MgYSBwYWdlIHdpdGgg
cmVsZXZhbnQgZ2ZwIGF0dHJpYnV0ZXMsIGNvcHkgYW5kIAphZGRfdG9fc3dhcF9jYWNoZSgpPyBP
ciBwZXJoYXBzIHRoYXQgZG9lc24ndCB3b3JrIHdlbGwgZnJvbSBhIHNocmlua2VyIAplaXRoZXI/
CgovVGhvbWFzCgoKCj4KPiBDaHJpc3RpYW4uCj4gX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KPiBkcmktZGV2ZWwgbWFpbGluZyBsaXN0Cj4gZHJpLWRldmVs
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+IGh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21h
aWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2RyaS1kZXZlbAo=
