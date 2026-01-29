Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YBGeBJCNe2mlFQIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 29 Jan 2026 17:40:48 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B303AB2512
	for <lists+dri-devel@lfdr.de>; Thu, 29 Jan 2026 17:40:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF68C10E8A7;
	Thu, 29 Jan 2026 16:40:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="hmfFiv4v";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SN4PR2101CU001.outbound.protection.outlook.com
 (mail-southcentralusazon11012023.outbound.protection.outlook.com
 [40.93.195.23])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6BC9110E8A2;
 Thu, 29 Jan 2026 16:40:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fLm+FSSRTXVoITsfaZo55PQtEo964mJX8U5lNmDaQpAV7CXbRDdovQahp4xw2wF6FWL6/KAeZvunKeo4Fjxu99W7PraE3pXJey4DmBnaRcRnEHsgJsFPNNuFYbGxinv8SeYHjnY1AMPno4afSR0ommBg/i7QA8tOEouUNNJ/OMbkoR9J5cNy6fQyIDjFLPsUCbFHON8IIkzrRqOkEIQTDkP245eoPzFlQSA+ieqRlT5DrxP4IwEdcnl9WU+NBGkWQ1Mca+qzD6xB+2mQQ4KMsGD2PbXrmYQtRY7mS56cf8f+MlYmi3eEJqnnct1dSAG+Jag8VIBNeu0BLS5hvLJrjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=46Vvu6wfYEZk9amWlyzzgDCFGa/bD3yDwFJNQiLUn2E=;
 b=m1bChufX2V+y8NNTncbmHB3E0g4768mAoaZ7xufE0fjqUzD7R3A/NhPBhb4cgzNrgtuM7QUGIQYTjp/pP6VkYNW2g4Vm6zAoVp/HOiW+bJQHqMvnZtN8l+CY3tMLcj+4sltkYpeVZo5HX8BSQitXu1yAKrq/smTYq/hThoBv/9eK9u0HZG4Chu3rhsItzadhTa7DKj2S6p7LWxadGVx5yuiZ54JomcKIMtonjOHw6O0bmjILoAarLXLpQNfXTGH7B4EbUy3nfc8w6+HK2jvFh77LNxrrMpmGO/QfpzJvLoPI7/oLsNl2ZlVqwveQzgjqiLfZgBAutCCszOM4wspF4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=46Vvu6wfYEZk9amWlyzzgDCFGa/bD3yDwFJNQiLUn2E=;
 b=hmfFiv4vgddjG0xSZ+nPkMxJquTa4wxG/LfuNHLuyVb1RzkUKxc0HYcCRBuEMNq+euBnVPKj4HcpI35+64brAOI3OmAvT5Vq52+o/5JChH55GBWCccI3ku6aJRTLDHOYogAjonsCVoYlwTm89e0P7HuSL8WrmuK2E2/ed80UZos=
Received: from DM6PR06CA0044.namprd06.prod.outlook.com (2603:10b6:5:54::21) by
 SA5PPFA403A61D8.namprd12.prod.outlook.com (2603:10b6:80f:fc04::8da)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.8; Thu, 29 Jan
 2026 16:40:39 +0000
Received: from CY4PEPF0000EDD0.namprd03.prod.outlook.com
 (2603:10b6:5:54:cafe::bb) by DM6PR06CA0044.outlook.office365.com
 (2603:10b6:5:54::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9564.10 via Frontend Transport; Thu,
 29 Jan 2026 16:40:38 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 CY4PEPF0000EDD0.mail.protection.outlook.com (10.167.241.196) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9564.3 via Frontend Transport; Thu, 29 Jan 2026 16:40:37 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Thu, 29 Jan
 2026 10:40:36 -0600
Received: from [10.254.93.26] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Thu, 29 Jan 2026 08:40:36 -0800
Message-ID: <31babc28-0e69-46e5-94cd-8856e9ad6550@amd.com>
Date: Thu, 29 Jan 2026 11:40:35 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/2] drm: Introduce drm_crtc_vblank_prepare()
From: Leo Li <sunpeng.li@amd.com>
To: Derek John Clark <derekjohn.clark@gmail.com>
CC: <Harry.Wentland@amd.com>, <airlied@gmail.com>,
 <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <jani.nikula@linux.intel.com>, <simona@ffwll.ch>, Mario Limonciello
 <superm1@kernel.org>, <ville.syrjala@linux.intel.com>
