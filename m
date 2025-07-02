Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D58A7AF12FD
	for <lists+dri-devel@lfdr.de>; Wed,  2 Jul 2025 13:01:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9871510E6E8;
	Wed,  2 Jul 2025 11:01:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="X4HPN+JM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2046.outbound.protection.outlook.com [40.107.94.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F85910E6EE;
 Wed,  2 Jul 2025 11:01:17 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=csbHib+yrpKm7wrhxVK8P1TDqRsuLzhOgcajIXXh96sM5NYcjdrUVObCGHFqzANn/S0JgMdTml8v7K1R3Eg+JN3mqefx2dMpXTXgJqXjZxqNF0hJ+fkrq+qfyFLJGosbNtX2Bk3NzcmyhFeK/qAXKn6ZEi3TlfMOE6z+lnq4Duhd7WQHEe4LT6JmkiWoD6qdrc04r06fW4xcaSYr+dEsJDWEFh1sw41juqS87T1hRXMwE7Go5jW+OP05hDDUyxieGpDuJEbPGGjb9IulUtxt/F6S7gLorCxANcfhOW5j4CA5YD3QHoWs0z3S4lY+0pFuclO7H8x9CzP9QnPgKbZT3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MDSIqPMxgf0EY+SuL0jP5CMFO/fyUX7HyegKc867/fA=;
 b=Zh/M5rITsRAjTA7YDo+3DLOpLcfHWJDtz08u6BkjywKeJewYqu3D5xcCctDXnlbDcemBimGIHH7onBm2pSZVX7bykLEkpva76eULOIcJB6BzTs3zVR0gCDlafJUltJFrgWpXefNvN8zHuiHJFMO83F1OfSWDljs4/1j5/hPITcKOAkS64PcJKP4ha8pIx13df67abFZb45N8Es54m1dlqb/aUoNgul3j1Tn0mbj1N6pH61qvbYkO+P4eQLn4qANtMYznhRvXnXI7Il5YYVlXi14WzY+VzS7xpF2gfva1yxBMe2+Q1BUa3tsAx+rvg9RfuUDNwn8Q2hQv5WuAOXTk9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MDSIqPMxgf0EY+SuL0jP5CMFO/fyUX7HyegKc867/fA=;
 b=X4HPN+JMMeO+ykmuAdIJ6hPbzbBeKZjxxxejsp6kqxX5+9XnPPke+3eymbRlet9sSbQ28+ubGrZdsoxWu1zLr2FjRQcFPTSQijvGtwjQOehSNu54x+nj8N1im3P26cOqy7XLGG8bsWpEJ3YdgH9XeLmFcDY9YcWbZvNrXuEjA5IrJOij5EkmJ4X72ovqvETFkJyweu/t7A9G8jix7ew1C2qjmrBJARH3WhgGQRpD13FWh6TJRRvfkQS+ZdYyur6LqjFjTE4AgzDUp7T/UFBsYAbBuvF4KGLm4eNUo17MaUYbJfXfO6cXQwSmdu3pSo/jEtDjL/soOFUucb76vIABfw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by CYYPR12MB8892.namprd12.prod.outlook.com (2603:10b6:930:be::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.22; Wed, 2 Jul
 2025 11:01:15 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99%4]) with mapi id 15.20.8901.018; Wed, 2 Jul 2025
 11:01:15 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Wed, 02 Jul 2025 20:00:42 +0900
