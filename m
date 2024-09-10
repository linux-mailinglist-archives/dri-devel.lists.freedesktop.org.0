Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 163E597449A
	for <lists+dri-devel@lfdr.de>; Tue, 10 Sep 2024 23:11:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D354010E923;
	Tue, 10 Sep 2024 21:11:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="CFFE+uJq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02on2044.outbound.protection.outlook.com [40.107.96.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A65110E923;
 Tue, 10 Sep 2024 21:11:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=H2ljKMusdwtdIbDAfICZxY3gougJd4SV6YDKeD9jakEpoLN17NVaswjUpBRkhBYX2A1pzeDzkqx9f+qeE9SMWls4XK6pGTu1fQjm/0u3pgCPdEx/gQMSNOQkBefbRDoPG/4caP5hPj91hoSmz5s1oSBd/ZE1E3Kagbp25oW46CEZCy9+T+U/Xh6+1aqQkKRYfrTB1rXFSSkQgKRxOCgTtpkHC5dwIDC61isRFlcrK7EXBzBWLliGF03wqHUcU/y0aAIBG711dvPfB8cWOVVNMf1XDv5Y2FDMABlhDbNS0ZH8w6mZ7xs0CAjSe4QaQc3SVagnxTneusbnkotqprTA7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tSU21KnsWofBjK5DC/7rQs1et6CvyKR8gUXExFHInnM=;
 b=vS70FpyHzpg6BmaP1u7FWxxj8TYZHs4AD4hKOaHYkgaTuYWdTA/348c6E6lD0IwR//efFk36DwcqPm4WLoclZSusYSv7wdgYyYmqZ+NN7l0DD+cdnJttGFBnuol3x9okUcuh+jmcD9pP1MRy2XT80l6MeTQiar56HbDygwthAercCRLR+PMzeJstgKCp2DFOkYTBvjUmSEUSev7LDIaAfhls0fKYZ97hWY+R+gY0dcySrVnYn4hNNRAL2qK4RRbpzmnfypulHiIm21LOIZ1+8QbkDYIwcdB+/C58PkEUK9wKfYHg2uQAqdM/TjYM/iqhr7Aiuoo+A1lIoxBiFGwlZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tSU21KnsWofBjK5DC/7rQs1et6CvyKR8gUXExFHInnM=;
 b=CFFE+uJqUzjSCuAcwgNPrYxkRPJwdkrbSQN7lNaaMo3ugdO5muWTvLy8txpB8id7Z61tpcp9A25dYm0CaPZG26z9PAKMK59gwLAmqj4QPyUaMAu0huaFYU9qdyoxf/Yq06xODmBfcm/xFd+urZfpUIIGm8XpwVVxiyRPp++z4RE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CH0PR12MB5300.namprd12.prod.outlook.com (2603:10b6:610:d7::22)
 by SA1PR12MB8700.namprd12.prod.outlook.com (2603:10b6:806:388::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.24; Tue, 10 Sep
 2024 21:11:46 +0000
Received: from CH0PR12MB5300.namprd12.prod.outlook.com
 ([fe80::5313:a4b0:89d7:7b76]) by CH0PR12MB5300.namprd12.prod.outlook.com
 ([fe80::5313:a4b0:89d7:7b76%6]) with mapi id 15.20.7939.022; Tue, 10 Sep 2024
 21:11:46 +0000
Message-ID: <6db472e4-cd90-4ba6-8368-725b10ba5b4a@amd.com>
Date: Tue, 10 Sep 2024 17:11:42 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: 6.11/regression/bisected - after commit 1b04dcca4fb1, launching
 some RenPy games causes computer hang
From: Leo Li <sunpeng.li@amd.com>
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
 <eeab54b4-c055-4992-9ca4-f9e382db68c4@amd.com>
Content-Language: en-US
In-Reply-To: <eeab54b4-c055-4992-9ca4-f9e382db68c4@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YQZPR01CA0049.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:88::13) To CH0PR12MB5300.namprd12.prod.outlook.com
 (2603:10b6:610:d7::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR12MB5300:EE_|SA1PR12MB8700:EE_
X-MS-Office365-Filtering-Correlation-Id: 59fe02e7-c64a-4110-c800-08dcd1dd2d19
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TlJ3a1dwTDhEVmRmbDV5RnNEV3EvcHkvMWdlT0pSNjFHS3huMFRHZTNFS0RF?=
 =?utf-8?B?M0hFZVVGT2VONWVFaUZqcWtlYkNYQXE1RzF4ODgrNVdDd3hsNWtMUVVmZ3JJ?=
 =?utf-8?B?RW5BWEhoNzBjeWxIcysvbU4rZUNIQ01tWmNYa0JQTGNVZ2VvSHJWMnBCL2pM?=
 =?utf-8?B?Rkp5WTQ5L1lXdjNvRjFEZWVnakdPWDhiY29TYTRZcTVpMkZ1U3dNMnEyT1FR?=
 =?utf-8?B?dzQ4MWRzSGRwdHV4NzF2RjAxc0wrMlRzUjRWZ2lsTnhOaS9QTWczQS9WR2pB?=
 =?utf-8?B?MVRiMklSbHhxSGFYVUVVcTg2Um9mZEU1ZUVKeVl2MTg0U0sxTXRWUEQ2OGwy?=
 =?utf-8?B?bm9XUXI3UEVpT2FTMXJMekJKV2Yxa09XV0I4TGdqY09rNnVjRy9ZR3c1U05l?=
 =?utf-8?B?LzVEdHgvdVNtUXJxQm96MnFKVWQvWUpHRDhBVmxEUE9qU29QcHNJZDd4LzVz?=
 =?utf-8?B?VzRwcnFkRXRqNDgxNFh2K05UbEhVWmNKNmpzTHRCbjRpWGxUak9OSEV1OFlv?=
 =?utf-8?B?aThuVzU1ZkVnQkNNQ0hCS1hBZ1pCSFV1Um5qT0JzSVN2NTlLUzJYV09YT1Jh?=
 =?utf-8?B?aTR4akJRVEZHdytGZUFNVVpBdkNmODZyeE9nNU1CYm96Myt3ckVlQmsyaHB0?=
 =?utf-8?B?dzJWMTJvcStkTktBZVV1aXBWdnNmbTNDWnJUbXlhT24zM1RGZ3dDQjFFd1Yx?=
 =?utf-8?B?UVJmdEgxcnRXWG8ydnRUcVdPNWZjbUpBVGl2MWZGelE4T0YyTlBBcE1tM3ZF?=
 =?utf-8?B?cmdFM3hLeWFqMVAvYWdyNGlsbWN2alRrQ056MWlyTC9UNElnM3RCZnkzb3Zz?=
 =?utf-8?B?YWhNL1ppV3Irc1JKcVVYZzBpRkwzdnVySnlmdXc4d2c0ZEVTdlZrOU15ZUhQ?=
 =?utf-8?B?VGZSdXUvbkhYMVJRVXpMYnFvWCtUZjdJU2lzNVFDUkFWRGhHekR0T2dtOE5U?=
 =?utf-8?B?R0ZPM0swZVJETVRNVVRpQ3M2WUJlWUwrN0M0MmpteUh0ZVVmSG1LV2RCZGor?=
 =?utf-8?B?U2RlRm16YjA5dklidVMyQzVGQjlKL1FMRzJlaTJCeDB0WURwd1N2aFZ2STVP?=
 =?utf-8?B?bDNZekZlcVQzaGZSZzNPUDVPM1c0YXB6Q2FhWDVoVzVMc3FQZVBoOGRSZngv?=
 =?utf-8?B?YUlUbU94M21KMU84ZnVOVHY2VzBwKzdONzJhVDdPa0FYZGNqU1BXZzRHVG1W?=
 =?utf-8?B?ckw3SDJNL1hiN0JJY2tvUTErMW9nb3hUSDRvdEgvYm00ZWJuQVZCK2FMTGpl?=
 =?utf-8?B?Y09JNkxmU0w5ZWMvVUZPaXdGaGdHbnUwMHpZSG1uZW84OWpsZHZOWTd1Q3Nt?=
 =?utf-8?B?cjVVUkNmVUQ1OHZBcVZSNXNIb1V6dzlUTUxGTmtSd09sK1NQSE5vRTBlVGcy?=
 =?utf-8?B?NTRzNTlGUlE2WU5Mb1ZwTTlqRXJhZFhMYUdtaU1xbjAzRG55VHoxeGs5MDMr?=
 =?utf-8?B?ZGZhT0lvRmhEWE8zeHZhUlZjcUI0Z1M5K3hhL0k3RUx2RENZeGdUU2s5akxI?=
 =?utf-8?B?cmM4ait1a0tDSVo3Z0RsUlQ1Mko2R3ozUzYwRzlZMUcreE4zaFdwMHpsUnVh?=
 =?utf-8?B?cWUzT2crRTJsa2dzT2RBVEcwQW0vcGdldG1mUzlwckJnVEVmRGZwdTMrbzNJ?=
 =?utf-8?B?dFVkZlo3b3FnaWlML1FKb21abGJzREFad1JQUEorTUxuMU9xWjFOemRQLzc4?=
 =?utf-8?B?UnJIQkFMYWNkQUt0WnJqZ1FrWkZua2RhV3orRFpTNjdUa2VXMEcwWE8xaFhu?=
 =?utf-8?Q?cQrLjDVU8e9fSRXlfI=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR12MB5300.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eUhNaWFERDduMVQzc0t1eW9LbEs4Yzh0MlQyQ1laSzZ6US9SRmMrcnNhcFZK?=
 =?utf-8?B?b1VzV04zVEVmMkpaTVZlam94Z3FFV1FOL3lCZlVuM0oyNGRBd3daM2tRNGcy?=
 =?utf-8?B?UHpNMHFIRk9NKzFJU2ZnNGY4ZVZmbW1qTS9hRnJkUllOWGkzcUpmR0J0V29O?=
 =?utf-8?B?UlIxQ3RTbyttOTFmUjk5QlRITmpnRENqek5tYU9jVjIwMlQ1Wjk5Z1FUSnk4?=
 =?utf-8?B?LzE1WnBYbS9BTnY3bnVhaCtaYlhkekR3N2RiZXE0bkZ4R1BzL0k1b1lWZkJ3?=
 =?utf-8?B?MWxCaFFseTFPcmFyNk11VlJQS0I1WUhaRW5JU3V2Y3FacWhQd1lzQVl4a3dY?=
 =?utf-8?B?L28wc2UraURTTFVYc0JVelhpa203SWxBdU9Ec0JURmpZOU5CM2Z3cDVPV09H?=
 =?utf-8?B?RGxnYnBYTVkzelhRVGxtcklvU2dWektmQmN4eFFzUkVyVEh6VmtZTWtzZnZ4?=
 =?utf-8?B?czBuK1FlTDIvdjhQWFhDNkg0dzcyZjFlV1ZZak1MeG9QYitUeGQxUDRGQmo3?=
 =?utf-8?B?MkVCaDVjZ21sMGM5VVJPV3A4SXNmUmFLQ3lHbEVwQlhIc09jL0oyOW9GTGlr?=
 =?utf-8?B?R1VEa2pxQzVoZU5HS1IvdWs5U2ZSenpma01pZktCVjBCWFcwQTR5WldVYm1k?=
 =?utf-8?B?aC85R2wrcFRaQ1VvUEtmZkRrZ1Jjc0xHQmQ1aTBETFMrY3RSQnU2N3E0dHVS?=
 =?utf-8?B?WGhQak1sdnoyclltRy92Q2JacWRBRVIrR251bGJSMXBPa2tueWdEb29qWEZq?=
 =?utf-8?B?cnViSHUzTXlNQWVGcUJlTHd3djlDOXpYcXZmRWVraWJSbGFpUGdnWWN3Ry9B?=
 =?utf-8?B?cXEyVWh6aWQ5dkxKNVRsR2FxM0E2Y3I4WjdvVW1Kb1ViVXN3RjFpOGpna0FL?=
 =?utf-8?B?UjdYSUhNVTl4eWtVVDNHK1h0Q0NXRGlGbUxDZmxvVnJBdnViOTZUS1ljS0Rt?=
 =?utf-8?B?WndqeWZJK0FrOENVVlAyZXNhNTBGVHpzcXRReStScExkaE9KVUxpZVZYYVVW?=
 =?utf-8?B?TEYwT05QRXg3MkFtRXdhQ1J6K1pXaGM5N2F5QlFEM1h1a1poVk1CMUlxc1c5?=
 =?utf-8?B?eVNCUkhwNGZvK01mQndRNXg1bzhhdUwxT3RMMmppRU5XUDNhM2Y0MkdHN2cv?=
 =?utf-8?B?Wk9vU3FLS0V6UElKTHlkdDFsc0pCODBaT0JheDRuU242RXhyTnhXYlI0ZWVk?=
 =?utf-8?B?a08xckwzTHV0b0Z1SUtHRmYycUJ6WWVkd1RPUnVLaHlxbEZXL0NkTm5ZTURJ?=
 =?utf-8?B?UkJ6QW1rNmFHVjFHODRzRnhmdVk0OThIVFltV1JFREFabXpJNDQwWExVQTdj?=
 =?utf-8?B?VWo3MnBSYllQMEkzWXdmNTZmajdrWW5EZTJ0YktXQWZTZnYrVkJtMlRXU2Jk?=
 =?utf-8?B?Q0o1L0JDRXdSSUNsMS9rcWtaN0JIZWtvRTlKNndoZW10K2FUY0RGMU53bks4?=
 =?utf-8?B?amlmVDhkejd5bDUwYmQ3VGFSMXltK2ZCRDRIQ2Jkc0dFR2puT0NuS0lHZk44?=
 =?utf-8?B?NitLQ2ExNjRVRjN2UHBPSmJHbjAyc01KTU5iWk96djU1TWYxWFRSdGxKSStr?=
 =?utf-8?B?YnFhaUkxb3NwWThuZ0FtdndST2hVMXdzRk5tcWNhdWxtVzMxd1J5c0dSZ0xL?=
 =?utf-8?B?blRNb2FjRnlZcEhZUmpQV3FkdzAvTC9UZDVGZ3EzMkN0akNRYk4wOHdDZWhx?=
 =?utf-8?B?eUZXSnpFOTc0bFdtK3hzMm9Vb3ZMcGdRU2o3aVVLTGl2ajA2bkNNWEt2ZllC?=
 =?utf-8?B?U3Q2Umx3ck1iaU1YL2c2MEJGTXhxSkU5OEFVME5SaDBLZDYvSG1WZDNEdzJx?=
 =?utf-8?B?ZkxQNi9rQ1RTYXB2cklUMXdLWEliR3J2OU5QallSdVFueTNrQ1ROeUNKci9i?=
 =?utf-8?B?aWFubEIyM01IZ2VKYnZGVG5uZEtpM05vV0lMeW04UHorTnkzY05BeHU0WUZ4?=
 =?utf-8?B?MTZKZG92UXhwNFI1RXQ1NkNRNnduOXo1N1FHT3pQZmMyNXlGYi8yYVZPdXpT?=
 =?utf-8?B?b3F5VkdmVVBuaElxbDZHOTlHQUpZejByOEM5OTdGKzF6cHArQ09KR3VwL0Iy?=
 =?utf-8?B?ZDlreTNtbWp3RTQxZjI1b0lxY0J6VzBCM0R1ZlJhTXhpd3NDM3M2SXdqOHk1?=
 =?utf-8?Q?d1ZG7xarVKQ2QKpzfSPgAjGCe?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 59fe02e7-c64a-4110-c800-08dcd1dd2d19
X-MS-Exchange-CrossTenant-AuthSource: CH0PR12MB5300.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2024 21:11:46.0080 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: t+LZVRexnu+0t5cY1MzHPlcFvOaKTyAqjxwWihQ53RZFeipI97oiOzVXn8txacxz
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB8700
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

Hi Mikhail,

Can you give this patch a try to see if it helps?
https://gist.github.com/leeonadoh/3271e90ec95d768424c572c970ada743

Thanks,
Leo

On 2024-09-10 11:47, Leo Li wrote:
> 
> 
> On 2024-09-08 19:30, Mikhail Gavrilov wrote:
>> I have done additional tests:
>> 1. The computer does not hang with 6900XT instead the screen flickers
>> when moving the cursor.
>> 2. The computer does not hang with 7900XTX if I turn off VRR. But the
>> screen flickers when moving the cursor, as on 6900XT.
>> To enable VRR, please set 'variable-refresh-rate' in
>> experimental-features, and in the Display setting, enable Variable
>> Refresh Rate.
>> $ gsettings set org.gnome.mutter experimental-features
>> "['variable-refresh-rate', 'scale-monitor-framebuffer']"
>> https://postimg.cc/PvXYdvGR
> 
> Thanks Mikhail, I think I know what's going on now.
> 
> The `scale-monitor-framebuffer` experimental setting is what puts us down the
> bad code path. It seems VRR has nothing to do with this issue, just setting
> `scale-monitor-framebuffer` is enough to reproduce.
> 
> It seems that mutter with this setting is opting for HW scaling rather than GPU
> scaling. I see that "Find the Orange Narwhal" sends out a 1080p buffer,
> which with this setting, gets directly scanned out and scaled by DCN HW to 4k in
> full screen.
> 
> An oddity with current gen DCN hardware is that the cursor inherits the scaling
> of the HW plane underneath. So if mutter requests a hw cursor with a different
> scaling than the game's plane, amdgpu will reject that, and likely force mutter
> into SW cursor.
> 
> My offending patch changed this behavior by rerouting DCN HW pipes to
> accommodate such a configuration. It essentially takes a full-fledged DCN
> overlay plane, and uses that just for the cursor, and thereby freeing it from
> inheriting things from the underlying hw plane.
> 
> My guess is this causes flickering due to how DC (display core driver) handles
> updates; it needs all enabled planes in it's update state. However, a KMS cursor
> update will only include the cursor plane. It's likely that amdgpu_dm only adds
> the dedicated cursor plane to DC's update state, leaving the game's plane out.
> 
> The fix isn't exactly trivial. If I don't get anywhere before the fixes window,
> I'll send out a revert.
> 
> Cheers,
> Leo
