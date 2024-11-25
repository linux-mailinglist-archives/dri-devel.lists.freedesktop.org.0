Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 245259D8352
	for <lists+dri-devel@lfdr.de>; Mon, 25 Nov 2024 11:27:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C6D2410E21F;
	Mon, 25 Nov 2024 10:27:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="PBvq16iX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2058.outbound.protection.outlook.com [40.107.244.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D527C10E139;
 Mon, 25 Nov 2024 10:27:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JrsrLCFOkRDi/kH9f7pGPsVlXJGdgTVblXyP0sDtExO4krywKh171tjd0lV4BvZtIC42wjv35HBrf9XxyhmiI1asjRmKquu0wyxBCv3cUz/FZVJCDr9L80vrGUiYQR6wKVLM8C71Zpi8ETG1CE+i9z31kQAmlrbl7Zjy0NfH5j/QzHcYFOjTn19Pu5bvo+OeTKJmqzbwsXQMHS/QDRUs1BLi9wbPox1Hy0ctNH2sYIePFaZtKD3BbAPg3aH1XxgIMynt8UcrChjEwdCGpiWXcZetvhwj9eqPo5aNFK4cOVEPuvhgtNirH7XDSqcBlJZY2oRqMRzhkhv1BbHzRar6wg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zPz8GQJiqAge/9Atzdfs/Rs0NOa+rjfwmFreHaq77Kg=;
 b=R7cdVY0x8BSdzLfUEIwqDwyZYfMu69JJq6uDdTrdqVX7Z2XkzuChUQczO074iZDRa8U5gmBi63wx2I4ekCXFhWiDIwXJCW8CuqnyeN/SSRmdg/3SOq7/bB9TNxNkBUsKk5iHc1d/QjPucXVwkecITigOZ6xsYEML9HfL/1LFeYhfpAkejmbCTzAoUuHi6zIhXcEuh2dKKy3yk16K36Zf6DFt/njyhN18PX23QQCgfDUYeE1jGddymzrRZ1ZYngPo3hT144ThadlTPGQnJAwW2Py3kp2MkgngzkXqDOGXsuBr2jxy2JakYZdNv+gEMbYE1xnklLAhA2XxUrqKa7KuQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zPz8GQJiqAge/9Atzdfs/Rs0NOa+rjfwmFreHaq77Kg=;
 b=PBvq16iXOSMEcLLIaDnOLf1nrlzEPzVNzoBTKic7jWyNS8xFt81FYtsMI5sQCF/WUrRKG+oWp7ukxyWCEfpt5JJcULPsC/+80oHEfSxjJX/VqdURu09U+41kOV5Zeep5aSGf3nXWSklidAyx7ComJfPC/0pYzLJi5ML310OrtRg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by SA3PR12MB7921.namprd12.prod.outlook.com (2603:10b6:806:320::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8182.20; Mon, 25 Nov
 2024 10:27:28 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%5]) with mapi id 15.20.8182.018; Mon, 25 Nov 2024
 10:27:28 +0000
Message-ID: <953f1201-fb7d-408d-8ce3-7f6105c7c158@amd.com>
Date: Mon, 25 Nov 2024 11:27:20 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 1/4] drm: Introduce device wedged event
To: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>,
 Raag Jadav <raag.jadav@intel.com>
Cc: airlied@gmail.com, simona@ffwll.ch, lucas.demarchi@intel.com,
 rodrigo.vivi@intel.com, jani.nikula@linux.intel.com,
 andriy.shevchenko@linux.intel.com, lina@asahilina.net,
 michal.wajdeczko@intel.com, intel-xe@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 himal.prasad.ghimiray@intel.com, anshuman.gupta@intel.com,
 alexander.deucher@amd.com, andrealmeid@igalia.com,
 amd-gfx@lists.freedesktop.org, kernel-dev@igalia.com
