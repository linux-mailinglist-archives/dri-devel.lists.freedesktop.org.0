Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D1E97C47751
	for <lists+dri-devel@lfdr.de>; Mon, 10 Nov 2025 16:16:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD81D10E3D5;
	Mon, 10 Nov 2025 15:16:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="VMgdiH52";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DM1PR04CU001.outbound.protection.outlook.com
 (mail-centralusazon11010050.outbound.protection.outlook.com [52.101.61.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3732C10E3D5;
 Mon, 10 Nov 2025 15:16:08 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=q7J3CTU34pVV7BVSMJ+u0i7ecxRqNKtgnl3e8PeFEx+4/ghsbv+dkhQ8kxAzDmopAxZ70Vh9ITqo0LBJl9Nnh0I2pQZK05Omkcj5t1LanNxjzCu4elYVf3/DX0V9kPk9ekZBOdj0N7r2J7ICQCz/ka6vApAr3AAAxQ70eYSMtfKJi8dCYnA9DtxdcsOxjZPIGAFN4QfssMLn2q3dr2Wv6p3t0mJJG/WF3Nkz95hZMc6AA2zMFeLnhyY4yX9mQu5t/9Ua0BFjN7xvRW30jbZOtcyXbj9YGK+6ZsBSO/xBAkxbl43UyNEL9sT/VXVttVFskgOT0fem3ms6Nj5G/zK2Ig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NPLZPshGzrygYzi1wsGw6oafY6o7Mi6OfAL+4P6eG7c=;
 b=gIE8R5Dgo8wECP9S80M5NDUz1Uh3NGbEhrszH/6gWuIOpXwvYa5QvZH6F54XSL2FmNWEp3+IGUPOXGAGRs8oZ2wI1cdZ7LbFiw8T5kZ3mWnnLDseBl302FbQhLIsNZMKCnszjJ8LT0tTDztjmyGf7jxG/V3U8XMBAY+weY7rrttG62oOZbCpcAfe6iWRAYBFxLTpDj41hcjZtqOFOWYDlMe1ObZsViOmlmjBc6wbLaszKOh0rX518pekcpv1aWY9k5VTEemXNXxxVEZWS24lZ0oAaL8DW8BzBS/ZQ68dLwMF3xCQlMJmIM0beO7g+AYdczw+k9GQV6++LgCZoDypqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NPLZPshGzrygYzi1wsGw6oafY6o7Mi6OfAL+4P6eG7c=;
 b=VMgdiH52u7F2qsUube2+e6NTO/sD9oxQtQ3mA5Q2udkc6MTo7bLF/H5vBe4U65F5HBa5BXzmsC3U10SWAdpbu+zxl315TDm6RHRAk4ptU/7lh3bfJj/uw+MqxpFSrMonLuH/XtAH86vfva8kk9qrXz9baPckREaSNLpYX6yRjMOfEFwZ+RB9vuUaC+mPSBzo0ZHBfsx0KWtYGDEvGyR8ZddstWxTDNM0qu69tRjCietdtl9tf/NYeazS9sMP1Ro8YnhKqlm5KKkNoXgGiDja3Hqaei2lSzBFU1FOEv9LLr4AMjyekGlEpErUatvOEEvjhg6I/5Z1Z8h6+Vf667oImA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SN7PR12MB8059.namprd12.prod.outlook.com (2603:10b6:806:32b::7)
 by IA1PR12MB9531.namprd12.prod.outlook.com (2603:10b6:208:596::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.16; Mon, 10 Nov
 2025 15:16:03 +0000
Received: from SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91]) by SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91%2]) with mapi id 15.20.9298.015; Mon, 10 Nov 2025
 15:16:03 +0000
