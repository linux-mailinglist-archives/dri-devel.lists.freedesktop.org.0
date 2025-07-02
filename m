Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 28520AF12FF
	for <lists+dri-devel@lfdr.de>; Wed,  2 Jul 2025 13:01:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B73210E6F2;
	Wed,  2 Jul 2025 11:01:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="ljWpH9X8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2054.outbound.protection.outlook.com [40.107.94.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 887D610E6E2;
 Wed,  2 Jul 2025 11:01:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oXXjVtRlNSGGFXsrRW9Y0KBDpWGtyL/6XFjFrBrMdx4P55vxwojEOb3lZ4niKQz9LFl4mnv4pOL+Xa7+Ktki8knX7711u997KKy7r0t69hVZpyt6IJpNC4Ioei1Ce24NEryfSYAcMpQjL+nvQ8YhDPXx8SVwXQOZFOIDA1IiVPk+6aLr1UKM6FhS5YSDjkeGMVeSMIeB+cfhA6T6lef9XnsK9b3qq2hp/rHsuW3Cp1dH/h7siTBH3v/fo91mOw53gwub8SMtrR73gm2eKG9hVHXjTtsQ7L0okwpVAPxCjo4lxzvOuS6Z4MDyr0d1WsdiFPAGi88layPhgWmEu/9nLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QTzrwjdnPG4c1Y7EycKTcCv5g7n6guokfYqAqe8qd5k=;
 b=J8E3nOCj7YxbZ3tdxLyLuVLguAx5Lg52zrtjknuG1EokjglwHXC+5daGoPD7sNbIcT2+6E2Y2CwZ2MtI/Py9LF3asoAGxgZbNvsKnelm2fylyunE3iDsd+05U7cbWEkVEk/GTeWoVgzYJEHSoRUd3m5LVzbjrcP07Ci5c/bYPHUcnTwI+ERmaYdXZwlM/13PDQxkzkIgb80k7AVzHWrZhAOjKn9yTYJn9hOeqQizMsmkS+rcEj/kiuZ0fRs6H+mVuF37zBwslceoIwG9gbJvyj4IVjEw//nvd9Y13xLC4oOOjjoyH2cOTLPxCQ2EOmCZnclv2JPwEriEhVciTpQpVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QTzrwjdnPG4c1Y7EycKTcCv5g7n6guokfYqAqe8qd5k=;
 b=ljWpH9X8gJD8nKOSxYrl6tN5iKxSC1Fz0RO5Wz9yLoQEK6XLutAQ/VXbMC6hNOZWQY0w1Qaxboq55blCCC8mQhU5qOfDl6bjMp7YS8xLaQxWwk3l7OY4IZiVE01qNfdsPslEhZ1SFL5V14cT1F09DnXoZNC8w3BMgDTwjGP7OGoE1TY3ONjvHq8GkJYBX/Q379uJJlpfYL5eFHTR0M6vtkzey0Qd0j2IX15cksfj4NFnOlrm1NIFDTMHhKTelR8EEBZGWIyjL08ygxijisD7ZXgTDwUxb02Wt9BR2EvLDoQO0syZ1ApPXCsACf7fAzaeW+br5MRD0PRXs9N5v8T6+Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by CYYPR12MB8892.namprd12.prod.outlook.com (2603:10b6:930:be::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.22; Wed, 2 Jul
 2025 11:01:18 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99%4]) with mapi id 15.20.8901.018; Wed, 2 Jul 2025
 11:01:18 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Wed, 02 Jul 2025 20:00:43 +0900
Subject: [PATCH v3 6/7] Documentation: gpu: nova-core: Document fwsec
 operation and layout
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250702-nova-docs-v3-6-f362260813e2@nvidia.com>
References: <20250702-nova-docs-v3-0-f362260813e2@nvidia.com>
In-Reply-To: <20250702-nova-docs-v3-0-f362260813e2@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Jonathan Corbet <corbet@lwn.net>
Cc: nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
 rust-for-linux@vger.kernel.org, Joel Fernandes <joelagnelf@nvidia.com>, 
 Alexandre Courbot <acourbot@nvidia.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: TYCP286CA0241.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:456::6) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|CYYPR12MB8892:EE_
