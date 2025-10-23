Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E0571C01A8A
	for <lists+dri-devel@lfdr.de>; Thu, 23 Oct 2025 16:10:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 794D610E19C;
	Thu, 23 Oct 2025 14:10:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="oKy91tTX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CO1PR03CU002.outbound.protection.outlook.com
 (mail-westus2azon11010026.outbound.protection.outlook.com [52.101.46.26])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 235F910E19C;
 Thu, 23 Oct 2025 14:10:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VDHZtYtoVKfuyirOsSUH6UNM3R5mrs584yhGSXO6hTGvIZjgQoj/xhYnvSnccF88C32LjfmRD/Kmfk8N09uyIKs3pJEiw/VTSsECM1CpH8Sp9irR8D7BHjm8T0IrLBMOd7ZHT8Qa17x0pZjYQhilpm875XSRx7Ifvz+DsA9LQu7Tf37UUAQE84eS5XTcOvpd7kt1rTjW3fayR8xRNNuh06B16NFR3yMwnLl/bxvNL7C1KBdU0DlYqz7KIjEdiDFApTy9poWlAebuBtdgmKG9MZVjJk7COZGBvE4+ioW703Hwj6KTVvn1DpXqvKsuAzAHJxRBDiAtoycoCMAnLQQwRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2uODmwgjrjIln038UFiHo5xlYDljFXZY0obv4WnW88Y=;
 b=MSnhLqmpSxM58UIPkdG0ZoYa0b21b6kq70Cag3yUuoJllrpHOan+EV8EDC7Md6syuYovonuOVq6L8OcTDDC30vpLmEH1S0OYkAh16Sdrb7aZim0RAm2UIEz2yp9SkiLue9NolI0j20b6JGpao81K0DtM62GJ5gdgiHLILjmeHdbeUUp+uphgL8i5XKeIu+mZ+aRNsMUBR4B5UMVjPArAZ9M42qAPoq5/uFdwR2snHQYvW07F0E6JedPo6iM9dL5qQ/MYdHs0XbvK9B9nopj7Di8AdHxtlBvEweyvFIQis4SGuZGpesy6i4oZfOZ7JgFCmJkuxPsx02QDFuW+jPy4OQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2uODmwgjrjIln038UFiHo5xlYDljFXZY0obv4WnW88Y=;
 b=oKy91tTXYt0+XN/2xKFN8eK7zyLAQ5QOH9+U67Mt8x0HwzJQMDK2QsSPpTaxiZzpmrU7E6VhAV6aNAJSYZUfuRaOQ6UEcGq9ywcB8QcZlmUs2oZnwqQubP11imMvwHaOLWytkT5xAVcbeKGMRbPsilVV/+koZm1o1v1hY7h7t40=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CO6PR12MB5427.namprd12.prod.outlook.com (2603:10b6:5:358::13)
 by SJ2PR12MB8034.namprd12.prod.outlook.com (2603:10b6:a03:4cb::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.12; Thu, 23 Oct
 2025 14:10:40 +0000
Received: from CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::9e93:67dd:49ac:bc14]) by CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::9e93:67dd:49ac:bc14%6]) with mapi id 15.20.9253.011; Thu, 23 Oct 2025
 14:10:40 +0000
Message-ID: <2d4cbf1e-f8f7-4f6e-9e7e-15fb05234248@amd.com>
Date: Thu, 23 Oct 2025 10:09:56 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 1/1] drm/amd: Re-introduce property to control adaptive
 backlight modulation
To: Mario Limonciello <superm1@kernel.org>, amd-gfx@lists.freedesktop.org
Cc: Simon Ser <contact@emersion.fr>, Xaver Hugl <xaver.hugl@gmail.com>,
 dri-devel@lists.freedesktop.org, Leo Li <sunpeng.li@amd.com>,
 Mario Limonciello <mario.limonciello@amd.com>,
 Xaver Hugl <xaver.hugl@kde.org>
