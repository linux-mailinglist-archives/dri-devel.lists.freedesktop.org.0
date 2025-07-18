Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F622B09C67
	for <lists+dri-devel@lfdr.de>; Fri, 18 Jul 2025 09:26:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 70E5710E908;
	Fri, 18 Jul 2025 07:26:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="e1hFYHBw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on2041.outbound.protection.outlook.com [40.107.100.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E79F610E902;
 Fri, 18 Jul 2025 07:26:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bjuVyYAeXTY+A+Z1imM0oaeyYbl+NKtOvFhUqFpZUtEzBbQs8txdCbJoCy/DdeCrD8gJXi6RewvTJbc+fIMOJsPja+J60hGJ8ZrenfielktxMxgH+AFXCJdnBs/DOS2CXl/jyvHgEMCoToWG6e0Dm2+qXOmeid3+X+fAboGuEVpWQvuw1SYK8pnL4N/XHJ2m7d2cGYK0+qXFtCP13R8SGzjC61SopVrgrKYzvNu0/Q2JMqy4Gxc80yq1flIyKPPcvL7vYBhvUejrnFFYxEUn9SOzTMLxDRd6wa5pvaGJ4bVrd58VmcQs26MwqGoZcK9KaUsRJFZSXldUvU2IfX9kCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=m+BX2cATiqpqkzxQ/MQC5kw3uZ5lhWccUAEGEQr2IGI=;
 b=cwETYb9qpxUtdDk/8XOn6SMWvKMpcOGi900FdIO9LGe3KAWsPkqS6XQMGsO7oiVXot7s6LWFTp2/AuCUPj5hJHJGhQQRIgIBl4kREJzbNOS3GtMP9afqTGtHGbT7GN/DW6tY/wKg4Q7mCoIsvv5/e3Nzj6A9n3qDecmQ0fp6+cs8y80wOBF9FUEW+yGpa8Shj9hscAuzMI2NIbgZ9ks3wnXpF8AHDo6r/uQE/YSlBpdsGaUVSHYsBuNpoDYoH6W0jPcitKl66EMYVnZISyj9N0p17IraFBQluBREygY5ndH77veHmCiamRO5amLjgvXhFeXjWhvZeNCCHUBQ7krmdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m+BX2cATiqpqkzxQ/MQC5kw3uZ5lhWccUAEGEQr2IGI=;
 b=e1hFYHBwK/F+fm4lZKsDQnRd6hSuSgylCR3e2eE3vmAVLllXSZ7sNnJGFepq6kC5DK6GKXJyuMBKj3oReYiIsQWYmkW0/4n/e8zDU4BDYTqyrDmGZO/1F70Hy1T2C7LyZ/TKe5OiRf6BPJBZVxrAU2AQCJwD/f70NTIN5mi3s3g9RArXnhQUVmMVfwcsWCGVGGst62ziql37G+Ah2HxpFJWJDesAvWbQLyALsjJytnDl2R20WFpH12QKa+Lmj/zAcM+NsKjKzMgFHzna0jqJElJpgIYOOhqEGBGc5Km6YLtqXszGeRQQeTDcBurxxPy7d7BpT0pHa3nRcjFFm32IuA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by DM6PR12MB4091.namprd12.prod.outlook.com (2603:10b6:5:222::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8943.25; Fri, 18 Jul
 2025 07:26:43 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99%4]) with mapi id 15.20.8922.037; Fri, 18 Jul 2025
 07:26:43 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Fri, 18 Jul 2025 16:26:12 +0900
Subject: [PATCH v2 07/19] gpu: nova-core: register: move OFFSET declaration
 to I/O impl block
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250718-nova-regs-v2-7-7b6a762aa1cd@nvidia.com>
References: <20250718-nova-regs-v2-0-7b6a762aa1cd@nvidia.com>
In-Reply-To: <20250718-nova-regs-v2-0-7b6a762aa1cd@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Cc: Daniel Almeida <daniel.almeida@collabora.com>, 
 Beata Michalska <beata.michalska@arm.com>, nouveau@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Alexandre Courbot <acourbot@nvidia.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: TYCP286CA0192.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:382::18) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|DM6PR12MB4091:EE_
