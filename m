Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (unknown [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C6882C4FEC6
	for <lists+dri-devel@lfdr.de>; Tue, 11 Nov 2025 22:52:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6CC2A10E65F;
	Tue, 11 Nov 2025 21:52:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="NP9YcSBq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PH8PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11012055.outbound.protection.outlook.com [40.107.209.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D40C110E65F;
 Tue, 11 Nov 2025 21:52:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=H6mnuvL/I3nHI/iBevaMm14hJiJIitGOeRA3r8bUf24rrJk/rNDiFh58SXCG463xqeE0r9El9leIxSHQhGT92xuW+PqlOq1GTDaSERK8iYxkMEYhlvTJR+nlAQOouBsN3uQNpHmgwIiCDF15Xm9eRzrC06FdubjXVxBMj4RJKfBJfEUiMkXKQW8Qpzl+WPNMhg5PHmhoolUKGD5wIaNUwnMK5vUxSZd6qJhNsjNqMTYxmBTQ92cAB0/it2BItllhB9RFKnrlmVuz9uFLMIG+ZQBcUVHDPj58gLXPB+QQeeghC5IuyViQUdpUSKB5hA6BCrawHc+x63LPzxLruTAcdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4LPM/hymK8ajbILyPtti5DjOj6iT5B+HxktK0ozSI/E=;
 b=pGzhQEJNSszz5MAmAHFFWi9K/t/pgjJfShwRzSPXjHD1SU5M3djqBTV5mq0iggKAy2EznZ6rlBa2sXS761ERMxp72asXT2/iVaWMmfDwnMgZAKCbXQONEUNolPmM06AJ1cdeSA/w58veaKxNiHUjJGdyStERDIfMmLjBnS6rO3ml9ACkm1EYXnM9g7d2vbcv5Pp3PjV8uHZXovnro/Laeq/R0DAwgKgOpd3XC2d6D1fYXORoDq2pAuqM/Ww8Il0xPL8qsSQdReOidI0bRxNbB/E6WMXB64aYf1hZFUXusm+p3yIjyeuPeE/WIe6/woY44tPqxIUnttkzhezdqIjP3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4LPM/hymK8ajbILyPtti5DjOj6iT5B+HxktK0ozSI/E=;
 b=NP9YcSBqrwu2A3hvOz/Qet8TxZwpK1I8wKGnnecHTkkK5OF5oWp+0DKPN8yXuWOaU1fHth1GfuHyrbleemVWw9S9acfJ5C4ZDrseWJCUzb2b27Mm+KXtp1KN2jdwm6L8a8BEsKptsXaJT8Kq0FmMoHznrI1mhEPWuGSa8FBqF1bDarsXdyiA8C4P4b0/3QXeyUQzWShIsLXm7FYopiKVbihWbX6CP8mC2CrehRG8vRZbfgpQps6OgTGqFHAFpW/Yct9X2PciMmxaala47eu1QcpDz6YDIrfjzA8jYnyTyhxz7LeiRKKNob2MwQGLroXVbXV/VQp4OVMaF2hSDx7jOA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SN7PR12MB8059.namprd12.prod.outlook.com (2603:10b6:806:32b::7)
 by CY8PR12MB7681.namprd12.prod.outlook.com (2603:10b6:930:84::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.15; Tue, 11 Nov
 2025 21:52:13 +0000
Received: from SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91]) by SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91%2]) with mapi id 15.20.9298.015; Tue, 11 Nov 2025
 21:52:13 +0000
Message-ID: <4689d464-4665-41e6-908a-db1629e980f0@nvidia.com>
Date: Tue, 11 Nov 2025 16:52:10 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/3] rust: Introduce support for C linked list
 interfacing
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
 dri-devel@lists.freedesktop.org, dakr@kernel.org, airlied@gmail.com,
 acourbot@nvidia.com, apopple@nvidia.com, ojeda@kernel.org,
 alex.gaynor@gmail.com, boqun.feng@gmail.com, gary@garyguo.net,
 bjorn3_gh@protonmail.com, lossin@kernel.org, a.hindborg@kernel.org,
 aliceryhl@google.com, tmgross@umich.edu, simona@ffwll.ch,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 jhubbard@nvidia.com, ttabi@nvidia.com, joel@joelfernandes.org,
 elle@weathered-steel.dev, daniel.almeida@collabora.com, arighi@nvidia.com,
 phasta@kernel.org, nouveau@lists.freedesktop.org
References: <20251111171315.2196103-1-joelagnelf@nvidia.com>
 <20251111171315.2196103-4-joelagnelf@nvidia.com>
 <CANiq72nuHUFGMsEYr-KhCB4oMjX72YskG0s7uCB8dcVtTGW-jQ@mail.gmail.com>
