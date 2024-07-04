Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5600B92786E
	for <lists+dri-devel@lfdr.de>; Thu,  4 Jul 2024 16:33:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2018C10EB29;
	Thu,  4 Jul 2024 14:33:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="JLHAqExY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2061.outbound.protection.outlook.com [40.107.244.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2DA8D10EB28;
 Thu,  4 Jul 2024 14:33:11 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CeOPufCf0ybtf+Lcv3L3sTFAbTwf/YPhWV/RjSC0vW/WDpQK5GK09BJaJsQ/uNru4hUVAnfVInNBtVoXUUUpk4vBiQFYakcVMlH6LDKXlI4CPq4zfTIFyVg/nWYrmX8GmmGGQif723biOvXj8QmDpnzid8Mjdv6/diqH8ATQt9Ye5qb0myBYKEvn0BQVJDJLmiHnmwoDbOA8qgJNo9unNFRqXHkyG88VPrymFnVPs6RR3X7oXwYkDWU8QCh7K9OKyhGhcYntqDn8xLFW2kD3ZhZFURWNzH//aLbOw8PQ4LLhdEnB4Un92xpe76qy61X2V8nnZsWSgvYzcqFLjpIJ0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4dEb8lIRLMAvzjkp9tLhGiX7W4qnxtCHGLEHjDcZGVE=;
 b=B1SroX7FjnieSZGFhhYxxF8vmfwaUokWObP75Uz9CLewaeMnAHYF65vTAQ0aiGHk8vlrSZsijothL4LAPu4pexkfArEsA8ufN7w8CiEHG23xfIt8PofLLy3LCJVvPdnXSmJFsvPRgjm4A29yyI1Tt1v3rL0ietvsV5DNI9+19wLCWpFt6qvAuZLJeXGQ6YMW64FwsrLhJuNFiyOHaU5A3EfDQgycYPrwCWeauIpcsDAu3sMF/Z7WQBNshgbnZuh/gpjZS7PWEUrysMwMmwCDIrgWEeN8ph/O6Ez71JpxyyL1ACFTB/zw+NQ67yrgzs6YH+8DqlZXYuGnGnvwD//qnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4dEb8lIRLMAvzjkp9tLhGiX7W4qnxtCHGLEHjDcZGVE=;
 b=JLHAqExYiPriYWnUn/iyWPNj82JMKFCJM2XbCFAk4n0QQT1Wap2zpSxUUQiGBwRuRiiOD0EB/zILVQ32IfwzOrt+Lv+SG+2vWyGGJkp/V3yMB3j54oMYW28r1JokV2CxCn1iMObbX50NmuJIqcdF/ZO9vfq4r+Cs+jDonOAKnoA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by IA0PR12MB8225.namprd12.prod.outlook.com (2603:10b6:208:408::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.26; Thu, 4 Jul
 2024 14:32:59 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%6]) with mapi id 15.20.7741.017; Thu, 4 Jul 2024
 14:32:58 +0000
Message-ID: <840bb087-483b-466b-a01c-e2f1b7788e9f@amd.com>
Date: Thu, 4 Jul 2024 16:32:50 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 04/12] drm/ttm, drm/amdgpu, drm/xe: Consider hitch
 moves within bulk sublist moves
To: =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 intel-xe@lists.freedesktop.org
Cc: Somalapuram Amaranath <Amaranath.Somalapuram@amd.com>,
 Matthew Brost <matthew.brost@intel.com>, dri-devel@lists.freedesktop.org
References: <20240703153813.182001-1-thomas.hellstrom@linux.intel.com>
 <20240703153813.182001-5-thomas.hellstrom@linux.intel.com>
 <6e675fdb-7656-46f1-8753-ade66ef9de7b@amd.com>
 <f3bb190b58659b332819e9ab8a4a79df0253dad9.camel@linux.intel.com>
 <c49319cf-c110-4743-9a63-4028b6e5aab8@amd.com>
 <fe1c711e273a7699da2115f1161d4deaab2679db.camel@linux.intel.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <fe1c711e273a7699da2115f1161d4deaab2679db.camel@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0198.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ad::8) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|IA0PR12MB8225:EE_
