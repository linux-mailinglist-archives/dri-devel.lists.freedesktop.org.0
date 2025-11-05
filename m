Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D9A11C36B33
	for <lists+dri-devel@lfdr.de>; Wed, 05 Nov 2025 17:30:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D830210E095;
	Wed,  5 Nov 2025 16:30:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="PevaSPzC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BYAPR05CU005.outbound.protection.outlook.com
 (mail-westusazon11010062.outbound.protection.outlook.com [52.101.85.62])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 26D9910E03B;
 Wed,  5 Nov 2025 16:30:17 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HleOYOdqGN4jqM+ERR5Mrr20yNY0hnUzxdoBoy81goeIbXGRa6+xf0Le6CPAA3GbCRq+30Te7v+Y6CTnIXKiSYV6GM9EC+k3uzfk9jqeBx839K4HFcqvFkSyK44We/JBU5+f8JESajPCiM8ZpTrZR2AhM1CBp0bQ0jOvDfNx3mSAt5rbZlvGmCONBfBBOgNbZa9cnpF1bVpMqf9sDgQriFbGh7tQyyhmq8OO6zcInz9A2Nv1eYHOlZvZwp7GSOdpXz9kpnq91sAZz9y1/0k9d/OkFMZ5wUYMjC7dHIC99tedcAUKTRs6ObKgEc7xf8uC6JCb1dMckE/ys/n5RJhcsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s9073f2M+ReKH65v9KcyAABimXZUv/bg4Dnr1QvVSAk=;
 b=hv6+qtQAKgKRbDMr954Wp7eCua6oasrtyeeIC7uTrM76hOEBVz2CCPW9jYFWGaueVGo7rV9n0rlAEo8cZfcJ56k1xJgFa1WgmEqcfp/QdBQ/FMjTkbIjQKYuHJBg+owj+5jT5R9gF3fMsZrNtGbVUAshKLI3KnbHTvwfMoIgQWuTTMhPYjwI2c5I6NAf5VCWghCpy+mX2/d0iFcj2hmEWrl2WbbnohoAq1VrhKcXU5GeEmx4EOR//ZLm2HmhsfcQtxYoMBHSz+v7fUTIfH5K+3tZyeuJ+PC57gdlzQqst1kWB0YPM6DgCq6wLEweNU5Pb68YnyQQA5NBnTZKPyXqxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s9073f2M+ReKH65v9KcyAABimXZUv/bg4Dnr1QvVSAk=;
 b=PevaSPzCA5wO649futk/Yyx4s6msmCE9/6/83Iy+TTFTxkZBa7nl+aBebLdqKRZzPOoxaedfYqLCVLJ4UbudfZ9uGuYRpmvHKnoFDusGg4r71Q0+RhqEOUKypdWZmobiJiRKcOBbRl0tj4+H6JX1oK7FodtrjxqCP08YejXbgTEnPxNjhFCG3htbQW73QwW0FQR7Sp61H53PU96KaFrIY0WSrRe2I8uwbLJkq2yQR8ibfSHcGQvSW4k0V8cooq/y7KGJGnHUUDlpIvnZ74Ky1EblHz0MB2wO6GSgsSV4m2FqcgNtoMHQKB58ND8R2eMtjp/bI13A/B6zH9A7J3RDkw==
