Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 74568AF8949
	for <lists+dri-devel@lfdr.de>; Fri,  4 Jul 2025 09:25:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C57B010E94C;
	Fri,  4 Jul 2025 07:25:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="PTyK2HVm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2083.outbound.protection.outlook.com [40.107.93.83])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2BCB110E946;
 Fri,  4 Jul 2025 07:25:48 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zDkecPDP4RGVWWQ5wVG8Fsbd1CoG+7LPSMbQYfDKSie4Aj5j7YUufRCx7cbhXqP6NVZieIwLDjzkAK4SCns67xn5Kfto/4LuckaHVALSMLXs3smDweL5GBr75ABfN7ZGxQyT8eX2feu21MWQt5rpRq8ojeRXE8rs2YPbNZ7EBN/BXCwo5e7/FNUBbAo/jwPf0k41QS5U8duPcZOPz5hiI5rdNsV2nS3La1sCh2lb+csM8Fcjf9/dL7gbYt3y7F/Kkx7EMw7cPItABUy+CnSY6eLxX2Q4aKbXrnmPzE8+WfjpeLcMzFCO1Z/ZmX0BqsZJsAUWm3mYJ5Z9jQpqs3B6tg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fl9kyf3zMNTdE7GGJIcmwRp/WY13BCebQ4HKDhsISWs=;
 b=MatNKwGD4IXaO/CGhAGnvnnwHpDrSqQyngvnDoGuvkPCsgYu5paklXcZ6FHIVFr6GyVvdk5BrL0wN6E8IvR9yRLbrAtUcJBb7Skyl5WTIqifLjpMEaPz67LnWvmVgkDr3H3K+Z+dAyJqBAZb7Ub00cTzvxXleJJBQanCso3It6czpFqBzotqXuAtl1snPWZs4ZC6rGVJQpNK9Vp6rYFZDd7IoMKZ67N+p1jQIF7OksSXqJ2BkII7W5ovQauxSGaIMPISJsV38gUaHvICZN1CbDAA504fXnVQd4gXq1I9ZoqOhQIrlTH6AIlCSatIVhViRU0dlJNl1sw1KKeiSkRXKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fl9kyf3zMNTdE7GGJIcmwRp/WY13BCebQ4HKDhsISWs=;
 b=PTyK2HVmu+Ic7kgf1QMcPwzJGkkzDVM9NFAC3787mPyflL0v5Cuq0tB5AYyh+nzQBtquA1+wHn6YIdg1GFH7Lzj6uTWbEY1gVJRy0NdAJB/lGy3954nG37/nkpDetI753/UwuERPgNPe3Y6AYGhVl/kMeNbwgN+xP3V/4bnjMrfdbJ0wKXBSvtNO2X5SLqQoVriVMon4IaN2w+a93JoT2zc8U/n7f0LtUwxWWGQl+/iRE0cnHpLv3wewSb/+wHoyvtlcjuvVD2jPhmUqmAf9+unsyKBxQz5CcG7y0gwhHYZhm8WskI7Gknu/yJ+X/45fgjgP7+DjS4tmCQvuNpC0VQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by MN0PR12MB6341.namprd12.prod.outlook.com (2603:10b6:208:3c2::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.23; Fri, 4 Jul
 2025 07:25:43 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99%4]) with mapi id 15.20.8901.018; Fri, 4 Jul 2025
 07:25:43 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Fri, 04 Jul 2025 16:25:07 +0900
Subject: [PATCH 06/18] gpu: nova-core: register: move OFFSET declaration to
 I/O impl block
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250704-nova-regs-v1-6-f88d028781a4@nvidia.com>
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
X-ClientProxiedBy: TYAPR01CA0065.jpnprd01.prod.outlook.com
 (2603:1096:404:2b::29) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|MN0PR12MB6341:EE_
