Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AAB09413AA1
	for <lists+dri-devel@lfdr.de>; Tue, 21 Sep 2021 21:19:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B37E46E5B9;
	Tue, 21 Sep 2021 19:19:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2043.outbound.protection.outlook.com [40.107.237.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 49FCF6E5B9
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Sep 2021 19:19:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LhVklMHo+wx62hGNfaPE9+JO1MLJUGzB2RX47ns0Zf+iC9qcW6WQlEqelB2RRXq7X0lnMq8/mFr6lqLcdpUHSUCs5XD2BvRz+FcOV1RlaZdpAJJVlRd3XI/8Rc71SxC2AJasBIkRrb/3kib5LPXkHmRxBItjbI9Kqao0cTxWcoUiFf2lojpDHiQ7cmmpz98m/qCAwEN0HSU52IOJi4oLt43c3u0Raw/s67PswknRAeV0WF8pw88vmDuo6BM0lTb0ShsqayleiNdkkJCTATql6PnY2KOdh/hE3efSN1c0iAitbF+FC18lujW7G9kv9AAZ1VKT6zoDt8Kb2NAFzBO+7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=y/TqFwxeQCyR5KLnSavJs1SkVVNnlySJYc7vA/210c8=;
 b=TkZipc6A+jpQTl61ir8RnHZWzeU6MEk/5Mc4uF7eQ9yIJSALJRgTvahNf/ky9sIEYrupPENxOI2+ARjThCPwA/g+PPdbOEDI70ovUmFhWtNOcWncI9fgH4MgdFTIPZ2qTPJpLYlqjag629db5u59MHbHiwndrNa9Cx1iWyrVjRrfZGwOn56qQoJYAdTrL16DhOqNoKnLzJwa2mnAUvM6Sp4u4a92IP9xPBpajESB2W1QOhTst5xu6DfzQjvXLSh+9/27kYULlQmdpDQbHBe+3As0j8vQlqViGc4obj9P7su7qj8AUzK06D3Gf5XnmIJCaKDJ5XwlURuzcZDhthhioA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y/TqFwxeQCyR5KLnSavJs1SkVVNnlySJYc7vA/210c8=;
 b=L60nlBPeTwYj/R26+br4dNUXnAbCWzn3u8LzcNUZJfksQOxf3mDX75EahOK05qE6/3Bb3aeIvqm5PUhZIH0qusvFlkMVoPP+h5sy83Pf/SbCU5Om87dwlvLXCk8eb32HKuiMx3IKKgLqbMdl1nF5ILO+7QByTld+awHoB6Bxqs4=
Authentication-Results: amd.com; dkim=none (message not signed)
 header.d=none;amd.com; dmarc=none action=none header.from=amd.com;
Received: from BN9PR12MB5129.namprd12.prod.outlook.com (2603:10b6:408:136::12)
 by BN9PR12MB5164.namprd12.prod.outlook.com (2603:10b6:408:11d::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.14; Tue, 21 Sep
 2021 19:19:04 +0000
Received: from BN9PR12MB5129.namprd12.prod.outlook.com
 ([fe80::94bc:6146:87a:9f3c]) by BN9PR12MB5129.namprd12.prod.outlook.com
 ([fe80::94bc:6146:87a:9f3c%5]) with mapi id 15.20.4523.018; Tue, 21 Sep 2021
 19:19:04 +0000
To: Linux MM <linux-mm@kvack.org>, linux-ext4@vger.kernel.org,
 linux-xfs@vger.kernel.org,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Cc: Christoph Hellwig <hch@lst.de>, Jason Gunthorpe <jgg@mellanox.com>,
 Jerome Glisse <jglisse@redhat.com>, Ralph Campbell <rcampbell@nvidia.com>,
 Theodore Ts'o <tytso@mit.edu>, Andrew Morton <akpm@linux-foundation.org>,
 Mel Gorman <mgorman@techsingularity.net>,
 Peter Zijlstra <peterz@infradead.org>,
 "Phillips, Daniel" <Daniel.Phillips@amd.com>,
 "Sierra Guiza, Alejandro (Alex)" <Alex.Sierra@amd.com>
From: Felix Kuehling <felix.kuehling@amd.com>
Organization: AMD Inc.
Subject: BoF at LPC: Documenting the Heterogeneous Memory Model Architecture
Message-ID: <23aeacb6-0cd9-d10f-76bc-3c9d33905daa@amd.com>
Date: Tue, 21 Sep 2021 15:19:02 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-ClientProxiedBy: YTOPR0101CA0001.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:15::14) To BN9PR12MB5129.namprd12.prod.outlook.com
 (2603:10b6:408:136::12)
MIME-Version: 1.0
Received: from [172.27.226.80] (165.204.55.251) by
 YTOPR0101CA0001.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00:15::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.13 via Frontend
 Transport; Tue, 21 Sep 2021 19:19:03 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 74288d7e-5bd7-4ecf-87c8-08d97d34acf7
X-MS-TrafficTypeDiagnostic: BN9PR12MB5164:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BN9PR12MB5164FD655B8ADA29D896530392A19@BN9PR12MB5164.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: lU4s4ejjeRrj/j4IdgYIh+UfjtAJkBjSobKsrLFuAQiWagkJy5kpJgakkjF8R26VWhIfvqro6S9ljH6ShLN4cCdKnWjuVEHPhRzH64R53CRMEt6REk86O8n+DaQh6QxNDU89B/IjftJOLj1Kx1aJpEsHZ/Vj7hscWq2NLvecDOCpL06mgbfEHBWlZ29VfPE6YA/XoVbItiVOe7NEkAauAG2HAWWDd6HVWoUkT3GE5tgDvan7QbDTG2uendTzvrfmgSSBAVxREGufVUcoo3shhbFM1cU2n94GbyEBzd6oJWXUbVqrj+5Td6ngixQ9B2caEiBzYHvaD+fAxNz/CFjxNW1FJ6VZJ2etVeud0hub0hYLF4rVUCTZnCOT7TSoXgcgJ7bYv/o2zwkc2tMBnDq4UdmFqZjh9UD+yEPcTFuQ2UHSlsMo/Ys2Y8wwUpERTMFIw6Y67lwhkvPd1rBRasmGU7DoQNesv7dFCzb9asbim1z1nLA4ue/dqgjqcAQ/Fs7cQ1SwJLBZ1xiCNxk1xtna/axoHBeibH6h4N6+FrsfEU5nW/APRHDxZN+lN8AAbFAJEO8H63DL7W7S/Y4yyAs5+9/OeiEeunPYWzE7vVl93NqkN0qR6B2AY1NEpJ+j6DJUSI7yeBNIXb/8hjD0QpZlnQaET17GChR/75I5/DmIaU5Gj0ePkvVYl/K9zNlVeNaFm82EtmSHLTzrU3mJ0iraqQ/mb1Jd5xFGs5SIUqtA9NsbcfY6CuGnUpYVhVmpzykkfjF2GvB2s+qLCyrMaSd2QFZXNajfmIqxA0fOUE1bTDVqigY9tuFs4ww5jkNBga9D
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR12MB5129.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(7416002)(31686004)(2616005)(2906002)(66946007)(6486002)(36756003)(5660300002)(4326008)(44832011)(16576012)(66556008)(86362001)(54906003)(38100700002)(8936002)(186003)(40140700001)(8676002)(508600001)(31696002)(26005)(956004)(316002)(966005)(66476007)(110136005)(83380400001)(36916002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Y2NrRnI5cWtOTlJsV1lwbkFmcmc2U0RUVUNiTjc4OW9IOUNlbmdobHZScmxw?=
 =?utf-8?B?Z1ZWaGhZWGpaeTJMY3lyQWFYRzNVUzJRTmFJK1BJdjVEaHQ0SWlpZ2F0MXBs?=
 =?utf-8?B?R0Uvak91QkdDaEgvZkVFRDU2aWxNZ0FMQnhDZ3d1czVvdGVVWlBrQ1lRTXps?=
 =?utf-8?B?eEVOdkhSZ2kxc2RSN1dUNWJPVW5jWklud3FKWFRnbWdsdXdQam1IN2RXV2cv?=
 =?utf-8?B?RnlOUlJqRUpPN2dHZDhMR01DbytPNGpESmU5Rmp4L3h6UjhVVERGamxCeGpy?=
 =?utf-8?B?ZCtES1pBUFJjMWRkSk16WkJiNXNFWU44enJOMG1Ec1dHRVFFQ1ZjZjFvdE1H?=
 =?utf-8?B?UmZMK2tHQ2pLWVRFRVRhL1k0UzhDMThkSEFFZ20vY1gyNU9CbEpXdFovdEIz?=
 =?utf-8?B?dmQ5TW8zVEdzUGJ1UXFoUEt1cThHNzlsenl6Z1NOZ25OOFo5aDhEcTVvRElj?=
 =?utf-8?B?NGU5UWtVK3E5SjVGYmJhUjFJNzBCc3pmazFtbWNrbjVhYnZMSWJUYnZuNnpW?=
 =?utf-8?B?eHl2dml5Q1pzYWpYNzd3N1hJR0x5RTVYdlFWaksycFNDc21MSHVYWHh3SUZ2?=
 =?utf-8?B?dGQxSyszc2R4WnE4emRIYUp1WFhMZTJBb2JLdC8rMG9DSzlsdm5zTEVIbWhD?=
 =?utf-8?B?RHYzUWJSU2hLUzhLL0d3Y3BCS3FtWW1yL0pxTlc5K21hRzJRbDZIVkRnM0kw?=
 =?utf-8?B?U0RtYjg1VWJIKzZZWWV6Mkk0MEU3Q0JpbU82c2dzbktZZDgwQjl4L0VpTVF2?=
 =?utf-8?B?U2hrRnR1ZVRHRDBDZ3Yvd2hrMElsQzRVVGVMY3N2R0pVUEwyTGRYWXo5VUZN?=
 =?utf-8?B?aU1hc0htMm9COERYMHRLSmxBNXY1M01RTFM2a2hvUjZ5b01NNUIwSEN5NkY0?=
 =?utf-8?B?V05JVWJHTTgxckdHVjJ3R1JUTndHWUJhN1NCSTZIeU5FK2EwQzI0UTdaS0x1?=
 =?utf-8?B?TTMrUWVtRDNhbmVQVUg5WStUaUp3NDZMNDF5dmx1d2lsT2NyY3hzRTBGbXJR?=
 =?utf-8?B?TTk1K3RzdWpHNjlHL1pEQmZtSU12ZWRwbEFtWVN6aTVCeEdJMTZ0OTZLamZr?=
 =?utf-8?B?aEI2M3VCVkhpek9LQnRnbDFzVFdBSmJTc2UwaS8rb0M3bHZDUHhta1lsam5q?=
 =?utf-8?B?OU9QQXp3MGh1NEl4bDRma1FNRXN1MklRTmtnSFpEZld0LzkzNTVCLzhRMnFu?=
 =?utf-8?B?aVFsRlJodlZtcmtTRXdiaC9ETWp6WEhNZS9XYXV2SzZPZzc0ZDFDS3BJaEt6?=
 =?utf-8?B?WnNKR3JsbkQ5TkI1MGsrb1JOUHBBMUxicHZMUjZ3ZHNHVDhLREN6a2Z1K25K?=
 =?utf-8?B?dWpUb2ROQmpzN1d1amdQdithSlNRRnFuY3BzMHNVbk5qcGw1Y044SnRDdmIv?=
 =?utf-8?B?MWg2U1ZTYlBQK3BSSE8wV01aa3BSMmU2cjh0SWtrelAvaGRQY3RGZXZIdGhI?=
 =?utf-8?B?aGdvVVlUODEvRkVCTldCZ0U3aDNLOFdUbURsa2wzK0RrM2ZOZUJtbGZkSVV1?=
 =?utf-8?B?NHJUOWhiVEl1UVNtcDY5YnRCLzdlbVAxQWxaZzNPN1krc1R6TW1jZXc5RXJM?=
 =?utf-8?B?OWFpU0Z4bGFRRUozTlZNdFMvY1RkMk1ESEdRS3luMENyWlQxb2dlTy81RHFZ?=
 =?utf-8?B?MU1yUlh5SFhMRFJCamJwd1FWL2xUOVdYTE02T0pKdTc5L1o0a2xCWStyRkIw?=
 =?utf-8?B?MC8wWDVWc1M5MklOdlVjUlM4NnlJRE5mOGVBb1VvMmdhc1cyYWx5V2FrbWt5?=
 =?utf-8?Q?+ke+ldMAZ7o/xHX1FKBSudpHfMmQ8zZZUV4No2q?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 74288d7e-5bd7-4ecf-87c8-08d97d34acf7
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5129.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Sep 2021 19:19:04.5281 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ois2xtszmJ0ReJrway2yveG4YI3UOoCTF2VnGT05EKRMB/8gdqCnymvyceFZ/k+7/O2psdcdVQAHNE0qxdEsmQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR12MB5164
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

As the programming models for GPU-based high-performance computing 
applications are evolving, HMM is helping us integrate the GPU memory 
management more closely with the kernel's virtual memory management. As 
a result we can provide a shared virtual address space with 
demand-paging and page-based migrations of anonymous pages to/from 
device memory. A patch series by AMD [1, 2] to add support for 
cache-coherent, CPU-accessible device memory has brought up some fairly 
fundamental questions about HMM and its interaction with virtual memory 
management, page cache and file systems. We'd like to use the chance of 
getting together for a BoF [3] at LPC to raise awareness for HMM outside 
the GPU driver code, identify gaps in the architectural documentation 
and clarify our priorities for future development.

Thank you, Daniel, for suggesting the BoF and getting it scheduled. It's 
set for Friday, 10am Pacific, 1pm Eastern, 5pm UTC.

I am registered at LPC. Daniel got a speaker's pass. We're still trying 
to work something out for Alex.

I hope to see many of you on Friday.

Best regards,
   Felix


[1] https://patchwork.freedesktop.org/series/94611/
[2] https://patchwork.freedesktop.org/series/90706/
[3] https://linuxplumbersconf.org/event/11/contributions/1123/

-- 
F e l i x   K u e h l i n g
PMTS Software Development Engineer | Linux Compute Kernel
1 Commerce Valley Dr. East, Markham, ON L3T 7X6 Canada
(O) +1(289)695-1597
     _     _   _   _____   _____
    / \   | \ / | |  _  \  \ _  |
   / A \  | \M/ | | |D) )  /|_| |
  /_/ \_\ |_| |_| |_____/ |__/ \|   facebook.com/AMD | amd.com

