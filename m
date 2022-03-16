Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AC1394DA70F
	for <lists+dri-devel@lfdr.de>; Wed, 16 Mar 2022 01:46:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B72C010E0E4;
	Wed, 16 Mar 2022 00:45:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com
 [205.220.165.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF04310E0E4
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Mar 2022 00:45:58 +0000 (UTC)
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 22FKiOEJ018452; 
 Wed, 16 Mar 2022 00:45:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : content-type : content-id :
 content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=qA4RH4vFODD26E9kzMiqSQsWatDBSVCgG0zZcDWwGas=;
 b=wy8V2bzAhCo4whRa0yFINCk7AVEriLr9VjOswXsQId5DPPkya/Xj3f4TT6itD5nOMeSb
 KSfNq5kz6wF/96yTjt5Ae23CSCIWxGpmofkly1gVPuawqFWgwxnz8pkGrRmaHSFaJizv
 guANcLv2KqDB2icH10Oj0HYhPBo6+9llzCzyQXzOiPMzGOExlR5m8yf8FNJNc/0zr9ol
 yyQ1vxaSLc5Of8TvJNml92F0fyZeCKcvIRcKN16C9UK6BvGQzsFGcdBHKOP4n4Ohp/nf
 0BZTv6JQdm93BwalrUHs5bdsi4gv+B1Z5/K9p88b2Lw6FCtWupBgDiK5BcqZA/4KZULv oA== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by mx0b-00069f02.pphosted.com with ESMTP id 3et5xwmj3r-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 16 Mar 2022 00:45:57 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 22G0gARO138319;
 Wed, 16 Mar 2022 00:45:53 GMT
Received: from nam04-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam08lp2045.outbound.protection.outlook.com [104.47.73.45])
 by userp3020.oracle.com with ESMTP id 3et6588ec8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 16 Mar 2022 00:45:53 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hQnXswiIe8WhdX87vhVuJdkSZ8HHpYnCUlF+ZuPF3TyfmC1UiWynKuPmMQMuTPLPETN7ttskIWLBZqAH2TX2IHX0HguYIK9ukeF2gid9rXhbKXTZ+S8nOf7x/QNlP1oJV2NR8oEEwtiJvLcbV7J/cb0nhA/2UIQA2SBs4vCvya4WVRP5ERitS7lGbPnWKCEUM1+ZgFlhxAspBJ2rxZXv9qUl4qHhhB1VdO3hRyml9sc5rSpbiXrW1zSgHIMeTLJ9EzRJAmGjkwQotssR/hKsr0WTQn5piIRqD3PDgMjGT5mZGg7H/g+wenp/SRtnQlw+sqMeCAFe47Rh4a7SpSRU0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qA4RH4vFODD26E9kzMiqSQsWatDBSVCgG0zZcDWwGas=;
 b=cXu4mcCsxdcSwHZbKNp+ivq9uaZWXLonQEtmn+K/CP+kMrpP4dNV6zvS95rMzOzOdWqnWa9eGt+sQVWIzr/qWW9hmKapgUmiWr6o7Ux9IZD4WgdR6XHBzySjd0Iaqk82S+ELr1JYqEbTFl86Cnh2+6YN6m7+8Bs9ICVwUQe+vgSaH9I7IkW3Db58nyNtu+U0vCtBAANZYtZAYJALwp1h50KPnOxsSkc+XNELFOaMwIqq3y2ym5VfVb3bWOoDThTQSZXhWESNwQnCKjp8PNajfOErVPLY/Ct7XZkSKzxXZg3lvhGXGow60Pa8nMVCaDkY/BLFcnM9JC92zrKp8XXTDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qA4RH4vFODD26E9kzMiqSQsWatDBSVCgG0zZcDWwGas=;
 b=rwtUAznleOp0bNnXzN2KWGP4nOi5eWr532NdCoC8TeU+R3swB6RfSYmPHnpjI3n71pBR9Z5KBDyvyJSmYG63PBWQjS4VbzjgLNUogUcrXI7YjmmMZoRwjASiLefJLSFU/qSCZVNk54+rA1AaucGgX3uWjbwkQFrSQWNPFMemm2Y=
