Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 86735C0FB8C
	for <lists+dri-devel@lfdr.de>; Mon, 27 Oct 2025 18:42:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D0F9E10E52A;
	Mon, 27 Oct 2025 17:42:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="McVDlNq6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DM5PR21CU001.outbound.protection.outlook.com
 (mail-centralusazon11011061.outbound.protection.outlook.com [52.101.62.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 09A0810E526;
 Mon, 27 Oct 2025 17:41:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TnM045KRQp1rbwWoDZ/iusTidksnmz6OhcmiEObN/jZKQ0vS1i5G55JELCpwl6m3Vn3Vl0hRU2hJzdtjKwr51F4hiTUMtrX7k0hRNYbzH38YRh6yBnzXhF2tbN22O+s0c3IhXV0axO4D4VJnDqFjc7kDAXJqvw/htpcTymiyxJ52NP9SXwX3yfMQ45aCQ6pmLGUVR90AxKrw5jAzZVRQDL+skqhqTIrF4EhtYc+YkiuTaRdB1kvPLtgQX9WboFkdGvBI0w6mgC9yAPlMVc+c8VdToOjjvaVZlbwNhEPdBP4Wn/SB569038J5W4n1s+eb7aQopUU4Ew2Gr4RdEuPwPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j4C26b/Sm0HTAxzbE60WtRalaiV53+eWbnfxxShNeEg=;
 b=SDyj2YOrnv4Hz6NBn1F2eJiKoykk9IAtOJeNqbHhDcsmBFDVBXbOQVKi0IuyGWI+7/6ud9l1wrWCE6ocnpcJ8YU2WtCD4LuY+6iCkLXWqhWOUZWD2wnvOJJx/lIRxnWno3pWZTjmYJnJXB0gSDcqOvmFwCWaXzyXlc7JFV7KTIj2wW8/qMIkgOaFAN0+c1BN+PJTHpe/KSZ6IMBTVcWLm7e5/KITPbMWHFqro2prfW9R4DnciIHWvYXh6EPyf6U8HfzSUQMJIzx+8wCUTxwXAMrCdLdNvAS9Hy9xJmORmBUi5U8RfUiYbFZaai9uC+QHBwODOAKDYQV6Fcf70YQr+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j4C26b/Sm0HTAxzbE60WtRalaiV53+eWbnfxxShNeEg=;
 b=McVDlNq6fkTd6UMisN2niyUEWJPtTJIMSEtd6DoElEzOE2SmZ3A9IUAKxXU7rUTWiv7lPJngYHyvoVRaoOED86wuHDYygaoF7ncnFPw5No8mgXiG5J4Dy0Qzm6RQcaBgrkSugUEEBPRC63Eo1v69XX58UD4+vgM/Yl/9CmDly3jbi1DNfEqy5+ntd0Gu2V8XUGZkYmk5Pbd3Vc++E7u6r+hiRYHQSukLe5Jp8tBsjhRxbEtF3HLm/m0wj8nRTSfUQJNTZb3o4Rm5bYZz+Ci6aHRs2Jr6eOyQPjJfItQOHf21/sehcqXRlHmKdI92+uhUVJIchYGEc9zoeUSzH7aEHA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SN7PR12MB8059.namprd12.prod.outlook.com (2603:10b6:806:32b::7)
 by IA4PR12MB9836.namprd12.prod.outlook.com (2603:10b6:208:5d0::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.18; Mon, 27 Oct
 2025 17:41:51 +0000
Received: from SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91]) by SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91%2]) with mapi id 15.20.9228.015; Mon, 27 Oct 2025
 17:41:50 +0000
Message-ID: <50f8b846-aead-43d3-b3f0-49e67b1952b5@nvidia.com>
Date: Mon, 27 Oct 2025 13:41:47 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/7] gpu: nova-core: vbios: remove unneeded u8
 conversions
To: Alexandre Courbot <acourbot@nvidia.com>, Alice Ryhl
 <aliceryhl@google.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>,
 Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>
Cc: John Hubbard <jhubbard@nvidia.com>, Alistair Popple <apopple@nvidia.com>, 
 Timur Tabi <ttabi@nvidia.com>, Edwin Peer <epeer@nvidia.com>,
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
 Danilo Krummrich <dakr@kernel.org>
References: <20251027-nova-as-v2-0-a26bd1d067a4@nvidia.com>
 <20251027-nova-as-v2-2-a26bd1d067a4@nvidia.com>
