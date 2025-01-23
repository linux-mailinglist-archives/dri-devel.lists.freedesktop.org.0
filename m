Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 96587A1AAE1
	for <lists+dri-devel@lfdr.de>; Thu, 23 Jan 2025 21:09:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 182B310E3F2;
	Thu, 23 Jan 2025 20:09:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="LOjoWIBv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2043.outbound.protection.outlook.com [40.107.94.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE28010E3EB;
 Thu, 23 Jan 2025 20:09:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=y/K3d0aOMZoje2lcjoVRlQLDvK163uY0BS7aaH/wk6geOfHwiapeH1Nx+wO8ZXmJlg8POJP286uaGckFKLh88NhwH/49h30cPllJG/QBb0UrqSX0bLk7gMy5Id7uneivGaKhxuTCfDRJXqCEWCwArRC9a+aPr6YpOD6ZC2hNvWRs6/uDYxDRGeu4lrgfPZufRu3lHDqJKrcUVhPGMCWkKEAOfoloQzMgVDtlj4iACn4H1qb7SnzYEjuixo/O2EqDyfpH5+YGjRmzKy7TchPxmlbzHP05DgQvdOO7VHtMFWouz5bKYKJV+POuWevdNUeYL0CWRf7J4bbBAHEr/jLSog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gXjs6Vwm/RfHwOyUxX95gznP7U/CUIudCq6Zofxv0Mg=;
 b=cAJjz4zI8ctJZdjsd9zpytY7K0c7Ieq/PaEGA1pumM+1I1ILJg7Yb1KYH2sIdUqiJCr5w8oCFEH4EwAdh1UnQf9pss6G9uBh5OwumPe2yvzXSJvkHQI5tWTqGhV347jUAgHcpm6RFlADr1V9oCEmccjPEMxpfJH5KVadfyjynYoCd3scm9Qy3a4t2p3ZHAYgNqLt6b8p+rrGzgqbyBZmLM8drh7jzp3vv9MC+Q26sHfGCAhn0g11uAWELBScQaBd1lNTAljw7KjEKy2Gd/tfwI/trcnpTjypBFR6ckAq7D7kh60Rw1FuWmWSdPtOWEVFkze34zy/nTJ9DrFw5YOfJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gXjs6Vwm/RfHwOyUxX95gznP7U/CUIudCq6Zofxv0Mg=;
 b=LOjoWIBvP2TpKyw26mfyiilOjry9sTkj3rGV1hqYCCBXrnJGhbzVIqS6oZULAD1271GuTNfCeUEN5mb3Oj3R2akIF3bRxSH9FRBA+EBqDZVQTw3LlMrxaVbq760ZseBXm1kDuikGrWmjfUar8NE+5zJ9Rd8NKztj6WHL0bvHujE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CO6PR12MB5427.namprd12.prod.outlook.com (2603:10b6:5:358::13)
 by SJ1PR12MB6171.namprd12.prod.outlook.com (2603:10b6:a03:45a::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.22; Thu, 23 Jan
 2025 20:09:33 +0000
Received: from CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::1c2f:5c82:2d9c:6062]) by CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::1c2f:5c82:2d9c:6062%4]) with mapi id 15.20.8356.020; Thu, 23 Jan 2025
 20:09:33 +0000
Message-ID: <df2bd171-f154-4913-a3f9-a21dfa2ee08b@amd.com>
Date: Thu, 23 Jan 2025 15:09:30 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [V7 29/45] drm/colorop: Add PQ 125 EOTF and its inverse
To: Pekka Paalanen <pekka.paalanen@haloniitty.fi>,
 Alex Hung <alex.hung@amd.com>
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 wayland-devel@lists.freedesktop.org
References: <20241220043410.416867-1-alex.hung@amd.com>
 <20241220043410.416867-30-alex.hung@amd.com>
 <20250117110401.446619e7@eldfell>
