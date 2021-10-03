Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EE2DC420373
	for <lists+dri-devel@lfdr.de>; Sun,  3 Oct 2021 20:37:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6287D6E0A6;
	Sun,  3 Oct 2021 18:37:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com
 [205.220.177.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5EEE76E064
 for <dri-devel@lists.freedesktop.org>; Sun,  3 Oct 2021 18:09:54 +0000 (UTC)
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 193GNE1J021958; 
 Sun, 3 Oct 2021 18:09:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : subject :
 date : message-id : content-type : content-id : content-transfer-encoding
 : mime-version; s=corp-2021-07-09;
 bh=cZBiNkeV+K1A+jHiTgK7Srz9iLeNcDkVN8KbB3yhAJA=;
 b=m70947dxWE27svtSlENi6EBTsd9yAsu9q0Lqrcokai6SIm7x1RW86DFgRcjfjKUFfXPJ
 Upr0hKxjqoYav8WrM1Cyo1nSMdjhJtIESv2nHzbeYQFxrFNWv51PHhPC3DqwQYEJxNkJ
 SsIQywdTSqEyYvBOUlnMr+YnItoqWps+hiH1WpeUlu0YnRi9tr/rdu4j39tDSpXequVe
 GpsyRqH1xTbhZLgrd4oa49VVityihq7rE55dvJ5sudOKzbzvbP0ovwpS4j3K5hXaJpcH
 dk/ZpH9UkyP7A6slkmLpEOfNCsnQ6kNRgElzPW/rc/v2+SSbskFyQIAggmapSECozxld Ww== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by mx0b-00069f02.pphosted.com with ESMTP id 3bfaj20m0p-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Sun, 03 Oct 2021 18:09:52 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 193I9pn3190682;
 Sun, 3 Oct 2021 18:09:51 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam12lp2168.outbound.protection.outlook.com [104.47.55.168])
 by aserp3030.oracle.com with ESMTP id 3bev7qtutc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sun, 03 Oct 2021 18:09:51 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QkIk4Y+7/8F9pbblg/AL15+4N0sktjH7hqGjtCFD0HcdtlfAKCLcCxbHLZBx5Ux0+IYYs92MC+X9srqdw2hVTe0ngNF2y+qVzsLF9W+IHqNGqR7I+Pi6bGHNUJveL+pR+Z8Nbrey4gqJVYXSERUEBS40ufqEOJcPjgo5+h69DUQqQEVt8fN9BzxXisJTrfj8qUn80TA8jlubemaVlojeiJR2tmLWdZCYgEELdrQK1eLsZDnLk8SPmGib15hHWyK6uGHQvP9XvPzJTayMMtOHj4XJGS8a+VPozMZKOqJD/546Wf6iwfJIjBXatgj+kP0na4xFBqBx/Uk1UKMBixx3UA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cZBiNkeV+K1A+jHiTgK7Srz9iLeNcDkVN8KbB3yhAJA=;
 b=ktw0zU8ysCffo54LxDK8treQzVGNPWnmFQ3Gf9jKRKfs1r4yLy2UujKVobpNryueB7OgLYBPSjYYiqtIxrSiL8dHbpU2wCF7pV7GMNDJ2FqiwpgrIJyZhcRcAVbOCUjkOnGy/Uv8sbfCcdu6jefFIqM9ePHoblsyBlNoo5X98cXDYjiSUUKlXGpp4u3n29BMXLofCR829vAXGHhAUeiWjkxOZEfZPeoZmgjXJZcO48gakARt0zO87rxGL0TsMUwdSSCzbWLY+HNn6tA6b0SMhpa9SCxKK4gEvwyWrZKJkJalzAjsLUX1FpuO6IlYxrv9XknhC7bIaYRBeQhXe+da5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cZBiNkeV+K1A+jHiTgK7Srz9iLeNcDkVN8KbB3yhAJA=;
 b=LkLuU/yFMFdeOdGmJYniwXSSG0vEjnujta4tHNt7xI9J3KlPO1uhS6ZHSxAhhWhc6+1d2gmqFtTEivIUyA4TLaYvxerGOgxp3RbldtpefAzylODrCpwImcMUt5rq5KfXL+l5+w78aJOTOprt2gAtoHuJWVe44zaTVC+F45+F3fE=
