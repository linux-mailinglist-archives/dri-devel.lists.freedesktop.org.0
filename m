Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ABCEAA7933D
	for <lists+dri-devel@lfdr.de>; Wed,  2 Apr 2025 18:34:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A78DF10E85F;
	Wed,  2 Apr 2025 16:34:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="l14pX2Zm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2084.outbound.protection.outlook.com [40.107.223.84])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E07CA10E85F
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Apr 2025 16:34:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sT64O7VUTSsVpdfIKWyhgVYQBUs8CwdoPGRzZpnOVNMeRefz+5eAoRwuWGrLoCQLx911F/jAXGHWz+xN1ISyBs+AnibrEEjSUJHylOBmXlEQAXml4LSJmtyXDE573HhCDV1PR5rzKVT4+RbVz8b6L1EcM37AXNjx7S0bVDoDcMfFn+vyBl2pjywA9W93K7IS77MlSLIJik/xlxtQrjsH8PBCwD7KbHt+ciiKlxhAXvgZamcyhWiZ3UGVPawZXyatIBkyjfbAPYEk8kcQvq8xsstxsJUmxUkSMKFnRfMl1wQuOzqIwwMeBtKzDSDGFLz+LEMFckmJtgfKuSKgb4nM1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XWacam+h32ukrHJRR5Xi6By27nFkQBUURfQ7fjJ21pM=;
 b=KGio1JJ8KCBp/VGxYx2vx9gAiljIVoG9fqJOXDAxugtMBGdpQ/dg6JAdFx0Bpk9bnyeYoUD82vPQTivFwOc1sspdZec7T+I6dKZx4Zo7qy15h2/rygeCOwQROJFRjCmu+FE2IndMny2rsL5FTE8mnjJc3GKtTAAIV3pvnoTw2/94apbfGKMV2AjS9dsBjbMSuRP9iYPO8Qa+bYWR9WOKf8K8S7Wk5ljl1KUWxvd7D5vWcGhvb13IAK28Rcw/gyJz6K0pUobZjwZA4OyrN8NDjlgSDub9BMoSMF+LVBB9EIEjhsYtH5DcWAstbDHAgK+1WIrIi2UG173g/sR8uYLgxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XWacam+h32ukrHJRR5Xi6By27nFkQBUURfQ7fjJ21pM=;
 b=l14pX2ZmU9MjtKxctvc470cErFFC3Bn8veoZi9h3cj6wWmNQb7HaPHO8jOMB4C2gGGADM+rIzcKQzPbIru13pYMPzlW1zuRADDGBxEF0PW2NfmJTXY4di4q80llqQary2nISmpC6rhwmm5KQ5ruw2oEbhlo+RoXOOotZeKDpzQyloxJWl8Q65SzVxhyyO9J6WoazPH/0f1KXYHu7+WtZ0OcmPCDdoKmw2MWmd8L6z6zrl0O0PJW1pSr32h5V78/EcsIVVNiccOxFI2PoXCUsnrOI6V6V7rdDww5W8T9vWa6FjT1ozOZ2aNiqe39UMencmNT59qDJsq24gnFn+bdzYg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH3PR12MB8659.namprd12.prod.outlook.com (2603:10b6:610:17c::13)
 by BN5PR12MB9512.namprd12.prod.outlook.com (2603:10b6:408:2ab::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.47; Wed, 2 Apr
 2025 16:34:03 +0000
Received: from CH3PR12MB8659.namprd12.prod.outlook.com
 ([fe80::6eb6:7d37:7b4b:1732]) by CH3PR12MB8659.namprd12.prod.outlook.com
 ([fe80::6eb6:7d37:7b4b:1732%4]) with mapi id 15.20.8534.043; Wed, 2 Apr 2025
 16:34:03 +0000
Date: Wed, 2 Apr 2025 13:34:02 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Jani Nikula <jani.nikula@linux.intel.com>,
 Masahiro Yamada <masahiroy@kernel.org>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Dave Airlie <airlied@gmail.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>
Subject: Re: [git pull] drm for 6.15-rc1
Message-ID: <20250402163402.GD342109@nvidia.com>
References: <87tt782htn.fsf@intel.com>
 <CAHk-=wiP0ea7xq2P3ryYs6xGWoqTw1E4jha67ZbJkaFrjqUdkQ@mail.gmail.com>
 <CAK7LNAQThGkgtKgquRPv8Ysi_omedRthF1_++apKda-xWeWcbA@mail.gmail.com>
 <20250401191455.GC325917@nvidia.com> <877c433bys.fsf@intel.com>
 <20250401194649.GE325917@nvidia.com> <87v7rm203e.fsf@intel.com>
 <20250402130347.GB342109@nvidia.com> <87r02a1xge.fsf@intel.com>
 <Z-1MqJen5o0yhoQQ@phenom.ffwll.local>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z-1MqJen5o0yhoQQ@phenom.ffwll.local>
X-ClientProxiedBy: BN0PR04CA0163.namprd04.prod.outlook.com
 (2603:10b6:408:eb::18) To CH3PR12MB8659.namprd12.prod.outlook.com
 (2603:10b6:610:17c::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR12MB8659:EE_|BN5PR12MB9512:EE_
X-MS-Office365-Filtering-Correlation-Id: 7f60e429-5b93-4c18-249a-08dd72042dfc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?lP3uDg/H8sX/xEI1kJTjfuNcu4W7Nxrj0Rt0PT/oPvbBP8mpujFKkHBOLjJf?=
 =?us-ascii?Q?ZjAtY+PduxbxM8yKaiOsb5XuXSR/+dwu3g/FGE5kZxnHh00IA+odyOIdekZc?=
 =?us-ascii?Q?oSm9Fbs4DrKlcENaQLRv3RCaQ/lWhJZNIDA6pvPkzs+KQyMZ1+CchG+wPYKu?=
 =?us-ascii?Q?B8S4RZpSLTvWvrGe46fFvBniHZcQthXKnXRWahwl06ofsMUP0JPpUjDUrr7C?=
 =?us-ascii?Q?hVTNHH18zM1+50lkDoc6y+ytBsctyoSd4ICxFNDUv5Yl5Why74/RhQ/dYEq5?=
 =?us-ascii?Q?4ejg9uRwN7oKkidQIcNKUK5gCTwj2GeKP896/sICF0j7Ibrj32EjJKAeCRNx?=
 =?us-ascii?Q?LEZOZ5q+WcaT3S7LNT6ys1h3tJgL0Dhk1TV1uQXm2XqvXn1XU5M1lmiGoYnk?=
 =?us-ascii?Q?5euQz4mkgDxbRHcDbjPEvZMj5n/giED/b562VNazxPuZHLVZqk6kCjl/xFcX?=
 =?us-ascii?Q?+UHicXN9g0saiy6H+eqoHTaduTUs6UxaXbiMWF7gldbrWXbAIViiSiDCZKY3?=
 =?us-ascii?Q?rAC71mkA7s2fwuV4G2fzE9fgQvV5GXGcGGtfiL5ijTfDvzRkmoKhNBJdZ1EE?=
 =?us-ascii?Q?nHKp9kBdMPjf3Ybz8PDiU/9AU3eddqUiuspj1WIniEMkKfdebTetPVl/ENWf?=
 =?us-ascii?Q?U/Iz19Vi/Dwsat2KVPA2imqQDTBvRPewU5GydCzGmd4bEgdfO26lc8M2BcZw?=
 =?us-ascii?Q?Yf376FRFQ2xy54WogitaVMsOXrNMogerKV4Gol9Ri8S0oFMX/PuszzFMDBAg?=
 =?us-ascii?Q?Tt7SQ6aX8FrkKIPhsGIMwyZ9U9d/qZRYZlUvSNhJn58iLfw01CweQkgjORTd?=
 =?us-ascii?Q?IFibEeUfBLYKoMjAkEOr8saFa1Ui1mSA37SvSp08m3KLPyVcbcAAI5Jzs0/o?=
 =?us-ascii?Q?MCZ03+Fti/WLlnE7vh14adiSnOdj4G6S07gbdQxcPo0F//Ra8zYBFkd8YHCb?=
 =?us-ascii?Q?F4mmMZXaIHEoYFWkk7fecU477WanvnAHFks4/pASmgJAvg9VhFyLvOtOA1gA?=
 =?us-ascii?Q?gjD1ztLr+MVpi19CoQrCtBrVMaBvFGQOCOrHnNTlyeyhMXxtZhVZ46gGSiGp?=
 =?us-ascii?Q?c6RE/6uKYTc8V98GOEX/wk5jcHvtds012++N5TC73mGdwGMNubJYuvNCKusl?=
 =?us-ascii?Q?ZtfaiqcS/DNOj4NIDEy+7pZozFWtxwPzyUTNrFLXJMAkITEmsyakAiE+oQL9?=
 =?us-ascii?Q?2pWRFBHYpPNJB7PFzxGld8Cx0hGUntEAl/8Qg11fyyxFwtHhQn8euhmdREmR?=
 =?us-ascii?Q?Dyo2tHbubT7QEj8mHNlxoB8fWDhbqQUXVS4Kis91GJODpxcQgdoAfSPZfqnQ?=
 =?us-ascii?Q?2cavTUHCqTW64AH8CiLSN6uz4Wzm7jQcDJCT6Xu1Fz5PwbnrLseANmXRZJn7?=
 =?us-ascii?Q?EY6zQ/SPEoAuST+4UJkgJVYXSHYZ?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR12MB8659.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?fM9buciDStMWFdQgoOBX8NG9sbo7oxZT8Gukh6bwMUtWNFBO8uJaQy1pGNrV?=
 =?us-ascii?Q?kVvC1lXYFZuczMUSCBrO+b3p4DX193LSiogbK0Wz/ebUD66X8jtSZj6z+TUf?=
 =?us-ascii?Q?sFsMfENJZAXGsrxRkawbL20kjeqkqXRZcpzTYOyCAUxG5llhewLVHImGaN4/?=
 =?us-ascii?Q?3yV6b4LECR0uwDe6z9dAwcIFdQ/3zBQR+Zvck4vIxBITIZ6suEWC3VOKXkOt?=
 =?us-ascii?Q?Uk65sivRUwWRTYFLJkLQBbr67EOlyBYc+CvtO5Bji+Zf+WnGVm+ayp38zigF?=
 =?us-ascii?Q?m1we724wnsDAvo7SgKl4ycXADvtRWua8tHeepEEi3pIpMt3sdL34byY3IbLr?=
 =?us-ascii?Q?IraujIyu4OR2FTmEyCKvhWtNfOk1IIWlpE+spsFMHlnbTpmaR0i1mQtK2kun?=
 =?us-ascii?Q?PRtup+8h1dMvyWqdCUFJPg+NeqF4vvpkaEDbLgkYcizM0k1xiQi+PHpqYnp5?=
 =?us-ascii?Q?2JMcybqO8aHl9lTJ4d+cYt3xRcAR47oKB/FEabCSU76a7uYZmUxrKGymoymK?=
 =?us-ascii?Q?cuzQom/5GuYXuCiICorSJx9WKiWQhqFyWACTdI+a8peeEszpRg5IM8prE0MX?=
 =?us-ascii?Q?NkligJflyJxwuup7L1tIFdoAt3ew90ReVLGH/VPSiHfZEv6ihOq4o7kACsXW?=
 =?us-ascii?Q?iPTRB4jlW1fqpE83Kr/RpD3nCUX7SieIgzuKKFFOXv1GX+67P8sjhkU9ucF8?=
 =?us-ascii?Q?AnCIBK7lBOurDrv00SKSpwEAGtHjokDwz331Rk5KuDsVHslsppR6SUm3ZetD?=
 =?us-ascii?Q?R4rD48kt51MnE8w6LRxP4xUu1qL7/jEBSNXya+4VJbhPJ4f/pXpi0g9bIxd6?=
 =?us-ascii?Q?TFu8xhadabWIU82RhQ1Yen/vhoTsUb752WfkIxTHdnKpu+FZECDHoZQqSn4S?=
 =?us-ascii?Q?Hy1CVNwY8iRHkDwXcq2+H3lz3n+RRTQHZUBUEV+BXo/tBuQM+sTo8sYEG9zl?=
 =?us-ascii?Q?Qg5/jsCpk3/rVnkYpxM9oVygtsBnoN2R0A8nsOS5fUe/3zkWGmezHrzhFNZE?=
 =?us-ascii?Q?nlh8q5gU+je/Fqr5PV8gz4fr+bk5I5VKxnL2A7SMw52D1Uxwow8GZaT5q4NK?=
 =?us-ascii?Q?DqzXFaMWGlQPqS30GMmItiSEull1ITkfUlNIlkEklBPg+IpuN5lScV7MlTVQ?=
 =?us-ascii?Q?xfYPkFMSrns8tTeOmLUM8+X64z+Lv4TFEtC4/3dwYPi0aXZZmOiuclTP8syH?=
 =?us-ascii?Q?QMh73wHFADTfjINf6nemsM35dwRfqCjMyDGVfvRiWoliv2u5ZFc2de7v/aZn?=
 =?us-ascii?Q?IiKzjXQ5jfTh+BE/YIG+cowIRzD6Sg1dSPNIJPjavKKBAhLV8NSJGLRzg0gS?=
 =?us-ascii?Q?gTwb8YjgriWgpsHhleWH+YlBn/5ZpbDGC/+Cq2/L2QT0bhNkuEwpldZu7CwX?=
 =?us-ascii?Q?PX7IJhYiqTF1cDuoroWchTAiGJiiTvb0CJpgNcumzLZcK6n1xcWDCGcWhEsc?=
 =?us-ascii?Q?goQkkjVSZnw6fSgNPx4HOFQ/woE99paY5bhOyipLaLmt2dATkchM11sWcI8d?=
 =?us-ascii?Q?q1WFv5EwpuWxDYF3rBDpPPyVR3NtTCsQPXpXuT6kyLG8BIZya2ztM0fYH7A6?=
 =?us-ascii?Q?+d0B0JMImsyKqdvo1iOM4BxUcrLHPcGCgheDDViS?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7f60e429-5b93-4c18-249a-08dd72042dfc
X-MS-Exchange-CrossTenant-AuthSource: CH3PR12MB8659.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Apr 2025 16:34:03.6532 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YNEFnXYXGO4O8ErQG9XTe4fRNeJneuCL8GqeMStiGB6/8OhGveITPVw111CwWJeV
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN5PR12MB9512
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

On Wed, Apr 02, 2025 at 04:41:44PM +0200, Simona Vetter wrote:

> - Gradually roll this out, ideally with support in main Kbuild so it
>   doesn't have to be replicated.

No one said flag day, you'd have to approach the same way everyone
else has done when adding new compiler errors and warnings to the
build. An off-by-default option to produce the new errors/warnings,
and alot of time and fixes before the new tests become on by default.

The stuff like this is not really sensible:

+header-check-$(CONFIG_DRM_I915_WERROR) += \
+       $(filter-out $(no-header-test),$(shell cd $(src) && find * -name '*.h'))

Not only should we not be using globs to read the source files in a
build system, but it is brutal to have to list every header file in
the build in the makefiles, along with some kconfig :\

( also find is usually spelled $(wildcard $(src)/*.h) )

Jason
