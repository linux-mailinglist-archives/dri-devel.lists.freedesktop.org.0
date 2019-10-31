Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9961CEBEED
	for <lists+dri-devel@lfdr.de>; Fri,  1 Nov 2019 09:10:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 084BC6F75B;
	Fri,  1 Nov 2019 08:09:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from hqemgate15.nvidia.com (hqemgate15.nvidia.com [216.228.121.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4374D6F69A
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Oct 2019 23:46:47 +0000 (UTC)
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
 hqemgate15.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5dbb726c0000>; Thu, 31 Oct 2019 16:46:53 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate101.nvidia.com (PGP Universal service);
 Thu, 31 Oct 2019 16:46:46 -0700
X-PGP-Universal: processed;
 by hqpgpgate101.nvidia.com on Thu, 31 Oct 2019 16:46:46 -0700
Received: from [10.110.48.28] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 31 Oct
 2019 23:46:45 +0000
Subject: Re: [PATCH 08/19] mm/process_vm_access: set FOLL_PIN via
 pin_user_pages_remote()
To: Ira Weiny <ira.weiny@intel.com>
References: <20191030224930.3990755-1-jhubbard@nvidia.com>
 <20191030224930.3990755-9-jhubbard@nvidia.com>
 <20191031233519.GH14771@iweiny-DESK2.sc.intel.com>
From: John Hubbard <jhubbard@nvidia.com>
X-Nvconfidentiality: public
Message-ID: <7e79d9b5-772e-3628-4a60-65efc2f490c5@nvidia.com>
Date: Thu, 31 Oct 2019 16:46:45 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20191031233519.GH14771@iweiny-DESK2.sc.intel.com>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL105.nvidia.com (172.20.187.12) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Language: en-US
X-Mailman-Approved-At: Fri, 01 Nov 2019 08:09:55 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nvidia.com; s=n1; 
 t=1572565613; bh=Ni3MG24cn6KOx2mpKQf1IX0uBXAOxI/S5ACFQstwCH0=;
 h=X-PGP-Universal:Subject:To:CC:References:From:X-Nvconfidentiality:
 Message-ID:Date:User-Agent:MIME-Version:In-Reply-To:
 X-Originating-IP:X-ClientProxiedBy:Content-Type:Content-Language:
 Content-Transfer-Encoding;
 b=Fl9ftqk4J63wpZ0nmIiycLWCL11bYX50L+387BZ180hQh//V0Vp2ib5lF+gUyjqai
 BUNKoNlXTqc57g1YISa4wLoDF8FDUSOEDk//A2D/giSdADgbBgvBgvcIBixm1N1+Zk
 H8cgPXG2CeU33ioP0ErDWx6EuJtDE7b8cwg7DR730s9O71+39F8ouq+P6zklOCkkR4
 oDUx19ikJNj9J8uGqwUijC3VwpTpRuFvJG1fW6Ohvn+piDj3I1HEee28haJHWEOnTW
 Uwhe+F8yMyQV4WRYSdi28gKVURtaIyz8Dwtt8DEOye19K0wcNBp+Nz8BepqnA7FG/T
 4uFqHk6o1ZuLQ==
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
Cc: Michal Hocko <mhocko@suse.com>, Jan Kara <jack@suse.cz>,
 kvm@vger.kernel.org, linux-doc@vger.kernel.org,
 David Airlie <airlied@linux.ie>, Dave Chinner <david@fromorbit.com>,
 dri-devel@lists.freedesktop.org, LKML <linux-kernel@vger.kernel.org>,
 linux-mm@kvack.org, Paul Mackerras <paulus@samba.org>,
 linux-kselftest@vger.kernel.org, Shuah Khan <shuah@kernel.org>,
 Jonathan Corbet <corbet@lwn.net>, linux-rdma@vger.kernel.org,
 Michael Ellerman <mpe@ellerman.id.au>, Christoph Hellwig <hch@infradead.org>,
 Jason Gunthorpe <jgg@ziepe.ca>, Vlastimil Babka <vbabka@suse.cz>,
 =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn.topel@intel.com>,
 linux-media@vger.kernel.org, linux-block@vger.kernel.org,
 =?UTF-8?B?SsOpcsO0bWUgR2xpc3Nl?= <jglisse@redhat.com>,
 Al Viro <viro@zeniv.linux.org.uk>, Dan Williams <dan.j.williams@intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, bpf@vger.kernel.org,
 Magnus Karlsson <magnus.karlsson@intel.com>, Jens Axboe <axboe@kernel.dk>,
 netdev@vger.kernel.org, Alex Williamson <alex.williamson@redhat.com>,
 linux-fsdevel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev@lists.ozlabs.org, "David S . Miller" <davem@davemloft.net>,
 Mike Kravetz <mike.kravetz@oracle.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMTAvMzEvMTkgNDozNSBQTSwgSXJhIFdlaW55IHdyb3RlOgo+IE9uIFdlZCwgT2N0IDMwLCAy
MDE5IGF0IDAzOjQ5OjE5UE0gLTA3MDAsIEpvaG4gSHViYmFyZCB3cm90ZToKPj4gQ29udmVydCBw
cm9jZXNzX3ZtX2FjY2VzcyB0byB1c2UgdGhlIG5ldyBwaW5fdXNlcl9wYWdlc19yZW1vdGUoKQo+
PiBjYWxsLCB3aGljaCBzZXRzIEZPTExfUElOLiBTZXR0aW5nIEZPTExfUElOIGlzIG5vdyByZXF1
aXJlZCBmb3IKPj4gY29kZSB0aGF0IHJlcXVpcmVzIHRyYWNraW5nIG9mIHBpbm5lZCBwYWdlcy4K
Pj4KPj4gQWxzbywgcmVsZWFzZSB0aGUgcGFnZXMgdmlhIHB1dF91c2VyX3BhZ2UqKCkuCj4+Cj4+
IEFsc28sIHJlbmFtZSAicGFnZXMiIHRvICJwaW5uZWRfcGFnZXMiLCBhcyB0aGlzIG1ha2VzIGZv
cgo+PiBlYXNpZXIgcmVhZGluZyBvZiBwcm9jZXNzX3ZtX3J3X3NpbmdsZV92ZWMoKS4KPiAKPiBP
ay4uLiAgYnV0IGl0IG1hZGUgcmV2aWV3IGEgYml0IGhhcmRlci4uLgo+IAoKWWVzLCBzb3JyeSBh
Ym91dCB0aGF0LiBBZnRlciBkZWFsaW5nIHdpdGggInBhZ2VzIG1lYW5zIHN0cnVjdCBwYWdlICpb
XSIKZm9yIGFsbCB0aGlzIHRpbWUsIGhhdmluZyBhbiAiaW50IHBhZ2VzIiBqdXN0IHdhcyBhIHN0
ZXAgdG9vIGZhciBmb3IKbWUgaGVyZS4gOikKClRoYW5rcyBmb3Igd29ya2luZyB0aHJvdWdoIGl0
LiAKCgp0aGFua3MsCgpKb2huIEh1YmJhcmQKTlZJRElBCgoKCj4gUmV2aWV3ZWQtYnk6IElyYSBX
ZWlueSA8aXJhLndlaW55QGludGVsLmNvbT4KPiAKCgo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBKb2hu
IEh1YmJhcmQgPGpodWJiYXJkQG52aWRpYS5jb20+Cj4+IC0tLQo+PiAgbW0vcHJvY2Vzc192bV9h
Y2Nlc3MuYyB8IDI4ICsrKysrKysrKysrKysrKy0tLS0tLS0tLS0tLS0KPj4gIDEgZmlsZSBjaGFu
Z2VkLCAxNSBpbnNlcnRpb25zKCspLCAxMyBkZWxldGlvbnMoLSkKPj4KPj4gZGlmZiAtLWdpdCBh
L21tL3Byb2Nlc3Nfdm1fYWNjZXNzLmMgYi9tbS9wcm9jZXNzX3ZtX2FjY2Vzcy5jCj4+IGluZGV4
IDM1N2FhN2JlZjZjMC4uZmQyMGFiNjc1Yjg1IDEwMDY0NAo+PiAtLS0gYS9tbS9wcm9jZXNzX3Zt
X2FjY2Vzcy5jCj4+ICsrKyBiL21tL3Byb2Nlc3Nfdm1fYWNjZXNzLmMKPj4gQEAgLTQyLDEyICs0
MiwxMSBAQCBzdGF0aWMgaW50IHByb2Nlc3Nfdm1fcndfcGFnZXMoc3RydWN0IHBhZ2UgKipwYWdl
cywKPj4gIAkJaWYgKGNvcHkgPiBsZW4pCj4+ICAJCQljb3B5ID0gbGVuOwo+PiAgCj4+IC0JCWlm
ICh2bV93cml0ZSkgewo+PiArCQlpZiAodm1fd3JpdGUpCj4+ICAJCQljb3BpZWQgPSBjb3B5X3Bh
Z2VfZnJvbV9pdGVyKHBhZ2UsIG9mZnNldCwgY29weSwgaXRlcik7Cj4+IC0JCQlzZXRfcGFnZV9k
aXJ0eV9sb2NrKHBhZ2UpOwo+PiAtCQl9IGVsc2Ugewo+PiArCQllbHNlCj4+ICAJCQljb3BpZWQg
PSBjb3B5X3BhZ2VfdG9faXRlcihwYWdlLCBvZmZzZXQsIGNvcHksIGl0ZXIpOwo+PiAtCQl9Cj4+
ICsKPj4gIAkJbGVuIC09IGNvcGllZDsKPj4gIAkJaWYgKGNvcGllZCA8IGNvcHkgJiYgaW92X2l0
ZXJfY291bnQoaXRlcikpCj4+ICAJCQlyZXR1cm4gLUVGQVVMVDsKPj4gQEAgLTk2LDcgKzk1LDcg
QEAgc3RhdGljIGludCBwcm9jZXNzX3ZtX3J3X3NpbmdsZV92ZWModW5zaWduZWQgbG9uZyBhZGRy
LAo+PiAgCQlmbGFncyB8PSBGT0xMX1dSSVRFOwo+PiAgCj4+ICAJd2hpbGUgKCFyYyAmJiBucl9w
YWdlcyAmJiBpb3ZfaXRlcl9jb3VudChpdGVyKSkgewo+PiAtCQlpbnQgcGFnZXMgPSBtaW4obnJf
cGFnZXMsIG1heF9wYWdlc19wZXJfbG9vcCk7Cj4+ICsJCWludCBwaW5uZWRfcGFnZXMgPSBtaW4o
bnJfcGFnZXMsIG1heF9wYWdlc19wZXJfbG9vcCk7Cj4+ICAJCWludCBsb2NrZWQgPSAxOwo+PiAg
CQlzaXplX3QgYnl0ZXM7Cj4+ICAKPj4gQEAgLTEwNiwxNCArMTA1LDE1IEBAIHN0YXRpYyBpbnQg
cHJvY2Vzc192bV9yd19zaW5nbGVfdmVjKHVuc2lnbmVkIGxvbmcgYWRkciwKPj4gIAkJICogY3Vy
cmVudC9jdXJyZW50LT5tbQo+PiAgCQkgKi8KPj4gIAkJZG93bl9yZWFkKCZtbS0+bW1hcF9zZW0p
Owo+PiAtCQlwYWdlcyA9IGdldF91c2VyX3BhZ2VzX3JlbW90ZSh0YXNrLCBtbSwgcGEsIHBhZ2Vz
LCBmbGFncywKPj4gLQkJCQkJICAgICAgcHJvY2Vzc19wYWdlcywgTlVMTCwgJmxvY2tlZCk7Cj4+
ICsJCXBpbm5lZF9wYWdlcyA9IHBpbl91c2VyX3BhZ2VzX3JlbW90ZSh0YXNrLCBtbSwgcGEsIHBp
bm5lZF9wYWdlcywKPj4gKwkJCQkJCSAgICAgZmxhZ3MsIHByb2Nlc3NfcGFnZXMsCj4+ICsJCQkJ
CQkgICAgIE5VTEwsICZsb2NrZWQpOwo+PiAgCQlpZiAobG9ja2VkKQo+PiAgCQkJdXBfcmVhZCgm
bW0tPm1tYXBfc2VtKTsKPj4gLQkJaWYgKHBhZ2VzIDw9IDApCj4+ICsJCWlmIChwaW5uZWRfcGFn
ZXMgPD0gMCkKPj4gIAkJCXJldHVybiAtRUZBVUxUOwo+PiAgCj4+IC0JCWJ5dGVzID0gcGFnZXMg
KiBQQUdFX1NJWkUgLSBzdGFydF9vZmZzZXQ7Cj4+ICsJCWJ5dGVzID0gcGlubmVkX3BhZ2VzICog
UEFHRV9TSVpFIC0gc3RhcnRfb2Zmc2V0Owo+PiAgCQlpZiAoYnl0ZXMgPiBsZW4pCj4+ICAJCQli
eXRlcyA9IGxlbjsKPj4gIAo+PiBAQCAtMTIyLDEwICsxMjIsMTIgQEAgc3RhdGljIGludCBwcm9j
ZXNzX3ZtX3J3X3NpbmdsZV92ZWModW5zaWduZWQgbG9uZyBhZGRyLAo+PiAgCQkJCQkgdm1fd3Jp
dGUpOwo+PiAgCQlsZW4gLT0gYnl0ZXM7Cj4+ICAJCXN0YXJ0X29mZnNldCA9IDA7Cj4+IC0JCW5y
X3BhZ2VzIC09IHBhZ2VzOwo+PiAtCQlwYSArPSBwYWdlcyAqIFBBR0VfU0laRTsKPj4gLQkJd2hp
bGUgKHBhZ2VzKQo+PiAtCQkJcHV0X3BhZ2UocHJvY2Vzc19wYWdlc1stLXBhZ2VzXSk7Cj4+ICsJ
CW5yX3BhZ2VzIC09IHBpbm5lZF9wYWdlczsKPj4gKwkJcGEgKz0gcGlubmVkX3BhZ2VzICogUEFH
RV9TSVpFOwo+PiArCj4+ICsJCS8qIElmIHZtX3dyaXRlIGlzIHNldCwgdGhlIHBhZ2VzIG5lZWQg
dG8gYmUgbWFkZSBkaXJ0eTogKi8KPj4gKwkJcHV0X3VzZXJfcGFnZXNfZGlydHlfbG9jayhwcm9j
ZXNzX3BhZ2VzLCBwaW5uZWRfcGFnZXMsCj4+ICsJCQkJCSAgdm1fd3JpdGUpOwo+PiAgCX0KPj4g
IAo+PiAgCXJldHVybiByYzsKPj4gLS0gCj4+IDIuMjMuMAo+PgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1k
ZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcv
bWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
