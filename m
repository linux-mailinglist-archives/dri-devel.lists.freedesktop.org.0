Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E5829C1655F
	for <lists+dri-devel@lfdr.de>; Tue, 28 Oct 2025 18:56:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E86E10E63F;
	Tue, 28 Oct 2025 17:56:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="K7l/nYsT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CY3PR05CU001.outbound.protection.outlook.com
 (mail-westcentralusazon11013014.outbound.protection.outlook.com
 [40.93.201.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C002A10E63F
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Oct 2025 17:56:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ncsNmd5XhS/8cuamiKaKQmoydT6Qzi+YVc5W7r+kGxycQCR6pRuQirBDpTugvocEgjvNZEg5jBJFr49Fb9XPa1fjwiJbAAUzQb4xYgY2hza6u3PXGocNgNHRsDzerezk/qRETXvVv+GWvTqdVWwIKhGCsdnY7SshtkaFQOazEQWFQXErCmb9mNtjU3AsyPgKnFpTQZFRD+OuXc2MmwegsPSwhwdiuRFoGOzL2ACjKoRH/cMc/FhnVJoRqkDke13aher4Xumn9AS+EnwRw2NXV2RaclN9Jhh64uX3H+PSksmVEDgof8D/RyEmXOqB+QtqXtktoLp/DoKKEyiO2QB2EA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0EYcEdG9/XFpTvaBLjWXG5B08naEg9rv5yCkechG0P8=;
 b=BweMHHx9LWQHQ19mgjC7r6S5iDtLZx/KmOjv6KsFbEBpHBROTPdqFJ7aK+oBPv7xm6pU0CmoeRbgQ5GWC/xZADvvwXmRH+J3Kbeg55wo4w0qGOYyqWUThFWm6/JlDQmF0Z5blW0OL6GpfKu85FUhhTo9hWTwBO6XcUWyS6qLApRjS9Eb7xyDCrXYYoypHZnwy5UoDsWk/fO6AKdzopAASmUqTISTLOLMg85TVAEguDUormhV5XQVR52iXbTdMZoFOwSJkjcMVQKxzTnVDjQ0iVSYu4lVf47TDJtkWttpVAzFDbfTtXxF8049UZtEfdCPrp2vTf9j71EcLbLhfxWI2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0EYcEdG9/XFpTvaBLjWXG5B08naEg9rv5yCkechG0P8=;
 b=K7l/nYsTVih5iHk100r9QApS2bxcnUztcenUNrLl40Ibz+EmCRxclZwzrf2YkqnfJom5NxWsdbVNbqJ6QMC8HoFM5ECdQvLdYIfA4+iYeuxNNXHJhF2a1fn70Xdj4AAavSaKifGP0nelW26cV4gFBqmrNn4u0EopBzk4wJYFsyc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by IA1PR12MB6308.namprd12.prod.outlook.com (2603:10b6:208:3e4::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.18; Tue, 28 Oct
 2025 17:56:46 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca%7]) with mapi id 15.20.9253.017; Tue, 28 Oct 2025
 17:56:46 +0000
Message-ID: <dd9f53d6-f10f-4b8a-b0a9-1a9e2c311c7e@amd.com>
Date: Tue, 28 Oct 2025 12:56:40 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/7] accel/amdxdna: Fix incorrect command state for timed
 out job
To: Lizhi Hou <lizhi.hou@amd.com>, ogabbay@kernel.org,
 quic_jhugo@quicinc.com, maciej.falkowski@linux.intel.com,
 dri-devel@lists.freedesktop.org
Cc: linux-kernel@vger.kernel.org, max.zhen@amd.com, sonal.santan@amd.com
References: <20251027205928.2247897-1-lizhi.hou@amd.com>
 <00645fec-6712-4791-2221-551b636b2c9a@amd.com>
Content-Language: en-US
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <00645fec-6712-4791-2221-551b636b2c9a@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SA9PR13CA0103.namprd13.prod.outlook.com
 (2603:10b6:806:24::18) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|IA1PR12MB6308:EE_
