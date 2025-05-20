Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F718ABE48D
	for <lists+dri-devel@lfdr.de>; Tue, 20 May 2025 22:13:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A4F9210E0EB;
	Tue, 20 May 2025 20:13:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="xZrKxpq6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on2084.outbound.protection.outlook.com [40.107.102.84])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D62DB10E0EB;
 Tue, 20 May 2025 20:13:26 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dZPXZpT/6+6jbWSyaP4TK9VNqmhQQVQUX+C+67akZ/Qt4ZhHNH2Lab15yzZjizua5nIVLbrKfxhFCF0WZBxfnj/8K3on6o1mcSNzJg61KXEdCS58q7AondzHjTrT4/67ItiT/OHq5bkAdke5Z6wBYzIYY9m7kqm+OlX/eozC/Qm6+BE+l1rghYs1cyCtU+jQTpsMcND7hLdd+ogZCdeKMCse6L2MkLy7MB6iYZZxI1ptc5YaZL/zIt5U+3R8Snm5cdmDn/RM0r4HbQ3OUOx0uV8UJBZG15Irwq4eZFYKr07O3CtUkQ8WDtxD8fTZcjzczP6wFCno9fsifw4CYBW+kQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i4MCWKF7Cc3qxdkSmy09nG1i2jcdlS33m0VucfazWOg=;
 b=pIbRazpdPkfMxs+UrnAlvO9EtjYcb38+hF4+Sd1Nikn2KDOBbdc9YN2JRstDXkTEjd8C4Dw5ictNi1LPiZGq4tJXPk8/EOmWHwvQBWfpBaJkm/SB5eyAbEmUzgqwTd3dSlrehv44lr/KyCkWNzm4FDNnfGqLekIlIOQw1FIqlw8EWk8ny0pejmmE+mWcRUnCiNsqOaxr/yEEfvsyEWIjIJzcn1h+4UFKfRO3FFynr+Hgycw78MjrTc9FqUUrk41RjsDMwDhdBgggfkfh/OHiprSEttM5PvGkL74BI9gk7Y4MmdYkIkCsQVUAZTJYQtdNvOsiRBpv32G6N3ko1JGzbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i4MCWKF7Cc3qxdkSmy09nG1i2jcdlS33m0VucfazWOg=;
 b=xZrKxpq6Y7YYmoMKdcT9gJHZ51ieSKuALulh9WypQeg3DD0pw3YGj0KQBs7as3X3U2DaO3VY3Hj1AbAOeq16uqIrQAL531LEb3vwUB8iGbBCRvwusy2gd1W/oU3uiemus89m/QyGoNCSwTWHviWVr7FngwZ9eHcRicLlQzhfb0A=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CO6PR12MB5427.namprd12.prod.outlook.com (2603:10b6:5:358::13)
 by LV8PR12MB9359.namprd12.prod.outlook.com (2603:10b6:408:1fe::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.33; Tue, 20 May
 2025 20:13:20 +0000
Received: from CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::1c2f:5c82:2d9c:6062]) by CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::1c2f:5c82:2d9c:6062%7]) with mapi id 15.20.8769.019; Tue, 20 May 2025
 20:13:19 +0000
Message-ID: <b3bf99cc-f6f4-46ce-aa00-fea74b3179b1@amd.com>
Date: Tue, 20 May 2025 16:13:14 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V8 40/43] drm/colorop: Add 3D LUT support to color pipeline
To: Simon Ser <contact@emersion.fr>, Xaver Hugl <xaver.hugl@gmail.com>
Cc: Alex Hung <alex.hung@amd.com>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, wayland-devel@lists.freedesktop.org,
 leo.liu@amd.com, ville.syrjala@linux.intel.com,
 pekka.paalanen@collabora.com, mwen@igalia.com, jadahl@redhat.com,
 sebastian.wick@redhat.com, shashank.sharma@amd.com, agoins@nvidia.com,
 joshua@froggi.es, mdaenzer@redhat.com, aleixpol@kde.org,
 victoria@system76.com, daniel@ffwll.ch, uma.shankar@intel.com,
 quic_naseer@quicinc.com, quic_cbraga@quicinc.com, quic_abhinavk@quicinc.com,
 marcan@marcan.st, Liviu.Dudau@arm.com, sashamcintosh@google.com,
 chaitanya.kumar.borah@intel.com, louis.chauvet@bootlin.com
