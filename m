Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E4631BA81E5
	for <lists+dri-devel@lfdr.de>; Mon, 29 Sep 2025 08:28:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D818910E186;
	Mon, 29 Sep 2025 06:28:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="YS/iQpCH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CY7PR03CU001.outbound.protection.outlook.com
 (mail-westcentralusazon11010009.outbound.protection.outlook.com
 [40.93.198.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D2F8410E100;
 Mon, 29 Sep 2025 06:28:10 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fzYao5Ncrx8yvGT+n5R2UAjluW504qRvBo+Z/zbUIeBzu+54dr3MiLGENex0EZPPU0iSkWk53+JzPh3ejjMqfVmpKjK9kWQIQpxSoMVFVvRAYZbzvudqopHFoAfujRt+sJKj8O7xGJszGwthh3UCL1LHQ04QhnKemFFZ5osqfz2dqi6YFkHT4AFXoJbZw+3/NmjYeeqtBbOVN1mdUQncYItnWaHU/ASqxeKAU9u3kgBrrMKuXUnhQLgY6RgcrX76R3L+vTJ3XWxNxpbLbH1eW26Fl03ruo76BaEHUZajuHmhuNEeJbQw2wHA0f7rJuefmQ1OpPLIq8AP2zSQ8hvaTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ozuEL5nx4J0x4VNTKf1GuWUUG8vHT9LAyc8E8whtnvI=;
 b=NOSnUTXcqVcsX1+2th5xFM4OBNDTQjxSTGpYoARW6yNuoS8fgZAZFcka9+DGtjJ97I5BFzI7W7KfFsiJ+15R4Oiva39VjgvIcVgxRhrISqKpg1TiTjeShytG/cku9h6Mt/+iLwbiEnsfoIsT71wJXzhICDb4QrFScZFrMs/X5uBLSjjr4o3rVBBRm1/N2A6+lTvbeXkaASHcVbx2ZSwcY77g1u6Al317T7SEm0NI5MQn+gW0dTwrsr9J1deAn6/BwLky3FHwpUScIIwM2d5ml0wPia9716R/giNNgHxUnUzy8XtQV3VCGBt5N24aNnZD7oqbgXbZtGR2c5urCF2UJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ozuEL5nx4J0x4VNTKf1GuWUUG8vHT9LAyc8E8whtnvI=;
 b=YS/iQpCHqGBcMBjS97M922mk+LzmK1tBSI+WJ5hf4Rqn3ioCxTnDVLbg8sVxrfWFx9mFdxgfJOsH4rIcBJ3ozJv6X93mQtCkVscRq3RvMmu88S9BOYOsd3VS4B59HOMQSOvYk1VyUGWEJ+WrI0Xn0bUBf1B9m4eE3ySKki9CzIEcbeupMODsKjXO5edeVePmtjXXvAGU2t1gBPa97EJnppqBcXMb2tnOEBV1gl8NKFS8v2GEMzSGZLfWdihVEJu8UpuspaXduk5ZBxszaohad9+gH2bGSNjAASmA4hi9yxfVJ9pMo35q9hDaGOEFhblh6db1x953ju1vW9vdQ2xgAw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by SJ5PPF28EF61683.namprd12.prod.outlook.com
 (2603:10b6:a0f:fc02::98e) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9115.19; Mon, 29 Sep
 2025 06:28:08 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9160.015; Mon, 29 Sep 2025
 06:28:08 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 29 Sep 2025 15:28:04 +0900
Message-Id: <DD52KU80U06J.310E5IZOAVBOC@nvidia.com>
Cc: "Alistair Popple" <apopple@nvidia.com>, "Miguel Ojeda"
 <ojeda@kernel.org>, "Alex Gaynor" <alex.gaynor@gmail.com>, "Boqun Feng"
 <boqun.feng@gmail.com>, "Gary Guo" <gary@garyguo.net>,
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, "David Airlie" <airlied@gmail.com>,
 "Simona Vetter" <simona@ffwll.ch>, "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>, "Maxime Ripard" <mripard@kernel.org>,
 "Thomas Zimmermann" <tzimmermann@suse.de>, "John Hubbard"
 <jhubbard@nvidia.com>, "Timur Tabi" <ttabi@nvidia.com>,
 <joel@joelfernandes.org>, "Elle Rhumsaa" <elle@weathered-steel.dev>, "Yury
 Norov" <yury.norov@gmail.com>, "Daniel Almeida"
 <daniel.almeida@collabora.com>, <nouveau@lists.freedesktop.org>
Subject: Re: [PATCH v4 3/6] nova-core: bitfield: Add support for custom
 visiblity
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Joel Fernandes" <joelagnelf@nvidia.com>,
 <linux-kernel@vger.kernel.org>, <rust-for-linux@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <dakr@kernel.org>, <acourbot@nvidia.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20250920182232.2095101-1-joelagnelf@nvidia.com>
 <20250920182232.2095101-4-joelagnelf@nvidia.com>
In-Reply-To: <20250920182232.2095101-4-joelagnelf@nvidia.com>
X-ClientProxiedBy: TYCPR01CA0145.jpnprd01.prod.outlook.com
 (2603:1096:400:2b7::18) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|SJ5PPF28EF61683:EE_
X-MS-Office365-Filtering-Correlation-Id: a418bd05-9f29-4390-00f6-08ddff215ac7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|376014|366016|10070799003|1800799024; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bzduWkwydDZNc2RQcXdtcnJTS2RLSFBNTkgvUllzN1phWGJnNVpvaVJ3clJz?=
 =?utf-8?B?TUVoTStRMkM3dzNENWFQZDdxMHdXNHVLcjhJS0lOY2RmU1FQWWd6S25jU3ZL?=
 =?utf-8?B?ZDkyNjlrZndsekRBZDJIOFQwVEk5MmtoRGM0YzF4NHA1MXRobXQ2czJkc1cv?=
 =?utf-8?B?M2RYQk1kbGJOODJqYnNRT2V4ODhVaUdLL3VMOUdjMDJudVExUEoxWk14K1dV?=
 =?utf-8?B?NmxLNnBOaFl4LzFwUUY0YVBiQkZCNzkyL3hMa0VKbVhTMjQwRUo1NVRGWlhj?=
 =?utf-8?B?RXplUkNRTkhPWHd0RjFrYXVDVk01VHNpQTBrUXg5RU1EbGxRVTVLa1Z1Wjdm?=
 =?utf-8?B?eDZYd20vQVZIMnhSNEdRR28zUXNHeDlMRHZlV0VPeFhsKzY4OFNOUWVid0ZB?=
 =?utf-8?B?WkkyRXl2T1U1ZW9LRW5jZ1hTWVN5WHJDSWUwaFBNTDZUWU9vVERIYTkxNDVn?=
 =?utf-8?B?WlNTTzg3TERLVjhCT1dsYmc0WGxCMy81UTIvMUtDSHZKYWQvWUZ2dFlBeENq?=
 =?utf-8?B?aHQ0TldabUJTZGNOaE9SekxNZ0pTajc1VEx5UE1KbDBYQkxJbFlOMnlPUkVU?=
 =?utf-8?B?MVdwRk5FSEdlbzZZU1J1alZRWW10WUp5alFpdE9MV1NsS3Jlb2F6VitvNmVy?=
 =?utf-8?B?WVl0VUM3SDg0b2xRSUdyMHVtL0dMeVE1Qk5LZ05mU3lsNjErSTVGb0ZsRks0?=
 =?utf-8?B?VzFKVGVIWExCZVlZZFRCTFowR3dES3lVdnZGQWkxaER3d1NodUExNHE2N1o4?=
 =?utf-8?B?cEFtM3BaajdtZU5OSm5oOXZveDFFSFROZHh4L3l6WEJrSVhyZjhFUXMrYlFB?=
 =?utf-8?B?N3NMbTliS2NIRk0rdnoxdGFLblB6ZUV4bTg0NG5sMnp3WFpCeC9LV0g5d2E2?=
 =?utf-8?B?VFdlS0dPK3cwaHp2R1JxR3ZGUGxrUG5JNjhra0UyM0FWWnJ2ODdYU3FSZGhv?=
 =?utf-8?B?Z3JLLzlEVUVNMDRhVFc2OVNiQU9MRXovMzlpLzlVcFQyRlBaNk54Z1Q4SXBQ?=
 =?utf-8?B?UmZtWTNVRUdOanFpa295MndBQ3FrMXpqVi9hTXlBcmZ5ZUo1Zkd1ZGhZUFdx?=
 =?utf-8?B?anB6bWV4aVk4Ti84TVB3MFI2aDlFQW5PMXJkR2EzclVBU213eXdnNFkzcDlK?=
 =?utf-8?B?L0Jwa3NlbmYwYmQzNldaTWdoNlMxbzlLRjR2bXBkNjd5Y2NMUG1MNW00NVk0?=
 =?utf-8?B?VGRjeVJGUGF3eXRxNnQ3d09tQjc2Q25hc3NUT3hacTRUd3haU1JRMlVOUWJV?=
 =?utf-8?B?N01Qd1Z5R0xQWUNad3J6UEgra1dHbW9WNWdDYVJvQjRIMDJqK1o3MzlBMHRU?=
 =?utf-8?B?Ui82by9OMzFHc1BjamtIOGlpWk9mRDJjZnYxTFo4UGt4N0dZQ0tDNkU1VTFu?=
 =?utf-8?B?R05OWSs1bVd4eG5uVXI4Tm8rMVU1YzRaR2xLakxENFBiRmtVQ1hycFEyQTY4?=
 =?utf-8?B?eXVhdzRoNWorNDFVbk5rZUFMdFVlRTlOUmxlbURucmNleUo4elhjODRhcWU2?=
 =?utf-8?B?aXBDOHhIcmgxckFoSmFxSHdxbVlXWXphQzhlSEFmMzdhWFo5VWhibHQ2UVZy?=
 =?utf-8?B?MEF5SnZGSHRJSkc1MUkyOWdKTGpJQ1VnUlJBSGc2eVJKQmJjS0dsZU9MZ09u?=
 =?utf-8?B?WWdYZ3RjSTE4V25FcWJXb0YxbjFyc3JmY1JiVzdWWTM5MEpLME5kOG5Qa0sv?=
 =?utf-8?B?dG00a1RSRVRKcEt3eWdSeHg4bkFyM0x4cXVHMENNU3o3TnRIOERXMVJBdVBI?=
 =?utf-8?B?TkFWeUNpbUdLS24yQSsxZFJOY3hHN1ZyVzV6c0RCV0hHOWxzTTJJMlFKZi91?=
 =?utf-8?B?SDREMldsUG1IRVp4R3M4aFg5OE9YWGxBQkMrWmpqT2srM0ZWOU9CWFVDSUlN?=
 =?utf-8?B?c2VsTzd6OXUxcGNyWEFIa01iZFgrdGZGdFVNMU54bDBaQVY2cGZNeUh6VUxz?=
 =?utf-8?Q?ibdoxhPfIS44rZ+9NouJ9thj/RBEQEMo?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(366016)(10070799003)(1800799024); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VVZZRFZVR0h6NlB0UFFoSWthajkyUU1tZERMZkR5czdKdnprYTdxMVNrb2xI?=
 =?utf-8?B?eDF6dCtFTHRpOVowRnk0ZkN1ZGVkOWxaS1lzWWFPYU40WmZFRllHeFg2bVNS?=
 =?utf-8?B?dzEwaUZPTHVFVGdjM2ZXM1dNL2lTSzJoY0ZkUFM0bUMyd2hTcHFKbndYbnZK?=
 =?utf-8?B?cXk0alVlT3hGMjZXSUJGTTVOaXNvYkM0L0F3dFUwWUcxeWVTTzBZaHpTaEJB?=
 =?utf-8?B?SldpTDNnc1orWGZOZWFFTW5CV0NhMU12VG05Y04raEVBVkU2bEwxd0xESzdw?=
 =?utf-8?B?UWtYbGxRVm5vYVdOaXZVYlF4a0E5R0dzN0t4L2EvU1hDTExuWTNmV2pmQktu?=
 =?utf-8?B?bDdSa29RNlBxZFlHV0s4VEpGbklUaUdFU3BiRlRJZkxuVmZnN1dHaFhyUUdt?=
 =?utf-8?B?NEFBL0NVK3QzYkVGVU9yOGgvY2k0V0xtVGpPWjJ4aWNtQWpZeDhFTDJJaTVp?=
 =?utf-8?B?SEVoNG04M0JLMytTK0s1QjRkZnFmQmpvUk4vajA0NjdHdkJIS2IwZnpIVldW?=
 =?utf-8?B?M1U0dDYzeDJTNkRRYktGK2llYVdYbndnSjZDWFZzb3RobHlVd1h5ODAzN3g4?=
 =?utf-8?B?R2tqQk0xekJLd2R4VVdsbHI0ZlZSZ3haQzEvdTdQaHhabnhzV1Z5QVRPRWNp?=
 =?utf-8?B?OUVLTWJpbXBsM0JLbXBxNnRDM252bnY2d1Yzc3RGVG96MWNERVFiaXhzRlFS?=
 =?utf-8?B?UEpya2dkeU84cFJYekV0L0ZQSHNTWHhlSnZLdEVFYWt6TmFaRURaamV1VVhG?=
 =?utf-8?B?VUcybHdOb3BRU2JTWktWWjJDelBKNm82M2x0R0NjZzNQQWxLSmh3eThYbFRS?=
 =?utf-8?B?QUxPNjFMdXpzYjZUM0tqZFJaeFBQM3J0WXdDSkVqU2RuRUVFZXgxT0FNQUwx?=
 =?utf-8?B?WHFTdGJWM3RCNHMzaUpOa1FxL1VsS2ZBSGx5YVQzWmxKSzdnY3pWNy83T3ll?=
 =?utf-8?B?ZlNkVHhWQ0NZcjA0eXFZeUFaUEVJakZlR0dwcUhGLzYzbHlyOEtsT3Y4cFVH?=
 =?utf-8?B?dUlVZkp0ekhLSTdKRlRTZnZkV291WEM0VDV3NUd2K3VDeEhldUFaMzM1N1c0?=
 =?utf-8?B?clJFQ3ZUd3U0RjdKNWtZMjl0WUJuSlVmNjl6SEUxaWgrTERZRUhJcVRyYkRm?=
 =?utf-8?B?NVZoOXJZcHhza050RnlrOVdleDVEc1oxOUlTRWZzZ0RyLzJXZ3NGUWVDUUpw?=
 =?utf-8?B?NU9QYUxtTm5SbmNGR0k0S3o4MCtTNnhvTUNnVTBKc1YxcVhkODZmYWRxTWNy?=
 =?utf-8?B?WkNzUzJERFdYSUdvNy9XSk9rQmJWM09vckd0blA1bXRlSjdMSG9xQ09QdUtu?=
 =?utf-8?B?SHF0MzZ2Y0xDZkREQk1jWGRuVUV0aS9May9uMHNxNHU2dnVhQWZGYVNiM3ZW?=
 =?utf-8?B?cGRuUWl3SjFBVlBUMjdwc0VsSUgyN2JUWDhmRERHQVdKQTA0djYzdXZrL3Vp?=
 =?utf-8?B?dWxkcHQ4QkxXQk4vSHh5SWdQQjVjdlZoZy9RcjBkS2lQQkp0OUNNUUlSV01w?=
 =?utf-8?B?bW5XZldwYkNZNHN0azQ1U1d4VGoyUFEvcVBwS1M2VDRSUVZBaEE4OVZnSFla?=
 =?utf-8?B?RkdJTG5zWk01czBLWlRLT2srMTg1QW5RYmY1bTFRMmxBOWMvK2ZxM254b3Ux?=
 =?utf-8?B?Z0NxdEg3ZmVQNTFDRVdBcUtiWXJ1bkh2NkZKMXJLU0F2VGVyZ3YySjZiaFdo?=
 =?utf-8?B?TXZTb0ZELys0TkZYSXoxS3pJakMxSEJtSGhlVXF3S09QSTZaNmFSZ2hlbit3?=
 =?utf-8?B?Uk43QzZTSEx5TzZkbThEY2EwOFRzRVJFTXFGM1NCeThWb1N2QmVrb042YTMx?=
 =?utf-8?B?Z0pBSEdKYmMyUnhGcjRXcDd1M2FIR2w4WGxSZlhVYU82Z3V6SzBNT2kyYmQx?=
 =?utf-8?B?aFdHclRKczlXc2JqeDJyUFpFdU1qNlowalRuSXJjYjZCQTMyTktYWGYwVklZ?=
 =?utf-8?B?Njg1QzN3VWp2cmlKQWptcFljbFZLVEdPM0VmV0F2dVpzbEZkVUx3bjJyOWUr?=
 =?utf-8?B?dzlWaEZhQkVNUmo0ZFE3NFA4RFBRYkJ6YUNhME9sbGxta09jQ3Y3NTFrOUUy?=
 =?utf-8?B?QkEvbUxnZmluSkROMWxVd2tvc09kZnd3RHU2c29FcVdvUVBXR0phLzlUcmx4?=
 =?utf-8?B?ZXA0ejJXM3ZUVzVXWkJid2JFWlBSY3BNMXZEQ1BPQkJ3TFd2empnOHZ1Tkcv?=
 =?utf-8?Q?cpIwn4toUHjGx0OgpPoWk25iMSaNzIF7yfieGN9TCKf5?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a418bd05-9f29-4390-00f6-08ddff215ac7
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2025 06:28:08.0663 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Kjnw2kWRI7vhbdnbj7BT1rpoRH5/tEKevZPIYO1ON3YXJ3goe6TvA9CYKSayLuFUv7t7NZcTrlBgnMsgYP+PvA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPF28EF61683
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

On Sun Sep 21, 2025 at 3:22 AM JST, Joel Fernandes wrote:
> Add support for custom visiblity to allow for users to control visibility
> of the structure and helpers.
>
> Reviewed-by: Elle Rhumsaa <elle@weathered-steel.dev>
> Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>

Just one comment below; otherwise

Reviewed-by: Alexandre Courbot <acourbot@nvidia.com>

<snip>
> @@ -161,8 +164,14 @@ fn from(val: $storage) -> Self {
> =20
>          #[allow(dead_code)]
>          impl $name {
> +            /// Returns the raw underlying value
> +            #[inline(always)]
> +            $vis fn raw(&self) -> $storage {
> +                self.0
> +            }
> +

Why does this new method suddenly appears in this patch?
