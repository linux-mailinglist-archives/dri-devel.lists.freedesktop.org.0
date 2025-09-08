Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 577AEB497B6
	for <lists+dri-devel@lfdr.de>; Mon,  8 Sep 2025 19:58:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7EE1210E5A0;
	Mon,  8 Sep 2025 17:58:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="C/tPt9zg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam02on2046.outbound.protection.outlook.com [40.107.212.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 739EE10E59D;
 Mon,  8 Sep 2025 17:58:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Mc3djZWLDb0ikiVaHQk+8FPBnafkt5Xf7BevvaF/KlFrfQa3ZLR54ASzd7AYcTfUAdbCyrAQq4qxJWxk6up1hlhBY8B8DVu1mEW3WQxU/T7PJvkEqM7XrcIzA0jJWJnbKMduSZqBbqo0wY1sNdhZULDkJmw+ZiIRCcxGP6WdnTk74pT4ykfAXtz9Oj63Uk/OpoPQRO827z4zA80+WuvCuePd+IxDd/Ec7rtqhEPsRfpov/mcM78wAiR2rSIF/dntOVTsSGQvFfK3uwHj+AW+rb6sE4Xq/JWL7m2HybSLSsyLDzHxtND1HCiJgQdW0O4MPQxdFFoVlbXPBWbM6CldQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=egsXGoE4lphwB71vQYdz/fOS3e2CSraZDMShSFBJDnA=;
 b=BWoor+xplEA5izJkTqfgeo6TxqvqeZWr6UsWHVwjcr0fnJf7BsTl4pUauXOqAEvkBEbfWBW5Zp8GokIUNmkait9Xo/W6S9ExscoRrGEbZW5Ecj3EH0pUFgP9gFT2JBZNxIn9EOKiRrDcWXM0e1AxJBZoQaiwEUZKYBGBf/yvSWS+VhhWS5//Y4YShBvYxiwIHRsULJ4V/Vpn+dUGy7XOEMdSC42qAIo7Nl86qrQmqt/uVYkuxmPWwf0HaNJa3P5qU9g7Ab0KG2Acwc4qwXZEnpfkEQi7E2ETCOcvp4gahriuSSsIM9lJH/5ucl+Bv0MdD9ixAVXPXeaSA3FaErgUTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=egsXGoE4lphwB71vQYdz/fOS3e2CSraZDMShSFBJDnA=;
 b=C/tPt9zgoYrvueLxLToSwP6CYHsj8ci+6YKCQNsa4ael1CXcHu7fziezt0OjX8aHaKLe3OeU0fhL/F+59vEfrQRFzi6sJulibURGg9+b/sQqapRa+ekqBDN08CUAggFKcHERVkXrBtULFHxd4h7pAma9MUUwM16vWzTy2A0DDoA=
