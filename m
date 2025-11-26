Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EBA4C8B690
	for <lists+dri-devel@lfdr.de>; Wed, 26 Nov 2025 19:17:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2FC1B10E6C7;
	Wed, 26 Nov 2025 18:17:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="CbaCpDWH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CH5PR02CU005.outbound.protection.outlook.com
 (mail-northcentralusazon11012018.outbound.protection.outlook.com
 [40.107.200.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 896A710E2BF;
 Wed, 26 Nov 2025 18:17:14 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JNxjrzhA8fPfPDJWxQ4rvJZVjEzdX3YHpLDxCuZjVt1uaxnseSEndzsmXphvnidZNXSiqwXLwD6WAox3ldIMgHn5BoYPyOfdvPF1SW7ZOQxjXIriiVelgySmIBwhvH5av62mcMMaFXSUj3f6ReYUWhOix4H0Jda/YtNPpCD1p3D/HCsE6PbM+l8D5zw81qC6JtPYDDr6wH8u6yyb6oyiX03R9PJOYRPnSdg2bmeLCIv1z0g66S1RFxIJAN8avJdD9Ezm2D8J3F9d6uOuPMSLjqbzzTsFou1KAc6AIEOGsIekr7ljl4lxsY4Rob7crt8NUH1dzqSpQs3k+Xq379E1dA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v01iSh7u7uCjfRlMI69rPQEXjFA7fr5UCZcZp/eCk/o=;
 b=CCVvOXpaLJnD8uIu1gznrklmF0nUbzjdd5luUtLooZ4e1/uzDLo+JHfvUwN2MWVbMKnptSE3BzGrlyUw5NEkF9f1YAhdLuM7hWuvMZG1m7Nkoex55U6fl6q7qJnm97i+2SGt0d4NeN7Rs9NU7Tg99OAtdT3XbrPZqDagPIRHFLa3o12xMQeBx2B49GL4TEK2YPZw+sP6GgvvCzeNfhHbEf+GvPB1DPVoD7oAhHiH2s8UGdDd7HhtlxdiJSwY3IXRqwYe35kMBOxOzoALPPmJ3yhdhfcYqIqn6JZljz4XgMvC6yLrAKlGVNqsidx31ghynFf5SQ9t7oh06Z8uoi7E8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v01iSh7u7uCjfRlMI69rPQEXjFA7fr5UCZcZp/eCk/o=;
 b=CbaCpDWHjI2hNXi7kY+vbpFQd2+Yi+RH4oOThtIaNLL+2C4G+WZn4va3BXiEg5vYuvd8zbZRBog2kCJzDimlaDT6lIRNE9UOBBBIGLkK+l/GXIbmQ7H2977nEhoGCer320atcCidoN6wN0pbG1bNkyu3/9UYGwCqUWnJJjdR9o9Iqwi/LRo3s6OctZE/LDG8hFBazsAi1CGzKqOGHcJ/1uhu2v9ymKlWVrd69oSdr05kkR7F/EhfZxLwI6/i1i/8EJpOqyQd0afzYx750aEoRgw8IGpioLuqo+9ZNCveRk5Zw+wieHaiOjuM5OSNWHzBjrYLtYl9x2O7VkSEIuusyA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 CH2PR12MB9493.namprd12.prod.outlook.com (2603:10b6:610:27c::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9366.12; Wed, 26 Nov 2025 18:16:07 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%7]) with mapi id 15.20.9366.009; Wed, 26 Nov 2025
 18:16:07 +0000
Message-ID: <078310e7-b385-4694-bae8-5f53ff11091b@nvidia.com>
Date: Wed, 26 Nov 2025 10:15:47 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] rust: helpers: Add list helpers for C linked list
 operations
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Alexandre Courbot <acourbot@nvidia.com>,
 Joel Fernandes <joelagnelf@nvidia.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "rust-for-linux@vger.kernel.org" <rust-for-linux@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "dakr@kernel.org" <dakr@kernel.org>, "airlied@gmail.com"
 <airlied@gmail.com>, Alistair Popple <apopple@nvidia.com>,
 "ojeda@kernel.org" <ojeda@kernel.org>,
 "alex.gaynor@gmail.com" <alex.gaynor@gmail.com>,
 "boqun.feng@gmail.com" <boqun.feng@gmail.com>,
 "gary@garyguo.net" <gary@garyguo.net>,
 "bjorn3_gh@protonmail.com" <bjorn3_gh@protonmail.com>,
 "lossin@kernel.org" <lossin@kernel.org>,
 "a.hindborg@kernel.org" <a.hindborg@kernel.org>,
 "aliceryhl@google.com" <aliceryhl@google.com>,
 "tmgross@umich.edu" <tmgross@umich.edu>, "simona@ffwll.ch"
 <simona@ffwll.ch>,
 "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
 "mripard@kernel.org" <mripard@kernel.org>,
 "tzimmermann@suse.de" <tzimmermann@suse.de>, Timur Tabi <ttabi@nvidia.com>,
 "joel@joelfernandes.org" <joel@joelfernandes.org>,
 "elle@weathered-steel.dev" <elle@weathered-steel.dev>,
 "daniel.almeida@collabora.com" <daniel.almeida@collabora.com>,
 Andrea Righi <arighi@nvidia.com>, "phasta@kernel.org" <phasta@kernel.org>,
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 Nouveau <nouveau-bounces@lists.freedesktop.org>
References: <20251111171315.2196103-1-joelagnelf@nvidia.com>
 <DEHV08MPF9CH.1GZAWEGC4AVF3@nvidia.com>
 <095D38BD-A8AA-4BC3-8C24-9454964EB8F8@nvidia.com>
 <DEI89VUEYXAJ.1IQQPC3QRLITP@nvidia.com>
 <540391dc-caaf-4ca9-9729-e3147bed3100@nvidia.com>
 <CANiq72n0mW6wSWvk4=R41BK=RWbpeXXjea-c1FZMs8y3sE6bug@mail.gmail.com>
