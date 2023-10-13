Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FD3D7C8C8A
	for <lists+dri-devel@lfdr.de>; Fri, 13 Oct 2023 19:45:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 864E110E04B;
	Fri, 13 Oct 2023 17:45:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2080.outbound.protection.outlook.com [40.107.93.80])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 958E610E04B;
 Fri, 13 Oct 2023 17:45:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Dz2NcGbmaUG07g0kEncNRMl+4fXW5LcRKVcvDqV8cmSYFqV6gMdQqJe2zMdPuAHW9FwFqdbyjFex2HU3pqzfjdXT78vKd+GAKwrwtDry5nKYN0Q4Zvt12u/n2Pv0um4zPsEEJdJIjC8z4YCBy5oh+yNL2CCb1kDA/5fB1aD1bkT+l32omuDYO7CYFvrDIAXWJLFSeyemQl3kKX79cSuZrafnvhlpLLEugOTunA1KCU3gJgE7PAZx2oP8NQRtMAuztKAFRBvgPEWUQBWEpQLVsNX+FFHO+hoS5abvong2xWaRWWrOZ5KjX8GD0yP0+3mUnXMEFVnddeqXAb7R5GosCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JRUVjF9vwGWMvktuURDGJj1KEpiprTPpILO/aSZftVc=;
 b=cDBaMrS+xyGLjJ2LZzIII+jLyQnt4Pwl5iMyxlMK77GWdabd153qjlzmy/JAC2MoQK9xwZVyTmM3A2P709Cf2gq9jqfN5HbUdg86ox2iktOMIxSJd6eMgqYz9orAJSGMqrkGoEM0lpOt2UAXzB5DuyxQOKmv8yJAYk/pe6kbmp3zBID7Tcmsse9fa+n91QtGQRRGVR3FtbqHblblGEI/KtsvnoPxz4rZ4eI0jzuLw0T3jrtga+R3cvouCwjn+AX1oYneTDMTUoM8RKFDVv6YEQCdPdxqnzErT3fTJzC81jladmOUT/a6k/SxMDo4mZZ0xUye5NBjJBkSSFrs/qReEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JRUVjF9vwGWMvktuURDGJj1KEpiprTPpILO/aSZftVc=;
 b=1liN82BKYc+jUzaZx8wGFuE6qfRdIQYWApSEWCXKLYVszPNLGbs+roM+WWHQG/3ISgmwaiMPDLAeJfCMOW9sJS/gaTjQDWuEs4WfXGbJK4c984fMSsSCxhQNl6rtZ0rFXc4o6avujQM6m+qujJkrF7ul7WlUExql5kxw74lXMcc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB3370.namprd12.prod.outlook.com (2603:10b6:5:38::25) by
 IA0PR12MB7553.namprd12.prod.outlook.com (2603:10b6:208:43f::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.45; Fri, 13 Oct
 2023 17:45:13 +0000
Received: from DM6PR12MB3370.namprd12.prod.outlook.com
 ([fe80::b80b:7138:6ceb:9aef]) by DM6PR12MB3370.namprd12.prod.outlook.com
 ([fe80::b80b:7138:6ceb:9aef%5]) with mapi id 15.20.6863.043; Fri, 13 Oct 2023
 17:45:13 +0000
Message-ID: <161b9b56-3938-48b1-a3b9-1ca55fc2134a@amd.com>
Date: Fri, 13 Oct 2023 13:45:08 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:115.0) Gecko/20100101
 Thunderbird/115.3.2
Subject: Re: [PATCH v5 3/7] drm/sched: Move schedule policy to scheduler
Content-Language: en-CA, en-US
To: Matthew Brost <matthew.brost@intel.com>, dri-devel@lists.freedesktop.org, 
 intel-xe@lists.freedesktop.org
References: <20231011235826.585624-1-matthew.brost@intel.com>
 <20231011235826.585624-4-matthew.brost@intel.com>
