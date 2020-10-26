Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 67EAB2994BF
	for <lists+dri-devel@lfdr.de>; Mon, 26 Oct 2020 19:02:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 198286EA55;
	Mon, 26 Oct 2020 18:01:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from aserp2120.oracle.com (aserp2120.oracle.com [141.146.126.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 70D976E28B
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Oct 2020 17:02:29 +0000 (UTC)
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
 by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 09QGt29M030539;
 Mon, 26 Oct 2020 17:02:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=content-type :
 mime-version : subject : from : in-reply-to : date : cc :
 content-transfer-encoding : message-id : references : to;
 s=corp-2020-01-29; bh=44GDkLc6kJbDFvAd8EZbxYxwh8jmuWu+PJUUda+TNTU=;
 b=giUG0iJNhnf6C0MouW+Nny0iMj9i6GXMDm7rfyFf5LXLBN15gAS0uN/jBIJB51NCHeh5
 OGqO19z/4FXL/Wz64DcoBfY6wgpT0wPUIproBzKw8j4ULOFoyJgt5owROirY2TY6OAXr
 5ycrH/jtf11k58BBo7b85WopU43xtkEd5/nVWYUF5OUBBKZrNzhZg5ZySi6TgdeZ8SKm
 jYUW9OjD1TiR8lBbXQ3Dfp3ygCu+IiQnn0Bg0NHki1Q2wd9z7SkAeArwTokRUSF8Cdy0
 4pAvWoeSJg+6/4kBGwsgThWDBlnBLX3ncrpkFHLjJzRi1ZBFB9ftob6URKuhknKgE6Vv 4Q== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by aserp2120.oracle.com with ESMTP id 34cc7knr76-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Mon, 26 Oct 2020 17:02:22 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 09QGuLq1186614;
 Mon, 26 Oct 2020 17:00:22 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
 by aserp3030.oracle.com with ESMTP id 34cwuke7by-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 26 Oct 2020 17:00:22 +0000
Received: from abhmp0004.oracle.com (abhmp0004.oracle.com [141.146.116.10])
 by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 09QH0CI3009581;
 Mon, 26 Oct 2020 17:00:13 GMT
Received: from dhcp-10-159-254-24.vpn.oracle.com (/10.159.254.24)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Mon, 26 Oct 2020 10:00:12 -0700
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.120.23.2.1\))
Subject: Re: [PATCH 1/1] video: fbdev: fix divide error in fbcon_switch
From: Saeed Mirzamohammadi <saeed.mirzamohammadi@oracle.com>
In-Reply-To: <ad87c5c1-061d-8a81-7b2c-43a8687a464f@suse.de>
Date: Mon, 26 Oct 2020 10:00:11 -0700
Message-Id: <3294C797-1BBB-4410-812B-4A4BB813F002@oracle.com>
References: <20201021235758.59993-1-saeed.mirzamohammadi@oracle.com>
 <ad87c5c1-061d-8a81-7b2c-43a8687a464f@suse.de>
To: stable@vger.kernel.org
X-Mailer: Apple Mail (2.3608.120.23.2.1)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9786
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 mlxscore=0 bulkscore=0
 spamscore=0 adultscore=0 malwarescore=0 mlxlogscore=999 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2010260114
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9786
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 lowpriorityscore=0 adultscore=0
 malwarescore=0 spamscore=0 clxscore=1015 mlxscore=0 suspectscore=0
 priorityscore=1501 impostorscore=0 bulkscore=0 phishscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2010260114
X-Mailman-Approved-At: Mon, 26 Oct 2020 18:01:45 +0000
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
Cc: linux-fbdev@vger.kernel.org, b.zolnierkie@samsung.com,
 jani.nikula@intel.com, daniel.vetter@ffwll.ch, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, gustavoars@kernel.org,
 Thomas Zimmermann <tzimmermann@suse.de>, akpm@linux-foundation.org,
 rppt@kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhhbmtzLCBhZGRpbmcgc3RhYmxlLgoKU2FlZWQKCj4gT24gT2N0IDIyLCAyMDIwLCBhdCAxMjoz
