Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EE5B1CAE1BB
	for <lists+dri-devel@lfdr.de>; Mon, 08 Dec 2025 20:43:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0463B10E42F;
	Mon,  8 Dec 2025 19:43:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="WM+nK/ns";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SN4PR2101CU001.outbound.protection.outlook.com
 (mail-southcentralusazon11012039.outbound.protection.outlook.com
 [40.93.195.39])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D11E10E415;
 Mon,  8 Dec 2025 19:43:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qXDYjDi/knmqxlJ3zjhGpAbYRiv7xkaFoKuGz+cGRVSkYBjmp3ApJpBl/w53tOyJ5MH7aK6nnGXO0FGznKNy0788/HN5MWtGFzdlW7a8dLeww/klF9Do9vdZeg1ls59vrcgeptpZSM7VUvh3ne8zOV9k66VJCXZs1cEfAO4p7UeAiME5e6ohP2qLDUvrbimDcvGHyRklSbb6KkHUlfQQ9xASr8N7s6/hstNjTMRQzyR83fuRD8kBl9U5Uc+2J58T9Sa0QaPJoEuc5HWV5B77kG9P36wzZSWiwfQI90vNTB3KBVHwgxznHdPAKKBwdJ3lzD0qb1pddhKPEzQ+F9FXGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JkH9QCK/vVNXwWx+yUep5ngRvEHAR+kl+jImCtOrdnU=;
 b=BATyTqTXcgQOxZsxFFJhsng0796YPcKEUm/TVtWw+RwPHc4Gt844PFwH6pEIXOdgBcjguBTOeZ3sVaxwU8n+LAbBCwz5ynv6IGKIz10V28mS/qjoOGpXXzwpZtZZ69z5AlwMKcCkXUAWUf4lAhGwoQaa25o58AMralIZwDqW1e6ybhBTVG9GNlsorwjnkxGx9n3XDt35jOsBFuJWooG3jhCCxbN1xq3yhFwZPB2kvwwJLr0y/F8nCwEkmVpKMKUdiHtvoU1NkoscofDUNkAZRnaIHaBlsKf5eBxx01QDglc/WzqbpY2IU81KTAvSfoVub3U/KWa1XLqlcODglrPH0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JkH9QCK/vVNXwWx+yUep5ngRvEHAR+kl+jImCtOrdnU=;
 b=WM+nK/nsZ3vYpVU1d7odLfaxcfObvMxKlUTIdyoJfJyV0EOVfoD2utMKWp9U1UPCqQUg8VGHi9EWNnfqvGhAUK5q61F87PbDHRsWxTXwM490V+gYtE0E6GWbKfH0s5BfHgZScInhd9zK89uNtPBMYqWVjgidgvgvdtNFpKmycsc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by DM6PR12MB4234.namprd12.prod.outlook.com (2603:10b6:5:213::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.14; Mon, 8 Dec
 2025 19:43:13 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%4]) with mapi id 15.20.9388.013; Mon, 8 Dec 2025
 19:43:12 +0000
Message-ID: <212ecf88-b175-44cc-af3f-7371340ed480@amd.com>
Date: Mon, 8 Dec 2025 20:43:03 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/sched: run free_job work on timeout workqueue
To: Matthew Brost <matthew.brost@intel.com>, phasta@kernel.org
Cc: vitaly.prosyak@amd.com, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 dakr@kernel.org, Boris Brezillon <boris.brezillon@collabora.com>,
 Lucas Stach <l.stach@pengutronix.de>
References: <20251128182235.47912-1-vitaly.prosyak@amd.com>
 <cdecd1e2-de0d-466f-b98b-927b2f364f79@amd.com>
 <c56ecd19d7ddc1f1ed4e7e9e13388c647de855b1.camel@mailbox.org>
 <49de5988-ea47-4d36-ba25-8773b9e364e2@amd.com>
 <aTMW0UCGQuE+MXLk@lstrano-desk.jf.intel.com>
 <21699026216379f294d6597ed6febd187229ffb9.camel@mailbox.org>
 <aTcf4o0huubgUPIQ@lstrano-desk.jf.intel.com>
 <aTcguvAQCZ07xD/C@lstrano-desk.jf.intel.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <aTcguvAQCZ07xD/C@lstrano-desk.jf.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BN9PR03CA0523.namprd03.prod.outlook.com
 (2603:10b6:408:131::18) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|DM6PR12MB4234:EE_
