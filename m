Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 32213A0518E
	for <lists+dri-devel@lfdr.de>; Wed,  8 Jan 2025 04:27:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 020E210E0DD;
	Wed,  8 Jan 2025 03:27:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="K5SvnLdO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03on2073.outbound.protection.outlook.com [40.107.104.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6515A10E0DD
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Jan 2025 03:27:12 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OnEiqAk5ynQ3brzwTAubeez2YwMU9S71dxJn4zxJtE8Nuf6660uJB6mjDWEL0UgGFROnfQQPv2wHRUEs0AD9jiJJgHC4ds4b+RbjtsjbUTEnU2cic+7MchVCKHZOGsPXb/R/U+QshdeBVmDP9dyPcmHkqczZvpTN5obaZ//KWaJ2YDFXeLumKV29jvhcAZDvXR9fpicCPGarr6LXwfUTXHqq3lrwz7A4nR3TSwJhPnxiEMCjHMfVf5dgvLkKCs5Ao0rSE9+8RFxiahhCdNPXKSfW7JrCic1XoRsYjSJ58NIq5T8g6gy3R4gsJzyoEbmndxBpfdsj02xcmrVRkmfzXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TsbO4wf2vlJ0I5qOQYj2WyQSbUXynGsiA2eW4zj1Sjo=;
 b=jd/8nzJHfSc08T9XoNaH8c6T1hqVXdxpDNzkO1jm+LjdEr5JLhqRxqchx3a1G+BDFmWhH2TRhSQ7/ujziSt6PCFEaD99D9vb6qBO19Fv22hBrmL8JyeM4abZhEwOBCSS30lcHjhGavnqsN+v2fVeF+fR5n1ad4F0cdn5xjt0MtmZFsys/G7AJOge/XqPlbq7g0gQI5DtQhsNXwY2PrlCU/laLBgWPqIUMpzgxNaIFAvKtgjv4Tiloz4fRMypAHFH8ecXwzicE0WHcw7iGlCwJeFdugaxt+W1QknnJTpmB8FjRRD7XvwgaVq49SjdHQwM2j15FrZ/eEvuK69Yg6Mo7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TsbO4wf2vlJ0I5qOQYj2WyQSbUXynGsiA2eW4zj1Sjo=;
 b=K5SvnLdOaQFVUc8kD5V1fwmS5G315k1P99lutRKY9630ZbSnz9AIY1mh7pgEDqAj9Kc8Am9LvNiWl7bRy2MCL1QB5stEHSaZrbRFlv+gKfbizNXS8+lcDanARHkU7TED94OhBx/rcVc9tnSksOtzhFfwyC9hbpm9QlVpbhKn4p72K/DemHhhFyfREhu7XIfTg1RABHhv++pwwlklijJgiHJyrOIHvVYNI9mmihBppV41cbsDcdXI/Djv5+KxLYkWLgMRY+QOvuCEKK1cWqrVL6Bzu4u+rg9Z6/EqgkyNuQ03oee1BfXD1at/uRHOhK3frsoEYtuv06xaR5zH0CQnIg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by GVXPR04MB11041.eurprd04.prod.outlook.com (2603:10a6:150:218::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.11; Wed, 8 Jan
 2025 03:13:03 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90%4]) with mapi id 15.20.8314.018; Wed, 8 Jan 2025
 03:13:02 +0000
Message-ID: <b3499ec5-c751-4809-82de-9d937fe47c6b@nxp.com>
Date: Wed, 8 Jan 2025 11:13:51 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/4] dev_err_probe usage for imx8qxp DPU pipeline
To: Alexander Stein <alexander.stein@ew.tq-group.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>
Cc: dri-devel@lists.freedesktop.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250107143900.988567-1-alexander.stein@ew.tq-group.com>
From: Liu Ying <victor.liu@nxp.com>
Content-Language: en-US
In-Reply-To: <20250107143900.988567-1-alexander.stein@ew.tq-group.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SG2PR02CA0008.apcprd02.prod.outlook.com
 (2603:1096:3:17::20) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|GVXPR04MB11041:EE_
