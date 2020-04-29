Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A8D891BDFD3
	for <lists+dri-devel@lfdr.de>; Wed, 29 Apr 2020 16:00:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 88E886EE9F;
	Wed, 29 Apr 2020 14:00:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 901 seconds by postgrey-1.36 at gabe;
 Wed, 29 Apr 2020 14:00:06 UTC
Received: from mickerik.phytec.de (mickerik.phytec.de [195.145.39.210])
 by gabe.freedesktop.org (Postfix) with ESMTP id 6ABB76EE9F
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Apr 2020 14:00:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; d=phytec.de; s=a1; c=relaxed/simple;
 q=dns/txt; i=@phytec.de; t=1588167904; x=1590759904;
 h=From:Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=xlNJzENzGdwVrLtZkCj2SP29S7rBf6E3uG2taG606uk=;
 b=oXlvIHRP5IFNPMrTe6r7bTXJLhcQmXCAk9cHNE+FPRCwi3S8aFVxLeG568wYwWDR
 YBV+KORkLoks3YqeoOMy/Ol7+jEyt4Sw/JEO+lnA6s+DHgZThgJap1RhXS8jiYNp
 rT9CS5MNwYO96aUFCHBA+Aib/NVA36v1pfXuE9BPwuE=;
X-AuditID: c39127d2-9f7ff70000001ac4-3e-5ea984e0caf8
Received: from idefix.phytec.de (Unknown_Domain [172.16.0.10])
 by mickerik.phytec.de (PHYTEC Mail Gateway) with SMTP id 0D.BC.06852.0E489AE5;
 Wed, 29 Apr 2020 15:45:04 +0200 (CEST)
Received: from [172.16.21.128] ([172.16.21.128])
 by idefix.phytec.de (IBM Domino Release 9.0.1FP7)
 with ESMTP id 2020042915450423-291825 ;
 Wed, 29 Apr 2020 15:45:04 +0200 
Subject: Re: [PATCH v2] drm/panel: simple: Support reset GPIOs
To: Miquel Raynal <miquel.raynal@bootlin.com>, Sam Ravnborg <sam@ravnborg.org>
References: <20191224142134.22902-1-miquel.raynal@bootlin.com>
 <20200102172700.GA15341@ravnborg.org> <20200106101042.5bb5b742@xps13>
From: Wadim Egorov <w.egorov@phytec.de>
Message-ID: <519b5628-3e40-b034-8efd-56288cc2159e@phytec.de>
Date: Wed, 29 Apr 2020 15:45:04 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200106101042.5bb5b742@xps13>
X-MIMETrack: Itemize by SMTP Server on Idefix/Phytec(Release 9.0.1FP7|August
 17, 2016) at 29.04.2020 15:45:04,
 Serialize by Router on Idefix/Phytec(Release 9.0.1FP7|August  17, 2016) at
 29.04.2020 15:45:04