X-MS-Office365-Filtering-Correlation-Id: a9399ffb-d39e-4a5c-97db-08de36920602
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UTFRWW5PSzVhWHZjQXZkRHRPSVFMdUNweERDbFFQSVYxZjZuUDk0S2xjcUl6?=
 =?utf-8?B?NnI4VndBa2lxYnhBTEF6YjIySW1RM2tXSGZLbThPYlNadU94K25UWFFlVDBS?=
 =?utf-8?B?NjUvMEgvOFBkUkFXZ3ZLdmliVkRBRUVjYUwvNzFYT2NFQlFJVkNkUEo4dCtr?=
 =?utf-8?B?TWIvVzcyQkJJU1h2cEVOUERaWDBMR0w2a1Z0ZTF1L3JNVmtzUmRJV3pyT05N?=
 =?utf-8?B?VUphM2ZyU0lBYXFNSG53Zmxxc3ZYUWdWVUszSWxQWWV1Zk9scGp6Z2tZZENH?=
 =?utf-8?B?UDZUZmZ4VHJlMEhSeWJ6emhXOXh6N0paS0VhNXd3QSsvVnhmbXBKZzRsZU05?=
 =?utf-8?B?SnZUbDFOMEJoWngvd0NPNXg5UEYwM0ZzWXB0cE5mTzJpWjBtMkN6RldFUTF2?=
 =?utf-8?B?UkZ0YU5uQ1E0eWk3cUhObk1GSHpuL0hNVnZaN3ZpRVQ5S09mblh0V3FjRUkr?=
 =?utf-8?B?WTdJWnFNeUhsWUZ0aElxWjZmSTZtU21XK1VqbkkrcUVIRXFWRUxIeWJqN0hl?=
 =?utf-8?B?ZGFGUlROcDd2RkF5NWdNOWNiZDJEK2Q2cWJpQktqcFBJOHNlNHFxMC85MDZ3?=
 =?utf-8?B?aEtlK2hJVTB1ckFUSnlaSzVldFZJME9DNTlaTjNCS2Z6ZUJLay9TS0IzTUFZ?=
 =?utf-8?B?RkNvdXZ4QW5iZ3pXVXdON1NEUlJQRVoyamFpSEU2RDNQbU05V21pUEVwaWc1?=
 =?utf-8?B?TFl1OEVjUG9lMWQyancvTk11M1liTkVQSi9uc1NsYW1Dc010YkIzR3FKWmxX?=
 =?utf-8?B?dFRkTlYybXZINGU5WjVKWm1TaFVwcU1qcDdtTlVlK2JSOG1lK1llTmtMMlQ3?=
 =?utf-8?B?QlFaOTVRM2hVc3dOSjRkZklILzZZTkViZ2ZSZ2JJQit4WS9LL1YrRHA1U2VL?=
 =?utf-8?B?d01kR1dQbVkzOG04SXJpQmpnakZpaGF1STFBOHl0em1BU1czSXpFaytxMmxH?=
 =?utf-8?B?NFUzc1lFRGhXdXNMYk5CZjdNWlBRVHUwTitaeDQ3bnZWblV0ajBLb29WRklR?=
 =?utf-8?B?YnEwdk1HUVowbllsSDQvT2FuM2NteE9OUHRBWXJ5b1o1VmJTVTF6cG9XT211?=
 =?utf-8?B?TGdYb0hYNVRzZWhzbHIxZ3lvT2N2aktzYXBCNkMyUEVZRWF4bmFXUmtnZnd5?=
 =?utf-8?B?OE5MRjV0WDBxcVJMVzFRZFEvRVhRK0tqQ24rRGcza0VqM1o1NGNTWkNvWEJL?=
 =?utf-8?B?Y1hhb3ZoaEJtazI5UTlLMlJ4Vyt4dzh4cnlCSXE4UGVNaG40OERFVTBCdmVo?=
 =?utf-8?B?bkc3dUNINVlFKyswMk9SZzlPZXE2WVovTW93bmdjdFlWcWc1N0REQ252d0NM?=
 =?utf-8?B?WlA4RlQ4Tk5uVWEwNnorRlhVUElpQlhvUXA2MlNnMWIzallPekJOSkFTR0dY?=
 =?utf-8?B?Y085bFpCYlpSNStSWE44bXlsa3M5NHowTVl4a2JZRVovVXdJdkhXb05GdjNz?=
 =?utf-8?B?b29tODhOUEhvS2VQSmFNcHhnTmF3VFUxL3AvMjBMMFl4SEhZaVVBZmFNWG9o?=
 =?utf-8?B?WHJDZFNZRTFtR3psZ2tqS0g4cTdyMWhnWmdKdU16WS9za2tPNUg2TWdrQnds?=
 =?utf-8?B?WGg0TWdsRzZ6a1JrT1VWV2hyeWpCZ3VuN1kycXRCdTN6YVo1K0ZXS3ZtQU8y?=
 =?utf-8?B?UTVDY2NqSUFiNUFtQ1lhVEtTQWJHNTBteitIQVVxQjE3cVpna3FwWGVHZUlY?=
 =?utf-8?B?UnAwdC9qem5DOVJMemticS8wWDlyY3JvazBSc0FTb3ZFNGlUSEpURXMrRlR2?=
 =?utf-8?B?QURnMmtqaW9XZTJWZ0RsN1VGTlVoRlVZZStabXFnMVRyZXpjNEpramtra3VY?=
 =?utf-8?B?Tm80NWZFNnVNSXJnT2E3Tm9GS256Y2hrNWxLa2FBczRyY2pYNFlvNnpiOXZV?=
 =?utf-8?B?UzlGblArbmtDL1JPM09XU3I5ZFRIRHZMOEQxcnRvblRJb0NkbkF6ZmVxQUFh?=
 =?utf-8?Q?WyvqV5qcLidZ7Bwl8WwtkZVLVSGTUjOA?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SkN3RU1iZ2laeEVVZEpDZjVRZmxsVFc2b2pXZHZJNTVGRW9XQ0pqRHl2am9X?=
 =?utf-8?B?NkFnSVJENC9NNVVMSVg2Z1hVSjlFTmtyaHFGSkkvK3JHWnFKMUtNNkVzYVRF?=
 =?utf-8?B?SWZuTU9pS0tUOGtlbFJsc2NJM1o1bWk3VkkvK1V5K00yRzJEVW85OWIwYzJU?=
 =?utf-8?B?UWVYakJobTBRWi8rajlueUw1b3k0LzZXTmxZQTd3b3lkM1ZyMTkrNzR1czN2?=
 =?utf-8?B?TS9SVEtPWTR2VEUvNTlsT0RMOFhnN1cyU2c3TzJybjBmcHZHUTcwbE9xQ0Rh?=
 =?utf-8?B?LzNkaDZlSjB2MWZpSTQ5cEFTaDlRbzZueGVBZzlmVlF4WjNwK1NVNXdsY215?=
 =?utf-8?B?bkhWOTZ2cW01TW10Z3JITlFFK0lid0ZUbnRqMVNJNmQrV3h2Z1RzcWMyWnBK?=
 =?utf-8?B?VTJ5TDB2Sk1uL2VOOVdYOFZmdForSWlSczgxOUtxUVpHeXFjZkJKcGdOTXRj?=
 =?utf-8?B?RUtLaUhRaFpWQVhVbW04SEVldjlXK0pWbjdDcW1CckhoVkVkQ29JUVMwSHZ0?=
 =?utf-8?B?b0hwTUpjQzE1R0svQVZtR29RQTkxZzR1TzF6Qm90Z3lXdkE2TXBPa2JTejh0?=
 =?utf-8?B?REdSMWg3YlZVdkIrOTdoOU9iVzdYcFRSYUVNR3c2eFBRdDhQaWNZb21JMGcw?=
 =?utf-8?B?UVRQS0lVbC9kYm5oamdmaXdvZ09XcGJxZXFvTGFhTmpMM0lFaFEyTkZNUW1m?=
 =?utf-8?B?enBmd2toSmdad2NqUFBoSUlmWWdxMjExOGtUVHFtTWJ6VU9MZ2Y2TUFpc2hI?=
 =?utf-8?B?YnVneWZIemR4VjZ0cnpkYTFKS3ZwMEJGR0RxOTFqSXluYm9jakF2bkpKcjFh?=
 =?utf-8?B?Z0ZrMjduVXJpR0cwNzN2c0pNYzlWSjhTbXNmQmpRQitEMjFKbkk5TTk2ZENw?=
 =?utf-8?B?Q1ZmbXZNUUw5eFo2NEdCYTVud0MwNnE2SlhFTTJxdEQrMlpvNnc5WWs4ZE5K?=
 =?utf-8?B?dU5kS0FiRk5POXI1aHc4RjBoYUtGWWJwWGhCeFJXQVQreVpkWm01aW8zT2g0?=
 =?utf-8?B?OWQ4c3JGMVhCS1dEd21LcHFsM01Ic2NpSkhHM0pIbXQ0VWhaN0I3bUlCdUNs?=
 =?utf-8?B?M0poRU1yNFR2QUZHeXlQdCtuWXBaN1B3V1ZjSU5JVjhYRlRMK3Y0V1NycDBv?=
 =?utf-8?B?TkVrNzlXRUk5aTFUVkY2NnZmU0F1MHowVlVja1Rkd2c2alVlYlJMdC9uT1ZZ?=
 =?utf-8?B?TkpJanpNUDRiVk5jMVZQanhhSktxVDl3dENSbElPbEVGOFgyc2d4RktuOTd1?=
 =?utf-8?B?RTlPVjN0QWlzV1hXUDh1K0FxV0lkbFlLZEc4cm5KaElUTHMycStXQ2pCT1N6?=
 =?utf-8?B?cEx1WjMydG0va3F6aEVDejIvSlhoQnBqUEZWMUpaUG1xMlVxRXE2S3BDWEV1?=
 =?utf-8?B?QXJwMWM1Y2VWc0YyVlRjQ2RFNysvL2o2eHgvL05LU2lXcGtmM25aVlpYamli?=
 =?utf-8?B?d0gxQ0tvaU5CNDBSbHFYNGJCcWEranoycmZrTUFYcUNpRnc2QlBOem10UHVp?=
 =?utf-8?B?dlR2VHBtVDcyN0NLUHF1R2d0bkhMS3h6SE83b3Q1c0tuTmxZRmZxekNhdEo2?=
 =?utf-8?B?cHJjVi9MR3prNWZvTmhheVRLa0VoNWVwdkdyU2VRUkl1aWtxQksrREVuUXo1?=
 =?utf-8?B?V21zeXd3TVgxNmFHWjZjSkZRSmFuUTdHeGs0ak5IeUpTNjNSeWJUV1BURm5Q?=
 =?utf-8?B?ajYwSE5IU3RFU1YzK0hTVTRXbDFHOVR6WitnL2lSY3UvYmlCS0x5dzVQSnBO?=
 =?utf-8?B?YWpSeUd3eWdCNEdLM3RkT2hJbEhEQ0dtRlBWMTRMVE1hVXdNTklhd3hNWERM?=
 =?utf-8?B?SXV0Njl5Z0s0YmJ6eWdJL3h5ek90amF5Z3FFQmVKeVB1WnE0bHQ2NHNDM0po?=
 =?utf-8?B?UWhLQjhsUzhnS2ZqK0FXalM2TDRjN2ZkT0xWYm9Sc29zdERnamdOa1FFMVNO?=
 =?utf-8?B?VElINDlselNqVitpTFh4YXZZdCtFbGJ2aTdCc2dYYzNpZitFYzhhTURrMWdM?=
 =?utf-8?B?WVpiOUhhVkdtUTA5ajdLc1hDS1RaNEh0aTVuUWxnWlJrZjQ4TGxzckhUblJx?=
 =?utf-8?B?dng5Y3MvM1RCVnd0OUp2YzZDQmVIM0Z4M2xxeEtLSVpFWWI3ZWxlREMxWXVO?=
 =?utf-8?Q?lan5e3iWaSk8Mr6UxHYl6zcG3?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a9399ffb-d39e-4a5c-97db-08de36920602
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Dec 2025 19:43:12.8858 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oPqefWX5Y74TYkmLwM+5J3mBuooBLFkqokZzaXMnvLFS9U78MYee5D5RvkPdZ/0X
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4234
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