Subject: [PATCH v3 5/7] Documentation: gpu: nova-core: Document devinit process
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250702-nova-docs-v3-5-f362260813e2@nvidia.com>
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
X-ClientProxiedBy: TYCP286CA0259.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:455::7) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|CYYPR12MB8892:EE_
X-MS-Office365-Filtering-Correlation-Id: 3cda19ae-e226-45c7-2e78-08ddb957c379
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|7416014|376014|10070799003; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?aDZlLy96eTliWFpQWEJXUVBwclYvKzlOUEpQZzQ4Sjhoc2xiVGtWUlRDMFp4?=
 =?utf-8?B?R08ybm9JeWtjUjk3enR2SmFvSzFhUVFaKzkzSkhocTkwZjFLWUxQOE1XMkxx?=
 =?utf-8?B?NkQ1aDY5cVpRWDBxVE41MkUzQXRvaWhjWTJsbS82WUJxellOZDVDSk1tUDUr?=
 =?utf-8?B?QmRvK0JCbkxkaG5VUFNLczZ2MXpYTFZHQjhXc2FMY0w5dlVuVGpnaFVYb001?=
 =?utf-8?B?V1prYUtYNzlBT3pjUFZLN1U3d3VPRnRQS21SYWVaejJVQ2w4TzY4WUw2ZzRW?=
 =?utf-8?B?b29xZzJjcTVTb2pac0o4ZUFUYmRmcmdSRGVhdzAzbjRhWnlSSTJiMlVLQTU5?=
 =?utf-8?B?MFhUaVJabWt2TUxEZ2EvVW5vTXV1TkVxVUN0S0xYQWVRcXFtUzgwT2J1MU1n?=
 =?utf-8?B?VVdpVHIzdnYvZCtKOXZhY0tINmt4Q2tDTWdzLytrbHhRZVh1eGl5bC9DN3Zu?=
 =?utf-8?B?b2x2cjBYT08zbHNZTEVudmNkNHpDMFBXVHhlRTV5N3hvcHpLbmYrSWk4SWRy?=
 =?utf-8?B?MFJYSk0wSGpJUmtNelV1RHFZS0U0d0pnOFl4ZmJwaytaMG5SWEFSSmtkQ1c0?=
 =?utf-8?B?Yy9HZ0pOV2gzYmt0QVdMUjdjR3dSWjRRWm5EZytoQXlGejRZZkR2bDhkbWw3?=
 =?utf-8?B?NHgrZjZId2NNS1lhZlVnellmL1dCNW9mbVliOGNqTVNaR1B1OERKc3NYc2Zu?=
 =?utf-8?B?Y3d5Q2VUNzQvdXdTNlpPSENlTnZYWFA5T0RIRmNOaUM2NWNVcGNJN29nMmhz?=
 =?utf-8?B?NDBPMWhTQlBzZUJ1bStSN2hzOElUNUNlcGQ4Rm9QK0xQRkEyM2VkOEFqeVhy?=
 =?utf-8?B?cXBwTzZyQmN0NDl0VUpsSHRZRDFXM0U4a1VOMWhTVE9PVU91TGhtQW9QTlNE?=
 =?utf-8?B?NlhUZlBZak45RDB2aFdrWG9LcnJVcHhFbmFHUGwzQkE2T0gxcjkxY2xDdFlC?=
 =?utf-8?B?K25tc0F6amswRmdab2RXMVMzNi8yTGVoT28wQXJCeW1yRzBpYUxrUkhndGIw?=
 =?utf-8?B?Q3d4VzdKOUNySXlscTAvUFJhV05RL2hYTEhBSWlhWWxONExtMEVFTmZveDZ6?=
 =?utf-8?B?dklDS2s2MU5aZXk4WmZEelpIKzVNTDZtMkRDWk1hRWFjaGZZRVlRbkFRbkND?=
 =?utf-8?B?RlNPck0vZmNvRHJCTkxJbjBNOXc1WWUrcDZSTG1EMkVHQTJlbk9xNmhRVndy?=
 =?utf-8?B?a25FQ0RuejRRRFY3WU0wZFQ0empJTDV4RDRkQUxTRy9iSUdLSGtyM21UMTVh?=
 =?utf-8?B?ODY4d2wrQzBFREtxRzhYb01zZkpERU1HUFRKVWJ1QkREbjlicmRyNkxUZzR4?=
 =?utf-8?B?MkVDOXJSWUdOUXVmK1o3R0NncGRqSEwzL2xCRGdNZS8zeUM2bldGbG1FMUdC?=
 =?utf-8?B?SFcydVdMcm9Vd2lhbXBTcVh0N2phNHptMEg3QStOOTRoMHExUXlNeGkrMmVK?=
 =?utf-8?B?RElNcnJzMHdWV1FmUlVaU0xLbE11ZnlabU1CMUpnVE9HU2FMM0k4UUtVV1gy?=
 =?utf-8?B?Wlk5UXprNkJ3Vk10Sm9uU01NM01WZmJMR1licVpSRUxRc0k2cW9aVjAwL28y?=
 =?utf-8?B?ZjdwV0xadjh1MEQ3WjNEcHhYaFVSUTArbkxKMFVDUVllYTFjSDVHY29USnZk?=
 =?utf-8?B?dkFTQy9lb1daMlk3MjlvYnBGcG1Qc3RNT0JZbDBMbHVNSXJ6VmRDZGFsbEt0?=
 =?utf-8?B?YTZJcm9GUVFSUEJHdXY4Z1FrbTBVRHNXQWpSb3Y0Sm8xaFp3V3g1SVdzQTJs?=
 =?utf-8?B?MWVkUVVDZDhsTEUrdVduVHlyUGc5eWM2RHpyVmRxL2daUmRiaTNCOHgweUZM?=
 =?utf-8?B?U0F4RmZUYkorUVJmQkJwdCtZcnBEdkpVTTBDenJESlZJdEhRa0E3b05tM1M2?=
 =?utf-8?B?d2tmdS9JWE56UjQrdHFadHd6VDZRM0FtRXlnSytCbXVwNG1VeG1aTVlpMFB1?=
 =?utf-8?Q?xhQw8gjavKY=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(7416014)(376014)(10070799003); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bUx6d2txU0FPSmxUQTVKbERWWFhDZ1FESzhWa2ZUK2NnZGZuYnVQL1RrZ1Vi?=
 =?utf-8?B?Z1BzYlp0KzFISTI0VXpOeFpwSVl5REw3YkJyblVHSmxmTjlJUFp3RWp2SmMy?=
 =?utf-8?B?ajBZa01qaEpySWtqNnhRbVhXZUZGOUUvTFdCcGtvS1pEeGF3YWw0b1NpUURu?=
 =?utf-8?B?bWxpek1tczU2LytMRlVHalhJN3JpWmpabGVycXZQZjl0bGVFbnArVitLc0pN?=
 =?utf-8?B?TmlaY3Z4eWJKSDJQMFY1N3pxZzVDbVBPc242TFVEM0ZQT2o0aHlVWmZOdThP?=
 =?utf-8?B?TEVRM09RRXNRVWNUV3RmT3c0VjBBSUxQeitSdjhJNTBNTVhpS1RWSStRNDJD?=
 =?utf-8?B?R3Jhc0xKcWxqYTRIeVBJM1MwbmhOT2VITnU4MVdtVVNVSDd3dm9jdHFqYm81?=
 =?utf-8?B?UC9tMDFOWC9sMFpEeUNDTnJOUW96MXphVHRBb0V4NWF1M2lKQzNSQ1N3dkJW?=
 =?utf-8?B?a3FqbnVmOE96L3VtL2cxNzFhYTg4ZEpMUnU5cUJ6Y2tHcmcrWVVyMzBKZGhE?=
 =?utf-8?B?aloydHRUUmIrWFdQRkpOTE5YK3U4RVNKeXdscXlDL3JoNVBCVFdxN1FPeTVG?=
 =?utf-8?B?YXBwNk5rTmpwWDdTZ1pzVDVydHBFOUlvTkdKdytlY0hQK1hRUHh1akVaSzFD?=
 =?utf-8?B?R21FWDRXdmNFS3grSThoSVpESzVwb092RGNwQVdWM1FoZXJid3EvR0dpUXIy?=
 =?utf-8?B?R2lGRXhmWGdkSGdHRmdVZzBrTlRTNmpmWTRXL0FCbnAyOTl2dmVMdXB2cjZY?=
 =?utf-8?B?OXdtWEVEZVhCUW5iTnR2RjZpRjd4UnRscVNrejJzZjEzZElHWDM0ZmVVWmxR?=
 =?utf-8?B?MlN4YURXK2h6QllWVEttL0ZySHYyMUpxUC9MS3NCMEx4MmhBQUI2Y0tuZ0Rw?=
 =?utf-8?B?S3lQbEFvMDZDQ0FZUlNJaVZCVi9xUkZDcUljYjN1NFBrSkszWTNGNy9zSWdw?=
 =?utf-8?B?MG42T3VVaUx0RStkSDlMT2tOQmt4OVM0WktZcWQ0SGc2VlJNNHo1L05KVmJR?=
 =?utf-8?B?dVJRd2JHRGxTbU1zb2RJR05OdStNOWJsUElEZDUvWEVkNXRmUlcvYjZEbmZC?=
 =?utf-8?B?M29Ja2JLdnRlZ1YwVmFHaXU3QUhOanFwQjVLSE9tRU9nWStpMUswVi9YSXZa?=
 =?utf-8?B?MWJYMS85MUNqNm5lVGpIRlQvcDNrZWRrRkhSZ3ZIbkxFTWRYMTh1ZTZlUVBo?=
 =?utf-8?B?M1orL01PWWUrL0YrbS9CZndXTGZxVnJyL3J6OGM3Y3NMNVA0VGpWUmpZY0Qz?=
 =?utf-8?B?cm43NHRiTXUzR3hNeDArTHBYb2dKZ0VKcmJrWDBLNDdQdXF3YzBkMUhWVnl3?=
 =?utf-8?B?VnIxWFg4WElaNWVRVkk3Tk1pTm5DOW5GRCtTT0hxU2R4aGNkTUxDK1pYZDVm?=
 =?utf-8?B?UXFmMkNwZVhKeGpTZUhSZHJXb25JMnlwTDdaa1JYNUhJM3lPOWlXcXFUZFFv?=
 =?utf-8?B?dW55ZlJhS2FLaEZFaGlMREVReGZjcnJRSVIxRURGTEZjWTZzd2lRczZ0YVIw?=
 =?utf-8?B?ek4vZy80WkpmaVRQMENWWjExN2tFdkdVSk5kTW9XZEhXeDNxVEJKVlJWMFc3?=
 =?utf-8?B?aTRSMkx5VXZEZzNSaXF0TXdxUnMzU1JrUS9nV3E5cWFMZ09Ea2NNUzlXUGhw?=
 =?utf-8?B?ZTRHRDhOQ1FTcjRDSDlWelMzZE5zQXl5bUJRc1BYcSttNEp6Q2NUUllyZzdq?=
 =?utf-8?B?bGx4a2tJL1k2L0VlMnJaSmd4MTRMUDNacXlIUWlUc0RYUkZSbG92NlRWUjRK?=
 =?utf-8?B?UC9mMU9rclpESTBNdXJIZjNYNHdSUXZzYzI4d0tYUVg2RFZZOGd1Z2FoaytU?=
 =?utf-8?B?bkR1SXI4SU5Iam5UeURyZzMrRjBDYmJOTzBvUm4wd0lOcEVsYllZMFlYL0ly?=
 =?utf-8?B?NUk3S1NkV2R0a2NsZEJQQXhUTEtHbzZFbFA5cVNmUHM4T1hWTWtYTGo1czUx?=
 =?utf-8?B?MWZ6R0tTMUR1S2s5NWJMRTRkNWl5MUdBbjJKemVqUEtUbWNHS0VEYjhjMzBq?=
 =?utf-8?B?Q3NqV1ZEeW1XNnNUNzI1WURDQkd0OFNOR3Y1UGdTUk8zSXR2NThzaFFIdith?=
 =?utf-8?B?ejlxcVFmWEZvSDRwNGdFVjlUNEFtVVpXME1vSHhsOWpoS2JtcXA0Q1dwSS9B?=
 =?utf-8?B?NnhXdVhldWd0SE0yZnN4aWM3SFNGK09aK2xQa0k0TWc5WEFiNnN4UkFJYzZC?=
 =?utf-8?Q?l47f6Hk7nnUUWyok/+GXbPTG8iJVYWWJYRoAVz1MFJHh?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3cda19ae-e226-45c7-2e78-08ddb957c379
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jul 2025 11:01:15.1431 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rWnq3HhrwwrXok07bUnT2sgAMH9Q6lggc0eDl3GwWYXjP/1PhIAaki5i3D1Z4+EpXZuh9JCUhygiktRVWenm9Q==
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

