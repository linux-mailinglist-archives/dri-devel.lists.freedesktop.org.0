Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 52AEB19C5C
	for <lists+dri-devel@lfdr.de>; Fri, 10 May 2019 13:16:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 23E7289BA5;
	Fri, 10 May 2019 11:16:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from userp2120.oracle.com (userp2120.oracle.com [156.151.31.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C13E089BA3;
 Fri, 10 May 2019 11:16:42 +0000 (UTC)
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
 by userp2120.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x4ABDrMj173329;
 Fri, 10 May 2019 11:16:37 GMT
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by userp2120.oracle.com with ESMTP id 2s94b18btq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 10 May 2019 11:16:37 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x4ABG0im010795;
 Fri, 10 May 2019 11:16:36 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
 by userp3030.oracle.com with ESMTP id 2sagyvsc8h-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 10 May 2019 11:16:36 +0000
Received: from abhmp0014.oracle.com (abhmp0014.oracle.com [141.146.116.20])
 by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id x4ABGVnM023759;
 Fri, 10 May 2019 11:16:31 GMT
Received: from kadam (/41.57.98.10) by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Fri, 10 May 2019 04:16:31 -0700
Date: Fri, 10 May 2019 14:16:23 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Colin King <colin.king@canonical.com>
Subject: Re: [PATCH][next] drm/amdgpu: fix return of an uninitialized value
 in variable ret
Message-ID: <20190510111623.GC18105@kadam>
References: <20190510100842.30458-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190510100842.30458-1-colin.king@canonical.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-Virus-Version: vendor=nai engine=5900 definitions=9252
 signatures=668686
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1810050000 definitions=main-1905100080
X-Proofpoint-Virus-Version: vendor=nai engine=5900 definitions=9252
 signatures=668686
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1011
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1810050000
 definitions=main-1905100080
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2018-07-02;
 bh=pugw6u1DF8kTo0TWxMB5HqnwhA3PgsdFoHz299/SPlk=;
 b=Abzn+43JBICvtCRhuBAc1+7aLsd0eu2y45um2Qpgp5bmifpmkUigT+VkE0zItNmAAKcP
 EPPn9+PcjPFl4Yhcs8ufQKpHM/cQ3pjA014xZzC4xy8ibuOGb/saqubvtcsEWG7MQcD5
 fHPiJq6t/0bu4r1gJkt/mYy2AVh9ya7HU4X0Dr8AYaelLivfGTOhEwgZznAw4Eyky00X
 qnwI9AtRbn04ZZzs9x288o8gT6+weVjrPI5zaijD61ySNeeWIoEM8xSetRWIDD9P+yCm
 dvLooM+zKzCvwtizvKij9p5hYh3VUd5Snw7gEl7JS6q5xpc4eMBXJWSdYAkDdKlO+2So AA== 
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
Cc: David Airlie <airlied@linux.ie>, kernel-janitors@vger.kernel.org,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBNYXkgMTAsIDIwMTkgYXQgMTE6MDg6NDJBTSArMDEwMCwgQ29saW4gS2luZyB3cm90
ZToKPiBGcm9tOiBDb2xpbiBJYW4gS2luZyA8Y29saW4ua2luZ0BjYW5vbmljYWwuY29tPgo+IAo+
IEluIHRoZSBjYXNlIHdoZXJlIGlzX2VuYWJsZSBpcyBmYWxzZSBhbmQgbG9fYmFzZV9hZGRyIGlz
IG5vbi16ZXJvIHRoZQo+IHZhcmlhYmxlIHJldCBoYXMgbm90IGJlZW4gaW5pdGlhbGl6ZWQgYW5k
IGlzIGJlaW5nIGNoZWNrZWQgZm9yIG5vbi16ZXJvCj4gYW5kIHBvdGVudGlhbGx5IGdhcmJhZ2Ug
aXMgYmVpbmcgcmV0dXJuZWQuIEZpeCB0aGlzIGJ5IG5vdCByZXR1cm5pbmcKPiByZXQgYnV0IGlu
c3RlYWQgcmV0dXJuaW5nIC1FSU5WQUwgb24gdGhlIHplcm8gbG9fYmFzZV9hZGRyIGNhc2UuCj4g
Cj4gQWRkcmVzc2VzLUNvdmVyaXR5OiAoIlVuaW5pdGlhbGl6ZWQgc2NhbGFyIHZhcmlhYmxlIikK
PiBGaXhlczogYTZhYzBiNDRiYWI5ICgiZHJtL2FtZGdwdTogYWRkIGRmIHBlcmZtb24gcmVncyBh
bmQgZnVuY3MgZm9yIHhnbWkiKQo+IFNpZ25lZC1vZmYtYnk6IENvbGluIElhbiBLaW5nIDxjb2xp
bi5raW5nQGNhbm9uaWNhbC5jb20+Cj4gLS0tCj4gIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1
L2RmX3YzXzYuYyB8IDUgKy0tLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCA0
IGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdw
dS9kZl92M182LmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9kZl92M182LmMKPiBpbmRl
eCBhNWMzNTU4ODY5ZmIuLjhjMDliZjk5NGFjZCAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9k
cm0vYW1kL2FtZGdwdS9kZl92M182LmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdw
dS9kZl92M182LmMKPiBAQCAtMzk4LDEwICszOTgsNyBAQCBzdGF0aWMgaW50IGRmX3YzXzZfc3Rh
cnRfeGdtaV9saW5rX2NudHIoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYsCj4gIAkJCQlOVUxM
KTsKPiAgCj4gIAkJaWYgKGxvX2Jhc2VfYWRkciA9PSAwKQo+IC0JCQlyZXQgPSAtRUlOVkFMOwo+
IC0KPiAtCQlpZiAocmV0KQo+IC0JCQlyZXR1cm4gcmV0Owo+ICsJCQlyZXR1cm4gLUVJTlZBTDsK
CkZyb20gYSBuYWl2ZSByZWFkaW5nIG9mIHRoZSBjb2RlIHdpdGhvdXQga25vd2luZyB0aGUgaGFy
ZHdhcmUgc3BlYyB0aGVuCnlvdSB3b3VsZCBwcm9iYWJseSB0aGluayB0aGF0IGxvX2Jhc2VfYWRk
ciBjYW4gYWxzbyBiZSB1bmluaXRpYWxpemVkLgoKPHNhZCBmYWNlIGVtb2ppPgoKcmVnYXJkcywK
ZGFuIGNhcnBlbnRlcgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRl
dmVs
