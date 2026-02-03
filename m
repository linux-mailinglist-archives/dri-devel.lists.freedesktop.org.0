Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yCmrAwZEgWnNFAMAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 03 Feb 2026 01:40:38 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B209BD315F
	for <lists+dri-devel@lfdr.de>; Tue, 03 Feb 2026 01:40:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E377B10E2F0;
	Tue,  3 Feb 2026 00:40:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="FE8QGkhW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BL2PR02CU003.outbound.protection.outlook.com
 (mail-eastusazon11011043.outbound.protection.outlook.com [52.101.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C5BD10E0ED;
 Tue,  3 Feb 2026 00:40:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lfJc2dBKF823VBAvPcd/EcR9qL2TCKxYItJqzhJAURrOlmOoGYyKePVBRAWBPnck8b/LHPSD14vWYVFEeDFYXTqjN5mgPa9XYEQBRixHbRfkq4OkWEtkdkV9kZykvihkqNUyMU2sodECjimDNhTjVNesBne/dy5yQOUPCOf0xh1N+cX8QFAu1TmFHChHMHWsodpOiuUwqqAsdSR6zRqFKwilmnYUzY5vkeOO82vdUSKZ4KLqlGnkpK6f+1PeK+qKzh53XjZ52/4A6/JsFvBdIDcdJgk3oaL96kxqpTzLobdQJCEDoBgyya5apF9HNoVXu5lQJyt2AkbsPpDfQrudhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aOczLbvdB6vqoU9qzr5ObJT3DPUYJNrRMTDXdjztP8I=;
 b=YoloVQSOiVq18rzaNP2RantQiNKCWhQDZTuvbQgoMO3YtWy7J3Uw+Zo6kkonJVhNBQ+fNS9QkSfChGdJ0Cbn7TTbcgMA8VTxdc00VTRkyGI72JEhpZuEQmmZi+UKardcOURd912cCdZVsuAkHJSxFUYSFSof5Rz82LIVwVJiNvTqQAoHA4TAxyYkrZvDY2HcGKGMRtqpwiPkwK6TKwu8VTznjOUjQKLeyJgp4AIw3G59at6INqVhPdmAuXyOXHHu7tJXLYbBIypRr6PSOSynDLcsTH4SajRKNRzhz77yxPIrDdaHaWqvFiKyHm0mUKjufI3dTgWeMmpj6tbEn5B9SA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aOczLbvdB6vqoU9qzr5ObJT3DPUYJNrRMTDXdjztP8I=;
 b=FE8QGkhW4HL/2gMHKmMXKsB8hu5Y/XEhBqN4T3WaOBTDwhrLaRqLK8ANT38ch1GbRNcq8s0HBoMTyMjWAe+vy50TcJL+6xRqJeMS8VRj+6lcXedz74zeLAK+P58aeeHaJBwkSLmesbOyuO70tjtb82HKeHW9G4S12GtImmZRUq8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB8476.namprd12.prod.outlook.com (2603:10b6:8:17e::15)
 by SJ2PR12MB9242.namprd12.prod.outlook.com (2603:10b6:a03:56f::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.16; Tue, 3 Feb
 2026 00:40:29 +0000
Received: from DM4PR12MB8476.namprd12.prod.outlook.com
 ([fe80::2d79:122f:c62b:1cd8]) by DM4PR12MB8476.namprd12.prod.outlook.com
 ([fe80::2d79:122f:c62b:1cd8%6]) with mapi id 15.20.9564.016; Tue, 3 Feb 2026
 00:40:29 +0000
Message-ID: <7116d562-698f-488d-8262-8517749fb556@amd.com>
Date: Mon, 2 Feb 2026 17:40:26 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/amd/display: fix wrong color value mapping on MCM
 shaper LUT
To: Melissa Wen <mwen@igalia.com>, harry.wentland@amd.com,
 sunpeng.li@amd.com, siqueira@igalia.com, alexander.deucher@amd.com,
 christian.koenig@amd.com, airlied@gmail.com, simona@ffwll.ch,
 anthony.koo@amd.com, krunoslav.kovac@amd.com, wayne.lin@amd.com
Cc: Aurabindo Pillai <Aurabindo.Pillai@amd.com>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 kernel-dev@igalia.com
References: <20260122152058.52036-1-mwen@igalia.com>
Content-Language: en-US
From: Alex Hung <alex.hung@amd.com>
In-Reply-To: <20260122152058.52036-1-mwen@igalia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR02CA0029.namprd02.prod.outlook.com
 (2603:10b6:303:16d::34) To DM4PR12MB8476.namprd12.prod.outlook.com
 (2603:10b6:8:17e::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB8476:EE_|SJ2PR12MB9242:EE_
X-MS-Office365-Filtering-Correlation-Id: c9e11c36-1654-4a47-d4cc-08de62bcd477
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|921020|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?OEVPVU5rRG9tVEJaOWZlM2pPMFVuL3V1dFA4aWFjTytnM1E3T1RBSnBrc0g0?=
 =?utf-8?B?WU5KZWtXSm9YNCtFcTlBVnJtajNaekQ3Wmhyb1JLUkpyUlhKK1JPdFhKRTRK?=
 =?utf-8?B?ZEJrZ1NZMTBNZG5aRWlFZE1rbXovczVSRzJIOWNuZXF3TVQxbDMxdE92TndB?=
 =?utf-8?B?ZkF5UlN0OG5lWlNJOWp5NUUycC8zTEEzWDJRNER4ZmdIdUhXdnlFbnE4SHdi?=
 =?utf-8?B?dFhjZmY4S2FPdmNkM2FYTi9GbUpaWHhXQzF1RzZVRC84NGVKT0VSei9zNmta?=
 =?utf-8?B?MEY4VG8weVlEK2FEUGV0NXlzTXB6N0V3WVVGRWxzZ3VseVpBR3IzOW9HQlh0?=
 =?utf-8?B?UlFPYkorN3VaMUZiOHlkMWVqUTlFWXZ3WStZczFVK1B0bGp0d1ZyektsTnd6?=
 =?utf-8?B?OWQ5Vmc3bW05UmgrN01WaEZVQ2RVNm1XYmEzQkFXUllqSlc3Q0Nubm9ZNzRw?=
 =?utf-8?B?NWhpWWVkTFIxNlNNaFExclNPVjdlazJQK3NiRmNmK3FkL0ErWjFHV2xmd3Rx?=
 =?utf-8?B?eG9kd1YwcnVZNlA2TkRaV3JyY0FmM1RzMFprNTd2OEM5TWRzNjA1VEpJdThv?=
 =?utf-8?B?WDFEeUR6YXVxMXQwcTJVL25zUkNmTmVCM0hlS204WWxFL3pYMFRIOVlYSEhu?=
 =?utf-8?B?TEVKTDN5Z2s4TWI3cGxHZkFmWis0Qk1USERwb0VuY0hUbHF6MUJrZjRoMkxq?=
 =?utf-8?B?UTQxRlBSd0FLVFVyeVJObjNwUEVWRXUvTmlxQkxiMVFCb09RdEdENERDWndz?=
 =?utf-8?B?M255eUpubFdGaEdWTDlKYkdBL2o4VUc5TjJqdml4dngyYk1hMHZHNkRVdXp1?=
 =?utf-8?B?TEhrY1NTWnpFdEorQmtZTU51cEgxZk5zcEJYRUtueXl5ek0ySWRETUtzM09E?=
 =?utf-8?B?ZkNlZmVjc0JzdnJVaklQaVRSYWFXd1RPV2dZSlNsbDFYcnczSGdNRG8xdW00?=
 =?utf-8?B?V05TdXJMdXovWndVU0sxQWY1MEdVbUVrRzBWd3djYmZDenJpdkNRelpQYStN?=
 =?utf-8?B?SCs0WkZNRWcxM1ppMzNXRDdFSjZpd0oyNTdndS8xa2NEYWNRR0NvTUdOL3gy?=
 =?utf-8?B?UHZTTWYzdy9GdkZqdDVKeTE5Z2lPM2owUmtJZXRLRHVCOHpQaWt6c1VpZG9y?=
 =?utf-8?B?S1dhazZaRFdJd1piY0RXNlA1VGxsb0tjNlUwTWpxOU1xSTVKaEc5a3J3Uytp?=
 =?utf-8?B?TXpRSGhCWTZGVnA2ZWlaZ24yTkQzaEE3eFBmakx0dW9rS1p5NlhEMVRoaTls?=
 =?utf-8?B?WjFZUkVsZXJsRXpHMGZBbjA0QlBKcWFQbWZNbU5saFYzb05wMkJZNWVxWGpm?=
 =?utf-8?B?azVkNUF4TWszdjNjMHNralZhWDlUMVE2RVVoNTRqdWs2QmRGbzdzeVI1a0pM?=
 =?utf-8?B?K3I2aEkvV25CeWxnRlBDOEtYU0w1N1dwZEIxUVJKV01ySWpUcVk5OU1wZXVz?=
 =?utf-8?B?Y1dZOUFWaGpEeGZvOUkwOXljTFBnYk1QbWxNbUlpWTVWMUhyTDdWV0xFbHla?=
 =?utf-8?B?RFl6MzZLZ1RMYzEySlF6MDVsTlRJTnpEQVlVclNlWitySUR4SkpoK0N1VVJz?=
 =?utf-8?B?VVEvY3cyK042dHo0Ung2LzRnU3J6b004L0thWTh0OVhUMUNEY2p3SitoSzJJ?=
 =?utf-8?B?cEN6Qk53M0V3eWk5czNaYlNicVZEeWgyc0oreUNSQTg2NGt1RUUzZFNEdEZC?=
 =?utf-8?B?UTlibTE2aU42bFBSMW1pQ3VjamVDREk5NkhMdkNmZklKakJDSEZTMUtaeXZ0?=
 =?utf-8?B?WVhCRXFBM2JnYkNXYzl5NGdreTdkNGRrTEJTT1Fqdk9zY2hSWjVnektrR3pY?=
 =?utf-8?B?cytnSDdJVHJjR2w2RVVYeUF4U3Fud3hid0RsQWRpN09KeDl2MGxvbnExNEhI?=
 =?utf-8?B?ODlxYjNvQlNBUlIvRkxva0UzbFY1MGJDOENwNXdRajRBZlozc1dLU014Qnl5?=
 =?utf-8?B?T1lWcmFBNTdIM2g4OFJiODZBQmxzSzNNZXBaeDQyMWhoQnkzbk8wZXJMZ2hL?=
 =?utf-8?B?aWNQQVE3Qk94UDFiTFdiSlJFdlVqV3A4RTdGdkp2dExQblJIYW5FR1BQMWdF?=
 =?utf-8?B?ZjI0SFBPK2hWR0txaUZ0SG5LaHZLWE05Ykx1eXpzVENvK3U5WVRaS2JqckxK?=
 =?utf-8?B?eXhWMjRNL3Vja3dRdkpDcVZSK2kyOGhuVCtrUVFGdlNHSUI2MDBRTE5HQjlv?=
 =?utf-8?B?N3c9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB8476.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(921020)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cDNwaXRGUmNKQkc1bkhpZHhYUTJBb250bHFnN3BYUUtTZkgxSmZ1d0N2VjR5?=
 =?utf-8?B?aGpDU0hnY3hiWlRaUi9rdm41Tml6ZkpjanZvSFJkeVdteW53V1FsU2xUVTNU?=
 =?utf-8?B?bC9rSDU3ZWZQb3pZUG85MkROY3BZby9LODhrSmRrb2pnVGlkeGMzWXpqVWtH?=
 =?utf-8?B?b0gzZEdocEZ6RitteUJDS09GWkFOSlRCSExqdGNqdVVvRDEyTUR0RHR1cUJp?=
 =?utf-8?B?V2RWWDZucHMzeG45cVlVZUdZQU9XZU1JUUZxaEJ2QVloV2pabzFyT0tSWjUx?=
 =?utf-8?B?WnB0Qjg4V3A3cGliRTlpTjZRSlFKOExhZDZrUkhQK0FTK1MyMDMrUGNHcUM3?=
 =?utf-8?B?SlhyK2hOME1yakhVeFE2NG1TSFlaUnZ6eHF1dkNhdTlwRGY0Rm5XbWExUW9k?=
 =?utf-8?B?dU4zVEg2aHk3VjAvcDErWTNOSTNRQXcraVV5TTN3T2p4d0pickJ5d1dYYk50?=
 =?utf-8?B?NEdTOVQxWFV3NEdIazMxQk45MkduclFUZFY0U25TWDFkM0k2ZjJGaUs4SE1v?=
 =?utf-8?B?MmVHRDJZN2hIeUVIb0ZydWRSUlBWQ0p5OXVkTHNOdmhSVG5tcnROalhVRHUy?=
 =?utf-8?B?VGdxU0Z4ZmFzeDBVdjZHc1V4MUxmZ2czZXlxa3UzMWlsWWpkcS8rWXlWS0dt?=
 =?utf-8?B?cXdjRTNxYWVwQm9CamdXY0twUGI4L0FVdGxSRmV3dXJkamgxelZsY09YS29W?=
 =?utf-8?B?R0h1RmFIYkZabXlXZUJsKytoZ2VDdUo3U3dmd3pNRDRaUy9mdkNvQ2lVY1py?=
 =?utf-8?B?UHpPWFRNOGFoRGJDTXowRHVWSnlWYzRUbnVhVlpYL2RPcGdlTHMwOFRkSEpJ?=
 =?utf-8?B?OC83VTB0Y1lZcHA4QUt1Mks1NFRGWlZ5UWFXeEM4c0h1NkRxYmpnaXcyRXBn?=
 =?utf-8?B?a040aDgzT1I3LzFEY0w4OUJYQVV5MlF0NUE4d21VSjVXVHVxOFVubXE3TjIx?=
 =?utf-8?B?NGZNZE1pd25ITzdJclUwU0IwemMwTTlUOCsyeTRuWDFoTjdLVGttTHhVN3B5?=
 =?utf-8?B?TFkzWVVMWDBCdDJvS3NMQVFEVldYZTY4WnFxSzJkNUpXdTEyZmswVkNJem4v?=
 =?utf-8?B?QnhkbDlMNXQ3c0NlREQ5MXJJZ3ZvdHMzcElSdHlkU0xWNW1KL1BFZW5ocWhj?=
 =?utf-8?B?WmFaWXpyZmNmYVJYa1Z0eW1NYXlpZkhGR0JSUG5FYjd5akRXWHFNMVFsUVFK?=
 =?utf-8?B?NjlGNUJGbTFZOXpLQnBtTVorTWtUdXprelNjSEFsSHJ5VGxzZzd0RjQ4NWFW?=
 =?utf-8?B?a0JnOG1Xa0tRUlJGMnp3djV6K1VkSUNoaVNRZm5sdGlkYjI5a0pabG0rcytr?=
 =?utf-8?B?bG9mbXR5OUxSVTA4aithdGdtNjloRFRJcHFrTXFzeHpQTFpiSisrZ05tdEdH?=
 =?utf-8?B?MXd2elQydDRhaGxTa1N6aC9vSVlQSVFpaXprRTkvOEJHWnNaUW5PN0QrOEFk?=
 =?utf-8?B?WldDWlJKaGF1QUE3MndNOTdoNFlpTDFaZlpydUNyZU02OE4zOEk2Q0tXLzlZ?=
 =?utf-8?B?MlRHbWgrMGY4VmFhZmwwTG1NNTNNb0oyd0hCVWpYa1ZBWW90bGk2YTEwOWli?=
 =?utf-8?B?THRBbzBidS9kaCtBSDZEMmJ1MEttSk5jakhIbjJ0S0UyVk5RanRzU3czemtQ?=
 =?utf-8?B?S2Y4REJZMldJanhOMzdPcVE3eHkycGQ2aHFKclRrZkpNRWRSRTdGOFRWN0xR?=
 =?utf-8?B?dHpOdVhnOHFBUlNKRVRPRFFJYndkNnhsSG1KZDE4UzduK2pXT1dxVHNCQ1ph?=
 =?utf-8?B?a1cwSTNXMWs1dTFoVSs3c3dacDd4eHpNRHJvSjZJZ0ZrTFByMlFnQkE0ZUcw?=
 =?utf-8?B?TFdpNC8vQXcrRExjYXBEbVV3eTd6NkV3Yk5acllucVNCTFU5djlTTm0xLy91?=
 =?utf-8?B?bkZGQVlRdmY1N2NLMUFkK1g1NDFJNFBIYnNYSU1FV3NzQkUvaFk0aCtyUEpI?=
 =?utf-8?B?cU9HMitqdjBOM05WTTROZldmbkcvK1dncFBOakJaRzNseVU5MFBadWw2SzVs?=
 =?utf-8?B?VzdTL0JxeXVDSVd6RXl5c2RjWkNqQmp6QlNDczBraFBzcHBTdDNzYXhMc0JS?=
 =?utf-8?B?eDhwMTI4RDdVMTVBcTVEOXlocWw0TDQ4aEVhRHlWaERBdm45aXZXZGZCdHYy?=
 =?utf-8?B?cTNrTUtJd1BsTzUrNG5IbER0QjVSdWRPUXMvTFVYZTQvU0N6MHBlSkcwODJ6?=
 =?utf-8?B?NW1LZ3MzckVvWGJuT1o1d0pQQTlHQWJWSFM5ZStsYVlwd251NFdkZkZ2MTZG?=
 =?utf-8?B?WXE2WmdYTGpEd1ZpUHRwckNtbHdGU29oUlR5QnBlNlRmTkMzK09zRmlUSXNZ?=
 =?utf-8?Q?tWwSROPotcoEcRh3Hu?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c9e11c36-1654-4a47-d4cc-08de62bcd477
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB8476.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2026 00:40:29.3098 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9REgDCHRTy4jEwCcDeqFLsoKF6rlicxNexHcyMhj7msphXTUJWEysZflnu8AlX8cczcDDQPk4vN08PpjdwYk2Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB9242
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
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[igalia.com,amd.com,gmail.com,ffwll.ch];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[alex.hung@amd.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[amd.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:email,amd.com:dkim,amd.com:mid,igalia.com:email]
X-Rspamd-Queue-Id: B209BD315F
X-Rspamd-Action: no action

Reviewed-by: Alex Hung <alex.hung@amd.com>

On 1/22/26 08:20, Melissa Wen wrote:
> Some shimmer/colorful points appears when using the steamOS color
> pipeline for HDR on gaming with DCN32. These points look like black
> values being wrongly mapped to red/blue/green values. It was caused
> because the number of hw points in regular LUTs and in a shaper LUT was
> treated as the same.
> 
> DCN3+ regular LUTs have 257 bases and implicit deltas (i.e. HW
> calculates them), but shaper LUT is a special case: it has 256 bases and
> 256 deltas, as in DCN1-2 regular LUTs, and outputs 14-bit values.
> 
> Fix that by setting by decreasing in 1 the number of HW points computed
> in the LUT segmentation so that shaper LUT (i.e. fixpoint == true) keeps
> the same DCN10 CM logic and regular LUTs go with `hw_points + 1`.
> 
> CC: Krunoslav Kovac <Krunoslav.Kovac@amd.com>
> Fixes: 4d5fd3d08ea9 ("drm/amd/display: PQ tail accuracy")
> Signed-off-by: Melissa Wen <mwen@igalia.com>
> ---
>   drivers/gpu/drm/amd/display/dc/dcn30/dcn30_cm_common.c | 7 +++++--
>   1 file changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_cm_common.c b/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_cm_common.c
> index 0690c346f2c5..a4f14b16564c 100644
> --- a/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_cm_common.c
> +++ b/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_cm_common.c
> @@ -163,6 +163,11 @@ bool cm3_helper_translate_curve_to_hw_format(
>   			hw_points += (1 << seg_distr[k]);
>   	}
>   
> +	// DCN3+ have 257 pts in lieu of no separate slope registers
> +	// Prior HW had 256 base+slope pairs
> +	// Shaper LUT (i.e. fixpoint == true) is still 256 bases and 256 deltas
> +	hw_points = fixpoint ? (hw_points - 1) : hw_points;
> +
>   	j = 0;
>   	for (k = 0; k < (region_end - region_start); k++) {
>   		increment = NUMBER_SW_SEGMENTS / (1 << seg_distr[k]);
> @@ -223,8 +228,6 @@ bool cm3_helper_translate_curve_to_hw_format(
>   	corner_points[1].green.slope = dc_fixpt_zero;
>   	corner_points[1].blue.slope = dc_fixpt_zero;
>   
> -	// DCN3+ have 257 pts in lieu of no separate slope registers
> -	// Prior HW had 256 base+slope pairs
>   	lut_params->hw_points_num = hw_points + 1;
>   
>   	k = 0;

