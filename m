Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 18D4FA4A025
	for <lists+dri-devel@lfdr.de>; Fri, 28 Feb 2025 18:20:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 42FE910ED0E;
	Fri, 28 Feb 2025 17:20:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=cherry.de header.i=@cherry.de header.b="NaxKrmdu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DUZPR83CU001.outbound.protection.outlook.com
 (mail-northeuropeazon11013018.outbound.protection.outlook.com [52.101.67.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5073F10ED0E
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Feb 2025 17:20:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BncCCpHTwyJgjZZnIN5wYc67vG5bcGoXAWUrF9cbg6VQsCvqfF2sqW+vWHIS978mhBtb0hUukQ6x/49LcpKPEL+blgDKwrBpmz5x/k9phGdNkav/zxrQuZK95XZxSSEi+jdt8sO9wGVFN2q9/MAohZoJt+3L2r02XsLqlBGFpGDjtoMvTYbJKMC9unKRxpeMWcdIWFxa92ExxLANDhMsjgd+O0Y0ZPvshFFj/xfihiNM4nuLlQCO3y3jhdvjmNYtBMsJHkMhL/J+awEBjz39WPU0Ob+LuqEZdWpGH1iqKmgXzZRg2ZN5NfhFjbqybbfct9r7i1boAr/ZYLkuOrohAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fM5yl+jV66hkBUX8rKXqUuyJWGY3J4aakKl/6m8WSG0=;
 b=g9wDwDre8GMxRwUrMBXIEeLJI7OVVvYmDFktbzeRLN3WUpoJ1wsGUpaLncorLa+Ls5VnKEi+rAM8XeQgJhuByyiUgqBR1JgeyVWpMdHqtka6CChYnmfrYT4n0cme30UgFnGwcNlzffsGvH7tHpDVYpVOlnOeFgNfzD6Ol8/IisoGvAanZq2qNx9eAfXpB71jVAoaPpWHeTNm4fNbarEcspBwSUh2tdak6z1x4sQwOwBJQdb3vhQM2MfGV6+Wqloi5efSoiuzoAUyq3ejAeizSsBKRysaxAKTqtKK93iFmzNjJNNLDxCQRbZrKbex6R3sfmXRS2qs2k88iUFprXe/sw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fM5yl+jV66hkBUX8rKXqUuyJWGY3J4aakKl/6m8WSG0=;
 b=NaxKrmduNSlFLlAv854qHGuPPkrMR3e0jrgREE5YYqKfI+rxWbcyUXTP8NwrBNElXcHsnh/sFsOft6VB1BfjfsW7H1Vl0r6i5dm6ntnUKGP3LKxk8/i5PXC95CeUWEku2PWCNi2uUYNkc8x9UJD8yupriSXJDbxxumv38vqngBk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by AS8PR04MB9175.eurprd04.prod.outlook.com (2603:10a6:20b:44a::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.22; Fri, 28 Feb
 2025 17:19:55 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a%6]) with mapi id 15.20.8489.021; Fri, 28 Feb 2025
 17:19:55 +0000
Message-ID: <521cb717-68a4-43ce-84fa-580fcd8cd50b@cherry.de>
Date: Fri, 28 Feb 2025 18:19:54 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] drm/rockchip: lvds: move pclk preparation in with
 clk_get
To: Heiko Stuebner <heiko@sntech.de>
Cc: andy.yan@rock-chips.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org, Heiko Stuebner <heiko.stuebner@cherry.de>
References: <20250228165755.405138-1-heiko@sntech.de>
 <20250228165755.405138-2-heiko@sntech.de>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20250228165755.405138-2-heiko@sntech.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR05CA0108.eurprd05.prod.outlook.com
 (2603:10a6:20b:498::19) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|AS8PR04MB9175:EE_
