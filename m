Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 21ECF973CAB
	for <lists+dri-devel@lfdr.de>; Tue, 10 Sep 2024 17:47:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 028EF10E86F;
	Tue, 10 Sep 2024 15:47:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="Xj0JyfRq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2075.outbound.protection.outlook.com [40.107.243.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8BA9A10E866;
 Tue, 10 Sep 2024 15:47:54 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FwfvHAabigHPhGth0x4IwqjgtyJA3yo9NLhaC7q+UWb1hjntXP7C+rnxSGxZIqxLbycWproEPyoPF3tV1eCnjqNZ4BisUtfa5YlEqnI8PcoNz4bGoahmu+pPM44XnQ5tquFf7YSrIxQJF7vDZcpc6tytUToPUKCVlEXBn88WFlC4BaPlFJo/j7AdVZXi4fu35R0b9Z5Bzps6s3En69w7PAF/dWBGaI95wDRzHQxIQR0866qQdOxvw022jzUSCI8dH6jyys3NRM9S/PopktoJFgBs2iQ7ZmFJCx6O1aR7c/Fbjevq+o16MUMDUVXVF03z3ZvCngM58xcxTw2hnD2BTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=g84kCwUm3czCHNtbqUT/bmyjWbwWO2SeblKempGWO/M=;
 b=irNcQKqXdulu7DLsfoxEIOPy0nPu7vvtajXlv+8KLQyyDpBucIbHVyJXZcCaGu1rWRRRU7WlE7NLSw8HEJoKe1UTVWOGnwhrsfHLlvOhghApkTOaTI981xrgVgF4/D54cKp/s9nqspQs2dK4vaByHoB4yxWarKncXf293rvSYJcmRD62MMLIlhA1DjyUv5DPFs0U3N+++clrDmZOMdMe9LLlZGQ3XNW69gfbH0A5AswuzolpI8BXOha5sRzNKQOJDyktfc5TTYpNz5RLeg0IYtsO+65VPYui8liBvybz0kDUcYuE2T5YxyPXSqhDlz4T5u5AoqWSexJcJ7KnDA32/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g84kCwUm3czCHNtbqUT/bmyjWbwWO2SeblKempGWO/M=;
 b=Xj0JyfRqxwqTX+COWOgFFZhtNx5E9oVyHdgQZV429+Ireea9CyJ18iFtV/IBeO6HfxNHJJHeE9PMW7xN+LvpPEAMX7npGDcSzGgqYBuacdvNlGJuOM8thjkirHgLAbqZMiO6LC/9na/E5msWpiAM7p9hqgvJtXY/KNL1Ja8a7Dg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB5311.namprd12.prod.outlook.com (2603:10b6:5:39f::7) by
 DS7PR12MB8232.namprd12.prod.outlook.com (2603:10b6:8:e3::12) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7939.23; Tue, 10 Sep 2024 15:47:51 +0000
Received: from DM4PR12MB5311.namprd12.prod.outlook.com
 ([fe80::a846:49eb:e660:1b5b]) by DM4PR12MB5311.namprd12.prod.outlook.com
 ([fe80::a846:49eb:e660:1b5b%4]) with mapi id 15.20.7918.024; Tue, 10 Sep 2024
 15:47:51 +0000
Message-ID: <eeab54b4-c055-4992-9ca4-f9e382db68c4@amd.com>
Date: Tue, 10 Sep 2024 11:47:48 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: 6.11/regression/bisected - after commit 1b04dcca4fb1, launching
 some RenPy games causes computer hang
To: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>
Cc: Harry Wentland <harry.wentland@amd.com>, zaeem.mohamed@amd.com,
 pekka.paalanen@collabora.com, "Wheeler, Daniel" <daniel.wheeler@amd.com>,
 "Deucher, Alexander" <alexander.deucher@amd.com>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Linux List Kernel Mailing <linux-kernel@vger.kernel.org>,
 Linux regressions mailing list <regressions@lists.linux.dev>
