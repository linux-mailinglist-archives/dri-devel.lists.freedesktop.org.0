Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FA399A3949
	for <lists+dri-devel@lfdr.de>; Fri, 18 Oct 2024 11:00:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F04CB10E8C8;
	Fri, 18 Oct 2024 09:00:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="E7mcJCjN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2057.outbound.protection.outlook.com [40.107.22.57])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E4BD10E8C8
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Oct 2024 09:00:17 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oyJal6KAtBivozqhdRyZE/keQtSrQUF+gHPcy4dSspfdY66RyaXv6i9m9+04gs5FoagsjVgSwAAczUL0f9PUf8mCL0vYtV/mKkKWea/IVCQULj/oyzaBw6Yj4MI8ZBAR7D6OueVq7wbZHio4G4ufkXoA4388NR4XOPB8k0QVRiwgk/M+nef1jAPlisdXD9m3WbEOBDwWv1fEAGFIiwATJzwYplUw6IQcamje7u7BMZ40Qj73AX+nuj/4WIfWB+WDfX4L3lHhvRGwF9GxNLOKbAjrqjUZx4N3SoZvGX1IVmus/TRHBHSz+VvPPkjspLDsdbPgtR+iAKBXZ9mtWaP0iQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=45bDRMmVQR9F7XY2NPY2urpzvzS64Lw5WiW43xQ9QGk=;
 b=xdda7jXmurVivwJcvV+EO4hFvttMVG8UKZ+T+6SmhZEbEdUdFpSeMv+yp6wYrR7WMOm+nzHBwxpWISTT/QY0A558Kdnf+rkX5e9U06X+u3j24lfRWYuRC1dFbsEjyO/KLL30va6+SfzqP/Zpq3c1oyTPHbLS/WFfZqcuNewuO3l21qMKgl2DuiWO3AYyG6IytuoxPAU/C5PMaaOOMhzTNCdeSPCYyBUhzMeKAhgTMwqk0AYojMnsBZEk43IavHx4F+hAa0lTmlHPpvfhfcsExjt8cCWWVbfgzF43hUS6KVX9ZMYTWqji0iofBz8TFcdC/R1CuqcJhkbxafJ4I6Xi7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=45bDRMmVQR9F7XY2NPY2urpzvzS64Lw5WiW43xQ9QGk=;
 b=E7mcJCjN856En4BGVR/Vokc92sAnXGPlwce4aVuT2KVkKvxPYgoHa3UtMmMP8/f9os3KCP6aWbrM3nJnX1xfRNU5/NchLhuBYVnkQsEmqS/BMgPLUHTCTn8jzPtXKeJCWJ1DuhY5iSDMaKZVn10VmSVMG8xZrBRZPI4yLfYxgxBQa/MMSKgDASG7rZ5ySCAPlZDyO+1j8Sg/lPlG4ob/IScyC1c01oKAO6geImAIfZSQGS/qEgmlqayzs2LBC9ptX2P5XMZqhp0Tw76DkDkmmlYGAEHX+gDLWhO+6HFDJDtz/SWVxZvWtIRwV6oB7eZCJLLunTgMwee+mfc1buL70Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by DU4PR04MB10402.eurprd04.prod.outlook.com (2603:10a6:10:55b::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.24; Fri, 18 Oct
 2024 09:00:14 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90%4]) with mapi id 15.20.8069.020; Fri, 18 Oct 2024
 09:00:14 +0000
Message-ID: <4d1c434e-e7bd-4e53-b110-1f26eb06c59c@nxp.com>
Date: Fri, 18 Oct 2024 17:00:40 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/5] arm64: dts: imx8mp-msc-sm2s-ep1: Add HDMI connector
To: Marek Vasut <marex@denx.de>, devicetree@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
 festevam@gmail.com, andrzej.hajda@intel.com, neil.armstrong@linaro.org,
 rfoss@kernel.org, Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
 stefan@agner.ch, dmitry.baryshkov@linaro.org
References: <20241018064813.2750016-1-victor.liu@nxp.com>
 <20241018064813.2750016-4-victor.liu@nxp.com>
 <69cc9c59-99c0-479d-8143-63698cc56111@denx.de>
From: Liu Ying <victor.liu@nxp.com>
Content-Language: en-US
In-Reply-To: <69cc9c59-99c0-479d-8143-63698cc56111@denx.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SG2PR06CA0209.apcprd06.prod.outlook.com
 (2603:1096:4:68::17) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|DU4PR04MB10402:EE_
