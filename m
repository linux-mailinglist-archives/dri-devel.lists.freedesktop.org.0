Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 47CB33FB671
	for <lists+dri-devel@lfdr.de>; Mon, 30 Aug 2021 14:51:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A21EE8999C;
	Mon, 30 Aug 2021 12:51:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2071.outbound.protection.outlook.com [40.107.236.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6712E89781;
 Mon, 30 Aug 2021 12:51:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=B54aHuBZKn1hnuzWiSPtsTT8gI6zd3LkengwKTXUUiq4QO9mwnYfs10X2rUIenlWVWNgB1zeip5PPfdc0ia9MysyaD5i9oJhvQgqZCL6yt4Eo+3iLGpzShRyIGeCtwObBnBO7wt6xIkFVlC9ThUpymjO1oRk1jqUQWCkH3iSXJ0yaOnmN60hcjj8/Gd52ZJ/AkszAtKIaGf5+niFGUIx0alRk1Wms87S2HEjH0q1uNqLAIUpDHy9v4xGswRQ0FZkbswRmata9N9BI/7iUw2nvl4wyB0QXhIINv7OzTN3JbszUGEEAdjeWJbEaEcxe/YkDufmFQxynvFQu5f3pakwpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BliR+zj9oI09U4HUdp4ZWQ7xAhHzeGdgC+2pneqkR+M=;
 b=bczzkkJ1YXV23yv4EGchW0kN3Rz6P3zmwmtEAzzYPOL8jGQrB8WjzClRSxD8lthCu58DYl0ph/481GoaT3xalBztgUCLCWsgm7UPYhdvJ5Cr1/XTrKfqTHSO1wSJTt3txG2ktbQ/eWKVYARRTMEa/k9wOwOc1gDuvx3UhEzUxogwMuTC1RuKZ4AWJtq/9TxzUiZxxoRZDeHWjrWS8PxetVqya24ODrR377osNeIFz8yP00IC69TbntKmUEoDgixSMAW6nAaSJkT4SMwTcKTAiFgIGWOEaTKwrPV8ZmmDyNdjkYmeXvGmm+SIk7u8w8YW8oRqVDkKnjOGo1ezlUEz9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BliR+zj9oI09U4HUdp4ZWQ7xAhHzeGdgC+2pneqkR+M=;
 b=gx5EYxNjqhD/10pADoh0q4KXuTducXALJRf/I+5msxBC3LqyGcez2BbMp9ABPcD4/IsmcyQcgbh/pvymBLj18hgMxwQrEpsMJvn4Peplfz1bHvHvPQH8amY2wSqPNaCLC1nk4nNyzGhfh8S8iEtSpDQl0UwATiKctOZJYBx2ksY=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB4111.namprd12.prod.outlook.com (2603:10b6:208:1de::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.23; Mon, 30 Aug
 2021 12:51:26 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::dce2:96e5:aba2:66fe]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::dce2:96e5:aba2:66fe%6]) with mapi id 15.20.4457.024; Mon, 30 Aug 2021
 12:51:26 +0000
Subject: Re: [PATCH] drm/radeon: Make use of the helper macro
 SET_RUNTIME_PM_OPS()
