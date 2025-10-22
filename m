Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D1A0CBFD11B
	for <lists+dri-devel@lfdr.de>; Wed, 22 Oct 2025 18:13:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0CFE310E801;
	Wed, 22 Oct 2025 16:13:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="Zoy06Cpb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CY3PR05CU001.outbound.protection.outlook.com
 (mail-westcentralusazon11013030.outbound.protection.outlook.com
 [40.93.201.30])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 28CE310E7FA;
 Wed, 22 Oct 2025 16:13:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BXs4orEBjt3WuoP91DQzB+ED+T15FnMs0Ic1pmX0tjrylIbJAljHOR7ZaLwTcVIq0OOxtEsW3FngmtGv8q+wzNBwHbMSuBgfhbMgoZuNIpLoqz8YHE9f5c/dU9uHBn3Ry6ZyzKpO7ovxE8dHB+DDacwmrDrRy0i/u62UZiB0iD7JbwLxV+0BhH9d42vvuHKIk501WU91E7IpJVWcHfbmgFEVciFVsFJCCca/WN4qHw28CDNRnRSnNpbg+WujtGKDgC1PYwZcpfZTNkKOCK1MN7yCGt+IX5IAn/2Jk73SrRoO2SBy9fiEeEUzhCHRrNWeoyed2dLOuL9WMJlc63dZYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r5xbJCnXpHqUFMws0sX+FgdMhGE3RduIlSn31eklAck=;
 b=WM+rJTZ/lVQqhwos8tMZb1xGuUcFhbgIbTPT3EDMa3pwc2F7t3sya/MukouNLxdoAUQz66KuIXKz+v+umkkXk+1fpU6KB/bku/+gqli3t4gjjz1+CNtwIXZrgSY1ifNwtp3yNlgF1D477ongnP2VNfg6oFBsb38tPYEgVGxVdFd3kLoLkgS0M1UY3x9m/uMDCTdzRP9r+Od/pxJ5BhZEPLu8vuOGZa6eaEXEeqAKIgxu2h/d0OXhXRmfleuk3c/yCM8kj5TUTuSjnuWH5R8fMKv8Z2WAzcYzLShLtMrdAcMns3LldfhcPKKz2rMeNaOJEi/SVq5RtIMj5iQzf6ib9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r5xbJCnXpHqUFMws0sX+FgdMhGE3RduIlSn31eklAck=;
 b=Zoy06CpbbYDR6XIN+ClVp/LGBebLsEMLJkm+/u/FbQRS44iLVJMWUIpdoDTcyo+qCT4Rhl+2kDb2cDr4WBOb2/Fa0pRejNTG21ZYj/TTTEQifyfaSucNeQsKWQVFSSV29n5pjQ4sZ0eUZX6Imy+v+sFo/AWB7vUS1gc69XTy5F6oTsJoq8XDIVRf6/Mjg4EiCaPZDe4gNnUmrDUVDlWSbIZNfmaWXKv9Ba5NBHrKtDDLmF+WReReLA89nqYOuWp+qkZbqwwRbAReHppR3c+QJA5hzFpdDHtjHTVNJ7Wg2iK3ttkkchVoeC3koIPdoxJpftRBx5dgk7j46W/NGMDHyg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SN7PR12MB8059.namprd12.prod.outlook.com (2603:10b6:806:32b::7)
 by CH2PR12MB4279.namprd12.prod.outlook.com (2603:10b6:610:af::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.17; Wed, 22 Oct
 2025 16:12:57 +0000
Received: from SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91]) by SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91%2]) with mapi id 15.20.9228.015; Wed, 22 Oct 2025
 16:12:57 +0000
Message-ID: <04d39182-80ca-4656-aded-2a83353aef85@nvidia.com>
Date: Wed, 22 Oct 2025 12:12:54 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] gpu: nova-core: bitfield: simplify condition
To: Alexandre Courbot <acourbot@nvidia.com>,
 Danilo Krummrich <dakr@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Edwin Peer <epeer@nvidia.com>
Cc: John Hubbard <jhubbard@nvidia.com>, Alistair Popple <apopple@nvidia.com>, 
 Timur Tabi <ttabi@nvidia.com>, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org
References: <20251022-nova-bitfield-v1-0-73bc0988667b@nvidia.com>
 <20251022-nova-bitfield-v1-1-73bc0988667b@nvidia.com>
