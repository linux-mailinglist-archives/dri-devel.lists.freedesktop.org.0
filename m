Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D4C5EB44429
	for <lists+dri-devel@lfdr.de>; Thu,  4 Sep 2025 19:16:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E345510E341;
	Thu,  4 Sep 2025 17:15:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="on/iCigW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2049.outbound.protection.outlook.com [40.107.244.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 011DF10E340
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Sep 2025 17:15:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RVrH4hOXuROL7Nw6cws0lrHx5Mk9Sa07+sFGxZvWWcWvG+mFTeCt5WHrYTBbk4k612H8HkX8QewKN0eC/hcN8hszHOE5cOz4PZ3/VqBaprrcLj7qM6AekY/YUasw4ApVRFAG4qJh6/eysPypiBJLfZB6ccyDwLhJUGIZlNgDbZWdoWob0tXJf4ho8f2qqmkt5L6dY/IAvwzd/0P/JpaeHAavRaHdSJm/raKr3FWL+FOpiDQYvH2QCaxAqbiZwzLfNzKO068xFiNiC1K6DgVwNuKICnMyI8YVwk63L1bEmH14DcJ7oZPpjwkuX7aONUxSWZS+QvwQoidrUyV3nkPF8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RhmLZtcoAKRgTFl1BZWdmWgVDprlj6nPczkTntukzbo=;
 b=n2H5XthLukhQI8MhhplCYp4BdDes2k4yAQtMxtDwL7Qx0Pg72/udZ1XL9AtrmYGtIKwH/1ddHAwtqxDDEuzj4FYthfEtKH1O00M7YONNAbbuuu67lW+Bk4yIrc8AZtFA9kEIvXsGJrCIGKfS3QRZb6Rey6jPmchULleiMuVkrsuF+qQDnH4iXNr2tUfTpDFLctBaF2TT4iAYe4RF6l0SczlgHiBtF+daznm9qh3ZYl32BdYPKcy3cggekIZui/UCIK5mxJsJ0u93QE5T6PY6cn+gXpts5oibvW889cf2dH7D2yiGpR9dODAP8MtdF1A9Hjnq9whKflItlBiePByQJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=intel.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RhmLZtcoAKRgTFl1BZWdmWgVDprlj6nPczkTntukzbo=;
 b=on/iCigW6/ZaAzFJlJypCMeRUXwDRaHYqLiIUBwj6sX59FRPMLGWIMcZwQwacaOLb999E7rUUujVH6Ge4b9J90iWGyekrnbWtO8EXxLR4BFSNFBxpJHYUs5mt6/ZHS1B+UQvpgr6qbIdjKCHw7aO6KwSSp6Ntq1H7yy7SvSiqco=
