Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B6FB910FE01
	for <lists+dri-devel@lfdr.de>; Tue,  3 Dec 2019 13:48:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E9246E4CF;
	Tue,  3 Dec 2019 12:48:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0014ca01.pphosted.com (mx0a-0014ca01.pphosted.com
 [208.84.65.235])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BBFD26E03F
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Dec 2019 10:40:42 +0000 (UTC)
Received: from pps.filterd (m0042385.ppops.net [127.0.0.1])
 by mx0a-0014ca01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 xB3ACEZQ020558; Tue, 3 Dec 2019 02:14:18 -0800
Received: from nam05-dm3-obe.outbound.protection.outlook.com
 (mail-dm3nam05lp2052.outbound.protection.outlook.com [104.47.49.52])
 by mx0a-0014ca01.pphosted.com with ESMTP id 2wknv0uk8e-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 03 Dec 2019 02:14:18 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QjVkT12g6e65U4hTi/I4JK7hbyn4F0oKZcnhIr3Q+FycC3143bhIW1czMaQ5U+BwyXb93px4hieNjPAOk+tfPtil/HO4JJ7PI1wPOw+xcopLuQD2TezOaUfM87pESYMR+K9YFNp9jJWO1zyCom2/bebZ74JXbB/d0gaMttKhrCOADB7jf/kYuoYhhHm9KrhDQza8jexEyDgCep/ykm703VfLyVW5tR86da6bfFRMIxiOmYQWNZCA16jgoEZFhDS9KBX18dLtRQwmn6DCJ/25ONIB0MXcMioXPO/L5fgTKmOZDA8xAgc80317G2NTVFyN5EMOtr0XwS7byka+dSzgSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g54xKtoJV14khXf/vBUA6XNpaY5MoJ7kXjO1Wv7+06E=;
 b=ZODBsncdg5LeGZjmd3pwBGmbwE9vMltN/j8bs6r85ME65hIHPASPWS66rg/kFhY+uRg3Zhagky6zWIbLyQsWOCFleWIARu82nTvjxM53TqgTLcfIGKYLb3emeziQ3eIIoV8dGGOUqd36+IzDqyDSfuB/e1zoZsrlxdXy1BdmyGxfqv4ZuDWS0dJm+1+Zfo0oSWsUROgnpYPJ9nkUGRZFj7KNllu9fa4cbHEwHYsdIVgCWwpcg+fJ40mD76W+wn/fpTmSiXkryfOXgZcRDkv3stlV91yEeGjtkxbwgYEdtresZT6FjzzgwGhkP8aIi4lE0TXanV8o2wfEsqZRl4IwIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 158.140.1.28) smtp.rcpttodomain=ti.com smtp.mailfrom=cadence.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=cadence.com;
 dkim=none (message not signed); arc=none
