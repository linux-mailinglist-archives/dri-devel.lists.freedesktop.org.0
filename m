Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2ABE3B3926F
	for <lists+dri-devel@lfdr.de>; Thu, 28 Aug 2025 06:07:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7FD5D10E931;
	Thu, 28 Aug 2025 04:07:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="NXOxynvv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2066.outbound.protection.outlook.com [40.107.243.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1FF4F10E92D;
 Thu, 28 Aug 2025 04:07:25 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eE/t3eGaO9lp8FQ8HOKdyw9xwveBU/bCkTRmgv+eCfth0cP2PA5LiQrN6kT9IDhH3eWfxlrZ2/SWbSIcr698PZiAatcgbh/vFofWV+t/Q+TlcrngjPJJcDWqT1m7D/R6vy9MfcZ/FplyV6d9JILcoDvgsOKU5pwqBl6c7dNB3eVbGUuB2e6n3Z+V/crEvBvl6C1gXw+Ul7I2hgzp8yg+thWaLTjF/QiykMaPrOmswoD55cFslrx0tqwnAvBnQcqayQySX9jS8jyOcmhhe9yjwpsucKNAtlny59BXvOZHqu9UmMtxfydMkXXzEIdy+pNUVuFrCgPDSGKqKECkf7E0OQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QVLRFpTsK0xzuWfOpoMxypepu83Sw0sq4QW8ZR301RU=;
 b=yu4ZoH83eIEL5Ml0uZBCYQIfh6HYeuSx68Iimq3q9KdWVPGytmsg+74pE2XVPvaD3zfKQ9OwAwkuVptv1tZdEaNcwoGa3AHl5xzZymYNiGDvlF3fq5XIaFwh1Hna68oAxZthovaBqJ67VBBhPcUKApnEnDJe5jbGek/BOTYf/t/m5dvA0H49p7xLo2X/dHLwsGCg00DXf3Eu2GXKxvXfN9uCux7qba3LQfZ7JrYKwm3tsHdhvT/U19xL04Ai2sei14TJZADNvjNCOEv7ys/ab8qwxI7qrZh5ftkcqoTYwWACzkvyKQwAUgtjCwDIwaRURz4l3wYCQL1RSXpBMmzxgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QVLRFpTsK0xzuWfOpoMxypepu83Sw0sq4QW8ZR301RU=;
 b=NXOxynvv1cueD94qh0608M62C4//Y06ILwHTgJH2AmEa60+aWsUJm3tksGJMtlKVG0JZm7NBd/dL1tuMwAx25dp305rVGQPeeVe4sHanaq6CIT/uOPuWs3ejbVB6x3JfeLPjPEttfNqFaCrN+MTxu3UkdRFUaXCmUE3kSCbUC3yAyOEoPJBwyziYJg5CiKDvLXV/qNaquOkhqCwJdcV2QywugJt+6Nb03aqirWOeE8kZ28Ub1Orz1M7h8cpv0JWHaq+zumb/WE+cS5WHdBC7vBHGcXGBQAOtsQY+sb3DkqU81nwd9M2Cz8ZoNQ+Bc2Qq88hw8Gqh4Ct7jdj30W8OKA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV2PR12MB5968.namprd12.prod.outlook.com (2603:10b6:408:14f::7)
 by CY5PR12MB6081.namprd12.prod.outlook.com (2603:10b6:930:2b::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.13; Thu, 28 Aug
 2025 04:07:22 +0000
Received: from LV2PR12MB5968.namprd12.prod.outlook.com
 ([fe80::e6dd:1206:6677:f9c4]) by LV2PR12MB5968.namprd12.prod.outlook.com
 ([fe80::e6dd:1206:6677:f9c4%6]) with mapi id 15.20.9073.010; Thu, 28 Aug 2025
 04:07:21 +0000
Message-ID: <dcc0e439-3a68-4262-aa56-d5b9aa78384b@nvidia.com>
Date: Wed, 27 Aug 2025 21:07:18 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 6/8] gpu: nova-core: firmware: use 570.144 firmware
To: Alexandre Courbot <acourbot@nvidia.com>, Miguel Ojeda <ojeda@kernel.org>, 
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Cc: Alistair Popple <apopple@nvidia.com>,
 Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>,
 rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org,
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org
References: <20250826-nova_firmware-v2-0-93566252fe3a@nvidia.com>
 <20250826-nova_firmware-v2-6-93566252fe3a@nvidia.com>
