Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 23C19737C77
	for <lists+dri-devel@lfdr.de>; Wed, 21 Jun 2023 09:42:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C6EF10E3DD;
	Wed, 21 Jun 2023 07:42:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2042.outbound.protection.outlook.com [40.107.244.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A32B410E3DD;
 Wed, 21 Jun 2023 07:42:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Wh13h3GV3rF7edtFW8q0Nju0SAH3KWZTXgGTKotlW1iTH11XKT5XEfXGAho4aUt59s8eipTzWTiEw1T8xquLUIMPLSKBhACQ9Z/XjU69jy/MN6Z1C+l2H23F9Nbnp04ND1EteoQpgT0WP4N5oKDcNuBQIxQkA44Dey35tid9kVg2PNpxhkqYkjmTjOXI2xjAE5dRjXZ3yM2d5XYnR08btVxUoxAJdQZcwNvguN1mu6Owr/BvccqcwmCQ3I29N2jdDw9wmnO7cy4QY57itK7MKCH4nC7LeqF2iSjvRxYCSm8hr54UshWJd1NN8JUOyGAyi+tqH49lpRA4URN3yH1YyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=e4XjteeAVYSOUGiSt1E+FCbddRdWWwnRAFu0J+Uxkc8=;
 b=Y+jgUOvBafYmRlTAFybNqTrQTQKum1kF8fy7AGE2sKTAZD+p9I6YB2xRBIOSxQZoEZTLLX0gP3t7f5NpYU3GcU6uNpvg2UrFqDYIxbP1RLdPQnHtVBw4S//f6Bu0FhFWgwVd1vgk0uo7AUHAPPB38potTOHDxm5Y8kIIqbYA3U1R8L1O08A0B3Yp8yX69Wn/COySYgXFt6x+GI99pZ4DsYk16qanEqFMNaJo++5QIs8wzOsJvHnkmcqdGIgLaw34DHe2Thlrkghp6teGFyr8g5hAhmgvd6HYt51D0ypmMO+wOj4qiIiNUmpZGWcJCZAKboGdp37ENXasCZgPBht20w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e4XjteeAVYSOUGiSt1E+FCbddRdWWwnRAFu0J+Uxkc8=;
 b=FGqBpHnHBYmk5aAZXHrNvG62cLJgxNq8BjSvFEozZ4KiNggkqh38Qm394h09pvWn0Zx7WwTg/up1PwR6HzdCh+ylSqb0KOMckpj5MvBO8V6P+meAcKvGNNxVgiBo/tAv4qz7gai2dt/z+igo+3WGxoOxEWpIYeXNZGAqR1Qwd1M=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by PH0PR12MB7931.namprd12.prod.outlook.com (2603:10b6:510:289::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.21; Wed, 21 Jun
 2023 07:42:31 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::384a:95a4:8819:ee84]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::384a:95a4:8819:ee84%7]) with mapi id 15.20.6521.023; Wed, 21 Jun 2023
 07:42:31 +0000
