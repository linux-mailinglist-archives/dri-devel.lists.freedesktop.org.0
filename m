Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 916C7D3A392
	for <lists+dri-devel@lfdr.de>; Mon, 19 Jan 2026 10:45:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E38210E3EB;
	Mon, 19 Jan 2026 09:45:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="pRDmCO7E";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PH0PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11011018.outbound.protection.outlook.com [40.107.208.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C9E310E3EB
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Jan 2026 09:45:39 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sLrQE4k2Vlc8sBuWldybjhaoUEXBnBwfTaRRSeMWQ+rUoCKnHIcvPztWuWveiW3sixyKqD0x0yjIXGRBmPaWNebGnhA3/fxt3fkyhK5IptWswOAigQ/ggUlHjau70cjjo93fdkdk5Xamct9gnV35Ef4GVOSBEbp6+pL1csGH+bsCLLz/SSYjaGBS/Sl31Co0ScHTd+iSYyIhKU9dGqBqTFDsisJZLoE2kvAXGzF7k3B+7Lp7A1Gr9PodRT09AR3F1knGsk8ctSNaPzNUUt9UcV40t9wE84lTDdnEaLr9JTKJppG52N+6lJ+klhJ+uOcWR/P5fASDLY7WHdPHjdRB+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eVRebsWA/sp5vQ0DFOZ6p+Wl2BgmSOFGOBNo+TJYB5g=;
 b=eMdh8v7JhvAxWmiNjoENn/GG8eaFC8u6LBErMI1VN/QUFq5Y7G32czJXAfwXN8n/rKlo+Rb/SaFrht9DMyJNY/PE9E1TU9qQeOsdO0lutDm1/tgWp+CMTERyDvis6fF96obxS4Ct4pv8/6OG1MMM1RpkuzMs7JDgObjZM3L0OLn0gRlqBxgg4BvqUDb3TC+CxK9CL4cGIU++vlMto1F9tYiQl0cuCwmYy33jFned1zMBt61WWBW0jcr/8zf+PAXMMzbxC8eWNsMgeQeUEfCYYi6te/yLjlmD615ViOmYnWcTYdwto+5Xu/dR6BHbDOgicyGOIV16LlVoDGOqLgHHmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eVRebsWA/sp5vQ0DFOZ6p+Wl2BgmSOFGOBNo+TJYB5g=;
 b=pRDmCO7Egf8bKiH1aR53diArPwMEYWJhTRGcVf03+ORBEyF8sj4wXkoqLA6U3IEntSbp72mmP/gV9vRuDzeh+4UvRjf+6asjm9W9EUCKcbkb7YKRNKe6E566lFUxISTSJPxcV+jqAg36Yl8hwFV4FPpg1IX5kVr8zQvVwWih6SY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by DS2PR12MB9565.namprd12.prod.outlook.com (2603:10b6:8:279::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.11; Mon, 19 Jan
 2026 09:45:34 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%4]) with mapi id 15.20.9520.011; Mon, 19 Jan 2026
 09:45:34 +0000
Message-ID: <4cd1ed61-0b19-45ef-a77c-7fccde818ae9@amd.com>
Date: Mon, 19 Jan 2026 10:45:28 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dma-buf: Remove DMA-BUF sysfs stats
To: "T.J. Mercier" <tjmercier@google.com>,
 Sumit Semwal <sumit.semwal@linaro.org>, Jonathan Corbet <corbet@lwn.net>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 linux-doc@vger.kernel.org