X-MS-Office365-Filtering-Correlation-Id: ee8f16ce-9ee9-4327-65b7-08ddb957c57c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|7416014|376014|10070799003; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TmIyaFZhclhQZ3VDaFhjL01NNFhoLzh4SWFzelJ5RjdSVHdhdkxTT0h0aFc3?=
 =?utf-8?B?bU5SVWE0UytQd1F4VWM4V3VRbW4zWDlKaE83T1A1cUIxZkpyOFpCdkNEQndY?=
 =?utf-8?B?cDIzdkREbVE0SGRKYnJVaUlldjRMR1VLdTQ0dktvY0ZGaEllYzRmcElRREwx?=
 =?utf-8?B?S2RUeFZ2RTcxa2czUFhQYU9sMHFLcCtQTGU0QUJKZnJlekt2WVRjQzNSM1No?=
 =?utf-8?B?dHpBMjlxY0RrRjhJNjB0R0tKcXFyUGhOZUdyYTNMU0J0bDF0VGoxbDI4VXUy?=
 =?utf-8?B?bjFBNzNIUytkNUFBQm9sZmtCU0pibFpEWlpMbG5sZitCem1GcHM1NFJCSVhj?=
 =?utf-8?B?ZUJXWWZTckxPRTZpQnZ5NHFvV2tjWC81WmYwVWNuMkN4OUZ6M3NFSFowUmZR?=
 =?utf-8?B?SnZ5ZTZndjU4cVNWLzB1c3VvcDRDWFZrbVplTXlHSDB2bWRIR3lTYm8vNU1i?=
 =?utf-8?B?bkhoWHR1ZGtiWkJ5dGcwT0J2VXA5dmZ4T0l1cGFVMHIrZnhKRlhEYjVUYVlR?=
 =?utf-8?B?N3ZYa0VqWnE4LzdDcVJVUmhndVJFVjBxdS9wSFhXNFhIMWh0QUx0UkUxREFF?=
 =?utf-8?B?bzcxQnhVR0NpdnR2OEZUK1VJSWUxdHdJeWtoOWlIYzEwTWI3U1R3VnV5NW43?=
 =?utf-8?B?RU4yMkpyTkU4NTJ5TmFQUFE5Y3RKZkltSEJ4WDA0SkllUTdRQXJnQm5ia1d5?=
 =?utf-8?B?bzZYcEN0czBNQnpSRWIzTVR0dUgxWUhUa0FLWnhWMU9lYmlrblFueVFuK1ZW?=
 =?utf-8?B?Z2ZUcmxnVVhtOWdKVVVYK2xSNTU5K1Z2dTJnNzEwcHd6SUNMT1VDNU9QYlRn?=
 =?utf-8?B?a0V0R0NCOS93UkpYUTZIcEk5MisvK0hnYkJkTGhXRXRrdUhiVU9Uc2k5U1lD?=
 =?utf-8?B?Y1ZFRFlHdklrOE8wODZIUnFUTmFFVUNPd21TYTY0aGdac1lnSWpuMC9EOW1y?=
 =?utf-8?B?ZCtvNXlaY0Zib2tQR0hSRlB5VzJ5dkd5YnRnRVB1aHh2TE43UkNqUm4yL0ha?=
 =?utf-8?B?MjFiaGpJTFNwZ2RyM245aXNCekhJK0RYSzlEZHdXeEZTTGFjNnhJL0xCUEU4?=
 =?utf-8?B?QjEzdmFxRXhLVHR4MDJZc0VWSjczeHhrUUxkY2FuVmJxZXhkY2tVMldaWkl0?=
 =?utf-8?B?NEhZUHpwT05pYmZCSjk5R2dpSDZlNnpobDZNeW1aQkxPaUlSeGpuejNnU2JQ?=
 =?utf-8?B?dm5nK0tMUm9tV1NaMno0VVk5cTBBaDZIME5nVFQ2WWdyUG1vZzVZajF0WnE5?=
 =?utf-8?B?ekIyTVVOUXJzMWxRaXVkQWY0MzNwOWxnVVU1bGZCZWtuaGN1UnY5MjM4UHA3?=
 =?utf-8?B?eTExQ2Y0NjNQdjE4djZWa3FKZHdKdjN0Z0VZNVRmV3czNnRxR2tkbExpd3pa?=
 =?utf-8?B?OElKRjNNdFpIK0tMd0VOL0ZXNUdQSnF2SFo1WHI3eWhuc1pvUXhOcWRIbDUz?=
 =?utf-8?B?cTIrTTFYYkxnSXJQMWNMRWFTeDBVa3Rnc1BtdnJwSlAyU2FHOE9wUGlpajhT?=
 =?utf-8?B?ZW1TUTE5RWhtMUJxbitNRjZucDMybkNNMmJkODc3MW1DQzNPc1RFa0txUUNW?=
 =?utf-8?B?KzhLbHI1bnVIMTdpbFhXc0NnZlFENFhMa1B3U0pWcm10Q3BGQnAvUHZ3TWEz?=
 =?utf-8?B?YU1WMlVodHllekZiUlUyVVI0dlZ1a0cvRC85QitPcEJFN29GcWE1TGt6SmR5?=
 =?utf-8?B?d1JFMUdLZWdWOFY4TFlIS04xVzY3VE0yY3h6TC9vTXJPQlFRNzVISmJ6Tk5z?=
 =?utf-8?B?LzFBVmtndWQ0eU96THlsVUJRWEc1dURNckVEQUs0dUl2d2d0ZmZVQytCeUJy?=
 =?utf-8?B?OCtxNE5vOGVzeUluRDZ4ZGR1cjhLeE03UG9rUGk0WFlUdnR5Y3kzUHRWTFM5?=
 =?utf-8?B?SnhOWWdDRmJVZzh1Y21saVhqYVB1Qnd5T1RwYlJWcldJb0E9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(7416014)(376014)(10070799003); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SHFUa2NkRnBadGZkR2lDUko0R2tHNUJtcTRWQk83bXdrUXRJSXQ2UzlZSnZR?=
 =?utf-8?B?U0FBVTB5SitoVDZ0NEpWaDEraklBdnArQWVOZitENWxUakZLR0l6MUZKWFZv?=
 =?utf-8?B?ZDZKOWFmaXVVdExHYTlwUnZkSzZSM29QTjljWTkvbzc0eVNucHNKcXR2T2NO?=
 =?utf-8?B?ajhwSkZPMlBpSm4wT1U0QUxJRW1saHcwR2VSbzBkU2cvNkNjY2FOUjd6Wmw5?=
 =?utf-8?B?N2NkdS9rSDZzbEdzMzJFYVZXbld1ckV3MEJSSUp6ZUZCc0hEL1FqUFBGdXdI?=
 =?utf-8?B?Wk9TN2pscEVEL2tmeFdJTU0vdXFIdDhlUVF0TWhrRDBkUWRVZ0dvK1YrQ2Rw?=
 =?utf-8?B?Y0k2Mk1hK0ZtSCtBZUpueFZpa0xpdXB3ZTJGT1lzazVud1dMTTQ2NmNmSEJ1?=
 =?utf-8?B?djV5YWxrQ1NZN2lUaCtUdlNwRFFJaTVZQXFlTGU0dVlPM3dlNW41c2wxUGR6?=
 =?utf-8?B?SDhkVjBQUWcvTWNXN0VJSmFkTWpDVHY2Y251QXVDcm1iLzlQUmdRdy9kNHNk?=
 =?utf-8?B?Z1kySHhxTU5lclNkaHRFcXRkaG5rK0lxZmU0ZVBSK0Z3R3ZqN09pNzhWcER2?=
 =?utf-8?B?MU43ekpnMGQrSVl5SlRidmgzbjZudXRHZ1NFczY4c0lqK0xlSGRvWEdNSys5?=
 =?utf-8?B?VlFsR1BRTk1KZWkvbkN2TWZFTUtoVXFHZ3lMb0E4aVgyYnozb2RHeFk2NUc2?=
 =?utf-8?B?czhaU0w3M1Z1L0M3TXlBRkl1Y0dpWGxOdC81Wmw4VHloRHFXMXpnUzFJMWgr?=
 =?utf-8?B?VlZQaGZzOUlzS3QvcThaeGc5QzJGQ3Z0Vk5pM3BNbDQzcVcrVGRJTGhLV2xr?=
 =?utf-8?B?bDQ4eVIza3VvZGNTQ1FVOGNHdHhEN2x5bVlrdWxXRTl3ejZ6TE1NVmRhc1hT?=
 =?utf-8?B?R3VFblU0NFRLRnlVQlVwYmFqanQyb3FtbUJyMkNLUk9JM01rTEVCMFBza1Zx?=
 =?utf-8?B?Z0V1amdxUVNkaGVEVTBHOFFmSmhnbnpuMzlWK1dtSkVTdlBnaWd2cmlsR1Z2?=
 =?utf-8?B?enBDMlVzMVk5WU5DOWNxdHF4eFNEdEVZcVAycTRoaHBTc3llVVh4U28zbjlP?=
 =?utf-8?B?RHlvUDllVVBYYmRVVDFDN3NpcHNBckdxTmYwM1J2ME1UdTB5MDFQckFHMDFx?=
 =?utf-8?B?NXAycExUUVNLTkllWUxHVFJLUHdPSk9mdGRBa3Noamd1Y0cvOVhOdUluRjNG?=
 =?utf-8?B?T1kwdjZwb0ZIQmFURnc0MDBKbHp0Vm85dFVVSmxxRXRLQ1VhMmNJbTdhRlNz?=
 =?utf-8?B?S3pPSlgrT2UvZDc1TThRTWg1cDhsdy94SkZRd0pXdENKd1gzK1J0Ym5zZjVJ?=
 =?utf-8?B?YTNCRXQrWndKVGh2V0tuYU4yWFJCZXhVMWpaTmlSYUNPQXBTSHhHQit2VG1y?=
 =?utf-8?B?ZTgySjJ6WGpjQlFiWmxnSUxnUlpPWXhCRW9FNERKbUY1ODRGU3Q2YW8zYjkv?=
 =?utf-8?B?R2RidnZ1eVFhK1BHRWxOR0ZFa3BvSldQZDZJRkszMW1XRk54UDZqQzFhM0tn?=
 =?utf-8?B?SW9WSXgwOWZQM0NHSDNBWEpvVWYrOTQ4YWt0M3A0Sk1NOVkzb1BHUzdvUXhU?=
 =?utf-8?B?QndrYXdhQXVweFJMOVIvN2ptL1Y1YllOVDV2WU4xUWJKUDErN1phWDFxQUcw?=
 =?utf-8?B?V2ZsQWo1UUFqR1dEUW1PU1lzNzFQYXc1N2NnTXhTK1VVNEtpR3pBbmV4ajFE?=
 =?utf-8?B?Yk5BdWJEYi9jOTNMMlE4R0wweEZCZU9PM1IxaHVTUElxODFZZ0YxWWMyenRL?=
 =?utf-8?B?NUovbEJFUnk4WXBBUTcvMThobzA4N1k4NFQvM044VlZuM3dVZ0o1c0xYVW42?=
 =?utf-8?B?WVpLNjdOUGNDbFNOUzFUc2RvQ28reWVSMTBXRkdDT2w0SUZya2hua1N5WHNN?=
 =?utf-8?B?SmtCRmQ5Nlo1b1NUeXZmWmdBbTFmU1FUbTVtT2xmN013cjBNL1NtUVg3NkU1?=
 =?utf-8?B?RFFEM1Q2NDBCbE1FS2JvdHBnd3QvZkRhUm8zUHJVVEhMSFdweU9vWG9xajZm?=
 =?utf-8?B?dlA0TG8vQ3I3YUFNd0tZd3ZLbTkvM1RZMHhsS0pteXRrcXcrdVNBU2tRemdy?=
 =?utf-8?B?NCtnN3R5Zm02Vk00UVBFYkhNMGdoY0F1MURDeHZHNUp6MUlVMGQwN0dzdVY0?=
 =?utf-8?B?Ym5RSlViVWtvY0tNVnlyU1dtZTNkK0VxMDNpbThadzRkMjZHcFJmRWUxVmdF?=
 =?utf-8?Q?2GmgBUxBzJrhri87JjgtrrOVoFvSEM7NM4maxrpWv/r1?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ee8f16ce-9ee9-4327-65b7-08ddb957c57c
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jul 2025 11:01:18.5329 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2+b2FdP/9u0Fv3u+NVPa03SSKmCownuaa5ntAE5D75Wj52I9ZB1tmJ47VmzgpGVEBlHJdL7AF+RNrUlexTQ/rg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR12MB8892
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

