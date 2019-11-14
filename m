Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4ED46FC671
	for <lists+dri-devel@lfdr.de>; Thu, 14 Nov 2019 13:42:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D69689BA9;
	Thu, 14 Nov 2019 12:42:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ste-pvt-msa1.bahnhof.se (ste-pvt-msa1.bahnhof.se
 [213.80.101.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CDA4D895C3
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Nov 2019 12:42:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by ste-pvt-msa1.bahnhof.se (Postfix) with ESMTP id E43533F84D;
 Thu, 14 Nov 2019 13:42:23 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at bahnhof.se
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level: 
X-Spam-Status: No, score=-2.099 tagged_above=-999 required=6.31
 tests=[BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, URIBL_BLOCKED=0.001]
 autolearn=ham autolearn_force=no
Received: from ste-pvt-msa1.bahnhof.se ([127.0.0.1])
 by localhost (ste-pvt-msa1.bahnhof.se [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FEIvLfxWKun2; Thu, 14 Nov 2019 13:42:23 +0100 (CET)
Received: from mail1.shipmail.org (h-205-35.A357.priv.bahnhof.se
 [155.4.205.35]) (Authenticated sender: mb878879)
 by ste-pvt-msa1.bahnhof.se (Postfix) with ESMTPA id 7B0E53F6DC;
 Thu, 14 Nov 2019 13:42:20 +0100 (CET)
Received: from localhost.localdomain (h-205-35.A357.priv.bahnhof.se
 [155.4.205.35])
 by mail1.shipmail.org (Postfix) with ESMTPSA id 970EF360103;
 Thu, 14 Nov 2019 13:42:20 +0100 (CET)
Subject: Re: [PATCH 3/3] drm/vmwgfx: Use coherent memory if there are dma
 mapping size restrictions
To: Christoph Hellwig <hch@infradead.org>
References: <20191114105645.41578-1-thomas_os@shipmail.org>
 <20191114105645.41578-4-thomas_os@shipmail.org>
 <20191114124001.GB11619@infradead.org>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m_=28VMware=29?= <thomas_os@shipmail.org>
Organization: VMware Inc.
Message-ID: <ebc96f86-43a0-f430-5bb0-8a1e7731d181@shipmail.org>
Date: Thu, 14 Nov 2019 13:42:19 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20191114124001.GB11619@infradead.org>
Content-Language: en-US
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=shipmail.org; s=mail; 
 t=1573735340; bh=v7C8Nt2OEgbijx2WW1WoHFJFTBImdHdh0QUFfaYkf/4=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=cFmYts+F5OUWyyCOtugWBERyLEhzqRO8DbhW/0OQOk57Mfo6nVyPlalthslrEM/va
 SyqCX9PLdk8xfwGvSnoWOJbhK/7Ahz8HhwKxGpSo3fODya20IzyAUj7TY05cQcK3pK
 chHUlxE6zzcQtMyBKCjvo7ZfEuRTiQep5ytCjX/s=
X-Mailman-Original-Authentication-Results: ste-pvt-msa1.bahnhof.se;
 dkim=pass (1024-bit key;
 unprotected) header.d=shipmail.org header.i=@shipmail.org header.b=cFmYts+F; 
 dkim-atps=neutral
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
Cc: Brian Paul <brianp@vmware.com>, Thomas Hellstrom <thellstrom@vmware.com>,
 linux-graphics-maintainer@vmware.com, dri-devel@lists.freedesktop.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMTEvMTQvMTkgMTo0MCBQTSwgQ2hyaXN0b3BoIEhlbGx3aWcgd3JvdGU6Cj4gT24gVGh1LCBO
b3YgMTQsIDIwMTkgYXQgMTE6NTY6NDVBTSArMDEwMCwgVGhvbWFzIEhlbGxzdHLDtm0gKFZNd2Fy
ZSkgd3JvdGU6Cj4+IEZyb206IFRob21hcyBIZWxsc3Ryb20gPHRoZWxsc3Ryb21Adm13YXJlLmNv
bT4KPj4KPj4gV2UncmUgZ3JhZHVhbGx5IG1vdmluZyB0b3dhcmRzIHVzaW5nIERNQSBjb2hlcmVu
dCBtZW1vcnkgaW4gbW9zdAo+PiBzaXR1YXRpb25zLCBhbHRob3VnaCBUVE0gaW50ZXJhY3Rpb25z
IHdpdGggdGhlIERNQSBsYXllcnMgaXMgc3RpbGwgYQo+PiB3b3JrLWluLXByb2dyZXNzLiBNZWFu
d2hpbGUsIHVzZSBjb2hlcmVudCBtZW1vcnkgd2hlbiB0aGVyZSBhcmUgc2l6ZQo+PiByZXN0cmlj
dGlvbnMgbWVhbmluZyB0aGF0IHRoZXJlIGlzIGEgY2hhbmNlIHRoYXQgc3RyZWFtaW5nIGRtYSBt
YXBwaW5nCj4+IG9mIGxhcmdlIGJ1ZmZlciBvYmplY3RzIG1heSBmYWlsLgo+IFVub2ZydHVuYXRl
bHkgdGhhdCBkbWEgbWFwcGluZyBzaXplIGNoZWNrIHJlYWxseSBpcyBjb21wbGV0ZWx5Cj4gYnJv
a2VuLiAgRm9yIGV4YW1wbGUgdGhlIHNwYXJjMzIgaW9tbXVzIGhhdmUgbWFwcGluZyBzaXplIGxp
bWl0YXRpb25zCj4gKHdoaWNoIHdlIGp1c3QgaGF2ZW4ndCB3aXJlZCB1cCB5ZXQpLCBidXQgd2ls
bCBuZXZlciBib3VuY2UgYnVmZmVyLgo+Cj4gTGV0IG1lIGNvb2sgdXAgYSByZWFsIEFQSSBmb3Ig
eW91IGluc3RlYWQuICBkbWFfYWRkcmVzc2luZ19saW1pdGVkKCkKPiBpcyBmdW5kYW1lbnRhbGx5
IHRoZSByaWdodCBjYWxsIGZvciB0aGlzLCB3ZSBqdXN0IG5lZWQgdG8gbWFrZSBpdAo+IGhhbmRs
ZSB0aGUgY29ybmVyIGNhc2VzIHlvdSBtZW50aW9uZWQgaW4gcmVwbHkgdG8gdGhlIGxhc3QgdmVy
c2lvbiBvZgo+IHlvdXIgcGF0Y2guCgpTb3VuZHMgZ3JlYXQhCgpUaGFua3MsCgpUaG9tYXMKCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwg
bWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
