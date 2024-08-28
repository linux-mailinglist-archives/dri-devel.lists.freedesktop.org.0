Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9427B962C39
	for <lists+dri-devel@lfdr.de>; Wed, 28 Aug 2024 17:26:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A39789CD3;
	Wed, 28 Aug 2024 15:26:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="a8qSbemO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2061.outbound.protection.outlook.com [40.107.92.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BEDFD89CD3
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Aug 2024 15:26:06 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UfD7gZdMtZDIvR0qKJliX8+B13QtYpTY2HGL27DAu6CUSGbNuL6toLl6R6cX7bFX/ACRiQYNR47lqv5MYXBKSVernT/eqtAl5LQPeUx0kNrIfdVc4jdUa0ETMxKXlCDl48zKHyr8WYr+l8kHPuRda963dXkz0nZLhmmtZAYVC7Vnp2xqyC7FsykNyaH77vdmW36PXsV/iNS66DSuCTLoMZnKNLdqXHesLd8Kd1F4B6fwHddGT6N/qn09YGhDT4t72yRweqriuDt8noJr7poJZxe2PPaABlhf7PQWwA6Zm9O7zch6AThkUwn8DENAeZx9D5CnVlBgal8qbEiw3ygRtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OJAdmvyUX0y7K7ZXb/WjgWvF5N0CrDYoVi6+5wq1B+g=;
 b=DFx4TFxRmX15oBpi9aGLfLlv7YYn5DBu5cuJMX9EcfdHwxs/EAnu6wumn2G5JBEYVG6SOSUKLrNYdulPKOcwDcdKMM11q39JsDL0H5tnalgZ0nl41lQ0TpuQn7kVwsDK9TWw6CbHJ+AR94u4jYmI5p7yBTxMVOTPlU8IaCqVkO9aQ8++6niSJrK6GVWQx5Ddtzj6ykyiKVOC2FgbQO8kt16uTaZwUuSbTJq049JnIuPXIX5Bc6HmYCUrk5LH09fqzM7tSHRrsN/Rw08fyB9V1JDj/J3K6gw3AUUXoaVHS9uvyGSUzXZ/f1+NwxAtmqdTNCUqSrC1ez4nT9Em4VPODA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OJAdmvyUX0y7K7ZXb/WjgWvF5N0CrDYoVi6+5wq1B+g=;
 b=a8qSbemOYZ1Wu/39D+cJ79+BGn7VrlOupO0cFksMfNYvCJ9Ca2Nlz3Nw4DDOCsDOS8SP9vSjjnzDxHTJdoSMtaOvjPgVnrdw6gGk+uBVIvjT4idAv64Y+4cNI2hhzCBh2n/o4BlIAD+AwRukVfxa7nckVA5SnNY8ErtrwKF9YR8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by LV3PR12MB9214.namprd12.prod.outlook.com (2603:10b6:408:1a4::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.26; Wed, 28 Aug
 2024 15:26:01 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%4]) with mapi id 15.20.7897.021; Wed, 28 Aug 2024
 15:26:01 +0000
Message-ID: <afd2f497-88db-4609-ac4a-841039d61677@amd.com>
Date: Wed, 28 Aug 2024 17:25:56 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/7] drm/ttm: move LRU walk defines into new internal
 header
