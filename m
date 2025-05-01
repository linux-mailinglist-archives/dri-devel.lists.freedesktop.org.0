Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FD5BAA5EDB
	for <lists+dri-devel@lfdr.de>; Thu,  1 May 2025 15:00:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7AED410E851;
	Thu,  1 May 2025 13:00:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="HUmtanzU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2057.outbound.protection.outlook.com [40.107.92.57])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 287F910E853;
 Thu,  1 May 2025 13:00:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=I1ZLuEH3EQT+0YiBQS7QOrrxaCB6lFQXXCcvqbPkDfRPK1DffXg9k7UhbxhUr2QdhBMtoJsoMIByISalaTwZ/BbDmtuj6skCU9vaLl5BkBv1QwSZ7hyPRrk4tiiDSt98hwCOB32f3tIH72PC0pSL+u6SDvj56f9M2nnkRrFSLwSozHG0s2BSotAC1AkrUZbUUvtQP85aVNMxKGCgx8lof31znKCcVZPdrfQKt+shcpaKFb73hR4jgz/LkI8JO3vcOwuDCgNmsQBPBt+ZGoqasTnu1iNcb5HmWbXWtGMY+vvFHAiz2AFm71VFGQqUE6wKrSXbvHWVxSSKt9ooTZCPkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SrEr0RWn03sgNOiG7B2PMBRn1dUvh3KbamGfS27hnqk=;
 b=by5pt8Fed9zwRvf9vdm+9ANDklzi+glvWvCN5tFrnS5hu549jfOuI0y1GoacWWssJCMopdPG7sNVFTep2ZFY7hcpWRzUhrWPQnXCuZqVBUvFRkcMtd5o65MGhkFx22OY7hzcVj+gKhQZzd+UP/JQcuj6eP+w3DN9VjQR2YgypwOWfjdQNYimJTESUwMZGnkT0fEtKMP06xkNADFJHZWh2t/KtpWRLZIGAIgepIBRMwI3k5jp78Hp+KQ3xKroWDrA5HoYGKmXw5S2ASoO/mwBV7Had75+ZJvSeceG9VEYUyIEMZCDB0bN5zVJOvxA+k+mj4tRKKP5UeN1BvQQnUsJMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SrEr0RWn03sgNOiG7B2PMBRn1dUvh3KbamGfS27hnqk=;
 b=HUmtanzUmvIKx1shxzDKAEvtqmyVfWF9jlgCCdDiWSLHqV417wVNmSxa4+ACJrdJIO+hzFbq++CwFuVbSEtHJ4gZ41xMqsm5geXWBg1EfpCfQzLl0kOxO4YxrIhLKVOFSTsY6+B/uXeFyoF0SyXijp78yDJsT94m2UWtwl2Vv3xbjew5CcyaaV3CmUgF0IlTGyJmJM3AMGSHu0zElTF5rFZFSZmHUCQ3biBpNcRe5SGk2hZT3ZtlcT+jlPZDGNNUS/fJTUcSjuTC1PADUSpVk2AcjrGqnO0p3hTo8dMqPCfRJfpieMWWOcVPsn+VhJySrR0z6H/NQQtWtNzqYzIWIA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by LV2PR12MB5919.namprd12.prod.outlook.com (2603:10b6:408:173::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.24; Thu, 1 May
 2025 12:59:55 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99%4]) with mapi id 15.20.8699.012; Thu, 1 May 2025
 12:59:55 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Thu, 01 May 2025 21:58:38 +0900
Subject: [PATCH v2 20/21] gpu: nova-core: extract FWSEC from BIOS and patch
 it to run FWSEC-FRTS
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250501-nova-frts-v2-20-b4a137175337@nvidia.com>
References: <20250501-nova-frts-v2-0-b4a137175337@nvidia.com>
In-Reply-To: <20250501-nova-frts-v2-0-b4a137175337@nvidia.com>
To: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <benno.lossin@proton.me>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Jonathan Corbet <corbet@lwn.net>
Cc: John Hubbard <jhubbard@nvidia.com>, Ben Skeggs <bskeggs@nvidia.com>, 
 Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, 
 Alistair Popple <apopple@nvidia.com>, linux-kernel@vger.kernel.org, 
 rust-for-linux@vger.kernel.org, nouveau@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, Alexandre Courbot <acourbot@nvidia.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: TYCP301CA0088.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:7b::16) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|LV2PR12MB5919:EE_
