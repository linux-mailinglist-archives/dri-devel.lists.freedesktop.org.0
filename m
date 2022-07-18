Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E541B5788D7
	for <lists+dri-devel@lfdr.de>; Mon, 18 Jul 2022 19:52:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E97211B53E;
	Mon, 18 Jul 2022 17:52:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2070.outbound.protection.outlook.com [40.107.237.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6196E113F5B;
 Mon, 18 Jul 2022 17:52:25 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MRCh9YJEm+VQ+eOb+bIf2suIFalOR+OPWO8mRAmO7aZhDjI8DE/BfbLgh5E5h70m5dV5PFNv06WQT4TShlf9mAUVEr3ZnZMCqOwf9X9WcgZKIY/4NgzoMIcjpZD/J3k81Uhg+5sFMcGFLCOuMvMRIv/RAwG7SwcyHwc95z8h6MUeTS9RkKh2uqOK2mawKlvn8SzKLaRh6AnCyUgu/XcgUCZz/Kf0w84WhPTbE8VNTI3nNk3i3OSjI0qmu9I7RVeGqDjkZGt47WeBItu36SS6+bxJe5w1Xz6sd/8m8b67K8f6PH0r/epmpZfvlX/d3S6sz82Hk1PEnTzl+evfSHe35A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0Pd+w8Zah9Znc/GpIsVWBx4pOGdDnaY3PdhP3E/MkIk=;
 b=lk4UbZEI+inaHzivSg8rITo3URkwG8jxqf4LkywIFTjgBiMuMRDYd/wS/o6W3FTNbpZSDPLdddD1qLm5GDMVFoWVPxr49g/AnuY+d/Fcgaq9fXplRbpPtWJP27HdMpwEfRCd2F9URTDtSvKebbVLYGpBuTBUd/WtwavRMTUXOo4msC5mgqwcDZdcKU4/T6A7UTsy6FysbDuaoHqYXSPDMj4nngtTTNYZ4wemHyl4mWE1RRPHabXOCQIP/CkPIL7mN/9wbWH9llRMPGJ1XRwjMxue3q/zGJXceIi2wNjJyT2V/D3kySWc8aRm977ebfKQOcwyKktLDvK0Kp50bU9YGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0Pd+w8Zah9Znc/GpIsVWBx4pOGdDnaY3PdhP3E/MkIk=;
 b=A3NgrUNixCbjiXzs/11giT+LDM49heTNY6JB+J+MeVj9n+F+gKfVzNlCHVt7gsSnJ745k4ntB+8JD32aSGtfUQO5G1NaejBEav5qucl3Nh1LkCVsYVew7c1tWkkuRU2R8O09Z/mPvpw+iRS8sNnTuI+/4zBCOhqWU6BuluyRSDE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN9PR12MB5115.namprd12.prod.outlook.com (2603:10b6:408:118::14)
 by SJ0PR12MB6967.namprd12.prod.outlook.com (2603:10b6:a03:44b::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.26; Mon, 18 Jul
 2022 17:52:21 +0000
Received: from BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::b096:31c:bfb7:fa0a]) by BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::b096:31c:bfb7:fa0a%4]) with mapi id 15.20.5438.023; Mon, 18 Jul 2022
 17:52:20 +0000
Message-ID: <f6834736-3b68-d6e0-ddb2-9d51b8e720b6@amd.com>
Date: Mon, 18 Jul 2022 13:52:18 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v9 02/14] mm: move page zone helpers from mm.h to mmzone.h
Content-Language: en-US
To: David Hildenbrand <david@redhat.com>, Alex Sierra <alex.sierra@amd.com>,
 jgg@nvidia.com
References: <20220715150521.18165-1-alex.sierra@amd.com>
 <20220715150521.18165-3-alex.sierra@amd.com>
 <12b40848-2e38-df0b-8300-0d338315e9b2@redhat.com>
