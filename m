Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BFF491103E6
	for <lists+dri-devel@lfdr.de>; Tue,  3 Dec 2019 18:57:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 95BED6EA58;
	Tue,  3 Dec 2019 17:57:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from aserp2120.oracle.com (aserp2120.oracle.com [141.146.126.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B7DDA6E86C
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Dec 2019 17:57:44 +0000 (UTC)
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
 by aserp2120.oracle.com (8.16.0.27/8.16.0.27) with SMTP id xB3HiHOY078346;
 Tue, 3 Dec 2019 17:57:42 GMT
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by aserp2120.oracle.com with ESMTP id 2wkgcq9drj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 03 Dec 2019 17:57:42 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.0.27/8.16.0.27) with SMTP id xB3Hi4LE034999;
 Tue, 3 Dec 2019 17:55:42 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
 by aserp3020.oracle.com with ESMTP id 2wnb80h3x5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 03 Dec 2019 17:55:42 +0000
Received: from abhmp0019.oracle.com (abhmp0019.oracle.com [141.146.116.25])
 by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id xB3HtdFk016993;
 Tue, 3 Dec 2019 17:55:39 GMT
Received: from dhcp-10-154-129-170.vpn.oracle.com (/10.154.129.170)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Tue, 03 Dec 2019 09:55:38 -0800
Mime-Version: 1.0 (Mac OS X Mail 11.5 \(3445.9.1\))
Subject: Re: [PATCH 3/4] drm/mgag200: Add workaround for HW that does not
 support 'startadd'
From: John Donnelly <john.p.donnelly@oracle.com>
In-Reply-To: <8099fad7-6b74-e769-9431-900a531c5d11@suse.de>
Date: Tue, 3 Dec 2019 11:55:35 -0600
Message-Id: <0FB4179F-B299-41A9-A75A-EF9294E0DD17@oracle.com>
References: <20191126072545.22663-1-tzimmermann@suse.de>
 <20191126072545.22663-4-tzimmermann@suse.de>
 <20191126093710.GR29965@phenom.ffwll.local>
 <8099fad7-6b74-e769-9431-900a531c5d11@suse.de>
To: Thomas Zimmermann <tzimmermann@suse.de>
X-Mailer: Apple Mail (2.3445.9.1)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9460
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1911140001 definitions=main-1912030134
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9460
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1911140001
 definitions=main-1912030134
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.com; h=content-type :
 mime-version : subject : from : in-reply-to : date : cc :
 content-transfer-encoding : message-id : references : to;
 s=corp-2019-08-05; bh=r38uEdNFmcsO0Eh49Ey5ovN0UiLLtqXUTGAazsZIMmU=;
 b=lQ7m1dN7eB2VjrL/BhIyxyHr0Qep+/V3iWPSPP9p0qkSNDYUQwGpLA6dk3Kqmyjqz9Lr
 Gxbu4xjRtmlvk0+dopZWnY0XhSQS1/sKzaUVs0o798IPz03dvWxXVn2+ZPjkB6GE7Ht1
 YTbdVOKS2//Nxux6GmqcSRkR6x/WKm5P46CiuvPLz+sHnr8OzNWBBI3ADqucZQd7MvFW
 v3IsSMUPUMN4rElO2j9sz02TyVVPCRTnQuDF+0MeTILQ0PAzfvFjdfcR7bmEKDNndMZy
 FaDNR4DDJjzDUiDUEmddPWTCNWSS5SXFYfsKWUpPDHv0i6Cw2xvQGUHtvLdxDT28Hy+m pA== 
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
Cc: airlied@redhat.com, dri-devel@lists.freedesktop.org, sam@ravnborg.org,
 kraxel@redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgLAoKU2VlIGJlbG93ICwKCgo+IE9uIE5vdiAyNiwgMjAxOSwgYXQgMzo1MCBBTSwgVGhvbWFz
IFppbW1lcm1hbm4gPHR6aW1tZXJtYW5uQHN1c2UuZGU+IHdyb3RlOgo+IAo+IEhpCj4gCj4gQW0g
MjYuMTEuMTkgdW0gMTA6Mzcgc2NocmllYiBEYW5pZWwgVmV0dGVyOgo+PiBPbiBUdWUsIE5vdiAy
NiwgMjAxOSBhdCAwODoyNTo0NEFNICswMTAwLCBUaG9tYXMgWmltbWVybWFubiB3cm90ZToKPj4+
IFRoZXJlJ3MgYXQgbGVhc3Qgb25lIHN5c3RlbSB0aGF0IGRvZXMgbm90IGludGVycHJldCB0aGUg
dmFsdWUgb2YKPj4+IHRoZSBkZXZpY2UncyAnc3RhcnRhZGQnIGZpZWxkIGNvcnJlY3RseSwgd2hp
Y2ggbGVhZHMgdG8gaW5jb3JyZWN0bHkKPj4+IGRpc3BsYXllZCBzY2Fub3V0IGJ1ZmZlcnMuIEFs
d2F5cyBwbGFjaW5nIHRoZSBhY3RpdmUgc2Nhbm91dCBidWZmZXIKPj4+IGF0IG9mZnNldCAwIHdv
cmtzIGFyb3VuZCB0aGUgcHJvYmxlbS4KPj4+IAo+Pj4gU2lnbmVkLW9mZi1ieTogVGhvbWFzIFpp
bW1lcm1hbm4gPHR6aW1tZXJtYW5uQHN1c2UuZGU+Cj4+PiBSZXBvcnRlZC1ieTogSm9obiBEb25u
ZWxseSA8am9obi5wLmRvbm5lbGx5QG9yYWNsZS5jb20+Cj4+PiBMaW5rOiBodHRwczovL2dpdGxh
Yi5mcmVlZGVza3RvcC5vcmcvZHJtL21pc2MvaXNzdWVzLzcKPj4gCj4+IFRlc3RlZC1ieTogSm9o
biBEb25uZWxseSA8am9obi5wLmRvbm5lbGx5QG9yYWNsZS5jb20+Cj4+IAo+PiAoTm90IHF1aXRl
IHRoaXMgcGF0Y2gsIGJ1dCBwcmV0dHkgbXVjaCB0aGUgbG9naWMsIHNvIGNvdW50cykuCj4+IAo+
PiBGaXhlczogODFkYTg3ZjYzYTFlICgiZHJtOiBSZXBsYWNlIGRybV9nZW1fdnJhbV9wdXNoX3Rv
X3N5c3RlbSgpIHdpdGgga3VubWFwICsgdW5waW4iKQo+PiBDYzogPHN0YWJsZUB2Z2VyLmtlcm5l
bC5vcmc+ICMgdjUuMysKPj4gCj4+IEFsc28geW91IG5lZWQgdGhlIHN0YWJsZSBsaW5lIG9uIGJv
dGggcHJlcCBwYXRjaGVzIHRvby4gRm9yIG5leHQgdGltZQo+PiBhcm91bmQsCj4+IAo+PiAkIGRp
bSBmaXhlcyA4MWRhODdmNjNhMWUKPj4gCj4+IHdpbGwgZ2VuZXJhdGUgYWxsIHRoZSBzdHVmZiB5
b3UgbmVlZCwgaW5jbHVkaW5nIGEgZ29vZCBzZXQgb2Ygc3VnZ2VzdGVkCj4+IENjOiB5b3Ugc2hv
dWxkIGhhdmUuCj4+IAo+PiBPbiB0aGUgZmlyc3QgMyBwYXRjaGVzLCB3aXRoIGFsbCB0aGF0IHN0
dWZmIGFkZGVkOgo+PiAKPj4gUmV2aWV3ZWQtYnk6IERhbmllbCBWZXR0ZXIgPGRhbmllbC52ZXR0
ZXJAZmZ3bGwuY2g+Cj4gCj4gVGhhbmtzIGZvciB0aGUgcmV2aWV3Lgo+IAo+IFNvcnJ5IGZvciBs
ZWF2aW5nIG91dCBzb21lIG9mIHRoZSB0YWdzLiBJIHdhbnRlZCB0byB3YWl0IGZvciBmZWVkYmFj
awo+IGJlZm9yZSBhZGRpbmcgdGVzdGVkLWJ5LCBmaXhlcywgc3RhYmxlLiBJJ2xsIHNwbGl0IG9m
ZiBwYXRjaCA0IGZyb20gdGhlCj4gc2VyaWVzIGFuZCBnZXQgMSB0byAzIG1lcmdlZCBBU0FQLgo+
IAo+IEJlc3QgcmVnYXJkcwo+IFRob21hcwo+IAo+PiAKPj4gUGxlYXNlIHB1c2ggdGhlc2UgdG8g
ZHJtLW1pc2MtbmV4dC1maXhlcyBzbyB0aGV5IGdldCBiYWNrcG9ydGVkIGFzIHF1aWNrbHkKPj4g
YXMgcG9zc2libGUuCj4+IC1EYW5pZWwKPj4gCj4+PiAtLS0KPj4+IGRyaXZlcnMvZ3B1L2RybS9t
Z2FnMjAwL21nYWcyMDBfZHJ2LmMgfCAzNiArKysrKysrKysrKysrKysrKysrKysrKysrKy0KPj4+
IGRyaXZlcnMvZ3B1L2RybS9tZ2FnMjAwL21nYWcyMDBfZHJ2LmggfCAgMyArKysKPj4+IDIgZmls
ZXMgY2hhbmdlZCwgMzggaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQo+Pj4gCj4+PiBkaWZm
IC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL21nYWcyMDAvbWdhZzIwMF9kcnYuYyBiL2RyaXZlcnMv
Z3B1L2RybS9tZ2FnMjAwL21nYWcyMDBfZHJ2LmMKPj4+IGluZGV4IDM5N2Y4YjBhOWFmOC4uZDQz
OTUxY2FlZWEwIDEwMDY0NAo+Pj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL21nYWcyMDAvbWdhZzIw
MF9kcnYuYwo+Pj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL21nYWcyMDAvbWdhZzIwMF9kcnYuYwo+
Pj4gQEAgLTMwLDYgKzMwLDggQEAgbW9kdWxlX3BhcmFtX25hbWVkKG1vZGVzZXQsIG1nYWcyMDBf
bW9kZXNldCwgaW50LCAwNDAwKTsKPj4+IHN0YXRpYyBzdHJ1Y3QgZHJtX2RyaXZlciBkcml2ZXI7
Cj4+PiAKPj4+IHN0YXRpYyBjb25zdCBzdHJ1Y3QgcGNpX2RldmljZV9pZCBwY2lpZGxpc3RbXSA9
IHsKPj4+ICsJeyBQQ0lfVkVORE9SX0lEX01BVFJPWCwgMHg1MjIsIFBDSV9WRU5ET1JfSURfU1VO
LCAweDQ4NTIsIDAsIDAsCj4+PiArCQlHMjAwX1NFX0EgfCBNR0FHMjAwX0ZMQUdfSFdfQlVHX05P
X1NUQVJUQUREfSwKCgoKSSB3aWxsIGhhdmUgYW4gYWRkaXRpb25hbCBsaXN0IG9mIHZlbmRvciBJ
RHMgKDB4NDg1MikgIEkgd2lsbCBwcm92aWRlIGluIGEgZm9sbG93IHVwIHBhdGNoIHNob3J0bHkg
LiAgVGhpcyBmaXhlcyBvbmx5IDEgZmxhdm9yICBvZiBzZXJ2ZXIuCgoKVGhhbmsgeW91IC4KCgoK
CgoKPj4+IAl7IFBDSV9WRU5ET1JfSURfTUFUUk9YLCAweDUyMiwgUENJX0FOWV9JRCwgUENJX0FO
WV9JRCwgMCwgMCwgRzIwMF9TRV9BIH0sCj4+PiAJeyBQQ0lfVkVORE9SX0lEX01BVFJPWCwgMHg1
MjQsIFBDSV9BTllfSUQsIFBDSV9BTllfSUQsIDAsIDAsIEcyMDBfU0VfQiB9LAo+Pj4gCXsgUENJ
X1ZFTkRPUl9JRF9NQVRST1gsIDB4NTMwLCBQQ0lfQU5ZX0lELCBQQ0lfQU5ZX0lELCAwLCAwLCBH
MjAwX0VWIH0sCj4+PiBAQCAtNjAsNiArNjIsMzUgQEAgc3RhdGljIHZvaWQgbWdhX3BjaV9yZW1v
dmUoc3RydWN0IHBjaV9kZXYgKnBkZXYpCj4+PiAKPj4+IERFRklORV9EUk1fR0VNX0ZPUFMobWdh
ZzIwMF9kcml2ZXJfZm9wcyk7Cj4+PiAKPj4+ICtzdGF0aWMgYm9vbCBtZ2FnMjAwX3Bpbl9ib19h
dF8wKGNvbnN0IHN0cnVjdCBtZ2FfZGV2aWNlICptZGV2KQo+Pj4gK3sKPj4+ICsJcmV0dXJuIG1k
ZXYtPmZsYWdzICYgTUdBRzIwMF9GTEFHX0hXX0JVR19OT19TVEFSVEFERDsKPj4+ICt9Cj4+PiAr
Cj4+PiAraW50IG1nYWcyMDBfZHJpdmVyX2R1bWJfY3JlYXRlKHN0cnVjdCBkcm1fZmlsZSAqZmls
ZSwKPj4+ICsJCQkgICAgICAgc3RydWN0IGRybV9kZXZpY2UgKmRldiwKPj4+ICsJCQkgICAgICAg
c3RydWN0IGRybV9tb2RlX2NyZWF0ZV9kdW1iICphcmdzKQo+Pj4gK3sKPj4+ICsJc3RydWN0IG1n
YV9kZXZpY2UgKm1kZXYgPSBkZXYtPmRldl9wcml2YXRlOwo+Pj4gKwl1bnNpZ25lZCBsb25nIHBn
X2FsaWduOwo+Pj4gKwo+Pj4gKwlpZiAoV0FSTl9PTkNFKCFkZXYtPnZyYW1fbW0sICJWUkFNIE1N
IG5vdCBpbml0aWFsaXplZCIpKQo+Pj4gKwkJcmV0dXJuIC1FSU5WQUw7Cj4+PiArCj4+PiArCXBn
X2FsaWduID0gMHVsOwo+Pj4gKwo+Pj4gKwkvKgo+Pj4gKwkgKiBBbGlnbmluZyBzY2Fub3V0IGJ1
ZmZlcnMgdG8gdGhlIHNpemUgb2YgdGhlIHZpZGVvIHJhbSBmb3JjZXMKPj4+ICsJICogcGxhY2Vt
ZW50IGF0IG9mZnNldCAwLiBXb3JrcyBhcm91bmQgYSBidWcgd2hlcmUgSFcgZG9lcyBub3QKPj4+
ICsJICogcmVzcGVjdCAnc3RhcnRhZGQnIGZpZWxkLgo+Pj4gKwkgKi8KPj4+ICsJaWYgKG1nYWcy
MDBfcGluX2JvX2F0XzAobWRldikpCj4+PiArCQlwZ19hbGlnbiA9IFBGTl9VUChtZGV2LT5tYy52
cmFtX3NpemUpOwo+Pj4gKwo+Pj4gKwlyZXR1cm4gZHJtX2dlbV92cmFtX2ZpbGxfY3JlYXRlX2R1
bWIoZmlsZSwgZGV2LCAmZGV2LT52cmFtX21tLT5iZGV2LAo+Pj4gKwkJCQkJICAgICBwZ19hbGln
biwgZmFsc2UsIGFyZ3MpOwo+Pj4gK30KPj4+ICsKPj4+IHN0YXRpYyBzdHJ1Y3QgZHJtX2RyaXZl
ciBkcml2ZXIgPSB7Cj4+PiAJLmRyaXZlcl9mZWF0dXJlcyA9IERSSVZFUl9HRU0gfCBEUklWRVJf
TU9ERVNFVCwKPj4+IAkubG9hZCA9IG1nYWcyMDBfZHJpdmVyX2xvYWQsCj4+PiBAQCAtNzEsNyAr
MTAyLDEwIEBAIHN0YXRpYyBzdHJ1Y3QgZHJtX2RyaXZlciBkcml2ZXIgPSB7Cj4+PiAJLm1ham9y
ID0gRFJJVkVSX01BSk9SLAo+Pj4gCS5taW5vciA9IERSSVZFUl9NSU5PUiwKPj4+IAkucGF0Y2hs
ZXZlbCA9IERSSVZFUl9QQVRDSExFVkVMLAo+Pj4gLQlEUk1fR0VNX1ZSQU1fRFJJVkVSCj4+PiAr
CS5kZWJ1Z2ZzX2luaXQgPSBkcm1fdnJhbV9tbV9kZWJ1Z2ZzX2luaXQsCj4+PiArCS5kdW1iX2Ny
ZWF0ZSA9IG1nYWcyMDBfZHJpdmVyX2R1bWJfY3JlYXRlLAo+Pj4gKwkuZHVtYl9tYXBfb2Zmc2V0
ID0gZHJtX2dlbV92cmFtX2RyaXZlcl9kdW1iX21tYXBfb2Zmc2V0LAo+Pj4gKwkuZ2VtX3ByaW1l
X21tYXAgPSBkcm1fZ2VtX3ByaW1lX21tYXAsCj4+PiB9Owo+Pj4gCj4+PiBzdGF0aWMgc3RydWN0
IHBjaV9kcml2ZXIgbWdhZzIwMF9wY2lfZHJpdmVyID0gewo+Pj4gZGlmZiAtLWdpdCBhL2RyaXZl
cnMvZ3B1L2RybS9tZ2FnMjAwL21nYWcyMDBfZHJ2LmggYi9kcml2ZXJzL2dwdS9kcm0vbWdhZzIw
MC9tZ2FnMjAwX2Rydi5oCj4+PiBpbmRleCA0YjRmOWNlNzRhODQuLmFhMzJhYWQyMjJjMiAxMDA2
NDQKPj4+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9tZ2FnMjAwL21nYWcyMDBfZHJ2LmgKPj4+ICsr
KyBiL2RyaXZlcnMvZ3B1L2RybS9tZ2FnMjAwL21nYWcyMDBfZHJ2LmgKPj4+IEBAIC0xNTAsNiAr
MTUwLDkgQEAgZW51bSBtZ2FfdHlwZSB7Cj4+PiAJRzIwMF9FVzMsCj4+PiB9Owo+Pj4gCj4+PiAr
LyogSFcgZG9lcyBub3QgaGFuZGxlICdzdGFydGFkZCcgZmllbGQgY29ycmVjdC4gKi8KPj4+ICsj
ZGVmaW5lIE1HQUcyMDBfRkxBR19IV19CVUdfTk9fU1RBUlRBREQJKDF1bCA8PCA4KQo+Pj4gKwo+
Pj4gI2RlZmluZSBNR0FHMjAwX1RZUEVfTUFTSwkoMHgwMDAwMDBmZikKPj4+ICNkZWZpbmUgTUdB
RzIwMF9GTEFHX01BU0sJKDB4MDBmZmZmMDApCj4+PiAKPj4+IC0tIAo+Pj4gMi4yMy4wCj4+PiAK
Pj4gCj4gCj4gLS0gCj4gVGhvbWFzIFppbW1lcm1hbm4KPiBHcmFwaGljcyBEcml2ZXIgRGV2ZWxv
cGVyCj4gU1VTRSBTb2Z0d2FyZSBTb2x1dGlvbnMgR2VybWFueSBHbWJICj4gTWF4ZmVsZHN0ci4g
NSwgOTA0MDkgTsO8cm5iZXJnLCBHZXJtYW55Cj4gKEhSQiAzNjgwOSwgQUcgTsO8cm5iZXJnKQo+
IEdlc2Now6RmdHNmw7xocmVyOiBGZWxpeCBJbWVuZMO2cmZmZXIKPiAKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QK
ZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