References: <CABXGCsNgx6gQCqBq-L2P15ydaN_66sM9CgGa9GQYNzQsaa6Dkg@mail.gmail.com>
 <CABXGCsNztS8MLteq5=fcddwuQ1TCzeOM8TdVtpJ3crK=sV5PTQ@mail.gmail.com>
 <CABXGCsMdxHJ-MLkS0pm51Sk8g0PTghsuZxmowvj5t44bVN4ndA@mail.gmail.com>
 <ffd2c40c-1c2e-4465-b26f-88d5e08a80d9@amd.com>
 <CABXGCsOoL5vD0+FRALFQFr3ZBpb2z5mpGKzAD5RHoW9_sb5yaQ@mail.gmail.com>
 <f68020a3-c413-482d-beb2-5432d98a1d3e@amd.com>
 <CABXGCsMSTsBFW=OirDszPFVOiNgyOBSh3qyzAw-Coi-McnicAQ@mail.gmail.com>
 <04d3755d-f295-46d7-b35d-008b888b39ae@amd.com>
 <CABXGCsMDk59-P0Nr1v7KajKsoQh2966mykLPWQxajPtq=OGgXg@mail.gmail.com>
Content-Language: en-US
From: Leo Li <sunpeng.li@amd.com>
In-Reply-To: <CABXGCsMDk59-P0Nr1v7KajKsoQh2966mykLPWQxajPtq=OGgXg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YQBPR01CA0059.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:2::31) To DM4PR12MB5311.namprd12.prod.outlook.com
 (2603:10b6:5:39f::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB5311:EE_|DS7PR12MB8232:EE_
X-MS-Office365-Filtering-Correlation-Id: c5a84fd0-b6a2-4cd5-bada-08dcd1afeda0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?aTRNS284d0sycnA4SUJ1VDhQQXZERXVPcy9OcENCNXJsMG5nQXVmdEt2VGFt?=
 =?utf-8?B?Tk81ZmkxOFAweFlFQ3M5czBkZkZid2daazlZa1RTZmtsdENESW9yb0VqL2Ft?=
 =?utf-8?B?N3Z2VWpVcDhDMVkwWnArTmxHQjZSaFhyK0EwMm9Ca2FDdDVtTC9pSk9oY0hF?=
 =?utf-8?B?TjMwdjkrOGZ2aGoyNEdsbmJMUzdUbHVaVVZZb3NvREh1R0M5NllvbFVFUHpF?=
 =?utf-8?B?VjE3UXZJdnllejRNdVFMbzlWcmRZdEE0TXNvTGc4dGt1RnpPR2VSeE5Wei9p?=
 =?utf-8?B?VVRsK2ZNOGNPMkdoSFE2VVUzUWc4SlRoeUxFOXZ6SVFhKzM5cjdaejFJMlZm?=
 =?utf-8?B?SDZ3bElSYXpkcitwNVUrMDBqbzg3eUl5YkpFTFYxMGpxZHJjMTdBWG9uMGJj?=
 =?utf-8?B?SkdwK2t4VFBpaTBuNjlObDN4U0VDMHpJeSttUEFJOHBGbHo3K2dXS1ZzN2ww?=
 =?utf-8?B?d3Y5VUF5NzlBSkhrTTRYUitad0NUd0U2Ym5KdkVLMHNURFZGb0tIdzN0SWVt?=
 =?utf-8?B?YUk2YW0xR0ZvcER6YWMzZldITmxURmxZL2ZUS0t5VDRYZWhJM3VCNE9ZbHdO?=
 =?utf-8?B?bXJvVndnNENLOGZFMDhma1N6cEQ0VGh3cFRhZHVQY2RSY3V1ZTBVN3EzUzgv?=
 =?utf-8?B?WklENngvM0tINlQwSnlZRVhjamRQWjlBakV2eG4zODFMOGZ6R1VpRlNlenlo?=
 =?utf-8?B?MEs4SEtRaWtYT0NNWVNZalQ1alV4UWFHb1JmQmUxZ1JhMm1YM2lvY3EvUDd1?=
 =?utf-8?B?eHFEWjVrSUhORGZJbStsN1JYL05Pb0RNa215Mi9iZWRKc3J0d3JUanpDZUJ1?=
 =?utf-8?B?MVBCSGhYK0VhYW8vZmROSWJ6TUJUS1FIL25Daks5b2tia1FUQXZ5ZFBnSnEz?=
 =?utf-8?B?ZzBxa3J3VUx5L2w5RE9VdklPMHJldHZUV0dFTlE0dU1GL1YyMlFnUWtNU3Fl?=
 =?utf-8?B?SFpqVW9aT3o0cWZwaDdyTWlkWTJBQXFkQU4reG9MdHRkdEw3WHhNUm15RE9W?=
 =?utf-8?B?SWVXdDlxOURyeml2U0dYV0gzQU9qWG50M0lrVXZITFZrN1dUUTRteDA5R0FL?=
 =?utf-8?B?TSsybWI4S0N0a2dMK284aVp5ejNEbTkvNFZtb0t5NWNDUGRHSW5zSzh5RXkw?=
 =?utf-8?B?VlRtMUs2aElIbWlwU0FDK2U0NnBFV3hJSzd2TllET2hRTGprT2ZLeXhHaU8x?=
 =?utf-8?B?SjlmWDdJdmQ2TXRmcSsxUEZDMVJaSlBjdkNnL2FjNjhSUmFrNytGOEE1RG9S?=
 =?utf-8?B?NnRTa2laN2NpcWVCcDdhWm9vMDVmb01YWGxXeVlIUk5BYXU5L3VjLzgwSXc1?=
 =?utf-8?B?N3hoZU14OEdMUlJ6MXdIak0yenNmWHExVVk4eDNZbDJZbUdzaWRYcEZOUHdX?=
 =?utf-8?B?OFN0R20wcldKMXNicHRQTXJVTDh6UlBJcTJtRE1obkZXdzFXMUVvWGNCeWg5?=
 =?utf-8?B?WHJsMlErRXY2LzUrMytTSk1KMjdiZ2hlMTF6dWszcmJYeGFEdC8vbG80U2Zs?=
 =?utf-8?B?YlZ1MkdtRFVvU2cwYlR4eVNqcElPdVlZdHhJa1c3SFN3bllhRXFDaXNTOEtz?=
 =?utf-8?B?aFliZDZNZC9aUmVXTGV4eDNoZS84WEZsVHBFSDVXbXh1OHJ2b0VEWlNzY1Yw?=
 =?utf-8?B?c3ExRForQzFlL1E5ZzlFMGV2S29xSmJwL1kvdVlBa0Qyb1MvSlBDVlp3U0U3?=
 =?utf-8?B?WXZuaDdUby9UTi9hS0h2T20wUDVTdW9rRExYQWZWSkxwQ0hQQmlPVDBLdmMv?=
 =?utf-8?Q?pg5h7DbJj5P9uEl1o4=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB5311.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aGtvQ0hnUjd3Qy9rVGh4aDlxSmxhTzBtRE5kVVRFZ3BJR1FCa2pvVDdYQUk0?=
 =?utf-8?B?NzVUWUx3M1NQSGVpSzhkMVFEYytGbjdCd3hHQStjbFZjM1dZN3Y5Q3ZWOEhr?=
 =?utf-8?B?cHJpcEZrMmZqaWlJTVpvREZOb1FaT2JjbnVwRjQ3SFNWazBsZG9NOE10U01z?=
 =?utf-8?B?TUduM2tKUFFNQkttZFBVMTkxaHJNNkxYQUtPV01GRWJxbVV1VmlzS21rK1hj?=
 =?utf-8?B?dElhNVFzYXJPVEM1a1h3U0Vxanc5TEdsT0NmT1NpRFJ0YjlTUXVtNXYrWjBF?=
 =?utf-8?B?RGV2UWlmWmk1MWZMVUpqOWdGVW5Nam1pS1RCMUpXQ0VMRWtyNG9WMi92RGt2?=
 =?utf-8?B?MnlzcUVHRHo1eHFHeU9ncUFIWStDdk1lREdpZ3Bra3hWOEEwS1lrbTZjVkRW?=
 =?utf-8?B?NFdhbUtyWk5HQUxDZEVxZkZzYjFIOGFZYUF1bFAzTDRqd0JPdUdpWVluT1Y1?=
 =?utf-8?B?dUdHaVNnazNCOG9wYUNLNjNpVjd3U1Qxc2JaMjhXUUJHK2dtY1g0c2hxS2Jz?=
 =?utf-8?B?UWRSdHZ3d1pMZ3JlRC9zcGMzWUZka3FnYnIybG1QL1hBa2JVVU5LeE5adXhV?=
 =?utf-8?B?UVBFRGxqUGtDRFgvenp1ajZFc2JzcVFGeldPMTRFa0QrMy9CNWtDaXVkSis5?=
 =?utf-8?B?UEc3TjF0dkZwV1VMbGhFVTJsQ01iL0hxZFlKK0RQbVgzUGVTZVZiSUxvdklh?=
 =?utf-8?B?SGUvbFZIS2I2RU5YQlNxTHgzc2d4Um5yYkYyM2ZnWTdyT3dvc3V0TS9hZDRL?=
 =?utf-8?B?K3NMazRBem0veDUwei9sOFBRbHZ3eTU1bi9FSEZab3hnQ29EMi8weVpTR0Rn?=
 =?utf-8?B?eFVLVm9lK0NWbi9LdlEzc3EycS9pNm5IOGVXVlB1RGliM3dXSElYSnFDQnZY?=
 =?utf-8?B?VlBzME9rMU9wWUJ4a1J1UnRVaEpnWmpGczNvMHdZVHFTTnNZTG5rem5DV1Zw?=
 =?utf-8?B?eTVydERIU0ZxcUNRUTR2WkEydjNTM3JWSnIxVG81ZmtyN0VRMWxDQ3FiQ3pq?=
 =?utf-8?B?UXNSakx5dGw4U29Kb2Eza3pLS1dtR2M2L0xXYWxkc1dUMFdodURJUmVRYVFW?=
 =?utf-8?B?QnJ1UGtZdnJlcVg3N01EcHI0ZHErN1dFaVJmTFZRUXZpUDZkSDFiamFNUFRv?=
 =?utf-8?B?SFlsVE9JQ3FsUTZWK0k3eC8wK0ZvbXFJZkZTQXJFTDgxRVZmQzBsZzB6YThl?=
 =?utf-8?B?WkxBa0Jtc25CTFFDNXpCaUV2aGNoUHZNeElkL3diMEY2MFd2YjY1L2svRmFN?=
 =?utf-8?B?dEZDcXBvdEFqMUYxdi9BWDF4R3hZd3JoZWJSNmdBcEJsNEJCRE1ZNm4yZjVi?=
 =?utf-8?B?ZmtyZUF1QTl1aC9hclZsSEZ0RlRrOFBFV2dWSG5SNVFIc1haV08yczFZckFv?=
 =?utf-8?B?L1R0OERwOG0rSnNhTzQxQkhJMjdheFlzVVVDbGVlSXRaRjB3N0h2SE01WWZ6?=
 =?utf-8?B?N0ViUUhJak51c0hjcm4xMnlkVEJ2Zkc3elZhZkZZb2dEMHU1M3o0SzRJLzFT?=
 =?utf-8?B?TjM4N2F3cXY0ZitxbTlhc1RNUXZaYWRsSUs5V3dsYUczZTk3azFEQ0RqQWd2?=
 =?utf-8?B?bGg3QytKYTV4SXIvbDNIY3p2N2xieGMzcGc1NGpYZWFTWGF3RHpFSjlBQzB5?=
 =?utf-8?B?K2VtRFA3aFl6ZVlxRWcvVnNjZnYyWVRsUEZkdklCVGtEUENLdlF3MDlseElx?=
 =?utf-8?B?TFhlbWora1VYeVNJSTkxeEt4RTl5NTY5VnFsVFlGTFQzbTFkWkkyRkZZTUhZ?=
 =?utf-8?B?ZGVOTmJUT0xDNDFxRjZ1U1lZR3REMkd4MVVIbTFzNVh5YlVodWFGeFZzaHBa?=
 =?utf-8?B?bVlVRWtjbEhVSEF4elZ3SmRUcklTUkxTY2pkb2ZKUWpiczB3VmZiOWNtNlp5?=
 =?utf-8?B?MkJnYmxSYXhvelRoTjV4UlVWdTIvRTc1WVZKZ2FCM3gwSVA2enZka1VVL0NR?=
 =?utf-8?B?N2p4YVBBb2hyMHVEb1ZvT2tDR3R4WWliN0doZ0NKR2J1SlVJSWUxK0RkeTRa?=
 =?utf-8?B?TGlWeE1velZ0UXBqU2pMMnhVQjdtKzhoT01MTFNvUHlUV0ZnckVrS2JtcThG?=
 =?utf-8?B?V2NHS0x4ZVROSXFjSzNuclVzc252NUpVOW0xUm5hSE1uY2Zpa3VwNWovd2N6?=
 =?utf-8?Q?FF96hR9B0ru4DgGTj8SxDFWAm?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c5a84fd0-b6a2-4cd5-bada-08dcd1afeda0
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5311.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2024 15:47:51.7833 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uI1zXKKRjpJA3TUk5bNiXsNRZ24UpH7frRwkZdSP1q2ev8+MlWE2sE6SLiSqyn0P
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB8232
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



On 2024-09-08 19:30, Mikhail Gavrilov wrote:
> I have done additional tests:
> 1. The computer does not hang with 6900XT instead the screen flickers
> when moving the cursor.
> 2. The computer does not hang with 7900XTX if I turn off VRR. But the
> screen flickers when moving the cursor, as on 6900XT.
> To enable VRR, please set 'variable-refresh-rate' in
> experimental-features, and in the Display setting, enable Variable
> Refresh Rate.
> $ gsettings set org.gnome.mutter experimental-features
> "['variable-refresh-rate', 'scale-monitor-framebuffer']"
> https://postimg.cc/PvXYdvGR

Thanks Mikhail, I think I know what's going on now.

The `scale-monitor-framebuffer` experimental setting is what puts us down the
bad code path. It seems VRR has nothing to do with this issue, just setting
`scale-monitor-framebuffer` is enough to reproduce.

It seems that mutter with this setting is opting for HW scaling rather than GPU
scaling. I see that "Find the Orange Narwhal" sends out a 1080p buffer,
which with this setting, gets directly scanned out and scaled by DCN HW to 4k in
full screen.

An oddity with current gen DCN hardware is that the cursor inherits the scaling
of the HW plane underneath. So if mutter requests a hw cursor with a different
scaling than the game's plane, amdgpu will reject that, and likely force mutter
into SW cursor.

My offending patch changed this behavior by rerouting DCN HW pipes to
accommodate such a configuration. It essentially takes a full-fledged DCN
overlay plane, and uses that just for the cursor, and thereby freeing it from
inheriting things from the underlying hw plane.

My guess is this causes flickering due to how DC (display core driver) handles
updates; it needs all enabled planes in it's update state. However, a KMS cursor
update will only include the cursor plane. It's likely that amdgpu_dm only adds
the dedicated cursor plane to DC's update state, leaving the game's plane out.

The fix isn't exactly trivial. If I don't get anywhere before the fixes window,
I'll send out a revert.

Cheers,
Leo