X-MS-Office365-Filtering-Correlation-Id: e9011276-c03a-447f-6a55-08dd581c1e70
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?OXZRY2ExOGs2dFpkRThKUmowSGkrVXlMTEJwb0NyTENoT04wa0ZiU3RadFZn?=
 =?utf-8?B?N3FlZGVONllIZ3plbWEvTVZzM0MwNUtOK3FlM3dzaW5XTURFS0J6Q0N1R0hn?=
 =?utf-8?B?eHlzZGpPSzduZVM2KzVYNEszK0Z0Vk9FTHRnZUpUS3JxU0JJQnhqM1JtTGU2?=
 =?utf-8?B?b0kxSDlPd0lKNll4QWZLblpBMGJoRU5Edld3aFE2dTh6ZWFwM0Z1V2E4S1V2?=
 =?utf-8?B?ZmRLNGFXSlAvRWQyS0tzQUxTWVBFVjJuKzlXYUpBdndkUUJPSW1xeVd4b0NZ?=
 =?utf-8?B?cFlpZVhqS3ZycUFKNGJGSStWVFkwVURvbzBTMFBTT01peHBFbUlteWg4ejhD?=
 =?utf-8?B?L05qVGlUakw1VldFZ2h0NFBVTGp5aFIrcURYeUh1VE5QVjR3OE1NUHdPUUJm?=
 =?utf-8?B?R2RSTi9tb0N6UlJZcWdLcFpFWFA1T2NxR2EreEVwYWxydFYxc3ZHSjdBclhG?=
 =?utf-8?B?azVtZGJOUitqckZnSERacDFqMGFBWDAyY0c4RnNIOUk4OXRGSjZIaGZ4UkVk?=
 =?utf-8?B?V2VZSy80b3MxT1d6UWZtMERobUIxNW4yVDhENjRoL0cxV2o0VnBxbWJoRzEv?=
 =?utf-8?B?U3BqZG13cENKVnB2VGlqU25weE1mRFRsMXkvVUZrL01HdmNJVzFzNWJEUGJr?=
 =?utf-8?B?dGF6WTdRU2ZzemF5QnZWZUQxSWl5b0NRWjBRZlBjays1T0MyMEIzR21sMFMy?=
 =?utf-8?B?QlVDcmhCc3EwM3JzUDRmUUZId0VuZXl2Q1RoZnVIR2dTcE14S2xhaUZHTXVp?=
 =?utf-8?B?QUxKZEM2eUZ5V04xdHJqVTB4LytxaVp6R0xialJ6UEpjM1BOSVBGb1FvazQ5?=
 =?utf-8?B?SHpERnlUNUdmNlplUjhZWXBXNktQd3BOQzVGbXdHSDdaUmtXVldYdGQ5S0VN?=
 =?utf-8?B?VjBQYUUycUZXZldqdktoU1MrdW42TWhiNEF3WU9TUEg2ZklXQlB2YTYrUndK?=
 =?utf-8?B?SG0vZDlWNzdDRjJpR1NpQmp4Mmd2YkVqM1ZxQmZ4NnhUT2F4Mm9zNmNjanky?=
 =?utf-8?B?S1J4VjMxZXFIeGl6M2h4OFc0SXJ1clJNckpDSHNHc05IS2VBNGJFU3dWRGNK?=
 =?utf-8?B?Y0R4em56NGdwZkYwU3JMUHI4SVpJR3MrNGdRTHhRUEV6Y2kwZFJUQzhEYlR0?=
 =?utf-8?B?N2tmbDlUTGJQbWtIcVU1RW4zNWNkY3hBM1RnazUyS3BIYzFoM083WFdCelFh?=
 =?utf-8?B?TEJaZEZhVml3Nm0wdkpUd2gzclVnUC9Sbm5BTG5CQW50Z3pUWHIwMkNKcHB2?=
 =?utf-8?B?ZkFNSmduSEFwNjZCdWVEVmI0R2lBNjhYMEpYREYrZ1lOQ2pURFNTc25IOUtI?=
 =?utf-8?B?MjluK25XcFNsZm8ycHlqRHMrVmliNWc1ZVNOejNjYW1YUXhzR012cW9yZDI2?=
 =?utf-8?B?Nm1kY0M2aDB5SUtMYWFDcnhDNC9WRTlYMmhTTVVqTXR6SS9ZNkdZeXUrZ3Na?=
 =?utf-8?B?MkJCNENXTXFFbFVxYU92TDVQQ3F0Y3N2N1JNenlaQU1obEI5UXpydG1Ic1VH?=
 =?utf-8?B?QWZ5enJ1ZlFFQ0d1eDQ0bmlLUlB0L3B4M0FjbzNKbmpuVW5YV2J5YVM0bEdW?=
 =?utf-8?B?NTdMWndGalU2WnYvaFZsdkdqODFraHdzN1pjTWpYaXpJbGg5Q3M1QU94ZUsy?=
 =?utf-8?B?a1dGeWdSbDh0LytOelJNcU1vSGdIRkhITkt3dU5yS1FDM2ozTUNseUNMVXkx?=
 =?utf-8?B?RS9COG9obXRiRWZ4NlhlZlRXWFBITThnYU9mWDJJdjVrYVdtSnFhbXF5d2tR?=
 =?utf-8?B?d0xTM214WDlQTmhuYWt1a1FWWGF6aXIyQTQyUXVUdmRxZ2tJbE9wMVNkVGZT?=
 =?utf-8?B?Qk01NE8wTStaTXUyaHlySWMvTjdIR1lxV0JGUUoxUVFaSzFTR3dmb3ltc1k4?=
 =?utf-8?Q?TVq/jsamcaWXa?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AS8PR04MB8897.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NlZoK0MvdXZWNm9ZNklpT3IyQ1RIOHdzOGdkRHl0Q2VPMTdlSnNYMjEvVDJo?=
 =?utf-8?B?RFhObUJFaU1HUzEwRXVlTUc2WHBWMVBFd0I0L29OZWhtaGFoRnZTL2hSSVIw?=
 =?utf-8?B?aHRVRFE4aUJ5eG05WVZ4ZnFXYXZDRGJSRGU4UTJpMFdYNWNqdkdMZUNzQkth?=
 =?utf-8?B?NG9XVlprdXZKRTZnQTFlSDJ3ZUpHT3FQc0RaZ3NKUUN0TDZCNlZxVkJwYk1a?=
 =?utf-8?B?dDdBUXZhREFaY1laMTU4UXMyVTdqbHJqMFBnTTg3RjM3YmVNZ2JmR3NSRU15?=
 =?utf-8?B?a0NIMHZ3RURGNGIwZVZ5bkF3RC9sWjdGdEprOEZvN0oybnQ2K1haR0FDU3Fq?=
 =?utf-8?B?VGxuZzJjS1B0bFB4VFJGdEZsd2NpK0tmdGxhalplQjFSMmUvM0NRc2dER2Qy?=
 =?utf-8?B?QjloUjFoNERKZWUzUm1vVEtEWHVVM3BoTTBSeklvM2QzS1hSeStiMzRvZlll?=
 =?utf-8?B?TWNlVHJBdDdzR3hRL2hjaUhaU2EvMG8vNEVRMkt6YWZsc0pWdE9GSThFcTVp?=
 =?utf-8?B?b1JLajZURmc4SmJ1ZzE0dTZ6VlpNYTNKdFRUT3VsL3BwZnB1bWwrdVJTOEN5?=
 =?utf-8?B?VTQwUWtlbDh3R2IvYjM2NUJoQW50QzAyNDRpNVVPdGNnUFNqRDBzYWp5UXBw?=
 =?utf-8?B?Ry9oOXEzWVFPYTN5VThIdzNVTStLVmttU3JDL1FNU2EwVEpKc3ZrZGl6NDlO?=
 =?utf-8?B?SzNWK29iSXpVYk9CQ3dlK2lKd0Q1Q3loNFRBQmF6OVNKcVA2Q1BQMkYzYUhj?=
 =?utf-8?B?MXNqTGt5QXRvbkx0NnE3aXozQVdyWkpZYTcxQlgzVGVJbjFUMGNyc3NCc2pR?=
 =?utf-8?B?cGFZZ2ZKeGNEeXY0M0ovZzJnTkFtRnVvd2p5TkpsVTh5L2pBbDBaQ2JXSENG?=
 =?utf-8?B?NlF0L08vVmRMMzdqUXd5VVQzNE5TTVFibFVZaG5kMEpiN3VWQ1RqZ2ZGZ2dN?=
 =?utf-8?B?V1o1YkF6dHhrdkl6eDArT285NkJ5RDJraDByVHdMems0cS9kRW04cHdWQ1ZC?=
 =?utf-8?B?Mk56QXNhZjVtdEUxc1RUY3g1bnVTRm9JK2x2SkdBbkYzK1dCWjRYL0FTdnF0?=
 =?utf-8?B?MHFXRmZCb3dnaWFtR3NYd05lSVdWcDlUdmtXbEczYjBIdmxVUC9wOWlQSDBH?=
 =?utf-8?B?SVZscGtYR0JqKzNtN01odWY4Q3NuVGZ1R1lCa2UvQk9CTFIrU3lvVGNtc2dj?=
 =?utf-8?B?bHdwWk9FT2RnZkE4TUVsZmdNdjcySTlvbHYvbnQyUno1YUdGL256amhWTG5L?=
 =?utf-8?B?WGVKS2JCaWNRRXdRdTNxN2Z2TjFRZDhSdncwd2VtU0FicC9OYVRaL3VHR1Jy?=
 =?utf-8?B?cXJjQldxMEdKWDVTYmloWUp0RCs3VmZtTEJQdGlNSllFUDFDQktqaDNjMXl4?=
 =?utf-8?B?UGUvUXp2WkFzWnFKTThGZ0N2c0N0WHVQT1BLT2F3Tk1McTJjZU1JT3ZhOTNQ?=
 =?utf-8?B?bkkzZXdSMm00SW1JRkVrdFNoa1BWb0dSMzlQQWpWY21venI4OTVtM0x3bVJC?=
 =?utf-8?B?RzNobnFPVmZCVnFBWW5jYzVBRVhhaWNjTWpBaEZCa0RZTGN2bVhFRjRNWExw?=
 =?utf-8?B?ck5pQnpETmR5dGxER1liU0l3SU5vZGpWYit3WjErbWpKa3h3cnVIeUY0ZmJx?=
 =?utf-8?B?ZEVJOC8zYlhDS2dySlZJVVRjNXhDZ0NERGkxeUVxVS9ZdG5kd0tlY1FXbzd6?=
 =?utf-8?B?UXZWRUorZ1JiUWhtYVF0eVhVZFNINTJKVDZFMWhEYW9UTlI3RldnalFRRzZu?=
 =?utf-8?B?dkpUbXBuMThkTnRjejViMGxFMHdzc2NzNW5NZ29CT2RsN2FxVTVEOEZnQmNU?=
 =?utf-8?B?UW9iMU9rNXUvczBDZnZNbXFWMnBmcXRORm8rT3FGOXl3WEJuekhUSk5pMUZ1?=
 =?utf-8?B?TkNYMUc2UHFKTFJYT2tMNjl1VVZMdGdmajBwRzR4anc3Z25SaGZXSllwUGJH?=
 =?utf-8?B?Sjk2a0NjYlQwTk1CYStFcW91WkdoMnBuWHNUdXpsZUZ5WHdrMkdkZlNYNUZF?=
 =?utf-8?B?SWtXQkZyZkQwb0Y5TG5kdUl5OTRyazZHcDJtVEdWSy9xSWNRSCs5ZFE2VlR1?=
 =?utf-8?B?OHhwc0lLQ0ttaFA5T3E5WnR3NW9HN1FwcFVxSXkzK1Z2b0JsTW5ocHpCV2Fh?=
 =?utf-8?B?ekVxNFJMZXdXQmFSZTcvZnVoRHZFcTFxWHN3cElhRldrdFBYZ3Y1YW1YTjQw?=
 =?utf-8?B?Unc9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: e9011276-c03a-447f-6a55-08dd581c1e70
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Feb 2025 17:19:55.1266 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jj4zREq3smGkCVeKA+cgmV7ZY0oagc50OWOwkuVkfB0VCXUBh3iAYbRRWpnR8JbxVogevhNPqlf3V6WwCTvXRClsHak6QgQjZ9FR/ZvfEco=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB9175
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

