Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A1703BF4190
	for <lists+dri-devel@lfdr.de>; Tue, 21 Oct 2025 02:05:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A43710E542;
	Tue, 21 Oct 2025 00:05:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="iJ1g1Cuv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PH0PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11011061.outbound.protection.outlook.com [40.107.208.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6FDFA10E542;
 Tue, 21 Oct 2025 00:05:09 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LJ4dXLsBk3bU87WT9zK7H4wWrtVqbix0KqNGLAicTlSeb3Vi9qdzdOS+f5tkqp2wRoBLF6jaMe487Jhtd11tDFuKGvG0FwpwrEDIIN8rZFWMi2W5Vce1kgqK5mjTy5xjc/czgL6GwWcoFU/FPbOHDXussR+V2pId8n1rhwVHoNBGIOzLpmPawbjNGBIbIi6aVOQ2aIzFuaFhszH1HqXsBR7gHFfPT8EDbpSu2dd921vyGrJlKBSvu6H6pExue/dhX124pco+/SYnV4mxJpHD0Dzkza4TF9J4oQxUwe2kfP8FsxrnHrkbq2yvRTnJ4zqnyy1UEBnSElYdtJ2wJZ6kXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lUXl4GW31GzPp3bFwVgeVL1rXqIvsfom+0nDhuU1KBE=;
 b=KKVQCE/nCjWB+4fYTDvZGulnB/AHfgQ3TTSmMNbgCjgU4nZ1mTV9CHo3zkDApx1lvShI9lN5RuZ7QPd4N391LBxtfvw/elpF1x9+4ztVyC0JGtUPJg3ivuE8UUNwZxCwhcwD9XVjehW4ZwhnUvFs+Kip7LqYqiLuF0or81Hp7WzKFECLiq0bXfzjoRU2aJjmWt7lV57WWn5eDvnadZmZWYSvwIArfGKqYeDFWc2DrzY/SwzaRckH5Jhu29nXkbpG/A9phvzfVvz/bs0amAIteiFrleEim/DtN1t6zh0Ms+lRGX9FxcbCWOsO0q3AMfdvpfd8fX/DWfoNQOR2tU7xWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lUXl4GW31GzPp3bFwVgeVL1rXqIvsfom+0nDhuU1KBE=;
 b=iJ1g1Cuvx2eJ6TA5blxxWEVgqLYYexF16gB3z0zR42Pe3iQFmQBiwE4qtFsG7omRCKuuRMLgtqZeWkfR8Iay1GGmyQulak1zW5pmM9g4VFWmEoC2v6gRS0yfKW5D0tlxHUyOWMYGsj7kzs/YMfNKqE3bCwkTcfZ5AQjb+MJSlSwEwtntNErFjqC0IzrLP9ZUtNXwibyIXpDD9lkDvzk2w3Vibz68wyE/IA9wkab3phbDwyvtFYgalU10DQq3h+vdi1LVByW9O7Safr/u7C3AebzDLzy+E+xPMD/RCkC9x6WpuS5NKH60dR9r52NyYxkY+g6paWn14VpJ4rpz3BVV7A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BY5PR12MB4116.namprd12.prod.outlook.com (2603:10b6:a03:210::13)
 by CYYPR12MB8940.namprd12.prod.outlook.com (2603:10b6:930:bd::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.10; Tue, 21 Oct
 2025 00:05:04 +0000
Received: from BY5PR12MB4116.namprd12.prod.outlook.com
 ([fe80::81b6:1af8:921b:3fb4]) by BY5PR12MB4116.namprd12.prod.outlook.com
 ([fe80::81b6:1af8:921b:3fb4%4]) with mapi id 15.20.9228.015; Tue, 21 Oct 2025
 00:05:03 +0000
Message-ID: <da74ab79-2b35-4e64-8032-5c14be5ea089@nvidia.com>
Date: Mon, 20 Oct 2025 17:04:58 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7.1 2/4] gpu: nova-core: bitfield: Move bitfield-specific
 code from register! into new macro
To: Danilo Krummrich <dakr@kernel.org>
Cc: Joel Fernandes <joelagnelf@nvidia.com>, Yury Norov <yury.norov@gmail.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "rust-for-linux@vger.kernel.org" <rust-for-linux@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Alexandre Courbot <acourbot@nvidia.com>, Alistair Popple
 <apopple@nvidia.com>, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>,
 "bjorn3_gh@protonmail.com" <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Timur Tabi <ttabi@nvidia.com>,
 "joel@joelfernandes.org" <joel@joelfernandes.org>,
 Elle Rhumsaa <elle@weathered-steel.dev>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 Edwin Peer <epeer@nvidia.com>
