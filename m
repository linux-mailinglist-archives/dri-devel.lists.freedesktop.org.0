Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8368A8BDC78
	for <lists+dri-devel@lfdr.de>; Tue,  7 May 2024 09:31:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6DB87112458;
	Tue,  7 May 2024 07:31:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=cherry.de header.i=@cherry.de header.b="XaIFhgPg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2106.outbound.protection.outlook.com [40.107.21.106])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 63A8710E8C8
 for <dri-devel@lists.freedesktop.org>; Mon,  6 May 2024 11:17:34 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZuIaog+IJ8eOBY0Bm0e0nLcQ9L7iyp+JU5ZWuuE12ol8LyouD3a6MBU481JU3O/lxZjMlkurJcpWoJDHcSdkSFkbCzkfOJ41ZoNsyyavlwhr1r63xW/v/3XZB2wV/XLHmL3r2JzAeKRRkpneM0hhovL1W+YoILXyPliCFDMHOazy/01LCVyDp77qwKzcsfHgZuet6KNaBvGyrSpsB/o9JvI0XC1WDmFqp9TnP6yeVo9SBLnId+ATuffbBABJv4wK9eWzLE72+uSsq7zJemTnMmslauaT2LDCHOBOAvOK0gd22oKDrTmHC2noFo0E0OLIwMTpGrsiKySw912Q1cA0Rw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nOXisUfPfUyiicK6RVTw5uO/xuqBB15MSmwUBl14XV0=;
 b=Q1Yz6u6C5RpBQcR5DiJlX1ZrB2AcPa3XUuc8Qvk/4oFp7MWdgW6MtY8Zr622LDleYYwWhvhUn8JnY1siMbsUh9g71RroKsdJW6HIM7v/fnsYePrGtMR05LvN7zbhw7xDQfdYchw0+uzbwgotOAAuYLer8X8cCQ4CUpzTX9r/ghjmhHTlPiUUA5pVmbKQxVXhSqvAq/nz+72cdQV/zb2zZAeXbhRgT8qbX0tIdw+WBAehUgOiyL0j/9B3fG6HirSchEJSvy659E20hzskZxi4kn6CiSJtSBHhEhMKvaauK2WGgjqMgi0BvAQ6iWb/0KXKxIpnRod5XHcG5mhRwjuwYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nOXisUfPfUyiicK6RVTw5uO/xuqBB15MSmwUBl14XV0=;
 b=XaIFhgPgdVoe3d9qFXS8bsXyDM3ME2cirxq3QwpkOzHPSy3LhB2MQ7y+UXDbCLBEJV7dcEVVSUn9uWhJbrZ6p5kcNcp8kHIzBtyrFBPVpU6if81IB3Ft3znVn4/MjTensD3ASa/Mhq1GB6wnWTzL8ZN4LRNNrt+3hhgOO1h390s=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from DB7PR04MB4842.eurprd04.prod.outlook.com (2603:10a6:10:1b::13)
 by PAXPR04MB8406.eurprd04.prod.outlook.com (2603:10a6:102:1c4::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.41; Mon, 6 May
 2024 11:17:30 +0000
Received: from DB7PR04MB4842.eurprd04.prod.outlook.com
 ([fe80::ac08:df46:97bd:4ae6]) by DB7PR04MB4842.eurprd04.prod.outlook.com
 ([fe80::ac08:df46:97bd:4ae6%6]) with mapi id 15.20.7544.041; Mon, 6 May 2024
 11:17:30 +0000
Message-ID: <44fb831a-1e81-40ee-b525-79e0f157b817@cherry.de>
Date: Mon, 6 May 2024 13:17:24 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [RFT PATCH v2 14/48] drm/panel: ltk050h3146w: Stop tracking
 prepared
To: Douglas Anderson <dianders@chromium.org>,
 dri-devel@lists.freedesktop.org, Maxime Ripard <mripard@kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>,
 Chris Morgan <macromorgan@hotmail.com>,
 Yuran Pereira <yuran.pereira@hotmail.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, =?UTF-8?Q?Heiko_St=C3=BCbner?=
 <heiko@sntech.de>, Quentin Schulz <quentin.schulz@theobroma-systems.com>,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Sam Ravnborg <sam@ravnborg.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 linux-kernel@vger.kernel.org
References: <20240503213441.177109-1-dianders@chromium.org>
 <20240503143327.RFT.v2.14.I264417152e65b4a2e374666010666fa1c2d973fc@changeid>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20240503143327.RFT.v2.14.I264417152e65b4a2e374666010666fa1c2d973fc@changeid>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: WA0P291CA0006.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1::18) To DB7PR04MB4842.eurprd04.prod.outlook.com
 (2603:10a6:10:1b::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB7PR04MB4842:EE_|PAXPR04MB8406:EE_
X-MS-Office365-Filtering-Correlation-Id: 76071dee-1cef-4445-a7f3-08dc6dbe1c83
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|366007|1800799015|376005|7416005;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?K0FOeTlBUkJmell1ZFhqZ3FEVUR1bGNFOEYraFVpbjBiVDhvRXpOUGVpbHNS?=
 =?utf-8?B?cDZ0enpBbFdkT1hPelJqZXFkQmxvb3I1RVBPRlpHamhKN2xmb0hUb08yNU1Z?=
 =?utf-8?B?eFFzbUVnLy93c2k2TFVuQWJjWXRXejF1aUNXUmFmWnNBM3YxNTBvbUFiSy9l?=
 =?utf-8?B?c0F0RWJBeGpOTEZtRi9WRlBpbDNXajRvR0t0TU4zQno0dTdrbzhhazU1VkFm?=
 =?utf-8?B?akZBMGJQQlY1TFREYkFnWklFNGY1MUExd3g2bWpFaG1Pczdqa0lTRTRmNkhN?=
 =?utf-8?B?Zi9Jb0RiSjlyckI3WXgvenVXTk9MZmhla1lQOHJWYWtaQ2NNYUhpM3ZwQWFG?=
 =?utf-8?B?c2NRRnZ5eGdhMUdwNkxaY29QZDFSK1U1YUkrdkl2MkZ1M25IL1hDWjdpOEZ4?=
 =?utf-8?B?Y3FiRzRMZzdOcWQwNHlneGJ6MWJZT2FXSmNDZTBXZFhTWllhVGJMTlp5U1N1?=
 =?utf-8?B?YjZnQzArYWk0YVU0NWwrUmI2SkZ0eUxKeFJBc1JrTXRaeFZIYWdxU0M1UnRi?=
 =?utf-8?B?dFk0NjZBeXFVaG5HTW8wMEgwZDJSRCtOQm9mcmhvMEVhSFR3WlpodmJLczJG?=
 =?utf-8?B?aXlWM2JYVEh4MDVzVGpKVHpXT05rUUUxOWRSa2dNQWt3ajd0TUUwUjg1R1ls?=
 =?utf-8?B?aEVydG1IOHFLTkpzbkhJZUYveFhvWmZKK1Q1cVhjTTN5emJxUUtzeUJ2Ry9Q?=
 =?utf-8?B?aG1sRTBzdVZ6bStQdGhwZ2V1WVZKQXVEQ0tscEMvVXR6WHFpZFg1V2VPV1F3?=
 =?utf-8?B?Z1FGTEpoRlhOaTd1R3QxK2czZ0NLeVFWbmRzbkNJcEZKMEdzOGg2b0J6cFBi?=
 =?utf-8?B?Qkd2SmlQUXF3aGlrdUJaNHJaNmszdTlsMVhZKzRZK1VmWlZXUE1ieGJiYk9Y?=
 =?utf-8?B?bHpXZmM2UHNZdnVpZjZyLzNjUGNGcEJGTyt3b3dzTCtFb0dQRk5ZYWY5ckRK?=
 =?utf-8?B?dGRVb2xsV3lpdDB1VjR4c29zcFlmRmpRckJ2NHg4a3BDYVF5aThiSlFiZFFx?=
 =?utf-8?B?WGEyUHhPQks3cGJ3dCtkOFd6c0JvQ1R2emZLWlNSdkRmeVdCTlg2dFkxRGdI?=
 =?utf-8?B?UVNOYmRvNWM2SGFLQ0RRb0Q1Zkt3Z1BpOExrY0YyOWxoeVFUaWFvRmluTTd1?=
 =?utf-8?B?dXhFUy9xK0ViVmRLK1VXbHhZVnFiZTQzc3NJc3B0ZDg1TW1neVFCN2NMVjFa?=
 =?utf-8?B?cktRdkRqQy9vNnpyWVpLc05sNFFMYWdUalFDbDdVeWpMdWZIa3JxVXI2THgx?=
 =?utf-8?B?ZDkvUlFVMmZNVG1DT3IvTHp6WnhNWkl4RUl4ejB3bUhsZTV3VXd4U2hPSlIv?=
 =?utf-8?B?Y3VhaXV5NDBiT1dwUC9tQ0VhS0IwYjMvbVdzSjdxNm1WOVU1anZkMUY5aEkv?=
 =?utf-8?B?MTgzLzU3eFF4bUdicFkwdm1SWkljbUxKWUlBNCtrWCtaSzVYV0pHaU1OMUI2?=
 =?utf-8?B?N2wrOFBBQko5Q0ZiSG9pUDkzRFRJNkJSL05JMmhDVmRyUnBHYnVQSGwxaTFR?=
 =?utf-8?B?Z2VMNXV0WTV2TVNGSno3ZXZjaVVRVGljbEZ1VHdYV05YODU0cytwbS9EU29l?=
 =?utf-8?B?REFWSnEyaFlyaDBSek1iSnM1Mmp1U1A1cUFKM2srd0M5V1RHcXBPTGlEVHJw?=
 =?utf-8?B?VmxEOHFDMVFZVXVXMW9HNkNzQlZqQzNaejZxazhMUjhTMVQ3Y1FNNUIrZTRW?=
 =?utf-8?B?eWl5SGxSclJla2lLbDZRUWlyWDRrcDBZV2hPRWlqWk5FcjdHeS94cTZBPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DB7PR04MB4842.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(1800799015)(376005)(7416005); DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cGZLMFRldVV1K2dESEpxcjE4SVdScmFzRHVZVjR1UVlyN3BodEdnUEZUQm9J?=
 =?utf-8?B?NjcxR1UvWUhabENpUlJ5bUlKNzNVRVpURE9ndnFnYWFYaVFtTGRsMXZBREgr?=
 =?utf-8?B?Rm5Kc1A4eXBkaFBTWmkwbnpWZzJOZk1rcmVuVlJnUlpNZ01uQkZZaFNJcnVG?=
 =?utf-8?B?WFBHdDI0azdnblRrK1RFYXd4M3FuSnhJdTNIVlA3SFJ0K01udTA5V0U3SW1Y?=
 =?utf-8?B?RUs2cjA1Zytva3JuNFV1L1dDeTVmUS9sMFkzZEhmbmhaeVlvbzdVL2ppUmJQ?=
 =?utf-8?B?WE14VlZuaEVJa2Q0YzlCODQwa2J2cmJtVisxYmQyZVVqb3BFWXBLSlQ4TXo0?=
 =?utf-8?B?UlJZVGk1VzZZb3FpL3lva1hDUmFqR213clJqRndUT0VRbUM0ZjJ4VW1Ga2hv?=
 =?utf-8?B?SW90b2NZMXNNTis4bndqRnlhOTBaVDY1b28xSkVyZ0JicnJCbU1IWVMxZjQr?=
 =?utf-8?B?ZEpiZU5WbmRPQUd2OXd3VGVIejVvQm9rcitHQnMvRTI2dlRSUGsxU014RG80?=
 =?utf-8?B?VUNVY1daMVkvd3N3T0QzUCtjV1YvbjBPL2E0dzhoTmxEZE1ENGVHdzIrRDJT?=
 =?utf-8?B?dzl1VjBGK0JYYXpOc3hUVG0zOWk5UlZEYzhxdXZYUWFFVkF1NUtDWlFVejZX?=
 =?utf-8?B?bFlRWDY3Zy9NVlVOSWNNbHRMWXcxdVd5WGdhQ1cvT1RIUEFnV2FCdjFWSGtj?=
 =?utf-8?B?QjBVOWpoaHVuenFuVGw5bTFyMmhqeW1BU0oyd1VPMG5KNGlaaEc0eXlFWmY3?=
 =?utf-8?B?bjhwNXFiM3FnMFdmd2o3QjMvbi9hb3lDTEhscVlmYStiQjllTWNGcjVZcjJ1?=
 =?utf-8?B?dngvQ0hoa0EwMU5zViswV3U2OVh4YzhpdDdBVU1vWmlOYlRhdjk4dEkwNE5r?=
 =?utf-8?B?TVQ5bmVCU0RQWWk4dWJxOVc3ZHV6MkZ2cHBIaEw0Z0FIRTZUeXNLWkxXQ1JJ?=
 =?utf-8?B?VitvSEh5ZFhFMlhRd3ArN2VmRGdHRTV2UEJXYUxqMEZQY1ZCVlFTdnU3UjI5?=
 =?utf-8?B?amdUMm52REVRbTdmQmZIOFo1TERRLzNDeUg0WCtxVURxSHYyRzZTbkRMNnpO?=
 =?utf-8?B?ZVpYdWltYVRlbTVsQnBrRTdaQi9vRnB2SFBleE5IRENCdm44R2RCanFwSXEz?=
 =?utf-8?B?amNZRHVVZDUxekwyZnpGcGZXUThxalAzTmh1ei9SNFRsd1ErS1JhM0szN1ZG?=
 =?utf-8?B?SnpyNVp0QXFIOVFDZWk3UjB1Z1pYTTVTS3o4Vmt5OXg0eGxJK1B4M1lKLzQ3?=
 =?utf-8?B?U3FTd0NQQVdmRmJFS0lnN2pYTy9UaU92U095SWlRVDd1SXJpQ2VQZGdRWGp6?=
 =?utf-8?B?VUUwQkZhd09lRU1Yek4wM2tISUU4dlY5UXY5UFd0Ykd0UnRNOUFEdUlwTUFF?=
 =?utf-8?B?VFQ3MXQwcXgvWEw0cmtIN3N0TDZVdkNGSVd1MlFlWlFDV05uRCt1SWtCTGV3?=
 =?utf-8?B?Tng4bnFiMGl6OWtwc0w3WjBzUmtzVUw5Vm9BZ0haYnIrNDFjajZ6UU16V3da?=
 =?utf-8?B?WTBGZFFTMnBNSElkdnRnYUFxbzQwM2hyaG02NTNwRktwQXFicDh4NG52TERF?=
 =?utf-8?B?RlVSKzBJbWxjN2NBSURnZXZFWkYvdjh2bnYvVEVPMENpQnFSTjZ2ZDlxTW04?=
 =?utf-8?B?dHVYVzA0azRsdmwrTm9DU1hlTHVkNzRNbGVjcFIzRzA2bGgvanQ3b1I4S0pt?=
 =?utf-8?B?ZTE4b3pBZVZrL1pKNjEvb2gvdktTcHhlT2xMYWNuYVRDUlRDOEdWK0xWQkNS?=
 =?utf-8?B?NXNnd1hrQkVyMjVVbFRaSkYxZStiOVMrOHc1SVBzZThjbUNBaG42NGVjZmFs?=
 =?utf-8?B?MjlqYzlHdkt0SVd5RDZscVNQZzY0ODc4SmFBZGt4SGRmTWJ0amZ1NkIrZlRo?=
 =?utf-8?B?Z0dJa1NvT21YZlg4K0hLL2pLWFkzVThpUUorZ1NWbW1qbkhRN1dxd1R1VnVk?=
 =?utf-8?B?M09VUzJjRzkxbFJoZXdQWFEzcmFGUlFCRFlJek9IQzRZZUxlNHcvZ0crWWly?=
 =?utf-8?B?bWROV1luQmd5bEJEREhYOHB2ZlAveWorLzk4Vm9saklERjRORFh1eGVMcVEr?=
 =?utf-8?B?Tjl4K2pqTVFYMmY1RHhFR0xiY3dWcDBrbkhPV2Q1NmQ5NFlGTHFWVWxIMFFD?=
 =?utf-8?B?WFFDS1BPOSs2d000dzEyMmVQSW1nSXVZZUt2R2tJU2xoQTVJSDVMempqOWNG?=
 =?utf-8?B?MVE9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 76071dee-1cef-4445-a7f3-08dc6dbe1c83
X-MS-Exchange-CrossTenant-AuthSource: DB7PR04MB4842.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2024 11:17:30.5711 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: smbG56FLjnoRRn2fJcP8k0snERuqnsbzbfJ6SuaobXIw3KqZOPnfKLk1CJVK7416rpjl7pPtgeOoaklEOkNgGWxaYmEBquZVd0VdZm/y75Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8406
X-Mailman-Approved-At: Tue, 07 May 2024 07:31:32 +0000
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

Hi Douglas,

On 5/3/24 11:32 PM, Douglas Anderson wrote:
> [You don't often get email from dianders@chromium.org. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification ]
> 
> As talked about in commit d2aacaf07395 ("drm/panel: Check for already
> prepared/enabled in drm_panel"), we want to remove needless code from
> panel drivers that was storing and double-checking the
> prepared/enabled state. Even if someone was relying on the
> double-check before, that double-check is now in the core and not
> needed in individual drivers.
> 
> Cc: "Heiko Stübner" <heiko@sntech.de>
> Cc: Quentin Schulz <quentin.schulz@theobroma-systems.com>
> Signed-off-by: Douglas Anderson <dianders@chromium.org>

Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>

Thanks!
Quentin
