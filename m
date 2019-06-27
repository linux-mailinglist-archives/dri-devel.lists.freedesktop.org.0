Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 46DFD57D7C
	for <lists+dri-devel@lfdr.de>; Thu, 27 Jun 2019 09:51:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F35176E418;
	Thu, 27 Jun 2019 07:51:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from userp2120.oracle.com (userp2120.oracle.com [156.151.31.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 68FD06E418
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jun 2019 07:51:48 +0000 (UTC)
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
 by userp2120.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x5R7mlEI087305;
 Thu, 27 Jun 2019 07:51:46 GMT
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by userp2120.oracle.com with ESMTP id 2t9cyqpjvy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 27 Jun 2019 07:51:46 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x5R7pY3l110467;
 Thu, 27 Jun 2019 07:51:45 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
 by userp3020.oracle.com with ESMTP id 2tat7d7s0n-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 27 Jun 2019 07:51:45 +0000
Received: from abhmp0003.oracle.com (abhmp0003.oracle.com [141.146.116.9])
 by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id x5R7pjeQ031706;
 Thu, 27 Jun 2019 07:51:45 GMT
Received: from mwanda (/41.57.98.10) by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Thu, 27 Jun 2019 00:51:44 -0700
Date: Thu, 27 Jun 2019 10:51:38 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: thellstrom@vmware.com
Subject: [bug report] drm/ttm: TTM fault handler helpers
Message-ID: <20190627075138.GA25231@mwanda>
MIME-Version: 1.0
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9300
 signatures=668687
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=1
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=811
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1810050000 definitions=main-1906270090
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9300
 signatures=668687
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=1 phishscore=0 bulkscore=0 spamscore=0 clxscore=1011
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=851 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1810050000
 definitions=main-1906270091
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.com; h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2018-07-02;
 bh=SSwZ3T9HuUQDsEnodXCcLh6Hid5xYp9UJE88/Kz8ieM=;
 b=3jC/GXHVvNCfW+3WYozYk6Gy2GMXk4JY/ujBjftY6cNkdNM/7k0W1PsPF567XibrW1EE
 5AfLFy4R3kBFkwlmgeFX006uBHQcFJrbrxpLPm0rqnLwCoYv8QDn355qVkAvhlHVa+Kc
 3kqXPsE4CEVkNb4vuvjnqQgB7BCcMR29+F12s9LPfumI4KvOuMPlqqroiofgQKx2c15/
 7OhrPT6zwGDsgYWfouDe5haoBe8Tf9HM/n8ffJszRZ3Bo67kWqw2+ns9iq/rs18jqDAO
 2aCo/yUpGxZPjt2fPMNqWTDLt1U0soafmpTV634fLsrOCSVwqFsCpUGZWDaziQ1uMEB6 GQ== 
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

SGVsbG8gVGhvbWFzIEhlbGxzdHJvbSwKClRoaXMgaXMgYSBzZW1pLWF1dG9tYXRpYyBlbWFpbCBh
Ym91dCBuZXcgc3RhdGljIGNoZWNrZXIgd2FybmluZ3MuCgpUaGUgcGF0Y2ggN2EzOWYzNWNlNDNm
OiAiZHJtL3R0bTogVFRNIGZhdWx0IGhhbmRsZXIgaGVscGVycyIgZnJvbSBGZWIgCjYsIDIwMTks
IGxlYWRzIHRvIHRoZSBmb2xsb3dpbmcgU21hdGNoIGNvbXBsYWludDoKCiAgICBkcml2ZXJzL2dw
dS9kcm0vdHRtL3R0bV9ib192bS5jOjI2NiB0dG1fYm9fdm1fZmF1bHRfcmVzZXJ2ZWQoKQogICAg
ZXJyb3I6IHdlIHByZXZpb3VzbHkgYXNzdW1lZCAnYm8tPnR0bScgY291bGQgYmUgbnVsbCAoc2Vl
IGxpbmUgMjA0KQoKZHJpdmVycy9ncHUvZHJtL3R0bS90dG1fYm9fdm0uYwogICAyMDMJCSAqLwog
ICAyMDQJCWlmIChiby0+dHRtICYmIChiby0+dHRtLT5wYWdlX2ZsYWdzICYgVFRNX1BBR0VfRkxB
R19TRykpCiAgICAgICAgICAgICAgICAgICAgXl5eXl5eXgpDaGVjayBmb3IgTlVMTC4KCiAgIDIw
NQkJCXJldHVybiBWTV9GQVVMVF9TSUdCVVM7CiAgIDIwNgkKICAgMjA3CQlpZiAoYmRldi0+ZHJp
dmVyLT5mYXVsdF9yZXNlcnZlX25vdGlmeSkgewogICAyMDgJCQlzdHJ1Y3QgZG1hX2ZlbmNlICpt
b3ZpbmcgPSBkbWFfZmVuY2VfZ2V0KGJvLT5tb3ZpbmcpOwogICAyMDkJCiAgIDIxMAkJCWVyciA9
IGJkZXYtPmRyaXZlci0+ZmF1bHRfcmVzZXJ2ZV9ub3RpZnkoYm8pOwogICAyMTEJCQlzd2l0Y2gg
KGVycikgewogICAyMTIJCQljYXNlIDA6CiAgIDIxMwkJCQlicmVhazsKICAgMjE0CQkJY2FzZSAt
RUJVU1k6CiAgIDIxNQkJCWNhc2UgLUVSRVNUQVJUU1lTOgogICAyMTYJCQkJcmV0dXJuIFZNX0ZB
VUxUX05PUEFHRTsKICAgMjE3CQkJZGVmYXVsdDoKICAgMjE4CQkJCXJldHVybiBWTV9GQVVMVF9T
SUdCVVM7CiAgIDIxOQkJCX0KICAgMjIwCQogICAyMjEJCQlpZiAoYm8tPm1vdmluZyAhPSBtb3Zp
bmcpIHsKICAgMjIyCQkJCXNwaW5fbG9jaygmYmRldi0+Z2xvYi0+bHJ1X2xvY2spOwogICAyMjMJ
CQkJdHRtX2JvX21vdmVfdG9fbHJ1X3RhaWwoYm8sIE5VTEwpOwogICAyMjQJCQkJc3Bpbl91bmxv
Y2soJmJkZXYtPmdsb2ItPmxydV9sb2NrKTsKICAgMjI1CQkJfQogICAyMjYJCQlkbWFfZmVuY2Vf
cHV0KG1vdmluZyk7CiAgIDIyNwkJfQogICAyMjgJCiAgIDIyOQkJLyoKICAgMjMwCQkgKiBXYWl0
IGZvciBidWZmZXIgZGF0YSBpbiB0cmFuc2l0LCBkdWUgdG8gYSBwaXBlbGluZWQKICAgMjMxCQkg
KiBtb3ZlLgogICAyMzIJCSAqLwogICAyMzMJCXJldCA9IHR0bV9ib192bV9mYXVsdF9pZGxlKGJv
LCB2bWYpOwogICAyMzQJCWlmICh1bmxpa2VseShyZXQgIT0gMCkpCiAgIDIzNQkJCXJldHVybiBy
ZXQ7CiAgIDIzNgkKICAgMjM3CQllcnIgPSB0dG1fbWVtX2lvX2xvY2sobWFuLCB0cnVlKTsKICAg
MjM4CQlpZiAodW5saWtlbHkoZXJyICE9IDApKQogICAyMzkJCQlyZXR1cm4gVk1fRkFVTFRfTk9Q
QUdFOwogICAyNDAJCWVyciA9IHR0bV9tZW1faW9fcmVzZXJ2ZV92bShibyk7CiAgIDI0MQkJaWYg
KHVubGlrZWx5KGVyciAhPSAwKSkgewogICAyNDIJCQlyZXQgPSBWTV9GQVVMVF9TSUdCVVM7CiAg
IDI0MwkJCWdvdG8gb3V0X2lvX3VubG9jazsKICAgMjQ0CQl9CiAgIDI0NQkKICAgMjQ2CQlwYWdl
X29mZnNldCA9ICgoYWRkcmVzcyAtIHZtYS0+dm1fc3RhcnQpID4+IFBBR0VfU0hJRlQpICsKICAg
MjQ3CQkJdm1hLT52bV9wZ29mZiAtIGRybV92bWFfbm9kZV9zdGFydCgmYm8tPnZtYV9ub2RlKTsK
ICAgMjQ4CQlwYWdlX2xhc3QgPSB2bWFfcGFnZXModm1hKSArIHZtYS0+dm1fcGdvZmYgLQogICAy
NDkJCQlkcm1fdm1hX25vZGVfc3RhcnQoJmJvLT52bWFfbm9kZSk7CiAgIDI1MAkKICAgMjUxCQlp
ZiAodW5saWtlbHkocGFnZV9vZmZzZXQgPj0gYm8tPm51bV9wYWdlcykpIHsKICAgMjUyCQkJcmV0
ID0gVk1fRkFVTFRfU0lHQlVTOwogICAyNTMJCQlnb3RvIG91dF9pb191bmxvY2s7CiAgIDI1NAkJ
fQogICAyNTUJCiAgIDI1NgkJY3ZtYS52bV9wYWdlX3Byb3QgPSB0dG1faW9fcHJvdChiby0+bWVt
LnBsYWNlbWVudCwgcHJvdCk7CiAgIDI1NwkJaWYgKCFiby0+bWVtLmJ1cy5pc19pb21lbSkgewog
ICAyNTgJCQlzdHJ1Y3QgdHRtX29wZXJhdGlvbl9jdHggY3R4ID0gewogICAyNTkJCQkJLmludGVy
cnVwdGlibGUgPSBmYWxzZSwKICAgMjYwCQkJCS5ub193YWl0X2dwdSA9IGZhbHNlLAogICAyNjEJ
CQkJLmZsYWdzID0gVFRNX09QVF9GTEFHX0ZPUkNFX0FMTE9DCiAgIDI2MgkKICAgMjYzCQkJfTsK
ICAgMjY0CQogICAyNjUJCQl0dG0gPSBiby0+dHRtOwogICAyNjYJCQlpZiAodHRtX3R0X3BvcHVs
YXRlKGJvLT50dG0sICZjdHgpKSB7CiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgXl5eXl5eXgpVbmNoZWNrZWQgZGVyZWZlcmVuY2UgaW5zaWRlIHR0bV90dF9wb3B1
bGF0ZSgpIGZ1bmN0aW9uLgoKICAgMjY3CQkJCXJldCA9IFZNX0ZBVUxUX09PTTsKICAgMjY4CQkJ
CWdvdG8gb3V0X2lvX3VubG9jazsKCnJlZ2FyZHMsCmRhbiBjYXJwZW50ZXIKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlz
dApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
