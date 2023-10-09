Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CB9D87BD605
	for <lists+dri-devel@lfdr.de>; Mon,  9 Oct 2023 11:02:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E486310E23B;
	Mon,  9 Oct 2023 09:02:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on20601.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7eae::601])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4499210E236;
 Mon,  9 Oct 2023 09:02:02 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SoYtdqZNgNAUjcQeiAVLl3cNKF5C35kT44HJEzxYDsfhp17sWPgxZBWVQ6PgZOgmon/FC1153z/6W88zDB7n1FcXYMp4G1GZnOB3XxgOtTVFYhwCepirQc6OnY92wadBkvxiB5cdgaPNOn0GG+S1rPuhkyePR6mlWh9qfjOUJO+NbWQDdmzG01YHQCI2KkJ4BpoTowY+xEGxzGRu71sc6ro+tf0pMGRzJ5TLgabNtVEp2/2ro4Ea2JUxE6FHmL54zKm1DypI2CTKYUUaklUZFBJQ9bTq16+zgUKzt3FeoNE9OUh2XJemWfV3SD1E1wJFLgdMdEMlnpLgQmny8qynfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GNPDjFoS8tfCaoDZptJOWraFSs599DRskDojcFGvNFc=;
 b=Nre2b2Z/eCubUNKiygiMAEafM13XKgA2ms80Z4fLZwCqcUu8jXb0+KZVGEO6dOdMllyHwnmAj6SI6Grln0TCX1zF9wDJnLykauXdA9iUWcl+tAybXU6hUcN78bM7nvw4invOROhh7tA3LUtOBjIPa7h4xAiw3MmQiFwncIJcL4IEyqUEU85xJI84wtUInIr3+tu0j1quuZZvb73MzLt/0t1/hR+FHhNKbNmgE/8V8WVXiINgiaJo8YvWmEvjKDNaosIqHoNlFRREHLYqky/AIxRordP6TGoEZE5xZ1vmMcsk7ar9Do+QYllxK9n9BB3eMcqtP9GD4FBMEon63rehPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GNPDjFoS8tfCaoDZptJOWraFSs599DRskDojcFGvNFc=;
 b=aT68swQHhmxqOX0qkGeFW7+vHgaDzskDuj4hZPYAQqGJTqfcmp2NQq4jaFRhEX+Cq5DTosZUKiEvMZ7vI23BQ8oZVZz8o/wYTU15bZ9hKc1hbXHr3a6XrEbIkQ6pY2E4HN2YLzDt3O929oyTol3wyNwGATustwThO2QxSNVgoJo=
