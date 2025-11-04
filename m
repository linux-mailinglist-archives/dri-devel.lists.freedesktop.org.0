Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A72F0C334F1
	for <lists+dri-devel@lfdr.de>; Tue, 04 Nov 2025 23:57:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C70F410E68B;
	Tue,  4 Nov 2025 22:57:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="pzhkh6DX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DM5PR21CU001.outbound.protection.outlook.com
 (mail-centralusazon11011041.outbound.protection.outlook.com [52.101.62.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D2B310E687;
 Tue,  4 Nov 2025 22:57:23 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ISqXk3M/iLt+ZMRpKGt4EtGdqhp0jpAAvQwHrcFahyXFTIcggS843x6X3exG8F4Ciux05CRjiJjmwWdroCA6bXHHD8dNN/iX0oH7gKf3pUndjhZjL7DfumAhfjXm0QWV+glnxqVwsdSanhDQOVzvHDNKtsMoKmFEqOk8nipSonXFHP0w7Q+g6bfo+vCyisbwnGA/qgCoqc36QJ0nNA4ahNGe60U4F+9wBdlnad+elCSafGDaBz8fFH2JAERbEqen3dr0m2qWIFnWtY0HcjbP6DPuaGWpxVehmvHLO//bttdimNe8Q4A8UzOACQoVDbl3L6RMh6oFSNW4GN1jlnkBSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ztSVbg4pQAeKhRxWrCw4r7aWKyTMPNpdd9owqfQ1YF8=;
 b=BqbZOzXLMi8V4jXLNV5LkbzQ+9Ql0Bi5dYZmBJoSM67Wc1ltfJYEJ1dZiyKzmQ3Q10DeSzjZDw5UTJhteQOagjPptkNj+YWLowMuKgOdvskZYglDgAL9CtQIDxOH+M/sIdMeXuX1fItvqhhv43n9rtwQBEeA5PALn7BZj2yrVZn18b41LSD31GN9v/41qT0YYiILV4mTRsK7YBKYYajEUpFbSWwQNFjiiPBoaGXTnvJHBGHUN59b5r0C+rd4F5uM8DIuSxp+ALywIWMOUrZXZzzt2+oE4opVx0D1d4bjZUHjWgXVqXthzHHShy04a23CtHKgJTWnhQALjEc2uPunDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ztSVbg4pQAeKhRxWrCw4r7aWKyTMPNpdd9owqfQ1YF8=;
 b=pzhkh6DXYY+pUhB0PPIOPmfngmGid/F7/5nr7KgeCeA76G2arbSSaeQinZ/i2t5HEBaZ5HmLzPNcjkOqtEuYnn4C38YOlXE6AOuWSfJjZhFA6PQeHaNaXZdVcfhaxfTuYgq++mBv32P9m2eRph2bSVtXTvL8oGZqGVv6azRn7Ga0ZjaSaP5axdgjSG1KzLCPArSqRKG97DYT+uaXNNnGKuPWcKhAavgVLJGXBt204xKlXm45C0YtbBnbXcv3PCfoKvI8Oe8Kvh72YqWMpFhWe9utXm+S8+FS7eTi1bhOlK3W9OlyzyTrhBpxgxc1fm4Bjux88AEPXAu1IZcJEpHDgw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SN7PR12MB8059.namprd12.prod.outlook.com (2603:10b6:806:32b::7)
 by SJ2PR12MB9163.namprd12.prod.outlook.com (2603:10b6:a03:559::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.15; Tue, 4 Nov
 2025 22:57:18 +0000
Received: from SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91]) by SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91%2]) with mapi id 15.20.9275.015; Tue, 4 Nov 2025
 22:57:15 +0000
