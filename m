Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B2F4D7AEF98
	for <lists+dri-devel@lfdr.de>; Tue, 26 Sep 2023 17:25:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 66B3B10E3F5;
	Tue, 26 Sep 2023 15:25:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on20621.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7eaa::621])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9594110E135;
 Tue, 26 Sep 2023 15:25:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aFdhRiS0WGY+WVeXy/sNGZvVP/WnzbjIlE/6WWlSGCbYcbjyLo2NarvLLc6aTCvbk5stuV2ao01dgitvy5tgofb6UT+E1WPnLEaIS2mEzIzpzR6VmuuyzoCQSyKTMUkS/XPqoQpZj5i6NRsHfavVtC8NGRvsLt99Aeiij0H1cLg48+RSIzEeXJDw8NZKni65bq3sV8K1e0gRPZB0qgmqZgPoAAiYDYDi11OE6XoiHBd4rgI8Wi9nI/vtUIzuZwMUxgGsvEoiGJvS8dAkh/Pf26OlPaZzUubH0Y4iGHf4kA/h6egSSrZXWZE6gFmOucIxGKk1zo4qjPZPBbdI63vb+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=C5d6Wgr7Bcl8RwKReiyyZSOWcURvDBCApKX4H5+FPsQ=;
 b=XaxPxzicq53pcDgNjacyfBrgc1Sz9EUWC86qkNhFDu6rHb8252rHOgv6kFJny5TwlDyjru4UgvmR6VRye5Zt9WXxb7UsfF2kJ4in8b9x2lykOHqthnK3pxdKfviU3MrYpZIi3GmwZ9iMROrmHrIVfQnX5RZ7RUnAgiADtNdEYY6qo9BOdmDM/flsOrU2i9HmuLo1FYCD6eQ5JbtIFrUne9QnOxWxXuMphPs4ezlcmst8QOsy875fRv65cQtWv2j1H6Pr0tZApZIKhgmIejJMzvV1/EI1FFlGOigxqOwvrxW4Sv4ZJcFB+HdQby1/+c0F4T1WZdGajeAv1t2qZMqyjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C5d6Wgr7Bcl8RwKReiyyZSOWcURvDBCApKX4H5+FPsQ=;
 b=D/MCqvjIRLA+jD0v554A6WtSB6n1opSct1e6UtwpM5tYOukJRSicV3dQ990wdXxmnJ4olD1iQXyuoAkaVLQtHTMmhkz2fguE463OZYN3LdOD/v2Xh2z4D6QKuU8XntM0yg9uav7g7iC2FHJ3upphl2KQc5X7H6uX2AstybfD6pU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CO6PR12MB5427.namprd12.prod.outlook.com (2603:10b6:5:358::13)
 by DS0PR12MB9398.namprd12.prod.outlook.com (2603:10b6:8:1b3::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.20; Tue, 26 Sep
 2023 15:25:47 +0000
Received: from CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::121e:5e68:c78a:1f2f]) by CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::121e:5e68:c78a:1f2f%3]) with mapi id 15.20.6813.018; Tue, 26 Sep 2023
 15:25:46 +0000