Content-Language: en-US
From: Joel Fernandes <joelagnelf@nvidia.com>
In-Reply-To: <20251022-nova-bitfield-v1-1-73bc0988667b@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR03CA0067.namprd03.prod.outlook.com
 (2603:10b6:a03:331::12) To SN7PR12MB8059.namprd12.prod.outlook.com
 (2603:10b6:806:32b::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR12MB8059:EE_|CH2PR12MB4279:EE_
X-MS-Office365-Filtering-Correlation-Id: 1c3ce4a9-c185-4a2f-e862-08de1185dd59
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?T0M0OWRMZFVWbEowTDBWMzBGZmNyb01lVWgzNDE1Z0hSajZTbFpJVGx5WXJN?=
 =?utf-8?B?Z0NUZHlmeTRlNTZuSUtUUGJhT1VsWHNlS25QUnVwUDhLYTBVSW1uYXd3Y05V?=
 =?utf-8?B?ckV0T01NYUNjRFRQVUxwVUpxM0VKQmhPYTFkbWJXa1M3T1V5TXBHQ0JVYkk0?=
 =?utf-8?B?UDRQdEJHdkpIeFRTSGxZV2JzUG1acFdMNVZsNm43WXJLOGlzbkltK0tnYXFs?=
 =?utf-8?B?Y0NZRUFzSHpHZDJ6UDI2WFJGK0lMSjdiSkkxVFZsYWo2NzlhYjd0bDVoUUVN?=
 =?utf-8?B?NElIQy8vc1JkeWxqUnA4bnVDczExeStDY1hlbVYvZVkwcmVqTlE5RzB6cVFh?=
 =?utf-8?B?ZzNsU2Jsb1NmS3kyUDE5ekJrZHBjWmRLUmxzdUlxT3JJVkY1ZENiYjZDQkxN?=
 =?utf-8?B?SFBrRzIyQjBKZjZpOE5MOUw2VlpjUG81b3NZVk1SeFhXb29yWWVUcXRDTWgy?=
 =?utf-8?B?c3g0WVZVMFZDWWFkUjJzVTZmYkdYdnpPYlFwSHJTelRpN280MEZUQ0VFMG5L?=
 =?utf-8?B?ZTNmUjRrUHdPa24vbWRpTUxLczdCeHh0QXd0Y2ZWdi9nT3hQQStiOFRHSDND?=
 =?utf-8?B?TEIxUDJTeVR1UlZsN0hORGJDWGRDMGJFQlNVOHRURFY2S2ZpY2F4MlFyL1dG?=
 =?utf-8?B?QnI3TEo3cWFuamlFbjk4OUFQNHdOaFpLSTZYSmtjdlpScm5SUURPUGZJeHNv?=
 =?utf-8?B?MnNUQmhKZm1naXBpbGhicm9KSnlCeFVISUptM1RMcmkzNkVWb09HcmJ1YVRV?=
 =?utf-8?B?RlNJR3crbnRFMWo3Wm53WG9DR213SjhBS2NWQ1VBYU9NMzR5cjNOSXhHS0w3?=
 =?utf-8?B?eVZjNXlXYldJKzNHbXB3R3c4a3lodmI3emRCcThUcGc1MGJUTGtHVkRwWFFI?=
 =?utf-8?B?dTk4Mnp2c2RXNU9kcU9nOWJPVFdlN1JRbzRZaTJYL1ZFNUoydlROc1E3ekZP?=
 =?utf-8?B?emNHcmx4SmphbUxha082Zk9VZE1wd0xKYi9UZnZlQUdSM1YzZE9VTWE0R2NC?=
 =?utf-8?B?MmNLc3BWMjFhSmhLWng5VTY3Q0ZNWUVIUnl3QnBnR0FQaStPU3ZVWXIrdEtE?=
 =?utf-8?B?NjhtelVDcTFWUSt3YTRXRitmWUcrVFdrMzNta1dJR0JMZkN3Zk5BUERabUFl?=
 =?utf-8?B?blVkMWUxQ2xlU2JOK3RsNkNRMWRjbmpPWlZlV3M0RjliczRMZ3BtQmwyMkdE?=
 =?utf-8?B?cWc5UUVEaG0rMkdCUHlCZ0NDY3RzYm9ZamFpNUtNTTFLVmErdnZWUVFweWVi?=
 =?utf-8?B?ZGhQaW5PNERoazNOcCtoN0prb2VwdHBlR3BzL1N4aWlhalRLeFFQYTFUUWZY?=
 =?utf-8?B?ZWREa05mWkE2TDhjYlNqRkk5NWpiZTd2NytOR0RqOFNZSFB2REpzVGxYY2pa?=
 =?utf-8?B?Zm1nL0hhaXJ4MHZDcEx5VEZPcTk3SEFTUTI5WjN2QmtCeHd6Z2dPMk9FM1hr?=
 =?utf-8?B?SnJUQVdKVERZOGlRNFJXd29hbU5MYkplNzc2SWNqN2xlTnErdzBhZStHK2Jw?=
 =?utf-8?B?a2RzWSswbmZua1Zwd2JRejRNR3l0V3ZOSU9SeUtNbnNleXZFUmZsU3JBa0dr?=
 =?utf-8?B?Y2g4VkpZZWdZdlJOVnZCY0ZJcnZxZk8rQ3puclBzYmhRMlc0cXdjdGladXI0?=
 =?utf-8?B?UHl5Vk16ajFHRkZHTFZiUHBEdjVNNXhKMUxEUUh6eWsvYkZpSjRwcVAraGNw?=
 =?utf-8?B?SHZiTXdnc0Uxc29rWWRtTy9xL2RxTHdpL29EZFoxay9LUjZsalNZU3hUa1d1?=
 =?utf-8?B?Z1k1SDJLUGcxd21OYm8xTHVoRC9HQ2lXZnZ0VGNFd2ppSkUvS2NrQmFMSkcr?=
 =?utf-8?B?MDhJeVE4VHVNYjRKa0l6eS9mLy85Y1JHamVUZDFOR3BxRG9EVXNGVUl1SU1G?=
 =?utf-8?B?T2Y0TUd2UUNqZURZRmhMWG9ZYmRHbzJ1K2FRbkFnR1ZVK2Ezd0FPUkw5Q2c4?=
 =?utf-8?B?YmpIWVc2emJheEVxRGxHWkxzUjFMMzRxSU96dmRlTGlyMCtDcmdwcU9FNm5l?=
 =?utf-8?B?Z05tS2hEeHV3PT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR12MB8059.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?V1N0SUpINllhT0tGcW5RaGJqSk50cWxwQTB0Q3R5bnZXd2t6bCtKaVdGYWlL?=
 =?utf-8?B?NGNNWjRPc3FGSVU0eFlkQ255VkZRK3NzSXVkNTF6SU5Ua29kRmM4eUp2eGNx?=
 =?utf-8?B?WURFWi9CdnhVVFhPQlVzcFdzYXZZK0JicjMvUFdyMGdTWS91RWtRakE5SDV4?=
 =?utf-8?B?YmpYUkNJenkwU2I4c2Vtb0pGZ1ZLNmJIVXhGcXJKV3pMNGpSRzlYRWNTVDU1?=
 =?utf-8?B?dzNqR1F3QUpaNGRpcTdvSWUwZUVjb2gzU1ovOXZCd1V0aUtrRFdRSXI0WWw4?=
 =?utf-8?B?T0lRYWVaclk0ZjVDUFQvTVBJNkd5QlFlcXhES3QvY1VGa2lxbloyckc1QmMz?=
 =?utf-8?B?eGJtTVhzQVBzemNselpKSWo3MEJxdzZkWWx6SzBUYnExUzM3QnZMd1FiRmpP?=
 =?utf-8?B?U1lHWFdXb1MxZGRabHg3dVFQTVYzUjgzb0pyZzZCUDJOcktHYmFBTnpTNUZW?=
 =?utf-8?B?MnZCMDl6WXRHR2pxZjBhOG52aWJheXh2UmFreDRVbm5UanZBVFhMTTRKN0FL?=
 =?utf-8?B?b1pIeVhKa0NqTVlVSFEvUGFRd21ZbHNHY3FnRURuMWJGb0xlaHdGTllVZWI1?=
 =?utf-8?B?bTRJNUczL2M5M01iZ2RzOHJXYWdaTHc1eTBXdS9hNkw5ZWM2MVhPOUxlZHN4?=
 =?utf-8?B?NjErcDVIM3RZNklTTHNEZ3JRSUJtUUFuSXNyby9rM2tBQlM2a05LeXpWV252?=
 =?utf-8?B?Uyt4TzFndzBKVGNMaVAzS0RNTit2aUtrb0prVnY0YXBQa1g2UnBlejdIbFhE?=
 =?utf-8?B?TG0rWElNZlh6UlJ0VWRaZlorcUtBNWJyTEplTlk0bEM0YmFVSDNZZXZDT0Z0?=
 =?utf-8?B?NnZkYjBuUDhibSsxZXZBWUgzRk5aWTY1L1NuM3plVGZDOWt3bW0ySXFJRW0y?=
 =?utf-8?B?dzcrNFVTdkF6U3F6b0xWeUZ5NUZ4YTkvSmlsR1lRMys2L0M5Q1B3VkVoSzRD?=
 =?utf-8?B?QnJtcUIzZWNNZE9IUTdCT0NsYzRtdi9zZXozZ1VIaXhiY0NjY2loQ2xjRTZt?=
 =?utf-8?B?aUIvcFZSUU0wNnNRQVBwWUFQUVZxZ3ZocmM2cWdqSzZ6elJNNGtPZVlxUlJS?=
 =?utf-8?B?WU51amtBUGpraDhpZm9WaW9hN2c4bDFNNnpkQXNYNndvQm1wbCtpQjJsMHBm?=
 =?utf-8?B?R1RvcDQ1aWVGQXlPaDEzR3NaTzVrZURmdmRVWDN6Z2svWXFvK21BcHhtVlds?=
 =?utf-8?B?dVdkNEI0ejZxckxHaytydElublpIaTdPSERIOWh5SVE3NmdqSHl4eUU0NktX?=
 =?utf-8?B?czQ4VXMzSklPY3c0SkZYWGNOZFM3azJISVhuMnFTMjR5RTN2cGg5VnQ0cEdv?=
 =?utf-8?B?Wm5pSEJSakVxZlc2eDIyU1M3NWoxVmZKQkNWSGcyZm13blZMRXdKYThRZkNJ?=
 =?utf-8?B?QUhCVzBoR3ZsWVV2b1pjcmFxQVlGZEx3YWJmVTFvK3AzSTBRek1wUlhzTjl2?=
 =?utf-8?B?Mmg0UzZ3Qzg0Q3RnN0p6cDJrWVV2cGpudVRmeVhNSVV3MTE1ZWV3cXJKV3FO?=
 =?utf-8?B?N1pPK2xyTEhQNXRXUUgraTM5N1ludDcxbHl1K2lBK3h6azNVM1Mwa0duU29a?=
 =?utf-8?B?OThVQjRQNktvU0FXNlNDQ0JlSnZ0T0tLNFQrRk5DcVR2aWpZKzVycGlKMDdG?=
 =?utf-8?B?UkluaWNHSmhINGUwWDVoSXJBVXdRS0dpdmZndE9QaTE3ODNHZU45QlVYUktH?=
 =?utf-8?B?aFovSmdFNXd3NXFocHZ4alNZQ3pORURCU0R3ZWM2VVpHOG9uZVdpMUdRVHh2?=
 =?utf-8?B?a0lUTGcvbkIrcGFOZ2ZUSHp0TFlWeXUyVEVEODAzVFpiR1pHT1V6L1lGTXRy?=
 =?utf-8?B?enErWFdCT3h6clB6TjZpVXVrc29KY21JRmxPbkxUa0dvK1VvYTNOTTJjTWZa?=
 =?utf-8?B?VkprdGhnUTZ6V2NjSDRIWEpCMGszUEVCZmVzazMvN3FqQ1p5SWhxYjFZVFdl?=
 =?utf-8?B?VGVtRWdVbVNpZ2xXVFA4VkE3WEdKeG9XWEs5bFJaeCtyWitHY1lERk5rR1Zy?=
 =?utf-8?B?dnRsMUxkZXpNOTZWMjg4aTZrZWtvU1FjVS9Xa205Z2pRN2pxenRLTm92ZG9M?=
 =?utf-8?B?ZWpkb0J0dDVsU0dXMG1pUzRDUTE2ZmR4SkdRMWJmMGUyb0FobFVxa2dSTkVo?=
 =?utf-8?B?MGwwQzBTcDZaWmRSNkpDendTc2FJQmpiYnRTVFVRUWRPbmNHQlNOT0pNMlJ6?=
 =?utf-8?B?MHc9PQ==?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1c3ce4a9-c185-4a2f-e862-08de1185dd59
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB8059.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Oct 2025 16:12:57.6892 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5Om+rE4kt8LyAoFtBqzoPSH6lVH2SJSY7XR0U7xwZlCIy5ndROpyCkT/VKO/c0MXEESf/MSr2kXX4tu01evrCw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4279
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



On 10/22/2025 6:50 AM, Alexandre Courbot wrote:
> This condition was uselessly convoluted.
> 
> Reported-by: Edwin Peer <epeer@nvidia.com>
> Link: https://lore.kernel.org/rust-for-linux/F3853912-2C1C-4F9B-89B0-3168689F35B3@nvidia.com/
> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>


Reviewed-by: Joel Fernandes <joelagnelf@nvidia.com>

Thanks.



> ---
>  drivers/gpu/nova-core/bitfield.rs | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/nova-core/bitfield.rs b/drivers/gpu/nova-core/bitfield.rs
> index 25579b4c328f..136de7289162 100644
> --- a/drivers/gpu/nova-core/bitfield.rs
> +++ b/drivers/gpu/nova-core/bitfield.rs
> @@ -203,7 +203,7 @@ impl $name {
>      ) => {
>          bitfield!(
>              @leaf_accessor $vis $name $storage, $hi:$lo $field
> -            { |f| <$into_type>::from(if f != 0 { true } else { false }) }
> +            { |f| <$into_type>::from(f != 0) }
>              bool $into_type => $into_type $(, $comment)?;
>          );
>      };
> 

