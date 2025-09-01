Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F11FFB3E500
	for <lists+dri-devel@lfdr.de>; Mon,  1 Sep 2025 15:30:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C429D10E0FE;
	Mon,  1 Sep 2025 13:30:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="kBDiuR9J";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2055.outbound.protection.outlook.com [40.107.236.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6DE2110E0FE;
 Mon,  1 Sep 2025 13:30:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CLM4VL1aeNAF8yuHNPPiirq5bkw1W6sRAiQhHwapY4AAf/POq61TmztPrkY6vzKJwiRe/osXBZXMCroc9cPnhPklCnP/zXE5Pr38pqnOVW2tDXfj4D0WrGKxRtkGNgh3yCMQ/eWMpQDx2NIa3pjnKq8glxCR8Xjy2Y6yc192TWCsYkVhBYTuiP2PRgfqOJJYFx79gEbRbWU7ivufDxDHhf9qGnhIgqWvemg4DADJjz3+Zba6MHNPfJXo7RIsKeevfYRFGN7ZeoC7c51m7ObJjqJGWBT1yVQ5DfWutQT4VEMzkgIhi1/yYK6vfHKly0b2qHL/Xy7IMg5hDX0GHtvsmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0OMt3b7eJ7dWWDMPidU+CHrTMl2ZYtzj8Pd/vC6rnAg=;
 b=itx8X2BZvMPhC/MSJjlEswb1FOsWXKNdi0PExvJRodd+dgC9xE1t4tUW1zdeVWc8zs88CFYmVRicpHwzXMAxPD8B7jUtKi+J0pCHgX5Es+iGhibzDdi1fUpA7F/FrtScUZ0NQRhylNaYGcN4hecc+bQWnd/9etOphNwBe6tqwLCex2y/8iT52ld5BLzRiEv8d2GsQxo9POqXNUMp34/U5LJvw/rf+moD8K4z1wMu+TtnHjYQrBHMbN/kXjXzr7yljX7zK8LpUdE4YMYkoH/0kgkS1odpbCF0PQVKYbjAPpcQQp+TemfNB6B3cfst0zniORIoP1skbDBRb+Avk1NpDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0OMt3b7eJ7dWWDMPidU+CHrTMl2ZYtzj8Pd/vC6rnAg=;
 b=kBDiuR9JvDVDfMluRUPmCY2fp3PsrtBZnWGu5G7zitVNrhxmg3uRayWUSgBELoepSZkgKwWgrt2sSQ5rX7ohmvl74FfZBc8usNnf1/Dd8nnkVXUrOeahfuTQC6rqbgtxbvMV+29DI+gsbf5jiaRHytVnTNronqmLoAd8tw8DW+0PTl14UqVg1VnqKI4LPUAUAzhdNtHnSJqvpExNV4/iM4wklJ1fu78Mpm2MhAhwjR/LpE50PSEyo+oU2fNmpqhv3qZXqKKejFU77InZ57lnnhFhZTjq657zeDLmKTYgH4ZO8uNYejzgawmleyBY5p2BnajO7OqUQzE0TpP6uNOeVw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by PH7PR12MB9204.namprd12.prod.outlook.com (2603:10b6:510:2e7::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.27; Mon, 1 Sep
 2025 13:30:45 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99%3]) with mapi id 15.20.9052.027; Mon, 1 Sep 2025
 13:30:44 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 01 Sep 2025 22:30:41 +0900
Message-Id: <DCHI15QP8ZX4.1N66D4PLSR8Q7@nvidia.com>
Subject: Re: [PATCH 0/2] gpu: nova-core: vbios: simplify device use
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Danilo Krummrich" <dakr@kernel.org>
Cc: "David Airlie" <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>,
 "Joel Fernandes" <joelagnelf@nvidia.com>, <nouveau@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, <rust-for-linux@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a-dirty
References: <20250808-vbios_device-v1-0-834bbbab6471@nvidia.com>
 <fc15c557-623b-40b5-8254-53888c847da6@kernel.org>
