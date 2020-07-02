Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F683211CAB
	for <lists+dri-devel@lfdr.de>; Thu,  2 Jul 2020 09:24:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D2F546E513;
	Thu,  2 Jul 2020 07:24:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout2.samsung.com (mailout2.samsung.com [203.254.224.25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CBF676E1F6
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Jul 2020 05:19:41 +0000 (UTC)
Received: from epcas1p1.samsung.com (unknown [182.195.41.45])
 by mailout2.samsung.com (KnoxPortal) with ESMTP id
 20200702051939epoutp02233be5f890a51a00bd29f699c63b6c23~d19ssQHdI2786527865epoutp02A
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Jul 2020 05:19:39 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com
 20200702051939epoutp02233be5f890a51a00bd29f699c63b6c23~d19ssQHdI2786527865epoutp02A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1593667179;
 bh=zmF5QSVq5UDkoxb9qTSNo2o/MBAjk8aZ5xjOTRB3H8A=;
 h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
 b=pks2l2phggkyoMEereq8AxmzSr0u5wyrjLvRTLhHllxwoEtCoxaxMerbFvIlfLPoG
 0BD9BYJ0ZetlyM0peTf7ojmot6Ii8RYHJhiZjmt1zLKybEcS6ew6RvyqXJ7xlWOLwu
 aZeSDZ1t2o5ZbNq3aDCWt6Fua4Xumvtd0q7ZE4T4=
Received: from epsnrtp1.localdomain (unknown [182.195.42.162]) by
 epcas1p1.samsung.com (KnoxPortal) with ESMTP id
 20200702051938epcas1p114a89014ed1c5753e604e8e55cef0b92~d19rWOBnO0552605526epcas1p1K;
 Thu,  2 Jul 2020 05:19:38 +0000 (GMT)
Received: from epsmges1p5.samsung.com (unknown [182.195.40.153]) by
 epsnrtp1.localdomain (Postfix) with ESMTP id 49y5xg5f68zMqYlv; Thu,  2 Jul
 2020 05:19:35 +0000 (GMT)
Received: from epcas1p4.samsung.com ( [182.195.41.48]) by
 epsmges1p5.samsung.com (Symantec Messaging Gateway) with SMTP id
 97.DC.28578.56E6DFE5; Thu,  2 Jul 2020 14:19:33 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
 epcas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20200702051933epcas1p111c52c4ed9fa37e9a1648335dba5e479~d19m_21WD0520905209epcas1p1E;
 Thu,  2 Jul 2020 05:19:33 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
 epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20200702051933epsmtrp2102f67d785e96f30fcb2bae48e5ab982~d19m957ZE1271712717epsmtrp2e;
 Thu,  2 Jul 2020 05:19:33 +0000 (GMT)
X-AuditID: b6c32a39-e6f5da8000006fa2-9c-5efd6e65d48b
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
 epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
 B7.BE.08382.56E6DFE5; Thu,  2 Jul 2020 14:19:33 +0900 (KST)
Received: from [10.113.221.102] (unknown [10.113.221.102]) by
 epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20200702051932epsmtip25824646da779bcc1c979a726e713af94~d19mmeBft2184521845epsmtip2f;
 Thu,  2 Jul 2020 05:19:32 +0000 (GMT)
Subject: Re: [PATCH v4 12/37] PM / devfreq: tegra20: Use MC timings for
 building OPP table
To: Dmitry Osipenko <digetx@gmail.com>, Thierry Reding
 <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Georgi
 Djakov <georgi.djakov@linaro.org>, Rob Herring <robh+dt@kernel.org>, Michael
 Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Peter
 De Schrijver <pdeschrijver@nvidia.com>, MyungJoo Ham
 <myungjoo.ham@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, Mikko
 Perttunen <cyndis@kapsi.fi>
From: Chanwoo Choi <cw00.choi@samsung.com>
Organization: Samsung Electronics
Message-ID: <2069fb51-f043-795d-7768-0024fc9a9f4e@samsung.com>
Date: Thu, 2 Jul 2020 14:30:48 +0900
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:59.0) Gecko/20100101
 Thunderbird/59.0
MIME-Version: 1.0
In-Reply-To: <4b22d3ee-f303-d81d-e261-187d4a46e749@gmail.com>
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrHJsWRmVeSWpSXmKPExsWy7bCmgW5q3t84g9OLbCzuz2tltHj36Smr
 xfwj51gtVn98zGhx5et7NovpezexWbTMWsRicbbpDbvF5V1z2Cw+9x5htOj8MovN4uIpV4vb
 jSvYLCatncpo0br3CLvFv2sbWSx+7prH4iDo8f5GK7vHzll32T0unfvD7LFpVSebx51re9g8
 7ncfZ/LobX7H5tG3ZRWjx+dNcgGcUdk2GamJKalFCql5yfkpmXnptkrewfHO8aZmBoa6hpYW
 5koKeYm5qbZKLj4Bum6ZOUC/KCmUJeaUAoUCEouLlfTtbIryS0tSFTLyi0tslVILUnIKLAv0
 ihNzi0vz0vWS83OtDA0MjEyBChOyM27e/8decFuyYv1e9gbG1yJdjJwcEgImEjubbjJ2MXJx
 CAnsYJTYcWoCG4TziVHiZM9JdgjnG6PEm/v32WBaHr27ygSR2Msoce/LRRYI5z2jxI8nW5lB
 qoQFYiQmdc8AS4gIHGGWWN15HGwLs8BlRomzbV/AZrEJaEnsf3EDzOYXUJS4+uMxI4jNK2An
 8eTGBRYQm0VARWL9qSawGlGBMImT21qgagQlTs58AlbDKWArcfX1PbAaZgFxiVtP5jNB2PIS
 zVtnM0Pc3c4pse5EPoTtInHq3i8mCFtY4tXxLewQtpTE53d7of6sllh58gg4NCQEOhgltuy/
 wAqRMJbYv3QyUDMH0AJNifW79CHCihI7f89lhNjLJ/Huaw8rSImEAK9ER5sQRImyxOUHd6HW
 Skosbu9km8CoNAvJN7OQfDALyQezEJYtYGRZxSiWWlCcm55abFhgihzdmxjBCV3Lcgfj9Lcf
 9A4xMnEwHmKU4GBWEuE9bfArTog3JbGyKrUoP76oNCe1+BCjKTB8JzJLiSbnA3NKXkm8oamR
 sbGxhYmhmamhoZI4r5P1hTghgfTEktTs1NSC1CKYPiYOTqkGps1zXktMkLJsv+MR1nhC6viM
 8KAPiokuS8L+/TieW27IxaR07lY2Y88yf/POZJMlU1UMnfrPvZvxotDjrX3DizWh75/9i/T8
 Y3aUL/tz6JJD3vkaLItuyqnxPl5buDbXKcxcJP6BoKCvXOJ5zacXLXtk08VY1b8lvp5/33Xv
 1ZbGXHVh3bOsO59mtm76YqPhU+q45FdIb+hUpcOrDa/dtPnyirOzi2nqj4uX5mpFOcgrZO0y
 myl8rLnKplYx657d/zc7lmWtv+puqXd40sYjDNLMHL+uHu7343pZU7fzonVaM/sJI+4D/+Sv
 JPIsPxywdq1dl8y5/ScKW48u2xTFe/Ua261df91dT27Zty4lWYmlOCPRUIu5qDgRACnbDORx
 BAAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrBIsWRmVeSWpSXmKPExsWy7bCSvG5q3t84g0tzeS3uz2tltHj36Smr
 xfwj51gtVn98zGhx5et7NovpezexWbTMWsRicbbpDbvF5V1z2Cw+9x5htOj8MovN4uIpV4vb
 jSvYLCatncpo0br3CLvFv2sbWSx+7prH4iDo8f5GK7vHzll32T0unfvD7LFpVSebx51re9g8
 7ncfZ/LobX7H5tG3ZRWjx+dNcgGcUVw2Kak5mWWpRfp2CVwZN+//Yy+4LVmxfi97A+NrkS5G
 Tg4JAROJR++uMnUxcnEICexmlJi+tpURIiEpMe3iUeYuRg4gW1ji8OFikLCQwFtGib4H3CC2
 sECMxKTuGSwgvSICx5glNp0+DTaIWeAyo8SOzq9sEFPnMUlcmH6fBaSFTUBLYv+LG2wgNr+A
 osTVH4/BtvEK2Ek8uXEBrIZFQEVi/akmsBpRgTCJnUseM0HUCEqcnPkErIZTwFbi6ut7YDXM
 AuoSf+ZdYoawxSVuPZnPBGHLSzRvnc08gVF4FpL2WUhaZiFpmYWkZQEjyypGydSC4tz03GLD
 AsO81HK94sTc4tK8dL3k/NxNjODI1tLcwbh91Qe9Q4xMHIyHGCU4mJVEeE8b/IoT4k1JrKxK
 LcqPLyrNSS0+xCjNwaIkznujcGGckEB6YklqdmpqQWoRTJaJg1OqgSl4mQOrZOLPdbOtygTZ
 rO4t5fvAXum4c4Ho1qP9PwP6m+ReMfBuOCe7pmLfzeYDCUe0Tnm2M1+aoPwqUPuy/my9N6lb
 p18vEHBlUpG3cFiTtsX2j9KOHOubYkVWzPV1k3nXnTl+1HZJlavx+UPKk/5eO/F2Dc/yOyHf
 pqTdnTF1VY60g8dJ27uZG7dtCxTVmOCv3bDBKEl7lkJizUkOF2P+buNXy9iO5ubMTVGd/Nx3
 qeC3C4kBdrs5f39KNHiiG6s4qdmsLValyqzzXH7Vtcbim+dCz/1b+nuiYcGOabP830Td26Qs
 2R0a/n7lpOtMzlz2GRqmoXvmyMfsLFU5f0v20pXWrY/uJWn1H/ji1KTEUpyRaKjFXFScCACf
 kFbgWwMAAA==
X-CMS-MailID: 20200702051933epcas1p111c52c4ed9fa37e9a1648335dba5e479
X-Msg-Generator: CA
X-Sendblock-Type: SVC_REQ_APPROVE
CMS-TYPE: 101P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20200609131458epcas1p2c774a0302bcef2c02790c2cb8cad57a0
References: <20200609131404.17523-1-digetx@gmail.com>
 <CGME20200609131458epcas1p2c774a0302bcef2c02790c2cb8cad57a0@epcas1p2.samsung.com>
 <20200609131404.17523-13-digetx@gmail.com>
 <4ea7fe00-7676-3186-8222-6e0d0eb8ed1f@samsung.com>
 <4b22d3ee-f303-d81d-e261-187d4a46e749@gmail.com>
X-Mailman-Approved-At: Thu, 02 Jul 2020 07:24:22 +0000
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
Cc: devicetree@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 =?UTF-8?B?QXJ0dXIgxZp3aWdvxYQ=?= <a.swigon@samsung.com>,
 linux-tegra@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gNy8yLzIwIDI6MDcgUE0sIERtaXRyeSBPc2lwZW5rbyB3cm90ZToKPiAwMi4wNy4yMDIwIDA3
OjE4LCBDaGFud29vIENob2kg0L/QuNGI0LXRgjoKPj4gSGkgRG1pdHJ5LAo+Pgo+PiBPbiA2Lzkv
MjAgMTA6MTMgUE0sIERtaXRyeSBPc2lwZW5rbyB3cm90ZToKPj4+IFRoZSBjbGtfcm91bmRfcmF0
ZSgpIHdvbid0IGJlIHVzYWJsZSBmb3IgYnVpbGRpbmcgT1BQIHRhYmxlIG9uY2UKPj4+IGludGVy
Y29ubmVjdCBzdXBwb3J0IHdpbGwgYmUgYWRkZWQgdG8gdGhlIEVNQyBkcml2ZXIgYmVjYXVzZSB0
aGF0IENMSyBBUEkKPj4+IGZ1bmN0aW9uIGxpbWl0cyB0aGUgcm91bmRlZCByYXRlIGJhc2VkIG9u
IHRoZSBjbGsgcmF0ZSB0aGF0IGlzIGltcG9zZWQgYnkKPj4+IGFjdGl2ZSBjbGstdXNlcnMsIGFu
ZCB0aHVzLCB0aGUgcm91bmRpbmcgd29uJ3Qgd29yayBhcyBleHBlY3RlZCBpZgo+Pj4gaW50ZXJj
b25uZWN0IHdpbGwgc2V0IHRoZSBtaW5pbXVtIEVNQyBjbG9jayByYXRlIGJlZm9yZSBkZXZmcmVx
IGRyaXZlciBpcwo+Pj4gbG9hZGVkLiBUaGUgc3RydWN0IHRlZ3JhX21jIGNvbnRhaW5zIG1lbW9y
eSB0aW1pbmdzIHdoaWNoIGNvdWxkIGJlIHVzZWQgYnkKPj4+IHRoZSBkZXZmcmVxIGRyaXZlciBm
b3IgYnVpbGRpbmcgdXAgT1BQIHRhYmxlIGluc3RlYWQgb2Ygcm91bmRpbmcgY2xvY2sKPj4+IHJh
dGUsIHRoaXMgcGF0Y2ggaW1wbGVtZW50cyB0aGlzIGlkZWEuCj4+Pgo+Pj4gU2lnbmVkLW9mZi1i
eTogRG1pdHJ5IE9zaXBlbmtvIDxkaWdldHhAZ21haWwuY29tPgo+Pj4gLS0tCj4+PiAgZHJpdmVy
cy9kZXZmcmVxL3RlZ3JhMjAtZGV2ZnJlcS5jIHwgMTggKysrKysrKysrKystLS0tLS0tCj4+PiAg
MSBmaWxlIGNoYW5nZWQsIDExIGluc2VydGlvbnMoKyksIDcgZGVsZXRpb25zKC0pCj4+Pgo+Pj4g
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvZGV2ZnJlcS90ZWdyYTIwLWRldmZyZXEuYyBiL2RyaXZlcnMv
ZGV2ZnJlcS90ZWdyYTIwLWRldmZyZXEuYwo+Pj4gaW5kZXggNjQ2OWRjNjljNWUwLi5iZjUwNGNh
NGRlYTIgMTAwNjQ0Cj4+PiAtLS0gYS9kcml2ZXJzL2RldmZyZXEvdGVncmEyMC1kZXZmcmVxLmMK
Pj4+ICsrKyBiL2RyaXZlcnMvZGV2ZnJlcS90ZWdyYTIwLWRldmZyZXEuYwo+Pj4gQEAgLTEyMyw4
ICsxMjMsNyBAQCBzdGF0aWMgaW50IHRlZ3JhX2RldmZyZXFfcHJvYmUoc3RydWN0IHBsYXRmb3Jt
X2RldmljZSAqcGRldikKPj4+ICB7Cj4+PiAgCXN0cnVjdCB0ZWdyYV9kZXZmcmVxICp0ZWdyYTsK
Pj4+ICAJc3RydWN0IHRlZ3JhX21jICptYzsKPj4+IC0JdW5zaWduZWQgbG9uZyBtYXhfcmF0ZTsK
Pj4+IC0JdW5zaWduZWQgbG9uZyByYXRlOwo+Pj4gKwl1bnNpZ25lZCBpbnQgaTsKPj4+ICAJaW50
IGVycjsKPj4+ICAKPj4+ICAJbWMgPSB0ZWdyYV9nZXRfbWVtb3J5X2NvbnRyb2xsZXIoKTsKPj4+
IEBAIC0xNTEsMTIgKzE1MCwxNyBAQCBzdGF0aWMgaW50IHRlZ3JhX2RldmZyZXFfcHJvYmUoc3Ry
dWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikKPj4+ICAKPj4+ICAJdGVncmEtPnJlZ3MgPSBtYy0+
cmVnczsKPj4+ICAKPj4+IC0JbWF4X3JhdGUgPSBjbGtfcm91bmRfcmF0ZSh0ZWdyYS0+ZW1jX2Ns
b2NrLCBVTE9OR19NQVgpOwo+Pj4gLQo+Pj4gLQlmb3IgKHJhdGUgPSAwOyByYXRlIDw9IG1heF9y
YXRlOyByYXRlKyspIHsKPj4+IC0JCXJhdGUgPSBjbGtfcm91bmRfcmF0ZSh0ZWdyYS0+ZW1jX2Ns
b2NrLCByYXRlKTsKPj4+ICsJaWYgKCFtYy0+bnVtX3RpbWluZ3MpIHsKPj4KPj4gQ291bGQgeW91
IGV4cGxhaW4gd2hhdCBpcyBtZWFuaW5nIG9mICdudW1fdGltaW5nPwo+IAo+IFRoZSBudW1fdGlt
aW5ncyBpcyB0aGUgbnVtYmVyIG9mIG1lbW9yeSB0aW1pbmdzIGRlZmluZWQgaW4gYQo+IGRldmlj
ZS10cmVlLiBPbmUgdGltaW5nIGNvbmZpZ3VyYXRpb24gcGVyIG1lbW9yeSBjbG9jayByYXRlLgoK
T0suIEkgdW5kZXJzdGFuZC4KCj4gCj4+IEFsc28sIHdoeSBhZGQgdGhlIG9wcCBlbnRyeSBpbiBj
YXNlIG9mIG1jLT5udW1fdGltaW5ncyBpcyB6ZXJvPwo+IAo+IFRpbWluZ3MgbWF5IGJlIG5vdCBk
ZWZpbmVkIGluIHNvbWUgZGV2aWNlLXRyZWVzIGF0IGFsbCBhbmQgaW4gdGhpcyBjYXNlCj4gbWVt
b3J5IGFsd2F5cyBydW5uaW5nIG9uIGEgZml4ZWQgY2xvY2sgcmF0ZS4KCllvdSBtZWFuIHRoYXQg
J3RpbWluZ3MnIGluZm9ybWF0aW9uIGlzIG9wdGlvbmFsPwoKPiAKPiBUaGUgZGV2ZnJlcSBkcml2
ZXIgd29uJ3QgYmUgcHJhY3RpY2FsbHkgdXNlZnVsIGlmIG1jLT5udW1fdGltaW5ncyBpcwo+IHpl
cm8gc2luY2UgbWVtb3J5IGZyZXF1ZW5jeSBjYW4ndCBiZSBjaGFuZ2VkLCBidXQgYW55d2F5cyB3
ZSdkIHdhbnQgdG8KPiBsb2FkIHRoZSBkZXZmcmVxIGRyaXZlciBpbiBvcmRlciB0byBwcmV2ZW50
IGNvbmZ1c2lvbiBhYm91dCB3aHkgaXQncyBub3QKPiBsb2FkZWQuCj4gCj4gRm9yIGV4YW1wbGUs
IHlvdSBtYXkgYXNrIHNvbWVib2R5IHRvIHNob3cgY29udGVudHMgb2YKPiAvc3lzL2NsYXNzL2Rl
dmZyZXEvdGVncmEyMC1kZXZmcmVxL3RyYW5zX3N0YXQgYW5kIHRoZSBwZXJzb24gc2F5cyB0byB5
b3UKPiB0aGF0IHRoaXMgZmlsZSBkb2Vzbid0IGV4aXN0LCBub3cgeW91J2xsIGhhdmUgdG8gZmln
dXJlIG91dCB3aGF0Cj4gaGFwcGVuZWQgdG8gdGhlIGRldmZyZXEgZHJpdmVyLgoKSSB1bmRlcnN0
YW5kIHdoeSBhZGQgT1BQIGVudHJ5IHBvaW50IHdoZW4gdGltaW5nIGlzIG5vdCBkZWZpbmVkIG9u
IERULgpCdXQsIGFjdHVhbGx5LCBJIHRoaW5rIHRoYXQgeW91IGJldHRlciB0byBjaGFuZ2UgJ3Rp
bWluZ3MnIGluZm8gaXMgbWFuZGF0b3J5Cmluc3RlYWQgb2Ygb3B0aW9uYWwuIEJlY2F1c2UgdGhl
IGRldmZyZXEgZHJpdmVyIGlzIGZvciBEVkZTCmFuZCB0aGUgZHJpdmVyIHN1cHBvcnRpbmcgRFZG
UyBoYXZlIHRvIGhhdmUgdGhlIGZyZXF1ZW5jeSBpbmZvcm1hdGlvbgpsaWtlIE9QUC4KCk9yLCAK
SWYgeW91IHdhbnQgdG8ga2VlcCAndGltaW5nJyBpcyBvcHRpb25hbCBvbiBEVCwKSSByZWNvbW1l
bmQgdGhhdCB5b3UgYWRkIG9uZSB0aW1pbmcgZGF0YSB0byB0ZWdyYSBtYyBkcml2ZXIKd2hlbiBE
VCBkb2Vzbid0IGluY2x1ZGUgdGhlIGFueSB0aW1pbmcgaW5mb3JtYXRpb24KSSB0aGluayB0aGF0
IGlzIGl0IG1vcmUgY2xlYXIuCgotLSAKQmVzdCBSZWdhcmRzLApDaGFud29vIENob2kKU2Ftc3Vu
ZyBFbGVjdHJvbmljcwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2
ZWwK
