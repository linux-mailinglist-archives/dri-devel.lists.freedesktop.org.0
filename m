Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D6E98C0D65F
	for <lists+dri-devel@lfdr.de>; Mon, 27 Oct 2025 13:07:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E1AD10E455;
	Mon, 27 Oct 2025 12:07:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="Ezy5J+le";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CY7PR03CU001.outbound.protection.outlook.com
 (mail-westcentralusazon11010000.outbound.protection.outlook.com
 [40.93.198.0])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 152DD10E452;
 Mon, 27 Oct 2025 12:07:30 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yK5BDZ75/ToPS32qjT3m70QfscEX/xeY1W5XffvkLLR/qz58WG1gTzpy4h1NPCTMkH04OYZ40/lCd30EBaez4ARj//hnUAWHqp6prUwcYpJrfn+SlZjd0cbC/eIM0lwkaO/TfKIHQIPjmYryhJkAIWrezzFyikeWX++FjlAOelyGCdzguk/xc4bD+ePO+3ocyvnwJ451KN0kBclimItccXFq+RUr4FBbhXY4VFGQb1NysPMzjHxfvpXIxzXeYIyAmjhMs69Z50I14+XLmEyDzOidOYg2svHltDHZt9L9QDBTtB7zsk+lAc9gH4vZaGfAIQIeue5z6MULhRux9yw+Hg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=E7eDIMYf4gd0p4S+PTzQB48BQHCXJEXRrktO2CxGWCk=;
 b=yIOgm5xgbktppb+a/U/he74gWUbReNoPDCuoPu/nCovh3bkxXfqUWDFMgeW7a3Ud0xa+GwW3Ryt78ma1d7DjLR8AxhToaUBoI8zCxhUU+kQV3aOM0HM9+M0BgSML1sX51jMCSzjiiK7RFvT2Tdo4oKRIgm3ghdwBqIGO8/w3aBo/ypGPLr5lv3V8W79eunFr+aFlbT4Tdnk6KVJ7LIoQjtGG8SkQ2az8nb8cWYPA5gbvlNZSY5JnfTLVfsvRaDs5NYB5MebL68f4Thl8dms67CeyS96NcBko8vJfqXpn/59BjRVtQrc51u2bQ4rsZTH7yzf9pHeUoWO68FMaTqExuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E7eDIMYf4gd0p4S+PTzQB48BQHCXJEXRrktO2CxGWCk=;
 b=Ezy5J+leDfU+YfukB7aaanxUn79McKx7z8CkCIV0KKIqvpekxwfUdRJoUOOteJ09HukNm+Ub9l4CYHzQCPlUINwfj1QQMtzGGTaWWxisd5jwDLuw6FJQVhXVkpiDmZTzJwp5Zeaw8QPYBnieSi0TrA+8QPrcsXwKsfFNbTi8NIZUrndTv79hvo/0ejc+4nYvoiu9kEDozLwPjC84MVZhCfxDz6yNgaorq22WxVHf02HuuTrtpr/s5puSA1Wk+L1KNMtUrtME2jnDPzIKUjU1P0Ak5gVvakeT++r8ZPSeq8JhzUcB2/J7nj6rG0vzdkGuf4Js6eldP2dYaqZMYDL8sQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by IA1PR12MB6602.namprd12.prod.outlook.com (2603:10b6:208:3a2::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.18; Mon, 27 Oct
 2025 12:07:26 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9253.017; Mon, 27 Oct 2025
 12:07:24 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 27 Oct 2025 21:07:17 +0900
Message-Id: <DDT3BTI26XFE.1Z5E9QZZJCPHQ@nvidia.com>
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Miguel Ojeda" <miguel.ojeda.sandonis@gmail.com>, "Alexandre Courbot"
 <acourbot@nvidia.com>
Cc: "Alice Ryhl" <aliceryhl@google.com>, "David Airlie" <airlied@gmail.com>,
 "Simona Vetter" <simona@ffwll.ch>, "Miguel Ojeda" <ojeda@kernel.org>, "Alex
 Gaynor" <alex.gaynor@gmail.com>, "Boqun Feng" <boqun.feng@gmail.com>, "Gary
 Guo" <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Trevor Gross" <tmgross@umich.edu>,
 "John Hubbard" <jhubbard@nvidia.com>, "Alistair Popple"
 <apopple@nvidia.com>, "Joel Fernandes" <joelagnelf@nvidia.com>, "Timur
 Tabi" <ttabi@nvidia.com>, "Edwin Peer" <epeer@nvidia.com>,
 <nouveau@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <rust-for-linux@vger.kernel.org>, "Danilo
 Krummrich" <dakr@kernel.org>, "dri-devel"
 <dri-devel-bounces@lists.freedesktop.org>
Subject: Re: [PATCH 7/7] gpu: nova-core: justify remaining uses of `as`
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20251026-nova-as-v1-0-60c78726462d@nvidia.com>
 <20251026-nova-as-v1-7-60c78726462d@nvidia.com>
 <CANiq72m9ms-OznWQ5+4_JvAs4yruwgBRcm1u0gCAnasqO8uJOA@mail.gmail.com>
In-Reply-To: <CANiq72m9ms-OznWQ5+4_JvAs4yruwgBRcm1u0gCAnasqO8uJOA@mail.gmail.com>
X-ClientProxiedBy: TY4P301CA0110.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:37b::19) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|IA1PR12MB6602:EE_
X-MS-Office365-Filtering-Correlation-Id: ce6ff4de-2142-463c-82d7-08de155161e8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|376014|10070799003|366016|1800799024; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ODhzZnpkTjhtanE0NHUvTWdmeGJJb0YxdGlybFpwa0RJcG0yNnJJbWhSQnJG?=
 =?utf-8?B?UHRjZWU0Zm5EdmgvMi9RQTY2WDFSbGJXcy80QWlEYVFXVGhyTTk1YVgwMlZp?=
 =?utf-8?B?ZkplQngremRuYXVCNk9qbjhJaldzQ011Y3ZaR0tTT3dnWExoQzROTGxwRnd2?=
 =?utf-8?B?ZG1CNTg1WE1oaUJ4emJ1R0RlZkFNclhhWklOZnk0TmxNd3MrbTU2aXRDanBL?=
 =?utf-8?B?SlJvT2FydlBNdTRweUIxVVpneHdPRXRlSG04cEcvN2x1dkt0SUtRajB1dklQ?=
 =?utf-8?B?dXVVMjJORGhudVczVVZ5N0VhRlMrMkp2WDBvRzAvTTdheldpbE13V2EvVVY1?=
 =?utf-8?B?VkM1dFBZYTZiN3ZnQXlPZm96clJVM1QzVndnOUJ5Wmx6QXd2cG14cDZyNDV1?=
 =?utf-8?B?dkJlZ0RRRFNJSjBXRE5HbUtXZHh3c2xqRlpFZUpVRlZMQUtqdHhieGN1WHo3?=
 =?utf-8?B?OTJ5a3VGKzNTR3JMdGtrODJjeHhtV1BrSWlpd0JLLzZlYnl4bkJPSzJaMzQ3?=
 =?utf-8?B?OUVxMEIxWnVJYkNrYWlGWWRRZnJtbGthd05sQTJaZ056QmNkWllKZlJiSFhw?=
 =?utf-8?B?WUorT2s0bjlyTnpBNXA1c3RZemRDM1Z3Y0NLWDgrNThWMU5FdGJnazgxUy9H?=
 =?utf-8?B?YjJjVk9kaWhzMENwWmlSTUdaZHlGclFub0RVQUtqTURwVjB2ampCMmQ1QkVr?=
 =?utf-8?B?c0dYSDJza29oU2JXVGpXbGd3SzZpRlZlR0tpaGI2bkVjSjluSHQ5STA3MkNz?=
 =?utf-8?B?ZWlaM3c1TWZLRkJ2dG5nK044TkxZSXJEVGJIYSsrVFFVWUlMOHVUc1ZnRUpY?=
 =?utf-8?B?NFovYkJQK3M5NWg3Z216ZWJQV0kyQ0l2UVduWlhhRmhRQnFFcGdobG9nQUhR?=
 =?utf-8?B?VnpoeUdMTnB6REFDSGxNVjl3aUxWRGpJek1BVWxmOTdnVGE0ZEdPcW9uaXBl?=
 =?utf-8?B?Q0g0VkFteWMxSVBsT2R5Y3FiZk95aFNtNzVHL0tpS2xKWGFHVWVGNHJCSjk4?=
 =?utf-8?B?QmhIZkdaTTY5T05sY0RxTml0VnVQZEgvSmxJVDRBTW5wamlRZEtTbjEwMC9n?=
 =?utf-8?B?L1hmV3QrdGZZQU5RSjVUakQ2YWtDSktFZ0VMNXkzeE9aOGdRcmEvVjlnZ1JO?=
 =?utf-8?B?VS9vMlJtQTh0ajhjc2dJN0RRZzgvbXZrM2xMTnRBMkhmcnJVOFIzMGJyQjkv?=
 =?utf-8?B?ZjByK0ZxZ2FnZlpMUW1LdHQ4eGhvNHlHSk9JcFQwdmRNZERiQ3RkdXpmbFlj?=
 =?utf-8?B?bUZ4c3pWMVlIOVQ0ZXc3K3RGTTdnMTBnNW10c0JaaSs2NlBmNUNhekZ2VEZh?=
 =?utf-8?B?R1BVTzRhODJKMUxZUko1emRuOTVOMkg2UjhuYVlOUlNSczEyNmo3WEQ2WFJN?=
 =?utf-8?B?c1hXUmZtMEE3dFYzeVFoSldzZjV4Q2RwRDNvUi9ReXVWZlB6T0R0bUQ5NWpv?=
 =?utf-8?B?UGRMNjRXbjlRM0xyQ1kxNlU0cEF3R3FlQTBlL1p6dFFnYmJRbGJEMDBJajd3?=
 =?utf-8?B?U2FkdWFFRG43d0pwR2pTUGJvcUdXckdYRmJUb0oxamNYc3Jrdk1TOFkvZnd4?=
 =?utf-8?B?YTRzUkh2Q2pUOHUvejdGQWFMV3RjdUtONGdKczdyNHhHeGx2YWQyNkJTQUhM?=
 =?utf-8?B?dXJLNk5vaWhqcnZEb1R0djJjeTBnOVYxT04zdzVhamdKSW9VMDVjUjE1OHph?=
 =?utf-8?B?RnpUMm9rcElOdXFsNEI5MUZZM2ppcEtaVkxZQytPNFlONXpSWlhIUmdxR24w?=
 =?utf-8?B?cGVHalpzREo4NVdxcEU4SHR6aDZHdG9PZVR2M3ZOVzY5M2xxWXgxSTdFdW9j?=
 =?utf-8?B?S2YxQzNXSWplSWNKMHFwN2IyeE8vTEc5QWQvY0ZKeDFtdlIvRGptWmEwZDZI?=
 =?utf-8?B?YlIyMnRXOEswcjFpZVJOQUczYnFUNHRYdS82WFdLMnEya2p0eC9MRktaVE0y?=
 =?utf-8?Q?rxWfYLmLkdwTv9NV6/EgffM7l9RkLYqV?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(10070799003)(366016)(1800799024); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZHd0Y2htSDBlY20xUjkwc0JNTFpHSUZSVnQrdW1LTndENmJ5ejFDdUFYSmds?=
 =?utf-8?B?K0NxTmlTK1M4bGJqakRXb1RacU5iSzcyZHlCYkVrSlVjb0VMaFVJZGFQWFhV?=
 =?utf-8?B?ZmozYUJNU1p5b2NqMVdSdXJ2Q2dPMmU3U0V2WkUrT1RXdmxxUGxuYWxTajhh?=
 =?utf-8?B?ZHpCaVArQlNrREk2VjZUT3cvUWJ3TVBXWlh0R1dwc0wrelF2RDdpaUZRZko0?=
 =?utf-8?B?UVJ2bHRDdkhaMGpwN1RoTExvc0RuL0JjZklid1l4UmVnVHpnMnN0NWhpN1hZ?=
 =?utf-8?B?akswdXZoYmlrQUZMVk1PQUdRVS9WckU4QjA5UmZuN3JIMW81MHhkL2dTSm9F?=
 =?utf-8?B?WXlFalVKZU00dzN1b0RlckxNa2F1cVBnYkdNUHljeVNzM2tkNldxR2VTVnRr?=
 =?utf-8?B?OVpINVRQWElxd1BnMGZyYXhDV1QwTUNpdkxhOHMzd3RmUGdGOW91RXBMeTlz?=
 =?utf-8?B?RDIySkE1NTJKR2NzUk5ZbXFHb0FrenhGT1Fva0pOMXhuOXBFemw5cDZEVjMv?=
 =?utf-8?B?SURKQzhJanRWbDVPaFZkU2E5SGFUV0QrMy9NNXNlcGcwb2ZOVVNhK1ZRSE1j?=
 =?utf-8?B?emNxUFgrM01QSERPMForOFdWRHc1T0NxRkRHUWNiVDY0eExzbloxdE43V0ZO?=
 =?utf-8?B?VWFqOHZrQ2hnTVhHRW5iSG1CbDEvbmt0YjBic2kvRS9Halk0STlVNnRkV3ds?=
 =?utf-8?B?VkpLK1did0R3RHg2eVdOeFp4ZmhOTU9EMEVkbkhWRmlxSHNWQUptTGJUNDlC?=
 =?utf-8?B?QmEyQ2kzdDdZZzF6NUxWcjdKVDVKalFzS2lnelJUUmV3ZDVrZnYyZEFxanEw?=
 =?utf-8?B?N1prd2JmTkpZV04vTlhvaE52N3I4N2wydVdoVU12cHpJbTNUSTRiSWtzMm1C?=
 =?utf-8?B?Z0xEVElOekdNMnZLVEhXZXlCOTBWb0NlTTNWUGI2M2pOVlVRYTFWOWF3R2xM?=
 =?utf-8?B?M3MzU1pkaW5qZHQ4WVpZS1ppc1hIbXFXeDJjS0E1eFpGVTlRdUdSc1RvUVZF?=
 =?utf-8?B?dUJPRzgvUkNmNHRoamFqN250T2FWSHVvTlZ1d0lKMG1JbWhLTkZvNTlvMjNW?=
 =?utf-8?B?SmVoZkhKZkJIckhLcjB6WDV5MUZNZ1NGa0pmdUM2QklGakVpaEQwL0x4U0hI?=
 =?utf-8?B?clpYL0ZnVklNNDBjd2tVQm5OaVZ5YXA5WnVYNkpPZktSdjZubVkvZU54L09V?=
 =?utf-8?B?NUYvOXRicWd1S3V4bEg0TVZiTFpWSzVycmlpci9nNmNaMyt0eW42Mm1iLzRB?=
 =?utf-8?B?R0grNkZ5R3lSQWV5L05NZm4vODY0VW5xc2E3Njg2dW5pcDVIZW9TdGVmczdK?=
 =?utf-8?B?V1FWbWVldWpVNzcvbWhZdkYxMVVUMGFlZXEvemhJNGt0Y1ZNZFdJV2JHcmV2?=
 =?utf-8?B?ZGN5TzVJUUcyU3NLTExwTURMTWJDdmdzajZQVkFySk1SSzkvMTV3OFlzUmtW?=
 =?utf-8?B?RHFwTGYvL3c0RU9sN3RUVUh5YldReFFidlBTTUoxSUVpRk10WlN5cHlLdEhy?=
 =?utf-8?B?eERWaFpOQS83SUNETm40Tm1zd1U3VjVnckVPRUhZQ2pJbHBVNkV0dkM2anlw?=
 =?utf-8?B?RHl4amRqb2RuSjVOU1pDd0hrdmNaOUIzMGltMXVKbEttR0h0YjVQelJsVytT?=
 =?utf-8?B?bEZET0pORHQxT2NrTXJDbU5KTkVZTElUUlNqOUx5dVdxcUE2VDVlM0VsNDla?=
 =?utf-8?B?WE8wZG9WTGU4MkVDdXo1aGlLZ3Z1ZEkxeW5JL3prQzFObVoxa3FLR042YU4z?=
 =?utf-8?B?S0F2UTQyV2VmMG1hUTlqSGtOWmpWVTJpM3dGeDRJcHlsTG42blRCb2FCbERo?=
 =?utf-8?B?N21vcnNGVXp1b0pRSjFUR05rL2JZNzFJYjF0ZzJkeEZLNkRIWUF0aG1YUnhx?=
 =?utf-8?B?aWc0K29GUVl4OVRVcHdEVklrR08yQnp0emFCYlRRRTczRXBkdTkyMW5uajhx?=
 =?utf-8?B?VWdFcDRLRk94RWtVdit0NXF0TlgzQmZrUWhBZEpNdE5XcTNRRFpWU2QxWHBt?=
 =?utf-8?B?UkJOQjdIS0d6cEduZGl1Z2Qrb2VTMkc1RjZWYWdPamtvOHkrdFd6SjJadGxs?=
 =?utf-8?B?Tlh5ZjQyV1pPOGp2MHB0alBNMDZnYzZjbXB5elQxSnVxSlY2QlozNmdUUHdz?=
 =?utf-8?B?SC9STnJFdXhGci9Zd3N5WUowV0hsdmVNSmkweUs5UXVKNThBNjNVblM0cmhY?=
 =?utf-8?Q?mAdR9TDlrofDL9U2RpJob6pKKkOF3yQUaf9KRrE0HkU6?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ce6ff4de-2142-463c-82d7-08de155161e8
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2025 12:07:24.7214 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ab1nKdVongLQAUeJWglBH5CuZvaZduc72BSH0FEaizA1GaIpKnK0i/odcq8rrONYWADjbkjxXGm6oaeTg6SZNQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6602
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

On Mon Oct 27, 2025 at 1:11 AM JST, Miguel Ojeda wrote:
> On Sun, Oct 26, 2025 at 3:40=E2=80=AFPM Alexandre Courbot <acourbot@nvidi=
a.com> wrote:
>>
>> +            // `as u32` is used on purpose since we do want to strip th=
e upper bits, which will be
>> +            // written to `NV_PFALCON_FALCON_DMATRFBASE1`.
>>              .set_base((dma_start >> 8) as u32)
>>              .write(bar, &E::ID);
>
> We are not very consistent on this yet, but I would suggest using `//
> CAST:`. We are working on getting `// PANIC:` in Clippy, and we could
> get others like this one eventually.

Sounds great, will do!
