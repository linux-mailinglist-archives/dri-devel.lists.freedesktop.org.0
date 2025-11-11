Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EFEDC50082
	for <lists+dri-devel@lfdr.de>; Wed, 12 Nov 2025 00:03:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6258110E58B;
	Tue, 11 Nov 2025 23:03:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="SkvmLeKC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CY7PR03CU001.outbound.protection.outlook.com
 (mail-westcentralusazon11010013.outbound.protection.outlook.com
 [40.93.198.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 07D0E10E58B;
 Tue, 11 Nov 2025 23:03:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RfL74D/jbq+q0JuLQ5aBTDG1j8kHTyV7YgyK0sMYMO/8ab0UsIV2qK1juPYxyB36/2Jx5F/tKg42rkRAkw82PjVbhqFol45Hrqkoe6TYx5JiP1ZNQYLdQqXbMGwU4eG20vlGeEltxDnC9vKJLTi0MQ6XfpVCExZIFu/ksjQL7IQtvrGOegKmIYbErRoe0Ja7/Nib5IDKqQZ6pdlarwItY32dNkm4OiXQVY0xIjuIcTUhelrL2MhrfOzUGtWqOA/WYIuhEqkySi0FWMT9p+5weafvJcE08WnxecW58jf9pCvLoRh/OQN2swGOFrbsBFyQmxHdzl+ANjzNDHS6/X2gfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=o4RNJVTg58Lg3vF0bGgVh1ecHX5/n85/cXyA6INkqGQ=;
 b=V/7+gqh9UBCAHZ4PU92tOw9iN0yGnnlfSNM86yejataZb8Qoiz70XOPKHaiHniARDPnQpWc7nPzfw8WXwSBH2VX2EX8rNRBif3MpA0U/gwMMwRF0gbZRfAFVOhYRssF3WKNBB/UuZIJic77teuFtIvz5Wx6ahNvrgC7c6tSvJVK7SKI2z3G3wnk14m3fLYbZBCRczhOKTviOHtSH+8Eg8QGi/zE36fyQbC0ePEW55i68xxd3+wGBgeBemlEudzg+dN2mdStKV66+Tukdeh+GdZ8Thn39dyCWlwoDlHM75qJHoZYXjhcF2y9/7UzU2rJncQz5U6CaYAxAw8QyQppMUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o4RNJVTg58Lg3vF0bGgVh1ecHX5/n85/cXyA6INkqGQ=;
 b=SkvmLeKCqKvUQjq/zauK1tWDIZ5ATOJPexggqZrKst1MZODByKMb21slxLqRcuFfkKbsvm0nCPfzltsucRtT+0TpTgKzUQpAeN1fEPhkZD+pC8LqLIU8L3J9aW7SQ80JNxrKf6kvQuXyUfde6TMeLdR14hKfScW/dlWwTLrJJWItTiwFNGWPWpO8Qd9qyF4bRs4Yv3/DDXd0FXmptLuWEBtZWqdTFZ8iaZ+BC2LrYeUzmV/nb4wdcpKhJqvehSMmTTa3RHMYrii0rMTT+aauWCk/ZuTQff5y/0/GXoUwfOfz6nLsYpUh1TaEc5CJIVB97/3QMrS8abarST287fN8sg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SN7PR12MB8059.namprd12.prod.outlook.com (2603:10b6:806:32b::7)
 by CH3PR12MB9099.namprd12.prod.outlook.com (2603:10b6:610:1a5::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.15; Tue, 11 Nov
 2025 23:03:00 +0000
Received: from SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91]) by SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91%2]) with mapi id 15.20.9298.015; Tue, 11 Nov 2025
 23:02:59 +0000
Message-ID: <0181a17f-5773-4cf0-9473-7d4ee9122105@nvidia.com>
Date: Tue, 11 Nov 2025 18:02:57 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 07/12] nova-core: Implement the GSP sequencer
To: Alexandre Courbot <acourbot@nvidia.com>, linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org, dri-devel@lists.freedesktop.org,
 dakr@kernel.org
