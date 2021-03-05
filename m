Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2693432E055
	for <lists+dri-devel@lfdr.de>; Fri,  5 Mar 2021 05:02:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 342E66EACB;
	Fri,  5 Mar 2021 04:02:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-CY1-obe.outbound.protection.outlook.com
 (mail-eopbgr760085.outbound.protection.outlook.com [40.107.76.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4EDAD6EACB;
 Fri,  5 Mar 2021 04:02:51 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CiTnsIhMIUQ0MHWLbNCw/rLcjXgE+nFx/c8kAKkFSoYFFmBX43f35tOhk3M6wWY7TVVJtjcEXffAjmZIyEPFPeo6kQtSaHaz9GmDnxUL/z6q4Sy8FAN2aQ1Eapdl7RYuR8HW2bH5KWaHms7pExDxYfftvLq6Vie02sM9TgRCD0FVvlOnxz+RCpqCdMUSEE+HSWJ/J45GH+OatH+sIoWsenU+5RaTrypMVTWZYXKttzvt37tweNWUHCCm7BZCJSeu6YgcFj1unu5+xVsFlapC6dFKKAnx+rMD5y34Ot6c+6W9hTgIIPpdkDg+h+FwHMxrYdpBz+X4Y62CSPXYATiGvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KSJgwgh3f/FfDAFeJVLuET7litMQBoWm0aRpNo1FqxY=;
 b=DVqtYwV0CJqK08EqFeZ9D0kN15OCf4ZQV/Y4Zx912qOQHrOMbp31cgtzm5H8hwHGfQCGsMK4k2EwIp8mrMNx/AWjbSNIFKZgSmC49MzKITfYuvQ1l7neMQfXQOYmpEzV/eIODKiFTQ7if2bm6mMWWgNaeQCVGD7IrmmYXaTvdcx9Viz9LXFjxYWny3CDjnhlDYkfdLT9l2/7EGvj8KKgRVwy5h2BamwhM+kVoKuqAhCc/R0DGEkqztTHzUE19HJLl3U5zaZirpa6GkjgXBwpfNmZfbHRYKOBAAY+2ipTSjwoW35yMAWK9PfGADdA4iYh0C4AWC7N2O5vJPIalEhBFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KSJgwgh3f/FfDAFeJVLuET7litMQBoWm0aRpNo1FqxY=;
 b=3hofBiKgmKD6qrCBQGqJZRzk96cIFKE7YL7k3lJAXpgM0iCh1RQeThZMl4mjBazn4JVw9TolgkR8hl3dGa6WbwH+6gXaJ8xtzTaW+XYxv0xOMPj/kpvEyGtzIV5NZ7Bh9IoPrD8iB9vCa5DNLtNNGzdatEWYqGqSajPUAfUDbQw=
Received: from DM6PR12MB2619.namprd12.prod.outlook.com (2603:10b6:5:45::18) by
 DM6PR12MB4372.namprd12.prod.outlook.com (2603:10b6:5:2af::14) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3912.17; Fri, 5 Mar 2021 04:02:49 +0000
Received: from DM6PR12MB2619.namprd12.prod.outlook.com
 ([fe80::11e6:53ff:8e98:31f0]) by DM6PR12MB2619.namprd12.prod.outlook.com
 ([fe80::11e6:53ff:8e98:31f0%3]) with mapi id 15.20.3890.034; Fri, 5 Mar 2021
 04:02:49 +0000
From: "Quan, Evan" <Evan.Quan@amd.com>
To: Jia-Ju Bai <baijiaju1990@gmail.com>, "Deucher, Alexander"
 <Alexander.Deucher@amd.com>, "Koenig, Christian" <Christian.Koenig@amd.com>,
 "airlied@linux.ie" <airlied@linux.ie>, "daniel@ffwll.ch" <daniel@ffwll.ch>,
 "Zhang, Hawking" <Hawking.Zhang@amd.com>, "Wang, Kevin(Yang)"
 <Kevin1.Wang@amd.com>, "Gao, Likun" <Likun.Gao@amd.com>
Subject: RE: [PATCH] gpu: drm: swsmu: fix error return code of
 smu_v11_0_set_allowed_mask()
Thread-Topic: [PATCH] gpu: drm: swsmu: fix error return code of
 smu_v11_0_set_allowed_mask()
Thread-Index: AQHXEXNJvR3M9lgw60GrVkb4BaohFKp0xcng
Date: Fri, 5 Mar 2021 04:02:49 +0000
Message-ID: <DM6PR12MB26198FF9499CD3ADCCF93546E4969@DM6PR12MB2619.namprd12.prod.outlook.com>
References: <20210305035428.6750-1-baijiaju1990@gmail.com>
In-Reply-To: <20210305035428.6750-1-baijiaju1990@gmail.com>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_0d814d60-469d-470c-8cb0-58434e2bf457_Enabled=true;
 MSIP_Label_0d814d60-469d-470c-8cb0-58434e2bf457_SetDate=2021-03-05T04:02:47Z; 
 MSIP_Label_0d814d60-469d-470c-8cb0-58434e2bf457_Method=Privileged;
 MSIP_Label_0d814d60-469d-470c-8cb0-58434e2bf457_Name=Public_0;
 MSIP_Label_0d814d60-469d-470c-8cb0-58434e2bf457_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_0d814d60-469d-470c-8cb0-58434e2bf457_ActionId=40421f04-315a-41c1-95d3-f8793aa4e49e;
 MSIP_Label_0d814d60-469d-470c-8cb0-58434e2bf457_ContentBits=1
authentication-results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=amd.com;
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 3317d69b-8294-434b-f5a2-08d8df8b8af8
x-ms-traffictypediagnostic: DM6PR12MB4372:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM6PR12MB437288E65CAFD99DAA037D9BE4969@DM6PR12MB4372.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:317;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: W/fPQfc7WH5lGy0uWiir8s3YgDcryGDNEmWXW88sQLQXOezoYvhxKn5jomCRAAwJBFXA1ZTgB2dQAHhLeVvJ9EaVLKRPjT1XpR1wJYZADsILDydnPzL6+z4t+UsRnH1u9m91hBg3vlfSjFp8RuQQpJQjxehMKBO0W1cSD0q7YytLalh6E5LPuQ8g3/y7psrOyTjx7L4bGwszW1MApQWjDgxRWX3osJYpUJyCj4KSLbqpid0nZ0Vt3xc+7+gbGeV0KLUkeEvyqPgy26R1fd8OWntikJZq38uChfd6mdrCkfgZjuJGMsOm6aw0HmZZ1N2JYrQUsLv0NcKbmA7zTMkSJ3dfg2tWTqkn7kIWkLW1YuIbpzn+uT+Um7pIJddLf1VacwmrMjrJ89qH52xR9X9nonzW+EgmABgGPGLLuZVIqYrTXNeVxLYWqBfmAC1YWgXqX2Tr2VERpEoO+wTtSfpDvJ4wie/6tUN1JJkVTv+uU6EGy4jqJJWx0wDZ5nDU90VQkrRMp9brG7II+tHfTpdEVGZ3sndUqxNsz3/DDflqPR30nwtvhYZ7YUVJb8Yv8mQg
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB2619.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(366004)(376002)(136003)(396003)(346002)(76116006)(71200400001)(52536014)(110136005)(53546011)(66946007)(66556008)(83380400001)(6506007)(66446008)(5660300002)(4326008)(54906003)(86362001)(66476007)(6636002)(64756008)(7696005)(478600001)(8936002)(2906002)(9686003)(8676002)(55016002)(186003)(921005)(316002)(33656002)(26005);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?LZThGObk92uLLLMANI9E69YTajdL2zUVab5CFme9lJxDq/BFmF4zQAoxlvn2?=
 =?us-ascii?Q?1n1uzl7ys/9MKpXg6GUqoVLQS0RsDablNqCudq2x84ahxvDYXvCbef43yqx/?=
 =?us-ascii?Q?cD4e+v27ltZN7e49ez/BxCay3//EhGSsSB1h/jhvw97OTY8xz11YHnr3tgqN?=
 =?us-ascii?Q?Aehw3i6fl2K2AH2Ku4HE0TwfB5esGRXXqKB5k1jOMKKAn9D6M0btOJNymkLf?=
 =?us-ascii?Q?f53mf4nmdPn46SLNoCzadO8lKKvI/H2848dBLkWlLDBURyZIiycVQ/2KDpXI?=
 =?us-ascii?Q?ih/DqrFvFn9gvZY+hKNbrJacrMZsQEH5n+uTq8UnB6U1xq0JCw8fsiz7ESBk?=
 =?us-ascii?Q?lC1EjXHHfhdIT91rBMRyflRen2NaLlRAfXGmZY5IHxEZVuHYVdl/IyS7p1uz?=
 =?us-ascii?Q?uv3mVgNHVPSh3aGbfHGhP/24MhmncrpRJgJLxDLRh3vE7gV15RXvUJz2HBv9?=
 =?us-ascii?Q?T09Ss+9/W4gf0Ti+c7xsvvsRTWgcXaUODBk7tiYxNtbJw369GsMLmTS969CI?=
 =?us-ascii?Q?WX2Rb/iOwRqpGqfEvd74QuJWVPljlwDGRai8NR4EsTSzTakr2Gz++3dNRsiD?=
 =?us-ascii?Q?I+8PL1K6HvVPkFJ5YOu2i9wF9v92ztAFdMTkCeLVv3Qg4V/C8wB4alVkorBA?=
 =?us-ascii?Q?J9pRN2IfQ9XZyCk2FnWCcS+EYzk8O6jCZmvu6iot8Et5x2aa55qChiDnS4fG?=
 =?us-ascii?Q?GxD+3My4a255nHa31h7D3j4s00WHz/olLJgDA6/wmvZ163B3Xpn5jAh9FIc6?=
 =?us-ascii?Q?aqSCs5fyqupxMaRarIMhaOe9HtqNMWIZYfDuobRl6U/CNGuosdEsTgYGcCBp?=
 =?us-ascii?Q?FBvigb0RT9n50mreNJf5RB+DkiWceni5iD0yhkX/HyTEeZN/HwlRnPADYo6s?=
 =?us-ascii?Q?OVZ52gC87LdT5SPNs4xbS7FHSHM3SrFb8JYSFKxjywEOPOabJa2JQxaLr55j?=
 =?us-ascii?Q?CMi2a+WF8qfEldAXem6eRniT/SBQd/Ojge6sF+bNHLiZUnAk4C5rpMjXp4ks?=
 =?us-ascii?Q?ehgl9vzIyqqC68pLRtnzA3lS0MU6nuVmssHm27/p2gwvwur2PfEcTSWpIehZ?=
 =?us-ascii?Q?7Amjh4wnqS7oQqFGqJAqExXDIxL09dU+rwNFS0tRF10JL5H7DjOgzsA4YmXN?=
 =?us-ascii?Q?pZQmYQi8CZj33e6HpMy1GSJf1k9wkMBO8EpusKNbVIbspZ1ORovWQD5DqI2X?=
 =?us-ascii?Q?ssS1T4YySJsCwc2bJnYXrGzZtjkLFlMQMt8zuB6WquFnfXybJ/ZdjmSnxDpD?=
 =?us-ascii?Q?8t0vZ8eOY/Itrnn9h+CfoXn+bf7zZoCHyar4T5oz09S3VhWKtD5U+Jfk65j1?=
 =?us-ascii?Q?uN0wlP4tdDV5UlLNqs8WUwll?=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB2619.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3317d69b-8294-434b-f5a2-08d8df8b8af8
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Mar 2021 04:02:49.6425 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6pgy/iWr0L0H1YnU+jvcn3C26G77KjLgbbgyjrjzMX4hmjCKOxAf4+ZImHEla03t
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4372
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

[AMD Public Use]

Thanks. Reviewed-by: Evan Quan <evan.quan@amd.com>

-----Original Message-----
From: Jia-Ju Bai <baijiaju1990@gmail.com> 
Sent: Friday, March 5, 2021 11:54 AM
To: Deucher, Alexander <Alexander.Deucher@amd.com>; Koenig, Christian <Christian.Koenig@amd.com>; airlied@linux.ie; daniel@ffwll.ch; Quan, Evan <Evan.Quan@amd.com>; Zhang, Hawking <Hawking.Zhang@amd.com>; Wang, Kevin(Yang) <Kevin1.Wang@amd.com>; Gao, Likun <Likun.Gao@amd.com>
Cc: amd-gfx@lists.freedesktop.org; dri-devel@lists.freedesktop.org; linux-kernel@vger.kernel.org; Jia-Ju Bai <baijiaju1990@gmail.com>
Subject: [PATCH] gpu: drm: swsmu: fix error return code of smu_v11_0_set_allowed_mask()

When bitmap_empty() or feature->feature_num triggers an error, no error return code of smu_v11_0_set_allowed_mask() is assigned.
To fix this bug, ret is assigned with -EINVAL as error return code.

Reported-by: TOTE Robot <oslab@tsinghua.edu.cn>
Signed-off-by: Jia-Ju Bai <baijiaju1990@gmail.com>
---
 drivers/gpu/drm/amd/pm/swsmu/smu11/smu_v11_0.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/pm/swsmu/smu11/smu_v11_0.c b/drivers/gpu/drm/amd/pm/swsmu/smu11/smu_v11_0.c
index 90585461a56e..82731a932308 100644
--- a/drivers/gpu/drm/amd/pm/swsmu/smu11/smu_v11_0.c
+++ b/drivers/gpu/drm/amd/pm/swsmu/smu11/smu_v11_0.c
@@ -747,8 +747,10 @@ int smu_v11_0_set_allowed_mask(struct smu_context *smu)
 	int ret = 0;
 	uint32_t feature_mask[2];
 
-	if (bitmap_empty(feature->allowed, SMU_FEATURE_MAX) || feature->feature_num < 64)
+	if (bitmap_empty(feature->allowed, SMU_FEATURE_MAX) || feature->feature_num < 64) {
+		ret = -EINVAL;
 		goto failed;
+	}
 
 	bitmap_copy((unsigned long *)feature_mask, feature->allowed, 64);
 
--
2.17.1
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