Received: from SJ0PR10MB4688.namprd10.prod.outlook.com (2603:10b6:a03:2db::24)
 by SJ0PR10MB4623.namprd10.prod.outlook.com (2603:10b6:a03:2dc::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.13; Sun, 3 Oct
 2021 18:09:49 +0000
Received: from SJ0PR10MB4688.namprd10.prod.outlook.com
 ([fe80::f4fe:5b4:6bd9:4c5b]) by SJ0PR10MB4688.namprd10.prod.outlook.com
 ([fe80::f4fe:5b4:6bd9:4c5b%6]) with mapi id 15.20.4566.022; Sun, 3 Oct 2021
 18:09:49 +0000
From: Chuck Lever III <chuck.lever@oracle.com>
To: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, Linux
 Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: 572994bf18ff prevents system boot
Thread-Topic: 572994bf18ff prevents system boot
Thread-Index: AQHXuIHaQkpNBKzpEUm+VGhDUNOUhg==
Date: Sun, 3 Oct 2021 18:09:49 +0000
Message-ID: <A194B6CE-AF77-422D-A92F-292ABD83BCCE@oracle.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3654.120.0.1.13)
authentication-results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=oracle.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 9d755003-88b2-4fc6-71c6-08d98698fd6b
x-ms-traffictypediagnostic: SJ0PR10MB4623:
x-microsoft-antispam-prvs: <SJ0PR10MB4623773D37D364A9B839076C93AD9@SJ0PR10MB4623.namprd10.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1923;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 0iUPWDm1uhv0A1+whECtKIGENQVlRfKFtV48C2Sv0vQ6h0l5UeFBm1k30QhWoWTCqAQ6/YDStRxSaF8EQXYRxgYy2eht6d66+HhYzKsLYKJlX0WoRqjSQx6P0THmSq9jDOm8cKUCB6xPcJqlWlCTVA7ws8+Kex6oBmsW5gadT5dqnEXvHvLlRv8gEPolQu0UlmharbhZQKOdt/wXsIjp7hcL2/BykeM//Fd8AUHWyekZMshDsnugsaXnqtfnzXsbn9RYFx/4/2ud6TSMD4QgnFMcEQaJbNdY61/kyJbVCw1Vm02fnn2VaLY179wWC9Cq24jxQWxW2VzvYAruam1KslDqueEEXNxXet40ZbHKC+yIVug/IKkH3uXnEe/rBaVilkjF/4cclWCsM6DTZhVwSnX5WGt7Rr3tNMp7Vs2g7yo3cGk8mD3GAlXkZmfLfIr8eD1fbhmmajneMd84sUzsKPgiYhBw/qNGrdPzoLyZXCxvXScsf7gGCl3kcnESDuQ6XuA9/Qr7IzhhuSYms+2yy2X5w6111NA9jFKyZNrKpwlH7Fq72Y75iX4YxWc082MWIOB3f0HuUu7ql/+LBNO7Sh54ZhnnRg91ZmXc6MLUS8zo1Q+6DdQ22GR90PGTIoqXjcs7+kAVjuGY//mpctv9pbEKeA/Ur0G+QLmOevucRpjsqhPtiTFCikCYvGMShB4KcNsX5qI/Pg3JePyjRgl6SeHNJTScHx2+c46gfeMWCjk=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR10MB4688.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(4744005)(6506007)(122000001)(6486002)(71200400001)(6512007)(66556008)(66476007)(8936002)(66946007)(66446008)(64756008)(186003)(76116006)(91956017)(86362001)(38100700002)(508600001)(2906002)(83380400001)(8676002)(26005)(38070700005)(110136005)(33656002)(316002)(5660300002)(36756003)(2616005)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?kcGiOakFGZfBvOzJCF4hUnOF26L8MyZTf051xnUMUJvtyJZITMULgtl5BAvt?=
 =?us-ascii?Q?DnuNZyZCoQ7y1AYpGXG7bJz4MGCktAvRmF49FjL/uVXM3cbTQBicdtQr89s+?=
 =?us-ascii?Q?96n68yxk9pUEAxBucB5GbXLlNUKPI/S2SHmU04wAQAt2l0d1fP2VvJh20pXo?=
 =?us-ascii?Q?13XiTHQv0VtCzDg8LakHW6xGdZWhpJsjMalRabqiky9AhVEsrZHHl6ehXiAr?=
 =?us-ascii?Q?eeju7MMEaaafK++vUANTaJ1r4Ys+qwoJ1RjqUck6diM3f+nM24M0ou3mxXuT?=
 =?us-ascii?Q?tSnHx/zryfyYtDphAfKq5zCygaNNDNAMrLGwEdxj71IU+XOMHFaMU8zCK+2Y?=
 =?us-ascii?Q?t3AwqZvnTNuSdTqhgGv2AHp+DenHLXvGuzUmtg0q+eyaVahyxgFjffJdk9Ea?=
 =?us-ascii?Q?W4gew+Z+lyRz4YEoUrdyUyZD01fdwm/Js4qWRUdnFpPdEOrzgiLVSWQbHoux?=
 =?us-ascii?Q?x8lHs/Z8wXiG2y/RMOU4iKhQiQy8h/8X2D/HARkxmTaEWaA3bcSHmEEAKQlA?=
 =?us-ascii?Q?kpwBVZ2A38zTVAiNkVycj1vQb+HlzMysqYZokE3u7eKy45c+oo2a2Om0PFo0?=
 =?us-ascii?Q?Gw53/CBWzrqlEXeKYYKjjD8yNCyZfsYgDcbbVG6VMY0t2tygOAriR9KddRFM?=
 =?us-ascii?Q?i4GMW1paZpfNkYB8LyzeMhJgIV7qHWZl4XU30kJ6YL/l8PPe6seM7c9HKEhC?=
 =?us-ascii?Q?E+F6eBk1z/OiFO2Gt7GW3er/w8R+u6ZtXpOuG/kEPrUmpSbU3OEbDAthdxZl?=
 =?us-ascii?Q?N/wdYRLlzyXXpzpOt50k0coEiiJQnL4/Uwy2tXTG8OKS4uTxEIVeFLVRX7Iy?=
 =?us-ascii?Q?ymaxxeP3bK6gl8HpKMvtqQ6AJHHClO/MbMufrj8RYXxNjAliPPOgSh9g7s0D?=
 =?us-ascii?Q?4uQFgyXkpW5CShddrBJXNqf5LDqS+20jbQMnLEqiAe5nsCFuRXihM0blaG7s?=
 =?us-ascii?Q?USdpDELWcx6yhjzsAoLYYppr7EsWplfAM+bni8mlZTIIfF7EwxGOWyRAuYgB?=
 =?us-ascii?Q?ViWEZnDBIi/qe9ipB5DyAA96mZ6UM+XDKl8Pbe6K501n/2iF2Fb+wAeNgiUV?=
 =?us-ascii?Q?FjSqt3e4WgfkQ9U52rG4flvdyHDsP4ZZtgZRQH8n6LvEdNqO/NdGvy82uT6D?=
 =?us-ascii?Q?I2rZ/hS8oQx2ivihqTv8MAIBf4e95cVEu4HRiBVb8BgSH7ObvnDm+mufb/UO?=
 =?us-ascii?Q?yNb46J+uKOYAPy5iu2hexfVWy3JTd10FxcsXnOvA0HiRHVd/z/r6i0pvaBEu?=
 =?us-ascii?Q?enoSYiSZdZOUiw032TXnAy2EHZuKbtKeBlMmp/gph9HlY+6BAsSfEocUTlNJ?=
 =?us-ascii?Q?a/CgcPcfqVpQFntRa6vP7FMg?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-ID: <B61D66D79FC7724DADEDEDC004CD8853@namprd10.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR10MB4688.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9d755003-88b2-4fc6-71c6-08d98698fd6b
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Oct 2021 18:09:49.3657 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JPFmRFel+pZlPuxBxuK97yfNThvKW1MuLtfSOvgQC2NRyQHShhpeWd+Sf7njmicg19Z2AmpKRtOvj+/AAzYb1g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB4623
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10126
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
 mlxlogscore=917 adultscore=0
 bulkscore=0 suspectscore=0 malwarescore=0 spamscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2109230001
 definitions=main-2110030132
