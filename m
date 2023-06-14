Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B8AB272F5FC
	for <lists+dri-devel@lfdr.de>; Wed, 14 Jun 2023 09:21:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A31ED10E0E2;
	Wed, 14 Jun 2023 07:20:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from APC01-PSA-obe.outbound.protection.outlook.com
 (mail-psaapc01on2098.outbound.protection.outlook.com [40.107.255.98])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0203710E40A;
 Wed, 14 Jun 2023 02:47:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=V3atfKq6Wwlhuub9fwVvFJmCTb9NBAnMVclKETIvxgr6KHI/9d+5S0TXSq7nOPv5DUn04e8k/o1M+42E1C5AXRBzCLPjojCddZzu70csmcqgbdm8eDYlLQXBdCJu74icjp0/xMUs/tfVf6Y1ZCuESUHoMbOwqujKvy0IaTEHoBPgEsQfiFZibKoLYFHpLFbto5ML7tHjDlsyEzqRYfsAHd+h8bI4QjWSIMYX9ZP1e10rjfWDHI93/f1bBLd1n6YqgYXxbPWr3STysrfR5vXMpGuHfFXdP0dSCc/UGMZ/BhgnJXjc2V8YLva/tS4gx0zNtii/K4+TjcxKN93+lXA5nQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RKM3Q3naLiFp9tz3S5RK2wWdC2LlOvmKlIWduanW3V4=;
 b=D5zv/5E6BB4QZV3lQQPqroIebAsOWNQFywrM9Ki3sgvEw46XZ3lPGPO8n4s3B2KfAbZHKd4STm7n3WbHnyCg+FPL4OVpom65lGDbrmlP9lnXHKZvaKxu0/aLUoIxWIY0LpvuJVU/xUpifUXrBEtcVCpBdMtalIIbsyisIKGsF5DJOvBqu/RoohZO/gcKHXTIEXeDXLdSJW3g9lclJJqrssNijyRSfi+t6V1ebWiUYWAsh8eRpza6wGjnzS2ht8dDLgmOCOtbYAL3HVON3Dh/I6Ez4pSDd5d5WTcTtNf+e4CyRn05Yr4Gk5k0EKd+3cPWEYxExkg8R7DHoAaEzyfqEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RKM3Q3naLiFp9tz3S5RK2wWdC2LlOvmKlIWduanW3V4=;
 b=C8SBEfFiDqrx50I5hfcTLTaYtQO1EvAcT/CDzyRDdRl0bf75oJIRc7T4VwaH0vYCiyzkSG+2Pb4UdzJN6BOxr55JZTBHXWxwkeNN5SSvavuk42DL+UTaIVbcHiHEggoN8scw2laWQ8axK11bJjE5JyG30Dp3lmUsORAzx2nLy2vTchnBT/eII4PLGxrLcJEKZIFqW0WvVqeiWlXzxfONuQMnJukqf7o9C+DsJ4WpBE34R4jROYUg1ETasLgvtmqOP2Ak5gtNoSDeQWPVGDzyAIMPyXMODdorEyic9uxnRIJWoHBVTGD7gh70tTIyu2bxBS3U2bcH0qcTzaGVjQG9fQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SG2PR06MB3743.apcprd06.prod.outlook.com (2603:1096:4:d0::18) by
 KL1PR0601MB5583.apcprd06.prod.outlook.com (2603:1096:820:c7::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.44; Wed, 14 Jun
 2023 02:47:54 +0000
Received: from SG2PR06MB3743.apcprd06.prod.outlook.com
 ([fe80::7dfd:a3ed:33ca:9cc8]) by SG2PR06MB3743.apcprd06.prod.outlook.com
 ([fe80::7dfd:a3ed:33ca:9cc8%6]) with mapi id 15.20.6455.045; Wed, 14 Jun 2023
 02:47:54 +0000
From: Wang Ming <machel@vivo.com>
To: Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Wang Ming <machel@vivo.com>,
 Stephen Rothwell <sfr@canb.auug.org.au>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH] drivers/dcn32:improve-warning-messsge-for-dummy_latency_index
