Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DBFA9D2821
	for <lists+dri-devel@lfdr.de>; Tue, 19 Nov 2024 15:28:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 101B210E030;
	Tue, 19 Nov 2024 14:28:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="HN9Lmpyk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2042.outbound.protection.outlook.com [40.107.92.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5FD0510E030
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Nov 2024 14:28:02 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LhvNXfAutLpBF3wov+arglBYKJMnWnusWVZsyPaXrq97VwNkrvoll2dKOFTXPsF8Jk7OoS5CES2E5WKU8/uCDBeFtIp/nTj2KRLkZuwKMvTfWTRZOL5/8EzzAw3Boeyfe8/HJS235jlrtawF0cxuNqUhW1Zn44b315khcSHw8vW1ploAHIkLr+coU2u4YzKEcgfnxx6Ak6Y/PGZZVXgKpR6GfttqNj1J88W8PiNru9yhKoUGmIWVAtu7w9F5z3HMdQK/e+1/P+imHm3yQaQCEt8BnteE3lEaYBMdq4mD9ZbwIQEBNayy6W3/ECd+PTecGvOdKNg1GiQtqLKNAp/Sew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Opp0lwGleE96Nk4a8kMCubwWfTjZ17TZ46rwdwlEbkM=;
 b=vlseosnqpBhjLYtLmUOajrVOjerB0gNjMjlZVCfWg+0fwc8LaBCtEujT7/FyRHL7oOGrsfVUFeI/31JAcX7doqhT2h19DwwDd2xhWi3ur0c6oBIYFEtiGMsHYtF4xCVr7cB2vkrYy/525bMzX4bVMEgIPtzTCH95D5Hq2EpdnSRGMHpywyEPIcu2vQM1pgJwajZ6YKkbVICP8Ehv5Zn/cAzWgrY/Pj/P5x21c+0QeYfvqBdLTmSSpPGc1waZGzfXpWh+s9J6bI7lNMzsSW7WQeUS6Qf/t2NyQNaCn6P0/EH+ok7n3d2es0fplU9fUcPjj1m6itY0cIMOfWR+IH4zSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Opp0lwGleE96Nk4a8kMCubwWfTjZ17TZ46rwdwlEbkM=;
 b=HN9Lmpykj9gGXjFXpLLiYTCME+/Y3xAaoy+nb5Kd/tWBhCvCLoe5n07oFu+Tu98cdWuiuwbkBhpQDM4NCOWwrBisTB3FHl10W3nImo0CXbL1yl/5jGtHDMGMSP+QgbhypgvJ80DFVgC54FHU768qQn45SkCDhl9DwWxtj+KGiOk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by MN2PR12MB4288.namprd12.prod.outlook.com (2603:10b6:208:1d2::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.23; Tue, 19 Nov
 2024 14:27:59 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%5]) with mapi id 15.20.8158.019; Tue, 19 Nov 2024
 14:27:59 +0000
Message-ID: <919d1a3b-6757-4902-ac1a-b056c9fdad06@amd.com>
Date: Tue, 19 Nov 2024 15:27:52 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] drm/sched: Fix docu of drm_sched_entity_flush()
To: Philipp Stanner <pstanner@redhat.com>, Luben Tuikov
 <ltuikov89@gmail.com>, Matthew Brost <matthew.brost@intel.com>,
 Danilo Krummrich <dakr@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20241119134122.21950-2-pstanner@redhat.com>
 <20241119134122.21950-3-pstanner@redhat.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20241119134122.21950-3-pstanner@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0059.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4b::21) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|MN2PR12MB4288:EE_
