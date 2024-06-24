Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AC7E391568D
	for <lists+dri-devel@lfdr.de>; Mon, 24 Jun 2024 20:38:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9BC0010E546;
	Mon, 24 Jun 2024 18:37:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="Qbw5JzCf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2052.outbound.protection.outlook.com [40.107.223.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1209810E238;
 Mon, 24 Jun 2024 18:37:54 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ECTeAGYOvEKPhgX1RDd4N41T8l2cmbASjdZDwYRDyj23n/EfGLao9cGaV3oKzXUnhCqDD0CHBbXeuXc8gjFlNW09F3REMi2IzNDXtUdZpouASeWTfuRLXHqJ44BfeZ9ZMOkvc+n3Q5v2FGti3cGtQ7juwwgisxV6CDy+YLoUcFiAa9A5C0DhjOZxe+a+3aa2ax93pk4tQiHjEm5khra/Wy8uKTofTDuyUcIMAXugyg+ckuOSbp554VyFsDzXJruRapa0I1VNmgVCjzkATUmkHowM3Azdf7OsgUXVac0XvEjXyfqydQV3d/WRH57hkKEzrt+jL/3/zfttgJwsnklwIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ejn0w4nFX4m03g9YzdWSF6HBjf9dqovfek5m0QqvPMI=;
 b=TOD9DRDpYfeAQ5c3voUvt+H7Eev3XZxPz7RNF0OyFg4OFWKJRrj0VHzrAk25JJ6CMg/H93ipMxsaNISVSPpF1VOiPsWusIMbs9HgexKN+7D7r1GviPDMAk9JbZdAL3AWCdccD5r1AQReuvY2b7uNXoxZVN2mfX30a3cG2k5xA0+L+tPN/stWF8av4U/zTbsZiEi8PNx9fdmoLggh6jcBtqp18i4UrYjEiCwGGOPV6bGVrbuXFSxePyJiMevG2sZIDMKOaQo5Xkyo36PSVg5sx4jdZBnOp5NPCx97VoiGqfBnKopxVJCq12NZ+j/GZBXG4+u7Sz2ua5fR1DxH30h6vg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ejn0w4nFX4m03g9YzdWSF6HBjf9dqovfek5m0QqvPMI=;
 b=Qbw5JzCfgtH6dI702DbzoOGRwK78WQ+Z8+Twaj2Abj7QQtKLLmGZtgC6Iq59Ya5IOwLh3+9WgV1+XwLQyhRqYeNG1dyJYQ7GSIm/wRJ6ow0RUeHRu+MbKludzA+sMrbiK+ciRuhag657HnXPt37yMtPT32k0Rms/JQ5B//H1MpQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by SN7PR12MB6982.namprd12.prod.outlook.com (2603:10b6:806:262::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.29; Mon, 24 Jun
 2024 18:37:51 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca%5]) with mapi id 15.20.7698.025; Mon, 24 Jun 2024
 18:37:51 +0000
Message-ID: <93677810-55e5-40b9-8756-c10820dc890e@amd.com>
Date: Mon, 24 Jun 2024 13:37:47 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] drm: Add panel backlight quirks
To: Hans de Goede <hdegoede@redhat.com>,
 =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 Matt Hartley <matt.hartley@gmail.com>, Kieran Levin <ktl@framework.net>
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Dustin Howett <dustin@howett.net>,
 Matthew Anderson <ruinairas1992@gmail.com>,
 "Derek J. Clark" <derkejohn.clark@gmail.com>
References: <20240623-amdgpu-min-backlight-quirk-v2-0-cecf7f49da9b@weissschuh.net>
 <20240623-amdgpu-min-backlight-quirk-v2-1-cecf7f49da9b@weissschuh.net>
 <efc9165d-856a-44a1-a93f-e7467cd2cceb@amd.com>
 <ad5d7ff3-e013-46d0-9ddb-5b0afc3dc870@redhat.com>
Content-Language: en-US
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <ad5d7ff3-e013-46d0-9ddb-5b0afc3dc870@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SN7PR04CA0233.namprd04.prod.outlook.com
 (2603:10b6:806:127::28) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|SN7PR12MB6982:EE_
