Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C54CB03B54
	for <lists+dri-devel@lfdr.de>; Mon, 14 Jul 2025 11:50:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 690F310E009;
	Mon, 14 Jul 2025 09:50:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="quTaFx4N";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam02on2065.outbound.protection.outlook.com [40.107.212.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D031C10E009
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Jul 2025 09:50:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=B1oIk1XcEl1L5jNF4xjvmq+Ts9ArCOrEbZEa8OEowtN8SAowbmRvNL9PTkcda2kdN84alHIGlm66G86DWsUrYg/4SBfXZ9h+Sf87ci99+Jg0OFLSG2Sf1ViShqTXRr3IjhC6UKVSRn+dFfqNx7+hR7wRV8hqReGM1IYpkUdd02cOKD5L+sMHWCndPSd9zU27/v5zS2zeFlZFqI6FzGAPAbfESgGedFYCqxZPnK+x6kP/EBqjqT1URNeFlHdJYhQrcEg4iaIbaSypS7/EJgGkMZNtNL1NtoXGFvt7fCPqmVjofZAeymbYBz1Gh6pnm7VW8UcB9z3Eb7Na5O6N/NFbpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aUWN06mtr0Hj76XuMQbHK+VMp1f13yrknBonELd4BAA=;
 b=ufq4ENMoI16j2gC8/FWw/l9oVssqGER9/iWZ41Bj81NGaP2Umzb+h82JB2zIvALADK06KQQtcGCAhWPqE6igkAtw+NKXR3qY7iqz1GrH7mmzO21Tv7rbXChJpwA3JSI1oqffBgqTu1VfLmA1IWuIFe31V84MeVnxZndZgkZ3qrYKHkKa28ZXurMf8Ix+Y4qFCmMjmdJ/G1aLoxXJFX4zj3/HBEap5SjlQbWF8Qj3O0jPn0cS8xzdUviD6LHlCwC58vow7R6bZ0EgCrCbRhzurRo8ZxZSxyXLH+NvGKyL9wgpDKtS1YhzTEWCujDSC+MltmKriSG9SRDI9oHiLYbgUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aUWN06mtr0Hj76XuMQbHK+VMp1f13yrknBonELd4BAA=;
 b=quTaFx4NDyooS5ZVlJxsiurhDaFMR4UGoq69u2ep+ncb5A5LIinc+FZ9qqe86LRaiLAikBtlWYI9lNduXrBOEadI434K5eMpWee3OnF03pzajdQ+k326AtzG7tc5H5k+bLuMfe6YzHbcG5nyXeIf35iEZq/h+FeTPrCYgqPrYe0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by DM4PR12MB6256.namprd12.prod.outlook.com (2603:10b6:8:a3::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8922.32; Mon, 14 Jul 2025 09:50:38 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%5]) with mapi id 15.20.8901.033; Mon, 14 Jul 2025
 09:50:38 +0000
Message-ID: <48c0cbcb-c613-4f0b-b922-d6807f2eefec@amd.com>
Date: Mon, 14 Jul 2025 11:50:32 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] drm: Move drm_gem ioctl kerneldoc to uapi file
To: Simona Vetter <simona.vetter@ffwll.ch>,
 David Francis <David.Francis@amd.com>
Cc: dri-devel@lists.freedesktop.org, tvrtko.ursulin@igalia.com,
 Felix.Kuehling@amd.com, David.YatSin@amd.com, Chris.Freehill@amd.com,
 dcostantino@meta.com, sruffell@meta.com, simona@ffwll.ch,
 mripard@kernel.org, tzimmermann@suse.de
References: <20250711145342.89720-1-David.Francis@amd.com>
 <20250711145342.89720-3-David.Francis@amd.com>
 <aHGIQNEuDM-MgmnZ@phenom.ffwll.local>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <aHGIQNEuDM-MgmnZ@phenom.ffwll.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0323.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:eb::6) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|DM4PR12MB6256:EE_
