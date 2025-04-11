Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D05EA85619
	for <lists+dri-devel@lfdr.de>; Fri, 11 Apr 2025 10:04:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C20FF10E252;
	Fri, 11 Apr 2025 08:04:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="BhIYLKcp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on2057.outbound.protection.outlook.com [40.107.101.57])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 19BC810E252;
 Fri, 11 Apr 2025 08:04:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tOMgwmS5ytpStbO8cTrt4wytlqYVKEwTJZpyOzGfsoZ7QWyMxa5kbzZkKwqcDYwbGsVOq99LH+zAW1+6uO5rjG3pIGQA53HWuXX7jb4LTFP2r+YcIRLPHf8BiF8mjkND/FLh1zPHUEkGF/Nf3Cozk+JR8z9BZAXqspedCPzrGurtV5xGlfrUew3Ml/yG/Z9W0wzeZhtAxp0x7A6kFQRGlKEISiB+W966aTgutAvRWgkO8LN/FTPmdt/1s9lVnf0l9QHqIHTJJDH3J1jX9TfZFGP0z0D/Psufh6Q4+y2lpw5oL2dbGW25CTKx5Hyn9kQQPOt1onxes+uU31UFu4u49g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t8/hr4zhMw6pXDcUfAnOnuh9HTJkO9ZwKikLFyjWQRI=;
 b=ZwHtNlYBkIKqBy6i8u5HxhcyzC3KkZY6OsB9OBjojHI6l1oK5iSEaIrEQ+d8Tz/fvPCOpzKTZ662/XqDvFpb31b/k+j6GzRRf4Zop1UAb2ikAwwHYBzDFrUqFNQHYw5lUpTPA/uTxXL5O/o0jP97VIEARovxnu3912GtUySJ7XRzCj5u8jKc3gWc1WYvP4YqkaPbrCwLCzYvf9Wnu8pw+xdZvGwEqtVjpDOBFMyXIz+ZkF9PN7Vb0hA9KqiWvkhRPSUOAlK2z+tU+J/ca44w010KPKUusVTij+wf4EZgXnxRFcaf3V4MbAkX28KHcNsAOIUTC9bHO8Or5PH/PwW/Fw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t8/hr4zhMw6pXDcUfAnOnuh9HTJkO9ZwKikLFyjWQRI=;
 b=BhIYLKcpE1Ks4mQ4kO0FB6d4THjvVukINxuk3donPtQvyqAbpYLqzxHeJFcFL61H+v1tab0eA9Af2ap2+V9tplEtyCv7r94XmNsoCz9xvF4rlci9ajUdv4kFh9PbGJ0m1OPYyr2U+9FgZTPT2NBhUBd+WYJz5yfjU5pk4cQ9o6k=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by MW4PR12MB7117.namprd12.prod.outlook.com (2603:10b6:303:221::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.25; Fri, 11 Apr
 2025 08:04:13 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%5]) with mapi id 15.20.8632.021; Fri, 11 Apr 2025
 08:04:13 +0000
Message-ID: <4d47cb90-8ed4-4a69-bd91-b90ebd2c9aca@amd.com>
Date: Fri, 11 Apr 2025 10:04:07 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/8] drm: Introduce sparse GEM shmem
To: Boris Brezillon <boris.brezillon@collabora.com>,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>
Cc: Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 =?UTF-8?Q?Adri=C3=A1n_Larumbe?= <adrian.larumbe@collabora.com>,
 lima@lists.freedesktop.org, Qiang Yu <yuq825@gmail.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 dri-devel@lists.freedesktop.org,
 Dmitry Osipenko <dmitry.osipenko@collabora.com>, kernel@collabora.com,
 Faith Ekstrand <faith.ekstrand@collabora.com>
References: <20250404092634.2968115-1-boris.brezillon@collabora.com>
 <20250410164809.21109cbc@collabora.com>
 <d4ebcb9f-ca1e-40ae-bc3c-613f88552b94@amd.com>
 <20250410175349.6bf6a4ea@collabora.com>
 <d0ab2ffe-77ee-4bda-b127-8648acb71409@amd.com>
 <20250410192054.24a592a5@collabora.com> <Z_gHX5AqQkhbXOjd@blossom>
 <20250410204155.55d5cfc7@collabora.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20250410204155.55d5cfc7@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0324.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:eb::14) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|MW4PR12MB7117:EE_
