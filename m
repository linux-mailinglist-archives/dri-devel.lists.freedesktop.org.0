Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D689381EB3
	for <lists+dri-devel@lfdr.de>; Sun, 16 May 2021 14:24:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 34C5E6E50D;
	Sun, 16 May 2021 12:24:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2050.outbound.protection.outlook.com [40.107.236.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BDAFF6E128;
 Sun, 16 May 2021 12:24:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=izz8IhV91FGXPTpdyHHacsouvbcVo2tzC3A+3X2+lwqcBnTPBUx8aDKJyTT/6bTbLVCoBj9TWtHTYXxLd211yYmyT5yhA5tDCPSLWAKVX8GCoOaH8CSREWR+9DQePGV8HqXCDudJyB72uNg3fNpIiolgniPS89rT12fY8X0aM2bSnX9qgxwxn8GulJh1JVBTNXx5bSoaYrxvIF/jdhYnb7zIY4zLvWrrgiGOgDUWcqwENwfGN0TKEHEZxFKdo1euGMJjAqfkRRy7dnFfNpNsXPVOPehh2mbECQgBvpZOOk1h8i4ZNlMPVIhNmLyTGvVOIyLpPnudTbJMXNzEPa5z5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UAJHpjJaK3G0U2XeiR5rPGhYIe+JbWcTlyCb8TAKn0k=;
 b=hqe+M2CaHZh8Pe/A1qeItCzSSAWRBolMd5gyg3Fm8Ppsh2PU5YFu8x4dz0d9D4m5m1wWzzyNgnPI9A2k8Ss5XeI+t9X8m3jbRPVwxKx7TgNzOfQu3qMJSOpPsLB4kc8dw9rgEkKOMU3wIlIfDh7snpAXg+oDo5Nep26g+vL6iyrAH35goPyCBFEvQKJ760n4Ks1sJOTbbs4kNUA0WQZ2xyRnbNCn0Ez3ZAmPqFgQJOsZ54BydQbuOqGPXG7CCtZxvLafKuzd3NdIq6Wba0S/5tkkG77CbNPShX4HU1YDyXwOWDkNwlsot9inDT2o7axojsOcUxXBUgQPPuVwJUAiig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UAJHpjJaK3G0U2XeiR5rPGhYIe+JbWcTlyCb8TAKn0k=;
 b=N4GHgfsb0gM9ODogZXsytLrhojcEcLSrdlyWPcgBg713+YLgdeV77JtNQN8wFBTck1gS1N90Nezs8z98j29pPqt9lnBL59BqHN+jhfBd+L+Op0ytIgEKfI6X+aSvm1ErJouMZt54pSiSBOXrTKbrreMOxQJNbiwlyw3fOi3NM3U=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by BL0PR12MB4658.namprd12.prod.outlook.com (2603:10b6:207:32::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.25; Sun, 16 May
 2021 12:24:32 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6d4d:4674:1cf6:8d34]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6d4d:4674:1cf6:8d34%6]) with mapi id 15.20.4129.031; Sun, 16 May 2021
 12:24:32 +0000
Subject: Re: [PATCH 1/4] drm/amdgpu: Use %p4cc to print 4CC format
To: Thomas Zimmermann <tzimmermann@suse.de>, airlied@linux.ie,
 daniel@ffwll.ch, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 alexander.deucher@amd.com, sakari.ailus@linux.intel.com
References: <20210516121315.30321-1-tzimmermann@suse.de>
 <20210516121315.30321-2-tzimmermann@suse.de>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <46af8505-fb62-45b7-cbca-08bbe0ffa0d0@amd.com>
Date: Sun, 16 May 2021 14:24:27 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
In-Reply-To: <20210516121315.30321-2-tzimmermann@suse.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:565:3911:7ef3:8923]
X-ClientProxiedBy: PR0P264CA0132.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:1a::24) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:565:3911:7ef3:8923]
 (2a02:908:1252:fb60:565:3911:7ef3:8923) by
 PR0P264CA0132.FRAP264.PROD.OUTLOOK.COM (2603:10a6:100:1a::24) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4108.25 via Frontend Transport; Sun, 16 May 2021 12:24:30 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 346e1693-8fdb-4d0b-5d8b-08d918658efa
