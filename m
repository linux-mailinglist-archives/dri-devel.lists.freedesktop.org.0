Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EEAcDE9oi2kwUQAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 10 Feb 2026 18:18:07 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CFD811DC88
	for <lists+dri-devel@lfdr.de>; Tue, 10 Feb 2026 18:18:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6347410E5E1;
	Tue, 10 Feb 2026 17:18:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="qYRlJjVx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BN1PR04CU002.outbound.protection.outlook.com
 (mail-eastus2azon11010005.outbound.protection.outlook.com [52.101.56.5])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 448A510E5E1
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Feb 2026 17:18:02 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aIZzUo3qHKhyCvY+x7RiPxB+oeIW6xtAlQCIU5BMkpUhh0Xf8TemY2MHWJiJQfrEyjvAuTykg+l/2Si70LJTrw2JrbO0cchVeV8bFgumUgXohn+SSO40BOC63bLpHMcxgQqZBp0GlPOEknWmP5uopGaLWKI7cYNMofICUwpJ77nMAiPilWGTx01sK9qAUU+zkJILhnRC3baCYQsyhTZu1P8jWzU9I7dn2qTcoBsW3aVXkTtitq2gRfydqsY01WAtAml8m3r81x9zVwsPSn1onKFQFZSgng1XY9+8HAnLGZ2lqOAPCs1R41Nia1uCBb+spk7m4blVGtjC1NV5o1NF3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AJQ5WGF5RzBKq4IRuqn1x0J91HHXtkerSoy1WZL4VaM=;
 b=EtbsTEn0kZulPWUpbhd8FxlqXB7WtGOMsxubbaFMJYV9WuavM9ohorIlLgPyHQd3H/z/X6Zrtj3YEopgP5WOnHxH4HmMr0TC8rgy37dxUkLjN24SEcthkvJBNdinv7IbptQBSZ3C10mr8uJBzg8xG0KJ2yJsy1obttIrwXbuCrR+zxprgnvZHO1xHqZ76bVa7hOQA+4MQ9qEA26GfNFLO79gqMeXfmshEMK5fZ3YYKJeSnVcxOj1q/n/6OvvziIwlicEIxejdUWjv4DPRcMSq2pNlndN494Wvpc9Wr8fv6kD8htETFr93V4+9wc+sGUjtKyNCd0WUWSRrQvDq6UoFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AJQ5WGF5RzBKq4IRuqn1x0J91HHXtkerSoy1WZL4VaM=;
 b=qYRlJjVxiIw7QUe2to1BlXneTCFTzyAIus9p6s4WMUjGAz+jH3qXchz0xb0sLU6qH2NRm90EMkGsg+r1IXfS17QRcM0MTLL7Tm5FR5nBoU2YgZ9wrGjKbf4qMAcG4v3GJgKitGz6myKSk9nfqkTnXfJEyo+VNNVx+ve/bQ6v5Og=
Received: from DM6PR07CA0074.namprd07.prod.outlook.com (2603:10b6:5:337::7) by
 BN7PPF49208036B.namprd12.prod.outlook.com (2603:10b6:40f:fc02::6cf)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.12; Tue, 10 Feb
 2026 17:17:55 +0000
Received: from DS1PEPF0001709D.namprd05.prod.outlook.com
 (2603:10b6:5:337:cafe::3c) by DM6PR07CA0074.outlook.office365.com
 (2603:10b6:5:337::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9611.8 via Frontend Transport; Tue,
 10 Feb 2026 17:17:54 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 DS1PEPF0001709D.mail.protection.outlook.com (10.167.18.107) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9611.8 via Frontend Transport; Tue, 10 Feb 2026 17:17:55 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Tue, 10 Feb
 2026 11:17:54 -0600
Received: from [172.19.71.207] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Tue, 10 Feb 2026 11:17:54 -0600
Message-ID: <3de11e56-39d7-fee6-2e09-97110dec5cb2@amd.com>
Date: Tue, 10 Feb 2026 09:17:49 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 1/2] accel/amdxdna: Fix NULL pointer dereference in
 mailbox channel cleanup
Content-Language: en-US
To: Mario Limonciello <mario.limonciello@amd.com>, <mamin506@gmail.com>,
 <ogabbay@kernel.org>, <superm1@kernel.org>
CC: <dri-devel@lists.freedesktop.org>
References: <20260210164521.1094274-1-mario.limonciello@amd.com>
 <20260210164521.1094274-2-mario.limonciello@amd.com>
