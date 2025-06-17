Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 15A24ADCC26
	for <lists+dri-devel@lfdr.de>; Tue, 17 Jun 2025 15:00:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4AE8010E629;
	Tue, 17 Jun 2025 13:00:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="FMIMivTv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2073.outbound.protection.outlook.com [40.107.223.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB747890EA;
 Tue, 17 Jun 2025 13:00:03 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BzBUUcikR68p/sofHO9Ra6drdWst5BGUr+yVmQ7HdvzGACCa7YMnldHvVCyX0P4An6uTONwF8xr/iI8kqIZoMUKMLDZyA48gvjqE/W2n/K4nG5mgFBWnOM5tqpJeS2AohoTPcHRQjsuBwdFekEL0Nm6Px1oFVk6OAWlKYbR69vzfiqzvSXkhuoAFLukWPwsStxY5pwewENohxx4SXybe3ZlzMPDlcID68RuyAFHbcsX4GWpNkLZjJz5xF9LfOBpKNhT+tQBvp4eS47qIo0uIYy67Z826XIa+Gpesuu8QfZeoedQiuKZW+2Jdfu50U5+lzbqOxzzf/NtBNqxab+5VNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=efBml/0dFcf7nUBqkKfM1wECJjNM32QC+5SKFpDKAug=;
 b=YXyZzd8HZFcd5tJUYUWqhQLk/+xHgKz66x0AzpKAy0uUkWm8F502xYdN3bQ3huEjxsFZCLb9alguhYdmVo7pjJwLFTwykltc1EF9pM2TB7nrWf/4RNjJff2OMu1RjXGIaDYLNa3TrjNfUmV+l7xTxAn+AvjwSsLqt6y1wqwH3rm4YVwij63giaKXAfzqr+Qneoe5WZtzsO73o7tRIETlGIO7ts9KU69if8cnBSY67NLB0/U4pIHmxx64GpAosbBbDJ9HAO8RXaLkMrD5VjyZoRTu54S22J/wtOcF9AVCAo1cVegRM6DappeRlrqqakCJFTA+xzicTQtKJnoKgg5+ng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=efBml/0dFcf7nUBqkKfM1wECJjNM32QC+5SKFpDKAug=;
 b=FMIMivTvokdE5oMRXldNE3uViUdM6B0B//4GcV1ph8/g3Sq4HbFbONoqZPAoSekFLXJOn3oTdwZlc6U5R1VmwM4mg1y01K1FbQA3WlbSIHCSDdHhJk2A3u62p1zObIbj81y0zgPNUjvUZlNoQsWVng1ab9EAK8wzuLkE+7kY7Ws=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by CY3PR12MB9655.namprd12.prod.outlook.com (2603:10b6:930:100::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.29; Tue, 17 Jun
 2025 13:00:01 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%7]) with mapi id 15.20.8722.031; Tue, 17 Jun 2025
 13:00:01 +0000
Message-ID: <c467ec0f-21fc-4079-bc2d-64dbeba2f876@amd.com>
Date: Tue, 17 Jun 2025 14:59:54 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 3/6] drm: Create a task info option for wedge events
To: =?UTF-8?Q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>,
 Alex Deucher <alexander.deucher@amd.com>, siqueira@igalia.com,
 airlied@gmail.com, simona@ffwll.ch, Raag Jadav <raag.jadav@intel.com>,
 rodrigo.vivi@intel.com, jani.nikula@linux.intel.com,
 Xaver Hugl <xaver.hugl@gmail.com>,
 Krzysztof Karas <krzysztof.karas@intel.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 kernel-dev@igalia.com, amd-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
References: <20250617124949.2151549-1-andrealmeid@igalia.com>
 <20250617124949.2151549-4-andrealmeid@igalia.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20250617124949.2151549-4-andrealmeid@igalia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BL1PR13CA0251.namprd13.prod.outlook.com
 (2603:10b6:208:2ba::16) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|CY3PR12MB9655:EE_