X-MS-TrafficTypeDiagnostic: BL0PR12MB4658:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BL0PR12MB4658A37FCED1FB16D57B8976832E9@BL0PR12MB4658.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4125;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: LciR7WHz7g7VlYKm5fKL63eiQAfXIE3Jp0JIkMT0SmNS0R6gZ91OpZrxZfIGL9EKorvYUJlsGyHDvmwuCrbTmsvphy3WfU5MFrhhft4cQltIs/CJ757cQ2oCxLsPEyU0GYANxmRRi5cODhPMZW3UTt1nshg37vvHqcXtOUaiWz9hP3YOMolESgfAAA1h3R2I7+ZvHthonKvROzPhMg772MEoYHksPvxEdSZqsJNjMRYwpCqMu1tnryXbQ854dlyl00hq7Tsm2SZvy3EWlTJ+Kbgy1o62A4wxONrbmesNLXtOTDZOMsG4hXZcJKU1pQE/8FWkNyqtesbR3oXO66eYE/4+Eh51+2UDZggK3l/INASiT1eBuJKO5eczv0oDNKgxxCVV6zXkRWuQWRc2qaYYDRclVY7fO++b8hedPx1fXgKvjs88LOB6+iDuZQHrq/zeWLJsL3E6Uuv/BBzxu44tt5Q2D7qSd+k0J4neBE8GtP2Hx9bXJNWuzCkE2iMxPJ4/21lEyx5tQQN6ASWVPpvJKCocm/nXyWxXnzWCfZoftbFUkY9/JN0Q48RYXaI3wooYD8jKEYe8L4Gib1+ySRl72kqG8AlqsLJpGcnHzH3vxebqZksESMSjpb3WY/k/6ODEVVMrCCYPQk/tETYFEptowSYR58LuRIL+/HiXO84ZskFWyTG+vF3C1YNF8mO6vLpG
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(376002)(136003)(396003)(346002)(366004)(83380400001)(2906002)(38100700002)(5660300002)(316002)(8676002)(8936002)(66574015)(36756003)(66476007)(16526019)(2616005)(66556008)(478600001)(86362001)(66946007)(31686004)(6486002)(6666004)(31696002)(186003)(4326008)(52116002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?dmxyY05LN29wWDY2MFVXS2k0SUMvWXlTRFJHVVR5L3pmL0VDSyt5djA1clFw?=
 =?utf-8?B?UVpzS3dUamdZeC9ERUtYb2QrSWNFcnBqdk5uZXAvQnFCblhJcnNWUUFOd1Bs?=
 =?utf-8?B?WTA3SGlaY1RSRVRtMFo0eUpNdzlxRXp0b1hvYkduNnZWb2ViUVRJVzZGNVBG?=
 =?utf-8?B?N1ZDVmU3L3ZpWFJoRGZlRENCekxMK2JaVElIY3dQNlNOZER2QkF2WnREekdx?=
 =?utf-8?B?RE1lZWFQR0p4d2UwZlNkeWpXLzNxMXZwUmxGb09aeWptZkZqNkd0TWF2T09L?=
 =?utf-8?B?R1gzS3ZtVVBHR0l5VnNrVWhyYUFaMEY1bjdxWGJTUGExWE96L0NjY1grbVgy?=
 =?utf-8?B?UUV2SUFHcW56eVRoUWs3K05laE5QZlVwQkdIK3h2Uk1RSUwvMVpBTi9pKzEv?=
 =?utf-8?B?N29pUlJlY2RXdXJlNUlzWnZBbDBWRTA5M2VTYktyMkNZeCtnWnNOL0x4Znd2?=
 =?utf-8?B?QnRLZ1lpRmZiYU4wT3l1R2xnempLSlA1UVFCNC95dnlXZXFIbXlKTXVlZkNJ?=
 =?utf-8?B?aVJkNFFtL3F2OG9kYi9xWDZZZ1QvWnFaZnpTZ3UvQWxHMzdaZnZqWXlpU2xK?=
 =?utf-8?B?YlJPc3E4SmtEeU80b3hYM0NxbEdZTFhjQ1ZGZFBEVHJvcXRiQkYydEVJTk1S?=
 =?utf-8?B?dGZDYzRST2hYNVN6b2JlcUUwWCtnTi9zZ09sTSt1UUJFd1RuV3Q0dlhSZjFC?=
 =?utf-8?B?Nm1uQ1M5OU1uRnk0eHZ3bDJCQjdzcGYxdGtEVUFsRWlmK1VzRHNlZ2hLampj?=
 =?utf-8?B?a2p5aHlCeXY1NmtyZWVCSTNqVmtpWGx4UXhET3lJTGZCblpndWk5ZmJKd1Uz?=
 =?utf-8?B?Nmg0b2UvY3hybEVveUJheUZud0tvY2NFUm5lZmltQStnQkVja1o1NUpuSTVh?=
 =?utf-8?B?UVUxd0pFbUdjWXUxY20vNnhEdmEyZWlEdnRqbmZZWHRuZTFFMEZER1JGT0FG?=
 =?utf-8?B?QzA3V3ZqYWlEL0VaZWFVcXlSWk1iQW5ac0lTcmJBQkptTUVhYXg0OEZDdU1Y?=
 =?utf-8?B?Q2tKc3lRWUtHNW9JZVczclk1QUVzcUcrZ1hBU09ONWN2cThqaU1HMFdNTytp?=
 =?utf-8?B?R2hSemw3eTZFc1RRTXkrSDJvK2lMS1poMWkwcGJadGZwa0ljb2Z0WGlkV0FH?=
 =?utf-8?B?WWYwVWxoMUpqeFdUZjRpOUU0MUx2dllpV0U2citTVmd5dUU4WXYrVDNWMG9j?=
 =?utf-8?B?dmlad3pYTWtOaWxMN0x0M0d4N0NtT0dwVGNNRmUzRWlJTE9pSXVTNmpjeExq?=
 =?utf-8?B?eHdjZUZzVHBUYk5ibXVTVFlBb3JDM3R4MXByMkRsWXFkYWYwWWp2ZlFBYldK?=
 =?utf-8?B?akpYK2RIT1U3OCtKRGJPK2RGeDdTUnFKRWxsdjd3NEJZTW5FS2VTUFVadzE4?=
 =?utf-8?B?dEJZcW5WcVhyOXBPdGhpQklqMnRVeGdnbU1GaEcvWFZ5Z21qVjlsSTk3SjNw?=
 =?utf-8?B?bUxmVzlpVUdqSnpkdWxBSnFFVUYycWdSQ3JKRFRMTEpDd0UvZkhIM3djR3Z3?=
 =?utf-8?B?THozTmdtQ2RvK3ZmNHd1YUQwcUdBV08vU0dCeC9od2tXdmx5c21xazlNYjFW?=
 =?utf-8?B?VTdnUVVQTWNTcllIS2xHK29sOTUvYThER0JjQy9WN1g2bE1yZkRhdDZ1djBq?=
 =?utf-8?B?UlVMUHkzUWhITmVQRi80VEJsN0t4U0pTVFdkdm1NczFhb2ZkdFUvSHRuc2dG?=
 =?utf-8?B?UHI3UTFURmdDY25yZGlIWEhPUEh2cURrM3RYeGVGWG1OLzhZdmcwRWJlMFFp?=
 =?utf-8?B?MTNmWnZVSGMyQm9XcEFjMXYvY0ZZZC95NVc2RXluQVBBc2t5VUJKTmVGN3F2?=
 =?utf-8?B?VXhUZzdSbEtwVm1IWGNKV1kyZWVKR2ljVEEvM1pnSFVORGllNUhOdlVVQ1p4?=
 =?utf-8?Q?7CtqpJJwjbA9X?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 346e1693-8fdb-4d0b-5d8b-08d918658efa
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 May 2021 12:24:32.3499 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1QLKSaT2Wl9EDAflvmlW9ABJ7wYRrNYrZaFPu0CvbRSZ50vd/S2o6rTnfLy+Jgmx
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB4658
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
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 16.05.21 um 14:13 schrieb Thomas Zimmermann:
> Replace use of struct drm_format_name_buf with %p4cc for printing
> 4CC formats.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>

Acked-by: Christian König <christian.koenig@amd.com>

> ---
>   drivers/gpu/drm/amd/amdgpu/amdgpu_display.c | 7 ++-----
>   1 file changed, 2 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c
> index 8a1fb8b6606e..49f73b5b89b0 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c
> @@ -1077,12 +1077,9 @@ int amdgpu_display_gem_fb_verify_and_init(
>   	/* Verify that the modifier is supported. */
>   	if (!drm_any_plane_has_format(dev, mode_cmd->pixel_format,
>   				      mode_cmd->modifier[0])) {
> -		struct drm_format_name_buf format_name;
>   		drm_dbg_kms(dev,
> -			    "unsupported pixel format %s / modifier 0x%llx\n",
> -			    drm_get_format_name(mode_cmd->pixel_format,
> -						&format_name),
> -			    mode_cmd->modifier[0]);
> +			    "unsupported pixel format %p4cc / modifier 0x%llx\n",
> +			    &mode_cmd->pixel_format, mode_cmd->modifier[0]);
>   
>   		ret = -EINVAL;
>   		goto err;

