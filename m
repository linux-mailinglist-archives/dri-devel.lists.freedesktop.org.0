Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 91E1ACEF71B
	for <lists+dri-devel@lfdr.de>; Fri, 02 Jan 2026 23:45:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA0B610E16E;
	Fri,  2 Jan 2026 22:45:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="5HB8LIOS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PH0PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11011030.outbound.protection.outlook.com [40.107.208.30])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C604410E11D;
 Fri,  2 Jan 2026 22:45:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=To4ukxtykFYeVDnqbaVAxKX9A3dndpJGYAOlt6gj0f+EdVmVw2sJBu6+nRXi6WgqWnS6tFO0fTcnNjRO8rlntQfEyT7bRCYNe0KsuQupCNgzoJv4Z55GCjLnKRF7Nd8lGKKe7WghBdby5d8mXFaEkKnsLd1PoMBxaj9CROXMWpaVkrAgOMWCfB1rIVg0rYF0EjHhP1wQHpm+Ohbr59KXFjYQl0+76nSLK6uNVd5XBAxW5uSQUJ8k/AYY6yUnF935RTCojpmB0HBO5sjsiJXu8+9GH6+BgD5nBc93rYHj0sAPN0BUXUsATD6VBnbGe9Nd0wr9WTnAViQm2FhC8lvveg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EiI0e9zCu/j2Eo+4CRWZXAuLdescHuSz7TrGHIO7Fmk=;
 b=C/HJPys12NRl+/0h7DK9zeHr22yFmAn8Um4FXYqsFdtn9m1ae9rpzc6MLlMWDVK5Vkuk1Ox+thZBqLkdevkHNs7xrt3rR/lfbwL9ol1cYoaW+TinYdW3sGg5hBDyuy1IMmrGXNQyJYZdDlD3EGaxqAtINSHV5eWFk3ngRGgphiDzHKHlSMhEs37jUAMmdcqqHYz/bTUwEVnLpSSvWEE3Mm0rOeSb8c3etf+vYJ45E6a0vjP91875uPuZmMdkLvIoGMGHOE1aHEp8NWRAAfQgy/jZWo0LgwbcpKES/D+hSGDidGORul8tf8FWqIbOoWjOh8TieerGrGGLPvPEOOPU0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linux.intel.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EiI0e9zCu/j2Eo+4CRWZXAuLdescHuSz7TrGHIO7Fmk=;
 b=5HB8LIOSJwJ5r2F/R2idjF+gQ+7wdtWReBKGPG7utArWW5tHoJLoQC0kTWHY2FJRualhD1/KzlVOoXrWjBpr3xGCBp8CkNlJCSJHvlI07N2XmXNWSo3qXeclTXmDHpn2Bra1KftY/pewkO6JiVedTK/Zy6z1EIi8ntM0YEXA9Fw=