Message-ID: <a9503013-989f-47c7-a879-e862868ea23d@amd.com>
Date: Tue, 26 Sep 2023 11:25:41 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC v6 00/10] Support for Solid Fill Planes
Content-Language: en-US
To: Jessica Zhang <quic_jesszhan@quicinc.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Clark <robdclark@gmail.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>
References: <20230828-solid-fill-v6-0-a820efcce852@quicinc.com>
From: Harry Wentland <harry.wentland@amd.com>
In-Reply-To: <20230828-solid-fill-v6-0-a820efcce852@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YT4PR01CA0381.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:fd::14) To CO6PR12MB5427.namprd12.prod.outlook.com
 (2603:10b6:5:358::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR12MB5427:EE_|DS0PR12MB9398:EE_
X-MS-Office365-Filtering-Correlation-Id: 9feb17cc-2dc1-4936-3048-08dbbea4db63
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: qMp9ELiVL7wBeSttIE54CI0gHD+jM3C2siodcfBqMl5UvlVchQ3ScR1fYQC/7WhM5E+SDouTjoPs6ZzFQfny7xnSwboJmR47FsRP/Hlc+j1hQHzecAGYkA31vW8P6WMvyk/l/FZOHX9whxcxdQRGjNgheA1bJkAgLJB6Z0c5zNUSmxxJSFBMPuuqKFVxjvZN+kcp6mGkTdb24AUrmy6enBFOUQgOoxoQqk9n9/SSX8Ue+0/0VSL8ZZi3zWfn0boJkF5Nhjy5I+J9Ja/rZMWQPAaizypM5NT1sYMqsGllqFrUCz2jbGt5WQS5TrVitpgkLL0X8/HvCA57A2j2mS7XLUjgF6vpQkAy5yVH20Y0/Iz0PdcPvcvOZLjOShl8wHcNnKaiSc0mROr0G2ipHIRrE7yNOhARbxwQU3mwUWI95dBlvgiuLPKQ9w/crWPJDGwvAq/6oy6427tiP6RVZAOyXLsbarndOeOngIL26S82k4ftLoitvU6XnXRa97/8SAmPJ1s7ZCKVopNXvAPOQb5+eXJKmIQhuMLUmPRvmYwBr2OoUHF+e+BuIUD/v7K6nAK9ass/2i8KNXJzZo5Ka7NDZCve+ppPaiM+31q/lieEactG65LPjJTIc+maF3gT3Z7XTGEaD+C2G5lWi6NU4qEsytmvwepCwT/8Yx3quqNum65PyBhvFjc16z4YfHgvQN1i
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR12MB5427.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(396003)(366004)(346002)(376002)(136003)(230922051799003)(451199024)(186009)(1800799009)(86362001)(2616005)(4326008)(6512007)(6506007)(316002)(53546011)(110136005)(66946007)(478600001)(38100700002)(26005)(6666004)(966005)(66476007)(921005)(66556008)(44832011)(8936002)(8676002)(2906002)(5660300002)(36756003)(41300700001)(31696002)(6486002)(7416002)(31686004)(83380400001)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dE9wSkVKOTh4eU5hcDRYREltSkVGUFdRK241Ukw1c0hhdkVkdkFqZWR0UUZq?=
 =?utf-8?B?TklHVGdmUDA0MWZnT0hJV2JlNHNzL0M1RkZjK25rSnVNMzZ1dlI4WUxKQzla?=
 =?utf-8?B?SkJLcm1GTXhsL3I1RUpDdWhWcnprZWNtcjBybkM5RWY1UWMrd2xvakFJT04y?=
 =?utf-8?B?SHFWVzdNeTRjY0xDVmgyaGRpQWo3VEUvTnowK3Rodkt4K1ZJTVdVeEhzTU1T?=
 =?utf-8?B?Z2RLTDAvN3pYRkE0ZWJibklTUEJ3dDZoZytiWEt1MjF0TFFvNW5sTDVDTzIr?=
 =?utf-8?B?TTFFSFFUZEVqSU5Gb2pkUWFIRTZmRnhIdG1NRTVRZytUVEZ0QTF0QUFwVVVU?=
 =?utf-8?B?cDVxREZTRnBsZW9Jd055eVBNOHI0SUMvMHFyeEJkbzJtbFBBQWpLT1hPbXQy?=
 =?utf-8?B?UXVYSlFmZTUveHZod0oySVBTVDRuZDZ5Rkp4dzRNZ1IwK3RYTFdIaWl3ay9l?=
 =?utf-8?B?TGx5UCtrNlhHK3g4RXk4UFI2Tk9nUWlGaVh6VXRZMnJLWmpVVGFXbkYyeFJa?=
 =?utf-8?B?YzlHUWlEanhyYURQTnozRDFIMmtjcUFzYUJIKzY3OTJTOGpBakY5dU9iN1pK?=
 =?utf-8?B?QVg5WUNkV0x6ZzYvRG4vWU1CZGhQTHZJMDRjZ0hwaEtYMENSSmM4azd3MmJw?=
 =?utf-8?B?dk9ad1ZyVXZXK0dyS1BqWFk1ajNXZVZHYnVqMVZXM0tPM3Z4NEZXQXRUVHhF?=
 =?utf-8?B?dk5PdVEva0o2d1IzNEZEVHFOZGhSYjdHSEtMMkZ2Ky84aW9LV1ZOWm1nNTFL?=
 =?utf-8?B?SGRMbWM4YlV6eXgwcXFXaXQxRFZsNW9XdTFZK1liYTlCTVcySVlBTkNBa1ZL?=
 =?utf-8?B?bFNqd2o2T0dHNzNSeld1aUN5Tkt4VG1NMlh2eEFicXNtR0EwQ3VFL0NkSlNk?=
 =?utf-8?B?YU80dDllOENLL1RqdW9vMDg2bnRnYzhtWVB1emEwRmVLK0JqMytzWitzZG1w?=
 =?utf-8?B?K0Y3ZHpGRHdmVWdUVjBVMUpCYTFmRXFDdU9kRGtFdkVXTkJpa3d4NGJlcHor?=
 =?utf-8?B?K1N3VXZibE9iTWRQU0NSQi9NM1RJRTJXd1BBK3BUSEpRSVFiNUVFaTRlWFhM?=
 =?utf-8?B?Z1loNEh2YkJFVnoybDV4eWFkY2dmem4zTGdDTTFlVVRqUisxU0VTZ1IwWW9L?=
 =?utf-8?B?NUtyUXdBeGlIZm83enkzQmVoWmtqbjFNTlBIRVJ2QVc0Z05kUVNnc1RhTFlo?=
 =?utf-8?B?NHN4QzE4NDdubEtGVE10cTFRMy9mZm9wZEpOWmVxaU1yNHp1MHNWdTlKNkxu?=
 =?utf-8?B?NGZib2U1eE5aYUJZOENoLzU4MWk4MEtvdEV4VFlMN3VqclJaRlJGRWVxMTJh?=
 =?utf-8?B?L1NNQmdKMy91QXRCanpsNDNzVnZRdVdkMEFOTlVhSmw0c3lqMzRJVjFxRmNp?=
 =?utf-8?B?cjl0TWczK1NqR2pSVzYvazZtY1NGOWNzUDIxdnB2V2VEaTlnL21sdEE2OExG?=
 =?utf-8?B?N2diQndIVGVxNUVUQmtXaysrYXozcmxrRCt4Nk93akZ2RWMxMmFaNkY0ZVh3?=
 =?utf-8?B?dVN6TnRsYi9qeHVvbUEzY3N2VHgrT0ZiYXRwUkxZbHNOUytnSzlzQjVhZXk1?=
 =?utf-8?B?V3lTOU5ycmxwSmZ3ZzRwS210Mmo1VmROWnVJeFV0MEJwN08weFJLbGpRdUpj?=
 =?utf-8?B?bTljblNaZVdpZFZ2cnR4aTh6SWQ3UGhZUmt5Sm44MzREWnlwaW9jVEVmeDJD?=
 =?utf-8?B?Q0t1THJ1SlhXREQ4Z08rU0poMHo0aTJkUEhFWkN2cUc2K3V4NDkxRDZpbWt1?=
 =?utf-8?B?Y296QkNPaEZ2OTJrcmd4M3RXWU41N0Q4NW9IUXZwdHhpQjl0YU16K1l2OGpt?=
 =?utf-8?B?b2xXdzBXUUw0QXF0OFdnTHNsQlQ3ZlZxN0dQdlZIOCtmNUMwa3J2QW5MbTZ3?=
 =?utf-8?B?cHVhc3IyMWhYQmM2c21oSm9jZThpSEJoVkFsNFZ6a3lTTmxIS3JSN1ZrOHVy?=
 =?utf-8?B?M3VZbjEzaDAySTlOb0tEaUFqOEl0WVBkVEtyK3phTmlXTmdrUDF3K1hKM2RP?=
 =?utf-8?B?VkE2K2htVmNsc3dEcnZCTWt0MDc3SmRaZE4vRmRDd2xDSWZad0ZKaXJZTjlY?=
 =?utf-8?B?Nk5PRWxXUEZkNFdQcjE0c0lDY0ZRWEVuU1I2aFM1aVNGc014M3M5UHhSRUh0?=
 =?utf-8?Q?h6Pg3LDNQBnHd5N/miiTR12f2?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9feb17cc-2dc1-4936-3048-08dbbea4db63
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5427.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Sep 2023 15:25:46.9314 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9qMgudK45y6bQCK3y28UcYsMUtWq1aMaYxkPJPiKRSXooiM7R74jYJarYl4eBlK+i/p6fBw7p+2L3eIQUxuu4w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB9398
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
Cc: sebastian.wick@redhat.com, linux-arm-msm@vger.kernel.org,
 quic_abhinavk@quicinc.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, ppaalanen@gmail.com,
 laurent.pinchart@ideasonboard.com, wayland-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 2023-08-28 20:05, Jessica Zhang wrote:
> Some drivers support hardware that have optimizations for solid fill
> planes. This series aims to expose these capabilities to userspace as
> some compositors have a solid fill flag (ex. SOLID_COLOR in the Android
> hardware composer HAL) that can be set by apps like the Android Gears
> app.
> 
> In order to expose this capability to userspace, this series will:
> 
> - Introduce solid_fill and pixel_source properties to allow userspace to
>   toggle between FB and solid fill sources
> - Loosen NULL FB checks within the DRM atomic commit callstack to allow
>   for NULL FB when solid fill is enabled.
> - Add NULL FB checks in methods where FB was previously assumed to be
>   non-NULL
> - Have MSM DPU driver use drm_plane_state.solid_fill instead of
>   dpu_plane_state.color_fill
> 
> Note: The solid fill planes feature depends on both the solid_fill *and*
> pixel_source properties.
> 
> To use this feature, userspace can set the solid_fill property to a blob
> containing the appropriate version number and solid fill color (in
> RGB323232 format) and and setting the pixel_source property to
> DRM_PLANE_PIXEL_SOURCE_COLOR. This will disable memory fetch and the
> resulting plane will display the color specified by the solid_fill blob.
> 
> Currently, there's only one version of the solid_fill blob property.
> However if other drivers want to support a similar feature, but require
> more than just the solid fill color, they can extend this feature by
> creating additional versions of the drm_solid_fill struct.
> 
> This 2 property approach was chosen because passing in a special 1x1 FB
> with the necessary color information would have unecessary overhead that
> does not reflect the behavior of the solid fill feature. In addition,
> assigning the solid fill blob to FB_ID would require loosening some core
> drm_property checks that might cause unwanted side effects elsewhere.
> 

I didn't have a detailed review of this patchset but at a high-level this
change makes sense to me.

Feel free to add my
Acked-by: Harry Wentland <harry.wentland@amd.com>
to patches 1-5.

Harry

> ---
> Changes in v6:
> - Have _dpu_plane_color_fill() take in a single ABGR8888 color instead
>   of having separate alpha and BGR color parameters (Dmitry)
> - Drop plane->state->pixel_source != DRM_PLANE_PIXEL_SOURCE_FB check
>   in SetPlane ioctl (Dmitry)
> - Add DRM_PLANE_PIXEL_SOURCE_NONE as a default pixel source (Sebastian)
> - Dropped versioning from solid fill property blob (Dmitry)
> - Use DRM_ENUM_NAME_FN (Dmitry)
> - Use drm_atomic_replace_property_blob_from_id() (Dmitry)
> - drm_atomic_check_fb -> drm_atomic_plane_check_fb (Dmitry)
> - Group redundant NULL FB checks (Dmitry)
> - Squashed drm_plane_needs_disable() implementation with 
>   DRM_PLANE_PIXEL_SOURCE_NONE declaration (Sebastian)
> - Add comment to support RGBA solid fill color in the future (Dmitry)
> - Link to v5: https://lore.kernel.org/r/20230728-solid-fill-v5-0-053dbefa909c@quicinc.com
> 
> Changes in v5:
> - Added support for PIXEL_SOURCE_NONE (Sebastian)
> - Added WARN_ON() in drm_plane_has_visible_data() if pixel_source isn't
>   set (Dmitry)
> - Added debugfs support for both properties (Dmitry)
> - Corrected u32 to u8 conversion (Pekka)
> - Moved drm_solid_fill_info struct and related documentation to
>   include/uapi (Pekka)
> - Changed drm_solid_fill_info.version to __u32 for data alignment (Pekka)
> - Added more detailed UAPI and kernel documentation (Pekka)
> - Reordered patch series so that the pixel_source property is introduced
>   before solid_fill (Dmitry)
> - Fixed inconsistent ABGR8888/RGBA8888 format declaration (Pekka)
> - Reset pixel_source to FB in drm_mode_setplane() (Dmitry)
> - Rename supported_sources to extra_sources (Dmitry)
> - Only destroy old solid_fill blob state if new state is valid (Pekka)
> - Link to v4: https://lore.kernel.org/r/20230404-solid-fill-v4-0-f4ec0caa742d@quicinc.com
> 
> Changes in v4:
> - Rebased onto latest kernel
> - Reworded cover letter for clarity (Dmitry)
> - Reworded commit messages for clarity
> - Split existing changes into smaller commits
> - Added pixel_source enum property (Dmitry, Pekka, Ville)
> - Updated drm-kms comment docs with pixel_source and solid_fill
>   properties (Dmitry)
> - Inlined drm_atomic_convert_solid_fill_info() (Dmitry)
> - Passed in plane state alpha value to _dpu_plane_color_fill_pipe()
> - Link to v3: https://lore.kernel.org/r/20230104234036.636-1-quic_jesszhan@quicinc.com
> 
> Changes in v3:
> - Fixed some logic errors in atomic checks (Dmitry)
> - Introduced drm_plane_has_visible_data() and drm_atomic_check_fb() helper
>   methods (Dmitry)
> - Fixed typo in drm_solid_fill struct documentation
> - Created drm_plane_has_visible_data() helper and corrected CRTC and FB
>   NULL-check logic (Dmitry)
> - Merged `if (fb)` blocks in drm_atomic_plane_check() and abstracted
>   them into helper method (Dmitry)
> - Inverted `if (solid_fill_enabled) else if (fb)` check order (Dmitry)
> - Fixed indentation (Dmitry)
> 
> Changes in v2:
> - Dropped SOLID_FILL_FORMAT property (Simon)
> - Switched to implementing solid_fill property as a blob (Simon, Dmitry)
> - Added drm_solid_fill and drm_solid_fill_info structs (Simon)
> - Changed to checks for if solid_fill_blob is set (Dmitry)
> - Abstracted (plane_state && !solid_fill_blob) checks to helper method
>   (Dmitry)
> - Removed DPU_PLANE_COLOR_FILL_FLAG
> - Fixed whitespace and indentation issues (Dmitry)
> - Changed to checks for if solid_fill_blob is set (Dmitry)
> - Abstracted (plane_state && !solid_fill_blob) checks to helper method
>   (Dmitry)
> - Fixed dropped 'const' warning
> - Added helper to convert color fill to BGR888 (Rob)
> - Fixed indentation issue (Dmitry)
> - Added support for solid fill on planes of varying sizes
> 
> ---
> Jessica Zhang (10):
>       drm: Introduce pixel_source DRM plane property
>       drm: Introduce solid fill DRM plane property
>       drm: Add solid fill pixel source
>       drm/atomic: Add pixel source to plane state dump
>       drm/atomic: Add solid fill data to plane state dump
>       drm/atomic: Move framebuffer checks to helper
>       drm/atomic: Loosen FB atomic checks
>       drm/msm/dpu: Allow NULL FBs in atomic commit
>       drm/msm/dpu: Use DRM solid_fill property
>       drm/msm/dpu: Add solid fill and pixel source properties
> 
>  drivers/gpu/drm/drm_atomic.c              | 147 +++++++++++++++++-------------
>  drivers/gpu/drm/drm_atomic_helper.c       |  36 ++++----
>  drivers/gpu/drm/drm_atomic_state_helper.c |  10 ++
>  drivers/gpu/drm/drm_atomic_uapi.c         |  30 ++++++
>  drivers/gpu/drm/drm_blend.c               | 129 ++++++++++++++++++++++++++
>  drivers/gpu/drm/drm_crtc_internal.h       |   1 +
>  drivers/gpu/drm/drm_plane.c               |  27 +++++-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c  |   9 +-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c |  80 ++++++++++------
>  include/drm/drm_atomic_helper.h           |   4 +-
>  include/drm/drm_blend.h                   |   3 +
>  include/drm/drm_plane.h                   |  90 ++++++++++++++++++
>  include/uapi/drm/drm_mode.h               |  24 +++++
>  13 files changed, 478 insertions(+), 112 deletions(-)
> ---
> base-commit: 00ee72279c963989ab435b0bc90b5dc05a9aab79
> change-id: 20230404-solid-fill-05016175db36
> 
> Best regards,

