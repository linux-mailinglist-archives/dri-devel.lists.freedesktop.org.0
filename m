Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C3CC587E66
	for <lists+dri-devel@lfdr.de>; Tue,  2 Aug 2022 16:51:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8285718A0D6;
	Tue,  2 Aug 2022 14:51:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2069.outbound.protection.outlook.com [40.107.92.69])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B7C48D9E2
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Aug 2022 14:51:08 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QQySUgIbF84mGKG/wiIhhpc+nlxHb//fK1P9ECCWEKMraCeip0+hCeRQdOE9PD8BQWGSjFxfe9vN+pmmnBQgvuzp1D93zgQdWeId9hjdMio2Ayfg8IbrLoH8/RCSDYlNxI6v1B4NuYHKbmeBGhiWW7LempocNjQYkNodWi/bng3eUXN+3QvLG8B0yxRV/qsZqbbD7VzObLOuzGBOfCBeKuBZ3oJvALFGv07jWERkkbA5XKNNNSb4Mk6uZpKtYS1YMUfTFv+Vsfe54ez8JyZ+wrCcFIa4Hpc+mwo1XrIKAJWVwRN04rgwaxb5FiLjBv4mIV/6ZZ2EKVWY5wj8zFcKig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GhxGrre6ruuW6/P+Nb25eiHK7HwVlDXBL8jdPpCgzn4=;
 b=Yfg7sfilWtubJSbOpl7cblAF+LC8n6+6UvtG/h4pxKYoFoFAXJosTgJrs/FQLzqeK4ipKxXyBBXhA79nVPQ/WAQvgCe4nSMp3E88FpyBhqxxjwhUB+L2ULwkwbgsDkByFRjIjyLcZOD8KDLqli7SKhJ+b7Bx2eE/BdPm09bQO/RgLQYdjrhL608JQuy7DODJWCk8Lma2quFWNmVZe44ITQcFOmPQg5C6HiXVvfKYpl2o4YoFCINNUl2nxkZd1iYabdddX2hiX5p0W2lzvdVNTxdmHxqBGby8vl4W7g/JhOpMTkkDg07L+fTA4WSDmYLOi+0B7eyUykvxkIf0zkOpaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GhxGrre6ruuW6/P+Nb25eiHK7HwVlDXBL8jdPpCgzn4=;
 b=gFWj4/Tw/fnCN4TEU3XKAfH+u0d/0TkFCalsyG5ieI3f38cuEAXDQ79gSWHRfCbMeBXKo4jbB57W8aY6WPx8vBgzfmgW+294LR+7rOTjSfprpFrk4KSwV5ydh+U2z1p+dYufed8RPgeiKWLyGyspZX/L+46/xAKz0evz4AkroqI=
