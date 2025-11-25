Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 55226C87668
	for <lists+dri-devel@lfdr.de>; Tue, 25 Nov 2025 23:53:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4676D10E095;
	Tue, 25 Nov 2025 22:53:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="tnGzNSsY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DM5PR21CU001.outbound.protection.outlook.com
 (mail-centralusazon11011001.outbound.protection.outlook.com [52.101.62.1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E004A10E095;
 Tue, 25 Nov 2025 22:53:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AW3m1QA/+0a/FJ3LSaux4FW4WELyVfQ/RutHwv6CUDgRfFlzf0HIrF7Gy/r2b4OaEc8NZLlzuFJWsGeAPOodYMesHhxxPQSMkvRgCBlR90zwQAsxWWV5g+RPpOsPxpe0GJgH3+G5Ljr4aMEvhalSm24Aiz4kpm4umlCGWDvkAtd29U0dsOImfxKebzPDEYGDZ7m45aWKdqbED/Ckote1dURR48FkuYmg8ivFht1PO/07BHMdhCHdjaAIro+CbSlKm/jg4JDueXj2EShcengm9TaUKdNH6c9JtpXn7TvQnNndniyuWS0JnBpOQ8xF4/j8OEJelOQnfEgTYe3oJIEiDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Fov8UdSRuNggDJ4TMdonuog8QklIfcHmUEjdvCpSKEI=;
 b=JyI6gLgrzmu0nN+/0ZIIBE5V5hcjqmTQBcc4MgFbE9jtRsbW3cC6RwFEoyZcNV3MbTO87JQbylpfcIUXGuvtE2vdR42j4qr5S3ZlXA7FpZ9s4vhqGQ46WrbvINuBXtSdhlVipq3esx14Qo1e7PA3zDoQ+4A47Dl4wPrArApgb10LiPH3OfchUX4ibk5ka9gSH7hKwNMHFnz44kHNkvwhG2GMfNoQs1b+kzvMC4+v5qQsev3m6ur1QvL7mC9BTW1ErOFwMAAROpOZBH2NfZBWXVbc1yg7Djv2FAi0r3/mb8MrRmX5Q9d/j449ZP3Z3aSNTJy/XGUhreMESym5eE93Iw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Fov8UdSRuNggDJ4TMdonuog8QklIfcHmUEjdvCpSKEI=;
 b=tnGzNSsYH23HS0PPc9KYuRdisvCyPui1U5SlAwLMT7lhgXG7CdbME9vy/OYO2AVSmEA4GSierUK3psDRD7cNySF8fQIe8c5Ks3d2HNoGUch/+fDKTMmOz0+1eaobHxzn346j5jovLD8ORvp4ZO2Ngc3JheoJcS+e5Nq9TUfuHDjWPGflmwulHSMILLALNVX8dLjUd4W7jCv15NKDi5F99Zq5ivYFJHF6PYQHYTKJ2HCz/dyDD8GI+KVhCaFlbxpGVca/MU4DuxUjXZ7tAclbenIm2Fa04T9vxeYpehu/0AYBtEgGreRyeLkr/rFQO0L9I5258LNw4naawLYQGyD1aA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SN7PR12MB8059.namprd12.prod.outlook.com (2603:10b6:806:32b::7)
 by SA1PR12MB999108.namprd12.prod.outlook.com (2603:10b6:806:4a2::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.12; Tue, 25 Nov
 2025 22:53:02 +0000
Received: from SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91]) by SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91%2]) with mapi id 15.20.9343.016; Tue, 25 Nov 2025
 22:53:02 +0000
Message-ID: <cc323786-68bc-451a-ae42-651088c1322d@nvidia.com>
Date: Tue, 25 Nov 2025 17:52:57 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] rust: helpers: Add list helpers for C linked list
 operations
