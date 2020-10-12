Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DA6C28C91B
	for <lists+dri-devel@lfdr.de>; Tue, 13 Oct 2020 09:17:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE7B16E89D;
	Tue, 13 Oct 2020 07:17:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7827C6E497
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Oct 2020 14:41:33 +0000 (UTC)
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 09CEZDrw078166; Mon, 12 Oct 2020 10:41:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=Mh49I7jw4VB6kT4/ay+AaLZilzKCmLBonLwWNkMHRRw=;
 b=MK1q9eNePHSQkxW58VHmw9c51ABMDsasKexGHGtGFzfduqPUsqiEoLP3H2BW8pLNOJDY
 HKqx86fR6w5oclhuufWpcOEwP0GRox8JaBTYNny6OCAn7MCC4NOBYADXeh4lyftwVqJE
 sr8kULHlSgEXQMxanjk40vuI1bFSD2BIM9y2lsiAzCbBQg6f5qdB0j+hbWLabzpIGN5U
 bdFaxg4nw+BtjTue5U9eA2In51WVMjfyNcPxdiO7vm1Otcrw/GYBNtZXjnZIUa1xkmQk
 QBmsEy0lKB9GG3gZTFV4t6AdsGpBK0O3fAnbdeXBZ0quZUqnXFhalJ1jhEuBXpdVz/cX +w== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 344qucjbjf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 12 Oct 2020 10:41:29 -0400
Received: from m0127361.ppops.net (m0127361.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 09CEZWTT079650;
 Mon, 12 Oct 2020 10:41:28 -0400
Received: from ppma01fra.de.ibm.com (46.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.70])
 by mx0a-001b2d01.pphosted.com with ESMTP id 344qucjawm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 12 Oct 2020 10:41:28 -0400
Received: from pps.filterd (ppma01fra.de.ibm.com [127.0.0.1])
 by ppma01fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 09CEbR7V001812;
 Mon, 12 Oct 2020 14:39:34 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma01fra.de.ibm.com with ESMTP id 344558rf3p-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 12 Oct 2020 14:39:34 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 09CEdVqO9437672
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 12 Oct 2020 14:39:32 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id CF0F8A405C;
 Mon, 12 Oct 2020 14:39:31 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 052EAA405F;
 Mon, 12 Oct 2020 14:39:31 +0000 (GMT)
