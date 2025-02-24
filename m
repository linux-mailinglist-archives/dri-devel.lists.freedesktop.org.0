Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1715DA412B9
	for <lists+dri-devel@lfdr.de>; Mon, 24 Feb 2025 02:40:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D522510E0DF;
	Mon, 24 Feb 2025 01:40:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="tVEQOXJO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2042.outbound.protection.outlook.com [40.107.92.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F0C210E00F;
 Mon, 24 Feb 2025 01:40:13 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Xw+SyKcTVeoGFuAi7Q5qyRTPU50+aSRCMEBG13kn+pofVTSoUSadRmKLqt+vL0F/7k5D3PVMF3hqvdDa7t6YB9Cs9j3IuI3vtncUFXFEPhF10XPv0bOWWAQH9E0DIVatOVBUR4Zomx7mVumy5UmHQ1jSefDsh5Sa2JwGM9gKvtXACWp4zm2JeUhvQX3LL5s96xwKL1YCkm96WodG5PnZBpwrQ/m3i+zYYOOuX0PqwtUZXjVUjPVAvmOaVtGO3D0f2DdMgEAD1J6i335Bv7rrkg7ciI7W3HiQTu79cYrV7e9T25eZwgmD/y/l1hUbEEu6JdnYmbqVazCYNAr37OtNRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x3qLghnNPSpv28C+9yLjwqamPJoPy/FHP/KwrGkvra4=;
 b=lp37qGwbb59UIjuCJkEbGUaAPFwfg5KEH50080N+K0RPtZQxkW+a1qNcDU1k3mm4tMjxIU4awmJ55ojY4fAoCQs711aFuyisBQd/XndE40G5ulv+mzheN3L7aNJNOTHRyY/aMagdFP2hx9o5PZuLFEi7PnJtRLbGtXaOVlEryah1sgrreJvCtegaOr5BpO9XdpkB8XM0xLhk4sHXzZNDAAgOCV7OcdNS5mucnrQtwPIGenM5h8YIYbzTzmvBA5UF5EkZddFvgbipmw4bG+uRt0/D7UjaGzbFW2ivldOJbmdcJnUdEecmMpdI0j92JUw4AOGRfbNRHFOp4tJ3uJZA1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x3qLghnNPSpv28C+9yLjwqamPJoPy/FHP/KwrGkvra4=;
 b=tVEQOXJO6YDEvw1monToo/m6mtwdxPAJ0JChSEjMoQUW+XQjrscfs9LDDrfPN1ouEcpP23y4fP6nDyrQKmrMyR7pOdNCSIFzyVl1WFd6rpCG9EuLocbzLRtKvC2dEl3BePrjdWS14dTMzNnD0XSzIo5fpAcNAS7JZFChVX0Cn/Av/2rleUJ/X9b2nglnk8AENOW1r8TVnpkS//hJu5O81tU1n6OXN+S7hoaB2uCkAZ4cxmuFO7JUBIPRS9I+phpsDcpVPYlrHgvLeQWpohkP2Xt4DLwSZBW8wjU3hkf4M0A2u0N4HOuJGXQm+MmnI8zvKOBxf5NUn5tW7DBEvkH1eA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by MN2PR12MB4303.namprd12.prod.outlook.com (2603:10b6:208:198::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.20; Mon, 24 Feb
 2025 01:40:06 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99%6]) with mapi id 15.20.8466.016; Mon, 24 Feb 2025
 01:40:05 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 24 Feb 2025 10:40:00 +0900
Message-Id: <D80AK2CLL4AZ.1G6R7OBHOF08O@nvidia.com>
Cc: "John Hubbard" <jhubbard@nvidia.com>, "Ben Skeggs" <bskeggs@nvidia.com>,
 <linux-kernel@vger.kernel.org>, <rust-for-linux@vger.kernel.org>,
 <nouveau@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
