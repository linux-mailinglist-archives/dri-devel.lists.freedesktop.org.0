Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4738B96EE1C
	for <lists+dri-devel@lfdr.de>; Fri,  6 Sep 2024 10:31:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A881210E9B7;
	Fri,  6 Sep 2024 08:31:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=vivo.com header.i=@vivo.com header.b="ULMvr2T3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from APC01-SG2-obe.outbound.protection.outlook.com
 (mail-sgaapc01on2081.outbound.protection.outlook.com [40.107.215.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E042610E9B9
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Sep 2024 08:31:04 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YKM88BOtk2EPC0HxI4ULRPA7Hj8MU4inNoj3aK/AJNbjuLjF3Wn0CTJV0kKn7gZxXhXSF+3hZy57o5rWR8UUbi3AWrjoQb7IQypUnHLyAWlRF3yCIJQ4kM/MjHK+2kQ7mrww5HbutOuLVcKhSMG/0CE4N/OB9xNmBpz95xK5zCF+oO7s3CIuJp50xydmTMlNuukvsszP+VOsLyT7yqFUeOLxjC9p3t8oqWj7Yc6T2Snp9Wu2aTGKt4GXHjvwaw0utTHS6lHWzNRH8pIeFOu+wsV9O4ay04ur0QlPUZn9/TEgWT47Rum3xOu8CadhQkjD2VlN1nE+kI29QOp/E3i8Zw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JbhBvyD5LbS7ledqBSI6wx2UPgRfa05EjEQ7xDy3h+Q=;
 b=DBW1Mrm+Rs7ZWn4/WtZZuv7E3Cwb2MNUeXkOr1n9ISw7Zt8mYLrczZ6/h/x1EN6kKzcedbuAZEPnA/8TxAfVwDXizBkkKA8Q90chpzPwdj96CCjjdkVvP4a3L0zDxOkTsnbj/MK44V4jDbQ/wHRinC87prRZ5DKjJK5ikth5crKgpm4hh/QmK6eH1uZHmBBuxteBriw6m5kDpeLZqN/mbdeDMR4+T2TKsr48CcQovr99YTcXraLODMh/ilWl+tUsMv0fK6hUpCHoW9fVX2kfZytm5Demc1TIoPhh8rbBO178ZQaqlkIsUlhJ77khOkWmRdR1JVPRAGIGssqOdhrRqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JbhBvyD5LbS7ledqBSI6wx2UPgRfa05EjEQ7xDy3h+Q=;
 b=ULMvr2T3sDiZ7vuHhAhckiUJIKPGBktAGh6+9kJIrOePKUv78LCEkSEMwHi6MZFWn4KcC/cHSiJIBP/muWHlwKhRTkQKNBRfk+WxgrEhfNde3J3IT1Ve46qJwfXCNc836xnh4DD7vBRjXz87l4baBZqrLjztcZpSSMBX10ChNFXomT2yKsJ7BZTfzJhIfqn6sgmAXBSAbHTpbBnlcxJ9RqMiinw6VaRnUGMPjbCSknvNDvbB/zsKXmgbYk0HLTa5aTVH5WM+1hZNJ4SRISkrtQmwRQCW/xdtzLH3w+0BiNsHBWseBMFmPdrUYTdAGsFYIqZ2T+I4a/4Gn7LmxcD3Dg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from PUZPR06MB5676.apcprd06.prod.outlook.com (2603:1096:301:f8::10)
 by TY0PR06MB5847.apcprd06.prod.outlook.com (2603:1096:400:276::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.28; Fri, 6 Sep
 2024 08:31:00 +0000
Received: from PUZPR06MB5676.apcprd06.prod.outlook.com
 ([fe80::a00b:f422:ac44:636f]) by PUZPR06MB5676.apcprd06.prod.outlook.com
 ([fe80::a00b:f422:ac44:636f%6]) with mapi id 15.20.7939.017; Fri, 6 Sep 2024
 08:31:00 +0000
Message-ID: <d213c597-ec2a-4685-9048-5b477f64853f@vivo.com>
Date: Fri, 6 Sep 2024 16:30:56 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 4/7] udmabuf: udmabuf_create pin folio codestyle cleanup
To: "Kasireddy, Vivek" <vivek.kasireddy@intel.com>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Gerd Hoffmann <kraxel@redhat.com>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linaro-mm-sig@lists.linaro.org" <linaro-mm-sig@lists.linaro.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Cc: "opensource.kernel@vivo.com" <opensource.kernel@vivo.com>
References: <20240903083818.3071759-1-link@vivo.com>
 <20240903083818.3071759-5-link@vivo.com>
 <IA0PR11MB7185AA974CF7207048178187F89E2@IA0PR11MB7185.namprd11.prod.outlook.com>
From: Huan Yang <link@vivo.com>
In-Reply-To: <IA0PR11MB7185AA974CF7207048178187F89E2@IA0PR11MB7185.namprd11.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SG2PR04CA0164.apcprd04.prod.outlook.com (2603:1096:4::26)
 To PUZPR06MB5676.apcprd06.prod.outlook.com (2603:1096:301:f8::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PUZPR06MB5676:EE_|TY0PR06MB5847:EE_
X-MS-Office365-Filtering-Correlation-Id: 24acc3cd-53e9-4189-fa13-08dcce4e3ce7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|52116014|1800799024|366016|38350700014; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Sk5IZjVWTWxRMGpNVmFXblk2RllvNytya1EwSmZjczU0YmNhdCtIS1VJZ2Z1?=
 =?utf-8?B?RWZPa1grbVEzWGQrcUZUR0hLbExxMFFTdUZ0ZkR1UERGODdWVm5wQVJxYTBD?=
 =?utf-8?B?WldUeG1ldi8rbGdNOWN4NkFNTmI1Slp2YXNudnpqWmNwbWtZMTUyc2U3WmMr?=
 =?utf-8?B?Q3RNNUlHTURjbVdWcnp3U1pvRXVtRWcvWnBHOTZoTFp3Uzc5eTB2U21OakFl?=
 =?utf-8?B?bDVrV2Y3WDMyVnN2UC95MHpCN0Z5c1pNekg0cGRuL1dWbERYTjBCK2g3Sjgw?=
 =?utf-8?B?YlZSZmIzOWMwd3MvaFRBV3NoT1gwQU5zMkFXVmlEMFF3cXozRWxCT1Y1WUhs?=
 =?utf-8?B?TmhCVlVQa0F1bDl1cCtHSTZZWkFQYS9Pd29seFhTa1MvQnBidVB3Nmd4S3pv?=
 =?utf-8?B?eEhOU0FuQ2d5ZEFJNWsrY1VLQkNabnhuOFYvMkxpdXNqV0VoWUk4bTlWUEwx?=
 =?utf-8?B?UlQ4UCtySElmY1lSaGQ2aVhEZkxGNExtSkNVMzJtVUpGNEpzRzRwYUgrR1hn?=
 =?utf-8?B?THlYOW1QSmdHRFBNYmEyV1ZlekcwRlZkc0FlUFlOaXBSNHBldGVHZEwrc2hq?=
 =?utf-8?B?U0NUNC9vTytDZVo1ZVpPSFdCZmNIMFBvdlNveEJtUmhkalczclFua28xQ21F?=
 =?utf-8?B?UitKNjlhVXdGN0pvR08yZWdxamtOTWNoMmxuYXlOUSs2UGxSL1orY0RmR1JZ?=
 =?utf-8?B?ejFrVGcvSUcvblg5bVA2TUZUNW11TWZ6cmFQZG5CajhIRHlpbjdTZlgrK0hP?=
 =?utf-8?B?cFg4NmN1QXBrVnppdEM1WWdVYUFhd1g2WHhEVUJvUlRORnhHc3BjVnExNW02?=
 =?utf-8?B?UGIzTUVQOWFmdHRBRmVIWWdmRnlPUElSck81YWFYM2lMS3U4aTZwaGRPdzE5?=
 =?utf-8?B?ODdnY2RsVmVWL00rWG8zS0RMUEt5cjNhWG02UkxQeW0xTXpOWmhjOW01WG96?=
 =?utf-8?B?NGZpL2F0bHhnQ1llb0hPL3N5WWk2ZTMxRjBBeEljZWlGTGdYVDhVdlV1blFF?=
 =?utf-8?B?OHZRcEt0UnRVSHM2S1d3UmFGZCtoTU1wbTA2SlkrN2lrSE4wak4rL0RXbE5F?=
 =?utf-8?B?bHZGQURsaE40RnorWHlOQk9ZODZxS1ViQmFqUldqay9lYXFiRUE5UjlKalZr?=
 =?utf-8?B?YmovSFJOTGp3UmlkamdKSmkzNFYvNXdBV3BiOE03TWJHM1lvbjFMd05FaHRo?=
 =?utf-8?B?SklKeC9oVXdRcmZvZWVzWVZ5MnZMYStxMWdVWDJodDMvajBGT1UxamFDQ1dl?=
 =?utf-8?B?b2V4dzZPRlk5MExoWkI4bzB0cG1NZXFpSm9nTUxwdStnK1pqd2s2TUZkcnF2?=
 =?utf-8?B?WVBLODVZSVF0T0lDOE1rUUlJRFJUVkNCR2UxZFMwR0ErOFhJYjJid0hTMnE3?=
 =?utf-8?B?bzhkRWNnaEkvelBOdmhkMVJpZi96Y0JzMkJjZlpKSVdrT2cvVnEyZlF2TjZ2?=
 =?utf-8?B?UzN1YlRjM25TMmNHZWlmSnFkbjYzblQzNTFSMWdZY2lVVW00ZmR0WXMyTjJl?=
 =?utf-8?B?RG1OQ0k3UnUxMXJOVnNEdEd4UU85MU8wUlk0UFlXMktYQUQzcmtCcElrZS92?=
 =?utf-8?B?OElRK1hmWXFLcWRTeXJPVzlZUzVaVFdkeTMzYTB1TVcrcC9MSjIxcVVaR1pi?=
 =?utf-8?B?Wlh3VVlGNVpyVkN5MEdZOWJVcExIY0FwbXg0SC8vMjdDaDlyNlcwRkJwU05U?=
 =?utf-8?B?a3N0UWt6eHlwZzZGQ2lGMEtqQ1UwYlQ2aGJ3OFpXek91NkhuRUl0RFBpdmox?=
 =?utf-8?B?L2Y4MWhrc3RwaVA1LzllOEtaZUJFZmlHTTlTTnhkRHNLcTFYNWo4RmtNWlhq?=
 =?utf-8?B?VDhHSVlib1A1ZVZJNW9yWEdZdlJJN2R2VjFwVVQ5WDZYbktjN3EzWWY1a09L?=
 =?utf-8?B?Yk42cHp2RVFqS2R6bXQ0cTVrL3ZTb2M5R1ZabkVRL0N6NHc9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PUZPR06MB5676.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(52116014)(1800799024)(366016)(38350700014); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TSsxd0NKVUxoZjk4eU5kWWxaRnlJMUd4aDB1Q0U2RGtjN0tLOFJ3MXhFZzM4?=
 =?utf-8?B?UjgzbGZ5Q01Xakx4dndEa0lFN1o4MkJiOFVxNnRFenFocVJmdkR5UjY5Zm1E?=
 =?utf-8?B?dFVmcjN0SU03L2MySllheU9tYmtwemc3SSt4eFArWWlocjBQb2VBRSt6Zld4?=
 =?utf-8?B?ZkRYUlprbEtvTEM4TTMrMjMyVjE4MlhPV3gza0drZTVlOUh3dDdGZ2lDQlox?=
 =?utf-8?B?OVo4a25Vc1lIcFRpREd6d0N0YytCbUdXc0VCZld5L0QrNldzSEtUZ0UyWEVC?=
 =?utf-8?B?WTJtbnZUcGcxWVVnQmtQQ0xLc3ZzR2owUjJQanVHUHBlcUQ1VUZPT1Mycmcw?=
 =?utf-8?B?cUhGVUIrdzhIRU9nTkhXSGlPc0tnY05Mc0luL1hYb29VeThKQVovc25YaFdT?=
 =?utf-8?B?TzY3azBLa2FiaGVnTzB6cW5RVjZOSVZVcUtMc1kwemFsUzcwdFdFU1AwU3Br?=
 =?utf-8?B?bGdNeFZob3JFZUlyZ2grUXQ1VnVLYUNvOC9iNmpoQzZkQ05ucHVTMUV6VkFN?=
 =?utf-8?B?VVVMUG8vQTRQRlZRVG5mZnZJaWc4RVgxa2VmWFB6d3VPZHE1Qk5hUnZYcjNB?=
 =?utf-8?B?QVNVd3ZJS1FCZXd5Q0ZiTVJJbzdCN1JXSTIzbXNGQmdxcUVkcDFmTzczOGQ1?=
 =?utf-8?B?djk4aWpwek5lMmw3bHN5bHlLdjdsVHFyaW84TUEyZ2hhZlZ0cm9Uc3hWZkxl?=
 =?utf-8?B?a3VvRUk1OXJSZlpiZDRlWEVVMDVLV2FPOTZBcE9wVHJkWFB1c3RIWjl2SkhZ?=
 =?utf-8?B?dE8zV1ZYMVI3SzlDc2d0WGJDbXlab1ZQWWM5REJ6bDhLTEx5UWFETDdOUVRH?=
 =?utf-8?B?TmNlRUdUTnI0dzhaWWpzL3A4ekJMWTZyZFZUVThtWVRWY3I4TFNXN2MvQkd4?=
 =?utf-8?B?djk0cnNMSjJGZnlSdVVpMG9SS28vdDRYYk9KdzBHL2orWTMrK0xDQ1h3bGJw?=
 =?utf-8?B?LzVXSk5UWTJUMVIrNEEwTCtNOVY2VFFRZFZPUFZvWG1aOFJOSXBqT2ZabHh5?=
 =?utf-8?B?c0RaMVhKNVoyZ0xRd3NtVEVzTUl1VDVuUXpHSFA0Ty8zaVNTRTA5UE8rN2Va?=
 =?utf-8?B?Z1RpQjdVL2crb2pxSXhFZmZUNnp3VDQ4TUc5Vzc3UmdVN3VmOGoydkxLK0I1?=
 =?utf-8?B?cjdLSTBrVXQ3ZjIvL043MkNtZjdFSXJHZTBpS1dkMGpuUjJSZEE1Uld2TlJ3?=
 =?utf-8?B?N0VOa2RxbmRBT2duK0xnVWF1dlRON2dqa09PNHZRTFBHUTZTRloySEdvL3lV?=
 =?utf-8?B?M1BwcnZHcDk1cVg1d2wxZDRFZXNvd1BZSithZmVuWGVCK09Ta3B2aUJWVG9z?=
 =?utf-8?B?amRTdVR3N0dlMlNtZUZ3blRNbHhweVZjY0gvUjluaURLUzJnc1Y3bHNHSy9W?=
 =?utf-8?B?S1Z4dkxMeStZd1lYTVZLKzV4Sldxam1oOURIYmFqKzFmMFluNVVRM3NiWEFG?=
 =?utf-8?B?VDlDdjVHdXcya1c3ZlNLeE1YTnIrL3NZKzZOZ0VQeVRGanpBV2NVQmVkc0xN?=
 =?utf-8?B?N3gwcDFNelVzc3BvNVNPamtTS2k3M3hFUXUxYjlCQmllMjBQN2dJcDFzZ1Rh?=
 =?utf-8?B?SVFiS3pOTmxycU1ubzFQZEJSZzdBWmxYWVRxTE1laGZBQXcreXZQUThBaXVp?=
 =?utf-8?B?cWZtVmpSamROb3o4OTJIbU5Bd2wzaHVHYkpCYlVxNXJUNS9wc1BtdUN4cWw3?=
 =?utf-8?B?d1I0ZEVtMnZvd1ZHNEhKRStFbTY3bmNocmhLQUdXL1U5ek41U3M2c2o0UWtU?=
 =?utf-8?B?UXRxUVBySDVVTFp6Sk1KYWR3V2dLTGYvYnYwekZON01DV1VOOU9Ob1BJOVdL?=
 =?utf-8?B?bXU1Wm1ZNWxPM0UrVmJkTElGR25Fb1JvQW51SVYzTWkwcGlCdDhRenNkdHhI?=
 =?utf-8?B?Mjg1aFppbmowRmpidkEydG4vN2FXT01WcW1Lbm9Dc3RPM09CaVprVFA2bytt?=
 =?utf-8?B?UDgwM2FSY3R3RVROZnNRMExoeWtlRStURGlHRXJ6djVaQWxJWHVNckVyYTR0?=
 =?utf-8?B?eFdDdllkbG9NTDF0T2xiWjBEaUpWUmxtNE9GRlN4dUZTUzNWODVId3JudHlO?=
 =?utf-8?B?aitTbUVrNXlqVlFJdWJWME9mU0hRczhnLzVQeW9nbmxhV1YwTTVvMjBNcmpu?=
 =?utf-8?Q?Hb/pdWbG0YdwzfwL0wGJU/jbM?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 24acc3cd-53e9-4189-fa13-08dcce4e3ce7
X-MS-Exchange-CrossTenant-AuthSource: PUZPR06MB5676.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Sep 2024 08:31:00.6309 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HKQohjvoatekopPUtMA94BUcHS7eMkb2iLRhgM6+RXC6vvT+8D2Qe3dl9cZ8YKK6rGncO/EK7iow1Ao209CmLg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY0PR06MB5847
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


在 2024/9/6 16:17, Kasireddy, Vivek 写道:
> Hi Huan,
>
>> Subject: [PATCH v5 4/7] udmabuf: udmabuf_create pin folio codestyle
>> cleanup
>>
>> This patch split pin folios into single function: udmabuf_pin_folios.
>>
>> When record folio and offset into udmabuf_folio and offsets, the outer
>> loop of this patch iterates through folios, while the inner loop correctly
>> sets the folio and corresponding offset into the udmabuf starting from
>> the offset. if reach to pgcnt or nr_folios, end of loop.
>>
>> By this, more readable.
>>
>> Signed-off-by: Huan Yang <link@vivo.com>
>> ---
>>   drivers/dma-buf/udmabuf.c | 132 ++++++++++++++++++++------------------
>>   1 file changed, 71 insertions(+), 61 deletions(-)
>>
>> diff --git a/drivers/dma-buf/udmabuf.c b/drivers/dma-buf/udmabuf.c
>> index 456db58446e1..ca2b21c5c57f 100644
>> --- a/drivers/dma-buf/udmabuf.c
>> +++ b/drivers/dma-buf/udmabuf.c
>> @@ -330,17 +330,67 @@ static int export_udmabuf(struct udmabuf *ubuf,
>>   	return dma_buf_fd(buf, flags);
>>   }
>>
>> +static int udmabuf_pin_folios(struct udmabuf *ubuf, struct file *memfd,
>> +			      loff_t start, loff_t size)
>> +{
>> +	pgoff_t pgoff, pgcnt, upgcnt = ubuf->pagecount;
>> +	u32 cur_folio, cur_pgcnt;
>> +	struct folio **folios = NULL;
>> +	long nr_folios;
>> +	loff_t end;
>> +	int ret = 0;
> Change ret's type and this function's return type to long for consistency.
>
>> +
>> +	pgcnt = size >> PAGE_SHIFT;
>> +	folios = kvmalloc_array(pgcnt, sizeof(*folios), GFP_KERNEL);
>> +	if (!folios)
>> +		return -ENOMEM;
>> +
>> +	end = start + (pgcnt << PAGE_SHIFT) - 1;
>> +	nr_folios = memfd_pin_folios(memfd, start, end, folios, pgcnt,
>> &pgoff);
>> +	if (nr_folios <= 0) {
>> +		ret = nr_folios ? nr_folios : -EINVAL;
>> +		goto err;
>> +	}
>> +
>> +	cur_pgcnt = 0;
>> +	for (cur_folio = 0; cur_folio < nr_folios; ++cur_folio) {
>> +		pgoff_t subpgoff = pgoff;
>> +		size_t fsize = folio_size(folios[cur_folio]);
>> +
>> +		ret = add_to_unpin_list(&ubuf->unpin_list, folios[cur_folio]);
>> +		if (ret < 0)
>> +			goto err;
>> +
>> +		for (; subpgoff < fsize; subpgoff += PAGE_SIZE) {
>> +			ubuf->folios[upgcnt] = folios[cur_folio];
>> +			ubuf->offsets[upgcnt] = subpgoff;
>> +			++upgcnt;
>> +
>> +			if (++cur_pgcnt >= pgcnt)
>> +				goto end;
>> +		}
>> +
>> +		/**
>> +		 * The term range may start with offset, so the first folio
>> +		 * need take care of it. And the remain folio start from 0.
> The comments above are not very meaningful. Please rewrite them as:
> * In a given range, only the first subpage of the first folio has an offset, that
> * is returned by memfd_pin_folios(). The first subpages of other folios (in the
> * range) have an offset of 0.
>
>> +		 */
>> +		pgoff = 0;
>> +	}
>> +end:
>> +err:
> No need to have two labels here. Keep end and get rid of err?
>
>> +	ubuf->pagecount = upgcnt;
>> +	kvfree(folios);
>> +	return ret;
>> +}
>> +
>>   static long udmabuf_create(struct miscdevice *device,
>>   			   struct udmabuf_create_list *head,
>>   			   struct udmabuf_create_item *list)
>>   {
>> -	pgoff_t pgoff, pgcnt, pglimit, pgbuf = 0;
>> -	long nr_folios, ret = -EINVAL;
>> -	struct file *memfd = NULL;
>> -	struct folio **folios;
>> +	pgoff_t pgcnt = 0, pglimit;
>> +	long ret = -EINVAL;
>>   	struct udmabuf *ubuf;
>> -	u32 i, j, k, flags;
>> -	loff_t end;
>> +	u32 i, flags;
>>
>>   	ubuf = kzalloc(sizeof(*ubuf), GFP_KERNEL);
>>   	if (!ubuf)
>> @@ -349,81 +399,43 @@ static long udmabuf_create(struct miscdevice
>> *device,
>>   	INIT_LIST_HEAD(&ubuf->unpin_list);
>>   	pglimit = (size_limit_mb * 1024 * 1024) >> PAGE_SHIFT;
>>   	for (i = 0; i < head->count; i++) {
>> -		if (!IS_ALIGNED(list[i].offset, PAGE_SIZE))
>> +		if (!PAGE_ALIGNED(list[i].offset))
>>   			goto err;
>> -		if (!IS_ALIGNED(list[i].size, PAGE_SIZE))
>> +		if (!PAGE_ALIGNED(list[i].size))
>>   			goto err;
>> -		ubuf->pagecount += list[i].size >> PAGE_SHIFT;
>> -		if (ubuf->pagecount > pglimit)
>> +
>> +		pgcnt += list[i].size >> PAGE_SHIFT;
>> +		if (pgcnt > pglimit)
>>   			goto err;
>>   	}
>>
>> -	if (!ubuf->pagecount)
>> +	if (!pgcnt)
>>   		goto err;
>>
>> -	ubuf->folios = kvmalloc_array(ubuf->pagecount, sizeof(*ubuf-
>>> folios),
>> -				      GFP_KERNEL);
>> +	ubuf->folios = kvmalloc_array(pgcnt, sizeof(*ubuf->folios),
>> GFP_KERNEL);
>>   	if (!ubuf->folios) {
>>   		ret = -ENOMEM;
>>   		goto err;
>>   	}
>> -	ubuf->offsets = kvcalloc(ubuf->pagecount, sizeof(*ubuf->offsets),
>> -				 GFP_KERNEL);
>> +
>> +	ubuf->offsets = kvcalloc(pgcnt, sizeof(*ubuf->offsets), GFP_KERNEL);
>>   	if (!ubuf->offsets) {
>>   		ret = -ENOMEM;
>>   		goto err;
>>   	}
>>
>> -	pgbuf = 0;
>>   	for (i = 0; i < head->count; i++) {
>> -		memfd = fget(list[i].memfd);
>> +		struct file *memfd = fget(list[i].memfd);
>> +
>>   		ret = check_memfd_seals(memfd);
>>   		if (ret < 0)
>>   			goto err;
>>
>> -		pgcnt = list[i].size >> PAGE_SHIFT;
>> -		folios = kvmalloc_array(pgcnt, sizeof(*folios), GFP_KERNEL);
>> -		if (!folios) {
>> -			ret = -ENOMEM;
>> -			goto err;
>> -		}
>> -
>> -		end = list[i].offset + (pgcnt << PAGE_SHIFT) - 1;
>> -		ret = memfd_pin_folios(memfd, list[i].offset, end,
>> -				       folios, pgcnt, &pgoff);
>> -		if (ret <= 0) {
>> -			kvfree(folios);
>> -			if (!ret)
>> -				ret = -EINVAL;
>> -			goto err;
>> -		}
>> -
>> -		nr_folios = ret;
>> -		pgoff >>= PAGE_SHIFT;
>> -		for (j = 0, k = 0; j < pgcnt; j++) {
>> -			ubuf->folios[pgbuf] = folios[k];
>> -			ubuf->offsets[pgbuf] = pgoff << PAGE_SHIFT;
>> -
>> -			if (j == 0 || ubuf->folios[pgbuf-1] != folios[k]) {
>> -				ret = add_to_unpin_list(&ubuf->unpin_list,
>> -							folios[k]);
>> -				if (ret < 0) {
>> -					kfree(folios);
>> -					goto err;
>> -				}
>> -			}
>> -
>> -			pgbuf++;
>> -			if (++pgoff == folio_nr_pages(folios[k])) {
>> -				pgoff = 0;
>> -				if (++k == nr_folios)
>> -					break;
>> -			}
>> -		}
>> -
>> -		kvfree(folios);
>> +		ret = udmabuf_pin_folios(ubuf, memfd, list[i].offset,
>> +					 list[i].size);
>>   		fput(memfd);
>> -		memfd = NULL;
>> +		if (ret)
>> +			goto err;
>>   	}
>>
>>   	flags = head->flags & UDMABUF_FLAGS_CLOEXEC ? O_CLOEXEC : 0;
>> @@ -434,8 +446,6 @@ static long udmabuf_create(struct miscdevice
>> *device,
>>   	return ret;
>>
>>   err:
>> -	if (memfd)
>> -		fput(memfd);
> I think this needs to stay because if the seals check fails, then we would not be
> doing fput(memfd).

Yes, there a mistake, but I'd like set it into here:

  		ret = check_memfd_seals(memfd);
  		if (ret < 0) {
			fput(memfd);
  			goto err;
		}
due to only in inner look, memfd can get. and memfd change into loop var.
Thanks

>
> Thanks,
> Vivek
>
>>   	unpin_all_folios(&ubuf->unpin_list);
>>   	kvfree(ubuf->offsets);
>>   	kvfree(ubuf->folios);
>> --
>> 2.45.2
