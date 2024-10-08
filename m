Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AD67F993F0D
	for <lists+dri-devel@lfdr.de>; Tue,  8 Oct 2024 08:56:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 06A5D10E0E8;
	Tue,  8 Oct 2024 06:56:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="CR4sIVt0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2055.outbound.protection.outlook.com [40.107.94.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 859AA10E0E8;
 Tue,  8 Oct 2024 06:56:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OcXxxlle6jN+BIh4CxTc32Q6Qcmm7UuLLzwrt31BBXTe+T9dqUTJbG3rdEL3IolVNjB3rRAb5ysJs9x/6iV+6/01MZpMEQclXTC6lpNMcu8eMz8e4OS2BK86da/gozeIu+FSy0IlV/Q7KN2mS8l9cxEt8woK9LSkO1krm4YTvXWdkjEjzt1klVZ3wKMPf+Buuwpp4+Us4P9StdK1N7kzhyAf9nUHR9UIwbnN0f+l9qv2AaLYT0JqhQuEiNkmg9WePBJ+cbbfWc90OKw6BBfTLuczmNbF4vKcFapC9eQ8TEZfBmrF4ZI6XIwOWxrx8b2hf58Mtvqvydy3uyHh7CVLkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9kYGEo7SeM+twgY8iICTWqqE77Ktfw5RWrgrustX1vc=;
 b=n9VUU8QZMFdh0Sa0JzDAWiRLGg2DLnlyeNMT7XrW25Un7RlcsgXGduNSpJNAp8HdLJEZHa+RL+cw1QjBKvxTE7xnuiaA657o3Im1m8bi24fIT8pSprpPTu0iyAc/48qSvIFijmddUWLZj/DeLzlbqIUHJCDq1qYGZAuBNToB5gF9nToQjEKyKnzKkX8wOXGN2Ito6sMyDSCX8CaJVsFxtEOynoGweVihI1+U4JIziuV3XIThMObFwKYcK2T+Wf4ZU/rBqNqeT1wuOgfrxDOUTawNPvu6e3zBtd4PJEHeBipvN1t1M0FsPxxkMfLdtH0rElGvsEgUt6eK8e8oyuUE5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9kYGEo7SeM+twgY8iICTWqqE77Ktfw5RWrgrustX1vc=;
 b=CR4sIVt0ngcLvQOhnbxXtyGj37QRdGZY1Gv1xOnp5unURuJTLoilZ+h3J/s5QNxagTjQgvgQqJ1hFOJfFtuj7QbZNc5LZtbm7u3NHp4uv5Tq8D/665W5/6rTHuSwm2Ap0eQ7vh5+spc6dYgl00+CB0DxWzTQrnUNSznWsVWNo0c=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by CY8PR12MB8196.namprd12.prod.outlook.com (2603:10b6:930:78::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.23; Tue, 8 Oct
 2024 06:56:41 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%2]) with mapi id 15.20.8026.020; Tue, 8 Oct 2024
 06:56:40 +0000
Message-ID: <39271484-dfea-4bf3-995f-3d9219a31774@amd.com>
Date: Tue, 8 Oct 2024 08:56:33 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH-next] Fix unintentional integer overflow
To: Advait Dhamorikar <advaitdhamorikar@gmail.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>
Cc: "Sundararaju, Sathishkumar" <sasundar@amd.com>,
 Alex Deucher <alexdeucher@gmail.com>, alexander.deucher@amd.com,
 Xinhui.Pan@amd.com, airlied@gmail.com, simona@ffwll.ch, leo.liu@amd.com,
 sathishkumar.sundararaju@amd.com, saleemkhan.jamadar@amd.com,
 Veerabadhran.Gopalakrishnan@amd.com, sonny.jiang@amd.com,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, skhan@linuxfoundation.org,
 anupnewsmail@gmail.com, "Lazar, Lijo" <lijo.lazar@amd.com>
References: <20241004081618.27599-1-advaitdhamorikar@gmail.com>
 <00761132-75f3-41fd-b571-30b0cbe5565d@amd.com>
 <CADnq5_OKww1YZ1R_OytEMLcNVwdq=-ckc2gqQ+WMyOv6AZ9kqg@mail.gmail.com>
 <007679b9-b7b6-4385-9a2e-2be392cb5f58@amd.com>
 <CAJ7bepLv3Z9RwuxoBS3SfkMjeBkN1LRTjLEjT8Lv4Jdu-CXb6Q@mail.gmail.com>
 <82c60f1b-a52a-4bc7-a635-06198dba0e13@gmail.com>
 <CAJ7bepJrm9tJJMSZXz0B_94y8817X4oFpwnrTmUHeagOFgVL7g@mail.gmail.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <CAJ7bepJrm9tJJMSZXz0B_94y8817X4oFpwnrTmUHeagOFgVL7g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0255.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f5::18) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|CY8PR12MB8196:EE_
