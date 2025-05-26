Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 44943AC3B82
	for <lists+dri-devel@lfdr.de>; Mon, 26 May 2025 10:20:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1BB4F10E293;
	Mon, 26 May 2025 08:20:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="FCqL4e6w";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2058.outbound.protection.outlook.com [40.107.243.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 80CF610E293
 for <dri-devel@lists.freedesktop.org>; Mon, 26 May 2025 08:19:54 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=brs5fsJ/xuXn2vXFjseqNC0HxZLnpzeN5kx6GJwolPy56VsEixWgJlSBLLiKeH8O7zh0UTD56tldaHLulEp5KhHhAsdcTSr/ybs08TzFuHLoCc/bxUuZ5dMt3995SYu2gIokn9g/LyRRVDQv6xF5QJoRv91WjkrTHz5MPxYBQhKps/R8wkDw5q9GQ5s2MlIP7+jjNPVSznFxkX8iP4C3t/1TluvbVwdiqd5GoSrv4KtNKuC7uFkgXs0DTBKHH6tpsCwsCXsvMO43y9wDG/r2asenXRuU7n/HyNE1BJ3NvQigPCszjySL6PWsNJakNTPPYRGc5uR2kzz/7mHCQVfOFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=anwdl/W8u8BjR7WgVogT5UFsKWCVjMHSpYflaDUdFxU=;
 b=bPKbL4/Au1wUeTYcLCkL2qW47VZlCskQvghApq9fxgUgerwYcCzgRCLu2stNsHoIMsP6XfWkMxY1mIfyIxY3X4Uo+2zxryZUsIYodqSGFAxGzBPWbX/owQNYCnXVGVBb8Z+ky78+I2euDKRQQ2l4d2TEhreyM3l+e1g69YS5f14F7oLzRElBM4UQyhhKD2jtpHQEdhXf7bxavdmQCny1msKM6AlAOZr8rmh1EWJzaN+l5BEfrwzG9L7lhAC+4f7ZVw1UI9RGgxRO47n/yGdM2j2OYOictjIIM2cXNkLXNr4B9ivJUQUe6geoc8xG6ADuUtwsr8hRKrov9qMOsZuaHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=anwdl/W8u8BjR7WgVogT5UFsKWCVjMHSpYflaDUdFxU=;
 b=FCqL4e6wuAP1/ji65azbwEBxJ3RuJJZNs3woKAzA40J8Gzt4dcWCi5+Vas98Ov1agiOaia+iiYOqe3AoucthsJVLm7Y5LEzUJGbdY6c9abDm36PApYv/q9QoMyds7BjGJ+tsWdyU6Sa0pEW1NqL9bNU1DG5uMIwcIIZYOVdIRSk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by CH0PR12MB8531.namprd12.prod.outlook.com (2603:10b6:610:181::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.21; Mon, 26 May
 2025 08:19:48 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%7]) with mapi id 15.20.8722.031; Mon, 26 May 2025
 08:19:48 +0000
Message-ID: <d21be860-9cb2-4c21-af30-2c724ab58756@amd.com>
Date: Mon, 26 May 2025 10:19:43 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [rfc] drm/ttm/memcg: simplest initial memcg/ttm integration (v2)
To: Tejun Heo <tj@kernel.org>
Cc: Dave Airlie <airlied@gmail.com>, Johannes Weiner <hannes@cmpxchg.org>,
 dri-devel@lists.freedesktop.org, Michal Hocko <mhocko@kernel.org>,
 Roman Gushchin <roman.gushchin@linux.dev>,
 Shakeel Butt <shakeel.butt@linux.dev>, Muchun Song <muchun.song@linux.dev>,
 cgroups@vger.kernel.org, Waiman Long <longman@redhat.com>, simona@ffwll.ch
