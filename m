Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DA35AF8955
	for <lists+dri-devel@lfdr.de>; Fri,  4 Jul 2025 09:26:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 950DA10E953;
	Fri,  4 Jul 2025 07:26:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="a4psx2Kd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2059.outbound.protection.outlook.com [40.107.92.59])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5772610E95C;
 Fri,  4 Jul 2025 07:26:06 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hmJyQn9p6+Nslvlm5L0VwQjcr9nGXKyNCSj3WcpzFfR4pzg6/HyxK2TuZD4eTxbLC99yIhdqMEz2tFe+1CmNhNaMKV/T6p9uxL9Tf7Wh+7GS8Gf705XHihzKqyoMqjAEfifjd08rSXVhHgSvEeHo/McIU6+6QwN/09vmIKV5kppDlZLG+P4+XmUk3Uh4ry2ZsJNl9cx/nSCdYWb86iKPc8p9798f1suU/5bzjBfaX8ktiwzaGulwoYnHYMUUyueqBaDs4YVioI3oyMsLcsviOuSfZo34yYYnbZHcg889Un1MYyHGCylLSlRZzBwSHd+ywrRgzxTHEzGrIInefeLePw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jJCp8EhyU+2Zu75XJeYAPol4+s/s3Lcz0lyNsDvJ4H4=;
 b=Se2yQ5aJlBdpQr7fe14Fpf9pFMz4DABARrflf0NAtarGDcMsknMiJbuhhW+TPoyenx/7BZXf2mTd1naSSYHnAkh/P5fCQhmV8db9d0IIXoKuzfsl6KYmB7A/DszzVtWmlLokUM0OWDpGYjl6Y37Z5XzBq/1RTKgB+ucyo6eaYH8yJt2cHS32oTM4qDQTQvmN7jNgvGX33GWLTYZeJaIMdCZgUS101Wix9L8R91HFYtqG48fmp27tc6tYq7n+LqfOrkfa4P0mxmCLbiuiCGm8vJ/3OYSuAHk3sryTxxh6zNQoBu6AYPkdnOnoZpAs84GpEgAxJJmUO6PQ+LcQouwa1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jJCp8EhyU+2Zu75XJeYAPol4+s/s3Lcz0lyNsDvJ4H4=;
 b=a4psx2KdMZWUFSgbBGFv4vDYX7vWgr+r4D6I1Q0y9H3twR26aomEJxP3tj43CQbVVZVEArjfo30x++ouhT2Fa3S8+wRK4NFS8KTINlibbnkhdj3fa29W4uisg7ppFrN6Pr1f9+PJcim8uJweda8qHCbOVzyH1+PEhzWjy4cuov9pW8Nxpsy1GL5Yltz+JXbejnghFBSEuS+3e389Wf3KxjMtDj/GFHD0KeV0GPS9Xp8GpDCQIMYPvf7xM2cPz8eI98w9Vnc1gss/ba0swMk+ZDz8iJJ3fmSOMeHSPsqsAbuuyP1ZFfqvbwz44MGBjsSv+gUGFWYVvHo4ML12zoXkMw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by MN0PR12MB6341.namprd12.prod.outlook.com (2603:10b6:208:3c2::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.23; Fri, 4 Jul
 2025 07:26:03 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99%4]) with mapi id 15.20.8901.018; Fri, 4 Jul 2025
 07:26:03 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Fri, 04 Jul 2025 16:25:13 +0900
Subject: [PATCH 12/18] gpu: nova-core: register: split @io rule into fixed
 and relative versions
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250704-nova-regs-v1-12-f88d028781a4@nvidia.com>
References: <20250704-nova-regs-v1-0-f88d028781a4@nvidia.com>
In-Reply-To: <20250704-nova-regs-v1-0-f88d028781a4@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Cc: Daniel Almeida <daniel.almeida@collabora.com>, 
 Beata Michalska <beata.michalska@arm.com>, nouveau@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Alexandre Courbot <acourbot@nvidia.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: TYCP286CA0143.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:31b::19) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|MN0PR12MB6341:EE_
