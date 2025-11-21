Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8308FC7AA4D
	for <lists+dri-devel@lfdr.de>; Fri, 21 Nov 2025 16:52:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C85C610E8BD;
	Fri, 21 Nov 2025 15:52:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="OQVpxbnM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DM5PR21CU001.outbound.protection.outlook.com
 (mail-centralusazon11011055.outbound.protection.outlook.com [52.101.62.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CCBE410E8BD;
 Fri, 21 Nov 2025 15:52:44 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vsaxTixnrNrXsa4JQxvlb8KBd8kSAmwt8rabtC6YAcIWOzaS2oeRu9i9yZp/hSQHHVe+zfyFF10e5IhwqNrqCOx7HdSL3ztK1vaERRuzy51ZLCOqr0acmp7Q81qjOcUYg91DtAFQrOLNvCBHceNaTe3haQ6TOsDxQtUrf73CgCHjrYZydTVle1h3HwtX66TpLi6mgfKYkmC2HROO/N9weORfHVexk0n5IauNGoEfojcxqoGuxssT04kW4hYgkVMP8xz53QE6Lojbp/N4MgjcL3orMt8xLanN5xmldUp0kFeVMjMRm9jLMXw3XccWHlpGpheZ6qELqT76aJYT2jbJ2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4N577SMkhQkqNPO7IAVsTDbx+zHRsrYNkkCC9CPva3Y=;
 b=p8qw24FhbTLfetDaPQ4h+6FVJJJkx7rGYB+jDogmzD7/tXWWCTidmxz7MGi9+fD/5pQ0Z95aNC5yUgtaCZTNzdco+XaGvFVKfFvJ70TWzPdkZMQzjweXbemqFjBRD5dVGY+Aq/u8urOZrays0OEUM1X15PtQt/2IYSJPXJhyOK/deavt2UYxq9uazdNvP28RPNUguJesSlqY67H/qCSuYA3vWKQINzLQGb0mtd5FyC4rPpfyOUani4MCUmotI0tIOWZgnMs2xMkHHMLhL8Qxu/kxcrhCKIEIuHOMea62bjPOO0XDVaPjaUXWxrFEVEp9kb3ibXoiyGVZYq/XaXzTQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4N577SMkhQkqNPO7IAVsTDbx+zHRsrYNkkCC9CPva3Y=;
 b=OQVpxbnM8dMZWXJZtrd/0mqll3VZJR+XDl4QKazGnNbUl9rij05R2VxwRiXNDGr1xCf6YS/BR1oB0LlP6Ak3z42GLYORZZqhV3QbARfSjS1SmohhL8ecu6Qe/85PmuDi1uuTiHdo6B8GbhgxMI18IP2JUm/8VtDgOQn8ZQiU/kA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by CY8PR12MB7121.namprd12.prod.outlook.com (2603:10b6:930:62::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.10; Fri, 21 Nov
 2025 15:52:40 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%4]) with mapi id 15.20.9320.021; Fri, 21 Nov 2025
 15:52:34 +0000
Message-ID: <00ca7314-3039-439e-a7a8-55343593e2a9@amd.com>
Date: Fri, 21 Nov 2025 16:52:25 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 25/28] drm/amdgpu: pass all the sdma scheds to
 amdgpu_mman
To: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Felix Kuehling <Felix.Kuehling@amd.com>
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20251121101315.3585-1-pierre-eric.pelloux-prayer@amd.com>
 <20251121101315.3585-26-pierre-eric.pelloux-prayer@amd.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20251121101315.3585-26-pierre-eric.pelloux-prayer@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SG2PR04CA0200.apcprd04.prod.outlook.com
 (2603:1096:4:187::15) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|CY8PR12MB7121:EE_
