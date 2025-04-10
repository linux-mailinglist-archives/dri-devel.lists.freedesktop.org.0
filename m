Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A4DCA8473B
	for <lists+dri-devel@lfdr.de>; Thu, 10 Apr 2025 17:05:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C1CB10E9E3;
	Thu, 10 Apr 2025 15:05:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="uCbD/ngC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02on2043.outbound.protection.outlook.com [40.107.96.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3BBD010E9DC;
 Thu, 10 Apr 2025 15:05:25 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Zj4BdD9lGBZryxOhrDXBeZugLxsrZOpmneKitZ60BGf7ZgSC4wjvYTPBMPTcK7Beqz5kTVHlOBu4lhSgwBJQJVyHzQPlauUboQXQ2713mSfbyBenYabHLm8B/T8Ojf/4IpEoFajrR3B6nndqTh4rwGMm4TQeaGPeM1spQHBSNat94AE6GF+aRO/WiFZDUCup4ay2sfkJPu/6zk8CBIaHPvJr+jkPjf5Vd9NDFQJErarB+VFFGCqkUXfXkp8fUdtMOMWPoQVpQ3SxuZezIT24EgHuoULrnlrjhXgGyV+RpAgdULhyIFIv9L5UYRhugpqbK5HNHLD5CxlmObZV8kCEBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nUwZd36LUlyjLZkh1gm39RmsVReARNwVoNfrKTUA98s=;
 b=dZ+xNKJ6yZwcWxU3AeA1I938PASO2+XdTaRMs/ann67Bqz/KTeMWHs749tLZgzL0QHN/08f2/g+47Qf6lc9mq1u+f8uq7fgxgBBDabcvVYI9ki2VCKLQD7BXboA8mFDI3NrXTD3VjPGREPzk3Nze8TEQ+4lt9yuNdTnyw0tEAlIBq4MvEZ8AG5ESi5yYDj2gq8FnDTktYnxoSSn/0MsyZE8vHKPBd3QEQO+KXr4xOCjmwkaBVZUs4QkeRZIY8UIe0EqBlG4Cb46SW9oI8s4nf0EaY48XAcUIAuqfLw4UAhgHeudg4tALLTSaY35r6wCq2jWaCeJobFDaHRfI+wGwIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nUwZd36LUlyjLZkh1gm39RmsVReARNwVoNfrKTUA98s=;
 b=uCbD/ngCgFhkS1oF/8SWeK9Baufv6l0Bq+BwdpMwvSi9MGXc8RT5DKzdSK7GGbBFWXIYyGu47S2tYaaMY8DRuSuqUYJGwxD27fZTjCruZgQKnUIm9JRP0kw7ZclnCp1rjkcXbhZfOQi85wEZ8/lyUH4AaQ4K/zQdS3Cc0BnDR/M=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by DS7PR12MB8372.namprd12.prod.outlook.com (2603:10b6:8:eb::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8632.22; Thu, 10 Apr 2025 15:05:16 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%5]) with mapi id 15.20.8632.021; Thu, 10 Apr 2025
 15:05:16 +0000
Message-ID: <d4ebcb9f-ca1e-40ae-bc3c-613f88552b94@amd.com>
Date: Thu, 10 Apr 2025 17:05:07 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/8] drm: Introduce sparse GEM shmem
To: Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 =?UTF-8?Q?Adri=C3=A1n_Larumbe?= <adrian.larumbe@collabora.com>,
 lima@lists.freedesktop.org, Qiang Yu <yuq825@gmail.com>
Cc: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 dri-devel@lists.freedesktop.org,
 Dmitry Osipenko <dmitry.osipenko@collabora.com>, kernel@collabora.com,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>,
 Faith Ekstrand <faith.ekstrand@collabora.com>
References: <20250404092634.2968115-1-boris.brezillon@collabora.com>
 <20250410164809.21109cbc@collabora.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20250410164809.21109cbc@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0106.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a3::16) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|DS7PR12MB8372:EE_