X-MS-Office365-Filtering-Correlation-Id: bc1ab732-1f9a-4888-5ca4-08dce7665cae
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VUh1ZEtpbjBxekxJZkE5bmd0NVZ5ZWRVSGxMRWdTTVdzVlJEa0FwMUw1Rk9h?=
 =?utf-8?B?VFhUcXpGOFIyT25kVHh1dHdFbXhOMkVIbVVkTGk3WnROcVA1NS8xcDFLc3B0?=
 =?utf-8?B?N1BaQmJDYzNNWEhFQlRsRVYwMGVxYVJqVk9SZjQrcFFuZlhvbUx5Y1RrVG5D?=
 =?utf-8?B?UERoYlVJWEZ5MXhVT0dQREFKZXBPcTFxNG5UbTNPK2hpVis1MXBnbTAvNmN4?=
 =?utf-8?B?NVRsUU9MV2ExY0Q1Qllnem9tUEJGa3c3VzFWNEgxK1I3WllFc2E2NHdsT2Y5?=
 =?utf-8?B?cTVicVBvK0NuWFlVQ09Ub1VVYi9vSGV4OG80dHE5ZDA2UXhxbU9kQ28xbVNn?=
 =?utf-8?B?RUdtZnZoV1ZkU1M3K2lKWXBZQTdjSkNmZ2NYNVJtMjJUbGhQTEkrWU9zbEJM?=
 =?utf-8?B?cVFZQWk2UG1kcE8weDRpQjhaRFZSUmM1bWlZSUhpQWlnNFBjZk9MZWp1Q3ZN?=
 =?utf-8?B?TlMxL1Z5WEZsK2tPZHlIaFZiTk1NanUycEl4ZFVJMnQ0NnRPTGNmNi9QUDlN?=
 =?utf-8?B?bmlnQXpOU3NSOUw5blMrVzExL2hLNitMU2tBNng0UUZnYmlMallOQTlCUzQw?=
 =?utf-8?B?MXh5bktRYjhNSEJqSGg0cmRvZW85QUtyV3Y4NTh5RkFVMy9jVGRvQzBUejRV?=
 =?utf-8?B?bzFFVjlUc0JvUEZlUEJSZzB1eWpDdS9mV0liK050aisxdnU0ZFUxTHdWa0VV?=
 =?utf-8?B?QncwUGE3V1JGYllleUppNUxJNkJVdDlYeVhLWmMxV2xhNXlDMHYrOVZhN0dO?=
 =?utf-8?B?UWZzMHR4TlFGVEJNc2ZzS3ozUHNpQW95MWNJSjdQM2N4dmV2TjVsWm9SZmRX?=
 =?utf-8?B?Q09sb3kzQzZUWVprdXE4QzJ4KzB3Sk1lWk4vK1VaN3lMbnlwSENydGZWRGdy?=
 =?utf-8?B?YjNseklmRkQ5QlRQYkV2dmgrMCtiMW40Z09ZNmNZNW4vMDRNaXlSeEdBV0NQ?=
 =?utf-8?B?K0crRk5NckJBUzhtT3dORmxTdmdLUXNNM3JzQ295NjR5d3kvaVZETW5zRlZy?=
 =?utf-8?B?azROSE54WE1hUjZCV3B0NWQ3RnJ6RXpmNVNGMUFxcDFmVDBlOG1KMzhYcjVK?=
 =?utf-8?B?NDlzRDJUM292bGNER25EbzBLQllTRTNvTXBVbkJpblVmaWZxQU5BN1hsVUxX?=
 =?utf-8?B?dUtEaDcxRWE0ZUJpNEdmSHBrcHhVNFhhY3AyUXkyVTlmQU10SGJxQVJqc2c3?=
 =?utf-8?B?UGxrT2E0U3lFaW5VSjVMNEFwUUVRZ2w4dFQ5ZzZlOW1uVXA0V1lhTENGc3l1?=
 =?utf-8?B?OHV5dHI2R25PdDd2Z1RBVVBBRC92b3p1V3BXZlRLYXQ3TytMVjM4SXZmTlBQ?=
 =?utf-8?B?VU53WU54RlQ2WTBLbDhDOWc5YW1pMmZJaGVrZTFwZEg3VytRYnRvUWQ1T1JY?=
 =?utf-8?B?SXdqbHIyNmwwM2M3Q0dMcjAzRDRWRUE5OXlwRk9XU3luUVpQTmdFeXo2azJ4?=
 =?utf-8?B?UXdFNUl3S1dJZjRCV2ZCNEx2MW9UR283aWtFSTRnQnpTNy9KOHVrSUY4YkVB?=
 =?utf-8?B?Mml4bTZ3UjF3Vk95WVh3Rk9mQlBFZkd2dHhyMmlIaUtRQ1A4MUNlUnplRUs0?=
 =?utf-8?B?M1NWVnRQc0Y1WHg5bXI5cVdBWW9UazN4TWM2THdmL1VxRlY3czk4MHIwVmVB?=
 =?utf-8?B?M0FZZ2dUQUpyZWRIdkNybWxXTSs3SVJoUzN1TXdPR29iVkdlamRJS0g3SVlH?=
 =?utf-8?B?Y2V5Nm9ZUGg5cWQzaTZKbWVWMld1WWNJVWgzVTNzelZLWkdhdDdKRk53PT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?djBBZVNCTDBHeEwyc2o5dFJaQXk3N3BtVGRCRHplY3h2bGcwN1V4ZFlObTdP?=
 =?utf-8?B?a3JaQ3pqaWRxd2FmRE9FdFM0T1VUK0pLMEZ4T0RGbjhMKzRya0FuVUV2NHA4?=
 =?utf-8?B?WnpuTlY4eG1vR3hZV1BNQmZSNlp3U0VnZHg3aUhVUkFDUHppVTlhZ1dtTGJp?=
 =?utf-8?B?N2oyM0h4eElHeTQ0YXI3dmIwbmFOSFVlOGI1ME9xOUhkLzg4UEdzalg3a1Jy?=
 =?utf-8?B?SHdjblNUd1lhMDl0RGQzRTkxMDUyWjA0RXI5L2loRTVJYzNzbEVKdW5EbGQ1?=
 =?utf-8?B?ZWtmNnhNeEt1RUFqK1dOZTBJVE4rTXpRV2tEK2drcitOTGZsbVEyQ0lKYm9l?=
 =?utf-8?B?eFRqWjhnUGNuY3FIT3VkU1FxeUtYYjc5SSs3S3krbjNSbERTVFBsUUJIMVNm?=
 =?utf-8?B?b1NvbmZEZ2pRZ1JQd3hUc1liaEROVXY3UmFIK2NwWnAvZHZRU1ZYRzB4bEJu?=
 =?utf-8?B?Nkl3ZTQ2bjBDQ3dWVHhiVUs1OXlkaXFwUWRtQkhITXhrNm5FcEpnSmFxRW9V?=
 =?utf-8?B?eFpVUUYyOFNwVXRTYW9tMjI1aWxmWDErenBNWnUvZWpBUS92eHE5ZDZEeDc5?=
 =?utf-8?B?WFdFZjJ4dDJET2pBMzJIVlVaLzFBZWszTWFsbWZWbHFMSjFoWDBHSlVSOFBw?=
 =?utf-8?B?dGd6a2M2aytQdzZHMUd1cThWb0JKRmd3M29SMDI2Z25CUzl0YTVTRjNjaDhG?=
 =?utf-8?B?blQwQVVNRlFlSjRJU3FReVF4b2hEa0lTQWNsdHltYVhGN0VTY05RS2VQVDBt?=
 =?utf-8?B?M2lnQllXdjE5L2dEei9FUlYrV29MRlRvYTJRZXRUUzdnWEJiTUJydVpXSS9F?=
 =?utf-8?B?a3ZrMll5MFUrbUl4ZDdLR1ZlZ29PZFE4eFNWV2dEeVc3TThRRGI3K09ES0JL?=
 =?utf-8?B?aXYvNFlNQ3NkR0UvU25lMXNCa0ZCOGx5bEpHa05ZRzBHQmFMNGN2L1c2OHFS?=
 =?utf-8?B?b2YxRU1BQnorbEdrMHFsVHhYKzBITnVRUUZ1T2VlQ0FoTlVFSk42TkZkNkVs?=
 =?utf-8?B?TW9TQU5rR1NidDR4K25salZWVCt5dEhBNEYyM3lsMXIwQkJyZGZPeGNrOHc3?=
 =?utf-8?B?YnpSbnNSbTM3Q2Vaa3BPWEcvYnJqT1VyOGQ1WVNyblBXSWxlaGhPUDNjSEpB?=
 =?utf-8?B?QTlmSDlBSHJDc0traEYyN2F1ckpROFFJTThKZkxPN0NYK0QrQ0Y2d0Fha2xr?=
 =?utf-8?B?bmUxdWdBT2c3aGF3QktGS1JlYTd2NGVpSm1iQlVSUGNPUFlsUlh3L0tqZkJB?=
 =?utf-8?B?bDNlZExSeHhta0YxR016T3hOalA1ejVNZW5kU004d0RReGw1SnRlYnJ1a091?=
 =?utf-8?B?ZzhZZHBFblpjd29rZHB1eG9IOFJkYXN0dlBPVHNOZWJULy8rRnBDN1VpZ1N5?=
 =?utf-8?B?RlYyK1UzeXpybzNTcUs2NTNkMGhqZkFTK1VwREFIWm9IYnVKeXhhekJ6VW9C?=
 =?utf-8?B?QzcvZDgxL0YrWUFMQTNJazJzUTlFWmdxa21RTnZNOGJCU3IvYmVYTWJpNHJ1?=
 =?utf-8?B?a0NrOThFVE10b21aZFdMK1BPb3UzM09JT2pKWHZabFptT0dXNnpOclZvMS8x?=
 =?utf-8?B?TWJ0a2U1aTRnaWJpd29Zb1ViSVYvZzYxeFFXSXovT1llQWxlaWwxQWk0RUp1?=
 =?utf-8?B?SEt3NHVpME9HWnV6K1E0YzJ5QlZvalJRSkFvekVhU2VlL25acEg4YUltMVBy?=
 =?utf-8?B?OGdNYVNaMXZvM1RZNjdiQjk4bUZaTXczNFc5YWdDbzNicjU4bVJmSXVHSlhz?=
 =?utf-8?B?ejhGaCs2bTBOYXFwRGtMTDRvUk1CbjFzZzhvSTAvM2doT213TFRtU0xoM3Jp?=
 =?utf-8?B?QWV2K051UXJYb04vaHluR0hjaTB5THBtdjh1aVgvTmhqTTVEWDhMMStkVzFS?=
 =?utf-8?B?TzlvU09zMXE3cHNpTXJFcDZQbmlhSGVpUFptUWIrL29hUkgydDB6OE1RUTA1?=
 =?utf-8?B?Rm1SeXhCUThQU0NYL1Y2Y2l2NkhlYldBZnE0dVRVVkdTb0l1Z0pwaXN6UklL?=
 =?utf-8?B?SXpuQzJMQUU5bWp4MHJrSTBaZXJNY3dQZUh0WEpJR2ovR3I2VU5zbXBaTjUz?=
 =?utf-8?B?bFRuS2NsRHhFeVc0cmRScWdCV0pEUUoyREduWFJraXQ5ci9yMCtjUGRGRmsx?=
 =?utf-8?Q?f9nzSFy+sLaZDyD6ZBAAMi2Ht?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bc1ab732-1f9a-4888-5ca4-08dce7665cae
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Oct 2024 06:56:40.8490 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XvhVAWf1pQgoxNqw+Gk4kWNT+TlcHrhQLp0X4lED0c7FVqUSRlhiEIS9YaBtrrA6
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB8196
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