Received: from BL0PR12MB2532.namprd12.prod.outlook.com (2603:10b6:207:4a::20)
 by DM6PR12MB3018.namprd12.prod.outlook.com (2603:10b6:5:118::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.14; Tue, 2 Aug
 2022 14:51:04 +0000
Received: from BL0PR12MB2532.namprd12.prod.outlook.com
 ([fe80::400b:e1cd:d1d9:cf07]) by BL0PR12MB2532.namprd12.prod.outlook.com
 ([fe80::400b:e1cd:d1d9:cf07%7]) with mapi id 15.20.5482.016; Tue, 2 Aug 2022
 14:51:03 +0000
From: "Li, Yunxiang (Teddy)" <Yunxiang.Li@amd.com>
To: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH 1/2] drm: Fix vblank refcount during modeset
Thread-Topic: [PATCH 1/2] drm: Fix vblank refcount during modeset
Thread-Index: AQHYnhVliXeV1afwyUqegct49IBZHa2bkAzs
Date: Tue, 2 Aug 2022 14:51:03 +0000
Message-ID: <BL0PR12MB25320ACF07BD166E796400A9ED9D9@BL0PR12MB2532.namprd12.prod.outlook.com>
References: <20220722215234.129793-1-Yunxiang.Li@amd.com>
In-Reply-To: <20220722215234.129793-1-Yunxiang.Li@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Enabled=True;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_SetDate=2022-08-02T14:51:03.191Z;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Name=General;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_ContentBits=0;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Method=Standard; 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a90735be-b4d0-421a-c3f1-08da74966c4c
x-ms-traffictypediagnostic: DM6PR12MB3018:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Pges+qbufd2U6nWYNHaaV+lbv30sejhNJyyUR6A4LDHoes0mwAR4zg3HcyGmZH6M7P9iDkBJYtF7BpENQvQZJFhT0ONJEz8WGMamfS6sLrJ6Gf4fUKC16TJMwndDa+8143ZGJcePDIsfJLZ/SODpFCMSJmuciTD3HhS7Gayt4oXNBxr0R7a8WVrhRyjAPIPMyp+Ia6FLY5K5Z89rruR9dtNy1lxwllMu9BA3GMVOTwcdHH3PufjISIcHbRvDoVlljSsPaLKpDtZ8DYaZFFZFNDoguLLpsSagIVhOXoziuMDSYBv/tyGY1Z7kKWi4QwZ9RLvORtpXLYpDgNGTSvs3pncsYxY1TB/ayvFrjeQ7Hsu0Kc6ayPvcOOT4FNl5/Ysd4WRB22xvt+4SVqigN0n9Wg7OlbRRAiIvtxvx9jyJodPkEkjC14FazQBpPhQDGXFJlre/AHKJ+XJG8ExXPmbZjNW6mzDQtepoazbMmI2EYuBlXJtVkz71P83MdCZijHqdHEl1MDmHmudh/ZkkS2j1L9ga8Xr9nC/DnASrPQeqdtlqjna2saaOLUiMd52aNafldBsZUY7uDhUqN17G3SGug4+RTOSAtgAZu+/JeccTgqxv4KFq6xRgDUKDjxA4boyUcoZOXes1wmD296NEDPq2wErKw/QUm+NPY2dZBUHMRh3jPIHISKTRR1WPb9G6DvJT8cco3Ib7h/tGhD7K2tO/i0N7QsZQqinKWUxP984N7VUpYv3lE8kNRLckUNyeUxmzgdleA0xiKNLMDG2OsAHSXbok59u4byWXyU3XFs04XaT2vjrQVCQPmM/D0TJ1HON1
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB2532.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(396003)(376002)(366004)(39860400002)(136003)(346002)(6916009)(9686003)(122000001)(26005)(86362001)(8676002)(6506007)(7696005)(76116006)(66446008)(66476007)(66946007)(66556008)(64756008)(38070700005)(5660300002)(186003)(8936002)(38100700002)(4744005)(52536014)(91956017)(316002)(2906002)(19627405001)(478600001)(33656002)(41300700001)(55016003)(71200400001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?RZVzRm+CBRM8Ed0Eo6ikFYFFJbFGoY5V5f9Sa/v1vZPc+HEipa1011KEbo?=
 =?iso-8859-1?Q?KL4ID9TM7NQrLaYg4wyWx/YLdurH3LDh91LGmRuk6RU4ytvCWudvW7UldN?=
 =?iso-8859-1?Q?bXoEewFREDF5R74LNIYScbO4G7uhtawKu8wFIXEs3jdL8Jk3VbBVbngcn5?=
 =?iso-8859-1?Q?aKO6nUT+8AZjGnBZAqKB36+XOmZ6KBYnHb1F2LOxNpsJSAvqASCiV6zwuz?=
 =?iso-8859-1?Q?eLTLGTujrUVko9Gh47V4Y70vUB09RcY+nguTFF2udz37P7kx4h2TDLIu3p?=
 =?iso-8859-1?Q?gx/05NJGuaEFNGK4YaFf48Pbj1nhCESuZ0ShbX5LP1uH8/hyLso2WTOn9r?=
 =?iso-8859-1?Q?5sOraKgCDic/ApHeK1499ClHTygaG6mJFIg/unexhpHYo7sKdYQK51Ie6e?=
 =?iso-8859-1?Q?1jk4eSAzeeTdOPEIkhzOrzUg6Wx0mgFcz3SFt9WcxSmxL22lOCxf36MXgt?=
 =?iso-8859-1?Q?cAX/QmWyphuY3fS8IwOwl5LlHgrdWJtSxsLZFTuzP17JfCeOIyzwB2jpYy?=
 =?iso-8859-1?Q?hfidrqXVMmLbDgK3/ZfRGzb+9yGjzfAeiSrMS0ec2owaxUkIK/iZL3ABEd?=
 =?iso-8859-1?Q?bpGJWA3T2reecqO0C+ZANLgOILcKj+Pw4ivhZ2CNLeYWv504Ave77jYyK6?=
 =?iso-8859-1?Q?LaFJispngm37p5ced7CGwbOoA0CUTH0om4VHzStCrLyFjN8K8Xik/yJ00e?=
 =?iso-8859-1?Q?22FA7lgsH5iX4Tu/FsUOF6L8hSlKcKIJKs91AXEqezKTrK9vffdAhkbCgg?=
 =?iso-8859-1?Q?OPP7n+KxeiCEQiSKuyI8Xqy/cUysajqWQPuEyK0PBKNVA97XQh22dbksFB?=
 =?iso-8859-1?Q?QS7homXWPt59GW2i34LCsODk+eVTIocLt0QM6PMCKixsL8KTk3YZBDaest?=
 =?iso-8859-1?Q?6qW1e0xPoKreWjRPd5KMGPIY7o3Wirafxst74Ioigc+zvPoitRSZ2Lroa0?=
 =?iso-8859-1?Q?R9brHb08Atf7bTJTTAMYCAGHlbEeRSlZhLWy/PyfHc1X7QVolqcu1+Bz91?=
 =?iso-8859-1?Q?A9Kupbj9Mz091CA464gSwVKShlqOopDHP9jXVPeAygjvZdqtYX6OsVtbtf?=
 =?iso-8859-1?Q?Alosfmie1bEnFjEZ/YE9xGVTR20h8HXaCmNPvKVNqDsfvumO8onflf/kIA?=
 =?iso-8859-1?Q?JOXp+mrWIN+sGkuhorMkOEVU0FpdqArOHbgvx/irq2RfK03UTrrRgHSHWE?=
 =?iso-8859-1?Q?PnenVhEfgxO6c/2Q5jgoq/0/beq6V1IHczIGCN1oAl9vIyCzNpBoJF+tfL?=
 =?iso-8859-1?Q?BvIB+tParfP8tcNmYBa8EH80zLx2oaPebNQM0FZBkEcwHfvxYhC6m1bw0q?=
 =?iso-8859-1?Q?fZRwq2NONEmjyyqkpZtKzDghzC8eG6bCE9VLmBqaqiroCu5t0gErDmatpR?=
 =?iso-8859-1?Q?VwUNneIvYBA941JQ9okiPykjaI/kh/Gl5L4kh81hCn4F4hkyHx6wJq5G6g?=
 =?iso-8859-1?Q?8pNZMgbyrdVdHnvzoX7GNWu0RVWaNzZCSDSAq5frw/46/T+dCrl/maunEE?=
 =?iso-8859-1?Q?n4/FiucWmrFdtoEyfmssJ7iuUfmHAVoKN1D18zV6WGWhpwtOhsqGdXe3R7?=
 =?iso-8859-1?Q?NxoV51hf/Z//BPj7hYlU72rmqXPLM2IAIP7jQoCgMEMg5vcdWY7bPiOF9e?=
 =?iso-8859-1?Q?T4S5LyGywJisQ=3D?=
Content-Type: multipart/alternative;
 boundary="_000_BL0PR12MB25320ACF07BD166E796400A9ED9D9BL0PR12MB2532namp_"
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB2532.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a90735be-b4d0-421a-c3f1-08da74966c4c
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Aug 2022 14:51:03.6764 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: KWM89r9Pzev/iBavIGItQGjOru4MFILkWD/jybssFZ37iQiGtgaL6mwKGiAWGXbAQIRsINGs4eRcZg1q1ftdxA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3018
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

--_000_BL0PR12MB25320ACF07BD166E796400A9ED9D9BL0PR12MB2532namp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

[AMD Official Use Only - General]

I found out that elsewhere in the drm code (e.g. in drm_atomic_helper.c) ex=
pects drm_vblank_get() to fail as part of normal operation. So this patch d=
oesn't seem appropriate anymore and it seems more appropriate to hunt down =
all the unchecked calls for drm_vblank_get and fix them instead. I don't kn=
ow how to best make sure this doesn't reoccur in the future though.

Regards,
Yunxiang


--_000_BL0PR12MB25320ACF07BD166E796400A9ED9D9BL0PR12MB2532namp_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<p style=3D"font-family:Arial;font-size:10pt;color:#0000FF;margin:5pt;" ali=
gn=3D"Left">
[AMD Official Use Only - General]<br>
</p>
<br>
<div>
<div class=3D"elementToProof" style=3D"font-family: Calibri, Arial, Helveti=
ca, sans-serif; font-size: 12pt; color: rgb(0, 0, 0); background-color: rgb=
(255, 255, 255);">
I found out that elsewhere in the drm code (e.g. in drm_atomic_helper.c) ex=
pects drm_vblank_get() to fail as part of normal operation. So this patch d=
oesn't seem appropriate anymore and it seems more appropriate to hunt down =
all the unchecked calls for&nbsp;<span style=3D"color: rgb(0, 0, 0); backgr=
ound-color: rgb(255, 255, 255); display: inline !important;">drm_vblank_get
 and fix them instead. I don't know how to best make sure this doesn't reoc=
cur in the future though.</span></div>
<div class=3D"elementToProof" style=3D"font-family: Calibri, Arial, Helveti=
ca, sans-serif; font-size: 12pt; color: rgb(0, 0, 0); background-color: rgb=
(255, 255, 255);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Calibri, Arial, Helveti=
ca, sans-serif; font-size: 12pt; color: rgb(0, 0, 0); background-color: rgb=
(255, 255, 255);">
Regards,
<div>Yunxiang</div>
<br>
</div>
</div>
</body>
</html>

--_000_BL0PR12MB25320ACF07BD166E796400A9ED9D9BL0PR12MB2532namp_--