X-MS-Office365-Filtering-Correlation-Id: 3e16cfcf-56b1-4c68-5a26-08dd78411a2b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|7416014|376014|1800799024|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?OTM5VkhmSzYxVWVTaVM3TzM0S015dnpOcCtGYmgwd2dSN2ZuUytUZ1V5VXUw?=
 =?utf-8?B?NHJlNmM3dk9xWURpR3VGejd3YUJFd2Y1VjJocTRYTTFwUXdYRzJkT0V4TndE?=
 =?utf-8?B?OCtXVC90Y1BaMngwNUg2NzFHdk5EY0pKeE5TdFg3TDdKUS9HOTVnRzNCaFU0?=
 =?utf-8?B?WFFnekZZUE1RTFhrUzYvbWlLL3Fwa3d4VS9WM1RjQ1F6QWJqZElKYm1ORnY0?=
 =?utf-8?B?WUlCM2pCSDUwMEFkbkw3WDBRcTJVZy8rU09YWlgyVTBpaFZKREVSVXdPRTJa?=
 =?utf-8?B?bVMxMm55NlhBZ3J6Lys4cERXNEpBWHpCTmR2SkNzcHRSckcyT1FNeGl0aXNs?=
 =?utf-8?B?WGV3K0I4RnRLV0lsdDdjenBXNVJERzNUdTF5UVBNYTVjMHpqcnV6b3VKQmo4?=
 =?utf-8?B?VVVNSlEyWEJ4RnFHTkFqU1ZiNDRoOGlxeVBIRm4zbGo0Yk1RSGxDNlNsN2JW?=
 =?utf-8?B?cDg2STBUeHdBTmJZWVNXOWxjd0EvL3RWTjZxUmU0bjgyWG5aQURseXlJQ2o2?=
 =?utf-8?B?YVlRa1VFZGY4aERObU96aXFNdDRZek9SclBBRUxpaUhRZWVNZmJqSzFXd1R1?=
 =?utf-8?B?Q0FmNFAza0ppM3N2RnZMeURsNCtwc1JTeG9QWVVzWEhIWmlpVHhLaWhJcEY0?=
 =?utf-8?B?dkp6ZFBVQ0FrRS9CckZ0KzBBd1VLMGRoSllaaU9sTmU1MUtnNFNpbWcrYzNj?=
 =?utf-8?B?bUdxNW04aVg1MWI3ZkZRakozL01UOGhpV2FsSGFJSmJmTU43ZEE2R2lnRUU4?=
 =?utf-8?B?cWdwclovaGFkSFFJaDR6RTA0cGNmeHd6cHA2TXkyc1IyTnRpbVd2STdUUUg5?=
 =?utf-8?B?NTk3OFNpS2p5TXNxT2ZjanMzZ3U5QTRUUXQxdWVReFI1V0pCS21hSUVjVVkv?=
 =?utf-8?B?dU9nelhmZGZtaVJQVnE5YkxCeVpLZ1ZGNHplc3hveVNhSTVPeGtXZW5GVmJ4?=
 =?utf-8?B?eUxzaCs3SkdTNGZSZ1h4dktaSFZZSERJaVprMk1IWHRGTHppZ1NwM2t0aDh2?=
 =?utf-8?B?OTZ3WVkwNXcwMW4rRS9GU1N1QlVjUFVVVG5yenZaa01GblZZSnRRYkZuYkNi?=
 =?utf-8?B?UWMvQVY3c295ck5EWlVlYWhYMzFSZzJyR1dQaFM3WVQyNy9DdmNLQjNtZDBx?=
 =?utf-8?B?RDd0T1ZnblRza0xQU1lZTUJrRUprOXF2VzYvODAzeDVyRDl4QUd2VE1oOVh6?=
 =?utf-8?B?VGZkb3lMQVFTSjV6dUhRWU96SFRsb0xRT1JHVHpkWFFvS2lYeEhSQjF3eFJi?=
 =?utf-8?B?UWk4dW9hL3RDLzhDQWVGd3B2N08yQThsZ2ZUMGtVeGtqeS9lOVUydGUyUnBo?=
 =?utf-8?B?RE1CeW9PMHpRcEVSV0dlS2JBYU8rQWVaeGsza2t6NUU3RXNqTFlXMXZwREs0?=
 =?utf-8?B?T203SHIrdmdiYiszU2Jpa0p2NGgrYWlBYjJyZWVlZVNNS3ZiS1d4OEdYZlBk?=
 =?utf-8?B?L1NqQ3FGLzhDRFlQRHhRVHBhZmY4QmVMODRVKzBsSDVRTjQrUjgwZUtsOXBv?=
 =?utf-8?B?ejA0ZnpjampXYmFnQ3hOSWo2eTJybVpvMjRPd251OEh0dFR6bHNOdlcxOVlX?=
 =?utf-8?B?bDlMZnFxWTVtc0x3YXVUSFdvU2U3QWtTRXo3ektUTXFZT0tPOU1Ob1F2b21G?=
 =?utf-8?B?WGZKLzRNbTR0VEhuQmpYbTlZbzVRSDFuVzJ2azg4VTlYQUlQbFJGYmNTRnhO?=
 =?utf-8?B?bDlEUnpHeUxDZTRUWFVzbTdYaTJJaHk1eUMycnlLa0dUYVIvT2tzQzBjWWlB?=
 =?utf-8?B?dnNtdEYyMHg5MkZNSFVaem1HOEpEektPZ1NhNnpuUUorRzBIcm9XeWVqYmRE?=
 =?utf-8?B?YXI2aTdUTWFLSWppeDV3UT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(7416014)(376014)(1800799024)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UlQ3SDJIQ3Jxam1laTBvYW1GR29BMVJIdTNTNmdtK2JCMzNFTGw0RlhzZ0dD?=
 =?utf-8?B?eVBTQW1POGhEeklnSG1xRUg0eUhZWXZDcHB3ZSt6dTNMalEwK3FiNVMyMGZS?=
 =?utf-8?B?ZWdmR3hsYVB1ZTh2NkFxaFBTSm1DaUtmWlR0eGdXNWJHRjV4dTNDVHh5TGdG?=
 =?utf-8?B?N3NJQ3UvMzdQTUhKbGlZeXMrWksxVS9vT29XdjNtUnJEWHRpWW1LRmhlTS9v?=
 =?utf-8?B?UFhJTFpDczhIb1UzZWxBNkJlVWFHNFNtMDBkSWd3Z2pYUk1HMm8xNDg4dE1o?=
 =?utf-8?B?VkZZWk5Fb2g1eHhnWWluMWMvY0YvcGVnTHVhbFVCU0dHc2RjdldWOEdYaVp3?=
 =?utf-8?B?clRxMHZLZkZDekh2enJHM3pKQ2Rlc2RDTzhQS0NQWXF6TmlQSTdNZEJUbkFk?=
 =?utf-8?B?SWVRcnM2UFBHSWloeEVYL2NyK00rQUtLRHpTNGdlZG5NTlJvck9oT2xlaGRE?=
 =?utf-8?B?QnZyaE12TUhuQXM3NXYyc3lyait0bGNEY04yL0VqWk8vRmh2d3VOZVprTjYy?=
 =?utf-8?B?UzJMYXFPR1habkRvTGN5dStzRXZZYW5kTmp6djdGVDBTbzdSNyt5NG9xeVda?=
 =?utf-8?B?WkprTlFRcUZhcW9XNnkvWFJUczNYN0ZESTk5Y3pteTg1a2NVckkrVUxUK2hi?=
 =?utf-8?B?WVZOaWQzTHh0REIvaEtoeHNKbzVQZG5IS1M2NHBWa0NIelpKdWtlZURSR0Z5?=
 =?utf-8?B?a2ZlTEliZy8vTnZROTlvbWlIRDhiSTdVWktaeGdKSytjNE9JVGFkOHRUc1Rq?=
 =?utf-8?B?OHUxVHVFYWwwK2hQTzNOTjVHOXMxdGpDRi8zYkNPUjZqNGhVaUhsOFJiV25z?=
 =?utf-8?B?eGpEdkRYUStaYy9GdFl0VmMrdHJtNThBK3c1SEhnN1kvT1NFRmthYkdKU2Mz?=
 =?utf-8?B?dEdoN0EzMnJtakcyTjV4cWwrbmRMY1lra2FOVlUvRmZoc1V5K2l0SXp0c3FY?=
 =?utf-8?B?OEYzYkJSUTF0RlZWd1IyMmtUU1RVSzcwWnk4SnMrSHlhRnh6WGROeVdRVHRE?=
 =?utf-8?B?cjhkQVM0NXBhc1RteU9DZkFyODFJVmlPK3A3aDBmVnRBTWZ1ektLZllNaUtj?=
 =?utf-8?B?TFY5VjUvNmVKK2QwbnlhOTNHbjhwTnlGV3lPMCt1Y2xrQms3WXFRZXdHRWtY?=
 =?utf-8?B?SkdwSThTKzNXTUx4U1BhSGVnZCtZTURJMzBOUk1CVW9rQmVoS3d5ZDJGdDY2?=
 =?utf-8?B?ZGtxeVFXYnJISmtmazhHRlJ2S1Zoam5vM082eERKUGVsVEd4YzB4eXdKUStP?=
 =?utf-8?B?Y2tLM1crV0VtTEw1NDl5UkRXLzNjdjNFVDE2T1BlM1dpejFKOU1sVms2OXNQ?=
 =?utf-8?B?MUQ5V3o3dXRkRzZOTlZyT0laaWkremN6UndkM1JQK21CWE52Wjl2U0lPOUJn?=
 =?utf-8?B?eDVxYUk3V0RpaUtLdUh1UHhyU1lnYWpJcGUvb1VoRWloaEo3ZUxwc3gyZlZj?=
 =?utf-8?B?akNMZlRTUHpZT21aWFUrNDQxVUh4VERpS1BJLzF4dFVYdWdUaWNUQXhjcEY4?=
 =?utf-8?B?ZmNkTWZ2NFhWeis1YThod0NNK0lVR2o4clU2RitUMjZuYmZXeS9jaU5lRk00?=
 =?utf-8?B?UHhPd09iL1dIbUtjeWZ5bDkrMkZFdHlkMmw5TEU3d3o5SGdTdnBPbExWb3Ri?=
 =?utf-8?B?czZxN1llMkpUT0JLWW5kYjJ4elFtUGlsa3NSOXpvTVFzZVJFWWFKMFpTaXZG?=
 =?utf-8?B?dXlkQjR0WGVsa0FzN3FSdGJTSlJwZzd4REJoZnpzZGRBRGRQamhUNjk0VlJn?=
 =?utf-8?B?SlFPc21CbXlmVjZLanVSamozV2VQam9BcGxPK0haZVRBa1dCNE9OVkNuZ0dU?=
 =?utf-8?B?bVpYSk50QVpvR1NYODVYQVBxeG5yWGlsSHdmWERoMWlpcjZkRGo0SFl4Mmxl?=
 =?utf-8?B?cjhadldQMlkxelQyNFJpaVhzemx6QW41bGVDSk9FcGUxdjkzd2FLVXFPRXNh?=
 =?utf-8?B?R2d4aDdaQ2szb1NWMXF0Q1hiR2N3ZGx6a2RweUtQYTQ1dytsRStaMnB1YlhN?=
 =?utf-8?B?NEVvZ0pscHVVZmZ0dHMxRURUbks4bFU3SjBIODUzNUl2SWduemtTQ00rLzc2?=
 =?utf-8?B?cWhvcXg0d0s3TWMvRTFSY2R6OHNzZ3EvSFBXNHd6WTljczRhaFFYcHBsUHRQ?=
 =?utf-8?Q?K2+z+TYZwsVXTjp3go4omm7lk?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3e16cfcf-56b1-4c68-5a26-08dd78411a2b
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Apr 2025 15:05:16.6595 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DNux3w3jkauXuffhh06yjwnT5cX8882OJKZVRevFeN37pgsgA2HFYRekK449Z29P
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB8372
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

