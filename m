Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0ILiC/mieGmGrgEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 27 Jan 2026 12:35:21 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D4E8E93A7D
	for <lists+dri-devel@lfdr.de>; Tue, 27 Jan 2026 12:35:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E299210E543;
	Tue, 27 Jan 2026 11:35:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="YD9ACcN6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CH5PR02CU005.outbound.protection.outlook.com
 (mail-northcentralusazon11012067.outbound.protection.outlook.com
 [40.107.200.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B5AF210E543;
 Tue, 27 Jan 2026 11:35:15 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sMu7HVM6oBDn4TQ43WD+9rygrAGiRG240KIOiJw8RkEA5Ozm+h2rQB02Lk9KxfHN5skXXvG94IKMv4yeP4Hq3eSBNySB69o60I+dgfgPexNvYLTqgcH6/aQC9HYsZ+e28G+7/d+HeVWIamq2VYXpNiUhF0+H/wOO4k0oDEVxKeHsGt5qYEwO3RBTlxnElCC30dmo1F0qt1SFL4rCSqfzoMsRE1ZpajnCJn+cvgPjEPS2G9l+bNtPmNqsZ5o0tRoCQjrlhW63RYTYjbze+9JUPK8CBm+9igf2w31fgESD9bw9nRX0hlAqQYVUXFFdyQJBGXDlcL+g2cjdyCyL4+Hnkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=y21EB2nqc8f7reQyjVlfOHcO9RtCUh3wDf2AVQJicG4=;
 b=V8sU2/mhEIJk1g+GffIyuW+sc66mb7sr3SD+17Dl2o9atcCkkMVSLO3cXwIfFVN4r4uCqG83/LtRLfzQtVOWrEU4m+6MrCEDYg7dl57bSgcVkV4EPw4fDjebyoj8NwpkKwm/W7dYSfPmNyBiZ/xKY3OYuB7z1ZwoFSBqMhENALyCTwnSrsCXJcPubYAfnE0MPA4AKACmiSq4FuTOG3Sg/UfJ6KyMgBOTw8hkwk3tsjdy2FP/QpzZ+xE0H97y4YAp4CwKlftS9PX7CW0APsABurPQud99i1aneOuWbhSh/7miySzdZ/VNqLngC4SvQhxD2qN3543MzDv+/3xiva64aA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y21EB2nqc8f7reQyjVlfOHcO9RtCUh3wDf2AVQJicG4=;
 b=YD9ACcN6xyw6BWwXfWkJwTyGDtpdo5rCkFrqj0CQyzqaDj+N/mntrNQizuD+MtriZUz+BsHdnhdTEhyLUXjDvgoa0MDuA228blgZrKWCri5E/1ONRV0be4Cu7wAhJRBXfu3ijglWvkdO1TFPYZ6saVidTy7WfYTbB6pIoMBw0mQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by SJ2PR12MB7963.namprd12.prod.outlook.com (2603:10b6:a03:4c1::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.14; Tue, 27 Jan
 2026 11:35:12 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%4]) with mapi id 15.20.9542.009; Tue, 27 Jan 2026
 11:35:12 +0000
Message-ID: <7f049afd-b2d0-4369-af9a-416abed500fa@amd.com>
Date: Tue, 27 Jan 2026 12:35:06 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] drm/amdgpu: Fix TLB flush failures after hibernation
 resume
To: "Ionut Nechita (Sunlight Linux)" <sunlightlinux@gmail.com>,
 alexdeucher@gmail.com
Cc: alexander.deucher@amd.com, amd-gfx@lists.freedesktop.org,
 christian.koenig@amd.com, dri-devel@lists.freedesktop.org,
 ionut_n2001@yahoo.com, linux-kernel@vger.kernel.org, superm1@kernel.org
References: <CADnq5_MSvWLVqhgkdaYn6bjPC2L2=jf5v=h3n1cx=ZYgnXLQPQ@mail.gmail.com>
 <20260126203749.16389-2-sunlightlinux@gmail.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20260126203749.16389-2-sunlightlinux@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0205.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:e5::14) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|SJ2PR12MB7963:EE_