Content-Language: en-US
From: Joel Fernandes <joelagnelf@nvidia.com>
In-Reply-To: <CANiq72nuHUFGMsEYr-KhCB4oMjX72YskG0s7uCB8dcVtTGW-jQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BL1PR13CA0021.namprd13.prod.outlook.com
 (2603:10b6:208:256::26) To SN7PR12MB8059.namprd12.prod.outlook.com
 (2603:10b6:806:32b::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR12MB8059:EE_|CY8PR12MB7681:EE_
X-MS-Office365-Filtering-Correlation-Id: 7889e206-cd16-4c64-6bf7-08de216c925f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|7416014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UklsbEVUVDJPWWtnNStOTy9OWEhEQjV4bldVbXR3NVNJMWRXTm5FOHpLZUhm?=
 =?utf-8?B?b3MzaDk3QWJFR0tSTEF4VC9EZkV1ZFh3S3pkbStwZC8wN09LOS91UWgyMnlT?=
 =?utf-8?B?KzVLSFRrQ3NpWnVkWDlyTlB2R1ozTDhvd0NBZ04zRWUvcy9nRS9MYngydGUx?=
 =?utf-8?B?T2J4UjZaN2g2VFlWR29MVGNwOG5OdGNnUUF4YU9iclQ4M3BiWktQNVNPZE5N?=
 =?utf-8?B?eTFhV1BCMWdtd0pKZEFiVVl3Rmx6NEdNNno1TzdGTUtUOWVTVUx5Zm5zdVBM?=
 =?utf-8?B?MTJEUExZY291b0FrVE10VW1UajhNYjNmRmVFeTE5MThWeXVmSE9QMHdlSzNF?=
 =?utf-8?B?K285aUlSZEt3NWxCQUdRa2Z1cU9JelYveGJIOWc0K29KVkE5YlY1d1J6amMy?=
 =?utf-8?B?QlFsVGRUeWMyMlRid3Y2MzhzQTlGanppSWtPMUN5cjBhZG9qSXcvZjJRcWlS?=
 =?utf-8?B?Nndpekl5MW83NkdtaG4zTjdwZ2oxZWdqZmNUbENjdDA5MWIrbjRNd1R6c3p2?=
 =?utf-8?B?RHIxbmVCRHZqZHJiQ3J2RVdEU2JUUjZCc0tSVWd1SmwxU0djdm5wVnRRbVZP?=
 =?utf-8?B?VjJLVHdmQ0lyWW5HSkU4ZWJqMUFUM2JFYUlvRDNKNGJTU0tzTFR1ZEc4bzFO?=
 =?utf-8?B?ZjNPSi9kNHBVcjM5TlR1MDFJY3BtSEVtb2RXcXVMUWp3QlZCcmtjRmZzeEQ1?=
 =?utf-8?B?YjBsZ2diaC96bDRhWUFsd29hbUM3M1BoaW9QSnN4THlSNDhsK2FiK3N6VjlJ?=
 =?utf-8?B?WkkxWGwvcnpxN1JMR2hwdXVKUEROVHBROGY5eDlINHdoNVJFZDV3bjJSeHFv?=
 =?utf-8?B?bzZLZGhJOEZ4TkdvMmZoVGYrNDg4RXh5cUU1RTJXcmgwcHlRSjVjY21Ga01X?=
 =?utf-8?B?ZEN4eEdOY3JUbytVbGgzSlkvTlg1VkxyRDdRMUJEL2tkN2F1bVNuUnZxaFZC?=
 =?utf-8?B?TVZJeDBMTmJ3ZGI1N1c2ZkdNRy90T2FrNzhSWGxTc3NhNEYzaWNBeDFzZmg0?=
 =?utf-8?B?RFJ3NEY5MlpEajJaUTVIdzNhOWZvcXZWMVp5di9FNkt4L3RTRUdJRlRVd0ZM?=
 =?utf-8?B?ekF3dWlzMnpnUlg5Z0dIcU45TG1MeVI1dWdYTndMMktzTFRMZWhiUUlBUk9W?=
 =?utf-8?B?YnRNRVhPaEhXVEtoWlZmSnhEd1dJY2dWdVk4ZlUzZkFXc2ZMOVFKQ3lNRC90?=
 =?utf-8?B?RE5qL2tMY2pFZ3h2NlpFeVNSbG53bjNpNnYwaTNHSEk1SjFIV3FVajFJdE94?=
 =?utf-8?B?QnJqL3JRQWN0WXk0aVFQWVJrL0JCWVRLcVQ5bThkcFdkd2JBTFI0OXhRSll6?=
 =?utf-8?B?ZEdicFpQZFVIdmdRZ3JlRWMvWmlYelI5Qk1nNGZDTVp3Y29FWXdnNzZOcm1F?=
 =?utf-8?B?YzFzZ1NRRmtMbEFpenZqSmNlMU5CWHpKVUF1NDRRMXhOdVhhNjYvaHluRmd2?=
 =?utf-8?B?NXZvN2JMeTdFdnBkTDVmbDZxbWFWUU14VWhTWTVZTUNaUDZtbEtrN3JhNHQ5?=
 =?utf-8?B?aXNEK05hK25tcHdSYTd1UzZqK2ZmRmxjRFdjMzIvdDE2NlBhdHhjTHdQNHNs?=
 =?utf-8?B?VGM4ditrT2Zkcm1ZSkthaDRpQk9BbmRnRm1jQ2orR2luZCsrRm13QWxndzB2?=
 =?utf-8?B?U0JiZ1Z4dkRMZXdNVmNVdjY0RlRMNnBEejRTWWM4Q0hvNWMyM0E3UGxkUmZa?=
 =?utf-8?B?Rk5tUnhsYzkwWHRGRkx1VUFGQjZHSFNmbWVUbXRHRExkZWUvbGZtRWJVdXpX?=
 =?utf-8?B?L0tlK2hzR1dldE45L1M2YmR5U0xQdjNmaWtrbU9RcmY3VStkM1hERmFUQVcy?=
 =?utf-8?B?TWszRDZpSTltTE9FOXlaQko0TWdGd2JpaURXVHFpZ0dkSGRMdUpQSHNPbFgr?=
 =?utf-8?B?WjRabVVlUnUzRHkwUWszM3Zmc0JqWE1ZbWVzRE9oNGdnbllxUzVLekNzMHBv?=
 =?utf-8?Q?Iygw/Jh8QM15J9P/LIITjejXESkhunMh?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR12MB8059.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(7416014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?M0VVT3Y2WXIza3ltdWhWRFd1OEFKd2UyMkdxR2FqVmhpTmtpZy9oQ2JxWFRL?=
 =?utf-8?B?UWpLOVFzU2l2K3RvL09WeGNkT2dqV0puazBSYzNWVkxRR0tEbmFGVDZuVFpV?=
 =?utf-8?B?Sk9aWjNFclZNazRNYzB4QlZRWkphenJ2RDZJVW5ya0F2N1d2RFhWaUtyQ1hU?=
 =?utf-8?B?bzMzNW04ZnlHVUtsQVFiMlRla0FLYUtuc1l4MjhmYlUxR2NSVC8wRG5pUnNI?=
 =?utf-8?B?Ukg4bU9Rd2hkdVp0dlVZbnVnaUU2aDVKNmZmQStTMm5LZHpybHF2by9zK25w?=
 =?utf-8?B?OGpUSHc4SWlwOEN1aWJRbGlCYXlIK05oUjhWdmtjNjE4WVA2TTAyWHpYU3Y4?=
 =?utf-8?B?VlZhREZUWUVydWF1SlI1S0h1VTZmOFA4V2JPWk0yVlJsOXZKdERsdDVtOWhJ?=
 =?utf-8?B?L1FxaXJENDU0Umg1WTNSaWZNc0ZJcmVjUS9IOGQ0NW1QSnY0cEY5UDY0UHdM?=
 =?utf-8?B?bU45eDVLS1dKUHRNc3ZDTG8rOHh0cng1dEdYMTBuZTloQWoydU1BQzR0WnZt?=
 =?utf-8?B?Mm01TCtJQ2FvMGZFR2hSTkJIZ0Fzai9mTm42anlvU0FNZWhiMS9SR2pwcEtz?=
 =?utf-8?B?c2JPeVp0R0V6VnUvL2NVb1Q2Ui93SjcvSnIzNmVUUFBPcndiYWJLS0FUTVRY?=
 =?utf-8?B?Um5YYWJNOTEyaDlCUVArbGZTQ25sQ0g2MnhKbjdJRUpWMExNWWkrcjJ0WXNL?=
 =?utf-8?B?UnB3N1JwM1h4ZUJDVVd4dlhmejk4WW1xbllNaTZsMENLUDdUYXBZcXdDOE82?=
 =?utf-8?B?QlRvWm41S1BSY0xGNmI0cFVzNEJCbjN1THI5UmFXUVZTemY4MFpKbFczSVFz?=
 =?utf-8?B?YnZKemZ0ZzJWWHdjRzkraXpWaTlyTEJaWVZIM2U3V3hKcm1JcVVKMFprTkVL?=
 =?utf-8?B?Unc5V3lYdEJXaXk4Y3oxMnF4NlJNV296ZnZHR2xiK0pvNjNsa3h0eVpYNzFG?=
 =?utf-8?B?WGt6VVNnUGlLbEZyYXJ0d2JGanZRWGJlZWtLTUU5K3lZeWh6WlM3Y1RiQlRF?=
 =?utf-8?B?eHhhc3E2Uzl1MGpsaG1SbkdYeXRUMW03ckYzRXJaenJ2MlZNaEl1NUU4Umsw?=
 =?utf-8?B?dUkwMW9LdS9NWTZ5QTV3dUN5SU9GbFV6RXRXaXdFcml6ak9Ud3l1MkthUEVH?=
 =?utf-8?B?WEd2VkIvV252c0orNEUyQTJjOXNJRzNacTF1NXNweXhRcnlQaVdSby92QTFJ?=
 =?utf-8?B?NTlscUZVSFhpeWF6R0gzZGpzeCsxeVhYVFU0a0NLZXlJRHZHREN6MmJDSlJr?=
 =?utf-8?B?dTlHUHpEbGZkV0tvUDNTTjV0NTg5Mk1Sa0txUzllT3U2WHRVOE5LaWJpazM2?=
 =?utf-8?B?RVRMMTA1MHlHdlpjejQrNy8rL2hNZkJ2V0RvTkJtelIvVi9oS2pMeUJrdjVT?=
 =?utf-8?B?eE1kZU4zV085Qnl1MVpNUGZQV2p0N0RNL1JGdEd4UmNEeldNS0E4Z1d0WEw1?=
 =?utf-8?B?K2RrUXRJaHhlY0dMZ0JVRUs5QmFWTUI2NEtlbGNZTWhmb3VIUUFZR0gwS1Nv?=
 =?utf-8?B?UmNUam9ieW5IT3dpNTMwc3pTSFBoWmY4dUlGUGdKUS95ekZKOXdFVkRPMHlo?=
 =?utf-8?B?YUlZSGtsT3hCdzV1N3d1UzJmOWVqbm5RODRqMDZSV09LdE5WYm1OWDJUeHJR?=
 =?utf-8?B?MEtIK3BQcC9GdzlqUU9NelB6WFpXcXlmS1lEWktjOFU5M2x2THJWY28wSGJn?=
 =?utf-8?B?YmJzM2JJQ0FTR1h6S1F5dHJpZDY1N1dkNFJ1T0RLejRmeHVpN2NaYkprZUp6?=
 =?utf-8?B?anozWitOT1gvZnRtMUdWZjRVU2RiNHFlZytDQXVFdGRPMEdQVHREV2xqK2pk?=
 =?utf-8?B?N2o5UVY4bGpkUjFnRWxaMHlFaUdTcldmaEU5TldqSkp2THg2dzNPT05WSGRR?=
 =?utf-8?B?dHczVVlRb0dSVWVFMTBBTUZzWVFsd3FkZ0ZkQkNkUU5JK2NIVWl2dWg3NzV2?=
 =?utf-8?B?R21FVGVucnA5R2p6SFQ5c2QwRWk0ZElvclVHV1Nidkk4d3czMmVmVTJ0S1h5?=
 =?utf-8?B?T3hsSjI4MG5qR2gxa2hzZ1gvOVQ0eEM3L1c2R0toNEgvNWszMTYvdjhVaUZD?=
 =?utf-8?B?VGpRSlNTdzl0a05wQXMydjlVdEt5QnVObGl2OTZtdkQ5L2ZoajNRMGM1VWZG?=
 =?utf-8?Q?4fkssJyqfOdaUYA49xBesGFOG?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7889e206-cd16-4c64-6bf7-08de216c925f
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB8059.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2025 21:52:13.0708 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tb8GIF50MJVuzItyZ1F4SAkR6AR2jo6PQSBQDR/rkrRcDSC2XXOsLV5LHEtI20WewHfiNpnZES4Qvr+I5eudXQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7681
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



On 11/11/2025 2:54 PM, Miguel Ojeda wrote:
> On Tue, Nov 11, 2025 at 6:13 PM Joel Fernandes <joelagnelf@nvidia.com> wrote:
>>
>> there. I rebased the patches on linux-next. I can also add MAINTAINER entries
>> in a future version, if folks agree this should have its own MAINTAINER
>> record.
> 
> Yes, it sounds good to me to add one. Please do -- thanks!

Ok, will do. Thanks!

 - Joel

