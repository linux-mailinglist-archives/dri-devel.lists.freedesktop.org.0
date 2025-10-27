Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 712B6C0CF38
	for <lists+dri-devel@lfdr.de>; Mon, 27 Oct 2025 11:27:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6965110E02D;
	Mon, 27 Oct 2025 10:27:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="nh4+rk0m";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from MW6PR02CU001.outbound.protection.outlook.com
 (mail-westus2azon11012028.outbound.protection.outlook.com [52.101.48.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 97E8A10E02D
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Oct 2025 10:27:11 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BwK0yoSYhNTcBvp8gdyfuYQwOCV0pBdsklVE1u/7DE6Nqj5J1/I+pbPwUnkgyA50vso1xino6BS5AGHRzCAwloLaZ9yiJ6jmcjuFBG1R36kCxUi/HutneWZuZkRhVufsu/nieABfsB/nWBUTTwDeTPbbyPYEoKYgvnxEpCQsYuwfQojV/2ZLkiCjkGEwxRgL5jmpGbK/clnuqlBKwtH5X+Z1BM/qfE3SaBZS44P9JHhXE9beQ0/ei3g1rxwX6EyWTxFvWvXBDd/28L2lT6AAK2ortf8Fg3LC0LeyekVFIVFG3hgOUenBDoq3Kn6tVwpqrtFJDd88EcngRzSYQ3k3ww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pFFxY48s/XZ3f6VHWCeRn9J54fqVLa/izDPG1C2rmsY=;
 b=fr6cmFu62BvT2py3Xx7YH/Z4bMRHQ5iI5TQtRqTyaetloE6IzgnzeCLxc8Lxt/8ayWLubLP98zf8et4SfdFOBDoa2Sa/fiCWxGlZpcFf7D0kHei1OLWq4ZoIcf2jywJzJo6bY+0iDnURMOv4cngHfpItmtMiuuE7ak/Ly0zj3DOflZkhj4CvScTGmwyqPGPYs6KLG6wCbFNdBdim1tRh3lpB6g9p2RD/HN1lq9/XptBbMqY6zPT1a0AngdCGhs2pcMYnuPJqv+fg8+1tZzT66FvaqwxKF6eru4F1HKO7bSHQhU2LUOF71NCbM+FUsplprIlkc2n4Ln7mEdB5ABiksw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pFFxY48s/XZ3f6VHWCeRn9J54fqVLa/izDPG1C2rmsY=;
 b=nh4+rk0mXdkkhOMIU+9tTOHGY3a97nVI4g7Z/sbt+3gXzppha7OVpjwfbDHwCAdx80uq/GUa+GGg1jZrfxmyjSmK+iQ9FcUcLzWm4jtmBVQ9QVmC7MsLLyddDSOCW6AsHRv0Sjf6yH5odEN8IFW7lKgIPUDodRFDf2fWa0iQS+E=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by SA1PR12MB7175.namprd12.prod.outlook.com (2603:10b6:806:2b2::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.18; Mon, 27 Oct
 2025 10:27:09 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%4]) with mapi id 15.20.9253.017; Mon, 27 Oct 2025
 10:27:09 +0000
Message-ID: <2c91b3ed-258c-46e1-8bf2-50c70d982cf6@amd.com>
Date: Mon, 27 Oct 2025 11:27:02 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dma-fence: Fix safe access wrapper to call timeline name
 method
To: Tvrtko Ursulin <tursulin@ursulin.net>, Akash Goel <akash.goel@arm.com>,
 sumit.semwal@linaro.org, gustavo@padovan.org
Cc: linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org, nd@arm.com,
 stable@vger.kernel.org
References: <20251021160951.1415603-1-akash.goel@arm.com>
 <d9c16e9e-8321-41fe-9112-e754445d8bb0@ursulin.net>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <d9c16e9e-8321-41fe-9112-e754445d8bb0@ursulin.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0146.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:98::7) To SJ0PR12MB5673.namprd12.prod.outlook.com
 (2603:10b6:a03:42b::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|SA1PR12MB7175:EE_
X-MS-Office365-Filtering-Correlation-Id: e442b857-4d2c-4648-7a4f-08de154361e0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RDBTUWJRaFdYKy8zbEcxcGg1YmdDRG13dWJUaVRFd0pRNWt3T25GR2hLRStM?=
 =?utf-8?B?S09nODBOcjI3VkU4cDBCYmJPVW82N1dheGprc2xUcHZxWU5VMXJ5cEJncG0v?=
 =?utf-8?B?enpzdnlhS2ZhWEtCRHJFMlBScWpzVlE2Z3Q0NTM1dS8xcGNGZjFkVGtXak1w?=
 =?utf-8?B?WnNrWE9JRGpmbElRN3Yrc1BqVlVLZHRyYWNaSnpUL081OFYrTE1aaGVyeGFw?=
 =?utf-8?B?UlpLVFFUQkhPbWx4dGJzSTRxVnRFbWM4Ym9iY01MS2ZRSFU5byt1YVNieDBj?=
 =?utf-8?B?akZWM25hT3hHb3pCL04zREFzb0dZRjdkWVdBOG9QNXg4WUhnUkVTTllTZGE2?=
 =?utf-8?B?UFZDS3RpSUxKMGRxaVpYZVBrUjhQUDhsVGtHVWdOK1RDUjVtckFvTnY5Mm9W?=
 =?utf-8?B?bk9XLy9xYktzcFdSa3JBaDR2QnVNUlo1T1pMdU5nZUhadFRlM1EzbjBiSnR0?=
 =?utf-8?B?bHlyRDVWN1hpRkpPNDB5elRCS0x4WXRMSjlTZ0x6ZVQ2cmk3UXp1alFIdStX?=
 =?utf-8?B?T3lrN09hVXFLWEZVL01rZEpXNU5TWVh3SEJGQUo1My9FNjVSZUxpUFZWZDZT?=
 =?utf-8?B?akJGc0UrZGRXMnlVbTI2djhvM3BvU29LeURCTkRZWkVEOHJCUVJoQ1MrbS83?=
 =?utf-8?B?d0xFU0xzSHFYeldvakpoWEdSTFFPSExERjdGbnBRcHh2NzdqUWxYVEZoOFFR?=
 =?utf-8?B?V1IrQzNEN0ZFK2xGdHpERDdoRGdOUVRJMk9sSTBzV043RkZhUHIwUjBhSTJ6?=
 =?utf-8?B?QTNac3Y2Mm1qWjVhdXZjK3k4SVRzL1JqZWs3aWliaWRiYVVSNFhQQ1RzeEpY?=
 =?utf-8?B?L0lLUUw0Tnp4dy80cW5QZk9sS1FlRnk3Q0tYdGpLMllseEZ1cWM3Z0RWNnk4?=
 =?utf-8?B?VnY1d2lWMGk4NUJGVTQyZlVLTWZKaUw1Ny9mdGN4bFFDSENPQkZOazV0MEU1?=
 =?utf-8?B?NWlBTklVZkN3MXFsOUdGQjY5UzczbmNpN2FyaVRheHlYTURobU9oOVRSdGFp?=
 =?utf-8?B?QjU2M09lMVNwdS9pOWdscStVdTJuS20wWnNZNFA3ZE8zdEdGNndhaE0rNEZ0?=
 =?utf-8?B?UnY3SFErZGozbzE4RTc0Wmc2VWRwZERZaXU1STkrWlZZcmhxRFhRcXRUNlVu?=
 =?utf-8?B?T0J6SXNVS0dWaUl4aW1HT1pwQzJUSWU4RGdYVTNIZG9aWmtjYXVWVzZRYTBY?=
 =?utf-8?B?dGVTajd2WmRqU1BRK1drc0VKVWFGdHFUUm5PMmloelowekM1dThQUFFyTlRE?=
 =?utf-8?B?c1ZQSWhuZ0pIODZSeXBCdHFGSW92U0Y0YXBhREFFMENxVFQxY0JvNXZkZHp3?=
 =?utf-8?B?ZEN0U1dPZ0tXcGRiaWJPS1dZOUxLTmluaXVLUnBoeFg3NGNlT1UxdStNbTlB?=
 =?utf-8?B?em8vZ29uZk5xVXNSUHpEOFYwNGdWdDduRXJkL3lzcGpXdmlyb2F1NWlyMExQ?=
 =?utf-8?B?YTM2ODF1RGFsd21Tam83NDc4NlkwamhGakhqcHlKSnJYN09XekhWTHc1OVZM?=
 =?utf-8?B?Kyt6Sld3bE9zbE9qMUgyQ2QwVmFwL1ptYXVKNlhrVXdlM1dLTnoreEdOelRF?=
 =?utf-8?B?VUdvNHoyODNFbFZ5VkRWNFZZWm11R0QyTk9tUHJSNWd3TVRiU29QNWFzK1ZG?=
 =?utf-8?B?eUVncnN0KzBta2lwcC84Q0tqc2VJRFdvVG8zemRpcTFFWk9MeXFTbzdvajRu?=
 =?utf-8?B?b0RYc04wKzFMdzlaY1dyRDI5UXdJb3hRdTB1aTI3TytSZmpxS2V5UDhrVC9J?=
 =?utf-8?B?L3BCa0IzYmo5NkZoM1NVWDgrdm5NdmswTWY2akgzT0x2WGg4MHRSWjNTdEVQ?=
 =?utf-8?B?VHEvWGlzKzQ0YzN5WG8zS1N6M1lxUmhxYmNuYmJaa2s3U0NlWXBNUjh3Tmtl?=
 =?utf-8?B?cW9uQThhOW8zdndxS0lmaHo1alRqclgvcVkrUEJPSUNJODdMZ0lNRERqVTVT?=
 =?utf-8?Q?SsZn4jQiTTna6ucPwVs4UbhGeAl4ZHJk?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UkRxQWwrZnIzcGRjQzNGUzZZd0VmMmx4Tjkrcm1iMUJPaGZIanNTaWFWNU1M?=
 =?utf-8?B?bVh2R3FpQ0xla3BKSWRNaDNxMjNPUTBlbHpMb2xvU3o4R1loN21jcEFPc1BN?=
 =?utf-8?B?SEZwakxtQ2NIc0hrNks0VmRGQ3B2aGUxSitTUnp3TTVWN0dMM3lCbXIweDFL?=
 =?utf-8?B?cVlHN3lPdjcyYzlnemZ6L0RPcnpheEFKSDE2YXZnTllVemVxMnJwQlcrUUtR?=
 =?utf-8?B?blpwb0g5Uk55c2xUS1BMVktaaDRSeTlpL280OUtmRno2alJ4MzRsWVkwWUQv?=
 =?utf-8?B?Z040SC92SzdFSE5LOHlQRXZrYm9NR0dNVTlMcjJyd0syT2dwSUtqM2dIMzVX?=
 =?utf-8?B?VS9nTWY1WjlrejRFeTVBZC8vS3FmMTJOZGhSekc2dE45Y0twSWFvNUpjUU02?=
 =?utf-8?B?aGVEQ2EyTUZjU20yRTh1WS9vNGFDVUluZmsrMGlEdkltZ0poL3hEb3prajhp?=
 =?utf-8?B?WmpHYzlOUEY5bU1YenJVT2xHcEJyWks3VUdqeDdHZjZQbXVEQnFTTWFUK245?=
 =?utf-8?B?Q2dSSGJVaE9UbFZLcWNyVGQ0SnQ5OW5vTXFkYkJ6RDZVWDhtWXRBYVg2eGMr?=
 =?utf-8?B?R3lmSzFyQ1dNRTAvOHArSldjK2FIemZkUFpZUy9ONkVQemdzeUNLaVNXTkZ5?=
 =?utf-8?B?c1N2bUdMWTBLVy8rYms1SFZ3Y3BMMlh4NEdoT0pldjJJVm03VUNaY09EZGZw?=
 =?utf-8?B?ai9LcFRQZy8wY2hUVzQxZFlYZkpDTC83TnVRNk52T0VDejlxWk1vWkR6TWhu?=
 =?utf-8?B?TEFNUytzMWFialRYUFgySFhlQ2lyOVkyaVB0WldUUFRjNXBBZHQ1Y2FlckRv?=
 =?utf-8?B?YmUrUlByVU1rTmNiQmlxQzlRWEwrcFI0bnF0QmhONU8xMnRweUpDcS9kWFBI?=
 =?utf-8?B?TWpaVjZOeWlVRFM0ZlpOdno0NmhLMm9MZlVWMTZJZzdFeTgzRDdJSlVocjNq?=
 =?utf-8?B?RnZ1TzEzOWxHUnlkbysxQnBkUTVBMi9Jdmgyb3djR2x5cUFtaHAxYU5ydkhN?=
 =?utf-8?B?M0lLS1VQY3lyN1ppT25rWWl3andhSUZzcE9CRmtOdGJOS1dDa0doV1pTMjJY?=
 =?utf-8?B?OXkvaGFQWTFxOGdZVEJoTEY3NTQxS1RaRUJEUnBqL0Q4WWgxbDcvNkpRYTN1?=
 =?utf-8?B?RVhrZHVJdGpGL3BreVgvd2dLQTN1QmF0Sis1REhvLzF1NFBUSWVyTm93RjQv?=
 =?utf-8?B?RVVLV3V0eUdQQnZlblRZUUVldklyKzVNY09RS2lRZ1FhU1hnZVpPRnRnZXpY?=
 =?utf-8?B?Wk53cVRGQ0RhOEJUSXVpY2NNU0RUUVo1Qkp2YjhjVVhsNWo1RVg1NW1GV3dv?=
 =?utf-8?B?M2RadWdqNHp4T2FNaVhzbUZMeVpLMjU2amNyYWNVUzdpYUF4a1RmazYvaStx?=
 =?utf-8?B?Z2NlUzJHS3d3dGlNQVpibU55SUZYdGoxdUw1UGhwMzY4VWdQMFBkNklHdm0w?=
 =?utf-8?B?WlczSUJhRXNXOHY4bFlmY3RxOUN5N0JUVjZBaWJ1TFhrMHkrSDlLd2hzN216?=
 =?utf-8?B?V2JTVHJYR3JYMWNTVTdtREV0cmxaNzNyUkZhV2NPdDBZTEE5aFllOW5rV1Yy?=
 =?utf-8?B?VHpHSmQ4VHBRNE5HMkc2YjdkQ3diN1hRNzFURnF1RnN5WlBCdEZJUWNIeUt0?=
 =?utf-8?B?MVR0bGUwZkhJK0IwNWZCL0R6VlhNVnRnYUwwU2lFZXlkVndkWDZDZC9xUG91?=
 =?utf-8?B?bzN0VjFFQlZISzh5dzdRbno4dDc3dE5BdDBaTG04WmdzemdyVWN1WGxWREh1?=
 =?utf-8?B?djBIdCt4dkNsUUQxYUQ2K0hIS2NLUkpFVTVBU1FqcHh0OTdWcnhTSElZL0wr?=
 =?utf-8?B?QUdaV2ZYVDNmNHd4VE9vc0wxODVKeWZ2bGs1NjVLbzViUHp5Y1NkUHJlT3FJ?=
 =?utf-8?B?RjQyNGdFNW5MV1ZRQzVRUzlBczZ5TlVka0plR0VZc0VDaDFKTWluU1dZQUUr?=
 =?utf-8?B?ekFBMGpEU1FUL2k1ZlBqN1hhMUNmVWtNWlVjbzFHU1UxWjdzYkZiYm5Zd1BZ?=
 =?utf-8?B?UFFDaHVBRlV3Zmc4UlZGZHQzbDBlWVhHVDFuRHVQMHBhQXRUTGJMem1ETUNj?=
 =?utf-8?B?bFcyZGZ6WkV6RVJRMDZpckZEd3UxRjF2OVNqd0RWRk9OM0hmVDZkSzdNMDZj?=
 =?utf-8?Q?Y4B33MfNbAa5vGg3gGxunivLC?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e442b857-4d2c-4648-7a4f-08de154361e0
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR12MB5673.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2025 10:27:09.0880 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Tw7dOrs79tvezWxjDI4BkvW9O0HjNPvsg4+BDbRdPxENaG0X9hJrYpfxCBVlDCED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB7175
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

On 10/21/25 20:36, Tvrtko Ursulin wrote:
> 
> On 21/10/2025 17:09, Akash Goel wrote:
>> This commit fixes the wrapper function dma_fence_timeline_name(), that
>> was added for safe access, to actually call the timeline name method of
>> dma_fence_ops.
>>
>> Cc: <stable@vger.kernel.org> # v6.17+
>> Signed-off-by: Akash Goel <akash.goel@arm.com>
> 
> Fixes: 506aa8b02a8d ("dma-fence: Add safe access helpers and document the rules")
> 
> Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>

Good catch, Reviewed-by: Christian König <christian.koenig@amd.com> as well.

Please ping me if you need somebody to push this to drm-misc-fixes.

Thanks,
Christian.

> 
> Apologies for the copy and paste snafu.
> 
> Regards,
> 
> Tvrtko
> 
>> ---
>>   drivers/dma-buf/dma-fence.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/dma-buf/dma-fence.c b/drivers/dma-buf/dma-fence.c
>> index 3f78c56b58dc..39e6f93dc310 100644
>> --- a/drivers/dma-buf/dma-fence.c
>> +++ b/drivers/dma-buf/dma-fence.c
>> @@ -1141,7 +1141,7 @@ const char __rcu *dma_fence_timeline_name(struct dma_fence *fence)
>>                "RCU protection is required for safe access to returned string");
>>         if (!test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &fence->flags))
>> -        return fence->ops->get_driver_name(fence);
>> +        return fence->ops->get_timeline_name(fence);
>>       else
>>           return "signaled-timeline";
>>   }
> 

