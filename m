Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EEEB84F6BB
	for <lists+dri-devel@lfdr.de>; Fri,  9 Feb 2024 15:12:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF42210E9D6;
	Fri,  9 Feb 2024 14:12:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="RyrYQst1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2068.outbound.protection.outlook.com [40.107.223.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BAE3B10E9D6;
 Fri,  9 Feb 2024 14:12:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fKPXJXWUGqxP2Q2bff6YY/HZg32estDzFOraWIm+PQoqcFyKQYayvbONkOSPgLpXXR9/gmA3Vas17Vxxqd3bbbIIhxoDfcE+ROE/Z2uIYyLKE9pBKYrWEktt1ckPa5/OKI9TsS2K5v/AS43UgeHudQDMON4njQd+EsasVQXB+Al+7LsfxsT5KpZnTFYNNgNuR220Odktya9AQWSQRfTxt7cluI19jWzGLeWaGtxf5xTC5TgPR7EouPwtzqwssNs22TV77pWYJtUGEU9d8k2drxjyfGirMWtUvmOlcMRF61C9+Rlnn3RAKCZEwUaDdeMaZyXfGrj9tkC2uFPkf0QtTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XaJ9/U8aW7BWmhldEGiZ3ytTPhJ1ifZ32C6r0jz7nSU=;
 b=L3YAjz22N2vX+9bocOGcC/yWADG/IHckqqLQ5SVzRJDsnKODXGYYFKmXSFeuvnS73D3vEDUeCMU8PzdkKB9UNeggTT3FmmPqNXG7Sa5x2oiieuVMsN2meq99wHw/uQfgxOFtrN4rC2j5Vg7vFIgdAs2nNdHzHo+Qp03rCtaAkZrPBwKqCnAki7bTXRsck0SfgZlOt6PaF+tVInFx/7pkYSEgw7wEaXiRmRQ4QZ/H+mdWlmuIzdYBq0au8HZ/tLd44cajx3Ry/MIOVEGulNxJp1r2QDUX2KljmhvFSF2OScXaO2JSaZ6196teglEejSsfJMbwMPI0sJdAcEjqDSn++w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XaJ9/U8aW7BWmhldEGiZ3ytTPhJ1ifZ32C6r0jz7nSU=;
 b=RyrYQst1JtUSp81vwsRkE7KESRCgmvWulgBLlhHoDWXoF//wAJdWXIdSzLl+KwnKq+oRGeyXhKuPqKcLR5jRLkSM1bVIiAK0HDKJhXPC+ucyaMQ9zg8mh802tzzmJDQv2fPsNOZ0nYX+rlvz+IqUTPKFhdGiJPUBjO7CnAMqeP4=