X-MS-Office365-Filtering-Correlation-Id: 07730712-83b0-4714-8ef6-08dd78cf7281
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Yk05YTBpOTU3cEFiTnBmU2VqWDR2V28xNU5DNlVURlNwWC91YWNST3AwdUJl?=
 =?utf-8?B?cHdqckFyM3MwQUdySTFKVXl4NE9CZ2tURmRRbHdJdzBQbHRhdmdnUnFUSjd5?=
 =?utf-8?B?dGtRMFFNQjhibFhXNTVIdWlLVFV2VlFqamd1TEZ3UXQ0WjJ4Ry8vdlp3ZEIz?=
 =?utf-8?B?TVBpVnAzUEJJZExqbnB4eGNwaWdIUmhhajB6ZnNFWnBzZEdmT3ZmL21rYjU5?=
 =?utf-8?B?VmFQeE5OQmZkUDNNaU1wTFN2UXRRUG1IMnRqSnNZbHlDQVlMS2dmVFFiSHRa?=
 =?utf-8?B?Mm1SWWFqamdhSnRQQ3QvTUJBbTh6cnkzMnE4cHRCRGYyT2k0MHVlUHN6WkVM?=
 =?utf-8?B?MzJyS1dYZUVOclRxTElrdEJhaHVxVDE3b3dzeWd1b1pwTnBjZGFSSjc5RnBQ?=
 =?utf-8?B?ZzlUUFNuZzlFYTFORDlNbDFHVWM5Vk1YTDhFV01md0RZaXlQb1RPTXc1R0xM?=
 =?utf-8?B?dDhUVlkvTjBlR2F3RGZGR2dULzZ6dHZoRGp3cTNwZG10dENVakJuSVpOZVEw?=
 =?utf-8?B?dkwwY0ZGSDZnbDF1alNKSTVqSitxUWwwVHp1blRyWEFkc2tTQUJRUmhrRGxh?=
 =?utf-8?B?MVkyazZHcGFuVStIRWJNQXlKNDZHek83ZFJZaWhCZEF2cUs1Z1NBcGNWWHQ3?=
 =?utf-8?B?UFg5eS9iOHFibDRwZ1RwN1ZGaG5vZjZmaklVaDZwT2syQ1A3OTNzNDZJeHFa?=
 =?utf-8?B?WFphTWFSQ1J0SzgwT3lrR0pEcWsvTVhWaFU4T0lPWUkvUzRvZDdxdEp4dTcz?=
 =?utf-8?B?Y2dHTGRjNm8yQUg2N2R6UUNUV1F4QnhCR0l5cUJmWS96ZVV2VVhDUzcrQ0JO?=
 =?utf-8?B?ZVN2WDRrOWZlU3hoRzlQaEsyajJpaDdROWZZZDBmVjJ1bm43UFZSZGh1SXpE?=
 =?utf-8?B?ZU5ZT3RISEppTTBtbENsUUhNUHlSdG1YT1pLNnJPTHMxSys3V01yR09pL2tU?=
 =?utf-8?B?Ui9rYXp1a0pNWlNrOVpzbFlERS9JZm12OFZxTmNuWC8wYXpybE5zWHFobHY4?=
 =?utf-8?B?WUl5UzhraHFiUERGV3BxaHdjM0F2R0Vubzk4NitMWngrNDVGTmVkNFIvZklL?=
 =?utf-8?B?NkhGRGNwazhwakU4Y2JVbEFlZWl4TFR2VkZPMTEycnJmNVlENU9Mdi8yalBk?=
 =?utf-8?B?WmljNTFZYmtLcVhhMVh5WHVpMSthT1ZUaFlYbE5xU1JUcVcwUkw3cGhEYld1?=
 =?utf-8?B?Qk1QRk9UNEc4Uk5pMjhiL0w3RFFvQi9iQkQvNkx5ckdKcW5WNXNBemdZb3FJ?=
 =?utf-8?B?VHJmYlEzSHVjUDBIVGZHZGFsMEx0ODFYaWNlMnFuMU42T1kvUlFBZkgxR3NE?=
 =?utf-8?B?Z29jNlozMk55TXRPWjFvUm9YTjdPZmdxS2lQN00xRGp1MHNsMVRXcXZ3Z2JZ?=
 =?utf-8?B?UFhYOXB2UVdrZ2xWQjRNQ3lxZzMzTThNSXUwWFN0Ky9uU0RERkZqZi96dXY1?=
 =?utf-8?B?QTdIMDY2eHhBRDVZN1lUTms4dDVEclpaaXhSMmo0QzRPTkhGT2thd3ErVHBk?=
 =?utf-8?B?d1Jvd2hUOFpiVTVWZ0VCem1Hb1JETUd6SU9nTmxBVUIyZGtEQ1FHb0pmVy9z?=
 =?utf-8?B?Vk4rWm9JQTEybjNNSDlqK3R6cTZqWUFMZVNYd2JJTG5COHB4bEEzenRIa0xt?=
 =?utf-8?B?SE4xT2hEVzM5ZWNyOVVRczF2MzdZZzVmMmNiaytSSU5GNmJKNnlrTksvQ2pp?=
 =?utf-8?B?OUN2UTFBTWZYVnUxWGVkcnVZZEJDVzkvdVljeHgvQVI5UTdwUUN3VTYwbEUx?=
 =?utf-8?B?NnBJNzJ6dmNTSjlrS1RrTVJMdFJaNHd6RXhnV0JjaXk2L0lhMzRybUk1SHRJ?=
 =?utf-8?B?dytzbVFOenFROGo5RThOYlRvWUw1Y0N4dUVkbUtsVks5c2FpNG9vbkVYWVlJ?=
 =?utf-8?B?YkJaOTdWZjRCWWJ5TlRFNVE5SXlkMzA4bEs1Nk1EejhCVksrNm9tZWtaa1hX?=
 =?utf-8?Q?mfmVug6ZMWA=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(7416014)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?T0hNNTI2NmJTWXBqMDUyN2s4cWRWMVdlTFBPQXk3LzlDcEdYZURPaTJFK3BP?=
 =?utf-8?B?Ykdid3pIV3hOQndFMW9lNjJtMmd0WEhiQmtDSzVJRjBaWUtubHJ5VUE0eHVB?=
 =?utf-8?B?Q0M1OGphbWtWaTFVSUJ1TXVNY2owOFBtT1d5eCtlWnBtUXhkcXlxZHl4TkMy?=
 =?utf-8?B?ZWdqMlFpRTlFcE4zNEowNWovNE5xTDhEMUJSUmJLc1NjZXpsamIxMHNZTlRU?=
 =?utf-8?B?Skd5aXNVTE92NVZUandXRk1JZ0RSNUNhV2FpcUNaM2ZIQVRxOHVSQm5BS1py?=
 =?utf-8?B?MzV0ekJKUHFrQS8vNlRMbzdoRzFLY1p4NFJ6OC8rZzBneCt1Y1dXY2dyWVRC?=
 =?utf-8?B?ZmlaSFZmSXhpa0hRb2RJb3VZTUZjQTRvMjlONlB5Ris1MWdDRUprb3hGM2Z6?=
 =?utf-8?B?d2ZUVkxnRC9TTHJTVStwWHRwdXpHNzdEa1R3SStEeld2eVdwQzZiWVFJM0hI?=
 =?utf-8?B?UE1kT0xxUm40NEtNUHZnTHQwVEdXd3JGbVFCNnM5bElCTVdHQlFGbXRyWHJX?=
 =?utf-8?B?N3Vxd2VobzQ4cXVCMG1qZ0FOcGdFSDNUSERtTGdTNEhGcllDbTljSzRpeWN1?=
 =?utf-8?B?Yk92ZWlIelRqb0N3Zk10c01PUWxWL01kSXVobzJHenkwMHdhWDhvTHZtMnBp?=
 =?utf-8?B?M1ROQmtvby85b05OdjNvUmdEbXBiMXpzdjJibWtzcFQ3Vy9EQzhTSTFxSllX?=
 =?utf-8?B?akZTS2F6aytueGgxWG41N0QyZm14U2E4RjlVN0UrM2JzZ3FlRlRmV2hOZk5Y?=
 =?utf-8?B?SEI4eGNkZlZHKzMwVDZMU0VKL3lJNXBHcGgxeXFqVlV5Q29EUGtNd3Y4U2RD?=
 =?utf-8?B?ZU9lT3RKYmQ4cTBlM1BaWU1ZR2dIRlFwWVY2L3NpYlA4Y2ljaEtQbkNuY2o4?=
 =?utf-8?B?bGgzRCs3cDJlSStvU3FHVzV2ZnVMc3BTa01CT1dNNUpONWJvZm5iTHlqbGx4?=
 =?utf-8?B?cGw0ZnlyTEN3THZGUlUvVXVJYjF2STJkeVd6WHozRkhhb1VIcVV4VThQVElJ?=
 =?utf-8?B?dUdHQVpiVW9hTVh4OWI0NzBQRHdvMDRwNDF4WUZRd0tXWU83WlBJV0VaWjJU?=
 =?utf-8?B?RjdGY2Y1eXY4U0pHUVZ1UWFBb2hLK211VzRsQ2IwMTNvVE92NDcrRTVGdkJt?=
 =?utf-8?B?WHdTcVR3VWI5M2xOeWtrZ3JKNGthb1NMdmF2bDRyQkE0aGdJeCtJSThldXZm?=
 =?utf-8?B?RnV5R1RmQnQ1SDlKamp3OHl4Y2RpZFpWNXJ2NWk0YUNyOEwvM1pXRHNlelND?=
 =?utf-8?B?cDVYSmxnUDJxLzhGWUluMXVpcDFyZWlQd0E0bjRXNGZtQnZkd2F4aGt0Und4?=
 =?utf-8?B?R2o3UnZMZnJ0eTR0V2szLzhyeW1ucU5MMVQ4dHdzc2FXSHNuNXdVNCtYMW1C?=
 =?utf-8?B?KzRaMkdnN1ZQTlZMYUl5RVhJWFRiU1pQTG1LbVdTWGkxSXNhWFZKaERtRjNJ?=
 =?utf-8?B?Rm9TaVoza3Y3c1grU1dka3FsWXlkd3R2dFdTNGpCb1VZNEdLTHJlSjRRb2hW?=
 =?utf-8?B?OWI5Rk5uYW1Hd3h5Si95SzROWGtCeHNkNnVKQUE2UlRWUE5Qc05qdHZ2aGZR?=
 =?utf-8?B?T1lhenJTdzRtNUYwZEJocUMzcFlmWHZSR21IZENHK2xQVCtIc2pyaUhLbDRq?=
 =?utf-8?B?WDI3Y1dSaVEzRDRPeDBWM0xmNHRNSFJsa25ud3pmdVBKSUwrWmZoTW41TkhU?=
 =?utf-8?B?ZWNBWUx5d2IwY0hrbGtKamUvQUJvYlhsTG0zOVE5eVR1OWFzUFJUcy94RUUw?=
 =?utf-8?B?a3VwR3V5cHBGOXlHcXJCSjhWZ3BIS0hKcW4wMnp2VjluK0FobTRsTmZkemU1?=
 =?utf-8?B?SnlnSy94R1oxZ1M1bDdDa1RyNHpZTzlsYlNmMDN6Qkx4TnhHNlJNcGNJZHUy?=
 =?utf-8?B?YTYzZmd2TzAzeGF4QXA0K0JNWk0yOHhvVkhPNXA4S1JNMmhXSGRWNU9WclJr?=
 =?utf-8?B?WWo1aDVNR1JqM3RSRUVwMUtERERpbVpwZCtpRlluVk1NTWVpMnhkemJqZmtD?=
 =?utf-8?B?LzE2aWhCeDJYMXJwTzEwUFJRTUhWTlpycktqaVFrdkt5amZ1S2RlQnZtbFVh?=
 =?utf-8?B?d0IwcGV6c016dGFyZjR3VzkwaWdlT211UnpKbVVYM1hHZVB1ZURzNTFLVkht?=
 =?utf-8?Q?5fgnn50RCcSNH/BI1/sgiT+d7?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 07730712-83b0-4714-8ef6-08dd78cf7281
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Apr 2025 08:04:13.2574 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1/IiRueU8HrZilao5ON7jrOxjDCqIdml1/oAigp/hoadGRMQKdqUF3A8efZ/YIfo
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7117
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

