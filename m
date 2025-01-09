Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EC31A06FBB
	for <lists+dri-devel@lfdr.de>; Thu,  9 Jan 2025 09:10:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1139610E44C;
	Thu,  9 Jan 2025 08:10:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="NdN/ARTC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2050.outbound.protection.outlook.com [40.107.220.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3364610E44F
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Jan 2025 08:09:58 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XrL55YsF4WlTSflZ6GXFXCDrjuHSKHe16YxgLHExQdbVDlTF6+vL39fFt2nXCLqBQGiLrKYeHNdFJVDS8P27dXGgCJtpgFr7HXCjwH01RoYKTjqdeS+Wz/6ekH94+J58sR5Fm4+Xf7kx2uDgPe8CRRtNPXeJaZPoTYvkUe4qfBvBO+3OS3gO8d9usZkuBUtMYFKs4/lDxikw+GU8m3IfpBEcdMXp/cCi58Xo6JueFKte4KibwWczOzPbS33SKP+bbcIwRLHkVaHO0ty+FtueFmyo22qCW+A2E+cH1JiUzpAAhvpxqKoD2Z0ixAsD6mIOa+o03WeNplEsyhKNf1ISiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5VlMeftaCoOgHP26z/lG7BxBebTX/5t1H4OpB6Znyd4=;
 b=OlQgYARem1sVxB1NV2VptJx//TBcwBqNfuKqE191kz9CzF3qwV6FBwnT/wGUz+oOJG9f2noMaQPhDBG0gHnjKpNUWgvuESzyI6w2aRDS/lejUT16mbB0SUUn8oUk6rq1Zjzy0/qEQSHsyqbR6TW9ut1kFk90tNHcmod1i5HLJkud7iK+JjRdES0QyWAh9/KME1o1yOhpPUlYFccaBab1Dig0mK3eV5KvtMFimOu2ekOWMmWHO1iVYAqY3ja+C0lPKU7h3/CYUcIn8SFTtUwSaJsVbkPP4VpyqcJD7w99yU7lwl5LRriezl/1Ie/4cVbDN3ZtAzCt4OUYWo/0nbsETQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5VlMeftaCoOgHP26z/lG7BxBebTX/5t1H4OpB6Znyd4=;
 b=NdN/ARTCSKhTTpL0yUBmKkuKb3wMJZTi/FuTbR+H+lRftQy3k0mUoTLe1XflxIQvajnDD0wvC/rXkzbgfSCJ7EMLs1dHugjSUiEVccDg4AQNJYc4QCh2vz2lOOFMApcftzjS0PVpspKa/5lC80SHV6IdFTEaMSELChUWk6IjqTM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by SN7PR12MB8057.namprd12.prod.outlook.com (2603:10b6:806:34a::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.11; Thu, 9 Jan
 2025 08:09:56 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%5]) with mapi id 15.20.8335.010; Thu, 9 Jan 2025
 08:09:56 +0000
Message-ID: <c823f70c-9b70-441c-b046-71058c315857@amd.com>
Date: Thu, 9 Jan 2025 09:09:46 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 01/12] dma-buf: Introduce dma_buf_get_pfn_unlocked()
 kAPI
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
To: Xu Yilun <yilun.xu@linux.intel.com>, Jason Gunthorpe <jgg@nvidia.com>,
 Christoph Hellwig <hch@lst.de>, Leon Romanovsky <leonro@nvidia.com>,
 kvm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
 sumit.semwal@linaro.org, pbonzini@redhat.com, seanjc@google.com,
 alex.williamson@redhat.com, vivek.kasireddy@intel.com,
 dan.j.williams@intel.com, aik@amd.com, yilun.xu@intel.com,
 linux-coco@lists.linux.dev, linux-kernel@vger.kernel.org, lukas@wunner.de,
 yan.y.zhao@intel.com, leon@kernel.org, baolu.lu@linux.intel.com,
 zhenzhong.duan@intel.com, tao1.su@intel.com