NCBBTSwgVGhvbWFzIFppbW1lcm1hbm4gPHR6aW1tZXJtYW5uQHN1c2UuZGU+IHdyb3RlOgo+IAo+
IEhpCj4gCj4gT24gMjIuMTAuMjAgMDE6NTcsIHNhZWVkLm1pcnphbW9oYW1tYWRpQG9yYWNsZS5j
b20gd3JvdGU6Cj4+IEZyb206IFNhZWVkIE1pcnphbW9oYW1tYWRpIDxzYWVlZC5taXJ6YW1vaGFt
bWFkaUBvcmFjbGUuY29tPgo+PiAKPj4gVGhpcyBwYXRjaCBmaXhlcyB0aGUgaXNzdWUgZHVlIHRv
Ogo+PiAKPj4gWyAgIDg5LjU3Mjg4M10gZGl2aWRlX2Vycm9yOiAwMDAwIFsjMV0gU01QIEtBU0FO
IFBUSQo+PiBbICAgODkuNTcyODk3XSBDUFU6IDMgUElEOiAxNjA4MyBDb21tOiByZXBybyBOb3Qg
dGFpbnRlZCA1LjkuMC1yYzcuMjAyMDA5MzAucmMxLmFsbGFyY2gtMTktZzNlMzJkMGQuc3l6ayAj
NQo+PiBbICAgODkuNTcyOTAyXSBIYXJkd2FyZSBuYW1lOiBRRU1VIFN0YW5kYXJkIFBDIChpNDQw
RlggKyBQSUlYLCAxOTk2KSwgQklPUyAwLjUuMSAwMS8wMS8yMDExCj4+IFsgICA4OS41NzI5MzRd
IFJJUDogMDAxMDpjaXJydXNmYl9jaGVja192YXIrMHg4NC8weDEyNjAKPiAKPiBCVFcsIGlmIHlv
dSBydW4gcWVtdSB3aXRoIGNpcnJ1cywgdGhlcmUncyBhbHNvIGEgRFJNIGRyaXZlciBuYW1lZAo+
IGNpcnJ1cy5rby4gTWlnaHQgYmUgYSBiZXR0ZXIgY2hvaWNlIHRoYW4gdGhlIG9sZCBmYmRldiBk
cml2ZXIuIElmIHlvdQo+IGp1c3QgY2FyZSBhYm91dCBxZW11LCBidXQgbm90IHRoZSBhY3R1YWwg
Z3JhcGhpY3MgZGV2aWNlLCB0YWtlIGEgbG9vayBhdAo+IAo+ICBodHRwczovL3VybGRlZmVuc2Uu
Y29tL3YzL19faHR0cHM6Ly93d3cua3JheGVsLm9yZy9ibG9nLzIwMTQvMTAvcWVtdS11c2luZy1j
aXJydXMtY29uc2lkZXJlZC1oYXJtZnVsL19fOyEhR3FpdlBWYTdCcmlvIUxtZ2VNLXBWQlZIODB1
VkVMRjFQMW5CR0FiQWxodm54S0tFX1pyRWM5ZDc2QXpudkFBZ1AxRkFwM196TmEyZnJLYUlVWnRl
SyQgCj4gCj4gQW55d2F5LCB0aGFua3MgZm9yIHlvdXIgcGF0Y2guCj4gCj4gQmVzdCByZWdhcmRz
Cj4gVGhvbWFzCj4gCj4+IAo+PiBUaGUgZXJyb3IgaGFwcGVucyB3aGVuIHRoZSBwaXhlbHMgdmFs
dWUgaXMgY2FsY3VsYXRlZCBiZWZvcmUgcGVyZm9ybWluZyB0aGUgc2FuaXR5IGNoZWNrcyBvbiBi
aXRzX3Blcl9waXhlbC4KPj4gQSBiaXRzX3Blcl9waXhlbCBzZXQgdG8gemVybyBjYXVzZXMgZGl2
aWRlIGJ5IHplcm8gZXJyb3IuCj4+IAo+PiBUaGlzIHBhdGNoIG1vdmVzIHRoZSBjYWxjdWxhdGlv
biBhZnRlciB0aGUgc2FuaXR5IGNoZWNrLgo+PiAKPj4gU2lnbmVkLW9mZi1ieTogU2FlZWQgTWly
emFtb2hhbW1hZGkgPHNhZWVkLm1pcnphbW9oYW1tYWRpQG9yYWNsZS5jb20+Cj4+IFRlc3RlZC1i
eTogU2FlZWQgTWlyemFtb2hhbW1hZGkgPHNhZWVkLm1pcnphbW9oYW1tYWRpQG9yYWNsZS5jb20+
Cj4+IC0tLQo+PiBkcml2ZXJzL3ZpZGVvL2ZiZGV2L2NpcnJ1c2ZiLmMgfCAzICsrLQo+PiAxIGZp
bGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCj4+IAo+PiBkaWZmIC0t
Z2l0IGEvZHJpdmVycy92aWRlby9mYmRldi9jaXJydXNmYi5jIGIvZHJpdmVycy92aWRlby9mYmRl
di9jaXJydXNmYi5jCj4+IGluZGV4IDE1YTllZTdjZDczNC4uYTc3NDkxMDFiMDk0IDEwMDY0NAo+
PiAtLS0gYS9kcml2ZXJzL3ZpZGVvL2ZiZGV2L2NpcnJ1c2ZiLmMKPj4gKysrIGIvZHJpdmVycy92
aWRlby9mYmRldi9jaXJydXNmYi5jCj4+IEBAIC01MzEsNyArNTMxLDcgQEAgc3RhdGljIGludCBj
aXJydXNmYl9jaGVja192YXIoc3RydWN0IGZiX3Zhcl9zY3JlZW5pbmZvICp2YXIsCj4+IHsKPj4g
CWludCB5cmVzOwo+PiAJLyogbWVtb3J5IHNpemUgaW4gcGl4ZWxzICovCj4+IC0JdW5zaWduZWQg
cGl4ZWxzID0gaW5mby0+c2NyZWVuX3NpemUgKiA4IC8gdmFyLT5iaXRzX3Blcl9waXhlbDsKPj4g
Kwl1bnNpZ25lZCBpbnQgcGl4ZWxzOwo+PiAJc3RydWN0IGNpcnJ1c2ZiX2luZm8gKmNpbmZvID0g
aW5mby0+cGFyOwo+PiAKPj4gCXN3aXRjaCAodmFyLT5iaXRzX3Blcl9waXhlbCkgewo+PiBAQCAt
NTczLDYgKzU3Myw3IEBAIHN0YXRpYyBpbnQgY2lycnVzZmJfY2hlY2tfdmFyKHN0cnVjdCBmYl92
YXJfc2NyZWVuaW5mbyAqdmFyLAo+PiAJCXJldHVybiAtRUlOVkFMOwo+PiAJfQo+PiAKPj4gKwlw
aXhlbHMgPSBpbmZvLT5zY3JlZW5fc2l6ZSAqIDggLyB2YXItPmJpdHNfcGVyX3BpeGVsOwo+PiAJ
aWYgKHZhci0+eHJlc192aXJ0dWFsIDwgdmFyLT54cmVzKQo+PiAJCXZhci0+eHJlc192aXJ0dWFs
ID0gdmFyLT54cmVzOwo+PiAJLyogdXNlIGhpZ2hlc3QgcG9zc2libGUgdmlydHVhbCByZXNvbHV0
aW9uICovCj4+IAo+IAo+IC0tIAo+IFRob21hcyBaaW1tZXJtYW5uCj4gR3JhcGhpY3MgRHJpdmVy
IERldmVsb3Blcgo+IFNVU0UgU29mdHdhcmUgU29sdXRpb25zIEdlcm1hbnkgR21iSAo+IE1heGZl
bGRzdHIuIDUsIDkwNDA5IE7DvHJuYmVyZywgR2VybWFueQo+IChIUkIgMzY4MDksIEFHIE7DvHJu
YmVyZykKPiBHZXNjaMOkZnRzZsO8aHJlcjogRmVsaXggSW1lbmTDtnJmZmVyCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBs
aXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVz
a3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