Content-Language: en-US
From: Harry Wentland <harry.wentland@amd.com>
In-Reply-To: <20250117110401.446619e7@eldfell>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YQBP288CA0008.CANP288.PROD.OUTLOOK.COM
 (2603:10b6:c01:6a::20) To CO6PR12MB5427.namprd12.prod.outlook.com
 (2603:10b6:5:358::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR12MB5427:EE_|SJ1PR12MB6171:EE_
X-MS-Office365-Filtering-Correlation-Id: 381d7905-8a23-44cb-a5e3-08dd3be9da2a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NkRCeC9JRDlZMVJFRXJPbEJxRm85dnNRUDNhYm1HV0MwYmFEUGx5TllRYzJR?=
 =?utf-8?B?MlZvdEdEQ0tuVDh3Sm50Qlh5MW9UYUlERk1OcCtqV2g5TWR3Wmp0NE42WlVt?=
 =?utf-8?B?alZKTjk4bWlHdzFVVnFiaXdSZ0E2dm9oSEk3VHNUS3ZOVTMvaHFDVWc1cDlu?=
 =?utf-8?B?cExwdlErSzAxd3VDZ0VhZjhQeUZiNHBpZklQV3MvZkdCdVpqd1RuNUJ2Rkc5?=
 =?utf-8?B?T2JRajByMEpBcGplTGIxL1pGcDhNQjBXd1R4OEFwYTdGOG8zUlVQaG9KeG56?=
 =?utf-8?B?OVFUMHVKZlJKWnF2Q1hsa3dyMDhZRkd4TmFoV1pEVTBobVB1RlVGS2ttY1J5?=
 =?utf-8?B?dTBSR2ZyY3U5ZUp3MndyUVRKZ3cwVHBJbFRhaEVvY2crOHMvVmdGRXQyQXF3?=
 =?utf-8?B?NTdVdGtWeEY1R3VwNDJpaVMwMGpLNEVXRHBDeDQ2azlKb08yREhxU2NQZnZq?=
 =?utf-8?B?QnhuYkRwQ3lJME1wZUtpQ0J4RmQ4b3k1c09CR2V6QWc5T24yQ3h3Tlk3czg4?=
 =?utf-8?B?aXY4d3ZPQmdGeEh4blZUZ01QRk1pbDZwQy9MY0xaSXNnQVNBb2Q4N0xCYzNy?=
 =?utf-8?B?dW41YWwzdGVMQ2txTFo2QllFbWxTTGR4bGpxYjJlNnI4QjJ2aVN3Q0s0Q1Ez?=
 =?utf-8?B?STZ4WWV5UXdHNWRCbXAzb0hIbGFSNTJOTC9UNG9QZ3pTYlN0VXNYbzJBMWdT?=
 =?utf-8?B?L2FPVDI1U1hWRFhUWGdDQlYwV0JvTmpsVEtoRzRxbk40cTZjZ2RSSzQzMVdM?=
 =?utf-8?B?aFlOZjZOanBaMTB0c2pLNWRXdXBSbk8zQ05RK1VydXNoV0h5c1BEN3NRNUY2?=
 =?utf-8?B?dTJ1Y09SNU5xZ1p1YXNqMzBkcC9MVk1KVmgzMnRxZWhXRHFERzl5VmFwL2Mv?=
 =?utf-8?B?YzB2K3dZbFRzOW9vZmpPOGFPT0NrTDV0NnpHR01ESFI2K0Q3U1p5Tmo4bk9a?=
 =?utf-8?B?eU9pMThqVG5aTzZ3MGRXQ3dJVXlZYVplRmszdm5LUEMxRWVMK042YnVjRU1t?=
 =?utf-8?B?VmZ5ekRsSjF0QmJITG4rQXBUTVhuZFFHeWhEcnFwVWdvMjBjRDhaa2V3SEMx?=
 =?utf-8?B?SzNDNTFsV3dabXRUR1FDTCtzMzdpU1lpbm52TExUZTk0UXJCTEk3Z0ZwdnZl?=
 =?utf-8?B?NTlMcVpnUTNWRm56QytlMEw2OFkxTktlakpub1Jtamg3QmEzL3o1WnJKOGVj?=
 =?utf-8?B?N1pKbUJQcU9DT21zTnhTL3h3c0VobElPRkxuYkxob0YzS3luVkRKbHdadWNj?=
 =?utf-8?B?RHdNUEdIMGY1T2dleVZMcnlDd2NqZDFxbnlEK3hGWGNuclUzMVlDMFowdEh3?=
 =?utf-8?B?dHpaeU5XbTgvQnNUN013TmloanNiS29RaUZuNExrTjVmL2dlcFVHdlZNMmo2?=
 =?utf-8?B?Um04WEhwUmxCTGNqMHBSWjFJTzhpZjBTcUU0RmlveHBFTjc1cHFiTTdscDlN?=
 =?utf-8?B?elQ2NHRRK0c0K0crcmFONy9aLzBFa0NoWlljRDQrUnBIZy9WaXp0VVlzV09O?=
 =?utf-8?B?SktNMjlTQlFteWpmaE5CREpJTWZYb1JxbFhtejVycHlzcFN1Q3IxSFNpcEIy?=
 =?utf-8?B?d3ZvY29uYkV2bGNEZzJUTU9iZlJqSzF5OUNzS3BlVWUrc3A3Y2tQTXZBUDZN?=
 =?utf-8?B?NEZ4eUo0WXowYnR1MzJSUlVTRjloZ20yMXphaVoxTnd4U3dIL29BOEVadEhx?=
 =?utf-8?B?VGluY2R5anQ3MkhHMTI2dW43UnN5czJpM09ncFZXSnU3RkE0SkpTVFp6MWgv?=
 =?utf-8?B?Tm5zSEkvWFZsS0cwTUtXOHIrR0M2TlZ0bkZ5SWZTbk9RWmp6M1dTVmhDektJ?=
 =?utf-8?B?Y3VLRWxSMzF4L1hTU1JYUDdvUzZVcFdQQVJNMTNpa0s2WEpVUXgxeDZnR01r?=
 =?utf-8?Q?e9IJIywizogRC?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR12MB5427.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UmJ0b3FGZDJ0YkM4YzMwS0U2VEFvY28zVFBsSWZRUVpjQ1QvMTFjYWhIODdK?=
 =?utf-8?B?YjZHUUQ1RXlKN004aFl1YklFOXZiNzBZd2toZHNBZ1FzVTRGVkNObWcxZDlG?=
 =?utf-8?B?Uk5pSlpJTW1pZGFvcU5yRXJid2g0TkVKQncwVnNwdHpUbDV0STNWejFJd3Vj?=
 =?utf-8?B?a0VkY1Z5UXRTZU8yNHhFY2pDKzhlTUlCSUJUNE1TSFlpcXRFQ1FraXVMZ2xh?=
 =?utf-8?B?eU1WVW5kTG9qR0RUc0YvTnJYbWlTK3lMNFVIWFpZcHplbEFESDNwdTVrbHB5?=
 =?utf-8?B?aXZJclR1cFRoVmRpTEJES2duVEJoaGcyYUV6Q2k2SnhpZ0dLWFdaR3RJcU5y?=
 =?utf-8?B?WmlMQzRqam5HdVhCcWV5dnB6Q0hvdjhsSWhkbjh4RWFtZS9sNVhSOS9vK3Nz?=
 =?utf-8?B?NG5HckhkSTM2TnFLVkhOcFdJVEMrVzZVV1FrSm5SR205K1dJMzNMeUNEVFlO?=
 =?utf-8?B?SjlkcjBtRUdKOTV4b28rbFlQZmo4N0t5bUxuT2lreWVueGVNMDZBTjUxYzZI?=
 =?utf-8?B?dE9ndDJCOE92MXNzNlJxUkVzNlZObzhIQmxiWXU2L21FUVM2dklOM2ZrZEJW?=
 =?utf-8?B?bTZtcmo3dittNGdFWmFIUUgyZEZ2UnlpSHNablYyZzl5dDY2YVRhYWJ1MWl3?=
 =?utf-8?B?cTlRZDdmdE1memh1WU1qeFFsMVB0SnUwVUFGTHhlS1hOUDl4UEhYNmpFNW1X?=
 =?utf-8?B?L0wzazVKYUVKNEF6UkhsUitENW85dWk5WDRmOUJuZVA2N1dSYzNqRzhaTWYw?=
 =?utf-8?B?Rmg4bGs3RGhCQjlTNmNFczg4cjFndERnZitrNVNDaUZ5d1A0UEY5OU9rZVps?=
 =?utf-8?B?aU5VQmY3aExHM2RNUU9TRkRyMjRBRVFHYkdnRjJsZVRhbVNxdTRFNFh0Y25E?=
 =?utf-8?B?djZjV2kySitCYWtGVWFVWEVFblJzY3RIa09vL3JJcnZLOE4xL1NvWkR6aU9D?=
 =?utf-8?B?QlNYVzltQ29mczJUODNDd2V1ckJjRmRXRUI2Zyt3cmdpa0QzYjR6RXdXRFFF?=
 =?utf-8?B?YVkyT25FdWQzMmxTWCt5aFkzYjBqYStGTkd3eWRaR1RtL0xxQXljMVo2R2Zv?=
 =?utf-8?B?WHRaaGhoNk1VZmg2KzMrVTd1NTY0R28rL0VDbFUxTXAxL2FJMGhlZUprLzJa?=
 =?utf-8?B?WSszTTVBRDhOM2VESmRESHpKcU0yYjh5Q3ptbGszSm82WHp6bFdVV0ZIRDZ2?=
 =?utf-8?B?SUNzVXA0OHZOUkpMWlkrdzkzYVNjMXQrT1BNNTAxbzJ4bWdhdkNQY3hKaTJY?=
 =?utf-8?B?eElBK0lKT08xakYvdkUxZmpKSEYzbkdRZWhUUURnb2laVDVWZC8xZ29JT0xi?=
 =?utf-8?B?Y2Zmbk5TWjZDcHNWUWRNS1o5MHBUTUxKcUF4VzBxRWhBYkJxTGVSZFpveDNa?=
 =?utf-8?B?NkxQbHhlR3hRUHZIM3VGbmtCMDU1WlpjUG1ud1dhU3AzczV4bno5NVRmN1V5?=
 =?utf-8?B?aFFXbnQrN1o5SXM2Y21SYml3VW96bkFnZyttZ3NtNloxRC9zczErWWtIcWF0?=
 =?utf-8?B?S200OCtLaHRrN1pub0dmRGgxRyticGJ1SjlURXdpK3NvRTZOYm90c3hEYlNF?=
 =?utf-8?B?RFdGa0hJMjNMQWgybml6K2hvbWJuL3NDcXIyWDF3d2RFY2RieGF3RXlac2JK?=
 =?utf-8?B?ZDNJOHFlMFh2V1o3QmI2cUE0UksyYzMraGl5TFh3dEtIdGIvUG8vUDBDOS9r?=
 =?utf-8?B?TnhtR25ONWJMSnR6L1RuelZHbk1BbTFWbVdNU1dTZldWM2NMQ0lzaW0rV1Vy?=
 =?utf-8?B?RXpHcDhHa0xqaXBxWkdaVXJ2TWswSUVvZ01xNTgzdFlNVHpId1dCRTNkaFNE?=
 =?utf-8?B?MHVaNy9YQzRLSUJXVUxnUzM3dlZDYVYvenlaMEYxV1pKSjlSSnNtcS8rU29v?=
 =?utf-8?B?ZHJHU0dYYzBKQWZjQnV0MmtMTnVUdFl4azV5UndjclEwY2thTldpd3VFOTVn?=
 =?utf-8?B?ZG9NaWM4WEs5alJFYUdkSlV6RWsrcXZKSUhKN2phemtxSytqc2JMWHI3OVQ4?=
 =?utf-8?B?Z0JzaWRXaFhFNllmbGlZdHJjSkhWeWIzaUxTMnlFaHA0NkkxaDhVY0FvUlVv?=
 =?utf-8?B?ZTBCQzhmYmd0ZEJWSVd2MEtxemFrYUQ1TG1XcnBJd0w5MVg1ZjY3RFNETmNr?=
 =?utf-8?Q?DXpk11cj/CZResksaffQFMIEW?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 381d7905-8a23-44cb-a5e3-08dd3be9da2a
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5427.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2025 20:09:33.2019 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5femtdg8GQ2qkeQlohujHf+UW9OaJe2POrl7rexn8+KiY6z4o6R1yRHd8OntWtCSrUq4jNmzS22KfgqXlswNNw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR12MB6171
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



On 2025-01-17 04:04, Pekka Paalanen wrote:
> On Thu, 19 Dec 2024 21:33:35 -0700
> Alex Hung <alex.hung@amd.com> wrote:
> 
>> From: Harry Wentland <harry.wentland@amd.com>
>>
>> The PQ function defines a mapping of code values to nits (cd/m^2).
>> The max code value maps to 10,000 nits.
>>
>> Windows DWM's canonical composition color space (CCCS)  defaults
>> to composing SDR contents to 80 nits and uses a float value of
>> 1.0 to represent this. For this reason AMD HW hard-codes a PQ
>> function that is scaled by 125, yielding 80 nit PQ values for
>> 1.0 and 10,000 nits at 125.0.
>>
>> This patch introduces this scaled PQ EOTF and its inverse as
>> 1D curve types.
>>
>> Signed-off-by: Alex Hung <alex.hung@amd.com>
>> Signed-off-by: Harry Wentland <harry.wentland@amd.com>
>> ---
>>  drivers/gpu/drm/drm_colorop.c |  2 ++
>>  include/drm/drm_colorop.h     | 21 ++++++++++++++++++++-
>>  2 files changed, 22 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/drm_colorop.c b/drivers/gpu/drm/drm_colorop.c
>> index 7d4b29c0a0cc..f3391602a577 100644
>> --- a/drivers/gpu/drm/drm_colorop.c
>> +++ b/drivers/gpu/drm/drm_colorop.c
>> @@ -70,6 +70,8 @@ static const struct drm_prop_enum_list drm_colorop_type_enum_list[] = {
>>  static const char * const colorop_curve_1d_type_names[] = {
>>  	[DRM_COLOROP_1D_CURVE_SRGB_EOTF] = "sRGB EOTF",
>>  	[DRM_COLOROP_1D_CURVE_SRGB_INV_EOTF] = "sRGB Inverse EOTF",
>> +	[DRM_COLOROP_1D_CURVE_PQ_125_EOTF] = "PQ 125 EOTF",
>> +	[DRM_COLOROP_1D_CURVE_PQ_125_INV_EOTF] = "PQ 125 Inverse EOTF",
>>  };
>>  
>>  
>> diff --git a/include/drm/drm_colorop.h b/include/drm/drm_colorop.h
>> index e9f5c1adc2fe..4084a7438032 100644
>> --- a/include/drm/drm_colorop.h
>> +++ b/include/drm/drm_colorop.h
>> @@ -36,7 +36,6 @@
>>   * enum drm_colorop_curve_1d_type - type of 1D curve
>>   *
>>   * Describes a 1D curve to be applied by the DRM_COLOROP_1D_CURVE colorop.
>> - *
>>   */
>>  enum drm_colorop_curve_1d_type {
>>  	/**
>> @@ -56,6 +55,26 @@ enum drm_colorop_curve_1d_type {
>>  	 */
>>  	DRM_COLOROP_1D_CURVE_SRGB_INV_EOTF,
>>  
>> +	/**
>> +	 * @DRM_COLOROP_1D_CURVE_PQ_125_EOTF:
>> +	 *
>> +	 * The PQ transfer function, scaled by 125.0f, so that 10,000
>> +	 * nits correspond to 125.0f.
>> +	 *
>> +	 * Transfer characteristics of the PQ function as defined by
>> +	 * SMPTE ST 2084 (2014) for 10-, 12-, 14-, and 16-bit systems
>> +	 * and Rec. ITU-R BT.2100-2 perceptual quantization (PQ) system.
>> +	 * Equivalent to H.273 TransferCharacteristics code point 16.
>> +	 */
> 
> Hi,
> 
> this all good, I'd just clarify a minor detail.
> 
> H.273 code point 16 defines the normalised formula
> TF: [0.0, 1.0] -> [0.0, 1.0]
> so it is not equivalent to the 125-scaled version.
> 
> Maybe you meant something like this?
> 
> +	 * Transfer characteristics of the PQ function as defined by
> +	 * SMPTE ST 2084 (2014) for 10-, 12-, 14-, and 16-bit systems
> +	 * and Rec. ITU-R BT.2100-2 perceptual quantization (PQ) system,
> +	 * represented by H.273 TransferCharacteristics code point 16.
> 

Right, and thanks for the clarification.

Harry

> 
> Thanks,
> pq
> 
> 
>> +	DRM_COLOROP_1D_CURVE_PQ_125_EOTF,
>> +
>> +	/**
>> +	 * @DRM_COLOROP_1D_CURVE_PQ_125_INV_EOTF:
>> +	 *
>> +	 * The inverse of DRM_COLOROP_1D_CURVE_PQ_125_EOTF.
>> +	 */
>> +	DRM_COLOROP_1D_CURVE_PQ_125_INV_EOTF,
>> +
>>  	/**
>>  	 * @DRM_COLOROP_1D_CURVE_COUNT:
>>  	 *
> 

