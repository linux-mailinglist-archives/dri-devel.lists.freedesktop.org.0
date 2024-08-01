Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 691E99449CA
	for <lists+dri-devel@lfdr.de>; Thu,  1 Aug 2024 12:55:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D27A710E098;
	Thu,  1 Aug 2024 10:55:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="248Sduol";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2065.outbound.protection.outlook.com [40.107.243.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 83A1310E098
 for <dri-devel@lists.freedesktop.org>; Thu,  1 Aug 2024 10:55:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=f7GbGPizUUhvXv/8nf3/ZbQL3aF1vOdNOoqlwv4w7TXe6BlqrDEXusNQGnWSMnmJ9fRuCt9iSMxy4zURy5Mo2XFVdecVd/M2dTAiWnEYmSdLekqgc7dgbQwsgRbsNIb98qRdZGdVur5iNqZtU3jT06vehtCisCLVcs11E9RA9IdKjilzwwbvghK7QcxV3/ZghLjaZBB3HXubtlr1TWfoAFwOm0S7UpLli3VaEiU0QqsAtHqyXLXafxrUvkedRS+DwbqohxjgsUWXQXioDDVxHEVJoJnQdpTwxJy7ed9Aqsd9xZ5hjW/XD79YScBV9wG4SCmXzR+gNUrNqmGG6lAXMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iJF1bGvrAxQD4oMXP6X0imr8wcY/FB5xQzHjrCS/jTM=;
 b=AXKzg3+4OWKGuq2QLy/2AU8iuhN9Qv9YavYev0w3ANnUPJos1m7glvQN371svWJ3X3v00B/goSM2tYJqMjOFENE0gcsEUACz1E/kqVqklHKYLo5kmPnDHBvtg5/zkS0dT5o0ZLDvOJIhgiZM3cgLoU1SnNJNv4MbkZuJKQCoqNN829f9tqqMusMdtOQ8Tejxv0Ejlm1z2whD/lU+NeVmZI7loGG9KW/uSVYo5tZyAP8QgekF5Cc15pi7mmEQ6by67tmjnUOGSye11LbXaKh5Cozzn0UZkiY6hHo+5tKr+x/chSoy3RzElf7i/wdcl/pcWKq9nLtzrfyP1r/rFy9hhw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iJF1bGvrAxQD4oMXP6X0imr8wcY/FB5xQzHjrCS/jTM=;
 b=248SduolJ8R+A5Rv6wb1XwyuvTetK8Cu7Z3FWr1kDv0o+MHOb66WfUYAgL91dyP5+z5NZHxw/l7So4vr3jigp45SZFPh6fbAJCrVn6ZitX+JzEjvPo/pdfw1bFOClJiTGr6PD4bA9IciMEpB5zOYIy4s8vYg8ruENQJ7TCvnUyI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by PH8PR12MB7028.namprd12.prod.outlook.com (2603:10b6:510:1bf::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7807.27; Thu, 1 Aug
 2024 10:55:34 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%4]) with mapi id 15.20.7828.016; Thu, 1 Aug 2024
 10:55:34 +0000
Message-ID: <59df9815-577a-4449-b17f-72a6b78d373b@amd.com>
Date: Thu, 1 Aug 2024 12:55:29 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/5] udmabuf: fix vmap_udmabuf error page set
To: Huan Yang <link@vivo.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Sumit Semwal <sumit.semwal@linaro.org>, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
 linux-kernel@vger.kernel.org
Cc: opensource.kernel@vivo.com
References: <20240801104512.4056860-1-link@vivo.com>
 <20240801104512.4056860-4-link@vivo.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20240801104512.4056860-4-link@vivo.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0189.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a4::12) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|PH8PR12MB7028:EE_
