Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 18BBFC8DAAB
	for <lists+dri-devel@lfdr.de>; Thu, 27 Nov 2025 11:01:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C4A510E803;
	Thu, 27 Nov 2025 10:01:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="zY+izlJN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BL2PR02CU003.outbound.protection.outlook.com
 (mail-eastusazon11011065.outbound.protection.outlook.com [52.101.52.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 665E910E803;
 Thu, 27 Nov 2025 10:01:18 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=M5HoDC83jtoE52iYCQj3StDzIA8Rca8X+yU4hHuWKrr9wDcBJOf+yslfKiift6k3ldt4MTxeRzgmXWaZi1mn7147JWSvENyQjBP5UTOuIAS6rV2vb5p+Z7rFqHdarcEBvZW0zV8FtgEn3nEIUF98HOUsNKNLMNLRE0cNuqry+3agPiT8zbyQDBokZE0wJISB9XGaBDgqVe5mzswAtqevjqwC+jwrsRnWYc0ViQEiQukZHM5CW3kidOm0eTtQJW6v83k4PcmWiITbQzz9THt8YNZ38dmFVEMFixfO6a+9OZcTZQLrM/q8yw5Zmavd5TGV5fFET89L1Hy0jRi/mWKkzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NQwjV1Re9ZtRXXHVYmkNR9bW/SM8RQB5qre/85stv2g=;
 b=VqcY392+tNoVmzjwYV5HA+yR3FNNFQEiPFSwv1nz8AHLmm4HpGlHAec5/AVgAnMhCj7UpWcDeFK+/wf+4z+PObHodIMvd/GnQQh/J2fw0g9QUW1ARPnTRqSxk/AC2XDxELuxPp37GU6vORIcVSGX329XsL7foAuw2g6+NhDGT46Yq/ZUdpCFaaBqgxYX1xJ+18H1ah7huTVqS+TAPnzqxIYuugqr4IhROXB2AlurmApKV5u6Ux2VJqcGl42k07HO63oRmEAkY/nb7zyKSlPuy/GxWalHD1cMGVrwzzrdrcT3r2Rw0HW1OiP3vetQxwwX1xwTyE79V7v2DaxxS/kkLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NQwjV1Re9ZtRXXHVYmkNR9bW/SM8RQB5qre/85stv2g=;
 b=zY+izlJN4idoai2/jtcHo4cHYtgfMkvKvnt1FmX3Kjq1o2m/wBvDF7ifOSBzHEuoU5gJ5M2xpxEvO4Pz0J4QVh1YnVaMvyApusE6BQfetA2mgt+i8bQpU1lezo2CSlNo+VXbj0C8df0KgzBuzgnuJedwW2YGtIt8zL/8B6DzPHA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by PH8PR12MB6746.namprd12.prod.outlook.com (2603:10b6:510:1c1::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.12; Thu, 27 Nov
 2025 10:01:15 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%4]) with mapi id 15.20.9366.012; Thu, 27 Nov 2025
 10:01:15 +0000
Message-ID: <adfd840e-fcc8-4cdb-8fd8-d0e48ee32247@amd.com>
Date: Thu, 27 Nov 2025 11:01:06 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/6] dma-buf/dma-fence: Add dma_fence_test_signaled_flag()
To: phasta@kernel.org, Matthew Brost <matthew.brost@intel.com>
Cc: Sumit Semwal <sumit.semwal@linaro.org>,
 Gustavo Padovan <gustavo@padovan.org>,
 Felix Kuehling <Felix.Kuehling@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Tvrtko Ursulin
 <tursulin@ursulin.net>, Huang Rui <ray.huang@amd.com>,
 Matthew Auld <matthew.auld@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, rust-for-linux@vger.kernel.org,
 Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