X-TNEFEvaluated: 1
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrHLMWRmVeSWpSXmKPExsWyRoCBS/dBy8o4g9fLRCx6z51ksrjy9T2b
 xeVdc9gsXr7exmxxuH0fq8Xlr32MFit+bmW0+LlrHotF55t37A6cHvPWVHvsnHWX3WP7twes
 Hve7jzN5LJl2lc3j8ya5ALYoLpuU1JzMstQifbsErowXW78xFtwRq1h+4hB7A+NaoS5GTg4J
 AROJizcXsYHYQgLbGCWudvJ3MXIB2WcYJQ5MXs7cxcjBISxgJzHnMjNIjYiAn8THp03sIDXM
 AkuYJGY132SDaGhjlPj4cDsjSBWbgLrEnQ3fWEFsXgEbiSNX74BtYBFQlbi2dycTiC0qECHx
 +eARNogaQYmTM5+wgNicAjoSzz5cYQIZKiFwhVHi07b9TBCnCkmcXnwW7AxmoAV/5l2CssUl
 bj2ZzwRha0ssW/iaeQKj0Cwkc2chaZmFpGUWkpYFjCyrGIVyM5OzU4sys/UKMipLUpP1UlI3
 MQLj6PBE9Us7GPvmeBxiZOJgPMQowcGsJML7KGNZnBBvSmJlVWpRfnxRaU5q8SFGaQ4WJXHe
 DbwlYUIC6YklqdmpqQWpRTBZJg5OqQZGqymOjyevWNWW6XhrHdvJI8IH4w0Vfp5aa/Svh1l0
 sTjr2W8F3cX9BS/PHtnIdLHs17QIv4OruOfX/hL1/G18JnDHr4aEj4k8r8+c61Yo/OWx4ty0
 JbIpcWsDEuIsp001WO4YM31G4IusQ+eFgtY+WXnhZfEOm5J+zpiZGjOsvq9baPuu1yuST4ml
 OCPRUIu5qDgRAAWr3EKRAgAA
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
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Maxime Chevallier <maxime.chevallier@bootlin.com>,
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgU2FtLAoKeW91J3ZlIGFza2VkIGluIGFub3RoZXIgdGhyZWFkIFsxXSBpZiB0aGVyZSBpcyBh
bnkga25vd24gc2ltcGxlIHBhbmVsCnRoYXQgcmVxdWlyZXMgYSByZXNldC4gV2UgaGF2ZSBhIERl
bnNpdHJvbiBETVQwNzBXU05MQ01JLTFFIFBhbmVsCihjb21wYXRpYmxlIHRvIGF2aWMsdG0wNzBk
ZGgwMykgd2l0aCBzb21lIHJlc2V0IHRpbWluZyByZXF1aXJlbWVudHMsIFsyXQpQYWdlIDIwLiBT
byBpdCB3b3VsZCBiZSBuaWNlIHRvIHNlZSB0aGlzIHBhdGNoIGFjY2VwdGVkLgoKWzFdIGh0dHBz
Oi8vcGF0Y2h3b3JrLmtlcm5lbC5vcmcvcGF0Y2gvMTEyOTIyMDcvClsyXQpodHRwczovL3d3dy5k
ZW5zaXRyb24uY29tL3NpdGVzL2RlZmF1bHQvZmlsZXMvMjAxOS0wOS9ETVQwNzBXU05MQ01JLTFF
JTIwUmV2JTIwQS5wZGYKClJlZ2FyZHMsCldhZGltCgpPbiAwNi4wMS4yMCAxMDoxMCwgTWlxdWVs
IFJheW5hbCB3cm90ZToKPiBIaSBTYW0sCj4KPiBTYW0gUmF2bmJvcmcgPHNhbUByYXZuYm9yZy5v
cmc+IHdyb3RlIG9uIFRodSwgMiBKYW4gMjAyMCAxODoyNzowMCArMDEwMDoKPgo+PiBIaSBNaXF1
ZWwKPj4KPj4gT24gVHVlLCBEZWMgMjQsIDIwMTkgYXQgMDM6MjE6MzRQTSArMDEwMCwgTWlxdWVs
IFJheW5hbCB3cm90ZToKPj4+IFRoZSBwYW5lbCBjb21tb24gYmluZGluZ3MgcHJvdmlkZSBhIGdw
aW9zLXJlc2V0IHByb3BlcnR5LiBMZXQncwo+Pj4gc3VwcG9ydCBpdCBpbiB0aGUgc2ltcGxlIGRy
aXZlci4KPj4+Cj4+PiBUd28gZmllbGRzIGFyZSBhZGRlZCB0byB0aGUgcGFuZWwgZGVzY3JpcHRp
b24gc3RydWN0dXJlOiB0aGUgdGltZSB0bwo+Pj4gYXNzZXJ0IHRoZSByZXNldCBhbmQgdGhlIHRp
bWUgdG8gd2FpdCByaWdodCBhZnRlciBiZWZvcmUgc3RhcnRpbmcgdG8KPj4+IGludGVyYWN0IHdp
dGggaXQgaW4gYW55IG1hbm5lci4gSW4gY2FzZSB0aGVzZSBkZWZhdWx0IHZhbHVlcyBhcmUgbm90
Cj4+PiBmaWxsZWQgYnV0IHRoZSBHUElPIGlzIHByZXNlbnQgaW4gdGhlIERULCBkZWZhdWx0IHZh
bHVlcyBhcmUgYXBwbGllZC4gIAo+PiBXZWhuIHdlIGRpc2N1c3NlZCB0aGlzIHRoZSBsYXN0IHRp
bWUgeW91IHdyb3RlOgo+Pgo+PiAiIiIKPj4gbXkgaGFyZHdhcmUgaXM6Cj4+Cj4+IExWRFMgSVAg
PC0tLS0tLS0tLS0+IExWRFMgdG8gUkdCIGJyaWRnZSA8LS0tLS0tLS0tLS0tPiBQYW5lbAo+Pgo+
PiBXaGlsZSB0aGVyZSBpcyBhIHNpbXBsZSAiUkdCIHRvIExWRFMiIGJyaWRnZSBkcml2ZXIsIHRo
ZXJlIGlzIG5vbmUKPj4gZG9pbmcgdGhlIHdvcmsgdGhlIG90aGVyIHdheSBhcm91bmQuIEluIG15
IGNhc2UsIHRoZSBicmlkZ2UgaGFzIGEgcmVzZXQKPj4gcGluLgo+Pgo+PiBBcyB1bnRpbCBub3cg
dGhlcmUgaXMgbm8gd2F5IHRvIHJlcHJlc2VudCB0aGUgIkxWRFMgdG8gUkdCIiBicmlkZ2UgYW5k
Cj4+IGJlY2F1c2UgdGhlIGJpbmRpbmdzIGFscmVhZHkgZG9jdW1lbnQgc3VjaCByZXNldCBwaW4s
IEkgZGVjaWRlZCB0byBhZGQKPj4gc3VwcG9ydCBmb3IgaXQgaW4gdGhlIHNpbXBsZSBwYW5lbCBk
cml2ZXIuCj4+ICIiIgo+Pgo+PiBCYXNlZCBvbiB0aGUgaW5mb3JtYXRpb24gcHJvdmlkZWQgaXQg
c2VlbXMgdGhhdCB0aGUgY29ycmVjdCB3YXkgaXMgdG8KPj4gYWRkIGEgIkxWRFMgdG8gUkdCIGJy
aWRnZSIgYW5kIHRoZW4gbGV0IHRoZSBicmlkZ2UgaGFuZGxlIHRoZSByZXNldAo+PiBmdW5jdGlv
bmFsaXR5Lgo+IFRoaXMgSSBhZ3JlZSwgYnV0IHdlIGFyZSB0YWxraW5nIGFib3V0IG15IGN1cnJl
bnQgc2l0dWF0aW9uLiAKPgo+PiBJdCBpcyBvYnZpb3VzbHkgbXVjaCBtb3JlIGNvZGUgdG8gZG8g
aXQgdGhpcyB3YXkgYnV0IHRoZW4KPj4gb3RoZXIgcGFuZWxzIHVzaW5nIHRoZSBzYW1lIHR5cGUg
b2YgYnJpZ2RlIGhhdmUgdGhlCj4+IHNhbWUgZnVuY3Rpb25hbGl0eSB3aXRob3V0IGFkZGluZyBi
cmlkZ2UgZnVuY3Rpb25hbGl0eSB0byB0aGUgcGFuZWwuCj4gVGhpcywgSSBkbyBub3QgZnVsbHkg
YWdyZWUgYXMgYmluZGluZ3MgZm9yIHRoZSBwYW5lbCByZXNldCBhbHJlYWR5Cj4gZXhpc3QgYW5k
IHdlIGNvdWxkIGhhdmUgYSByZXNldCBvbiBib3RoOiB0aGUgYnJpZGdlIGFuZCB0aGUgcGFuZWwu
Cj4gSSBjaG9vc2UgdG8gdXNlIGEgd3JvbmcgKHByaXZhdGUpIERUIHJlcHJlc2VudGF0aW9uIGJl
Y2F1c2UgSSBhbSBub3QKPiB3aWxsaW5nIHRvIGFkZCBhbiBMVkRTLT5SR0IgYnJpZGdlOiBhcyB5
b3Ugc2F5LCBpdCBpcyBtdWNoIG1vcmUgd29yayB0bwo+IGRvLiBCdXQsIElNSE8sIHRoaXMgaXMg
bm90IHJlbGF0ZWQgdG8gdGhlIHBhdGNoLiBJZiB5b3UgY29uc2lkZXIgdGhpcwo+IHBhdGNoIHdy
b25nIGJlY2F1c2UgYSBwYW5lbCBjYW5ub3QgaGF2ZSBhIHJlc2V0LCB0aGVuIGl0IHNob3VsZCBi
ZQo+IHN0YXRlZCBjbGVhcmx5IGFuZCBtYXliZSByZW1vdmVkIGZyb20gdGhlIGJpbmRpbmdzPwo+
Cj4gQW55d2F5IGlmIHlvdSB0aGluayB0aGlzIGNoYW5nZSBjYW4ndCBiZSB1c2VmdWwsIGxldCdz
IHB1dCBpdCBhc2lkZS4KPgo+IFRoYW5rcyBmb3IgeW91ciB0aW1lLAo+IE1pcXXDqGwKPgo+IF9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gZHJpLWRldmVs
IG1haWxpbmcgbGlzdAo+IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPiBodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbApfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGlu
ZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVl
ZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