Received: from MW4PR12MB5667.namprd12.prod.outlook.com (2603:10b6:303:18a::10)
 by SJ2PR12MB7963.namprd12.prod.outlook.com (2603:10b6:a03:4c1::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.38; Mon, 9 Oct
 2023 09:01:59 +0000
Received: from MW4PR12MB5667.namprd12.prod.outlook.com
 ([fe80::c65c:9847:210d:2f2d]) by MW4PR12MB5667.namprd12.prod.outlook.com
 ([fe80::c65c:9847:210d:2f2d%6]) with mapi id 15.20.6838.033; Mon, 9 Oct 2023
 09:01:59 +0000
From: "Sharma, Shashank" <Shashank.Sharma@amd.com>
To: Icenowy Zheng <uwu@icenowy.me>, "Deucher, Alexander"
 <Alexander.Deucher@amd.com>, "Koenig, Christian" <Christian.Koenig@amd.com>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>, David Airlie <airlied@gmail.com>, Daniel
 Vetter <daniel@ffwll.ch>, "Yadav, Arvind" <Arvind.Yadav@amd.com>
Subject: RE: [PATCH] drm/amdgpu: fix SI failure due to doorbells allocation
Thread-Topic: [PATCH] drm/amdgpu: fix SI failure due to doorbells allocation
Thread-Index: AQHZ+bNEZINILWR0QkekftsQ4JLIPbBBKfzw
Date: Mon, 9 Oct 2023 09:01:59 +0000
Message-ID: <MW4PR12MB5667743E5B759FFE85F204ACF2CEA@MW4PR12MB5667.namprd12.prod.outlook.com>
References: <20231008064649.3184677-1-uwu@icenowy.me>
In-Reply-To: <20231008064649.3184677-1-uwu@icenowy.me>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_ActionId=248a72f2-3d7b-40fa-9a49-39a7179bc852;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_ContentBits=0;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Enabled=true;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Method=Standard;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Name=General;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_SetDate=2023-10-09T08:57:55Z;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MW4PR12MB5667:EE_|SJ2PR12MB7963:EE_
x-ms-office365-filtering-correlation-id: 07a7c4de-c819-4b92-2542-08dbc8a66558
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 8mihW8E/TiiQjbV8/whMvQQiel/w5w6wjCpCMEVAi1hT/ViYuyOGivyBCXNC4YvZLrrEZolz31BM3I9tDW2DFoTV2uIZ734fGuWm00oWjL0taLwoxjxP2VWrxlIdLQ5f1+/Ndz4ENYknFRoGuZ0wDOnwj/yav0iBgJufSG20/8LojeSgxma23aukKJUAbr+AVyov+vx5kU9AauPobe3PINnQD2rbv7D1hbqw6ghHFmkmo101dgNOQ6VUog6Wvu3L4VPHStqjb2wMMLR7w/L25N5054dHpNhS16aW/1DX3MbLMitbSN0PiWhjhyQp6w+yIsA8vSZa0FFIFKqjoHrsPqRkBBn4FyakGzI8VaDd0OKcH+vMBr3zCxNcp+UlNVG5mlEQrsx2gFzaulTGy65k9ZYXgX7LPjIWHCo2i22o3qfgKwsj8d9Ti0SP7I74ZCRSIEdSZbwJ/5MXKAnhTMPzQGGR7ILbTr6fuz9wjqdQZgjZiHBca40+Q+lFk6wTEBLmM6Cq8Xi62czkwhf5pgOVY5r9SuRcA1jFErlPrfh1iSDaTfYOhVyON7uNI8G2gPH7bO4C4drr+MHLOdMjzXunGBBskR5W7jPyCNfEAf6+w/ldG8cwTvyGv4K7wUSjKxiDUa4Mz6N3MzQkjV2HXxihTA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR12MB5667.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(366004)(39860400002)(136003)(376002)(346002)(230922051799003)(186009)(1800799009)(64100799003)(451199024)(921005)(38070700005)(38100700002)(122000001)(86362001)(33656002)(52536014)(53546011)(55016003)(9686003)(71200400001)(7696005)(41300700001)(8936002)(5660300002)(2906002)(4326008)(478600001)(8676002)(83380400001)(6506007)(316002)(66446008)(6636002)(66556008)(64756008)(66946007)(110136005)(76116006)(66476007)(54906003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?Hzs/gtoe87IUdaaNYuWpLjdGuAgH2a2FVgQhIJ3l+Wxjw3Zq8X4xJd9NMetv?=
 =?us-ascii?Q?3MCwKyfmtaf4m0czyQ8RSV1ZhsMZWTSG7OJI2Bsb9QwEkL5/d8vpP+pDkXCP?=
 =?us-ascii?Q?Cep3iBGLuAlM8/NX90JPmfezF0pVNjp5GNJErTskYFkOTfeqt83cJDQlH4H3?=
 =?us-ascii?Q?OoM+czPN8ZdDh05OEnGBmhJ4xY7dq1iI9TZDXrUa5fXoV7hsjrQ7r382R+jH?=
 =?us-ascii?Q?67z9cQntcKGZLE9XIi/LrwD0+szfCQMYpAwbqjFRP4Ajt2gttzo5Yn0pDiFL?=
 =?us-ascii?Q?gs8SJhkdctipf+tVsrlRpJ9bGbeflOPqTCVH9CT1jvMRhi/lKR37MwTuyug7?=
 =?us-ascii?Q?kn62j4gdICuq3TftQ7jhPfSs5YDFe7mwn+qWo7d0zuI+rySCqGo2NOAJswPS?=
 =?us-ascii?Q?AdvDFu+ls+zBjuwMdn1UZmG/rBZEKJ59a9rLW8jTfny9eSc5nZQNS5xPZxBv?=
 =?us-ascii?Q?rAlP1LGKm++KeBPQVXMthyEWLkz8FF9Xko7tUSeRAXv5qmqNS4psHnSsQBFC?=
 =?us-ascii?Q?Jqx1N0x7ke+CtNXigagecT4884e2JLZvHOT1iwi7JoXbsvKum+eEBOcPI9L0?=
 =?us-ascii?Q?rYHdAKxVCkwnFmLDiZdX8vsf+25egBgvZDg7VVadqXIjSYEORshG14w6RlG4?=
 =?us-ascii?Q?ywSWs7+boI89DvRJ0rUu2cKdGOjHT2DciPeJPTwQ51ZvIaD626Pw5H/4FOqG?=
 =?us-ascii?Q?6GpsJwZev2zHCvVeZYown25+dp1Ki80BsjHqKeZIbu7ldqLAhUVbEvYlbiEQ?=
 =?us-ascii?Q?ANjLeXD5JCKilzItYHED5y5Kv4RxCygKzH1W4c89w1T+8aeW/p0xX5ln1TuR?=
 =?us-ascii?Q?/ZE+vrtzKWrEsDsd0xmrg4d+Vo/OS+bbtFfiuLgYHVWFi3ygPOoBTpXwEydV?=
 =?us-ascii?Q?WwIgHLwwnKeTI5BnCtclgZN+lyUBlOOJIx/jhQBsxaG5WBHbUZ/v/TD0mZbX?=
 =?us-ascii?Q?Uvoy/UuM3OpXztGHombM1Nbu5IahP2/hCw95Q2Tz/9N2+X3EdCErab2WOjWe?=
 =?us-ascii?Q?oJtKYP7rc4ki1qG/eh9EfoYxou/bdNKf9jzWIyTrzlE0Vsb8OI4XhryPBlMv?=
 =?us-ascii?Q?loFse1SfP5upM3exy22DWLgCThfqHn+M65Y6s24W1M/c8ZS0UMMnLxReGs1t?=
 =?us-ascii?Q?JUJw43IvdK4rAoBNcfcNpr2DCYZr8C676s91BMoafYhVRN+5YqXUWGg3JpUC?=
 =?us-ascii?Q?4/Gn6u603srklZWB1BsP4z4bt66Eyf5yMbP/eXK3SOBxcOESUxvgQMFxg2Nx?=
 =?us-ascii?Q?fMlx4q7rkjmtpNlJ1Fc7vtmtVsBp5gUx5RxZjJS8ucSAbGncctUm+yiN1MJ+?=
 =?us-ascii?Q?yyNN5MTw8VyThCF9jJh0Dd5S7csWyezp1u2gY72k9SJHSqR4F0y84wCG8u26?=
 =?us-ascii?Q?Z8oeuWATlGxOaqxlmvNqhfwiq6JpBNSzMpo6Jv8/h0MkBpU3zeQ04FB3Hl1e?=
 =?us-ascii?Q?bxKcGbgmsNm/PFqM59jxIbQz/dofltCvZf8LKiCSM4nVfXtJ1rhF7YlvfT/A?=
 =?us-ascii?Q?Fm6ADbNPbUs7QhtSpz/C2zXmumxJQcNpssMp3CYkVnrjeV0TyDxIFKb1Zg?=
 =?us-ascii?Q?=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW4PR12MB5667.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 07a7c4de-c819-4b92-2542-08dbc8a66558
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Oct 2023 09:01:59.3344 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: bB4hCw/FiPzjmCy1qCXHJ+4DfMKMw7kzCuCcma59AaFOSFctveQOhB1hYAeDoWCwNM8iqqWmIVxA5+q0d/OHHA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB7963
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

Reviewed-by: Shashank Sharma <shashank.sharma@amd.com>

Regards
Shashank
-----Original Message-----
From: Icenowy Zheng <uwu@icenowy.me>
Sent: Sunday, October 8, 2023 8:47 AM
To: Deucher, Alexander <Alexander.Deucher@amd.com>; Koenig, Christian <Chri=
stian.Koenig@amd.com>; Pan, Xinhui <Xinhui.Pan@amd.com>; David Airlie <airl=
ied@gmail.com>; Daniel Vetter <daniel@ffwll.ch>; Sharma, Shashank <Shashank=
.Sharma@amd.com>; Yadav, Arvind <Arvind.Yadav@amd.com>
Cc: amd-gfx@lists.freedesktop.org; dri-devel@lists.freedesktop.org; linux-k=
ernel@vger.kernel.org; Icenowy Zheng <uwu@icenowy.me>
Subject: [PATCH] drm/amdgpu: fix SI failure due to doorbells allocation

SI hardware does not have doorbells at all, however currently the code will=
 try to do the allocation and thus fail, makes SI AMDGPU not usable.

Fix this failure by skipping doorbells allocation when doorbells count is z=
ero.

Fixes: 54c30d2a8def ("drm/amdgpu: create kernel doorbell pages")
Signed-off-by: Icenowy Zheng <uwu@icenowy.me>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_doorbell_mgr.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_doorbell_mgr.c b/drivers/gpu=
/drm/amd/amdgpu/amdgpu_doorbell_mgr.c
index d0249ada91d30..599aece42017a 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_doorbell_mgr.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_doorbell_mgr.c
@@ -142,6 +142,10 @@ int amdgpu_doorbell_create_kernel_doorbells(struct amd=
gpu_device *adev)
        int r;
        int size;

+       /* SI HW does not have doorbells, skip allocation */
+       if (adev->doorbell.num_kernel_doorbells =3D=3D 0)
+               return 0;
+
        /* Reserve first num_kernel_doorbells (page-aligned) for kernel ops=
 */
        size =3D ALIGN(adev->doorbell.num_kernel_doorbells * sizeof(u32), P=
AGE_SIZE);

--
2.39.1

