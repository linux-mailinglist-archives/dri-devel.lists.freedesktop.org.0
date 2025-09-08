Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6809CB4970D
	for <lists+dri-devel@lfdr.de>; Mon,  8 Sep 2025 19:35:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F1A010E588;
	Mon,  8 Sep 2025 17:35:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="EWyfWoCE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2049.outbound.protection.outlook.com [40.107.220.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BFE4710E588;
 Mon,  8 Sep 2025 17:35:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lGopTiqEoATO2lb8atnjKf1qz9TuNWutRJNZY/T/57pPcWcsQQ6oL3MTDsBIvrbzrH8MMLeUHgiwLjVOlH0qQBra2M/7iFlS/FLT0lDfdYIyLH8RChYc5u2nZ87sXll5FPTqFlA8GVUOUrJITrA1cEZp2yfY/mCHe+1uqtpGYU9rpCm7573WFHRPhyLtFMyeOmHxWu1wizoTHbI3NwIdtaexl9KY2evQj3+R+pkKxvlYgKCidL3PGjBJh/bDC/ttszMfLGudz71DjqC545BwwegSGthETh3U1H771mHovoXnlSB89ii9U/UNXp0PsYvk4K3NUbCYOwf99Cr7ykXdXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Zyt7ccj4yCIJzq/ukEJyUBtIsU7dgix+0wYeUcK/xk8=;
 b=VtdXg1TEU+vq4xAQFCSVW4qQhwssqgVmzJFYmk52153CnORvkAOl2tZxcSNPARqOoX3STkz6EReWPc1QYMNUkgbxdhzJHeIULPn//DFH9IM0zQCDBLdmtaMGTmyMEsaf1GHMgwnfeYgyTbDfBaHpi1EZ8b+C8QttTeB+dqshBvOnaThz7quiCrC8Ssjp+mjsJ8EOK41Utv6j8WiWXSTJ1E3WadlyRN0TUUTHu5vjB1NFYrvyIkbDgnyR8vuQ/wERRh6Fw0WD+4I1zhwcmz6Bv7JtGytxrTu9lnRmYxjyYk4kAnf6M6Ob/tZGkCATRmZ5tL+mjdjwNUmG3PJHcXAmQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Zyt7ccj4yCIJzq/ukEJyUBtIsU7dgix+0wYeUcK/xk8=;
 b=EWyfWoCEvxGjL9dWgXPFbNnKmazEAfpNr2Bpl3rXYA3xGMWf9CN3EylCwPZ50iwx5ejSGr+bJJz/66/Vw2nFMfijjPJXc1PkKt6V5pr6tSlz2pCyz0jFX9ZEL1mmOsBqaj3LRiCTaiprNDnBQhm6n5bo5IJwatfZiLSm80IyRFE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by CH3PR12MB7571.namprd12.prod.outlook.com (2603:10b6:610:147::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Mon, 8 Sep
 2025 17:35:17 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%5]) with mapi id 15.20.9094.017; Mon, 8 Sep 2025
 17:35:17 +0000
Message-ID: <655a009a-0b69-4e11-949e-ff0f47b424d5@amd.com>
Date: Mon, 8 Sep 2025 19:35:08 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] drm/amd/display: Optimize reserved time candidates
 sorting using standard sort()
To: Alex Hung <alex.hung@amd.com>, Kuan-Wei Chiu <visitorckw@gmail.com>,
 austin.zheng@amd.com, jun.lei@amd.com, harry.wentland@amd.com,
 sunpeng.li@amd.com, siqueira@igalia.com, alexander.deucher@amd.com,
 airlied@gmail.com, simona@ffwll.ch
Cc: zaeem.mohamed@amd.com, wenjing.liu@amd.com, chiahsuan.chung@amd.com,
 Natanel.Roizenman@amd.com, Daniel.Sa@amd.com, jserv@ccns.ncku.edu.tw,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20250824182359.142050-1-visitorckw@gmail.com>
 <20250824182359.142050-2-visitorckw@gmail.com>
 <c28df8a2-9ec1-41d0-afe4-4ee047290d27@amd.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <c28df8a2-9ec1-41d0-afe4-4ee047290d27@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BL0PR02CA0021.namprd02.prod.outlook.com
 (2603:10b6:207:3c::34) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|CH3PR12MB7571:EE_