Subject: Re: [RFC PATCH 0/3] gpu: nova-core: add basic timer subdevice
 implementation
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Dave Airlie" <airlied@gmail.com>, "Danilo Krummrich" <dakr@kernel.org>,
 "Joel Fernandes" <joel@joelfernandes.org>, "Boqun Feng"
 <boqun.feng@gmail.com>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a
References: <20250217-nova_timer-v1-0-78c5ace2d987@nvidia.com>
 <Z7OrKX3zzjrzZdyz@pollux>
 <CAPM=9tyu84z4Xk5X0fykO3Dazby2UqRgwtN4woNKe4Z2yMyDZg@mail.gmail.com>
In-Reply-To: <CAPM=9tyu84z4Xk5X0fykO3Dazby2UqRgwtN4woNKe4Z2yMyDZg@mail.gmail.com>
X-ClientProxiedBy: TYCP301CA0064.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:7d::16) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|MN2PR12MB4303:EE_
X-MS-Office365-Filtering-Correlation-Id: ba0c19a2-78e0-4d68-cb59-08dd547429c2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?OTFRRE1zYll3UGJWTVphNXNualoxZ1pQZk8wb0FKamgvdmowVWhtSUZlWHp3?=
 =?utf-8?B?ejEwbEpBUk1JRVRjbDdXd3lJMldwQXgvRVZPNFFZSWVxajUzelRmM0pwaUxo?=
 =?utf-8?B?US8raGtVR2EvVUNnY21wYm1mRDNDKzFza0tPY2s3Q2xTVXJJVWp2dkEzM29z?=
 =?utf-8?B?c2ZzWFRrQ3ZmQWo2NlZjcHJRa0x3anpvYlJNS3hBNjE4VURpZ2loTzg2N085?=
 =?utf-8?B?NWtvc2hQMjVXckttOHVNNkpDWW5IRWdseWp5UG43NHJybnJVVWtIMDZzQ2Zv?=
 =?utf-8?B?c2RBaVZLQ1haSnJuWkN0Z1FEaTRoSUg3azBoU1pBOSs4V2orT1VBVUJxTUI0?=
 =?utf-8?B?aU8yK1ZBUEoxdHRaNzZjMWhmckNsd1BTQkhDT25nbzZuQkQ0TnNORER2MGRC?=
 =?utf-8?B?RDV0U242UWczakhYbUFwMW9FNldlVURKeGM3WmRiVGhkN1h2cjlhZFRVL2N1?=
 =?utf-8?B?aEd3czNzTkhqZzNQZEtZVmZsRmdGSXoyUHN5aDVQcmY1TDJUdVNkZituWVpS?=
 =?utf-8?B?a1YzLzRrYnRxaTZIVzRDa1RyZWs5bWJTUk5jVmowd2E1UEN6VFFlWEhHaDZB?=
 =?utf-8?B?cXMySTVSdnBERzhvY0Frc05RRmFhSmhSNmlYd2RBSUVlUHRVMFlHcEJXZjlN?=
 =?utf-8?B?MmowbitpYll4UkhlaEF6ZEp1T2N2TlY2eVVIdE1jQmp6NTkzTWJhc0NJUzFa?=
 =?utf-8?B?d3J0cDBqSmNrREdQalNSOHBxdWcvazN3V0V5QmxDRlZwcXo5eXhOVVVCNmtI?=
 =?utf-8?B?T2JXa3ltbG40bU9NR1AyVXRkUC9JYlJOVjlETlVia2tFcm5aWmtWVlgwRE9E?=
 =?utf-8?B?NDBYNDdwVjBZeC8vaUtQMWRBdFA1ZVAwS3lLV1ZrOGhXMTVHZTRaeEpmNy9E?=
 =?utf-8?B?eVdXTTFHS0F6UEFpbC8ySU96T1FWYnR3VUlyZXIwQ0dIOTN6R2p0MCtJWUJw?=
 =?utf-8?B?YjI3NnFTcGRuNFdHeWhUejUwNFBlb3lKU09NTCsrWE5wTldpNUFMOVhZWklF?=
 =?utf-8?B?a1JDdTFPTmtoZUpUQU8vMFFGWWM2SW55TmxoUjlrcFF0Wm51dnhrMVVwMVNa?=
 =?utf-8?B?RGJnQ1U2R2ZxZXNVQXBYcE4wbTE3eExKMzRlaWRjWjVTNXdKaVFpNnFZMUph?=
 =?utf-8?B?Nlg2Uy81cStYS0YxZlFZckpQdGZnRW5xYW81c1czWmluR0kvekprL0VrYkJ5?=
 =?utf-8?B?cEtJYk9Sa0xIUFk4aksrR1pmUTljcVg2R1pyckFxQ3REVmlaTklSSmRPWmNQ?=
 =?utf-8?B?RW5iQW1hbEV2ZjdqT3FvWnd3ejdVYTRxNjMwcnV3Ynl0TkxIOERSaW1wVkZy?=
 =?utf-8?B?WHBESkZmdFR4YmJuMnZnRFYxZGNqekVOVXNLWHlaRTVpM2p5SkxoTXRwTnBQ?=
 =?utf-8?B?WGdrZ3hab0ZLaFBOd3BGbnZWbUF0TVZhWldjTXZRYTBVU2k4bmRvYUxJRWpE?=
 =?utf-8?B?L2ZRazFxMHlvc2xXcWROcU9tK2FPUlVrTWcybFRtVFdRR0E2dDBHeEVUSzN6?=
 =?utf-8?B?R1p0QWhoVVI3RU5ycGt4d0VHYXF1bkxOd3lRNGcvdlJEQk5XcXJzT2hHdEYw?=
 =?utf-8?B?MXhldGk1bUNFWG0xOCt3bnhRRWNmcTRqTXVzQXhzQllQRkpyZ1YwREM1NmEv?=
 =?utf-8?B?SEw1WjhYZDNFajEzVlVnTnh2Z3JVVWxHWjZLWEJWOHFmcGdnODhZaFFEUVZv?=
 =?utf-8?B?Mk4wK2tnQ1A1M0Z2OHNuRnJ5eGZaRE9aTGJNOVRNeVNDejRmUThmSTFZTDA3?=
 =?utf-8?B?Q0xaeFUxZWNJZExLSmxZc1kyNEVDMlFiam9aZVZHdmdHcDM4NGVrSlRhb2RW?=
 =?utf-8?B?M3BaVzZUdmIrREl4QXJ5bzRIM3hBWDdkYmpYcXBVZkU2QWRLYytkYk4wSi82?=
 =?utf-8?Q?auYiXbE3eBblz?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ekVWaXN6V1RIamhnREorRG9DUzZLTFBTTFpsQ1Q3THkxZjJxbHY3MHlROXd0?=
 =?utf-8?B?UTJRVXcxazJVeVRGTmJ1OXd5b0FhaC80R2xtWlp2RVU2aHVzZXp5RE1KWktq?=
 =?utf-8?B?aldZZ1JBN2hMYjR5VEErODYxRmZMTXZwUzVKUEVha1R4VFJWQXZNSEpROVdX?=
 =?utf-8?B?dStMRk5LVEozVG1HaklwajhoUWwvNTZFdGdIamYwNnB0WkFTMklhSDk3ZWh5?=
 =?utf-8?B?Z0F1dmlHTGtlc0RidVowdXZhWUFDVUgwa2F6VmZFU25ENnl4c2R0L2xpaElq?=
 =?utf-8?B?U1BxUmxKZGtJRkp1UEV4NkZvNUFiZ3RHME9kVFlaekExbDZ2TENobjBNdVRo?=
 =?utf-8?B?SjVTTXRJYUI4MXNqREduazlqME14V2dHaEZWTzRPb0w5U0gvTFkxM2NNMXll?=
 =?utf-8?B?RzIwa2RXYnVMdnpNSE00UUdjaTlVRkV5N1dveTdmaWxKcEV3aC9oa3FBamFK?=
 =?utf-8?B?ZFdiSVN2ZkFFamZCc3p0WC9EYk1tSkZSL3NMTHVIQmw2WHZSSGdRTVdyZm5z?=
 =?utf-8?B?eUs3eEMwMGI0YnkrYkR2U01LZ1dzOXNQKzkvaUpYZ3dobTJEUFNOSzZKaExx?=
 =?utf-8?B?aGNJU0ZPTHJVQXJ2MGN1bWJqOE1zMGk0QzlRWVdqSGplcFJDcVFVU3h2YmpX?=
 =?utf-8?B?dkVBbkgxMWNYYXErWXZuUXlGNlBlRTlyRjEvZm9pWnF0VVlHMUxkMkVkanoz?=
 =?utf-8?B?WElEYjArLzBKcGIva3BlYXlHUFBheXZZWlZmdUZPb014am5va3BhbENSVEh0?=
 =?utf-8?B?UTRtYVVaQVlBekR4MElQWWpOV3J1UVRNUlJXc1NkWUt5WFdqcy92TkZuUk9t?=
 =?utf-8?B?WXRDM0RUaXlYbHFBRC9EZW54blQ3Y1cyZmhBcHl0YmpBeStGcE4zUXZ3czlX?=
 =?utf-8?B?Rkx2WW02UktJaTl3ek1sd2RhWmFybzNmcW9GWFU0ODFrbzJsSjVnbE11NkZ0?=
 =?utf-8?B?dklJQWw1d1lieUtBc3IyUTA0S28vdXFxRVVFRGNabzRTTCt2ZldqT016MWVM?=
 =?utf-8?B?VDJldHlZZUZLRFpUYk9UMXFhblN3VVVnRHdjNjlKUlg2Z3M2UmhyNHdqeU1i?=
 =?utf-8?B?MUU1OG5XVzlmYkorL2UxV1R2NUl1M0ZlcHdvWFVEMHhKRFVGS0FQN3VnWmhZ?=
 =?utf-8?B?SisxSzJyTVl0SklhWlJiWkU0bjVCMUtMQmEwdHhKMEtlK0lSd2d5bVUxck8y?=
 =?utf-8?B?QXhobVd0YmliMnhacnFveG9QaU12VWowQ1FEU1ZzSzZETWlDVCtGUjN0a0J0?=
 =?utf-8?B?SS9sMVB6TEZPUFZLSkhBdGtkRFIvL2g0d0YvZ3lPRll6VmpQbHFleEJsanBI?=
 =?utf-8?B?YUxFNlVsRjJHMnpFdWNjYmxLNjFSVEx2dW9nejQrY0lnWncrTkwrYjVBckNv?=
 =?utf-8?B?dHRVVVBVRDhqTFdiNDhoU1JRVnNVS012TWdBRmJvSlBIZEYrR0pxa1RHL0tW?=
 =?utf-8?B?ekdpeGdNOEppbzB1NzRrT2tHY0tHeGxzaktsWXFRS2FTNTlrcFhMc3RQTkM5?=
 =?utf-8?B?NHlEOXA2WmI0elN3SFI2aE42Q2pwRVBVSGg1SGZUeXdZMnc5RXpNemRoekhv?=
 =?utf-8?B?eEdPb3p3ODdXSTZOZzF1SllTK1oxWi9vMnJJNHIyNmc2UUxYaG9tSHZIK2JI?=
 =?utf-8?B?TXNkZ0szV0M2YWY0c21MWnZoa29zSWpxVDl4cFR2MEltRnBuQmE0a3VNTUdo?=
 =?utf-8?B?Q0NhSnNhc2pDR3NRSUhXYXoyY2NoeE1aME5RaFV6elRyaXcvK0I1K09LQmN6?=
 =?utf-8?B?T01RTmhBWlZVT1paZXVtZGNHWEZUYlA2MmNaZWswL0pRR1JMTUprRWZvcDFq?=
 =?utf-8?B?QUI2R1hPdFFaYlZQV3NhRVcydVJhckpwWFZpYjU3bFN4OUFLcFVTSEFycmdX?=
 =?utf-8?B?SmlLcWZVODhpa3pnZzlpY2FTTm5Rbkt0QkVaaXhXM2h2NGpaTXRUcHlJb0RE?=
 =?utf-8?B?ci9xZFlTK1FEZnhnMEY4N2RYa1oxMWNIMU1pczNSTXRCSVl1bGwvb2N5U3lP?=
 =?utf-8?B?Mm9ieDVZeDlPOHpHVVhTVmZrYThVUFpNVGNUVjc5MlRiakhIZmVXL1RVbjh3?=
 =?utf-8?B?YnAwWld5V05lcG5oV0tYS2VLOFlUckR2UVY3bUdyMjZjeFJIbTcrNGZSeE9N?=
 =?utf-8?Q?rkQ1fGJeukaBVoFe48Mi53yb/?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ba0c19a2-78e0-4d68-cb59-08dd547429c2
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2025 01:40:05.3515 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Sh6JUWb4+CjsBiZeQM7sFv2qAlNIYmGqDgH796LExoFLJjgBYaXD9KJI3bgR3awhSiagdnK6VMBnTffoZI0EKg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4303
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

