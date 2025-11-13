Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 90158C5506C
	for <lists+dri-devel@lfdr.de>; Thu, 13 Nov 2025 01:49:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CCFDD10E1AD;
	Thu, 13 Nov 2025 00:49:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="fH1EuR1i";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CY7PR03CU001.outbound.protection.outlook.com
 (mail-westcentralusazon11010057.outbound.protection.outlook.com
 [40.93.198.57])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D0F910E1AD;
 Thu, 13 Nov 2025 00:49:17 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=naUm1/1EMIYxo/bWrv7FZAZNazVaq3bB8j37GT6De5eZxDqVd3VIbj/wX0U/JzhEGTzE0/KSjNUXr4Hdy24P/eyX6DZuH9h63QzQKZ5T9n4VG97Oo9RNKkCwuKzbdtJaF+3ySEDcmaSZcpgFi7317EHooomaMTr8lHKi8ntb/YB+q7kEOhpI6schpeloWkjtxm6FABtnVKTLl9FoYlDRDp0KvDR05Eu2QA/9n5vpf+udr1J5E9AN3BnV+f49UDSkIOLzCZWfRU8hCEjzrB9RcBkYjxsTpqhIZ5JzaPLdN/HU9SAqEh1yR/F49qwJRVHzrEnZw6lAnC/VBu0DN5C5Yw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zbIK7QYhH5NTzRze6DVSCNxsuh1ls0p8hcss8D2+lGg=;
 b=F+XI1OC9G1KTy0VYomD/G+qy8vxdMMH34e89sT3m3QNaa4rh3Wv+KTWBUnSeoN90OA5iHqGN6X5MYV9VM9Z6wZQT7sJ7xFO4Eu5PJKQNBcflExbnmb+VWm7yolYYTkY/++z96pVKIJYpfLiH501NHHWeam2LRL/zpqo+2CutP5Gw5nROhAquLmXgtZZ2oxcqQRQeAyaMm1Tt6E98s4xXpMwXtGbV6oIxrNG8KuC/wqCC++NFS9E75MZI6/QRoAPH9qmN6HnBgcSncaqgaQpFwlVH691CYm0dyGRu23ginnSrfVk8bq6tVjUQaZwHiKmBP3NSrAWhnWYUPMLZ/qgoPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zbIK7QYhH5NTzRze6DVSCNxsuh1ls0p8hcss8D2+lGg=;
 b=fH1EuR1iaI+Ce83Ug3EkBtFDma+D5ny/zvjwUS4ECsac1tinyUD24MxbVkdHU5ykv6OZtH0zRcBsUxN68o2sthxuMqQFUo99yLhfMr5SbkI5nyqxR75RGN3BbZKNSkH/oJyl/3YhSE21nPeXi1dxJL5XcNlutaZXh+XV9cprIUAOZNPpstdXqB0n2RjuxyPW4HT1MgrMkthWr+6JSXlw5ViGDm3GDpOu97n6cz7byMXRIHRy77oRUlTpnuB0IotamYXyEjKtgwmxEstG0Tanam3LOI2KDLfB8f2jILw7rGwymbD+UL/x5Uk88QMzGrCqAoCuqPk6U3YFqv4/kqKp9w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SN7PR12MB8059.namprd12.prod.outlook.com (2603:10b6:806:32b::7)
 by DS0PR12MB8218.namprd12.prod.outlook.com (2603:10b6:8:f2::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.15; Thu, 13 Nov
 2025 00:49:13 +0000
Received: from SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91]) by SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91%2]) with mapi id 15.20.9298.015; Thu, 13 Nov 2025
 00:49:13 +0000
Message-ID: <e909920d-904d-4527-bb7a-af1075b91bbf@nvidia.com>
Date: Wed, 12 Nov 2025 19:49:10 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 10/14] gpu: nova-core: sequencer: Implement basic core
 operations
To: Lyude Paul <lyude@redhat.com>, linux-kernel@vger.kernel.org,
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
 John Hubbard <jhubbard@nvidia.com>, Timur Tabi <ttabi@nvidia.com>,
 joel@joelfernandes.org, Daniel Almeida <daniel.almeida@collabora.com>,
 nouveau@lists.freedesktop.org
References: <3b0d776e50fc81797dec2e5d81c86390af78f848.camel@nvidia.com>
 <20251106231153.2925637-1-joelagnelf@nvidia.com>
 <20251106231153.2925637-11-joelagnelf@nvidia.com>
 <0dc481db44675ebf7801f424d7e4c2cb44f25723.camel@redhat.com>