X-MS-Office365-Filtering-Correlation-Id: 8319d3b0-783f-488a-1080-08dc947cc0b0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230037|366013|7416011|376011|1800799021|921017; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?L090by9BeHYwWDN2dy9ITVNudkRUSHE5WXY1cUx0MFcyWFFUakJGbi85dzNX?=
 =?utf-8?B?STRiWVhJbjhCRjh3NEt4d3F0TVFQRmdJMUpjZmxwQlZCQW12MThkTE5LM3Fm?=
 =?utf-8?B?NnFFZVJYSExiRGRtbWxQOWhWOGQ2SmN5QUtoZS85TGVFV3NxbWs0bElSM1Fo?=
 =?utf-8?B?TldIdFR3enZQeitzeUpQckwwZFd6RDZ3cW9kRkk2Z3ZpQ3kzclc4ZFYwSk1D?=
 =?utf-8?B?dVBZTmRsdTUvSk4zWUdsODVwR1pmaEVwSmFPY0RxWGNMM2RSUW15aHh6RmZR?=
 =?utf-8?B?T0hRY3NpM0Z0QmhjOUNzcHF1QmVwQ1ZDaGdHZ1BoRWJIdEJlRFI1UVlGVG1j?=
 =?utf-8?B?aUMxUnhURlJUWlVLYkVPQWdLQXlIeUIxM3U4VFUzQ2Z2bzN0UG9EM0FqYjVC?=
 =?utf-8?B?ank4UEVVUmVCRE1YcTN1ZTlNMWI0YWRuU25KcjZiWkxzRHY0dTJsMitSRUVX?=
 =?utf-8?B?MmlqZC9nVlVzWHV4K3poNVpNdEUveEVlU2lubGNEWlFUenY5emFOVDVxSnlk?=
 =?utf-8?B?UU1GRjU5eUdwNXN5YkJNZ21qSldDMElVeE5KWVJEWkFaVjU0NjhKamExQmJ3?=
 =?utf-8?B?UitPNjI4U1VrTWl1R3VrT0doM2E0c3p2d3IvcXRxbmhNNDg5Q00wWGM3ZWFY?=
 =?utf-8?B?ekJnNVFSMVR1TEpqdEVLYlZ3MTZWY3B5dmtHbFJSaTNjd3dOVTIzQnI3RWdZ?=
 =?utf-8?B?c1ZIUWFaKzFBVjNlRmdUZkZZUVc0Vk5kNnZSUnRPTnJNNDdjU2FuTHR0Z3Z6?=
 =?utf-8?B?OGJiemVrZm4xdnZLNkt2VXJ4VGJmTVdBVlU4cHB6Ui9JVTcwa3FOeU02RWNN?=
 =?utf-8?B?aGFSYy9SMDFzTHdrZzZUR1ZxbjAyRWlkRHVLZUV6NE9nRFFtRmJvVkxyTitm?=
 =?utf-8?B?RE50L3NEV2IyaGtObnMzR2ZMdG9VU3IzcjR3a094c0Z1cjQrUFdEWWVTeUMx?=
 =?utf-8?B?dmFnV1VUeUxjZkJ4QSs2T3EvM29lNk1VQXhrZ0VmT2U0MVFqTGsxWnFjZ2dN?=
 =?utf-8?B?b2luc2VTRktTTlRiMkpvNnJ6UXc0aU5XbTltenIxWkVNUVFwdlJRWTV5MGJz?=
 =?utf-8?B?RGEwVUZGRlpZTzZUTitmaFZzaXdlZm5ob3ZKTFdqN3l3VjVJVFk5cE9KdjZv?=
 =?utf-8?B?WktEOEQ4QzJGVnQwenZ1WlRYOG9vcHMyVGlodklNQ255VFhwcFBDaWxXTFNw?=
 =?utf-8?B?NUxlOHdqcm1USUNwMWl0b1hmRzV5Q0luY3ZON2ZvK3Q4bjJRMmIvYldFUmlU?=
 =?utf-8?B?TnY1MTg4NW9aam9mY3h4d3JVMk0zU0ZoK01JT1NaMUVqM1lQRmVMRmx0VTBH?=
 =?utf-8?B?U0dNR0UwaXpkUlRGTXZ5TlVta2lxMmlpdTAwbE5tKzNEY21BbFlKeXBkNURQ?=
 =?utf-8?B?bjJTUzVZWUU5Wm9SRHJpVm11RjFUQnR5b3YzVWxmNWp1UFBGVXlSdm8wT3JB?=
 =?utf-8?B?Mi9CZnBaQlV1UW5xenhyeVlzOVFXbUZudDBWSUtjOU1mb0ZxQmUwZi9hTHly?=
 =?utf-8?B?ZkxER0FDbCtpNWRYbVBXRHlBbllYMER3dzJMRFRiUzFka3VuSGtvSURXL0Nn?=
 =?utf-8?B?VllTTE9HalBpL3lYSWpvZ1ROdCtMNVR5RTY0WnpaQTd6OUZ0Tk9GYmU5cnda?=
 =?utf-8?B?ci9jTWxNNWVpRUVZZ1VBWWltTHRiUEluUHdMUkdFcVY0SjR2Y0Q1YW9zVkFI?=
 =?utf-8?B?M0dSZmorb2pnOGdnbmRRZEVmN3B1b0ErQjJRZW1vQkw3T1hsMkh5MmljRDdj?=
 =?utf-8?B?ZHFMRWw3MXF1bXRCemxWcmVuNjFDazkxa3l2Z2dLdi93N25OOXduVFZMSktJ?=
 =?utf-8?Q?2Hx+WTDsx3boj4AqDXPAFqSM2kV1Xkw4pSI/Y=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR12MB6101.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230037)(366013)(7416011)(376011)(1800799021)(921017); DIR:OUT; SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?N1NJYjI0Zk4xWFVoeFVwQmhkeGZBK0YrY3IvQ1NrZzRmWllEY1ByN1VjdUI0?=
 =?utf-8?B?NXBkYzBkVUM5bi9jUFZFU1hzcjNTT3Z3NXlPT2Z0dGt3d0xPS01vVXJ2RjYw?=
 =?utf-8?B?OGM4SlV0L3ltS3diTDBKc3JFNDdtNWJkRWllNmlQQmdkMXlzNWZMZitxYkx4?=
 =?utf-8?B?TmpwUVNvcllLMTVEK3FJd1B0TGphMXdnS0hrNkJIeXl3SksyT2RzTXpUVHJL?=
 =?utf-8?B?TXU1ZFJIamxDUGJ1WC9VSmxaRm1HQTViVDkzZmJZM1A5alpoSzI2QVZFWENC?=
 =?utf-8?B?aEpEMjRQOVJRRE9ubjE4VUgwWGFZdXJwTWM0MHdwSTh3Nk1IZTRjYTRMekpM?=
 =?utf-8?B?OUF2T2VKKzVZYnpZcXVYYmNvdUZNWGwwRk9BajY2ZnRUbmVXV3NaZGNBa1Np?=
 =?utf-8?B?WjJmUzkyZTJjQm5aRUhvSXJDajhac3RpbmFBQ3JWdkZ3aVdZZDJqM0N4R0hm?=
 =?utf-8?B?bWFsM29pWDBUbkxPMG9za2RZMUY4UGtPdWZNdEN5eWtTTlpsMHl2V2x3VFZB?=
 =?utf-8?B?NDQwdDRTYWxFWUU2bysveGxwUUd6b0s2azB2OGh4ZXhvTmVZWVZqTTc2Q3VH?=
 =?utf-8?B?b3Q5M0x1TmNYWW1sQ0RjMXp0NkVobFJ2YUpuMTViZU1PU3Yzcy9jQVRUMGQ3?=
 =?utf-8?B?TlNHZ3kreG1kWnlvWGNURGF6T2VDZTlYMlhOZEo4bExaLzRQb2RXTFU4Sit3?=
 =?utf-8?B?U1hHUVVmWHJCZDhnWmZRRFRCNXdUS2lqVkFqbXpjNi9PdCtNTnptaXNiMm5Y?=
 =?utf-8?B?eVVZYVZtQnVsTUlqY1l5TFQ3QWZIQWdiR3dQOHAzbGUwc0tJZlNZNDVGbTRD?=
 =?utf-8?B?R0Izalh3ZEJXclhlMGQ5UDA4T2g1RThZZURBWEhJM0NyRzdJRVUyV21KeFo0?=
 =?utf-8?B?V2ROdEVsdE0rbVp2b21BRUFYRXNQbDArWCs2RjZCWUE2MktZUTlSOVU4Z0Zz?=
 =?utf-8?B?RFVZc0pVVG0xOUU1TmVLOFhVckF6cVFJSVVLcXFXSHNPOFdIV1BTZWhQUytp?=
 =?utf-8?B?NDBUbDJMaUw0TXdpdDFIT0t6S2dSdUZpNEswVUlHMVBiMjlxY2k5NkJPQUtN?=
 =?utf-8?B?M25waEZHS0RrMVU4MVQrQ1VRZFNoVTNlcGpMOXM4bHJTY051UFZITHZ0SDBz?=
 =?utf-8?B?MUcxUCtkZDY2T2tYeGRLTy9WR0Y5MW9qSFlFU2FROTVJSTI4Mm00ZllEQWZw?=
 =?utf-8?B?R2RqV2p6KzZ3L2puYWY2L3p4eEpqQlBNVGtkMG54Q2p5MWhBUzE0V2RWdGpC?=
 =?utf-8?B?Zno1NHZ0SjIzdnpBL1pieU1aK0RKN1FWT3N3QkZkbVVSR3dLYzZEUWx3aVc3?=
 =?utf-8?B?d1RnYlBjaHlndjF1MTY0S0Z4eDVTN2w1MEpXcUtuaDJlVTJ0TEJSUjkwZGZW?=
 =?utf-8?B?SVRQSDFIMFBHejhKTHRqeXVIVFMwVDhWUVpjQTVVbkdmck9rMkFtdHFvQUJq?=
 =?utf-8?B?QkhiWE44dTVkZ0R0NWc3M0xueWFQTHJBQW0zWjkzU09WYU5LRm1OOWdxTmFG?=
 =?utf-8?B?TE4wdWI2WTFTZ1p2Zi9GR3l6WkJuaksvejQyNUJzb3h0WE1UY25qMllXL3NW?=
 =?utf-8?B?cDZSYWg4QjBQcVNONm1kWGJocHpsWkFrSlRsVzFSQmUzUlI3SnY0a3hESlNR?=
 =?utf-8?B?NE8rSExNN3ZWbU5tRTg3Sm5rLzRia1Zra0w5eXpEUm43SU5xVEh0QlMxRlRU?=
 =?utf-8?B?VjM0aDdMaEU2dTlXYTJCN3ZQaSs1eWYvSVk3ck1xZEtmcWh2WVl0VG5DTUp3?=
 =?utf-8?B?Wk5VNTV3T2ZnbjVzQkt6N3pxZFlZWUFiczd6dW1RRFJEcFdpdEY2d3QyaDV0?=
 =?utf-8?B?ZzZSeEIwQlBNeVJvcStsMXV3VUtVdWFaR2ZKV1VMWENDUmI3U1NJZ2duZFZW?=
 =?utf-8?B?ejFacEJjckhhV3p0dmRiTXE2ME1NejVRaTk0UlZ1ZmVTUDVDQXk5RmwrOURE?=
 =?utf-8?B?NVc2Yys1WVpFODBRRmdVd1lYcXVXeTdOWlZIdGFKdjVUSk1WTUp2OGZBMWdk?=
 =?utf-8?B?M2JJSDVwQkZjZXR0VEp2ZStxNWNIZFZ1ZWJlUzg5V1plZzNPcXdGUzV1cTJQ?=
 =?utf-8?B?U3pNRDNQR1BTZUI1U3ZlT2hTMURLN3czUTVTcXVHVU5Jb0trNWYwMHl6MnlT?=
 =?utf-8?Q?RqCEbyezsKaTlECWe1DpgWS7Z?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8319d3b0-783f-488a-1080-08dc947cc0b0
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2024 18:37:51.1097 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6K/bhxK3nq0pDL/a265/KqrxHSxnrtyPQ1M11YVtLRD98BYyOsh7hIO7Zr67g67AzFcCqhwSHYyhbIEnlHlrzw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB6982
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