References: <20251126131914.149445-2-phasta@kernel.org>
 <20251126131914.149445-3-phasta@kernel.org>
 <aSctt3QFiEIB61Gr@lstrano-desk.jf.intel.com>
 <aScxGDYeNeN1WYja@lstrano-desk.jf.intel.com>
 <f1864f6d-8403-406d-81a0-00a71495cae8@amd.com>
 <35189892c0cb774155e2012d41371b4d3f8e7d0f.camel@mailbox.org>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <35189892c0cb774155e2012d41371b4d3f8e7d0f.camel@mailbox.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BN9PR03CA0690.namprd03.prod.outlook.com
 (2603:10b6:408:10e::35) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|PH8PR12MB6746:EE_
X-MS-Office365-Filtering-Correlation-Id: 80971376-4574-4c63-b7a9-08de2d9be6dd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|1800799024|366016|376014|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MXZ3aU1hSk9vSy9BckRjay9yKy8vTytRQWJVc3Y4ZWlUcUtBRjZTTFhybWNJ?=
 =?utf-8?B?bE5OSUUyb1pUV0VuVURsR3dUTmNSTFZSZkFmWTJvYVBYZVR4dDhPYWhxY1JK?=
 =?utf-8?B?Ym5mazUwc281NzJRbWZzMnRYZlU3ZXVmdDA1Y1RJSGZGbTNiKzVRRTBRQmgr?=
 =?utf-8?B?cW5aeEpvQjVtVktDWFNUZkgrSnlaRnNOOERXZldnbVBmd3Z1RFc0dy9NTngz?=
 =?utf-8?B?ZU9UWjhRS216QWZXYWkyRkp5aXUxdzhGVkljdkVhNXRPUW1PN3NIMERTa3h6?=
 =?utf-8?B?ZzZ2cVNsRi9DT203clZGWWJodFppUDRQS3ZYOFdHR1Z6TTJvNVh6ckdZOWZP?=
 =?utf-8?B?QkZQU2VxNUIzc1FRUDFLbzNEMEpCaGIyb3NiVk4rUkc2d1dyTTZhVEp2c2Rz?=
 =?utf-8?B?Z0dhSzI3ZUJMSFdSRGFqSm4waEJ0aGxGZUNFMFZ5T2M3TDJPTnVvSEVtYnp5?=
 =?utf-8?B?bnB5VHhlN0xydVhzWHROVzFFUUJhemcwbE1ESEJEYndOZXNOUG1xSVpRK3Ex?=
 =?utf-8?B?MERnbkhGRjdaSWpITllJNHhrZW5ZQ1MwZWp3TDcvaUdwSEZ3bTFGaUtUeldL?=
 =?utf-8?B?a0J3NEJScFdkRFZwOVBNSHQvTGxlM3E1c0VRN1BrL25kQWJtblpqOFYrL3d3?=
 =?utf-8?B?S2VHNmx6ZGYwU3gzcXdjdmJFRFZNVW15dnVRVUJIaFpKaG9hbXc0OHZ4Zm55?=
 =?utf-8?B?dSswMXljTkRCS0NHMWZ1NkFnQXhRN1VTVjZwVWxtMXVESDA5b3dJbTN3TWxH?=
 =?utf-8?B?RTl2YzUxbnNKRmhvTzkyS3phRVRuNlhMU3FlTG5wUzVwRStsV1hNNHJHaFlP?=
 =?utf-8?B?TVFmY1lBcisyNy8zRmxMUHgxMlBsdnBkbFZzZXdyeEV2aXNlVGVvcnZmbVJN?=
 =?utf-8?B?dHRnMG41dHgyOXZqemZOaXU4Mmx2ZjJBOVREcHpmSHBSZjRIckFaQjYzcWh5?=
 =?utf-8?B?TE9DY24vTjdldVRpZlE4WGRjMVJnWjg4Z0ZMbWtlNEF2Uk1YR1BhcllaUTF6?=
 =?utf-8?B?OFU5ejdYSFFHWVRLTzhBM2w2WmZ6enNpams5elBOd2FqaFdmVGdqZEJrOHV1?=
 =?utf-8?B?ZDV4b3BnK0UrRHBtMHZsMDBqYkhZSUZ1ODZnK0N0SEp4WW1DamxQS0R6dVBW?=
 =?utf-8?B?azA4bGR5N0prTng4SktRb1NrN0krVkVjM0dsTlhNeFYydVZobjdWWXNIeWlm?=
 =?utf-8?B?a29tVm0rYlMvYVVDQkErYnZ2dGVuTHMvcVlYdkRicW5objVPYjlxMXhmWm9M?=
 =?utf-8?B?WE8zdkJ4ZHpwZmdkalJXK0R0Tk1vU0phVU9sZ0JzTnR0eDNtUHNJVTZkVHZ5?=
 =?utf-8?B?RnJYYU8xNmpHS3dIdUVvSzVwSHNERWJtY1VXbzFvbmMvSWJXMktEZE5DckJv?=
 =?utf-8?B?cWYya09WSDAvcitSa0Nvd3V5ZDNSQ3F0M0tYVjd6ZDJOZWgzaFdhNjEvUXBs?=
 =?utf-8?B?dGVxWjVIWGRLUkRuOW9MU0FJQU9ndXVOQUh4YUxoRzNYeHZQaGY4TStQMExm?=
 =?utf-8?B?Mk9uT2k0ZThNbU1ldXhVQzlWdWZ0NjRKZXVlaXQvUm5qczlqQXhMM2VHYUJz?=
 =?utf-8?B?TE81Z2lmZERJcjdqdTladkxVZ2FBZ3QzeUlLbERxekVYc1NxY1hrZFJtZ3di?=
 =?utf-8?B?b3crVFg2K2NYQmsrSnZvZ3huN0dIaWZ4SVVTN1FUTXVFaTFheTgycHp6bnQ2?=
 =?utf-8?B?SmhXK2E2cnJ1Zlh2THdqRnhybUphMmRTUHlhYU4rUHh3R0VtMWhwRENzTnRo?=
 =?utf-8?B?dFNEK0RyaEhUODNpUVdoZ0syRy9MN21oSDN5d2tkOGFRMHlzeWJmdVRqUXhM?=
 =?utf-8?B?MkNxeDFvRjcwdHE5WDRSNmFLOEpxem1JYXZrYjU2S1N1dDMxeGRYaVROcUgw?=
 =?utf-8?B?OEcxQ2VBaERSdGJ6Qmx3Q0o2MXE5eEdYbDNsV2lQUzdOQzgybTFqamlqNlhn?=
 =?utf-8?Q?WEhJ/GMRWgQ36vbQCaDEpDhO7naQdbYs?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(1800799024)(366016)(376014)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?V3oySE9NV1U1RGJzUVEzUDlmRUlXMGoycXg0VEpXVldNeG1WaXlUQ25uekU2?=
 =?utf-8?B?ZEVvY2ZaR0R6TGFKK0s0REUxMzU5ekJYRTEvTEhURXVmZDc4TEpoUXpKODh1?=
 =?utf-8?B?dmE0OHU2Ky9qUzhTWHhvQmhnMVlHMTdVS004TFFlV1BnbnB3UlhKRDYzTFFB?=
 =?utf-8?B?aU5SZThxY05xdHZVeU9lMTE1N3pnK1cvTTkxVndsMkNldUdKRTl3RzlPVHhj?=
 =?utf-8?B?YnZSV0p3Rmo0eG1nU25kS2tBYjNxdUhVRGtXQjcrVEdZbGdQMjNuWnV4eHBB?=
 =?utf-8?B?ZFpEWmxJL2tIT21BZytYTHEvdi9VQzdZWk1rRTA3QmVIN0xNM0VPclJiVVJj?=
 =?utf-8?B?U1VTcXNpbDljQjRyYlBpUkdXeld2Wk9IZlc3aDM3WFpkbWhyK2k4MDJLS2tX?=
 =?utf-8?B?YnEvU2U4b3E0RDB0Q3VnWDRVLzZtdUlGQkJZVktPdjQ2WWhsL1FTcmI3bk0v?=
 =?utf-8?B?cWhlb1lWV3RQUUczQXZNWWRSK2QzelJaYis0ZGZ0YUZORWZ6VUo0OVdqVjF5?=
 =?utf-8?B?a1hPbHUyeng3c1pTS2JHcVVlMWJaNFhrVHg1UTVLa1p4MG9DcG5kNGlmTWdX?=
 =?utf-8?B?TlJlRm5PL0U0TkJSVTRTVnBzNnNPK2xPVTBHcE1VTzA0ekxrekFHblZPZlZs?=
 =?utf-8?B?RkFRayszOTZPSGNBbWNsRnJnNVF5QlNwOGp2cW55YnN5bjVuUW5JWTdBbDQ0?=
 =?utf-8?B?NkV1cXY0dnNQSlQrWXpDVDVmWDBxZ2s3M1h3OUppdGN1Tmx6TmlxWE5pNGhz?=
 =?utf-8?B?cXExT3BGa0JuWEM2Znl1dnlXL3R6bUF6U3JudlBMejlqTnBHd1lDcWNYZVVJ?=
 =?utf-8?B?Nk9GRUZXVEJpSlBzNDJLWWRMNXFEdmF5WVUreEF1K0liODF5dE5vd0l4elFW?=
 =?utf-8?B?c000MnZ4WWovbW1rS0FHQzdlS0pyRVRobDdKNGpkc0hhck9PZ2loQ3JTdlVK?=
 =?utf-8?B?UCtNRVdpa3lqYXpqV0ZPQTA5TVNzeUZuSHlJaG8zUzdCUWplRDRnYXJJNGc5?=
 =?utf-8?B?clNVNEdmVnpEc2JoWUJZMjArNUNxVHhNc0Z5WTFjY0drTHdIRnh1UmxaTUtm?=
 =?utf-8?B?ZC9obElwcmd3dGNpdGQwWk9IS3Q0UlNtYWt3aituckN2YUxaNXFuZE5EaThz?=
 =?utf-8?B?eVZ3c2hGWVVIZ3JoWWF5U0grTy9aeEZrcWtJWGhsdVhWaitMUXZDV2xQTjda?=
 =?utf-8?B?OXpUOHhGVEg0NWdIQU15bXJ0UUZYUkJrdzhteDJSNCtGSHRUYU9hV3RDM3c0?=
 =?utf-8?B?WSs4ZFlCQnhhRzJ6QmlRdkk0VElWTUVTb3kvRDVpb0NibnRuYVU5WXpWeVFa?=
 =?utf-8?B?bWp2RW5SM1d6VDZ3UWhqMGVwUDVyUWxJMG95bjlPVjhLWHcrOVdJTklwaFhD?=
 =?utf-8?B?aUZmaTlkSmQwZUlMSndtN2dLZi9CRzlPTlExdWd1cEpYOXZCMWRaSjAvS3hH?=
 =?utf-8?B?bncvK1k2RUM0ajJPYjk2UnN2RWlGb25aalpMYVBFQWtTT2liUkFuaTdvNEV0?=
 =?utf-8?B?KzRQL1Vidk1tcjl3V3dTOU5JZkZrQjZrNmpBUjZ6V2RHL3VFNWJZM3ZsMFV3?=
 =?utf-8?B?dnNneTFsVTRyeVlCV0RzVXdlL0hRMUtRN3ZsL3FuU3ZPZWNRTHp3N0xOM2hh?=
 =?utf-8?B?a09WR2kyNDN2OXl0Z1ZVb1ZTWWV0OEdqZGh3N3M0Q2JqR1E4L2Q3ditNLzVu?=
 =?utf-8?B?VnpQYjBRSFRQcXNBbE9aWHNMN1AvU1d2T3lNZDRaUWcrYkhHQzVha0YzZlhY?=
 =?utf-8?B?SnFINktsRGhwU2l3R212VlplR0M0dzd4T3VzNGdpVWtzTVBQTkIxVEo3TjAr?=
 =?utf-8?B?dVNCYVVlRUVlZSsxMTBBQ1dvWDlLTVpBYUxwd0toMXQ5Nzl3bU13UHhxOHpK?=
 =?utf-8?B?WnA0ODNubmNIeGRaVDB5QlFaNnc1Ukd2bEIvaldWTjBKUitteG9iMG94bllZ?=
 =?utf-8?B?ZEQvRVhiWWVKeW1SN1o2YzdzMW52ZWVOcmpVajViQUk2ZktwdThzUEJVVkdu?=
 =?utf-8?B?Nnh2TmduOGN3RnZlWjZudWR3QklnMi9HWlJ6eVI2WFhPOTI5ZzlKTnJPZ0hP?=
 =?utf-8?B?OVlxMzJMME9PS3V4QTUyb2RLUDRDeDdHb2kxYXQxM2cwUi9IRUZBNEliN1ZJ?=
 =?utf-8?Q?Od/ADU0UKhUkWugYgAfbXf6eR?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 80971376-4574-4c63-b7a9-08de2d9be6dd
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Nov 2025 10:01:15.1241 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5V5FQIDUepCSEFIsu7CbRa2EcLIiFA3Q7FqVgSTnhk/4zwVw71E/9bxQfsD8eT08
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB6746
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

