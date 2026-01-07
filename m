Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8048FCFFF3B
	for <lists+dri-devel@lfdr.de>; Wed, 07 Jan 2026 21:16:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F1BC10E2D3;
	Wed,  7 Jan 2026 20:16:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="R9npwF8s";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CH5PR02CU005.outbound.protection.outlook.com
 (mail-northcentralusazon11012058.outbound.protection.outlook.com
 [40.107.200.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E76EF10E086;
 Wed,  7 Jan 2026 20:16:02 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=chKHKXuQSImj8VQTtBPkMEDH1/fdlJeXX4l/xSQnNZed8p0MBSF2KSYHBMVn641iAv6fpoJOfWBzU4o4B59TP9E4OxpkH3z6fwrfTKn9ZBsXMUeLnPFyZlrIXbExeiYy/gxr8xypjek/NWv/z3LRfsgGfGnIybMasqr00u1T6iLhjQW78YhfPNIB9eQ32dU+NN6E/10wDnwUM+XFTHllSNmL7uMRKYCrpj5NOJZkTgyoJM6agHBP9GQL0G+XiRuy6HwKEtPfT5hco7EaxIDnaXB68EI2jgxHukkzvzk1j7bnj2RBR/hKFwj+PcIczhosIA36KJbIg6rzQBdWiimn2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v2A70iqizWeymnrvXGAozqvn0nVnV3fLtne53kpBrsM=;
 b=nQt+AxxQfEQFJiKaYGLZ5pMWpmemiPiMUVc00jiYJF2RS9QKdQqXMMhywLhd8BUDx1bLAiChEoXPWKFZdj5jn5KAqGWR6ipot3jFX7HnMNf6WfYceLYHRm8XbZFq6XTNq/I2bd/WwBgu9yyds0Ipy6PoarbtQ4/+shmMgfp7Q9JhBvodHcCAsSigwBcwDliqQ2DWMZgTdOtNVhfoUEnu7is9GVFOv4324UnJBrj+Pe2zDIcSVpE3UGLWGwrUuRWIZWWas0Vk/O0Z8GSqELsNW1zcdDyIzRgZaArk0Sx51dCByyLFtS9FIGKxPEH7LbjNPTnMAStMmGKYGfhJGWCNuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v2A70iqizWeymnrvXGAozqvn0nVnV3fLtne53kpBrsM=;
 b=R9npwF8sxf13eZedN++eK5vhN+q7VUpDCndcnVc/vEbnQBF8H5UX3oL/bWAZUpV838j7nTPZiqppPyTiIbOHNRRAshJJS8snbzmHGpdlLc4dIf7w9iKhFquao6dngj6TMYZ5a4DqGVi/KFNXBY9ozoBzg7XGWDuPeY0+ie6v6fOpQibBn+NkqOhZSKLpgHy/vXvhzwGbHH5l3Jo1L2OF1uap/1Aa7/saNA5/IuABlP6Yaxe/Y0gsCHm3XnVpu+YrWSS3WFhceaihDLWOP7qmGagGAhSNMestYYhIXYFXaCStmNPGFV4jdSfJyoFFou7hyHQ/8UGt46/gFJXtFrdGCQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS7PR12MB9473.namprd12.prod.outlook.com (2603:10b6:8:252::5) by
 BY5PR12MB4177.namprd12.prod.outlook.com (2603:10b6:a03:201::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.2; Wed, 7 Jan
 2026 20:15:58 +0000
Received: from DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a]) by DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a%5]) with mapi id 15.20.9478.004; Wed, 7 Jan 2026
 20:15:58 +0000
From: Zi Yan <ziy@nvidia.com>
To: Matthew Brost <matthew.brost@intel.com>
Cc: Matthew Wilcox <willy@infradead.org>,
 Francois Dugast <francois.dugast@intel.com>, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Andrew Morton <akpm@linux-foundation.org>,
 Balbir Singh <balbirs@nvidia.com>, linux-mm@kvack.org