To: =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: Matthew Brost <matthew.brost@intel.com>, dri-devel@lists.freedesktop.org
References: <7d3c647a2df19aa0f8a582b7d346ba8014cf6ca3.camel@linux.intel.com>
 <ZsNTTCfBCpZNrSQH@phenom.ffwll.local>
 <440bb9a5-54b8-46ef-b6db-50110af5c02a@amd.com>
 <5a2f24bce352b65a1fb6e933c406b3ab1efa33e3.camel@linux.intel.com>
 <4d4c532a-ff35-4172-9b71-93f5d130711b@amd.com>
 <bb0a31ea3d82ee370873ca5f1c66ec4eeafabffe.camel@linux.intel.com>
 <d065806d-1d72-4707-bc5f-4da311809295@amd.com>
 <ZscDox5KoiNHXxne@phenom.ffwll.local>
 <3afe3ab2-4a58-49a9-acd7-c989980c68f2@amd.com>
 <Zs4EPT1DR7OrE5X-@phenom.ffwll.local> <Zs4Ss8LJ-n9NbBcb@phenom.ffwll.local>
 <c890ecbf-e7eb-479d-bb54-807edd1f66e6@amd.com>
 <010f1193a4c21fff566f4847d49289091b9b49c6.camel@linux.intel.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <010f1193a4c21fff566f4847d49289091b9b49c6.camel@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0210.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a5::19) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|LV3PR12MB9214:EE_
