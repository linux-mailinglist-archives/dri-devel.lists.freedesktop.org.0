Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 657EC66B59C
	for <lists+dri-devel@lfdr.de>; Mon, 16 Jan 2023 03:27:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7163710E065;
	Mon, 16 Jan 2023 02:27:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2077.outbound.protection.outlook.com [40.107.243.77])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A640E10E065;
 Mon, 16 Jan 2023 02:27:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VL2f8OQVK/h6VBJkwLudhbK0PrYGjV1r5qMdMtxmzMdxEeMhTixtjS9TNaDJddxr7S/P2ter8vz/kxbK+05EiEGZc1dQcL4b125Dv7ZG9YDLODDC2DpRTH3WywGbmP2u8nMo/iPGJdEgNrPjMzCSdTISWr5uKDEl981ElIZO+7Azox34efDWgvb0Qbj8KZC+tlfHD8zOY44dVGS4f6ioWJ+34CFIEWCshsZFQ3ZJki+N4ZIs4bqSKrMirL5KrWF6ogcLuI+6/z/IOEfLOoWIjeJDcMgsgW6tCpPhTV/OWBVHRfqIh3jFdBZZ2hMz/MDCBduxxZ4x+gve0JwnmojbtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=52ztWwq17GRgIzvvV+YMsbbksgaHDM2xoJqljW6Xj6U=;
 b=f9EtOkEaBXR41aFD3gQIDAl6TNV/Xal99IaVsiwg5YtkVei125mFchiJBjuiQ9FbfLnVh1ot13RxMJfSz78WJbJ1BSPUAYhNlt/FXOFLrl2i8uloxcRdsdhXX31tc3WIG3/7oZrh1QQl549GIDs3nmTP0epEZkwNQJGR18kB0tnBQAzUnoT+Fdrgd6yyx4iiGyQJteX42z7G5ONlN5ai8s3DkqSdQS/f8b7MgkEfE8V4b2V1ze4fpZbbYRKOVmtnyhIOGvtmKyB3C4PktK8jLzLqDUXe2cjo2+SdNYW8C2O5dUFDU50i+j0lFfIAD4FMsVCS0UjLc3LGWFw4gl1+CQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=52ztWwq17GRgIzvvV+YMsbbksgaHDM2xoJqljW6Xj6U=;
 b=5tEEsvHEo6laA0Hiy5LAbVXEbIl5LJeenDlTB346PyitNzlu/ZzxjWSTMgWHE1XA9qDpk2mG/HU/axgXl1VXqkU/GNZ+EaO+UxJ84YIcqqsZaLTqTCqEUItu6QK/QzPrO/2XDlb5F439BtBL4veYGyCJlGu1eoU69IwOwYZwB1E=
Received: from DM6PR12MB2619.namprd12.prod.outlook.com (2603:10b6:5:45::18) by
 PH7PR12MB6466.namprd12.prod.outlook.com (2603:10b6:510:1f6::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.19; Mon, 16 Jan
 2023 02:27:36 +0000
Received: from DM6PR12MB2619.namprd12.prod.outlook.com
 ([fe80::5dc8:98e2:7b6e:a9db]) by DM6PR12MB2619.namprd12.prod.outlook.com
 ([fe80::5dc8:98e2:7b6e:a9db%5]) with mapi id 15.20.5986.018; Mon, 16 Jan 2023
 02:27:36 +0000
From: "Quan, Evan" <Evan.Quan@amd.com>
To: Deepak R Varma <drv@mailo.com>, "Deucher, Alexander"
 <Alexander.Deucher@amd.com>, "Koenig, Christian" <Christian.Koenig@amd.com>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>, David Airlie <airlied@gmail.com>, Daniel
 Vetter <daniel@ffwll.ch>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH 0/3] drm/amd/pm/powerplay: use bitwise or for bitmasks
 addition
Thread-Topic: [PATCH 0/3] drm/amd/pm/powerplay: use bitwise or for bitmasks
 addition