Received: from DM6PR12MB4545.namprd12.prod.outlook.com (2603:10b6:5:2a3::15)
 by MW3PR12MB4428.namprd12.prod.outlook.com (2603:10b6:303:57::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.14; Fri, 9 Feb
 2024 14:12:15 +0000
Received: from DM6PR12MB4545.namprd12.prod.outlook.com
 ([fe80::52a5:5005:2cf6:b97f]) by DM6PR12MB4545.namprd12.prod.outlook.com
 ([fe80::52a5:5005:2cf6:b97f%5]) with mapi id 15.20.7292.010; Fri, 9 Feb 2024
 14:12:15 +0000
From: "Koo, Anthony" <Anthony.Koo@amd.com>
To: Dan Carpenter <dan.carpenter@linaro.org>, "SHANMUGAM, SRINIVASAN"
 <SRINIVASAN.SHANMUGAM@amd.com>
CC: "Wentland, Harry" <Harry.Wentland@amd.com>, "Li, Sun peng (Leo)"
 <Sunpeng.Li@amd.com>, "Siqueira, Rodrigo" <Rodrigo.Siqueira@amd.com>,
 "Deucher, Alexander" <Alexander.Deucher@amd.com>, "Koenig, Christian"
 <Christian.Koenig@amd.com>, "Pan, Xinhui" <Xinhui.Pan@amd.com>, David Airlie
 <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, "Kazlauskas, Nicholas"
 <Nicholas.Kazlauskas@amd.com>, "Pavic, Josip" <Josip.Pavic@amd.com>, "Huang,
 Leon" <Leon.Huang1@amd.com>, "Adhuri, Mounika" <Mounika.Adhuri@amd.com>,
 "Huang, Lewis" <Lewis.Huang@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "kernel-janitors@vger.kernel.org"
 <kernel-janitors@vger.kernel.org>
Subject: RE: [PATCH] drm/amd/display: Fix && vs || typos
Thread-Topic: [PATCH] drm/amd/display: Fix && vs || typos
Thread-Index: AQHaW1hJ7IhOQLhJY0uycbxy1/gQ5LECDHgw
Date: Fri, 9 Feb 2024 14:12:15 +0000
Message-ID: <DM6PR12MB4545EFF1E303FE549FFF06DAF34B2@DM6PR12MB4545.namprd12.prod.outlook.com>
References: <7482be2a-aca1-41dd-bb6e-d547571b9507@moroto.mountain>
In-Reply-To: <7482be2a-aca1-41dd-bb6e-d547571b9507@moroto.mountain>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_ActionId=dd976861-e9b1-4fd0-bee5-cdb124f30a44;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_ContentBits=0;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Enabled=true;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Method=Standard;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Name=General;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_SetDate=2024-02-09T14:09:22Z;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM6PR12MB4545:EE_|MW3PR12MB4428:EE_
x-ms-office365-filtering-correlation-id: b74bc418-f61f-42eb-8df4-08dc29791e60
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: iVWCE8j+BFRfQ+rvfNxna344X+WDwxgFKA7O0JDV3cPe4E8twcpqSh4cMfggaaR8PbSD1HXMgsAUZN0MDhXfAsabl+yAMt4dpwuQCChkz0YyHgso/gPo3zZSe6INYhvuH0AjQXRyShqElW2ykTazLgR9YX7fAyD6X/ZXXGZGpAWfQva/6Bo1Vv7IO/E3vQVXxu0csezCuPx7q6QmpZBJ2/Y3DkRU3XxFwf+3wEjq89LrZma6HFYbi5whNgXgbDwd+Buk9YIwR4worQ52/pyYH+FK/iROmlmUNLLrewLvr9E//mA4l/kor44/loDhWyr0aAnItVTs9WYik5W2bH0Op5IiVoXVpqw5i6E/6F8ZzLRurc7AiYvhC0InnRnjWiqtsaz8GWax3DSSLIVACKraHpgOcNQ0IwCMm+HgpdRuiZ2B2CoZmYa04RWAoIZMdBNdzfSNAYx6ktc1RJFWo+0G4LJLG75V6AHWLkgZCDAyotfVwv+763vRifi5M4if/KA78qEk46Fi7eS7G1hpo0Qxzjezh0J5JPKoQ0BrajmlSqRL6fTHQNcRXv2pq2rSyD2s0QyIbtU6D6cduDPIBvX2Ym3hX70dLT8WuxQ/eROOu6pOejIp3fM6v0oQpvO+oYB/
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB4545.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(136003)(346002)(376002)(39860400002)(366004)(230922051799003)(186009)(451199024)(64100799003)(1800799012)(2906002)(52536014)(8676002)(4326008)(8936002)(5660300002)(54906003)(83380400001)(26005)(33656002)(38100700002)(122000001)(86362001)(38070700009)(110136005)(76116006)(66946007)(66556008)(66476007)(66446008)(64756008)(6636002)(316002)(6506007)(7696005)(53546011)(71200400001)(9686003)(478600001)(55016003)(41300700001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?9d0sPFpNHCL5FWZpAmql3hZEvi4f8YgtbFBD1JAzlsP2nmbWQJ7BOmDdBGrG?=
 =?us-ascii?Q?1br9L2r9ccP9QwP83MqSsmR3m7uwULIMoQ9ALtwc+gEclVpXdoLTf7t0rhh0?=
 =?us-ascii?Q?2DaZLsXi9Jl9E0Ztia20GEhnW/Xb0ifawF4RTaI5nNxVMjd4t5OpiX9MWzfF?=
 =?us-ascii?Q?C1zOjXWp6z8LMdjGEz4SgktG8UtaSW45sltX7XhX6KO0gWO5EV2t6zIiJG5/?=
 =?us-ascii?Q?NZpGlvQe39Ja/WQuImA/PH0JXhxSs0WLhctqPGaqwmO1mjG2K8geZYGCAbCY?=
 =?us-ascii?Q?P3t8v/iuHkl/8j0nRNr1dcuxqLKpQNqQPbk7zAfDwGSkYXZoaIlqe3UwwENX?=
 =?us-ascii?Q?2CYtcaIeBamDRgJQF4Lk8F8J3cREVIoY358n1FcljjFEpY2TkykWXFQ63yKD?=
 =?us-ascii?Q?GjuVbDkLJ2KcaNgLLbWVx0gtY5d5XJUrNvgb0EOwbyN/J9bMZnxcDzBF0whs?=
 =?us-ascii?Q?CyhWRL4Hq8JG+qd1suOlENFXDKxxIjNeAi/7t32soXyCvF7JnYm8T3AHCsml?=
 =?us-ascii?Q?XdNhsBZMUEvgsahVgbEX7WbE+P1rAxWnV4+dnFaHqv4XCyvpAHgO06+ek60q?=
 =?us-ascii?Q?mzjXXksPdQmmW/kOVT5rtDOf7wJ+lPozErzy0Gnw85xneGcBAxcNacADAtBb?=
 =?us-ascii?Q?kr/CvC8HAubLgyk6iI60PzEng5KgXacjCDOb/biVcbVj996Ec3nyisTJ4Eco?=
 =?us-ascii?Q?vkCxvmH3Kujj9ZD4ajQlwwH3kMFEIjjpGsrVBlKnEErxrHzdCk/pO8rSvf5m?=
 =?us-ascii?Q?gTS6AhE9OtuQ3zJEllKOgW/q6QAWryv09+vN8Vy+sD2x70S2P6EjdERC826M?=
 =?us-ascii?Q?Dk9kcbn/XJuKMco55vRe/VLSicKf1DHvv/VCDQPeXVms+EZmiatAZ08ycGTi?=
 =?us-ascii?Q?mw5zbgyrIG8jzfL4uqfIUb/JJ4Vn48BylOBjMhj1MMmKuV7Lq03n5DBzUi0u?=
 =?us-ascii?Q?ZuuVN0aWKCNnAfoR6zbA5AI/y8sCWT7kz3e9bEQYPQBhTaY0cq5zX/tSOpnT?=
 =?us-ascii?Q?KEIW04D+lwV2/R1cd3qNaUpqjCWjqWTs3UZ8zRBhgZjig1Y3TtlPGE2x7Tju?=
 =?us-ascii?Q?NE8QvkBOp0RipzOZYpKrY10YkiYLSkLEXy23Y0/uE0I4mFTkzTgSx7LLDq9D?=
 =?us-ascii?Q?x861TTtumGd7+NvzaErpq/VqqFa5PY00pTE75zBdhgJp5JCE39bsBA64A5px?=
 =?us-ascii?Q?wxcPbczIKWpqiktRZPO4sNUa9yaN5bZVG7f4Ww0v8eGkHhJxeW2zlWDhCv1C?=
 =?us-ascii?Q?uWY2wKtUF5ouG0EEeFEWLaGAGqb0SKZkdw/Sxhh85v5OIR24AC1obgsk1CWN?=
 =?us-ascii?Q?godNORR3nW3dhcA7OkESjhsvIAGivm2JhcwcC/XityGHE37t+Jiw57rLIzb/?=
 =?us-ascii?Q?Sl7EDu8Qhv5/6nezYfd7B5Ml+tmBLI7uGQ+uGLQPF0MdITooKtPf4ggohQ1U?=
 =?us-ascii?Q?EzQoG4oVfIVEJS8nZoUgQJwxsUMjnVMM3oMIgP5OUUMZnwneLIYU5QkbJ90a?=
 =?us-ascii?Q?+8GPUqPJZ6Oy0psr1yOeXg9lt/mUTEhADbtJkO29nR6cEhWut+Vm9G/P++Si?=
 =?us-ascii?Q?z15NAgWW9xaZt87BLQo=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB4545.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b74bc418-f61f-42eb-8df4-08dc29791e60
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Feb 2024 14:12:15.6687 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9v4M/tQNBWkyNe40BHv0/CPwEarpNnMhj1Fy7+dsQY9SPztzy7gpGnxjQgMS5WaH
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR12MB4428
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

Reviewed-by: Anthony Koo <Anthony.Koo@amd.com>

Looks good, my mistake for not noticing this!

Thanks,
Anthony

-----Original Message-----
From: Dan Carpenter <dan.carpenter@linaro.org>
Sent: Friday, February 9, 2024 8:03 AM
To: SHANMUGAM, SRINIVASAN <SRINIVASAN.SHANMUGAM@amd.com>
Cc: Wentland, Harry <Harry.Wentland@amd.com>; Li, Sun peng (Leo) <Sunpeng.L=
i@amd.com>; Siqueira, Rodrigo <Rodrigo.Siqueira@amd.com>; Deucher, Alexande=
r <Alexander.Deucher@amd.com>; Koenig, Christian <Christian.Koenig@amd.com>=
; Pan, Xinhui <Xinhui.Pan@amd.com>; David Airlie <airlied@gmail.com>; Danie=
l Vetter <daniel@ffwll.ch>; Kazlauskas, Nicholas <Nicholas.Kazlauskas@amd.c=
om>; Koo, Anthony <Anthony.Koo@amd.com>; Pavic, Josip <Josip.Pavic@amd.com>=
; Huang, Leon <Leon.Huang1@amd.com>; Adhuri, Mounika <Mounika.Adhuri@amd.co=
m>; Huang, Lewis <Lewis.Huang@amd.com>; amd-gfx@lists.freedesktop.org; dri-=
devel@lists.freedesktop.org; linux-kernel@vger.kernel.org; kernel-janitors@=
vger.kernel.org
Subject: [PATCH] drm/amd/display: Fix && vs || typos

These ANDs should be ORs or it will lead to a NULL dereference.

Fixes: fb5a3d037082 ("drm/amd/display: Add NULL test for 'timing generator'=
 in 'dcn21_set_pipe()'")
Fixes: 886571d217d7 ("drm/amd/display: Fix 'panel_cntl' could be null in 'd=
cn21_set_backlight_level()'")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/gpu/drm/amd/display/dc/hwss/dcn21/dcn21_hwseq.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/hwss/dcn21/dcn21_hwseq.c b/driv=
ers/gpu/drm/amd/display/dc/hwss/dcn21/dcn21_hwseq.c
index 5c7f380a84f9..7252f5f781f0 100644
--- a/drivers/gpu/drm/amd/display/dc/hwss/dcn21/dcn21_hwseq.c
+++ b/drivers/gpu/drm/amd/display/dc/hwss/dcn21/dcn21_hwseq.c
@@ -211,7 +211,7 @@ void dcn21_set_pipe(struct pipe_ctx *pipe_ctx)
        struct dmcu *dmcu =3D pipe_ctx->stream->ctx->dc->res_pool->dmcu;
        uint32_t otg_inst;

-       if (!abm && !tg && !panel_cntl)
+       if (!abm || !tg || !panel_cntl)
                return;

        otg_inst =3D tg->inst;
@@ -245,7 +245,7 @@ bool dcn21_set_backlight_level(struct pipe_ctx *pipe_ct=
x,
        struct panel_cntl *panel_cntl =3D pipe_ctx->stream->link->panel_cnt=
l;
        uint32_t otg_inst;

-       if (!abm && !tg && !panel_cntl)
+       if (!abm || !tg || !panel_cntl)
                return false;

        otg_inst =3D tg->inst;
--
2.43.0

