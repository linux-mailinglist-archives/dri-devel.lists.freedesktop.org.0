Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 858C38D3167
	for <lists+dri-devel@lfdr.de>; Wed, 29 May 2024 10:32:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0621010E510;
	Wed, 29 May 2024 08:32:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="F7CKCbKz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 (mail-am7eur03on2041.outbound.protection.outlook.com [40.107.105.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F152610E510
 for <dri-devel@lists.freedesktop.org>; Wed, 29 May 2024 08:32:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FtKQeF2rL8DboGoP/F/zxr9EisMKqg7YxXZWA6851rwdqt4ffqP5qgdPxBbkDeqE0UipUUTyFVuVo1NZNdhzME9jH1G8M8WZaXA6tAsNz42o2EkjicNtPsBzAbzCv2SsXwSiXKgJIS+oRWJUxXg0pfj2v/gMFdMk5ZiMhgTUinh2X/UfEXxwsLyZ7/re9zoykUGGFIus/hUsIWIoCihNiTsCg7WP1KWOpZZYxty6pr++jM00ZY/xPxwN75tpz/3PzObZxNZX0lb2NpxxuragDpoeNdHiVJ+i3WwgA8BLxKkQlDG2O9UrdOD/suijv1Ian+/wa4nRebalLgJAFyPzlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jEQCEyNLHr2CFfUmjjBnn+Zmv894QYFViBKWTShijz0=;
 b=J8hh7Iu0WEArl34XKf9F/OlfirIeoKQp9NG7GF3NMoGzwHsP/2rdcSm2NCWEeB04L21yO5/rL3GXi7o4EiECCfNBNwNLBiZAAvlqXCrteydaeCIu4NVEXZzoS+fl+lcs49kYwBzA0MCziKY6EUCk4Xh2n9Xz8lZ9fIr5apLwb/OsbDiTYyk3uqzaFuUYNZ3iW0GY9cDlYxUI/l5PWg+Dd5eB+eEb09ooSISH82BeJg/FgxkWbDGv1OdhuBA+t9uTmLvt5QNm7wOLQCzHGjSEJKjfePbzjeT0AJT+E6nz0G9ftf356nGy77zwOfLlDiMsHFIMA20WLeQ6TAN5/8bCbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jEQCEyNLHr2CFfUmjjBnn+Zmv894QYFViBKWTShijz0=;
 b=F7CKCbKzbuoKK1UdQwdnAyB3biSdpp89OeXfHGN5pGvSkxSOH9+hfrQyFd/fisi25weYEZAaDjgPtKqZWM+vuy90SaK0E5Y9dNxDujL5d/hUW42Y3WBObIRPGz7a4szmRCAcjQMo4lUJtRZfPcaQgD2tB/Y3zQkLPLg68XoxXKM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by AM9PR04MB7538.eurprd04.prod.outlook.com (2603:10a6:20b:2d8::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.19; Wed, 29 May
 2024 08:32:13 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90%6]) with mapi id 15.20.7611.030; Wed, 29 May 2024
 08:32:13 +0000
Message-ID: <cc553f61-e494-45c0-84e9-8a0e275ba416@nxp.com>
Date: Wed, 29 May 2024 16:32:31 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/1] drm/bridge: imx93-mipi-dsi: Use dev_err_probe
To: Alexander Stein <alexander.stein@ew.tq-group.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>
Cc: dri-devel@lists.freedesktop.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20240529065400.461633-1-alexander.stein@ew.tq-group.com>
 <091f1d5c-0bff-4dcb-b823-b82989eac628@nxp.com> <6130653.lOV4Wx5bFT@steina-w>
From: Liu Ying <victor.liu@nxp.com>
Content-Language: en-US
In-Reply-To: <6130653.lOV4Wx5bFT@steina-w>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SG2PR06CA0181.apcprd06.prod.outlook.com (2603:1096:4:1::13)
 To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|AM9PR04MB7538:EE_