From: Joel Fernandes <joelagnelf@nvidia.com>

Add explanation of fwsec with diagrams. This helps clarify how the
nova-core falcon boot works.

Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>
Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 Documentation/gpu/nova/core/fwsec.rst | 182 ++++++++++++++++++++++++++++++++++
 Documentation/gpu/nova/index.rst      |   1 +
 2 files changed, 183 insertions(+)

diff --git a/Documentation/gpu/nova/core/fwsec.rst b/Documentation/gpu/nova/core/fwsec.rst
new file mode 100644
index 0000000000000000000000000000000000000000..b3e2d8a265e2bd4c9659d5b53b8084bdb0287a26
--- /dev/null
+++ b/Documentation/gpu/nova/core/fwsec.rst
@@ -0,0 +1,182 @@
+.. SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+
+=========================
+FWSEC (Firmware Security)
+=========================
+This document briefly/conceptually describes the FWSEC (Firmware Security) image
+and its role in the GPU boot sequence. As such, this information is subject to
+change in the future and is only current as of the Ampere GPU family. However,
+hopefully the concepts described will be useful for understanding the kernel code
+that deals with it. All the information is derived from publicly available
+sources such as public drivers and documentation.
+
+The role of FWSEC is to provide a secure boot process. It runs in
+'Heavy-secure' mode, and performs firmware verification after a GPU reset
+before loading various ucode images onto other microcontrollers on the GPU,
+such as the PMU and GSP.
+
+FWSEC itself is an application stored in the VBIOS ROM in the FWSEC partition of
+ROM (see vbios.rst for more details). It contains different commands like FRTS
+(Firmware Runtime Services) and SB (Secure Booting other microcontrollers after
+reset and loading them with other non-FWSEC ucode). The kernel driver only needs
+to perform FRTS, since Secure Boot (SB) has already completed by the time the driver
+is loaded.
+
+The FRTS command carves out the WPR2 region (Write protected region) which contains
+data required for power management. Once setup, only HS mode ucode can access it
+(see falcon.rst for privilege levels).
+
+The FWSEC image is located in the VBIOS ROM in the partition of the ROM that contains
+various ucode images (also known as applications) -- one of them being FWSEC. For how
+it is extracted, see vbios.rst and the vbios.rs source code.
+
+The Falcon data for each ucode images (including the FWSEC image) is a combination
+of headers, data sections (DMEM) and instruction code sections (IMEM). All these
+ucode images are stored in the same ROM partition and the PMU table is used to look
+up the application to load it based on its application ID (see vbios.rs).
+
+For the nova-core driver, the FWSEC contains an 'application interface' called
+DMEMMAPPER. This interface is used to execute the 'FWSEC-FRTS' command, among others.
+For Ampere, FWSEC is running on the GSP in Heavy-secure mode and runs FRTS.
+
+FWSEC Memory Layout
+-------------------
+The memory layout of the FWSEC image is as follows (this is using an GA-102
+Ampere GPU as an example and could vary for future GPUs and is subject to change
+completely, it is just provided as an example):
+
+Here is a block diagram of the FWSEC memory layout::
+
+   +---------------------------------------------------------------+
+   |                         FWSEC ROM image (type 0xE0)           |
+   |                                                               |
+   |  +---------------------------------+                          |
+   |  |     PMU Falcon Ucode Table      |                          |
+   |  |     (PmuLookupTable)            |                          |
+   |  |  +-------------------------+    |                          |
+   |  |  | Table Header            |    |                          |
+   |  |  | - version: 0x01         |    |                          |
+   |  |  | - header_size: 6        |    |                          |
+   |  |  | - entry_size: 6         |    |                          |
+   |  |  | - entry_count: N        |    |                          |
+   |  |  | - desc_version:3(unused)|    |                          |
+   |  |  +-------------------------+    |                          |
+   |  |         ...                     |                          |
+   |  |  +-------------------------+    |                          |
+   |  |  | Entry for FWSEC (0x85)  |    |                          |
+   |  |  | (PmuLookupTableEntry)   |    |                          |
+   |  |  | - app_id: 0x85 (FWSEC)  |----|----+                     |
+   |  |  | - target_id: 0x01 (PMU) |    |    |                     |
+   |  |  | - data: offset ---------|----|----|---+ look up FWSEC   |
+   |  |  +-------------------------+    |    |   |                 |
+   |  +---------------------------------+    |   |                 |
+   |                                         |   |                 |
+   |                                         |   |                 |
+   |  +---------------------------------+    |   |                 |
+   |  |     FWSEC Ucode Component       |<---+   |                 |
+   |  |     (aka Falcon data)           |        |                 |
+   |  |  +-------------------------+    |        |                 |
+   |  |  | FalconUCodeDescV3       |<---|--------+                 |
+   |  |  | - hdr                   |    |                          |
+   |  |  | - stored_size           |    |                          |
+   |  |  | - pkc_data_offset       |    |                          |
+   |  |  | - interface_offset -----|----|----------------+         |
+   |  |  | - imem_phys_base        |    |                |         |
+   |  |  | - imem_load_size        |    |                |         |
+   |  |  | - imem_virt_base        |    |                |         |
+   |  |  | - dmem_phys_base        |    |                |         |
+   |  |  | - dmem_load_size        |    |                |         |
+   |  |  | - engine_id_mask        |    |                |         |
+   |  |  | - ucode_id              |    |                |         |
+   |  |  | - signature_count       |    |    look up sig |         |
+   |  |  | - signature_versions --------------+          |         |
+   |  |  +-------------------------+    |     |          |         |
+   |  |         (no gap)                |     |          |         |
+   |  |  +-------------------------+    |     |          |         |
+   |  |  | Signatures Section      |<---|-----+          |         |
+   |  |  | (384 bytes per sig)     |    |                |         |
+   |  |  | - RSA-3K Signature 1    |    |                |         |
+   |  |  | - RSA-3K Signature 2    |    |                |         |
+   |  |  |   ...                   |    |                |         |
+   |  |  +-------------------------+    |                |         |
+   |  |                                 |                |         |
+   |  |  +-------------------------+    |                |         |
+   |  |  | IMEM Section (Code)     |    |                |         |
+   |  |  |                         |    |                |         |
+   |  |  | Contains instruction    |    |                |         |
+   |  |  | code etc.               |    |                |         |
+   |  |  +-------------------------+    |                |         |
+   |  |                                 |                |         |
+   |  |  +-------------------------+    |                |         |
+   |  |  | DMEM Section (Data)     |    |                |         |
+   |  |  |                         |    |                |         |
+   |  |  | +---------------------+ |    |                |         |
+   |  |  | | Application         | |<---|----------------+         |
+   |  |  | | Interface Table     | |    |                          |
+   |  |  | | (FalconAppifHdrV1)  | |    |                          |
+   |  |  | | Header:             | |    |                          |
+   |  |  | | - version: 0x01     | |    |                          |
+   |  |  | | - header_size: 4    | |    |                          |
+   |  |  | | - entry_size: 8     | |    |                          |
+   |  |  | | - entry_count: N    | |    |                          |
+   |  |  | |                     | |    |                          |
+   |  |  | | Entries:            | |    |                          |
+   |  |  | | +-----------------+ | |    |                          |
+   |  |  | | | DEVINIT (ID 1)  | | |    |                          |
+   |  |  | | | - id: 0x01      | | |    |                          |
+   |  |  | | | - dmemOffset X -|-|-|----+                          |
+   |  |  | | +-----------------+ | |    |                          |
+   |  |  | | +-----------------+ | |    |                          |
+   |  |  | | | DMEMMAPPER(ID 4)| | |    |                          |
+   |  |  | | | - id: 0x04      | | |    | Used only for DevInit    |
+   |  |  | | |  (NVFW_FALCON_  | | |    | application (not FWSEC)  |
+   |  |  | | |   APPIF_ID_DMEMMAPPER)   |                          |
+   |  |  | | | - dmemOffset Y -|-|-|----|-----+                    |
+   |  |  | | +-----------------+ | |    |     |                    |
+   |  |  | +---------------------+ |    |     |                    |
+   |  |  |                         |    |     |                    |
+   |  |  | +---------------------+ |    |     |                    |
+   |  |  | | DEVINIT Engine      |<|----+     | Used by FWSEC      |
+   |  |  | | Interface           | |    |     |         app.       |
+   |  |  | +---------------------+ |    |     |                    |
+   |  |  |                         |    |     |                    |
+   |  |  | +---------------------+ |    |     |                    |
+   |  |  | | DMEM Mapper (ID 4)  |<|----+-----+                    |
+   |  |  | | (FalconAppifDmemmapperV3)  |                          |
+   |  |  | | - signature: "DMAP" | |    |                          |
+   |  |  | | - version: 0x0003   | |    |                          |
+   |  |  | | - Size: 64 bytes    | |    |                          |
+   |  |  | | - cmd_in_buffer_off | |----|------------+             |
+   |  |  | | - cmd_in_buffer_size| |    |            |             |
+   |  |  | | - cmd_out_buffer_off| |----|------------|-----+       |
+   |  |  | | - cmd_out_buffer_sz | |    |            |     |       |
+   |  |  | | - init_cmd          | |    |            |     |       |
+   |  |  | | - features          | |    |            |     |       |
+   |  |  | | - cmd_mask0/1       | |    |            |     |       |
+   |  |  | +---------------------+ |    |            |     |       |
+   |  |  |                         |    |            |     |       |
+   |  |  | +---------------------+ |    |            |     |       |
+   |  |  | | Command Input Buffer|<|----|------------+     |       |
+   |  |  | | - Command data      | |    |                  |       |
+   |  |  | | - Arguments         | |    |                  |       |
+   |  |  | +---------------------+ |    |                  |       |
+   |  |  |                         |    |                  |       |
+   |  |  | +---------------------+ |    |                  |       |
+   |  |  | | Command Output      |<|----|------------------+       |
+   |  |  | | Buffer              | |    |                          |
+   |  |  | | - Results           | |    |                          |
+   |  |  | | - Status            | |    |                          |
+   |  |  | +---------------------+ |    |                          |
+   |  |  +-------------------------+    |                          |
+   |  +---------------------------------+                          |
+   |                                                               |
+   +---------------------------------------------------------------+
+
+.. note::
+   The FWSEC image also plays a role in memory scrubbing (ECC initialization) and VPR
+   (Video Protected Region) initialization as well. Before the nova-core driver is even
+   loaded, the FWSEC image is running on the GSP in heavy-secure mode. After the devinit
+   sequence completes, it does VRAM memory scrubbing (ECC initialization). On consumer
+   GPUs, it scrubs only part of memory and then initiates 'async scrubbing'. Before this
+   async scrubbing completes, the unscrubbed VRAM cannot be used for allocation (thus DRM
+   memory allocators need to wait for this scrubbing to complete).
diff --git a/Documentation/gpu/nova/index.rst b/Documentation/gpu/nova/index.rst
index e4e017d926767284b5cee844d8dba32be6bc064c..e3650f53ff53113f31f63f67cf26116b5c070693 100644
--- a/Documentation/gpu/nova/index.rst
+++ b/Documentation/gpu/nova/index.rst
@@ -30,3 +30,4 @@ vGPU manager VFIO driver and the nova-drm driver.
    core/todo
    core/vbios
    core/devinit
+   core/fwsec

-- 
2.50.0