Received: from SN4PR0701CA0001.namprd07.prod.outlook.com
 (2603:10b6:803:28::11) by MWHPR0701MB3770.namprd07.prod.outlook.com
 (2603:10b6:301:7f::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2516.12; Tue, 3 Dec
 2019 10:14:14 +0000
Received: from BN8NAM12FT026.eop-nam12.prod.protection.outlook.com
 (2a01:111:f400:fe5b::204) by SN4PR0701CA0001.outlook.office365.com
 (2603:10b6:803:28::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2516.12 via Frontend
 Transport; Tue, 3 Dec 2019 10:14:14 +0000
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 cadence.com discourages use of 158.140.1.28 as permitted sender)
Received: from sjmaillnx2.cadence.com (158.140.1.28) by
 BN8NAM12FT026.mail.protection.outlook.com (10.13.182.202) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2495.18 via Frontend Transport; Tue, 3 Dec 2019 10:14:14 +0000
Received: from maileu3.global.cadence.com (maileu3.cadence.com [10.160.88.99])
 by sjmaillnx2.cadence.com (8.14.4/8.14.4) with ESMTP id
 xB3AE7st027708
 (version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=OK);
 Tue, 3 Dec 2019 02:14:13 -0800
X-CrossPremisesHeadersFilteredBySendConnector: maileu3.global.cadence.com
Received: from maileu3.global.cadence.com (10.160.88.99) by
 maileu3.global.cadence.com (10.160.88.99) with Microsoft SMTP Server (TLS) id
 15.0.1367.3; Tue, 3 Dec 2019 11:14:08 +0100
Received: from vleu-orange.cadence.com (10.160.88.83) by
 maileu3.global.cadence.com (10.160.88.99) with Microsoft SMTP Server (TLS) id
 15.0.1367.3 via Frontend Transport; Tue, 3 Dec 2019 11:14:08 +0100
Received: from vleu-orange.cadence.com (localhost.localdomain [127.0.0.1])
 by vleu-orange.cadence.com (8.14.4/8.14.4) with ESMTP id xB3AE84j030912;
 Tue, 3 Dec 2019 11:14:08 +0100
Received: (from yamonkar@localhost)
 by vleu-orange.cadence.com (8.14.4/8.14.4/Submit) id xB3AE8wt030911;
 Tue, 3 Dec 2019 11:14:08 +0100
From: Yuti Amonkar <yamonkar@cadence.com>
To: <dri-devel@lists.freedesktop.org>
Subject: [PATCH v1 06/15] phy: cadence-torrent: Add wrapper for DPTX register
 access
Date: Tue, 3 Dec 2019 11:13:16 +0100
Message-ID: <1575368005-29797-7-git-send-email-yamonkar@cadence.com>
X-Mailer: git-send-email 2.4.5
In-Reply-To: <1575368005-29797-1-git-send-email-yamonkar@cadence.com>
References: <1575368005-29797-1-git-send-email-yamonkar@cadence.com>
MIME-Version: 1.0
X-OrganizationHeadersPreserved: maileu3.global.cadence.com
X-EOPAttributedMessage: 0
X-Forefront-Antispam-Report: CIP:158.140.1.28; IPV:CAL; SCL:-1; CTRY:US;
 EFV:NLI; SFV:SPM;
 SFS:(10019001)(6009001)(458001)(36092001)(199002)(189002)(20776003)(69226001)(63696002)(47776003)(74876001)(62966002)(74706001)(36756003)(77096001)(77156001)(76786001)(76796001)(81542001)(42186004)(93136001)(92566001)(46102001)(64706001)(81342001)(92726001)(48376002)(77982001)(59766001)(56816005)(33646001)(80022001)(76482001)(90146001)(89996001)(65816001)(87936001)(56776001)(88136002)(54316002)(74366001)(44376005)(87286001)(87266001)(50226001)(4396001)(47976001)(50986001)(95666003)(49866001)(47736001)(51856001)(50466002)(85306002)(79102001)(85852003)(83072002)(21056001)(97336001)(94946001)(93516002)(95416001)(94316002)(86362001)(97186001)(80976001)(93916002)(81686001)(83322001)(19580405001)(81816001)(31966008)(74662001)(19580395003)(53806001)(74502001)(47446002)(26826001);
 DIR:OUT; SFP:1501; SCL:9; SRVR:MWHPR0701MB3770; H:sjmaillnx2.cadence.com; FPR:;
 SPF:SoftFail; LANG:en; PTR:corp.cadence.com; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e9d85dab-65be-4edb-907a-08d777d98c6f
X-MS-TrafficTypeDiagnostic: MWHPR0701MB3770:
X-Microsoft-Antispam-PRVS: <MWHPR0701MB37708E54FE1A9872067794ABD2420@MWHPR0701MB3770.namprd07.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5236;
X-Forefront-PRVS: 02408926C4
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 4R5zeJJecUzaOsWyvSkCCVVAx6gfCQcq/h8td+YbN1hb18hXKl0CbM0eyAfzoy8eZmxjng97p3cEAbCbUa2/tbd257wO+wI9MUsh9J4bMx4gqPsdhk/iw0NrBqKIBrHUwwHbOwyGpLKp2xZ08XPIIOughZjcGu+Y+iC9Iw78sAxOplsDWuCzKNtAQhezWva+mDS3IaGP/5E+S5qvaoNAplAcIPbZekfGxSCBFbjCAMxqydzrSmWRvWSSLx3TjYSGxg5iJGR9G7s+o2GuiAaBdABNUEd8GAwcsfQjUS449y19+5FkEapu7h2JY8S5gGf5VdoyWob56+3HCl4bzIftOXB0wSLqydB0hfxuuYsyrePXMOkclBmu2Zg7ChQAFrNEY4m3CkoTsZfys9QURiDs+1kHm0NrJxpUoWH4tc1nTbEv70YEKgflw8nlT71z38H8svjne2BGsnXJPemKqEEo5nGcZGB5C5SPE4ZdkWOj/8cLZ0Tc/YCx6seZeDDBZO1tbiLpUGPfrKLddyzoyuOGJsLj8gN/DrGCBlrCrTvkInQKYKH4N65mp8vvbqahR0fOakco48swQx7cSSGAvLHYquriDEKpVilwHMpsc6tzUELc1mZj/bSdVx5QTdtdfygMc4RFEKs+QHJdnm0KVwwMravtQYqlqO10JQSNkwYNKqw3KGCYBKUi17JhygP7epwlHrVe9epetgyo1HeVt/PIfzw1e0Lacy8xqciNm1KOuMehEY393b0wX7FHCu2Dew/YwGOGmRj/AKd+CSDLE8BGh1a93aIBpvy5P1w8gD6hE4Q=
X-OriginatorOrg: cadence.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Dec 2019 10:14:14.2623 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e9d85dab-65be-4edb-907a-08d777d98c6f
X-MS-Exchange-CrossTenant-Id: d36035c5-6ce6-4662-a3dc-e762e61ae4c9
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=d36035c5-6ce6-4662-a3dc-e762e61ae4c9; Ip=[158.140.1.28];
 Helo=[sjmaillnx2.cadence.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR0701MB3770
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2019-12-03_02:2019-11-29,2019-12-03 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_check_notspam policy=outbound_check
 score=0 adultscore=0
 spamscore=0 suspectscore=1 clxscore=1015 mlxlogscore=951 phishscore=0
 impostorscore=0 malwarescore=0 bulkscore=0 lowpriorityscore=0
 priorityscore=1501 mlxscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-1910280000 definitions=main-1912030082
X-Mailman-Approved-At: Tue, 03 Dec 2019 12:48:27 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cadence.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=proofpoint;
 bh=g54xKtoJV14khXf/vBUA6XNpaY5MoJ7kXjO1Wv7+06E=;
 b=OFwExshwjloH9gSztntVFGPMuMjM87TqwiRsky4JQ0WlWOlcHjKtvjaZgnObkh5uy2S6
 lAMsGvuvKQ9B11qI0ziEKWdmMB4wXQJamWESXnqQElLNPR1VVE1+7HYVa/U0b1O9XeJA
 GwiQTiO+h5scqtPP/udv01v30GuTb7JXOkEIItUErTyPW43LVkjPTU7gcizvpTIRj2rL
 uNhO8TtHjwCEQv94dpV9c9YE9bBI5OOgxG2R2yTup2+ZV3ut5gx+Vt8cRyQjA5i15W9D
 taF2Z5t2dV3CutwN0CVHv9rQQGfVEYZzd8fGrTISfubBFu3bvJQ+ZpwqslgvhsoOzyp+ YQ== 
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cadence.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g54xKtoJV14khXf/vBUA6XNpaY5MoJ7kXjO1Wv7+06E=;
 b=ah9pkQRsp5NeiUnBvjKnxLVSyMKTT29TwPFTSJtsuGyOP6aKtcoB02IOGg1HcCeQHeLadenJIo+9aQGtzcFyhKqpZhyEvdD1UlCm7s/L0SQNGzkAe0LfGgNIJ4MS8yqMxe4jr45mT0kZceXxHaGXUxwBDSOfy1IlZhV5H5iFhhM=
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
Cc: mparab@cadence.com, yamonkar@cadence.com, praneeth@ti.com,
 dkangude@cadence.com, jsarha@ti.com, kishon@ti.com, tomi.valkeinen@ti.com,
 sjakhade@cadence.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogU3dhcG5pbCBKYWtoYWRlIDxzamFraGFkZUBjYWRlbmNlLmNvbT4KCkFkZCB3cmFwcGVy
IGZ1bmN0aW9ucyB0byByZWFkLCB3cml0ZSBEaXNwbGF5UG9ydCBzcGVjaWZpYyBQSFkgcmVnaXN0
ZXJzIHRvCmltcHJvdmUgY29kZSByZWFkYWJpbGl0eS4KClNpZ25lZC1vZmYtYnk6IFN3YXBuaWwg
SmFraGFkZSA8c2pha2hhZGVAY2FkZW5jZS5jb20+Ci0tLQogZHJpdmVycy9waHkvY2FkZW5jZS9w
aHktY2FkZW5jZS10b3JyZW50LmMgfCA3MSArKysrKysrKysrKysrKysrKysrKysrLS0tLS0tLS0t
CiAxIGZpbGUgY2hhbmdlZCwgNTAgaW5zZXJ0aW9ucygrKSwgMjEgZGVsZXRpb25zKC0pCgpkaWZm
IC0tZ2l0IGEvZHJpdmVycy9waHkvY2FkZW5jZS9waHktY2FkZW5jZS10b3JyZW50LmMgYi9kcml2
ZXJzL3BoeS9jYWRlbmNlL3BoeS1jYWRlbmNlLXRvcnJlbnQuYwppbmRleCA1OWM4NWQ4Li41Yzdj
MTg1IDEwMDY0NAotLS0gYS9kcml2ZXJzL3BoeS9jYWRlbmNlL3BoeS1jYWRlbmNlLXRvcnJlbnQu
YworKysgYi9kcml2ZXJzL3BoeS9jYWRlbmNlL3BoeS1jYWRlbmNlLXRvcnJlbnQuYwpAQCAtMTQw
LDEzICsxNDAsMzEgQEAgc3RhdGljIHZvaWQgY2Ruc190b3JyZW50X3BoeV93cml0ZShzdHJ1Y3Qg
Y2Ruc190b3JyZW50X3BoeSAqY2Ruc19waHksCiAJd3JpdGVsKHZhbCwgY2Ruc19waHktPnNkX2Jh
c2UgKyBvZmZzZXQpOwogfQogCisvKiBEUFRYIG1tciBhY2Nlc3MgZnVuY3Rpb25zICovCisKK3N0
YXRpYyB2b2lkIGNkbnNfdG9ycmVudF9kcF93cml0ZShzdHJ1Y3QgY2Ruc190b3JyZW50X3BoeSAq
Y2Ruc19waHksCisJCQkJICB1MzIgb2Zmc2V0LCB1MzIgdmFsKQoreworCXdyaXRlbCh2YWwsIGNk
bnNfcGh5LT5iYXNlICsgb2Zmc2V0KTsKK30KKworc3RhdGljIHUzMiBjZG5zX3RvcnJlbnRfZHBf
cmVhZChzdHJ1Y3QgY2Ruc190b3JyZW50X3BoeSAqY2Ruc19waHksIHUzMiBvZmZzZXQpCit7CisJ
cmV0dXJuIHJlYWRsKGNkbnNfcGh5LT5iYXNlICsgb2Zmc2V0KTsKK30KKworI2RlZmluZSBjZG5z
X3RvcnJlbnRfZHBfcmVhZF9wb2xsX3RpbWVvdXQoY2Ruc19waHksIG9mZnNldCwgdmFsLCBjb25k
LCBcCisJCQkJCSAgZGVsYXlfdXMsIHRpbWVvdXRfdXMpIFwKKwlyZWFkbF9wb2xsX3RpbWVvdXQo
KGNkbnNfcGh5KS0+YmFzZSArIChvZmZzZXQpLCBcCisJCQkgICB2YWwsIGNvbmQsIGRlbGF5X3Vz
LCB0aW1lb3V0X3VzKQorCiBzdGF0aWMgaW50IGNkbnNfdG9ycmVudF9kcF9pbml0KHN0cnVjdCBw
aHkgKnBoeSkKIHsKIAl1bnNpZ25lZCBjaGFyIGxhbmVfYml0czsKIAogCXN0cnVjdCBjZG5zX3Rv
cnJlbnRfcGh5ICpjZG5zX3BoeSA9IHBoeV9nZXRfZHJ2ZGF0YShwaHkpOwogCi0Jd3JpdGVsKDB4
MDAwMywgY2Ruc19waHktPmJhc2UgKyBQSFlfQVVYX0NUUkwpOyAvKiBlbmFibGUgQVVYICovCisJ
Y2Ruc190b3JyZW50X2RwX3dyaXRlKGNkbnNfcGh5LCBQSFlfQVVYX0NUUkwsIDB4MDAwMyk7IC8q
IGVuYWJsZSBBVVggKi8KIAogCS8qIFBIWSBQTUEgcmVnaXN0ZXJzIGNvbmZpZ3VyYXRpb24gZnVu
Y3Rpb24gKi8KIAljZG5zX3RvcnJlbnRfZHBfcG1hX2NmZyhjZG5zX3BoeSk7CkBAIC0xOTUsMTEg
KzIxMywxMSBAQCBzdGF0aWMgaW50IGNkbnNfdG9ycmVudF9kcF9pbml0KHN0cnVjdCBwaHkgKnBo
eSkKIAkgKiB1c2VkIGxhbmVzCiAJICovCiAJbGFuZV9iaXRzID0gKDEgPDwgY2Ruc19waHktPm51
bV9sYW5lcykgLSAxOwotCXdyaXRlbCgoKDB4RiAmIH5sYW5lX2JpdHMpIDw8IDQpIHwgKDB4RiAm
IGxhbmVfYml0cyksCi0JICAgICAgIGNkbnNfcGh5LT5iYXNlICsgUEhZX1JFU0VUKTsKKwljZG5z
X3RvcnJlbnRfZHBfd3JpdGUoY2Ruc19waHksIFBIWV9SRVNFVCwKKwkJCSAgICAgICgoMHhGICYg
fmxhbmVfYml0cykgPDwgNCkgfCAoMHhGICYgbGFuZV9iaXRzKSk7CiAKIAkvKiByZWxlYXNlIHBt
YV94Y3ZyX3BsbGNsa19lbl9sbl8qLCBvbmx5IGZvciB0aGUgbWFzdGVyIGxhbmUgKi8KLQl3cml0
ZWwoMHgwMDAxLCBjZG5zX3BoeS0+YmFzZSArIFBIWV9QTUFfWENWUl9QTExDTEtfRU4pOworCWNk
bnNfdG9ycmVudF9kcF93cml0ZShjZG5zX3BoeSwgUEhZX1BNQV9YQ1ZSX1BMTENMS19FTiwgMHgw
MDAxKTsKIAogCS8qIFBIWSBQTUEgcmVnaXN0ZXJzIGNvbmZpZ3VyYXRpb24gZnVuY3Rpb25zICov
CiAJY2Ruc190b3JyZW50X2RwX3BtYV9jbW5fdmNvX2NmZ18yNW1oeihjZG5zX3BoeSk7CkBAIC0y
MTksOCArMjM3LDggQEAgdm9pZCBjZG5zX3RvcnJlbnRfZHBfd2FpdF9wbWFfY21uX3JlYWR5KHN0
cnVjdCBjZG5zX3RvcnJlbnRfcGh5ICpjZG5zX3BoeSkKIAl1bnNpZ25lZCBpbnQgcmVnOwogCWlu
dCByZXQ7CiAKLQlyZXQgPSByZWFkbF9wb2xsX3RpbWVvdXQoY2Ruc19waHktPmJhc2UgKyBQSFlf
UE1BX0NNTl9SRUFEWSwgcmVnLAotCQkJCSByZWcgJiAxLCAwLCA1MDApOworCXJldCA9IGNkbnNf
dG9ycmVudF9kcF9yZWFkX3BvbGxfdGltZW91dChjZG5zX3BoeSwgUEhZX1BNQV9DTU5fUkVBRFks
CisJCQkJCQlyZWcsIHJlZyAmIDEsIDAsIDUwMCk7CiAJaWYgKHJldCA9PSAtRVRJTUVET1VUKQog
CQlkZXZfZXJyKGNkbnNfcGh5LT5kZXYsCiAJCQkidGltZW91dCB3YWl0aW5nIGZvciBQTUEgY29t
bW9uIHJlYWR5XG4iKTsKQEAgLTM5MSw4ICs0MDksMTAgQEAgc3RhdGljIHZvaWQgY2Ruc190b3Jy
ZW50X2RwX3J1bihzdHJ1Y3QgY2Ruc190b3JyZW50X3BoeSAqY2Ruc19waHkpCiAJICogd2FpdGlu
ZyBmb3IgQUNLIG9mIHBtYV94Y3ZyX3BsbGNsa19lbl9sbl8qLCBvbmx5IGZvciB0aGUKIAkgKiBt
YXN0ZXIgbGFuZQogCSAqLwotCXJldCA9IHJlYWRsX3BvbGxfdGltZW91dChjZG5zX3BoeS0+YmFz
ZSArIFBIWV9QTUFfWENWUl9QTExDTEtfRU5fQUNLLAotCQkJCSByZWFkX3ZhbCwgcmVhZF92YWwg
JiAxLCAwLCBQT0xMX1RJTUVPVVRfVVMpOworCXJldCA9IGNkbnNfdG9ycmVudF9kcF9yZWFkX3Bv
bGxfdGltZW91dChjZG5zX3BoeSwKKwkJCQkJCVBIWV9QTUFfWENWUl9QTExDTEtfRU5fQUNLLAor
CQkJCQkJcmVhZF92YWwsIHJlYWRfdmFsICYgMSwgMCwKKwkJCQkJCVBPTExfVElNRU9VVF9VUyk7
CiAJaWYgKHJldCA9PSAtRVRJTUVET1VUKQogCQlkZXZfZXJyKGNkbnNfcGh5LT5kZXYsCiAJCQki
dGltZW91dCB3YWl0aW5nIGZvciBsaW5rIFBMTCBjbG9jayBlbmFibGUgYWNrXG4iKTsKQEAgLTQx
NywyOCArNDM3LDM1IEBAIHN0YXRpYyB2b2lkIGNkbnNfdG9ycmVudF9kcF9ydW4oc3RydWN0IGNk
bnNfdG9ycmVudF9waHkgKmNkbnNfcGh5KQogCQlicmVhazsKIAl9CiAKLQl3cml0ZWwod3JpdGVf
dmFsMSwgY2Ruc19waHktPmJhc2UgKyBQSFlfUE1BX1hDVlJfUE9XRVJfU1RBVEVfUkVRKTsKKwlj
ZG5zX3RvcnJlbnRfZHBfd3JpdGUoY2Ruc19waHksCisJCQkgICAgICBQSFlfUE1BX1hDVlJfUE9X
RVJfU1RBVEVfUkVRLCB3cml0ZV92YWwxKTsKKworCXJldCA9IGNkbnNfdG9ycmVudF9kcF9yZWFk
X3BvbGxfdGltZW91dChjZG5zX3BoeSwKKwkJCQkJCVBIWV9QTUFfWENWUl9QT1dFUl9TVEFURV9B
Q0ssCisJCQkJCQlyZWFkX3ZhbCwKKwkJCQkJCShyZWFkX3ZhbCAmIG1hc2spID09IHdyaXRlX3Zh
bDEsCisJCQkJCQkwLCBQT0xMX1RJTUVPVVRfVVMpOwogCi0JcmV0ID0gcmVhZGxfcG9sbF90aW1l
b3V0KGNkbnNfcGh5LT5iYXNlICsgUEhZX1BNQV9YQ1ZSX1BPV0VSX1NUQVRFX0FDSywKLQkJCQkg
cmVhZF92YWwsIChyZWFkX3ZhbCAmIG1hc2spID09IHdyaXRlX3ZhbDEsIDAsCi0JCQkJIFBPTExf
VElNRU9VVF9VUyk7CiAJaWYgKHJldCA9PSAtRVRJTUVET1VUKQogCQlkZXZfZXJyKGNkbnNfcGh5
LT5kZXYsCiAJCQkidGltZW91dCB3YWl0aW5nIGZvciBsaW5rIHBvd2VyIHN0YXRlIGFja1xuIik7
CiAKLQl3cml0ZWwoMCwgY2Ruc19waHktPmJhc2UgKyBQSFlfUE1BX1hDVlJfUE9XRVJfU1RBVEVf
UkVRKTsKKwljZG5zX3RvcnJlbnRfZHBfd3JpdGUoY2Ruc19waHksIFBIWV9QTUFfWENWUl9QT1dF
Ul9TVEFURV9SRVEsIDApOwogCW5kZWxheSgxMDApOwogCi0Jd3JpdGVsKHdyaXRlX3ZhbDIsIGNk
bnNfcGh5LT5iYXNlICsgUEhZX1BNQV9YQ1ZSX1BPV0VSX1NUQVRFX1JFUSk7CisJY2Ruc190b3Jy
ZW50X2RwX3dyaXRlKGNkbnNfcGh5LAorCQkJICAgICAgUEhZX1BNQV9YQ1ZSX1BPV0VSX1NUQVRF
X1JFUSwgd3JpdGVfdmFsMik7CiAKLQlyZXQgPSByZWFkbF9wb2xsX3RpbWVvdXQoY2Ruc19waHkt
PmJhc2UgKyBQSFlfUE1BX1hDVlJfUE9XRVJfU1RBVEVfQUNLLAotCQkJCSByZWFkX3ZhbCwgKHJl
YWRfdmFsICYgbWFzaykgPT0gd3JpdGVfdmFsMiwgMCwKLQkJCQkgUE9MTF9USU1FT1VUX1VTKTsK
KwlyZXQgPSBjZG5zX3RvcnJlbnRfZHBfcmVhZF9wb2xsX3RpbWVvdXQoY2Ruc19waHksCisJCQkJ
CQlQSFlfUE1BX1hDVlJfUE9XRVJfU1RBVEVfQUNLLAorCQkJCQkJcmVhZF92YWwsCisJCQkJCQko
cmVhZF92YWwgJiBtYXNrKSA9PSB3cml0ZV92YWwyLAorCQkJCQkJMCwgUE9MTF9USU1FT1VUX1VT
KTsKIAlpZiAocmV0ID09IC1FVElNRURPVVQpCiAJCWRldl9lcnIoY2Ruc19waHktPmRldiwKIAkJ
CSJ0aW1lb3V0IHdhaXRpbmcgZm9yIGxpbmsgcG93ZXIgc3RhdGUgYWNrXG4iKTsKIAotCXdyaXRl
bCgwLCBjZG5zX3BoeS0+YmFzZSArIFBIWV9QTUFfWENWUl9QT1dFUl9TVEFURV9SRVEpOworCWNk
bnNfdG9ycmVudF9kcF93cml0ZShjZG5zX3BoeSwgUEhZX1BNQV9YQ1ZSX1BPV0VSX1NUQVRFX1JF
USwgMCk7CiAJbmRlbGF5KDEwMCk7CiB9CiAKQEAgLTQ1MCw5ICs0NzcsMTEgQEAgc3RhdGljIHZv
aWQgY2Ruc19kcF9waHlfd3JpdGVfZmllbGQoc3RydWN0IGNkbnNfdG9ycmVudF9waHkgKmNkbnNf
cGh5LAogewogCXVuc2lnbmVkIGludCByZWFkX3ZhbDsKIAotCXJlYWRfdmFsID0gcmVhZGwoY2Ru
c19waHktPmJhc2UgKyBvZmZzZXQpOwotCXdyaXRlbCgoKHZhbCA8PCBzdGFydF9iaXQpIHwgKHJl
YWRfdmFsICYgfigoKDEgPDwgbnVtX2JpdHMpIC0gMSkgPDwKLQkJc3RhcnRfYml0KSkpLCBjZG5z
X3BoeS0+YmFzZSArIG9mZnNldCk7CisJcmVhZF92YWwgPSBjZG5zX3RvcnJlbnRfZHBfcmVhZChj
ZG5zX3BoeSwgb2Zmc2V0KTsKKwljZG5zX3RvcnJlbnRfZHBfd3JpdGUoY2Ruc19waHksIG9mZnNl
dCwKKwkJCSAgICAgICgodmFsIDw8IHN0YXJ0X2JpdCkgfAorCQkJICAgICAgKHJlYWRfdmFsICYg
figoKDEgPDwgbnVtX2JpdHMpIC0gMSkgPDwKKwkJCSAgICAgIHN0YXJ0X2JpdCkpKSk7CiB9CiAK
IHN0YXRpYyBpbnQgY2Ruc190b3JyZW50X3BoeV9wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNl
ICpwZGV2KQotLSAKMi43LjQKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Ry
aS1kZXZlbA==