Received: from DS7PR10MB5134.namprd10.prod.outlook.com (2603:10b6:5:3a1::23)
 by PH0PR10MB4582.namprd10.prod.outlook.com (2603:10b6:510:39::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5061.25; Wed, 16 Mar
 2022 00:45:51 +0000
Received: from DS7PR10MB5134.namprd10.prod.outlook.com
 ([fe80::1422:288c:c410:93bb]) by DS7PR10MB5134.namprd10.prod.outlook.com
 ([fe80::1422:288c:c410:93bb%4]) with mapi id 15.20.5081.014; Wed, 16 Mar 2022
 00:45:45 +0000
From: Chuck Lever III <chuck.lever@oracle.com>
To: Zack Rusin <zackr@vmware.com>
Subject: KASAN splat in vmwgfx driver
Thread-Topic: KASAN splat in vmwgfx driver
Thread-Index: AQHYOM8rPVlc0tAUtUWLkaZ1uU6s1A==
Date: Wed, 16 Mar 2022 00:45:44 +0000
Message-ID: <A31D4988-1D08-438D-B1D3-F80DDB244D62@oracle.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3654.120.0.1.13)
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 379c7ec7-95cf-4ab6-4996-08da06e64e6c
x-ms-traffictypediagnostic: PH0PR10MB4582:EE_
x-microsoft-antispam-prvs: <PH0PR10MB458223D640DB5A3CD463973093119@PH0PR10MB4582.namprd10.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: NBLgPir/N7VGSks6sfNqvSLdBTBAHlR4PSjOYIsX3X5CtnLlY6ftwfge9XF1rB3+ydZhJVuHuGiCOWBOHCRpkkhpP/KPZRwHzxfraB1MaEq5U2g1YCKfFQMU/5lXQRKuz6VLt4GULgCSoyDZQL8bTjJFPZUPcj8e1JA2s/+/ovAGJlNtu/l30WFlh01NDhd1xTcxC241jnN7/xIXtUP6x+iQJaPRQ4/AMEBO1kALpjx05WPcJtZ4zciz1G+vm3Vi+Z2B1ZOyK8+vxJvFs502QFBg50lTWLOSwcdIgU7IY4XknXY471qVlJ/pCZHLthBXQoS3uzAwhFmXX3bS0SSIVbzmgD7pN5mP9RTd2mCiOUvkJKNDlitj/2pFnCM1Oyrg6e9ePpq7U72iIoHZyNJjKu/Kv7o/iJ1FU+t+1Zn7uH9oY4Y5MG7B84FolGQieza1oXYgQAUp2zUapshQBc8f7Ijq8Kxlm6GQQi9KoPUrjv02O7veMtkGq9Q7Uie9z9M17vPpSCIQwKtrTHqYnf3Hq/zpGciS5PE9KgVitS/Bp4qBI4wKLX/qoXl5RKsvJ7Hz0LPQiMTBMv2N3P9m+GttLqurQBrb22iO1fkOp+3jdix2WB0E65RhzBd0R5mlnzFl5akOrF3aNGCvZ0rmMSYwsHaxB5o8eiyUpPHiBoN1oVPldI/aT+MhlUjgLxPYncst3j7vQfkNXRTIKZ9MpStoorOLw41Nm+sK+oDVk+YQN8seiykg4ihW769oJI6U1dTMbFp9gUUyW8407UkMkNcLew==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR10MB5134.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(91956017)(6506007)(66946007)(5660300002)(38070700005)(2906002)(508600001)(36756003)(76116006)(8936002)(66476007)(66446008)(64756008)(66556008)(38100700002)(83380400001)(186003)(2616005)(26005)(316002)(122000001)(8676002)(6486002)(86362001)(33656002)(71200400001)(4326008)(6916009)(6512007)(40753002)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?cBxeS4UnyPN7ekOoXnlKg04ysECN+s3Ij6aFaNju2PNoN0zbJ1fxPcaEUk5/?=
 =?us-ascii?Q?RIYH4nlNElRA6+QJnN+lLQHH5ugark9wSLrNQcqRVEd+tqYZaGqAjtUnUuSz?=
 =?us-ascii?Q?hXzxwNx9wL2qP/GypQU5V9ZFOzf+JZMcgB7KgNWWygbrFttA/4TP17i3NYVz?=
 =?us-ascii?Q?gGE5c6kvuzCfih78WPPxhhoXoXaydH09WYrvoDgzSKQhIoY/qGZ03K7d643M?=
 =?us-ascii?Q?yF+2lEwksg1VoEckkp5VWmZRuFJBQfakXUrvLalree//hAO12ER9z3PrqYTG?=
 =?us-ascii?Q?gv2rsDoWYs+p+pFFOZryuTIXvDETMtHjEQZvQ4vAXeJGu2zx1vw+sKh/UYMR?=
 =?us-ascii?Q?WLO5sUF2TTq11n1Rdv2rXYebXRgtlZOL4tNxSyER77YsNTjLIqiRWl7sbJQY?=
 =?us-ascii?Q?OqLLoky5br5Z9ad9wFXtDxI3z+UmO3nBfFesKlnbxXssR5r2bYvCA74/EohN?=
 =?us-ascii?Q?8SGpkr+8GbYfaI0HmtyCLKU5BYUYPvoQCDAAV+Hf7g1qBuJQoxNZnkifWL3P?=
 =?us-ascii?Q?WGx1yish9f8NbPg8CUyzFQ3EC6x5GqZVcW28j+x7DmcTgSipl6c6rtJHXgDB?=
 =?us-ascii?Q?hB6TcULkntokZaKtR6PPveAaK/YYGwAZLjiVyt+VU7S2Uu7GGdzwCy/5hnT3?=
 =?us-ascii?Q?KfKAhreYKYIaqCaihc1V/fTFJNgJWkM70Dw6mII7QM+amtpsXGNK/P36i/xC?=
 =?us-ascii?Q?UI5uGkHPpx8d9u+0Aef6gWPptYhs9Wr5XYWzt/cV6rBYQWLI+nKN/L87LuA6?=
 =?us-ascii?Q?umw34WlYOp5oGx7821Xv7Q8Mk/FtGbFaoGQlDrPuPRllU7TpoqFgzhSX2hzS?=
 =?us-ascii?Q?ZunkFaO5xHJG6NG5Inq0KztLQgDGOAHjNz5yIFcsMKX4mN+/30JQIeBF5mkv?=
 =?us-ascii?Q?+8OMdxgijikEXQ15h54VT1u/J0CXYk+XQcX0N8UoDm2oGyNUGvmyicYdanYy?=
 =?us-ascii?Q?VNPEkiiLSmtSOEc38/BbhpAfNGdRLK3qZFCqyHfjSiSe79olkAWEKdCHsP+w?=
 =?us-ascii?Q?7I9TfCJCe6uXSVVgynPpvbMadZScLjRI41WUqIEKAGv2FDCC5WHbtNeI3DMU?=
 =?us-ascii?Q?c5XFNGAdlJlPqauErZMcY4bGOjECqK8ALDMonY4c7JafRxcLJUFrQAPClxE6?=
 =?us-ascii?Q?AsnnacGpbC4wI0PCzrtLr2EpdfLbvyO8azjZkp6cye/O7Y4BwUD/HkV3r5MK?=
 =?us-ascii?Q?u/KLCizaihssNOr5kmtwC4KLz9w8HmA00lbLsN9O5Gvw5b+pEz6WQ6ZsZvmn?=
 =?us-ascii?Q?iguG0xCHKSBx6ayyPogPEaq5RGeT3EQQ9dr5uhZnR+etd6bCryaRsdBicuIM?=
 =?us-ascii?Q?g3dp61BJvLZDLILQ25pf+FlH0aDfS94ITCU62RQ23NuYnEC8FrLcJQuXU4tq?=
 =?us-ascii?Q?WheUGFrXI0LxMi/Jcz4MwXuL7E+vhwXQkiF0EPFJsiJUkAZIPKtdYm7OrOaC?=
 =?us-ascii?Q?XqJrgG+O916XAJ75/Xae8LKkk/4ma+u9N+gSNvqEgSe3r4Trs0Kt7Q=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <44D5901ADCD559448FEC118E69D0B4B9@namprd10.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS7PR10MB5134.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 379c7ec7-95cf-4ab6-4996-08da06e64e6c
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Mar 2022 00:45:45.3685 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: MONg7S0wFCJfDyOl3+MG/dBq211jIn0wPuz6JQBbQneO07fEAf1e+pEdPrsSgLb8YLl1OLUyczCThNKFBh5Z4Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB4582
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10287
 signatures=693139
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 spamscore=0
 malwarescore=0 adultscore=0 bulkscore=0 mlxscore=0 mlxlogscore=954
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2203160002
X-Proofpoint-GUID: N6Nt-ROyknXLXz_fFypSJ-uJPqB6rnA-
X-Proofpoint-ORIG-GUID: N6Nt-ROyknXLXz_fFypSJ-uJPqB6rnA-
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
Cc: dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

