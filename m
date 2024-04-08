Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BC4E989B932
	for <lists+dri-devel@lfdr.de>; Mon,  8 Apr 2024 09:50:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 690F511220F;
	Mon,  8 Apr 2024 07:50:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="04JhL0Av";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2131.outbound.protection.outlook.com [40.107.244.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD88011220A
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Apr 2024 07:50:32 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=c82vBDpyK3CfiJFEf2EcXWfm4w9Zf7kGZ678iuRQ1kRwyDKSn+4b5iLgqapVt93KUEEb7eX6V0ZxqqyAv14DzYKfTdEMJIPHUKBi2tncNkKCYCG/af3PsJmIwo++ezHj7aVdOBSV9FYgxL6v5ELT2R9QO5uNj0P0nTTY5YTDY+S/RY0WpIl2uDs2NJI7mBesXJoO89yZyeF8CGHxsO2R+x+fndNwyMe0BI8ybs5Y7bJoqIliGgou7y+TlBdlZQD7x9DB9WqBWAG6bxH973bpHVnOFJPjI+UNTZ1dusCSSLHs3qwO5BblGoVR/mDo0xZlMipD59xMJY7WWOn1z6ef8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JxVfDs1B/B7OIRi/O/gGv4n0BtIr3290nG4uKFrRtTY=;
 b=fY71AOU6pptkLGLLn4XuPmm9TXtLnnnP7Dc7NxgVgULpFkxe7L1O2kCHkmHHvzDBOa9iLNrzQrOClMyBve8kkRJJumMhH8sZtWLRHjS5jNNrVzfDoTLqJ+ifkHfBni/Hy2w1KQllX+klYFAFWCJYVex9UilmHrdSKjAhuyWnUYCRkMZJR7PuGjKMfU9KUKvf1PuQnnZ8j0mJSYGSQ7BrNWBAOTp4n4Jc9AazY23/rdlqoJiWaDtckRCZ6R7Mu651d1JC/4y6MUzZv8KuPn7DQiTAlUfq7q2OQ3MZcpsc5/oripC6hj7OGDIvB9avvjhrwPJK4HRnaQjgM26LZcir3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JxVfDs1B/B7OIRi/O/gGv4n0BtIr3290nG4uKFrRtTY=;
 b=04JhL0AvobGjyprkf/tfipi1uwWivloIzsuI8NPHeWZLJZP97TEYgtYN6OInu/UG+/JEXFaqk0nWEStLrhoYm6dp+Oj2YAphu3k8OCm0wr4WGVQGuIGVhSAoU7K01a6D8dOmydF+kUiG9ZEn4W1awxkUJnVCyKmfXyZn68trPhU=
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by DS7PR12MB8250.namprd12.prod.outlook.com (2603:10b6:8:db::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.54; Mon, 8 Apr
 2024 07:50:28 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::f2b6:1034:76e8:f15a]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::f2b6:1034:76e8:f15a%6]) with mapi id 15.20.7409.042; Mon, 8 Apr 2024
 07:50:28 +0000
Message-ID: <aef88dc8-b5c9-4496-b858-d6ec2a829f6e@amd.com>
Date: Mon, 8 Apr 2024 09:50:23 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/6] drm/v3d: Enable Big and Super Pages
To: =?UTF-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>,
 Melissa Wen <mwen@igalia.com>, Iago Toral <itoral@igalia.com>,
 Tvrtko Ursulin <tursulin@igalia.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, kernel-dev@igalia.com
