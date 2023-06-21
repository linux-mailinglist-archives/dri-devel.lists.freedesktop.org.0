Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AE658737A0F
	for <lists+dri-devel@lfdr.de>; Wed, 21 Jun 2023 06:12:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D788F10E3AE;
	Wed, 21 Jun 2023 04:12:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2040.outbound.protection.outlook.com [40.107.223.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3690F10E3AD
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Jun 2023 04:12:26 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IItQX+8m+AChFfQVEV6mVhT1Kq8KLNL7mCcajbvqOT/ZXaPIyq1wU4vaQwJih6eGtfMkiDHNQme1kMXwnu/M+XwUw0YbpyGeEguiMfZzzQgLmP/Zs22fX8hhB9XHqh2oaQrG/T/w5aon9UJjioOESvCNFPv5ewDgwvMM69ttPV8sDbg/WFNPdW0QPqvrb8ycfZzdH9JOvlUHbNxsTkRvLq4b+5QkydNy8A6bCMf3Dq24UwqFMYzQicjntZ9HXfQGsmLICUjFvr47ER2GMuGrBu14KKVZ1V+b1DOwyQQsEN5BSdCqdOGP72zrKDgfVuooqOugcA6IVAsHqGE2HhP5Wg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ORYKGl+lp0vEJRNVd5ueiYiye9tR7RIaNxo/EZBU2K8=;
 b=EidPR6OJhlpL+JSnbASK9U4C0BatsmBE+e1utIAB1NOij6172rhj4jORVvurt0N+0Gs3PrZndb/HOCxtEgfCgxSrkkyrjbXNbsbm9zoE9xbH0yU9bZNsSBNzBQt6BNGFx1BiBkEosqpI7jsX6xU8hwdlPgkUnFrZskyHm76xpbrd2eSfbRSSqhDbfeYQNrYnEcPwRA5PQQhkFrRNGaweW0lD2tyIuZkUzQRK6xzBfmNzz5OO8bjpX7SkzFd4B0BXQYLJXogiK7fMjNbcPXJuyXMJ+gWwowWhA3kklEyi6JlutbKHBvle6wDkpPUEUlWVeUbpNLNeaWABWG/uommoJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ORYKGl+lp0vEJRNVd5ueiYiye9tR7RIaNxo/EZBU2K8=;
 b=J8jnMQen5nRUBjkS7P4YT/BSuo20HRqyN4BjR0EmfVEvJcFQRp/Gy+L1JMQGwRgX3nX8QrWwMA9ixGDK7ovYDW2Tw0yrR7HXKAvCJKmMlb3IeKh2YNs82BjQjcN1AKEszXwtqfa46tdBNfQJhyLJJJGSkHSYXsO4ozTadRgDm3A=
Received: from BYAPR12MB4614.namprd12.prod.outlook.com (2603:10b6:a03:a6::22)
 by PH8PR12MB7027.namprd12.prod.outlook.com (2603:10b6:510:1be::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6500.36; Wed, 21 Jun
 2023 04:12:21 +0000
Received: from BYAPR12MB4614.namprd12.prod.outlook.com
 ([fe80::8f81:b929:d2f9:4ef0]) by BYAPR12MB4614.namprd12.prod.outlook.com
 ([fe80::8f81:b929:d2f9:4ef0%4]) with mapi id 15.20.6500.036; Wed, 21 Jun 2023
 04:12:21 +0000
From: "Lazar, Lijo" <Lijo.Lazar@amd.com>
To: "Yang, WenYou" <WenYou.Yang@amd.com>, "Deucher, Alexander"
 <Alexander.Deucher@amd.com>, "Limonciello, Mario"
 <Mario.Limonciello@amd.com>, "Koenig, Christian" <Christian.Koenig@amd.com>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>, "Quan, Evan" <Evan.Quan@amd.com>
Subject: RE: [PATCH] drm/amd/pm: Vangogh: Add new gpu_metrics_v2_4 to acquire
 gpu_metrics
Thread-Topic: [PATCH] drm/amd/pm: Vangogh: Add new gpu_metrics_v2_4 to acquire
 gpu_metrics
Thread-Index: AQHZlCnSboQ+1mU0yUyOCrjgCJtXKK+Uw7Rw
Date: Wed, 21 Jun 2023 04:12:21 +0000
Message-ID: <BYAPR12MB46148161BB006E0FEE1EA355975DA@BYAPR12MB4614.namprd12.prod.outlook.com>
References: <20230601013826.265885-1-WenYou.Yang@amd.com>
In-Reply-To: <20230601013826.265885-1-WenYou.Yang@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_ActionId=70c81621-f39a-4e17-b8da-de9740f05dd0;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_ContentBits=0;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Enabled=true;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Method=Standard;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Name=General;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_SetDate=2023-06-21T04:08:21Z;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR12MB4614:EE_|PH8PR12MB7027:EE_
x-ms-office365-filtering-correlation-id: 91c04f1f-532a-4082-c3ac-08db720db5ac
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: N8Y24KkwKcLvVZBMHp4vGtZPCj9CDDsNXqwYhBYXuJcRCfX6DJgdUYBNXtFefyZjIgGeuid8Q8Cs9U5JFYRVCtGD4ISujUpazUksZMtyoCh4blnTeRPPqiBw4si7vxHmxbgbwnsU6QyjkfBrHMhvGzHMkWNDbLmpAS9mZm0CAylkI4DwfvsBxQMFrSafFac3AExzllUIvbs/Aa0vdOAwcx7ddpNdsOajmlyOehQytvmf0IeLWbq9L0Xa1M3xoG0/ICYDcVAZaVfh+CFMG+folQ+qLFwrxC7CXmUaflGgaqe2Xa31MR9ztU3FAR3Or2Qz6/KvKU+9NevI07joLlCcx5SICgK9wy5iTK0vQmhp3vy735xrXzqOgWOCMEBIYnrSV/c0M2HZ9EZe4pcUuWrG34+FixGVL2FToNudu+J07E6wgy7+tEUbswfWZy1g1PLnNxLjIDC5gBIjNII/nl8nqp6kvkA5xnwdXdKQpp6dxqC5cPj/jkf/Sz+Pl8DjEVjsm2VRiyTO5Pxhi262dotM5I1gcSH4Gv8vZPcY4BrAdtcB11Hq6daM8Xjt3ITSuIWh9Caw97yN44m18U1xX7id6nFPG5slBH8zdZkqdfytvjFG6nrPTBs1HWIij+fkoNirDUc6CSOeXFIAflxbCUuTnnHGhz6qPRvdJsvsJHXLfp8vYMKaU6MqXUk7fQfiAAl3
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR12MB4614.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(396003)(39860400002)(346002)(376002)(136003)(366004)(451199021)(38070700005)(41300700001)(5660300002)(52536014)(8676002)(8936002)(2906002)(33656002)(55016003)(86362001)(9686003)(6506007)(53546011)(26005)(54906003)(186003)(110136005)(478600001)(7696005)(71200400001)(66556008)(64756008)(76116006)(66446008)(6636002)(122000001)(66476007)(921005)(4326008)(66946007)(316002)(38100700002)(83380400001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?DcrUavYgUZyN7Oo8eznr40nv9lG52f52TtQAh2NBhbg+T+XWOzLpLwQnHFpX?=
 =?us-ascii?Q?cH+OZQv8MBek50k+FSaBAJj7HUsBDdp1s5D2GFZLSYzrljvBkZdlIAZo/N8F?=
 =?us-ascii?Q?Zewggk6ehHPO4A0AAV5h+QBIGtWADFRMJLTOmCZylv3f7IeUiGzEDN0ruaq5?=
 =?us-ascii?Q?U4Jsx9syksU34/X3ZkXIPpGBfVaL9CLLInDyhHPkzateqbJl48y+Ul+M5h5B?=
 =?us-ascii?Q?JU2ckKtvgCfwYKGwx6a7jR2ao03BkRMsksv307hFMQgPhPRktf+M7W13MrMt?=
 =?us-ascii?Q?gDAwANtXg+p1UhZ8TvZCezIpOmVBgB8tT9XwreqjCepf+SAa+ssYoV4lpbZq?=
 =?us-ascii?Q?VgYWzMmsL0GSZUJqbN6CFPtLG3z0+YacstIcGuIFaRN8GmzLn3x70b0ih0dQ?=
 =?us-ascii?Q?gffeaM4kUjMMlkxQPlsW24WL0uhvL0zDqqV0DJ5OxF/I695P2+k9B5EBD5PD?=
 =?us-ascii?Q?LF94wKyNVQY7RApWmyUzOqz43w2G1oeJ35Z78EL7+ocRdKCpCp4z8ukQknCq?=
 =?us-ascii?Q?O1dKK9EAAQbt7M/uyXn/avJuba20XNebgOqmFaU877GtHfkar3vmX2z2aD/9?=
 =?us-ascii?Q?eFj15vgMnroOTYUxcsV85ClyP7ezym0PhDECi0NzprGWR2qnpjcJkpH0v8Yv?=
 =?us-ascii?Q?OxhV1wMxXsJEUWAVrlqWMbLYSt5XMCYLVKx3HUV5kpeRn0W790LLcXw15i/4?=
 =?us-ascii?Q?iK1ql1eyhnJOpqzDxMOUFQ+49G0s2joaviLh1tTIE0MmI8LsV6Xn+Cg/L/ok?=
 =?us-ascii?Q?UM/FY6SSw4tCqg055EBK8WjVeTL6v/cgkicU1sQgtkfAl885UJ0UW+vs4++2?=
 =?us-ascii?Q?l+Sul8kELnIKV6SD9mA8zoUWZclZBOTBCJbqLs9Oz+bdA/m9BZFQCao5Kh20?=
 =?us-ascii?Q?TueN68O9SwxzZ1qg0TGF45K3DsKBv/iC0KwqGgGHSOYDorgmlxf0mDj0deMq?=
 =?us-ascii?Q?s4LNxR/vCAUEv2b44Le2KHgEsZJPyKtiN10D3l1WXeXrK3GqKAFHDJyUwR9N?=
 =?us-ascii?Q?BVa8Pu+cnBvyM3aYvRdua1IQORqTW1YbfYJ+O6aYgyflVn1TZO94zWNaO8FB?=
 =?us-ascii?Q?WAiSNwVKkk1QhrupajCnJs96lGCrDI+rNV6/y5Fv4H6yOSCI5k0alJ0RBo7a?=
 =?us-ascii?Q?irq4FDYuxIw7vB/YNbOGbm1AxveaB5b+t+txa/BMpxAtj8FKrKZ3maDIDYdR?=
 =?us-ascii?Q?cJqTWl6Sy4bT2X3stgGRsyL4fEM+OmpY31f3g1l3l/yStY63PztynueCIjwp?=
 =?us-ascii?Q?ha1Y3sIX1yRUs0tyIsnT1rBhNUEmkeAysLP4BHbUd0MzKF6u+dW2oyyJEUKl?=
 =?us-ascii?Q?HAG+ljlJwSiyUSFpIi7kF8lWkacARObQJKS2cqqCG4+xB9nuz+HbNNFf1HBP?=
 =?us-ascii?Q?3QJ2huLSqSgI+BHS12iGXubbYufC1DmyZo83Nr9eb0iUeGuwatfQFMqIijv0?=
 =?us-ascii?Q?5XbN2Lhef7gmyzXCvGLqPX9nunoZbSkIEh1U1GjvrIPuvI83Sx+hurjn1ppf?=
 =?us-ascii?Q?qx5uriZAhiGNTh4WC4HBsP8R6/OoePEywAQT8tIFi6jzJx/bOF5h2RTBk5OQ?=
 =?us-ascii?Q?NwL/jF9N6XCfpRnzZa0=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB4614.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 91c04f1f-532a-4082-c3ac-08db720db5ac
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Jun 2023 04:12:21.0943 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: V327KqENJ58vk95x18TXKQHvJEckXHSyyqkTY9seehaH1luZhqRqcRFzt2JXSsqn
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB7027
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
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>, "Yang, 
 WenYou" <WenYou.Yang@amd.com>, "Yuan, Perry" <Perry.Yuan@amd.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Liang, 
 Richard qi" <Richardqi.Liang@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

[AMD Official Use Only - General]

Could you add the expected units of voltage/current in 2.4 metrics structur=
e? Is it mV/mA or mV/A?

Thanks,
Lijo

-----Original Message-----
From: amd-gfx <amd-gfx-bounces@lists.freedesktop.org> On Behalf Of Wenyou Y=
ang
Sent: Thursday, June 1, 2023 7:08 AM
To: Deucher, Alexander <Alexander.Deucher@amd.com>; Limonciello, Mario <Mar=
io.Limonciello@amd.com>; Koenig, Christian <Christian.Koenig@amd.com>; Pan,=
 Xinhui <Xinhui.Pan@amd.com>; Quan, Evan <Evan.Quan@amd.com>
Cc: linux-kernel@vger.kernel.org; dri-devel@lists.freedesktop.org; Yang, We=
nYou <WenYou.Yang@amd.com>; amd-gfx@lists.freedesktop.org; Yuan, Perry <Per=
ry.Yuan@amd.com>; Liang, Richard qi <Richardqi.Liang@amd.com>
Subject: [PATCH] drm/amd/pm: Vangogh: Add new gpu_metrics_v2_4 to acquire g=
pu_metrics

To acquire the voltage and current info from gpu_metrics interface, but gpu=
_metrics_v2_3 doesn't contain them, and to be backward compatible, add new =
gpu_metrics_v2_4 structure.

Acked-by: Evan Quan <evan.quan@amd.com>
Signed-off-by: Wenyou Yang <WenYou.Yang@amd.com>
---
 .../gpu/drm/amd/include/kgd_pp_interface.h    |  69 +++++++++++
 .../gpu/drm/amd/pm/swsmu/smu11/vangogh_ppt.c  | 109 ++++++++++++++++--
 drivers/gpu/drm/amd/pm/swsmu/smu_cmn.c        |   3 +
 3 files changed, 172 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/amd/include/kgd_pp_interface.h b/drivers/gpu/d=
rm/amd/include/kgd_pp_interface.h
index 9f542f6e19ed..0f37dafafcf9 100644
--- a/drivers/gpu/drm/amd/include/kgd_pp_interface.h
+++ b/drivers/gpu/drm/amd/include/kgd_pp_interface.h
@@ -892,4 +892,73 @@ struct gpu_metrics_v2_3 {
        uint16_t                        average_temperature_core[8]; // ave=
rage CPU core temperature on APUs
        uint16_t                        average_temperature_l3[2];
 };
+
+struct gpu_metrics_v2_4 {
+       struct metrics_table_header     common_header;
+
+       /* Temperature */
+       uint16_t                        temperature_gfx;
+       uint16_t                        temperature_soc;
+       uint16_t                        temperature_core[8];
+       uint16_t                        temperature_l3[2];
+
+       /* Utilization */
+       uint16_t                        average_gfx_activity;
+       uint16_t                        average_mm_activity;
+
+       /* Driver attached timestamp (in ns) */
+       uint64_t                        system_clock_counter;
+
+       /* Power/Energy */
+       uint16_t                        average_socket_power;
+       uint16_t                        average_cpu_power;
+       uint16_t                        average_soc_power;
+       uint16_t                        average_gfx_power;
+       uint16_t                        average_core_power[8];
+
+       /* Average clocks */
+       uint16_t                        average_gfxclk_frequency;
+       uint16_t                        average_socclk_frequency;
+       uint16_t                        average_uclk_frequency;
+       uint16_t                        average_fclk_frequency;
+       uint16_t                        average_vclk_frequency;
+       uint16_t                        average_dclk_frequency;
+
+       /* Current clocks */
+       uint16_t                        current_gfxclk;
+       uint16_t                        current_socclk;
+       uint16_t                        current_uclk;
+       uint16_t                        current_fclk;
+       uint16_t                        current_vclk;
+       uint16_t                        current_dclk;
+       uint16_t                        current_coreclk[8];
+       uint16_t                        current_l3clk[2];
+
+       /* Throttle status (ASIC dependent) */
+       uint32_t                        throttle_status;
+
+       /* Fans */
+       uint16_t                        fan_pwm;
+
+       uint16_t                        padding[3];
+
+       /* Throttle status (ASIC independent) */
+       uint64_t                        indep_throttle_status;
+
+       /* Average Temperature */
+       uint16_t                        average_temperature_gfx;
+       uint16_t                        average_temperature_soc;
+       uint16_t                        average_temperature_core[8];
+       uint16_t                        average_temperature_l3[2];
+
+       /* Power/Voltage */
+       uint16_t                        average_cpu_voltage;
+       uint16_t                        average_soc_voltage;
+       uint16_t                        average_gfx_voltage;
+
+       /* Power/Current */
+       uint16_t                        average_cpu_current;
+       uint16_t                        average_soc_current;
+       uint16_t                        average_gfx_current;
+};
 #endif
diff --git a/drivers/gpu/drm/amd/pm/swsmu/smu11/vangogh_ppt.c b/drivers/gpu=
/drm/amd/pm/swsmu/smu11/vangogh_ppt.c
index 067b4e0b026c..185d0b50ee8e 100644
--- a/drivers/gpu/drm/amd/pm/swsmu/smu11/vangogh_ppt.c
+++ b/drivers/gpu/drm/amd/pm/swsmu/smu11/vangogh_ppt.c
@@ -1854,6 +1854,86 @@ static ssize_t vangogh_get_gpu_metrics_v2_3(struct s=
mu_context *smu,
        return sizeof(struct gpu_metrics_v2_3);  }

+static ssize_t vangogh_get_gpu_metrics_v2_4(struct smu_context *smu,
+                                           void **table)
+{
+       SmuMetrics_t metrics;
+       struct smu_table_context *smu_table =3D &smu->smu_table;
+       struct gpu_metrics_v2_4 *gpu_metrics =3D
+                               (struct gpu_metrics_v2_4 *)smu_table->gpu_m=
etrics_table;
+       int ret =3D 0;
+
+       ret =3D smu_cmn_get_metrics_table(smu, &metrics, true);
+       if (ret)
+               return ret;
+
+       smu_cmn_init_soft_gpu_metrics(gpu_metrics, 2, 4);
+
+       gpu_metrics->temperature_gfx =3D metrics.Current.GfxTemperature;
+       gpu_metrics->temperature_soc =3D metrics.Current.SocTemperature;
+       memcpy(&gpu_metrics->temperature_core[0],
+              &metrics.Current.CoreTemperature[0],
+              sizeof(uint16_t) * 4);
+       gpu_metrics->temperature_l3[0] =3D metrics.Current.L3Temperature[0]=
;
+
+       gpu_metrics->average_temperature_gfx =3D metrics.Average.GfxTempera=
ture;
+       gpu_metrics->average_temperature_soc =3D metrics.Average.SocTempera=
ture;
+       memcpy(&gpu_metrics->average_temperature_core[0],
+              &metrics.Average.CoreTemperature[0],
+              sizeof(uint16_t) * 4);
+       gpu_metrics->average_temperature_l3[0] =3D
+metrics.Average.L3Temperature[0];
+
+       gpu_metrics->average_gfx_activity =3D metrics.Current.GfxActivity;
+       gpu_metrics->average_mm_activity =3D metrics.Current.UvdActivity;
+
+       gpu_metrics->average_socket_power =3D metrics.Current.CurrentSocket=
Power;
+       gpu_metrics->average_cpu_power =3D metrics.Current.Power[0];
+       gpu_metrics->average_soc_power =3D metrics.Current.Power[1];
+       gpu_metrics->average_gfx_power =3D metrics.Current.Power[2];
+
+       gpu_metrics->average_cpu_voltage =3D metrics.Current.Voltage[0];
+       gpu_metrics->average_soc_voltage =3D metrics.Current.Voltage[1];
+       gpu_metrics->average_gfx_voltage =3D metrics.Current.Voltage[2];
+
+       gpu_metrics->average_cpu_current =3D metrics.Current.Current[0];
+       gpu_metrics->average_soc_current =3D metrics.Current.Current[1];
+       gpu_metrics->average_gfx_current =3D metrics.Current.Current[2];
+
+       memcpy(&gpu_metrics->average_core_power[0],
+              &metrics.Average.CorePower[0],
+              sizeof(uint16_t) * 4);
+
+       gpu_metrics->average_gfxclk_frequency =3D metrics.Average.GfxclkFre=
quency;
+       gpu_metrics->average_socclk_frequency =3D metrics.Average.SocclkFre=
quency;
+       gpu_metrics->average_uclk_frequency =3D metrics.Average.MemclkFrequ=
ency;
+       gpu_metrics->average_fclk_frequency =3D metrics.Average.MemclkFrequ=
ency;
+       gpu_metrics->average_vclk_frequency =3D metrics.Average.VclkFrequen=
cy;
+       gpu_metrics->average_dclk_frequency =3D metrics.Average.DclkFrequen=
cy;
+
+       gpu_metrics->current_gfxclk =3D metrics.Current.GfxclkFrequency;
+       gpu_metrics->current_socclk =3D metrics.Current.SocclkFrequency;
+       gpu_metrics->current_uclk =3D metrics.Current.MemclkFrequency;
+       gpu_metrics->current_fclk =3D metrics.Current.MemclkFrequency;
+       gpu_metrics->current_vclk =3D metrics.Current.VclkFrequency;
+       gpu_metrics->current_dclk =3D metrics.Current.DclkFrequency;
+
+       memcpy(&gpu_metrics->current_coreclk[0],
+              &metrics.Current.CoreFrequency[0],
+              sizeof(uint16_t) * 4);
+       gpu_metrics->current_l3clk[0] =3D metrics.Current.L3Frequency[0];
+
+       gpu_metrics->throttle_status =3D metrics.Current.ThrottlerStatus;
+       gpu_metrics->indep_throttle_status =3D
+                       smu_cmn_get_indep_throttler_status(metrics.Current.=
ThrottlerStatus,
+                                                          vangogh_throttle=
r_map);
+
+       gpu_metrics->system_clock_counter =3D ktime_get_boottime_ns();
+
+       *table =3D (void *)gpu_metrics;
+
+       return sizeof(struct gpu_metrics_v2_4); }
+
 static ssize_t vangogh_get_gpu_metrics(struct smu_context *smu,
                                      void **table)
 {
@@ -1923,23 +2003,34 @@ static ssize_t vangogh_common_get_gpu_metrics(struc=
t smu_context *smu,  {
        uint32_t if_version;
        uint32_t smu_version;
+       uint32_t smu_program;
+       uint32_t fw_version;
        int ret =3D 0;

        ret =3D smu_cmn_get_smc_version(smu, &if_version, &smu_version);
-       if (ret) {
+       if (ret)
                return ret;
-       }

-       if (smu_version >=3D 0x043F3E00) {
-               if (if_version < 0x3)
-                       ret =3D vangogh_get_legacy_gpu_metrics_v2_3(smu, ta=
ble);
+       smu_program =3D (smu_version >> 24) & 0xff;
+       fw_version =3D smu_version & 0xffffff;
+       if (smu_program =3D=3D 6) {
+               if (fw_version >=3D 0x3F0800)
+                       ret =3D vangogh_get_gpu_metrics_v2_4(smu, table);
                else
                        ret =3D vangogh_get_gpu_metrics_v2_3(smu, table);
+
        } else {
-               if (if_version < 0x3)
-                       ret =3D vangogh_get_legacy_gpu_metrics(smu, table);
-               else
-                       ret =3D vangogh_get_gpu_metrics(smu, table);
+               if (smu_version >=3D 0x043F3E00) {
+                       if (if_version < 0x3)
+                               ret =3D vangogh_get_legacy_gpu_metrics_v2_3=
(smu, table);
+                       else
+                               ret =3D vangogh_get_gpu_metrics_v2_3(smu, t=
able);
+               } else {
+                       if (if_version < 0x3)
+                               ret =3D vangogh_get_legacy_gpu_metrics(smu,=
 table);
+                       else
+                               ret =3D vangogh_get_gpu_metrics(smu, table)=
;
+               }
        }

        return ret;
diff --git a/drivers/gpu/drm/amd/pm/swsmu/smu_cmn.c b/drivers/gpu/drm/amd/p=
m/swsmu/smu_cmn.c
index 3ecb900e6ecd..cee5e32b4ff9 100644
--- a/drivers/gpu/drm/amd/pm/swsmu/smu_cmn.c
+++ b/drivers/gpu/drm/amd/pm/swsmu/smu_cmn.c
@@ -996,6 +996,9 @@ void smu_cmn_init_soft_gpu_metrics(void *table, uint8_t=
 frev, uint8_t crev)
        case METRICS_VERSION(2, 3):
                structure_size =3D sizeof(struct gpu_metrics_v2_3);
                break;
+       case METRICS_VERSION(2, 4):
+               structure_size =3D sizeof(struct gpu_metrics_v2_4);
+               break;
        default:
                return;
        }
--
2.39.2

