Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A19D971270
	for <lists+dri-devel@lfdr.de>; Tue, 23 Jul 2019 09:15:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 82F4F897F5;
	Tue, 23 Jul 2019 07:14:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from hqemgate14.nvidia.com (hqemgate14.nvidia.com [216.228.121.143])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D372F89E4C
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Jul 2019 04:43:02 +0000 (UTC)
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
 hqemgate14.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5d3690560000>; Mon, 22 Jul 2019 21:43:02 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate101.nvidia.com (PGP Universal service);
 Mon, 22 Jul 2019 21:43:02 -0700
X-PGP-Universal: processed;
 by hqpgpgate101.nvidia.com on Mon, 22 Jul 2019 21:43:02 -0700
Received: from [10.2.164.38] (172.20.13.39) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 23 Jul
 2019 04:43:01 +0000
Subject: Re: [PATCH 3/3] net/xdp: convert put_page() to put_user_page*()
To: Ira Weiny <ira.weiny@intel.com>, <john.hubbard@gmail.com>
References: <20190722223415.13269-1-jhubbard@nvidia.com>
 <20190722223415.13269-4-jhubbard@nvidia.com>
 <20190723002534.GA10284@iweiny-DESK2.sc.intel.com>
From: John Hubbard <jhubbard@nvidia.com>
X-Nvconfidentiality: public
Message-ID: <a4e9b293-11f8-6b3c-cf4d-308e3b32df34@nvidia.com>
Date: Mon, 22 Jul 2019 21:41:34 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190723002534.GA10284@iweiny-DESK2.sc.intel.com>
X-Originating-IP: [172.20.13.39]
X-ClientProxiedBy: HQMAIL107.nvidia.com (172.20.187.13) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Language: en-US
X-Mailman-Approved-At: Tue, 23 Jul 2019 07:14:10 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nvidia.com; s=n1; 
 t=1563856982; bh=6Lt/z2MUaW0HLuGN6nPZXpx+R7NECtbBk4FafHzD+OU=;
 h=X-PGP-Universal:Subject:To:CC:References:From:X-Nvconfidentiality:
 Message-ID:Date:User-Agent:MIME-Version:In-Reply-To:
 X-Originating-IP:X-ClientProxiedBy:Content-Type:Content-Language:
 Content-Transfer-Encoding;
 b=Qa3lZLE8Kf/RL8KhFgPo9Jkt7HFiKw1Is4rV87XoFGEKvWzwvIu+hxfTzr2uraY59
 XErNMpPf1Qu2zCNLtYfVRqCa3/zsPozeqvDkM44qxxIpWE47R8YoLoPjAb9uunMk0+
 2+b5UcPkOzZtt+IdgVMrvpTMyr/Pdu3kowZiYCl3u00yAyQSmsitBmCoJle4OhJXpe
 bMuJ8grmilp9xNLC2hggYcxZ/uAvyWeQge9toK1cze9EOdK1UUkTm+VI05DdS87kNs
 cGOrzWdia2G/F74bOT0v75OXAOE8VdSB9dSxGpUKwW6BkxObVy2erx/jSiG+ZKKb1I
 5O4vdoqzeZX4g==
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
Cc: Boaz Harrosh <boaz@plexistor.com>, Jan Kara <jack@suse.cz>,
 David Airlie <airlied@linux.ie>, Dave Chinner <david@fromorbit.com>,
 dri-devel@lists.freedesktop.org, linux-mm@kvack.org,
 Christoph Hellwig <hch@lst.de>, Sage Weil <sage@redhat.com>,
 Miklos Szeredi <miklos@szeredi.hu>, linux-rdma@vger.kernel.org,
 Matthew Wilcox <willy@infradead.org>, Jason Gunthorpe <jgg@ziepe.ca>,
 Johannes Thumshirn <jthumshirn@suse.de>, Ilya Dryomov <idryomov@gmail.com>,
 =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn.topel@intel.com>,
 Santosh Shilimkar <santosh.shilimkar@oracle.com>,
 Ming Lei <ming.lei@redhat.com>,
 =?UTF-8?B?SsOpcsO0bWUgR2xpc3Nl?= <jglisse@redhat.com>,
 Alexander Viro <viro@zeniv.linux.org.uk>,
 Dan Williams <dan.j.williams@intel.com>, bpf@vger.kernel.org,
 Magnus Karlsson <magnus.karlsson@intel.com>, Jens Axboe <axboe@kernel.dk>,
 netdev@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
 Yan Zheng <zyan@redhat.com>, Andrew Morton <akpm@linux-foundation.org>,
 "David S . Miller" <davem@davemloft.net>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gNy8yMi8xOSA1OjI1IFBNLCBJcmEgV2Vpbnkgd3JvdGU6Cj4gT24gTW9uLCBKdWwgMjIsIDIw
