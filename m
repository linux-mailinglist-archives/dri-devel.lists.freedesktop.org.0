Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A1EFA28C91F
	for <lists+dri-devel@lfdr.de>; Tue, 13 Oct 2020 09:17:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF62F6E8A7;
	Tue, 13 Oct 2020 07:17:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 968D06E12D
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Oct 2020 14:03:43 +0000 (UTC)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 09CE17Ne018109; Mon, 12 Oct 2020 10:03:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=9XZVPCzxR7io9Yrm5bz2pZhnBT0B6bmEzvhzPr5tu+k=;
 b=lM6Lq1hxDAVbJy/T/9DGSzvJGB/1tT6cuVQtMb6COlj6rIfR/a9hYwvFChI1USLqQirz
 fNaHBlYt4yxmdR2LZk39peXNUpw0iBDbS2UZObEvi5gEjbJqs4LA7VRt3BsrkBf5Pc4s
 FqlfeBb7+NH70qz1nKV2Wv+mO3iv3xvbzNrv1CT6KHgNV4sBVrNvkeS98IfstwwJ2okx
 stPGOZeyzURa8zgX/NVPdt35+W3+sskKlYR2sugwCuMGF1lj3qQdUtd3tHQRsM5sNWiu
 UHWKGlTA3uwkcS2SFZbM7C6UEDpnKqh4O4KG8y6hutCho2WBIMuPOydex3vIfRDRvSz9 WA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 344qdaahcr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 12 Oct 2020 10:03:35 -0400
Received: from m0098420.ppops.net (m0098420.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 09CE1ukg021820;
 Mon, 12 Oct 2020 10:03:34 -0400
Received: from ppma06fra.de.ibm.com (48.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.72])
 by mx0b-001b2d01.pphosted.com with ESMTP id 344qdaahb8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 12 Oct 2020 10:03:34 -0400
Received: from pps.filterd (ppma06fra.de.ibm.com [127.0.0.1])
 by ppma06fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 09CE3Wk4004006;
 Mon, 12 Oct 2020 14:03:32 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma06fra.de.ibm.com with ESMTP id 34347h12ug-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 12 Oct 2020 14:03:32 +0000
Received: from d06av24.portsmouth.uk.ibm.com (d06av24.portsmouth.uk.ibm.com
 [9.149.105.60])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 09CE3TKb28115244
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 12 Oct 2020 14:03:29 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id BC61A42045;
 Mon, 12 Oct 2020 14:03:29 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id ECCA342042;
 Mon, 12 Oct 2020 14:03:28 +0000 (GMT)
Received: from [9.145.9.103] (unknown [9.145.9.103])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon, 12 Oct 2020 14:03:28 +0000 (GMT)
Subject: Re: [PATCH v2 08/17] s390/pci: Remove races against pte updates
To: Daniel Vetter <daniel.vetter@ffwll.ch>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>
References: <20201009075934.3509076-1-daniel.vetter@ffwll.ch>
 <20201009075934.3509076-9-daniel.vetter@ffwll.ch>
From: Niklas Schnelle <schnelle@linux.ibm.com>
Message-ID: <6deb08dd-46f3-bf26-5362-fdc696f6fd74@linux.ibm.com>
Date: Mon, 12 Oct 2020 16:03:28 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20201009075934.3509076-9-daniel.vetter@ffwll.ch>
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-10-12_09:2020-10-12,
 2020-10-12 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 suspectscore=0 bulkscore=0 impostorscore=0 malwarescore=0 phishscore=0
 adultscore=0 mlxlogscore=999 spamscore=0 clxscore=1011 priorityscore=1501
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2010120109
X-Mailman-Approved-At: Tue, 13 Oct 2020 07:16:53 +0000
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
Cc: linux-s390@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 Jan Kara <jack@suse.cz>, Kees Cook <keescook@chromium.org>,
 kvm@vger.kernel.org, Jason Gunthorpe <jgg@ziepe.ca>,
 John Hubbard <jhubbard@nvidia.com>, Andrew Morton <akpm@linux-foundation.org>,
 linux-mm@kvack.org, =?UTF-8?B?SsOpcsO0bWUgR2xpc3Nl?= <jglisse@redhat.com>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Gerald Schaefer <gerald.schaefer@linux.ibm.com>,
 Dan Williams <dan.j.williams@intel.com>, linux-arm-kernel@lists.infradead.org,
 linux-media@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgRGFuaWVsLAoKZnJlc2hseSBiYWNrIGZyb20gbXkgdmFjYXRpb24gSSd2ZSBqdXN0IHRha2Vu