To: John Hubbard <jhubbard@nvidia.com>, Alexandre Courbot <acourbot@nvidia.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "rust-for-linux@vger.kernel.org" <rust-for-linux@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "dakr@kernel.org" <dakr@kernel.org>, "airlied@gmail.com"
 <airlied@gmail.com>, Alistair Popple <apopple@nvidia.com>,
 "ojeda@kernel.org" <ojeda@kernel.org>,
 "alex.gaynor@gmail.com" <alex.gaynor@gmail.com>,
 "boqun.feng@gmail.com" <boqun.feng@gmail.com>,
 "gary@garyguo.net" <gary@garyguo.net>,
 "bjorn3_gh@protonmail.com" <bjorn3_gh@protonmail.com>,
 "lossin@kernel.org" <lossin@kernel.org>,
 "a.hindborg@kernel.org" <a.hindborg@kernel.org>,
 "aliceryhl@google.com" <aliceryhl@google.com>,
 "tmgross@umich.edu" <tmgross@umich.edu>, "simona@ffwll.ch"
 <simona@ffwll.ch>,
 "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
 "mripard@kernel.org" <mripard@kernel.org>,
 "tzimmermann@suse.de" <tzimmermann@suse.de>, Timur Tabi <ttabi@nvidia.com>,
 "joel@joelfernandes.org" <joel@joelfernandes.org>,
 "elle@weathered-steel.dev" <elle@weathered-steel.dev>,
 "daniel.almeida@collabora.com" <daniel.almeida@collabora.com>,
 Andrea Righi <arighi@nvidia.com>, "phasta@kernel.org" <phasta@kernel.org>,
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 Nouveau <nouveau-bounces@lists.freedesktop.org>
References: <20251111171315.2196103-1-joelagnelf@nvidia.com>
 <DEHV08MPF9CH.1GZAWEGC4AVF3@nvidia.com>
 <095D38BD-A8AA-4BC3-8C24-9454964EB8F8@nvidia.com>
 <92ae727b-189a-4ebd-88c6-cad06d9f96ca@nvidia.com>
