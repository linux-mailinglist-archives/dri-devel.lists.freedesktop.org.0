Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6928696EE4A
	for <lists+dri-devel@lfdr.de>; Fri,  6 Sep 2024 10:37:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 262D410E9BD;
	Fri,  6 Sep 2024 08:37:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=vivo.com header.i=@vivo.com header.b="LR9D6mWO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from HK3PR03CU002.outbound.protection.outlook.com
 (mail-eastasiaazon11011012.outbound.protection.outlook.com [52.101.129.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B32DA10E9BD
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Sep 2024 08:37:30 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yb3ZYO9GDuA0KDltOcyp9IubKMUV8MLxYzVtDx7/Pb3HUH9WvmE42Ee8bvCfUCAg9EDrjWPbUa5OOKmaZpim44e9xdIVc+frWwHERcT/o2xbKulXVk/9Y8XgYg66IohS/XKJd8bfmNOCcnlWb9Rw//ayy2fPI1D64JGu5h1swLlh99WANCeyb0IVE53lddhmWnyCtFZvm4edEbIk5lvQhbDUxQXO8qX2tZgOOnhngxwyw2HroNp3/WjFKzgayKHxZ5OcZ5U0sSLzaUUNJ6kB09TJznaAoWaqwKiA3Q/E36VGOaxJ2zgIAIrvNlQacbiQ+DvIkYTtw2sq38Gp7JpoSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7PCHF776DpFWARjwlbvyB8cqCpoKEHmnwWBHim0ww0o=;
 b=NqiA1p1XBQPTZx1m3syyvALokKmjkEC8D8HAJRsQUmSa5mIAdeDEImwCue3mYe1nFpvD+ae2cL5j58De6Qc53Z+CLBIchx6eQ+a4sm4W4VCv0DFH1uoNekUyzM7wOPHAPLaawrSBms13cG4Um3VzdyFzjqtZpQMJ414BFBFVcVs4Em9sCrYaWvYpEzcywnp4HZSInt8m+0DBQro+va5DKCLIqDWd0YbN1D1yQexsbBMwOh97NQC4iFVlc4Wkjx9ut6pi34h2aqq1vXr2+tklpvX1B7dXVDZjMGWcIELHHDuSP4K70NZjp2KF9N+2P/9LsAJ/8KxK/SR/7sezC55O4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7PCHF776DpFWARjwlbvyB8cqCpoKEHmnwWBHim0ww0o=;
 b=LR9D6mWOuOFFye1JZCewydfn+bwuAVeNPBaS6ZrgtIud0To1G+JCeldM8cf7iXfSUzQ4GUO7/p5qo3cM2oY0dtzrTRvFVYuV93SgWH91xYLfW313/qxDmniJBM0diluMyVYvXav2RvJLOFwWvUTBNnUlTtabaci6RKnv8ZAJaFcNz1v/BkaB4x7AdX2PtxEcw73ePDMcWgDYSCFXmDmyTWE8IbddykFff4MBcgygchQtR/c8pk8uQ1u/cykEl2QK+GvAylcbJYJzKUvZGTJRdWc13qlOEWerotfM6q8tz5E8o+bUA6xndn7G15XmbEzuxBDZA7oIr/M2ysY25jPW8w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from PUZPR06MB5676.apcprd06.prod.outlook.com (2603:1096:301:f8::10)
 by TYSPR06MB6501.apcprd06.prod.outlook.com (2603:1096:400:47d::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.28; Fri, 6 Sep
 2024 08:37:23 +0000
Received: from PUZPR06MB5676.apcprd06.prod.outlook.com
 ([fe80::a00b:f422:ac44:636f]) by PUZPR06MB5676.apcprd06.prod.outlook.com
 ([fe80::a00b:f422:ac44:636f%6]) with mapi id 15.20.7939.017; Fri, 6 Sep 2024
 08:37:23 +0000
Message-ID: <55af756d-5002-4534-857b-f3ef3c8e34e6@vivo.com>
Date: Fri, 6 Sep 2024 16:37:18 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/7] udmabuf: pre-fault when first page fault
To: "Kasireddy, Vivek" <vivek.kasireddy@intel.com>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Gerd Hoffmann <kraxel@redhat.com>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linaro-mm-sig@lists.linaro.org" <linaro-mm-sig@lists.linaro.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Cc: "opensource.kernel@vivo.com" <opensource.kernel@vivo.com>
References: <20240903083818.3071759-1-link@vivo.com>
 <20240903083818.3071759-2-link@vivo.com>
 <IA0PR11MB718502273712359BC456893CF89E2@IA0PR11MB7185.namprd11.prod.outlook.com>
From: Huan Yang <link@vivo.com>
In-Reply-To: <IA0PR11MB718502273712359BC456893CF89E2@IA0PR11MB7185.namprd11.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SI2P153CA0008.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:140::19) To PUZPR06MB5676.apcprd06.prod.outlook.com
 (2603:1096:301:f8::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PUZPR06MB5676:EE_|TYSPR06MB6501:EE_
X-MS-Office365-Filtering-Correlation-Id: 88fe3e71-63a1-4869-c29c-08dcce4f20b6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|52116014|1800799024|38350700014; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Rkx3aXlKRVZNQjJMcE1CdmtxWStwbjR6RWJobDFHK0tFNTVDSDBwWXJId29M?=
 =?utf-8?B?MWZsRDR6eGNUYkIzUlduK0tubW1KOHhvQlNNUTBxQkpmVzVhQisydVFOcGxQ?=
 =?utf-8?B?TDdybzhsNmJuOFN1VDBnZzFIMTk1cHIzODJ3WEtqb3Z4dXZweFE5aVEwMklN?=
 =?utf-8?B?UXVBdGJMQXREc01KVW85ZWYyOWlqVmJmUkx0QmZ1ZmwrS1VVTWZmNldRSUR6?=
 =?utf-8?B?RnNCWGZSekR3Q29yN1lwK2ZnMW93UHFjTkJLWFhUdnhLL1JYRFplNjg4VEdm?=
 =?utf-8?B?TFpRamxVemFEZGhORkRxdXVhdWZJWEhSQ285SHpzWjBUbTBZdGRyRXJwck44?=
 =?utf-8?B?NmdnMFc5MkVQdGp3T1ByaW10MVlGMnZjSGNTZmF4RUJFeWRvWnpGOE1XQUNq?=
 =?utf-8?B?VFVrYXVzeDVQRTNiYm5SeWZwNU05cXVkM1hFRk9aeThiejE2dm5jalVCVGtq?=
 =?utf-8?B?T1ppUTNVM2hZQndEZkVJbnFtU0xNK0dhQnRwYm9lYVFvZi9yOUN4c3lXVm9r?=
 =?utf-8?B?VktBRTN1NGlPK2trd2tZcEtxWEVxbGVOc0lLZ2wwQXdNa0ZFemxvL0hQWk5n?=
 =?utf-8?B?aGRma3BIQUFnRmlpS2ZFUjhCbmVWSEVodm1HaFAzNlNHSnNSQ3d4dFhCUm9P?=
 =?utf-8?B?RmJKYiticXRrWTZhbml4K2VZS0I3SFlFc3JoK1BUZEMyQkFXTW8rOFlxV3hM?=
 =?utf-8?B?THNGc0tvWER0S1huRGRnMWdhMGxSQW9YWi90a3YrRmRraDcrVUp5TXlmTU1r?=
 =?utf-8?B?dk43TnpEdTQ4MXQzVVAxRGlJQnFXaDlhejJXb3VVRXUvNXRHT2ZpUG9YcnJZ?=
 =?utf-8?B?ZEd6dDNCUDhTbjQvYUhvUmdMR2xuWDZ6RXFnWlNDZjFWejJJWDJ1cDhxUkpr?=
 =?utf-8?B?YVRTZjJuUVhsYlFjU3hHSXl4ekZNazlVRmRlVmNqQ3kvZEM4eDlSeEtEMzRr?=
 =?utf-8?B?Vm1HOXZRV3M0K0RaaWRHdytOZHM3RWVrUFJUaFdSWlV4dWFYK0pWU1h0czlz?=
 =?utf-8?B?ODBBSUQvQTZKYllCYmdFTWk1YXJpL0kybnpIS2ovaEtsWWEvdnoyUmJUanNN?=
 =?utf-8?B?K1NCeXBJTUNLaUlKaDRlNGNzcS9oeDNsQ3d1RTdJTjI4SGtSWHg2SEdzdUFr?=
 =?utf-8?B?U1pHL3ZBN1grYXJSQUJrVkhFRS9KVkdORXowaWpqSUkzOHd5cUZLSVpjSytv?=
 =?utf-8?B?REQ2Rkg5TWU5bU9BT09WN0xKbmpOSkU1VFh3amtZL2h6YTd6WEwrVUZ5T0hO?=
 =?utf-8?B?V01jMVNrbFFoK2QxVUpIQXhQaDB1cVNWTitaSHZFT1Boci9sQ2JpVWlEMG9l?=
 =?utf-8?B?RExIMmE4MWxuL09NR3RoQ3pjcjd0QUpkOEJ5UnZhZ1JJOThDMTRyb25sMG9a?=
 =?utf-8?B?aDZBcEFiQk9WL0p4ZjVIdnVFYkFzMW9acWV3ckZPeElmcld1SUtyNkM5bWZN?=
 =?utf-8?B?Uyt5UU13Q1R1cGwvNnVHbHp1K0htK2lUREpRblRkdXdkcVFUdUJ6R3Q4Mjdv?=
 =?utf-8?B?VWtyNmFPY1NXTlpyYVllQ1ZVTytleU9MZFFmVENwL3FuT0tkUW1RdEM5UEZ1?=
 =?utf-8?B?dlZnVzdBL0NGN01VTDVqRlNIdjFPUFhadGF0NEpoc3JUeGZtK3dUUzAvZi9D?=
 =?utf-8?B?RHFmcUF6K1ovYWVCU1NuSmVzZi9WMDFCL2hCWlB3Qk1iOGpQamZORmkvek1P?=
 =?utf-8?B?dndYRVBJMHJLSzdxME41SzFQTnBKcHk3MUovSnM5YmtqaTVxVEN3a2J0aVpG?=
 =?utf-8?B?NkJkN1RabjgyQVJNenY5bTlBMFNIbEszZGNsbEc5T29NSnNoR3I5czcva1E1?=
 =?utf-8?B?SHcreXdicTdkZFpIZXExMno1M3k5YTVyUUpzZ2FJZFNIVEM4NVFISENTdC83?=
 =?utf-8?B?KzB0U3RnL0xIaFFqV1dLQTZFdU5ybFQ2alBiaTNuN09aMGc9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PUZPR06MB5676.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(52116014)(1800799024)(38350700014); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WXhERGxpaFE1U0gvSUVPSkdMQlppOGVQVHFKN0tOZ0w2dlh2YSthQlcyUHZK?=
 =?utf-8?B?M2dSM3B1WDU1UVJVU3NnMGZJb2JJK0Yza1JmZHVXaTczcFdBdTZBc29kRkg0?=
 =?utf-8?B?OXdCNmhlRU9EVjlZYW5vak5OMWI3aFVQS1luTHFHcE8wZHVWdlk4Ylg0U2p6?=
 =?utf-8?B?bnhJbFFjbjQzbEhlWlZsVTQyeVdRL2IrNmhVSGhOK0hqS3JtNDRuZXhPWm5S?=
 =?utf-8?B?WmJheW56L3BBZWhBUTFsYVgrTk5XSEt6QVk1UGxiRnRRd2lKS2pUa3M5Mm8z?=
 =?utf-8?B?aTJIQTJ0djlHWmRKQ05KTTd1NGNQa3BhOVdVYVNkZmk0TENvKzlqVU1Pb0tI?=
 =?utf-8?B?V0VtdVRPS1UzWE5FQnFDK1kzUXVsTk52SEhLRzA3V3Vsd3lzamtRVlozVjlu?=
 =?utf-8?B?b3F3YnBWbnpUd0tZNXA2bk1oNU1STGVyTmVNUFQxbXArSXlrdmI1S3hTZmVW?=
 =?utf-8?B?cXlXOXZ1T1F5WGtJZFdRMk96TkUwOXo1dTBOYTdRWWlWZ0NldjYrVFI4dDdj?=
 =?utf-8?B?K2ZoamxnQnV2L1JzU2FEZGpyWERrU1VCcFNOWm55dlhweEdJVU9LVW45aHFj?=
 =?utf-8?B?YnZ1VXZWOUxXdkZ5NkFwcEtSN21WdDl0S3lRMkJSOGUvL3FTRStEckM1ZDV1?=
 =?utf-8?B?VktJSTh0WE9ocS9IU2NiREhJZlNuN0lOVUxldkl1cDUxUmsxZFJNMlM1ZG5L?=
 =?utf-8?B?emRjeDg3THVLYTIrUENNVkVkSjhyemw2d2o1N1NzVkhFWThFWlgvVC8xc1BG?=
 =?utf-8?B?UGFyQWZZdmNLU2hZcnJhUHowdDJwV3pEOU1KRUlsK1BEKzFlVXBGUW1iQmhl?=
 =?utf-8?B?T25TcVYvaUo2U3pEOStSQUtSSlpJckhQQWNTMkFRZDdWcVEvQ3NHREZvS2Ji?=
 =?utf-8?B?SE1GK1ZvQk5sN0tyTTJMZzhrQm03WXY5VG1NaFRHdjdxNUtnWk8vRStEWnh0?=
 =?utf-8?B?V1NEa05vcndBbEtFd3R3dDUzaUNlVlVyVGVCK1pRMzBjcGhPZlVVK3RZRWp1?=
 =?utf-8?B?eUdweGJ3NUg2em9UajdlQzN2TEE0OEtPUmRFTmYxRWcwL1ZmRnBkTkJMOVp2?=
 =?utf-8?B?dXBwajlzTCtxYzRjaUxFZ0cwNXpBQys2RVg0TFliQnRaN3h5bTVkYWlnV1BD?=
 =?utf-8?B?Qmc1ZGc0Tm9RNEhlTjhCc05YVmRrYy96OFlDY24wYjJBQmdmcDhQRWN3Q2JI?=
 =?utf-8?B?RHEvVDU4WWM3ODdnTWp4YS9mU3VpQm5Mb0dnc2dtSlVRTlJWZjhhYnhQMmNh?=
 =?utf-8?B?ZSs3NmlLMkkybmw3WlJwV3g5akZlQVZDTHlvWUxMZEhrRS9IODdnUzJuWUVM?=
 =?utf-8?B?eVJKNTh6OHpaMlBxKy9UK0xOYTIxUEJGak84VHlEYU9ESENYZ3UwVFZxZTZ3?=
 =?utf-8?B?NVRMb2R0TjBLc2t2QjhraXczNHdLMVFRS3VnblE0cEpSeUlvSzRNSDgrY0c1?=
 =?utf-8?B?NmhNQ3pubDh3VVY0RkZMRGRzRExBVXppN2RQakpyRllMZklqaTNzdXI4OVJw?=
 =?utf-8?B?VHBKbS9lVzNXYXdwNkUrekNBdEcwVWZRT0p2dFB2V0haUjU1NnZFZ0hQek1T?=
 =?utf-8?B?emVjNWprWDFmNG0wcVZmczhRSFAyeGJtL1p0TUt6c0poSXdGRjY3WWVZVHg1?=
 =?utf-8?B?dFZmZjlyUnBTMVRpSFc1VEo5SFJ6SFVaYXV3eXNCSlZBRTZkWW1IWTBRQkxm?=
 =?utf-8?B?WHVLbjBueDhTUXE3UkV0bjJCd0xpcDNqQ2RHbS9ueTJXRGgvd3FOZit4WWxR?=
 =?utf-8?B?WjAvN3ZLSUkzT0dWaHEvdjhRckowcnVBbURFU3VQSVdkSTVIZ3JQemVVMGxY?=
 =?utf-8?B?dTRKRGtObHJRSEgxQXhLZTBXSWhYbjdlMnhHZEluOWVhancrSlU2T0NuaHZy?=
 =?utf-8?B?NEtoQXJ6c2RDY2lhb2FSSlJmS3I0cEpsUnRibFFMTmFqN2lJUERmSmVMZUhl?=
 =?utf-8?B?bC9rZVN2UFlhMkhRQllkVmZRQnB5UzY3OER0RXpxamhYWURnZ1YzWkwremlZ?=
 =?utf-8?B?S3d1U05PQ2NpN3duc2xvWGNGa1pnYVYwL3lRbjRhazlLSDEvZ05sNlRCc2xr?=
 =?utf-8?B?ckRiZllTK25SM3lBOCt3YUprOFRDdzFMWk5HQ1NsR2RuTW50L3FoeDYwdDc5?=
 =?utf-8?Q?4poveUvTL+uoENAx58ZIOktNJ?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 88fe3e71-63a1-4869-c29c-08dcce4f20b6
X-MS-Exchange-CrossTenant-AuthSource: PUZPR06MB5676.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Sep 2024 08:37:22.8232 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HWY26D16AoGY4RMBSPP4kEuGis9gc8wBKdIXrN6dE12el6FiHpKdvIBoV7yjGYjHUGztkx4hPzSK50SfDDqVFw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYSPR06MB6501
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


在 2024/9/6 16:12, Kasireddy, Vivek 写道:
> Hi Huan,
>
>> Subject: [PATCH v5 1/7] udmabuf: pre-fault when first page fault
>>
>> The current udmabuf mmap uses a page fault to populate the vma.
>>
>> However, the current udmabuf has already obtained and pinned the folio
>> upon completion of the creation.This means that the physical memory has
>> already been acquired, rather than being accessed dynamically.
>>
>> As a result, the page fault has lost its purpose as a demanding
>> page. Due to the fact that page fault requires trapping into kernel mode
>> and filling in when accessing the corresponding virtual address in mmap,
>> when creating a large size udmabuf, this represents a considerable
>> overhead.
>>
>> This patch first the pfn into page table, and then pre-fault each pfn
>> into vma, when first access. Should know, if anything wrong when
>> pre-fault, will not report it's error, else, report when task access it
>> at the first time.
>>
>> Suggested-by: Vivek Kasireddy <vivek.kasireddy@intel.com>
>> Signed-off-by: Huan Yang <link@vivo.com>
>> ---
>>   drivers/dma-buf/udmabuf.c | 35 +++++++++++++++++++++++++++++++++--
>>   1 file changed, 33 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/dma-buf/udmabuf.c b/drivers/dma-buf/udmabuf.c
>> index 047c3cd2ceff..0a8c231a36e1 100644
>> --- a/drivers/dma-buf/udmabuf.c
>> +++ b/drivers/dma-buf/udmabuf.c
>> @@ -43,7 +43,8 @@ static vm_fault_t udmabuf_vm_fault(struct vm_fault
>> *vmf)
>>   	struct vm_area_struct *vma = vmf->vma;
>>   	struct udmabuf *ubuf = vma->vm_private_data;
>>   	pgoff_t pgoff = vmf->pgoff;
>> -	unsigned long pfn;
>> +	unsigned long addr, end, pfn;
>> +	vm_fault_t ret;
>>
>>   	if (pgoff >= ubuf->pagecount)
>>   		return VM_FAULT_SIGBUS;
>> @@ -51,7 +52,37 @@ static vm_fault_t udmabuf_vm_fault(struct vm_fault
>> *vmf)
>>   	pfn = folio_pfn(ubuf->folios[pgoff]);
>>   	pfn += ubuf->offsets[pgoff] >> PAGE_SHIFT;
>>
>> -	return vmf_insert_pfn(vma, vmf->address, pfn);
>> +	ret = vmf_insert_pfn(vma, vmf->address, pfn);
>> +	if (ret & VM_FAULT_ERROR)
>> +		return ret;
>> +
>> +	/* pre fault */
>> +	pgoff = vma->vm_pgoff;
>> +	end = vma->vm_end;
> Nit: use vma->vm_end directly in the loop below, as end is used only once.
>
>> +	addr = vma->vm_start;
>> +
>> +	for (; addr < end; pgoff++, addr += PAGE_SIZE) {
>> +		if (addr == vmf->address)
>> +			continue;
>> +
>> +		if (WARN_ON(pgoff >= ubuf->pagecount))
>> +			break;
>> +
>> +		pfn = folio_pfn(ubuf->folios[pgoff]);
>> +
> Nit: no need for a blank line here.
>
>> +		pfn += ubuf->offsets[pgoff] >> PAGE_SHIFT;
>> +
>> +		/**
>> +		 * If something wrong, due to this vm fault success,
>> +		 * do not report in here, report only when true access
>> +		 * this addr.
>> +		 * So, don't update ret here, just break.
> Please rewrite the above comments as:
> * If the below vmf_insert_pfn() fails, we do not return an error here
> * during this pre-fault step. However, an error will be returned if the
> * failure occurs when the addr is truly accessed.
Thank you
>
> With that,

OK.

Thanks

> Acked-by: Vivek Kasireddy <vivek.kasireddy@intel.com>
>
>> +		 */
>> +		if (vmf_insert_pfn(vma, addr, pfn) & VM_FAULT_ERROR)
>> +			break;
>> +	}
>> +
>> +	return ret;
>>   }
>>
>>   static const struct vm_operations_struct udmabuf_vm_ops = {
>> --
>> 2.45.2
