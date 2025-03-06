Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B7D0A54279
	for <lists+dri-devel@lfdr.de>; Thu,  6 Mar 2025 06:56:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A71010E124;
	Thu,  6 Mar 2025 05:56:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="gN4Sw5n9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DB3PR0202CU003.outbound.protection.outlook.com
 (mail-northeuropeazon11011018.outbound.protection.outlook.com [52.101.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 86E2510E8E8
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Mar 2025 05:56:37 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ibVyAd+wm2T1HdNW1q1nMRuHXgDJGbBmJ/47HHcqoELaPvGCEJPgAtwtnZVreJ8NWCqe4cKIlbiQxUd1dSOs3JTZWM7R2iW0NitJBguVDGTdPTbrIdS3eTuDm5ZcJbkAXb0GZ5xKWvEqtXUwTsqpMIY0qcP1lBikfcwd9DZr1W6EYt9GSQ/Auel3xQchBUohSlNn/nq94yPDwMUiy/Af0dYaTb77+sdnK+ZvCZO6QN/+NemuGtprqQNpbLM7OpaDQl5QOUVEl/yq74ucU7zM0TwtWGELsT8S3pPLJJ//Xk8tODASVaLbet2PDh/wC4/IOfeoE+aEOTjuVMeQOt1xaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zSDPxZEaanmGEvh7FLjaMmDMLqqC18bn6641ucb5imw=;
 b=E3jJ5mk31DsHp4WIkaPU1jJG7BjKhHkNnOCTHwBQWNwnd6UIXm6ZfCCvPxw6qD7T7rJdwMG6d+/N0r5Pkk5HamsNIyFiL57OVGc1APtTyFJDO3uLyIyPPDQ5d+oz6DgtkQ1XaL1hXB0WN27sj2mIHbpm+bv/Vy+sRbtBxKtawPo8jVjOCsyLMAe8HfIhRZWmxkwVefKz1P9M6DN0MkJp0t91k5U0xgdwvliqMehP2khPFW3c7Ov88yY9aHbJRWRS0Rqty52RZ9RtKOKT+jOPmLiDWAMCkR+6npf0zEff6Pm9y5bB1307iArpjZo0vrgk5kY2t8umsCCJg/0j6vX17w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zSDPxZEaanmGEvh7FLjaMmDMLqqC18bn6641ucb5imw=;
 b=gN4Sw5n9mKUDvLpWPT3uCZ5YrDfHQeS9khj5WcCLeTaFYnJ+WuZcXua2ho8Q5epuPja0Yl2Tt39KkEDkFX7mJpgLfxMP8Zv6Brzf86m04lVizqZ4LTct7qJX2j9DH12CEbmEEKH1R4N2+Lcj6i6khrGLXXZ55VKnwblKseGK9zLe5HeK0fCBfx3bo0AwMWdUmZDSgwWHDCcCf8nEdiL1iffUBT/CXL5TWQ7G6Qhd0ZkGmxiUXFT6fTa6D63pvGyfwfTqn1v6LFT+2144U9nKscBuS0CBJQIUWIFgOZ2bYT1EvwrPJe6XL0VghUbLsfsqzpnf/kp+vH4HGp3DL20G4w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by DBAPR04MB7270.eurprd04.prod.outlook.com (2603:10a6:10:1af::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.16; Thu, 6 Mar
 2025 05:56:33 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90%4]) with mapi id 15.20.8511.017; Thu, 6 Mar 2025
 05:56:33 +0000
Message-ID: <c3b64134-a095-4d51-afe5-cef576a98d67@nxp.com>
Date: Thu, 6 Mar 2025 13:57:45 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/5] drm/bridge: simple-bridge: Add DPI color encoder
 support
To: Maxime Ripard <mripard@kernel.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, andrzej.hajda@intel.com, neil.armstrong@linaro.org,
 rfoss@kernel.org, Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com,
 tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch
References: <20250304101530.969920-1-victor.liu@nxp.com>
 <20250304101530.969920-5-victor.liu@nxp.com>
 <20250304-diamond-toucanet-of-pizza-6faa2d@houat>
From: Liu Ying <victor.liu@nxp.com>
Content-Language: en-US
In-Reply-To: <20250304-diamond-toucanet-of-pizza-6faa2d@houat>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI1PR02CA0015.apcprd02.prod.outlook.com
 (2603:1096:4:1f7::18) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|DBAPR04MB7270:EE_
