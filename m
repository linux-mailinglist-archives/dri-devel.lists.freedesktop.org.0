Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qBSLJlpYnWlzOgQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 24 Feb 2026 08:50:50 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 13E4B183493
	for <lists+dri-devel@lfdr.de>; Tue, 24 Feb 2026 08:50:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6EA0310E274;
	Tue, 24 Feb 2026 07:50:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="kTsnVnqO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CH1PR05CU001.outbound.protection.outlook.com
 (mail-northcentralusazon11010051.outbound.protection.outlook.com
 [52.101.193.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 485B610E274
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Feb 2026 07:50:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HEIfk3GJ1M/J/hI1eLWPkD31FZFti1QIZkqWVL3Oa8AlXKw9H7UOJtgILv9JelGPkcBhH2K/HlNBhrXsmW0XIu+vBj+UJ11hnoxwrA0YhiYbbIOnMYBkJ00tIAr+lv6aMkxhJ+95aKfsFn0AGWDp8atPsThCn5tMnEarUnjFRVFmqQTvW+90M3WtgSHEmoAi8xf326adDrfjPrkQOVrXc/144FMrTXAmnG9vxvlRI6jLmKtbhyF4U9lVuL7ozZzK+/v2Ob5t8LkWImzL0y4ZaLVvx86jTTbspg88UR67LXPu6Eq0aCcdEmkvhpmKpB7COqoI+vpp40aUmx1i+Kt+ww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=n4M0Nka/fBb/OExOiN9tMahrpTD7H247alVVBJRZAhA=;
 b=URaNDz4PdJ3uAo7BAFAe01Xjdv/LlblB3u27DTeVTma3Pt5zv+b1aA5Qq7dax0i13rVbRik55UNj0cPkMmVzbvPGXHf8BiG8RXbt1NK+8kvEyuF58D6PTmXpzCFoENYz5eAOLr+UOSISd+4pVFF6biMWOuIUls4yu7hiYTpa9mzeqz0qDt+Y6YgGtjtiV6+dpVruv1A7sf+T45JkAybFx9ZKGmJeT/rKS2+0/8zPRQOnMTm+SblIJpmzMyF6Cu80D0iAN4scNmvvg7WhlIb6w4WGB/p2ErXgOmw6+az8pHitYwfkutkVmTFQF1QjkLdtWHtZU372HwzPM6rZC3Nx9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n4M0Nka/fBb/OExOiN9tMahrpTD7H247alVVBJRZAhA=;
 b=kTsnVnqOSZCdnVLfcTdhHH+xYzU3AgVVAFMEjZPHFX/+w/4jfnJtb4sHzGafpMnuSmxpEJCbFEFev/sQGcN6bhnvDpzrt+YJuK4nYI6g5/DKWB8mCGVEYU0Zznn6ZWJqXqrtUcMk5ll4k3+/GCAKk33AL88wyyO3gzXYToCIDTY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by BL4PR12MB9483.namprd12.prod.outlook.com (2603:10b6:208:590::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.22; Tue, 24 Feb
 2026 07:50:44 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::ce69:cfae:774d:a65c]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::ce69:cfae:774d:a65c%5]) with mapi id 15.20.9632.017; Tue, 24 Feb 2026
 07:50:44 +0000
Message-ID: <ee914ffb-5c3d-4d41-abdb-5ed02db326c6@amd.com>
Date: Tue, 24 Feb 2026 08:50:37 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 07/16] memcg: add support for GPU page counters. (v4)
To: Dave Airlie <airlied@gmail.com>, dri-devel@lists.freedesktop.org,
 tj@kernel.org, Johannes Weiner <hannes@cmpxchg.org>,
 Michal Hocko <mhocko@kernel.org>, Roman Gushchin <roman.gushchin@linux.dev>,
 Shakeel Butt <shakeel.butt@linux.dev>, Muchun Song <muchun.song@linux.dev>
Cc: cgroups@vger.kernel.org, Dave Chinner <david@fromorbit.com>,
 Waiman Long <longman@redhat.com>, simona@ffwll.ch
References: <20260224020854.791201-1-airlied@gmail.com>
 <20260224020854.791201-8-airlied@gmail.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20260224020854.791201-8-airlied@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0076.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:cd::20) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|BL4PR12MB9483:EE_
