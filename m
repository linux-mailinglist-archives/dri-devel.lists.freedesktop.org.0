Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D0EE8BC881
	for <lists+dri-devel@lfdr.de>; Mon,  6 May 2024 09:44:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B14F112AC9;
	Mon,  6 May 2024 07:44:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=cherry.de header.i=@cherry.de header.b="aFcY9Du8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur01on2105.outbound.protection.outlook.com [40.107.13.105])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0DC22112A29
 for <dri-devel@lists.freedesktop.org>; Fri,  3 May 2024 12:57:08 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TxfwZt0pbIP0B9NGWu2AADglBzVaQd6Yu0ls4rKF5wg4fR6Fez8jBQAlitZXaNxsepz+2rr5Is9XCZ1SZn92/qBbxelXmEcy9K45R3lGBRZZ/g+7cxxev3xkdZOMoYk2aPmtn7Ws6sbZKbVJNvS8iwdgCjQAr+28S7SP8ZlTXv6hDf0MKsmv+Bj5iJjjuceqnpPWbySbPra9Vb6lkvTEpHdLmCUcFWzuoNZmVvWnAYiTHrUl4z/TLadjVZxbWV7MZJybFcDz0hgTfMQotXMn+Io3wHEmj0+UUo91fD7P5LsZwFRjc2/x5YfvMax7ekW5T5II0nDme2wC4U+Cko5KKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/k0fgC3Lsv+04nI5OpO/B8yZWyhx77vobRALgeXRhrw=;
 b=XnSjnFARSfAwaYuJwEGR3JsgmS9PDNmbiF85HD36CF7HqQ1JQC30X6feYu7BeiNd2+ZCiOXUQ6kMv1qA6tyPmuYJukfLuT50zosXlnC/l7wZyS8yOMGLhCrSddtSFtNBw9b12gCPNaYzzwu8IO+H6gjsP65YSVy44msDwrZ3oMdjdlrnH7wEJ8TLJB90cfmFckOIpmNau9UObuBSGKyGoiXq3KFHS3jnlhc93d5QzQKpYfrirOtXnncPRQBlQzx5pey6maj2YZ9sZNHFPVqpD9MQ1SlpFOeNe4gyofM0fHpVbq3FXvhjVoije6qaPhCUS9THVToJEfp9Oubnbnfy7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/k0fgC3Lsv+04nI5OpO/B8yZWyhx77vobRALgeXRhrw=;
 b=aFcY9Du8KEFV/NkPIzcRiS9MOYbHgW40cnvha7fmq2BM8tcTLcYqMiRw5bKmWeSoYqYSgMXOXoMgAR+p01tSnqBq7HApaYle3A+c0o0H2wmgQsYAhZgIJ57hrlabfZFjyY5SApXtBi2VdkB3U1pz6DeHRZY7QW7AbHWwmdqFcws=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from DB7PR04MB4842.eurprd04.prod.outlook.com (2603:10a6:10:1b::13)
 by PAXPR04MB8352.eurprd04.prod.outlook.com (2603:10a6:102:1cd::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.30; Fri, 3 May
 2024 12:57:05 +0000
Received: from DB7PR04MB4842.eurprd04.prod.outlook.com
 ([fe80::ac08:df46:97bd:4ae6]) by DB7PR04MB4842.eurprd04.prod.outlook.com
 ([fe80::ac08:df46:97bd:4ae6%6]) with mapi id 15.20.7544.029; Fri, 3 May 2024
 12:57:05 +0000
Message-ID: <062d86ab-1518-4160-870c-3cd36228d055@cherry.de>
Date: Fri, 3 May 2024 14:57:03 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] drm/rockchip: vop2: configure layers for vp3 on rk3588
To: Heiko Stuebner <heiko@sntech.de>
Cc: hjc@rock-chips.com, andy.yan@rock-chips.com,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 Heiko Stuebner <heiko.stuebner@cherry.de>
References: <20240425195506.2935955-1-heiko@sntech.de>
 <20240425195506.2935955-3-heiko@sntech.de>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20240425195506.2935955-3-heiko@sntech.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: WA1P291CA0013.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:19::16) To DB7PR04MB4842.eurprd04.prod.outlook.com
 (2603:10a6:10:1b::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB7PR04MB4842:EE_|PAXPR04MB8352:EE_
X-MS-Office365-Filtering-Correlation-Id: 79bf0adb-8e86-43b5-a4ef-08dc6b7088af
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|376005|1800799015|366007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?czlXL0xCZzVGQmxsRStZSGlOcDdTb0lvU3h4NklhcTNaZkFzNGdkalJFQzhM?=
 =?utf-8?B?ek5vd08xYlhCQ242T2FiczNaVjVxN2tPNmJIYlZ2Y29CcjFVWWUyRndhSkta?=
 =?utf-8?B?Qkk5eWdWdEtRamRhS1RFSzRHeHBTWThYUVZTclhreWZwS056NENXV3pEZ21W?=
 =?utf-8?B?SkJoSGozbVpkYUg4M1puOUdVMVBpbjNLaldpcEJGcENETlFxckVlT08rRURt?=
 =?utf-8?B?QlZxUkQ3YytZQnZIeEZOY2IzZjc4MU4vWDFZSEVBS0EvYlAxekpuVzRVaDdB?=
 =?utf-8?B?QW1ENkUrbFpLZnBtZ3E2eDdPSi9jS1VGemExekM2Y3pIbm52ZjVKcTdSZEox?=
 =?utf-8?B?UVJZaENMVC8yYzE0QnU5NEY3bnA2WWcvT2g5YmRtQzZkMFhNWEV4eEZsQVZz?=
 =?utf-8?B?RVQ3aTJ4ZzdKV082a2hqRldKd0p4ZTNiRWVxbXlqbUtsRGpqQnVJYlV2Q2Z3?=
 =?utf-8?B?UG5qN0hNQnBEZGhrRWtkWnQvbk5EeXd6WmpDUkkxR1pUZVc3VjFzaUFxR1A0?=
 =?utf-8?B?RHM4SzVlelNJSDMrUXBrTXV5dlZxOThKTHNTU05PcHpxaWk3Rk42REszcGQ5?=
 =?utf-8?B?d2ltd0pNM3hRVm9lVUdWR2t3RDB3aEMzdUlIQkNvZHp5MnBmaGhXOE9jK2tB?=
 =?utf-8?B?dkJSc2tUeEtjUEtFN0lSeHZWc1VHY1NDNnlCa2V5bm53TUFlVEI0UVBRK3No?=
 =?utf-8?B?R0wrbDdEVjNweGRuQ3l2OTluak4wVEo4OFBBQVlRTTNUMHQrVEdmUEUwSE1T?=
 =?utf-8?B?aEdKK0w4UENmQ2ZNdjJ5WHJqZ1MvQ1ZLT0RVU0tNSWVMcS8zeVAycW4rT3Iw?=
 =?utf-8?B?cTZ5NzhpMDg4cUZrOHloMXBlRWF1Rjl5RjZaVE5xaUFGdXBsSHlzWGNhU0ow?=
 =?utf-8?B?bjRRV1JLODF6N3VqbkZVZkZza3gxcVNHZ3VuVkpBRnpwbjREYWJ1dTlSQWdK?=
 =?utf-8?B?UjF4K2dBRzRrL1Q1QWFHY2VnSEdlaFlTMjlBOGpLU1VnS1NMdnNRcmZGVkNz?=
 =?utf-8?B?aEwrSU00bitUcHZLNnJwN3JoZmRuVDhwOERFNk9HODI0emE1dzMvM3RoZXdI?=
 =?utf-8?B?YTdxcnUyOGxuQm5KVmRESXdZYUkvNnJ0MDdvS1BDN0licWZjWlNTek43WW8x?=
 =?utf-8?B?SU1MNy9Fbk9iMVhSemdjQ0VVZUNXUXdrTEx6Vk1tRkhscTJoVVBWdnRZVURF?=
 =?utf-8?B?elg2U1lwaWJsRmZPL3BQcnFOR0xnK0dQTCt0MWloZ2pJRVY4eVZWcXo3RDNI?=
 =?utf-8?B?dWdNUmt6c3RYbEhKRnhBalpzbmtZTEpyUDcvZVNtdjlSZ0tlTXd4OU05ZER3?=
 =?utf-8?B?eXNhUnpaZjhTZmJKYVhvcWRWREJ0Q3ExMDdaeVJhTi9TVUplUWViNHo4UVJn?=
 =?utf-8?B?M01wN3BaeVFDb1VETWJyendvL2Z3NmJaRUhKbVRYS2lNMUVjRWl6WGhpb1ZO?=
 =?utf-8?B?VzM3M293c1RDcnVqd2doL3F5b3BGS2NMam9WNFc5eGRGZG4veUJlNUVPK3dN?=
 =?utf-8?B?aGgvUnJzck1sY1VZc25YZDNyU0FKQzQ1bmo4MEdzTVdBVTRtQnBtQUxpcFJM?=
 =?utf-8?B?WW5NVkZadklkUEZQWGR5QWJmTm1zM3NoeW90bTlWTzBjdlVMMVFEZjFIU0xL?=
 =?utf-8?B?cTlYOUkxbTYyUStpRTZKY1ZRZ25YQndxS21Rc01oZm1mUGZ5R0Q2cU80MTE4?=
 =?utf-8?B?VEdWc08rYzZUbzB0cm1JbnJGR1JyVTVsTDA4YUlocTk0RUNObm5uaytBPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DB7PR04MB4842.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(1800799015)(366007); DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aVNjVEp4d08rS0hnRS9CSU1JTEZobStEbm5veVRtYTI0UDFwdzBxVThTSTVJ?=
 =?utf-8?B?WHBvMWROMUpyUWowMzg4M3M3S1Mzd0RNaHZmOWVKdm9YalNFbHZkaGtGdVdk?=
 =?utf-8?B?ckhxT1dxcmxpdEZjWnRZTGgvTEo0ZlYySzIwQThOamdEbGZUUHE1YlFoMkk0?=
 =?utf-8?B?a3o2M1FpTU9vbHNpbmNHdzNwU25tRXY3TlZOMTB1STFack44TkxFV2xPSDFq?=
 =?utf-8?B?d01BZHVTeDdoelBSZ25lTHNSSnZPZmhLbmZ3RkJ3OWh0bFBoU21FREZoVUVt?=
 =?utf-8?B?bEZXcVIvZzltTWtncVgyTHM4U01HbVlZdG5RUjJDSTlrZWJPcXc3RUs5MEt6?=
 =?utf-8?B?VkhuemRYVkxzQVg2TEFFeitGbHlUeEpZTGhrZ3doRzFjWGRVMWVkL2VtMTNa?=
 =?utf-8?B?amZsOGhlamhYR25ibldqK2ZJWkJZVHJPMklKNEVKbWU0eEg0cTdnNEFEUFFr?=
 =?utf-8?B?NDBDYnpRYzFNVFMrT2JacjJacnRaRkI2aXFDNHlHVmp2V3ZVckZUUDRUY0Jy?=
 =?utf-8?B?d1p0cFJCb1Q0bUVMaHRzV3htM1pkUWVDWWtaOEJCbmJEOU5vL2Vxbkw5OEJz?=
 =?utf-8?B?Q1FtWVBHZlVBZFhTcmZEanhtem95aGNjL0hQRUZNZnc0S1F5aHNhUDkyb1RE?=
 =?utf-8?B?ZmZnS2Evb0UwSEJOaGtPZTIvU0xGS3lSV3NHQ0h6a016THJkYTlmM1RMd1c0?=
 =?utf-8?B?cm91elVvRUV3VC9ydllQRU1YUDBObWJpRmI2NXE0N2NjY1Y0dDllNjJqQkQ5?=
 =?utf-8?B?bmxsM2hVLzBXSTBpckgrN3VFVFZDUmZUUWVPK1RKRXdRaGtZL1IyYmN4WHZO?=
 =?utf-8?B?VEU4cTk2NGlSazcreWYycHRMQmNJNWk3K3JPTlg3YWUxWFoxalNaeE1yMjll?=
 =?utf-8?B?T0VObTJKSkFoRTY0WlBLVVNQUVU4aWpGcjAwbnBIOVVDNHE5eUllTml0R0E1?=
 =?utf-8?B?S2pTS05LNEdaRldxaU1CSzVtR1lYV2lDeVB1cCtiMUU0aWs0V2lneEtQem1a?=
 =?utf-8?B?aUV3Z1ltc0p4WWowbDhtNEJ6cWJ6cXdELzlIL1RxZGY2Ry9mTnB2VWUyNEEz?=
 =?utf-8?B?UkVLeTJGNTFVVjhHZXhuSEpuWTBweFVsUnZuS3dCaHJSUDM4bWhhLy9BUDhs?=
 =?utf-8?B?TkozZE00ZTZPejFLYWN4ZXRnMExtSEtBVDZpNVZ0ZU5PNjVGRDdqNDZhTU4y?=
 =?utf-8?B?U2JyR09jOU50bHlld3hKeXlhNjZuckJ0V2tPRForY2sxemRqOTFKMi90NHlQ?=
 =?utf-8?B?UVF5aXFMTU1mSHB2elh6cHdlWVNUemVSMW5Ud2pJQm5VbjN3T055SUtnaHli?=
 =?utf-8?B?c1Vlc3dtT3VqNnh3NUE4SVdMQTdIOGN4VFVwV1FNeTlHUDM0UmU5aEFSMm1Y?=
 =?utf-8?B?eS9JcmFHd2tZbU4reUNRNExEYjI3Z3BUUldxWk1aMUlhWHprVTkwcDZKMDRa?=
 =?utf-8?B?TS9DM1FSSTZoWVpXUitDaGRuU240cFNycGIySEQ4OE9PY255eEtLUFFLcnU5?=
 =?utf-8?B?VGhZNEd1dnVaaHl6dGg4RjVBNWYrNWhJL1JtY3hFajd6MXptVFc3R3BTS3hS?=
 =?utf-8?B?Z0laT20vTklyVE5GLzg1a2ZPRFllMldHK09JWjlkejBWTnY5RGRZaitnMTZU?=
 =?utf-8?B?cHJJNHdJMzR2RHErSGFtRWcxZUxublZHelgvSHdRaDJJQlVNdjVVa3QwYW0z?=
 =?utf-8?B?RERMS0JjQnhZQXZzK0lSOXhXZGxCSktja2crdGhDcDZsY0FVTlhDQVd3b01y?=
 =?utf-8?B?U00zK2xYZ1dTeEx4N3JpMTd1UDE1QWhYSWRyY1VtRFpmNVhBM1lnVUpkd1VV?=
 =?utf-8?B?MmNEaWpFU2UrWkd1V1g4U2E1WjB6S2RyeFEwb09kaFNoQ1JCZkpIWlQ5NnNo?=
 =?utf-8?B?YXFhRkVBelpuUk9yRENMNGhIbGxvTFJqZGlFUW0yS29PVXFDTkNTVlBSWDZ1?=
 =?utf-8?B?Z09mKzVvRkNoTmFoSEgyV3ZIcHhWanJvMU1CY3Z0OE1tbGtYM2pWbk85L1Ru?=
 =?utf-8?B?VWpCRFdoSGlrQXNBeDVGcnFBbUVpYTRhN2tCbnFMcW0xYW1jbEN6RHNEeVVo?=
 =?utf-8?B?QlI3ZTh0UTAyNEsxWnpxenFFditEVmxISFBpWkRTVEoyczlsYXNDVDVEdksx?=
 =?utf-8?B?TFBDYVpwNWR1OSswOW9LZDk2b3kvVGJHRlJJSDlEblZUYzJsNHUrT091dlpN?=
 =?utf-8?B?S1E9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 79bf0adb-8e86-43b5-a4ef-08dc6b7088af
X-MS-Exchange-CrossTenant-AuthSource: DB7PR04MB4842.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 May 2024 12:57:05.4937 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TcmikpbHMykAYstIDM9k8MDten0EaXXKdvqdFG28XEobvxLMp7aA/gnZdxk1EEpdk/jQ81kccHgpxtgHTHsoA7kPTS+auksb3PFQa9e6bPA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8352
X-Mailman-Approved-At: Mon, 06 May 2024 07:44:23 +0000
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

On 4/25/24 9:55 PM, Heiko Stuebner wrote:
> From: Heiko Stuebner <heiko.stuebner@cherry.de>
> 
> The rk3588 VOP2 has 4 video-ports, yet the driver currently only
> configures the first 3, as used on the rk3568.
> 

I'm wondering whether we should update the drawing at the top of the 
driver then?

> Add another block to configure the vp3 as well, if applicable.
> 
> Fixes: 5a028e8f062f ("drm/rockchip: vop2: Add support for rk3588")
> Signed-off-by: Heiko Stuebner <heiko.stuebner@cherry.de>
> ---
>   drivers/gpu/drm/rockchip/rockchip_drm_vop2.c | 12 ++++++++++++
>   drivers/gpu/drm/rockchip/rockchip_drm_vop2.h |  1 +
>   2 files changed, 13 insertions(+)
> 
> diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
> index 523880a4e8e74..1a327a9ed7ee4 100644
> --- a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
> +++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
> @@ -2303,6 +2303,7 @@ static void vop2_setup_alpha(struct vop2_video_port *vp)
>   static void vop2_setup_layer_mixer(struct vop2_video_port *vp)
>   {
>   	struct vop2 *vop2 = vp->vop2;
> +	const struct vop2_data *vop2_data = vop2->data;
>   	struct drm_plane *plane;
>   	u32 layer_sel = 0;
>   	u32 port_sel;
> @@ -2344,6 +2345,17 @@ static void vop2_setup_layer_mixer(struct vop2_video_port *vp)
>   	else
>   		port_sel |= FIELD_PREP(RK3568_OVL_PORT_SET__PORT2_MUX, 8);
>   
> +	/* configure vp3 */
> +	if (vop2_data->soc_id == 3588) {

I think it'd be smarter to check against vop2->data->nr_vps >= 4; so 
that we don't need to maintain a list of SoCs that support a specific 
number of video ports.

> +		struct vop2_video_port *vp3 = &vop2->vps[3];

This is always possible because vps is statically allocated for 4 items, 
c.f. struct vop2_video_port vps[ROCKCHIP_MAX_CRTC]; so we don't 
necessarily need it in this specific location and can group it with the 
others. Cosmetic suggestion though.

Otherwise, the change itself makes sense to me, so:

Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>

Thanks!
Quentin
