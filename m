Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C81D1A2C14D
	for <lists+dri-devel@lfdr.de>; Fri,  7 Feb 2025 12:07:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E6F4C10EAC3;
	Fri,  7 Feb 2025 11:07:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="e9xKngKs";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2062.outbound.protection.outlook.com [40.107.223.62])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B42EE10EAC3
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Feb 2025 11:07:23 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=j76bhEZJsI1634eHq8WKAHIYVPWCvtPisAxTouVN0XO2hCWgyNJvLZ5y3/GSG8PGFzQ4I3gEKyQQQBeZ4lHeajNhrO/3T1gLjhX7FtGBiw5hFb8xay9AH9lESMfiwpmQlVtUejJPiDsIN3pI/80bKVvUu6AP5WavWtV+AGG3/60sU3wMIGaLzMK0D1fTxWJhP31i/5XpowZTINraIzdIiR9Zl2QrbzYjfFRpI1R7Tj3B4ndy2ckcSU32/LOsr97tAaZmknGabag9AG+JQ5Bi6d6gMNU5P+B0I/zgbYIAZAOjxe2bE1TLRVvLxDl01TLQlDaHJIBkY7TbWY9om5x9gA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dOYpOiOqcJwV9wyQ3uq8fKYYgap7NX2YLfEGSDk83fI=;
 b=Ip+V8kCp5FKZmhmmffKzmP4+JZQoqLurr2nEXcKtv8OtvjRqy64BghQk8Xcbkh81ey+OmH26egg6c4X7DZrWdlVC12FVWOb4DD6AOrqHyvohDLWUIfVOnIrSgyqoedQ2dVxAjuzKSJH5VF/PHQ4BduDdV8TKNRICbyukmHHXCED0NF14wBRSxngQKfzJt0ewvidTHD0EP7iITIlpqsukJ0Q7TUZYv+YCCJLlIYI+iYbh97DMTe4jgid0YWukohGzNb3ANJBz3gqBz8qZx7UTsi229jwW/80r4XECQ6iDZcfLEOi+BtL0OhyKdpTRBfQz6g1WGL5YrEdkaRWRFP6KuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dOYpOiOqcJwV9wyQ3uq8fKYYgap7NX2YLfEGSDk83fI=;
 b=e9xKngKsUwX5aKshkXIEGkUDKnLBCyJPlfy2F6qekqPL1m0Xf9ijKO37MStFa3tFBpMu9WYJrbPGnUlVWi6bQpTLkHgv/D9fLkpWQsHt4Nbyi3inF8KnlinLE+f+Mrje9y3MkviAFMItjbdLnz8+RgIUnpqOx84M+7CfRNrYe2I=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from IA1PR12MB6435.namprd12.prod.outlook.com (2603:10b6:208:3ad::10)
 by PH8PR12MB6770.namprd12.prod.outlook.com (2603:10b6:510:1c5::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.11; Fri, 7 Feb
 2025 11:07:21 +0000
Received: from IA1PR12MB6435.namprd12.prod.outlook.com
 ([fe80::273a:80c9:35fc:6941]) by IA1PR12MB6435.namprd12.prod.outlook.com
 ([fe80::273a:80c9:35fc:6941%4]) with mapi id 15.20.8422.010; Fri, 7 Feb 2025
 11:07:20 +0000
Message-ID: <b5cf2939-5853-4c1f-90eb-68f281106f86@amd.com>
Date: Fri, 7 Feb 2025 19:07:11 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 3/3] drm/virtio: implement blob userptr resource object
To: Demi Marie Obenour <demi@invisiblethingslab.com>
Cc: Demi Marie Obenour <demiobenour@gmail.com>, "Huang, Ray"
 <Ray.Huang@amd.com>, "Stabellini, Stefano" <stefano.stabellini@amd.com>,
 "virtualization@lists.linux-foundation.org"
 <virtualization@lists.linux-foundation.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 David Airlie <airlied@redhat.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 Gerd Hoffmann <kraxel@redhat.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>, Chia-I Wu
 <olvaffe@gmail.com>, Akihiko Odaki <akihiko.odaki@daynix.com>,
 "Zhu, Lingshan" <Lingshan.Zhu@amd.com>,
 Xen developer discussion <xen-devel@lists.xenproject.org>,
 Kernel KVM virtualization development <kvm@vger.kernel.org>,
 Xenia Ragiadakou <burzalodowa@gmail.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
