Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CDE0CD190C
	for <lists+dri-devel@lfdr.de>; Fri, 19 Dec 2025 20:16:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 63E1410F08C;
	Fri, 19 Dec 2025 19:16:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="OTOtRVZZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CH1PR05CU001.outbound.protection.outlook.com
 (mail-northcentralusazon11010022.outbound.protection.outlook.com
 [52.101.193.22])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A85DA10EFCB;
 Fri, 19 Dec 2025 19:16:13 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rjFhnktrlSIkrf+5DyIbZNeDcFJH/2Yfo9ADEEeg8fvHmGb2twGB9EAFXmqpe4ziaZchplYAubIVC3Z0Zj8nXfXaxjIXQhvkkSdW83rlsr0Olpr4+I2YSxq9z/sINIPg229YMeuK46IhjqunN6nQuDwwlzNxDtJTsVL+y9c753RVeAH+e5CqA90aBRAZji+LDRxHgDz0bTUTLNUXp0j2nfwe065uijnkdEsYDSpoLVHA68WXPf/XM4bQ/pDz228Vzh34WDLi+MClXoe5BJ54xfBu/vzJf+5nNZiooIN2S7J7/FgstUPMsW9DKQRtG1WktpmG8GdWt9OJ1VaxKg5qWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ySQQ9fsXdUtibI5+2a8QWiDukL/1jRAUbftm6hZ3nco=;
 b=P/hovtGj8qVrK2Ur7AMWY/vs8OX3F8TkecJsbpoBkezrMoZXweKTFvTr52QJwmz7jUwaFZ4lRqFjuRfTmHRi4Zfhai6fD//psST++PB4oj/T27LDMXQUeLx14OvwTL9t3+Jh0wUeE8BtbXH83vI9ddGs1yktPAXMujsxj0EqAFKv/8VM7CUIeYJkNv9ZeetTweTKuhtf4hwivq8fJh9LX0bDGJGhlH7c05mOJAjU0f5OYrX2pj8dIJFitaGm3Nj8V/35ILna+j7EPsWOaqWWATo4+Iej+e84krvL7HNCenJvN/uTSQ7K4VESSiRnCBuiE0zAoruwpkGbPca73hd6vg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ySQQ9fsXdUtibI5+2a8QWiDukL/1jRAUbftm6hZ3nco=;
 b=OTOtRVZZUEm1dTbEutEM8Tzxnm6FoN1d7ZgvsgrcjhfV+YUNI9OKm80VTITQ1PJmFHEHsfW3PrgVULVSJKrS7gMfUZ1ZF4pDhB/bkLkvbCvJKLhF5rmoKhbhdJ4N+hVMVl/wboDLkpJl6faHjRq5bFCwgx9oWzGow6JcNIZ+eBU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB8476.namprd12.prod.outlook.com (2603:10b6:8:17e::15)
 by IA1PR12MB6187.namprd12.prod.outlook.com (2603:10b6:208:3e5::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.9; Fri, 19 Dec
 2025 19:16:10 +0000
Received: from DM4PR12MB8476.namprd12.prod.outlook.com
 ([fe80::2d79:122f:c62b:1cd8]) by DM4PR12MB8476.namprd12.prod.outlook.com
 ([fe80::2d79:122f:c62b:1cd8%6]) with mapi id 15.20.9434.009; Fri, 19 Dec 2025
 19:16:10 +0000
Message-ID: <53746714-c989-4f9a-96a0-f2044705ffb9@amd.com>
Date: Fri, 19 Dec 2025 12:16:08 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/atomic: convert
 drm_atomic_get_{old,new}_colorop_state() into proper functions
To: Jani Nikula <jani.nikula@intel.com>, dri-devel@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org, Simon Ser <contact@emersion.fr>,
 Harry Wentland <harry.wentland@amd.com>, Daniel Stone
 <daniels@collabora.com>, Melissa Wen <mwen@igalia.com>,
 Sebastian Wick <sebastian.wick@redhat.com>
References: <20251219114939.1069851-1-jani.nikula@intel.com>
Content-Language: en-US
From: Alex Hung <alex.hung@amd.com>
In-Reply-To: <20251219114939.1069851-1-jani.nikula@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR03CA0163.namprd03.prod.outlook.com
 (2603:10b6:303:8d::18) To DM4PR12MB8476.namprd12.prod.outlook.com
 (2603:10b6:8:17e::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB8476:EE_|IA1PR12MB6187:EE_
X-MS-Office365-Filtering-Correlation-Id: 7a66be3e-9a7e-4d9b-8b09-08de3f331188
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bWQzWnhpTFBsV2k4ZWt5Z0pwTm0rQlhrWlZMUHdHdVkxblBsWGYwazlqOWRy?=
 =?utf-8?B?S1lLdGFIT01sWjRJTjVEdERpNEpwSktGSVVqdEJmWTlLeGM3eFZwNDFUU2s0?=
 =?utf-8?B?SjYvWmJXeGxKdU1lcVlJZmY2ZzE1QWROTXFvbnN2eDRvTmFYSUZpeGJ1a1hn?=
 =?utf-8?B?OVVMb202S0hjZElZZ29iY3dJYXEzR3l3byt0alFBbmlCYVJUa3RIWGNpY3ZL?=
 =?utf-8?B?QWJRQ2NxdDJHdmowM09lT2p3QmY5bUdUSmlldGhad05DSHNsd3BuSjBhUmM0?=
 =?utf-8?B?MHp5c3NoS25RWEViT0tZaUhuRmQraG9aem1HckFvdzVyN2dseGg5cUtXTnJw?=
 =?utf-8?B?SjZHNXdhY1BIbWFIVXJMZWphWXlRZGo4NnJrbGRDSjdpdjF2T3YyVUhNREI2?=
 =?utf-8?B?VWhKSWRNdW5PMWFNdjQ1eWd6NGtxdmRuTVFTeiszc0pPbHZGTEwxRXBXRnEw?=
 =?utf-8?B?UFJ4b0tQMlY0OHE1am9ta0s2NWxWek4xanV2S1BnQ3AxSzFUMlpoRlZYVHNB?=
 =?utf-8?B?NTNVQ0hwTXZYZUo1MzB1a0hzU1F0c0haRld1ZlljalMzeEhHWlBPbmdrMnUz?=
 =?utf-8?B?QjUzSkh6Y2VRM2drRFc3TForallQQmR3cDNmUWVkT2xubXN1VWJOaDVLY0Z2?=
 =?utf-8?B?V2NtTmZ6MFJ3Vlk4Zm51cDVPUXMxU1k0aTBySE1mZ2ttZ3pLSmp5dmN1azJ3?=
 =?utf-8?B?R3UrZUcvZjFVQUhJSnlQNTNWWUd4UHp1NzVEbHRhWUlaNFA3UlVlMWtoQWhF?=
 =?utf-8?B?NmtnYnhkSXUwc214NXdlSmpiWlJkV3lMNzhieGdlcTcyQnpmYmRGbG80VGYx?=
 =?utf-8?B?a2ZsMEFaUjJ2cnB4UVRoMkRFYVQxQ0FlbnA5RWM4UmJaOU03enJCVkNmZHQ5?=
 =?utf-8?B?R09EeUZJbVM0V0hJWUwrRFFrd0R2Q0ZEd2NRaTFHS2VWY3pDdk9LdHlpcEF3?=
 =?utf-8?B?Zkg4UEU0SU1sckVyUzNOUndSbjIybFJKL21YNUpLb2tJQ013anpxS2ViTlEw?=
 =?utf-8?B?S1V5VHYzVko0TjBybjlXZWUzSkxxYW10R0lTRng1cjNpVjJMK1BMVjQ2QmJu?=
 =?utf-8?B?MmgveFQ3a29LUys2OERRQzcxNk1IUHBhTmFuWFUyQWtvQVA4bkhlSXJXSWZN?=
 =?utf-8?B?eHdDb2ZxeHBsdlZyelRhSXFDd2pNbmxkb3N5Qi92Z1NQY1BEbjhKY2J6Qm9m?=
 =?utf-8?B?RFgvZ0xubDNCamhEaDN6VVBzSWROU2lRQU5DK1ZuNFdQY2srUklvYjgvTWxr?=
 =?utf-8?B?bzBDZGZ2VFJQZGtvMVBZVENFL1lkKy9hWXBUZG5PaUlKTFZOWG5kS3lWOHpv?=
 =?utf-8?B?anRsNXJnZzU4T0hvelVoK2VxRnNzOENZRzVXQkRRNDFFQ0JkVkhjaSszRjZh?=
 =?utf-8?B?Vld4RWx2QWN5V0E0S2dCL1VMbzZYbE9sdmtYeitPcGJ4VEZPMkl5dnM5VDVa?=
 =?utf-8?B?S29qM005anhIQVFVeGdwZVIrQm0vT1ZzSGttM1E2V3A0em9YTGVLZXpkajVz?=
 =?utf-8?B?eXViWERTUXNRa1RiNnQ4RDVEREZRUEhLWEdzT3FnRnp6QXNNRW56VVQ0eGpU?=
 =?utf-8?B?RFFCSVFZOURQZFo4eHNBdHJVZXYzWDJGZ2hzd2hYVnh5Tk4yc2NyVFB0M1BO?=
 =?utf-8?B?S1JwbTk1czQyUW1IU1Rra3hKb2k5NE1KTFUxYzdkV3VDb2pjMUh3L3FOUGVn?=
 =?utf-8?B?QStZL2dDekpYemp4VXh3ZUQrNXJZTStJQzQra3FDb0pBS1FMSmx5d3hOTzRU?=
 =?utf-8?B?N1FMd1RSSkNwRnNud3ZIMi9TSHRXMVZRWFJVNE4yU2hOOG1lRUN0MTNReEhO?=
 =?utf-8?B?TTYwK3dmMUsyeE14OHNCbDlqZWlUdXBMM2JIb1VSWmlBRC9vdGdJQTloTGlv?=
 =?utf-8?B?cUsrNTM0blJFa05Cdk1heUR6aDYrTE9RQ2VWS2ZHTXFPVXgwVktpWE5pYk5J?=
 =?utf-8?Q?xQObmxKTWTQx/6A1gQflexOYHodiwByO?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB8476.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?b3NMc1hZaUNFdkJPVThUeU9kbDViN3E5bGRKWWw4VFljaXNpc0hHZk1FV3VQ?=
 =?utf-8?B?K1pRN3RweHJqa2d0Nk1RZWxpOEpKeDhqS0F0RTAxZXJSSkNKVi9pOTk0SlRZ?=
 =?utf-8?B?ZUsxTXl2L1pDOGFGZjNjOFIzTkpicGtWMHZjZ05Bbkt6Z2Y4aTc4a01mQndk?=
 =?utf-8?B?ZTVjeWI5WmVMTDlDYlEzZWU0VUtlSWR0bzZoTHZidFhCQmdFSmFuQmVTUEtR?=
 =?utf-8?B?dXlWY1c4MmpKTVovOTR5V2pxQXMwbExaTDl0YTBJbytId2E1Y1BjSDNrNGJS?=
 =?utf-8?B?S0ROem1MdlNUbDZNRUQ1Z2pSM3JyS2FjSWgxdlBLR3VkcEpvbDVKcHY5ZVlB?=
 =?utf-8?B?TmNFbUhxZVVaRUZabTU2ZG92SDZNeU5KMmhhQ1Y5cnI1Z2F3U3IvdkpTUVR2?=
 =?utf-8?B?VkFnL3FKNGF2dHRZVUFXVy9nSnlWWmEwdnZYMXVGc21YekJUMkJ6L0hmOXQ2?=
 =?utf-8?B?Nk1jZlcyM1R5cXJYVFZDeHFYYlhiaFNhVzVHWFVnMitkQ20zV3JvOUsxejZC?=
 =?utf-8?B?Vm8vSmljNk9nNmRiSktrT1dJUExYWlRsUzFVUUtkLytTWXlsQmNHUldoV3VS?=
 =?utf-8?B?eElpdzZTWmRzdnFweU03ZkUvejB0R0VCN2RzV3JuTWJFL2pPNkxSN01vY2c4?=
 =?utf-8?B?RzFYMTUwN29EWWF2OUlmMHhYVmlYQ2tDdERZcURYeGhielhCMVpMWWlyenU1?=
 =?utf-8?B?b1pZWWlYd1J4QlJQeUllZVdjeSs1bm54UW5GUUxuS0pnZklUeDZDdzhzUExw?=
 =?utf-8?B?b0xzL011UFdFZ0tsWlphODNqQ0MzREF1WnRWK2JOeHVENUM1RkxibEVuZ3NO?=
 =?utf-8?B?YzJXYy9ZYmxBVnpzSXFycHpvRE5UNEw0WUpPYmNieExXRzR1cTV1ZThsL0Jj?=
 =?utf-8?B?VFh4RVlqL2VHN3MxdnU1SmVSeExiczd3a0hBZGk1Um9KSXdQTm90ZGk0WWkr?=
 =?utf-8?B?MjFENUllMVc0ek8zZUNrU0pVaFRQeGVvc1Ryd3lPVXRhL2YvdnRrRlkxRm9U?=
 =?utf-8?B?eDkxRVVPSTlxdTlmejZSVk9tMUJFV0xweS9QRWhjOUkwVVlkV2U3VXBmSUxE?=
 =?utf-8?B?MGJ1czh4N3VFSlVjVldJcUczNzFZdngxS1YvM0QzeUhLdHhCeDhHRmRZVjJ1?=
 =?utf-8?B?V2t1QXJoRVJlcURrSkU1dzhIMzVGbzRCV2pEbzhoM2JnWEdoLytWZGRFT2Ri?=
 =?utf-8?B?WHBDZXdTaTYwRDRXbCt1aW5JYmpJUzZvTlR2UEE4UCtlYWFoVzFoUEs5MU55?=
 =?utf-8?B?a3YvcTA2Uit2WHJQTVhqdThzTlE1U0s5TDVhU3F3eVlQK3YrMEdhZXNiVVhY?=
 =?utf-8?B?aDlOZkNKWFNFYzRRcE9TbGNCZjFITDFRYkUram5DdkVneUFvdytqcHFZQnZ1?=
 =?utf-8?B?ajlYcFYzbGpmcFJmcm5qNWdSenpNL3pDa2h4NzZHYmVrKzFvZHNJdFpyMjJp?=
 =?utf-8?B?ZStYZk5vSU9CbGZNOHJMekthOFRRQ3lDZ0FHcENxbm9OWnd1cnVsWE50Um9k?=
 =?utf-8?B?RHBYVGRxMEhJUENiMHZKTW5TN1BBU1F5WlNuYnozNXlZYUhkRUNhRzZrZnVh?=
 =?utf-8?B?TUJUTWFEQkZpSjVYalZTMEdoTGpGWjFGUm1rWVdWeEM3VmQwMFN0V3d4TExU?=
 =?utf-8?B?N2hHNStnb3FDTXNIUXh1Lzk0Ynl3KzBEQmw0QnByUC9rNnFrdkpyV0QrRzFR?=
 =?utf-8?B?d2I2d1YvcTF4cTU4OTN2UVBBS1BqVUlXNlVuV2YvRkRnWTBHaTR2cGFnMkhE?=
 =?utf-8?B?OUtDQXRYdkdQcUN0NjlpYTl6S1NQdThFWFBJL2wyUGVJVHVZY0VTVmZVV2th?=
 =?utf-8?B?Rml1YUdTeXBNUjdjeUs3SC9wakhGQjZRaGNkeDNTV3NsQUxmSWZWZ0YwK05M?=
 =?utf-8?B?WFNXS0hUby90V1BoRXJPREZzYjNYclFHLy84UnFUWWtvSEwyYUFjSFIyV0hG?=
 =?utf-8?B?QTJ4d0JVNDNvb1FOT1RCYklPL2hNN0kwTjc0SUhhclRBMTgvYWZBVkZhRTB4?=
 =?utf-8?B?ZU9NVU1VNlFZVmtVS2lLS1oxRlpIeEhUQXJXa1BLZmF6L083VzFkOTJQWUpJ?=
 =?utf-8?B?Q1g5dmc2VHhaWk0rb3huZ0hXM3l0SmsvYm9KakE4dFIxbnNoSmtZNFIyNFU3?=
 =?utf-8?B?N1JCSVV5dWp6Zzk0aUdRWFlHbmFockpFR2NyRDZ1UmFwT1RlWkZDeklPUjk4?=
 =?utf-8?B?MG0zVzVYS0ozQzFXMnA4bHhkT0YyWFVodXM2RmVoTytQRWhrUDFraFRMLzhT?=
 =?utf-8?B?T25tN2JNVm53eFA4VVIrQ3huYWVxUUpjVFFYK0dQaWxOU2J2RDdZN241Zmpa?=
 =?utf-8?Q?H+weXwmyvLJFyiUfA2?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7a66be3e-9a7e-4d9b-8b09-08de3f331188
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB8476.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Dec 2025 19:16:10.5120 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1o6h9EqDv2QAQH/H4BF7elwXMTR84JsGc0LLA69T6QedADMYXVz0Y8D1WPMSQ0e1Jp+GQXuTlJ1saYgwsFtRDw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6187
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

Reviewed-by: Alex Hung <alex.hung@amd.com>

On 12/19/25 04:49, Jani Nikula wrote:
> There is no real reason to include drm_colorop.h from drm_atomic.h, as
> drm_atomic_get_{old,new}_colorop_state() have no real reason to be
> static inline.
> 
> Convert the static inlines to proper functions, and drop the include to
> reduce the include dependencies and improve data hiding.
> 
> v2: Fix vkms build failures (Alex)
> 
> Fixes: cfc27680ee20 ("drm/colorop: Introduce new drm_colorop mode object")
> Cc: Simon Ser <contact@emersion.fr>
> Cc: Alex Hung <alex.hung@amd.com>
> Cc: Harry Wentland <harry.wentland@amd.com>
> Cc: Daniel Stone <daniels@collabora.com>
> Cc: Melissa Wen <mwen@igalia.com>
> Cc: Sebastian Wick <sebastian.wick@redhat.com>
> Cc: Alex Hung <alex.hung@amd.com>
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
> 
> ---
> 
> Including the massive Cc list because I don't want to keep doing this
> afterwards. This stuff needs to be blocked and fixed during review. Just
> stop including headers from headers. It's a PITA to clean up.
> ---
>   .../amd/display/amdgpu_dm/amdgpu_dm_color.c   |  3 ++
>   drivers/gpu/drm/drm_atomic.c                  | 32 +++++++++++++++
>   drivers/gpu/drm/drm_atomic_helper.c           |  1 +
>   .../drm/i915/display/intel_display_types.h    |  1 +
>   drivers/gpu/drm/vkms/vkms_composer.c          |  1 +
>   drivers/gpu/drm/vkms/vkms_drv.c               |  1 +
>   include/drm/drm_atomic.h                      | 39 ++++---------------
>   7 files changed, 47 insertions(+), 31 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
> index 1dcc79b35225..20a76d81d532 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
> @@ -23,6 +23,9 @@
>    * Authors: AMD
>    *
>    */
> +
> +#include <drm/drm_colorop.h>
> +
>   #include "amdgpu.h"
>   #include "amdgpu_mode.h"
>   #include "amdgpu_dm.h"
> diff --git a/drivers/gpu/drm/drm_atomic.c b/drivers/gpu/drm/drm_atomic.c
> index 6d3ea8056b60..52738b80ddbe 100644
> --- a/drivers/gpu/drm/drm_atomic.c
> +++ b/drivers/gpu/drm/drm_atomic.c
> @@ -641,6 +641,38 @@ drm_atomic_get_colorop_state(struct drm_atomic_state *state,
>   }
>   EXPORT_SYMBOL(drm_atomic_get_colorop_state);
>   
> +/**
> + * drm_atomic_get_old_colorop_state - get colorop state, if it exists
> + * @state: global atomic state object
> + * @colorop: colorop to grab
> + *
> + * This function returns the old colorop state for the given colorop, or
> + * NULL if the colorop is not part of the global atomic state.
> + */
> +struct drm_colorop_state *
> +drm_atomic_get_old_colorop_state(struct drm_atomic_state *state,
> +				 struct drm_colorop *colorop)
> +{
> +	return state->colorops[drm_colorop_index(colorop)].old_state;
> +}
> +EXPORT_SYMBOL(drm_atomic_get_old_colorop_state);
> +
> +/**
> + * drm_atomic_get_new_colorop_state - get colorop state, if it exists
> + * @state: global atomic state object
> + * @colorop: colorop to grab
> + *
> + * This function returns the new colorop state for the given colorop, or
> + * NULL if the colorop is not part of the global atomic state.
> + */
> +struct drm_colorop_state *
> +drm_atomic_get_new_colorop_state(struct drm_atomic_state *state,
> +				 struct drm_colorop *colorop)
> +{
> +	return state->colorops[drm_colorop_index(colorop)].new_state;
> +}
> +EXPORT_SYMBOL(drm_atomic_get_new_colorop_state);
> +
>   static bool
>   plane_switching_crtc(const struct drm_plane_state *old_plane_state,
>   		     const struct drm_plane_state *new_plane_state)
> diff --git a/drivers/gpu/drm/drm_atomic_helper.c b/drivers/gpu/drm/drm_atomic_helper.c
> index 10adac9397cf..5840e9cc6f66 100644
> --- a/drivers/gpu/drm/drm_atomic_helper.c
> +++ b/drivers/gpu/drm/drm_atomic_helper.c
> @@ -34,6 +34,7 @@
>   #include <drm/drm_atomic_uapi.h>
>   #include <drm/drm_blend.h>
>   #include <drm/drm_bridge.h>
> +#include <drm/drm_colorop.h>
>   #include <drm/drm_damage_helper.h>
>   #include <drm/drm_device.h>
>   #include <drm/drm_drv.h>
> diff --git a/drivers/gpu/drm/i915/display/intel_display_types.h b/drivers/gpu/drm/i915/display/intel_display_types.h
> index 6ff53cd58052..eb2e3f1e83c9 100644
> --- a/drivers/gpu/drm/i915/display/intel_display_types.h
> +++ b/drivers/gpu/drm/i915/display/intel_display_types.h
> @@ -34,6 +34,7 @@
>   #include <drm/display/drm_dp_tunnel.h>
>   #include <drm/display/drm_dsc.h>
>   #include <drm/drm_atomic.h>
> +#include <drm/drm_colorop.h>
>   #include <drm/drm_crtc.h>
>   #include <drm/drm_encoder.h>
>   #include <drm/drm_framebuffer.h>
> diff --git a/drivers/gpu/drm/vkms/vkms_composer.c b/drivers/gpu/drm/vkms/vkms_composer.c
> index 3cf3f26e0d8e..cd85de4ffd03 100644
> --- a/drivers/gpu/drm/vkms/vkms_composer.c
> +++ b/drivers/gpu/drm/vkms/vkms_composer.c
> @@ -5,6 +5,7 @@
>   #include <drm/drm_atomic.h>
>   #include <drm/drm_atomic_helper.h>
>   #include <drm/drm_blend.h>
> +#include <drm/drm_colorop.h>
>   #include <drm/drm_fourcc.h>
>   #include <drm/drm_fixed.h>
>   #include <drm/drm_gem_framebuffer_helper.h>
> diff --git a/drivers/gpu/drm/vkms/vkms_drv.c b/drivers/gpu/drm/vkms/vkms_drv.c
> index dd1402f43773..434c295f44ba 100644
> --- a/drivers/gpu/drm/vkms/vkms_drv.c
> +++ b/drivers/gpu/drm/vkms/vkms_drv.c
> @@ -17,6 +17,7 @@
>   #include <drm/drm_gem.h>
>   #include <drm/drm_atomic.h>
>   #include <drm/drm_atomic_helper.h>
> +#include <drm/drm_colorop.h>
>   #include <drm/drm_drv.h>
>   #include <drm/drm_fbdev_shmem.h>
>   #include <drm/drm_file.h>
> diff --git a/include/drm/drm_atomic.h b/include/drm/drm_atomic.h
> index 74ce26fa8838..178f8f62c80f 100644
> --- a/include/drm/drm_atomic.h
> +++ b/include/drm/drm_atomic.h
> @@ -30,7 +30,6 @@
>   
>   #include <drm/drm_crtc.h>
>   #include <drm/drm_util.h>
> -#include <drm/drm_colorop.h>
>   
>   /**
>    * struct drm_crtc_commit - track modeset commits on a CRTC
> @@ -712,6 +711,14 @@ drm_atomic_get_plane_state(struct drm_atomic_state *state,
>   struct drm_colorop_state *
>   drm_atomic_get_colorop_state(struct drm_atomic_state *state,
>   			     struct drm_colorop *colorop);
> +
> +struct drm_colorop_state *
> +drm_atomic_get_old_colorop_state(struct drm_atomic_state *state,
> +				 struct drm_colorop *colorop);
> +struct drm_colorop_state *
> +drm_atomic_get_new_colorop_state(struct drm_atomic_state *state,
> +				 struct drm_colorop *colorop);
> +
>   struct drm_connector_state * __must_check
>   drm_atomic_get_connector_state(struct drm_atomic_state *state,
>   			       struct drm_connector *connector);
> @@ -808,36 +815,6 @@ drm_atomic_get_new_plane_state(const struct drm_atomic_state *state,
>   	return state->planes[drm_plane_index(plane)].new_state;
>   }
>   
> -/**
> - * drm_atomic_get_old_colorop_state - get colorop state, if it exists
> - * @state: global atomic state object
> - * @colorop: colorop to grab
> - *
> - * This function returns the old colorop state for the given colorop, or
> - * NULL if the colorop is not part of the global atomic state.
> - */
> -static inline struct drm_colorop_state *
> -drm_atomic_get_old_colorop_state(struct drm_atomic_state *state,
> -				 struct drm_colorop *colorop)
> -{
> -	return state->colorops[drm_colorop_index(colorop)].old_state;
> -}
> -
> -/**
> - * drm_atomic_get_new_colorop_state - get colorop state, if it exists
> - * @state: global atomic state object
> - * @colorop: colorop to grab
> - *
> - * This function returns the new colorop state for the given colorop, or
> - * NULL if the colorop is not part of the global atomic state.
> - */
> -static inline struct drm_colorop_state *
> -drm_atomic_get_new_colorop_state(struct drm_atomic_state *state,
> -				 struct drm_colorop *colorop)
> -{
> -	return state->colorops[drm_colorop_index(colorop)].new_state;
> -}
> -
>   /**
>    * drm_atomic_get_old_connector_state - get connector state, if it exists
>    * @state: global atomic state object