X-MS-Office365-Filtering-Correlation-Id: 5481521a-fdd3-40ad-100f-08de737969f4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|7416014|376014|366016|7142099003; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cjB3dmppWFNVcjlmQjcwQmNjN0JTcUdMcFJZenNET3JVS0JEOXZZaUdwdkRj?=
 =?utf-8?B?Y01WSWhXeGR3TEQwZmRoRFRCVHl5aTRRWEhZMXRkOCtlWk5CTDJkbkJLemNL?=
 =?utf-8?B?WGZHOFB4L1NySGlaYmx5TklJOWQ3NFhYVE82d2NzWXFUeHdmcEhPdTFMVzZD?=
 =?utf-8?B?S3ZtV2tQL2l1NGNqaXkrd2phQitCVGpGL29ORlMzT0pBOC9XbFlLc0htT2dZ?=
 =?utf-8?B?SWtvOWpGa3FhcjdEWU82Uk45b1cybDd4MUNMRGJKQU9WbU9hT25CcjdkRFZ5?=
 =?utf-8?B?eC9uQThiWmdqSEdLNWlVZmh0YWhsbzdLNkFZdTJzcVlQT0xxV281VlNaRHhw?=
 =?utf-8?B?S2xMaHNxVEpXbjJVc09FMEpidSthajgzcHJSNXZvRzBncDR6M0Rod2ZPTVU0?=
 =?utf-8?B?UDRPMTl0b0htVk9SVHg4RnBGNXp1ejdPVzcwK1orMFpsdHYyMW95aXNDRTE0?=
 =?utf-8?B?ZHk5VWdCYUFCTUdsbWtVVWZvY1dxM2JYSUNoZE9qWllrQTFKWU5QNS9qV29H?=
 =?utf-8?B?OTVHdzdWSVZldFlRY0UzbW9OU3ArOFpENkZ0M1JBcVpBZ0svbDdhQmdsU3hG?=
 =?utf-8?B?cUdJMlFvRHBIbWNFaEVtTEROSU5BNE1WOE42ZExobVhMclpMSi9uMFRFMGxP?=
 =?utf-8?B?MlZWL29xbUVzdXZoSTYyYUpRTWp4MVF5UjNGQlpibFdQWnJjTnVTMFdRM1Bh?=
 =?utf-8?B?S3NsM0lhVEJ0d05SY1dwMC9nYVBPU0xLQk5LN2JmSkZjLzh1QmJUOUNzQW5L?=
 =?utf-8?B?ZmVnSXc4QXJWWFRJR3VKYzRVajdETlpYZnNYbG50WDV5MzQ5MmJtL292Nkgw?=
 =?utf-8?B?VTdZMktPREk2Y05aVUVDL3JEZ25aQ3FjVExDcjBjWVFRbCsxN3ZsMU1VRnFa?=
 =?utf-8?B?TlJXYVA5em9xT1JnUkZQUU12SEJ1ZlkzamFyL094WDJRLy9wd3pJcEh4Uno3?=
 =?utf-8?B?cDVwOWdqaTNkRXhkcmtIN3l0RDR5Tjdhci9zaGlHZDMwazRtOTJTUWNNb2Y3?=
 =?utf-8?B?SHVjVTRjcUltZ1lRSEdvOXh3cGt4ZENVcXJDWnN0S05FaWJhVjlVRC9XL0Yy?=
 =?utf-8?B?dFZNaGJuUGFVNm9XenlkK0xvZlR0cktmUHFQdjdOZ1dTVnJiMEp4aXkvMmJL?=
 =?utf-8?B?VlQ4M0V6aTJyMVVzUmRLOTBNNm1ENlZQdFFUYzZjNVBySkhBVEVLYXMva2c3?=
 =?utf-8?B?NlZ4d2Y4NjJkWFZXVThxTGw5akJXdFdPR0FaVXcvaGplVi9ZZEJXUDBrcWRa?=
 =?utf-8?B?NWdTQnlJbmRFQXlDNWxkSGlTQkV6aGtSK203Q3JHOEVIOHNBRWFtYXJUdHF0?=
 =?utf-8?B?LzVMUERXaVFocEVVZnVMVFIya0xkazJSdmpReG80NEUwRTJxT3daUVcybHk4?=
 =?utf-8?B?L1dZa0hmR3NqTnM0TjZzZTI1clBGOHV1cXA1WVlUaEFFL1hGcmdaVllFcmFI?=
 =?utf-8?B?MnpaL2tZQ3JkKzZMUkNJMllHRE1lUEM3aEw3NWJaUWJ3MjlaWXdxd1ZkMnpL?=
 =?utf-8?B?bmlPMURPUUpxL2VwRHJvOHZnMTR2SzZnUHpLRk9aTVU1bG1ubTJOb2I2dmll?=
 =?utf-8?B?NVEwbWY0UDZZZDVySk5uMW8xaWl4UE4vMDY1YWF0Z1NIT2EycGR3S01HRjY4?=
 =?utf-8?B?WnY2MGZicWdnUTNOYjlJa1ArbFY5R2ZLRXU5N0RMQ2t0V2phcXJaVW81U1Zk?=
 =?utf-8?B?NzExOEN5eFMrV004OE5FSU5RZFVMMG5xRG9sUGk5YkZOKzVNdktUOGNqbUJz?=
 =?utf-8?B?RzJjMXpMdkRVT3JXNmVWc1JYWGk5S2llMzFEcXc3NFVLM2s1bXFEOUR6Y1Nn?=
 =?utf-8?B?K25WTmFNRWw0MjRPRjZ1QUtlN2tzSUw0alUzWGhIM0UyYWE4SlE2WnhRVWRH?=
 =?utf-8?B?MDdGdE44ODBtRFBQZysvckJuaGprdUlpSi8zNEx5bEhFOWtlYjlMR2diVE0x?=
 =?utf-8?B?eGRobFNLM2pHdFFXZGFOdHhqWFFQNTdEajhvMG43aE03RE1VWlVzNURrbG05?=
 =?utf-8?B?OGV5eGFpWlhSdFcwS2hLZi83dFRhZkxDZ2thMGZ6dTJlSmQxaG5Sd2xrNkZv?=
 =?utf-8?B?a2hwbHkxTGxUQ2lSemtOZ0Q3R0R5aWZNVzhPQUlmUDNXQ1B5OVdGSG81cy9M?=
 =?utf-8?Q?rxRU=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(7416014)(376014)(366016)(7142099003); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YmZvbHJYcVkrbEl5dVRsQ0Y4cjI5STA4R1gydkgyNkdtR2xDbWU5QThCTnlQ?=
 =?utf-8?B?Mit6NWxkWDNjM3lCdDJMajIwNU9yTXdhMnlxemlTb1RUOG1VaEQ0UGp4WnFn?=
 =?utf-8?B?OVV6K1kwSTdYdDhVaHlnYWM4ZHRybE5zTkFLOFlROVlYR2g2bXFPZFVMNndr?=
 =?utf-8?B?UzArMmRXZVZ5Z1M5YVF5ZDN4RWpKRzY4Q2hvK2FkYjE3K3Zzd0hSKzZTdUdI?=
 =?utf-8?B?VTM1WGhYK0JCdFJTeTJpVlF2S3lEZEtNL1c5ZVV6VUFiUUxIN0ozWmxZa1ZB?=
 =?utf-8?B?ZFNwdVUzb2J0cEdObThJaTMzK2RJTTVGeHAvZEFDdk5JcGNUWDRmOUJ4YTcr?=
 =?utf-8?B?UlFPU1VwUC93KzVkK1BZL2VDZk8wRWs4TTZ3YzF1YlpISDJWSmNFZDd4dUJB?=
 =?utf-8?B?cGNxN3V0MGkrcThES1JzTnkxNXlXbE9tVTVDYW5IaGdLclBVTTh0bElVRmZm?=
 =?utf-8?B?N3FtcHljdm5ic0xMQXVlcmVSblE2TXRLam1ZZkY2dW9ZekNNRTBvYnNpNkpi?=
 =?utf-8?B?MFc1TVBiR1Q5QUY3M0hhNlNpMWkvOUZPbXhHWjNpTEJzV3RjazdNcXlDV09M?=
 =?utf-8?B?T1JtZW5JZFFTd0kyWm9EZlVaclVRb291SEY2TnFtczNucTdTQkpuMnpSS1Qw?=
 =?utf-8?B?U2luUVVxQjl5UlVvQThxMENMMFBxWHRWRVJVQjltUjFOOFg0QXgvc0VlQWM4?=
 =?utf-8?B?ZlBOeUFTM3NENjRZY2U1dHRHUXE5V3hjNGYzYld2anl0dWc0NTIrNEhRblB2?=
 =?utf-8?B?c25xVUh6aUVnQm8xTm9Dc21pamxKOGRsWGJnUlFSaVZZcHorQ0ZVc25GaWtW?=
 =?utf-8?B?NlY3SWt4WnNpek1reEZxRHJJZU5TQUE2SURudWg2SHdWL1BtRXBnSUtyaVFO?=
 =?utf-8?B?V2RQT2N1ZlZlT2Y2TGxVcGVGUzBEaW9nMDlMS0doRWxGQlBGYjdQcktKVUJh?=
 =?utf-8?B?MkdNUVEwUmJyNWg3Mlh1N21FZHcyQjNjT0diZklLOFRJa2VrcTZTcmoxc09O?=
 =?utf-8?B?TWlDN1o5U255OHFmcnZpMng1VkU5VXBJUjFPU05LSVBsUVJ0WFhDUlk5MnA3?=
 =?utf-8?B?SjlnY09FWWx3V2ZmM0FhM05NcDc2QWRodUNscXNlajdxMHdoNlBFY0lWdWxx?=
 =?utf-8?B?NWZGd3hGNVZaTWkyaGloU2JPWklJelRkK1ZsNmlsTEs0RnUyK3ovb21KUUJw?=
 =?utf-8?B?cEdwUzFSZmdiWXVROC9yMWZoSXVzZHFHM1ppMnJ3cWZ3eGcyMWlnNFY2bTZP?=
 =?utf-8?B?a0tGSVYrV2tSdG5CTUdnTE5ITHR6ZVRDejFVS2w5UmZlcDkwZ0g3bzdpSnlF?=
 =?utf-8?B?cUc0UnlCY0RoeTV6anRrWS9pUERNWjc1aW5DUkRYSmJlcXRtQ3BBekJONEZP?=
 =?utf-8?B?NFVzTFROWmkxS0tiRlcyaEhydXdUcVhDSVQrV3RpS3dnRjcwWVpuZlo1YkVO?=
 =?utf-8?B?ZXp2TEhTMTJBTlNHVXFjbW5xZUhwNkFhSmNGUWRWY2VwRXpKc2JxZVJkV0Va?=
 =?utf-8?B?N2NPc1E1WnlsQnF2MTEwQStjc3NPa1BGeklKeWJybkRTK0xvU2lJSXNuaWxl?=
 =?utf-8?B?UDJtd25mb0VFY2dTeWtwWkU0bzc5YnhUNGMzMjBoTWNMWEtnMFRPay9uTEQy?=
 =?utf-8?B?dThxeTF4YUxyQXB2aS9nVFplVTBKeVZ6Z25hY29GZFdUamlJd2NsQTd3SDBh?=
 =?utf-8?B?YlZJL0p0dURXNW5Rd3ZQOXd5cUQ2b2ZaZTIvQ0EzRjJNY0FLL1ZyRis4MjZ1?=
 =?utf-8?B?T0t4YzRBNktqRElPQ1lTa2hJWEVmMDVHUFdnZ21pMDB0TDh3QjlVSC9YN2NC?=
 =?utf-8?B?VGswcnUxQit5Ny9JeXdDblQzQUNFQ0tvd28yWndwZzJsdWp3cGZUWlk3ZUVx?=
 =?utf-8?B?UWRWZEU1MW1xbVlLM1lTL2t1N01nZlVBcExzWEcrUTg4dUFsemVJbHNTLzJ2?=
 =?utf-8?B?TFhqVmhJT0RJRGZhSlpKb1dicHJlUHlPUDFXa0NMdXpSNWhtL0dZZHZQRm1N?=
 =?utf-8?B?azJWdWx1bUFldHV3b2p4ci85dVcrY3c3NTh5clVrQ1phc3JnazRBVFF1Sk1p?=
 =?utf-8?B?Z05nY0NWNU12bktHWkg0NGk4UThIWDhLZlo1TXREcGdlWTN0S2VLTnVyRFhj?=
 =?utf-8?B?SzhSZndlbTlxUVZvNGFJdGt0N1BXekpUZ1J3NVU4dlNieWdOSmNYQk16UnpN?=
 =?utf-8?B?M2pDMm0wUER5OE5ua3FPcnc2ZVF6Tm9kSGtaTWI0ZTl2N2FmMGNQV1hEbVJt?=
 =?utf-8?B?SHdWUWlOQUgyVWp4QzNCcjZFUUN6Sk5tajJtMERrU041Q0VpVnVUZ3BicndV?=
 =?utf-8?Q?9pGS4BP4gB9GfeXWP6?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5481521a-fdd3-40ad-100f-08de737969f4
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2026 07:50:44.0819 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YgGKMkZZOKaKl0aY1d4QSJsRt5+JnikTnnIPHmU7aWVQo64+2MaAVYJGIETABADf
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL4PR12MB9483
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
	FORGED_RECIPIENTS(0.00)[m:airlied@gmail.com,m:tj@kernel.org,m:hannes@cmpxchg.org,m:mhocko@kernel.org,m:roman.gushchin@linux.dev,m:shakeel.butt@linux.dev,m:muchun.song@linux.dev,m:cgroups@vger.kernel.org,m:david@fromorbit.com,m:longman@redhat.com,m:simona@ffwll.ch,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[christian.koenig@amd.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	FREEMAIL_TO(0.00)[gmail.com,lists.freedesktop.org,kernel.org,cmpxchg.org,linux.dev];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[christian.koenig@amd.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[amd.com:+];
	NEURAL_HAM(-0.00)[-0.997];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:mid,amd.com:dkim,amd.com:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 13E4B183493
X-Rspamd-Action: no action

On 2/24/26 03:06, Dave Airlie wrote:
> From: Dave Airlie <airlied@redhat.com>
> 
> This introduces 2 new statistics and 3 new memcontrol APIs for dealing
> with GPU system memory allocations.
> 
> The stats corresponds to the same stats in the global vmstat,
> for number of active GPU pages, and number of pages in pools that
> can be reclaimed.
> 
> The first API charges a order of pages to a objcg, and sets
> the objcg on the pages like kmem does, and updates the active/reclaim
> statistic.
> 
> The second API uncharges a page from the obj cgroup it is currently charged
> to.
> 
> The third API allows moving a page to/from reclaim and between obj cgroups.
> When pages are added to the pool lru, this just updates accounting.
> When pages are being removed from a pool lru, they can be taken from
> the parent objcg so this allows them to be uncharged from there and transferred
> to a new child objcg.
> 
> Acked-by: Christian König <christian.koenig@amd.com>

I have to take that back.

After going over the different use cases I'm now pretty convinced that charging any GPU/TTM allocation to memcg is the wrong approach to the problem.

Instead TTM should have a dmem_cgroup_pool which can limit the amount of system memory each cgroup can use from GTT.

The use case that GTT memory should account to memcg is actually only valid for an extremely small number of HPC customers and for those use cases we have different approaches to solve this issue (udmabuf, system DMA-buf heap, etc...).

What we can do is to say that this dmem_cgroup_pool then also accounts to memcg for selected cgroups. This would not only make it superflous to have different flags in drivers and TTM to turn this feature on/off, but also allow charging VRAM or other local memory to memcg because they use system memory as fallback for device memory.

In other more high level words memcg is actually the swapping space for dmem.

Regards,
Christian.

> Signed-off-by: Dave Airlie <airlied@redhat.com>
> ---
> v2: use memcg_node_stat_items
> v3: fix null ptr dereference in uncharge
> v4: AI review: fix parameter names, fix problem with reclaim moving doing wrong thing
> ---
>  Documentation/admin-guide/cgroup-v2.rst |   6 ++
>  include/linux/memcontrol.h              |  11 +++
>  mm/memcontrol.c                         | 104 ++++++++++++++++++++++++
>  3 files changed, 121 insertions(+)
> 
> diff --git a/Documentation/admin-guide/cgroup-v2.rst b/Documentation/admin-guide/cgroup-v2.rst
> index 91beaa6798ce..3ea7f1a399e8 100644
> --- a/Documentation/admin-guide/cgroup-v2.rst
> +++ b/Documentation/admin-guide/cgroup-v2.rst
> @@ -1573,6 +1573,12 @@ The following nested keys are defined.
>  	  vmalloc (npn)
>  		Amount of memory used for vmap backed memory.
>  
> +	  gpu_active (npn)
> +		Amount of system memory used for GPU devices.
> +
> +	  gpu_reclaim (npn)
> +		Amount of system memory cached for GPU devices.
> +
>  	  shmem
>  		Amount of cached filesystem data that is swap-backed,
>  		such as tmpfs, shm segments, shared anonymous mmap()s
> diff --git a/include/linux/memcontrol.h b/include/linux/memcontrol.h
> index 70b685a85bf4..4f75d64f5fca 100644
> --- a/include/linux/memcontrol.h
> +++ b/include/linux/memcontrol.h
> @@ -1583,6 +1583,17 @@ static inline void mem_cgroup_flush_foreign(struct bdi_writeback *wb)
>  #endif	/* CONFIG_CGROUP_WRITEBACK */
>  
>  struct sock;
> +bool mem_cgroup_charge_gpu_page(struct obj_cgroup *objcg, struct page *page,
> +			   unsigned int order,
> +			   gfp_t gfp_mask, bool reclaim);
> +void mem_cgroup_uncharge_gpu_page(struct page *page,
> +				  unsigned int order,
> +				  bool reclaim);
> +bool mem_cgroup_move_gpu_page_reclaim(struct obj_cgroup *objcg,
> +				      struct page *page,
> +				      unsigned int order,
> +				      bool to_reclaim);
> +
>  #ifdef CONFIG_MEMCG
>  extern struct static_key_false memcg_sockets_enabled_key;
>  #define mem_cgroup_sockets_enabled static_branch_unlikely(&memcg_sockets_enabled_key)
> diff --git a/mm/memcontrol.c b/mm/memcontrol.c
> index a52da3a5e4fd..90bb3e00c258 100644
> --- a/mm/memcontrol.c
> +++ b/mm/memcontrol.c
> @@ -333,6 +333,8 @@ static const unsigned int memcg_node_stat_items[] = {
>  #ifdef CONFIG_HUGETLB_PAGE
>  	NR_HUGETLB,
>  #endif
> +	NR_GPU_ACTIVE,
> +	NR_GPU_RECLAIM,
>  };
>  
>  static const unsigned int memcg_stat_items[] = {
> @@ -1360,6 +1362,8 @@ static const struct memory_stat memory_stats[] = {
>  	{ "percpu",			MEMCG_PERCPU_B			},
>  	{ "sock",			MEMCG_SOCK			},
>  	{ "vmalloc",			MEMCG_VMALLOC			},
> +	{ "gpu_active",			NR_GPU_ACTIVE			},
> +	{ "gpu_reclaim",		NR_GPU_RECLAIM	                },
>  	{ "shmem",			NR_SHMEM			},
>  #ifdef CONFIG_ZSWAP
>  	{ "zswap",			MEMCG_ZSWAP_B			},
> @@ -5133,6 +5137,106 @@ void mem_cgroup_flush_workqueue(void)
>  	flush_workqueue(memcg_wq);
>  }
>  
> +/**
> + * mem_cgroup_charge_gpu_page - charge a page to GPU memory tracking
> + * @objcg: objcg to charge, NULL charges root memcg
> + * @page: page to charge
> + * @order: page allocation order
> + * @gfp_mask: gfp mode
> + * @reclaim: charge the reclaim counter instead of the active one.
> + *
> + * Charge the order sized @page to the objcg. Returns %true if the charge fit within
> + * @objcg's configured limit, %false if it doesn't.
> + */
> +bool mem_cgroup_charge_gpu_page(struct obj_cgroup *objcg, struct page *page,
> +				unsigned int order, gfp_t gfp_mask, bool reclaim)
> +{
> +	unsigned int nr_pages = 1 << order;
> +	struct mem_cgroup *memcg = NULL;
> +	struct lruvec *lruvec;
> +	int ret;
> +
> +	if (objcg) {
> +		memcg = get_mem_cgroup_from_objcg(objcg);
> +
> +		ret = try_charge_memcg(memcg, gfp_mask, nr_pages);
> +		if (ret) {
> +			mem_cgroup_put(memcg);
> +			return false;
> +		}
> +
> +		obj_cgroup_get(objcg);
> +		page_set_objcg(page, objcg);
> +	}
> +
> +	lruvec = mem_cgroup_lruvec(memcg, page_pgdat(page));
> +	mod_lruvec_state(lruvec, reclaim ? NR_GPU_RECLAIM : NR_GPU_ACTIVE, nr_pages);
> +
> +	mem_cgroup_put(memcg);
> +	return true;
> +}
> +EXPORT_SYMBOL_GPL(mem_cgroup_charge_gpu_page);
> +
> +/**
> + * mem_cgroup_uncharge_gpu_page - uncharge a page from GPU memory tracking
> + * @page: page to uncharge
> + * @order: order of the page allocation
> + * @reclaim: uncharge the reclaim counter instead of the active.
> + */
> +void mem_cgroup_uncharge_gpu_page(struct page *page,
> +				  unsigned int order, bool reclaim)
> +{
> +	struct obj_cgroup *objcg = page_objcg(page);
> +	struct mem_cgroup *memcg;
> +	struct lruvec *lruvec;
> +	int nr_pages = 1 << order;
> +
> +	memcg = objcg ? get_mem_cgroup_from_objcg(objcg) : NULL;
> +
> +	lruvec = mem_cgroup_lruvec(memcg, page_pgdat(page));
> +	mod_lruvec_state(lruvec, reclaim ? NR_GPU_RECLAIM : NR_GPU_ACTIVE, -nr_pages);
> +
> +	if (memcg && !mem_cgroup_is_root(memcg))
> +		refill_stock(memcg, nr_pages);
> +	page->memcg_data = 0;
> +	obj_cgroup_put(objcg);
> +	mem_cgroup_put(memcg);
> +}
> +EXPORT_SYMBOL_GPL(mem_cgroup_uncharge_gpu_page);
> +
> +/**
> + * mem_cgroup_move_gpu_reclaim - move pages from gpu to gpu reclaim and back
> + * @new_objcg: objcg to move page to, NULL if just stats update.
> + * @nr_pages: number of pages to move
> + * @to_reclaim: true moves pages into reclaim, false moves them back
> + */
> +bool mem_cgroup_move_gpu_page_reclaim(struct obj_cgroup *new_objcg,
> +				      struct page *page,
> +				      unsigned int order,
> +				      bool to_reclaim)
> +{
> +	struct obj_cgroup *objcg = page_objcg(page);
> +
> +	if (!objcg || !new_objcg || objcg == new_objcg) {
> +		struct mem_cgroup *memcg = objcg ? get_mem_cgroup_from_objcg(objcg) : NULL;
> +		struct lruvec *lruvec;
> +		unsigned long flags;
> +		int nr_pages = 1 << order;
> +
> +		lruvec = mem_cgroup_lruvec(memcg, page_pgdat(page));
> +		local_irq_save(flags);
> +		mod_lruvec_state(lruvec, to_reclaim ? NR_GPU_RECLAIM : NR_GPU_ACTIVE, nr_pages);
> +		mod_lruvec_state(lruvec, to_reclaim ? NR_GPU_ACTIVE : NR_GPU_RECLAIM, -nr_pages);
> +		local_irq_restore(flags);
> +		mem_cgroup_put(memcg);
> +		return true;
> +	} else {
> +		mem_cgroup_uncharge_gpu_page(page, order, true);
> +		return mem_cgroup_charge_gpu_page(new_objcg, page, order, 0, false);
> +	}
> +}
> +EXPORT_SYMBOL_GPL(mem_cgroup_move_gpu_page_reclaim);
> +
>  static int __init cgroup_memory(char *s)
>  {
>  	char *token;