References: <20250107142719.179636-1-yilun.xu@linux.intel.com>
 <20250107142719.179636-2-yilun.xu@linux.intel.com>
 <b1f3c179-31a9-4592-a35b-b96d2e8e8261@amd.com>
 <20250108132358.GP5556@nvidia.com>
 <f3748173-2bbc-43fa-b62e-72e778999764@amd.com>
 <20250108145843.GR5556@nvidia.com>
 <5a858e00-6fea-4a7a-93be-f23b66e00835@amd.com>
 <20250108162227.GT5556@nvidia.com> <Z37HpvHAfB0g9OQ-@phenom.ffwll.local>
 <Z37QaIDUgiygLh74@yilunxu-OptiPlex-7050>
 <58e97916-e6fd-41ef-84b4-bbf53ed0e8e4@amd.com>
Content-Language: en-US
In-Reply-To: <58e97916-e6fd-41ef-84b4-bbf53ed0e8e4@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR5P281CA0029.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f1::13) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|SN7PR12MB8057:EE_
X-MS-Office365-Filtering-Correlation-Id: 6d81a712-e97f-48e6-c2ad-08dd308500b4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|7416014|366016|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?OHRpbmY5bGpwUUlyT1YxS0RZeWFGaWwwdnpQWExteUFVN2grbVJTSGUwTXJO?=
 =?utf-8?B?bmRiZXNjUTdLRFZDU2puSmtTTlAycGJ6Y0lXbkc0S1g3U2N6QytzeWlHYzNP?=
 =?utf-8?B?dXBsUlhud3NjbUpmWTJ3TTd3a3hTS1dVejB0bzAzSURMWGVyTVhCd0xmV1pQ?=
 =?utf-8?B?eEhkajhldVoyWTJNY05TZUphenJqNnc1VjVMT1RZWG1kQm5OVDM3U0xNRlY0?=
 =?utf-8?B?Ui94ZGxNMHYvNzFzT0NKYjdrS2cveWtHa3hMdjFjeTJSNGhXdThkaHpBdk9r?=
 =?utf-8?B?RDQ3Y25uTG54ZXpSVWRTRW5qYndiRU9VOVNkeDAzWU1YSFhWbUU3b25WN1BY?=
 =?utf-8?B?c3ZuZXVrZmFiaXIwbUNUeE1SMFRnZmlUUGVyVXFGNTNwZ1FIMURqWU1LSFdP?=
 =?utf-8?B?M2FUMmZVajM2K0xsQzFwakxwci9wOC9GL2lZWnJwRW9oZEN4RmR0dk9sRGpG?=
 =?utf-8?B?RUNLdlpGcDFLU0JKQnRFUEVPNjJWd3pYTlNacjJXT25TNis5SGVMK2swOW5Z?=
 =?utf-8?B?V3dxZEduZWpwVzdLZmswaE9kaldxV3lmZWNzTEpXNUxmV3ZFN1hnSHF0UjFX?=
 =?utf-8?B?T1RNYmtHUDhKU1ZxY3Qza0FqWHZ4d3FFMTd4V0VqVVkrZ3RCMnFxcmtLbEt4?=
 =?utf-8?B?b0szRlBKVVM4Z1JZaHVHTXllQlFhc1p1bVZtNHRVeWVaZUZickdoMmxDamVy?=
 =?utf-8?B?M2hmQWdFTURDWmlaRWtMSWloWEZSUzVtSkxaVEIwdUhmU1Eyck0wS2VoaE0y?=
 =?utf-8?B?S1dwazdkdHBvTDQ1QkljSllSOHoyaHNUdGJqbk5IZFU4ZjNITjNwOTlQeit4?=
 =?utf-8?B?SVYzQVBVcXhwYWljK0xGTXl3Q2VtSG9HQWVIeVIwTnRqenVFQlVDMGtpNnVO?=
 =?utf-8?B?RTJDSFFkOXVUaTVzQ1RrV2NmNjBzMER0SG1HU3BjVDlpVFhSMytsVXFFcW9U?=
 =?utf-8?B?U1FjQk5KQzhLMlhIN2FSaFp2WmM1cnpodzE0TVh4V1hVTTZyMkNDUjV4aXFT?=
 =?utf-8?B?VVZtTFRxeHZkakc2cnMvUE85djdVRkhGTXcxbllLUGdtS1lzYnQySlg1NTFk?=
 =?utf-8?B?R2ZUMU1SOXRvbElUZWNLSldCejkyTHdXWk4zYUdXR0Q1em1jMVdVWkJnbVlt?=
 =?utf-8?B?WWRCS292TGEwbTV6UGcwcHlBU1J4VGFNaVd5M21GbWxnR2lzRmVYZTlkMGJm?=
 =?utf-8?B?Ylg0ZDBHL2V2MFlYdkhKTUtoZGF2cFEwR2tkMTg5VHVoYmJEODlhUVlHWFph?=
 =?utf-8?B?RGwwZkFpWkJjaTg1WWlENmNCUUJrZ2FJQXBtc3ZLUnF1V3dIYjV0dkdnS205?=
 =?utf-8?B?RVJIOUFOWHR6d0w1cUxWd0VhVTRhUm81aS8zZFFkRG1Pb3BBeGpoL05SQnlm?=
 =?utf-8?B?dWR3U1Z2d3NtRjRlZ3JDUVJBamVpa2NTUEZUQVMyYytRUlM2a2I2QTBMZGZK?=
 =?utf-8?B?MDIwdVJQTkcrNm9HMjFhUW5sU2I4SWRCU0pwaHJVR3lDR2ppeFVsQ2JTUC94?=
 =?utf-8?B?NlVJQUx6cFYyM2tyOFZYWFk0Zy80NlMwYUFSWi9YdkE4NlNwRStDd1Vhenhh?=
 =?utf-8?B?RjE4cHkrS2wyYi9ZWmhkQ3Q0bWVFTUhlbHNWS2FhUW1WWGpXZzJpdEJwOXpt?=
 =?utf-8?B?cXBqYW5Hc241MHEzYWlva1dONzVUR29CYW9nOTZOeXVhSFFJakRqWVhDOVM4?=
 =?utf-8?B?c0lILzRBbUtIdHdCU2hPUkJRRWIvTmp2UDYzQ1hTajJUaGNXVnczV0tPLzZ6?=
 =?utf-8?B?SnBtSHk5SVF2Rkcva1FQQUxTZnlFeW16YU8vRUEzd3RQL3VyVlY1WFRJMC8r?=
 =?utf-8?B?Vy9rZWxxV1BjN1lGelc2MjFrMEh2UXpUVkNBUG5tMktYSzVMZWM2angxOVcr?=
 =?utf-8?Q?cuWpBvee7thNB?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(7416014)(366016)(921020); DIR:OUT; SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?d3gwL1pnUDM0R3FGeUg2Z1JyOTkxankrbUdvcGxDR1pwVE1ldUFhMDZSTGdH?=
 =?utf-8?B?VmxOalVDd2pjbW5CWDVxS3BVZjFWNEhNdHRsdnY0NWxwaDZESTV4SHhhWFNI?=
 =?utf-8?B?eVErN0VpRW9OZkJpbW9VWk13MDRWM0pwNUFyaUNPdUlDUjcrNHNqdlZuZ04w?=
 =?utf-8?B?cG9OeDQwcFpNbVVRcS9QSlpYSml5bVlibVFqaE5la0xVcVB0Y01qb01NVTJr?=
 =?utf-8?B?VWNyU2xsT09tZ1E2VjRaU1VHd21hMFJ1MWVwSDlWazNCZEdZWmJYeHpJbGZa?=
 =?utf-8?B?cUd6S1hBTWR2VEZvVk0rNnB6VERnbFYrYndsSlB1UmIxS3ovTlc5MVhIaTFG?=
 =?utf-8?B?eWJKUW9uTk1iKzdMa3RMaGV0ZXNuVXAzcDVtUDM2UW9SMHlqRUU0OTAwNDIx?=
 =?utf-8?B?bHZUSlk3dno4RXhxeWFwSlJOdlBjYVcrVzl0dVc5MWxTbEJZSkkybkR5Q0hu?=
 =?utf-8?B?WTc2MkVrVUlOZWI4ejN1T3A0TDZxOWtRNGNQdVdwYWRtQ0cvcVd2emlyZ1dy?=
 =?utf-8?B?ZWFjeWZsYytVYllPWjRjaDdZSTEwOWpKMnJHSGMvQ3ZNZ3NIQjR6T05ZajZP?=
 =?utf-8?B?Q3Jxc0xTdmwwN1Z2SDZVNmhOa1U3ZS8yNjFiODYwK3R5eGRtbkxUUDdqZXFt?=
 =?utf-8?B?TjQ1NWhzSi9RZyt6ZmxaVUZVb01VWjBJV2tLenBEUXdQS3k0NFdVdlRySEdJ?=
 =?utf-8?B?WXdjR1A4V3M5NXZWenFUMUtjZWtMZkZVYkRPS1MxNS91bEZzak9NaldWZmVu?=
 =?utf-8?B?S1dScGdhMnJkeGRTSnpIU1R1eGQweUl2aXhEOGxsWEljZElwaklaNllwNVFi?=
 =?utf-8?B?ZnBDRUlObk56T3E3YkphTExOYXNqSll2aXpHbnVyVTUxaThMdG5IWVBhRlNE?=
 =?utf-8?B?N05DbE1vdHZUSFZXc2FHV0FPb1JINmtybzdRYUdNS2t5UGlhcVk4MkxSWEpz?=
 =?utf-8?B?NHRFWFkwTnhtSXBhVnlnczdNSXhIV005dVpFYWNuVWZtS0JWalRkcnYwQml0?=
 =?utf-8?B?VEtXWlNLS2FKeElYSmF5MmVOdzN4U3B1NHdBRm5uQnhpaFE1SXNnZmRPU3hD?=
 =?utf-8?B?NjRDamVRNGtialE0L3dFb0NET1BvWmp2N3AvYkd5eXdHWVFHbG5MUTdDSmow?=
 =?utf-8?B?c0M5anhEUkNOdUdUeHZOUFBWNUR0K2pHTTN1RGtLaTdJcDhvcWZmc1dtNVBs?=
 =?utf-8?B?QkRPOWZGL1N2QWlLZHE0UC83d0dSdnd4VjhGb0EvV2JwS0YxMlFjVmcxWFJM?=
 =?utf-8?B?aThGazNJZHRYdVFJS3NKdUhlZjJmRnhtNzRieUpiYVlpaThzUC9VM2EwSGc2?=
 =?utf-8?B?N3B0eVZaWGF6QUI1eHB3RGUrQ2dONXE4cFR2NC9kcEtnbkdEOW80aHNFNHI2?=
 =?utf-8?B?Yi93bGNQcld5MWZCZFZ5SFlxNC9PbE1yUnByS3hTbXhYelJ3MkJlRWtyRmJ2?=
 =?utf-8?B?KzUwcGpsYU4yVGZnd3JBSkZ5eEhDMmZiYXl2Sk55bEVSVlF2SUd2MU9IVG9j?=
 =?utf-8?B?alRjYjdWdHZHV1YxZWxxWlloK3Z2Y0xUYXowc3FrRVJscGkzVE1qV0pTWm5w?=
 =?utf-8?B?cEIzL2RsT01KZ012RDNJSUwyTmtIMk5sODlMZXQ2SlpPVm1OMzlaV0pkYWdu?=
 =?utf-8?B?eGl5MnVWRE1HTFJOaU9UM3ZId3ppcUxKRlBTWFZSQzBUMkp6bUNoemxrSG14?=
 =?utf-8?B?d0dEVEZiM2NBSDI3YTIyWW1CZkxKeDhveDNFUm9NNGpyTTk2TjRJbmZWQUZX?=
 =?utf-8?B?MUlRRnNDZk5BZXB3VWk3OGJtMlV6eFpzVzJta251cGVwZzZLUjZ5Qms4L2Ry?=
 =?utf-8?B?ZzE3YVhpcXR0MkF1OXNad2xSRXZYdll2d3dNUnRlT2pVNm0xbnBhY0R0cjI1?=
 =?utf-8?B?dzhEN0pqamFEZ1FOSVIwYjZTaU9jbGhBN2VYRUprMTVhTGRrZngwZTVGK1Jv?=
 =?utf-8?B?ZFZXOFVtUXhkZVBjSFNCWnM1Mm44VUpwZDZXUmxjS0E3dGNMUnFmVWxPV0g0?=
 =?utf-8?B?LzZER0RYWG1xMk8vV3JOZFJTdHZ5Y1RTK25TU20yNXQxOTEvR0MwZXZXdndH?=
 =?utf-8?B?bkpyTkNUd1NVd1NHNnY2cTBHcWlBOUpFTml6NXozY3BZUFA5a3VFMFB5aDRs?=
 =?utf-8?Q?ECUwqV709FlJJpMi7nWQLXqeI?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6d81a712-e97f-48e6-c2ad-08dd308500b4
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jan 2025 08:09:56.0091 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5/maxXa1MuommCAMxKNk0JW3jCwK7lPq0UvAt9+JFmGvVzDJyiZC2lEXtKt/WB2F
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB8057
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

