Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CCD2384F8
	for <lists+dri-devel@lfdr.de>; Fri,  7 Jun 2019 09:27:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7412C899C4;
	Fri,  7 Jun 2019 07:27:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from userp2120.oracle.com (userp2120.oracle.com [156.151.31.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 29662899C4
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Jun 2019 07:27:20 +0000 (UTC)
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
 by userp2120.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x577EKRL067971;
 Fri, 7 Jun 2019 07:27:18 GMT
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by userp2120.oracle.com with ESMTP id 2suj0qvh4q-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 07 Jun 2019 07:27:18 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x577QjTr167319;
 Fri, 7 Jun 2019 07:27:17 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
 by aserp3030.oracle.com with ESMTP id 2swnhd3wuu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 07 Jun 2019 07:27:17 +0000
Received: from abhmp0010.oracle.com (abhmp0010.oracle.com [141.146.116.16])
 by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id x577RGrZ012202;
 Fri, 7 Jun 2019 07:27:16 GMT
Received: from mwanda (/41.57.98.10) by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Fri, 07 Jun 2019 00:27:16 -0700
Date: Fri, 7 Jun 2019 10:27:10 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: jsarha@ti.com
Subject: [bug report] drm/bridge: sii902x: Implement HDMI audio support
Message-ID: <20190607072710.GA25188@mwanda>
MIME-Version: 1.0
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9280
 signatures=668687
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=1
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=726
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1810050000 definitions=main-1906070052
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9280
 signatures=668687
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=1 phishscore=0 bulkscore=0 spamscore=0 clxscore=1011
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=775 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1810050000
 definitions=main-1906070052
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.com; h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2018-07-02;
 bh=r2gp5Mj80YrPpWzDOBL9OLSMBeV+p8ht43c/7qDaLZQ=;
 b=iBMF+CFBvtde4+wk+AN+cOsua+QIqLYGpOq70X+aZwhIbsX7KiwcZCD8C1CQoNuIxPcV
 H0ZLeL3kwhYBb3zdOBTsPwsq+lwpnhVEO6sgbSm5vImdkCHudNKD8fRsm5k7KJ45qv41
 P5nba8HfNnJB35kQvHVP7FwfDa6wAK/YikXSpoQ4SVW2I2B2EGEp1mxdIyBHObwpnjfY
 +wNUTrC8kCs99pKPl4E3fjtXNISinm7wu6FarFRkn48IwuFSIGp2HKL/0avrlZqaj2r7
 BEpXxKYEmpXsFKEbFnOVaek/SOHVGW2j5akeMvye3cIiALXUHzZGu2cJpcIPWMEXhn6I Dg== 
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

SGVsbG8gSnlyaSBTYXJoYSwKClRoZSBwYXRjaCBmZjU3ODE2MzRjNDE6ICJkcm0vYnJpZGdlOiBz
aWk5MDJ4OiBJbXBsZW1lbnQgSERNSSBhdWRpbwpzdXBwb3J0IiBmcm9tIE1heSAyNywgMjAxOSwg
bGVhZHMgdG8gdGhlIGZvbGxvd2luZyBzdGF0aWMgY2hlY2tlcgp3YXJuaW5nOgoKCWRyaXZlcnMv
Z3B1L2RybS9icmlkZ2Uvc2lpOTAyeC5jOjc1MyBzaWk5MDJ4X2F1ZGlvX2NvZGVjX2luaXQoKQoJ
d2FybjogJ3NpaTkwMngtPmF1ZGlvLm1jbGsnIGlzbid0IGFuIEVSUl9QVFIKCmRyaXZlcnMvZ3B1
L2RybS9icmlkZ2Uvc2lpOTAyeC5jCiAgIDcyMyAgCiAgIDcyNCAgICAgICAgICBpZiAoIW9mX3By
b3BlcnR5X3JlYWRfYm9vbChkZXYtPm9mX25vZGUsICIjc291bmQtZGFpLWNlbGxzIikpIHsKICAg
NzI1ICAgICAgICAgICAgICAgICAgZGV2X2RiZyhkZXYsICIlczogTm8gXCIjc291bmQtZGFpLWNl
bGxzXCIsIG5vIGF1ZGlvXG4iLAogICA3MjYgICAgICAgICAgICAgICAgICAgICAgICAgIF9fZnVu
Y19fKTsKICAgNzI3ICAgICAgICAgICAgICAgICAgcmV0dXJuIDA7CiAgIDcyOCAgICAgICAgICB9
CiAgIDcyOSAgCiAgIDczMCAgICAgICAgICBudW1fbGFuZXMgPSBvZl9wcm9wZXJ0eV9yZWFkX3Zh
cmlhYmxlX3U4X2FycmF5KGRldi0+b2Zfbm9kZSwKICAgNzMxICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgInNpbCxpMnMtZGF0YS1sYW5lcyIs
CiAgIDczMiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIGxhbmVzLCAxLAogICA3MzMgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICBBUlJBWV9TSVpFKGxhbmVzKSk7CiAgIDczNCAgCiAgIDcz
NSAgICAgICAgICBpZiAobnVtX2xhbmVzID09IC1FSU5WQUwpIHsKICAgNzM2ICAgICAgICAgICAg
ICAgICAgZGV2X2RiZyhkZXYsCiAgIDczNyAgICAgICAgICAgICAgICAgICAgICAgICAgIiVzOiBO
byBcInNpbCxpMnMtZGF0YS1sYW5lc1wiLCB1c2UgZGVmYXVsdCA8MD5cbiIsCiAgIDczOCAgICAg
ICAgICAgICAgICAgICAgICAgICAgX19mdW5jX18pOwogICA3MzkgICAgICAgICAgICAgICAgICBu
dW1fbGFuZXMgPSAxOwogICA3NDAgICAgICAgICAgICAgICAgICBsYW5lc1swXSA9IDA7CiAgIDc0
MSAgICAgICAgICB9IGVsc2UgaWYgKG51bV9sYW5lcyA8IDApIHsKICAgNzQyICAgICAgICAgICAg
ICAgICAgZGV2X2VycihkZXYsCiAgIDc0MyAgICAgICAgICAgICAgICAgICAgICAgICAgIiVzOiBF
cnJvciBnZXR0aW4gXCJzaWwsaTJzLWRhdGEtbGFuZXNcIjogJWRcbiIsCiAgIDc0NCAgICAgICAg
ICAgICAgICAgICAgICAgICAgX19mdW5jX18sIG51bV9sYW5lcyk7CiAgIDc0NSAgICAgICAgICAg
ICAgICAgIHJldHVybiBudW1fbGFuZXM7CiAgIDc0NiAgICAgICAgICB9CiAgIDc0NyAgICAgICAg
ICBjb2RlY19kYXRhLm1heF9pMnNfY2hhbm5lbHMgPSAyICogbnVtX2xhbmVzOwogICA3NDggIAog
ICA3NDkgICAgICAgICAgZm9yIChpID0gMDsgaSA8IG51bV9sYW5lczsgaSsrKQogICA3NTAgICAg
ICAgICAgICAgICAgICBzaWk5MDJ4LT5hdWRpby5pMnNfZmlmb19zZXF1ZW5jZVtpXSB8PSBhdWRp
b19maWZvX2lkW2ldIHwKICAgNzUxICAgICAgICAgICAgICAgICAgICAgICAgICBpMnNfbGFuZV9p
ZFtsYW5lc1tpXV0gfCBTSUk5MDJYX1RQSV9JMlNfRklGT19FTkFCTEU7CiAgIDc1MiAgCiAgIDc1
MyAgICAgICAgICBpZiAoSVNfRVJSKHNpaTkwMngtPmF1ZGlvLm1jbGspKSB7CiAgICAgICAgICAg
ICAgICAgICAgICAgICAgIF5eXl5eXl5eXl5eXl5eXl5eXl4KVGhlICJzaWk5MDJ4LT5hdWRpby5t
Y2xrIiB2YXJpYWJsZSBpcyBuZXZlciBpbml0aWFsaXplZC4KCiAgIDc1NCAgICAgICAgICAgICAg
ICAgIGRldl9lcnIoZGV2LCAiJXM6IE5vIGNsb2NrIChhdWRpbyBtY2xrKSBmb3VuZDogJWxkXG4i
LAogICA3NTUgICAgICAgICAgICAgICAgICAgICAgICAgIF9fZnVuY19fLCBQVFJfRVJSKHNpaTkw
MngtPmF1ZGlvLm1jbGspKTsKICAgNzU2ICAgICAgICAgICAgICAgICAgcmV0dXJuIDA7CiAgIDc1
NyAgICAgICAgICB9CiAgIDc1OCAgCiAgIDc1OSAgICAgICAgICBzaWk5MDJ4LT5hdWRpby5wZGV2
ID0gcGxhdGZvcm1fZGV2aWNlX3JlZ2lzdGVyX2RhdGEoCgpyZWdhcmRzLApkYW4gY2FycGVudGVy
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZl
bCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xp
c3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