Hi Boris,

thanks for looping me in. Can you also send the full patch set to me since I don't see that on the mailing list (yet maybe).

Am 10.04.25 um 16:48 schrieb Boris Brezillon:
> +Christian, Alyssa and Faith, as suggested by Sima. I'll make sure to
> Cc you on v4, but before that, I'd like to get your opinion on the
> drm-gem/drm-gem-shmem changes to see if sending a v4 is actually
> desirable or if I should go back to the drawing board.
>
> On Fri,  4 Apr 2025 11:26:26 +0200
> Boris Brezillon <boris.brezillon@collabora.com> wrote:
>
>> This patch series is a proposal for implementing sparse page allocations
>> for shmem objects. It was initially motivated by a kind of BO managed by
>> the Panfrost/Panthor and Lima drivers, the tiler heap, which grows on
>> demand every time the GPU faults on a virtual address within the heap BO
>> range.

Oh, wait a second! GPU faults and DMA fences are usually fundamentally incompatible.

So stuff like filling in GEM objects on demand like you suggest here is usually seen as illegal. All resources must be pre-pinned before the submission.

Faulting is only legal when you have something like HMM, SVM or whatever you call it. And then you can just use a plain shmem object to provide you with backing pages.

I mean we could in theory allow faulting on GEM objects as well, but we would need to take very strict precautions on that we currently don't have as far as I know.