References: <20240405201753.1176914-1-mcanal@igalia.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20240405201753.1176914-1-mcanal@igalia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0214.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:e4::10) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|DS7PR12MB8250:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: eF9YvxT4w9afBqNPMcEiPoGLNqpdqs34u4YWUTBVSFhUG522wp8M/kajV0vFXkjX6I47VJ3PpKMOvD3Vg/Q0PoRNU7U1uoOTMif1T+96ZOK2TJUjR6mlj6PqLFjeHOehbWNRmF1+SnDKkejYrrVVh5AuFmK58ZtlwXL6yMm6XLsnKtB+KCI+1kCTdMnbWP7nwrZJm9Z0lD2kPkaF77z/ktWVGbRQD2G/ysjAA52QGKRqjwjDS2bXgwBA8JQsSt4po7ZUD4mfKyThd1mSyktB36ueQvNfGEmwnnB9VdP6qYJ5syyDknPMaWtZC1boBQQa4nTCAaQnHlUXltMHVrybGSSNRInLVZt8NeQwmR/q/ctBt70W8CZO2eau/xYcszbyGfN81HQKU4EOTk+P8bgtPmwHD6bbM3fv6pTnqepM9ptu1MKdDgiZr+pSi07PfHXSVZ9Mc+5/Y7Qp8sizzcxXsAV2RiJZAVnz4qemtC9kNXhrF+d61pvCptO6B3sKOtM3MyM9IfK1m/bnNaT62pYjm5NdAYfHamA71H/20F6el2XbHeTpT+QrxN3L6AaBcQgdEcg3o3wWDGSXJ9DjA0xGX9DdXEabpcllBkht1qCk9bs=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(7416005)(1800799015)(376005); DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OUhiNTI3eDkxQjlsZGVmenFNSXFRK2pWWXFROXlkd2Z1WkJMOGdxRlQ3OWgz?=
 =?utf-8?B?OHdoY2VXRTBBQWgrNHpDSk5nQVhRMU44QjVWQy9iKzlhRjlTcW51NnZkZkIx?=
 =?utf-8?B?UmVmUjFYdHFrbHJ4TXhzOHI0bHorNm5wVkowbFR3TENqODJwN0ZqNUZNRnRn?=
 =?utf-8?B?cHUzSDVSM0RJVDVQWlhsY0JhMWZPNDNwYnh1YkZKSDU4SlFBY0xleHhUeUNB?=
 =?utf-8?B?YzhMc2kzVFh0dlhqWXRVckNBYWRZM01uU2E1cTd2alJJamJCS1Bhbkt0VTFL?=
 =?utf-8?B?dzl1ZTZLdW52aXdmM1dOQjMxakd3VWwzWURBTGJxUm5yeExQa2w2TUdGZ2lC?=
 =?utf-8?B?eDNqTFpmWVJxVTVjV2QrUEcxSDFHNjQyUnQ3eUhabldhdk85aHNHYnFpY0R0?=
 =?utf-8?B?THdaVWlSOGoxRlAwTDVacllXRTBML3gwbHRyTmpXUERBK0cxREF3L1ZKdlhn?=
 =?utf-8?B?cGZQSmZYUU5WRERNcUZGK3NlR2IydG5VcnZzak9FaVd6SVY1NXE1RlptK0hI?=
 =?utf-8?B?RXVrSFR6TWQ3V1gyU1ZHWmhiVm9BRmNuNFlNNTVYcnRweHpKSXpEZGNzVWw3?=
 =?utf-8?B?UXd2OUZvUFNVRVh0Y2Q0ai9BK2ttZjVOMWZIdHFsb00zVVZPaHpoKzZxZDRV?=
 =?utf-8?B?c0dnTHB4eHpkYy85dCtPTlZwbktoNHhaM0dDZUkrZXU4dVhVUDR0V1M3SnRu?=
 =?utf-8?B?R3pDc0hHQ0RwRm1FdnQzZHViajBkMk9naXAvTWVjTmhTU2RZUURZZjVlMkpI?=
 =?utf-8?B?MlNyMWtrbTBXaWhLOEZqRFM2MXNabmkwVE56aUwxMUw2bDIwSWRUaU9ITWEx?=
 =?utf-8?B?cmlQemh3Q0dkOSs3REI1SkZ5VmNET3oyZmgzNzlkeEZPejh2SFU5cCtGWDRD?=
 =?utf-8?B?YnlOTWRhbjNkdXhkcEVQWkNLYXYzc0JDM1FEY2t3NzZBSllkWHF3NU42SzFR?=
 =?utf-8?B?SXQ5ZngxUjZha1lKR3p1cXUzRjBhVVVBU01GTitkak1oNGYwL3VUQW0zSTNE?=
 =?utf-8?B?QnBiNXp5VTVVZnhOS3JKOVB6eU85K2pNdEpWWkc0WGVSMDduN1RaSTI3Kzhr?=
 =?utf-8?B?ZzFKYWgyK1FoS08vMC9wUThwWDhCK1VhbE1kNk16TllHL2N6SVhHa0dhWVZT?=
 =?utf-8?B?Q3Z4bWdTdUZSS2daRUlrSGQ5YlNCdmNLaFlscG5aR29PWWZBaDJraVlnNTVG?=
 =?utf-8?B?QkRnUUtGQVNrSU5KZkZEUTBuREtJSWVsQWlyQkhac3N3ZEhxQ3Frc0Z0R2p0?=
 =?utf-8?B?R0thZHMxa1gvNE9mMXJ2bDZJMU1vMzMyeHJRWmtEdURlZEJEY1VEY0tINnhx?=
 =?utf-8?B?OXByWnNpaFZ4WVhIbTdMVlQvWmYvbUtpcWJkUzNYODZieWY2aEcrekpFYlZT?=
 =?utf-8?B?VjdIM1FrME1hZHgyYmd5Z2hBTjlqalFOUTdVV1pxMkVOZ2V5WTVrY000bU9r?=
 =?utf-8?B?d2ZCNGdJaXdWdnNzY2xhRkJHMHUvTmMzWkdIc0hHNjI2dUVCU0FEVkQvYUVE?=
 =?utf-8?B?RGtwVmFGMy9BMXBETmJQMzV3L3lhTVNGbWYzVmwrVkdVS1JpdzUvT0xqWVZ4?=
 =?utf-8?B?VFVjaERBUnRSb05vS2x5eStvQmN4MjQ3eDJQd0xIbm1nQ2NKbFViWmVLMVls?=
 =?utf-8?B?WUNZd2V2UTBHNXV2OVFKYWMxRVpQbU4zN1lQRzRoT2Nsb21PaVIzbkZrdm8y?=
 =?utf-8?B?ZmRGNnpDM1ZmdDRKNWFocENPdjZseTFaUFhMVFN4VmhpWEszN2J1eWgxRGQx?=
 =?utf-8?B?MFY2b04rVGc4RE9DUjNST2R3L1FtTXc4NFAxM1FYK2NHcjBzUGwzUmJTRkpo?=
 =?utf-8?B?dVFFbEgzU0cwQ2FxVHpwQWprY2JJT2NwNDFjTWNpZmJjdmg3bEpkQ1FSMWtx?=
 =?utf-8?B?TGM2ek5aZHFSemJ3UFg4ak9oeCtEaDhwLzRIMXNESDJYd3BDTmxTUXdqKzJ1?=
 =?utf-8?B?cmtkK0g0Y0VHRDZ2ZURFUHNsY0VlNlNzQ0U5VjEyRXNiengxTDlKMkQ5QmVC?=
 =?utf-8?B?SWxJS2k4ZktQYVdZSnRVT2ExUzVlby9wUkZCOGVWdVZwaDdsSW8wUXNRaDFE?=
 =?utf-8?B?YXUxU1BpVVB4Zll1RW1uakwzazVYaG1ncTYyVERYbFlta1FvR29WTnprSTkr?=
 =?utf-8?Q?keyc=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9acf7cf9-ae21-41bb-428c-08dc57a08e92
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2024 07:50:28.0743 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dJ1OESjIVt8cP82qQV5dlMtmzi8YuO5hyK5s91gcmyAvR6IEfH2U7B6Hz2aaoRdG
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB8250
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