X-MS-Office365-Filtering-Correlation-Id: 050b81fe-671b-400e-fbbd-08dd2f925c6b
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|7416014|366016|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?T29VamVpTTc1ZFVlREVEQU5zcU1XY0EzN3lSQzFFUnIwVmhKc0ZHWUFmSElj?=
 =?utf-8?B?c0JvbjJWZFFmU1RiTFVic2dIUTZEOVRQOWp2dVhYSVFONDhIalliaHpYRUZU?=
 =?utf-8?B?THhJNzNtZUZ2TG9PZjFhbVBER2Mra24rVk0yUU92cnhxUFhhd0swdFZqSTM1?=
 =?utf-8?B?VUpLR29hcUtrYXNGUDcveTdQbTRjT296OTFHaUlVTFNuYVlRdnU2QjZ4UGJv?=
 =?utf-8?B?a3pSRmt1dk9TNlE3ZkhFQlpXOXFRbW9oaC9yUk5WbU1MK0RwNlhRVWlMcHhS?=
 =?utf-8?B?OUZRSmZyOVN0YzNYTXBQQ2RRR0xFWXBBcm1ZbDBENlNrVFVlckQxcStKWmVV?=
 =?utf-8?B?RTU2SEJNNm9kaVE4eE9lRkdpcXZKdERGcEgydWJpSWp0OWFWUGxCQkJia3V4?=
 =?utf-8?B?WFVIQkE4aXZiMmExMURyeXozeWdvYnl4aDFPSXc1dXZyS29qdnlsRk5iVFNM?=
 =?utf-8?B?YjVwamRaK0gzTTNreURNY09mSFp0bW5vUXJxdzMrZzRncW9zTmJ0REdzZENo?=
 =?utf-8?B?dk5DRE5EeXhhSGVuUHZ3STVXS2VtVk9sS2I1OVBzWWRaSk5DTk5yK21zQTgx?=
 =?utf-8?B?Y1ZjVWx0WDFpWGtrRm9wRnhlTUlVdUlVRkN6SGthbm5TdHpuN0UzSFRMb0RU?=
 =?utf-8?B?WXF4bnNBVm43Y1JiUlFpVERlNUM4bCtXR1BXa0lBUWE1dXduSXpmNkZ1SjZU?=
 =?utf-8?B?SHFUR21IeWYzbHExTWhtdlJWelQ1WENiSjFnNUdPMWIzajBhSTRrRytySE1a?=
 =?utf-8?B?bnlBRzIvdnZCNjFoQTBxSE45WUVZR0VLNjBEUmpxeitDM21Ga3pIcTVHcWhi?=
 =?utf-8?B?cWJ1MHRlckVjdG9SYWF1NERoaEJidjcvYmRsTVlWM3Z4TVFjZzF6eDUweHV3?=
 =?utf-8?B?VWNzMkVsdHcvT0NxUzYxZFlxT1ZsU1BSUHd5bG9mdkdYMTIyUHg5Q3JnRE9G?=
 =?utf-8?B?Y21TdGFLdWpQQzhCNW9JYzVlTWhQam1ZQytYckNGRHdLQ0x1aGRhNUdJbGpY?=
 =?utf-8?B?L090Q1NrSUxzTjZXaUF4N3dtNm93Q3hHblBzaTNMblZidXFhTHdQS3BZRFd4?=
 =?utf-8?B?cUhxYnB3YjlrYUh2eGQ3ejMwUHFwTFhzL1ovV2RRaDhOeXBUckprcU1KWlR4?=
 =?utf-8?B?NEt4U1VzZ0NsWmxDVjNOM0pyUjJnQSt3M2dqOFFmNkgxQ1lNRUNWQzI3K0JP?=
 =?utf-8?B?NWE0RlRVcEpVbzk5ZHVEaE9IeUdTTDZWTk9USjk0aWluNjQzNkhjU2h1WGsr?=
 =?utf-8?B?SWpPNHdiRVNUbXlGc2JNMHY0K3lZZHllSEVkVklxSE1CMGxPWk15Z0lGZWxB?=
 =?utf-8?B?azBkQm0zZHRieFlwanFmSnJ5emJWa3JVcUMwb012Uy80cUlHdGJSa0Jtb3VG?=
 =?utf-8?B?TlBhM3VRUy9aeWdabUdqVEk1L0NEYjdkVStNTFJzelg5Zy81NHp1UkJtS212?=
 =?utf-8?B?K3dnODRsY2E3Wm5nbmlkeUZTSmNydHhsaW9URkdoeHlwL0Z0OHVKcmREb3Jj?=
 =?utf-8?B?KzRScXVDQitTWEJjN28xWmgxVVRuL3Bnc3hDMnNqWmxZUUVub1U2UU9vYnYz?=
 =?utf-8?B?eUJqMm5nejlQZk1YTEJUM08rTERvR0UweDZVUm5ZUEM0ZnU1dlpXelczL2Nr?=
 =?utf-8?B?OGVRL0gwNkxPa3hZOWl0UHN4OTlDTkhubUxrYk1LT0g2elRmQ25uQ2dkc2FB?=
 =?utf-8?B?akRhVmtxOW43d1pUeVQ5YzJjeW16dWc5dnZ4SmRIKzNiMGVZMjBZdHNDVXNl?=
 =?utf-8?B?N2lWR0M1ZWxYK1JqWTZwR3RUV3B5dXJMUEhpeFFvU2U1VG1rMVBEcmFRNUda?=
 =?utf-8?B?WGFEL000aFIwUytLUHllbmhZR2tHUG9qckZUZkc4RlB6RERkdDY5NXNMeUFa?=
 =?utf-8?B?a01wY2ZVckFxc1NaTzBLZDVlVFIxNzRIV2ozdXZySVVBMmJhVGtxaVhNWW0y?=
 =?utf-8?Q?BQOId3Mu520=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(7416014)(366016)(921020); DIR:OUT; SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Smp1TkdzMS9UL0MzUTFibm9iazVnK0dwbXFWQVlvdDNBZWtHcHc4NFNNUzhp?=
 =?utf-8?B?VkJrU2h4b2RmQXJKOWtBUWVzdEpKenlyWE9SajhJazdWWlhaN1F4TG9mT2lG?=
 =?utf-8?B?TldTVnFhckpiWlRxNUVxWEpUS2ZRYWpCNjlqNmZuY2h3bFBXVjNXdUx6aWlT?=
 =?utf-8?B?bUU4aG83OFh6TVM1S1lBZmJPaHplL3V2M0hPdExISWoxTy9HaE12RVkwNmk5?=
 =?utf-8?B?bFEvbFVlc1drd3hSSlN6azBVUlBlUnUzeWZVUW00a0E4OGdNUHRrNUlxdDZk?=
 =?utf-8?B?cWhWKzVnUlF3Q2pHQnpJVlVIV2RDVHczMmEvYXc0ZGtTeWRSS1U4VS9mdmJN?=
 =?utf-8?B?VWhsVW4ySUFYVG56QlQ4TnVOSnFXM01kYXZyUkFDRkxQcTVEMmhjRlR0NVp1?=
 =?utf-8?B?aUo4TGNDSWRvYW5MaVZ0WWxKOG9lU29oSXFjYmdSQXJYcmZydnBiYnVCNVoz?=
 =?utf-8?B?eDYwMnpHbGpuNVVjV1E0MXZkd0FpTGpkVmJpQ25JQUxIRWFZNWEvcTFQZTUw?=
 =?utf-8?B?Ympsb0hOMHc3emdQR1lucE8rZ3hwS2dGenhaWGFoK09NQWN5OUY4UUtLSSs2?=
 =?utf-8?B?VHlwZ0lXMWZ6aktPMHBUY05nMlgyTG9kSEg0MG0wMnhySWthTVlJYUFyRkwy?=
 =?utf-8?B?ZGxQWm1XMXZkNVBqM0NOWCs3WjNQS21nTWdZK1B2a0hMdmFRUEJNeXpUMWk3?=
 =?utf-8?B?NlE3VlhTa3puaVU0UVhkSFBRSERaUlFhaHRhZkxoTjZBZkk5d0twLzJRN05q?=
 =?utf-8?B?c0grb2JkaE9CMXlhR01sTjBJVmhHa3ZZTFhVWU9pekxRMWhIWmtTK0lMTFBL?=
 =?utf-8?B?VkZyc0dRZjloc09WVm9nMW5EWVgvQjFvNnYxV0xubTFaUzJMVGdyTEdjeHp5?=
 =?utf-8?B?eU9aNnhzVDc3UGljK1FKV211Z0lIcHNHeThkUHFoejhaRVhpN2hVRUNGa0Rl?=
 =?utf-8?B?ek1IOXZMSkZ1TjRiaFRqaVV2T3Y1dGN0SmNKUWFWQlBPaUUrbXFhMXlPTnhz?=
 =?utf-8?B?N2VXSHNQeERuUzI1TzlxeGN0VGk0SGF0bXhzODFSOFJLZGtvZzdPV2xzelZn?=
 =?utf-8?B?MHBzdnFKNmNPVXFVQ2pvNmxWSUk2RlRjVUdXRlozLyszTm5vR3RzbFllSFRD?=
 =?utf-8?B?RENlL2pvd0JkamQxUUVXYlJCODJVNHhxbGN6eUx4Y1lPSzZ2SkpWbUtZTjFM?=
 =?utf-8?B?NDhuYlEzZmZiNFRiTkFXUGFMQ2ZQZnczcnRGV2FFOGtIeWhZN2xLMHlFbjFx?=
 =?utf-8?B?VjFIUFNVUGRHVmdVZGMzZ21mbzdiRVVNVWhPejZGQjg3dHZqc2FDaG9RVXdF?=
 =?utf-8?B?OVkvVHZzOWtzK01wYUdCd0wvemNOZDk0UUgrc01zVU1QVE5aZm8yRFNvN25B?=
 =?utf-8?B?ZzVyRitqN3VRV0NFSm9qRGJmN3ViQnloa1RZbXYxajE2U2pwbzA5enJvNU15?=
 =?utf-8?B?bE53UndVZ0tFMWYwTFhpZEcxeWgwOURJUUh6MTVzd05NVG1LRVgrdUVWTXgr?=
 =?utf-8?B?K1NXdVU5aVl6QVpsNVNZZWpLSXZaZWo3SWZvUGR4dkY1cVhiMnJ5MVE1dU5W?=
 =?utf-8?B?MWd6dXZDVkxnQmt1c0dJVEIwbzVxbXZCd1NDU0ZqbWdLUGVDVm44OHBGazNR?=
 =?utf-8?B?TC9JREpEMjYrd01qUVNJWHRrT3ZKT0cyZHpadVlleWZtQW1OMGJ5U1N0WUZa?=
 =?utf-8?B?aUx2RUFCWm5hQmdFazdFRlVPRi9XSjdubGdodUZIb0lHTFNuU2xvUjhwMWFQ?=
 =?utf-8?B?YnNZTFFZNFQ2WDJ2QTYyL3NVVTBnVGVjRTducVE0Tkl6eklSZmk3N0xoSjJL?=
 =?utf-8?B?OVBRbGFVNlI2c0xhQVl3djdHWitDSkZscnBLaHp2MDB5WmdveUVNYlZoMERU?=
 =?utf-8?B?VXhzdTEvY0I3OHgzVG1VSkhBeGlTcDhHTVA0dkNWWlUxZzM5QVlLVmpaN3NT?=
 =?utf-8?B?N09mQ0kxVy9Tcks4alVpVlo2c3dnVldnVmFqQkhOSGdDQVpTMENxK0VCa0Fx?=
 =?utf-8?B?MHBIZjlZdlh0ek9rMll2MStVbTJhZmR1RHZRblZiTkoyeVlXeXJIdFI3Nk1T?=
 =?utf-8?B?VW9BQkFTOHVaVlBlbGFyNzhtbkVBdEtMOURLYXNVQmliSG8wYkhGM0w5R283?=
 =?utf-8?Q?UYti5rZhZMJwivaX7Dwol3/1r?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 050b81fe-671b-400e-fbbd-08dd2f925c6b
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jan 2025 03:13:02.1831 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: i2UcPOSbuywctFtCDiJgUGSKg6DIbdx1tMbmeE7DsYDLqmizdq4e7i/aSml2V9KdCe8tfOVQwzTyEfiYEBoDbw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB11041
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