References: <20260116190517.3268458-1-tjmercier@google.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20260116190517.3268458-1-tjmercier@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0112.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:bb::11) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|DS2PR12MB9565:EE_
X-MS-Office365-Filtering-Correlation-Id: fa63d8ba-1acd-4226-c3a3-08de573f7e12
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dWE3QVdHV0oyUnQrb245N0I2WWVBVG1uNitmOXNHZllIQmZVM1pINkhmOVZ0?=
 =?utf-8?B?aG85ekVXaHRKdVNmcVZsV2kybTh2OWsydExXQnBXWWd2bnlUaTVDQWphb200?=
 =?utf-8?B?MnB5dUFZdG55UlhQZzBGRWhzQk1aaE9nbGRGb3BmaGsxdzFsa1B3YjV6dHc4?=
 =?utf-8?B?NU9rNWhLcUIyVk1IMk5BcGxxaTdaMnpSTThIRFNFcDhyM3hudHNFVmZiUTh1?=
 =?utf-8?B?a043YlIxMjVrME8rWGI4bkd2bktNT0NPQzV2THJxZHlEakFPZGRMajNvTWNx?=
 =?utf-8?B?SmRtL1V0WHhrT3luNkFlNHllaDNWVXc2UXZRVFAyZld3cWIwSkxsUEVudWZi?=
 =?utf-8?B?MUJPQThrNDhab2EzMXFvZnJsQmF6U1E3bmh1aXZxcFhGSWpZV1RwSW1IdmZo?=
 =?utf-8?B?OFFZMXh3dnpiQisreFRIRFpOdUZnU3ZZa2h3SEVma09zdTdNdWxqRjM2QXpO?=
 =?utf-8?B?ZkxQMEFnZmx4WkFvRDI2KzBIYlorR0VXaVlQVHZrYW1WaUpXZFpacHlQQ1Vi?=
 =?utf-8?B?MVhPZEh0dkJuMEhxMUlmSHRDbVZjeVNaT0ZUN1lKcFIxMGFuNUprUGY2dnp3?=
 =?utf-8?B?RURxVkplTGdRUHEwNTRMVFlxZ0dGUllJT0tERElxSU5ZSGFRS0hrR0plR09l?=
 =?utf-8?B?TlQ5bGhjblJRekhQejh5em4wZlpYandVWUZVdEhTQ2M0aFFjNk1QaVBteldr?=
 =?utf-8?B?ekp0UXI4blM2cjlKK2VNMkpKNTJtVllKUEwxVkNUNnh3NVVHd2VQRURiclNw?=
 =?utf-8?B?clV0T3FiQ2c1RTFyZmxsb2JnWlJBVXM4VXlCcURvS1J5dVdmcng0eHlmQ1NK?=
 =?utf-8?B?MGt4Wkh4OC8zQ2FZdXJmQ2ppdFE0Z1IwU3BhMHc2Q0lLVlRQY3JxZzlHOEo0?=
 =?utf-8?B?aE5wMjNwbllSL0JINXdOZG50QXFFd0g4bDQ5UHZmYjhrbDIyQzhKUG9TRVVM?=
 =?utf-8?B?MmZ2MFhsMklpb2xNeXBWUGg5UUduTkhpS1Z0M0taTzY0YVRyOXBFckI5d3Q2?=
 =?utf-8?B?MkUzVjUyeG13cG45WHZ1a2hsbUd1WHlZdDF5RVp0ZUliZUJmaUZTZ1VLLzJl?=
 =?utf-8?B?K2pWSXBycENydjdVTzAydC8vazM3cTFXMW82RUc4RjJlUm93bXZUQ3I1a3RQ?=
 =?utf-8?B?a1k4N3FOZDJYOGo1NnBoVm92QXhSR3BvdnI0eW1XU2JvZFJuMEoraE9SZ0cy?=
 =?utf-8?B?WllmN3QxUHhkblRJTGRFUU5hci9nQVMyaFByN25XQ1I4Sy9mTHFpQndydnd6?=
 =?utf-8?B?L1ppanp5WEg1YzgwVzExWE1pdEpzT0ZRVEJkWlZYdW5ZdkNYb2NtRDF2OEYz?=
 =?utf-8?B?Q080RERQdGtKak8wVXBuSXNIMndSaVZEOFFJRWxUcTlUdExrYzNJVmNZU2FJ?=
 =?utf-8?B?ckQ1UGxXZWhNc1FZQnRsbmFzby8wQWowV3UrUG4wNXBDMStibC9IL0Z6UXJJ?=
 =?utf-8?B?UkNjc2d1eVkvN1YrVFlGMTFxMnlFRU5uYVd5b3NKODB0cnZYcnNad3JDZ1F2?=
 =?utf-8?B?VUgyWXEwSmJGNWdBcW4xODg4RUsrNCtnenh3WFMxVE9vMmVOb3d3Y1hwaUdH?=
 =?utf-8?B?TGRyUXBPaHplQzVISU5lWE1DeWJQRjJCRlE4ZlZoc3FtN042RjZYbWZ1YXZF?=
 =?utf-8?B?YzNmYXhuYU9LSXI3YUVEdm1NRVZvbThWM3YreDNVTCtqejUrcTRGZUI1STFl?=
 =?utf-8?B?NU1Wc1FTTEFXbGlIL2NaSnQyMEM1QlBRRnhuOVFyQWtpRDRSZ0JDbmRUYmpi?=
 =?utf-8?B?RU5iek41R1RDS1BVWE41eUM2dEFIcXpEaHoydXRBczE0UFBJZGhqR0VxNWJS?=
 =?utf-8?B?ZTAwRmhPSFlrVlBlaG5ZckRLSEYzOFhGajRGSEFwYTRnSjVUb21uLytnRXgy?=
 =?utf-8?B?bmxQTitRMnVnTXQ3Q0xpSVhxMVdtRTVYWVdRTldOR1c1YzlOR3RXNmxGMmpP?=
 =?utf-8?B?Qk9oa1FUWXhDdG5QOFZuZUVEOGxLOGl3NXBhQ1ZSd1A0SDNUTmZTSy8wU1M4?=
 =?utf-8?B?aVRkbE15dlpwK0NZa1dNTjFFd1ZmajlBaHlRUXFxaWE1OUswNVRPTTB3UEpQ?=
 =?utf-8?Q?9aprkZ?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dFhUcm9taW1IV0FrVGJpMkl1ZGZ3MzdYdDFwaFAzSXZJUWU2ZWhGdjFkV05v?=
 =?utf-8?B?Q3FSMm0xVlE1Rml2RklkTGlQZ2FEaytxZFVkcnBwT2RyZ29Vb0NCQU1tZTJ1?=
 =?utf-8?B?VzF0YjhsSDRPd0NuSzduYkg1dDR3dTkvempaY0VYbi9OYi85RmNvbE83V3JP?=
 =?utf-8?B?NTFhVmlOSzhYOHVBbEU5Q1hnY2tPS1VDelQ1MkRKaUlieUtkeVprbnlKbFZB?=
 =?utf-8?B?dGcxTVJSd0dsUGxycU05THRDNUpJQ1VSTWlqVExJVkwwWnNjM2pVbDc0dnd1?=
 =?utf-8?B?c0VGOWIwMGdlQWF5cFBjUWpOT3d1RXdqTFBPWDVkNm11ZDlhT2lrR3F1eis1?=
 =?utf-8?B?a0R6TWgxNzlyNjFqUEtEN2dDbTl2QnFkZFZiZlFqSWhkM2wyUXZJa0xsVFlR?=
 =?utf-8?B?ZENXam8xMjdncVZrRXN6Y1RwWDUwdFN2TVQyMjNIOXJDenBRcmxMLy9nNm03?=
 =?utf-8?B?Vk85RmdJaWE5Tkg2QWpVd0tVdXd3eXRiRkVaV1JvdXdyUUx3WmplV0hPS2Ew?=
 =?utf-8?B?NzZvTlZJaEg0VWUwQzkvcXFoMzhkd2pTSm0wUWNzM2NwOHZNZWxXODJudkhy?=
 =?utf-8?B?N09iV29NTmZBb2JlR3ZTWlFNZHk3Tm5ybXhwUHhBVmVxUDh1QkpOSHByZkUz?=
 =?utf-8?B?NHJLK1d5eFoyQ2J2SzlxL1dBYUxCZHVVb0xEUnVkcmdXN05kUldsdWpTMDd2?=
 =?utf-8?B?MURPd2dhekM5dkJPcDgxcDVSTEJZOHllY3lWSFpJelRvNjlVU2N1bTVPRmNY?=
 =?utf-8?B?cGdFWUJ5VUxYZlJyVkU1LzVobGIxeHY1TXQ1L3lXaEJlYVY1WmZxN0Zpc2Fi?=
 =?utf-8?B?UXV4aXdEWlpjRjFZWE14YVBOOElIL0txcGJORURMWTIyTmUxRzdldmVkb0Vh?=
 =?utf-8?B?dzl1N3JPT2JVTEtSZzUveENaNlhGbkVkK3g1YytkVVpzTVdBUWJjcU1MZTdu?=
 =?utf-8?B?NXpHaVlEYmVlVFBoZythWkFWV1NXbU9PclVGRDJrWDhWZTNRRjUvOTZFTDVR?=
 =?utf-8?B?VDcwT1RNN2xsTE13eTZJVDFqT1MraXh1YzNBZ0phWmlWMWRmMEZIUHRMSWRp?=
 =?utf-8?B?V3VFN3g2aGJvZHE2SVlLZkRqai91czlJWW5tVnBOdGErdnpTL1hqR29LeUE1?=
 =?utf-8?B?NmpZMWlxTFFnbjNEZFZwQWJjdnhzcGRJdHU4U1Y1WnNyblhnV016Mzg1MUtO?=
 =?utf-8?B?YVNZOXNXcVN1dU9JWkRERFBqTXA0R0Q2OVh0Vk8rZzFmWkNvWU1sTTgrSzln?=
 =?utf-8?B?amYzVzJXbEozT29qc2lzQllJTDlJY0Q2Y21ZRzNBV01vSVBKRzRUekRLSDF5?=
 =?utf-8?B?M1RxZzZRVFlkK2xpZytFVENBZk9aN0R6bjdKcFM4ZjRFWnJZV2MxWjJ6eW5n?=
 =?utf-8?B?djhrZzhwK0p4T3pxVktlVGppdTlOMllxaklKY3o5YmdsVVg5MlFvY3Y5N2lU?=
 =?utf-8?B?TmlNMW8vY0txb1BaczlqOFNvYUIxbTg0a1NwV0FxSUlOc25pRHFSeFlCR3ho?=
 =?utf-8?B?akxUQTFTdldyUElBMXpLaTU4NmZLdVBITjEwNktWNmV5T2wvTDJ2NHExYnNC?=
 =?utf-8?B?b1JqdnpscEtBSk44TWJ3cHNHbFNnVGI0VGdSazFURnBqY1Y4aXlwS1FOWlYr?=
 =?utf-8?B?MFZQOTZzRmhlUEhEK084SVNYcUZpM2Z4NnlaSVBBZGNwa1R1MXg5aEpDNml3?=
 =?utf-8?B?cDliSit3Smw3a1NPMWNHNi9oODFSV2Q0UUpEcVNEdUZmZ3l2aWFsNEhYMk9a?=
 =?utf-8?B?L2c2TVhwRWdkdzEvRVAwZlhSeitrcUFVYXh3L0xoaVlsNWpNLzlDQkt2VkhQ?=
 =?utf-8?B?L3JHeTlZYndrWmlGQWlQcnBsYTdVOWRRQ2M5U3lxWTZTMVhPTUs5MXZCeW5L?=
 =?utf-8?B?T2F5aGdnNzdGOWxSbURXc2VKUEZXUlR6SURmZkhJdWFvU2FSc2dZbUJiV3Ur?=
 =?utf-8?B?QlZjNE9nY0FoNFVsRUFNUHVvWHdnaUlpa244ekJXNXBXK1ZVdnpGWkNUOVpy?=
 =?utf-8?B?QlR3T0pwcjJwQThVdjRBNXBpOWlLcUIxRFk5bndNVDFLMTdpY3lMbEF1Uml5?=
 =?utf-8?B?T1ZKRDJ3VkxQcnJWOUFDVTllU3FUeFJxcUlPQWFxZTBMcjFXL1RTcjRvRTFa?=
 =?utf-8?B?N0dYV1dIWks1c3B1WXFibjRUeWFwK3IzZVI1UGFiVUUzMmZxMSt0d1B0TEda?=
 =?utf-8?B?VWgraDk0Vm5yRUZ3Yzd5cnR5RGNCNHZMOUF5T3M5Y0JXK1BWSWVQcFZZMmR6?=
 =?utf-8?B?RkJLMlozWHJCV3BlVjBlY015OXFFUmRHUVJnaEtmNE1xb29SakZjTjRhbFJV?=
 =?utf-8?Q?kWR2DgkaTzAY7PXIjU?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fa63d8ba-1acd-4226-c3a3-08de573f7e12
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jan 2026 09:45:34.4744 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0lIgIn8GfpmGS6VNMBv1QWkXtgmDS6EUqChwQMKgcvHim2o1lvl21up2BgkBqbnh
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS2PR12MB9565
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