Am 05.04.24 um 20:29 schrieb Maíra Canal:
> This series introduces support for big and super pages in V3D. The V3D MMU has
> support for 64KB and 1MB pages, called big pages and super pages, which are
> currently not used. Therefore, this patchset has the intention to enable big and
> super pages in V3D. The advantage of enabling big and super pages is that if any
> entry for a page within a big/super page is cached in the MMU, it will be used
> for the translation of all virtual addresses in the range of that super page
> without requiring fetching any other entries.
>
> Big/Super pages essentially mean a slightly better performance for users,
> especially in applications with high memory requirements (e.g. applications
> that use multiple large BOs).

Nice to see that concept applied more widely.

 From amdgpu experience the most beneficial case is usually when you run 
out of TLB reach, e.g. when your working set is so large than with 4k 
pages the TLB won't be enough to cover it entirely and you are force to 
re-fetch entries during execution.

In those case 20% improvement is usually quite realistic.

Regards,
Christian.

>
> Using a Raspberry Pi 4 (with a PAGE_SIZE=4KB downstream kernel), when running
> traces from multiple applications, we were able to see the following
> improvements:
>
> fps_avg  helped:  warzone2100.70secs.1024x768.trace:                    1.98 -> 2.42     (22.19%) (v1: 2.56)
> fps_avg  helped:  warzone2100.30secs.1024x768.trace:                    2 -> 2.45        (21.96%) (v1: 2.39)
> fps_avg  helped:  supertuxkart-menus_1024x768.trace:                    123.12 -> 128.39 (4.28%)  (v1: 125.50)
> fps_avg  helped:  vkQuake_capture_frames_1_through_1200_1280x720.gfxr:  61.26 -> 62.89   (2.67%)  (v1: 61.36)
> fps_avg  helped:  quake2-gles3-1280x720.trace:                          63.42 -> 64.86   (2.27%)  (v1: 64.29)
> fps_avg  helped:  ue4_sun_temple_640x480.gfxr:                          25.15 -> 25.63   (1.89%)  (v1: 24.94)
> fps_avg  helped:  ue4_shooter_game_high_quality_640x480.gfxr:           19.28 -> 19.61   (1.72%)  (v1: 19.02)
> fps_avg  helped:  ue4_shooter_game_shooting_high_quality_640x480.gfxr:  23.58 -> 23.91   (1.39%)  (v1: 23.34)
> fps_avg  helped:  quake3e_capture_frames_1_through_1800_1920x1080.gfxr: 61.40 -> 62.00   (0.96%)  (v1: -)
> fps_avg  helped:  serious_sam_trace02_1280x720.gfxr:                    49.41 -> 49.84   (0.86%)  (v1: 47.74)
> fps_avg  helped:  supertuxkart-racing_1024x768.trace:                   8.69 -> 8.74     (0.56%)  (v1: -)
> fps_avg  helped:  sponza_demo01_800x600.gfxr:                           17.55 -> 17.64   (0.50%)  (v1: -)
> fps_avg  helped:  quake2-gl1.4-1280x720.trace:                          36.43 -> 36.58   (0.43%)  (v1: 36.57)
> fps_avg  helped:  quake3e-1280x720.trace:                               94.49 -> 94.87   (0.40%)  (v1: -)
> fps_avg  helped:  sponza_demo02_800x600.gfxr:                           19.79 -> 19.87   (0.39%)  (v1: -)
>
> Using a Raspberry Pi 5 (with a PAGE_SIZE=16KB downstream kernel), when running
> traces from multiple applications, we were able to see the following
> improvements:
>
> fps_avg  helped:  warzone2100.30secs.1024x768.trace:                       4.40 -> 4.95     (12.58%) (v1: 4.49)
> fps_avg  helped:  vkQuake_capture_frames_1_through_1200_1280x720.gfxr:     135.05 -> 141.21 (4.56%)  (v1: 139.45)
> fps_avg  helped:  supertuxkart-menus_1024x768.trace:                       291.73 -> 302.05 (3.54%)  (v1: 303.80)
> fps_avg  helped:  quake2-gles3-1280x720.trace:                             148.90 -> 153.57 (3.13%)  (v1: 156.13)
> fps_avg  helped:  quake2-gl1.4-1280x720.trace:                             82.60 -> 84.46   (2.25%)  (v1: -)
> fps_avg  helped:  ue4_shooter_game_shooting_low_quality_640x480.gfxr:      49.59 -> 50.54   (1.92%)  (v1: 47.30)
> fps_avg  helped:  ue4_shooter_game_shooting_high_quality_640x480.gfxr:     51.03 -> 51.93   (1.76%)  (v1: 50.46)
> fps_avg  helped:  ue4_shooter_game_high_quality_640x480.gfxr:              31.15 -> 31.64   (1.60%)  (v1: 31.05)
> fps_avg  helped:  ue4_sun_temple_640x480.gfxr:                             40.26 -> 40.88   (1.54%)  (v1: 40.23)
> fps_avg  helped:  sponza_demo01_800x600.gfxr:                              43.23 -> 43.84   (1.40%)  (v1: 43.68)
> fps_avg  helped:  warzone2100.70secs.1024x768.trace:                       4.36 -> 4.42     (1.39%)  (v1: -)
> fps_avg  helped:  sponza_demo02_800x600.gfxr:                              48.94 -> 49.51   (1.17%)  (v1: 49.34)
> fps_avg  helped:  quake3e_capture_frames_1_through_1800_1920x1080.gfxr:    162.11 -> 163.13 (0.63%)  (v1: 165.71)
> fps_avg  helped:  quake3e-1280x720.trace:                                  229.82 -> 231.00 (0.51%)  (v1: 234.51)
> fps_avg  helped:  supertuxkart-racing_1024x768.trace:                      20.42 -> 20.48   (0.30%)  (v1: 20.59)
> fps_avg  helped:  quake3e_capture_frames_1800_through_2400_1920x1080.gfxr: 157.45 -> 157.61 (0.10%)  (v1: 160.35)
> fps_avg  helped:  serious_sam_trace02_1280x720.gfxr:                       59.99 -> 60.02   (0.05%)  (v1: -)
>
> When glancing at the percentage improvement, one might initially perceive v2
> as causing a performance downgrade. However, that assumption doesn't hold true.
> In the case of v1, we were using downstream kernel version 6.1, whereas now,
> with the kernel updated to 6.6 for v2, there's a small uptick in performance.
> This indicates an enhancement in the baseline scenario, rather than any detriment
> caused by v2. Additionally, I've included stats from v1 in the comparisons. Upon
> scrutinizing the average FPS of v2 in contrast to v1, it becomes evident that v2
> not only maintains the improvements but may even surpass them.
>
> This version provides a much safer way to iterate through memory and doesn't
> hold to the same limitations as v1. For example, v1 had a hard-coded hack that
> only allowed a huge page to be created if the BO was bigger than 2MB. These
> limitations are gone now.
>
> This series also introduces changes in the GEM helpers, in order to enable V3D
> to have a separate mount point for shmfs GEM objects. Any feedback from the
> community about the changes in the GEM helpers is welcomed!
>
> v1 -> v2: https://lore.kernel.org/dri-devel/20240311100959.205545-1-mcanal@igalia.com/
>
> * [1/6] Add Iago's R-b to PATCH 1/5 (Iago Toral)
> * [2/6] Create a new function `drm_gem_object_init_with_mnt()` to define the
> 	shmfs mountpoint. Now, we don't touch a bunch of drivers, as
> 	`drm_gem_object_init()` preserves its signature (Tvrtko Ursulin)
> * [3/6] Use `huge=within_size` instead of `huge=always`, in order to avoid OOM.
> 	This also allow us to move away from the 2MB hack. (Tvrtko Ursulin)
> * [3/6] Add Iago's R-b to PATCH 3/5 (Iago Toral)
> * [5/6] Create a separate patch to reduce the alignment of the node
> 	allocation (Iago Toral)
> * [6/6] Complete refactoring to the way that we iterate through the
> 	memory (Tvrtko Ursulin)
> * [6/6] Don't use drm_prime_get_contiguous_size(), as it could give us
> 	misleading data (Tvrtko Ursulin)
> * [6/6] Use both Big Pages (64K) and Super Pages (1MB)
>
> Best Regards,
> - Maíra
>
> Maíra Canal (6):
>    drm/v3d: Fix return if scheduler initialization fails
>    drm/gem: Create a drm_gem_object_init_with_mnt() function
>    drm/v3d: Introduce gemfs
>    drm/gem: Create shmem GEM object in a given mountpoint
>    drm/v3d: Reduce the alignment of the node allocation
>    drm/v3d: Enable big and super pages
>
>   drivers/gpu/drm/drm_gem.c              | 34 +++++++++++++++--
>   drivers/gpu/drm/drm_gem_shmem_helper.c | 30 +++++++++++++--
>   drivers/gpu/drm/v3d/Makefile           |  3 +-
>   drivers/gpu/drm/v3d/v3d_bo.c           | 21 ++++++++++-
>   drivers/gpu/drm/v3d/v3d_drv.c          |  8 ++++
>   drivers/gpu/drm/v3d/v3d_drv.h          | 13 ++++++-
>   drivers/gpu/drm/v3d/v3d_gem.c          |  6 ++-
>   drivers/gpu/drm/v3d/v3d_gemfs.c        | 52 ++++++++++++++++++++++++++
>   drivers/gpu/drm/v3d/v3d_mmu.c          | 46 ++++++++++++++++++-----
>   include/drm/drm_gem.h                  |  3 ++
>   include/drm/drm_gem_shmem_helper.h     |  3 ++
>   11 files changed, 195 insertions(+), 24 deletions(-)
>   create mode 100644 drivers/gpu/drm/v3d/v3d_gemfs.c
>
> --
> 2.44.0
>

