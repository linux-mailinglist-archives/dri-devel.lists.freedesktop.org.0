Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3079EAD7B8A
	for <lists+dri-devel@lfdr.de>; Thu, 12 Jun 2025 22:00:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 52DEB10E03D;
	Thu, 12 Jun 2025 20:00:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="WvqxjchO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2041.outbound.protection.outlook.com [40.107.243.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E75110E176;
 Thu, 12 Jun 2025 20:00:23 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Y2TJsAl6kIHDn9yFoNFsJtWHsnCkZlWij2L/JhbI9NP4w60GlHV2PTGm0usF8pCPxQNvp2oGYZafR5OBsZGJQYHPLDFjLQMBIRjPwt2Zmf7ao0XakcpmyNt9yRiv0MLNekuROgWMZi8l+AhR7oxcjGi4GJJmV5KEsfSwsSyJm1GWWXWLkNzumCwofi3Nory4D18ZS3146FMB6f1f/JFY7BKhIocO6c6TXAyOeroPuIidEubwEJtvjS5KwUx5766f9WonLzJRLQeuxvn9/SEM5/T+9j0LB9JAVYanV5RsICKjM09yaIdqkUiuksUPnJnv3JqnkQBCoydlmCz4D1nxjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YheRLQg20VPmXEKDd+fhP14H/yp8urqQolgJ0YXCfqA=;
 b=gdOWCerVASGVm3IYvqU5gIge4mydxzjWiFm14gflGekzZkMCgNsjDu7h3q3lOb5azXcw9qrUpn0w5cKrYCvqmCytsm/gsWo9KjJCeli4RA8v6fENw8KEC8H3zgAErd4hhQJXaBMYSjvCybMZPxNnfF2nj6Vn22vcvF0PJpo8uQPSppwi//1oFkFy8py/XMDZIg9sv9I6s+Yud1qokniQfnEE0eUUqC5jh5L3RsE9Rm8s1SZNyW5zFU/qkqpcS/Pz5sGqIq52PtyYSJNECu/6tOaAwL+DzKKHtCha2F9YkfcT5irwEHK86HPfSMZ+qCuI3kmCBufRteFNGUh4Y6ohmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YheRLQg20VPmXEKDd+fhP14H/yp8urqQolgJ0YXCfqA=;
 b=WvqxjchOG1HCta8F/rLJyGe0DhURbf6B1vjzQcNCPtBh0izFeqNDD983IBu7sRZrCdRs6jKnuNozLmswmMp4P3TWqdgtPShfvWHUiiX/IwZlKwjviujMvdn6COy1ZIutIqwsBzl5zivVjCHqUP/3FwfxDC167FowarymX94wftGvvGQFQi6wutukdvDIB8yIsLY8ZpEfii5g6ZPlA0A3s9qHcTnh25b1C4D2/+pYNLdhKytPYST6Xe3qBgTo4YmErYTrzkWP3Z2mUsLJTCoBRLJOjEUmDG1Kt0SzlIgs/ts4eo1enM/vuqAV0EvaEz9W9nHvf0E3KK+Hr9uU04OHrg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV2PR12MB5968.namprd12.prod.outlook.com (2603:10b6:408:14f::7)
 by PH7PR12MB5831.namprd12.prod.outlook.com (2603:10b6:510:1d6::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.19; Thu, 12 Jun
 2025 20:00:16 +0000
Received: from LV2PR12MB5968.namprd12.prod.outlook.com
 ([fe80::e6dd:1206:6677:f9c4]) by LV2PR12MB5968.namprd12.prod.outlook.com
 ([fe80::e6dd:1206:6677:f9c4%4]) with mapi id 15.20.8792.035; Thu, 12 Jun 2025
 20:00:15 +0000
Message-ID: <f8d9af76-fc1d-4f7a-8dfb-a0606e44c56b@nvidia.com>
Date: Thu, 12 Jun 2025 13:00:12 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 04/23] rust: add new `num` module with `PowerOfTwo` type
To: Boqun Feng <boqun.feng@gmail.com>, Alexandre Courbot <acourbot@nvidia.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 Danilo Krummrich <dakr@kernel.org>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Benno Lossin <lossin@kernel.org>, Ben Skeggs <bskeggs@nvidia.com>,
 Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>,
 Alistair Popple <apopple@nvidia.com>, linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
References: <20250612-nova-frts-v5-0-14ba7eaf166b@nvidia.com>
 <20250612-nova-frts-v5-4-14ba7eaf166b@nvidia.com>
 <aErtL6yxLu3Azbsm@tardis.local>