On 12/8/25 20:02, Matthew Brost wrote:
> On Mon, Dec 08, 2025 at 10:58:42AM -0800, Matthew Brost wrote:
>> On Mon, Dec 08, 2025 at 11:35:33AM +0100, Philipp Stanner wrote:
>>> On Fri, 2025-12-05 at 09:30 -0800, Matthew Brost wrote:
>>>> On Fri, Dec 05, 2025 at 11:18:21AM +0100, Christian König wrote:
>>>>> On 12/1/25 10:04, Philipp Stanner wrote:
....
>>>>>> This entire fix idea seems to circle around the concept of relying yet
>>>>>> again on the scheduler's internal behavior (i.e., when it schedules the
>>>>>> call to free_job()).
>>>>>>
>>>>>> I think we discussed that at XDC, but how I see it if drivers have
>>>>>> strange job life time requirements where a job shall outlive
>>>>>> drm_sched's free_job() call, they must solve that with a proper
>>>>>> synchronization mechanism.
>>>>>
>>>>> Well that is not correct as far as I can see.
>>>>>
>>>>> The problem here is rather that the scheduler gives the job as parameter to the timedout_job() callback, but doesn't guarantee that ->free_job() callback isn't called while timedout_job() runs.
>>>>>
>>>>> This should be prevented by removing the job in question from the pending list (see drm_sched_job_timedout), but for some reason that doesn't seem to work correctly.
>>>>>
>>>>
>>>> Are you sure this is happening? It doesn’t seem possible, nor have I
>>>> observed it.
>>>
>>> It's impossible, isn't it?
>>>
>>> static void drm_sched_job_timedout(struct work_struct *work) { struct drm_gpu_scheduler *sched; struct drm_sched_job *job; enum drm_gpu_sched_stat status = DRM_GPU_SCHED_STAT_RESET; sched = container_of(work, struct drm_gpu_scheduler, work_tdr.work); /* Protects against concurrent deletion in drm_sched_get_finished_job */ spin_lock(&sched->job_list_lock); job = list_first_entry_or_null(&sched->pending_list, struct drm_sched_job, list); if (job) { /* * Remove the bad job so it cannot be freed by a concurrent * &struct drm_sched_backend_ops.free_job. It will be * reinserted after the scheduler's work items have been * cancelled, at which point it's safe. */ list_del_init(&job->list); spin_unlock(&sched->job_list_lock); status = job->sched->ops->timedout_job(job);
>>>
>>>
>>>    1. scheduler takes list lock
>>>    2. removes job from list
>>>    3. unlocks
>>>    4. calls timedout_job callback
>>>
>>>
>>> How can free_job_work, through drm_sched_get_finished_job(), get and
>>> free the same job?
>>>
>>
>> It can't.

But exactly that happens somehow. Don't ask me how, I have no idea.

My educated guess is that the job somehow ends up on the pending list again.

>>
>>> The pending_list is probably the one place where we actually lock
>>> consistently and sanely.
>>>
>>> I think this needs to be debugged more intensively, Christian.
>>>
>>>
>>>>
>>>> What actually looks like a problem is that in drm_sched_job_timedout,
>>>> free_job can be called. Look at [2]—if you’re using free_guilty (Xe
>>>> isn’t, but [2] was Xe trying to do the same thing), this is actually
>>>> unsafe. The free_guilty code should likely be removed as that definitely
>>>> can explode under the right conditions.
>>>
>>> I'm right now not even sure why free_guilty exists, but I don't see how
>>
>> I'm sure why free_guilty exists either. If the fence is signaled in
>> timedout job free_job will get scheduled on another work_item.
>>
>>> it's illegal for drm_sched to call free_job in drm_sched_job_timedout?
>>>
>>> free_job can be called at any point in time, drivers must expect that.
>>> No lock is being held, and timedout_job already ran. So what's the
>>> problem?
>>>
>>> For drivers with additional refcounting it would be even less of a
>>> problem.
>>>
>>
>> No, the scheduler can still reference the job.
>>
>> 1265         fence = sched->ops->run_job(sched_job);
>> 1266         complete_all(&entity->entity_idle);
>> 1267         drm_sched_fence_scheduled(s_fence, fence);
>> 1268
>> 1269         if (!IS_ERR_OR_NULL(fence)) {
>> 1270                 r = dma_fence_add_callback(fence, &sched_job->cb,
>> 1271                                            drm_sched_job_done_cb);
>> 1272                 if (r == -ENOENT)
>> 1273                         drm_sched_job_done(sched_job, fence->error);
>> 1274                 else if (r)
>> 1275                         DRM_DEV_ERROR(sched->dev, "fence add callback failed (%d)\n", r);
>> 1276
>> 1277                 dma_fence_put(fence);
>> 1278         } else {
>> 1279                 drm_sched_job_done(sched_job, IS_ERR(fence) ?
>> 1280                                    PTR_ERR(fence) : 0);
>> 1281         }
>> 1282
>> 1283         wake_up(&sched->job_scheduled);
>> 1284         drm_sched_run_job_queue(sched);
>>
>> At line 1269, the run_job work item is interrupted. Timed-out jobs run,
>> call free_job, which performs the final put. Then the run_job work item
>> resumes—and boom, UAF. Using the same reasoning, I think moving free_job
>> to the timed-out work queue could also cause issues.
>>
>> If run_job work item took a reference to the job before adding it to the
>> pending list and dropped it after it was done touching it in this
>> function, then yes, that would be safe. This is an argument for moving
>> reference counting into the base DRM scheduler class, it would make
> 
> typo: s/DRM scheduler class/DRM job class

That strongly sounds like re-inventing the scheduler fence.

What if we completely drop the job object? Or merge it into the scheduler fence?

The fence has reference counting, proper state transitions and a well defined lifetime.

We would just need ->schedule and ->finished functions instead of ->run_job and ->free_job. Those callbacks would then still be called by the scheduler in work item context instead of the irq context of the dma_fence callbacks.

The job can then be a void* in the scheduler fence where drivers can put anything they want and also drivers control the lifetime of that. E.g. they can free it during ->schedule as well as during ->finished.

Christian.

> 
> Matt
> 
>> ownership clear rather than relying on ordered work queues to keep
>> everything safe.
>>
>>>>
>>>> [2] git format-patch -1 ea2f6a77d0c40
>>>>
>>>>>> The first question would be: what does amdgpu need the job for after
>>>>>> free_job() ran? What do you even need a job for still after there was a
>>>>>> timeout?
>>>>>
>>>>> No, we just need the job structure alive as long as the timedout_job() callback is running.
>>>>>
>>>>
>>>> Yes, I agree.
>>>
>>> As far as I can see that's how it's already implemented? No one can
>>> free that job while timedout_job() is running in
>>> drm_sched_job_timedout().
>>>
>>
>> See above, free guility is still problematic.
>>  
>>>>
>>>>>> And if you really still need its contents, can't you memcpy() the job
>>>>>> or something?
>>>>>>
>>>>>> Assuming that it really needs it and that that cannot easily be solved,
>>>>>> I suppose the obvious answer for differing memory life times is
>>>>>> refcounting. So amdgpu could just let drm_sched drop its reference in
>>>>>> free_job(), and from then onward it's amdgpu's problem.
>>>>>>
>>>>>> I hope Matthew can educate us on how Xe does it.
>>>>>
>>>>> We discussed this on XDC and it was Matthew who brought up that this can be solved by running timeout and free worker on the same single threaded wq.
>>>>>
>>>>
>>>> No, see my explainations above. This is not my suggestion.
>>>>
>>>>>>
>>>>>> AFAIK Nouveau doesn't have that problem, because on timeout we just
>>>>>> terminate the channel.
>>>>>>
>>>>>> Would also be interesting to hear whether other driver folks have the
>>>>>> problem of free_job() being racy.
>>>>>
>>>>> I think that this is still a general problem with the drm scheduler and not driver specific at all.
>>>>>
>>>>
>>>> Maybe the free_guilty is likely a scheduler problem but I'm not seeing
>>>> an issue aside from that.
>>>
>>> I also can't see the bug. I fail to see how drm_sched can free a job
>>> that's currently in use in timedout_job(). If that can happen,
>>> Christian, Vitaly, please point us to where and how. Only then can we
>>> decide on how to fix it properly.
>>>
>>
>> Again see above.
>>
>> Matt
>>
>>>
>>> P.
>>>
>>>