X-MS-Office365-Filtering-Correlation-Id: 657cc250-7489-43ab-a452-08ddeefe1378
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|921020|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?aXJtck1QeTBqcmJEVE1XRXdheXhHTUxieEl5MU9ZOTVxNHJRdVJoMnFyQnpn?=
 =?utf-8?B?SXRUczl4U2ZRN1BtRHN2RjNFNVZqaUN4a29LRE4rMzE5bnJXLzdqQUFxc1Ex?=
 =?utf-8?B?Z05JVHBqSGxGVlNCVWMzZkplY3lSd25ob1dLMWNEQXcvb3N1QzNLSWlvWCtT?=
 =?utf-8?B?QUJVdytrd1k5QjBMcTMvRDAvREJmVmFBS1R4Y1hnNHV5bm1BbXE1cGd1S3hY?=
 =?utf-8?B?ZGYyaVozY2kxQVBld05oeDF4TXJpRXg4NHNqenJRVlVSR2tzcGlyT0sxOEpM?=
 =?utf-8?B?MG5kdFVsRXdmc1lrQ1dLNGZMdHk2Qk5veHBWNGhaMGFXK2dTMzJqOGE2a2Er?=
 =?utf-8?B?OXRSVWloNjJFendEMDJwQXdnRm5oQU5wZ2t4OHhRMFp6d2J6SEREMmZYQ3Jr?=
 =?utf-8?B?Vm9vL2Q2U0xXNDRlS2RtYS9MTitWMk5lWDB3SS9NTkZ1SmVKYytSaW5iYUtZ?=
 =?utf-8?B?cEZwTEtMVUdsZlExTGJKd0pMNGtFRTd6dGVWaGUwUmF2UEwvUHhmZERPdk5C?=
 =?utf-8?B?bkdBNmJYY3d5bmE3amc3cWJtODlrTEZLZ21valNsQlpZdmlPeU1mOEp3eTVM?=
 =?utf-8?B?dXBLMk1TZGFoSUwwc2diYjNzTUtnRFpvSEJGUzJLVGZGM0xuM04yRkRnVWgz?=
 =?utf-8?B?ajgxaXpSL3lrS2IySUJ6V3hVWEpSSDFyeGE5MHZ6VWFUaU5OTWNXY1B0Wnhu?=
 =?utf-8?B?bU5EYUcvdVFiekpxRkxaQTZQVElGSjdTbVNLcmduQWlWeStnd0VuaHR4N21n?=
 =?utf-8?B?TTB1VWVaUVhKeWd0V1pVM21tQ0prUW1KeERRSmNnSHZEZThQbHNQa0JjSUlo?=
 =?utf-8?B?TW5wckIzV2N5OGF4cmRYQ09pOThSVlpDZW90UWkwZENvT3NCWjZNcXVJOW1Z?=
 =?utf-8?B?S3pLNnZ3R0lDTitQQ21ZVTljRXJWeUdaVlZlL0FwWWxZdHdpdGVBU1lsV1Bn?=
 =?utf-8?B?YWhxRlExeVpuNXpBQVBEenYyaEttLzkwTXJxaUIzVXRyOXlseU9WV2tDMHRn?=
 =?utf-8?B?VWJYNHBSSWFPczFBWkdvdjVOOTZoK2RUREVhZXpCc1B0dFg4NEhlbkd2aXJE?=
 =?utf-8?B?b0htZ09EYlplMVVoTUMzeXpVdUE2eHZuc0NYVXA2MlhUQTZnV3NzZXJjenNI?=
 =?utf-8?B?aW1OL09Cd0FxQUlWdmJNSUhmdC9ldlpUK0p2WFp3ZUppNmdvVVBlZENCMlBU?=
 =?utf-8?B?TjdDZ0J1aXJ3QUZyUndvb1h0TUd6VEpCMGZSNWpIMmdkRDdodm16OXZ1L0dz?=
 =?utf-8?B?RDVoVGZma2UvQVgwV24vUlJKbzFyNVViUk05NWpyZVcrR0R3WGEyNTYrdWov?=
 =?utf-8?B?U1hVYWtyOFlDZWJybHIwdmdoYXYvN3FXcnNPNkc0V3hORk90b20yTlhRM1l1?=
 =?utf-8?B?eFpkYmtTS3c1MFMvMDQ4YTBTTVZjem1jK0JHTjlEVUlON0c0emlTME5QSWZ4?=
 =?utf-8?B?bFFHQ0Jyc05xT1VURDh5SWI2a1JpY0trWHRma2orTS81OHpsYVZZVjE4cndX?=
 =?utf-8?B?d1ZoWHN4OXZMT3FzYnNhaFc5Z09TeGFtdTIzcHdBOVVpdUVUd1poOVpBYldM?=
 =?utf-8?B?aUpQN2lSN0wyaGVDcUtienozRTlCUTB5Vy9Oam9nbTUxZjdaWTEwRC83SW1L?=
 =?utf-8?B?YkVxRzJGaEp1YUhLY2RDSHRhaGx1NGRndmlTYkc5SVRjVFBTQzZYYjI4ZnJk?=
 =?utf-8?B?MmtCMVBaUStJMW9qK1dpTXdyWmFEM01vS3lDaVl5SjBNL0NTNVRlQ2haaE9B?=
 =?utf-8?B?NmpEUEI3K3pMaEVOK0JSRGpwOGRiZDhSNzArT1hGd1c1SWdxcXE2R203OTli?=
 =?utf-8?B?SHgveC9hNElQSzRmVHpMOWNRQkJpTXErc1dOTTc4UVZXTDZ3UWVNZ2pkY3Zl?=
 =?utf-8?B?N2tLNDFJRU9qQW92a1R1ckVRekdmc1NvRXY4ckdjc2hyZmJ6K1NiSWY4SytM?=
 =?utf-8?B?b2FRMFhZa2NtLzEwV0w5azJBRGM1Y2pvc1lIa3BWTHFueFhHOHpJNXJuRWFJ?=
 =?utf-8?B?LzFqWEpVNHJRPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(921020)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YTh2c1FjMHNLSlZjNVVhamcyZ0ZZQjVxdEkzeWlLZTUxUWpueVRxTy9RN2lG?=
 =?utf-8?B?NEFiUDZQdnVNRnJ4d0l1amtJTWNkMVNSLy9seUthT2Y3aXZucjdZcVcxNWhy?=
 =?utf-8?B?dzBGMWF5c0lMV0NjUk1OU0V6OEtmZlRNUVppeVp2U2NEMnN3VEZzRm9RSk5S?=
 =?utf-8?B?N2FYL0FiRHF5dk4wN0J0eU1qKzJNZFpoUndhb2JmcERQbjA1TFRmTnltYlVK?=
 =?utf-8?B?TEpUUjhmNW5scFo3ZjVMY1FwVTRDN3hwWVdyWWF0bkJBbVBzbkhOVzAwWnFE?=
 =?utf-8?B?NENzRWs1aVRjaUdEazdSTEZ1Y0d5ZElBRGhBNFVGbFpyR2gyZHp3b1lkNFA4?=
 =?utf-8?B?ZjM0aitFc2FxSXR1UnN5VmxoalhyTjhFem42d0hZdno4dERKelg1Nm5Namtl?=
 =?utf-8?B?NEo4UFZvSG4zc0tscm1MdGt0MERMaWNZL3gwcW95YzJZUmRXcHllZlNUaDUy?=
 =?utf-8?B?bFJnb2g4VXpuZWVaWGgzR2pJZlZCY29zQW03bk9VUmE2akNtYW0wMUtiODgv?=
 =?utf-8?B?Qm54WVlOcUVZbzdJMnJCMW8vdmFkbUJyb1JMWC9BS21SbFBzQ252S050WThl?=
 =?utf-8?B?bDF6dzhIR2pYZHl5Y1YvSFB2ellsbnhnUHFjRmtRTzNHNVhDM0FjRVpRME5I?=
 =?utf-8?B?MVhkcEhYSDIrMDlVbXZvdlRHdzdENy90NWpkVStDYXRwcndTVjVrQ28xa2xx?=
 =?utf-8?B?RlVrZkNReFMxQlB2NnRjZHduS1VGN1l2MjJMTVpZSGZpNXBoazgyU1BQVFhi?=
 =?utf-8?B?UEhvNzVmMWtEVUUzVjRnSDhzTUw1RlZtbWkvdnlQYmFQbjBseUlESjJzclBU?=
 =?utf-8?B?VDFxMElEZVJlM0w0ZndUeDdBTlQ0alZBMkhha0xqNkhPdHBheHBiWTR2aUJP?=
 =?utf-8?B?UUJuUXdOZENuVjdUSGx3cTVFaXp0YVIrSEkwTU8yYUxSOU1Nc0VGdHdiOTFR?=
 =?utf-8?B?OGpRUkt0WUd2RHBKN25BaFhHeVlnS0hQOFk2OWJOa3lnSi9SbHBsTU1KcHhR?=
 =?utf-8?B?T2pockNXYWhNc1hLS3A5OXdBY2YxN2xjNWtaU0RJNDVIK05iMlE3cnhZVFlQ?=
 =?utf-8?B?RHhzN0JrSDVYMFVnN1o2V0ZVaW54TFZtWUxxVkUvQ2FxRHk1blN3SlZnRENH?=
 =?utf-8?B?a240MVFhUC9FQVdhaDBSbCsrbDQrQk1jeko1bDNJbHVNNVU2bEx0YXd1Q2Y3?=
 =?utf-8?B?U2N1S2NjckxQeExMR1gxc3ZOa01yYzkxVUFKODRtaHc4bm9YcTV2TFJVYW5a?=
 =?utf-8?B?c3IxVytHN3pUMEVyVVcvNjI3SU1Cc1BURnUySU1YNThvbFc2aHptNmsxVjVG?=
 =?utf-8?B?a2VWUytvYlJjUUpnSEV2WnFtSlJxMGlTZCtEc3NzOVpyWnZGelpMbngwTDBa?=
 =?utf-8?B?WFc1ZCsvQ05ZYWlmUHdXSjlVWmZEcFpvQzZvSlBHMzUvVDNhTy9yUjExL1VS?=
 =?utf-8?B?OEdpYVZscnJqTktxSFNlVC9DY3FrdUNYckZlUmNPd21HczIyM1VNV2JuVU1a?=
 =?utf-8?B?eDYxMEwvVW1nSHcrRjJGZ0hVNk1GK0s1eWpJazZwK1ppSHkzc1ZvZWdkNlBq?=
 =?utf-8?B?RFNyMHkyK2djMHdIT09pYlBwNHBuVnNkVVJpUFVYMmloQjVNenhiSFNOeld4?=
 =?utf-8?B?aDd4QjFpZHRoSlNyV2laM2x4cDF4UjJydk5rcjRzeTN6R0wvdm0rUGdyYkVu?=
 =?utf-8?B?em5LcGxGbWt0TFZjMTJmSEJOejZRN3pDVHJCSUJ2bjhHRzZRbmFlR3c2S0Jw?=
 =?utf-8?B?NHlGZndOY0pnMktQNmpEL0JNM1h4dWNrczhKSHNzYVcwemJNRlZSK25nTWF0?=
 =?utf-8?B?WU03RDVWVElRcjNweENSNGw1ajdVVnRITnB6UjR0cUtFT3hzRUxEbjZoWnht?=
 =?utf-8?B?Mi8rVjU1K0VuOUNVektXNytKRnNjdkhBTG9XemYwTTJGWnFjZDFuNXAwSm1p?=
 =?utf-8?B?Y2JSaC92RG1pbnFMOGRSazlyMkdWU1BkQnpjSUNRY0xRdW1Wak56SWxCc0Y0?=
 =?utf-8?B?Rk5BU2FacnVTSE9SOXJyM0JISkIvcEY4YVdlTjRtbWd4b0RyUGhVYkhTUEpR?=
 =?utf-8?B?UmVsTEpUTTNWQU5MclowVkxGcFVLdTNXWWRheENySE90WHBOQkxLZFp3dGdT?=
 =?utf-8?Q?+X6ANpUACz9K3ZWMeYS/UMcNO?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 657cc250-7489-43ab-a452-08ddeefe1378
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2025 17:35:17.4901 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 37xITbMYkNCvtcpKhMFMhxikT7VY7WnPuobYomBWx4YJJKc/dreCitn0xM7hWQva
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB7571
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

