Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CNWqIjxJd2l9dwEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 26 Jan 2026 12:00:12 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E0803876E2
	for <lists+dri-devel@lfdr.de>; Mon, 26 Jan 2026 12:00:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 23A1210E042;
	Mon, 26 Jan 2026 11:00:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="FUUwf6FT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BL0PR03CU003.outbound.protection.outlook.com
 (mail-eastusazon11012038.outbound.protection.outlook.com [52.101.53.38])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A512610E042;
 Mon, 26 Jan 2026 11:00:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Dna+BbXHabq8dW2UuZPZzZmXdAn4WBlk7lTGFj3R5PGnkKYxs2O5QOJU0IddNKzsoKy0SzCUScOPQts2Rk3ZJUZxrEoj/DfAOHVjM2GABmUtRX4uxn500nht5CnP71NZMF1DxJLoukOSkLtxaxjIqwMt0PcoUcG+j49JjmbaStwRoHGTZ9i5niRG6uvwNwM9X2a2hNLMQsT3h18ye8HBTnLePr+h91ayekUMM+HuqgvOmTkqtQROcnJoOGp9FAAKwvWbfODKv7GvO0VI+6KzZE78DoKAdHbrywk/KcW5d0UGq2TZPXFE5H5f0LptqdkwzAHAp5dboTs62w3WwlOaLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HehH4pL0xaxBH9mI0pqltMvR9SiMQskWzO3f7lAvPW8=;
 b=yECvFkrDO5n2ZHtj9X/5E7mJ2/X4MAzauFEGqz/qwTah/ERFljLF3tyLJ5DlUWB085c32jSUubrrqigtegeFeAxCkMJyAjfcx+tq7Wrqp3W+weswGBekI5QAc5RTUnvAtgFx50WdCDy+OXksFTd/Btq2bNce6IeKmW5xiT9AfIlqGoiGhtYskrfJ2Zi2TAv30Vnd3+qMFF5IicyU6LGjgLzUxgLh0bcavWHyC73Lfu2lScaTYwL6H7y8rWRDQ1c4q9tapeHPw02ZlukErNjKxwNY9Psazzbgy1F3xHFaXX1F4mUS7E7lYXhLxRusd4jAK1biD3Nl7INA6m2KdfPc+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HehH4pL0xaxBH9mI0pqltMvR9SiMQskWzO3f7lAvPW8=;
 b=FUUwf6FTZdJTszZzxP/KXWVWyjLyA8xysecDbdoYEfjBSF/ZwTbjX2PPOpgSYSAWtN5b9OFnB01GEED+Zr7ES2Hkeh5Hzxno3z8/2e9qx/ouMabwNQxkC8rKAUHLPUA3NHS6kKnamqqwxINXnWPcg6dxUW6WQyaqXH8B71Omy9ENrnKGp5T5C5n0C13bXpBupYPUN+K1eUJsViPypIXQ91LNFD3DPJDPOZT8YebAR9o+tUYaWdTAXlLrCS8fXLqIhaq+uzKCItVruW6SOn6ex8Earm8P0mwF3fMh/NpD4twZP+EnafxujKCX57fO4CReXeK9XwLdUMQA+W19AS2VrA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB6486.namprd12.prod.outlook.com (2603:10b6:8:c5::21) by
 IA1PR12MB7567.namprd12.prod.outlook.com (2603:10b6:208:42d::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.15; Mon, 26 Jan
 2026 11:00:03 +0000
Received: from DS0PR12MB6486.namprd12.prod.outlook.com
 ([fe80::88a9:f314:c95f:8b33]) by DS0PR12MB6486.namprd12.prod.outlook.com
 ([fe80::88a9:f314:c95f:8b33%4]) with mapi id 15.20.9542.010; Mon, 26 Jan 2026
 11:00:03 +0000
Message-ID: <064d5afd-f193-46f2-9c46-b20adcfe36df@nvidia.com>
Date: Mon, 26 Jan 2026 06:00:01 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/5] gpu: nova-core: use checked arithmetic in Booter
 signature parsing