X-MS-Office365-Filtering-Correlation-Id: 8d39e722-38d6-47d9-14d8-08dd08a65dd9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?YUhPVkFWeGhXdW5MQThrN21UbnVmZXBEdTJXWWNxSjQ5ZnU1d0dYbXdlUlVl?=
 =?utf-8?B?YnFMWHFQZXlXdDR4RFBYT0lPWlhqZ1dlbUYwSGdOQkNTWnQ5dEhzbzJNbWR4?=
 =?utf-8?B?UzBQcE9HTFdta0djMHNBSEdRUTMzSngxUG1Kd1BMNmZrTXZvZGRyblhuckFV?=
 =?utf-8?B?TUNCZ1Q5a2Q2YzBpazUwbnRHOGFoOWVIaEVxZGxmbUFHV0lPa2Ura1k1NU1U?=
 =?utf-8?B?UlI2NGIwUTZiS0xIS051SXF2VDR6ejJhbTd5NHgxSUZpQ2o4bHNzUmg1WFBm?=
 =?utf-8?B?cFp2N0JobnNkWEthYmhZcWZ5NHhHcWlEQ1ZyVklMM2xtb1UzV1Y4N3B5bXh3?=
 =?utf-8?B?bUZYUElNeFVjVDRsRUVDVk1KZndQK09wbXdwUzNDdG5haVpjbG1WNzQyZmlm?=
 =?utf-8?B?aktGdTE4S0xtSm9xbUkwaWpmb1ViNTRyaUdNTGpQSGx3Q1lIN2ZSUmY4R3pG?=
 =?utf-8?B?ZngvVzFVOWIxQ1IraDJQcmdWVDh4NndWT0NHOGtNRDZUVlBsSHNOOU5XY25n?=
 =?utf-8?B?UHI1aHdrNkdKVmlxSlMvQmlyZFZhMExaZWc1UGVuMnVGU0Q1enpMZ1JmZk1C?=
 =?utf-8?B?YUUvOTZrWjhnaTI4YWdTOHFjTitrLzE0SUlPMzNrbW0vOG11Qytva2xEcUxQ?=
 =?utf-8?B?NHZvVS9pQlhJeHNqNVBXcDZuakR6QitabnRubGRnZVQwZ3VjQkI2Vy9JSDJG?=
 =?utf-8?B?WUU1OWRyUHY3a2FpdFcwYkt5a0Q4c3FoaXpWRCtRQVpGZG5UWi95TkxZR2Vm?=
 =?utf-8?B?WW9JcmR1dlJKYnBBRk5VZTBTdFZ0RFdvRmxEeHp4Rm9iZ2dLU1lkeWhqLzF6?=
 =?utf-8?B?UWw3K3RUZmhxYnJGQzZrdzJ4UFIwOVFPK0dJNGxWb21CTlUxdVIzanVYUGlH?=
 =?utf-8?B?dnNPRjBlaWw0dXoyQ3AwT3BCdEt4ZDMrRXRhUXN0UGwwZ0Izd052T3lnNHI3?=
 =?utf-8?B?cnExekRJTU1OaWE5eHlKOTlNL01KY25ZQk9yVTBHdXVHOUhKOXZQajZQcFhP?=
 =?utf-8?B?bXV0K3pMajBqQkoxeDNScit1VWhGRHVxUXhMK2VxdzJGN1V5ZERVTzhoY0Fs?=
 =?utf-8?B?L3Rhb3orSitmdEJhcGdqdzE3TWc0THBIbUxSZDVxdzZkeE5ya1RwQ1M4cVFV?=
 =?utf-8?B?V3J0aFI2VE1jZUFrVnpOcFJ0OEZwcE0yMytzNHRMTS9VR0hPYUVtbU9TdjY4?=
 =?utf-8?B?RXJBR29xNlBob20yK1J1WHg4SWlsOVVONUp6RlVRODYwVHdTOU1mRjNYbkIv?=
 =?utf-8?B?WDFrZ0JqdEVndzM1TlZFTnlPRHcydlVSekJTVU5ONC8zaVROVUZqdVBKcGpj?=
 =?utf-8?B?K3FIekNLUHJTeG5iTkhRS0UvZXZBNC9zWEozeHhPRWVTdWdJYmt0S3Q2QnRT?=
 =?utf-8?B?SnZNOEdUMHlGVnNKZU5vTUNrSllLRGJSSmZWU0s1SEhLdDZwOU1RcFpOU2pI?=
 =?utf-8?B?aCtaTmU0QnQxdHpHL1hEM2ltMzNrbjhGQ2NYQm9Pek92UWhucjZVNlB1TnZT?=
 =?utf-8?B?V21WcnF3NzkzMTl3OWhNakFRa0Z3V3Q5bGU2b2pTZXdhSHZ1NWNNdlhieUJk?=
 =?utf-8?B?VEM1V2hVekk2YnJRUHVsSFpDVDdOMy9tMUlyMk8vNGwzdjROMGU4dFhUY1Bu?=
 =?utf-8?B?ekFFY29VenlSN2Q3OStpUWRmUi9VWUFmeVNjQmZBV2xyaCtJUWVwVWwydDBp?=
 =?utf-8?B?dUlxSmZzdUlnS3VyaUl1eFRTTnpoM0daNWF6ZHBlQW1EYkl1YXpHOUtYM0FP?=
 =?utf-8?Q?iUBEbM0xnFphHI7/0eBOd/yLumcbDnk/S9hI4QZ?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(7416014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Ky9Pbm9pODFmMWpJTXl0UXpubm1iWStLUjVhTk4yUGtPZ1VOZklHYUJZWHlZ?=
 =?utf-8?B?QXZ1SWlWODdVL0trNWNOVHVxbG8rMFgvU01nRnRvdHUzVHhsOTFiT1lFWXRN?=
 =?utf-8?B?aEoycU03MjFaTys0MnF2c1lpZWt0cFh6aUF3VHhPRFdmdWc1YjJ4eTFiaXRG?=
 =?utf-8?B?NElKQ25ZT1RFckpGeVpqQXBCL25tSDZvZ0tDdEViTmRIbG12NnVwWFdJSVBJ?=
 =?utf-8?B?UWFqWXNhdXRqVmRtTDYrRXAxN1RXZldkNkN0a205ZUpmK1d1UUl1N2tkYzFP?=
 =?utf-8?B?NEQ2MUQwZjhPeU1WUE5ZdkZ3aTd6K3Rrd3RVL080MElhOVQxaFZzYmpYK2dK?=
 =?utf-8?B?Q2dYQ0pObVI1UG15RHJZeXVsWmFHQW9SbDN1YVBMRmZSbHF5K0Q0S0FpWjQ3?=
 =?utf-8?B?TXEvcWN1c2tjaGp5Q2xkMnBYNGJVRlVwV3B0TENrR3RXODBpRWtGZHNmaHMr?=
 =?utf-8?B?WGFsSm1iU3dhemlmWXZRbUhwQ1NGOEtVZkNRTEFKYm1WTThqL0wxK2FTenll?=
 =?utf-8?B?ekQzdEU1a2JLVEpLUWtlclU5NTV4M05zZW54R3ptNzVBZXpLSjU4OUFWODdF?=
 =?utf-8?B?WjJKUVRFZ1ErWWpjb2V2d1FXZUVwbGVqdWVZKzZrelRNTFNsOWtPN2RVTEpN?=
 =?utf-8?B?Szd5UmdqU2tET2ZoamE2VEF4YXpxeTcrTHpXVExZenI0SVRrTGRmL29mT1lI?=
 =?utf-8?B?bkJyc09LTEVyUHFITTFTUThhb3dQS0tTNGZWSU5hRlFGVE80TmYrVWxJbEZZ?=
 =?utf-8?B?d1lLRnFYbUpGYmpOVGxNZ0k0M1FXN3FIUkwzS01hTXU2cE90Wi9PejBHTjBp?=
 =?utf-8?B?ZzU3K1FDWlZSNjdtajVjTUR6c0Zmc3dtcXNTaFRIaWg1TEdmV01TWFlENWNk?=
 =?utf-8?B?ZXM5YmQ0VjJtT3BCZHdFc1lCS2c4NVduaWl6eHZOV2NqNmZKam9UWm1SWU5r?=
 =?utf-8?B?aWxyZ0FjMEEwYW1ocXNoTEVUcG9xRi9zMktSTmlIRzV6dVZOR3p2NElVeG0w?=
 =?utf-8?B?SGo5WHJCazdvQTdsNmRsdGt6b1BYeEpRVHRQa3N1T29xUXg0Wkd0MENMMFNO?=
 =?utf-8?B?azg0TXc5S0NsMzdXWVBhNzh5blc0UUhiR3BQazJIS0h2MEFqcjFvS29LclFT?=
 =?utf-8?B?Z0NxV1VOaktDQzJZMnhFUDdpcXhVTTFndmVPaTVMc3RzWENyL3gxeWJPNGdI?=
 =?utf-8?B?eFo5d29Mc3dUUzY1by9CR2ZsRHQ1NzY1ZUZYL0FsUUkyaENmcHF6YW9mNzk5?=
 =?utf-8?B?WmZiMGJoSy8zZ24rVlFzcVZZcDB6L1lKVElTY2dSTUg5SXBEczFPTzJiNnYv?=
 =?utf-8?B?akVzTzRlTjRCUHNmUk51eEIyRFlKdU1mZWx6a25VT2RzQWJOZDYrVkpQOUFF?=
 =?utf-8?B?azVjNlhSQ3NIMkNPekRrVjBHbDZlTU92VlpTY0l0aXo4YUxLVUJ1andqK0xl?=
 =?utf-8?B?T3VsbFVMMS91Q09MMWdScWZxNy85RlcxdzRFa0Jmb1VCc2xQdU9LMXJhR0Vt?=
 =?utf-8?B?a0psKzZ3SFNsVGpWbCsrek4vQUhXWGFBN1lkNWJ1QXgxUk80OXpRbFg5NDNw?=
 =?utf-8?B?VVphMXV1RVNKYUdaSEtiaGczc0tpcUtwSFlxaWtGUUp2VGIySllKMy9IYnox?=
 =?utf-8?B?UThyRXk0UHNhT1ZScmpONDNaeXkwVWxNMFpYTjZXWG1xSFlNaVdwQWhkY2lC?=
 =?utf-8?B?bTBBQVhOWlcza3ZiNjJSWUVGR3FGM1hMSUtEY3Z6Ty8xTVU5M0ZBUlA5QitN?=
 =?utf-8?B?NUExNCtqcm5qN0M3TDlPaXJIM3pXTnJSTTlITnZsNWhkdVg4azg0RkZXRGZJ?=
 =?utf-8?B?WWhKbGxNOWNPdDhXTWc0QVJTNU1QUmwvMTBWZ0tCa21iTk56NE5GSEt5RTJB?=
 =?utf-8?B?emZYNDdCMEhzN0dyNThGRlBOeVlMRXBqZDQ3WGN1bmpaUytkbytmcHR0ekxi?=
 =?utf-8?B?Ni9KbStLSlhCVE5oVHA4VGJ4RXVYenJWbGdZYXN3UU1iQXNoRVZORlZwWDUw?=
 =?utf-8?B?ZXF6T2RPVDJLbEphTHhwaDE1Njd2QTRYTjZ0NWVVQ2JlSWI3bmRhNm1QZmxa?=
 =?utf-8?B?bXB3bU5TZ2FITE0rN2V2YWxWM1RscVM1cXNwNk44RnA2VTBseEZ3S0h6b2dN?=
 =?utf-8?Q?tgWoYmi0nq3M2EXgrtMiCOA0O?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8d39e722-38d6-47d9-14d8-08dd08a65dd9
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2024 14:27:58.9787 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3HfXKYshOxz/IQjT90AoMB7QdETbENkrhF6DCHZ/jxxdOm3vmwV+HvMBVhyDouxZ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4288
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

Am 19.11.24 um 14:41 schrieb Philipp Stanner:
> drm_sched_entity_flush()'s documentation states that an error is being
> returned when "the process was killed". That is not what the function
> actually does.
>
> Furthermore, it contains an inprecise statement about how the function
> is part of a convenience wrapper.
>
> Move that statement to drm_sched_entity_destroy().
>
> Correct drm_sched_entity_flush()'s documentation.
>
> Cc: Christian König <christian.koenig@amd.com>
> Signed-off-by: Philipp Stanner <pstanner@redhat.com>
> ---
>   drivers/gpu/drm/scheduler/sched_entity.c | 18 +++++++++---------
>   1 file changed, 9 insertions(+), 9 deletions(-)
>
> diff --git a/drivers/gpu/drm/scheduler/sched_entity.c b/drivers/gpu/drm/scheduler/sched_entity.c
> index 16b172aee453..7af7b448ad06 100644
> --- a/drivers/gpu/drm/scheduler/sched_entity.c
> +++ b/drivers/gpu/drm/scheduler/sched_entity.c
> @@ -270,15 +270,12 @@ static void drm_sched_entity_kill(struct drm_sched_entity *entity)
>   
>   /**
>    * drm_sched_entity_flush - Flush a context entity
> - *
>    * @entity: scheduler entity
> - * @timeout: time to wait in for Q to become empty in jiffies.
> - *
> - * Splitting drm_sched_entity_fini() into two functions, The first one does the
> - * waiting, removes the entity from the runqueue and returns an error when the
> - * process was killed.
> + * @timeout: time to wait in jiffies
>    *
>    * Returns: 0 if the timeout ellapsed, the remaining time otherwise.
> +
> + * Waits at most @timeout jiffies for the entity's job queue to become empty.
>    */
>   long drm_sched_entity_flush(struct drm_sched_entity *entity, long timeout)
>   {
> @@ -290,7 +287,7 @@ long drm_sched_entity_flush(struct drm_sched_entity *entity, long timeout)
>   		return 0;
>   
>   	sched = entity->rq->sched;
> -	/**
> +	/*
>   	 * The client will not queue more IBs during this fini, consume existing
>   	 * queued IBs or discard them on SIGKILL

That comment is actually not correct either.

drm_sched_entity_flush() should be used from the file_operations->flush 
function and that one can be used even without destroying the entity.

So it is perfectly possible that more and more IBs are pumped into the 
entity while we wait for it to become idle.

Regards,
Christian.

>   	 */
> @@ -359,8 +356,11 @@ EXPORT_SYMBOL(drm_sched_entity_fini);
>    * drm_sched_entity_destroy - Destroy a context entity
>    * @entity: scheduler entity
>    *
> - * Calls drm_sched_entity_flush() and drm_sched_entity_fini() as a
> - * convenience wrapper.
> + * Convenience wrapper for entity teardown.
> + *
> + * Teardown of entities is split into two functions. The first one,
> + * drm_sched_entity_flush(), waits for the entity to become empty. The second
> + * one, drm_sched_entity_fini(), does the actual cleanup of the entity object.
>    */
>   void drm_sched_entity_destroy(struct drm_sched_entity *entity)
>   {