Content-Language: en-US
From: John Hubbard <jhubbard@nvidia.com>
In-Reply-To: <aErtL6yxLu3Azbsm@tardis.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR03CA0220.namprd03.prod.outlook.com
 (2603:10b6:a03:39f::15) To LV2PR12MB5968.namprd12.prod.outlook.com
 (2603:10b6:408:14f::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5968:EE_|PH7PR12MB5831:EE_
X-MS-Office365-Filtering-Correlation-Id: a7efdc74-cf43-484b-e5fb-08dda9ebbfa9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RWdFS1g0TTkwUHlYbStONlhPYWpDNURRdzVXUitGb2VhOHVIL0VmZ3RzWHBK?=
 =?utf-8?B?SGFMTjhKRUVOYXVOTHRqZGVKTnEva2FFU3JuNDA0OTBjZmJNYS9jVTNFRnRF?=
 =?utf-8?B?eXRQSnNCd3FWZjduL2RuSzB4RlVuV3BuQkRZNy8vOVdTY2VGQUVjbUN5ZjEy?=
 =?utf-8?B?cXZzbkZsaUI2ZzNzalFOYW1yT2l2TTJOYTFycEpTS25qaHFrZTUrNFZ0TERz?=
 =?utf-8?B?RDNtK1B6L0F6M1Q3Ui94SitZNlg1emRmSER6RUExZ1Q1aDdoQnliWUhwSld5?=
 =?utf-8?B?YVBpZVJER0Voa3Y1NjVJMFpjUEhUMG55ZlM3a1dST1lUZ0NteGZkd2FJSlBs?=
 =?utf-8?B?MG1vV0dpQ2lCZVZMbWVRYUNGL2lwa055aXgzY2JzOGQ1eWRBUWhRQXdCVi90?=
 =?utf-8?B?b05lY2M1Tlo3V1VsOHl3MkZqZDB3OEtOc2t2MmxTZXVDRVFLaWVGOEVQMnRs?=
 =?utf-8?B?ck5ueUJiRFpSMnVleTMxYzhWdXNJMVVhWlJEbC80NHFORUpSYmZ3amdUcE1k?=
 =?utf-8?B?VHN3U1I2b3A0b0tNRE1HWkIzcDVlU1JxVTFIRi9lQlZobEdpcFRDMXlnNlNE?=
 =?utf-8?B?UU84dVBwc1FYYlVhQzlNU0JhYmJlNWpHT0N0OTU4WlIvOXA3eG9nV1hVVm5Y?=
 =?utf-8?B?NDhSNkpEZlI4OXgyTlUwTUNvS0h1VzBPclJWdFJwUUZaLzM0TXJXSXk5SjMx?=
 =?utf-8?B?emZlWWlIYTU2Qks4M0Rwb1VaTGtreDU2Znc1ZEN3YlFwU09vVCtDM1N5UFJT?=
 =?utf-8?B?VENib1BBeGRzM2sxbkQyVkw2bmZnTFpBT3hwYnkrd2ltVGxadTNRVENZem1a?=
 =?utf-8?B?M2M4V0FmQ3BvMUtkeDJpNjJoQXliejZITlIrek8vN25KdGRPQUFtRDZnYjRM?=
 =?utf-8?B?TEMrSVRPZUZZZkJDMTBVUWRRK2cvMW0wZlloQXhRSFRQdXI3SVlPNlpTMndz?=
 =?utf-8?B?WlpldlpJUFVZSm9WOXExekkycWNGOEJORHhuZW8rQ29zTG9Hc1BOd0pXcXpK?=
 =?utf-8?B?VzZhOHpLZndhdVZEdUpNNkhjZ0lhSVlmdWhvQ041ZkJqYUFDQ0ZnZGpsMjh1?=
 =?utf-8?B?bEV6d3pHKy9yakhoQ1dUVWxrUWFQb2YxOTVveCtJTTRxTzN1eEFSUzRjRkZB?=
 =?utf-8?B?RFRyU3V5bTJJOFVzaXRObS9NUUJiWTNEZHptcmR4dVhpL0RxMkVqMmh0NVFF?=
 =?utf-8?B?am85ZGpsYVdnaWhBV1VWUDQvM3BEK2U3UzBYMHZGRHJ3bitXQWhudXVHTzVW?=
 =?utf-8?B?aGd0TGRFNTVBN3NFdU55eWZTWkN5ditWbEpXYmlKMjMzL251UzU1R1d0dDds?=
 =?utf-8?B?SHJqMHZnT3lCd1N6bjBtaTJVeW1JNjdNRzQrblE3QzRDVkNWZE1ORE8rYTNE?=
 =?utf-8?B?ZUlTY2FkTkNUUGJtcGNEZVV2WE83cEV4Wks2WDgyQWFRSmRzazR5ZDFzR2lq?=
 =?utf-8?B?YVE4dHdwSlBrblpmR2RmSTRFNkMwWDdZKzFRYncwdGtLSzk3eW9KY1lGZWk2?=
 =?utf-8?B?dFFsK0hGU2o4dXpad0I3MGFlcnk0dXBnRnhValV4NUpSdnBYTnhWNXE3bEph?=
 =?utf-8?B?WVJSVE5lV3JBbFlCUkV3VnlNSitCOU03TFpHeDFTdnVZYTJ0RDJneTJoK0ZS?=
 =?utf-8?B?VUN6TG1oSTgzUmFBUE9UOWliYnE5cE9nMmk4MTJOK1N3RFd2Rm5yTGFmU1Fp?=
 =?utf-8?B?NGFhd3VyYjlhRzloQVVWU2x5aDg5UEw5eU53MUUyQm92dVZydlN0aU5Dekcx?=
 =?utf-8?B?TTVMaDZDSUxONTkxbDJWMkFKcHdLTVk1Vy94RC9zOXJFWm1seXhaUC9ZRU0y?=
 =?utf-8?B?YW1VQTcvbGNuM0dCZUw0Y2dXYUdrS1BiQ1pSNVBlVDltem1udG5SaGZhczdw?=
 =?utf-8?B?ZTBJcm1WcWJuU2FtSmt5ajVmV1g5cXZzQ3I4QjJlVTRxZlZGSDNWeEZoRDNK?=
 =?utf-8?Q?SmXx5rW3Zx8=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV2PR12MB5968.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Q1FxYzVYYmlqVW5sclRBV2ZVUlNkM3hzMG1NTFlIQ2R6WDN1amlZR1J5TVpl?=
 =?utf-8?B?eGpqK2pYMVNqYXRsWmxKdlNBVjV5bXA3dk9NVURHSzFBZ1hxbEtPdlZUTDdx?=
 =?utf-8?B?TmErMkRobGE0S3c3K2VQMUJOQ2pPcWpoQU1ycm8vRkpWdDdEalY0VzNsZmg3?=
 =?utf-8?B?YjhJZk5odWxtMHY4NkNXMStUcTRtbmNMNXNoK2J6SHErUXZxRmNzN0U4Unkv?=
 =?utf-8?B?ZVpUeWd6TE9MTWVtV0JEOXNrdzZQcjdkcXpXbTBSVFd2QWlpQTVQQ3kwcmdr?=
 =?utf-8?B?VzFQRzZQR1I4c3Y4TmIyRnIvYURvTzlPMnNQNEd6N2QrY3Zub0ZraDdBNXVw?=
 =?utf-8?B?OU13ditybzdOUkhkNnFlN1BIUXorU3JYd2ZyUlIzNktwNjdWejZrYXBLZ2xa?=
 =?utf-8?B?VFMyT0R4RFZZQ2tvdlFMU2FaREhXbmFPczJBbmJJZTNPRmc3MC9zSnNIblVt?=
 =?utf-8?B?eDNQOVJKTEZDUGdjU2ZybmhLZkZVMUJ6b2puakVJUTIyOFdKa3RINlRSaTFu?=
 =?utf-8?B?T0E0YXV1N3QwbDFHZzZUUWNkRE45aVI1WmFjNElCeURYK1c5UHJMc0pOOFN4?=
 =?utf-8?B?dHIzWk8zVjNOQm5PS0VHalBocEZGcnZ0NjVPY0JISnNnSmZsYTBVWDV4cWtK?=
 =?utf-8?B?YlRIMFRVWCtRMldjZ2thSTV2cmRxMERpL1d4RXRiWDgzNDlIZzVQaTJ5TGhu?=
 =?utf-8?B?aWJRSm9WVkR3SzYxNjNlRlZsL1dBRkZhdmtFVUtOR3MxdkYyWXFBaFhWRDNC?=
 =?utf-8?B?dkxPbWNjMnc1YW1MNUU3NjlOWmpjSis4VlRva2phdWk5Nk9zTE1HQVlOUFY2?=
 =?utf-8?B?NmdTOWFwOVBqRGYyZ0t4aWhyN0d3YzNYOU5rVDBwWVNnakYwenBYY0VWSm9x?=
 =?utf-8?B?SkhBZlFSeWxDUWxsN3BUNStudEZ0YzJPTnFWWTYycTB4YnVQNXBEK3RwZXlX?=
 =?utf-8?B?RFhwUVRYSU9aWW0xeUg1aGNFUm1VQjB6WGQ4eGxrWi9IRENzYnBWekhHdFgx?=
 =?utf-8?B?SFNUZDFSVUJmZk1TWlRZcmpKbWV1ZUgzdU5hTElTcGoybnNWWU80cDNCcS85?=
 =?utf-8?B?Y3RtVm1zajRWTy92YTJLYjJyS2JSQnlDbWY3TUxqdC8xZGFmekhGb1ZPdGxi?=
 =?utf-8?B?OFBEaGEvUFN4Ry9JRlBjNHBPYmtiSlhseHE5dVVPdVplKzZqR29JREhZejRQ?=
 =?utf-8?B?MENQUk9hajF0V1RpOUlWSER1TFVrVE13a2htTUg4Z3hxQWdMdnptc24rUUNI?=
 =?utf-8?B?TC85WWw1bTdxdlVlVDVlZHoyOTRVK3JaQ2pqTUJ5OGRic0lKNVhaODFsYlNL?=
 =?utf-8?B?TnFuOXZtQzMzU1UyQ0owTTlvRjdlOEpiOFMwY0pMbG5JVnkrNm11WG1VL1dI?=
 =?utf-8?B?QzRVb0piNnB4ZCtYS0o1aGZMeHdLVWRhYUwxNDhUWHdnZ2dGL2EzNkE2QmxZ?=
 =?utf-8?B?ajcvVmMybExKSWZzaDJWNUczVS83SmFVWi9GYXRpeEU5elNNNHRrSFZuZXZu?=
 =?utf-8?B?WUhkM0p1bjd1RmdVekcxNXpiUGtOdFFsVkk2N25ySENGNVRsZjluOTVBLzhF?=
 =?utf-8?B?N0xCRDlGNm92V1I3WEhPL2ZtdWYwL1o5UFBxV3FnbnpFL2R4MVdaazJNTUZ4?=
 =?utf-8?B?MFZRTkdZNXpVUXZCUjlpdjZSc3pDTktYcFRWbENma2dzS3dVZlZ0WWhUVWVE?=
 =?utf-8?B?c0JGNXVYWGZYTFFyMngvMEdjazgxY1Z4Z1doVnhLeWVUMVBwS0Q0bHBQK3dN?=
 =?utf-8?B?c0w3WEFCbEF1SXM2aXN4bXFuVm51cGkrYnBFM3B1c1Z6a2tsa096emkrczZ1?=
 =?utf-8?B?YmxTQVVJbWhreFBNeEt0NnNKRHRxQUdGSFE2emZzZUdEUm1iN1ozUUdZdnU1?=
 =?utf-8?B?U1FrRUhXSEJGVzBJSnVaQTRtMnk5VUwrN3h0TjZZZ0NJNkRYb3d4NWwveHF6?=
 =?utf-8?B?cmZBaUlGTDJrbVpTVytJYlFwNW9FQ0FxVWpHL1gyYjFnVCtsYkFycG5TTGJ2?=
 =?utf-8?B?NEVCUWJYaFY0TVphazZhSVQ1ZzYzSDdjSXlxTHh6WVFpWndEc0ZFZWJUWXRa?=
 =?utf-8?B?Q1MwVnk0czhWNlVjR3NIWk8zUHBNaUxYdkF5VzB5cklmWjV0QTIwOXFxQzFt?=
 =?utf-8?Q?ui35t7aQa/YhTU3keb+B1AWz1?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a7efdc74-cf43-484b-e5fb-08dda9ebbfa9
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5968.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jun 2025 20:00:15.7508 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QVIfdjfw11QGpXberpYMy54uGbEbIoL5TKlIN78sie2ciPfJaC5SUz/JxRr3wCqe7bn4FMhJyR+qjW2wZo3M1w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5831
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

On 6/12/25 8:07 AM, Boqun Feng wrote:
> On Thu, Jun 12, 2025 at 11:01:32PM +0900, Alexandre Courbot wrote:
...
>> +                #[inline(always)]
>> +                pub const fn align_down(self, value: $t) -> $t {
> 
> I'm late to party, but could we instead implement:
> 
>     pub const fn round_down<i32>(value: i32, shift: i32) -> i32 {
>         value & !((1 << shift) - 1)
>     }
> 
>     pub const fn round_up<i32>(value: i32, shift: i32) -> i32 {
>         let mask = (1 << shift) - 1;
>         value.wrapping_add(mask) & !mask
>     }

Just a naming concern here.

The function name, and the "shift" argument is extremely odd there.
And that's because it is re-inventing the concept of align_down()
and align_up(), but with a misleading name and a hard to understand
"shift" argument.

If you are "rounding" to a power of two, that's normally called
alignment, at least in kernel code. And if you are rounding to the
nearest...integer, for example, that's rounding.

But "rounding" with a "shift" argument? That's a little too 
creative! :) 

> 
> ? It's much harder to pass an invalid alignment with this.

Hopefully we can address argument validation without blowing up
the usual naming conventions.


thanks,
-- 
John Hubbard

