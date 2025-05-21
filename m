Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FD4BABEC2D
	for <lists+dri-devel@lfdr.de>; Wed, 21 May 2025 08:45:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 040B110E686;
	Wed, 21 May 2025 06:45:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="fLpaVKI9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2048.outbound.protection.outlook.com [40.107.243.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 84E1F10E660;
 Wed, 21 May 2025 06:45:42 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vcFlOz4h2cjOu1jieMzDrzk1VasMdiDG8RcjT0iZjlujUCgpO4ebchYoluE/twDaDrvX8k1KY8iCry5n4skV8ldQmVLQwGHJQQHXi4k/egG3Rp3JRBNxe1d1v9ANC5X1SivCNpjynpeWAx/mbt+ArMf/zdp3ITD9y0DR7RNTkxaee4i75knwE/zD+QTlLvdDjdiF2Ap4bSMpGsBVQm8C6qbvmsgCqRtrWln9lJqEfYABnKLDR6ljgjn99J7vD3CStKpgVMcYrPQgS98qiKlnv8oqIr1AXP/Fg8h+uJOpV0DLiNkwd+Or2pncgIgau4KauXyYTJ3fdCwcWOuu11tMEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sn7YAf0dFUP9a6F5kqkqxt+OLyKHrlVeCiqy7FMvIa8=;
 b=YoR9sw16jcE2Q/RRzRRryYN/b8uTcFGjPJPFUVzG9EKpi73KWIC3IQbH1hQsBSxJc7gVLeInMrSRZBc1UWZYPIivN5QsebpFW/xuIjAN+2RvxrHWjMbd7wvNO66JVY9u0eefhUfYalwRSe1HpBoBJ0oM/00RRfDy15RmBsuAXWIVdwipKSo2HSM1X3lbYAhgaucqgNXESpvyn9JsQL/+Bh8MmdKkR96+0tfa8NTkM8Hli4+HwJXkkl1gPyNKFUwK6sz1A/4yP+Zj621LaB1OTlbRStpXss24cD0bS2tAwu43DlRZEMadkt8iq7eEkOE/Xg3pRxZPDVASyBu8RvP5og==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sn7YAf0dFUP9a6F5kqkqxt+OLyKHrlVeCiqy7FMvIa8=;
 b=fLpaVKI9M55UnZ3Uz/3oO3UZHWWr/vyTip1oDYM96aIzg49vg2ZS+WZiIl6bpOkO6WW9E4zTPhzPmRbYKLXl+GuPV8HO7pC/xAGD+f7qAIQjSbsT4yVHrUm33NSeIudNc1Kwa9UpTzdhTNa+q1I+pb242sX5mgK6D372sYI6FwsUmeZSBSD3gp+uOSnYkVGduC/cxDUn/EaZJDnN5Ucq8WNHRn3/IzUN0T/RkVIXmNUswQFhlzX5TshYOskiOibTDgcW/8Xt8j5gasNeVEUbtQn/VCEmMAzpeBcB1kWjhTQ1Ab69dpWngh1oOXpdN472ikXlyhx5DtQZ7vwSiW2W2A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by BL3PR12MB6618.namprd12.prod.outlook.com (2603:10b6:208:38d::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.20; Wed, 21 May
 2025 06:45:38 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99%5]) with mapi id 15.20.8769.019; Wed, 21 May 2025
 06:45:38 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Wed, 21 May 2025 15:45:05 +0900
Subject: [PATCH v4 10/20] gpu: nova-core: add helper function to wait on
 condition
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250521-nova-frts-v4-10-05dfd4f39479@nvidia.com>
References: <20250521-nova-frts-v4-0-05dfd4f39479@nvidia.com>
In-Reply-To: <20250521-nova-frts-v4-0-05dfd4f39479@nvidia.com>
To: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <benno.lossin@proton.me>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Cc: John Hubbard <jhubbard@nvidia.com>, Ben Skeggs <bskeggs@nvidia.com>, 
 Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, 
 Alistair Popple <apopple@nvidia.com>, linux-kernel@vger.kernel.org, 
 rust-for-linux@vger.kernel.org, nouveau@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, Alexandre Courbot <acourbot@nvidia.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: TYAPR01CA0090.jpnprd01.prod.outlook.com
 (2603:1096:404:2c::30) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|BL3PR12MB6618:EE_
