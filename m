Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D70E2DD301
	for <lists+dri-devel@lfdr.de>; Thu, 17 Dec 2020 15:28:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 25FB86E3FC;
	Thu, 17 Dec 2020 14:28:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 582 seconds by postgrey-1.36 at gabe;
 Thu, 17 Dec 2020 14:28:29 UTC
Received: from lynxeye.de (ns.lynxeye.de [87.118.118.114])
 by gabe.freedesktop.org (Postfix) with ESMTP id 1A67C6E3FC
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Dec 2020 14:28:29 +0000 (UTC)
Received: by lynxeye.de (Postfix, from userid 501)
 id 43DAFE74217; Thu, 17 Dec 2020 15:18:16 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on lynxeye.de
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=3.0 tests=ALL_TRUSTED,BAYES_00
 autolearn=ham version=3.3.1
Received: from astat.fritz.box (a89-183-122-117.net-htp.de [89.183.122.117])
 by lynxeye.de (Postfix) with ESMTPSA id D4A1DE740DA;
 Thu, 17 Dec 2020 15:18:14 +0100 (CET)
Message-ID: <436b91bf6a6840cbf7251bcdf841950ad3410a4a.camel@lynxeye.de>
Subject: Re: [PATCH] drm/[amdgpu|radeon]: fix memset on io mem
From: Lucas Stach <dev@lynxeye.de>
To: Christian =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>, Robin
 Murphy <robin.murphy@arm.com>, Chen Li <chenli@uniontech.com>
Date: Thu, 17 Dec 2020 15:18:14 +0100
In-Reply-To: <8a2245b8-3a57-a35b-924f-e2a6c084e60f@amd.com>
References: <877dpiz4sf.wl-chenli@uniontech.com>
 <4277816d-db00-7e81-a2fb-069aeee18e8b@amd.com>
 <875z51zwsq.wl-chenli@uniontech.com>
 <90b625e2-2409-d13b-2456-483ad4eef18f@amd.com>
 <873605z1du.wl-chenli@uniontech.com>
 <7920fd29-3f95-2109-07ee-15659e80dc40@amd.com>
 <159c72db-1316-6155-2209-8e0e9a7f5224@arm.com>
 <8a2245b8-3a57-a35b-924f-e2a6c084e60f@amd.com>
