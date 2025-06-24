Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D1871AE6600
	for <lists+dri-devel@lfdr.de>; Tue, 24 Jun 2025 15:17:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DDAC010E589;
	Tue, 24 Jun 2025 13:17:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="aTtsqT85";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02on2050.outbound.protection.outlook.com [40.107.96.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 28DAF10E589;
 Tue, 24 Jun 2025 13:17:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=d8SGj5xhG4Ql2kdfxijHhhAlGx2IDFkHozAKk7eSZc9zVHPxfkkjIALI44LZo6mvDyN0sTJ+mFDHwLgl80/PGk904EueancwFfu829/CEGXkmR80zdc41lTOAfzdT+xffHxn4BmzSJt6gSFhVo6LpmR78tAeeU5PEf0Lf+SDEvRsXKn/5AHWNxXkL8esEl0+kgFZkyVfBVVTSLD88sezePeaSB0hrH5djggBQmLOYTmXk9aDSwjoDBhfibcwOmFyrvV09DdsrSpSHZiuqxU/TfvuGlgNifuz8ncyyftsHufFDpUITqe7Z/TchAPGlGvBelusY5cMezFbS2H/QM9wpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bI8RasDg6k3RU4HJoDP/ZE8tRMKS/A/ocbeZ2qDKpEs=;
 b=fv/FrwFz5TdZrT2Fr/fEDhqMPjQ+AdZ2QpF4OqkLEgL+p4beJMT5OdP2i4GiPq5cUxpfAdbv8gn+BDO7lnJa+/zQgYLW2jcXegyHjGt1OyfmiMV2AGZPthoiMu2RrSrxvBLkMpI2FC7cUCJeadBWOLbJuLj991kD3SRufOVXvy3z/NqQcsbF0IZIknfSQgDCYzJ9ChV63oz/btIfx6YY/B3Mrw0egH/yzc8soJWkxw9StXzhU5OT2G7diXQE+BDD/fIWqfseOJIQXUV4uYBxcrO9jEuNjFmOtghe6kXqnh0K4s6Syls+XLAnTb/gkG6JR88u33S73qYM8ueghUnLag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bI8RasDg6k3RU4HJoDP/ZE8tRMKS/A/ocbeZ2qDKpEs=;
 b=aTtsqT85WNoGEHYHEhw7a24T0sUEGT8VpTakOnTXCvb9nR03xxork3wju9FA8w++v6g8k6n8ponBeiozr+yKVFiPrew1ejaUiIQ+8cGL44viZBFK9Zq+UwvMsZMzHOOJ6d9rEi+e6Te3KmDFQeelPNg76FFYhxvZYjCp7w26fls=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by MW6PR12MB8999.namprd12.prod.outlook.com (2603:10b6:303:247::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.27; Tue, 24 Jun
 2025 13:17:27 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%5]) with mapi id 15.20.8857.026; Tue, 24 Jun 2025
 13:17:26 +0000
Message-ID: <cc313e7d-a570-43e0-82c0-07c94c82e19c@amd.com>
Date: Tue, 24 Jun 2025 15:17:22 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] drm/amdgpu: Test for imported buffers with
 drm_gem_is_imported()
To: Thomas Zimmermann <tzimmermann@suse.de>, alexander.deucher@amd.com,
 airlied@gmail.com, simona@ffwll.ch, sumit.semwal@linaro.org
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
References: <20250619121635.105329-1-tzimmermann@suse.de>
 <20250619121635.105329-2-tzimmermann@suse.de>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20250619121635.105329-2-tzimmermann@suse.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0312.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f6::19) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|MW6PR12MB8999:EE_
