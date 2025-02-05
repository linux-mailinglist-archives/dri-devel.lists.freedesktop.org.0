Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D34E6A281E4
	for <lists+dri-devel@lfdr.de>; Wed,  5 Feb 2025 03:38:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4957510E116;
	Wed,  5 Feb 2025 02:38:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="RfUJuE47";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from AS8PR04CU009.outbound.protection.outlook.com
 (mail-westeuropeazon11011047.outbound.protection.outlook.com [52.101.70.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C63810E116
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Feb 2025 02:38:17 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=f54MtzBtipeaPAgWKiBk/exVl5QUE2b8BwS58//I66+cV1tPU4gmpsbQqyXFKTwqEGe+Vu80e5CAeRmcMMxkW/rS9mCLz3SMS0vXzWpp6TJEo6/QxPbuZdyH81vSVnYDUpBJRSW92a65798FI2u1o9exR+1CTFPmHNfGQXDoiNg1hjBRjkL7ZcuFn5i98PAEuPxmH8n/hOUL2U8PQG0AWo5fSpOq3FaMzXnumkIIV1JzbKuMmmYm5Rx/zcrT3cajow8Ju6cUq/EWzwwa2nP/iPPCbGv+AUadWJu8wpElffnjNt4GSkDUX58P1FXb0EV0tLhm1rMgufQpN1Q0hWaVrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FtSEIRazToAxtnacPpuwJSHouuJv5xVka60Mc0D4wJ0=;
 b=YgsreU8vkxtt6/+kCXytlu8bMHKDQ9fg5bb3LJDlARZmvsk628+ObgUReSHHMf9bspctAMfdglyB5VC4WKz8gbFZhpU5y2H4gC+83z8jlGRvOKdGLfSQAh5/Opq4CCZWWVSvPn295RcDrmFIKkVc7+OfpP+6QX/rLQ6j2F23p+V9dYxX7vXkMsdHRwFZL9U+Hq7RMXQVZB3gIJdRyw223nk550ZvbRaJKMSWOSTzyKxt7pf7lzRCpHRL0216UKTxrd+xtynH+R2AQTngMI4O8gFuYOrZHh/MFw5VBve++RGBknP+/GtwC98d7OL/Upm/niU9vaNX8RhFjRqFKdT5Hg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FtSEIRazToAxtnacPpuwJSHouuJv5xVka60Mc0D4wJ0=;
 b=RfUJuE47JvydgGO+eBxnbckPlGQ3rP3OvS1JtJrMVBjQgeg6DDVzk6LVuKSeSrm4xt5Mml3v3LV7vu/bdwYSdsgC8wU6v10Slq9TX2l4XC+6FJNsgkQQ9YEBp6Iuix24XRCER9Euip1AlovjGQzBul8v8iL2FSqnPSnmnmPpAkdm8sJOMGSGfTSzNtu1FCl59DonUR0FeQtvVen2gYuvTgwb5NQnrR7NKKwUUuCDVIdFfH6YmPKsMYd5yhbJ5qLcSRKdHWF1Dt6iLW7HQAwt0Iq2nrZxjtJC/yWZKE6CbO/9FMEfZtdOlZLu27S73BYEUFCohtWaninGnHW8ssChHA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by DU4PR04MB10839.eurprd04.prod.outlook.com (2603:10a6:10:592::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.11; Wed, 5 Feb
 2025 02:38:14 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90%3]) with mapi id 15.20.8398.025; Wed, 5 Feb 2025
 02:38:14 +0000
Message-ID: <7a03ebbf-5ee3-45d3-a58c-8832bd0f8960@nxp.com>
Date: Wed, 5 Feb 2025 10:39:10 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 13/19] MAINTAINERS: Add maintainer for i.MX8qxp Display
 Controller
From: Liu Ying <victor.liu@nxp.com>
To: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org
Cc: p.zabel@pengutronix.de, airlied@gmail.com, simona@ffwll.ch,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
 festevam@gmail.com, tglx@linutronix.de, vkoul@kernel.org, kishon@kernel.org,
 aisheng.dong@nxp.com, agx@sigxcpu.org, u.kleine-koenig@baylibre.com,
 francesco@dolcini.it, frank.li@nxp.com, dmitry.baryshkov@linaro.org
References: <20241230021207.220144-1-victor.liu@nxp.com>
 <20241230021207.220144-14-victor.liu@nxp.com>
Content-Language: en-US
In-Reply-To: <20241230021207.220144-14-victor.liu@nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI2PR04CA0014.apcprd04.prod.outlook.com
 (2603:1096:4:197::18) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|DU4PR04MB10839:EE_
