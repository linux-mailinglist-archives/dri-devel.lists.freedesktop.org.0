Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DFA4626447
	for <lists+dri-devel@lfdr.de>; Wed, 22 May 2019 15:07:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3066B89939;
	Wed, 22 May 2019 13:07:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from userp2130.oracle.com (userp2130.oracle.com [156.151.31.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 446B189933
 for <dri-devel@lists.freedesktop.org>; Wed, 22 May 2019 13:07:37 +0000 (UTC)
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
 by userp2130.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x4MCsWaj136854;
 Wed, 22 May 2019 13:07:34 GMT
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by userp2130.oracle.com with ESMTP id 2smsk5bj66-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 22 May 2019 13:07:34 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x4MD5gVf122534;
 Wed, 22 May 2019 13:07:34 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
 by userp3020.oracle.com with ESMTP id 2smsguu96y-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 22 May 2019 13:07:34 +0000
Received: from abhmp0013.oracle.com (abhmp0013.oracle.com [141.146.116.19])
 by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id x4MD7VDv015275;
 Wed, 22 May 2019 13:07:31 GMT
Received: from mwanda (/41.57.98.10) by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Wed, 22 May 2019 13:07:31 +0000
Date: Wed, 22 May 2019 16:07:25 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: christian.koenig@amd.com, Andrey Grodzovsky <andrey.grodzovsky@amd.com>
Subject: [bug report] drm/scheduler: rework job destruction
Message-ID: <20190522130724.GA31989@mwanda>
MIME-Version: 1.0
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9264
 signatures=668687
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=2
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1810050000 definitions=main-1905220095
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9264
 signatures=668687
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=2 phishscore=0 bulkscore=0 spamscore=0 clxscore=1011
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1810050000
 definitions=main-1905220095
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.com; h=date : from : to : cc
 : subject : message-id : mime-version : content-type :
 content-transfer-encoding; s=corp-2018-07-02;
 bh=YfTPSWKAmPQzJOwE0GAs1IQnSPzYCscjG0aN934qlTI=;
 b=dqFskH87Xm5vas9z70TpZQ9nYq4fmASE9dc/IKAQo5ohx0TOTtaSyNahJYwt/9051PPG
 fegFfA/COfPVYwj7JgkERv4Ok8LNi1YfMoY6MfU6qZEthppvnq+/G8mQa6Xmx0A5lDTG
 57AfCB+IusCMTAO3GFkvIGyk5/BQI5C1egJXkGL6YzecOroZFTDpGfC12gf182ULPHmo
 YPhXrSHnnpQ5NlbAuv+QV6lvICNQoa+6oFX1RFcR5jOu/ogw4eZ58p8oLJhvS3gVXRCe
 zqDzdPwcolQRBZ6O1o4MziyP8cNXz1AWLUdETEejw/WCDQsFNoQNn5iisKwpk4CnHkoC 3Q== 
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

SGVsbG8gQ2hyaXN0aWFuIEvDtm5pZywKClRoZSBwYXRjaCA1OTE4MDQ1YzRlZDQ6ICJkcm0vc2No
ZWR1bGVyOiByZXdvcmsgam9iIGRlc3RydWN0aW9uIiBmcm9tCkFwciAxOCwgMjAxOSwgbGVhZHMg
dG8gdGhlIGZvbGxvd2luZyBzdGF0aWMgY2hlY2tlciB3YXJuaW5nOgoKCWRyaXZlcnMvZ3B1L2Ry
bS9zY2hlZHVsZXIvc2NoZWRfbWFpbi5jOjI5NyBkcm1fc2NoZWRfam9iX3RpbWVkb3V0KCkKCWVy
cm9yOiBwb3RlbnRpYWwgTlVMTCBkZXJlZmVyZW5jZSAnam9iJy4KCmRyaXZlcnMvZ3B1L2RybS9z
Y2hlZHVsZXIvc2NoZWRfbWFpbi5jCiAgIDI3OSAgc3RhdGljIHZvaWQgZHJtX3NjaGVkX2pvYl90
aW1lZG91dChzdHJ1Y3Qgd29ya19zdHJ1Y3QgKndvcmspCiAgIDI4MCAgewogICAyODEgICAgICAg
ICAgc3RydWN0IGRybV9ncHVfc2NoZWR1bGVyICpzY2hlZDsKICAgMjgyICAgICAgICAgIHN0cnVj
dCBkcm1fc2NoZWRfam9iICpqb2I7CiAgIDI4MyAgICAgICAgICB1bnNpZ25lZCBsb25nIGZsYWdz
OwogICAyODQgIAogICAyODUgICAgICAgICAgc2NoZWQgPSBjb250YWluZXJfb2Yod29yaywgc3Ry
dWN0IGRybV9ncHVfc2NoZWR1bGVyLCB3b3JrX3Rkci53b3JrKTsKICAgMjg2ICAgICAgICAgIGpv
YiA9IGxpc3RfZmlyc3RfZW50cnlfb3JfbnVsbCgmc2NoZWQtPnJpbmdfbWlycm9yX2xpc3QsCiAg
IDI4NyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgc3RydWN0IGRybV9z
Y2hlZF9qb2IsIG5vZGUpOwogICAyODggIAogICAyODkgICAgICAgICAgaWYgKGpvYikKICAgICAg
ICAgICAgICAgICAgICBeXl4KV2UgYXNzdW1lIHRoYXQgam9iIGNhbiBiZSBOVUxMLgoKICAgMjkw
ICAgICAgICAgICAgICAgICAgam9iLT5zY2hlZC0+b3BzLT50aW1lZG91dF9qb2Ioam9iKTsKICAg
MjkxICAKICAgMjkyICAgICAgICAgIC8qCiAgIDI5MyAgICAgICAgICAgKiBHdWlsdHkgam9iIGRp
ZCBjb21wbGV0ZSBhbmQgaGVuY2UgbmVlZHMgdG8gYmUgbWFudWFsbHkgcmVtb3ZlZAogICAyOTQg
ICAgICAgICAgICogU2VlIGRybV9zY2hlZF9zdG9wIGRvYy4KICAgMjk1ICAgICAgICAgICAqLwog
ICAyOTYgICAgICAgICAgaWYgKHNjaGVkLT5mcmVlX2d1aWx0eSkgewoKT3JpZ2luYWxseSAobGFz
dCB3ZWVrKSB0aGlzIGNoZWNrIHdhcyAiaWYgKGxpc3RfZW1wdHkoJmpvYi0+bm9kZSkpIgp3aGlj
aCBpcyBvYnZpb3VzbHkgcHJvYmxlbWF0aWMgaWYgam9iIGlzIE5VTEwuICBJdCdzIG5vdCBjbGVh
ciB0byBtZQp0aGF0IHRoaXMgbmV3IGNoZWNrIGVuc3VyZXMgdGhhdCBqb2IgaXMgbm9uLU5VTEwg
ZWl0aGVyLgoKICAgMjk3ICAgICAgICAgICAgICAgICAgam9iLT5zY2hlZC0+b3BzLT5mcmVlX2pv
Yihqb2IpOwogICAgICAgICAgICAgICAgICAgICAgICBeXl5eXgpEZXJlZmVyZW5jZS4KCiAgIDI5
OCAgICAgICAgICAgICAgICAgIHNjaGVkLT5mcmVlX2d1aWx0eSA9IGZhbHNlOwogICAyOTkgICAg
ICAgICAgfQogICAzMDAgIAogICAzMDEgICAgICAgICAgc3Bpbl9sb2NrX2lycXNhdmUoJnNjaGVk
LT5qb2JfbGlzdF9sb2NrLCBmbGFncyk7CiAgIDMwMiAgICAgICAgICBkcm1fc2NoZWRfc3RhcnRf
dGltZW91dChzY2hlZCk7CiAgIDMwMyAgICAgICAgICBzcGluX3VubG9ja19pcnFyZXN0b3JlKCZz
Y2hlZC0+am9iX2xpc3RfbG9jaywgZmxhZ3MpOwogICAzMDQgIH0KCnJlZ2FyZHMsCmRhbiBjYXJw
ZW50ZXIKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJp
LWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
