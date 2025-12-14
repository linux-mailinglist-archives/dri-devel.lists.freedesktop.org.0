Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CDE46CBC1B1
	for <lists+dri-devel@lfdr.de>; Mon, 15 Dec 2025 00:29:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 64B7E10E012;
	Sun, 14 Dec 2025 23:29:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="dgC+xFBB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from MW6PR02CU001.outbound.protection.outlook.com
 (mail-westus2azon11012026.outbound.protection.outlook.com [52.101.48.26])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B80D110E012;
 Sun, 14 Dec 2025 23:29:17 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WuWTUm3eEykJIIguuTuIJWdxowp6z6VSfrnRglvTtJUPa9HcZVg39cyvbfaeerg62O01h6rg2ESNGkUKMPjdhA8uJlKplj20YilmyHap4F2ApKg/LbP0gwVXBy6VMV/I7JHdV7wmo45X3ypKhYAoxNcT80xJJ7GnxAwA4KDybjBdcpZYAggh0fsNZ6cM05LEpebq5Z3uPSzFSO33XsieGOGD0LY/ELUepAF4ftvYRbtUdPgJxMN4NYuloyuC0y/2h7kiehjPIdtu78UhjyQyiJSXcJinSjLtXQf/udoOF2hIrV/C5NHkBzuFEiBnWX94M2ipOTvlQo95vvOjFsQPBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wT8MEtRFMfZa8nar15NW36BfovVkKLHfowPg6hEBBOM=;
 b=B6Lpa3T25aHNLmFUP5LG4ODcvRRhdzSOTlYmLQcOvAeJLsOdrE8HTUCerMROtMA25YNUVQgeTQ0swbu0IG1C9zp8scTevdWgXu6ujlFwSuAUTONk58BXD1dwMMjAS3W3v9sysGpgkqxrmUCClkOeB0YY5ypDW80WMPZ3qioiLHpvVr0xhR3fC7zkXIurrf39lKTfHM9MqXyY5J0xnPLw3qKFs5qD6OD2hUjmKj9eiAUAWLeo6ngWQXjlmNY3fLjrUaqXDkLf+ljT3HaxUgm4t9rNWxXC5zW7x3j9GXI0oOaB9yfaSHWrMYp9fb3V10gpeBhiCKuI6BG1SuEXMdWzRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wT8MEtRFMfZa8nar15NW36BfovVkKLHfowPg6hEBBOM=;
 b=dgC+xFBBD33SbeU2L+y46gdCL1wI/WFvQ8dNcm2DtRTzqFVrFglfDBAwTwl1BjpkI3YDfJdtX+CsN2nIQ2n+MKliXeGnkJB2Phj1MtrLcY2Q9R276LjPGhN1jONqjXbohDTgW4OBO25fKFEcuZl22QIzU8GAB+uA7ZyS7DSgGyGpzKq/Naupq+bKtIZ5vsCN8jA/RQ6HvH8IqM+RW8NlrTt+ZxkfEdM/w3WUFMDoHJ92axD49g4VqRDnItup1Z+YzwJr/0x4OK7lR4MVqiwHoP80+QiYpQCj7PdMmAsdsQ/aKA6EHnymloRQyGLXiFe1otfugPgZa88OND4aA07UhQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB7726.namprd12.prod.outlook.com (2603:10b6:8:130::6) by
 IA0PPFFEC453979.namprd12.prod.outlook.com (2603:10b6:20f:fc04::beb)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.13; Sun, 14 Dec
 2025 23:29:12 +0000
Received: from DS0PR12MB7726.namprd12.prod.outlook.com
 ([fe80::953f:2f80:90c5:67fe]) by DS0PR12MB7726.namprd12.prod.outlook.com
 ([fe80::953f:2f80:90c5:67fe%4]) with mapi id 15.20.9412.011; Sun, 14 Dec 2025
 23:29:12 +0000
Date: Mon, 15 Dec 2025 10:29:03 +1100
From: Alistair Popple <apopple@nvidia.com>
To: Joel Fernandes <joelagnelf@nvidia.com>
Cc: Alexandre Courbot <acourbot@nvidia.com>, 
 Danilo Krummrich <dakr@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Miguel Ojeda <ojeda@kernel.org>, 
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
 John Hubbard <jhubbard@nvidia.com>, Timur Tabi <ttabi@nvidia.com>,
 Edwin Peer <epeer@nvidia.com>, 
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>, 
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
 "rust-for-linux@vger.kernel.org" <rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH 2/4] gpu: nova-core: gsp: Fix length of received messages