Content-Language: en-US
From: Joel Fernandes <joelagnelf@nvidia.com>
In-Reply-To: <0dc481db44675ebf7801f424d7e4c2cb44f25723.camel@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BLAPR03CA0146.namprd03.prod.outlook.com
 (2603:10b6:208:32e::31) To SN7PR12MB8059.namprd12.prod.outlook.com
 (2603:10b6:806:32b::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR12MB8059:EE_|DS0PR12MB8218:EE_
X-MS-Office365-Filtering-Correlation-Id: 5dd25825-06da-40e3-db23-08de224e7723
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|7416014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TUlvaW5lOHp1d3pYbHkxMk1UcnhIdXM1bjdMN3c0NDA3RFFqUk1TdC81RnVS?=
 =?utf-8?B?cnNwVW5VVXRlT2V5dTJUSlRiemFBNk1oam93Yi9QTDRoaXBHeE1PbkZFUEM5?=
 =?utf-8?B?NU5jV3Y2cUo4K2RkWnBXTWpXVTRoNHl1ajNESkhYT01XM3NSL0J0M2lBMGlW?=
 =?utf-8?B?UlBUYnNhQnFYS2pRTFJ5YllUalNVRVFsNlBsb1BsMUJaeG9HeVgxeDVSRjEx?=
 =?utf-8?B?cXQyS0F4U3ZjMXdBUmFVMFFlcFdNbWtrMXd0UHQzT21OUW1FKzBZanJXWXNt?=
 =?utf-8?B?QTdVMUVKaGVHS0YzU3dzT0lEdVVlRW00bGlaYU9sTW82Mi9pSnNZWmQ1V0li?=
 =?utf-8?B?ZHFrQkZEMlFJa0pSVjRScnZFY0lYYitnbEN2TGxTaTBJUXNISy9DWmdpYkxt?=
 =?utf-8?B?SHNoMkdkRHBzVFp4QlJ4WWhESUcvQ0l2QzZJemM1Ly82T1duazVDNHMzam9E?=
 =?utf-8?B?eU5ZNXRqMVBBa3prZ01sTmx2dGgxVkp4bzhZalo2cUp3OFlVa2o5MHFBRThH?=
 =?utf-8?B?cGI3T2VMd2p4NC9UNWcxMnJPN1BRZWZhQVROd3VkclVWdjg0V0tDNXNUL2h5?=
 =?utf-8?B?ZUJVNDRocWZ4WkNkd2JwMXJDeGhqU2syZ29NS0dRcVhtY0VIWittNU1idC8z?=
 =?utf-8?B?akFscVNtL2RKMkpCd0k5RjMrVmNjTm5tdk4zUkEvczBmNVlXRmFFYWZJTXZo?=
 =?utf-8?B?Y2tPRW1wdExwcGVYV0ptalJyV0plaXE0WVVYdERHT0wxWnEybnkxbmdocUNi?=
 =?utf-8?B?WGJoWENNVjJSV2pxVTlZV3cxdjdWVlY3NDJjdmlqcmhPd1VOTjZ3MHJEdVdv?=
 =?utf-8?B?WGUvMnFaZHVNc3oveXJ3dlpxdFJzQzZOWm9PaXUyN2J2UVNReVE0M2NiaGQr?=
 =?utf-8?B?Y21pMDJpdXpJbFNFNGc0WEN1aDBYWXFlOUgzSHYxazBodWNPRHEyV1BmWFZI?=
 =?utf-8?B?cm1HRm9RQVhROHM0alE2M0JGL0tqUE1zMllGZnZnamF1RGp0S1BsQUkwRy9N?=
 =?utf-8?B?b3R1YitmYStyQ242Sk9zb3lHWUc3REIxS1cvM1R2Q0s1cW9PcVFQdGVRaS9X?=
 =?utf-8?B?V3Y5dUpxTzBSaFpIaGw5a2xXanVGN1J0a2JMZk1iYnVTSGU2OXhFVFpmWUo1?=
 =?utf-8?B?N3ZKVlRlRnZRVHNVQ2MxZkF0a0ZURThYU3UxS0VncGVrSzBmamhvOE5aN2Ft?=
 =?utf-8?B?Q1RnZStrNUpDTm1WdzhBbHFPRnF0NGVqcHkvSWJFaGdFU2pVTmczM2FWNkdi?=
 =?utf-8?B?VXJmcDFwN1Exekx5YmtCaTMzMDY5enlyYVBwNUJMM2huT1pNejlJNmxmcTA3?=
 =?utf-8?B?K05hc0hhWHE2SnljMkE4bkJqRWloZjlxTHV3TWg0ZlJINUJ1M1Vpc21wRG1v?=
 =?utf-8?B?b1pVM2Z2cUh4MzlxaFZZNGRwa3cvVEdmcGViMnZFRXVjeFp5QjhLSVBjcks4?=
 =?utf-8?B?QU8yVks1bTlLMEhEM3pkdXVOWFliUGV0VFFacmxvbk1tT0hjdDV6NXIybW5j?=
 =?utf-8?B?eWJLZzBjNFVLdkpTSUxyOVg3RDFwdHFjOGo1dkVhbzNZNjZxNG9qenZhazVO?=
 =?utf-8?B?UURRNXJRVkxQbkJ2SFNQM1VwbWNERzU0eS9LcjVKMCszbVlnbHc1bmhQTHJx?=
 =?utf-8?B?YXE2NUpiZlNCcXA3a1NoaXNMK01keXZydytRQnNBbDNRbFRXSWg2aVU5OEFY?=
 =?utf-8?B?SEEzNWxES01uTWo0WDFIT1Z3VmppT29FaStQaHJjN2xSa2dxemI0K3lGRURN?=
 =?utf-8?B?SVJ0MHVKOUxnMDBxT0JpcU53cjJOQ0tVejlFUlMzanlsZzJ3NXJMbEpJenJj?=
 =?utf-8?B?bTVoTC9XMUdBZTNCQndjWDliZlRZV3c2S0xaaDJOMXhvM0tCcmt4bUluRmZB?=
 =?utf-8?B?ek5HV1ltU0tBZFlTMTg3USswNXU2OVVMQXZacjJsKzNPV2NreXR2NHRVWS9N?=
 =?utf-8?Q?kMhFjB/MYQNUklBxBPtfBty2YhWLQiS6?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR12MB8059.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(7416014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OHhDSno1dFZNUnpjVmd0SUZIUnZWWjUyMDVpbXI1VjV3TWxHZzNOTzdXMXB3?=
 =?utf-8?B?SEFjeUd5Q0RMY21rT1RSOCtMWW5udXpyVVFTcHFXdnNwcHd0Nkhsb0ZQK3Z1?=
 =?utf-8?B?eldHbTduUUdGcW05Mm1GTHFLSTdMeFFqeUNFc1Yva0c4a3NVK1dNOGFEUytY?=
 =?utf-8?B?RHY1UnMzWGhsclc4WlhsVkIzM1ZkdDB3eXV6ZDl1dUh0Qzl4TURNSDV2UXZM?=
 =?utf-8?B?Slo0MmNaYTExeVNrckhkRUVFNXlETTNsbFp2c0VkWlVieVo2YVRoajFtaWVW?=
 =?utf-8?B?YVl0amhTd0pySGVmUmIrY3BPR3RNazJxdGxNUzZyaG1pSksxMytTZWMzaU1O?=
 =?utf-8?B?dWh5bWtCaUpNSXpQbXZMYzQzM2lIR0ovV21SZU9QQ0R2NXFzaEtUS3RWUytx?=
 =?utf-8?B?WG1QL1ZEa0hwVzJVYkRpVnhxWE5DM2ZrbVkwMXdzemJydVFuRmZ6b0RaSm5i?=
 =?utf-8?B?OEVUV3NCYml1MHZObnhBWHF1eFBxUVlwRVNpN1NpemVxL0YrdDZrT255QWpC?=
 =?utf-8?B?OFdTWTVkcDFjM1NmV0xBUEtXMDB1cUNYR2pvdHNiaW9SdzM4NnVFUENOQTFo?=
 =?utf-8?B?MnkzQXh3UWtzMHlBcnV4dHl4dUF3ZWxZRFVvVC8zZjJSNEh5WEkzc0tjbmJT?=
 =?utf-8?B?STlaZ2o3enZiNjhaMHpvekFGc2l4RzNjenZjS3pCbU5BOWpGUUN2L09US1VY?=
 =?utf-8?B?dHhsbmM5ZFl4bmlFUzI2M01VWGRXdmN0TEI1K1ZqekU5dlhCZnlTYXhoYXpj?=
 =?utf-8?B?VFFNcXVJeHNoa1dqZTduN3lMVVo3QVRpVWVSc2tTeldubTQrTHVNN1ZUSGdP?=
 =?utf-8?B?ODBOVlRSeVdVQWYrUzd1UmxmakdNNHVIRDhPWXZpY3FKU1o0cVNIdDVaejhM?=
 =?utf-8?B?bldMazVwMlllTjdhanMvc25GYXVROERmdDZJT2lLTXhTQ3JsbE1XcHF0aTlI?=
 =?utf-8?B?U3prelFYYnFHN2R1bHpzakVhS1AwTWkrSU5xc041WHpMWlBUai9TT2MybE1n?=
 =?utf-8?B?MjdNWStONTJ4ZmsvaU9iTWRnSktVNHVmcVhqajB0V2pNSTFPRHdKcGZoeGlB?=
 =?utf-8?B?R1p4WkRVK0lEWk5KVTd2TTArdHBwNDkxYlc4WDJOaFdtNHV3UUVRbGltWHZi?=
 =?utf-8?B?emJWU0F3OFZnU1FzOXkxTUNTekNQOFFqa1BZSXVZbkl3c0FnUWFIT1d2bWQ3?=
 =?utf-8?B?MHRpZzl4alUzUGVXb1ltVjJlcEEzZC9USzM3RUFUaTlYRmJyWFp5emN0bkZP?=
 =?utf-8?B?T2NUczRLNzVCQUcyakF3aWF2QnpHM2g3WXZ4aGV0WDdkdjBZdy9sajFvM1hH?=
 =?utf-8?B?dW02UFVFT1Zka0FNSXRPOTBBV3c2cnljYW84dFpYRXNpOVVhcmRhNFFYMVNL?=
 =?utf-8?B?Q205dDJWYzdtakVNc3pJa2ViWnFYUWVqeW5UTlF0cUhSeVFoakZGdlVJTGh5?=
 =?utf-8?B?VnE1UkpkSjhUb01RdWJrTXB0TmVQTnFvN1hHQ2RIQW9KZWY2R1FZVVZ4bmh1?=
 =?utf-8?B?SGt5V1I1MWhFM012OG9lT3pZTlEwUCtRK1RGK2djazRXdENSNFI3UWZSeGc4?=
 =?utf-8?B?dzBycE5Pd052ZE5jWTlnZGF0dVFERVVxaUQyMjBVSURJYzBtT1NZT1hKUUhN?=
 =?utf-8?B?ZVVZVjI5WjZlNGEyalFrMyt0bFlOK3JoRkZnSW05Z3NJMHkzc05VSXlRRWRD?=
 =?utf-8?B?NnZNalJqSzdJbnp3RkM3TmU5SHd6WHpVcUxuUEZQUnR2dCtleE1kN3I1QWhx?=
 =?utf-8?B?OEFVQWpNSzVuUXpQWlorVGtlWWVMUGpMRytxTWxMYWtZTUNtWlJqVzZwTDd4?=
 =?utf-8?B?V21zUGNNNEhvZUZqTUxTaGR5V0Yxd2xMZk1xK3VJTkVyR2praWNwbDZyK0Js?=
 =?utf-8?B?eEhTWW5OVFFNczRQNldXalUxREFDVEhiYmV2WTNVZTNZbGgycjFwTlhUc3Mw?=
 =?utf-8?B?TkdicUFCMktyYnZDWVE0NFBKdTRtZklnQStBZmJWcWE4VkhUOHk0VEVmc2dz?=
 =?utf-8?B?WnN0dXRMZFZiRHBZVzhLZjdZQjNqVXFMODVFaFUrYUN4dkVrWkxqQStjNTZP?=
 =?utf-8?B?WDJsY3AwZHEyc05tRG1ncnI2NFlSUmdkWTlEMUtjVnQyR0VnNEpqbUNkY0o0?=
 =?utf-8?Q?weKPwHu+X1ss/UkkqiApXbt9X?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5dd25825-06da-40e3-db23-08de224e7723
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB8059.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2025 00:49:13.6505 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vupC+OWrEKdslL8kRmP3c/2mdPDN4b0Bhwhf67lPfH8zrDKOJ4ZXkUMeEn4cBgvIHfyLXlE0n/qRqiSOshRP3w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8218
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



On 11/11/2025 4:12 PM, Lyude Paul wrote:
> On Thu, 2025-11-06 at 18:11 -0500, Joel Fernandes wrote:
>> These opcodes implement various falcon-related boot operations: reset,
>> start, wait-for-halt.
>>
>> Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>
>> ---
>>  drivers/gpu/nova-core/gsp/sequencer.rs | 27 ++++++++++++++++++++++++++
>>  1 file changed, 27 insertions(+)
>>
>> diff --git a/drivers/gpu/nova-core/gsp/sequencer.rs b/drivers/gpu/nova-core/gsp/sequencer.rs
>> index 17118967a8d4..0192ac61df4c 100644
>> --- a/drivers/gpu/nova-core/gsp/sequencer.rs
>> +++ b/drivers/gpu/nova-core/gsp/sequencer.rs
>> @@ -49,6 +49,9 @@ pub(crate) enum GspSeqCmd {
>>      RegPoll(fw::GSP_SEQ_BUF_PAYLOAD_REG_POLL),
>>      DelayUs(fw::GSP_SEQ_BUF_PAYLOAD_DELAY_US),
>>      RegStore(fw::GSP_SEQ_BUF_PAYLOAD_REG_STORE),
>> +    CoreReset,
>> +    CoreStart,
>> +    CoreWaitForHalt,
>>  }
>>  
>>  impl GspSeqCmd {
>> @@ -75,6 +78,11 @@ pub(crate) fn from_fw_cmd(cmd: &fw::GSP_SEQUENCER_BUFFER_CMD) -> Result<Self> {
>>                  // SAFETY: We're using the union field that corresponds to the opCode.
>>                  Ok(GspSeqCmd::RegStore(unsafe { cmd.payload.regStore }))
>>              }
>> +            fw::GSP_SEQ_BUF_OPCODE_GSP_SEQ_BUF_OPCODE_CORE_RESET => Ok(GspSeqCmd::CoreReset),
>> +            fw::GSP_SEQ_BUF_OPCODE_GSP_SEQ_BUF_OPCODE_CORE_START => Ok(GspSeqCmd::CoreStart),
>> +            fw::GSP_SEQ_BUF_OPCODE_GSP_SEQ_BUF_OPCODE_CORE_WAIT_FOR_HALT => {
>> +                Ok(GspSeqCmd::CoreWaitForHalt)
>> +            }
>>              _ => Err(EINVAL),
>>          }
>>      }
>> @@ -96,6 +104,9 @@ pub(crate) fn new(data: &[u8], dev: &device::Device<device::Bound>) -> Result<Se
>>      pub(crate) fn size_bytes(&self) -> usize {
>>          let opcode_size = size_of::<fw::GSP_SEQ_BUF_OPCODE>();
>>          match self {
>> +            // Each simple command type just adds 4 bytes (opcode_size) for the header.
>> +            GspSeqCmd::CoreReset | GspSeqCmd::CoreStart | GspSeqCmd::CoreWaitForHalt => opcode_size,
>> +
>>              // For commands with payloads, add the payload size in bytes.
>>              GspSeqCmd::RegWrite(_) => opcode_size + size_of::<fw::GSP_SEQ_BUF_PAYLOAD_REG_WRITE>(),
>>              GspSeqCmd::RegModify(_) => {
>> @@ -200,6 +211,22 @@ fn run(&self, seq: &GspSequencer<'_>) -> Result {
>>              GspSeqCmd::RegPoll(cmd) => cmd.run(seq),
>>              GspSeqCmd::DelayUs(cmd) => cmd.run(seq),
>>              GspSeqCmd::RegStore(cmd) => cmd.run(seq),
>> +            GspSeqCmd::CoreReset => {
>> +                dev_dbg!(seq.dev, "CoreReset\n");
>> +                seq.gsp_falcon.reset(seq.bar)?;
>> +                seq.gsp_falcon.dma_reset(seq.bar);
>> +                Ok(())
>> +            }
>> +            GspSeqCmd::CoreStart => {
>> +                dev_dbg!(seq.dev, "CoreStart\n");
>> +                seq.gsp_falcon.start(seq.bar)?;
>> +                Ok(())
>> +            }
>> +            GspSeqCmd::CoreWaitForHalt => {
>> +                dev_dbg!(seq.dev, "CoreWaitForHalt\n");
>> +                seq.gsp_falcon.wait_till_halted(seq.bar)?;
>> +                Ok(())
> 
> Are we still planning on getting rid of these dev_dbg! calls?
> 
Yes, already done for v4 and posting soon.

Thanks.

