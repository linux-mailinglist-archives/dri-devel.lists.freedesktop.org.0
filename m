Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BA4DA295919
	for <lists+dri-devel@lfdr.de>; Thu, 22 Oct 2020 09:28:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0CE676F3E2;
	Thu, 22 Oct 2020 07:27:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 778776E071
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Oct 2020 07:56:08 +0000 (UTC)
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 09L7X16V066044; Wed, 21 Oct 2020 03:56:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=lv0GwBldnmbZQXrayavRSYj6mxTJ2VfqBwFS3jQIG0c=;
 b=dUv4rTX/nfJgprmkjOdg/5aMNPuqyVb/enj5JDQw9bniaKU2bnh8sbD2Y8UOdBgiaPty
 9nnPLGBESYPJKwDsDB98+duUeED7csFciXP23ClQhtZhGQ1arOV75HXtSWrTF3bTdM/a
 R1XwxPsvjilXzGOOu7JJ8R95o65oCrwFvZte6e1Piz4lya872/SzZHEoZ7GsuMzH19al
 0rnOqou3KlBmxWNZKa7kH6GzbDoXTeeuyhHGV02HSvREsYslXl3QtEAplEW7VW7RnHaK
 AjKKmH/TdGcIYX/5UDQoDExVw2rwMpxPlF1iFwQjshxFzKC3jAP0OSpSWpJICUaYtCvb vg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 34agdm96ad-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 21 Oct 2020 03:56:03 -0400
Received: from m0098393.ppops.net (m0098393.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 09L7Y7ob070104;
 Wed, 21 Oct 2020 03:56:03 -0400
Received: from ppma06fra.de.ibm.com (48.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.72])
 by mx0a-001b2d01.pphosted.com with ESMTP id 34agdm969c-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 21 Oct 2020 03:56:03 -0400
Received: from pps.filterd (ppma06fra.de.ibm.com [127.0.0.1])
 by ppma06fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 09L7plEK007941;
 Wed, 21 Oct 2020 07:56:00 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma06fra.de.ibm.com with ESMTP id 347qvha47f-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 21 Oct 2020 07:56:00 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 09L7twAb32506250
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 21 Oct 2020 07:55:58 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4BD5DA4051;
 Wed, 21 Oct 2020 07:55:58 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 88367A4055;
 Wed, 21 Oct 2020 07:55:57 +0000 (GMT)
Received: from [9.145.178.173] (unknown [9.145.178.173])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed, 21 Oct 2020 07:55:57 +0000 (GMT)
Subject: Re: [PATCH v2 08/17] s390/pci: Remove races against pte updates
To: DRI Development <dri-devel@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>, kvm@vger.kernel.org,
 linux-mm@kvack.org, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, linux-media@vger.kernel.org,
 linux-s390@vger.kernel.org,
 Gerald Schaefer <gerald.schaefer@linux.ibm.com>,
 Daniel Vetter <daniel.vetter@intel.com>, Jason Gunthorpe <jgg@ziepe.ca>,
 Dan Williams <dan.j.williams@intel.com>, Kees Cook <keescook@chromium.org>,
 Andrew Morton <akpm@linux-foundation.org>, John Hubbard
 <jhubbard@nvidia.com>, =?UTF-8?B?SsOpcsO0bWUgR2xpc3Nl?=
 <jglisse@redhat.com>, Jan Kara <jack@suse.cz>
References: <20201009075934.3509076-1-daniel.vetter@ffwll.ch>
 <20201009075934.3509076-9-daniel.vetter@ffwll.ch>
 <6deb08dd-46f3-bf26-5362-fdc696f6fd74@linux.ibm.com>
 <20201012141906.GX438822@phenom.ffwll.local>
From: Niklas Schnelle <schnelle@linux.ibm.com>
Message-ID: <3594c115-541f-806a-ee33-e99a2d1d31e8@linux.ibm.com>
Date: Wed, 21 Oct 2020 09:55:57 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20201012141906.GX438822@phenom.ffwll.local>
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.737
 definitions=2020-10-21_03:2020-10-20,
 2020-10-21 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999
 lowpriorityscore=0 spamscore=0 suspectscore=0 adultscore=0 phishscore=0
 malwarescore=0 bulkscore=0 clxscore=1015 mlxscore=0 impostorscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2010210060