Received: from CY5PR12MB6526.namprd12.prod.outlook.com (2603:10b6:930:31::20)
 by PH0PR12MB999090.namprd12.prod.outlook.com (2603:10b6:510:38c::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.8; Wed, 5 Nov
 2025 16:30:14 +0000
Received: from CY5PR12MB6526.namprd12.prod.outlook.com
 ([fe80::d620:1806:4b87:6056]) by CY5PR12MB6526.namprd12.prod.outlook.com
 ([fe80::d620:1806:4b87:6056%3]) with mapi id 15.20.9298.007; Wed, 5 Nov 2025
 16:30:14 +0000
From: Timur Tabi <ttabi@nvidia.com>
To: Joel Fernandes <joelagnelf@nvidia.com>, John Hubbard <jhubbard@nvidia.com>
CC: Alexandre Courbot <acourbot@nvidia.com>, "lossin@kernel.org"
 <lossin@kernel.org>, "a.hindborg@kernel.org" <a.hindborg@kernel.org>,
 "boqun.feng@gmail.com" <boqun.feng@gmail.com>, "ojeda@kernel.org"
 <ojeda@kernel.org>, "simona@ffwll.ch" <simona@ffwll.ch>, "tmgross@umich.edu"
 <tmgross@umich.edu>, "alex.gaynor@gmail.com" <alex.gaynor@gmail.com>,
 "mripard@kernel.org" <mripard@kernel.org>, "joel@joelfernandes.org"
 <joel@joelfernandes.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "maarten.lankhorst@linux.intel.com"
 <maarten.lankhorst@linux.intel.com>, "nouveau@lists.freedesktop.org"
 <nouveau@lists.freedesktop.org>, "rust-for-linux@vger.kernel.org"
 <rust-for-linux@vger.kernel.org>, "dakr@kernel.org" <dakr@kernel.org>,
 "bjorn3_gh@protonmail.com" <bjorn3_gh@protonmail.com>, "tzimmermann@suse.de"
 <tzimmermann@suse.de>, "airlied@gmail.com" <airlied@gmail.com>,
 "aliceryhl@google.com" <aliceryhl@google.com>, "gary@garyguo.net"
 <gary@garyguo.net>, Alistair Popple <apopple@nvidia.com>
Subject: Re: [PATCH v2 08/12] nova-core: sequencer: Add register opcodes
Thread-Topic: [PATCH v2 08/12] nova-core: sequencer: Add register opcodes
Thread-Index: AQHcTFTC0NdFE6lpDkSHKHEG1nJiT7TjZSmAgAAPi4CAANWOgA==
Date: Wed, 5 Nov 2025 16:30:14 +0000
Message-ID: <93c758298250d2be9262256a698c243343b64ebc.camel@nvidia.com>
References: <20251102235920.3784592-1-joelagnelf@nvidia.com>
 <20251102235920.3784592-9-joelagnelf@nvidia.com>
 <d6c9c7f2-098e-4b55-b754-4287b698fc1c@nvidia.com>
 <0FF9536C-8740-42C3-8EF1-5C8CD5520E49@nvidia.com>
In-Reply-To: <0FF9536C-8740-42C3-8EF1-5C8CD5520E49@nvidia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.56.2-4 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY5PR12MB6526:EE_|PH0PR12MB999090:EE_
x-ms-office365-filtering-correlation-id: 83d7d794-9a9b-41cf-c543-08de1c8898f7
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|7416014|376014|366016|38070700021; 
x-microsoft-antispam-message-info: =?utf-8?B?Yk5tMkJFTmlxdEVQZnlDMDR6VEtocVh2VVEwNTJraFFCM1k1KzRIcEYzSFJu?=
 =?utf-8?B?WTliOUQ2MUVmbkk4eSt6VDZzZmZwdWxDa0l6YW1OREExRU9YL1VDdUdudEVK?=
 =?utf-8?B?WThIODdKNlRTcEwwamhsLzJSbHVqWGFXUlIraCtGUW4wZTgyeVpCVjhyZmVG?=
 =?utf-8?B?dTl0dTVmSWFqNjFMM25ZMU1xbkVJWWEyZi9CZWFGeTVxOURWRlcyRnpKYmV2?=
 =?utf-8?B?UUJHTzdqVEhpdkNmV2Q3L0k2THRlVXVSNFJxWWN2ZXhTbDJhY0xucHpPS0hS?=
 =?utf-8?B?N1dQcXBtRDk3RlpJcCtBdk5tQTZiOGV4NlBzeSsyNVNZN3FzQmhrMjBmVFUv?=
 =?utf-8?B?eDlaRlY4d1B3VDk5aVhjOE51RlVPRnRpRzU0ZWxNV0hoTElUc2ROeFgvVTRh?=
 =?utf-8?B?bFl3VUU4MzJrUjQvWjhDd3NFSnZ4SHJmdnQrVkRZcWZuTTczOUZhZGtaVHNF?=
 =?utf-8?B?YXFUdTh2WkhZT1FoR1RIMlpYTmxaT2JaVjJudDVqM1ROWmtwaVpyZVgxVVN1?=
 =?utf-8?B?MnpkNk9iZE1aa3dTV3VWV25UeG9JejAxSVJzUzlxbGh2bkhNVXRjOHBjZkM0?=
 =?utf-8?B?S0xYa09TbFA1aUlYcFM0aWxjRVJ0cTR1K082c2dBZnZtZ2hpYWErQ2JHTkRG?=
 =?utf-8?B?TDh3SDE3ZFdmR1ViK0t4bWxGOVVxZkNjLzQxNjl0MEhnenBLck1ITjZsazFH?=
 =?utf-8?B?VGtWalQwOFlCZ0VyQndHaStDQmoxTnVwNEVwRW9SNzhFK0I0bjY3Vjl1V0Nx?=
 =?utf-8?B?S3UxTnp0TzZoYUE0dW56SkdWWXZybUo5akpoVjM5UWN1SmZrSTFJa2lNWnIy?=
 =?utf-8?B?c3VvTVBtNlBrUEIwenV5d25PaWNQelZJZk9UbVpDanpTckVMSTJHU2Vmdkty?=
 =?utf-8?B?S3ZBWlVHSGlBY3NZa0tDT2VVMWswcFlpN0F3K1RmaHRtNWorUUg5YzRGREwz?=
 =?utf-8?B?TTkwZWhqcjdGNy85RGNxM3k3NVNMWmYwNzJRM2Q3bWhmdkNGMEExZ21pNDYw?=
 =?utf-8?B?cEhnS2NIc09yQXdXamZyN2doaWxwbUtpdnQyWXBFYlNFeVUyWDVXOGoyWkpV?=
 =?utf-8?B?ZVZjcEhSL3dCMUhLZFMreDB2SlhjUjhYSHZWMk1TeDRkTGFPcjBFSWp1UE1z?=
 =?utf-8?B?VzVjU3djbmgvUmlabjhyQ0pNeDlhd0RKUnVaTHE4TlNQTjV4YWozZ0J0K3V5?=
 =?utf-8?B?c2JPMlo4RXFVTXFHMEpNT0JBbXd2ZDlBTmFxZG8veHZyeDFBQ2tzOC9CbWcy?=
 =?utf-8?B?VGJIb0lZZDd1RXJmYUVqMmQ2b1BPZkVXZHc0UUxzWGNlbTZKQkQxSzVEV3Ux?=
 =?utf-8?B?N3I0ZnFnT0xscVhsSGYrRElQY040YUo5SmZ5VGpUNmNoemJ5c0diWFk5QU1z?=
 =?utf-8?B?MlduZklOSE9iU21qUkNkM1hqOE5BQnd1QytQRWw0cGZRMGNyL1ZTYjN5RXBm?=
 =?utf-8?B?ZTBkcW9telNWdjRzSGxDR1kySVZYMGtyUnlJTUs0TGJjUklJcFVKTng4T1Nv?=
 =?utf-8?B?YzVRalJCWi9oK0dUQ242WkFYUW1sSEI3eVZOWGlMdUFKY3F5NEVUeU9RWHRO?=
 =?utf-8?B?MTBDMGs4UGdJekEzSFBVR2Y0MWE1RDlwbGdKSGU0OHRISFp2SzAwMUNZWGNG?=
 =?utf-8?B?VEtwUWgvM1cyb1Arb0NOZCsrdS95U0o4eHdHSk1TRFFCZCsveGNoZWZmUGZr?=
 =?utf-8?B?K2RKYjE1UjRZNmJ5eW5kblI3aUVKUHdSZnpvWnZnZkJ6elBmRngzTzZDWHFY?=
 =?utf-8?B?dithcTVRZjZhajBsR0lzM0FveUpRSTlQM20rUlpnTCt1WGpPR2JRVmFlRTNt?=
 =?utf-8?B?d0VhY0VtVklIUUFRTXJHVzVKeGhlV1ZmcC9zbnFxMEd1VFRzZVB5RFhvQ09F?=
 =?utf-8?B?K3RpQk1XelBEMVZvNzdNemwvd0dDd1cwa3hCRWRPTzg3UG9RL3d3L202M2JN?=
 =?utf-8?B?aHMvdDB3ai9yUkFRczVuekhFaHFyZFZwT21WY0luUG92RTRscFl5OVhhVmln?=
 =?utf-8?B?eFJFL05WV0VZSE9HNlpBZWw1MjR6Z0UrWDhwN0JTcXRjdFNCT2lPUnJZNnBv?=
 =?utf-8?Q?nFHg1R?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR12MB6526.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(7416014)(376014)(366016)(38070700021); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?SjY3NUYrczZRdng3dHRDYlVyOERNNTdzYTB0NlZJTmJRcDlUczJqaE41TGt6?=
 =?utf-8?B?cktXY284azJwZG9JL2VwQ0pBLzFCdGtQQUw1YTNPN1JROVhYcWNDdTJIUWc4?=
 =?utf-8?B?RUhpQUFpM0c1NGRFWmVRbVRKb1hLekR1MWNTV3RTUVRsckZLbzFnbVk4ZWdL?=
 =?utf-8?B?bVhhMWNPRURVRFl5NG5pTjc0YmFnVUpYNkZLTTZLNURjQTRPUlZuUEFldkMz?=
 =?utf-8?B?cUpGc1FPdjM5OWNmeXo1WURxck1pd1JkeHl0bWhDUGtLZzBBblZ4TStxOEl1?=
 =?utf-8?B?V1Z5cDhlMStWNk9JM2EyRDU2emd0WEFKOVgyZWRwZkdSNEtUNmtFakVSNTdB?=
 =?utf-8?B?b2YwTEcySWdmYit5a2MzVDk4L1hkY2k4bm5sTUxCM3F1WnJRdmtSVkJISTEr?=
 =?utf-8?B?NWVLRklWQStWb1lLQUxTeVp6MDhEWXVnS3VWRzBwSlBCVG1pbVZQZUhTcUxK?=
 =?utf-8?B?QVc4c2c3S1ZaUnZwc1RJWTU0M2tYcnNCdEZCV1h1Q25xRTJ1MGd1UC9qM1RH?=
 =?utf-8?B?amIyK2VvV1NzVXpweU02ZVY1T2R2YTExWW5rTHM4OUx6QndzZ3FnZUsrQXYv?=
 =?utf-8?B?R1RLNHFMTzZZUmFDWTdOU2liMG9SQXV2VjBJVlR2SEdmM0wrVXNjenBnWUNP?=
 =?utf-8?B?eFhpZ251TE9tQlFaa2RFZWwzbGdHTnlWS0lxanJob0dkd2tpVU9CYW05RDAv?=
 =?utf-8?B?TjF0VEFRa1dSNlRqK2xONncwdk1kYUNJb0VjYW14Y2x3UkxJTG5GRUFNejNk?=
 =?utf-8?B?V0xDV2ExMkZrc1lkUzVmQnF1cUpBQWg3SjhHLzFmZC81L1E1dnY5MTZQMGZG?=
 =?utf-8?B?Y0tZOEQxVlhqejdacHQxejJFMXF4VVNRa05VNXo0eDR0a0wyZndZbkRLNlFx?=
 =?utf-8?B?M094dmJrMGs3Rk5lUkhlQk9Cc2xLWEh4N2JXa0JaVmxiN3RQVEhrK0x5ZlFC?=
 =?utf-8?B?R2ZmY2JJM1k2RHNlUDkvazhRS1FOaHZNcFNqVThPWUxWdFloclNxMkJRNVho?=
 =?utf-8?B?cmwvdHJKWVV0aVlOWUxpd1lYRUhCMTBzeTlrakhwUTNyVmlzUFVJc3g1aUdm?=
 =?utf-8?B?MVZLZWdENkw2TnRsM00wWXc4ZC9DMlY2QkRUWWNYeFlGLzEwVUZ6MzhxT0kz?=
 =?utf-8?B?ZkJqcUl5Vng2OVJMc3ovcTYwK3A0bE1HVCs1QTM0dVhDaGg5N0hXNXljSVk5?=
 =?utf-8?B?RVloZW1LL0VOeCs2L01sVDhPZDVZNE5McnpBV3NPT3Y4SSsrVXFwdVg4c01E?=
 =?utf-8?B?L1Z0MlpCSHNwNE1tMEhoa0lZeVNNZUlXMXRoZEYvdExPRWhxSkJ1SERoNzN5?=
 =?utf-8?B?WmFQbWV5YWhaSXhhVklQblc5d0k4cDNNUzB1WU1ncXRyMjFyeWpVT3JPSmE2?=
 =?utf-8?B?TFY2L3lDZmdOcGxTOHcyNFRwMEhOVFJiYTNMeTk5YmJSTm5ySDRrNWdLRnN4?=
 =?utf-8?B?NzczQnoxSzgvZUlyUlpCVHI5eU44cmxKdEt0dEFyd3ZsNlM1c0pHbGpKRkxo?=
 =?utf-8?B?bjhjeGgxMm9IYlZ4K2l3V2Uyb3B5RTBLSW1Fbk4rYllCNU9NcEk5OGZxdWZJ?=
 =?utf-8?B?WHVMNGUvUnZrSHJBSEwrazJrZkpmY3pJL0VuY0VSMjZsaXdObkxIdW03UXdw?=
 =?utf-8?B?SFZKL25heXd1ZnJDcjQvMk1HTFdHWnRZV21oVWpLeE55OE8xZnZCemhjaHVB?=
 =?utf-8?B?QnFUMFBqZHBScDIxWTU5N1U2T21kbXRKU2lWSEgrSEF1OHRvZ29nSU5mYzgx?=
 =?utf-8?B?Wi8yeFM3QWRwOUxORzhJTzQ0dnQ4eitsZlg4UUFxZktrV2xXa3FtME1kQXBt?=
 =?utf-8?B?SEF5WWR1WGJLRzNOTVdPVmZIeEdub2xnNnNNd0lTN2orSFdydUdYeThqVlky?=
 =?utf-8?B?ajNORWtEekZIZGI3RnFIdXFzYlRFZDNSNzhUTExGQlR4cmNTdnlLUklqaWEz?=
 =?utf-8?B?bU9vdzk3cnczWjhuZ1F0dHRQRFJPdlg5MzBDMVNFOFVScVJVZmx1Y09SU0Y4?=
 =?utf-8?B?dnNRSzZZSkNDQmpWUi9hcE5WSGNucWRreWYzMnBQZG84VlhnR3JMTVdNNVJj?=
 =?utf-8?B?SkhsM3c0SXhpQ2tjQ1RwaktnVzZMekFQcXV6R0JON1k0VXFBdDM3YVEwc3ZI?=
 =?utf-8?Q?eX85aoG2ANiOVwEPWIbUj5MuS?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <BF013DB2D60F2F4CBE4FB20EFA85E59A@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY5PR12MB6526.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 83d7d794-9a9b-41cf-c543-08de1c8898f7
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Nov 2025 16:30:14.0403 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Tde2L3Ewu/AWn3u9GubLBH41cViydhN20Zh7h+u+55hRtZVNfLpFTB9uVq+ognUtN9scX+iK9gF9jKhB3bKeHg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB999090
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

T24gV2VkLCAyMDI1LTExLTA1IGF0IDAzOjQ1ICswMDAwLCBKb2VsIEZlcm5hbmRlcyB3cm90ZToN
Cj4gPiA+ICvCoMKgwqDCoMKgwqDCoCBkZXZfZGJnISgNCj4gPiA+ICvCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgIHNlcXVlbmNlci5kZXYsDQo+ID4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAiUmVn
V3JpdGU6IGFkZHI9MHh7Onh9LCB2YWw9MHh7Onh9XG4iLA0KPiA+IA0KPiA+IEhpIEpvZWwsDQo+
ID4gDQo+ID4gVGhlIFJlZ1JlYWQsIFJlZ1dyaXRlLCBSZWdQb2xsIHByaW50cyBnZW5lcmF0ZSBv
dmVyIDQwMCBsaW5lcw0KPiA+IHBlciBHUFUsIGludG8gdGhlIGxvZ3MuIFRoaXMgaXMgdG9vIG11
Y2gsIGVzcGVjaWFsbHkgbm93IHRoYXQNCj4gPiBpdCdzIGJlZW4gd29ya2luZyBmb3IgYSB3aGls
ZS4NCj4gPiANCj4gPiBJJ20gdGhpbmtpbmcgbGV0J3MgZGVsZXRlIHRoZXNlIGVudGlyZWx5LiBJ
ZiB3ZSBzb21laG93IGdldA0KPiA+IGludG8gZGVidWdnaW5nIHRoaXMgYXNwZWN0IG9mIHRoZSBz
ZXF1ZW5jZXIsIHdlIGNhbiB0ZW1wb3JhcmlseQ0KPiA+IGFkZCB3aGF0ZXZlciBwcmludGluZyB3
ZSBuZWVkLCBidXQgSSB0aGluayBpdCdzIG9uZSBub3RjaCB0b28NCj4gPiBmYXIgZm9yIHRoZSBm
aW5hbCBwcm9kdWN0LCBub3cgdGhhdCB5b3UgaGF2ZSBpdCB3b3JraW5nLg0KPiANCj4gU3VyZSBK
b2huLCBJIGFtIE9rIHdpdGggcmVtb3ZpbmcgdGhlIHByaW50cy4gSSB3aWxsIGRvIHNvIGZvciB0
aGUgbmV4dCBzcGluLg0KDQpPciwgeW91IGNvdWxkIGRvIHdoYXQgTm91dmVhdSBkb2VzLCBhbmQg
ZGVmaW5lIHR3byBtb3JlIHByaW50ayBsZXZlbHMgYmVsb3cgREJHIHNwZWNpZmljYWxseSBmb3IN
CnN0dWZmIGxpa2UgdGhpczoNCg0KI2RlZmluZSBudmRldl90cmFjZShkLGYsYS4uLikgbnZkZXZf
cHJpbnRrKChkKSwgVFJBQ0UsICAgaW5mbywgZiwgIyNhKQ0KI2RlZmluZSBudmRldl9zcGFtKGQs
ZixhLi4uKSAgbnZkZXZfcHJpbnRrKChkKSwgIFNQQU0sICAgIGRiZywgZiwgIyNhKQ0K
