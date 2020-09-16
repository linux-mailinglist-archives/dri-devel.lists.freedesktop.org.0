Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2844E26C353
	for <lists+dri-devel@lfdr.de>; Wed, 16 Sep 2020 15:38:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 328EA6EA23;
	Wed, 16 Sep 2020 13:38:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ste-pvt-msa2.bahnhof.se (ste-pvt-msa2.bahnhof.se
 [213.80.101.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C86A6EA23
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Sep 2020 13:38:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by ste-pvt-msa2.bahnhof.se (Postfix) with ESMTP id 79C393F72F
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Sep 2020 15:37:57 +0200 (CEST)
Authentication-Results: ste-pvt-msa2.bahnhof.se; dkim=pass (1024-bit key;
 unprotected) header.d=shipmail.org header.i=@shipmail.org header.b=Rl5wLMYb; 
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at bahnhof.se
X-Spam-Flag: NO
X-Spam-Score: -3.642
X-Spam-Level: 
X-Spam-Status: No, score=-3.642 tagged_above=-999 required=6.31
 tests=[BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.543,
 URIBL_BLOCKED=0.001] autolearn=ham autolearn_force=no
Authentication-Results: ste-ftg-msa2.bahnhof.se (amavisd-new);
 dkim=pass (1024-bit key) header.d=shipmail.org
Received: from ste-pvt-msa2.bahnhof.se ([127.0.0.1])
 by localhost (ste-ftg-msa2.bahnhof.se [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id le2anniwPseA for <dri-devel@lists.freedesktop.org>;
 Wed, 16 Sep 2020 15:37:56 +0200 (CEST)
Received: by ste-pvt-msa2.bahnhof.se (Postfix) with ESMTPA id CD76F3F72C
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Sep 2020 15:37:54 +0200 (CEST)
Received: from 9-2DT-694.SSPE.ch.intel.com (h-205-35.A357.priv.bahnhof.se
 [155.4.205.35])
 by mail1.shipmail.org (Postfix) with ESMTPSA id 53F67361CCA
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Sep 2020 15:37:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=shipmail.org; s=mail;
 t=1600263478; bh=Ad8xkijMkfs4/b7Uvd7+c5DmalTkKkhWrUFOCEPbh74=;
 h=Subject:To:References:From:Date:In-Reply-To:From;
 b=Rl5wLMYbc7ePYOgq2ojzTRlCpDtsBNEsdQTmvYnf4UKkM6+0CO50BUm6fii7ava/3
 3cdnUpnKsLpbs5wFlrAF3CjdRLeSAtcktQScwijNgqD4lXX3FFeWZ43Tw/a95BwOfC
 sLKmfH5o5Va1z4tu1bE4Q79/z/EZFaZ9Bz2ki4Lw=
Subject: Re: [PATCH 0/3] dma-buf: Flag vmap'ed memory as system or I/O memory
To: dri-devel@lists.freedesktop.org
References: <20200914112521.1327-1-tzimmermann@suse.de>
 <20200916093756.GC438822@phenom.ffwll.local>
 <0378c326-28c6-371e-45d2-8b81ccbda84f@suse.de>
 <20200916122405.GQ438822@phenom.ffwll.local>
 <53743f37-4142-c076-296f-bfcba0840121@amd.com>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m_=28Intel=29?= <thomas_os@shipmail.org>
Message-ID: <5192750d-6e99-3dae-286b-3fe0ded0d094@shipmail.org>
Date: Wed, 16 Sep 2020 15:37:57 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <53743f37-4142-c076-296f-bfcba0840121@amd.com>
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Ck9uIDkvMTYvMjAgMjo1OSBQTSwgQ2hyaXN0aWFuIEvDtm5pZyB3cm90ZToKPiBBbSAxNi4wOS4y
MCB1bSAxNDoyNCBzY2hyaWViIERhbmllbCBWZXR0ZXI6Cj4+IE9uIFdlZCwgU2VwIDE2LCAyMDIw
IGF0IDEyOjQ4OjIwUE0gKzAyMDAsIFRob21hcyBaaW1tZXJtYW5uIHdyb3RlOgo+Pj4gSGkKPj4+
Cj4+PiBBbSAxNi4wOS4yMCB1bSAxMTozNyBzY2hyaWViIERhbmllbCBWZXR0ZXI6Cj4+Pj4gT24g
TW9uLCBTZXAgMTQsIDIwMjAgYXQgMDE6MjU6MThQTSArMDIwMCwgVGhvbWFzIFppbW1lcm1hbm4g
d3JvdGU6Cj4+Pj4+IERtYS1idWYgcHJvdmlkZXMgdm1hcCgpIGFuZCB2dW5tYXAoKSBmb3IgcmV0
cmlldmluZyBhbmQgcmVsZWFzaW5nIAo+Pj4+PiBtYXBwaW5ncwo+Pj4+PiBvZiBkbWEtYnVmIG1l
bW9yeSBpbiBrZXJuZWwgYWRkcmVzcyBzcGFjZS4gVGhlIGZ1bmN0aW9ucyBvcGVyYXRlIAo+Pj4+
PiB3aXRoIHBsYWluCj4+Pj4+IGFkZHJlc3NlcyBhbmQgdGhlIGFzc3VtcHRpb24gaXMgdGhhdCB0
aGUgbWVtb3J5IGNhbiBiZSBhY2Nlc3NlZCAKPj4+Pj4gd2l0aCBsb2FkCj4+Pj4+IGFuZCBzdG9y
ZSBvcGVyYXRpb25zLiBUaGlzIGlzIG5vdCB0aGUgY2FzZSBvbiBzb21lIGFyY2hpdGVjdHVyZXMg
Cj4+Pj4+IChlLmcuLAo+Pj4+PiBzcGFyYzY0KSB3aGVyZSBJL08gbWVtb3J5IGNhbiBvbmx5IGJl
IGFjY2Vzc2VkIHdpdGggZGVkaWNhdGVkIAo+Pj4+PiBpbnN0cnVjdGlvbnMuCj4+Pj4+Cj4+Pj4+
IFRoaXMgcGF0Y2hzZXQgaW50cm9kdWNlcyBzdHJ1Y3QgZG1hX2J1Zl9tYXAsIHdoaWNoIGNvbnRh
aW5zIHRoZSAKPj4+Pj4gYWRkcmVzcyBvZgo+Pj4+PiBhIGJ1ZmZlciBhbmQgYSBmbGFnIHRoYXQg
dGVsbHMgd2hldGhlciBzeXN0ZW0tIG9yIEkvTy1tZW1vcnkgCj4+Pj4+IGluc3RydWN0aW9ucwo+
Pj4+PiBhcmUgcmVxdWlyZWQuCj4+Pj4+Cj4+Pj4+IFNvbWUgYmFja2dyb3VuZDogdXBkYXRpbmcg
dGhlIERSTSBmcmFtZWJ1ZmZlciBjb25zb2xlIG9uIHNwYXJjNjQgCj4+Pj4+IG1ha2VzIHRoZQo+
Pj4+PiBrZXJuZWwgcGFuaWMuIFRoaXMgaXMgYmVjYXVzZSB0aGUgZnJhbWVidWZmZXIgbWVtb3J5
IGNhbm5vdCBiZSAKPj4+Pj4gYWNjZXNzZWQgd2l0aAo+Pj4+PiBzeXN0ZW0tbWVtb3J5IGluc3Ry
dWN0aW9ucy4gV2UgY3VycmVudGx5IGVtcGxveSBhIHdvcmthcm91bmQgaW4gCj4+Pj4+IERSTSB0
bwo+Pj4+PiBhZGRyZXNzIHRoaXMgc3BlY2lmaWMgcHJvYmxlbS4gWzFdCj4+Pj4+Cj4+Pj4+IFRv
IHJlc29sdmUgdGhlIHByb2JsZW0sIHdlJ2QgbGlrZSB0byBhZGRyZXNzIGl0IGF0IHRoZSBtb3N0
IGNvbW1vbiAKPj4+Pj4gcG9pbnQsCj4+Pj4+IHdoaWNoIGlzIHRoZSBkbWEtYnVmIGZyYW1ld29y
ay4gVGhlIGRtYS1idWYgbWFwcGluZyBpZGVhbGx5IGtub3dzIAo+Pj4+PiBpZiBJL08KPj4+Pj4g
aW5zdHJ1Y3Rpb25zIGFyZSByZXF1aXJlZCBhbmQgZXhwb3J0cyB0aGlzIGluZm9ybWF0aW9uIHRv
IGl0J3MgCj4+Pj4+IHVzZXJzLiBUaGUKPj4+Pj4gbmV3IHN0cnVjdHVyZSBzdHJ1Y3QgZG1hX2J1
Zl9tYXAgc3RvcmVzIHRoZSBidWZmZXIgYWRkcmVzcyBhbmQgYSAKPj4+Pj4gZmxhZyB0aGF0Cj4+
Pj4+IHNpZ25hbHMgSS9PIG1lbW9yeS4gQWZmZWN0ZWQgdXNlcnMgb2YgdGhlIGJ1ZmZlciAoZS5n
LiwgZHJpdmVycywgCj4+Pj4+IGZyYW1ld29ya3MpCj4+Pj4+IGNhbiB0aGVuIGFjY2VzcyB0aGUg
bWVtb3J5IGFjY29yZGluZ2x5Lgo+Pj4+Pgo+Pj4+PiBUaGlzIHBhdGNoc2V0IG9ubHkgaW50cm9k
dWNlcyBzdHJ1Y3QgZG1hX2J1Zl9tYXAsIGFuZCB1cGRhdGVzIAo+Pj4+PiBzdHJ1Y3QgZG1hX2J1
Zgo+Pj4+PiBhbmQgaXQncyBpbnRlcmZhY2VzLiBGdXJ0aGVyIHBhdGNoZXMgY2FuIHVwZGF0ZSBk
bWEtYnVmIHVzZXJzLiBGb3IgCj4+Pj4+IGV4YW1wbGUsCj4+Pj4+IHRoZXJlJ3MgYSBwcm90b3R5
cGUgcGF0Y2hzZXQgZm9yIERSTSB0aGF0IGZpeGVzIHRoZSBmcmFtZWJ1ZmZlciAKPj4+Pj4gcHJv
YmxlbS4gWzJdCj4+Pj4+Cj4+Pj4+IEZ1cnRoZXIgd29yazogVFRNLCBvbmUgb2YgRFJNJ3MgbWVt
b3J5IG1hbmFnZXJzLCBhbHJlYWR5IGV4cG9ydHMgYW4KPj4+Pj4gaXNfaW9tZW0gZmxhZyBvZiBp
dHMgb3duLiBJdCBjb3VsZCBsYXRlciBiZSBzd2l0Y2hlZCBvdmVyIHRvIAo+Pj4+PiBleHBvcnRp
bmcgc3RydWN0Cj4+Pj4+IGRtYV9idWZfbWFwLCB0aHVzIHNpbXBsaWZ5aW5nIHNvbWUgY29kZS4g
U2V2ZXJhbCBEUk0gZHJpdmVycyAKPj4+Pj4gZXhwZWN0IHRoZWlyCj4+Pj4+IGZiZGV2IGNvbnNv
bGUgdG8gb3BlcmF0ZSBvbiBJL08gbWVtb3J5LiBUaGVzZSBjb3VsZCBwb3NzaWJseSBiZSAKPj4+
Pj4gc3dpdGNoZWQgb3Zlcgo+Pj4+PiB0byB0aGUgZ2VuZXJpYyBmYmRldiBlbXVsYXRpb24sIGFz
IHNvb24gYXMgdGhlIGdlbmVyaWMgY29kZSB1c2VzIAo+Pj4+PiBzdHJ1Y3QKPj4+Pj4gZG1hX2J1
Zl9tYXAuCj4+Pj4+Cj4+Pj4+IFsxXSAKPj4+Pj4gaHR0cHM6Ly9uYW0xMS5zYWZlbGlua3MucHJv
dGVjdGlvbi5vdXRsb29rLmNvbS8/dXJsPWh0dHBzJTNBJTJGJTJGbG9yZS5rZXJuZWwub3JnJTJG
ZHJpLWRldmVsJTJGMjAyMDA3MjUxOTEwMTIuR0E0MzQ5NTclNDByYXZuYm9yZy5vcmclMkYmYW1w
O2RhdGE9MDIlN0MwMSU3Q2NocmlzdGlhbi5rb2VuaWclNDBhbWQuY29tJTdDMDRlM2NjM2UwM2Fl
NDBmMWZhMGYwOGQ4NWEzYjZhNjglN0MzZGQ4OTYxZmU0ODg0ZTYwOGUxMWE4MmQ5OTRlMTgzZCU3
QzAlN0MwJTdDNjM3MzU4NTU4NTI0NzMyMzg1JmFtcDtzZGF0YT13VG1GdUI5NUdoS1VVJTJGMlE5
MVYwJTJCdHpBdTQlMkJFZTNWQlVjcmlCeTNqeDJnJTNEJmFtcDtyZXNlcnZlZD0wCj4+Pj4+IFsy
XSAKPj4+Pj4gaHR0cHM6Ly9uYW0xMS5zYWZlbGlua3MucHJvdGVjdGlvbi5vdXRsb29rLmNvbS8/
dXJsPWh0dHBzJTNBJTJGJTJGbG9yZS5rZXJuZWwub3JnJTJGZHJpLWRldmVsJTJGMjAyMDA4MDYw
ODUyMzkuNDYwNi0xLXR6aW1tZXJtYW5uJTQwc3VzZS5kZSUyRiZhbXA7ZGF0YT0wMiU3QzAxJTdD
Y2hyaXN0aWFuLmtvZW5pZyU0MGFtZC5jb20lN0MwNGUzY2MzZTAzYWU0MGYxZmEwZjA4ZDg1YTNi
NmE2OCU3QzNkZDg5NjFmZTQ4ODRlNjA4ZTExYTgyZDk5NGUxODNkJTdDMCU3QzAlN0M2MzczNTg1
NTg1MjQ3MzIzODUmYW1wO3NkYXRhPUw0ckJIbWVnTzYzYiUyRmlUUWRUeUgxNThLTnhBWndTdUpD
UU9hRnN6bzVMMCUzRCZhbXA7cmVzZXJ2ZWQ9MAo+Pj4+IGxndG0sIGltbyByZWFkeSB0byBjb252
ZXJ0IHRoZSBmb2xsb3ctdXAgcGF0Y2hlcyBvdmVyIHRvIHRoaXMuIEJ1dCAKPj4+PiBJIHRoaW5r
Cj4+Pj4gd291bGQgYmUgZ29vZCB0byBnZXQgYXQgbGVhc3Qgc29tZSBhY2sgZnJvbSB0aGUgdHRt
IHNpZGUgZm9yIHRoZSAKPj4+PiBvdmVyYWxsCj4+Pj4gcGxhbi4KPj4+IFl1cCwgaXQgd291bGQg
YmUgbmljZSBpZiBUVE0gY291bGQgaGFkIG91dCB0aGVzZSB0eXBlcyBhdXRvbWF0aWNhbGx5Lgo+
Pj4gVGhlbiBhbGwgVFRNLWJhc2VkIGRyaXZlcnMgd291bGQgYXV0b21hdGljYWxseSBzdXBwb3J0
IGl0Lgo+Pj4KPj4+PiBBbHNvLCBJIHRoaW5rIHdlIHNob3VsZCBwdXQgYWxsIHRoZSB2YXJpb3Vz
IGhlbHBlcnMgKHdyaXRlbC9yZWFkbCwgCj4+Pj4gbWVtc2V0LAo+Pj4+IG1lbWNweSwgd2hhdGV2
ZXIgZWxzZSkgaW50byB0aGUgZG1hLWJ1Zi1tYXAuaCBoZWxwZXIsIHNvIHRoYXQgbW9zdCAKPj4+
PiBjb2RlCj4+Pj4gdXNpbmcgdGhpcyBjYW4ganVzdCB0cmVhdCBpdCBhcyBhbiBhYnN0cmFjdCBw
b2ludGVyIHR5cGUgYW5kIG5ldmVyIAo+Pj4+IGxvb2sKPj4+PiB1bmRlcm5lYXRoIGl0Lgo+Pj4g
V2UgaGF2ZSBzb21lIGZyYW1lYnVmZmVyIGhlbHBlcnMgdGhhdCByZWx5IG9uIHBvaW50ZXIgYXJp
dGhtZXRpYywgc28KPj4+IHdlJ2QgbmVlZCB0aGF0IHRvby4gTm8gYmlnIGRlYWwgd3J0IGNvZGUs
IGJ1dCBJIHdhcyB3b3JyaWVkIGFib3V0IHRoZQo+Pj4gb3ZlcmhlYWQuIElmIGEgbG9vcCBnb2Vz
IG92ZXIgZnJhbWVidWZmZXIgbWVtb3J5LCB0aGVyZSdzIGFuIGlmL2Vsc2UKPj4+IGJyYW5jaCBm
b3IgZWFjaCBhY2Nlc3MgdG8gdGhlIG1lbW9yeSBidWZmZXIuCj4+IElmIHdlIG1ha2UgYWxsIHRo
ZSBoZWxwZXJzIHN0YXRpYyBpbmxpbmUsIHRoZW4gdGhlIGNvbXBpbGVyIHNob3VsZCBiZSAKPj4g
YWJsZQo+PiB0byBzZWUgdGhhdCBkbWFfYnVmX21hcC5pc19pb21lbSBpcyBhbHdheXMgdGhlIHNh
bWUsIGFuZCBwcm9kdWNlZCByZWFsbHkKPj4gb3B0aW1pemVkIGNvZGUgZm9yIGl0IGJ5IHB1bGxp
bmcgdGhhdCBjaGVjayBvdXQgZnJvbSBhbGwgdGhlIGxvb3BzLgo+Pgo+PiBTbyBzaG91bGQgb25s
eSByZXN1bHQgaW4gc29tZXdoYXQgdmVyYm9zZSBjb2RlIG9mIGhhdmluZyB0byBjYWxsCj4+IGRt
YV9idWZfbWFwIHBvaW50ZXIgYXJ0aGltZXRpYyBoZWxwZXJzLCBidXQgbm90IGluIGJhZCBnZW5l
cmF0ZWQgY29kZS4KPj4gU3RpbGwgd29ydGggZG91YmxlLWNoZWNraW5nIEkgdGhpbmssIHNpbmNl
IGUuZy4gb24geDg2IHRoZSBnZW5lcmF0ZWQgCj4+IGNvZGUKPj4gc2hvdWxkIGJlIHRoZSBzYW1l
IGZvciBib3RoIGNhc2VzIChidXQgbWF5YmUgdGhlIGNvbXBpbGVyIGRvZXNuJ3Qgc2VlCj4+IHRo
cm91Z2ggdGhlIGlubGluZSBhc20gdG8gcmVhbGl6ZSB0aGF0LCBzbyB3ZSBtaWdodCBlbmQgdXAg
d2l0aCAyIAo+PiBjb3BpZXMpLgo+Cj4gQ2FuIHdlIGhhdmUgdGhhdCBldmVuIGluZGVwZW5kZW50
IG9mIERNQS1idWY/IFdlIGhhdmUgZXNzZW50aWFsbHkgdGhlIAo+IHNhbWUgcHJvYmxlbSBpbiBU
VE0gYW5kIHRoZSBjb2RlIGFyb3VuZCB0aGF0IGlzIGEgY29tcGxldGUgbWVzcyBpZiB5b3UgCj4g
YXNrIG1lLgo+Cj4gQ2hyaXN0aWFuLgo+CkkgdGhpbmsgdGhpcyBwYXRjaHNldCBsb29rcyBnb29k
LiBDaGFuZ2luZyB0dG1fYm9fa21hcCgpIG92ZXIgdG8gCnJldHVybmluZyBhIHN0cnVjdCBkbWEt
YnVmLW1hcCB3b3VsZCBwcm9iYWJseSB3b3JrIGp1c3QgZmluZS4gSWYgd2UgdGhlbiAKY2FuIGhh
dmUgYSBzZXQgb2YgaGVscGVycyB0byBvcGVyYXRlIG9uIGl0LCB0aGF0J3MgZ3JlYXQuCgovVGhv
bWFzCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJp
LWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