X-MS-Office365-Filtering-Correlation-Id: b8202a7b-5216-45a3-4c5a-08dd88b01224
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|376014|10070799003|366016|1800799024|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NXVBSG42V3pjVEtBVks2RnFDbWZNd1RTcDNJTlcyL2xnemJZR2JqQU03SHgv?=
 =?utf-8?B?Q01XYk02ZVRyNndVbVZ4WjZWYnA1M0hSSHRQcnFpbUtYeGczVGFLTytPZGdm?=
 =?utf-8?B?M1ZZY0ZiNWZQbWlyeFIybExQdkFSL283VmQyTmNicjRoWnJXcFhqb0hlWE5O?=
 =?utf-8?B?aVVxMU5yaFE5Z2VlSXlSaFlmZ2F0bm55SGFyY0d6Zlpwd3FrV0F5WVo3K3c5?=
 =?utf-8?B?SHVSckRPTzViOUN6RmFOSm41bzJUaDJUbkltNEZpNXRYRzRwa2dZWUE4bERC?=
 =?utf-8?B?ZHRId0RneFZiWFB1SmtwSXRqV29sVlRQN0J2eElaOGw5ZG5wb1FXbENzb0NN?=
 =?utf-8?B?Q2pLelVocEFQUm4xdFVxbFREMFVORGdRYXlPRlJicnh2cjZzSE91WHhDWktJ?=
 =?utf-8?B?NDlYN1hSRzBFcC9XS0JKQ0RMYjZkdEFoVVNTZFVCbzR4OGNWMHppYndSWlJJ?=
 =?utf-8?B?ek9kcmJ3K05RUGNPTjdBa3d4MFQ5Vm56RENxc1NlWjZEdVBvZXFHRnRiOUpE?=
 =?utf-8?B?ZlhaTWozcm4vbWE0dmttWWxrZ20rOVBYa3dGNGJzcExsRjltU2tuZWUzcUVn?=
 =?utf-8?B?NDBMdllpWUJkSVRMSzBsWUVUelMwTWwzbWllUnVLQmJLdi9MbWk1ZXRrNGh5?=
 =?utf-8?B?TU9lalpJY1FDOFJNRWtOb3FscnpJZVhVYlltVUFMOU5XWmhmdm1ESnh5RDAv?=
 =?utf-8?B?aDdKQVZmWnRCQmJPYVRTbnowalB4bi8wUlFYZ043cktGQkNCT1RETWZSYXFD?=
 =?utf-8?B?SWNVSzdHUUNLYkZGUnJVS3Qra01KZjJsY0s2bzY5bTRaWm4rMmVGZWJWTWtl?=
 =?utf-8?B?dE5xZytodlBzeVZvRlRRWTM0eW1KZGcrcEY1bnZRTmFRNU5rckpkNkh5bWcx?=
 =?utf-8?B?SzlCcnY5SGkvYis1QVVRckdKUmNDQVlKM2Q2UVJCdW1sUjVYQ2tpUzJ6eTlt?=
 =?utf-8?B?RVFod1NFRFVmMzFWVzdGbi9FMG5oUnBYWXVWd2VhZjB2eDVEVHNXdjZWR1Zj?=
 =?utf-8?B?aVo4MVZwbGEzTVFNeFZGOE8vRm1ZZE0ySk1TT1lTYVpsYWt3blBmVHhRdVRC?=
 =?utf-8?B?L25QM3Q5T3duS1hyVDZBdnFoYjZ1SlpmWTlHaE5VY1ozZ0xpZ01KeVRJUk9M?=
 =?utf-8?B?VTIzZ2FWd1IwNjVac29tVXI5L0wxOGIxY1lnR0lBQ3ZQMHQ4M0ZINWJ4dzJV?=
 =?utf-8?B?dVBlcERoNlFkZm1mdzE4emNZT1hNS3ZOeGRqdUpqZkU2WFV2cDhwdVdwRmJk?=
 =?utf-8?B?Q0lSL2RJUHNjaXNZejNUUTltWkZ0QU9vNDl6ZEFNWnZpUEFtUHkrRXlOeDYv?=
 =?utf-8?B?WHBjdzQybzFnRjFJV2tJVWUzYXJHSVdWdi9KOVNsR25YTmp4QWI3UDE2R1Nv?=
 =?utf-8?B?c2hqeGlVK2JUdmNRQjNQdkkwQkxKTGVMYjQvRDd4SncxY1dpQmNFWTFQQWw2?=
 =?utf-8?B?aFU4ZEpOSjJ0MGFhWTlHV2ZYaFBzNmZuZEtUY2g2V3A3R0RhbmovbVppdndO?=
 =?utf-8?B?QkZkaXZOWjEwV2hsVEJ6MWxBbWVJb2J0SllLR2JJelFFenJybERHZklsK3cy?=
 =?utf-8?B?STh4QlZDRnJ6SjNkYkpLbkxxeEduVXRyUGZ2T1V6bmNXWEFhUkhWTytmVVJz?=
 =?utf-8?B?TlM4Vk5SNHJlSExxNTVVMlNMSWxoQTdKRVlxeXp0RFZZSG9XMWlnWCt6WGNj?=
 =?utf-8?B?SzZjK3Q3a3FZLzFPWjY1T0p4UXMyYm1kK3hheERML1NaTzQ2bDVKcTRlYnBK?=
 =?utf-8?B?QVZ1NlIwZC9RdDBwcklORFlrSkRXcFE2Tjg3TjJCSjBka3EvMXByMjFKV1Rk?=
 =?utf-8?B?d3RGMGR2d0NCSTNZRHlwZTZDN0Y4eXg3Ni83Zk5ld3FoS3hXWWVHMXA3SDNh?=
 =?utf-8?B?MXdLWFg3ZklEVFRLd3RsS1d6Z0djZG5kM1J0bE1KMjRKdFhWR3B2MjRtcHNO?=
 =?utf-8?B?L1duZ20zZUdPbEtSZFF6VGlkcDFmSEk5QllwNjAwL3o3UUZ1dVFQSkduNUY1?=
 =?utf-8?B?NlJMRUZHbDFnPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(10070799003)(366016)(1800799024)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dWVnYUdSQnhMME96QmpVcWo1a2JBSVA1V1JFUDFhdTRnSUo5N3VDZUN2bVRG?=
 =?utf-8?B?Rko1Ui9xZkxKYVFicFh6VFlDNld6UzhBU3o4Sml4blZONm9IaVMxdklKVmZv?=
 =?utf-8?B?NFh6UGhkZHo4T0dpK0dscTA5MGYyS0VUOFJmOFg3QWtRNS85YWxoNFFQb2RV?=
 =?utf-8?B?eTVhSk16dlNXZ1NhUURGK3czMzBnK1U5Y1BFN05GY1dIUUlvZCtuTUlDWUlN?=
 =?utf-8?B?dTdWS1YrTGlRZDRZNXRaUjFIOXZSdzhJeThod3Vsb2ZaRWpzSWlRMzFJV0pG?=
 =?utf-8?B?KzhSRFZ1SEVFTEhMOTdXdEpyL3VmMmE2enZRekk1ZWRLVSsyemlKaXNWQVRS?=
 =?utf-8?B?OStIYnRteWhWbVArUHpuSkdScTVRV3lPcGxSTDY0TVhnQnQ5VmxkTWhqZVA1?=
 =?utf-8?B?YW1qRm1jWDFhZnBOU0IxN0tiQWZlYnRXQ2kzblA3Z3JFRXZBb2dwdGdmOWky?=
 =?utf-8?B?NzBwOVdkMTdkQ1FlTXVRN2JCa1dMN2lnUDZKQzAyR2h3M210UmdTZ3djdHY4?=
 =?utf-8?B?SWE0aTFldW43ck5zKzRPdjJmUG05MmMxdXpMM0F2dE05QU9uODRDVkdYWHgx?=
 =?utf-8?B?aXh3ZS9qTjNqSkZCUnprNWpzV3BUKzB3QUtlUStqVkhEa3ZuK0dadStvYnM4?=
 =?utf-8?B?SVZoNlYvTE5rN1RiUU1YM01PSXFyYWxQQXRDelJZZGlpbTdLS0FkSEYybnhp?=
 =?utf-8?B?WGZLN2VaR0Y2Y3J5TnBEcFBWbHE2dWwyS3VxSGNkd1UzbjVEazk4c045ODZ3?=
 =?utf-8?B?V0p0Sm0xTkRXMDFXanBmUTR4Z2JXU0oyMWZyV2VZTHpwWW9YUjZVL1FVWkNL?=
 =?utf-8?B?VTdnQjllYkRzTGZacmg5Z0FTMUs5L1VyTkJZSXovdFBySTJZbW1TNUt4OGht?=
 =?utf-8?B?VHk4WVV4eGQxNTc5a204VFQ4amt4WFV0a3JnYUJKZFQ1ZzNKcWljNWdrNnph?=
 =?utf-8?B?UWo4RUF5dkpkOU01UnhLTVRtaDMrRGFqQXBSb21vT211ZW0vR0pVcjY2dXB2?=
 =?utf-8?B?U1dWOUtSbUk4ZUVxWkNNemYydElaSFdrSVcvYm13eXBaTTFjbFUxVEg1WFRZ?=
 =?utf-8?B?QThEcUExNnB4SUxwak9xZjJBY1JNbDVRMi8zbHowSjlMUm1Gcm9sNnZ0WXBF?=
 =?utf-8?B?K3JSdXpsU3pTaDhoUTRaQ1ZXcVdaMituL1ZYc3Bpak5OdEdMWXU0dWFPbmJz?=
 =?utf-8?B?YUoveW01WFlzL04vRXpOUHU2YzJxV3UxaVpWYzVxYXFDU1BxTFNHYmZWUkJ1?=
 =?utf-8?B?dzliM3I5Tm8zQk1YSVpjY08yd1BMbTdCTk9LWEtHd2lzNm9kbHc4TUtJaW50?=
 =?utf-8?B?cThBeTlwdTEwZk9tWStOcFJLZkw3S09VNVh1cEVTZG9aUTZma052MUpxbTRM?=
 =?utf-8?B?KzNrcVhyRCtiek9mU2FGbkhESGcraGZBRGxsK1dudDhlc0VDbmxsb0JCalFi?=
 =?utf-8?B?YzJyaXRGeFVQMEdQbUM5b0VuK0RIRndHTURTQnozKzZOWWZyQ3hRcnp1ZC9y?=
 =?utf-8?B?ejRFcnNvRW5KY0U1RlRpZUdLaktmN3B2NStCS3VlVEZicEUra2ZQc1cyU3JV?=
 =?utf-8?B?SFJnZVZlSEdmWHdIZHE1dTJDZW9RMVFWeEYxRE93bHR3M3FIYUszdExOZzhQ?=
 =?utf-8?B?LzZZbnl5VE9GLzFCVm9mOTFvcWdpZE9TRnBHWGhCbmtXaWdOZmxTODNZcmNi?=
 =?utf-8?B?Q2x4SnpUUmNYWGlpOWcrUFAzT0xSb2g1QmhCQXRQTDdTYWcwVkxORk94Q1dn?=
 =?utf-8?B?b2VLdHE1ODNOVGEvQzBKVC9YSnNtTUJBTWlIU0ZBZ2ZEZlZNdVlXTVhMSTVY?=
 =?utf-8?B?UTV0eWYwOUFTcHBIbDNlVWRPeVFVQS9uOWVUZkcyVjArTVVUcUtEV2RaTlg4?=
 =?utf-8?B?TDBta1AraUFqalR3WnU0TnFWSHVYSlZEaFpLRUNiSjBKVURJei9La1VJZzcx?=
 =?utf-8?B?TXJWVTVFcWtFS1JjMzkxRGFpRG1ObWRYOVpMMXBicVk2TDZaVkRoYXNQcTlt?=
 =?utf-8?B?YU1ubExFWWxRSVFZcnlYWW51WkVRNmRDdWl6TEVlOGVQeTRwOVdMTlBNVThj?=
 =?utf-8?B?TlA4SEVnUGNLOXRXS3VnWjhodGpxUUh6N2RWRm9TQWlyT1ExM21Ga3hZZjBq?=
 =?utf-8?B?UmVBN2p2c2V6TkJybDZmbFg1N1lGZ2xoWU1jTzB3aW0ycjNSa2R1S20yZXN0?=
 =?utf-8?Q?v1728zLUCrYdGUGnoQtIkh/jU8mL5J3QmF6JlSsXk2/O?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b8202a7b-5216-45a3-4c5a-08dd88b01224
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 May 2025 12:59:55.7965 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DRi62gQA+HdaEfwlaqygDm2AUYTrFbAzO+o2kFLlm37XhdTDGgiM0hpiszQAQ2rGF5GnP7gi4EcKS+xM5feCKQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR12MB5919
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