From: Luben Tuikov <luben.tuikov@amd.com>
Autocrypt: addr=luben.tuikov@amd.com; keydata=
 xjMEY1i6jxYJKwYBBAHaRw8BAQdAhfD+Cc+P5t/fiF08Vw25EMLiwUuxULYRiDQAP6H50MTN
 I0x1YmVuIFR1aWtvdiA8bHViZW4udHVpa292QGFtZC5jb20+wpkEExYKAEEWIQQyyR05VSHw
 x45E/SoppxulNG8HhgUCY1i6jwIbAwUJCWYBgAULCQgHAgIiAgYVCgkICwIEFgIDAQIeBwIX
 gAAKCRAppxulNG8Hhk53AP4k4UY5xfcje0c5OF1k22pNv8tErxtVpgKKZgvfetA4xwD+OoAh
 vesLIYumBDxP0BoLiLN84udxdT15HwPFUGiDmwDOOARjWLqPEgorBgEEAZdVAQUBAQdAzSxY
 a2EtvvIwd09NckBLSTarSLNDkUthmqPnwolwiDYDAQgHwn4EGBYKACYWIQQyyR05VSHwx45E
 /SoppxulNG8HhgUCY1i6jwIbDAUJCWYBgAAKCRAppxulNG8HhnBLAP4yjSGpK6PE1mapKhrq
 8bSl9reo+F6EqdhE8X2TTHPycAEAt8EkTEstSiaOpM66gneU7r+xxzOYULo1b1XjXayGvwM=