From: Felix Kuehling <felix.kuehling@amd.com>
Organization: AMD Inc.
In-Reply-To: <12b40848-2e38-df0b-8300-0d338315e9b2@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: CH2PR04CA0013.namprd04.prod.outlook.com
 (2603:10b6:610:52::23) To BN9PR12MB5115.namprd12.prod.outlook.com
 (2603:10b6:408:118::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5f887b3b-142d-4e3e-0a75-08da68e64349
X-MS-TrafficTypeDiagnostic: SJ0PR12MB6967:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: yvVlLxdLDWraEvCjSv2wRtUUXR5eeYaqx/0ocwqZOQBo4SwKRxBpYDjfZCbXUjCx5ow1h5YUKVp4QLzkRFCYrhEv2oUuDK1nSYYdLXENxzr2ZUNnjggqVB2i+aLVWywpjX9e6g2Cd7iDGOvCSLFqllE4Ma+iyM8D2Tdr7zolc7xBwfKsqq7CDOoPEXcfTTYzqTgnBHU6P57+2dNGQuH6+7ARG7RwaVLfcncK1dFlitSrobT/U9zt/tMa9ksdG2vyWvVHnAe7EDVa2XSUhB3i1kaVbROaXZVldX6/oCKXz8wVSmIll/4q2MioegWiR2M4jWSiOE9RibBHmnTIj9kUj5Il0zPKWmJ6DHvy9TSDFC5rNXueOKkyhhdndUSN7y+juSrrVtC9KHB/y5tuqi32Bj5grl1b9j93Lqu0PXGfwbm93v864PMEnayl+BWylqwcIq46nsEcO5ECypD44Isen/nLLNTOsAmNQXGwOOAxU6nhxLrzrNrnX59CYQbTRft+6FPeReUP5aHYFvPhIQUeddXGG1NaReQBqUaRqO6ZU7BtlAYjYv16FskCzJ/0N+KyUJ+CC6G7PSu/xhb6Ljl8zYW2MiuJwrFZ3jiXjyd6it4aWRHVWIsdCSJmydtE2S8+gRkXIXX7oeYmZyn6ce+GtCZ3qJU4LESvmkWxBDCL69YCGGVVby3yM1oK0aiTiPzlsci/2h9uYxpDK2/VLPSRO4PGJsfU57N1f/vzmJ4kHHFPGYTNrwzgIyZRe5KqRxmZcS1/m1AEPK47/IOw1xNY3e+onSA+7AhlvKBzOgSECNc3YP8Oq/Luh7VWEPJvrecuq8/NJ/Yta+uVnJh7KKxlfGTe7+UU1M4eXhUQSEuL4ls=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR12MB5115.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(136003)(396003)(366004)(346002)(376002)(39860400002)(66556008)(6506007)(6512007)(38100700002)(5660300002)(31686004)(53546011)(7416002)(8936002)(4744005)(2906002)(36756003)(44832011)(66946007)(26005)(2616005)(8676002)(4326008)(86362001)(31696002)(478600001)(316002)(66476007)(41300700001)(186003)(36916002)(6486002)(110136005)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eDUxNEd4bHFQcy9XTnpNaEJReVpKbVJXeU80aUhlcU4yemExMWRrZXczVjJa?=
 =?utf-8?B?OWw1YjhKSDJUMmdQbkJ3ZHdCVjZHa1g1NkRUVldtMEVnM1NVYUhQeUNpVmxa?=
 =?utf-8?B?MTNwcWQ2TlpwZEtpV3E4ODRSa2I4bGFCVmkvYlZmQWNaQWJ5QkR0M09xeGtO?=
 =?utf-8?B?eU1jMnlGTmV2dlFlcDhMQmRKOG9IbjVCTXV5K2YwbmdwR2FYVkUwdGYrT2Uz?=
 =?utf-8?B?dUhjR05vNWl1d0haSjV1SXk1clVlbjJhcGdRZXUyZ0NmK1M4WDFBSmdhZ2pS?=
 =?utf-8?B?Mzl4WG9UcFFaSTF0Uk5EOTJ1SENaVW1IK1BjbWhkNlRMdHRiTnNlTnB5aW16?=
 =?utf-8?B?SW5pb0pXQ2M4Mm9vd2pBVno3QVhxWUg1NFM2VEhxVWd0bVJrWkMzTXNLMjg2?=
 =?utf-8?B?L0llQnN6bitqSndxZmo0L3EvTG1vcGVxbVN5NGI1cTFQY05IMGFiUTdteExI?=
 =?utf-8?B?azBPejZyYmhRSEFOaTFKeGxsNUxUUStoQU1oay9sVEVURGRmYjlSRVBhVHFp?=
 =?utf-8?B?M0ZXMkpBTGhLR01aU3NPcnVMT0ZwVmpkekhiWFc2SWV3SnF2RjU3aDFlbU1o?=
 =?utf-8?B?cjhXYzhGSVQ1Q01YY3lIUE55aVBpbncwc3A4bTBmUVY0ZVFwY0tteldnVjZU?=
 =?utf-8?B?akJvbVpLcUhVZEVza2xzYXEvRXV3MTY1eERXcXMwQXNZbDM5cEkzUnNTTXdq?=
 =?utf-8?B?WVI0Ty8vaUtxbWpsWHpxRUxnREJRZUdYajRjVWgvKy9HQ1pvRkMybnFXdmQr?=
 =?utf-8?B?UGg3SWN0WTNxQjdIdEVsdjVNQkI2WWg4WWt1SWt0OFNHYkRSLzlnNXp6c1ZH?=
 =?utf-8?B?c2JUd1ZRd0hyMnNLc3lJdlRTbStWUHR2N0twRGJ3a29FdGErNU81aVdVWngr?=
 =?utf-8?B?Y0laYlViMGF0NkdmMlllWHowelFVLzlhSmNML1lhZUVhZktTd2lCTi9zOEVn?=
 =?utf-8?B?dkJtZTZGZFlXdUIzYUNmRmNuNWlnSVVvRHRIRmNZSWJWRTNZZis2Q2xwREpt?=
 =?utf-8?B?WC8xbzZITldtcmdocG5pUCtUZ3lVNFRTQlU3c1ZsbmpJditoTHNqSUNZOGFs?=
 =?utf-8?B?aGNGMVNJcVlYbXhiZW51aWFJaFhBRUVEZGNFek4vMGhKeEIyR1I0LzVsRGRk?=
 =?utf-8?B?VVZqbSt2cW9zU3hLUmk5NUVrZHpTam90Tzd3RUlSdlRrNW9LY2JvcFhwa0c0?=
 =?utf-8?B?YnB3V0VqTEJNMHpqK3Znclg3REFjdXgxWnR5K0dDck01dU9TZnJ4SkljSXpJ?=
 =?utf-8?B?RlNuSEZ1cDlZeFdDSkZTeVJWN2RNVlpYMTlHVVV4L2cxQmtmSlhtQWl6UUFw?=
 =?utf-8?B?eHpRV0JHUUtPMUJhZHhNMHJyUVowWW81d3RMOXczaDBDNVd6UHlUYWtVNlBE?=
 =?utf-8?B?U1hyTlBjVk9BelI0Lzk1eXZkRmVidk8zS1g3R3dnL1dWLzIxa0JEay9GQ0E1?=
 =?utf-8?B?UjN4K1UwSjRFbTVBYXZBeElpcDNtTEFqek5DZUtHY2tyYkpTSys5VG85ZDVu?=
 =?utf-8?B?d3FwT2s2NjFIWDdSU3habnJDc0J6am44ZzVFdlFaQTgxRVZiMmRHaWN0UlF5?=
 =?utf-8?B?UzJaVWJhUmVUelFoMTYxU205MkV1WGpPNHRHWHo5QlpFWnlteUVHTVFqTXZU?=
 =?utf-8?B?b1h0RVBKdU9wYWJNSmZyLzBYRXBtOXFuZ2pxc1hNY3lCQk92VjlIRGJCKzRK?=
 =?utf-8?B?OUlDMWlYSml2NUFpZzR4aVpkWkVLRHdENWttOTRxc2NnRG15V3d2NFdBZFFv?=
 =?utf-8?B?Q3dHbjFtd2RQdXNZRFgxRjgvbVNEVjZzTVd5NUtZQ1lMRjJHa3RsQW9zcUZI?=
 =?utf-8?B?aHpUNWV5R1padjNOWEIvMVlTc3gybU1pV3FOM0pKODFCcHR2QjE4SXdyVWN4?=
 =?utf-8?B?aHpHS1NhVUtNV1ViY0dJeFpjNkZTams4MkJYZzM5QmgrTzBlNkpEZ0Z1d2ZV?=
 =?utf-8?B?MVBrK1N4cVp5RFFDSFNycno3ZDZJNUJJVGt3Y0NwYURkcWU2ZDB4UWg3QXBv?=
 =?utf-8?B?Sk5Pdkc3L05CTkNocXBhV1c3SitLazA5STh4dFk3aC9PMmRCeDJTcmE5c29v?=
 =?utf-8?B?K0lsTENqNkxNOFJUaE4vaFUwK2laNDhQUkZTbmZGUnFhaVZLYjNTcjl4Qk9z?=
 =?utf-8?Q?wq4Wmm+xTf6RIhp34vB7OTsN9?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5f887b3b-142d-4e3e-0a75-08da68e64349
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5115.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jul 2022 17:52:20.8535 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DQ5HwFzeRPDCPLbZqaFF68hRb8m+VDb49rDhIirF2hK+9ome5bGI5mFztWjzDcSwDIuF+ywQzRUa8uAinmISwQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB6967
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
Cc: rcampbell@nvidia.com, willy@infradead.org, apopple@nvidia.com,
 dri-devel@lists.freedesktop.org, linux-xfs@vger.kernel.org, linux-mm@kvack.org,
 jglisse@redhat.com, amd-gfx@lists.freedesktop.org, akpm@linux-foundation.org,
 linux-ext4@vger.kernel.org, hch@lst.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2022-07-18 06:50, David Hildenbrand wrote:
> On 15.07.22 17:05, Alex Sierra wrote:
>> [WHY]
>> It makes more sense to have these helpers in zone specific header
>> file, rather than the generic mm.h
>>
>> Signed-off-by: Alex Sierra <alex.sierra@amd.com>
> Acked-by: David Hildenbrand <david@redhat.com>

Thank you! I don't think I have the authority to give this a 
Reviewed-by. Who does?

Regards,
   Felix