References: <20251016151323.1201196-1-joelagnelf@nvidia.com>
 <20251016151323.1201196-3-joelagnelf@nvidia.com> <aPEv_UO4vViOcOvN@yury>
 <2CF462DB-D2C8-473F-9D70-522E6AFEDCE4@nvidia.com>
 <DDJZY40SO5EF.2066SEKKQ4U8I@kernel.org>
 <e4f5ca12-bf67-4b48-97a1-7ab2c771056e@nvidia.com>
 <aa3b4ebf-12c9-4ffd-bfd9-bcd920970309@nvidia.com>
 <DDNIZMOBCE1Z.1ZOQ83TKTHQ28@kernel.org>
 <0e592a2d-6c0a-4dab-b16c-ff994917af9a@nvidia.com>
 <DDNJB4SLN8A4.O0L8NH8IWXSO@kernel.org>
Content-Language: en-US
From: John Hubbard <jhubbard@nvidia.com>
In-Reply-To: <DDNJB4SLN8A4.O0L8NH8IWXSO@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR03CA0023.namprd03.prod.outlook.com
 (2603:10b6:a03:33a::28) To BY5PR12MB4116.namprd12.prod.outlook.com
 (2603:10b6:a03:210::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR12MB4116:EE_|CYYPR12MB8940:EE_
X-MS-Office365-Filtering-Correlation-Id: 56555702-bc1b-471c-6aee-08de10357c3e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7416014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NEJ3RkFJemRMR3pXMDFpd3E3SFZpZXI1bVlJQUt1eGNNckN1ZTRQbGQ0S3Jn?=
 =?utf-8?B?emRWVjlzK3lDU01tSm9ZNTM1cGhSQnRJdFZlbk81TWd0UGVpditRNzBYY29v?=
 =?utf-8?B?NGxZUExERWdNcWNQcDJXTWJIUzkyZVFYQ2pETnJsOS9NMHkxa0hGY3BUMlRN?=
 =?utf-8?B?T24vMVgxZ2NKVERMTHhEM0tLdE8veGw2S2xRK3BSSDl6UnFGZHUwTUVTd3My?=
 =?utf-8?B?bWMyU01sczZVWnlGUHk4MWRLVzVSV3lJQnVQQlhaQ0x3OVRtWTNsaDE3NFdO?=
 =?utf-8?B?WjdUbFhPZjVIZ1pDcjl2TTFjaW5DVWVSUUhhMzBYbmV1eGpQK1pTQ3huYnhu?=
 =?utf-8?B?UE9Mc0NIdHVyU0NENVRqT3JVdXB3b1JncWFQODdlUjliQ1pWbUVwYmx5bHpI?=
 =?utf-8?B?TVVROTY4R2cvVUs4NmRSS3pyRDJ6K1E1Mi8rMi80VUVFd1dYMTZOK3NObW5r?=
 =?utf-8?B?UEFJcEtkRXZEdnJSOXhlRWJtemNrMjExdzFuL20vU2wvYWtWb1cwNTlRdEtY?=
 =?utf-8?B?WU84VkxuY2MwZkFtNVIxMnAyRm5GWktqRDc0Z0RPU2U3anU1bTErc0lOOFhN?=
 =?utf-8?B?VmZITzhEOHJPYzlhU1VDYXFBK3ViQms0MlJUMnE1TXdINko1N0hGN01QVGtx?=
 =?utf-8?B?WFRJVEsxSEUvQWptRmR5aWZyOVRXVnFFbDdMaUtwYnZ0V2dreFRJc29sRFNN?=
 =?utf-8?B?ZkRlcm16VmVPaCt3a3hpUG1pa1p0UGU1UktvNlFsMHViVzZaNUJtQUs4Uk95?=
 =?utf-8?B?a0NDamRacGV6MUFWUXVvVjJMUHVBREpxT2ltMlplZjRDb2tjNWM3NjVpenRi?=
 =?utf-8?B?SlVvNG92cnhVdVd5RlRvaGw3Uk8vS2xsbmI3WHhjcU9hdWhQb28yUUt0SnU2?=
 =?utf-8?B?ckJzTkt2dnNtWGVnTzFlSC9YWUdUSGVqNFZ4ajdMVG1XMnd1cGJRZzVtcXpD?=
 =?utf-8?B?V2F5VTFScU13RUl2ejlBSmtXMHN0SFFqbllSaHVBWlRyRkdDZk5ZRmdBY0wy?=
 =?utf-8?B?MkticUR2Y213ZXBESGNEdU80QzgzT25PUUdjanliV1YvTVRtQ3JIN0RVd21S?=
 =?utf-8?B?c3lKRjh5SFJsSXZCV3N4YldKS1RGK1FGNjhlVjhONGVxc2Z5Y1JqU1ZyL0Rq?=
 =?utf-8?B?TE1KZE5yNkllVFRheXdteVJGSnNEVHJYb2FSY2tOdlBRdXV4MUlGT1JUYi9T?=
 =?utf-8?B?MEwrVVFIc05temNNbXJydzcvT29OUkdGNytMYUNTRjlSVTl4YnY3YUMxY3po?=
 =?utf-8?B?b3ZtR3ZnbWFaaEVaWWlSNXNib3M1NUQxbUQ1QXZ5bDdSWVZoUmJtS3piUjNB?=
 =?utf-8?B?SStYNU11amllNnEySDVjZmZsbVJFTHlIbkV3MUNEMUw4RlVGbUJvbGlpbCth?=
 =?utf-8?B?bnE0em1MSHhLS0ltSzRhODgwRkJSTFBsZjRHY3prQVozSWZIWDNTRHRIRGln?=
 =?utf-8?B?UUFUVkpHMUJkUXZqUkNIdTZ2SExhVUowcWhQbksyYUYrNWsxUXpXNDNxS1dV?=
 =?utf-8?B?OTR1RTNXNDk4RkFROXhaUGN3ZCt5Z2VhYTE4MHhwVzBVR1FxT2N0VWZjdUEr?=
 =?utf-8?B?c0RvQUFEMTJWQ3FteitVbGVtMmhDSmdWampMNHE5U2hHUlpmUC9sL0FUYjRL?=
 =?utf-8?B?SHQrbDk5K2RJKzJDenFjbzcwamFlL1A5YlRYZ0VBRUMvVG12SkN6ZHZpKzJo?=
 =?utf-8?B?dEc1QnFaTTJ5YTNadXB2MTFYL04rMlJiK3VjNEkyUFVDNzBsZnozSnI3RlF0?=
 =?utf-8?B?ZXZqdG1oaElXemVuNkxxQnEySUNxNCtEU3N0NVR6cUpPNDZrQU13L1I3M1lV?=
 =?utf-8?B?WDRZUjAxVWZtaXJMTlcrNlJYMk5DRFlkT1doTEtzNDhpUXBZLzhHMnQxZEJP?=
 =?utf-8?B?QXN4RWRBS0dMTnlWR1hpV3BUTGIwdjF3blJpcFFMRTROSU45dGVNeGp6bnA1?=
 =?utf-8?B?c3dxOEFDZUtmQm51Z2loQ3FIU09hcXBsMWFhNzVVQXdyc084a29VSE9qeHdF?=
 =?utf-8?B?cGNscFZWN2hnPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR12MB4116.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7416014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VGR3Y1hLVE5aZ2V0TE05dFBHdWwvNmMzQ1pYSk9xU2J1MTd5ODJKVERIWDZI?=
 =?utf-8?B?R0VlRVhyV0FRd3h0Q3hIK1BDZzh3VTJGVWRtQjFoc0VZRFFnZVhETUpLNE9C?=
 =?utf-8?B?SWRocjFNcVdJUnRHWlprQUM4S1BINUtWRjBmNGdIRCtGMm12OGR2SzlkVW51?=
 =?utf-8?B?WUExb3RCWU9XTkdEeUtqbVh2U3VEa1ZqWUlVWlNmSVpldnFkamZDWjYydTAr?=
 =?utf-8?B?QmI5NWd5MWNEUzF0eVMzTGYwU0Rna3N1S3ZieVlpcUc3WkYvK2N0d3VmOE55?=
 =?utf-8?B?MWNFYXZWSWs2b2ZrN1drOTVpd0dacEpUNTRaR3NmOHB4Rk00dlJPY0Z4Z3Vj?=
 =?utf-8?B?NWxaZ0h1bDhJRFFYa2N6ekU3clhyeUs2TnlpUEcxOG1FZG5ic2c5MHBna3VU?=
 =?utf-8?B?d3dleUg4NFpCS0VhaGpiRW9SK0Y5NVNYcXFYVFBNNk9vSFYyNnlYQ0hMTnR6?=
 =?utf-8?B?Q2NjVlQxVXY1Z1dpbHBKWnJ1TzQxOWx3KzUvQ1h4dGZzRFh0Zmt2ODN3Y3VL?=
 =?utf-8?B?MUFyNHZ1Ri84QzgxeStEVkpPRWQ2Z0JoTHpQdnowZkdYdXVwVEhXRnZqNjY2?=
 =?utf-8?B?UEo3MXBLMCtIMVNaMm9XR21qcXFnT1NGVjlyZXBHd2FRL1p2T2VsTHpTdWI1?=
 =?utf-8?B?M3lObTN6TERCR1NLRTUra0lsMmhjZldRSTBlQ0lwZ09sY2U0a0NTR0oxRjNL?=
 =?utf-8?B?Tkt2bXpuWWNZTVgycFVjdzlEUWUxbmNPK0JKVXFISnB5NjhacjlaR2dVb3dM?=
 =?utf-8?B?VVhxT3VOeFFTTm1TM2doOGhYREdKYks2TVo1QVNPMzZRRUViSkpKSkdVcXQ2?=
 =?utf-8?B?b3BoWWVBTkRTRU9kR25sM09nN1RRMmJ1bHRHVldiN21JZExwa0tKM3dpcFI1?=
 =?utf-8?B?eFZSUFJpZ0RhbStmQllVSXRxSkEvU2RIcGZEWlVuUUVwVXBIRUVNR1J3alRk?=
 =?utf-8?B?Ti9xMEFBSFRxRUs2VElEWDJOdDJqUXQxZ1d6VlJQS0E4WWs0VlU2SEhqZkNI?=
 =?utf-8?B?alVZZ3R0S1ZWRTFWMTZPcHpaejlQTklHVXNIckdzSllBbEZNaFVTVHlOZVVY?=
 =?utf-8?B?Rno3bmx0MmdpdUZuSmZFMjlGNTJudWNNVTYxMWttcThaMkhTbGpQakZwcXY3?=
 =?utf-8?B?elFWRHd3NWk0NElrVWFQWXFuZE9yMkUvaHlpb0ZwV0kyZXoyY01OSlZscG9N?=
 =?utf-8?B?MXllVWVzMGFNTVFDdHJOeXhjUWF5YTFhM2hGNlNOL3IwMUc3cFN6WlE0RnVy?=
 =?utf-8?B?ODNiYWQ5d05nMHJjaFRCajVQVlpPdUFiRnQzaEpuUU04MUxWOXg2SVVobDd4?=
 =?utf-8?B?eEFRSWZ1bmxwMlc4aEZOYkIvTlJlMm5NMHI4WE9CUDczd1NrcmpSck9hVVh2?=
 =?utf-8?B?ejB2ZXhuZllVMi9BQXJrNzZhNnBZa0ZaSFg0TlJqQSttYmxkZnhvWDhCcDlI?=
 =?utf-8?B?VHZEZWhrcmpxYjVoM09jZ0VIRDduT0kvM0lyMmJIaUw5cEJRTXBwMm9xdUpn?=
 =?utf-8?B?RXk4TThvOHovTEJvTzYvb2sxejIrUHN3M0dQNUVQUTh2NmNlWWYwSDkyNlB2?=
 =?utf-8?B?VE0yMDJVcEJWOGdueE14SU1aSjdNNmRLenJTRTJydzd2QkVMY0tyRVlUUlVt?=
 =?utf-8?B?UGhVaXFqQ2xjZDdMZ2dRQXpCQzRoditnelNnMFVlSGVuSFJCN1JnaTMxNnYy?=
 =?utf-8?B?YjlnK2NZTFVCRWV4dDUxUTYyWGg3SVZhdTVKYnpuRGt5aGxWcDNQejBHblZW?=
 =?utf-8?B?cWdoSWlFbThUZnRCWjBQRWRmMVp4NmdGMDVaa2ttZ2kraWNiYjFsSzNYTzMw?=
 =?utf-8?B?WE9VQ1hQOThCUlRMQ2dyazVqM25ORk1IdWVyelVsbEhtL1RvTU5BSFQ0OTE2?=
 =?utf-8?B?b1F2VFVRQzF1b2pOZVcvbzg1RzdrRWhGMlU5bFhlcENZUE9pQ2J5QnR3OHQ2?=
 =?utf-8?B?TEN3NHVSazRjdnBVdmFUcFdpNUFOM1dDdkF5eGtQc2pHNXVqZmxHVndoMEMr?=
 =?utf-8?B?emQ5KytURS8yclZiTVZmZlJzclc4NkVSc2VETVMxaXRKWUR4VmJIU0JXYzlO?=
 =?utf-8?B?MCtXQVBLVUltZ21PY1VnTndFSmxsRDhuL0xvcWNFWS9JdEQyK1dQVnZPd0Nk?=
 =?utf-8?Q?jErXrvS3mDiPmmfGZuTm5vWJl?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 56555702-bc1b-471c-6aee-08de10357c3e
X-MS-Exchange-CrossTenant-AuthSource: BY5PR12MB4116.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Oct 2025 00:05:03.8546 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qUVUSGL5gY+OMYNTBjR9qakGXy5xxm/MvZtpoeD0mZuoj+IPUIOThSzFlhtPP5j65APbhx2iRR74YTi1K5JPpg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR12MB8940
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

On 10/20/25 4:22 PM, Danilo Krummrich wrote:
> On Tue Oct 21, 2025 at 1:16 AM CEST, John Hubbard wrote:
>> On 10/20/25 4:07 PM, Danilo Krummrich wrote:
>>> On Tue Oct 21, 2025 at 12:50 AM CEST, John Hubbard wrote:
>>>> On 10/16/25 12:39 PM, John Hubbard wrote:
>>>>> On 10/16/25 12:34 PM, Danilo Krummrich wrote:
>>>>>> On Thu Oct 16, 2025 at 9:28 PM CEST, Joel Fernandes wrote:
>>>>>>>> On Oct 16, 2025, at 1:48 PM, Yury Norov <yury.norov@gmail.com> wrote:
>>>>>>>> ﻿On Thu, Oct 16, 2025 at 11:13:21AM -0400, Joel Fernandes wrote:
>>>>> ...
>>> But that's OpenRM specific, I'm pretty sure when you look at internal datasheets
>>> and TRMs you will find hi:lo with decending order, for instance [3] page 1672
>>
>> TRM is Tegra. This is gradually going away, from our point of view, as
>> the larger, older RM (Open RM) driver subsumes things.
>>
>> Open RM follows the main dGPU ref manuals, and we have piles of those
>> and they all apply to Nova.
>>
>> None of the TRM stuff applies to Nova.
> 
> My point is less about NVIDIA TRMs, it's about that this is uncommon in general,
> OpenRM is the one being special here.
> 
> So, the question for me is do we care more about consistency throughout the
> kernel, or do we care about consistency between a driver and it's uncommon
> reference manual.

Yes, I think that is the key point.

> 
> I think consistency throughout the kernel is more important.
> 

Perhaps, but may I point out that there are countless thousands of lines
of HW ref manuals to deal with? GPUs are uncommonly complicated devices,
and I've spent a lot of time in this area, being awed at the sheer volume
of HW documentation.

And there are hundreds of engineers who today work on GSP and Open RM,
some of whom I expect to eventually end up working on Nova.

So looking ahead, I'd be much more comfortable saying something like
this:

"Nova and its associated GPU HW manuals are special snowflakes that
use a particular documenation style. We'll allow them to deviate from
other kernel conventions in this area."

Yes? Please? :)


thanks,
-- 
John Hubbard


>>> (clicked a random location in the scroll bar. :).
>>>
>>> Besides, I think that hi:lo with ascending order is confusing. It should either
>>> be hi:lo decending or lo:hi ascending.
>>>
>>> For registers the common one is the former.
>>>
>>>> [1] https://lore.kernel.org/20251020185539.49986-1-joelagnelf@nvidia.com
>>>> [2] https://github.com/NVIDIA/open-gpu-doc/blob/master/manuals/ampere/ga102/dev_ce.ref.txt
>>> [3] https://developer.nvidia.com/downloads/orin-series-soc-technical-reference-manual/
> 
