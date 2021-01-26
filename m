Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D6BD30375A
	for <lists+dri-devel@lfdr.de>; Tue, 26 Jan 2021 08:34:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 49C556E416;
	Tue, 26 Jan 2021 07:34:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from aserp2130.oracle.com (aserp2130.oracle.com [141.146.126.79])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B7A26E416
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Jan 2021 07:34:41 +0000 (UTC)
Received: from pps.filterd (aserp2130.oracle.com [127.0.0.1])
 by aserp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 10Q7TBgA155675;
 Tue, 26 Jan 2021 07:34:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 content-transfer-encoding : in-reply-to; s=corp-2020-01-29;
 bh=Ey8PIiiwWn2CVbGpR1CyBjW7yu08hAySgOwNeW7M9is=;
 b=a/puMAySFBpMquWCdLC6Q7QrcPJrSfx8VVF9ORUd5NVXKCszCQZxr9GlknTUDuik8yqz
 ccotepwSg4Vr+BJUf8gGcE3SfunRxhtdS6swW5XuY40olQ5aUl8fDVwtLK2a2wzrUqxe
 MQe99tyI1Q9g5yggkIHf3w8L92X+UOhF63yYQMAZb3Vd3s/7sPVan50vT1xD1s/FFX8r
 q5sVpv9LIT2d1VTMOc6qnw/aE2TUXlCDemAx2tACDQAarkbY8eeCwQbdFdKCPepkBFTp
 XmHaoFxMrZaNvCb44SHPC1QPjZ+SutPlBua2Vkgg6UUtrLcnhTyoA2B/JIHq4Lk2MgcX hg== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by aserp2130.oracle.com with ESMTP id 3689aagyc5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 26 Jan 2021 07:34:37 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 10Q7V2ao043381;
 Tue, 26 Jan 2021 07:34:35 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
 by aserp3030.oracle.com with ESMTP id 368wcmkujb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 26 Jan 2021 07:34:35 +0000
Received: from abhmp0003.oracle.com (abhmp0003.oracle.com [141.146.116.9])
 by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 10Q7YRcu030844;
 Tue, 26 Jan 2021 07:34:28 GMT
Received: from kadam (/102.36.221.92) by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Mon, 25 Jan 2021 23:34:27 -0800
Date: Tue, 26 Jan 2021 10:34:18 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Zack Rusin <zackr@vmware.com>
Subject: Re: [PATCH] drm/vmwgfx/vmwgfx_drv: Fix an error path in
 vmw_setup_pci_resources()
Message-ID: <20210126073418.GV2696@kadam>
References: <YA6FMboLhnE3uSvb@mwanda>
 <4D85574F-E711-46F8-A517-900F6D18954D@vmware.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <4D85574F-E711-46F8-A517-900F6D18954D@vmware.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9875
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 mlxscore=0 suspectscore=0
 phishscore=0 mlxlogscore=999 bulkscore=0 malwarescore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2101260038
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9875
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 adultscore=0
 lowpriorityscore=0 mlxlogscore=999 clxscore=1015 phishscore=0 bulkscore=0
 spamscore=0 priorityscore=1501 mlxscore=0 suspectscore=0 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2101260038
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
Cc: David Airlie <airlied@linux.ie>,
 "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>,
 Roland Scheidegger <sroland@vmware.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Martin Krastev <krastevm@vmware.com>,
 Linux-graphics-maintainer <Linux-graphics-maintainer@vmware.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBKYW4gMjUsIDIwMjEgYXQgMDc6MTM6NDNQTSArMDAwMCwgWmFjayBSdXNpbiB3cm90
ZToKPiAKPiAKPiA+IE9uIEphbiAyNSwgMjAyMSwgYXQgMDM6NDUsIERhbiBDYXJwZW50ZXIgPGRh
bi5jYXJwZW50ZXJAb3JhY2xlLmNvbT4gd3JvdGU6Cj4gPiAKPiA+IFRoZSBkZXZtX21lbXJlbWFw
KCkgZnVuY3Rpb24gbmV2ZXIgcmV0dXJucyBOVUxMLCBpdCByZXR1cm5zIGVycm9yCj4gPiBwb2lu
dGVycyBzbyB0aGUgdGVzdCBuZWVkcyB0byBiZSBmaXhlZC4gIEFsc28gd2UgbmVlZCB0byBjYWxs
Cj4gPiBwY2lfcmVsZWFzZV9yZWdpb25zKCkgdG8gYXZvaWQgYSBtZW1vcnkgbGVhay4KPiA+IAo+
ID4gRml4ZXM6IGJlNGY3N2FjNjg4NCAoImRybS92bXdnZng6IENsZWFudXAgZmlmbyBtbWlvIGhh
bmRsaW5nIikKPiA+IFNpZ25lZC1vZmYtYnk6IERhbiBDYXJwZW50ZXIgPGRhbi5jYXJwZW50ZXJA
b3JhY2xlLmNvbT4KPiAKPiBUaGFua3MsIERhbi4KPiAKPiBJIGhhdmUgYSBwYXRjaCBiYXNlZCBv
biB5b3VyIHJlcG9ydCB0aGF0IGZpeGVzIHRoYXQgdG9vIGJ1dCBpdCBjb21lcyB3aXRoIGEgcmVm
YWN0b3JpbmcuIEnigJlkIGJlIGhhcHB5IHRvIHJlYmFzZSBpdCBvbiB0b3Agb2YgeW91cnMganVz
dCB0byBnZXQgeW91cnMgaW4gYmVmb3JlLiBJZiB5b3XigJlkIGxpa2UgSSBjYW4gcHVzaCB5b3Vy
IHBhdGNoIHRocm91Z2ggZHJtLW1pc2MtbmV4dCwgaWYgbm90OgoKCk5vIG5vLiAgU29ycnksIGp1
c3QgYXBwbHkgeW91ciBwYXRjaCBhbmQgZHJvcCBtaW5lLiAgVGhlIHByb2JsZW0gaXMgdGhhdAp0
aGUgcmVwb3J0IEkgc2VudCB3YXMgZnJvbSBrYnVpbGQgYW5kIEkgZG8gbXkgZGV2ZWwgd29yayBv
biBhIGRpZmZlcmVudApzeXN0ZW0gc28gaXQncyBoYXJkZXIgdG8gdHJhY2sgdGhvc2UgZW1haWxz
IGFuZCBJIGZvcmdvdC4KCkxvb2tpbmcgYXQgaXQgbm93LCB0aGUgYnVnIHJlcG9ydCBJIHNlbnQg
ZWFybGllciB3YXMgb25seSBmb3IgdGhlCnBjaV9yZWxlYXNlX3JlZ2lvbnMoKSBhbmQgbm90IHRo
ZSBOVUxMIHZzIGVycm9yIHBvaW50ZXIuICBUaGUga2J1aWxkCmJvdCBpcyBub3QgdXNpbmcgZnVs
bCBjcm9zcyBmdW5jdGlvbiBhbmFseXNpcyBzbyBpdCBjYW4ndCBmaW5kIHRob3NlCmJ1Z3MuICBN
eSBkZXYgc3lzdGVtIGRvZXMgbXVjaCBzbG93ZXIgYnVpbGRzIHNvIGl0J3MgYSB0cmFkZW9mZi4K
CnJlZ2FyZHMsCmRhbiBjYXJwZW50ZXIKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2RyaS1kZXZlbAo=
