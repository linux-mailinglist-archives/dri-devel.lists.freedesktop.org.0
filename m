Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 09972B1C3A0
	for <lists+dri-devel@lfdr.de>; Wed,  6 Aug 2025 11:44:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 423D310E106;
	Wed,  6 Aug 2025 09:44:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="Gt5jVV6r";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from GVXPR05CU001.outbound.protection.outlook.com
 (mail-swedencentralazon11013066.outbound.protection.outlook.com
 [52.101.83.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1324210E106
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Aug 2025 09:44:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qZ4evwtLRqzxr0SDx867INlyV+vI6J1qhIr4r/ZyXZ/7Uvi24WfINVEbNw8XS+oGWJOLVFgIPUWFf7mS1pq9KrsZKyotrXrfw8jmw7eQPAW4envEErRpPduqg+4z8DFv57nXGPOwWGl8n5yzpCLRAaZasL663VZNqJfkpV2jr2iPnkb9LAxaCBRcSIkCjDFTO6OfPP4CCe/l463y3qPrXwsQRx44xQGFQmLF7Sf/a/qRPk7Qlu2U8NDQivy5rX6dY4F/o1dWCcNN5NNX3ZxNbrs8BFS2mwNeJv6w+usWBP9yaLzK4SgUq0T6i9+TfUOfUHQKCVkUtglsQdEpgivnpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mGOhOI01oNLFuDEbUzjTN66V++HxguiPgsr9k4dwn70=;
 b=ZCFpnOF/jSo8dMpiMp/6B1jOQOnBxRlOeeR1CbL/145xumyApgiVQIXJIbwBBztVSTbW89G6wxG2YIHfC4zdfHDHkMRy2DQJMhkMpxZQlJDgx6eClskSSdz+lOcOXf+Bjna0KDlzmZrhaDDg8ae4ZTnI3arU3HvKl8jaDij2I6JuJpfdbwlWC91yzUNsbiFuYahfZZJaRbKjyf5x1NzFnUXCUR81c5Yq+pgvE3YfxpX6yK8gVb4Aas2AX/cWO0zHs6Bk72wkENyrrgpuxHrRIOlnzlP/KpONA8cfm1foLIDjPyiGs7QwLefoTknILeH65rnkBJm4xvYS4jJO7fLOrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mGOhOI01oNLFuDEbUzjTN66V++HxguiPgsr9k4dwn70=;
 b=Gt5jVV6rJ031fV9NdTRKPhJxrWAW3BA5EO19FOlA3ZWRRjefzRlSYKTHmC7VfNpR5gLCCysji9SJ+HJNz+7C/oMMHm58RVjzdCbYpCCN0OuxxaD91NgLeYg4TZtXkv2vOGsfIQsKSQX3YcgZ9v716jLj6CH4qBgnXoL5D0fmkOcuQv7yWWv8ZYX8LgYAhxSkon0KbD2Dcpaie4hOkbsms7SNIvE3rWmTcAATDHJgznvmQPwqyMx9YyVzI14VWqTLmgAF4+TFMc2u5dFJZa6WvN4vaoP64F64Vq/IS4UCFpSu5HiVGCdWyuVKa0Q2eJSdv/GG6za1BWpWH3yL+Ys7Tw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by DB9PR04MB8314.eurprd04.prod.outlook.com (2603:10a6:10:249::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.14; Wed, 6 Aug
 2025 09:44:41 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90%5]) with mapi id 15.20.9009.013; Wed, 6 Aug 2025
 09:44:41 +0000
Message-ID: <8e4d3373-b55e-4541-9ca3-030a4153d0bd@nxp.com>
Date: Wed, 6 Aug 2025 17:46:13 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/bridge: analogix_dp: Fix bailout for
 devm_drm_bridge_alloc()
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
 dmitry.baryshkov@oss.qualcomm.com, dianders@chromium.org,
 damon.ding@rock-chips.com, m.szyprowski@samsung.com
References: <20250806085424.518274-1-victor.liu@nxp.com>
 <20250806112641.7af982e3@booty>
 <b5556cbe-76ed-4ddd-9b76-5896c2e1520c@nxp.com>
 <20250806114150.57e1ad97@booty>
From: Liu Ying <victor.liu@nxp.com>
Content-Language: en-US
In-Reply-To: <20250806114150.57e1ad97@booty>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI1PR02CA0032.apcprd02.prod.outlook.com
 (2603:1096:4:1f6::12) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|DB9PR04MB8314:EE_
X-MS-Office365-Filtering-Correlation-Id: 3fc7ede8-7017-4b3d-5019-08ddd4cdddb8
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|19092799006|7416014|376014|1800799024; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZG0wNHl1dFhSQmFIVU1GYWRON2RFUnp4M2Q5SFVtTHRONzJ2aDViRk9SL3Mx?=
 =?utf-8?B?Y3RnTklPRk4zOVkxV21NanY4TUdkamY4N3laUTN5bklVTzhGc2ZrVTFoekJw?=
 =?utf-8?B?bkV1TTRtQ2huMnBLbFFUelRhbWFNWFk4MGRPMktqajFIZGV3bVdKZi9ZT2xD?=
 =?utf-8?B?Zm94YzRUTTJyWGUxWmtLdmtaR2kvcWhram9UZVJHN3l2bXkrZGVBelFWM0JQ?=
 =?utf-8?B?UUE0QXFSczdWbmd0Sk8zbUZHZ0s0SVZJNU85YnU0ZktKODdrbnZBQ2RXQlFo?=
 =?utf-8?B?alhWaFV4ZEEzRERNM2ZNR3lPOHFiQVd5ejNZM25td2lxZnZ6TVRZbTlRR0Zs?=
 =?utf-8?B?WFpPejB2NTR4WlVEY3lXeUhTRXNLdktXb1lNVVEvT0lYczgvM0tMenR3NjNV?=
 =?utf-8?B?amtuLzlLL3U3TWVuZlhwNnN3bnVwWmplOFlKUnp4NXByTGZRSmZnZXJKZjdj?=
 =?utf-8?B?MHp5cDZEeG1KZlpFOWQvdEZzWlBXMGM2Tm9wT3lqTzV2dWZOdmxHbFhueDBO?=
 =?utf-8?B?SHhnd3BZenZEK0IxVHJtZ3BESjEyc28yWE1La0VrcHRqdVNCK3lqOHpFV3lR?=
 =?utf-8?B?SlZ2ZG5UeC9lYWRIVWdpeXV5SWJzS2JPL0pDRzhBcDFMcEx6bkU0NVQ5eWhm?=
 =?utf-8?B?cnJvdVFGYXoveDB5T3Rxc1k4MVlZdU81MWE0U2pPS2pHSzNiNHF2VWZoRWN2?=
 =?utf-8?B?WHk4cUFrRG9QYzRQSWVNNmdENU1VNUsrNWM3ZnpzQmZZaVRuZThPQmtTR2Z5?=
 =?utf-8?B?WWJjRzNIcTJhOUx6R2orMyttOTZERXgzcW1ES3JhRXZ3NUtBc3BQZ3BKMVpU?=
 =?utf-8?B?TEovWCs1Z25yWnExbmFLRnFpVVFCWGVzbS8rVCticzdXWmVFUE5JMXE0NUJs?=
 =?utf-8?B?bmhmeHpYRU1NSVBPbDVJYUprQTZueWJ2cFhwYjNqY1B2Y3dPU2l5Z2hGaG5Q?=
 =?utf-8?B?YXJJTXQwYlFYbVd5UGo3VTU0b1FpdXo5dHl4OTRsV1pWQ0FwQSt3OGxrYVNy?=
 =?utf-8?B?M2dLZXVKYkV1Vm8xQ2RadDk5aElZOGtGZzZWNXZEazBBU2NLYkJFYlRoWkdZ?=
 =?utf-8?B?b3EyVnU2K2R0aU9EVkkyNnZ6NGpQbG9tU1plMDZWcEsvcWJoTkJNeUlER21U?=
 =?utf-8?B?TG41bkpxR1BKN045MlIvOC9WQVN0N1c4ZHVCLzJQVVpWdFdWbU05UUt1SVB5?=
 =?utf-8?B?TUZBNUlBalkrMEE1S1c3bkRlZ2tkb2NNQm1JRVdNRVViTUxtNWdoeG5jVW5m?=
 =?utf-8?B?M0xWTitvMXhpYkU3eS9ZalNLTXRubUxjY2paSXUrTHhSYktlYno4Z3dhMy9P?=
 =?utf-8?B?RTdFRUM4TUVoZ1l2YUZYMHVvdmlxSDNkUElicVN0OFhMcGFkTWpXamR1TDl5?=
 =?utf-8?B?V05DQWtNbmlGelV0amNhRkRQM2l6Q1dSUGRHN2k5T05xak9aNzhFclZFN2Ix?=
 =?utf-8?B?R0VqU0p4TkdNMm1yRFpyYTB3QmpwU0RwN0lpalRzZEhTVjV3VUwrTENZV2VR?=
 =?utf-8?B?dTIwenNLQ1ZCclBIS2lWRi9rSGI2RXpzT0kvY3ZSRXladG9JU0hvSnUwMnRP?=
 =?utf-8?B?OEhDNW9FZmY5V1QveHJjc3Urclo0bEdkYWRUWnF4ZFowYlVOZWNwaGQzVmJH?=
 =?utf-8?B?UUhLTFhVNCsyMzErNzlodStGNjFsZTRHc1NXTG16TWRuTHZZckV5V1pDRjZT?=
 =?utf-8?B?MXVkei9UTVhOZU5rU2doRFUrc0owM1hnQklWdUdxVVp6NCtmdzM0R1BQQTlE?=
 =?utf-8?B?M29vYnhFWjVnTlBlaDQ1SDljaktFSDhITW90QkRNZ3ZnUmp4a2dIVnE2VjlZ?=
 =?utf-8?B?NmN4KzBnRzh2U0hmOW1obUd0Z2NzbU9mUWQ2ZUJ2ekM3NFplUkdqNlc1enlX?=
 =?utf-8?B?QStmMHJkaUhrdlBxYUtCdzNMWEtPZ3piNGxlMDA4TnFod2szdnd5bDhGYk41?=
 =?utf-8?Q?EpChV7ruEBQ=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(19092799006)(7416014)(376014)(1800799024); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cS9xclVMbC9vc0V5NXgxQ0szZW9TQWVjcmJNVDZlRXlXRnFBbW92ZEhyc3F3?=
 =?utf-8?B?bjVmMEEya1BHRWp2UHVaUGQ1OGM0S0NvM2NsMGlKMFRuU0E2dVFyaitidmc3?=
 =?utf-8?B?UzNDVE1MNjhiOGNORFVER2ZuUGh3d2Yrbm9sM2FFZjFQL1ZPQVczVnU2MXJm?=
 =?utf-8?B?eUlzTkpOc2lEY0RNMDZnSDZPSi9KeWk4c0lDTzJIRFdnNlF5MkdkT3pEM1ZC?=
 =?utf-8?B?NzBPUng1eWZ3M1dGQWl1ZHV3elptNnFXYUxLNllYY1B0dUxkM3VnbVdxWjFH?=
 =?utf-8?B?dEJFYkpmU0VWNmxRQlN3cUk4cnZ3S1k1VGIzR082T2ovZXJoSFhteGs4YXFF?=
 =?utf-8?B?QUhGQUM2WlB0UXp1RkJHeDd2ZlVGNkdTNkFtVk1IOXVPUFRkdFdBT21GN0pR?=
 =?utf-8?B?cFB5Ymp0eW9KQnBHeW9uaEdyRm5GOXE0RWxKSzVCZUx4SWNtaExubVFzcm9M?=
 =?utf-8?B?SHhMWmNFRWw1Q0NHM0lEbkxESTBieFVCV3FHWEliR1JwYmNwb0o5S0I5OExT?=
 =?utf-8?B?TmlTM0s2UUJVdDVLS0lnSWIwd0VWUWUxeGVoSXlnVTBKUEs0UWN5RUVJc2U2?=
 =?utf-8?B?anRzRHpaRUE3QThJck40NEwxY0pGMzF4bkYwdUZrbTBjME1XMCtUVitrWVRq?=
 =?utf-8?B?QjVXZEtFNVN0aGhNUVY4YllBSUJkOGtjdnV2NEd1QTN2NjJRZnlnREpVT3RN?=
 =?utf-8?B?ZG1jQnNVdWoyRjgzK0xLdk5MTG1XUUNEL2hSRTFTd0w0YmRWZXhDQ0RpRXg1?=
 =?utf-8?B?SkRkN09WWGM3UitJbUc3N3pHcjU3VmFUMy9NS1l0dWRkdFAwMi90Nm9wZW0w?=
 =?utf-8?B?cmJDWFhzUi9NeWJGVk9OcDA0eTU1d216YTVYSVhORTNZSEhCbEphb3FHTUpV?=
 =?utf-8?B?aXFHT3FYZXViNm1XZThxYzVDMW5ZV2crcW94NHF1eUxocTZjZ2wyWjE1Mmg1?=
 =?utf-8?B?TWNMTVhNbTFNSW9IcGgyWnVzbm5HYkZFZHoyOEtVY3pDVVcwc2Jyd085MGdw?=
 =?utf-8?B?R0k0cGE4ek1RSVJUemZ2MFd4NEttZG5HckU1Nm1EbkF4QkJCNWo5R29tQXNS?=
 =?utf-8?B?bVJnUkpjUzlWejZGRThGcjRFSXN1bDZ0a3UvUmwrUnNxQ0REbnBtSkxWWjZl?=
 =?utf-8?B?bllDN0NwYmNrcEtWWjlsVkM0ekJPeWNXWmhYdTFBdldGNzhHSStKSXVIRzRC?=
 =?utf-8?B?SFFmU1dnTStYL0IyUTE5M1dQYUZTU2gyVWNxNVE3K0o4V0ZuRUFrUVRvNXY1?=
 =?utf-8?B?Vm4vdU9abXJTVGY3UytmZU02M01tS1AyRDRjYlliNlU3WEk0ZnQ5Rk1HYTgw?=
 =?utf-8?B?TnhWbjRJcTRwMmM4TDhBS0xHVGtxNDl5Mmd3dThjT2RIMFpONnpmeUpiN2NU?=
 =?utf-8?B?NUErcUhiZFVEVGhIS0FwN1J0c09VWkwvZmJyazZwU1ZxdVFlSVRMbk9RSmtQ?=
 =?utf-8?B?K21DOWdpYlZVQkN6MVAzd2g2eXVZMkQwRFZtQno5eVA3Y2hjOUJCc2t3akpj?=
 =?utf-8?B?QWhUUXhEUEtodWNZOEkySGNpZ2QwZWthclJTTW93NHYyOUJGUXV4Y3REQTdJ?=
 =?utf-8?B?VHFtQVNkL0o0Smw2NnlzZVpEd0JQMEFEa3NkTzNIb25HRE1zUlJOVzJMd1lY?=
 =?utf-8?B?cVYzTlkvRG54Rlg3RmlCK0Y3c2NBZ0hyalo4SFFRci9zM0I3NGx4VjE0Tk5y?=
 =?utf-8?B?aDJXSjBDS0NEMkV4bFJzUE9oTXhYUk9MSURCMnUra05kTHRwTjVWNGFJeTlO?=
 =?utf-8?B?b3JLTjM3S2VvZXFWcXhCV0xiekg1eFVKNHMyNHkvbUZxWnhOWWRYUm12aHdZ?=
 =?utf-8?B?cDdFcTlyN1QvQVBYZUpRVTN3aElINkUvbXdGR3plRXljOFpEOGVNNGdmS3FF?=
 =?utf-8?B?dXFWNU1yNzN5RW1KaXhtKzg0Y0YySEwzRklkNmplbUZvYWp5QmZteXRFbi9Q?=
 =?utf-8?B?UGd4bDExTGJldmZJRmQ4bW45MHJIdmFvUWNXTGl1WUp4Wm1wR3pGTGVDVWUv?=
 =?utf-8?B?anhJVkhKU0ZoSFNPN1RFdjBweXNJVC9Udk03dVp6VkdGZmszUlQzV0x0c1I2?=
 =?utf-8?B?ejZtQUVjSmx4eGppL0JtUXFIZUpQc0w3TG9GaWVRbzhoZDR4MGRRemd1OUFU?=
 =?utf-8?Q?p6k+DYKnvJfvq1FcL4IiyiLgp?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3fc7ede8-7017-4b3d-5019-08ddd4cdddb8
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Aug 2025 09:44:41.1630 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Nz7Nui+fnzB3HSpOl4CD2IXqarUvXhhb+vo1RExJF7eg0MGL6C0nxk0utvrn3gzXgh8zjFMycOPXJPuvuccO1Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8314
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

On 08/06/2025, Luca Ceresoli wrote:
> On Wed, 6 Aug 2025 17:38:17 +0800
> Liu Ying <victor.liu@nxp.com> wrote:
> 
>> On 08/06/2025, Luca Ceresoli wrote:
>>> Hello Liu,
>>>
>>> On Wed,  6 Aug 2025 16:54:24 +0800
>>> Liu Ying <victor.liu@nxp.com> wrote:
>>>   
>>>> devm_drm_bridge_alloc() returns ERR_PTR on failure instead of a
>>>> NULL pointer, so use IS_ERR() to check the returned pointer.
>>>>
>>>> Fixes: 48f05c3b4b70 ("drm/bridge: analogix_dp: Use devm_drm_bridge_alloc() API")
>>>> Signed-off-by: Liu Ying <victor.liu@nxp.com>
>>>> ---
>>>>  drivers/gpu/drm/bridge/analogix/analogix_dp_core.c | 2 +-
>>>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
>>>> index ed35e567d117..86cf898a09bb 100644
>>>> --- a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
>>>> +++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
>>>> @@ -1474,7 +1474,7 @@ analogix_dp_probe(struct device *dev, struct analogix_dp_plat_data *plat_data)
>>>>  
>>>>  	dp = devm_drm_bridge_alloc(dev, struct analogix_dp_device, bridge,
>>>>  				   &analogix_dp_bridge_funcs);
>>>> -	if (!dp)
>>>> +	if (IS_ERR(dp))
>>>>  		return ERR_PTR(-ENOMEM);  
>>>
>>> Good catch, thanks!
>>>
>>> You fix is correct but now I realized one additional fix is needed in
>>> the following line:
>>>
>>> -		return ERR_PTR(-ENOMEM);
>>> +		return ERR_PTR(dp);  
>>
>> You mean ERR_CAST(dp)?
> 
> Ah, indeed!
> 
>>> Can you send a v2 with that fixed?  
>>
>> I find devm_drm_bridge_alloc() always returns ERR_PTR(-ENOMEM) in this
>> driver context, so it seems fine to keep the existing ERR_PTR(-ENOMEM).
>> If you prefer ERR_CAST(dp), I may send v2 to use ERR_CAST(dp).
> 
> The documentation says:
> 
>  * Returns:                  
>  * Pointer to new bridge, or ERR_PTR on failure.
> 
> So let's follow that, which is a (relatively) immutable contract, and
> not the implementation which might change over time.

Fair enough.  v2 is on the way.

> 
> This is also what all callers of devm_drm_bridge_alloc() do, unless I
> missed something.
> 
> Thanks,
> Luca
> 


-- 
Regards,
Liu Ying