X-Mailman-Approved-At: Thu, 22 Oct 2020 07:27:48 +0000
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgRGFuaWVsLAoKZnJpZW5kbHkgcGluZy4gSSBoYXZlbid0IHNlZW4gYSBuZXcgdmVyc2lvbiBv
ZiB0aGlzIHBhdGNoIHNlcmllcywKYXMgSSBzYWlkIEkgdGhpbmsgeW91ciBjaGFuZ2UgZm9yIHMz
OTAvcGNpIGlzIGdlbmVyYWxseSB1c2VmdWwgc28KSSdtIGN1cmlvdXMsIGFyZSB5b3UgcGxhbm5p
bmcgb24gc2VuZGluZyBhIG5ldyB2ZXJzaW9uIHNvb24/CklmIHlvdSB3YW50IHlvdSBjYW4gYWxz
byBqdXN0IHNlbnQgdGhpcyBwYXRjaCB3aXRoIHRoZSBsYXN0IGZldwpuaXRwaWNrcyAocHJpbWFy
aWx5IHRoZSBtYWlsIGFkZHJlc3MpIGZpeGVkIGFuZCBJJ2xsIGhhcHBpbHkgYXBwbHkuCgpCZXN0
IHJlZ2FyZHMsCk5pa2xhcyBTY2huZWxsZQoKT24gMTAvMTIvMjAgNDoxOSBQTSwgRGFuaWVsIFZl
dHRlciB3cm90ZToKPiBPbiBNb24sIE9jdCAxMiwgMjAyMCBhdCAwNDowMzoyOFBNICswMjAwLCBO
aWtsYXMgU2NobmVsbGUgd3JvdGU6Ci4uLiBzbmlwIC4uLi4KPj4+IENjOiBKYXNvbiBHdW50aG9y
cGUgPGpnZ0B6aWVwZS5jYT4KPj4+IENjOiBEYW4gV2lsbGlhbXMgPGRhbi5qLndpbGxpYW1zQGlu
dGVsLmNvbT4KPj4+IENjOiBLZWVzIENvb2sgPGtlZXNjb29rQGNocm9taXVtLm9yZz4KPj4+IENj
OiBBbmRyZXcgTW9ydG9uIDxha3BtQGxpbnV4LWZvdW5kYXRpb24ub3JnPgo+Pj4gQ2M6IEpvaG4g
SHViYmFyZCA8amh1YmJhcmRAbnZpZGlhLmNvbT4KPj4+IENjOiBKw6lyw7RtZSBHbGlzc2UgPGpn
bGlzc2VAcmVkaGF0LmNvbT4KPj4+IENjOiBKYW4gS2FyYSA8amFja0BzdXNlLmN6Pgo+Pj4gQ2M6
IERhbiBXaWxsaWFtcyA8ZGFuLmoud2lsbGlhbXNAaW50ZWwuY29tPgo+Pgo+PiBUaGUgYWJvdmUg
Q2M6IGxpbmUgZm9yIERhbiBXaWxsaWFtcyBpcyBhIGR1cGxpY2F0ZQo+Pgo+Pj4gQ2M6IGxpbnV4
LW1tQGt2YWNrLm9yZwo+Pj4gQ2M6IGxpbnV4LWFybS1rZXJuZWxAbGlzdHMuaW5mcmFkZWFkLm9y
Zwo+Pj4gQ2M6IGxpbnV4LXNhbXN1bmctc29jQHZnZXIua2VybmVsLm9yZwo+Pj4gQ2M6IGxpbnV4
LW1lZGlhQHZnZXIua2VybmVsLm9yZwo+Pj4gQ2M6IE5pa2xhcyBTY2huZWxsZSA8c2NobmVsbGVA
bGludXguaWJtLmNvbT4KPj4+IENjOiBHZXJhbGQgU2NoYWVmZXIgPGdlcmFsZC5zY2hhZWZlckBs
aW51eC5pYm0uY29tPgo+Pj4gQ2M6IGxpbnV4LXMzOTBAdmdlci5rZXJuZWwub3JnCj4+PiAtLQo+
Pj4gdjI6IE1vdmUgVk1fSU8gfCBWTV9QRk5NQVAgY2hlY2tzIGFyb3VuZCBzbyB0aGV5IGtlZXAg
cmV0dXJuaW5nIEVJTlZBTAo+Pj4gbGlrZSBiZWZvcmUgKEdlcmFyZCkKPj4KPj4gSSB0aGluayB0
aGUgYWJvdmUgc2hvdWxkIGdvIGJlZm9yZSB0aGUgQ0MvU2lnbmVkLW9mZi9SZXZpZXdldiBibG9j
ay4KPiAKPiBUaGlzIGlzIGEgcGVyLXN1YnN5c3RlbSBiaWtlc2hlZCA6LSkgZHJpdmVycy9ncHUg
ZGVmaW5pdGVseSB3YW50cyBpdAo+IGFib3ZlLCBidXQgbW9zdCBjb3JlIHN1YnN5c3RlbXMgd2Fu
dCBpdCBiZWxvdy4gSSdsbCBtb3ZlIGl0Lgo+IAo+Pj4gLS0tCj4+PiAgYXJjaC9zMzkwL3BjaS9w
Y2lfbW1pby5jIHwgOTggKysrKysrKysrKysrKysrKysrKysrKystLS0tLS0tLS0tLS0tLS0tLQo+
Pj4gIDEgZmlsZSBjaGFuZ2VkLCA1NyBpbnNlcnRpb25zKCspLCA0MSBkZWxldGlvbnMoLSkKPj4+
Cj4+PiBkaWZmIC0tZ2l0IGEvYXJjaC9zMzkwL3BjaS9wY2lfbW1pby5jIGIvYXJjaC9zMzkwL3Bj
aS9wY2lfbW1pby5jCj4+PiBpbmRleCA0MDFjZjY3MGEyNDMuLjFhNmFkYmM2OGVlOCAxMDA2NDQK
Pj4+IC0tLSBhL2FyY2gvczM5MC9wY2kvcGNpX21taW8uYwo+Pj4gKysrIGIvYXJjaC9zMzkwL3Bj
aS9wY2lfbW1pby5jCj4+PiBAQCAtMTE5LDMzICsxMTksMTUgQEAgc3RhdGljIGlubGluZSBpbnQg
X19tZW1jcHlfdG9pb19pbnVzZXIodm9pZCBfX2lvbWVtICpkc3QsCj4+PiAgCXJldHVybiByYzsK
Pj4+ICB9Cj4+PiAgCj4+PiAtc3RhdGljIGxvbmcgZ2V0X3Bmbih1bnNpZ25lZCBsb25nIHVzZXJf
YWRkciwgdW5zaWduZWQgbG9uZyBhY2Nlc3MsCj4+PiAtCQkgICAgdW5zaWduZWQgbG9uZyAqcGZu
KQo+Pj4gLXsKPj4+IC0Jc3RydWN0IHZtX2FyZWFfc3RydWN0ICp2bWE7Cj4+PiAtCWxvbmcgcmV0
Owo+Pj4gLQo+Pj4gLQltbWFwX3JlYWRfbG9jayhjdXJyZW50LT5tbSk7Cj4+PiAtCXJldCA9IC1F
SU5WQUw7Cj4+PiAtCXZtYSA9IGZpbmRfdm1hKGN1cnJlbnQtPm1tLCB1c2VyX2FkZHIpOwo+Pj4g
LQlpZiAoIXZtYSkKPj4+IC0JCWdvdG8gb3V0Owo+Pj4gLQlyZXQgPSAtRUFDQ0VTOwo+Pj4gLQlp
ZiAoISh2bWEtPnZtX2ZsYWdzICYgYWNjZXNzKSkKPj4+IC0JCWdvdG8gb3V0Owo+Pj4gLQlyZXQg
PSBmb2xsb3dfcGZuKHZtYSwgdXNlcl9hZGRyLCBwZm4pOwo+Pj4gLW91dDoKPj4+IC0JbW1hcF9y
ZWFkX3VubG9jayhjdXJyZW50LT5tbSk7Cj4+PiAtCXJldHVybiByZXQ7Cj4+PiAtfQo+Pj4gLQo+
Pj4gIFNZU0NBTExfREVGSU5FMyhzMzkwX3BjaV9tbWlvX3dyaXRlLCB1bnNpZ25lZCBsb25nLCBt
bWlvX2FkZHIsCj4+PiAgCQljb25zdCB2b2lkIF9fdXNlciAqLCB1c2VyX2J1ZmZlciwgc2l6ZV90
LCBsZW5ndGgpCj4+PiAgewo+Pj4gIAl1OCBsb2NhbF9idWZbNjRdOwo+Pj4gIAl2b2lkIF9faW9t
ZW0gKmlvX2FkZHI7Cj4+PiAgCXZvaWQgKmJ1ZjsKPj4+IC0JdW5zaWduZWQgbG9uZyBwZm47Cj4+
PiArCXN0cnVjdCB2bV9hcmVhX3N0cnVjdCAqdm1hOwo+Pj4gKwlwdGVfdCAqcHRlcDsKPj4+ICsJ
c3BpbmxvY2tfdCAqcHRsOwo+Pgo+PiBXaXRoIGNoZWNrcGF0Y2gucGwgLS1zdHJpY3QgdGhlIGFi
b3ZlIHlpZWxkcyBhIGNvbXBsYWluZWQKPj4gIkNIRUNLOiBzcGlubG9ja190IGRlZmluaXRpb24g
d2l0aG91dCBjb21tZW50IiBidXQgSSB0aGluawo+PiB0aGF0J3MgcmVhbGx5IG9rYXkgc2luY2Ug
eW91ciBjb21taXQgZGVzY3JpcHRpb24gaXMgdmVyeSBjbGVhci4KPj4gU2FtZSBvaW4gbGluZSAy
NzcuCj4gCj4gSSB0aGluayB0aGlzIGlzIGEgZmFsbHMgcG9zaXRpdmUsIGNoZWNrcGF0Y2ggZG9l
c24ndCByZWFsaXplIHRoYXQKPiBTWVNDQUxMX0RFRklORTMgaXMgYSBmdW5jdGlvbiwgbm90IGEg
c3RydWN0dXJlLiBBbmQgaW4gYSBzdHJ1Y3R1cmUgSSdkCj4gaGF2ZSBhZGRlZCB0aGUga2VybmVs
ZG9jIG9yIGNvbW1lbnQuCj4gCj4gSSdsbCBmaXggdXAgYWxsIHRoZSBuaXRzIHlvdSd2ZSBmb3Vu
ZCBmb3IgdGhlIG5leHQgcm91bmQuIFRoYW5rcyBmb3IKPiB0YWtpbmcgYSBsb29rLgo+IC1EYW5p
ZWwKPiAKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJp
LWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