X-MS-Office365-Filtering-Correlation-Id: a264ed12-b3ec-488b-0cbd-08ddbacc085b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|376014|1800799024|366016|10070799003; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MExJZnluT2ZxTlBHTWRqcUtDY29ERld3ZXBjY3V5NTlzVjFQTzdxRGhkL3pZ?=
 =?utf-8?B?S3pXRS85R3BmL2VreUJna203NDRnTWZIRkNROWRDZXhoTW5SWlVUWmR5V2p6?=
 =?utf-8?B?SFBreHF3OGlIZTV1RHExQW56UjFHc3g1Q3lxOC80YWIrbFd2MTI2T0FCQ29F?=
 =?utf-8?B?Rjk1R1A2amo3TVRLOXNwcWJDQkM0MjF1czcyOXBKL1RDZndidXlod0RJOWlK?=
 =?utf-8?B?N0FKeVJqRkpLYk1USHJsVXRMUlJqSWNCRGdadVZuaG11UjRkeVhVY0plTndv?=
 =?utf-8?B?ck9LSmQ0SmwvdWozb1RnVGFyYnhYVnV4RGo3RVFFcmUyT25vSVhzc0t0ZVkz?=
 =?utf-8?B?YUplMlcvQWU3cEVaaFlGOEtXSEFaNEFmVE16TXgzVTNTcnVFc0lpZVlNWWlx?=
 =?utf-8?B?ZS9EZ0ZrS3ZuOTc0WHBWVU5hU2JIQnUxbWl0ZmQ1ZjVHNkNOTjgyRGhrL091?=
 =?utf-8?B?R1lQaDZhaks5WWg3U2FidUVaVUxkSmp4OGdPelA1TDEvV3NhSURISW5YUndT?=
 =?utf-8?B?QlhMOUhTYmlFenJFSEhoeDlFWXg5dkZBVktFeXh1NWo5WGJhWnlqRnlEUFFB?=
 =?utf-8?B?dHNpdnRabjVQalBGTVYvOUlmY09scnhkTXhFRDNNV2h5aUJqTDlBS2MySWxF?=
 =?utf-8?B?bS9KWmZmWGIvQnVuZFZNRFdzNmJaMEZXeE1MUzAzd2taaFNzM3p1Vmwxcmsz?=
 =?utf-8?B?cVhqc1NFSWsyMzhNS2E3NnVTbEUyaXowVFkvWnFoQ1VNSVRlbW85QzVZWGlz?=
 =?utf-8?B?aEU5K0p4bU80MlE0R0s4N0xyZkNBZU5Id044Q0VEaWNrT09kblRzUWVQUjBR?=
 =?utf-8?B?UjA1VkR0cDVKNmN5NFh6K2dIUG54OC9vNW5OcEJoN1M1ZUJVZVRvRUtoR3Vj?=
 =?utf-8?B?cmE3WEtwbmxxNFl3RjlQb1R2OWZxeFlKT0o1TmhFMEdwTGdDWnFOQm50SWlK?=
 =?utf-8?B?NmpOY0VzUUFHaGFqRy9namtnenA4b0N3a2VRQitMU21heXlGcG9aN1BMY2l2?=
 =?utf-8?B?S0V4UXppT3NyNHRFOXFKR2xnbzYxYjZwYzc3WkxZdVFYTFFDNGcxeTNDNzMw?=
 =?utf-8?B?QXdmYXlxejNoYXFDbCtxOU41R3ZjNVhlYVpqOXZpWEwvVVNpY0lWT0lqM1ow?=
 =?utf-8?B?dXMzUVUwZzM2bFc0UnJ0YmRvb29RZjFoczhFb0p5N2RFV0ZLblZtaUtJMDlx?=
 =?utf-8?B?cDBJdlliOW5odTBrekI5cHYrbWhQS1hPc21mOUNKYmFuMzFOK295S0JJVnps?=
 =?utf-8?B?UG9sSFU1S2ZYTDNOeGJDWkEveHhMVmpQZXBodmt0ZUxpSTJoMXo2MTg2MlFI?=
 =?utf-8?B?clhqb0pGVHcxZ3I3WHAwZU9rYTVVOGtTM1A4V0tnT1ZtV1hVNE5xQzNnQzBm?=
 =?utf-8?B?QlVzbGw0c2kwbWNwYWtlVmFZSkNjUzBHTHRUQXlnNTZkcU9pZ1NtZWIyNW1h?=
 =?utf-8?B?N2JBZWl2VndGSVdaR3RqdWFQODh3a2d4NGhRRTNPNFp3QVI2QUZPRXlLVzJL?=
 =?utf-8?B?S0hKSGQ2TjZYa3VqcW54VFRWUDRHN010U0JFNDlISFhvUWxNNnZ2YWdNdXRs?=
 =?utf-8?B?cENNZmJmT3ZoT2JNM0VPaGF6UmllY05wcG9XK1FJakR3YitaQ3loYWczY0dj?=
 =?utf-8?B?NDNqa0JObWJWbXlrQ3IwbkdiNTdEN3FVYjFRYzR3bXdHRVBYZFEvTTc3c1g1?=
 =?utf-8?B?SGo2UWtpaGtZSUVhR2cvVTZhZVBUd1MwYlF2NWRkb24zMm10dUkzQ1hGTlFu?=
 =?utf-8?B?VGROYVAzaWY1Vk9MRW9COWlFaDUra1IvUXdzK001YS9DQWF0cU95ZXJ3ZGh6?=
 =?utf-8?B?dWZ4cjVjU2srME9NcUpYT2tFK08wd25OdnQxNDd5d2txV2R4WGliNXM1amg3?=
 =?utf-8?B?Mm13alRrMkRhMVYxVmZPeGFwQ3R6Yi84Z0ZCRkZaL3FpVVE9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(1800799024)(366016)(10070799003); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cmtrWUQ2U2hwUHdTdVRNdTNWNVU4TUUxT3I4NHdvd0ZPRjhHdm9haHBTQ3Jz?=
 =?utf-8?B?eGpTYjYzdWpwdGVtSytyVmRhU2x0MUxjbzhVbFJja1RwL2tWUEl1ei9UY2R3?=
 =?utf-8?B?OXZwOTd1QlUxL2VnYUI0QUtvckJCNkZuOWpnWTdNS1RIc2Yya1JjMGgvSHBv?=
 =?utf-8?B?WHFhT3JIZDJHRzNjeTd0NjhXcFVSdEFINjdHMDhNeGNKeGdjdHMyejdNdTJE?=
 =?utf-8?B?bFNzbkxFVjU1M1V3eVA5Z2k3VlJUU1N5c0RsdUhkNkd1cDZPcmFoTklCY2lX?=
 =?utf-8?B?L3RRYkRJcWF3eVhzNlZ6V1Zza2JIbzg5L0s5RnVpVU9ieWYvc1lncGUrWTJV?=
 =?utf-8?B?MktndGpNRjBlRmZycWlsYzVJd0xHVWoxSndGTDRvbERvcHdtdlpUQUo4Vnl2?=
 =?utf-8?B?RDhmS3VPcWYrTHpyY1RtdkNTR0xOVXl2OUFwRWdJY0M4UUdhay8rTExtV1pV?=
 =?utf-8?B?aUtRVXUyc0dKdWdNWW9VZUJBcXFCZ2c1bHdqWjRiaW04MzUrSnNtY2FXOVZ4?=
 =?utf-8?B?T2hLWjZNWTBIc3MxeW5xdDRibGdjWFo2c0RSQ2pnVlNrNG8rQlZFR2NyS3JV?=
 =?utf-8?B?WW95ZEhaakVrWnVlamxjNFVnZWJlUXloQS9sNlJtSWhPVjV6Ym5QU3F1NUpI?=
 =?utf-8?B?OVU0KzVMNUE5TUQzSlJZbHUyQmZrdnZ6N3g0SWdZNjI4cS9zVUNpTTlPMFRO?=
 =?utf-8?B?ekswRzEzNGlvVFdGV3NpWWhDZThyL1NLTUdJamo3Ri9LdXl5eFVidlRkYUdD?=
 =?utf-8?B?VmhYV1VBL3g3ajZ5OEd4QjZHZGxvQ3lhTmtBdW1FSEpuQ2NpS2IwM2QrZ3JE?=
 =?utf-8?B?WURscHVIenZXaFZhbXFHTU9HL0o5SmRaNklhd0txZnRiaDBSV0k1KzlMQUJI?=
 =?utf-8?B?cVBMWGhGbGtVQkU4VlN5cUtuOFlTV0RQS0l5OWk0dStieXRQWTZoT2xNdFBD?=
 =?utf-8?B?bTU5c0x1cWd4c0RjV2RIOU5Ubjl4UE54ajdMeHRWdFVKSUZ6cnZ4aXNPU2Rk?=
 =?utf-8?B?aTJQYU1PZmhVUEpJVnllbTQyRjEzSmNnNGdmTmhLRUVaZytvekNIc0U2Sm1L?=
 =?utf-8?B?Z3dXdTlyNGJNSW9XM0daZ09lMCtpT2RVc0c5aTg2Wk0ySFFUVENiZzVVa2or?=
 =?utf-8?B?YTZaZEQ0U0RMNjk4SjdEdnlxWW42UmdQSkJCQUF2QUVMT3hpWllDWDl4M20x?=
 =?utf-8?B?bWpBeUhSVlNOUXZiSVQ3dzJsd3NBcEVTV0VFelZaL04rM3c1am1DcG8vd2s5?=
 =?utf-8?B?c0hZL2tJQjNvN2M4Tm5xcndqalI0Z21jb2daejJKR3laQzBuMCtJTnlWWFhR?=
 =?utf-8?B?YUJHODlHKzRqeEsveGhUdHh4cVljekRmMDQ4S2xLTFhPcnkwcHNYMWZXelRV?=
 =?utf-8?B?WElpZDIzU0t2MWdseE82RFhzUHAxM2FjbEdYNDN0SndpeEZQQ0J0amlPRll1?=
 =?utf-8?B?TkJGZGF6REQxODF6RWxHUEw0dzFOMFhibUxvUWNSVm51RmlNMlU0V2JpZzBU?=
 =?utf-8?B?S2xJQ1hmYUxzd2RUK1B3R3ZjbWQxSDc1VXE5aGdVVXVtMGkxREpwZm1FOTlI?=
 =?utf-8?B?S1ZXVmVMQnIwcms4a0QrZmswbTZpZUVzYjFySURSYjR4c1JaOHBaMEJyRjdi?=
 =?utf-8?B?SU1ieVF3cjVxR2QzSVdqQ0RDdnBlV29pTmZRNjd0bWNqQWEra0tUT2RKNG43?=
 =?utf-8?B?S2p2cVc1Vk00NkNQWDMzVWtlRXFyWjRMak1TeE95SFJObzh4M0QvOWd3b1JW?=
 =?utf-8?B?SGJpa0ZKNGczVDc4ZFVSb3c4d0RESG5qTEJuQit0Wm9sNW5wUWw3MWNBbm5Q?=
 =?utf-8?B?M2swVkV4NzJObVZYTU8xNXBJVWV4bzNTNnc0S2RhcWhKbFM5WE50cFlvWmxV?=
 =?utf-8?B?ZmtWSDN4c3BwcnF3TEN1UUxHWlFTS0xHRG5Kd2F5a3UzUUpMbUhIZjJJeVNI?=
 =?utf-8?B?V3dydzJWYXhBNS9HSjQ2RlBRenlxV0xjZ1BMNXN1dW11dk5vOVQyemNJNlRU?=
 =?utf-8?B?QXR5S2xGU0doS0kwVUY0eC90ZmQ0aTBXU3JZVWZDS0tBNm9EaFVodGlFUGFu?=
 =?utf-8?B?L0gyd2ViRHdEa3ZjaS8xMVhtVndVUXU5VUZpZkFsc3REUEZwZE92Q2orTEsy?=
 =?utf-8?B?anJPbVVJZWQxTDhaRW1MUXhWR1RnZ0RpTXdOQ0hOZTI2M1Q2R0R0L3JmZDl5?=
 =?utf-8?Q?N02ZmSHXE3kSizB/8fTtGnDKj0mefeed/qYeejBmXM0m?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a264ed12-b3ec-488b-0cbd-08ddbacc085b
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jul 2025 07:26:03.5124 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7A7haOHpdx7NSiNnVtSnKvCVvMZJpa/1TCWd/Nucm1ZB25BuaWFM6C1PUW8oLl3wTTfinoNmXEZa9N7S0Zuj3A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6341
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