X-MS-Office365-Filtering-Correlation-Id: e9d576cf-244d-4c38-d699-08ddb321768d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dXNDZUlzUmJSZG1YeWRWTjNpd3RtWkVXVW9UQVAycGtZMndSMEV3Q0dmT2lH?=
 =?utf-8?B?NklyNnFHUGdXcit3NXRadE5NVGRKeDI3STV1V0k5SnE4UVV0bjJCSStxK20r?=
 =?utf-8?B?SDA3WmJacWFFWUxrMjVyNE9XcEpvTUllZlUvT290bldyWTFYakx4Qkl4Nnk0?=
 =?utf-8?B?L1NoLzhINzk2WnM0cTdMOWZXMDIreUVTRXRwcXFKT1Z5TkNiMG15dXBSWXVn?=
 =?utf-8?B?S0FwUHNrdlNuU1F5bkhadUVOR1VWdjJZcTVFSllNU2hxSDg4M1ZVUU1HR3pX?=
 =?utf-8?B?L1lCWkxSd1E5WjRtclNDSXI3OVJGRzl0ejJtdFdkOENSeWNEVmdhTGk4NU9z?=
 =?utf-8?B?Qml4NzhLN09wZUNweGNiVytQV2dJWmNtZjJpUmlOZlk1YTFzWWltM0NINDB5?=
 =?utf-8?B?WW9STnRaZHE5Y044QmtmRkRUZGlJK1hsY2xlMmlHeVdGeVNrbE5XNGFsVlhZ?=
 =?utf-8?B?b1czTGxyQ0ZJeUhkZ1g5bWhGTHd4eFZhdnRJRWNLa0Qwb2ltQmJhN1BWTis0?=
 =?utf-8?B?eGhOQ2lQRVFBK0dENm9BYlNuWWlYYXBqTGRibVhhcm1PTFcvcHhsYUZYNU50?=
 =?utf-8?B?eERZcU9FNTJSNW01Q0hYM2MvTnNKRjBVMmk0VUFQYmE3djVNRDE5cjRnRkd3?=
 =?utf-8?B?dlloWnFOZFZzbG1Zay9TUFoxZ09nVzRzZmJXWjVFS1BMNWN5K0F5dlc2U3pZ?=
 =?utf-8?B?aHBrSGNFa0FtcUtWV3VBSTJSUUt2bHlzWDNSUmRmVnJ3bkNWZmZ3eHhIMUR4?=
 =?utf-8?B?WVY4WC9jRDhtNy9LMDduM0x1ZFlOOTFZZ1RrRnVoa0lBMnBLbFFNRmlwYkNH?=
 =?utf-8?B?SmhBc3pkRlVHYWpDUW1xbFBvWmw5QUZ2ampqM29tWXM2NWlLWUhoeWhJWFJM?=
 =?utf-8?B?MWpYK3JHMDhlcXAyOTZZdkk2NDhOd1VjbHYwT2RRNFVsWE8xVG9LUWlPemgr?=
 =?utf-8?B?d0Q3RisyazdYcTdCdnMyTkdudldiWTM3QnpTYXpFb0FKazJ0WmRsdUwwSVZ2?=
 =?utf-8?B?V0cwTENRdis0dlYwVkdwNmFwN1h5K0FtODJ2ald2RkRmMmQ3cnIyK2pQK1lt?=
 =?utf-8?B?MlhHN05zNWZlMXNEZVd6dlljcm1HWHNaNE5SY1ZpOUVRcEQxM3VQdDhCODA3?=
 =?utf-8?B?T1lvMVAvR2s3UkRhVWlmcVY0WVFTc0lzRHVjUHdOT1VJemJOclp4VzVsZU1n?=
 =?utf-8?B?azFNV0xmMmkrYW1vemw0b0FVZmhVZFowUVdiQjlJMXE4ZXlvTklGeVhQK1JJ?=
 =?utf-8?B?bzlYVTdXbzdhL3Q4TDlVZGE1OXBhbjdreHdyRCtLcVRmT3lYcFlaeGRHekJU?=
 =?utf-8?B?QUx3aGg5VnZtSWdkWXBYZ0RDMk9xYWp0d0lFcjVIbWRXcjdoOUorYWFDS2F6?=
 =?utf-8?B?dGVaVkJwajhKcjFzdHBTTWp4NGc0ZVpoWXQ3a3BLY0pSYWRBOWUrd3B6OVhv?=
 =?utf-8?B?Q2NlaGJweS9VbzBJemZ4NTVCV0lSUVBMOStvUmhEbGVXbFRFd3lMNytBWU1w?=
 =?utf-8?B?am5NbFIrZGorSFRVenNsUFpWVGdYVW51TkdpcWFnTkpuajl1cHo1Nk95Z0E1?=
 =?utf-8?B?SktyVk91eDFJMnJuUkFta2FqQnU0TnRxcWFEaGxDbkgwdytXRXk4TzM2VHRl?=
 =?utf-8?B?UytUeVV1TjVUTzFxa2pnSzBGL2JDMHhmWXpNaXVWMWFKTTRXclZMVmxGT3dY?=
 =?utf-8?B?Y016ak50SUN6TG1QTHd5NjZGaitOL2poblNHOU5jZE5qTGFIT0pkaGhiQXhS?=
 =?utf-8?B?SjJuZzRzWHNnN0UzZDVXaVd1WUZnekZKWFBsVHNNNzFMRDRPWGFmOVY2bUpr?=
 =?utf-8?B?c3h2YXFPL25aUkNWSFF2MndkTWIxWjQvUGhjOENqQXh3L3YwMGw2UTl4d1Y4?=
 =?utf-8?B?aXFlK3QvTzBjY3FOSzU1WU82dmpNVnJPOFNXbU43SnpvSjFSUFVZeENEc3cw?=
 =?utf-8?Q?om7b4gBH2MQ=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VStVYlBvZW1VdG5Nb2luaHNzeFhNTnVpUjFKUTk3TWxPRisyNUFEOVBGVzBo?=
 =?utf-8?B?a2w4T1I5QXlsRUtmRzlrVE05bHV6NkpMM0dvbnBPL3RqTzdMaVRzWENMVUhi?=
 =?utf-8?B?R1VGMS9kL1Nxcm50NTZVeThTbHVETnFDcm1leTMvcVd3MlUxc3ZqWE5ZZG0w?=
 =?utf-8?B?aEc2UEprTXViV1NUb2JsTnQzK0t4QlJpbGdXTG9icmFhbVc4VDNvZ3RpUWhW?=
 =?utf-8?B?VFBBVjBmdGNxb1BXYnlMWXpxOXJYOWtlcExHM1lKdlErT2pqMXJFYWswU3Jt?=
 =?utf-8?B?N2U2MEVpMXlhWE01a3pFZmJnSjdGQVoyUG9IQlRoQm5ZSGpXem1NR3Fubkp5?=
 =?utf-8?B?cmpndm4zajRyeFZyMmJOZWI4Mys2NjI5NzMxMFFseE8yU2JjRm9Va2lMdm1s?=
 =?utf-8?B?RmpqYUZ2YjZyNnRJUDRKM0RvdGxzVGFlditNVzB1enZJdjlZSWZhTFhwaDBX?=
 =?utf-8?B?NEZEaUEwRnhiTldZU3dZbldydEI5SHUzRG9kYUN1bXZ3UnVQR3kwaXg1MXd3?=
 =?utf-8?B?aG5TRmdmalRRU0lFczJsRzhjb1BHR1FkVE91SzBTeWFMbjRqZERpUW53bm4w?=
 =?utf-8?B?bGZKdzVRNUlWaVphV2l6RjZNOFJuM24rRzRIK0FsWkNjem1UbWlvQzFwS29W?=
 =?utf-8?B?a3JpZ1dHQ21wTFNITmpyY3M1T2VkSnFNcXlOczFqSDMzckpXSXNNOGR3ajlz?=
 =?utf-8?B?a1l2WEtmZW1iVW5VRFQ3djlJS3VOUVErNjNpM1RSbGdZZFovdnIyL2phbFJ1?=
 =?utf-8?B?d1hpYml5SGJZZlBENlZ2U0VPZEplSmtvZTFUTHR3emRkanpnbmpmd3NRci9p?=
 =?utf-8?B?RXBYRmJDenR1RkN6VEYrSXQ4LzJTMi8vSytLd2I1ZmFVcXlpZUJFQ1N5UXc1?=
 =?utf-8?B?QU5zYmtHMFh6TzEwMG52TmpRenB6V1p3YzQzdzEzR1FWU05SOVhFbFp3czBk?=
 =?utf-8?B?bDVqYmdxb1Jta29ncVJvWGJDOHlvZllnbzk3T0NSL3c2eVdSc3ZROTJxaDFm?=
 =?utf-8?B?VFNPUHU4UCtwNHJvd3NubTFxa1RnRHZUUndjcmlkNUpnTTYrbGxxaWxreVFU?=
 =?utf-8?B?WjBlWno1TlgwV3pUdFF2bmUxNVloTEtKR3ZwQWZFVjFzaUowSE9SdlJleFlp?=
 =?utf-8?B?eUNBdU1wZW9BbllzUlo2RXZ3U0pXSXFwQm9JbFdVSFYxbnE2TGtuLy91ZENM?=
 =?utf-8?B?L1p2dkE5dHJLbzVvL01wQnVmeUVzTGV1TUcwd0xHNG1lbHpxRlRPamhtQmU5?=
 =?utf-8?B?T1BqUHVYWGtxWUVIRnNsS1lZOEtvaHdDVXQvR1lrL3JDMHBYS25aSHduTDBv?=
 =?utf-8?B?Q0xqenBOSGFObThCajQ3RHpxdERyNlI3YS9pZTBKdmZhSk1yUkJzVWhZRi9L?=
 =?utf-8?B?RmRrUXhBWGNIOHBTUVhZN1hnTm94SFUwUGxlTVhnYlduWjYvS2YxMmN0L0Qv?=
 =?utf-8?B?YWFIWjF2RjhlU2V6L1dKeVhOOHN3ZFFHOUdpaUp3ZzRTUWhHSmkrOXJWdXhK?=
 =?utf-8?B?c3F2WEwvRmRyejUwV3A5VlFpOFFWeHVMSDN1b3JiRThNWmJwMFRZM3R0cGdX?=
 =?utf-8?B?QjFFcCt5SWVyU3N4NEVKd1BQSHhmSHZnbkVCU0R4YmVtdWtFZHd2V2t1VDhY?=
 =?utf-8?B?L2QzR05sM05TWlVIeEozbDc2TGdyY3VyaVVFYmR4dGMzaDF5MUFlcitPZHV2?=
 =?utf-8?B?M1F0d2poRTl5T0FUVGVDaWRtZGZmam9lM3dKMDhCN2NjR1VUcVhDUDhJQXhU?=
 =?utf-8?B?eW83TGdmOElYYkdqTWVKellTMzM0YVhDbVBLVWgwSEdsQzNuV3NsRUFYM2Zz?=
 =?utf-8?B?cHFVWmlnbVp6bW96OXF2b3I0Sk05aytyYnJaNDYzNWZwYjJUS1dobzl1V0Vi?=
 =?utf-8?B?bCt1aW85dUlZTjh2U1VFRitobHlOQk9TTTlvWW5tWTJzUFBTUTkwYW5pR1Mz?=
 =?utf-8?B?STJTL1pRR0xLWVkyVFMxRnlJb1cydThDTVp3ckpueW80RGRESEVFSElXVmc5?=
 =?utf-8?B?akNJamFxTHdBVk1weGo4eDRiUlVKQWZhVEpqaUZTS242d2I3a3kvbUxZYWVo?=
 =?utf-8?B?VjR2ZjBBY0laRllOREE4MzA1NWx0Y2RIY3BFZk9mazNtSk1uQnRNMWpKMGh4?=
 =?utf-8?Q?z3zbYkN8TBgKGTwC5kQbGSYWl?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e9d576cf-244d-4c38-d699-08ddb321768d
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2025 13:17:26.3616 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 99r7JGwtwFMPZ28/QffnHI+So/4x/UHylvadqLbpyGgCL9d1RIhZIQ+d2u3Uv99m
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR12MB8999
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