devinit is mentioned in the code. This patch explains it so it is clear
what it does. devinit is not only essential at boot-time, but also at
runtime due to suspend-resume and things like re-clocking.

Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>
Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 Documentation/gpu/nova/core/devinit.rst | 61 +++++++++++++++++++++++++++++++++
 Documentation/gpu/nova/index.rst        |  1 +
 2 files changed, 62 insertions(+)

diff --git a/Documentation/gpu/nova/core/devinit.rst b/Documentation/gpu/nova/core/devinit.rst
new file mode 100644
index 0000000000000000000000000000000000000000..70c819a96a00a0a27846e7e96525470d07721a10
--- /dev/null
+++ b/Documentation/gpu/nova/core/devinit.rst
@@ -0,0 +1,61 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+==================================
+Device Initialization (devinit)
+==================================
+The devinit process is complex and subject to change. This document provides a high-level
+overview using the Ampere GPU family as an example. The goal is to provide a conceptual
+overview of the process to aid in understanding the corresponding kernel code.
+
+Device initialization (devinit) is a crucial sequence of register read/write operations
+that occur after a GPU reset. The devinit sequence is essential for properly configuring
+the GPU hardware before it can be used.
+
+The devinit engine is an interpreter program that typically runs on the PMU (Power Management
+Unit) microcontroller of the GPU. This interpreter executes a "script" of initialization
+commands. The devinit engine itself is part of the VBIOS ROM in the same ROM image as the
+FWSEC (Firmware Security) image (see fwsec.rst and vbios.rst) and it runs before the
+nova-core driver is even loaded. On an Ampere GPU, the devinit ucode is separate from the
+FWSEC ucode. It is launched by FWSEC, which runs on the GSP in 'heavy-secure' mode, while
+devinit runs on the PMU in 'light-secure' mode.
+
+Key Functions of devinit
+------------------------
+devinit performs several critical tasks:
+
+1. Programming VRAM memory controller timings
+2. Power sequencing
+3. Clock and PLL (Phase-Locked Loop) configuration
+4. Thermal management
+
+Low-level Firmware Initialization Flow
+--------------------------------------
+Upon reset, several microcontrollers on the GPU (such as PMU, SEC2, GSP, etc.) run GPU
+firmware (gfw) code to set up the GPU and its core parameters. Most of the GPU is
+considered unusable until this initialization process completes.
+
+These low-level GPU firmware components are typically:
+
+1. Located in the VBIOS ROM in the same ROM partition (see vbios.rst and fwsec.rst).
+2. Executed in sequence on different microcontrollers:
+
+  - The devinit engine typically but not necessarily runs on the PMU.
+  - On an Ampere GPU, the FWSEC typically runs on the GSP (GPU System Processor) in
+    heavy-secure mode.
+
+Before the driver can proceed with further initialization, it must wait for a signal
+indicating that core initialization is complete (known as GFW_BOOT). This signal is
+asserted by the FWSEC running on the GSP in heavy-secure mode.
+
+Runtime Considerations
+----------------------
+It's important to note that the devinit sequence also needs to run during suspend/resume
+operations at runtime, not just during initial boot, as it is critical to power management.
+
+Security and Access Control
+---------------------------
+The initialization process involves careful privilege management. For example, before
+accessing certain completion status registers, the driver must check privilege level
+masks. Some registers are only accessible after secure firmware (FWSEC) lowers the
+privilege level to allow CPU (LS/low-secure) access. This is the case, for example,
+when receiving the GFW_BOOT signal.
\ No newline at end of file
diff --git a/Documentation/gpu/nova/index.rst b/Documentation/gpu/nova/index.rst
index f38041fcd595524b204eabf6ca3aad51038682cf..e4e017d926767284b5cee844d8dba32be6bc064c 100644
--- a/Documentation/gpu/nova/index.rst
+++ b/Documentation/gpu/nova/index.rst
@@ -29,3 +29,4 @@ vGPU manager VFIO driver and the nova-drm driver.
    core/guidelines
    core/todo
    core/vbios
+   core/devinit

-- 
2.50.0