Cc: Alistair Popple <apopple@nvidia.com>, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>, bjorn3_gh@protonmail.com,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 John Hubbard <jhubbard@nvidia.com>, Timur Tabi <ttabi@nvidia.com>,
 joel@joelfernandes.org, nouveau@lists.freedesktop.org,
 Nouveau <nouveau-bounces@lists.freedesktop.org>
References: <20251102235920.3784592-1-joelagnelf@nvidia.com>
 <20251102235920.3784592-8-joelagnelf@nvidia.com>
 <DE5256UCJHXU.27RS8A445Z1XN@nvidia.com>
Content-Language: en-US
From: Joel Fernandes <joelagnelf@nvidia.com>
In-Reply-To: <DE5256UCJHXU.27RS8A445Z1XN@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BL1PR13CA0231.namprd13.prod.outlook.com
 (2603:10b6:208:2bf::26) To SN7PR12MB8059.namprd12.prod.outlook.com
 (2603:10b6:806:32b::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR12MB8059:EE_|CH3PR12MB9099:EE_
X-MS-Office365-Filtering-Correlation-Id: ca0896db-824d-4171-24b0-08de2176757c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|7416014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?OEtycU1RYkZnNzEyaG5PRmtwUGZQUi8yVmV1a3YxSW5RMm5zQUtLVmp1T1dv?=
 =?utf-8?B?dnZPa202TVE2VmNwLzhHeW9Hc2tXcjRQQ0NydEtUb3Q3Q2ZKS3o3dXFTL1M3?=
 =?utf-8?B?WVN2aUxyZk5SUVhheFNRcUtVS0VLRnFvMndkZ0cvZDNTekhick9tay9LRE5w?=
 =?utf-8?B?S2M3ZWVya3RCeUhQMVRDUW8vTURRM3daOFI4Zk9RamQybzB4WTh2dmk4enZl?=
 =?utf-8?B?RTdWV29kSEJqdjRvcHVFeFVjbGYzaHp5Z25GVVF0d2lwY3h3SVpad2EvUzRD?=
 =?utf-8?B?RWtrN1VzYnVTTU1tVDh3Y0hxWmJKeFRNaTl4S0VnT01uVmltU29tZHZhejAy?=
 =?utf-8?B?d3lrTFdEWjI2amxnc1AvTFltbzZKNEN0U3pCWFJIb2JXS1JORlBpck9abTFk?=
 =?utf-8?B?RFpRWlJoYTlGaXZxWit3alRmb25SaEpPbDErM0M5T0RHcVNFMFdtVml0ejhH?=
 =?utf-8?B?QWl5cXk4R2U1NnBGeXhNYXQ3YWo5Slg5b2NMdFFISENPbkMrL0pzcURyOHFl?=
 =?utf-8?B?YVl1ZHdOa0xnZkJ5OHp0WHBGSi9JR1VZZ04wcWUrRCsyOXNJTEpab0RORk5F?=
 =?utf-8?B?NGt3MEwvUTVFVUYrSUdIRjBBRVNIbzNYc3EyU1dXWDRYY2JtTkV0UVl1NTll?=
 =?utf-8?B?MUVGblpkVFBwSTdsV1o1Unl6eHNCMGpRcVc3V2d4N29GL2pjbFJGTS9IQ24x?=
 =?utf-8?B?dEkxZzgzRkFkOHBjWUhEQ1UrTzA4dmdtckR0b0ExOVlMNzJ3aCtxR28zd0Vj?=
 =?utf-8?B?N1h2dUJGYWpKeWNDSUlkaTJjc1ZSNUtGcmZ3L3ZscDNFTGc2V0RvTmNadjQ5?=
 =?utf-8?B?TnR0dnIybTd3eTRnUUlYNjJuUnNidVZucmM4Lzh4MnRYdDBINGZXd1FMSmhM?=
 =?utf-8?B?WnViQ1dKR25OUGhHcFdzV2d5dWNabzZ2dWlRdERiZVQ0QWJxczNzTjFuM3M3?=
 =?utf-8?B?Z2FsZlJyZ3FrNTNZcnlGTEFveXZZU1Zsb0IwV0hYQ3hyOGNLRWNPeStIS28z?=
 =?utf-8?B?R1pxR2FEZ2lISk1heGpqdXBUU1YxNGo4bGRXT2ZkWEF6R2w5Z3JDSWROQUdT?=
 =?utf-8?B?ZlRnSEU1bnRZcklHVkJ6cFNZdFdRa0M1bTMrNmlZS0N6R2w4cHBKTlpXZmcw?=
 =?utf-8?B?RVJncnc4VEFvN0daeE9DaGxnQldvSlFVN0ZTckd3QmZ0dTRHN1A5a3hPT3Zv?=
 =?utf-8?B?ZzFiSGhLd1UyOGhyVkk4TjVtUkMyb1lxakdlNjMwdmJXclduNCt0ODJGWWtk?=
 =?utf-8?B?NnY3bVNLT0s1Z3VIL1Fra3NYd2lsQWV2SDREVmtWK0lYVE5wVmQ5S0o2M3pX?=
 =?utf-8?B?R0h0b1FuRTdXdGhhazZXYTRESW5Cbm5qQXhOaWFweFB5VUdNQ09HdEprcHUz?=
 =?utf-8?B?MTlpckhUSWlndWlkOVNja2NQeWpzcHBSYkpLUGQrTzZNMWhXdWFZczVDU0NF?=
 =?utf-8?B?dU9YUERmU3F2MmR2TzhLNlhoUnJlcExUSmNaSkdRd25aZEp2bTIrbUFSSlNr?=
 =?utf-8?B?bVNUV1ppMVQzY3l2TXB2M0JYWHV3ZUdPcHVEKzRRMG8reHlyYUtHdFc4Sy9a?=
 =?utf-8?B?L0hrUkpaVTU0dXJJMExDZTFzZ3FUSkRUWmRsSHUvMGViRlZUR3FiTUxXTlpl?=
 =?utf-8?B?dzZVVG1zMjdkN2JDdUJPdzkzZHFjMUppaGRWSGVjQ0xBaHlGMCtuRzZscGhU?=
 =?utf-8?B?eks1MTFKQnJiRGR0czlxT0Z3NFBwNDM2RXhYejNUMGdVWW4wLzBpRjNyaVp4?=
 =?utf-8?B?L3h6NEh2eG1TRGlTRTFEY0l5cVJ0d0hNTDM3UDJQcGdOaE5FeGJSTDVMMm96?=
 =?utf-8?B?R3ljYXlRcTVad0tza0hIU1BVdmNRRTJwUnhDa1ZNM09ZY0VpRCtCdjVob3NQ?=
 =?utf-8?B?eU1oVkg3TnVNcnNjWXBxQUdBSGpEdjdtWUlsZSttWGdZUGwxZ3ZyWnlaRlVL?=
 =?utf-8?Q?aIj7TpHLg3iCdTsOvsQxP2P9hvSGdm45?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR12MB8059.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(7416014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TmhWVkpvZ2FpQk0rbVVLa2l6T2dJSEVJYXp3VmZnRk0rNXlXQ01YZlNkMUNY?=
 =?utf-8?B?RUZYSlNHT0FCME5ZaFpNQ0oyWklyTitDUXNSaGw1UmtiRDhuOFpOVHE5aVY5?=
 =?utf-8?B?Ulhtc3lZeWNoUzNxQTJNWE50NkJmK0VkNE50cGpWa1krVmtKalpmK1NuaWR0?=
 =?utf-8?B?UVY2NEdseWpxTUwxdlRBcEkrUkgwNmFEVHV0Y1VYa1lsTUloWFNOSUxIVXdE?=
 =?utf-8?B?NElhbmRHZ0h1QTJtVmZMQllFaFNnL2JwR2wrOCtGRUxiakEwZ3dmV3JRc3Uy?=
 =?utf-8?B?SklqM0VHd0RDT3BZYWFzSWZxbVArWTRGUVFpbVJnUHhNZkNwUGhQZXpUcmZa?=
 =?utf-8?B?dGtFdGJreFpNTXZCZnkzQ1lwWlYwNDdQTDJWSjdHYkdFWWtnT0wySkV5WG5F?=
 =?utf-8?B?b3RrR3ZmdjNhazNDK2p1cEg2cGZoR3RVTFczZXpRc1pPYXhTWlJJVEczRm1k?=
 =?utf-8?B?QllSSmgrT2VKRzM2Tm5lYlpNZFNZb3JpTldxRkdRRFhuSndvb2dUS0M4Z1BB?=
 =?utf-8?B?SlY5T054TUREdHFsN2xWWUJjNXZzdGlVOHZkc1dEZ0RtT2tLRkVLYzF6ZW4x?=
 =?utf-8?B?TnQrYmxGaWN5WTkwcis5THNudDNjM0JoRS81cEFXamdET0VrVDZWZmJEUWFt?=
 =?utf-8?B?VnBEZU9mVTJGcHV4L2duOW9HR1UrRWdIN21jMGU3NjdzVlorVGRucTVtQ3d5?=
 =?utf-8?B?ZVoxQ1VOWk54RTEzdjFoejFHM3JFYkt5WGUwOHdObVpNRmVYWTVxWjFtRHZk?=
 =?utf-8?B?Szd4M1l4ZUJxOWcyb3dDOThWR3VTeFBySnBZaVJUUFZaWCtKa04vcnNBelJ3?=
 =?utf-8?B?RGkySERGb1U5MnNsZFNYMzA2SHpCRjZ5Y1IxVllibWUyYUd0SGRxS2s4OEI4?=
 =?utf-8?B?ZWRZbGFsa2V6QXBobGdOb2NoNFIvU1NUN0lEdDFGTVFPRngzYm1tUnBZTjho?=
 =?utf-8?B?R0x3RS9ib0hxTmpRYSsyaEI5dVdmYTZTeFFUbDFYTDUyRlVSeHB6N2hKQ0dG?=
 =?utf-8?B?VmMwOVRmb2FXNEcwYXowNW93Z0ZpZmdRUnhUaW9vK3pEUGtZMkl1ajlFaDZo?=
 =?utf-8?B?MzUrTGJtYmRWQ2dpZEhzanBKcHRrNjl2VlVBNm93QXJ5YVAvQ1kyMjl0RmhF?=
 =?utf-8?B?VExXWnZDaHlMRXJreGlNeFkxL2FKWWtaQXBWL1dERDcvTkFlanZIY0dhTXBj?=
 =?utf-8?B?a0ZZMk4xVmQwMXRsak5QcFQ1b3JPRUthL1FaTnYwWi9qUlZhSE5GTzVGenpM?=
 =?utf-8?B?bTFlUnBqUXFGWDdtVlNYRFdsdlhaSkZ5YVlHcmtBZnU4TFh1TW0wUDhZT25R?=
 =?utf-8?B?Qko3eGRMazJBTWgzYzlDSzNuYkVEZ3JXR0k2OThWQ2N0WFRpOVhvckt2aDJl?=
 =?utf-8?B?YVRvcXB2WnkrSEFCY3kzZUNXcEFTKzFqRzArb09Ed0VRcUFpeGZ6aGMrdVBP?=
 =?utf-8?B?elZROXk4SzA2ZEdpWXNyaXpMc3F2TDIrTXE2YXozUUdFVDJhSGxOL3g5VzhZ?=
 =?utf-8?B?ZnJiaDFyRGlCdzRhUS9ubEMrY2dkMzNCV3ZlbFByQ05HdUxVNHRVZmF1cHh1?=
 =?utf-8?B?dXFHVXJlRDgxaTZqZnVTWVk0RDRXMEJ4bzlMc2srS1M0b0pxK2owblljeXhJ?=
 =?utf-8?B?bDlIejJzTFo3cmRJZGNEdy9mRi9pSkhLWmZmMk96SmtaNnlRejhKLzkxWE5Z?=
 =?utf-8?B?SVBOTXR0a0dGRFZORzNxelJpbVVUQWVWQlFIS05lZXo2S0JoRjZJcG1LWXRn?=
 =?utf-8?B?MWFiMHA1YzA5cjJhcEI1VG9JSldQVllYNGNXUTJlNjJ6ZkcrcnlNTmUzeTBR?=
 =?utf-8?B?aGJSMDIvUDlheXBjTEVaUERZdjN5SVFMc3FJQ3RMeWQwb1o3V2d1akEzemZS?=
 =?utf-8?B?eGxoMkJoSkw2RzBBMmRNTHJ3VStnUHM2em1lSnkwOTNObjV0UWhzMnJQOUJS?=
 =?utf-8?B?dUlhYkt6Z2s5cEsxelF3c0JaQm9TYVpnbSswUzhpS0gxYzc1MnF1MUwzaWJR?=
 =?utf-8?B?ZmlWSElNUFl6a2NDK1lPUDJQYURQUXZPYTRzdmpRL1ZwOFN1dDU0eDVYdXhj?=
 =?utf-8?B?L1B6WGFnUWxBVWdKN0wrLzlvU3ZlRkRkWmc2amJaajNIUGk2VVN3TDBqVVNi?=
 =?utf-8?Q?n6KaDgCY8QAzVoQQpuTK1jFy+?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ca0896db-824d-4171-24b0-08de2176757c
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB8059.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2025 23:02:59.6194 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: blnJfgPriGq/RIG5FpEOzH5mFYGwB1Li8d4it4tEl25Qytj5Y8B1vg/k+W7mC+VuP3wgn2B6nolMyrGVqojV7A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB9099
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

On 11/10/2025 8:43 AM, Alexandre Courbot wrote:
[..]
> 
>> +            |cmd| {
>> +                self.current_offset += cmd.size_bytes();
>> +                self.cmds_processed += 1;
>> +                Some(Ok(cmd))
>> +            },
>> +        )
>> +    }
>> +}
>> +
>> +impl<'a, 'b> IntoIterator for &'b GspSequencer<'a> {
>> +    type Item = Result<GspSeqCmd>;
>> +    type IntoIter = GspSeqIter<'b>;
>> +
>> +    fn into_iter(self) -> Self::IntoIter {
>> +        let cmd_data = &self.seq_info.cmd_data[..];
>> +
>> +        GspSeqIter {
>> +            cmd_data,
>> +            current_offset: 0,
>> +            total_cmds: self.seq_info.info.cmdIndex,
>> +            cmds_processed: 0,
>> +            dev: self.dev,
>> +        }
>> +    }
>> +}
> 
> You can do without this implementation by just having an `iter` method
> returning the iterator where appropriate (in the current version this
> would be `GspSequencer`, but I suggest moving that to the
> `GspSequencerInfo/GspSequence`).
> 

If I do that, it becomes ugly on the caller side.

Caller side becomes:
for cmd_result in sequencer.seq_info.iter(&sequencer.dev) {
 ..
}

instead of the current:
for cmd_result in sequencer {
 ..
}

Does it work for you if I remove IntoIterator and just have GspSequencer::iter()
return the iterator?

Then the caller becomes:

for cmd_result in sequencer.iter() {
 ..
}

Although I think IntoIterator makes a lot of sense here too, and there are other
usages of it in rust kernel code. But the sequencer.iter() would work for me.

Thanks.