To: Zhi Wang <zhiw@nvidia.com>
Cc: linux-kernel@vger.kernel.org, Danilo Krummrich <dakr@kernel.org>,
 Alexandre Courbot <acourbot@nvidia.com>, Alice Ryhl <aliceryhl@google.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 John Hubbard <jhubbard@nvidia.com>, Alistair Popple <apopple@nvidia.com>,
 Timur Tabi <ttabi@nvidia.com>, Edwin Peer <epeer@nvidia.com>,
 Bjorn Helgaas <bhelgaas@google.com>, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>,
 Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>,
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 rust-for-linux@vger.kernel.org
References: <20260124231830.3088323-1-joelagnelf@nvidia.com>
 <20260124231830.3088323-3-joelagnelf@nvidia.com>
 <20260126100837.74c8597d.zhiw@nvidia.com>
Content-Language: en-US
From: Joel Fernandes <joelagnelf@nvidia.com>
In-Reply-To: <20260126100837.74c8597d.zhiw@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MN2PR01CA0049.prod.exchangelabs.com (2603:10b6:208:23f::18)
 To DS0PR12MB6486.namprd12.prod.outlook.com
 (2603:10b6:8:c5::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB6486:EE_|IA1PR12MB7567:EE_
X-MS-Office365-Filtering-Correlation-Id: 43774f90-8ff2-42c9-79a7-08de5cca0ecf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?aSsxT2VZZGlqNU1oM3FrbTVkSE1pTjNHRkgzdEZ5VjlESERJYlkzK3BsZFlk?=
 =?utf-8?B?cVZ3SDlvK2ZWcWxJYUNjV3l5UFdUY1haOW1VbnBKemMrV2I5M3FoMFFRUGxw?=
 =?utf-8?B?Vkh1NkZ5RHVIZ203VVNwT1psemh0UWNCRkZXUFhsUVhmemdiSm9TRzQwQkI2?=
 =?utf-8?B?ZkZISXRtd3lHUGRKcHE3Q1J6bHo2WXVJc3FQY1o3RFdjSzQ0MzFCWHBrVzMx?=
 =?utf-8?B?QU9QdG5OQ0ZIYkNOaXVOaklQMVM3S0Rjd0xTODE1bEpMNkRPUmtwdUFaZStZ?=
 =?utf-8?B?UHFuRDRFUVZpdFRYMEdUeWtsK3VJRURXUS9uZFI1NnNPYUtiTnEwTGtWNVVE?=
 =?utf-8?B?cHRhcmZZeUUzM1BmOGRIM1BLR3FDYUpRSVdIU2dxak80cmY2V0R0VCsxU3RH?=
 =?utf-8?B?bVg5QnJHQU5VclVaYnhtaGlEN2wrNjZwM2tqak56a1dzdUpVYlVqK0xQNTJC?=
 =?utf-8?B?MS8vVzAydyt1bzdLcUk5dFRrOGJaWFJCb3YrcS83SDNXazI4c29FeDZYQ0U1?=
 =?utf-8?B?U3NqMWZKR1VZNVI1ZEZZVlJjWHRyQkZGOHRQL1l1MXB3TGkwQnFYaFRtMkE2?=
 =?utf-8?B?WlVIOUlqK0NBM3BoOUtoSXhvWG1QMHB6TklRbW1FaDV6M1FERWxnU1ZKZ25F?=
 =?utf-8?B?S3VzeVIvcEZVRStLWjBHT3lCQmYzM0tTM3Z5Z3lxR0RBUm4xdytyWDZhL3Np?=
 =?utf-8?B?eTc4UXJaTWxFUjZWMHoxa1hRc0tkODdUbTNGTUtoVE93SU9pRGZoVXZuaUU5?=
 =?utf-8?B?UWlEc0xYVjhNYzN1MmJMSVRodC96Z0QzaXNpOEJBQnFPenlnVzJPQ2NkbjVO?=
 =?utf-8?B?VGxicDR2b3BMVkNJQ2VUUU5McFpQZEdXOG5SbktESEhsdnNZWEV1ZUNFS3Ri?=
 =?utf-8?B?NkdTTXN2VWxjWEZ2Qnl0N1FkeURPOHlyUUVCTm9Ra3ZudzhJYnNCeXBMRjhO?=
 =?utf-8?B?VXpPK0xSZHBGd1h2TmY2L0R1R1FxcEgwVVZsSXhTWVhQS1Nrc3RCMHZKdXBO?=
 =?utf-8?B?WmFmeGJUNnY2eFhnUW9LemxXejVhS3VsczQzeTV3a2J6NnVaUCtyZ0xwQUw1?=
 =?utf-8?B?cCtuY3Q2T1ZNZzhHc3J4UndTdXgrS1NDRWI0K2x2WE1xempQSTl0d05hdllN?=
 =?utf-8?B?eFZLSkJpTU9sZDJyR0FHdk1mMW1VUGgydTE3NzRHS2xGWkFPdCtsT2VtcEpP?=
 =?utf-8?B?T0dmblEzOVpaK3pKM25VdlpaR051SFE2Um9DOVgzK0JaM2VBQUFVNzR5Mkpx?=
 =?utf-8?B?dk5QdUtTaVNJV3FmT3lZK2NPZXd3MzlROFk5QmFrNmVxMXB5bzJ3VXNSanpm?=
 =?utf-8?B?K1p1RFVCWnR6Q01LclpYWldITDZUQ3Mwb21ZL3pyRisrZVppcWx2UktnUWNi?=
 =?utf-8?B?bTNPZWVpWCtPc2tEdDJRVlJMeGtPMy8renRFVTg1RGVtbXFZaE5qZkZxQ2Uy?=
 =?utf-8?B?MmhWWS9EYXg0Rm9La2psbTFmNWt6c25kUVplMXNuLzRqTFRYWHBzSmVWMVNp?=
 =?utf-8?B?dXFpNXlPOEZkV1pxaVJ6WkZqdTcxQ2tjekxkNHljUWYveTZQUHIxd05DY0RV?=
 =?utf-8?B?L05ORERqTG9JSXlzdm9Ldk43UC9BQVArUnVvYWNUN0NsVXJvcGpyMVc1aVFm?=
 =?utf-8?B?VFNjTWFtWHZMS1BVQUduQkdETGtmMEhSc1RkQko3NFdZSVNDaGJZYURsdllr?=
 =?utf-8?B?ajV4VUhUU1hxL2swd0M0eTlvazlmYU14MzF3ejVUVXFRMG82YmFGVjExb3da?=
 =?utf-8?B?dE9EUTJra1ZLOUNVSWZYS284MFhDYlZicktGWU9BMDU5QXE4RXFrMHUwR0lW?=
 =?utf-8?B?VytSdG5MTVpWREtPZWVWYm03dUloQ3QySmJNS2NsQkZEUE93WC9acUxhcWM3?=
 =?utf-8?B?SG04MHZadkwwSFpRcDE4WHFlZXJQczJnWkw2WENodTdzRWF6RUxZZXo5bUpT?=
 =?utf-8?B?V2UwazRPVS9ObU5neTdUOEduL1BRVU5na3E5b2xlRDR4RS9GdVc5L05yTjhz?=
 =?utf-8?B?WXBNMms2em54SmdDc2MxWk85cFZJZTIreGZpdU83K3lBT0Z4NVVmdEZqWWxC?=
 =?utf-8?B?b3RZVnZkV1lrT0w1OHhmSEpodlpFMm1pRU00T0ZYNVRKTVRRM1kzTGdwNWJB?=
 =?utf-8?Q?iUfQ=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR12MB6486.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cDlGNlpqSGNFWUQzQjQrYUMvVWQ4N1pSaUZHWTdNbXBFMDVqbVRHcGhUZWhI?=
 =?utf-8?B?dTcrTC9YMkNWUDhVRllIVmpkTHpQck9DdmlTNkZLUVkrTWVIUGFQWHh4QmFF?=
 =?utf-8?B?YnFiZUt3TmhKd1NxbjJSRThVSjVxUkRKQ01ORUdCbDQwTmVhSkh5K2ZlU0ZR?=
 =?utf-8?B?cHZiSzJRRjdxdWtvaEZ0SURQVTY4Rjg3bTBhQkFIWTA2aEVZeVpZRFlOVVQ4?=
 =?utf-8?B?RmtWeHZYb0ZKbFl6Si9lUDY0UTJmcGVZcnNBaXJ5T3drVkpKYmtUeVExeEpD?=
 =?utf-8?B?bmZjaExRVCtBMkk5V2l4MmhGeDF3RTZpVWRoMDFkVXZlNEFjNkZZcU00RlZm?=
 =?utf-8?B?dWtGVTFXT1FxZlFOd1ZqNnVZUExUMmxyRVArUW5wSll4dk1qOWtVSlIxd1pG?=
 =?utf-8?B?dGR0NG9zMGQrNEV6eU1xU3c5K21rSjJuKzYxL2hvb1Z6b0RvRjBtSGZVaS9r?=
 =?utf-8?B?cnFCRGtuNFh1bGhMTDBDT1FTd0krNGdyaUl0MHdOWUhqQ290TWxodVNYWitt?=
 =?utf-8?B?blVzRVRVdEZLVFJqY1VGbUxlQndPdzU3aXBjZ1lPd0E3aHdyRTJvdHl4cTVi?=
 =?utf-8?B?YWN5enp1YS96N3JHdTU5QitZSjNxanZ5cmRKYkRlb3NrbTVQLzFxZ2lmNW5E?=
 =?utf-8?B?YzE1Z1EvRHNOSzlIQytiaFV1MnIzT2dIV0VSYnVLNkp2RVBEQkdLOFIzalJr?=
 =?utf-8?B?bmlMSTM4TkoyOTVZVkMreG9BZ0ZKL05Seko0dmVLazJKTFZ4RWhNbWJOTnZH?=
 =?utf-8?B?T0dLTWRyN3EzaDlUMXpyaVQ5WnFYbEtsK2x1UVZDKzhRRVBHRzBBZDhTMHhS?=
 =?utf-8?B?ZEM1NFk4QVpXT2l6NHpkeXBzRDNteUczT25rZlRlMmNQNzJTeEpPY1plbzZ5?=
 =?utf-8?B?UHdsbHdtMlRTdlVNb0x6NFFQVnZNVFdRdllKOS9LZURySVFhOVJKVTg5ZEZt?=
 =?utf-8?B?SDNua1lEdEd4WW1RN1UyMTJkbWMwcWFCemhMRW12WWZadWdaRW5CeDcwRmFR?=
 =?utf-8?B?UnFyb1E4SHVmNWt6TE1PSXVYQWdlMGVxcWtrQmxvKzBMSnM1bnFyZGxRR0tN?=
 =?utf-8?B?aHJORnV2UHZCSUF2L2tzRlIwOHNWaUo0djNQbTA5aEU5L2JWd2Fzbld2cngy?=
 =?utf-8?B?UTgrYTZXQVNkZ241NDVya3o1L2QrTHJVdFFWVHJ4allWUml5cjZNbTJLbEsx?=
 =?utf-8?B?b0sxNVRja292L2Z4d2cyQ2dtWkh4U2pCSzBjMGc2QkxrUU9oNW5IRFI5VTRh?=
 =?utf-8?B?SGJ5cHhla0R0VU5NcVo5U04yOGhmOW04bm9ZcklkUXk3ZHBFd1JFQ2R4cm1u?=
 =?utf-8?B?aHdrUkZSSVZXcW00T1E3dHJsSEd0S3h4RVpwejQ3Y1NsTUNSWDRqSDBxN2c4?=
 =?utf-8?B?TDVnSjNvak5FUDhISjI2ZFVkdnpZTVdOMDloS1lZbkdUU0NmMDgzTG9zMVAw?=
 =?utf-8?B?ZkkvdmRzTDFSL29UNUVlbWNWMW16R0d6cENMUmVxbSs3NCtzVWJveUxyL2t3?=
 =?utf-8?B?YVJid3ArVElyRHVJbkRRN1owLy94RGlXVXFWMFpNanpWU05KamlTWmRHUmx5?=
 =?utf-8?B?K3ZDaHMwdDdjNlc3eXczbitvRmtyYy82eXI4L09XajZRYThUd1htM3dRVEZp?=
 =?utf-8?B?WVE1VTd4a2IrY0MvNDlaZUdkRUZXTDlhRVpVNDNRQnI0NWRUK1VQamxOS1Yy?=
 =?utf-8?B?bHBtdHhXcU5NcXNuZmZ2bmlOcEFIVUxvQ282bXJVZm5GLzJvakUrNXNWWGs2?=
 =?utf-8?B?aXVtalI3eUpuM2djd2lqOFFRazUzbEo4RDBmTHIxK2wyellvTzJMakdrODJx?=
 =?utf-8?B?V1JmZVFBZDk0eGwwQXlCWHJFbUoyc3k2Q29sdFlNcm04Wi9mc1JSQ0xvR2dO?=
 =?utf-8?B?T3F0MDJQTzRmL1V4N3p4MWQ2Y1lwaHZrbEZNbWdaRERVZWg1b0tIdU1JWDBE?=
 =?utf-8?B?WXc4WXFXWlF6SnpHRERUcGNlOFNyQmNzSXdvS2RDenJnMm5ocW9QWXlFZ05C?=
 =?utf-8?B?NTR1NExvVUkzWExUbWpwMXhvMU5nMk1aR3h5eDZrWS9XR1VBOUVBUnl1Tjlk?=
 =?utf-8?B?anVNZndJZHFzaUcwdEEySC9ZZHg0aEMrenNlQytMMDArUkpaRUdDOXdzUUN1?=
 =?utf-8?B?NkZUbVBCNVlaQ1ViYXAzR1UxWnY1Q0xVMWNTRS9ENWRmZzloRXFVc0EvUmFN?=
 =?utf-8?B?ZWYzZ0RBUzNSSDNXYXV0eTd2OGZKN3VrcE5HaUVWUzJsNlArbzJGT1RoeVdE?=
 =?utf-8?B?MzVRT1ZmK3FGMXhJcjJZYnZyeW5icE1BcEVLZ28xTi84cElyUytRT3RqTThK?=
 =?utf-8?B?TzlHcDNwQ2xPNDdCSEE5WFVkaDNmZHErR2FSYW5uV1VZVjROUGlMZz09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 43774f90-8ff2-42c9-79a7-08de5cca0ecf
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB6486.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jan 2026 11:00:03.6447 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bT32azawV+JBn/Rc3T0UWU/ltzcdc4vx/IBC/CYTq4rH0HTBicY5j96lHGPB4xP1mYgDEpmLC5zhzhjoswhzAw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB7567
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.81 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[nvidia.com,reject];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[23];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	FROM_NEQ_ENVFROM(0.00)[joelagnelf@nvidia.com,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[vger.kernel.org,kernel.org,nvidia.com,google.com,gmail.com,ffwll.ch,garyguo.net,protonmail.com,umich.edu,lists.freedesktop.org];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[Nvidia.com:dkim,nvidia.com:mid,nvidia.com:email]
X-Rspamd-Queue-Id: E0803876E2
X-Rspamd-Action: no action



On 1/26/2026 3:08 AM, Zhi Wang wrote:
> On Sat, 24 Jan 2026 18:18:27 -0500
> Joel Fernandes <joelagnelf@nvidia.com> wrote:
> 
>> Use checked_add() when computing signature offsets from firmware-
>> provided values in signatures_iter().
>>
>> Without checked arithmetic, overflow could wrap to a small plausible
>> offset that points to entirely wrong data.
>>
>> Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>
>> ---
>>   drivers/gpu/nova-core/firmware/booter.rs | 19 ++++++++++++++-----
>>   1 file changed, 14 insertions(+), 5 deletions(-)
>>
>> diff --git a/drivers/gpu/nova-core/firmware/booter.rs
>> b/drivers/gpu/nova-core/firmware/booter.rs index
>> 86556cee8e67..f5ad619dc055 100644 ---
>> a/drivers/gpu/nova-core/firmware/booter.rs +++
>> b/drivers/gpu/nova-core/firmware/booter.rs @@ -119,14 +119,23 @@ fn
>> signatures_iter(&'a self) -> Result<impl Iterator<Item =
>> BooterSignature<'a>> Some(sig_size) => { let patch_sig =
>>                       frombytes_at::<u32>(self.fw,
>> self.hdr.patch_sig_offset.into_safe_cast())?;
>> -                let signatures_start =
>> usize::from_safe_cast(self.hdr.sig_prod_offset + patch_sig); +
>> +                // Compute signatures_start = hdr.sig_prod_offset +
>> patch_sig.
>> +                let signatures_start = self
>> +                    .hdr
>> +                    .sig_prod_offset
>> +                    .checked_add(patch_sig)
>> +                    .map(usize::from_safe_cast)
>> +                    .ok_or(EINVAL)?;
>> +
>> +                // Compute signatures_end = signatures_start +
>> hdr.sig_prod_size.
>> +                let signatures_end = signatures_start
>> +
>> .checked_add(usize::from_safe_cast(self.hdr.sig_prod_size))
>> +                    .ok_or(EINVAL)?;
>>   
> 
> The same concern of comment format in PATCH 1 raised by Dirk, With that
> addressed,
> 
> Reviewed-by: Zhi Wang <zhiw@nvidia.com>
Fixed and applied your tags, thank you!

--
Joel Fernandes