On Tue Feb 18, 2025 at 10:46 AM JST, Dave Airlie wrote:
>> 1. How to avoid unnecessary calls to try_access().
>>
>> This is why I made Boot0.read() take a &RevocableGuard<'_, Bar0> as argu=
ment. I
>> think we can just call try_access() once and then propage the guard thro=
ugh the
>> callchain, where necessary.
>
> Nope, you can't do that, RevocableGuard holds a lock and things
> explode badly in lockdep if you do.
>
> [ 39.960247] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D
> [ 39.960265] [ BUG: Invalid wait context ]
> [ 39.960282] 6.12.0-rc2+ #151 Not tainted
> [ 39.960298] -----------------------------
> [ 39.960316] modprobe/2006 is trying to lock:
> [ 39.960335] ffffa08dd7783a68
> (drivers/gpu/nova-core/gsp/sharedq.rs:259){....}-{3:3}, at:
> _RNvMs0_NtNtCs6v51TV2h8sK_6nova_c3gsp7sharedqNtB5_26GSPSharedQueuesr535_1=
13_018rpc_push+0x34/0x4c0
> [nova_core]
> [ 39.960413] other info that might help us debug this:
> [ 39.960434] context-{4:4}
> [ 39.960447] 2 locks held by modprobe/2006:
> [ 39.960465] #0: ffffa08dc27581b0 (&dev->mutex){....}-{3:3}, at:
> __driver_attach+0x111/0x260
> [ 39.960505] #1: ffffffffad55ac10 (rcu_read_lock){....}-{1:2}, at:
> rust_helper_rcu_read_lock+0x11/0x80
> [ 39.960545] stack backtrace:
> [ 39.960559] CPU: 8 UID: 0 PID: 2006 Comm: modprobe Not tainted 6.12.0-rc=
2+ #151
> [ 39.960586] Hardware name: System manufacturer System Product
> Name/PRIME X370-PRO, BIOS 6231 08/31/2024
> [ 39.960618] Call Trace:
> [ 39.960632] <TASK>
>
> was one time I didn't drop a revocable before proceeding to do other thin=
gs,

This inability to sleep while we are accessing registers seems very
constraining to me, if not dangerous. It is pretty common to have
functions intermingle hardware accesses with other operations that might
sleep, and this constraint means that in such cases the caller would
need to perform guard lifetime management manually:

  let bar_guard =3D bar.try_access()?;
  /* do something non-sleeping with bar_guard */
  drop(bar_guard);

  /* do something that might sleep */

  let bar_guard =3D bar.try_access()?;
  /* do something non-sleeping with bar_guard */
  drop(bar_guard);

  ...

Failure to drop the guard potentially introduces a race condition, which
will receive no compile-time warning and potentialy not even a runtime
one unless lockdep is enabled. This problem does not exist with the
equivalent C code AFAICT, which makes the Rust version actually more
error-prone and dangerous, the opposite of what we are trying to achieve
with Rust. Or am I missing something?