References: <CAFqHKTnSUndwTs-cc8SZxST48UBj6_oKf0Bzt_mMSsj6=g-xww@mail.gmail.com>
 <923ab7ae-0963-472e-995e-760c30978274@amd.com>
Content-Language: en-US
In-Reply-To: <923ab7ae-0963-472e-995e-760c30978274@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EDD0:EE_|SA5PPFA403A61D8:EE_
X-MS-Office365-Filtering-Correlation-Id: 0745b5eb-9335-4389-91e7-08de5f552204
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|42112799006|1800799024|376014|82310400026; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?OS9OY1JKR1BGdW1ENU43ZW1YaVBaSjN2YmdQWlVGOE5sQWx3TzdFWDlrWTlj?=
 =?utf-8?B?c0tZa3FkY2xpQnBnNWFDd1NiWnZjZ0cvTlFkd1c3bFoxcloxMWRVTUJLUzNo?=
 =?utf-8?B?SnhKS2t4d3l0Mko4aCtmdHR4c3ZPRjYwbHI3dFhMN3NVNjlLc3F0WVZsV0Z0?=
 =?utf-8?B?S21WODhLMzcrSjQxODBGRzBlcENCMG1KSHlaRS9tY0VlWDExNHlJV0xSVGlk?=
 =?utf-8?B?bk93Yk5WL2FUZ1U2eFBiVW1UeHBHNW1UbXJzMDlrenZialRQRmxtM3NCTFlz?=
 =?utf-8?B?L1ZydkxVM3Y0R0RhYVdWenFQZzF2N1NGcjBnVWVwcWNaOVBlYVY4ai9KU1No?=
 =?utf-8?B?OUhVMTNMRmRpMFNCSDZqTWM3ODhOVjkxNEI4RFdYK1F0SGUvNmR0a09aL2VI?=
 =?utf-8?B?bi9UNTlyNTVuMHFvOWdaUEFDTzI0ZytUeUJQUG5sdjgzcHVpYnV1Qjlja0No?=
 =?utf-8?B?YkhqOUVad0tJTkZNZzFsTVk0RGE2M29qOUdmYVZUU09zYzRaVTZ6TzludE1W?=
 =?utf-8?B?ZE5IK21xTGNhOHdNa1AvWDJjb0JUN2lwSFliZDJqVnhxRW9EOXVOM0l1ZUlx?=
 =?utf-8?B?RkV3anRXU2hvRUQxbkYrSDBNaVdmeDlxOVVJMmxvem5UWS9WTkFnVVF0djNQ?=
 =?utf-8?B?VDduMFZYSndHUk9mdmFYakd3K1ZvT2YzejB2V2JpcEFOcWl6bUkvRUsyT2dv?=
 =?utf-8?B?SDlsTUdrU21CQ3d1WlJuT0hHNXZIMnZqN2pSTTZQYXdRdUlyS2RIdHVXZkVR?=
 =?utf-8?B?cXViNUhOYlpRckZiWFdGdVJLSHFVWUdTbmgwWS9wTjVUdzBMVW5WeXJhMWZo?=
 =?utf-8?B?aWp1NENPbUFPQ2txNWhDMmZRWFo2eFBrTXhyVGV4NldCQUhRTXhRek1reThv?=
 =?utf-8?B?YlJYU0hYb3NPdk1yOHVNMmJGQjQrWEs1UjluNmhHR3ZEbTZndlpWWlJ5bEFr?=
 =?utf-8?B?cWRPbHZtTDNZYWJndG5Cdm9JTzZKcXFodEllZ1I2MGxIcVh1OUpsRVNSMTMz?=
 =?utf-8?B?cjJRRU1zVmtHanVmV3d2L292SFVlWFIzS3hSMEZzVVloMEVSSDhveGlGeGFz?=
 =?utf-8?B?a0g1UGhJa1NhVnRXUFhxZ2xEUTVOejlpNlE2UEoyZ2VjQ3pRZHNYbC83WlAr?=
 =?utf-8?B?WlJaZjRHZHlFRThCNVVmVkloRDJ4MXdhYkRkWnhaYXJyUFBmQWlvWWVONU9j?=
 =?utf-8?B?YXpvK2hUTDYrVnEyc2R5T0FaVnlPcnNCbDlZQWhDcjRzdHpOWkJWVUVURmZN?=
 =?utf-8?B?d2xmT2NvcFRTSHFTZTFDdmFpc2VWZHJkNGVTS3g2Y1dQSitrMEhyV1VoZHhq?=
 =?utf-8?B?bFRuTWxPTzBneitNeHNKMWlpd3BZTGUxRy9ndm5iOERyVE5lZFRwSkZ4Nmdo?=
 =?utf-8?B?WXFhanFuT0prMHRsMXF2SkI0RHBnTUVjNU9GMGxGSEs0aUY1TWpjaU1IOWtl?=
 =?utf-8?B?SU04UENKOEFTbmdXN2xTcjBzTkU5emVoTmxIaEVHNzVmTUtYNk80dDF5OXU3?=
 =?utf-8?B?YmNWM0VpSmVyRE13OXgySWxjVWhHeVdNLzBnRXZjbU1pUGJtdHVpOUJBWEo0?=
 =?utf-8?B?ZHVJcjJ0VkdPamRhNkpnbUJEcWpKdnZPRFlvelFoVnpwd3pvUDZuTXU3SkVU?=
 =?utf-8?B?dEp3YjVya2FyK2hwQTFGRjkyZHZhWVNlYzhjMUwzbktXUm9IajNGbWxjVWFQ?=
 =?utf-8?B?Q2QweHhSTVRsQVlGQ0NMRmgvNlhSUVNxTmV0YlhSczZJL1dHQlNDNHZqeHVx?=
 =?utf-8?B?dWxRRGhHWlp4ekRIRFR2SVArekVJWW5wTzgrYUhKZFpYSUh6TTVCTFYzQ01h?=
 =?utf-8?B?cUtoc09LRmtxbXlqdjIyNXZRT2ZSSmN5VUEzT3lFb1NWMEdkdnJLWkwzOFA2?=
 =?utf-8?B?SGVjUElhUTlsWnE1VS9Tc2NlOHh5Tk9GZUhlU0ZtYnlDUHlzQy8yNmlINEg4?=
 =?utf-8?B?UDFlc212bWRWNUx2VFZEK0xlWXRBaWUzUnZFMyt1OGVQN0lmb205SVc5VXk5?=
 =?utf-8?B?NW9qeUFmWjJyOW9MRzVja2Ntelg3SXpsTE8vbW1rWjFoWDVpS0hhM2V2ZzRu?=
 =?utf-8?B?OXF3YVdRMXZMTERMUTJjS090Q244UExkK1ZRbERGZzFuYzBiQmdQb0p0cncr?=
 =?utf-8?B?YU9GdFhSZmRXUG1XUGlpeTROWHhNYXYzdTBiY1FiUi9peHpiZ3R0NnBCTW5l?=
 =?utf-8?Q?7HelOKuR5YrNS8cQgGivBc8=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb08.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(42112799006)(1800799024)(376014)(82310400026);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: S2kFfZVl3QjyFDXY/4zPELP2gz9kucBWcYN93Uaba2OPoWfwlgrrVdN9KW2Gl4G4RmPZkhK3p2C3hHyVksKtd2GoPUzuZmqQe9skl2ib4zznyn8OYLrEZCz9CT10kzaO0K/hNvP5EYfQ0kRpgjkfFDgZZ0o62xRnK2yZDfVoT5RFq5ewwgqln5mTdN9i7bT3PjT8OnQ839kvtPsTfsETP7N3mOqIf5tAIGbP4VCkCOCvHt8rUsEWGvZjHZMX6oxFHqIO4fpRWYMf2yIT5Jafh3DlfCX7bgBICIf4m2GzX0gNQrIbhbz7AndmL5PrC2hQHWQZ/WjQbzIhQFxP9Najt3LQPd2EICv89psvjWfwwSWHZW5J7rwf8s0do2MQc5p3TMtUh5ai1jVPsaBPNCvdKPV1F5cmNo8D3fbaPIDRSK1REaRHaPvinPK6QSVGuPai
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jan 2026 16:40:37.9731 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0745b5eb-9335-4389-91e7-08de5f552204
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000EDD0.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA5PPFA403A61D8
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,amd.com:email,amd.com:dkim,amd.com:mid];
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
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: B303AB2512
X-Rspamd-Action: no action



