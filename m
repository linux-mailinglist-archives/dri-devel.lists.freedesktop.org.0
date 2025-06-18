Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 70CC9ADEEEF
	for <lists+dri-devel@lfdr.de>; Wed, 18 Jun 2025 16:13:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D145710E848;
	Wed, 18 Jun 2025 14:13:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="G0rcktYk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2040.outbound.protection.outlook.com [40.107.223.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 15A7110E848;
 Wed, 18 Jun 2025 14:13:15 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wVd0vsxSVJd5ZK87NHUGCq224RHksaqnhA5mzIs9Cf3Uyn7SqCw6Ab5+lE8GM0ZMO37c0O4dLNmnTAb/45l2iE4u09X27Sliqz45chO1ZoXPro4obav3W5N7qYoebzz/1vFbFhbdWC4Y6OTPsTEJ9rIwpgOpU/c+vXdevmIGuKr2+S7mh1c4OF+lWWtQyVaevuDTXfhwI3+LuiQsf/paOt1Mk+l2HC9EUE16Wxwlrk0uYNbKM8p32Is8pYp/zzh7s8z8+eFpj1DyuNH+I6G60At4FW5eHaodlR6JQJmmOzoO+9gQwPc264z2fqi60mxykAYPx0kksNiRiYHqL7CZKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vOUTCbHCeZ2QTyrQ8XG1mZoGXh/jA+iTUBbflLVXAVY=;
 b=okVrQL7vTRvOiQKuRNEf4r5AT6D5f5qJSzOyKxIXNaJc0G5/Jl8IMD5EJpScoYoduSFIjS4O3zNtOlIeS7vaeOZearxbOwREIzVEd1GqfYnUEJSWj7sDX/25AXp2QnRtj9SI2lW6xTnb4ZY8S8Fzs2InEC85wKA0761VwUCDj78V9kHJEaT+TwEnnPm+sn+F2oggutekeU+N0C+/TVQHqCw1S0844+bDJRjodDiHiHRp/ouz+aieE/mvUvY+yhAD4X0Q06JDm8EiO0zxsYPyvXdYpdcChQ+0yWJFJoWm6Sj19P5TnVvy31QFYuCpHgIUM5eR0cszErArt5q5irFHjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vOUTCbHCeZ2QTyrQ8XG1mZoGXh/jA+iTUBbflLVXAVY=;
 b=G0rcktYkki6QS0l21Rxy0bVdP+dBOVPHC6Lyk1bhh1SKu3rtuq4ayftkHbtMd/fzyWqhNBA/9oxJkEYpUTdEIAYZ/Q7tu4EHpigsP45HfxFAQcejtY+QF0hIPS5PevJNiVRGhYoAmSMd1tsY+VxRPPFrPUj+HW/pGK6KAE+7up8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by SN7PR12MB8170.namprd12.prod.outlook.com (2603:10b6:806:32c::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.20; Wed, 18 Jun
 2025 14:13:09 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%7]) with mapi id 15.20.8722.031; Wed, 18 Jun 2025
 14:13:08 +0000
Message-ID: <027d5103-8682-439b-8f96-dcf171ea5245@amd.com>
Date: Wed, 18 Jun 2025 16:13:03 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/4] drm: add debugfs support on per client-id basis
To: Sunil Khatri <sunil.khatri@amd.com>, dri-devel@lists.freedesktop.org
Cc: amd-gfx@lists.freedesktop.org, simona@ffwll.ch, tzimmermann@suse.de,
 tursulin@ursulin.net, phasta@kernel.org, dakr@kernel.org
References: <20250618134747.3893138-1-sunil.khatri@amd.com>
 <20250618134747.3893138-2-sunil.khatri@amd.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20250618134747.3893138-2-sunil.khatri@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MN0PR05CA0020.namprd05.prod.outlook.com
 (2603:10b6:208:52c::34) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|SN7PR12MB8170:EE_
