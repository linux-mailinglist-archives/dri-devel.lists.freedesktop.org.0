Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DC7BCA34BA1
	for <lists+dri-devel@lfdr.de>; Thu, 13 Feb 2025 18:20:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9396610EB55;
	Thu, 13 Feb 2025 17:20:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="snREXPx2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2056.outbound.protection.outlook.com [40.107.237.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F337C10EB55;
 Thu, 13 Feb 2025 17:20:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BfhVM0EHfEvPBzrHDUl0XIn2Gzz1nn6xlcS2P9DxHz2u/IUzcrFeNvlApsYRr54auZ3UUVgqjM/2kQ4upGbF3n/OcLgb2vmWxm4erQMVLV9xcP7rMnJ5OHwD3IryDCeln8UH9uuWW20qV8pdtTcF1m6IvmnpMxsMbt1Iqbe3vBBrwGNxjb/uBk7EXZPy8r2QqD9fPyq2pCwiblgLwURecL8Yqr+sd4FSPOMMYRZJUHhjHofDd8C+CSm3D91mNy6AUs3Bzl5TWWvA+HOGPuji2ATVrhqWciLnap4fMNuNqJEDI7XdnxG0QgxQWyLmmkSxFk0+OKSW5DSeqHlQsyZ8Yg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=I2s3nKEfRPCwZN6KsPnLmHknNGWoXsDeOJH/Wu0dDk0=;
 b=iYq/dL4PZCbAotfr2KQxVCyReP5ZtyKk7blwmoU6CFSHMWPKolanC0BbXnD+NesO5m5xMkQ7srl/ceOHSNZG0aO/r7U6MPGioOEdafW3d6L3oE80bLBhEeH2X9nw5ut1BzxZVuO5Y64jzeMkDzCs1OVxQL0wKWr5QScM4oG/1pxD5+Cbcb1Abf5elKmNu3yTTkSjKOk+n8m3XgtRA4EsyupbXS0f2c+F01ODkSzYCBDZiCaO3FSB8ZMkayBdjb4NLVprla0jxOOp8/03RpbHL0Dd2MzF01w0JDKZShYbrHcINnK/fKFnTMqtnpiM1h3ICOKsMtpp/8CaHob9UEJwIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I2s3nKEfRPCwZN6KsPnLmHknNGWoXsDeOJH/Wu0dDk0=;
 b=snREXPx2fPRFJGRELAfb8QC4s2txOR8LutRbhZ30wx3hrwpXhL2W9S7vbL6rC5nQSXzq711W8ELNKB1yM6PPod1XPlKZWSeRgDEtzIgwDB6k/p0cNhZBTedRbRq70uzxup55941aGwZZgwug2lcFhPxYUEhKSiarMZlAccU2h4M=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB5311.namprd12.prod.outlook.com (2603:10b6:5:39f::7) by
 CY8PR12MB7681.namprd12.prod.outlook.com (2603:10b6:930:84::19) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8445.14; Thu, 13 Feb 2025 17:20:34 +0000
Received: from DM4PR12MB5311.namprd12.prod.outlook.com
 ([fe80::a846:49eb:e660:1b5b]) by DM4PR12MB5311.namprd12.prod.outlook.com
 ([fe80::a846:49eb:e660:1b5b%4]) with mapi id 15.20.8445.013; Thu, 13 Feb 2025
 17:20:34 +0000
Message-ID: <dd3ae1a4-56ee-480f-a5b3-b97f276c5069@amd.com>
Date: Thu, 13 Feb 2025 10:35:34 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [V7 26/45] drm/amd/display: Add support for sRGB EOTF in DEGAM
 block
To: Alex Hung <alex.hung@amd.com>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org
Cc: wayland-devel@lists.freedesktop.org, harry.wentland@amd.com
References: <20241220043410.416867-1-alex.hung@amd.com>
 <20241220043410.416867-27-alex.hung@amd.com>