IGEgbG9vayBhdCB5b3VyIHBhdGNoLgpGaXJzdCB0aGFua3MgZm9yIHRoaXMgZml4IGFuZCB0aGUg
ZGV0YWlsZWQgY29tbWl0IGRlc2NyaXB0aW9uLgpEZWZpbml0ZWx5IG1ha2VzIHNlbnNlIHRvIGZp
eCB0aGlzIGFuZCB5b3UgY2FuIGFkZCBteQoKQWNrZWQtYnk6IE5pa2xhcyBTY2huZWxsZSA8c2No
bmVsbGVAbGludXguaWJtLmNvbT4KCkNvbnRlbnQgd2lzZSBpdCBhbGwgbG9va3Mgc2FuZSBhbmQg
Y2xlYXIgYW5kIHNpbmNlIEdlcmFsZCBkaWQgdGhlIHRlc3RpbmcsCkkgd291bGQgaGF2ZSBhcHBs
aWVkIGl0IHRvIG91ciB0cmVlIGFscmVhZHksIGJ1dCBJIGdvdCBzb21lIHRyaXZpYWwKY2hlY2tw
YXRjaCB2aW9sYXRpb25zIHRoYXQgcHJvYmFibHkgYXBwbHkgdG8gdGhlIHdob2xlIHNlcmllcy4K
SSd2ZSBjb21tZW50ZWQgdGhlbSBpbmxpbmUgYmVsb3cuCklmIHlvdSBjb25maXJtIHRoZXJlIEkg
Y2FuIGRvIHRoZSBmaXh1cHMgd2hlbiBhcHBseWluZyBvciB5b3UgY2FuIHJlc2VuZC4KCk9uIDEw
LzkvMjAgOTo1OSBBTSwgRGFuaWVsIFZldHRlciB3cm90ZToKPiBXYXkgYmFjayBpdCB3YXMgYSBy
ZWFzb25hYmxlIGFzc3VtcHRpb25zIHRoYXQgaW9tZW0gbWFwcGluZ3MgbmV2ZXIKPiBjaGFuZ2Ug
dGhlIHBmbiByYW5nZSB0aGV5IHBvaW50IGF0LiBCdXQgdGhpcyBoYXMgY2hhbmdlZDoKPiAKPiAt
IGdwdSBkcml2ZXJzIGR5bmFtaWNhbGx5IG1hbmFnZSB0aGVpciBtZW1vcnkgbm93YWRheXMsIGlu
dmFsaWRhdGluZwo+IHB0ZXMgd2l0aCB1bm1hcF9tYXBwaW5nX3JhbmdlIHdoZW4gYnVmZmVycyBn
ZXQgbW92ZWQKPiAKPiAtIGNvbnRpZ3VvdXMgZG1hIGFsbG9jYXRpb25zIGhhdmUgbW92ZWQgZnJv
bSBkZWRpY2F0ZWQgY2FydmV0b3V0cyB0bwo+IGNtYSByZWdpb25zLiBUaGlzIG1lYW5zIGlmIHdl
IG1pc3MgdGhlIHVubWFwIHRoZSBwZm4gbWlnaHQgY29udGFpbgo+IHBhZ2VjYWNoZSBvciBhbm9u
IG1lbW9yeSAod2VsbCBhbnl0aGluZyBhbGxvY2F0ZWQgd2l0aCBHRlBfTU9WRUFCTEUpCj4gCj4g
LSBldmVuIC9kZXYvbWVtIG5vdyBpbnZhbGlkYXRlcyBtYXBwaW5ncyB3aGVuIHRoZSBrZXJuZWwg
cmVxdWVzdHMgdGhhdAo+IGlvbWVtIHJlZ2lvbiB3aGVuIENPTkZJR19JT19TVFJJQ1RfREVWTUVN
IGlzIHNldCwgc2VlIDMyMzRhYzY2NGE4NwoKVGhlIGFib3ZlIGNvbW1pdCBtZW50aW9uIHNob3Vs
ZCB1c2UgdGhlIGZvcm1hdAonY29tbWl0IDMyMzRhYzY2NGE4NyAoIi9kZXYvbWVtOiBSZXZva2Ug
bWFwcGluZ3Mgd2hlbiBhIGRyaXZlciBjbGFpbXMgdGhlIHJlZ2lvbiIpJwpvdGhlcndpc2UgdGhp
cyByZXN1bHRzIGluIGEgY2hlY2twYXRjaCBFUlJPUi4KCj4gKCIvZGV2L21lbTogUmV2b2tlIG1h
cHBpbmdzIHdoZW4gYSBkcml2ZXIgY2xhaW1zIHRoZSByZWdpb24iKQo+IAo+IEFjY2Vzc2luZyBw
Zm5zIG9idGFpbmVkIGZyb20gcHRlcyB3aXRob3V0IGhvbGRpbmcgYWxsIHRoZSBsb2NrcyBpcwo+
IHRoZXJlZm9yZSBubyBsb25nZXIgYSBnb29kIGlkZWEuIEZpeCB0aGlzLgo+IAo+IFNpbmNlIHpw
Y2lfbWVtY3B5X2Zyb218dG9pbyBzZWVtcyB0byBub3QgZG8gYW55dGhpbmcgbmVmYXJpb3VzIHdp
dGgKPiBsb2NrcyB3ZSBqdXN0IG5lZWQgdG8gb3BlbiBjb2RlIGdldF9wZm4gYW5kIGZvbGxvd19w
Zm4gYW5kIG1ha2Ugc3VyZQo+IHdlIGRyb3AgdGhlIGxvY2tzIG9ubHkgYWZ0ZXIgd2UndmUgZG9u
ZS4gVGhlIHdyaXRlIGZ1bmN0aW9uIGFsc28gbmVlZHMKCmp1c3QgYSB0eXBvIGJ1dCBqdXN0IHNh
dyBpdCAid2UncmUiIGluc3RlYWQgb2YgIndlJ3ZlIgoKPiB0aGUgY29weV9mcm9tX3VzZXIgbW92
ZSwgc2luY2Ugd2UgY2FuJ3QgdGFrZSB1c2Vyc3BhY2UgZmF1bHRzIHdoaWxlCj4gaG9sZGluZyB0
aGUgbW1hcCBzZW0uCj4gCj4gUmV2aWV3ZWQtYnk6IEdlcmFsZCBTY2hhZWZlciA8Z2VyYWxkLnNj
aGFlZmVyQGxpbnV4LmlibS5jb20+Cj4gCk5vIGVtcHR5IGxpbmUgYWZ0ZXIgdGhlIFJldmllZC1i
eSB0YWcuCgo+IFNpZ25lZC1vZmYtYnk6IERhbmllbCBWZXR0ZXIgPGRhbmllbC52ZXR0ZXJAaW50
ZWwuY29tPgoKWW91ciBTaWduZWQtb2ZmLWJ5IG1haWwgYWRkcmVzcyBkb2VzIG5vdCBtYXRjaCB0
aGUgb25lIHlvdSdyZSBzZW5kaW5nIGZyb20sCnRoaXMgeWllbGRzIGEgY2hlY2twYXRjaCB3YXJu
aW5nIHdoZW4gdXNpbmcgZ2l0IGFtIHdpdGggeW91ciBtYWlsLgpUaGlzIGlzIHByb2JhYmx5IGp1
c3QgYSBzaWxseSBtaXNjb25maWd1cmF0aW9uIGJ1dCBzaW5jZSBTaWduZWQtb2ZmcwphcmUgc2ln
bmF0dXJlcyBzaG91bGQgSSBjaGFuZ2UgdGhpcyB0byAKIkRhbmllbCBWZXR0ZXIgPGRhbmllbC52
ZXR0ZXJAZmZ3bGwuY2g+IiB3aGljaCBpcyB0aGUgb25lIHlvdSdyZQpzZW5kaW5nIGZyb20gYW5k
IGFsc28gaW4gdGhlIE1BSU5UQUlORVJTIGZpbGU/CgoKPiBDYzogSmFzb24gR3VudGhvcnBlIDxq
Z2dAemllcGUuY2E+Cj4gQ2M6IERhbiBXaWxsaWFtcyA8ZGFuLmoud2lsbGlhbXNAaW50ZWwuY29t
Pgo+IENjOiBLZWVzIENvb2sgPGtlZXNjb29rQGNocm9taXVtLm9yZz4KPiBDYzogQW5kcmV3IE1v
cnRvbiA8YWtwbUBsaW51eC1mb3VuZGF0aW9uLm9yZz4KPiBDYzogSm9obiBIdWJiYXJkIDxqaHVi
YmFyZEBudmlkaWEuY29tPgo+IENjOiBKw6lyw7RtZSBHbGlzc2UgPGpnbGlzc2VAcmVkaGF0LmNv
bT4KPiBDYzogSmFuIEthcmEgPGphY2tAc3VzZS5jej4KPiBDYzogRGFuIFdpbGxpYW1zIDxkYW4u
ai53aWxsaWFtc0BpbnRlbC5jb20+CgpUaGUgYWJvdmUgQ2M6IGxpbmUgZm9yIERhbiBXaWxsaWFt
cyBpcyBhIGR1cGxpY2F0ZQoKPiBDYzogbGludXgtbW1Aa3ZhY2sub3JnCj4gQ2M6IGxpbnV4LWFy
bS1rZXJuZWxAbGlzdHMuaW5mcmFkZWFkLm9yZwo+IENjOiBsaW51eC1zYW1zdW5nLXNvY0B2Z2Vy
Lmtlcm5lbC5vcmcKPiBDYzogbGludXgtbWVkaWFAdmdlci5rZXJuZWwub3JnCj4gQ2M6IE5pa2xh
cyBTY2huZWxsZSA8c2NobmVsbGVAbGludXguaWJtLmNvbT4KPiBDYzogR2VyYWxkIFNjaGFlZmVy
IDxnZXJhbGQuc2NoYWVmZXJAbGludXguaWJtLmNvbT4KPiBDYzogbGludXgtczM5MEB2Z2VyLmtl
cm5lbC5vcmcKPiAtLQo+IHYyOiBNb3ZlIFZNX0lPIHwgVk1fUEZOTUFQIGNoZWNrcyBhcm91bmQg
c28gdGhleSBrZWVwIHJldHVybmluZyBFSU5WQUwKPiBsaWtlIGJlZm9yZSAoR2VyYXJkKQoKSSB0
aGluayB0aGUgYWJvdmUgc2hvdWxkIGdvIGJlZm9yZSB0aGUgQ0MvU2lnbmVkLW9mZi9SZXZpZXdl
diBibG9jay4KCj4gLS0tCj4gIGFyY2gvczM5MC9wY2kvcGNpX21taW8uYyB8IDk4ICsrKysrKysr
KysrKysrKysrKysrKysrLS0tLS0tLS0tLS0tLS0tLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDU3IGlu
c2VydGlvbnMoKyksIDQxIGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9hcmNoL3MzOTAv
cGNpL3BjaV9tbWlvLmMgYi9hcmNoL3MzOTAvcGNpL3BjaV9tbWlvLmMKPiBpbmRleCA0MDFjZjY3
MGEyNDMuLjFhNmFkYmM2OGVlOCAxMDA2NDQKPiAtLS0gYS9hcmNoL3MzOTAvcGNpL3BjaV9tbWlv
LmMKPiArKysgYi9hcmNoL3MzOTAvcGNpL3BjaV9tbWlvLmMKPiBAQCAtMTE5LDMzICsxMTksMTUg
QEAgc3RhdGljIGlubGluZSBpbnQgX19tZW1jcHlfdG9pb19pbnVzZXIodm9pZCBfX2lvbWVtICpk
c3QsCj4gIAlyZXR1cm4gcmM7Cj4gIH0KPiAgCj4gLXN0YXRpYyBsb25nIGdldF9wZm4odW5zaWdu
ZWQgbG9uZyB1c2VyX2FkZHIsIHVuc2lnbmVkIGxvbmcgYWNjZXNzLAo+IC0JCSAgICB1bnNpZ25l
ZCBsb25nICpwZm4pCj4gLXsKPiAtCXN0cnVjdCB2bV9hcmVhX3N0cnVjdCAqdm1hOwo+IC0JbG9u
ZyByZXQ7Cj4gLQo+IC0JbW1hcF9yZWFkX2xvY2soY3VycmVudC0+bW0pOwo+IC0JcmV0ID0gLUVJ
TlZBTDsKPiAtCXZtYSA9IGZpbmRfdm1hKGN1cnJlbnQtPm1tLCB1c2VyX2FkZHIpOwo+IC0JaWYg
KCF2bWEpCj4gLQkJZ290byBvdXQ7Cj4gLQlyZXQgPSAtRUFDQ0VTOwo+IC0JaWYgKCEodm1hLT52
bV9mbGFncyAmIGFjY2VzcykpCj4gLQkJZ290byBvdXQ7Cj4gLQlyZXQgPSBmb2xsb3dfcGZuKHZt
YSwgdXNlcl9hZGRyLCBwZm4pOwo+IC1vdXQ6Cj4gLQltbWFwX3JlYWRfdW5sb2NrKGN1cnJlbnQt
Pm1tKTsKPiAtCXJldHVybiByZXQ7Cj4gLX0KPiAtCj4gIFNZU0NBTExfREVGSU5FMyhzMzkwX3Bj
aV9tbWlvX3dyaXRlLCB1bnNpZ25lZCBsb25nLCBtbWlvX2FkZHIsCj4gIAkJY29uc3Qgdm9pZCBf
X3VzZXIgKiwgdXNlcl9idWZmZXIsIHNpemVfdCwgbGVuZ3RoKQo+ICB7Cj4gIAl1OCBsb2NhbF9i
dWZbNjRdOwo+ICAJdm9pZCBfX2lvbWVtICppb19hZGRyOwo+ICAJdm9pZCAqYnVmOwo+IC0JdW5z
aWduZWQgbG9uZyBwZm47Cj4gKwlzdHJ1Y3Qgdm1fYXJlYV9zdHJ1Y3QgKnZtYTsKPiArCXB0ZV90
ICpwdGVwOwo+ICsJc3BpbmxvY2tfdCAqcHRsOwoKV2l0aCBjaGVja3BhdGNoLnBsIC0tc3RyaWN0
IHRoZSBhYm92ZSB5aWVsZHMgYSBjb21wbGFpbmVkCiJDSEVDSzogc3BpbmxvY2tfdCBkZWZpbml0
aW9uIHdpdGhvdXQgY29tbWVudCIgYnV0IEkgdGhpbmsKdGhhdCdzIHJlYWxseSBva2F5IHNpbmNl
IHlvdXIgY29tbWl0IGRlc2NyaXB0aW9uIGlzIHZlcnkgY2xlYXIuClNhbWUgb2luIGxpbmUgMjc3
LgoKLi4uIHNuaXAgLi4uCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1k
ZXZlbAo=