References: <20250718192045.2091650-1-superm1@kernel.org>
 <20250718192045.2091650-2-superm1@kernel.org>
Content-Language: en-US
From: Harry Wentland <harry.wentland@amd.com>
In-Reply-To: <20250718192045.2091650-2-superm1@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BN9PR03CA0702.namprd03.prod.outlook.com
 (2603:10b6:408:ef::17) To CO6PR12MB5427.namprd12.prod.outlook.com
 (2603:10b6:5:358::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR12MB5427:EE_|SJ2PR12MB8034:EE_
X-MS-Office365-Filtering-Correlation-Id: 9bb6ed78-1445-46aa-879b-08de123df261
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SWxiUEVCTWNpbzg2WDdjYVJmeGZMbHFWSTJUWTY1NlRPOTRlOHY5dFJWNUxB?=
 =?utf-8?B?NGVhLzFMa3kwMFVsTjR6Q2s4b0xoOXY4djdVZ2lkQ01hcCtVSllaWVdwazli?=
 =?utf-8?B?a1pQN1h2c1VvM2VxZFpvS3hnRFFOWW13QU5XS3hQY2Fxd2ZZLytnc0VXWTdY?=
 =?utf-8?B?MGFodE1UUE1Pb2tZUHYzRjBuSmU3VjdxaElFS1lVbzM3amVYU0srZkVwTnFE?=
 =?utf-8?B?M0FnbUdsV3hJcG10YmtLZlA0WGF4WlVwbEpMQTBMVHFnVk5icklHdXcveFNr?=
 =?utf-8?B?bnpSZW1CUFh4STVDTTI1UjRXamo5ZEdqTmpTaXdIcXZJS0puMmtqME5ackJP?=
 =?utf-8?B?T3ZxRUVSL05MRjE4MW04T3NFQS9YTWJXelYvQXpYMG9Sc1NEN1gzNTFnRzd1?=
 =?utf-8?B?UzJxNUdRTkVaeGF3VFFaam45blJoZVBpV3JVY2hEdUl5Z0hKcytzVnliY21r?=
 =?utf-8?B?cUJZd1lmb280azFZajZnamFKODVkZk8wMUtlaDRQR0tJUDZ6RWNQWUZ1b1Fh?=
 =?utf-8?B?TWNJcGJ2bGQ2M1p0Wmptb2Jlb2JFQW1wYStjK1R6bi9TSFE4cDNrdFFjZmN6?=
 =?utf-8?B?cThlWXZJWFUyT1hJMWxUelpVdGJKWmR0aE55TkZiaTNjSzgxNzNkSW8vbjRF?=
 =?utf-8?B?NVNwMWJGSFQ0RHlkZG0yRlRKZ1JITjhJcjVEUDdBbGlJU2ZrZG1lSmk4YUVi?=
 =?utf-8?B?bkJqK3BnR0Y3S0NxbVlGSEoxbXBtdE1QcWdYMHlMcStCZ0VOVm5VTzhhWnVI?=
 =?utf-8?B?MHNUZEg0WnNtU3JpdlhKNmRKTHpEdnN3OVIvdkVXYnMwWHhoOWswNVY2bjBw?=
 =?utf-8?B?TFdJNi9pTXlCNWxuS1R2N2Y1Z25haFBSVmdQRUIzbVhBeEpMdWZjZFloL2FJ?=
 =?utf-8?B?dkpFRlYzWTVCc3l1cGFLNnNWNEZEMVZLUWxSVW8wMmpPLzBvWHpEYlEzZEVH?=
 =?utf-8?B?dUJRUE8rWTRnRVZMOHdEaTVPL1NKUkJ5QlFYc1dGYmU5R3E3WVhBWDdwR3NM?=
 =?utf-8?B?TTJzd3lZSjFvLzduaURsd3lYZ2pjdnVIOUp2aWt4WXBEaGxjUDNsR2hkV1pp?=
 =?utf-8?B?Z1NVUWFpUytFdFQ0R2FBVmpqN0gvSXNTUDEwMUN1TkluQm5kaFoxWkw5elFz?=
 =?utf-8?B?TXZ0blYwTGZnWWpXaDVCTFJYbSsxR0NjRDh2R09oR3d4MW44a25SQ2pTRVlu?=
 =?utf-8?B?Nndzb0ZqTHJoUGQxaFVmRTA3Ui9yZUxtWE1XMjNTM2JnN0xuTzdDaE5CZytJ?=
 =?utf-8?B?cE1neDY5SmhrMXdONlluTzlSMTJzY1FRdmVKUTN6TzRCQkppbzlCUUlaZzZ0?=
 =?utf-8?B?RUdSNDJRdS9Da2s2UzNaVkZUMGV3Tk05MnhFS0pOWGhIc0RFOXAxWUtRZjNF?=
 =?utf-8?B?bFBWVUN4MU9xOVdnRU5QS1JWZG1RRmFjZ2JMMGZYQm5JSm8renVOVnhIa3Uz?=
 =?utf-8?B?bmQra0gySEQyU2tMU243SnI0bmkyYVJzQ3J1TWtNSzdjajBxZUhLaWxEVEVl?=
 =?utf-8?B?OEcxUWRWWFAyNVp2cy8wUFphdHJRTVVqVUJva2hhMWFYUkFoWVhxbU1FWldz?=
 =?utf-8?B?Z1BtZE0yOUs2aDFtd2NrOXRob0hUZXRMVXRJbEtFSGJNbXFJMmMrN2x5OE1j?=
 =?utf-8?B?L3RGbjFmMmppOUlCWkY2aXUxRTNQaWdRZnBxMXlRYW8reGhDMDNXcXc5TEJi?=
 =?utf-8?B?YlYva3R6a0VvZHM3YlU1VE9FRHF4TDRrUUYxZkFESW9ZTnNFR21ObEd0c25B?=
 =?utf-8?B?VFliaGRKaU5jRERaaGVNNnhoZ1pDcm4wSENiK3J2cnBqa05KNTAyZkRBQlFW?=
 =?utf-8?B?bGdwMUs5czd4akMyeW1PeURwMUxoUnAyVVNXOGRJQ0pJbGs3VDY2QytuNnhx?=
 =?utf-8?B?YUZ3TDkrUUl5ak1pSDRYL2JvQ3ZnVVVFMC8wdWZUcVg2eHNtVFVuL0U5QlIy?=
 =?utf-8?Q?GXsri6+xpp3lk+DJbc+bTRZG2euIxm3L?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR12MB5427.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?L1YrdFY1SGpQNk1BOFZiem5ObFlIN1B3WEJ4enNKb3h2MlRkWmV2TWlDMmxn?=
 =?utf-8?B?V3pCUG51SUFCMFFpREhDYnBIZ0xPQ0VMMThqNm9iRDVvdGRYRk9CdWh0MEV5?=
 =?utf-8?B?VEU0R2dHTVVjOFEvb096bGVuWVM1RDdQbjBtQ0NSYWNDMkxUdUV4TiszcDAx?=
 =?utf-8?B?emRaUXVQTnhyOUJWak94VUdwbC9NNkFLZERBc0N2SGtmWXBWUFRodHQ3N2VZ?=
 =?utf-8?B?QkpVUnpaN2pLQmlIUEtDMzQvZFJBYThJUHlFME9kcEtEeERrTXk2c0JqZVh0?=
 =?utf-8?B?R05tQkVERzkwRUt2RU94Q2l2YU5BdTNDbWg1R1hGeDQxUktLSFFIb3hLeEFs?=
 =?utf-8?B?eEdrUGtodGpSemFJL3YyaDArN3Y4NWhKNFdzT2IyVXlSNVlCY1NVc0grTExh?=
 =?utf-8?B?VlY1WFNFQnk2NmxDYlpkS0Zqd01pcVVhZXg5WnNZTmJnK0V4WEVVdjc0NytX?=
 =?utf-8?B?eHlheFpoVDExV0FUQzBRdHBQek84cXFSakdkL1crZDJBYlBibHJMeERLTlJO?=
 =?utf-8?B?M0VnWGl3a1B4aW9ObUVMTytCSmJHYVdRRE9NcW0ySVhsaTFTQkUrUE9uT3l3?=
 =?utf-8?B?SFJpWDl2NnFYaHYrNUsyTkJzSGhxU3lTQS8xVlJ4akdSUEI5WWdKL2RCS3VJ?=
 =?utf-8?B?ZXY0WFhGZ3Y4dXRvenZJdTF1clpwcEU1R05BQThKOFFIVkVHWnFWRGM2VGda?=
 =?utf-8?B?NXh6S01OMjUxYzl6YTFzMGRWTXJ1bVUrQzhQYmRkWUdIRVI1WmVESGx6WFBv?=
 =?utf-8?B?TDJNU0RxakZPTGdkUWhsT3MzUTdTZXhqeHF1ZWVaaSs4TG9KYTBqM3dvUWxS?=
 =?utf-8?B?dGNISTJUMHd4K1RkV25qcDJ2dDd3SUwySzJjWUtiWmh0c0NiSHVSZXlCbnB5?=
 =?utf-8?B?MDh5MDNrcm9kSWozR3dXbWZieVAxb2EwcGRBMkVUS2orWlplOUs5MWc4ZDRY?=
 =?utf-8?B?SVJVT3lvaWZrcWRmSEVOcyt0TTV3cENiWWNiV3BJZFVTV3k1YS9kdWlNM3Zs?=
 =?utf-8?B?TjJ0Y0dwSGpnOVFUMXcvSXpZUmx1VEJtZVA0RUVkK1hVTUJDRkpKeDk5R01E?=
 =?utf-8?B?MUVLOUM1Q0Z3SEVnZlBTajhLY1Z1ZnNpMFh2ZnRuV0RsdU5Pd2JHRGpFZFE3?=
 =?utf-8?B?VjNqb3R3NnVtTHhsa1FncmNhZzFsTk1QaEtOa2xPQjFKSXU3T3FjaG9RMVBo?=
 =?utf-8?B?Z2UvVmgyZm90eHA4Mm4yaVNoRlZiS1FEQmJqbTEyQm5nMFo2UEwwb1JhcW1G?=
 =?utf-8?B?OXFGTEgwc0JIcUVMZnVLVW1IYnV6Qzd4cTJYVDkrdEQwQ2Vid3owVXlFZ2RV?=
 =?utf-8?B?N2F6aEFscnN5RjQrUjhBUGd2Z002U2lNZm1kRGgrall0d1dWbFdoMG93aEQr?=
 =?utf-8?B?cURmd0NHbWYxRHhJSDJGUDM2WTVxRmVFTnY2WjdqVnJ1WVlkaVN0aUlYVmhu?=
 =?utf-8?B?eXN1cjFDQldXS0F0dy93cnUvWWtsWHpYTmVZVkNHNmRFK3ZaNDlrdGRSbjZp?=
 =?utf-8?B?ckk0TWJSMXpxMmJnaXNuM0dRYm5QNkpsZHRKRGVaNXVhMGt0NmIyYVRDOU40?=
 =?utf-8?B?c1U4Q21DSkFROEcvVDV0WHdBSXRSdWxaTUUxWjNON0ZQUXE3elNaRlREcDF2?=
 =?utf-8?B?TlFPZ3UvL0syWXJqanlkVFhmOEMxM2RkZUFOT2kxOUZuZDJtSHhjTm5zLzI0?=
 =?utf-8?B?Zkk5UUN5WlFNRnJiNWc4cWV3VjVvT0tnaHNQckNQREFybExxaElXaTVJdVFP?=
 =?utf-8?B?Z2d5a3lkSURrVVRVL0Ira3ZxRXF4em1lUGlHRFRPdHVSdkl5S1llcnEvL05B?=
 =?utf-8?B?RlFBZ05IbE1kMmtnbHkwc1JDL3BsMlNhbU9vTURabGxNNjNPYTArNnh6SHpS?=
 =?utf-8?B?VVRrSFJtbnJSaVNKeTIzd2xMdDVDWHIyZWY0aERlNjBzeDdDK1VPZ2h0OHZL?=
 =?utf-8?B?dXl6K2M0eENOZ0NkOU43YjBhR1RyYlQ3anJKV2J4TW1OSGlHbDBQS0REVEFF?=
 =?utf-8?B?Z1IyVHMrQ3EzSWh3SDRVc2hHNmtTTTViVGNFRUtDTCtwNS9KdDdyVEJZTzNv?=
 =?utf-8?B?eVlsUzRnM01Yc0hsUlZzVVFpZHFiaFRPQStkNWJuRkJLRW85WkNVUUU4OTE3?=
 =?utf-8?Q?T3kC/8wp8BflbP0UC7/DJkp/n?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9bb6ed78-1445-46aa-879b-08de123df261
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5427.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2025 14:10:40.3787 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Xnkft/hd0Asz0qdrRl0ODRgdeudyomy61uccT2l+QY6cviuGaRZUV29ozWsQ8DUNorfTvN03kNkcjauMhW2Vxg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8034
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



On 2025-07-18 15:20, Mario Limonciello wrote:
> From: Mario Limonciello <mario.limonciello@amd.com>
> 
> commit 0887054d14ae2 ("drm/amd: Drop abm_level property") dropped the
> abm level property in favor of sysfs control. Since then there have
> been discussions that compositors showed an interest in modifying
> a vendor specific property instead.
> 
> So re-introduce the abm level property, but with different semantics.
> Rather than being an integer it's now an enum. One of the enum options
> is 'sysfs', and that is because there is still a sysfs file for use by
> userspace when the compositor doesn't support this property.
> 
> If usespace has not modified this property, the default value will
> be for sysfs to control it. Once userspace has set the property stop
> allowing sysfs control.
> 
> The property is only attached to non-OLED eDP panels.
> 
> Cc: Xaver Hugl <xaver.hugl@kde.org>
> Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_display.c   | 60 ++++++++++++++++++-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_display.h   |  7 +++
>  drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h      |  2 +
>  .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 39 +++++++++++-
>  .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h |  1 +
>  5 files changed, 106 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c
> index 35c778426a7c7..f061f63e31993 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c
> @@ -1363,6 +1363,64 @@ static const struct drm_prop_enum_list amdgpu_dither_enum_list[] = {
>  	{ AMDGPU_FMT_DITHER_ENABLE, "on" },
>  };
>  
> +/**
> + * DOC: property for adaptive backlight modulation
> + *
> + * The 'adaptive backlight modulation' property is used for the compositor to
> + * directly control the adaptive backlight modulation power savings feature
> + * that is part of DCN hardware.
> + *
> + * The property will be attached specifically to eDP panels that support it.
> + *
> + * The property is by default set to 'sysfs' to allow the sysfs file 'panel_power_savings'
> + * to be able to control it.
> + * If set to 'off' the compositor will ensure it stays off.
> + * The other values 'min', 'bias min', 'bias max', and 'max' will control the
> + * intensity of the power savings.
> + *
> + * Modifying this value can have implications on color accuracy, so tread
> + * carefully.
> + */
> +static int amdgpu_display_setup_abm_prop(struct amdgpu_device *adev)
> +{
> +	const struct drm_prop_enum_list props[] = {
> +		{ ABM_SYSFS_CONTROL, "sysfs" },
> +		{ ABM_LEVEL_OFF, "off" },
> +		{ ABM_LEVEL_MIN, "min" },
> +		{ ABM_LEVEL_BIAS_MIN, "bias min" },
> +		{ ABM_LEVEL_BIAS_MAX, "bias max" },
> +		{ ABM_LEVEL_MAX, "max" },

My only concern is that with these values we're locking ourselves
specifically to ABM. But if userspace implements support one might
want to use that support for other, similar panel power saving
features, like some OLED power saving features.

I was thinking a range property might work better and could see
re-use in the future, but unfortunately it uses uints to specify
the range, so we couldn't designate -1 for "sysfs".

Thoughts? Should we care? Can we avoid userspace needing code for
a set of different panel power saving features, like
- ABM
- OLED power saving
- <some Intel panel power saving feature>
- <another NVidia panel power saving feature>
- <other vendors panel power saving features>

If we made it more generic we could even move this to a common DRM
property once other drivers have use for it.

Harry

> +	};
> +	struct drm_property *prop;
> +	int i;
> +
> +	if (!adev->dc_enabled)
> +		return 0;
> +
> +	prop = drm_property_create(adev_to_drm(adev), DRM_MODE_PROP_ENUM,
> +				"adaptive backlight modulation",
> +				6);
> +	if (!prop)
> +		return -ENOMEM;
> +
> +	for (i = 0; i < ARRAY_SIZE(props); i++) {
> +		int ret;
> +
> +		ret = drm_property_add_enum(prop, props[i].type,
> +						props[i].name);
> +
> +		if (ret) {
> +			drm_property_destroy(adev_to_drm(adev), prop);
> +
> +			return ret;
> +		}
> +	}
> +
> +	adev->mode_info.abm_level_property = prop;
> +
> +	return 0;
> +}
> +
>  int amdgpu_display_modeset_create_props(struct amdgpu_device *adev)
>  {
>  	int sz;
> @@ -1409,7 +1467,7 @@ int amdgpu_display_modeset_create_props(struct amdgpu_device *adev)
>  					 "dither",
>  					 amdgpu_dither_enum_list, sz);
>  
> -	return 0;
> +	return amdgpu_display_setup_abm_prop(adev);
>  }
>  
>  void amdgpu_display_update_priority(struct amdgpu_device *adev)
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_display.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_display.h
> index dfa0d642ac161..2b1536a167527 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_display.h
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_display.h
> @@ -54,4 +54,11 @@ int amdgpu_display_resume_helper(struct amdgpu_device *adev);
>  int amdgpu_display_get_scanout_buffer(struct drm_plane *plane,
>  				      struct drm_scanout_buffer *sb);
>  
> +#define ABM_SYSFS_CONTROL	-1
> +#define ABM_LEVEL_OFF		0
> +#define ABM_LEVEL_MIN		1
> +#define ABM_LEVEL_BIAS_MIN	2
> +#define ABM_LEVEL_BIAS_MAX	3
> +#define ABM_LEVEL_MAX		4
> +
>  #endif
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h
> index 6da4f946cac00..169bc667572e2 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h
> @@ -326,6 +326,8 @@ struct amdgpu_mode_info {
>  	struct drm_property *audio_property;
>  	/* FMT dithering */
>  	struct drm_property *dither_property;
> +	/* Adaptive Backlight Modulation (power feature) */
> +	struct drm_property *abm_level_property;
>  	/* hardcoded DFP edid from BIOS */
>  	const struct drm_edid *bios_hardcoded_edid;
>  
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> index 928f61f972a1f..4025575d2f536 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> @@ -5042,6 +5042,7 @@ static int initialize_plane(struct amdgpu_display_manager *dm,
>  static void setup_backlight_device(struct amdgpu_display_manager *dm,
>  				   struct amdgpu_dm_connector *aconnector)
>  {
> +	struct amdgpu_dm_backlight_caps *caps;
>  	struct dc_link *link = aconnector->dc_link;
>  	int bl_idx = dm->num_of_edps;
>  
> @@ -5061,6 +5062,13 @@ static void setup_backlight_device(struct amdgpu_display_manager *dm,
>  	dm->num_of_edps++;
>  
>  	update_connector_ext_caps(aconnector);
> +	caps = &dm->backlight_caps[aconnector->bl_idx];
> +
> +	/* Only offer ABM property when non-OLED and user didn't turn off by module parameter */
> +	if (!caps->ext_caps->bits.oled && amdgpu_dm_abm_level < 0)
> +		drm_object_attach_property(&aconnector->base.base,
> +					   dm->adev->mode_info.abm_level_property,
> +					   ABM_SYSFS_CONTROL);
>  }
>  
>  static void amdgpu_set_panel_orientation(struct drm_connector *connector);
> @@ -7122,6 +7130,20 @@ int amdgpu_dm_connector_atomic_set_property(struct drm_connector *connector,
>  	} else if (property == adev->mode_info.underscan_property) {
>  		dm_new_state->underscan_enable = val;
>  		ret = 0;
> +	} else if (property == adev->mode_info.abm_level_property) {
> +		switch (val) {
> +		case ABM_SYSFS_CONTROL:
> +			dm_new_state->abm_sysfs_forbidden = false;
> +			break;
> +		case ABM_LEVEL_OFF:
> +			dm_new_state->abm_sysfs_forbidden = true;
> +			dm_new_state->abm_level = ABM_LEVEL_IMMEDIATE_DISABLE;
> +			break;
> +		default:
> +			dm_new_state->abm_sysfs_forbidden = true;
> +			dm_new_state->abm_level = val;
> +		};
> +		ret = 0;
>  	}
>  
>  	return ret;
> @@ -7164,6 +7186,13 @@ int amdgpu_dm_connector_atomic_get_property(struct drm_connector *connector,
>  	} else if (property == adev->mode_info.underscan_property) {
>  		*val = dm_state->underscan_enable;
>  		ret = 0;
> +	} else if (property == adev->mode_info.abm_level_property) {
> +		if (!dm_state->abm_sysfs_forbidden)
> +			*val = ABM_SYSFS_CONTROL;
> +		else
> +			*val = (dm_state->abm_level != ABM_LEVEL_IMMEDIATE_DISABLE) ?
> +				dm_state->abm_level : 0;
> +		ret = 0;
>  	}
>  
>  	return ret;
> @@ -7216,10 +7245,16 @@ static ssize_t panel_power_savings_store(struct device *device,
>  		return -EINVAL;
>  
>  	drm_modeset_lock(&dev->mode_config.connection_mutex, NULL);
> -	to_dm_connector_state(connector->state)->abm_level = val ?:
> -		ABM_LEVEL_IMMEDIATE_DISABLE;
> +	if (to_dm_connector_state(connector->state)->abm_sysfs_forbidden)
> +		ret = -EBUSY;
> +	else
> +		to_dm_connector_state(connector->state)->abm_level = val ?:
> +			ABM_LEVEL_IMMEDIATE_DISABLE;
>  	drm_modeset_unlock(&dev->mode_config.connection_mutex);
>  
> +	if (ret)
> +		return ret;
> +
>  	drm_kms_helper_hotplug_event(dev);
>  
>  	return count;
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
> index 0b964bfdd4a55..5a38373e054a8 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
> @@ -969,6 +969,7 @@ struct dm_connector_state {
>  	bool underscan_enable;
>  	bool freesync_capable;
>  	bool update_hdcp;
> +	bool abm_sysfs_forbidden;
>  	uint8_t abm_level;
>  	int vcpi_slots;
>  	uint64_t pbn;

