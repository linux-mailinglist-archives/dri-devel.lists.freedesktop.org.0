Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 73B67AF732E
	for <lists+dri-devel@lfdr.de>; Thu,  3 Jul 2025 14:03:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD04510E816;
	Thu,  3 Jul 2025 12:03:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="twyM6xwy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2043.outbound.protection.outlook.com [40.107.244.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 72D2A10E816
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Jul 2025 12:03:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Cy2CQcZYOUNdWi3XbtPvgiEfu2sQBkqmm1HJbE0UnS31I2iYJOtcrLP+ALhl8ttr3/kftS2vlngXYaFnDnoCfnXWrRNZiDLz+alwLcbqWPbjH7+28TtIp6br/J+IVhULsP5hRoevrOsCXP+s/0lzDZPr9GWxncIzfxSfMqp/JNh27HrOstJJoY/jO8orpnvJm9yJbHFqZY/ZH5lC1Flr+ShBgeWScZ4jhfSdI4RsV2Qcp3bE6QhjlsC/gcDbSpCw/g7PyZbFWar4V9igm1ksFVfRhyEjwCik879C6cxPJZTItVjhEwNuERgTwG9JodzjYM2DUZWaMJdbpvVhCfOb8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BRS6B+H4zWzClHQwT+ycd8KRVeXSguGbZ+anRt3xcn8=;
 b=D9mXkCR/ekP/5xIDxYkBwWn6Hf9XgVEH31zhOA8e4ZpnDCfwMubiu74on9SFZzCyXsbMQCrCf3h5gcFIorngI1dgbq0cS1t71uvyzBLLIe0r7s/W0kV+kDqWmsILkl/YVZDDVXCw/L4KBYKzLIp0N2JZarhOemCcHp7gFQPdgSzJIbHcqPYrtO16bzLhYdaz1VvLCPb4SL5i9R0d+Tk0t2HfT1Uo47YbJ+GW92ZQ1MrkVNOeuGV9Tuonbv83D+u6hjVbu+isOvGuyMtgHb/LOo/uGDwagQl2rldp8he7e9Qo+OyyaluyE3/zMDve2Th/69kGQpebdPfFlfsAEofRCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BRS6B+H4zWzClHQwT+ycd8KRVeXSguGbZ+anRt3xcn8=;
 b=twyM6xwyvRJ+foG+O7IK4pYIHVdJPUdkRZEKTygN8ifoUtGx3D+/9ftADlXyar2p56vLkKW1UjOttX6ZYcZoE6/ER1U1zyT0ivvQoEyehLLLNH2rmXWNBJdIYXQjDx62JCNZkwYHY1tHAguFfoZ/oUnhfDzL0cmXKy95xRA7LMv0KkMg2rG3Vy3xAPv1IiIKu30Mzh2BpuNNQgT6cm1uwedQDC3IN/TvpiQck8fI0T7S6LVZgu3JzVFvBTYhbMBUgpdX1G2Wa5J0ClEmfdBVb/MP7mXeNo2m/TiveJDOaqnerwTXLqTV2SFrizGUspYyrdX/Yy40lIHOinznXOtCEg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SJ2PR12MB8784.namprd12.prod.outlook.com (2603:10b6:a03:4d0::11)
 by DS0PR12MB6415.namprd12.prod.outlook.com (2603:10b6:8:cc::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.22; Thu, 3 Jul
 2025 12:03:45 +0000
Received: from SJ2PR12MB8784.namprd12.prod.outlook.com
 ([fe80::1660:3173:eef6:6cd9]) by SJ2PR12MB8784.namprd12.prod.outlook.com
 ([fe80::1660:3173:eef6:6cd9%5]) with mapi id 15.20.8901.021; Thu, 3 Jul 2025
 12:03:45 +0000
Message-ID: <3fa07be6-abdb-4737-ae4b-5dc708c83377@nvidia.com>
Date: Thu, 3 Jul 2025 13:03:40 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/fbdev-client: Skip DRM clients if modesetting is
 absent
To: Thierry Reding <thierry.reding@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org
References: <20250613122838.2082334-1-thierry.reding@gmail.com>
Content-Language: en-US
From: Jon Hunter <jonathanh@nvidia.com>
In-Reply-To: <20250613122838.2082334-1-thierry.reding@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO2P123CA0001.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:a6::13) To SJ2PR12MB8784.namprd12.prod.outlook.com
 (2603:10b6:a03:4d0::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR12MB8784:EE_|DS0PR12MB6415:EE_
X-MS-Office365-Filtering-Correlation-Id: c22cbc91-e208-4008-35da-08ddba29a8dd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SHBnZ3FVTWovcy95SFNpTTBhOThmVnFsa1NORDdwcHF6cldESDRPUUFNVm5S?=
 =?utf-8?B?YnBjNkxJMTRna0M4aUFHditPWEF4YkJoekc4MTBaaXA0TzI5OTF2VVNHUG9u?=
 =?utf-8?B?TFdpRlRJUit5N3daVk0zVXlITmNxY1BxQ3V1SGU1bWlJN25kcUNaeW5Sb0JM?=
 =?utf-8?B?Q3lHd3hrKzdYUXR4Rm9KcFp0dWpzT1VuT0FySEx2bEJ2NFlqWFA4SWR2YlZE?=
 =?utf-8?B?elhaWTMybFVQSlFjK0srclF5MEhacTljaDZGL29zSlRqTWhCSlpHYm13eWxQ?=
 =?utf-8?B?cWxXTE55Q2dqNFd0aVJCZXdZcnJ4cHhSZGQyNzJWa2pkTVIwYm5BVXRJZG45?=
 =?utf-8?B?NndCWW5qQWE0NWtrRWpZSzNPNFZJRnE3U0haRTFaUC9zOCtvVyswUk4wZGMv?=
 =?utf-8?B?cDVxSkl6clcxS0pDcUI0aW1DNmZtUldEMzVCZmhuMjFPeE5qL21PbFZrY3Vx?=
 =?utf-8?B?NWJDRkRKNmVHS1NabEtFQzQwcWo1aTB4d2p4SmZLVTg4RzRveXBSbVF4YlVE?=
 =?utf-8?B?R0luUGErRHFPd3RyTTNUSUUxY0xsUy9oY2l2THJCcVFEUWFSelFEcE13SDVm?=
 =?utf-8?B?dDFsUkZERk1hUkFXVU9ZSFQ2VkQ2MkdHYmZPL2FkSnRIUnVEemgxZVdSZXRC?=
 =?utf-8?B?RDhkUG55R0E4Y0tIR1M2STNXVzFwUzZSKzFvZ3hjOHRka3V4bGNlc002QlIw?=
 =?utf-8?B?ODJEWHMyb29RLys0ZHFaUGFaSTJja1QzQ3JqQzAvM3BpY0JNQzAyamVzbzVC?=
 =?utf-8?B?WXB2Z3pVMnhsU3lQVlJmSVRDZVJPUUsxQUxTcE5RdGk2K25zK2h2QkhHZDNv?=
 =?utf-8?B?anBmTTExYmplaTVYYU1SaXlqM0RqYmpqdUNmZEZaektSZFBjZStQQXBHL3VB?=
 =?utf-8?B?WVlJN2Q5TDFjQXlmcFIzamZmT1ZIeURHS2dDcEhiNFhzWWtVeTJDeENlZGdk?=
 =?utf-8?B?Mk8vUXl5WElVNXhlczBKT0szVHhFbUNLNUNiVWZlVmRjRnJ0RlFESGdOOXhw?=
 =?utf-8?B?dlNwdXRIb2NUTTFFR293WVc2MEt1NG1jTlI4a0NONDZHTGRsSmJGNGJkRlB6?=
 =?utf-8?B?MlRPQmJzbG9INXlpN3YyVUtsTzMyWTBqdWNyS09iZm5rOVFtTktzbHBQSWo2?=
 =?utf-8?B?Q0dmTXp3SjQ4OWp4TkQvc283SWFtZThUb0VuOHN3K2hxaktwUEJpYXJDK2Iy?=
 =?utf-8?B?d1RMNWFKUnkxU081K0p6QjFnOGtnNDZ5TVFDd0J6ZndUQUkwS2N2cWx5SndL?=
 =?utf-8?B?WFZqdWxXaDg3WUhwaHhvRlBtdE9qTENtc3ZFWWNBQzF5U1lJekFKOXliNDFW?=
 =?utf-8?B?MUJicjBXQXJpL08wckg1S2lJaEFBUFpnVm16cUhJbDMxWG92Zk5QbVljSlpq?=
 =?utf-8?B?eVlPVWc1aC80bVpuTjR3R3BGTzNjenlIUXR2Y2tJenRlaEVSYzBsTElkcnhi?=
 =?utf-8?B?OHJsdVIvVjZZS0RGbGJyK0Y3RWZtUGF0Y0tWTXlLRU5LTTYvZzRqRnhlTnBH?=
 =?utf-8?B?SXJFSWhKL3dHZkJLRzc4UDFoRVhSd0JYLyswSGRKNi9kLytHSGRGMGNpWWcz?=
 =?utf-8?B?U3pWK08ycGZ4aXhWY3RhamUrdWJGWUhZM2hWbDBwL001aE9aRnB1cHE1Q3pl?=
 =?utf-8?B?RGZSS0VqYk5BeFhtMTdKak92elB1V3I4ZlVhSEtjMEFFK0hpeUdoMnNTQ1Fq?=
 =?utf-8?B?K3U0WjJwYWM3NzZwaUpSbXU4VEFIczZuamh1VUNaTFJ0TTVhN3VzVTNubmtp?=
 =?utf-8?B?Q1NtWHhkdG5iUWl3SUhLNlJjczhzaGhQYVlxUXltVHMySmNSY1l6dWFxVkV2?=
 =?utf-8?B?NkdrNG5KbFBQaDlEd2NWTlVraHo1QWdDbElNemJVR3NEOHVEa0pDK0hyMlBJ?=
 =?utf-8?B?dHBzUmdEMGlCVXBQNUdmTUdCT24xZklIMTM1eTFTSjhpS2l0UTc0d0hDdEx5?=
 =?utf-8?Q?Zsg4hL6UugA=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ2PR12MB8784.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?T29ySUhpdGVOcWxnZ3ZTOGZ1S3ZRRlhrcXV4cGZudUJtcy9FNldRWHNIbStr?=
 =?utf-8?B?VGJYbDlibGdqWUlCR0hsSGhQVlNMMWVqUlhkMC9HYnFLOEZ2bTV3UnBHK0pL?=
 =?utf-8?B?Sk90NzNuVDhpMkRURkxqY2wvVlpwVk1GRlRsVlFSTlI3K0FJM3llRGxVUUI2?=
 =?utf-8?B?S3A4TzllaGNLOVFyaE9UYXloRFVyYmZjbmo0S1hMb0VhMGRDcnpNMzgycmdU?=
 =?utf-8?B?d2k3NFoxMHNOTEIvNG5yVjVSSlB2RGU1VUFiRFRwZUtkNXNOeEJ6UjlDZGMv?=
 =?utf-8?B?R2crakNiWE9LSTdHejRVL3VrbDNZSkV1WVZnaVJValpUODhoWE1qUVNLdnBi?=
 =?utf-8?B?VXk3ZG1jSkozN2I2K0NhVWpsSGRtdU11UFVsWHFWcWd3aVBOL1c0SXpHeG96?=
 =?utf-8?B?eHFMUUVaNlVxZDR6MmtGeVI5TXhiTXZlenB2d01GUlcvR0dUUGNQc21NSllZ?=
 =?utf-8?B?MzlvRUVqaXd5QytncUpwZHVGajJ0WjRqUStML2Z4Tlg1elFhbkx4UG5ZbUdX?=
 =?utf-8?B?ZFo2QXcrNFlwN2luWnV5OXdRc0tJMFlsUkp1SElDYWpnT2lxTEpKMm5NektL?=
 =?utf-8?B?TlpGd3YyQWhEUXpWY2lDd2pzdy9nWEVyMlJ1SGVnZWQ4YWtVaWh5endXOThU?=
 =?utf-8?B?eGIwY3cyYkFLQlBMb2ZmRGpSMEpsR2UvOGdTbVBGeEZjRCs2YkxaUVJicUFk?=
 =?utf-8?B?L2JKdlNQNFQ1c1RSd0xhMWVkZ2F4T00vME8vbkd1VGk0NTZmNVJNbzVUd3Ji?=
 =?utf-8?B?NFgxUkRjUlRac2hWWUd0UVJ0TDhoWTNOZTV3aUNUa3VqUjFjcWptUURYUVZq?=
 =?utf-8?B?cFF6TGl6VUZRVkFFRXpsbHdMcnhnV0RTK0x0VFhSU3ZneUttaFgrYms4M2ZE?=
 =?utf-8?B?YVMxWmkrdy8rWXFJR0lIc3ROSEVhOXc0TnYwM3V5Z1M5ZW1VamUzZmc1Y1Bk?=
 =?utf-8?B?NjE5YThlS0N4cEs5OFBza2t1MVl4RXlJT1laZzNUd2w0NmNtWnF2NmJMTmp5?=
 =?utf-8?B?V2R4am9yQk1DM1BSSEZ2MEtKWFNuVzZ4c3dMVWc0aUpIMHFzeEJ2N0dKNVVl?=
 =?utf-8?B?dTVyalNkWXJlZ0VjMS91WHlWN0hCUld5LzMvZ24yc1hNMzUvbVFFZU0rTlJN?=
 =?utf-8?B?MkRvQWJzT3BWaGVVREpFeUJuU3NFRmhqWncydTlUSk9pak1nQU9saksvOE1I?=
 =?utf-8?B?VzJGUTNLRkM1OEdITG4zTzg0T1VQTHJId1JheldtMTNiNkdVMU9CdkFLNE9J?=
 =?utf-8?B?WEFEc2hmcFNRb09zb3dmeXJSbEo5VU9kcU9jTnd1UHNmV3ZPYmpOZ0tiYmZq?=
 =?utf-8?B?WW80VDVwNlpnc3lEaGI1eXFTSzduaE9EZ1YyZXFQUDQ4WFN1akxvdTFRSnNO?=
 =?utf-8?B?TjlpRXcrR1U3bTVNOVhYNmlHKy9IM094QTYySDRyLzdPUldZYTlWZVUvRHBr?=
 =?utf-8?B?QlhzR1NiRFVDMm8rTGRiUnVvWGN4OWRPeGR2QnVlam9ybFdQeFdrV25nTm1t?=
 =?utf-8?B?QWdmMFl5TjZEZm51bWpOeFhyZU0wQ3FoVktyNDhoN3l2WFdtNG5DbXVac09D?=
 =?utf-8?B?Y2gzT2xyNmF4UFRjK2JXNjJnU3A2NnFBbEtnakNic09qUk5FdEFnVlZ2clBl?=
 =?utf-8?B?U2V0SjJwUCtuNm14Rk55VzBmZUw5TXkvak83bDZ0NnhzZDMyWWJ1dU5sbVY2?=
 =?utf-8?B?Qjh0c1ZrcmRleHRTYy9JeFBtSjY2TURPYTNNMjhneUJGUjU1YjFFU3JpdnYz?=
 =?utf-8?B?TDdDeHh4eU5CalhtOTJFOC8rQ3ppa3NqRk1LS2pkdDM0ZWx4eFFiVEZxTmVY?=
 =?utf-8?B?cFozbFNjM0RsZ0pWWU96R2NoVFZWMWt1TWluLzRIajJsekQzM0t5eVVaTVFr?=
 =?utf-8?B?ZnJlWmlkTit2UGpKWUhUdms2Z0RndC9udUkyWXhnTEJVNk5zMm5QUllWZTFi?=
 =?utf-8?B?aGc1c2pMSjFCMGRISlFCQ0JxM21XU3BscGlEK3ZjaUthbmZxU2xvaExubnBZ?=
 =?utf-8?B?bkd0aHVpV1BvNGQwVFNkYkVobC9OQWJ0ZTBwSm5FWE5nZGRMbUpTeDBvdUE5?=
 =?utf-8?B?dnNUQm1GZmR6azg1ZjFwZGdENVZQRXQyeEMwcnF3REdlZVA2dk51aS9ha1Bn?=
 =?utf-8?Q?cp+7o/zL1rppbvECOyYB/upPL?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c22cbc91-e208-4008-35da-08ddba29a8dd
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR12MB8784.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jul 2025 12:03:44.9367 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: E5veCvHwxgvBP1mfZtnVsI2SEcnBXlJcPrCNzV7oAjzfR1k8Xh3AjKlpf1j2Vj8jemONoraJ6Uhvi41K3dmrJA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB6415
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


On 13/06/2025 13:28, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
> 
> Recent generations of Tegra have moved the display components outside of
> host1x, leading to a device that has no CRTCs attached and hence doesn't
> support any of the modesetting functionality. When this is detected, the
> driver clears the DRIVER_MODESET and DRIVER_ATOMIC flags for the device.
> 
> Unfortunately, this causes the following errors during boot:
> 
>      [      15.418958] ERR KERN drm drm: [drm] *ERROR* Failed to register client: -95
>      [      15.425311] WARNING KERN drm drm: [drm] Failed to set up DRM client; error -95
> 
> These originate from the fbdev client checking for the presence of the
> DRIVER_MODESET flag and returning -EOPNOTSUPP. However, if a driver does
> not support DRIVER_MODESET this is entirely expected and the error isn't
> helpful.
> 
> Prevent this misleading error message by setting up the DRM clients only
> if modesetting is enabled.
> 
> Changes in v2:
> - use DRIVER_MODESET check to avoid registering any clients
> 
> Reported-by: Jonathan Hunter <jonathanh@nvidia.com>
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
>   drivers/gpu/drm/clients/drm_client_setup.c | 5 +++++
>   1 file changed, 5 insertions(+)
> 
> diff --git a/drivers/gpu/drm/clients/drm_client_setup.c b/drivers/gpu/drm/clients/drm_client_setup.c
> index e17265039ca8..e460ad354de2 100644
> --- a/drivers/gpu/drm/clients/drm_client_setup.c
> +++ b/drivers/gpu/drm/clients/drm_client_setup.c
> @@ -2,6 +2,7 @@
>   
>   #include <drm/clients/drm_client_setup.h>
>   #include <drm/drm_device.h>
> +#include <drm/drm_drv.h>
>   #include <drm/drm_fourcc.h>
>   #include <drm/drm_print.h>
>   
> @@ -31,6 +32,10 @@ MODULE_PARM_DESC(active,
>    */
>   void drm_client_setup(struct drm_device *dev, const struct drm_format_info *format)
>   {
> +	if (!drm_core_check_feature(dev, DRIVER_MODESET)) {
> +		drm_dbg(dev, "driver does not support mode-setting, skipping DRM clients\n");
> +		return;
> +	}
>   
>   #ifdef CONFIG_DRM_FBDEV_EMULATION
>   	if (!strcmp(drm_client_default, "fbdev")) {


Acked-by: Jon Hunter <jonathanh@nvidia.com>
Tested-by: Jon Hunter <jonathanh@nvidia.com>

Can we get this into -next?

Thanks!
Jon

-- 
nvpublic