On 08.09.25 19:05, Alex Hung wrote:
> 
> 
> On 8/24/25 12:23, Kuan-Wei Chiu wrote:
>> Replace the custom bubble sort used for sorting reserved time
>> candidates in with the kernel's standard sort() helper. The previous
>> code had O(N^2) time complexity, while the generic kernel sort runs in
>> O(N log N). This improves efficiency and removes the need for a local
>> sorting implementation, while keeping functionality unchanged.
>>
>> Signed-off-by: Kuan-Wei Chiu <visitorckw@gmail.com>
>> ---
>> Compile test only.
>>
>>   .../dml2/dml21/src/dml2_pmo/dml2_pmo_dcn3.c   | 23 +++++++++++--------
>>   1 file changed, 13 insertions(+), 10 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_pmo/dml2_pmo_dcn3.c b/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_pmo/dml2_pmo_dcn3.c
>> index e763c8e45da8..2b13a5e88917 100644
>> --- a/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_pmo/dml2_pmo_dcn3.c
>> +++ b/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_pmo/dml2_pmo_dcn3.c
>> @@ -2,19 +2,21 @@
>>   //
>>   // Copyright 2024 Advanced Micro Devices, Inc.
>>   +#include <linux/sort.h>
>> +
> 
> Thanks for working on this, but this file is shared with another OS and it is not possible to replace sort function with Linux-only sort.