X-MS-Office365-Filtering-Correlation-Id: 84cd1d36-e5e1-41c0-52b4-08dc9c36338e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?OFVVT1RoTVZjcFVzUGlyWHRhMUdYdkMzajB4ejVkVmYyZXFsOTRpWkRjZ1N4?=
 =?utf-8?B?YXJ2ZWhNVEhFa1ZyWHBueTk2T2pQTGRVbXBOcU94NE9uUVd1Sjk2UE9uczgx?=
 =?utf-8?B?ZkhKbjRsbmROWi9GeEg1RXpiY0VHT2NmMGc1LzhrVXVqUWFRbGViclFRNUh2?=
 =?utf-8?B?c2hWRnN3dysvb3ZQTjhkbitFeHNITi90V1A5NVFXZmFLVWNPZW9ad3d4YzA3?=
 =?utf-8?B?U3g3UndKUiswWkpDU2Z6VU1yblRLWjVlbEh0a0hpQ0xaTFhvY0xuRVZtUGJW?=
 =?utf-8?B?YUVaUHhhREZHY1pzbU42d0xWc2VOWHh0OFpqSno2OUI1TVViUDRQalZEMUZl?=
 =?utf-8?B?UUNLcWsydU13ZzFZZ0ZGUlVqS0dGUmc1UmsyMXZNZGJMZWw5LzJrY3R6OWhK?=
 =?utf-8?B?aDlqcHZKalljaUcrdGQxQlFqbWZiUEFWeGxzWHdLbENrZVJVc2NwZmVzTXVx?=
 =?utf-8?B?WGdnU0FMQ2xVWDhPV09vbEZPbDN3dE9YeWpPbUFlN2w3U1J5b29Mb3hMWDVt?=
 =?utf-8?B?THBXN1hpWGEzMmQ0bEdFSmdIRS84aVFKUGZ5VEdpQ3NRRloxd2NRc01OeG1w?=
 =?utf-8?B?YVRweDF5VjdlN2NxWktHWTFiNE9OWTJXbTVrK29iSnFsSWVQWlFpU3hNZ2RT?=
 =?utf-8?B?ZTNqRG41WG0xa084VWQyMFprR1Rvdi81dFFyL1VPcFpNcHp5L2Z1UkgvNlZ5?=
 =?utf-8?B?SHYvOUw3NXpieFNzMjBwQmVoZHVRcjcrYXJ2ZHhqQnV0R2tIa0RvaVBnNjd5?=
 =?utf-8?B?OFIxakdRSWlFVW9PTFZmeDNSMjRKKzFkSWhDblQwLzFsdkM5TmxEaXd0ZGZB?=
 =?utf-8?B?U2p2Umo4RFR1dVdSU0l5VUdpREVJY00vVTFEL0FSZXhyYkZkTmtHNVFmR2dv?=
 =?utf-8?B?MW5DVVB6YllZa0o0bmt4M2JtdEdsMTZnd0dwWjB2WGFsb3pZRDl6cWE2Nnpr?=
 =?utf-8?B?YUNteVZXYzk0azc0MGZjT3VrWFl5cXh4UHh5WGdwNE9VcTZFTEgwVldhRHVu?=
 =?utf-8?B?aVp2cFIvUVBLVFFYTWlxYm9hdWZXekFCTktFTHFRQjhtV1gvN1pMOTBPb0l5?=
 =?utf-8?B?ZGphUllKTWlpSnJuRjFBbVYxVzlnekhEMUlkMzVoTWk2azcxaEpwNFhhdjNK?=
 =?utf-8?B?SGNsUW9mWFRBVUFtU21kZXYzOEJyRzJCbm5IZU94L1JCZGFpUUptR1ZSa084?=
 =?utf-8?B?M3owQ0E2WW8ra01hd2kwYldjTTVzUCs0ZElnUzhSQlR3STh1QVVpbG5DRHRx?=
 =?utf-8?B?TVZzN09VS2tXaThxd2J5WTVMK1crWUI3eGVneklEc0xkYUJ0a0d1V0lEcjJz?=
 =?utf-8?B?aWlQZUR2ak4wWjRaTEVUR2tvc3BvdUhhOTFpS2NEbU1JVnVaWUxnNzVXUlBQ?=
 =?utf-8?B?N1FFcnZVUThXNjRtMU9SMTNZdHlPeTNMZ0U5cW1SbW42Q1RUaWo1QzZnSENh?=
 =?utf-8?B?WVFEbW90eTNMMm45SVhWTklRUlFadXg2ZnlneVk0SmJLdldmNFZRQ2VvTG5Z?=
 =?utf-8?B?S1pQaWtjMEQ2QU5KZHBpN2p0aTNER2tXdDRwZkFkcWhIQ255V05QSysxWXNK?=
 =?utf-8?B?aUhDam4yV3JXWkFaWFRXM0ZhM3NTWVEvek40Vi95Q2tSQkxnYmQ2OVZjV042?=
 =?utf-8?B?Wm9MdlkxQ2ltdjNEYkljbU0rMXFPWWIzRm81cWtxajBaOS9XTW9GRi9zbEc4?=
 =?utf-8?B?dGJPa1c0UGZySE1mdHZVOVFpSHQ2bkQzanNtc3ZhaWMzMWxuWmhkZFJiN1Ar?=
 =?utf-8?Q?sWXJgQLBxo9b69vIrs=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dTh3anpDdmFJOTE3dncxSVgyWld0QU5NOUE0OWdSNHZISzdkME45YkZWR0pM?=
 =?utf-8?B?czZMdTQ3UHBYTForYi9RbWFCY0gwVHk2M0pMd2VjM3UzR0x5ZXpSMzVDVWNJ?=
 =?utf-8?B?UlBocHVxRjE2Wjd3TmhaaFJLWllWV3ZLcWpsTjBYZ0pROGN3WDJQRWtQbnFM?=
 =?utf-8?B?RnhYVmdnVERqWHd2TXIwQWkwUnB2aVN4Yk1SRS9BYkpOelBJRWIxd3g3SVZQ?=
 =?utf-8?B?ZVZDbnFnK2VIM1NMN1VHN205N2k5Rmo1R2hDM1NsSitQZW1venJRZWZ1ZWVK?=
 =?utf-8?B?M04xNEFBeWRJTWRyeUc1Y3IvU1E2cW1OU0k5Nis1OEJHZ3ZZZnMxemdEM1N0?=
 =?utf-8?B?eUhWV3kySWxGWDlKNFZXQmsyVGNQNVlXeU1aVEJxSmgwQzJwdWh2bjVsYlhE?=
 =?utf-8?B?SUNqS05mZGZabUN0VHQrVnloZUpEbHl4QUdrUHhkYzMvL2tZUHpYckVqamNl?=
 =?utf-8?B?S01NdjJTM0JpOU5KMWFURWNvZjVEd2l2ZDd5ZEZLQlZvbFlKUGFrVWk3QjNt?=
 =?utf-8?B?UkFTOUJJS0tZbzdEUnVmamVhZnBkck5RY1VmczN2dGhZZmdlTHVwOG51UG03?=
 =?utf-8?B?YzVBdFp1N1dlaHFyR3R1bjNWQWkvemlEZHYvVnJ0RFRONk52WjN4bUMvbFJp?=
 =?utf-8?B?Kys2bVQ0cW5WMzZZMHBTWFY4bzZyL0VOTGpxSThORy9KYU0xV0l6bFVOb053?=
 =?utf-8?B?TnF4R0pMNFRYNjRlWUpDaGh0dDRKS0tMZWo5a3BqbldFckZoQzZpNXBaK1Ex?=
 =?utf-8?B?cE5Pb2hvSXBCTUlxSFl2MndoK2lvbFd1TDRuY09GRWJZWnd3NGhXRlhWeC9q?=
 =?utf-8?B?TmdGSVRQN3lwY1RBbVN6LzJCRzdMdTV2Qkh2OStMTDRiblJaSURqYTJSWnVB?=
 =?utf-8?B?bEZGUTVaNzl2b3hyV0JNSFFkZlhFdXpuOWFMWWxDNktIL1hZSWJoYUEyYTRP?=
 =?utf-8?B?Qy84SnVrSHJjWXFLVHAzV040VTlyMmJybDMyMUxpLzJsTFphUDhvTmdKd1ph?=
 =?utf-8?B?RlQ1RHJsVHZhMDY0NFV3R2RZVXJFT1pYRWdtQ3phRHkyWkZtQjYra0lEMUNh?=
 =?utf-8?B?c2l6QVpwUkRRN1E0UlJUcWZCbVNLWHV6NlZaV2VUY29IVis5SHRkMElpa29Y?=
 =?utf-8?B?YUVmMm5RZ2RLd0w0VDAwTk95bDlYTDF2bTUvcHBlbDBkSTFIQzcxR3UyZk5H?=
 =?utf-8?B?YXB3ei95M0pUTXcweGZYdGsxQkFiR3Y4VHFDcU1aSXU2WisvQ2llb1NaUFln?=
 =?utf-8?B?TCtDY0V0OVFlVjE0NGEzOXBPTUZ2dXlWbkVqVXJPazhDRDFXTkVkUlVrVkk2?=
 =?utf-8?B?ZkJWcXVENVZ2VTFZNDVXemIyUnBlTkdmazVCR0tPMG0zZ2I2aFdqeHVpSC82?=
 =?utf-8?B?dzFoVUhUN3dNTVA1MFBKblJreDdYbHYvcDJYaHQzc3U1Q2l3azB2QXEyMGY3?=
 =?utf-8?B?amxKSnM5dXJNU2ZRdXF1YlBlZUd2T0F5dTEzSEhBR21NcFJpQytZYllHRVVl?=
 =?utf-8?B?MUFESjdwVk1abUpobkdFNWtVQkN5TytER1ZudC9WV3VCcU0rNXZYc2I4R0pz?=
 =?utf-8?B?cjZCOXhPaVh0VlRUaVdxbEpnekRTSmxOb2ZpMHF2YWJIUC9BQ29CNmVBS2hu?=
 =?utf-8?B?S0EvMjRDTVZYNWE2MmpyM1UzalZzSSs3REgyRVg1YjhVRFdPTU5rYlFKeHIw?=
 =?utf-8?B?eFhhZ2hpZ1NSZWZaOTJwYWNjSG9vSVptTkMrbG8vUnFSbmNlNUxxanlwbnpq?=
 =?utf-8?B?bWJPcVBKZVhPQmJRZjF2SUhORU5Pd2w4Q0dnVGlXbXVKSFVsL1pFK2RTSldt?=
 =?utf-8?B?a0taRmk1UGdXWHg1eFRnaW82NlREZ3hOSGl4SFRUY005M1Q4MGNyRm1Iajkr?=
 =?utf-8?B?bG1qZm53enVuR2JiaDhCaDVIR2h3RldTYVFMQ2FtMzE0NHVGcTkyVzhPWnVG?=
 =?utf-8?B?V1Q4MEpPbXlWUHpoa3hpYTg4ckZGU21sNWNEWngvOGp2c2gxQlQzVm5ab2VH?=
 =?utf-8?B?VFRxemhtNEExd04raDZKR3RGQzlCRitRdWFDYy9ubWFhb0V1TElQTWJ6WjRu?=
 =?utf-8?B?RGIzeTBTb2E4YWlCOWJ6ZTJTOHc3bkdDQ0JQQ1NwMmRCY3VXb3YyN2wybWtS?=
 =?utf-8?Q?3xTh45djoR5j9jfjocrO3LHA8?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 84cd1d36-e5e1-41c0-52b4-08dc9c36338e
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jul 2024 14:32:58.9411 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: s+lPYGsi2tnV6N6fZ+G+TmlhYJmU/wF7sJInmBlta4nG13VJgnEquddJATcz5ois
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8225
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



