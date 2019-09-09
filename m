Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B14DAE18F
	for <lists+dri-devel@lfdr.de>; Tue, 10 Sep 2019 01:51:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 34C3D89C03;
	Mon,  9 Sep 2019 23:51:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from aserp2120.oracle.com (aserp2120.oracle.com [141.146.126.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D72489C03
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Sep 2019 23:51:27 +0000 (UTC)
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
 by aserp2120.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x89NnAlk175042
 for <dri-devel@lists.freedesktop.org>; Mon, 9 Sep 2019 23:51:25 GMT
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by aserp2120.oracle.com with ESMTP id 2uw1jxykfq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <dri-devel@lists.freedesktop.org>; Mon, 09 Sep 2019 23:51:25 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x89NnVkq182133
 for <dri-devel@lists.freedesktop.org>; Mon, 9 Sep 2019 23:51:24 GMT
Received: from also.us.oracle.com (also.us.oracle.com [10.132.94.46])
 by userp3030.oracle.com with ESMTP id 2uwqqd2f5v-1
 for <dri-devel@lists.freedesktop.org>; Mon, 09 Sep 2019 23:51:24 +0000
From: Alan Coopersmith <alan.coopersmith@oracle.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH libdrm] meson: Fix sys/mkdev.h detection on Solaris
Date: Mon,  9 Sep 2019 16:51:16 -0700
Message-Id: <20190909235116.19290-1-alan.coopersmith@oracle.com>
X-Mailer: git-send-email 2.15.2
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9375
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=1
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1906280000 definitions=main-1909090224
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9375
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=1 phishscore=0 bulkscore=0 spamscore=0 clxscore=1011
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1906280000
 definitions=main-1909090224
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.com; h=from : to : subject :
 date : message-id : mime-version : content-type :
 content-transfer-encoding; s=corp-2019-08-05;
 bh=f35fFGS9WGa0cJr/aBa8q/ZNAKpAEY/kt4cJNB8FlEE=;
 b=mtXvqjNEXeD8YumhdNYwfv1hky8qassN29JZAiB6dyLD9YkvT8zGpoHqk9zYuStVfTfR
 BMcniUjtYPg0oTxPtWHAdQJ2SEp3RpXmkaEMTt3Og18dOnIMSt9DNN1CrlkW9oTGById
 YbcxDNPUjN/n/vf+IDVyIqZhtw4Yj/1zmYIewx4H2bqfmgQpfnCUwboqJ62V0zMK1mcK
 bgYwRZV2jX9DbUk7rWPXYw0yTTu4MdurZXWHdn6WujRs2JA4sO6AbLhmv2SUCF+U+uBA
 5e4r7DhIDhWiOnm0Nw+9y5jC1AuEzQKZPFv8Y6U0MeJlHu0dnfrACbTxY3F502q13oMK bg== 
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gU29sYXJpcywgc3lzL3N5c21hY3Jvcy5oIGhhcyBsb25nLWRlcHJlY2F0ZWQgY29waWVzIG9m
IG1ham9yKCkgJiBtaW5vcigpCmJ1dCBub3QgbWFrZWRldigpLiAgc3lzL21rZGV2LmggaGFzIGFs
bCB0aHJlZSBhbmQgaXMgdGhlIHByZWZlcnJlZCBjaG9pY2UuCgpTbyB3ZSBjaGVjayBmb3Igc3lz
L21rZGV2LmggZmlyc3QsIGFzIGF1dG9jb25mJ3MgQUNfSEVBREVSX01BSk9SIGRvZXMuCgpGaXhl
cyBidWlsZCBmYWlsdXJlIHdpdGggZXJyb3I6Ci4uL3hmODZkcm0uYzogSW4gZnVuY3Rpb24g4oCY
ZHJtT3Blbk1pbm9y4oCZOgouLi94Zjg2ZHJtLmM6NDU0OjMwOiBlcnJvcjogaW1wbGljaXQgZGVj
bGFyYXRpb24gb2YgZnVuY3Rpb24g4oCYbWFrZWRlduKAmSBbLVdlcnJvcj1pbXBsaWNpdC1mdW5j
dGlvbi1kZWNsYXJhdGlvbl0KICA0NTQgfCAgICAgICAgIHJldHVybiBkcm1PcGVuRGV2aWNlKG1h
a2VkZXYoRFJNX01BSk9SLCBtaW5vciksIG1pbm9yLCB0eXBlKTsKICAgICAgfCAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIF5+fn5+fn4KClNpZ25lZC1vZmYtYnk6IEFsYW4gQ29vcGVyc21p
dGggPGFsYW4uY29vcGVyc21pdGhAb3JhY2xlLmNvbT4KLS0tCiBtZXNvbi5idWlsZCB8IDYgKysr
LS0tCiAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQoKZGlm
ZiAtLWdpdCBhL21lc29uLmJ1aWxkIGIvbWVzb24uYnVpbGQKaW5kZXggYmM1Y2ZjNTguLmEzMzYz
YzMyIDEwMDY0NAotLS0gYS9tZXNvbi5idWlsZAorKysgYi9tZXNvbi5idWlsZApAQCAtMTgzLDEw
ICsxODMsMTAgQEAgZm9yZWFjaCBoZWFkZXIgOiBbJ3N5cy9zeXNjdGwuaCcsICdzeXMvc2VsZWN0
LmgnLCAnYWxsb2NhLmgnXQogICBjb25maWcuc2V0KCdIQVZFXycgKyBoZWFkZXIudW5kZXJzY29y
aWZ5KCkudG9fdXBwZXIoKSwKICAgICBjYy5jb21waWxlcygnI2luY2x1ZGUgPEAwQD4nLmZvcm1h
dChoZWFkZXIpLCBuYW1lIDogJ0AwQCB3b3JrcycuZm9ybWF0KGhlYWRlcikpKQogZW5kZm9yZWFj
aAotaWYgY2MuaGFzX2hlYWRlcl9zeW1ib2woJ3N5cy9zeXNtYWNyb3MuaCcsICdtYWpvcicpCi0g
IGNvbmZpZy5zZXQxMCgnTUFKT1JfSU5fU1lTTUFDUk9TJywgdHJ1ZSkKLWVsaWYgY2MuaGFzX2hl
YWRlcl9zeW1ib2woJ3N5cy9ta2Rldi5oJywgJ21ham9yJykKK2lmIGNjLmhhc19oZWFkZXJfc3lt
Ym9sKCdzeXMvbWtkZXYuaCcsICdtYWpvcicpCiAgIGNvbmZpZy5zZXQxMCgnTUFKT1JfSU5fTUtE
RVYnLCB0cnVlKQorZWxpZiBjYy5oYXNfaGVhZGVyX3N5bWJvbCgnc3lzL3N5c21hY3Jvcy5oJywg
J21ham9yJykKKyAgY29uZmlnLnNldDEwKCdNQUpPUl9JTl9TWVNNQUNST1MnLCB0cnVlKQogZW5k
aWYKIGNvbmZpZy5zZXQxMCgnSEFWRV9PUEVOX01FTVNUUkVBTScsIGNjLmhhc19mdW5jdGlvbign
b3Blbl9tZW1zdHJlYW0nKSkKIAotLSAKMi4xNS4yCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1h
bi9saXN0aW5mby9kcmktZGV2ZWw=