Received: from [9.145.9.103] (unknown [9.145.9.103])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon, 12 Oct 2020 14:39:30 +0000 (GMT)
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
Message-ID: <3c28a96a-6bb5-f581-4671-5c87161238f7@linux.ibm.com>
Date: Mon, 12 Oct 2020 16:39:30 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20201012141906.GX438822@phenom.ffwll.local>
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-10-12_12:2020-10-12,
 2020-10-12 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015
 priorityscore=1501 suspectscore=0 lowpriorityscore=0 impostorscore=0
 spamscore=0 malwarescore=0 adultscore=0 mlxlogscore=999 mlxscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2010120117
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Li4uIHNuaXAgLi4uCj4+PiBDYzogbGludXgtbWVkaWFAdmdlci5rZXJuZWwub3JnCj4+PiBDYzog
TmlrbGFzIFNjaG5lbGxlIDxzY2huZWxsZUBsaW51eC5pYm0uY29tPgo+Pj4gQ2M6IEdlcmFsZCBT
Y2hhZWZlciA8Z2VyYWxkLnNjaGFlZmVyQGxpbnV4LmlibS5jb20+Cj4+PiBDYzogbGludXgtczM5
MEB2Z2VyLmtlcm5lbC5vcmcKPj4+IC0tCj4+PiB2MjogTW92ZSBWTV9JTyB8IFZNX1BGTk1BUCBj
aGVja3MgYXJvdW5kIHNvIHRoZXkga2VlcCByZXR1cm5pbmcgRUlOVkFMCj4+PiBsaWtlIGJlZm9y
ZSAoR2VyYXJkKQo+Pgo+PiBJIHRoaW5rIHRoZSBhYm92ZSBzaG91bGQgZ28gYmVmb3JlIHRoZSBD
Qy9TaWduZWQtb2ZmL1Jldmlld2V2IGJsb2NrLgo+IAo+IFRoaXMgaXMgYSBwZXItc3Vic3lzdGVt
IGJpa2VzaGVkIDotKSBkcml2ZXJzL2dwdSBkZWZpbml0ZWx5IHdhbnRzIGl0Cj4gYWJvdmUsIGJ1
dCBtb3N0IGNvcmUgc3Vic3lzdGVtcyB3YW50IGl0IGJlbG93LiBJJ2xsIG1vdmUgaXQuCgpUb2Rh
eSBJIGxlYXJuZWQsIHRoYW5rcyEgVGhhdCBzYWlkIEkgdGhpbmsgbW9zdCBvZiB0aGUgdGltZSBJ
J3ZlCmFjdHVhbGx5IG5vdCBzZWVuIHZlcnNpb24gY2hhbmdlIGluZm9ybWF0aW9uIGluIHRoZSBj
b21taXQgbWVzc2FnZSBpdHNlbGYKb25seSBpbiB0aGUgY292ZXIgbGV0dGVycy4gSSByZWFsbHkg
ZG9uJ3QgY2FyZSBqdXN0IGxvb2tlZCBvZGQgdG8gbWUuCgo+IAo+Pj4gLS0tCj4+PiAgYXJjaC9z
MzkwL3BjaS9wY2lfbW1pby5jIHwgOTggKysrKysrKysrKysrKysrKysrKysrKystLS0tLS0tLS0t
LS0tLS0tLQo+Pj4gIDEgZmlsZSBjaGFuZ2VkLCA1NyBpbnNlcnRpb25zKCspLCA0MSBkZWxldGlv
bnMoLSkKPj4+Cj4+PiBkaWZmIC0tZ2l0IGEvYXJjaC9zMzkwL3BjaS9wY2lfbW1pby5jIGIvYXJj
aC9zMzkwL3BjaS9wY2lfbW1pby5jCj4+PiBpbmRleCA0MDFjZjY3MGEyNDMuLjFhNmFkYmM2OGVl
OCAxMDA2NDQKPj4+IC0tLSBhL2FyY2gvczM5MC9wY2kvcGNpX21taW8uYwo+Pj4gKysrIGIvYXJj
aC9zMzkwL3BjaS9wY2lfbW1pby5jCj4+PiBAQCAtMTE5LDMzICsxMTksMTUgQEAgc3RhdGljIGlu
bGluZSBpbnQgX19tZW1jcHlfdG9pb19pbnVzZXIodm9pZCBfX2lvbWVtICpkc3QsCj4+PiAgCXJl
dHVybiByYzsKPj4+ICB9Cj4+PiAgCj4+PiAtc3RhdGljIGxvbmcgZ2V0X3Bmbih1bnNpZ25lZCBs
b25nIHVzZXJfYWRkciwgdW5zaWduZWQgbG9uZyBhY2Nlc3MsCj4+PiAtCQkgICAgdW5zaWduZWQg
bG9uZyAqcGZuKQo+Pj4gLXsKPj4+IC0Jc3RydWN0IHZtX2FyZWFfc3RydWN0ICp2bWE7Cj4+PiAt
CWxvbmcgcmV0Owo+Pj4gLQo+Pj4gLQltbWFwX3JlYWRfbG9jayhjdXJyZW50LT5tbSk7Cj4+PiAt
CXJldCA9IC1FSU5WQUw7Cj4+PiAtCXZtYSA9IGZpbmRfdm1hKGN1cnJlbnQtPm1tLCB1c2VyX2Fk
ZHIpOwo+Pj4gLQlpZiAoIXZtYSkKPj4+IC0JCWdvdG8gb3V0Owo+Pj4gLQlyZXQgPSAtRUFDQ0VT
Owo+Pj4gLQlpZiAoISh2bWEtPnZtX2ZsYWdzICYgYWNjZXNzKSkKPj4+IC0JCWdvdG8gb3V0Owo+
Pj4gLQlyZXQgPSBmb2xsb3dfcGZuKHZtYSwgdXNlcl9hZGRyLCBwZm4pOwo+Pj4gLW91dDoKPj4+
IC0JbW1hcF9yZWFkX3VubG9jayhjdXJyZW50LT5tbSk7Cj4+PiAtCXJldHVybiByZXQ7Cj4+PiAt
fQo+Pj4gLQo+Pj4gIFNZU0NBTExfREVGSU5FMyhzMzkwX3BjaV9tbWlvX3dyaXRlLCB1bnNpZ25l
ZCBsb25nLCBtbWlvX2FkZHIsCj4+PiAgCQljb25zdCB2b2lkIF9fdXNlciAqLCB1c2VyX2J1ZmZl
ciwgc2l6ZV90LCBsZW5ndGgpCj4+PiAgewo+Pj4gIAl1OCBsb2NhbF9idWZbNjRdOwo+Pj4gIAl2
b2lkIF9faW9tZW0gKmlvX2FkZHI7Cj4+PiAgCXZvaWQgKmJ1ZjsKPj4+IC0JdW5zaWduZWQgbG9u
ZyBwZm47Cj4+PiArCXN0cnVjdCB2bV9hcmVhX3N0cnVjdCAqdm1hOwo+Pj4gKwlwdGVfdCAqcHRl
cDsKPj4+ICsJc3BpbmxvY2tfdCAqcHRsOwo+Pgo+PiBXaXRoIGNoZWNrcGF0Y2gucGwgLS1zdHJp
Y3QgdGhlIGFib3ZlIHlpZWxkcyBhIGNvbXBsYWluZWQKPj4gIkNIRUNLOiBzcGlubG9ja190IGRl
ZmluaXRpb24gd2l0aG91dCBjb21tZW50IiBidXQgSSB0aGluawo+PiB0aGF0J3MgcmVhbGx5IG9r
YXkgc2luY2UgeW91ciBjb21taXQgZGVzY3JpcHRpb24gaXMgdmVyeSBjbGVhci4KPj4gU2FtZSBv
aW4gbGluZSAyNzcuCj4gCj4gSSB0aGluayB0aGlzIGlzIGEgZmFsbHMgcG9zaXRpdmUsIGNoZWNr
cGF0Y2ggZG9lc24ndCByZWFsaXplIHRoYXQKPiBTWVNDQUxMX0RFRklORTMgaXMgYSBmdW5jdGlv
biwgbm90IGEgc3RydWN0dXJlLiBBbmQgaW4gYSBzdHJ1Y3R1cmUgSSdkCj4gaGF2ZSBhZGRlZCB0
aGUga2VybmVsZG9jIG9yIGNvbW1lbnQuCgpJbnRlcmVzdGluZywgeW91ciB0aGVvcnkgc291bmRz
IGNvbnZpbmNpbmcsIEkgdG9vIHRob3VnaHQgdGhpcwp3YXMgYSBiaXQgdG9vIHBlZGFudGljLgoK
PiAKPiBJJ2xsIGZpeCB1cCBhbGwgdGhlIG5pdHMgeW91J3ZlIGZvdW5kIGZvciB0aGUgbmV4dCBy
b3VuZC4gVGhhbmtzIGZvcgo+IHRha2luZyBhIGxvb2suCgpZb3UncmUgd2VsY29tZSBob3BlIEkg
ZGlkbid0IHNvdW5kIHBlZGFudGljLiBJIHRoaW5rIHlvdSd2ZSBhIGxvdAptb3JlIGV4cGVyaWVu
Y2UgYWN0dWFsbHkgYW5kIHRoaXMgY2FuIGluZGVlZCB0dXJuIGludG8gYmlrZXNoZWRkaW5nCmJ1
dCBzaW5jZSBJIHdhcyBhbnN3ZXJpbmcgYW55d2F5IGFuZCBtb3N0IG9mIHRoaXMgd2FzIGNoZWNr
cGF0Y2jigKYKCj4gLURhbmllbAo+IApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5m
by9kcmktZGV2ZWwK
