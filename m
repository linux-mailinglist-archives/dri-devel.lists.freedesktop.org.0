Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DA26BBA6B7C
	for <lists+dri-devel@lfdr.de>; Sun, 28 Sep 2025 10:37:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F29D010E328;
	Sun, 28 Sep 2025 08:37:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="jsqWU/cK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from MRWPR03CU001.outbound.protection.outlook.com
 (mail-francesouthazon11011058.outbound.protection.outlook.com
 [40.107.130.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D39B10E0E4
 for <dri-devel@lists.freedesktop.org>; Sun, 28 Sep 2025 08:37:02 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=T89jsKapiXLjYZjkgjlNqXDQDsb3+HvJwZbZxNRfMggW4cRPuy+mnheL+MYTEtYkEUFxH4WqWXAA7F9ic3g3RJWWvuTJIjYE0Y6pLng6FI82+PSEK8ySobeZj06QnNaupXsEW/XpB5L1U/39jzX54MAKZvHkIP9Mw8K14snRST5iA0tfqrUuyhRmPoUHgmaVotwdEr89Av6/R5GA9kBmBlr56ZiKFXmHiyzoGpFBKwWRDKiQRWxqBG63t1vnkcJPY29OYBi9eWUqwWM2qZGg1F9MPWW8vc8OhgNo7Wz+JS5hcbYCuA9dOpUMnttQfj5ZtwPQ5OUzsCwNpeGZq+HMrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vxtwNTtwWNdhF+2uh4z3XzPow9KzMlnLaYn/K4l8rCo=;
 b=ehsDQTCV5+ky8Ki3l0DkfubW2mqAY1eDfavGLiHX2y+9wcQldu2HNROgl1ZTev7mxZG0nczepeVZvXf5hJeJlfOSLwIj6OdI9TrAMXDyMJnK6e81X2MLxEETle7/Dub8E5ByDkebK55hTRZqZWpkVU9tGwY+GBJz52XiiGw0EMl4iRoXDf/b86sXDTvfDA+MwpuonyQEuuV2kk7IgPJWQotLsi9/22U6f/XaMgNkrqFgyFTAS9R112ZXyiSBH2NMZsGaO+UgiNVm43XKUDcIRq7zK0kNg1AiUCcHM387F2wF0BlUnXjDPVOJ6nC2ngprmBzTMs/sgP68U5/WBLkq2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com; 
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vxtwNTtwWNdhF+2uh4z3XzPow9KzMlnLaYn/K4l8rCo=;
 b=jsqWU/cKBDbTYEqKR3CHlDtMaOKz4FZUCrQxFmhky0Pc5OaCF5Gk+XwqdVgnaDuXWd3nIgDKHXbvfeZrfGTwXbRPxS3Yd4/2l129Pdcae71BVqsX0axlVQ0jEjUF09oBVrvBxbkuDQYp/HVIhHBVKUwm/Rw/ugVg8xyFhyg0YEwqf/W1egaysQzO5H/aHpqTeizb9L2SwPCzb6Mt2oSDmq4lOEpVyX5mpO1kvryqXT2N5i/fdztv/xGdLS8eEYYAE/PTx9ll1q+gcjva0OCGekEJ2e0wjatFchQeYQ3MerEijV3iEfMnna8jJONnRJuQfGD38wIbdxgPpWeM8/6scA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AS4PR04MB9624.eurprd04.prod.outlook.com (2603:10a6:20b:4ce::9)
 by PA4PR04MB9269.eurprd04.prod.outlook.com (2603:10a6:102:2a4::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.15; Sun, 28 Sep
 2025 08:36:56 +0000
Received: from AS4PR04MB9624.eurprd04.prod.outlook.com
 ([fe80::fa4e:dc6f:3f71:13b7]) by AS4PR04MB9624.eurprd04.prod.outlook.com
 ([fe80::fa4e:dc6f:3f71:13b7%4]) with mapi id 15.20.9160.013; Sun, 28 Sep 2025
 08:36:56 +0000
Date: Sun, 28 Sep 2025 16:36:59 +0800
From: Rain Yang <jiyu.yang@oss.nxp.com>
To: Boris Brezillon <boris.brezillon@collabora.com>
Cc: airlied@gmail.co, dri-devel@lists.freedesktop.org, imx@lists.linux.dev,
 jiyu.yang@oss.nxp.com, linux-kernel@vger.kernel.org,
 liviu.dudau@arm.com, maarten.lankhorst@linux.intel.com,
 marek.vasut@mailbox.org, mripard@kernel.org, simona@ffwll.ch,
 steven.price@arm.com, tzimmermann@suse.de
Subject: Re: [PATCH v1] drm/panthor: skip regulator setup if no such prop
Message-ID: <aNjzq_i0RLfovUGT@oss.nxp.com>
References: <20250926090722.23097-1-jiyu.yang@oss.nxp.com>
 <20250926120311.33dc9fb1@fedora>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250926120311.33dc9fb1@fedora>
X-ClientProxiedBy: SI2PR02CA0008.apcprd02.prod.outlook.com
 (2603:1096:4:194::12) To AS4PR04MB9624.eurprd04.prod.outlook.com
 (2603:10a6:20b:4ce::9)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR04MB9624:EE_|PA4PR04MB9269:EE_
X-MS-Office365-Filtering-Correlation-Id: 66ca4f41-5062-4389-256c-08ddfe6a2edf
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|19092799006|7416014|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?onxPZACw/I6S7tm+STfSTKLF8agBI8X0qo8TJuSTHZCFx6h6yaxmjqAmMzLA?=
 =?us-ascii?Q?87YJM0UVFtHOFBmS5kdSJPB9QMDJRy7rkuFNb7oRq5yWj2xfkOBDeOtdIUqt?=
 =?us-ascii?Q?+sDmgV814leWqmR5FKESuuOxkv+PuL2eTIToE72rHYdkBCiD28lFL78G2EOm?=
 =?us-ascii?Q?LimsgA7U0YbuOTjVQigwYx5KZLSZExw9DT/YLrbQbyQ6thzUwhK2QhbpSKAm?=
 =?us-ascii?Q?wP8fwhhyCUNqrxqD5Cy/wg0dRCBMejJiDlNa8QFrvtwwstbWQ5XlYTysSXNJ?=
 =?us-ascii?Q?G5mP9tYAnqWm0/L5LX5XuqEE9LytkMg3nG2ekFEY401uZOJ2/Bcvuc0K0Jse?=
 =?us-ascii?Q?BNtHdIjDI8HP5NXVQyFtAJlFBzbvJyhsc8fSNbZFp47TC/YfMHc5i+mpBPnS?=
 =?us-ascii?Q?BfrCF7JjA7N0w8vATDP2IbzxHM+WnTfVbX868mc8vJPo+W/KDZYx7F4HuxAb?=
 =?us-ascii?Q?2ncIOJjijxjOr7xZP3eSgOcXBI9L3fpX5vzqEVn+43k4+AHvKf2qsJjKbyh5?=
 =?us-ascii?Q?YTsvN+2pwWKFPOZsueqd+hCqAb1G4NFlHp8xj6KUj/MmfdMNyLgHnB60qzmr?=
 =?us-ascii?Q?FQz0ZxlCar4zitR/QpFKaEvV6UQhtL7VHGEI82xtYZpmrC1llzvVELghoEKp?=
 =?us-ascii?Q?QMw+PTyjQPoftqVQDfKFVvu0ugdF2sR+QyKB4QAr0HF6wYxhvNOb21b41wYh?=
 =?us-ascii?Q?ge6/5h+l0XTf0xckGczxBrZm1ei094mb2kYF9JACb90pv7zuZ2hw3o3hM6KG?=
 =?us-ascii?Q?YOUuj9GBT2TH475qyHRQ1+PYcjfLmYZxFVLWzBFVEl9XobvTvLTO7lQWK/QJ?=
 =?us-ascii?Q?UMEGXLnOzsVxduu0Pd6DKtZSt6vEO+HNN4GHaqm2JO/SqWrT9+DPoiu/T1yu?=
 =?us-ascii?Q?6y2TQp/65tKDhXui2hp8XIK+QmF5VdEJaq6N/Vg6cKvH+gmb2wG5lmnX/qA/?=
 =?us-ascii?Q?U/W9icbUUjendVSmuiGX5x+LyJGnkANq29CXJUgdgT7CtJP5AZXfVOBjOc0P?=
 =?us-ascii?Q?jRv53cTg0ErpkJUKIMXmfkQGFeaE/RlyOO7hpxYJ1t0lXxk8ZlaeWlDbpFBA?=
 =?us-ascii?Q?f2I4vRaFO+fz5iL6KC+JZaHMFyLICJBZgM8oWbC5OGvo0s7UaSSY4bdYh4i8?=
 =?us-ascii?Q?4Cv5ae5GNFYsMbhV0luADPsGJ+ZiBW4AmiqWBWKHp2I/qntDAvSvl/O0plqC?=
 =?us-ascii?Q?eRk54keWD+pTAGTXot6uxiD96g+PACF5oN9nCQUeQYmLfhicYkL8jvGF5aUe?=
 =?us-ascii?Q?wwZLEyUuto52W+niU2nR/LiiHHwqJAH/2lfI/1gvVgBT2QOTWAxaud8h+Pij?=
 =?us-ascii?Q?C7Y05imrfY7MGVLldDuBXW8Fng+O/X2T6tRvokp7NoX/R0Z/NLTN9jY1RLmT?=
 =?us-ascii?Q?S75/oh3APlqmf5AOEeExERVbazjBOQRSdc4ZOxyffsDhdxmtaruR/vi/JMzD?=
 =?us-ascii?Q?DzRD86SPfiC5Sk5tGK9ORO/Ci2SgHh+tJtOdu5W0LcRkqry4CpRrqu3NeqIe?=
 =?us-ascii?Q?NS2UY6aQaWXJvVfc1oR/w1q13SRDqyQIA+vO?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AS4PR04MB9624.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(19092799006)(7416014)(376014)(52116014)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?HvLmHz4eQyLAVcTthNVlBFDb9bs33jrVvI7HW6PEml01Vz2KK6wE+nv58p0h?=
 =?us-ascii?Q?z127SVKoG/O/ZcZ6AnO3NJKbqYUm9H+OXfFnLOQ4ZxEjHrPQriintm92AluO?=
 =?us-ascii?Q?f7HyQaOUZ+10grgf15yCLWvZBLzJ5uNsbslVmtZzrMHFbx43uKwMgVyODuom?=
 =?us-ascii?Q?LN6bgfWNrLkWlkzAhNJYeoBJkf9HQJXDmjQ6ObEzw9PqamTHGTupGKZacf//?=
 =?us-ascii?Q?VR1emOKTHptXC5YfnUogW0sgKdc1izkNMl4tBBvdGGtb1MhH2q+NShhertLU?=
 =?us-ascii?Q?ugUi6X6vsRRbkp5p0PgsIxysfxp5ZVFXw8CrFhWHq7lClmeh18TIb1+J9vRn?=
 =?us-ascii?Q?YPo0VBUGnydDyb7x4m7zV2DeW6edlQAUQUwQjRTriXXCBJmYVtvYrPJzvDQX?=
 =?us-ascii?Q?n0xlBTwkXxhQuNLWe8P6h55u2LkKfxIq960Z7E5LtWN3ONvTwaxhmQmGa8wH?=
 =?us-ascii?Q?XNeTtGji3ZfR29hvGdX5+TX7YlwsbW2L5d2advOQCG1HG7tZpd1BgzMaQTPQ?=
 =?us-ascii?Q?y8ENofjeaqBwkYdVXqCC6W3A+F6aEZ2Cc4IMWuFNqMEI9Kl2lGakXylATqzr?=
 =?us-ascii?Q?5gI9kyWhf4e7LjdDwDgNEcDggAdRasM0DwcVUwFTTAmFi2frqUDATKlfZxVY?=
 =?us-ascii?Q?cVKE6iqD/UOwVzl3io/YVjecXAUQP1mUw4avmNrsE8nmXQz6pY+65vpIBX6r?=
 =?us-ascii?Q?0RZpLj9H6ier1LWEDJo8BSzvekmLFbVE0ywFuifxI7UXrm4NZegCmwAQZIBy?=
 =?us-ascii?Q?dgm08pnIR9HZ5B/s88jbTiM5vnbCd3OpWTv7deXruG6WcHvKTivEBOkmNYxj?=
 =?us-ascii?Q?Gp1RIZBYxofinXeaGZTdq1N7pvSnKnCeBjOfvOhtIu5rouhOEmEqj2KFiuwX?=
 =?us-ascii?Q?1ozjwuxrxHF6qOQRQmkyk81u+TTxSnPUc+pLofPypTwDkbavUUlD13zDEiSL?=
 =?us-ascii?Q?QnfviWWxKM6tkeP5asxHMQxu6dawTBoun5XS4qU2D8eCNFC0zAVWy9drI+zo?=
 =?us-ascii?Q?xGmqQe1qsQyzzXSpwAKbOBOaR7VfSGP98UgvUb1+nZ/Jyt7l5ufL8Dyk+YHu?=
 =?us-ascii?Q?W+rIIJW+2qyWufq/fz7b+XYJnMCXqm0l1xsFxm0i32lXtiI6zrDMc8jZtAKW?=
 =?us-ascii?Q?kPpPLa2bZA17rVpT4T9w0yQlUs+ysBOVi5j6wqxnE2TNka8bOt+ESPH7HCxc?=
 =?us-ascii?Q?Ygwujo6Ty7HrfU2kz7tKbikL8mRAb83WAzQGILOeh1NspArq3hQe5sLkR7Co?=
 =?us-ascii?Q?mUV6PEC0eKmksePbORl2oJTVK2DlHedhjrGMP2thmGVUVHr/R6nRzAfE4/Ou?=
 =?us-ascii?Q?5yaBTD/fxe34XGOldjXynLh0OvTJtRXUY0zFnPUSdt7ZFO4FBmetrnWvjsNK?=
 =?us-ascii?Q?ymKe8F6w0D3mR3JxD3ViHmLcnzcGMSFFBko6KrF+stj0M9YukCtL38WvPOyW?=
 =?us-ascii?Q?dvP6zCqiql6sN4sLuHZ8viQTn6DQA0MIl0gBVI5WzJh2KBwB5EBENv20vlyr?=
 =?us-ascii?Q?KwlnC8THkbe7KrckKpuMleUEiRrVdRryAxXlN3zGXczzchUL6y9+W9Xv5NZk?=
 =?us-ascii?Q?CkkQQu4IiUW0mWx19uhWgGimkNqzifXVF1P5/KDk?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 66ca4f41-5062-4389-256c-08ddfe6a2edf
X-MS-Exchange-CrossTenant-AuthSource: AS4PR04MB9624.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2025 08:36:56.4295 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: awyD2QgCziUIcuAGuXQpJwrqmIW5x7W4v+WQnyGRKhMKWNoSt5XdMDyzI9ZZXQnghKSblsLR/RktOh5Tdhf8Jg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB9269
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

On Fri, Sep 26, 2025 at 12:03:11PM +0200, Boris Brezillon wrote:
>On Fri, 26 Sep 2025 17:07:22 +0800
>Rain Yang <jiyu.yang@oss.nxp.com> wrote:
>
>> From: Rain Yang <jiyu.yang@nxp.com>
>> 
>> The regulator is optional, skip the setup instead of returning an
>> error if it is not present
>
>AFAICT, it's not flagged optional in the DT bindings yet, so I'd prefer
>to have this change and the DT bindings update in the same patch series
>(both will go through the drm-misc tree anway).
>

thanks, Boris.
I will create a patch in dt-binding to make mali-supply required only applied to to rk3588

>> 
>> Signed-off-by: Rain Yang <jiyu.yang@nxp.com>
>> ---
>>  drivers/gpu/drm/panthor/panthor_devfreq.c | 3 +--
>>  1 file changed, 1 insertion(+), 2 deletions(-)
>> 
>> diff --git a/drivers/gpu/drm/panthor/panthor_devfreq.c b/drivers/gpu/drm/panthor/panthor_devfreq.c
>> index 3686515d368d..2df1d76d84a0 100644
>> --- a/drivers/gpu/drm/panthor/panthor_devfreq.c
>> +++ b/drivers/gpu/drm/panthor/panthor_devfreq.c
>> @@ -146,10 +146,9 @@ int panthor_devfreq_init(struct panthor_device *ptdev)
>>  	ptdev->devfreq = pdevfreq;
>>  
>>  	ret = devm_pm_opp_set_regulators(dev, reg_names);
>> -	if (ret) {
>> +	if (ret && ret != -ENODEV) {
>>  		if (ret != -EPROBE_DEFER)
>>  			DRM_DEV_ERROR(dev, "Couldn't set OPP regulators\n");
>> -
>>  		return ret;
>>  	}
>>  
>
