Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YOraL8Eoe2nRBwIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 29 Jan 2026 10:30:41 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 730FDAE273
	for <lists+dri-devel@lfdr.de>; Thu, 29 Jan 2026 10:30:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F0D9910E809;
	Thu, 29 Jan 2026 09:30:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="iSKtfG5m";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SJ2PR03CU001.outbound.protection.outlook.com
 (mail-westusazon11012028.outbound.protection.outlook.com [52.101.43.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DFAA310E809;
 Thu, 29 Jan 2026 09:30:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lGadpIuWy9Og3JOqomYEPj7oMRlQEaktkcOpqIVyjnPLGgf3AtL80q0FmvEihgt51e3hygEsrc+iK2y9A3U2DVM/+weFm25gEjazooJN+dc0++WS8nSbcgv+zWxw1sFni3ESZQvcgBtn8BY5nKKDKOfxbwwDLoq2WoAT6/sQnbI42sRyRSFTp5wuXKzmcM/Nq5qlLys1H3BuSp2fm3KKAxuYs7Fs+55ELDICdX+gRFngDY79kFRiYM1lzDNndGePZvwUayXuFnHR45LlPhyueICobjU03pR4TlXJeB8kNr+SgKg6oUY82yHohBFBhS+u/TERedteM8EEqGariGqp6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bN4teb7pCeAapbf+wrtke5OFsudzwp2eIE/fS/mHsyw=;
 b=t25i9F5VZWfyMjAL2eBJkEk7UP+BFP05zURaP+UoCz6iZ9kMvkbBxyXK1scymNC43xTcW+U57FJtbivzTG53eHcb7QsCnnROvSY0Kw6MBB0mEBS3CgkftritdCumtKBpOFdsY6AbufnGmFg27BMo5b11X1W0Txr8xtid5KTDsKd5zafLDHJ506KtU9uC2P7DwLhFwWMg/uw0Uc3Qypq6M5pjac05ig64YTlkmpghrzjf/CF2qUmkh+W30bB9lGTAqArQykrHS5twkiZPWH2WZKnYOpUrk9XGtu3R7KH7jvtdNmV3w5LqQLYWcJA+s4mMcd6JOtEgi1VzL0mmliMngg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bN4teb7pCeAapbf+wrtke5OFsudzwp2eIE/fS/mHsyw=;
 b=iSKtfG5mOBE0KIvM8hdyV21rFqQlXiX6HWtU2QsdZb9qhPdykdGUN3VEgt3Ya4kYgFXa2UcCPk/8McsifyCJmHLBVczykn27gc6rJ9aAFtPXPXWCor8k6wsnaJf3lEnVYvfHKK0tauO2dKFdyMIYIU2L1uJqPiqdr1FzLY1YFWA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by SJ1PR12MB6121.namprd12.prod.outlook.com (2603:10b6:a03:45c::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.15; Thu, 29 Jan
 2026 09:30:34 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%4]) with mapi id 15.20.9542.009; Thu, 29 Jan 2026
 09:30:34 +0000
Message-ID: <031ae8a1-5608-4993-91c2-c5945bd6f7ad@amd.com>
Date: Thu, 29 Jan 2026 10:30:28 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/amdgpu: Use kvfree instead of kfree in
 amdgpu_gmc_get_nps_memranges()
To: Zilin Guan <zilin@seu.edu.cn>, alexander.deucher@amd.com
Cc: airlied@gmail.com, simona@ffwll.ch, lijo.lazar@amd.com,
 Hawking.Zhang@amd.com, Prike.Liang@amd.com, le.ma@amd.com,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, jianhao.xu@seu.edu.cn
References: <20260129090542.907623-1-zilin@seu.edu.cn>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20260129090542.907623-1-zilin@seu.edu.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0324.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:eb::14) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|SJ1PR12MB6121:EE_
X-MS-Office365-Filtering-Correlation-Id: 445b81bc-72be-40d8-e604-08de5f190d75
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SXFOS1RoNEFKd01VMjFIenExMzk0NmNTNWVXRWdKNEFERXRmWlNhWTVHTHVQ?=
 =?utf-8?B?RWRxK1Y3alpFSG1rdHZkLzZkcTNxRERLTUR5U0xDbzFyWXFOWXBYTHU2MUt5?=
 =?utf-8?B?cTIwL3REVlFqSm5pSWxVWFpSNDVEYXJuc1BJYUlRQ1ZuUTVkZ21IdVdpL1lz?=
 =?utf-8?B?NkNvNFUzb2hrdGlSd2pVMVpPaUVCcUdFbWtHcmZkVFcvOUw3RVBSQjBqR0c2?=
 =?utf-8?B?cngyNWxoRS9XejlBMHhXSkkySHlmMkVhMFpBaWVjdnRpRXZmMjRPY1VrR0VG?=
 =?utf-8?B?QVA3N2dnRnVJUzk2NGRaVmtaZXI0TGl6eXNCejEva2syQWNyUTR4TDdYejYx?=
 =?utf-8?B?ZDV5ajlrd0ZUSkhoOUpPR09NNVRmbG8vNytveUZocE0yVUp5dnQxYi9YNS90?=
 =?utf-8?B?dXBwQjBIL0JOMjRrSzJRWjZpQVMxaGNJNmk1a01PMitaayt0TjRvWHB2WFFt?=
 =?utf-8?B?Q1dEVHlGSXFBMWR2SHR4UHhjemFINVJnTk1UMk9hVWZUVTkvN1hHc3h2dDFH?=
 =?utf-8?B?Nm5SSnFPL2dxeHUzQVJjTExmWVBLWHh6a0JDazB2NEtUY1AzY1RGMXdIU0wz?=
 =?utf-8?B?Q09lMW1jd2tnenJhdHNXMk5WbVErcURaaUZkWmpLUW16RW9Ec291U2FiL08v?=
 =?utf-8?B?NFpBbmMvTXNmYzRSMitGaEptUFZLN1ZzVHNicWdNUkJlUkFCQnBlbnBjSDBu?=
 =?utf-8?B?cGtMUmF3MXV4VDJ5OUU4NEw5eFdBa2p2dndPRUU0RitZaXJpMjY5Vklqd1pD?=
 =?utf-8?B?TTZEUzR0ZENHRStLTjdBdDRYS3RncllJOU5SOEl2dzVnQ2hNc2lZQktKRytP?=
 =?utf-8?B?T0p5akdSQkRSbk5WRUFlM0kvS1BLVHErVFd0TlZKN2x3cjZsdHBXNmxEV2oy?=
 =?utf-8?B?dlZzV1htbVNmbGNxY1ZWNG9kd29zREZscWc0TXY4bkkrbS8yNVV5ekpKczJN?=
 =?utf-8?B?WEN5SlFpM2NwTkNLQm1RVDV1dEc2UEpOb3ZBNmlMYlE3UTlsZTRjNGVyNFlU?=
 =?utf-8?B?SXZSTGk5dHJiemRUWW9KMGtlOHRnOWhodENuWHlYckM1bDF2bkEvNWlqOE5Z?=
 =?utf-8?B?aTRjVDhPaWk3Nk8wVUNRNlFhdDQxRzkwYTJzSE82SExEbHhUcDYzRmVEdVl2?=
 =?utf-8?B?OW5IOWRpazlpNitqSmszdlRIQWdmOHJvY1c5N0ptWW95MVpoY29QUmxOc1Jx?=
 =?utf-8?B?SkZGWDhDNDRmUjZxZE1GZkxYMU01b3k2QjdoZUxyMzRnUnFvMWhROVFaY3d4?=
 =?utf-8?B?UU85VHFJaVVRVlFCSHhpQXhpc2tNTXpvcExzRW9ZM1FJOUs4NEZHSXIxUjR3?=
 =?utf-8?B?VVdFYjAwK3BMdE4wRlp0U29ockJoSDRhb3dUTS9JVVNaaWNMQ21YeUdwbGlQ?=
 =?utf-8?B?TmRIZW5MN2ZSNWg5YWsvYk1jSzF1ZlVWYXZ5OHJadWl1Vzk2RXNtajZxZDkx?=
 =?utf-8?B?OE9Za1gwU2YzeHpkc2hKVU5scVlMWHY4ZTl3TEV1N0ZINS9XRjhIZzlENm1x?=
 =?utf-8?B?OEpZRGJHWTEvS2oyOElqM21WM0VLbnFSTmlUZysxQWpkVGNYNDY0blpJK2hs?=
 =?utf-8?B?UUo0UWZidm0wMGwzVVduaGlDaHRMQ2xMQjAzdisrVm8yb25VR2g2a25YcVJT?=
 =?utf-8?B?cFAvL1VWRldBaWtDVDNLd2lBZk93Nk9lRTJYQ2tpTjl0ZC9LaVJDN3g2b3VJ?=
 =?utf-8?B?NEpKYjF2YlhIZHVIY1dCTFp4Uzk3ZFBCMStTdWhkSVBlZGM2bUp6UFREN2tp?=
 =?utf-8?B?cTNXUk9XOUZoclkxR1RVU0dJQithTzBGL3VmUUQ4ZlNGYVkvOFpGMGdMT2dk?=
 =?utf-8?B?di9ISkdQSzFYaGFaazhtOTg2U1J3VUlmTVczcjZCZE5raE0zczh2QmhSZ2FD?=
 =?utf-8?B?QWZSY1YwN2hDK1QvYTVpUWsycG5CWmw3VktpbkpjSDFvdHZnMkpwZFRnUlpR?=
 =?utf-8?B?QnFQUU9FVlA1TFhiZGdDMjBnc0dDN0cyVGVZUURuNldKS05iUGsvclhkK0pM?=
 =?utf-8?B?SFFUcU55MHNRZ01xK1R0bmRhZzlYRTl4dHkxRnkyM2dWNDZoNWNpTEhKZHRx?=
 =?utf-8?B?bjNqdkxXZklaN3h5Y0tFTTFJb2R2OW9ST0svSmFwMmFNaE9MbTI3aVVHY0dk?=
 =?utf-8?Q?sWpY=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZC9EWGY2bHhXbVhPeGN2YmFFbm5oVkN2MzRnQ1NIcTh2Tk4vY0txckIxdUhr?=
 =?utf-8?B?ZVVzaDBKTGNVYVVRNkJDK0J1cngzQ0JyVURnS1R6djg0Tmk3b2d2WEl4dy9u?=
 =?utf-8?B?aUl5QUNuL1BXR3F6VXBqRlgyZkkrMXlqakZrWFhwUTVFQmtKa25LS1VVbVBn?=
 =?utf-8?B?SUhGanV3d25nRjloTUI3dXlEdlBNKzdVaG9vOS9SZkh2NVZZWndFeFNRdU9K?=
 =?utf-8?B?QWpXUU04clUyckE5ZXQzeW1OQXRlaEp0UGhYYld3TkhIalZ1OXR1Y1lQZFNi?=
 =?utf-8?B?QVBBR2ZwU1BkamZsOFF0SWJISWRXMTRhZUpFMnN0YS92dzJuMEwrSkl5VGdO?=
 =?utf-8?B?R0JJbHpMSnlOTW8vdGV6dkFTektJV0R3TVQ0TW1UMjlrSVlUemk2VCt1aHpX?=
 =?utf-8?B?YWE3dmNuRHdYck5OSFlRMjF3ZHFpdFQ2WGN6YlZMOHZJSWJyS1NKbnh6UzVp?=
 =?utf-8?B?TFJ4ZjByaVRTYzFqWjRtMWRoOU9pNGQ3cW1nVTc4ZXluWGx4aXg2c3lEMnEx?=
 =?utf-8?B?eVlVRVNxNTBhcHlwMEFraUJyTnBhMEVsd05xK0FBSTRUV0hhZnJTZjVzYVB1?=
 =?utf-8?B?WUI1Nzl0WGRFUXVHNWZ4UE9td01wS216Nmp2TXJVRlRUd1lNUVpMTmVTbXpu?=
 =?utf-8?B?SlJvMVZyZXYvWkoyQUk2eXRla2VyWnNpNEhUZmhkZXo1bWlYK1ZFTXRjWjBt?=
 =?utf-8?B?QkF2U09hUzFuTW9xVW5ENEVTRzdIeElFYUtiQ2I1Z2pPbEU4OHJGY2JZcnZ5?=
 =?utf-8?B?NXJjV3pmSGhMUHFhZVhnK2VQYVZoZm8wdzdmSDUzNGdJWk8yRTBDMkI5dXdC?=
 =?utf-8?B?YWtRNXl0bTBYN1RBQ01NWEpIc0RsNjc5ajlici9lSTNCaCt5TFZydXpJZko0?=
 =?utf-8?B?RUdyaHNhNjNLT1FkcEYxeGpjZzNJNGxqYXlyY1BjQ3dyanJKN0VEM1NtR01Z?=
 =?utf-8?B?WlVVUHk2TVc1NzVleU9PWlByQ2ZwWnM1V2Vzd09tOFVBU3paMWI1MkVHT0FD?=
 =?utf-8?B?QVIzK2xrS1J6RGZWZmp0cE5xQUIvN3QrRjMxT3NZc1VwQm1DY0VLVmVkU1pw?=
 =?utf-8?B?bWNwK2cvbFI2VE5ZZjdpQytRWkxsMXA1MFVNczdWeDBHVUZmZ25XcjQ3VGM5?=
 =?utf-8?B?S29SdERORVNqODBrOWdNVEoyeEJSTGljeDhrWXZncUtrNmJDcDNiZ29JOVNr?=
 =?utf-8?B?Q01CcE5mM0N1Y2ppQmZMRGlya28vVS9lWDdzZDhZV2Jjc25XaXl4VzdLRG1F?=
 =?utf-8?B?UzUrTVZvRzY5ZVE4QXE0NXFUczBkK05mQWw3UFZJdjBCVGpUazJKbmlSSXVL?=
 =?utf-8?B?eHZCeVpLU0I1VDFFbWJlb1pqbVBsbEF4SDhLaXZxYmNmR2pSOFFsSXR3RXRE?=
 =?utf-8?B?OXVTZHRqWUlkLzhIMTJlMVovbG9tMDMyVzdrQlVsZW5zTi9Pem1aN0xPdHFW?=
 =?utf-8?B?YnB6K1Qvc05iUitOcGhaZjVYQ212enRmVW9LNGpZeGhTeFZMZTIvZWk2Z01S?=
 =?utf-8?B?bWp5dWpCU0RubkdUYUJjV3dBQjB4MWE1UU9mWlBiOXphaG1qQ0Q2TWorRGYx?=
 =?utf-8?B?OFJyWmZVVDVDc1BBNkkxMldiaGh3Y3hhOHF4NTBleFRqaC9pYlJFM2REK2tL?=
 =?utf-8?B?bUR1YXRMMEd4K0wrb2UvcVFlUEc1UjBGVEpoRjlqWmdxWnM0SVFqdStZb0Jr?=
 =?utf-8?B?OG5RNVgxbjlob3ZFWm1FNzVnY0N0RHZFU254aFNlVXVCOGRubi9QL2dZYUdF?=
 =?utf-8?B?Qnl3b1dTbGRhMWpaa1Z5SFJiM2RERFpxaGhNVDFaeXNvTGZOM3g0MXRpS3lJ?=
 =?utf-8?B?c2RoaGp3M1RacUNzQWxOczB2WUgzbkdPdnVBbDlvSEVZNVp6Mk1UWkxHdVFa?=
 =?utf-8?B?NEtoVFcvOFdXb0J4ZStGR2tJUWk2MTRodHFTNVNvcGFFRUVKU05ZclllQzAv?=
 =?utf-8?B?MlpOLzh5ZFYydDkxNFFYU1BRNXNiemw4SEtmWDVzaVdTV2UwMDlGQ0h4NGho?=
 =?utf-8?B?K245LzliRDZ4c0hveUxuNlFZVzVDMUxzVXQxQTFSNnNmS1RLbU1ycUE2TVdu?=
 =?utf-8?B?VWNhRUVCLzVEdjBBUmt6QlcrZ1hFZjlKUG9pVlYyZU0wSktLL3llM2NCRmk0?=
 =?utf-8?B?R3JOUzVNZXozU1ZiOGRPWHNTaW90YmJoT0l4TWdYcmtpRk9nbHhGWExkYmpX?=
 =?utf-8?B?Y0t2Z1ZtZU5hNTJxVmVHTngxOEd4MzZjRURqU0N4c1ZsL3hmUUNRaU9WR1d6?=
 =?utf-8?B?bEFzODFGMndtNEpkR3ZYZUJvcWJHaGFOdjlsVDk4ZWQ2UDhJVTNOdVZxNlp6?=
 =?utf-8?Q?e3uR5utH8479Uww++6?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 445b81bc-72be-40d8-e604-08de5f190d75
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jan 2026 09:30:34.0551 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rEjy4hpPUtHVBI5xayUzUWENw2/CiUaNP7mEDl0aRd4ooDsLvaA38jif+VN6ZYLT
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR12MB6121
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
X-Spamd-Result: default: False [-2.31 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	FREEMAIL_CC(0.00)[gmail.com,ffwll.ch,amd.com,lists.freedesktop.org,vger.kernel.org,seu.edu.cn];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	FROM_NEQ_ENVFROM(0.00)[christian.koenig@amd.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[amd.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[seu.edu.cn:email,amd.com:mid,amd.com:dkim]
X-Rspamd-Queue-Id: 730FDAE273
X-Rspamd-Action: no action

On 1/29/26 10:05, Zilin Guan wrote:
> amdgpu_discovery_get_nps_info() internally allocates memory for ranges
> using kvcalloc(), which may use vmalloc() for large allocation. Using
> kfree() to release vmalloc memory will lead to a memory corruption.
> 
> Use kvfree() to safely handle both kmalloc and vmalloc allocations.
> 
> Compile tested only. Issue found using a prototype static analysis tool
> and code review.
> 
> Fixes: b194d21b9bcc ("drm/amdgpu: Use NPS ranges from discovery table")
> Signed-off-by: Zilin Guan <zilin@seu.edu.cn>

Good catch!

But i think we rather need to question why amdgpu_discovery_get_nps_info() is using kvcalloc()? I have strong doubts that we need vmalloc() here.

Regards,
Christian.

> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c
> index 7e623f91f2d7..cb0d1ac148e9 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c
> @@ -1382,7 +1382,7 @@ int amdgpu_gmc_get_nps_memranges(struct amdgpu_device *adev,
>  	if (!*exp_ranges)
>  		*exp_ranges = range_cnt;
>  err:
> -	kfree(ranges);
> +	kvfree(ranges);
>  
>  	return ret;
>  }