X-MS-Office365-Filtering-Correlation-Id: ba00a4c7-f993-4d92-fc9e-08ddbacbfc7b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|376014|1800799024|366016|10070799003; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?OXV3MGE4cFRMOUJqcW90WGF0dzFFQ3NRSXk1a1l6T1g0dzlacWRHeXFCRzVI?=
 =?utf-8?B?MG5wVUFvbk1qekZWVEZURkFNK2ZPWkQxNzB0MEJHU3NtVTRmWXJIRWJFUTdW?=
 =?utf-8?B?T1lnYWJuTDQzNUpTYmNFRDh6YXJTR1p1TXF4dzUwTlJzZm11TloyckdxQXpX?=
 =?utf-8?B?dmY4RHY5bHo3aEhidmoyNEF5eDB6Mjk5YXZka0pFZlJCKzlCSGpNNUVwZ1R1?=
 =?utf-8?B?NVZpcDVSRHVMcGJ0cUF6QkdSY3EycmRZUFpaejI3WVVRdEFteWNoTVRJV3NO?=
 =?utf-8?B?azVUODA2YThtSDkyZnRmVXUvMFQ0V3FIRFNyOEtZR3lDQURNaURNOFAwTTl2?=
 =?utf-8?B?cTdsQjBROEY0eEdGSGJkQ3JUQlVTQThrMGdGbXU3bFFWWjNrMGhUdlJwQ3Vu?=
 =?utf-8?B?SkJVTFZWTm9Jd3FLMXQ1amhKd3NhOEt5NEVrcG51S1FDMEFUT0lPaW5NWWpE?=
 =?utf-8?B?UnByMTYzQlgzL0Mwci9Oa1Q1dGpJMWxDTkFxdWlPMzlMMWFISUdtemNzMUZI?=
 =?utf-8?B?alBnMnJjZmh5UjhMRXY0bUo2ZTE5dENXU1dXVEluVmdqdmtNUmhoRzhRSmhw?=
 =?utf-8?B?cVI4eXdndDgyN2YzOFM3alpTTHJFV1NKM0xRL04zY1dEUTQ0UjRJRFJFV2wv?=
 =?utf-8?B?WS95MmJGV0hMNkNrSFRFMmtPdHV0MzVYSGJOd0I3eHUzQXk0MjBZZUtjWUxy?=
 =?utf-8?B?cHp6MzlqSmFNV0ZrZThWa1JDWlNyNzJmUHBQRm5qeG50UEdYdHB2SnAvaUkv?=
 =?utf-8?B?NmZEVlFVSkVXUjJDY1BoZjE1UjZHQ3doMXJWeXJpN25IWHJjN3MySFlGZTJZ?=
 =?utf-8?B?em9UeGJVOFZUK29yWVFhUUdJSlJpOUFTdzN5ckV6T3I0U2FlQVNEbWlhUDJa?=
 =?utf-8?B?WnF2SFQ2cGkyTEJlbkdGV2tMRU85K2ZCQmI0bjhWYkFVRGM4ay9qbDk4bGFG?=
 =?utf-8?B?VHVZZ0gyV2l0RjhlSUt4Tzd3SVJNaG44am1lZ0hZcTlMOEZmcndwY0dEeU9i?=
 =?utf-8?B?Q25BeU1lbGRpRFFpaEx4Qk4vRXN0T3p5ekV5UmVrd3VEUWpTSzZQRGh5QmtI?=
 =?utf-8?B?Mjl2NkJINTJhTVJMOGQvTjlZblo1NSsxOW9XOXFaQ0FZdFhvZ2lZSVhmZktK?=
 =?utf-8?B?cG40dEw4Mk4yZmVoME8rMG0zOVk1RDBZbHM0TmtuS3BFcEUyOVN5U2pKNEZ0?=
 =?utf-8?B?Sis0MlM0eEVzZC8xMFJzZkh6ZHEwb0YraTVZT29VVkNNOUFhNFJlTW5RUFJM?=
 =?utf-8?B?SkZXcllsa1VzU3VUSmNxSTllaDFTY3JVZFh0VGlqQWNqWTJkWnZHcVZ2WHhu?=
 =?utf-8?B?QjAwQk5nM1VNMnNKdlhoZkl3YzBDTjZISnJmQTJxaWdkZkxrdTYzQ283OGxH?=
 =?utf-8?B?bmYwNTd3VjVvRGdZNDBMNHF3dllHYjlUZlBEeU1UMnJDa2ltbnBnL01rZS9v?=
 =?utf-8?B?SSszTXpycldQQW9ValpQNjcxNHV6ZkIyWEdWYi9vSEh0Q3hxdXlxbldUSVQ5?=
 =?utf-8?B?Rnd0RlU3YzNOL1FXUGQyZGlqYXlaZVhjSUpnUGc5aW9qcEhOL3pXVmpVKzFQ?=
 =?utf-8?B?ckxWYzFOVVVUSWJCc3pTV0tQNlh4Ti81Z2pJK2FVS0ZHYmJVYTZlU0k5MGhL?=
 =?utf-8?B?eFdiNVhKYS95UG9HdHpMSy9RVXQ4TDJqOUJFTW9mOTdwNHFQY0ZBOEkzeGFo?=
 =?utf-8?B?Nk9jaTFJaTM0Sm40YWltT1BtWWlYWHBKd0Q2N3lFSWZFQVFoeDhPZjU3a3U5?=
 =?utf-8?B?VFh0SHY0T1psUWFnT08xSnN4UDMwWmNpMktzWVhuaWVkLzlBZmdXeWNTRVJW?=
 =?utf-8?B?dlZ5R2VRbEdqTStYT2I4SmhJWElzT2ZqeDlCZWw5cUNBSDZlbjY5VS9MbWtO?=
 =?utf-8?B?Z3dWMGo5MWpHRVFacDZaMmNJYndZdmhXZDd4cGNWL1duR2JpSDZ0Z214dWw3?=
 =?utf-8?Q?J3dEDXAJkfU=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(1800799024)(366016)(10070799003); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MkdmdFI4aFBTZklROU02NEZQYXRUbGdXM1N3aG1CUzV1TGFYSnRjbXFGdjlr?=
 =?utf-8?B?d0xEbjRoMXl3S3NVbm1MaFBwY0VBUlBFbTlMWHFZTU5aWjB6YzBDWXRGMlhs?=
 =?utf-8?B?ZSsySkFMRFVFTmVDdFFDRXFmY1ZTN0xpVU5KV3oyL0FWblByYVJ4cWFvMHZJ?=
 =?utf-8?B?Qk43T0ljNVNITXNlWlFnYWVEY29tYWRsa0JUeDYyL01nYndvWWkwVXAzUVgy?=
 =?utf-8?B?eW9JZ2V0Q1g2a3F5b1NvdS9HcVBqUW9wN0VhWDZsOGdsTFJYK2JTNjJqQmky?=
 =?utf-8?B?SDdDS25oUUp5ZkkzQTJXdnhrbjZLdEluTTQwT3FnWUdkMFBZM0VhUjhEVCsx?=
 =?utf-8?B?aW16Z2hIQUtVUXhMRzRmNW9hM3lLN1dZempsdm5KRVlzcmhnSGd1cSt5cGo1?=
 =?utf-8?B?TXp6dW5sOGl0dEYrM3NHSTM4OXEvOVRwZTdXU0kydXRjMFJHL1JEcDB4eERk?=
 =?utf-8?B?d3BLREJRNzdwVTBEZWZUL2JYVTVzdCtoMUNlZUdHL1JhcktkYXc5bVRRYUYz?=
 =?utf-8?B?cTVXNmpPdjlaNk9yNmVWclZNY3B5YnJYMjRtZHlIVkhTdkRrVFVhZkFEeFhz?=
 =?utf-8?B?c2JzeFY4UlFncm9kOGZDNlhjcnJEOUN2UkhTZFUxeVR5ZUZmemRJNHhCVE14?=
 =?utf-8?B?elk4MThQWkVqYml0aUpPNU9Ldy9iekhOdjhqVDdRVGVHTUlUVkVaNWlCTGND?=
 =?utf-8?B?SllZR0hjRjU0cHRMQlczNjlvK1c5eTYxa3hnaFlZdmI5dHV0YmpoaGw2SjFW?=
 =?utf-8?B?SGhBbi8xdU41cDk3eURqRmZXY29KckNwK3ZKUGlwUTVhUmdTdXRGK2JyWGda?=
 =?utf-8?B?VmgwMmJ6Uy9vZFZXbzJvSDRiamhmQTNZV25zbXh2Y3dPaXhwTWwrR2MxQlVH?=
 =?utf-8?B?UStTT1VWQldoY0NrQVlSSG1KdnBqUjdha0pFMjBHQmZnT0RIcVZnYkhPL1JT?=
 =?utf-8?B?cUZ3TTJqNTBJSVVvUWxkSGQrOWtQa085eXhXM01RMDNvb1ArcGFIMGY1Qy9l?=
 =?utf-8?B?L2hmdkV5RjB6Vmp4Nk8wRVhOTDdQZFVoSSt0dUZNenhiZWwyUGFCUFd0NUFF?=
 =?utf-8?B?NDVjZnB5eDIvYllmTSt5dk43WFNnckhUdlVSVzJ3cjBGcEg3TW92anZrc3Rr?=
 =?utf-8?B?OGZUcHNnQWhXZHI4cW9JSnE1c0ZqR01XeHMyazlVNU5mVWI5YlpsdEsyUndT?=
 =?utf-8?B?NjZPVjd5bVBDekRkZFdMbEIzSTdBN3haZStkMFJPanpRajBDenRtK1BSTlFl?=
 =?utf-8?B?VDZpdHVWQk5ob2ZCMnU2bjJwVVFvek9NaDZqSi8xeDBMTjQyWHdmTC9yblBQ?=
 =?utf-8?B?N3ZiL0FVQTk3dWxtRXBQOVlGYzlYOWFpbk9FakZJbmYwcTVlTTc1WVZRRUhw?=
 =?utf-8?B?MjBVQmNvZ0dmUGRad2swcVJBRmVDOU1uTWVoMURZOHkrMnZ4WElKOHhEMHpj?=
 =?utf-8?B?UEp6aG54NXcrc01nemlFOHVPZWVQanpsYm9KM0lzUCtlVzQ3QjBPUHRrc3lK?=
 =?utf-8?B?bStYcjZvR0Noc3VkVEVDa0Y3cWNBQk5vVlh6RnJEaUM0RllzVkppVjBmQmxx?=
 =?utf-8?B?SHdvbC94d2JSUytCVnB0Q0ZQeDd1aFI2SVJoTSs5dUFuN3hGbjhZeC9PUEZ2?=
 =?utf-8?B?SndmREVwaWZVZ01kRXJjWGE1eVZoVE5FaDRsZ245WXF0cVZHS0JtcU0zV3oz?=
 =?utf-8?B?VG1FODVDZmdsSEtsWWRtM3ZKWngrN2xKVkJxRkl5QWhjOHZBRjdLUzFXZnZC?=
 =?utf-8?B?ampwM0kzVXdxUU45NlJhR3Q3TGdjQjZOaFhhdVFEWlRnZ2ZnQ2x3Yy9YVGh4?=
 =?utf-8?B?YWFIYlFwTEVKR2FtU2JBNCsrSS81V0lpQ0NwM1V6VHlsN3lSYWtTVVRLcEZF?=
 =?utf-8?B?N3JBelVXQVhKbTA3RVZUcWYwVzdGcWpTaytpSVQ5Z1lCM2d6WnNGaDRyMjdG?=
 =?utf-8?B?bW9PdFVpbmFBZmg5TEJEcTFvTGJqeXJmdVpCZTk0YVcrei84QVBqK3dSMlhZ?=
 =?utf-8?B?Q0RrV1hkMUduUStPNXJoNXp4MDFTc2ZlTlJPTFZodDBpa3pxNk5TNFJCekxH?=
 =?utf-8?B?cC9KUjJuU05rbHpoOG5KMW5BQ1pDYk9hY1ZPdGVIQmVHOFJuMmZjRURVRW9V?=
 =?utf-8?B?SGZTWENNNm95SnhXOGhiaEVSdFozZTNrcWc2RDFoMGxtVmZGZXlkUC9WMTRT?=
 =?utf-8?Q?TYe3ZdG5kLFDu6unqhGWp4YkZJ8DP1hKc46CP5OY4CCn?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ba00a4c7-f993-4d92-fc9e-08ddbacbfc7b
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jul 2025 07:25:43.6090 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QZpx5iikU+IubSaR08ga1I5JyVckp8t+TF792BlBQ9gsBysFMaZT+Gb589qYMGAX/YAE48gfr4BU5dqKKprA2w==
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