X-MS-Office365-Filtering-Correlation-Id: 57d81954-173b-470f-cf3f-08dcef5347cb
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|7416014|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UnJpdmEydmZDY0V1V0c4Ny9MUlVLK1ZJeUFYNDBBZ2thbmVWelJTSW1Bc0Jo?=
 =?utf-8?B?azJuMDdwOEd1RGVzN2JQeFdEdnkzNUYyNm5mb0I1azljVzNBcVU5RWZCNElO?=
 =?utf-8?B?UkFUTFFBNk1MZjlLbTk3RkMyV21HaE45RHdwTXFMVDA3cG1lMjhjU1NiblI0?=
 =?utf-8?B?OWpkZ1pvY0JJOHRaaWJQTGdmZmVUQWl0UDRCQXZyOU9HTUNwVGRxWkw0N2Rz?=
 =?utf-8?B?VkgzcllhejVMN04yblJZL2hlUDViNlBZcE00SGpVS1liREcvWlFINHgydTVi?=
 =?utf-8?B?ZnZRY0dVdWFsRGN2NnllcXY5REp6Y3NiSFlhNEIydzVOQ1VQSUxJTVo0TllU?=
 =?utf-8?B?T1NNdm5tSnNTeFZVYi8wSXd2aURNYVJRNXpsR3FmS2h6RG1RU0hVSHlZdkVk?=
 =?utf-8?B?Nk40Wk9NTFBCMUMvRUdHaUlRTUdZSnJPMmdtNWtRam82a2VTWncwaEpwMmNG?=
 =?utf-8?B?OGRzRncwdjNUeGVJUnlnR1M3VlhQMU1GT3VYelRmLy9rdzJiMTdYM3V0Z1hB?=
 =?utf-8?B?ajduN2RkQW8yemM3ZjNBQzRWNmFVNm84N1BTc0ZENHdIbERIWWIvV2w2VGEz?=
 =?utf-8?B?REU4aWNMcUpmOStTT1B2ZUtOMUJyNFVZOGlXQ0FITFI4WFdTWk9nMHNVOFcz?=
 =?utf-8?B?N2ZUUU9hLy9FN3BVdVVjNFI4QmIxK05adGVReDJKTG5ENlFheXljRFQzZzM1?=
 =?utf-8?B?bW93ZThoNDMzZFVKb1pqWnFPa0ZiTVY1L2VLU1lmdW1BeEJ4eldVYnRpdUVM?=
 =?utf-8?B?Sm9Vbkp0UXZqcVZJeUVSbkgrMk5tSElYSVl1OHBMbmtYaWpoY1Y5bnhqR3FM?=
 =?utf-8?B?QUxZbTdFOExVbWZyU0xzUmxqWVhIN0RpY3dWUml2QWdVTG5BbytzSEFLYVdJ?=
 =?utf-8?B?c2Zla0JKM3RPMDQ3bjkxeEdLNkN6VHFtK2RwN01tV2FTNXh2NGk3S082Z2hq?=
 =?utf-8?B?ZnRmY3V3TWFLSVA0U3JvS0xJZU1lWWhvWUxlbEd3QWRiQ3BMREVKeElNdnUw?=
 =?utf-8?B?YlViRVZ5TzF4Sk1WQkVFaW0vZWU0bFNGbHE2YnQxNGpna2U4YWEwWFNpVTNn?=
 =?utf-8?B?aWU1MnNFbExrY2N0Sjl0QlAyemJhNkJwQyt3eTJvQWZBSTZscmpGbXQ4QmNZ?=
 =?utf-8?B?N0o4VTlMdXZJUFhJbDRSRUNsQmUxY1dTcDVFOGYzQTM2a1FnMHlYdDhoWlhX?=
 =?utf-8?B?MVpEa3ZQYkp1YlFIMlIya0J3V1FQVisvRlVVK0RjUktXK3dmWVIxV2ZsSjJC?=
 =?utf-8?B?bkZZNTYwcjU2OUhNVFdDc3hqSzhrcm5xdGVVTHBOdkZDRkNya3pQSFViRW1R?=
 =?utf-8?B?bklSUE1qRHFFWTc0Y0c4aE9XOWJKUERKMjBHZEJ1bTBqQTNDRWRjTWlicUc1?=
 =?utf-8?B?UjVKaU9uSTZDT3FSNUh5VUphUGt5TTlpUHZoeHgvcHhLd2srdWJYaHptMlBD?=
 =?utf-8?B?MmQvQUdNL0tWTms0bEFBWDdVS3RldktXSWEyZ21qZlo3OWlsS3V4RDQ1M2FQ?=
 =?utf-8?B?ZWh2ZFZSek1GK0MyOXEzbWFmTXNadkFmT0RQNThydVpLU1hzTFRRQ0NvNFZL?=
 =?utf-8?B?TjRLeExhT2hrbjlCTHJnYkFuRktEZG8ySDRLUFZuSEFZemRZMUNxVmpiUG9n?=
 =?utf-8?B?VkdZUzdRMk9qSXl6M0tGS0k3T20rejM4ekJKS1BiemlucGJNc3ptZkNFU1VQ?=
 =?utf-8?B?cDBGRzR6bXFWMHBwaFo5ZFFvWVM5U09XM0hFYjhTOUZjbG1YaDhDVGhnTW1x?=
 =?utf-8?Q?XhJe5I3/ilTvHAKNtZZ5N1dntohvbAnZ7P9i77w?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(7416014)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SmpIaytBbGV4WkJ6R1RnR1F5MVFaQi9aQ2RSSlhVczFVNk5tWVJBdnNFbTdm?=
 =?utf-8?B?WVBOZHZzc255ZDM4aWdFQ3g2Vk9jTmFnMk00d3JHeGxSNTJGdVN2cUpiT3Y0?=
 =?utf-8?B?TGQ1aGRPeSsxTWM2MFFPV2JvNlc0RXN5QmFmMDMwTlRWazRqaWNyQkw2Mkh1?=
 =?utf-8?B?S200Q2VYMHA2YkRyaGpRWUxtMlB1K2NmdGt0NzV3ZU1sUlFmdG8xN2RrSDNW?=
 =?utf-8?B?ZC9NZzRvcmVPdHNGSEVKV3lvN0tPYXlYVlZ3OWlpamJsWU10NjJPUDZSb0pu?=
 =?utf-8?B?YU5qWEI0bDZUQVdxck5qT21wM2pSNVZjb0d5MEdudEltRXhETlBwRjVoWE4z?=
 =?utf-8?B?NUhWM3d1eC9ZaDJFTEpKTHdWb3dKVmFmTTZJUXlYYTdYRlNZSm9kYVZWSzJy?=
 =?utf-8?B?OGM3YVNXMXlGSUNoRFFhTUpYUHhKbTZtb1crRm5DcGxiRTRST0lLZ3I1WEhS?=
 =?utf-8?B?VXdHc050VWdBc0hvV3hCall0SXR6ODVtdEYvdmQvVFBjbk1YeS8xUk96Q2Zt?=
 =?utf-8?B?M0dESGFUOWpiSnBTcVlaK3h5WUtQbWNwbGxISVdqREdPOUJTWjhTcU40T2JH?=
 =?utf-8?B?cWM2UHlUOEdxc1N6WXc2emxkOEUwemFpdEFRSVByNThKck9rVEJpUElpUUhP?=
 =?utf-8?B?WUV6OHd0ajlTN2tDcko4bzYwUzJDbzRZR2g0OUwyc2ZWdGZWZDN0WnUybklS?=
 =?utf-8?B?NVU0dG5DU212Q0NrUHhuQ3gyeHVyYmErdWtsQlBIWUVmbjhGVVZqM0M4UTlG?=
 =?utf-8?B?TnZoc3V5QXg4TzZtNm53TVl6cncwMG1rN2xSQzR0eHgydEZWT1o3bnNycHpW?=
 =?utf-8?B?dzI4YStPdVF0MEF4c1BtcWkwblduaWcxOGhvOGUyRjJmS3RGSi9za2p1MFFQ?=
 =?utf-8?B?cFZDNFpad3l4YS9DZkNkYmRrbWhldyt2Mkp2MjFhcUFsK2JwYm9oQnFHYVdU?=
 =?utf-8?B?Z3l2RmNUOVIra0NObmJId3FuVXpkSTZFdEM2OWRoU29aaUhKWFJqalQxQURl?=
 =?utf-8?B?VHhQSkdTVWpRRHZRTnR6c3lCbm1TZDZPNXJMenQ0NzdZYitGYVIwZmtqelNq?=
 =?utf-8?B?VVphbWRsSGcvRm85T3NxTVIwTlh6dXR0bm9zb3lCM245U0VsbGRBanp5aUJI?=
 =?utf-8?B?NUlaTGtjeWRjV3JPU21sOXhuemVaam8xQnFpS25aNEtzd1VsMUlXSVlPY1do?=
 =?utf-8?B?dVIrNGNNczh2QXQ0Yjh2NGNLL1dPUkszVDB3alZMTVJqcUk5aVVDbDhLU2Vw?=
 =?utf-8?B?RVpybGFZS2o2UDFpdldNdlZIT1o2UkZLcnFvajlqb2N6RHpQT2ZvTTl4eEFh?=
 =?utf-8?B?MTB4Z3czck1OSTdrL3pKR2Q0d21xa3NQbjRocjdPNlFTaFNiTjlBT2VYN09n?=
 =?utf-8?B?OE9VZXl4dlRNMlV3bEtxdXN4NS9xWE81RVovVzd2TVJKSWdVUE1tMGtld3lq?=
 =?utf-8?B?Rzh3c3BZeHRteVI3UzRUR1Z6eXJPdXQxZllBeEkxVHlKK0gxUFdiRDQwVG5k?=
 =?utf-8?B?RXgzWW96eUtheUZ1MVFFN2hvUVFDUlkrYWJ2Y1A0cHF1ZkdEUlpFOEFqK3JU?=
 =?utf-8?B?M0ZRR1VPVmRIblFpNG1HQmVwbkl5WXNYQXBqN2ZzUHZJVGdpN1Z1cGZvQzFT?=
 =?utf-8?B?Vm9xSi9NM3p4M09ZL1V1WEhLQkh2T0wxMVBZcDdiSDJvWjJ1RnVSK0p6MHRH?=
 =?utf-8?B?SzB5YXFHN3U0MzVpMnhjaWRHTytkckVDSUtFdjByQ2pLQUJhK0FyYTN3MDRq?=
 =?utf-8?B?WXMxK1BjMURqdUo3UDFGZkZjRGMvRFJyWVVSWEdBQlZRZjVESlJ4UThDRTdM?=
 =?utf-8?B?aXFEV1NYenFPSFUvZHlCSlVXSU03aVFyQm9nU3Y3VGpTQmI2emYwQndTYUs4?=
 =?utf-8?B?djhOMkdVVVNZZE9oK2sraGtXcGhWbFltaHNSUnM2dzJsT1hzamx0dXRNdWZa?=
 =?utf-8?B?TWNVRWk1eURGcU9YaFkxVHBCcks5MlZkTTBvM2EwOEVCYWd6Rjc3ZW1hRU1R?=
 =?utf-8?B?SS9JVDl0Rk1TY3Y2azBidkhkMGp0OVR2M1dLa3R6S0ROV3BJU3lpVy9xQWFw?=
 =?utf-8?B?OEh4WnVGOW9MOVF3dVd5bnp6T3hvV2Vod3duSElKUGhzd0Vuc2IvNHM5SjlH?=
 =?utf-8?Q?09iTI5CU+lMy0ZMKepFF3cnb3?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 57d81954-173b-470f-cf3f-08dcef5347cb
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Oct 2024 09:00:14.7009 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: r+RjgMsYZ6p+/fkPtC75ghUHDNgkw2T8kEwvzc419An14e5LoQOuaEZDjsUwMx9hZDtUUXiLWBS3pKnqBlv3bA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR04MB10402
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