We used the same @io rule with different patterns to define both the
fixed and relative I/O accessors. This can be confusing as the matching
rules are very similar.

Since all call sites know which version they want to call, split @io
into @io_fixed and @io_relative to remove any ambiguity.

Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 drivers/gpu/nova-core/regs/macros.rs | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/nova-core/regs/macros.rs b/drivers/gpu/nova-core/regs/macros.rs
index 97895800ff7031d287b3bbd03a00b1ca71014aa8..1b2074e38381f9918c48691301e5a6f62861501f 100644
--- a/drivers/gpu/nova-core/regs/macros.rs
+++ b/drivers/gpu/nova-core/regs/macros.rs
@@ -89,25 +89,25 @@ macro_rules! register {
     // Creates a register at a fixed offset of the MMIO space.
     ($name:ident @ $offset:literal $(, $comment:literal)? { $($fields:tt)* } ) => {
         register!(@core $name $(, $comment)? { $($fields)* } );
-        register!(@io $name @ $offset);
+        register!(@io_fixed $name @ $offset);
     };
 
     // Creates an alias register of fixed offset register `alias` with its own fields.
     ($name:ident => $alias:ident $(, $comment:literal)? { $($fields:tt)* } ) => {
         register!(@core $name $(, $comment)? { $($fields)* } );
-        register!(@io $name @ $alias::OFFSET);
+        register!(@io_fixed $name @ $alias::OFFSET);
     };
 
     // Creates a register at a relative offset from a base address.
     ($name:ident @ + $offset:literal $(, $comment:literal)? { $($fields:tt)* } ) => {
         register!(@core $name $(, $comment)? { $($fields)* } );
-        register!(@io $name @ + $offset);
+        register!(@io_relative $name @ + $offset);
     };
 
     // Creates an alias register of relative offset register `alias` with its own fields.
     ($name:ident => + $alias:ident $(, $comment:literal)? { $($fields:tt)* } ) => {
         register!(@core $name $(, $comment)? { $($fields)* } );
-        register!(@io $name @ + $alias::OFFSET);
+        register!(@io_relative $name @ + $alias::OFFSET);
     };
 
     // All rules below are helpers.
@@ -342,7 +342,7 @@ fn default() -> Self {
     };
 
     // Generates the IO accessors for a fixed offset register.
-    (@io $name:ident @ $offset:expr) => {
+    (@io_fixed $name:ident @ $offset:expr) => {
         #[allow(dead_code)]
         impl $name {
             pub(crate) const OFFSET: usize = $offset;
@@ -380,7 +380,7 @@ pub(crate) fn alter<const SIZE: usize, T, F>(
     };
 
     // Generates the IO accessors for a relative offset register.
-    (@io $name:ident @ + $offset:literal) => {
+    (@io_relative $name:ident @ + $offset:literal) => {
         #[allow(dead_code)]
         impl $name {
             pub(crate) const OFFSET: usize = $offset;

-- 
2.50.0