X-MS-Office365-Filtering-Correlation-Id: 104d30f7-6341-41a5-ce5b-08dcb21877fd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?T2xPc3ovNmNkOUZmdWo2WFF0OWd6Rloyb3NPeVh3b2d5cWJ4eHpxaEFvb0tE?=
 =?utf-8?B?N2NQSUQveTl4UnFMN1p3NlR5ejI4cGk5NjFmRFpoVnY5NjVMTHdMcGdVQkxt?=
 =?utf-8?B?MURJR0NLb01uQ01zNHJvbDU2b2FyYjJ1SDZzQTlFU1U2cmQrV0QvODJ5VHpJ?=
 =?utf-8?B?cHc2bzExK01vRmdYeEExM3dxU0d0eXNtU2FCeFVhNDNVR1ZsUTlQWHlndTAz?=
 =?utf-8?B?dWpoMktYSGROR1c0cXJqQnVQL2N0SVcvdU9mQVRHYW85NUhISjg3M29JVGFR?=
 =?utf-8?B?TEgwRUZvMVdRNkt6REZHNXZjT0xDblVYVVkxVUdqaEs4L3FBbEM3UXgxTlJR?=
 =?utf-8?B?N1JlV0lqQSt6dlg5d3BtdGpZL2tyVmJKU0dJSjhBMXFGSGtrSWhZSWVBdlY2?=
 =?utf-8?B?dno0c1IycklEK0E1aWhtRXBVdFg2SWlKVGtqSmxZVzIzOUI1SCtBamVMaEky?=
 =?utf-8?B?UDVuam1tc0lySkZtYTBSMm54VC9Idk9aQVZnZGxXcGtJalRkUEtBZFpyRTN4?=
 =?utf-8?B?RUo2eURUWG9ESVBzUDcxRTlLa2ZVNis2akdldzdlcEhybGxjRkZBajFYQ0ZM?=
 =?utf-8?B?bm5SQ2dPVVhUdW1EZkJQc2l3eVZQTmQ3L1pCeEZHWnkySjk4ZnoveHRRcThX?=
 =?utf-8?B?dlRvSUJ6M3FwMXlZRGdPKzhPdWEyY1ZzQW1hb202ZDNPbXAzbk5XWDdqVFpF?=
 =?utf-8?B?NlJwMkFGczdETWMrRGt5TDZQdENvWU94NW9OU0lkUjFkb2pKM0JYZjhqRG1K?=
 =?utf-8?B?NlpmMnBWSVVkaWg3Q0Y1UU4rT0hoSzJjVGY2ZEc4NDBuRlJkdXlUWTVIWXRp?=
 =?utf-8?B?UXFGbjZ4RmtOZnpWTTg1WnpVbUIwVEdQMk94ejMzeFo1VFp6U0JQWkJSamRh?=
 =?utf-8?B?UnE3anN6eURHV1RTYnFONENKU2gxMVZrV0EzUDlTVVJwSGJhd3hPVHNURlZz?=
 =?utf-8?B?TXJ6SmJmckVZU0dmMTdKTmNDWUNnNEdPMnFaUnpZdlJFOUtQamRkL2M2Skg1?=
 =?utf-8?B?cW1TclgwZ0tBeWcrWlYrdWZHVmlRRmo4cVY4bVIzOEViWnBkZFNhNkdqOVhy?=
 =?utf-8?B?VzVUSGtyV0FWM3dTck02cGJmMC9qdU5vQjlTZWV1Qy9tTXJlVzN6Zk9tb3V1?=
 =?utf-8?B?MHdrM1VCQXR3VWIvNWF1STdTMktWTWI4U25XSmZZejhNeGFhNExjM24yU1V5?=
 =?utf-8?B?dlZhK2VaRkJsRUt0Rzlyc1ovUC9NQkVPZ1F2REs2anNZcVVmaTFMUS9CVlBl?=
 =?utf-8?B?Rk4wcGFFWEtVZUFDY0N0STIzUDdjMXkwaTVWN1BMZVo5Y1FiL3BpeUUzMlA0?=
 =?utf-8?B?cjdyeEhZQ2haK0ZpaWZCdG5OaHN3L2s5RUZPYWZDYzhFZlZVU3kxSlR5QlhP?=
 =?utf-8?B?Y1VPaHpKQlhuYXM5RWJ2c3k5NkwwUUxkZ2ZDaStnanM0am8rYUV6VndXWWtT?=
 =?utf-8?B?SzFFRFZpaGNKdExsOEJkZlF2eGpHZzhJZk1RVWt1MSt4eXFRakZNSFFxNGRp?=
 =?utf-8?B?SndIL25LMnhkT1huMjZSejlGY0Z2OXJTdmIxQ01vSThkRG5wREZjckdlMEpp?=
 =?utf-8?B?Mytua1J0NEJDd01XaUE1TDJkVkp3bm5kelZHL1V0SzBpWS9KWmNRc0J0YSth?=
 =?utf-8?B?QmMybEcydTFSYTFMWVZZS0tSTnlXWk9GczVaMmRhdm9Ock1XcG1DMVRzazZZ?=
 =?utf-8?B?NjRBQlBXaVNSbXIwcU5GNFNGdTBrK1pUNlVTWlh2Zys1LzZLdTB1WHVIMkVi?=
 =?utf-8?B?RXRUdDVDUFZqbG0rbG56bXJKZ3VFd1dBaDZtLzdDTjByd1dGL0tOZEcybWN3?=
 =?utf-8?B?aFE4Y0tVaWlVRUxiRW5DZz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eWE5QkVjWkhNaDhxbUNqZWpoL2hWM2lTZUZ0TVc0TVFpeHVRa243bmtZWXBO?=
 =?utf-8?B?L1U3R2c1MTRtTFZkaTdiRnJDaDRZSFpXWVNid1hlbGZEbmNJeVN2VEppVEEx?=
 =?utf-8?B?TmlwTnJRRmZZRVZ5MmJzYmQ2WmxiblBlVHdKTkFJWllUck5HZ2dsT2tMTitv?=
 =?utf-8?B?dVlrK3hYa05ybWZxQTBjWU9KYUR2VXEza1NyeUd5OHRjYk54dXFhRGhpSDd4?=
 =?utf-8?B?MFpIU1BGVjUxSG0xVEdFai9TV1ZFSmZxSzFkWDc0YnlDOU1OeWJPM3M5TjZk?=
 =?utf-8?B?YTVQK1A4ODc1NHBEZGtTSXpDZDgycXFPQ2tpK1ppMGxiMGw2UEkrSkRHOXhp?=
 =?utf-8?B?dmRNTE0vWkJFdnJ1NDl6RDlOcWw4M0R4VVNNbHhqSzZkN2p2cGdCT1JoS0ty?=
 =?utf-8?B?RnF6QnZ3YnZJcDY3Q0JqbDRySVRoWXJQQmFVSEdDbnorU2syb0svOFo1T3BU?=
 =?utf-8?B?ZVJ6UW13ck1rbGhpUkxVc3J3RmVyN3FwN3NWektITEhYeVdKSU1EWVRjZHdh?=
 =?utf-8?B?NjRST1EvbUR3M053ZmtqR3FXc00zNUJLbU9hMEQvZzA1OUc1MitsSmtPek4r?=
 =?utf-8?B?WW5xUm5Oc3pSTy8zMmYyUXJEUk1KZXkvWngzVGtsSkkwYkgzUEpzcXlBb21r?=
 =?utf-8?B?THFEMTkvUFFiMXNPTE5NSGN2azhMeHNaSks1dUdMSjFUUWxHYjNEUGlwYlIr?=
 =?utf-8?B?c21jZlRnMDVyNmtGelB3eHY3OEJlcFNsTGVvcC9CcGx0SWZsdk9TeVo2NWZn?=
 =?utf-8?B?NENxKzVoLzFlTkVmNG1qOHVmaTRmRTJNeTkzcklabS8xMkNRNFFjd3RzZUd5?=
 =?utf-8?B?dm1EcTZhZG1NTVdPeTdpSzFKbXJiWEZ0UTRIVmRyT3RvcDNVR1gxMDhjZDJy?=
 =?utf-8?B?M1hOdVprQUxhV0ZOR2prSExsb2Y5RG9zY3NrempsWXBUcGlMWGxzYVBFeTVR?=
 =?utf-8?B?cUhwcEJ4ZE5lS0NEMk9FMHdlYUNwa1V3bFRzSDNEdk9CMjBXR1ZrTjZWSXhU?=
 =?utf-8?B?bFNzTVFQZ0pRVDRYMlFxNVFWQUQ1RXBoWnNTdnlyempINkw5SHp2WE5iOU1L?=
 =?utf-8?B?VllkOFFQTXRVd242QzBNaTJWZC8vRUg4WjJVeXJ6cnlmbDNMU2JCU1JQZHc5?=
 =?utf-8?B?LzRXWWozNW0weDNlaGlxZ2diZklyQjFaaEVFanpGeVBEQ3VIcjRUNjNsSVJ3?=
 =?utf-8?B?anRZdG1aUTV6NXcyWDFVQWlYOUluYzM4TXpDRllUUUZTYWpvQS9MZk1jSU1O?=
 =?utf-8?B?aE1JRnBpMHR0Znk4VVp3bjcxamlQUXNIY094eUdmcUtCVkNpRGNSbTNCSjFq?=
 =?utf-8?B?QnZjZjRFS0xNVkdzVUxvUG12OCtqQlEzTDBxdkMzRkZqNHZYZ01PNXovM1Zy?=
 =?utf-8?B?VWdYTW9RM0dIOGpGRi9KYlJtVkhvRXlNWFJ5TC9kcmh6dmxWakROWFY3KzVi?=
 =?utf-8?B?enBNN3V0c21aa0ZKaVR0MGxYMXhrMmdLWGpOYXFFdERlcEJ5ZmVhS3J1WnQw?=
 =?utf-8?B?VVVJVTdEZjY5TndiNWIzWElKQkdOa1hYY1ltQ1NXMFB4SnlqV0dBWGsvbDVu?=
 =?utf-8?B?UU56RFpsaXJ5QzUvanE1VmsrS0E3eE0zRVB1VFUrRlh3S2phM3pmS3poNGNM?=
 =?utf-8?B?ZnBuaFdJemVOVVp4ZmZmSEYxcURuMldjMHJ4V1J5M3JoQUhjOHQ3SzFRLzM3?=
 =?utf-8?B?K2F5TW5XZkhvaE96SXhSK1BxZERXRHFPc1puUkd4S25aS1ZjYkdjeVczUFZC?=
 =?utf-8?B?RlpIRGdYd1NKeHBUMldBczh1U0VGSGlCYlVwd3dNQklwS05yZTh4ODBXWnA0?=
 =?utf-8?B?bEVsVVFyZnkvbGpIUFp2dkZ2VysrNzY4aDZpMkwyM0NZUVdZU0JZMVVTTEVW?=
 =?utf-8?B?SDF4elN1V0M5WWNsU1lBR3lCT0VRbmtacllkaDdYVG9GejVXYWFXVk1laXR3?=
 =?utf-8?B?NTE0QnM4YU1NM1paRXQxb1BVUHBBc1p4VElnWEN1bUxIMjQ0cmMzRkNHNGxy?=
 =?utf-8?B?MlJYelUxMHB0THNnZUxacC9nZUcrQjJ1YjJUMEdSU1FnUHV4V1QrMTZPSmZv?=
 =?utf-8?B?MGk5MndmS0V1aDdGY0VKMVZpRkNmazl0c09zYnFkZ0lnckF2UkVXekhvQjhw?=
 =?utf-8?Q?1UTSiqLYNxVMhDr8Jsw3Ho3ec?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 104d30f7-6341-41a5-ce5b-08dcb21877fd
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Aug 2024 10:55:34.3949 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: v4z3jyMEFhIO7TamtRG4dcLBwOqfTRNhyJI4F3dKe5D+K3NgYDMTkTQkygGjiVKd
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB7028
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



