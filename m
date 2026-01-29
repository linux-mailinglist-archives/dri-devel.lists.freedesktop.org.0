Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MIckOIt5e2nWEwIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 29 Jan 2026 16:15:23 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 94C0BB1587
	for <lists+dri-devel@lfdr.de>; Thu, 29 Jan 2026 16:15:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F16410E28A;
	Thu, 29 Jan 2026 15:15:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="ClcbhB/9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CO1PR03CU002.outbound.protection.outlook.com
 (mail-westus2azon11010017.outbound.protection.outlook.com [52.101.46.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 023D410E28A;
 Thu, 29 Jan 2026 15:15:17 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rKUgtdHKCGpScpmyGHOr95fJzeZCexxM6LEgAxMpBd005+19JuVnTylw8oD+G+SBrHUY0kH7U31gh+FBPs/XMqtrz5POhX2ycd075rMEFQ6N7q8Ea3hIkj1b6tnGqdhWzLWhOv77B9Yx7wrXGYMjde8s2oUAduRJF262rJ31QoL51wW7lmGdJ9Fuf2Txh7Z++2aE58PGYsbd+F/1kWjw7qZ7TCh8D6c7G62Maft925Dqqn/v0xfCE2i+vsQZVXTmOCXboLFbpJxld7wuZb9l+UaZFzGtZzGFVE5AOCL4gMoayOQS5dPzEhdfS1nY6zJpy6Vkec6aNtxnJ3Vr524A/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8tJdEdR5FEZreED5AQajHQrs4H8oKBSDD8ZDkNyMHPY=;
 b=aMz0PZHaYmoDN+wWVDyjoVSvYid6F2eSpruLX3+ru7Hg7eXIelZq49RtA5NIVoKFqfzZAuc5SlGjngxKmh11CjVelEmMAQCWgOXsEK/5Jq+oLzKli2Yn1pgVietR2/1iAKwbh4rq5EI2mnvft78WiQj3+xqcAAuo00W2YSzz4AOtxDWyvLGFR/bYUULmX9J6dmIEcO/W79lhSbqhPVxmdepjdRP+f7Z2J+PtykPzrIj5QV6Tt/CIbCg0OhAv/nh2ydGRJTCzjls0AZVxM2nJfQocRcDC7Y+HPyhTjf3gTGSimU6DQs/qwyoLnzs8whTWFXTufKq0VFQRHFI50FqgEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8tJdEdR5FEZreED5AQajHQrs4H8oKBSDD8ZDkNyMHPY=;
 b=ClcbhB/99fnqM7ggdG8zbp56JE9bQSl9+tGHCmf1N5joY+CmdYPvU63SxwHzn/beaeyFNgbVQ14QsfQX8S+DDPnR2CornvQtw8zDXvwBS7eptEImge4disQtvuo2zRiNYcWU/zQOaUv5IGWVRD4+/0mfHcBcC7LsGs8lnnbjeZI=
Received: from BLAPR03CA0161.namprd03.prod.outlook.com (2603:10b6:208:32f::8)
 by MN6PR12MB8469.namprd12.prod.outlook.com (2603:10b6:208:46e::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.11; Thu, 29 Jan
 2026 15:15:14 +0000
Received: from BL02EPF0001A0FA.namprd03.prod.outlook.com
 (2603:10b6:208:32f:cafe::d2) by BLAPR03CA0161.outlook.office365.com
 (2603:10b6:208:32f::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9564.8 via Frontend Transport; Thu,
 29 Jan 2026 15:15:14 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 BL02EPF0001A0FA.mail.protection.outlook.com (10.167.242.101) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9564.3 via Frontend Transport; Thu, 29 Jan 2026 15:15:14 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Thu, 29 Jan
 2026 09:15:14 -0600
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Thu, 29 Jan
 2026 07:15:14 -0800
Received: from [10.254.93.26] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Thu, 29 Jan 2026 09:15:13 -0600
Message-ID: <923ab7ae-0963-472e-995e-760c30978274@amd.com>
Date: Thu, 29 Jan 2026 10:15:13 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/2] drm: Introduce drm_crtc_vblank_prepare()
To: Derek John Clark <derekjohn.clark@gmail.com>
CC: <Harry.Wentland@amd.com>, <airlied@gmail.com>,
 <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <jani.nikula@linux.intel.com>, <simona@ffwll.ch>, Mario Limonciello
 <superm1@kernel.org>, <ville.syrjala@linux.intel.com>
References: <CAFqHKTnSUndwTs-cc8SZxST48UBj6_oKf0Bzt_mMSsj6=g-xww@mail.gmail.com>
Content-Language: en-US
From: Leo Li <sunpeng.li@amd.com>
In-Reply-To: <CAFqHKTnSUndwTs-cc8SZxST48UBj6_oKf0Bzt_mMSsj6=g-xww@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0001A0FA:EE_|MN6PR12MB8469:EE_
X-MS-Office365-Filtering-Correlation-Id: 693a458b-07a5-4152-0f03-08de5f493445
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|42112799006|36860700013|82310400026|13003099007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MGxDL1VEeDBkeGZRY1JwN2NLNERQcW9BdGRMTjhyQVFDVkNkQ1RnQmVWL1hV?=
 =?utf-8?B?ZXZXNmNtNmxmT25leDBYSkU5OGRaY3pYaHp3ZkRlZEx6bzNTMjc2SFB4ZWdo?=
 =?utf-8?B?M016UEZ0NS9NTnpzcjFhN2gvUGRNbXBVWlJvOEtRZ3FTb2VacXNadThBc2JZ?=
 =?utf-8?B?MTA0cm0zTjFHOXBVcHZPU21iMEVvTHFrM3RuQWk0cDVTR284R3NMcXJuRzJ2?=
 =?utf-8?B?Lzh6YzFQTDNCZ3duZXROMHMvTDlsbnVwTUJLTFdKMHBLVG9Ga01aL3Y1WjhT?=
 =?utf-8?B?VVErUjBQek9WbEdURmYvaUdOV2pWQldRRlREd2M0ZFlDZUQ1bGR2aEhNVU1v?=
 =?utf-8?B?bFpxNVdIZnZrd1FDQ2ZSVDE1Q0p0bmlmeUwySElhYjh3SXJ6d1Q0OTFvMTJJ?=
 =?utf-8?B?Z1FxVVkyRnUrOWVkdTAxVWlDMFVnYklvK0ErZlRkRHRXSUVPc2E2NHp2cS93?=
 =?utf-8?B?TXZ2cHU5M1VXaTJLc0RvVUNlMSt5OW15TW5YaXZMRmwzamFkd2Vva3Z2QldI?=
 =?utf-8?B?UW5ZYkl1eEhPa3R0R2liTm5Zc1kvUXFhbVJvNWxIWEdKQkIxdmo2NWFaTkFi?=
 =?utf-8?B?OHNhWVVFdWgvM2xTUE4wQVFqRVIwM014bHJVVHFOYXZEY2REL0V2S0hGWWhD?=
 =?utf-8?B?cmFCV0M3SlNEYmZQREN3emtCN1VDSDhqbjdsSnpWMkxJSGFRWUQ2MTgwcS9Z?=
 =?utf-8?B?a0NYbFVXUE9xUzQzN2E5NEZWWFhxOWdqenB6T1Yybk4wYmN6OEZVa3hRN3lI?=
 =?utf-8?B?SmpTWTJ2enhXWlB0cmEzUG1yTmt0RmtOMEwwRkVxd21iVnVDMVEzRTNWM3pB?=
 =?utf-8?B?cHNiZFZ3M01GZURnNVRzSFY0a2E5NURIaUxSSzlDbWFqbGw2U2Q5SUF2V2dx?=
 =?utf-8?B?YkpFejdadVptdktESnd2UXVrRCt6VU0vaUdEdEFoaGtGdnJwNEU0ZGJ0aUk3?=
 =?utf-8?B?SHZBOHd2RlhVcEttY1VPcFI1SWQ0ZWFhcUdCVkxhdERMbnVta3BTOXlWUE1P?=
 =?utf-8?B?UWFMMzNMSmN5NVlnSUFFUnp1dktRaXBWOFROTzJkMWNjU2oxRUwvYTJyVzdy?=
 =?utf-8?B?UTBWT1FyN2piSkFOdWQ1UEdTMnNhNGxuSmVVcjZ1dS9zSjVvQzM5Z2JLZ3p4?=
 =?utf-8?B?K09FVVZXb21qYUdGQWRYSDFYSUhtbjRkRlNDMVVrYlh3VmpFRldwbklJcC90?=
 =?utf-8?B?Q2RBd2Fmdm9ta1o2eHg3aXlwem5jSnZ3YjhyMi9uelg0T2FuZnE0MnRESEtH?=
 =?utf-8?B?VTBCQmNHV281bSs5OS9PTEhwek5ZWXh5QWpUWi9FNlA2emFDSkdiRWtQS3ow?=
 =?utf-8?B?SlRUbytSZURqTjNaNHFYaHJDNUE0K2I3aG14TTlRZjNSL1NXWk4xSHJDQ1Fw?=
 =?utf-8?B?TTdrQnREV3JELzZ0ZVh1eVRla0lqYU42VElSMEVrUDZqd3lHZUtKQUtnUzNR?=
 =?utf-8?B?ZHhrRW0rSFZJd0tVbXZUL2Q4WllpWmpUTXhkeUFPL1Z0YThFZWx0Nk8yVHFv?=
 =?utf-8?B?MHlKUFpJLzRpU093cm9lR1dJZm1RNWQ0RGV5RmZ1SHZUU3EzOTBtSEszYkMx?=
 =?utf-8?B?RHNUak5ETXM1bzJmUWxmNmVRcWd0a09QQlR6Zjl2Q2ZoTDBvd2ZKY2pmcXJq?=
 =?utf-8?B?d0RjTFV2bER3NXpwWm1LdlgyT3U2MHp4TE5EaTN4aGJCSlNQcVcwZmRNTk43?=
 =?utf-8?B?ZnBndm1jRzlYNG94OENtZDhhRmt0S3J1TW1RSW9UeEVWajVJTVFWYm9SWkE4?=
 =?utf-8?B?Sklwc24wZjlpVHpJZXpURkVHUURtdzV5QTlFcFFCL291cWpsL09YZjdnSnNY?=
 =?utf-8?B?MjBneHllSTR5NVo0azF1elF0U1lzRHlaOFlLT1BtZmlOcS9HTEtSdHJSSTZx?=
 =?utf-8?B?UEhxYWwxM0ViM0Y5aDNBcmllaG0zNnIxS0FRU3NzTzVLZXM5aFBPd0RQQjV4?=
 =?utf-8?B?aThhdExaYTVuSkgrSDJPVVR5OWIyOFZNYTlYRUtYQzN4MnR6ZTlMMXFZN2Qx?=
 =?utf-8?B?QUdEVlBQVzhXYlhmS1ZobVJ0VWh3bHRDVmE5T2VITlU1N0lQdlFteE5MM2Nr?=
 =?utf-8?B?TU5wQU01MzMrY1JESWVObHhVdkJ1VHY1UlhkVkFHRW41R1gwbUNyVjlEZ3B6?=
 =?utf-8?B?Tkt3SUJNWEhpYmJpRkNtVlFvVGJmeFc2ZlA1UVBlVUlhbUZLZTNZYURIcll3?=
 =?utf-8?Q?cre1Hddp1bPaISPS1afEzTw=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb08.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(42112799006)(36860700013)(82310400026)(13003099007);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jan 2026 15:15:14.7065 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 693a458b-07a5-4152-0f03-08de5f493445
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL02EPF0001A0FA.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR12MB8469
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.81 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[amd.com,gmail.com,lists.freedesktop.org,linux.intel.com,ffwll.ch,kernel.org];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gitlab.freedesktop.org:url,amd.com:email,amd.com:dkim,amd.com:mid,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[sunpeng.li@amd.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	RCPT_COUNT_SEVEN(0.00)[9];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 94C0BB1587
X-Rspamd-Action: no action



On 2026-01-28 23:43, Derek John Clark wrote:
>> From: Leo Li <sunpeng.li@amd.com>
>>
>> Some drivers need to perform sleepable operations prior to enabling
>> vblank interrupts. A display hardware spin-up from a low-power state
>> that requires synchronization with the rest of the driver, for example.
>>
>> To support this, introduce a DRM-internal drm_crtc_vblank_prepare()
>> helper that calls back into the driver -- if implemented -- for DRM to
>> do such preparation work before enabling vblank.
>>
>> v3:
>> * Unexport drm_crtc_vblank_prepare() and make it DRM internal
>> * Drop warnings in drm core for vblank_prepare(), drivers can do so in
>>  their implementations
>> * Drop unnecessary crtc null checks
>> * Check for drm_dev_has_vblank()
>> * Rebase on latest drm-misc-next
>>
>> v4:
>> * EXPORT function to fix build error on DRM_KMS_HELPER=m
>>
>> Signed-off-by: Leo Li <sunpeng.li@amd.com>
> 
> Hi Leo.
> 
> I wanted to know what branch this series applies to. I'm trying to
> troubleshoot a possible vblank issue on the Legion Go 2 and was
> pointed towards this patch series. Unfortunately I can't get it to
> apply cleanly to drm/drm-fixes, drm/drm-next or stable/linux-6.18.y

Hi Derek,

This applies to drm-misc-next, here:
https://gitlab.freedesktop.org/drm/misc/kernel/-/tree/drm-misc-next

Thanks,
Leo

> 
> 
> From commit 15392f76405ecb953216b437bed76ffa49cefb7b (HEAD,
> drm/drm-next, drm/HEAD):
> $ b4 shazam https://lore.kernel.org/dri-devel/20260127194143.176248-1-sunpeng.li@amd.com/
> Grabbing thread from
> lore.kernel.org/all/20260127194143.176248-1-sunpeng.li@amd.com/t.mbox.gz
> Checking for newer revisions
> Grabbing search results from lore.kernel.org
> Analyzing 2 messages in the thread
> Analyzing 0 code-review messages
> Checking attestation on all messages, may take a moment...
> ---
>   [PATCH v4 1/2] drm: Introduce drm_crtc_vblank_prepare()
>   [PATCH v4 2/2] drm/amd/display: Implement prepare_vblank_enable callback
>   ---
>   NOTE: install dkimpy for DKIM signature verification
> ---
> Total patches: 2
> ---
> Applying: drm: Introduce drm_crtc_vblank_prepare()
> Applying: drm/amd/display: Implement prepare_vblank_enable callback
> Patch failed at 0002 drm/amd/display: Implement prepare_vblank_enable callback
> error: patch failed: drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crtc.c:277
> error: drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crtc.c: patch
> does not apply
> 
> 
> Thanks,
> Derek

