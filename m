Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 052749A0B12
	for <lists+dri-devel@lfdr.de>; Wed, 16 Oct 2024 15:12:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A34F10E15F;
	Wed, 16 Oct 2024 13:12:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="uDFiJkKB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam02on2063.outbound.protection.outlook.com [40.107.212.63])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1ACCF10E15F
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Oct 2024 13:12:22 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KfEWUCfzUbmAhFD6aqmT3F4XRxHJq1bpBb7PwyifUWp2QmzA7qibTHUQaxHuKpHBT6bmo5i2unqT1wZhKENriZ4OnrjeYFpuPXcpFcElPI2rKgv2eP8rDf99WTVz1JbmIqRwXCDsHGsPo5/l7y4RI8JLeQSsUtuwGOqs4jrs6oKiS3d893w5UCCGTtVJAt6ILNYTTWyojb71Se5I0HHgwrH5o+pALk0Guw4aGDGX+8sUuteySK3Z+z07EBPZDic/QhjLIax1y3QeezYKaQFVyLTHUSyhAvrlMrFLTiCMWO9to7WDRaSRWnAqTXog5/pit3MScj/mjIJVKZerPz+ifA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=G4sSvorHaxGW1lrdXEAWYKjutDxf4J1+oOvPXYrItfM=;
 b=s7fjj/+zJnhcE7khTId+f9ma6Y4qnj8jYxMD3w8U3HkLCX5EJ+udqk1myXVmNkIyqjsKpFOT0xYRsrhrXNYr77B0qTfDbtAQ/nASf8/z3EMKGjkr3zDe5W7T8l3nlh8hoXArLn5b+aUDBSQaEoawbtFE5Vsa1ZWu2LND43c5HGz2kjVmmOZX0ot4huni2PfWEQRhF4I6vpfW50O/eiRY9rI83Nm/P5WXr+NXe/LMkzk5vW7zFNJ6WziESnf2S8MWB8OUvIGFd1+sESMXlmr9I5nguoARbmwCWkO4Ct2VQyHrBFNc+LK8d/tNiiUwCaZUdG51ERAvOmmrtqPHqoHusg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G4sSvorHaxGW1lrdXEAWYKjutDxf4J1+oOvPXYrItfM=;
 b=uDFiJkKBOArQjSh/JViixkN34Zn8iwBj2NsejgJ9b3axpVgKL9zMxAA+RETfuDs6MVynKIZ314u4paJAz2Gn7nTCc6sGKsXE9WQkXW5Gvl1sB4tkEhaHXnVS9gAkvZPRMpBeVGBUWwKEf3YlxamWHAFut3SKLRLAf870dhIPB00=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from SJ0PR12MB5673.namprd12.prod.outlook.com (2603:10b6:a03:42b::13)
 by IA1PR12MB7567.namprd12.prod.outlook.com (2603:10b6:208:42d::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.27; Wed, 16 Oct
 2024 13:12:17 +0000
Received: from SJ0PR12MB5673.namprd12.prod.outlook.com
 ([fe80::ec7a:dd71:9d6c:3062]) by SJ0PR12MB5673.namprd12.prod.outlook.com
 ([fe80::ec7a:dd71:9d6c:3062%6]) with mapi id 15.20.8048.020; Wed, 16 Oct 2024
 13:12:16 +0000
Message-ID: <94be6c2a-47fd-4157-b5d8-307040eaa3b7@amd.com>
Date: Wed, 16 Oct 2024 15:12:05 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 9/9] drm/panfrost: Explicitly clean up panfrost fence
To: =?UTF-8?Q?Adri=C3=A1n_Larumbe?= <adrian.larumbe@collabora.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Rob Herring <robh@kernel.org>, Steven Price <steven.price@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Sumit Semwal <sumit.semwal@linaro.org>
Cc: kernel@collabora.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org
References: <20241014233758.994861-1-adrian.larumbe@collabora.com>
 <20241014233758.994861-9-adrian.larumbe@collabora.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20241014233758.994861-9-adrian.larumbe@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0250.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:af::20) To SJ0PR12MB5673.namprd12.prod.outlook.com
 (2603:10b6:a03:42b::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR12MB5673:EE_|IA1PR12MB7567:EE_
X-MS-Office365-Filtering-Correlation-Id: 316d75e5-948b-4d44-0816-08dcede4288a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|7416014|366016|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Wjd0ZzFhY2VNaGdKZ0ZWUkJIbHl0UHdqbE40ZDdXbUF3NFFyMTVUMGtHc3pD?=
 =?utf-8?B?WE0razBBbDZST21SdjhMN1VDZWczSG9RZEdLdzBmbUR1Y0x2MTFHeWc5RDhv?=
 =?utf-8?B?MGxNd1hCTG1saVZhTWZtdEhRaHFCUDY0dTdwZFFjUTE1bFdxU3NBNTBFejF2?=
 =?utf-8?B?SHV5Qm1JVXkyVWdvcXc3alBBYUwvN2s2SVlMOW9PVldVSlN0dmJaV2psMGx0?=
 =?utf-8?B?cS9aVjloR25qZm1zMzZ4Z0dYaUc4OE1GMlA5MEVQdVZDV2Y4N3dXcFRUZ2NG?=
 =?utf-8?B?dDlCTGc3L2NWZG56NGtTakU0S09JenBUKzdDdDcwU3g4QWR3akhENUtCYjJr?=
 =?utf-8?B?aU9qSTNpOHhTY1VydnNiMHhCb0d1MUZVeVVPVXhvSUo1SlZrM1oxeVhqYXZh?=
 =?utf-8?B?d2VpaG1WVUlieFE2VXp4anFIb1RBZmFSbDZhSnJtcndWRzBFZjZvaWpMVVBu?=
 =?utf-8?B?SVB4QWQzU2xDenBLdm9tYlRRU1pnN243d09pM1BuNzNvVUYwYWo0aklOWnVJ?=
 =?utf-8?B?S2t3WEk0L3IzN09qZTY4UmpvNDFEbVQyL1ZCd280U2JPK3gvTW9iZ2NQbXdx?=
 =?utf-8?B?bVB4eUtVQUIzU2pHTHBtQXpNNWFnS3F3RldXUUdOcUcxUGNzZ08yV3VFamg5?=
 =?utf-8?B?S0pMalJZUkJRY2YxTkFBamNhQjVvcDRvVG1UR1FZMEtqMzNCc3BRWFh4ekkw?=
 =?utf-8?B?S0xHc0FjSUJBM2NSK29QcE9WQ3U3ZWdCdThuWUMwZUVxWDV0TS93eGNVSXR3?=
 =?utf-8?B?UllXMTdCYWkvYTBFZ2p1eXNickQvYlJJaVZuaUdwcDZqRWJHNTQ2MHNYYmZr?=
 =?utf-8?B?TlV4dUNodUs3RVNlT0cvbzZWMm0vekQrbzR4NDUvd0I1bGJXZUtwVVdpY1hI?=
 =?utf-8?B?V2NFMS9MWUd0UytZQmxPcGZTOUJFYWwzRGwza29sU2FJOE9GYWk1QmVJYmFm?=
 =?utf-8?B?YmZsUEFWbm9HZ005ckczU1BrZGd4dXNXRFl5QWxJdERrS3FzdkNjcHB4Q2NL?=
 =?utf-8?B?d1QraTFSTUtobnRzbUgrRGF4M3lybjZVMmoyRVRTdXJvT0F2bTMySGRsU0RO?=
 =?utf-8?B?U0NnTjNzUzFySnZCK3Viek8ydHF6S3R4N0djR3pBR1ZScmROa2pMUFVOQndM?=
 =?utf-8?B?MnFOZTdLMTRBd0I2bHAxcnBoMnlCa3ltL1NrT1BzZkE1Zk5YVDVCNG9lSDAw?=
 =?utf-8?B?VVI1UUZpOTRHS1VMZjdKRzBqdnVaVXA1N3lrS0hib2NjYndTLzB4TFhQdUxa?=
 =?utf-8?B?SGJSRWppMXkxTVlTTDdFZUR5ZjVnTG11WGEvMGJ1R2RkaW84d1RVWDQ0T3ZC?=
 =?utf-8?B?Y3J0dVJUVEg3R3BlVkRwYVgrY3VUWFhoTmVmRjMwSmVUaGdNeTdFN3EreTJo?=
 =?utf-8?B?c29vNG5NWTFvWktEM1Z3SkZHV1dZMnFuVTFTWXN1dmYydm1sSGVmSHJCRVZU?=
 =?utf-8?B?OFhZZjVnenQ0cktsL2JFclZkVmN6cFJiN2xYbWs2UGtRTTVVWU1xOWUzdGps?=
 =?utf-8?B?bGIzSG81aXFVMTNnamJQaDRHcHhjUElUQlI5UFlGTDBNZU5BaUIzamFhNDYz?=
 =?utf-8?B?dmxOZXorV2l4dFZTSEIxZlEyT05oUWFCNWFxc0FiWDVBczNNTUZZS3RVb1p1?=
 =?utf-8?B?V1lzcGRhOW5hNjJudGlhdGxnaWhnMFd4RXdiaC94Vmx1L2pKMENxL3c2UEpD?=
 =?utf-8?B?ZGhwZ3dYUVVTRUF6cW80aWdsalZjcGh2bzZhOExaSGZ3MERJQzBtTlhhb2dL?=
 =?utf-8?Q?MBbLaW06QQjiDJfuX0+muzDggkvZndAgmLSOFI1?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR12MB5673.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(7416014)(366016)(921020); DIR:OUT; SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UHlDSWRWcFBNZFJBLy90SDdXeEFDa0k1blhMNEFEN2JPakc4TXhKbVZaNTZq?=
 =?utf-8?B?MDNmTFhuNDhIWjBqeDdHY2E2d0dhRGtMNXUxM0t4SHRqWHB6MFJ3UFp0S3hS?=
 =?utf-8?B?bFpkdEJJYWZ2RURYUzREWVFGb2FoTVFURkZOaDFQcEFQVHJmems1WWo4V2Ez?=
 =?utf-8?B?eWUzS3VLVnVramhwT1Z1ZGExRjM4b253c0gxcldDWXZ6bnpWcXR0YTJPSHJn?=
 =?utf-8?B?MlQ3VXdodThOaHRvdzN3Q2ZBNk5YQ2lpSFNOSlAwOHJlaVRRRGt5UFBqcmJ0?=
 =?utf-8?B?YzJzSTZYQlRPTjBQeWcyQWZhRlNIWjUzVXNzbmRpWmZOTmQweDBqZy9SYzBo?=
 =?utf-8?B?MHkrZ25hWWVRK093TmhUMmJGYVBpVVNCeVRQeW85TlJ3ZllwV3ArejhCRjZL?=
 =?utf-8?B?eEMzYlBCQlNlMk41NEFhZkQ2UCtHR3p6MVlOQVRkSkcxNHB3NVJqNmFDcHFi?=
 =?utf-8?B?WUZWc2NWendPd01HaHo2WVQwN0tJWnJham01aXNHeGU4aFFMTXlkOVJQQVFy?=
 =?utf-8?B?Rjk4TlJWRXNnMCtrbEFjVTRaMHRqMW9uZnhqRGh2em9hNlJMZ25ISlZpK0px?=
 =?utf-8?B?cnFMOU1DLzVOeHR4YVFtbGJOQkFlQWtQTndvbTdIeGN5SkcwOWtKckJ6azBV?=
 =?utf-8?B?LzRId2xMRFQ3b2Vma2c2dTg1K0syZVRjZVBSY3drZTZkdFp0SlNSdW9tZXVk?=
 =?utf-8?B?VVlXUFlmaXFqTzZqczJhMndlLzhJRTNNUUdyU2t6eFVMYW04WDl0QVdaVW1B?=
 =?utf-8?B?TmZldDU4ODRXR21kdVFaaVdqMXcwUVpQRVdhRnpoVk41YWhxbUZmS0J2cTJm?=
 =?utf-8?B?S0NPT2JiQU04Q0NtLzY1Zm1uK2NrZGY5MXcrRzZNbjQxZGpGeitnQUIzMWpk?=
 =?utf-8?B?V091bFdsUmlzSUovV2JpUzg1RGMvbzFDeVhvbGE3U1pNYUZXb01MQmFIbmxQ?=
 =?utf-8?B?SzRLSWtjYllOT09WTXR4YzhWWFc2aHpiS0N0V3duY0R6MVp5dVlIa1RzODdR?=
 =?utf-8?B?RXFMY0JJcWZWdDhtUUdUZ3FvQlAyWDN3bzZ6TzBKd1p4UjVQVVlQcXNJeWdB?=
 =?utf-8?B?REFmSWNLdzJWb29KaWE1MUo0WjhRN2UzNXNpWmpKMGZHMDdndW11NVFjVEdY?=
 =?utf-8?B?OE56bTZsR2NRdE9xRXpVVytyUEVCVUxaZDVLdUs5MjdFZGNqek83eUJFRXFS?=
 =?utf-8?B?d2RIYUVxYUYvcEtIYklTdERJRUlTT3ZkT0s4ZXJaVFp1STlaMDZqRUgyT3hH?=
 =?utf-8?B?UWJPcFl0U3BZbTZVR2h0M05LSHkvbG1GVklHRmcrWWJLVkxrSG9wdlJJMmUr?=
 =?utf-8?B?eVFvY3hFeTNhSlczK0FwblpSV3JmQStVV0Zwbm5jdWpHRkoyYWcrK0o4aS9j?=
 =?utf-8?B?aHBuS2JJcTdkRjg3SmVFOXhOdFIvZ2hSbWMyVkF2Mk1RZ1E4Uk02OXdjalE5?=
 =?utf-8?B?WURLY3U1RlVnK2VQMi9RdG1iNTJrUStFeUJDU3lWYUZsUlAvV1ByTlFpMTZI?=
 =?utf-8?B?S0lGTmdhVWR1OStCL3dhNnE3cDhnRTg0VW8vZU5Yc253dUE4dHhiQWhhOTBw?=
 =?utf-8?B?SUJLV0JEbURGQTFMajdjSm1vSzlsbndNUFU0V0VIc0Mzb2h4dXhYaVR4TDlp?=
 =?utf-8?B?UDh6VzZNZUh3ODB5UmZkRUt4YVNmeXB0NytpdXdQUXQ1SGFZN2ViaHNMSm5n?=
 =?utf-8?B?a1B0SEhIY3JLL25BSFNwaFZrby8yUE9nVjIwNGhwZzY1MmJYcmNOUjAweU1F?=
 =?utf-8?B?ZTVCZ3lMMklsZkkzZnJaWUxsTlZpZ1ZXWmJXdytoOHJEVmh5YnhGVDIwNHBJ?=
 =?utf-8?B?K1lLS1FYUUo0K0lnaFAvamNLWmZXeGZoTHN0amd6SW0zd1JCSUV0UmJ3dmNZ?=
 =?utf-8?B?OGZ2VFFyT0g4MXdzTXlWeXpPTFVYbVhrVlN3djdmS01RUThEUU9teU5wRlNQ?=
 =?utf-8?B?UysrVEMvTXFmODhVdW50NVorL1FPb043T3BiYXo3eStWVGtDQ0xvZy9UV01U?=
 =?utf-8?B?M0N4bUY4V1JJdVJEeEQxdFhvcU1UZFZxS2hoQjVUNEQwUFBTQzFnS2ptaXAx?=
 =?utf-8?B?bnpqNVpvMXdzS1gxMGxibWczTnVzc2Z4RjdZL0xXOXM4QzUyQzNQT1lTRFdK?=
 =?utf-8?Q?U2W5zv728Ugdlo6VkkK3DxI+R?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 316d75e5-948b-4d44-0816-08dcede4288a
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR12MB5673.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2024 13:12:16.9224 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UCPrZIHnuDz9Yn5YsMVJR9ulpwZue5aURyJ6u8wjOLc5VzNneTuccw7Gi5HKWZ+5
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB7567
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

Am 15.10.24 um 01:31 schrieb Adrián Larumbe:
> Doesn't make any functional difference because generic dma_fence is the
> first panfrost_fence structure member, but I guess it doesn't hurt either.

As discussed with Sima we want to push into the exactly opposite 
direction because that requires that the panfrost module stays loaded as 
long as fences are around.

So clearly a NAK to this one here. Rather document on the structure that 
the dma_fence structure must be the first member.

Regards,
Christian.

> Signed-off-by: Adrián Larumbe <adrian.larumbe@collabora.com>
> ---
>   drivers/gpu/drm/panfrost/panfrost_job.c | 6 ++++++
>   1 file changed, 6 insertions(+)
>
> diff --git a/drivers/gpu/drm/panfrost/panfrost_job.c b/drivers/gpu/drm/panfrost/panfrost_job.c
> index 5d83c6a148ec..fa219f719bdc 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_job.c
> +++ b/drivers/gpu/drm/panfrost/panfrost_job.c
> @@ -85,9 +85,15 @@ static const char *panfrost_fence_get_timeline_name(struct dma_fence *fence)
>   	}
>   }
>   
> +static void panfrost_fence_release(struct dma_fence *fence)
> +{
> +	kfree(to_panfrost_fence(fence));
> +}
> +
>   static const struct dma_fence_ops panfrost_fence_ops = {
>   	.get_driver_name = panfrost_fence_get_driver_name,
>   	.get_timeline_name = panfrost_fence_get_timeline_name,
> +	.release = panfrost_fence_release,
>   };
>   
>   static struct dma_fence *panfrost_fence_create(struct panfrost_device *pfdev, int js_num)