On 19.06.25 14:15, Thomas Zimmermann wrote:
> Instead of testing import_attach for imported GEM buffers, invoke
> drm_gem_is_imported() to do the test.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_display.c |  2 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c |  2 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c     |  4 ++--
>  drivers/gpu/drm/amd/amdgpu/amdgpu_object.c  | 14 ++++++--------
>  drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c     |  2 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c      |  4 ++--
>  6 files changed, 13 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c
> index 35c778426a7c..9e463d3ee927 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c
> @@ -1317,7 +1317,7 @@ amdgpu_display_user_framebuffer_create(struct drm_device *dev,
>  	/* Handle is imported dma-buf, so cannot be migrated to VRAM for scanout */
>  	bo = gem_to_amdgpu_bo(obj);
>  	domains = amdgpu_display_supported_domains(drm_to_adev(dev), bo->flags);
> -	if (obj->import_attach && !(domains & AMDGPU_GEM_DOMAIN_GTT)) {
> +	if (drm_gem_is_imported(obj) && !(domains & AMDGPU_GEM_DOMAIN_GTT)) {
>  		drm_dbg_kms(dev, "Cannot create framebuffer from imported dma_buf\n");
>  		drm_gem_object_put(obj);
>  		return ERR_PTR(-EINVAL);
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c
> index 44e120f9f764..5743ebb2f1b7 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c
> @@ -513,7 +513,7 @@ bool amdgpu_dmabuf_is_xgmi_accessible(struct amdgpu_device *adev,
>  	if (!adev)
>  		return false;
>  
> -	if (obj->import_attach) {
> +	if (drm_gem_is_imported(obj)) {
>  		struct dma_buf *dma_buf = obj->import_attach->dmabuf;
>  
>  		if (dma_buf->ops != &amdgpu_dmabuf_ops)
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
> index e5e33a68d935..d1ccbfcf21fa 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
> @@ -317,7 +317,7 @@ static int amdgpu_gem_object_open(struct drm_gem_object *obj,
>  	 */
>  	if (!vm->is_compute_context || !vm->process_info)
>  		return 0;
> -	if (!obj->import_attach ||
> +	if (!drm_gem_is_imported(obj) ||
>  	    !dma_buf_is_dynamic(obj->import_attach->dmabuf))
>  		return 0;
>  	mutex_lock_nested(&vm->process_info->lock, 1);
> @@ -1024,7 +1024,7 @@ int amdgpu_gem_op_ioctl(struct drm_device *dev, void *data,
>  		break;
>  	}
>  	case AMDGPU_GEM_OP_SET_PLACEMENT:
> -		if (robj->tbo.base.import_attach &&
> +		if (drm_gem_is_imported(&robj->tbo.base) &&
>  		    args->value & AMDGPU_GEM_DOMAIN_VRAM) {
>  			r = -EINVAL;
>  			amdgpu_bo_unreserve(robj);
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
> index 73403744331a..989181e5f8e6 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
> @@ -62,7 +62,7 @@ static void amdgpu_bo_destroy(struct ttm_buffer_object *tbo)
>  
>  	amdgpu_bo_kunmap(bo);
>  
> -	if (bo->tbo.base.import_attach)
> +	if (drm_gem_is_imported(&bo->tbo.base))
>  		drm_prime_gem_destroy(&bo->tbo.base, bo->tbo.sg);
>  	drm_gem_object_release(&bo->tbo.base);
>  	amdgpu_bo_unref(&bo->parent);
> @@ -939,7 +939,7 @@ int amdgpu_bo_pin(struct amdgpu_bo *bo, u32 domain)
>  		domain = bo->preferred_domains & domain;
>  
>  	/* A shared bo cannot be migrated to VRAM */
> -	if (bo->tbo.base.import_attach) {
> +	if (drm_gem_is_imported(&bo->tbo.base)) {
>  		if (domain & AMDGPU_GEM_DOMAIN_GTT)
>  			domain = AMDGPU_GEM_DOMAIN_GTT;
>  		else
> @@ -967,7 +967,7 @@ int amdgpu_bo_pin(struct amdgpu_bo *bo, u32 domain)
>  	 */
>  	domain = amdgpu_bo_get_preferred_domain(adev, domain);
>  
> -	if (bo->tbo.base.import_attach)
> +	if (drm_gem_is_imported(&bo->tbo.base))
>  		dma_buf_pin(bo->tbo.base.import_attach);
>  
>  	/* force to pin into visible video ram */
> @@ -1018,7 +1018,7 @@ void amdgpu_bo_unpin(struct amdgpu_bo *bo)
>  	if (bo->tbo.pin_count)
>  		return;
>  
> -	if (bo->tbo.base.import_attach)
> +	if (drm_gem_is_imported(&bo->tbo.base))
>  		dma_buf_unpin(bo->tbo.base.import_attach);
>  
>  	if (bo->tbo.resource->mem_type == TTM_PL_VRAM) {
> @@ -1263,7 +1263,7 @@ void amdgpu_bo_move_notify(struct ttm_buffer_object *bo,
>  
>  	amdgpu_bo_kunmap(abo);
>  
> -	if (abo->tbo.base.dma_buf && !abo->tbo.base.import_attach &&
> +	if (abo->tbo.base.dma_buf && !drm_gem_is_imported(&abo->tbo.base) &&
>  	    old_mem && old_mem->mem_type != TTM_PL_SYSTEM)
>  		dma_buf_move_notify(abo->tbo.base.dma_buf);
>  
> @@ -1576,7 +1576,6 @@ uint32_t amdgpu_bo_get_preferred_domain(struct amdgpu_device *adev,
>  u64 amdgpu_bo_print_info(int id, struct amdgpu_bo *bo, struct seq_file *m)
>  {
>  	struct amdgpu_device *adev = amdgpu_ttm_adev(bo->tbo.bdev);
> -	struct dma_buf_attachment *attachment;
>  	struct dma_buf *dma_buf;
>  	const char *placement;
>  	unsigned int pin_count;
> @@ -1631,9 +1630,8 @@ u64 amdgpu_bo_print_info(int id, struct amdgpu_bo *bo, struct seq_file *m)
>  		seq_printf(m, " pin count %d", pin_count);
>  
>  	dma_buf = READ_ONCE(bo->tbo.base.dma_buf);
> -	attachment = READ_ONCE(bo->tbo.base.import_attach);
>  
> -	if (attachment)
> +	if (drm_gem_is_imported(&bo->tbo.base))

Mhm we did that here for printing BO information without taking a lock.

That isn't 100% clean since the backing DMA-buf could be destroyed in just that moment, but since it is only used for debugfs hasn't bothered anybody so far.

Maybe putting this in an RCU critical section instead of the READ_ONCE would help? The underlying file is RCU protected.

Apart from that looks good to me.

Regards,
Christian.

>  		seq_printf(m, " imported from ino:%lu", file_inode(dma_buf->file)->i_ino);
>  	else if (dma_buf)
>  		seq_printf(m, " exported as ino:%lu", file_inode(dma_buf->file)->i_ino);
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> index 9c5df35f05b7..6ce45278d69b 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> @@ -1060,7 +1060,7 @@ static void amdgpu_ttm_backend_unbind(struct ttm_device *bdev,
>  	/* if the pages have userptr pinning then clear that first */
>  	if (gtt->userptr) {
>  		amdgpu_ttm_tt_unpin_userptr(bdev, ttm);
> -	} else if (ttm->sg && gtt->gobj->import_attach) {
> +	} else if (ttm->sg && drm_gem_is_imported(gtt->gobj)) {
>  		struct dma_buf_attachment *attach;
>  
>  		attach = gtt->gobj->import_attach;
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
> index 0ff95a56c2ce..04100d4dea03 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
> @@ -1271,7 +1271,7 @@ int amdgpu_vm_bo_update(struct amdgpu_device *adev, struct amdgpu_bo_va *bo_va,
>  	} else {
>  		struct drm_gem_object *obj = &bo->tbo.base;
>  
> -		if (obj->import_attach && bo_va->is_xgmi) {
> +		if (drm_gem_is_imported(obj) && bo_va->is_xgmi) {
>  			struct dma_buf *dma_buf = obj->import_attach->dmabuf;
>  			struct drm_gem_object *gobj = dma_buf->priv;
>  			struct amdgpu_bo *abo = gem_to_amdgpu_bo(gobj);
> @@ -1631,7 +1631,7 @@ int amdgpu_vm_handle_moved(struct amdgpu_device *adev,
>  		 * validation
>  		 */
>  		if (vm->is_compute_context &&
> -		    bo_va->base.bo->tbo.base.import_attach &&
> +		    drm_gem_is_imported(&bo_va->base.bo->tbo.base) &&
>  		    (!bo_va->base.bo->tbo.resource ||
>  		     bo_va->base.bo->tbo.resource->mem_type == TTM_PL_SYSTEM))
>  			amdgpu_vm_bo_evicted_user(&bo_va->base);

