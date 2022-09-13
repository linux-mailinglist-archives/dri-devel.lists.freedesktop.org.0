Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A3F9A5B6838
	for <lists+dri-devel@lfdr.de>; Tue, 13 Sep 2022 08:55:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C99610E617;
	Tue, 13 Sep 2022 06:55:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-eopbgr60041.outbound.protection.outlook.com [40.107.6.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8579910E617
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Sep 2022 06:55:27 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZOLznnXx+NKCBAnaj88/8y41OTWtL+w2ZPapdyQ0f8IhLFKFvXhviaNAaeBgxry86vIKz8+Up3kwXJIdGsYMjErxjTQ+R1bNITxgsJeSrefWwfZxfEMaLOXIhmZy/GIpaagnvwtkKoiTbqwcd2K9rg7FW7x4/w3gBszCVh68Pec7aScrhLCELb99IX0WhnlG/TFNi6Z3MvJbeNlOsFyHOJ+sf8frOkGJ80XUPVME8d9rFjcYB/lp17caeon+dO+ZXIUi6UeDtfL6KLAVgn1PrP0n175/ryt/FXY00dpvhP50RkzKKxNixvsMtT1fjhoto0Gee/j4yDo2Lrqmh9EvJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TUhhqH5B7hOzuhvGfkjUWWzmP0dz2cu4U1rQ3GApDQs=;
 b=LOJcgG+BK9Kn173FhCqi/Vri1SLsf8xs7z0DC0fF7uawkHwIY06TxQG0GwpUmq+hxINCTFRlW9YOmUOw30jnTXy1/zmNnxjeCSkvVm0mDph3xEeb3KGCtI7zCZUsyXgO4ojzpQrwv/xdk4w7X/KmFLG3T70yoCaIAVZHbPDorQBgD6noBcJ98tP+0qRnQ03s8fInVKQT7JhvCuvvR2jQlHcS2yx5xMsvhdNatQX51VrIT/USg/HBguWjODRmy/uLV6hzbBYvd330ap+UlCZwlPoByPkFxVG9BanXFGyDio8GG8U1ppSJ+ijX6pSsSnw5Sh1+GFoCs2koH7+G4p9hmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wolfvision.net; dmarc=pass action=none
 header.from=wolfvision.net; dkim=pass header.d=wolfvision.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wolfvision.net;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TUhhqH5B7hOzuhvGfkjUWWzmP0dz2cu4U1rQ3GApDQs=;
 b=jNIkWLACD9F4xkQCNlT18lNOZ/4aE0TDbbcp60++za4X3BpTQTtmBtFwR1/+BoI4gn9NbcM4O030pB5hacJlwTquZ7FJt7da7aBRf8eKsn9G/zpF6WX4zsraBUYmw3J+y2V00BHEwys+KibnX7TGC/xl80mhJcHdylYWEeQ3RRE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wolfvision.net;
Received: from DU0PR08MB9155.eurprd08.prod.outlook.com (2603:10a6:10:416::5)
 by AS8PR08MB7909.eurprd08.prod.outlook.com (2603:10a6:20b:52a::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.14; Tue, 13 Sep
 2022 06:55:24 +0000
Received: from DU0PR08MB9155.eurprd08.prod.outlook.com
 ([fe80::d5b:f7f0:4c2:cc95]) by DU0PR08MB9155.eurprd08.prod.outlook.com
 ([fe80::d5b:f7f0:4c2:cc95%4]) with mapi id 15.20.5612.022; Tue, 13 Sep 2022
 06:55:24 +0000
Message-ID: <d8a86990-6d9f-9ca0-326a-e5706f924516@wolfvision.net>
Date: Tue, 13 Sep 2022 08:55:22 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH] drm/rockchip: vop2: Fix Null Pointer Dereference on
 Multiple VPs
Content-Language: en-US
To: Chris Morgan <macroalpha82@gmail.com>, dri-devel@lists.freedesktop.org
References: <20220912180242.499-1-macroalpha82@gmail.com>
From: Michael Riesch <michael.riesch@wolfvision.net>
Organization: WolfVision GmbH
In-Reply-To: <20220912180242.499-1-macroalpha82@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1P195CA0048.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:802:5a::37) To DU0PR08MB9155.eurprd08.prod.outlook.com
 (2603:10a6:10:416::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0PR08MB9155:EE_|AS8PR08MB7909:EE_
X-MS-Office365-Filtering-Correlation-Id: 1473d60c-3c0e-48ef-b458-08da9554eee7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: uFXdBOJka57qjoEh8zZlWo/7HiRSRQpch4hcZKeq6+Lau4Di2boX7sIrDveVoB/LRFvlygXlM18iX0Wpe7MS99gnBgqc27o1rnDKO8UShNw5lyW+vvMp4c6lE6kCZ70b27EP66oDt9NbKj1ajrrzyOAQnzeO48WYpFoCDKTCvmDodla35DinRfSaEie+ZzJOtckBWC35ds1dU6J8i4axaQ5ypKLweCx7PtEFGLLDEFG5vFtpNTui9xfWucm0UIVMSkyJ8A7Vt7Z7D5YRE2NS0L8eixfG8qA04Wz+pP34JSJewjETZSH7yw9IVgIlY+ti6sLd/g4lzrEFvzpqmUP+POGU9+CYqjEsnGieNG8/TVvvdM6/oh13iVgd2jOWFHi0wmLihF04OsHrLK9nS5ABeYrisKLLLAudiDj27v9gACf3l5AlelYzxmpv1KyjDgIO00zyZf0GiOHm92DfQTJoF8CYLB/WozYGMCS6P8pdvPZMZr8IYyOhXC6tvTdk+sBAznbJcZVlww74Vh7rc46cNIqWGdmx08uu8XGJ/d60Hwn4GerV1d0wydF4rQuPFJlr61VxNyopzi68/P9lRLQZo7V6PHyhYXMM9QmJIKvWB6ePWuPSLuLPFT3O6FQd8O236qCvBrL2D+S+sZNT0HzGiQKUVYDXAc/Us7T3ikmXZlP8ZQZmsyxWgGMwpRfSkSY2mdUcic314bOxQ+YPY/+HGSqwYfXRhKRWQ83YiVkrCrjWFcUOKsExZO0SoMEGvGiQZ182Zi2M/9Pa27cZufy9US0IrffApqX88UymZnnaFQ+7CsFCiFkGLneRQg2V/KG2
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DU0PR08MB9155.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(39850400004)(346002)(136003)(376002)(366004)(396003)(451199015)(6512007)(52116002)(54906003)(44832011)(36756003)(8676002)(186003)(31686004)(31696002)(86362001)(6506007)(38350700002)(2616005)(53546011)(26005)(36916002)(38100700002)(6486002)(66476007)(2906002)(66556008)(41300700001)(316002)(83380400001)(478600001)(8936002)(45080400002)(66946007)(4326008)(5660300002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QzhwM2xadkxaa0ZjSVQ5OGxZVDVHZFNVQ0QxdWZVNE5OU0JyTS9MbWd3ZVIz?=
 =?utf-8?B?L3hzTW5JN3dxMTNqYVQyWnFlMlJzVWJxNExQekpkWkFzcjhCUW9TT29kVEVL?=
 =?utf-8?B?SGhqVVV4U1VTZDFMSWxXYjAyTHhZNVFUY0dBeUdzNERsM3BXV0hCblBQOFYv?=
 =?utf-8?B?b2ZtdlZHN3N6OW5pN1dZaGRCT1FmSDkzM25MUmk3RDVlMzBjL1Q1c3NkR0pH?=
 =?utf-8?B?dUtvb29pRVQzdzJhMll1SnMwUDNGTDN2YTZMYkZTaEVBcTNnVWoxTWk5ek9C?=
 =?utf-8?B?bnRidVlCUjViYnZyWVkyc1Q0RUU3RCs2aEJkWTk5K0lVakpackp4T2h4aHFa?=
 =?utf-8?B?Z292ZWtucDNNWlJzQnpLcXExK1p5ZEx6VUU3UkVCN0g5bXVhRWVnOGhIZU5l?=
 =?utf-8?B?bFFIUng4ejNXQWdvbUpwckVKRUcvaTcvYlNvUXZvZGFqZm5oQ3ovU2ZKOUxN?=
 =?utf-8?B?OWI3aGFzRFIwUGlIc1YzSkw4MDVBTVhIS2JSTWtydnRhYkhKQW9LME54VnlH?=
 =?utf-8?B?ai9tZnUxN3ZiTjQzdDU5bVBxU0tWbXp4UmJUVmcycnZTOUJaeDlETktnU1A5?=
 =?utf-8?B?VS9iSWM5My9NS1QrUzRsMWdadEc4Z1ZrbTc5eWxPWm5kN1Q5SFQ5QlppbWpU?=
 =?utf-8?B?aXBSbk1hTHloYk43ZEVBUDNETDJvWC91ZnB4SE5HN24zVnJ3cVJxemllZjNN?=
 =?utf-8?B?L0FCTnV4a1VpZWw1SnFBanpoejVwbG5HNnphQzYyOFVVeTZVeGRVTmVXakVV?=
 =?utf-8?B?LzBoR2g5OENVTHd3VEhOdTI2R3YxSlVZLzhrS2krNVByejQ3QUdLdUdjeEU5?=
 =?utf-8?B?QVNxNjliNGpseVZ4cmJMdmlERDNOakUvM1h0ZXdGa1VZME5XM285TTZvVWZ0?=
 =?utf-8?B?NGpQVkFyR05LMnBiZVpwdjYzZ2ZrS085UTlXZis4TCtub2xpM3RzODlxUUx2?=
 =?utf-8?B?S0s2WVZuUEJSNFNzV3hGK1N5U3lDNGVUQ0xPTkVDTTRaWTZiTmR1QlE1bThy?=
 =?utf-8?B?OGd6L1NIWVM1Y2RDU1B3V3RrTjljRTNzZE05aHlYVEhRSmlucWVpL0IzWWs1?=
 =?utf-8?B?dDBmUzZZMnloZmY5dHFuV1k5SGNMWkVTNlpJTXRSMGhKYVR2S3FYV2s5dXlt?=
 =?utf-8?B?TUlObnFBNEhJWVBvVVRpREdleHBnZi9NY1JoRU1ubzA0cGpnQVRxcUd5Z1Vi?=
 =?utf-8?B?M0ZLcHpjd2lWVUVMMGRpaFByZXRJcTZoMWxseUVoenV0Q3BIdnJDRngxWHBW?=
 =?utf-8?B?MThwUVQwNTk4Y0ZXQ0VubTBHeXlZVHFEczl1RTVVYngrZnordXY5aytLU1E3?=
 =?utf-8?B?UnR4Nyt0MTFadzVLVGNLdWhodHRLNDZYTFZkMW1aNDZzdDgwWVR6WDdReDE3?=
 =?utf-8?B?MjBZTmh1aTVRdVRqd1B2ajBZRmR4djgyWUpYRjZBVjlEVUZ5WUhYZmp1alpV?=
 =?utf-8?B?MjhRbGlNak5lRWVnYTIrQjVsKzFpbzIzYlJvTzdXVHhuOWh5eWlRQit6clAv?=
 =?utf-8?B?VWNJbzMxSFR4SldsaVprTWpWYi81UjV1YkYwWWtMbW96TmpabGdmRjV2U2tI?=
 =?utf-8?B?c2NLRkZldjc4dTh2dUF5Y05nN0o0NXIvOTlENW9GOTcvMVdlTG0zQzhHTXZx?=
 =?utf-8?B?bkZMdEZXaFlBb3hpN1lFQkJ4ck1ITGlLc1JHVHB3YndadHJLRmNOdlZzd0p0?=
 =?utf-8?B?SStDaDhuOXN5QWtEMnRhdjdWR29pTnlvcFo3YVpiRzJBVENOdjFtb3dtQk50?=
 =?utf-8?B?bkMrUy8zYW1PdmJWNFFaVlhxemFsM3JsRThPQTFvUjMwYTlPVkw5bXlDMlR4?=
 =?utf-8?B?THh2NjhRZjRHMzlybzZvTDRlZy9QZ3ErR3RJV0MwUWdVRzRvaGxYdFhlV2pi?=
 =?utf-8?B?WGQxMnZEUjNzNEF0VVNXUEg4OFVTdFN6bXo5VU5DaXhFZDVQek54bW1XT3JL?=
 =?utf-8?B?bnl6NzZVTzBaaXVVclRBZUhsZnpGNEhsZ3pRUGhOQ2Z6OE0zYUNkakFkYW9k?=
 =?utf-8?B?YnVzRlZheGJTb3lJZC9vRjFsZTlCNmVvT0laL1NoNHhxQUNXa3V2SFJ6QWtl?=
 =?utf-8?B?cm1PdEI5a0hkV3lPNEowMUJQZUFYK1JUTk9ZVXJSODBrZ0JXT2dRUm1OSXpv?=
 =?utf-8?B?UXA0UkZIYlV6SXQ1UEphMTFFblBVUlM0RHJUK05EWUc1cTY3MWtSL1BBU3VC?=
 =?utf-8?B?bGc9PQ==?=
X-OriginatorOrg: wolfvision.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 1473d60c-3c0e-48ef-b458-08da9554eee7
X-MS-Exchange-CrossTenant-AuthSource: DU0PR08MB9155.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Sep 2022 06:55:24.5382 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e94ec9da-9183-471e-83b3-51baa8eb804f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ioiv+9XOHApiOclLJ5vR31OOuj/KO9bVSml3ruwVslKM/6eI6OnsgCsZLYLoB5UFYxfkKt2vC6e75k6NP7rwhJxLPONdGkOcBFEmvO1qMoA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB7909
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
Cc: airlied@linux.ie, hjc@rock-chips.com, linux-rockchip@lists.infradead.org,
 Chris Morgan <macromorgan@hotmail.com>, Sascha Hauer <sha@pengutronix.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On 9/12/22 20:02, Chris Morgan wrote:
> From: Chris Morgan <macromorgan@hotmail.com>

Cc: Sascha -> any thoughts on this one?

Best regards,
Michael

> If I use more than one VP to output on an RK3566 based device I
> receive the following error (and then everything freezes):
> 
> [    0.838375] Unable to handle kernel NULL pointer dereference at virtual address 0000000000000250
> [    0.839191] Mem abort info:
> [    0.839442]   ESR = 0x0000000096000005
> [    0.839785]   EC = 0x25: DABT (current EL), IL = 32 bits
> [    0.840256]   SET = 0, FnV = 0
> [    0.840530]   EA = 0, S1PTW = 0
> [    0.840821]   FSC = 0x05: level 1 translation fault
> [    0.841254] Data abort info:
> [    0.841512]   ISV = 0, ISS = 0x00000005
> [    0.841864]   CM = 0, WnR = 0
> [    0.842130] [0000000000000250] user address but active_mm is swapper
> [    0.842704] Internal error: Oops: 96000005 [#1] SMP
> [    0.843139] Modules linked in:
> [    0.843420] CPU: 0 PID: 37 Comm: kworker/u8:1 Not tainted 6.0.0-rc5+ #40
> [    0.844013] Hardware name: RG503 (DT)
> [    0.844343] Workqueue: events_unbound deferred_probe_work_func
> [    0.844871] pstate: 80000009 (Nzcv daif -PAN -UAO -TCO -DIT -SSBS BTYPE=--)
> [    0.845487] pc : __drm_crtc_init_with_planes+0x48/0x2e4
> [    0.845956] lr : drm_crtc_init_with_planes+0x68/0x94
> [    0.846399] sp : ffffffc00a7a3710
> [    0.846695] x29: ffffffc00a7a3710 x28: ffffff8000fb4080 x27: ffffffc00a7a37a0
> [    0.847332] x26: ffffffc0097d01c7 x25: ffffff8000fb44d8 x24: ffffffc0097d01c7
> [    0.847967] x23: ffffffc009311870 x22: 0000000000000000 x21: 0000000000000008
> [    0.848603] x20: ffffff80010d0800 x19: ffffff8000fb44e8 x18: 0000000000000000
> [    0.849237] x17: 08000000000000d1 x16: 0800000000000091 x15: 08000000000000c1
> [    0.849874] x14: 0000000000000000 x13: 3432564e3631564e x12: 3231564e36314742
> [    0.850509] x11: 3631475234324742 x10: 000000000000002d x9 : ffffffc008682004
> [    0.851144] x8 : 00000000006f7475 x7 : 00000000fffffff0 x6 : ffffffc00a7a37a0
> [    0.851778] x5 : ffffffc0097d01c7 x4 : ffffffc009311870 x3 : 0000000000000000
> [    0.852412] x2 : 0000000000000008 x1 : ffffff8000fb44e8 x0 : ffffff80010d0800
> [    0.853048] Call trace:
> [    0.853270]  __drm_crtc_init_with_planes+0x48/0x2e4
> [    0.853706]  drm_crtc_init_with_planes+0x68/0x94
> [    0.854118]  vop2_bind+0x89c/0x920
> [    0.854429]  component_bind_all+0x18c/0x290
> [    0.854805]  rockchip_drm_bind+0xe4/0x1f0
> [    0.855166]  try_to_bring_up_aggregate_device+0x9c/0x290
> [    0.855639]  __component_add+0x110/0x168
> [    0.855991]  component_add+0x1c/0x28
> [    0.856312]  dw_mipi_dsi_rockchip_host_attach+0x98/0x10c
> [    0.856785]  dw_mipi_dsi_host_attach+0xbc/0xd0
> [    0.857184]  mipi_dsi_attach+0x30/0x44
> [    0.857521]  devm_mipi_dsi_attach+0x2c/0x70
> [    0.857896]  ams495qa01_probe+0x2d4/0x33c
> [    0.858257]  spi_probe+0x8c/0xb8
> [    0.858550]  really_probe+0x1e0/0x3b8
> [    0.858881]  __driver_probe_device+0x16c/0x184
> [    0.859278]  driver_probe_device+0x4c/0xfc
> [    0.859646]  __device_attach_driver+0xf0/0x170
> [    0.860043]  bus_for_each_drv+0xa4/0xcc
> [    0.860389]  __device_attach+0xfc/0x1a8
> [    0.860733]  device_initial_probe+0x1c/0x28
> [    0.861108]  bus_probe_device+0x38/0x9c
> [    0.861452]  deferred_probe_work_func+0xdc/0xf0
> [    0.861855]  process_one_work+0x1b0/0x260
> [    0.862217]  process_scheduled_works+0x4c/0x50
> [    0.862614]  worker_thread+0x1f0/0x26c
> [    0.862949]  kthread+0xc4/0xd4
> [    0.863227]  ret_from_fork+0x10/0x20
> [    0.863553] Code: aa0503fa f9002bfb aa0603fb b40000a2 (b9424840)
> [    0.864095] ---[ end trace 0000000000000000 ]---
> 
> A cursory reading of the datasheet suggests it's possible to have
> simultaneous output to 2 distinct outputs. On page 13 it states:
> 
> Support two simultaneous displays(same source) in the following interfaces:
> - MIPI_DSI_TX
> - LVDS
> - HDMI
> - eDP
> 
> In order to achieve this though, I need to output to VP0 and VP1 (or
> any 2 distinct VPs really). This is so I can have the ref clock set
> to 24MHz for the HDMI and the pixel clock of the DSI panel (for the
> example above it's 33.5MHz).  Currently, only by removing this code
> block is such a thing possible, though I'm not sure if long-term
> there should only be 1 CRTC for the rk3566 (and 2 CRTCs for 3568)
> along with a max of 2 encoders for rk3566 (and 3 encoders for 3568).
> 
> Fixes: 604be85547ce ("drm/rockchip: Add VOP2 driver")
> 
> Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
> ---
>  drivers/gpu/drm/rockchip/rockchip_drm_vop2.c | 14 --------------
>  1 file changed, 14 deletions(-)
> 
> diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
> index e4631f515ba4..f18d7f6f9f86 100644
> --- a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
> +++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
> @@ -2289,20 +2289,6 @@ static int vop2_create_crtc(struct vop2 *vop2)
>  		struct vop2_win *win = &vop2->win[i];
>  		u32 possible_crtcs;
>  
> -		if (vop2->data->soc_id == 3566) {
> -			/*
> -			 * On RK3566 these windows don't have an independent
> -			 * framebuffer. They share the framebuffer with smart0,
> -			 * esmart0 and cluster0 respectively.
> -			 */
> -			switch (win->data->phys_id) {
> -			case ROCKCHIP_VOP2_SMART1:
> -			case ROCKCHIP_VOP2_ESMART1:
> -			case ROCKCHIP_VOP2_CLUSTER1:
> -				continue;
> -			}
> -		}
> -
>  		if (win->type == DRM_PLANE_TYPE_PRIMARY) {
>  			vp = find_vp_without_primary(vop2);
>  			if (vp) {