The FWSEC firmware needs to be extracted from the VBIOS and patched with
the desired command, as well as the right signature. Do this so we are
ready to load and run this firmware into the GSP falcon and create the
FRTS region.

[joelagnelf@nvidia.com: give better names to FalconAppifHdrV1's fields]
Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 drivers/gpu/nova-core/dma.rs            |   3 -
 drivers/gpu/nova-core/firmware.rs       |  18 ++
 drivers/gpu/nova-core/firmware/fwsec.rs | 360 ++++++++++++++++++++++++++++++++
 drivers/gpu/nova-core/gpu.rs            |  20 +-
 drivers/gpu/nova-core/vbios.rs          |   3 -
 5 files changed, 396 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/nova-core/dma.rs b/drivers/gpu/nova-core/dma.rs
index 9d90ae01d0044eaab4ddbc3eba216741d7a623ef..a12d0dff574aa38fb5eb8f4d759611af2f8ba3ec 100644
--- a/drivers/gpu/nova-core/dma.rs
+++ b/drivers/gpu/nova-core/dma.rs
@@ -2,9 +2,6 @@
 
 //! Simple DMA object wrapper.
 
-// To be removed when all code is used.
-#![expect(dead_code)]
-
 use core::ops::{Deref, DerefMut};
 
 use kernel::device;
diff --git a/drivers/gpu/nova-core/firmware.rs b/drivers/gpu/nova-core/firmware.rs
index 960982174d834c7c66a47ecfb3a15bf47116b2c5..a2037bfebeac70ced592502fc92af64b9f9aed5c 100644
--- a/drivers/gpu/nova-core/firmware.rs
+++ b/drivers/gpu/nova-core/firmware.rs
@@ -8,9 +8,12 @@
 use kernel::prelude::*;
 use kernel::str::CString;
 
+use crate::dma::DmaObject;
 use crate::gpu;
 use crate::gpu::Chipset;
 
+pub(crate) mod fwsec;
+
 pub(crate) const FIRMWARE_VERSION: &str = "535.113.01";
 
 /// Structure encapsulating the firmware blobs required for the GPU to operate.
@@ -86,6 +89,21 @@ pub(crate) fn size(&self) -> usize {
     }
 }
 