Answering on my reply once more as pure text mail.

I love AMDs mail servers.

Cheers,
Christian.

Am 09.01.25 um 09:04 schrieb Christian König:
> Am 08.01.25 um 20:22 schrieb Xu Yilun:
>> On Wed, Jan 08, 2025 at 07:44:54PM +0100, Simona Vetter wrote:
>>> On Wed, Jan 08, 2025 at 12:22:27PM -0400, Jason Gunthorpe wrote:
>>>> On Wed, Jan 08, 2025 at 04:25:54PM +0100, Christian König wrote:
>>>>> Am 08.01.25 um 15:58 schrieb Jason Gunthorpe:
>>>>>> I have imagined a staged approach were DMABUF gets a new API that
>>>>>> works with the new DMA API to do importer mapping with "P2P source
>>>>>> information" and a gradual conversion.
>>>>> To make it clear as maintainer of that subsystem I would reject such a step
>>>>> with all I have.
>>>> This is unexpected, so you want to just leave dmabuf broken? Do you
>>>> have any plan to fix it, to fix the misuse of the DMA API, and all
>>>> the problems I listed below? This is a big deal, it is causing real
>>>> problems today.
>>>>
>>>> If it going to be like this I think we will stop trying to use dmabuf
>>>> and do something simpler for vfio/kvm/iommufd :(
>>> As the gal who help edit the og dma-buf spec 13 years ago, I think adding
>>> pfn isn't a terrible idea. By design, dma-buf is the "everything is
>>> optional" interface. And in the beginning, even consistent locking was
>>> optional, but we've managed to fix that by now :-/
>
> Well you were also the person who mangled the struct page pointers in 
> the scatterlist because people were abusing this and getting a bloody 
> nose :)
>
>>> Where I do agree with Christian is that stuffing pfn support into the
>>> dma_buf_attachment interfaces feels a bit much wrong.
>> So it could a dmabuf interface like mmap/vmap()? I was also wondering
>> about that. But finally I start to use dma_buf_attachment interface
>> because of leveraging existing buffer pin and move_notify.
>
> Exactly that's the point, sharing pfn doesn't work with the pin and 
> move_notify interfaces because of the MMU notifier approach Sima 
> mentioned.
>
>>>>> We have already gone down that road and it didn't worked at all and
>>>>> was a really big pain to pull people back from it.
>>>> Nobody has really seriously tried to improve the DMA API before, so I
>>>> don't think this is true at all.
>>> Aside, I really hope this finally happens!
>
> Sorry my fault. I was not talking about the DMA API, but rather that 
> people tried to look behind the curtain of DMA-buf backing stores.
>
> In other words all the fun we had with scatterlists and that people 
> try to modify the struct pages inside of them.
>
> Improving the DMA API is something I really really hope for as well.
>
>>>>>> 3) Importing devices need to know if they are working with PCI P2P
>>>>>> addresses during mapping because they need to do things like turn on
>>>>>> ATS on their DMA. As for multi-path we have the same hacks inside mlx5
>>>>>> today that assume DMABUFs are always P2P because we cannot determine
>>>>>> if things are P2P or not after being DMA mapped.
>>>>> Why would you need ATS on PCI P2P and not for system memory accesses?
>>>> ATS has a significant performance cost. It is mandatory for PCI P2P,
>>>> but ideally should be avoided for CPU memory.
>>> Huh, I didn't know that. And yeah kinda means we've butchered the pci p2p
>>> stuff a bit I guess ...
>
> Hui? Why should ATS be mandatory for PCI P2P?
>
> We have tons of production systems using PCI P2P without ATS. And it's 
> the first time I hear that.
>
>>>>>> 5) iommufd and kvm are both using CPU addresses without DMA. No
>>>>>> exporter mapping is possible
>>>>> We have customers using both KVM and XEN with DMA-buf, so I can clearly
>>>>> confirm that this isn't true.
>>>> Today they are mmaping the dma-buf into a VMA and then using KVM's
>>>> follow_pfn() flow to extract the CPU pfn from the PTE. Any mmapable
>>>> dma-buf must have a CPU PFN.
>>>>
>>>> Here Xu implements basically the same path, except without the VMA
>>>> indirection, and it suddenly not OK? Illogical.
>>> So the big difference is that for follow_pfn() you need mmu_notifier since
>>> the mmap might move around, whereas with pfn smashed into
>>> dma_buf_attachment you need dma_resv_lock rules, and the move_notify
>>> callback if you go dynamic.
>>>
>>> So I guess my first question is, which locking rules do you want here for
>>> pfn importers?
>> follow_pfn() is unwanted for private MMIO, so dma_resv_lock.
>
> As Sima explained you either have follow_pfn() and mmu_notifier or you 
> have DMA addresses and dma_resv lock / dma_fence.
>
> Just giving out PFNs without some lifetime associated with them is one 
> of the major problems we faced before and really not something you can do.
>
>>> If mmu notifiers is fine, then I think the current approach of follow_pfn
>>> should be ok. But if you instead dma_resv_lock rules (or the cpu mmap
>>> somehow is an issue itself), then I think the clean design is create a new
>> cpu mmap() is an issue, this series is aimed to eliminate userspace
>> mapping for private MMIO resources.
>
> Why?
>
>>> separate access mechanism just for that. It would be the 5th or so (kernel
>>> vmap, userspace mmap, dma_buf_attach and driver private stuff like
>>> virtio_dma_buf.c where you access your buffer with a uuid), so really not
>>> a big deal.
>> OK, will think more about that.
>
> Please note that we have follow_pfn() + mmu_notifier working for 
> KVM/XEN with MMIO mappings and P2P. And that required exactly zero 
> DMA-buf changes :)
>
> I don't fully understand your use case, but I think it's quite likely 
> that we already have that working.
>
> Regards,
> Christian.
>
>> Thanks,
>> Yilun
>>
>>> And for non-contrived exporters we might be able to implement the other
>>> access methods in terms of the pfn method generically, so this wouldn't
>>> even be a terrible maintenance burden going forward. And meanwhile all the
>>> contrived exporters just keep working as-is.
>>>
>>> The other part is that cpu mmap is optional, and there's plenty of strange
>>> exporters who don't implement. But you can dma map the attachment into
>>> plenty devices. This tends to mostly be a thing on SoC devices with some
>>> very funky memory. But I guess you don't care about these use-case, so
>>> should be ok.
>>>
>>> I couldn't come up with a good name for these pfn users, maybe
>>> dma_buf_pfn_attachment? This does _not_ have a struct device, but maybe
>>> some of these new p2p source specifiers (or a list of those which are
>>> allowed, no idea how this would need to fit into the new dma api).
>>>
>>> Cheers, Sima
>>> -- 
>>> Simona Vetter
>>> Software Engineer, Intel Corporation
>>> http://blog.ffwll.ch
>

