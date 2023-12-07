Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DA318091F1
	for <lists+dri-devel@lfdr.de>; Thu,  7 Dec 2023 20:55:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF4C710E976;
	Thu,  7 Dec 2023 19:55:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on2056.outbound.protection.outlook.com [40.107.102.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5361010E96B;
 Thu,  7 Dec 2023 19:55:39 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UBoFUkpAxXifJ6dnI3/LKlSqde/dkFNJCbqSMf5K07FD6+NCJTcZQtNg/N6Wjq07I8nNuVXE5FeVpfCnh/buVX701GB2OAsUBfqyAvmly69hrz5n7i67ndN6aFJwvwgaZosWHq7X1W+CpyWN8yHAI1p4ZDdHRopPx4iAWC7mSfEkoNvumlQCjs2rLixTe+gZrI2LQ6OdIgJMHDEj+lZ9LH+he4kpp37XpXYNSBrcFRk5Yhl7oKN9n913f89rtabCL++FzsfCKIjBWLWw6QAFGWFKz5JXwEHIstv2RT80MXVA++pTj22NFZXycgy8KC9IJ+kdqdGI0WKPDIYzNKskBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oBgEG26j3ZCkCU4gGkOmSKxL5uH4F95GcxMHKrmeKEM=;
 b=EnTh2z8JpYjTdabYAJk/StZQMTTgXSObWnjP3ZGN7supSw6mfDsHVQRuTu9mcGx2XA845wYue92WmVIGRDVW/t3z8ke7XW7p6dW861uvigLargULckuXuS/TfIGidA/Sz+WBVzlv0GNp3/YS2Vi0KKEmPeA092zq3Jq1PhOuqIMYycHL6R6byIds0bwLSqKifQReMcR60q83r4mKZHKTBG/Ed7M6I/o4WiywxYY3e041VwFKiPVUXo32L572kdvrulUBGn7CGiJuySFehHcg6Dx4lRlpzWMLAy7DuDSLLRlOHHIafpWTf1pxDk6nW0UaTUQjCcTnuQCBoLtkCiF1RQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oBgEG26j3ZCkCU4gGkOmSKxL5uH4F95GcxMHKrmeKEM=;
 b=In/mpVpEFWxi/NZf2MTMBehtErHjIl10UH9L8AD6BbrEEPN1/ru8FZQiSYhuEKBqClsY66REYhQ4kgJbu5VHKI51hIZnmr3jn4AkNX0FhehPcIsQcOV4iPeYcamJex+xh4GnQ7R6SQzNK8rBr/EB8wvgl7umiDmWGYvDqVACqFU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CO6PR12MB5427.namprd12.prod.outlook.com (2603:10b6:5:358::13)
 by DM3PR12MB9288.namprd12.prod.outlook.com (2603:10b6:0:4a::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.25; Thu, 7 Dec
 2023 19:55:36 +0000
Received: from CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::3a35:139f:8361:ab66]) by CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::3a35:139f:8361:ab66%7]) with mapi id 15.20.7068.027; Thu, 7 Dec 2023
 19:55:36 +0000
Message-ID: <37673144-582f-4f71-a914-39c11e75d548@amd.com>
Date: Thu, 7 Dec 2023 14:55:34 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/amd/display: fix cursor-plane-only atomic commits not
 triggering pageflips