Received: from SN7PR18CA0028.namprd18.prod.outlook.com (2603:10b6:806:f3::11)
 by DS2PR12MB9775.namprd12.prod.outlook.com (2603:10b6:8:2bb::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Fri, 2 Jan
 2026 22:45:32 +0000
Received: from SN1PEPF000397AF.namprd05.prod.outlook.com
 (2603:10b6:806:f3:cafe::b3) by SN7PR18CA0028.outlook.office365.com
 (2603:10b6:806:f3::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9478.4 via Frontend Transport; Fri, 2
 Jan 2026 22:45:14 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 SN1PEPF000397AF.mail.protection.outlook.com (10.167.248.53) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9499.1 via Frontend Transport; Fri, 2 Jan 2026 22:45:31 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 2 Jan
 2026 16:45:31 -0600
Received: from [10.254.94.39] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Fri, 2 Jan 2026 16:45:30 -0600
Message-ID: <de74331e-00f0-4dd1-a864-591114a08972@amd.com>
Date: Fri, 2 Jan 2026 17:45:25 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Leo Li <sunpeng.li@amd.com>
Subject: Re: [PATCH v2 1/2] drm: Introduce drm_crtc_vblank_prepare()
To: =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>, "Jani
 Nikula" <jani.nikula@linux.intel.com>
CC: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <Harry.Wentland@amd.com>, <Nicholas.Kazlauskas@amd.com>, <simona@ffwll.ch>,
 <airlied@gmail.com>
References: <20251201231807.287414-1-sunpeng.li@amd.com>
 <d2b8706e41648fcd271d00f2be54545c9090442f@intel.com>
 <aTf-O8DFcCJPhrPd@intel.com> <408d24da-4ddd-4510-b86f-944fcb4720f8@amd.com>
Content-Language: en-US
In-Reply-To: <408d24da-4ddd-4510-b86f-944fcb4720f8@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF000397AF:EE_|DS2PR12MB9775:EE_
X-MS-Office365-Filtering-Correlation-Id: 2ed24f8d-eaf3-45cf-264a-08de4a50a2b1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|376014|1800799024|42112799006|36860700013; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?eFVJb2laeDAwcm80aUhmZmpaUTIyQi9KYThyMS9NTW1CZ2ZZc3VaOElVRTYv?=
 =?utf-8?B?b3oyOUJlbEdCcDRMUEV0aHRsN29nSlhtMFh0TURINXA1b1I2NnM4Z0Z4cWp6?=
 =?utf-8?B?T2ZGNllVM0NoY2RGeUNTRVk0ZGhhbzJPc2R4NXZqNWFyT3JsK2tsT044UFQx?=
 =?utf-8?B?VXJMbVY5WUErS21lN1RzTUJ5ZjJvdG5ESDFaVlpBMkljQmxOSmg3S1pRekNS?=
 =?utf-8?B?bGx4OTFsc0FyQ1BZaysvVEdhbmxvYU1USlBTY2JXNnJXUXhLVzd4M0VUYS9Y?=
 =?utf-8?B?YlJGbVJLMlJoa21GQlRhODkwNzR2NElMZlBYY2hYVjEwdWd4Z1JwU1ZFbkQx?=
 =?utf-8?B?UTFKU1dkTVlhdnNtVkc0Yk5GSkRERzdlbUZ0YWF0MnV2ckozZWFNQlAxT1p6?=
 =?utf-8?B?MUZQWnNHVGwzMnZCT2dmU2ZLVERwK1FsQm5FbGRxa2tCcnhPRDZEa291aCtz?=
 =?utf-8?B?U05GSE56SVFaZjJZc0hLSFRXOExGbGpjUW9ISDBwSDNOUmlNdDFEUnRxSFpD?=
 =?utf-8?B?ZUlETHdpNDBXaWlKNTQrRElMV3lGT2UzclBXNGJnU0Q3N2ZRcGp5MzRZcDUz?=
 =?utf-8?B?d1pqZW1nTWU5UzZPL3RqS0FUWThFWnhaV3lwMHJIUGxLUmlVbFpXQnUvTU9r?=
 =?utf-8?B?ZGpXODU0Mlhtb01NYWkxbVl0bzRWeFJvS09iTkhVdGY5RXFNNkN0ZG50Nldz?=
 =?utf-8?B?QXJvem1hZldIdlEwVUZGekMxcUtReVdHZFgwMVJvT0pNZVdHUUtCWFFDRnBK?=
 =?utf-8?B?ZlFDQ0ZjSEQ0YlBxZFBWUHpiUXVXWm9kRW9KZlk2QzQ0c2lGd0FuUko4VXph?=
 =?utf-8?B?aGhlbmRxWHBKTzVJQzdpY0pTZXRqTERMUll0aDdoV3czV1VZcWFHczdqUkRq?=
 =?utf-8?B?eE1rY2hTQXlwUVpiNk5zRzZ2dzFXc0o3RU5jendGZUlXRXdJUlp1U3F0OC80?=
 =?utf-8?B?cHl4V3RIRUZBUEdOYTg1Q3VFc3ZteE1Hd05EM3NkRmc3VWxUZkZGTGlrNVpC?=
 =?utf-8?B?bDBIaGJ5K2ZGU2VkRTFOclVhZHNBRmVNTUpYWkN4MU50Rk5iVUVFaE0yNnJu?=
 =?utf-8?B?V1JjSkdpUTJtcTdPSHQyTUN4amxqdWJrMWNPZzJPQzNFN1NXREQ5ejlHaGpo?=
 =?utf-8?B?SU1OaWREUzRpWXBVSEJaazFRRGowWkRYNUFnbGVlam13N2x1cEJhYjBiRkhB?=
 =?utf-8?B?NzY5V2crdnFHZGpqV0srOEwrRWNRTTBxajk1M1l5dDBlWTJaaGVtQzZOVTh6?=
 =?utf-8?B?aHdyZzdYdHNTNDBZbDYwQmVXZndOU1dTYVNrcEJCVHY3b3ZXaUVhRHFtWW5E?=
 =?utf-8?B?SlIwREdoK09rbXlGVm5HNE02N24rUWVVaHVyR3VzQ3hobkk0dm13RkcwUzVq?=
 =?utf-8?B?emR0Q1FERVZjdUorbmFobGhVRjBDbzE5T0VCdDFEd3B1eEtKRUM1Qis4aGND?=
 =?utf-8?B?b1A3TTMyRWlvVGJGVllSVFhydWl5S3p5WWY0dVh1YlR6QlVjY1pKSmN0cnMv?=
 =?utf-8?B?WVRwMUoyak5NcVcydUxHNldyWm85cHFaSWJ3UGUrT09kbEZKWDZCOUlmSVcv?=
 =?utf-8?B?VFF2QnltZWpvZEVIVjBnSkJlWkY3SVNFblNpamZRNDd3QWFiUU9oalFOdHpp?=
 =?utf-8?B?ZXN6cWdKYzdKbktCQ0N1MW16U3NYQmt6S3pKUDJpczgxc3J1YWkrRXdaY0Yz?=
 =?utf-8?B?Q0VCeERqV0M3QjlWek1kRVpvRFNLcnd5ZzJyUU5QdHNxMU9NOWh6S0hBSlpy?=
 =?utf-8?B?aWk5aEhYVE51TVNHRTdrV3MwZi83aFdtS1Zrb0cxMlBKN3hIYjRCSzFaMmVY?=
 =?utf-8?B?Qm1MNFNDOE5Qb0c1OXJDS0hUaWtSc2x6aFFyMzZTQ1RrdGpsRnVlWlB3K1Qy?=
 =?utf-8?B?alV4UFZYeVBpbGx6WFA3ZlI0Zy9Qak1scGxhQS9KTFVlRzNsODFZcHdzWTBJ?=
 =?utf-8?B?OGFxSUNTQk9pOHVyMmRVQStlK1BsUThsNVVLWXdhUys0YStFc3VmaHpKZDdN?=
 =?utf-8?B?aWFFUlNqL0JVb0lKMjdCY3VBUGYydkFKdXJnRXhoVUI5bTZtSml2K1lWc0FN?=
 =?utf-8?B?M1VqUGtvWWdHcEtRaTJmOS9HNDRMLzVxU003RXo2OGZPRUpSdTdnOUtrMXp5?=
 =?utf-8?Q?SO9Q=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb08.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(376014)(1800799024)(42112799006)(36860700013);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jan 2026 22:45:31.9893 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2ed24f8d-eaf3-45cf-264a-08de4a50a2b1
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1PEPF000397AF.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS2PR12MB9775
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



On 2025-12-10 12:55, Leo Li wrote:
> 
> 
> On 2025-12-09 05:47, Ville Syrjälä wrote:
>> On Tue, Dec 09, 2025 at 12:05:31PM +0200, Jani Nikula wrote:
>>> On Mon, 01 Dec 2025, <sunpeng.li@amd.com> wrote:
>>>> From: Leo Li <sunpeng.li@amd.com>
>>>>
>>>> Some drivers need to perform blocking operations prior to enabling
>>>> vblank interrupts. A display hardware spin-up from a low-power state
>>>> that requires synchronization with the rest of the driver via a mutex,
>>>> for example.
>>>>
>>>> To support this, introduce a new drm_crtc_vblank_prepare() helper that
>>>> calls back into the driver -- if implemented -- for the driver to do
>>>> such preparation work.
>>>>
>>>> In DRM core, call this helper before drm_vblank_get(). Drivers can
>>>> choose to call this if they implement the callback in the future.
>>>
>>> Have you considered hiding all of this inside drm_vblank.c? Call prepare
>>> in drm_crtc_vblank_get() and a couple of other places? And actually
>>> don't call it on !drm_dev_has_vblank(dev)?
>>>
>>> There's just so much littering all over the place with the prepare, and
>>> it seems brittle. Especially when you expect not only the drm core but
>>> also the relevant drivers to call drm_crtc_vblank_prepare() when needed.
>>>
>>> There does seem to be a few places in amdgpu that wrap the
>>> drm_crtc_vblank_get() inside dev->event_lock, but is there really any
>>> need to do so? Do the get first, and grab the event_lock after?
>>>
>>> Some random comments inline.
>>>
>>> Cc: Ville
>>
>> drm_vblank_get() can get called from any kind of context.
>> The only workable solution might be the schedule a work from
>> .vblank_enable() and do whatever is needed from there.
>>
> Yeah, drm_vblank_get() can be called from interrupt context, so the sleeping
> work has to happen outside of it.
> 
> The issue with deferring work from .enable_vblank() is drm_vblank_enable()
> follows up immediately with a drm_update_vblank_count(); it expects HW to be
> online for reading the vblank counter. Meanwhile, the prepare work can be
> pending, and waiting for HW to be online from drm_update_vblank_count() wouldn't
> be ideal.
> 
> I've thought about implementing a sw vblank counter while HW is waking up, but
> that sounds overly complex. It would be simpler to somehow signal prepare work
> before we enter non-sleeping context.
> 
> Would a function like drm_crtc_get_vblank_with_prepare() help? vblank_prepare()
> can be wrapped in it before calling get_vblank(). drm_crtc_get_vblank()
> call-sites outside of drm_vblank.c -- called from process context -- can be
> replaced with it.
> 
> The only case it's not called from process context (within drm core) is in
> drm_crtc_vblank_on_config(), which is in drm_vblank.c itself. I think
> vblank_prepare() can be open coded there. Drivers can choose to call
> get_vblank_with_prepare() if they actually have blocking prepare work.

Sorry for the delay, just had some time to look at this again.

It seems I missed a place in my last comment about combining prepare() and get()
into one function. drm_vblank_work_schedule() in drm_vblank_work.c calls
vblank_get() with the event_lock, so an option to vblank_prepare() separately is
still needed.

I don't think we actually need to export drm_crtc_vblank_prepare() to drivers.
It's purpose is for DRM to run blocking driver work to prepare for vblank
programming, not the other way around. Drivers can sequence prepare work
themselves, if they need to, before doing any programming.

I think vblank_prepare() can be hidden in drm_internal.h, to limit it's use to
DRM core. I'll spin up a v2 rebased on Jani's series with this and some other
comments addressed.

Thanks,
Leo

> 
> Thanks,
> Leo
> 

