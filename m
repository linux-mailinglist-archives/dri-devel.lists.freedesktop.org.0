Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B0A97D3B01A
	for <lists+dri-devel@lfdr.de>; Mon, 19 Jan 2026 17:11:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 18F7010E4C5;
	Mon, 19 Jan 2026 16:11:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=garyguo.net header.i=@garyguo.net header.b="e1hxTTS4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from LO0P265CU003.outbound.protection.outlook.com
 (mail-uksouthazon11022077.outbound.protection.outlook.com [52.101.96.77])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7364A10E4C6;
 Mon, 19 Jan 2026 16:11:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ey2+fAWxlgY6w7hhsyvBnrVplYpO/FmUGprvdf0VFCWOepG9j3ct3mqo9rkgaYyd1lD94Je5B8Vw5Gcmq5jq9L6yzb2qlS4LDVjbSVAbfzpPhCKKVe93ZDAE24cds/cGvwBkiFgDbrwUWaI1Uv+N1Ba9IepYrTMxyaNDMXatLU5qatW+FXfzE8jKq8YdImVx/XfUfJe0scGZrWIBez5+kSoTDLYGSs4CEdex2D5NUl7F1M7P2WdInYOsmWdWaRcQrF3Pc6IiP2VWJ1LM86baA4UJo1LuGQK5TkqcC926vi2+yHXez0ZsnTbxej4SknxHTVjf4OKbPj335nI1HGRSxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TbKbkWMJUZt8rj7BaccfOeYn2NefjXGRunA1+BcrPW0=;
 b=aqnzBwiQ3AiGp48FYFUwG5NpcTse1Cx4rOR2Pd8oJzkkOs4jzNYOdtFf/mR09zL/SraDd6NyEwQWOec/pbOiuW3jHWeRn/lr6Er2Tl6F84ygy7xiBih/0CbIjE0UYnGNqiV7prqNmHSuz8Wi4RNNvEBIrTrhPmAdjR1bmtAmMDTjN4T8jJXEkO9Yye/Zina5gOffn73SE7tlTHAvIOa1unzoZynfBewGJrMZ6mwlLuIgAXbgEK27mC69GAUjgSndFp/VuBnRicmmpRG4guoRTto7t7NJtkSvjmBPGKYK2AuymIhfQWMfnhuu4aHcS8CRKDAzDgWTFdh+Iw4FaEdhTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TbKbkWMJUZt8rj7BaccfOeYn2NefjXGRunA1+BcrPW0=;
 b=e1hxTTS44KCZbyaMC/VfiLgkV6RtgE1vzhFSyBdfUxGLF9krTSQS6zsryND6+pStb6BFDtm9I6muZ3y5J67ETJUV6ZJOSugXs30yIqSrR6VnkCFtdzvHNzpOHSHqMAJT6z3vc9lOzZuzAHcFfOOJTavDFu79/dIeAPiAkzfxrD8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by CWXP265MB5227.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:190::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.12; Mon, 19 Jan
 2026 16:11:40 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%5]) with mapi id 15.20.9520.011; Mon, 19 Jan 2026
 16:11:40 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 19 Jan 2026 16:11:39 +0000
Message-Id: <DFSP4OEGFLIZ.2X0SCKD7WG2KD@garyguo.net>
Cc: "John Hubbard" <jhubbard@nvidia.com>, "Alistair Popple"
 <apopple@nvidia.com>, "Joel Fernandes" <joelagnelf@nvidia.com>, "Timur
 Tabi" <ttabi@nvidia.com>, "Edwin Peer" <epeer@nvidia.com>, "Eliot Courtney"
 <ecourtney@nvidia.com>, <nouveau@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <rust-for-linux@vger.kernel.org>, "Lyude Paul" <lyude@redhat.com>
Subject: Re: [PATCH v2 03/10] gpu: nova-core: gsp: simplify sequencer opcode
 parsing
From: "Gary Guo" <gary@garyguo.net>
To: "Alexandre Courbot" <acourbot@nvidia.com>, "Danilo Krummrich"
 <dakr@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>, "David Airlie"
 <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>
X-Mailer: aerc 0.21.0
References: <20251216-nova-misc-v2-0-dc7b42586c04@nvidia.com>
 <20251216-nova-misc-v2-3-dc7b42586c04@nvidia.com>
