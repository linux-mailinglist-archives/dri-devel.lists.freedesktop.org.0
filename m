Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8579DB07234
	for <lists+dri-devel@lfdr.de>; Wed, 16 Jul 2025 11:53:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B078610E765;
	Wed, 16 Jul 2025 09:53:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="UM7Rozb+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on2049.outbound.protection.outlook.com [40.107.101.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C24C10E765
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Jul 2025 09:53:27 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=T+1kv8U+vo16qkVfnF0ppkVR9tQIrBkdMRQGZExwWXmucWmNCgE9d+FEUlSBNr60733hWYxtFEFm/n174wpfBoXm6uzvX44XMt/rfdX9InwQFhmZ0GDETI9nGx9JGiGXcRy3aEo5aWHmKDpi7nRsaYYNLiiLahmTOS1S3ClczH9HL8KxisI8gNkILHa5BRYZdLYF3x3cB0vDQQmAlqV2oecyZ+IKpzaqHUWOFmYtgq2XHGKoX0Qwnx9J+X8b6JB3TK2bPlCNwtPYOQN9Qw2Qqlo7KIZZSlfsxaH9dpqJPeAUbLmE4nbUyketEPErJvbj8Lmgj8Q9HZtgunHm1PcD4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EO0LJ836PRnvjU6zNfK6VKTuY9qNYoIOuR2rduXS8h8=;
 b=olgqVgG47p55ayTWZEMvZFaF7T2w00Bcvpov1x++6w2vSVbG8TjVWDwF/Vfyg/Q7Z2NCQSapRvrxnFyEJe6umdBltwh7laNtWTQ5gpPqohvpVHLZR5DZ1itbpm0bUngLVvh1T9G72EI4WBN6cadYCvqocFFEYo7JmlZx9iNP3ImIIqR8G/Up9NgSoPNz33mXqpD4CiAlMdQlkNb2rc3LDVkJQgjvVjPaeX7QDPoCY4cgypN9rT74KYUJAhcrnRbIJ7j1ZNg63eqD2dptv7LSWdmyzCn0BkOsUK5w8fKtrC6QwvRhk8F5o395kLlGPGaTDQe3xR/JPPYHGDwbs14EYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EO0LJ836PRnvjU6zNfK6VKTuY9qNYoIOuR2rduXS8h8=;
 b=UM7Rozb+xB5BmMLVww0OE6WMjb9faUijuNlFC79oHaoBFY1zAsSLaRe7JekVwqgJCLKhBDIejmBvgSwIEkzomXj0QLFD5arrCFOPzu3SmmKOh9hGvgXhNDhl8Udr9WS50V3xHpbTPN5+UkTVbBkGWldE3PoRrcmQP6XcbUaedLQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by PH8PR12MB8606.namprd12.prod.outlook.com (2603:10b6:510:1ce::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.29; Wed, 16 Jul
 2025 09:53:25 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%5]) with mapi id 15.20.8901.033; Wed, 16 Jul 2025
 09:53:25 +0000
Message-ID: <3aad4a31-5f7c-4ec9-8e72-47ca6e514999@amd.com>
Date: Wed, 16 Jul 2025 11:53:21 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/sched: Remove optimization that causes hang when
 killing dependent jobs
To: "cao, lin" <lin.cao@amd.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "phasta@kernel.org" <phasta@kernel.org>
Cc: "Yin, ZhenGuo (Chris)" <ZhenGuo.Yin@amd.com>,
 "Deng, Emily" <Emily.Deng@amd.com>, "dakr@kernel.org" <dakr@kernel.org>,
 "matthew.brost@intel.com" <matthew.brost@intel.com>
References: <20250715135033.706126-1-lincao12@amd.com>
 <b7e207ef3a775fed0f344ca24990c5aeb36b2507.camel@mailbox.org>
 <CO6PR12MB5491F9E1F21F95C89CC91DA2F556A@CO6PR12MB5491.namprd12.prod.outlook.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <CO6PR12MB5491F9E1F21F95C89CC91DA2F556A@CO6PR12MB5491.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: FR4P281CA0341.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ea::16) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|PH8PR12MB8606:EE_