Message-ID: <ac85d8be-3cbd-4a51-a627-3a1a9926d801@nvidia.com>
Date: Mon, 10 Nov 2025 10:16:00 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 08/12] nova-core: sequencer: Add register opcodes
To: Timur Tabi <ttabi@nvidia.com>, John Hubbard <jhubbard@nvidia.com>
Cc: "dakr@kernel.org" <dakr@kernel.org>, "lossin@kernel.org"
 <lossin@kernel.org>, "ojeda@kernel.org" <ojeda@kernel.org>,
 "boqun.feng@gmail.com" <boqun.feng@gmail.com>,
 "a.hindborg@kernel.org" <a.hindborg@kernel.org>,
 "simona@ffwll.ch" <simona@ffwll.ch>, "tmgross@umich.edu"
 <tmgross@umich.edu>, "alex.gaynor@gmail.com" <alex.gaynor@gmail.com>,
 "mripard@kernel.org" <mripard@kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 "rust-for-linux@vger.kernel.org" <rust-for-linux@vger.kernel.org>,
 "gary@garyguo.net" <gary@garyguo.net>,
 "bjorn3_gh@protonmail.com" <bjorn3_gh@protonmail.com>,
 "tzimmermann@suse.de" <tzimmermann@suse.de>,
 "airlied@gmail.com" <airlied@gmail.com>,
 "aliceryhl@google.com" <aliceryhl@google.com>,
 Alexandre Courbot <acourbot@nvidia.com>,
 "joel@joelfernandes.org" <joel@joelfernandes.org>,
 Alistair Popple <apopple@nvidia.com>
References: <20251102235920.3784592-1-joelagnelf@nvidia.com>
 <20251102235920.3784592-9-joelagnelf@nvidia.com>
 <d6c9c7f2-098e-4b55-b754-4287b698fc1c@nvidia.com>
 <0FF9536C-8740-42C3-8EF1-5C8CD5520E49@nvidia.com>
 <93c758298250d2be9262256a698c243343b64ebc.camel@nvidia.com>
 <3c625930-348a-4c96-a63a-6a3e98e59734@nvidia.com>
 <acc56fbb56c3f40119e5a6abf9f13093d7f4c7e7.camel@nvidia.com>