X-MS-Office365-Filtering-Correlation-Id: acaa1407-176d-4b9b-442c-08dd5c73a5fa
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|7416014|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WStUWlhxQUFUWDZaTnNacVVKMkVqTWZpZ3lVa2FmY2dvb0IvczBLSmx1MlRX?=
 =?utf-8?B?cDl5bHQ4aHpnWkpjUUNZU0xkdllXUVhhKzRzTDZIYlJsV3doTEhlQmEvb0pN?=
 =?utf-8?B?QmhUTFNDSkNZeWJZN0FYOTRJVU5KMnpiMlIyV2ZZZzQrMFV6OTZ2Z1oyZHJQ?=
 =?utf-8?B?YytpR3dOYndzWktsRHRybHRLVi9HQXROSnBYWEpMVVpKK081QVhuaGhmR0NR?=
 =?utf-8?B?aDg2Z0FDS0lHWHFqaDR2VWhFZ0VXc201ZEpaNWF4L3J2TkhOS3VSNXduRUl6?=
 =?utf-8?B?M1JibklwRVdLd2J1MkxZeUxDbWhBN3lyVzVvcmw2VGluTEc0ZmtZVXpkUzU3?=
 =?utf-8?B?aVovWnp1Q2x0djNKYXpOKzNzNlpZeVZkSW4vRWtySmNwajMrQjRBdXJpK0Iw?=
 =?utf-8?B?QkhudlcwTDJrWDlsNW1UYkpTd0ZYM2ZyZUtTTVpNQzhhRG1wN3NvTkptVWIr?=
 =?utf-8?B?M05kOFE0L0tMWFRhQVNOelZNUlFpZXNRbXNOR21KT016Vk0ycUhmbkc0Mmkr?=
 =?utf-8?B?ODZPa3d4ODg0N3FBMzRIbm9UR2pxQ1hHcm01TW9VM0Zsb0VHbThFS05JZGNk?=
 =?utf-8?B?U01oVC9jKzhpcjk5WnhvUnU3dkNXa3BQano4N1AyVXZvNUpmQlpBR3VuTDA5?=
 =?utf-8?B?QnZNYXFZM1pNNUIzbnUwdThPQUNTSHRHT3FvOVI2U1dOWVpkT3Q1WktEUGtD?=
 =?utf-8?B?aDA5NW1CNGRZbUIvM3dPVm4rVnlsYnJiOXJDYlh1OGhCLzNpYWd6QWpWQ3J5?=
 =?utf-8?B?VVlpaElRaHA4bW5IOW1RTlRJcmwwem5wUXVYUnNzQXNsUDRKUTN5Q2NqN2VH?=
 =?utf-8?B?M3VjUHZiTUlxcmk5N3hFaGV3dW1GQ2dvUGxyWGpWcFlBejlMY0gvek9VVllB?=
 =?utf-8?B?VWduU2h5UkZqYnl5NGg2TVdCUCtvTkFjSC9xYm5sNldMYXJmRGt2TU44bDF4?=
 =?utf-8?B?THFPZWs3OHJwaStpc0tCYWk4M2RIS0JNRmRFTE03ZU9DWDJXNmVyUmw0TWdC?=
 =?utf-8?B?REc3bUdSTFlCM2RNSS9oS1JkZ284MkFZK3JySXhaM3JSdk1wOE9Mb0g0akto?=
 =?utf-8?B?VmdXVlpybHhDTEhDZEp5MFBoQ1NuZDltMlpvM01JZ2xhRTdEdXVoS2JESGpK?=
 =?utf-8?B?VHV1T3hQTmdTU3NVUG43bGFJMXVPYVl6dlc2S1NaSmMrRWNmd0VmSUlBQ1pl?=
 =?utf-8?B?eHU4dUtEaUtleitRRGhsYW0xaFdHNjdTWkNYNmZ2bVFkSGYxQXI1WmdHUHIz?=
 =?utf-8?B?VFM4cWh5K09xL1o1ZzNjN2RVTzlEcTBNaGVBV2xiUXNFUVpJQnRzU012Q1RS?=
 =?utf-8?B?SnBraDZXUXY2TnpQWk55clhnYnloUWhuVDBVN1VXUUgzYk0xbGp6NE5pQkpK?=
 =?utf-8?B?SEFXdHNnVHdsVVZkcFJkb21neUJTTHdPTmsvWm5DNFlJbkJ1N3YxZWRRd2FQ?=
 =?utf-8?B?YjZvQS9kUC9SM0pTMko3ckx3TDBwdnBOSDJYQWVUQmozaHdFeEtOSXcxTVAy?=
 =?utf-8?B?c0N4cGNUMXNXYzEwSzNpbWxTSHhPYXl5UGN3UVo1TGVjWGtRZHkxK01CYUpO?=
 =?utf-8?B?KzdEMWFmVFhldXE2c2VmY0JRM2xqRmE4M2pSek9PY3l3UHEvUHA3NUViSG1U?=
 =?utf-8?B?aG13QSs1clBDL0V3MjA0N291YTM1QVUveVlOSzZFWk9tdTdLTFJhcXF6T0RB?=
 =?utf-8?B?WTV6UmxxT2VlQ3RxTCtmRjBBdkxXT0JhNmFsNU1XcWpCZFMxWTBrZmxjaFNi?=
 =?utf-8?B?U1NjU1VWVkcxeUdlMzZjblQ0YjZ0YzVWWEdSOW9teFBCOUdIeEJLUUoyQVNl?=
 =?utf-8?B?aWF0R25COTZwS0N1UkU0UT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(7416014)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bzhqMVZRT1NpaG9IamJiekpmRWVQdG5vYVNTeUlGZ3B5dEhsV0UzK1J4OFIz?=
 =?utf-8?B?UTMvWFpERysvRGk1b2xFTU1Xa1kveE4yU3ZKRjk1RzlwamtnY2oyb2pjRjN5?=
 =?utf-8?B?UlR2WDJZeExzN08yaTBBbHorTHNiTmxlb3JOZzBOY21zb1p6YlRUTFJmTHQv?=
 =?utf-8?B?MG4yNkhRMW1acndXaU0vWGZQcEV0MWx6cCtpSUlQazJQSkVvZUhzQm1FTWNO?=
 =?utf-8?B?cjJPZFRHSmRSK01xeVNhN3lHZlpaWWFoSVUybUhmRzBDNUl5aGJXOHBEZDVZ?=
 =?utf-8?B?aFBIZmpyV0JPcnpUbWdhNGlJdE5vcEdURkxGS2pQZ0NaTTlqR2ZoYjc3SGJX?=
 =?utf-8?B?akVZTzJtM2tEWkJzUmZVWU5kMWhWVkg2aW1hQ24wbGllSlJHMWFhNWVxVWVu?=
 =?utf-8?B?RVlzRkFGZU0zWXBwNDM1cG1wRnVJQ3JOMlpRdndjM0g4YmEzeEJQc2FKZitC?=
 =?utf-8?B?UFhYWURrTGd3eWtGR1FCdm1MRk02SFE5SnlYVjlVNjlyM2pNc0NYQ0NvUHZC?=
 =?utf-8?B?QW03cFF1THVadW1OV3VSRzdVNDhyQm52YnJnRW1iRXU1dGsvWWIyODlwaWVF?=
 =?utf-8?B?RithWHB5OW1ZVDcrVmhFeDlwSEJ0dXNZQkdFaXUyTXhiRk05Ym5PYXlENi8w?=
 =?utf-8?B?VjFpK0wvSklDWGMxT3ZzRFF5cGhyb0swbXgyc054b1pUazZESUZrQ2tsMHR1?=
 =?utf-8?B?cUNKZklyWFRncEVtMHA2bjI0am5RQnBiWlJPQUhMTzFFK1NQV1NuazJjUVZJ?=
 =?utf-8?B?bTl2OGZTbFV4TjFTVkJoNDVtRVYyODlEK0RtdWpyUTFHVkFMNUhPOG1HQTF3?=
 =?utf-8?B?MGJKcTdCNUR1WTY1U0NtNit2RHBWQXlCTXBDS21neE1vLzJVUkliY1h1ZUFq?=
 =?utf-8?B?UzBJTG5MZ3RWZ3JnT1pNZmptRE15RnRqaVEva0RqWDM4UDM4azhKVUQwNUFH?=
 =?utf-8?B?eThDejdlYkMwOTNRbHUwbnpVMzhNd21vVUZoekhMTW5qYzJHVmtXVzlrMHFM?=
 =?utf-8?B?dER5NTRWQUJ3bWtpUzhMWWN4TkMzZzlkNEpFaU9icmd2bW5nZFF4UkZ3TGtu?=
 =?utf-8?B?WnByVDRjbWdhb0hBMGpyaGJXNUdWVzQ0aGZFRGhxU1VyOTdDU1o4ejdpNjVm?=
 =?utf-8?B?MmQzTmJkTWw4Ny8vV0gyQ2xzMWpZN1Z0TTJwK3lQSUlaWExKMzJ3eWE5SUx5?=
 =?utf-8?B?ek9USkl4WndrcHIzRFM1UkxzRXlML3p2ZnVBM3NoSitjSFlsSDBOaU5KMHd1?=
 =?utf-8?B?OGZEWVJ1RTdkNE8wMzhvMmZzRndFd0lvOWZoUDAvQVQvZjZuaGw3M3p1YlMr?=
 =?utf-8?B?cjdXM3IyOHpSZjU1cTA4YnFVRHRZWEEwbkY0ZkJSWkRiZGt5dHdqQ1JJRk92?=
 =?utf-8?B?S3dtV280aE5sQUFaSElPYUFkb0RyY3ExQVJnaVRCK3BzRVRkVG1yUVJFWmxL?=
 =?utf-8?B?SXFuU3N4WXF2RktjN3RjdVZTbE9SUkVxVnp1MHNuT3NEdzRaL3lGV3U5NzdK?=
 =?utf-8?B?K29iOTMvTnJDVk5MQ2lBRDk2MWY1bm0zVFloUncyaWR1dUwzV3NUWEJVbDc3?=
 =?utf-8?B?aXE5Ui90aC9Bbnp0OUd5VmdTR3dTa3QzY0pWTzg4V3U2V1lJTzBYSjIyaVlC?=
 =?utf-8?B?VnZYb2JrTmU3WU1udHc4dWw4TVhNK2UyeVozelRDc0hIeDJOZmRpOGVscnhV?=
 =?utf-8?B?WVhzdEhvOWRtSGpSd3NNWlpNYk04bmJ0NEgwZlBMeFhTN0o2M0dVOEp5dVI0?=
 =?utf-8?B?NDlZdCtmZlZHZ3phU0ptT29RLzBMVDBFU2E2cFB5OFFNbCtNNldSL1piczFV?=
 =?utf-8?B?cHVyZzBZZ2xxWEhneTB3NGU5SUtuYk45RzJlT2lBSGV6Z0ltenNEZXEzWG9p?=
 =?utf-8?B?cHFCTzZ0dVROb2xUUTJnbUluZkhQdmN2N0pUaWhwMlpmOE9GQnJpNkNsUFFI?=
 =?utf-8?B?RDhLVFJaaFEzaDFNbS9vY3lDZ1k5YUhLME9yL2FPRmtZZHRXTmJtNktBeGRx?=
 =?utf-8?B?TG5DRkRCVzRDVzJqTXNLbEdkYXQ2RjJ5Q1V2M1pMUjg2bE9FbE15MHNqSGdh?=
 =?utf-8?B?OER2QTgyTDlpdEtoZitrK2UwODJ2ZTNCY2xmSS9Pa1lYU2gzdytKRklDNmk4?=
 =?utf-8?Q?28wKRXTWQq307jgvCebTBu8nz?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: acaa1407-176d-4b9b-442c-08dd5c73a5fa
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2025 05:56:33.5113 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2wzS3oqKvyYXLZmDHFjHy6MYLNWr0LlQk+cmCSWoFUcZHb4hnQHFzajo45Bv/DTh31DHh4Ol1rf+bjIROWNoeA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR04MB7270
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