X-MS-Office365-Filtering-Correlation-Id: 0875cf5c-e9ad-4236-afd3-08dd458e2363
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|7416014|366016|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Um9YaisvRGhPM3hxMjlyV2xuemY5YWoxdXdjU0VXbkdTY3hZSTZwWGtQalBT?=
 =?utf-8?B?emZYdWFHM1FwZ1U3cUNjSDJKZnhtT3ZuUE53VWR0SjEvUFZSNnkyZ01oVjVS?=
 =?utf-8?B?MHVsMXMwVHkwL1VNc05QdlM0S0Z4REJDZWlYU3ZhbEpuMXVpLzVEbkdLQ092?=
 =?utf-8?B?ZVY2OFpGWXpEZml1UWdieHpQL2lZdnBRelZCcW51QjVPdmdHUkxxdGVLY1px?=
 =?utf-8?B?R08vSklZaGtMdGwrWVVySmhleXhTeG80SDhwcEd2MjFraWhVZFF0cTVuc21p?=
 =?utf-8?B?dldQSm45eS95NnZCNzVGcUZsR213NnZ3Y0JLN3M5aE54SmthUzJ0ZG1Kd0da?=
 =?utf-8?B?aGxsRCtGOUR5U1NkZFl1ckVrZ2VjMlk4Q29iM1piRzArNnFBeENhUEh1WUlz?=
 =?utf-8?B?TlRaRlVUdWhpQUpRNmo4VzdMODJqTWk1TStDdlJtQmRGNzlMck9IVVRQVG1K?=
 =?utf-8?B?ZEpmRzZtOER6K3BqWnFyUjZub3N6U2k1SU5aaEFCamZDQ0RzUExGUnFnY3Rh?=
 =?utf-8?B?MUVFbmVpQU9sU1lJWTJ2cVBvNDErQWk4MHlockJXZnpiQWVUL3Rubm01L091?=
 =?utf-8?B?SSs4eGpqcVdEblJKMG0vZ1B0cHNyM1JFQjNxUlZnekprWThPTW8yemIzWUdW?=
 =?utf-8?B?ZHBKcXZEai9wV2JXS2VxNVJGdDBNRVk2RTNCV1lGQlNBdGN5TFJrRXhKUHhC?=
 =?utf-8?B?YUZBVVFZbzM4TlpnNU5GQnlkZld5Sk4rTHJFR3R0dm4xbjRmK29TaUdkR2FP?=
 =?utf-8?B?eDc0elFPb05HN3VmOEFwUFJ6ak5vc0NvdjNwTUE2Y3FUSlJENUtYSUN5Y2lU?=
 =?utf-8?B?NFp2MjdSc09rd0hJMXFVdnhNQ1d6cjNFS2IzMENjTUVjd1N2UjVKNjVPNVJi?=
 =?utf-8?B?ajJrRHFFT1JXNnpMUitDSVJaa2d1ZFpsVkxoaHVDZXBrVldsZUhQUU1aN0tS?=
 =?utf-8?B?NFRQSklMdFpnR3U4c3EvTWdoa3kxWGJGb1krUXlxL0krWDJFM1pkWmtIMm94?=
 =?utf-8?B?RjdkT2F0NEs0QWhReTQyR0tEQVlzOVloQ3VBNDI4MDhmYnVwYitlMWJKSTVt?=
 =?utf-8?B?a0drSVlCYU1PYTN1MWhnanVvUzdyY0dTeWVnc0kwUFUxRkRSTGFxWk5vbU5W?=
 =?utf-8?B?bHFBVGZoVjdMZHBRejBSYURNd2hCNnE4bkdnazJZcjhiQ0M0a25WMS85b200?=
 =?utf-8?B?amhsM2N4ekh1T0NCVzgrb0p1TVgrL29RNWEvTTkxcnZWOVlJdkREanB4Z0tH?=
 =?utf-8?B?TWp2eU9wdFg5OFNLV1FnUG1SZXgzSGJMVEZDUzFxWjZ6TlhCdTkzMndVZVls?=
 =?utf-8?B?c1daZUhENmpKUTlvUjFpbm5VQTZjc1VmYkM1RFlNUEwzUmhNMlRKY2tzYjQz?=
 =?utf-8?B?WGRaT1U5bDI4K1hiUHc5ZDRkN1E0QWR1R1ZJaS9oL3ZvUXR2bW14TWJXVndT?=
 =?utf-8?B?QkllUGRCWWcvbFQ1VnYvNkdlcmMrL2kzQzNQTVdBVWNEMFA0dUNKaGpsc09V?=
 =?utf-8?B?S2lEc2xLUGFrSkU4ME0ydDBBY1NhZXVMSlhLdXIvZGFWb0JQdkR0ck5rUS81?=
 =?utf-8?B?bU5FV1c3ODlDc2tPaDVGa3dRa1crVHc1T1BPd0V0VnZpR3pacnVsTnR2aWZi?=
 =?utf-8?B?cDBmdjQ0VzNBVlBGUkVIS0FPU1VHa1Fod0UrNHlPSDlaY2NjdTdIRE04OUhS?=
 =?utf-8?B?UFlxRWMzMmljZ2FzeklFZHdFWng3TjIveGQ1RmlXY092S1ZJRDRTVjN1Z3FH?=
 =?utf-8?B?b2JNWVpUa1FHYk1YVFdFNUhuOFZtWkJsbCtSbGFQMHJkUHhIUXB4bzV6dnFZ?=
 =?utf-8?B?VFMwYlNvNWJrSGNHVXp1dz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(7416014)(366016)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Vm9rOE8vaW1jTXJXVFk3cS9iQTJCMENzUEpJbzBnazN2S3dzUy9GQTRxSXFS?=
 =?utf-8?B?NExlWWJDNE4vcytadGdDL1V4bUE3b1VVb001cUwwNTFLSWxUUnducEZFZ3Jy?=
 =?utf-8?B?a0U2eWF6eWtMc0puREk2b25kVVZGbDZMbHNHemRmbm54MXdHdHR0YlJPMUpw?=
 =?utf-8?B?Vk5TU2lJQi9tSFRJN2xSN0dqSzQwa0NmaE9xV0lhYkhzRW1LSmhXVjFoTEMw?=
 =?utf-8?B?VG9jSG5jTnQxM0dyU1NvUm5CMVM1OUM0SnZUdXpTa0dhWldndW1jME9kSitO?=
 =?utf-8?B?S043R1VEUjl3MC9UMHk3ZTEvM0dkckEwTEZ6cnFvMXorcXVhWGsxT3ZIanlw?=
 =?utf-8?B?dVl2Skt3dERlOEhjSVB3TWlCSWdSYUZONjRmaXo1Mm5vQkk2S3NDVmRmNDlP?=
 =?utf-8?B?RzJkVE1TVnlDaTI2VFNqTDkySWZRb1dETFFNRklncnJkenRlUXpaZ2o1WHVR?=
 =?utf-8?B?Z0ZtVU9xOW9kblhjMzc0MXh0aXg0SG5FcFFCanBDS09aRkdFa21MdGE2YWFR?=
 =?utf-8?B?cXpHcVdmbDlNemlidGY0aWdTNG5sUTNTRmxSelJnL1lsNEphSnlYaGRYc3Jo?=
 =?utf-8?B?MEpId0h6MmdTdGIwdllaaVYrek5EVVhFUnlSWXlNa1YrNlJhejlZT1RDbVhD?=
 =?utf-8?B?aGJmN2FjYy9zWjVITGZEcGFHTTVlZklDTVJvUmt0bUdXQk9VamZrdVJ0dUlv?=
 =?utf-8?B?bnJ4eTVRR1FFM3FBVEZ6T1dXRFVNVkgzM0tvZWhsN2IxaFFBMUVrdFk4ejNX?=
 =?utf-8?B?djBaakZSZW51RHlKU21UTnU1eHNweEVVRDBLR1gzbnExUFlmU0lkZWMvdkly?=
 =?utf-8?B?RWc1RFZZdnlIVjVhSG9GMUlvMm9WVjNCWmVhT2xMd2p2OTFqcnZPdHdVek9Y?=
 =?utf-8?B?VHBJakhjRjByTW9GcWtVek5wVUZFNUN6cnFJcWlvM3d6ejNjWDJ1TmdNb1JT?=
 =?utf-8?B?bjBRV3VXeW9QQ1oxOXNoRzMyQTIzc3Z1cUpTRnNZaFE3MW9Gak4rTjExMUFi?=
 =?utf-8?B?VENpUyt0amZlODlBWHQ2eEJXRmhFall6SGJvREVYVWlWdzNSMWZPR3RvcGl1?=
 =?utf-8?B?TTZSblgwWHBHaHhBRGMzTlJHM21mMFRNam1Lc3VELzNIem93elgrdURIdTA1?=
 =?utf-8?B?anlQWXU2bHJPUHhHYUpWSWRWMjYwVURnYzF3VHVxcnpwRlVCK2RJRG50aW01?=
 =?utf-8?B?T0dlakNYSm5Fdzd4TTlJYWREa0t4aFY3NVllSmtPVXVuYXdhVzJ6cXNQRWRB?=
 =?utf-8?B?R1c5cDV3WjJjbjBtcldLWDBlV3hpQmJ5b0tjMlBBWm15NGNadzR5QjkwYTJH?=
 =?utf-8?B?Nlpic1ViV1Y3R3lQSlVTSmhUOHIwTm5tZS9oZXBOVzc1NVlpaExWdEFsZjFD?=
 =?utf-8?B?SVdxd3FkNytESUJKeWdJNWRHK0dqUUVIRTVZcjJvdFVpSG9qbWh3alJ0aks0?=
 =?utf-8?B?aVRMWlljMytacEQrV2E2VzlOajFWbmlidEtGOFJQVjF1RmZGd0djVU8wektp?=
 =?utf-8?B?Y2dRbUMyV1lMckJZUDV2WVVHMUNkNGtWL3pGMjBSS0pVUnJJU3ZvODdsU2ZF?=
 =?utf-8?B?cWpURThZdW9EOUdsdW4rdFZIWGZRMGFZdVFsemp6OXVIdS9BN1UrSFdsb0RV?=
 =?utf-8?B?bm9hbEFjRGQzbEdhVG5QWTZGNHdBc1BDUFQ1VGZraXdDYWlFUThQZGo3K2t4?=
 =?utf-8?B?cUgwWWlkSUlQbWt2S3ZvSTVadjIyU3dKcUJkaDdpd1M1TWFCUlAva29vblpF?=
 =?utf-8?B?NTRmYkVBTjRJcGJvOUdTUkpXT0xvQW9ZRWtqZUwwbUJHbHp4QWZEa1RYdnlv?=
 =?utf-8?B?amNHMU54TGdMalcrMUFob3hac3BHY0dBZmF1S0huZVh0L0J1RndOMFl4V0Er?=
 =?utf-8?B?dmxCNllMYkErTHZUazBtVHQ1VnlGK05MZVFFZnhlQ3pxVkI3UHJWaTFUZGJ2?=
 =?utf-8?B?SG9XNlUrekxhWE5mcFVWRnN5N3lDaFVrRkg0Wk5mTXNtdEMvek1yT1ZubFYw?=
 =?utf-8?B?ZUxZb0hCWW1jeThuaCs4TENZNEdTaGV4bjJZQUpDekNJMFpjQ2JQZ2pQR2Rh?=
 =?utf-8?B?UysycmtxU25IeC84WXZkUWJvRDhWQkhLQmxURzJiU0V2ZlVqbTMrVEE3Q3Mv?=
 =?utf-8?Q?WTyvvVOrAZTLHdGHWogtPd+6p?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0875cf5c-e9ad-4236-afd3-08dd458e2363
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Feb 2025 02:38:14.2104 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EQaRhwturiw0jv/bPohTrYH355x1rqRmvhzyPabJLLAsLPdPCqj0RV8CfsrBLTpAEhUniPjLnnyQPmgwszfJpQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR04MB10839
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