Content-Language: en-US
From: Leo Li <sunpeng.li@amd.com>
In-Reply-To: <20241220043410.416867-27-alex.hung@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YT2PR01CA0012.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:38::17) To DM4PR12MB5311.namprd12.prod.outlook.com
 (2603:10b6:5:39f::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB5311:EE_|CY8PR12MB7681:EE_
X-MS-Office365-Filtering-Correlation-Id: 357f2dbf-ded4-41b7-6d7f-08dd4c52b998
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VTZRVTFDbG5OMS9ETDc4WW9ZTVl1S2IxdnUwWFFKalk1VWhaajVveGVKOXNC?=
 =?utf-8?B?Q2FKTDh0Wit6aXFkeVZhcTZiVFJtMkVtNXU1L0ZSL1h4U0N1UmxRRTdFOWpO?=
 =?utf-8?B?OEY4Z2ZoRHRsQnMrZzVaOWltNUZxaWtRS3l1VlJoc3VKOTAzeC9mSU0rdE1W?=
 =?utf-8?B?cGtlNzMrVVFubGdlSWNZejdTOXBFM3ZpK2xvVHkvc0VDZkROZisyQ3Z3eDcw?=
 =?utf-8?B?Y3VER2g2QjJkVlJvbXdqUTMrTC9hM1loMU5Tb1REb3RkOXRGdGNjUzcwZldP?=
 =?utf-8?B?UnZlQ0IyaS83VEZoUG5WVnpLL0xiWVVDZTl5QjFNeDJyQmJVaFF0ZTducStk?=
 =?utf-8?B?ZTRzWHhsbjNULzZaT2pLaWU2ZStNamd2Y1ltSTM3enNGdTRyazN1L3k2MmRk?=
 =?utf-8?B?MVhLdVRETkRaM2ppbjlZVW1CZEZzZlo1TXZRS2FTeUpnMjhsd0plSThkaWpl?=
 =?utf-8?B?VEZ1dDZKN0ZLV1lOVFhkTDZWc0xMWU9DN3l6czhsNzJPWWU2QkZmNTJPZ1Ex?=
 =?utf-8?B?aGtwaVkyanZCUmJXZHk1aVZTODNkQUZ6Zll4NjJiUURXYnh6RTU2UjVsSjJ4?=
 =?utf-8?B?S2J1MVJucUpMaW1XdFpBRjVTNHRqYXJrK2c4RGllNi9uSFlIbCtiVTNtZ1dE?=
 =?utf-8?B?bnp2YXNnRmxTSm05d1FBek1JblNZV2diMFpjTGQwM2lDZUdtSEJCVjBOTnNP?=
 =?utf-8?B?UGRUVzVPbFMyT3huQmxRbDkvWTg1cGpoL256MDhJVWdtZHl5aVptZGZQbTE0?=
 =?utf-8?B?YTBHNVhybHBOVlI0TmkrN0RkZGhkSmxqdkxJSEF3bUdhMzhEZ09rc2tJYmVP?=
 =?utf-8?B?WFZBeTZ5U0lvcE5tajVLYXlucHZTLzZIUThqSjh1Q1kyVWtidlROcVl5c3hw?=
 =?utf-8?B?T2lhL1Y4N0dlVU1wcmlWVEIzQXN6QkpxUldabVp6Wmo2U01KbzJ3OFRvQVBo?=
 =?utf-8?B?NE5tbmZGU1Y4SzFkZlFXQTdMbzdYbE5GL2JCWDdvRThvcER4d2VxMVBwY3I3?=
 =?utf-8?B?VFlKMjRWUlFDN2JtdEhPdmJtZHhwTVZOWmY1MkhDSm01TzlzdVBmZnhua3Mw?=
 =?utf-8?B?VTJiZ0FFcXMwNHdET3E1czR0cXpJZVNQVXdaZzdvbEFHZFZWdlBHMG1JblJv?=
 =?utf-8?B?Q0Y4SjVMTzgxVTVSOGp0UU0yUWJ2QmZqTEVsZHRQZDNEa3Z3ajhvWEdwSmJ6?=
 =?utf-8?B?ZkhlU0J4aXBnbmUxaTFhMzdSYkFXWXNPV2w2VXlUdklQb1VQOFFXc25lcXVu?=
 =?utf-8?B?QTNCQzVYTmFwa2lqdUNMeHhycjMyOEYyMmtUOEhkbjVQTGgzV2ZCTjRWTElu?=
 =?utf-8?B?TW9lUDBRTHVGRjUxejZuREpwZmZFaW9RS0toWnFHTkNzcnQ1OXd5SXdDdG9X?=
 =?utf-8?B?VzZ1RG1MT0I3RGN3dzdjU0dzS2Fia1YvaC9nVmpkd1lPMzRuaFZJTFoxUUVE?=
 =?utf-8?B?UVB2OXBXRWRacFEwSVh5R0p6b0hsWndDdjdHSFkwbHdRMlRSU0s0MjMxS0VN?=
 =?utf-8?B?OUxDL3RYR01jVWxzMVNkek5qdy84dkl6azd5SkVSekdNNURpMnhPd3V6Qkoy?=
 =?utf-8?B?K3o3WVpWRTFXZnoyUG5UU3d6MEE2QzhhWGdEVWp3V09iVG0vZWFndWtjYncr?=
 =?utf-8?B?UmlNVXJUQmJjd3QzeGdQN3RGdm9yaG5jb0JRQTRGdmxDeis1dzd2cTVxeEJU?=
 =?utf-8?B?V054V0JZRVQzN2ZRUFhpTGhnbGVHbHJncXpZeUhlQWl4QjI3cVlrVDRHU25Q?=
 =?utf-8?B?enZQQTFJSFRUY2pWdEMzTWhnSklncFlJbVAzdkJGdGtLa3FVdC95eHVyTEZ6?=
 =?utf-8?B?WUhXV0VUYUMvTW0xa1ErYlg4TkwzL0pBNFFpVmdYYXRWOUc2WmVqeE1NMkhr?=
 =?utf-8?Q?uUnQq2lw+Uxay?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB5311.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?U0p0WWk0RXNZSmE0MG1TcGN6Sit2TFpBWE5XdUlsYWlGZWRtZTNmUHJmNzd6?=
 =?utf-8?B?Zlk2VlV6NEJkd2NOOHhnbEVwTGZOK0JCdU5lMUpnejUvekQ2VlFidlV3cC9t?=
 =?utf-8?B?NWVORUdRb0hsR2xhdTlncVYyQ2ZnVmZBMjViQWVocEFNeEdMSmNVTnV3Sm9a?=
 =?utf-8?B?VGdsV3lqWWVFUkRPYkI5SlhRNlBjZWZBNFR5dFJKUGZ0bXVjamZ3QWtBRXQ2?=
 =?utf-8?B?V25PUGRjc01taTNxMHBkQ1VkNWdZWlJXekpwK1RwSVBUdjRtdTJvck9xdjlK?=
 =?utf-8?B?TnZxSzRGbkdOT1lPNjlwQWJESDMzY01LUnMzOElXR2VyQ0tGUldMNCtHcVly?=
 =?utf-8?B?M2FSV3U4R2dQMU4rQzVKSXFyTnY0VGVnNjlyQndENDFDT1E2Z2pEQ0RsRkVV?=
 =?utf-8?B?dE5tT0hPSWNwNnZnemNqMWJBQlNPZmczZzBqZUpMLzhNcjRqRHd2RDBvUkdn?=
 =?utf-8?B?eXowdUY1bGRLZzZDK3hpRStCeHhvdUREQ0pLUklLVlZjNTlxY2pGb0tDV0hx?=
 =?utf-8?B?TkhzeS9PM2dueEZqTTV5U1NnSW5RZ2J3a0xmQUZsUEt1QklweTU4NWltOXNI?=
 =?utf-8?B?MXVHcFlabEwzdC9SWDZXajNSTjhlSkdSSU5sd2EyY0VQTkRMM3paaEU2WG51?=
 =?utf-8?B?ZU05Y01iQjV1eitTYmZvZ0crb1JadUZmOHBlaldJL3FtY3ZUK2R2U1JCSVBa?=
 =?utf-8?B?bkIrc1I2eGJQaElremJURFZ0aFIrZndhSGMwYkFLZkdPdXdSaFlSd09ac2Ja?=
 =?utf-8?B?MXFUZVFOQ3E3L3luazFZc3ZoSWlTWnB2UVFMZ2lVMkY3RUdWVklzWnBoeDJC?=
 =?utf-8?B?Y1NRaDNUUE1YbDhDQitLR1lENzloVlg1aUFRa0cvRGkxa0NwbTlkeklpWUFW?=
 =?utf-8?B?S3ZkdjcrN3BSMEpZQzR5VmdLQmkxVWdHcjcza3YybjdoaXhPYk5sRVJEbG1j?=
 =?utf-8?B?NHNHU1RqVERkdW5TeWV6RTJTMWhPY09IN1p3MHRKZ2VFQnhpRTJadHBTQ0Jq?=
 =?utf-8?B?cXlvN3lLaFhuMjJucmlCcjAyaTV1Zlc5Qk9vL2VvUWVwdm1iWmtFTDV4TXZT?=
 =?utf-8?B?dmJQMjVmaldLS2wzSUxuVFplV3RHRmtKV2lQZHo3ekNNa3pyNDVhcTVOT3hV?=
 =?utf-8?B?ckI1SEViU3lXdlA2eTkwV1pKNWpUWHVtelpLcms0cGRJNDNOenFBOW1VZHBu?=
 =?utf-8?B?TitKRHg5RFp0OHFXbEs2TW0rMUdBd3BvRXo1SzhlUzF6WVVJeDNveUJCcjBL?=
 =?utf-8?B?SVlGUzRxaUozSmlwSit0UkpzaWRHRTR2NG5EaE5GblVTd0RKZUJ3Q0dYZHEy?=
 =?utf-8?B?Vi9HajJHaFo3MStDd0llTmNLRnlFclAyY2VGYmpPTDM4U1g2QjNIdUFxOVFM?=
 =?utf-8?B?dlRDTXBueG1rbUMvcngralRKS0VUZnRaY0pRdTM1RmJNREpmckFHZjFCU3NG?=
 =?utf-8?B?ejcyUFV5YXp5TlNHdkVTSUQ5RkJVSTBFdEhwY1QrRnlkeUN0TEJuQVdPa3Zm?=
 =?utf-8?B?b3VWN0hSdmxVZG9CVlR4WTJLTU4xK3I3S1NYRUFBZ2Y5OFBWNjFjVkJPM3d6?=
 =?utf-8?B?dTNzRHZlN1luWGUzd3orV0wveVBxdzhSWTJLbDdoWmpYOUVDZk5NZ1g2V3Nk?=
 =?utf-8?B?VjZhbW9RSzVsc1gvaVU2R0xJRVVxcGgyTjJUNzc2K3M0amFOTSsxeGJ4Ukx5?=
 =?utf-8?B?a1cxRkNHNkJGNXUrY2dIZFZaQ1JkdW9kRG5jNHlOLzQ4UTU3SWhyVGhLbUxk?=
 =?utf-8?B?dlI1alUralRyL1o0Rjl5Z3dqTjlqOUNFN3E4RjFqbUNhT0NTNldMRVlHVWJN?=
 =?utf-8?B?bm1uOFR5VWV4dmpTd1IwVEV2Z2t3WlpnQTArK3l2dzRhWTdSdzZGNTJmVmxs?=
 =?utf-8?B?RDFWb0xYVDZUTGdmVHQvSFVaN2FnMnQ5UG9WZVpqbHoraERncElGQng5Y1hF?=
 =?utf-8?B?WnJlY21WTlNqY2RCQ1Y3Z1g1N0thdjdpWXhlcEM1ekR6OHJ3azdTM0drOHN0?=
 =?utf-8?B?R29GZ3dKZ1YvWDRxeGdIWTM5RG5rL1B0RGRFUjZFR2JXWHpCVmZYeVc2K1h5?=
 =?utf-8?B?SVlFYUczYjlEYTQxcDRESDloSzEra1FiU1FGeDZBb2hnYzRTUi9nTTBjZW4z?=
 =?utf-8?Q?qyjP+Z7GlVPjZs564HGZWfXL4?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 357f2dbf-ded4-41b7-6d7f-08dd4c52b998
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5311.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Feb 2025 17:20:34.3608 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yrvnPouvJSHzedGhhMfF+pmHjrmx9C8kjngYRwnNxRY0lF6saCDc3KbQ3VVuFSzv
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7681
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



On 2024-12-19 23:33, Alex Hung wrote:
> Expose one 1D curve colorop with support for
> DRM_COLOROP_1D_CURVE_SRGB_EOTF and program HW to perform
> the sRGB transform when the colorop is not in bypass.
> 
> With this change the following IGT test passes:
> kms_colorop --run plane-XR30-XR30-srgb_eotf
> 
> The color pipeline now consists of a single colorop:
> 1. 1D curve colorop w/ sRGB EOTF
> 
> Signed-off-by: Alex Hung <alex.hung@amd.com>
> Co-developed-by: Harry Wentland <harry.wentland@amd.com>
> Signed-off-by: Harry Wentland <harry.wentland@amd.com>
> ---
> v7:
>   - Fix checkpatch warnings
>    - Change switch "{ }" position
>    - Delete double ";"
>    - Delete "{ }" for single-line if-statement
>    - Add a new line at EOF
>    - Change SPDX-License-Identifier: GPL-2.0+ from // to /* */
> 
> v6:
>   - cleanup if colorop alloc or init fails
> 
>   .../gpu/drm/amd/display/amdgpu_dm/Makefile    |  3 +-
>   .../amd/display/amdgpu_dm/amdgpu_dm_color.c   | 86 +++++++++++++++++++
>   .../amd/display/amdgpu_dm/amdgpu_dm_colorop.c | 70 +++++++++++++++
>   .../amd/display/amdgpu_dm/amdgpu_dm_colorop.h | 34 ++++++++
>   .../amd/display/amdgpu_dm/amdgpu_dm_plane.c   | 10 +++
>   5 files changed, 202 insertions(+), 1 deletion(-)
>   create mode 100644 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.c
>   create mode 100644 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.h
> 
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/Makefile b/drivers/gpu/drm/amd/display/amdgpu_dm/Makefile
> index ab2a97e354da..46158d67ab12 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/Makefile
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/Makefile
> @@ -38,7 +38,8 @@ AMDGPUDM = \
>   	amdgpu_dm_pp_smu.o \
>   	amdgpu_dm_psr.o \
>   	amdgpu_dm_replay.o \
> -	amdgpu_dm_wb.o
> +	amdgpu_dm_wb.o \
> +	amdgpu_dm_colorop.o
>   
>   ifdef CONFIG_DRM_AMD_DC_FP
>   AMDGPUDM += dc_fpu.o
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
> index ebabfe3a512f..566035af00cd 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
> @@ -668,6 +668,18 @@ amdgpu_tf_to_dc_tf(enum amdgpu_transfer_function tf)
>   	}
>   }
>   
> +static enum dc_transfer_func_predefined
> +amdgpu_colorop_tf_to_dc_tf(enum drm_colorop_curve_1d_type tf)
> +{
> +	switch (tf) {
> +	case DRM_COLOROP_1D_CURVE_SRGB_EOTF:
> +	case DRM_COLOROP_1D_CURVE_SRGB_INV_EOTF:
> +		return TRANSFER_FUNCTION_SRGB;
> +	default:
> +		return TRANSFER_FUNCTION_LINEAR;
> +	}
> +}
> +
>   static void __to_dc_lut3d_color(struct dc_rgb *rgb,
>   				const struct drm_color_lut lut,
>   				int bit_precision)
> @@ -1137,6 +1149,59 @@ __set_dm_plane_degamma(struct drm_plane_state *plane_state,
>   	return 0;
>   }
>   
> +static int
> +__set_colorop_in_tf_1d_curve(struct dc_plane_state *dc_plane_state,
> +		       struct drm_colorop_state *colorop_state)
> +{
> +	struct dc_transfer_func *tf = &dc_plane_state->in_transfer_func;
> +	struct drm_colorop *colorop = colorop_state->colorop;
> +	struct drm_device *drm = colorop->dev;
> +
> +	if (colorop->type != DRM_COLOROP_1D_CURVE &&
> +	    colorop_state->curve_1d_type != DRM_COLOROP_1D_CURVE_SRGB_EOTF)

Should it be || instead of &&? It sounds to me that this should error if either 
condition is the case.

It's not critical, since they look to be dropped as more subtypes are introduced 
in later patches. Just curious if the && was intentional.

- Leo

> +		return -EINVAL;
> +
> +	if (colorop_state->bypass) {
> +		tf->type = TF_TYPE_BYPASS;
> +		tf->tf = TRANSFER_FUNCTION_LINEAR;
> +		return 0;
> +	}
> +
> +	drm_dbg(drm, "Degamma colorop with ID: %d\n", colorop->base.id);
> +
> +	tf->type = TF_TYPE_PREDEFINED;
> +	tf->tf = amdgpu_colorop_tf_to_dc_tf(colorop_state->curve_1d_type);
> +
> +	return 0;
> +}
> +
> +static int
> +__set_dm_plane_colorop_degamma(struct drm_plane_state *plane_state,
> +			       struct dc_plane_state *dc_plane_state,
> +			       struct drm_colorop *colorop)
> +{
> +	struct drm_colorop *old_colorop;
> +	struct drm_colorop_state *colorop_state = NULL, *new_colorop_state;
> +	struct drm_atomic_state *state = plane_state->state;
> +	int i = 0;
> +
> +	old_colorop = colorop;
> +
> +	/* 1st op: 1d curve - degamma */
> +	for_each_new_colorop_in_state(state, colorop, new_colorop_state, i) {
> +		if (new_colorop_state->colorop == old_colorop &&
> +		    new_colorop_state->curve_1d_type == DRM_COLOROP_1D_CURVE_SRGB_EOTF) {
> +			colorop_state = new_colorop_state;
> +			break;
> +		}
> +	}
> +
> +	if (!colorop_state)
> +		return -EINVAL;
> +
> +	return __set_colorop_in_tf_1d_curve(dc_plane_state, colorop_state);
> +}
> +
>   static int
>   amdgpu_dm_plane_set_color_properties(struct drm_plane_state *plane_state,
>   				     struct dc_plane_state *dc_plane_state)
> @@ -1187,6 +1252,24 @@ amdgpu_dm_plane_set_color_properties(struct drm_plane_state *plane_state,
>   	return 0;
>   }
>   
> +static int
> +amdgpu_dm_plane_set_colorop_properties(struct drm_plane_state *plane_state,
> +		       struct dc_plane_state *dc_plane_state)
> +{
> +	struct drm_colorop *colorop = plane_state->color_pipeline;
> +	int ret;
> +
> +	/* 1D Curve - DEGAM TF */
> +	if (!colorop)
> +		return -EINVAL;
> +
> +	ret = __set_dm_plane_colorop_degamma(plane_state, dc_plane_state, colorop);
> +	if (ret)
> +		return ret;
> +
> +	return 0;
> +}
> +
>   /**
>    * amdgpu_dm_update_plane_color_mgmt: Maps DRM color management to DC plane.
>    * @crtc: amdgpu_dm crtc state
> @@ -1283,5 +1366,8 @@ int amdgpu_dm_update_plane_color_mgmt(struct dm_crtc_state *crtc,
>   		dc_plane_state->input_csc_color_matrix.enable_adjustment = false;
>   	}
>   
> +	if (!amdgpu_dm_plane_set_colorop_properties(plane_state, dc_plane_state))
> +		return 0;
> +
>   	return amdgpu_dm_plane_set_color_properties(plane_state, dc_plane_state);
>   }
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.c
> new file mode 100644
> index 000000000000..3be0cb19ebc7
> --- /dev/null
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.c
> @@ -0,0 +1,70 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright 2023 Advanced Micro Devices, Inc.
> + *
> + * Permission is hereby granted, free of charge, to any person obtaining a
> + * copy of this software and associated documentation files (the "Software"),
> + * to deal in the Software without restriction, including without limitation
> + * the rights to use, copy, modify, merge, publish, distribute, sublicense,
> + * and/or sell copies of the Software, and to permit persons to whom the
> + * Software is furnished to do so, subject to the following conditions:
> + *
> + * The above copyright notice and this permission notice shall be included in
> + * all copies or substantial portions of the Software.
> + *
> + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
> + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
> + * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
> + * THE COPYRIGHT HOLDER(S) OR AUTHOR(S) BE LIABLE FOR ANY CLAIM, DAMAGES OR
> + * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
> + * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
> + * OTHER DEALINGS IN THE SOFTWARE.
> + *
> + * Authors: AMD
> + *
> + */
> +
> +#include <drm/drm_print.h>
> +#include <drm/drm_plane.h>
> +#include <drm/drm_property.h>
> +#include <drm/drm_colorop.h>
> +
> +#include "amdgpu_dm_colorop.h"
> +
> +const u64 amdgpu_dm_supported_degam_tfs =
> +	BIT(DRM_COLOROP_1D_CURVE_SRGB_EOTF);
> +
> +#define MAX_COLOR_PIPELINE_OPS 10
> +
> +int amdgpu_dm_initialize_default_pipeline(struct drm_plane *plane, struct drm_prop_enum_list *list)
> +{
> +	struct drm_colorop *ops[MAX_COLOR_PIPELINE_OPS];
> +	struct drm_device *dev = plane->dev;
> +	int ret;
> +	int i = 0;
> +
> +	memset(ops, 0, sizeof(ops));
> +
> +	/* 1D curve - DEGAM TF */
> +	ops[i] = kzalloc(sizeof(struct drm_colorop), GFP_KERNEL);
> +	if (!ops[i]) {
> +		DRM_ERROR("KMS: Failed to allocate colorop\n");
> +		ret = -ENOMEM;
> +		goto cleanup;
> +	}
> +
> +	ret = drm_colorop_curve_1d_init(dev, ops[i], plane, amdgpu_dm_supported_degam_tfs);
> +	if (ret)
> +		goto cleanup;
> +
> +	list->type = ops[i]->base.id;
> +	list->name = kasprintf(GFP_KERNEL, "Color Pipeline %d", ops[i]->base.id);
> +
> +	return 0;
> +
> +cleanup:
> +	for (; i >= 0; i--)
> +		kfree(ops[i]);
> +
> +	return ret;
> +}
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.h b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.h
> new file mode 100644
> index 000000000000..3324e2a66079
> --- /dev/null
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.h
> @@ -0,0 +1,34 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright 2023 Advanced Micro Devices, Inc.
> + *
> + * Permission is hereby granted, free of charge, to any person obtaining a
> + * copy of this software and associated documentation files (the "Software"),
> + * to deal in the Software without restriction, including without limitation
> + * the rights to use, copy, modify, merge, publish, distribute, sublicense,
> + * and/or sell copies of the Software, and to permit persons to whom the
> + * Software is furnished to do so, subject to the following conditions:
> + *
> + * The above copyright notice and this permission notice shall be included in
> + * all copies or substantial portions of the Software.
> + *
> + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
> + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
> + * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
> + * THE COPYRIGHT HOLDER(S) OR AUTHOR(S) BE LIABLE FOR ANY CLAIM, DAMAGES OR
> + * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
> + * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
> + * OTHER DEALINGS IN THE SOFTWARE.
> + *
> + * Authors: AMD
> + *
> + */
> +
> +#ifndef __AMDGPU_DM_COLOROP_H__
> +#define __AMDGPU_DM_COLOROP_H__
> +
> +extern const u64 amdgpu_dm_supported_degam_tfs;
> +
> +int amdgpu_dm_initialize_default_pipeline(struct drm_plane *plane, struct drm_prop_enum_list *list);
> +
> +#endif /* __AMDGPU_DM_COLOROP_H__*/
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
> index 1bfb9f340c24..78c749ce1bd0 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
> @@ -36,6 +36,7 @@
>   #include "amdgpu_display.h"
>   #include "amdgpu_dm_trace.h"
>   #include "amdgpu_dm_plane.h"
> +#include "amdgpu_dm_colorop.h"
>   #include "gc/gc_11_0_0_offset.h"
>   #include "gc/gc_11_0_0_sh_mask.h"
>   
> @@ -1763,10 +1764,19 @@ dm_plane_init_colorops(struct drm_plane *plane)
>   {
>   	struct drm_prop_enum_list pipelines[MAX_COLOR_PIPELINES];
>   	int len = 0;
> +	int ret;
>   
>   	if (plane->type == DRM_PLANE_TYPE_CURSOR)
>   		return 0;
>   
> +	/* initialize default pipeline */
> +	ret = amdgpu_dm_initialize_default_pipeline(plane, &(pipelines[len]));
> +	if (ret) {
> +		DRM_ERROR("Failed to create color pipeline for plane %d: %d\n", plane->base.id, ret);
> +		return ret;
> +	}
> +	len++;
> +
>   	/* Create COLOR_PIPELINE property and attach */
>   	drm_plane_create_color_pipeline_property(plane, pipelines, len);
>   