+/// Patch the `ucode_dma` firmware at offset `sig_base_img` with `signature`.
+fn patch_signature(ucode_dma: &mut DmaObject, signature: &[u8], sig_base_img: usize) -> Result<()> {
+    if sig_base_img + signature.len() > ucode_dma.size() {
+        return Err(ERANGE);
+    }
+
+    // SAFETY: we are the only user of this object, so there cannot be any race.
+    let dst = unsafe { ucode_dma.start_ptr_mut().add(sig_base_img) };
+
+    // SAFETY: `signature` and `dst` are valid, properly aligned, and do not overlap.
+    unsafe { core::ptr::copy_nonoverlapping(signature.as_ptr(), dst, signature.len()) };
+
+    Ok(())
+}
+
 pub(crate) struct ModInfoBuilder<const N: usize>(firmware::ModInfoBuilder<N>);
 
 impl<const N: usize> ModInfoBuilder<N> {
diff --git a/drivers/gpu/nova-core/firmware/fwsec.rs b/drivers/gpu/nova-core/firmware/fwsec.rs
new file mode 100644
index 0000000000000000000000000000000000000000..ed5801df4fd5730d74ee59cbdeff35115846ce3b
--- /dev/null
+++ b/drivers/gpu/nova-core/firmware/fwsec.rs
@@ -0,0 +1,360 @@
+// SPDX-License-Identifier: GPL-2.0
+
+//! FWSEC is a High Secure firmware that is extracted from the BIOS and performs the first step of
+//! the GSP startup by creating the WPR2 memory region and copying critical areas of the VBIOS into
+//! it after authenticating them, ensuring they haven't been tampered with. It runs on the GSP
+//! falcon.
+//!
+//! Before being run, it needs to be patched in two areas:
+//!
+//! - The command to be run, as this firmware can perform several tasks ;
+//! - The ucode signature, so the GSP falcon can run FWSEC in HS mode.
+
+use core::alloc::Layout;
+
+use kernel::bindings;
+use kernel::device::{self, Device};
+use kernel::devres::Devres;
+use kernel::prelude::*;
+use kernel::transmute::FromBytes;
+
+use crate::dma::DmaObject;
+use crate::driver::Bar0;
+use crate::falcon::gsp::Gsp;
+use crate::falcon::{Falcon, FalconBromParams, FalconFirmware, FalconLoadTarget};
+use crate::firmware::FalconUCodeDescV3;
+use crate::vbios::Vbios;
+
+const NVFW_FALCON_APPIF_ID_DMEMMAPPER: u32 = 0x4;
+
+#[repr(C)]
+#[derive(Debug)]
+struct FalconAppifHdrV1 {
+    version: u8,
+    header_size: u8,
+    entry_size: u8,
+    entry_count: u8,
+}
+// SAFETY: any byte sequence is valid for this struct.
+unsafe impl FromBytes for FalconAppifHdrV1 {}
+
+#[repr(C, packed)]
+#[derive(Debug)]
+struct FalconAppifV1 {
+    id: u32,
+    dmem_base: u32,
+}
+// SAFETY: any byte sequence is valid for this struct.
+unsafe impl FromBytes for FalconAppifV1 {}
+
+#[derive(Debug)]
+#[repr(C, packed)]
+struct FalconAppifDmemmapperV3 {
+    signature: u32,
+    version: u16,
+    size: u16,
+    cmd_in_buffer_offset: u32,
+    cmd_in_buffer_size: u32,
+    cmd_out_buffer_offset: u32,
+    cmd_out_buffer_size: u32,
+    nvf_img_data_buffer_offset: u32,
+    nvf_img_data_buffer_size: u32,
+    printf_buffer_hdr: u32,
+    ucode_build_time_stamp: u32,
+    ucode_signature: u32,
+    init_cmd: u32,
+    ucode_feature: u32,
+    ucode_cmd_mask0: u32,
+    ucode_cmd_mask1: u32,
+    multi_tgt_tbl: u32,
+}
+// SAFETY: any byte sequence is valid for this struct.
+unsafe impl FromBytes for FalconAppifDmemmapperV3 {}
+
+#[derive(Debug)]
+#[repr(C, packed)]
+struct ReadVbios {
+    ver: u32,
+    hdr: u32,
+    addr: u64,
+    size: u32,
+    flags: u32,
+}
+// SAFETY: any byte sequence is valid for this struct.
+unsafe impl FromBytes for ReadVbios {}
+
+#[derive(Debug)]
+#[repr(C, packed)]
+struct FrtsRegion {
+    ver: u32,
+    hdr: u32,
+    addr: u32,
+    size: u32,
+    ftype: u32,
+}
+// SAFETY: any byte sequence is valid for this struct.
+unsafe impl FromBytes for FrtsRegion {}
+
+const NVFW_FRTS_CMD_REGION_TYPE_FB: u32 = 2;
+
+#[repr(C, packed)]
+struct FrtsCmd {
+    read_vbios: ReadVbios,
+    frts_region: FrtsRegion,
+}
+// SAFETY: any byte sequence is valid for this struct.
+unsafe impl FromBytes for FrtsCmd {}
+
+const NVFW_FALCON_APPIF_DMEMMAPPER_CMD_FRTS: u32 = 0x15;
+const NVFW_FALCON_APPIF_DMEMMAPPER_CMD_SB: u32 = 0x19;
+
+/// Command for the [`FwsecFirmware`] to execute.
+pub(crate) enum FwsecCommand {
+    /// Asks [`FwsecFirmware`] to carve out the WPR2 area and place a verified copy of the VBIOS
+    /// image into it.
+    Frts { frts_addr: u64, frts_size: u64 },
+    /// Asks [`FwsecFirmware`] to load pre-OS apps on the PMU.
+    #[expect(dead_code)]
+    Sb,
+}
+
+/// Reinterpret the area starting from `offset` in `fw` as an instance of `T` (which must implement
+/// [`FromBytes`]) and return a reference to it.
+///
+/// # Safety
+///
+/// Callers must ensure that the region of memory returned is not written for as long as the
+/// returned reference is alive.
+///
+/// TODO: Remove this and `transmute_mut` once we have a way to transmute objects implementing
+/// FromBytes, e.g.:
+/// https://lore.kernel.org/lkml/20250330234039.29814-1-christiansantoslima21@gmail.com/
+unsafe fn transmute<'a, 'b, T: Sized + FromBytes>(
+    fw: &'a DmaObject,
+    offset: usize,
+) -> Result<&'b T> {
+    if offset + core::mem::size_of::<T>() > fw.size() {
+        return Err(ERANGE);
+    }
+    if (fw.start_ptr() as usize + offset) % core::mem::align_of::<T>() != 0 {
+        return Err(EINVAL);
+    }
+
+    // SAFETY: we have checked that the pointer is properly aligned that its pointed memory is
+    // large enough the contains an instance of `T`, which implements `FromBytes`.
+    Ok(unsafe { &*(fw.start_ptr().add(offset) as *const T) })
+}
+
+/// Reinterpret the area starting from `offset` in `fw` as a mutable instance of `T` (which must
+/// implement [`FromBytes`]) and return a reference to it.
+///
+/// # Safety
+///
+/// Callers must ensure that the region of memory returned is not read or written for as long as
+/// the returned reference is alive.
+unsafe fn transmute_mut<'a, 'b, T: Sized + FromBytes>(
+    fw: &'a mut DmaObject,
+    offset: usize,
+) -> Result<&'b mut T> {
+    if offset + core::mem::size_of::<T>() > fw.size() {
+        return Err(ERANGE);
+    }
+    if (fw.start_ptr_mut() as usize + offset) % core::mem::align_of::<T>() != 0 {
+        return Err(EINVAL);
+    }
+
+    // SAFETY: we have checked that the pointer is properly aligned that its pointed memory is
+    // large enough the contains an instance of `T`, which implements `FromBytes`.
+    Ok(unsafe { &mut *(fw.start_ptr_mut().add(offset) as *mut T) })
+}
+
+/// Patch the Fwsec firmware image in `fw` to run the command `cmd`.
+fn patch_command(fw: &mut DmaObject, v3_desc: &FalconUCodeDescV3, cmd: FwsecCommand) -> Result<()> {
+    let hdr_offset = (v3_desc.imem_load_size + v3_desc.interface_offset) as usize;
+    // SAFETY: we have an exclusive reference to `fw`, and no caller should have shared `fw` with
+    // the hardware yet.
+    let hdr: &FalconAppifHdrV1 = unsafe { transmute(fw, hdr_offset) }?;
+
+    if hdr.version != 1 {
+        return Err(EINVAL);
+    }
+
+    // Find the DMEM mapper section in the firmware.
+    for i in 0..hdr.entry_count as usize {
+        let app: &FalconAppifV1 =
+            // SAFETY: we have an exclusive reference to `fw`, and no caller should have shared
+            // `fw` with the hardware yet.
+            unsafe {
+                transmute(
+                    fw,
+                    hdr_offset + hdr.header_size as usize + i * hdr.entry_size as usize
+                )
+            }?;
+
+        if app.id != NVFW_FALCON_APPIF_ID_DMEMMAPPER {
+            continue;
+        }
+
+        let dmem_mapper: &mut FalconAppifDmemmapperV3 =
+            // SAFETY: we have an exclusive reference to `fw`, and no caller should have shared
+            // `fw` with the hardware yet.
+            unsafe { transmute_mut(fw, (v3_desc.imem_load_size + app.dmem_base) as usize) }?;
+
+        // SAFETY: we have an exclusive reference to `fw`, and no caller should have shared `fw`
+        // with the hardware yet.
+        let frts_cmd: &mut FrtsCmd = unsafe {
+            transmute_mut(
+                fw,
+                (v3_desc.imem_load_size + dmem_mapper.cmd_in_buffer_offset) as usize,
+            )
+        }?;
+
+        frts_cmd.read_vbios = ReadVbios {
+            ver: 1,
+            hdr: core::mem::size_of::<ReadVbios>() as u32,
+            addr: 0,
+            size: 0,
+            flags: 2,
+        };
+
+        dmem_mapper.init_cmd = match cmd {
+            FwsecCommand::Frts {
+                frts_addr,
+                frts_size,
+            } => {
+                frts_cmd.frts_region = FrtsRegion {
+                    ver: 1,
+                    hdr: core::mem::size_of::<FrtsRegion>() as u32,
+                    addr: (frts_addr >> 12) as u32,
+                    size: (frts_size >> 12) as u32,
+                    ftype: NVFW_FRTS_CMD_REGION_TYPE_FB,
+                };
+
+                NVFW_FALCON_APPIF_DMEMMAPPER_CMD_FRTS
+            }
+            FwsecCommand::Sb => NVFW_FALCON_APPIF_DMEMMAPPER_CMD_SB,
+        };
+
+        // Return early as we found and patched the DMEMMAPPER region.
+        return Ok(());
+    }
+
+    Err(ENOTSUPP)
+}
+
+/// Firmware extracted from the VBIOS and responsible for e.g. carving out the WPR2 region as the
+/// first step of the GSP bootflow.
+pub(crate) struct FwsecFirmware {
+    desc: FalconUCodeDescV3,
+    ucode: DmaObject,
+}
+
+impl FalconFirmware for FwsecFirmware {
+    type Target = Gsp;
+
+    fn dma_handle(&self) -> bindings::dma_addr_t {
+        self.ucode.dma_handle()
+    }
+
+    fn imem_load(&self) -> FalconLoadTarget {
+        FalconLoadTarget {
+            src_start: 0,
+            dst_start: self.desc.imem_phys_base,
+            len: self.desc.imem_load_size,
+        }
+    }
+
+    fn dmem_load(&self) -> FalconLoadTarget {
+        FalconLoadTarget {
+            src_start: self.desc.imem_load_size,
+            dst_start: self.desc.dmem_phys_base,
+            len: Layout::from_size_align(self.desc.dmem_load_size as usize, 256)
+                // Cannot panic, as 256 is non-zero and a power of 2.
+                .unwrap()
+                .pad_to_align()
+                .size() as u32,
+        }
+    }
+
+    fn brom_params(&self) -> FalconBromParams {
+        FalconBromParams {
+            pkc_data_offset: self.desc.pkc_data_offset,
+            engine_id_mask: self.desc.engine_id_mask,
+            ucode_id: self.desc.ucode_id,
+        }
+    }
+
+    fn boot_addr(&self) -> u32 {
+        0
+    }
+}
+
+impl FwsecFirmware {
+    /// Extract the Fwsec firmware from `bios` and patch it to run with the `cmd` command.
+    pub(crate) fn new(
+        falcon: &Falcon<Gsp>,
+        dev: &Device<device::Bound>,
+        bar: &Devres<Bar0>,
+        bios: &Vbios,
+        cmd: FwsecCommand,
+    ) -> Result<Self> {
+        let v3_desc = bios.fwsec_header(dev)?;
+        let ucode = bios.fwsec_ucode(dev)?;
+
+        let mut ucode_dma = DmaObject::from_data(dev, ucode)?;
+        patch_command(&mut ucode_dma, v3_desc, cmd)?;
+
+        const SIG_SIZE: usize = 96 * 4;
+        let signatures = bios.fwsec_sigs(dev)?;
+        let sig_base_img = (v3_desc.imem_load_size + v3_desc.pkc_data_offset) as usize;
+
+        if v3_desc.signature_count != 0 {
+            // Patch signature.
+            let desc_sig_versions = v3_desc.signature_versions as u32;
+            let reg_fuse_version = falcon.get_signature_reg_fuse_version(
+                bar,
+                v3_desc.engine_id_mask,
+                v3_desc.ucode_id,
+            )?;
+            dev_dbg!(
+                dev,
+                "desc_sig_versions: {:#x}, reg_fuse_version: {}\n",
+                desc_sig_versions,
+                reg_fuse_version
+            );
+            let signature_idx = {
+                let reg_fuse_version_bit = 1 << reg_fuse_version;
+
+                // Check if the fuse version is supported by the firmware.
+                if desc_sig_versions & reg_fuse_version_bit == 0 {
+                    dev_warn!(
+                        dev,
+                        "no matching signature: {:#x} {:#x}\n",
+                        reg_fuse_version_bit,
+                        v3_desc.signature_versions
+                    );
+                    return Err(EINVAL);
+                }
+
+                // `desc_sig_versions` has one bit set per included signature. Thus, the index of
+                // the signature to patch is the number of bits in `desc_sig_versions` set to `1`
+                // before `reg_fuse_version_bit`.
+
+                // Mask of the bits of `desc_sig_versions` to preserve.
+                let reg_fuse_version_mask = reg_fuse_version_bit.wrapping_sub(1);
+
+                (desc_sig_versions & reg_fuse_version_mask).count_ones()
+            };
+
+            dev_dbg!(dev, "patching signature with index {}\n", signature_idx);
+            let signature_start = signature_idx as usize * SIG_SIZE;
+            let signature = &signatures[signature_start..signature_start + SIG_SIZE];
+            super::patch_signature(&mut ucode_dma, signature, sig_base_img)?;
+        }
+
+        Ok(FwsecFirmware {
+            desc: v3_desc.clone(),
+            ucode: ucode_dma,
+        })
+    }
+}
diff --git a/drivers/gpu/nova-core/gpu.rs b/drivers/gpu/nova-core/gpu.rs
index 8d470a810ec7a04cbee1645fc9c32607d2ad8b8c..f5ff319db39521cd8ea331bedc27536f7562a5f7 100644
--- a/drivers/gpu/nova-core/gpu.rs
+++ b/drivers/gpu/nova-core/gpu.rs
@@ -6,6 +6,7 @@
 use crate::dma::DmaObject;
 use crate::driver::Bar0;
 use crate::falcon::{gsp::Gsp, sec2::Sec2, Falcon};
