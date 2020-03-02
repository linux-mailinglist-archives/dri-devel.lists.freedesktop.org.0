Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D4A571770FE
	for <lists+dri-devel@lfdr.de>; Tue,  3 Mar 2020 09:24:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 13D666E9E5;
	Tue,  3 Mar 2020 08:24:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mo6-p00-ob.smtp.rzone.de (mo6-p00-ob.smtp.rzone.de
 [IPv6:2a01:238:20a:202:5300::11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DBE346E845
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Mar 2020 21:24:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1583184269;
 s=strato-dkim-0002; d=goldelico.com;
 h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:
 X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
 bh=k714avCRtMuUJjYBC8ACupkjAbYu1Z+/DP8w0F/Aq+w=;
 b=Tc3GdUe8W4+YuWsT4rL4m8QjIqIMDk6he7iltBKxGPPUV2Ee2inlOyDj+2nXKaHmxG
 9bB0bZgAsOMtVCxEgpoPhv3GRC1TKLLKJK4rYCAMwGSAPenBybW2T/W5FF5JCz2CB4on
 QWWGsMTwF7usma1g/JxMtUsSvG0H4Baee4dJ4QLnvJlhBRSiASoPCi/RAJRijyRcJb81
 QVSFBAzyHm7OFgRu2mCZZLR+e4UMhCZ5wqO8dqLbebpRfeVtzKMPtUIcFdkh3kam0CsD
 pGXY26AGj0SUcrrM9IxzYLlKPZ8fh7kBIZCeRb2ooeV3MIXh0Yvgsg86zLCVWgmmHlCX
 Lo/Q==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMgPgp8VKxflSZ1P34KBj5Qpw97WFDlaeXAoE1Q=="
X-RZG-CLASS-ID: mo00
Received: from imac.fritz.box by smtp.strato.de (RZmta 46.2.0 DYNA|AUTH)
 with ESMTPSA id y0a02cw22LOFFAa
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (curve X9_62_prime256v1 with 256
 ECDH bits, eq. 3072 bits RSA))
 (Client did not present a certificate);
 Mon, 2 Mar 2020 22:24:15 +0100 (CET)
Subject: Re: [PATCH 24/33] drm/panel-simple: Fix dotclock for Ortustech
 COM37H3M
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
From: "H. Nikolaus Schaller" <hns@goldelico.com>
In-Reply-To: <20200302203452.17977-25-ville.syrjala@linux.intel.com>
Date: Mon, 2 Mar 2020 22:24:14 +0100
Message-Id: <4320E187-FAA1-4033-A02C-7DA1F9B68A52@goldelico.com>
References: <20200302203452.17977-1-ville.syrjala@linux.intel.com>
 <20200302203452.17977-25-ville.syrjala@linux.intel.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>
X-Mailer: Apple Mail (2.3124)
X-Mailman-Approved-At: Tue, 03 Mar 2020 08:24:06 +0000
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
Cc: Discussions about the Letux Kernel <letux-kernel@openphoenux.org>,
 Sam Ravnborg <sam@ravnborg.org>,
 "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgVmlsbGUsCgo+IEFtIDAyLjAzLjIwMjAgdW0gMjE6MzQgc2NocmllYiBWaWxsZSBTeXJqYWxh
IDx2aWxsZS5zeXJqYWxhQGxpbnV4LmludGVsLmNvbT46Cj4gCj4gRnJvbTogVmlsbGUgU3lyasOk
bMOkIDx2aWxsZS5zeXJqYWxhQGxpbnV4LmludGVsLmNvbT4KPiAKPiBUaGUgY3VycmVudGx5IGxp
c3RlZCBkb3RjbG9jayBkaXNhZ3JlZXMgd2l0aCB0aGUgY3VycmVudGx5Cj4gbGlzdGVkIHZyZWZy
ZXNoIHJhdGUuIENoYW5nZSB0aGUgZG90Y2xvY2sgdG8gbWF0Y2ggdGhlIHZyZWZyZXNoLgo+IAo+
IFNvbWVvbmUgdGVsbCBtZSB3aGljaCAoaWYgZWl0aGVyKSBvZiB0aGUgZG90Y2xvY2sgb3IgdnJl
cmVzaCBpcwo+IGNvcnJlY3Q/CgpEYXRhIHNoZWV0IG9mIENPTTM3SDNNOTlEVEMgc2F5czoKCgkJ
CU1JTglUWVAJTUFYCkNMSyBmcmVxdWVuY3kgCWZDTEsJMTgJMTkuOAkyNwlNSHoKVlNZTkMgRnJl
cXVlbmN5CWZWU1lOQwk1NAk2MAk2NglIegpWU1lOQyBjeWNsZSB0aW1lIHR2CTY0Ngk2NTAJNzAw
CUgKSFNZTkMgZnJlcXVlbmN5CWZIU1lOQwktLQkzOS4wCTUwLjAJS2h6CkhTWU5DIGN5Y2xlIHRp
bWUgdGgJNTA0CTUwOAk2MzAJQ0xLCgpCdXQgZGF0YSBzaGVldCBvZiBDT00zN0gzTTA1RFRDIHNh
eXMKCgkJCU1JTglUWVAJTUFYCkNMSyBmcmVxdWVuY3kgCWZDTEsJLS0JMjIuNAkyNi4zCU1IeiAo
aW4gVkdBIG1vZGUgLSB0aGVyZSBpcyBhbHNvIGFuIFFWR0EgbW9kZSkKVlNZTkMgRnJlcXVlbmN5
CWZWU1lOQwk1NAk2MAk2NglIegpWU1lOQyBjeWNsZSB0aW1lIHR2CS0tCTY1MAktLQlICkhTWU5D
IGZyZXF1ZW5jeQlmSFNZTkMJLS0JMzkuMwktLQlLaHoKSFNZTkMgY3ljbGUgdGltZSB0aAktLQk1
NzAJLS0JQ0xLCgpTbyB0aGVyZSBhcmUgdHdvIGRpZmZlcmVudCBzdWJ2YXJpYW50cyBvZiB0aGUg
c2FtZSBwYW5lbC4KCklmIEkgcmVtZW1iZXIgY29ycmVjdGx5LCB0aGUgMDUgaXMgb2xkZXIgKEFw
cmlsIDIwMTApCmFuZCB0aGUgOTlEVEMgbmV3ZXIgKERlYyAyMDExKS4KClNvIDIyIE1IeiBpc24n
dCBvdXRzaWRlIG9mIGVpdGhlciBzcGVjIGJ1dCBtYXkgYmUgaGlnaGVyCnRoYW4gbmVlZGVkIGZv
ciB0aGUgOTlEVEMuIEkuZS4gdGhlIHBhbmVsIGlzIHByb2JhYmx5CnJ1bm5pbmcgYXQgaGlnaGVy
IGZyYW1lIHJhdGUgdGhhbiA2MCBmcHMuCgpIbS4gSSB0aGluayB3ZSBzaG91bGQgZGVmaW5lIHNv
bWUgY29tcHJvbWlzZS4gSS5lLgoKLmNsb2NrID0gMjIyMzAKLnZyZWZyZXNoID0gNjAKLnZ0b3Rh
bCA9IDY1MAouaHRvdGFsID0gNTcwCgpQcm9iYWJseSB3ZSBvcmlnaW5hbGx5IHRyaWVkIHRvIGRv
IHRoaXMgd2l0aCB0aGUgcGFyYW1ldGVyCnNldCBidXQgZ290IHNvbWV0aGluZyB3cm9uZy4KCklm
IHlvdSBhZ3JlZSB3aXRoIHRoaXMgYXBwcm9hY2gsIEkgY2FuIHRyeSB0byBmaWd1cmUgb3V0CnRo
ZSBvdGhlciBwYXJhbWV0ZXJzIHNvIHRoYXQgdGhleSBzaG91bGQgZml0IGJvdGggcGFuZWwKdmFy
aWFudHMuIEkgY2FuIG9ubHkgdGVzdCB3aXRoIENPTTM3SDNNOTlEVEMgc2luY2UgSQpkbyBubyBs
b25nZXIgaGF2ZSBhIGRldmljZSB3aXRoIENPTTM3SDNNMDVEVEMuCgpJbiBnZW5lcmFsIGl0IHNl
ZW1zIHRoYXQgdGhlIHN0cnVjdHVyZSBkcm1fZGlzcGxheV9tb2RlCmlzIG92ZXJkZXRlcm1pbmVk
LgoKRWl0aGVyIC5jbG9jayBjb3VsZCBiZSBjYWxjdWxhdGVkIGZyb20gLnZyZWZyZXNoIChhbmQK
dGhlIG90aGVyIC52dG90YWwgYW5kIC5odG90YWwpIG9yIHZpY2UgdmVyc2EgbGlrZSBJCmRpZCBm
b3IgdGhlIHByb3Bvc2FsIGFib3ZlLgoKSSBoYXZlbid0IGxvb2tlZCBpbnRvIHRoZSBkcml2ZXIg
Y29kZSwgYnV0IHdvdWxkIGl0IGJlCnBvc3NpYmxlIHRvIHNwZWNpZnkgLmNsb2NrID0gMCAob3Ig
bGVhdmUgaXQgb3V0KSB0bwpjYWxjdWxhdGUgaXQgYm90dG9tIHVwPyBUaGlzIHdvdWxkIGF2b2lk
IHN1Y2ggaW5jb25zaXN0ZW5jaWVzLgoKT24gdGhlIG90aGVyIGhhbmQgaXQgaXMgbm90IGVhc2ls
eSB2aXNpYmxlIGFueSBtb3JlCmZyb20gdGhlIGNvZGUgaWYgdGhlIGNsb2NrIGlzIGluIHJhbmdl
IG9mIHRoZSBkYXRhCnNoZWV0IGxpbWl0cy4KCkJSIGFuZCB0aGFua3MsCk5pa29sYXVzCgo+IAo+
IENjOiBILiBOaWtvbGF1cyBTY2hhbGxlciA8aG5zQGdvbGRlbGljby5jb20+Cj4gQ2M6IFNhbSBS
YXZuYm9yZyA8c2FtQHJhdm5ib3JnLm9yZz4KPiBTaWduZWQtb2ZmLWJ5OiBWaWxsZSBTeXJqw6Rs
w6QgPHZpbGxlLnN5cmphbGFAbGludXguaW50ZWwuY29tPgo+IC0tLQo+IGRyaXZlcnMvZ3B1L2Ry
bS9wYW5lbC9wYW5lbC1zaW1wbGUuYyB8IDIgKy0KPiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRp
b24oKyksIDEgZGVsZXRpb24oLSkKPiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3Bh
bmVsL3BhbmVsLXNpbXBsZS5jIGIvZHJpdmVycy9ncHUvZHJtL3BhbmVsL3BhbmVsLXNpbXBsZS5j
Cj4gaW5kZXggY2E3MmI3MzQwOGU5Li5mOWI0Zjg0YmZmYjMgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVy
cy9ncHUvZHJtL3BhbmVsL3BhbmVsLXNpbXBsZS5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3Bh
bmVsL3BhbmVsLXNpbXBsZS5jCj4gQEAgLTI2MTcsNyArMjYxNyw3IEBAIHN0YXRpYyBjb25zdCBz
dHJ1Y3QgcGFuZWxfZGVzYyBvbnRhdF95eDcwMHd2MDMgPSB7Cj4gfTsKPiAKPiBzdGF0aWMgY29u
c3Qgc3RydWN0IGRybV9kaXNwbGF5X21vZGUgb3J0dXN0ZWNoX2NvbTM3aDNtX21vZGUgID0gewo+
IC0JLmNsb2NrID0gMjIxNTMsCj4gKwkuY2xvY2sgPSAxOTg0MiwKPiAJLmhkaXNwbGF5ID0gNDgw
LAo+IAkuaHN5bmNfc3RhcnQgPSA0ODAgKyA4LAo+IAkuaHN5bmNfZW5kID0gNDgwICsgOCArIDEw
LAo+IC0tIAo+IDIuMjQuMQo+IAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8v
ZHJpLWRldmVsCg==