X-MS-Office365-Filtering-Correlation-Id: 693763ab-ed2a-42ea-5517-08de5d98220e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?T3BoSjU4NHN2N1RCQTJycVMrakJqNHM0TWJIc0Q1dDdZWlIyYjNYWk5QNUhP?=
 =?utf-8?B?U3FINGwzSmU0OUluQVVIeXNuNDU5V3ozQWFYQ1NFU1hJYkRHdXZoOGx5S3ZE?=
 =?utf-8?B?SFYxUGRIWVBLWCtZSEFTZlhVbjBmYXJEeDVqTXFIQlM5dGlFTnlTRk5BQkht?=
 =?utf-8?B?WHMrT0NzY09lVW85UEprTHQ0ZFhjaTJPY1Ztd1J6TmVPeTB4YThJMTU5T1py?=
 =?utf-8?B?bHRnbWdpNWh2Ym1xTWxPTmIyMU93cGgzVDYzZ0F2dURsNlZDUlFsUGdtVUdr?=
 =?utf-8?B?NjNKZHRUaWJiU2hNemhNNVdBZCtDTlU5T2x5ZGhqNnRBVk5UT0o4aFN3QWVx?=
 =?utf-8?B?dzdWZHpOK3BpMEVoSVV1Tk1ZTE5oSURoVVNpUmpWSkNZYjV2SW1wQ0c1SkFY?=
 =?utf-8?B?YTVqQmZFNWxTMUJVUGpPb3pJNFhNcThmMkh2dXozNGZOemIyM09XZW9qWU0x?=
 =?utf-8?B?Vnpia1NxM3l6dmJGaTN4bGRwcjhyUU1tVFVEc3E0Mm9Ja3FScGpMaytUcS9j?=
 =?utf-8?B?RGx4OVpBL1dic2Q4bXY5TTVHTURxNzRGTXlIMGVDV3kyMy9GVGlBYlVMdXpR?=
 =?utf-8?B?b2RiamE2MG1kQ29nWGc2TS9ybm5jMytnYjByNndlZ09yUW1PTEV1cDRURzQy?=
 =?utf-8?B?aHBKblk4RFZJb0FxWlNOTnBTN0M3RDNoZTd3elJlT3lWVXR5RFpvOFBzTU95?=
 =?utf-8?B?Q3EzVGUzUFkvWFBZL2haaCtXVGNlZGc1YVhEcEY3ZVl6dlVtQTVPTHgwYjl4?=
 =?utf-8?B?bGFHWXNDTFdMN1Y3SXNCTXJNZWJYWWdtWU9LMUdEZlcrRHRhYzFrOXVuWkdv?=
 =?utf-8?B?UWVoaXNaSVFNVy9LQkY3cnRUd0dVWVM4WVJFdURkMFYxNEdxSThkTXJTVEp5?=
 =?utf-8?B?bU5OTUZjSTlvTlhSRkFIa25CcThXcklzbTY0M2xjeVVFbGZrV3JKN0pPY29L?=
 =?utf-8?B?aHNiZWNJZFlhdGlCQkxiWnZXNlZsWHhhMVBBcUxnd1lJK05od3NHUWg2UGVo?=
 =?utf-8?B?SGVzQUlTQ0VtZEZ1ckhjdTJncHorTzU4dG9oQnJaWEpYOFpwUWxkbW9YK1or?=
 =?utf-8?B?bW05R0N4TVB5RkhFei8rZUVEbUVlNm5uMjZTTFhPRWoxTE8vYVFna1dSdjVy?=
 =?utf-8?B?SjRuVk51dlE3em1OTEVzaTd2QkJnYnVDTVNkUVJwRXI2b3pxWVZ0Q2c1QWIw?=
 =?utf-8?B?MmQwTlUvbDNPRjlVMjU4V2JJWlVYcmdWamtkaDdpaXdmYStRaENRSTI0VVl2?=
 =?utf-8?B?NnN3R0ZPNHRGTWpjQ3l3R0NOcGtwQ1Y5UTZaeHlWdDRDUzJJUXJBZ3BZN09D?=
 =?utf-8?B?TmFjT1F1M3hWbWUxZTdxKzY2YnZFTG9wRklLakphazVXVHk5L2dTWG1jKzNS?=
 =?utf-8?B?dkRUR0Y1YWVvTmgzQ2o0ckE5NDQvWEJBSnJBTGlQLytIVDNhdVVZWDh5eFBX?=
 =?utf-8?B?bEtVTDB3MndiTFV3U2ZZcDVTYjdMT3hHcWNzRVVKTUwzZWhSSHdyU2JubS9D?=
 =?utf-8?B?akRnMDgxWWZxbDROaVhxYlFId2QvMVpGVTd0dWp5VWZuVmYxQkpvZ2E2cjJv?=
 =?utf-8?B?NXYzZko0WHdmOHF6NWxEVks5b20wVTFvRVllUTJ4VUdodG91YU1vSWk3SCtr?=
 =?utf-8?B?RVJYZ240ckhaQnJPSHNMQ2VIWUZZcWxpRG1GYnlrZXNSVmMrejBOR1RJOGdY?=
 =?utf-8?B?WW1xYmJoMjZIUC8rZTFCR0s4U2F1SmNwcUJ0R1AzZ1hnaGdEK0Z1QlFCanBn?=
 =?utf-8?B?U0N2NG1PZFZGTWJkMCtyeW9seHFTTTNpcUdqYVhIcGdyZkNBUy9UN2xOMkEz?=
 =?utf-8?B?ZHBFZUtwVncydnovS1dzSXBRbkJOUXlmeWVpQkxDYUNSbzRoNWx1NWZOOEtv?=
 =?utf-8?B?L0RtZ2lBeDAzK3E1MVZINThuMnpxTTUwdDczaFhER1ViMDB0VGZKZlVvT0tt?=
 =?utf-8?B?S2VRYjhrY3QraHl2aXk0SE1TZkYvYkZURVNzOEpxd28xTlhpWG5zREVyd0dR?=
 =?utf-8?B?ZE4wL29ic1NwMjdHYmswcXUzS040MGtKaC9WdWhDcGNuYWVwOVlBU0MvSGlj?=
 =?utf-8?B?TVl3VE41UmpLNmJjMnVkSk9RRHNic2lobzBVWmlZNllUNjUrQUxrZVJiTWE0?=
 =?utf-8?Q?eecc=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dktYM0tGU1grUjllWG15RkVzUzMzKzdFY3RSdUQ0OFVhMURTSkVUM0pyQ3U4?=
 =?utf-8?B?L1VUWkswRmZ2d2tzUGRsNDNtbS9pQk15ZFVEV2NwYllnblU2U0hsSU5rS2hz?=
 =?utf-8?B?cFVzUWVtWEtvMSt0N1NyL29ncElrdmJlWkhjOW80Zi9SNS9HT1RzcXNNSlpE?=
 =?utf-8?B?SU1NZ0JiNXhmSnp5N0o5K200dE90Z2FUb094ajdEL0o0OEl1MXNQakRoSzlX?=
 =?utf-8?B?MTloelY5THZKMjBOdWhCeEQyMlBQVXZxdEt0U1Azc1FPam9kUGQrVVA0MFhm?=
 =?utf-8?B?VGFvT2xVRzk5V1J3Nk5Fd2VlaGN0M2dtS2FJNFhkRHBEelNPMmJCRlNZcHRU?=
 =?utf-8?B?R04zcE5DUUtKbWtMKzFiMjlpdUZsTmpONTVpOFN5a05wNXo1dUxxNzZUanBv?=
 =?utf-8?B?VGlkRjNXckJNOFk4eGhYU2hzMnBWWmlpa01lZmxwUkRmYnF2UTdLVGI1L0N4?=
 =?utf-8?B?RVdwSjVYN0RLVGJCcXVGU3M3NHoxZ3dSZk5CTnRlWlRuSzZUbXFlNmVPdElO?=
 =?utf-8?B?QnhKVkpEeDdpNFZ5VzduU005T20yMzRXVE9QRmErRWYwdzV0NjRHQnBvNzly?=
 =?utf-8?B?OHJvTENuN0pxUDIrNDBkZmpqOTNCRFVDN2JZTUN1ZEx1dFpDVzlvUXNsOGY5?=
 =?utf-8?B?NDJSeE45WSs0YWVKM1dBem9GQ1Jqc2JMYW9WS1laWm5YMFBlajl5REJ5eHFP?=
 =?utf-8?B?WUZtVXdvZlhZam1Mdm1MaFJza1dBbkhVbkxtaU1ZeloycUFxSldQRVh5RU5x?=
 =?utf-8?B?c3JkekwrcEFDMTYvbEJyL3RwQ3VpelNWLzdvMkJCYWdEaUJTWlFrNXRNdStx?=
 =?utf-8?B?dDI5ZUVPY1VuNFBzelNzYXZGbklqblgzeDIrZXRHT29XTSs2bURqaU8yeEtE?=
 =?utf-8?B?TTNyczIzUnZ3QnV6TUl0SmVleElQV29yUWJvQ3prQjJHNWVnUDBJZ0lQeTFO?=
 =?utf-8?B?MGZwaVFTUFRjQW1ibk0xMjZWMGNjL1dvdUR6MFl2TTBVVXdlRnhwOHYzWXB2?=
 =?utf-8?B?SWpOa05HWHhpcXp1QUtlMGRXelFEd3NxcXJkT1czZW96WTZCL1pCUEw3YWt6?=
 =?utf-8?B?d3pua3Q0TVA3R2FVQnVTbzJqUFJZQ3lFZEdwUGVlL3owUmFncW1nd3kxMGZK?=
 =?utf-8?B?OGFBVStlWmdzNU5HeFJNNzF0c3h1M1lHdk5URjRMN0V6bXNnRzBjakV3cVlo?=
 =?utf-8?B?M3Yxam9rTzFrclNHWXpQMUxhMjU1VXRjblB3SHdxZGltRGVNMTVWU1pzTVBx?=
 =?utf-8?B?a2tyS0w4RG8xV05DV3VwLzdTOVpKR1N5L0hYT3Buc0dCRmVlNURvaVQ4Y3B6?=
 =?utf-8?B?OW5oaHdUWWlKQWJhQ1VtM2dRY3VHQUtSbXZIUUF6NDVvdUlYYTJ0U1hyMEN6?=
 =?utf-8?B?U3V0SkZmUm9BZ09nOHVxbE9LaFpXV2g0L1phWSs1emJrc0VzNlQ3MmJpUzFo?=
 =?utf-8?B?SzVqNWYzY3dYaXVYcHJ4N24rNk51SWRFU001WEszVTZXdEhUN09QUFIrN0lD?=
 =?utf-8?B?YlZiZ29YZ0RvbFIwZWVEUmV5d3JicnZyVGVLVmJzdm1zWVZySGcwZWJPV0Vx?=
 =?utf-8?B?T3lLUzFoeHM0Vy90eUJhU2wycFVzOGU5UC9IZ3dqY01CRjNKMndBMnFPTjVa?=
 =?utf-8?B?Vi9adjJiWDgwWE82bUhtS2RhSGc0SHNiWHZ3dE01c05Mbk4yTExqVThmYmtq?=
 =?utf-8?B?bkRuWEZqU1R1c0pnR2p3R2RROE85V0NxZUg4UXVLZmZmQ2xlaDFra2NzVEcy?=
 =?utf-8?B?SHFMTkpvTy9HcW5CaHRaQWVRZ05nU0xiU0xxYXVrMkVDMXlCSXJiR05zVnNH?=
 =?utf-8?B?Y0lQQS9ubHlOclR3R3o3Tm8wYnVlNmxBQVVUemdJdThoVnRXY09GZDNCeE03?=
 =?utf-8?B?a0p6cWNqb1ZRaUViWU1GY0pkbjBObWdwNTVXamZOSGc3U09SVmc4VlJNNWt1?=
 =?utf-8?B?eW1naDlaUFZZdTFJeUFYNjZuVTJ6TUUzVmE5OW9lZnhvdUJqQmROdmxQbVYx?=
 =?utf-8?B?MnRlNU5MRmlBV29ha21ubFp2TnNXbzFMb0tJMDdZZWZqUHVaZmM1USt2MDVq?=
 =?utf-8?B?d0hCZGF6TnVDZnRmbmN1SXZaSnVSbSswOTVzV3VUV0xBSndCVUdoZUlKQW9w?=
 =?utf-8?B?d2h1bkRrUTZwZzF6Q3RxckFLYU5ZWHgzelh5cG4yZExXTEl3UWYwMTFoQzhz?=
 =?utf-8?B?UG91VzNXdTYra2FReFBDckFBdnJIeGxOSWRWL3pjeTdRNnl3THI2cHF3RzVT?=
 =?utf-8?B?MWYrRGUxdTBUUmV3bFdySldUdVhlemhBRXJFeFJ0M3ZmVUtMT0ZseHljVHlC?=
 =?utf-8?Q?y05Le2+r94tGSzN21m?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 693763ab-ed2a-42ea-5517-08de5d98220e
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jan 2026 11:35:12.3991 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: q0A5CXqQgTJSfYe/uDGquF3WdAQkYYFGVeO3TUGB+qBmQZHwhqkxR61C+ksHnS7o
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB7963
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
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[amd.com,lists.freedesktop.org,yahoo.com,vger.kernel.org,kernel.org];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[christian.koenig@amd.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[amd.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	RCPT_COUNT_SEVEN(0.00)[9];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,amd.com:mid,amd.com:dkim]
X-Rspamd-Queue-Id: D4E8E93A7D
X-Rspamd-Action: no action

Hi Ionut,

On 1/26/26 21:37, Ionut Nechita (Sunlight Linux) wrote:
> Hi Alex,
> 
> Thank you for the feedback and for taking the time to review this issue.
> 
> I'll add debug code to capture the full stack trace when the TLB flush
> failures occur. I'll test this on my AMD Cezanne system over the next
> few days when I have more time available, and will send you the complete
> call chain information.
> 
> Regarding the hibernation limitations you mentioned - I understand the
> challenges with secure boot compatibility and VRAM eviction. In my case,
> I'm not using secure boot, and my system has sufficient RAM and swap
> space to handle the VRAM backup, so those particular issues shouldn't
> affect my setup.

the problem is since the AMD GPU doesn't official support hibernation you are pretty much the only one able to reproduce the bug.

In other words I can't go to my manager to get a Cezanne system plus time to work on this.

What Alex, Mario, I and all the other devs can do is to explain to you how the driver works and try to further debug what's going on here.

> I'll follow up with the stack traces and additional debugging information
> in the next few days.

That would certainly be helpful.

Thanks,
Christian.

> 
> Thanks again,
> Ionut