X-MS-Office365-Filtering-Correlation-Id: 6b5b2a74-cc9d-49fe-644a-08ddad9edebe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|7416014|921020|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?N1doazdsS0w5T25YdG9MYnB4UGZsNkFPZG1FTjc3dHVVU1pzWElzd0cyL3lF?=
 =?utf-8?B?cjJwVWdqbC9yb2p3TVcxS0FCUTMrOGlqL3VIQVlKY2xQcGdDZkNMOWF0b0Jr?=
 =?utf-8?B?ZTR6RTUwR0RsVUprYjZGbCthY3AvVnNDSnUrL2F1THgvZk1rQnF2ZWhmcG1J?=
 =?utf-8?B?WVRmdG45cHR1alZsWE9DQ0YzenhNR0JtYmZTR01wdXRMbGI4V285YzdhZDhI?=
 =?utf-8?B?UXdFQnZIdkp5b1d4K3pGM1gvWG5RdWY1MEE1K0VRQmpEUGJSRkx2Sm9ua0ZR?=
 =?utf-8?B?ekgyWWl3eFNTN0M3S1BVUXBmN2YzZ0ZTV1FLNlozYytScEE3YXFzeXhuUUpQ?=
 =?utf-8?B?WXllSisrc0pDdmxEdVhzUHJ4dEdWU3FPNGN1QWppcEw1elpsV3JTOFdWbGZR?=
 =?utf-8?B?UlUzZXlVYjQyTWFxVzU5ck81YkdzMzVjUm9BT1l0d1pJTHNOdjRvSFNxdGNi?=
 =?utf-8?B?WCtOSUNScFRKU2ZzWkN6V3JDM2szNVhqYXlxeFYza1ZWY1FiakhWVjdqMU9S?=
 =?utf-8?B?UVlHMjVhMlYyNnRKdmYyV0NCSTBFdVBVeU5sRDE4WHUzS3BmTVBRd1grTU1T?=
 =?utf-8?B?RWdpK2JkcWNPQjNHS0swVUlCY0hEVEc3TkRBcWJja1NXdWNwQTJhcG1DOEM5?=
 =?utf-8?B?Y25yeHY3bTR0RTFqNUdsWFBrVmZDZkROVCtJenhhcjMwL3FMMFVlWjZpNjd3?=
 =?utf-8?B?bWx0cmVpeldNWW51aUNPZ2c1U1RqTXZyZFFaaDJBMW5DZFltYTBBeUtkNVZi?=
 =?utf-8?B?WVRYQnYzV1FPazRYcGpyYldObjNuK1J4czZWd21GL0hGdnN6ZjBCWi9YQzVH?=
 =?utf-8?B?bW9mZkJxb3VwVHFCblNtS2FuNjlDenFmMkYzSHZQUWQrbXE2bmFjUjJtR21v?=
 =?utf-8?B?OG1aR3ZwRThkWTE1TDFtekdzazQ0Z0JadnhVWVdtbWxNcXA4T0xZZUNrekI3?=
 =?utf-8?B?TkxNSGF3NkRQa1hBUnJnYjJyRGxRbjY4cU5rcC9jSG5MOCtBN0V3U29JTjlu?=
 =?utf-8?B?dHVYSjVNdUVwNTU0OFc2QnBWbWZYMWhGZkpKT0dONkx3WjJ0bWhEbW9RcFE2?=
 =?utf-8?B?UXpMbGRhTzZVdzlwbkNjSVNCZVVhTEk3Z1V0NzlLeGY4SWtqQWNQRTVLTUM4?=
 =?utf-8?B?a0hXUnJhd2RUNE5INnNNT0dCd1hjMGhxNFNNcXpLOFNHL0Vvb3hkbWZtb1g0?=
 =?utf-8?B?aGxmYk1VZ29oM2l4YmVjMXhKWVpkRUN0amZSSWxTN1M4Sk82c2RGTlYrSm9t?=
 =?utf-8?B?Rkg2SlZDUGR0UUFRcWw5WDFsR1ZYMk1BeFFGTENIdTlLYTdvdUNRRThUVnI3?=
 =?utf-8?B?SUwwYjZwMXMvejZ5OE1NWVpUVkdpN1NobHp2NStrOHVjdUM3S2FNaks4TmpX?=
 =?utf-8?B?bWRPVURKN0hSUW5MVDZuelpNSGtTdVFGZTBEK3FhL2JYbXRyY29BNkpRQ3NU?=
 =?utf-8?B?Z0lTSzNRQlp3MnZTOVVkcGVSVFlQR2V4b2NUUisvQkRja2drYVl0Z00yN0xL?=
 =?utf-8?B?Q0FmR3hXbVFBNHNYZFFpbXVlUHZiTTVXblU4WFZHcXdFYWFwUVNDUzdiQzFK?=
 =?utf-8?B?eFdZY09TbXZzazNBNHQ1NndheXJEUDJXd21acWNuTnU0aXFKQ0lXNVFvQzd1?=
 =?utf-8?B?MUZJTUNzbHA0b09jb1ZxcXdlS0N2TFRSdW5pSHlNVkZBK0RDWGsrT3Z2aFFY?=
 =?utf-8?B?VDM4TUFpZkdDMnVuWUpTcWR1Q0VhOFl3VGtjdDhYbm8zNTl6aW9wTXZzdHhs?=
 =?utf-8?B?RVNNYnF0ZlRZTDRvd2xLT3BGcHVaODR5UlVWaWNpeU56UGxkaTNhdkZvcjV2?=
 =?utf-8?B?bm9TME0xVU54dnY5aVd4anFzMWlNUmVJaW9HcTA4K01pYjczYm8wMElqeVpr?=
 =?utf-8?B?R2J6L0hWbmRzUlREdVZYSk9uNXpSRW5WQmg1R1pTUk5EcFpMYzVRcnJCNmht?=
 =?utf-8?B?Q1NwTzBYNnNBd2luaWxScUNXR0F0Y0RDM2h4MWlha3dpc084d3ZleFhvcVhi?=
 =?utf-8?B?L0lmNmxSaWZBPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7416014)(921020)(7053199007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?enIrd21yWXB1RmlBZThscm8zeWtpa3ZzN3YyLytYQjdxcUFQQU9lRWF3WXYv?=
 =?utf-8?B?MkJiby9MWmY5Zk50TUJBYm0xeDZOMGhYTUhkd1BrRW45WXNkUTlnQ1NIY2sw?=
 =?utf-8?B?bnBqS2RWaEZtZUtKODJmcERVMSt3QnRVeGcxdjFTMjBpQWpsQlpRL3YwYytT?=
 =?utf-8?B?UG9TaWtRMGtDTGw5ZmNMZm9zZWFXL0FjODRTbDdrRFhBQXBBcUI1MzhITFZa?=
 =?utf-8?B?MW16VGpnMkljZVVHRHNoNTJ2S0xkTWp6bVUwR2kyeXpXUFk1RUhCQ0Jlalpz?=
 =?utf-8?B?WUdCalNRRHNtTW9sdmo3VWJvOFgrZ0NtVTgvNkNUNWtaUnFaeFE5aCtQMkZm?=
 =?utf-8?B?Q21PNnpRRUt0UHRVUThDVVVBZC9uU203ejJnRGhiWTdUWFRzcnJSRXlrZzFJ?=
 =?utf-8?B?TGJ5VnBuNFRQT2JIZW1GdTBuRHNUR0lla0orVy8zTmNQd09wS1pkNDBGVS9R?=
 =?utf-8?B?Y3ZOcWgxQXVDTHlQNlY5VllNcWs0cVMrTERoVGlBZEVVK2xNOHZhSkNGMVR3?=
 =?utf-8?B?bjBrSGl2K1VOR2ZCZnZLMlpONWI3R0M5MldPOU1SSU5SOUEwcEIrMlhoR1Jo?=
 =?utf-8?B?cG90NUV6QnZkS2VwZkxUeWROUTQrNk9adE1PZEpZZU5FRHR3M1pUcStqbmsv?=
 =?utf-8?B?SnFmSTFYaW9qQytJK3AxY0lkWVZPTWwwZmNZMC81Wmxjd0l2THFjTEhGSGZ6?=
 =?utf-8?B?Sm4rSHlsUE4rVGVRWXFrQnJKVUVsK0Z1RU9CMjdrVXczbmQvWm1zMWxMdThM?=
 =?utf-8?B?K2xKRW9acXdYN3NwTFczWnh3QmlyMEhSYUhpK2ZhUmx3UWUwV3JQYzk4WTkv?=
 =?utf-8?B?THI3ZjEyM1JvT3V6MlFZWVh0dHVJZy9jTGNJYlBKNmtwc2QvVFZiZ1VwV0d1?=
 =?utf-8?B?bE51Rkg3ZmJHblhSUzZYWGk0anNOTElhbzdydUFxUXlaYzl1MFVWdkhGUkRi?=
 =?utf-8?B?RXF2QWw3QXYyZDVXNVNXVUdpTXVHYko3cEh0bjc2Y3I2aU1LU0hMWmRCTGlB?=
 =?utf-8?B?L00wQ0FSVnFqOXdrNDVrWlJmYzRISTBZV05RTDVUUkhwNmkxbjc5S2pWTk5K?=
 =?utf-8?B?d0xlbXJCU3dnUFVERGVmSEw0bnEreUVxVEZZUm1BUmUvNlZVVUpxcXphamtZ?=
 =?utf-8?B?ZjJNem9iR216eVpqT0J0QUprbUhGWDBMN0xQU3BIMlFVTytkQ05QM2I1SGVy?=
 =?utf-8?B?S3Izc2FEWHRPbStpNGJ3SjdXS0dXYnRBMU1WNGtNajNaSUdHdmthSzZ3Yit5?=
 =?utf-8?B?d0ZmWEc2YU1EY1JwU0FjQVg0RW0vZ1Jvb2NaVkVoTGZ3UCtmY05HNkJBQllk?=
 =?utf-8?B?NlNlWU9IS0lPR2NGcGQvUkhMOUNQa2ZLb0R0K2t0RG5ndXVqUHpHeE1lSVFt?=
 =?utf-8?B?YUIxZHc5dktqL1hDMFRyaFExWmtLVVoxTlNqZjc4ZDNaa09PekgrWXpwcmJU?=
 =?utf-8?B?dnE5R1ZxOXV4VkQrQno3VFVQUTVld1hqRlpWYXBZNzVBMW8zRXA4eWZTakxI?=
 =?utf-8?B?VnQyTU5ldk8zT3MyREdMNHVuUThKMW9NdEE2VTNZSjYxSmpIOCtrdXh0R1ly?=
 =?utf-8?B?NS8vbXJQSldkMlo1VzhabFN2YUFHMFphTno3RnREZGxncUFoeVhMM1pYMlRH?=
 =?utf-8?B?RzJOZVRpay9FNG52Q1pLRHRzQWxXam5JbEwxc0R2ZFRiMkN3ODBXRDdJaWpV?=
 =?utf-8?B?bFdScU1DTlMzaXlFVXh0dlc4Rk96T0lVMEdrSG5kTVI0WG9SQ21ycXBnaU5M?=
 =?utf-8?B?M0NnZ0NqUUQrRzA1QjFBRWcvRG1sWkdnRU1xdUdzTWFDbXpwYm13dDVLd1E5?=
 =?utf-8?B?M3RNNmZJMDQ3bGlKWU1BOWVyQ3hoSnBQZ251S2pPZ2lVaHlZZkVodUxBTzAx?=
 =?utf-8?B?Z3JFdE4wV3YwcjdjR3hUdThQdFZYdllBM2pQM0tnUU5QY3dyd045OFBpWHVV?=
 =?utf-8?B?dHlhTmJTd2RpUHg2TSthSTdQWWpMTjR5K1hNakprVXhOZXl1L05CN2FKd3o5?=
 =?utf-8?B?UzlkS1ZmVTNWK3p1aDJXeWdXVHN1ZTBFelhYSVRGYWNaWnJKamZYSVVWb3pC?=
 =?utf-8?B?Zk1QaEY4Uk5vRU1BYjNBV0VPMzB6WkZBSU9xcER5MWlRQ09COGVBTGdjQVQv?=
 =?utf-8?Q?VG/nn1bDPd5WP770ADMXqf9DF?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6b5b2a74-cc9d-49fe-644a-08ddad9edebe
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2025 13:00:01.1223 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dukBZizNmDpjw9mvaa0Sc9MKdccwqfQqSzgnFsY+LGWSVs6/v9ZZBIcymDKWQaGE
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY3PR12MB9655
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

On 6/17/25 14:49, André Almeida wrote:
> When a device get wedged, it might be caused by a guilty application.
> For userspace, knowing which task was involved can be useful for some
> situations, like for implementing a policy, logs or for giving a chance
> for the compositor to let the user know what task was involved in the
> problem.  This is an optional argument, when the task info is not
> available, the PID and TASK string won't appear in the event string.
> 
> Sometimes just the PID isn't enough giving that the task might be already
> dead by the time userspace will try to check what was this PID's name,
> so to make the life easier also notify what's the task's name in the user
> event.
> 
> Acked-by: Rodrigo Vivi <rodrigo.vivi@intel.com> (for i915 and xe)
> Reviewed-by: Krzysztof Karas <krzysztof.karas@intel.com>
> Reviewed-by: Raag Jadav <raag.jadav@intel.com>
> Signed-off-by: André Almeida <andrealmeid@igalia.com>

Acked-by: Christian König <christian.koenig@amd.com>

> ---
> v8: Code style changes (Raag)
> v7:
>  - Change `char *comm` to `char comm[TASK_COMM_LEN]`
> v6:
>  - s/cause/involved
>  - drop string initialization
> v5:
>  - s/app/task for struct and commit message as well
>  - move defines to drm_drv.c
>  - validates if comm is not NULL and it's not empty
> v4: s/APP/TASK
> v3: Make comm_string and pid_string empty when there's no app info
> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_device.c |  2 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_job.c    |  2 +-
>  drivers/gpu/drm/drm_drv.c                  | 21 +++++++++++++++++----
>  drivers/gpu/drm/i915/gt/intel_reset.c      |  3 ++-
>  drivers/gpu/drm/xe/xe_device.c             |  3 ++-
>  include/drm/drm_device.h                   |  9 +++++++++
>  include/drm/drm_drv.h                      |  3 ++-
>  7 files changed, 34 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> index e1bab6a96cb6..8a0f36f33f13 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> @@ -6364,7 +6364,7 @@ int amdgpu_device_gpu_recover(struct amdgpu_device *adev,
>  	atomic_set(&adev->reset_domain->reset_res, r);
>  
>  	if (!r)
> -		drm_dev_wedged_event(adev_to_drm(adev), DRM_WEDGE_RECOVERY_NONE);
> +		drm_dev_wedged_event(adev_to_drm(adev), DRM_WEDGE_RECOVERY_NONE, NULL);
>  
>  	return r;
>  }
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
> index 3d887428ca2b..0c1381b527fe 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
> @@ -164,7 +164,7 @@ static enum drm_gpu_sched_stat amdgpu_job_timedout(struct drm_sched_job *s_job)
>  			if (amdgpu_ring_sched_ready(ring))
>  				drm_sched_start(&ring->sched, 0);
>  			dev_err(adev->dev, "Ring %s reset succeeded\n", ring->sched.name);
> -			drm_dev_wedged_event(adev_to_drm(adev), DRM_WEDGE_RECOVERY_NONE);
> +			drm_dev_wedged_event(adev_to_drm(adev), DRM_WEDGE_RECOVERY_NONE, NULL);
>  			goto exit;
>  		}
>  		dev_err(adev->dev, "Ring %s reset failure\n", ring->sched.name);
> diff --git a/drivers/gpu/drm/drm_drv.c b/drivers/gpu/drm/drm_drv.c
> index 56dd61f8e05a..a994da9d9233 100644
> --- a/drivers/gpu/drm/drm_drv.c
> +++ b/drivers/gpu/drm/drm_drv.c
> @@ -34,6 +34,7 @@
>  #include <linux/moduleparam.h>
>  #include <linux/mount.h>
>  #include <linux/pseudo_fs.h>
> +#include <linux/sched.h>
>  #include <linux/slab.h>
>  #include <linux/sprintf.h>
>  #include <linux/srcu.h>
> @@ -538,10 +539,15 @@ static const char *drm_get_wedge_recovery(unsigned int opt)
>  	}
>  }
>  
> +#define WEDGE_STR_LEN	32
> +#define PID_STR_LEN	15
> +#define COMM_STR_LEN	(TASK_COMM_LEN + 5)
> +
>  /**
>   * drm_dev_wedged_event - generate a device wedged uevent
>   * @dev: DRM device
>   * @method: method(s) to be used for recovery
> + * @info: optional information about the guilty task
>   *
>   * This generates a device wedged uevent for the DRM device specified by @dev.
>   * Recovery @method\(s) of choice will be sent in the uevent environment as
> @@ -554,13 +560,13 @@ static const char *drm_get_wedge_recovery(unsigned int opt)
>   *
>   * Returns: 0 on success, negative error code otherwise.
>   */
> -int drm_dev_wedged_event(struct drm_device *dev, unsigned long method)
> +int drm_dev_wedged_event(struct drm_device *dev, unsigned long method,
> +			 struct drm_wedge_task_info *info)
>  {
> +	char event_string[WEDGE_STR_LEN], pid_string[PID_STR_LEN], comm_string[COMM_STR_LEN];
> +	char *envp[] = { event_string, NULL, NULL, NULL };
>  	const char *recovery = NULL;
>  	unsigned int len, opt;
> -	/* Event string length up to 28+ characters with available methods */
> -	char event_string[32];
> -	char *envp[] = { event_string, NULL };
>  
>  	len = scnprintf(event_string, sizeof(event_string), "%s", "WEDGED=");
>  
> @@ -582,6 +588,13 @@ int drm_dev_wedged_event(struct drm_device *dev, unsigned long method)
>  	drm_info(dev, "device wedged, %s\n", method == DRM_WEDGE_RECOVERY_NONE ?
>  		 "but recovered through reset" : "needs recovery");
>  
> +	if (info && (info->comm[0] != '\0') && (info->pid >= 0)) {
> +		snprintf(pid_string, sizeof(pid_string), "PID=%u", info->pid);
> +		snprintf(comm_string, sizeof(comm_string), "TASK=%s", info->comm);
> +		envp[1] = pid_string;
> +		envp[2] = comm_string;
> +	}
> +
>  	return kobject_uevent_env(&dev->primary->kdev->kobj, KOBJ_CHANGE, envp);
>  }
>  EXPORT_SYMBOL(drm_dev_wedged_event);
> diff --git a/drivers/gpu/drm/i915/gt/intel_reset.c b/drivers/gpu/drm/i915/gt/intel_reset.c
> index dbdcfe130ad4..ba1d8fdc3c7b 100644
> --- a/drivers/gpu/drm/i915/gt/intel_reset.c
> +++ b/drivers/gpu/drm/i915/gt/intel_reset.c
> @@ -1448,7 +1448,8 @@ static void intel_gt_reset_global(struct intel_gt *gt,
>  		kobject_uevent_env(kobj, KOBJ_CHANGE, reset_done_event);
>  	else
>  		drm_dev_wedged_event(&gt->i915->drm,
> -				     DRM_WEDGE_RECOVERY_REBIND | DRM_WEDGE_RECOVERY_BUS_RESET);
> +				     DRM_WEDGE_RECOVERY_REBIND | DRM_WEDGE_RECOVERY_BUS_RESET,
> +				     NULL);
>  }
>  
>  /**
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> index c02c4c4e9412..f329613e061f 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -1168,7 +1168,8 @@ void xe_device_declare_wedged(struct xe_device *xe)
>  
>  		/* Notify userspace of wedged device */
>  		drm_dev_wedged_event(&xe->drm,
> -				     DRM_WEDGE_RECOVERY_REBIND | DRM_WEDGE_RECOVERY_BUS_RESET);
> +				     DRM_WEDGE_RECOVERY_REBIND | DRM_WEDGE_RECOVERY_BUS_RESET,
> +				     NULL);
>  	}
>  
>  	for_each_gt(gt, xe, id)
> diff --git a/include/drm/drm_device.h b/include/drm/drm_device.h
> index e2f894f1b90a..08b3b2467c4c 100644
> --- a/include/drm/drm_device.h
> +++ b/include/drm/drm_device.h
> @@ -5,6 +5,7 @@
>  #include <linux/kref.h>
>  #include <linux/mutex.h>
>  #include <linux/idr.h>
> +#include <linux/sched.h>
>  
>  #include <drm/drm_mode_config.h>
>  
> @@ -30,6 +31,14 @@ struct pci_controller;
>  #define DRM_WEDGE_RECOVERY_REBIND	BIT(1)	/* unbind + bind driver */
>  #define DRM_WEDGE_RECOVERY_BUS_RESET	BIT(2)	/* unbind + reset bus device + bind */
>  
> +/**
> + * struct drm_wedge_task_info - information about the guilty task of a wedge dev
> + */
> +struct drm_wedge_task_info {
> +	pid_t pid;
> +	char comm[TASK_COMM_LEN];
> +};
> +
>  /**
>   * enum switch_power_state - power state of drm device
>   */
> diff --git a/include/drm/drm_drv.h b/include/drm/drm_drv.h
> index 63b51942d606..3f76a32d6b84 100644
> --- a/include/drm/drm_drv.h
> +++ b/include/drm/drm_drv.h
> @@ -487,7 +487,8 @@ void drm_put_dev(struct drm_device *dev);
>  bool drm_dev_enter(struct drm_device *dev, int *idx);
>  void drm_dev_exit(int idx);
>  void drm_dev_unplug(struct drm_device *dev);
> -int drm_dev_wedged_event(struct drm_device *dev, unsigned long method);
> +int drm_dev_wedged_event(struct drm_device *dev, unsigned long method,
> +			 struct drm_wedge_task_info *info);
>  
>  /**
>   * drm_dev_is_unplugged - is a DRM device unplugged