MTkgYXQgMDM6MzQ6MTVQTSAtMDcwMCwgam9obi5odWJiYXJkQGdtYWlsLmNvbSB3cm90ZToKPj4g
RnJvbTogSm9obiBIdWJiYXJkIDxqaHViYmFyZEBudmlkaWEuY29tPgo+Pgo+PiBGb3IgcGFnZXMg
dGhhdCB3ZXJlIHJldGFpbmVkIHZpYSBnZXRfdXNlcl9wYWdlcyooKSwgcmVsZWFzZSB0aG9zZSBw
YWdlcwo+PiB2aWEgdGhlIG5ldyBwdXRfdXNlcl9wYWdlKigpIHJvdXRpbmVzLCBpbnN0ZWFkIG9m
IHZpYSBwdXRfcGFnZSgpIG9yCj4+IHJlbGVhc2VfcGFnZXMoKS4KPj4KPj4gVGhpcyBpcyBwYXJ0
IGEgdHJlZS13aWRlIGNvbnZlcnNpb24sIGFzIGRlc2NyaWJlZCBpbiBjb21taXQgZmMxZDhlN2Nj
YTJkCj4+ICgibW06IGludHJvZHVjZSBwdXRfdXNlcl9wYWdlKigpLCBwbGFjZWhvbGRlciB2ZXJz
aW9ucyIpLgo+Pgo+PiBDYzogQmrDtnJuIFTDtnBlbCA8Ympvcm4udG9wZWxAaW50ZWwuY29tPgo+
PiBDYzogTWFnbnVzIEthcmxzc29uIDxtYWdudXMua2FybHNzb25AaW50ZWwuY29tPgo+PiBDYzog
RGF2aWQgUy4gTWlsbGVyIDxkYXZlbUBkYXZlbWxvZnQubmV0Pgo+PiBDYzogbmV0ZGV2QHZnZXIu
a2VybmVsLm9yZwo+PiBTaWduZWQtb2ZmLWJ5OiBKb2huIEh1YmJhcmQgPGpodWJiYXJkQG52aWRp
YS5jb20+Cj4+IC0tLQo+PiAgIG5ldC94ZHAveGRwX3VtZW0uYyB8IDkgKy0tLS0tLS0tCj4+ICAg
MSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCA4IGRlbGV0aW9ucygtKQo+Pgo+PiBkaWZm
IC0tZ2l0IGEvbmV0L3hkcC94ZHBfdW1lbS5jIGIvbmV0L3hkcC94ZHBfdW1lbS5jCj4+IGluZGV4
IDgzZGU3NGNhNzI5YS4uMDMyNWExNzkxNWRlIDEwMDY0NAo+PiAtLS0gYS9uZXQveGRwL3hkcF91
bWVtLmMKPj4gKysrIGIvbmV0L3hkcC94ZHBfdW1lbS5jCj4+IEBAIC0xNjYsMTQgKzE2Niw3IEBA
IHZvaWQgeGRwX3VtZW1fY2xlYXJfZGV2KHN0cnVjdCB4ZHBfdW1lbSAqdW1lbSkKPj4gICAKPj4g
ICBzdGF0aWMgdm9pZCB4ZHBfdW1lbV91bnBpbl9wYWdlcyhzdHJ1Y3QgeGRwX3VtZW0gKnVtZW0p
Cj4+ICAgewo+PiAtCXVuc2lnbmVkIGludCBpOwo+PiAtCj4+IC0JZm9yIChpID0gMDsgaSA8IHVt
ZW0tPm5wZ3M7IGkrKykgewo+PiAtCQlzdHJ1Y3QgcGFnZSAqcGFnZSA9IHVtZW0tPnBnc1tpXTsK
Pj4gLQo+PiAtCQlzZXRfcGFnZV9kaXJ0eV9sb2NrKHBhZ2UpOwo+PiAtCQlwdXRfcGFnZShwYWdl
KTsKPj4gLQl9Cj4+ICsJcHV0X3VzZXJfcGFnZXNfZGlydHlfbG9jayh1bWVtLT5wZ3MsIHVtZW0t
Pm5wZ3MpOwo+IAo+IFdoYXQgaXMgdGhlIGRpZmZlcmVuY2UgYmV0d2VlbiB0aGlzIGFuZAo+IAo+
IF9fcHV0X3VzZXJfcGFnZXModW1lbS0+cGdzLCB1bWVtLT5ucGdzLCBQVVBfRkxBR1NfRElSVFlf
TE9DSyk7Cj4gCj4gPwoKTm8gZGlmZmVyZW5jZS4KCj4gCj4gSSdtIGEgYml0IGNvbmNlcm5lZCB3
aXRoIGFkZGluZyBhbm90aGVyIGZvcm0gb2YgdGhlIHNhbWUgaW50ZXJmYWNlLiAgV2Ugc2hvdWxk
Cj4gZWl0aGVyIGhhdmUgMSBjYWxsIHdpdGggZmxhZ3MgKGVudW0gaW4gdGhpcyBjYXNlKSBvciBt
dWx0aXBsZSBjYWxscy4gIEdpdmVuIHRoZQo+IHByZXZpb3VzIGRpc2N1c3Npb24gbGV0cyBtb3Zl
IGluIHRoZSBkaXJlY3Rpb24gb2YgaGF2aW5nIHRoZSBlbnVtIGJ1dCBkb24ndAo+IGludHJvZHVj
ZSBhbm90aGVyIGNhbGxlciBvZiB0aGUgIm9sZCIgaW50ZXJmYWNlLgoKSSBkaXNhZ3JlZSB0aGF0
IHRoaXMgaXMgYSAicHJvYmxlbSIuIFRoZXJlIGlzIG5vIG1haW50ZW5hbmNlIHBpdGZhbGwgaGVy
ZTsgdGhlcmUKYXJlIG1lcmVseSB0d28gd2F5cyB0byBjYWxsIHRoZSBwdXRfdXNlcl9wYWdlKigp
IEFQSS4gQm90aCBhcmUgY29ycmVjdCwgYW5kCm5laXRoZXIgb25lIHdpbGwgZ2V0IHlvdSBpbnRv
IHRyb3VibGUuCgpOb3Qgb25seSB0aGF0LCBidXQgdGhlcmUgaXMgYW1wbGUgcHJlY2VkZW50IGZv
ciB0aGlzIGFwcHJvYWNoIGluIG90aGVyCmtlcm5lbCBBUElzLgoKPiAKPiBTbyBJIHRoaW5rIG9u
IHRoaXMgcGF0Y2ggTkFLIGZyb20gbWUuCj4gCj4gSSBhbHNvIGRvbid0IGxpa2UgaGF2aW5nIGEg
X18qIGNhbGwgaW4gdGhlIGV4cG9ydGVkIGludGVyZmFjZSBidXQgdGhlcmUgaXMgYQo+IF9fZ2V0
X3VzZXJfcGFnZXNfZmFzdCgpIGNhbGwgc28gSSBndWVzcyB0aGVyZSBpcyBwcmVjZWRlbnQuICA6
LS8KPiAKCkkgdGhvdWdodCBhYm91dCB0aGlzIGNhcmVmdWxseSwgYW5kIGxvb2tlZCBhdCBvdGhl
ciBBUElzLiBBbmQgSSBub3RpY2VkIHRoYXQKdGhpbmdzIGxpa2UgX19nZXRfdXNlcl9wYWdlcyoo
KSBhcmUgaG93IGl0J3Mgb2Z0ZW4gZG9uZToKCiogVGhlIGxlYWRpbmcgdW5kZXJzY29yZXMgYXJl
IG9mdGVuIHVzZWQgZm9yIHRoZSBtb3JlIGVsYWJvcmF0ZSBmb3JtIG9mIHRoZQpjYWxsIChhcyBv
cHBwb3NlZCB0byBkZWNvcmF0aW5nIHRoZSBjb3JlIGZ1bmN0aW9uIG5hbWUgd2l0aCAiX2ZsYWdz
IiwgZm9yCmV4YW1wbGUpLgoKKiBUaGVyZSBhcmUgb2Z0ZW4gY2FsbHMgaW4gd2hpY2ggeW91IGNh
biBlaXRoZXIgY2FsbCB0aGUgc2ltcGxlciBmb3JtLCBvciB0aGUKZm9ybSB3aXRoIGZsYWdzIGFu
ZCBhZGRpdGlvbmFsIG9wdGlvbnMsIGFuZCB5ZXMsIHlvdSdsbCBnZXQgdGhlIHNhbWUgcmVzdWx0
LgoKT2J2aW91c2x5LCB0aGlzIHN0dWZmIGlzIGFsbCBzdWJqZWN0IHRvIGEgY2VydGFpbiBhbW91
bnQgb2Ygb3BpbmlvbiwgYnV0IEkKdGhpbmsgSSdtIG9uIHJlYWxseSBzb2xpZCBncm91bmQgYXMg
ZmFyIGFzIHByZWNlZGVudCBnb2VzLiBTbyBJJ20gcHVzaGluZwpiYWNrIG9uIHRoZSBOQUsuLi4g
OikKCnRoYW5rcywKLS0gCkpvaG4gSHViYmFyZApOVklESUEKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRl
dmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