Date: Wed, 14 Jun 2023 10:46:38 +0800
Message-Id: <20230614024718.480-1-machel@vivo.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-ClientProxiedBy: TYAPR01CA0228.jpnprd01.prod.outlook.com
 (2603:1096:404:11e::24) To SG2PR06MB3743.apcprd06.prod.outlook.com
 (2603:1096:4:d0::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SG2PR06MB3743:EE_|KL1PR0601MB5583:EE_
X-MS-Office365-Filtering-Correlation-Id: 93db3923-a61b-4ec7-dc65-08db6c81c09a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /59cgCuhRlTI+TUqkCfYtK2iQWte1JVrQqfRSFG72hEsWbCVaYoZXmhDuq2Fj1dOYJ9UYJfytZ/OiF5zInMolxUcNCveJx1NSX2R3sj8fABdFTlzWwzIZLNhqJhmbt3oWdrj7WpXai2ihQJ7gZCjbyeRPPjiH4GmPxIcLU3xo4+8+m8rGkI8J3KkS3BcSrjrG/v6dhz0mtKeJU8GuVR5wmIR/bGegQ66VnQt6971K47pneGqi2VAagKS2chIYzDvLWCyDhLYmMWiC6u0ztxd+nkImGmzrTGPzpN6WKN9WaEKkcycyF3YeNvVQ7YZ8Rd+RNXdbHOkgLwHKG0PZGWvKdNjI3Y+ySHJnf5+XzpoPszsznqwwldV5ZuTOGTqhQGxT3zuwezD6a5CwzftN6xxTLs9ujD5iJmfitXV6GHIMM2L2LPKmMwOKnbSrep9ZgQ4a9eAwhtMB4Z6y4ZTrHofdvjGqMRXkwa9UawFHUX+YAffRJTmmlPrHmLDR7RI0cyqsgAYTNWSnKq0XJwIGLGftPAAjcAOBmAvauaatDn7LTr+db8veRKwxNbzcSNpf3CPE7Ui0YWP3THU372S0iyPWwmDAs/3IzYyA/Te7FNEV2kjPgNex93aIX/g+sqiWY4NhzFaCsT2gOFa9cregILxig==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SG2PR06MB3743.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(346002)(376002)(39860400002)(136003)(366004)(396003)(451199021)(110136005)(86362001)(83380400001)(6512007)(1076003)(6506007)(107886003)(2616005)(26005)(186003)(38100700002)(921005)(38350700002)(478600001)(52116002)(6666004)(36756003)(6486002)(2906002)(41300700001)(316002)(8936002)(8676002)(4326008)(5660300002)(7416002)(66476007)(66946007)(66556008);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?kOkVpoN1Pm7/u4o05KI6c3GquapMlLQ94oOU2BXIjcobmUPdgesPd4XlrD4I?=
 =?us-ascii?Q?f1VsxIOJy6JA0YGUg1Ok535YhFoo5jAmRd0rGKMbtNlRxcZeg83Y8MH9K1oD?=
 =?us-ascii?Q?P34x2KRPtvAtuSDkcFVme0lr+EUJFrSoa4F7FHMUy2jJw9ODzuXkSm1tgsP9?=
 =?us-ascii?Q?p/mRJazW23RRS8Cs1cjDyFNqbIho/m/pwTji/SnuGIUDcxxlaH6zkM2cuzFK?=
 =?us-ascii?Q?dGv+pwRWAPWJma9AbFFNlPg54tnV3J7KAIcAO42BTpdBd8HXagdNanZZEnkM?=
 =?us-ascii?Q?IhBAQCysvF9F7zqvNuqPrcsm7g8hL7S+vslIhkf7IK7dapYySjCVeEXCykyb?=
 =?us-ascii?Q?B+NNYl7jyzlZLWFv9TGtAoPKBKhipXam93RckU5VRNPwLjgfezRB0Ua1o4zb?=
 =?us-ascii?Q?5vlNEIQCni6pKYblcFFKNSVrTP8Ysc7viU77WJexJSv15RMnfOn4jyi2fENr?=
 =?us-ascii?Q?foh3jRn7t5JUpC0T1yn0sr+fX+MJ1oRC4c8hd+jKHMQVeQXgUtm5zSYGa0Mc?=
 =?us-ascii?Q?cwFL26Qcwm5NbPJ6WM5rcyDOKIl4l2Rcq/gQYto+h+5PyQDXSLs1Kc6ts63z?=
 =?us-ascii?Q?XaEccTBtB3hMNXDO736TNUbYQJYNlhymY6R2dtc4qqGUppZVCoYvXmXb13L1?=
 =?us-ascii?Q?Gd/QKAgHrIN/+QuICndzZLOpKWMRZsDHnL0jKadXBhpvqlTa6LuDs17mP2a+?=
 =?us-ascii?Q?gSDXlA11n9AE7Nwbnms6a563T4T7L6sE6pLFwMwc9i38ddtRTPPqvdDWdvpf?=
 =?us-ascii?Q?352arf1WKdavGBmLMktO3iNojYgBuntvKN88O8MWFspMXHH2/oTM+JcnuC3Y?=
 =?us-ascii?Q?nFij2iHpvvTiAvj+FZ2GbqbewX8g5ovjViH+ndRCwpuzYFmFtepQfqeDjYXG?=
 =?us-ascii?Q?Uquqhb+psGhMCcHcFwLAPeE4LQVod0XgmV5AQ17TICNrxVd1fyLocpaUC5tq?=
 =?us-ascii?Q?QngBGjIotrZFukPK6yFnCXvq6MsrasI9J8MQo48Wwl0YOmqOTz4q8VAOlo4z?=
 =?us-ascii?Q?5gc/mGB0JIVy8vjEBUTDyu+1KOyUduFMpgBpXxfZTWL8y5s3VHUfPFjr8hmQ?=
 =?us-ascii?Q?E4ESFysgcycefv18wEKnMYFnqDSt39EMmiiHHuB1mu67D6sBdKrBCte5YIVu?=
 =?us-ascii?Q?pdWY+uy/GzbWFXkoig5+W4iYw0tu/XG86uh9VzqPs/ZgzNgJzNArvuLTDc/0?=
 =?us-ascii?Q?W51oxuaSHx01vQ1B9djwivF2LnArEZG1Jmk5snC3bPaOOPRy+4mFF/s6hu1u?=
 =?us-ascii?Q?CR4hFDifjGQd6uz5sXR7G4Kb2B47nRsGftWrpopYh9mOqzkGYg2jzh9QTC30?=
 =?us-ascii?Q?iZvTK8UUYcydqyKLwAdWeFILoWWJcGPrcaREWdEVO1T2wG9Sqem83GbSOeDj?=
 =?us-ascii?Q?2nEiMqjSNJ1IU1bGCixzYdJ7bxCnP3NE5S43fr4D5L5geKcUxqi++h/zovIA?=
 =?us-ascii?Q?DMOyzs7jWI4iDSTdFrJh5kgJ4Ngxd+L5BSRproN4m+V818uqeNdPkudEFbd6?=
 =?us-ascii?Q?yunYf7BJ3IR+JEpmSAMpB3/rUQ8CbihqJaFsVzu6w+IvfSfT4TKjKs4AdGLf?=
 =?us-ascii?Q?dSTC0vr+BXle4TgKttFE1Bv8p9SJIcVhcdWDYnNR?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 93db3923-a61b-4ec7-dc65-08db6c81c09a
X-MS-Exchange-CrossTenant-AuthSource: SG2PR06MB3743.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jun 2023 02:47:54.3205 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: z9V8C8QG5HHLmacam1+7pQEIAOZdKQ8gcRlNdim6CSYsuEFB/o86P4XZYlZOr42OMrAhvoYoSI7YLVThvE5H3A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR0601MB5583
X-Mailman-Approved-At: Wed, 14 Jun 2023 07:20:34 +0000
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
Cc: opensource.kernel@vivo.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

 Unsigned expression compared with zero:
dummy_latency_index > 0.The return data type of the function is also int
For rigor,it is necessary to replace the data type unsigned int with int.
Otherwise,if there is a negative number,the consequences will be
disastrous.

Signed-off-by: Wang Ming <machel@vivo.com>
---
 drivers/gpu/drm/amd/display/dc/dml/dcn32/dcn32_fpu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/display/dc/dml/dcn32/dcn32_fpu.c b/drivers=
/gpu/drm/amd/display/dc/dml/dcn32/dcn32_fpu.c
index ad6ee4858..e351357ff 100644
--- a/drivers/gpu/drm/amd/display/dc/dml/dcn32/dcn32_fpu.c
+++ b/drivers/gpu/drm/amd/display/dc/dml/dcn32/dcn32_fpu.c
@@ -1941,7 +1941,7 @@ void dcn32_calculate_wm_and_dlg_fpu(struct dc *dc, st=
ruct dc_state *context,
        double dcfclk_from_fw_based_mclk_switching =3D dcfclk_from_validati=
on;
        bool pstate_en =3D context->bw_ctx.dml.vba.DRAMClockChangeSupport[v=
level][context->bw_ctx.dml.vba.maxMpcComb] !=3D
                        dm_dram_clock_change_unsupported;
-       unsigned int dummy_latency_index =3D 0;
+       int dummy_latency_index =3D 0;
        int maxMpcComb =3D context->bw_ctx.dml.vba.maxMpcComb;
        unsigned int min_dram_speed_mts =3D context->bw_ctx.dml.vba.DRAMSpe=
ed;
        bool subvp_in_use =3D dcn32_subvp_in_use(dc, context);
--
2.25.1


________________________________
=E6=9C=AC=E9=82=AE=E4=BB=B6=E5=8F=8A=E5=85=B6=E9=99=84=E4=BB=B6=E5=86=85=E5=
=AE=B9=E5=8F=AF=E8=83=BD=E5=90=AB=E6=9C=89=E6=9C=BA=E5=AF=86=E5=92=8C/=E6=
=88=96=E9=9A=90=E7=A7=81=E4=BF=A1=E6=81=AF=EF=BC=8C=E4=BB=85=E4=BE=9B=E6=8C=
=87=E5=AE=9A=E4=B8=AA=E4=BA=BA=E6=88=96=E6=9C=BA=E6=9E=84=E4=BD=BF=E7=94=A8=
=E3=80=82=E8=8B=A5=E6=82=A8=E9=9D=9E=E5=8F=91=E4=BB=B6=E4=BA=BA=E6=8C=87=E5=
=AE=9A=E6=94=B6=E4=BB=B6=E4=BA=BA=E6=88=96=E5=85=B6=E4=BB=A3=E7=90=86=E4=BA=
=BA=EF=BC=8C=E8=AF=B7=E5=8B=BF=E4=BD=BF=E7=94=A8=E3=80=81=E4=BC=A0=E6=92=AD=
=E3=80=81=E5=A4=8D=E5=88=B6=E6=88=96=E5=AD=98=E5=82=A8=E6=AD=A4=E9=82=AE=E4=
=BB=B6=E4=B9=8B=E4=BB=BB=E4=BD=95=E5=86=85=E5=AE=B9=E6=88=96=E5=85=B6=E9=99=
=84=E4=BB=B6=E3=80=82=E5=A6=82=E6=82=A8=E8=AF=AF=E6=94=B6=E6=9C=AC=E9=82=AE=
=E4=BB=B6=EF=BC=8C=E8=AF=B7=E5=8D=B3=E4=BB=A5=E5=9B=9E=E5=A4=8D=E6=88=96=E7=
=94=B5=E8=AF=9D=E6=96=B9=E5=BC=8F=E9=80=9A=E7=9F=A5=E5=8F=91=E4=BB=B6=E4=BA=
=BA=EF=BC=8C=E5=B9=B6=E5=B0=86=E5=8E=9F=E5=A7=8B=E9=82=AE=E4=BB=B6=E3=80=81=
=E9=99=84=E4=BB=B6=E5=8F=8A=E5=85=B6=E6=89=80=E6=9C=89=E5=A4=8D=E6=9C=AC=E5=
=88=A0=E9=99=A4=E3=80=82=E8=B0=A2=E8=B0=A2=E3=80=82
The contents of this message and any attachments may contain confidential a=
nd/or privileged information and are intended exclusively for the addressee=
(s). If you are not the intended recipient of this message or their agent, =
please note that any use, dissemination, copying, or storage of this messag=
e or its attachments is not allowed. If you receive this message in error, =
please notify the sender by reply the message or phone and delete this mess=
age, any attachments and any copies immediately.
Thank you