Message-ID: <5wfozb7rrh7snccab6dxckrd3umk7u34bixwjfqveta76237um@l23sftnckeep>
References: <20251122-nova-fixes-v1-0-a91eafeed7b5@nvidia.com>
 <20251122-nova-fixes-v1-2-a91eafeed7b5@nvidia.com>
 <504C636B-FB96-4B54-B9CD-C506026CCDB1@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <504C636B-FB96-4B54-B9CD-C506026CCDB1@nvidia.com>
X-ClientProxiedBy: SY8PR01CA0017.ausprd01.prod.outlook.com
 (2603:10c6:10:29c::16) To DS0PR12MB7726.namprd12.prod.outlook.com
 (2603:10b6:8:130::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB7726:EE_|IA0PPFFEC453979:EE_
X-MS-Office365-Filtering-Correlation-Id: c5985a0e-0354-4cd0-1183-08de3b6896a2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|7416014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?T0xySXJjTS9oUG1GOFQzL0o2M05XNGxmcHB5dGFlMGFSN28rOVFrb3RnaGtu?=
 =?utf-8?B?Mkg3QWZxY3BWZmcyU2dhSGdMU0VJUkZiRTlVMGZKTHFDc2dhQXErdEtDdXJR?=
 =?utf-8?B?b1ZCK04xeXAyc1pVS1R5cnV6Y1VpZWZTS210bDNXV0xBWDRJUDJiQkZGN1hr?=
 =?utf-8?B?V1JKUWNSU3BPaTRRQ1NXK1ZyQ1hHcFpLSGpUMVVvandkZlpJNzB3ZEowTnJ1?=
 =?utf-8?B?NExqdjJveGt6b2J0dGFscHhIN3RXREhzbzNxT2dFUUdLUmxSKzU3Q0RCS1Fm?=
 =?utf-8?B?bWllZGFRVjN6R0JiRGkxMzUyUDkweTZhQTZJS0ZFZDBVVUU1TTJsMUV6REQ2?=
 =?utf-8?B?UTRXaEtOZzhBWVE2MmpIb1ZhVHBzc3dXWk9ZcmRIcFVvcWZmTHJWcTlxRmx1?=
 =?utf-8?B?ZldGVFN3WFRXVFJERlFQRnF3ZUZ4SU9FNEl6aXkxL3VTeHlkdGxQblBzbElr?=
 =?utf-8?B?MnRXV0M1ekJFSUo1bVhDMDJBZWwrakFic290VjF1TGVtODN3TDYzMGpEL2ZV?=
 =?utf-8?B?Yjc4TU1PcjJ4MkJLa25XSENlTEJBTWQ3RzUxZEJzcjVsVjhhNzlhZkQrSEJz?=
 =?utf-8?B?cWRmamJ1Z3U2ZnQ4UFdSbzlhcUJ2OENtYzNnQkpKT1hRK2xqM2ExVnVIVGhG?=
 =?utf-8?B?Z3kwNEJEYkhWZ2plbis4R2x3R1Jra3JIT1hrb05KQXF6WW5CcHJieVRhMk9L?=
 =?utf-8?B?NzhxYWZFblh0NktndGpxSUUwNWYvZ3dxUW1ndnprRzBjZnYwbFIxODZ0WTJz?=
 =?utf-8?B?UUlGenMyU1NaTWczZFZhTUJFS2txVE14eGMxdGN1Q1F1STVKb2VuQUZXcVQx?=
 =?utf-8?B?bWM1NkoxQkJpTVhMRU1kNzJSUDFBNU0vK1RTRmV0VlBmTE5lRjBBSk41ZWow?=
 =?utf-8?B?bDN0V1hQSGdTNWVmNVV0UVJVdlplVllqbXNHdWs3enJ2dUpxYSt4dE4zNHl3?=
 =?utf-8?B?RFI3MzJ0T0tUdkpCTnNtcHM5aHpCS0FZNHB6VHpoc0hRdlhSVDlpQ0k0QTYw?=
 =?utf-8?B?QUZiNWtsR3prRThsRHo2MFpia0V2NWJja015MndGcDAxRXRPaUxTbGEwc2Jm?=
 =?utf-8?B?cnhzcnlKSzllNDQyVEh3dHc5d2JnSXdkMzhUNlZlY3VTdjFBeWZDNm5qT2Y4?=
 =?utf-8?B?WGdzYnZ2WVVBQjIvcjEwb0dvbHFYbzBNZkRYN3hYYU5NODFLQkZCVWJxaEV3?=
 =?utf-8?B?YzZvSWFHWWRHZnVoL2d0NUsvZmFTanUzSnJXT0JmNC82VUo5T0hNcko5NTVM?=
 =?utf-8?B?MEVHSENOZzRXWGFoNmZ3M2lzRDdmZ1ExMXowUUJhS2pBT3Z0d2lrbTBUN1J6?=
 =?utf-8?B?UklZLzh6V0EzZkk4WlBDT2x1YzNMczRXaFpKRVJBQVdCMnF3c0NCUzdUVDZO?=
 =?utf-8?B?bDJ4djZQR0hNbys1dTRNUVg0WU9LMk9pSEdmR2RpVGdvTS8yRVBuL1MvWDZD?=
 =?utf-8?B?M1owSFJQSnl3VU5tTktDZTN6SjNJa1FNcVEybWVZVnRWcVl5bjlUbkVXb0Rh?=
 =?utf-8?B?OS8xZ1FGaHhTZFkwMUwxYmRuaWVlM21JaHd0d1o3VkJ6Z2FKMUJJVGpYUWZz?=
 =?utf-8?B?clVRSEQxUndNanZNbjlEYVBCUjEvNmtsZ2gwdWZMRjRTVGp0QXhscVZRWHBn?=
 =?utf-8?B?NTdIS1Zid1pyZ3N5QXBqZUdaUEYvQ053UFhlNXRaK1J3TnNObkpObDM4UHNx?=
 =?utf-8?B?eDlUb0xjVzViN083TVZHTzkxR25nUUZacUZ5SWh0dk1jOGIvN2RvekRZV0xM?=
 =?utf-8?B?b3ZDdXhjYjNCY1c4bUROckQ1Y21MVjZnSnNScU9qSW11ZEJkdXlPZ2xNUUM3?=
 =?utf-8?B?aWVOd09RbE5XMVd2OVFtUXAzb09kVlIwbDU1eU11SkpVdmNPeS96YlRDdFlW?=
 =?utf-8?B?bjVwWkcyMFZld0xDdXNWMGVzbThoNWFKVWVHQ2ZEdW9Wa3pFT2VpRmFTbGg0?=
 =?utf-8?Q?gAHhcGbr89E/wYSEIKt2hRRMiCuLmSkX?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR12MB7726.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(7416014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?K3ZudXZ3UHhTZzZBMVBnT1ZUK21Na2VGWjNoV0VlTGhaMjJJaklTK1pOellT?=
 =?utf-8?B?VjJLUjQ3S3dkRWxMSUtRVTNHaVhhQzR3V25Pb1FaZFViYTgzMnN6c0R3WFow?=
 =?utf-8?B?K0FHb29qaTNBZlRwQnk1blU1eEk1Rm9CTVNYRy9xeDFidElrWDRrYWg3RVh5?=
 =?utf-8?B?SjRwNTFaODFheGljanZkeWplNml6QlhjOVQzOUN5MDZDdDVqOE01eDhHczhv?=
 =?utf-8?B?MEYzTngvaEtyeDlCb250Y1pNeDFwcFl2Um1lNW4xNHBzZmdhYkpRZjVoSjNi?=
 =?utf-8?B?bjl5MFlFYjNCNWUwVEhJSkRCWnBrV0RFcTYzak93L1hnMm9aMUUzR2JwMVlz?=
 =?utf-8?B?QmNRc0Y3dTRzT0sybTNaZUlGSVl2bmtFRFZPN0NqY05DazFIM2MxaW5PT2JE?=
 =?utf-8?B?TUYwWlVWT3RPWmRraEVneWZ3L0lpT1dlWUVoUFhBN0oydXJxL0RGTXVHMUov?=
 =?utf-8?B?K1NGZUhmL2R6Tnd2Z1UrMEdrVFMxU2hGb3NrSE9WNlJxMlFTTS85eDRFOWpr?=
 =?utf-8?B?M2xWd0dGcThJR2thYTdCc3NXZUxnVXBRZHhYSmhOd0NGV0Q2UHlIMWRteWdW?=
 =?utf-8?B?c05KVzJZWkgvMktMQTdpdlJpbmhqRFltQkpBS3czVzBvYWRhOTRxajE3elUw?=
 =?utf-8?B?bDk4N1BQUzA0YTd5Zkc2anJscUdsaGQvL2pNcm5tS1RFSC9RanlzNENQcE43?=
 =?utf-8?B?ck01ckRCYTJwVEROcDNwWGhqQWZDQ3hLbEhHeE5LRHVneUFDYWxNVFZMYjhU?=
 =?utf-8?B?US81Skk3eGdCRzFzMm5OK1RGUGUyMUx3Wk5KMlZ6UGk5R3gyOGpqTkVaZFBn?=
 =?utf-8?B?QmVZbnFHZVpGMmlXbE5nRmZ5ZFJTYkdlSW9kQ2swaGpybVFyWnc5eFA1djR1?=
 =?utf-8?B?M3A1MXNTUXdIUWVrV1cvYXVNTGlMOXlreXRKNTBTSUdVa3VHYWt5RTJNZ2pm?=
 =?utf-8?B?Mjk2TWNPOVM5Umh1cDgzdjhPQUZ0SnpQTTRmSm5xOFlKZ0V0eGF6SExmbHl3?=
 =?utf-8?B?UDlFY1RlV2p4TjFnRDE4cXhNR1pob2Q1eUlEMDBPcExjVXZJS1BoTjRmcjBn?=
 =?utf-8?B?djJNa2VkN2YwWW81NE5iME1XZXBTQmFiTnRTam4wL0wrNWlKaEFPOUYvelk1?=
 =?utf-8?B?TUtXOTVWc1BKRFZYMERxaGR6S1I3bzZjd1JXT1hxY0NJT00ya08ydDNNWTBl?=
 =?utf-8?B?bkcwUmQwMnl5T2tpTTFCWnNRM04yc2w3UHJBcUdKSytwVm5JeTRnVmoyYWor?=
 =?utf-8?B?R0oxNG1lMVRQUERIcVdhU2VrN1MyRjhyeTIrSmhuNWM5MS9CeDdQRExTN1hF?=
 =?utf-8?B?Uzc2TXUvWDIzRmNCZWNJR0MrU21YbHRtZ2xaUEl5bTBLeHp2N0FoOE5sOC9B?=
 =?utf-8?B?bDFaMjR6UW9aSnZyVWliL2dYVndVOHZxc2RpQVlTd1lpbVh5Y3RNYjU2ck5S?=
 =?utf-8?B?ZG1YZjdVZnVINFdtY2cvREplZ0o0ejhrOGZKQ2QrMHRidXFqNXRMRzdZYnNz?=
 =?utf-8?B?dmhYTk9qOW0rTzhxbXNmdnRvTWRoVzhGMHJNYlptMHBPZlMrT05qUkNwaXNO?=
 =?utf-8?B?K0UwOUFCempjOUpyMm9RMjVrM2p3c1lZRXoycmVtYnkzRGtCSE1uM3NmcVQ0?=
 =?utf-8?B?OXptcVExaFpvZ2YwSG9GK1I2MVZMZXpRSEF4aGFCQ3AyMUVZUHRRUVBlTUk0?=
 =?utf-8?B?OGtncGJGemMzYVZXT1VVaUc0c080eThQRFhNZXJsczAyTlJIdFRmNVZCVTJz?=
 =?utf-8?B?NHc4VWZHQiszam84b0M3TFFTa3EyTm9tNzJweWM4UkFaTlJmamh6ek02RDJw?=
 =?utf-8?B?NWpVVnBQRGxZMVVWWHF4MmxYN3JOVkkrYjc5MVZXUzY2bDBxaWhqQTNsbDBL?=
 =?utf-8?B?L1FXZ3JuUmpTSVFnMkZDZHlYRWl5eHUzK1VlbVBhMXhLZ3JmcU5TYkRPTkZK?=
 =?utf-8?B?RUZ0TXFxZnBWQ0pYdzVaLzZQaDQwNHhSb3piR3p0SlQwdTJNTUVXazNqL2Yz?=
 =?utf-8?B?RGNMQzgwWFNxUEc0MExuWVJHVGR4OGdTbTR0YVZaVVNzbzNYYnZRQjdsb2ha?=
 =?utf-8?B?bGIwZ2JvYWpiWkgvMVdUY1pvelRsbDlKODBOTEdjMWZEbCtYZEN2MHEwZVAv?=
 =?utf-8?Q?gbHFbiOl0zHxS9Cn9dAckhp3O?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c5985a0e-0354-4cd0-1183-08de3b6896a2
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB7726.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Dec 2025 23:29:12.5037 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: L1ughlJskGPuLDCzdvCH8FuoVK7pO9oSupL3ZV7B2vgyDdMR0ET96Hs5nnrDQ1O2iYrc2XcVDPg/FJ55aleAVg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PPFFEC453979
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

On 2025-12-12 at 18:59 +1100, Joel Fernandes <joelagnelf@nvidia.com> wrote...
> Hi Alex,
> 
> > On Nov 22, 2025, at 12:00 AM, Alexandre Courbot <acourbot@nvidia.com> wrote:
> > 
> > ﻿The size of messages' payload is miscalculated, leading to extra data
> > passed to the message handler. While this is not a problem with our
> > current set of commands, others with a variable-length payload may
> > misbehave. Fix this.
> > 
> > Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
> > ---
> > drivers/gpu/nova-core/gsp/cmdq.rs | 11 +++++++----
> > drivers/gpu/nova-core/gsp/fw.rs   |  2 +-
> > 2 files changed, 8 insertions(+), 5 deletions(-)
> > 
> > diff --git a/drivers/gpu/nova-core/gsp/cmdq.rs b/drivers/gpu/nova-core/gsp/cmdq.rs
> > index 6f946d14868a..dab73377c526 100644
> > --- a/drivers/gpu/nova-core/gsp/cmdq.rs
> > +++ b/drivers/gpu/nova-core/gsp/cmdq.rs
> > @@ -588,21 +588,24 @@ fn wait_for_msg(&self, timeout: Delta) -> Result<GspMessage<'_>> {
> >             header.length(),
> >         );
> > 
> > +        // The length of the message that follows the header.
> > +        let msg_length = header.length() - size_of::<GspMsgElement>();

Wouldn't it be better to add a new method to GspMsgElement to get the size of
the associated message rather than open coding it here?

 - Alistair

> Is this immune to under flow without one of the checked subtraction wrappers? Either way, we should not tolerate the underflow I think. Which means it can panic when the rust overflow checks are enabled. Since the header length comes from firmware, this cannot be guaranteed to not underflow in the event of a malformed message.
> 
> thanks,
> 
>  - Joel
> 
> 
> 
> > +
> >         // Check that the driver read area is large enough for the message.
> > -        if slice_1.len() + slice_2.len() < header.length() {
> > +        if slice_1.len() + slice_2.len() < msg_length {
> >             return Err(EIO);
> >         }
> > 
> >         // Cut the message slices down to the actual length of the message.
> > -        let (slice_1, slice_2) = if slice_1.len() > header.length() {
> > +        let (slice_1, slice_2) = if slice_1.len() > msg_length {
> >             // PANIC: we checked above that `slice_1` is at least as long as `msg_header.length()`.
> > -            (slice_1.split_at(header.length()).0, &slice_2[0..0])
> > +            (slice_1.split_at(msg_length).0, &slice_2[0..0])
> >         } else {
> >             (
> >                 slice_1,
> >                 // PANIC: we checked above that `slice_1.len() + slice_2.len()` is at least as
> >                 // large as `msg_header.length()`.
> > -                slice_2.split_at(header.length() - slice_1.len()).0,
> > +                slice_2.split_at(msg_length - slice_1.len()).0,
> >             )
> >         };
> > 
> > diff --git a/drivers/gpu/nova-core/gsp/fw.rs b/drivers/gpu/nova-core/gsp/fw.rs
> > index abffd6beec65..7fcba5afb0a3 100644
> > --- a/drivers/gpu/nova-core/gsp/fw.rs
> > +++ b/drivers/gpu/nova-core/gsp/fw.rs
> > @@ -853,7 +853,7 @@ pub(crate) fn set_checksum(&mut self, checksum: u32) {
> >         self.inner.checkSum = checksum;
> >     }
> > 
> > -    /// Returns the total length of the message.
> > +    /// Returns the total length of the message, message and RPC headers included.
> >     pub(crate) fn length(&self) -> usize {
> >         // `rpc.length` includes the length of the GspRpcHeader but not the message header.
> >         size_of::<Self>() - size_of::<bindings::rpc_message_header_v>()
> > 
> > --
> > 2.51.2
> > 