On 10/18/2024, Marek Vasut wrote:
> On 10/18/24 8:48 AM, Liu Ying wrote:
>> Add a HDMI connector to connect with i.MX8MP HDMI TX output.
>> This is a preparation for making the i.MX8MP LCDIF driver use
>> drm_bridge_connector which requires the DRM_BRIDGE_ATTACH_NO_CONNECTOR
>> flag.  With that flag, the DW HDMI bridge core driver would
>> try to attach the next bridge which is the HDMI connector.
>>
>> Signed-off-by: Liu Ying <victor.liu@nxp.com>
>> ---
>>   .../dts/freescale/imx8mp-msc-sm2s-ep1.dts     | 19 +++++++++++++++++++
>>   1 file changed, 19 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/freescale/imx8mp-msc-sm2s-ep1.dts b/arch/arm64/boot/dts/freescale/imx8mp-msc-sm2s-ep1.dts
>> index 83194ea7cb81..b776646a258a 100644
>> --- a/arch/arm64/boot/dts/freescale/imx8mp-msc-sm2s-ep1.dts
>> +++ b/arch/arm64/boot/dts/freescale/imx8mp-msc-sm2s-ep1.dts
>> @@ -15,6 +15,17 @@ / {
>>                "avnet,sm2s-imx8mp-14N0600E", "avnet,sm2s-imx8mp",
>>                "fsl,imx8mp";
>>   +    hdmi-connector {
>> +        compatible = "hdmi-connector";
>> +        type = "a";
> Shouldn't this also have a 'label' property ?

'label' property is not required by hdmi-connector.yaml and there
are in-tree hdmi-connector nodes that haven't got it.
I tried to find schematics for the board online, but failed.
I don't have the board to see the label printed in silk layer, either.

If anyone can provide a valid label name, I may add it.

-- 
Regards,
Liu Ying

