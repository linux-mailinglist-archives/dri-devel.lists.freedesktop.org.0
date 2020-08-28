Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D9C9725553C
	for <lists+dri-devel@lfdr.de>; Fri, 28 Aug 2020 09:29:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E2B46E4F9;
	Fri, 28 Aug 2020 07:29:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout4.samsung.com (mailout4.samsung.com [203.254.224.34])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 21F0C6E05F
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Aug 2020 01:35:31 +0000 (UTC)
Received: from epcas1p3.samsung.com (unknown [182.195.41.47])
 by mailout4.samsung.com (KnoxPortal) with ESMTP id
 20200828013529epoutp0498903065a6cb03ab936fee2554e26a0e~vSrQKDZhg1130411304epoutp04w
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Aug 2020 01:35:29 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com
 20200828013529epoutp0498903065a6cb03ab936fee2554e26a0e~vSrQKDZhg1130411304epoutp04w
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1598578529;
 bh=mfZS9t3mm4EcSIakzUimqKpFxitij5KZmxwTrUCgxhc=;
 h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
 b=u7auesJfbgAw2m+bpWAjU7aJ0vNeEXVLoQODJgIbfdZYitK/9443Vm9mvSgHDpS60
 Tp0jhxn1pZayhKfqPXBXIP8hDz91LZkusCei/90IVBw4CidlBjnRTLtQISPwTWuh49
 6TkIQDX/4v6le91qnI3r+yrFn5VOXyrpuQc3us5g=
Received: from epsnrtp1.localdomain (unknown [182.195.42.162]) by
 epcas1p4.samsung.com (KnoxPortal) with ESMTP id
 20200828013529epcas1p47231fba0fb8e3486082f079f17624411~vSrPXxycJ3008030080epcas1p4J;
 Fri, 28 Aug 2020 01:35:29 +0000 (GMT)
Received: from epsmges1p3.samsung.com (unknown [182.195.40.153]) by
 epsnrtp1.localdomain (Postfix) with ESMTP id 4Bd2Gh6nN0zMqYmD; Fri, 28 Aug
 2020 01:35:24 +0000 (GMT)
Received: from epcas1p2.samsung.com ( [182.195.41.46]) by
 epsmges1p3.samsung.com (Symantec Messaging Gateway) with SMTP id
 4C.BE.29173.85F584F5; Fri, 28 Aug 2020 10:35:20 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
 epcas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20200828013520epcas1p2bc32bd495a6427a36bc7e016dea98e27~vSrHIUnUo0309303093epcas1p2z;
 Fri, 28 Aug 2020 01:35:20 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
 epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20200828013520epsmtrp1aae0b48885e40c8b76c3a48da1087bfe~vSrHHRFUJ0208202082epsmtrp1S;
 Fri, 28 Aug 2020 01:35:20 +0000 (GMT)
X-AuditID: b6c32a37-9b7ff700000071f5-02-5f485f584a00
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
 epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
 EE.F2.08382.75F584F5; Fri, 28 Aug 2020 10:35:20 +0900 (KST)
Received: from [10.113.221.102] (unknown [10.113.221.102]) by
 epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20200828013519epsmtip2cb4c7fb54f955a09e82cac16c65c1415~vSrG0NQaN0625906259epsmtip2I;
 Fri, 28 Aug 2020 01:35:19 +0000 (GMT)
Subject: Re: [PATCH v5 13/36] PM / devfreq: tegra30: Use MC timings for
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
Message-ID: <2a255211-5426-d78f-d266-cdb958f4c658@samsung.com>
Date: Fri, 28 Aug 2020 10:47:46 +0900
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:59.0) Gecko/20100101
 Thunderbird/59.0