Content-Language: en-US
From: John Hubbard <jhubbard@nvidia.com>
In-Reply-To: <20250826-nova_firmware-v2-6-93566252fe3a@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BYAPR02CA0004.namprd02.prod.outlook.com
 (2603:10b6:a02:ee::17) To LV2PR12MB5968.namprd12.prod.outlook.com
 (2603:10b6:408:14f::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5968:EE_|CY5PR12MB6081:EE_
X-MS-Office365-Filtering-Correlation-Id: 003c1eec-568c-4713-0321-08dde5e8633e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|1800799024|376014|366016|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SnQwQnM0K1dLLzE2LytuakhsL25nVTRmaFRoWEhNT3hVOUFUY1J4cXZuOWJ6?=
 =?utf-8?B?T3diM29zSFJIREFJRDYxcUdEWWxUcUpaSEdSOENxaEQ3Z2ZaSHFudG9TRnZv?=
 =?utf-8?B?YTlHU2NPK0hmWjBOZ05CaW9SVzZrdmVlVTJJVkdZaUdQUkkxNE91T2N4WUdQ?=
 =?utf-8?B?VCtjc0YxeUM0MngwMkdySG5uSCtJODdrQjI5bEJMMHQwcGVWK0dRYnZVMjJB?=
 =?utf-8?B?TUpsM0FXVjdDVzlwUDlQSG5yOTgrQ0lxNjl5Uko2eXFhUHBrUi9yYlhzZXM4?=
 =?utf-8?B?dGZZdGRmV3NSZklDODZ4QWw2bW9CR05mQWJJL0tnbGcxa2VEWW1oeUpObW5u?=
 =?utf-8?B?elRUa1ExYTQrU3JmeHduY09vZGpIbnUrZmJEcVpwTmNCTnhEbHMzaG1kK3lZ?=
 =?utf-8?B?c1ZNTmJGekJOQnR3aWJ4dWRPSjVMRTNnV292ejNTOUVJbU9PWGp3dWFCcnZu?=
 =?utf-8?B?NWRmZElBNVpzemNHZmlxcTBqK3NEbzFISkE1ZVk0clV0TVNKNHQyYnE0NTZJ?=
 =?utf-8?B?MmxhQ0xHdnloZnhvS3VNM2ZIeE1Ybm8xOSt3WjdrYlJEenpUMFBnNyswUUdF?=
 =?utf-8?B?WTNkTlRxWG5EUjB1cWRKVEJ6NlpBSDM3dTU0azBNdXNCVy8yZ2Q0NEtsUGlX?=
 =?utf-8?B?SDRpS0JFTjJjS1ZjcG4vWlZTRXkyZ29Fb1RyV1BtNmpGNHNTemhZTjg0QXgv?=
 =?utf-8?B?dWNIU1BUYXNpM3VzTldsWENBRDlZcjFrQW4yemYyaXlOWlRYZ1FETENFVTNn?=
 =?utf-8?B?blhoR0QzZ00va0JyK0wvcENMN09aU04wWXpHQVFqaUFSam1BcE4zZGZFd2Yz?=
 =?utf-8?B?QnlrMEZwcUR2QUlRWkI1Y3NEWWxUd0dHOS9rNklKaTZuWGZTazV5R0p2eGpZ?=
 =?utf-8?B?WTJxc29abktIdHdtcStaQy9ZdUhYWHJ5UnRzUytEOVJxRTNDNzFqaGVNQUFH?=
 =?utf-8?B?UmlGN1Q2UXhJcER2ZWQyaE9tclJnaUZaZmVMWE8rM0lUQzF6M2JWeFBDaWs4?=
 =?utf-8?B?cFZVZkQwdEsvSE9MYTRCS2RvWXRPTHRoa1hqQitsMlRnakVjMk1NWXpZVEhE?=
 =?utf-8?B?bnpQSDVnS0VubmtqNkIyYVdJRnllZ0xQT3ZzSEdlei94WnFXU3Jid2ZncWs5?=
 =?utf-8?B?ckEzbEFjd0htNTd1SHlyNGpOS3dWd244L2llZ2xhWHk3aEY1cnZQbmFZNXA1?=
 =?utf-8?B?S3F3RitCVGVNejRVQ2NpTXVxa096QW5nYXR2ZEJHNzRZZWozV0oyL1RxZXQ3?=
 =?utf-8?B?NHQ3bnM4bFFaSFgwaFpSamF5bElXcWZNWVdhTmhHWGFnMGJvWXNHa0JWWXBm?=
 =?utf-8?B?NUlqVit0ZjNRaHBmSTF3NjNyblVRTGdYVlNhV1pHNDdFaTRTcjJtb3FWMUcw?=
 =?utf-8?B?TGphSzdEQ1hacktPMVRFYVBjeW5RRE5xeGg0SHBKMFZDVTd1S1I4c0FRTHUw?=
 =?utf-8?B?UFdSL1NxOWtzYWNYY2NaeW9OeDV6Z1FVWS8vWWVyS3Q5NHNHWWQxOStCdWg3?=
 =?utf-8?B?WEY4ZCtQbStBdWJGUzVWWFBPaVZwcE1ubTRGV2dSeHBCemJ4c3Y2cGhEU2pq?=
 =?utf-8?B?Vld6TlNyWVVxSTA2dEdnNFlRZllremxvQW9qMGo3OU0yeTZjeUgzb29QM0N6?=
 =?utf-8?B?czlDOTQ4TktEdzRQTmJSN1lBZ1dENUMyZ1p3Y2MxVHNmMkpIUG4xRHdyT2dE?=
 =?utf-8?B?RG9JQU9wVnN0MU02UC9oL01vWVdNWEV5RHVKVms4VllOUmVwdWtOSnpQdlFo?=
 =?utf-8?B?SDQ2M3pHdmpmWjlPVDZhb3lGbExTUVhKL1ZWa21QaTQ5VDd0OWM1NW45aDBi?=
 =?utf-8?B?SXlXbXN5WEVyV1J2WGt5d29PSGRNVldGeStTWGMzaEFHM2wwVVd3K0lTeGwr?=
 =?utf-8?B?bG0yQlJ3S0VsUVdBNjJ0V2N4UWd5VHg2aXd5Nk9BalJQS2dtOFplUEdvVmFj?=
 =?utf-8?B?Q2FwcTBFendCcWxLa1hJamNpZDlSeERaSW9XNGQyUGp2MlRxV1VUNEFYOGNC?=
 =?utf-8?B?NFlpcXpyS3VnPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV2PR12MB5968.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(1800799024)(376014)(366016)(921020); DIR:OUT; SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SmYvaktkSDFVOTJ5YzZOZGRidDlCWXBQbFVzamJkQmlrYURXVjIxd0FtRXlk?=
 =?utf-8?B?c3l1azN1Q0JBcHpFTWQxOW1XdEU5ZXI4dnVzb3Rqc0FTUC9ucjNCbWZSSDhq?=
 =?utf-8?B?MkZRcCthZi95aUxicm80M3Z6SzNHQUdOSWl4aGxvVHduQ2xyaWp2ZStsZ0h1?=
 =?utf-8?B?RXdKM3Z6UXJQQjVFYmRsTGowa0RhbGdUb21yTHk1cUFrYmhOaHB4RnpYTjNO?=
 =?utf-8?B?bUVRK1J4b2ROM3RkZmRUK2hRdGcxdnRzWjMrNS9RNGVGM0ZYanpYQ1NxUFpK?=
 =?utf-8?B?anFSZG5CZzYzN3haQndwekl5TnUvdWpQWTgrQ1ppSXBSckpQdG9vMHJpUTlh?=
 =?utf-8?B?RXFLZlVQckd6NUUwYkpsWmxUQVcyYko3TzRaZmwrVm1xc1JlTyt3VHlKTXp3?=
 =?utf-8?B?OUpJdVRlRjRjL1NzNHFOR0FBSlM2UlA2SXJBdnpVUVV2aEVyVXFRRzZLYW1E?=
 =?utf-8?B?dkVVLzk0YThhcytpTkZqcGtndXFJdEZ1TVc5U3ZzMTFsWWxUU01ZeHpJOGJw?=
 =?utf-8?B?WjFHeWdaeVc5cmdRbVc5VG9KL1NrVnJkcHNiV0dqdnM3Vjl2NkZwUGxxT3R6?=
 =?utf-8?B?cnVBZk1mcEZmNnYwemkyTnVHK1lDdlU3Ty95YkczTnk3bGdWU2VVbThTM3Qv?=
 =?utf-8?B?b1VqM2Q3eEJPdFVSSTZDQ09takdhYk9TMTVWZjRTVzlQWXk1M05YNkcvZE5C?=
 =?utf-8?B?MEM3V3VTVXpLUmE3dUpUaVBhTFJ1Rk1sN3dud2lzWWI1cm1mR2R2d2JsTXFB?=
 =?utf-8?B?MUJiZTZPU0F3L3FkMjMrSW1CWTVjakRwaVZISDNPT1NETzFEOXpyOXhFd3VY?=
 =?utf-8?B?TElYTzBKYXQ5c0M2TSthMHBDbTA3TENybUcvYTVhc3RLQzVrU1A3ays2STV1?=
 =?utf-8?B?a01sckZ2L1hCc3ZlcWtJendDdWlMdXFzaWlISktKOXVtUWZ0bU9vYjRsMURx?=
 =?utf-8?B?bUJheVdrVWQyb0hMOTN1Vm1vVjl3Z3JNdEx3TFFnMU9pbEhMMWlyRVdVYlQz?=
 =?utf-8?B?NnhtUmFuMVRnK1Y2a0x4amVsejEwWWNYaWZOK2FkalkvYlByQzJZWlJaeFJm?=
 =?utf-8?B?UjRqU25ZWVIydkVhZzVHRmJXdXhCVEtQc3lCUnU1aGdDWHVDVXlzOXJialRN?=
 =?utf-8?B?MGhKK1JoWDZtaVV4TlYzbzVVZVZCZlRGOFV5am9YSnRhM2t0RUN1Yjg2YXpj?=
 =?utf-8?B?UHBvUGE3K0JDaGttR0FlakRGSXRwaHgxRVNaM093SjhVRDdrdnFJZktzVEhW?=
 =?utf-8?B?aGZLRThqY016YXRPQlkyRXVWVUZxdStXNlpuSkxLZ1dwek15b2t0ZitNTFJa?=
 =?utf-8?B?M3dSZDFIdTBQQnJtNCtQeXNyQXFzMm03K09aOXQ3d3BOSkI4eWRVb0FJUWRU?=
 =?utf-8?B?czFrUUc5SHN3OXplWGJHakE5RUVSOCtvVzFXRzN2d0R3MDJnb0tHZzltSU5p?=
 =?utf-8?B?TFRRZVh0eDVGcHVBSmU5eXRCdWljcG1PWjBLN2I0V2V4SVdIRUYyVGNQaDdj?=
 =?utf-8?B?bVNwTzJJOVhHVkpnM2RvYVR1UEZFZzgxZmpqVGVqTEJXZ3BDK2pteFhBdG1G?=
 =?utf-8?B?VnhsZzJvNkE0bm81cnQvOFdkaGZYSXoyRzBjbXF6N2VJRktqbEZJbDBIdXZ4?=
 =?utf-8?B?UGVxMDMrWVkyN3RsL0Z6a1VZM1ZENnBoZlZMcWg2M0x6WHpuYmVHN01DcjlQ?=
 =?utf-8?B?eWZFZDZaVk9aNTVVQ2NETHlyUi8rWnFVVnV2ZGc1WVJVZ1FvcjlON0IzdllF?=
 =?utf-8?B?YVo2Mk84WGNPamI0SW9IWENybnNLdFRjNWN1VmZOY0t6Z09OUVVUOUsvVlRZ?=
 =?utf-8?B?MEhFYUhTYXk0TWk1cW1EYllSYzQyb25Fa2oxNkpYUXVucmNjdmNQNGlwbS94?=
 =?utf-8?B?VndQMVZ0TjdPRi9peVd5NUJJaUlBWUZncVh6Yjh3eURIZldBNVJLQUZsaFBV?=
 =?utf-8?B?OW43THc2T2lYUFFUNnZPbmNjdHJwSlVkN0JkNWd3KzdKcWU1UDBmaEQvUEdB?=
 =?utf-8?B?a1FSSkFXS21LcThnZ2RtL01CWGFsVWNWdmlvU2ttRW5may9mcVdJOVgxS2U1?=
 =?utf-8?B?bG04MmMvcHJPcWRIRDU0Q1JYbEtHMjhsTWhwTEhjK3N5WXFjT29YRFk3K0l0?=
 =?utf-8?Q?ErDLSjJDIKK+PfLVPkAKlm5B6?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 003c1eec-568c-4713-0321-08dde5e8633e
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5968.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2025 04:07:21.8567 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wY4ELeZ4hJ1PdZJGrI7eeQcRwVJ/ltH86VfJX/5kAssDk10wdYzCc/UCp+sPHl99AZLgvgbeSpyuPiWLSCW5hQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6081
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

On 8/25/25 9:07 PM, Alexandre Courbot wrote:
> 570.144 is the latest available into linux-firmware as of this commit,
> and the one we will use to start development of nova-core. It should
> eventually be dropped for a newer version before the driver becomes able
> to do anything useful. The newer firmware is expected to iron out some
> of the inelegances of 570.144, notably related to packaging.
> 
> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
> ---
>  drivers/gpu/nova-core/firmware.rs | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: John Hubbard <jhubbard@nvidia.com>

> 
> diff --git a/drivers/gpu/nova-core/firmware.rs b/drivers/gpu/nova-core/firmware.rs
> index fb751287e938e6a323db185ff8c4ba2781d25285..f296dee224e48b2a4e20d06f8b36d8d1e5f08c53 100644
> --- a/drivers/gpu/nova-core/firmware.rs
> +++ b/drivers/gpu/nova-core/firmware.rs
> @@ -27,7 +27,7 @@
>  pub(crate) mod gsp;
>  pub(crate) mod riscv;
>  
> -pub(crate) const FIRMWARE_VERSION: &str = "535.113.01";
> +pub(crate) const FIRMWARE_VERSION: &str = "570.144";
>  
>  /// Ad-hoc and temporary module to extract sections from ELF images.
>  ///
> 

thanks,
-- 
John Hubbard

