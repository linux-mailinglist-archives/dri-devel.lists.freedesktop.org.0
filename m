Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BF7BB58899A
	for <lists+dri-devel@lfdr.de>; Wed,  3 Aug 2022 11:45:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA46018A03F;
	Wed,  3 Aug 2022 09:45:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2042.outbound.protection.outlook.com [40.107.94.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 76E6118A00E;
 Wed,  3 Aug 2022 09:44:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bGF9rO9wXTxfs7lk3PDIvEF8bH99dXYwtovpvN8gsw/JJ2LwCTx2hZjY/MLxcDq4mw3X6FCE1/tGp/pqkTHJfc8758rVSl5u2lGcxHZLaPYbTcBCMisIhBb+1wjufdwdDbsgA0gvRVOrKxldps5DfBAbSzeC+Wljv3Z3b5b+DkJ4chvzH1jemG2lGWLvF4UKws4Aehmxud+DyjavI8NumclbxNwK2LmZyfAPQbC7UdzdkRIT/xku/fIl9O8unuBZCvnV0nAQ3prUUtAk7akFF+Ql2Jw1frAMeEYWT89AiAc7zyzM63XE6E07RImHZYmqVXb+8Egex0xvV/sfxuxM3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=szHf4s+88m0CEqNN2QZ1zx+hWp5iUeNXUQPAHii4v+4=;
 b=gQA6IaKU6F64Imx5O8nlOElIdI9EtvkBj7dZeRywY6yIYkfWzBDXFUiX5ouZ+CBXKciZA1b0TJI+lQkuap2KdSOkUJBN6otcFJ8YCj11YhtuKZGHGqcFMaW2P/00/V7ErEZ7hH9WAj8Gf8W79P1IJRKsgKC9Ih7ELL2wADzw5z6/Egw9NGEGt7l1b6msLQo/2K2x90cbxAACF7reSoqnsDHJemb//P3f5HmkmVznZ+RabRV+l0QegjC2z235KQlOb1k/Wg95whVZd9eSyjSxl0frWjLvgpYZ68i+SFm9T5QZIr7jY7wpQ1drYA57AYKIL5nMEEkVDX5gUDa8VML6uA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=szHf4s+88m0CEqNN2QZ1zx+hWp5iUeNXUQPAHii4v+4=;
 b=OCySqVkLxYib49E6dAV+sNSUHDtl6V6xZVCDXol5trK1R01/8cyOQsF7Z2YBUu9DNegqbVmDrQp4GJuBXcoV3q7a580zws9vU99LsyuzSKW7l7/Q3SG7CU361Lo6c4pDOPqKQLQUHs4LL3U8APeT0PE0f2w7bbFqBmxa0nDnol8=
Received: from DM6PR12MB2619.namprd12.prod.outlook.com (2603:10b6:5:45::18) by
 DM8PR12MB5445.namprd12.prod.outlook.com (2603:10b6:8:24::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5482.12; Wed, 3 Aug 2022 09:44:44 +0000
Received: from DM6PR12MB2619.namprd12.prod.outlook.com
 ([fe80::4c95:9b06:87e6:4382]) by DM6PR12MB2619.namprd12.prod.outlook.com
 ([fe80::4c95:9b06:87e6:4382%7]) with mapi id 15.20.5482.016; Wed, 3 Aug 2022
 09:44:44 +0000
From: "Quan, Evan" <Evan.Quan@amd.com>
To: Zhen Ni <nizhen@uniontech.com>, "airlied@linux.ie" <airlied@linux.ie>,
 "daniel@ffwll.ch" <daniel@ffwll.ch>, "Deucher, Alexander"
 <Alexander.Deucher@amd.com>, "Koenig, Christian" <Christian.Koenig@amd.com>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>
Subject: RE: [PATCH 2/2] drm/amd/pm: Fix a potential gpu_metrics_table memory
 leak
Thread-Topic: [PATCH 2/2] drm/amd/pm: Fix a potential gpu_metrics_table memory
 leak
Thread-Index: AQHYpxpQryhDJqQVRUCYhQ/o9FJ3I62c7NUA
Date: Wed, 3 Aug 2022 09:44:44 +0000
Message-ID: <DM6PR12MB2619E2FF16B6C68483876874E49C9@DM6PR12MB2619.namprd12.prod.outlook.com>
References: <20220803091959.10030-1-nizhen@uniontech.com>
 <20220803091959.10030-2-nizhen@uniontech.com>
In-Reply-To: <20220803091959.10030-2-nizhen@uniontech.com>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Enabled=true;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_SetDate=2022-08-03T09:44:41Z; 
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Method=Standard;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Name=General;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_ActionId=6f15ba6f-db17-4bc4-a2ac-5837bf90b298;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_ContentBits=1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 11b30138-f5e6-435e-e337-08da7534cbee
x-ms-traffictypediagnostic: DM8PR12MB5445:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 76QQfVZ0FyAMPHrpDI/8CIw26TwGMisODbbY/D3FM3XZ3PwWaNIeDuLVEjgQ6VRLwWXVgBTr0zmAFlwwO1XiqIqqFwrpFOHk0yAM5iFWpetmMbinS7+5ApT01RdmFOAHDqhv9prGbDkqGa+Z3hVXXdwKC3MpLHsk/uM66eDW3D+ievj/iL7WYFcyeTbAadcOzIQ9mmV8SOD/CLr8jFbBoheA2CXud/oOcLxxWcIse/6PO07w4o1fVnCzz+c2xBoX3GQ7733xW1xhPWe/3JlS9YUnuqVEfPmySjiExGiJEy/4sJUUNkOob2C7woNeWT/25sUsdYfpE0NtBnqVsukf2op/nU2WhIAHXANY2OaQHJYgmVcl8IonI2rop/3kIqb/SR1UWQB2Pet4Gm5uc0zpTPr3I/duBio5oT0XraawI8hJTlXMxj4et1iDiGQMfWQus2kaKORS0hqlee3gg45EWVFuWsnYf/lkdLatBW/OUlMBwO9iXlj15iNkUNfS0cFoqDc01fgt1/ROcFu26DdHJIc8nBc5qZsa5Io1PeGIdJQ+X2AKZBcAqJiJEZptJA5HMeLUWfv1fvgaGG3gb01pbH0Nx5ngrw7YntJMUy8BPDowg9KVrtcvDUGGoBoYLHlRe755ZMuR8UEj/30er8ZXl7OWwDh3+jniLJD09YupOTr00+ut47OgfBFu/AdLP7HQm8+I9s2o1d1IsPaePiaXa8HAZdz1E5N6i59/dmF1FdXHDeH4fAccaIdhbKecEdT3zaIAupQ5v1N/wxx0JGkPWaI0qYV7+8y1bgJV2ZD+uQ6uRHtXj+7JgZcHZ+ue4FbM
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB2619.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(39860400002)(136003)(346002)(366004)(376002)(396003)(71200400001)(5660300002)(86362001)(33656002)(316002)(66946007)(76116006)(4326008)(66476007)(8936002)(52536014)(8676002)(6636002)(54906003)(38070700005)(55016003)(110136005)(66446008)(26005)(64756008)(9686003)(53546011)(186003)(38100700002)(66556008)(122000001)(478600001)(83380400001)(6506007)(2906002)(41300700001)(7696005);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?J5+pBUyL5LH8l0L2kgm3qHGX9aSpNwzKuzR25TunuAPKWII6xzoLDS9l0GHt?=
 =?us-ascii?Q?gwwyxI0c8BmBDlpWFw9MrjbER0cdktFwaDPHFXB7tSuqPctj2TTmslXf9ze5?=
 =?us-ascii?Q?9nngdYumN6SdP+kt8IpP7RBGVR5Tr2tMb1YROWmZjtBncapS2eYj0VCPaFp/?=
 =?us-ascii?Q?8tz88Nscx96Hf9GeMWSQt7+NiWkEiBh/y0SRP4Sv4/8tc4La7y4iSMl9y0Qv?=
 =?us-ascii?Q?1+c4KH63Q6R1Vb/lJRC8tiaC8NbAoDqysbQF7Pajs76HI3V/hTDHrtqgRw/T?=
 =?us-ascii?Q?fCvvtu3h7GGT+/asseGfxoPkymltnnQhUkU9FpyliftesmH3vEf1Fv2ZkXjJ?=
 =?us-ascii?Q?I5TH9obOCywdtlGrrqNoebUADJzRk3Jg5/QTBtBeUy0jRjYhvYyHmDroUg1J?=
 =?us-ascii?Q?kqoFL70rE7eKJ++ldHgNp719cZhzBAJWsCgvZn0W00mUhq7Raljbnv2soNl9?=
 =?us-ascii?Q?5C2NiML5lIjVxv5eYI3SMQpnNYZGBvFFFhnyFQ/SQ5cQW5L6kqPQNUwmkjNb?=
 =?us-ascii?Q?LkPUwcs3t0UQXmt823MKJOit+maSXw2Rv/K2Xi8q+yjQcrrI1IOXeTFePVEr?=
 =?us-ascii?Q?3m1vmXrACImet6s1u51huD9Tkz6aZ2BJUQFJTHvsnCxB9ct/kkYLTaziQB2l?=
 =?us-ascii?Q?osHCH/r/AA5a/F0PbH5xzgXQi3stSKV52VQDz1OJF/TvYc19z3By+2tytNvO?=
 =?us-ascii?Q?jVSV6e77YEAmWfz39R/vJGWxzU2dbkMiZlijL39iFArvbCyeHiIbtHSZoQNi?=
 =?us-ascii?Q?gHbWCKaNLM2JRK8Brd1VyUuef49PvwLqG4x1MetYruje87q8VdffQ/iG3E7L?=
 =?us-ascii?Q?/Q/SuvKvKEDTa2XCsyjL+MXlfVGZX0EUMPGwTPlyPqnV2kW5Fpz0txj6qUYF?=
 =?us-ascii?Q?8AGtpwZDdL4O3OQiDtecv7bGX+VsU80+uufsYMb2qiT0IFQV+g7vSm0sgB4Q?=
 =?us-ascii?Q?AfzYdbAHOwjJM5LvruOUypHkSkZuYb9nfi2kq6iIp5BxMceimN806Kf6pMvt?=
 =?us-ascii?Q?eDCmrqC5SIhHI0yYakDkF/j6pb11gxvj3NkIAmNdYYCNaopbJ10UgUYgjyjx?=
 =?us-ascii?Q?k3b8IqEv644QA2LA0Kqo8L+MN16TkRjjj2gAnFXPyoaEiJMYjes0qGS0Og9v?=
 =?us-ascii?Q?p7rlmnOJ52y0xU7FEaZn8LVQ1T6+oAfLfpiW/ROC5aLK69f2RkE7FT4kaOIh?=
 =?us-ascii?Q?8JW1cpVvWlomWrzhoc5g4QRom/OzZQ+Q9bDrv8wu3aDmXTW9ziKlzJIHGPTT?=
 =?us-ascii?Q?FFaZ+QUF+K/s6fJCJnwuwvqVAheYAg25a3KWoz0aZICj78io64KVUSRcMj+W?=
 =?us-ascii?Q?VgtTF4K8iHac+3+NwVRPkjZr1plrtpKgko2OB5WROlaapCAq4AaLITd/a4gZ?=
 =?us-ascii?Q?5/kF1/iUiw7sGNuc04wFI5U+6tlg0qGk4u+egD/rtsGd1XxJ8+xlGYA+N1fm?=
 =?us-ascii?Q?mGZrsqWy3iCKFD0OfpTLnaidn7IMO0/ngDYEXPdC+K+erv0vdeZ+3ndZSPBO?=
 =?us-ascii?Q?cQJ8nOuOOmrqhoWNdgPKVIaw8t5cC2KL8re8CcRNpg3kocRtp1MQoDI4YFjL?=
 =?us-ascii?Q?hHVZvvWUekiJoWynaAU=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB2619.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 11b30138-f5e6-435e-e337-08da7534cbee
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Aug 2022 09:44:44.5901 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: db/R/GYKZSLOjduNSP0JdhBRKohqUtFczhmiLA2q/9r9olH4kWBcFp8mvQNRaGNA
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM8PR12MB5445
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
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

[AMD Official Use Only - General]

Thanks for the fixes! The series is reviewed-by: Evan Quan <evan.quan@amd.c=
om>

Evan
> -----Original Message-----
> From: Zhen Ni <nizhen@uniontech.com>
> Sent: Wednesday, August 3, 2022 5:20 PM
> To: airlied@linux.ie; daniel@ffwll.ch; Quan, Evan <Evan.Quan@amd.com>;
> Deucher, Alexander <Alexander.Deucher@amd.com>; Koenig, Christian
> <Christian.Koenig@amd.com>; Pan, Xinhui <Xinhui.Pan@amd.com>
> Cc: amd-gfx@lists.freedesktop.org; dri-devel@lists.freedesktop.org; linux=
-
> kernel@vger.kernel.org; Zhen Ni <nizhen@uniontech.com>
> Subject: [PATCH 2/2] drm/amd/pm: Fix a potential gpu_metrics_table
> memory leak
>=20
> Memory is allocated for gpu_metrics_table in
> smu_v13_0_5_init_smc_tables(), but not freed in
> smu_v13_0_5_fini_smc_tables(). This may cause memory leaks, fix it.
>=20
> Signed-off-by: Zhen Ni <nizhen@uniontech.com>
> ---
>  drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_5_ppt.c | 3 +++
>  1 file changed, 3 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_5_ppt.c
> b/drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_5_ppt.c
> index b81711c4ff33..267c9c43a010 100644
> --- a/drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_5_ppt.c
> +++ b/drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_5_ppt.c
> @@ -167,6 +167,9 @@ static int smu_v13_0_5_fini_smc_tables(struct
> smu_context *smu)
>  	kfree(smu_table->watermarks_table);
>  	smu_table->watermarks_table =3D NULL;
>=20
> +	kfree(smu_table->gpu_metrics_table);
> +	smu_table->gpu_metrics_table =3D NULL;
> +
>  	return 0;
>  }
>=20
> --
> 2.20.1
>=20
>=20
