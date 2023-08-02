Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 16DA276C181
	for <lists+dri-devel@lfdr.de>; Wed,  2 Aug 2023 02:31:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 01E5210E04E;
	Wed,  2 Aug 2023 00:31:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2071.outbound.protection.outlook.com [40.107.223.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF7B810E04A;
 Wed,  2 Aug 2023 00:31:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Sf4QEQfGNotNW2xX/jXjBb3RenH+GVvnEv15A7rqJnEn+pYARKopffm4LAIZqbokIV+ck6wr50F2baXqGAbQsKxCLn+06vzvWNZEXpA3k04qMIgYaZZgw+LmFPwhP2CCdlk5/FEYqn4Gmp2lRp7tbaVn7yodwapEYU6YC705dACffY5GFifWd4Bv+eVz0Tq4NKwhvIBXLNVpjUz7HOX1M9iFsWpDo8lJ2U/QelVDAqdnRgqpfXiCy90P3NlKN8CXsKo5NqkiDl8K8mMvVgXi2BXwi1w8UdD/GqqMK6ALZQrlba7ce9zSh0UIyK3r7V3hnYXey6YZjCJTJH696ZKKEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lCJCD42XY//MoxratFfyeInZA9nXMS8JHiKbFVoOXgc=;
 b=YF5oLFA0p5XyjYVc9j8sJIa+oh0kneZi2M4Fms8Did+q+n5cZQ32OyEDj8eYaeccM8bME9hdGpRE8v43itNrPNmuD5mpd9NmULgGhsEdwSyemJqR+cB8bcC/F3tFNgDzNOxXx2xz2qAQIiUX7WszI00NOZsVdyXGq9qyVBXG3Y1BQvKTo19ZjipURZ8cqk9ijY7/a9hcDniL/MOYoQ5AlVD1vKmbRb9CnHtEecNZFg9SBbHN7jjN9P1qOPvWoyYw+T27H+1+J8sHdpCI7C6lj/ouWZ2trhVRq2dw4nybKVh0vyW5PLj4p2kgyKIEOUsf8PTsY3D0/C9YcOrOKNqRow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lCJCD42XY//MoxratFfyeInZA9nXMS8JHiKbFVoOXgc=;
 b=qYqo6WtlAX+DX5KheBEPYlJlenysWQGL8xmnzQ5tlerIFvsbRek9cRAE/sP0lycCBXJDkuSV/FJeB+KIDNjtH1LKQsR8Jb/C1c1PBcaZt75TdqaSVG+g0E0KKM9Ag/FMG3nkPDPYMzRcBuJYJze/h3KI2/NzGiOwzr4Dn+xcKls=
Received: from DM6PR12MB2619.namprd12.prod.outlook.com (2603:10b6:5:45::18) by
 PH7PR12MB5877.namprd12.prod.outlook.com (2603:10b6:510:1d5::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.45; Wed, 2 Aug
 2023 00:31:37 +0000
Received: from DM6PR12MB2619.namprd12.prod.outlook.com
 ([fe80::ed2a:4807:1825:170f]) by DM6PR12MB2619.namprd12.prod.outlook.com
 ([fe80::ed2a:4807:1825:170f%5]) with mapi id 15.20.6631.043; Wed, 2 Aug 2023
 00:31:37 +0000
From: "Quan, Evan" <Evan.Quan@amd.com>
To: Ruan Jinjie <ruanjinjie@huawei.com>, "Deucher, Alexander"
 <Alexander.Deucher@amd.com>, "Koenig, Christian" <Christian.Koenig@amd.com>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>, "airlied@gmail.com" <airlied@gmail.com>,
 "daniel@ffwll.ch" <daniel@ffwll.ch>, "mripard@kernel.org"
 <mripard@kernel.org>, "tzimmermann@suse.de" <tzimmermann@suse.de>,
 "drv@mailo.com" <drv@mailo.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>
Subject: RE: [PATCH -next] drm/amd/pm: Remove many unnecessary NULL values
Thread-Topic: [PATCH -next] drm/amd/pm: Remove many unnecessary NULL values
Thread-Index: AQHZxHeDyoFCWe60Lk2ObfpNGTCqZq/WKGRg
Date: Wed, 2 Aug 2023 00:31:37 +0000
Message-ID: <DM6PR12MB2619C970B1B70B20AD16EFDDE40BA@DM6PR12MB2619.namprd12.prod.outlook.com>
References: <20230801125514.378451-1-ruanjinjie@huawei.com>
In-Reply-To: <20230801125514.378451-1-ruanjinjie@huawei.com>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_ActionId=6dc09761-3bb8-4c32-ba0d-2bdedacee958;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_ContentBits=0;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Enabled=true;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Method=Standard;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Name=General;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_SetDate=2023-08-02T00:31:22Z;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM6PR12MB2619:EE_|PH7PR12MB5877:EE_
x-ms-office365-filtering-correlation-id: e68b8b40-e8ce-41a1-6156-08db92efd523
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Gr6LOiOig+/NfHyeHdqM0uJ6pGzozdy6wjeBsXQfgCx6thUlndNnQnW1v592PYNWzW8lp1lLVZAUaC/cXg4/of+URnLYTZVAEBsdXJbH9FOz3JR8E3Xa9ZW8MFZ6cVTApwpI8Qe124CCTQoIxkZGEkzQlXjnfER2y5JSevV0aKeQ4xxAKEDkNvgq5ETN1kJuwwYqR6udn8YR6FR859GohN4iP3b+4YMK96K/qpR6idxtr/VdJwvQQMnUwfbff5kKWSbjQdShWBiDYw2D0095H+N0b6SPSv8pLuodhbaf0bAZUZoCrfTEgjx1sIGWKjkFBv+0llUxrrjcaeRUmuhGGwDgFCwIQLf1Fr2f1JibU5SKMWRKWWAgvOiBoB+gMeD17jeMUauS2ugSlPj0z0N8Af0+RmHLRYMa/p5fPqYd6/WBq7wh8OQL0xKT3VSLFKO7lhT8EP+csN+nPk1gMVgVHKGvXLVqSs5/rllJZyW7QGDgZBQ/Vdk8cf00VG8d4EQPscYNuQeQNGnVzOPZlZV7bFNFtSgle+O/Mr0KoTmI9izVpRzlqvE+ft3Eht4AQ0w5WEz0pRQa+kHmaopAxs3zu8RSwL/HzQAZbCXTDyhoJp1kzCi07QWryYp3kXz8WhoABs5TY4Fzxx52bxNavtT3BA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB2619.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(366004)(39860400002)(376002)(346002)(396003)(136003)(451199021)(55016003)(186003)(9686003)(316002)(86362001)(478600001)(122000001)(110136005)(38100700002)(921005)(76116006)(71200400001)(66946007)(66556008)(66476007)(66446008)(33656002)(64756008)(7696005)(53546011)(6506007)(41300700001)(26005)(52536014)(8676002)(5660300002)(8936002)(2906002)(38070700005)(83380400001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?ZSS4INN4rg4N6UvO10+JQPkhnEy+yEYKEAIlz4HV3QkY8CwmYL27zaL2cqZs?=
 =?us-ascii?Q?A2lkjprWr4OWQ7yzLH/n3IA1KoeNwiF7O0IuWXiwohiVz4UeoBNj+aOEjWrb?=
 =?us-ascii?Q?+MQFvDDWHV5gjhPL0PLu74jnzuZ5LJOoo+odUY0IKJ+7nbXWHIF4DOG+wjvl?=
 =?us-ascii?Q?o1I7UMUXhH+PFJzJzC/Scky92jWMOSV9P9TBktAZr41y6XCPqfH3g7y5feyJ?=
 =?us-ascii?Q?bnjz/GzsKbGtvJ0mu6jMD1mLdbB09majUwW6czT9wd2z5UhgTancxdWwApSS?=
 =?us-ascii?Q?7KriuCO04XfD5m7A05eQ9kaUJBQ8GOIBJ13hS6p+v1tFiPxW30BYyL4Ju1oo?=
 =?us-ascii?Q?EZRWyvy/sKCBfJihnEN1kdlWlKK8YnooBQGqNKdlyLRt7TTOlRNC0MNMQh5H?=
 =?us-ascii?Q?kIRxyQuFioZqHkABOxztY+0eBB+m6iRn6RNcwi0nbMdW6JZoBn/1uQYHd9LD?=
 =?us-ascii?Q?ZaD3KOq30BbuPEWXucpk2kWwTT0mqBpewekRQPdKdlJK29kgT/taKWrxZ5+L?=
 =?us-ascii?Q?UJSydke4Moy6lF6P5XyikffxAFNaKkp7WqTRT5LvIVqNlDcebkwgVTcVPRJ1?=
 =?us-ascii?Q?focwJkdOfS09vYCfLuhHk0mrU5tWJSTtPy4CqbN1EX0+lUqiPeIdzRmlQ4UN?=
 =?us-ascii?Q?95otU/h4gYlvxE5g4m96+w9+8aFE/jVvwpT2iotfAjyP6LxxyjPXJnFAMTsU?=
 =?us-ascii?Q?n+l6NM9nHE+fOQE2ULb3FqQqUHDejzSZ6o8RiUic+ZLSryEOnvJeHljp96Yz?=
 =?us-ascii?Q?BjWV1wjyxo0281hJMUdfhm/zXqmHQYBu/BvwV78RbRAfEWtxnGWVybyG5/qc?=
 =?us-ascii?Q?tACevBYgLgMYu9vFW6FdoYIc13Frx9JHVnsKjUILDRfVEblp71B48Cl5MGyF?=
 =?us-ascii?Q?6htrbBC/Qea+yJ8c+t5xTp98ea6U6Z1cQeN94CMQ+Awe+q43OpBXndiao/oL?=
 =?us-ascii?Q?bqAzOxHq7wHYhHuUAl6K6DzZV98Rm0DYUK+qNUhdVGJ06WSTGxOotnZfXKnQ?=
 =?us-ascii?Q?2NHC8eEnKNT848Ljyf6kb4lJe4CFfj+MH51BRU0zjf1aqvLIEx2m+Xu6z5MT?=
 =?us-ascii?Q?ZnGfC4uHEUWeQPOzqg/2oauUuQiX4djIiqTEK0Q72h0DFtv8+frEVaIzqkQG?=
 =?us-ascii?Q?hwqEYpZeeNnvkdbhx9Hpk5prCduvQU1ls5vWLXdlWgAxSGoyQ2aLR6sypgGj?=
 =?us-ascii?Q?w/rhbG1iwe253PUrt+ONcfp6/XjtMOZD48rMbJmp9CF+QjqnZImwM8KwzrKo?=
 =?us-ascii?Q?F3rYwX7ATZLrGpk0pI1gOh8XaUR+ZgD4xh+jnJoczEVFC57LFb++cg5RlGcX?=
 =?us-ascii?Q?gJMy00DaDHY44aiFgQ0yVe3lHN0GCeCxwKJC0BSXVmTeGvK0xN9TUxyQiAvQ?=
 =?us-ascii?Q?n6ffwXBp2h2M58uZa3m35+ziIQaUr+Mx+dRBPz6WzqLlMDvJBrQ9icvV8aQF?=
 =?us-ascii?Q?Pq4Tv+NpPQurBVBlwOW3OMbMoLdjkYYb8dfRbVTZySYeEV0Cx1RXkbLr146W?=
 =?us-ascii?Q?4ihh+Oeb4RldSD6Fp9Ne1MmD5I1LRXZe8yZBdLd3n3UVoYq5ukTw4cc4jrdr?=
 =?us-ascii?Q?Km6edWWMXUGm9Qud4Yk=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB2619.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e68b8b40-e8ce-41a1-6156-08db92efd523
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Aug 2023 00:31:37.3402 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: rOQzmQ7LCW6LDWox1eoBfmkbo4A23z1sPOazWS+ELwdSzBULRJzEO2QxFcd6sabm
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5877
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

[AMD Official Use Only - General]

Reviewed-by: Evan Quan <evan.quan@amd.com>

> -----Original Message-----
> From: Ruan Jinjie <ruanjinjie@huawei.com>
> Sent: Tuesday, August 1, 2023 8:55 PM
> To: Quan, Evan <Evan.Quan@amd.com>; Deucher, Alexander
> <Alexander.Deucher@amd.com>; Koenig, Christian
> <Christian.Koenig@amd.com>; Pan, Xinhui <Xinhui.Pan@amd.com>;
> airlied@gmail.com; daniel@ffwll.ch; mripard@kernel.org;
> tzimmermann@suse.de; drv@mailo.com; amd-gfx@lists.freedesktop.org; dri-
> devel@lists.freedesktop.org
> Cc: ruanjinjie@huawei.com
> Subject: [PATCH -next] drm/amd/pm: Remove many unnecessary NULL values
>
> Ther are many pointers assigned first, which need not to be initialized, =
so
> remove the NULL assignment.
>
> Signed-off-by: Ruan Jinjie <ruanjinjie@huawei.com>
> ---
>  drivers/gpu/drm/amd/pm/powerplay/hwmgr/processpptables.c | 2 +-
>  drivers/gpu/drm/amd/pm/powerplay/smumgr/ci_smumgr.c      | 2 +-
>  drivers/gpu/drm/amd/pm/powerplay/smumgr/fiji_smumgr.c    | 2 +-
>  drivers/gpu/drm/amd/pm/powerplay/smumgr/iceland_smumgr.c | 2 +-
>  drivers/gpu/drm/amd/pm/powerplay/smumgr/tonga_smumgr.c   | 2 +-
>  5 files changed, 5 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/pm/powerplay/hwmgr/processpptables.c
> b/drivers/gpu/drm/amd/pm/powerplay/hwmgr/processpptables.c
> index 182118e3fd5f..5794b64507bf 100644
> --- a/drivers/gpu/drm/amd/pm/powerplay/hwmgr/processpptables.c
> +++ b/drivers/gpu/drm/amd/pm/powerplay/hwmgr/processpptables.c
> @@ -1237,7 +1237,7 @@ static int get_vce_clock_voltage_limit_table(struct
> pp_hwmgr *hwmgr,
>               const VCEClockInfoArray    *array)
>  {
>       unsigned long i;
> -     struct phm_vce_clock_voltage_dependency_table *vce_table =3D NULL;
> +     struct phm_vce_clock_voltage_dependency_table *vce_table;
>
>       vce_table =3D kzalloc(struct_size(vce_table, entries, table->numEnt=
ries),
>                           GFP_KERNEL);
> diff --git a/drivers/gpu/drm/amd/pm/powerplay/smumgr/ci_smumgr.c
> b/drivers/gpu/drm/amd/pm/powerplay/smumgr/ci_smumgr.c
> index 4bc8db1be738..9e4228232f02 100644
> --- a/drivers/gpu/drm/amd/pm/powerplay/smumgr/ci_smumgr.c
> +++ b/drivers/gpu/drm/amd/pm/powerplay/smumgr/ci_smumgr.c
> @@ -2732,7 +2732,7 @@ static bool ci_is_dpm_running(struct pp_hwmgr
> *hwmgr)
>
>  static int ci_smu_init(struct pp_hwmgr *hwmgr)
>  {
> -     struct ci_smumgr *ci_priv =3D NULL;
> +     struct ci_smumgr *ci_priv;
>
>       ci_priv =3D kzalloc(sizeof(struct ci_smumgr), GFP_KERNEL);
>
> diff --git a/drivers/gpu/drm/amd/pm/powerplay/smumgr/fiji_smumgr.c
> b/drivers/gpu/drm/amd/pm/powerplay/smumgr/fiji_smumgr.c
> index 02c094a06605..5e43ad2b2956 100644
> --- a/drivers/gpu/drm/amd/pm/powerplay/smumgr/fiji_smumgr.c
> +++ b/drivers/gpu/drm/amd/pm/powerplay/smumgr/fiji_smumgr.c
> @@ -332,7 +332,7 @@ static bool fiji_is_hw_avfs_present(struct pp_hwmgr
> *hwmgr)
>
>  static int fiji_smu_init(struct pp_hwmgr *hwmgr)
>  {
> -     struct fiji_smumgr *fiji_priv =3D NULL;
> +     struct fiji_smumgr *fiji_priv;
>
>       fiji_priv =3D kzalloc(sizeof(struct fiji_smumgr), GFP_KERNEL);
>
> diff --git a/drivers/gpu/drm/amd/pm/powerplay/smumgr/iceland_smumgr.c
> b/drivers/gpu/drm/amd/pm/powerplay/smumgr/iceland_smumgr.c
> index 060fc140c574..97d9802fe673 100644
> --- a/drivers/gpu/drm/amd/pm/powerplay/smumgr/iceland_smumgr.c
> +++ b/drivers/gpu/drm/amd/pm/powerplay/smumgr/iceland_smumgr.c
> @@ -259,7 +259,7 @@ static int iceland_start_smu(struct pp_hwmgr
> *hwmgr)
>
>  static int iceland_smu_init(struct pp_hwmgr *hwmgr)
>  {
> -     struct iceland_smumgr *iceland_priv =3D NULL;
> +     struct iceland_smumgr *iceland_priv;
>
>       iceland_priv =3D kzalloc(sizeof(struct iceland_smumgr), GFP_KERNEL)=
;
>
> diff --git a/drivers/gpu/drm/amd/pm/powerplay/smumgr/tonga_smumgr.c
> b/drivers/gpu/drm/amd/pm/powerplay/smumgr/tonga_smumgr.c
> index acbe41174d7e..6fe6e6abb5d8 100644
> --- a/drivers/gpu/drm/amd/pm/powerplay/smumgr/tonga_smumgr.c
> +++ b/drivers/gpu/drm/amd/pm/powerplay/smumgr/tonga_smumgr.c
> @@ -226,7 +226,7 @@ static int tonga_start_smu(struct pp_hwmgr
> *hwmgr)
>
>  static int tonga_smu_init(struct pp_hwmgr *hwmgr)
>  {
> -     struct tonga_smumgr *tonga_priv =3D NULL;
> +     struct tonga_smumgr *tonga_priv;
>
>       tonga_priv =3D kzalloc(sizeof(struct tonga_smumgr), GFP_KERNEL);
>       if (tonga_priv =3D=3D NULL)
> --
> 2.34.1