X-MS-Office365-Filtering-Correlation-Id: 7a10d065-0932-47e2-a125-08ddae724054
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UkxpYzdLRVFQYStpaDVWWmJibVpPNkxTcWJCK0cvZGpIa2hCNjFSMFVkeFpk?=
 =?utf-8?B?WHlTTnJqVXMvQlM4dEIwcjU1aXI5TWxsT0RLc1ZkZEFzSGoxNjJmSXZocHBY?=
 =?utf-8?B?VkM2U24waXNldFEvTVdmZUJMZTkwRlR6anh0Mlk1V1Nsa2orS3pXVVRXR3pl?=
 =?utf-8?B?bFdWMzl6dDFONVFJclpET2hYVjRxbzBOVDhDS1hSTXcwSmJIU05KZGNkbHRw?=
 =?utf-8?B?aDFlYmhTTXF5OERrNEU3cUVVV2pzZU1NOEVrZ3RpdVh2ZVJIV210VGZkdHg3?=
 =?utf-8?B?OEFJZVdGSC81MCsxUWVtWnp5Z2dHRnArOUFFZWkzRFFwbjhuUjdZalY4OG5v?=
 =?utf-8?B?Rkd2OG1zNnI3TzU0VERacmhpZjY4R3ZlTkZBL29qY3dydXQ3dC9Za1l5UFdv?=
 =?utf-8?B?UndMSGhpdXNlWDFPMTNGcjAzZW9nZE9MWiswNzNSTkZsMWx1ZEJkMWlHT2Za?=
 =?utf-8?B?dUNDZkRLWVpDRmVRMWVZUjVWZDl3NWhuaitYUDcwM2NLVXF4RlA3ZmtpVGRk?=
 =?utf-8?B?ZzA1NXBQalBZZndrdmJrbnozenpVN1NWOEpqYjBSYlpqR0pRb1ZXZXNTb0lY?=
 =?utf-8?B?dHlJZDlPNmNVbnNjbkZnblZmWElTSnBwandGZzAweTB1SC94Q1QrdG1kRU9o?=
 =?utf-8?B?a0ZON2RjZ29xaGVwRDJXU0xUQnZYdDhNZDZkOVhISlRNTVBrZklkTVZzY3RX?=
 =?utf-8?B?N0lXNzRuTkk4bWFTMG03VEJtNkM0VG9iVHNCMkZ3M3dxRnhEQzR6alE5K2d6?=
 =?utf-8?B?MHp5emlBcGNLVVZwajBrQXgrRzdKeWl3TFFHbnBXaUFvYnE3TTFWVTUxVHBL?=
 =?utf-8?B?Wi80LzJJdWhZNy8yQnd6bzJwcTEyYVhHVkI5R2NyRThKZ1VyV2hwcTF5QjhZ?=
 =?utf-8?B?eDNsamU5K3U0TTR3YmpJbFJLaENMWU9kU2V6a1BJMmNXWmNQTlljOUVzNGJY?=
 =?utf-8?B?N1p3Mk9iOU05WVFWSzloKzlhV3BpSHdLS0Z4ajFDZGR6L2xNTE1NVUhkUlhH?=
 =?utf-8?B?em9CWVNyTkJvUHljb3dZWmtIZGl1cURYcitXSllSNjZDMFh0K0tLa0JXaE5J?=
 =?utf-8?B?WnRXODhQVldaWng5MnNmMTFWSUpiOWdoTnZBYjBHdG9Rb2xNbnl1SjFzMzlm?=
 =?utf-8?B?ZXI2amJzR3BUWCtnUVNKbTIvTUVSR0xWTDdCVGRRSVNwRnpFellDTXdsNVBt?=
 =?utf-8?B?VmtwUmhtOUliRHJ6K1JtOUpyN3BLZ2h5c1l4T2lvU2VNT3ptb3ZKdnNHTmhF?=
 =?utf-8?B?c0VCK2hwT0dPSmRvYS9nQjQxZGppUUVkUUxmZUNUYzMvd0J1cEN6U3ArZHpx?=
 =?utf-8?B?UjNjQS9OL2ppVGVEMnpOellqamIzVFN3eks2N2RaMVVDZUhSM1ZDSVpZdVRh?=
 =?utf-8?B?YzFkZTBmdWlVR01SMXVQL1BSd1RSOFJvV3gxaE1iT0tsOEIrWjVTZGJtdVNt?=
 =?utf-8?B?MHh5SnRVSDNTMU9ySVN4a0VCb0FQenV1emFtUHhuSER4emx2WXMvQS9QSW1o?=
 =?utf-8?B?SWpIS3NGbnlJZmlXN3RMKzAwbjZVMDRTZ3hpWmtQUTFYMTY3bVFueGw3R1Fu?=
 =?utf-8?B?ZXpuWGpUTER3QkNLeGlTaGJkSEZSQUs0bjNIS0JiTUcxbXlvM1pIQnM0eHZV?=
 =?utf-8?B?WXA1UUs0MDN0V2h0RVpjYURRMVg1SWtRRVNra0h6cWVkdEdNVWFiS1Y3RG8y?=
 =?utf-8?B?a0tvdnpxT0RDVGVkNEt5R05lUmhYZi9mTHZRbTFuMEhLOFQ1LzY0ejZPVkZW?=
 =?utf-8?B?OExQVVNzQWJCYU5UN1ptTnFIOTJjTFFBc3h2dTBJTi9SSHN3ZlI3YVBxZ2tQ?=
 =?utf-8?B?Q2MrNGJ5UTEvdFRnRVR4OGgva0laY3dQUzU2OVY4TkloSjdITEpXUE9hZ3RE?=
 =?utf-8?B?aG44YTdpS2VhOHJLNitNVXZMVWp0VDlhbnpmdTNxOEtxYkswZ2FYNTVHOFhh?=
 =?utf-8?Q?wkh/Q0wShow=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?d3pwcExRWXBQeDdlTnNtWGtXVUE4UHNkWis0SFBXejRGN2xISlMxdy9lajV6?=
 =?utf-8?B?M1JtZ0ROT0ZGN2tzMzNRRGI0V1ZBeTd2Z1dGQjVtR2dmVHU4eGtZSUdZZy9S?=
 =?utf-8?B?TGErM2RrUFRIZEc4cjhjK0tzN3VFOUZoWkFmQlFFUVVBR25wdGNZSUFPWEd2?=
 =?utf-8?B?SjZ5UXlsMWh4bnd4bGZrOGZqR0ZLQXhMVVpOZ0JHQ0dBcllhWFdZcWZCZGpH?=
 =?utf-8?B?NXlzcm4zNWFDVXA1ek1aZWdoSVlaaGNMWDRDQUZFRy80eUw0WmxHY2tLcklm?=
 =?utf-8?B?bm1qTDNrKytJR3NQSjM2Y2dvNC81blJLZTd2NGJQbi9qSDJUZ1ovSVltN29o?=
 =?utf-8?B?WmZJMTFCUTBISXVsRE9BcmNLN24vR08zU1phTDVjb3VkcXBlcnlzN1hCd3lw?=
 =?utf-8?B?WnNJekNKejRCc24xUG8vbFB4YkZWcUhUUTFXdlBmZjBaT09yUjJpMkt5OW95?=
 =?utf-8?B?UVZoN1FWWk95cW9RK1dqY09UR2c5bzloNEpwQkVQOHhWZ0FhVjU4WGpyMDJL?=
 =?utf-8?B?akc0Yll2RlFvMjhTekkwUlVBdzArNFJURTM5QUNJNGpFWmQ5c1hQWSsxRFZu?=
 =?utf-8?B?YjAyc2JaaHNYRnJXV1NVYllyd0JYSHYyRWpzTVFLbE9IMWJhVDBtZmRkUlRG?=
 =?utf-8?B?amRMNHhXa29ULzdxbVh0dncwWWpQKzJWNVFWVks4VXZzY0l1SlhLK2RiUzVF?=
 =?utf-8?B?OEpnb2phYVRObk5uU3lwRE1lL25DZlM0d1E3SUVwWFZMdGpDRDFBNzZ1Z2hZ?=
 =?utf-8?B?eW9WVkJYSmJFNUxVY3VUekd4U05nZXNZZFRJdk1tSzJBcEhlSW5DWndqQzlC?=
 =?utf-8?B?akp3UUo3azY0SEpwWEpDbVlvWWU1WmpBVVdtSnUwUDF3dmdTcTBEN2Z6bEdv?=
 =?utf-8?B?OTcvOUZNV1B2OTVhT3M2ZEtHY05xMHpKZlpkbVVKcFd2WGwxTDRteWVzbnFI?=
 =?utf-8?B?dTF5d2sxNm9IREp0YUY3SzNiNnNLUFk5UUlLWUVJVzZpeGZnaHk3VHc0Vkl0?=
 =?utf-8?B?bmNPMzBlSUtQY08wTUZLdmcwMEdxV0c5NzdnYTh1SlU1SmU0YlhvbW1TWmh2?=
 =?utf-8?B?WU51YTJ6K0ltWW8rYmE2U2xHUFdhYXdZajRmM2EvM0Vpejgrd2VwdnREVnhP?=
 =?utf-8?B?eGtMYmRZMHNob0hRTmEyNWRFc2d4ekV1M2FnZFZpeHBWaVJhMGZ6RzROcW5r?=
 =?utf-8?B?TTd1YTZQUGNzUnJ1QmF6UUlqZUV2TERSdkxmQUsvZWR1Y0RmQ0hMODVhMlRN?=
 =?utf-8?B?cVpBT1N1b1JvSVZGSFpZK1dnZVlWS21JSGpTcklSbVI1MW0vN2w1YkhKODR5?=
 =?utf-8?B?ZUY0ZDlNVGpKMjNPM29NN2Y2N3lhNUt6dXN5QU8zQlVVbENYd2h0VFVFeDg0?=
 =?utf-8?B?Mk5obHVZN2t3YlJZckpZZ3I5dlVwb2Z1R3dvNjV1SnpkZkh3a0pKWUhmVmZM?=
 =?utf-8?B?REZnemNCSlRNRGNZNnlpRlh4RVVqaXpHV0d4MURKK0xDcFQwWjRvempZaURN?=
 =?utf-8?B?RUduNW5lMTR2NGU0anhFR2x6Z1VwSERGYUJ3S0pXaVYwSXovSU5aL2w4RTJJ?=
 =?utf-8?B?c2loWGZCWHpRMGkrTnhrWVpSeTdFdUlhZ082SXNZcXFSc3J1ejd0QkFJd0Ur?=
 =?utf-8?B?UEdZcEtIaHQ2RFk1N0FLNXdzV1FhUDdscmRPQ2oxbnJ2ZENUSFYzeURZUzBP?=
 =?utf-8?B?bUpSV0FQTlpvQ0JxOW9WWjJuckZyOGxwMVFSM29TQzhPQmJtY0lTdjcwS20v?=
 =?utf-8?B?UkREZnh6QTZyUHRTb083cGJ2Mnlaa0lDRXdpdHZBRExPTXo5T2VISWJYUDdH?=
 =?utf-8?B?NVVSOHJtZG0yN0ZCS3NETm1oajJWM2lCMm5jZkRFSWsyMmFJd1VQVEQzZm04?=
 =?utf-8?B?ZklHcXF1amhva1g4RHVuWndXbmk3R2Zkbi9nVHg2Y3k0bzMxcm05MkY5cDhm?=
 =?utf-8?B?N1dDclYvWlFIdnVQLzhmYkY0MXhnSG1OUlVrbXc4cHljZ1hUa2ZCOEhhUEpS?=
 =?utf-8?B?aDJXdkNjRS9jUjJxeHdaM25laWhmRm9ZN0ZadUxXU1lTYTl5ZWN0aWRBNExK?=
 =?utf-8?B?SGs5bS9KeHlHQy8vNW9KYTNkYjgxQisxdFBUUk5Hams4UzE0TjdEMHc3L2NU?=
 =?utf-8?Q?shWJ8aa0WUHJY/SGQIt+y4Uwn?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7a10d065-0932-47e2-a125-08ddae724054
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jun 2025 14:13:08.7723 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6zsnSjV4SAJ0y9Y7KKzDILLlAXfZi9kkOmJU/TMdVRlb/UyqSzuyt7CbEWlJX5JE
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB8170
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