That's not a valid argument. Linux code must be solely written for Linux, you can't reject a valid patch because it breaks sharing code with other operating systems.

Regards,
Christian.

> 
>>   #include "dml2_pmo_factory.h"
>>   #include "dml2_pmo_dcn3.h"
>>   -static void sort(double *list_a, int list_a_size)
>> +static int cmp_double(const void *a, const void *b)
>>   {
>> -    // For all elements b[i] in list_b[]
>> -    for (int i = 0; i < list_a_size - 1; i++) {
>> -        // Find the first element of list_a that's larger than b[i]
>> -        for (int j = i; j < list_a_size - 1; j++) {
>> -            if (list_a[j] > list_a[j + 1])
>> -                swap(list_a[j], list_a[j + 1]);
>> -        }
>> -    }
>> +    double da = *(const double *)a;
>> +    double db = *(const double *)b;
>> +
>> +    if (da < db)
>> +        return -1;
>> +    if (da > db)
>> +        return 1;
>> +    return 0;
>>   }
>>     static double get_max_reserved_time_on_all_planes_with_stream_index(struct display_configuation_with_meta *config, unsigned int stream_index)
>> @@ -634,7 +636,8 @@ bool pmo_dcn3_init_for_pstate_support(struct dml2_pmo_init_for_pstate_support_in
>>             // Finally sort the array of candidates
>>           sort(pmo->scratch.pmo_dcn3.reserved_time_candidates[stream_index],
>> -            pmo->scratch.pmo_dcn3.reserved_time_candidates_count[stream_index]);
>> +             pmo->scratch.pmo_dcn3.reserved_time_candidates_count[stream_index],
>> +             sizeof(double), cmp_double, NULL);
>>             remove_duplicates(pmo->scratch.pmo_dcn3.reserved_time_candidates[stream_index],
>>               &pmo->scratch.pmo_dcn3.reserved_time_candidates_count[stream_index]);
> 