Thread-Index: AQHZKLE7fuzkAUEui02+QI2mNbwaFa6gUm5Q
Date: Mon, 16 Jan 2023 02:27:36 +0000
Message-ID: <DM6PR12MB2619EF8DBE956A8F79A579DCE4C19@DM6PR12MB2619.namprd12.prod.outlook.com>
References: <cover.1673766696.git.drv@mailo.com>
In-Reply-To: <cover.1673766696.git.drv@mailo.com>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Enabled=true;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_SetDate=2023-01-16T02:27:28Z; 
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Method=Standard;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Name=General;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_ActionId=7dfd49c4-0619-48d0-b9ab-5b014d2b1022;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_ContentBits=1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM6PR12MB2619:EE_|PH7PR12MB6466:EE_
x-ms-office365-filtering-correlation-id: ba73e46e-5b10-4618-c1b7-08daf7693b4d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: RaIt0e2d6H49KWCGv8Cw/cbMw+ad4vqouJ7177FDP1PN2e0g96UrDcjjKRiXUKRB4kboj2FXkqD4jUTT0YIRz3Zs+vPXc7msN/u+/sP7i8TclZi5DXMy8wj0CXuoleOt4YfpBt77+fUKw+Kptk8Ksa00fQCd6Lk8vBcZ0ba06AZcgzZdLvQQwPNexkDX+Auv0p1GUbF+xcAWouspmeET6FuMNYQ8tFLS3ToeaccrXjiijBvrbH/0RB6CT5k3QWMAmzvVFHjqKajNJowM8NvM3AGMR6jBDSKWXjiYK6SgTQaGy+ley+kBCGIkp5nQSifYK1F3ESbSMX6zaiUmPLvjVkpUWNlTeOmNvODOTqQ7gCtgUrEaE8aQOFGaMucYASk9rIztlUTlp8OmPTDhmX4BRhGNbnSZtjUzy+UD5Rcun6t1ZiyIM+i5K0iWkZjlIVfNqUF0fmmXhEvFfAg2kISinBIBeClhyXwC4PLbWPk1V7FNEP0EPkJ3NLdT8JfVi89UDepA4rnMu8eZk3BdFZZmgcxgZyxycwDcaoiml3UcSLkZtocQEyryq2X9xPm7fYQuYlwOsDDjO5iaixw8OCK9uDVAaKBxfRNogyUhpYu0BZFXGNmOS9giIrXE4+ivoR1gDQq6OGfuyyc7LuGOfKtT4NyNuZS9Ttrs8c0MpwEdNxSTe/VSrJ34FnWxFMnEqKZz2t68oDO/ivB9ol73bkRqm95MNEKDeUSII9YjkAcJPEI=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB2619.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(396003)(136003)(366004)(346002)(376002)(39860400002)(451199015)(9686003)(186003)(55016003)(71200400001)(7696005)(53546011)(26005)(2906002)(66446008)(478600001)(6506007)(76116006)(8676002)(110136005)(54906003)(4326008)(316002)(83380400001)(41300700001)(52536014)(66476007)(8936002)(86362001)(66556008)(5660300002)(921005)(64756008)(66946007)(122000001)(33656002)(38070700005)(38100700002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?v0fFXDTb2L9RCODrwC+uRO4LRv8oCsrzlomcyYBLtykuh+OxMJ1hP2OYTT20?=
 =?us-ascii?Q?IUOHdyNkCuxGs15ABPBcz9/msIFxQeMLRIIGm7Xm3TqVRexd7in/EKOLrExW?=
 =?us-ascii?Q?aJJzC1yCXQAgMu66KL1d+7GN3hLwsRTaWuFjzp694hVNSfU2YZQEL6N17lAp?=
 =?us-ascii?Q?fR88eJJKCVcao865WsMRHS2MUCowi5W8uqP4vSkg0iApwns4E1cD79MR/CEB?=
 =?us-ascii?Q?aAwBUhu8pblvNbbEpH5P1FA+7xTdqV3aO12FIZIgSJhn7tyVwsbd1VC1Uk3T?=
 =?us-ascii?Q?aJcAxJoTg30DjHe8Moq0Qcpqbg7UyUhRDH5VTm5PZTCgGCNQiL0G58f0mssn?=
 =?us-ascii?Q?JsEKsgj71Ot0OU41yU1NdsFqCaayM0iWLA72U8p8cNrU+tHJsUtVM3y/R85F?=
 =?us-ascii?Q?D4GgWpB4NRZV4dkpLxM/2dUtAn2UYFii9CpE1kohokyxE4Vjtv1DIs5RbSNo?=
 =?us-ascii?Q?aQny0JkKzh/bNSVkAPB5u7JUey/Y/4hOnIaSnz2V5oFKyz3CZIybRBcgsYiZ?=
 =?us-ascii?Q?PPDMP9+usUfXhOy0VQNcAOceRdcvsGffFcszy8uYaXZbIXjwuOZUIjJ/XV0v?=
 =?us-ascii?Q?5nTHn2j9jwKg4EJ3pBNYJqLG+Xm5KMW1Bm16ubMzy4ETiZ0CnMK3nEAeSsx6?=
 =?us-ascii?Q?eAhk0bzbRVOiz+9hfHDOm3XRr/TKuP22xj+AG+X89U/vHHDEQY4rWbUl4pcu?=
 =?us-ascii?Q?nHZUo853gm/NaQ12ZwMJ1/AAcKXAiyAodU0/sNBrQ3i2hjPShKVGY767HzcO?=
 =?us-ascii?Q?D4yy2x3KYXQGe0NytgdfyJ+mYb4Da4xUF9ZH9tOB/BDRZrPVXv+DsS1jlS4/?=
 =?us-ascii?Q?wocNgbLFlj31UeqInNJ3hGLSlLitHB/ZoTr4+iuMzNBeGwu6/6GQ/b3SnBej?=
 =?us-ascii?Q?ltAgAtue08Ded19MD7nrN5jbeYlq1h+mHHfQ6FG4vCHqBZCY9faeK597qNxN?=
 =?us-ascii?Q?KM8Xt/8JSCkC6dXE+PlVyByFXDWy1/kS985DM6AamSLD9I2IW+RYL/RGWKj9?=
 =?us-ascii?Q?rc0lWeUUUsow2gIPzXn/FFchBe8bBgAcB3kKY2FPgI3o5xdTCwq/VgOn2XeG?=
 =?us-ascii?Q?0PAqbcwJy2ny1uO9x17SZqT0DzygPcKrfwX1KOa0J6Rf7Z0cn5jPEu2JfsgY?=
 =?us-ascii?Q?k5pvE7uDIVYBQ9jey8BaxEtYOwI1A4IhMjLsOKuFS6TP00RlC8QuCV3QFxI1?=
 =?us-ascii?Q?3U7id8hr59swk/JXcTN5+ob716TXieqXI1620zBU/QM3j04dpxvAAwhBjWQ3?=
 =?us-ascii?Q?lkh0smiK2cgek8sduyrTrBJogSxEp84Yh+AHvPkHSpSnDDVwiRVHaylhHVLT?=
 =?us-ascii?Q?fIh3ovKnC6ATr8D9AlG1oEUJDx+W/KHc7hI3YszXqh1jZ37tuud41oFc3a8z?=
 =?us-ascii?Q?n563Fu0BOi/EP76a+KXdUkWMl9/W5IlL6pwcYF7n3WTCyVKJ0q+89Mu3n9xa?=
 =?us-ascii?Q?tCc/xovfZvnBUlCHZMuLwdr2sI/kPcTLYBnnph//E05wBFr0ZmKoilUhWcJt?=
 =?us-ascii?Q?dstTfGfnEPXRxxytdBmobReoWOwxqKBNsgzV8yj9RZkKRNc7goC9fA4BjSkZ?=
 =?us-ascii?Q?3AKC/d7anHjZSU4D8hg=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB2619.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ba73e46e-5b10-4618-c1b7-08daf7693b4d
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Jan 2023 02:27:36.4612 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Qf8uN4NVo1FJ0a/5f86KTq4+iaEX8DDSsw026+wti8JzfXyJAOqEPcKrHdetDCvr
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6466
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
Cc: Praveen Kumar <kumarpraveen@linux.microsoft.com>,
 Saurabh Singh Sengar <ssengar@microsoft.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

[AMD Official Use Only - General]

Series is reviewed-by: Evan Quan <evan.quan@amd.com>

> -----Original Message-----
> From: Deepak R Varma <drv@mailo.com>
> Sent: Sunday, January 15, 2023 3:16 PM
> To: Quan, Evan <Evan.Quan@amd.com>; Deucher, Alexander
> <Alexander.Deucher@amd.com>; Koenig, Christian
> <Christian.Koenig@amd.com>; Pan, Xinhui <Xinhui.Pan@amd.com>; David
> Airlie <airlied@gmail.com>; Daniel Vetter <daniel@ffwll.ch>; amd-
> gfx@lists.freedesktop.org; dri-devel@lists.freedesktop.org; linux-
> kernel@vger.kernel.org
> Cc: Saurabh Singh Sengar <ssengar@microsoft.com>; Praveen Kumar
> <kumarpraveen@linux.microsoft.com>
> Subject: [PATCH 0/3] drm/amd/pm/powerplay: use bitwise or for bitmasks
> addition
>=20
> The patch series proposes usage of bitwise or "|" operator for addition o=
f
> bitmasks instead of using numerial additions. The former is quicker and
> cleaner.
>=20
> The proposed change is compile tested.
>=20
> Deepak R Varma (3):
>   drm/amd/pm/powerplay/smumgr: use bitwise or for addition
>   drm/amd/pm/powerplay/hwmgr: use bitwise or for bitmasks addition
>   drm/amd/pm/powerplay/smumgr/ci: use bitwise or for bitmasks addition
>=20
>  drivers/gpu/drm/amd/pm/powerplay/hwmgr/smu7_hwmgr.c      | 8 ++++---
> -
>  drivers/gpu/drm/amd/pm/powerplay/smumgr/ci_smumgr.c      | 2 +-
>  drivers/gpu/drm/amd/pm/powerplay/smumgr/iceland_smumgr.c | 2 +-
>  drivers/gpu/drm/amd/pm/powerplay/smumgr/tonga_smumgr.c   | 2 +-
>  4 files changed, 7 insertions(+), 7 deletions(-)
>=20
> --
> 2.34.1
>=20
>=20