X-MS-Office365-Filtering-Correlation-Id: 9b71a413-70b7-4be7-6121-08dd983318ef
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|10070799003|1800799024|366016|7416014|376014|921020|13003099007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?aHpYdTRwdFVCREhuSjJTVk5hZUpPamd3TmxkaTBOZUc2VCtSM0hBYUM5aFd4?=
 =?utf-8?B?TW11Y3I1YkxyaGM4amVsT0pyNjFWbzVoVWlYSUQyREF6QW91UFQ2MVQzeUlU?=
 =?utf-8?B?bndHTmZEODdIbk1MR3pBcGRkNDdpNmFqdG5KY1U4Vm9YNXFJaHpBTzBlRysx?=
 =?utf-8?B?SGdDSVY5Y01MaWtZM2hia3F0M3Q0TzhFbkpmcVlYZ0hTRklwSWdCODIyaFlB?=
 =?utf-8?B?dEhHKytDWEo1RUZZUy9OcHZPNGpvVG5CamdrRHI5Uk5JSjh5cGNPY05TRmp0?=
 =?utf-8?B?Njk4eFNoYjlwNnFGcGsyb3piYmFxTlkyN0lTODZtUHYxRTFsdm43ZmxmakxK?=
 =?utf-8?B?RGhNWDloTHJvMXVEY1gwRk1Pam5BbVdTOEdtenN5ajRKTk5YeE1RNkpJcWht?=
 =?utf-8?B?Z1FPQlBuRHY2TE4vUkNqT1IvSlg1TUFUNm1iY3gyMlRSSjdlRE16ZlBWZmxI?=
 =?utf-8?B?ODBDZWFOYlFUTE5VbTExUUFlVjhIUTlWdEtpSEN1RGR1RUY4Tk41SFY2OUFp?=
 =?utf-8?B?UVQyUlJ1TERZS3V5YmdiM1djQkorSUp3T2I0ZEZEbVV2U2VSOVd1Nk5HOTND?=
 =?utf-8?B?aEdkOFc2d0I3MjFTZU1nTGVObWRhUFFxWWNTemxwZTlVWmk5cnRpZWxmZUwx?=
 =?utf-8?B?cnBFVnY4cVF2ckNlZHVEbDdUQkNyZjZDZFJjK1ZoOWRhRk5QM1lhY0lxUVhK?=
 =?utf-8?B?NTVXQS9IUFQzY0pzUGNWeTVQdWVwL3BjRExGS2d5RVF0UDlYZ3U1UXYrQ0V6?=
 =?utf-8?B?a2RrTExTWmI3aDJVZFJvWkxHQjdSTzF0azlEcy85UkNWcEp0K3V2MTNuUmd3?=
 =?utf-8?B?QmxxOEJoQVcvbWVkMk8yazVDaTF4bi9ybnJNbjVYaWVjNEJTTXNTV0hPbnZ1?=
 =?utf-8?B?TThKMFdLNjFCb3VWYzVPL3hxZUdjaVZBYlQzTW11bUcvMTI3aEx4WHFVaE1q?=
 =?utf-8?B?WUQydGswaC9XcXE3dkhYTjJ4THY3QUpBZXJ4VmRveFBwOEcvVnR2QkhQZ0Zu?=
 =?utf-8?B?dlpPdFB4emdvNlNvL1AzOVk3Q1dJQWpkR1RvTjdJVXNjRVBja3ZwUFh4RmVo?=
 =?utf-8?B?UmlSSzZVOHFvZmc3TXdLVmUwWTZLdEdCUDNQL2lDcXprREhldnNuN3B3Y09X?=
 =?utf-8?B?SlpPM1ZkT25hZmhKNzRmVVJMZjNqSmR1a2phczVIZW4vNkZvYUp1Nk5PdUs2?=
 =?utf-8?B?R3JkT3A0cFA1M0drU3ZVSVJoVmo1RGd4TnZlSVdnck1QQXdQaFIxUUV5ckF0?=
 =?utf-8?B?M1haQyt0SEd0NzIvWTFXdlIrSzQ2bUU0R3NmMFNPMFRlbkNmRCtZWWlEYllO?=
 =?utf-8?B?eWd0Q2hyRzlzbnorTE01dHlJLzNQRDFmZHh4MmNhdlIxUkptMm05Qk9QMlhw?=
 =?utf-8?B?SjJSaHYrdGtKbWJxYnFKRlE5Y1hJcDh1TncrRzFESklqRjZ2UGQ0NTViTUhy?=
 =?utf-8?B?Z0dadzhoQnpPMnlMMXduZFJ1WktuNXF3Nk1yR1VvK21WbWJmZnB5UGhxaVZJ?=
 =?utf-8?B?QkZxenJMam5USUVFV1hSY3dhU1M1ZUpOZnhoMWxvQzFyU0dHY2VZR2VuYzFD?=
 =?utf-8?B?emN5NzUxOFhka1pyaDFSd2Jid3M5anFPSTlDdURidUkvZVYyeER1ak5Hamg3?=
 =?utf-8?B?MUdDUWxDMnBXZlR2bjZIclFiWjVtREJNMUdYcWdUZW1zTlBZeTRPeUVTNmVO?=
 =?utf-8?B?YXNOMFFPeFcxYUp5eXJCMFQweHhxZzI5QzRyZnIyYndFZ2VSSkdWWkpDRFcy?=
 =?utf-8?B?RGttUnhYMEZ1SjUrWk9WWnV1RnlpN2dNMWl5aGFaUG5ycXM3WkQ3MzZaWmZQ?=
 =?utf-8?B?OVE5eW4zOEhwNEpyTXpacHp3SFRNU3dIRis3NlZPNCtiaWJzTm5QaWJFeURG?=
 =?utf-8?B?Mk40cWFXdi9wWVZlUmhUR2JRYncrOEszZjJHb0FGakJCYzBLL2tHaVdJdWNM?=
 =?utf-8?B?OTJDbENTeHFpcmdDUGVkVFhGaEpIeGl6QnFMTDZQM2NXcVphQ1crV3IxRW5o?=
 =?utf-8?B?SG9KNDJ2OUxRPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(1800799024)(366016)(7416014)(376014)(921020)(13003099007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TXF6UmpMcTVEU3doUU9XSnQ0RFV0ODg5R25SeXVwQTFIb01XSURuWGxPd3dB?=
 =?utf-8?B?L202RzlvSXFrWTBjOEgyS0ZBL3lVRC9QSUpIdHQwTDRjbGZudHBNSjN2QzAy?=
 =?utf-8?B?YWtwSzhMU0pRNUNyUk5CcjJ0a2cycXZSN1VOSzFtaTlmRFNQQnZ2NXpGTTlY?=
 =?utf-8?B?OU92RnVMZ3lLOHdRV0VyUkQvKzRkdE9CaEtqSGtOU1VLSm05V2dENUxOYkJQ?=
 =?utf-8?B?bDFCcDhYOXU4K2doUUJTeHpQNlBVMjgyMWN0b045dThQaVM4M0RJemkyaDFC?=
 =?utf-8?B?Mm9HWnFBUzJpVm1IcnIwZ2xRa3I5M3RQL2Q1Q2lDcmlaOTVCVVIybFcrSERI?=
 =?utf-8?B?eVJrdC9BbEpRUEFQNHhqQk9PU0ZmL3BLOS9jRVFEWWhkekE3dEJxZzQvVWhj?=
 =?utf-8?B?TmdtVnBoMVcybjVZQmdORm91Q1c1MXRENzhTajBlVWVxbXFNaGRxZGZmdXhC?=
 =?utf-8?B?enRYY3hzMjdqTzlicjZ5Tk5kaUdqNVBQYStQaE0xcDJJOUlCQ09Odko2YkFY?=
 =?utf-8?B?S2Fwdk1kczRiS01hekNnQ0dic2JUSjdGT1ZveXVTdWl4cXg1OHFXOS93MXAy?=
 =?utf-8?B?My9LNFpZc0JvWWJzR1ltRGd5VVZLckRXTWpHa016Q1hGOUFFNGFhVXNPT3R6?=
 =?utf-8?B?Q0k3TFhtcHIxVUpaS3pyWlBhK280S0RsVkFDV1JQQVczYXVzODhNV0VVRDFZ?=
 =?utf-8?B?R2E5Z2lnUHRpZGhaS2hYLzJrVHVlWGRzRGppbytqMXVTYXJjcFVCbFFUUWk5?=
 =?utf-8?B?dlh0cnQzRkRhQWNQQ1VaZEVheGs0SEhhWDhOa1MwL1g0NStrOUpMZmI1SkVY?=
 =?utf-8?B?TUN4MEd1OXJMaUd5WWJ2akM0U2NuS09mREJtdkFrelZLQ3ErYVFDMUtPc05J?=
 =?utf-8?B?TlNoekpYYkJyUTVIbmJSNTlxTTAxZVJGazBmU3hnT3ZRK3ZoRWcvWDR5K0lF?=
 =?utf-8?B?aUhnWmNVMXBHS0xQMk1zUDd3UUoybi92WmdBK2lTUE1tYW9LMmhOeXJQdVRt?=
 =?utf-8?B?YU5SMEtmMHZ2QTdaSVNRUnhYSWtQNFp4NVJlYXJ3US9zdXhmY09RYUk4Q3A4?=
 =?utf-8?B?RjRGSVA2RVpHU1BkUzZuWmg1YThFUnpETi91TXBBNnlzOWpyUTJ6QzBtN2VV?=
 =?utf-8?B?OHp6V2xKYXo1bEJBVEZON0Z4WTRCakI1b1c2TE8xMFM0TGU2YzFjQjJuc0sr?=
 =?utf-8?B?ZDJhYnpSMkFoS0xZMWlpQkduRkRtdGN0UXVjUUJtTGdLLzRnQ2JzdEZYNnR0?=
 =?utf-8?B?a0dXWWFUcFhTWTY0elJHd2R2QzBjMVFqdlFVRmsxUXdFc29XUTJCZUUvNnZl?=
 =?utf-8?B?MWF0Q1VER25TbGt0Q21JRitCN2ZQVDU5R05ZVWs2bG9uTHRYV2RZNmhuQmpC?=
 =?utf-8?B?UXlvNUx5NFNWT3NVMVJoamJtVTdTVUJKanl5ZURKVUJHYXkrN1FydDRSR2po?=
 =?utf-8?B?QjdzTEFHbDQ4VVRDTStNdzNKbEN4YTAwd05WdUpjcWhxKy9EMmd5am1nemZG?=
 =?utf-8?B?U2tMSFdkWmtXcjg5WkI3YlhLWFQ1SExuWXFSeENsWUdVdmJMYzFsajZua0N0?=
 =?utf-8?B?RVdrWkhSY3VCWkMvU1lZU21KWmtCT1pGYzA1RTdVNHV6akVsREFxTzdXM2Q3?=
 =?utf-8?B?SmYzM1B6d3lRZHM1bVcrVGJHYkpMYUdQOENvYk1wTWRqMXZoc0ZvV2tHOTRT?=
 =?utf-8?B?Tit3V2YydGljOEpZQXdYT21qUmVmN1VHVkJJQ1Y5M3pmOUtmTFh2N0s0dmxY?=
 =?utf-8?B?bUczd2VIWXJhekQ3R0QvNEE3ZE0xdVRxeGFEaWdCcW0rbTlsTmZ1VUlUN2tr?=
 =?utf-8?B?aGpUbXY2MGdJeHMwZ2lweElDNFlpUDRjM2ZXQnJXQm42T2FYUUtmU1czemRR?=
 =?utf-8?B?dmZzNWNZemxTVktDUjZ4dWNFRm80bW9NK1h4ZU1lK0dHUzJQYUlDS05OZkFH?=
 =?utf-8?B?NWs1K2haWWx5eGo3dXhnODN5RDNBSUlkVkc2NUUwUndaUUxNR1VLRU04VjNp?=
 =?utf-8?B?U3pKMm1ZRk9zM1kxQnVZUkIxRG5GNWFrb29OR1hWT2FyV3VZOWc0bjM5RTBL?=
 =?utf-8?B?RlpxamlyRjlVK1ZpVGNVNGc2ZTJvTjlDMEx5em1BQWhqcVJqWFV1aUgycDdw?=
 =?utf-8?B?VDkrVFh1Mkg1anRFeVdBcFlaSHJqWDJZOUkvUkNEWEdKaDd2WTgxTmNIRzlN?=
 =?utf-8?Q?SmkrGEIJO93t4fN3yQk+jETsene5ByblkTaT2H2pLlc2?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9b71a413-70b7-4be7-6121-08dd983318ef
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 May 2025 06:45:38.7345 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: d4A28Hm3IueKuMoGR9D+fxQ3JvZ5RXQ6up8tou5hgIUukRPNIgDaHEiH83cHSDN2zj7SKKRqaV1EIGaf09SEuw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR12MB6618
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

While programming the hardware, we frequently need to busy-wait until
a condition (like a given bit of a register to switch value) happens.

Add a basic `wait_on` helper function to wait on such conditions
expressed as a closure, with a timeout argument.

This is temporary as we will switch to `read_poll_timeout` [1] once it
is available.

[1] https://lore.kernel.org/lkml/20250220070611.214262-8-fujita.tomonori@gmail.com/

Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 drivers/gpu/nova-core/util.rs | 30 ++++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/drivers/gpu/nova-core/util.rs b/drivers/gpu/nova-core/util.rs
index 332a64cfc6a9d7d787fbdc228887c0be53a97160..afb525228431a2645afe7bb34988e9537757b1d7 100644
--- a/drivers/gpu/nova-core/util.rs
+++ b/drivers/gpu/nova-core/util.rs
@@ -1,5 +1,10 @@
 // SPDX-License-Identifier: GPL-2.0
 
+use core::time::Duration;
+
+use kernel::prelude::*;
+use kernel::time::Ktime;
+
 pub(crate) const fn to_lowercase_bytes<const N: usize>(s: &str) -> [u8; N] {
     let src = s.as_bytes();
     let mut dst = [0; N];
@@ -19,3 +24,28 @@ pub(crate) const fn const_bytes_to_str(bytes: &[u8]) -> &str {
         Err(_) => kernel::build_error!("Bytes are not valid UTF-8."),
     }
 }
+
+/// Wait until `cond` is true or `timeout` elapsed.
+///
+/// When `cond` evaluates to `Some`, its return value is returned.
+///
+/// `Err(ETIMEDOUT)` is returned if `timeout` has been reached without `cond` evaluating to
+/// `Some`.
+///
+/// TODO: replace with `read_poll_timeout` once it is available.
+/// (https://lore.kernel.org/lkml/20250220070611.214262-8-fujita.tomonori@gmail.com/)
+#[expect(dead_code)]
+pub(crate) fn wait_on<R, F: Fn() -> Option<R>>(timeout: Duration, cond: F) -> Result<R> {
+    let start_time = Ktime::ktime_get();
+
+    loop {
+        if let Some(ret) = cond() {
+            return Ok(ret);
+        }
+
+        let cur_time = Ktime::ktime_get();
+        if (cur_time - start_time).to_ns() > timeout.as_nanos() as i64 {
+            return Err(ETIMEDOUT);
+        }
+    }
+}

-- 
2.49.0