MIME-Version: 1.0
In-Reply-To: <1de8aa41-8001-cf46-026c-b00f8df0b9a3@gmail.com>
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrBJsWRmVeSWpSXmKPExsWy7bCmnm5EvEe8QdsSI4t3n56yWsw/co7V
 YvXHx4wWV76+Z7OYvncTm0XLrEUsFmeb3rBbXN41h83ic+8RRovOL7PYLC6ecrW43biCzWLS
 2qmMFq17j7Bb/Lu2kcXi5655LA4CHu9vtLJ77Jx1l93j0rk/zB6bVnWyedy5tofN4373cSaP
 3uZ3bB59W1YxenzeJBfAGZVtk5GamJJapJCal5yfkpmXbqvkHRzvHG9qZmCoa2hpYa6kkJeY
 m2qr5OIToOuWmQP0hpJCWWJOKVAoILG4WEnfzqYov7QkVSEjv7jEVim1ICWnwLJArzgxt7g0
 L10vOT/XytDAwMgUqDAhO2Nx4ySmgvN8FR/udrE2ML7i7mLk5JAQMJFoe7CftYuRi0NIYAej
 xMMt/UwgCSGBT4wSc7ZoQCS+MUq8/tPBDNNxccN0RojEXkaJ9ncXmSGc94wSTQv/sINUCQvE
 SJyZt5EdJCEicIRZYnXncUaQBLPADEaJO3uUQWw2AS2J/S9usIHY/AKKEld/PAar4RWwk5j8
 4xtYnEVAVeLa28tgN4kKhEmc3NYCVSMocXLmExYQm1PAVmLd/jUsEPPFJW49mc8EYctLNG+d
 DXadhMB/Dompp38DNXMAOS4SGz87Q7wjLPHq+BZ2CFtK4mV/G5RdLbHy5BE2iN4ORokt+y+w
 QiSMJfYvncwEModZQFNi/S59iLCixM7fc6F+5JN497WHFWIVr0RHmxBEibLE5Qd3mSBsSYnF
 7Z1sExiVZiH5ZhaSD2Yh+WAWwrIFjCyrGMVSC4pz01OLDQuMkWN7EyM4iWuZ72Cc9vaD3iFG
 Jg7GQ4wSHMxKIryvj7rHC/GmJFZWpRblxxeV5qQWH2I0BYbvRGYp0eR8YB7JK4k3NDUyNja2
 MDE0MzU0VBLnfXhLIV5IID2xJDU7NbUgtQimj4mDU6qByYib2++EtvOLZX+/Vcxcq7R3blRs
 I2vBnh2Zq6wFVLoSQ5O/CU+dsePmukmeb0NXrZQJirqRn1NouVb91d8ff4Imq9xgvTulzmLR
 BEHlHbJvL7VZr4x737P4+eNglcSPAd8WMDaqGR05/3d1G/8/foZGl2T7+Xq1SbIzg00nqUgu
 4nqeu/BipNfVCY92REqvnZR2UjOt8q7JXZZn/7fJMxREvln26s2WaKUEv0lme57KpHzOTir1
 VCmsKZ0jd93GYMHVfblicmGGcmdSJk9OTdYJC+WV0J6TxZgWIdJ1bXa4q/7Ut0pzu9ND77L4
 9u3Z5J2hImw46Yqhm8MEqcOma/gqWyU3M60wrzeK+HNIiaU4I9FQi7moOBEAfmno22sEAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrKIsWRmVeSWpSXmKPExsWy7bCSvG5EvEe8wZlOJot3n56yWsw/co7V
 YvXHx4wWV76+Z7OYvncTm0XLrEUsFmeb3rBbXN41h83ic+8RRovOL7PYLC6ecrW43biCzWLS
 2qmMFq17j7Bb/Lu2kcXi5655LA4CHu9vtLJ77Jx1l93j0rk/zB6bVnWyedy5tofN4373cSaP
 3uZ3bB59W1YxenzeJBfAGcVlk5Kak1mWWqRvl8CVsbhxElPBeb6KD3e7WBsYX3F3MXJySAiY
 SFzcMJ2xi5GLQ0hgN6PE9u3bmSESkhLTLh4FsjmAbGGJw4eLIWreMkpM2PkIrEZYIEbizLyN
 7CAJEYFjzBKbTp9mAnGYBWYwSvzZAJEREpjDJHF0zjw2kBY2AS2J/S9ugNn8AooSV388ZgSx
 eQXsJCb/+AYWZxFQlbj29jITiC0qECaxc8ljJogaQYmTM5+wgNicArYS6/avAbOZBdQl/sy7
 xAxhi0vcejKfCcKWl2jeOpt5AqPwLCTts5C0zELSMgtJywJGllWMkqkFxbnpucWGBYZ5qeV6
 xYm5xaV56XrJ+bmbGMExraW5g3H7qg96hxiZOBgPMUpwMCuJ8L4+6h4vxJuSWFmVWpQfX1Sa
 k1p8iFGag0VJnPdG4cI4IYH0xJLU7NTUgtQimCwTB6dUA1Ob1I9zPnO5j8zS4d637czuA4wW
 5XOKmsoOZL5omCt+7cvyRcFzL5QavJoSuPdN3zn3rfl+zRKnGDh2xrk5lwtm/5itoSE26dJh
 xVLZ/kVHF3Vf2yehcTF93ZNpDblPr642Wv/g+PZHtxoD2atnJlhZzvEO/BUsm7rSgttBYVWn
 Y5tXfKPb+6tukrsqD1dttXmoUeBXMlFKdFPgvdbv6TN01wbdmVK5pUHPoXj3zGV3G/eukb/6
 TD/6jv7JX/rGD761TH4nfT+Pf0nN9MnCTEs7mF4Gnt6gvJHn6dzIyU47LzDI/uBtEFhrnL49
 b8VmWVvNY5/PtbZxvhRm1efxNP6tz1Qf9ftOu0RpSJuScbQSS3FGoqEWc1FxIgB9F1inWAMA
 AA==