The OFFSET const is an I/O property, and having to pass it to the
@common rule makes it impossible to make I/O optional, as we want to get
to eventually.

Thus, move OFFSET to the I/O impl block so it is not needed by the
@common rule anymore.

Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 drivers/gpu/nova-core/regs/macros.rs | 19 +++++++++----------
 1 file changed, 9 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/nova-core/regs/macros.rs b/drivers/gpu/nova-core/regs/macros.rs
index 087f92f78788a013702cbc0a6e156e40f7695347..b096a3689483fa79dc22f16f4baac2f9a9495c28 100644
--- a/drivers/gpu/nova-core/regs/macros.rs
+++ b/drivers/gpu/nova-core/regs/macros.rs
@@ -92,7 +92,7 @@ macro_rules! register {
             $($fields:tt)*
         }
     ) => {
-        register!(@common $name @ $offset $(, $comment)?);
+        register!(@common $name $(, $comment)?);
         register!(@field_accessors $name { $($fields)* });
         register!(@io $name @ $offset);
     };
@@ -103,7 +103,7 @@ macro_rules! register {
             $($fields:tt)*
         }
     ) => {
-        register!(@common $name @ $alias::OFFSET $(, $comment)?);
+        register!(@common $name $(, $comment)?);
         register!(@field_accessors $name { $($fields)* });
         register!(@io $name @ $alias::OFFSET);
     };
