Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BB249BE60A3
	for <lists+dri-devel@lfdr.de>; Fri, 17 Oct 2025 03:36:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC36310E097;
	Fri, 17 Oct 2025 01:36:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="AmCX05WU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CO1PR03CU002.outbound.protection.outlook.com
 (mail-westus2azon11010031.outbound.protection.outlook.com [52.101.46.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7312810E097;
 Fri, 17 Oct 2025 01:36:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sdkumR4jRwgvGBZR/vCEDilm5gz1ace3VRdUxN9inov4kPflLB/40X4HcSvTB1zDdjRKmXsV0dC5KR73mFyS//1PiokjMvhKQgMxKLYVwz/M08TUf5L8fZEdFBy3vUO7daEYdZeYP+QQ0Glz2HFzn29kkbQj+6ImA/8fnGLPaQHIsft9/MzXiPVluLVDFZse13t2Io7q7kSxzfjjCDbyyTIft4h8e0nRGiSurF73+K4FtnvjCZnlUUAj48YoBGFFRiLXCJjA30ERIx4X1D2rneoHOeC90BHcBw0bCHCAIr1u0SR3JSNeXAkV4zTekhQBujeU8HTFERF9t7Ek+tlXAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=azec3H7JZHl5Wlav5n08mAbjtG0j/Jw1xCkLxfMsY40=;
 b=tXPq0eMsOqaczZE+9+/3dZb1TvoysxKGrJOaoclJlZ+4i+VAOrzNWdxmdBGyd2wWqfBE4EsAdE/klTVWhxS9oZ+ZfYq65mVNF27OgBg3DNpQsOyLRO+DF+KFD/uTbApwoJFTe/v8foJcP4QXdCd9ZI94CWyflxm9Q0AHTZ02lYyn5RC+zzB3ZN6YTeS+k1IX9mL56y4P7DvLI1dSc6K5rmoIqE6avYXnfiejIu0krjY8yziD1YmFi8dOxxb2YpJTBuw6dbBWaWOv1+uLtxbV3dvUfrMeDmaXuk/t9rpf2R4gR8Cu84Fv+d1LlLlTIeNiAnZf5wtCr1xYMwKaw3EDAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=azec3H7JZHl5Wlav5n08mAbjtG0j/Jw1xCkLxfMsY40=;
 b=AmCX05WUKuMH/xz6tcwQK5dQ2CrXSLjvhN+DbVcKTracbCKd4RxveOhmm2Lwp0zo4mdAx+VxqhJ2vNw5kM/aydZP8+Q4O0aMI7Nv6HZ2hrH5oSyeRyfSkVO/FZUszf44etH+yxVA2TxJT7y58CYYpa1BFlib9TjY5albMgKpUqFKUs2IqwFWO/Vn4+CGgPHSHCwCXxAfo3KbPOu/vb+owoG9ZZEiCaCPtcfJe7SmRqeHxBUZRE/lf6enyeGRUAPUSzgl5dR9HU74+J3mpsfLmW1pZorO5uiY2Qd4DhMV/sYOf31EyJEk1dZEhlaqE6pu60QGeD81NrzPVrTVPQN7fg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by MN6PR12MB8514.namprd12.prod.outlook.com (2603:10b6:208:474::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.11; Fri, 17 Oct
 2025 01:36:13 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9228.010; Fri, 17 Oct 2025
 01:36:13 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 17 Oct 2025 10:36:10 +0900
Message-Id: <DDK7N52VX059.202D7SPGFV8A9@nvidia.com>
To: "Daniel del Castillo" <delcastillodelarosadaniel@gmail.com>, "Danilo
 Krummrich" <dakr@kernel.org>, "Alexandre Courbot" <acourbot@nvidia.com>,
 "David Airlie" <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>,
 "Miguel Ojeda" <ojeda@kernel.org>, "Alex Gaynor" <alex.gaynor@gmail.com>
Cc: <nouveau@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, "Boqun Feng" <boqun.feng@gmail.com>, "Gary
 Guo" <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, <rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH 1/2] nova-core: Solve mentions of `CoherentAllocation`
 improvements [COHA]
From: "Alexandre Courbot" <acourbot@nvidia.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20251015194936.121586-1-delcastillodelarosadaniel@gmail.com>
In-Reply-To: <20251015194936.121586-1-delcastillodelarosadaniel@gmail.com>
X-ClientProxiedBy: TYCP286CA0264.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:455::15) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|MN6PR12MB8514:EE_
X-MS-Office365-Filtering-Correlation-Id: cd4bb30f-210d-40e3-b664-08de0d1d8e9f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|7416014|10070799003|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?THpQQzdFNmlTVGU5OE5UaFNhbVRqU2cvY0pYSUNVUml2Mm5rSVg0QmladHRo?=
 =?utf-8?B?U29aeEJHeEVwa0h2MHYweXA2aktZSCt6djV4cjBvTUJEV01pN2dJbkM5SFJO?=
 =?utf-8?B?Ty9kUFE2clMrR2hHVGxzOWhEMWw3ZEU0MVpNQ2x1Tlc2K21kUjZaeDBBemNU?=
 =?utf-8?B?RkpodC9kZ3JBZDUxZk52aWloUXVBeXgrOWtnQ3FEU1JFN054Q1Z4YmpqbVkz?=
 =?utf-8?B?aFlBaThtSjFjeXc5UC9WWXE3RlI2T1llcHZLYjVjVFJ6eTMzTWlZbGhnRlY0?=
 =?utf-8?B?TE9vSmJhM3kvMlpaUldZaThqMjNDRU1yMXBxMmtvRWhpMlkwcUE4ZWkvV2xU?=
 =?utf-8?B?M05US2daRTNQZU9FTm0vdHJRVEg2N05CTjlGQVo1eTlGajdQZy9VeWQ1T2pn?=
 =?utf-8?B?WHFXemhsa1k4RUFVWFp1M2p1eTBYNHVwZmRpRVhmRzM0ZUNxVmtrNlZiR0wr?=
 =?utf-8?B?V2VLMFNub1hLUWJiRmtqZzFYZ2h5NW4rT1hFTmQvNlBHV3hEN1Y5dTZ3VnhT?=
 =?utf-8?B?TUlteXJ3SXQ4SjRjNytmQklDaHNxM2hXeUhaM2JTU0Mvazh6UnpteVIzVHNW?=
 =?utf-8?B?aVBQT2JCRGpSdGJPV0tOUU9wOERwazgrTXk3eXRudjVoQldvaXZaRzcyTjNv?=
 =?utf-8?B?VWE3TmxJYUR2S2I0WTdVdXd5OUh4Y1hqZ0prUGZ1R0RXL0JLZnBMUDNaNXRO?=
 =?utf-8?B?T1NpcnNPTjVOM0xDY3g3VzUvaW1kQ1RKTDhxRktrM2R0M0VRc0p5RVBiVmJE?=
 =?utf-8?B?R0VkaU1XMWhDSDZwN0ZxNG1jOHhxR2Y1LzUzT0h1eHpyNjVwaDZqWVdvcEU2?=
 =?utf-8?B?TVNOOUp6TVp3Q0F2NTBGZEd2YklFaVB4OVZlaTZmZW1xR08rUFAxK3FrRER0?=
 =?utf-8?B?VGZYNE5zcFUxdjhaRnFpRXZYTGV5YmRIdlh2Z1l4S0lJMWIxV2JOK29NTVI3?=
 =?utf-8?B?TWNwQy9lK0x3YjF5ajBkMVRMS1ZSejFZYWlCN3RJZWVLUUNCVFVONS9tRG5o?=
 =?utf-8?B?OFY2OGV6MU03OGRkL3MvMmEvaXlDWVdDdFBPT25VdlJPa2NPMENtcEJqcHNw?=
 =?utf-8?B?eFZPMi8reHNUT3BUVDZGVm4xay9BRkJQbHRXTWNWUTZpWURLR21IZmtUOGdi?=
 =?utf-8?B?RkxmendkekNCc1pHNzBESDhSUGNCNk5CbFFDNCt6cC9zaDJYWE1tL0V3QXNY?=
 =?utf-8?B?cDNTNkpXN2g3THFwdTY1YWx1TExRbUtsbFF4NTlNTnFrVUplNnd3RXU2M2I4?=
 =?utf-8?B?b0hhb1FjS2ZvN3JnenNwa1JFNlUzdjk3ZGNzTWcxbnZHR1ZBbXdXTStNbnZM?=
 =?utf-8?B?eURPRmZ6U3RXRjBreTJkcExQQjdmamE0b3FnUlJiNGlmdFJFNDRZNlJxZ21k?=
 =?utf-8?B?UFVReGF4UVl0L2lUSTM5S1RvbllDaEF4NGpZUEY4b2IrQjRsZ2FETFhIcUZo?=
 =?utf-8?B?SkQxZkIySWUwNVdOL1VGdVg1Wk5CSUNRUDdZQ1JlNlBva1JXMGt2Yk1QSEFB?=
 =?utf-8?B?T3VNSDZOTGsxRzNSbUgzekJvUkNhT3NCSkNWc1djVlJid0N0Y3V5M2NHUk1X?=
 =?utf-8?B?aVFhclFRQ3RpK2pZNHhMUnFDOGFBTGM4Z3VmMGlUVXgvRHgxS2JpUUVKNnVh?=
 =?utf-8?B?S2ZmazBtZWVFNk5XNFZadWZGVzBRdXJYUFNCdXJTZFdPaHdVMUI5dmtZRkE2?=
 =?utf-8?B?d2ZuS3FneFdGdzJiMCtGVnExSnJKcCtoMGVXKy9Ha2lFcTFLTm5jWjB3SHYw?=
 =?utf-8?B?MlZ5RWpyMzF5OW4vSGtRcVlCbkhOV1h2T3VNSDZrQTBKdVB1b0NRQktUbWZQ?=
 =?utf-8?B?czArcHcxS0tDNWJJa0E3UDdPY3Y5ektJd1dBV1MxYXg3WUtScTRNNmdFKy9X?=
 =?utf-8?B?ckVyZ3pUQzFVV0RKN2xIM0JCZ01hZ2p3N2xYZEVHNHdmUjhCZENtQytJL0Np?=
 =?utf-8?Q?Ocplx2HJEGbB0Em09mycyujDOCAn9fUe?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7416014)(10070799003)(7053199007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UTA1SmdpMGk2UmIzR1k4eWs2SzVyWkduWnhvamp6M1drQVJCcWlSdWhXYlZ1?=
 =?utf-8?B?MnNmSGxJRThlSWZ6SFR6bXkwR0RNR25yTk5UV2lZVk5Ud3M3S05mS1BBZXlj?=
 =?utf-8?B?RmhmVEVBRG1waFVvRTVHOW56QmNYMEphZXVmRjBrWS9Gdnp1bkltcVNqQlhP?=
 =?utf-8?B?SHBFNWx3ZGhDWC8rcElEeWRCK1RhRTdyb3kwN2xwNFBYcXVtOHpzSi9iQThI?=
 =?utf-8?B?SzZzUVk3aDJ3elFEZHY2UUlTbzB0OVJDZzJsRTd6ZVlFcVBqWUNnS0loTytB?=
 =?utf-8?B?c2VjRHorTmlXWGV1N0w2U2YvKzFyY0FFcTdLUHJkQWVlUWRmS0xZZHFRRWJm?=
 =?utf-8?B?Q3VDTUVVVDZPNkdwQWdMU3hNcW9NYUllWThmQTgrTkg4YlQzWjVxZG9jRTE1?=
 =?utf-8?B?K0ZQSW56QitQT0RsTUNVS3RlOXRrMllrR2RmeXE0ZkF3aWg3Um93SGEvRGdG?=
 =?utf-8?B?UDJ4RmlhRnhxN2tPbm43UUZ1NFEwUjhpR3JuaGtUZ08rcjZod3hCR25sZ2Jw?=
 =?utf-8?B?VTZISnNvemVhQWVqVlpIdCtvR1puQ1IvTVI1amRMMG9YV2puSGtQaituNExr?=
 =?utf-8?B?VG5nK1BDbnlWY0x4ZGdVa2RTK0hHVnU2YzV3K2Y4b0RqemY4Z082MWwrTG1o?=
 =?utf-8?B?NENVZTJGSysvTTR4RkZzOTlnYUxmdjBTQWp5UWdJTjlQSmpLa2RFN2RXVDVX?=
 =?utf-8?B?LzB2bEQrcWhMdlVLOXNxZUVpemhIaFYzUS9SZkttL240RWJWN09GeVdQYnZG?=
 =?utf-8?B?c0FRYmxUSG40WHVRc0ZrVmtiVGxPNlUwYlcyZzh5TlpPOCszWTRnNjZ1Qzl5?=
 =?utf-8?B?N3VhM09xN1Q1SG5KVjN6bGlROEd0TW9wL0dFb1BnTERJUXg3SWk0cVdrZGJJ?=
 =?utf-8?B?TWg0RTdLTXgwQzFBVEViT0hLZWt6dHc5eHZacnpCRVFRYlZZcEMvV0R5c1lt?=
 =?utf-8?B?d3B6TmtHNFRaOUlHTG1mbExjb3Z5MnFyZzZjSW9mY1F2RHJPbVduMmdheXl6?=
 =?utf-8?B?elFVNFJVb1JDalN6RjBLT1greHFwcE8yTWpYVEhVZnJmUG5La1NSb1RlMmRw?=
 =?utf-8?B?RHlGQnFBMUEvNjd5MzFFeDI5QmRuTnZZbGpVSFB1VzY0U0JHaFVwUlRscE5a?=
 =?utf-8?B?QUxvcFo5T3JCMTk0TkNaT1NtUW1zdGdXODZNektQd1grZEwzUk9JSUx3UnBO?=
 =?utf-8?B?UlVGamg2RWdBdVFabUFDUUJpTVF1ZEVuRmNRNHNVY0lFUy9hbjR1OEp1enQ4?=
 =?utf-8?B?SFhQcmp3NmlYKzYxUkU3QzRqSmp0d2QyTTZRWUxDQ2xaOEtvcytqeUpVWllu?=
 =?utf-8?B?TmtTUEgyejNnczJ0UzZYNm81bERReTAyaEM3VUMrZXVXcE9sZTVpZVhteW1k?=
 =?utf-8?B?NnNETENQR2F1RWRuWjBnNnZORHlSc21Zd1N0SzY5Z2xsZGkvcEdSWGdJbUgz?=
 =?utf-8?B?azh6bGNWakgrSXZrandmZ3FpUUV2K1FKNENCRkdqb3NBWDdPeEJKRXVNOGtr?=
 =?utf-8?B?MnN1U1BPTEdLQXMrTitXckg3K2UvaWtZRVRBVHlJc0crWG0yU2MrelBBWlBt?=
 =?utf-8?B?aGxSRXFaMHZUNnNOYStUaWxlSnRMZmdKKzdaZlZDT2MzcG81NTVVbHRmM0ZV?=
 =?utf-8?B?SzhSVEEzVFJwSTEyZE0xS3R3M3VpUmVVY3FsK1doTmR5NHpDdHEyL2cxRmxC?=
 =?utf-8?B?U3J3TFJaait3cFRoUFBpRDBIZ24rakU3MHIvTnplTU5CbXlvdTJUN21hMEg0?=
 =?utf-8?B?L3RPOEFSNCt5WitSbGxJOHd0Y2dRS3VwdUlZc2I4V3E1dG9iN1hncGFuMmVX?=
 =?utf-8?B?WXNjV3lRcllnZ2dIQlNXZmMrdGRTdm9uVTdVaERCNG8xd3V6UGgwbHZMZzZ5?=
 =?utf-8?B?bnU5ZEdTUlBZTC9QTWVXcVlUaVltZW5XN2s5MjgwZXBQbFJXTWUxRGhoZVo1?=
 =?utf-8?B?UzFBRUxraGZ2ZzFLRGlsckk1RlJFUmQvZllqczlKZjlLdi9iRUljMXFmZy9F?=
 =?utf-8?B?Nm42dWl0U2lHM0k5SWNCak1NaEVyRWNVTVQ3TlpGUHNJaFdVR3hETWRSSUtU?=
 =?utf-8?B?cTdPZG42aDJrODVuYmlTcWpqSG1BMGFHbkUrVUNmb2RKd29vZC8xanI2UkNo?=
 =?utf-8?B?a1hIdW5wb0pZb3FJZmZ2eE9ndHRwUjJvNzBYdEsxVUEvT1FmdWJOWXRxV0JH?=
 =?utf-8?Q?DXpFKEDMAkVEB7im/Q+JZ8idRqQ6H7WSxiaee4OgCAiT?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cd4bb30f-210d-40e3-b664-08de0d1d8e9f
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Oct 2025 01:36:13.2639 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4cDnjSZxfjLVJw0aINTKVXWA3TQzy23Pd1YIvoD3PQneHrZQ6pkK3Z5eUcEOFTTcZol+vGsAVEbB3EwqkPsQ6w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR12MB8514
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

On Thu Oct 16, 2025 at 4:49 AM JST, Daniel del Castillo wrote:
> This patch solves the existing mentions of COHA, a task
> in the Nova task list about improving the `CoherentAllocation` API.
> I confirmed by talking to Alexandre Courbot, that the reading/writing
> methods in `CoherentAllocation` can never be safe, so
> this patch doesn't actually change `CoherentAllocation`, but rather
> tries to solve the existing references to [COHA].

This mention of background discussions should be in the comment part of
your commit (below the `---`).

>
> Signed-off-by: Daniel del Castillo <delcastillodelarosadaniel@gmail.com>
> ---
>  drivers/gpu/nova-core/dma.rs            |  20 ++---
>  drivers/gpu/nova-core/firmware/fwsec.rs | 104 ++++++++++--------------
>  2 files changed, 50 insertions(+), 74 deletions(-)
>
> diff --git a/drivers/gpu/nova-core/dma.rs b/drivers/gpu/nova-core/dma.rs
> index 94f44bcfd748..639a99cf72c4 100644
> --- a/drivers/gpu/nova-core/dma.rs
> +++ b/drivers/gpu/nova-core/dma.rs
> @@ -25,21 +25,11 @@ pub(crate) fn new(dev: &device::Device<device::Bound>=
, len: usize) -> Result<Sel
>      }
> =20
>      pub(crate) fn from_data(dev: &device::Device<device::Bound>, data: &=
[u8]) -> Result<Self> {
> -        Self::new(dev, data.len()).map(|mut dma_obj| {
> -            // TODO[COHA]: replace with `CoherentAllocation::write()` on=
ce available.
> -            // SAFETY:
> -            // - `dma_obj`'s size is at least `data.len()`.
> -            // - We have just created this object and there is no other =
user at this stage.
> -            unsafe {
> -                core::ptr::copy_nonoverlapping(
> -                    data.as_ptr(),
> -                    dma_obj.dma.start_ptr_mut(),
> -                    data.len(),
> -                );
> -            }
> -
> -            dma_obj
> -        })
> +        let mut dma_obj =3D Self::new(dev, data.len())?;
> +        // SAFETY: We have just created this object and there is no othe=
r user at this stage.
> +        unsafe { dma_obj.write(data, 0)? };
> +
> +        Ok(dma_obj)

Can you preserve the use of `map`? This removes the need for the
temporary variable.

<snip>
>  /// The FWSEC microcode, extracted from the BIOS and to be run on the GS=
P falcon.
> @@ -260,32 +245,38 @@ fn new_fwsec(dev: &Device<device::Bound>, bios: &Vb=
ios, cmd: FwsecCommand) -> Re
> =20
>          // Find the DMEM mapper section in the firmware.
>          for i in 0..hdr.entry_count as usize {
> -            let app: &FalconAppifV1 =3D
>              // SAFETY: we have exclusive access to `dma_object`.
> -            unsafe {
> +            let app: &FalconAppifV1 =3D unsafe {
>                  transmute(
>                      &dma_object,
> -                    hdr_offset + hdr.header_size as usize + i * hdr.entr=
y_size as usize
> +                    hdr_offset + hdr.header_size as usize + i * hdr.entr=
y_size as usize,
>                  )
>              }?;
> =20
>              if app.id !=3D NVFW_FALCON_APPIF_ID_DMEMMAPPER {
>                  continue;
>              }
> +            let dmem_base =3D app.dmem_base;
> =20
>              // SAFETY: we have exclusive access to `dma_object`.
>              let dmem_mapper: &mut FalconAppifDmemmapperV3 =3D unsafe {
> -                transmute_mut(
> -                    &mut dma_object,
> -                    (desc.imem_load_size + app.dmem_base) as usize,
> -                )
> +                transmute_mut(&mut dma_object, (desc.imem_load_size + dm=
em_base) as usize)
>              }?;
> =20
> +            dmem_mapper.init_cmd =3D match cmd {
> +                FwsecCommand::Frts {
> +                    frts_addr: _,
> +                    frts_size: _,

Can the `{ .. }` syntax be used here?

> +                } =3D> NVFW_FALCON_APPIF_DMEMMAPPER_CMD_FRTS,
> +                FwsecCommand::Sb =3D> NVFW_FALCON_APPIF_DMEMMAPPER_CMD_S=
B,
> +            };
> +            let cmd_in_buffer_offset =3D dmem_mapper.cmd_in_buffer_offse=
t;
> +
>              // SAFETY: we have exclusive access to `dma_object`.
>              let frts_cmd: &mut FrtsCmd =3D unsafe {
>                  transmute_mut(
>                      &mut dma_object,
> -                    (desc.imem_load_size + dmem_mapper.cmd_in_buffer_off=
set) as usize,
> +                    (desc.imem_load_size + cmd_in_buffer_offset) as usiz=
e,
>                  )
>              }?;
> =20
> @@ -296,24 +287,19 @@ fn new_fwsec(dev: &Device<device::Bound>, bios: &Vb=
ios, cmd: FwsecCommand) -> Re
>                  size: 0,
>                  flags: 2,
>              };
> -
> -            dmem_mapper.init_cmd =3D match cmd {
> -                FwsecCommand::Frts {
> -                    frts_addr,
> -                    frts_size,
> -                } =3D> {
> -                    frts_cmd.frts_region =3D FrtsRegion {
> -                        ver: 1,
> -                        hdr: size_of::<FrtsRegion>() as u32,
> -                        addr: (frts_addr >> 12) as u32,
> -                        size: (frts_size >> 12) as u32,
> -                        ftype: NVFW_FRTS_CMD_REGION_TYPE_FB,
> -                    };
> -
> -                    NVFW_FALCON_APPIF_DMEMMAPPER_CMD_FRTS
> -                }
> -                FwsecCommand::Sb =3D> NVFW_FALCON_APPIF_DMEMMAPPER_CMD_S=
B,
> -            };
> +            if let FwsecCommand::Frts {
> +                frts_addr,
> +                frts_size,
> +            } =3D cmd
> +            {
> +                frts_cmd.frts_region =3D FrtsRegion {
> +                    ver: 1,
> +                    hdr: size_of::<FrtsRegion>() as u32,
> +                    addr: (frts_addr >> 12) as u32,
> +                    size: (frts_size >> 12) as u32,
> +                    ftype: NVFW_FRTS_CMD_REGION_TYPE_FB,
> +                };
> +            }

I liked that the original code updated both `init_cmd` and `frts_region`
in the same match block. I understand it might be difficult to preserve
due to the borrowing rules, but can you try to preserve it if that's
possible at all?
