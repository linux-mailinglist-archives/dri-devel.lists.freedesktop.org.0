Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E740EA4A0FF
	for <lists+dri-devel@lfdr.de>; Fri, 28 Feb 2025 18:55:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EBD9110ECB9;
	Fri, 28 Feb 2025 17:55:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=cherry.de header.i=@cherry.de header.b="BEBDKihE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PA4PR04CU001.outbound.protection.outlook.com
 (mail-francecentralazon11013061.outbound.protection.outlook.com
 [40.107.162.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC2A510ECB9
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Feb 2025 17:55:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GSKO8oLrie22k7n+y+99xoI+xauC7ntFj6s9hLJNhxL0QR6Ccus4GREDQ29M5T+C4L8YT9zrPoKkWvMTSw4vzMGBoUhfz/rIY4KMSyLbFPeHsaKVqzI/ncA2K9wwTa2zGzqXyUT9MhRRooevKu+9f4Y3R7dMpVktQaJ+E9sBMkXELrZ3PFhy9NKytNzX78NLY4pE7Wq2eLlpd2wTtzuIiVoG4efmYrdlEJxStoetKPC+Nj9JwVWIVRZxlGSwtK43yaxjZuE7XWU7kcERPqGXekxh2YfuKRF1KMZKCl0ZvqnJoNGhsWSOpuSScAOjESMQ4itWQj+ffdazAO7sToGg9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b/UKEPNUT09PAvWfbEGTDQnor/DI7qIBVGWKIjLqTtM=;
 b=P1cGN9+Ze33rp6BWti84NPtHBW1mNJYx4Ht9DJ9viU82ZWJKrhhU39cd8V4psDuZEEy2FHINojR6vFczVYopQbzKfzxstzK3VSMRhxhqnfJOKF4ExPOBxVbatyDhM02dGyc/ntIbZv84ORYMWCBkBXb83XFABRqFpLuREUzIGvVnw+17LzSJrtECWzKssWlhhECB4X/DZsPtNOptwe+iP/tmXNTasg1MaKmC5vcYmfAymuOD83HiYu5IaDOCR+fvi5lguD9JxTAQ2H7pMau/5MbHAuDQ2W9dUZzjm5f3+Iz1ZkYZtWxDUz1y3ME5zMLFuIbGobBePh+YTvyVPn/iTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b/UKEPNUT09PAvWfbEGTDQnor/DI7qIBVGWKIjLqTtM=;
 b=BEBDKihEV3raYzM8BeH0cIUi09dhwGZXTu2gWoMT9r9Z5AlJ3mlzY7uxMgJSrviOVht7AvNovrQuDAuVJsUn785E6edjIilZINnw3QQTp0HOqanSRSwXTQ5r8GtAZcyKMmcknsHkg/o2C6SlyWBl3WNMwc/1EZySxDlDFQZrh2Q=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by PA1PR04MB10501.eurprd04.prod.outlook.com (2603:10a6:102:44e::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.22; Fri, 28 Feb
 2025 17:55:40 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a%6]) with mapi id 15.20.8489.021; Fri, 28 Feb 2025
 17:55:40 +0000
Message-ID: <54faf85c-38c8-45b6-ad5f-04b069891e24@cherry.de>
Date: Fri, 28 Feb 2025 18:55:39 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] drm/rockchip: lvds: Hide scary error messages on
 probe deferral
To: =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>
Cc: andy.yan@rock-chips.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org, Heiko Stuebner <heiko.stuebner@cherry.de>
References: <20250228165755.405138-1-heiko@sntech.de>
 <20250228165755.405138-3-heiko@sntech.de>
 <b09e5470-2392-4557-9f13-62b6586e5c7b@cherry.de> <3032732.6M6d0yLqnL@diego>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <3032732.6M6d0yLqnL@diego>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0199.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:e5::19) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|PA1PR04MB10501:EE_