X-MS-Office365-Filtering-Correlation-Id: d2e20823-b444-425d-8d70-08ddc2bbe2c9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SEhDODZnM01qSzVwNVljS0Fqa0RhWk1jYlFGcXBHRnZCdmZUaXFiRDdlRFRB?=
 =?utf-8?B?UkNVeDI0QW1lVTVrRDZOUmxoWHhwRVBYejB6dXJyZ0xlamEvcnBheWRwSDNs?=
 =?utf-8?B?QnVKOXlISkVvaHdTV0RubG56WGJsLzVVNjVZeDlxNHQyL0lZM2RFZ1ZCOFQ2?=
 =?utf-8?B?SVNQWEREUWVKa3ljbG1DTFNVc1g2MG5JWW05cjZJV1BiSEhmZnlZVXRnMTJz?=
 =?utf-8?B?cmFjcUllTm1tZU5QeXRhZzVUOGNQY1AzTVJGMXhyZXgwL2JSaFFmY3ZvbWhL?=
 =?utf-8?B?NUtmSmNWS09IeDU2YXJYV0p5dks1RGRSeE9SeTFWTkl5MXRncldRaTZBNis5?=
 =?utf-8?B?V3NLbFREMFkweGgvaEpmZ1NodEdCUW05eHVEVjlxR1RqaTViQmRRemQzKzZW?=
 =?utf-8?B?VE1mMW5ZeWQvaThNZFZmeUFvOEM2cWNia1dnYTJZN2ZUeGFONjA5MGtpeTM2?=
 =?utf-8?B?b01obGYwZnFiSUE3bFdscXVGcStqTllTaC9lRHg0YzNKOEgraEdtN3BtcXRV?=
 =?utf-8?B?MytrTVZrZ1ZFU0Q5U0cvcisvWmdqUGl5MVdiTjArdjFMcU1rTSt2Y1ppcUps?=
 =?utf-8?B?bFpTMlFNRzgzYy9jVHhaeSs3emMvOVZwWnJPNitxZkpFUEdabFpWcElEaHhq?=
 =?utf-8?B?NjU4NlZLbTJsMjJiVUpNcm8vdkJYYlVDTDNhZHJaWHcxMHVCWmprNTEvUWky?=
 =?utf-8?B?S2Y3aC9PbEdLZVYrSDhuRFJpTkllN0hHRkx1RXdzM0tzaDFDOHF2ZmFHWGhv?=
 =?utf-8?B?QXdzcmJ1MDJjeGFnTFAwTmV4VVROMkI4Z3g2SUhqNG10ZnJNSGJwS1JxUzlz?=
 =?utf-8?B?bVFjYm5mZXZQU1dsTDdMTnNPRGJGTWE1ZmMrV2dyR2RTdXlIS01QRVNRWkJY?=
 =?utf-8?B?VFA4bjRpb3A0L1BRMEI1eHd6Z3B0OFYzR3VjVEtIYUR0cGJVZHllK2pVb3hm?=
 =?utf-8?B?eGZkcVNQcmlsZno4bU1mQWpjekxjRmlXRWJEbHlNd0tNcmxZNWFlQ1JZc0JM?=
 =?utf-8?B?SHR0NytCOG43OFNrNmx0Z09YclFRNXBneGRFNmFldlNucDMxOFlNeldNZWUw?=
 =?utf-8?B?RUx2UU9oQ2wrNmJIbWVlc2hZSHYxelV5NHNyVXJUUXN5bXI3bVJ1YjNEUk9V?=
 =?utf-8?B?NEgwQmU3N3B4cXliTExZU3hReFcvOW5meVNTWHhrQlMvMjZiaDlOZzVmTDlq?=
 =?utf-8?B?RVQwbXNXbTBGU2srbis0SFlrd2dYYk5UVmErWCtmRHdyWHZYbndtL2srTkFN?=
 =?utf-8?B?ZTJRMTdENDNvanF1V2ttLzFwUkxHaFpFMGNLMU5DQVRoRjRJdTZ0OWtoaDYy?=
 =?utf-8?B?MWlvMEVCNm5SQTJScUN0ZTBtOVBON01RODBybUxZMVAxRjdDQUdkYi9uWWxB?=
 =?utf-8?B?aVRCZkNrTE5QQmFOalhHNkhRaEtqaXVaTkxXdTN5bllYVUNTanVSaE10Q3Zm?=
 =?utf-8?B?WERUQ3RiVUNHSHR5aVdIRnVIcUNQSUlLTTJGODJMbnRwWnM3d0s3bUdib3Q4?=
 =?utf-8?B?VGtnQUh5V0Q2cmt0MmlqYVk3bWRwcDJZSUpVZDdXL1hvN2gwUkxERmFCVU5U?=
 =?utf-8?B?NllYQWdUYll1SE9IbXdLM0pqYnlvc0FCN2NnM0VYd1RLeVd4QWcyd3JrZlBi?=
 =?utf-8?B?TnRiTFF5OUNFSXZ5d0lDQzVidlZZTC82WU1udWZZYVFTZUEzR3QwemEwMGNQ?=
 =?utf-8?B?dEtudUdtMzFPLytsR1NCNC9UUGxhcU5xdE05Ulh3c2NhYTVXWnpFRHBuSm02?=
 =?utf-8?B?azlsNGRRanc3VjFxdzgrbjVseHl5a0VMZU9FdStyQXlPTzBNRURhcUsrM3dp?=
 =?utf-8?B?OGdSUzR2WGZFQVptRzVGRU1Uek5uYXpONE5VdS9qeWpaYWI0L2dZTzZFQVhy?=
 =?utf-8?B?TkdYb1JCNkZidndhbmVzNDFhYUtOYkp2ejdTUkw0Z1JlRG5sVnREaVBNdUdI?=
 =?utf-8?Q?u0+Lif9GFhw=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cm1IQ2plVnpxcE9kcVFNY1gwaW1Fd3NiRWVXVDBZTFVvRmJLeHlvK1VEMW5F?=
 =?utf-8?B?cDdrN21DTnZNVWZSNlpGY3J2a1dmM2wvb3FRTENvTnpnUUtVSi9lWGhmUU9y?=
 =?utf-8?B?TlVSTXhnbWpqYnowaGx0Nnc3UkRxaDVMQjFmeDZENUtNUEZCV1hja3FuZ3pY?=
 =?utf-8?B?ZmxqaTFiTEV5eVAwOWVSa08zRXdaYnBtdnN3WlJKbWU3ZzBLZzVYa3U1c3BP?=
 =?utf-8?B?TTJNMUdpWFlnUEFRakZKNnIyYWl5Sk4yWmZFVnNxeko0a3BxK1k1eTg3SHZD?=
 =?utf-8?B?ZFNJdVhLb01PUW9WbENnTDJTOTNnZEJoQzBXN3RWaVYvMWNDTjlhdnE0eWhO?=
 =?utf-8?B?MWQ5MjdNTVF3T053eXZ3QXB5TXQ4YVlEZE1kSGdKek1zL2JROTQyYjhRR3JH?=
 =?utf-8?B?aHM5MTF3TVFxSVJEM0EwMmIvMzJ4L0tJVjZQZG1ZWFhYK2FCcmlNazl0QXB1?=
 =?utf-8?B?dm1GMEtxc2F3OXVxWUk3S1dhelhCckxrdzhpTlF1STYwNVVwbUViNlVxMG1a?=
 =?utf-8?B?a0IveHdEeVlwKzJ2bllBbFF2d2JFQ1RoQUpvQ1NlZmdsMkliRmtNVHlQRUNM?=
 =?utf-8?B?b0ZuTzVYOG1IZDF1Y2dWVFpobGJHMDV6eW5nbmpweWRaSDN4M0Yxb0F2Y2ZX?=
 =?utf-8?B?SGRiOFJYNXNJMWMvTjRVNnZUKzg5Y3BYZUU1VkV3bkIvUnN0YU9MbWNFeXFt?=
 =?utf-8?B?VXFXU2hudzJOcWk3OGhLRGJ0SzZCVXNtOUp5YTdJU296Y2QrVEtHaTZ2WHVo?=
 =?utf-8?B?dTUzWDdoVm1ORXd6ZWhjOUNieHlHZ1FIYzBKaEFmNnJCZ2dGWGdMbGVES2FP?=
 =?utf-8?B?dnJQM2lvZDAyZnAxcXlKZGs4ZGxkUWdRR2lVVEYvUWZQVFdsSUs0ZEN3YUF1?=
 =?utf-8?B?QkFCRS9QdXFldFBlWXlqTEtXUGNCbEJHWHRkRXU3V3dwb1lwdFpRQ2RTZlhs?=
 =?utf-8?B?UEVubzFzK24vbDUvK0JmcW5wN0dyMlEwNHBtcGhRakNvVExnNHl2c2lUU2d5?=
 =?utf-8?B?Zmxvb1ExMHphajZZWHY5cUMwSHQyaXJYU0dEV2QxWTFvQ1pSSE45RzhabVhy?=
 =?utf-8?B?V1pMdkZIREo3Y1k0T1dnWlF6K2NjTE5hNTd1U1hkYS8yRjh6V3RXSk1rVGNY?=
 =?utf-8?B?MmtpblVGcFljOUp2T0RwNlFMZndhM2JqOThoRUU2dHh0RXZGNStPZ0M4QXA5?=
 =?utf-8?B?SE9OemF1bXliTUwwSC9pR3U4aWJ0Mnc5M2tML0w2V0VhbWlEdWFRVy9hRDJS?=
 =?utf-8?B?UlZoZjNMS05SU2E3NlpiREVzSjR3VGhBcU95ckJqMHhqUHMzSXg0YlhjK0ZF?=
 =?utf-8?B?VHZhd3VxRE1wVWpwdVFNWVJOVWpXbGQ0WXhiSm4wNmIyR1Q3WitUZHp0ZUpi?=
 =?utf-8?B?M24wbk9Qc3gvMUIxMnB1VVMzbmxCN2xZS1Z0TTRSbDZoaGhuaktXQTR4UkdG?=
 =?utf-8?B?NkI4ZDhxSlpsQzZKOXdKSGhZd1dob0graWNsOE5WbE03bCtKTHBVNlJreXlW?=
 =?utf-8?B?Z2srT2w5ZDB3Wm1WclNwMkJzeGtsaE9KZG5nUXpsdEYyOFFlUFdrNm9zd2E3?=
 =?utf-8?B?SkFoQjl5WS8xVEhUMmhBZUpkcGZ2YjhRWTJobkpxOTVKNElyak83MHdRZWhx?=
 =?utf-8?B?VWhvN3NhdHFBZEtsOWxueTVndGJFd1FkQU9KMmk0ZkNTeEdJNTdnTWJyZVVk?=
 =?utf-8?B?R0Jqc2hZWm9VcmJVZ3hRekF5a0FIYnRoektTTkhrRDU0MStDR1FzZW5pNnV0?=
 =?utf-8?B?SUhjRlMwVHU4OGN3Q2ltOWIvOUVIbiswaElLQm5tYnZOMzU5S0pQcnBqc1Zj?=
 =?utf-8?B?VFFxd2JyVVozYzlpdnpDTlhicGI3LzNwRC9EbnJmclFpM1o3TlAzalNBb2M3?=
 =?utf-8?B?Vk9IellRbGw1OGZXSFgzLzVrSWpYb2xCQ3dUejMzV2Z6eXM1bjR2c0J6SkJP?=
 =?utf-8?B?elRLNTdQdnpXVTBySk9DZ2RqcSs5enFRVy96UGRUNDk0NFBna01jYVZWWWNJ?=
 =?utf-8?B?QUd5QVFFUGlnVWV3SjdZSHdEK2ZUYlhNakVmY0lyODY4UlRFWld0U3lnUGdO?=
 =?utf-8?B?cmlTZDYrRzVXcHFxS2dxY1RZTnBrTDJDSm5xdXhmZjF1dzdCQlJ3aFl0d0xG?=
 =?utf-8?Q?bOIs08UdArAGX13p9DaaS9GAP?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d2e20823-b444-425d-8d70-08ddc2bbe2c9
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jul 2025 09:50:37.9466 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3r4A3MILsP36GZDdnLnHgVp2YQtuzC+ugeHToxvYw3yBQ2pXJJMXl3CvSRidEFnx
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6256
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

