Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 29432EAE6F
	for <lists+dri-devel@lfdr.de>; Thu, 31 Oct 2019 12:07:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3CEF86EC09;
	Thu, 31 Oct 2019 11:07:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from userp2130.oracle.com (userp2130.oracle.com [156.151.31.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 166956EC09
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Oct 2019 11:07:46 +0000 (UTC)
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
 by userp2130.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x9VB3cfj005331;
 Thu, 31 Oct 2019 11:07:44 GMT
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by userp2130.oracle.com with ESMTP id 2vxwhfte6j-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 31 Oct 2019 11:07:44 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x9VB2Xkh072748;
 Thu, 31 Oct 2019 11:07:43 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
 by userp3030.oracle.com with ESMTP id 2vyqpdw6bp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 31 Oct 2019 11:07:43 +0000
Received: from abhmp0019.oracle.com (abhmp0019.oracle.com [141.146.116.25])
 by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id x9VB7gn7012134;
 Thu, 31 Oct 2019 11:07:42 GMT
Received: from mwanda (/41.57.98.10) by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Thu, 31 Oct 2019 04:07:42 -0700
Date: Thu, 31 Oct 2019 14:07:36 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: john.stultz@linaro.org
Subject: [bug report] dma-buf: heaps: Add heap helpers
Message-ID: <20191031110736.GD26612@mwanda>
MIME-Version: 1.0
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9426
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=1
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=788
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1908290000 definitions=main-1910310113
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9426
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=1 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=870 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1908290000
 definitions=main-1910310113
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.com; h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2019-08-05;
 bh=FJvXaZLYEQFmQ3M51jq61OUM0Qk0a8N+tgpvIsJK8zc=;
 b=Bic9j/CBmqTnIEWO3f2RBV4eRdlY3oTvKMvR7mTi/ZsxMfpDpnei29Vwav4tJZ2rDxet
 fi6G7aRmC1qfr5IW4y3tbHH9Ql++SXgxiLnBuvhO9CxsV5UdNNyb94GumoNIg6iZhF/r
 76OJiyj+bmaC508FBi8y//WZg2tjGOqcHHbaPIOp8fUq2q7Bk2jf6KLZ50Dzhj8ykC6w
 p3a05UFD/BlYIBUbfAGtnh+8B2EcoQIq5LVWsjm3pjp7iMjX95cGFJg4xeACJ+b+l847
 g41bwn7+ASvJqI7v/g0vA1HxSA0KmJxdzkyH1qgrphKtE02Z2kdPeOqSolUGf8qqONWC EQ== 
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
Cc: linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGVsbG8gSm9obiBTdHVsdHosCgpUaGUgcGF0Y2ggN2I4N2VhNzA0ZmQ5OiAiZG1hLWJ1ZjogaGVh
cHM6IEFkZCBoZWFwIGhlbHBlcnMiIGZyb20gT2N0CjIxLCAyMDE5LCBsZWFkcyB0byB0aGUgZm9s
bG93aW5nIHN0YXRpYyBjaGVja2VyIHdhcm5pbmc6CgoJZHJpdmVycy9kbWEtYnVmL2hlYXBzL2hl
YXAtaGVscGVycy5jOjE2NSBkbWFfaGVhcF92bV9mYXVsdCgpCgl3YXJuOiB1bmNhcHBlZCB1c2Vy
IGluZGV4ICdidWZmZXItPnBhZ2VzW3ZtZi0+cGdvZmZdJwoKZHJpdmVycy9kbWEtYnVmL2hlYXBz
L2hlYXAtaGVscGVycy5jCiAgIDE2MCAgc3RhdGljIHZtX2ZhdWx0X3QgZG1hX2hlYXBfdm1fZmF1
bHQoc3RydWN0IHZtX2ZhdWx0ICp2bWYpCiAgIDE2MSAgewogICAxNjIgICAgICAgICAgc3RydWN0
IHZtX2FyZWFfc3RydWN0ICp2bWEgPSB2bWYtPnZtYTsKICAgMTYzICAgICAgICAgIHN0cnVjdCBo
ZWFwX2hlbHBlcl9idWZmZXIgKmJ1ZmZlciA9IHZtYS0+dm1fcHJpdmF0ZV9kYXRhOwogICAxNjQg
IAogICAxNjUgICAgICAgICAgdm1mLT5wYWdlID0gYnVmZmVyLT5wYWdlc1t2bWYtPnBnb2ZmXTsK
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXl5eXl5eXl5eXgpTbWF0
Y2ggZm9yIHNvbWUgcmVhc29uIHRoaW5rcyB0aGlzIG5lZWRzIHRvIGJlIGNoZWNrZWQuICBTbWF0
Y2ggYWxzbwpnZXRzIGNvbmZ1c2VkIGJ5IHRoZXNlIGZhdWx0IGhhbmRsZXJzIGFuZCB0aGlua3Mg
dGhlcmUgaXMgc29tZSByZWN1cnNpb24KaW52b2x2ZWQuLi4KCiAgIDE2NiAgICAgICAgICBnZXRf
cGFnZSh2bWYtPnBhZ2UpOwogICAxNjcgIAogICAxNjggICAgICAgICAgcmV0dXJuIDA7CiAgIDE2
OSAgfQogICAxNzAgIAogICAxNzEgIHN0YXRpYyBjb25zdCBzdHJ1Y3Qgdm1fb3BlcmF0aW9uc19z
dHJ1Y3QgZG1hX2hlYXBfdm1fb3BzID0gewogICAxNzIgICAgICAgICAgLmZhdWx0ID0gZG1hX2hl
YXBfdm1fZmF1bHQsCiAgIDE3MyAgfTsKICAgMTc0ICAKCnJlZ2FyZHMsCmRhbiBjYXJwZW50ZXIK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