In-Reply-To: <fc15c557-623b-40b5-8254-53888c847da6@kernel.org>
X-ClientProxiedBy: TYCP286CA0221.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c5::7) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|PH7PR12MB9204:EE_
X-MS-Office365-Filtering-Correlation-Id: 6d1b5f08-a19a-4af5-24a2-08dde95bc0b1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|10070799003|366016|1800799024|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?b2xMUU9nNnlaeWI1ei8xa2JzR2Y5ZGZuVWsrR2xveUNhZWFqR2VVTHNXeUZQ?=
 =?utf-8?B?R1ZnTmRuU2RpNUxJd1pxU0QzY2liR2QzQSs1SGFrd3Q2bHJhYmJpRlZaay9T?=
 =?utf-8?B?N2trRGFRK1o0UXV1Z0owajZkNTM5L2JlaTlETmtCKy92Y0lhTVA4OUdCazFa?=
 =?utf-8?B?Zlo1aTFraEdUc0JDVDlrOUNNTW84NkZOV0tMeDJ6T29ZeGNwNkdnU2hOemdR?=
 =?utf-8?B?QUJJVHp3SEZlMkVwK3IrbTR6VlNaMVBWSFk5ak9KZjNlampGMmZ5L2YySDF2?=
 =?utf-8?B?R0xibTA5eTdqOXJqYjJlQjBPTXhlNW5VRDl0K1B5M1lJcTZweU1IaTJoeVlN?=
 =?utf-8?B?dFNXdG1IbGFRc0pSNlQzUTBLc05GRElSODVqZXROQUpZbThKZnBvb3VqQ3dV?=
 =?utf-8?B?NDNTUFVYRUNhcCs4NGY1OCt4TWN4dDl5TndFd0pValBKYlRjMWt6blgyMHFB?=
 =?utf-8?B?dys5VVc0V0hPaXB2UStCZkZSWXNmSkhVMEZTa2ZaSzNEWkpoQm90ZVZwZ3pu?=
 =?utf-8?B?WEVXbDhFZUJwZllXemlBcVFhUHVEdndxdkt6TmhNUW1NeThMR2hIZzFTWWhm?=
 =?utf-8?B?WVZ4MEprSFVoTkNhSk1uN2NqdjB1YmoxQng0cU1sTWFZWDFmQlBFcDBvUERK?=
 =?utf-8?B?WlEyc2xvT1BVQjY5d3hwM1BhbGtIaTR6K2VmQjFXaGpmcUlZUDdOWi8vdnkz?=
 =?utf-8?B?NVppTHZERG9TcGpieXczUWsxSWFmUzRONXRHQzAzT1BQOXZyWkdmWDNiRTln?=
 =?utf-8?B?TnBWVkMvU2VZQkdwMTJydEcvRGFpWDJkdEQ3Sk5aZmltR3NaZTRnK011R2Fy?=
 =?utf-8?B?L0dXUkFyNE80WjZVWkRmcWVCQ052K2FuRjZsRW43THFKZHZPclpCd09QdTdW?=
 =?utf-8?B?eEE4OHJYYnc4NFplZFZ5bVZSa1BTY0pBWFJQZngrSTdueGRoaFhZeENneWNx?=
 =?utf-8?B?OHp3ZU5SSTVaZkExeVVLMjhtNDRscy82SEV6Z25TSjV4ekpHdWx0RWVqUEgv?=
 =?utf-8?B?T2RRTU56bG5qUzF2eEFHWlp3L3d4YUVxbUtOMXFOYm4xN3hrdzN0WkEyR1p4?=
 =?utf-8?B?Nm9PQjFCenkvRUU5VStpcXVJcGl6dldwRzE5OFhXZW5qeVNyOVNHWTUvS002?=
 =?utf-8?B?TXo0cmkzQmdDVlAyNXcrTVRmQWpRcGVxMDU0azZtWUVCMkF4TlNiTmVVR3RG?=
 =?utf-8?B?bklMQVN5NWIyaVpLZGFVcFNzcGJvM1gyeHpDa0dBTTVlSFZUZnpTOVBGVmlT?=
 =?utf-8?B?Uk5BaWtKYjFjRDlVQkNaNThXTUFUVUp5dWZSN1JlSEErU3I2MnBaUkYvS1gv?=
 =?utf-8?B?RjVkdkhNUnhSbVRDaFFvNUZycXhpd0lTelNOOTJsWURmMDQ3YW1YY3ZhVTBW?=
 =?utf-8?B?QW9xMlZiZzNpMHlpdHdFeVYydTg4SVRicVZVOHkvbXRaeWI4ak13a0U4a3VH?=
 =?utf-8?B?VllyTXZwcWJCQUxFdkJWbEZHdzNYQndRWmhmM1VJcDRHcVlvUnRyaG96QVIz?=
 =?utf-8?B?Uk5ZWEhkR3VUS1Q4VTVaQXoyNEVDOUJMNU9vTkRVSURrLzNISWdWbk11dFA3?=
 =?utf-8?B?OVR5WGxIdDIxU1N2Q1Y1ZVNuTFhIK1lYL2ZzSEowWTJlSjBhMHI4eXViMGNQ?=
 =?utf-8?B?L0lQMlhqcm0wYzUxVFZBdTBjMEhSVlRHNkVsc3BiLy9mQmFPc3BWWEUrU1BY?=
 =?utf-8?B?RVpGSGYvOUsva1UvenBNejBtZktXdEtTWkkwdnB6ZGxIeHdsKzNRSWdiamdl?=
 =?utf-8?B?dTl6eGpkUUNmSzY5bmhPUDZpZ2lOMm0xS016Wlp3WnBOWmFlUzNieEthN2hu?=
 =?utf-8?B?ZnJXd2lvcXlUUXJRallkVXhQZml1L1J1cCtYYm9Pc3JQWVBnbVBrVmZsYk1u?=
 =?utf-8?B?QkJoL2VPWnBMeUZFdGhDOFMyS1lSd2IrTkVTSWhpUmkyRVJJMFlwOG03a2Nr?=
 =?utf-8?Q?nE+KGL7R9n8=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(10070799003)(366016)(1800799024)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?anRJWEgybDc3YWdlWTNXT0ZSRnRlUTRVcFRVNDliNU5pejJlOU42STc5YTBE?=
 =?utf-8?B?SzZienhTQjRzb24rQ3VNZTRCb3E1U3Z0bU1VK21rdEFKRkhYenlmMmUrSjVZ?=
 =?utf-8?B?ZjRtSjZ1NDloRWNieVRqWWJuUVllWHhaV1UxTVMyVmFqQnZjVDc4U3NUaUJR?=
 =?utf-8?B?K3NBY3BFZ3ZxWlJCVmdleUhLTGJWNFVJQWh2U0ZybVROSVVBekN1TC9rL3Mr?=
 =?utf-8?B?STgzSkplSFJHMUk3Ym05MGQwc3lEbFQwNVRDR2Qrb0Uyanh5aXdJMExGNXdX?=
 =?utf-8?B?c1RhYTA2M3d6dTVpbXJBaVVoRjg2UnBEU1hycEVVQWR4ampaTW5HUmFyOFBo?=
 =?utf-8?B?M2dWRG9uQjUvcDBRMTJLY2x5a2YrcC9wdzlPQlJkWHViZ0UzcXpuUGd5MG9m?=
 =?utf-8?B?bytCcisxL09QNVgwZXJGSDZ2YndSVFpCcjVRdmxyT2VibzF2T0lwNDJ3WGQy?=
 =?utf-8?B?OTJ5K3p1NUgyTTBFRFBsclVnaWhoUlJNY0VSZE9CbTZHNDlHNDBpbldiU2Jz?=
 =?utf-8?B?aVRzUjd1M1pXbXFobmZhYU9OZEtLQmljWGthQ1EvZEt4VnZPalZleVdWQ0dy?=
 =?utf-8?B?aVd0cUM4dGo0N1NTRXNIRTVnZ05xanNCSFVKN0V4bUUvZXNtYWk4cGF1MlUr?=
 =?utf-8?B?QnkwcGlCdGZITy9rWXVVY2xPR1A5Z2VaazM2VW1BM3Zqb0V2SzZrdENWL0Ez?=
 =?utf-8?B?OXd1OE1tYjE0aVhEem9jdVhVa2xnUEUzTGwzTXlDZnp5Qzd2cjUrMHlyaDNw?=
 =?utf-8?B?U2RDRDVOVVFKY05tcHM1Y0tLWEhIRWM4b0ttQWx6Y3Z4SW81dlBIVHFHQkVr?=
 =?utf-8?B?ZVhTcG1DRU9vc0w5b0tNRHFYQ0ROYXBET1psVE1LVXZlMEllT1hrWEpUdDkw?=
 =?utf-8?B?WEdsb0d3N1ZzVThVYWg5akpHeWlLcFpvKzlJWDhEdnJuVjloVnVRSW5YdmV6?=
 =?utf-8?B?dFNDa3d2eEZRNXQyYXlPb2h1a3dOOGlhdURDOElJMzNEZzNhejZERVdyMnJn?=
 =?utf-8?B?MXFYbXB1TGRrazQzZWtTK0JBazd6RjBMeWVPWTlINnN2MEQwaTU3UFpiMWVX?=
 =?utf-8?B?b1g4SVhOT1lHMHhIaXVHL1BxYURCdkNlTHNZY09PTWpqKzlCS3d5TnVJeHNT?=
 =?utf-8?B?bExqb3hjcEgrbXhQZlRITlZEODZXZ0htR1d6T2ovREFqaGdSM2hJc0pHaFhQ?=
 =?utf-8?B?WlRXSnRQT2RCWXVtQjl6eWIxWm1wR0VVS1JzYUU2ZnN3Q0MwNkxKMTU5NENW?=
 =?utf-8?B?Vkl3aFBmaytSM3dNYWpraSsxTmRPeTU0ZUxyOGdhVDRLb2VXSFNaS3hGQzZk?=
 =?utf-8?B?UWJSZk1EY1N4K29obzhIS0RmaE5aZXFOU2RWaGtQbTFQU1FaUFJCVUJFVThR?=
 =?utf-8?B?Yk5qWFhqV0RQNFRrMyt5Wktyd1Y4anFNaytRQy9wOVY0NWFzMnc2UkVaaGdm?=
 =?utf-8?B?Sk5BQmlzaE1NRHM0bnFxVTdZb2dPNlk2NmRBQk1Qa0pZNS9mNVZKYTRCWW0x?=
 =?utf-8?B?UlF1RmhzcFFmaGtPaW9leUJsNlpmRDFOSHE4REQvQnBubTVrNVZJQnZ0blRT?=
 =?utf-8?B?TjF1RkJlL0F1dkZYSzhSNWc0VitVUTgxZ2d0SFVoL1dHblFhZG92ZkJQVWdi?=
 =?utf-8?B?Wm5wWU0wUUhNM01ONERVdUR3b3BKS2taSjBHN3RiQzFQN0xpNE5vQXpNR1hr?=
 =?utf-8?B?NWVEWW5pUjUzeHFPUzRLOEQ2WUlCcm0xeHE4NzdyR3dFVXVrZ29XWldaRnRy?=
 =?utf-8?B?bGlsdWRabTZjY0hocmtqK1NOcS9xbnJGY01TSXNnc20yUU1BTTl5MklPS1Jk?=
 =?utf-8?B?VVVtMldFRjdVdzdLRHpueEcxaUl3Uzd3OHE5ZmlVc3plUkNtYmFKcWFLUmRI?=
 =?utf-8?B?ZE9IcnRrR01DTWdjRTBUbnlVRWNXQTZKbGZmaTczem12Z1g1QWU1RzBZVnBi?=
 =?utf-8?B?UWJzbHRRRHpVNlJ6NDVnc2NjSzUzV1l6Y1RaQ3ZUdUpwVE9LUytDeXh2NU41?=
 =?utf-8?B?ZUJmMG9HZXY0Wm11TmRrdXFJOGRLdGVob29uWnAvUnR2ZWRGN0tJVUxOc3I3?=
 =?utf-8?B?MUk4aEJOaWNLdGJmWWcxd0VkbEtidTF5UWl0VkZuQUZiYVhFUjVRbW1OSndD?=
 =?utf-8?B?L1hCY0UzUkFkNlhYUkhCbUF3NmZpdlRjeVVOVktIZU5rcmttbHNzdGpwektx?=
 =?utf-8?Q?1faenuR418J5JKvFVEDBNIZNZCFzshZz2DUhtIp5jTAW?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6d1b5f08-a19a-4af5-24a2-08dde95bc0b1
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Sep 2025 13:30:44.8453 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pnW0UUDxyEKUV3gi6kOEUZXvsr2t0jOPdQFog0SvEWrsb/I9Kbfgc+wQmyLkr+QV1dG5XBMOjwm1l//q/bMMfw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB9204
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

On Mon Sep 1, 2025 at 7:37 PM JST, Danilo Krummrich wrote:
> On 8/8/25 4:46 AM, Alexandre Courbot wrote:
>> This small cleanup series simplifies the use of `Device` in vbios
>> methods.
>>=20
>> The device is used for logging purposes only; thus we don't need a
>> pci::Device, neither do we need it to be bound. This latter property
>> allows us to store an `ARef` to it into structures that require logging
>> instead of having all their methods take an extra `dev` argument.
>> Removing this argument streamlines the code a bit.
>>=20
>> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
>
> Acked-by: Danilo Krummrich <dakr@kernel.org>

Thanks! Pushed into nova-next.