In-Reply-To: <20231011235826.585624-4-matthew.brost@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YQBPR0101CA0199.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:67::19) To DM6PR12MB3370.namprd12.prod.outlook.com
 (2603:10b6:5:38::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR12MB3370:EE_|IA0PR12MB7553:EE_
X-MS-Office365-Filtering-Correlation-Id: 85a4000a-108c-4b59-066d-08dbcc142735
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: iCRCGHxmQ3rlwVRMkURJU+BKvOV5dHHfirufE2hiFq2Ea1zqXAIP5l+ewtsyCzqzbRYpXcdtXzeAXYeReIJKTdVNGmxJkATG9utZBmlWlJYZV4kyLDwgn1fCXavYbqzyqiIIis2YVfFNRx7gHeo6C/+mf+YskHbrQgXDbYFhydZG0fe6QzuKIpFfo6iqT8w1jPJbNg79mZ1KhsKAJNwpxC/ijMzdSUH9tp+uMsdtkCfGH98+YoTSN9GJ9/2+DoIVsx2CJSXfm0IaM9RcO/DRejV8IL4nrM64ATvPL0ODtNuDNMTAVmhJWwa5iCXEfRlNueQ5QBM6S+HPpNzcKECc6WiaRJfRWuNK3rKfnGKWeGVvF7NQl4BBebUY52MKpnJWGEj8h1jMfWJtlAws5/TrLQMmQotaQnkpXsKyfQc8o+knSc7PXqqeph7nrtlvP94FRGaPwibB9tiyoA9GbkiycklYIBMLb+zMiqVE1j+JtVzo5yglu9fs/RlZu01rFqN79081CCDR59hkzc3Bl4V/JWJ8KxSXtBgzXznxNQ8q/wBXimSwWDQr+Jdv2sU0qvfupDbcU3PrFtzbJtLeaI27Sjf9wBWEaxIKxT3rJPdRbyy9v4sogj4Pdix0P0YEZXX25p6NZ2C1XlG4PmxGI+YjS9F84uNNpIWZBciWWjlgw+c=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB3370.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(39860400002)(346002)(376002)(396003)(366004)(230922051799003)(186009)(64100799003)(451199024)(1800799009)(83380400001)(316002)(66899024)(8936002)(38100700002)(8676002)(86362001)(31696002)(36756003)(66556008)(4326008)(66476007)(66946007)(31686004)(2906002)(44832011)(41300700001)(53546011)(30864003)(6666004)(6506007)(7416002)(2616005)(4001150100001)(6512007)(966005)(6486002)(5660300002)(26005)(478600001)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aXM1SHBIUEdwSjlQUm1HaDZTZ09pSDI2Zk1vUzl1M0J3enIxOUwzYjlvei9h?=
 =?utf-8?B?aXJjZVBYK0ZwT3NFb2pHSXJzOXNGazR3cUtFVE9UZmVkcDdGRWtpMUx2RWFt?=
 =?utf-8?B?U1dIeDM5L0d0b2VsTmJyeXRwNjA5WjhqTytUdEJRSU5OdWpoWVBWNHhqdmJT?=
 =?utf-8?B?dDZPQ0JrSHpDNTIwcUdaS293SSs0UUswSEZIQnZGK2xPYUxWaUp6azRack9C?=
 =?utf-8?B?WmRMRHpsZEg2YjhQT2oxalY5WnEwSGw2aE05OU81N2t3K3V3MFp0cERCbEFT?=
 =?utf-8?B?ckJhNkg2Wml5b3NlVWZLVWVYOFZFWlhXZWpOQXh1MXJoOUxrbWE4Skt5NDhG?=
 =?utf-8?B?cGd0ODBXRjRQV1V5bUllbHpDdmpoTVR6QTJpMXl6bFJ4L2tPMkFDMjFZYzhF?=
 =?utf-8?B?elIwYXJkOXVpdUhGNVlJN1U1ZnJiZnl3MitGdFVEMU5leCtpdDAweUNQMUh2?=
 =?utf-8?B?bVdZRVpVa2ZFaThUMEZIRGdGRGhwMmszaEtnY1FiSkRZK3AzallYUmh3bUpY?=
 =?utf-8?B?bDc3WlNMdTNsdVFNSW9MSnNOMGY2eGJDRDBoZ28rc0g5cWJNejNuVzY3QmFx?=
 =?utf-8?B?Ymo3b0ZLRGp0VHhDQmtXRXlJai9iTVZnMFpIOTk3ZmtQQTNaZk14aHAvNzV1?=
 =?utf-8?B?dFd2SVNQamJKY2taVVkyS3V5c2RZaWZ1cWQ5dXQrdHZ5VTZTZ0UzSmZKemEv?=
 =?utf-8?B?QkgyZmFqS0Q0TldDUWUwaldvRkJzZ0pVaWNKWUpRTnhselR1aDRiaW5pQ0dE?=
 =?utf-8?B?azBwUmlKOXBsbi9nUld3TFQ1d3REOSsxV0xNTVNFMHVJTkQrd25VTmtvaG94?=
 =?utf-8?B?dTBUNnZlaHNNMkhRVEdLVnU5SlpmSFpKalltSkZuc0pUUm4rekVYbHZDK3Na?=
 =?utf-8?B?RS8xM09UVGpqWjBlYXRseWNNZzI2ZXVqRGg3aVFaa3hHNEg4bHdjbmE0OVJs?=
 =?utf-8?B?OTIxN0V5N1FCZXZueXdBWmhJTjF4ZzhLK0pmTXpsSUNKM0ppWW16aWRKWkp6?=
 =?utf-8?B?b0w3YkNpOFd3U0o5Y28yVlQxZTNlRHNnaUVNRFl0SWxkbzlXQTdSTG82Y3lZ?=
 =?utf-8?B?dHRhK0lSTGg5L2dCRnZxZ080MWhIV3dyTkxQRytaY1ZtUmh1M29DaS9LUDdZ?=
 =?utf-8?B?Vm80NFJDb1BHS0UrMTE5clBJa1ROb05JdysyQVg3NFl3OGQ5bGU2ZEI5a3N6?=
 =?utf-8?B?R0VaM0hscVo0R2VtVzV0QmxraGc5NFd0TDNvenJuMFJ4SEZiQVRJT3pXQVBB?=
 =?utf-8?B?NTkxcVViZGo0bmg4a1NiWEw0aFF1NnBjL21CZXFNSTZwSU5mYlJEVTdzM05l?=
 =?utf-8?B?RStZNStMV2xEc0VUMUdjV3l0cDJVVXJ5eUtXRU82NnVnTVY4WHRPbnpRQzV0?=
 =?utf-8?B?K3JqSDlhQndnOE1GMzhzaGswTmswK0d1YnI2RGxVUFlzdUp6aWFOVGZQRkFp?=
 =?utf-8?B?NnZQQTZzZ2E4VmgxVThKTDV2cXBUZ2NQdkxUblF0RSsrREtyV1JybXNOd3dK?=
 =?utf-8?B?M0toYUhBN21WMGtqYUF3WEFWU1VaSC82ZVVESENCM2hTY1c4ME5yclpDL1kv?=
 =?utf-8?B?dzhET3dMYmJyMnZrNlFTdGk1akZEY21VcldkcXgwaHdiOTBCNE1Jc2ozbmIy?=
 =?utf-8?B?L2JVeDlYQnpIL09FVU9ldkJFM0gvMzMvQkl5dmRvNkcxNC83V1pnVmZnUzVM?=
 =?utf-8?B?Mk1lTmZ2K25kbXpEMjJKZ1U2aDJLMDd0cHV1Z0lldC9BV3pOM0tFM1ZMeUpa?=
 =?utf-8?B?ZmJhQTNJZGFhb1BWZ2tsSXhNZEpnd2FHalNRUVRCcWw1MGJha2NBelJwVmk5?=
 =?utf-8?B?OVRxdElSbGpWNkx3SUJTWEJmajBNTjJ2VTFXUnFER1pLQVB4UzVvVVk0Tmx0?=
 =?utf-8?B?YWJUQ041dDB0QTMvRU5TWmtSN01LZzNZeGJJalhjYmFLS0FUeURWTDNXUFVD?=
 =?utf-8?B?NWVTbVZzYlBDbkRTWXRSWEQxbFEzMVB0a3JEZWoxSCtOb1QveVZkSjlaRlZu?=
 =?utf-8?B?di9pdUdjQ05oeDdLMnlUelhtWjdodCs2SmcwR3J2cEdzRE9NOEtyZXQrcGVP?=
 =?utf-8?B?UUxzd1d4UFBOSDVsaVUwaXJrcmZ2Q2hWWDBpT3FDcHRJcm9ab3lZZDZjMXRu?=
 =?utf-8?Q?3aAxHkIlK9mSS3U7PgVLd6xmH?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 85a4000a-108c-4b59-066d-08dbcc142735
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB3370.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2023 17:45:13.3690 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: r72mqKtDUvgOQpX0JkxPt0DqLlykMKD17fm2DcSoUFJK38zmKQiYw5YM+lSl334Y
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB7553
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
Cc: robdclark@chromium.org, thomas.hellstrom@linux.intel.com,
 sarah.walker@imgtec.com, ketil.johnsen@arm.com, Liviu.Dudau@arm.com,
 mcanal@igalia.com, boris.brezillon@collabora.com, dakr@redhat.com,
 donald.robson@imgtec.com, lina@asahilina.net, christian.koenig@amd.com,
 faith.ekstrand@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2023-10-11 19:58, Matthew Brost wrote:
> Rather than a global modparam for scheduling policy, move the scheduling
> policy to scheduler so user can control each scheduler policy.
> 
> v2:
>   - s/DRM_SCHED_POLICY_MAX/DRM_SCHED_POLICY_COUNT (Luben)
>   - Only include policy in scheduler (Luben)
> v3:
>   - use a ternary operator as opposed to an if-control (Luben)
>   - s/DRM_SCHED_POLICY_DEFAULT/DRM_SCHED_POLICY_UNSET/ (Luben)
>   - s/default_drm_sched_policy/drm_sched_policy_default/ (Luben)
>   - Update commit message (Boris)
>   - Fix v3d build (CI)
>   - s/bad_policies/drm_sched_policy_mismatch/ (Luben)
>   - Don't update modparam doc (Luben)
> v4:
>   - Fix alignment in msm_ringbuffer_new (Luben / checkpatch)
> 
> Reviewed-by: Luben Tuikov <luben.tuikov@amd.com>
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>

Hi,

Forgot to mention this, but it is a very important process to note,
is that one should _never_ add someone else's R-V tag, _*UNLESS*_
a) there's an email from the person giving their review or ack, and
b) you're the one pushing the patch set into the tree.
If you're not the one pushing it into the tree, the maintainer will
add their R-V (after their reply-to follow-up email--see below),
including a Link: tag when they do "git am" after it's been all reviewed.