User-Agent: Evolution 3.38.1 (3.38.1-1.fc33) 
MIME-Version: 1.0
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
Cc: Alex Deucher <alexander.deucher@amd.com>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gRG9ubmVyc3RhZywgZGVuIDE3LjEyLjIwMjAsIDE1OjAyICswMTAwIHNjaHJpZWIgQ2hyaXN0
aWFuIEvDtm5pZzoKPiBBbSAxNy4xMi4yMCB1bSAxNDo0NSBzY2hyaWViIFJvYmluIE11cnBoeToK
PiA+IE9uIDIwMjAtMTItMTcgMTA6MjUsIENocmlzdGlhbiBLw7ZuaWcgd3JvdGU6Cj4gPiA+IEFt
IDE3LjEyLjIwIHVtIDAyOjA3IHNjaHJpZWIgQ2hlbiBMaToKPiA+ID4gPiBPbiBXZWQsIDE2IERl
YyAyMDIwIDIyOjE5OjExICswODAwLAo+ID4gPiA+IENocmlzdGlhbiBLw7ZuaWcgd3JvdGU6Cj4g
PiA+ID4gPiBBbSAxNi4xMi4yMCB1bSAxNDo0OCBzY2hyaWViIENoZW4gTGk6Cj4gPiA+ID4gPiA+
IE9uIFdlZCwgMTYgRGVjIDIwMjAgMTU6NTk6MzcgKzA4MDAsCj4gPiA+ID4gPiA+IENocmlzdGlh
biBLw7ZuaWcgd3JvdGU6Cj4gPiA+ID4gPiA+ID4gW1NOSVBdCj4gPiA+ID4gPiA+IEhpLCBDaHJp
c3RpYW4uIEknbSBub3Qgc3VyZSB3aHkgdGhpcyBjaGFuZ2UgaXMgYSBoYWNrIGhlcmUuIEkgCj4g
PiA+ID4gPiA+IGNhbm5vdCBzZWUgdGhlIHByb2JsZW0gYW5kIHdsbCBiZSBncmF0ZWZ1bCBpZiB5
b3UgZ2l2ZSBtb3JlIAo+ID4gPiA+ID4gPiBleHBsYWluYXRpb25zLgo+ID4gPiA+ID4gX19tZW1z
ZXQgaXMgc3VwcG9zZWQgdG8gd29yayBvbiB0aG9zZSBhZGRyZXNzZXMsIG90aGVyd2lzZSB5b3Ug
Cj4gPiA+ID4gPiBjYW4ndCB1c2UgdGhlCj4gPiA+ID4gPiBlODg2MCBvbiB5b3VyIGFybTY0IHN5
c3RlbS4KPiA+ID4gPiBJZiBfX21lbXNldCBpcyBzdXBwb3NlZCB0byB3b3JrIG9uIHRob3NlIGFk
cmVzc2VzLCB3aHkgdGhpcyAKPiA+ID4gPiBjb21taXQoaHR0cHM6Ly9uYW0xMS5zYWZlbGlua3Mu
cHJvdGVjdGlvbi5vdXRsb29rLmNvbS8/dXJsPWh0dHBzJTNBJTJGJTJGZ2l0aHViLmNvbSUyRnRv
cnZhbGRzJTJGbGludXglMkZjb21taXQlMkZiYTBiMjI3NWE2NzgxYjJmMzkxOWQ5MzFkNjMzMjli
NTU0OGY2ZDVmJmFtcDtkYXRhPTA0JTdDMDElN0NjaHJpc3RpYW4ua29lbmlnJTQwYW1kLmNvbSU3
QzM1NTFhZTQ5NzJiMDQ0YmI4MzE2MDhkOGEyOTFmODFjJTdDM2RkODk2MWZlNDg4NGU2MDhlMTFh
ODJkOTk0ZTE4M2QlN0MwJTdDMCU3QzYzNzQzODA5NTExNDI5MjM5NCU3Q1Vua25vd24lN0NUV0Zw
Ykdac2IzZDhleUpXSWpvaU1DNHdMakF3TURBaUxDSlFJam9pVjJsdU16SWlMQ0pCVGlJNklrMWhh
V3dpTENKWFZDSTZNbjAlM0QlN0MxMDAwJmFtcDtzZGF0YT14bnM4MXVDR2ZOMXRqc1ZuNUxCVThR
aG1VaW5aUkpRbFh6OHclMkZKNyUyRkdUTSUzRCZhbXA7cmVzZXJ2ZWQ9MCkgCj4gPiA+ID4gaXMg
bmVlZGVkPyAoSSBhbHNvIG5vdGljZSBkcm0vcmFkZW9uIGRpZG4ndCB0YWtlIHRoaXMgY2hhbmdl
IHRob3VnaCkgCj4gPiA+ID4ganVzdCBvdXQgb2YgY3VyaW9zaXR5Lgo+ID4gPiAKPiA+ID4gV2Ug
Z2VuZXJhbGx5IGFjY2VwdCB0aG9zZSBwYXRjaGVzIGFzIGNsZWFudXAgaW4gdGhlIGtlcm5lbCB3
aXRoIHRoZSAKPiA+ID4gaG9wZSB0aGF0IHdlIGNhbiBmaW5kIGEgd2F5IHRvIHdvcmsgYXJvdW5k
IHRoZSB1c2Vyc3BhY2UgcmVzdHJpY3Rpb25zLgo+ID4gPiAKPiA+ID4gQnV0IHdoZW4geW91IGFs
c28gaGF2ZSB0aGlzIGlzc3VlIGluIHVzZXJzcGFjZSB0aGVuIHRoZXJlIGlzbid0IG11Y2ggCj4g
PiA+IHdlIGNhbiBkbyBmb3IgeW91Lgo+ID4gPiAKPiA+ID4gPiA+IFJlcGxhY2luZyB0aGUgdGhl
IGRpcmVjdCB3cml0ZSBpbiB0aGUga2VybmVsIHdpdGggY2FsbHMgdG8gd3JpdGVsKCkgb3IKPiA+
ID4gPiA+IG1lbXNldF9pbygpIHdpbGwgZml4IHRoYXQgdGVtcG9yYXJ5LCBidXQgeW91IGhhdmUg
YSBtb3JlIGdlbmVyYWwgCj4gPiA+ID4gPiBwcm9ibGVtIGhlcmUuCj4gPiA+ID4gSSBjYW5ub3Qg
c2VlIHdoYXQncyB0aGUgbW9yZSBnZW5lcmFsIHByb2JsZW0gaGVyZSA6KCB1IG1lYW4gCj4gPiA+
ID4gcGVyZm9ybWFuY2U/Cj4gPiA+IAo+ID4gPiBObywgbm90IHBlcmZvcm1hbmNlLiBTZWUgc3Rh
bmRhcmRzIGxpa2UgT3BlbkdMLCBWdWxrYW4gYXMgd2VsbCBhcyAKPiA+ID4gVkEtQVBJIGFuZCBW
RFBBVSByZXF1aXJlIHRoYXQgeW91IGNhbiBtbWFwKCkgZGV2aWNlIG1lbW9yeSBhbmQgCj4gPiA+
IGV4ZWN1dGUgbWVtc2V0L21lbWNweSBvbiB0aGUgbWVtb3J5IGZyb20gdXNlcnNwYWNlLgo+ID4g
PiAKPiA+ID4gSWYgeW91ciBBUk0gYmFzZSBib2FyZCBjYW4ndCBkbyB0aGF0IGZvciBzb21lIHRo
ZW4geW91IGNhbid0IHVzZSB0aGUgCj4gPiA+IGhhcmR3YXJlIHdpdGggdGhhdCBib2FyZC4KPiA+
IAo+ID4gSWYgdGhlIFZSQU0gbGl2ZXMgaW4gYSBwcmVmZXRjaGFibGUgUENJIGJhciB0aGVuIG9u
IG1vc3Qgc2FuZSAKPiA+IEFybS1iYXNlZCBzeXN0ZW1zIEkgYmVsaWV2ZSBpdCBzaG91bGQgYmUg
YWJsZSB0byBtbWFwKCkgdG8gdXNlcnNwYWNlIAo+ID4gd2l0aCB0aGUgTm9ybWFsIG1lbW9yeSB0
eXBlLCB3aGVyZSB1bmFsaWduZWQgYWNjZXNzZXMgYW5kIHN1Y2ggYXJlIAo+ID4gYWxsb3dlZCwg
YXMgb3Bwb3NlZCB0byB0aGUgRGV2aWNlIG1lbW9yeSB0eXBlIGludGVuZGVkIGZvciBNTUlPIAo+
ID4gbWFwcGluZ3MsIHdoaWNoIGhhcyBtb3JlIHJlc3RyaWN0aW9ucyBidXQgc3RyaWN0ZXIgb3Jk
ZXJpbmcgZ3VhcmFudGVlcy4KPiAKPiBEbyB5b3UgaGF2ZSBzb21lIGJhY2tncm91bmQgd2h5IHNv
bWUgQVJNIGJvYXJkcyBmYWlsIHdpdGggdGhhdD8KPiAKPiBXZSBoYWQgYSBjb3VwbGUgb2YgcmVw
b3J0cyB0aGF0IG1lbXNldC9tZW1jcHkgZmFpbCBpbiB1c2Vyc3BhY2UgKHVzdWFsbHkgCj4gc3lz
dGVtIGp1c3Qgc3BvbnRhbmVvdXNseSByZWJvb3RzIG9yIGJlY29tZXMgdW5yZXNwb25zaXZlKSwg
YnV0IHNvIGZhciAKPiBub2JvZHkgY291bGQgdGVsbCB1cyB3aHkgdGhhdCBoYXBwZW5zPwoKT3B0
aW1pemVkIG1lbXNldC9tZW1jcHkgdXNlcyB1bmFsaWduZWQgYWNjZXNzIGluIHNvbWUgY2FzZXMs
IHdoZXJlCmhhbmRsaW5nIHVuYWxpZ25lZCBzdGFydC9lbmQgYWRkcmVzc2VzIHdvdWxkIGNhdXNl
IG1vcmUgaW5zdHJ1Y3Rpb25zIHRvCmJlIHVzZWQgb3RoZXJ3aXNlLgoKSWYgdGhlIGRldmljZSBt
ZW1vcnkgaXNuJ3QgbWFwcGVkIGF0IGxlYXN0IHdyaXRlY29tYmluZWQgKGJ1ZmZlcmFibGUgaW4K
QVJNIHNwZWFrKSBpbnRvIHVzZXJzcGFjZSwgdGhvc2UgdW5hbGlnbmVkIGFjY2Vzc2VzIGFyZSBu
b3QgYWxsb3dlZCBhbmQKd2lsbCBjYXVzZSB0cmFwcyBvbiB0aGUgaGFyZHdhcmUgbGV2ZWwuIE5v
cm1hbGx5IHRoaXMgc2hvdWxkIGp1c3QgbGVhZAp0byB0aGUgcHJvY2VzcyBtYWtpbmcgdGhlIGFj
Y2VzcyBnZXR0aW5nIGtpbGxlZCB3aXRoIGEgU0lHQlVTLCBidXQKbWF5YmUgc29tZSBzeXN0ZW1z
IGhhbmRsZSB0aG9zZSB0cmFwcyB3cm9uZyBvbiBhIGZpcm13YXJlIGxldmVsPyBJZiB0aGUKa2Vy
bmVsIG1ha2VzIHN1Y2ggYW4gdW5hbGlnbmVkIGFjY2VzcyB0aGVuIHRoZSBrZXJuZWwgd2lsbCBm
YXVsdCwgd2hpY2gKbm9ybWFsbHkgbWVhbnMgaGFsdGluZyB0aGUga2VybmVsLgoKUmVnYXJkcywK
THVjYXMKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpk
cmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
