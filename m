Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7378AB87DB5
	for <lists+dri-devel@lfdr.de>; Fri, 19 Sep 2025 06:26:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CEC9510E171;
	Fri, 19 Sep 2025 04:26:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="ZrFEhdA/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PH7PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11010014.outbound.protection.outlook.com [52.101.201.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 83BE610E171
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Sep 2025 04:26:10 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Yo3HtjnPVNlIhR4RiEPCej84uVOKj2gZUTBulf38ydgRPqpjx6+OKg5nMpL0wvvUtzCPKlhU8c1/fUlbR+A7/rhOFPQgQTuUK/v18RsB/Sjmk6Uv+zm1+RTWcfLyKiUgU5p1ul8JaSfOzIl/XcX2YSHjrlXM/vXeLgRLcPWEU6eZB6qpw+HyoNR33jFyrZNHNbcQjo9gLRBOsWrNxjwjMql7e9UmVv5wbVgmhIdDBiZ7LOdVGqtkzyrsJBLpdze6jge7f2zeLRC/9M9hgSk0+BsR2Hm6r8IlEh8Okyfu+AqCsUBD7fEOiXPPGS1pG+Rkhy3hkX7b+KLPsYpAdEsnBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Q/pgE38JG38Zrb0Iwqbo1WFJtKABLw0d5CGl6ghWpqg=;
 b=oLNjblBH5rsAenw/cCe5s1vXTOPeZ1+8l44vEN97Wuw/IDfneJeD/nBqtRAZGt4mG0vnkCEZGTLhWnBkH/pJ02xLXn5eN5vj3ubJdoCDotm3O1Zdv1aG6vIwHKC9faGnOmYwozPUnzNBzPDG9R6aRyFPIUGiXPDdJTmgwCh6gz3dcCKgnYoANuBpl8aGIIE4eaIPIqdpDPUITtUiPLiReN5+LAU9/q/IvizsE1aBi5RscM5YzCiSNtG6S0M5bpnNvXtmx1jPa9Riu0cSIDAuswCIh0kWe3kY2EMLmL1w6ZW5yi71EEm278Ilf8L20MCMc0GF0Gvnxb85GMN1whAlQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Q/pgE38JG38Zrb0Iwqbo1WFJtKABLw0d5CGl6ghWpqg=;
 b=ZrFEhdA/eetkj3iVIsb6ZoNAf20D7XSvZ2j0RJ1btPV8FDV656DWZfPoREACxO52h4O6XvE+kjuzB28m+OoxPvCMsbY6j3npK27SS7TMTnYH63a2y2Ja/e+T/3ELYLJuqy3+k+XHGVnvz/zmoiITdteLwPGC0im3MBZjGg0gxOWnkFfoOTSOl8uoHJ/6LbTxpY8uFMdcrkuCuk/95/VV3qxVJyfYF+OmPZZ02Au1rJWQxJ4yR6iswYipeOC45DUBnmtGcpesEFnlQLNC/SSVTalRo62xjBYGGcoAsE1Nmhkxm0MiWjc++xpST2SSjZ2O23o9x8IFJaDxNJCrnLnnQA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM4PR12MB6494.namprd12.prod.outlook.com (2603:10b6:8:ba::19) by
 PH8PR12MB6841.namprd12.prod.outlook.com (2603:10b6:510:1c8::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.13; Fri, 19 Sep
 2025 04:26:05 +0000
Received: from DM4PR12MB6494.namprd12.prod.outlook.com
 ([fe80::346b:2daf:d648:2e11]) by DM4PR12MB6494.namprd12.prod.outlook.com
 ([fe80::346b:2daf:d648:2e11%6]) with mapi id 15.20.9115.018; Fri, 19 Sep 2025
 04:26:05 +0000
From: Mikko Perttunen <mperttunen@nvidia.com>
Date: Fri, 19 Sep 2025 13:25:40 +0900
Subject: [PATCH] drm/tegra: Add call to put_pid
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250919-host1x-put-pid-v1-1-19c2163dfa87@nvidia.com>
X-B4-Tracking: v=1; b=H4sIAEPbzGgC/x3MQQqAIBBA0avIrBtoIkO7SrSInGo2KmoRRHdPW
 r7F/w9kTsIZRvVA4kuyBF9BjYL1WPzOKK4aurbTrSWDR8iFboxnwSgO+4GcZtsPejVQo5h4k/s
 fTvP7focJ7DxgAAAA
X-Change-ID: 20250918-host1x-put-pid-461d5e9465c8
To: Thierry Reding <thierry.reding@gmail.com>
Cc: dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Prateek Agarwal <praagarwal@nvidia.com>, 
 Mikko Perttunen <mperttunen@nvidia.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: TYCP286CA0257.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:455::8) To DM4PR12MB6494.namprd12.prod.outlook.com
 (2603:10b6:8:ba::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB6494:EE_|PH8PR12MB6841:EE_
X-MS-Office365-Filtering-Correlation-Id: b1f64e36-2ecb-43d9-660a-08ddf734a61c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0; ARA:13230040|1800799024|10070799003|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?QmpONFNkekJsZVdWRE41eVc1SjZvUGl3SWVxNEhTVUsvODBZWERZbXNBS0ZD?=
 =?utf-8?B?R0FPa20zYTVkWFNDNU9RUkRYQ04wRXB6cm1tTlNGU2oxRmg3UkhPRnRTbExC?=
 =?utf-8?B?di9RakczYjk1YUcyMlhOSnIxMmppVEFzVHdMWXBCS2ZkSlNiT1ZFWnVMOGZy?=
 =?utf-8?B?dW9FVkUwdHE1bEJLVHlhK0REMkNBM1F4MEU1WFFDQURnR2t0OG9zYmZyY09m?=
 =?utf-8?B?emorOGdPMkVjanYvcCtBbGpEbEw3RWFRa3NJTkFJeUZEcm1rTlZDc3hTVkNK?=
 =?utf-8?B?ZXdnR1ZCb2V2UjNzTU8vRXl5T2luanBUL1huV05SZG5kaUFhZ0cyRjBrWnds?=
 =?utf-8?B?T29Gajl3KytNOWZIRHhwQUQyTm5PWitrR1JOdkkyamlFanBsNWd6ZENLQkpv?=
 =?utf-8?B?alNrclA2NjRmY2dKL3JuQm4vQ1lVd0VybGQ1YmVvQ24rNWtkODFpeGxpWGNx?=
 =?utf-8?B?eXd3OHlMdGhLY2Y2WWxteXRmMEZPVEZmNHBYbExQVnl5YTZJeFBaYjFOWklP?=
 =?utf-8?B?OFVsd2pXbU5xd01LbnlNQ3FxOXV2TllNeldnMXdGTnVKVmlzQWRib3FYeFFH?=
 =?utf-8?B?SS9vUHM2VDRRNTVWb2pMYkxTam1PSVZQVG5BV0JsN2RjMDBob1laeC9EMnp1?=
 =?utf-8?B?RUJoeEZNdkh5R0lZUEk1eE9VNW9SdEZZMHRJNWphc3EvbUw1V3NwSVExOUlx?=
 =?utf-8?B?N3VqSFlNL2loc0tBZkN2SEhNR255SEN0SmFQMTJvQVI5QyttdmhFVTljVGZ5?=
 =?utf-8?B?bmFQd20zTUhPQThKTlRCWUxibjhBNndVSnEvVTY4NUNVejE5SXh6ZGVmNWFR?=
 =?utf-8?B?dzJuSFBjNmQ5d1ZGRktOUTk5QU9nMXB1b2xvdHYwdWtkUkxVRnRoSkJPdXc5?=
 =?utf-8?B?RU5IVllxMk5scGw3STNFRGpnaUo1SFF6dVI1dENSOUwwclRHRnhibnpxK2sw?=
 =?utf-8?B?RWc2REMvR1E3RERQU01nTlhmK3Y1S1d3dlRzeDJFSWljQVJKRzR3MDNOUHNu?=
 =?utf-8?B?NFhkeDRDMXgzS0JHQXBFT0lKUHhhZkRqdmJSVkdzaE05NGgvWjN5a0lJektn?=
 =?utf-8?B?b21WRFJjOEdQV0pVcS9NMnpNTjc0VHdybTRrb1dLWklaYmx6YUZJTDRMTmR5?=
 =?utf-8?B?QnVsVGdaR3lITTFaMmxlS2U3d2lWTWQvNkw4Z2hSK3BIeCsxcEtjT0JmbDBy?=
 =?utf-8?B?TjJaL28vK09YOCtnd1NkNGJSblA2OTJ5dGgzWXloU1hHb1RrRUZZVWZ1aTA0?=
 =?utf-8?B?K1hjVHVFcEtPRFZxbkNsMFJ6cWhoMFgwUmRWcWtCMlZ2a251K1hTdGJWZmRj?=
 =?utf-8?B?T0cvZ0hmNW0wd2g5Yi9OTEpEWFBwVzZmWTFTbUFraXVneTBmaTgzai92Rmx2?=
 =?utf-8?B?bERGenpjV0xsNSttdEp5QkxIUjkwL3NoWHUrT1FBdmpuWEg2NWUxMFlRNnQ4?=
 =?utf-8?B?ak80UWFZMEtrcnZrVzNJa2Yvdmg3RC9uV1dyTXJMOGliNmZCRE1YQ3FNMHRP?=
 =?utf-8?B?bU9SZWZjMFV4a0VkUiszd2pXdXNUUVU3YWxySW1RQk1zMzYwWjQvZUthamhk?=
 =?utf-8?B?blo4QUJHNlRCOE1wNEhJZGEvOVJJUTdFUWdQaVlRL24vWFFmNVk3WVZENkww?=
 =?utf-8?B?dkNSUFhIMm5aNEhDMjVaa2M1UFM4alJiNGNPT3ZqaFpQNVF1czhOT0J0R1gv?=
 =?utf-8?B?THRwdHRONTlaUm1vK3F0RmZ6TnVieTdpODR1L0s3MGNLV1NBMERIMmlRK3VZ?=
 =?utf-8?B?NWorWGdYZ1NBdi92WnhaTzJGcGZUYnhnOEp5MnYwWTEwL25IOTJLZ0FzRXFP?=
 =?utf-8?B?REhKSWtWUkRseUh4SmI4T0NOM1hzSkxzWFZyb0loeG90bCszZXNXaElqUDhY?=
 =?utf-8?B?OUlNOXFJMFI0RkgvY29BcHdzZzdjQThTNXNSZmVYQno4Z2ZtSzRiT092Y3ZK?=
 =?utf-8?Q?Whz4vDvEJBU=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB6494.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(10070799003)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZStRdlprWm9iMWVWdDZnS21Qd3kzTnE1bFBtZ25ycEg2aXI1MWZGV3F2dTVU?=
 =?utf-8?B?aGRCblI2NnBMMGJCUUFXZlZ3U1FVRlJPYkV2NXUyYitkTUpXazM3cDNZcTV1?=
 =?utf-8?B?ODJ2UlV6eFpxTjRCN2VieGt3ODNDUDR4NURhR2Era2tybHJhbm5WRnNZajEx?=
 =?utf-8?B?aTZhdnJNTjFDU0hzY2NBZUVxZmMzaWZ0Zk5SM0ZrRDZUcXlzSlIxNjJmVktZ?=
 =?utf-8?B?bTVUakcwU3BrbTR1WjhUanNWclJKRnluR2s3MVpJVzM3aFZaVVJVMEpnUGo0?=
 =?utf-8?B?Q2RMS1NReEhLYUFGTG0rL2ZJOXQ3U21pT3dmcEMvb0NSNmlIUUt3aTRkQU91?=
 =?utf-8?B?Y3lFcFV3Q0RlVzZxYVVleVZIdllBaU10aC9hZ3FOa3cwNUhmcFpXdzBZQUx2?=
 =?utf-8?B?cUVxK2tseHQ3TXloZG91enFsejNxTHNHMThaa0pvdnVDN2NQTTlmWHM2TUFx?=
 =?utf-8?B?MjJhMGc5NkNYMENXa1R6cVRlbzVtQURpdVV2MHE1ZEl5WVNhNnVNVVFYeUVF?=
 =?utf-8?B?WUExdHVGZXAzK3QxL3JubkV3UFpqVkg0d3pUaTFEd05hSXZiUjZ6clNsQlc0?=
 =?utf-8?B?ZVdRdFV6cFNTODZBUVlPeWpBQzFpNWtUVXFGaFhUNWs0K1JZYTB5R3pGR1pN?=
 =?utf-8?B?bzVZQmF1dXduM0dRRkVyYUhRckFkdXMrd0pqUG96L3JZcnh4NkhUVzdhTHVT?=
 =?utf-8?B?MWs2d1ZkQjZUdHlXODNkVTZMQk5DWjdpQlVOZnFZTnhiUzFzYTd0WjFJVVZZ?=
 =?utf-8?B?V3UrcVpDdU1yWEsyMHduT3kvSWRLQTVYc3g1NFpWSFVualVLQkNBL3Qrd2pU?=
 =?utf-8?B?L2hDM3BhR2MyaGIxV0pSVmtYOTFNL2JiR3BDaFRRMXBTUE1CbFFIMFA2STdL?=
 =?utf-8?B?RHBpRUZPVWUzWksrdWRkMWpvb05HMlp5ZERjaWhwd0JqYm1OSDBYdU11NFZz?=
 =?utf-8?B?dVUrRVltdHNMZ3ozQ0dtYXpRL0FvbVpKWDNpcW9MT016WStBanFlbXlqYXFT?=
 =?utf-8?B?L0VxMjdnV2lwMW9qL3lOUm8wa2krMC84UzQrWTFid1h5Ym5VNXJFSXhxZTNl?=
 =?utf-8?B?dDVqWVB1TGZzUUNyTkRibXZVSTJVdmlrZnlhU0I1anFFMHFVZnJaa29xRzZl?=
 =?utf-8?B?TVlHNmprekFwUExJTlFQVmtFOTF2VElNSWFONUN4Z0IrWXFZUUU1OW5Kc1c1?=
 =?utf-8?B?SFFWWWg1ZDFmQUpISlVhYi9BaEY3aSsreEFIVnhKVlp1Z0phZktrUlpPYW9N?=
 =?utf-8?B?YjZ6RmQ0MEdTaEFuTzJjOGN6bm5OM0x2T1dOTEFZZTJzYmZIWEhoeVIvQnQ3?=
 =?utf-8?B?T0NLT0hwS2VQYS84bDZIa0NBRTVHNFZ2bC9DVHlWSGZOSXNNUjFXYk9SOTQz?=
 =?utf-8?B?MXJaME9nMm9ZQ0RQWHhIaUdkU21lUHlWZVNSY1YxVWsvaDJsVFlhZ1J3UjZB?=
 =?utf-8?B?dGI0aVNwYVpYejFnUmdPcHNuR3htdHVCQURWeHdBMWVwK0M5enhqbXZjR1pn?=
 =?utf-8?B?b3VBaUhTWWFxVGxsdUhpaTdBMVBKUUgzdHM1RkNQK0l6UmFlSUIwNVYyZmxT?=
 =?utf-8?B?UnlMczNvRFJ5eUFXeXFxdmRJbDIzdWVkZ3NWSnBuOVdBMmZyTVVEcFVoTVV3?=
 =?utf-8?B?SWd2WFk5U0R5S1NuWTZ5WlNBTFFORHJpNmtacWs5bEhLampkTkY0OEk0dloy?=
 =?utf-8?B?VnJ5NVhaRUN2b2puayt6UW10YU9KaXFQL0M1S0txTVdycDY1Mk5BV1h4NHU1?=
 =?utf-8?B?cXVlTHAwOS8ya2NtQzBtWVYweEJoRXVUSUFBUEZsQ3lKemdvTXQwd3llcU9I?=
 =?utf-8?B?ZkRNSXdSWG9WeWtWSSt2VHJLZEV6ZHZISFl2MkZacnZYbnpCb3JoS1JMUnFo?=
 =?utf-8?B?U0xyK2xIb2NaTUtzajhweko3a1AxOVNHUHBaWWJydnhaa3RnVVhoNGNtN2Ew?=
 =?utf-8?B?ZEtsbTJDZzVEMWNDby84L21yNG5CSTFvZTc5UFBMcHlOckg3ckZVbDFSV3JJ?=
 =?utf-8?B?YkRsazQvZ05RNG02dDhPZ0t1TzFOeW9TanE1TWRiVVR3Yy9teHRYVnY4RVpC?=
 =?utf-8?B?ZmptZG9CS3paSzlsRTRPblhjRWg4UlZqK3FWcEdEUXBNejMrcEF6SkJROGI5?=
 =?utf-8?B?SFY0NGRUZEN1clpNRmREU0prNFZHVzN0N0xyZ0ptanIzMURMb25VWjBJK1Y2?=
 =?utf-8?B?MlZEbzdkK3FOR091b2JtcEtWbVZSSjRPVFlIejZiZVhlazVzWUFrelF1dUww?=
 =?utf-8?B?OUFBZXpUNjJ6UWYyamVpQjV1NUhBPT0=?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b1f64e36-2ecb-43d9-660a-08ddf734a61c
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB6494.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Sep 2025 04:26:05.5129 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BJMqbzX6oYbK/SaHl4cbBxdxxe3xEbG49W7lYIpHXRkAujzrWQsCLc0BklZtw1bU7eXzJqB3TOQkfOZ3pvzTDg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB6841
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

From: Prateek Agarwal <praagarwal@nvidia.com>

Add call to put_pid corresponding to get_task_pid.
host1x_memory_context_alloc does not take ownership of the pid so we
need to free it here to avoid leaking.

Signed-off-by: Prateek Agarwal <praagarwal@nvidia.com>
Fixes: e09db97889ec ("drm/tegra: Support context isolation")
[mperttunen@nvidia.com: reword commit message]
Signed-off-by: Mikko Perttunen <mperttunen@nvidia.com>
---
 drivers/gpu/drm/tegra/uapi.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/tegra/uapi.c b/drivers/gpu/drm/tegra/uapi.c
index 5adab6b229164eed6ec1830243ad9f9e5b5147f6..d0b6a1fa6efad9bf945ca6d85c61431f1c2f255f 100644
--- a/drivers/gpu/drm/tegra/uapi.c
+++ b/drivers/gpu/drm/tegra/uapi.c
@@ -114,9 +114,12 @@ int tegra_drm_ioctl_channel_open(struct drm_device *drm, void *data, struct drm_
 		if (err)
 			goto put_channel;
 
-		if (supported)
+		if (supported) {
+			struct pid *pid = get_task_pid(current, PIDTYPE_TGID);
 			context->memory_context = host1x_memory_context_alloc(
-				host, client->base.dev, get_task_pid(current, PIDTYPE_TGID));
+				host, client->base.dev, pid);
+			put_pid(pid);
+		}
 
 		if (IS_ERR(context->memory_context)) {
 			if (PTR_ERR(context->memory_context) != -EOPNOTSUPP) {

---
base-commit: ae2d20002576d2893ecaff25db3d7ef9190ac0b6
change-id: 20250918-host1x-put-pid-461d5e9465c8