X-CMS-MailID: 20200828013520epcas1p2bc32bd495a6427a36bc7e016dea98e27
X-Msg-Generator: CA
X-Sendblock-Type: SVC_REQ_APPROVE
CMS-TYPE: 101P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20200814000944epcas1p3dfd0104c5fa640695dfcd4949f6b1818
References: <20200814000621.8415-1-digetx@gmail.com>
 <CGME20200814000944epcas1p3dfd0104c5fa640695dfcd4949f6b1818@epcas1p3.samsung.com>
 <20200814000621.8415-14-digetx@gmail.com>
 <1b0d75fe-79af-70eb-8450-999a3bc72bac@samsung.com>
 <1de8aa41-8001-cf46-026c-b00f8df0b9a3@gmail.com>
X-Mailman-Approved-At: Fri, 28 Aug 2020 07:29:10 +0000
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
Cc: linux-tegra@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-pm@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGksCgpPbiA4LzE1LzIwIDE6NDcgQU0sIERtaXRyeSBPc2lwZW5rbyB3cm90ZToKPiAxNC4wOC4y
MDIwIDA1OjAyLCBDaGFud29vIENob2kg0L/QuNGI0LXRgjoKPj4gSGkgRG1pdHJ5LAo+Pgo+PiBJ
IGFkZCB0aGUgbWlub3IgY29tbWVudC4gRXhjZXB0IG9mIHNvbWUgY29tbWVudHMsIGl0IGxvb2tz
IGdvb2QgdG8gbWUuCj4gCj4gSGVsbG8sIENoYW53b28hIFRoYW5rIHlvdSBmb3IgdGhlIHJldmll
dyEKPiAKPiAuLi4KPj4+ICtzdHJ1Y3QgdGVncmFfZGV2ZnJlcV9zb2NfZGF0YSB7Cj4+PiArCWNv
bnN0IGNoYXIgKm1jX2NvbXBhdGlibGU7Cj4+PiArfTsKPj4+ICsKPj4+ICtzdGF0aWMgY29uc3Qg
c3RydWN0IHRlZ3JhX2RldmZyZXFfc29jX2RhdGEgdGVncmEzMF9zb2MgPSB7Cj4+PiArCS5tY19j
b21wYXRpYmxlID0gIm52aWRpYSx0ZWdyYTMwLW1jIiwKPj4+ICt9Owo+Pj4gKwo+Pj4gK3N0YXRp
YyBjb25zdCBzdHJ1Y3QgdGVncmFfZGV2ZnJlcV9zb2NfZGF0YSB0ZWdyYTEyNF9zb2MgPSB7Cj4+
PiArCS5tY19jb21wYXRpYmxlID0gIm52aWRpYSx0ZWdyYTEyNC1tYyIsCj4+PiArfTsKPiAuCj4+
PiArCXNvY19kYXRhID0gb2ZfZGV2aWNlX2dldF9tYXRjaF9kYXRhKCZwZGV2LT5kZXYpOwo+Pgo+
PiBJIHRoaW5rIHRoYXQgYmV0dGVyIHRvIGNoZWNrIHdoZXRoZXIgJ3NvY19kYXRhJyBpcyBub3Qg
TlVMTC4KPiAKPiBJdCdzIGEgcXVpdGUgY29tbW9uIG1pc2NvbmNlcHRpb24gYW1vbmcga2VybmVs
IGRldmVsb3BlcnMgdGhhdAo+IG9mX2RldmljZV9nZXRfbWF0Y2hfZGF0YSgpIG1heSAiYWNjaWRl
bnRhbGx5IiByZXR1cm4gTlVMTCwgYnV0IGl0Cj4gY291bGRuJ3QgaWYgZXZlcnkgZHJpdmVyJ3Mg
b2ZfbWF0Y2hbXSBlbnRyeSBoYXMgYSBub24tTlVMTCAuZGF0YSBmaWVsZAo+IGFuZCBiZWNhdXNl
IHRoZSBPRi1tYXRjaGluZyBhbHJlYWR5IGhhcHBlbmVkIGF0IHRoZSBkcml2ZXIncyBwcm9iZS10
aW1lCj4gWzFdLCB3aGljaCBpcyB0aGUgY2FzZSBvZiB0aGlzIGRyaXZlci4KPiAKPiBbMV0gaHR0
cHM6Ly9lbGl4aXIuYm9vdGxpbi5jb20vbGludXgvdjUuOC9zb3VyY2UvZHJpdmVycy9vZi9kZXZp
Y2UuYyNMMTg5Cj4gCj4gSGVuY2UgdGhlIE5VTEwtY2hlY2tpbmcgaXMgdW5uZWNlc3NhcnkuCj4g
Cj4gV2hlbiBJIGZpcnN0IGVuY291bnRlcmVkIHRoZSBvZl9kZXZpY2VfZ2V0X21hdGNoX2RhdGEo
KSwgSSB3YXMgYWxzbwo+IHRoaW5raW5nIHRoYXQgYWRkaW5nIHRoZSBOVUxMLWNoZWNrcyBpcyBh
IGdvb2QgaWRlYSwgYnV0IGxhdGVyIG9uCj4gc29tZWJvZHkgcG9pbnRlZCBvdXQgdG8gbWUgKG1h
eWJlIFRoaWVycnkpIHRoYXQgaXQncyB1bm5lY2Vzc2FyeSB0byBkby4KCk9LLiBUaGFua3MuCgo+
IAo+Pj4gKwo+Pj4gKwltYyA9IHRlZ3JhX2dldF9tZW1vcnlfY29udHJvbGxlcihzb2NfZGF0YS0+
bWNfY29tcGF0aWJsZSk7Cj4+PiArCWlmIChJU19FUlIobWMpKQo+Pj4gKwkJcmV0dXJuIFBUUl9F
UlIobWMpOwo+Pgo+PiBZb3UgYmV0dGVyIHRvIGFkZCBlcnJvciBsb2cuCj4gCj4gSW4gcHJhY3Rp
Y2Ugd2Ugc2hvdWxkIGdldCBvbmx5IC1FUFJPQkVfREVGRVIgaGVyZSBldmVyLiBJJ2xsIGNvbnNp
ZGVyCj4gYWRkaW5nIHRoZSBtZXNzYWdlIGluIHRoZSBuZXh0IHJldmlzaW9uLCBhdCBsZWFzdCBq
dXN0IGZvciBjb25zaXN0ZW5jeS4KCkluIG9yZGVyIHRvIGhhbmRsZSAtRVBST0JFX0RFRkVSLCBy
ZWNvbW1lbmQgdGhlIHVzaW5nIG9mIGRldl9lcnJfcHJvYmUoKS4KCihzbmlwKQoKLS0gCkJlc3Qg
UmVnYXJkcywKQ2hhbndvbyBDaG9pClNhbXN1bmcgRWxlY3Ryb25pY3MKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApk
cmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