References: <20250326234748.2982010-1-alex.hung@amd.com>
 <20250326234748.2982010-41-alex.hung@amd.com>
 <CAFZQkGwrP39REsvZwQ_Uaq+cHR_pH2EPuv_POXRO7Hxj9u4Xsw@mail.gmail.com>
 <vyX7bdPppc_pDUQBeKeZNyy69WUl_XKExs-I7dfuDJJy6SKXWoBL7B-IRMZKxuktNMQCIg0lP56Xj0qLidKOlBJQJjUYHOQ5Id6yw5k8Q10=@emersion.fr>
 <CAFZQkGxXJe=FGdymMRevbtU+jKre6PdthAu33Qz+kVsR_OVpJg@mail.gmail.com>
 <BqFABawLqkjFjPvuKwfsFBKt2A6KcEIeJU289qnX9Try6dV0nhXeXF3vxJUK_xUP5a1gfARBt3wY0lpOV2Nbmcmj5WXCw6fsZjPNT39KAu4=@emersion.fr>
Content-Language: en-US
From: Harry Wentland <harry.wentland@amd.com>
In-Reply-To: <BqFABawLqkjFjPvuKwfsFBKt2A6KcEIeJU289qnX9Try6dV0nhXeXF3vxJUK_xUP5a1gfARBt3wY0lpOV2Nbmcmj5WXCw6fsZjPNT39KAu4=@emersion.fr>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YQBPR0101CA0128.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:5::31) To CO6PR12MB5427.namprd12.prod.outlook.com
 (2603:10b6:5:358::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR12MB5427:EE_|LV8PR12MB9359:EE_
X-MS-Office365-Filtering-Correlation-Id: 200dc07d-b463-436c-be56-08dd97dac39a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|7416014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SVBFZjI5c09FY2lzYVhsRzRGWjEzdURab0U2aVpuQ0lSbm9FS2IxYm1sdkhi?=
 =?utf-8?B?WHhqbkZJK2F3MkZpNGJGa3YwNzNVRUV3d203YWJlTEZxcEhPNW53RVdXS3BK?=
 =?utf-8?B?ZVJUdDJHNTBkVUI3THZ0cWxLUnlrR29OT0I2K0pWQmp6WTBYQVg3OVM1Zyt1?=
 =?utf-8?B?SWRjZzJnSmtiRkMwdENRNjhNS3NUUzhFd2tLUDVGL2I2WVNpSFNScmFObkY1?=
 =?utf-8?B?MGkreEc4ZkVhWEg5WmNQSFo5emcybVNWeW9LMUcyNk93QlcybXlkYVhYREpq?=
 =?utf-8?B?Z0FqK2VFQmFOeTFzcHV2cTR0ZzYyQjRibm5sRTEwR1FVeVhadFVZa2paWVZk?=
 =?utf-8?B?WnBDQjVxbXgxTU1rMkN6OHdKdjJPa3ZMeHVwY21NeGc4K2UrMm0wTjRlemNy?=
 =?utf-8?B?QUNDZVp2UVRKblRsYTBPQ2dRUkdjWUVqWVVVR1dzcUd6TVdJNmJGU2tQdXYr?=
 =?utf-8?B?TGJFZjVqWExTSU9nN3FMZktkR21lRHJybjlKdTlXWVdNWnl3N1dKS0ptOElt?=
 =?utf-8?B?NmJMT242RjI2Um1XbjN1bU8wRWNRenNFU2lTY3RoWDE2U0NMYm5jb1RCMm1h?=
 =?utf-8?B?TDFpQ1dQNkIrRG1za29TUUhkcDRiTWhjdmtGaUFHTXJnSGxSUElEMUF0bnVo?=
 =?utf-8?B?SWV0VHJLTzdnb3lkWU9RdDJUSmI4bUptL3Bpa2ZneEx1OUdpSUY4MkNJTVVP?=
 =?utf-8?B?YTJvVU0weFFLcjJWWThpM3RoWHViTy9uZVB4ZjcrOVhPazVEeDJHM3NuZCtF?=
 =?utf-8?B?WVZNOEMzMXdLR2xaa1BMT044dkdLU25zQXJIZHJIR1Byai9mdnVwRkxsQWRD?=
 =?utf-8?B?bDNnRS9EMVV6elQ3Q1lXWU5rMUw1VkduZWhRcmM2R0F0M0lldlcvZUx1RTND?=
 =?utf-8?B?Y0JEUlRiYnZGbVpKT0xhZ2tDbWI0QTZmMTFaZFlMMjdHdGQ0c0VNcUc1VXp6?=
 =?utf-8?B?V1dHT1ptUmpqS01kVFJ0cEQ2WDNoYkV0dTJEWjZCT2tjejFEMGs0WmhYaUpz?=
 =?utf-8?B?VDRXQTRwQjFqVUFrRVJ4dGdISFF6TStHTXR2akV4UndWckpSdXVoMnpsNVRD?=
 =?utf-8?B?b1V6QW5aWGt1ZTRWQ040SUpMRzBVQ3dDZU9XTit1MFl2M2VpajV5SUF6MUdy?=
 =?utf-8?B?VnVaNnRvSzBwUXlzZkZwRFBNUDFxcklHMFhBVGRLZ0Irb2ZseUVsUmVURGxj?=
 =?utf-8?B?UUp4Z0lQK0w3Z3ZhSEF6Y1l2TzY3eUdZS2VUOXFZOFJ1VTlFUUVlOWNHczBX?=
 =?utf-8?B?dWM1NnE0eVhLNWxrd2ZYdkI4MWtzWEZSa1h2cktQM2t4WE5hSDM4Q0JxR3BP?=
 =?utf-8?B?dFlIdU5QTVI5REJMSzdQbW90ZEx4VmkyV2w1S0RlTlpzVGQrWm0ra1ppNDlP?=
 =?utf-8?B?UEFpVDF2bGVGMVNKOEk2SWtoVHlYQ0N6M0w4YTI2Q0ROaXFRUXVCNUF4WVNa?=
 =?utf-8?B?aVBJM3RYRGU0VkJVeE5uUzEvdWNmM2FrdGVQd1IyMXovaHR3L1VtZjhDMUpo?=
 =?utf-8?B?TnhCVDAra01HSDhxNWtsUW95UUdnb1lJQUNUaHliQzZDVHJqbW5KT2V4NVF5?=
 =?utf-8?B?eFg4VmJMMHplRGJadDZzZWhYV0s4eWorNGJSZ0ZPMmtnNFNJYm1Pa0hxb3ZL?=
 =?utf-8?B?WWs0dU1yTWdnMEw3dFVtT01QUktYL1hQcVZhSlRwd1p2UWhUc0kxejMvZnlt?=
 =?utf-8?B?Z0E4YittbEwzelJ5ZmtISEhONndheDFsL0laZ2ZWZU9nOXpEWlhGbU1BWGJH?=
 =?utf-8?B?a0FUMTNTRW1SNUJYdS9CTWQ2a0RqOWxFNGVGNU0xNFhUd2ZDWXhBZGhWaVNV?=
 =?utf-8?B?YlNRdEgwdzdOUnN5OE9lRFNrd054OERlYUowWFprWG5GaXJrTkh0RGxtcGRl?=
 =?utf-8?B?bDUvMTFNZmdyUkFFTHJqczhtTjB2REErcjcxRldRQ0hrcGY5WFp4RU5NS0hM?=
 =?utf-8?Q?g9q4IYqBRec=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR12MB5427.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(7416014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WWdkUVBYZ1ZjY1htdHlxVkZBV2tGTTlPenp5a0RXZ0tJS2N5ZCsxVkJwcHhE?=
 =?utf-8?B?cG5uZFRncFBxMFdORjhBWnhFbnJOSDZzemlBRjkxaCtFSW92bXBZY0l0Q1hj?=
 =?utf-8?B?Z1VybGs1Qys0VXhwK3BRdzhTNFR4aUc3NWVRdnNienFSUlZQUXo1VjRaaUg4?=
 =?utf-8?B?MnhPWkZ0b1pGLy9QMElnczRTUUIzSXhNKzM0S0dPaHBjbEE0UDhzaXY5T1Fw?=
 =?utf-8?B?dFhzRWwzaHFxMlc0QmxUNHo4SzdaUy9qWTZyK3FQYVk1c3AvRTA1cW5BOXVy?=
 =?utf-8?B?TnhsU1NlaXg3RmRnVjJxeHAvUmhZMGd3cjdrMmhuUnJmZlp5dytBWmlieWVM?=
 =?utf-8?B?QnVlSHJ3ZFl0MFVOazA0N1RWT3YvTG5xdmYxV3VFMk45eWlVUjYvYWVNVFpm?=
 =?utf-8?B?Nmc0eC8vcTZOS1lOa3Azc0NXRzRWaE80cTIyWUxGOTBwV3grZVhUZ213V2dz?=
 =?utf-8?B?NHN3N1pTOHgvcnZjZ1VVbzFJeDlYdHpVY3JTU2ZhTDRJc1ZwczAwbVJHKzhV?=
 =?utf-8?B?c0NQazZQSDVOM3RxU285UTJCMUx5WTMydmJhUXBzMEVpd05xNHU1MWxuRVZF?=
 =?utf-8?B?YTQ2eTB4SDBDRVVvMmk1djBxT2U1UGlmYWg0Mm1LWnZ3MWFDM2FlSU5WMm9w?=
 =?utf-8?B?dFRTUkg0S1NUZzE3aDVEREJRVGU3YUY3TnpMN2hRV1VyWFBmNnBBUE5YbXdF?=
 =?utf-8?B?SXduenZBNHJwa3Y5Q09NR0R1QW51c2NmQU14aENoNDJ2ek5xdXA0cmJxNzBP?=
 =?utf-8?B?dGNEV0JKL1UybTRjZW56NzhJbWsvYkRvU2RSRy84QkY2c0l3NFBLR2UvQWVt?=
 =?utf-8?B?clowSStUUzAvemxRcnBEeXJNNzdiL3RyNmsvTE5ubVgxSU9kVWdSVTNOSTl6?=
 =?utf-8?B?b09LNWhkSFZreitrbVEwaFhyaHluYmxzVE9yejBYcU5qeEpNQVBaajlrOTdh?=
 =?utf-8?B?aW9PS0Y1ZFlTZDFOTzVQSEl3ejdUTzdvaWVzTFl2aEZpR3UxTVRTMTl4UCtU?=
 =?utf-8?B?aXppejFzRlJFdWlPZHdIb05WdzNaNWpiVlNzRnFXV3NWYXFTS0FjbGNpZnly?=
 =?utf-8?B?aUtzeXdSRTRsYzJIdDNzMnNvZ0tCa0l3aVBDQmF5K2IzbHZHVUk4cmJJNnJR?=
 =?utf-8?B?ZVZYS096YVAwazhlMDNiNUkxT3RuQ29JUVoxL2VTTjFWcU1MN0h2VWdjaVYw?=
 =?utf-8?B?UXFrSkROK3E0OU00ZlZhYTJpaWJRdGE0UU1OaUJSSmJKeVZ3bVNSTWwxajA4?=
 =?utf-8?B?NGZ0eGxSYWh3bFErWWpqMnBqci94d044NktPYlZ3YnVXWWErZXB4SVlseDBZ?=
 =?utf-8?B?Mktac3ZVZGFXQmxGYmJmQ1Frc2hnWDRMUXlGNmZQQzNpVS9HM0p6c1ROaVB1?=
 =?utf-8?B?VUZzaFlGSUFvU1I1V2t0RlI0dmQwU2VLRkFBWnFmbEZDakxQM3hsOG5VaGw3?=
 =?utf-8?B?a2w4T01XTDZUbnJmZFdhRzFqYms3bUhiRUx3aElRWGhSN3BTV1YvZCtucDJE?=
 =?utf-8?B?V0JVMnFsV2RCRVJlUlVsSStVTWtaQyszOXU1YTJQWkl2cFVTcUdyMWVXQzN5?=
 =?utf-8?B?SlJGYkRnWjh4bTBqNFljOGZkckpwb24rbllzZ0pqNUV6YnlOU3pXZzdXOGox?=
 =?utf-8?B?Yld6MkdGQ0xNY3dBSjgwM3JZWE5XZWViMU54c2dzSHBWVHE5emxOcHppbzdG?=
 =?utf-8?B?M0RNMmdYWFYwVnhQdVBLRFYvMEVLdHpoYnM4MUNTbE1RSXhkcVp0QlV4YTdR?=
 =?utf-8?B?M1h6UTlZZStXdmp4TVIyeGE3RFVSK3Z6dkRoUFk3UzBhdDc5ZXBya09lUFlJ?=
 =?utf-8?B?bTFBdDV1VUxvQVpNazJjcVVhZE01RzFRZDVwUERCY0YvVkZETXFxT1hjUm1l?=
 =?utf-8?B?MnFoQUxMUitzTWdiTVhCcXBEa0N2bEQzWGY5ekJTUnQ1ZmwxZ3pXSys2R3dR?=
 =?utf-8?B?VnhVMnBTeUc0aG9CZ0hFbEw1d3E4MWcyVHY5bC9RWUZ2d1NsNEdqenVUeTZp?=
 =?utf-8?B?eDVhL0MzZUdlQ0ZtemVEak5Wakwxa09PUUdMN0FreVBSak9ZaXBUSzJzRVdB?=
 =?utf-8?B?NFQzVzkvelhDUENyczBIUXZMWjFaNHNsS3YwVzIrN2hWckd0R2ducTc0cVMw?=
 =?utf-8?Q?G0/SHFdzJ6YG8oFFv0baLGKqL?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 200dc07d-b463-436c-be56-08dd97dac39a
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5427.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2025 20:13:19.8998 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EkcPEl0JQFMrQPzzMqD1LBQf7R59Hx/rNu3z/l/eFwI8gWr2c4W16rakbmwF7G2DcUcYyVdkefq3fEeNrCqwKQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR12MB9359
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



On 2025-05-19 19:43, Simon Ser wrote:
> On Sunday, May 18th, 2025 at 00:32, Xaver Hugl <xaver.hugl@gmail.com> wrote:
> 
>>> We can always make the property mutable on drivers that support it in
>>
>>> the future, much like the zpos property. I think we should keep it
>>> immutable for now.
>>
>> Sure, but I don't see any reason for immutability with an enum
>> property - it can just limit the possible values to what it supports,
>> and that can be only one value. Either way, it's not a big issue.
> 
> Immutability is a clear indication that a property has a fixed read-only
> value which can't be switched by user-space. That's also the pattern
> used everywhere in the KMS uAPI, so I think it's better to remain
> consistent here.

I was envisioning this to be a driver-caps thing, but I agree
if we make this mutable it can still serve that function but with
different/future HW possibly support other interpolation schemes.

Harry
