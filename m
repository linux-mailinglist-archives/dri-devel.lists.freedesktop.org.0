Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E8747A92EEE
	for <lists+dri-devel@lfdr.de>; Fri, 18 Apr 2025 02:44:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA94F10E3E3;
	Fri, 18 Apr 2025 00:44:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2066.outbound.protection.outlook.com [40.107.220.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F7DE10E1E8;
 Fri, 18 Apr 2025 00:44:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XPkx65oULViMU0EAvLWNQ0CdSXNKhzjBpls2W4qtmUQapp2wCHEtYd8Q6sKO/BRS/MLh1KTnPdJPA9t0kfqbuyTDFhZY/9XqZVZ+CtQwtxpq2J86U55eZR7VFM3ZiTYRN6gcIL44rehtWk3ynTD66El6+l76DpczLigX2pTE/7+JqPvR1hM1yUbYqe3tzQtxF4xafWYg2vsVBbM4MSOtNPg7UcDjoc8HbOOsxZGz5CicsJkCc87mdL68T/eCP4qJq5L/JCCSwITG0ry2AgXP5h22/gQpMl3i8SGox1VxkzKbimBdgjcPBUq8e0HjQRqkWb0UWV7uwvzq1rd7OLu7RA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Zj7SA8XTfyliCMtLnN7oHHCsLb2xUOfnYdZUGceuJjE=;
 b=xGGTTRna/oW7p/mYfVo2ikT1P1qXyS3Ek2rng+gp71UpNPcK6YDlNEGe3rc2gZ2Lav0Y/pImYunuMsEBv/IjZ5TnB8gQQ7rTcKQFLM0Xkk/4lBzayHo9i8OqwEStEVfaJhLHiypUovbdPPk8ULLeZWHarA990Sg6pd2rrOh2Xz3jGP2PuM48tXBdEilr43wGgEMPX9wOrRlN7fULuANUNut7Yi7hKWRcIQUMcdTlEZHjBGA4gHAn+s4gV/mJM2wV2TGN8mySz/3OWDj32Q9pRBNNewIVggDURjlR7M4TvluAEEDSaM2QZF7RA0O03kOb4+T2mrb/53qJTKUYc0gt9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Zj7SA8XTfyliCMtLnN7oHHCsLb2xUOfnYdZUGceuJjE=;
 b=WaScAnM5Lp809VfsUErHsStuS10k2kxSvuOyRUy6Z/ykK4hXrI11ha/4PXsB11dysDH/iRkkYxZqMUaxczQZTAoei6EV4QHPg/mp6mBFiRc0FCpN6+XYTzsLVihHmn8wFE6mQe03y4iLyldtADGa5X+fiXneoZUZk+IJ0l61Z1c=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB8476.namprd12.prod.outlook.com (2603:10b6:8:17e::15)
 by IA0PR12MB8694.namprd12.prod.outlook.com (2603:10b6:208:488::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.22; Fri, 18 Apr
 2025 00:44:30 +0000
Received: from DM4PR12MB8476.namprd12.prod.outlook.com
 ([fe80::2ed6:28e6:241e:7fc1]) by DM4PR12MB8476.namprd12.prod.outlook.com
 ([fe80::2ed6:28e6:241e:7fc1%5]) with mapi id 15.20.8655.022; Fri, 18 Apr 2025
 00:44:30 +0000
Message-ID: <9205d9b5-498d-4089-84f5-2d561bee48c1@amd.com>
Date: Thu, 17 Apr 2025 18:44:25 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/amd/display: do not copy invalid CRTC timing info
From: Alex Hung <alex.hung@amd.com>
To: Gergo Koteles <soyer@irl.hu>, Harry Wentland <harry.wentland@amd.com>,
 Leo Li <sunpeng.li@amd.com>, Rodrigo Siqueira <siqueira@igalia.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Mario Limonciello <mario.limonciello@amd.com>,
 Tom Chung <chiahsuan.chung@amd.com>, Sunil Khatri <sunil.khatri@amd.com>,
 Aurabindo Pillai <aurabindo.pillai@amd.com>, Hersen Wu
 <hersenxs.wu@amd.com>, Melissa Wen <mwen@igalia.com>,
 Maxime Ripard <mripard@kernel.org>, Dmitry Baryshkov <lumag@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, regressions@lists.linux.dev
References: <24439c13a014e1cd200785db6f3dcf08f4773eb3.1743612701.git.soyer@irl.hu>
 <11d589f0-3671-417f-8911-7bfb3be88802@amd.com>
Content-Language: en-US
In-Reply-To: <11d589f0-3671-417f-8911-7bfb3be88802@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YQZPR01CA0131.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:87::19) To DM4PR12MB8476.namprd12.prod.outlook.com
 (2603:10b6:8:17e::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB8476:EE_|IA0PR12MB8694:EE_
X-MS-Office365-Filtering-Correlation-Id: 6f9f2ad7-3d33-4bd6-28ba-08dd7e122dfe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|7416014|921020|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MHRYL3lWMXBvUGRmRHBrT2FjTms0eVE3eU5rTWZhYWFERzF6T1J4cHFjWmFp?=
 =?utf-8?B?NmFjWjRJanNIandON3ZFSTl2dGxzd2FCZzhrSS9rQVVsdHJvTCtNdkN4Nlo1?=
 =?utf-8?B?azBMYTMwdUhPdTdSbmR4c3RBMXhzQ2VySnhyZHNRWjZIZElsbE93blhkNk05?=
 =?utf-8?B?RTF2VTEyeEpxaXRSSjdUVjJocFZ4UUk4NWVwdGo5N1krR29FZ21YQ3ltc0hL?=
 =?utf-8?B?QmRlSUVLeHRzREx0QnBiMHdCeTdsOUpWb2FuNkJiQ0ZLNnpHM0paUXRtUzlq?=
 =?utf-8?B?aFdhTzFyTnk3a2RSN2hmQWg4enJjd3pSbjFTalN4T1pJNkVRbG9RbkxscDJp?=
 =?utf-8?B?dzc3bFdHcWdKNkpiRFU0ZE5BcVFkZE1xdm1tY0NPck5KT1RlZUF4eGxsUStk?=
 =?utf-8?B?L0N6RmFpSy85L3NrYUZhL1NBQ0h6d1JQRHFPbWdiVSt2U3phNkE3VjBkUkN6?=
 =?utf-8?B?SWxhelh6RjNYMTJkZStXVndSbC9oSCs5clZwWThvVkFDQ0ppZE9oWG9EZEp3?=
 =?utf-8?B?K3l2b3IxaXFiUTNBaW0yR0x3REhtMTRmbE8vUFdoTnRja29zVWp6dDdqZ09z?=
 =?utf-8?B?cDM4VWNadThRK0cwVGQ1RjNYWE0yclZxKzZ0Y2p6U3BIWThFVXVYWmtBMUJR?=
 =?utf-8?B?TWxGdDM4STB0ZEFlVlFNY1BYakIzbjlpMjJwZ3RKdUdHZUo0WkZIdWdRRzh2?=
 =?utf-8?B?R1ErUjZ1MFhiSC9VSytjZlZvQlhlNVp1NUlQYnRiL0dRR1NFZVNET3JQNk1O?=
 =?utf-8?B?c24vOUxEaCs3ZW9iVnY1cForSW1GN1NCY1IzSGJHaVMrQyt4TlFIQVlMOUZQ?=
 =?utf-8?B?YkZaMmdxL0Q4UFhqZ2dlUU9qd3BZaWxoQXVkWS9HSGR1VzNqVFA3NkJvZHBx?=
 =?utf-8?B?UllJdDJ4dlovSW5kTENNV2s3aWJyUGxyUkcvSE4yVnlwSzJ1MkJVcUxHK3lr?=
 =?utf-8?B?WkxQV01yT3kyakxGMFdyUzRZMlpQOUloOE1QUHROSkFFN1E5azlobzhFRWFs?=
 =?utf-8?B?Y0ZhQ3ZLdXZVdkZGckR4Si9aV2dJVFQ1bGpBVTZLdGg2ZTdLZll6aWI2NWhH?=
 =?utf-8?B?a0ZhM1RIdVRjNXo3WTBJMnhkMDRLc3BONUNIbk9QK2RVRHplTzd0cjlGcm9v?=
 =?utf-8?B?ZnBYaElOdWJiKytaU3dtcng3S0w4bEZrVTJialdHa2YrVmh1VEx1Wkc2Qjdk?=
 =?utf-8?B?ZVJPZ2tRVXd3S25naG1vSTVhc1NwQ2xCQ3FKbVJRNFplcHF6N0hNQzRGWXBB?=
 =?utf-8?B?SUZXS0NxbmM4eEY0ZnRmcDdtdDlSKy9wSnRIQjdxZ2p5VmVkQll3WTB2d0RJ?=
 =?utf-8?B?ZW45NUZ5RU55SXJsZFhkOUptVXR5UEtWcGUzdHEvOGswa0psaHFrbkhGN0d5?=
 =?utf-8?B?b3hLeGo3NjZJUC93VFpGWkhnMmE5RHVtMExObXNiNUxWUDF5TWJyZjVJbjVH?=
 =?utf-8?B?ODk4NFRCaG8yRUVVcS9TMlFNS2hQWTZQNTRoTlhmSGYwYndEaFRjUU9LOSs2?=
 =?utf-8?B?RUFuZDByQ0p5VjhqN3ZnRXg4RFRGWGhKYzBFeXNqc1FQVExjaGh3NnZOazNk?=
 =?utf-8?B?eW1QV3lKRzRjaytaQnRKUStSTG5uZFd4NnhLL2dPYXh5cUpNeXA3VHN5UjFx?=
 =?utf-8?B?MHE4ZEpvTXd2KzdzR2Z4S2JEMkpsbUVwQWZBQWJ4dm5Ld3N1TW5tZjF0bGJH?=
 =?utf-8?B?bVJPWDdVMFhNK0ZRS213Um9oN09LV2NXeWI4Njd1OE91L2djakpveElkWlhz?=
 =?utf-8?B?dE1EeUJ6K0V2NU1MNlVxYUNHUkZvMGlTcE1vZU45WXQ0U2owNllDUHdoODEy?=
 =?utf-8?B?WnhycEtMWE12bTZEcVJ6Vm1TSjN6SHB0ZVRNbEtLVU04OHJOTGo5WXhqUXVj?=
 =?utf-8?B?VFZXSnZhdDd0L2sxT0VwTWpGamdDS2pPNlBWSkpvZzRTa2c9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB8476.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7416014)(921020)(7053199007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NU1uNUZCY29MVWVwVVhzZ01WbzkrTTlibEgrVWQyOUs2bzV6ZE0xbFdrTFQr?=
 =?utf-8?B?UXo3MS9UdEZ3WC92YnpmMnlMdlZhZlMyajUyL0NHR0lNM0E0SmlaQlVQWENT?=
 =?utf-8?B?ZVpqQURwOWxYQW5YL3l6VllkNmxpVEgySlIwS21HNnRqYSs4eUxwc3dVUnEz?=
 =?utf-8?B?MDBlKzFSOURmR3VaSFdsOWRxU3ArOHB2dmc1T3NYU1JzRExyNUJLMDR0OGhM?=
 =?utf-8?B?UlpNTHVsNjlzQXpUTkFGWm52V1NjK3gyenc2bFQvS2VEWDNYR29zNlJFOTEr?=
 =?utf-8?B?ZGQydXBLclo3cCt3L0ZBQnRmdnFSRDNaVktTYXdmdTdrY1pUZmMzK3dxSExz?=
 =?utf-8?B?enhza2I2UC9BRkRyVEJNMmJWb3Z1N0JDcmZkVlVScE5ZNXJRUHpNM0JxdFo0?=
 =?utf-8?B?K1NYTHlEdkdtd25WejV1TUp0WUF1NUc2MHpCcmFGS29EL21Cd216MUgzK3A2?=
 =?utf-8?B?TEdHM1k2RUIwMFNYL29qWGRUZkx0T0FBZmRpall4RCtsWnBvMWhQWXp1ZW5F?=
 =?utf-8?B?cnE2WnpJM0pVZmJCbDN2cUd2VDdyS2QwVndpdkd2MzhoNkFiUlVQNGk2SE5r?=
 =?utf-8?B?eGFaYnp1OUo3TWhOWkFNekljay9tMS9UWDA5Mnl2VWFtVGRxc0IwNzJEOElq?=
 =?utf-8?B?QWFJM2t0VlBQZ2QyY3FoQzV2a3NPazJPQzlXZlhXeldnVkpSRU5sOWx5VEtJ?=
 =?utf-8?B?WXhvMXh4QXNtdmlpT0RoUUNBTnRjZi94aWQ1Z3RTaElzTUZTTUhHM1ZUZmg2?=
 =?utf-8?B?RTJYdlJOY2V1azJzTVRCbCtaLzVUQUtyL2JOU3ZTdzgwajJKYXpqSjhiUE9N?=
 =?utf-8?B?dVVkeGtPek9iSWYrS3N5L1FsRFVCMWptOVA1UVdHcnNtY3ZkQ3V2M2hsdzhh?=
 =?utf-8?B?cDhRRUNtZFNsUDBURnpoRUZ0dlZvbkQ4WXdHTHdrSnpGbGg2eVRBQ3o0NENh?=
 =?utf-8?B?enFOMUxheXhOSVpuZHNTSVR4Zm1kcmR4WnpDZGZvekxTbnU2UE10dkcyWWhi?=
 =?utf-8?B?ZHBjeE1rSnlFREpjT3hVaGZjaXNHYXN4ZWw1UHR5Ri9hMWRsM3BnWE94V1Vt?=
 =?utf-8?B?RVdhejBkaHc4R0FhSGVJMGQ0UXgxbGo0M2pLcHdseXlaYjJ0d3ZYVUt4eFBq?=
 =?utf-8?B?UXFCUmVpcDN1RFEyVFBNSE5pdWZLaUNzRWxiSnppdnFHMmh3dWtJTWJPRTl1?=
 =?utf-8?B?TTV2MDdBdHZuaDVUd1dDbXZvZ0lQK2U1RzFmaDNRTmdkNXZwZkhMSk9ZQ2ph?=
 =?utf-8?B?NHFTWXl1QzhoVk5ucWY2Ynk4QlVCUWxGSEdHU2YrQTFVVmNEb2hJRThVbW50?=
 =?utf-8?B?bnhuaENvSndTZkNTY2NHK1lpRHdGbkxTTVpqNU5vVFV3WTFNSnRzYzZRemlu?=
 =?utf-8?B?YTFkM3Z1bHk2Sm5rbEtDclJpdzVoSGNGOEpTZzZZUlRmYyswZlQ3V3RSOW82?=
 =?utf-8?B?eGtSeWVvVzBmVVFmL2Q0NUZqNjAzUUFKMXNmNGc0QUFTRHBBdk1EWitvTWx0?=
 =?utf-8?B?MDhDZEFsdDhTRjRLYTc3c05FaW5lTDh4SWw4UkQ4WjM0SE1zQlA4c3dITm9o?=
 =?utf-8?B?ekcyTlRzcmgvbVdxN2FzbTc5b3JqYTJ5b0prdEFPSjkrVVRCL21GQldFQlJj?=
 =?utf-8?B?Ykc1UmNtNlFIaXRaSzBMNThwRTZGV2UrRGU4S1BaYnNvR1JDWkRZQ2E1WkNv?=
 =?utf-8?B?THlyb05yV21pWjZvRVRGcC9qb2tGU1ZMdWtpOC9acWJ6bnpPWVV3OUpnQW1O?=
 =?utf-8?B?Tk1jblFaalNNa25hclF3NkRWckJac1ZiTDFGakVpSmtYRDl2YWpqM09jME5N?=
 =?utf-8?B?cURDY1hZYnk5ZzFPY0RLRnMyVTZneWhzVTkrNVBzRkwyeGl6R0NGMjJsRXZR?=
 =?utf-8?B?YXNYM21YOEMzRlFNZ3FmTjlwYUQ2bWpPMUNYN0ZGZ1pQc2NaSHFldWNGeTdK?=
 =?utf-8?B?TjlRK2pvb0dLZmhEaGhWM3EwWjI2ZlN5anpoYnJ0TkI2ZWRaTUtROW1ZMVhm?=
 =?utf-8?B?YUtSQ0NRT0ZqczJaRzRKU3pQVTcyalUxcnppWnBIUlg0TXlUYXlMa3pvN3Rr?=
 =?utf-8?B?YlA5Vy9nc0lKRENna0JnUW5FR0ZNUGtoUEdYbko0akc5cC9WR0djZi9UK1VI?=
 =?utf-8?Q?SAJRpqt9hFNlsMnMTvgrjDZ6x?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6f9f2ad7-3d33-4bd6-28ba-08dd7e122dfe
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB8476.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Apr 2025 00:44:30.4735 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7Cqmka8TuNNUA5oOVA7/NwiyvhZGQA4FuZWC1zxij3ev8lNeFLNK79b2r4YXJDRPFrH6lssplCh8k3KWENGj+w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8694
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

No issues from promotion tests.

Reviewed-by: Alex Hung <alex.hung@amd.com>

On 4/8/25 10:55, Alex Hung wrote:
> Hi Gergo,
> 
> Thanks for the patch. I am sending this patch for testing and I will 
> update test result next week.
> 
> 
> On 4/2/25 11:03, Gergo Koteles wrote:
>> Since b255ce4388e0, it is possible that the CRTC timing
>> information for the preferred mode has not yet been
>> calculated while amdgpu_dm_connector_mode_valid() is running.
>>
>> In this case use the CRTC timing information of the actual mode.
>>
>> Fixes: b255ce4388e0 ("drm/amdgpu: don't change mode in 
>> amdgpu_dm_connector_mode_valid()")
>> Closes: https://lore.kernel.org/all/ 
>> ed09edb167e74167a694f4854102a3de6d2f1433.camel@irl.hu/
>> Closes: https://gitlab.freedesktop.org/drm/amd/-/issues/4085
>> Signed-off-by: Gergo Koteles <soyer@irl.hu>
>> ---
>>   drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 12 ++++++------
>>   1 file changed, 6 insertions(+), 6 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/ 
>> drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
>> index bae83a129b5f..0eb25cdcb52f 100644
>> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
>> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
>> @@ -6500,12 +6500,12 @@ decide_crtc_timing_for_drm_display_mode(struct 
>> drm_display_mode *drm_mode,
>>                       const struct drm_display_mode *native_mode,
>>                       bool scale_enabled)
>>   {
>> -    if (scale_enabled) {
>> -        copy_crtc_timing_for_drm_display_mode(native_mode, drm_mode);
>> -    } else if (native_mode->clock == drm_mode->clock &&
>> -            native_mode->htotal == drm_mode->htotal &&
>> -            native_mode->vtotal == drm_mode->vtotal) {
>> -        copy_crtc_timing_for_drm_display_mode(native_mode, drm_mode);
>> +    if (scale_enabled || (
>> +        native_mode->clock == drm_mode->clock &&
>> +        native_mode->htotal == drm_mode->htotal &&
>> +        native_mode->vtotal == drm_mode->vtotal)) {
>> +        if (native_mode->crtc_clock)
>> +            copy_crtc_timing_for_drm_display_mode(native_mode, 
>> drm_mode);
>>       } else {
>>           /* no scaling nor amdgpu inserted, no need to patch */
>>       }
> 