Subject: Re: [PATCH 1/4] mm/migrate: Add migrate_device_split_page
Date: Wed, 07 Jan 2026 15:15:55 -0500
X-Mailer: MailMate (2.0r6290)
Message-ID: <F4103086-28F3-4D5B-B466-FF64ED11AA39@nvidia.com>
In-Reply-To: <aVx1ylEmJOfsrh98@lstrano-desk.jf.intel.com>
References: <20251216201206.1660899-1-francois.dugast@intel.com>
 <20251216201206.1660899-2-francois.dugast@intel.com>
 <aUHCZpnTNqv8wfdc@casper.infradead.org>
 <aUHRpvsa80wg04r7@lstrano-desk.jf.intel.com>
 <aVx1ylEmJOfsrh98@lstrano-desk.jf.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR13CA0192.namprd13.prod.outlook.com
 (2603:10b6:a03:2c3::17) To DS7PR12MB9473.namprd12.prod.outlook.com
 (2603:10b6:8:252::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR12MB9473:EE_|BY5PR12MB4177:EE_
X-MS-Office365-Filtering-Correlation-Id: 2724ee2c-b0b0-4877-cfd3-08de4e29921b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MkhlcDFSODB6NWFJZS8zSlZJZTlGMEhXLzN3RElYNHJGUUx3OU1OZzZXR1ZZ?=
 =?utf-8?B?Y3pBYS9vcmRNTmNuV0FiaXZFZkZCc0Q5UjBZbFgzbkU0djVEUlRiYXB3MVdH?=
 =?utf-8?B?bkthVE5CTTdrbXVRV2VkWmFPQmdUS2Z1a05SZVN2T0M0d3hCZE9PdnNNYjhI?=
 =?utf-8?B?U0tuTzZIRUx3c0VjYk5SRzNMTndVejZHUTY3VHJ3NVV3dHVVL0VHVU0vNHNv?=
 =?utf-8?B?VVRFMXEyK0NBMmMrWHQxeUNUeW9QZ1BNM2JZclI0SHIrQTNHM1JiZ0g2ZFBj?=
 =?utf-8?B?VEpkb3R0Tlc2aFNVd1EyUEdDUWxiRkorQ1JNWXIrWEpTVUlNTkZESTJWMCsz?=
 =?utf-8?B?bC9FaFdUQmZZdkFQVDg3WU4vbUVDc2hpdVVPMmFWaG1WQWlwS1plaHlmQ1dh?=
 =?utf-8?B?RlcxRnF3U3NqZnhJcDJzUEpVMmRvRDRtellYa2tDZHY3bU1qTVQwellUVENz?=
 =?utf-8?B?MTVUZ2pnUjYrcXhRc2ZaTHBMcWljY0pHQTBoejZwQ3FENGUyVlJxOUZEWHph?=
 =?utf-8?B?eXNBbHdCMjdLN24xR3RzcjdoSERVNUM3YWpRbGhvQU9WZFk4NFJ0Qm0wM1Rs?=
 =?utf-8?B?b1B2cUtoZVd4Q053QjZKdnAvSXBqTGprbnM1WDYrcnhtRElpdnNuZjkxU1Z1?=
 =?utf-8?B?OHRXUkRxWEVITXFnci9YZkw3WmROVDBjNWZaRk9WSE9Ld00zWjVOcWxsM2xR?=
 =?utf-8?B?SnFjQ0lmZEs0OFdVK1NWOHRQemJ2Nm8vS1ArMDNKZlR4UTNGcjNFZWJpTkY2?=
 =?utf-8?B?ak02d3E1VVNXek8waTUrN0NCOFNHSnJWWFNCUGhYMDdpMjhnelI4bkE5SHFs?=
 =?utf-8?B?a2NnQUR1V0xlRTlMRmJ6QUR2aWZ6djVjZzFTOVNCNlp0ZXZXU1BLSCtKa3lq?=
 =?utf-8?B?MUQ3ZXM4dlVLT1hJRkpQUWp2WmczR0hSWXc5WlpJMlA4dWZMMm9kaG14bFl5?=
 =?utf-8?B?cWhsekh0TUV3WGdkRkI5eGlaZm1qUnFaUmQ2N3R1MG1hYXZZNmYzdndQNVVk?=
 =?utf-8?B?M2VkZlF2ZkpvTmFYSmRmeVZkOVBVM2J6eW82WVMwU0dwVGl4RmlDV1I5ZUJ5?=
 =?utf-8?B?SWNoSWVCRVI1TUIvODNUZm1IZDBHZzFqR3VYNCtBb0MvRHRhVVJHWlNjZVNR?=
 =?utf-8?B?ZDFQNWNtdEVjTDQwa2JFdjdGdTBhaHFnWVBnUTdmdkM0K3liT0tSSVNNNVBt?=
 =?utf-8?B?QnNzYVVnN3hXMDZRWHZKcXY4eEt2R2xDenkzNFpHZkRXY1hURHUzcktsQVc3?=
 =?utf-8?B?emJ1ZStoelNwZnlJclVib1h3VVczNktXK1hUMjFMQzhyL1JhT2JNdG02S3NQ?=
 =?utf-8?B?Z3VyYWE2bStxSmlDVmRFR2lFL3dMRHBPanFBYWNEYUNtWEVqaU9lcHVkUWwy?=
 =?utf-8?B?QWFjd21qU0VUbmpabU5iSkcyVFRlS01HRnFDQnV3OUVZODUzSEJLaEFDWE9m?=
 =?utf-8?B?VEdyYkJWZlBtQnZ0dG5pOGxBK2p1Q2tybk1raURhcWMwNTBKcDBpNkQ1dTZw?=
 =?utf-8?B?dyt3ckFBRnBCSGg4Y1pDSWx6alFZRHRuYStxSmdDVWQrZ1pkamhSQjhPanBl?=
 =?utf-8?B?WE1MYnh5QUluRVVBOXN3bENEZkVwNTQ1ZDQ2OURaZ1dDUkFFZnprZGdabm01?=
 =?utf-8?B?cmJYc3ZOY2QwWVlDeWVieGx2TXlGWGVIekhYV0F4aDFIMXpSdG13TkJKNjY2?=
 =?utf-8?B?L0xpSSs0dUhtL1dmQWNQdEM5M0I4TmQzdkhRUmVnQWNzMXFCZzZqcEpBREVl?=
 =?utf-8?B?OExRcCswTldRbEkxbGVaRU1OS3J2WW54WkVNVk9Oc2V6cms0OEE4alFDUWRu?=
 =?utf-8?B?TjNaSmE5S0hzSk1RdWdkL3JQNUZqQ0s1V1UxRFJmcFo4TXlXS2ZnSmorUGlY?=
 =?utf-8?B?M253U05QSWJJc09jcDU1bjdnaTgrSlhURFB6cEQyNDY4NGdhWDB4bEVhNks3?=
 =?utf-8?Q?m4hyKQhNMnBu2A9mFasW1KOOS7ZFJQAc?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR12MB9473.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dGIydlh6UzVqdGlOMURWdFVCRzlEdFYvUjdXdkZ1VkJoLzFSZThQSjNEMGpw?=
 =?utf-8?B?YUFWWS82SDA1MjdtVTZSRkVxR3N5SDBGOWhLa0M3eEthZVdDWTZjcTBjZlpX?=
 =?utf-8?B?VHMvYkQwOUQ3UjgxMWdOb3kxaWIwa0o4U0U3RUhuYmJUQlBwcGExeEJSR05s?=
 =?utf-8?B?YXFOeDNPMCthRHVRd295cXAxSTRVVUFuNWJRb080alJPSTBLbVpxY1Fhd25p?=
 =?utf-8?B?RjN6SFhrOFZ4dHdoOXN3L2x4TEpYNGhnOTVza1lZL0FMckxFeG9QQXUyeW9u?=
 =?utf-8?B?RFcwUUhkODU4YU5IdHk0WXhaNUpvZVlxMktxRzY3aTZIVWIrYUxjNVA3T1p1?=
 =?utf-8?B?SWw2OXBJNWxwK0JUM29WelNmdjYwaHVIMmsrQU1FdlBDQ0w4QzJuQm9PSGE4?=
 =?utf-8?B?eCtoNDVsNllDclFzc0g0VkhkOEhielJsSFRlU2FwcUlMZTVLdWg4YW41NEhx?=
 =?utf-8?B?ZSsyZ0RENnJEKzAya3NyaEg4MVNqekNNZ3VOZE1xNEpKclZqQmI3YUhDRDR3?=
 =?utf-8?B?eFZnQkZhd3NtSEpTYmV1cDlFdE8vekxUMmJUOFNEUFh5dmhmU2xFeGU3QlM0?=
 =?utf-8?B?VWk1d3A3cWlDb1BIQmFkd1hSUkFNcVlPcXJiOEVUaDYzNS9YalRIdEE1TUVV?=
 =?utf-8?B?VGZ4S0tHKy9TVEFoSy83bzBBQnNrSlRaWVQ3WHJsZGxSOHBWanBMbUNPaEpY?=
 =?utf-8?B?VVhIQXJNcWJkaHB5dklyQkVNMnNMK2hMNXh3NHYzd0EzYTcxdVowV1k5RGg0?=
 =?utf-8?B?Vis2aFZUYzNvcHJOell2N3RySit3TmkwTE45RlQ3TFhlUkpBM2ZrV2tFYWlG?=
 =?utf-8?B?M2p0NWJON0R0OXI5NnEvMEtoZ0p6ZGJGdlMvL2czdUF6ODNoMU11NjRRbnMy?=
 =?utf-8?B?bEdEMFI1L3o0NEhKMXNaSmdnWnQ2MU9ZdW1xcFVNdTlBenpMQWxqa1ZLZUtV?=
 =?utf-8?B?OUxrVG5SYTBkVVVUMThqTmhrbnluUWZreTF3OXNhOGtMTVFzTG9pem5tekVh?=
 =?utf-8?B?VzcvMENydWVuSmdiZ3NZd1FOSHBDK0dxeTVNMk5vbTRHNnl3YUZXYU9mMWVX?=
 =?utf-8?B?NGozTGxsb3BYekdhbnU0RnRpNTNkbHpUT25aM25IR0d0cHFQZXFMcG1mT1JR?=
 =?utf-8?B?OEQrZ0t3Q3h4SmtsLzZsQzhzdVlGR3dHMk1kZGloWVRPMDhnUEJkVDI0V2Jt?=
 =?utf-8?B?WjVCYkhJdHVXak9JSU5PbnlJck5FTXJFTVFzRlQvQ0k4WStpeXhTaSs5Sm1K?=
 =?utf-8?B?OExTZzREVVp4Z1pKbERoRDhDY0cwZ3VqaEhjcm95WERQcGN1TFNHaWRKdFFR?=
 =?utf-8?B?VnFxK1duTVQ4UmZLTldLbkhGK2pubStwTWp2MkN1U0R1UXB6QndQeUNXc0VZ?=
 =?utf-8?B?RGgvNkcvWWErb2p1T0VXL1UwaUhZNU16bnZYS2FqY0VpTkZNZ09KUm8zZlZM?=
 =?utf-8?B?ZHJza200b0xoOERra0FqQ3ArV2s2cmYwdnZ0S2Q0TTBZVjJlODVLVFZpSzRj?=
 =?utf-8?B?U1JHS2Z4QlVGb0VvRGRKSnoxeDk1OWh3cnlWbGNJL1MrSUtNS2R0QVVnbGZ4?=
 =?utf-8?B?Rm1vc0dwQU1iY1huS2o4Yytoc3F3YWRzWXlSOXZWM3p4Vks4SEZnblB0MnZx?=
 =?utf-8?B?aFFiRzFzMEJIVzVXc25na2NDUmJIclZVanBoUU9CWGQ2cENlRXN5Yi8xeHJJ?=
 =?utf-8?B?d3pmRDJRMldJMVNSNXFkUW83UTdIM3JVZTZYaXBNZHdJRTg4VHRKTjZmQWcv?=
 =?utf-8?B?dldhdDB5V3dwK2hpN0Y1SUlPQ3Y0bmN4NDdTTzU5dUhxbTJySWJoK3Y1akF4?=
 =?utf-8?B?Y3lqVnNLZm03L0w2RWRZQWZ3bmNDRFhvT1RwaGF2WWl0Nmo2RmZqeU1tblVJ?=
 =?utf-8?B?MHMzUGJSZ1pha1hFTjhaOFZLd2dDRnpIRE14NFFHTWw2aTFldThFOEYwTmtj?=
 =?utf-8?B?TEQyN21JclJ0MTBBNlJXcTJUS0x2VU1nS3IzWTdyV09FQklsZC9ndUJ0V2hO?=
 =?utf-8?B?RFRLQml1T01HUGJjV1NMU2dja3I4QUpTWXNQUi9xdFVJNy8vbERpWHF1Szc2?=
 =?utf-8?B?OEcrRThJOVNWNVhQVWVsSjgzMEdZMzl0ZmUxeXEwTDJmekJmUlJqMEE2Unpr?=
 =?utf-8?B?NHVxZkJhTXBBblFkQndFVE5yNktNRTlERmx6bzlXeVZ2T1N1WkZTM05LVG9W?=
 =?utf-8?B?OUw1OUFtQVdwZWVxZVRFYUpNMFFjcjQwcVNLbnVMOC9QMWNrbnpweVArNWJY?=
 =?utf-8?B?Z0JwNFNxb3d4ZDk3K2pXWkwzRytKT09ua1Rpb2MxQnV2Zk51RnczSlIxYWQv?=
 =?utf-8?B?R0FLMEdoMDNLUEwvQmtORHNYT0NEUDNyaE1BbjlSWW4zekFrKzJiUT09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2724ee2c-b0b0-4877-cfd3-08de4e29921b
X-MS-Exchange-CrossTenant-AuthSource: DS7PR12MB9473.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jan 2026 20:15:58.6186 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 17OI9GnRr0qHcGFa8SDr5bTvegsOmlo+LwAGw3SQMjK8krTz6zhGyRuya1vLlNex
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4177
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

On 5 Jan 2026, at 21:39, Matthew Brost wrote:

> On Tue, Dec 16, 2025 at 01:39:50PM -0800, Matthew Brost wrote:
>> On Tue, Dec 16, 2025 at 08:34:46PM +0000, Matthew Wilcox wrote:
>>> On Tue, Dec 16, 2025 at 09:10:11PM +0100, Francois Dugast wrote:
>>>> +	ret = __split_unmapped_folio(folio, 0, page, NULL, NULL, SPLIT_TYPE_UNIFORM);
>>>
>>> We're trying to get rid of uniform splits.  Why do you need this to be
>>> uniform?
>
> I looked into this bit more - we do want a uniform split here. What we
> want is to split the THP into 512 4k pages here.
>
> Per the doc for __split_unmapped_folio:
>
> 3590  * @split_at: in buddy allocator like split, the folio containing @split_at
> 3591  *            will be split until its order becomes @new_order.
>
> I think this implies some of the pages may still be a higher order which
> is not desired behavior for this usage.

IIUC, this is because there is no mTHP support in device private folio yet
and device private folio can only be order-0 or order-9. But after adding
mTHP support, non uniform split should work, since as you said below,
only 4KB or 64KB is reallocated in CPU memory.

In terms of mTHP support in device private folio, how much effort will it
take? Maybe add a TODO in migrate_device_split_page(), saying move to
NON_UNIFORM when mTHP support is ready.

>
> Matt
>
>>
>> It’s very possible we’re doing this incorrectly due to a lack of core MM
>> experience. I believe Zi Yan suggested this approach (use
>> __split_unmapped_folio) a while back.
>>
>> Let me start by explaining what we’re trying to do and see if there’s a
>> better suggestion for how to accomplish it.
>>
>> Would SPLIT_TYPE_NON_UNIFORM split work here? Or do you have another
>> suggestion on how to split the folio aside from __split_unmapped_folio?
>>
>> This covers the case where a GPU device page was allocated as a THP
>> (e.g., we call zone_device_folio_init with an order of 9). Later, this
>> page is freed/unmapped and then reallocated for a CPU VMA that is
>> smaller than a THP (e.g., we’d allocate either 4KB or 64KB based on
>> CPU VMA size alignment). At this point, we need to split the device
>> folio so we can migrate data into 4KB device pages.
>>
>> Would SPLIT_TYPE_NON_UNIFORM work here? Or do you have another
>> suggestion for splitting the folio aside from __split_unmapped_folio?
>>
>> Matt


Best Regards,
Yan, Zi