On 03/04/2025, Maxime Ripard wrote:
> On Tue, Mar 04, 2025 at 06:15:29PM +0800, Liu Ying wrote:
>> A DPI color encoder, as a simple display bridge, converts input DPI color
>> coding to output DPI color coding, like Adafruit Kippah DPI hat[1] which
>> converts input 18-bit pixel data to 24-bit pixel data(with 2 low padding
>> bits in every color component though). Add the DPI color encoder support
>> in the simple bridge driver.
>>
>> [1] https://learn.adafruit.com/adafruit-dpi-display-kippah-ttl-tft/downloads
>>
>> Signed-off-by: Liu Ying <victor.liu@nxp.com>
>> ---
>>  drivers/gpu/drm/bridge/simple-bridge.c | 104 ++++++++++++++++++++++++-
>>  1 file changed, 102 insertions(+), 2 deletions(-)
> 
> Same thing, I think it's easy enough to write a transparent bridge to
> just put it into another driver.

I chose to touch this driver just because it seems that this DPI color
encoder fits the description of simple-bridge.yaml:

-8<-
description: |
  This binding supports transparent non-programmable bridges that don't
  require any configuration, with a single input and a single output.
-8<-

Anyway, if you think another driver is really needed and DT maintainers
accept to document this DPI color encoder, I may try to write one.

> 
> Maxime

-- 
Regards,
Liu Ying