References: <20241115050733.806934-1-raag.jadav@intel.com>
 <20241115050733.806934-2-raag.jadav@intel.com>
 <8c7292c3-8459-4ddc-a899-b56b1d93076f@linux.intel.com>
 <Z0Atv3Zw1d0N8hvv@black.fi.intel.com>
 <3644d364-6021-46fe-b3a2-689821551984@amd.com>
 <Z0CrJ3C3wJqtySLp@black.fi.intel.com>
 <637aa694-d32b-4c9a-99b7-3b77996d96b6@linux.intel.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <637aa694-d32b-4c9a-99b7-3b77996d96b6@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0205.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a5::17) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|SA3PR12MB7921:EE_
X-MS-Office365-Filtering-Correlation-Id: 23a146c2-0403-4002-b27d-08dd0d3bc2dd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?U2JuZ2dRdkdwS0dFZ0dBZGc0cHdNT29HNUM2T0F1K0l3ZzgycDJBVm9xbW5w?=
 =?utf-8?B?eXR6OEpWV3JHNTUxQWc3czdTeXRhMUxZQXJDa2h3SUZyc3VlMUdTZDNnT3Z1?=
 =?utf-8?B?UHRDNjJTdlVmOXdtZXVLKzJGNWxDSWRjMGVPWEV6YUpuN2grWTlPY2YzN0hn?=
 =?utf-8?B?RFh6WGIxSzM5elRLL1lxUzFyendzSzRjTWkrNzBZVTBwTkUwM0ZNT2ZtNlFz?=
 =?utf-8?B?aEl4SHlsZzd2RVQ3QndEaDBUYmJpZDVkTGt2Njd6TldHZTRwcXdDU01ud0po?=
 =?utf-8?B?aWhHcWxKTHYrb20yMHpxRGZDNVVXS3VnRVVvMC9kRGpvaUVpOUxPdzlIMmtV?=
 =?utf-8?B?OHJQa1Nvc2dtSDkwMWwxNFNmb0Q2OHNEcElwY3FBakpDQ0dhN3RpTDE4Ukt3?=
 =?utf-8?B?Qm0vQWo0NG5QLzluYzlKKzVrNmhFbnhWeGx6TlZpMWZSWGk0T0VtTXdrU1Rh?=
 =?utf-8?B?ZGxzUnZCRFRpb1BVMUl1bFVMNEZNWDFuSGk3ODg3dUhPY2xlR0lZclAxOTB5?=
 =?utf-8?B?YU0zenlhWEFNSEQrSkNjZ1V3VHY5ejNneFhQNUc4dTNjMFNDdmM4Y1Y1ekl6?=
 =?utf-8?B?alVsQm5BWTVLQ3FMVFF6cndNWDE5YUpHRnFoa2gyZitjcEQwSzR5dE4vN3hJ?=
 =?utf-8?B?Vlo4V2N5WHQ2MERhNTRocmxrVWw5MFNSeHlVMXN2SkJhN0tFREZDQzRNRVhD?=
 =?utf-8?B?RXNSLzVQcldOUWVRdTMzVlZNVVdvQ3dlQVBGMzlpdFVTWDFuQmwwYllDVVVh?=
 =?utf-8?B?QW42elRXaU54ZjJDanBSQlJqb1BpbXhxRXBLMzhzVGJTd1A4dzZEWWxwS2pz?=
 =?utf-8?B?WERzL3lOU0VaUzB1RlByTUQzU1Y3RFgzNFZqVElCUFNFU3B2R1Y5WUoyZDBD?=
 =?utf-8?B?NGhkMjlVYkJLL1pibkIwN3k3ek1BdkcxTDBYQjRHVTZSbWdpNkw4NHB4dEI0?=
 =?utf-8?B?STduK2FZOXorcWJmUFlCUnlDZHhpMDhjWFlsZCtiMGJac0hjU2xKcTdvVWN1?=
 =?utf-8?B?UEpXOC9GWUVwOWVPOWpoMXp6Z09tTHg4Q3prbk1aNmlBTHdac09BS2hpZUkz?=
 =?utf-8?B?UFUybFBlUGtiREltb1NhQlVROUc0QzUxdFZvM01KQUQ3MDgxOVIyR2lXRExH?=
 =?utf-8?B?Uk1HaHBJM2JsanhTOVZFd2JDNGhrTC8zRkFQVlJsUWtMayt1enJ3NnFDblNR?=
 =?utf-8?B?b1ZQdmdPdFVrMEVmVGIxbUlGWTdjNXlBbTIxaENJSlV6amdvaFFEc0RBbllj?=
 =?utf-8?B?WklOQ010M2tkcWRBbURmSCs2ZUcyQXBHS3JMemx2SVdoUERZQnpWanNxSkw3?=
 =?utf-8?B?YWx2NUx4N1l2YURSVTFNNjlFeGxrSDVBcWFYVU9UeGI4Vkw4RldIUWp4eEcx?=
 =?utf-8?B?L3U2MEpidFRFTUdaOHZnTjk0RlZSVUJId3NBd0pCMk0xN090bkh6bTlKV2xJ?=
 =?utf-8?B?UStLZDUyYmZ2QzhhVk9aNTJzbW1KanFCZ0U0MlZBYW9IcXI3N1ZhK1hTVHRF?=
 =?utf-8?B?R1czNm5sd0dPZGNyOTNyQjdqMzY0N2k0KzlqUUtKZTdQY2xNYmFBUmRFc0dh?=
 =?utf-8?B?RElRbHZnNHljUnl6YnNUTVNOUEFwcmZZeHpBT3ZpVG1QK05nSWhNL2RSdWVI?=
 =?utf-8?B?dUQzMFlJUVpQVDIyQzMxSVVsZTBGdGI1NFFsYzRFQUNTbHVPQmlpalBoVSt6?=
 =?utf-8?B?QnlUSlYwTW1KV09wa21nWjcvSXpBaHJYOUFERk9Xa2wwNFUydEJoOFJaNyt3?=
 =?utf-8?B?QVhsSk5DWjRiSjJSYmhRSVUwR0hzWlV5UGNSQ290dmxibzNrTmpHeUhHQzZL?=
 =?utf-8?B?WFE2UXhPblgvZlNNcGRZQT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aFExMWRLcjdpdnptZGJPRktySG1rSGJDbzZxOGVhRm1NanM0TStYdEpmVXhu?=
 =?utf-8?B?QnVlVDFSSWJLQ2krVHJlVHB5eFZPbFVXNFFUUTVWSmx1V2ovbjY2bGIvSUlN?=
 =?utf-8?B?aEFtaXlPZm5sNnJrTDNEUXpjQjlJUjF5aG4rSmJpeUUySG1tMDlZcTFNVUpR?=
 =?utf-8?B?S21wbktXZWNLU0VScnpKbkZjeGhTUEZZOG9jcFJVdjQvclF3emdrRmF5UlRv?=
 =?utf-8?B?bU5Sc1MzVXo0UTF0aTRrcWExQ05WazZBbms2RkFDNlNKd2k0RDRDdGtYTDFY?=
 =?utf-8?B?Q2FaUElWWFVWTkc1TEx0cVE4K3ZYRmRtLzAvd0d6NytvWmsvYldXWjJJYkMy?=
 =?utf-8?B?WUZidVRmNmZvRlVPVG5PRDFuT0pDZUZabnY4VGZYWkhzc3Z6Q2NVWDFiQmE2?=
 =?utf-8?B?ZWxNWFNpUitlM0dRWUlVekpzRzBmYTlMa2U1Y3R5aTdJZzJpQ0xMclF2eVFv?=
 =?utf-8?B?d1N6UHlJeFlXZ1FibEltKzRjZy9oTVJ0cnNnTVduWGhaN2xrM3NabUdrMXRp?=
 =?utf-8?B?aUZHaTZkTmd2dDJkUFhHbjlPK0VQdzIrcGtveGxMYTFpZFloeGFhTDVFdHZD?=
 =?utf-8?B?RXBpdDZuakw2ekIrb3N4TkQ2bHVoYXJ6c3hMN0JwdVhvb290KzZtSk56NXd5?=
 =?utf-8?B?dzRNampqdjJnMkFDTDJMcDd6WGEyTkEvM2xNeHpEcW9POVI3MzVLU2Z4c20v?=
 =?utf-8?B?cEtvZjFZV2t4RGhyekVsYUZmVWRjY20vbnNjdmprbzh6dHZ4TnNFL3YrbWd0?=
 =?utf-8?B?VzZoT3BoQlRmVEx1a2ZNS3ltNEZzUlFST0hwM1liWURUQUIxc2hwWlZBOFZ1?=
 =?utf-8?B?SkhZc0c4V0ZkRzRWa3hFMC9wRWpOclRkbjdxbXB4L0hhU3J1a010RFkzelYw?=
 =?utf-8?B?UjF2d0NGMDdubmdXNUc1cjVhTWVkSWlxNVphRmI3dEY3bzBBZVFHSWljRVE5?=
 =?utf-8?B?Rm5PQk4xcEhEY2VhYS80eUZiemY1b1Y5YThQSUJmeHovWG1MVmZic3NYaW0r?=
 =?utf-8?B?dElObDkxMDlSbmRLMTNEODFSczMyNWNzWmdER0dlTytWRS9wWUVINERlZ29r?=
 =?utf-8?B?NGpZemtoN3FEWFRqeG4yTjdFbjlTaHl5SW4zTjh6cEpQSFRveVFhcUJGNXRZ?=
 =?utf-8?B?Qi8wQndBT0pFV0MzbXdSbkxLd1lCMnE1QU11V2tKenZHL1BrQ3B1cFpqSTZ1?=
 =?utf-8?B?ZzBMOXFrNmw2cFhZZHBlbFd3anBBbkFTOGZhdTdub2hpSDNPd29nN3E2UWN0?=
 =?utf-8?B?Z1FTNUJ3Y0lxb1RKbmdTbGJ4NndjWkVFQ1hvdVphcVRTMm9LKzhIYUE5bnpx?=
 =?utf-8?B?VGgrcVNVYjI3R0ZkWGZ4L05oTUdKTklReFhWRUd1Rnp0N29OaEJrTHZnRnJu?=
 =?utf-8?B?blhlY3NQWEs4K0JXcHFMVFB5dFRqcjN3Ylc0VzloV3RGUnBFeENwWWZ2aHE1?=
 =?utf-8?B?WUJBVThlTDdNTnBJa0krUzhjeENSSWsxay9XNVBNTkcyTTdTcEQ5ZWhSQnJ1?=
 =?utf-8?B?S3ZrTDJpeFh0T0pUazM4SlBoa1l4TWJWY0hETVZndjFlTlhHOXNRczFjd3Ra?=
 =?utf-8?B?dmVEMnY2dml2UEtMMFl3SVBRTHBkZTlxVzdSM0JYRGNvNEk1TFN5UXkva1p3?=
 =?utf-8?B?aGI3R2NGNHF4MVBMSkx1bU1SQmJnZWtXSjVrY0tCZFl0b3pYSUEvNkZlOHY2?=
 =?utf-8?B?NmtUV08wekZ1MEFTWkpYUStPQi9VdHVNbStvR0J1bWdqd1p4ZE0wbDZuVDVS?=
 =?utf-8?B?ejdCaHVsRDNodUJZekFIVXlwTHFCdDgwU2FKQjlvTGtGd3dqV2kvcnFHdmxa?=
 =?utf-8?B?UGNrV1hBak5lSy9SK29PUzdEZmRBVDlDWWpUWmhNdG5BbUVqa28yNE5vQWhD?=
 =?utf-8?B?V21pSXBWYzg0M1RMYmpkY3Q5SlJ2bUxVWGpXM0poRkE4S1NWdEQwSmdmRGx1?=
 =?utf-8?B?aDRpemdSbGhTMFV4akhGSDZPNnVHd2hJd3pIdXovWXZwWXZvcDJPQWZoeHkz?=
 =?utf-8?B?S25ZT2xrNlFKNkhBSit0a2g5d2pRQXVxNDd5N2hNN1pLbnZWWWY2TGhtS1BK?=
 =?utf-8?B?TW9rdng5dUtxbytwNVgvK29oUjBReFJlMlBROEIyaisyREd1c3BqZUlEb1Ux?=
 =?utf-8?Q?l3+2j9fo7t520jqxKG2n9BWKw?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 23a146c2-0403-4002-b27d-08dd0d3bc2dd
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2024 10:27:28.1340 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wu4DHSI+A080UpYFTDJ6UaW6EX2RwR4y3RYScyeq0e7etZQVjI4gF5oVdhMe/d1P
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB7921
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

