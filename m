Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GImiKkePoWkruQQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 27 Feb 2026 13:34:15 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C2F71B722E
	for <lists+dri-devel@lfdr.de>; Fri, 27 Feb 2026 13:34:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A874E10EB2C;
	Fri, 27 Feb 2026 12:34:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="AiGOdBAv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CH1PR05CU001.outbound.protection.outlook.com
 (mail-northcentralusazon11010033.outbound.protection.outlook.com
 [52.101.193.33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1EE0B10E189;
 Fri, 27 Feb 2026 12:34:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=M3FAK4X/qwrVhloxpSqnYEEmlOkRxk1sDfojA8WclON7DB7lV47j38bzbbOgC8NYtdr2QmojD0UkXWHkJbOuMIP5YTwE2pV4Sl/EoMnR8t1MRteI8V0YG1AJXpM5k1cHcjdGmETDgFnTdp6qjO2I413ltMTB7/sO6yZG3SVmtf174PLmBQbwWHRcVlHsxHCK5UbkJPxEZMy1TGW7yITuH9c4KPuZQzK2fF42hiUuIBA7hBagnrBafG3tq5jpTWFYtUq4PJCLAtybWFniE2jcj/8RFRFkHP5ZEK9uB7i4P3JAVrfelHVfz0iSO1Wio39B5y4/BaXPAmd/ZmFfdI7R6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+sUpNzy0YiOnXAYYwnjiQL6wmWvuj/QbaMuY02aSVWk=;
 b=wVmOR+XwMoIDtoy+zfWfGwq6RfGQCvTIa9Wpqg6zpAMKaaCXuudx3hw//thN8ijL/C1kXkZaZ2hmj70mJtTSNwwdFHOphoKrs1vztoeQyYHynr452+YQ4JHj/Oz/ijfLmt9TIKCjfMAwGa9aK7S+FGykbyE5YObKk/ODGTMZw42QFr/HoCM1rLFK8Y1NAjSX+rVdHMvSGm7QOm37GhFSCudm3ZfD/x8Z7/0z9j7vzc6VZO7gZNLegskEwkZ+zVveE/PixCt+ZIa9SC03yt4l05BmWUSMwrxh+9VQiXCjna03flXa3ocVd8+zmBdWQXroST3ffCwM7fg4JNSUs8P8OQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+sUpNzy0YiOnXAYYwnjiQL6wmWvuj/QbaMuY02aSVWk=;
 b=AiGOdBAv9pem1tevNAhlwQ5z2rOwqM2/HwayebstYUi7dodjFbGNb11d7TZWNqIRTRk2gl1G/BXYHSrs+A9mdFTXoqptrKjKm0Of7+N+80zi+qDAFz0IL7/iv0NtLdCXjvEWwrqbixefIkr9vjPOdx3qIQHjE2wcwZm6ewfTYeQccaMXj3Sbnv1CttpRaZAUVplsGr9R5fpcfw5uH1HWPyOIx6KmJGmmK4pufTg7vSdC030XeJ2tgZ+YUb25jjYxfKysuIr4KzDmrT31FpUVuy5c9PmuMH7Gj68t9fNCF/+v15wWvOA7F4REwjFX12abVw4o0XWQH0dkpXzcMRnqWw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BL0PR12MB2353.namprd12.prod.outlook.com (2603:10b6:207:4c::31)
 by MN2PR12MB4287.namprd12.prod.outlook.com (2603:10b6:208:1dd::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.15; Fri, 27 Feb
 2026 12:32:44 +0000
Received: from BL0PR12MB2353.namprd12.prod.outlook.com
 ([fe80::99b:dcff:8d6d:78e0]) by BL0PR12MB2353.namprd12.prod.outlook.com
 ([fe80::99b:dcff:8d6d:78e0%4]) with mapi id 15.20.9654.007; Fri, 27 Feb 2026
 12:32:43 +0000
From: Eliot Courtney <ecourtney@nvidia.com>
Subject: [PATCH 0/9] gpu: nova-core: gsp: add RM control command infrastructure
Date: Fri, 27 Feb 2026 21:32:05 +0900
Message-Id: <20260227-rmcontrol-v1-0-86648e4869f9@nvidia.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/4WOzW7DIBAGX8XiXCr+DVZV9T2qHNawTlADNOBYl
 aK8e0nSS085zmo131xIwxqxkWm4kIpbbLHkDvxlIP4AeY80hs5EMGGYEJrW5EteaznSOVhgZvE
 SWCD9/7viEn/urs/dgyuezl25Po5khobUl5TiOg0KlFtQSJR6nJW1SqPkCzovLFgmPNNKW+7sT
 Z2wNbi3TMPbX4qhPoUTvdXEfIa1h9NNUkb1KGB2jpvRmI+8xRDhtY++PxEdi/+KeU830R1+RG7
 ABG2t/ufYXa+/ExdGMTQBAAA=
X-Change-ID: 20260225-rmcontrol-bd8a06fc3a0d
To: Danilo Krummrich <dakr@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Alexandre Courbot <acourbot@nvidia.com>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>
Cc: rust-for-linux@vger.kernel.org, nouveau@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Eliot Courtney <ecourtney@nvidia.com>
X-Mailer: b4 0.14.3
X-ClientProxiedBy: TY4P301CA0124.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:37e::14) To BL0PR12MB2353.namprd12.prod.outlook.com
 (2603:10b6:207:4c::31)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL0PR12MB2353:EE_|MN2PR12MB4287:EE_
X-MS-Office365-Filtering-Correlation-Id: 9dbda13d-aaa8-4fe0-2d89-08de75fc4df4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0; ARA:13230040|366016|1800799024|376014|10070799003;
X-Microsoft-Antispam-Message-Info: PURdbLZCsTSIuz2beKeeu0d92ExtUT9TmYd9+ElLMRP6ZWGB4Ba0lJV7wJwgzBJwQnt7tRtXX/J+Y5MB3jkEqeg2Yikow23M7zUCv+/ietd7ewyltikNaIbUNvPq2MHC1jqPumwRjjdiM3HPlD6fvgl0xFBfWykFYgwXyoBile58/PO2yTxM/UgLIR029+KrOB3Myxv8r8p03QtxysqQf90YqphwrqCSc6wl8wIYwlW05U06e2JuOnHYrqwOhiINDJDxREJ2gCqVgX5QsVSbfe85exkb72xDC82yJUZaHd1BqrA7Mhr5AfK7Ej99bTOpaTEW7WBsIeV17rNncSYDP2ZzcAu3YufXvhcqMPknSG0LAOVUi+YVJTrdLRkoq35EhixlnNNpYMnORFDQX7eoTr+/vj4pffzpZbzwZxo2Y9MxQGAlb/aOjQyRBBWu6t6JnpkR1CiJacsjGWJsFPE2kB4N2hQCe+5rZvLepG6i3XPIZIvPSv57cmN76fk9r21oLLvxN+R8oUcSntou4BvQYfOfDRqDPuCVuSrHDE7slaArn+CTODgcG5zBorGxXDQ/ZL3l3LjMzDGwqszDSAAjvmtmpvJNB1no2LLa2iOcS16NzdSQeEkkkvoO7loa+VjTj1x9RPayVyVF+Tzsbj5N+qmjfDbUJU5XR/kTTh3Dosn3DjNsH8MDPQWM1IaPj7Zyf5GNurgzXqSEUXPpzhHqfRWV79B+o+V0Uk3GnbaomdQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB2353.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(10070799003); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TUF1NFU4S1NOMll2bktVU2JlenZrd0gyR0d0aFhjNHh2UE5oNUJjbGpOZzNM?=
 =?utf-8?B?T3A0TFRMTFZzc3F6VkYvVVE2Y2FEM24xcTl5YjJSQzNDVmZzWmtNMW83eVpX?=
 =?utf-8?B?RlN2YkVWbnFLbXFNTFhWbGlSb0Q4YmpEZXhkV0kvbW9sUlljUFhKbDllckdn?=
 =?utf-8?B?dkR6Y05CN0ovZDlGWkxuY3FaUzJxdDRqRDhaMCtwM0VNU1cveWtaRzJTbnRC?=
 =?utf-8?B?MjFwTFlvVGM2QitTSkJ4MlM2Yjg5SGM4TFFISUpLQWdrNUhZREhWRTV5VjlU?=
 =?utf-8?B?NERvRHFVWlJDSUcwR3JzVkhucmhxQTdiZUY3RSs0VnRHM1FwRUlVR3VBK2hl?=
 =?utf-8?B?Z0xSSjZCMHkwcFBFckpnd21mZGdkRS9ZZkZQdDhOYjEybWhjNGgyYnRJSXl5?=
 =?utf-8?B?VWRGQ1hBTnRENmhPeHg3aVg4elJUd2hwVDhkaFVXY2FaaUJjMjZtU3FlbmRD?=
 =?utf-8?B?c3B1U1RxS0lrbGtoajBPQmtpL1Q0d01jejNNSGwzRituWXBFeFlaTWQzeHZu?=
 =?utf-8?B?dmpnQ1Z1bHViblM4SG42NnQ1SmR5cHZYa3dFZ1N1eXpERDZna29xbGJRR2tQ?=
 =?utf-8?B?ZG5paEFwVUhXSjlHVjJpcnRTZldjOUFpLy9OMk9HODZiMU16Y1lkN0dSL01z?=
 =?utf-8?B?UkRQSXMzaCtOekVSbVd5RE14UDlxZlMrTUNFbEN3SGNaS0NMaWQraUhQRGpC?=
 =?utf-8?B?Nk1ibWdaQk4yZm0zTDdiaFVnTEpFMW5Bc0syeWlNTnFrOXdYNXNwSHJHQjVD?=
 =?utf-8?B?Wk5FSi91bktQWVdXYU80bzBmT3M2U1dWN3ArMDFTb1VtVkxIanpaVmJ4VDlF?=
 =?utf-8?B?YmlaL3c0YS81K1dkUjBZMDRBUEs5RFlKUGZlVUhjMEU4bGhjcWF6azRlR0tS?=
 =?utf-8?B?c1lCaXVKNk9kUVhMMEdWWEpRYXpaS2VPV0h3MWRzU1dFTTZIM2xaZWkzMUU1?=
 =?utf-8?B?Tzhkc1crVlJ5LzVQYjVQZzRsNzBpUnZxcyt2SkFhcWk5aVhJdWFpeml3WmJp?=
 =?utf-8?B?dFU1VlpabFlQd3pFZVYzaEpObDNBUTZGQ3A0MVZ0YzJXcnlOQ2NwSVVNUk5C?=
 =?utf-8?B?NzdxYnJYVi84TUsyM3IyWTUvb2tFMWU3N1pCMms4blhwQnFOOHAzOVhONjVl?=
 =?utf-8?B?aFJucnpjNUc1aFVDS2ZldmdTRUJlblRMaERsRS9GeGk0SnpwSUs5Q0ZkRVN5?=
 =?utf-8?B?d2hMRXpjVk44RjFNRWlEQ0xXVnptMWpQUHhPOXYyZks3ZkNIYmJlSWtvRFhk?=
 =?utf-8?B?Zkp6VFNHQlZlMnBRQ2tWM0owVHFKN2Z2NVVEODR3WGlXdzVFWkp1a1B4Wjhh?=
 =?utf-8?B?NVU1ampFVTVKdVJ6b3hNdUNnSXlzRGhFRlZESHljV0YranEwOUpkVjUva0sx?=
 =?utf-8?B?UkxrVm1DdjBOWmVTalFvK0RwUkkxWXptcysrWmdBNGhBclhzUUxNUk9qN0tY?=
 =?utf-8?B?eHpuaWhUZEJ2cHlhMUpFYk1vcGhrMzE1SHAzMG1lbG9KdnBpd3JGZTYrUm0r?=
 =?utf-8?B?bnBqRlJtaDVob0Z0YW1sS0wxYkV1TnhnZTJlSDhPRGZqYTZnTlBPdm1xNXVl?=
 =?utf-8?B?bWNHUXFvM2poZlRBbWxsU0taM08wWmtGYXhWTUltaWl2aTFUeW9ObDNWTXpp?=
 =?utf-8?B?NHNqdWpsY0ZQRHFhdFJRRjZTVm9kY2lGa3p6U2Y1M3haVkdTS0x5d1grd3hR?=
 =?utf-8?B?S3Y4Qko4a2p1RVIzV0RKQ2xhZ0l4ZjNXTnFKNnZ0ajhzU2RWTXcvSlI0Wm5m?=
 =?utf-8?B?U3RxVmR1eVZYQkw4c3F1OWxseExWTnJsbWlSMW9KOHRtVDZORFNpV1N5cUhv?=
 =?utf-8?B?NzUwZm00SUlHMm5DR1FFeFVUNllCdjVXWkNwclF6amZ2SmZPWHhmSkZ1UkhO?=
 =?utf-8?B?QmVOK0tPanJpTzhZbkIrcHJkTTFwMTExUGwvN0NON3ZMY2JxSk1OM1A4ZEx4?=
 =?utf-8?B?ZXA0TjJjdVVoaWY0aHRtK3d6N2lZTzhWSVBGR1NBVTFwK3RJaDZRVm1BVlJH?=
 =?utf-8?B?azRFc1lCTnFjbjMyZUpvSXFuTk5QS3Rza28vM3ZsQ3BkNU5aaGk3WVhjZFZa?=
 =?utf-8?B?aVVSU0VIZit4blRPWkZ6Z0xQVWZVdDQyU0tyc1pTaUlGVGpLT1RKbDVxK1gv?=
 =?utf-8?B?eEF0UlBoRjg5ZDJWdHNkRlJSZ3h5ZG1hdG0vaHNHYzJMaW1jbHAzV0M3dGF5?=
 =?utf-8?B?Y2FBNG9qbTZ1SmFvSVRBd1pIMUpFejRQdm1yTXpGTk9yTW1yaFR3aTN2MEho?=
 =?utf-8?B?cnlTd1NBdlA5REVwWEM0d2RJZDNFS2VFR1ZUTmMzZ3dWU000SVVxY3V4UFpa?=
 =?utf-8?B?Qm53aGd2MHN5anREUmYxS3htays2K2RwOEtyVXgyeU50ZU50TjlWelliRSsy?=
 =?utf-8?Q?TQLhXYVwGvqRvPMh7pkTTUjrZkRfcOGW9w+uXIkVLVvui?=
X-MS-Exchange-AntiSpam-MessageData-1: Fiwnim2oJddrrw==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9dbda13d-aaa8-4fe0-2d89-08de75fc4df4
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB2353.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Feb 2026 12:32:43.4238 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BAp6XeQeCKEgHZIlH1KAm3U7xFwgwjPZcgfFGniQvCrwolX1F5iqChWZ+iLoTJ9xKq7zIfQxPyLC5O/gl940kA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4287
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
	DMARC_POLICY_ALLOW(-0.50)[nvidia.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[kernel.org,google.com,nvidia.com,gmail.com,ffwll.ch];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[ecourtney@nvidia.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	RCPT_COUNT_SEVEN(0.00)[10];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,Nvidia.com:dkim,nvidia.com:mid,nvidia.com:email]
X-Rspamd-Queue-Id: 5C2F71B722E
X-Rspamd-Action: no action

Add the infrastructure for sending RM control RPCs. This is needed e.g.
for channel allocation.

This series adds:
- `NV_STATUS` bindings and wrapping `NvStatus` enum (used by RM control
  RPCs)
- The necessary bindings for the RM control RPCs.
- `RmControlMsgFunction` to identify individual control commands, like
  `MsgFunction` for GSP commands.
- `SBufferIter::flush_into_kvvec` for reading large RPC payloads
- A `send_rm_control` helper that sends a control and checks its
  NvStatus
- One usage of `send_rm_control`: the `CeGetFaultMethodBufferSize`
  RPC. This is useful for channel allocation later.

Each new RM control command can be added by extending
`RmControlMsgFunction`, adding the bindings and wrappers for their
parameters, and writing a type-safe wrapper to send and receive the
reply for the RM control rpc, using `send_rm_control`.

This series applies on latest drm-rust-next with the listed
pre-requisites. Alternatively, there is a branch with all dependency
commits included [1].

[1] https://github.com/Edgeworth/linux/tree/b4/rmcontrol

Signed-off-by: Eliot Courtney <ecourtney@nvidia.com>
---
Eliot Courtney (9):
      gpu: nova-core: gsp: add NV_STATUS error code bindings
      gpu: nova-core: gsp: add NvStatus enum for RM control errors
      gpu: nova-core: gsp: expose GSP-RM internal client and subdevice handles
      gpu: nova-core: gsp: add RM control RPC structure binding
      gpu: nova-core: gsp: add types for RM control RPCs
      gpu: nova-core: generalize `flush_into_kvec` to `flush_into_vec`
      gpu: nova-core: gsp: add RM control command infrastructure
      gpu: nova-core: gsp: add CE fault method buffer size bindings
      gpu: nova-core: gsp: add CeGetFaultMethodBufferSize RM control command

 drivers/gpu/nova-core/gsp.rs                      |   1 +
 drivers/gpu/nova-core/gsp/commands.rs             |  16 +
 drivers/gpu/nova-core/gsp/fw.rs                   | 402 ++++++++++++++++++++++
 drivers/gpu/nova-core/gsp/fw/commands.rs          |  10 +
 drivers/gpu/nova-core/gsp/fw/r570_144/bindings.rs | 161 +++++++++
 drivers/gpu/nova-core/gsp/fw/rm.rs                |  99 ++++++
 drivers/gpu/nova-core/gsp/rm.rs                   |   3 +
 drivers/gpu/nova-core/gsp/rm/commands.rs          | 141 ++++++++
 drivers/gpu/nova-core/sbuffer.rs                  |  31 +-
 9 files changed, 860 insertions(+), 4 deletions(-)
---
base-commit: 4a49fe23e357b48845e31fe9c28a802c05458198
change-id: 20260225-rmcontrol-bd8a06fc3a0d
prerequisite-message-id: <20260226-cmdq-continuation-v3-0-572ab9916766@nvidia.com>
prerequisite-patch-id: fd45bc5b8eda5e2b54a052dddb1a1c363107f0a7
prerequisite-patch-id: d0f59ef489346e978a222755f9fb42dfe7af19e5
prerequisite-patch-id: 8844970d0e387488c70979a73732579ba174b46c
prerequisite-patch-id: e138a94ed48fa8d50d5ed1eb36524f98923ed478
prerequisite-patch-id: 4599a5e90d6665fa3acb7d4045de5d378ac28b4d
prerequisite-patch-id: 30ed64c398e541d6efbcb2e46ed9a9e6cf953f4f
prerequisite-patch-id: 9a965e9f29c8680c0b554e656ff8e9a1bfc67280
prerequisite-patch-id: d8cccc3dfb070f304805fc7e0f24121809b4b300
prerequisite-patch-id: c0a73dfd1fb630ab02486f0180b90f8fe850b4dc
prerequisite-message-id: <20260226-cmdq-locking-v2-0-c7e16a6d5885@nvidia.com>
prerequisite-patch-id: fefd403caf8af386276351dd12397dda8ae8553f
prerequisite-patch-id: 1fb4b67abba75a81bd5ee5e545a7caae8046a3ea
prerequisite-patch-id: 10c23618b43dc8fea11f7b23d1d9389d04ede08d
prerequisite-patch-id: cf0393b708109d4264745131a511eef7218aa173

Best regards,
-- 
Eliot Courtney <ecourtney@nvidia.com>