On 6/18/25 15:47, Sunil Khatri wrote:
> add support to add a directory for each client-id
> with root at the dri level. Since the clients are
> unique and not just related to one single drm device,
> so it makes more sense to add all the client based
> nodes with root as dri.
> 
> Also create a symlink back to the parent drm device
> from each client.
> 
> Signed-off-by: Sunil Khatri <sunil.khatri@amd.com>
> ---
>  drivers/gpu/drm/drm_debugfs.c | 32 ++++++++++++++++++++++++++++++++
>  drivers/gpu/drm/drm_file.c    | 10 ++++++++++
>  include/drm/drm_debugfs.h     | 12 ++++++++++++
>  include/drm/drm_file.h        |  7 +++++++
>  4 files changed, 61 insertions(+)
> 
> diff --git a/drivers/gpu/drm/drm_debugfs.c b/drivers/gpu/drm/drm_debugfs.c
> index 5a33ec299c04..875276d5fb9f 100644
> --- a/drivers/gpu/drm/drm_debugfs.c
> +++ b/drivers/gpu/drm/drm_debugfs.c
> @@ -298,6 +298,38 @@ void drm_debugfs_remove_dir(void)
>  	debugfs_remove(drm_debugfs_root);
>  }
>  
> +int drm_debugfs_clients_add(struct drm_file *file)
> +{
> +	struct drm_device *dev;
> +	char *client_dir, *symlink;
> +
> +	dev = file->minor->dev;
> +
> +	client_dir = kasprintf(GFP_KERNEL, "client-%llu", file->client_id);
> +	if (!client_dir)
> +		return -ENOMEM;
> +
> +	/* Create a debugfs directory for the client in root on drm debugfs */

That comments on what is done, so probably not a good idea.

But we should certainly have some explanation why we do this! Probably best to add some overview under Documentation/gpu.

Apart from that this works technically for me.

Regards,
Christian.


> +	file->debugfs_client = debugfs_create_dir(client_dir, drm_debugfs_root);
> +	kfree(client_dir);
> +
> +	symlink = kasprintf(GFP_KERNEL, "../%s", dev->unique);
> +	if (!symlink)
> +		return -ENOMEM;
> +
> +	/* Create a link from client_id to the drm device this client id belongs to */
> +	debugfs_create_symlink("device", file->debugfs_client, symlink);
> +	kfree(symlink);
> +
> +	return 0;
> +}
> +
> +void drm_debugfs_clients_remove(struct drm_file *file)
> +{
> +	debugfs_remove_recursive(file->debugfs_client);
> +	file->debugfs_client = NULL;
> +}
> +
>  /**
>   * drm_debugfs_dev_init - create debugfs directory for the device
>   * @dev: the device which we want to create the directory for
> diff --git a/drivers/gpu/drm/drm_file.c b/drivers/gpu/drm/drm_file.c
> index 06ba6dcbf5ae..8502c5a630b1 100644
> --- a/drivers/gpu/drm/drm_file.c
> +++ b/drivers/gpu/drm/drm_file.c
> @@ -39,12 +39,14 @@
>  #include <linux/poll.h>
>  #include <linux/slab.h>
>  #include <linux/vga_switcheroo.h>
> +#include <linux/debugfs.h>
>  
>  #include <drm/drm_client_event.h>
>  #include <drm/drm_drv.h>
>  #include <drm/drm_file.h>
>  #include <drm/drm_gem.h>
>  #include <drm/drm_print.h>
> +#include <drm/drm_debugfs.h>
>  
>  #include "drm_crtc_internal.h"
>  #include "drm_internal.h"
> @@ -143,6 +145,13 @@ struct drm_file *drm_file_alloc(struct drm_minor *minor)
>  	rcu_assign_pointer(file->pid, get_pid(task_tgid(current)));
>  	file->minor = minor;
>  
> +	ret = drm_debugfs_clients_add(file);
> +	if (ret) {
> +		put_pid(rcu_access_pointer(file->pid));
> +		kfree(file);
> +		return ERR_PTR(ret);
> +	}
> +
>  	/* for compatibility root is always authenticated */
>  	file->authenticated = capable(CAP_SYS_ADMIN);
>  
> @@ -236,6 +245,7 @@ void drm_file_free(struct drm_file *file)
>  		     atomic_read(&dev->open_count));
>  
>  	drm_events_release(file);
> +	drm_debugfs_clients_remove(file);
>  
>  	if (drm_core_check_feature(dev, DRIVER_MODESET)) {
>  		drm_fb_release(file);
> diff --git a/include/drm/drm_debugfs.h b/include/drm/drm_debugfs.h
> index cf06cee4343f..4bd6cc1d0900 100644
> --- a/include/drm/drm_debugfs.h
> +++ b/include/drm/drm_debugfs.h
> @@ -153,6 +153,9 @@ void drm_debugfs_add_files(struct drm_device *dev,
>  
>  int drm_debugfs_gpuva_info(struct seq_file *m,
>  			   struct drm_gpuvm *gpuvm);
> +
> +int drm_debugfs_clients_add(struct drm_file *file);
> +void drm_debugfs_clients_remove(struct drm_file *file);
>  #else
>  static inline void drm_debugfs_create_files(const struct drm_info_list *files,
>  					    int count, struct dentry *root,
> @@ -181,6 +184,15 @@ static inline int drm_debugfs_gpuva_info(struct seq_file *m,
>  {
>  	return 0;
>  }
> +
> +int drm_debugfs_clients_add(struct drm_file *file)
> +{
> +	return 0;
> +}
> +
> +void drm_debugfs_clients_remove(struct drm_file *file)
> +{
> +}
>  #endif
>  
>  #endif /* _DRM_DEBUGFS_H_ */
> diff --git a/include/drm/drm_file.h b/include/drm/drm_file.h
> index 5c3b2aa3e69d..eab7546aad79 100644
> --- a/include/drm/drm_file.h
> +++ b/include/drm/drm_file.h
> @@ -400,6 +400,13 @@ struct drm_file {
>  	 * @client_name_lock: Protects @client_name.
>  	 */
>  	struct mutex client_name_lock;
> +
> +	/**
> +	 * @debugfs_client:
> +	 *
> +	 * debugfs directory for each client under a drm node.
> +	 */
> +	struct dentry *debugfs_client;
>  };
>  
>  /**

