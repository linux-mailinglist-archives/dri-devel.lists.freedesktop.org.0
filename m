Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A0F4BF3D38
	for <lists+dri-devel@lfdr.de>; Tue, 21 Oct 2025 00:08:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F98610E079;
	Mon, 20 Oct 2025 22:08:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="cNATjEx5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BN8PR05CU002.outbound.protection.outlook.com
 (mail-eastus2azon11011000.outbound.protection.outlook.com [52.101.57.0])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E38710E079;
 Mon, 20 Oct 2025 22:08:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FxZ0NUr+8IUbeWtwt29kp1T1DH1+8rE0u7PMeTQ8s3TkO+r+1m2vZ+VoD0k8Hgxe8lEEtp56rB9ny31AnZrfAcp6e60QGwY8Zsq2px1kYxeNvssNNnCI9kVrVOlyQAFKnekDPQccaSmpDNUXKB6lrokOd40pRVd+a4+l/jScw50p1rj/e8cy49pV0KbKI3XxOrUbAUO7TtdU6TWBfzsYA0pX/E3agdyNkqXeFnK2Co4pIjfe75llQc4OzApzGtNmKqg9x6uSp1hjmLGfHA4MxapuqV6OZIa/hfqD55YtT4G33VeZtytcqLyjCzSAuXZqpX0MPMatTDSksMkwaSBVAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LQUHakKCr9UL8mKob8Rvc7OQh7j8RcxofJbJpp+BAMI=;
 b=kzKmjW5Dyc0QMp9Aic7glVFDPU4mVVKTsfn9CgOujT3tkQMwu1c1Rqkv/iNJIi07xxdZThsmlyu+p8lw01D9abXV2iHSNFOQNjv1gh935Ph6I+lriOwpTQOxlSX1/x5kmmP1+bC++R4fNWs5tXS2SP6WjtDfUOVXK1gqmB7YuAnxneWmGtc8jvARY6riByqWOQw9XEj11MnOq9TVG0Ogy8tF1L62tkd3mXAt58oCT9nhfUm3tWewHvHHLt4ZwYyHNV097WjEUOxQXKxkNvSOxU34n/McJc2tLY9EtPs7+lN6YdgMAS91sybrTdn5izcn1oyjNAwWexe5+/xSnSTlWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LQUHakKCr9UL8mKob8Rvc7OQh7j8RcxofJbJpp+BAMI=;
 b=cNATjEx5wb/Cuh9dRLSS4yMd89uKmOUKaTmui9ruSTXbSyhOvj5ofVYRmglFGBlQ/GRS4TbbuOJX1hdbzAc6ME2a/Ik9+C47OVcbTV0jWNWKQSeLOW0MijEVT+SO7nnJV310PoRuiHnHUB37Pb5/eBnSoE2Tjb/wVR3/Z24N/WQToRi1ltZmW7aCAH33bfwOo4roQ1KiGhZOpf83sVX0mbmaaNsKVDq1s9J/rPmlRWavQLG5J8ZKli0yF9cZN3WNeq22nTmgWZXdlJMzCjPnknLbobc3lViDXbbSn6NKliqsEYlk9dgNWa6kwBMSyuNjd+iOIK0hXVI6irsZK1XB0A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BY5PR12MB4116.namprd12.prod.outlook.com (2603:10b6:a03:210::13)
 by IA0PR12MB8896.namprd12.prod.outlook.com (2603:10b6:208:493::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.14; Mon, 20 Oct
 2025 22:08:17 +0000
Received: from BY5PR12MB4116.namprd12.prod.outlook.com
 ([fe80::81b6:1af8:921b:3fb4]) by BY5PR12MB4116.namprd12.prod.outlook.com
 ([fe80::81b6:1af8:921b:3fb4%4]) with mapi id 15.20.9228.015; Mon, 20 Oct 2025
 22:08:17 +0000
Message-ID: <00a76912-497f-482d-b2c2-675e34ea92c1@nvidia.com>
Date: Mon, 20 Oct 2025 15:08:16 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/7] docs: gpu: nova-core: Document the PRAMIN aperture
 mechanism
To: Joel Fernandes <joelagnelf@nvidia.com>, linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org, dri-devel@lists.freedesktop.org,
 dakr@kernel.org, acourbot@nvidia.com