On 2026-01-29 10:15, Leo Li wrote:
> 
> 
> On 2026-01-28 23:43, Derek John Clark wrote:
>>> From: Leo Li <sunpeng.li@amd.com>
>>>
>>> Some drivers need to perform sleepable operations prior to enabling
>>> vblank interrupts. A display hardware spin-up from a low-power state
>>> that requires synchronization with the rest of the driver, for example.
>>>
>>> To support this, introduce a DRM-internal drm_crtc_vblank_prepare()
>>> helper that calls back into the driver -- if implemented -- for DRM to
>>> do such preparation work before enabling vblank.
>>>
>>> v3:
>>> * Unexport drm_crtc_vblank_prepare() and make it DRM internal
>>> * Drop warnings in drm core for vblank_prepare(), drivers can do so in
>>>  their implementations
>>> * Drop unnecessary crtc null checks
>>> * Check for drm_dev_has_vblank()
>>> * Rebase on latest drm-misc-next
>>>
>>> v4:
>>> * EXPORT function to fix build error on DRM_KMS_HELPER=m
>>>
>>> Signed-off-by: Leo Li <sunpeng.li@amd.com>
>>
>> Hi Leo.
>>
>> I wanted to know what branch this series applies to. I'm trying to
>> troubleshoot a possible vblank issue on the Legion Go 2 and was
>> pointed towards this patch series. Unfortunately I can't get it to
>> apply cleanly to drm/drm-fixes, drm/drm-next or stable/linux-6.18.y
> 
> Hi Derek,
> 
> This applies to drm-misc-next, here:
> https://gitlab.freedesktop.org/drm/misc/kernel/-/tree/drm-misc-next
> 
> Thanks,
> Leo