X-MS-Office365-Filtering-Correlation-Id: 25324bf5-84c8-4f6e-ba96-08dcc775b944
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WjVzQWQxSndXWWF4U2xsdVJzSnZoSHdkQVRoY2Y3VHZPL3MvWlBybEhUYUlV?=
 =?utf-8?B?UkhYV0x5aWI2Vm9SN0x2VUZjTTdHZlcvT1hEUGFZendMMGpETDdjUU1hVjgv?=
 =?utf-8?B?d2xoN0RNU201Um9pSjNLZ2tZRktZb2kyekxqY0VycElwZCt6anhlM0ZQb3h5?=
 =?utf-8?B?Z3JuQVgrbmlOZ0Rsa05TV1Z0K2JNMHZwZzk4OWFOOEJoSndUaDljWDc2T203?=
 =?utf-8?B?OTNaQ3Nzclk3NWpEbjJqd094ZXZWbGJyRlc2azR0bGU4R0h1YlJjZUtLMlBy?=
 =?utf-8?B?aUFpMzRGa2FPdTRhTE02NWdsdTZQYkVhYlR4eXV2MmIxRVBGNGpHcFpRTFVD?=
 =?utf-8?B?TEV4R1J0dmdkRjIvSnRGOG54dE4vaFl5VmJTQXhsS1B0RVpqbWFlTEMrNSt5?=
 =?utf-8?B?clpyekZQQTRiKzdDWmNGbDJwVXBUNUQvN25FNWFNdnJQS1gzQkx4U2N1Z1NL?=
 =?utf-8?B?UkhDMzRYSXdCZlJyYVhjSFRYVlpTdUk4MjN0Yi9zbzVyWjNEZktLbTU5STBa?=
 =?utf-8?B?dHlIc1liekJ2T1U4ajdZNlkyd0VScW5mTHVBeld0bEFJWC9WalBHVnJ3aitn?=
 =?utf-8?B?NGJpVVlSYlcrbmVvamE0dXh1VUtiR2NYa0dJSTNkZ1Zydjcwb1A1L3VIL0Nn?=
 =?utf-8?B?aWd3MEJYekVzNGErTFpDdzZRcVE2bkg5QklxbXc3Z0JlQitoN3hHWThQTTho?=
 =?utf-8?B?dHVFNTVBTk9mdTNpWW5SYlV2K2V1VFR3TVl6ZHlxUzYyb1o1TmgwOVB3Q1pn?=
 =?utf-8?B?bnI2Qy9sUko1b1U0QXAwbGNtYzE1MTBLOS9xTTlDUmM5UTdDdWd1Y01FYWhU?=
 =?utf-8?B?cEJzUzNna1hKSVhXSFlOajBUV1Bad1JnV2J6MkJ1bTJHZnRpYzZoTldKeUxz?=
 =?utf-8?B?elgvcUxtM0NDd2JJVE9ObmxLUks0dHp2UkdOdW5YQk14WGpIRXpiek82b2xp?=
 =?utf-8?B?UlZPRXM4M1BqVWZSbk1SU0pUKzRic0tLcjNuNGczRFVkdUZWamdGOHIzT2dN?=
 =?utf-8?B?dEZINDhZbFM4cUlYa1o2Z2RYdk5IZ3dWaHZzRW11aE1BeXBuUXVwNitTUlJw?=
 =?utf-8?B?elRaeXJEZHRxQ1UvM21PaVBrVk5GaUNRd3VzblBMY2o5S3YwMU03dlRaRm5V?=
 =?utf-8?B?Rkpna3pzYlNXQnQ4aEY0SWJnbHQwRDBaejBEWG9FRWoxU2M4WEVKOEV3ZXht?=
 =?utf-8?B?Z0ZKalF6L2huNHEycXgyZTZ0SGF0clhKZVJEUnJBTGFkUHlQTUtMTjNTdkpq?=
 =?utf-8?B?bjdWNC94MjRBY05uNHU0L2U4N0paVFBZbXhneGFDVnFKOTczOUt2RklaSWJq?=
 =?utf-8?B?UTdQU1J3RlNSQm9hRW80ZEJTaGRnTlQ2QS9mMWNnVE1MQ1EwNEZISlZheHZR?=
 =?utf-8?B?RUxUSkFrRlRLdGg3bXBrNURBU0d4MjlseDE1SVdkMmlpcE9GZmNFNUJOdm1v?=
 =?utf-8?B?cnBDVWFZSG5RbTRwalVKVEI1QzdObVVBMEFXWllhL25GbWg2UEdCalA3Ylcr?=
 =?utf-8?B?NnROODlPZ051WkRiYk40MEpXM3ZTc2h5bVcrSWgrM21DQkpLQkw3SE9RMnFt?=
 =?utf-8?B?UXY1a2gycXRBRWZjMVp0TjZwakxOd05mRnlkR0E3eXVVY3oxQmRyMzlXT0o5?=
 =?utf-8?B?T1lJMFAxZkFDVlRyaExpN1djK29saENVYlZrNXFBZDhpTDMvMlVaejVaY1Ja?=
 =?utf-8?B?LzlGMHJSdzJtWXpOek1HMGhNL1AzSTZsaDh0KzhCNUVQcmFHRFljTEo3V2pH?=
 =?utf-8?B?ZGNzb0J0UktwSHlVS0VpLzNUaUpxKzQ3Q29wL2xxSkg4NjBiQ3pHRW1JcGRm?=
 =?utf-8?B?cW1wN0N1WGF2UkFnRHdQQT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?V3ZLeHAxampCWUdBbW9zUVRmalBSc2t2ZGFOS2dubGR2K2c3QXhTNjJ4b3p6?=
 =?utf-8?B?QzZuWFdQblgwSGM2QVdlSGwyVjZlbmhISlJ0M0xwem9HbGZqTVYyV096QTl4?=
 =?utf-8?B?eVQraFV0YzlsQW1hN24rMWwzcTZmMVB5ZE93Tkg2Y1dEQm9BSlltRDBMd2pV?=
 =?utf-8?B?YlRFd0p1bTNReGM4c01uVjNCcHhrNGYvbnRUdThhR1JWWTZockNseXZMYVNk?=
 =?utf-8?B?eSt3R2JtUTNkaHRjb0JyZlI5R01jRXV1NlU5SDFsR21pQzN5TWVEZUs0aHBt?=
 =?utf-8?B?M3ZHQmV6WFZRbnhaUDA3OGFaOFQ4ZStnQ014MmswbDRUYS9DV1RXZVhZNmE3?=
 =?utf-8?B?UUM2czVFYXBPR0tqRkY4UUQweDJRTEY4VFZHUWNtVUpnUFdiaUY1ZGZFWXMw?=
 =?utf-8?B?L3JxNTdoK1lGRmVhd3paVkJrSk1rdXhLZHEvbmNJRlhSelN5UjNNcU01a3FX?=
 =?utf-8?B?NUhvUWxzSDFRVnBvODVqbVRibjdyaUFmSlJjTkN6NEwvTEN5QXpyZW0zRnh0?=
 =?utf-8?B?azhGdDJnbkVvaUVTd011RUZ4bGEzU2pLTlRVTkJ3TEVYZVhxMU5mUDh3V25n?=
 =?utf-8?B?ZnEyc096L1hNbk9sTGJaSHhCMUV3T2lQNDF4LzRRMUxIeURUbERPL3B2UXo5?=
 =?utf-8?B?MmVGNFJyMUFoSGRkSVB2ckVOQ1ZwQklIbmpndmNjSHRzN2dGd1NuR0ozcHpF?=
 =?utf-8?B?YnFUV2pCcjh1UmViSkdlaFlIQ0VXdFVZTWZxcW5hR2tydXRmTGZhZ2FTbHJz?=
 =?utf-8?B?YlJnRGorZWF5SGZKOVl3NllwWFMzaDNMR3ZVTmw4dDlFZFdvNFZKeWZFeWNQ?=
 =?utf-8?B?NnlFcE9XUHU0KzhzUkNFL2xrVVBuY09pMDlORzJNdWl4VzVjOXZZZ25zZDdH?=
 =?utf-8?B?ck5kSnZPK3BBNDhENlp6TjlNaDU3cWVBalE5Vk5Udmp3TnZ1cng0NlpCM05V?=
 =?utf-8?B?b2hSQXVaT1Z3RmZMZkdoanJLSmdOakNjNTczN3dFeDU3RmljbFVmVytrdTls?=
 =?utf-8?B?Uk5JK2o1MURBcmVQU2xXMC9LajBEdFpNbnE1aE1Ma3BCZ2EvRnVlR01TTm00?=
 =?utf-8?B?QVJCTEVoeXJ0ZTdPQ1NQYWJkRUtMdmlBUEtwY1JtRDFJSmtFUTZwY0hEM1gw?=
 =?utf-8?B?dXVoWmtxNzQ0NXJtWUUwWjFpbU1Pck53NFNZdytlTGNRS2kvNVJSQmpTWSsr?=
 =?utf-8?B?Y1pGUTdxY3lFQlFoV3hOREh3WWVXYjNkUUJHZEw3WlBjZDVJbUpmOHVEKy9z?=
 =?utf-8?B?U21lZ3R1b2gyd0RjUE1MOWlPeWNtSXVZTUpPd2l1YjJvUUYwL0QrWlREYWJX?=
 =?utf-8?B?c1ExY0FyUXVuQzVYTVFPcTQ0UVh5a2Q1QW1GVGZ0VDFHTlMrWDVacWMxTWFE?=
 =?utf-8?B?WElJSmF3U3RDMHNUalo3enZVc3hDd1l1VzUxdS9nOWFVVFAyWmFFaTJVeDJn?=
 =?utf-8?B?Z2xuMTVKRDJpaFhoZ21DemZ1d1RWdGVwY1g1WGYxSzRUcmtka3orYzVTaUNP?=
 =?utf-8?B?VVlTdXk3VHh1MlpZSVo0dFc3M3h4YWpYVjJKMzVxQ0pwbmFGdnIyOC8wSkUz?=
 =?utf-8?B?U2dFd3JoTVpmV3U5V2FXaFdycHdQT3kzUTNTN1dCS2J3U0RJRlBQYzQ0b3hK?=
 =?utf-8?B?M1pJYm9tOGRvZDMyUUcvcS9HRzNTY09pcmsrK1BEOXprbVdjLzVUajl2NXY4?=
 =?utf-8?B?NlJSTUR3ZTlxZXd3NDdteW1ybE80Sjh5SU8xNmxNK2lKOG1mK25Hc1hSRmoy?=
 =?utf-8?B?QlpxZGNzV0NFdURMWDVoNlZySGFVY3lONkNydFQrTWFYV2RUdjZoN3RvY1pI?=
 =?utf-8?B?S1BoUEpuUExZOW9wQXFPMGtXZlFDTVE4RWVobDZHUmNKYU9BVDJxYkpxc3lR?=
 =?utf-8?B?OFZFSGQxS3ZnNFVjNlFwTXk0Vm1tdFVINlpCek50V2ZNeCtxNlNQRlpmczIy?=
 =?utf-8?B?QlkzV05HdzZVSTlkVzFKWk9rdmVDU0dud21TcHZaL05kMkp6QWxiT1VqZnNX?=
 =?utf-8?B?d1k2aVRZc3pnZWhxZmZzM1A0SVYyMGNUUXFKTVVxYTlpUnhMeFdvMm9aVVFm?=
 =?utf-8?B?YzdNV3hUejJNNmRuT01RZ25qN2QvbnNHYWZ4SStpZTlwdUFWdWJRKzZvNlFn?=
 =?utf-8?Q?zmLI=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 25324bf5-84c8-4f6e-ba96-08dcc775b944
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2024 15:26:01.6011 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6NQzUQXpf9Z4evRmk0ulj4857TXlYCNxf22b/EZDRl6pRvj80sFtRKmHhliUrhDI
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR12MB9214
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

