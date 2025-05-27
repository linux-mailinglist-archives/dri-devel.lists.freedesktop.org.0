Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D21ACAC467E
	for <lists+dri-devel@lfdr.de>; Tue, 27 May 2025 04:43:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 601ED10E374;
	Tue, 27 May 2025 02:43:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="fAVi2obS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on2069.outbound.protection.outlook.com [40.107.95.69])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 695E110E3B4;
 Tue, 27 May 2025 02:42:55 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gcO4zajK0cep1mpj34DdsKLVf5hOsI065/DACJxuAVSkGX4eT4dV85reohrgp/qz99VsnP3wWKQWu/leXy1a3ka+fHrfpNGkBTsqt6QVCnTsQQh/4AGVZKW/3r7+r/K3SDLEmBqSJFlO/ojOdFfCTuD3ar2xcxirixTnlTMALwSZYT+Rg8gqMzgJ4tqN6+lpCDgKBjiik0YA0tUXreGfJzvcbN0vTJ4wMAklGJOkzrAHKsrwidjsD+o1Mn1Qvz5/WJFY/qTtUEb0GEZmEA8wUbncFyWp9hUJBA+Eb34LP4V0gdTWtqF9ZV0/jN1gMhloFmZwzfKKR0Qw8V6gRydZ2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4Ee62RCVni1Z13tRJEgnPFoLB6j2PjkKcM8G0niFY0I=;
 b=cOsiym54PJ5nMtCjgJKdMOMUBwVkTBPZkDOOVG7/iUae3EakPZVdtwAAp14ZiN50h8UGpe5ZSWDK0CtswOU5kXAnnwAimlmHFqgnEcSFiy6pZ56VS951896Fc8DJPsYi2LDFguAtoeEqympmZLfIuiQ8aHvw3j+oMLjDKpKliKsuemyyMkYqYPSfjOD+8EQMJwcOp2Iueq1Osr5T4EcY2EjavdYKo2xKlKRB7LmfhRpngIZpBIJqkyqIQqlp0aFhJtpj/LzAqbkxv/Wn9/3qTSqnTGaftwPQy+MBojB+qHz5Ir3rr/xx6a0Mupq4y8mX6fK67PGdHquiJCAoK72ClQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4Ee62RCVni1Z13tRJEgnPFoLB6j2PjkKcM8G0niFY0I=;
 b=fAVi2obS3K79GO23b7k9OzPXm5USdKITpl+a6r1GLtRLolB6iof72fpcPeoCis64yXYW9PBhK6i3PqjScufh9TCloiCqsd+isRBKY6FqlP4BOUBPsYr4wtGb1elPWLumYsnt5A/kcFbB7FwSMIaIAjzyvvizwyXPcL8ADpM1kJk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB8476.namprd12.prod.outlook.com (2603:10b6:8:17e::15)
 by SA3PR12MB7806.namprd12.prod.outlook.com (2603:10b6:806:31d::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.20; Tue, 27 May
 2025 02:42:48 +0000
Received: from DM4PR12MB8476.namprd12.prod.outlook.com
 ([fe80::2ed6:28e6:241e:7fc1]) by DM4PR12MB8476.namprd12.prod.outlook.com
 ([fe80::2ed6:28e6:241e:7fc1%5]) with mapi id 15.20.8769.022; Tue, 27 May 2025
 02:42:48 +0000
Message-ID: <36b60ced-932f-4ece-b848-d1b3ffe9e4de@amd.com>
Date: Mon, 26 May 2025 20:42:44 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/amd/display: Add null pointer check for
 get_first_active_display()
To: Wentao Liang <vulab@iscas.ac.cn>, harry.wentland@amd.com,
 sunpeng.li@amd.com, Rodrigo.Siqueira@amd.com, alexander.deucher@amd.com,
 christian.koenig@amd.com, Xinhui.Pan@amd.com, crypto@vger.kernel.org,
 airlied@gmail.com, simona@ffwll.ch
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
References: <20250526023732.325-1-vulab@iscas.ac.cn>
Content-Language: en-US
From: Alex Hung <alex.hung@amd.com>
In-Reply-To: <20250526023732.325-1-vulab@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YQZPR01CA0142.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:87::21) To DM4PR12MB8476.namprd12.prod.outlook.com
 (2603:10b6:8:17e::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB8476:EE_|SA3PR12MB7806:EE_
X-MS-Office365-Filtering-Correlation-Id: 66c09413-1d1b-44b2-443d-08dd9cc82aa8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|7053199007|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?U2EvYVd0Q1VqYU1hdms2VlVMR28rWXdCTFdNSU9KRXcxMjVmUVZaajZNQmVS?=
 =?utf-8?B?SjBMbW5nR3kzc2VMZ2QyRlFVYzA5emxyT0VaUkVkNFcyc3pVUWwwVXlkeWpK?=
 =?utf-8?B?cjRkM0h5UzluOEkxYWpGVzZiRExGdmxpeGhFbEY0UlVVeUs4aGhsQW9ySlRq?=
 =?utf-8?B?b1Bua0dURlBHQzUyb1dtQkFuQ0NHQitjaHhiSU5ObitjS0ZYZklPZTlhWFpr?=
 =?utf-8?B?WlJ1TjkxWWZkdHhYUFFrV1YwWlZ1YzV3VjZiZlFlZjU5WnRVQzRLRWVrQU1N?=
 =?utf-8?B?c0o1eitROEU5WlhLVlMrTURJbFlmZ1NhaktqNGNXcTF4azRZakp1ZkMrWERG?=
 =?utf-8?B?b0NBYTZOUzV3OUlLeDJJWHpXY1EzNW5OTVpGTW5idDBZRnA0UEdaY2tNRWF3?=
 =?utf-8?B?eG41TVMyd1ozL1luSXpzM2ptbytzY2JtdzlHU3REU3pPSUhCM09CQTBaMXVK?=
 =?utf-8?B?NUVsTVJ3bWhCMTJwTW5FejNLSi9zeVJ4UEpqMmZlTmUxRmxPRng5MkhscEFW?=
 =?utf-8?B?eS9HRGtZRTlDWWl3MlkxUVhjU2VHZFFOZVVpdzRsNllsZFJlWkpUVlVvbG83?=
 =?utf-8?B?MDJGa1dzOHhBUmtLMlZkUXNzZnN5T0l0OHlTdWJ6cllHVnp2Nlo2cEtlSnhq?=
 =?utf-8?B?QW5vVFBLc0lwOXNoQlF2OUlHdFZ6NS95ei9OcW0rZ1lweUlCM3BYZWVuaTR4?=
 =?utf-8?B?QUh4bm84cTZpZ3UzWlNYQTFKdFc1YzFhbk45SFNjMTIzTlZsWlNhUXl3WjRQ?=
 =?utf-8?B?S0xFVXZyd0ErWTZab2xpQ2xTcmRRb0ZrRDRnUzd6OGZEMTA1dFJLTHhBSFpl?=
 =?utf-8?B?SUg0d2dDZGtBUThnbnk1TTRWYTJ6RWJ5UVpyQTBPSDMzSldQbWwzQUVCNmxM?=
 =?utf-8?B?dktMTmR3R0xtUlRVMnVVY1AzYzdyeEtja0hPcGJIOUVRcE9vWTRidk40cnli?=
 =?utf-8?B?bGdDQ29SNW11TVZzMnlQK0tiK1JHamU4OVdWL0t1ZW9iUFh5aGhkUFZkeWhn?=
 =?utf-8?B?cC8zdkhqQjFNWlc1SWdGblc5T3NPUFp6UnlHckNKR2R6WXdkcGhLNVdHblRy?=
 =?utf-8?B?ZTZnYnVwS0NDNlIzNGMxcEJMTzJzellHWWNibU1ZWVRUTm1xMnZyR2JFSmFl?=
 =?utf-8?B?OCtDdUFtQXVnSmhIeEttdGx3cktxV0x5anM3MFVsZmdURU1zNHA5THBvd3E0?=
 =?utf-8?B?KzI0OGxrTDJFSDRodlMrMFdyMURoWnI4d2pPRGpQWnBtSjJMSENPcmVEQm1W?=
 =?utf-8?B?c1lJdi8vWTVsanFTWENYVi83TzdYbStudC9LK3VtaDd0Smt1UHV2aUNVZWFy?=
 =?utf-8?B?cGF4Tk9yQ0RSSjhSR05LNWFvdnB6S1VQZXdqaERKWWpzWTJjS0E5aEU4YmFl?=
 =?utf-8?B?bVBTalhEVHdrd09nY0VPVnl4SkpIWkpuOEhpUjkrQXZndzFGNm1udU5ld2tz?=
 =?utf-8?B?QmlPL1V6YVJWc3ZDUjlKakRiSVVMTHhSaTBwVVpBU0ZHUk1ST0FiMkljUktE?=
 =?utf-8?B?K1pNZmxlZnYyUDl5K1JFV1lDUC9zZjlJaElicXpOTVlwZ3F6Zk1NNjNhTjdG?=
 =?utf-8?B?OHJKMW5xVzQrTklpTEZiTUFOSlhOTGdxN2FCVUZXaU9qcm1hbzJldm13ZFBD?=
 =?utf-8?B?aWpuMTZhRzh0cUhBeFZBYVJLc25lZ2VRUSt0bFpJK2pCYzNnbk5xRFZzMFBZ?=
 =?utf-8?B?Yk0reCtkcTdZK2Y0emVHZklmVnFWb2dHak0xcm1wVHpaZzFzU1NTL1FzbUU2?=
 =?utf-8?B?Wlo4VDdXS29ZWEtkaHNlZDA0T3VjbmpjSHNMM2lYOG90dG1QandRQjZLR2dT?=
 =?utf-8?B?OThsbzFPUFJnZW9ONFpuT2p5eTk1OTBJamYydjhoZ2NpVG5FQ0dIWHRIbTFo?=
 =?utf-8?B?QVZWL2NoT0NGN2ZTSUtyMk82ck1KaEtjTjVmSXNHUE9Lelc1eTBTKzVKbXpv?=
 =?utf-8?B?SUxpaEZkUmVqMEJyUFNvaTFlZmRVdHY3TXhiWEh2enVPQWRBaE5mbzgrTkRa?=
 =?utf-8?B?VFhuTW9aZDNBPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB8476.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(7053199007)(921020); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RWVTbDY4amhnT2hhWkU4RGRJU2ppUmFBY25TL0lFZE1TaE1nRnhBWWRVL0U2?=
 =?utf-8?B?YmRWdlFhNzV4ajQ1T1VHbC9uVUEzdXlQb1Z3R0hMd2w3T2ZqMDBFdnk4NGlK?=
 =?utf-8?B?eXFuQkpnY1pLOHNqd1p2Q1hWZFBwejVXLy9BeWFoUE1DYkx0Mk9kSVdFckFi?=
 =?utf-8?B?eG1RUmw4RWk1ekNsSkRzQ2s0VnBOSlNjcmI2S2tHUHFDa0pMaXNrakVRS1R5?=
 =?utf-8?B?NGppbE5HU0g5dVk4U1NHZ01oS2o0N2dpQjl3WG1iZVpLSjYyR3Jvd3d1STh6?=
 =?utf-8?B?Uy9wd1NISGVZWDlFQUJlVktFQm9ObXZNWW1JbE9RSFN4YVNkdngwdkNLd1ZR?=
 =?utf-8?B?Znd6dmRNTEkybHQ5S0JjQk1BMEhoNWlmcVM3MWRJR2RaR3lJcWY0SkZxdG83?=
 =?utf-8?B?aGc2OXNMeEMwd3pTa1hpeWxFaE54cHF0MFQvc1FrOEFJWGtseVlHM2ZjNldF?=
 =?utf-8?B?WmxOdnBvOVZBL2RFOStTbXQyaHNtUFMrV0l0eVh4K3JBc1pNK2xZZ3VDLytn?=
 =?utf-8?B?bXNUUDRpOUtQbUpGb3Bva2dvMXQvTkQrb01qQU12ekZySXlLSVhDYkkrcTJC?=
 =?utf-8?B?TlpjWlJneStGamZ1QmFmU1B5RFY1R204TFFXRlg2c0h2c0kxSC9VRSs5NDlN?=
 =?utf-8?B?MkdGUytJcnNzNFQwQjg2aE9CS010Y2JnRnI4Yk9lRW9sV2VqeDNhdHU5TUdO?=
 =?utf-8?B?WjBUV0VrUXVqVEM2U3FTWlhzNm40eDBPZkJFVXdEaXJuZWZUVjRCWTNhSnZ5?=
 =?utf-8?B?M2JrbCtwa0VUd1hiSFJiWWJiMCtSNW5reXVlZGVmVjJWT1F1Z05HNVV3Sk5U?=
 =?utf-8?B?OXdtVE44MSs5SGZONmREWFFoWTg5Z2RVOXlXeTlFWTdibVREd3lUWmUwOGtB?=
 =?utf-8?B?b1pZRmI5dTM5WUxWMEd3V3h4MFZOVkRnaCs5Vk9ocm1JQVhtMk1TM1Vycllq?=
 =?utf-8?B?VHJ5TmQrT3FGSGdSUnVpZHVJbi9OOGZZc1NrS3ZMWFpYYmNIZ09mZDZpZTkx?=
 =?utf-8?B?ODlBVGdlRWMzNk5NYno3Tzkwb0JLVnhhTzU1RzZRaG04T3ZzNXBHc3dGMkd2?=
 =?utf-8?B?THpLZWJBT0puYVlOV0ZpV2JnMC9MZU5HWGhGNkR1ZDQrcmRtVUNTSUUzc0N6?=
 =?utf-8?B?QmZWT3NKTWN3SDdWeEJVU2R1djNNUDg1N3o5aEpNUU9YODk1a2xsMGczKzhG?=
 =?utf-8?B?WG5qU3I4RXVBYmhGenBMU3lQZ3Y2WUdRWHFLWkdYSXNoNW1DL3lqUGRyS1ZK?=
 =?utf-8?B?Z1lpWlliZzBNSGUvaC9ZNmhFR3pNcGkzRnhTVmFvc09VQWEyOTdBTkNxWlNx?=
 =?utf-8?B?dE1KL2ZLQkdIblV2YnV2bHVTeXkwMTl3aHRJQ2YzY3ErVlVRd3Y0ekl1TFpj?=
 =?utf-8?B?YjY3NEtDUzhjS2haMzZoNE14U00xWSs0Szd5YkR0Ynp5OTVtekR5aEFwMkxB?=
 =?utf-8?B?UTBtZ3RnTzYyczVobENKd1EvMGl2VWZyaE45RmxZSlA3L09Md212NEVyOUxW?=
 =?utf-8?B?Y3kxWnRYb08vek0yWFJtVTQ4Q3poalJ3eHArRmFONWNnekVwaXQ5NUxvOER4?=
 =?utf-8?B?NVJNbm13VXk3Um5ZM1BYOEEvOUg4VmFSVGNUekloOTR0MFZYaVRacy81V0VZ?=
 =?utf-8?B?b29NcFYveHJvUGtZUVhKdGVKMWlCY1g1SXIwVFcrRmRlamVXZW8yNHQ1T0pP?=
 =?utf-8?B?bDF6SktQY0Y4YnltQXVwaGw0K0JmdnU1Z3Z3TnFRTVIzR3BjTkJ3RW9TZlhG?=
 =?utf-8?B?aFAvZkFESWdkMmdzVzQzTXByNjJkZzBoNXFHM1hjU0RmL3ZEd21Qc1JtTzIz?=
 =?utf-8?B?UC96cXp0S3VERVVUQ1BuZDBiQkF5SDBpbmJTaERGUzdhRFpiSkxFTGNnQVdX?=
 =?utf-8?B?Tmo5QlpUVTh5dGtTTjlZdnMzRjlYUnJDbTRuWVBzenIwb0x5eWxyK0RjS29X?=
 =?utf-8?B?ajdsMTR2SXJCNUJMVitxTFpOcHU0RXFIdXNzOW9mSWRnVVNaM2YySEtlU0N2?=
 =?utf-8?B?czYrMWRqYmRHczBaN2dlaWtlMzNab1h6MXdyS0lrdlFrZjhnRkVtcXRDZGQy?=
 =?utf-8?B?K2VuUEVwaGxmY0d5RElPLzdkRUYxNGMwS3pkUFFDaGhkdUpCZ0V2c0lZTjJm?=
 =?utf-8?Q?rR3Z/VGiqWi2duFSqDJe4uVyF?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 66c09413-1d1b-44b2-443d-08dd9cc82aa8
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB8476.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 May 2025 02:42:48.2042 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TZhaTZ0aSlzgf7vw9ofZS641FlPomh4qjCUcZphXeDMLdOAOnMI01iT5JC8YojsjA/x6Qy7mZUxqz5hJG8OwQg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB7806
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

On 5/25/25 20:37, Wentao Liang wrote:
> The function mod_hdcp_hdcp1_enable_encryption() calls the function
> get_first_active_display(), but does not check its return value.
> The return value is a null pointer if the display list is empty.
> This will lead to a null pointer dereference in
> mod_hdcp_hdcp2_enable_encryption().
> 
> Add a null pointer check for get_first_active_display() and return
> MOD_HDCP_STATUS_DISPLAY_NOT_FOUND if the function return null.
> 
> Fixes: 2deade5ede56 ("drm/amd/display: Remove hdcp display state with mst fix")
> Cc: stable@vger.kernel.org # v5.8
> Signed-off-by: Wentao Liang <vulab@iscas.ac.cn>
> ---
>   drivers/gpu/drm/amd/display/modules/hdcp/hdcp_psp.c | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/gpu/drm/amd/display/modules/hdcp/hdcp_psp.c b/drivers/gpu/drm/amd/display/modules/hdcp/hdcp_psp.c
> index 8c137d7c032e..e58e7b93810b 100644
> --- a/drivers/gpu/drm/amd/display/modules/hdcp/hdcp_psp.c
> +++ b/drivers/gpu/drm/amd/display/modules/hdcp/hdcp_psp.c
> @@ -368,6 +368,9 @@ enum mod_hdcp_status mod_hdcp_hdcp1_enable_encryption(struct mod_hdcp *hdcp)
>   	struct mod_hdcp_display *display = get_first_active_display(hdcp);
>   	enum mod_hdcp_status status = MOD_HDCP_STATUS_SUCCESS;
>   
> +	if (!display)
> +		return MOD_HDCP_STATUS_DISPLAY_NOT_FOUND;
> +
>   	mutex_lock(&psp->hdcp_context.mutex);
>   	hdcp_cmd = (struct ta_hdcp_shared_memory *)psp->hdcp_context.context.mem_context.shared_buf;
>   	memset(hdcp_cmd, 0, sizeof(struct ta_hdcp_shared_memory));