X-MS-Office365-Filtering-Correlation-Id: 85f4d564-395a-445d-7d36-08ddc5cc7237
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|10070799003|7416014|376014; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SzBvMFhaNE5ZalVTWmNrSHRCdWFTKzdJU0ZqRVAyLy9MdVBWRXFzeXdaWWlF?=
 =?utf-8?B?QXl3Tm5jS2U4VG1YVVo5dXdBK25PK1JRNDVJZFdhL3ZwWGRsNGw3NnZaWWpS?=
 =?utf-8?B?Y015Tk9aYy93UWZXdDlLU3gvNnNqZVJRREZEQjNCODVYTEczVmp5Tk9BNDdH?=
 =?utf-8?B?OWU0b09xSGJBc3NaR2tTbnkxK0FxQzZSWDlFRTU2OXJ1K2FLSnMxbVRKbkxD?=
 =?utf-8?B?WkEralJyRllGWEFZYlkvQTEzZTc5Q3NLZ0lqaldOMTYxY3dvQXBMTWFWZ2hW?=
 =?utf-8?B?a2VnMFM3c1R4UTYwM3FGTWhrMGR3VnBUblNpMDluQUV1bFlFbXJpdGU5L0JW?=
 =?utf-8?B?c3FsT05uNzQvbnRIQzJMUldwZTgxSzF0cXR3SHhBaktwR2UrVnUwRVVCYzRE?=
 =?utf-8?B?Z2VGNUpxTDZRcWU0bnc2VmN0L0s1VE1rS0h5TTdpTWRsWUZhOFdaMjlpR1N2?=
 =?utf-8?B?SGN5cTY1WTVqTG9INFlLZDVLbmFlaCtoMXBSOXQvaXZlK2xrYnlZYWRFQzdB?=
 =?utf-8?B?NXo3eVdOMUFSbUJkYnJtWmJJTVFWVFN2UlBtaEoyN0JhWDl3LzE3RkVMUjdM?=
 =?utf-8?B?dVlIcS9lbGI0NGJjNWU2M1Bnalh5enN0V3JJVUJldGZTaXhGQkR4eHEvSEtr?=
 =?utf-8?B?cjEyNk5haGsvN3dvOUVkS0s1elFTRVJCL1ArWUlWTlJkZlVPUXFFWk1jZTFM?=
 =?utf-8?B?UC9WVWk4Nmd2TnJ3dVJWcVlPc3JpUlgrNzJpNkVuWjh3aVN3ekR1Nmd4SE5Y?=
 =?utf-8?B?TXZvazdlMUFQcmpVZnZhOERIY0w1SzFlQjljaTAyMU5rdTBqL1FyTGxvSERq?=
 =?utf-8?B?NFhQcnBSN1RPMVg2MzArZ05CUzhGbVRrSURBSUhlc2N4aVNxc1d0Q1AxaGE4?=
 =?utf-8?B?dDZaa2lza1FnTHExTkhaTWZrWFlRa3FQelZ6Z1cwNER0L1BxYUdITXVtYml6?=
 =?utf-8?B?MWQwOVgzK3EwVkVOcjY0TVQya1R3d2J0ZDRraHN3cGpMb2R1T2kyZzd0ZFFR?=
 =?utf-8?B?cHhNZy9ERTNPSGFwb0taMWlLaENjc1FRbFVUR1dlTU9jNGlDMHEvMWZkR3oz?=
 =?utf-8?B?NkFNeUtEemdYbVNQUnpEQ0xpdmJXY0F3RkV5U0FRdVlKNnBsam55WDVoejFk?=
 =?utf-8?B?UmF1NytTTlNzN096YXphWGN2a09QQUltN09VWUEycUdOSzlzVkYzc2creXNB?=
 =?utf-8?B?MnZVL3FSeVFjdGdPYkpGZUg1MVdESzNCcmthRkxoNjBNTFV1YWU3MkhlNm1L?=
 =?utf-8?B?SWFPNlJoV3hJMkdJWkdFVnBBdy90OTU1V3dFcldIZWNRbDl3OUlBWW1DbERm?=
 =?utf-8?B?eXZNSGs5Z2tzUlVYeTl1cmQveUNxbjQ0Z21BWDNsTnVkWE1qL2c5V3RkV3JR?=
 =?utf-8?B?ekFtZ0tMYUJ3dmtlaWlLTHI5L2o3VEtzc0FldnplMSt2U3dWRE16K0xnOEly?=
 =?utf-8?B?RWd1NThuTmVDcE80bW0rZjkzcXB0aVNQb1FHeTN5dUs0MTA5MlJUd29nV1I3?=
 =?utf-8?B?eTJBNGZUSDZDN2g1Rm5QaWJDSzRkZ3hnQTVwOG1Gam1rb3pyaEc1dUxwd1Fl?=
 =?utf-8?B?aWZZNVVBMXR0YzNIUzRjVlVEUWh2cWxvenZ4TWowaU0wdjNBeTZ0VUYyUHUr?=
 =?utf-8?B?enF3akRnY05meUpXY2pGcG16cmNOeTR1SHVqTUdHS04yTml6QUJpZGFRQXlt?=
 =?utf-8?B?TFhPeU81VXRXczltbTgzd1ZYaUZsVnhsYnJldVJHbS9pMEdhMStaSEZLTWtr?=
 =?utf-8?B?emI3YzlWWFpPL1ZzV05sQ2k2VW9CWnI5OEdUejRSb0xtZExKMnZpSlg3OGhC?=
 =?utf-8?B?dUxUbEpqdXBvVm9lTjhtZ2tvNHJHMHBjL0E5eVBQeVNRY2NZeGYxSmVaaHRL?=
 =?utf-8?B?OVRQbVphVXlwUkFPUmQzQXJLWHAxWXJlUTBwZVRtQTBmQkF5SnRua1BIcmZt?=
 =?utf-8?Q?vMaIS4dlCPs=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(10070799003)(7416014)(376014); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?THlaNFVvY0ozZTBybGE1WDNHUGZVYTZ5Q0k1TkdYbk9FV1JVUmZFQ05KelBt?=
 =?utf-8?B?cnlqTU9VeE0weExwNll1K2JTcHBZMGlPdGV6MzAxaGRieU9wWHRMMlRHa2RQ?=
 =?utf-8?B?Q3dQeUtFaHRMTTdYWXlwMTVaazJXWnlUNmhoaW5qRDVySHcxeGlYaHNHTVg1?=
 =?utf-8?B?djFOdmVzN0g1V3duV3RMQXhlb2xRZlIvRlpEcnJMdGtqUWYwb3RqUmlZN2Vi?=
 =?utf-8?B?ZiszQ25vd0NjSE1nOFU3aTBEdnVZOWJwNjB2QWlPUFNHczZyY1ZaSElFNm9x?=
 =?utf-8?B?NTUwM0wrNzNaWktkZElrLzJwUW0waWl3QzVlWW0vaFEzZXhXbjlUb2MrUkhP?=
 =?utf-8?B?OW1xTTBrUlYwKytFdnVuMHBycFlaUEJaaUI1T3Q4SEROd1EyUFRUWGFBQTR6?=
 =?utf-8?B?TmR1cmE2MDNhMWl4MkM1NTFMa2FQSTdpeE9KUEtNUDhtekkzYUk4Rm1uMU9Y?=
 =?utf-8?B?VGNSSW8vU2JxQ3dSTDEwem1zYlhkanFHNEhqLzgrMDQzWTdmUjJqK1o0aGZI?=
 =?utf-8?B?R1NSa3BLaFoxa1VudEJtV0ZoZStTUE1Zajd0TWRobzZTMjN3Rk16QmhVVitQ?=
 =?utf-8?B?eGlvQUw2dzF3a0F3TXBHc2hFeTdSY0lsUDZBWHBrSnFvSS9GMkFYdVlDL3dk?=
 =?utf-8?B?bk5hMEgwU0U5aU50elhZUS9PZjJiOUFGVHJNbkZvYzh1TkYxbFd4OGZLR3lM?=
 =?utf-8?B?emNjbnE0eEQwbjhqbWR0WkQ2SWQ1U215WmRxSDh6eHlpa2xTaWlWcGRMb3F5?=
 =?utf-8?B?dzZTN20wMWhoKzRvVWhoTGd5VWtBWUNNRytZRlpCZFNKVXk1bWl0UlpRZlJW?=
 =?utf-8?B?UkVaSFFveDNBd3ZZeDNuQmtLeFcxRU5kRDVUeXhWeDRHMzJQWFBQYmNzbVB2?=
 =?utf-8?B?Q2s4Szd4aXZpRzdkbEorbnRDU3I0aTd5bzlSTTRvYS9tRGw4bG5FTldTMjM5?=
 =?utf-8?B?N3VmRmVDK1dpcWFLRzlGQjdzT3ZockZQdkNySFBoRk5nWUNieEZJaU54QVdB?=
 =?utf-8?B?Q2hiY3FldWYrcDB3dWxOUFg2eWVLeU5IQ3FaaXR2dnlUcWdISkpWemFNSlpj?=
 =?utf-8?B?UExZQ3pOY1UxL1dZa3VLMi80NFRZZldDUWwrWlpkeitsTm9zWC9JaGZGL0lJ?=
 =?utf-8?B?VE01Mk1xbG96NlQwZURyWVptMnROZEdkTG9Ta0FiYnNPcDV4bzhYMGFpT3hI?=
 =?utf-8?B?MDB6bDhWeXZSZk5XYmVTMHpqdkNHbi8vNXAzQ1czS2NxNER2ZmNweEJNM1Ju?=
 =?utf-8?B?dmo5MWEzYWtMR0duUFhwYlJNTnhpeXp2OFp6S0lKMzJXSVp0UE44ME9JaXI1?=
 =?utf-8?B?MTJwdTAyUy93Wno5ZjdvVkJvT0hjaVJNQjRjYmlXalRlV2lkVGF4TFBXQ2NB?=
 =?utf-8?B?emdKSEhrc3hrYUlZaE9OZi9ZNlpwZzdkeDB5ZEtrdXJFb3I5aGhyek5vNEgx?=
 =?utf-8?B?V3VYNlhhejdCRUppalhWWnI2ZGRHUDlDYktLdHVyc1ZFQi9CVVEyQmttZ0JU?=
 =?utf-8?B?TkJFQ1VabWVLM0ZUU1hmRldmdGsxTHViSVNscVVMcjBOK2JoNUl2UE05YVJq?=
 =?utf-8?B?WVNyeUgrT0FqKzRPbGErZ1JKT1JhSXhJYk1QTXczWjN3V0lsUXllQVZtTDFz?=
 =?utf-8?B?WlprclBuTHN4R20xYVZlWlBIZnB6YzVjVnh0MDVGQlg4QUkrRjcxV3RYaTdJ?=
 =?utf-8?B?eHlKd3lNOFRwMktnaWNtZS9makFzTUoyMkJrcmtUOEN5Y29wT1lTTStoWXJD?=
 =?utf-8?B?MDJZbzIvT0xNcGtNckdsZ3E4bTRQbjl1YnliNWNCUGRUelRsbmQvYXZIQVg5?=
 =?utf-8?B?SzlIeHNCaURQT1FwdWx1S2xjWFhBRjJSS1d0cHAyclNjOEs3cVFjWC8zRUFU?=
 =?utf-8?B?QkJJemZ5eXA3N20zb1V6dTJPMnhUNGIrWG9JOFVMMFRnWU83RUw3UlFlS21m?=
 =?utf-8?B?L0ZUMUFlTm1QZDVDNXErV20vZXdUUVNKdXJERFVvZW5jc0drZ2NpcFhjbUdv?=
 =?utf-8?B?WUpJUGw1UVhEUFdYVWNya0Urd1NuajJHb0ZXVWJEYUZxVk1MYmNSYU5odkJ4?=
 =?utf-8?B?T3dGeWlxSWJiREZOZ2JhbGlRb2RRSDFEK0VudkdOWWgxbTJ0ZWNrRS9JRFhG?=
 =?utf-8?B?M0NRWWhqSURyWVRRclc4azNtSGxDWTRabXVMRHo3VkxFeUtYOUM4ZmkwZlJH?=
 =?utf-8?Q?VHJI0Ez57Y+i/zAS6Wae7EEt8fK0KhXXExG3AEO5YU8I?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 85f4d564-395a-445d-7d36-08ddc5cc7237
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jul 2025 07:26:43.7819 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: k/ssIIuW2miM4bH9xpaxgtBH7VO+Z9+fISb0M95QXwk95DMtb4ofWYdQG2Oi3JgN/O0vkBQPGUH854YnEKsOXw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4091
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
index 742afd3ae1a3c798817bbf815945889077ce10d0..4da897787c065e69657ce65327e3290af403a615 100644
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
2.50.1

