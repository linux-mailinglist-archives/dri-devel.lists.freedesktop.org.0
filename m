Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 39E41C169FB
	for <lists+dri-devel@lfdr.de>; Tue, 28 Oct 2025 20:34:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6449B10E645;
	Tue, 28 Oct 2025 19:34:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="MuGjQvcl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CY7PR03CU001.outbound.protection.outlook.com
 (mail-westcentralusazon11010009.outbound.protection.outlook.com
 [40.93.198.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 745BF10E0A2;
 Tue, 28 Oct 2025 19:34:02 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IfCE9Lp+SAFo1AptQ2406Bf6f1sAmi8bUqBC7Us83s374AmyD7Q3TbjFpgoubgmcvRnxN5H3WWI+CfcYt5frlTUC4lzruILSKz6GQh54hyvamzs4q4CmiEEGXdIbnNsSt9mzYTVq30RGc+koCJpEPp2F6bE5MbIrEJz2m2uhDuG5N60YcvxHQ+/WxxtYuoVqUvt9VXlDlQZxEX0Q5eHpvczPOwKEddj22gylEeSBeVxdC26yT4+kEJOeyvvSSnDhCOxmZlXyd4lrcC72/no8omWwThmzgZO+jMphoVoTQM/k6rSYj6u5+5CdTieemI9I58zKPqRSybZgaWBiyOzMFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Jun8FQoUR9Ojr/ZqOsbpamrG+03yH9zB3SpVcNwLld0=;
 b=T1YFZtdmPaQSz4ag1LLdSXeFMM2dGSSrMZeC6A0TUsECWJjTjWwItTyxxYggQ0fbLymndtseDpl8i86F2gcnyU8H1zI82wd3XkBRWCkKjzPUcwh5tdoF3v+NQKjhipl+fY+xWvVkQkTbweIGpPQN1gFKycxVUy9GPKTa7uvp8p5Obi72PrWAtEAupQjP1zRXr/Ch31Gkz6PxTG9ym1OhY5qAqeQSCs5O4eK+JbUJMtabeogQBSpf7LDGhunypKodWYJzmv3cxG9lppK7Qdaliz3eZ5wBLEl/SgF339xA+X9iWjoLB/NkjaLccmQ3NsNtMKqqytirZv203ux1/NZcug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Jun8FQoUR9Ojr/ZqOsbpamrG+03yH9zB3SpVcNwLld0=;
 b=MuGjQvclNDY8+zW9zYLM+NaqttTu6L7HoqQ4NKSzQjQsd5VdifROqmJWodmzhDxUvzqAGr5ctlrvoLFdCf2TUhTgWlunV304ouh1WyYAo2Axe8SSDIkLYoYVT3ra+XwrFrrFCgPTE5IROYwkDjWfDeeyDyPh/SoO888HdDpt6BvICXqt+vkzWnUsZ3eNlfj/f7TpGSzXz1gi+Pva8hfpMQitz4EG6UDozgItlEG/BVoQkg4Mvz26wQQHQciixPFgpPqg2AfXYU5kkAcdljFGTvIAPD5JwHeIC+t1JM03vDxIz/3JtrVu0IN6E6K9FaxqFta3DSY/uAR1EIXt9wYsRA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BY5PR12MB4116.namprd12.prod.outlook.com (2603:10b6:a03:210::13)
 by MW6PR12MB8759.namprd12.prod.outlook.com (2603:10b6:303:243::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.12; Tue, 28 Oct
 2025 19:33:58 +0000
Received: from BY5PR12MB4116.namprd12.prod.outlook.com
 ([fe80::81b6:1af8:921b:3fb4]) by BY5PR12MB4116.namprd12.prod.outlook.com
 ([fe80::81b6:1af8:921b:3fb4%4]) with mapi id 15.20.9275.011; Tue, 28 Oct 2025
 19:33:58 +0000
Message-ID: <10e2a077-dfcc-4bc8-85ef-64dc29bd1465@nvidia.com>
Date: Tue, 28 Oct 2025 12:33:57 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] drm: nova: select NOVA_CORE
To: Danilo Krummrich <dakr@kernel.org>, aliceryhl@google.com,
 acourbot@nvidia.com
Cc: nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 rust-for-linux@vger.kernel.org
References: <20251028110058.340320-1-dakr@kernel.org>
 <20251028110058.340320-2-dakr@kernel.org>
Content-Language: en-US
From: John Hubbard <jhubbard@nvidia.com>
In-Reply-To: <20251028110058.340320-2-dakr@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR13CA0082.namprd13.prod.outlook.com
 (2603:10b6:a03:2c4::27) To BY5PR12MB4116.namprd12.prod.outlook.com
 (2603:10b6:a03:210::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR12MB4116:EE_|MW6PR12MB8759:EE_
X-MS-Office365-Filtering-Correlation-Id: ccdfe6e8-0354-4171-6ba0-08de1658f07b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZmRxdmMvNys1RzZtaituVnRaOWFVdzVNNjRidnlyUFVRWUFPbis4MmNPWTA4?=
 =?utf-8?B?Sys2dzZPTE5Kd0xTaXlhVWZYWjNFdWx4dTZFVDhGSW1vYjJZZFRWTGpOYlN3?=
 =?utf-8?B?RDRkN2tOZkJlSVU4N2F5TVRFNkVqVTh1eFo4b2t3VE5TNnFmbXNXYm13WW5R?=
 =?utf-8?B?U3BUcTdXb0QyMjYzWERpVWtxK3hmYzlSRFhRZ0QrVnJhK2lHa0lxT09XR2hW?=
 =?utf-8?B?bzJCYXZVMUcwaU52dk5hUHNPQXQ0WXR4SjlJVExjaitIdGFxMEUrM2lDTElv?=
 =?utf-8?B?SnZVdGxrSHdMRzlMazIwWS9sRktxZlQrdEJvcTV1RFBGd2k1cGdUZU1ETVRv?=
 =?utf-8?B?WjhWR3ErWks1SWtIWUxQQVRVcWNLRnNHeUpkTXU4dVhDYWxnV2huaEx0U05h?=
 =?utf-8?B?MXNiUGdTS0tuOTJSK0M4ajlkLzZDbmF5Qk9qb3NYZGhsMGt6dTU4aGtIbUg3?=
 =?utf-8?B?RitHMzh1Q3o4ZDVQekhua0tOK0h2clJwWWRndW9TMGlLNkZLemVVTDEwcXFr?=
 =?utf-8?B?RXNUVFN0ckVUVy9xOEtMaXNYMHhTZDZuZzBFMVM2OGNReWlPeFg5Wk5QS2kw?=
 =?utf-8?B?TE9sR0dEQWNqTXBORzRRU2dCNC9lRnh0WVEwV1RDT3dzZ3NueTIyclBYMmFx?=
 =?utf-8?B?ZzhRMmwyT1hCNDFKL3B6Z0JFZHgzcFJJR3dnK3JmNnVzQXJYZm9ERnZpelB1?=
 =?utf-8?B?dCtXeldjSktUT0JpMXlkb0dDQ2lPeW9haHFwWk80WmIwQ01wMXNiTFpqUm5s?=
 =?utf-8?B?WkV5cEcyczcxL1plUzd2S0p0b1lnVTVOVDdzcE55Yi94RWJTd2tRRmdCTjhZ?=
 =?utf-8?B?WmRrRTdEUWRVZXY0OW1JRWRzNmg2K3RZdFFQVExURG0zcW4yNzhLaXVPS1N5?=
 =?utf-8?B?Y1ZtRGc1V2JqMFBJdzhWNVNIYWFXRjFjWlEvTEhWV0tCRXVYTFFkaDlUdDlY?=
 =?utf-8?B?RXlhZlBxQkJGN0VSdjh0NnNrMFdWQ2RHUmZjb0Zrcm11ZlN4Sm1wbGYraERD?=
 =?utf-8?B?aG93bTQxVFdGVUdQdnltSitmekdhWXo0ZnpXL2RkVE1oM3Jlb25hT2czb3Nj?=
 =?utf-8?B?MDEySmwzM0tEUVRFWnI4a2Zkc0s1Nk1MdzJzUCs3Q0xHZ05yVXM5NEc3Q1FP?=
 =?utf-8?B?aWc3aEJwbkFiWFpQektkMDZMSzVwNFUwOGR3ZjRFYWduRFd3QllZMEVhb0px?=
 =?utf-8?B?NkJyWEUwTE5LT2dvTGVTY2kxREVTSVdlckJtTEFnNkpvbUVzQTJmT0RMWmFU?=
 =?utf-8?B?RXlWMWNNUnpvRDIySWdjd0dqRTlLcFZMQkJaYkJ5UXI1Rm5SYkdIeEZjaVZ5?=
 =?utf-8?B?Y2RsTU9rbG54YlpzTHgxeEdtQ2dBUDNrd0dDUEJCMGdRaEpZUXNRTUJmTjJE?=
 =?utf-8?B?UEJuRFdkc2U3bnBha25nS2pGZzlUTGpJTVVSVzdkTURscjIzSFVDd2taVEpF?=
 =?utf-8?B?dGtsTjhXaVRVWC9lY0VxYXlYcHp4Q2dJTVdwdmJ4d3E5YUFaM2s5dm9Ib1pI?=
 =?utf-8?B?TUJhL3pEVjVCNlppU3phR2tKbmsvY2VLMS9Ya203T0d5dUNCbXRaQkR4UUV2?=
 =?utf-8?B?NkdDK1lOUzhUNE9vbEtzSllOdWpJMGx6eVpXY1JQT0ZmSmtIbFI4VFBKY08w?=
 =?utf-8?B?SVlWZUxLTmgrbVVXZDNNTFFsdTNpTjRRYUowUFNoT3BTOHhOVTZCZzBXVGFh?=
 =?utf-8?B?dFl3SGJYdXVhOHdja2NXVE9TelNLQkNlazJnN2kycTNJd05ZN2NXNHgxelRN?=
 =?utf-8?B?SWNJVFJUeC9jalpDV2dHN2dkSC9ldjMvUzJDUFNjMGplT2crcktURWJUTVVz?=
 =?utf-8?B?alpQRVJIRU5aaFJRZkNXUk5kdFhpVThLbDRGMllJSlBwZUV4U0NoY0tvZURr?=
 =?utf-8?B?NThUaitrdmdEakxkakI0QzA1QnBma2hCalY0bksyWDZSTkJiWjdobGUxMTdp?=
 =?utf-8?Q?rh5x8fpp9NeT8UYqtmLIjMkCcSnVorpw?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR12MB4116.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NlZXQmYzZTdYOXEydHpENlhMelRhczFIRnFEMWtLdG55STJ2MEJFdmk4NFU3?=
 =?utf-8?B?Q2JJbC9NWnk4U0JkdDE4Si9Ic1lGK2p0UDhMRG5wWVo2MUlobC9HYUgwSnpT?=
 =?utf-8?B?RW9uUEFFb0tPWXBuZCtCaVBwdjIrZ1NvOCtsQjhVRnd5WS9vRWxGd2paZy9m?=
 =?utf-8?B?dzQxQ2VFT1N2bGRxaVVRN1Y2ZkkwU2FSekFZN2t0WGFDZVZjc25IZGdVaVR0?=
 =?utf-8?B?aS9jYmNTeUpIdXFieWxLdzF1MlJ0Szl4LzFBcXVWYlo4RGI1R0NXQWo1bHRZ?=
 =?utf-8?B?Qk9YVlkrbmJLTEcwMXhDaTlUWnUyWTdsaTJvN09yN3h1Y3VZZHpJbE9uak1y?=
 =?utf-8?B?Si81L0dwamQrZCswM0F1ZzNFeEZ3bGJ1OFFVbHQ1RHVlaGFoQUFHMWJPUlpC?=
 =?utf-8?B?VmtwYjR0Q3RtUnc2dXJtdEZzRDFJS0Y0dVBma2g4NUFwYzhYVDFEekQvRFk1?=
 =?utf-8?B?THRyRW9VNk5OaUJsTnpnd1BwU2c5OGMrUC9xTVZONzlmQWZVL2Ztd2dHUUlQ?=
 =?utf-8?B?U3RwdmVRdW5ZZUVneTN5aG55ZkM1ZU5RYWIzYzMwRkJCSzlNY0dZcWdvdGxH?=
 =?utf-8?B?OCtneHlQZVQ5M29nVjdaV2dubW9rRFp3VUNyUk9vUVVobFI1dzlCMXZkNC9U?=
 =?utf-8?B?U255RHRoREl5NW1xRnR4cE9yejBaV3J1b094TUwvQmVMM0FXa0FWWHp1MjZy?=
 =?utf-8?B?WWc4YU9YNFNJdHNMRWhPOUMzOW1idjVDWjd2dlMzL3VadVdML3RFR3JiUVdH?=
 =?utf-8?B?ZW81NEFwUVd2VTcvQkU2ZTlteUpPNmFCSGphMHJzdGtsMHd6em1LQVJPeDdS?=
 =?utf-8?B?b1I1b0t2RkR0dUE5UlFxUXMxcTBBM01FSGgvYzBkL2QrV3ArRmk2NWw4bTNm?=
 =?utf-8?B?SjVoY3B5Qld0YVZOblJyajRxNFU5bUh5MTdLZ0h6RTNKWlBaaHVPUWNua2VD?=
 =?utf-8?B?OWRvaHBrNmFraFpIK3ZHQ2NlMGxWNW9PNnV1cVdLcEdFbkNhNnlkUTIwZlVM?=
 =?utf-8?B?Y3VvZGExWk1sN0FheGxjNHFvdTB4T2NieVd0SFlXU0JFZ2tyTW1BNURzbDBn?=
 =?utf-8?B?d1dWallaOUV6WXdNM2dUb1EyUmFSNm1kQm5jQzlnVThKamNMKzVuNjhYbmpJ?=
 =?utf-8?B?RGJRRTNMU3RMTHlWb1hnMnJUMUFjZ2lkbVYzNEV6aXU5YUFibGptQW5HUDd3?=
 =?utf-8?B?QkorR04xd0hJV1NJeTBxeFVxOGxvR1EvUjdlSk1yQ3creHU5RTFWQXhYVGZM?=
 =?utf-8?B?Q1A0amw5b2JQa0ZEaktLamJkT29zZU1CTExYQ1QweXFOYXRWVWZNejNscDJH?=
 =?utf-8?B?TkZ5MmNheFFwMmFtT1J3TXVjRDcvbC9NelBvOFZ4Vjg0bHR4b3VySXZVcStL?=
 =?utf-8?B?eGgvM3FyYVRFRkRkWitCaFJZbGVBNkY2bDZQNDlWU2pDYUgvK1FML3B5N1RW?=
 =?utf-8?B?ZWhoWGxCRUJjNU5uVm1KRkovQ0o1QkpTb3FtbDM3SmFOalFzYWZaOE5xMW1R?=
 =?utf-8?B?UXBubW0xSmwzR3JtUEJSWTB5RXd6aDJhdjV0aEprNmhkVUZ2SysrVFg3dGxi?=
 =?utf-8?B?T0p6TlZRVUFTNW42Q21aQVNZV1cybTJjUnNkVWtoaWpzR2tzS2Z1VU5pS0xa?=
 =?utf-8?B?R0xPMENacDk4QWdYR0hDR0JTdTE3R3NJUlFMeE5nYTczaDdwSHBXMUpBb0FQ?=
 =?utf-8?B?Q1BFZWt5QTZOMndlMHFDQ2dDV1k1bVRRQlpvTHdXd0hVZ2V1VFVZNVdCcGt0?=
 =?utf-8?B?VkVaZDBuUmFDaXNvNjBQTGpZUWt1a3lFNXBGVzExdG02WnBaamdLQ1dENFFk?=
 =?utf-8?B?NXk2WSswcU9MbXA5L2ppZDdaVmtoT2V6YS9XUkprL2pHMEJxV0l4Q1hJc3dG?=
 =?utf-8?B?QjlTdmJGenlOZC9uVnhGUnVuSjdIcE5lYmhiR3dUZmZXMmtBNnkxVXk0MG5X?=
 =?utf-8?B?eDh5NitIVXlrS0xZMGNjdEh2MUZneHg2UERHMmtpTGk3a0x1VG5BUU1TdXNT?=
 =?utf-8?B?NkM0MGZ2V2NwcEd4OVg2YUc5KzJ6NnVRYTFqWXNPcXVTQ1RRS1RMdzVsRlBN?=
 =?utf-8?B?ZWxJdUdsMVFNWUhLSExJVlF5SUJNVnNEU1JFaTFvc3ZHVmN1RkFCb1A1bTh1?=
 =?utf-8?Q?suGCNkuyxjUEDgr+IRBe+merZ?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ccdfe6e8-0354-4171-6ba0-08de1658f07b
X-MS-Exchange-CrossTenant-AuthSource: BY5PR12MB4116.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2025 19:33:58.1994 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PhcphcZHpUEYycdRm4DVGsPM3Im73+4iClJ8/gF2skUT3C7HIXK+GfiyGkn+icYUu3BVatmdkvItIu5vEMb6ew==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR12MB8759
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

On 10/28/25 4:00 AM, Danilo Krummrich wrote:
> The nova-drm driver does not provide any value without nova-core being
> selected as well, hence select NOVA_CORE.
> 
> Fixes: cdeaeb9dd762 ("drm: nova-drm: add initial driver skeleton")
> Signed-off-by: Danilo Krummrich <dakr@kernel.org>
> ---
>   drivers/gpu/drm/nova/Kconfig | 1 +
>   1 file changed, 1 insertion(+)

Reviewed-by: John Hubbard <jhubbard@nvidia.com>

thanks,
John Hubbard

> 
> diff --git a/drivers/gpu/drm/nova/Kconfig b/drivers/gpu/drm/nova/Kconfig
> index 2a70aac64d7e..3e637ad7b5ba 100644
> --- a/drivers/gpu/drm/nova/Kconfig
> +++ b/drivers/gpu/drm/nova/Kconfig
> @@ -5,6 +5,7 @@ config DRM_NOVA
>   	depends on PCI
>   	depends on RUST
>   	select AUXILIARY_BUS
> +	select NOVA_CORE
>   	default n
>   	help
>   	  Choose this if you want to build the Nova DRM driver for Nvidia

