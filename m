Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8ABE77BF2E9
	for <lists+dri-devel@lfdr.de>; Tue, 10 Oct 2023 08:23:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E61B10E312;
	Tue, 10 Oct 2023 06:23:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2064.outbound.protection.outlook.com [40.107.237.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D89510E173;
 Tue, 10 Oct 2023 06:23:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=h8O0tQB10KSPkNPfp5owUvr1XLIt8GWec3hHEGXih9JHUE2weMfh8Y68i8k0gEKYUucead7LE3FXCmFL+jp6FMbO+9rLX1OsNwhCklEIrDFuCJuOlntM9swgaFxkltuIcnycP3kgRJoVF0FEAieACnwLIX8Qy7Ckb811t2Ulz88owGSWqMSxHM0hGyp8P3IMG4W61QlgfExKtcxcvtFYFREFQWHMOvFAD0LddefRyg3g3KsEujR681bKIUaTRfhGeTQcjrDnQ8YDbwRoNGuDs57ocf9Au26ff5UgU0M6NOvZaxX6WHl6GQpVR1f+mK8bKXaqv5Pnn1wHCAYJbgtp+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UESw0BJ8O5Z0dWZVUiicfcl1mHjI23SKdfE6vWLxmHQ=;
 b=KXKyxKJH14LeGfiekYtjDFQN2IxQYvp+eS+DJbSfmZExYdgZ4ayzNdQpCCSrB5NNlKBmKO6BrJBZuPCUMlckRwolT5s0z0AkQphAK56KNrpB85H1W6nQ7y0TWBX+w2FIqau9r735eSe5GCyE5/69bRxltQRlFSFRJ84xLZEJEzcmfThx6fVp3twp0ZUt5fSh2M6YNmlubxzZ9/ff84JTmiQKsq+fYM94S3Lc7Ag9gCwq8kmfhMs1c0eYtCV/tmGKfAbviDGcX6bcSSmogcPAvV5cFveBFtPQ5vl65W3vZ3TYJ+lmKgpp3yB+x8X2qsrXcOlv5BzVh4Y0mogyQgRLjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UESw0BJ8O5Z0dWZVUiicfcl1mHjI23SKdfE6vWLxmHQ=;
 b=gDIi1YsWCdcJ/cituE4wYP8Hl7qv+InQzT7kJA+hLm6CCPPHhrEDqGom/AMPUzQwVbCzntBZeZNkoeOnQOF+qKJYJEZ4tS1XqTSjnUr82aDMx0XvDP8k2kyIFUWOHDbk8Rp7krauVkirda6gXWSO7qpWT8XegdHdACriLkXiQkA=
Received: from PH7PR12MB5997.namprd12.prod.outlook.com (2603:10b6:510:1d9::21)
 by SN7PR12MB6930.namprd12.prod.outlook.com (2603:10b6:806:262::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.38; Tue, 10 Oct
 2023 06:23:17 +0000
Received: from PH7PR12MB5997.namprd12.prod.outlook.com
 ([fe80::734d:d070:e2db:de7a]) by PH7PR12MB5997.namprd12.prod.outlook.com
 ([fe80::734d:d070:e2db:de7a%7]) with mapi id 15.20.6863.032; Tue, 10 Oct 2023
 06:23:16 +0000
From: "Wang, Yang(Kevin)" <KevinYang.Wang@amd.com>
To: Kunwu.Chan <chentao@kylinos.cn>
Subject: RE: [PATCH] drm/amd/pm: Fix a memory leak on an error path
Thread-Topic: [PATCH] drm/amd/pm: Fix a memory leak on an error path
Thread-Index: AQHZ+yBUkkY9goKHvke4iWHhXxo5tLBCVARQgAA2toCAAANXIA==
Date: Tue, 10 Oct 2023 06:23:16 +0000
Message-ID: <PH7PR12MB5997E8A541A39046B0B3BCB982CDA@PH7PR12MB5997.namprd12.prod.outlook.com>
References: <PH7PR12MB5997C208CDD4587332346CD782CDA@PH7PR12MB5997.namprd12.prod.outlook.com>
 <20231010061039.75878-1-chentao@kylinos.cn>
In-Reply-To: <20231010061039.75878-1-chentao@kylinos.cn>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_ActionId=f3c8e787-37ce-4667-9ebb-a625b6ea1218;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_ContentBits=0;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Enabled=true;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Method=Standard;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Name=General;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_SetDate=2023-10-10T06:22:35Z;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH7PR12MB5997:EE_|SN7PR12MB6930:EE_
x-ms-office365-filtering-correlation-id: 20484f2b-ff95-49d1-0c33-08dbc9596379
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 6dC0ZlkSeekicXiaMgLV2yBcZn24K38vA3gMMf1iqfuhljQc4yl4o5LXZpati5HRj0kqehhwyF6zruxTSGDKXXp0s0Vtq4WsmQSE/g6aS6ZX1WjOy8gmvO0f2SgLBfNK/Ie4acPUzRYXaoopAYvNqVPSk/HJRqhNiLAuEWytlgrma+YXrrSqlD2L3DuDzAhx74mvvmgLEbh6a9ZljnvPv/od+yFlculs/f6nd9wTDNwBnWoUOL/aUw5e1VaOTraQwZTYAXIhujn+TOO56yEmvSvzsp6fx0sciJkhGchpCBhFSxVdGtC+x0NJKglWlfxC/z33Pzy4r2mFkCOlTg+QSxiIp94ON46JDeXjWtk8AtUaiEXyUUFMEE+Tb/1GTuVO2C2w0J5ppDbo4Qj5pD4G1TI92g0Y66RVmRhh8X8ZV7bQ+4Q6SvyTNyG7aMf+UtX4cddScPTzR2rgTX4eZhXPQXRe58E4GrJeo/pooQgN2+V6/+geHKMM4r+IcOkQM5A4IyQAPYJKkDEamqdvGj4G0nZ1urTm2PusPL5PF3W8zWLRpq6OFVFr+NNub/cKq9KSnrgiAt4UpQMdkbfGTiHPCvnbTCJe2RtEjdnql4Kx6YKCSA5f4pFqhMSRcMZtavA/
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5997.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(366004)(346002)(376002)(136003)(396003)(230922051799003)(64100799003)(186009)(1800799009)(451199024)(83380400001)(38070700005)(9686003)(6506007)(122000001)(71200400001)(38100700002)(26005)(7696005)(41300700001)(76116006)(45080400002)(53546011)(478600001)(66476007)(316002)(6916009)(66946007)(64756008)(66446008)(54906003)(8676002)(66556008)(8936002)(52536014)(5660300002)(86362001)(4326008)(33656002)(55016003)(2906002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?3+q0f9zMLpwNxkEeIhAuVHbjNWJiDuL+C1k40PdGi6q+IYpzJEjejsLhjsk3?=
 =?us-ascii?Q?80/WOVT9kdVOT0nKDX3WSFZgPfPZwMezkPaexkOlOhoFKj/+kGHfY/71Tln9?=
 =?us-ascii?Q?5BRexLiI5JTjrtbk5LTT66F6TO5CYDYPxQjwvBFru93PoqCRiWwMqG3Tllqh?=
 =?us-ascii?Q?nid/oFQfCo6TQo0LNAqbl5+PS3QzSA2ZKzz2oOx8wp2Emjgcti6z0888xwR3?=
 =?us-ascii?Q?+6ZAFKVyEFlVikaFDqO/2xfyxDYUllgB0Xt4IX1qdSAbXmHXArFoDRta4RU0?=
 =?us-ascii?Q?Bh0+hEEjpPj9hu6s4RbsXYNCGenqzBh+iGxnpSTyB+i+DLjhDJEcKcZe6Cnp?=
 =?us-ascii?Q?eLRfE1/v2lWJb5MiMcrPk/82CouDUHYFcQbfJ130QpLl7J3jaqQMn4whk7Ut?=
 =?us-ascii?Q?qSlTjHqFFF5wwBA3+c4M8qmI6TPF2l6JuAE5VeYaXS/pVPRclUeVg2cEc0hO?=
 =?us-ascii?Q?Pj6NmIM2RzJ9gvwICYudcmDSKaQvGwh/YvEzEO7/dzsKBDLTM620PsZSulTG?=
 =?us-ascii?Q?hcg/1NuaaA7FQqC9jXGGIaLXlTJ/svkITrafLKn/QL8Kal3BB/61FmweUd2C?=
 =?us-ascii?Q?V3xXDxe+z3JGlX2NrVXif+/8w8w40S3BbiXQbvRHstlXSWqWW94tJYD1Ze7A?=
 =?us-ascii?Q?01ju6Tn+DD4gefr+8YfTJEZhEKhhGZM4AM159aWNh4jWtakABj4hgzNtnWRn?=
 =?us-ascii?Q?xByd6qAzgparsZ7hQrrz/UkhCEwpey+VI33NtgsFObpMuELOkYKfTMAGvadZ?=
 =?us-ascii?Q?FuqCq6xrpam7hSazHPUwcsrLOhAY2lUKDcbcxSHeqXAQuR8re1eiSl8WLurK?=
 =?us-ascii?Q?K5tkOnJkjzXQcC9PQhp01kuLoLDyk8SNZ5rLdU7VepcGbtcRYNn2noiuEz2p?=
 =?us-ascii?Q?cnacaBS++yk02hLZtcPbYuVHZTG/aZ3WEWloWFREGvkzDgw/ihnQ4kKq571v?=
 =?us-ascii?Q?e9KXpDCy+Mq4Hc/OzNkKZjtCpFlz/GA10mQibBbbZZzme6Y9Vt6ABGTOdqh8?=
 =?us-ascii?Q?5T6B+RGxau84d6a5gL5WGNtQwXAy0GEYVvz6on2xWyJ+wJXxpEhho4ff2lnc?=
 =?us-ascii?Q?GJ6lxibbS2GYAWtoamxToc8665u34iCXCjYsVceLKZIv2RWXsZwFGz5449L3?=
 =?us-ascii?Q?k0oVBqCk83HUU1Wm7h0IoepA9MqcuXHlpJjwGqh+NDUfuJMoeUadzBhSM+TA?=
 =?us-ascii?Q?WzmDTYet0jo6AgoFAWoK8dudFQLNNG6ThZzJcmv+WVmkKzTSWIPhu1/9TaQl?=
 =?us-ascii?Q?zY0X5gNC6DUL7gSqoRaL5lif9mXhfKwfXWL8etwvQPyQ9LRH/U7saC89IDuc?=
 =?us-ascii?Q?z/Wnb0E5Y9lQMn6S2udWrZMAYGlf1zurYy+O0QbXMWHETANpQBaV4gIZt6vT?=
 =?us-ascii?Q?MjRHyGYEx4v/dU3TimLt4AqLus53LlASWnytbTKLaFaA0yJg3sb+vBBcrAnB?=
 =?us-ascii?Q?fdyCOLtF4dE5tQSmxrI06+EZTg+SYQzwF3OSo1qpw3IGHt+LFm+qMFLNywdk?=
 =?us-ascii?Q?5a0MXGa89FO3ZtJ5vZ8YdjTYF6068OqgLI7EUP/mKfmjdUjjoBSYwKNXUrGb?=
 =?us-ascii?Q?hfocsUsKTq5Fb4fryjQ=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5997.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 20484f2b-ff95-49d1-0c33-08dbc9596379
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Oct 2023 06:23:16.0958 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: eb+h6T4JaBh505KDVbByiQzh+OJnScVxGwi0B6LdBT48JU5wk5zR6EcEZbNs8RU6
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB6930
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
Cc: "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 "kunwu.chan@hotmail.com" <kunwu.chan@hotmail.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Lazar,
 Lijo" <Lijo.Lazar@amd.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "Kamal,
 Asad" <Asad.Kamal@amd.com>, "Ma, Le" <Le.Ma@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>, "Deucher,
 Alexander" <Alexander.Deucher@amd.com>,
 "evan.quan@amd.com" <evan.quan@amd.com>, "Koenig,
 Christian" <Christian.Koenig@amd.com>,
 "dan.carpenter@linaro.org" <dan.carpenter@linaro.org>, "Zhang, 
 Hawking" <Hawking.Zhang@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

[AMD Official Use Only - General]

Reviewed-by: Yang Wang <kevinyang.wang@amd.com>

Best Regards,
Kevin

-----Original Message-----
From: Kunwu.Chan <chentao@kylinos.cn>
Sent: Tuesday, October 10, 2023 2:11 PM
To: Wang, Yang(Kevin) <KevinYang.Wang@amd.com>
Cc: Deucher, Alexander <Alexander.Deucher@amd.com>; Kamal, Asad <Asad.Kamal=
@amd.com>; Koenig, Christian <Christian.Koenig@amd.com>; Zhang, Hawking <Ha=
wking.Zhang@amd.com>; Ma, Le <Le.Ma@amd.com>; Lazar, Lijo <Lijo.Lazar@amd.c=
om>; Pan, Xinhui <Xinhui.Pan@amd.com>; airlied@gmail.com; amd-gfx@lists.fre=
edesktop.org; chentao@kylinos.cn; dan.carpenter@linaro.org; daniel@ffwll.ch=
; dri-devel@lists.freedesktop.org; evan.quan@amd.com; kunwu.chan@hotmail.co=
m; linux-kernel@vger.kernel.org
Subject: [PATCH] drm/amd/pm: Fix a memory leak on an error path

Add missing free on an error path.

Fixes: 511a95552ec8 ("drm/amd/pm: Add SMU 13.0.6 support")
Signed-off-by: Kunwu.Chan <chentao@kylinos.cn>
---
 drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_6_ppt.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_6_ppt.c b/drivers=
/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_6_ppt.c
index ce971a93d28b..c26e12ff532c 100644
--- a/drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_6_ppt.c
+++ b/drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_6_ppt.c
@@ -1981,8 +1981,10 @@ static ssize_t smu_v13_0_6_get_gpu_metrics(struct sm=
u_context *smu, void **table

        metrics =3D kzalloc(sizeof(MetricsTable_t), GFP_KERNEL);
        ret =3D smu_v13_0_6_get_metrics_table(smu, metrics, true);
-       if (ret)
+       if (ret) {
+               kfree(metrics);
                return ret;
+       }

        smu_cmn_init_soft_gpu_metrics(gpu_metrics, 1, 3);

--
2.25.1