X-MS-Office365-Filtering-Correlation-Id: a2a80bb7-f02a-4ac2-be94-08dd58211d61
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Ty8vSTNqS1JtL1lJeFkxVFVrUzdSU1ZvQjI0REk0Wkh1cm1EeXh6RWVFYVhB?=
 =?utf-8?B?eElVengydUxmUEE5MFJZRDE1N2t1Ky9UK0lCYjZaVFhralVvTHhBRFl5WkU2?=
 =?utf-8?B?STlIZWVBWnIvSzF6MWtJQUd3QlpEdlVuVnlpZEQ1dHBHUGFSZXQ1WjZpMyt1?=
 =?utf-8?B?R2VkU2hlSkYrUVZCNm0rd1VaV3hycCtLdFBXdXROWUdLZktMdmJKdXVFZk4r?=
 =?utf-8?B?VTZHaHlTa0d2b3hMZHR5OXFvZVF6c2t3NXI5Zmp0eDZNejFGb01FOWlzS1Q0?=
 =?utf-8?B?bXpEZDRXcTdGTVBDMkhwK2Vxa0tmT1gwaFAwY1hTRDgrZllqamtZUkJPamFS?=
 =?utf-8?B?RnYxSTlRclVta1FCR2tRY0ZrdDJpNDZacm1neUptVlk0ZUVBVEtjRG1UVytk?=
 =?utf-8?B?MWVYNXRyN25LUjkva3pWRXNCRkpnU2txQ3J2czhhNTRKYXE1MFB5VVNFQzdo?=
 =?utf-8?B?WTl6OW5yNGErUFVoVWF2Y2xXNFZYWCt0dzd0bkpzRW8wUkFrcVFMTjd5Nzlo?=
 =?utf-8?B?cHRxbWU0bzU0UXpPSlByRWtMbWg2cURITEtQVG9RcnRzeExEQW9qZVBVa3NW?=
 =?utf-8?B?WEtETEtMNmVZbloycmp4VkZSQURTZWhJRzNDcEtlQ2FzZjZpbGVYOXQvZDlI?=
 =?utf-8?B?dTRmc1Y4WXVLQytyU1IzemxyTEJUT0JpU2lCT1hVSC9GRFpiQ2ozeW95aWFV?=
 =?utf-8?B?NGN1NDNtYWlkWkw4TExPQnc0VnVxTFVwdEtwd0ZIdUE0eWI4dVkwVFpuellK?=
 =?utf-8?B?bENVOXQxbTRockpKaDRyQ3pWaXZHSzhEWDNsRnpwbmpwNHAzOFM1NjM1eGQw?=
 =?utf-8?B?VTNWbHFOcVUyZGE3MWZYMllIelhqUGc2SEFJK3NPVEF4NFk2Zzc4VnZvNzRj?=
 =?utf-8?B?TGltWGZoRkpwVVNhLzFOdEFPUUJRMHNvRlh0YmtEak1RUGxndUpiR2xNWGQx?=
 =?utf-8?B?dExUcmhmeVNyd2orZFR3cDB2aUxuWitxUlZiVzMzb3dIZjlHQUFxdHVvejFy?=
 =?utf-8?B?aVlFa2ZlRlRSaFd4RTBFa1dTc2FiUGRsaVdMa3YzUEIxUE10SWpDMk00VHRk?=
 =?utf-8?B?a1VwVThjMitNT29PclpXeU05UUpHdGxPUjErdVRCOUZLbUladGlIdnVYMURu?=
 =?utf-8?B?YzFkMktaSXcvRDNtZHQrMmM1QnUyS1pLYWo0eitGQ3BQZWtEV2plNlJaaVlB?=
 =?utf-8?B?VHFqTjc5NGN5ektKQkxSQ3BDV0ZYNUVDZGpIZThrdVBFWkE3Z0pwY3kwMkF4?=
 =?utf-8?B?NnNqSDArdU92TThlMTM1VGhQNUNjU2I1cnhWNkNoU1BFVlB1cmo5U2loNW81?=
 =?utf-8?B?Vkk1SDI1aXk3UHRxbHhUR3RvZ2lrZUFKUjlMck0vcVJ4Z1QvRzhONStoQXh5?=
 =?utf-8?B?azhDb3NEOUcvblFGSXdQUXcrWWwxWkFDOGw1Z25jdmhlY1QvOVl1YTZVNHYr?=
 =?utf-8?B?QzZOa01nM21haVFxRWs1akJIc0g0NCtMcDR2UUJmelp4TWhtMG5vMndJT1Bw?=
 =?utf-8?B?SmdJK0NlRmZHT3hCZDFFSElGenpsUTlLR1Ewc3E1OWNhdzJpaWV6bjlqMGg0?=
 =?utf-8?B?QlMzRGFKM0Y2NEl6b0pOSi82YUhaanJ1OVVkUGR6NE42eDRVTTlDUW1aRDdG?=
 =?utf-8?B?NkN6akNXbGx5THRDOEM1cVFIaldmVC9OSmF3QVllRTIyVXdVMytwT3dzNThn?=
 =?utf-8?B?M25aK0xCU2xVVGU2NFFYKzI4Vkl4cGFmbDhzdExyYXdNQUg4WVZiVWlURlNF?=
 =?utf-8?B?ZUxpZ25YZFhSanJzT2VldDhkWVEyOFhqQkluTVdIME5MTE8wbUtyV0JoWVR0?=
 =?utf-8?B?SUh6MTRhNWZwZzVLOVVjSEVNbGJVbitZYytpc05saCt1ZzhtQzY4NlNJMkRJ?=
 =?utf-8?Q?2Jb5Geqb9O6Gh?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AS8PR04MB8897.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VEFaVnJBQVlXMTROVEp2NzlTWTRUeVZvTkE5M0lvdFhJby9HdFhGWGJGZTQ1?=
 =?utf-8?B?VnZveDN2dDY1NVQ4eWpIRE12K3NFM0tFM1g3eGE5ei9VUVhiRS9mOFM3alNx?=
 =?utf-8?B?ZUkrTXJYWUN3UllYamFNREFvSk9jT0t3cjJTUnlEbFA2WUNTMlZ3UEUybkx6?=
 =?utf-8?B?dHZWcWpTd2lMLzlwRC9YUGlUVEljZThnNlZVYytLRU5XVy9wQ29jQ1FiRHBp?=
 =?utf-8?B?QVltSy84RnhEZCtJQkZQTnQvbDYxRWFUc3JtZ1dFaGMyTk1aaTB2Nk1JNTB0?=
 =?utf-8?B?cmFDanViSzBNVXZ5cmdDZlNOS3lPejNZekgrcXBRRC9ibURrblkxTkZQWGgy?=
 =?utf-8?B?blI2RmtyVVNBS1JqdUUzQTQ3NExaekIwb1oweXZCbW1yV05maGJHS0Fockh5?=
 =?utf-8?B?V3dZYXpWcTVUcHdOK29TWWZhekxFdjRIYUp3K1V1Y0ViUXQ4Vnp2TWFKcGJx?=
 =?utf-8?B?b1p6YnpuMDluZ3FaNlBmZGhJSW4rZFg1bDZlMCtTR3lPT0E2Vng2U1lmd3FF?=
 =?utf-8?B?QVdRbWs0blhQZGt0a3U3ckUrdlNCRGNtNWQyekJGcElnUDBUUmdDZjdFc2o1?=
 =?utf-8?B?dndYSDFoVHBMWnlJcXN0MXFKd1oyMzhKdVVnUFdZNlQxSGQxQ3haYWQzd2dP?=
 =?utf-8?B?TnQ0eUJNUlIzMWVmUUtzbWt2ZmUrNWRCUDlDRFdkSWZFZ2dpNU5ieWYxVkxn?=
 =?utf-8?B?aXYrT1RoUmdtQUIyMjllYVdhaXBNNnd0eVBESzh5TW5jUjhyNm0vS0tXSTg1?=
 =?utf-8?B?b0hOTHl1NGk4QVZERFpMK2J1Z29mNW9FYlI1UTBENGplSjNtWmNxaGhJOUU5?=
 =?utf-8?B?cXNYWUxtUmt6MUNLUUNoQjZzSmtGTG9TUWRwUmYxRUtIODBvYU5OK0psZ1pv?=
 =?utf-8?B?V3g1VmNERGJDYTNPMFFOY2d6WlFWaklsQWs2c0pkM3dSREZtYXNsQkhhR2dL?=
 =?utf-8?B?LzEwQ0ttSWpuZkNsSDFjeG90bmttMEdZZUFHWEFsaWppcUNhMjNidXg2eVUx?=
 =?utf-8?B?OVJqRFlqN2RCeUxmWXNjRGhmUE85UTRkckhNN0lFN2djSm5GUitFVU91d2tj?=
 =?utf-8?B?MFBrR3dTVU1yWExVUDVqbTJHMjRTdHBGU1VTQ3ZHS0xrRk5sVC90cmRCVjlX?=
 =?utf-8?B?dHJBdmRyMnNCK0dQODRNVjZJWWljSTRWeFhoY0htYXRSZld1S3hUeDJhanNN?=
 =?utf-8?B?TEthU1BDRDA5ZUFKRVhFbno5UkpYZUloTVNEMXIwbVl3L0pEK3pPL3VMQi9S?=
 =?utf-8?B?dU9walNKbFE2WXhTUis4cUZUalZwZUtMditVL2kxUHNRWFYxbWNLcERuK2px?=
 =?utf-8?B?TXNNbGJJNWlGbk40dmFZL1JsbGZXWDdmTzdqakFYU2dLN01QN3NnQXFxSXV3?=
 =?utf-8?B?QmZKZGtVVjA4QlA0RTBDalhwS09raXJPMS9HSnJ4S2pBb0ZWQWlRUWRCVklh?=
 =?utf-8?B?RHVldDNQVUF6OUl6ZUw1NFlCaHV1QWNjbjVJZkUxd1I3d3dHUDlNdklrTFJt?=
 =?utf-8?B?UUFXTmZoenFRc1M3V3YzUit2SWhqNnBIOHJsU2c0RG1uWWlHTzFmL3FaSmJB?=
 =?utf-8?B?U1FYSDFqWTVtNmhQMGs2VWM1QjQvaU9wSHh3czdQcmE4Y0RZRlpBYndDdVFY?=
 =?utf-8?B?YXRoYjFldk5NZk5kTjhLTExhaXE4Z05WOEhRUzl6UUszMExaeUtOZEorOVI5?=
 =?utf-8?B?UWM0TFFWSmM3SW94bmZNYnhpVU5ON0E5UGxkQitwTGhRMzlxeXZCQlNSSEE2?=
 =?utf-8?B?cW4yTXVpaGdJYUpWcllGYlBidEJLQUxFaWs2QndCdjl3aXNQTlBUaXZyUmc0?=
 =?utf-8?B?UFhBYnlRV2Y2TEhySkFrWTAxbjdTeEdiRTlCWXFtRklhckVVODF2S2VVYk40?=
 =?utf-8?B?a3NRaHloQ1hsSHJIVnMxUTd2alVwU2NGM1NwQUhDcnlHYlpjVC9WWHZHUUg0?=
 =?utf-8?B?bnI1WGFBaG5LRERsbTJwUnFQTE52cVBsa1dRL1ZsdjUzMUFVNWliR2IxVmVI?=
 =?utf-8?B?eHlvemtNeDFwY3hTSVU2aG1jOVJFY3RKd2VsUkhLRFZoTVhndG93UGtpY3dl?=
 =?utf-8?B?SE9uaVRmeVRKMTNiZmwwTDhSVmpKa01MdVFEZno0R0ZLTHRPTWdJYjVpYlJH?=
 =?utf-8?B?clRGbmNXRjBiNTh3bnBZaHNIN2tzZHdXY0JxNFpCeHZISGliK0RxNnd2SURz?=
 =?utf-8?B?dWc9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: a2a80bb7-f02a-4ac2-be94-08dd58211d61
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Feb 2025 17:55:40.7475 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: p2uy1gMV1EZUsLlEBsuvt9qUaMnTVSrSL1+DQIcy6qeOT6H5ZnIrk+LwGFxnfBx3+EQXX3OQXAbD6BlAUO+NQOefMT+iaiWftuk6NzA2ZZE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB10501
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