+use crate::firmware::fwsec::{FwsecCommand, FwsecFirmware};
 use crate::firmware::Firmware;
 use crate::gsp::fb::FbLayout;
 use crate::regs;
@@ -196,7 +197,11 @@ pub(crate) fn new(
         bar: Devres<Bar0>,
     ) -> Result<impl PinInit<Self>> {
         let spec = Spec::new(&bar)?;
-        let fw = Firmware::new(pdev.as_ref(), spec.chipset, "535.113.01")?;
+        let fw = Firmware::new(
+            pdev.as_ref(),
+            spec.chipset,
+            crate::firmware::FIRMWARE_VERSION,
+        )?;
 
         dev_info!(
             pdev.as_ref(),
@@ -244,7 +249,18 @@ pub(crate) fn new(
         let fb_layout = FbLayout::new(spec.chipset, &bar)?;
         dev_dbg!(pdev.as_ref(), "{:#x?}\n", fb_layout);
 
-        let _bios = Vbios::new(pdev, &bar)?;
+        let bios = Vbios::new(pdev, &bar)?;
+
+        let _fwsec_frts = FwsecFirmware::new(
+            &gsp_falcon,
+            pdev.as_ref(),
+            &bar,
+            &bios,
+            FwsecCommand::Frts {
+                frts_addr: fb_layout.frts.start,
+                frts_size: fb_layout.frts.end - fb_layout.frts.start,
+            },
+        )?;
 
         Ok(pin_init!(Self {
             spec,
diff --git a/drivers/gpu/nova-core/vbios.rs b/drivers/gpu/nova-core/vbios.rs
index 719752fc54f1ec4b8dcc9a3c044a2925a187dd2a..880f77182691b71dec449448b60d939adb01c2dd 100644
--- a/drivers/gpu/nova-core/vbios.rs
+++ b/drivers/gpu/nova-core/vbios.rs
@@ -2,9 +2,6 @@
 
 //! VBIOS extraction and parsing.
 
-// To be removed when all code is used.
-#![expect(dead_code)]
-
 use crate::driver::Bar0;
 use crate::firmware::FalconUCodeDescV3;
 use core::convert::TryFrom;

-- 
2.49.0