Am 01.08.24 um 12:45 schrieb Huan Yang:
> Currently vmap_udmabuf set page's array by each folio.
> But, ubuf->folios is only contain's the folio's head page.
>
> That mean we repeatedly mapped the folio head page to the vmalloc area.
>
> This patch fix it, set each folio's page correct, so that pages array
> contains right page, and then map into vmalloc area
>
> Signed-off-by: Huan Yang <link@vivo.com>
> ---
>   drivers/dma-buf/udmabuf.c | 17 +++++++++++++----
>   1 file changed, 13 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/dma-buf/udmabuf.c b/drivers/dma-buf/udmabuf.c
> index a915714c5dce..7ed532342d7f 100644
> --- a/drivers/dma-buf/udmabuf.c
> +++ b/drivers/dma-buf/udmabuf.c
> @@ -77,18 +77,27 @@ static int mmap_udmabuf(struct dma_buf *buf, struct vm_area_struct *vma)
>   static int vmap_udmabuf(struct dma_buf *buf, struct iosys_map *map)
>   {
>   	struct udmabuf *ubuf = buf->priv;
> -	struct page **pages;
> +	struct page **pages, **tmp;
> +	struct sg_table *sg = ubuf->sg;
> +	struct sg_page_iter piter;
>   	void *vaddr;
> -	pgoff_t pg;
>   
>   	dma_resv_assert_held(buf->resv);
>   
> +	if (!sg) {
> +		sg = get_sg_table(NULL, buf, 0);
> +		if (IS_ERR(sg))
> +			return PTR_ERR(sg);
> +		ubuf->sg = sg;
> +	}
> +
>   	pages = kvmalloc_array(ubuf->pagecount, sizeof(*pages), GFP_KERNEL);
>   	if (!pages)
>   		return -ENOMEM;
> +	tmp = pages;
>   
> -	for (pg = 0; pg < ubuf->pagecount; pg++)
> -		pages[pg] = &ubuf->folios[pg]->page;
> +	for_each_sgtable_page(sg, &piter, 0)
> +		*tmp++ = sg_page_iter_page(&piter);

Again don't abuse the sg table for that!

Regards,
Christian.

>   
>   	vaddr = vm_map_ram(pages, ubuf->pagecount, -1);
>   	kvfree(pages);