X-MS-Office365-Filtering-Correlation-Id: 21a0f475-ce64-454f-2f4d-08dc7fb9d6fa
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230031|376005|7416005|366007|1800799015|921011; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?L015Zks3Y1pxSEZmOXRsdjZOZll6aEpPcWV5UTVkSFprOTM3MHBnblpHN3pZ?=
 =?utf-8?B?ckJST3lZOFc0UDhNaUErMGtmZ1NhdC9xMTBjR1k3UWlSQ3k1VjU4RmpaMjZa?=
 =?utf-8?B?bFE0aENrR0tQTGxTRnBjS2ZkSGN1ZTZLakVOWlhOUXpHdE1IQU5kVXhuV1dB?=
 =?utf-8?B?MXk2VGpCU2p4U2V4YUtCaldSb29BRzQ2VDFYN3NVS2c1TFlPV2JnaEMwbWJL?=
 =?utf-8?B?Nmp0OWppT3V5K081TDgyVVZNSFB0RHB1ZmFEa1Jpb0dNZk53ak50Y1ZiYlBH?=
 =?utf-8?B?RU1GN2E3cWhCRkg5TzlaQUxyM0Z3bS9tUnBPSEZlNWFvVEx2c1RFb2NNYUVp?=
 =?utf-8?B?bTlXcTJnS1JBNDY0Qnl6elAwTUlFQzhYYnNSTzRFNUhhOURzMFNWRDdPRXRj?=
 =?utf-8?B?QjdVZ1FmMUk5Q1VUL29vZ2l5ZlArc1VyZkVLdDBidXpZM0h4QW8zTjN4MUww?=
 =?utf-8?B?OFU4U3RhUzJzYXVoUS85Y0EwQ0pDYVJTRFo5RjQyTnJoN1MwcVhTR3Q0OVdG?=
 =?utf-8?B?elFDVFlaT0hiM1VmSForRythT01aY2pRa2h0VXhnVjE5MHZoYTVmbWlxQ2Jp?=
 =?utf-8?B?S2pyaGd3NE5jVmMyUEo5Tzh0U0x3VjNFVkZKdXVrUENVWlh1QktWMzNQS0Yw?=
 =?utf-8?B?L1EvSDNkMlJVR1R5VjE2WE9KWk92Z084WVlTclgrQmNEQmdMWU5uaDJuRkp6?=
 =?utf-8?B?clBTb04xZGtNQm45Qll3STB6Z2RwdGRqQTlFVXU4WW5La0JPckNGU3dzN29s?=
 =?utf-8?B?NnFaWEE2YlltTUFDbkNxRHlJcDJIU3ZPeWpZZFphMmQ0Sy9HRHQ3c0FWa0pB?=
 =?utf-8?B?VVIwNTBaZkhPMUliQ1JlcVFUNHNudHRVQys3aHExVjZTYWR4VDRWbDYyRVJO?=
 =?utf-8?B?OEQvd0JYODdlVTBNTTlZRVc4RGZDN1VlWjd1WGVwU2FRb0paY2ozaExpMXhD?=
 =?utf-8?B?QVgxK2t5WWVySk5HcWRmTjdtZzVodm5SWmZWMzNHV3I1RFFzME0yVGRkVWVa?=
 =?utf-8?B?Rm1LNFhadk14WFdHdVhGa0IzaGl1aE9aTGhqVy90WjA2RTBON1NOdUNsQWVx?=
 =?utf-8?B?U1gzUVFyZW9MMndvZGxFdmcrVlFBS0IrMEpDSVN6K2hYVFp5bmRhdzFkdFA1?=
 =?utf-8?B?SkN2a1hFM0N2bHNaVWpUNzhTMktZMWd2RVhrYmZSNWN4VnorU05EUTdQYXBB?=
 =?utf-8?B?a3h1OEdrdU1WU3BQc3pGYkVkcHdoeE90Q1I4RnNSOUQrZ1R1WE9hUHZKRFB1?=
 =?utf-8?B?MDVpYnIzNlJoUVlVekV2VXAxdlJldlMwaURXWnBVb0VuMmltY1BVc01JbzFk?=
 =?utf-8?B?WGE2WHM1Qlpad3V0TjcrVTZXUDhFbkphaGpOaFhRaEZsNGZnZFJ5TE1PZkEw?=
 =?utf-8?B?Mk94TC9wT0RINW5vTkhqUGNYMzZjVkV6VVNFd2tPM0NEeFc0c1hSQk5ON3Rm?=
 =?utf-8?B?ZUZxem1IaFBweFNqUUdPS1F6dkJaSTBwT0U2dEtTY3IwQ0FhNU4yY011b3Zl?=
 =?utf-8?B?RkVWcTBld0hhWExGREZjL3BWYjlxeFJDbzA0KzFicFJSd2h5WHYvdmNEVytL?=
 =?utf-8?B?VjMxaXFXMDBXTVRrSjRacTBXZUZDNmJYQUJpQS9DZzFaUXB3QmI3T0toNW1O?=
 =?utf-8?B?dk1rN1dmbkdNQ3NPUmNHR3B2NTYvUmV5Y1A0di84clR3MmNBUFp6RlpaR3lS?=
 =?utf-8?B?Zk1lYTQzMWhoU3JZMFZDelErS2p2UEIwaE55K2Nrai90enlmWk1jaE9sWVlh?=
 =?utf-8?Q?BGmiPXdS0WoMDh2drRlvN7lm6d3nO0TrNUTKWqr?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(7416005)(366007)(1800799015)(921011); DIR:OUT; SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bHQ0MkZVS2dLMW5neERIUGI1YUxiNnhsWWVFRE9jUWl5eXBScDJBUjFHLzht?=
 =?utf-8?B?ZU1wMVUzb25qb2hKNzAyUEdldldIZGo5aVBnYU9zZXloUW16RDRCREpMaHE3?=
 =?utf-8?B?b0J4T1NVNVBPUlFpY0pDZ2JIQVlQTmpnS0paNDljUDJrOHFjd1hZV28xak1P?=
 =?utf-8?B?SVpWV09pelM3NmR3S3d0UGFuSG1KVUFrclJZdm1nejR4djBKVWQxMEU0SEdv?=
 =?utf-8?B?NG9OTXluMW1JSHc4ZzA4dFM1bU5Da3JzMzZIaWZpZTVBS0QvU3Z5ZEp1RDg2?=
 =?utf-8?B?M204UDB0SlIvRXZzSHEvOUM3OStJTmZpSVIwWjZsL0JxcWtQNENTUnk0SUZC?=
 =?utf-8?B?c3cwTDZteXU3MXdMeWI0MHNEQW51cVVpdzVLRkIrNEEyMWMrd2RibVZvK3Q3?=
 =?utf-8?B?Q3oxVlMzZ24ydm1RNTJscDU1VGRCVitQYmdhWHRaVDF1eUw5VHprOTE4QnNL?=
 =?utf-8?B?bWlySUZXSmYzaktDUzM5cE5WVUJubjhaUGlSWmFya3c2MEdEeWRYZUhFMm5M?=
 =?utf-8?B?M0RacXVXWHVwVzlqaVV0endqUHJBOWQ3Ykd6cW1NMHJzZE9mN0JpN1ppbmh4?=
 =?utf-8?B?ejUySW1FMlR4VTR2Y0ZlcFgwemlUZDZ1a2ZpWThsTVI2dEwwdmhhZ003T2V1?=
 =?utf-8?B?UGp5N1RndFliMDBJeXRXd2hOdFhzbldON1p6WHFjK1MwbDlXOVE4M3Q1Q3B4?=
 =?utf-8?B?OThObHUyYnYrYm5rUDRuTGFsRTdMeFhWWWVFMVhLbXV5MnduRlkrM2VPcElr?=
 =?utf-8?B?U3NkbkUxamRCd0JiRmV4QmRaZytLVUdLcyt2aFVvS1lCc1VtRDhmbkdlMWpw?=
 =?utf-8?B?dWhrY1dJRmRybHovMlN1Mi9QOUplUVhPUUpPYTVVM3ZKWGxob1VsR1AyR1d3?=
 =?utf-8?B?YnRxTllsVnN3YzZIVHNIS05CQWtRWkR0cS9oOWxjSWNJenFBRWVucERESTdH?=
 =?utf-8?B?c0FDd1I2NkNXZlZZRWpFaWttYmRhOHVuVVlMZFR0N3ZHeDYzdzdOWHBySUc2?=
 =?utf-8?B?NEo3SWFIRVNzNEtmT0VISWJVbDhWbEpWU0xIRjlUaTJ5ejBHNUwzTEpvK0Rt?=
 =?utf-8?B?eDVnSkFZYkdlOTUrdGREN1V3Y3BlWGVVUUtucXltcFBlTjZ0ZUlVYlExSTh1?=
 =?utf-8?B?M0xkK1Fna2VKZ0ZVV3ZKNUI4QlIrUldHcXgvRUlnb0pNWTlmTGtFT21ac2x6?=
 =?utf-8?B?K1ptNVNOT05Od2JFL2huZ3I0aFJtaURIelB4Lys1UTV2YlNEMGNUT1M2dzV6?=
 =?utf-8?B?UnF0QS9LVlZ3WW5xRm53NzNaKzRJQjVHaG1PTnRyanFtMnl1eHBXME1rL28v?=
 =?utf-8?B?NUhzZ3QrUlhGNU9GTE9veGxXQytjRHJDZm5EWDZHM2FFcDQyTDlwT1lNTGYz?=
 =?utf-8?B?QmtudjZDd0hXSjJEY3NESHVZR3czaTlIOXkvMDVZdUx4SEFUNHkyUkJmRThM?=
 =?utf-8?B?VkhVVlBjS2xKVElBTkd3ejdtVHVMUXpFVzl2eUdORGNJMUZoanR1RStwZnBw?=
 =?utf-8?B?U2x3YTcrU1ZWUDFsZG0rZHh5VnA0Vzl6WUl5RFZKNE1YZUJkNTBacGUyMjNQ?=
 =?utf-8?B?azJmdnArUVdnV1RHLzZCUXdXUTdTTXVFMkIvek5NRW9CWGd0cjVBbE1vU25l?=
 =?utf-8?B?RElnaDg2cFNyN1R2dmx3L1NyRyt2TFdWMCtaYjZmQVRtZWtabHM5S3lTUC9G?=
 =?utf-8?B?MmtSS2J5Wkd0VHdSZmFkN3ZaNnhtcm5HTXk5d3pQVUxxV1hjMFlBMk5ZQ1BR?=
 =?utf-8?B?ZGIrNWNNeFRKRktkL2duKzFzWE90WGh2VWt6K2Q3dWZrQTlEOVQ2ZjZtZ1FR?=
 =?utf-8?B?cTd0Ym1PcHBnZWxNOG5iSmtYdU5pNHJEalFoMmRCOTBCVk40UThZMGZRc0wv?=
 =?utf-8?B?dUpqSHFWOVpPYnZKcTMvd1dDcHo1aGFyT05jdUc1M01oMWI0TktMZFlTZW0w?=
 =?utf-8?B?alRETGJ4Y3FYZ0R6b3h4MUtHdFhvSzhzQmN5SzBjM0h3azNFTTRZZHgxbCtl?=
 =?utf-8?B?VlVaUlplU1V1LzFjUmswN0g3N0FoVm9rM3JSbGgzOElUMkh0RThVU1NpUmdS?=
 =?utf-8?B?V0dVVjBxMmllcjFubC8rWjRaSlB4N1d1UlFZUnNXSEpML1pPVDBIOCtTV0Zy?=
 =?utf-8?Q?xOF6z2Um9wkhGydwCkSI+N6iW?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 21a0f475-ce64-454f-2f4d-08dc7fb9d6fa
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 May 2024 08:32:13.5270 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hhyww07zR830reUlA4WYcs35HUaMr1eUf8vU2vIkrK6p4+TAc90rZ3i5Sdca7amkyjQiDoOR8+oA5iU3aKKSOw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB7538
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