Content-Language: en-US
From: Joel Fernandes <joelagnelf@nvidia.com>
In-Reply-To: <acc56fbb56c3f40119e5a6abf9f13093d7f4c7e7.camel@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MN2PR07CA0026.namprd07.prod.outlook.com
 (2603:10b6:208:1a0::36) To SN7PR12MB8059.namprd12.prod.outlook.com
 (2603:10b6:806:32b::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR12MB8059:EE_|IA1PR12MB9531:EE_
X-MS-Office365-Filtering-Correlation-Id: ce83c1e3-760b-4bfc-002c-08de206c1042
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Q0dPdHU3UURIeUVyUDlkQWRsOUZGbWFDY3orMW9lOUJqV3N6ZXFRQlJKdHd6?=
 =?utf-8?B?TjBlci9xZDgrcFFneERZM2lhSVFVNGFISmxLOEMwOTMzTzIwYWNwK1BDaTZl?=
 =?utf-8?B?NmgrSDdVTDFZdDRDemRlMDcyK0ttcHRkM3JuNnJHeUhwWDlmUWUxNGlITTJm?=
 =?utf-8?B?d0JjTWlXRnB1aWdLVEdiQWhRZzFxY0kwcWdMYzFrbDZRbmpFQkphN3NVSjRH?=
 =?utf-8?B?V084MEFJcjVKYW55VjNNQkloLzg0SmE1N3VvalgrR0R4b2YrQm9pdmxoNmpu?=
 =?utf-8?B?T3FYa3IrM3l1UzAxVzhWendDdVUzcUxMTnZ5azVxeHI4NWs0RmNBZ0t2UHpn?=
 =?utf-8?B?TVd2Q2JMYVpPY0djQ0JtdzdnbDFmNExTL1FXblpoTVgxSDRUcDRSMFVybTJ4?=
 =?utf-8?B?NCtnSFRMaW9aemZlTGZEMkhxbnNWSzdyeUg1SDBsUzVVcCtjcDRjbkJSWmNs?=
 =?utf-8?B?WU5hbDM1SnZ5NlJjNms0RlkrUyt1OFRZZUJKUU1FYU1IZC9ZSGpzZDBxNXNZ?=
 =?utf-8?B?K1Z2U05QRXRkMWdiNFQ5ejVIQVNGT2VEdEtjdlFpRHJQNVpldmNNelFPZXRv?=
 =?utf-8?B?S2RMeFpEVWp3eHhEL2EvRVZCNmZYQ1FKcFFqTWtOcStSdXpzaWc3dXNuazdw?=
 =?utf-8?B?MDVlMWw3azB6Q2NCV0xxMGkrNUtLUGRNakQvbEtjU25vbEhrYThpY1UrRGox?=
 =?utf-8?B?UXlwWEJTOEIzdThBTnEwOXpnVDVVTFNqczBBWk5mRTRVQ29XOTlUcTJBdjho?=
 =?utf-8?B?cGI3aXRRcWtrbEhWb1VOK3B5d1NmbEJ2aXlsckFqY3NTb2ZLTDE1NldVSUpi?=
 =?utf-8?B?SmtDYXJmS0d1SU5wMC9hQmNCMjdDMHUzNDdYMitNTmxvVnJIdzRoVWNZZWZ5?=
 =?utf-8?B?K2NSL2s3K0N6ck8wUktIK0NEa3Z6ZzN6SGhFVzEvNjNxRGhNV1pHYnhDMENs?=
 =?utf-8?B?TExjSmllQXdEYVlURjRucjc3ZGZVZFVpWUZKWlh1TUE5eThoU0JpamxheVhW?=
 =?utf-8?B?MUlscE1pQW9yZVZsdnJTUG9xZ1RXMU8xUUk4SW9pUUQ5YVBGZVAxMHJTRjM3?=
 =?utf-8?B?MjJBd2hYOHZoVW1jS1FNZzNwWkRoUU90NjVJanh2dS9HVTl2bWgrd3hJMEs1?=
 =?utf-8?B?aTlzc3k1bkFEMWU5dUN2TENMQlNYSHVhRENyczI2NDhKdkk4TDZVMjBIVWM5?=
 =?utf-8?B?T3VlNWExU1hsd1h0K1RmemJjQmhPSHRDeEhsZ2JlZ2VJSC9XQ1hCWXRJcFcv?=
 =?utf-8?B?NSt1M2pFOSt1NDJoa0JPZVV4ektieE9PL0xCWmc5ZzlCQmdET242QmVNc3NO?=
 =?utf-8?B?VlJqTGlmMGdidTRCVjBHY0tyZ1pjelJ4MUpEOGRPbERoRWZHbVovV25rRTFK?=
 =?utf-8?B?M1FsTUNFOUdINlF3VHd2NSs1RGZoM0FleUF4QUVjdVIyZkVRa2RWVStDeStj?=
 =?utf-8?B?YWY1dE0vL3BYM0pLcjNQcml0S05pbHVNT2NOeEYwdUgwdmc0MnBYU2tQYVhN?=
 =?utf-8?B?bG1MbkRLdWY0a1BwNG1la1dtS1FMblByMGdxMzFZbEVFQXVRSXdPeUIvUFYv?=
 =?utf-8?B?UVdPSjhBenA5c1ZtNlVDMlUyMDI5Nk94T21iK2pETi8xZFVkWm81OVFRb2Y5?=
 =?utf-8?B?MThBK3pjQUhmRWs3TEd0N3NwVDhNNGpzSHc3RHpkb1EwR2hKR3Jsd2cxaGJt?=
 =?utf-8?B?bk1ZbTcxU2xTakxVM3drTXkvekE1eGxocWVjc1hBVXV2MWl0cEtwUEJFNGVl?=
 =?utf-8?B?eUg0VGx2MFJNQWFLeUdPR1c0ejgvMEpZNU1kRVMva2ZQU3hOd2ppdGtGL2x4?=
 =?utf-8?B?aGxCZ1hzT2NGUVlOeGhkeGUweHhzRGxoT3NyZmFzcENvSXRxN216cW1vSWNs?=
 =?utf-8?B?VXF6TWdDcTlUVTNzU2RlNDYvekJReUE2K0Vwa05wb3ZoaS81aDRWOU04M1BH?=
 =?utf-8?Q?wZ8ywLo50NsWG0xVr0DQNC4RIS8fdabc?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR12MB8059.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(7416014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Yk5hekt6NTFiWm1WVjhzNWZpVUxXYWVPK1ZZanllYU9KR1Z1dWw0S1AzR2Yv?=
 =?utf-8?B?N250dG5xUWx0dHMyMUxoVC9ocnBvL2x4UlV3RVBQdmNuK0lHSXZkVENmZkM2?=
 =?utf-8?B?dEVQMHE2QkJuYlVpYzJ4bkxCbVVtRVhnK1JQeEhhZmtOMkFMamVtR1dscHBG?=
 =?utf-8?B?S1NKdEl3SzFzeWs1VFZNOWY5ZTd5TmV6VExPbXNyeHJyWW52KzNCSHJ5Wm41?=
 =?utf-8?B?VnVLWTYyQUFDeTIxbEk4T25ycDdhT1BqK0N4QTN6R25DcDJDYmxPVTBUNmVh?=
 =?utf-8?B?ckZCTEtKd2hKS1BhSlRaYytncCs5S0YrWlhXWlNTNzByWmV3SllseVp2SjZh?=
 =?utf-8?B?SVBBVFpRTWI0b0pSai9rYS9FbHNTZXRNMk9RUXYzR2xBWEVFK2NkaDhocHNN?=
 =?utf-8?B?enFIelMyeTN3eVdMMzdDaTBDa290Z0taSG9JZnNOYWtRVlJ2VHBtYTFQMndF?=
 =?utf-8?B?ejFFQVVHQTY1UHo4OFlsTmZreUJWQkEwVW45MkhlMjZDdFlyeXd1bCtBQ0xV?=
 =?utf-8?B?ZzlYYjJSeWhGVnBiY05aTGloODRyZkZrNkZUaGFKZ2FaVnYrblFvMVZMMzRr?=
 =?utf-8?B?RWZ4aDRVTitQQ2ZDNDByeVcyaHRPZk4zdjNXUlZ5dE5STFIzWCtubzhBaCtB?=
 =?utf-8?B?bFIwSTNJMHMrVGRYZTJSb2xPbWkxZG5wRnlROTNTUzVrWjNMaUJnT1lpZnpi?=
 =?utf-8?B?ZFZNSWluWXJNRzRHNjRHZnFZV08wYi9ORWo1cFc3S0EzMld6ckRYL3VmQnpX?=
 =?utf-8?B?a25aQnVBR1k1THZSTWxnWUlQaXR2NVFYbDAzZjRIRElFbGpwRVB5b3FGNWpH?=
 =?utf-8?B?T2ZnR0kvb284U1poamNQNGtGREZVc1hVL0pDMnl2OXpoMyt1ejUvWFdVN01Z?=
 =?utf-8?B?RU5yalBGTnFCSjZEY0JlTVRtNGRqdnNmbU9VR3dZN2FjMGVsVEt6UnBpUUty?=
 =?utf-8?B?U0kxb0JLbjBBNjlEN3JHSEJXUjVIVmUrb1RReDNuanRKWllMT2NsSkRXY0NZ?=
 =?utf-8?B?QXZjclN4czlqQ2hHWGlaMzNQVDVUYThZL1AvR3pHMmRiVGVTdlI4VHJvWkVG?=
 =?utf-8?B?TSt5R2lucVFYYXp0RFpjN0JsVC93YWVrTnJKTURTdGpKZEcvTUp4cGZQdFZF?=
 =?utf-8?B?M093Y0xWTXVrWmZSZU9iNy8reGZjQ1U0MmJMQndNbDBKb21uT1VPUkZSOERl?=
 =?utf-8?B?bHVydEpTVzVnVWxWYm40REdGQ1B2akdJV0g2Z2pYbGIyaGFQZDVNK2dkSGhx?=
 =?utf-8?B?SFJHek00TXdqT3g5TjNRTjFCdms4YitVL0Foc2FkUlNnay9nNWYxM0YvejFq?=
 =?utf-8?B?cVJKSmxRTy9sdUxxdURTSzJ2NUsrQTF3QVpJQTQ1amg5MHBWRitsRWdGL293?=
 =?utf-8?B?eUduZlNjVVM2cXVZNnJGU1gyUk01OFpQY2VLdU9pT3BXVWt5aE9DRWxNUWRE?=
 =?utf-8?B?QlkxZFZZMnJ1YXNpQ3BkMWM1ZnZRNXczN2N3SEp0V3ljZ3lvb09sbjlWTFJQ?=
 =?utf-8?B?OXZhNU53OHc5dm1XNFBhcW9GWkhhTVNjV1NoL3lRUVliVXEzZGNtbXFkUEo1?=
 =?utf-8?B?NTRJREhFY2o2RzVEQ1RDSkl4WVhES001WjExdXBWb0lMUGlmd0hJRXhOZ1lk?=
 =?utf-8?B?NzhTRGltRUR0RXR0K1QxT255eXFxNkF0RVAyUWFrREN2RzVGSWkrT1VIWm1Y?=
 =?utf-8?B?aDdYQXQ0UVhOZllNL2cxRXN6NE9FWHF1eGhsQTdmbFFacTdLQm5QaE8zMzV4?=
 =?utf-8?B?YmhUMXdWMDZSLzN3RlcxTmNwZUZzMEpYVjhwY1BEckZQSStUQkgwcmlFSFRK?=
 =?utf-8?B?S3ZjQ2p2RlY5Q25SWFhrZU5lOWtXUGtOTWNsbmhBL3NCKzVDTTRnUW5Qelly?=
 =?utf-8?B?bGs5RDhtV25EUjl5L253S1ZPcjBpbWRGWWlGSmoxZG5xa09YbWFlWXI3YVRR?=
 =?utf-8?B?VjZmZlJ2WEZTUTNVWjZ1QUtVazV5U3BaVWg3ZnVHUE1KVXhzTmsyWGZLS2ox?=
 =?utf-8?B?bGRyKzV3Y2RjRFI3ZTVlSGNNK3puRFpXM0lGaVVjajNhdCtmYVZKQ0k4czNN?=
 =?utf-8?B?aGhRclljd3pSNEVkbUdja0xxY1NuaS8vcERHbWpjWTRXWWN5U1dVejk2bm0w?=
 =?utf-8?Q?YjJaRXyhY71A+EviO/zdF9QzE?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ce83c1e3-760b-4bfc-002c-08de206c1042
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB8059.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Nov 2025 15:16:03.6843 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lFN7ifR+y7hbqi6DBH5TbTe81KcCN4Ja6G305KZsValk5wRO3MBOoObBolP/sAwKHZbig2JH4BRun3qVUETgug==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB9531
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

On 11/5/2025 6:19 PM, Timur Tabi wrote:
> On Wed, 2025-11-05 at 13:55 -0800, John Hubbard wrote:
>>> #define nvdev_trace(d,f,a...) nvdev_printk((d), TRACE,   info, f, ##a)
>>> #define nvdev_spam(d,f,a...)  nvdev_printk((d),  SPAM,    dbg, f, ##a)
>>
>> ...and those are unusable, unfortunately. I've tried.
> 
> This works great for me:
> 
> modprobe nouveau dyndbg="+p" modeset=1 debug="gsp=spam" config=NvGspRm=1
> 
> I get all sequencer messages when I boot with these options.
> 
>> ftrace/bpftrace, maybe those are the real way to "trace"...or something
>> other than this.
> 
> You could say the same thing about most dev_dbg() statements.
> 
> I agree that dev_dbg for sequencer commands is excessive, and that implementing new debug levels
> just to get sequencer prints is also excessive.  But Nouveau implement nvkm_trace for a reason.  And
> we all know that because of ? in Rust, NovaCore does a terrible job at telling us where an error
> actually occurred.  So there is a lot of room for improvement.

IMO, the best way to do this is the tracing subsystem. It is the lowest overhead
runtime kernel logging system that I know off, lockless, independent of the
serial console etc, next to no runtime overhead when off, etc.

I recommend we use the tracing subsystem for "trace" and even "spam" level
logging levels for Nova. The brave souls can always ask the tracing subsystem to
also spam to kernel logs if they so wish.

++ Tracing Czar Steven Rostedt as well. Steve, Nova is a new modern Nvidia GPU
driver.

I guess we have to decide how to do this - what kind of tracepoints do we need
for Nova. One use case that just came up is RPC message buffer dumps for
debugging communication with the firmware.

thanks,

 - Joel

