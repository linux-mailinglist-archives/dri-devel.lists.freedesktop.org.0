Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C424A4A1B5
	for <lists+dri-devel@lfdr.de>; Tue, 18 Jun 2019 15:08:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 861686E161;
	Tue, 18 Jun 2019 13:08:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from pio-pvt-msa2.bahnhof.se (pio-pvt-msa2.bahnhof.se [79.136.2.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B33FC6E161
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jun 2019 13:08:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by pio-pvt-msa2.bahnhof.se (Postfix) with ESMTP id 0DC293F6C9;
 Tue, 18 Jun 2019 15:08:15 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bahnhof.se
X-Spam-Flag: NO
X-Spam-Score: -3.099
X-Spam-Level: 
X-Spam-Status: No, score=-3.099 tagged_above=-999 required=6.31
 tests=[ALL_TRUSTED=-1, BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 URIBL_BLOCKED=0.001] autolearn=ham autolearn_force=no
Received: from pio-pvt-msa2.bahnhof.se ([127.0.0.1])
 by localhost (pio-pvt-msa2.bahnhof.se [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TzxFjHNwoyZV; Tue, 18 Jun 2019 15:08:02 +0200 (CEST)
Received: from mail1.shipmail.org (h-205-35.A357.priv.bahnhof.se
 [155.4.205.35]) (Authenticated sender: mb878879)
 by pio-pvt-msa2.bahnhof.se (Postfix) with ESMTPA id 3294C3F753;
 Tue, 18 Jun 2019 15:08:01 +0200 (CEST)
Received: from localhost.localdomain (h-205-35.A357.priv.bahnhof.se
 [155.4.205.35])
 by mail1.shipmail.org (Postfix) with ESMTPSA id 9F1223600DD;
 Tue, 18 Jun 2019 15:08:01 +0200 (CEST)
Subject: Re: [PATCH 1/4] drm/vmwgfx: Assign eviction priorities to resources
To: Daniel Vetter <daniel@ffwll.ch>, Emil Velikov <emil.l.velikov@gmail.com>
References: <20190618062442.14647-1-thomas@shipmail.org>
 <20190618105408.GB29642@arch-x1c3>
 <20190618121950.GW12905@phenom.ffwll.local>
From: Thomas Hellstrom <thomas@shipmail.org>
Message-ID: <a9b1154c-448d-65f2-7e74-a942933562dc@shipmail.org>
Date: Tue, 18 Jun 2019 15:08:01 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190618121950.GW12905@phenom.ffwll.local>
Content-Language: en-US
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=shipmail.org; s=mail; 
 t=1560863281; bh=8BJJ/UcuHlVtqu0zmflG2Zu/qQNOtA9Pe3m6lQgb9NI=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=Gs/JlVh2GeozUjG0p1GVvJtPXeQQap9UQpHmkFurXn5zH17Ty4+7vPpf+yNRqhe4t
 4lToIMRV6/4uXQmqwMGpAz1l6Stji9oMaiA311wE+tlGbfuk+n+Ez6jV2Kdz/G5xD7
 +8ttYJHI/rEh2mDUGaFfYQCfQmfPnS1gJb8Wyaak=
X-Mailman-Original-Authentication-Results: pio-pvt-msa2.bahnhof.se;
 dkim=pass (1024-bit key;
 unprotected) header.d=shipmail.org header.i=@shipmail.org header.b=Gs/JlVh2; 
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
Cc: pv-drivers@vmware.com, Thomas Hellstrom <thellstrom@vmware.com>,
 Deepak Rawat <drawat@vmware.com>, linux-graphics-maintainer@vmware.com,
 dri-devel@lists.freedesktop.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gNi8xOC8xOSAyOjE5IFBNLCBEYW5pZWwgVmV0dGVyIHdyb3RlOgo+IE9uIFR1ZSwgSnVuIDE4
LCAyMDE5IGF0IDExOjU0OjA4QU0gKzAxMDAsIEVtaWwgVmVsaWtvdiB3cm90ZToKPj4gSGkgVGhv
bWFzLAo+Pgo+PiBPbiAyMDE5LzA2LzE4LCBUaG9tYXMgSGVsbHN0csO2bSAoVk13YXJlKSB3cm90
ZToKPj4+IEZyb206IFRob21hcyBIZWxsc3Ryb20gPHRoZWxsc3Ryb21Adm13YXJlLmNvbT4KPj4+
Cj4+PiBUVE0gcHJvdmlkZXMgYSBtZWFucyB0byBhc3NpZ24gZXZpY3Rpb24gcHJpb3JpdGllcyB0
byBidWZmZXIgb2JqZWN0LiBUaGlzCj4+PiBtZWFucyB0aGF0IGFsbCBidWZmZXIgb2JqZWN0cyB3
aXRoIGEgbG93ZXIgcHJpb3JpdHkgd2lsbCBiZSBldmljdGVkIGZpcnN0Cj4+PiBvbiBtZW1vcnkg
cHJlc3N1cmUuCj4+PiBVc2UgdGhpcyB0byBtYWtlIHN1cmUgc3VyZmFjZXMgYW5kIGluIHBhcnRp
Y3VsYXIgbm9uLWRpcnR5IHN1cmZhY2VzIGFyZQo+Pj4gZXZpY3RlZCBmaXJzdC4gRXZpY3Rpbmcg
aW4gcGFydGljdWxhciBzaGFkZXJzLCBjb3RhYmxlcyBhbmQgY29udGV4dHMgaW1wbHkKPj4+IGEg
c2lnbmlmaWNhbnQgcGVyZm9ybWFuY2UgaGl0IG9uIHZtd2dmeCwgc28gbWFrZSBzdXJlIHRoZXNl
IHJlc291cmNlcyBhcmUKPj4+IGV2aWN0ZWQgbGFzdC4KPj4+IFNvbWUgYnVmZmVyIG9iamVjdHMg
YXJlIHN1Yi1hbGxvY2F0ZWQgaW4gdXNlci1zcGFjZSB3aGljaCBtZWFucyB3ZSBjYW4gaGF2ZQo+
Pj4gbWFueSByZXNvdXJjZXMgYXR0YWNoZWQgdG8gYSBzaW5nbGUgYnVmZmVyIG9iamVjdCBvciBy
ZXNvdXJjZS4gSW4gdGhhdCBjYXNlCj4+PiB0aGUgYnVmZmVyIG9iamVjdCBpcyBnaXZlbiB0aGUg
aGlnaGVzdCBwcmlvcml0eSBvZiB0aGUgYXR0YWNoZWQgcmVzb3VyY2VzLgo+Pj4KPj4+IFNpZ25l
ZC1vZmYtYnk6IFRob21hcyBIZWxsc3Ryb20gPHRoZWxsc3Ryb21Adm13YXJlLmNvbT4KPj4+IFJl
dmlld2VkLWJ5OiBEZWVwYWsgUmF3YXQgPGRyYXdhdEB2bXdhcmUuY29tPgo+PiBGd2l3IHBhdGNo
ZXMgMS0zIGFyZToKPj4gUmV2aWV3ZWQtYnk6IEVtaWwgVmVsaWtvdiA8ZW1pbC52ZWxpa292QGNv
bGxhYm9yYS5jb20+Cj4+Cj4+IFBhdGNoIDQgaXM6Cj4+IEFja2VkLWJ5OiBFbWlsIFZlbGlrb3Yg
PGVtaWwudmVsaWtvdkBjb2xsYWJvcmEuY29tPgo+Pgo+PiBIdWdlIHRoYW5rcyBmb3Igc29ydGlu
ZyB0aGlzIG91dC4KPiBPaCwgZG9lcyB0aGlzIG1lYW4gd2UgY2FuIHJlbW92ZSB0aGUgdmFyaW9z
IG1hc3RlciogY2FsbGJhY2tzIGZyb20KPiBkcm1fZHJpdmVyIG5vdz8gSWlyYyB2bXdnZnggd2Fz
IHRoZSBvbmx5IHVzZXIsIGFuZCB0aG9zZSBjYWxsYmFja3Mgc2VlbQo+IHZlcnkgdGVtcHRpbmcg
dG8gdmFyaW91cyBmb2xrcyBmb3IgaW1wbGVtZW50aW5nIHF1ZXN0aW9uYWJsZSBkcml2ZXIgaGFj
a3MKPiAuLi4gSGFwcHkgdG8gdHlwZSB0aGUgcGF0Y2hlcywgYnV0IG1heWJlIHNpbXBsZXIgaWYg
eW91IGRvIHRoYXQgc2luY2UgYWxsCj4gdGhpcyBnZXRzIG1lcmdlZCB0aHJvdWdoIHRoZSB2bXdn
ZnggdHJlZS4KPgo+IENoZWVycywgRGFuaWVsCgpJbiBjYXNlIHNvbWVvbmUgZm9sbG93IHRoaXMs
IEknbGwgcGFzdGUgaW4gdGhlIGNvbW1pdCBtZXNzYWdlIG9mIDQvNCAKd2hpY2ggaXMgdGhlIHJl
bGV2YW50IG9uZSBoZXJlLi4KCjg8LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0KCkF0IG9uZSBwb2ludCwgdGhlIEdQVSBjb21tYW5kIHZlcmlmaWVyIGFuZCB1c2Vy
LXNwYWNlIGhhbmRsZSBtYW5hZ2VyCmNvdWxkbid0IHByb3Blcmx5IHByb3RlY3QgR1BVIGNsaWVu
dHMgZnJvbSBhY2Nlc3NpbmcgZWFjaCBvdGhlcidzIGRhdGEuCkluc3RlYWQgdGhlcmUgd2FzIGFu
IGVsYWJvcmF0ZSBtZWNoYW5pc20gdG8gbWFrZSBzdXJlIG9ubHkgdGhlIGFjdGl2ZQptYXN0ZXIn
cyBwcmltYXJ5IGNsaWVudHMgY291bGQgcmVuZGVyLiBUaGUgb3RoZXIgY2xpZW50cyB3ZXJlIGVp
dGhlcgpwdXQgdG8gc2xlZXAgb3IgZXZlbiBraWxsZWQgKGlmIHRoZSBtYXN0ZXIgaGFkIGV4aXRl
ZCkuIFZSQU0gd2FzCmV2aWN0ZWQgb24gbWFzdGVyIHN3aXRjaC4gV2l0aCB0aGUgYWR2ZW50IG9m
IHJlbmRlci1ub2RlIGZ1bmN0aW9uYWxpdHksCndlIHJlbGF4ZWQgdGhlIFZSQU0gZXZpY3Rpb24s
IGJ1dCB0aGUgb3RoZXIgbWVjaGFuaXNtcyBzdGF5ZWQgaW4gcGxhY2UuCgpOb3cgdGhhdCB0aGUg
R1BVICBjb21tYW5kIHZlcmlmaWVyIGFuZCB0dG0gb2JqZWN0IG1hbmFnZXIgcHJvcGVybHkKaXNv
bGF0ZXMgcHJpbWFyeSBjbGllbnRzIGZyb20gZGlmZmVyZW50IG1hc3RlciByZWFsbXMgd2UgY2Fu
IHJlbW92ZSB0aGUKbWFzdGVyIHN3aXRjaCByZWxhdGVkIGNvZGUgYW5kIGRyb3AgdGhvc2UgbGVn
YWN5IGZlYXR1cmVzLgoKODwtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tCgpJIHRoaW5rIHdlIGNhbiBhdCBsZWFzdCB0YWtlIGEgbG9vay4gSSdtIG91dCBvbiBhIGZh
aXJseSBsb25nIHZhY2F0aW9uIApzb29uIHNvIGluIGFueSBjYXNlIGl0IHdvbid0IGJlIGJlZm9y
ZSBBdWd1c3Qgb3Igc28uCgpPbmUgdXNlIHdlIHN0aWxsIGhhdmUgZm9yIG1hc3Rlcl9zZXQoKSBp
cyB0aGF0IGlmIGEgbWFzdGVyIGlzIHN3aXRjaGVkIAphd2F5LCBhbmQgdGhlbiB0aGUgbW9kZSBs
aXN0IGNoYW5nZXMsIGFuZCB0aGVuIHRoZSBtYXN0ZXIgaXMgc3dpdGNoZWQgCmJhY2ssIGl0IHdp
bGwgdHlwaWNhbGx5IG5vdCByZW1lbWJlciB0byBhY3Qgb24gdGhlIHN5c2ZzIGV2ZW50IHJlY2Vp
dmVkIAp3aGlsZSBzd2l0Y2hlZCBvdXQsIGFuZCBjb21lIGJhY2sgaW4gYW4gaW5jb3JyZWN0IG1v
ZGUuIFNpbmNlIG1vZGUtbGlzdCAKY2hhbmdlcyBoYXBwZW4gcXVpdGUgZnJlcXVlbnRseSB3aXRo
IHZpcnR1YWwgZGlzcGxheSBhZGFwdGVycyB0aGF0J3MgYmFkLgoKQnV0IHBlcmhhcHMgd2UgY2Fu
IGNvbnNpZGVyIG1vdmluZyB0aGF0IHRvIGNvcmUsIGlmIHRoYXQncyB3aGF0IG5lZWRlZCAKdG8g
Z2V0IHJpZCBvZiB0aGUgbWFzdGVyIHN3aXRjaCBjYWxsYmFja3MuCgovVGhvbWFzCgoKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWls
aW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