Am 25.11.24 um 06:56 schrieb Aravind Iddamsetty:
> On 22/11/24 21:32, Raag Jadav wrote:
>> On Fri, Nov 22, 2024 at 11:09:32AM +0100, Christian König wrote:
>>> Am 22.11.24 um 08:07 schrieb Raag Jadav:
>>>> On Mon, Nov 18, 2024 at 08:26:37PM +0530, Aravind Iddamsetty wrote:
>>>>> On 15/11/24 10:37, Raag Jadav wrote:
>>>>>> Introduce device wedged event, which notifies userspace of 'wedged'
>>>>>> (hanged/unusable) state of the DRM device through a uevent. This is
>>>>>> useful especially in cases where the device is no longer operating as
>>>>>> expected and has become unrecoverable from driver context. Purpose of
>>>>>> this implementation is to provide drivers a generic way to recover with
>>>>>> the help of userspace intervention without taking any drastic measures
>>>>>> in the driver.
>>>>>>
>>>>>> A 'wedged' device is basically a dead device that needs attention. The
>>>>>> uevent is the notification that is sent to userspace along with a hint
>>>>>> about what could possibly be attempted to recover the device and bring
>>>>>> it back to usable state. Different drivers may have different ideas of
>>>>>> a 'wedged' device depending on their hardware implementation, and hence
>>>>>> the vendor agnostic nature of the event. It is up to the drivers to
>>>>>> decide when they see the need for recovery and how they want to recover
>>>>>> from the available methods.
>>>>>>
>>>>>> Prerequisites
>>>>>> -------------
>>>>>>
>>>>>> The driver, before opting for recovery, needs to make sure that the
>>>>>> 'wedged' device doesn't harm the system as a whole by taking care of the
>>>>>> prerequisites. Necessary actions must include disabling DMA to system
>>>>>> memory as well as any communication channels with other devices. Further,
>>>>>> the driver must ensure that all dma_fences are signalled and any device
>>>>>> state that the core kernel might depend on are cleaned up. Once the event
>>>>>> is sent, the device must be kept in 'wedged' state until the recovery is
>>>>>> performed. New accesses to the device (IOCTLs) should be blocked,
>>>>>> preferably with an error code that resembles the type of failure the
>>>>>> device has encountered. This will signify the reason for wegeding which
>>>>>> can be reported to the application if needed.
>>>>> should we even drop the mmaps we created?
>>>> Whatever is required for a clean recovery, yes.
>>>>
>>>> Although how would this play out? Do we risk loosing display?
>>>> Or any other possible side-effects?
>>> Before sending a wedge event all DMA transfers of the device have to be
>>> blocked.
>>>
>>> So yes, all display, mmap() and file descriptor connections you had with the
>>> device would need to be re-created.
>> Does it mean we'd have to rely on userspace to unmap()?
>
> I'm not sure of display, but at least all user mappings can be destroyed
> using drm_vma_node_unmap.

That is not really correct. The mappings are not destroy, they are 
invalidated.

On access a page fault is generated and TTM should redirect the access 
to the dummy page.

The userspace application still has to unmap the VMA to destroy it.

Regards,
Christian.

>
> Thanks,
> Aravind.
>> Raag