On 11.07.25 23:55, Simona Vetter wrote:
> On Fri, Jul 11, 2025 at 10:53:42AM -0400, David Francis wrote:
>> The drm_gem ioctls were documented in internal file drm_gem.c
>> instead of uapi header drm.h. Move them there and change to
>> appropriate kerneldoc formatting.
>>
>> Signed-off-by: David Francis <David.Francis@amd.com>
> 
> Thanks a lot for taking care of this!
> 
> Reviewed-by: Simona Vetter <simona.vetter@ffwll.ch>
> 
> I'll leave review for the first patch to folks who care about criu, but it
> looked good to me too.

I will take that as an Acked-by.

Are you ok that we push this into drm-misc-next by the end of the week when we have the IGT test ready?

The patches for the CRIU code are ready and IIRC there will be a merge request made, but it will take quite a while until they are actually merged I think.

Christian.

> -Sima
> 
>> ---
>>  drivers/gpu/drm/drm_gem.c | 30 -----------------------------
>>  include/uapi/drm/drm.h    | 40 +++++++++++++++++++++++++++------------
>>  2 files changed, 28 insertions(+), 42 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/drm_gem.c b/drivers/gpu/drm/drm_gem.c
>> index 3166230d0119..08778a15eefb 100644
>> --- a/drivers/gpu/drm/drm_gem.c
>> +++ b/drivers/gpu/drm/drm_gem.c
>> @@ -820,14 +820,6 @@ long drm_gem_dma_resv_wait(struct drm_file *filep, u32 handle,
>>  }
>>  EXPORT_SYMBOL(drm_gem_dma_resv_wait);
>>  
>> -/**
>> - * drm_gem_close_ioctl - implementation of the GEM_CLOSE ioctl
>> - * @dev: drm_device
>> - * @data: ioctl data
>> - * @file_priv: drm file-private structure
>> - *
>> - * Releases the handle to an mm object.
>> - */
>>  int
>>  drm_gem_close_ioctl(struct drm_device *dev, void *data,
>>  		    struct drm_file *file_priv)
>> @@ -843,17 +835,6 @@ drm_gem_close_ioctl(struct drm_device *dev, void *data,
>>  	return ret;
>>  }
>>  
>> -/**
>> - * drm_gem_flink_ioctl - implementation of the GEM_FLINK ioctl
>> - * @dev: drm_device
>> - * @data: ioctl data
>> - * @file_priv: drm file-private structure
>> - *
>> - * Create a global name for an object, returning the name.
>> - *
>> - * Note that the name does not hold a reference; when the object
>> - * is freed, the name goes away.
>> - */
>>  int
>>  drm_gem_flink_ioctl(struct drm_device *dev, void *data,
>>  		    struct drm_file *file_priv)
>> @@ -893,17 +874,6 @@ drm_gem_flink_ioctl(struct drm_device *dev, void *data,
>>  	return ret;
>>  }
>>  
>> -/**
>> - * drm_gem_open_ioctl - implementation of the GEM_OPEN ioctl
>> - * @dev: drm_device
>> - * @data: ioctl data
>> - * @file_priv: drm file-private structure
>> - *
>> - * Open an object using the global name, returning a handle and the size.
>> - *
>> - * This handle (of course) holds a reference to the object, so the object
>> - * will not go away until the handle is deleted.
>> - */
>>  int
>>  drm_gem_open_ioctl(struct drm_device *dev, void *data,
>>  		   struct drm_file *file_priv)
>> diff --git a/include/uapi/drm/drm.h b/include/uapi/drm/drm.h
>> index e3940b657e16..e512da8f3baf 100644
>> --- a/include/uapi/drm/drm.h
>> +++ b/include/uapi/drm/drm.h
>> @@ -597,31 +597,47 @@ struct drm_set_version {
>>  	int drm_dd_minor;
>>  };
>>  
>> -/* DRM_IOCTL_GEM_CLOSE ioctl argument type */
>> +/**
>> + * struct drm_gem_close - Argument for &DRM_IOCTL_GEM_CLOSE ioctl.
>> + * @handle: Handle of the object to be closed.
>> + * @pad: Padding.
>> + *
>> + * Releases the handle to an mm object.
>> + */
>>  struct drm_gem_close {
>> -	/** Handle of the object to be closed. */
>>  	__u32 handle;
>>  	__u32 pad;
>>  };
>>  
>> -/* DRM_IOCTL_GEM_FLINK ioctl argument type */
>> +/**
>> + * struct drm_gem_flink - Argument for &DRM_IOCTL_GEM_FLINK ioctl.
>> + * @handle: Handle for the object being named.
>> + * @name: Returned global name.
>> + *
>> + * Create a global name for an object, returning the name.
>> + *
>> + * Note that the name does not hold a reference; when the object
>> + * is freed, the name goes away.
>> + */
>>  struct drm_gem_flink {
>> -	/** Handle for the object being named */
>>  	__u32 handle;
>> -
>> -	/** Returned global name */
>>  	__u32 name;
>>  };
>>  
>> -/* DRM_IOCTL_GEM_OPEN ioctl argument type */
>> +/**
>> + * struct drm_gem_open - Argument for &DRM_IOCTL_GEM_OPEN ioctl.
>> + * @name: Name of object being opened.
>> + * @handle: Returned handle for the object.
>> + * @size: Returned size of the object
>> + *
>> + * Open an object using the global name, returning a handle and the size.
>> + *
>> + * This handle (of course) holds a reference to the object, so the object
>> + * will not go away until the handle is deleted.
>> + */
>>  struct drm_gem_open {
>> -	/** Name of object being opened */
>>  	__u32 name;
>> -
>> -	/** Returned handle for the object */
>>  	__u32 handle;
>> -
>> -	/** Returned size of the object */
>>  	__u64 size;
>>  };
>>  
>> -- 
>> 2.34.1
>>
> 