X-MS-Office365-Filtering-Correlation-Id: 3e4a7dab-80ce-4221-6403-08ddc44e9b7c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TkFqR0diVU41QjZQbEc0YVlFS043QUx6VnZiL1BGdE5QeDhrMERndGtNMnJl?=
 =?utf-8?B?OGVHZmQ1UXpsQktkc0YwdGNubHN4MVVDTG4wMVRpbEZXVnpadTVOSHBLMG1x?=
 =?utf-8?B?ZzVpM2h6SWxPR1g1QWQvbVdiUVpuKytWTGM3cjlGRlM0bmNiMUlIMWN1cU1s?=
 =?utf-8?B?NWdIbmhDVGlGTzl6NEQ0SHNZejFrdnFibmNWQkY2NXpCMVlSeFVFWE93UjYy?=
 =?utf-8?B?RVRnUzlTRGJabmF6em5RNGtnWVVEMjZZWUlsSjdwdVZRV2lpUTBpU0NtZjVW?=
 =?utf-8?B?THJGZDVtRHovRGEzWU50V21UYUNEWis4Y1hXUmcyY1doMjlNTVZMeElLL0p6?=
 =?utf-8?B?THdqMUpxa09Vb1FOTUJXcHYyNGFJY1N1cm5GbnNzOGVRN1FtQUtWWVlzVlc0?=
 =?utf-8?B?WHBHMmphSzJydGNaV3VzSUJyWmhha2QzT2plblQvSXBsb2ZOQ1dyRWVRVGs5?=
 =?utf-8?B?NjFDNWF2WW44V05WVVgwR0gvMDk5RHhYM1ZTVlZtUG1YdTZtVjlBNS90NWdQ?=
 =?utf-8?B?WlErZ05KamxhZWtlVHVLL2dSZElPSmc2cy9BejIrdFlOR0VpYnVUNEp6WEV0?=
 =?utf-8?B?Um54WUNOdzc3V1dPZnpvUUhmT05hMmNpd0Q3V1pKYVkyMlhTMEN0V0xxck5X?=
 =?utf-8?B?dTFnei9OUWVwbXpjODk0bHErL0FtU1pPTGN0bXVaSHhRRUd5NUE5ZUNuQlFX?=
 =?utf-8?B?Y2NJU1hDQzErOHJZQnkxbStUNldhak81WWZSTkg0UFlDcmhqWS9RMmhVeUtH?=
 =?utf-8?B?eWFyZklPbzRqcGkzNlpRY2FlQ2hUbEFmZ05EWHpnTWFsZVVPcGsrbW40aUhq?=
 =?utf-8?B?OExTS3laU2VIbTNpME1PSElBMGc3a0J3M29mL0h1YzQvaGxpVndGeWpLazQ4?=
 =?utf-8?B?dUF0UHJLdzhOU05HMXlRWUkwU3JEZTZERm1hU3FtbUVMeVduZGNyZWxEejZl?=
 =?utf-8?B?MjB4V0FRc2lDQVExMVNMbTkyd2E4a3ArMDFVZlJoUEQvRFJRdWp3dzJjS3hs?=
 =?utf-8?B?N1pNa1pXR2x4eUIra2Y2bG92RW5pRmd0T0FVMURVQ1ZPNDhPVHhUU1Z3T1NN?=
 =?utf-8?B?K1pZdDBMUFFzempFbXlETUZXVVgwa1ZrVkVVWTFNWmorbVR0TXZHQnBFSVhD?=
 =?utf-8?B?MU1HVnFqUko1OUVDTGVwRkxZVklXV2c2ajYrZjlsZTVBRFFxTHVxZUhxMUdm?=
 =?utf-8?B?QTMvNW14ZVJrWC95Z3VtSXcyM25DTFB5NjFFcFdGUGYxR2dyTUlVaTlkZjM2?=
 =?utf-8?B?cDE4Rlh4OWh4YlhiN2FTZEFPelI3NmxhOXppeUhudGNiaVBad29ISkIxeXMv?=
 =?utf-8?B?REw0WVFlNHV3anRjNFkvVzJTYkh1dXFQRVN3emxRV1VYRmFIOHJLckFNcVJm?=
 =?utf-8?B?a3NPcU03K2ZKOWZyS0pUYTIwY3orQ0tPMHNtRE9NR1lleEVFRS9FdGZDMXZS?=
 =?utf-8?B?dEJwSk1lK00yYUJUL3FjVS9WN1pIWDMyMjFyRVE5em8yTVgxVnExYjlaSVNN?=
 =?utf-8?B?NmRJRzlQVWtsYy9wVHcrSGt3WUpxTldhcnp3WW9rRmpBcUVaRmFXZGhWR1lK?=
 =?utf-8?B?WUdDQk10NysxOGxXaUQ3djlQU2E2L2FVYWFUWkRsamVPc09YN29ZZkp5U2ZQ?=
 =?utf-8?B?TmU3LzZNaFY2Y21vRXd6ak1FQ1AzRHMxemF4WWJFZTZZWksyTVpmQ3FLeGdh?=
 =?utf-8?B?MUFqaDJJUldmL1ZMOEtqS3lqVjV4MWhuUEpqUnVEZW9UT1ZyRURyUU1QYW1F?=
 =?utf-8?B?Vi9LM2FSbWdBV1VEVjN4Z1FtVDJaMCs2bFZWQzZscngrNmxSRlQ2Qy9wSkFE?=
 =?utf-8?B?VHNsZUZFUDFMZ3U5SVhZRWVMUk9zOSsyalNWeWZUZGx0RDBObDBtWEJQcVM2?=
 =?utf-8?B?U2EzZTNlbHp5ZUlsMmxHeE1mK3ZKYzl1OHdWeENEdWtWOVRPQWF5Z2V6eVMy?=
 =?utf-8?Q?+3l4QfCb2n0=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NTlwYjRhRTR5U09qek5XSjVJNFNQSzQ4dWFqZGxSWVNjaktMQ2o3V2dPbHBx?=
 =?utf-8?B?OEdqTGptWThsSFcrbW9VbEZaR1lxMTNJVTBsdWd6cUJoN0ErRW5MV3cyT3hX?=
 =?utf-8?B?MXlYMlZPU04xNFBJRlgxY3o5UkpDM2hrZWgxM1RxTVE2MGZzblNYaHNQc3NK?=
 =?utf-8?B?R1h3U3RmMlM0OElFdHRxTUtSZmlQRlFKREdaT0R4NzdGemNkeEdQa1F0Z3do?=
 =?utf-8?B?R3ZIVDhhVklwTW5ZSzZNVkNpOXl5MWZwcTRWWXF3Qm0zaXRRTWcreW4vWlF5?=
 =?utf-8?B?S2MwTjZST3ZmL2tQamNDaDBqTlhWblM5eTUwRGtGdDE4NnlXV0d3VDc3eXMy?=
 =?utf-8?B?a3V4RlQyRG5ZaWZHQ3poWlcxb2Q2L2o1cFJkWXVQdmlxZ1hBR1k5Ykpid0N0?=
 =?utf-8?B?b1N0bTdZZ1VoNXRiVmRqSUl5NFBLWGxJRllMRE1rTElSQlQ2bGMxbVRYMC9B?=
 =?utf-8?B?V1hKNlpQUFY4ODgvbEhvUjZCbGVjVElzWmljakJrdUtvb2tCc2EwWjZYTGc5?=
 =?utf-8?B?RmdyMElsQmhSbEkvS2VBYUp5Sk1kQ0JZSDJIOXMyaWI2bVBJVGE4OTNZSmNi?=
 =?utf-8?B?bHJQbGVEWHdSbmxDQW5LendmUGFDS2pTYmhPbFlSbGRpZFdPSEs1T0ZYKy9Y?=
 =?utf-8?B?TTJqSGUzR1EvS0NOclVxbkNYL0lJZEl5Ujk5dG5BQVJKWDJZR2hnVlQvUEQw?=
 =?utf-8?B?d3ovcU5xbDZITzF1R29wQnNCOENqa2JCSU9XYnM0aFZzQ1duOElyNVlOellW?=
 =?utf-8?B?RDhsRXk2RjR0M2pUYy9lVDJMQXczVWFzK0R2amRIbTkxZWN5TUl1WWs5aGk2?=
 =?utf-8?B?SjRnS1JkdjJQSzJYazdBWGljM3kyTGVDbUZPRnMrSTBhUkQ4YjZ2YytpTXJa?=
 =?utf-8?B?MWxMb29idlhUY2NwclNQenlBQnpNajJDK29MaE1iZ1hqeGY5aE9jVm1naUJ6?=
 =?utf-8?B?S09KZW8wbGZUV2pzYU1TU0Q1UWVCYnZhRlVHbW11dW5hdlFncFFYRzhMOGM5?=
 =?utf-8?B?QnhoT2ZBU2VhbXVJWFpJTGJnano4T1NYenZvLzVWWFl6MzVpQ3dwaVB3azNu?=
 =?utf-8?B?akcyT0VHVCt1WkdKK012aUI1TnNRY2dwMklOZEhLVENwUlhkTzN6OU1QbU01?=
 =?utf-8?B?WjRVbE55M3ZrMEEyaVRvcUhQamp1bFpkV21jYjRweFJaWElFRjREeUFtNDVV?=
 =?utf-8?B?YXJKY1pvZ2VIUWppN1hpb0hlN0l5eCtaZVVMNWdYRy96MTF1SllsOXJRSUs4?=
 =?utf-8?B?ZURTZU9qU3ladDZZOGRqZFMyRUZzVjFNRmozSW5QVUx2WGNzcktTRjZyVVNR?=
 =?utf-8?B?UXpmWElaUE9uejhaU3FOa2VtbmQ3NEo2cHV6MkdobHRjV1FzVlhBV0ZKTERE?=
 =?utf-8?B?c0x2dnhOUjZwR0tSZHptKzNmQmExSVU4MkRCb0N5NDhWdjhrSWcveis5L2ZG?=
 =?utf-8?B?aXArU1VtS2tHV1RMRWFiTXNjaU1scTUvak1ta0F2dFlVcXFXNUpYemhSbEo5?=
 =?utf-8?B?VkdYR0k2cWlsZU9DTzR0YnJ4b0lrSUh2eTNNYnFoMzUvOHIxREJRVy85R09Q?=
 =?utf-8?B?VlRML0xEU29QZ2ZCVFpWcWxmWjVDYVdKTWdFcUZJNldadnBXZTRPTFZERWMw?=
 =?utf-8?B?aGtFQnlWN3VVSllGYlRhK1lBWGtmcEdPWHpmYnhSbTUvem4wTUt0TGxpcjE1?=
 =?utf-8?B?ZFhFWFFNcWV3R3lEL0ZBUVB3Zm1wWVhjMWpHNmlXdlZFOUUrbGxGRzVPVUxK?=
 =?utf-8?B?RUo4bStlRllMWWFCNnZSQUJJR2JzbHp0bFpSYjVzVEJNVEFlZjJuUzBMY0M5?=
 =?utf-8?B?bHRBNjRFRlBOR1FiNCtnS2VjZ3lyWE9KaW82SURueTc4Q01KV3VYTmdMM2NO?=
 =?utf-8?B?MkplTyt0dU9lSjRTaUUxY2VPWjN0ZTU1b1haNllacEZ6TVdaV2I5R0c4RVB4?=
 =?utf-8?B?N21pc3FaYVlvVUpPVDJoWFZoaG5ZOTh2RWFxRG9oQkg3VGxvaDR3WFpvdExS?=
 =?utf-8?B?NnorVEN3UkFrclB6blhaUjRSNzBHUWkxUFVpK3AvaXkvWmt4eVdZcFhOTnlu?=
 =?utf-8?B?dTFoSVRWTEVVdW9jSW5GL0E1dDZHL2R4RXBKTTljY0pkbU5GcmxFbUFjWjhv?=
 =?utf-8?Q?xonlgUQ5wF7xVttkBbVUUGMYT?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3e4a7dab-80ce-4221-6403-08ddc44e9b7c
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jul 2025 09:53:25.4427 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ssz4KlujccI/TJq64WJ4UJ/qizC+mB5q5xyrDp9DbTBZgCxbfl58gmr9Ygb5mheP
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB8606
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