Message-ID: <caa69e8e-f330-d819-e8cd-7b06aa8eb855@amd.com>
Date: Wed, 21 Jun 2023 09:42:25 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [RFC PATCH v3 0/4] drm: Standardize device reset notification
Content-Language: en-US
To: =?UTF-8?Q?Andr=c3=a9_Almeida?= <andrealmeid@igalia.com>,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20230621005719.836857-1-andrealmeid@igalia.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <20230621005719.836857-1-andrealmeid@igalia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0025.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1c::23) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|PH0PR12MB7931:EE_
X-MS-Office365-Filtering-Correlation-Id: 18e614de-78e1-4ca9-b505-08db722b11cb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: xdSrN8pmE2UteeT+/0/SwqyI59hSDneFhh/kBhRQA2Ix+V0cAxp7wvA3ua5MmS6xEWKNAkdXHGXynjV+fn5ma3yPWxZnnlHL2VbTDybcGyotJJjm6PQpV39tR1KuHxNorvJ1loOelzk5ydjJBZANPwqnusyaDueKCPDjQyDs0cC8FfYOw20zJGD5vOMR+8qacSiKSVdQ1qg6zQ9r8BdZxUbBfeQFL7mUzfevYIjdz2a5azhoJhMLXYkPePLeAs6VbUkx76+Jd6T6coZ9uF9OsF5A6MkEISxazOBh5WfVUBXV0Dw90JXHDymGs8nigWjx7II2M6UkNW/Ap1i3povnKqy480JBytRWbY70N/xIxnbMyQm63MAH1pNUgUHKMT9+WSl7XO46cn23oVCCzCN/n8ZyFVv0K29izewON4aaQUSwG8PVmjXRiGdSFz7+eDJtiAvlxKvmPVJnyDgnOHfz5dqB67FKCja4Os4kXqkBz1zoO92aG0phNWKu/71VdecHl5thh1pBwFnAKVC7RDGmk3kynzSI1eOeRXG8fiPIZBG5h6aUDJL8t5Ct/sjFYQT14wdaVTrrxEJYAf9PUBDfcsDsLg/QzgG1EkGvnAtSYX4SLwwYBT1K8v6yqEY212GJc7nvvzgyVLZZ/4kX9BtLqwFcPSoQlp7JWZQLN6LfCag=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(346002)(366004)(396003)(376002)(136003)(39860400002)(451199021)(6666004)(966005)(6486002)(478600001)(6512007)(83380400001)(186003)(2616005)(6506007)(38100700002)(86362001)(31696002)(36756003)(31686004)(8676002)(5660300002)(8936002)(2906002)(316002)(41300700001)(4326008)(66476007)(66556008)(66946007)(66899021)(7416002)(54906003)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dHZKZG9kUkI1d1g3OEJHblVPMW9KSnMrSFhKdisycjI3dU9aVHcrcCtWUU9G?=
 =?utf-8?B?aEIybklML2FXSG85REhPdTJnbFZnSmFmdktkb29EcHQvQVgwdTVHVUxKdllN?=
 =?utf-8?B?QW44a2hzMXQ0aG9ORkYwSGFFTDFraU96NCsxelkyekVyTytCTGtvMzBVUSt6?=
 =?utf-8?B?SE9jcDZwTk5QT1NtcWprU085U1RkU3FrZEpQOE12U0pTQ2Jiek9EdFd1eWRV?=
 =?utf-8?B?bnduR2FadGhVd2pobUgyd1hpUzJOM0VsOU9rU0t2TWt3clBEeHBmM2p3SVNF?=
 =?utf-8?B?YUZoUnM1YVZsNUorejdUTlpXRHF4VnkxdS9reStPZXNyMXdEcGxDVlNzY0ND?=
 =?utf-8?B?eGpHL1dHdkZ4OGNSVktVNEhkRTNRWVVBZFN5QjVpMEtjNlkyN2plQjBvOFVW?=
 =?utf-8?B?MTRMNTNicW9lVGNqUHhKSGdOd0Y0VmNTaEw3dzdseUFIdzlmbHNBUXJ0Q3JX?=
 =?utf-8?B?VjBBbjJ6NkhYeEs2bEtURkxJYlowbVFoaCthUU51aUg2NS8xL0J3OWN1bDVN?=
 =?utf-8?B?WmhEQisrVHZiU2FtOE8yalVCS2k4Wnl1TUw2a2ZZeitwWkJZT1NWL2E4bmZz?=
 =?utf-8?B?dkYwYWc4WkpqRC9uUU14M1Fac3hCcVd2U2ZTVVh4amhCN08rNDcxTUROdHY1?=
 =?utf-8?B?cG1uSGN5WTQra1FMVkpzV3pEM1duOXJ0V1pXZ1BoUnVHY3N3WDI1YnhoY1ZQ?=
 =?utf-8?B?Wm9UdHlhQmNtS1ZUSVVQTkVsSEZSYWN1dEtTdms0YllKT0s0Z05Mc1lkY3Iy?=
 =?utf-8?B?R1JVd2RRcURaOFFRWnVpQzBIYXBzYkFkVWJBa2h1Mi9kOEpoRjBnQmtLb3pp?=
 =?utf-8?B?RUFGbXUzb2J0SldhSFk4bVdReXdjeEJqbnp1NzlsNlBwaG5ZbS85WEVCT05q?=
 =?utf-8?B?cDlmQThrdkZnV1dJV3JvdUpFNEdqQ1FWSUxsb0RYYUsvRGxlcHZvOEhpanNC?=
 =?utf-8?B?KzRLd3dIYS9kdXdoSFpHWjJZUXYrU1VXY0pIa0I2WWFqTUpuL3gwdWVCZDEx?=
 =?utf-8?B?UXVKUm5FMlhyMEszNkpQSS9ndUEwNDNrOXkzakEycHV6WVNwV01oM0E1QTls?=
 =?utf-8?B?RiszTVFDejVhT0xLc1FsYnJKRVJIWDdOeGpQaTkwbk5UblZUTkVJb1I0NFM3?=
 =?utf-8?B?QVVWSWxSUWFHRHdzMjl1c01pR0FzZlA2Uno1YjRoYlN5V2xRUjlkcmFVaFpa?=
 =?utf-8?B?cWRrL3RSNGM4elNBbVI0L1Y3c0p1R2F6SDAxMmhsa2Uxa1FIV0ptZlIySGsr?=
 =?utf-8?B?d2xlUnRSbDB1N25TNmFZZkVQNW5MSjFJZUtMNVhCOW4vYWhkRHVuOTlISUdh?=
 =?utf-8?B?M2ZTb2x5aUE2WWhKSllUclQxRHhGcWVzRW4rcWVPK3pyai96TndIdlBVd1I4?=
 =?utf-8?B?anBNc0locG9UUU5XcnZoNXRSUnRXQ3BUcGhzWko4RXBVSVhaRVV3NitvaC9W?=
 =?utf-8?B?ajY1NDlRZDBNK205YzZsU0RLU2tvTUR4bktpZklQVTdJVjhBZVdXRGE1R0Rt?=
 =?utf-8?B?cEFpekt2ZG9OcEN6eTFtQmtmMTJwUjVMSXZiZzRTWmRJNjQ2ckh1bldkKzF1?=
 =?utf-8?B?dVZ6eFgxWWUyWXF2UE1SRDg2QnRjbnhFSHlNREtvaU5XV2Z2TTJqKzFRajI4?=
 =?utf-8?B?YW5xeWJIL0Z3L0hOSzNmMTc0MXJ3RXVpUzJSZWR2T1dMYy9HcmxvbGdpeG5F?=
 =?utf-8?B?Y0NMckFsS3ZLVXoyaitOa3o4bC9mcFlDTTVjcTAzOHBIRllJMG1vZ1ZKbXJN?=
 =?utf-8?B?Ui8xQVN3dmhrTGVPT0pKcG53K3lHVDE3NkpESTFqOTB1aW9hNWd0MUtuemc4?=
 =?utf-8?B?TWdNN3ZNUzNQQ2sxalB3V2lJc2NPV2J5akZwMHhQREJRakJuTDNEUG1xS1ZH?=
 =?utf-8?B?NnNjR21seUw2NEcvc1FJMzVhVW5xODVKeThOQ1drNGpkeWltRHplQWFhK1hu?=
 =?utf-8?B?SlFSWWdqZ09DdlQxR1ovV0JoRVFyNkpEMDVQczhSSE1VZUJvaG1zU3R5REZi?=
 =?utf-8?B?UVdmSFMvTVlHRnBXV0dsa3ZSLzF6UlNGbjVmMUxjcURwRklEa3lha0F1OVJ2?=
 =?utf-8?B?ZGZvMVo0STRzY3RYamU5OWdMOUVPNGRSeTNDNW5Bc0N2ZUQzZTh1WUhGTlJK?=
 =?utf-8?B?elY3S3BDdTN2OVd5WVNUanBRY2NIVmtyM2VGRHRxUTNPelgrUC9KbHU4S2Vy?=
 =?utf-8?Q?gTgLILLIeIkDM8C5bJq5+l9DVYRF55eBQSOkLzQ2/BdA?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 18e614de-78e1-4ca9-b505-08db722b11cb
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jun 2023 07:42:31.3193 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RUTscHyUk76inKypOQ5cbvYX0Zg5I9dh5d1uQCqfSttSzWJbUq2jS5oSIZ+280HQ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB7931
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
Cc: pierre-eric.pelloux-prayer@amd.com,
 =?UTF-8?B?J01hcmVrIE9sxaHDoWsn?= <maraeo@gmail.com>,
 =?UTF-8?Q?Michel_D=c3=a4nzer?= <michel.daenzer@mailbox.org>,
 =?UTF-8?Q?Timur_Krist=c3=b3f?= <timur.kristof@gmail.com>,
 Pekka Paalanen <ppaalanen@gmail.com>,
 Samuel Pitoiset <samuel.pitoiset@gmail.com>, kernel-dev@igalia.com,
 alexander.deucher@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 21.06.23 um 02:57 schrieb André Almeida:
> Hi,
>
> This is a new version of the documentation for DRM device resets. As I dived
> more in the subject, I started to believe that part of the problem was the lack
> of a DRM API to get reset information from the driver. With an API, we can
> better standardize reset queries, increase common code from both DRM and Mesa,
> and make easier to write end-to-end tests.
>
> So this patchset, along with the documentation, comes with a new IOCTL and two
> implementations of it for amdgpu and i915 (although just the former was really
> tested). This IOCTL uses the "context id" to query reset information, but this
> might be not generic enough to be included in a DRM API.

Well the basic problem with that is that we don't have a standard DRM 
context defined.

If you want to do this you should probably start there first.

Apart from that this looks like a really really good idea to me, 
especially that we document the reset expectations.

Regards,
Christian.

>    At least for amdgpu,
> this information is encapsulated by libdrm so one can't just call the ioctl
> directly from the UMD as I was planning to, but a small refactor can be done to
> expose the id. Anyway, I'm sharing it as it is to gather feedback if this seems
> to work.
>
> The amdgpu and i915 implementations are provided as a mean of testing and as
> exemplification, and not as reference code yet, as the goal is more about the
> interface itself then the driver parts.
>
> For the documentation itself, after spending some time reading the reset path in
> the kernel in Mesa, I decide to rewrite it to better reflect how it works, from
> bottom to top.
>
> You can check the userspace side of the IOCLT here:
>   Mesa: https://gitlab.freedesktop.org/andrealmeid/mesa/-/commit/cd687b22fb32c21b23596c607003e2a495f465
>   libdrm: https://gitlab.freedesktop.org/andrealmeid/libdrm/-/commit/b31e5404893ee9a85d1aa67e81c2f58c1dac3c46
>
> For testing, I use this vulkan app that has an infinity loop in the shader:
> https://github.com/andrealmeid/vulkan-triangle-v1
>
> Feedbacks are welcomed!
>
> Thanks,
> 		André
>
> v2: https://lore.kernel.org/all/20230227204000.56787-1-andrealmeid@igalia.com/
> v1: https://lore.kernel.org/all/20230123202646.356592-1-andrealmeid@igalia.com/
>
> André Almeida (4):
>    drm/doc: Document DRM device reset expectations
>    drm: Create DRM_IOCTL_GET_RESET
>    drm/amdgpu: Implement DRM_IOCTL_GET_RESET
>    drm/i915: Implement DRM_IOCTL_GET_RESET
>
>   Documentation/gpu/drm-uapi.rst                | 51 ++++++++++++++++
>   drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c        |  4 +-
>   drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c       | 35 +++++++++++
>   drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.h       |  5 ++
>   drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c       |  1 +
>   drivers/gpu/drm/amd/amdgpu/amdgpu_job.c       | 12 +++-
>   drivers/gpu/drm/amd/amdgpu/amdgpu_job.h       |  2 +
>   drivers/gpu/drm/drm_debugfs.c                 |  2 +
>   drivers/gpu/drm/drm_ioctl.c                   | 58 +++++++++++++++++++
>   drivers/gpu/drm/i915/gem/i915_gem_context.c   | 18 ++++++
>   drivers/gpu/drm/i915/gem/i915_gem_context.h   |  2 +
>   .../gpu/drm/i915/gem/i915_gem_context_types.h |  2 +
>   drivers/gpu/drm/i915/i915_driver.c            |  2 +
>   include/drm/drm_device.h                      |  3 +
>   include/drm/drm_drv.h                         |  3 +
>   include/uapi/drm/drm.h                        | 21 +++++++
>   include/uapi/drm/drm_mode.h                   | 15 +++++
>   17 files changed, 233 insertions(+), 3 deletions(-)
>