On 01/07/2025, Alexander Stein wrote:
> Hi everyone,

Hi Alexander,

> 
> this is a v2 of an old series still in my queue.
> 
> Changes in v2:
> * Rebase to next-20250107
> * Remove 'imx' prefix for commit subject in patch 2 & 3
> 
> Best regards,
> Alexander
> 
> Alexander Stein (4):
>   drm/bridge: imx8qxp-pxl2dpi: Use dev_err_probe
>   drm/bridge: imx8qxp-ldb: Use dev_err_probe
>   drm/bridge: imx-ldb-helper: Use dev_err_probe
>   drm/bridge: imx8qxp-pixel-link: Use dev_err_probe

i.MX8QXP Pixel Combiner is also in the pipeline, so imx8qxp-pixel-combiner.c
needs to be changed.

To achieve consistent log upon probe deferral, i.MX8QM LDB bridge driver
imx8qm-ldb.c needs to be changed too, but it can be done with a separate patch.

> 
>  drivers/gpu/drm/bridge/imx/imx-ldb-helper.c   | 13 ++-----
>  drivers/gpu/drm/bridge/imx/imx8qxp-ldb.c      | 37 ++++++-------------
>  .../gpu/drm/bridge/imx/imx8qxp-pixel-link.c   | 19 +++-------
>  drivers/gpu/drm/bridge/imx/imx8qxp-pxl2dpi.c  | 26 ++++---------
>  4 files changed, 29 insertions(+), 66 deletions(-)
> 

-- 
Regards,
Liu Ying
