Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BCA3BACB8A
	for <lists+dri-devel@lfdr.de>; Tue, 30 Sep 2025 13:42:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 710B810E59C;
	Tue, 30 Sep 2025 11:42:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="cZLN02vl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BL2PR02CU003.outbound.protection.outlook.com
 (mail-eastusazon11011011.outbound.protection.outlook.com [52.101.52.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A1D110E59C;
 Tue, 30 Sep 2025 11:42:04 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UftiNDPfoblxx+2ygyUgo7ZQ5DtV11szSGR6QcLeNUytGKeXPPePxpTt52mSdO1q+4TLI8A0yb+dzNmDbbHhdxqwI8KKa7UEI4JZWpo7UiNMZWbsu/bweeIIJhn+7yT8darfMDk7lRVjphXwMo9OH3gizyesmq7PlhCxqVb1myTwsliHBQDp4w6oGPSvmyCfrpvtghI8dJIMtLm9FG0tn0uCiE9q+Oc2k0AxH4fNOzIVTtI93n65wwSk8NlCZYJjWgswb4MW8TikjUc0H/1lqpgw7GR1VRKl3N7yhdwhTjuVzj3iL0jEuV/JXgpQaBkvDPjTbl9hE7VrusXZr0Z7xA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uD9K7TexCe+CsHX0KX581wXQdit3bCgt0djfp9F9XpA=;
 b=BBpFhEqKMJLZRXOvCc1NEtKZHyl+GiNvsf4Cu+N/dudqa+CAEvwqTBt7AhulSgwUv1UZ9H975jMBaHRXSrV67uS/e3ukI8SDeY06jDDsm0gWxHFuHicxbtXMPhfMlAKHfagbmPF2tdN4MT4JCSn+AAQkt0z3YFfc4IZ2X5sWHAmpq8+cntU3vaJ3+K66EkH3PeUDlVgvRQotQM+SUZgHjePsIPRIzcoCWkBxryasj/CD674g2MqmXtwBa0j7nDUJ+UJQBCRvu4AJLew0DKyFpQD/omCiEab2voKOgI75j5sh5Bt41VoNGbB8FZd1vYU4jGSnn7umJanZ3HSLASvI2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uD9K7TexCe+CsHX0KX581wXQdit3bCgt0djfp9F9XpA=;
 b=cZLN02vl6ZdnqsNFSdb4fxXbyEtmkBlZGqdEkgekOBLMTeB7DJK9uyWuawTvfbZHmreXMtN0n9zSIbQ4IqIik7wdahHdbWyxOwkE1zsT1dcS3eWdWBWmDKYk2ANQMCx1x5mJBW4xfZLnpC6zU7Z4Dkszr1GmZ3zO3QBZbff+4a9OLYOUBramsxxIGUsmiOLfnOFEyNObwd31QfmoWYB6pYzxs0D4pKh67Ds4Dq5TWdmYzwg1JCLn9WtccIPBMSSHkbQ9x+KduwCi+YTkj7qDOgUoBWmieTJfZSpvFG4cUkm39SVXQMTDNus6iz+Zl+g2O28fkDh6+JmeXW+cO8U+Sw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB7726.namprd12.prod.outlook.com (2603:10b6:8:130::6) by
 SJ2PR12MB8928.namprd12.prod.outlook.com (2603:10b6:a03:53e::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.17; Tue, 30 Sep
 2025 11:41:59 +0000
Received: from DS0PR12MB7726.namprd12.prod.outlook.com
 ([fe80::953f:2f80:90c5:67fe]) by DS0PR12MB7726.namprd12.prod.outlook.com
 ([fe80::953f:2f80:90c5:67fe%4]) with mapi id 15.20.9160.015; Tue, 30 Sep 2025
 11:41:59 +0000
Date: Tue, 30 Sep 2025 21:41:54 +1000
From: Alistair Popple <apopple@nvidia.com>
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, 
 rust-for-linux@vger.kernel.org, dri-devel@lists.freedesktop.org,
 dakr@kernel.org, 
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 John Hubbard <jhubbard@nvidia.com>, Joel Fernandes <joelagnelf@nvidia.com>, 
 Timur Tabi <ttabi@nvidia.com>, linux-kernel@vger.kernel.org,
 nouveau@lists.freedesktop.org
Subject: Re: [PATCH v2 05/10] gpu: nova-core: gsp: Add GSP command queue
 handling
Message-ID: <had7hms7ex4w4bvy2mfwtltyyt2xhsn572brrxvibvufxt6fuf@lppudpzwct4a>
References: <20250922113026.3083103-1-apopple@nvidia.com>
 <20250922113026.3083103-6-apopple@nvidia.com>
 <DD2GCDGQ7Q4W.1CSFYSETFSN5H@nvidia.com>
 <7brvf66smc3ltqrw7tm7smth6wnefeqykdm2n4qahi5xnr6d5o@4l5xfdbznlp3>
 <DD5CXDR294YD.2RL474PWBDWTV@nvidia.com>
 <CANiq72k3qkj1HxjnCoknAdWhdM7O1ZBkZDqBsVS7vxYH-tRCWg@mail.gmail.com>
 <DD5D5SRBMW4P.3JJPQVDF5BZLU@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <DD5D5SRBMW4P.3JJPQVDF5BZLU@nvidia.com>
X-ClientProxiedBy: SY8P300CA0001.AUSP300.PROD.OUTLOOK.COM
 (2603:10c6:10:29d::31) To DS0PR12MB7726.namprd12.prod.outlook.com
 (2603:10b6:8:130::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB7726:EE_|SJ2PR12MB8928:EE_
X-MS-Office365-Filtering-Correlation-Id: 0e4c685a-0805-4fd7-50f8-08de00165d91
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|7416014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Wjd5U0Jkc2cwZ055bWMvUlp1NVNrTXREazBGbGxkL3ZGaXpHL0llTC9aWGc1?=
 =?utf-8?B?d2N5Q0hBb21QaVZsZ0dQckFaUEs1VDEwNDl3TG1sOXRsTWNFOEM2N0JLN2FI?=
 =?utf-8?B?M1pQWW1vekFyZE81VE53Mjd4TG41NW1rL0drSlMrNWR0OHYydVBZMFlnMHU2?=
 =?utf-8?B?dXBDYzY1WWtSR1ZpelgxUXlnc2dmRnlORjBQSGV3UWxTK1drYUFUS2ZLZDJw?=
 =?utf-8?B?V0tBSjZ0N3JteHRnQ0hQem1ONTUxTk81ODJwaGU3bzZwSnZQSHN1K0tSMSt2?=
 =?utf-8?B?UlBrd3VYbDVUOFFqajJDMklvZjhmVG0xbXVsUWJkNC8xZlg3K09BRnQvTC9Z?=
 =?utf-8?B?OE4wRWZyMnAvS3d1WDl4Y0dnOGQrM1BwZ3VXcFRVaHR3VmxKMU5RSGhmZngw?=
 =?utf-8?B?THpxbUlQaDFXTFZDeVduZUFvTnlEUVNKWXpaVml3Z0pFN2xTc3luQWFWR3pO?=
 =?utf-8?B?ZUhYS29WKzgwZW05dk9IWE9yKyt0akJkWjlxblk5Z2dDb1BDSGl1TEI3RkFC?=
 =?utf-8?B?ZTNhWnBKcFVqNzZ5Q3FrcjJzM20rSitEbHdwdERXS0Y3clNKWGpENnJjeUJV?=
 =?utf-8?B?cjY1R1JVd3Z4RytSOVFFY2M5U2RiaStvUGsrQ3hCcm9HbVpUekliVHVXMXJ2?=
 =?utf-8?B?V2JzZi9JMW5xZnAwS294T1JhdFFraXhVTmZJRjJHeGU4MTJSRlB4VUVKazhO?=
 =?utf-8?B?b3gydDdaVUdUQWdwSzlpSDhSZGR4QW9DZWg0aExrTDFEMXNrVEpyMXJMV1kw?=
 =?utf-8?B?R0JWQm91UFU0TndsSmJBVFg1Z2czWGVwcFBGMDkrS2htaTd2ZnYzS2h1anQ5?=
 =?utf-8?B?Y0NBK1BvQ1R0YWIvalNxSDNqOHVMcW1ScytjNXZmWUxsTVlGMXRybG1qZGtL?=
 =?utf-8?B?NE02ZVpYVG0yWHJudUlGUmV1RnF2UkNnYk9vWUhjWG5xV2xYaEY5UytCU3dW?=
 =?utf-8?B?d2Jjd1dPdUt5QkN4dFhRcjJXZklBeEtsQWpMaWFnSU83aXhMWW5QWTA0Y1V4?=
 =?utf-8?B?eklwbld1NEZGYVVuelJIL1ZvSmlzcWU4Q1V0UThoajFHaEE3Tm8rZGpMNitU?=
 =?utf-8?B?VzF6OHpKdlk3aXV1V1FRL09GZUM2SjJaVTNhQWxNNldzT3M4YjN2RVd5dXcy?=
 =?utf-8?B?RUhybkVaVFAxWEU5UUFQOVlEMm82dXVoUENKV2xwRWhZVVorejB0YTRyR2U3?=
 =?utf-8?B?MW9zSjcxSjVhbnJXY2c3MjlLTkNJUEZ5QzZHRldZd1kwcVlEUFFaT2FNTHJM?=
 =?utf-8?B?b1hZR05lUWRBLzlyY3d2MENoR015WWlCTkRwRDc2UUJjRTJxZVRDY1JTOEFW?=
 =?utf-8?B?cnhxdFVldWZocUgySXh1czJxeTNvdVdnSys1L0szeTYyejhlQTVpSDZRODFz?=
 =?utf-8?B?QXdsUDNDdS93K05XRlcwQlJGSEhtT3pvT05xek14b1BTKzR2bUNHdXNOZjlM?=
 =?utf-8?B?NGZVS2taWSs1M0Z6NGJDcjlSR1JoSEtRWjB6NTZ2UU84YVlqWWt1by9xNjQ2?=
 =?utf-8?B?SWE0VXhlK0p6dTBhcTdjcnh6MXNMU1E1dkY1bXo3TThieUNwRXMwZm5iTWtY?=
 =?utf-8?B?MU5yb2lWNGJvaEFGcVdJYkdXdnFUWXR3MjJBYzdieWk3eFc1a3QrT3k5Y1hT?=
 =?utf-8?B?T2FyOUNtc2tVNlE0MmtOU2lwMG1kSFFzeVg4czl1Zjk5SXdMR2tzU2tJTDlG?=
 =?utf-8?B?a2x6TnE0bFFlOW9JTCs4c0pTb1NvMGZqSlpNVVI1SW5tK2lQd2RSc1BjOFhY?=
 =?utf-8?B?Q2l0N3RjWWljNyt3ZHNOODkxK1g2VUhRS1pJSGZVOWRnTmRpbk51MHdibFRn?=
 =?utf-8?B?eHJjR1h2MXRZRFY4Sm5xenB0VGZLMTllZWFVTDNoWisydkRVQlIyZzlJMnlX?=
 =?utf-8?B?dTlvNVFCV0JGTSt1VUprL0Z1b2d3THZ5RnJkR2pHNDdWd2k0NXB4UjRQTkV4?=
 =?utf-8?Q?SYeRu6I833DuVFlxGb1UKxD6/O+9njgV?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR12MB7726.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(7416014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?L1YzMFhab2RZekl4Y2hLUnF5UlFEclRFMUlrUzQ2ZTdqQ3pmOGRaM0pDV3RF?=
 =?utf-8?B?V2x3YlU0eWpOQmtKcTZKMTVrYlByRUlMYS9vMTNWeDRpR2duUDNsc2RSWlNE?=
 =?utf-8?B?cUJpVHNmTjhKaE1KdmdnNFhGRDJaanJzdWpUQ2phOWNvNkl5MmxwbTNMWkkx?=
 =?utf-8?B?MjFmTkJuWWtURExoMlh2TVBpcTJXWlhlaWJaajlVaHgwcXRuWktndHVqbVps?=
 =?utf-8?B?dDF2WWpWa1pnZHppS1FHSVVjRXFMWmtyeTlBMFVKNTl5djRScTdnNGRwQllP?=
 =?utf-8?B?Q1Zob2NwT1RWamR5VmJoZ1MwblJhdFJSY1NhMFlnSGNja2xLTzFEM0NEeWNS?=
 =?utf-8?B?WlpiUW8rRVlPNURjQmwrK1habWJFeVhlMnBBTjF3V0dFZHFOamhhVVNyZDZM?=
 =?utf-8?B?RituRlZ3UmZtL0tueWM0YlFxblN4TmJSVStUM2JlVURNeXRLYnZuNHNyaGJt?=
 =?utf-8?B?QWV4cWlacVA5SHZFSkxyK3pYOFFjOFkxS1VDK0czK09uc0hKRG82YzZWaEhM?=
 =?utf-8?B?QWduWlFQRWc1RndwS01GdGNZblNaeGFsRzJVd2pvcTh5TGZUei82ZmlsN3Ri?=
 =?utf-8?B?UThGUWxHWnF4SURSTzYzTGVCWHEyRldVeG5RL1Nvd0pDalA4MU5rUlJsTGND?=
 =?utf-8?B?TnBBVnZRMzRsWkhLWHU2ejRzcHp5ckxmR3BTcnIvNUVuU1NBQVB1Y2hLMGhO?=
 =?utf-8?B?TWppekpRNE0xYjZaSURXZWZKV0dvaDN4V01neWlIdDdLK0ZVSHkxRDVGUGZ4?=
 =?utf-8?B?eEZJT2xKY1JqZlQzem03R0V1dlZDbEtCTXA2MUFzS3FNNlR3czVucHhNalMx?=
 =?utf-8?B?akxITElIT0hFcnBrK3FONThKWmVMQnVuamQ2U0xHSjAySTZWcWkwWUZlSkR2?=
 =?utf-8?B?RVgrVm5Uc201SFFwTENOYVpBdEtJSFVYZDdTUGFQNkFZeDVDZUhNUDBZNkJs?=
 =?utf-8?B?ZTlMM2JLUUFyMHNUZDNHTXVmTkJxdDN3VC9Xa0ZXZHV6SHFmakRmbTZwRmtk?=
 =?utf-8?B?VlErQVEyaVFLN3BnKzd2R1V5WUlQQWpZOWRTY0VOTkdSNkthOHhJTE94ZDRY?=
 =?utf-8?B?U2Z4cDNDdW4ySEFvRk5CcVhNZFExMkpKY0JVZ2NXV2RTRmxvWmNBVlVpdFNG?=
 =?utf-8?B?YzdnTkxpRlRLY3YzSlE4dVZXWVYwaFcyWCsvV0JxMy9FemVZUXpFSFRwUWVE?=
 =?utf-8?B?YUt0b0k3RWhtUjNid2o3UXNpVkFNLzY2djk3TGlUNVRESEZHUVdZSzcrUGFz?=
 =?utf-8?B?OG40NnBUamhTRDROTndQU0tzalVmSUJyZGE2RTg1NlhoVTRhVVhOZy9qbDRK?=
 =?utf-8?B?YzhzZ2N4eXF1b0ZlMmxHbXFqck1sMGtnQ09uOVJvZW9IR0pHM2JWazhpMlRS?=
 =?utf-8?B?TWdjQ0hjaFJmc3RyenpXK2J6WjNOWU16c1pnaUMzdFFEaW5CVks2Q2ZJZXVL?=
 =?utf-8?B?Rm9LbkFWb0hldmlNT08vZkVHOGRFVk9GRFlhUkpSdDBBM0pOT0MrSnp2M0wz?=
 =?utf-8?B?S255bXZXWjB6b3QvdkxHZnczS0E2NjlrVXpTWXRrNVR2SHV0YU1pM0xTQWU5?=
 =?utf-8?B?OUJWbkk1MnJWUkdDbVNnVWZ3WXFUZzBmNFZ6OTJGV0dZeGhMMVVrWndFMUpG?=
 =?utf-8?B?dlZLOFkyOWxhRkRyVGpyZk4yc3pDQ29jeVJlWkhHalpmQzJlUnNYQk44aTBR?=
 =?utf-8?B?OFA5TUVEb1pzbDlhVnViMlErZmNOY0ZncVJTNVVWVVUvRWp5azBHOUpoQXlD?=
 =?utf-8?B?QXp4ZmpLQzRQWTQvUDBGYkMrZW5WTXdKVXFWWlBxMGpQaXB1cG5jY1YxTW02?=
 =?utf-8?B?ZnNQdkJFNWx2ZHdJNS9JREJ0VTAwSVFudWQ5bzVHaHhwSFlNekNIb3g2RXZ0?=
 =?utf-8?B?eVBBdTFwalpLWHRZamt6VUxab2daTVZMOFd4aWdvdzVjaHRXRmRPZElJNUpW?=
 =?utf-8?B?T0lWeCs0NDB1TGdxUjVTTjV3M0hOTytxRkxqSVVFVFdTSmloTFhDRFRMR0NI?=
 =?utf-8?B?WDF2S0cyZ2VWc2dJZjZjYWlWR2FRbnRtczFIN1NudnNML291bXdrblZVZWFJ?=
 =?utf-8?B?OVptd0cxYUxja3NqTnk1NVN4TzNhZk5qVGloY3FxVkFaa1FRaWVYRkNxYkN0?=
 =?utf-8?Q?xoMXnK76lRMy4qyO9DhWG10cl?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0e4c685a-0805-4fd7-50f8-08de00165d91
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB7726.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2025 11:41:59.4679 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aS/YpkMv2OkYfwycjbPDrXgTCm7PmHbl3gKq5f55kxUPS7UYc3eW/8Vqnu2wRXL4Z+2q4s20CQC/sDQzWB6EsQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8928
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

On 2025-09-30 at 00:45 +1000, Alexandre Courbot <acourbot@nvidia.com> wrote...
> On Mon Sep 29, 2025 at 11:38 PM JST, Miguel Ojeda wrote:
> > On Mon, Sep 29, 2025 at 4:34 PM Alexandre Courbot <acourbot@nvidia.com> wrote:
> >>
> >> I think you will also need to explicitly enable the feature somewhere -
> >> for the kernel crate it is in `rust/kernel/lib.rs`, but Nova being a
> >> different crate I am not sure where we are supposed to do it...
> >
> > `rust_allowed_features` in `scripts/Makefile.build`.
> 
> Ah, that's where it was! Thanks a lot!

Thanks. Is it still expected that `#[allow(clippy::incompatible_msrv)]` is
required? Just adding it to `rust_allowed_features` doesn't make the warning go
away without the allow, but maybe I'm just doing something wrong...