References: <20250515160842.GA720744@cmpxchg.org>
 <bba93237-9266-4e25-a543-e309eb7bb4ec@amd.com>
 <20250516145318.GB720744@cmpxchg.org>
 <5000d284-162c-4e63-9883-7e6957209b95@amd.com>
 <20250516164150.GD720744@cmpxchg.org>
 <eff07695-3de2-49b7-8cde-19a1a6cf3161@amd.com>
 <20250516200423.GE720744@cmpxchg.org>
 <CAPM=9txLaTjfjgC_h9PLR4H-LKpC9_Fet7=HYBpyeoCL6yAQJg@mail.gmail.com>
 <aC-ALtcs8RF1yZ1y@slm.duckdns.org>
 <de476962-194f-4c77-aabb-559a74caf5ac@amd.com>
 <aDCrLTNoWC8oSS7Z@slm.duckdns.org>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <aDCrLTNoWC8oSS7Z@slm.duckdns.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0122.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9d::11) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|CH0PR12MB8531:EE_
X-MS-Office365-Filtering-Correlation-Id: e61e0c58-9d31-4d2c-b7e2-08dd9c2e1474
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?K28zbEdkbWMwaHZERTFXbUpuRWkweFgxNk9uMkI4NjBRaU1CNWN6MjlDMU9O?=
 =?utf-8?B?MUpyQkNWcG9INnhzcitnUnBlSFdRRElLM2FiLzVPRTBCSjlrL3JmRlk3STgw?=
 =?utf-8?B?eFJDbzZwZS9QekFHbXh5SnNvMjRFTFN3Y0dYTm96Z00wajhCYlB3TkNCZnBQ?=
 =?utf-8?B?Sm1RaGZodHFYSVBoRkdvVkxsNVRIcEZHQkU5TklKdDdoS2tWWFJBVnI4aEZa?=
 =?utf-8?B?RE5idjA2MnpRTkRiWTdlYWF6NFZBbmNsNlJzMTFYYWNXNDg4TitLLzVEcS9q?=
 =?utf-8?B?cmZMV3FKdUE5YVZxeUlGR0M5SmRBV2pTWGdOdE9vejM0QjhtbTFXRmRFcEZ5?=
 =?utf-8?B?a2xtUDdQOVhKNHhyWmVxeVJlVFZqR2ZmUFcrZFJjYVU5ZmU4MmwwN0NUZkV6?=
 =?utf-8?B?V2J4Nll1aDlSeGwwUzk3V3pxemR5VXZVSWZ0K1Y1N1RUaThpcEwxaVhzdnpn?=
 =?utf-8?B?TUFuRU9qd3FqTGh1Q0hiaWsrTkN0UG53ZUhWZGU4RG1Od0lZVitxa1lwOHhD?=
 =?utf-8?B?bll2Um5FcitJSDdSeDNNdis1Vnlidm9DZVAwZjhSTi9YY2hWQThkSCtNMlh6?=
 =?utf-8?B?QlNZeFkrTXhhWUg1WjBKUTh1WmFmNmkzWStZT1hrVEJrdjFISWgzcC81TFdG?=
 =?utf-8?B?Unl3MzA5RVg5UlRyZXN0MlFkSnE2T3dUakNXbU94Rlg4Unk0YkRaRG8yVUM4?=
 =?utf-8?B?dElMc3owZDFJcDRxUDVKWU9aR3NyRTJoVUowb0g1N25aS3MxdTI4SjBralZS?=
 =?utf-8?B?cS9OR29LWURQVEpLeEg4MVpTU1pXYlZPSW9PenV3cWMyMlBuNzFwQzBrUWJM?=
 =?utf-8?B?Z2RZRXNoV0txcEQ3M0tHbzRjaWQ0eGh2em42SFhyYkNoRUJsL1pZN0dWdlI3?=
 =?utf-8?B?NTdFclFWMDgrRWJUUUQxK1BUUnROb0trMGQyaDMwdENrOEFRcDEyUzdNKzBq?=
 =?utf-8?B?NGFBSWxtVmhSM2tXM3poaEFCZ2dPUEJ4VjdVSUFMSWFWYnZzS3N2dVpBb0pu?=
 =?utf-8?B?ekZGd2lGd2F0RnoxU01wOEtPVStIL1B5L1JKeUZhdXRKdG4xb1paU2l2NFgy?=
 =?utf-8?B?S2IyVjcwdU9iT0FGSUlMRE1YRS82azNsQW1IcWZJWDNwKzBySTcyR3RrSFBx?=
 =?utf-8?B?R3hYTHBIU3crdVN4dTRpMmRKWm5RbVRVbWUzdXQwM2V0Y1M1M3lsUTdsZWk1?=
 =?utf-8?B?eWJESUxoaWV2eHpjeVpnTmgwdjd6U2g4N0F5NG5ON3ZhbE5GNzhkQWcwVkJY?=
 =?utf-8?B?eWZsTkw1WHpjMXN5KzMzOGtyMG82eXFmODBuNm9wdExIa1d6Z1lSTUppbHN3?=
 =?utf-8?B?bzhYV2N1Vm5SOUtVa2UzQTdhUytkSy9XRytjVnZHNVVLTWZtcXpPRC94QXJl?=
 =?utf-8?B?cjFHUy9obytaK28wNDRQd280Y3NZemY3NUdTMXNuNy9EYnM4L0NyakFTckFX?=
 =?utf-8?B?K1Y1VC92KzVnZ1VHcDY1aXRpS2RZQTIxVlB5RVNwMUQySFQ4R1lUVk9aOTJ2?=
 =?utf-8?B?TVlMbWx2TXZUaEkzV3VOMGxYTEdBc2hiUGRWanNJZFdNeTZpKzJJYzh0TlpS?=
 =?utf-8?B?cVV5YWU2QzdhY1NrTGE3VS84eDRlMHJ5aUtwbitCV2w0RFpKWE9TWll4bUs1?=
 =?utf-8?B?MU5QQUVMaE1HVzRRQkQ0UDB3NTQ1eW1YTnhpZUNCaXZDWDlXaGwyMndjelNG?=
 =?utf-8?B?OW9vNU45TWNJS2JNR2licGZYWm81cE10YjNYSlBLdnNOc0VYMzdqektvWWpD?=
 =?utf-8?B?MC92Mkt2SWFVcis3ZXlRYTc5QzFqSG9vM0k1eC94NGNQRVRKQ0dOU2szMVlJ?=
 =?utf-8?B?L2h3U1ByVWs1cXk4MDNGREw3UTl0QzNCWkI1ZTdYdWI4RFp2K2t5emNnSVFC?=
 =?utf-8?B?cVFJMXpVaFozdVVpZThHWGh4SVZQZmdzcGpETk8wejBFSmtCdHdqdEtuV2FZ?=
 =?utf-8?Q?yb/bdfIIHW0=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(7416014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UDFWQmxxYXkwTCs0Y3ErUWRXNHZ6cmU0T1ZLemFVbnQ4MWtzUFBtM2YrSUw0?=
 =?utf-8?B?UWR1YTdtYjFOcVBBV0NRS1FLbHBzQ2FqVnAzYUp3U1ptTXF6Z3VHbjV0K2Ix?=
 =?utf-8?B?bWZqbHBEUGUxbXZzd0UycFBiYXhxSGhpWHNxNUxiQUtUaEhIaURDWjVOVGhy?=
 =?utf-8?B?MHlHVXVpS1dTY0JtczNnRzdneFhFWkVpRGJYYkZOd2pha2NCWDRUeWFsaExR?=
 =?utf-8?B?eUx1WXlndGJBVjdaREtUZmlUd0gwb29idURjZEQ5VEh1Z3BLdXhYcXJJckMr?=
 =?utf-8?B?OUlObDRQRVk4ckQySEJDemY3a3QzUm5nUy9CU3JKNFBoSzF0QWx5VUdKZ2w2?=
 =?utf-8?B?ZzB5a3VCNmNwenhTbDgwZlhjSWhsbjN1YzBSQlRxV2MyQnAyQ01sMzNlS2Ir?=
 =?utf-8?B?aGVFTUY1ek1vRDhDbVE4eTM4Wk5wRVltQ1RPYXpzb2d6WWdBT3VsT0dLUHF4?=
 =?utf-8?B?ZnBZdG9rZVZEanZFdWhYYUs5Mm4zWFVRZmQrYXBVcm9UYlZnZEoyQTJxY0h6?=
 =?utf-8?B?UUNHWUZFU1MwZzNBQjRqd3lPS3p3VmNEcjVwalRZUy91N2VpYUZUbHp2eklk?=
 =?utf-8?B?RXRSMG54cSttVUdma3owdnQ1MTh3dWdLTDRsT0VuM1hiVXUxVUpGTlV3SG5W?=
 =?utf-8?B?UVNWR0c1UUNFc1g1TFRudUtpN1JZNFplZmNzc3NBTk5pVTlVSjEwTG5qaHVa?=
 =?utf-8?B?WW5iSHpTNE9QZklZSEZ3VTBxNnIrYzFIdXhRUlFiM1hpclpCVlhLNm9SNWI5?=
 =?utf-8?B?WWNaZlg3R3V1N2hFbHl5a0ZLR013MFZya0EwelJKNGpZYzZZUnNpV21idS9Y?=
 =?utf-8?B?cjRtajRXSXl6WXVibUhFWHZtVFhQOGVnQkhTTEtCTTVoSXBBczFscnNKeHVv?=
 =?utf-8?B?K0x4cjZwdEllNmdjb0pHRHpwc0dZcXR4Nk9RY2xxb0ZsSE1HcHhieXVkbXZi?=
 =?utf-8?B?eWRqV2pob2d1UUhyVnppVEpTMWJaYy9JSSt0WXNEZmRhdUZCa0JGNk1XVEox?=
 =?utf-8?B?b3RqZ21kaGg0QUlSYW1jbVp5N1p6cGhKSlZYTFYrZG9kbit2cUtWSHl2SjNj?=
 =?utf-8?B?bldaYWNvQVQwdyttdTlDWE5raWd6ZjNBenVwOTZVQ01hNi9yKzRPV0JKOGRW?=
 =?utf-8?B?WHNvdVVzOW1aS2drMEo5SStBK205cnNKSkFlY0lEUVQrWGpGZ2dlclNCNnZJ?=
 =?utf-8?B?MVJJckdibHE4Smt5eEtOMStIQW9iOE1RajhOOVFTaXpPVzZIV2dBL3M4S1pV?=
 =?utf-8?B?VldHSHVlZFJBY2VJSmdoYTB0dGE3S2hxako4QVdySXV5VkVYdm5KRHplWldW?=
 =?utf-8?B?bExOcStCL2lKNUl5dm8rVklpOGFjblNLcWh2WS81WWxJa3dFL21BTlozT2VJ?=
 =?utf-8?B?QzBWTVU3QzlqVVJTQmNHQmE0ekMyTGdFZnNMMzNJVzVzU3dCNVo2U25jVmZv?=
 =?utf-8?B?QlVzQ0VUa2NHdEp6N2ZSc3FBMmduOTlnbStPdWlLSm5EWC9pcWtVbzE2WkRi?=
 =?utf-8?B?OUM5MkFkVnNydW8ycFVoY2R3YTFKZHNKb1pmNjBrR1I5ajZ0eFV5VWc3Y0lY?=
 =?utf-8?B?c3ArQ0hxRlZuNUNxRkxPT25KRnBTSW1Gd1BVR1MzdzVXZ3RrRG1HTzl6WnlD?=
 =?utf-8?B?YmpSOXovR2FlbG0wSGV0ZmJrZEVuanFpektiNzRwRm5VdU56b1pob3ZZOUZX?=
 =?utf-8?B?bkg1UUZtdzBiWDVIdzhSMkVIdDNxMUJHcHRXaHZxdFp2WmdaN0I0MzhtL052?=
 =?utf-8?B?c2N2MkxMeXZmeGtvWmVOM3l4Yi9FN20vbjBCZi9yc1pJMEZIUzcyMk44MUp1?=
 =?utf-8?B?VGljajAvNFdBcEk1NXJaaml4SStvRWhaSHNZSTQ5RXJRSmJ4dG9TUGV4TzVx?=
 =?utf-8?B?SXRhemhTeEpXckxTR0VycnZ2cU1tQThyRThWSThTblNaMU9tcFZiMFdtTnFJ?=
 =?utf-8?B?b2FHTzE2d2pHNUZHRE5Lbnl4ZXZCTWdGT2pXYnJlUFBnNTJhZHVMVU5qanMz?=
 =?utf-8?B?S2d1U1h0TmVQT1pXWG11djY3empxcFlQSFUxNzdqT0p4R1Vhd1QzYTdEeFhQ?=
 =?utf-8?B?QkJMRHZlUG4zemp1dGtPaXVuaVlOVU5tMVh2UGtZalArTVBGNUlBTDRoNERB?=
 =?utf-8?Q?t2oU=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e61e0c58-9d31-4d2c-b7e2-08dd9c2e1474
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 May 2025 08:19:48.4875 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VarqWqTLPoI/oGD6S70ByKoFGxsUzX8OP6uG87II0Hhyj7UxpYHJQwLoYhs0mHoI
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR12MB8531
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

Hi Tejun,

On 5/23/25 19:06, Tejun Heo wrote:
> Hello, Christian.
> 
> On Fri, May 23, 2025 at 09:58:58AM +0200, Christian König wrote:
> ...
>>> - There's a GPU workload which uses a sizable amount of system memory for
>>>   the pool being discussed in this thread. This GPU workload is very
>>>   important, so we want to make sure that other activities in the system
>>>   don't bother it. We give it plenty of isolated CPUs and protect its memory
>>>   with high enough memory.low.
>>
>> That situation simply doesn't happen. See isolation is *not* a requirement
>> for the pool.
> ...
>> See the submission model of GPUs is best effort. E.g. you don't guarantee
>> any performance isolation between processes whatsoever. If we would start
>> to do this we would need to start re-designing the HW.
> 
> This is a radical claim. Let's table the rest of the discussion for now. I
> don't know enough to tell whether this claim is true or not, but for this to
> be true, the following should be true:
> 
>  Whether the GPU memory pool is reclaimed or not doesn't have noticeable
>  performance implications on the GPU performance.
> 
> Is this true?

Yes, that is true. Today the GPUs need the memory for correctness, not for performance anymore.

The performance improvements we have seen with this approach 15 or 20 years ago are negligible by todays standards.

It's just that Windows still offers the functionality today and when you bringup hardware on Linux you sometimes run into problems and find that the engineers who designed the hardware/firmware relied on having this. 

> As for the scenario that I described above, I didn't just come up with it.
> I'm only supporting from system side but that's based on what our ML folks
> are doing right now. We have a bunch of lage machines with multiple GPUs
> running ML workloads. The workloads can run for a long time spread across
> many machines and they synchronize frequently, so any performance drop on
> one GPU lowers utiliization on all involved GPUs which can go up to three
> digits. For example, any scheduling disturbances on the submitting thread
> propagates through the whole cluster and slows down all involved GPUs.

For the HPC/ML use case this feature is completely irrelevant. ROCm, Cuda, OpenCL, OpenMP etc... don't even expose something like this in their higher level APIs as far as I know.

Where this here matters is things like scanout on certain laptops, digital rights management in cloud gaming, hacks for getting high end GPUs to work on ARM boards (e.g. rasberry pie etc...).

> Also, because these machines are large on the CPU and memory sides too and
> aren't doing whole lot other than managing the GPUs, people want to put on a
> significant amount of CPU work on them which can easily create at least
> moderate memory pressure. Is the claim that the combined write memory pool
> doesn't have any meaningful impact on the GPU workload performance?

When the memory pool is active on such systems I would strongly advise to question why it is used in the first place.

The main reason why we still need it for business today is cloud gaming. And for this particular use case you absolutely do want to share the pool between cgroups or otherwise the whole use case breaks.

Regards,
Christian.

> 
> Thanks.
> 