So could you explain how this works in the first place?

Regards,
Christian.


>>
>> Because keeping a struct page pointer array that can describe the entire
>> virtual range is wasteful when only a few backing pages have been
>> allocated, we thought a sparse allocation approach with xarrays was a
>> more efficient choice.
>>
>> This sparse GEM shmem features takes the form of a new optional
>> drm_gem_shmem_sparse_backing object that can be attached to a
>> drm_gem_shmem_object at creation time if the driver wants. When this
>> sparse GEM shmem backing mode is enabled, the driver is allow to
>> partially populate the GEM pages, either at use time, or at fault
>> time. The page population can be done progressively as the need for
>> more memory arises. The new APIs takes explicit gfp_t flags to solve
>> a long standing issue reported by Sima a while ago: all allocations
>> happening in the fault handler path shouldn't block.
>>
>> We also introduce two new helpers at the drm_gem.{c,h} level to
>> automate the partial xarray population which the GEM-SHMEM logic
>> relies on to populate its sparse page array.
>>
>> A few details about the implementation now:
>>
>> - Sparse GEM backing locking is deferred to the driver, because
>>   we can't take the resv locks in the GPU fault handler path, and
>>   since the page population can come from there, we have to let
>>   the driver decide how to lock.
>> - The pin/get semantics for sparse GEM shmem objects is different,
>>   in that it doesn't populate the pages, but just flag them as
>>   being used/required by some GPU component. The page population
>>   will happen explicitly at GEM creation time or when a GPU fault
>>   happens. Once pages have been populated, they won't disappear
>>   until the GEM object is destroyed, purged or evicted. This means
>>   you can grow, but not shrink. If we ever need to discard
>>   BO ranges, the API can be extended to allow it, but it's not
>>   something we needed for the Lima/Panthor/Panfrost case.
>> - Panthor and Panfrost changes have been tested, but not extensively.
>>   Lima changes have only been compile-tested.
>>
>> Changes from v2:
>> - We decided to focus more on the DRM aspects and forget about the
>>   sgt building optimizations (sgt helpers taking an xarray instead of
>>   a plain array). If the xarray -> array copies happening in that
>>   path ever become the bottleneck, we can resurrect those changes.
>> - We decided to make the sparse GEM changes less invasive by making
>>   them an extra layer on top of drm_gem_shmem_object. What this means
>>   is that sparse GEM shmem can now be used as regular GEM shmem
>>   objects (vmap, pin, export, ... all work as they would on a regular
>>   GEM). When that happens, we just force all pages to be populated,
>>   so we kinda lose the benefit of sparse GEMs, but that's fine, because
>>   in practice, such objects shouldn't be manipulated as regular GEMs.
>>   It just serves as a safety guard to limit the risk of regressions
>>   introduced by these sparse GEM shmem changes.
>>
>> Discussion of previus revision can be found here[2][3].
>>
>> For those used to review gitlab MRs, here's a link [1] to a Draft
>> MR grouping those changes, but I'm in no way asking that the review
>> happens on gitlab.
>>
>> Regards,
>>
>> Boris
>>
>> [1]https://gitlab.freedesktop.org/panfrost/linux/-/merge_requests/16
>> [2]https://lore.kernel.org/lkml/20250326021433.772196-1-adrian.larumbe@collabora.com/T/
>> [3]https://lore.kernel.org/dri-devel/20250218232552.3450939-1-adrian.larumbe@collabora.com/
>>
>> Adrián Larumbe (1):
>>   drm/gem: Add helpers to request a range of pages on a GEM
>>
>> Boris Brezillon (7):
>>   drm/gem-shmem: Support sparse backing
>>   drm/panfrost: Switch to sparse gem shmem to implement our
>>     alloc-on-fault
>>   drm/panthor: Add support for alloc-on-fault buffers
>>   drm/panthor: Allow kernel BOs to pass DRM_PANTHOR_BO_ALLOC_ON_FAULT
>>   drm/panthor: Add a panthor_vm_pre_fault_range() helper
>>   drm/panthor: Make heap chunk allocation non-blocking
>>   drm/lima: Use drm_gem_shmem_sparse_backing for heap buffers
>>
>>  drivers/gpu/drm/drm_gem.c               | 134 +++++++
>>  drivers/gpu/drm/drm_gem_shmem_helper.c  | 404 +++++++++++++++++++-
>>  drivers/gpu/drm/lima/lima_gem.c         |  89 ++---
>>  drivers/gpu/drm/lima/lima_gem.h         |   1 +
>>  drivers/gpu/drm/lima/lima_vm.c          |  48 ++-
>>  drivers/gpu/drm/panfrost/panfrost_drv.c |   2 +-
>>  drivers/gpu/drm/panfrost/panfrost_gem.c |  37 +-
>>  drivers/gpu/drm/panfrost/panfrost_gem.h |   8 +-
>>  drivers/gpu/drm/panfrost/panfrost_mmu.c |  98 ++---
>>  drivers/gpu/drm/panfrost/panfrost_mmu.h |   2 +
>>  drivers/gpu/drm/panthor/panthor_drv.c   |  20 +-
>>  drivers/gpu/drm/panthor/panthor_fw.c    |   6 +-
>>  drivers/gpu/drm/panthor/panthor_gem.c   |  18 +-
>>  drivers/gpu/drm/panthor/panthor_gem.h   |  12 +-
>>  drivers/gpu/drm/panthor/panthor_heap.c  | 222 ++++++-----
>>  drivers/gpu/drm/panthor/panthor_mmu.c   | 481 ++++++++++++++++++------
>>  drivers/gpu/drm/panthor/panthor_mmu.h   |   2 +
>>  drivers/gpu/drm/panthor/panthor_sched.c |   6 +-
>>  include/drm/drm_gem.h                   |  14 +
>>  include/drm/drm_gem_shmem_helper.h      | 285 +++++++++++++-
>>  include/uapi/drm/panthor_drm.h          |  19 +-
>>  21 files changed, 1492 insertions(+), 416 deletions(-)
>>

