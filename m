Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D2411B82B6C
	for <lists+dri-devel@lfdr.de>; Thu, 18 Sep 2025 05:13:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 495C010E631;
	Thu, 18 Sep 2025 03:13:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="dseX8ofM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from OSPPR02CU001.outbound.protection.outlook.com
 (mail-norwayeastazon11013055.outbound.protection.outlook.com [40.107.159.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE56710E631
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Sep 2025 03:13:23 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WytCnv5GNrvXmxwS9Ppq9GguIeRYrcefy+UcAz0MVRSz/Czk/T4/TGANQVBcjtrpycQDiDwpYkzf5bjM/VjjmLs+YL2grwRZoLSWiOGXZ4ciVfIFw/8oiOe5BjGOTKCqQsfO9yQJl+jJrWxZ2eEmTf49vAVc1+gw6gwlCbx4cA1/oQtrTdM3HlgJY6PdxV3Z78Vb2JvGx4Q99mW1ujdWKtNALr/KIwYdWSSOlqdcZgB95xGdU1mUwMDN81oXqikAUc/QKMk4qZ90VsnaR429sDL3H+PjF9SyiUYXZJME77KzPoSqHpEMnMl1Q6HIIR8DQBS44sxBpZAtWQdF8fMBuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Lcym28d3X7uz2r0z8BvLbajFlgnUFTILKz2nlR03xrw=;
 b=MT6RuV9jIFOMaCxqMOmzgtDf5dICIm2dkFjW1Z2Ia7kw11zR8IgOdd+M7t5Qfc8fnwgEMsNDqCJm73R1NbIcnRDaAkj+86WCWXiluFNXFDTIWEIkr2j3IoO/lvLS9Ptld6vQ2BiLaVjnFqPLcL4DMvqWwJkwokK36hOqRCdt5pDQJrGPB5FZCUVOk0fPp3cFo7YdbVKsxnAHab8nkYWHP9jAi7r1ivV2rVuDz6AMUW7P40CQZAxR4N7Ec5r+sT2Es3S+PoYl/v8NaN4YoDtrm9Y7gLvQygAd2baWkO+QZH8ZtecJZVnLhvDiyVYTfW0FixAKyhE92jMlIF+29ocNgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com; 
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Lcym28d3X7uz2r0z8BvLbajFlgnUFTILKz2nlR03xrw=;
 b=dseX8ofMfr77B38gt7X+mIeFkfckZc9PgPEDDQ3LpWH4PtDcSblYP0P7uejcog07hlKtuSuBxhTAWpSoPl5xGVHYyelDICSilURVWANj3f10NezB5IEmyfvjOtzLxtETd0I2LXQsh37+f7FXT7oe667Ke2RphfUhyCK0GOGICV0x9Bmpl34QF0YRSENXFoHs3BVINrv8DtrE/fo22P3p0dP6aYZ3SAlB3Aqe5a5voGmGqePZ0sWCY1oD3di/NSkrHd//D5ByjE3FRUmY2SN8ZrjUUmpLjtExult5FEmELkrQdFEs/ZpsEZmG/j3/oThWl4PuF6ENDOnOE9rb9bZvAw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DB8PR04MB7051.eurprd04.prod.outlook.com (2603:10a6:10:fd::20)
 by PAWPR04MB11549.eurprd04.prod.outlook.com (2603:10a6:102:512::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.13; Thu, 18 Sep
 2025 03:13:20 +0000
Received: from DB8PR04MB7051.eurprd04.prod.outlook.com
 ([fe80::8f9d:4273:ea83:167a]) by DB8PR04MB7051.eurprd04.prod.outlook.com
 ([fe80::8f9d:4273:ea83:167a%6]) with mapi id 15.20.9137.012; Thu, 18 Sep 2025
 03:13:20 +0000
Message-ID: <8f59cde5-78eb-4731-b47f-b22877256f67@oss.nxp.com>
Date: Thu, 18 Sep 2025 11:14:54 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 03/39] drm/atomic: Document __drm_connectors_state
 state pointer
To: Maxime Ripard <mripard@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, Luca Ceresoli
 <luca.ceresoli@bootlin.com>, =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?=
 <ville.syrjala@linux.intel.com>
References: <20250917-drm-no-more-existing-state-v4-0-5d4b9889c3c8@kernel.org>
 <20250917-drm-no-more-existing-state-v4-3-5d4b9889c3c8@kernel.org>
From: Liu Ying <victor.liu@oss.nxp.com>
Content-Language: en-US
In-Reply-To: <20250917-drm-no-more-existing-state-v4-3-5d4b9889c3c8@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SI2PR02CA0019.apcprd02.prod.outlook.com
 (2603:1096:4:195::13) To DB8PR04MB7051.eurprd04.prod.outlook.com
 (2603:10a6:10:fd::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB8PR04MB7051:EE_|PAWPR04MB11549:EE_
X-MS-Office365-Filtering-Correlation-Id: 42bbf239-ac5c-4891-ad75-08ddf6615212
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|19092799006|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Z0JBSmxlK2ZkbVR4aVNYS0orQTV0WUU4Y1ZRTElyQ1R3RmIzeUxIQW45Vkgr?=
 =?utf-8?B?aEhSRktIU3ZGV0VKamF1NVRUZDZQNlNyQjE4aXh2cWtNZXNoWmt1aENGdm9R?=
 =?utf-8?B?cTdmajlzK0xYeU5aQTM3czZiTnRaNFpBazkyZGNDTVFxS29oSHJQWi94Mm0x?=
 =?utf-8?B?NVRaMUE1eXc4R3hsbEdRaE9MdXBXSnVTeks0RlhyRkRmcVdzdkNTQVRWMHh2?=
 =?utf-8?B?UU5UWWF5TmNac3M4L1B3UHQwQVU4bHlPcGJ6YUIwZTF2T2dOelZjY0Rmalc5?=
 =?utf-8?B?T2NKMGtCREtZWmdkZi9OSTBJWjJnclhXV3VTNEZUR0NySk8rNjE0S094cURy?=
 =?utf-8?B?SndpNjJvbjFiZmd1M25NbmdzT05DMWphMG5CUFBhN2tqVE9LaXRKVFdWTGpw?=
 =?utf-8?B?WHdXd0dpOWdId1BSNWJwQU1VMHM0UmlLYSthQUthdXVGNHFKcFJVd3FIZ3Ew?=
 =?utf-8?B?YWszTXUyOHpzeUQwSmI3c2xiaU1xaDgyN0h1NkNEeDltNnplRmhGVGxOU1U5?=
 =?utf-8?B?MFpadXFMMEZrNU16aU5rVnV4ZWp3dzBGUjFvRHJOOHo0VFpoTHpJQldsWDF1?=
 =?utf-8?B?L1NidUFqU3pxOFFhM0RCdHlRK2dEMkd5NU1PNmEzK2FZdFFSY1E2Z3MxaDlJ?=
 =?utf-8?B?WmQrOGJiRGtpcy9YNEc3ZlhHdjJwL2ZuK1k2MzVpK3h3a1pjTE5sc3ZuM0Z1?=
 =?utf-8?B?WVVTbk5aQmRtV1R6Tm9QaURSQkV4dnJocGM3U0xVajZYS0ZGM1B6L1dkN3dn?=
 =?utf-8?B?dHpQK1p2UzNWSzhoTGlSeGRQbUJhT0E5TUxGSG1jYUcrcTQxNzNEODNSNERi?=
 =?utf-8?B?cldLNTRPTjg3Y1NvVzlNN010RzVEOWpSTEN5MGZkVDFaT1dhNVVGZUF5bllS?=
 =?utf-8?B?QUFPM1dNVllxeTgrc0Ztc0N4OUZwdUtTVUJ4WHZUb1JDMW1UYTZORHVRWktK?=
 =?utf-8?B?TVhteWllZ2pobE9DTHBHdVZUcm9kVEZkdXo4Ync4eDFKOHBnWFovV1k3OG1W?=
 =?utf-8?B?cjJiQUs4K0RZckw2bEhyREZORVZ0dVZMMlNDRC9adU1yUzVtSWVLU3dSQ1pV?=
 =?utf-8?B?VnVKQXF2Q3JVVm10RFlnbVZtbTJRRTdkTzM0Z2Iwd0k5QjVwK0crM2RqeitF?=
 =?utf-8?B?dGpqbHRvemUvYW5tcnFjcnhhaHp0clpGQ2JjMjJpSWs1UkxHdzVEZWx4VW1o?=
 =?utf-8?B?bVJ2MVZLZFVPbjBoRGxSMzc3OHZ6N01kdHpxZ2RqaXRGbnhGbkhWbEZmcVh5?=
 =?utf-8?B?cVZzbXV6eVZZanUzUmtlM0JXelVrblFYVk9Qa0lEck1STHQ3cjdHY2ZBcUJW?=
 =?utf-8?B?YjJiYXZKdVg5UExidFplT1Z5VFNCT0dKS0dYYVU0YnFUNjh6MFloSFV2azRs?=
 =?utf-8?B?eldJT3V5WjJ0aTdzWWxjazJJUUl5MWp0YlcxY0M2YnhiS2htYnpFUG5hOWxW?=
 =?utf-8?B?MU96Nkt6bzluWTZtNXpuS3BucFBzV2ZRYTJkcHZMbUJpSkZ2SStnRUtVOXox?=
 =?utf-8?B?NTBnMzltMnVGRTltbjM2eklITWdXeGs5M21aRHU0OWhJL2R1Y0JBYktQOTBt?=
 =?utf-8?B?MmFhUk1ZVU11UzVtd0RKcWdGSXdFME9heFMxWEdTUVhVSkdDN0k1QUVHa1ZG?=
 =?utf-8?B?V3AyOVE3b3pvdDF2b1c4OWo3aU90am9PUFpZcllJbjIzY3QwMHh4aWRQaXY5?=
 =?utf-8?B?NEttSU01bUZGZm9zNWtJWVRjc1RKSXRtK2x6MlE1WXIzb0p0K25Xczk0d3lN?=
 =?utf-8?B?aWJURWE4RWhuM1ZOMS9MNTZSdTc2WWxaMjIyTWkvQjF2S3ZDVWx1MlFLNWxO?=
 =?utf-8?B?Z0RQUGZBZmlvKzlNWERGMEpPblpzUGZWai8wdHk4RGxpZjRqVXZGS1lrWm42?=
 =?utf-8?B?R1Q4WEJ4eCt4NmhEeVRoRytwcXdMcnRrRUJoVElRcXZSZXhhdUxJV1o2L1JI?=
 =?utf-8?Q?hpQ2h0QmPmA=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DB8PR04MB7051.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(19092799006)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dW1GNndqVGlvcEtZbmpydFpiRUVrUVZuc3N0Mk1JRDNaU0dYM0h1UlBzMnpU?=
 =?utf-8?B?cWhCM25CUTAyZWkrYWx3Y0duVnUrbGtDMkZEUDNEODh2NUxBWUxYcmJvTHN2?=
 =?utf-8?B?YlBoZ0xzQks2Z1ZkR2tRaUdTdEdNODFaRzU0b0JBNjBWYjMzbHFnZ0lPWHlD?=
 =?utf-8?B?bCtIZzhxSVM5SlZGdkZ6N2JMRFRwUkpXT3ZXMHVmVjJ6ZnlGM0tWM3BDcGdp?=
 =?utf-8?B?UFVHazdWK2o5YVIvTXFsa28rN1ZtRUpiTElMU0NpZEJjWkp2dkZwYUN5MUFE?=
 =?utf-8?B?bmhCa0Nzd2N6cFlSR041SGtOMWpyTXVsOTV6VUFrMnZEYlltUzJ1Y0VTM2ti?=
 =?utf-8?B?emxuejFvbENkb0d3TWIwaXdDaHQ2S29zaW5FMGJINExhWmk1VTAzM1NRNm55?=
 =?utf-8?B?OEpXRHJBNDhzVnplWVE1MEYveGluK2toRGs3VlMxSktmYklQWjVQUXNoQys3?=
 =?utf-8?B?c3ZIOHNpek40YkxqQ1ZHQ0UybDJOekdMbXFqRFNLNHlMclVYYVRuZThaZFR0?=
 =?utf-8?B?b2FwbnNOWk1VaDc5VVR5M3R1Sk1Gckc2VUlUcHQ3SXVFb04zNFM2WmJaZ1FH?=
 =?utf-8?B?ZVF6SVFtRnR6aDJ5VGxTeTRGcVJqUGxBUE9tcFNFY2hlbHJpbGJuNGE2RlQ1?=
 =?utf-8?B?VzFwR1RNaktCL0xQQUZKWmtoYzlkWEVveHFHWVpQVlVMbjVuaUxPS0p4b0pG?=
 =?utf-8?B?RUJCc3MreC9PY0FXQ2JpcjZKZHpNUDI3YmZmNFRUMVZFbXhtMzU2T0x4UXd3?=
 =?utf-8?B?SWovdnEyamkzN0R6NE90eXVWUitya1ZJTmVzMDlMWnJqdUxkekd2UDV5aVM3?=
 =?utf-8?B?cldYS3V4dGRtRlBTeVBUWUVQSVhSK0h6VUNnRyt0SHE4VXZrTG1tQlJJMy9E?=
 =?utf-8?B?RTFEN2FLQ3VteGVab3JoWCtuMGFxWE5VNjlzdzZLa2Vpa2VyYlNJTFhKN3c4?=
 =?utf-8?B?OVhkM2FUVkc3Si9VTmtLTlJZdkR2OUVnQUFIQkh0MWQ0YWNIdk5wZnJ3eFVD?=
 =?utf-8?B?d01uTzk4VHFrNVNBZkMyMG5HaS9XY2pZcGk5UDJ3NUVQV3hvS012NHBsVjdE?=
 =?utf-8?B?SjZuQ3VUcHBpUWI0d1ZQR2V0VnhweDhxUXlubDFKZDBLL3ZxYnF0bUgyalhu?=
 =?utf-8?B?YzRLdDVESmhRNkFYeDRNMUtDcTRjazExa2N0YTJFZ3JSc0xYc1VnNlUrYVJR?=
 =?utf-8?B?dEpQMm9jVzd0d0FucnJSN2tPNFZuRzNNN1pZQUJSOGoyc1A5WTJqUjRXUnZt?=
 =?utf-8?B?NG5hUkRhNjZpdEFOUnYxb2VydFJNQWoyQndsNE0vb2dqMXFzOG1MeUVYdzBq?=
 =?utf-8?B?VUZGdUhjUkpaczIxcVY4NlBPN21oZms0NnB1NmRINml0a2xJTVFOb0lzOXRu?=
 =?utf-8?B?N1prNWtGWGJXdmtna0hLU3dOU1dEVnd4MEQwTVo1REFlQkcwbXpnemhpdWlE?=
 =?utf-8?B?WmlzYWN5UHdqMWh5TEt4ell3REJRdTE1Nm85SEJlbzA3NFErR1pRSXA5NXNJ?=
 =?utf-8?B?cEd2VGxDS0J0cW5VbElXaW5zd2xQdlV5YzJoSnZzT1Fmb1dLZXdaSi9sUHVY?=
 =?utf-8?B?blR2NkRSclhrSXlPaEZlYkhnNWgvMWo0SUh6UG9xaThMcThidDR4ZnRPLzNi?=
 =?utf-8?B?SmJDbXp6VWEwTHZlbFhhOU15allWeURqY0UyUmNNeXgyV3JzbkJ1dWRHZjJz?=
 =?utf-8?B?RnFCTGYveTVVK29TaTBGMW8wam5SUlQrblNOb0xvN25QVGhKV3JWWFVkYTBQ?=
 =?utf-8?B?RVYxdk1zQzJGQjRBZGE2aFdTTnpFMzYvVEM4TDlmbmF3ZGJGbWgxNTlHSlJh?=
 =?utf-8?B?dlM3QkFkV2lFaXNxVk5Xak14V0Rmc0paZU1iNWt2UXdJRGx5QlNzNHY2dzlS?=
 =?utf-8?B?ZWlMcFp5WTc1UW9tZkswMFVpcXlsTzBOUGJad3NERkNYSlQ0VEFtL21Ca1Bx?=
 =?utf-8?B?aFhKeXF2eXhTUXFad2x5OWtvZFNMU3AvSFE3N2hWc2lxYjlzRWUwVWdXYXlq?=
 =?utf-8?B?V2Z2a2RVbyt6N09xRjlhU1gxRnA5VWtUNUtPZVgxS0N6RDFEUkg2eXIxdCs2?=
 =?utf-8?B?a3FCN1ZPL29NNE5TY2lQbWNSQURhdHlqeStmSFRLNnpaNFJvbG9ETnhWMlo0?=
 =?utf-8?Q?lZYHTFoh3DdaN7iVi/NSYlRAp?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 42bbf239-ac5c-4891-ad75-08ddf6615212
X-MS-Exchange-CrossTenant-AuthSource: DB8PR04MB7051.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Sep 2025 03:13:20.7652 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xBUbgqqfovZ6pY3U/HJ+Fm/m8ezyXQSlD4b+kCf2AaF9oZms7EaSgrXiUCfHTjhqfpoC8f8+VQGoDAk7HEdm2w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR04MB11549
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

On 09/17/2025, Maxime Ripard wrote:
> While the old and new state pointers are somewhat self-explanatory, the
> state pointer and its relation to the other two really isn't.
> 
> Now that we've cleaned up everything and it isn't used in any
> modesetting path, we can document what it's still useful for: to free
> the right state when we free the global state.
> 
> Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> Reviewed-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
> Signed-off-by: Maxime Ripard <mripard@kernel.org>
> ---
>  include/drm/drm_atomic.h | 17 ++++++++++++++++-
>  1 file changed, 16 insertions(+), 1 deletion(-)
> 
> diff --git a/include/drm/drm_atomic.h b/include/drm/drm_atomic.h
> index 321c866d5b0a46df7a9adbbf5e4cabd1ff987aad..798d33b50ef7497ce938ce3dbabee32487dda2d6 100644
> --- a/include/drm/drm_atomic.h
> +++ b/include/drm/drm_atomic.h
> @@ -180,11 +180,26 @@ struct __drm_crtcs_state {
>  	u64 last_vblank_count;
>  };
>  
>  struct __drm_connnectors_state {
>  	struct drm_connector *ptr;
> -	struct drm_connector_state *state, *old_state, *new_state;
> +
> +	/**
> +	 * @state:
> +	 *
> +	 * Used to track the @drm_connector_state we will need to free
> +	 * when tearing down the associated &drm_atomic_state.

Sorry for joining the party late.

Nit: to make reader's life easier, maybe mention ->atomic_destroy_state() in
drm_atomic_state_default_clear() is the place to free the state.  OFC, you
probably may find better words.  Same applies to CRTC, plane and private states.

> +	 *
> +	 * Before a commit, and the call to
> +	 * drm_atomic_helper_swap_state() in particular, it points to
> +	 * the same state than @new_state. After a commit, it points to
> +	 * the same state than @old_state.
> +	 */
> +	struct drm_connector_state *state;
> +
> +	struct drm_connector_state *old_state, *new_state;
> +
>  	/**
>  	 * @out_fence_ptr:
>  	 *
>  	 * User-provided pointer which the kernel uses to return a sync_file
>  	 * file descriptor. Used by writeback connectors to signal completion of
> 


-- 
Regards,
Liu Ying
