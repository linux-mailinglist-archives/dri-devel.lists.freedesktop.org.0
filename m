Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FF55E8AF9
	for <lists+dri-devel@lfdr.de>; Tue, 29 Oct 2019 15:39:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 58B176EB8A;
	Tue, 29 Oct 2019 14:39:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from userp2130.oracle.com (userp2130.oracle.com [156.151.31.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 296146EB8A
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Oct 2019 14:39:26 +0000 (UTC)
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
 by userp2130.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x9TEOORG165785;
 Tue, 29 Oct 2019 14:39:22 GMT
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by userp2130.oracle.com with ESMTP id 2vvdju9u2m-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 29 Oct 2019 14:39:22 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x9TEOrtQ097890;
 Tue, 29 Oct 2019 14:39:22 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
 by aserp3020.oracle.com with ESMTP id 2vxpfd3h8a-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 29 Oct 2019 14:39:21 +0000
Received: from abhmp0009.oracle.com (abhmp0009.oracle.com [141.146.116.15])
 by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id x9TEdK1E002070;
 Tue, 29 Oct 2019 14:39:20 GMT
Received: from mwanda (/10.175.172.230)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Tue, 29 Oct 2019 07:39:20 -0700
Date: Tue, 29 Oct 2019 17:39:14 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: andrey.grodzovsky@amd.com
Subject: [bug report] drm/sched: Set error to s_fence if HW job submission
 failed.
Message-ID: <20191029143914.GA19410@mwanda>
MIME-Version: 1.0
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9424
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=1
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1908290000 definitions=main-1910290140
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9424
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=1 phishscore=0 bulkscore=0 spamscore=0 clxscore=1011
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1908290000
 definitions=main-1910290140
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.com; h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2019-08-05;
 bh=i2cJiEGZ40ASMTOM9nKfDX/9T3hCCl+acXYaAonLAhE=;
 b=UlG2TeZ4tNIsPX/kd09VL3wkpyIYsDkESlVppM8EX5lDipIVP5GdTdTlrgf/RgK7zj1r
 0VghwO5QuxAFhy0WXZ/2qUkEJQCda6GF7SBCq42nvC+L0BTTGJdvHgT06vtqkjnEyS8K
 4iqGr2tRSltfWFft6FoECYhnMlNzStfSsUF3KlXDc99aqc6cI+fsYb7mweCNYVzrWzN1
 wxH7YHsquoV7wafbYbBVRRsTwhCdHu/7eEfN2g8DZ0zwLC0ww6j7eZFAhFwAQGC49rqH
 3+2TV4p+iNMi6YQvdV2SzVPpE8S98FYPJ6gbE2sRQFUMROa4K1LVkazd2mOCjvA4wnqN xg== 
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
Cc: dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGVsbG8gQW5kcmV5IEdyb2R6b3Zza3ksCgpUaGUgcGF0Y2ggZTkxZTVmMDgwZTAzOiAiZHJtL3Nj
aGVkOiBTZXQgZXJyb3IgdG8gc19mZW5jZSBpZiBIVyBqb2IKc3VibWlzc2lvbiBmYWlsZWQuIiBm
cm9tIE9jdCAyNCwgMjAxOSwgbGVhZHMgdG8gdGhlIGZvbGxvd2luZyBzdGF0aWMKY2hlY2tlciB3
YXJuaW5nOgoKCWRyaXZlcnMvZ3B1L2RybS9zY2hlZHVsZXIvc2NoZWRfbWFpbi5jOjUwMCBkcm1f
c2NoZWRfcmVzdWJtaXRfam9icygpCgl3YXJuOiBwYXNzaW5nIHplcm8gdG8gJ1BUUl9FUlInCgpk
cml2ZXJzL2dwdS9kcm0vc2NoZWR1bGVyL3NjaGVkX21haW4uYwogICA0NzcgIHZvaWQgZHJtX3Nj
aGVkX3Jlc3VibWl0X2pvYnMoc3RydWN0IGRybV9ncHVfc2NoZWR1bGVyICpzY2hlZCkKICAgNDc4
ICB7CiAgIDQ3OSAgICAgICAgICBzdHJ1Y3QgZHJtX3NjaGVkX2pvYiAqc19qb2IsICp0bXA7CiAg
IDQ4MCAgICAgICAgICB1aW50NjRfdCBndWlsdHlfY29udGV4dDsKICAgNDgxICAgICAgICAgIGJv
b2wgZm91bmRfZ3VpbHR5ID0gZmFsc2U7CiAgIDQ4MiAgICAgICAgICBzdHJ1Y3QgZG1hX2ZlbmNl
ICpmZW5jZTsKICAgNDgzICAKICAgNDg0ICAgICAgICAgIGxpc3RfZm9yX2VhY2hfZW50cnlfc2Fm
ZShzX2pvYiwgdG1wLCAmc2NoZWQtPnJpbmdfbWlycm9yX2xpc3QsIG5vZGUpIHsKICAgNDg1ICAg
ICAgICAgICAgICAgICAgc3RydWN0IGRybV9zY2hlZF9mZW5jZSAqc19mZW5jZSA9IHNfam9iLT5z
X2ZlbmNlOwogICA0ODYgIAogICA0ODcgICAgICAgICAgICAgICAgICBpZiAoIWZvdW5kX2d1aWx0
eSAmJiBhdG9taWNfcmVhZCgmc19qb2ItPmthcm1hKSA+IHNjaGVkLT5oYW5nX2xpbWl0KSB7CiAg
IDQ4OCAgICAgICAgICAgICAgICAgICAgICAgICAgZm91bmRfZ3VpbHR5ID0gdHJ1ZTsKICAgNDg5
ICAgICAgICAgICAgICAgICAgICAgICAgICBndWlsdHlfY29udGV4dCA9IHNfam9iLT5zX2ZlbmNl
LT5zY2hlZHVsZWQuY29udGV4dDsKICAgNDkwICAgICAgICAgICAgICAgICAgfQogICA0OTEgIAog
ICA0OTIgICAgICAgICAgICAgICAgICBpZiAoZm91bmRfZ3VpbHR5ICYmIHNfam9iLT5zX2ZlbmNl
LT5zY2hlZHVsZWQuY29udGV4dCA9PSBndWlsdHlfY29udGV4dCkKICAgNDkzICAgICAgICAgICAg
ICAgICAgICAgICAgICBkbWFfZmVuY2Vfc2V0X2Vycm9yKCZzX2ZlbmNlLT5maW5pc2hlZCwgLUVD
QU5DRUxFRCk7CiAgIDQ5NCAgCiAgIDQ5NSAgICAgICAgICAgICAgICAgIGRtYV9mZW5jZV9wdXQo
c19qb2ItPnNfZmVuY2UtPnBhcmVudCk7CiAgIDQ5NiAgICAgICAgICAgICAgICAgIGZlbmNlID0g
c2NoZWQtPm9wcy0+cnVuX2pvYihzX2pvYik7CiAgIDQ5NyAgCiAgIDQ5OCAgICAgICAgICAgICAg
ICAgIGlmIChJU19FUlJfT1JfTlVMTChmZW5jZSkpIHsKICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIF5eXl5eXl5eXl5eXl5eXl5eXl5eCgogICA0OTkgICAgICAgICAgICAgICAgICAgICAgICAg
IHNfam9iLT5zX2ZlbmNlLT5wYXJlbnQgPSBOVUxMOwogICA1MDAgICAgICAgICAgICAgICAgICAg
ICAgICAgIGRtYV9mZW5jZV9zZXRfZXJyb3IoJnNfZmVuY2UtPmZpbmlzaGVkLCBQVFJfRVJSKGZl
bmNlKSk7CiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIF5eXl5eXl5eXl5eXl5eCklmICJmZW5jZSIgaXMgTlVMTCB0
aGVuIGl0IHRyaWdnZXJzIGEgV0FSTl9PTigpIGluc2lkZSB0aGUKZG1hX2ZlbmNlX3NldF9lcnJv
cigpIGZ1bmN0aW9uLgoKCVdBUk5fT04oZXJyb3IgPj0gMCB8fCBlcnJvciA8IC1NQVhfRVJSTk8p
OwogICAgICAgICAgICAgICAgXl5eXl5eXl5eXgoKICAgNTAxICAgICAgICAgICAgICAgICAgfSBl
bHNlIHsKICAgNTAyICAgICAgICAgICAgICAgICAgICAgICAgICBzX2pvYi0+c19mZW5jZS0+cGFy
ZW50ID0gZmVuY2U7CiAgIDUwMyAgICAgICAgICAgICAgICAgIH0KICAgNTA0ICAKICAgNTA1ICAK
ICAgNTA2ICAgICAgICAgIH0KICAgNTA3ICB9CgpyZWdhcmRzLApkYW4gY2FycGVudGVyCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWls
aW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