Am 04.07.24 um 15:53 schrieb Thomas Hellström:
> On Thu, 2024-07-04 at 15:13 +0200, Christian König wrote:
>> Hey Thomas,
>>
>> Am 04.07.24 um 14:41 schrieb Thomas Hellström:
>>> Hi, Christian,
>>>
>>> On Thu, 2024-07-04 at 11:21 +0200, Christian König wrote:
>>>> Am 03.07.24 um 17:38 schrieb Thomas Hellström:
>>>>> To address the problem with hitches moving when bulk move
>>>>> sublists are lru-bumped, register the list cursors with the
>>>>> ttm_lru_bulk_move structure when traversing its list, and
>>>>> when lru-bumping the list, move the cursor hitch to the tail.
>>>>> This also means it's mandatory for drivers to call
>>>>> ttm_lru_bulk_move_init() and ttm_lru_bulk_move_fini() when
>>>>> initializing and finalizing the bulk move structure, so add
>>>>> those calls to the amdgpu- and xe driver.
>>>>>
>>>>> Compared to v1 this is slightly more code but less fragile
>>>>> and hopefully easier to understand.
>>>> This is the only patch in the series which I see critical.
>>>>
>>>> I think the final goal when using drm_exec in TTMs eviction path
>>>> is
>>>> to
>>>> keep all evicted (or evicting) BOs locked until we have enough
>>>> space.
>>>>
>>>> This means that for bulk move sections on the LRU we would lock
>>>> the
>>>> first BO and would only drop that lock again if we have gone over
>>>> the
>>>> full bulk move section and know that all BOs are not valuable for
>>>> eviction.
>>>>
>>>> Because of this the issue of having to consider hitches move with
>>>> a
>>>> bulk
>>>> move section on the LRU doesn't even occur because for that a
>>>> concurrent
>>>> process would need to grab the common lock of the BOs in the bulk
>>>> move
>>>> section.
>>> While I agree that this is something we should strive towards,
>>> following the previous discussion I already reworked this patch
>>> completely to remove the dual hitches and make it less fragile.
>> Yeah seen that and it indeed makes it much easier to understand
>> what's
>> going on.
>>
>>> After that you mentioned you were ok with the high level approach
>>> for
>>> these first four patches here:
>>>
>>> https://lists.freedesktop.org/archives/dri-devel/2024-April/450288.html
>>>
>>> So is that not any longer the case?
>> I'm ok with having it as intermediate step, but for that it's a bit
>> much
>> of an hammer.
>>
>> On the other hand having clean ttm_lru_bulk_move_init() and
>> ttm_lru_bulk_move_fini() calls is probably something we should keep
>> around anyway.
>>
>>> To recap, the concerns I'm seeing with the "kept common lock"
>>> approach
>>> are
>>>
>>> a) Since when we release the LRU lock and the common bulk bo lock
>>> is
>>> not yet locked, a LRU bump may happen and the hitch will go with
>>> it. So
>>> to avoid that we need to place the hitch *before* then considered
>>> resource in the LRU list rather than *after*. Now on the next
>>> iteration
>>> we need to come up with some way to choose what's really the next
>>> resource? If the next resource pointer is the same we already
>>> considered, should we assume it might have been freed and re-
>>> alloced
>>> with the same virtual address?
>> My idea is for the general flow is this:
>>
>> 1. Grab the lru lock
>> 2. Grab a reference to the BO after the hitch, eventually trylock the
>> BO
>> or just continue with a prelocked one
>> 3. If locking wasn't successfully
>>       4. Drop the lru lock
>>       5. Block on the BO lock
>>       6. Check that this resource/BO is still the one the cursor
>> points
>> to, if not drop the lock and restart from #1
>>       7. Grab the lru lock
>> 8. Advance the cursor.
>> 9. Drop the lru lock.
>> 10. Try to evict or swap the BO
>> 11. Repeat if still not able to allocate memory.
>>
>> The BO could be prelocked if it's part of the currently processed
>> bulk
>> or previously contended and prelocked by drm_exec.
>>
>> And instead of checking if the resource is in the right domain we
>> check
>> if the resource/BO is still the one where the cursor points to.
>>
>> This way we don't care if the resource was reallocated and by
>> coincident
>> ended up right after the cursor hitch again. As long as we still
>> point
>> to the BO we just locked everything is fine.
>>
>>> b) It will be up to the user of the lru traversal to actually
>>> guarantee
>>> that locks are held across a bulk part, to make the resource
>>> traversal
>>> reasonably self-contained. In this case the LRU walker, because
>>> there's
>>> where the bo locking happens.
>>> This means that any other code that aims to walk the LRUs for
>>> various
>>> reasons, and doesn't provide any held lock guarantees, may be
>>> subject
>>> to unexpected results if someone bumped the LRU.
>>> So we would basically tailor the resource iteration here for a
>>> single
>>> use-case and not make it robust for various use-cases.
>> Yeah, that's also going into a direction I was questioning. Do we
>> have
>> use cases for the resource iterator were we don't lock the BO?
>> If not why don't we integrate all this into the first_resource() and
>> next_resource() functions instead? Obviously with some helpers in the
>> BO
>> code.
> That'd be if we moved this out to a drm-level layer like the work Oak
> started for cross-component eviction targeting SVM.
>
> I guess it's also my desire for keeping components separated as much as
> possible, but I'm aware others may feel differently about that.
>
>>> So my suggestion is we keep this until we've come up with a bullet-
>>> proof way to sort out a) and b) above and then we can rip it out.
>> Yeah if we can't make progress otherwise that works for me as well.
> Then I'd say let's go for this and revisit.

