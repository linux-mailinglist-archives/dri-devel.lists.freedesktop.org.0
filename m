Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CN5ROyEeqGnyoAAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 04 Mar 2026 12:57:21 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6873A1FF685
	for <lists+dri-devel@lfdr.de>; Wed, 04 Mar 2026 12:57:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 94CB610E9CE;
	Wed,  4 Mar 2026 11:57:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="bcRaScLZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BN1PR04CU002.outbound.protection.outlook.com
 (mail-eastus2azon11010013.outbound.protection.outlook.com [52.101.56.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0421910E9CE;
 Wed,  4 Mar 2026 11:57:18 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Z2kPIQrpLzpDJS0WTTh/9du7qxVay4+9iXGqJaBzRAmaPI10C4CQre6jiLVzzgch0PPRmMen/x7CDG7QspujUWNbh03/VmhSsb19iTRm05dAT+RSsH2FdG89ViRxvjXZiqOw7TSEEtG2TEpusixNf5GJJWPVPPVR+ihfUcDyO99p/A2AcceR2Q4lYhh3Eh3rLWLtND1dQsw236xu2z8gPf5SoW5ySAFaby0/FqN/3gd2O8TSmXR7Y5dZh3wqEZWnez8tEj0tRfiSpgY7Yrv1G7Dg1nWFLPII+VF/pDIW/JViCwY+OAfzK1I9VoI97oItO4oAaUw+o4Y/drIV5zoY/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6YEsHhm56UzuGh+yUumw1MqacMsXTm/wiZTB5kCYkkc=;
 b=w7YtJCdlcCPXc38v6N/f23Aeqa1zkFZ64noHcWDSqhtbw5ERgJgacc5GeOSOzykf7WjaeC5QmLzVmNEiJfWtSdRrSDOI7saNQaVZDbH3fGCamaroJmtsCPzvTOxktueMThaxWuO1Gngk4UyqNa4wWzwesKMr/3I25g9ofEV5EBDaRHNz7JqhMeV5f1AmzjD42j5lo+UtRRljlO//DEC8R9Fp+zPZWggfvI7jm7NZuqUCSP63J0UN3Q4xeQZ2y5d3fmsMEi1r1ExFvxbfV6lPoMWg0LChxmv69ZgIMcEtWcbAkgwtHXP9EdbHM9eQfZKZqF2QDJIVWf3UNX2gGVy45A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6YEsHhm56UzuGh+yUumw1MqacMsXTm/wiZTB5kCYkkc=;
 b=bcRaScLZtOE496awYB08s2sTxf3OuEnueNDvCv28yR6AnY7iP54Dh1mT+RaQA6t/jQuBbc3+d2BqmzfX+pj1JOusTDrlbwlUSZpDg3AFaqQsWa6OHb/QViGl4Kc4FAJgwSfIsWLGHOigLfTDPxznhXW2IShcJRCWenuLfrcpJD587nDM8rZN5Oy4xCC6ZbxMK13HY93aX88BRpg2Kl5w92NXw/ixSMpfMo+kjohR56sLoYjAk3QOF0s4z01dSd85qNzbQ+NGEegsjorXOkosGipwUK+z0oLRzMwKE/qd5c2FQiII+//3SbeN0SOFznrAY86woQJplOIsu0ioaqbHYQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by DS0PR12MB6389.namprd12.prod.outlook.com (2603:10b6:8:cf::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9678.17; Wed, 4 Mar 2026 11:57:13 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9678.016; Wed, 4 Mar 2026
 11:57:13 +0000
Content-Type: text/plain; charset=UTF-8
Date: Wed, 04 Mar 2026 20:57:10 +0900
Message-Id: <DGTZ9SNDPDMB.1MGVRZEY29WKY@nvidia.com>
To: "Eliot Courtney" <ecourtney@nvidia.com>
Cc: "Danilo Krummrich" <dakr@kernel.org>, "Alice Ryhl"
 <aliceryhl@google.com>, "David Airlie" <airlied@gmail.com>, "Simona Vetter"
 <simona@ffwll.ch>, "Benno Lossin" <lossin@kernel.org>, "Gary Guo"
 <gary@garyguo.net>, "Alistair Popple" <apopple@nvidia.com>, "Joel
 Fernandes" <joelagnelf@nvidia.com>, <nouveau@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <rust-for-linux@vger.kernel.org>, "Zhi Wang" <zhiw@nvidia.com>
Subject: Re: [PATCH v3 5/5] gpu: nova-core: gsp: add mutex locking to Cmdq
From: "Alexandre Courbot" <acourbot@nvidia.com>
Content-Transfer-Encoding: quoted-printable
References: <20260304-cmdq-locking-v3-0-a6314b708850@nvidia.com>
 <20260304-cmdq-locking-v3-5-a6314b708850@nvidia.com>
In-Reply-To: <20260304-cmdq-locking-v3-5-a6314b708850@nvidia.com>
X-ClientProxiedBy: TYCP286CA0099.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:2b4::17) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|DS0PR12MB6389:EE_
X-MS-Office365-Filtering-Correlation-Id: d0765ebd-51e9-4c79-6d53-08de79e52c83
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|10070799003|1800799024|366016|7416014|376014; 
X-Microsoft-Antispam-Message-Info: YN2/Qh/5KsKXYXTi+XzsZGNvDjJlNkk4zZXZHIinTOgDwnhSBU25m7ROHAakon+EzpK87V9T6OFG9aL7vLSHGOH6ABXZB/5Q8QZgfLhTy5zLgDtzuIPZSUsl/Tu7QwM7FwFJ50SNdIU11rXHkWJnx5KckVkq7ceDqzZex+i5xTC2sKb2ZJMLyZgyKWaMW63fHa8HxCPqmarNu6x2D+DZsBAdaHjzwVqgxZB7CDYwxhRAhJs7OdU1G7a8oPNCjRNr4Lm/gjEtisjemEDVt4wQ4HSAVz+L+S2u03Clj30y8f1uBxy7OKE4WGQaNgi3ZPFTMJ4kdxi0UzBUEKSRR7SbCOe7/vyyksQKJJ73kgAcp1gvQegfZvqTsUNzbpf+KPZXlC/cGlknJTfqz8uM5xgzjVIGBR13ciOXCELTV53S9Bg/1n3AEKlg9q6OsPi3WYk5Deox86bTQ0FgSdXMQVlWZRJYg5FRkggCO1bkobTgLtv+Y37IGgr6acfa4FzWpQAU679COho7zBDFWxzcqjhsbZUFXuYFvtGDt9RiReydMpvxY5MZzUXZRTlVcTn/Q7u6KN/smkHHbs6C/l1FOhj617QS+60YdTC9BSVLKFiR6BEI464dgpy6bympr5UMJXgGqMd9oPAHsuW8FBcAj5Kv8IbPcJe/vgBuZJdHtRmEY5we1tLRg2gYwoXUjTy2kvNVJL8FZcyU7i/oai1e8dAO7M2JMWo5je/eo2wXbHVK/Yk=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(1800799024)(366016)(7416014)(376014); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ODY1MFQ1WUcrN05UU2tCMUE5Sm5HZ25KTFNrUzU0Nyt3RTZiNHJGdjEvVTVu?=
 =?utf-8?B?d3dXOFF5SWI0V29QcGpCR2pvSzFiOEhrd0JoVEZpMlVMZTRwcThZRGZLK1M5?=
 =?utf-8?B?ZUIwNE9ZTjZOU2hiR2ZNa25nazJOZ2FpQVI1Y0JMZGJUeS9JbmtFV0c4WnI3?=
 =?utf-8?B?QzAyek9BR1BDR3JiU2h3elhKMUxldm9vdTgwREJjMk5VY0pwdisrMmpXSlM1?=
 =?utf-8?B?bEhCRkdxc2RaMmJCYmo3S21URmtXTk80VWhmbjVaaFBtWDFXZmswOVEvTitJ?=
 =?utf-8?B?SlhRSGJuWEFLdDdicjgzcDAyK0ZLUzFML2MvMWxNSStNbmFLc284U2VaZ0tG?=
 =?utf-8?B?K1R5bkNjL1Z5SytnSzAzSHcxY2ZVQ04xZ0pVazNHbHBSV3k4eVBxblFjSEMv?=
 =?utf-8?B?Y3Raek13RkZUR1BndjNQU1ZHK2RRcEx3Mkd5aWpuaUdPRDNUUG1qNytqOEd1?=
 =?utf-8?B?bXNwNk9MRTVVbGU4cTNFQ3dYakFpZmRwSC95WmRQeGxabjkrN1U5bVRaT0tN?=
 =?utf-8?B?WnZNSy9Wd2VJMUtiazUvZ09zdFhOTXZrRHBRQ1g2L3g3a2x4SkdQWklsbElm?=
 =?utf-8?B?TmVRdVZXV3I0NW5PUmN3a1UrVHMzNkJIZW1lTU5qRERRbk13Z00zcjhSMVBP?=
 =?utf-8?B?ZW4xTGdZbmZwMXZaTkVndHBQak5aeDRGR3JpTjNuZHJKS29XRm92a0lLU2hs?=
 =?utf-8?B?WENHcEhjNlhBblgrRXZNSnVFYTN1SmU5bjhJZFBDWDdTaUdPUHlETDJIbmdO?=
 =?utf-8?B?VkRrNy9Bckx0d0tHVmQ0Rm1HejkvbVRuV1lLTldKdks4K2FjSXk1U0poWEpD?=
 =?utf-8?B?aHB2cXlzbFhvVEdvcGZEWW5wdEtreUtydDByY0FtS0w0S1Z0K3dpdDh2cjFI?=
 =?utf-8?B?a3cxRnl1YlhFZWU1ZHFSSUlrbVpRa000WmUvMkgvR25VNkkwQUVGTk1NenV4?=
 =?utf-8?B?S2VlVzVUeTlXZ3ByOTVsbFE5Z1Q1Vk42UWJqVUp6UllTTHZ1Qis1bDZETGlL?=
 =?utf-8?B?ckx0dlpBQ25EUUsvZ3lkYmJoeFpKZ05ZL0RWOUp3TExtbXRMZ3E0OVYvZTBt?=
 =?utf-8?B?Rk5MT2JXRDUyZHdiZUZCK2o0VWVPSUprbFY1TFA5bWZsU2hvOHZzTk4vcCta?=
 =?utf-8?B?ckt0bGhXNDVQMS9zaVFWcE8yNXprNVFRdHJiNUFHZGE2MXVPSnJlRzdjdnhi?=
 =?utf-8?B?LzRHNWJaMUZPY0l1UnF1NzFFdDlBMzB5VW9NeC9EQ3Y2Zld5ZWtLYUplazJm?=
 =?utf-8?B?R3lxWFYyT2grSGU3VURuMmNTYlBjdlh5cWhPUDdRNkxGcmZnb3gyUmhWTld6?=
 =?utf-8?B?TklHelhoZmorNEZPMUl4M2Z3THVOUXZONllLZUlIWHNHdkVCS2lUUVNLMDE3?=
 =?utf-8?B?ejFLdHNRcHllakNOV1BXMXFYWmRaenNOTjVmVkJVWTIwTkJpNFIvMnJDeFds?=
 =?utf-8?B?bmVaU1FiMFlzVmhIS0dlenRGU0tSK3JScURaWVNsU3FNdTBVWlhNZ1FHVVZX?=
 =?utf-8?B?bnRoenN1Q2FIa0dINGpEZXpjRjdCUmowdE1YbVNvWHJ0RnMrQjk2bVFTZ29i?=
 =?utf-8?B?TU41RGQ5NEowWG1BNzR1OHBXY2x1L2YzWjJ5YWpSeG5BcGYzVnlUUHRzVTQy?=
 =?utf-8?B?ejMzVTFGbW5kRVZ0SGFyNktSNkdOS1ZvVVNNYXgya0poMUNnRkw2c3l0N1hS?=
 =?utf-8?B?S3lYVWJ1bmNLOEVoMTVYbjdDYW4wSkgva0tmV3pJTE9xc25JTitDOTdOUUlo?=
 =?utf-8?B?bVQwbXl6cWpURlFNcEljT0kvTG9sd2Z3WHRXQXB0aE4wZSt6ZjlSZFhMbHVM?=
 =?utf-8?B?a3dqanVXUFl3c3orbTBFVlMvWDhXc3kxR082UnIrOVU1Vk1ESXY1OU9ORXpj?=
 =?utf-8?B?SEF0cFZjem1zZlVHL2NuK1l4SkFFb2JsU0pmcXZoempUMWdDeXQyUjlDQk1r?=
 =?utf-8?B?SEtCUFAvR0ZOTlhpYzRJMENVL3d3N05yMHcvb0pTVURHZVFVOUd4TXRhczhU?=
 =?utf-8?B?WFVoNzVyNFc3cHArUXFGS3R6dUwvZFR3bHhpdTNYc1FXSXZLVldoZGRPQ3VD?=
 =?utf-8?B?cVpYNms1TnNrUGRGSFRuNUkxajZTanZRUjFuemd5UUdmNlFBWG1JdHh2d3VH?=
 =?utf-8?B?azE1RURaWWxTeUcvRFFhdzNOMVQ1Z2svL1pyb1dMWDhJaXpGWjhYR29PT3A2?=
 =?utf-8?B?dkVyc21xQzA4clR5b0Y5MytTTnVXVWxBQldaVFpCYitXSjRFRUg3cnNIcXhS?=
 =?utf-8?B?amlodnQ4NFo5dzF2eHN0VVRON1lHenFOWGlFQkVKT2hROUVIQlFKRjFPMThI?=
 =?utf-8?B?OGxxeDdLWjMxYXQyeTArczdEcW84Z1NDY1QxSDZPalRORmEzMmRHYjNFcWl2?=
 =?utf-8?Q?PuS4TGq6SXsa/DAu2Loc9ClFkmSRmeWh1UJAXeiEAOWzM?=
X-MS-Exchange-AntiSpam-MessageData-1: Nmw/y7S5WHp/yw==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d0765ebd-51e9-4c79-6d53-08de79e52c83
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2026 11:57:13.5718 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fE+yM/vI2Qp/G1cdS81j8i5K/UFIqthlwDO3X7Uj9eDMCG+4OPqsDbqGDNatPzAGyHsHgGpIv1TmvvFyigSxkw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB6389
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
X-Rspamd-Queue-Id: 6873A1FF685
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.31 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[nvidia.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_CC(0.00)[kernel.org,google.com,gmail.com,ffwll.ch,garyguo.net,nvidia.com,lists.freedesktop.org,vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[acourbot@nvidia.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[Nvidia.com:dkim,nvidia.com:mid,nvidia.com:email,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo]
X-Rspamd-Action: no action

On Wed Mar 4, 2026 at 11:46 AM JST, Eliot Courtney wrote:
> Wrap `Cmdq`'s mutable state in a new struct `CmdqInner` and wrap that in
> a Mutex. This lets `Cmdq` methods take &self instead of &mut self, which
> lets required commands be sent e.g. while unloading the driver.
>
> The mutex is held over both send and receive in `send_command` to make
> sure that it doesn't get the reply of some other command that could have
> been sent just beforehand.
>
> Reviewed-by: Zhi Wang <zhiw@nvidia.com>
> Tested-by: Zhi Wang <zhiw@nvidia.com>
> Signed-off-by: Eliot Courtney <ecourtney@nvidia.com>
> ---
>  drivers/gpu/nova-core/gsp/boot.rs      |   8 +-
>  drivers/gpu/nova-core/gsp/cmdq.rs      | 247 +++++++++++++++++++--------=
------
>  drivers/gpu/nova-core/gsp/commands.rs  |   4 +-
>  drivers/gpu/nova-core/gsp/sequencer.rs |   2 +-
>  4 files changed, 146 insertions(+), 115 deletions(-)

Most of the diff is code moving around. I've been able to reduce it to
+107 -76 by moving `CmdqInner` *after* `Cmdq` - this makes this patch
easier to review imho.