From: Lizhi Hou <lizhi.hou@amd.com>
In-Reply-To: <20260210164521.1094274-2-mario.limonciello@amd.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF0001709D:EE_|BN7PPF49208036B:EE_
X-MS-Office365-Filtering-Correlation-Id: 03d11457-eaaa-4ae3-ee01-08de68c85468
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|36860700013|82310400026|13003099007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bFZONEtKMUdKemVPU2FVeTY1MklhQWpWempFYkMxRng0TVVuQ3o3NDdxZmtI?=
 =?utf-8?B?NzN0bVNKNEhWM1B6aEdHb0djYW91eXhKZkQ3WHIxZHQvVklxR3ZXVTJsc1Nl?=
 =?utf-8?B?dXJJMHRUOWc4NTNTM0VtMU9OYWlXZ2wyVi9PYUZodkgxV2pTMGk5SFhMTEpq?=
 =?utf-8?B?MEJEVVZtSjhYMytsKzBETGkrQTM3S3JPbzRiK3NzODM5bzRzL1Nqa1pxdGxs?=
 =?utf-8?B?REJGYnQrTkl3b2tydVJlSmJBRTFVMXZGTGN0LysyRDlvc1A4OTNVTVFsZDc5?=
 =?utf-8?B?UHFqdmJjMlZGZjZPZzJkZlRjd1YvMXpSOHo2VUszVy9uRURiZEF0QjN4a3RM?=
 =?utf-8?B?UGdZVGg4ck82VUJaVUJHd2VTUmlaMHdUWE13c05WNXNxS1dzZXNSS1A0RmR6?=
 =?utf-8?B?UEVWeG85RDdyZEUyRDRqenJ4anNSbE5jNWRuRXFmdDNLMHlJQm9QdHUwVHd0?=
 =?utf-8?B?N1RyNjlWUkQzbEFJaGJZQ3ZIZFhtdzFOUjdrZDBSSUkyY1VSekpxVmlyNW9M?=
 =?utf-8?B?czMzdmc4UXYrR294THFFdTRJVThGKzg0bjl3YWpLRHRQV2xzSnhhSDFaTGU2?=
 =?utf-8?B?YmJrSVI2OFNvR0s5S2kwdWIwcFFKdnJ6dXovcHRDMG5SK3ZLWXUyT0ZKUnY0?=
 =?utf-8?B?VlNhU29XR3JRZ2c0bnZZS3VBWWRyWS90N2lmSEY2UVUwU25WWWVpdWpxbml2?=
 =?utf-8?B?b1JjZzRVOG9nMnNMT20xakcrWnpwNWx2YXN2Nk8wakM3ZVhsWlZaM3gxMXoz?=
 =?utf-8?B?bVpxV2hEK2lBM01EQUFnalQ4TXJKd1NNeUljREVKOWU5NHhsa2JxREE1OWVG?=
 =?utf-8?B?clBsUjAwTFpPVHp2WEllUFRKRk5raVpGUkZLSlNoL1ZlcHNOZkt6R1RMU0po?=
 =?utf-8?B?UmYzVjZCVUozTktVMHhhVy95RFc0SE5QVUMyNDA2d3h2QWdFV0JjV2dyOTFU?=
 =?utf-8?B?eGQySHNYVG5oWGVXS3Y1cXFScWJmK3lwc0UvT3hLcStwS3hERmFPMlBtQUxy?=
 =?utf-8?B?enlCOXJsWnhsdGlGN0gzbjVDSlgreDFhcHZXZjZJWVhOTGZFa1BXTEtNeGlY?=
 =?utf-8?B?M0RZY2hnZCtiSEN2Mm1CRVp2K0plWWFIb3JlZ1pmbGNJQ1ZCSk1UQ3N0aHpj?=
 =?utf-8?B?UkxaRzNMNjRLOXU2KzZYOXNtd21sYU5HTTRqQjFlL2YyNkthajR0T0tIcHNO?=
 =?utf-8?B?VjBTb0syVldLclZtZHhFOW9odlZOMkJOek1OVDAzaDR2Ni91TTRDVEU2TWRZ?=
 =?utf-8?B?eU9DMFgrNmVOcHNmQU5acjU4WFNnS3c2VDF3SVB6dDArZ1RvNjJQNzdwR3Vz?=
 =?utf-8?B?TmsyKzRDYi82QmxnSmNSb0lXMVozWllIREF2Zkk4dGhIcTdwbWs2Z0tjWGE0?=
 =?utf-8?B?OHc3cFZEZFdJcHg5bkhCU1pWWUVOemZjd1dqMzRRT3o1MVJqdHhUalZvb2U1?=
 =?utf-8?B?ZC9rRGZYd3NUN25HZVQzTlpqNk9HcUx4bU03RTBiamJJNFhuWGw3SWtCZlJn?=
 =?utf-8?B?NFNnU25xMVdjaE1ETUF5c3EwQm5TZC9RV3B3MnFLcGlvZWVvMVR3YlpINWVn?=
 =?utf-8?B?NkdmVlVWNVdjZmM4dHlXcHVITTJORnBKblJIVDUwVVdKcUVLeGcwSFZLb0Y0?=
 =?utf-8?B?OG9qVkUyU3dXQ0lSTTlaUHJrWHVETWxTc29KbTVWb2xKZ1pwYTFiY3EwY24y?=
 =?utf-8?B?SmVub0s0M1Y4VllLelRubmVtWnRnNmIxM2JFRXVza0h0Nk4vVWIwRkc5cGVs?=
 =?utf-8?B?eituNUhvL05kWG56VFJqcm5ubUZ5VnNSZXMyNnA3QmJwWWVtMVR0dmJyUTBH?=
 =?utf-8?B?dGpHWWFWWXM4YlFiSkw5K1dPTm1HeG8zcU9tektuTXlJcHhxdmdLV0FlcUoz?=
 =?utf-8?B?TkRZQ3gzb3NLV1FhdnFzYVZxeDgrZ2dYcjlQalB1ZE1RYStETUdtZkt0TlVM?=
 =?utf-8?B?b0hCdlhyQk5yZmRoY09uUFZoQW9EeG9ZL0k4SWFxSW11dGhSUnR1VmlUS1Nx?=
 =?utf-8?B?amVDUTFUSzRXWVI1bUFlbXlYN0VIWlFwRG1XNWxUb2hwaEhDTGg2aGNITVlX?=
 =?utf-8?B?UmhUeWRNeTFoTTdudjF5Mm05UzRLSEJpZUZOaHJ4RWFsVVNwWjdVSmNyNWtG?=
 =?utf-8?B?RHFrOUZUSDc5Z2JPaDIyYjdDRExsbXNGUXp5aEpqc2Fxb2greTdFL0tPQlVI?=
 =?utf-8?B?MFUrTnp0Yk8zMVI4WnhIM3FVeU9VNG45SFNIcUhaSERyQlBqYjRVeW11VFBs?=
 =?utf-8?B?VWQ0L0o3dGZZbEhWRHRlTElUNkpBPT0=?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb08.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(36860700013)(82310400026)(13003099007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 6piYRf0lWwPbXMeymM8DThUSQ0f+mkkQHZVkFj12qVVeylthCJWeMBAFFvLRW/bWNBryZdU/exc7w5x21zvnrfqKwBZPlhBJBcLxu+1Jh5S7EUrtTJ6ClGYFppoUncl9X6khYB3lL+cQir4fezrvonfbnne2c4aUDaI/Nux+tEB0mUDIVZYWPXTWmt1TyziNG6OTb06hXoKuvJ6rrjiKzbBuQjOw9MsVmhJf9LHW0ie7Fntj/uxSZkyrXu4S7UPOdqVblfnwg31MEewknDSrvGjfac9zZCxcXUphtk4PKot/F1+uR6MCczNUYSuKN7ocTwxEtPFVLE8OMk5K6bUyR9IhtKUY+RXEnsxMWb8jNXdE0CP3yVmz6uK3D2zERVnoSjFwj//DweOrXFecwauKs/w+iwlbneZPkYP2Fmt5vIuP/CdpmYfj4l8vUwqv3vVs
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2026 17:17:55.1608 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 03d11457-eaaa-4ae3-ee01-08de68c85468
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DS1PEPF0001709D.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PPF49208036B
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
X-Spamd-Result: default: False [-2.31 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:mario.limonciello@amd.com,m:mamin506@gmail.com,m:ogabbay@kernel.org,m:superm1@kernel.org,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[amd.com,gmail.com,kernel.org];
	FORGED_SENDER(0.00)[lizhi.hou@amd.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:mid,amd.com:dkim,amd.com:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lizhi.hou@amd.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 7CFD811DC88
X-Rspamd-Action: no action

Hi Mario,

I posted a fix for this: 
https://lore.kernel.org/dri-devel/20260206060306.4050531-1-lizhi.hou@amd.com/

I am not sure if it still a good time to merge to drm-misc-next-fixes 
for 6.20 kernel. And I plan to merge to drm-misc-fixes during 6.20 rc1 time.

Thanks,

Lizhi

On 2/10/26 08:42, Mario Limonciello wrote:
> aie2_destroy_context() is called during various cleanup paths, including
> when context creation fails partially. If xdna_mailbox_create_channel()
> fails during aie2_create_context(), the hwctx->priv->mbox_chann pointer
> remains NULL. When cleanup occurs (e.g., during process termination via
> amdxdna_hwctx_remove_all), aie2_destroy_context() is invoked and attempts
> to stop and destroy the NULL mailbox channel, leading to a NULL pointer
> dereference.
>
> The issue was observed in the following call path:
>    amdxdna_drm_close
>      amdxdna_hwctx_remove_all
>        aie2_hwctx_fini
>          aie2_release_resource
>            aie2_destroy_context
>              xdna_mailbox_stop_channel <- NULL dereference
>
> Add NULL checks in aie2_destroy_context() before calling mailbox channel
> operations. Also add defensive NULL checks in aie2_hw_stop() for both
> mgmt_chann and mbox to prevent similar issues during device shutdown.
>
> Fixes: 97f27573837e ("accel/amdxdna: Fix potential NULL pointer dereference in context cleanup")
> Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
> ---
>   drivers/accel/amdxdna/aie2_message.c | 14 +++++++++-----
>   drivers/accel/amdxdna/aie2_pci.c     | 14 +++++++++-----
>   2 files changed, 18 insertions(+), 10 deletions(-)
>
> diff --git a/drivers/accel/amdxdna/aie2_message.c b/drivers/accel/amdxdna/aie2_message.c
> index 7d7dcfeaf7942..77e3cdf18658b 100644
> --- a/drivers/accel/amdxdna/aie2_message.c
> +++ b/drivers/accel/amdxdna/aie2_message.c
> @@ -318,11 +318,15 @@ int aie2_destroy_context(struct amdxdna_dev_hdl *ndev, struct amdxdna_hwctx *hwc
>   	struct amdxdna_dev *xdna = ndev->xdna;
>   	int ret;
>   
> -	xdna_mailbox_stop_channel(hwctx->priv->mbox_chann);
> -	ret = aie2_destroy_context_req(ndev, hwctx->fw_ctx_id);
> -	xdna_mailbox_destroy_channel(hwctx->priv->mbox_chann);
> -	XDNA_DBG(xdna, "Destroyed fw ctx %d", hwctx->fw_ctx_id);
> -	hwctx->priv->mbox_chann = NULL;
> +	if (hwctx->priv->mbox_chann) {
> +		xdna_mailbox_stop_channel(hwctx->priv->mbox_chann);
> +		ret = aie2_destroy_context_req(ndev, hwctx->fw_ctx_id);
> +		xdna_mailbox_destroy_channel(hwctx->priv->mbox_chann);
> +		XDNA_DBG(xdna, "Destroyed fw ctx %d", hwctx->fw_ctx_id);
> +		hwctx->priv->mbox_chann = NULL;
> +	} else {
> +		ret = aie2_destroy_context_req(ndev, hwctx->fw_ctx_id);
> +	}
>   	hwctx->fw_ctx_id = -1;
>   	ndev->hwctx_num--;
>   
> diff --git a/drivers/accel/amdxdna/aie2_pci.c b/drivers/accel/amdxdna/aie2_pci.c
> index f70ccf0f3c019..9c2572706bf53 100644
> --- a/drivers/accel/amdxdna/aie2_pci.c
> +++ b/drivers/accel/amdxdna/aie2_pci.c
> @@ -324,11 +324,15 @@ static void aie2_hw_stop(struct amdxdna_dev *xdna)
>   	}
>   
>   	aie2_mgmt_fw_fini(ndev);
> -	xdna_mailbox_stop_channel(ndev->mgmt_chann);
> -	xdna_mailbox_destroy_channel(ndev->mgmt_chann);
> -	ndev->mgmt_chann = NULL;
> -	drmm_kfree(&xdna->ddev, ndev->mbox);
> -	ndev->mbox = NULL;
> +	if (ndev->mgmt_chann) {
> +		xdna_mailbox_stop_channel(ndev->mgmt_chann);
> +		xdna_mailbox_destroy_channel(ndev->mgmt_chann);
> +		ndev->mgmt_chann = NULL;
> +	}
> +	if (ndev->mbox) {
> +		drmm_kfree(&xdna->ddev, ndev->mbox);
> +		ndev->mbox = NULL;
> +	}
>   	aie2_psp_stop(ndev->psp_hdl);
>   	aie2_smu_fini(ndev);
>   	aie2_error_async_events_free(ndev);