Am 08.10.24 um 05:38 schrieb Advait Dhamorikar:
> Hi Christian,
>
> I am not sure if I correctly understood what you meant,  just to clarify
>
> When you say this
>> No, all of this are numerical problems where not taken into account the
>> size of the destination type.
>> Saying that all of that are basically just style cleanups which doesn't
>> need to be back-ported in any way, so please drop the Fixes: tag.
>> And you should probably change the subject line to something like
>> "drm/amdgpu: cleanup shift coding style".
> Are you just talking about this message?
>>> There are a few instances where we can use 1U instead of int as
>>> harvest_config uses unsigned int
>>> (adev->jpeg.harvest_config & (1 << i)
>>> However I think they should be fixed in a separate patch?
> Or is it intended for the complete previous "Fix unintentional
> overflow" patch as well?

My comment applies to all patches.

Those patches are not really fixing anything because the shift values 
come from some BIOS table and if I remember correctly for example the 
harvest config only contains two meaningful bits.

Fixing the warnings is nice to have, but not really necessary for 
correctness. So the patches shouldn't be back-ported and don't need any 
Fixes tags.

Regards,
Christian.

> And I should just send a v3 with the two changes?
>
> Thanks and regards,
> Advait
>
> On Mon, 7 Oct 2024 at 19:26, Christian König
> <ckoenig.leichtzumerken@gmail.com> wrote:
>> Am 05.10.24 um 09:05 schrieb Advait Dhamorikar:
>>> Hi Sathish,
>>>
>>>> Please collate the changes together with Lijo's suggestion as well,
>>>> "1ULL <<" instead of typecast, there are 3 occurrences of the error in
>>>> f0b19b84d391.
>>> I could only observe two instances of this error in f0b19b84d391 at:
>>> 'mask = (1 << (adev->jpeg.num_jpeg_inst * adev->jpeg.num_jpeg_rings)) - 1;`
>>> and `mask |= 1 << ((i * adev->jpeg.num_jpeg_rings) + j);`
>>>
>>> There are a few instances where we can use 1U instead of int as
>>> harvest_config uses unsigned int
>>> (adev->jpeg.harvest_config & (1 << i)
>>> However I think they should be fixed in a separate patch?
>> No, all of this are numerical problems where not taken into account the
>> size of the destination type.
>>
>> Saying that all of that are basically just style cleanups which doesn't
>> need to be back-ported in any way, so please drop the Fixes: tag.
>>
>> And you should probably change the subject line to something like
>> "drm/amdgpu: cleanup shift coding style".
>>
>> Regards,
>> Christian.
>>
>>> Thanks and regards,
>>> Advait
>>>
>>> On Sat, 5 Oct 2024 at 09:05, Sundararaju, Sathishkumar <sasundar@amd.com> wrote:
>>>>
>>>> On 10/4/2024 11:30 PM, Alex Deucher wrote:
>>>>> On Fri, Oct 4, 2024 at 5:15 AM Sundararaju, Sathishkumar
>>>>> <sasundar@amd.com> wrote:
>>>>>> All occurrences of this error fix should have been together in a single patch both in _get and _set callbacks corresponding to f0b19b84d391, please avoid separate patch for each occurrence.
>>>>>>
>>>>>> Sorry Alex, I missed to note this yesterday.
>>>>> I've dropped the patch.  Please pick it up once it's fixed up appropriately.
>>>> Thanks Alex.
>>>>
>>>> Hi Advait,
>>>> Please collate the changes together with Lijo's suggestion as well,
>>>> "1ULL <<" instead of typecast, there are 3 occurrences of the error in
>>>> f0b19b84d391.
>>>>
>>>> Regards,
>>>> Sathish
>>>>> Thanks,
>>>>>
>>>>> Alex
>>>>>
>>>>>> Regards,
>>>>>> Sathish
>>>>>>
>>>>>>
>>>>>> On 10/4/2024 1:46 PM, Advait Dhamorikar wrote:
>>>>>>
>>>>>> Fix shift-count-overflow when creating mask.
>>>>>> The expression's value may not be what the
>>>>>> programmer intended, because the expression is
>>>>>> evaluated using a narrower integer type.
>>>>>>
>>>>>> Fixes: f0b19b84d391 ("drm/amdgpu: add amdgpu_jpeg_sched_mask debugfs")
>>>>>> Signed-off-by: Advait Dhamorikar <advaitdhamorikar@gmail.com>
>>>>>> ---
>>>>>>     drivers/gpu/drm/amd/amdgpu/amdgpu_jpeg.c | 2 +-
>>>>>>     1 file changed, 1 insertion(+), 1 deletion(-)
>>>>>>
>>>>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_jpeg.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_jpeg.c
>>>>>> index 95e2796919fc..7df402c45f40 100644
>>>>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_jpeg.c
>>>>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_jpeg.c
>>>>>> @@ -388,7 +388,7 @@ static int amdgpu_debugfs_jpeg_sched_mask_get(void *data, u64 *val)
>>>>>>      for (j = 0; j < adev->jpeg.num_jpeg_rings; ++j) {
>>>>>>      ring = &adev->jpeg.inst[i].ring_dec[j];
>>>>>>      if (ring->sched.ready)
>>>>>> - mask |= 1 << ((i * adev->jpeg.num_jpeg_rings) + j);
>>>>>> + mask |= (u64)1 << ((i * adev->jpeg.num_jpeg_rings) + j);
>>>>>>      }
>>>>>>      }
>>>>>>      *val = mask;