X-MS-Office365-Filtering-Correlation-Id: 79c21aec-34c7-4037-d50c-08de2915fc37
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ek1UMTY0R2VHZ25zMEN6alNWYWx1cU82OGc5WE01TitqVHBleXNWL0d6bjN6?=
 =?utf-8?B?RGdBSE5nWG5LQXBRbkpodWlwVkhZRlY3MXl3NjZIVFlXSHBlQnhyQ3VKMW16?=
 =?utf-8?B?djM0SHJmNU56L2NPUWd5cGI3UTRJaUczVTRXODZxSXRjYjVhK1VPYU1mVkxx?=
 =?utf-8?B?VG5OS0dQNEFEUGpmMjBhb1NjdUZ3TGpYOTZCVFJhOTlwaHZuZHYrZ3JZYlNU?=
 =?utf-8?B?TzFScVR4R3pOZ1g2NDRGQ3Z1ZTYwL1JOaVVWMllkM0dyR0xNMWFubGNHRldn?=
 =?utf-8?B?S0pORmtHRGl5M0ZnSjEzb1dnZXFhWUJmeUdaWkxHa0hCT3FlOFozSzJ0V2hG?=
 =?utf-8?B?bnllN2hQQzA5cFBpVVJhdE9nWE5ZU3NCQkQ5S1RqMnUzMzI0cWh0cjVrR1BK?=
 =?utf-8?B?STN3Y1hIYnJtcWdVQkd4Y2EyczBPWnpRbzE2UFRmVGsrWmpMaFVuaXVIMjJr?=
 =?utf-8?B?dDlEN3luaENITUVRdE1uMTZIenQ1NmVxZFdwd1UwTmJQRCtCdThjV0srSzRO?=
 =?utf-8?B?KytvZEk0enBPY0tCVm82QVZmUGxaUlNaTWlCaXRJQnJ4SU8wdC8xbXNHWC9U?=
 =?utf-8?B?Zm00VHdkazQ2RW12VHpiZjRlaEh4YnIzbHhGNEliYm9NSjBIbXdLclUxbjg2?=
 =?utf-8?B?dkNyaGttdkdWRTlaTkROVklzT2lKOG9iUVFLVjR0c25BaURpTHZvVE1ac2Ex?=
 =?utf-8?B?cXNjL0cwSUpLUURTeStITEtnMktRVlBWdnNLcGZHblMvYmRlOFAxbmhaL2N5?=
 =?utf-8?B?bmRWR2haQ2ozUnRwOWxFV3E0d05mUXg2aGlGb1E5ZDlwempKd0k2UU44UGdP?=
 =?utf-8?B?cGxETC8wZURnM1lNTENVSWVlQzkrNkw4TmlMUG53ejhSQkRCdFZvdTFYWkJL?=
 =?utf-8?B?dHc3Z3lHVncvTDBYS0ExdG9oRlJLNVVsUnR6VlVPbGpXKzRYTWtHSmJJMGpz?=
 =?utf-8?B?MnM0MnlOcDF2UDgvblhYeFlUdGFBYlVLUjAvTnY0eVRXMG4wOC9MTTVYeTdo?=
 =?utf-8?B?djQ5VHpVcVRnMy9uMG5oRzhsM3lFNXU4dUx1Kzl0S21jQUJPL0JvQ3psSkNU?=
 =?utf-8?B?Mk5ueDROb1hnbVFyUXdmYUUvT09WblJhYzh6QitoUnZHaVRXZFFiRW9VdlJC?=
 =?utf-8?B?V3RoNXJQb3JaQlBxU2gvQnpiNDAvYzUrZzZ4eGVybVl6RWtaSmU2cVBIR1l1?=
 =?utf-8?B?elJySHNocEtod05YUWJxczAzTnQrM3NiQXZqcW1Cc0lRb1lHUFp5cC91U2cx?=
 =?utf-8?B?NCszckNrNWpzOEhWQVBWRkRvUmMyZmtneDJ0cXNsQS93VGp2d1VkNmpHRGgv?=
 =?utf-8?B?UzhPREE0OHFUYmJ5UkRUbjdMa1FWN1BGem90VEJuS3J2elBXOU9kblJ1c3hk?=
 =?utf-8?B?TW1lMmdWYWl1K0phMGFkQ2J4SmJNN1pxUjZKL25qTlorU3ZvY1RIMWk5N3dk?=
 =?utf-8?B?TDBBNXUwdm5DSnBwVVp6cGlhOWlUeEdDaXdxMkoyN2NCQzU1RWxoRlpBZ3I3?=
 =?utf-8?B?ZmJteXU2SE96MzZKUTRzN2d0cVNZZjJHaCtBUGtHc3dqeUhUMENEaEJVMjYw?=
 =?utf-8?B?d2tISFN5SWdTc29MQWg2aXZGTGJ4d3BaK3dVYkh4alN5OWVvSURzQ3pUbWlU?=
 =?utf-8?B?WEZ4V1VmWTRiQzB0cmkwSUZKblo2MzA1MWQzL3FVc25HV21zUjI4aFB6dWRD?=
 =?utf-8?B?OUdSNVJLM0lYeFVRRDlPSjNxNTR4dWRlbzE1ZGU2MWtKZm1pSDVBRit3eFlo?=
 =?utf-8?B?WU5UclkvQkNhbGh2dWJLS0UwUEIwMk85aEh2QTBBVkhKNlJ6dE50Z1dKejRS?=
 =?utf-8?B?QS9TWjJ5dmhYTm02VVM1TTV1WWVkUWRURWhXdDhaekNCc21WdWlpeHp6bHpi?=
 =?utf-8?B?WmpxWFZQbzVRUnB5alduMnlIdmZZMTV2emlLaUxJMWVEd3BpcW9oRHNZNFl4?=
 =?utf-8?Q?GZhNG2mxmTII2bHn4N2APJHhS6b21Aq8?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dXdEZXpCdEd1cXY0UHUyODdCemR3MEJxdlFHMVh1a1pGT0N4U0xDYitodk5S?=
 =?utf-8?B?N0cxYkdNaHpDVEFBYi9PMHNrSUVxNmdHM3ZPWkkyTGFianJ6UFlpYmoyRXg0?=
 =?utf-8?B?ajE5ajVidmMxSWlieGYya29DQ0FqMTVwcnV1NjhDcythcDFXQi9reEFaalVp?=
 =?utf-8?B?SnVoWUNWckhBK0NiTElGeW1OYTRJM3ZNMXRLYTg3ZkgvRis5QS9hYU96ZmFX?=
 =?utf-8?B?Rm1TbnhwMzQ0bjUrcFVYenZwU09xbmxxSlhCNk96R29ZV0g4ZnViSXhhdnpo?=
 =?utf-8?B?U0JUZThQSzN1VlVIQXRjcWw4WDN2SU5taXdNTHhCK2VwMXEycDB6ZGRWZ2dn?=
 =?utf-8?B?eFo5b3BVMy9zSVl2YmtVMjRaZWNBbS9FNzhESGF3UW90bC9wODByVEIrOE5r?=
 =?utf-8?B?L2p0WXA1NzBlWmZ3eVBvemVjZnB1ZCtJUGFjdkRWOXo3ei9BZHdKWnNPblFs?=
 =?utf-8?B?VGdtT283SFpxbHpRb3U2QmRGQ2M2WFJvNnhGM0o5Y2JabXNvUUp4Sk45VGFW?=
 =?utf-8?B?d2oySVkrSWI5aWZQMXlNcTBEcHEwaXVVeW5EUVNnbFNVSEEyQU13M0RTYjBV?=
 =?utf-8?B?QWZyaktUVnlJVklwQ3Axb2lwY0lpQTFHZVNKV2RrNlVzT1NyQkxlcWI3OUU4?=
 =?utf-8?B?NWsyUW5UZEowbS8vZG81SUs5U28zS2xhWFpiQThJdW1OTnVSVUo0UGFZTDR2?=
 =?utf-8?B?RUZLOG1XbkVsbm50MGIxUExnQjJ5KzFMai9jQ2plbGl4K2h2Rm1EWmVac1Vo?=
 =?utf-8?B?cCtMZnExUnkvVmw4MG5uQUowZlpYYklhSjdia0hsYmdzeVl3NmRaUXp1SXds?=
 =?utf-8?B?UjFoZjVOUU5PQ3lkNiswN0QxRER1aFBFRWxFd1BHQ3puT2xMZ2JSRDJ2M29L?=
 =?utf-8?B?WHFYb1IrYWQ3NXZYRzJyVE05V0w3SDRaNENna0dyWnkzNW9ORmpZRUs5WDhx?=
 =?utf-8?B?Mm5scVdIL3Zya2w0enhsUHpOUlM1KzJJNlJuYlNaU0JjdXVlNnlER1pKTERa?=
 =?utf-8?B?QWZSd2QreHdudVFzQlBKeHQyN1ZpNVVmcm4rcWYwL2NDdVorV2xCUGg5eUFo?=
 =?utf-8?B?b1lDT3BBMTBXTEFIbEtSd0s2dEtsb083U082QVl1M2dkNzU3akZ3RnEyTWVB?=
 =?utf-8?B?MjhCY2VBVmhhMFRLbld4UmtYMEZXSUdmaDBvdDNtMGxHUCtFajhUYUlFazRV?=
 =?utf-8?B?UWE3eWxqTXk1WkJXcEhGZWVEQ3BOT0xNZndIaDFHQzd6MzhJTjE0aXVaa1pP?=
 =?utf-8?B?STFHNk5xeFZwNXpKcTYrS1NvcWNobDlqYnUyTFdrUGFWbnd6bm9CcHlSbmg2?=
 =?utf-8?B?S1NyUTFUZ25wTUdvN1lWeHZrbGh6VjZZOUNVSmdGWkFBS05nV1cwMExOaHZ5?=
 =?utf-8?B?QWZSUlh3YlpSZE5JS0hQR2lhbkloeEJtbDE0aGhNRGdoZnBYN044dzl2elBz?=
 =?utf-8?B?NnBMU3YyRmtXeExhN0N2UGk1MTRjRGVkTzNxYU83NXBtVlJDeFJKZWg0VVY5?=
 =?utf-8?B?a3VaSjNiVUowL05ac3hrSE1DWkVzQjhKdGs2TGR0MVFwUmxzMWUrVkNjTmE5?=
 =?utf-8?B?R0w1bEY3QXVtTW9QRWMxdHA5UHRVQjc0cUpLa3pEUmplRWEySVIwS1JHeHdn?=
 =?utf-8?B?alEvQ3Q3VmZiRjMwY2x0T3lhZloxb3phQVF6QkRRdTN6VDBwK2ttZ3pQQVV0?=
 =?utf-8?B?dXE0b0RTM3psN0crOFNDTDZTOUxLNUtpNTh0WURWRytIMkY1aFF6djlwY0Q3?=
 =?utf-8?B?K0dvUTNWRDhYZ0FNVW9LZ1VUUEpOd0ptMGhOc3BGdElwRERaMGRiSm5tVlhS?=
 =?utf-8?B?TFJSaDZDMG9aNndBVVkvVGdTSUNHZVJNQUlnQ2ZMekM1RnVUSFdnNVR1bE9o?=
 =?utf-8?B?ek0ydmpDMHlqa1ZZZzc2U2pDQVE2TjFZWDkvWVova2w3eDJ3cVBEd2hnVHZT?=
 =?utf-8?B?ZDd4RWhtMG9vdEd5NmVvUmdrV2ljUWY5SlBtd0IwcEx2YkNoMFNmYVVhMzZm?=
 =?utf-8?B?NU9TM0Q1aEdTeXljQUlJOXpyUHYrdEUyNExCbGVUczFNbHdUQjBDdVQwRzZO?=
 =?utf-8?B?cVlmK3dxNWp1NzlWWnJNcEpKWlVHaHBvZ0hnL0hRVnR0VkNDWTBuRVNpRzhH?=
 =?utf-8?Q?4Yb9AJ1srYGa6ipoxlPjMfD9b?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 79c21aec-34c7-4037-d50c-08de2915fc37
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2025 15:52:33.9052 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dgx0j2bgB/DMZJoyxnGYV7NJCfTfRFxRUeBBvAfIBH1zJiKjSDEAf61kNqfyU5ez
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7121
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