On 2/28/25 6:45 PM, Heiko Stübner wrote:
> Am Freitag, 28. Februar 2025, 18:42:32 MEZ schrieb Quentin Schulz:
>> Hi Heiko,
>>
>> On 2/28/25 5:57 PM, Heiko Stuebner wrote:
>>> From: Heiko Stuebner <heiko.stuebner@cherry.de>
>>>
>>> Commit 52d11c863ac9 ("drm/rockchip: lvds: do not print scary message when
>>> probing defer") already started hiding scary messages that are not relevant
>>> if the requested supply just returned EPROBE_DEFER, but there are more
>>> possible sources - like the phy.
>>>
>>> So modernize the whole logging in the probe path by replacing the
>>> remaining deprecated DRM_DEV_ERROR with appropriate dev_err(_probe)
>>> and drm_err calls.
>>>
>>> The distinction here is that all messages talking about mishaps of the
>>> lvds element use dev_err(_probe) while messages caused by interaction
>>> with the main Rockchip drm-device use drm_err.
>>>
>>> Signed-off-by: Heiko Stuebner <heiko.stuebner@cherry.de>
> 
>>> @@ -604,8 +602,8 @@ static int rockchip_lvds_bind(struct device *dev, struct device *master,
>>>    
>>>    	ret = drm_simple_encoder_init(drm_dev, encoder, DRM_MODE_ENCODER_LVDS);
>>>    	if (ret < 0) {
>>> -		DRM_DEV_ERROR(drm_dev->dev,
>>> -			      "failed to initialize encoder: %d\n", ret);
>>> +		drm_err(drm_dev,
>>> +			"failed to initialize encoder: %d\n", ret);
>>
>> All the above are using dev_err, but starting here, it's drm_err, is
>> that on purpose?
> 
> The last paragraph of the commit message was supposed to explain that
> (which it seemingly did poorly :-) ) :
> 

Mmmm someone didn't read that commit log entirely. That someone 
apologizes for the noise.

Cheers,
Quentin
