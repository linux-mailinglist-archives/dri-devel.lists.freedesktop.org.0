Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 50BDEB21ADC
	for <lists+dri-devel@lfdr.de>; Tue, 12 Aug 2025 04:41:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B412D10E57E;
	Tue, 12 Aug 2025 02:41:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="lO4f6V8l";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2065.outbound.protection.outlook.com [40.107.223.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A309F10E57C
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Aug 2025 02:41:17 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OfStJ4YiF62IIMK5w08xx9jIIyhAWAOwTKYRe1R+55DLkfsP//2nsI1P+z+0qMtzeET9pUx+iJuQiNhq8QdO+YHcJAmy1q1ZDyiCEBFBa4EHMQqpGhCuB6j84qHA1gIwdnV3G8jmcRmY52DgFVKtDFHsf4DUC4j2tgaY44frEiVZgOKeooszDH8Qr+4hAaJT9fN7+0X2jHUmKH7pVRWmO0YFvoaRhBlMMmZAn4XyPvlLn+CbwCR143hr+EY60+1jtplE74NPCIFbHLcNRUMdYOxg3oJUNGwdNUKR1Rqoe7Yu/OC2jaS1tLBKrYQMldgJ5XIA6F34O9Cu4o8ITz1CIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Kpj0DgtzxR5aJn4cHUzjRxXQ+GZQuw6pBgp0jLjQikM=;
 b=SSRttWqHHOy9phO8Wj4+kO/rcm9IAyvJDZwh5GQHSh9rWM8+A37VUBcsndddWKuEi9sCaMQtpFxaj8cHWFGqM+nz+URONQZNFQ8YLgh+BSQdCIABzdNOikEWI2ojWhBMGTVkgAjCju6LOm7tKBdt4XfRG5dZ8PkWKX5xt58HtZfKA+VnoDaxHumfu6HHf8jjghVGVuzVkcUyuSSPm61YofJb+/SASAPm2XqEgKGU1s/wwjqKZXnuHsQXebE4V0V4xIZLGBoLfuXy95sQa2YgtZwtsjRW9C37psqndi1kyt1DV971Hf/IoBG/98GC/GR3Qg1cWskfNidMkDmyVJNvXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Kpj0DgtzxR5aJn4cHUzjRxXQ+GZQuw6pBgp0jLjQikM=;
 b=lO4f6V8lfqFs9wE3j/p/InB5ZeAWPnPNRuNpyr3VgEXT+lP7ZEm2o90rIJO6mFqhxc9J/tcpUvt4XyreLuD1asibZiiPA9PU3vxmzkNEVsFLWJ4A57V3YwDwBnQjSC4JzVU/4zEX6523dP30dYoaiKXSLE7vO1WL+DvDqQtIPWzi6q416/XkDDJccd89uKlY6mpHZRqL3U7z0jP1+7MOWHf+Qfdi2tJzUgrgSrgbrlrG6OVA55Gv/E9o1rk7Bg1orqrN4AUMduUisU0Jzp7TNX6ENjk5NBYJ7BW+pV3MVGII4eeq0U19K+NkaUybGNiiw49nM5ENpHhlGm9rTdLllA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from PH8PR12MB7277.namprd12.prod.outlook.com (2603:10b6:510:223::13)
 by MN0PR12MB6317.namprd12.prod.outlook.com (2603:10b6:208:3c2::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.13; Tue, 12 Aug
 2025 02:41:14 +0000
Received: from PH8PR12MB7277.namprd12.prod.outlook.com
 ([fe80::3a4:70ea:ff05:1251]) by PH8PR12MB7277.namprd12.prod.outlook.com
 ([fe80::3a4:70ea:ff05:1251%5]) with mapi id 15.20.9009.018; Tue, 12 Aug 2025
 02:41:13 +0000
From: Balbir Singh <balbirs@nvidia.com>
To: dri-devel@lists.freedesktop.org, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org
Cc: Balbir Singh <balbirs@nvidia.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 David Hildenbrand <david@redhat.com>, Zi Yan <ziy@nvidia.com>,
 Joshua Hahn <joshua.hahnjy@gmail.com>, Rakie Kim <rakie.kim@sk.com>,
 Byungchul Park <byungchul@sk.com>, Gregory Price <gourry@gourry.net>,
 Ying Huang <ying.huang@linux.alibaba.com>,
 Alistair Popple <apopple@nvidia.com>, Oscar Salvador <osalvador@suse.de>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>,
 Nico Pache <npache@redhat.com>, Ryan Roberts <ryan.roberts@arm.com>,
 Dev Jain <dev.jain@arm.com>, Barry Song <baohua@kernel.org>,
 Lyude Paul <lyude@redhat.com>, Danilo Krummrich <dakr@kernel.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Ralph Campbell <rcampbell@nvidia.com>,
 =?UTF-8?q?Mika=20Penttil=C3=A4?= <mpenttil@redhat.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Francois Dugast <francois.dugast@intel.com>
Subject: [v3 09/11] selftests/mm/hmm-tests: new tests for zone device THP
 migration
Date: Tue, 12 Aug 2025 12:40:34 +1000
Message-ID: <20250812024036.690064-10-balbirs@nvidia.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250812024036.690064-1-balbirs@nvidia.com>
References: <20250812024036.690064-1-balbirs@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SY5PR01CA0060.ausprd01.prod.outlook.com
 (2603:10c6:10:1fc::19) To PH8PR12MB7277.namprd12.prod.outlook.com
 (2603:10b6:510:223::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB7277:EE_|MN0PR12MB6317:EE_
X-MS-Office365-Filtering-Correlation-Id: 01eff2f7-7e9f-4fc5-708c-08ddd949b43f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ai8xL2JhUk9sYk1jRTFvaEZXWlZjMDNLdS9iUGF0VkR3dVVWTGJ0Nzd0S2dH?=
 =?utf-8?B?N2JuZlNSSkYyMW1mWWwrajNBQ084aXdQRE14WWVNTm1LYldBRXRmOHA3SUJE?=
 =?utf-8?B?WGc4dWVhc3RDZHI2WjVlQUtTcmZ0OVhlMVh3TjlvWGtPM3A2TmtlcGVldG1F?=
 =?utf-8?B?R1AybXRTS0xoeTNyeFNtb0ZjM25HRWpXN3JOSVBMdVBJWWMydFRiWjdjRUYv?=
 =?utf-8?B?MzQxbmJSYkZtWjJVYjJ6SFplZldhcFYvelJpamVzNFd4eEVWRTNWRzd2NDMv?=
 =?utf-8?B?SGg5OEd2L3FDVEFLMktCRW5LNERWNk5MR2toL0ZHekhzSkhQMW40NU94UkRS?=
 =?utf-8?B?TjR4QVQ5M1FBdExOekJCQnVNMmh1WnVuYm5KSjQ5NFdQa0JnQStRRWdmZ3JM?=
 =?utf-8?B?bk9MV1JzUTVhdFhxYWQvYlRvd1NqYmtOQ2NodkJNOFIvZDBYMThuL3NuK25C?=
 =?utf-8?B?Y3JGTVJLbTJaZk50RE50UjhCRXdOT2pNTjUxRGx3NVNrVFl1ZWRKc3VaQXNr?=
 =?utf-8?B?SVQ1SG9TcVJkZHk1Zkk5dDVpQ2VtVmZBZjdMK3Z6VVNlcVFwaE4xN3daSlZZ?=
 =?utf-8?B?L1pUNVJDV1lsanIvK3lON1hpNUxqTm1FWUFtMW16cktISnAzYXBNa1VpSmxX?=
 =?utf-8?B?dnhWaGxNbTlWQ2RTYWpqdVA3azBCTlM0SDJwOGRlVXVmTEgwaU1CMFA5cnl4?=
 =?utf-8?B?Q1NNTi9ZM2V6SGkyMnNzMk0zUG1zSTBBMUI5NC80MHFvMVFMaGF5emw4MTht?=
 =?utf-8?B?WUtVQ1FiWklrUjdXRUpyOHpHeEZ2Qy8wOHVUR09pUHhSd3JiYXg4MkhFekN2?=
 =?utf-8?B?a2NQQS91V2l2UlRIbjU2NzdxMmpJTHZlTlduRmlyaStiUUdjbHBsR3ZFZGpa?=
 =?utf-8?B?Ty9PQ3lpSW8rRGNRWnRLUThpL1VSTXlWMnpMRXFDOTltbXVheGhITmxFc1d5?=
 =?utf-8?B?YUhDNVlCd3g0dHZ3a3lrd0I3c3ArbkdCYmtteUYvNWhLbnZhMVBRQmlvWEgx?=
 =?utf-8?B?bEVMNUNBTCtjcGtLVUw4QW5mS2xjOERZUTBNeVd4RzBtZHE5eGtsZmdhTnFT?=
 =?utf-8?B?S215SlhBTDZyUXVab2ZBNUhkalZQTHp0eWoxTjF1RVZHQU1VcS95RmUvK2pm?=
 =?utf-8?B?bkFhZkt6Q05GTGRIRTRneXN3aTJzTThhS1czc29qSkNiQ0J3Zy8xVXpGcXMy?=
 =?utf-8?B?OG9SZUJjbEV4R3U1dksvdTNSWmhzVTFUTXYvRlVaaGRnMGRnUmtobHljMDJo?=
 =?utf-8?B?VVFQTXozUWJVTjJMQzRkSE50VWxuNWhyOHh6TEVOUXk5S2JTZnQzdCtyMTFt?=
 =?utf-8?B?dlRlU2ZpM25SZ0FtNXkwUXdhalRnbUpmUUprclEvVVNPNW5DTkpTOG41ZW9k?=
 =?utf-8?B?TDFUbkkzZE5QQzJSa2NqM2RrZHh6aWpDa1ZZL2JJVmxGU3JEV0FXZjE4dG8v?=
 =?utf-8?B?YWIvU1JRZWdPcVE5dXRHOHlWak5YWEMzbjB1RkhQaTEzQjU2TU5GaGlQR0ta?=
 =?utf-8?B?UGV5MVRubnE5S3BiU2ZlOWozWWJnRVJvejRZVFdtdjJ0UjBPa1FIQURndkpi?=
 =?utf-8?B?MHJuL01nazJQbzRDNWFhcGIvUC9UaTZ4NHFuMkI5RXU5TTFBcUtCR3dCMGU3?=
 =?utf-8?B?aVk2WkM0WDZaa1Rwam1WSDZROWhDc2JGSi9uNEVFZXBEZnN2dUFzaE9vMnky?=
 =?utf-8?B?NDh2NER0VFJDR1g5TDltcU1yNVAzWXdBVlp1WnZuSXpkQUJvcythLzJPdVh1?=
 =?utf-8?B?dyszSjk0RDhocWU1b3dqSERlWEgxYWpQV3ptWkVHam9oOFRTVTloTmloT2NN?=
 =?utf-8?B?T0tUNUFablZ4SWx4QlFNb0lXK1I4S2ZPbkJUWG0xanJPQ3BzRjU3cjNMTzBH?=
 =?utf-8?B?d0pzcmM2aHJtZzdYRXZsaldoTFhaTWZSRFNzYnN0M3o4UUE9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR12MB7277.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VUUrZ3p5RkUrTFlqZXJzQXZsZTNEd0VxTFJMZ3cvUlZlWDJtTkdyQzcrMkpj?=
 =?utf-8?B?RkdsUUlwUmd1bkZxTmxkOHpzVHlBS2xveE9ISWpad0NhSnVVOHBqSXhDL1ZF?=
 =?utf-8?B?dENUTlhML3NNU3F0NEJGWXZQZzRSTmJoblFJTi8wUGZDaWxwMm5BTXJxMDZq?=
 =?utf-8?B?OVBSSENXTDgvaVV5U2xhR3hORkNCVnh3YmVwNVlOQkw1WGpiTlVpc2QyMzhL?=
 =?utf-8?B?bEVBZWJhVVN1UlYxZEhaTWlBUzhZaythMWY1dTRVWml5eVBVU1oxWkh4RUZp?=
 =?utf-8?B?VG4rUmJ6c3IzanhyRnZUTzhYZVJySG1heTJWdHp1M2p0djlJSWNHbGp2dHdh?=
 =?utf-8?B?ZWZZc1l3WVZ2bkxlWGczNmpZSmJOSm5KK3diVFN0TkRycXpCNmJnc2FnajVI?=
 =?utf-8?B?cHFSOWVBeUdxSDVHclpva0NKaTMwSzNvSzhoNXBFTHhXTEVhZ0FULzk1Titz?=
 =?utf-8?B?aXhTTlBiTEtPYnlYWTYzbHFvU0NIV1R2cGNoY1lBT3A1RFUzUm0rbVBSRGk4?=
 =?utf-8?B?R3hDUmg4VVB4aFZ3VnAybFEzbWwzMi9vdERscXNkOTROSTFUb1FRL0JmK0Vy?=
 =?utf-8?B?eFhPUjlCZnZZWGVBT1czY0VzUGRJcE9mWDNBend4cGNWNE8xT1l4L2NGWGhR?=
 =?utf-8?B?cTZ6Y0FhYnJ5SVN5dElGSy83WmhHN25veEV0c3AwTXdvS0o0dXJ2ZEhQUDZO?=
 =?utf-8?B?QldPTTF5UlVpS2VpNitpMVJKejdFUU14MG10TVoyQTNyZjhqOWowOHlWYVg1?=
 =?utf-8?B?K2JYVE5KSkRrMXNrL0tocHp0SE94dzIxanQ4TGVlMU9BZDdWVnIva2ZXS3VI?=
 =?utf-8?B?alNJVmhtK3FRZFhzQ053czRqa2lheGZqOUtKMFBTeFI1azVyTzJTdUd3WDJk?=
 =?utf-8?B?ai9OQ09OVFlPZWk5NXJlS3VOR3BFMGNwS0xqRWsyelVzeHJScU9yakNIR1pJ?=
 =?utf-8?B?Nk5zcklKOGo2cldycnp1TjY4ZlVVVkx5UHFYbkx2YXJpckpTRHJVSjVPQjF5?=
 =?utf-8?B?OTI1cU9TWmNoTGJneEZhdjhYQzd3UjIwdW1RKy92eXNaVnBNenE1bFFoZUEy?=
 =?utf-8?B?MjNLQlJOWDhuM3dnaVJWcFdtSyt4TithL3JnaEFWcVFvRDRXQzRIQjB4czc1?=
 =?utf-8?B?UzgyWGRXY3BHeUQ1WTNvMHRQeU9KcDJrWlZpV1ZUQk1hSWpUUUxKWjBPc0Vr?=
 =?utf-8?B?WWhhdG9XTE55RnZrM2ZwV3JidEVyd2dlYmF3QjgzZGVvNzJsMy9tcWNZUjRY?=
 =?utf-8?B?S25JZzFIZUpwZ1ZjNzRaWjRuU1cveS80R3lUMFNFRkZvLzhsVGwvdTNUb2Jo?=
 =?utf-8?B?QWYreTJvUjFuRnIrTTd2Yzk3TEgwUkVjR0VUKzZYTVdoQnJwTy9YUGRGTnli?=
 =?utf-8?B?RkxiMHlXMkJOcXVuaUVFMjlBU2hBcW0wbklZRjhQayt4RUVHUXEwNFNqUmpl?=
 =?utf-8?B?amxqVVh3Vkc4RDU1cnNiMmZvMjlNRWNjcUpXWUhSRVVlaytNWlF5bi9vWlI5?=
 =?utf-8?B?NHM2WCtrcmRzYlZtLzMya3Uva1ZWWEVVOVcvM0k4RmEvWExTaUNFQUZhMkJJ?=
 =?utf-8?B?Vk4rTFpzWkQ5bjVnWmxFWi9xS0ROUFg1YUdmNDVQZVc0MjRsZU94SGpzaHR1?=
 =?utf-8?B?ckQ3MHRrWEVPYVdxQUxENzNaN0FrWklYSUx6bXYyL09EWG93UkZNcWRQZ2xJ?=
 =?utf-8?B?aW9UV1dWK2RaemFhVVpSMTJqTFVCNzZqS2E2amRNTVZZMklXY0lBT25SSVYw?=
 =?utf-8?B?OXNDTUNDUGpSWjdTMWdHTUVCMlhScXdCdkNuUEhpbnpaZkZmcTBlWnJtcGNB?=
 =?utf-8?B?ekxyYnAzcjliV0VnK3NjT0hwaVcwTVRldHA5Y0h5emZ2bytzQnJDbllVd0FX?=
 =?utf-8?B?Q1IranZvYytseGwzUkQzRnNCOVlIeWRsYVJtLzRVbkZJU2wwNjRnSVpQWkli?=
 =?utf-8?B?M2lHeHBncEZoY3ZObzA2UlN2SEtYekcrUVovK2ttZTFIVTJKN3o5cnFrL3FT?=
 =?utf-8?B?VGUwbUR4aDhRdzZNQzlQQ2VVbkZrVU1HYlhWTVJUUlJncURRSjBFYVBGOE4z?=
 =?utf-8?B?eEJJWXRvdEM4YnBWUXlyWHRYTDBvS09xanJBRCtGTWtvcTRPTjYzcXYrN0Rz?=
 =?utf-8?Q?o5p6FnqWfxa4NOCwyLIHTGX9S?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 01eff2f7-7e9f-4fc5-708c-08ddd949b43f
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB7277.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Aug 2025 02:41:13.8162 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Pe/EIVhQMSn/sBYCMBMUOe3KxVOhe53T3cq+xUYQPOVg5Ew5htSSXzyY1mMXZp5pwcvMlUaxnvvGdogrbtoKVg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6317
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

Add new tests for migrating anon THP pages, including anon_huge,
anon_huge_zero and error cases involving forced splitting of pages
during migration.

Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: David Hildenbrand <david@redhat.com>
Cc: Zi Yan <ziy@nvidia.com>
Cc: Joshua Hahn <joshua.hahnjy@gmail.com>
Cc: Rakie Kim <rakie.kim@sk.com>
Cc: Byungchul Park <byungchul@sk.com>
Cc: Gregory Price <gourry@gourry.net>
Cc: Ying Huang <ying.huang@linux.alibaba.com>
Cc: Alistair Popple <apopple@nvidia.com>
Cc: Oscar Salvador <osalvador@suse.de>
Cc: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: Baolin Wang <baolin.wang@linux.alibaba.com>
Cc: "Liam R. Howlett" <Liam.Howlett@oracle.com>
Cc: Nico Pache <npache@redhat.com>
Cc: Ryan Roberts <ryan.roberts@arm.com>
Cc: Dev Jain <dev.jain@arm.com>
Cc: Barry Song <baohua@kernel.org>
Cc: Lyude Paul <lyude@redhat.com>
Cc: Danilo Krummrich <dakr@kernel.org>
Cc: David Airlie <airlied@gmail.com>
Cc: Simona Vetter <simona@ffwll.ch>
Cc: Ralph Campbell <rcampbell@nvidia.com>
Cc: Mika Penttilä <mpenttil@redhat.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Francois Dugast <francois.dugast@intel.com>

Signed-off-by: Balbir Singh <balbirs@nvidia.com>
---
 tools/testing/selftests/mm/hmm-tests.c | 410 +++++++++++++++++++++++++
 1 file changed, 410 insertions(+)

diff --git a/tools/testing/selftests/mm/hmm-tests.c b/tools/testing/selftests/mm/hmm-tests.c
index 141bf63cbe05..da3322a1282c 100644
--- a/tools/testing/selftests/mm/hmm-tests.c
+++ b/tools/testing/selftests/mm/hmm-tests.c
@@ -2056,4 +2056,414 @@ TEST_F(hmm, hmm_cow_in_device)
 
 	hmm_buffer_free(buffer);
 }
+
+/*
+ * Migrate private anonymous huge empty page.
+ */
+TEST_F(hmm, migrate_anon_huge_empty)
+{
+	struct hmm_buffer *buffer;
+	unsigned long npages;
+	unsigned long size;
+	unsigned long i;
+	void *old_ptr;
+	void *map;
+	int *ptr;
+	int ret;
+
+	size = TWOMEG;
+
+	buffer = malloc(sizeof(*buffer));
+	ASSERT_NE(buffer, NULL);
+
+	buffer->fd = -1;
+	buffer->size = 2 * size;
+	buffer->mirror = malloc(size);
+	ASSERT_NE(buffer->mirror, NULL);
+	memset(buffer->mirror, 0xFF, size);
+
+	buffer->ptr = mmap(NULL, 2 * size,
+			   PROT_READ,
+			   MAP_PRIVATE | MAP_ANONYMOUS,
+			   buffer->fd, 0);
+	ASSERT_NE(buffer->ptr, MAP_FAILED);
+
+	npages = size >> self->page_shift;
+	map = (void *)ALIGN((uintptr_t)buffer->ptr, size);
+	ret = madvise(map, size, MADV_HUGEPAGE);
+	ASSERT_EQ(ret, 0);
+	old_ptr = buffer->ptr;
+	buffer->ptr = map;
+
+	/* Migrate memory to device. */
+	ret = hmm_migrate_sys_to_dev(self->fd, buffer, npages);
+	ASSERT_EQ(ret, 0);
+	ASSERT_EQ(buffer->cpages, npages);
+
+	/* Check what the device read. */
+	for (i = 0, ptr = buffer->mirror; i < size / sizeof(*ptr); ++i)
+		ASSERT_EQ(ptr[i], 0);
+
+	buffer->ptr = old_ptr;
+	hmm_buffer_free(buffer);
+}
+
+/*
+ * Migrate private anonymous huge zero page.
+ */
+TEST_F(hmm, migrate_anon_huge_zero)
+{
+	struct hmm_buffer *buffer;
+	unsigned long npages;
+	unsigned long size;
+	unsigned long i;
+	void *old_ptr;
+	void *map;
+	int *ptr;
+	int ret;
+	int val;
+
+	size = TWOMEG;
+
+	buffer = malloc(sizeof(*buffer));
+	ASSERT_NE(buffer, NULL);
+
+	buffer->fd = -1;
+	buffer->size = 2 * size;
+	buffer->mirror = malloc(size);
+	ASSERT_NE(buffer->mirror, NULL);
+	memset(buffer->mirror, 0xFF, size);
+
+	buffer->ptr = mmap(NULL, 2 * size,
+			   PROT_READ,
+			   MAP_PRIVATE | MAP_ANONYMOUS,
+			   buffer->fd, 0);
+	ASSERT_NE(buffer->ptr, MAP_FAILED);
+
+	npages = size >> self->page_shift;
+	map = (void *)ALIGN((uintptr_t)buffer->ptr, size);
+	ret = madvise(map, size, MADV_HUGEPAGE);
+	ASSERT_EQ(ret, 0);
+	old_ptr = buffer->ptr;
+	buffer->ptr = map;
+
+	/* Initialize a read-only zero huge page. */
+	val = *(int *)buffer->ptr;
+	ASSERT_EQ(val, 0);
+
+	/* Migrate memory to device. */
+	ret = hmm_migrate_sys_to_dev(self->fd, buffer, npages);
+	ASSERT_EQ(ret, 0);
+	ASSERT_EQ(buffer->cpages, npages);
+
+	/* Check what the device read. */
+	for (i = 0, ptr = buffer->mirror; i < size / sizeof(*ptr); ++i)
+		ASSERT_EQ(ptr[i], 0);
+
+	/* Fault pages back to system memory and check them. */
+	for (i = 0, ptr = buffer->ptr; i < size / sizeof(*ptr); ++i) {
+		ASSERT_EQ(ptr[i], 0);
+		/* If it asserts once, it probably will 500,000 times */
+		if (ptr[i] != 0)
+			break;
+	}
+
+	buffer->ptr = old_ptr;
+	hmm_buffer_free(buffer);
+}
+
+/*
+ * Migrate private anonymous huge page and free.
+ */
+TEST_F(hmm, migrate_anon_huge_free)
+{
+	struct hmm_buffer *buffer;
+	unsigned long npages;
+	unsigned long size;
+	unsigned long i;
+	void *old_ptr;
+	void *map;
+	int *ptr;
+	int ret;
+
+	size = TWOMEG;
+
+	buffer = malloc(sizeof(*buffer));
+	ASSERT_NE(buffer, NULL);
+
+	buffer->fd = -1;
+	buffer->size = 2 * size;
+	buffer->mirror = malloc(size);
+	ASSERT_NE(buffer->mirror, NULL);
+	memset(buffer->mirror, 0xFF, size);
+
+	buffer->ptr = mmap(NULL, 2 * size,
+			   PROT_READ | PROT_WRITE,
+			   MAP_PRIVATE | MAP_ANONYMOUS,
+			   buffer->fd, 0);
+	ASSERT_NE(buffer->ptr, MAP_FAILED);
+
+	npages = size >> self->page_shift;
+	map = (void *)ALIGN((uintptr_t)buffer->ptr, size);
+	ret = madvise(map, size, MADV_HUGEPAGE);
+	ASSERT_EQ(ret, 0);
+	old_ptr = buffer->ptr;
+	buffer->ptr = map;
+
+	/* Initialize buffer in system memory. */
+	for (i = 0, ptr = buffer->ptr; i < size / sizeof(*ptr); ++i)
+		ptr[i] = i;
+
+	/* Migrate memory to device. */
+	ret = hmm_migrate_sys_to_dev(self->fd, buffer, npages);
+	ASSERT_EQ(ret, 0);
+	ASSERT_EQ(buffer->cpages, npages);
+
+	/* Check what the device read. */
+	for (i = 0, ptr = buffer->mirror; i < size / sizeof(*ptr); ++i)
+		ASSERT_EQ(ptr[i], i);
+
+	/* Try freeing it. */
+	ret = madvise(map, size, MADV_FREE);
+	ASSERT_EQ(ret, 0);
+
+	buffer->ptr = old_ptr;
+	hmm_buffer_free(buffer);
+}
+
+/*
+ * Migrate private anonymous huge page and fault back to sysmem.
+ */
+TEST_F(hmm, migrate_anon_huge_fault)
+{
+	struct hmm_buffer *buffer;
+	unsigned long npages;
+	unsigned long size;
+	unsigned long i;
+	void *old_ptr;
+	void *map;
+	int *ptr;
+	int ret;
+
+	size = TWOMEG;
+
+	buffer = malloc(sizeof(*buffer));
+	ASSERT_NE(buffer, NULL);
+
+	buffer->fd = -1;
+	buffer->size = 2 * size;
+	buffer->mirror = malloc(size);
+	ASSERT_NE(buffer->mirror, NULL);
+	memset(buffer->mirror, 0xFF, size);
+
+	buffer->ptr = mmap(NULL, 2 * size,
+			   PROT_READ | PROT_WRITE,
+			   MAP_PRIVATE | MAP_ANONYMOUS,
+			   buffer->fd, 0);
+	ASSERT_NE(buffer->ptr, MAP_FAILED);
+
+	npages = size >> self->page_shift;
+	map = (void *)ALIGN((uintptr_t)buffer->ptr, size);
+	ret = madvise(map, size, MADV_HUGEPAGE);
+	ASSERT_EQ(ret, 0);
+	old_ptr = buffer->ptr;
+	buffer->ptr = map;
+
+	/* Initialize buffer in system memory. */
+	for (i = 0, ptr = buffer->ptr; i < size / sizeof(*ptr); ++i)
+		ptr[i] = i;
+
+	/* Migrate memory to device. */
+	ret = hmm_migrate_sys_to_dev(self->fd, buffer, npages);
+	ASSERT_EQ(ret, 0);
+	ASSERT_EQ(buffer->cpages, npages);
+
+	/* Check what the device read. */
+	for (i = 0, ptr = buffer->mirror; i < size / sizeof(*ptr); ++i)
+		ASSERT_EQ(ptr[i], i);
+
+	/* Fault pages back to system memory and check them. */
+	for (i = 0, ptr = buffer->ptr; i < size / sizeof(*ptr); ++i)
+		ASSERT_EQ(ptr[i], i);
+
+	buffer->ptr = old_ptr;
+	hmm_buffer_free(buffer);
+}
+
+/*
+ * Migrate private anonymous huge page with allocation errors.
+ */
+TEST_F(hmm, migrate_anon_huge_err)
+{
+	struct hmm_buffer *buffer;
+	unsigned long npages;
+	unsigned long size;
+	unsigned long i;
+	void *old_ptr;
+	void *map;
+	int *ptr;
+	int ret;
+
+	size = TWOMEG;
+
+	buffer = malloc(sizeof(*buffer));
+	ASSERT_NE(buffer, NULL);
+
+	buffer->fd = -1;
+	buffer->size = 2 * size;
+	buffer->mirror = malloc(2 * size);
+	ASSERT_NE(buffer->mirror, NULL);
+	memset(buffer->mirror, 0xFF, 2 * size);
+
+	old_ptr = mmap(NULL, 2 * size, PROT_READ | PROT_WRITE,
+			MAP_PRIVATE | MAP_ANONYMOUS, buffer->fd, 0);
+	ASSERT_NE(old_ptr, MAP_FAILED);
+
+	npages = size >> self->page_shift;
+	map = (void *)ALIGN((uintptr_t)old_ptr, size);
+	ret = madvise(map, size, MADV_HUGEPAGE);
+	ASSERT_EQ(ret, 0);
+	buffer->ptr = map;
+
+	/* Initialize buffer in system memory. */
+	for (i = 0, ptr = buffer->ptr; i < size / sizeof(*ptr); ++i)
+		ptr[i] = i;
+
+	/* Migrate memory to device but force a THP allocation error. */
+	ret = hmm_dmirror_cmd(self->fd, HMM_DMIRROR_FLAGS, buffer,
+			      HMM_DMIRROR_FLAG_FAIL_ALLOC);
+	ASSERT_EQ(ret, 0);
+	ret = hmm_migrate_sys_to_dev(self->fd, buffer, npages);
+	ASSERT_EQ(ret, 0);
+	ASSERT_EQ(buffer->cpages, npages);
+
+	/* Check what the device read. */
+	for (i = 0, ptr = buffer->mirror; i < size / sizeof(*ptr); ++i) {
+		ASSERT_EQ(ptr[i], i);
+		if (ptr[i] != i)
+			break;
+	}
+
+	/* Try faulting back a single (PAGE_SIZE) page. */
+	ptr = buffer->ptr;
+	ASSERT_EQ(ptr[2048], 2048);
+
+	/* unmap and remap the region to reset things. */
+	ret = munmap(old_ptr, 2 * size);
+	ASSERT_EQ(ret, 0);
+	old_ptr = mmap(NULL, 2 * size, PROT_READ | PROT_WRITE,
+			MAP_PRIVATE | MAP_ANONYMOUS, buffer->fd, 0);
+	ASSERT_NE(old_ptr, MAP_FAILED);
+	map = (void *)ALIGN((uintptr_t)old_ptr, size);
+	ret = madvise(map, size, MADV_HUGEPAGE);
+	ASSERT_EQ(ret, 0);
+	buffer->ptr = map;
+
+	/* Initialize buffer in system memory. */
+	for (i = 0, ptr = buffer->ptr; i < size / sizeof(*ptr); ++i)
+		ptr[i] = i;
+
+	/* Migrate THP to device. */
+	ret = hmm_migrate_sys_to_dev(self->fd, buffer, npages);
+	ASSERT_EQ(ret, 0);
+	ASSERT_EQ(buffer->cpages, npages);
+
+	/*
+	 * Force an allocation error when faulting back a THP resident in the
+	 * device.
+	 */
+	ret = hmm_dmirror_cmd(self->fd, HMM_DMIRROR_FLAGS, buffer,
+			      HMM_DMIRROR_FLAG_FAIL_ALLOC);
+	ASSERT_EQ(ret, 0);
+
+	ret = hmm_migrate_dev_to_sys(self->fd, buffer, npages);
+	ASSERT_EQ(ret, 0);
+	ptr = buffer->ptr;
+	ASSERT_EQ(ptr[2048], 2048);
+
+	buffer->ptr = old_ptr;
+	hmm_buffer_free(buffer);
+}
+
+/*
+ * Migrate private anonymous huge zero page with allocation errors.
+ */
+TEST_F(hmm, migrate_anon_huge_zero_err)
+{
+	struct hmm_buffer *buffer;
+	unsigned long npages;
+	unsigned long size;
+	unsigned long i;
+	void *old_ptr;
+	void *map;
+	int *ptr;
+	int ret;
+
+	size = TWOMEG;
+
+	buffer = malloc(sizeof(*buffer));
+	ASSERT_NE(buffer, NULL);
+
+	buffer->fd = -1;
+	buffer->size = 2 * size;
+	buffer->mirror = malloc(2 * size);
+	ASSERT_NE(buffer->mirror, NULL);
+	memset(buffer->mirror, 0xFF, 2 * size);
+
+	old_ptr = mmap(NULL, 2 * size, PROT_READ,
+			MAP_PRIVATE | MAP_ANONYMOUS, buffer->fd, 0);
+	ASSERT_NE(old_ptr, MAP_FAILED);
+
+	npages = size >> self->page_shift;
+	map = (void *)ALIGN((uintptr_t)old_ptr, size);
+	ret = madvise(map, size, MADV_HUGEPAGE);
+	ASSERT_EQ(ret, 0);
+	buffer->ptr = map;
+
+	/* Migrate memory to device but force a THP allocation error. */
+	ret = hmm_dmirror_cmd(self->fd, HMM_DMIRROR_FLAGS, buffer,
+			      HMM_DMIRROR_FLAG_FAIL_ALLOC);
+	ASSERT_EQ(ret, 0);
+	ret = hmm_migrate_sys_to_dev(self->fd, buffer, npages);
+	ASSERT_EQ(ret, 0);
+	ASSERT_EQ(buffer->cpages, npages);
+
+	/* Check what the device read. */
+	for (i = 0, ptr = buffer->mirror; i < size / sizeof(*ptr); ++i)
+		ASSERT_EQ(ptr[i], 0);
+
+	/* Try faulting back a single (PAGE_SIZE) page. */
+	ptr = buffer->ptr;
+	ASSERT_EQ(ptr[2048], 0);
+
+	/* unmap and remap the region to reset things. */
+	ret = munmap(old_ptr, 2 * size);
+	ASSERT_EQ(ret, 0);
+	old_ptr = mmap(NULL, 2 * size, PROT_READ,
+			MAP_PRIVATE | MAP_ANONYMOUS, buffer->fd, 0);
+	ASSERT_NE(old_ptr, MAP_FAILED);
+	map = (void *)ALIGN((uintptr_t)old_ptr, size);
+	ret = madvise(map, size, MADV_HUGEPAGE);
+	ASSERT_EQ(ret, 0);
+	buffer->ptr = map;
+
+	/* Initialize buffer in system memory (zero THP page). */
+	ret = ptr[0];
+	ASSERT_EQ(ret, 0);
+
+	/* Migrate memory to device but force a THP allocation error. */
+	ret = hmm_dmirror_cmd(self->fd, HMM_DMIRROR_FLAGS, buffer,
+			      HMM_DMIRROR_FLAG_FAIL_ALLOC);
+	ASSERT_EQ(ret, 0);
+	ret = hmm_migrate_sys_to_dev(self->fd, buffer, npages);
+	ASSERT_EQ(ret, 0);
+	ASSERT_EQ(buffer->cpages, npages);
+
+	/* Fault the device memory back and check it. */
+	for (i = 0, ptr = buffer->ptr; i < size / sizeof(*ptr); ++i)
+		ASSERT_EQ(ptr[i], 0);
+
+	buffer->ptr = old_ptr;
+	hmm_buffer_free(buffer);
+}
 TEST_HARNESS_MAIN
-- 
2.50.1