To: Xaver Hugl <xaver.hugl@gmail.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
References: <20231207182532.19416-1-xaver.hugl@gmail.com>
Content-Language: en-US
From: Harry Wentland <harry.wentland@amd.com>
In-Reply-To: <20231207182532.19416-1-xaver.hugl@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YQBPR0101CA0182.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:f::25) To CO6PR12MB5427.namprd12.prod.outlook.com
 (2603:10b6:5:358::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR12MB5427:EE_|DM3PR12MB9288:EE_
X-MS-Office365-Filtering-Correlation-Id: 3f37fa28-4c01-4095-88e9-08dbf75e7aec
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 5xIfbfDJW11gGEu5NudvZuHc6ZRd2MJnZyoEZf9IcxKjlXXQQyLnc7iF+VDGhtsa46ZsLoSoF61gtMel2a+Xq8ruKQQ+cBHKWoM3m2uknpmZ57gsTRhdbB/v33DZ++Db7BCYsRHf9YbauFFohl62d08DLPZDmsPHOGyNgadZtsdqzZqqsWwPD1jdlogCok2hLfBoUi8WjRtK7uyswAANaCk+xlcmt5nqzjOhDHbi3FjVdRoVdHjWQ1TyhYev3xtCpljPyUKgjoneww+VBRx1hvcNcstvhMQYG+CsX9hmYA5d42X59IUFSyvJVzW1xsnBPgnh+3uA5TlSCmamcM7firvDSE5OaH5g1jTediEGwNYC4Nj4iQrjdwEDneLOgcC6HTgbkqI5CDzIQ3S4QgijdDyyr6MXZrJhKBdQMVv7CR/eJ5Q3cz2zLL0fSEceaK+NIe9XSJ61wwvXZVt+tIeFlPHGjRkOJ/RQ70Qo7UMCs9KMaGCL9CjNPaAnsFUZvcvL9mlzQz5Wei6gwqxjJkpa6MEQeyRA7DTeb/n31hdA9Rg6B8CmGYO85z2752vRt/KJjv+p2pIzsWYVaXuGu1IasMpL88903zeh2SjX4m5761UcRMsUrYsg20ky1nCGzvzXc+pJ4h7QzEtVsXSvkSfKIA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR12MB5427.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(366004)(396003)(136003)(39860400002)(376002)(230922051799003)(1800799012)(186009)(451199024)(64100799003)(41300700001)(5660300002)(2906002)(36756003)(44832011)(53546011)(6506007)(6512007)(26005)(2616005)(478600001)(6486002)(83380400001)(966005)(8936002)(8676002)(86362001)(4326008)(31686004)(31696002)(66556008)(66946007)(66476007)(316002)(38100700002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZTJkNE9kUHVnUmxZbTkzcThzTm50TWsrOGJ1ZVdqS2lvaWs0U1lrQmxVT3c2?=
 =?utf-8?B?bEFRK3lMTllUT3Jpcms4QjZqM0R0Vm5tZEF3T3pjamtyM1NkZXdYQjdrR0k4?=
 =?utf-8?B?RGFuMmNPVFphb2VldVFtaXpnQXZiQTl3L3BZaXdjR3p0MHc0THpsTTlDZGF4?=
 =?utf-8?B?Wmttd1o1TE9TNkVBUDVtL3lFRTB3azFNRnhRclBjUWN6dmlQSGJCaGFVd2pL?=
 =?utf-8?B?MlAwRGtud1MxVzkwM0tQM2FUeExsVnVYZlhxcjdpZHFqVnBzSDJnRHlob253?=
 =?utf-8?B?QXU4SnM3dkQ3ZnpDckpxZmhQZWJ4U2JCamdCWmx6UG5zR0FyMXBua21Bb0VR?=
 =?utf-8?B?am9kRFN4N3NkcWZ2M2tnZGJENHlnRUhpY05jZEp1MTlHWTZPa3E3V296M0NE?=
 =?utf-8?B?alFwMExnSDcwTnpKM2x2SER3bzY3am90M3RiRDR5dDBkZjBKOWFQZ1R4Q3dN?=
 =?utf-8?B?RTNYQVZzUkZaVWNEdlQ3cW5CNlJhNEYxelBjWUxwVXcrbkUvMG9OSit2SVhG?=
 =?utf-8?B?VktGdXlxcFhUTFVGaGxUMjBkOVd3L0tudjhVRkpVTy8rWE40OG9MNUVWZWRW?=
 =?utf-8?B?R1RVZE1vM3EranZ5cFNjc1FTTkZYdXRZandNMWZOZUgzOWdaSTdnYk9aMCtS?=
 =?utf-8?B?Qk04Q0pkYW9FOWJLaXB2TmZaNHpzRGhuZDBTYkxKMXZJYU01dFJJWjhqRlZv?=
 =?utf-8?B?ZVBTRTkremxYOEtDUHc3cGVkMkZkdFByd1lUMEtVZlJqbUIvTnYvLzl0OEw5?=
 =?utf-8?B?SGtwVTVqT2NuYVh5L1VtVGswOGFvMTEweUlWd1BkV0w1YzQ5ZkFmVmJWM0pD?=
 =?utf-8?B?M05ENmxRbGZuZWZNNFlTYlF4TnZPN0gwaXRQVCtsRGVWN3RPSEZzSi9sakZC?=
 =?utf-8?B?SytXRzlqT0syQkFYVU1ybENmbTFSMjlYUDcxdTNvSXdtM3pqNzdYeHM5azcz?=
 =?utf-8?B?MFYxaENMb054Z1pQd25HZVV5TC9QcVN2Rk82OW8zNGFaVVVKa2NrSzFWamtE?=
 =?utf-8?B?THc3ODZ1NmJkMzNkMDk2U0M4NzRBL1JaUWFHdTNTZ2F0N09qWjNQWTVsY09Y?=
 =?utf-8?B?aGJ3M2g3blB3cFlHNXhCVVhDd1d1dldtd0pqSERkRGVIOGgrK0o1K2xJODhh?=
 =?utf-8?B?YVNSNEFuQ3c5NE9pdnFNMS8ydHp2NnVjTDltR2ptU29mNVNUUGpGZmhKMEY5?=
 =?utf-8?B?cVgybmJ3NXp4U0ttS3QwclIxVDl5NjVoSUtodkVsQzN3K0dlT1FETzdnU2Fj?=
 =?utf-8?B?UGk5bEFCeVZ1MWZwcDRqLzBOSkhXaTZLMU93MFRiU0ZkSS9CYkVleHVkUVpN?=
 =?utf-8?B?UEdQcjV5V3dFTmRGSnVlRDlFcC83cmpQYjFuL2ZKandCbkJ1alFXa3h1UWpq?=
 =?utf-8?B?aUozaUN1R2tQanR6N0RqYzhzak1EMXl3aFhwYWk4WGphekZiSElGRm9WOWNJ?=
 =?utf-8?B?cW16Zllma3phTWUvbXdwaUZjQnVhSUtpVm13cXJPUk1McThSTkZvcFFWa3dQ?=
 =?utf-8?B?MEhpZ2I3N0NmNWdPNHZZR2tlSzVFeWkrbCtVT3J0T0N0c2VxZ09oS0J2UnJJ?=
 =?utf-8?B?MWNsVk5kbzd6VTBFZ2dDNEhscDI3MzFoaTNHZW1TMG15NTkzUlFQZVFyKzcr?=
 =?utf-8?B?Qlo3RWNlOXFQd0FPUVYxVjRzeWNJNmcxVWI1d3ZPNk80ejRLT1ZHTXFXV0VN?=
 =?utf-8?B?Ry9GSEFjcTBXNUNIY3V0eFRKc1hCT0EwVTlKajBrdGltL3NWKzQxeFpraDdM?=
 =?utf-8?B?eHc1UXZkMm84cFRzMTlkcmRJOHpKL2g2SHZtUWt3RkJyQmxzYi93Wmk1ZVpl?=
 =?utf-8?B?bWQ4dmZpUUoxSThRakxnK1JhbjFtbXlCVkxiS2gzZ3pKamJmaFRNN0RyYmNV?=
 =?utf-8?B?dG82ekFQTmxMdDRYMStTNUF5T0RTa0YyV0ZkTUNJQXpJb0hQWHZqUGoxMTVk?=
 =?utf-8?B?QmlpcDQyeGEzWXJoNVZzZ0I3b0h6TzcyaUtvUjg2UjJmMWFTdXcxWGhOZWEz?=
 =?utf-8?B?UzJlSjdCNkE2bURYQXBqZlFMMk9PR0tHSFRGbFhCTFE1b3Y4azlkZ2IxczJa?=
 =?utf-8?B?UytmbEVBRjhZZGVkcUk1OGNQbXhpWEdydXl5NVg5YjlkM1hsSnhhSUN6aG5y?=
 =?utf-8?Q?AHXIz5Qb0/ZLg0bHoIMoeY7lV?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3f37fa28-4c01-4095-88e9-08dbf75e7aec
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5427.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Dec 2023 19:55:36.6334 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7tXYm/Ykzh7D37rqaCOVzCOZtdYrZtST05CUpwnCbr++rA41flKBVy5Z8WVNxfjX0yf2lEl54i1JsdYvxXjxuw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PR12MB9288
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
Cc: stable@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2023-12-07 13:25, Xaver Hugl wrote:
> With VRR, every atomic commit affecting a given display must trigger
> a new scanout cycle, so that userspace is able to control the refresh
> rate of the display. Before this commit, this was not the case for
> atomic commits that only contain cursor plane properties.
> 
> Closes: https://gitlab.freedesktop.org/drm/amd/-/issues/3034
> Cc: stable@vger.kernel.org
> 
> Signed-off-by: Xaver Hugl <xaver.hugl@gmail.com>

Reviewed-by: Harry Wentland <harry.wentland@amd.com>

Harry

> ---
>   drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 10 ++++++++--
>   1 file changed, 8 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> index b452796fc6d3..b379c859fbef 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> @@ -8149,9 +8149,15 @@ static void amdgpu_dm_commit_planes(struct drm_atomic_state *state,
>   		/* Cursor plane is handled after stream updates */
>   		if (plane->type == DRM_PLANE_TYPE_CURSOR) {
>   			if ((fb && crtc == pcrtc) ||
> -			    (old_plane_state->fb && old_plane_state->crtc == pcrtc))
> +			    (old_plane_state->fb && old_plane_state->crtc == pcrtc)) {
>   				cursor_update = true;
> -
> +				/*
> +				 * With atomic modesetting, cursor changes must
> +				 * also trigger a new refresh period with vrr
> +				 */
> +				if (!state->legacy_cursor_update)
> +					pflip_present = true;
> +			}
>   			continue;
>   		}
>   