On 16.07.25 11:43, cao, lin wrote:
> [AMD Official Use Only - AMD Internal Distribution Only]
>=20
>=20
> Hi Philipp,
>=20
> Thank you for the review. I found that this optimization was introduced 9=
 years ago in commit 777dbd458c89d4ca74a659f85ffb5bc817f29a35 ("drm/amdgpu:=
 drop a dummy wakeup scheduler").
>=20
> Given that the=C2=A0codebase has undergone significant changes over these=
 9 years. May I ask if I still need to include the Fixes: tag?

Most likely not, a CC: stable tag should be sufficient.

Regards,
Christian.

>=20
> Thanks,
> Lin
> -------------------------------------------------------------------------=
---------------------------------------------------------------------------=
---------------------------------------------------------------------------=
---------------------------------------------------------------------------=
---------------------------------------------------------------------------=
---------------------------------------------------------------------------=
---------------------------------------------------------------------------=
---------------------------------------------------------------------------=
---------------------------------------------------------------------------=
---------------------------------------------------------------------------=
---------------------------------------------------------------------------=
---------------------------------------------------------------------------=
---------------------------------------------------------------------------=
-----------------
> *From:* Philipp Stanner <phasta@mailbox.org>
> *Sent:* Wednesday, July 16, 2025 16:33
> *To:* cao, lin <lin.cao@amd.com>; dri-devel@lists.freedesktop.org <dri-de=
vel@lists.freedesktop.org>
> *Cc:* Yin, ZhenGuo (Chris) <ZhenGuo.Yin@amd.com>; Deng, Emily <Emily.Deng=
@amd.com>; Koenig, Christian <Christian.Koenig@amd.com>; phasta@kernel.org =
<phasta@kernel.org>; dakr@kernel.org <dakr@kernel.org>; matthew.brost@intel=
.com <matthew.brost@intel.com>
> *Subject:* Re: [PATCH] drm/sched: Remove optimization that causes hang wh=
en killing dependent jobs
> =C2=A0
> On Tue, 2025-07-15 at 21:50 +0800, Lin.Cao wrote:
>> When application A submits jobs and application B submits a job with
>> a
>> dependency on A's fence, the normal flow wakes up the scheduler after
>> processing each job. However, the optimization in
>> drm_sched_entity_add_dependency_cb() uses a callback that only clears
>> dependencies without waking up the scheduler.
>>=20
>> When application A is killed before its jobs can run, the callback
>> gets
>> triggered but only clears the dependency without waking up the
>> scheduler,
>> causing the scheduler to enter sleep state and application B to hang.
>>=20
>> Remove the optimization by deleting drm_sched_entity_clear_dep() and
>> its
>> usage, ensuring the scheduler is always woken up when dependencies
>> are
>> cleared.
>>=20
>> Signed-off-by: Lin.Cao <lincao12@amd.com>
>=20
> This is, still, a bug fix, so it needs Fixes: and Cc: stable :)
>=20
> Could also include a Suggested-by: Christian
>=20
> P.
>=20
>> ---
>> =C2=A0drivers/gpu/drm/scheduler/sched_entity.c | 21 ++------------------=
-
>> =C2=A01 file changed, 2 insertions(+), 19 deletions(-)
>>=20
>> diff --git a/drivers/gpu/drm/scheduler/sched_entity.c
>> b/drivers/gpu/drm/scheduler/sched_entity.c
>> index e671aa241720..ac678de7fe5e 100644
>> --- a/drivers/gpu/drm/scheduler/sched_entity.c
>> +++ b/drivers/gpu/drm/scheduler/sched_entity.c
>> @@ -355,17 +355,6 @@ void drm_sched_entity_destroy(struct
>> drm_sched_entity *entity)
>> =C2=A0}
>> =C2=A0EXPORT_SYMBOL(drm_sched_entity_destroy);
>> =C2=A0
>> -/* drm_sched_entity_clear_dep - callback to clear the entities
>> dependency */
>> -static void drm_sched_entity_clear_dep(struct dma_fence *f,
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct dma_fe=
nce_cb *cb)
>> -{
>> -=C2=A0=C2=A0=C2=A0=C2=A0 struct drm_sched_entity *entity =3D
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 container_of(cb, struct drm_sched_entity, cb);
>> -
>> -=C2=A0=C2=A0=C2=A0=C2=A0 entity->dependency =3D NULL;
>> -=C2=A0=C2=A0=C2=A0=C2=A0 dma_fence_put(f);
>> -}
>> -
>> =C2=A0/*
>> =C2=A0 * drm_sched_entity_wakeup - callback to clear the entity's
>> dependency and
>> =C2=A0 * wake up the scheduler
>> @@ -376,7 +365,8 @@ static void drm_sched_entity_wakeup(struct
>> dma_fence *f,
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct drm_sched_entity *entity =3D
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 container_of(cb, struct drm_sched_entity, cb);
>> =C2=A0
>> -=C2=A0=C2=A0=C2=A0=C2=A0 drm_sched_entity_clear_dep(f, cb);
>> +=C2=A0=C2=A0=C2=A0=C2=A0 entity->dependency =3D NULL;
>> +=C2=A0=C2=A0=C2=A0=C2=A0 dma_fence_put(f);
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 drm_sched_wakeup(entity->rq->sched);
>> =C2=A0}
>> =C2=A0
>> @@ -429,13 +419,6 @@ static bool
>> drm_sched_entity_add_dependency_cb(struct drm_sched_entity *entity)
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 fence =3D dma_fence_get(&s_fence->scheduled);
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 dma_fence_put(entity->dependency);
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 entity->dependency =3D fence;
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 if (!dma_fence_add_callback(fence, &entity->cb,
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
=C2=A0=C2=A0=C2=A0
>> drm_sched_entity_clear_dep))
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return true;
>> -
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 /* Ignore it when it is already scheduled */
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 dma_fence_put(fence);
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 return false;
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>> =C2=A0
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (!dma_fence_add_callback(entity->depen=
dency, &entity->cb,
>=20