FYI, in case you run into the same issue, I had to blacklist my wifi driver:
modprobe.blacklist=mt7925e in my kernel cmdline for drm-misc-next to boot.

-Leo

> 
>>
>>
>> From commit 15392f76405ecb953216b437bed76ffa49cefb7b (HEAD,
>> drm/drm-next, drm/HEAD):
>> $ b4 shazam https://lore.kernel.org/dri-devel/20260127194143.176248-1-sunpeng.li@amd.com/
>> Grabbing thread from
>> lore.kernel.org/all/20260127194143.176248-1-sunpeng.li@amd.com/t.mbox.gz
>> Checking for newer revisions
>> Grabbing search results from lore.kernel.org
>> Analyzing 2 messages in the thread
>> Analyzing 0 code-review messages
>> Checking attestation on all messages, may take a moment...
>> ---
>>   [PATCH v4 1/2] drm: Introduce drm_crtc_vblank_prepare()
>>   [PATCH v4 2/2] drm/amd/display: Implement prepare_vblank_enable callback
>>   ---
>>   NOTE: install dkimpy for DKIM signature verification
>> ---
>> Total patches: 2
>> ---
>> Applying: drm: Introduce drm_crtc_vblank_prepare()
>> Applying: drm/amd/display: Implement prepare_vblank_enable callback
>> Patch failed at 0002 drm/amd/display: Implement prepare_vblank_enable callback
>> error: patch failed: drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crtc.c:277
>> error: drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crtc.c: patch
>> does not apply
>>
>>
>> Thanks,
>> Derek
> 

