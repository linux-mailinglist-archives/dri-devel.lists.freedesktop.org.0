Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 015622287BC
	for <lists+dri-devel@lfdr.de>; Tue, 21 Jul 2020 19:46:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB7516E2E6;
	Tue, 21 Jul 2020 17:46:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from pio-pvt-msa1.bahnhof.se (pio-pvt-msa1.bahnhof.se [79.136.2.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 97B406E2E6;
 Tue, 21 Jul 2020 17:46:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by pio-pvt-msa1.bahnhof.se (Postfix) with ESMTP id CB49A41421;
 Tue, 21 Jul 2020 19:46:32 +0200 (CEST)
Authentication-Results: pio-pvt-msa1.bahnhof.se; dkim=pass (1024-bit key;
 unprotected) header.d=shipmail.org header.i=@shipmail.org header.b="frDUmX6P";
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
 with ESMTP id 2pG5veMOGOdo; Tue, 21 Jul 2020 19:46:31 +0200 (CEST)
Received: from mail1.shipmail.org (h-205-35.A357.priv.bahnhof.se
 [155.4.205.35]) (Authenticated sender: mb878879)
 by pio-pvt-msa1.bahnhof.se (Postfix) with ESMTPA id B8F983F3B9;
 Tue, 21 Jul 2020 19:46:26 +0200 (CEST)
Received: from [192.168.0.100] (h-205-35.A357.priv.bahnhof.se [155.4.205.35])
 by mail1.shipmail.org (Postfix) with ESMTPSA id F165136010A;
 Tue, 21 Jul 2020 19:46:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=shipmail.org; s=mail;
 t=1595353586; bh=4uB31R2+QdLg394hPLx29A25rPq/9GLfA0vttAkzBpo=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=frDUmX6Pb56r4nJFS91NmtvI7DLzeVhvjaHlEz2Xvk+tfoPGQteOV/5DOErazBDCW
 IA3s0raY3MXcOdWP58C+hrLKx9k+xPlQlWoYful1aGabjti0/uWInAu7ikzGlVMFNk
 AKA8JWBHfIhnINvYQnCl7wjhvT3kkO+EFiEACWis=
Subject: Re: [Linaro-mm-sig] [PATCH 1/2] dma-buf.rst: Document why indefinite
 fences are a bad idea
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Daniel Vetter <daniel@ffwll.ch>
References: <20200707201229.472834-4-daniel.vetter@ffwll.ch>
 <20200709123339.547390-1-daniel.vetter@ffwll.ch>
 <93b673b7-bb48-96eb-dc2c-bd4f9304000e@shipmail.org>
 <20200721074157.GB3278063@phenom.ffwll.local>
 <3603bb71-318b-eb53-0532-9daab62dce86@amd.com>
 <57a5eb9d-b74f-8ce4-7199-94e911d9b68b@shipmail.org>
 <2ca2c004-1e11-87f5-4bd8-761e1b44d21f@amd.com>
 <74727f17-b3a5-ca12-6db6-e47543797b72@shipmail.org>
 <CAKMK7uFfMi5M5EkCeG6=tjuDANH4=gDLnFpxCYU-E-xyrxwYUg@mail.gmail.com>
 <ae4e4188-39e6-ec41-c11d-91e9211b4d3a@shipmail.org>
 <f8f73b9f-ce8d-ea02-7caa-d50b75b72809@amd.com>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m_=28Intel=29?= <thomas_os@shipmail.org>
Message-ID: <6ed364c9-893b-8974-501a-418585eb4def@shipmail.org>
Date: Tue, 21 Jul 2020 19:46:25 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <f8f73b9f-ce8d-ea02-7caa-d50b75b72809@amd.com>
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
Cc: Daniel Stone <daniels@collabora.com>,
 linux-rdma <linux-rdma@vger.kernel.org>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 Steve Pronovost <spronovo@microsoft.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Jason Ekstrand <jason@jlekstrand.net>, Jesse Natalie <jenatali@microsoft.com>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Thomas Hellstrom <thomas.hellstrom@intel.com>,
 Mika Kuoppala <mika.kuoppala@intel.com>,
 Felix Kuehling <Felix.Kuehling@amd.com>,
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Ck9uIDIwMjAtMDctMjEgMTU6NTksIENocmlzdGlhbiBLw7ZuaWcgd3JvdGU6Cj4gQW0gMjEuMDcu
MjAgdW0gMTI6NDcgc2NocmllYiBUaG9tYXMgSGVsbHN0csO2bSAoSW50ZWwpOgouLi4KPj4gWWVz
LCB3ZSBjYW4ndCBkbyBtYWdpYy4gQXMgc29vbiBhcyBhbiBpbmRlZmluaXRlIGJhdGNoIG1ha2Vz
IGl0IHRvIAo+PiBzdWNoIGhhcmR3YXJlIHdlJ3ZlIGxvc3QuIEJ1dCBzaW5jZSB3ZSBjYW4gYnJl
YWsgb3V0IHdoaWxlIHRoZSBiYXRjaCAKPj4gaXMgc3R1Y2sgaW4gdGhlIHNjaGVkdWxlciB3YWl0
aW5nLCB3aGF0IEkgYmVsaWV2ZSB3ZSAqY2FuKiBkbyB3aXRoIAo+PiB0aGlzIGFwcHJvYWNoIGlz
IHRvIGF2b2lkIGRlYWRsb2NrcyBkdWUgdG8gbG9jYWxseSB1bmtub3duIAo+PiBkZXBlbmRlbmNp
ZXMsIHdoaWNoIGhhcyBzb21lIGJlYXJpbmcgb24gdGhpcyBkb2N1bWVudGF0aW9uIHBhdGNoLCBh
bmQgCj4+IGFsc28gdG8gYWxsb3cgbWVtb3J5IGFsbG9jYXRpb24gaW4gZG1hLWZlbmNlIChub3Qg
bWVtb3J5LWZlbmNlKSAKPj4gY3JpdGljYWwgc2VjdGlvbnMsIGxpa2UgZ3B1IGZhdWx0LSBhbmQg
ZXJyb3IgaGFuZGxlcnMgd2l0aG91dCAKPj4gcmVzb3J0aW5nIHRvIHVzaW5nIG1lbW9yeSBwb29s
cy4KPgo+IEF2b2lkaW5nIGRlYWRsb2NrcyBpcyBvbmx5IHRoZSB0aXAgb2YgdGhlIGljZWJlcmcg
aGVyZS4KPgo+IFdoZW4geW91IGFsbG93IHRoZSBrZXJuZWwgdG8gZGVwZW5kIG9uIHVzZXIgc3Bh
Y2UgdG8gcHJvY2VlZCB3aXRoIHNvbWUgCj4gb3BlcmF0aW9uIHRoZXJlIGFyZSBhIGxvdCBtb3Jl
IHRoaW5ncyB3aGljaCBuZWVkIGNvbnNpZGVyYXRpb24uCj4KPiBFLmcuIHdoYXQgaGFwcGVucyB3
aGVuIGFuIHVzZXJzcGFjZSBwcm9jZXNzIHdoaWNoIGhhcyBzdWJtaXR0ZWQgc3R1ZmYgCj4gdG8g
dGhlIGtlcm5lbCBpcyBraWxsZWQ/IEFyZSB0aGUgcHJlcGFyZWQgY29tbWFuZHMgc2VuZCB0byB0
aGUgCj4gaGFyZHdhcmUgb3IgYWJvcnRlZCBhcyB3ZWxsPyBXaGF0IGRvIHdlIGRvIHdpdGggb3Ro
ZXIgcHJvY2Vzc2VzIAo+IHdhaXRpbmcgZm9yIHRoYXQgc3R1ZmY/Cj4KPiBIb3cgdG8gd2UgZG8g
cmVzb3VyY2UgYWNjb3VudGluZz8gV2hlbiBwcm9jZXNzZXMgbmVlZCB0byBibG9jayB3aGVuIAo+
IHN1Ym1pdHRpbmcgdG8gdGhlIGhhcmR3YXJlIHN0dWZmIHdoaWNoIGlzIG5vdCByZWFkeSB3ZSBo
YXZlIGEgcHJvY2VzcyAKPiB3ZSBjYW4gcHVuaXNoIGZvciBibG9ja2luZyByZXNvdXJjZXMuIEJ1
dCBob3cgaXMga2VybmVsIG1lbW9yeSB1c2VkIAo+IGZvciBhIHN1Ym1pc3Npb24gYWNjb3VudGVk
PyBIb3cgZG8gd2UgYXZvaWQgZGVueSBvZiBzZXJ2aWNlIGF0dGFja3MgCj4gaGVyZSB3ZXJlIHNv
bWVib2R5IGVhdHMgdXAgYWxsIG1lbW9yeSBieSBkb2luZyBzdWJtaXNzaW9ucyB3aGljaCBjYW4n
dCAKPiBmaW5pc2g/Cj4KSG1tLiBBcmUgdGhlc2UgcHJvYmxlbXMgcmVhbGx5IHVuaXF1ZSB0byB1
c2VyLXNwYWNlIGNvbnRyb2xsZWQgCmRlcGVuZGVuY2llcz8gQ291bGRuJ3QgeW91IGhpdCB0aGUg
c2FtZSBvciBzaW1pbGFyIHByb2JsZW1zIHdpdGggCm1pcy1iZWhhdmluZyBzaGFkZXJzIGJsb2Nr
aW5nIHRpbWVsaW5lIHByb2dyZXNzPwoKL1Rob21hcwoKCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZl
bEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFp
bG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
