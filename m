Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E1F48BC883
	for <lists+dri-devel@lfdr.de>; Mon,  6 May 2024 09:44:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E3C0010EE36;
	Mon,  6 May 2024 07:44:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=cherry.de header.i=@cherry.de header.b="MBiulqz1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2108.outbound.protection.outlook.com [40.107.20.108])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A2C6E10FBA5
 for <dri-devel@lists.freedesktop.org>; Fri,  3 May 2024 12:13:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=a/AYvRlA3p1pPnV7i7gQPZrESMRwT0jYqxq4bXRvEnNNPJ0kt4na9yT0ob4B/KLEnku5BTdZ8To5o4S48VPOTB2g/2k/rOuR3wQkyUk1XFQI04JM26QcYFJ0suUR4vpA2HQFWZJy85FkN8l4f0EFeF2CNSw8Fakp5w3ly7VpOtEl9SZO3wrTk56h5E1C5TIytPA/CvH8rTZHGC1OZWLjRZfIN4kIlIGS2DwUmqJh3UjC1nTnn3VLFaHYTTrXCZMAJmn/sSSyb/9kcuG7jMG1Y/2kkgDpjeCjJVl+Ji7Uic1rZc8BBwkYmXRlKEkcSqoBR9Y6sGx+rIOZfbAyRsNcHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UkQQWDeC+Z1oTTQIq+wmmD8aCoOL7Buzzy4i/4wwYOk=;
 b=TRmGwJ6b82nj2dfwT/khOWYShMiWYdlsN4xsAj2aVVWszPsyqEoxIlNs4OC+jswhsaKNFNZnGKDbe+XpKFLdspIjKj0E5T7I6vle+7KX5X926Vhr99V8gXQB9V1mxpmQwShbWn5oa1+ukE+L/P5SLDSEMh0gauzm6BgH/H/4Al9AVkaLVpcKTllOIJK4EvdKVtSYlRlZWjbDLtoFtNVFQOWn24PVt4YrGaA/F91ZOXAg4QZrrB3LlDzGv2zdZVQxeJl8LfTHczzHp6vBNE6KtzAqyKNxnRZPHjKjTHp1kHEdn0x6Oawh3mJGpX4q2DwzNGMjRWO6xyoSrRyjOyv2Qg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UkQQWDeC+Z1oTTQIq+wmmD8aCoOL7Buzzy4i/4wwYOk=;
 b=MBiulqz1B97m2the2aaMzewtQ1okcScKZdyMmw/sXPK7g4J2oWCb9Mqx4uySuhnrz2lovVhW4myyAKUJqDSB/4uJSfJ+Rw33UD6PmQ4m3si65O8U9jIzmp7kF2hBz5Ry7BR1OXDLyO5uRLeSCEZAEOj7WBBNYPi0wAsmeEGiUQY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from DB7PR04MB4842.eurprd04.prod.outlook.com (2603:10a6:10:1b::13)
 by PA2PR04MB10123.eurprd04.prod.outlook.com (2603:10a6:102:403::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.29; Fri, 3 May
 2024 12:13:40 +0000
Received: from DB7PR04MB4842.eurprd04.prod.outlook.com
 ([fe80::ac08:df46:97bd:4ae6]) by DB7PR04MB4842.eurprd04.prod.outlook.com
 ([fe80::ac08:df46:97bd:4ae6%6]) with mapi id 15.20.7544.029; Fri, 3 May 2024
 12:13:40 +0000
Message-ID: <cb73853e-4201-4cc9-9e8a-f977e66241f6@cherry.de>
Date: Fri, 3 May 2024 14:13:37 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] drm/rockchip: vop2: fix rk3588 dp+dsi maxclk
 verification