Received: from CH0PR03CA0049.namprd03.prod.outlook.com (2603:10b6:610:b3::24)
 by DS7PR12MB6262.namprd12.prod.outlook.com (2603:10b6:8:96::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9094.19; Mon, 8 Sep 2025 17:58:23 +0000
Received: from CH1PEPF0000AD79.namprd04.prod.outlook.com
 (2603:10b6:610:b3:cafe::ff) by CH0PR03CA0049.outlook.office365.com
 (2603:10b6:610:b3::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9094.22 via Frontend Transport; Mon,
 8 Sep 2025 17:58:23 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 CH1PEPF0000AD79.mail.protection.outlook.com (10.167.244.57) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9115.13 via Frontend Transport; Mon, 8 Sep 2025 17:58:23 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.17; Mon, 8 Sep
 2025 10:58:23 -0700
Received: from satlexmb08.amd.com (10.181.42.217) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 8 Sep
 2025 12:58:22 -0500
Received: from [10.4.12.116] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Mon, 8 Sep 2025 10:58:22 -0700
Message-ID: <0480a12c-7b4f-4d53-adf4-25f39d59e14b@amd.com>
Date: Mon, 8 Sep 2025 13:58:22 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] drm/amd/display: Optimize remove_duplicates() from
 O(N^2) to O(N)
To: Alex Hung <alex.hung@amd.com>, Kuan-Wei Chiu <visitorckw@gmail.com>,
 <austin.zheng@amd.com>, <jun.lei@amd.com>, <harry.wentland@amd.com>,
 <sunpeng.li@amd.com>, <siqueira@igalia.com>, <alexander.deucher@amd.com>,
 <christian.koenig@amd.com>, <airlied@gmail.com>, <simona@ffwll.ch>
CC: <zaeem.mohamed@amd.com>, <wenjing.liu@amd.com>, <chiahsuan.chung@amd.com>, 
 <Natanel.Roizenman@amd.com>, <Daniel.Sa@amd.com>, <jserv@ccns.ncku.edu.tw>,
 <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>
References: <20250824182359.142050-1-visitorckw@gmail.com>
 <20250824182359.142050-3-visitorckw@gmail.com>
 <0ed3fa16-9e0d-4f8d-ac22-c9f6b541ae8b@amd.com>
Content-Language: en-US
From: Aurabindo Pillai <aurabindo.pillai@amd.com>
In-Reply-To: <0ed3fa16-9e0d-4f8d-ac22-c9f6b541ae8b@amd.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: None (SATLEXMB04.amd.com: aurabindo.pillai@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD79:EE_|DS7PR12MB6262:EE_
X-MS-Office365-Filtering-Correlation-Id: 15e872e7-3a2c-4ced-7385-08ddef014dc7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|82310400026|376014|1800799024|921020|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZnRsdGZ4djByNWNrSFl3L25TQkRreDlRVWxjUTA5cHVWWERxbElGRHk1OWx1?=
 =?utf-8?B?YW5sdmZBTzJ2M3RSeFRQWVl1anl2V2t1QWExYkFCZ0lZcWdKOUp2MnVneDNy?=
 =?utf-8?B?T0pabEJyZEkyUzJ5SURhVW4yOVkvdURJM3RmZkxlV0xVSTNIR29Wb3BuMTNM?=
 =?utf-8?B?UnlEdjM3eldwUlprN0ZpQWxSNm1CZ2Z6VjZzbDMzOVpPcCtaVStJSm9UTTFu?=
 =?utf-8?B?L25aUUJFWjdyOUtKdC94RmdiTGdNd1l1QTd6UE1DZ2lsbWFOSmF0WHhSL0li?=
 =?utf-8?B?Wi9oSjZGZGhnMWh4MVR6Zjc5NGVEOXlnMms2akt1Szh5RDg1QzdpVkNUN29Q?=
 =?utf-8?B?Yml0VzA5UWFvL3FybTh6UVpDUEdaN1ZFc1k3cU5oU2dWc2w0NC90ZTQ2Q1k1?=
 =?utf-8?B?K2llNDVjTEtHRG1Zc1J2RDd5K1d5TTlMT3VuT1ZEZE0xVWU0WGxJZU1lSmQz?=
 =?utf-8?B?OHdmSGw1YUtpallkMXBNako4TXVFa2oyRUJFL3pDRmowbkhsTURMUVJPRWYz?=
 =?utf-8?B?UFJsaHZ5NkpHT3hFaFRLTklxNCs1b3RVd1l2ejU1M1F1NWZneGl6b1kvM1dJ?=
 =?utf-8?B?UmRZUFd4TlZlbkVsMjlndDRQYy9LN3Q2Smc4NFN1UUU1MnB0b1ZlSEFGckpN?=
 =?utf-8?B?My9wVlRTajFTQXJrN1NGU2VMOVQ3MDBYS0o5MUxCaXV3TEtOdFJFSjZmUEE0?=
 =?utf-8?B?bmp5bWN1SCtweUFFZC9FbnB0SFlHdVNtQ2pzWjcrZE00a3NEOHk1WjNmNER1?=
 =?utf-8?B?czJRbTRWTkVXNlZMeDc4TGFEY1hnZmR6enkwc3ZmbUQwdjduUU9oQk4wc0Fx?=
 =?utf-8?B?QVZNVzBVQ1ZLYVd2c3Y2em9HbGU0VlFYcFR1S1lpSjJmNGcyR0dQKzhvaitv?=
 =?utf-8?B?RGthWmxnWVlZZWtvUjdYRnRjTEQwRU00K1NWVlFCbzQwcE5TR3RFK0VmWXkw?=
 =?utf-8?B?WXE0dXlTYzVFNlhLMzM4bzJhbmd5WVBUUndlUGRxZ2pJS3JKNW9DeVJsL3B6?=
 =?utf-8?B?cWN4UjlJUGowV1V3UjhGYkxoME12cW9VdFJBQUhkSmN1U0RQZzlrazV6Smpv?=
 =?utf-8?B?Uk9mWElUTGlIM256c0FPZERaV3ArK1hsMHBqL0FuMmNLUXQvNnVVMzlodDVw?=
 =?utf-8?B?K2FOcXBLN2NyeWJFc0xwZ1o2YytyN0RoNkJ4NmpDdlBXcGtJZ2tWbWR6bnIr?=
 =?utf-8?B?djlLSHUvbG9CU2RyOVUzb2xTR1hjeTZueDExbXpucTgxZC92ZHY2WXVac045?=
 =?utf-8?B?Nkh4bXp2ZjF5alIwMXJJUFlMR1BGTnpVU002b1VnVWRPYkNyWmN1V0ovdml0?=
 =?utf-8?B?RmNQRzFKS0lQb3grVFdNNC9UQmRqU1NYT01OUGxpYzY4aGFJM21HcVlQcjda?=
 =?utf-8?B?YURmZWc3NUhuZjJWTkZtcnh3NDJleFhZQjNnNXBCZUhTVUR6M1JpVzE0eVZV?=
 =?utf-8?B?bUNmTk5qdzBBRWcyS09YWWVPaExLZnJlOWFiYmFUay9RNXlqTmxKcnFpMlFQ?=
 =?utf-8?B?b3hRRGZPRWhmOU9UUDl6RVRsVERkMjlYSUJCR2xQS1RQWmpWVSt1NkZYVnRK?=
 =?utf-8?B?cnFqS2xLMUU2cXpJMTJOUVlyRFJJeWhCNXVHRmZCZW04cXc2YjhsRXVGcnVV?=
 =?utf-8?B?TEc3cjgwVkN3RFI1MnNzTWlDblFNRU54UUtKNXdETERyekZaanZNa3dCQnVo?=
 =?utf-8?B?aHExNmQrT1pwM1IzdEZoZ2pDbDZFd3FSazJGTlgvU28weStiTzRQdHVZaUh6?=
 =?utf-8?B?WmZRRk0yNUpHM0E5cC85d21KT1gyYUNnaWJNMWpEVUw5ckpxcUFickZ5VXVu?=
 =?utf-8?B?S0x2VkRzWU1SeUZ1UDUyaTJhUW1GNWRvRTB3TXEvREpSZFExTGFkUjVycWh3?=
 =?utf-8?B?enVISEhnOURuL09oeVhPTzUzQnd2ZEdmbTcxeUhCMzVRWk03QlB3RVFDbUx5?=
 =?utf-8?B?UVNWZEk2SDQyYTNMU0xiTHhCVkN4U3NVbXRQOTNhcmJkYlRnRlBqNUxzc1l5?=
 =?utf-8?B?VFV4OUNxSU9DbFhoTURQWUJWZm9OdFV6dDRDR0pwcEFjQ0lPcGo3VlRZMVV4?=
 =?utf-8?B?MHltallnd1UwNGhJaE55Y0NhQXpUcHcwWE5SUT09?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:satlexmb08.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(82310400026)(376014)(1800799024)(921020)(7053199007);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2025 17:58:23.4831 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 15e872e7-3a2c-4ced-7385-08ddef014dc7
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CH1PEPF0000AD79.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB6262
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



On 9/8/25 1:10 PM, Alex Hung wrote:
> 
> 
> On 8/24/25 12:23, Kuan-Wei Chiu wrote:
>> Replace the previous O(N^2) implementation of remove_duplicates() in
>> with a O(N) version using a fast/slow pointer approach. The new version
>> keeps only the first occurrence of each element and compacts the array
>> in place, improving efficiency without changing functionality.
>>
>> Signed-off-by: Kuan-Wei Chiu <visitorckw@gmail.com>
>> ---
>> Verified correctness using the following simple unit test:
>>
>> double arr1[] = {1,1,2,2,3}; int size1=5;
>> remove_duplicates(arr1,&size1);
>> assert(size1==3 && arr1[0]==1 && arr1[1]==2 && arr1[2]==3);
>>
>> double arr2[] = {1,2,3}; int size2=3;
>> remove_duplicates(arr2,&size2);
>> assert(size2==3 && arr2[0]==1 && arr2[1]==2 && arr2[2]==3);
>>
>> double arr3[] = {5,5,5,5}; int size3=4;
>> remove_duplicates(arr3,&size3);
>> assert(size3==1 && arr3[0]==5);
>>
>> double arr4[] = {}; int size4=0;
>> remove_duplicates(arr4,&size4);
>> assert(size4==0);
>>
>>   .../dc/dml2/dml21/src/dml2_pmo/dml2_pmo_dcn3.c | 18 ++++++++----------
>>   1 file changed, 8 insertions(+), 10 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_pmo/ 
>> dml2_pmo_dcn3.c b/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/ 
>> dml2_pmo/dml2_pmo_dcn3.c
>> index 2b13a5e88917..5100e0e7af42 100644
>> --- a/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_pmo/ 
>> dml2_pmo_dcn3.c
>> +++ b/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_pmo/ 
>> dml2_pmo_dcn3.c
>> @@ -50,18 +50,16 @@ static void 
>> set_reserved_time_on_all_planes_with_stream_index(struct display_con
>>   static void remove_duplicates(double *list_a, int *list_a_size)
>>   {
>> -    int cur_element = 0;
>> -    // For all elements b[i] in list_b[]
>> -    while (cur_element < *list_a_size - 1) {
>> -        if (list_a[cur_element] == list_a[cur_element + 1]) {
>> -            for (int j = cur_element + 1; j < *list_a_size - 1; j++) {
>> -                list_a[j] = list_a[j + 1];
>> -            }
>> -            *list_a_size = *list_a_size - 1;
>> -        } else {
>> -            cur_element++;
>> +    int j = 0;
>> +
>> +    for (int i = 1; i < *list_a_size; i++) {
>> +        if (list_a[j] != list_a[i]) {
>> +            j++;
>> +            list_a[j] = list_a[i];
>>           }
>>       }
>> +
>> +    *list_a_size = j + 1;
> 
> A corner case needs fixing:
> 
> When input *list_a_size is zero, it will be updated to 1, unlike the 
> original code. Maybe a early return when *list_a_size is zero?
> 
> Hi Aurabindo,
> 
> Do you have other comments or other concerns?

Patch looks good with the early return added. Only nit is the 
description wording - an extraneous 'in' is present.


--

Thanks & Regards,
Aurabindo Pillai