X-MS-Office365-Filtering-Correlation-Id: 82654e13-4e52-4b7e-0999-08de164b5c7c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?eHlWVlZWRzNqc0RMMnQrcjUxVXVtUHJ5V3p4aEZ0NytpejNjMkdiL1BXVWg2?=
 =?utf-8?B?VDdCeExaVnhOeDNjRXhnMnFKbTd1cjcvT0J0TktjM05QVXNXUmxhUTB3cEdJ?=
 =?utf-8?B?RU11N1pzZGlTRkVaemdqWVJVVkNROXJJMU1EMTJ4QWFGalJjRjFDTlZ3b2lh?=
 =?utf-8?B?RGJpRW03bmZ1YWRqMGI4L3BjclBrRitpY2ZOWktDTzZORWFacjZtVUFQMXhj?=
 =?utf-8?B?M21XWWZjaVoyQTk0enVncjIvM3pOUUNycE9MU2pzRlhyU3NmVmYxc3ZtMFpV?=
 =?utf-8?B?YW10blFiM0duUVZMT01NR2lKU3JaYk1ISm9IZjMxRmJIWTNmT0lyWUtOZkE1?=
 =?utf-8?B?RzJ4V2ZUdEJnOXU0T3JhSGRCV2ZvKzNZRzNXMDlRMUhBNnYwMVJDMXBJWmVD?=
 =?utf-8?B?SnVyVW81U3FhR2xRbFNadG0rME5uL1VobGRES0owUXZnUEo5cFhUUVZyWVBW?=
 =?utf-8?B?bGlFczNQNW5BeG1oMWlCS1U1YXY1cWVjWGV2K2tCaGVkZkRuN01MTEx6c3NV?=
 =?utf-8?B?Q1Z2NXRCUTREcnJ2cVQxOVM0YXZ4cm5YVHltZDBobUZ4OTErUVRrMmFVdnpE?=
 =?utf-8?B?dTJmalpiL1ZYaStqNnJIV1VRQ28rTHV4RTY5MXZxVzhFZUxnRE9aTTZZcGlj?=
 =?utf-8?B?Y1N0WDBick9PYnNUVlZ3RzRCYXdoK3p5cHVvZHRsUTFUdzMyUDJuTnpIRFNu?=
 =?utf-8?B?ZzFhMW1yWlAwU1hNM1JLWFF0YTJ3RkxlM1RyNEVVaDh6emJFOHVyRDZGSGVB?=
 =?utf-8?B?SDdvR0tJdnQwQVpRMlFXb2NGcmRCSkJZMnU3RjZlK2V2VVZ0NlVVTTBwS3F3?=
 =?utf-8?B?RVdoUkJxYkhLMFFjSVdicW5hY29QbjBIUUdYR0dhdHNjQjlVUkZrRmUvWUdI?=
 =?utf-8?B?ZDF3ak0vWWtSZmJVeHUxQlZvaUtKa2lTalpKdHBaWTNLNUNDNG54UnJXT1ZG?=
 =?utf-8?B?ODJIM2h5aDVPZ25XZERjZnNSZ0lTM2V1WjExYmN2d2M0T1NXRmZPZWZjUE5V?=
 =?utf-8?B?M1JGN1RheVNRZGZ0UDVDTVFXaUJnSDhWeG1wc0NRVjdPN3d5OG5YdUZDdEJj?=
 =?utf-8?B?WVRwckJoVXJMQU1WakdTcitJWlkwWlhoejlHNG1KclIvQXo5UlFuYm5kWUo0?=
 =?utf-8?B?Y3YweUlmQW9UTnVMOVhld3JXZy9FUWt0WHVwbnd2M1Z3aXFrMS83M3Z3TEFF?=
 =?utf-8?B?YkFBeVpNQ2hIcGg5bFErYjVhbUdZUnhlTEUxU0JxcVpNb1ZIUTlYak8xMjRM?=
 =?utf-8?B?VDY1a2FZM05qVU9md1NCRk8vQjR5YloyZUtDR2NuNUsxeGdicE1peFEzMWFi?=
 =?utf-8?B?b2R0V1ZINUdXSDBCdFhPcUJYaHJadzI4VERwdEh5NkhTUjJVK1F4QlE1dmdB?=
 =?utf-8?B?cWtxQ2hpSC9LdU5lV2VXY2JFdXRBc1dyc0VramNUeFFYSitJK1RXRXRRZk1F?=
 =?utf-8?B?cHBYOFVDMVhPVFlia0pOUUNzOUpMMDd1bk54dHgxOXhuWmxRVVl0MkJjNU9X?=
 =?utf-8?B?OGhUQ01UdjRFL2ZSVnVPTGxRRFRIdUtBQVdOcHRjdXloZWg4RnA1eFJwUk5U?=
 =?utf-8?B?elRlMlFNczlCK3FwMnVKdytQMFBzUVV6SHZybVhVVkRMamZOWUlCeHJ3Y0po?=
 =?utf-8?B?aHUrbjFOTU1BWWFqVTNiTkpmZU9UWUF0L3JCdG8vMWkxMW5Id3B5MFU5bVpP?=
 =?utf-8?B?aGsxTVJucWtGZER5eEFUM1FuVUx6c0VwY3BSM25UV2llZmhUTWtVTEpwNUFp?=
 =?utf-8?B?aG4zS29xbVU0NGJBbTE3YVVkaU9RRVlmalh3NW03bFpSR25MenZHN3hmaHRG?=
 =?utf-8?B?VHJiVXkvZzlmdmovb1FDTm45N2U2UkJkTG9Xa1V4QVBBdkdBS0wzZmZoaDF2?=
 =?utf-8?B?dTZ2TGhYVnM3UkUzZitWa3NjMy9GNWR3dk5oS3VzVi9KczJLVVZsWHZHTGxP?=
 =?utf-8?Q?aTZyWyb1xamVnn86N/EFAA53KnH8JLQF?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR12MB6101.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NGs2TnRIdW1GRXFhOFJyNGhHa0JDbXZuVStQYTYwc2d4aDExRjFKZi9XVUts?=
 =?utf-8?B?NXNVLzFKQm5wa3A4ZTZSZWgvNmFRcWR5UTQzL1hoMmVZWkhwand0YjA5OGky?=
 =?utf-8?B?NU02SGE2MlNodGptM0NiN3RKSXVNYjZZL2RWVmxVbmp2ZVora0Z4ZUNWcEIx?=
 =?utf-8?B?Nmd2WEpkNmlNcm9ZWk5ZM3REV0RGcDNmRWpYNE43eGNtK2E5a1hOQmlZVjRp?=
 =?utf-8?B?NWtkME52RUFmZCs0dDBQWGdJUXhnQ1dNdm5kTStZNktRSmdwcWFmdzVpeFcx?=
 =?utf-8?B?ZmsvblByYkJCM3Y4OEFjeXpQeFV4MlQ1T3RrdTdEYlFaNEZjNE5qVGJPWVhm?=
 =?utf-8?B?c3BEME8yWkxROGJYU1d3R1pPY1FGNzVsYWZZblArMndjRFQ2dk5WbHBCRTRm?=
 =?utf-8?B?RmhiN0lJZXRRdS82U3Rwd05QdzFqTTRIQkVva3ZTenVwRWhCbHI2NTVXeTNs?=
 =?utf-8?B?aG5aWE52aG42U2pxSVBOQitWbmd3UEY0WW1kL2I2b2VBWVV2ZS9YakJBUFFP?=
 =?utf-8?B?RVlWb1ZrbEtkbXZEZEVVclVUaTdnRDF3TWZxOFExdjVHd3VNZ2ZWa2gzbFFq?=
 =?utf-8?B?Rk1UM3B6cEwwMGtNNE5kNHZYVXBHeU1MQ3ZNK1NSMnNic0VBbEh5Z3dsaUZI?=
 =?utf-8?B?WG4rRmM1cVc1YUxwWEZTMmYrSWF3MmlKNVZGTjh4clYyQ0x1eEpXNzdsT3FX?=
 =?utf-8?B?d1RDYTVOZFkxK1dpNEJBaCt2ZFIvbnEwWDJobXBTeEhjcVFqa1VibjdLRHFM?=
 =?utf-8?B?S3VTRHQ2NE53QWR4a3lwMXljZ0FnbmxGVkF2c01ETk5HU2tQVFN2SFBGYUsz?=
 =?utf-8?B?Z1IyeWd6VlhNbE9vQ3VVSDN4djF1K29COExONm5UQm9BZHF5WERUWU91Ujl0?=
 =?utf-8?B?cEYxb2E0dzZqSElwM0RNRjRoTVM4eXU3cGxKblNBWDdya1RxcnRkbTJwRzkw?=
 =?utf-8?B?MVBCMk1zMkgzWXBmVWhOTFpUQlU2eDVtQUFLWFBqYXFGSlJ6VG44M2tyczJt?=
 =?utf-8?B?SXU4cE5ZaEI1Q2JBNXpzaDRpRTMvUUFDVW5iRVQ4Y0JkUStTMlM3RE9uQXQ2?=
 =?utf-8?B?MEdHS0RTYTFqYitud21aWHVHL2hlbXhxMisrQ05ZbFJGRG5pdW8xRmlWUXZ4?=
 =?utf-8?B?cmlFRGxBRm1TeDJWUlZJbWNaVkUrYVVhQVljVEhoWG9xU2RROXdvb3B3RUl5?=
 =?utf-8?B?YlBSekx1UWllZC9CajI1Uzg5R2pzb2RySHhnMk5XcWRieGt2SWNoUmQzb3Bu?=
 =?utf-8?B?Y05aYTRtV0RvY3FnVFlScnVPay9iZjlwQmsrZUFhMDRTbXVaYkl5Y3QyQ3U5?=
 =?utf-8?B?RkVpQ3NWeTFPQ0IyS040NUQyVW9GamNXY0ZiU3hXRUI2VHZvL1ZNRjZ0R3JQ?=
 =?utf-8?B?QXZ5Ky93cFExSWRCeVNROVFkN3AwaDlLNmM3Q1p0K014R3YyL3h2UnNlYnBm?=
 =?utf-8?B?a0xUbnl0N0lQd0xpWmg2UGRnamZJWSs2MitqeEFTdXcyWE5tN0V2dVd6T2c0?=
 =?utf-8?B?WDBCQjY0dU9jRXNEUjZQZFhCQWlzR3U0QmsxVE9FQ2FmU1NCdkhBWlZ6V2hZ?=
 =?utf-8?B?OG1mUzFpbUo0aUt2bFVZczJPR0oyNDVMWG9aT3A3dmRxZklwZ3U0WUhnbWl5?=
 =?utf-8?B?ZXN0SWZtR2ZlUUJGMVUweG9OMktUN2hKeGh2RTlBMmpjMkk0Nm5BdS9rbUM5?=
 =?utf-8?B?b2hHWkJtVTUyRHJnYUU5NkpGN2ZyK3haZmM1OXpwNkhtNXRiNStWVE1vS3c4?=
 =?utf-8?B?WG9RNnI0S21PcTBiS0FuL1RTOElXRXU4MHNGcnlOT2J0TUdyaWhTSWREc1RS?=
 =?utf-8?B?a3hmSTR5S1FkUnZuekJLVU9tQWVBVHZkRXZEeFlpV2Fpc0E4WTkwTmpHWElK?=
 =?utf-8?B?S2RxbVBNWVFYK1MrVUJsYkVBR1p4dGRNS1k2ZEhtNjR6MnpMZlpycUljeWZZ?=
 =?utf-8?B?M3VBUnFuYzRwUFg4RGUxNHJuMmlHQ29kd0hRTC9lWEFXdHZibTRzc2w5TFFx?=
 =?utf-8?B?czdyT1JyWlFSRE1xLzc5Z0tFOFRlVXFFOElqeUxRaDJWamhuSHg4eXlGMVZk?=
 =?utf-8?B?UnUzN0ZSczQ5QVdRR2lsT25McWExeVB0aTJ4eEJlK3J0emRrVFNEVkJ2Z2wz?=
 =?utf-8?Q?AJiBQBFz5BwTTOELhwM0U0o55?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 82654e13-4e52-4b7e-0999-08de164b5c7c
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2025 17:56:46.5102 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZIPZ3csWnNwQhgGfDC6/mg0LNdk2y7WWtNuNFQsnHHG2BOS1i3BMYOxdUisinDcTABHsNz9l+qWFl3UKfclLRw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6308
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