On 11/27/25 10:16, Philipp Stanner wrote:
> On Thu, 2025-11-27 at 09:11 +0100, Christian König wrote:
>> On 11/26/25 17:55, Matthew Brost wrote:
>>> On Wed, Nov 26, 2025 at 08:41:27AM -0800, Matthew Brost wrote:
>>>> On Wed, Nov 26, 2025 at 02:19:10PM +0100, Philipp Stanner wrote:
>>>>> The dma_fence framework checks at many places whether the signaled flag
>>>>> of a fence is already set. The code can be simplified and made more
>>>>> readable by providing a helper function for that.
>>>>>
>>>>> Add dma_fence_test_signaled_flag(), which only checks whether a fence is
>>>>> signaled. Use it internally.
>>>>>
>>>>> Suggested-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
>>>>> Signed-off-by: Philipp Stanner <phasta@kernel.org>
>>>>
>>>> This is a nice cleanp:
>>>> Reviewed-by: Matthew Brost <matthew.brost@intel.com>
>>>>
>>>>> ---
>>>>>  drivers/dma-buf/dma-fence.c | 19 +++++++++----------
>>>>>  include/linux/dma-fence.h   | 24 ++++++++++++++++++++++--
>>>>>  2 files changed, 31 insertions(+), 12 deletions(-)
>>>>>
>>>>> diff --git a/drivers/dma-buf/dma-fence.c b/drivers/dma-buf/dma-fence.c
>>>>> index 39e6f93dc310..25117a906846 100644
>>>>> --- a/drivers/dma-buf/dma-fence.c
>>>>> +++ b/drivers/dma-buf/dma-fence.c
>>>>> @@ -372,8 +372,7 @@ int dma_fence_signal_timestamp_locked(struct dma_fence *fence,
>>>>>  
>>>>>  	lockdep_assert_held(fence->lock);
>>>>>  
>>>>> -	if (unlikely(test_and_set_bit(DMA_FENCE_FLAG_SIGNALED_BIT,
>>>>> -				      &fence->flags)))
>>>
>>> I need to read a little better, I think this change isn't quite right.
>>> The original code is test and set, the updated code is test only (i.e.,
>>> you are missing the set step). So maybe just leave this line as is.
>>
>> Oh, good point! I've totally missed that as well.
> 
> Oh dear; I also just saw it when opening the mail client ._.
> 
>>
>> But that means that this patch set hasn't even been smoke tested.
> 
> I've built it and did some basic testing with my Nouveau system. Any
> suggestions? Do you have a CI that one can trigger?

DMA-buf has CONFIG_DMABUF_SELFTESTS which should be able to catch things like that.

But even running Nouveau should have found this since basically no fence at would signal any more.

Regards,
Christian.

> 
> Thx
> P.