X-Proofpoint-GUID: VR4bW_vHmNciFMh0y8LYTbWPH4YpI4nd
X-Proofpoint-ORIG-GUID: VR4bW_vHmNciFMh0y8LYTbWPH4YpI4nd
X-Mailman-Approved-At: Sun, 03 Oct 2021 18:37:10 +0000
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi-

After updating one of my test systems to v5.15-rc, I found that it
becomes unresponsive during the later part of the boot process. A
power-on reset is necessary to recover.

I bisected to this commit:

572994bf18ff ("drm/ast: Zero is missing in detect function")

Checking out v5.15-rc3 and reverting this commit enables the system
to boot again.

0b:00.0 VGA compatible controller: ASPEED Technology, Inc. ASPEED Graphics =
Family (rev 30) (prog-if 00 [VGA controller])
        DeviceName:  ASPEED Video AST2400
        Subsystem: Super Micro Computer Inc X10SRL-F
        Control: I/O+ Mem+ BusMaster- SpecCycle- MemWINV- VGASnoop- ParErr-=
 Stepping- SERR- FastB2B- DisINTx-
        Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=3Dmedium >TAbort- =
<TAbort- <MAbort- >SERR- <PERR- INTx-
        Interrupt: pin A routed to IRQ 18
        Region 0: Memory at fa000000 (32-bit, non-prefetchable) [size=3D16M=
]
        Region 1: Memory at fb000000 (32-bit, non-prefetchable) [size=3D128=
K]
        Region 2: I/O ports at c000 [size=3D128]
        Expansion ROM at 000c0000 [virtual] [disabled] [size=3D128K]
        Capabilities: [40] Power Management version 3
                Flags: PMEClk- DSI- D1+ D2+ AuxCurrent=3D375mA PME(D0+,D1+,=
D2+,D3hot+,D3cold+)
                Status: D0 NoSoftRst- PME-Enable- DSel=3D0 DScale=3D0 PME-
        Capabilities: [50] MSI: Enable- Count=3D1/4 Maskable- 64bit+
                Address: 0000000000000000  Data: 0000
        Kernel driver in use: ast
        Kernel modules: ast

--
Chuck Lever



