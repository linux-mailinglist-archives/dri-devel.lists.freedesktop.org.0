Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8426726297A
	for <lists+dri-devel@lfdr.de>; Wed,  9 Sep 2020 10:03:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 537086EA82;
	Wed,  9 Sep 2020 08:03:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kapsi.fi (mail.kapsi.fi [IPv6:2001:67c:1be8::25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D88976EA82
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Sep 2020 08:03:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
 s=20161220; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=XjASIbBeIVCNLT3Zk1bmoMu9tjCwPWXDJh9QgrZMSlQ=; b=su4oUu3kUyoKA1fjUAZHsOSqam
 jp8gV2HiekuE/1PkiPK+QsRVN2RfeWPDsZaV385Uq2FZLbiErPvNRWStJQcqjfciB8LCmyuZxj2B6
 l1GrpxJmeYcd/YsdzDJyXytB+1fdM02HBwmd6887dvfjhfYhJGGhrnkgqZkWUUonABTsTZtXBi4KO
 rR2ZEGcYSAwv35er/CtQLI2g4HcGv5OEwAEx9/dwz6hchGeCWHxFrW8qJeJzPsKvhREi23J+fv5dB
 uNin4aLMK25q5Zwt6hyAjnR2wYYKBpUwMdOQWa4uV+BPIj3DGBPhEHMWmW/T8H8Q4kqo+WL1k619U
 o4pgD/RA==;
Received: from dsl-hkibng22-54faab-65.dhcp.inet.fi ([84.250.171.65]
 helo=[192.168.1.10])
 by mail.kapsi.fi with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.89) (envelope-from <cyndis@kapsi.fi>)
 id 1kFv4c-0007Nr-2u; Wed, 09 Sep 2020 11:03:22 +0300
Subject: Re: [RFC PATCH v2 06/17] gpu: host1x: Cleanup and refcounting for
 syncpoints
To: Dmitry Osipenko <digetx@gmail.com>,
 Mikko Perttunen <mperttunen@nvidia.com>, thierry.reding@gmail.com,
 jonathanh@nvidia.com, airlied@linux.ie, daniel@ffwll.ch
References: <20200905103420.3021852-1-mperttunen@nvidia.com>
 <20200905103420.3021852-7-mperttunen@nvidia.com>
 <913a625c-9630-92af-aba0-fdddf6bbdb29@gmail.com>
 <e9cce9d5-1a63-077e-1ca6-ac5d5112d5fe@kapsi.fi>
 <a7213cd6-3bba-95a2-1f88-b8a64a5c2e87@gmail.com>
From: Mikko Perttunen <cyndis@kapsi.fi>
Message-ID: <50d2e0b3-e23d-d2d1-0523-a8f83a7eecba@kapsi.fi>
Date: Wed, 9 Sep 2020 11:03:12 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <a7213cd6-3bba-95a2-1f88-b8a64a5c2e87@gmail.com>
Content-Language: en-US
X-SA-Exim-Connect-IP: 84.250.171.65
X-SA-Exim-Mail-From: cyndis@kapsi.fi
X-SA-Exim-Scanned: No (on mail.kapsi.fi); SAEximRunCond expanded to false
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
Cc: linux-tegra@vger.kernel.org, talho@nvidia.com, bhuntsman@nvidia.com,
 dri-devel@lists.freedesktop.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gOS85LzIwIDM6MDcgQU0sIERtaXRyeSBPc2lwZW5rbyB3cm90ZToKPiAwNS4wOS4yMDIwIDE3
OjUzLCBNaWtrbyBQZXJ0dHVuZW4g0L/QuNGI0LXRgjoKPiAuLi4KPj4+IEhlbGxvLCBNaWtrbyEK
Pj4+Cj4+PiBXaGF0IGRvIHlvdSB0aGluayBhYm91dCB0byBvcGVuLWNvZGUgYWxsIHRoZSBob3N0
MXggc3RydWN0cyBieSBtb3ZpbmcKPj4+IHRoZW0gYWxsIG91dCBpbnRvIHRoZSBwdWJsaWMgbGlu
dXgvaG9zdDF4Lmg/IFRoZW4gd2UgY291bGQgaW5saW5lIGFsbAo+Pj4gdGhlc2UgdHJpdmlhbCBz
aW5nbGUtbGluZSBmdW5jdGlvbnMgYnkgaGF2aW5nIHRoZW0gZGVmaW5lZCBpbiB0aGUgcHVibGlj
Cj4+PiBoZWFkZXIuIFRoaXMgd2lsbCBhdm9pZCBhbGwgdGhlIHVubmVjZXNzYXJ5IG92ZXJoZWFk
IGJ5IGFsbG93aW5nCj4+PiBjb21waWxlciB0byBvcHRpbWl6ZSB0aGUgY29kZSBuaWNlbHkuCj4+
Pgo+Pj4gT2YgY291cnNlIHRoaXMgY291bGQgYmUgYSBzZXBhcmF0ZSBjaGFuZ2UgYW5kIGl0IGNv
dWxkIGJlIGRvbmUgc29tZXRpbWUKPj4+IGxhdGVyLCBJIGp1c3Qgd2FudGVkIHRvIHNoYXJlIHRo
aXMgcXVpY2sgdGhvdWdodCBmb3IgdGhlIHN0YXJ0IG9mIHRoZQo+Pj4gcmV2aWV3Lgo+Pj4KPj4K
Pj4gSGkgOikKPj4KPj4gSSB0aGluayBmb3Igc3VjaCBtaWNyby1vcHRpbWl6YXRpb25zIHdlIHNo
b3VsZCBoYXZlIGEgYmVuY2htYXJrIHRvCj4+IGV2YWx1YXRlIGFnYWluc3QuIEknbSBub3Qgc3Vy
ZSB3ZSBoYXZlIGFsbCB0aGF0IG1hbnkgZnVuY3Rpb24gY2FsbHMgaW50bwo+PiBoZXJlIG92ZXJh
bGwgdGhhdCBpdCB3b3VsZCBtYWtlIGEgbm90aWNlYWJsZSBkaWZmZXJlbmNlLiBJbiBhbnkgY2Fz
ZSwgYXMKPj4geW91IHNhaWQsIEknZCBwcmVmZXIgdG8ga2VlcCBmdXJ0aGVyIHJlZmFjdG9yaW5n
IHRvIGEgc2VwYXJhdGUgc2VyaWVzIHRvCj4+IGF2b2lkIGdyb3dpbmcgdGhpcyBzZXJpZXMgdG9v
IG11Y2guCj4gCj4gVGhlIHBlcmZvcm1hbmNlIGRpZmZlcmVuY2UgZG9lc24ndCBib3RoZXIgbWUs
IGl0IHNob3VsZCBiZSBpbnNpZ25pZmljYW50Cj4gaW4gdGhpcyBwYXJ0aWN1bGFyIGNhc2UuIFRo
ZSBhbW91bnQgb2YgdGhlIGV4cG9ydGVkIGZ1bmN0aW9ucyBpcyB3aGF0Cj4gbWFrZXMgbWUgZmVl
bCB1bmNvbWZvcnRhYmxlLCBhbmQgZXNwZWNpYWxseSB0aGF0IG1vc3Qgb2YgdGhvc2UgZnVuY3Rp
b25zCj4gYXJlIHRyaXZpYWwuCgpJIGRvbid0IHNlZSBhIHBhcnRpY3VsYXIgcHJvYmxlbSB3aXRo
IHRoaXMgLS0gSSB0aGluayBpdCdzIGJldHRlciB0byAKa2VlcCB0aGUgZGF0YSBzdHJ1Y3R1cmVz
IGluIHRoZSBkcml2ZXItaW50ZXJuYWwgaGVhZGVycyB0byB0byBpbXByb3ZlIAptb2R1bGFyaXph
dGlvbi4gSSB0aGluayB3ZSBjYW4gZ2V0IHJpZCBvZiB0aGUgc3luY3B0X2dldF9ieV9pZCogCmZ1
bmN0aW9ucyBvbmNlIHdlIHJlbW92ZSB0aGUgc3RhZ2luZyBjb2RlLCBzbyB0aGF0IHdvdWxkIGNs
ZWFuIHVwIHRoaW5ncyAKYXMgd2VsbC4KCj4gCj4gTXkgY29uY2VybiBpcyB0aGF0IGRvaW5nIGNs
ZWFudXBzIG9mIHRoZSB1cHN0cmVhbSBkcml2ZXJzIHVzdWFsbHkgbm90Cj4gZWFzeS4gSGVuY2Ug
aXQgY291bGQgYmUgYSBnb29kIHRoaW5nIHRvIHB1dCBlZmZvcnQgaW50byByZXN0cnVjdHVyaW5n
Cj4gdGhlIGN1cnJlbnQgY29kZSBiZWZvcmUgbmV3IGNvZGUgaXMgYWRkZWQuIEJ1dCBhdCBmaXJz
dCB3ZSBuZWVkIHRvIGhhdmUKPiBhIGZ1bGwtZmVhdHVyZWQgZHJhZnQgaW1wbGVtZW50YXRpb24g
dGhhdCB3aWxsIHNob3cgd2hhdCBwYXJ0cyBvZiB0aGUKPiBkcml2ZXIgcmVxdWlyZSByZWZhY3Rv
cmluZy4KPiAKCk15IGZlZWxpbmcgaXMgdGhhdCBvbmNlIHdlIGhhdmUgdGhlIG5ldyBVQVBJIGlt
cGxlbWVudGVkLCByZWZhY3RvcmluZyAKd2lsbCBiZSBlYXNpZXIgYmVjYXVzZSB3ZSBoYXZlIGEg
YmV0dGVyIGlkZWEgb2Ygd2hhdCB3ZSBuZWVkIG9mIHRoZSAKY29kZSwgYW5kIHdlIHdpbGwgYmUg
YWJsZSB0byByZW1vdmUgdGhlIHN0YWdpbmcgY29kZSwgYWxsb3dpbmcgcmVtb3ZhbCAKb3IgZWFz
aWVyIHJlZmFjdG9yaW5nIG9mIG1hbnkgb2xkIHBhdGhzLgoKV2hpbGUgZG9pbmcgdGhhdCwgc29t
ZSBvZiB0aGUgbmV3IGNvZGUgd2lsbCBoYXZlIHRvIGJlIGNoYW5nZWQgYWdhaW4gYXMgCndlbGws
IHN1cmUsIGJ1dCBhdCBsZWFzdCB0aGUgZW50aXJlIHRpbWUgd2Ugd2lsbCBoYXZlIGEgZnVuY3Rp
b25hbCAKaW1wbGVtZW50YXRpb24uCgpNaWtrbwpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0
cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9kcmktZGV2ZWwK
