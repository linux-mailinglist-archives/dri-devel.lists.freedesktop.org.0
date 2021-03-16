Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CAA533D354
	for <lists+dri-devel@lfdr.de>; Tue, 16 Mar 2021 12:47:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 822098991C;
	Tue, 16 Mar 2021 11:47:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam08on2055.outbound.protection.outlook.com [40.107.100.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 47799898F1
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Mar 2021 11:47:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Uk32lzveyrDNMSQC62c7YdjnQsWZJSHIQgutJYj6FsL0+6Asp4+SucNTQUqkdvXIfI+NmTx0xFFw0IiwLY/6n5Mll6EFNMA0EF9BsNcKHkZKMZNfTsIpNMv2Zu984mzEiDZnIlrXQKqldlHYLY1W1D7Yw7hvfjWjtjTyFjoS379t6Xvo0tGS9D8tpl2C0sPw5c+cS5X4qyBk/zYXiw/Xi1XKWw0tjfwsogX5ag6XYtNSZRS2Yp0zOC6CVv1UYmUqzpYLpA0a4cm5S+QmAy1BxGOL4f49KwyNGnkupn/hJE5m/QHFDjQHerAOO8vjzfVVKkW3HUlvn/CvLddX8TGG7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WisSEi+HgR5TBsKW9wfx4xNwzRC6ZA38putcuziorIA=;
 b=fElmVzLUwFj1Ii8suUL+o2fLd04fPF4t+QDX8L1icO0b8wLGYtweK5wrSOVDRPvIUQyAe9h3Vr9va619cLwAT7A5uyNrHeRsixl05g/7gdlZuyLJF1qcyXK12048ddjKut7ZlB1MmCM26m42VvtRzPNIwiZDQ77pRLIQvlipubFJI5aKHdyekEUIl8c0HOOJH35f8OE5+N1UqObxNmcmIig2oTz3cTL8KEZMenUDpI7Yl4DWFWdqkpSId9Xc6F5LrZ7IHTq5vXL6ZczUJuXNq0KUEEWPf9CP8LdxD9Lnj+mnQIOdT7z12vONayfaQtN056kDX66of+msadlcNFA6KQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WisSEi+HgR5TBsKW9wfx4xNwzRC6ZA38putcuziorIA=;
 b=blDyYUZ9wqL4ECQ5W/y4IkuKFPucU9fXL3Z/BHZBrTCD15+5tE3rP/uls0Dk5em4eMcJK5A9H1ZVj0Oo2cdslQ8PuAY6+7LLmEZtVB8yEerzsaWkYXn1siCOKALY9EqegTCHMbwXXpPvk1wqojHdKZqcCLrFAE57imMwnPFMshI=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none
 header.from=windriver.com;
Received: from CY4PR11MB0071.namprd11.prod.outlook.com (2603:10b6:910:7a::30)
 by CY4PR1101MB2149.namprd11.prod.outlook.com (2603:10b6:910:1a::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3933.32; Tue, 16 Mar
 2021 11:47:25 +0000
Received: from CY4PR11MB0071.namprd11.prod.outlook.com
 ([fe80::d4fe:8135:d8fa:81c0]) by CY4PR11MB0071.namprd11.prod.outlook.com
 ([fe80::d4fe:8135:d8fa:81c0%5]) with mapi id 15.20.3933.032; Tue, 16 Mar 2021
 11:47:25 +0000
Subject: Re: [PATCH] drm: xlnx: call pm_runtime_get_sync before setting pixel
 clock
To: Hyun Kwon <hyun.kwon@xilinx.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Michal Simek <michal.simek@xilinx.com>
References: <20210310045945.3034364-1-quanyang.wang@windriver.com>
From: "quanyang.wang" <quanyang.wang@windriver.com>
Message-ID: <289ed4d6-bf8e-bc8d-0c31-dd613eebead8@windriver.com>
Date: Tue, 16 Mar 2021 19:46:45 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
In-Reply-To: <20210310045945.3034364-1-quanyang.wang@windriver.com>
Content-Language: en-US
X-Originating-IP: [60.247.85.82]
X-ClientProxiedBy: HK2PR06CA0010.apcprd06.prod.outlook.com
 (2603:1096:202:2e::22) To CY4PR11MB0071.namprd11.prod.outlook.com
 (2603:10b6:910:7a::30)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [128.224.162.199] (60.247.85.82) by
 HK2PR06CA0010.apcprd06.prod.outlook.com (2603:1096:202:2e::22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3933.31 via Frontend Transport; Tue, 16 Mar 2021 11:47:23 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b13c11ef-b2d2-4ea8-b97f-08d8e8714481
X-MS-TrafficTypeDiagnostic: CY4PR1101MB2149:
X-Microsoft-Antispam-PRVS: <CY4PR1101MB2149D5DCD6F1CF4BB7C85761F06B9@CY4PR1101MB2149.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 3cEGLprjMo0cXoS6WoOGiuSNWr7yxhW27ywbdkeSB1BDgafgL/GR1S/8XWQmEn1Bca18vuiMxjRa4C+EVfd+oFgvzQLhxpuCqTSHH3oG9zxZlOFm6isMw3VGNRhvIH5Ln2y+UrLM3x5HrDGx2eRaJhAD4epsnUPSUgbIbwk4fMhTIIpBqlA6faFoQPtrJ8vfF3myxdIsgbmZOlOTNdHV+3sF8YbOU2XoiaoYy8r7j6EK9+vmZW/IEyVscvbm6C1xyrQQ9CKrW1BTjQDRpXElsRhHfp3sb8ezoEiKdMRzrLAP/r4Ph29qMSaIyOUa7ZEmgwhyQPQr1vRBhhB61xOFT5B06jApfJtVhvTJZlh0KmF2/PGCWchXtaSwhYL3AdpPfx3fM2vWVLdevNmdeQpvdmR+ymIiLWtGjhCw/YLU65kqsv7CQalX8Or8I9r1+1l2OMe+t8A9oBMoFailYcZSC9h1GjnHy8yE/40yLsc9Uf3jr2NSRtXZCcz7vJiU7CnB/Q09/NWlGDlGqWDKiIAo+yiTzxu0v+CZwMoHL1nx/ihCqakry0aAAxI8NScHn0VvWK/3HEjfEHTb1UnQCclVPENLXvgTvxk2vFuqVfw2+RiY3lXCNrXBIzLee4+G+vbPlh7zaKj9DQRYXjZRp/Qd2JpsQDrIKS7lCzw/f0nJifc=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY4PR11MB0071.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(136003)(396003)(376002)(366004)(39850400004)(4326008)(2616005)(6486002)(478600001)(8676002)(956004)(6666004)(66946007)(6706004)(86362001)(5660300002)(52116002)(66476007)(16576012)(66556008)(16526019)(83380400001)(8936002)(186003)(31696002)(316002)(110136005)(26005)(36756003)(2906002)(53546011)(31686004)(78286007)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?dm5sajZBcUZzK0F6RlhvYk4yYkpaODVuSWJxU2V3cVFrRUtRbjc4ZmpXckhi?=
 =?utf-8?B?blFobU5XQk9HcWt1SDlGWERvRUlOeTNyWkJwajhSNy9EVHF0dVFFeGl3OVJD?=
 =?utf-8?B?dEZrOENRUml4SnRxSjBoQTR0VGp4UmIzK0R0a0Rkd1hXd2gydDlKU05OQzYw?=
 =?utf-8?B?R3dQc1E2SGxxRDNaOStlcjU0R0FGbHA2VFo5UXNkQTRPU0M3empsdmN1YU1u?=
 =?utf-8?B?Zk5kMkQvcGNEUFVSdlpEdlZ0VnRkcGQwSUtEa1F4NzFCM25KeWxWaS9vV0pF?=
 =?utf-8?B?enpnTU1yRWU4RG54WFVHL3QxMmYvQ2RwZGkyT0RDTzhqNUJMTkx5R3l5VDBC?=
 =?utf-8?B?ZEVEVFRJdnVKd3lVdjhjdFZzNDhCZ2RiT2g0OXh0ZDFBQXoxWHRWZzJoSS92?=
 =?utf-8?B?WmZkbTN0TFdOb0VQQTk3UXJCRUFmblJiT01WUVJFR2ppL3lsakpTREo3SEwy?=
 =?utf-8?B?eXRJekFKUmFueUg1T3p4TUVNYmJHaUtucS96SENkWjlCbHk1UGtsWmtzYUIz?=
 =?utf-8?B?WHBDVk9WSHJGZXNEVTlZTWNXN1dDbUdQTGpvY2RXeTZWanBTS1l3K1JSN1RN?=
 =?utf-8?B?U092TGZUc1g4RSs4eEJzazNIK3ZCWGJKRVd0dWNReGJucGVsV2tNSG5ZV3NT?=
 =?utf-8?B?aXRiekJuRFV6azgwZ01BdUswUkxZL3dBTlc3cXc4enhLaUFlYTdwazFEaUtS?=
 =?utf-8?B?R1Y3RHlOMGNQd2lXT2NuTzMrT0ZhdVNud2dkYnR0UTdLYk9uelFPcXIwTzJD?=
 =?utf-8?B?RUl5dTVqaEhwT2VydXNUMFJHLzA2Q1FnVUZzQkFNajZFY1cxUEl1cEJkRTdF?=
 =?utf-8?B?ZDlZZXVra0hWc08wK21wbjNLd2E5YXhKa1ZuU3h1dDdiN3NXbUtRR3Rja3hD?=
 =?utf-8?B?SkJlZ3hxakJxMmhJa0RGS08zQnVBMDFrMEhaZE04amY1V1NtUUFBTWFtbHE3?=
 =?utf-8?B?UDVWOHB3VjEyakxPZ2piNDNVT2Q3ZXd6UEtXRXE1VDVlR1pVTFdFb1VLdHdW?=
 =?utf-8?B?OTl0a1F3T3FLdENGMXdlV2d0MWJsdkRMR3B0Q3lRYXM5aTBKMFZuOVV1aTM2?=
 =?utf-8?B?ZFRTalRaTS9sWlY2aTZUbkt4cnpTN2J4dUl1R01FMmJaeHNyelBXMEZ6RkZ2?=
 =?utf-8?B?cldMbHBzNkdYWXU2U0gvVVFWUXpvZkRHbnB0SDdGRG5wNEEyQ3VRM1FoSFhO?=
 =?utf-8?B?SnFuNUdvWG9nRGplUVVBaHNVeTF6Uk5WTFpaWm55R0hWbkRWWFZUYWJKc1FC?=
 =?utf-8?B?diswNEcxODRmSGpINWE3MktvSlhTelVTcHV2R1VWVlhDaHhFNWJTcFQrejlS?=
 =?utf-8?B?Y04xVzJuQXBCUThXeGZDWkV5bEJ3NDExSGdTdDJzSHZVbis4eVFwaWNOZjhG?=
 =?utf-8?B?WDJpVFUzUXgvUUI3Zmh2OVAwRHhvcUJBV3YrdmVLWHNrcFNMM2RKTzBLYmJp?=
 =?utf-8?B?UUhKNHdTeHR0czVJa01vT0NlT0trdmxRZzNqMW80QkF6K0lxZTlNdW55QnpK?=
 =?utf-8?B?OE5mcVVpVWRxZVRBdFdvM3ZnTllIY2xrNUdRZ1ZlK05DMWs0bDhDU2JHQ2Ex?=
 =?utf-8?B?SnVhZmhxbjl0Mm1iR25NTThuSUp1amZhSlVVL2xqRnVkWFg5d2JLMkRnVStD?=
 =?utf-8?B?VmF0b2h3ZW9mWFhOT1RCUERybFRucTgxWEJoU0V2VnZqZTUwakxvcUlybmdU?=
 =?utf-8?B?dU5ZRjBYdWNocTFIOUxKeENpOStKa1ZuLzN2TXQ0NEFpMklEdVlNY2JnOHEx?=
 =?utf-8?Q?T3iq/EizVf1X1vRoKg/n+bEm5DDSHUDqNHVLOlp?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b13c11ef-b2d2-4ea8-b97f-08d8e8714481
X-MS-Exchange-CrossTenant-AuthSource: CY4PR11MB0071.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Mar 2021 11:47:25.4903 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 26oeqFzWmr2/GjoGmLulRSgaA70HGZ90CftgyEBQ+vvAautmVI7OKnWGDkmAxF7oWSoTgMXXOEHMNZMbUhZIoAg9gLd/iJ8dMTi1YXPpS9A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR1101MB2149
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
Cc: linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Ping.

Any comment on this patch?

Thanks,

Quanyang

On 3/10/21 12:59 PM, quanyang.wang@windriver.com wrote:
> From: Quanyang Wang <quanyang.wang@windriver.com>
>
> The Runtime PM subsystem will force the device "fd4a0000.zynqmp-display"
> to enter suspend state while booting if the following conditions are met:
> - the usage counter is zero (pm_runtime_get_sync hasn't been called yet)
> - no 'active' children (no zynqmp-dp-snd-xx node under dpsub node)
> - no other device in the same power domain (dpdma node has no
> 		"power-domains = <&zynqmp_firmware PD_DP>" property)
>
> So there is a scenario as below:
> 1) DP device enters suspend state   <- call zynqmp_gpd_power_off
> 2) zynqmp_disp_crtc_setup_clock	    <- configurate register VPLL_FRAC_CFG
> 3) pm_runtime_get_sync		    <- call zynqmp_gpd_power_on and clear previous
> 				       VPLL_FRAC_CFG configuration
> 4) clk_prepare_enable(disp->pclk)   <- enable failed since VPLL_FRAC_CFG
> 				       configuration is corrupted
>
>  From above, we can see that pm_runtime_get_sync may clear register
> VPLL_FRAC_CFG configuration and result the failure of clk enabling.
> Putting pm_runtime_get_sync at the very beginning of the function
> zynqmp_disp_crtc_atomic_enable can resolve this issue.
>
> Signed-off-by: Quanyang Wang <quanyang.wang@windriver.com>
> ---
>   drivers/gpu/drm/xlnx/zynqmp_disp.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/xlnx/zynqmp_disp.c b/drivers/gpu/drm/xlnx/zynqmp_disp.c
> index 148add0ca1d6..909e6c265406 100644
> --- a/drivers/gpu/drm/xlnx/zynqmp_disp.c
> +++ b/drivers/gpu/drm/xlnx/zynqmp_disp.c
> @@ -1445,9 +1445,10 @@ zynqmp_disp_crtc_atomic_enable(struct drm_crtc *crtc,
>   	struct drm_display_mode *adjusted_mode = &crtc->state->adjusted_mode;
>   	int ret, vrefresh;
>   
> +	pm_runtime_get_sync(disp->dev);
> +
>   	zynqmp_disp_crtc_setup_clock(crtc, adjusted_mode);
>   
> -	pm_runtime_get_sync(disp->dev);
>   	ret = clk_prepare_enable(disp->pclk);
>   	if (ret) {
>   		dev_err(disp->dev, "failed to enable a pixel clock\n");
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
