Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 54D928A6AC8
	for <lists+dri-devel@lfdr.de>; Tue, 16 Apr 2024 14:22:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7CD2D112C24;
	Tue, 16 Apr 2024 12:22:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="0yAJ/28M";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2073.outbound.protection.outlook.com [40.107.93.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 15DA2112C24
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Apr 2024 12:22:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DyAcoNjWmrcQ4aZd3/T8COubRsiWiBLF5+VzjG9sre8yihMEypzJ5o2qoi55qOPT3ddysCWzQ5hWrkyQZqq5wG7L2l1XBxvTicgtFE5VRgDNpM4OWNmcedB4o02qYKgU27cBpxLAw8SscNzmPJ0dv0abF7cykJKHRN6AOIP/+SYTScYCxqXBKzPIjlugGcw5ubF22GP1crOgsVSg7VB3bkxW8+p6tRXgfLHt5NMfdmNna7Cua5uJuZkCkpHacqD3Hb31wxQQtpaPeLQNB5Q43WVmaQvoeuTeBZjxvjOL5vERyaV/fb0FR2B0egjC9rJU47Smwg6jfnlZXxsANJ6qvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p6TIrPwGTSXtO33z8XwYrmuk90KYilUmr134T/ICM3o=;
 b=oV+FzkMYoT88Gq4xd/eH43FnFb8T1o4TBJmJ6CYd7Dz0QUH1L5Ps9UvdKfRziBSUfuf9du9LmCHNcfJskWUp/ZppYuvPYfwPV0LlEVKfI8p2j9mj2hDQPvOdyYc0dBx1wv+M6iwLBULQ0kpg5785p9SMzD48QRolr/ki5T5E9VnAO7gzEebfuTLN/T0QVcsL4Hw3s9H0lN+jvVA3VizauSJgj4VsK20GxRR4E2x48yDdelV8N8mz5Lmg8uroPch+0jN/20iAt9wR+A8izuo/3TuwicVQfGpRBK8OA6KRkxwYOVH3pGh45TrpcPtmhkKMfUokN1HSBZjtSsKVVZAknQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p6TIrPwGTSXtO33z8XwYrmuk90KYilUmr134T/ICM3o=;
 b=0yAJ/28MYumMS+7yL9TNZm/UkQsSAMmcVhSckefF7ZkZ3eMkAbXKcyI5rYZlAm6Fyk5xflwgFQJjCEBlWgeRsIEYFt8BV1H3mD1694J/fwS39G1XCbw1+DkV2Z+vmSCIyOkcPSPvceYgLuEIk3+bNmVu7x81+2mvgL8eEll35+8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB3897.namprd12.prod.outlook.com (2603:10b6:5:1ca::24)
 by PH8PR12MB7136.namprd12.prod.outlook.com (2603:10b6:510:22b::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.50; Tue, 16 Apr
 2024 12:22:05 +0000
Received: from DM6PR12MB3897.namprd12.prod.outlook.com
 ([fe80::42d0:ec1:3bfa:d3df]) by DM6PR12MB3897.namprd12.prod.outlook.com
 ([fe80::42d0:ec1:3bfa:d3df%7]) with mapi id 15.20.7452.049; Tue, 16 Apr 2024
 12:22:05 +0000
Message-ID: <dac5dde4-60f2-cc2a-1ed8-b579b1c32cd5@amd.com>
Date: Tue, 16 Apr 2024 17:51:57 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v10 5/9] drm/ttm/tests: Add test cases dependent on fence
 signaling
Content-Language: en-US
To: Karolina Stolarek <karolina.stolarek@intel.com>,
 dri-devel@lists.freedesktop.org
Cc: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Amaranath Somalapuram <Amaranath.Somalapuram@amd.com>,
 Andi Shyti <andi.shyti@linux.intel.com>
References: <cover.1711117249.git.karolina.stolarek@intel.com>
 <8a9a650b897a75612d6e1107f5961413222a856b.1711117249.git.karolina.stolarek@intel.com>
From: "Somalapuram, Amaranath" <asomalap@amd.com>
In-Reply-To: <8a9a650b897a75612d6e1107f5961413222a856b.1711117249.git.karolina.stolarek@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN3PR01CA0170.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:de::12) To DM6PR12MB3897.namprd12.prod.outlook.com
 (2603:10b6:5:1ca::24)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR12MB3897:EE_|PH8PR12MB7136:EE_