Hi Heiko,

On 2/28/25 5:57 PM, Heiko Stuebner wrote:
> From: Heiko Stuebner <heiko.stuebner@cherry.de>
> 
> The LVDS block needs a separate pclk only on some socs, so currently
> requests and prepares it in the soc-specific probe function, but common
> code is required to unprepare it in the error path or on driver remove.
> 
> While this works because clk_unprepare just does nothing if clk is NULL,
> this mismatch of who is responsible still is not very nice.
> The clock-framework already has a helper for clk-get-and-prepare even
> with devres support in devm_clk_get_prepared().
> 
> This will get and prepare the clock and also unprepare it on driver
> removal, saving the driver from having to handle it "manually".
> 
> Signed-off-by: Heiko Stuebner <heiko.stuebner@cherry.de>

Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>

Small nitpick below.

> ---
>   drivers/gpu/drm/rockchip/rockchip_lvds.c | 17 ++---------------
>   1 file changed, 2 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/gpu/drm/rockchip/rockchip_lvds.c b/drivers/gpu/drm/rockchip/rockchip_lvds.c
> index 385cf6881504..c19b7b1f6cb5 100644
> --- a/drivers/gpu/drm/rockchip/rockchip_lvds.c
> +++ b/drivers/gpu/drm/rockchip/rockchip_lvds.c
> @@ -448,13 +448,11 @@ struct drm_encoder_helper_funcs px30_lvds_encoder_helper_funcs = {
>   static int rk3288_lvds_probe(struct platform_device *pdev,
>   			     struct rockchip_lvds *lvds)
>   {
> -	int ret;
> -
>   	lvds->regs = devm_platform_ioremap_resource(pdev, 0);
>   	if (IS_ERR(lvds->regs))
>   		return PTR_ERR(lvds->regs);
>   
> -	lvds->pclk = devm_clk_get(lvds->dev, "pclk_lvds");
> +	lvds->pclk = devm_clk_get_prepared(lvds->dev, "pclk_lvds");
>   	if (IS_ERR(lvds->pclk)) {
>   		DRM_DEV_ERROR(lvds->dev, "could not get pclk_lvds\n");

Should we say

Could not get or prepare pclk_lvds\n

instead?

Thanks!
Quentin
