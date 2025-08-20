Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DE0ACB2DD17
	for <lists+dri-devel@lfdr.de>; Wed, 20 Aug 2025 14:57:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D71ED10E25F;
	Wed, 20 Aug 2025 12:57:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="xpmCCTWa";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2071.outbound.protection.outlook.com [40.107.237.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 73EA310E25F;
 Wed, 20 Aug 2025 12:56:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=G1X/ik3izdgkHU6eruBQ31NX8QvAUWWywztgcHSPLqj8xMoIliQOP3I+z+T3OUN23OyUqfrsrzvJTyqPbZ8r/ZR5J5Hqy9LA/XLGmm9PXpNyuEIy04eO0pDIa4Y8SRZc5UsBxUexorMYeUTzdM94+A+2TiGmXBTrZw2CfQbC0RDCxRr89DsCtzxEysZsPCIzYv5x6QrO++WGOY8WYjOXh3/Ak+fKlUUDAwQ4+EJLHWFZGaHcor20x89nIx+ynXzA6873MTN0TpcBQgbX6KH5wOTSe9H/GWq2AdFPRN2Dk7R2ePU9pdsm+iTVEKzABFDQYsHHZzsgd8LRJVVDUXTAFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=T6i/JzjWGNyufqtvaBI5DsZmZ09Bq8Q0Me8NY2A6l88=;
 b=GtK6DHnbVvX56tmz+ChoMB+pspkSzYfxA+jCKJG7woqStUumXl0a6a6ufAiozxHEsC4sNlOuHZTgZaxZB/8Dfgs3K9ysh/cdZ/aVNOVK5zg+owhKujd/HjT1+mx8uCM+n8KX7I8Iq6ZpOReyKg/EKwGP5ADOzExb53Sm3CB13BuU0MEmomYAjk48cc5WuUNxgukJLUF+y6aBQN7QE/xy9bb7iISmJ5TAtxpcn7lcHXYLV5tKKrUlu9cwyRRDtxV39V4uL94m/iw+s2oW47VzTWjK6b673/Z2ESsfFIyVVXlxROgSaUItEcctApQ93pHtAkDwjYtJYTOi+nEFyqUEYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T6i/JzjWGNyufqtvaBI5DsZmZ09Bq8Q0Me8NY2A6l88=;
 b=xpmCCTWa0lGWZQSzLkuqZoGyXLYuRvIL/4Z+6VJhrio3VPUyGRB0nIQKeWMSHKe3jKZe/TWvi6GKEqwcJWXFL0QOrHbaxdjTYnPUzPOdzXCSibwhcNxn8j0aHYq/YEBLoiS9dH0XnThsyD4XvAFdUPmbKFq6jGHPCbpyDhfkqGE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH8PR12MB7301.namprd12.prod.outlook.com (2603:10b6:510:222::12)
 by SA1PR12MB8120.namprd12.prod.outlook.com (2603:10b6:806:331::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.14; Wed, 20 Aug
 2025 12:56:56 +0000
Received: from PH8PR12MB7301.namprd12.prod.outlook.com
 ([fe80::a929:e8eb:ef22:6350]) by PH8PR12MB7301.namprd12.prod.outlook.com
 ([fe80::a929:e8eb:ef22:6350%6]) with mapi id 15.20.9031.023; Wed, 20 Aug 2025
 12:56:56 +0000
Message-ID: <46e7434e-15c7-437f-9b9e-6959f14025ca@amd.com>
Date: Wed, 20 Aug 2025 18:26:44 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] drm/buddy: Separate clear and dirty free block
 trees
Content-Language: en-US
To: Matthew Auld <matthew.auld@intel.com>, christian.koenig@amd.com,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
Cc: alexander.deucher@amd.com
References: <20250724104640.2319-1-Arunpravin.PaneerSelvam@amd.com>
 <20250724104640.2319-2-Arunpravin.PaneerSelvam@amd.com>
 <50c7331b-b945-4465-a7b4-0bf1b7565a96@intel.com>
From: Arunpravin Paneer Selvam <arunpravin.paneerselvam@amd.com>
In-Reply-To: <50c7331b-b945-4465-a7b4-0bf1b7565a96@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BMXPR01CA0080.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:b00:54::20) To PH8PR12MB7301.namprd12.prod.outlook.com
 (2603:10b6:510:222::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB7301:EE_|SA1PR12MB8120:EE_
X-MS-Office365-Filtering-Correlation-Id: 15e8a1f8-5079-4c1e-fcd5-08dddfe90ab1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?aWpVYXNwMXdVTGRGd01yWjduMlpoNFB2Q2djeTZPbUprQlVwdGpNVUd1Nzhp?=
 =?utf-8?B?eDFWWVl4TS9RWEpTVEVGVldDWG1EZmVGemltZ0RFa2krNzhLcGw4NCtaVGJI?=
 =?utf-8?B?MUhZcUVjRU0xZE9IVWJyUHozZWg0b09Gc1N4RkxTblFCYlFHTTNuRXd3UEto?=
 =?utf-8?B?Q3NLQ1h6WFJsZXVROGdBaHd3ZUp6Q1JtUjF5dEVCQlM0VUNZd3haN2k5elFh?=
 =?utf-8?B?bG5vYlR4Q09MdFV1QTc0VnIzQlNPdksrWDdNRld5Q0gwcEErYlZaNG9LSEgv?=
 =?utf-8?B?T2pYQmhIMHNtRkNpMnZEWGRodXBRekpGem5aR0VKaldyWlk5V1hWc1Y3Sk5s?=
 =?utf-8?B?RVdZSlplelp0M1VHNXM0U2ZZNUlKRTEyd2MxN1I5WVpFOTc5LzRMdzA0S3hU?=
 =?utf-8?B?Qk55blJHZjB5WUlnYUYyRXdHMG5jaFBGV3BoTUpnYWdSQnNwamVtZ1lMTHl1?=
 =?utf-8?B?OC9jcWMxRHJKa1lDcFZMNElQV0tmd3cvTnB4ZE9uRjJWak8vall3dnkzUmV4?=
 =?utf-8?B?c2R6STR3bDVCbnR5VGwra2NvazZGK1RGQWdoa29WQUtaRUZiZDhUaUhGenNF?=
 =?utf-8?B?bUkvVEN5UHlwTHVSN21Uc2hBTzJpTVBmYnNERWZlU0dWNUkyNUwwL1NXSG1H?=
 =?utf-8?B?WVUxZlJhdmRFZ29EMnJWQ2ErdGZFRkMwMW5Obm1rRmxiSks2ZjEyQ3RTMTRn?=
 =?utf-8?B?WDJlbkN3c051K3NlcFVjUEQ3SUdLNS83NXZEUXo0WXQ4dzhXZEUweE5TQzhE?=
 =?utf-8?B?OEhsS2Q3OTJTQ00wU2NldlpjUXFrZElkUmVMRzdEM2hwSXZYemNBNmhkdzds?=
 =?utf-8?B?UzVidzgweFRtOU5PellOaldtZWpkeW4zUFFHS1RsNzMzUDhDaTg1T0R6eUdT?=
 =?utf-8?B?TUFzN0ZuNnlXV3djSkh5cjU3eC8zOEMvYndGSEVhRUwxcC9wZ0U1QndKbmFO?=
 =?utf-8?B?WmJqWHh6dHpDMHlZeXpDWXpWb05hek9zV0xOK0xtSUNmOG0vd3BEc2lUUnVB?=
 =?utf-8?B?Tml2VjAyU0t3VUUvb3VZK3FiU3hoMU1wNFhudmd2S0lrN3lVV0k2VFE5M3kv?=
 =?utf-8?B?U3dKOFhxZDFIVGNxckRzYkVnOGlScndPNVhodmJMR1NER0NnbEcycWxBVHZW?=
 =?utf-8?B?amk3dEsyOWhwYzZFSnFSZnNJTGZRYnZxeTJVZlQ0d0huTkZJaHN4T3EvSUNK?=
 =?utf-8?B?ejZiM056bWVjdHJvRThGNUFZNGtwUlZrU0FkUkwxMGF0OXFUVHJSc2lvb0Vz?=
 =?utf-8?B?cG5WY244TytkczI5ZjJMYStvN2R1eDgrTHF4SGRzbmd0U2dKUG5qYkptMGpi?=
 =?utf-8?B?blQ2RWZXRXE1N25rZ1VEY1ZhZ3UvUHJXTDdlbFdsZmhKeHAzOCtneU53cmgr?=
 =?utf-8?B?MC83YmxubXNxMFZhMHViQk9XKzNYNUJxTytmMG1mNGdvTk5kK0dJT3cwSi9W?=
 =?utf-8?B?NWNxcUh5aEE1djh1WlJOeVJGNUVEUjZoZWtod3BvQ0N4bXZSc1hwclU0cjJp?=
 =?utf-8?B?SFNBcjZJSWJHem5Gd3ltZzNiNU5kNFo4RXNFenpPWWVPZnV5VFR3aTFkWXVF?=
 =?utf-8?B?d2hlMWFGODRrN3FGNFptQjNKTnBibGhaSjBRb2FmZW8wKzM5elphY2w0SUVF?=
 =?utf-8?B?L0VBZmdnZ1NvNXFUTFlpT0I2QWhKTW4xSEF4Wjk3VDlRYmhrZStjMG92RDhv?=
 =?utf-8?B?RndzbUlKMlJPbjhMUDhhNTRtUlpQNVdITDZwYnpZTkRhUDBsR2JnWWlLeVJG?=
 =?utf-8?B?eFU1d2c4aVRLd3VycXhjRFd4OHljNmFWUUt4Z01FMnBrVTR2ZWhpb1BMYmlL?=
 =?utf-8?B?VWN1RVZ0clA5NEhpQ2hMZ3hpM3dZZWJLQm14RWM3STJwMkxWQVlDRERoVGdL?=
 =?utf-8?B?MlprRFlEWEt0YjZiT0h5bUJtOXRoTzVUNGpYTG1XZkUwWXplMXZSMnU2WDdT?=
 =?utf-8?Q?MxOD+D6hdaM=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR12MB7301.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?M2NMN2lkWnJzM0FKNTBQQitkQnVSQWlZc2ViZkJNVVNyVUVxcFNGNkt5bmFz?=
 =?utf-8?B?ZFhScDdrVjZNN2MwWVZXbFVYZ05CTllJUGVMTEhaQmZlNG11WHE3QlFxRTNZ?=
 =?utf-8?B?TXp3NGdRZTVYWUNHbWlMZlhYcHdrU0srK0RXSlBEQk90V0Z0OWVPZkNIUlV3?=
 =?utf-8?B?SzExR0QrOGJZQkRZMWU3UFFHUUE5RTNFdHV4aXEyVWk4ZjQ3dHBmLzdCelNw?=
 =?utf-8?B?eU9TNmpqYWl5TkJHYzJzbHE1NG8zYUF1SmFqUUE4R1ZyWlRoaUVjbEEyTndB?=
 =?utf-8?B?UmtrTlR1akp4VlpYMWJvLy9JajN4S1BCVlloUE1iYUwza3NqNUJXSXpjNXlC?=
 =?utf-8?B?aG5UTVJOVWoweHhvRU5WbDRqZEVmbW9KR0QwQ2xmQWJ2b2duNFRxZExsU0Mr?=
 =?utf-8?B?Q1h4b25NeFVUZVh5UEtwbk5kT3JJRDBYRGF2bHNpMGIvL0IrbmZjeTk4Mkwx?=
 =?utf-8?B?aW9MUXkrR2U3eGNXRk0vbnI5Ui9zRjhYVXJqbGxkYlk4NHRwVEg0TitvbTla?=
 =?utf-8?B?OGErajB2REtNT1NTaWRzQ1JwMG9xVTZ0Y1drQVJnUWVGb0Jydi8yQlFEOTF2?=
 =?utf-8?B?emVVaFZ6Y0Z1cTMzSEhDbTdLNjNPTWFwcTY2eEMwWUJXU1VkZmVZU1BzRmFM?=
 =?utf-8?B?eVNRWGhJS3BXQXUzQ1N3aVNzM1ByKzQvZ25ha2FQM1pMNklUQkt5WUVSdHFT?=
 =?utf-8?B?TXVYcEdGeXYwd0FDWGhzODNzMUowSUU5WkRzU2puNGFHVG9xdCtjQ1FsVFNS?=
 =?utf-8?B?N3RsMm5XTFM4NkpIOTFoaTd1QmNJMGpaM2VBMCtnYnNTbmdKUTEwODc0ZHp4?=
 =?utf-8?B?Q2ZieEpiMUJRK3ZuZmhycUREUmx6VzN3QjR0U2pxaG91QjNkUWUyR3dKcFdF?=
 =?utf-8?B?ZFp0WTRRNDVxWDUzRDFsOWsvRU4zUHMwZXpWblQ5R0w2UlBGVFRkSy9CYjVO?=
 =?utf-8?B?bjhkRmNFcnBEd1dNUlU2bGRKck43NUErTHNnQU9HY3gzbWZqU053Unh2cFdU?=
 =?utf-8?B?K2pLdE8vQWdMaTgzZmpwZkdBeCt3VzF5M1JQYU1KUHplNC9LNmc1b1VkUkdk?=
 =?utf-8?B?N2dFSTlqd1NSbmRDRUIzN1pucW9TcnJMOTNJS2FDcjV4QlBZRm9qemErTlhE?=
 =?utf-8?B?MjF1dlZNVTIwdTlKVDFraFFhU2VkWm9EV2dRR2oraFBid1lGM3ZwUzk2d0dT?=
 =?utf-8?B?VHJ2ams3UVhyMzhHUVgwcjFud2o1NHIxODJIam94MXliK3VuWjRSRENNd1p3?=
 =?utf-8?B?N2djR0lxZlhZczluNmROT0cyZ1NFSG15cXk3c2llaXloSnNpZ0xLU3ppa1V2?=
 =?utf-8?B?L2cweHkyVnlKWFB6RUF0VkhjdEJqTmNZZllnMkdZQWZLZ0pFcnJXM2JGeWpR?=
 =?utf-8?B?TElaSW5OWDcydURLOGVMQnBCaXloQmdpWUtqWE0xOWZGc29EQUMrR1ZaTXI0?=
 =?utf-8?B?RlN2cm9OdDNGOWZHVDVvQXdzSmpSMUk1dWs2WXdGNkpMaG1QbFZldzdUTW5X?=
 =?utf-8?B?UlFWeXpvM1diVGpCZWU5bWVHVmZjaTFSMVBZckR1bUVBRmxxVGFySlFVL1BZ?=
 =?utf-8?B?YjlBOVB1alhUdG9pSVdYQW8wZU1ZS3JERTVoME1XMU5Rb2Mxb1ZIWGpOeVlt?=
 =?utf-8?B?ZDk2U0tOQXRvc3cyTFQ0eGFWVHFOT2d5VjJBMVJHZFJIMkdZaGZiNGpHQmVl?=
 =?utf-8?B?a2ExK1VQRDMwMUtYVUJ1ZjBJTENHeHM3eXBrWElMMXRYdWRiZ3ovRVF5R2Ja?=
 =?utf-8?B?QUdoaEJsUFNXTkpiRjE3azJjUFZ0MkgrdEZFTDVPTEI1TXlzOFBaVEUrU3Vj?=
 =?utf-8?B?MDY0QmptOUVVY3VWaWxHMGx0N3VMVklvK1YxenMrSHo1elV3anhrMEhGcEhO?=
 =?utf-8?B?NE5FZVUvaitGaUMzMCtZUWI3VDUwMGFWaEMzenhMT1J0bmRxVkx0Z1hPelVI?=
 =?utf-8?B?VFJ1RGxiUi9jSW9YS3N5c29TNnZQZjJoRWdTbk1Ub2xCbk5uNnNWWk5xNzk2?=
 =?utf-8?B?YVN6VUQ4UXk5c0VxVkFpREFMSEdoOU5iZkYxYlJqcmdUdDVuZk9BdXVhMldH?=
 =?utf-8?B?bnIvQk1CTzFrUnhTTXNEL0Nqdi9ic2pxSkFWKzhCM3M5d2JrQUtzeGtvOEZ5?=
 =?utf-8?Q?qMGel2rzjrsdAbh010qDl6NZm?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 15e8a1f8-5079-4c1e-fcd5-08dddfe90ab1
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB7301.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Aug 2025 12:56:56.0176 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PqHqPpU8SYPzxGMAUkJmhPH0i/OsL2hNgJOOQ1KQzzx4sBCWYfuvkD2Zp7VnO0IlkMdYT9gnvL5fL1BAKrAihg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB8120
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

Hi Matthew,

On 8/14/2025 4:41 PM, Matthew Auld wrote:
> On 24/07/2025 11:46, Arunpravin Paneer Selvam wrote:
>> Maintain two separate RB trees per order - one for clear (zeroed) blocks
>> and another for dirty (uncleared) blocks. This separation improves
>> code clarity and makes it more obvious which tree is being searched
>> during allocation. It also improves scalability and efficiency when
>> searching for a specific type of block, avoiding unnecessary checks
>> and making the allocator more predictable under fragmentation.
>>
>> The changes have been validated using the existing drm_buddy_test
>> KUnit test cases, along with selected graphics workloads,
>> to ensure correctness and avoid regressions.
>>
>> v2: Missed adding the suggested-by tag. Added it in v2.
>>
>> Signed-off-by: Arunpravin Paneer Selvam 
>> <Arunpravin.PaneerSelvam@amd.com>
>> Suggested-by: Matthew Auld <matthew.auld@intel.com>
>> ---
>>   drivers/gpu/drm/drm_buddy.c | 316 ++++++++++++++++++++++--------------
>>   include/drm/drm_buddy.h     |  15 +-
>>   2 files changed, 204 insertions(+), 127 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/drm_buddy.c b/drivers/gpu/drm/drm_buddy.c
>> index 19e9773b41be..0ffb68474b83 100644
>> --- a/drivers/gpu/drm/drm_buddy.c
>> +++ b/drivers/gpu/drm/drm_buddy.c
>> @@ -43,27 +43,84 @@ static void drm_block_free(struct drm_buddy *mm,
>>       kmem_cache_free(slab_blocks, block);
>>   }
>>   +static inline struct rb_root *
>> +__get_root(struct drm_buddy *mm,
>> +       unsigned int order,
>> +       enum free_tree tree)
>> +{
>> +    if (tree == CLEAR_TREE)
>> +        return &mm->clear_tree[order];
>> +    else
>> +        return &mm->dirty_tree[order];
>> +}
>> +
>> +static inline enum free_tree
>> +__get_tree_for_block(struct drm_buddy_block *block)
>> +{
>> +    return drm_buddy_block_is_clear(block) ? CLEAR_TREE : DIRTY_TREE;
>> +}
>> +
>> +static inline enum free_tree
>> +__get_tree_for_flags(unsigned long flags)
>
> Do we need all these double underscores?
Not required, we can remove it.
>
>> +{
>> +    return (flags & DRM_BUDDY_CLEAR_ALLOCATION) ? CLEAR_TREE : 
>> DIRTY_TREE;
>> +}
>> +
>> +static inline struct drm_buddy_block *
>> +rbtree_get_entry(struct rb_node *node)
>> +{
>> +    return node ? rb_entry(node, struct drm_buddy_block, rb) : NULL;
>> +}
>> +
>> +static inline struct drm_buddy_block *
>> +rbtree_prev_entry(struct rb_node *node)
>> +{
>> +    return rbtree_get_entry(rb_prev(node));
>> +}
>> +
>> +static inline struct drm_buddy_block *
>> +rbtree_first_entry(struct rb_root *root)
>> +{
>> +    return rbtree_get_entry(rb_first(root));
>> +}
>> +
>> +static inline struct drm_buddy_block *
>> +rbtree_last_entry(struct rb_root *root)
>> +{
>> +    return rbtree_get_entry(rb_last(root));
>> +}
>> +
>> +static inline bool rbtree_is_empty(struct rb_root *root)
>> +{
>> +    return RB_EMPTY_ROOT(root);
>> +}
>
> Just wondering if these should have less generic names?
>
> rb_tree_first_free_block()
> rb_tree_last_free_block()
> ...
Yes, I will modify to have less generic names.
>
>> +
>>   static void rbtree_insert(struct drm_buddy *mm,
>> -              struct drm_buddy_block *block)
>> +              struct drm_buddy_block *block,
>> +              enum free_tree tree)
>>   {
>> -    struct rb_root *root = 
>> &mm->free_tree[drm_buddy_block_order(block)];
>> -    struct rb_node **link = &root->rb_node;
>> -    struct rb_node *parent = NULL;
>> +    struct rb_node **link, *parent = NULL;
>>       struct drm_buddy_block *node;
>> -    u64 offset;
>> +    struct rb_root *root;
>> +    unsigned int order;
>> +
>> +    order = drm_buddy_block_order(block);
>>   -    offset = drm_buddy_block_offset(block);
>> +    root = __get_root(mm, order, tree);
>> +    link = &root->rb_node;
>>         while (*link) {
>>           parent = *link;
>> -        node = rb_entry(parent, struct drm_buddy_block, rb);
>> +        node = rbtree_get_entry(parent);
>>   -        if (offset < drm_buddy_block_offset(node))
>> +        if (drm_buddy_block_offset(block) < 
>> drm_buddy_block_offset(node))
>>               link = &parent->rb_left;
>>           else
>>               link = &parent->rb_right;
>>       }
>>   +    block->tree = tree;
>> +
>>       rb_link_node(&block->rb, parent, link);
>>       rb_insert_color(&block->rb, root);
>>   }
>> @@ -71,27 +128,15 @@ static void rbtree_insert(struct drm_buddy *mm,
>>   static void rbtree_remove(struct drm_buddy *mm,
>>                 struct drm_buddy_block *block)
>>   {
>> +    unsigned int order = drm_buddy_block_order(block);
>>       struct rb_root *root;
>>   -    root = &mm->free_tree[drm_buddy_block_order(block)];
>> +    root = __get_root(mm, order, block->tree);
>>       rb_erase(&block->rb, root);
>>         RB_CLEAR_NODE(&block->rb);
>>   }
>>   -static inline struct drm_buddy_block *
>> -rbtree_last_entry(struct drm_buddy *mm, unsigned int order)
>> -{
>> -    struct rb_node *node = rb_last(&mm->free_tree[order]);
>> -
>> -    return node ? rb_entry(node, struct drm_buddy_block, rb) : NULL;
>> -}
>> -
>> -static bool rbtree_is_empty(struct drm_buddy *mm, unsigned int order)
>> -{
>> -    return RB_EMPTY_ROOT(&mm->free_tree[order]);
>> -}
>> -
>>   static void clear_reset(struct drm_buddy_block *block)
>>   {
>>       block->header &= ~DRM_BUDDY_HEADER_CLEAR;
>> @@ -114,10 +159,14 @@ static void mark_allocated(struct drm_buddy *mm,
>>   static void mark_free(struct drm_buddy *mm,
>>                 struct drm_buddy_block *block)
>>   {
>> +    enum free_tree tree;
>> +
>>       block->header &= ~DRM_BUDDY_HEADER_STATE;
>>       block->header |= DRM_BUDDY_FREE;
>>   -    rbtree_insert(mm, block);
>> +    tree = __get_tree_for_block(block);
>> +
>> +    rbtree_insert(mm, block, tree);
>>   }
>>     static void mark_split(struct drm_buddy *mm,
>> @@ -212,53 +261,52 @@ static int __force_merge(struct drm_buddy *mm,
>>       if (min_order > mm->max_order)
>>           return -EINVAL;
>>   -    for (i = min_order - 1; i >= 0; i--) {
>> -        struct drm_buddy_block *block, *prev_block, *first_block;
>> -
>> -        first_block = rb_entry(rb_first(&mm->free_tree[i]), struct 
>> drm_buddy_block, rb);
>> +    for_each_free_tree() {
>> +        for (i = min_order - 1; i >= 0; i--) {
>> +            struct rb_root *root = __get_root(mm, i, tree);
>> +            struct drm_buddy_block *block, *prev_block;
>>   -        for_each_rb_entry_reverse_safe(block, prev_block, 
>> &mm->free_tree[i], rb) {
>> -            struct drm_buddy_block *buddy;
>> -            u64 block_start, block_end;
>> +            for_each_rb_entry_reverse_safe(block, prev_block, root, 
>> rb) {
>> +                struct drm_buddy_block *buddy;
>> +                u64 block_start, block_end;
>>   -            if (RB_EMPTY_NODE(&block->rb))
>> -                break;
>> +                if (RB_EMPTY_NODE(&block->rb))
>> +                    break;
>>   -            if (!block->parent)
>> -                continue;
>> +                if (!block->parent)
>> +                    continue;
>>   -            block_start = drm_buddy_block_offset(block);
>> -            block_end = block_start + drm_buddy_block_size(mm, 
>> block) - 1;
>> +                block_start = drm_buddy_block_offset(block);
>> +                block_end = block_start + drm_buddy_block_size(mm, 
>> block) - 1;
>>   -            if (!contains(start, end, block_start, block_end))
>> -                continue;
>> +                if (!contains(start, end, block_start, block_end))
>> +                    continue;
>>   -            buddy = __get_buddy(block);
>> -            if (!drm_buddy_block_is_free(buddy))
>> -                continue;
>> +                buddy = __get_buddy(block);
>> +                if (!drm_buddy_block_is_free(buddy))
>> +                    continue;
>>   -            WARN_ON(drm_buddy_block_is_clear(block) ==
>> -                drm_buddy_block_is_clear(buddy));
>> +                WARN_ON(drm_buddy_block_is_clear(block) ==
>> +                    drm_buddy_block_is_clear(buddy));
>>   -            /*
>> -             * If the prev block is same as buddy, don't access the
>> -             * block in the next iteration as we would free the
>> -             * buddy block as part of the free function.
>> -             */
>> -            if (prev_block && prev_block == buddy) {
>> -                if (prev_block != first_block)
>> -                    prev_block = rb_entry(rb_prev(&prev_block->rb),
>> -                                  struct drm_buddy_block,
>> -                                  rb);
>> -            }
>> +                /*
>> +                 * If the prev block is same as buddy, don't access the
>> +                 * block in the next iteration as we would free the
>> +                 * buddy block as part of the free function.
>> +                 */
>> +                if (prev_block && prev_block == buddy) {
>> +                    if (prev_block != rbtree_first_entry(root))
>> +                        prev_block = 
>> rbtree_prev_entry(&prev_block->rb);
>> +                }
>>   -            rbtree_remove(mm, block);
>> -            if (drm_buddy_block_is_clear(block))
>> -                mm->clear_avail -= drm_buddy_block_size(mm, block);
>> +                rbtree_remove(mm, block);
>> +                if (drm_buddy_block_is_clear(block))
>> +                    mm->clear_avail -= drm_buddy_block_size(mm, block);
>>   -            order = __drm_buddy_free(mm, block, true);
>> -            if (order >= min_order)
>> -                return 0;
>> +                order = __drm_buddy_free(mm, block, true);
>> +                if (order >= min_order)
>> +                    return 0;
>> +            }
>>           }
>>       }
>>   @@ -301,14 +349,22 @@ int drm_buddy_init(struct drm_buddy *mm, u64 
>> size, u64 chunk_size)
>>         BUG_ON(mm->max_order > DRM_BUDDY_MAX_ORDER);
>>   -    mm->free_tree = kmalloc_array(mm->max_order + 1,
>> -                      sizeof(struct rb_root),
>> -                      GFP_KERNEL);
>> -    if (!mm->free_tree)
>> +    mm->clear_tree = kmalloc_array(mm->max_order + 1,
>> +                       sizeof(struct rb_root),
>> +                       GFP_KERNEL);
>> +    if (!mm->clear_tree)
>> +        return -ENOMEM;
>> +
>> +    mm->dirty_tree = kmalloc_array(mm->max_order + 1,
>> +                       sizeof(struct rb_root),
>> +                       GFP_KERNEL);
>> +    if (!mm->dirty_tree)
>
> goto out_free_tree
>
>>           return -ENOMEM;
>>   -    for (i = 0; i <= mm->max_order; ++i)
>> -        mm->free_tree[i] = RB_ROOT;
>> +    for (i = 0; i <= mm->max_order; ++i) {
>> +        mm->clear_tree[i] = RB_ROOT;
>> +        mm->dirty_tree[i] = RB_ROOT;
>> +    }
>>         mm->n_roots = hweight64(size);
>>   @@ -356,7 +412,8 @@ int drm_buddy_init(struct drm_buddy *mm, u64 
>> size, u64 chunk_size)
>>           drm_block_free(mm, mm->roots[i]);
>>       kfree(mm->roots);
>>   out_free_tree:
>> -    kfree(mm->free_tree);
>> +    kfree(mm->clear_tree);
>> +    kfree(mm->dirty_tree);
>>       return -ENOMEM;
>>   }
>>   EXPORT_SYMBOL(drm_buddy_init);
>> @@ -393,7 +450,8 @@ void drm_buddy_fini(struct drm_buddy *mm)
>>       WARN_ON(mm->avail != mm->size);
>>         kfree(mm->roots);
>> -    kfree(mm->free_tree);
>> +    kfree(mm->clear_tree);
>> +    kfree(mm->dirty_tree);
>>   }
>>   EXPORT_SYMBOL(drm_buddy_fini);
>>   @@ -417,15 +475,15 @@ static int split_block(struct drm_buddy *mm,
>>           return -ENOMEM;
>>       }
>>   -    mark_free(mm, block->left);
>> -    mark_free(mm, block->right);
>> -
>>       if (drm_buddy_block_is_clear(block)) {
>>           mark_cleared(block->left);
>>           mark_cleared(block->right);
>>           clear_reset(block);
>>       }
>>   +    mark_free(mm, block->left);
>> +    mark_free(mm, block->right);
>> +
>>       mark_split(mm, block);
>>         return 0;
>> @@ -632,26 +690,22 @@ __drm_buddy_alloc_range_bias(struct drm_buddy *mm,
>>   }
>>     static struct drm_buddy_block *
>> -get_maxblock(struct drm_buddy *mm, unsigned int order,
>> -         unsigned long flags)
>> +get_maxblock(struct drm_buddy *mm,
>> +         unsigned int order,
>> +         enum free_tree tree)
>>   {
>>       struct drm_buddy_block *max_block = NULL, *block = NULL;
>> +    struct rb_root *root;
>>       unsigned int i;
>>         for (i = order; i <= mm->max_order; ++i) {
>> -        struct drm_buddy_block *tmp_block;
>> -
>> -        for_each_rb_entry_reverse(tmp_block, &mm->free_tree[i], rb) {
>> -            if (block_incompatible(tmp_block, flags))
>> +        root = __get_root(mm, i, tree);
>> +        if (!rbtree_is_empty(root)) {
>> +            block = rbtree_last_entry(root);
>> +            if (!block)
>>                   continue;
>> -
>> -            block = tmp_block;
>> -            break;
>>           }
>>   -        if (!block)
>> -            continue;
>> -
>>           if (!max_block) {
>>               max_block = block;
>>               continue;
>> @@ -672,36 +726,38 @@ alloc_from_freetree(struct drm_buddy *mm,
>>               unsigned long flags)
>>   {
>>       struct drm_buddy_block *block = NULL;
>> +    struct rb_root *root;
>> +    enum free_tree tree;
>>       unsigned int tmp;
>>       int err;
>>   +    tree = __get_tree_for_flags(flags);
>> +
>>       if (flags & DRM_BUDDY_TOPDOWN_ALLOCATION) {
>> -        block = get_maxblock(mm, order, flags);
>> +        block = get_maxblock(mm, order, tree);
>>           if (block)
>>               /* Store the obtained block order */
>>               tmp = drm_buddy_block_order(block);
>>       } else {
>>           for (tmp = order; tmp <= mm->max_order; ++tmp) {
>> -            struct drm_buddy_block *tmp_block;
>> -
>> -            for_each_rb_entry_reverse(tmp_block, 
>> &mm->free_tree[tmp], rb) {
>> -                if (block_incompatible(tmp_block, flags))
>> -                    continue;
>> -
>> -                block = tmp_block;
>> -                break;
>> +            /* Get RB tree root for this order and tree */
>> +            root = __get_root(mm, tmp, tree);
>> +            if (!rbtree_is_empty(root)) {
>> +                block = rbtree_last_entry(root);
>> +                if (block)
>> +                    break;
>>               }
>> -
>> -            if (block)
>> -                break;
>>           }
>>       }
>>         if (!block) {
>> -        /* Fallback method */
>> +        /* Try allocating from the other tree */
>> +        tree = (tree == CLEAR_TREE) ? DIRTY_TREE : CLEAR_TREE;
>> +
>>           for (tmp = order; tmp <= mm->max_order; ++tmp) {
>> -            if (!rbtree_is_empty(mm, tmp)) {
>> -                block = rbtree_last_entry(mm, tmp);
>> +            root = __get_root(mm, tmp, tree);
>> +            if (!rbtree_is_empty(root)) {
>> +                block = rbtree_last_entry(root);
>>                   if (block)
>>                       break;
>>               }
>> @@ -859,34 +915,39 @@ static int __alloc_contig_try_harder(struct 
>> drm_buddy *mm,
>>       if (order == 0)
>>           return -ENOSPC;
>>   -    if (rbtree_is_empty(mm, order))
>> +    if (rbtree_is_empty(__get_root(mm, order, CLEAR_TREE)) &&
>> +        rbtree_is_empty(__get_root(mm, order, DIRTY_TREE)))
>>           return -ENOSPC;
>>   -    for_each_rb_entry_reverse(block, &mm->free_tree[order], rb) {
>> -        /* Allocate blocks traversing RHS */
>> -        rhs_offset = drm_buddy_block_offset(block);
>> -        err =  __drm_buddy_alloc_range(mm, rhs_offset, size,
>> -                           &filled, blocks);
>> -        if (!err || err != -ENOSPC)
>> -            return err;
>> -
>> -        lhs_size = max((size - filled), min_block_size);
>> -        if (!IS_ALIGNED(lhs_size, min_block_size))
>> -            lhs_size = round_up(lhs_size, min_block_size);
>> -
>> -        /* Allocate blocks traversing LHS */
>> -        lhs_offset = drm_buddy_block_offset(block) - lhs_size;
>> -        err =  __drm_buddy_alloc_range(mm, lhs_offset, lhs_size,
>> -                           NULL, &blocks_lhs);
>> -        if (!err) {
>> -            list_splice(&blocks_lhs, blocks);
>> -            return 0;
>> -        } else if (err != -ENOSPC) {
>> +    for_each_free_tree() {
>> +        struct rb_root *root = __get_root(mm, order, tree);
>> +
>> +        for_each_rb_entry_reverse(block, root, rb) {
>> +            /* Allocate blocks traversing RHS */
>> +            rhs_offset = drm_buddy_block_offset(block);
>> +            err =  __drm_buddy_alloc_range(mm, rhs_offset, size,
>> +                               &filled, blocks);
>> +            if (!err || err != -ENOSPC)
>> +                return err;
>> +
>> +            lhs_size = max((size - filled), min_block_size);
>> +            if (!IS_ALIGNED(lhs_size, min_block_size))
>> +                lhs_size = round_up(lhs_size, min_block_size);
>> +
>> +            /* Allocate blocks traversing LHS */
>> +            lhs_offset = drm_buddy_block_offset(block) - lhs_size;
>> +            err =  __drm_buddy_alloc_range(mm, lhs_offset, lhs_size,
>> +                               NULL, &blocks_lhs);
>> +            if (!err) {
>> +                list_splice(&blocks_lhs, blocks);
>> +                return 0;
>> +            } else if (err != -ENOSPC) {
>> +                drm_buddy_free_list_internal(mm, blocks);
>> +                return err;
>> +            }
>> +            /* Free blocks for the next iteration */
>>               drm_buddy_free_list_internal(mm, blocks);
>> -            return err;
>>           }
>> -        /* Free blocks for the next iteration */
>> -        drm_buddy_free_list_internal(mm, blocks);
>>       }
>>         return -ENOSPC;
>> @@ -1198,11 +1259,16 @@ void drm_buddy_print(struct drm_buddy *mm, 
>> struct drm_printer *p)
>>         for (order = mm->max_order; order >= 0; order--) {
>>           struct drm_buddy_block *block;
>> +        struct rb_root *root;
>>           u64 count = 0, free;
>>   -        for_each_rb_entry(block, &mm->free_tree[order], rb) {
>> -            BUG_ON(!drm_buddy_block_is_free(block));
>> -            count++;
>> +        for_each_free_tree() {
>> +            root = __get_root(mm, order, tree);
>> +
>> +            for_each_rb_entry(block, root, rb) {
>> +                BUG_ON(!drm_buddy_block_is_free(block));
>> +                count++;
>> +            }
>>           }
>>             drm_printf(p, "order-%2d ", order);
>> diff --git a/include/drm/drm_buddy.h b/include/drm/drm_buddy.h
>> index a64d108a33b7..afaf62ee05e1 100644
>> --- a/include/drm/drm_buddy.h
>> +++ b/include/drm/drm_buddy.h
>> @@ -14,6 +14,11 @@
>>     #include <drm/drm_print.h>
>>   +enum free_tree {
>> +    CLEAR_TREE = 0,
>> +    DIRTY_TREE,
>> +};
>> +
>>   #define range_overflows(start, size, max) ({ \
>>       typeof(start) start__ = (start); \
>>       typeof(size) size__ = (size); \
>> @@ -23,6 +28,9 @@
>>       start__ >= max__ || size__ > max__ - start__; \
>>   })
>>   +#define for_each_free_tree() \
>
> I think rather give this an explicit 'tree' argument? Having it hidden 
> is harder to read IMO.
Sure, will add 'tree' argument to the macro.
>
>> +    for (enum free_tree tree = CLEAR_TREE; tree <= DIRTY_TREE; tree++)
>> +
>>   /*
>>    * for_each_rb_entry() - iterate over an RB tree in order
>>    * @pos:    the struct type * to use as a loop cursor
>> @@ -89,9 +97,11 @@ struct drm_buddy_block {
>>        * a list, if so desired. As soon as the block is freed with
>>        * drm_buddy_free* ownership is given back to the mm.
>>        */
>> -    struct rb_node rb;
>>       struct list_head link;
>>       struct list_head tmp_link;
>> +
>> +    enum free_tree tree;
>
> We also have the existing dirty/free bit in the block itself. Would it 
> make sense to re-use that instead, if possible?
Yes, we can re-use the existing dirty/free bit in the block. I will 
remove this field.
>
>> +    struct rb_node rb;
>>   };
>>     /* Order-zero must be at least SZ_4K */
>> @@ -105,7 +115,8 @@ struct drm_buddy_block {
>>    */
>>   struct drm_buddy {
>>       /* Maintain a free list for each order. */
>> -    struct rb_root *free_tree;
>> +    struct rb_root *clear_tree;
>> +    struct rb_root *dirty_tree;
>
> Could potentially make this something like:
>
> struct rb_root free_trees[DIRTY_TREE + 1]
>
> Or define DIRTY_TREE + 1 as the last value in the enum and give it a 
> special name. We can then just use the enum as the index directly, 
> which might be cleaner?

yeah, then we should access the rb_root of a specific order by 
free_trees[tree][order].

Regards,

Arun.

>
>>         /*
>>        * Maintain explicit binary tree(s) to track the allocation of the
>
