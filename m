Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A0A04AA04F8
	for <lists+dri-devel@lfdr.de>; Tue, 29 Apr 2025 09:50:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 905FB10E043;
	Tue, 29 Apr 2025 07:50:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="hkknKVku";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2083.outbound.protection.outlook.com [40.107.236.83])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D05F10E2E8
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Apr 2025 07:50:17 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fq2kF35UzAk6gjcHd5NUpn4TuvTGb/sUOpHRBgFyOxjwmj4aG4pMUsGRLIHfwpOmwbBVYk9I/i4N6XuNEOq11XDC/g478G8/53LijiqGKJphu8Ntw+gezphbwrFRwVAghpJ4WyR2D1OndleJ2o+9L/5pKjQdq7cJrVhY4RamKIelPesmh8uoey1qMAkLqb4bYeB6ASwpfZllQS/VmP36zKbuVYUleW2T7VkaeZAqVMrFBeH/rWJQmQy2L+H/7SfuYb74rRdfARWLdGrkXomYrO5wox7b7HBYe8zFHz+4KYV4V9CC986yR1VX5UEQGRIxUBnp9gD+F6H8xRxBjBTYkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=e0qt71UB7vkB0am1WJo0zup1O/FFXmKTSSZLplPaRlY=;
 b=C7nTkU3ByjPWtT3KQdXMaxXl4camZ1aY6wKcADcYb2UuA/vAGBsOmo58g4zGe3SbPPEaZF9xsBWSnnI7YIa2BmIjfveHFxP9Iv3y5CsTUABETSU06FLwuxTpS3JUp/Lla1wkaRU+R6TkYGwUJvZXfWssnzBcvskNUHOMBL6RE7LewHhsWurlLl2DNwVZNQ40bxlBKOxafz7j0aUCWcmEi0OLhIfkWrtlRZMf0c9pR00Frk+UBdLE19wPn0Oi2WirwPxPaFtN974sz+qDVBS7vbWiDfgukR7cZS6yyJ6/o2MX4vOLsB1mobOjxH5JE7FjcExu3UOPdqvUggtKlMEe6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e0qt71UB7vkB0am1WJo0zup1O/FFXmKTSSZLplPaRlY=;
 b=hkknKVkugl4WAWGZv/lbtl34z91Wcjln2NDjCOh4yQg6xWnw9pty0ziPnJ4WUI4SgG+EZp4AQiHjg/7U9SeiApqAGRm0JTSo0nGdjbSibNsnYihUB4mVeP8beE8ePdmN0WhntfwpMO6HnJeZtYfRn2nWDtptcou15bcWb5T3K/g=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CH3PR12MB9194.namprd12.prod.outlook.com (2603:10b6:610:19f::7)
 by SA0PR12MB4447.namprd12.prod.outlook.com (2603:10b6:806:9b::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.19; Tue, 29 Apr
 2025 07:50:10 +0000
Received: from CH3PR12MB9194.namprd12.prod.outlook.com
 ([fe80::53fb:bf76:727f:d00f]) by CH3PR12MB9194.namprd12.prod.outlook.com
 ([fe80::53fb:bf76:727f:d00f%4]) with mapi id 15.20.8678.028; Tue, 29 Apr 2025
 07:50:09 +0000
Message-ID: <4b6dc759-86fd-47a7-a206-66b25a0ccc6d@amd.com>
Date: Tue, 29 Apr 2025 17:50:01 +1000
User-Agent: Mozilla Thunderbird Beta
Subject: Re: [RFC PATCH 00/12] Private MMIO support for private assigned dev
From: Alexey Kardashevskiy <aik@amd.com>
To: Xu Yilun <yilun.xu@linux.intel.com>, kvm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org, sumit.semwal@linaro.org,
 christian.koenig@amd.com, pbonzini@redhat.com, seanjc@google.com,
 alex.williamson@redhat.com, jgg@nvidia.com, vivek.kasireddy@intel.com,
 dan.j.williams@intel.com
Cc: yilun.xu@intel.com, linux-coco@lists.linux.dev,
 linux-kernel@vger.kernel.org, lukas@wunner.de, yan.y.zhao@intel.com,
 daniel.vetter@ffwll.ch, leon@kernel.org, baolu.lu@linux.intel.com,
 zhenzhong.duan@intel.com, tao1.su@intel.com
References: <20250107142719.179636-1-yilun.xu@linux.intel.com>
 <371ab632-d167-4720-8f0d-57be1e3fee84@amd.com>
Content-Language: en-US
In-Reply-To: <371ab632-d167-4720-8f0d-57be1e3fee84@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SA1P222CA0187.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:806:3c4::14) To CH3PR12MB9194.namprd12.prod.outlook.com
 (2603:10b6:610:19f::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR12MB9194:EE_|SA0PR12MB4447:EE_
X-MS-Office365-Filtering-Correlation-Id: 11adb4c1-e4bf-4e4c-7262-08dd86f2772d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|7416014|376014|1800799024|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?M05KYktoMW5tckovbHp1L0ppUHFhNnBSWUJ1WW5PaFRoenllQWliZGtodUNV?=
 =?utf-8?B?VnZZeVh0Nkw4dkJ4bU1JVnZ4TTV4d3Q5cUhyaEFCU1RGaHpqYmc0NDVwSE5L?=
 =?utf-8?B?SjdNTmxaWmxTZFU4NzcrRCtwQWxFQ3UralQvaDZNQ2QrcEpReHlqRnhtQjJH?=
 =?utf-8?B?Wnp0My9pc1FwS25xRXZTYWk0Rzk0Tk4vcXREa2o2M1E4cGcrd09UOXZscWwz?=
 =?utf-8?B?UGUxZnBrdXlYTWp3dlJpQnlLSmdrbVBPMzJEbTdBaVVXZ3UzbGo0bVFoZis1?=
 =?utf-8?B?TE1PdkNESU1uVVc0eVZYaVVTMU9XOUhmQmhxdFltRGpmaUtNQzBYWWl4ZW45?=
 =?utf-8?B?Ym1CSFZHR2ROTDZ5eTYyczRYbFpqd2k0NDVUL3VkdkRCaVhVNHM5YXFzb1B0?=
 =?utf-8?B?SEhjZ0Ruay9wZTM2ZHlETi9FRGVucUdrRml1Ym9oMHZvVGU0S0tJUnJEODdk?=
 =?utf-8?B?WnIzcXNOai9VVlJTNEJTVHB1elJFK0YvVkVJcHJ2eGUyZU0wcHBuaEZ2Rkk1?=
 =?utf-8?B?LzZoVG9wSHk0YzlxaDNUQXN0NUo3UWpFWmd2b0hUQkFTclVXUW9QZklRdVh0?=
 =?utf-8?B?cW11cVhlaitSRVBQbHBPclFQa3FGL2c4UlJjOWh2c3F4K3JxZXhnSFV5ZS94?=
 =?utf-8?B?N1QrNFV2VVhQMTU3NHlvSTVGLzN4bkhMdURQUFZZL05aQytENXZpZW1PdjVj?=
 =?utf-8?B?bUxRb0ZEeUNtVGZka1JGZ3lJMDE4dVJ0NFAyTWVwRFArdldXVDkzTlJ4WE52?=
 =?utf-8?B?ellVSWcrVHczWERyQkxpbTcvUVlYem1wS1JMb1NKRXQrcytKVWhEck1zYzBq?=
 =?utf-8?B?THNsSWRUNjBQZDRrelVhb1BOZWh1N0RGSGtLWEVJbjRSWmZOL1crR1RoQjND?=
 =?utf-8?B?bittaG9EZ2R6MXVvb1kzRThlMnd2TGpuQ2EwYVRzWmVML0VMeG41aGRFV0Fi?=
 =?utf-8?B?NVBNQUhodnRtdWlEb05NUStzaFhPZXRHU0ZCbTV0MjJSZ0JMNC9oaG9wNW1E?=
 =?utf-8?B?dm9HTmJFRVpScnZib2orK1J6WVNicHhrdmVpRjB2OXVma1VGcEp1UmlLTE1a?=
 =?utf-8?B?Y3FYdzVOenR1QTgyQW5qZlYrU1ZReUo3YmNGVXBVejh6eC8rVmVRZkFzdUxW?=
 =?utf-8?B?NVEzaldtUHRQTFdGZ3RjTXkzZDE0VGVJUUJNbXdlZUdGVE10UUNtZE5BNHV0?=
 =?utf-8?B?dTF2V1Rmby95RUhFeFMrMnBHMFBqUFNUcTFJdTJCWVZVR3hBQ1YzMStPWUlO?=
 =?utf-8?B?RElaVXhSWDRISjcyU1ZlMkxQWVlQVytGNS9GVmtPRDNTUGk3ZkkrOEJKYjlT?=
 =?utf-8?B?VUlUYTBYanhXYnd6NTNpa24xR3dQWUhtMGxON2dpU0JTRzc0YjdMUkM1d1E3?=
 =?utf-8?B?MWxzeFFOc0liaWYyUGtCcHBoakJ3NTJOZUtYWWpxWlBIaVdydUZwK0ZNWmda?=
 =?utf-8?B?bnBTLysvelBhd3NhdlIxU0VOMHpLcUhEV0g4c0ZyUnAzZU5kZC8vUVBxUlRj?=
 =?utf-8?B?b0U1R3RYRXh5MENvcS9DQnN0VXJNY255K2s5V3Bra3kyKzhNYUVrK1RqR0pK?=
 =?utf-8?B?SXBKdTNPN29CazEvd3JMZHBPUzkwT0VvcnkzZkhMNWpmVGJuY3NPanRBQndm?=
 =?utf-8?B?YkRlSGhQQ0lJU3ZNZU1WejJBMmtkcXBVcHpmVi80OWJ5NmE1Z2ZaaFZaRjFJ?=
 =?utf-8?B?cGR0dkxpNitqaDZ0OTRmUmJWRnp6YWtLZC8yRmhnNGp2OVFmMnNTUmVweWJa?=
 =?utf-8?B?aUt1bjdEUTA5WmNZNGpLamM4TlhHNHhDMEcvY2drM3V4bW9GYlUzTmRycXpN?=
 =?utf-8?B?d2I4aTVyRyszNXBlMk5LM0lFWHNOL2svT3d5TmxPUkJkZFpzOUpkL3FoVUlS?=
 =?utf-8?B?ZU5WRGRsZzhmOExRNTVrbnBoTkNPcjBpaXhwcU5vWTNrVzRRcWdoczRkSVVk?=
 =?utf-8?B?RkNWU2lFY3JWcmQrUVdnR3hrSGtGZ0NJRmh2RlpOSDhsOVhKSFJjRVNrTlhJ?=
 =?utf-8?Q?kZDriNbVwGM1uPFNmz4uQes3ux/A5k=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR12MB9194.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(7416014)(376014)(1800799024)(921020); DIR:OUT; SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aERTWjBGRGZlNzV5dlltMHRqOFZkN3ZBTWZTY3VkNHRxaFVJbXlJd0cxc3oz?=
 =?utf-8?B?MGp2eU9rcWl1QmZOVVdEdVJrYTVLWk55MncwcXNpeXVhSmxBaVZoN1BvaU9O?=
 =?utf-8?B?dUVkN213UTRrNnFyVlcvd2lBZWZsdGJ0ZiswSVhmd1hRYi9KWjdBTUVjWGxv?=
 =?utf-8?B?alY5ei9UQ05aaUdZT0NRRHBNVTdwZnRqWGNnZmlOdElEUWd1cFVVeXZnZGRZ?=
 =?utf-8?B?Qko3ZW1lWHJYRlNGL2Z0WW81N3NZNnpYTk1iTnVUYWthM3B4ZkUrQ0g0enla?=
 =?utf-8?B?Y09qK1RGcTArM2YwZW1BdWFrUWlnVVByQmR0TEtDSUxjSWZ6eHdKa3hPWStk?=
 =?utf-8?B?elBnU1hncnYrVXUvNlRYU3EzYmZ0d3dRR3dBR2NONzZCem9HWnBGK3VrMzUv?=
 =?utf-8?B?UzU0NGw1TVgxbmlFVERVUlBMdjQrNTJDZ1JiRWRTQmYrYUJVejdKUXBhNWgz?=
 =?utf-8?B?Nmd3cE9kUUo2WHh2N280VVgyclV4R2RwbWxlOU5ST3lCNUFJZzBrOTRHL1cz?=
 =?utf-8?B?bUNld2JMOVhpdGZ4OSs0dnp2TU5sdzZoeG1MQWpWcm11K2xkOE9qMkpZczNw?=
 =?utf-8?B?Z2lXdzNiK3JEL2t6TzN1Qk1KWk9TY0JSbW1TbHdwZ0FKbVhEdkJVK21qQWxy?=
 =?utf-8?B?OWFlLzVuc1p4M3ZvVXJ4eGNTL0owbXJxNnVFMFZjYS9HZEx6ZzFQcUl4ZUpx?=
 =?utf-8?B?QTN5d1RUYjQ1TmxCbmwzOG5Ub2ErRENyWGhwSUZKSU5aYWVnZXFjMDRzbEZo?=
 =?utf-8?B?R2VzbHBja0ZGaklmcTJERXY4ZnJPWCt2RnJ1RUlOaDVzNm93cmpzS0l3WGlW?=
 =?utf-8?B?SHhZaUpaSUtLblJOMXd3SHlmUG9YMGwyVmF6V1pDUHk0WUE0SXd6T2ZzMFpL?=
 =?utf-8?B?SW10V1Y1emgySFJqbWFkVTJQUklIelR6NzhxZlFabW05ZVloV2FGdnVJMyty?=
 =?utf-8?B?OXFaRjFtTDhheExDQy83QWU4VmVKNFlHZHpIR0hJcUVtMkFBTjZEeEQrUVNp?=
 =?utf-8?B?R1JROUFNNWQ5Zm9BcDNRdy92eS9GeUFIdWpOUlhrQTRaTUZrNHcreksxMjVS?=
 =?utf-8?B?c29QNnJySElGQ2NBKzh4M0dPbWtUZXdGTEpJYWRtUUhxY3Vrb2pjOHBRQkc3?=
 =?utf-8?B?VkFaYW9KbithQjdyNFJvelNZVHA3ejJPYVFLd2NzSFZvSFZkaUQ5c2l3NThG?=
 =?utf-8?B?R3FVUXY0U2x3YTdTQWlzS1JhNEUzUVRsWWgvYStmM29OZFF4emhxL0VDTnNF?=
 =?utf-8?B?c252dGMzUW9tcVNSY1RldFNwYzYwMkNjNWE5aWFrT2tyam1YQVlVQ3pxZklw?=
 =?utf-8?B?RjNxdWt2RnZWTW5CeEMyT3ZvNHVtV1VvRGxPZ2RGMUkwK21aNGpuSWJucVFZ?=
 =?utf-8?B?MWUvZlJFMHI1OFArS0JJbmNpVVpOQytzWkM3eVlPTVUzbnlOenlJa0R0Z3h2?=
 =?utf-8?B?bkwvNTBKOXY1cGJ0SVFmeWlSL1pzNjZYMmhJTHNYQ202NjFFSEF5VnhkenVj?=
 =?utf-8?B?T3JtSktlWkFTSERyai92SE1obUlxWWNwdlFxdmcraVlUSVdtNDJoWTArQnRu?=
 =?utf-8?B?ZVhxYXJ5ZnpqUkFWRWFObjJsL1BZOUVCTzhtR3NnZVY5THE5dmthdXROWnZI?=
 =?utf-8?B?MFFENHZvS2ZTMzgvVnZsT3JBNkJOMVdDVVlYdHVhZ3RMNmltdTdtTFR5d3Rx?=
 =?utf-8?B?Wmp2d0RnaHRmSnVyZlhyT1NaTUwxOFlxbXJzcDNuY1QzZ0tqOE5YVFd4dGdM?=
 =?utf-8?B?NGFCckI0Y1hkUTU3azAwWlpEcGExN050Tmg3bk56aVJsTk1PTCtRRkFGV1A3?=
 =?utf-8?B?Qm8vYVlFc3Y4VnRkQWFsK3NSdDdmcUd2aFJrZ29UM0w0UHNtRS9ManM1S3oy?=
 =?utf-8?B?Q1hnU2xZblc4T05wUTFMVHB1SkNhS0ZqbEhDSzl5cW4ySys1SUY1Qm1LemRC?=
 =?utf-8?B?OFZ3Tit2ay82Qnlrblp3VVVta05BdTVRMW9kcFMrSXo0QnQyNjV6UHBlbGlj?=
 =?utf-8?B?TTc5ZnZaUVdUMFlaWXdhYmpsWjE2RWxoYnM3SVJ6VG5PS1dYYVlSWk13UVp2?=
 =?utf-8?B?WldKYWlFcm9VWVRtOG5RV1I4YmxsRVNxRjJnWlNobm5kenNHYmY0QXp3QkNv?=
 =?utf-8?Q?QzPlazPzHSbtizTPJZeY+yYLY?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 11adb4c1-e4bf-4e4c-7262-08dd86f2772d
X-MS-Exchange-CrossTenant-AuthSource: CH3PR12MB9194.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2025 07:50:09.7895 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Y5T2Q1cCUg/0gnHAOp/8S/53PlL1B+oIX9rN0uRT8uMKHSwg91IjBQMOW22/Gxs26nOv5o7mDsj+ocqxM48+Ew==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4447
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



On 29/4/25 16:48, Alexey Kardashevskiy wrote:
> On 8/1/25 01:27, Xu Yilun wrote:
>> This series is based on an earlier kvm-coco-queue version (v6.12-rc2)
> 
> Has this been pushed somewhere public? The patchset does not apply on top of v6.12-rc2, for example (I fixed locally).
> Also, is there somewhere a QEMU tree using this? I am trying to use this new DMA_BUF feature and this require quite some not so obvious plumbing. Thanks,


More to the point, to make it work, QEMU needs to register VFIO MMIO BAR with KVM_SET_USER_MEMORY_REGION2 which passes slot->guest_memfd to KVM which essentially comes from VFIORegion->mmaps[0].mem->ram_block->guest_memfd. But since you disabled mmap for private MMIO, there is no MR which QEMU would even try registering as KVM memslot and there are many ways to fix it. I took a shortcut and reenabled mmap() but wonder what exactly you did. Makes sense? Thanks,


> 
>> which includes all basic TDX patches.
>>
>> The series is to start the early stage discussion of the private MMIO
>> handling for Coco-VM, which is part of the Private Device
>> Assignment (aka TEE-IO, TIO) enabling. There are already some
>> disscusion about the context of TIO:
>>
>> https://lore.kernel.org/linux-coco/173343739517.1074769.13134786548545925484.stgit@dwillia2-xfh.jf.intel.com/
>> https://lore.kernel.org/all/20240823132137.336874-1-aik@amd.com/
>>
>> Private MMIOs are resources owned by Private assigned devices. Like
>> private memory, they are also not intended to be accessed by host, only
>> accessible by Coco-VM via some secondary MMUs (e.g. Secure EPT). This
>> series is for KVM to map these MMIO resources without firstly mapping
>> into the host. For this purpose, This series uses the FD based MMIO
>> resources for secure mapping, and the dma-buf is chosen as the FD based
>> backend, just like guest_memfd for private memory. Patch 6 in this
>> series has more detailed description.
>>
>>
>> Patch 1 changes dma-buf core, expose a new kAPI for importers to get
>> dma-buf's PFN without DMA mapping. KVM could use this kAPI to build
>> GPA -> HPA mapping in KVM MMU.
>>
>> Patch 2-4 are from Jason & Vivek, allow vfio-pci to export MMIO
>> resources as dma-buf. The original series are for native P2P DMA and
>> focus on p2p DMA mapping opens. I removed these p2p DMA mapping code
>> just to focus the early stage discussion of private MMIO. The original
>> series:
>>
>> https://lore.kernel.org/all/0-v2-472615b3877e+28f7-vfio_dma_buf_jgg@nvidia.com/
>> https://lore.kernel.org/kvm/20240624065552.1572580-1-vivek.kasireddy@intel.com/
>>
>> Patch 5 is the implementation of get_pfn() callback for vfio dma-buf
>> exporter.
>>
>> Patch 6-7 is about KVM supports the private MMIO memory slot backed by
>> vfio dma-buf.
>>
>> Patch 8-10 is about how KVM verifies the user provided dma-buf fd
>> eligible for private MMIO slot.
>>
>> Patch 11-12 is the example of how KVM TDX setup the Secure EPT for
>> private MMIO.
>>
>>
>> TODOs:
>>
>> - Follow up the evolving of original VFIO dma-buf series.
>> - Follow up the evolving of basic TDX patches.
>>
>>
>> Vivek Kasireddy (3):
>>    vfio: Export vfio device get and put registration helpers
>>    vfio/pci: Share the core device pointer while invoking feature
>>      functions
>>    vfio/pci: Allow MMIO regions to be exported through dma-buf
>>
>> Xu Yilun (9):
>>    dma-buf: Introduce dma_buf_get_pfn_unlocked() kAPI
>>    vfio/pci: Support get_pfn() callback for dma-buf
>>    KVM: Support vfio_dmabuf backed MMIO region
>>    KVM: x86/mmu: Handle page fault for vfio_dmabuf backed MMIO
>>    vfio/pci: Create host unaccessible dma-buf for private device
>>    vfio/pci: Export vfio dma-buf specific info for importers
>>    KVM: vfio_dmabuf: Fetch VFIO specific dma-buf data for sanity check
>>    KVM: x86/mmu: Export kvm_is_mmio_pfn()
>>    KVM: TDX: Implement TDX specific private MMIO map/unmap for SEPT
>>
>>   Documentation/virt/kvm/api.rst     |   7 +
>>   arch/x86/include/asm/tdx.h         |   3 +
>>   arch/x86/kvm/mmu.h                 |   1 +
>>   arch/x86/kvm/mmu/mmu.c             |  25 ++-
>>   arch/x86/kvm/mmu/spte.c            |   3 +-
>>   arch/x86/kvm/vmx/tdx.c             |  57 +++++-
>>   arch/x86/virt/vmx/tdx/tdx.c        |  52 ++++++
>>   arch/x86/virt/vmx/tdx/tdx.h        |   3 +
>>   drivers/dma-buf/dma-buf.c          |  90 ++++++++--
>>   drivers/vfio/device_cdev.c         |   9 +-
>>   drivers/vfio/pci/Makefile          |   1 +
>>   drivers/vfio/pci/dma_buf.c         | 273 +++++++++++++++++++++++++++++
>>   drivers/vfio/pci/vfio_pci_config.c |  22 ++-
>>   drivers/vfio/pci/vfio_pci_core.c   |  64 +++++--
>>   drivers/vfio/pci/vfio_pci_priv.h   |  27 +++
>>   drivers/vfio/pci/vfio_pci_rdwr.c   |   3 +
>>   drivers/vfio/vfio_main.c           |   2 +
>>   include/linux/dma-buf.h            |  13 ++
>>   include/linux/kvm_host.h           |  25 ++-
>>   include/linux/vfio.h               |  22 +++
>>   include/linux/vfio_pci_core.h      |   1 +
>>   include/uapi/linux/kvm.h           |   1 +
>>   include/uapi/linux/vfio.h          |  34 +++-
>>   virt/kvm/Kconfig                   |   6 +
>>   virt/kvm/Makefile.kvm              |   1 +
>>   virt/kvm/kvm_main.c                |  32 +++-
>>   virt/kvm/kvm_mm.h                  |  19 ++
>>   virt/kvm/vfio_dmabuf.c             | 151 ++++++++++++++++
>>   28 files changed, 896 insertions(+), 51 deletions(-)
>>   create mode 100644 drivers/vfio/pci/dma_buf.c
>>   create mode 100644 virt/kvm/vfio_dmabuf.c
>>
> 

-- 
Alexey