On 11/21/25 11:12, Pierre-Eric Pelloux-Prayer wrote:
> This will allow the use of all of them for clear/fill buffer
> operations.
> Since drm_sched_entity_init requires a scheduler array, we
> store schedulers rather than rings. For the few places that need
> access to a ring, we can get it from the sched using container_of.
> 
> Since the code is the same for all sdma versions, add a new
> helper amdgpu_sdma_set_buffer_funcs_scheds to set buffer_funcs_scheds
> based on the number of sdma instances.
> 
> Note: the new sched array is identical to the amdgpu_vm_manager one.
> These 2 could be merged.
> 
> Signed-off-by: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
> Acked-by: Felix Kuehling <felix.kuehling@amd.com>
> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu.h        |  2 ++
>  drivers/gpu/drm/amd/amdgpu/amdgpu_device.c |  2 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c    |  4 ++-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c    | 31 +++++++++++++++++-----
>  drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h    |  3 ++-
>  drivers/gpu/drm/amd/amdgpu/cik_sdma.c      |  3 +--
>  drivers/gpu/drm/amd/amdgpu/sdma_v2_4.c     |  3 +--
>  drivers/gpu/drm/amd/amdgpu/sdma_v3_0.c     |  3 +--
>  drivers/gpu/drm/amd/amdgpu/sdma_v4_0.c     |  6 +----
>  drivers/gpu/drm/amd/amdgpu/sdma_v4_4_2.c   |  6 +----
>  drivers/gpu/drm/amd/amdgpu/sdma_v5_0.c     |  6 ++---
>  drivers/gpu/drm/amd/amdgpu/sdma_v5_2.c     |  6 ++---
>  drivers/gpu/drm/amd/amdgpu/sdma_v6_0.c     |  3 +--
>  drivers/gpu/drm/amd/amdgpu/sdma_v7_0.c     |  3 +--
>  drivers/gpu/drm/amd/amdgpu/si_dma.c        |  3 +--
>  drivers/gpu/drm/amd/amdkfd/kfd_migrate.c   |  3 ++-
>  16 files changed, 47 insertions(+), 40 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu.h b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
> index a50e3c0a4b18..d07075fe2d8c 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu.h
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
> @@ -1614,6 +1614,8 @@ ssize_t amdgpu_get_soft_full_reset_mask(struct amdgpu_ring *ring);
>  ssize_t amdgpu_show_reset_mask(char *buf, uint32_t supported_reset);
>  void amdgpu_sdma_set_vm_pte_scheds(struct amdgpu_device *adev,
>  				   const struct amdgpu_vm_pte_funcs *vm_pte_funcs);
> +void amdgpu_sdma_set_buffer_funcs_scheds(struct amdgpu_device *adev,
> +					 const struct amdgpu_buffer_funcs *buffer_funcs);
>  
>  /* atpx handler */
>  #if defined(CONFIG_VGA_SWITCHEROO)
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> index 7167db54d722..9d3931d31d96 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> @@ -4527,7 +4527,7 @@ int amdgpu_device_init(struct amdgpu_device *adev,
>  	adev->num_rings = 0;
>  	RCU_INIT_POINTER(adev->gang_submit, dma_fence_get_stub());
>  	adev->mman.buffer_funcs = NULL;
> -	adev->mman.buffer_funcs_ring = NULL;
> +	adev->mman.num_buffer_funcs_scheds = 0;
>  	adev->vm_manager.vm_pte_funcs = NULL;
>  	adev->vm_manager.vm_pte_num_scheds = 0;
>  	adev->gmc.gmc_funcs = NULL;
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c
> index 0d2784fe0be3..ff9a066870f2 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c
> @@ -651,12 +651,14 @@ int amdgpu_gmc_allocate_vm_inv_eng(struct amdgpu_device *adev)
>  void amdgpu_gmc_flush_gpu_tlb(struct amdgpu_device *adev, uint32_t vmid,
>  			      uint32_t vmhub, uint32_t flush_type)
>  {
> -	struct amdgpu_ring *ring = adev->mman.buffer_funcs_ring;
> +	struct amdgpu_ring *ring;
>  	struct amdgpu_vmhub *hub = &adev->vmhub[vmhub];
>  	struct dma_fence *fence;
>  	struct amdgpu_job *job;
>  	int r;
>  
> +	ring = to_amdgpu_ring(adev->mman.buffer_funcs_scheds[0]);
> +
>  	if (!hub->sdma_invalidation_workaround || vmid ||
>  	    !adev->mman.buffer_funcs_enabled || !adev->ib_pool_ready ||
>  	    !ring->sched.ready) {
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> index 575a4d4a1747..eec0cab8060c 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> @@ -168,7 +168,7 @@ amdgpu_ttm_job_submit(struct amdgpu_device *adev, struct amdgpu_ttm_buffer_entit
>  {
>  	struct amdgpu_ring *ring;
>  
> -	ring = adev->mman.buffer_funcs_ring;
> +	ring = to_amdgpu_ring(adev->mman.buffer_funcs_scheds[0]);
>  	amdgpu_ring_pad_ib(ring, &job->ibs[0]);
>  	WARN_ON(job->ibs[0].length_dw > num_dw);
>  
> @@ -2241,18 +2241,16 @@ u32 amdgpu_ttm_set_buffer_funcs_status(struct amdgpu_device *adev, bool enable)
>  	    adev->mman.buffer_funcs_enabled == enable || adev->gmc.is_app_apu)
>  		return reserved_windows;
>  
> -	if ((!adev->mman.buffer_funcs_ring || !adev->mman.buffer_funcs_ring->sched.ready) &&
> +	if ((!adev->mman.num_buffer_funcs_scheds || !adev->mman.buffer_funcs_scheds[0]->ready) &&
>  	    enable) {
>  		dev_warn(adev->dev, "Not enabling DMA transfers for in kernel use");
>  		return 0;
>  	}
>  
>  	if (enable) {
> -		struct amdgpu_ring *ring;
>  		struct drm_gpu_scheduler *sched;
>  
> -		ring = adev->mman.buffer_funcs_ring;
> -		sched = &ring->sched;
> +		sched = adev->mman.buffer_funcs_scheds[0];
>  		r = drm_sched_entity_init(&adev->mman.default_entity.base,
>  					  DRM_SCHED_PRIORITY_KERNEL, &sched,
>  					  1, NULL);
> @@ -2387,7 +2385,7 @@ int amdgpu_copy_buffer(struct amdgpu_device *adev,
>  	unsigned int i;
>  	int r;
>  
> -	ring = adev->mman.buffer_funcs_ring;
> +	ring = to_amdgpu_ring(adev->mman.buffer_funcs_scheds[0]);
>  
>  	if (!ring->sched.ready) {
>  		dev_err(adev->dev,
> @@ -2624,6 +2622,27 @@ int amdgpu_ttm_evict_resources(struct amdgpu_device *adev, int mem_type)
>  	return ttm_resource_manager_evict_all(&adev->mman.bdev, man);
>  }
>  
> +void amdgpu_sdma_set_buffer_funcs_scheds(struct amdgpu_device *adev,
> +					 const struct amdgpu_buffer_funcs *buffer_funcs)
> +{
> +	struct amdgpu_vmhub *hub = &adev->vmhub[AMDGPU_GFXHUB(0)];
> +	struct drm_gpu_scheduler *sched;
> +	int i;
> +
> +	adev->mman.buffer_funcs = buffer_funcs;
> +
> +	for (i = 0; i < adev->sdma.num_instances; i++) {
> +		if (adev->sdma.has_page_queue)
> +			sched = &adev->sdma.instance[i].page.sched;
> +		else
> +			sched = &adev->sdma.instance[i].ring.sched;
> +		adev->mman.buffer_funcs_scheds[i] = sched;
> +	}
> +
> +	adev->mman.num_buffer_funcs_scheds = hub->sdma_invalidation_workaround ?
> +		1 : adev->sdma.num_instances;

That won't work, hub->sdma_invalidation_workaround is only initialized after that is called here.

We need to check this when the TTM functions are enabled.

Regards,
Christian.

> +}
> +
>  #if defined(CONFIG_DEBUG_FS)
>  
>  static int amdgpu_ttm_page_pool_show(struct seq_file *m, void *unused)
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
> index 0785a2c594f7..653a4d17543e 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
> @@ -66,7 +66,8 @@ struct amdgpu_mman {
>  
>  	/* buffer handling */
>  	const struct amdgpu_buffer_funcs	*buffer_funcs;
> -	struct amdgpu_ring			*buffer_funcs_ring;
> +	struct drm_gpu_scheduler		*buffer_funcs_scheds[AMDGPU_MAX_RINGS];
> +	u32					num_buffer_funcs_scheds;
>  	bool					buffer_funcs_enabled;
>  
>  	struct mutex				gtt_window_lock;
> diff --git a/drivers/gpu/drm/amd/amdgpu/cik_sdma.c b/drivers/gpu/drm/amd/amdgpu/cik_sdma.c
> index 22780c09177d..26276dcfd458 100644
> --- a/drivers/gpu/drm/amd/amdgpu/cik_sdma.c
> +++ b/drivers/gpu/drm/amd/amdgpu/cik_sdma.c
> @@ -1340,8 +1340,7 @@ static const struct amdgpu_buffer_funcs cik_sdma_buffer_funcs = {
>  
>  static void cik_sdma_set_buffer_funcs(struct amdgpu_device *adev)
>  {
> -	adev->mman.buffer_funcs = &cik_sdma_buffer_funcs;
> -	adev->mman.buffer_funcs_ring = &adev->sdma.instance[0].ring;
> +	amdgpu_sdma_set_buffer_funcs_scheds(adev, &cik_sdma_buffer_funcs);
>  }
>  
>  const struct amdgpu_ip_block_version cik_sdma_ip_block =
> diff --git a/drivers/gpu/drm/amd/amdgpu/sdma_v2_4.c b/drivers/gpu/drm/amd/amdgpu/sdma_v2_4.c
> index 0090ace49024..c6a059ca59e5 100644
> --- a/drivers/gpu/drm/amd/amdgpu/sdma_v2_4.c
> +++ b/drivers/gpu/drm/amd/amdgpu/sdma_v2_4.c
> @@ -1235,8 +1235,7 @@ static const struct amdgpu_buffer_funcs sdma_v2_4_buffer_funcs = {
>  
>  static void sdma_v2_4_set_buffer_funcs(struct amdgpu_device *adev)
>  {
> -	adev->mman.buffer_funcs = &sdma_v2_4_buffer_funcs;
> -	adev->mman.buffer_funcs_ring = &adev->sdma.instance[0].ring;
> +	amdgpu_sdma_set_buffer_funcs_scheds(adev, &sdma_v2_4_buffer_funcs);
>  }
>  
>  const struct amdgpu_ip_block_version sdma_v2_4_ip_block = {
> diff --git a/drivers/gpu/drm/amd/amdgpu/sdma_v3_0.c b/drivers/gpu/drm/amd/amdgpu/sdma_v3_0.c
> index 2526d393162a..cb516a25210d 100644
> --- a/drivers/gpu/drm/amd/amdgpu/sdma_v3_0.c
> +++ b/drivers/gpu/drm/amd/amdgpu/sdma_v3_0.c
> @@ -1677,8 +1677,7 @@ static const struct amdgpu_buffer_funcs sdma_v3_0_buffer_funcs = {
>  
>  static void sdma_v3_0_set_buffer_funcs(struct amdgpu_device *adev)
>  {
> -	adev->mman.buffer_funcs = &sdma_v3_0_buffer_funcs;
> -	adev->mman.buffer_funcs_ring = &adev->sdma.instance[0].ring;
> +	amdgpu_sdma_set_buffer_funcs_scheds(adev, &sdma_v3_0_buffer_funcs);
>  }
>  
>  const struct amdgpu_ip_block_version sdma_v3_0_ip_block =
> diff --git a/drivers/gpu/drm/amd/amdgpu/sdma_v4_0.c b/drivers/gpu/drm/amd/amdgpu/sdma_v4_0.c
> index a35d9951e22a..f234ee54f39e 100644
> --- a/drivers/gpu/drm/amd/amdgpu/sdma_v4_0.c
> +++ b/drivers/gpu/drm/amd/amdgpu/sdma_v4_0.c
> @@ -2615,11 +2615,7 @@ static const struct amdgpu_buffer_funcs sdma_v4_0_buffer_funcs = {
>  
>  static void sdma_v4_0_set_buffer_funcs(struct amdgpu_device *adev)
>  {
> -	adev->mman.buffer_funcs = &sdma_v4_0_buffer_funcs;
> -	if (adev->sdma.has_page_queue)
> -		adev->mman.buffer_funcs_ring = &adev->sdma.instance[0].page;
> -	else
> -		adev->mman.buffer_funcs_ring = &adev->sdma.instance[0].ring;
> +	amdgpu_sdma_set_buffer_funcs_scheds(adev, &sdma_v4_0_buffer_funcs);
>  }
>  
>  static void sdma_v4_0_get_ras_error_count(uint32_t value,
> diff --git a/drivers/gpu/drm/amd/amdgpu/sdma_v4_4_2.c b/drivers/gpu/drm/amd/amdgpu/sdma_v4_4_2.c
> index 7f77367848d4..cd7627b03066 100644
> --- a/drivers/gpu/drm/amd/amdgpu/sdma_v4_4_2.c
> +++ b/drivers/gpu/drm/amd/amdgpu/sdma_v4_4_2.c
> @@ -2316,11 +2316,7 @@ static const struct amdgpu_buffer_funcs sdma_v4_4_2_buffer_funcs = {
>  
>  static void sdma_v4_4_2_set_buffer_funcs(struct amdgpu_device *adev)
>  {
> -	adev->mman.buffer_funcs = &sdma_v4_4_2_buffer_funcs;
> -	if (adev->sdma.has_page_queue)
> -		adev->mman.buffer_funcs_ring = &adev->sdma.instance[0].page;
> -	else
> -		adev->mman.buffer_funcs_ring = &adev->sdma.instance[0].ring;
> +	amdgpu_sdma_set_buffer_funcs_scheds(adev, &sdma_v4_4_2_buffer_funcs);
>  }
>  
>  /**
> diff --git a/drivers/gpu/drm/amd/amdgpu/sdma_v5_0.c b/drivers/gpu/drm/amd/amdgpu/sdma_v5_0.c
> index 7ce13c5d4e61..5b495fda4f71 100644
> --- a/drivers/gpu/drm/amd/amdgpu/sdma_v5_0.c
> +++ b/drivers/gpu/drm/amd/amdgpu/sdma_v5_0.c
> @@ -2073,10 +2073,8 @@ static const struct amdgpu_buffer_funcs sdma_v5_0_buffer_funcs = {
>  
>  static void sdma_v5_0_set_buffer_funcs(struct amdgpu_device *adev)
>  {
> -	if (adev->mman.buffer_funcs == NULL) {
> -		adev->mman.buffer_funcs = &sdma_v5_0_buffer_funcs;
> -		adev->mman.buffer_funcs_ring = &adev->sdma.instance[0].ring;
> -	}
> +	if (adev->mman.buffer_funcs == NULL)
> +		amdgpu_sdma_set_buffer_funcs_scheds(adev, &sdma_v5_0_buffer_funcs);
>  }
>  
>  const struct amdgpu_ip_block_version sdma_v5_0_ip_block = {
> diff --git a/drivers/gpu/drm/amd/amdgpu/sdma_v5_2.c b/drivers/gpu/drm/amd/amdgpu/sdma_v5_2.c
> index 98beff18cf28..be2d9e57c459 100644
> --- a/drivers/gpu/drm/amd/amdgpu/sdma_v5_2.c
> +++ b/drivers/gpu/drm/amd/amdgpu/sdma_v5_2.c
> @@ -2084,10 +2084,8 @@ static const struct amdgpu_buffer_funcs sdma_v5_2_buffer_funcs = {
>  
>  static void sdma_v5_2_set_buffer_funcs(struct amdgpu_device *adev)
>  {
> -	if (adev->mman.buffer_funcs == NULL) {
> -		adev->mman.buffer_funcs = &sdma_v5_2_buffer_funcs;
> -		adev->mman.buffer_funcs_ring = &adev->sdma.instance[0].ring;
> -	}
> +	if (adev->mman.buffer_funcs == NULL)
> +		amdgpu_sdma_set_buffer_funcs_scheds(adev, &sdma_v5_2_buffer_funcs);
>  }
>  
>  const struct amdgpu_ip_block_version sdma_v5_2_ip_block = {
> diff --git a/drivers/gpu/drm/amd/amdgpu/sdma_v6_0.c b/drivers/gpu/drm/amd/amdgpu/sdma_v6_0.c
> index c32331b72ba0..ed8937fe76ea 100644
> --- a/drivers/gpu/drm/amd/amdgpu/sdma_v6_0.c
> +++ b/drivers/gpu/drm/amd/amdgpu/sdma_v6_0.c
> @@ -1891,8 +1891,7 @@ static const struct amdgpu_buffer_funcs sdma_v6_0_buffer_funcs = {
>  
>  static void sdma_v6_0_set_buffer_funcs(struct amdgpu_device *adev)
>  {
> -	adev->mman.buffer_funcs = &sdma_v6_0_buffer_funcs;
> -	adev->mman.buffer_funcs_ring = &adev->sdma.instance[0].ring;
> +	amdgpu_sdma_set_buffer_funcs_scheds(adev, &sdma_v6_0_buffer_funcs);
>  }
>  
>  const struct amdgpu_ip_block_version sdma_v6_0_ip_block = {
> diff --git a/drivers/gpu/drm/amd/amdgpu/sdma_v7_0.c b/drivers/gpu/drm/amd/amdgpu/sdma_v7_0.c
> index 9318d23eb71e..f4c91153542c 100644
> --- a/drivers/gpu/drm/amd/amdgpu/sdma_v7_0.c
> +++ b/drivers/gpu/drm/amd/amdgpu/sdma_v7_0.c
> @@ -1833,8 +1833,7 @@ static const struct amdgpu_buffer_funcs sdma_v7_0_buffer_funcs = {
>  
>  static void sdma_v7_0_set_buffer_funcs(struct amdgpu_device *adev)
>  {
> -	adev->mman.buffer_funcs = &sdma_v7_0_buffer_funcs;
> -	adev->mman.buffer_funcs_ring = &adev->sdma.instance[0].ring;
> +	amdgpu_sdma_set_buffer_funcs_scheds(adev, &sdma_v7_0_buffer_funcs);
>  }
>  
>  const struct amdgpu_ip_block_version sdma_v7_0_ip_block = {
> diff --git a/drivers/gpu/drm/amd/amdgpu/si_dma.c b/drivers/gpu/drm/amd/amdgpu/si_dma.c
> index b85df997ed49..ac6272fcffe9 100644
> --- a/drivers/gpu/drm/amd/amdgpu/si_dma.c
> +++ b/drivers/gpu/drm/amd/amdgpu/si_dma.c
> @@ -833,8 +833,7 @@ static const struct amdgpu_buffer_funcs si_dma_buffer_funcs = {
>  
>  static void si_dma_set_buffer_funcs(struct amdgpu_device *adev)
>  {
> -	adev->mman.buffer_funcs = &si_dma_buffer_funcs;
> -	adev->mman.buffer_funcs_ring = &adev->sdma.instance[0].ring;
> +	amdgpu_sdma_set_buffer_funcs_scheds(adev, &si_dma_buffer_funcs);
>  }
>  
>  const struct amdgpu_ip_block_version si_dma_ip_block =
> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c b/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
> index 5dd65f05a1e0..a149265e3611 100644
> --- a/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
> @@ -128,13 +128,14 @@ svm_migrate_copy_memory_gart(struct amdgpu_device *adev, dma_addr_t *sys,
>  			     struct dma_fence **mfence)
>  {
>  	const u64 GTT_MAX_PAGES = AMDGPU_GTT_MAX_TRANSFER_SIZE;
> -	struct amdgpu_ring *ring = adev->mman.buffer_funcs_ring;
> +	struct amdgpu_ring *ring;
>  	struct amdgpu_ttm_buffer_entity *entity;
>  	u64 gart_s, gart_d;
>  	struct dma_fence *next;
>  	u64 size;
>  	int r;
>  
> +	ring = to_amdgpu_ring(adev->mman.buffer_funcs_scheds[0]);
>  	entity = &adev->mman.move_entities[0];
>  
>  	mutex_lock(&entity->lock);