On 1/16/26 20:05, T.J. Mercier wrote:
> Commit bdb8d06dfefd ("dmabuf: Add the capability to expose DMA-BUF stats
> in sysfs") added dmabuf statistics to sysfs in 2021 under
> CONFIG_DMABUF_SYSFS_STATS. After being used in production, performance
> problems were discovered leading to its deprecation in 2022 in commit
> e0a9f1fe206a ("dma-buf: deprecate DMABUF_SYSFS_STATS"). Some of the
> problems with this interface were discussed in my LPC 2025 talk. [1][2]
> 
> Android was probably the last user of the interface, which has since
> been migrated to use the dmabuf BPF iterator [3] to obtain the same
> information more cheaply. As promised in that series, now that the
> longterm stable 6.18 kernel has been released let's remove the sysfs
> dmabuf statistics from the kernel.
> 
> [1] https://www.youtube.com/watch?v=D83qygudq9c
> [2] https://lpc.events/event/19/contributions/2118/
> [3] https://lore.kernel.org/all/20250522230429.941193-1-tjmercier@google.com/
> 
> Signed-off-by: T.J. Mercier <tjmercier@google.com>

Oh yes please :)

Reviewed-by: Christian König <christian.koenig@amd.com>

> ---
>  .../ABI/testing/sysfs-kernel-dmabuf-buffers   |  24 ---
>  Documentation/driver-api/dma-buf.rst          |   5 -
>  drivers/dma-buf/Kconfig                       |  15 --
>  drivers/dma-buf/Makefile                      |   1 -
>  drivers/dma-buf/dma-buf-sysfs-stats.c         | 202 ------------------
>  drivers/dma-buf/dma-buf-sysfs-stats.h         |  35 ---
>  drivers/dma-buf/dma-buf.c                     |  18 --
>  include/linux/dma-buf.h                       |  12 --
>  8 files changed, 312 deletions(-)
>  delete mode 100644 Documentation/ABI/testing/sysfs-kernel-dmabuf-buffers
>  delete mode 100644 drivers/dma-buf/dma-buf-sysfs-stats.c
>  delete mode 100644 drivers/dma-buf/dma-buf-sysfs-stats.h
> 
> diff --git a/Documentation/ABI/testing/sysfs-kernel-dmabuf-buffers b/Documentation/ABI/testing/sysfs-kernel-dmabuf-buffers
> deleted file mode 100644
> index 5d3bc997dc64..000000000000
> --- a/Documentation/ABI/testing/sysfs-kernel-dmabuf-buffers
> +++ /dev/null
> @@ -1,24 +0,0 @@
> -What:		/sys/kernel/dmabuf/buffers
> -Date:		May 2021
> -KernelVersion:	v5.13
> -Contact:	Hridya Valsaraju <hridya@google.com>
> -Description:	The /sys/kernel/dmabuf/buffers directory contains a
> -		snapshot of the internal state of every DMA-BUF.
> -		/sys/kernel/dmabuf/buffers/<inode_number> will contain the
> -		statistics for the DMA-BUF with the unique inode number
> -		<inode_number>
> -Users:		kernel memory tuning/debugging tools
> -
> -What:		/sys/kernel/dmabuf/buffers/<inode_number>/exporter_name
> -Date:		May 2021
> -KernelVersion:	v5.13
> -Contact:	Hridya Valsaraju <hridya@google.com>
> -Description:	This file is read-only and contains the name of the exporter of
> -		the DMA-BUF.
> -
> -What:		/sys/kernel/dmabuf/buffers/<inode_number>/size
> -Date:		May 2021
> -KernelVersion:	v5.13
> -Contact:	Hridya Valsaraju <hridya@google.com>
> -Description:	This file is read-only and specifies the size of the DMA-BUF in
> -		bytes.
> diff --git a/Documentation/driver-api/dma-buf.rst b/Documentation/driver-api/dma-buf.rst
> index 29abf1eebf9f..2f36c21d9948 100644
> --- a/Documentation/driver-api/dma-buf.rst
> +++ b/Documentation/driver-api/dma-buf.rst
> @@ -125,11 +125,6 @@ Implicit Fence Poll Support
>  .. kernel-doc:: drivers/dma-buf/dma-buf.c
>     :doc: implicit fence polling
>  
> -DMA-BUF statistics
> -~~~~~~~~~~~~~~~~~~
> -.. kernel-doc:: drivers/dma-buf/dma-buf-sysfs-stats.c
> -   :doc: overview
> -
>  DMA Buffer ioctls
>  ~~~~~~~~~~~~~~~~~
>  
> diff --git a/drivers/dma-buf/Kconfig b/drivers/dma-buf/Kconfig
> index fdd823e446cc..012d22e941d6 100644
> --- a/drivers/dma-buf/Kconfig
> +++ b/drivers/dma-buf/Kconfig
> @@ -75,21 +75,6 @@ menuconfig DMABUF_HEAPS
>  	  allows userspace to allocate dma-bufs that can be shared
>  	  between drivers.
>  
> -menuconfig DMABUF_SYSFS_STATS
> -	bool "DMA-BUF sysfs statistics (DEPRECATED)"
> -	depends on DMA_SHARED_BUFFER
> -	help
> -	   Choose this option to enable DMA-BUF sysfs statistics
> -	   in location /sys/kernel/dmabuf/buffers.
> -
> -	   /sys/kernel/dmabuf/buffers/<inode_number> will contain
> -	   statistics for the DMA-BUF with the unique inode number
> -	   <inode_number>.
> -
> -	   This option is deprecated and should sooner or later be removed.
> -	   Android is the only user of this and it turned out that this resulted
> -	   in quite some performance problems.
> -
>  source "drivers/dma-buf/heaps/Kconfig"
>  
>  endmenu
> diff --git a/drivers/dma-buf/Makefile b/drivers/dma-buf/Makefile
> index 2008fb7481b3..7a85565d906b 100644
> --- a/drivers/dma-buf/Makefile
> +++ b/drivers/dma-buf/Makefile
> @@ -6,7 +6,6 @@ obj-$(CONFIG_DMABUF_HEAPS)	+= heaps/
>  obj-$(CONFIG_SYNC_FILE)		+= sync_file.o
>  obj-$(CONFIG_SW_SYNC)		+= sw_sync.o sync_debug.o
>  obj-$(CONFIG_UDMABUF)		+= udmabuf.o
> -obj-$(CONFIG_DMABUF_SYSFS_STATS) += dma-buf-sysfs-stats.o
>  
>  dmabuf_selftests-y := \
>  	selftest.o \
> diff --git a/drivers/dma-buf/dma-buf-sysfs-stats.c b/drivers/dma-buf/dma-buf-sysfs-stats.c
> deleted file mode 100644
> index b5b62e40ccc1..000000000000
> --- a/drivers/dma-buf/dma-buf-sysfs-stats.c
> +++ /dev/null
> @@ -1,202 +0,0 @@
> -// SPDX-License-Identifier: GPL-2.0-only
> -/*
> - * DMA-BUF sysfs statistics.
> - *
> - * Copyright (C) 2021 Google LLC.
> - */
> -
> -#include <linux/dma-buf.h>
> -#include <linux/dma-resv.h>
> -#include <linux/kobject.h>
> -#include <linux/printk.h>
> -#include <linux/slab.h>
> -#include <linux/sysfs.h>
> -
> -#include "dma-buf-sysfs-stats.h"
> -
> -#define to_dma_buf_entry_from_kobj(x) container_of(x, struct dma_buf_sysfs_entry, kobj)
> -
> -/**
> - * DOC: overview
> - *
> - * ``/sys/kernel/debug/dma_buf/bufinfo`` provides an overview of every DMA-BUF
> - * in the system. However, since debugfs is not safe to be mounted in
> - * production, procfs and sysfs can be used to gather DMA-BUF statistics on
> - * production systems.
> - *
> - * The ``/proc/<pid>/fdinfo/<fd>`` files in procfs can be used to gather
> - * information about DMA-BUF fds. Detailed documentation about the interface
> - * is present in Documentation/filesystems/proc.rst.
> - *
> - * Unfortunately, the existing procfs interfaces can only provide information
> - * about the DMA-BUFs for which processes hold fds or have the buffers mmapped
> - * into their address space. This necessitated the creation of the DMA-BUF sysfs
> - * statistics interface to provide per-buffer information on production systems.
> - *
> - * The interface at ``/sys/kernel/dmabuf/buffers`` exposes information about
> - * every DMA-BUF when ``CONFIG_DMABUF_SYSFS_STATS`` is enabled.
> - *
> - * The following stats are exposed by the interface:
> - *
> - * * ``/sys/kernel/dmabuf/buffers/<inode_number>/exporter_name``
> - * * ``/sys/kernel/dmabuf/buffers/<inode_number>/size``
> - *
> - * The information in the interface can also be used to derive per-exporter
> - * statistics. The data from the interface can be gathered on error conditions
> - * or other important events to provide a snapshot of DMA-BUF usage.
> - * It can also be collected periodically by telemetry to monitor various metrics.
> - *
> - * Detailed documentation about the interface is present in
> - * Documentation/ABI/testing/sysfs-kernel-dmabuf-buffers.
> - */
> -
> -struct dma_buf_stats_attribute {
> -	struct attribute attr;
> -	ssize_t (*show)(struct dma_buf *dmabuf,
> -			struct dma_buf_stats_attribute *attr, char *buf);
> -};
> -#define to_dma_buf_stats_attr(x) container_of(x, struct dma_buf_stats_attribute, attr)
> -
> -static ssize_t dma_buf_stats_attribute_show(struct kobject *kobj,
> -					    struct attribute *attr,
> -					    char *buf)
> -{
> -	struct dma_buf_stats_attribute *attribute;
> -	struct dma_buf_sysfs_entry *sysfs_entry;
> -	struct dma_buf *dmabuf;
> -
> -	attribute = to_dma_buf_stats_attr(attr);
> -	sysfs_entry = to_dma_buf_entry_from_kobj(kobj);
> -	dmabuf = sysfs_entry->dmabuf;
> -
> -	if (!dmabuf || !attribute->show)
> -		return -EIO;
> -
> -	return attribute->show(dmabuf, attribute, buf);
> -}
> -
> -static const struct sysfs_ops dma_buf_stats_sysfs_ops = {
> -	.show = dma_buf_stats_attribute_show,
> -};
> -
> -static ssize_t exporter_name_show(struct dma_buf *dmabuf,
> -				  struct dma_buf_stats_attribute *attr,
> -				  char *buf)
> -{
> -	return sysfs_emit(buf, "%s\n", dmabuf->exp_name);
> -}
> -
> -static ssize_t size_show(struct dma_buf *dmabuf,
> -			 struct dma_buf_stats_attribute *attr,
> -			 char *buf)
> -{
> -	return sysfs_emit(buf, "%zu\n", dmabuf->size);
> -}
> -
> -static struct dma_buf_stats_attribute exporter_name_attribute =
> -	__ATTR_RO(exporter_name);
> -static struct dma_buf_stats_attribute size_attribute = __ATTR_RO(size);
> -
> -static struct attribute *dma_buf_stats_default_attrs[] = {
> -	&exporter_name_attribute.attr,
> -	&size_attribute.attr,
> -	NULL,
> -};
> -ATTRIBUTE_GROUPS(dma_buf_stats_default);
> -
> -static void dma_buf_sysfs_release(struct kobject *kobj)
> -{
> -	struct dma_buf_sysfs_entry *sysfs_entry;
> -
> -	sysfs_entry = to_dma_buf_entry_from_kobj(kobj);
> -	kfree(sysfs_entry);
> -}
> -
> -static const struct kobj_type dma_buf_ktype = {
> -	.sysfs_ops = &dma_buf_stats_sysfs_ops,
> -	.release = dma_buf_sysfs_release,
> -	.default_groups = dma_buf_stats_default_groups,
> -};
> -
> -void dma_buf_stats_teardown(struct dma_buf *dmabuf)
> -{
> -	struct dma_buf_sysfs_entry *sysfs_entry;
> -
> -	sysfs_entry = dmabuf->sysfs_entry;
> -	if (!sysfs_entry)
> -		return;
> -
> -	kobject_del(&sysfs_entry->kobj);
> -	kobject_put(&sysfs_entry->kobj);
> -}
> -
> -
> -/* Statistics files do not need to send uevents. */
> -static int dmabuf_sysfs_uevent_filter(const struct kobject *kobj)
> -{
> -	return 0;
> -}
> -
> -static const struct kset_uevent_ops dmabuf_sysfs_no_uevent_ops = {
> -	.filter = dmabuf_sysfs_uevent_filter,
> -};
> -
> -static struct kset *dma_buf_stats_kset;
> -static struct kset *dma_buf_per_buffer_stats_kset;
> -int dma_buf_init_sysfs_statistics(void)
> -{
> -	dma_buf_stats_kset = kset_create_and_add("dmabuf",
> -						 &dmabuf_sysfs_no_uevent_ops,
> -						 kernel_kobj);
> -	if (!dma_buf_stats_kset)
> -		return -ENOMEM;
> -
> -	dma_buf_per_buffer_stats_kset = kset_create_and_add("buffers",
> -							    &dmabuf_sysfs_no_uevent_ops,
> -							    &dma_buf_stats_kset->kobj);
> -	if (!dma_buf_per_buffer_stats_kset) {
> -		kset_unregister(dma_buf_stats_kset);
> -		return -ENOMEM;
> -	}
> -
> -	return 0;
> -}
> -
> -void dma_buf_uninit_sysfs_statistics(void)
> -{
> -	kset_unregister(dma_buf_per_buffer_stats_kset);
> -	kset_unregister(dma_buf_stats_kset);
> -}
> -
> -int dma_buf_stats_setup(struct dma_buf *dmabuf, struct file *file)
> -{
> -	struct dma_buf_sysfs_entry *sysfs_entry;
> -	int ret;
> -
> -	if (!dmabuf->exp_name) {
> -		pr_err("exporter name must not be empty if stats needed\n");
> -		return -EINVAL;
> -	}
> -
> -	sysfs_entry = kzalloc(sizeof(struct dma_buf_sysfs_entry), GFP_KERNEL);
> -	if (!sysfs_entry)
> -		return -ENOMEM;
> -
> -	sysfs_entry->kobj.kset = dma_buf_per_buffer_stats_kset;
> -	sysfs_entry->dmabuf = dmabuf;
> -
> -	dmabuf->sysfs_entry = sysfs_entry;
> -
> -	/* create the directory for buffer stats */
> -	ret = kobject_init_and_add(&sysfs_entry->kobj, &dma_buf_ktype, NULL,
> -				   "%lu", file_inode(file)->i_ino);
> -	if (ret)
> -		goto err_sysfs_dmabuf;
> -
> -	return 0;
> -
> -err_sysfs_dmabuf:
> -	kobject_put(&sysfs_entry->kobj);
> -	dmabuf->sysfs_entry = NULL;
> -	return ret;
> -}
> diff --git a/drivers/dma-buf/dma-buf-sysfs-stats.h b/drivers/dma-buf/dma-buf-sysfs-stats.h
> deleted file mode 100644
> index 7a8a995b75ba..000000000000
> --- a/drivers/dma-buf/dma-buf-sysfs-stats.h
> +++ /dev/null
> @@ -1,35 +0,0 @@
> -/* SPDX-License-Identifier: GPL-2.0-only */
> -/*
> - * DMA-BUF sysfs statistics.
> - *
> - * Copyright (C) 2021 Google LLC.
> - */
> -
> -#ifndef _DMA_BUF_SYSFS_STATS_H
> -#define _DMA_BUF_SYSFS_STATS_H
> -
> -#ifdef CONFIG_DMABUF_SYSFS_STATS
> -
> -int dma_buf_init_sysfs_statistics(void);
> -void dma_buf_uninit_sysfs_statistics(void);
> -
> -int dma_buf_stats_setup(struct dma_buf *dmabuf, struct file *file);
> -
> -void dma_buf_stats_teardown(struct dma_buf *dmabuf);
> -#else
> -
> -static inline int dma_buf_init_sysfs_statistics(void)
> -{
> -	return 0;
> -}
> -
> -static inline void dma_buf_uninit_sysfs_statistics(void) {}
> -
> -static inline int dma_buf_stats_setup(struct dma_buf *dmabuf, struct file *file)
> -{
> -	return 0;
> -}
> -
> -static inline void dma_buf_stats_teardown(struct dma_buf *dmabuf) {}
> -#endif
> -#endif // _DMA_BUF_SYSFS_STATS_H
> diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
> index a4d8f2ff94e4..8e23580f1754 100644
> --- a/drivers/dma-buf/dma-buf.c
> +++ b/drivers/dma-buf/dma-buf.c
> @@ -33,8 +33,6 @@
>  #include <uapi/linux/dma-buf.h>
>  #include <uapi/linux/magic.h>
>  
> -#include "dma-buf-sysfs-stats.h"
> -
>  #define CREATE_TRACE_POINTS
>  #include <trace/events/dma_buf.h>
>  
> @@ -184,7 +182,6 @@ static void dma_buf_release(struct dentry *dentry)
>  	 */
>  	BUG_ON(dmabuf->cb_in.active || dmabuf->cb_out.active);
>  
> -	dma_buf_stats_teardown(dmabuf);
>  	dmabuf->ops->release(dmabuf);
>  
>  	if (dmabuf->resv == (struct dma_resv *)&dmabuf[1])
> @@ -765,10 +762,6 @@ struct dma_buf *dma_buf_export(const struct dma_buf_export_info *exp_info)
>  		dmabuf->resv = resv;
>  	}
>  
> -	ret = dma_buf_stats_setup(dmabuf, file);
> -	if (ret)
> -		goto err_dmabuf;
> -
>  	file->private_data = dmabuf;
>  	file->f_path.dentry->d_fsdata = dmabuf;
>  	dmabuf->file = file;
> @@ -779,10 +772,6 @@ struct dma_buf *dma_buf_export(const struct dma_buf_export_info *exp_info)
>  
>  	return dmabuf;
>  
> -err_dmabuf:
> -	if (!resv)
> -		dma_resv_fini(dmabuf->resv);
> -	kfree(dmabuf);
>  err_file:
>  	fput(file);
>  err_module:
> @@ -1802,12 +1791,6 @@ static inline void dma_buf_uninit_debugfs(void)
>  
>  static int __init dma_buf_init(void)
>  {
> -	int ret;
> -
> -	ret = dma_buf_init_sysfs_statistics();
> -	if (ret)
> -		return ret;
> -
>  	dma_buf_mnt = kern_mount(&dma_buf_fs_type);
>  	if (IS_ERR(dma_buf_mnt))
>  		return PTR_ERR(dma_buf_mnt);
> @@ -1821,6 +1804,5 @@ static void __exit dma_buf_deinit(void)
>  {
>  	dma_buf_uninit_debugfs();
>  	kern_unmount(dma_buf_mnt);
> -	dma_buf_uninit_sysfs_statistics();
>  }
>  __exitcall(dma_buf_deinit);
> diff --git a/include/linux/dma-buf.h b/include/linux/dma-buf.h
> index 0bc492090237..91f4939db89b 100644
> --- a/include/linux/dma-buf.h
> +++ b/include/linux/dma-buf.h
> @@ -429,18 +429,6 @@ struct dma_buf {
>  
>  		__poll_t active;
>  	} cb_in, cb_out;
> -#ifdef CONFIG_DMABUF_SYSFS_STATS
> -	/**
> -	 * @sysfs_entry:
> -	 *
> -	 * For exposing information about this buffer in sysfs. See also
> -	 * `DMA-BUF statistics`_ for the uapi this enables.
> -	 */
> -	struct dma_buf_sysfs_entry {
> -		struct kobject kobj;
> -		struct dma_buf *dmabuf;
> -	} *sysfs_entry;
> -#endif
>  };
>  
>  /**
> 
> base-commit: 26b4309a3ab82a0697751cde52eb336c29c19035