On 10/28/25 12:53 PM, Lizhi Hou wrote:
> The title [PATCH 1/7] is confusing. I will resend with a clean one.
> 
> 
Is this an accidental send?

I noticed one with same-ish title in my inbox.

[PATCH] accel/amdxdna: Fix incorrect command state for timed out job> Lizhi
> 
> On 10/27/25 13:59, Lizhi Hou wrote:
>> When a command times out, mark it as ERT_CMD_STATE_TIMEOUT. Any other
>> commands that are canceled due to this timeout should be marked as
>> ERT_CMD_STATE_ABORT.
>>
>> Fixes: aac243092b70 ("accel/amdxdna: Add command execution")
>> Signed-off-by: Lizhi Hou <lizhi.hou@amd.com>
>> ---
>>   drivers/accel/amdxdna/aie2_ctx.c    | 12 ++++++++++--
>>   drivers/accel/amdxdna/amdxdna_ctx.h |  1 +
>>   2 files changed, 11 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/accel/amdxdna/aie2_ctx.c b/drivers/accel/amdxdna/ 
>> aie2_ctx.c
>> index c6c473c78352..958a64bb5251 100644
>> --- a/drivers/accel/amdxdna/aie2_ctx.c
>> +++ b/drivers/accel/amdxdna/aie2_ctx.c
>> @@ -204,10 +204,12 @@ aie2_sched_resp_handler(void *handle, void 
>> __iomem *data, size_t size)
>>       cmd_abo = job->cmd_bo;
>> -    if (unlikely(!data))
>> +    if (unlikely(job->job_timeout)) {
>> +        amdxdna_cmd_set_state(cmd_abo, ERT_CMD_STATE_TIMEOUT);
>>           goto out;
>> +    }
>> -    if (unlikely(size != sizeof(u32))) {
>> +    if (unlikely(!data) || unlikely(size != sizeof(u32))) {
>>           amdxdna_cmd_set_state(cmd_abo, ERT_CMD_STATE_ABORT);
>>           ret = -EINVAL;
>>           goto out;
>> @@ -258,6 +260,11 @@ aie2_sched_cmdlist_resp_handler(void *handle, 
>> void __iomem *data, size_t size)
>>       int ret = 0;
>>       cmd_abo = job->cmd_bo;
>> +    if (unlikely(job->job_timeout)) {
>> +        amdxdna_cmd_set_state(cmd_abo, ERT_CMD_STATE_TIMEOUT);
>> +        goto out;
>> +    }
>> +
>>       if (unlikely(!data) || unlikely(size != sizeof(u32) * 3)) {
>>           amdxdna_cmd_set_state(cmd_abo, ERT_CMD_STATE_ABORT);
>>           ret = -EINVAL;
>> @@ -370,6 +377,7 @@ aie2_sched_job_timedout(struct drm_sched_job 
>> *sched_job)
>>       xdna = hwctx->client->xdna;
>>       trace_xdna_job(sched_job, hwctx->name, "job timedout", job->seq);
>> +    job->job_timeout = true;
>>       mutex_lock(&xdna->dev_lock);
>>       aie2_hwctx_stop(xdna, hwctx, sched_job);
>> diff --git a/drivers/accel/amdxdna/amdxdna_ctx.h b/drivers/accel/ 
>> amdxdna/amdxdna_ctx.h
>> index cbe60efbe60b..919c654dfea6 100644
>> --- a/drivers/accel/amdxdna/amdxdna_ctx.h
>> +++ b/drivers/accel/amdxdna/amdxdna_ctx.h
>> @@ -116,6 +116,7 @@ struct amdxdna_sched_job {
>>       /* user can wait on this fence */
>>       struct dma_fence    *out_fence;
>>       bool            job_done;
>> +    bool            job_timeout;
>>       u64            seq;
>>       struct amdxdna_drv_cmd    *drv_cmd;
>>       struct amdxdna_gem_obj    *cmd_bo;