Received: from BL1PR13CA0102.namprd13.prod.outlook.com (2603:10b6:208:2b9::17)
 by SA1PR12MB7221.namprd12.prod.outlook.com (2603:10b6:806:2bd::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.27; Thu, 4 Sep
 2025 17:15:50 +0000
Received: from MN1PEPF0000ECD9.namprd02.prod.outlook.com
 (2603:10b6:208:2b9:cafe::94) by BL1PR13CA0102.outlook.office365.com
 (2603:10b6:208:2b9::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9115.7 via Frontend Transport; Thu, 4
 Sep 2025 17:15:50 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 MN1PEPF0000ECD9.mail.protection.outlook.com (10.167.242.138) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9094.14 via Frontend Transport; Thu, 4 Sep 2025 17:15:50 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 4 Sep
 2025 12:15:48 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.1748.10; Thu, 4 Sep
 2025 10:15:47 -0700
Received: from [172.19.71.207] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Thu, 4 Sep 2025 12:15:47 -0500
Message-ID: <b2cb52b1-9bcc-b77a-ed9b-cf3dbaea1a71@amd.com>
Date: Thu, 4 Sep 2025 10:15:42 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v3] MAINTAINERS: Update Min Ma's email for AMD XDNA driver
Content-Language: en-US
From: Lizhi Hou <lizhi.hou@amd.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
CC: <dri-devel@lists.freedesktop.org>, <jacek.lawrynowicz@linux.intel.com>,
 <linux-kernel@vger.kernel.org>, <ogabbay@kernel.org>,
 <quic_jhugo@quicinc.com>, Min Ma <mamin506@gmail.com>
References: <dc0227cb-7e02-10c6-9790-2e2331ddfd6e@amd.com>
 <20250831001228.592-1-mamin506@gmail.com>
 <67138df3-115d-94cb-005f-84f6f56f5986@amd.com>
In-Reply-To: <67138df3-115d-94cb-005f-84f6f56f5986@amd.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN1PEPF0000ECD9:EE_|SA1PR12MB7221:EE_
X-MS-Office365-Filtering-Correlation-Id: 162b0c4a-7d8c-48c7-d761-08ddebd6b248
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|36860700013|376014|1800799024; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cG1kbFA3M1pVbnc4eVQ4QmMyOHFGMWt1eGxqblZUMTlhVnVWempzOUhwNkQy?=
 =?utf-8?B?WkNqTDJPcmtHVjFnM1dITDY2OGcyL0UxcG9GNHRWSVBHU0ROazJNbW1zVW1E?=
 =?utf-8?B?a0NleVNwTmoyNWRhRjFqeWN1RnE5aGtTYU9Nc0pOVUF3WkZXYmpoRnJBTU9C?=
 =?utf-8?B?MDVkd2VUMXFtRDN4S3lSSWlkSDliT3Zlc3ZOcHVzYzBnZHNyT3dqZExCNTJa?=
 =?utf-8?B?Q3o4NTJvVVh0cFFYMU1iK3B4MGY4bENXS0xXV1UzdXZZTE1PREpERHovaXFh?=
 =?utf-8?B?b21ycUNFdXFVMWw1cjVwejA1bUJaWG9lRTB6R0RHbnlFd3ArbW9PQnFYL1Jk?=
 =?utf-8?B?ajhja1RDTTZtRWdIV2VzOCt2Y1pTZXQvZjFuNkJ0eVZkSGFiWEQ4UVNGRjBO?=
 =?utf-8?B?U0VFaFh2QXZ2Vjd2UllIOFJ1UmRiWW4wcHlHOFhZbVYrZ29Ldkh0WGVZQmh6?=
 =?utf-8?B?em9ka0sxWmFldEtXSksyQkNDRUZ4Tk41bENxbzVqeVp0aWlMR2x5Q0lOZEdl?=
 =?utf-8?B?R1VSV2YvVWVoeHR4OUxBVEJ6ZHRzVENUUGVQdGtTR0ZaL0JDNWhIMnlNbFhH?=
 =?utf-8?B?UnI3LzRsU0hHMTVOcjk5bHJJU29NdmRWYkZVVGRuRHd2YjhKeXVEYVQ1MG1N?=
 =?utf-8?B?U01VM1hsZlpQZmJGdVI1dVh1aS9HSTlJRTQxcENMOEFleTY0UkpIRGxNeFNs?=
 =?utf-8?B?NWQwMkFCc1lkWjNrQUdsamFGYXhUUnZnYmlvZGIyUWFMSDJyVGVrWVNnUjV6?=
 =?utf-8?B?QW9zc2RxSE5rRFVNY2krS3lCLzJDN2d5T2hqc29RZ1hKOXNHUnJYSHFnS2Rx?=
 =?utf-8?B?SUFza3czQUw1eTRnb3RwQi95RExlcHlrUUlYVVJCUG8xb0NXK2RubUJIeHgx?=
 =?utf-8?B?T1FJdHZ6Mm9ONWFUQjRXSFM0OGFrZG5kdlNhRHF1ZldtdzRmNmlab2lodW83?=
 =?utf-8?B?ajJFVFhkeStaeTNTaDZrb0Q1eFJpeWtacTFLMDZkU0FXMU93RDlhV2Jqd3Vr?=
 =?utf-8?B?M3J1SXM1TFFIcm5FZlYwYlpWK0F5UnJxb3lHL0JmZ0JMeW9hekRGMzRibDYz?=
 =?utf-8?B?blVwdjYvME4zbytGVFNWTkZrclVnVGUxWW9hYnNPRDVOTWo0d1B2QjZCNFNt?=
 =?utf-8?B?emRVREFaaXVyRHROeUgrNHBvd3cwamp0REozUitaL0lvWENzem9sWFVpZlNv?=
 =?utf-8?B?NGJOZ3g4YmhUY3VVVDhWWUxCVnVBcDVPRnNtcWM5c1BKZDJReEpRL0RkUGxR?=
 =?utf-8?B?TC9QMFdmc2FXczY0TzRRcUF5THVXams1ZUdoZHh4RUsvbUpXcTlmN2ZoNDlu?=
 =?utf-8?B?T3B5T2ZpMWxVa0ZHVk5vcjRXY3VqL3Iycis1cC90dENENzY4cTdJQlRJdFE1?=
 =?utf-8?B?QWpJZ2U1Rkl1bi9maDIwK2pRc205T3E5UEJ3dmRHT1dNa1V2KzBVRWNNVVQy?=
 =?utf-8?B?cTR5YkRNemdUMUtGRXpZLzR6bzBOQ2xXNmVSbFJ3bkN2MndVa0NRNmREZklx?=
 =?utf-8?B?KzBjU2hiMzh4b2dOeW1ZL3dDWXJHZldtVUtBbmRBelIycU1aYUtCZmwvbi9P?=
 =?utf-8?B?dWdjeWt2OE96ZXc5Qk9YTlI5eUJhWE12aExCRHdRYWdFc2wvQy9PeXd2SXFi?=
 =?utf-8?B?L1duczdFdE4zeUpSa0t5WWpqT2lMd3IzdlpxeC9zT2dCRWlhWTBITlhiR095?=
 =?utf-8?B?Q3R5SDdxbnJ5ZndvTWdBTUdHcm9ZWjY2RGFNWkt5S0RGQ3ZKemN6K2h6Ykx1?=
 =?utf-8?B?dm5lT3IyS3RLQVo1czRmaktBb0diKytZZDZyUlIrelp6WW10a2FDTlczdGpk?=
 =?utf-8?B?RENqMmt3MDhkN1BLVWt5Z21uaUVXSnN6ZDZ6SmFyTEpOUU0veWZ4OTkvMkRv?=
 =?utf-8?B?K0t6aFV0ek1nNzZoR3ZWU1ZWZnF0a21ydnowQzBBNE54bjNaR0ZQWFBveHFB?=
 =?utf-8?B?YmNQdXhNWDE0UHRXcEMwcm1vU3RhWHE3R0NrTmVGWWwwUW1iN2lYUXNOVTdW?=
 =?utf-8?B?VEoycXU1b2NxV1B3eHJ1UitJellCUXlXc1ZvL2tQUzRXSUY1anUvTytIT2th?=
 =?utf-8?Q?bnQbw2?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(36860700013)(376014)(1800799024); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Sep 2025 17:15:50.2701 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 162b0c4a-7d8c-48c7-d761-08ddebd6b248
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: MN1PEPF0000ECD9.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB7221
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

Hi Lucas

I got a dim error when applying this patch. Could you take a look? Maybe 
there is not a maintainer for MAINTAINERS? :)

dim: ERROR: a12586e4e737 ("MAINTAINERS: Update Min Ma's email for AMD 
XDNA driver"): Mandatory Maintainer Acked-by missing., aborting

Thanks,

Lizhi

On 9/2/25 12:47, Lizhi Hou wrote:
> Reviewed-by: Lizhi Hou <lizhi.hou@amd.com>
>
> On 8/30/25 17:12, Min Ma wrote:
>> I recently left AMD and would like to continue participating in
>> the review and maintenance of the XDNA driver using my personal
>> email address.
>>
>> Signed-off-by: Min Ma <mamin506@gmail.com>
>> ---
>>   MAINTAINERS | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index 10850512c118..6eefa494000c 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -1231,7 +1231,7 @@ F:    drivers/spi/spi-amd.c
>>   F:    drivers/spi/spi-amd.h
>>     AMD XDNA DRIVER
>> -M:    Min Ma <min.ma@amd.com>
>> +M:    Min Ma <mamin506@gmail.com>
>>   M:    Lizhi Hou <lizhi.hou@amd.com>
>>   L:    dri-devel@lists.freedesktop.org
>>   S:    Supported