Am 10.04.25 um 20:41 schrieb Boris Brezillon:
> On Thu, 10 Apr 2025 14:01:03 -0400
> Alyssa Rosenzweig <alyssa@rosenzweig.io> wrote:
>
>>>>> In Panfrost and Lima, we don't have this concept of "incremental
>>>>> rendering", so when we fail the allocation, we just fail the GPU job
>>>>> with an unhandled GPU fault.    
>>>> To be honest I think that this is enough to mark those two drivers as
>>>> broken.  It's documented that this approach is a no-go for upstream
>>>> drivers.
>>>>
>>>> How widely is that used?  
>>> It exists in lima and panfrost, and I wouldn't be surprised if a similar
>>> mechanism was used in other drivers for tiler-based GPUs (etnaviv,
>>> freedreno, powervr, ...), because ultimately that's how tilers work:
>>> the amount of memory needed to store per-tile primitives (and metadata)
>>> depends on what the geometry pipeline feeds the tiler with, and that
>>> can't be predicted. If you over-provision, that's memory the system won't
>>> be able to use while rendering takes place, even though only a small
>>> portion might actually be used by the GPU. If your allocation is too
>>> small, it will either trigger a GPU fault (for HW not supporting an
>>> "incremental rendering" mode) or under-perform (because flushing
>>> primitives has a huge cost on tilers).  
>> Yes and no.
>>
>> Although we can't allocate more memory for /this/ frame, we know the
>> required size is probably constant across its lifetime. That gives a
>> simple heuristic to manage the tiler heap efficiently without
>> allocations - even fallible ones - in the fence signal path:
>>
>> * Start with a small fixed size tiler heap
>> * Try to render, let incremental rendering kick in when it's too small.
>> * When cleaning up the job, check if we used incremental rendering.
>> * If we did - double the size of the heap the next time we submit work.
>>
>> The tiler heap still grows dynamically - it just does so over the span
>> of a couple frames. In practice that means a tiny hit to startup time as
>> we dynamically figure out the right size, incurring extra flushing at
>> the start, without needing any "grow-on-page-fault" heroics.
>>
>> This should solve the problem completely for CSF/panthor. So it's only
>> hardware that architecturally cannot do incremental rendering (older
>> Mali: panfrost/lima) where we need this mess.
> OTOH, if we need something
> for Utgard(Lima)/Midgard/Bifrost/Valhall(Panfrost), why not use the same
> thing for CSF, since CSF is arguably the sanest of all the HW
> architectures listed above: allocation can fail/be non-blocking,
> because there's a fallback to incremental rendering when it fails.

Yeah that is a rather interesting point Alyssa noted here.

So basically you could as well implement it like this:
1. Userspace makes a submission.
2. HW finds buffer is not large enough, sets and error code and completes submission.
3. Userspace detects error, re-allocates buffer with increased size.
4. Userspace re-submits to incremental complete the submission.
5. Eventually repeat until fully completed.

That would work but is likely just not the most performant solution. So faulting in memory on demand is basically just an optimization and that is ok as far as I can see.

That is then a rather good justification for your work Boris. Because a common component makes it possible to implement a common fault injection functionality to make sure that the fallback path is properly exercised in testing.

Regards,
Christian.
