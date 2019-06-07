Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2285A385D6
	for <lists+dri-devel@lfdr.de>; Fri,  7 Jun 2019 09:58:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B36A089C94;
	Fri,  7 Jun 2019 07:58:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from userp2120.oracle.com (userp2120.oracle.com [156.151.31.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B9C889C94
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Jun 2019 07:58:48 +0000 (UTC)
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
 by userp2120.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x577nVRC095671;
 Fri, 7 Jun 2019 07:58:34 GMT
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by userp2120.oracle.com with ESMTP id 2suj0qvnja-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 07 Jun 2019 07:58:34 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x577w0vr038554;
 Fri, 7 Jun 2019 07:58:33 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
 by aserp3030.oracle.com with ESMTP id 2swnhd4a9e-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 07 Jun 2019 07:58:33 +0000
Received: from abhmp0015.oracle.com (abhmp0015.oracle.com [141.146.116.21])
 by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id x577wVRs029804;
 Fri, 7 Jun 2019 07:58:31 GMT
Received: from kadam (/41.57.98.10) by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Fri, 07 Jun 2019 00:58:30 -0700
Date: Fri, 7 Jun 2019 10:58:23 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: walter harms <wharms@bfs.de>
Subject: Re: [PATCH 1/2] drm/bridge: sii902x: re-order conditions to prevent
 out of bounds read
Message-ID: <20190607075823.GO31203@kadam>
References: <20190607072704.GA25229@mwanda>
 <5CFA14CD.5010502@bfs.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <5CFA14CD.5010502@bfs.de>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9280
 signatures=668687
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1810050000 definitions=main-1906070057
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9280
 signatures=668687
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1810050000
 definitions=main-1906070056
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2018-07-02;
 bh=ter9yOdrvJ8FGiHpDwCBQ57Fld0PwEchc7IkXdlXTwk=;
 b=ixxeG9+W6IgAkBP8qnTZQf/CRIEnUrIRWaoU6INj6M3JCXfL4OWdRCr3f1Ln+IdSRruD
 0vGQx4RaIC+IDvQWd/sDRywBiGFPZXEJIC4PVy2bJO38Y/vYuUOSEx9PkUyYy9K9hxVQ
 x0oeFscl89zKsu6eLi7HstSIAPskJhkjaRigf29DJFGgPckOcHw198rtVXntEjQR9Cr6
 Qc+nRATUiybpTJxT++/6oVWMHttqWjwm0XdMe13ANyFtt+wMs10JDJW0h8+OP4uLTPs0
 eoNSdlAyteKpYQ1dBvACbZF+jmiNy+SUYnYo1X97bkpOnt9kU9f3+L9iS9KTOU9e6Eai QQ== 
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
 Jyri Sarha <jsarha@ti.com>, dri-devel@lists.freedesktop.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBKdW4gMDcsIDIwMTkgYXQgMDk6Mzk6NTdBTSArMDIwMCwgd2FsdGVyIGhhcm1zIHdy
b3RlOgo+IAo+IAo+IEFtIDA3LjA2LjIwMTkgMDk6MjcsIHNjaHJpZWIgRGFuIENhcnBlbnRlcjoK
PiA+IFRoaXMgc2hvdWxkIGNoZWNrIHRoYXQgImkiIGlzIHdpdGhpbiBib3VuZHMgYmVmb3JlIGNo
ZWNraW5nIHJlYWRpbmcgZnJvbQo+ID4gdGhlIGFycmF5Lgo+ID4gCj4gPiBGaXhlczogZmY1Nzgx
NjM0YzQxICgiZHJtL2JyaWRnZTogc2lpOTAyeDogSW1wbGVtZW50IEhETUkgYXVkaW8gc3VwcG9y
dCIpCj4gPiBTaWduZWQtb2ZmLWJ5OiBEYW4gQ2FycGVudGVyIDxkYW4uY2FycGVudGVyQG9yYWNs
ZS5jb20+Cj4gPiAtLS0KPiA+ICBkcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3NpaTkwMnguYyB8IDQg
KystLQo+ID4gIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0p
Cj4gPiAKPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3NpaTkwMnguYyBi
L2RyaXZlcnMvZ3B1L2RybS9icmlkZ2Uvc2lpOTAyeC5jCj4gPiBpbmRleCBkNmY5OGQzODhhYzIu
LjZiMDM2MTZkNmJjMyAxMDA2NDQKPiA+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2Uvc2lp
OTAyeC5jCj4gPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3NpaTkwMnguYwo+ID4gQEAg
LTU4OSw4ICs1ODksOCBAQCBzdGF0aWMgaW50IHNpaTkwMnhfYXVkaW9faHdfcGFyYW1zKHN0cnVj
dCBkZXZpY2UgKmRldiwgdm9pZCAqZGF0YSwKPiA+ICAJaWYgKHJldCkKPiA+ICAJCWdvdG8gb3V0
Owo+ID4gIAo+ID4gLQlmb3IgKGkgPSAwOyBzaWk5MDJ4LT5hdWRpby5pMnNfZmlmb19zZXF1ZW5j
ZVtpXSAmJgo+ID4gLQkJICAgICBpIDwgQVJSQVlfU0laRShzaWk5MDJ4LT5hdWRpby5pMnNfZmlm
b19zZXF1ZW5jZSk7IGkrKykKPiA+ICsJZm9yIChpID0gMDsgaSA8IEFSUkFZX1NJWkUoc2lpOTAy
eC0+YXVkaW8uaTJzX2ZpZm9fc2VxdWVuY2UpICYmCj4gPiArCQkgICAgc2lpOTAyeC0+YXVkaW8u
aTJzX2ZpZm9fc2VxdWVuY2VbaV07IGkrKykKPiA+ICAJCXJlZ21hcF93cml0ZShzaWk5MDJ4LT5y
ZWdtYXAsCj4gPiAgCQkJICAgICBTSUk5MDJYX1RQSV9JMlNfRU5BQkxFX01BUFBJTkdfUkVHLAo+
ID4gIAkJCSAgICAgc2lpOTAyeC0+YXVkaW8uaTJzX2ZpZm9fc2VxdWVuY2VbaV0pOwo+IAo+IAo+
IG1tbWgsIGkgYW0gYSBiaWcgZmFuIG9mIEtJU1MgYW5kIGluIHRoaXMgY2FzZSBpIHdvdWxkIGNo
ZWNrIHNpaTkwMngtPmF1ZGlvLmkyc19maWZvX3NlcXVlbmNlW2ldCj4gb3V0c2lkZSBmb3IoKS4g
bGlrZToKPiAKPiAJIGZvciAoaSA9IDA7IGkgPCBBUlJBWV9TSVpFKHNpaTkwMngtPmF1ZGlvLmky
c19maWZvX3NlcXVlbmNlKTsgaSsrKSB7Cj4gCSAgICAgICAgaWYgKCFzaWk5MDJ4LT5hdWRpby5p
MnNfZmlmb19zZXF1ZW5jZVtpXSkKPiAgICAgICAgICAgICAgICAgICAgICAgICAgYnJlYWs7CgpU
aGF0J3MgcHJvYmFibHkgYSBiZXR0ZXIgd2F5LCBidXQgZWl0aGVyIHdheSBpcyBhY2NlcHRhYmxl
IGFuZCBJIGxlZnQgaXQKaG93IHRoZSBhdXRob3Igd3JvdGUgaXQuCgpyZWdhcmRzLApkYW4gY2Fy
cGVudGVyCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpk
cmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