Content-Language: en-US
From: John Hubbard <jhubbard@nvidia.com>
In-Reply-To: <CANiq72n0mW6wSWvk4=R41BK=RWbpeXXjea-c1FZMs8y3sE6bug@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR13CA0228.namprd13.prod.outlook.com
 (2603:10b6:a03:2c1::23) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|CH2PR12MB9493:EE_
X-MS-Office365-Filtering-Correlation-Id: 828a83fe-e47b-46aa-d46f-08de2d17de3f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|7416014|376014|10070799003|1800799024; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Z1hxVzhVeU1pbDUwNzNPSFYrSTlGZ1AzL3ROVkV0eDAwaGlnRTV1Z1JTa2Fv?=
 =?utf-8?B?QUlLYmxNSUtVOENaVWx5RDNWZmZ2NE5MYmRpdllMdEsrMkpxOHNMaTFCcTJW?=
 =?utf-8?B?OWMxUDc5OFNpR3ZpUFpSQ0Zha2M3MnNwQ0labFNiQW5Zb2l1WDRmUHNDSSsw?=
 =?utf-8?B?WVNCMnhXeWxzV2J3YW42RnJCWXZ2K09HQ216NWtMcE11Z1dJMnFYNXoveXJK?=
 =?utf-8?B?QkpMY3RNandid1lpbVo3dmVUT2szb3NMZkdxZ25iMnZMVUZlYXZsSitRL1Bz?=
 =?utf-8?B?MXVNa3NlR1lyamEzSDFvYUFLcTJQb3U4RTcvRlp5aHpKZ3F0Z2hIMmthN1Bx?=
 =?utf-8?B?bDZKdERTSnBBQWlTU1NNRFkvM0xDSHV0aHF6R1UvUjR5Z2Y4dzgreEJYWmZH?=
 =?utf-8?B?aUZXUnUydHRKYjgxWkNLT2c1YWQ4WnpFd0tVU2tLa3NkY08zVlhmZkFHQmpZ?=
 =?utf-8?B?a1VKbnhYRzc3aGpGTHg5RE9vWGxmUHJOSk5DdjAxSFY0WFFtaDBFRmF3S25i?=
 =?utf-8?B?enIrYUJLTTJMR1NyV3Q5OHNJaFlZR0Z3V2ZPL3hlMElNdUc4NFNFem1pdWkw?=
 =?utf-8?B?ZkdCSXdJREFEM0lrOGk4Rks1amdjcVdjSzc1eXJIS245dUdHSEV5Uks4RmdV?=
 =?utf-8?B?WnYzQ3g4WUU4Zm14Z3JRSHhqbmtvU1RlYnVoaElHbEw3dDB6RVEvQnRLS3BI?=
 =?utf-8?B?ZUs5bDQyOHBCbmdzWC9kSDE0TUUya2tLWEsrYU02RU1qS3NQYkRFbmQ3djlq?=
 =?utf-8?B?L0hzR0NFWWlGS1FsSVI0WG9aWDFoaS9FbnlPanBUbW1zZHRWZ3BjYkRNYy9G?=
 =?utf-8?B?VGVNZzVGc0ZrdWJHbUQ1ZFZBaGJLeHAyd05BbnZxNitubVBtMEpMbGxza0Ez?=
 =?utf-8?B?cVVqYTJLZHk2Y1UrU3N0TWgwbUExY0IvZE1XL1RpQ3AyOTZvRlZhV2F1emU2?=
 =?utf-8?B?bkU5VEV0aExnaFJrakpaZHJlSnhRczYzVVMzanVwTlJ0TTNKMjhDdHlWQ0U2?=
 =?utf-8?B?L29Ta1h1Q1V3QWhVdlBuaEpvaHdYc2VqRms0Zk9xcDR0YzZtWFcwN2RmM3Iv?=
 =?utf-8?B?UWlKellRWHJQck5wUU55LzJFZDZBQXQwUjhGOFRUUmc5RE83L0tRRHZpWWdj?=
 =?utf-8?B?V082K2tyY0pKQndmZkNGNWlkYTMzZUhSNTEzbXVHZzNSME1waEx2WXljSVZQ?=
 =?utf-8?B?TzBteVJiTU1GK1ErUmhSY1JTaFZ2azZBcUZkMUdnUHJSanNDL1h4Ny9ub3Bo?=
 =?utf-8?B?aXlmYjhsRE91UTFtMkFrSWorRUJ1dTNQRDFVZHVqb3R2Uys4UjBvUHl3c3FD?=
 =?utf-8?B?b09SMCtIaERWUVhZbEZUbnRZeWZKQ3NjZFY1bDhKWHlnRmFncFlrUmNVOUFB?=
 =?utf-8?B?dFUxdmthY3BzTHRjdzNKL3VLalRDTGEwVldueDM2SWpEWnRteDdid2tMVEJp?=
 =?utf-8?B?citUSERsRnV1dkxHeW01Mk1QOGNJdXlSWGhGK0RnQ0hvRTlVTENSM3A1NGJs?=
 =?utf-8?B?clhFdnpvVUNhVTJiWU1SSXpCL0t0ejdhdm9ORVNDSjE3NTJ5SXpFU3ovbTNs?=
 =?utf-8?B?TFZ1RWxOYWEwd0VDV0g4U2Q3U2o4TnpoUEVFck9jZUZZbXRyb29SS1YwOW9K?=
 =?utf-8?B?K3E4d1V4aHBPZSszV1ZDdzEvUHB2dGVqdTlHaXhoSkxMUC9iQk05RHBqWHNC?=
 =?utf-8?B?TnVjcmVnc0dEVGtzbC93RzgvdEZ6QjdNWGVHM0FrNFUzTzVQclpKZkdwZXJ1?=
 =?utf-8?B?ZFFCemtvaTZyWmVUd1JvdksvRWFKM050QkVCL2h5NCtRb1FqN01GQzFudHp2?=
 =?utf-8?B?Qk4wb1U3ZlRzSithS2gxQ090a1dNd0hPQnV5cGp0a0dyS255d0xqQkxaY004?=
 =?utf-8?B?SEZKY2FnaFNCeU5kaHZNNWQxM00zUzJkZ3VMNE51QmF1cUE0TlJFVGVPM2Y2?=
 =?utf-8?Q?B68qcFawxoQxQyexqbPPhUGuvPRhuQZ3?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM3PR12MB9416.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(7416014)(376014)(10070799003)(1800799024); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?REJmUEZGWkF3YlJhMTQzVTdLR2lKTEw2SHpGZHFYOW5EU1o3TTBLa3llTlZC?=
 =?utf-8?B?cmFHOU1QeTZKMU9TWkM1WURaRW5IKzJxTHg4RStUTDRNUEFYaEd4VEJjejVW?=
 =?utf-8?B?ejBVOUxJcHZxZHNFd3A5UjFJRDRVQWtaRXgwZEFxNm00TjBKcHJSc2dwditS?=
 =?utf-8?B?UUVkRk5RM1lDMGxxc0NlSjNmNHlMVkJqa29ja3FTVTFlMUJHZlhkb25xTDRa?=
 =?utf-8?B?WVM0Kzd2aytRV3VqUXl6aFhjdkgyMG1QTVlzZmhmT1Nta2IzbFhJMXYwT0hP?=
 =?utf-8?B?WXJ5R2hDc2htTU1ML2JQOWN4ZDRFQld0b1lXenNDOFRyK1MyRFNUZnR0azBr?=
 =?utf-8?B?clQxSm0xYmZQTmg1YkNlQ2k2RzRtR0NSR01mNlpGL1U4TGJTcjZMNkppSWpn?=
 =?utf-8?B?bFFsdG5kUWtLUjJCTWx4eGdySkVRaE9UYVBtTWUxeEFNMjdYOTZQL2lrU2Na?=
 =?utf-8?B?bERSeXVJY3cvKy8yR1ZQODVLM3dJUTRtcVFDV3VmRjlvR091V2ZyWWxQSlVT?=
 =?utf-8?B?azJsSCtDa1YwVDNpWGJWTXZ6YzFXZHV1c3dmRUpET1FHM0E0SDMrQ2tPYUhr?=
 =?utf-8?B?Q045M2JmM3lwa1VBYkhHL1hVRUF4TVNDdDFsNnNVTmFCcU01RmxvUTNHSVVJ?=
 =?utf-8?B?ZUM4OHdwODNhVGhDaUVncXhEaHVVcEpPYjZEYW1aZU83eFNlWWxYRzlTSitF?=
 =?utf-8?B?NW5SZkNsV0ZnZmpnZnpjNnFRdjFKbk9uTUhBWEZ4ZUJFM2NCMHZmZEVoajIv?=
 =?utf-8?B?bmMybTJCZ2J2dGhsTFNDb01XMGdXWWwyUGpIUXd6VWp3Ymc0YzU5M2tGS080?=
 =?utf-8?B?aTc5Nlg0bXNIcGNYY2NWZWJjM2VVVXZXSWkzL1hUTERDUTNDKytMSzJncVJi?=
 =?utf-8?B?Q3VLZERlYlBQcDd6N0JyQWVoWWM5UEpraURNOFQzVDRRMFZaVEhtTE9xbW0z?=
 =?utf-8?B?VVRQQjRoWVpSckIvZy9nZm0zNUMrbzBkWXlvMzh1Wjg4N3RFdXBHaUo5ZStF?=
 =?utf-8?B?Ung4M1l3eTY2OHkzRGRFdjZVLzZlcjcwb2s2ZFoyRVVYOTJGQzcyb0hFYUlR?=
 =?utf-8?B?dWdITmpyU21zTzZuY05TdUZydmRrQlQzODlvbXRKbWFoTkpEaTNlM0dxQmpS?=
 =?utf-8?B?bThhazJCNFhJVDJVZ1dxekt3YUpMT3Q2SFo4V01WTHZ3L0dQMGZtMFlRYlJK?=
 =?utf-8?B?MEc1eU5penNSTDRVdVV3N0FvZWFDNlM3WnhxMjhRcjlDSU1pZFIxWElOVkgw?=
 =?utf-8?B?NXFPTHZ4d0psQUo4WXlDbEZaeGVXTndLMEpmM1pUWktRUThLclRIcGJzYThK?=
 =?utf-8?B?cmpDNklBakRQM3RldWF3Z3YvUEdtN01iZnNlclU0MDRoOFFGQmIrUDI1c3Z5?=
 =?utf-8?B?T25vZ01acEJxY1ZmT25TQjQ3R2xTRnRhWjFJUDA1L3ZKMjAydDkvUHRsbGJw?=
 =?utf-8?B?ZDM0dnlxd3ZTYmNxUmNxOWFja0RuN2RTUVFTd1NFSGFtMk9sVXZaQWxkRjA5?=
 =?utf-8?B?KzQwQmVZQ1JPdjZKUkFGdHFUVDlxVDNma25pUzE2NDA5cWRxcEhZODdrTkc1?=
 =?utf-8?B?dStCWjBrR3dvcTlqSFE4bmV1Tyt4SWh2cGF3ZHFxRGE5Ni91aHpGaEtBVTJa?=
 =?utf-8?B?ZENMUmpUdU1rclJOeDZWVURERHdlUjNyRTJHb1l1aFVhZElaakxIdW9wczBS?=
 =?utf-8?B?YWcvcnpiUjFQS2M5VldpREpTUlZOVmZ2ZGM3REFTOENWS1V0bjF3SXJMTE8w?=
 =?utf-8?B?RW1JTk15dmlQTmpWZ21HTEU0ZU84UHlJbkZiY0hHOGZtLzZ3QU9iK0FWMDIv?=
 =?utf-8?B?RTRFZUFnQzNIZ2dZbUJJRjJDak1KZlFGOGJBdFE4NTg0dVp4NUVNbzBTdS90?=
 =?utf-8?B?dHVXR3dVL0lTQVBOVktXNTgzKzBQYm41L2treGlUM2wvTmxDU2NMR1NxMDAx?=
 =?utf-8?B?Wlo0c2R0amFCOWpvSW9ZbXZMWThSV3RKQmJTdEpWUFgwcGNEMWFzTHYvcHUy?=
 =?utf-8?B?SnZvMnF0Mk5MSmhjL09Zc0dEaUFrZWdpZmlpcjRmdzJkR3V5TmtHUUZ3Q21x?=
 =?utf-8?B?b0VHRFFmNzlkZ2xsVmx4Zk9vMVZGVGZubjdiR1NVRjdyNXowNytKZXRjV2xj?=
 =?utf-8?B?d3hxeTVZOHhLNlBaTkI1ZDZINEpmM0x1Q1E1L0x6QXFLZExXMkYweDFzZ2hJ?=
 =?utf-8?B?WUE9PQ==?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 828a83fe-e47b-46aa-d46f-08de2d17de3f
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2025 18:16:07.1757 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 38OhRSg5WICl5+piKiK6n6kgP2nlpl2z5mn3ORH+L/ZzbVpaDBY2keynWFkYWywDbpStTyPeOa5KBa+9NX05Eg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB9493
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

On 11/26/25 2:06 AM, Miguel Ojeda wrote:
> On Wed, Nov 26, 2025 at 2:39 AM John Hubbard <jhubbard@nvidia.com> wrote:
>>
>> Yes. I am increasingly uneasy with the Rust for Linux approach, and
>> now the Nova approach, of adding in "things we might need".
> 
> Excuse me, what "Rust for Linux approach"?
> 
> No, we do not add dead code unless justified, just like everywhere
> else in the Linux kernel.
> 
> Yes, there are a few exceptional cases, but it is just that, exceptional.
> 

I stand corrected (and relieved)! :)

Thanks, Miguel.


thanks,
-- 
John Hubbard

