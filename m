Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C05A1807FF
	for <lists+dri-devel@lfdr.de>; Sat,  3 Aug 2019 21:11:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E7F06E0C2;
	Sat,  3 Aug 2019 19:10:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from pio-pvt-msa3.bahnhof.se (pio-pvt-msa3.bahnhof.se [79.136.2.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C996A6E0C2
 for <dri-devel@lists.freedesktop.org>; Sat,  3 Aug 2019 19:10:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by pio-pvt-msa3.bahnhof.se (Postfix) with ESMTP id 6A42E3F616;
 Sat,  3 Aug 2019 21:10:50 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bahnhof.se
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level: 
X-Spam-Status: No, score=-2.099 tagged_above=-999 required=6.31
 tests=[BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, URIBL_BLOCKED=0.001]
 autolearn=ham autolearn_force=no
Received: from pio-pvt-msa3.bahnhof.se ([127.0.0.1])
 by localhost (pio-pvt-msa3.bahnhof.se [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sz9Pv9uA3-kQ; Sat,  3 Aug 2019 21:10:37 +0200 (CEST)
Received: from mail1.shipmail.org (h-205-35.A357.priv.bahnhof.se
 [155.4.205.35]) (Authenticated sender: mb878879)
 by pio-pvt-msa3.bahnhof.se (Postfix) with ESMTPA id 81C153F58A;
 Sat,  3 Aug 2019 21:10:36 +0200 (CEST)
Received: from linlap1.host.shipmail.org (94.191.159.101.mobile.tre.se
 [94.191.159.101])
 by mail1.shipmail.org (Postfix) with ESMTPSA id 5943C36006D;
 Sat,  3 Aug 2019 21:10:35 +0200 (CEST)
Subject: Re: [PATCH v4 12/17] drm/vmwgfx: switch driver from bo->resv to
 bo->base.resv
To: Gerd Hoffmann <kraxel@redhat.com>, dri-devel@lists.freedesktop.org
References: <20190802052247.18427-1-kraxel@redhat.com>
 <20190802052247.18427-13-kraxel@redhat.com>
From: Thomas Hellstrom <thomas@shipmail.org>
Message-ID: <37ef501f-a962-bead-35bd-5f7e9e3fb38e@shipmail.org>
Date: Sat, 3 Aug 2019 21:10:34 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190802052247.18427-13-kraxel@redhat.com>
Content-Language: en-US
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=shipmail.org; s=mail; 
 t=1564859436; bh=t9VeR/VU7Ow5VEA74vJl+ITNBqmCkFNGjgY4leLgSXo=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=TMiecfdZynF6GJw5brMyR2OSoG/JowNY9vX0iDBTc/c4v0bk2OZ8n7RffczOcI9XE
 3EyrhXgJqgt1pKDPq1+Yyx7xIVwAgUpFuX+OWH552kr0otemEnuIhSLGb7ty8VD8/m
 O15YRcc04O2Qxta8mn73V/ntL5htrgvcYBvaYGUc=
X-Mailman-Original-Authentication-Results: pio-pvt-msa3.bahnhof.se;
 dkim=pass (1024-bit key;
 unprotected) header.d=shipmail.org header.i=@shipmail.org header.b=TMiecfdZ; 
 dkim-atps=neutral
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
Cc: Thomas Hellstrom <thellstrom@vmware.com>, tzimmermann@suse.de,
 David Airlie <airlied@linux.ie>, ckoenig.leichtzumerken@gmail.com,
 open list <linux-kernel@vger.kernel.org>,
 VMware Graphics <linux-graphics-maintainer@vmware.com>, bskeggs@redhat.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

U3RpbGwgZG9lc24ndCBsaWtlIHRoaXMgdmVyeSBtdWNoLCBidXQgYW55d2F5CgpBY2tlZC1ieTog
VGhvbWFzIEhlbGxzdHJvbSA8dGhlbGxzdHJvbUB2bXdhcmUuY29tPgoKT24gOC8yLzE5IDc6MjIg
QU0sIEdlcmQgSG9mZm1hbm4gd3JvdGU6Cj4gU2lnbmVkLW9mZi1ieTogR2VyZCBIb2ZmbWFubiA8
a3JheGVsQHJlZGhhdC5jb20+Cj4gLS0tCj4gICBkcml2ZXJzL2dwdS9kcm0vdm13Z2Z4L3Ztd2dm
eF9ibGl0LmMgICAgIHwgNCArKy0tCj4gICBkcml2ZXJzL2dwdS9kcm0vdm13Z2Z4L3Ztd2dmeF9i
by5jICAgICAgIHwgOCArKysrLS0tLQo+ICAgZHJpdmVycy9ncHUvZHJtL3Ztd2dmeC92bXdnZnhf
Y290YWJsZS5jICB8IDQgKystLQo+ICAgZHJpdmVycy9ncHUvZHJtL3Ztd2dmeC92bXdnZnhfcmVz
b3VyY2UuYyB8IDYgKysrLS0tCj4gICA0IGZpbGVzIGNoYW5nZWQsIDExIGluc2VydGlvbnMoKyks
IDExIGRlbGV0aW9ucygtKQo+Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS92bXdnZngv
dm13Z2Z4X2JsaXQuYyBiL2RyaXZlcnMvZ3B1L2RybS92bXdnZngvdm13Z2Z4X2JsaXQuYwo+IGlu
ZGV4IGZjNjY3M2NkZTI4OS4uOTE3ZWViNzkzNTg1IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1
L2RybS92bXdnZngvdm13Z2Z4X2JsaXQuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS92bXdnZngv
dm13Z2Z4X2JsaXQuYwo+IEBAIC00NTksOSArNDU5LDkgQEAgaW50IHZtd19ib19jcHVfYmxpdChz
dHJ1Y3QgdHRtX2J1ZmZlcl9vYmplY3QgKmRzdCwKPiAgIAo+ICAgCS8qIEJ1ZmZlciBvYmplY3Rz
IG5lZWQgdG8gYmUgZWl0aGVyIHBpbm5lZCBvciByZXNlcnZlZDogKi8KPiAgIAlpZiAoIShkc3Qt
Pm1lbS5wbGFjZW1lbnQgJiBUVE1fUExfRkxBR19OT19FVklDVCkpCj4gLQkJbG9ja2RlcF9hc3Nl
cnRfaGVsZCgmZHN0LT5yZXN2LT5sb2NrLmJhc2UpOwo+ICsJCWxvY2tkZXBfYXNzZXJ0X2hlbGQo
JmRzdC0+YmFzZS5yZXN2LT5sb2NrLmJhc2UpOwo+ICAgCWlmICghKHNyYy0+bWVtLnBsYWNlbWVu
dCAmIFRUTV9QTF9GTEFHX05PX0VWSUNUKSkKPiAtCQlsb2NrZGVwX2Fzc2VydF9oZWxkKCZzcmMt
PnJlc3YtPmxvY2suYmFzZSk7Cj4gKwkJbG9ja2RlcF9hc3NlcnRfaGVsZCgmc3JjLT5iYXNlLnJl
c3YtPmxvY2suYmFzZSk7Cj4gICAKPiAgIAlpZiAoZHN0LT50dG0tPnN0YXRlID09IHR0X3VucG9w
dWxhdGVkKSB7Cj4gICAJCXJldCA9IGRzdC0+dHRtLT5iZGV2LT5kcml2ZXItPnR0bV90dF9wb3B1
bGF0ZShkc3QtPnR0bSwgJmN0eCk7Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS92bXdn
Zngvdm13Z2Z4X2JvLmMgYi9kcml2ZXJzL2dwdS9kcm0vdm13Z2Z4L3Ztd2dmeF9iby5jCj4gaW5k
ZXggMGQ5NDc4ZDJlNzAwLi40YTM4YWIwNzMzYzQgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUv
ZHJtL3Ztd2dmeC92bXdnZnhfYm8uYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS92bXdnZngvdm13
Z2Z4X2JvLmMKPiBAQCAtMzQyLDcgKzM0Miw3IEBAIHZvaWQgdm13X2JvX3Bpbl9yZXNlcnZlZChz
dHJ1Y3Qgdm13X2J1ZmZlcl9vYmplY3QgKnZibywgYm9vbCBwaW4pCj4gICAJdWludDMyX3Qgb2xk
X21lbV90eXBlID0gYm8tPm1lbS5tZW1fdHlwZTsKPiAgIAlpbnQgcmV0Owo+ICAgCj4gLQlsb2Nr
ZGVwX2Fzc2VydF9oZWxkKCZiby0+cmVzdi0+bG9jay5iYXNlKTsKPiArCWxvY2tkZXBfYXNzZXJ0
X2hlbGQoJmJvLT5iYXNlLnJlc3YtPmxvY2suYmFzZSk7Cj4gICAKPiAgIAlpZiAocGluKSB7Cj4g
ICAJCWlmICh2Ym8tPnBpbl9jb3VudCsrID4gMCkKPiBAQCAtNjkwLDcgKzY5MCw3IEBAIHN0YXRp
YyBpbnQgdm13X3VzZXJfYm9fc3luY2NwdV9ncmFiKHN0cnVjdCB2bXdfdXNlcl9idWZmZXJfb2Jq
ZWN0ICp1c2VyX2JvLAo+ICAgCQlsb25nIGxyZXQ7Cj4gICAKPiAgIAkJbHJldCA9IHJlc2VydmF0
aW9uX29iamVjdF93YWl0X3RpbWVvdXRfcmN1Cj4gLQkJCShiby0+cmVzdiwgdHJ1ZSwgdHJ1ZSwK
PiArCQkJKGJvLT5iYXNlLnJlc3YsIHRydWUsIHRydWUsCj4gICAJCQkgbm9uYmxvY2sgPyAwIDog
TUFYX1NDSEVEVUxFX1RJTUVPVVQpOwo+ICAgCQlpZiAoIWxyZXQpCj4gICAJCQlyZXR1cm4gLUVC
VVNZOwo+IEBAIC0xMDA3LDEwICsxMDA3LDEwIEBAIHZvaWQgdm13X2JvX2ZlbmNlX3NpbmdsZShz
dHJ1Y3QgdHRtX2J1ZmZlcl9vYmplY3QgKmJvLAo+ICAgCj4gICAJaWYgKGZlbmNlID09IE5VTEwp
IHsKPiAgIAkJdm13X2V4ZWNidWZfZmVuY2VfY29tbWFuZHMoTlVMTCwgZGV2X3ByaXYsICZmZW5j
ZSwgTlVMTCk7Cj4gLQkJcmVzZXJ2YXRpb25fb2JqZWN0X2FkZF9leGNsX2ZlbmNlKGJvLT5yZXN2
LCAmZmVuY2UtPmJhc2UpOwo+ICsJCXJlc2VydmF0aW9uX29iamVjdF9hZGRfZXhjbF9mZW5jZShi
by0+YmFzZS5yZXN2LCAmZmVuY2UtPmJhc2UpOwo+ICAgCQlkbWFfZmVuY2VfcHV0KCZmZW5jZS0+
YmFzZSk7Cj4gICAJfSBlbHNlCj4gLQkJcmVzZXJ2YXRpb25fb2JqZWN0X2FkZF9leGNsX2ZlbmNl
KGJvLT5yZXN2LCAmZmVuY2UtPmJhc2UpOwo+ICsJCXJlc2VydmF0aW9uX29iamVjdF9hZGRfZXhj
bF9mZW5jZShiby0+YmFzZS5yZXN2LCAmZmVuY2UtPmJhc2UpOwo+ICAgfQo+ICAgCj4gICAKPiBk
aWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3Ztd2dmeC92bXdnZnhfY290YWJsZS5jIGIvZHJp
dmVycy9ncHUvZHJtL3Ztd2dmeC92bXdnZnhfY290YWJsZS5jCj4gaW5kZXggYjRmNmUxMjE3Yzlk
Li5lMTQyNzE0ZjEzMmMgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3Ztd2dmeC92bXdn
ZnhfY290YWJsZS5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3Ztd2dmeC92bXdnZnhfY290YWJs
ZS5jCj4gQEAgLTE2OSw3ICsxNjksNyBAQCBzdGF0aWMgaW50IHZtd19jb3RhYmxlX3Vuc2NydWIo
c3RydWN0IHZtd19yZXNvdXJjZSAqcmVzKQo+ICAgCX0gKmNtZDsKPiAgIAo+ICAgCVdBUk5fT05f
T05DRShiby0+bWVtLm1lbV90eXBlICE9IFZNV19QTF9NT0IpOwo+IC0JbG9ja2RlcF9hc3NlcnRf
aGVsZCgmYm8tPnJlc3YtPmxvY2suYmFzZSk7Cj4gKwlsb2NrZGVwX2Fzc2VydF9oZWxkKCZiby0+
YmFzZS5yZXN2LT5sb2NrLmJhc2UpOwo+ICAgCj4gICAJY21kID0gVk1XX0ZJRk9fUkVTRVJWRShk
ZXZfcHJpdiwgc2l6ZW9mKCpjbWQpKTsKPiAgIAlpZiAoIWNtZCkKPiBAQCAtMzExLDcgKzMxMSw3
IEBAIHN0YXRpYyBpbnQgdm13X2NvdGFibGVfdW5iaW5kKHN0cnVjdCB2bXdfcmVzb3VyY2UgKnJl
cywKPiAgIAkJcmV0dXJuIDA7Cj4gICAKPiAgIAlXQVJOX09OX09OQ0UoYm8tPm1lbS5tZW1fdHlw
ZSAhPSBWTVdfUExfTU9CKTsKPiAtCWxvY2tkZXBfYXNzZXJ0X2hlbGQoJmJvLT5yZXN2LT5sb2Nr
LmJhc2UpOwo+ICsJbG9ja2RlcF9hc3NlcnRfaGVsZCgmYm8tPmJhc2UucmVzdi0+bG9jay5iYXNl
KTsKPiAgIAo+ICAgCW11dGV4X2xvY2soJmRldl9wcml2LT5iaW5kaW5nX211dGV4KTsKPiAgIAlp
ZiAoIXZjb3RibC0+c2NydWJiZWQpCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS92bXdn
Zngvdm13Z2Z4X3Jlc291cmNlLmMgYi9kcml2ZXJzL2dwdS9kcm0vdm13Z2Z4L3Ztd2dmeF9yZXNv
dXJjZS5jCj4gaW5kZXggMWQzOGE4YjJmMmVjLi5jY2Q3Zjc1OGJmOGMgMTAwNjQ0Cj4gLS0tIGEv
ZHJpdmVycy9ncHUvZHJtL3Ztd2dmeC92bXdnZnhfcmVzb3VyY2UuYwo+ICsrKyBiL2RyaXZlcnMv
Z3B1L2RybS92bXdnZngvdm13Z2Z4X3Jlc291cmNlLmMKPiBAQCAtNDAyLDE0ICs0MDIsMTQgQEAg
dm9pZCB2bXdfcmVzb3VyY2VfdW5yZXNlcnZlKHN0cnVjdCB2bXdfcmVzb3VyY2UgKnJlcywKPiAg
IAo+ICAgCWlmIChzd2l0Y2hfYmFja3VwICYmIG5ld19iYWNrdXAgIT0gcmVzLT5iYWNrdXApIHsK
PiAgIAkJaWYgKHJlcy0+YmFja3VwKSB7Cj4gLQkJCWxvY2tkZXBfYXNzZXJ0X2hlbGQoJnJlcy0+
YmFja3VwLT5iYXNlLnJlc3YtPmxvY2suYmFzZSk7Cj4gKwkJCWxvY2tkZXBfYXNzZXJ0X2hlbGQo
JnJlcy0+YmFja3VwLT5iYXNlLmJhc2UucmVzdi0+bG9jay5iYXNlKTsKPiAgIAkJCWxpc3RfZGVs
X2luaXQoJnJlcy0+bW9iX2hlYWQpOwo+ICAgCQkJdm13X2JvX3VucmVmZXJlbmNlKCZyZXMtPmJh
Y2t1cCk7Cj4gICAJCX0KPiAgIAo+ICAgCQlpZiAobmV3X2JhY2t1cCkgewo+ICAgCQkJcmVzLT5i
YWNrdXAgPSB2bXdfYm9fcmVmZXJlbmNlKG5ld19iYWNrdXApOwo+IC0JCQlsb2NrZGVwX2Fzc2Vy
dF9oZWxkKCZuZXdfYmFja3VwLT5iYXNlLnJlc3YtPmxvY2suYmFzZSk7Cj4gKwkJCWxvY2tkZXBf
YXNzZXJ0X2hlbGQoJm5ld19iYWNrdXAtPmJhc2UuYmFzZS5yZXN2LT5sb2NrLmJhc2UpOwo+ICAg
CQkJbGlzdF9hZGRfdGFpbCgmcmVzLT5tb2JfaGVhZCwgJm5ld19iYWNrdXAtPnJlc19saXN0KTsK
PiAgIAkJfSBlbHNlIHsKPiAgIAkJCXJlcy0+YmFja3VwID0gTlVMTDsKPiBAQCAtNjkxLDcgKzY5
MSw3IEBAIHZvaWQgdm13X3Jlc291cmNlX3VuYmluZF9saXN0KHN0cnVjdCB2bXdfYnVmZmVyX29i
amVjdCAqdmJvKQo+ICAgCQkubnVtX3NoYXJlZCA9IDAKPiAgIAl9Owo+ICAgCj4gLQlsb2NrZGVw
X2Fzc2VydF9oZWxkKCZ2Ym8tPmJhc2UucmVzdi0+bG9jay5iYXNlKTsKPiArCWxvY2tkZXBfYXNz
ZXJ0X2hlbGQoJnZiby0+YmFzZS5iYXNlLnJlc3YtPmxvY2suYmFzZSk7Cj4gICAJbGlzdF9mb3Jf
ZWFjaF9lbnRyeV9zYWZlKHJlcywgbmV4dCwgJnZiby0+cmVzX2xpc3QsIG1vYl9oZWFkKSB7Cj4g
ICAJCWlmICghcmVzLT5mdW5jLT51bmJpbmQpCj4gICAJCQljb250aW51ZTsKCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBs
aXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVz
a3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