Message-ID: <c16cbd82-a2a3-4f98-b42f-2a474f706d16@nvidia.com>
Date: Tue, 4 Nov 2025 17:57:12 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 3/4] rust: drm: Add DRM buddy allocator bindings
To: Alice Ryhl <aliceryhl@google.com>
Cc: linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
 dri-devel@lists.freedesktop.org, dakr@kernel.org,
 David Airlie <airlied@gmail.com>, acourbot@nvidia.com,
 Alistair Popple <apopple@nvidia.com>, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>, bjorn3_gh@protonmail.com,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Trevor Gross <tmgross@umich.edu>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 John Hubbard <jhubbard@nvidia.com>, Timur Tabi <ttabi@nvidia.com>,
 joel@joelfernandes.org, Elle Rhumsaa <elle@weathered-steel.dev>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Andrea Righi <arighi@nvidia.com>, Philipp Stanner <phasta@kernel.org>,
 nouveau@lists.freedesktop.org
References: <20251030190613.1224287-1-joelagnelf@nvidia.com>
 <20251030190613.1224287-4-joelagnelf@nvidia.com>
 <aQSAijFQ6kBqI5f3@google.com>
Content-Language: en-US
From: Joel Fernandes <joelagnelf@nvidia.com>
In-Reply-To: <aQSAijFQ6kBqI5f3@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BL1PR13CA0321.namprd13.prod.outlook.com
 (2603:10b6:208:2c1::26) To SN7PR12MB8059.namprd12.prod.outlook.com
 (2603:10b6:806:32b::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR12MB8059:EE_|SJ2PR12MB9163:EE_
X-MS-Office365-Filtering-Correlation-Id: cc03ac6e-2b63-4f35-a3ab-08de1bf57f7d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|7416014|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Wkpwbit4RjdPZnVISTRVVzBrNS9xdXJzRmZkWkE5UHp2YzVib3luZzB2Wmh0?=
 =?utf-8?B?RXBOUGxROGE1MUhGaUVnd2JPeFFKNWZ5cjc1bzJLTmVnOHRJSHRubklZUVA2?=
 =?utf-8?B?ekU1QWN3RTVVTmdsNzlVdzJ5WWU4VVJHbEx1WnV0TFlMdGhPTHZqWWFyUU1m?=
 =?utf-8?B?UUhIVUZKOGg1Z20zeXM5Rk1waHVHS2ppOXl5Z3YyQXFwb3diVkgxRW9ya1NY?=
 =?utf-8?B?NEF6Rm1rbDl0eGtEQnB0M1dNMXhlRTVpOTlOdVBHYXowVk5JVFg1UU1EaU5B?=
 =?utf-8?B?N2JEd2RLTFUxaXlTTWswdkVzSEN3bzJ5eXJEeXk2Umg1em1Ubk0zcTFTQU1M?=
 =?utf-8?B?UXNlUGlEZnA1RFlGcHpXWWZQQyt0WU5ka05SS05ROGUyUHBFMDZaejM0Ym55?=
 =?utf-8?B?elROeCt4L2FhTWc2YU1zbUNQbzREUXNnd0ZkMmdjNWlsbVZvTjlvbFoveEVK?=
 =?utf-8?B?QnJUbldPRVhoQ1RscklscmQvc0h5VVh5OE9Xak16WFJoekEwLzBhc25jQmNy?=
 =?utf-8?B?bm9WWmJKRzl5UDB4cWZLblFhbSt5TzFnT0s3eUg3RmgrWEx4MmpaVG1QUG16?=
 =?utf-8?B?TkxWVnNRYytsYVpmaTR5ODlSWW44bVF2RlRxWVkybnd0S215aUNuWExnejJv?=
 =?utf-8?B?cWg3d2Y3M2IzZmFUYVdaN0FvU1o5Ym8rRVBBMkpobVoxL2tHS1haUWFiaG9J?=
 =?utf-8?B?ZWJvbGpoRTh4YkwyMm5ScnIwUzdMQmlKb01Vc2YyWVhhaC9xRWxuRng2V0pi?=
 =?utf-8?B?NUdGbmtwb0hDYm43RWdiamtlZlVRajhkWUY4aTBBeWVLSS9wOWJmRXdScFdq?=
 =?utf-8?B?cXJPSWhHUHVDek1zVkFtWjRXb1VUWVlpSXZTZkNqdHgvQ3RDUWd1VGsyaDJn?=
 =?utf-8?B?bkorWHVOZXp4VU5neDdHa3Q2b3dXT2Q5SnpTVG4yaHRYblNBb0JnYWRwN1lM?=
 =?utf-8?B?czczZDFhcUtVeFdTNzZEdnB1dGdtMTc3T1hEckZDSmtzREk1YW8vdGJEZ252?=
 =?utf-8?B?OTREZVBacTI1cUozMGpiNk1IbUxJdTdFL1Z3SWxkakMza2hSSVNYcTdZZkwz?=
 =?utf-8?B?TWo0cklySXIzdnFPK3RlMnl1VS9xV0JYYmVFaHNCaU1kalo5UTdzWHBvaEU1?=
 =?utf-8?B?R2x5VDA4VGFQcGhmdW0rNEhxZk4yL3Via1dDSllFckEybGhkZVl1d2YrLytP?=
 =?utf-8?B?RndSTVVHb0tCTUZqNjJ3ZlBLQStCdVRSMUVBNXdVU0ZBbndpcTh2eUI5cFZm?=
 =?utf-8?B?bEU1Q0pwZ0c1OG1BUlVTZ2FHSjdQNVArc3JCOVp0ZGRXMkZqL1l2QUZ0MW9Z?=
 =?utf-8?B?c2N0b0ZXV0R4aC8rZlY4VVY3cDJSTE1FRFVzVWlOc2thaU9SdStYL3pRQnRk?=
 =?utf-8?B?aTdSb091eXU4dXR6UFN6YTdpbjBrYS9HcTNYVG1vLzdmay9qd2tTckdkUlJO?=
 =?utf-8?B?N1BmUzVmYWE0a3NBZDlpODZETkFKNGlCK0dCb3dCWE5QdXg2NnNvVUgwL0tB?=
 =?utf-8?B?c2o0Q3UreXRTc2VwNlE4UlZMdDlmandpTEZzKzFnbGFzdnJtcmI2cEdpRE9n?=
 =?utf-8?B?SERKbkF0SUM2OUM5VDZrMXBHNEpmV0tPNEE2R08yYi85Sm01SHRpSGpuQ2hJ?=
 =?utf-8?B?Z25ocmlMeU1EczBTL2czMXd4amNuSUduSTErSWZZTGVEVXQyTk1GTkNJRGtH?=
 =?utf-8?B?SDN3bFRkbThpd1d0Y0VDbVdrUVh5ZDhUNUE0YUJpdkU2bGt6RXN3dld4M1ZS?=
 =?utf-8?B?Y0F5U3VDN1lXNUJFQTYwMU5RejFENG9VRUdvTjNKMnAwZ3A0by9VZmdUSGRV?=
 =?utf-8?B?Y2ZpdmZiWVp6MDZINnpLNXViL2x0TllxNGJGL1NWV09DblZDbUplYjlmM0g5?=
 =?utf-8?B?bTc0RGNaVjVyUmJEZ3RjQ0FmV1VqeW5YTmVHL3AzK0ZMOExYUk9tMEcrMUpD?=
 =?utf-8?Q?9EbcYB8MYni/tb3ygs5TnVPs4WISBIC3?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR12MB8059.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(7416014)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MUNJYmNMSVVoN1VaTTBtQVdhQXdvRjBqdXBqM2g2ZVB3dDFOWTN6ZjV4WnVP?=
 =?utf-8?B?V3k1QnhqelBUczBhcC9SdHNEa3RRdVVqNmIwQVNhcjZwanZVZzBUZWphVmRt?=
 =?utf-8?B?aDZBRm9Kalk4ZW0vdlpjZE8xSVk5Z1FqM2xVV1phUnJYQmRKZWFwZXdtR1RE?=
 =?utf-8?B?Mm96SEVjZG10SjQyS0ptNE5NU3h3OEdyL0tlZHJveldUV0VLNlJGdHErZFRo?=
 =?utf-8?B?RHJycWE5a3krSDdxQllMVGdlUWVmRk4yb1BBMWpNK1FMekdSNXAwQ3JKUzhq?=
 =?utf-8?B?UXQxd1hnMlFDZWdVY1NTeXRJOTdBeWZXc1A3QUVHM0dVWmFkZDZXZmwrbS9i?=
 =?utf-8?B?anNJcGkzYTVreWN0TXF3VXlERHRBOWpzTTZYU0I2MHlqRzFlR0U1VjZUK1lT?=
 =?utf-8?B?TStyaUw2S0VhV3VxT1JOQ2k5Um5oSUZ2S2lqalNiVHBleEs0ODBRdDE1b3Z2?=
 =?utf-8?B?N01iWmZHZHBlV2NHSExDTjM2RktQRm5BUXV2b1FIYU5ML0cvbE1obHh6Y3VS?=
 =?utf-8?B?a0dtZWRReE5oTTRvdFRiRXZCbmlWam15RW0xbkIyb0hOWjZUejQvT0JId201?=
 =?utf-8?B?ck11Q0Fab1dBdVdIS3NmY3d4QjlLQ2t4b29KV2kyT0RQSlVObDM4dlR4dUJH?=
 =?utf-8?B?MmhKQWNVbmxySTBGWVJmOWZLaGpXdVJjaG9MdjdKenJNZnY4M2VubC8yV1gy?=
 =?utf-8?B?R2hmTjlTZDlGcDBiY2lJb0NjMHlqVG9UVDFRL1pmYkdrekE3UnhmTzZlbGR6?=
 =?utf-8?B?cktLQ25yNU4xdGtwcU52ZGI4aWFXejliSUQ5VUdTblJqR3ZERkhrb2ZrakMv?=
 =?utf-8?B?MFNmV0ZLendtVWx0UlAxVTdtZHdFOXNqMmJGdWZoN2VqYlVKNUlOOEhPOTR1?=
 =?utf-8?B?YktKaHdkTGphaFdkUmhwR0xiNTBNT29BNlYwVDRsRWdIMVFtb01GZ0krQ0hJ?=
 =?utf-8?B?dUxsc1J3RVQ5d3UxOTJWQTNSOGhzbktpcG5CSityQkJJbkZFTHl2MlNubktD?=
 =?utf-8?B?dHlKMFdmZ2VSdDRZTUtVeTVobG1QQzhKZUtTQStNNnEraXdwNHY0dkZMeE0y?=
 =?utf-8?B?cDNBeGdOOTRPNWdEbjZudjJLcjYvcE9lQnlzazlSUVA1WlhRL0ZiNDFnNWdE?=
 =?utf-8?B?TTUzRU9YTG5mQ0JST2YvUVRwaGM1RlE3QmZuZzV2QzFJS2NBM0xSZDFUNzY0?=
 =?utf-8?B?aTg5TzRkcnpQNzA0bGZOaGZkY05taGJlL25xZ2Q2TCtXRWZ1eXp4QmNXenBp?=
 =?utf-8?B?Si9TSTROcVQwVThnZzR6WGl1eTc0Q0RmL1Z4VWZ1V01wNW9DekpxMVdvbEpF?=
 =?utf-8?B?dU56TnVST01aVGtudzhYMTRCZi9UcEtDam4xNmlzM1VSd3BLcCtDa0NicXcv?=
 =?utf-8?B?T2tJWDJLZFdoeU5TZ1RZelJOQ1lZZFg5a01Hb3NVK2M1QVRCMzZNK29DTFM2?=
 =?utf-8?B?YXduSndIekwwYXd3VThUazNHdUlsc0hWSVRmbkxOVUFzSHBFWVN5QTY3RE9h?=
 =?utf-8?B?K1k5UzZ0dEhsNGJlOFY4TGtNaDFzU2tZOGtidnNCbFRESm9RUjVFM29jQ2dO?=
 =?utf-8?B?ZTJSL0VLYTN3Mjd5bmgrNTdwb0orYTEvQXpjc21YclZONlBLVkFzNHlPakhu?=
 =?utf-8?B?QjlEbU9jUVg3M0xSMlhZblJFWGI1N2ZTTFVoeU54RVgvZlQzTE4xdldFeGI5?=
 =?utf-8?B?VUt6ajB1cTB3Ui95K0ZOYVZWSEY1YWpubXJkNlk0TU5FYmJ3WHNJc2hSTDho?=
 =?utf-8?B?YzlnazkxandYcFNuQ0RJdm5meHQ2WGRaT0RRYklib2JFbW1jRmtldUhVWHJa?=
 =?utf-8?B?ZGMyOEdXMDl2TmZYK2NabzBweXd4UTh2cTZZVTR6aGVuL3JTOVFwWWx0N0Ru?=
 =?utf-8?B?WlppTHlUM3V3OTg4K1pUT1AzZTZ3aXJhTm1lbjU4RU5PcksyZ0FtU2tkVGFR?=
 =?utf-8?B?QU4vRnV6RXBHdS9tbStRb0NMZ3hNaEtyVEVYYVRyQndaK0tSZzJ4NDcxYjhw?=
 =?utf-8?B?aU1vbERXcmNja2c1RmZNTDFLcWI2RFBqYnpZKzEveDEwbjUySFY5TUJmY09B?=
 =?utf-8?B?TWFLV2pwOER5ZS91Y0Q1d0Y5T3RpbWRuZTNBOUgrUTB4ZkQ4R3VaSzZDQU1r?=
 =?utf-8?Q?ldCGVynY6nGD0q/nsx5LNnemU?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cc03ac6e-2b63-4f35-a3ab-08de1bf57f7d
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB8059.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2025 22:57:15.5046 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: drqaGNDFPCmlPKE6aqFIYj6GgDzXKg3tjnn8WD7wHlaecDUZNMUnQq8KuKjJ8majK3a3L3gtzfv4F/PnXtEa6g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB9163
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

Hi Alice,

On 10/31/2025 5:25 AM, Alice Ryhl wrote:
> On Thu, Oct 30, 2025 at 03:06:12PM -0400, Joel Fernandes wrote:
>> Add safe Rust abstractions over the Linux kernel's DRM buddy
>> allocator for physical memory management. The DRM buddy allocator
>> implements a binary buddy system for useful for GPU physical memory
>> allocation. nova-core will use it for physical memory allocation.
>>
>> Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>
[...]>> +
>> +/// DRM buddy allocator instance.
>> +///
>> +/// This structure wraps the C `drm_buddy` allocator.
>> +///
>> +/// # Safety
>> +///
>> +/// Not thread-safe. Concurrent alloc/free operations require external
>> +/// synchronization (e.g., wrapping in `Arc<Mutex<DrmBuddy>>`).
>> +///
>> +/// # Invariants
>> +///
>> +/// - `mm` is initialized via `drm_buddy_init()` and remains valid until Drop.
> 
> Usually an invariant is a statement about the present rather than about
> the past. I would say that `mm` is a valid buddy allocator.
Noted, and I will change it to that, thanks!

>> +pub struct DrmBuddy {
>> +    mm: Opaque<bindings::drm_buddy>,
>> +}
>> +
>> +impl DrmBuddy {
>> +    /// Create a new buddy allocator.
>> +    ///
>> +    /// Creates a buddy allocator that manages a contiguous address space of the given
>> +    /// size, with the specified minimum allocation unit (chunk_size must be at least 4KB).
>> +    ///
>> +    /// # Examples
>> +    ///
>> +    /// See the complete example in the documentation comments for [`AllocatedBlocks`].
>> +    pub fn new(size: usize, chunk_size: usize) -> Result<Self> {
>> +        // Create buddy allocator with zeroed memory.
>> +        let buddy = Self {
>> +            mm: Opaque::zeroed(),
>> +        };
>> +
>> +        // Initialize the C buddy structure.
>> +        // SAFETY: buddy.mm points to valid, zeroed memory.
>> +        unsafe {
>> +            to_result(bindings::drm_buddy_init(
>> +                buddy.mm.get(),
> 
> After this call to drm_buddy_init, you return it which moves the struct.
> Is the struct safe to move from one location to another?

It is safe to move this struct since it does not contain anything
self-referential or DMA buffers. But we should pin it for more robustness/future
proofing. I will do that.

> Also I usually put the to_result outside of the unsafe block.

Will do.

[...]
>> +
>> +    /// Allocate blocks from the buddy allocator.
>> +    ///
>> +    /// Returns an [`AllocatedBlocks`] structure that owns the allocated blocks and automatically
>> +    /// frees them when dropped. Allocation of `list_head` uses the `gfp` flags passed.
>> +    pub fn alloc_blocks(
>> +        &self,
>> +        start: usize,
>> +        end: usize,
>> +        size: usize,
>> +        min_block_size: usize,
>> +        flags: BuddyFlags,
>> +        gfp: Flags,
>> +    ) -> Result<AllocatedBlocks<'_>> {
>> +        // Allocate list_head on the heap.
>> +        let mut list_head = KBox::new(bindings::list_head::default(), gfp)?;
>> +
>> +        // SAFETY: list_head is valid and heap-allocated.
>> +        unsafe {
>> +            bindings::INIT_LIST_HEAD(&mut *list_head as *mut _);
>> +        }
>> +
>> +        // SAFETY: mm is a valid DrmBuddy object per the type's invariants.
>> +        unsafe {
>> +            to_result(bindings::drm_buddy_alloc_blocks(
>> +                self.as_raw(),
>> +                start as u64,
>> +                end as u64,
>> +                size as u64,
>> +                min_block_size as u64,
>> +                &mut *list_head as *mut _,
>> +                flags.as_raw() as usize,
>> +            ))?;
>> +        }
>> +
>> +        // `list_head` is now the head of a list that contains allocated blocks
>> +        // from C code. The allocated blocks will be automatically freed when
>> +        // `AllocatedBlocks` is dropped.
>> +        Ok(AllocatedBlocks {
>> +            list_head,
>> +            buddy: self,
>> +        })
>> +    }
>> +}
>> +
>> +impl Drop for DrmBuddy {
>> +    fn drop(&mut self) {
>> +        // SAFETY: self.mm is initialized and valid. drm_buddy_fini properly
>> +        // cleans up all resources. This is called exactly once during Drop.
>> +        unsafe {
>> +            bindings::drm_buddy_fini(self.as_raw());
>> +        }
>> +    }
>> +}
>> +
>> +// SAFETY: DrmBuddy can be sent between threads. Caller is responsible for
>> +// ensuring thread-safe access if needed (e.g., via Mutex).
>> +unsafe impl Send for DrmBuddy {}
> 
> Generally, we should implement both Send and Sync unless we really can't
> do so. If methods require external synchronization, then those methods
> should be marked &mut self and then you implement Sync.

Thanks for letting me know the convention. Just to clarify, when you say "then
you implement Sync", you mean "then you implement mutual exclusion, say via
locks" correct?
> If you instead omit Sync and make the methods &self, then the caller is
> severely restricted and can't e.g. store it in an Arc.
Ok so I will implement Sync and keep the methods as &self since at the moment,
mutation is not required. Let me know if I missed something though.

>> +/// Allocated blocks from the buddy allocator with automatic cleanup.
>> +///
>> +/// This structure owns a list of allocated blocks and ensures they are
>> +/// automatically freed when dropped. Blocks may be iterated over and are
>> +/// read-only after allocation (iteration via [`IntoIterator`] and
>> +/// automatic cleanup via [`Drop`] only). To share across threads, wrap
>> +/// in `Arc<AllocatedBlocks>`. Rust owns the head list head of the
>> +/// allocated blocks; C allocates blocks and links them to the head
>> +/// list head. Clean up of the allocated blocks is handled by C code.
>> +///
>> +/// # Invariants
>> +///
>> +/// - `list_head` is an owned, valid, initialized list_head.
>> +/// - `buddy` points to a valid, initialized [`DrmBuddy`].
>> +pub struct AllocatedBlocks<'a> {
>> +    list_head: KBox<bindings::list_head>,
>> +    buddy: &'a DrmBuddy,
>> +}
>> +
>> +impl Drop for AllocatedBlocks<'_> {
>> +    fn drop(&mut self) {
>> +        // Free all blocks automatically when dropped.
>> +        // SAFETY: list_head is a valid list of blocks per the type's invariants.
>> +        unsafe {
>> +            bindings::drm_buddy_free_list(self.buddy.as_raw(), &mut *self.list_head as *mut _, 0);
>> +        }
>> +    }
>> +}
>> +
>> +impl<'a> AllocatedBlocks<'a> {
>> +    /// Check if the block list is empty.
>> +    pub fn is_empty(&self) -> bool {
>> +        // SAFETY: list_head is a valid list of blocks per the type's invariants.
>> +        unsafe { clist::list_empty(&*self.list_head as *const _) }
>> +    }
>> +
>> +    /// Iterate over allocated blocks.
>> +    pub fn iter(&self) -> clist::ClistIter<'_, Block> {
>> +        // SAFETY: list_head is a valid list of blocks per the type's invariants.
>> +        clist::iter_list_head::<Block>(&*self.list_head)
>> +    }
>> +}
>> +
>> +/// Iteration support for allocated blocks.
>> +///
>> +/// # Examples
>> +///
>> +/// ```ignore
>> +/// for block in &allocated_blocks {
>> +///     // Use block.
>> +/// }
>> +/// ```
>> +impl<'a> IntoIterator for &'a AllocatedBlocks<'_> {
>> +    type Item = Block;
>> +    type IntoIter = clist::ClistIter<'a, Block>;
>> +
>> +    fn into_iter(self) -> Self::IntoIter {
>> +        self.iter()
>> +    }
>> +}
>> +
>> +/// A DRM buddy block.
>> +///
>> +/// Wraps a pointer to a C `drm_buddy_block` structure. This is returned
>> +/// from allocation operations and used to free blocks.
>> +///
>> +/// # Invariants
>> +///
>> +/// `drm_buddy_block_ptr` points to a valid `drm_buddy_block` managed by the buddy allocator.
>> +pub struct Block {
>> +    drm_buddy_block_ptr: NonNull<bindings::drm_buddy_block>,
>> +}
> 
> This type is exposed to the user by ownership (as opposed to being
> exposed behind a reference), and has no lifetime annotation. This
> implies that the caller is allowed to keep it alive for arbitrary
> amounts of time.
> 
> However, it looks like dropping AllocatedBlock would also free this
> Block object. That is a problem.
> 
> The ownership of Block should probably be tied to AllocatedBlock so that
> the borrow-checker prevents dropping AllocatedBlock while Block objects
> exist. Or this code should be changed so that Block keeps the underlying
> AllocatedBlock alive using a refcount. Or similar. It depends on how it
> will be used - if Block is stored long-term in structs, then you should
> avoid lifetimes, but if it's a view into AllocatedBlock that is not
> stored long-term, then lifetimes are the right choice.
> 
You're right! Thanks for catching this, I am leaning to the ref count approach,
but I'll look into the use cases more and designing it accordingly.

thanks,

 - Joel