For a kernel development project I'm working on, I'm using
Linux in a VMware guest. After kernel v5.16.2, I noticed
this KASAN splat:

Mar 15 14:50:39 oracle-102.nfsv4.dev kernel: vmwgfx 0000:00:0f.0: vgaarb: d=
eactivate vga console
Mar 15 14:50:39 oracle-102.nfsv4.dev kernel: Console: switching to colour d=
ummy device 80x25
Mar 15 14:50:40 oracle-102.nfsv4.dev kernel: [TTM] Zone  kernel: Available =
graphics memory: 2027952 KiB
Mar 15 14:50:40 oracle-102.nfsv4.dev kernel: vmwgfx 0000:00:0f.0: [drm] FIF=
O at 0x00000000fe000000 size is 8192 kiB
Mar 15 14:50:40 oracle-102.nfsv4.dev kernel: vmwgfx 0000:00:0f.0: [drm] VRA=
M at 0x00000000e8000000 size is 131072 kiB
Mar 15 14:50:40 oracle-102.nfsv4.dev kernel: vmwgfx 0000:00:0f.0: [drm] Run=
ning on SVGA version 2.
Mar 15 14:50:40 oracle-102.nfsv4.dev kernel: vmwgfx 0000:00:0f.0: [drm] DMA=
 map mode: Caching DMA mappings.