On 6/23/2024 15:55, Hans de Goede wrote:
> Hi,
> 
> On 6/23/24 10:20 PM, Mario Limonciello wrote:
>> On 6/23/2024 03:51, Thomas Weißschuh wrote:
>>> Panels using a PWM-controlled backlight source without an do not have a
>>> standard way to communicate their valid PWM ranges.
>>> On x86 the ranges are read from ACPI through driver-specific tables.
>>> The built-in ranges are not necessarily correct, or may grow stale if an
>>> older device can be retrofitted with newer panels.
>>>
>>> Add a quirk infrastructure with which the valid backlight ranges can be
>>> maintained as part of the kernel.
>>>
>>
>> So I was just talking to some folks in the Linux handheld gaming community (added to CC) about an issue they have where they need to know the correct panel orientation.  Due to reuse of panels across vendors the orientation on one might not be appropriate on another.  The trick is then to detect the combo of both the panel and the DMI data.
>>
>> It's the same "kind" of problem where something advertised in the firmware should be ignored but only on a panel + SMBIOS combination.
>>
>> So I am wondering if what you're proposing here could be more generalized.  IE "drm_panel_quirks.c" instead?
>>
>> Thoughts?
> 
> Note we already have a quirk mechanism for non upright mounted lcd-panels:
> 
> drivers/gpu/drm/drm_panel_orientation_quirks.c
> 
> note that the info here is shared with the simpledrm and
> efifb drivers, so if the chose is made to extend this then
> that needs to be taken into account.
> 
> Regards,
> 
> Hans

Thanks for sharing.  Totally agree this is this the better way to go for 
what I raised.