To: Cai Huoqing <caihuoqing@baidu.com>, alexander.deucher@amd.com,
 Xinhui.Pan@amd.com, airlied@linux.ie, daniel@ffwll.ch
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
References: <20210828085052.756-1-caihuoqing@baidu.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <18719622-d60a-c73a-512d-defbf182d3d7@amd.com>
Date: Mon, 30 Aug 2021 14:51:19 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <20210828085052.756-1-caihuoqing@baidu.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-ClientProxiedBy: AM9P195CA0009.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:20b:21f::14) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.178.21] (91.14.161.181) by
 AM9P195CA0009.EURP195.PROD.OUTLOOK.COM (2603:10a6:20b:21f::14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4457.18 via Frontend Transport; Mon, 30 Aug 2021 12:51:24 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 65dc43bb-6c0b-4a3b-d0b9-08d96bb4e05b
X-MS-TrafficTypeDiagnostic: MN2PR12MB4111:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB4111CF9526E708A41D1F861983CB9@MN2PR12MB4111.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Gg9xsZ7KZNlytChlmxbIabvYmCFODg83TqE8KOMrKfhXidAQofvxSPjo18Khww97s6DSvxIXzp1KTnIT/vm8Q9a3d6YM5PV/oOBLc4QDvBJAlmOzKzJv7vmv/o74kPPUEvUcMdac2W4o6re1sVt4RPZLIaHxTRBuC7Acnzaw4saLkO3KW1ZC7qcrdeQvv73MU8kpho/WZdJcXF7A8pQEUPoUza3BNCQ1+vk5CKSkMR20zBJRn2QcG8674OOItvEJlf99hR9bS8E70Of7pisSSf4MyLny+fCehXKjaoJ+440xtZEvBWgPfwpXexidHEqkjzp+JttYXjE+Lx6EDaRM1YZYu8Ja/I27K04+9lVv8l3awdfqUo1VnXPDtkjqSHWTVxbd531vsD4aKNgayZVSEOMGvnZepw3//UH0ZqrKTRnK9BMYhi+TJAYcq7PBI7LVUnry78tNYSf1+Sj8N1XR1W9+gUNsX43U6uPz8okTz4YWWNDMd/uaJLNreZ5LuML/LJxwaS04vWZA8MYL+i5ktbX2KT89eazIl20NyFPQ46NupHDfyteT/AScJ/cGcx6ajQM3PHQg03Ao2JhFZRSG/V2g95As4Rse4I1iOGJxiKZ1wIL++grVmZD/xkjcb60QNpTW4CU6BT0Kqrn/JZX2LkwPh0fnIUH0q1HFAbmc+ck2RB/OIYQjUVyMHlhPOnc38MBYMtuz8G1uvdO0xwJMgAK6R3ljbhm0aVajcWANxXE=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(346002)(396003)(366004)(376002)(39860400002)(66556008)(26005)(6666004)(31696002)(316002)(16576012)(186003)(5660300002)(83380400001)(86362001)(31686004)(38100700002)(8936002)(956004)(2906002)(8676002)(36756003)(6486002)(66946007)(2616005)(66476007)(478600001)(4326008)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NWorSklNa0crTzRCbm5OeTNpWi9nRVlzckdyWGwzUDE1cTk0WnNaU3JVQWVu?=
 =?utf-8?B?R0pSY3oyQ1FFcXBycy92RE1ORUdzVi9jOEtrNDI1VFlOY3Z6d3V1cE1GTmFM?=
 =?utf-8?B?elZISllMby9nQkd0UUZPVGFsbWRPcHFnWlUwNENTZkx6WnhjaGVETHgzekN2?=
 =?utf-8?B?MjNxb1lhamtJTjNFNFZSNy9teXdPTlc4bXlET3BkYVEyb3dhV0VXYk9CWWVP?=
 =?utf-8?B?UFVrYkp3MWZCREg0dThUNVAxKzFaZGd2U0Z6RERhendWYnIvdk1rSEJ4cXpP?=
 =?utf-8?B?VDdMZmlRUlE0VjB2bGEzd1U2T2ppRXc0dGdiM1RJSXI2eHlWOXBpSEh6TElk?=
 =?utf-8?B?V202MWVPK1QwWkhzVm5pNHdoSVVQTVRWQjRlNGJ5bnJ6U2J5T2k0eDNWNGRl?=
 =?utf-8?B?UkJnKzNvQm5oSll1bGgzWlI4dkpsbnNXczR0TUgzOVVFT3FCeGErU3B5TG15?=
 =?utf-8?B?UVBpMTd2MGh5WVk5RWliazQyRURKa3NJUzhjSzBVbjY4WGpBSnFBRnQyRkE5?=
 =?utf-8?B?ZXNzR1VBQ2hkMXhTNkZGekdFWWd0OFlmelFyZUFwUnUwNjd3eE91b05HN3FJ?=
 =?utf-8?B?cWJnWEFyb0dOdlhLNzA3L2Vqd2dXWXlZSG50dVFlTEY2YjVVc3p4eTNhMTdJ?=
 =?utf-8?B?cmxDRjNFYWc4LzNqSzgrbm9DLy9SSlluZi9TYnNVNWhoVUg3NkZoSDg2RWxQ?=
 =?utf-8?B?bi8rQlNqampPQ2dyUlVuRHhhT0VPTFl3cEwwQzNDVzA1cWVPd3NrTkhsSUhW?=
 =?utf-8?B?Zld1bm8xcTkxbE96bWt1aFpNaDF0dFBnUU0xcG5UZCtQUHVCZ1BqdC93Nm1H?=
 =?utf-8?B?WERTRFFWRGFGbzlEdmRKZGVIT1ZIa0xqMzZLTEtMSEc4Y3FWVHhKekNna0Z1?=
 =?utf-8?B?R2FDUjZkdHRLaEhWKzROWDJEQXN5VFZBelkrc0RjTVpwdE0vVDZBVGVoUDFT?=
 =?utf-8?B?L0hrTEN1MnlPa1JpY0hTUVI4NVRPMnBEdzh4OCtJTDJ1a2dEWVRQODJwNldO?=
 =?utf-8?B?dkpsWTJEKyswaE44SFpQL0xDNVlxa2JOUTFtRDh1bFJrUVpRelgwckdxOG0z?=
 =?utf-8?B?MmczTmRXWk15SEdDTFBBN2hIV2JvNEhDaW1DdHJkZGF4SjM3RU1BcWFtS2xD?=
 =?utf-8?B?aHoxbXkwVlEydzYrVmF3VU1yVStaU3ExQUYzb2R4YnBaK0J2YTN0TloxZkJ3?=
 =?utf-8?B?cnVYd1dxbWZncHNZelhIbTl1WGVJK0NLV2IrdW9iYTk4RU9aYjN5WnJLT05Z?=
 =?utf-8?B?bThsNk5NaHd2dUxpWTN1WFg3YW5qazNPdU83SXdhdkJHSkZlSnUxeld0L0hl?=
 =?utf-8?B?ek0vdnd5Q1JsUktZVU5WK29HK0N4NVowQlJBRE9sbnAzZUh5Tm1KaFJoNnVF?=
 =?utf-8?B?SksxME9yL2VsQkhxOTlDZllRRENPbzNDcmpOQUNRQ253clRNNTEwZVFlK0xV?=
 =?utf-8?B?Z2JMSnNkYmRKWjNqU2plT1g3QTZuUjJPQndrT1dlZjM5QzlrMjJuMFhsaFlL?=
 =?utf-8?B?Q3FUUFpZTi9lMzZPSGFReGhIZng5U0tzZkpKSjFVK2RXbmFkY0twcS9TYThK?=
 =?utf-8?B?dlNoWVRHbUZPRUdtTmMyMk9wVW1XSkI0aDJIRzNMQVJnN0NVTFU0VUM4WXJG?=
 =?utf-8?B?U3J2TDBNYXpqUE5NeVRueUt6dXFGaTR6Zmg2TXdGZExFSTYrblJVbUxXYmlp?=
 =?utf-8?B?VzBIU2xabE9sUnZzczlFQjlnL0JxVmZpeXpCWEFKNDEwWnQzMCtpeVJBMkxG?=
 =?utf-8?Q?HRmekjii5nY/T0KkVhkIkkH894w2IQLx792opck?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 65dc43bb-6c0b-4a3b-d0b9-08d96bb4e05b
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Aug 2021 12:51:26.0799 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dMKJkKGEI1QztpyDbR9hY0cgU+hsrgDB+DoYRUumuPLRGzjlNmCH8/qaoAyJMqVK
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4111
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

Am 28.08.21 um 10:50 schrieb Cai Huoqing:
> Use the helper macro SET_RUNTIME_PM_OPS() instead of the verbose
> operators ".runtime_suspend/.runtime_resume/.runtime_idle", because
> the SET_RUNTIME_PM_OPS() is a nice helper macro that could be brought
> in to make code a little clearer, a little more concise.

To be honest I don't think that this is cleaner at all.

Christian.

>
> Signed-off-by: Cai Huoqing <caihuoqing@baidu.com>
> ---
>   drivers/gpu/drm/radeon/radeon_drv.c | 5 ++---
>   1 file changed, 2 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/radeon/radeon_drv.c b/drivers/gpu/drm/radeon/radeon_drv.c
> index b74cebca1f89..c2eb725e87f6 100644
> --- a/drivers/gpu/drm/radeon/radeon_drv.c
> +++ b/drivers/gpu/drm/radeon/radeon_drv.c
> @@ -529,15 +529,14 @@ static long radeon_kms_compat_ioctl(struct file *filp, unsigned int cmd, unsigne
>   #endif
>   
>   static const struct dev_pm_ops radeon_pm_ops = {
> +	SET_RUNTIME_PM_OPS(radeon_pmops_runtime_suspend,
> +			   radeon_pmops_runtime_resume, radeon_pmops_runtime_idle)
>   	.suspend = radeon_pmops_suspend,
>   	.resume = radeon_pmops_resume,
>   	.freeze = radeon_pmops_freeze,
>   	.thaw = radeon_pmops_thaw,
>   	.poweroff = radeon_pmops_freeze,
>   	.restore = radeon_pmops_resume,
> -	.runtime_suspend = radeon_pmops_runtime_suspend,
> -	.runtime_resume = radeon_pmops_runtime_resume,
> -	.runtime_idle = radeon_pmops_runtime_idle,
>   };
>   
>   static const struct file_operations radeon_driver_kms_fops = {

