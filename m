Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D0DC3A5B7
	for <lists+dri-devel@lfdr.de>; Sun,  9 Jun 2019 14:55:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1FE72892FE;
	Sun,  9 Jun 2019 12:54:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from hqemgate15.nvidia.com (hqemgate15.nvidia.com [216.228.121.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF599891DA;
 Sat,  8 Jun 2019 01:32:42 +0000 (UTC)
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by
 hqemgate15.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5cfb102a0001>; Fri, 07 Jun 2019 18:32:27 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate102.nvidia.com (PGP Universal service);
 Fri, 07 Jun 2019 18:32:42 -0700
X-PGP-Universal: processed;
 by hqpgpgate102.nvidia.com on Fri, 07 Jun 2019 18:32:42 -0700
Received: from [10.110.48.28] (172.20.13.39) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Sat, 8 Jun
 2019 01:32:39 +0000
Subject: Re: [PATCH v3 hmm 05/11] mm/hmm: Remove duplicate condition test
 before wait_event_timeout
To: Jason Gunthorpe <jgg@ziepe.ca>
References: <20190606184438.31646-1-jgg@ziepe.ca>
 <20190606184438.31646-6-jgg@ziepe.ca>
 <86962e22-88b1-c1bf-d704-d5a5053fa100@nvidia.com>
 <20190607133107.GF14802@ziepe.ca>
From: John Hubbard <jhubbard@nvidia.com>
Message-ID: <4c1a18b7-6dcb-7ce3-c178-9efd255e8056@nvidia.com>
Date: Fri, 7 Jun 2019 18:32:38 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190607133107.GF14802@ziepe.ca>
X-Originating-IP: [172.20.13.39]
X-ClientProxiedBy: HQMAIL103.nvidia.com (172.20.187.11) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Language: en-US
X-Mailman-Approved-At: Sun, 09 Jun 2019 12:54:17 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nvidia.com; s=n1; 
 t=1559957547; bh=xVgyj/Sltl83MtwATtJ5A8fGsNYheaZeYpyqP7L5KAE=;
 h=X-PGP-Universal:Subject:To:CC:References:From:Message-ID:Date:
 User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
 X-ClientProxiedBy:Content-Type:Content-Language:
 Content-Transfer-Encoding;
 b=GYKNG1guS/PHUsAd0J2qN9HUV4d3WKr9M1/GPzqHHGQhrOJ6/d/qZI2z5UvXkDVSn
 Ng/R0UmHQgBZALpk+QV7PGHkieBLm5sE+nOdT9PnB9vhI0YwIaj7FcafynhrREdkaC
 LVWTBVe98W53OWJnxbiRTu68ZRBvOMlVxzr34UOPe4fHKZMZJBuyJLUupa6MjR5L+i
 Vvc7YeCTnOwpFbhUOGQnW0FfnLcky93noaVhM7A3AWMPrAFOWIu7BhzYB1hrF1WCP3
 WI5gua45CZvoJhs+zWsNFiKgRpZH45b1dnLmOB/r8OgGpM4n9GPBKWbsM20ZhqCDzl
 tB81whaCw2vig==
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
Cc: Andrea Arcangeli <aarcange@redhat.com>,
 Ralph Campbell <rcampbell@nvidia.com>, linux-rdma@vger.kernel.org,
 Felix.Kuehling@amd.com, dri-devel@lists.freedesktop.org, linux-mm@kvack.org,
 Jerome Glisse <jglisse@redhat.com>, amd-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gNi83LzE5IDY6MzEgQU0sIEphc29uIEd1bnRob3JwZSB3cm90ZToKPiBUaGUgd2FpdF9ldmVu
dF90aW1lb3V0IG1hY3JvIGFscmVhZHkgdGVzdHMgdGhlIGNvbmRpdGlvbiBhcyBpdHMgZmlyc3QK
PiBhY3Rpb24sIHNvIHRoZXJlIGlzIG5vIHJlYXNvbiB0byBvcGVuIGNvZGUgYW5vdGhlciB2ZXJz
aW9uIG9mIHRoaXMsIGFsbAo+IHRoYXQgZG9lcyBpcyBza2lwIHRoZSBtaWdodF9zbGVlcCgpIGRl
YnVnZ2luZyBpbiBjb21tb24gY2FzZXMsIHdoaWNoIGlzCj4gbm90IGhlbHBmdWwuCj4gCj4gRnVy
dGhlciwgYmFzZWQgb24gcHJpb3IgcGF0Y2hlcywgd2UgY2FuIG5vdyBzaW1wbGlmeSB0aGUgcmVx
dWlyZWQgY29uZGl0aW9uCj4gdGVzdDoKPiAgLSBJZiByYW5nZSBpcyB2YWxpZCBtZW1vcnkgdGhl
biBzbyBpcyByYW5nZS0+aG1tCj4gIC0gSWYgaG1tX3JlbGVhc2UoKSBoYXMgcnVuIHRoZW4gcmFu
Z2UtPnZhbGlkIGlzIHNldCB0byBmYWxzZQo+ICAgIGF0IHRoZSBzYW1lIHRpbWUgYXMgZGVhZCwg
c28gbm8gcmVhc29uIHRvIGNoZWNrIGJvdGguCj4gIC0gQSB2YWxpZCBobW0gaGFzIGEgdmFsaWQg
aG1tLT5tbS4KPiAKPiBBbGxvd2luZyB0aGUgcmV0dXJuIHZhbHVlIG9mIHdhaXRfZXZlbnRfdGlt
ZW91dCgpIChhbG9uZyB3aXRoIGl0cyBpbnRlcm5hbAo+IGJhcnJpZXJzKSB0byBjb21wdXRlIHRo
ZSByZXN1bHQgb2YgdGhlIGZ1bmN0aW9uLgo+IAo+IFNpZ25lZC1vZmYtYnk6IEphc29uIEd1bnRo
b3JwZSA8amdnQG1lbGxhbm94LmNvbT4KPiAtLS0KCgogICAgUmV2aWV3ZWQtYnk6IEpvaG4gSHVi
YmFyZCA8amh1YmJhcmRAbnZpZGlhLmNvbT4KCgp0aGFua3MsCi0tIApKb2huIEh1YmJhcmQKTlZJ
RElBCgoKCj4gdjMKPiAtIFNpbXBsaWZ5IHRoZSB3YWl0X2V2ZW50X3RpbWVvdXQgdG8gbm90IGNo
ZWNrIHZhbGlkCj4gLS0tCj4gIGluY2x1ZGUvbGludXgvaG1tLmggfCAxMyArKy0tLS0tLS0tLS0t
Cj4gIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDExIGRlbGV0aW9ucygtKQo+IAo+
IGRpZmYgLS1naXQgYS9pbmNsdWRlL2xpbnV4L2htbS5oIGIvaW5jbHVkZS9saW51eC9obW0uaAo+
IGluZGV4IDFkOTdiNmQ2MmM1YmNmLi4yNmU3YzQ3NzQ5MGM0ZSAxMDA2NDQKPiAtLS0gYS9pbmNs
dWRlL2xpbnV4L2htbS5oCj4gKysrIGIvaW5jbHVkZS9saW51eC9obW0uaAo+IEBAIC0yMDksMTcg
KzIwOSw4IEBAIHN0YXRpYyBpbmxpbmUgdW5zaWduZWQgbG9uZyBobW1fcmFuZ2VfcGFnZV9zaXpl
KGNvbnN0IHN0cnVjdCBobW1fcmFuZ2UgKnJhbmdlKQo+ICBzdGF0aWMgaW5saW5lIGJvb2wgaG1t
X3JhbmdlX3dhaXRfdW50aWxfdmFsaWQoc3RydWN0IGhtbV9yYW5nZSAqcmFuZ2UsCj4gIAkJCQkJ
ICAgICAgdW5zaWduZWQgbG9uZyB0aW1lb3V0KQo+ICB7Cj4gLQkvKiBDaGVjayBpZiBtbSBpcyBk
ZWFkID8gKi8KPiAtCWlmIChyYW5nZS0+aG1tID09IE5VTEwgfHwgcmFuZ2UtPmhtbS0+ZGVhZCB8
fCByYW5nZS0+aG1tLT5tbSA9PSBOVUxMKSB7Cj4gLQkJcmFuZ2UtPnZhbGlkID0gZmFsc2U7Cj4g
LQkJcmV0dXJuIGZhbHNlOwo+IC0JfQo+IC0JaWYgKHJhbmdlLT52YWxpZCkKPiAtCQlyZXR1cm4g
dHJ1ZTsKPiAtCXdhaXRfZXZlbnRfdGltZW91dChyYW5nZS0+aG1tLT53cSwgcmFuZ2UtPnZhbGlk
IHx8IHJhbmdlLT5obW0tPmRlYWQsCj4gLQkJCSAgIG1zZWNzX3RvX2ppZmZpZXModGltZW91dCkp
Owo+IC0JLyogUmV0dXJuIGN1cnJlbnQgdmFsaWQgc3RhdHVzIGp1c3QgaW4gY2FzZSB3ZSBnZXQg
bHVja3kgKi8KPiAtCXJldHVybiByYW5nZS0+dmFsaWQ7Cj4gKwlyZXR1cm4gd2FpdF9ldmVudF90
aW1lb3V0KHJhbmdlLT5obW0tPndxLCByYW5nZS0+dmFsaWQsCj4gKwkJCQkgIG1zZWNzX3RvX2pp
ZmZpZXModGltZW91dCkpICE9IDA7Cj4gIH0KPiAgCj4gIC8qCj4gCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRy
aS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5v
cmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