Mar 15 14:50:40 oracle-102.nfsv4.dev kernel: vmwgfx 0000:00:0f.0: [drm] Leg=
acy memory limits: VRAM =3D 4096 kB, FIFO =3D 256 kB, surface =3D 0 kB
Mar 15 14:50:40 oracle-102.nfsv4.dev kernel: vmwgfx 0000:00:0f.0: [drm] MOB=
 limits: max mob size =3D 1048576 kB, max mob pages =3D 2097152
Mar 15 14:50:40 oracle-102.nfsv4.dev kernel: vmwgfx 0000:00:0f.0: [drm] Cap=
abilities: rect copy, cursor, cursor bypass, cursor bypass 2, 8bit e>
Mar 15 14:50:40 oracle-102.nfsv4.dev kernel: vmwgfx 0000:00:0f.0: [drm] Cap=
abilities2: grow otable, intra surface copy, dx2, gb memsize 2, scre>
Mar 15 14:50:40 oracle-102.nfsv4.dev kernel: vmwgfx 0000:00:0f.0: [drm] Max=
 GMR ids is 64
Mar 15 14:50:40 oracle-102.nfsv4.dev kernel: vmwgfx 0000:00:0f.0: [drm] Max=
 number of GMR pages is 65536
Mar 15 14:50:40 oracle-102.nfsv4.dev kernel: vmwgfx 0000:00:0f.0: [drm] Max=
imum display memory size is 262144 kiB
Mar 15 14:50:40 oracle-102.nfsv4.dev kernel: vmwgfx 0000:00:0f.0: [drm] Scr=
een Target display unit initialized
Mar 15 14:50:40 oracle-102.nfsv4.dev kernel: vmwgfx 0000:00:0f.0: [drm] Fif=
o max 0x00040000 min 0x00001000 cap 0x0000077f
Mar 15 14:50:40 oracle-102.nfsv4.dev kernel: =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D
Mar 15 14:50:40 oracle-102.nfsv4.dev kernel: BUG: KASAN: slab-out-of-bounds=
 in vmw_query_move_notify+0x206/0x230 [vmwgfx]
Mar 15 14:50:40 oracle-102.nfsv4.dev kernel: Read of size 8 at addr ffff888=
13101a1c8 by task systemd-udevd/405

Bisected to f6be23264bba ("drm/vmwgfx: Introduce a new placement for MOB pa=
ge tables")

I don't see an obvious fix for this issue in the stream of
subsequent commits.


--
Chuck Lever