To: Heiko Stuebner <heiko@sntech.de>
Cc: hjc@rock-chips.com, andy.yan@rock-chips.com,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 Heiko Stuebner <heiko.stuebner@cherry.de>
References: <20240425195506.2935955-1-heiko@sntech.de>
 <20240425195506.2935955-2-heiko@sntech.de>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20240425195506.2935955-2-heiko@sntech.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: WA1P291CA0007.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:19::11) To DB7PR04MB4842.eurprd04.prod.outlook.com
 (2603:10a6:10:1b::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB7PR04MB4842:EE_|PA2PR04MB10123:EE_
X-MS-Office365-Filtering-Correlation-Id: 77eac953-ff15-48ff-c987-08dc6b6a77b5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|376005|1800799015|366007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RnZDR0V0VWlxUjJUbTRESWU2dmhraCt5M1dqcEEwMTY0dUtiZXpIVWFSNzF4?=
 =?utf-8?B?K0RZeVpsRWVlSDNIcWtoMGRvUUl3NXdveit3dXllT1F1bkJGUWhIMTBsRjl2?=
 =?utf-8?B?MWNtbXZWMkRGOTlhSmZVd3NIN3dTU0htSU1VM1lmcjdKN2dTd2dmZGl5NUpp?=
 =?utf-8?B?bXh1NGRKU0dFZVU5Q2czai8ydXZxU0lrczM4eVlOZk9BVEQvYkVNUmcxcGRh?=
 =?utf-8?B?RzFqTnc4TTFEdjRPaDBXdkplSzBzUkVaeFFCMnA1QVZxUWg4UHUyaW5qQVRj?=
 =?utf-8?B?c1JIWWcvR1ZoWGhpR3hWd1NQaitpdXd0cXpxb3dia2lIazZUeW5Xajk4VDQz?=
 =?utf-8?B?L0tvRTBEQUlQbCtpazMxUnpUaTVBYWR4NzlwRWNROXN2VXFvdUJKRmlPbDlK?=
 =?utf-8?B?bFRZZGNPdzJQUlJJUWRGVE5ScFI2WU1VS2hoODBjaktRaHVDeXVlekR3VTFI?=
 =?utf-8?B?Q1IxUCtkK3NvVWpKeTZlemQ1Z1dZYnNXTXVMUUNHb1E4cW4yN0o4UE9WUStp?=
 =?utf-8?B?ZmJMMmxRUUVsREVuNmJuNzlzZ0dDNWo3T0VLWXF6NUhLeUJKVlBDd0cyM1dG?=
 =?utf-8?B?MHNMUUJrR0FQTERHaS94WkR4eUFQcklUVUtFVU5wWUdma1NwNW9yWlBpcUpz?=
 =?utf-8?B?MHl1Vi9PSEVvbExtUVMrUVJKdEdYUmoralFlTUJhK2ZFaWZkWjNNWmVjSTVT?=
 =?utf-8?B?NDRIWDNkSG9tOWd1UFJzSktHTmQ2NHM2TUpub0gxcGVGdm5ITHVhZ1ZRbzkz?=
 =?utf-8?B?MGxBK043eVRvbWdKQlZXZW90ZWY0bm9BN1FzL3FhalN2QTJyNG1pMjNSWWFt?=
 =?utf-8?B?bmc2dFJnSWRZZmRYSHBoYzM4b25PZ1hYdFRtY0R0WTNjYW90R3lsQ1BLcGZD?=
 =?utf-8?B?V3BlaWdDUmMyQ1hMOGE0V3FzejJ5NW1yZ202MVMvY3dJSk9OOURqNUlYaTM4?=
 =?utf-8?B?Y2hBRDdVNVFtc0RXT0xmSkl3QUJONTc5MW1PRHpVU2FQdlB4OThBNitZUUpp?=
 =?utf-8?B?L0Nud1hPMEtoZ1NyNmd1ejROcXdnYU1DWmRobHA2RjVIQXBXbFdQL284OWNG?=
 =?utf-8?B?TEZUOThLMnhKOTdEY2czTFRGamhwcDU2bWpoY2paWEdtZ1FHdTBhMDRjZ2xM?=
 =?utf-8?B?YXpTWXp6T3VjdVlad1BoYTVidmd4TkVNaERKRXgrOCtKWUMveVpUc2E2SE9z?=
 =?utf-8?B?KzMydW5tMGZrYjlya1M2aUxKWG5iL0puQVlQYU1XWDJzMTdNQ3ZGRytrYmsz?=
 =?utf-8?B?NEo2bkE0OWxXd1FqazAreG1nRVpsbGt3cTNQSkJ0OUVXUE5vd3I1Wjd0d1Ay?=
 =?utf-8?B?VDRTZUtPU3prS2FmT1lRU1hNay9MQ0t4bmRqQk9ITmJFOHFqVUpraVJYWU1k?=
 =?utf-8?B?YUV1V3RqYXByc1hXcnRyZXo1ZGJtVUNaS2FmbGUwNEwxaDR4M3U4OGd5QTJL?=
 =?utf-8?B?dHROV1R3SkpiRWpqdzU5RkdYLzYzZ1hTTmVNNFVIVjg4WnRQMTREbG0wM2g2?=
 =?utf-8?B?RFhucWNvTnlxL2d5ajNHa3Z4aGhXWXdNUnZ0SGZuK2lCNnkxendnQmMvTWgr?=
 =?utf-8?B?cDJTWDVhZFl5SE55YmVZcmxYcWIrcmw5RUVlTmNMdnd5c0xsajVnL1lKaVZB?=
 =?utf-8?B?eWpETTdzNUcyQlhHODBzdzBNOVlQcWdjRndyN0x1NmM3bGQ0bVdNUUhNYVFB?=
 =?utf-8?B?UFhuVUZjUVpLQnVZTGZIQ2ROV0tpT0FuMDlKeGZsTnYyMS9hMGo3R0NRPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DB7PR04MB4842.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(1800799015)(366007); DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VCtRVlhCaHFsTVBrTElMTUF3NE1RTDFDYUNhYkZtZzhoL0NZdHVjT3Y4ckJv?=
 =?utf-8?B?Z2xtdnEzdFA4M1lqWEc2QVRhWVJwZC85b1FFY082QUN4NFoyd3JWS1dVK29U?=
 =?utf-8?B?UnE0dSthb3krRTQ0UDQ1eDU0aXZoV3ROVzYzWEk4ZlNqSmU1eGN3dTVUbUIz?=
 =?utf-8?B?am51QUpqYjNnS1R6eDR5QVMxOGFXNUw0alBmdGN5NXpHRm1BVGcwNDhPd1Rw?=
 =?utf-8?B?czEwT0ZjUW1wNFQ2TlVWSjdHU3gxWW5ENTkwbHN3ZTdCcTFZaForMWdiNFNy?=
 =?utf-8?B?V3RaazV5TXRwMmJRQ0xZL2xUM2ZYenliN1BrbjRPUWJPUFFqVUxFRGNUZVNz?=
 =?utf-8?B?SDJxbDNBRWdsZVBITFhLb3FPZUJQNFUxR3hZMmoxazEzVzhsZTBvQTZ1VGNS?=
 =?utf-8?B?OEdaOE5VWlBCMTRPcDdrakt2SmVrWVpqUVFhcFBSYUljSXFPdFVaR0V2RVJ6?=
 =?utf-8?B?QWJEa0MvWGxSWTZlRnpIayt0S0xnTTZKR1NJbWtVNnBsWG9SQ3JvQmVsSWll?=
 =?utf-8?B?YTlxaUJjR3RBeWNkR3lMajhPRVY4ODNVbnhMOU5KRHlRTCs2UitxQ1VPckJX?=
 =?utf-8?B?UFJYSHorb1R5M3libUh0QmMzVGxUL09NY2pOdDR5UE03M084aCszeDdpNmRT?=
 =?utf-8?B?TVpPUG8rVlUwalkyMzJHQytLQ0FkTGRqNG8wYkFwSTFRNSt3MDI0YmEzU291?=
 =?utf-8?B?TWRxb0ZpOXpWTmk5ZlVWTjQ3SG0xNEx3bmg0ckdycGozK3JabzJ6SjgvSnBO?=
 =?utf-8?B?MTVOUElPSTcrWXMraXgrMkVtR25WSWRQMTI5TWR2cTBVM05vNVVFUndhODRK?=
 =?utf-8?B?T1ovQ1oxNmJady9MVVNVbUt1K0grWlpTaHNwbERKaWJuNENGckl0Z0RHVXpw?=
 =?utf-8?B?djB4T25uNTVhZmx6S3RRbnlaYy8wekh6WGRPenh0YS9qQWozRW43Mi9Iekth?=
 =?utf-8?B?cmI5Y0FYSWVhM2MzQlhwMmk3TnE1WlRpcHNDdklaWWlLTTZYSDRVaFdxV0hy?=
 =?utf-8?B?ZGhOM0ZsK0p1b3BFL2JsTitleHBTYk1LdExZQW9BbENSOExHbEpnOEV5VjhT?=
 =?utf-8?B?Z3U1aG9LZlJ5RWtJWFFLdEZ6alFLeHM3WWxjRVlWM1VjdVFWd3JXOEZ4MWUw?=
 =?utf-8?B?UGtsa0RlZEx3TitieWVTRDB1b1MrcjJMbzlya24va1llOFBYNHBMVHJocWNM?=
 =?utf-8?B?blUrME5sV0wwMDIwZEx1RVpvdWowS25TMDZLZit2b2c5VE9jYnNiY3ZjSE9S?=
 =?utf-8?B?TXlCREtJWUovQlMvRmtWd3M2SWh5UXNmYlVlZlVKOTZSUWFXZWxjYi9Ebmda?=
 =?utf-8?B?elM4VnRJdEMwQkF3OHpxMW9WREpNczBpTHZZaUxhdjdZL3VWVXJ3eGxqN1JH?=
 =?utf-8?B?eFpYK1RBSXpVWFh5djEwSnpvSDJUbVNjMU1BZGFRMVR5dXFwdTlvbFhsREpB?=
 =?utf-8?B?VXFrQlBnNjVMRm1IR29FcmpCcFdlSHJ5dGJrcnJqZXNUdWlvTVR2Uk1Kd1I3?=
 =?utf-8?B?Yyt6aFlYdy9UcWdVQ3JxU3hoUWpDdFJMcFBwRk0vVldwaWJDdjF4cjJHb1dH?=
 =?utf-8?B?RUVmZUpMemEranpqaTFRbFp2a3dYU1g4bmFzU0IwTEpscGNaL3dFdm45bkRo?=
 =?utf-8?B?c2llWUtQMHdieDdld2FudUU1ZXJvTTJVd1cvSG4wUDZzTWV4WnZJUjZmdHhP?=
 =?utf-8?B?bGN2aWkrSnJoV21YdUMwWUJnY3pHRTVralRXWis2eW5YNTBtUytUeGU4dXNZ?=
 =?utf-8?B?WkhPWEJ2bHNXWEU2b2R4MkRpaHp2YmJUSisyVWlLWDNLa2xiOERGeVhCbzNr?=
 =?utf-8?B?THM4eGZ4Szlsb0tWN2JMSDFRZEJ1SGRpN2dtVzRiVGJxbVA1bXB1R2lXVWJQ?=
 =?utf-8?B?akJvZlVMUFNLcC9HeGtRUlRncjVlNVR3dkU2MW02Wjg3TnVTS01GSndGbzEy?=
 =?utf-8?B?RFBBWGRKQTVBMmF5b2JBdWVDOVZSWERmVFl5cDZ0NXZnNnRudEJwdXBhcnVM?=
 =?utf-8?B?VCtvNDdsVm1QRW5xMytKWEh2VGVPb3lreXQydmVVRVFIUWVlWDhDN0RKMTRP?=
 =?utf-8?B?MUtDVGZkb3JmVFJxUk5OUlpjbmJkdzNvRWthcWxKdlEwdG4vUWF1OXFVZ0VU?=
 =?utf-8?B?RDc0VTVENmtucGtvUHR2YlJzNnY3L0xRRWRtcjZVVWMxcjFGdDRvRzBiUnNl?=
 =?utf-8?B?cnc9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 77eac953-ff15-48ff-c987-08dc6b6a77b5
X-MS-Exchange-CrossTenant-AuthSource: DB7PR04MB4842.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 May 2024 12:13:40.0432 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JVixKWnqChLmwhX4C6jYix7emsLPkI4EMxNlDZNVM3etQ6gsbMgzdfVWM617GBXOsXNC9kCybPOwu9AFDIsaoySUXIGwG1DP0vBqye4qgTI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA2PR04MB10123
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
> The clock is in Hz while the value checked against is in kHz, so
> actual frequencies will never be able to be below to max value.
> Fix this by specifying the max-value in Hz too.
> 
> Fixes: 5a028e8f062f ("drm/rockchip: vop2: Add support for rk3588")
> Signed-off-by: Heiko Stuebner <heiko.stuebner@cherry.de>
> ---
>   drivers/gpu/drm/rockchip/rockchip_drm_vop2.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
> index 9bee1fd88e6a2..523880a4e8e74 100644
> --- a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
> +++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
> @@ -1719,7 +1719,7 @@ static unsigned long rk3588_calc_cru_cfg(struct vop2_video_port *vp, int id,
>   		else
>   			dclk_out_rate = v_pixclk >> 2;
>   
> -		dclk_rate = rk3588_calc_dclk(dclk_out_rate, 600000);
> +		dclk_rate = rk3588_calc_dclk(dclk_out_rate, 600000000);
>   		if (!dclk_rate) {
>   			drm_err(vop2->drm, "DP dclk_out_rate out of range, dclk_out_rate: %ld KHZ\n",

It seems the error message is incorrect as well and should be saying Hz 
instead of KHz. (note also the lowercase z).

>   				dclk_out_rate);
> @@ -1736,7 +1736,7 @@ static unsigned long rk3588_calc_cru_cfg(struct vop2_video_port *vp, int id,
>   		 * dclk_rate = N * dclk_core_rate N = (1,2,4 ),
>   		 * we get a little factor here
>   		 */
> -		dclk_rate = rk3588_calc_dclk(dclk_out_rate, 600000);
> +		dclk_rate = rk3588_calc_dclk(dclk_out_rate, 600000000);
>   		if (!dclk_rate) {
>   			drm_err(vop2->drm, "MIPI dclk out of range, dclk_out_rate: %ld KHZ\n",

Ditto.

Otherwise,

Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>

Thanks!
Quentin
