Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 184B7348295
	for <lists+dri-devel@lfdr.de>; Wed, 24 Mar 2021 21:08:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED64F6EA75;
	Wed, 24 Mar 2021 20:08:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ste-pvt-msa1.bahnhof.se (ste-pvt-msa1.bahnhof.se
 [213.80.101.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3554E6EA75
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Mar 2021 20:08:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by ste-pvt-msa1.bahnhof.se (Postfix) with ESMTP id 880A241C23;
 Wed, 24 Mar 2021 21:08:00 +0100 (CET)
Authentication-Results: ste-pvt-msa1.bahnhof.se; dkim=pass (1024-bit key;
 unprotected) header.d=shipmail.org header.i=@shipmail.org header.b=P+s2NS8J; 
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at bahnhof.se
X-Spam-Flag: NO
X-Spam-Score: -2.1
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 tagged_above=-999 required=6.31
 tests=[BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 URIBL_BLOCKED=0.001] autolearn=ham autolearn_force=no
Received: from ste-pvt-msa1.bahnhof.se ([127.0.0.1])
 by localhost (ste-pvt-msa1.bahnhof.se [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mMze0gdUSJgY; Wed, 24 Mar 2021 21:07:59 +0100 (CET)
Received: by ste-pvt-msa1.bahnhof.se (Postfix) with ESMTPA id 5FEB83F660;
 Wed, 24 Mar 2021 21:07:56 +0100 (CET)
Received: from [10.249.254.166] (unknown [192.198.151.44])
 by mail1.shipmail.org (Postfix) with ESMTPSA id 689EC36062E;
 Wed, 24 Mar 2021 21:07:55 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=shipmail.org; s=mail;
 t=1616616476; bh=3qCxYoZfXVcIr6IpgNofra0wmJqpRFAzpDo4oMeG2n4=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=P+s2NS8JR6bgZjWtEWtrP50nVsF5NTzm85ecSAvPaeaV2HAmU4h5YlAYuj/1/OfJN
 yMZPRJgOAIMozwhOd8Mc3SWg9rvlQuobgmFUAtCRsC0FE7IV+Yux+l6tIBgP8OoGKG
 I8WBTZW8AxL5/8afqsZTd1D4Ip814CDQSFBKgSrE=
Subject: Re: [RFC PATCH 1/2] mm,drm/ttm: Block fast GUP to TTM huge pages
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Jason Gunthorpe <jgg@nvidia.com>
References: <314fc020-d243-dbf0-acb3-ecfcc9c2443c@shipmail.org>
 <20210323163715.GJ2356281@nvidia.com>
 <5824b731-ca6a-92fd-e314-d986b6a7b101@shipmail.org>
 <YFsM23t2niJwhpM/@phenom.ffwll.local> <20210324122430.GW2356281@nvidia.com>
 <e12e2c49-afaf-dbac-b18c-272c93c83e06@shipmail.org>
 <20210324124127.GY2356281@nvidia.com>
 <6c9acb90-8e91-d8af-7abd-e762d9a901aa@shipmail.org>
 <20210324134833.GE2356281@nvidia.com>
 <0b984f96-00fb-5410-bb16-02e12b2cc024@shipmail.org>
 <20210324163812.GJ2356281@nvidia.com>
 <08f19e80-d6cb-8858-0c5d-67d2e2723f72@amd.com>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m_=28Intel=29?= <thomas_os@shipmail.org>
Message-ID: <730eb2ff-ba98-2393-6d42-61735e3c6b83@shipmail.org>
Date: Wed, 24 Mar 2021 21:07:53 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <08f19e80-d6cb-8858-0c5d-67d2e2723f72@amd.com>
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
Cc: David Airlie <airlied@linux.ie>, linux-mm@kvack.org,
 Andrew Morton <akpm@linux-foundation.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Ck9uIDMvMjQvMjEgNzozMSBQTSwgQ2hyaXN0aWFuIEvDtm5pZyB3cm90ZToKPgo+Cj4gQW0gMjQu
MDMuMjEgdW0gMTc6Mzggc2NocmllYiBKYXNvbiBHdW50aG9ycGU6Cj4+IE9uIFdlZCwgTWFyIDI0
LCAyMDIxIGF0IDA0OjUwOjE0UE0gKzAxMDAsIFRob21hcyBIZWxsc3Ryw7ZtIChJbnRlbCkgCj4+
IHdyb3RlOgo+Pj4gT24gMy8yNC8yMSAyOjQ4IFBNLCBKYXNvbiBHdW50aG9ycGUgd3JvdGU6Cj4+
Pj4gT24gV2VkLCBNYXIgMjQsIDIwMjEgYXQgMDI6MzU6MzhQTSArMDEwMCwgVGhvbWFzIEhlbGxz
dHLDtm0gKEludGVsKSAKPj4+PiB3cm90ZToKPj4+Pgo+Pj4+Pj4gSW4gYW4gaWRlYWwgd29ybGQg
dGhlIGNyZWF0aW9uL2Rlc3RydWN0aW9uIG9mIHBhZ2UgdGFibGUgbGV2ZWxzIAo+Pj4+Pj4gd291
bGQKPj4+Pj4+IGJ5IGR5bmFtaWMgYXQgdGhpcyBwb2ludCwgbGlrZSBUSFAuCj4+Pj4+IEhtbSwg
YnV0IEknbSBub3Qgc3VyZSB3aGF0IHByb2JsZW0gd2UncmUgdHJ5aW5nIHRvIHNvbHZlIGJ5IAo+
Pj4+PiBjaGFuZ2luZyB0aGUKPj4+Pj4gaW50ZXJmYWNlIGluIHRoaXMgd2F5Pwo+Pj4+IFdlIGFy
ZSB0cnlpbmcgdG8gbWFrZSBhIHNlbnNpYmxlIGRyaXZlciBBUEkgdG8gZGVhbCB3aXRoIGh1Z2Ug
cGFnZXMuCj4+Pj4+IEN1cnJlbnRseSBpZiB0aGUgY29yZSB2bSByZXF1ZXN0cyBhIGh1Z2UgcHVk
LCB3ZSBnaXZlIGl0IG9uZSwgYW5kIAo+Pj4+PiBpZiB3ZQo+Pj4+PiBjYW4ndCBvciBkb24ndCB3
YW50IHRvIChiZWNhdXNlIG9mIGRpcnR5LXRyYWNraW5nLCBmb3IgZXhhbXBsZSwgCj4+Pj4+IHdo
aWNoIGlzCj4+Pj4+IGFsd2F5cyBkb25lIG9uIDRLIHBhZ2UtbGV2ZWwpIHdlIGp1c3QgcmV0dXJu
IFZNX0ZBVUxUX0ZBTExCQUNLLCAKPj4+Pj4gYW5kIHRoZQo+Pj4+PiBmYXVsdCBpcyByZXRyaWVk
IGF0IGEgbG93ZXIgbGV2ZWwuCj4+Pj4gV2VsbCwgbXkgdGhvdWdodCB3b3VsZCBiZSB0byBtb3Zl
IHRoZSBwdGUgcmVsYXRlZCBzdHVmZiBpbnRvCj4+Pj4gdm1mX2luc2VydF9yYW5nZSBpbnN0ZWFk
IG9mIHJlY3Vyc2luZyBiYWNrIHZpYSBWTV9GQVVMVF9GQUxMQkFDSy4KPj4+Pgo+Pj4+IEkgZG9u
J3Qga25vdyBpZiB0aGUgbG9ja2luZyB3b3JrcyBvdXQsIGJ1dCBpdCBmZWVscyBjbGVhbmVyIHRo
YXQgdGhlCj4+Pj4gZHJpdmVyIHRlbGxzIHRoZSB2bWYgaG93IGJpZyBhIHBhZ2UgaXQgY2FuIHN0
dWZmIGluLCBub3QgdGhlIHZtCj4+Pj4gdGVsbGluZyB0aGUgZHJpdmVyIHRvIHN0dWZmIGluIGEg
Y2VydGFpbiBzaXplIHBhZ2Ugd2hpY2ggaXQgbWlnaHQgbm90Cj4+Pj4gd2FudCB0byBkby4KPj4+
Pgo+Pj4+IFNvbWUgZGV2aWNlcyB3YW50IHRvIHdvcmsgb24gYSBpbi1iZXR3ZWVuIHBhZ2Ugc2l6
ZSBsaWtlIDY0ayBzbyB0aGV5Cj4+Pj4gY2FuJ3QgZm9ybSAyTSBwYWdlcyBidXQgdGhleSBjYW4g
c3R1ZmYgNjRrIG9mIDRLIHBhZ2VzIGluIGEgYmF0Y2ggb24KPj4+PiBldmVyeSBmYXVsdC4KPj4+
IEhtbSwgeWVzLCBidXQgd2Ugd291bGQgaW4gdGhhdCBjYXNlIGJlIGxpbWl0ZWQgYW55d2F5IHRv
IGluc2VydCByYW5nZXMKPj4+IHNtYWxsZXIgdGhhbiBhbmQgZXF1YWwgdG8gdGhlIGZhdWx0IHNp
emUgdG8gYXZvaWQgZXh0ZW5zaXZlIGFuZCAKPj4+IHBvc3NpYmx5Cj4+PiB1bm5lY2Vzc2FyeSBj
aGVja3MgZm9yIGNvbnRpZ291cyBtZW1vcnkuCj4+IFdoeT8gVGhlIGluc2VydCBmdW5jdGlvbiBp
cyB3YWxraW5nIHRoZSBwYWdlIHRhYmxlcywgaXQganVzdCB1cGRhdGVzCj4+IHRoaW5ncyBhcyB0
aGV5IGFyZS4gSXQgbGVhcm5zIHRoZSBhcnJhZ2VtZW50IGZvciBmcmVlIHdoaWxlIGRvaW5nIHRo
ZQo+PiB3YWxrLgo+Pgo+PiBUaGUgZGV2aWNlIGhhcyB0byBhbHdheXMgcHJvdmlkZSBjb25zaXN0
ZW50IGRhdGEsIGlmIGl0IG92ZXJsYXBzIGludG8KPj4gcGFnZXMgdGhhdCBhcmUgYWxyZWFkeSBw
b3B1bGF0ZWQgdGhhdCBpcyBmaW5lIHNvIGxvbmcgYXMgaXQgaXNuJ3QKPj4gY2hhbmdpbmcgdGhl
aXIgYWRkcmVzc2VzLgo+Pgo+Pj4gQW5kIHRoZW4gaWYgd2UgY2FuJ3Qgc3VwcG9ydCB0aGUgZnVs
bCBmYXVsdCBzaXplLCB3ZSdkIG5lZWQgdG8KPj4+IGVpdGhlciBwcmVzdW1lIGEgc2l6ZSBhbmQg
YWxpZ25tZW50IG9mIHRoZSBuZXh0IGxldmVsIG9yIHNlYXJjaCBmb3IKPj4+IGNvbnRpZ291cyBt
ZW1vcnkgaW4gYm90aCBkaXJlY3Rpb25zIGFyb3VuZCB0aGUgZmF1bHQgYWRkcmVzcywKPj4+IHBl
cmhhcHMgdW5uZWNlc3NhcmlseSBhcyB3ZWxsLgo+PiBZb3UgZG9uJ3QgcmVhbGx5IG5lZWQgdG8g
Y2FyZSBhYm91dCBsZXZlbHMsIHRoZSBkZXZpY2Ugc2hvdWxkIGJlCj4+IGZhdWx0aW5nIGluIHRo
ZSBsYXJnZXN0IG1lbW9yeSByZWdpb25zIGl0IGNhbiB3aXRoaW4gaXRzIGVmZmljaWVuY3kuCj4+
Cj4+IElmIGl0IHdvcmtzIG9uIDRNIHBhZ2VzIHRoZW4gaXQgc2hvdWxkIGJlIGZhdWx0aW5nIDRN
IHBhZ2VzLiBUaGUgcGFnZQo+PiBzaXplIG9mIHRoZSB1bmRlcmx5aW5nIENQVSBkb2Vzbid0IHJl
YWxseSBtYXR0ZXIgbXVjaCBvdGhlciB0aGFuIHNvbWUKPj4gdHVuaW5nIHRvIGltcGFjdCBob3cg
dGhlIGRldmljZSdzIGFsbG9jYXRvciB3b3Jrcy4KClllcywgYnV0IHRoZW4gd2UnZCBiZSBhZGRp
bmcgYSBsb3Qgb2YgY29tcGxleGl0eSBpbnRvIHRoaXMgZnVuY3Rpb24gdGhhdCAKaXMgYWxyZWFk
eSBwcm92aWRlZCBieSB0aGUgY3VycmVudCBpbnRlcmZhY2UgZm9yIERBWCwgZm9yIGxpdHRsZSBv
ciBubyAKZ2FpbiwgYXQgbGVhc3QgaW4gdGhlIGRybS90dG0gc2V0dGluZy4gUGxlYXNlIHRoaW5r
IG9mIHRoZSBmb2xsb3dpbmcgCnNpdHVhdGlvbjogWW91IGdldCBhIGZhdWx0LCB5b3UgZG8gYW4g
ZXh0ZW5zaXZlIHRpbWUtY29uc3VtaW5nIHNjYW4gb2YgCnlvdXIgVlJBTSBidWZmZXIgb2JqZWN0
IGludG8gd2hpY2ggdGhlIGZhdWx0IGdvZXMgYW5kIGRldGVybWluZSB5b3UgY2FuIApmYXVsdCAx
R0IuIE5vdyB5b3UgaGFuZCBpdCB0byB2bWZfaW5zZXJ0X3JhbmdlKCkgYW5kIGJlY2F1c2UgdGhl
IAp1c2VyLXNwYWNlIGFkZHJlc3MgaXMgbWlzYWxpZ25lZCwgb3IgYWxyZWFkeSBwYXJ0bHkgcG9w
dWxhdGVkIGJlY2F1c2Ugb2YgCmEgcHJldmlvdXMgZXZpY3Rpb24sIHlvdSBjYW4gb25seSBmYXVs
dCBzaW5nbGUgcGFnZXMsIGFuZCB5b3UgZW5kIHVwIApmYXVsdGluZyBhIGZ1bGwgR0Igb2Ygc2lu
Z2xlIHBhZ2VzIHBlcmhhcHMgZm9yIGEgb25lLXRpbWUgc21hbGwgdXBkYXRlLgoKT24gdG9wIG9m
IHRoaXMsIHVubGVzcyB3ZSB3YW50IHRvIGRvIHRoZSB3YWxrIHRyeWluZyBpbmNyZWFzaW5nbHkg
CnNtYWxsZXIgc2l6ZXMgb2Ygdm1mX2luc2VydF94eHgoKSwgd2UnZCBoYXZlIHRvIHVzZSAKYXBw
bHlfdG9fcGFnZV9yYW5nZSgpIGFuZCB0ZWFjaCBpdCBhYm91dCB0cmFuc2h1Z2UgcGFnZSB0YWJs
ZSBlbnRyaWVzLCAKYmVjYXVzZSBwYWdld2Fsay5jIGNhbid0IGJlIHVzZWQgKEl0IGNhbid0IHBv
cHVsYXRlIHBhZ2UgdGFibGVzKS4gVGhhdCAKYWxzbyBtZWFucyBhcHBseV90b19wYWdlX3Jhbmdl
KCkgbmVlZHMgdG8gYmUgY29tcGxpY2F0ZWQgd2l0aCBwYWdlIHRhYmxlIApsb2NrcyBzaW5jZSB0
cmFuc2h1Z2UgcGFnZXMgYXJlbid0IHN0YWJsZSBhbmQgY2FuIGJlIHphcHBlZCBhbmQgCnJlZmF1
bHRlZCB1bmRlciB1cyB3aGlsZSB3ZSBkbyB0aGUgd2Fsay4KCk9uIHRvcCBvZiB0aGlzLCB0aGUg
dXNlci1zcGFjZSBhZGRyZXNzIGFsbG9jYXRvciBuZWVkcyB0byBrbm93IGhvdyBsYXJnZSAKZ3B1
IHBhZ2VzIGFyZSBhbGlnbmVkIGluIGJ1ZmZlciBvYmplY3RzIHRvIGhhdmUgYSByZWFzb25hYmxl
IGNoYW5jZSBvZiAKYWxpZ25pbmcgd2l0aCBDUFUgaHVnZSBwYWdlIGJvdW5kYXJpZXMgd2hpY2gg
aXMgYSByZXF1aXJlbWVudCB0byBiZSBhYmxlIAp0byBpbnNlcnQgYSBodWdlIENQVSBwYWdlIHRh
YmxlIGVudHJ5LCBzbyB0aGUgZHJpdmVyIHdvdWxkIGJhc2ljYWxseSAKbmVlZCB0aGUgZHJtIGhl
bHBlciB0aGF0IGNhbiBkbyB0aGlzIGFsaWdubWVudCBhbnl3YXkuCgpBbGwgdGhpcyBtYWtlcyBt
ZSB0aGluayB3ZSBzaG91bGQgc2V0dGxlIGZvciB0aGUgY3VycmVudCBpbnRlcmZhY2UgZm9yIApu
b3csIGFuZCBpZiBzb21lb25lIGZlZWxzIGxpa2UgcmVmaW5pbmcgaXQsIEknbSBmaW5lIHdpdGgg
dGhhdC7CoCBBZnRlciAKYWxsLCB0aGlzIGlzbid0IGEgc3RyYW5nZSBkcm0vdHRtIGludmVudGlv
biwgaXQncyBhIHByZS1leGlzdGluZyAKaW50ZXJmYWNlIHRoYXQgd2UgcmV1c2UuCgo+Cj4gSSBh
Z3JlZSB3aXRoIEphc29uIGhlcmUuCj4KPiBXZSBnZXQgdGhlIGJlc3QgZWZmaWNpZW5jeSB3aGVu
IHdlIGxvb2sgYXQgdGhlIHdoYXQgdGhlIEdQVSBkcml2ZXIgCj4gcHJvdmlkZXMgYW5kIG1ha2Ug
c3VyZSB0aGF0IHdlIGhhbmRsZSBvbmUgR1BVIHBhZ2UgYXQgb25jZSBpbnN0ZWFkIG9mIAo+IGxv
b2tpbmcgdG8gbXVjaCBpbnRvIHdoYXQgdGhlIENQVSBpcyBkb2luZyB3aXRoIGl0J3MgcGFnZSB0
YWJsZXMuCj4KPiBBdCBsZWFzdCBvbmUgQU1EIEdQVXMgdGhlIEdQVSBwYWdlIHNpemUgY2FuIGJl
IGFueXRoaW5nIGJldHdlZW4gNEtpQiAKPiBhbmQgMkdpQiBhbmQgaWYgd2Ugd2lsbCBpbiBhIDJH
aUIgY2h1bmsgYXQgb25jZSB0aGlzIGNhbiBpbiB0aGVvcnkgYmUgCj4gaGFuZGxlZCBieSBqdXN0
IHR3byBnaWFudCBwYWdlIHRhYmxlIGVudHJpZXMgb24gdGhlIENQVSBzaWRlLgoKWWVzLCBidXQg
SSBmYWlsIHRvIHNlZSB3aHksIHdpdGggdGhlIGN1cnJlbnQgY29kZSwgd2UgY2FuJ3QgZG8gdGhp
cyAKKHNhdmUgdGhlIHJlZmNvdW50aW5nIGJ1Zyk/CgovVGhvbWFzCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRy
aS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5v
cmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