Content-Language: en-US
From: Joel Fernandes <joelagnelf@nvidia.com>
In-Reply-To: <20251027-nova-as-v2-2-a26bd1d067a4@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BLAPR03CA0114.namprd03.prod.outlook.com
 (2603:10b6:208:32a::29) To SN7PR12MB8059.namprd12.prod.outlook.com
 (2603:10b6:806:32b::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR12MB8059:EE_|IA4PR12MB9836:EE_
X-MS-Office365-Filtering-Correlation-Id: 66e890de-e288-487c-4e25-08de15801bcb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|7416014|376014|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?YlFPZG9MU2tXcnNnalkwMEZXOFQ4anNVQ0tVd0VxZUNrTWVjTWpNTDVQdGhW?=
 =?utf-8?B?VDFOVllkU2dlZ1JwRWRVbUZ0RFJ5dmp1ZVJQM2xLRGcxRG5EWkt5NU5hL1Bt?=
 =?utf-8?B?K2piVnRRVnJUMkpQb0g4NE55Wmk1bFg4K2xUcmdOQ3lxZkRPbDl2YnV1MGRP?=
 =?utf-8?B?TG01M1NxU0E5RjE5VEY0ckxrY0t1YlBRUDZwS3QzU3hZVjJSRDBDOWRhanRZ?=
 =?utf-8?B?c1I0ci9wZWVHVUlZdmdzOGNLczZxdWpHN3lzMmtSS09lMklnb3lTUml4M1Vh?=
 =?utf-8?B?NEs4VEpGNmVpTC9pWGp3c2FIODVpVHdHNkN6UkpoSUlDd2kvRXNTVW5oWlpv?=
 =?utf-8?B?SGhCTEdxOVVKSXhMTTRFbVI5eWhZaFJCcUgxR2QwbjRXS3RCaVlkczhZOEwr?=
 =?utf-8?B?amFYemo5QVYzT3AyZVd2Q3dWV2wyU2RwQXByajRoblBHNHB1bmtld3lIVUMy?=
 =?utf-8?B?RFV6eEdzRTBaVkc2a3hZQm1tVThMeGI0MVpsdElNaWhBdUFtSVZnaWErUVJx?=
 =?utf-8?B?V3ZMclJFN01BNGorUXlhV29lU3RRQnBaMDVoSmZUWVcxZlprSzBicHlRZXY5?=
 =?utf-8?B?M1VLNFBnNDFOc3RsSGtFR2ZmNEdWenZqN3QzT3FMSGt2WEp4QzJFL3VyVlRE?=
 =?utf-8?B?MjIrdXo0RHEyck1RTk15cW1FOVhQL0hTRVB0MHdSSW1EOUdqaHlQK1pGd3dG?=
 =?utf-8?B?UXFSY2ZDOFp4WXNBQm16bW04VW5HRDhsZExYQXVuQjlnSW41RFZKUk03bTh0?=
 =?utf-8?B?R2lzZURKS2MvamtmZXZSZjYxcVlwczhoRm0zQlNLNllMbjF1K1paR0xvNjJi?=
 =?utf-8?B?RldBaDZ4WnhDMFUwdFZET1YyRGJWdGFmL2o1WUdlOStyeTFha0JzU0JEb01Y?=
 =?utf-8?B?V0lYWVhZM3pFY0pldVExT0pVd3F0RVM3cDJKcElZWCtiU0hvNmZDTzlBRFl4?=
 =?utf-8?B?dEJOeHdtck1waG9INDZwTHl0SlNiRFIxdzN6N2dzVFByQ3g3VmtHZml1elVY?=
 =?utf-8?B?b0lnWUl4Y2pVRUdGK1dDR1JpZi9KUWZiaUNmUWcvY0ZaallUK28wQkduemdY?=
 =?utf-8?B?SjdSaVRVWGpOY1RaODBXMytpVlFXeGxiUkNLMGkxajVpYXUxUnFzVG11K0xZ?=
 =?utf-8?B?cW5sNDRsOXc3Mkpwdm4xZ04wOHQ0eVZaa0RLc3YxNWdLRThRamJKcVQyOEF0?=
 =?utf-8?B?ZUNSaDR4RWM4WWYxM25yeERpN0UvTmd0SUdPQTZSa2JENWd6SW9CTXdpUCsr?=
 =?utf-8?B?cmhLYkJuR2FtZUp3TWxpZEwxTmNPZXV1YUdNL0JMU3dEMWVFTFF5VlpHZ25T?=
 =?utf-8?B?b0xHSjh6VTFrSkM5cXJXaG8xMldHeDRMMHVZTFZKZDZXR2VaMjM4RlZhVjcz?=
 =?utf-8?B?Tjl2LzFhYVFJbDVhZUhtQnRNRHpKeVk4ZUNmL3pJNkRHNlpxUUpmVURwSEJj?=
 =?utf-8?B?UFljKzRIaEJyUzNWKzg3MzVqd1kvbjgwUS9TbllBV0dYV1JyQ0sxdFRWNVpl?=
 =?utf-8?B?OS9GZ1NFZU1qbDQ5TE1Ob3VnTU9uakJFbFhIV2pvREtLdzVHb3Jnb25QWW9z?=
 =?utf-8?B?SWx3NEQ3c0Z0VjBzS1FycllqQ0ZZOE9FQXdRYXNuUTY4eFRPc0kvMzZvZG1K?=
 =?utf-8?B?Uk9GL0J2aXpmMFR0MWxOYktxS1RLY1JtM2hTMlF5Z3RzQkZuTkxaNEhTYmgw?=
 =?utf-8?B?VzlJTjZZaFdENVQ3M1NjNjJvZnA1NEVOakFOWnBQVThsa1p3eUZTOE12RFNk?=
 =?utf-8?B?NElMRVZiVVlPVzRpMWh4U2lhQ2ZCTk9pSWF5b2ZKMVRXQk9CUTN0SVdMUUhk?=
 =?utf-8?B?aHFNaUh2aUQ2ZVpDeVZ1b2VWNXEzajRRd0VZbWRwbnhqRWF3V1VpKzB0QU1t?=
 =?utf-8?B?MytFT2lwaW5GZk9xckdoRVBHOVRCdUFsUGlIK00xdmx5MFVKcXg4Q0RxbWth?=
 =?utf-8?B?ZmtUc0IydUVPcjlYR3FwUjRwc0NkSHZ6WlpsSFlyUmp0SUJMMWdyRzNRcUhL?=
 =?utf-8?Q?MIn06X4mgm+4x1YiV+pci9ZNIxUTzQ=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR12MB8059.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(7416014)(376014)(921020); DIR:OUT; SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QTVwNXlkOUtkQ0U0UXMzT2kvZTdrT1dUUHdzVjFZazJFWUIyYTlXRVhBNlQ5?=
 =?utf-8?B?MmFHWkxVUGNtYi80czBNVFhxKzZwU1VEZmNNZTB3b1BteXFHL1VjSktZaWhW?=
 =?utf-8?B?amthcE1Ob0trU3R6SDVDWXhFSCt2Rit0RjFNKzlZeG9ydGY3blU3WkRnTXlj?=
 =?utf-8?B?Z0lIdVBIVzVHVFJSQXdIcVZBblJMYktsQWRHRHdOdHg1UDV2YkkxK1QwejRP?=
 =?utf-8?B?Mms5ZlQ1akJBOFZHVXI1ZERKdUoyU3J3WEhVQ2RUVUJ5c2l1cnhETjQxamYr?=
 =?utf-8?B?OFYveTBsYlVuaXZSeU5UMkljbU1UNHR4dmlpYjhMSU43TFpNOGR3N0VKdSty?=
 =?utf-8?B?UDRnN0tKUGVmMTFYVmdLMm4vbVFrQktVRE5MUWI0RjQydklXTnJVUWVOTFRa?=
 =?utf-8?B?NVNnWVQyZFdYMnFFOU4wZ0oyR1A3TUdzZUdCeU5ha0hLRDgrTldaUE5NeEor?=
 =?utf-8?B?a3RVanJXekJsRUdnRmdxVHR3UmYyNElFaGx4d1dKbnpYRkhHVVA4QXhXNHdW?=
 =?utf-8?B?R012aitoNE41S0ZCQi94alk5TXRJWTZwSTJpVjVHRmNvZDV4Ni9HN204T2xl?=
 =?utf-8?B?K0g4bDVTaW9LV0dsb2Z6UXY0UFN0cXJocXd4b2hPM283aDdtV0M1M0tIV1JC?=
 =?utf-8?B?YjlMbHJ6dUxzdVJEWmRZeEJBRlE0SFFTL1hiVHFJVXliOHhYQzgzN2hqbWNt?=
 =?utf-8?B?UzFZZEJ4ZVludUxGRlJBTFJTZGo1VzBKd0I1djVPRG9NT1pYZmhKWHByY0Fn?=
 =?utf-8?B?eURaaXdCd2ZrdzNxODl4bEhibnVTUjRPV2tJVnlrZnR6SnJCSDJrNTk3ZUNw?=
 =?utf-8?B?MEJQSGlhOXdMelFkSnhWTjRvRUpXN1oveSthWnFoWWVNZEVWUHJkTEVreXha?=
 =?utf-8?B?QnJEZTN4Y1dwUzZ1K1d2TnpCYXlqUUwwKzkzRW95dlhoRm92UmRuWjgxWGo4?=
 =?utf-8?B?TDRpdVNNSWpCSXdJaDRXVFJGWldCS2VySEM3ak0wZzc1eHV3NFl3NDh1S3pL?=
 =?utf-8?B?WkhGamJSY2xsMDNyd050V01qMlh0MzR4KzhFZGQ3bG5lMnBSLzMzNFJKRVFI?=
 =?utf-8?B?NEROZzRkL205NDJNT09WSUxPdkpPSkZrZlFyMlJkelIyTmFBaDJqcVNFZWc3?=
 =?utf-8?B?R0NjRjk4MjFCaTRMS004U2FQZGtqUmkydnhHek5VS0ExNlQzcTNRZDFUTm0z?=
 =?utf-8?B?VmdBUEt1MGxRYi9NMGR4KzZBT2RneHpMaWJ4OUVvQXorZHNlNHhPeGRLYXVQ?=
 =?utf-8?B?Nmw4U2VUR05JK0NZL3d5RlMxbk4yT2tEM2NhWTJOL0grNzN3b215SHA1dUF0?=
 =?utf-8?B?YzhhbmhqQ2RJeklrcHVkenI3R0pnbmttS2p6Zit5bjVZRDJLME1Oc0kyUkFG?=
 =?utf-8?B?V291bU9MNVdBODBBQThsOWltQWExZFpFTlg4V3FxWWV5TTZpdjRlWm0zVUhi?=
 =?utf-8?B?cndCdVNFMzFHNGZZRzVNWEd2NUk2QStBTVIzUzNrNnhtSDhMcGJFbEJ3QTFv?=
 =?utf-8?B?djVaNyt3djdmczBFS0ViWWhld0c4QitnWVNXMEc2UFZweElSbklIK0NIWjZv?=
 =?utf-8?B?U2JDa3ZSOGVvWFhKcTFhZEFvbVJZRDdNc0tWR2haVUpuaFVWcEUyVmU1V3BQ?=
 =?utf-8?B?ajJtVFJtaHRGUDhtWnNBZzdLTFhsSkE4b2ZuUHlCeDRCZHRJL0wzS1h5M3Jr?=
 =?utf-8?B?NEV1NS9YY2ZkK3NZSks3UlRqUVd4aUxyMWE4eFJZVExzVTFEUlJ4VENjUDd1?=
 =?utf-8?B?MFJvVzJOcDQ1THdPN2pnRzdXVSs0OGxzZU8yWGtabWNmMmQzTWZ4NjhQeFZM?=
 =?utf-8?B?a1B0MndMZUUwUndGd2FVbGFhZG51N1hEV2VqY3FkalVRZFV2S243anhqZFhp?=
 =?utf-8?B?MVVmdU0zVm9ZSkZLaDhJbEZPY1JEOERTZjVMNFRieVJ3a21MNmNaeDVGSi9O?=
 =?utf-8?B?NXNNR1BxZDJYdjdkWS9RVUFFWjYwTGxIY2lLYlFKbTVSZm1DeGc2VzlORlpw?=
 =?utf-8?B?dkNCSWhTTytDWWlSVTh1c3VDOW5XUzMrZlRTWmdhYnNzdXdVUC9KRGVMT2NE?=
 =?utf-8?B?bVJodG5vY0pqenJTb1cxMjBNSnIxRUQ2QnJFOGNDbUdzMmVVcjE0cXgxeE4r?=
 =?utf-8?Q?gr6K89T/T6CullRbA/kxNUgTU?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 66e890de-e288-487c-4e25-08de15801bcb
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB8059.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2025 17:41:50.1126 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GzNSZ8viCWh/v45x3RroF6pmSDscSVr9F/ujVFcN2jpAOB240s2xPV8RbGtMUJxFreSuepBs4cJ3pVyafdTu+w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR12MB9836
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

Hello Alex,

On 10/27/2025 8:54 AM, Alexandre Courbot wrote:
> These variables were read from the u8 array `data` and converted to a
> `usize`, before being converted back to a `u8`. Just re-read them from
> the source to avoid using `as`.
> 
> Acked-by: Danilo Krummrich <dakr@kernel.org>
> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
> ---
>  drivers/gpu/nova-core/vbios.rs | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/nova-core/vbios.rs b/drivers/gpu/nova-core/vbios.rs
> index 943b0dac31df..dbe0d6e4a015 100644
> --- a/drivers/gpu/nova-core/vbios.rs
> +++ b/drivers/gpu/nova-core/vbios.rs
> @@ -911,9 +911,9 @@ fn new(dev: &device::Device, data: &[u8]) -> Result<Self> {
>  
>          Ok(PmuLookupTable {
>              version: data[0],
> -            header_len: header_len as u8,
> -            entry_len: entry_len as u8,
> -            entry_count: entry_count as u8,
> +            header_len: data[1],
> +            entry_len: data[2],
> +            entry_count: data[3],
>              table_data,

Why not just change PmuLookupTable to:

struct PmuLookupTable {
    version: u8,
    header_len: usize,
    entry_len: usize,
    entry_count: usize,
    table_data: KVec<u8>,
}

That is cleaner and removes the issue while allowing to use the local variables
(and also makes sense to be usize as these 3 fields are size-like fields).

thanks,

 - Joel