X-MS-Office365-Filtering-Correlation-Id: 09d2a3c5-8452-472e-c066-08dc5e0fd3fa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 6XMez1jKg30bHM1oQs60YL6LVM+HVb4F8+ZvS7aPBtRX5O+DyO5pn53EIAw3Ys4UvT4Ua9fjuljjFsOb6e9VWjL3PK6CRpdhr15XTE5e9CM27mBcJGXd8Q/QESU/hWqUD29+7vff5YTytUC108qLsKQ38sqTSPY5sq+/9d0agJiKc+rhiXcB1p5OhDUdkUXWgnAmW9ICUIh0Bs7CQlqmqaX/Q4X34gDXOS077xUzucHSJW7roUu5AXS+Pq+yYkvQaeVJuJeiRODPkf0WFLKyCp61hB+JEgwvF9mbGAJ7mNF5JOtRrAraEGdPZ7QJb9KEenjJqsusx+9QGKUs08vPQTljCihXki/xgs2+o+iWV7ExHa75sqMOKRdRJ4c7dTGMIRKX8nPUZLnrrYen9s/AHYYzLpch00YWGZVOzc1kGSV09FHu/rLIdSYQu310sNzFELZ+T00aBBP2whHSPkI3JXkVaEsalUwU03M1QxljBCekqa4Mn2qRpXGXVBIWrtNEQQPh+2qYC3U1EJYnj8strel9nWx6uEqHwqDWyKd5eBHZoqpQ1hDI6eVnYsW22fnVSjGVcowT96nprq/OvxS7VAtSBX/Sb3OuihqPo+21/52Ne43qFLrkY/VWWZF7ysheScB6Py/vTuGtkU8/L1XQMT6ckqN6lVpFfMFQz/wKJwU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB3897.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(1800799015)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NWZhMmVsODFZV3ViVGJTK3Q5TDQ5OHZISkdzTEkrS0lrSWlySWVHUnFIUW84?=
 =?utf-8?B?NVFDVkFHMFpjblo2c3pMZkZZOEV4SXkraHFBSXBBZE9xQXpOYlh6bEttNnYz?=
 =?utf-8?B?OTA1cS8vQVpWZWpjc2V0RjluTHdYdzJYdm55TFdFRy9xNlJLZGhtN2NzdDdV?=
 =?utf-8?B?SDYxNW4yei9yY1lQOWgvV2lwUUpqdWVEdExLTW1VYzNaRUxIU2RQTGlGNUtF?=
 =?utf-8?B?MmE3NEdqTmU4dndCaGRmYkxHT1RIL3RFdGhTSjFRUW9rM09UNEFKeUQ3MTN2?=
 =?utf-8?B?RThJR0NTU0NTYS9hcStqL1orTDJERFJiRzc1Yy81NzYvNFN2YzBkcVd5QmxF?=
 =?utf-8?B?dWs2SzhaMVltL1kzbzJGQ3plQmZxWkJDSWtyaS9qWDZ3RDNJdWI5anBJSkRF?=
 =?utf-8?B?K09BL3JHVVpLdG00Y0RBczdVYkJkN0dZNzRINnVXYnF1Qjd1Zk02WUhGdG1Q?=
 =?utf-8?B?QUp2V3IzUEZMOXA4Z1NwZjlpQWIxMlNFeFdMaDBBY0ZPa3JaNnV2a3VkeVJq?=
 =?utf-8?B?dEdxRTZ5MHVzTmNDZmJEQWVFa2VFTTRGUEgzWGUrN1FGSjZlMSszZ2Nkbmkv?=
 =?utf-8?B?UzlRMFlndUNjOHFZWUFwZjdpc2doMDVzcDJvZGsvZ0xPU0tGbjVoY2JENUgx?=
 =?utf-8?B?REdGc3hXNTBXT2xkaWJnSmEvNFRnblV4eHc3a2pjNGFDUlJpRmYrcVVhb29U?=
 =?utf-8?B?NGo1bXpaZ3A0NG5EOVBGejhMOHg0ZXBYc2RCRmwxM1BEaWJ2VjVjNFQ1SDM5?=
 =?utf-8?B?U2tRZEtSdDN4eWphSmI1aEkzajluY1luT09qZnB4WU5Sams3eEFsNmc0MFhl?=
 =?utf-8?B?Nk0zelhFVHU5Wk5qYUVkNnpsN3A2dm9hbmdKQWJLTmxCbCtmYjVaSFhIYUky?=
 =?utf-8?B?RmtNR1dZM083MVRvcGtKa3VGU0hTVUVHUVkrbmNBSlRMTTFScU5Xem0vQWU1?=
 =?utf-8?B?cUpvT2FXTm16S2hwSFVUMmh5M2VKMmVyWmVmdncrMGpwMjVicHF5UTF0THdZ?=
 =?utf-8?B?RHhVZS9lZk1zZ0l4eEJUQWRYZk9abW5Gc0RDNEQ4MnlQNjFPUUx0SVQzbk02?=
 =?utf-8?B?clpBNjM1R1E2MDRmblVIWVhEV0lDbDlhV04venJSU3huMXNHa0xpMkNmb0hK?=
 =?utf-8?B?V3ZUeUp5SHZPVDYxNWh6TzZXbm9zSTg0SEpXZlgyZHVsTHdWTWZqakdoNnJk?=
 =?utf-8?B?VTQxVloxRVZwWFBUbGM2dm1MM3o4TEE4aEJWVDBnTm1rY2JTc3hSY3ZCeXV6?=
 =?utf-8?B?NG9kY2g2blZjYlZnKzBGbmlmTFJ2aDJSazJ5cFBZTkRnUVQ1SVJtODhVU1R3?=
 =?utf-8?B?YmUzQlVFNXNCNytDUC9TSmZLczNjQ2ZZd0ZJSVloUkVSUmJwSTBkdTJIeWtO?=
 =?utf-8?B?NlVGQmhHMk83Q1lWME16a0dCejIzMzM4d2IrbVpjSDVIUGY2RUFBM2YwVEND?=
 =?utf-8?B?NTJ5R3k3TkRHWlJhUmZ2NWd6L2U1N3BNV3VJaExMbWhjYlBQVlQycldOTUxL?=
 =?utf-8?B?MG1jL3dreDlUbmRRUUp2cGVUdG9rQkdPNVBLYy9DZmdYOWN6QmljS3VHZzVY?=
 =?utf-8?B?Q1BLbmFIaG9HZUJZT0sxUFd3aFpoekdwajEyZCtEbzhEVC9zejNhdE9GZ3Y2?=
 =?utf-8?B?dDBxZXhyQlpVaEt5MjV3RnpTYnJsb1FyNXk1VFRwK1dCYlBhSDZ3OHRla1oy?=
 =?utf-8?B?RCtJUjZ3aCtpaG56Y2s3VElEbG9CMC9EOGtmTS96YkNBblhOR0wyR3JIazl3?=
 =?utf-8?B?RFpNNUgwSHlFK3h2cFJQY0U1ajhZWDBaTFU4MzRIbHNuUmZxbHlBa1ZXdDFk?=
 =?utf-8?B?M0xySWlucUxzVzUzODk2YnM1ZG5qZ0pzRzNRelI2WjZMb2hycGpGcFlaTjYx?=
 =?utf-8?B?YnozSkFWZHRGeDRUcENibVlCelJMbFBWbDBXKzNQTWppdFBEczRycmJMeVdZ?=
 =?utf-8?B?WVQzN0VTUGJMUlZuMlkvYnhWYS9VUmphcVNhMWJQWHdFeGRPei9hMHBMVHc4?=
 =?utf-8?B?SDVzeThVczdFSnJaUnBKbmltdmdMa0hYbStEMWliU0YrbTliYnlBTkRnVk5Q?=
 =?utf-8?B?RWthSzZlaVAya050Y291cE00QzhsTDVwWE1tWmNEbmJMWWdxaTIrWVpxekJW?=
 =?utf-8?Q?nypcj3Up8c35HYhjePep6zvM+?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 09d2a3c5-8452-472e-c066-08dc5e0fd3fa
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB3897.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2024 12:22:05.7475 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 27/mhYf5LTPm+kKjPoFx245goLd5eLa4u/g8BlaJNtC/ABIPnIxhFcuKaWNyOuXCtTKCLrw36KGxFwRb9AvcfQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB7136
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


On 3/22/2024 7:59 PM, Karolina Stolarek wrote:
> Add test cases that check how the state of dma fences in BO's
> reservation object influence the ttm_bo_validation() flow. Do similar
> tests for resource manager's move fence.
>
> Signed-off-by: Karolina Stolarek <karolina.stolarek@intel.com>
> --- 
Reviewed-by: Somalapuram, Amaranath <asomalap@amd.com>