Cc: Alistair Popple <apopple@nvidia.com>, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>, bjorn3_gh@protonmail.com,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Timur Tabi <ttabi@nvidia.com>, joel@joelfernandes.org,
 Elle Rhumsaa <elle@weathered-steel.dev>,
 Daniel Almeida <daniel.almeida@collabora.com>, nouveau@lists.freedesktop.org
References: <20251020185539.49986-1-joelagnelf@nvidia.com>
 <20251020185539.49986-5-joelagnelf@nvidia.com>
Content-Language: en-US
From: John Hubbard <jhubbard@nvidia.com>
In-Reply-To: <20251020185539.49986-5-joelagnelf@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BYAPR05CA0069.namprd05.prod.outlook.com
 (2603:10b6:a03:74::46) To BY5PR12MB4116.namprd12.prod.outlook.com
 (2603:10b6:a03:210::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR12MB4116:EE_|IA0PR12MB8896:EE_
X-MS-Office365-Filtering-Correlation-Id: 62585ab4-2eb9-42bf-d503-08de10252c0c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?blNCc0lZVTJCdXZPZlhnajUzKzNNTXMvQzdNVmhGUWordk14bHFpbmZqK2Nk?=
 =?utf-8?B?S0hURENtR01CTkRIbUl6Q0FoNkZueXpKcE8rTk1hanJUdW5GOGd5WXpoZ0ZR?=
 =?utf-8?B?ZTd2enI2ZERaeXlEZUV0aHh5VUF3b242bTNOTkpFN25qdHVMR1Q0UWJTMExZ?=
 =?utf-8?B?NVJaZ3RxMVgxRXVTSjBxbzhOZHQxTnVjNjMyWk1ZZkl4M3VTTTJpc2pJaWlj?=
 =?utf-8?B?K1lqMjNDTEx5UFF0dzVGRnMwZ2NOT2NkQmtIZlI2Tmh0OXFPSnBUWkRaU2xj?=
 =?utf-8?B?RGU5TEVaKzE2SEszNGlVUDdJeXo0OFljaWN2ZysrRWNwNy9QcTFiOHhnNXZ4?=
 =?utf-8?B?VE1mNGcxL0daQUZWV29ndzFwYTRzcWFPWWFoK3h2ZVFmSWhab0VIVlJkYlFC?=
 =?utf-8?B?RXhMWC9DelA4Uk10bHRtWEdaUHNqUDBncVd6L21vcmhKWTdDYUI4OFVTVGVG?=
 =?utf-8?B?cTBaZXFCcG81cXBiSHV2ZnJZWmdqVGlNSVhwNWU5S3YyRmNXUWZRaTBZZUhs?=
 =?utf-8?B?djRqSjk3L0tzMTh6em43RmcxS1E0aTNrWWdPOERtenNRdjlvdzlvL2R5akJZ?=
 =?utf-8?B?MlNFZ1V0UlhHdTFIRTFXY0hNSXBvMFpEV3JabU5IM01yNjNXKzBxWDlNcm5x?=
 =?utf-8?B?Z1VqUVRlakwycFNBSUxGcG9PZFlQejdCRTBDY1k1SUg3UlA3Tm5wSThwa29t?=
 =?utf-8?B?M2FZN2ZwRjhPWDRCQnd2VDlaWUZ1VGhyT1hlM1V3Z1kyaDlDMG9LaWwwWmF4?=
 =?utf-8?B?dlZBQW13b2FPak8yY3MyQzN1d25BL1l4MVBtOWt6YTkyVklWVXlOZ1hORllj?=
 =?utf-8?B?bDEzK3BrSWRMOXFFaUVUZWhrMDJiREN4OGhHQmtVbHljMDI2ZmE2Y2xqQ1Q1?=
 =?utf-8?B?U0JRd3hXWlIrUmNLeG1jU2pQNnpWVzF6SHcvMWRraVAwQU9xZTIwTnhZWHYz?=
 =?utf-8?B?N3Brc09NWmJsZFFLeG1HNFQ5THA2aUJ3OVpjdnlvbjdSNklnZnZnKzdSSTkv?=
 =?utf-8?B?c0xUVHdCd2FycE5WN3VmTmQ5Qmp3ODdZRjBOK0VucjVZWTEyWWQ4THNZS3Bl?=
 =?utf-8?B?eG0rVUdZUEplc1I2MWdSbnZWaFhaNmVWUlo1TCtHbXpLekkxWW1aQysvQ1Q1?=
 =?utf-8?B?RlZ5VFdlbmYzUVpJTCt2S3BHTU5NOHdHaUI0eC9kQnRQa3ZWR0JHczVLWWNK?=
 =?utf-8?B?R0MyS3FnVnhuRy9sZmdDZHBDamhkUjQzRHgzYXUvdnB2QXhRTU1xUlU0Y0Zi?=
 =?utf-8?B?RUU5cEU3ajI1a3VUQncyZ3o5ZEpFUDkySTBSTzkxU1FCM2R3M08xdlIvbVNQ?=
 =?utf-8?B?Q3BJK0NXaU1EeXBmZ3VXUTJkT3pYbDZRcnNobVVxQ0JGbkVmbXV4eG9kb3lm?=
 =?utf-8?B?bnRPSnRmTXdCbEU0ZzlncFNNZjM2REIvTEdkb0JnREVza3JHUHRVSzhhTm81?=
 =?utf-8?B?bDhtNm9UbksyU3Bnc1dnTEpwVy94bFVzVTY5V20vRHNBOWo1dE52Qys0R3dW?=
 =?utf-8?B?R0EvcGxOMmFXNENUdFhoYmdKM3FyNnNWMU90ZlQweWhGUDNMZk16aUxkakNS?=
 =?utf-8?B?K1EwU1RBVmFmcU9TUEo3WTc2ZlZuQ2VtazZyRS9GdFluSzEvd1dJMURyUWtw?=
 =?utf-8?B?c1RCOHlnejFGdTMwODdwRHhNRnVlbVh5K2lSVlFKUGhnN0d5ZUdJTHBrN1FT?=
 =?utf-8?B?YjRySElTMHJLZm5VQXpwM2lGaHFsaEkwVGxpZ09UYlVkdkFRVGh2cnNwcytD?=
 =?utf-8?B?NC9SVmNIekluc053N2xVYjhOVTFmYWZmbUZ6ZFZEZHB6TlJlTUVMVDF0Y05W?=
 =?utf-8?B?eGkxY1AzbStibjhraVJrWEZEb2dZYmxJdGQ3NFI5a3dxU0RyRFRyRUFPbEdO?=
 =?utf-8?B?ZVUvSjN6S3dLUlgwVnRpNCs5VnIyMldQTDNDSkdLVUFiYlhocXAzUzVIbzFH?=
 =?utf-8?Q?tJmy3+TA5toigy03gvcPMx33d9VfuUE7?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR12MB4116.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bk9rQlZwVkRYaGYvdUhXcE41VzloZTJIbXhxcHdyQ2RKY3RQMWQzSEcrV3dQ?=
 =?utf-8?B?SEVPM05Hc2xLZjhBZDJNd2NlMkpFSFA1c3pZU1BVVXhoenJBdlpRbFFuTVMr?=
 =?utf-8?B?TTVONUUyU1RaNmJ3amdmaTZNcGw0MmtKcmVEMGxQVS9NT0twZnZJcUZQUDcx?=
 =?utf-8?B?b2Y3WnNocUMva0tMMUx4TEtReTFsczNGN3BxVTJRL0N3T0hFZE1PU2VuSEJ5?=
 =?utf-8?B?K2dWK3pSWjJtSElvQXQvY3EzWlRsd2NRd04yajIxR2NIV1BiZ0RpWEdOVU9o?=
 =?utf-8?B?SitoQnpIcy9LRVhHd0NabkduWS9aRTdxTGlOdUdSLzVxcXYrK2hmWXdtNHpa?=
 =?utf-8?B?VDFaem1ScjRmMTN6WHM2RE5nK0V4VmFxc1VocmdkRWtUMmhLUGRDZWJNZTJE?=
 =?utf-8?B?RE5KbUpLc05FZTM3eEVoKzdZVzJSUjBWUGNhUUFZQkFEeDVLQmhMakxaMDZk?=
 =?utf-8?B?V29TanFpeHZGMjRKVmZHdVl4eHlPaGVGb3ZXOW4rZWJUT1Y5MXNTcnZhOWNU?=
 =?utf-8?B?MWFyU0ZLaW5tU21ZZW1oQVZsWHc4ZDU0UXg5b0E5enRTcEY1VmRYMWoraFFP?=
 =?utf-8?B?UnA1QzB0MTZsQ2prbmpTK0JMWWNPQWpLYzRHSkZqTTl0NUJpeUlOMmEvb1Jz?=
 =?utf-8?B?dENFay93cGczb2ZpR2ZuRmRvTVl4N2hiNjNFUkZiRkRXdlY3MER4b1pHWEhE?=
 =?utf-8?B?ckNXS2VCczE0Tmp0RVZqczZJNkg5Mlc3V0JxOVVZd3dQSkhtZlVic1JmOEVD?=
 =?utf-8?B?ODRjdTA2VjZNZmEvL01URGxURFkwREhTVEo2amVJbVIyRGROdnRDOVFVaWdr?=
 =?utf-8?B?VXdSS1RoOUsrR0tyQTV1L1NFR3ArVHNUcEhEVXQySlFyenFJR3hQc2hoOUNk?=
 =?utf-8?B?VDBrOW1ZaUF6RkdzV3VUSUFPRHZIWUFqVFQ5VmdQekZsTHZpYjRFSENIbzVS?=
 =?utf-8?B?MGN3RTNrR0JrZ0tnS051QmtwVUk4TjFWV3NpWHZlS28yTU1zdTdjcDlnRCtw?=
 =?utf-8?B?ZWJ6eS9mVXFDUzNzTVhFeStzSEMzdkxzbUlsckJxWDVxdDBCUHNVSWFoUTVu?=
 =?utf-8?B?bU9TOUI3aHN4T3pLRkFDRERvUkVwNlBQMnBWWU1GdHNFQkdVbVVOV0JIZElB?=
 =?utf-8?B?R2RYWDgvUldtNVZnakxaNjVWSjl5NG94aHpEVGR2QU9XOEtFNVJnci9lbkpZ?=
 =?utf-8?B?bmIxa1FVMnZDNzhzNG1aSzVkdUdSWE5wZVhSRjAxZENOZlc2cVRFZFgyQy9O?=
 =?utf-8?B?R0Q0emY1OGdrOUNzUU41dUFDNVJZVXlkRDBRRXBRQ1dyTEZWWTQzeWtqYVlq?=
 =?utf-8?B?WFhabndQV09tK3FzNkhXc1RQTEd3SkFYVHlld0c3Y2VFWS9oancxNTBtbkRM?=
 =?utf-8?B?OTlPK3BRSzdSR3NuMHVEQTZIc2VYcnlLRzJaRkVRUW5NeG1vUnFneUJKaXNV?=
 =?utf-8?B?RzljVWZNUTlnNjNOaTZNVnVDbWtueldkb24xekl4b1loUVRYaURKY3lhU3Fa?=
 =?utf-8?B?djZTS21NNUJjWm1EblZDWmNaRDgrMTRDVmFtZE5nbE95ZnlQWkc3czJqc1NE?=
 =?utf-8?B?blkvd1RJc09SQVBlUnU1UitoVkRUR0xTL2hZbFgrbzJmNStOTVJkakRnSWRU?=
 =?utf-8?B?ZFgxYlVrd0pwNDJhSmY5dkJwRzRkZUNPcTJsV2ZJOTZ5N1pQcE5ZejVUZGEx?=
 =?utf-8?B?RGdNVG15ckZuODBXV1E0eU8xRHpDTGdhcnZzaEt2UVNyMGxNMWhtTno3ZG0z?=
 =?utf-8?B?RGltLy9hMWo4Q3N0dS91am1sMXpmc2xqVHZGQVhzcVhRMTVxTFVGc25LeGJP?=
 =?utf-8?B?c2lGandROUxkRm9vK3J0TUxhd1Z1L1lwNlp2T1NzdmZNYVVsU3MvQkdXbGF2?=
 =?utf-8?B?QmptY2szcm1NQU5wR0FVRDA1blp1d0tCdTNZMlhqby9QWUtFQkJEaDlyM3RP?=
 =?utf-8?B?RjdmeGkyT0hKRkxJdnlSVHhIbTJ1UkpRbVdxY2FWVnU4VER0Y0tOV25FdFll?=
 =?utf-8?B?aFJvaTFud3YxUlRJeU1WbU04SThMck1iWnNYUU14L2gvOUxSMWc1ZDBUNUdK?=
 =?utf-8?B?c2p5NHpkRjY4cEpMbDA5L3MyY2dLbkVIckY1TDRPZXZ3Wk5NbHNyb3BjQUVF?=
 =?utf-8?Q?TtZekmeyTswJ7SyuoDXPdoIyy?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 62585ab4-2eb9-42bf-d503-08de10252c0c
X-MS-Exchange-CrossTenant-AuthSource: BY5PR12MB4116.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2025 22:08:17.3310 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Z8Bjex5xT4N69A3sHDvxBsdYbY/91dcpfNpi3CMa6dpcfSuBJrB0TqlQ3yc5b4qUnVlha+Xe45hxOkb750E7ww==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8896
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

On 10/20/25 11:55 AM, Joel Fernandes wrote:
> While not terribly complicated, a little bit of documentation will help
> augment the code for this very important mechanism.
> 
> Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>
> ---
>  Documentation/gpu/nova/core/pramin.rst | 113 +++++++++++++++++++++++++
>  Documentation/gpu/nova/index.rst       |   1 +
>  2 files changed, 114 insertions(+)
>  create mode 100644 Documentation/gpu/nova/core/pramin.rst

Hi Joel,

Here's a more thorough review.

> 
> diff --git a/Documentation/gpu/nova/core/pramin.rst b/Documentation/gpu/nova/core/pramin.rst
> new file mode 100644
> index 000000000000..19615e504db9
> --- /dev/null
> +++ b/Documentation/gpu/nova/core/pramin.rst
> @@ -0,0 +1,113 @@
> +.. SPDX-License-Identifier: GPL-2.0
> +
> +=========================
> +PRAMIN aperture mechanism
> +=========================
> +
> +.. note::
> +   The following description is approximate and current as of the Ampere family.
> +   It may change for future generations and is intended to assist in understanding
> +   the driver code.
> +
> +Introduction
> +============
> +
> +PRAMIN is a hardware aperture mechanism that provides CPU access to GPU Video RAM (VRAM) before
> +the GPU's Memory Management Unit (MMU) and page tables are initialized. This 1MB sliding window,
> +located at a fixed offset within BAR0, is essential for setting up page tables and other critical
> +GPU data structures without relying on the GPU's MMU.
> +
> +Architecture Overview
> +=====================
> +
> +Logically, the PRAMIN aperture mechanism is implemented by the GPU's PBUS (PCIe Bus Controller Unit)

How about:

The PRAMIN aperture mechanism is logically implemented by the GPU's PBUS (PCIe Bus Controller Unit)


> +and provides a CPU-accessible window into VRAM through the PCIe interface::
> +
> +    +-----------------+    PCIe     +------------------------------+
> +    |      CPU        |<----------->|           GPU                |
> +    +-----------------+             |                              |
> +                                    |  +----------------------+    |
> +                                    |  |       PBUS           |    |
> +                                    |  |  (Bus Controller)    |    |
> +                                    |  |                      |    |
> +                                    |  |  +--------------.<------------ (window always starts at
> +                                    |  |  |   PRAMIN     |    |    |     BAR0 + 0x700000)
> +                                    |  |  |   Window     |    |    |
> +                                    |  |  |   (1MB)      |    |    |
> +                                    |  |  +--------------+    |    |
> +                                    |  |         |            |    |
> +                                    |  +---------|------------+    |
> +                                    |            |                 |
> +                                    |            v                 |
> +                                    |  .----------------------.<------------ (Program PRAMIN to any
> +                                    |  |       VRAM           |    |    64KB VRAM physical boundary)
> +                                    |  |    (Several GBs)     |    |
> +                                    |  |                      |    |
> +                                    |  |  FB[0x000000000000]  |    |
> +                                    |  |          ...         |    |
> +                                    |  |  FB[0x7FFFFFFFFFF]   |    |
> +                                    |  +----------------------+    |
> +                                    +------------------------------+
> +
> +PBUS (PCIe Bus Controller) among other things is responsible in the GPU for handling MMIO

How about:

PBUS (PCIe Bus Controller) is responsible for, among other things, handling MMIO

> +accesses to the BAR registers.
> +
> +PRAMIN Window Operation
> +=======================
> +
> +The PRAMIN window provides a 1MB sliding aperture that can be repositioned over
> +the entire VRAM address space using the NV_PBUS_BAR0_WINDOW register.
> +
> +Window Control Mechanism
> +-------------------------
> +
> +The window position is controlled via the PBUS BAR0_WINDOW register::
> +
> +    NV_PBUS_BAR0_WINDOW Register
> +    +-----+-----+--------------------------------------+
> +    |31-26|25-24|           23-0                       |

Should we use ":" notation here?

31:26 | 25:24 | 23:0

> +    |     |TARG |         BASE_ADDR                    |
> +    |     | ET  |        (bits 39:16 of VRAM address)  |
> +    +-----+-----+--------------------------------------+
> +
> +    TARGET field values:
> +    - 0x0: VID_MEM (Video Memory / VRAM)
> +    - 0x1: SYS_MEM_COHERENT (Coherent system memory)
> +    - 0x2: SYS_MEM_NONCOHERENT (Non-coherent system memory)

These SYS_MEM_* items imply to the reader that PRAMIN can target
sysmem. However, pramin.rs in this series hard-codes this field
to VID_MEM:

let window_reg = regs::NV_PBUS_BAR0_WINDOW::default().set_window_addr(fb_offset);

It's not clear why that is done (I seem to recall a potential deadlock
in older chips, in similar situations, but that's probably stale info).

If, however, there is some limitation that prevents using SYS_MEM*, then
we should document it, probably here.

> +
> +64KB Alignment Requirement
> +---------------------------
> +
> +The PRAMIN window must be aligned to 64KB boundaries in VRAM. This is enforced
> +by the BASE_ADDR field representing bits [39:16] of the target address::
> +
> +    VRAM Address Calculation:
> +    actual_vram_addr = (BASE_ADDR << 16) + pramin_offset
> +    Where:
> +    - BASE_ADDR: 24-bit value from NV_PBUS_BAR0_WINDOW[23:0]
> +    - pramin_offset: 20-bit offset within PRAMIN window [0x00000-0xFFFFF]

How about:

      - pramin_offset: 20-bit offset within the PRAMIN window [0x00000-0xFFFFF]

> +    Example Window Positioning:
> +    +---------------------------------------------------------+
> +    |                    VRAM Space                           |
> +    |                                                         |
> +    |  0x000000000  +-----------------+ <-- 64KB aligned      |
> +    |               | PRAMIN Window   |                       |
> +    |               |    (1MB)        |                       |
> +    |  0x0000FFFFF  +-----------------+                       |
> +    |                                                         |
> +    |       |              ^                                  |
> +    |       |              | Window can slide                 |
> +    |       v              | to any 64KB boundary             |

Maybe:

    s/any 64KB boundary/any 64KB-aligned boundary/

> +    |                                                         |
> +    |  0x123400000  +-----------------+ <-- 64KB aligned      |
> +    |               | PRAMIN Window   |                       |
> +    |               |    (1MB)        |                       |
> +    |  0x1234FFFFF  +-----------------+                       |
> +    |                                                         |
> +    |                       ...                               |
> +    |                                                         |
> +    |  0x7FFFF0000  +-----------------+ <-- 64KB aligned      |
> +    |               | PRAMIN Window   |                       |
> +    |               |    (1MB)        |                       |
> +    |  0x7FFFFFFFF  +-----------------+                       |
> +    +---------------------------------------------------------+
> diff --git a/Documentation/gpu/nova/index.rst b/Documentation/gpu/nova/index.rst
> index 46302daace34..e77d3ee336a4 100644
> --- a/Documentation/gpu/nova/index.rst
> +++ b/Documentation/gpu/nova/index.rst
> @@ -33,3 +33,4 @@ vGPU manager VFIO driver and the nova-drm driver.
>     core/fwsec
>     core/falcon
>     core/msgq
> +   core/pramin

thanks,
-- 
John Hubbard