Content-Language: en-US
From: Joel Fernandes <joelagnelf@nvidia.com>
In-Reply-To: <92ae727b-189a-4ebd-88c6-cad06d9f96ca@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: IA4P220CA0006.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:208:558::7) To SN7PR12MB8059.namprd12.prod.outlook.com
 (2603:10b6:806:32b::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR12MB8059:EE_|SA1PR12MB999108:EE_
X-MS-Office365-Filtering-Correlation-Id: 9b8db9f4-af6d-4d37-ba1c-08de2c756317
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TDlwSGgyajZLTVhvT1BpM2JSdVRkVTMyczRiMG90Y1c0Tzg4NkRKMVJzRFlW?=
 =?utf-8?B?b3ZvNUt5WjM4NXRKZE5IQzRCUkI4M04wekJJT3hBK0JKYld1MWVPdEFNWjdj?=
 =?utf-8?B?NnhHdjRaU01mRDdiYjB1bUwzaUExZkp6YXEwSW45QnFLL2VRcHh1QVJWaXI3?=
 =?utf-8?B?TFpsVnpkQTZFajBacW4zMWRzUXIxUkZ0blZscnNmdG02aUlYekkrN2RPWXRF?=
 =?utf-8?B?RkVmbDZnZUUrMWVqbElHUWo4MEduNFp6eTdzYlRrTjA0a0lNRmQ1dXI4WmxG?=
 =?utf-8?B?RForblhmVktDVXlyRmFGazJjN05sdklqZmo1cStNbngzSmRSOWJ0S3RON1h1?=
 =?utf-8?B?U2tPdXZLK1hRdWh6VDM3WE5rczBnSEpzbGFUa2lMangweFFCcC8zQUVzejBn?=
 =?utf-8?B?UmpaKzhlQlR4MDZNQlpaTnFlSzdWWWhyU2tzNDc2NDhacitiMzlkb3hrRmpu?=
 =?utf-8?B?dTg1SzErdmNMQ0wxQ2wwOTZJa2NXOUpvNnZnSzd0YjdBRC9YSE0zSjFXQ1RJ?=
 =?utf-8?B?NmIzVWlqbFFQa1MyNmhHSEZhVHN0eDBCUGFobDZPbGJhakNxTzFsUitObWFN?=
 =?utf-8?B?Z1BNc3llYXlDUWpUL052eXhWa2J4UGt5dTY4c09yclQ3T3BJWjBNNlBpVTJB?=
 =?utf-8?B?TURTWDJxQ0YzeHZON3hPcUEvREM3S2k4a1BLWFdnRVM5WkdpMlAwcG1HTkJi?=
 =?utf-8?B?Z1c0bXZtbisreDM5d1FoaktZL3pEQU00cDRTWjRZalhzeTAzd0Y4bENmeHlu?=
 =?utf-8?B?eEduSFpTYnFOYWNFYmZoSVpuK3BDK1lTckZ3MzNoaHZLSmJMZU5obC9ZOGdW?=
 =?utf-8?B?WGZRY0NMQ0pyQlhPeDRSNE9yZDZ5SStzRVBVQjYrNUMzZm1ITkNtZ3dxb1Bh?=
 =?utf-8?B?ZUgvY0tZN0N3aHNkTmVGZUpRRHRsUFd5ZHN5WU1SUXM0SnZ2ZDVtNEU1aDFm?=
 =?utf-8?B?UzZGUDYrQzJFMFIzZ0hlTzRhd2QzMkdyYUJ0bWttQ05CUFVUL1BFejlGWkRI?=
 =?utf-8?B?MjI3ZmVQWDZTb0RYeHl2ZjUzTkxJNkxFQWlpUnVCaEVVdkhBbm9QNHMzSEZi?=
 =?utf-8?B?cThGQ3loY3FUTDlnZUMrK3hNVEtjTkpVRUVlOVkyaDhKN1hKNHR5T1pvcngz?=
 =?utf-8?B?NE5pYko0MnBSZGg2NCtjaWU1R2M4dkg1MXlhd2E0U1RwaFFaTHUxWFo3VXlr?=
 =?utf-8?B?UllNUnlRT1BQSkNKRDByTVlMNUlYTzl2aWU4K0hiUmc5bEdhQy9uZXJOcnND?=
 =?utf-8?B?c2JudEU2WFZkenRBUWt6WTZLdDhEQTBDMmcxM2RqR0pvNjM4S3QyZGg5cnAw?=
 =?utf-8?B?NlR6UXgrR3VqSWxjVTBRSHRwb3FaUVhrSTViYmxqU0hjdC9pbnl4cHVlMmx3?=
 =?utf-8?B?bnFlUlpOeGNFZ01PZjExN3RSbTZySzMyais0WW1ab1lrRFYxamg4UGs4WUpB?=
 =?utf-8?B?QXhVYWdMQS9OU2FHSmxORXRMYjZob2pRLy9YMkRQemQ1ak1RWWxhRlhrSE1h?=
 =?utf-8?B?anBvM2wrS3hhMXV5SVArZncwNmJ3OWtPd2pVaUJKbEVUZmpPMXpkZkxXRElh?=
 =?utf-8?B?K0RCeEZFMWJhN3NtMi9CZE5FcWR1amZzTVhkVmFZMXkzWE84a2ZzWFJJTEg4?=
 =?utf-8?B?TjJMUHZhNkp0QmVuR2hJYUxJck5uai9EVFhIR25iNFFJWklPZE1RaTdPb2F0?=
 =?utf-8?B?TUJmVkxEUFpIUWQ5TVFCdnJiTXJjdVRIUkFicC95NzU0ai8vWWZiQ1U1dVg3?=
 =?utf-8?B?dTVydjc5WWRrMUszUVNxVFRyUURSTDkvcGRQZVlkVnZHTUJ4WXIxb2JkTXV1?=
 =?utf-8?B?TzZDTmU2YzJVVmhteW1CQmFxNEVBNVowbFhnZjBIN1RBRkdRNENHZjhUeVF6?=
 =?utf-8?B?N1hIOGUrMW5PRStFUk51clpsNmgrbHFnVWs4ck5ZbE5MSjhJdnNoR1pHM2hk?=
 =?utf-8?Q?O6gfzWmxOWFxwUTE4oor+CMPy/7dZTbL?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR12MB8059.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(7416014)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?M2locGwxWlJsQkZZWWhkcEF6RURKSy94SGFtU1ZtZVBOUlM0OVRtd3hwRGxu?=
 =?utf-8?B?c0xqbHlkRm1RWkZ3VUtraEVUVEkxQ1BvWHpwMmpjNFBQdkxLQjFBVERLMEhj?=
 =?utf-8?B?NVowUjBOMnVYSE14NlBqblFlZzI1RCtOVW9ITHp4WWNaeUlyckwzWHpqclZz?=
 =?utf-8?B?MDgwckkvclF2TzhXOWNiaWhCbE5JajNpdHFIdHBGUWJmYVQvdzZiOGRvcEVN?=
 =?utf-8?B?RXlyS1NUcS9vWHM0cnNDSTg3QnRSZjFJUStqbUplY3dHUkZwc3hZOUlWZnIw?=
 =?utf-8?B?cnpmd3dsQWNOVW14REcvOGtrbXlxK3pyV1RBQ09IQ29aWFdGODVJaTF6cWhU?=
 =?utf-8?B?UVQ0VzEvcTk0VTNTUnRKb2xERVhEbFlKY0ZMMFpYOGlpalRRdmVFZXl2YVds?=
 =?utf-8?B?MERuL1cvbVZkNkZoRTZNWHpKNlVyQVkwSzVlbklWWVlLU05zRFpFakwxREk2?=
 =?utf-8?B?QUNhemZpUWVKQ2V5bjJnR1VsV2NTaTFwbUtNY2N3NGZBYlNJN0ZGRHQ0eGpN?=
 =?utf-8?B?bGhoSzMzdStxenRzQnlIQmdhdGpOcXBIUENESzZIM1g3djU3MkcycHd2aXIr?=
 =?utf-8?B?NjVWbFZERDk1SUJtSXV3RXZaZThHMEYzRDBoVkdqL054Y0FobTAxQlZxVzNj?=
 =?utf-8?B?ZkY1ZFNoWGNneWxzdnJOL09ka05nVnVna2k3UEhoNUdUOElRQks0V1Z1Njll?=
 =?utf-8?B?WkhuK211NkxXajlhTTU1WWxFSXNTdUErM2dtS2g4N01NN1NZWmRMVVRDc1RR?=
 =?utf-8?B?MjF6UkxHZWtmWS9XZlpVa1U1dTZuaWNPVlZQRmNmQ3F3QTRDZk40eVo4c00y?=
 =?utf-8?B?Y2JWTE5WcWtSMC9oSlFhVC80T1M5bStYL1c5KzM5aDBmbzhhNk5QZ2IyWkRx?=
 =?utf-8?B?bkthYzdCN2RWZjhXbE1EVGZoeGxiWlArdW9ObHdueHdkNTVUbUdsUU16VFZi?=
 =?utf-8?B?M0tQU1VHU1ZDd21kTEFOU0pibXVFeHVTbG0rTnVzYnMwMmtUUllXUkoybjBi?=
 =?utf-8?B?c01ieG93eEx0ZG5neGJ1Qk8yUDYrZUc2bU94VlI5c1ZHWWJUUFVwZlJDYjRl?=
 =?utf-8?B?eHRrcXBLWGh1ejBaS3hGKzA3SkMxZHpqQUtZZUErUGlNVDBaY25HcUhxWGNq?=
 =?utf-8?B?dVkvZVd6S0R1WThFVU9wbXNwQnEySmZ5aS83ZzlRakl5TmpyZEJPM2Z0b3NF?=
 =?utf-8?B?bjFPTm05NGxoZzdGVUFvQk9lYVN4WkRxc1pKVklhNGEySHFkM1c5UTRHVlhj?=
 =?utf-8?B?UkxxdzJrbkR5RXo4bjNGV0svczdyRXBjMEQ5YVc5T3RpK0k3TmVJUk8yeWN2?=
 =?utf-8?B?a2UwT2h0MSsrWDZ5MllMdFZydVduNGwralpsM0V2WUllck9TWFFLVndzUHo5?=
 =?utf-8?B?bDRNb0ZUUWtEc2JiNUZmSDErQ3hpMVRXVFd4T3FodmtGOVMyR2JGMU03T0dF?=
 =?utf-8?B?Vk4vc3NvdUJxbXZEMWxtREVHbi9XNDZ4eXJyN0tjU1hlYmFOMkFCQmx2Skd4?=
 =?utf-8?B?ZW52WUVBc2VSQ2xDV3ZSNC9DbTI3aytRalEvaDBUWjdCRFhTakpLRjRhdDJG?=
 =?utf-8?B?bmFrRUxRNDZ1aDNLczJ1dlk0bFdOSGxyRHQyVW90ZWVIcDBRbzBydC8zWnJ6?=
 =?utf-8?B?RjdPTmFLN2V6Y21lVlBreEtqZkR1SFREbG9nTXBtT28vbEZ5ckpVaGx0MU5u?=
 =?utf-8?B?KzNkSGM5aWRwUVd4T3dLSXZlK2llM1lJOGFMSEJvQzdyUW5lK0g3UjBSQUdV?=
 =?utf-8?B?a1FDb0pORUtGZkl5M0FYMFRackZwVUdRdVhGcmUxVmFoQVVVMC9BSTYyNFdF?=
 =?utf-8?B?UXJrek9Ra3luUUZIWjFueUZscW43TW1MZVY5czJGNzIyNEd0SEtCVFNQY3or?=
 =?utf-8?B?Qm5PNHZzS3paaWx0SHlPamFPd3VMQ1JqQjE5V1pGWE0xOTJuczNQN0F4V0JE?=
 =?utf-8?B?MktvZlVsbDJHSDVydG80WFdnWll5Z1hHa0xxR0k1Q1k2WTFDVUpMbUtyMEVX?=
 =?utf-8?B?R0cvTlpMc2dyYVEydUQzL2drQjN6K1hIdStoeENSQVExeEZQNy9SdTNnZ29t?=
 =?utf-8?B?U3h5RHNPelhoVHFGQVZSVXI1aVV6SGtUby91Y1FuaFU5aFc0NzhkSG1XNkl2?=
 =?utf-8?Q?Cob1i/EHF3Spj7FzxBXKlssev?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9b8db9f4-af6d-4d37-ba1c-08de2c756317
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB8059.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2025 22:53:01.9724 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vO1jP6pnq4el89XRbJXXcBV/xPOkLL87+nejm2uyUTfdybRkR/hMU9khBlHEsZQZpfPai+twmLczlsXL/Gh4jw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB999108
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



On 11/25/2025 2:48 PM, John Hubbard wrote:
> On 11/25/25 10:16 AM, Joel Fernandes wrote:
>>> On Nov 25, 2025, at 9:52 AM, Alexandre Courbot <acourbot@nvidia.com> wrote:
>>> ﻿On Wed Nov 12, 2025 at 2:13 AM JST, Joel Fernandes wrote:
> ...
>>> Just noticed, but of these helpers only `INIT_LIST_HEAD` and
>>> `list_add_tail` seem to be used (in doccomments).
>>
>> Correct, but it makes sense to add the most obvious/common ones (also to make it clear that using these are supported).
>>
> 
> It's important to exercise the code. Let's please add that
> coverage, seeing as how it is quite easy to do, right?

Sure, I will add that.

Thanks.

