Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 51009CACA99
	for <lists+dri-devel@lfdr.de>; Mon, 08 Dec 2025 10:27:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6EAD010E3EE;
	Mon,  8 Dec 2025 09:27:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="EFXcv6Nj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CY7PR03CU001.outbound.protection.outlook.com
 (mail-westcentralusazon11010037.outbound.protection.outlook.com
 [40.93.198.37])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 32A5210E3EA;
 Mon,  8 Dec 2025 09:27:32 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aKJH7bJwlDM2mEMv7IR/5XRsYC+lIs9ZCM+NW2JuaafV+82zfReg6yfNFKZ8wOun7uMBecbE9pVdvOQjPqLAzRrOS6x2/wrP4VNcnKtWetTAgAipmsT9LbalTGhOlxz+1xtAm5C5lf7o61qwsWkgotCBGCZGPJ1yZDjWh63YlQ1eo++VFK+C5G4Jm40u30vEEfYZfMY4zFHvVYBgfxxXLDA9QrrrgT2pJ3mVZrj/lZw0l+Ma+fggo5Rzv1SmLLz/O/VfF6sH2yT6kSp3kmEDXbOCOlRSpb4MpcmH0jOgNXk2ykFHk9uFLHCuvlWFXtNBXDCPJjheB5tx1kP7INPnRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=el5cWa9wnSUcC31nfvTrYx92Rymde8RoNkO5gV2lL50=;
 b=B2awEYx8JKloWyUbc4MIqdD0r9UJTBaGquR/fh2lfXbrUMo9HGIrXWt3ygAxOrAnRh4D6mDUlsC6wSC/BAMgIDpvOBo3vNUIkNQdCHHQLk+7MrFfW5dEmw2qnxlOnJjYozddqi/ckh6+wfe0Tb1XaQhUU0EzWVoluLe+T6HQKBZhyxbbbT6LB+tNe0sObYR43CcvSsUOPV/zHg6XJAYRf1bsntfrVg79d7PsmC8vy/6SvsaTKStmNmCiIV8wl5cAYbVn3rPYiq4jlH9qWwP4tKgS0ULBXMEvRCdhryRla2H5BiNL9bgH0IGMNzTgXiHXoD8FqhpEwmQf2mYhhb/ccA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=el5cWa9wnSUcC31nfvTrYx92Rymde8RoNkO5gV2lL50=;
 b=EFXcv6NjeDdIIZ1a7xFh5/lxd06nNrNG7W+coI1aIKQZmerfUlea87bE9NbxiF3TwqCmNlbrC5xtUmVls9GFSW4ISJzVabT3Nq1ebLP5Lv1gYH1TVQCMIV3rYTkHnInBFNywX4GAaXSdiYzh2H+imQSW+zxBX/pAeL8QU04bPV5sqdgc4GyETWfL4jKwVI7Ju+D/bBV7HCoPOWheelLtF7ox2IWTKDtbIgnYdH6FtvJ4PqG02PN46rpQGe66sVPTW/ZhyeJVC60JlbtbD3ZCOnON+TuEHw4hnBCnRpsFZEH9BpFDsA6l1bYcNZ6pJgU2UQkMthhMUo8+Pje90QqCrQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by PH7PR12MB8108.namprd12.prod.outlook.com (2603:10b6:510:2bc::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.9; Mon, 8 Dec
 2025 09:27:30 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9388.011; Mon, 8 Dec 2025
 09:27:30 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Mon, 08 Dec 2025 18:26:58 +0900
Subject: [PATCH 6/9] gpu: nova-core: gsp: derive Zeroable for
 GspStaticConfigInfo
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251208-nova-misc-v1-6-a3ce01376169@nvidia.com>
References: <20251208-nova-misc-v1-0-a3ce01376169@nvidia.com>
In-Reply-To: <20251208-nova-misc-v1-0-a3ce01376169@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: John Hubbard <jhubbard@nvidia.com>, Alistair Popple <apopple@nvidia.com>, 
 Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, 
 Edwin Peer <epeer@nvidia.com>, nouveau@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 rust-for-linux@vger.kernel.org, Alexandre Courbot <acourbot@nvidia.com>
X-Mailer: b4 0.14.3
X-ClientProxiedBy: TYWP286CA0021.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:262::12) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|PH7PR12MB8108:EE_
X-MS-Office365-Filtering-Correlation-Id: a99738de-bc7b-40f0-8350-08de363c026d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0; ARA:13230040|1800799024|10070799003|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Ti84UThJc1lEYmUzUk52aXIyNmhjMGJ4Q2VLM2lWNGpzbC9PdUNFVW1WQ3Bh?=
 =?utf-8?B?bEVZZGZNWWR2dXNPcXd4RkZrTkR5RWw4azZDcithUStwbWZKQXU4WDJsNitC?=
 =?utf-8?B?N2FKN2l2ZVFYQUJXTkE0SEY2aXNPTU9ESEJLZVpjUUVXZ25UM0g4YzF5Qk5q?=
 =?utf-8?B?TjdBdGVRV2QvQ2lRLyszM1RWTWx6bHFYMzcyVWtHU2ZZR2RZYk85OUVOaFg1?=
 =?utf-8?B?SmxCKzJLTHFNUlNWVkhGdGxnVlRaT09CZExMWmZnclloak5KR3NJdVFaUUJ0?=
 =?utf-8?B?MXpDZUJqc3NvNHhGYnlnY2hsMnZqdU14NHJmbDEyc2NNWFJXOEY0Zi9iVFU2?=
 =?utf-8?B?MEEzSFRUOWZpYm8xaktHUXlkK1lLNDNoWDc1ZFVsdjZMY0ZtcGpjL2UzcjRT?=
 =?utf-8?B?WU8zS2ZZdFdWa0JiaGg5NGV0enJSTzgycndmZnloUzNZK2JlM1VqeEtPcGww?=
 =?utf-8?B?bDZoMlY5Y2JVY0w3WGRaUFY0b2xnWjRBbG11ZGNCdnVPYlVQdC9wV0I1TXgr?=
 =?utf-8?B?L2ZjZ0dNMVRYd0k1YXdIc2Vwbys1c2hMZVd6SSsxeUY5aWRieHdlenpsTkx4?=
 =?utf-8?B?RlBRUWdQQ0w4NzlqUFUwSVo2bWU4ejlkUUJRSVdTZ3hqTnFITHY2QnBKTkti?=
 =?utf-8?B?cXVmUnFWZU91eHhjbWd5QUk3aUkxTGVEZGFKSDFMSnd3cEVHVTB3QUF2R2pk?=
 =?utf-8?B?dkZkU3RXOXZuMDcxL0tSRGFib3ZoYmVmcU9scmNLMzB1aE5adHJMY2poSFBH?=
 =?utf-8?B?SUlQUXh4OEJxemNNMDJxVTZjL3E1QVVrWjl1UmRuTGRMQzJOdHl0N2FqMXF4?=
 =?utf-8?B?RnAzdGlEVitTem4yQ2ZLaW9TZkRLV3dBYnd3ZFpQZUxNT1hna0Z1ZFdQTm1J?=
 =?utf-8?B?bGN5Z0ZSNjJURkUzWjN1SmJMR3BTbzBkSXY1VGtRVnNaTG50ZUU4SGlwZm5F?=
 =?utf-8?B?ajcyZGQ2N3JnVjVNbnBFSzFqeEFjYVRQZnNGcjArN3lxeXo0SWlvSVNjWlpN?=
 =?utf-8?B?b28yVmhrV2RUc3RRVDVNUEVFMGtMVVNSMTRkSi9vcXJCM0RFQkdjOUJqR3M2?=
 =?utf-8?B?U05LcGc3VXRhdlhSWWE4RzZZMnNxSVNHdXNnZVFiVUhPem4vdWhUei9nRUdO?=
 =?utf-8?B?Tnc3U3c2RnE1TGY1bkVIdzNVeFRzZ3AwZkJPWTBEMjJXekxvU1RtTUtmR3NE?=
 =?utf-8?B?RjZKSGJhWm8xeFJlOTkzM08ydGJJdlZENEEyRjIwV1lQdU9WVzFFQ0pCLzky?=
 =?utf-8?B?emhBdVZjcXc3bWU4UnFaSkhtbXpwWjB2RWhid2xZN3ZWVlVZU0pRcHNEME9t?=
 =?utf-8?B?bVR6Si93QnhSMEdQZmpYTEtLa3lKRkVpVnRrRlhpa0VFUldZNTcwcEd3eTFN?=
 =?utf-8?B?SXZQUVZkdndqWGZjOUtUUjB3ZWE2RUYvenlJcnlWVVhnSU5zdXVoWDJtU1JX?=
 =?utf-8?B?RlNuc29QSjFxcGtIeEwxTVMybExIeW4wK0JUZ080V1VRZ0NsL21ia2tSTGl0?=
 =?utf-8?B?dTNIY2tVU0tkZjZseWEycGVwbjJYMFhiRXMrWUI3OVFYd2dybHd2MCt0MlNm?=
 =?utf-8?B?M0hsRVk2a0xhd0dYWURYYXY3VEJzbUIyLytrYlp1UWF6UUd6aU9nWFhzelNx?=
 =?utf-8?B?bEJJZ2V2akgvSlNFZmJsQ2JmRHp1bHRQNlJMVThxQWkwRi9FSll0SVpKeXZr?=
 =?utf-8?B?MDE1MDVWL3VYWGtUSFVicE0vZVFScEFlVHJzNml1SGNTS0t2SHlUd1MwQWpo?=
 =?utf-8?B?ZEZvZnZGQWNPTVIvZXBlZnY2c3o4bXBBUEFaTk12SVNhUm9GL2dKRm1TRjFh?=
 =?utf-8?B?Q2IxbVVUY1p2UzhSYXNPc0R2VDUrTEQvL0dQa0ZHZTN2R05WenFVWHdyZkZt?=
 =?utf-8?B?emZuMWFkRSt5KzlQNFB2NVdQZktpYTY3S1hOdHFSV0NOamJPSWdrRitoc1dG?=
 =?utf-8?Q?2JbPbgCm1B8rrIhDMgNfdaZhgY8w6NMk?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(10070799003)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?R3c4Vzc4SG1nWnEzTEFMYi90TnBWbWMzcXIveE16OER4ZGFtTWlVTTVXSWNU?=
 =?utf-8?B?T3M4SjFBZER3RW5QV0l4WitDMjVhMjN5cThJN1Y1RENOUHdpZzBuWWxreGh5?=
 =?utf-8?B?cHV3ZUM4cjFBSnA1ZEx6RjNROVZQMU5TMW5iU3dWTG9NVnBGc2VsdTRyRFVW?=
 =?utf-8?B?UkFVV05xZ24rZXBXS3paSGlJaHBKYUFRNkhDS2QySzU5MzFab29INXR0VXZp?=
 =?utf-8?B?YjR3dkgyeEtpVUlldlNUckVLRWQ1OVYvUS9CdHpHK2FDL0E3RU5qRGhVYXM3?=
 =?utf-8?B?a3I5QkI4WGZUZTlqczlaamdXRmNZbWkwbkdDcU5PaGJHQ29RY2hBYnlIRzdI?=
 =?utf-8?B?L3FuTU5BYW50U1B6Y2c3MGVyY3EzblRiMjZ1SkR6WThJaUg4ZHZibEwybllr?=
 =?utf-8?B?a0c5ZG1hRjk2azhVcGsrNnAwVmw2QUpXQ0MzemVDemlCSEVaaDFYVjc4d21G?=
 =?utf-8?B?cWJNTnFva2V2YXdOTzNQNjMrcDZnWWJtRVhvRjFLUjBqRWZNTFJRQjR4aTJR?=
 =?utf-8?B?dUdvdHlOV212QUJEVXp2bE44SWdEeEk5WHJqY21KWUZzL3lwTVFYVXpXMHlZ?=
 =?utf-8?B?VHprZ2dEd2ZGb3Q1OC8rdys2SmVwWGR5RlRhM0dJU2dSWUVVdzI1RjZGTzUy?=
 =?utf-8?B?WVVYT0lFR0ZvcGVCSzJtMk4wWG80aFlQempraUFTcWZ0ejRXUlplZVNFOUpD?=
 =?utf-8?B?eFdiSmk4OU1ScVJnOTVaMVNxeXo4cS9maFl3bnJNQzJpZFdsbzhxNVg4MG0w?=
 =?utf-8?B?NlFPckpRZHQyQ1VTQWtpblAzVS9idy8xck85ckdSVDZpMGNvUUp4a2tmRXFh?=
 =?utf-8?B?Nk1JRm12eTdHckxDMHI1TTlET01mMW55M0h6a0lpcGFwNnFCa3QyMTFJUzVJ?=
 =?utf-8?B?YU01VXV4Nm1UK0dDQ2M5ZFF0dEtzNnVTMGtzUGFTbXF3cVZxVDk3YUttdi9i?=
 =?utf-8?B?QWZYRisyeVJTN2MwcEUyNWZJTXk1ZWVWczA5TVNnQ0hmbWhTWk16V0dhYk9C?=
 =?utf-8?B?VzFaTHVlcGF0dkwwZ2ZsS2dZai9mTkhMVnpjZjRFYXVZcGxEbElTR0FObjZU?=
 =?utf-8?B?bmdYNUZVTW1saUZ2WTcxc3N3dXF3eFMxMmh5Z1JMblhtdkNONGpnN2Qyc2px?=
 =?utf-8?B?UWE2MVgyWTVrTWgwQlBPWGtJNThHUUpQNnRLWTBrWHNibzlmNlQrazFGZ3R0?=
 =?utf-8?B?R2VxalE4cno3K3V5T21IMWwyYkZpdDFGNm5LcUR5Sm5SaXhUYnlwUm9BNjJr?=
 =?utf-8?B?UzhvVjg1dHdYaUcvanlRSVo0NjVOZDVjekY0ek5LclhxelEySFFwRG1wWkNp?=
 =?utf-8?B?aGIwQjFtR01YaWtjU3pxTmJKNzB6RUtWMGxvcEg5OU1EUjFrcXZPWmJEMzUr?=
 =?utf-8?B?M1ZtTXhjZ0ozRklvcWgyM3cxUC9pekFqbjdMcDVUQ1Vxb1JlMis0SkkzM2Qw?=
 =?utf-8?B?ZmtxeThtcXZEWktrb3ZhWmx3dm16Lzh1eFh1TVNlWXAzR0x0c1E3c2JMQjVy?=
 =?utf-8?B?ZzkvdVdXM2Q3MmRSaGFlaE5aNjFOQi9MMUloODNSc1AwbERJcGR0b0lYLzZv?=
 =?utf-8?B?eWJDL0QzZkd4a3pTcklzblNPZ01EajBvSDRLSHJMczVBOGJnMGVnY1o0UXdG?=
 =?utf-8?B?NEQxM09GWXdWakg3MlpjUzRDQjUrbEtpZURWT2UvTmtBcmtBQ3ZVcVpQMVRl?=
 =?utf-8?B?SDZ4R2VZTFk0Y1d6M0tMaytaOWZkWnpsWGNET0kwWG9qNUQrSVR0NEpNRGpO?=
 =?utf-8?B?ZXVTTlQ1VnRZbjl0cllvbTdOaUpaUkpJRjduczN4L1NtdDVCeWdTb29BSlpC?=
 =?utf-8?B?eWpmMElOaXM0RXh3Y0tvbllUSXhnUkZIM0NNSzV2RFNSQjIxb2ZSVjVGZTgy?=
 =?utf-8?B?aWpOVVVDcmJsai8zbExqbVFSd2ttUTNzcXo0RGR3WEdINTBackpmRyttZGFV?=
 =?utf-8?B?VFBFRXNyNnNxR1VSUEZUY2VxakJiTnVMWmZFVkxpanY0aEk0enFsbmdkUFFM?=
 =?utf-8?B?QzRINHZESExpcDVRZHhwZktFVkNWWnFsdDB6RWpWdFd4ZngxQyswZi81ajh3?=
 =?utf-8?B?bmREaDV1RWU1T0RxejNsc0k0b1RtRldmek5tR21pK3AvY1hCeDl0QXh5TTgw?=
 =?utf-8?B?UVBKREpjU1ZBT1RaOEZDQ2xoOVloU3NkOUtIZzNaRjNITVdPeitOaVI2NDRy?=
 =?utf-8?Q?beIWIVixwqMlRbMNNMWeYFgpR6q8rhtlyY6SrSdz2CNK?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a99738de-bc7b-40f0-8350-08de363c026d
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Dec 2025 09:27:30.1329 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: P2kuwmdMGbet+6ZKnurSDWRXJJTI6tg2bdalMTaW0C0SHtmyXQaumdCdFiGO4ak0RFif+gycbgjBN4kLnyZ20Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB8108
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