Ok in that case feel free to add my Acked-by to this patch.

>
> So what are the ARs here?
> Making sure we have a clean init and fini is something I've thought of
> as well.
>
> Related to that, what's your opinion on using DEFINE_CLASS() and
> scoped_guard() in TTM for automatic cleanup of the iterator when
> leaving the loop scope?

Good question, I was wondering about that as well.

On the one hand it makes error handling easier on the other have I 
worked with scope based error handling in both C and C++ before and 
there are always down sides as well.

Not sure if that's really a good idea or not.

Regards,
Christian.


>
> https://elixir.bootlin.com/linux/v6.10-rc6/source/include/linux/cleanup.h#L168
>
> Thanks,
> Thomas
>
>> Regards,
>> Christian.
>>
>>> /Thomas
>>>
>>>
>>>
>>>
>>>
>>>
>>>
>>>
>>>
>>>
>>>
>>>
>>>> Regards,
>>>> Christian.
>>>>
>>>>
>>>>> Changes in previous series:
>>>>> - Completely rework the functionality
>>>>> - Avoid a NULL pointer dereference assigning manager->mem_type
>>>>> - Remove some leftover code causing build problems
>>>>> v2:
>>>>> - For hitch bulk tail moves, store the mem_type in the cursor
>>>>>      instead of with the manager.
>>>>> v3:
>>>>> - Remove leftover mem_type member from change in v2.
>>>>> v6:
>>>>> - Add some lockdep asserts (Matthew Brost)
>>>>> - Avoid NULL pointer dereference (Matthew Brost)
>>>>> - No need to check bo->resource before dereferencing
>>>>>      bo->bulk_move (Matthew Brost)
>>>>>
>>>>> Cc: Christian König <christian.koenig@amd.com>
>>>>> Cc: Somalapuram Amaranath <Amaranath.Somalapuram@amd.com>
>>>>> Cc: Matthew Brost <matthew.brost@intel.com>
>>>>> Cc: <dri-devel@lists.freedesktop.org>
>>>>> Signed-off-by: Thomas Hellström
>>>>> <thomas.hellstrom@linux.intel.com>
>>>>> ---
>>>>>     drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c |  4 ++
>>>>>     drivers/gpu/drm/ttm/ttm_resource.c     | 92
>>>>> ++++++++++++++++++++++++++
>>>>>     drivers/gpu/drm/xe/xe_vm.c             |  4 ++
>>>>>     include/drm/ttm/ttm_resource.h         | 56 ++++++++++------
>>>>>     4 files changed, 135 insertions(+), 21 deletions(-)
>>>>>
>>>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
>>>>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
>>>>> index 3abfa66d72a2..97743993d711 100644
>>>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
>>>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
>>>>> @@ -2420,6 +2420,8 @@ int amdgpu_vm_init(struct amdgpu_device
>>>>> *adev, struct amdgpu_vm *vm,
>>>>>     	if (r)
>>>>>     		return r;
>>>>>     
>>>>> +	ttm_lru_bulk_move_init(&vm->lru_bulk_move);
>>>>> +
>>>>>     	vm->is_compute_context = false;
>>>>>     
>>>>>     	vm->use_cpu_for_update = !!(adev-
>>>>>> vm_manager.vm_update_mode &
>>>>> @@ -2484,6 +2486,7 @@ int amdgpu_vm_init(struct amdgpu_device
>>>>> *adev, struct amdgpu_vm *vm,
>>>>>     error_free_delayed:
>>>>>     	dma_fence_put(vm->last_tlb_flush);
>>>>>     	dma_fence_put(vm->last_unlocked);
>>>>> +	ttm_lru_bulk_move_fini(&adev->mman.bdev, &vm-
>>>>>> lru_bulk_move);
>>>>>     	amdgpu_vm_fini_entities(vm);
>>>>>     
>>>>>     	return r;
>>>>> @@ -2640,6 +2643,7 @@ void amdgpu_vm_fini(struct amdgpu_device
>>>>> *adev, struct amdgpu_vm *vm)
>>>>>     		}
>>>>>     	}
>>>>>     
>>>>> +	ttm_lru_bulk_move_fini(&adev->mman.bdev, &vm-
>>>>>> lru_bulk_move);
>>>>>     }
>>>>>     
>>>>>     /**
>>>>> diff --git a/drivers/gpu/drm/ttm/ttm_resource.c
>>>>> b/drivers/gpu/drm/ttm/ttm_resource.c
>>>>> index 9c8b6499edfb..b6a2daac5518 100644
>>>>> --- a/drivers/gpu/drm/ttm/ttm_resource.c
>>>>> +++ b/drivers/gpu/drm/ttm/ttm_resource.c
>>>>> @@ -33,6 +33,53 @@
>>>>>     
>>>>>     #include <drm/drm_util.h>
>>>>>     
>>>>> +/* Detach the cursor from the bulk move list*/
>>>>> +static void
>>>>> +ttm_resource_cursor_clear_bulk(struct ttm_resource_cursor
>>>>> *cursor)
>>>>> +{
>>>>> +	lockdep_assert_held(&cursor->man->bdev->lru_lock);
>>>>> +
>>>>> +	cursor->bulk = NULL;
>>>>> +	list_del_init(&cursor->bulk_link);
>>>>> +}
>>>>> +
>>>>> +/* Move the cursor to the end of the bulk move list it's in */
>>>>> +static void ttm_resource_cursor_move_bulk_tail(struct
>>>>> ttm_lru_bulk_move *bulk,
>>>>> +					       struct
>>>>> ttm_resource_cursor *cursor)
>>>>> +{
>>>>> +	struct ttm_lru_bulk_move_pos *pos;
>>>>> +
>>>>> +	lockdep_assert_held(&cursor->man->bdev->lru_lock);
>>>>> +
>>>>> +	if (WARN_ON_ONCE(bulk != cursor->bulk)) {
>>>>> +		list_del_init(&cursor->bulk_link);
>>>>> +		return;
>>>>> +	}
>>>>> +
>>>>> +	pos = &bulk->pos[cursor->mem_type][cursor->priority];
>>>>> +	if (pos->last)
>>>>> +		list_move(&cursor->hitch.link, &pos->last-
>>>>>> lru.link);
>>>>> +	ttm_resource_cursor_clear_bulk(cursor);
>>>>> +}
>>>>> +
>>>>> +/* Move all cursors attached to a bulk move to its end */
>>>>> +static void ttm_bulk_move_adjust_cursors(struct
>>>>> ttm_lru_bulk_move
>>>>> *bulk)
>>>>> +{
>>>>> +	struct ttm_resource_cursor *cursor, *next;
>>>>> +
>>>>> +	list_for_each_entry_safe(cursor, next, &bulk-
>>>>>> cursor_list,
>>>>> bulk_link)
>>>>> +		ttm_resource_cursor_move_bulk_tail(bulk,
>>>>> cursor);
>>>>> +}
>>>>> +
>>>>> +/* Remove a cursor from an empty bulk move list */
>>>>> +static void ttm_bulk_move_drop_cursors(struct
>>>>> ttm_lru_bulk_move
>>>>> *bulk)
>>>>> +{
>>>>> +	struct ttm_resource_cursor *cursor, *next;
>>>>> +
>>>>> +	list_for_each_entry_safe(cursor, next, &bulk-
>>>>>> cursor_list,
>>>>> bulk_link)
>>>>> +		ttm_resource_cursor_clear_bulk(cursor);
>>>>> +}
>>>>> +
>>>>>     /**
>>>>>      * ttm_resource_cursor_fini_locked() - Finalize the LRU list
>>>>> cursor usage
>>>>>      * @cursor: The struct ttm_resource_cursor to finalize.
>>>>> @@ -45,6 +92,7 @@ void ttm_resource_cursor_fini_locked(struct
>>>>> ttm_resource_cursor *cursor)
>>>>>     {
>>>>>     	lockdep_assert_held(&cursor->man->bdev->lru_lock);
>>>>>     	list_del_init(&cursor->hitch.link);
>>>>> +	ttm_resource_cursor_clear_bulk(cursor);
>>>>>     }
>>>>>     
>>>>>     /**
>>>>> @@ -73,9 +121,27 @@ void ttm_resource_cursor_fini(struct
>>>>> ttm_resource_cursor *cursor)
>>>>>     void ttm_lru_bulk_move_init(struct ttm_lru_bulk_move *bulk)
>>>>>     {
>>>>>     	memset(bulk, 0, sizeof(*bulk));
>>>>> +	INIT_LIST_HEAD(&bulk->cursor_list);
>>>>>     }
>>>>>     EXPORT_SYMBOL(ttm_lru_bulk_move_init);
>>>>>     
>>>>> +/**
>>>>> + * ttm_lru_bulk_move_fini - finalize a bulk move structure
>>>>> + * @bdev: The struct ttm_device
>>>>> + * @bulk: the structure to finalize
>>>>> + *
>>>>> + * Sanity checks that bulk moves don't have any
>>>>> + * resources left and hence no cursors attached.
>>>>> + */
>>>>> +void ttm_lru_bulk_move_fini(struct ttm_device *bdev,
>>>>> +			    struct ttm_lru_bulk_move *bulk)
>>>>> +{
>>>>> +	spin_lock(&bdev->lru_lock);
>>>>> +	ttm_bulk_move_drop_cursors(bulk);
>>>>> +	spin_unlock(&bdev->lru_lock);
>>>>> +}
>>>>> +EXPORT_SYMBOL(ttm_lru_bulk_move_fini);
>>>>> +
>>>>>     /**
>>>>>      * ttm_lru_bulk_move_tail - bulk move range of resources to
>>>>> the
>>>>> LRU tail.
>>>>>      *
>>>>> @@ -88,6 +154,7 @@ void ttm_lru_bulk_move_tail(struct
>>>>> ttm_lru_bulk_move *bulk)
>>>>>     {
>>>>>     	unsigned i, j;
>>>>>     
>>>>> +	ttm_bulk_move_adjust_cursors(bulk);
>>>>>     	for (i = 0; i < TTM_NUM_MEM_TYPES; ++i) {
>>>>>     		for (j = 0; j < TTM_MAX_BO_PRIORITY; ++j) {
>>>>>     			struct ttm_lru_bulk_move_pos *pos =
>>>>> &bulk-
>>>>>> pos[i][j];
>>>>> @@ -515,6 +582,28 @@ void ttm_resource_manager_debug(struct
>>>>> ttm_resource_manager *man,
>>>>>     }
>>>>>     EXPORT_SYMBOL(ttm_resource_manager_debug);
>>>>>     
>>>>> +static void
>>>>> +ttm_resource_cursor_check_bulk(struct ttm_resource_cursor
>>>>> *cursor,
>>>>> +			       struct ttm_lru_item *next_lru)
>>>>> +{
>>>>> +	struct ttm_resource *next =
>>>>> ttm_lru_item_to_res(next_lru);
>>>>> +	struct ttm_lru_bulk_move *bulk = NULL;
>>>>> +	struct ttm_buffer_object *bo = next->bo;
>>>>> +
>>>>> +	lockdep_assert_held(&cursor->man->bdev->lru_lock);
>>>>> +	bulk = bo->bulk_move;
>>>>> +
>>>>> +	if (cursor->bulk != bulk) {
>>>>> +		if (bulk) {
>>>>> +			list_move_tail(&cursor->bulk_link,
>>>>> &bulk-
>>>>>> cursor_list);
>>>>> +			cursor->mem_type = next->mem_type;
>>>>> +		} else {
>>>>> +			list_del_init(&cursor->bulk_link);
>>>>> +		}
>>>>> +		cursor->bulk = bulk;
>>>>> +	}
>>>>> +}
>>>>> +
>>>>>     /**
>>>>>      * ttm_resource_manager_first() - Start iterating over the
>>>>> resources
>>>>>      * of a resource manager
>>>>> @@ -535,6 +624,7 @@ ttm_resource_manager_first(struct
>>>>> ttm_resource_manager *man,
>>>>>     	cursor->priority = 0;
>>>>>     	cursor->man = man;
>>>>>     	ttm_lru_item_init(&cursor->hitch, TTM_LRU_HITCH);
>>>>> +	INIT_LIST_HEAD(&cursor->bulk_link);
>>>>>     	list_add(&cursor->hitch.link, &man->lru[cursor-
>>>>>> priority]);
>>>>>     
>>>>>     	return ttm_resource_manager_next(cursor);
>>>>> @@ -559,6 +649,7 @@ ttm_resource_manager_next(struct
>>>>> ttm_resource_cursor *cursor)
>>>>>     		lru = &cursor->hitch;
>>>>>     		list_for_each_entry_continue(lru, &man-
>>>>>> lru[cursor->priority], link) {
>>>>>     			if (ttm_lru_item_is_res(lru)) {
>>>>> +				ttm_resource_cursor_check_bulk
>>>>> (cur
>>>>> sor, lru);
>>>>>     				list_move(&cursor->hitch.link,
>>>>> &lru->link);
>>>>>     				return
>>>>> ttm_lru_item_to_res(lru);
>>>>>     			}
>>>>> @@ -568,6 +659,7 @@ ttm_resource_manager_next(struct
>>>>> ttm_resource_cursor *cursor)
>>>>>     			break;
>>>>>     
>>>>>     		list_move(&cursor->hitch.link, &man-
>>>>>> lru[cursor-
>>>>>> priority]);
>>>>> +		ttm_resource_cursor_clear_bulk(cursor);
>>>>>     	}
>>>>>     
>>>>>     	ttm_resource_cursor_fini_locked(cursor);
>>>>> diff --git a/drivers/gpu/drm/xe/xe_vm.c
>>>>> b/drivers/gpu/drm/xe/xe_vm.c
>>>>> index 5b166fa03684..0c7e327bc9a2 100644
>>>>> --- a/drivers/gpu/drm/xe/xe_vm.c
>>>>> +++ b/drivers/gpu/drm/xe/xe_vm.c
>>>>> @@ -1335,6 +1335,8 @@ struct xe_vm *xe_vm_create(struct
>>>>> xe_device
>>>>> *xe, u32 flags)
>>>>>     
>>>>>     	INIT_WORK(&vm->destroy_work, vm_destroy_work_func);
>>>>>     
>>>>> +	ttm_lru_bulk_move_init(&vm->lru_bulk_move);
>>>>> +
>>>>>     	INIT_LIST_HEAD(&vm->preempt.exec_queues);
>>>>>     	vm->preempt.min_run_period_ms = 10;	/* FIXME: Wire
>>>>> up
>>>>> to uAPI */
>>>>>     
>>>>> @@ -1458,6 +1460,7 @@ struct xe_vm *xe_vm_create(struct
>>>>> xe_device
>>>>> *xe, u32 flags)
>>>>>     	mutex_destroy(&vm->snap_mutex);
>>>>>     	for_each_tile(tile, xe, id)
>>>>>     		xe_range_fence_tree_fini(&vm->rftree[id]);
>>>>> +	ttm_lru_bulk_move_fini(&xe->ttm, &vm->lru_bulk_move);
>>>>>     	kfree(vm);
>>>>>     	if (flags & XE_VM_FLAG_LR_MODE)
>>>>>     		xe_pm_runtime_put(xe);
>>>>> @@ -1601,6 +1604,7 @@ static void vm_destroy_work_func(struct
>>>>> work_struct *w)
>>>>>     		XE_WARN_ON(vm->pt_root[id]);
>>>>>     
>>>>>     	trace_xe_vm_free(vm);
>>>>> +	ttm_lru_bulk_move_fini(&xe->ttm, &vm->lru_bulk_move);
>>>>>     	kfree(vm);
>>>>>     }
>>>>>     
>>>>> diff --git a/include/drm/ttm/ttm_resource.h
>>>>> b/include/drm/ttm/ttm_resource.h
>>>>> index 8fac781f641e..571abb4861a6 100644
>>>>> --- a/include/drm/ttm/ttm_resource.h
>>>>> +++ b/include/drm/ttm/ttm_resource.h
>>>>> @@ -269,26 +269,6 @@ ttm_lru_item_to_res(struct ttm_lru_item
>>>>> *item)
>>>>>     	return container_of(item, struct ttm_resource, lru);
>>>>>     }
>>>>>     
>>>>> -/**
>>>>> - * struct ttm_resource_cursor
>>>>> - *
>>>>> - * @man: The resource manager currently being iterated over.
>>>>> - * @hitch: A hitch list node inserted before the next resource
>>>>> - * to iterate over.
>>>>> - * @priority: the current priority
>>>>> - *
>>>>> - * Cursor to iterate over the resources in a manager.
>>>>> - */
>>>>> -struct ttm_resource_cursor {
>>>>> -	struct ttm_resource_manager *man;
>>>>> -	struct ttm_lru_item hitch;
>>>>> -	unsigned int priority;
>>>>> -};
>>>>> -
>>>>> -void ttm_resource_cursor_fini_locked(struct
>>>>> ttm_resource_cursor
>>>>> *cursor);
>>>>> -
>>>>> -void ttm_resource_cursor_fini(struct ttm_resource_cursor
>>>>> *cursor);
>>>>> -
>>>>>     /**
>>>>>      * struct ttm_lru_bulk_move_pos
>>>>>      *
>>>>> @@ -304,8 +284,9 @@ struct ttm_lru_bulk_move_pos {
>>>>>     
>>>>>     /**
>>>>>      * struct ttm_lru_bulk_move
>>>>> - *
>>>>>      * @pos: first/last lru entry for resources in the each
>>>>> domain/priority
>>>>> + * @cursor_list: The list of cursors currently traversing any
>>>>> of
>>>>> + * the sublists of @pos. Protected by the ttm device's
>>>>> lru_lock.
>>>>>      *
>>>>>      * Container for the current bulk move state. Should be used
>>>>> with
>>>>>      * ttm_lru_bulk_move_init() and ttm_bo_set_bulk_move().
>>>>> @@ -315,8 +296,39 @@ struct ttm_lru_bulk_move_pos {
>>>>>      */
>>>>>     struct ttm_lru_bulk_move {
>>>>>     	struct ttm_lru_bulk_move_pos
>>>>> pos[TTM_NUM_MEM_TYPES][TTM_MAX_BO_PRIORITY];
>>>>> +	struct list_head cursor_list;
>>>>>     };
>>>>>     
>>>>> +/**
>>>>> + * struct ttm_resource_cursor
>>>>> + * @man: The resource manager currently being iterated over
>>>>> + * @hitch: A hitch list node inserted before the next resource
>>>>> + * to iterate over.
>>>>> + * @bulk_link: A list link for the list of cursors traversing
>>>>> the
>>>>> + * bulk sublist of @bulk. Protected by the ttm device's
>>>>> lru_lock.
>>>>> + * @bulk: Pointer to struct ttm_lru_bulk_move whose subrange
>>>>> @hitch is
>>>>> + * inserted to. NULL if none. Never dereference this pointer
>>>>> since
>>>>> + * the struct ttm_lru_bulk_move object pointed to might have
>>>>> been
>>>>> + * freed. The pointer is only for comparison.
>>>>> + * @mem_type: The memory type of the LRU list being traversed.
>>>>> + * This field is valid iff @bulk != NULL.
>>>>> + * @priority: the current priority
>>>>> + *
>>>>> + * Cursor to iterate over the resources in a manager.
>>>>> + */
>>>>> +struct ttm_resource_cursor {
>>>>> +	struct ttm_resource_manager *man;
>>>>> +	struct ttm_lru_item hitch;
>>>>> +	struct list_head bulk_link;
>>>>> +	struct ttm_lru_bulk_move *bulk;
>>>>> +	unsigned int mem_type;
>>>>> +	unsigned int priority;
>>>>> +};
>>>>> +
>>>>> +void ttm_resource_cursor_fini_locked(struct
>>>>> ttm_resource_cursor
>>>>> *cursor);
>>>>> +
>>>>> +void ttm_resource_cursor_fini(struct ttm_resource_cursor
>>>>> *cursor);
>>>>> +
>>>>>     /**
>>>>>      * struct ttm_kmap_iter_iomap - Specialization for a struct
>>>>> io_mapping +
>>>>>      * struct sg_table backed struct ttm_resource.
>>>>> @@ -405,6 +417,8 @@ ttm_resource_manager_cleanup(struct
>>>>> ttm_resource_manager *man)
>>>>>     
>>>>>     void ttm_lru_bulk_move_init(struct ttm_lru_bulk_move *bulk);
>>>>>     void ttm_lru_bulk_move_tail(struct ttm_lru_bulk_move *bulk);
>>>>> +void ttm_lru_bulk_move_fini(struct ttm_device *bdev,
>>>>> +			    struct ttm_lru_bulk_move *bulk);
>>>>>     
>>>>>     void ttm_resource_add_bulk_move(struct ttm_resource *res,
>>>>>     				struct ttm_buffer_object *bo);