@@ -114,7 +114,7 @@ macro_rules! register {
             $($fields:tt)*
         }
     ) => {
-        register!(@common $name @ $offset $(, $comment)?);
+        register!(@common $name $(, $comment)?);
         register!(@field_accessors $name { $($fields)* });
         register!(@io $name @ + $offset);
     };
@@ -125,7 +125,7 @@ macro_rules! register {
             $($fields:tt)*
         }
     ) => {
-        register!(@common $name @ $alias::OFFSET $(, $comment)?);
+        register!(@common $name $(, $comment)?);
         register!(@field_accessors $name { $($fields)* });
         register!(@io $name @ + $alias::OFFSET);
     };
@@ -134,7 +134,7 @@ macro_rules! register {
 
     // Defines the wrapper `$name` type, as well as its relevant implementations (`Debug`, `BitOr`,
     // and conversion to regular `u32`).
-    (@common $name:ident @ $offset:expr $(, $comment:literal)?) => {
+    (@common $name:ident $(, $comment:literal)?) => {
         $(
         #[doc=$comment]
         )?
@@ -142,11 +142,6 @@ macro_rules! register {
         #[derive(Clone, Copy, Default)]
         pub(crate) struct $name(u32);
 
-        #[allow(dead_code)]
-        impl $name {
-            pub(crate) const OFFSET: usize = $offset;
-        }
-
         // TODO[REGA]: display the raw hex value, then the value of all the fields. This requires
         // matching the fields, which will complexify the syntax considerably...
         impl ::core::fmt::Debug for $name {
@@ -319,6 +314,8 @@ pub(crate) fn [<set_ $field>](mut self, value: $to_type) -> Self {
     (@io $name:ident @ $offset:expr) => {
         #[allow(dead_code)]
         impl $name {
+            pub(crate) const OFFSET: usize = $offset;
+
             #[inline]
             pub(crate) fn read<const SIZE: usize, T>(io: &T) -> Self where
                 T: ::core::ops::Deref<Target = ::kernel::io::Io<SIZE>>,
@@ -351,6 +348,8 @@ pub(crate) fn alter<const SIZE: usize, T, F>(
     (@io $name:ident @ + $offset:literal) => {
         #[allow(dead_code)]
         impl $name {
+            pub(crate) const OFFSET: usize = $offset;
+
             #[inline]
             pub(crate) fn read<const SIZE: usize, T>(
                 io: &T,

-- 
2.50.0