Am 28.08.24 um 16:05 schrieb Thomas Hellström:
> On Wed, 2024-08-28 at 14:20 +0200, Christian König wrote:
>> Am 27.08.24 um 19:53 schrieb Daniel Vetter:
>>> On Tue, Aug 27, 2024 at 06:52:13PM +0200, Daniel Vetter wrote:
>>>> On Thu, Aug 22, 2024 at 03:19:29PM +0200, Christian König wrote:
>>>>> Completely agree that this is complicated, but I still don't
>>>>> see the need
>>>>> for it.
>>>>>
>>>>> Drivers just need to use pm_runtime_get_if_in_use() inside the
>>>>> shrinker and
>>>>> postpone all hw activity until resume.
>>>> Not good enough, at least long term I think. Also postponing hw
>>>> activity
>>>> to resume doesn't solve the deadlock issue, if you still need to
>>>> grab ttm
>>>> locks on resume.
>>> Pondered this specific aspect some more, and I think you still have
>>> a race
>>> here (even if you avoid the deadlock): If the condiditional rpm_get
>>> call
>>> fails there's no guarantee that the device will suspend/resume and
>>> clean
>>> up the GART mapping.
>> Well I think we have a major disconnect here. When the device is
>> powered
>> down there is no GART mapping to clean up any more.
>>
>> In other words GART is a table in local memory (VRAM) when the device
>> is
>> powered down this table is completely destroyed. Any BO which was
>> mapped
>> inside this table is now not mapped any more.
>>
>> So when the shrinker wants to evict a BO which is marked as mapped to
>> GART and the device is powered down we just skip the GART unmapping
>> part
>> because that has already implicitly happened during power down.
>>
>> Before mapping any BO into the GART again we power the GPU up through
>> the runtime PM calls. And while powering it up again the GART is
>> restored.
> I think you're forgetting the main Xe use-case of Lunar-lake
> compression metadata. I'ts retained by the device during D3hot, but
> cannot, at that time, be accessed for shrinking.

Yeah, that is really something we don't have an equivalent for on AMD GPUs.

When the ASIC is powered down VRAM is basically dead as well because it 
won't get refreshed any more.

> And copying it all out "Just in case" when transitioning to D3hot just
> isn't a viable solution.

I would say that this is solvable with a hierarchy of power management 
functionality.

E.g. the runtime PM interface works the same for you as it does for 
amdgpu with evicting TTM BOs etc....

Then separate from runtime PM you have a reference count for the 
accessibility of compressed metadata. And while shrinking you only 
resume this specific part.

Christian.

>
> /Thomas
>