And there's a reason for this.

The reason is that when kernel maintainers (especially DRM via dim[1]) push
patches into the kernel, we want to add a Link: tag [2,3] pointing to
the thread where a) the patch was posted and b) where the reviewer gave
their Reviewed-by to the patch in a reply-all email, and at this moment
there is no such email for this patch.

When a maintainer says "Do X, Y, Z, for an immediate R-V", this means
do those things, post it, and get a reply from the maintainer with an
R-V. This records how it happened and is very helpful when doing
data mining on how and why the code changed, via what patches, etc.

I suspect there might be a v6, and we can do the R-V/Ack the right way
at that time. No big deal, but it's good to know in one place as it
is a bit scatter here and there in the kernel-doc.

[1] https://gitlab.freedesktop.org/drm/maintainer-tools/
[2] git am --message-id
[3] https://docs.kernel.org/maintainer/
-- 
Regards,
Luben

> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_device.c |  1 +
>  drivers/gpu/drm/etnaviv/etnaviv_sched.c    |  3 ++-
>  drivers/gpu/drm/lima/lima_sched.c          |  3 ++-
>  drivers/gpu/drm/msm/msm_ringbuffer.c       |  2 +-
>  drivers/gpu/drm/nouveau/nouveau_sched.c    |  3 ++-
>  drivers/gpu/drm/panfrost/panfrost_job.c    |  3 ++-
>  drivers/gpu/drm/scheduler/sched_entity.c   | 24 ++++++++++++++++++----
>  drivers/gpu/drm/scheduler/sched_main.c     | 19 ++++++++++++-----
>  drivers/gpu/drm/v3d/v3d_sched.c            | 15 +++++++++-----
>  include/drm/gpu_scheduler.h                | 20 ++++++++++++------
>  10 files changed, 68 insertions(+), 25 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> index b54c4d771104..e4e6f91450a4 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> @@ -2283,6 +2283,7 @@ static int amdgpu_device_init_schedulers(struct amdgpu_device *adev)
>  				   ring->num_hw_submission, 0,
>  				   timeout, adev->reset_domain->wq,
>  				   ring->sched_score, ring->name,
> +				   DRM_SCHED_POLICY_UNSET,
>  				   adev->dev);
>  		if (r) {
>  			DRM_ERROR("Failed to create scheduler on ring %s.\n",
> diff --git a/drivers/gpu/drm/etnaviv/etnaviv_sched.c b/drivers/gpu/drm/etnaviv/etnaviv_sched.c
> index 618a804ddc34..15b0e2f1abe5 100644
> --- a/drivers/gpu/drm/etnaviv/etnaviv_sched.c
> +++ b/drivers/gpu/drm/etnaviv/etnaviv_sched.c
> @@ -137,7 +137,8 @@ int etnaviv_sched_init(struct etnaviv_gpu *gpu)
>  	ret = drm_sched_init(&gpu->sched, &etnaviv_sched_ops, NULL,
>  			     etnaviv_hw_jobs_limit, etnaviv_job_hang_limit,
>  			     msecs_to_jiffies(500), NULL, NULL,
> -			     dev_name(gpu->dev), gpu->dev);
> +			     dev_name(gpu->dev), DRM_SCHED_POLICY_UNSET,
> +			     gpu->dev);
>  	if (ret)
>  		return ret;
>  
> diff --git a/drivers/gpu/drm/lima/lima_sched.c b/drivers/gpu/drm/lima/lima_sched.c
> index 8d858aed0e56..50c2075228aa 100644
> --- a/drivers/gpu/drm/lima/lima_sched.c
> +++ b/drivers/gpu/drm/lima/lima_sched.c
> @@ -491,7 +491,8 @@ int lima_sched_pipe_init(struct lima_sched_pipe *pipe, const char *name)
>  	return drm_sched_init(&pipe->base, &lima_sched_ops, NULL, 1,
>  			      lima_job_hang_limit,
>  			      msecs_to_jiffies(timeout), NULL,
> -			      NULL, name, pipe->ldev->dev);
> +			      NULL, name, DRM_SCHED_POLICY_UNSET,
> +			      pipe->ldev->dev);
>  }
>  
>  void lima_sched_pipe_fini(struct lima_sched_pipe *pipe)
> diff --git a/drivers/gpu/drm/msm/msm_ringbuffer.c b/drivers/gpu/drm/msm/msm_ringbuffer.c
> index 1097f8e93d6b..173ad2f17c50 100644
> --- a/drivers/gpu/drm/msm/msm_ringbuffer.c
> +++ b/drivers/gpu/drm/msm/msm_ringbuffer.c
> @@ -97,7 +97,7 @@ struct msm_ringbuffer *msm_ringbuffer_new(struct msm_gpu *gpu, int id,
>  	ret = drm_sched_init(&ring->sched, &msm_sched_ops, NULL,
>  			     num_hw_submissions, 0, sched_timeout,
>  			     NULL, NULL, to_msm_bo(ring->bo)->name,
> -			     gpu->dev->dev);
> +			     DRM_SCHED_POLICY_UNSET, gpu->dev->dev);
>  	if (ret) {
>  		goto fail;
>  	}
> diff --git a/drivers/gpu/drm/nouveau/nouveau_sched.c b/drivers/gpu/drm/nouveau/nouveau_sched.c
> index 4c959dec42b3..c4e09d2e77f9 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_sched.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_sched.c
> @@ -437,7 +437,8 @@ int nouveau_sched_init(struct nouveau_drm *drm)
>  
>  	return drm_sched_init(sched, &nouveau_sched_ops, NULL,
>  			      NOUVEAU_SCHED_HW_SUBMISSIONS, 0, job_hang_limit,
> -			      NULL, NULL, "nouveau_sched", drm->dev->dev);
> +			      NULL, NULL, "nouveau_sched",
> +			      DRM_SCHED_POLICY_UNSET, drm->dev->dev);
>  }
>  
>  void nouveau_sched_fini(struct nouveau_drm *drm)
> diff --git a/drivers/gpu/drm/panfrost/panfrost_job.c b/drivers/gpu/drm/panfrost/panfrost_job.c
> index 934b7b930c76..95330ff402ba 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_job.c
> +++ b/drivers/gpu/drm/panfrost/panfrost_job.c
> @@ -856,7 +856,8 @@ int panfrost_job_init(struct panfrost_device *pfdev)
>  				     nentries, 0,
>  				     msecs_to_jiffies(JOB_TIMEOUT_MS),
>  				     pfdev->reset.wq,
> -				     NULL, "pan_js", pfdev->dev);
> +				     NULL, "pan_js", DRM_SCHED_POLICY_UNSET,
> +				     pfdev->dev);
>  		if (ret) {
>  			dev_err(pfdev->dev, "Failed to create scheduler: %d.", ret);
>  			goto err_sched;
> diff --git a/drivers/gpu/drm/scheduler/sched_entity.c b/drivers/gpu/drm/scheduler/sched_entity.c
> index a42763e1429d..cf42e2265d64 100644
> --- a/drivers/gpu/drm/scheduler/sched_entity.c
> +++ b/drivers/gpu/drm/scheduler/sched_entity.c
> @@ -33,6 +33,20 @@
>  #define to_drm_sched_job(sched_job)		\
>  		container_of((sched_job), struct drm_sched_job, queue_node)
>  
> +static bool drm_sched_policy_mismatch(struct drm_gpu_scheduler **sched_list,
> +				      unsigned int num_sched_list)
> +{
> +	enum drm_sched_policy sched_policy = sched_list[0]->sched_policy;
> +	unsigned int i;
> +
> +	/* All schedule policies must match */
> +	for (i = 1; i < num_sched_list; ++i)
> +		if (sched_policy != sched_list[i]->sched_policy)
> +			return true;
> +
> +	return false;
> +}
> +
>  /**
>   * drm_sched_entity_init - Init a context entity used by scheduler when
>   * submit to HW ring.
> @@ -62,7 +76,8 @@ int drm_sched_entity_init(struct drm_sched_entity *entity,
>  			  unsigned int num_sched_list,
>  			  atomic_t *guilty)
>  {
> -	if (!(entity && sched_list && (num_sched_list == 0 || sched_list[0])))
> +	if (!(entity && sched_list && (num_sched_list == 0 || sched_list[0])) ||
> +	    drm_sched_policy_mismatch(sched_list, num_sched_list))
>  		return -EINVAL;
>  
>  	memset(entity, 0, sizeof(struct drm_sched_entity));
> @@ -486,7 +501,7 @@ struct drm_sched_job *drm_sched_entity_pop_job(struct drm_sched_entity *entity)
>  	 * Update the entity's location in the min heap according to
>  	 * the timestamp of the next job, if any.
>  	 */
> -	if (drm_sched_policy == DRM_SCHED_POLICY_FIFO) {
> +	if (entity->rq->sched->sched_policy == DRM_SCHED_POLICY_FIFO) {
>  		struct drm_sched_job *next;
>  
>  		next = to_drm_sched_job(spsc_queue_peek(&entity->job_queue));
> @@ -558,7 +573,8 @@ void drm_sched_entity_select_rq(struct drm_sched_entity *entity)
>  void drm_sched_entity_push_job(struct drm_sched_job *sched_job)
>  {
>  	struct drm_sched_entity *entity = sched_job->entity;
> -	bool first;
> +	bool first, fifo = entity->rq->sched->sched_policy ==
> +		DRM_SCHED_POLICY_FIFO;
>  	ktime_t submit_ts;
>  
>  	trace_drm_sched_job(sched_job, entity);
> @@ -587,7 +603,7 @@ void drm_sched_entity_push_job(struct drm_sched_job *sched_job)
>  		drm_sched_rq_add_entity(entity->rq, entity);
>  		spin_unlock(&entity->rq_lock);
>  
> -		if (drm_sched_policy == DRM_SCHED_POLICY_FIFO)
> +		if (fifo)
>  			drm_sched_rq_update_fifo(entity, submit_ts);
>  
>  		drm_sched_wakeup_if_can_queue(entity->rq->sched);
> diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
> index 8b1d52cff1e9..150e5330f0fa 100644
> --- a/drivers/gpu/drm/scheduler/sched_main.c
> +++ b/drivers/gpu/drm/scheduler/sched_main.c
> @@ -66,14 +66,14 @@
>  #define to_drm_sched_job(sched_job)		\
>  		container_of((sched_job), struct drm_sched_job, queue_node)
>  
> -int drm_sched_policy = DRM_SCHED_POLICY_FIFO;
> +int drm_sched_policy_default = DRM_SCHED_POLICY_FIFO;
>  
>  /**
>   * DOC: sched_policy (int)
>   * Used to override default entities scheduling policy in a run queue.
>   */
>  MODULE_PARM_DESC(sched_policy, "Specify the scheduling policy for entities on a run-queue, " __stringify(DRM_SCHED_POLICY_RR) " = Round Robin, " __stringify(DRM_SCHED_POLICY_FIFO) " = FIFO (default).");
> -module_param_named(sched_policy, drm_sched_policy, int, 0444);
> +module_param_named(sched_policy, drm_sched_policy_default, int, 0444);
>  
>  static __always_inline bool drm_sched_entity_compare_before(struct rb_node *a,
>  							    const struct rb_node *b)
> @@ -177,7 +177,7 @@ void drm_sched_rq_remove_entity(struct drm_sched_rq *rq,
>  	if (rq->current_entity == entity)
>  		rq->current_entity = NULL;
>  
> -	if (drm_sched_policy == DRM_SCHED_POLICY_FIFO)
> +	if (rq->sched->sched_policy == DRM_SCHED_POLICY_FIFO)
>  		drm_sched_rq_remove_fifo_locked(entity);
>  
>  	spin_unlock(&rq->lock);
> @@ -898,7 +898,7 @@ drm_sched_select_entity(struct drm_gpu_scheduler *sched)
>  
>  	/* Kernel run queue has higher priority than normal run queue*/
>  	for (i = DRM_SCHED_PRIORITY_COUNT - 1; i >= DRM_SCHED_PRIORITY_MIN; i--) {
> -		entity = drm_sched_policy == DRM_SCHED_POLICY_FIFO ?
> +		entity = sched->sched_policy == DRM_SCHED_POLICY_FIFO ?
>  			drm_sched_rq_select_entity_fifo(&sched->sched_rq[i]) :
>  			drm_sched_rq_select_entity_rr(&sched->sched_rq[i]);
>  		if (entity)
> @@ -1072,6 +1072,7 @@ static void drm_sched_main(struct work_struct *w)
>   *		used
>   * @score: optional score atomic shared with other schedulers
>   * @name: name used for debugging
> + * @sched_policy: schedule policy
>   * @dev: target &struct device
>   *
>   * Return 0 on success, otherwise error code.
> @@ -1081,9 +1082,15 @@ int drm_sched_init(struct drm_gpu_scheduler *sched,
>  		   struct workqueue_struct *submit_wq,
>  		   unsigned hw_submission, unsigned hang_limit,
>  		   long timeout, struct workqueue_struct *timeout_wq,
> -		   atomic_t *score, const char *name, struct device *dev)
> +		   atomic_t *score, const char *name,
> +		   enum drm_sched_policy sched_policy,
> +		   struct device *dev)
>  {
>  	int i;
> +
> +	if (sched_policy >= DRM_SCHED_POLICY_COUNT)
> +		return -EINVAL;
> +
>  	sched->ops = ops;
>  	sched->hw_submission_limit = hw_submission;
>  	sched->name = name;
> @@ -1102,6 +1109,8 @@ int drm_sched_init(struct drm_gpu_scheduler *sched,
>  	sched->hang_limit = hang_limit;
>  	sched->score = score ? score : &sched->_score;
>  	sched->dev = dev;
> +	sched->sched_policy = sched_policy == DRM_SCHED_POLICY_UNSET ?
> +		drm_sched_policy_default : sched_policy;
>  	for (i = DRM_SCHED_PRIORITY_MIN; i < DRM_SCHED_PRIORITY_COUNT; i++)
>  		drm_sched_rq_init(sched, &sched->sched_rq[i]);
>  
> diff --git a/drivers/gpu/drm/v3d/v3d_sched.c b/drivers/gpu/drm/v3d/v3d_sched.c
> index 38e092ea41e6..dec89c5b8cb1 100644
> --- a/drivers/gpu/drm/v3d/v3d_sched.c
> +++ b/drivers/gpu/drm/v3d/v3d_sched.c
> @@ -391,7 +391,8 @@ v3d_sched_init(struct v3d_dev *v3d)
>  			     &v3d_bin_sched_ops, NULL,
>  			     hw_jobs_limit, job_hang_limit,
>  			     msecs_to_jiffies(hang_limit_ms), NULL,
> -			     NULL, "v3d_bin", v3d->drm.dev);
> +			     NULL, "v3d_bin", DRM_SCHED_POLICY_UNSET,
> +			     v3d->drm.dev);
>  	if (ret)
>  		return ret;
>  
> @@ -399,7 +400,8 @@ v3d_sched_init(struct v3d_dev *v3d)
>  			     &v3d_render_sched_ops, NULL,
>  			     hw_jobs_limit, job_hang_limit,
>  			     msecs_to_jiffies(hang_limit_ms), NULL,
> -			     NULL, "v3d_render", v3d->drm.dev);
> +			     NULL, "v3d_render", DRM_SCHED_POLICY_UNSET,
> +			     v3d->drm.dev);
>  	if (ret)
>  		goto fail;
>  
> @@ -407,7 +409,8 @@ v3d_sched_init(struct v3d_dev *v3d)
>  			     &v3d_tfu_sched_ops, NULL,
>  			     hw_jobs_limit, job_hang_limit,
>  			     msecs_to_jiffies(hang_limit_ms), NULL,
> -			     NULL, "v3d_tfu", v3d->drm.dev);
> +			     NULL, "v3d_tfu", DRM_SCHED_POLICY_UNSET,
> +			     v3d->drm.dev);
>  	if (ret)
>  		goto fail;
>  
> @@ -416,7 +419,8 @@ v3d_sched_init(struct v3d_dev *v3d)
>  				     &v3d_csd_sched_ops, NULL,
>  				     hw_jobs_limit, job_hang_limit,
>  				     msecs_to_jiffies(hang_limit_ms), NULL,
> -				     NULL, "v3d_csd", v3d->drm.dev);
> +				     NULL, "v3d_csd", DRM_SCHED_POLICY_UNSET,
> +				     v3d->drm.dev);
>  		if (ret)
>  			goto fail;
>  
> @@ -424,7 +428,8 @@ v3d_sched_init(struct v3d_dev *v3d)
>  				     &v3d_cache_clean_sched_ops, NULL,
>  				     hw_jobs_limit, job_hang_limit,
>  				     msecs_to_jiffies(hang_limit_ms), NULL,
> -				     NULL, "v3d_cache_clean", v3d->drm.dev);
> +				     NULL, "v3d_cache_clean",
> +				     DRM_SCHED_POLICY_UNSET, v3d->drm.dev);
>  		if (ret)
>  			goto fail;
>  	}
> diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
> index 211bd3cdabdc..320f0a720486 100644
> --- a/include/drm/gpu_scheduler.h
> +++ b/include/drm/gpu_scheduler.h
> @@ -72,11 +72,15 @@ enum drm_sched_priority {
>  	DRM_SCHED_PRIORITY_UNSET = -2
>  };
>  
> -/* Used to chose between FIFO and RR jobs scheduling */
> -extern int drm_sched_policy;
> -
> -#define DRM_SCHED_POLICY_RR    0
> -#define DRM_SCHED_POLICY_FIFO  1
> +/* Used to chose default scheduling policy*/
> +extern int default_drm_sched_policy;
> +
> +enum drm_sched_policy {
> +	DRM_SCHED_POLICY_UNSET,
> +	DRM_SCHED_POLICY_RR,
> +	DRM_SCHED_POLICY_FIFO,
> +	DRM_SCHED_POLICY_COUNT,
> +};
>  
>  /**
>   * struct drm_sched_entity - A wrapper around a job queue (typically
> @@ -489,6 +493,7 @@ struct drm_sched_backend_ops {
>   *              guilty and it will no longer be considered for scheduling.
>   * @score: score to help loadbalancer pick a idle sched
>   * @_score: score used when the driver doesn't provide one
> + * @sched_policy: Schedule policy for scheduler
>   * @ready: marks if the underlying HW is ready to work
>   * @free_guilty: A hit to time out handler to free the guilty job.
>   * @pause_submit: pause queuing of @work_submit on @submit_wq
> @@ -515,6 +520,7 @@ struct drm_gpu_scheduler {
>  	int				hang_limit;
>  	atomic_t                        *score;
>  	atomic_t                        _score;
> +	enum drm_sched_policy		sched_policy;
>  	bool				ready;
>  	bool				free_guilty;
>  	bool				pause_submit;
> @@ -527,7 +533,9 @@ int drm_sched_init(struct drm_gpu_scheduler *sched,
>  		   struct workqueue_struct *submit_wq,
>  		   uint32_t hw_submission, unsigned hang_limit,
>  		   long timeout, struct workqueue_struct *timeout_wq,
> -		   atomic_t *score, const char *name, struct device *dev);
> +		   atomic_t *score, const char *name,
> +		   enum drm_sched_policy sched_policy,
> +		   struct device *dev);
>  
>  void drm_sched_fini(struct drm_gpu_scheduler *sched);
>  int drm_sched_job_init(struct drm_sched_job *job,

