Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F3C9247512
	for <lists+dri-devel@lfdr.de>; Sun, 16 Jun 2019 16:03:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4FE3089276;
	Sun, 16 Jun 2019 14:02:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from hqemgate16.nvidia.com (hqemgate16.nvidia.com [216.228.121.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 15B8B8935C;
 Fri, 14 Jun 2019 17:48:17 +0000 (UTC)
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
 hqemgate16.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5d03dde00000>; Fri, 14 Jun 2019 10:48:16 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate101.nvidia.com (PGP Universal service);
 Fri, 14 Jun 2019 10:48:16 -0700
X-PGP-Universal: processed;
 by hqpgpgate101.nvidia.com on Fri, 14 Jun 2019 10:48:16 -0700
Received: from [10.110.48.28] (172.20.13.39) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 14 Jun
 2019 17:48:14 +0000
Subject: Re: [PATCH] drm/nouveau/dmem: missing mutex_lock in error path
To: Ralph Campbell <rcampbell@nvidia.com>, Jerome Glisse <jglisse@redhat.com>, 
 David Airlie <airlied@linux.ie>, Ben Skeggs <bskeggs@redhat.com>, "Jason
 Gunthorpe" <jgg@mellanox.com>
References: <20190614001121.23950-1-rcampbell@nvidia.com>
 <1fc63655-985a-0d60-523f-00a51648dc38@nvidia.com>
 <f67784db-dada-c827-f231-35549fc046dc@nvidia.com>
X-Nvconfidentiality: public
From: John Hubbard <jhubbard@nvidia.com>
Message-ID: <6e412091-faf4-64b6-bcd8-95193b11a6ec@nvidia.com>
Date: Fri, 14 Jun 2019 10:48:13 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <f67784db-dada-c827-f231-35549fc046dc@nvidia.com>
X-Originating-IP: [172.20.13.39]
X-ClientProxiedBy: HQMAIL106.nvidia.com (172.18.146.12) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Language: en-US
X-Mailman-Approved-At: Sun, 16 Jun 2019 14:01:48 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nvidia.com; s=n1; 
 t=1560534496; bh=8ZilaY5NOYwAFhaPvzhLk/MxmC8VICubaNjNx3N4a0o=;
 h=X-PGP-Universal:Subject:To:CC:References:X-Nvconfidentiality:From:
 Message-ID:Date:User-Agent:MIME-Version:In-Reply-To:
 X-Originating-IP:X-ClientProxiedBy:Content-Type:Content-Language:
 Content-Transfer-Encoding;
 b=mFSmNdWdXrunL+Kmfxc2GVVcBRexDPEWN8Cf9I5nt85sOkU+bpOYcsFznhq/NaaeX
 a5iKxXQ2H9+C9AGr3nzU5XEjAX2ZDLPo0DxYeTQD+ID7+125ebw8k9BdVWuuwQ9MEK
 6gTPjhKY8ZBko1repTxcCB7eqT6Kzv3hFJgAFJefMAJFYF/n4hpe5mXW5wc6tTTPl9
 YocB5IVfiwI2RQEvosnpfO4NcI8dsS1obRGYloyAYJTYyA2VZ5pkZu23SjLUJ/eS9C
 yWds3z5rmjGyRmqsXnVxfjqtmHjBJzI9otX3ep/mV2T9yxsJvt7TCG1A5+06qZWnIu
 j28SxoSKocCEQ==
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
Cc: nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-mm@kvack.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gNi8xNC8xOSAxMDozOSBBTSwgUmFscGggQ2FtcGJlbGwgd3JvdGU6Cj4gT24gNi8xMy8xOSA1
OjQ5IFBNLCBKb2huIEh1YmJhcmQgd3JvdGU6Cj4+IE9uIDYvMTMvMTkgNToxMSBQTSwgUmFscGgg
Q2FtcGJlbGwgd3JvdGU6Ci4uLgo+PiBBY3R1YWxseSwgdGhlIHByZS1leGlzdGluZyBjb2RlIGlz
IGEgbGl0dGxlIGNvbmNlcm5pbmcuIFlvdXIgY2hhbmdlIHByZXNlcnZlcwo+PiB0aGUgYmVoYXZp
b3IsIGJ1dCBpdCBzZWVtcyBxdWVzdGlvbmFibGUgdG8gYmUgZG9pbmcgYSAicmV0dXJuIDAiICh3
aGV0aGVyCj4+IHZpYSB0aGUgYWJvdmUgYnJlYWssIG9yIHlvdXIgY2hhbmdlKSB3aGVuIGl0J3Mg
aW4gdGhpcyBwYXJ0aWFsbHkgYWxsb2NhdGVkCj4+IHN0YXRlLiBJdCdzIHJlcG9ydGluZyBzdWNj
ZXNzIHdoZW4gaXQgb25seSBhbGxvY2F0ZXMgcGFydCBvZiB3aGF0IHdhcyByZXF1ZXN0ZWQsCj4+
IGFuZCBpdCBkb2Vzbid0IGZpbGwgaW4gdGhlIHBhZ2VzIGFycmF5IGVpdGhlci4KPj4KPj4KPj4K
Pj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCByZXR1cm4gMDsKPj4+
IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcmV0dXJuIHJldDsKPj4+IMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgIH0KPj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIG11dGV4
X2xvY2soJmRybS0+ZG1lbS0+bXV0ZXgpOwo+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAg
Y29udGludWU7Cj4+PiDCoMKgwqDCoMKgwqDCoMKgwqAgfQo+Pj4gwqAKPj4KPj4gVGhlIGFib3Zl
IGNvbW1lbnQgaXMgYWJvdXQgcHJlLWV4aXN0aW5nIHBvdGVudGlhbCBwcm9ibGVtcywgYnV0IHlv
dXIgcGF0Y2ggaXRzZWxmCj4+IGxvb2tzIGNvcnJlY3QsIHNvOgo+Pgo+PiBSZXZpZXdlZC1ieTog
Sm9obiBIdWJiYXJkIDxqaHViYmFyZEBudmlkaWEuY29tPgo+Pgo+Pgo+PiB0aGFua3MsCj4+Cj4g
VGhlIGNyYXNoIHdhcyB0aGUgTlVMTCBwb2ludGVyIGJ1ZyBpbiBDaHJpc3RvcGgncyBwYXRjaCAj
MTAuCj4gSSBzZW50IGEgc2VwYXJhdGUgcmVwbHkgZm9yIHRoYXQuCj4gCj4gQmVsb3cgaXMgdGhl
IGNvbnNvbGUgb3V0cHV0IEkgZ290LCB0aGVuIEkgbWFkZSB0aGUgY2hhbmdlcyBqdXN0IGJhc2Vk
IG9uCj4gY29kZSBpbnNwZWN0aW9uLiBEbyB5b3UgdGhpbmsgSSBzaG91bGQgaW5jbHVkZSBpdCBp
biB0aGUgY2hhbmdlIGxvZz8KClllcywgSSB0aGluayBpdCdzIGdvb2QgdG8gaGF2ZSBpdCBpbiB0
aGVyZS4gSWYgeW91IGxvb2sgYXQgZ2l0IGxvZywKeW91J2xsIHNlZSB0aGF0IGl0J3MgY29tbW9u
IHRvIGluY2x1ZGUgdGhlIHN5bXB0b21zLCBpbmNsdWRpbmcgdGhlCmJhY2t0cmFjZS4gSXQgaGVs
cHMgcGVvcGxlIHNlZSBpZiB0aGV5IGFyZSBoaXR0aW5nIHRoZSBzYW1lIHByb2JsZW0sCmZvciBv
bmUgdGhpbmcuCgo+IAo+IEFzIGZvciB0aGUgInJldHVybiAwIiwgSWYgeW91IGZvbGxvdyB0aGUg
Y2FsbCBjaGFpbiwKPiBub3V2ZWF1X2RtZW1fcGFnZXNfYWxsb2MoKSBpcyBvbmx5IGV2ZXIgY2Fs
bGVkIGZvciBvbmUgcGFnZSBzbyB0aGlzCj4gY3VycmVudGx5ICJ3b3JrcyIgYnV0IEkgYWdyZWUg
aXQgaXMgYSBiaXQgb2YgYSB0aW1lIGJvbWIuIFRoZXJlIGFyZSBhCj4gbnVtYmVyIG9mIG90aGVy
IGJ1Z3MgdGhhdCBJIGNhbiBzZWUgdGhhdCBuZWVkIGZpeGluZyBidXQgSSB0aGluayB0aG9zZQo+
IHNob3VsZCBiZSBzZXBhcmF0ZSBwYXRjaGVzLgo+IAoKWWVzIG9mIGNvdXJzZS4gSSBjYWxsZWQg
aXQgb3V0IGZvciB0aGUgYmVuZWZpdCBvZiB0aGUgZW1haWwgbGlzdCwgbm90IHRvCnNheSB0aGF0
IHlvdXIgcGF0Y2ggbmVlZHMgYW55IGNoYW5nZXMuIAoKdGhhbmtzLAotLSAKSm9obiBIdWJiYXJk
Ck5WSURJQQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpk
cmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