We can derive `Zeroable` automatically instead of implementing it
ourselves if we convert it from a tuple struct into a regular one. This
removes an `unsafe` statement.

Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 drivers/gpu/nova-core/gsp/fw/commands.rs | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/nova-core/gsp/fw/commands.rs b/drivers/gpu/nova-core/gsp/fw/commands.rs
index 21be44199693..85465521de32 100644
--- a/drivers/gpu/nova-core/gsp/fw/commands.rs
+++ b/drivers/gpu/nova-core/gsp/fw/commands.rs
@@ -107,12 +107,15 @@ unsafe impl FromBytes for PackedRegistryTable {}
 
 /// Payload of the `GetGspStaticInfo` command and message.
 #[repr(transparent)]
-pub(crate) struct GspStaticConfigInfo(bindings::GspStaticConfigInfo_t);
+#[derive(Zeroable)]
+pub(crate) struct GspStaticConfigInfo {
+    inner: bindings::GspStaticConfigInfo_t,
+}
 
 impl GspStaticConfigInfo {
     /// Returns a bytes array containing the (hopefully) zero-terminated name of this GPU.
     pub(crate) fn gpu_name_str(&self) -> [u8; 64] {
-        self.0.gpuNameString
+        self.inner.gpuNameString
     }
 }
 
@@ -122,7 +125,3 @@ unsafe impl AsBytes for GspStaticConfigInfo {}
 // SAFETY: This struct only contains integer types for which all bit patterns
 // are valid.
 unsafe impl FromBytes for GspStaticConfigInfo {}
-
-// SAFETY: This struct only contains integer types and fixed-size arrays for which
-// all bit patterns are valid.
-unsafe impl Zeroable for GspStaticConfigInfo {}

-- 
2.52.0