Hi Dmitry, Maxime,

On 12/30/2024, Liu Ying wrote:
> Add myself as the maintainer of i.MX8qxp Display Controller.
> 
> Signed-off-by: Liu Ying <victor.liu@nxp.com>
> ---
> v8:
> * No change.
> 
> v7:
> * No change.
> 
> v6:
> * No change.
> 
> v5:
> * No change.
> 
> v4:
> * No change.
> 
> v3:
> * No change.
> 
> v2:
> * Improve file list. (Frank)
> 
>  MAINTAINERS | 8 ++++++++
>  1 file changed, 8 insertions(+)

Can you please review this patch?
Also, all the imx8-dc DRM driver patches(patch 9-12) are reviewed by you and
all the dt-binding patches(patch 1-8) are reviewed by Rob, so can you please
help pick up patch 1-13 after you review this one?

> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index d2ab799a0659..0459878925df 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -7735,6 +7735,14 @@ F:	Documentation/devicetree/bindings/display/imx/
>  F:	drivers/gpu/drm/imx/ipuv3/
>  F:	drivers/gpu/ipu-v3/
>  
> +DRM DRIVERS FOR FREESCALE IMX8 DISPLAY CONTROLLER
> +M:	Liu Ying <victor.liu@nxp.com>
> +L:	dri-devel@lists.freedesktop.org
> +S:	Maintained
> +T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
> +F:	Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc*.yaml
> +F:	drivers/gpu/drm/imx/dc/
> +
>  DRM DRIVERS FOR FREESCALE IMX BRIDGE
>  M:	Liu Ying <victor.liu@nxp.com>
>  L:	dri-devel@lists.freedesktop.org

-- 
Regards,
Liu Ying