In-Reply-To: <20251216-nova-misc-v2-3-dc7b42586c04@nvidia.com>
X-ClientProxiedBy: LO4P265CA0269.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:37a::9) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|CWXP265MB5227:EE_
X-MS-Office365-Filtering-Correlation-Id: 345381a8-35f7-4429-4477-08de57756dfa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|1800799024|10070799003|366016|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?clVtSWJXREpBV3pqMUUzVFVmWkFhalRXbDRzc0daWmZxdmdaODhLaURZR0Mv?=
 =?utf-8?B?TnVMTDFNd20zdHdLWVBPK1JXVmcrWmdiOEd3bWtpTjE2SzdLVXFtcnNjTG1u?=
 =?utf-8?B?cWFxejBJQzNVVWtQV1FaUEM2L3FOL0dkS29YQ25TVUp5Sisrc0dWME9ROXlp?=
 =?utf-8?B?Yk9nK3hYMmFHMGs3dUEzbk5zR1c0ZVNyVW9xV3dnb2w2NXJlZzl2Vlltb2F6?=
 =?utf-8?B?MEVXUDFSeEJzOXhiTzNnSTl2Vml0OVp5UEt4a2FqSGIwaW5sK3Z4SzVidHM2?=
 =?utf-8?B?cUVmUWRCME4zQlVRcGRaZTNVdFFNdnF3cVdmRWdhQUlPZHRZVFV2MHRaRDRr?=
 =?utf-8?B?L09EejE3RmF2VWpzV1lNS0xaWWwyOENrbkp3TFA0aU9NREF2OXJ6dVA5SEQv?=
 =?utf-8?B?M3g3L0RyZ1JtcWc2RThSRS9xVU9TNGRrSVo2cEUvYStPTlFhcEdtZndYeHN4?=
 =?utf-8?B?aWQyMjgzWTN1bXlkUHFKLzdOQnJsTHFGTDh0K0Rrb2NWMTRHaWJzV1hta0dS?=
 =?utf-8?B?d0Q5NHFhMnhXL1Z3Z0RxM29NUmVKTWdHWEtHZGdNWndZQkprSFFjbFZGUHpy?=
 =?utf-8?B?M0VzY0hjbWY3V0RnaGxMeHd6SXlOYkIrMWZqTi9yVDlIT2RHZnV3Z2MvV05a?=
 =?utf-8?B?ZFBmeUprV3NySTdGU3E0YXZrajVBdFlkMGFzOWhXa0xFZkZXUlFpNTh6T2VI?=
 =?utf-8?B?a2drZHVPZ00rZXpJN1NvTWZVbzEyMVVKRUlZQU5NbTIycDNZd3RlSDE5N1Zq?=
 =?utf-8?B?Y2RPbFZXakRlRHRjUHYxdzdHVm55d0ZTbnBIdVEydytGazJSVkNkWGEvOS9j?=
 =?utf-8?B?WW5pc3hzdlphQndMUzkvVThxeC9PdVd4aGhPcTQyK0p2MmI5QktBQTBUbWxM?=
 =?utf-8?B?UGRWSUVHSEhoUGZvYldkQ0NvQVpseGY1YXJtTXRxT2lGaDcwaXBOWGRFUzhj?=
 =?utf-8?B?MHVBK3UzR2pvWDhvWWZTTG85MU02L05hZXVLNGhWVXo2cGpON25YYVFDYVZq?=
 =?utf-8?B?b1JGTnpCbUhlT25kSmVhQ2NFckV2Qi9lUGZMa1FycjlrUmYvelJxYWY1ajU4?=
 =?utf-8?B?Yno0bmxReFJmekd6K1QrbTVheFlDYm1BOGtaZHpVTnVGb3krdU5rOFg5L3J3?=
 =?utf-8?B?RE9mcVE4em04U1dtM0FBUDZySGErL1ZTQ1JLNXQ0d1RjNWd4TXVFOU5OWkRl?=
 =?utf-8?B?eE5ZTWtaNzk1OUVoRnJzSS8wcmJudWlKcEZ4KzYrNkp3ZjVuZXJEa2xRZE1N?=
 =?utf-8?B?UGxMNkhzaUNXZkFacG1PNXh5bjBlTHlESGlidmhjeEQrMnFITDVFenpmSFo3?=
 =?utf-8?B?dERFS2hKbm5pVjl3Nm1XaDlqb2QvUlp6aU5lM3FHMjN0RHlZMlhzNG05azZ2?=
 =?utf-8?B?LzNCMzl2VmxsOHFITXplODhpbjhodTBocFpJdTdRalMrQS9GUVVCRWsrL2tI?=
 =?utf-8?B?ZW41QjlNZ1c3MjlDcEt0L2RiT01sR0JTcVhLbG5YMm05TGRzVzlzNDlqM1Z3?=
 =?utf-8?B?cFM0cnZTNGpyTktEUXZvNnRKZ05DK0l5NzUwQXRJakhXakNsZ3FOQjhic1NQ?=
 =?utf-8?B?Yk54YjVCZ2xPWUc3RHo1Q2tITjJ1cjA0eVVBdkZLNlBLYmhHK1JOTlIxdlpI?=
 =?utf-8?B?bytDSVlGOVNtcHVnaGZRZ3RFaHhqQzFsckVqdUxQRTlNdlRIVVAxMmZhd2Nh?=
 =?utf-8?B?Q1oyZVh0QlZsTWh0a1pWMVRXdVp6cEt0RFp2a1YyRXRmWHQrSkdZcThNeHRY?=
 =?utf-8?B?SUNSL1BNZk5EMHFNMnliWXlTekV6cDJwWGVsbGZXWjlaZnJCTHVyRDNEUk1l?=
 =?utf-8?B?MHl4UjlXSzBidkcxVnp1VGZVY2VuNk5RZWNWQmRzbUVFSGYwVkNjcTlSZERr?=
 =?utf-8?B?S3VZYTNJaUpJTzFwS3BTZkhxdjIvekRKMVRKVnRRY2FoZHpNd20wZDhvT29D?=
 =?utf-8?B?bVNxUEs2MnZITjV2SlUwcTNKL1dZN01jbkFUNmljcmE2YytidDB0QWJ6ZjV6?=
 =?utf-8?B?SEhobk4yTTRGMmlndVZqcmR4dmR6a2tzdXV0TllwNUxaN1V2MXRmcGp6V21h?=
 =?utf-8?B?L3ZUOFZOOThCazlhaExzZmFlSlpjZmxjMWQzeDMrT2hjZ1JQTFBWczVhMUlo?=
 =?utf-8?Q?XfwI=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(1800799024)(10070799003)(366016)(7053199007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YUI4MlMxQW9ldmZvTlQ5bit2TlowcFZ6VDFPTlZtbkEyMEQzR1l3SG9MQ2E0?=
 =?utf-8?B?dG9DaWJXelZKMDR1OVV2YzlvQkgwb3JIZFUzTXp2ZVJGN1VpaFlCZ05HdWFM?=
 =?utf-8?B?SjZ4SjZpejRFQ0VnWHhoenF2N3Buc0Z3Y0I5YjlLYzg4TzNCZlNOWHNZKzVi?=
 =?utf-8?B?Y1VvT2hXVlJZY21SQ1c4S3JEdXhaYU9qYWlyYXF3Z0daNHFEUlFTazNUNkxq?=
 =?utf-8?B?Z0pRZm9FbHRpZWhPZ2Z2QWZSWjRxbkFDRkVUNSsyK0c3cy9aSWpvNzhBbkww?=
 =?utf-8?B?UWVnb084V1N1YW8wNFpJQVdxZlQ2NU51TFNiUnZmK2xWK0xyaVJlelVxZjcr?=
 =?utf-8?B?a0I4ZE5aTGhZWG96RnJxVE5iRTFSMWVhNjVnSjhET3lUSDBwV0h2alpKaFNT?=
 =?utf-8?B?VURRam9EaHdaOEc0Kys0UFdtaUJxcGFreTI3YWYzRTNlS2FLWWgzRlVaSW1E?=
 =?utf-8?B?QnB2TndYSjI3bHlJSjNZajRwbkIvRnFkTGtLYVZ0SEFKcy9XVVFyMmExSmww?=
 =?utf-8?B?NjZtc2VkSFUwYlJGd0NoM3MwQStmemdJdWYzOTZCejlnT1dmV0U3Zzh5amRa?=
 =?utf-8?B?bHhTZUZBaXhPdVlKOWN1Tk9uY042RFk1T2dqa0k5VDVkbXBiVUJJLzF2RGY5?=
 =?utf-8?B?WFh0cG5tTGZCZ0Z2UjEvQUtYRjZUWkI5aDNQSEdvYVhkNDl0Y2dJL3B1a3N3?=
 =?utf-8?B?RDVYaFoxQmd3NUhvelMvUjlYTWdDRlkvVlNmakNUV1I1TkZ3VGxMVk9ISDFL?=
 =?utf-8?B?dHZrK1h1UFVrZG1ZVHR2OGV0YUNvQWlsTkpYeHl2Q0h1ZUJ3TG9vZmtIT1dG?=
 =?utf-8?B?RFFweCt5QktWYXRDWG9rUEtDZ2M0dVpqaU9wWkxXNGdXT0NIeXo0aCsvVmVt?=
 =?utf-8?B?MXkrM3FoeTYrTDZ3YXZ5Q0gyZklnWG4yQ3d1WW9JbllWMkxUZjJOVE9MMzBU?=
 =?utf-8?B?UUs4NnR2ZHliTzA0RHNSOUl6ZDZmVUZ2Mm51TEUxYnBuZ1lwRnl1aUVDUVht?=
 =?utf-8?B?MFRWbGY3QWVSVHBZelJqYUJkVVcyV2hrQXR5TG94S3VVOVZXZXhXZ0RoMldp?=
 =?utf-8?B?TS9wQlRWSW95b28rbGVXK2V2OEZJVjU4MTRSVkFpUnhVckg3Lzh6N2tuRTNM?=
 =?utf-8?B?c0Y3NTJleENLS214ZG9tWTR1dXdDZkpzQ3pSRWg5enVYNGxxRWVaL2RnSHUy?=
 =?utf-8?B?VVVqZ1F4SU5vYzB3ZDlFL1UyMGcxNTJzak5nUkJsTTBUcnBzaTBFNExibW5Q?=
 =?utf-8?B?YzQ4bHVYVVdyZi81MnpsT0xadzNrZ091aE5rWGQrSFl6RHNPSWhFOHQrU3Ra?=
 =?utf-8?B?KzQyMlR1RUpFNEpsYzAzMVh3UWJ5SGx2aURxQmVQZjhFaFRHOUhHLzYzTTQy?=
 =?utf-8?B?Tk5JOUIxN2EwRm96SDUvTWExbjdYLzJoWndET3pPM3dPd2tkMjYveTA3cFgv?=
 =?utf-8?B?dnAvRTh6QVJvbXBtQ3JwdHNoVzAxeXZWTklFR1hCUFlYUjVxbDE2dWoyOTZP?=
 =?utf-8?B?QmN2WllQYVA1RnRzR2Frd0tpV1pOTTUyMy9lU1BmV0hVYXBwWFdNTW5rVmxS?=
 =?utf-8?B?YnprU3FYcnY5SHQwZTFpSVoxOTBIc2d3b3pwcTlkQm9ITmlySU5jRjExZ3g1?=
 =?utf-8?B?ekRFcVJpNytJdDAzaFZUL3NMRXY3SkF0cDl5TVg5ckN1TzFrMnE1YW4yU25T?=
 =?utf-8?B?RWRIdXhzaEo4bitJMjBEbm5RaWRPcnZhbXArRC9QSUpicFRSLzZ1TDdSQy9C?=
 =?utf-8?B?eDFGM0pEQXFGS0pzZm1jK09LbGZESE1ldXlYQWVyUFd1OWZNZWtHVWZpOEYy?=
 =?utf-8?B?eThNKzJZM05yZi9xbktUM0R3dUw0NkF3NnBmcWxEQmo3SmRJMTRoWVVlYm9w?=
 =?utf-8?B?ZUNJMUNsd1RPSXYxUlRieWkrL0NOcGhrdWVlS0dodnNpT2tOSDRXTFVFUUxw?=
 =?utf-8?B?TUdpUzVydjlNbWZHSUZEZlhza043Q3NPVUt2U3EzbGpZRTJpdTdRVVl6YWFM?=
 =?utf-8?B?djRQSm8vS2JxT0NjaTlnMlNWQkRrOHpDZElGbTdPQS9TSjdyVTJ0cE00KzFo?=
 =?utf-8?B?SjVzRk8zS2tTY1dyMHN4bzVIQmpJTUwrVjE3eUJxbTFlT2VuRlRtQUVTWTJU?=
 =?utf-8?B?UFE1dmxkK0w2aGV0dDQ3K0JPOWlVTzVrOUdHSE9YRUp4ODNmUnk2Wm1rL2Zj?=
 =?utf-8?B?Zjc1ZnNndU90K1UrOXVtVHhJNlRTNzRtTjRXWG9XR2U0YVhqNXF0V1JmeVpE?=
 =?utf-8?B?aW9rNExhcU1tQVBCcS85YjlUbjFaNHQybjNvZ3lCelpHeDd1cXJwN1RNQW9P?=
 =?utf-8?B?eFYydHZLQzVXZ2dZY09RUXVwNDg2VjErTXhlZDdHN2lLeS9rbTRBZz09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 345381a8-35f7-4429-4477-08de57756dfa
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jan 2026 16:11:40.1741 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XVIZWvz97TCZeZD0vO/hclIQ0mf5LrOafnlmMbT0kwgOWWrwXwo4l2wFq7fr3jOQcb9/MyvONx28ps+iTLjSTA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CWXP265MB5227
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

On Tue Dec 16, 2025 at 4:27 AM GMT, Alexandre Courbot wrote:
> The opcodes are already the right type in the C union, so we can use
> them directly instead of converting them to a byte stream and back again
> using `FromBytes`.
>=20
> Reviewed-by: Lyude Paul <lyude@redhat.com>
> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>

Reviewed-by: Gary Guo <gary@garyguo.net>

> ---
>  drivers/gpu/nova-core/gsp/fw.rs | 40 +++++------------------------------=
-----
>  1 file changed, 5 insertions(+), 35 deletions(-)