References: <20241220100409.4007346-1-honglei1.huang@amd.com>
 <20241220100409.4007346-3-honglei1.huang@amd.com>
 <Z2WO2udH2zAEr6ln@phenom.ffwll.local>
 <2fb36b50-4de2-4060-a4b7-54d221db8647@gmail.com>
 <de8ade34-eb67-4bff-a1c9-27cb51798843@amd.com>
 <Z36wV07M8B_wgWPl@phenom.ffwll.local>
 <c42ae4f7-f5f4-4906-85aa-b049ed44d7e9@gmail.com> <Z5waZsddenagCYtl@itl-email>
 <7b0bf2d5-700a-4cc7-b410-a9b2e2083b5d@amd.com> <Z6T9lDSj8Y9ATE3k@itl-email>
Content-Language: en-US
From: "Huang, Honglei1" <Honglei1.Huang@amd.com>
In-Reply-To: <Z6T9lDSj8Y9ATE3k@itl-email>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: TY2PR02CA0011.apcprd02.prod.outlook.com
 (2603:1096:404:56::23) To IA1PR12MB6435.namprd12.prod.outlook.com
 (2603:10b6:208:3ad::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR12MB6435:EE_|PH8PR12MB6770:EE_
X-MS-Office365-Filtering-Correlation-Id: b3cc64f2-cf37-4783-a109-08dd4767977b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NE1Nb0VZRGQxSjU0K05ZMmZnSVdpQmUzNWRXMWl6aE5zdUdqY0ZvS2M5cjZq?=
 =?utf-8?B?cE1ybGJaU3A4NUgzbjlsaXhnRDFZZlg2MG1GOTk1dkgvaUNVZEEyZExtZG5r?=
 =?utf-8?B?eGVTeWxWUG9LRTcvYVpwYzVwRlpPRStkRVZmTVRleHVWd285b0tUa0d1bWNv?=
 =?utf-8?B?Zi9xU1hFTXJmRCt6d1JmN0xZUG15QWFZM2VObE9EV0lyd1RJZUVNSGFFdWZt?=
 =?utf-8?B?elY0VlpUazRuTjFJSGlheUUyZEx4ZFN0VEEzb1ZjdUtyS2NIRWUwVzBMelNa?=
 =?utf-8?B?d1k4Q1FOSUtBUjZtbVRQeS9KVUVpYXE3Z3RLdmY3N1A0Z1crc2Zad2VTc3FZ?=
 =?utf-8?B?Y0pZbWUzWDNCcjRNLzhjU0FwY2dyREJjazRVcXkydjlUeXA3WE5GUVh1SlU2?=
 =?utf-8?B?RXE5Y3ErVEJPaDBLN2ZJT09oYktudWIxRGZTMTNLSlNEakdNbVB6UFNCU25S?=
 =?utf-8?B?TytmdHdsdlhwWGM4YjlXREhLT3U3KzNZZi96dFhDZm1uZTUwNUlpZGNISWR4?=
 =?utf-8?B?RVdTTUI0K3BrSk5EZExYc3lPTmNYVGhvMzlHdkZVQVBZWHpwdndoZ2pQMU5P?=
 =?utf-8?B?Z1pTYittZk5GYTNlQjd4QUF6NGVhbi93SXkvNDhZOUhLb3Z5Zy9KclNpZSt4?=
 =?utf-8?B?eGxzdGxNOXhBbzRBUmEra3EwTTg1ZkhveTY4a0h5QU5rNjI1dE9MaC9uVEkw?=
 =?utf-8?B?NlIwVi9EeEsrOS9jUkpvanlmbXNtVXFwc3Z6UHNNeXlLYm5OK0VKMW53Yndy?=
 =?utf-8?B?MTNyTTVYckJvZDN5RTZsREpka3dGNlRIR1NHVXhuV0RmVDRjS0J2RjNnbWNu?=
 =?utf-8?B?UVZOaVZYZEQvU3JhK2RnRWlsS2NSTXFIcERpQXMySFJnNjAxWjBuU3VhWHhR?=
 =?utf-8?B?MDVXRHluTGRLaVJNU2pIUVlNeGVYSmMxMzZLSStqM0I1c0g2VktPUUI4VC9W?=
 =?utf-8?B?ZkhIY3JoSEhHU1hyOXRlSVlyNTBrTlRheWNod0xqS2ZVM2FpVjFXSFArdFlB?=
 =?utf-8?B?eDBtdUQ2WkdNTmpWWTZLOGVDQnRwRThXSlY1WkhJekJNQW9IaHl6WWgyckxj?=
 =?utf-8?B?S0E2RWFSeE53ZDRCWTI1RmxVa1plSmV0aUFWcUh1TXAzVnpYTTZhZzYvZ0xE?=
 =?utf-8?B?QU53MGFjaTJkOWxQV3NmK29SRndqWnZqemFvTUtxZHRZQ1hwM0NPaTNhRWhY?=
 =?utf-8?B?WU81ZkpxaThWUk1uWTNMMDZNQkMvcTVTRWp5MWRvYmtHc00yTXU0UlQvTkdZ?=
 =?utf-8?B?M241Ry8yRHBLQnZaV0tzTmdlR3FPVnVxaXc5VTYyc3FYcXVvblhIMmI5c3pZ?=
 =?utf-8?B?Rks2Y29DTmgzbHdITFJMNlltUXk3UGk5NDZyMXgyWnpaQnY3akE1b3FtKzJj?=
 =?utf-8?B?VEtoeW1VT1hZTVNwdWdJenlTN2ZwK01LMVRpb29SalJmTXU0aEVaRyt0a3pG?=
 =?utf-8?B?ODNIdEpTaHA1cmREN3NySGJURkZHdk5kQms2SVlweTJFcEFkdjU0RmF3Vi8y?=
 =?utf-8?B?dG4yVDBGMW1VSWg1bWdkaS82LzdVbkN6Q1FSUHpSRjNlT1FmUWpFRmREWEJP?=
 =?utf-8?B?ZytZMG1sTXpnUVZLaWdPbGxCTUs2N05CNk1saEFXUW56b3lUdXZnNzE1bjFH?=
 =?utf-8?B?R3hRWE5mVmFDZ2tYYXhpalIzOGhBSHNGR283Y3pKZzhRU1pCcndNdGFZam9J?=
 =?utf-8?B?cndJa3pUUTUraThKTVNNTVdrTmdPYXd2dm12V3hPZTdNUUZPZVZ5NXN6VmNn?=
 =?utf-8?B?K2dxVUp2T1JySlVFTlJNYkM2ZEROV0VOQjUySUJJcWl5QjF5RkFnTzdVNkRw?=
 =?utf-8?B?dmxPNzdFeVFMV3c3K1ViSFpDT0tCMENhTVB4bzRBVTZqVXVUdE9OZmpBcVBP?=
 =?utf-8?Q?D9yWQ4mEGk/ej?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR12MB6435.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NWM4QXJVcThEdGxkNCtVNFlaYkVmby9ZcUtiVlRmcmhRVkgyM09VTlVyVFc0?=
 =?utf-8?B?eFl3SkF1U3lManY5N1hxTmoxY2dDYjJzU1pRQWZpME51b3ZCOFIwdElVNXQr?=
 =?utf-8?B?SGhRSTBFZk56MHU2eTkwdVpBc1NFbFFIYVB2bWY1MGY0ODlTT0NzZGJaU1Vx?=
 =?utf-8?B?WkNNTHRpR2pNeUllZ1BKU0ZjaXM0TUgrZE1PTTY0MXhSaTRRQ1NnSFVpOUc1?=
 =?utf-8?B?UjlQa0VmUFp3VUZtTU9DNGxnemV3YzVMeU1RQjV1OWNsSVpGWkxnRHpVZlpG?=
 =?utf-8?B?c1V4bXBpeklycEZMWHdIWTJJcTdHWmFJU1BhQi9xSVR1QjlNdjJkUjFHOTNt?=
 =?utf-8?B?TTlhdkRNLzdZL3dGcVZ1Mk1UOEtpTkVySXArZEtHSlB4TzhURFkwV3ArT3Jw?=
 =?utf-8?B?VFJOYjNzVkY2cEVkUitJU2F6YUxEejZ2QWhUbmtHZ2FYMmlCQk80OGRIMVkx?=
 =?utf-8?B?SWtaSVJFZS91UnlvU081d0Noa2NnYm8wUzFQTHRhKzdiN3hybXB0Ry9BK1Rl?=
 =?utf-8?B?bHkxVGkwdGpxdUtka0FVdjA5THRiSEFuVFpvaHV1cC9jWjNHN2FFVDlIVUdV?=
 =?utf-8?B?dVRmNXBBYi9JeitmV1hsZlBpbWRNQmlKN1pSblpLa0NOdjQrSWRVUVRaMUMx?=
 =?utf-8?B?Tk1yalF1anV1UFFKOUkvZDkvZllOakdSN1FYRXpWcitTdTdnZEFWZUJKOVB0?=
 =?utf-8?B?TVJoTlpMK0pWMnBKMi82K29XOG0venZ4clFEOGxQQVNyeUFtU1h5dUs4ODhs?=
 =?utf-8?B?WHBxSW5tNjF0TmVHQUZTK1l4SjFObndnV1RyVDRVSkxwY0F6YkZoY1hPL1Fr?=
 =?utf-8?B?R2ZOMHF5bTlWMW5CSTZ2QUU5SmdpREErTTMwbC9NWlhwWlFZTXNHK0JoRFNI?=
 =?utf-8?B?Z3VuZm55WGh3dzd3aFQxRG1ET3lFTmRac0FLdDNBeFRqZXp3ajg5TWprOEpt?=
 =?utf-8?B?Mm1vZDVnSFhuV2RtaU94MUIvYXcyZGNiQW1HMnBhZktzclFwOWYrdWM0ZjN3?=
 =?utf-8?B?djBBdC83NFBGQ2xmTE5WaGRQTEhXTzZWcmRGSTFLcWVZbWNZYW9tM1d4Njc3?=
 =?utf-8?B?dytpaTluOTNhTlc2bnU2blh6bDJ5QVl0QnZUOS9KeG1DTlR0bnFPcVdBbE8w?=
 =?utf-8?B?YzVGaTJqWk9vMVlEZ3YvaUMwZFJGd3RSa0RITzlyZFJXdWRhblh5bE1NYmRx?=
 =?utf-8?B?TGIzQ2RVWCsxejFoK0oyVkgvcVB4OFpTeFJPczVTclpGQ05RSjhkMVJsVGh4?=
 =?utf-8?B?N3grcmY3Z3NvZ3hQVHNKcHp2SUt2czlPZEttWFVkc3pHRmNDQTNpMC9ueUhy?=
 =?utf-8?B?dXJ0RXVNMENjRVdiR0tVY0dhVkVEOHdXOHhXeHo3bk1IbjViNE53eXVlNURV?=
 =?utf-8?B?U1NtbENqTlhmOFcyS041N0RET2RPcEExMWVtaitVZ1dCUFFIQ2t3dzE4aEJS?=
 =?utf-8?B?VlJZME5XMWpRekxSZ0RXbXBRRW1hWDVDN0NpdEJEM2hmdFdIWEtoSkVXSkFD?=
 =?utf-8?B?UWdzazkwa2prWmZoWXQ5S1dTTGZKSnpJcFAycjkvSzFuWWhGOHdnTjJRWUpn?=
 =?utf-8?B?SkFjLzlYOENoT1d3bUM0elp6dDFCMXdUaDNTVGNPcEFURTE1UDV4L0U5MHN5?=
 =?utf-8?B?WXR1Mmtma3RHVDVWUGNOQ1V0U1JmdXVXM1M1SFFtSXFuYWh1NXJnQzREbEZF?=
 =?utf-8?B?Umd0QW9DQWFMRXNPSk9yUGpJb0N3dWlTTnpLVzdpa0ZBSUhBbXJNU0Fzc1c5?=
 =?utf-8?B?K1I3SVBSck55ZTY4VFFrZlFjK3Z3VHhnNUhoWi9pOVR4OFVtbDlDaS9FYStx?=
 =?utf-8?B?VnpQMmNTZEZuM3I0Mzl0ekxXSCszcmJQOTlFYWcrcGlDaU80cXVlcjU3cEl1?=
 =?utf-8?B?REYvcHBSWXpMazRjSmgwTmcyWWhOQTVlUTYwNnVQbnlqQ3BSMmRZQWdmcnRi?=
 =?utf-8?B?TUZrcUxTdnV6dXlmR3Exb2k1RUI5Z1huenQwV0pZWWx0b3BaYXdaYjdEQUN6?=
 =?utf-8?B?Yzd0YmVRWUIvSFZ1c2t5MGNML1A1ZHkxT1ZpVS9SdEdCREhEODB0aFQ5OFR0?=
 =?utf-8?B?MGFIWkpxU01aMnBWUkQyajd0WktleUxBdERBemF3TEZZTWtaSGRxcWVHZmox?=
 =?utf-8?Q?HXi8YJenGiEDQcAZ27Tbiubum?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b3cc64f2-cf37-4783-a109-08dd4767977b
X-MS-Exchange-CrossTenant-AuthSource: IA1PR12MB6435.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Feb 2025 11:07:20.8863 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2fY8gQciQUCtLJ7ZJfy3I8VV9KDG0U+RUd9dzUjkgkEbS3nRJoqo1OQpVpdJOCDQIDKfLJlBHvM9ONj7GdAjUQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB6770
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

On 2025/2/7 2:21, Demi Marie Obenour wrote:
> On Thu, Feb 06, 2025 at 06:53:55PM +0800, Huang, Honglei1 wrote:
>> On 2025/1/31 8:33, Demi Marie Obenour wrote:
>>> On Wed, Jan 29, 2025 at 03:54:59PM -0500, Demi Marie Obenour wrote:
>>>> On 1/8/25 12:05 PM, Simona Vetter wrote:
>>>>> On Fri, Dec 27, 2024 at 10:24:29AM +0800, Huang, Honglei1 wrote:
>>>>>>
>>>>>> On 2024/12/22 9:59, Demi Marie Obenour wrote:
>>>>>>> On 12/20/24 10:35 AM, Simona Vetter wrote:
>>>>>>>> On Fri, Dec 20, 2024 at 06:04:09PM +0800, Honglei Huang wrote:
>>>>>>>>> From: Honglei Huang <Honglei1.Huang@amd.com>
>>>>>>>>>
>>>>>>>>> A virtio-gpu userptr is based on HMM notifier.
>>>>>>>>> Used for let host access guest userspace memory and
>>>>>>>>> notice the change of userspace memory.
>>>>>>>>> This series patches are in very beginning state,
>>>>>>>>> User space are pinned currently to ensure the host
>>>>>>>>> device memory operations are correct.
>>>>>>>>> The free and unmap operations for userspace can be
>>>>>>>>> handled by MMU notifier this is a simple and basice
>>>>>>>>> SVM feature for this series patches.
>>>>>>>>> The physical PFNS update operations is splited into
>>>>>>>>> two OPs in here. The evicted memories won't be used
>>>>>>>>> anymore but remap into host again to achieve same
>>>>>>>>> effect with hmm_rang_fault.
>>>>>>>>
>>>>>>>> So in my opinion there are two ways to implement userptr that make sense:
>>>>>>>>
>>>>>>>> - pinned userptr with pin_user_pages(FOLL_LONGTERM). there is not mmu
>>>>>>>>      notifier
>>>>>>>>
>>>>>>>> - unpinnned userptr where you entirely rely on userptr and do not hold any
>>>>>>>>      page references or page pins at all, for full SVM integration. This
>>>>>>>>      should use hmm_range_fault ideally, since that's the version that
>>>>>>>>      doesn't ever grab any page reference pins.
>>>>>>>>
>>>>>>>> All the in-between variants are imo really bad hacks, whether they hold a
>>>>>>>> page reference or a temporary page pin (which seems to be what you're
>>>>>>>> doing here). In much older kernels there was some justification for them,
>>>>>>>> because strange stuff happened over fork(), but with FOLL_LONGTERM this is
>>>>>>>> now all sorted out. So there's really only fully pinned, or true svm left
>>>>>>>> as clean design choices imo.
>>>>>>>>
>>>>>>>> With that background, why does pin_user_pages(FOLL_LONGTERM) not work for
>>>>>>>> you?
>>>>>>>
>>>>>>> +1 on using FOLL_LONGTERM.  Fully dynamic memory management has a huge cost
>>>>>>> in complexity that pinning everything avoids.  Furthermore, this avoids the
>>>>>>> host having to take action in response to guest memory reclaim requests.
>>>>>>> This avoids additional complexity (and thus attack surface) on the host side.
>>>>>>> Furthermore, since this is for ROCm and not for graphics, I am less concerned
>>>>>>> about supporting systems that require swappable GPU VRAM.
>>>>>>
>>>>>> Hi Sima and Demi,
>>>>>>
>>>>>> I totally agree the flag FOLL_LONGTERM is needed, I will add it in next
>>>>>> version.
>>>>>>
>>>>>> And for the first pin variants implementation, the MMU notifier is also
>>>>>> needed I think.Cause the userptr feature in UMD generally used like this:
>>>>>> the registering of userptr always is explicitly invoked by user code like
>>>>>> "registerMemoryToGPU(userptrAddr, ...)", but for the userptr release/free,
>>>>>> there is no explicit API for it, at least in hsakmt/KFD stack. User just
>>>>>> need call system call "free(userptrAddr)", then kernel driver will release
>>>>>> the userptr by MMU notifier callback.Virtio-GPU has no other way to know if
>>>>>> user has been free the userptr except for MMU notifior.And in UMD theres is
>>>>>> no way to get the free() operation is invoked by user.The only way is use
>>>>>> MMU notifier in virtio-GPU driver and free the corresponding data in host by
>>>>>> some virtio CMDs as far as I can see.
>>>>>>
>>>>>> And for the second way that is use hmm_range_fault, there is a predictable
>>>>>> issues as far as I can see, at least in hsakmt/KFD stack. That is the memory
>>>>>> may migrate when GPU/device is working. In bare metal, when memory is
>>>>>> migrating KFD driver will pause the compute work of the device in
>>>>>> mmap_wirte_lock then use hmm_range_fault to remap the migrated/evicted
>>>>>> memories to GPU then restore the compute work of device to ensure the
>>>>>> correction of the data. But in virtio-GPU driver the migration happen in
>>>>>> guest kernel, the evict mmu notifier callback happens in guest, a virtio CMD
>>>>>> can be used for notify host but as lack of mmap_write_lock protection in
>>>>>> host kernel, host will hold invalid data for a short period of time, this
>>>>>> may lead to some issues. And it is hard to fix as far as I can see.
>>>>>>
>>>>>> I will extract some APIs into helper according to your request, and I will
>>>>>> refactor the whole userptr implementation, use some callbacks in page
>>>>>> getting path, let the pin method and hmm_range_fault can be choiced
>>>>>> in this series patches.
>>>>>
>>>>> Ok, so if this is for svm, then you need full blast hmm, or the semantics
>>>>> are buggy. You cannot fake svm with pin(FOLL_LONGTERM) userptr, this does
>>>>> not work.
>>>>>
>>>>> The other option is that hsakmt/kfd api is completely busted, and that's
>>>>> kinda not a kernel problem.
>>>>> -Sima
>>>>
>>>> On further thought, I believe the driver needs to migrate the pages to
>>>> device memory (really a virtio-GPU blob object) *and* take a FOLL_LONGTERM
>>>> pin on them.  The reason is that it isn’t possible to migrate these pages
>>>> back to "host" memory without unmapping them from the GPU.  For the reasons
>>>> I mention in [1], I believe that temporarily revoking access to virtio-GPU
>>>> blob objects is not feasible.  Instead, the pages must be treated as if
>>>> they are permanently in device memory until guest userspace unmaps them
>>>> from the GPU, after which they must be migrated back to host memory.
>>>
>>> Discussion on IRC indicates that migration isn't reliable.  This is
>>> because Linux core memory management is largely lock-free for
>>> performance reasons, so there is no way to prevent temporary elevation
>>> of a page's reference count.  A page with an elevated reference count
>>> cannot be migrated.
>>>
>>> The only alternative I can think of is for the hypervisor to perform the
>>> migration.  The hypervisor can revoke the guest's access to the page
>>> without the guest's consent or involvement.  The host can then replace
>>> the page with one of its own pages, which might be on the CPU or GPU.
>>> Further migration between the CPU and GPU is controlled by the host
>>> kernel-mode driver (KMD) and host kernel memory management.  The guest
>>> kernel driver must take a FOLL_LONGTERM pin before telling the host to
>>> use the pages, but that is all.
>>>
>>> On KVM, this should be essentially automatic, as guest memory really is
>>> just host userspace memory.  On Xen, this requires that the backend
>>> domain can revoke fronted access to _any_ frontend page, or at least
>>> frontend pages that have been granted to the backend.  The backend will
>>> then need to be able to handle page faults for the frontend pages, and
>>> replace the frontend pages with its own pages at will.  Furthermore,
>>> revoking pages that the backend has installed into the frontend must
>>> never fail, because the backend will panic if it does fail.
>>>
>>> Sima, is putting guest pages under host kernel control the only option?
>>> I thought that this could be avoided by leaving the pages on the CPU if
>>> migration fails, but that won't work because there will be no way to
>>> migrate them to the GPU later, causing performance problems that would
>>> be impossible to debug.  Is waiting (possibly forever) on migration to
>>> finish an option?  Otherwise, this might mean extra complexity in the
>>> Xen hypervisor, as I do not believe the primitives needed are currently
>>> available.  Specifically, in addition to the primitives discussed at Xen
>>> Project Summit 2024, the backend also needs to intercept access to, and
>>> replace the contents of, arbitrary frontend-controlled pages.
>>
>> Hi Demi,
>>
>> I agree that to achieve the complete SVM feature in virtio-GPU, it is
>> necessary to have the hypervisor deeply involved and add new features.
>> It needs solid design, I saw the detailed reply in a another thread, it
>> is very helpful,looking forward to the response from the Xen/hypervisor
>> experts.
> 
>  From further discussion with Sima, I suspect that virtio-GPU cannot
> support SVM with reasonable performance.  Native contexts have such good
> performance for graphics workloads because graphics workloads very rarely
> perform blocking waits for host GPU operations to complete, so one can
> make all frequently-used operations asynchronous and therefore hide the
> guest <=> host latency.  SVM seems to require many synchronous GPU
> operations, and I believe those will severely harm performance with
> virtio-GPU.
> 
> If you need full SVM for your workloads, I recommend using hardware
> SR-IOV.  This should allow the guest to perform GPU virtual memory
> operations without host involvement, which I expect will be much faster
> than paravirtualizing these operations.  Scalable I/O virtualization
> might also work, but it might also require paravirtualizing the
> performance-critical address-space operations unless the hardware has
> stage 2 translation tables.
> 

Yes I think so, the SR-IOV or some other hardware virtualization are 
clean design for ROCm/compute currently. But actually those hardware 
features supported solution also have their own limitation, like high 
hardware cost and the performance decreasing caused by different guest 
VMs hardware workload schedule. We are trying a low-cost, 
high-performance virtualization solution, it appears to be difficult to 
support full feature VS SR-IOV at present. But it doesn't prevent us 
from enabling part of functions.

>> So for the current virito-GPU userptr implementation, It can not support the
>> full SVM feature, it just can only let GPU access the user space memory,
>> maybe can be called by userptr feature. I think I will finish this small
>> part firstly and then to try to complete the whole SVM feature.
> 
> I think you will still have problems if the host is able to migrate
> pages in any way.  This requires that the host install an MMU notifier
> for the pages it has received from the guest, which in turn implies that
> the host must be able to prevent the guest from accessing the pages.
> If the pages are used in grant table operations, this isn't possible.
> 
> If you are willing to have the pages be pinned on the host side things
> are much simpler.  Such pages will always be in system memory, and will
> never be able to migrate to VRAM.  This will result in a performance
> penalty and will likely require explicit prefetching by programs using
> ROCm, but this may be acceptable for your use-cases.  The performance
> penalty is the same as that with XNACK disabled, which is the case for
> all RDNA2+ GPUs, so all code that aims to be portable to recent consumer
> hardware will have to account for it anyway.

Totally agreed. Actually memory migrating to VRAM is very common in GFX 
side, but in ROCm/KFD, maybe it can be disabled and not often used as 
far as I know. ROCm/KFD always uses SDMA to transfer or copy data maybe 
this is faster than migrating to VRAM (needs further verification).
But we have some method to workaround it. Really thanks for your reminding.

Regards,
Honglei