On 05/29/2024, Alexander Stein wrote:
> Hi,
> 
> Am Mittwoch, 29. Mai 2024, 09:50:24 CEST schrieb Liu Ying:
>> On 05/29/2024, Alexander Stein wrote:
>>> Although very unlike to occur (media_blk_ctrl needs 'syscon' compatible
>>> removed), it lines up with the other error paths in probe function.
>>
>> Why media_blk_ctrl needs 'syscon' compatible removed?
> 
> No, it does not. As media_blk_ctrl is also used as power-domain the device
> will not even be probed if media_blk_ctrl is not available.
> I just mentioned it under which conditions this error path could happen.

The error path you mentioned returns ERR_PTR(-EINVAL) which
doesn't make sense to use dev_err_probe.  ERR_PTR(-EPROBE_DEFER)
is the one in question.

> 
> Best regards,
> Alexander
> 
>> device_node_get_regmap may return error pointer other than
>> ERR_PTR(-EPROBE_DEFER), like ERR_PTR(-ENOMEM).
>>
>> struct regmap *syscon_node_to_regmap(struct device_node *np)                     
>> {                                                                                
>>         if (!of_device_is_compatible(np, "syscon"))                              
>>                 return ERR_PTR(-EINVAL);                                         
>>                                                                                  
>>         return device_node_get_regmap(np, true);                                 
>> }                                                                                
>> EXPORT_SYMBOL_GPL(syscon_node_to_regmap);
>>
>> Regard,
>> Liu Ying
>>
>>>
>>> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
>>> ---
>>> Changes in v2:
>>> * Removed unused variable
>>> * Added missing \n at end of string
>>>
>>>  drivers/gpu/drm/bridge/imx/imx93-mipi-dsi.c | 9 +++------
>>>  1 file changed, 3 insertions(+), 6 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/bridge/imx/imx93-mipi-dsi.c b/drivers/gpu/drm/bridge/imx/imx93-mipi-dsi.c
>>> index 2347f8dd632f9..13025f47f3902 100644
>>> --- a/drivers/gpu/drm/bridge/imx/imx93-mipi-dsi.c
>>> +++ b/drivers/gpu/drm/bridge/imx/imx93-mipi-dsi.c
>>> @@ -834,18 +834,15 @@ static int imx93_dsi_probe(struct platform_device *pdev)
>>>  	struct device *dev = &pdev->dev;
>>>  	struct device_node *np = dev->of_node;
>>>  	struct imx93_dsi *dsi;
>>> -	int ret;
>>>  
>>>  	dsi = devm_kzalloc(dev, sizeof(*dsi), GFP_KERNEL);
>>>  	if (!dsi)
>>>  		return -ENOMEM;
>>>  
>>>  	dsi->regmap = syscon_regmap_lookup_by_phandle(np, "fsl,media-blk-ctrl");
>>> -	if (IS_ERR(dsi->regmap)) {
>>> -		ret = PTR_ERR(dsi->regmap);
>>> -		dev_err(dev, "failed to get block ctrl regmap: %d\n", ret);
>>> -		return ret;
>>> -	}
>>> +	if (IS_ERR(dsi->regmap))
>>> +		return dev_err_probe(dev, PTR_ERR(dsi->regmap),
>>> +				     "failed to get block ctrl regmap\n");
>>>  
>>>  	dsi->clk_pixel = devm_clk_get(dev, "pix");
>>>  	if (IS_ERR(dsi->clk_pixel))
>>
>>
> 
> 
-- 
Regards,
Liu Ying

