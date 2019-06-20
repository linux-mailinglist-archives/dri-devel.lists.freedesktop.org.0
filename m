Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BCBD4E133
	for <lists+dri-devel@lfdr.de>; Fri, 21 Jun 2019 09:23:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D40B6E844;
	Fri, 21 Jun 2019 07:23:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from crapouillou.net (outils.crapouillou.net [89.234.176.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D53616E58B
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Jun 2019 14:16:08 +0000 (UTC)
Date: Thu, 20 Jun 2019 16:15:59 +0200
From: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH v5 2/2] DRM: Add KMS driver for the Ingenic JZ47xx SoCs
To: Sam Ravnborg <sam@ravnborg.org>
Message-Id: <1561040159.1978.0@crapouillou.net>
In-Reply-To: <20190619122622.GB29084@ravnborg.org>
References: <20190603152331.23160-1-paul@crapouillou.net>
 <20190603152331.23160-2-paul@crapouillou.net>
 <20190619122622.GB29084@ravnborg.org>
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 21 Jun 2019 07:22:42 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=crapouillou.net; 
 s=mail; t=1561040165; h=from:from:sender:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=61YqVHCdsBReXxm/3QTsbGF8fRfNDuePQ2kaErTMnAs=;
 b=fYzlzc0aSLNqJ4oz7Y5SJxxDVNalZjIKYNa1B6M7JF5mbOthBfCzouM68lL+Ivzzx3sfxk
 RLKq2Mqf15Xe+loGSqQmQ1aIFirnXaGY2YNuIyIr5T+8ehvWwXRzWh36uARG+zImqflEtw
 +RnVcMiADHF6PqCywgI6huLIZX+Q270=
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, od@zcrc.me,
 Artur Rojek <contact@artur-rojek.eu>, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Maxime Ripard <maxime.ripard@bootlin.com>, Rob Herring <robh+dt@kernel.org>,
 Sean Paul <sean@poorly.run>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

CgpMZSBtZXIuIDE5IGp1aW4gMjAxOSDDoCAxNDoyNiwgU2FtIFJhdm5ib3JnIDxzYW1AcmF2bmJv
cmcub3JnPiBhIMOpY3JpdCAKOgo+IEhpIFBhdWwuCj4gCj4gT24gTW9uLCBKdW4gMDMsIDIwMTkg
YXQgMDU6MjM6MzFQTSArMDIwMCwgUGF1bCBDZXJjdWVpbCB3cm90ZToKPj4gIEFkZCBhIEtNUyBk
cml2ZXIgZm9yIHRoZSBJbmdlbmljIEpaNDd4eCBmYW1pbHkgb2YgU29Dcy4KPj4gIFRoaXMgZHJp
dmVyIGlzIG1lYW50IHRvIHJlcGxhY2UgdGhlIGFnaW5nIGp6NDc0MC1mYiBkcml2ZXIuCj4+IAo+
PiAgVGhpcyBkcml2ZXIgZG9lcyBub3QgbWFrZSB1c2Ugb2YgdGhlIHNpbXBsZSBwaXBlIGhlbHBl
ciwgZm9yIHRoZSAKPj4gcmVhc29uCj4+ICB0aGF0IGl0IHdpbGwgc29vbiBiZSB1cGRhdGVkIHRv
IHN1cHBvcnQgbW9yZSBhZHZhbmNlZCBmZWF0dXJlcyBsaWtlCj4+ICBtdWx0aXBsZSBwbGFuZXMs
IElQVSBpbnRlZ3JhdGlvbiBmb3IgY29sb3JzcGFjZSBjb252ZXJzaW9uIGFuZCAKPj4gdXAvZG93
bgo+PiAgc2NhbGluZywgc3VwcG9ydCBmb3IgRFNJIGRpc3BsYXlzLCBhbmQgVFYtb3V0IGFuZCBI
RE1JIG91dHB1dHMuCj4+IAo+PiAgU2lnbmVkLW9mZi1ieTogUGF1bCBDZXJjdWVpbCA8cGF1bEBj
cmFwb3VpbGxvdS5uZXQ+Cj4+ICBUZXN0ZWQtYnk6IEFydHVyIFJvamVrIDxjb250YWN0QGFydHVy
LXJvamVrLmV1Pgo+PiAgLS0tCj4+IAo+PiAgTm90ZXM6Cj4+ICAgICAgdjI6IC0gUmVtb3ZlIGN1
c3RvbSBoYW5kbGluZyBvZiBwYW5lbC4gVGhlIHBhbmVsIGlzIG5vdyAKPj4gZGlzY292ZXJlZCB1
c2luZwo+PiAgICAgIAkgIHRoZSBzdGFuZGFyZCBBUEkuCj4+ICAgICAgCS0gTG90cyBvZiBzbWFs
bCB0d2Vha3Mgc3VnZ2VzdGVkIGJ5IHVwc3RyZWFtCj4+IAo+PiAgICAgIHYzOiAtIFVzZSBkZXZt
X2RybV9kZXZfaW5pdCgpCj4+ICAgICAgCS0gVXBkYXRlIGNvbXBhdGlibGUgc3RyaW5ncyB0byAt
bGNkIGluc3RlYWQgb2YgLWRybQo+PiAgICAgIAktIEFkZCBkZXN0cm95KCkgY2FsbGJhY2tzIHRv
IHBsYW5lIGFuZCBjcnRjCj4+ICAgICAgCS0gVGhlIGluZ2VuaWMsbGNkLW1vZGUgaXMgbm93IHJl
YWQgZnJvbSB0aGUgYnJpZGdlJ3MgRFQgbm9kZQo+PiAKPj4gICAgICB2NDogUmVtb3ZlIGluZ2Vu
aWMsbGNkLW1vZGUgcHJvcGVydHkgY29tcGxldGVseS4gVGhlIHZhcmlvdXMgCj4+IG1vZGVzIGFy
ZSBub3cKPj4gICAgICAJZGVkdWNlZCBmcm9tIHRoZSBjb25uZWN0b3IgdHlwZSwgdGhlIHBpeGVs
IGZvcm1hdCBvciB0aGUgYnVzIAo+PiBmbGFncy4KPj4gCj4+ICAgICAgdjU6IC0gRml4IGZyYW1l
YnVmZmVyIHNpemUgaW5jb3JyZWN0bHkgY2FsY3VsYXRlZCBmb3IgMjRicHAgCj4+IGZyYW1lYnVm
ZmVycwo+PiAgICAgIAktIFVzZSAzMmJwcCBmcmFtZWJ1ZmZlciBpbnN0ZWFkIG9mIDE2YnBwLCBh
cyBpdCdsbCB3b3JrIHdpdGggCj4+IGJvdGgKPj4gICAgICAJICAxNi1iaXQgYW5kIDI0LWJpdCBw
YW5lbAo+PiAgICAgIAktIEdldCByaWQgb2YgZHJtX2Zvcm1hdF9wbGFuZV9jcHAoKSB3aGljaCBo
YXMgYmVlbiBkcm9wcGVkIAo+PiB1cHN0cmVhbQo+PiAgICAgIAktIEF2b2lkIHVzaW5nIGRybV9m
b3JtYXRfaW5mby0+ZGVwdGgsIHdoaWNoIGlzIGRlcHJlY2F0ZWQuCj4gSW4gdGhlIGRybSB3b3Js
ZCB3ZSBpbmNsdWRlIHRoZSByZXZpc2lvbiBub3RlcyBpbiB0aGUgY2hhbmdlbG9nLgo+IFNvIEkg
ZGlkIHRoaXMgd2hlbiBJIGFwcGxpZWQgaXQgdG8gZHJtLW1pc2MtbmV4dC4KPiAKPiBGaXhlZCBh
IGZldyB0cml2aWFsIGNoZWNrcGF0Y2ggd2FybmluZ3MgYWJvdXQgaW5kZW50IHRvby4KPiBUaGVy
ZSB3YXMgYSBmZXcgdG9vLWxvbmctbGluZXMgd2FybmluZ3MgdGhhdCBJIGlnbm9yZWQuIEZpeGlu
ZyB0aGVtCj4gd291bGQgaGF2ZSBodXJ0IHJlYWRhYmlsaXR5LgoKVGhhbmtzLgoKPiBJIGFzc3Vt
ZSB5b3Ugd2lsbCBtYWludGFpbiB0aGlzIGRyaXZlciBvbndhcmRzIGZyb20gbm93Lgo+IFBsZWFz
ZSByZXF1ZXN0IGRybS1taXNjIGNvbW1pdCByaWdodHMgKHNlZQo+IGh0dHBzOi8vd3d3LmZyZWVk
ZXNrdG9wLm9yZy93aWtpL0FjY291bnRSZXF1ZXN0cy8pCj4gWW91IHdpbGwgbmVlZCBhIGxlZ2Fj
eSBTU0ggYWNjb3VudC4KCkkgcmVxdWVzdGVkIGFuIGFjY291bnQgaGVyZToKaHR0cHM6Ly9naXRs
YWIuZnJlZWRlc2t0b3Aub3JnL2ZyZWVkZXNrdG9wL2ZyZWVkZXNrdG9wL2lzc3Vlcy8xNjIKCj4g
QW5kIHlvdSBzaG91bGQgZmFtaWxpYXJpemUgeW91cnNlbGYgd2l0aCB0aGUgbWFpbnRhaW5lci10
b29sczoKPiBodHRwczovL2RybS5wYWdlcy5mcmVlZGVza3RvcC5vcmcvbWFpbnRhaW5lci10b29s
cy9pbmRleC5odG1sCj4gCj4gRm9yIG15IHVzZSBJIHVzZSAiZGltIHVwZGF0ZS1icmFuY2hlczsg
ZGltIGFwcGx5OyBkaW0gcHVzaAo+IFNvIG9ubHkgYSBzbWFsbCBzdWJzZXQgaSBuZWVkZWQgZm9y
IHNpbXBsZSB1c2UuCj4gCj4gCVNhbQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2RyaS1kZXZlbA==
