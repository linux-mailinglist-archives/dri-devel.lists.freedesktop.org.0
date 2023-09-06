Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B50E7943D7
	for <lists+dri-devel@lfdr.de>; Wed,  6 Sep 2023 21:33:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A0D810E1FE;
	Wed,  6 Sep 2023 19:33:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on20617.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe59::617])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 23A7710E1F5;
 Wed,  6 Sep 2023 19:33:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=g62SOZQV36vBI9Bq9PLT2DM30C7vnclJeABtycd1lA4E9mffcnhc62R5Y6WSeRMoUFYVN0YwygeD/JyEAB5pwCNxRiCdLz442aweqKsci2l7y6UrXwEBNSCbPC7NmoRT3w6fV6C5dIBSQigzKpKmR9PdcT80fKB0aXhg+y3a5cEJ45eogK8HNlPcS9Gs41wnTFLCFeT/yJ8XjJDBT7rCYyKqR77GHWFGBRwDj6+YZm+oSkbc1okb6wT6ei5eFG4kn0spsPYTHB5I+KCQW9z6IQu+pXiiK4L6RTYnjbmPC+YnwbgJgrsKmxHdd4Arugh3SlNZJXV4ZebssSCVpk/xUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5CamVGkW1y+6tx96YcOwatTq0qLzT3e4qg93/rHP78s=;
 b=QSiLWqbM5bM9BWj6sMMtoVUr6+sbhJqVIXe8+IuYhO8KarmsfGrJq6epqc/z6NWA3/l3w4hNVChIFuQSH+IELEMU9s/iudZF5D/knvDUdJUUIgG1zp+OLm14weFH85hcvW10Krr2SmqzIFDvZZflTU/w0NAcaPuCxdV0HYRfwqx4SZSVTD4hnOAZvz0I1Ezu5UC87pAnZUFmOonFLoGW/+O++uCBrXV+xJ1wBMFIMYYMvj/Wrf5TMPuBf/mzL3dNunQHQ7aA4zhCkuHdXK9BkadlNuiLEotDSqJfXRpCaTaLnEhXKQGf/5nzAe/5m2aUnFCe/G9pY6Zoo5UV/HDL0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5CamVGkW1y+6tx96YcOwatTq0qLzT3e4qg93/rHP78s=;
 b=v7mOYkqdEYaQt3yEHaCR5o8uTGR1mfX57nuUuP2wHas5sdg/e1hEwZRMCNeUFB3DjVAMyQIAR+XgxksgHQqudEadLhTrG+Rhh8HYwSC9lOX7C1XLT71Bgbi8uy+rGKCmL6HkyPh0pyIX7HdtJ8U5hTpogYG63VY7uT/MZ+22XZ0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CO6PR12MB5427.namprd12.prod.outlook.com (2603:10b6:5:358::13)
 by LV3PR12MB9094.namprd12.prod.outlook.com (2603:10b6:408:19e::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.32; Wed, 6 Sep
 2023 19:33:28 +0000
Received: from CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::121e:5e68:c78a:1f2f]) by CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::121e:5e68:c78a:1f2f%3]) with mapi id 15.20.6745.030; Wed, 6 Sep 2023
 19:33:28 +0000
Message-ID: <b8b1dd2d-069d-4410-a3a1-d1cdb61fd4a8@amd.com>
Date: Wed, 6 Sep 2023 15:33:24 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 00/34] drm/amd/display: add AMD driver-specific
 properties for color mgmt
Content-Language: en-US
To: Melissa Wen <mwen@igalia.com>, amd-gfx@lists.freedesktop.org,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, sunpeng.li@amd.com,
 Alex Deucher <alexander.deucher@amd.com>, dri-devel@lists.freedesktop.org,
 airlied@gmail.com, brian.starkey@arm.com, christian.koenig@amd.com,
 daniel@ffwll.ch, liviu.dudau@arm.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, Xinhui.Pan@amd.com
References: <20230810160314.48225-1-mwen@igalia.com>
From: Harry Wentland <harry.wentland@amd.com>
In-Reply-To: <20230810160314.48225-1-mwen@igalia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YQBPR0101CA0016.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c00::29) To CO6PR12MB5427.namprd12.prod.outlook.com
 (2603:10b6:5:358::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR12MB5427:EE_|LV3PR12MB9094:EE_
X-MS-Office365-Filtering-Correlation-Id: 19b4feb8-44dd-4ee5-8b96-08dbaf10253c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: icgzc6R0MCWmKIDSnTHcPlr5PZxaIfYrmhTpZ8BWhUBLFkQNEd2QESV/rKc8uju2Ud6K3yWA0KHCAjfOEHG81W/N1KgcLql3B2Mag+SylltGaEi4PGu0GlsVLtk8l55xU0YMYHdcB5b1ET+XcXfTg+OvNMm51VCzkG/lCffkGn2itGs4TNPyNigExQUjCBXtozj4N469LXOAFCucoGa13/xeLMGmkmJhaP7rUGf8fiQIH0XJSdA8fBLCMPXi/ZBOiOI3yFfboDpKAomDBF8BkCx6+aEEbn7Ut+1vQXiQgwTl9dDF3YTr0/teJNRcJxqTZ13NWgk85p6PRtTTSh89i5C/lxpbnGMzT1U0+HGQL2UxfZ6mHd29x25do8+5SfUM1BzLEA4YZ15o8nS0w0poVu8rf143LaKcTifDeRzbYXEP7iPTKBCfZS0FFAHiBcKC+hrhwweEVhaCem1prMXUiY/0oHzAoNnTBjlhadtrdvOj4edvyL3ZxZl1Ru0DaJ2EJcRStTZFuhAFVA/e53AVtp9mylG76jSO9EPUFzg14m4lhcmI4Gr/TJRot8I5iJF7mjLB10SJ5/vkmYrqa+wIdnsT0SzbctR1CnxhaN+uMQ69l4RTlRlokPlXIOUaduypPzrLzaPU1Blf53ctZC1Z5l9KUXhW7b0+gaxk53sqwD1iUUBGTUMKOFW47DHnbNWm
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR12MB5427.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(39860400002)(346002)(136003)(376002)(396003)(451199024)(186009)(1800799009)(966005)(7416002)(8936002)(41300700001)(83380400001)(44832011)(478600001)(31686004)(8676002)(2906002)(6666004)(5660300002)(316002)(6636002)(66476007)(66556008)(66946007)(54906003)(110136005)(4326008)(6512007)(53546011)(6506007)(26005)(6486002)(2616005)(66899024)(36756003)(31696002)(921005)(38100700002)(86362001)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WUZmTkxiZFVVcHdCYzZ5V3BOVU9sTk05VmhzZGFPbnV4Tm5OOWlsZTMxb3lX?=
 =?utf-8?B?ZHdOd1QzbjRNME1sTjF3OXRNWEtTYnZXNEkra3QvTkQra2J0cmVzZ3gzRTQ0?=
 =?utf-8?B?ZDkrT2x5Sy9DQzA2Y1lSTDFxRzBySkhXRmxnOXI3T1NrUmhyZnZ6UFlGeTZ3?=
 =?utf-8?B?cmo3cVRKYUtWTllEU1BLN3hRZk9nMW0rcHBuYUVGVzd6dTdPZGVMbExEbE1Z?=
 =?utf-8?B?Z3dTZ013U1J1V1BucTArNWY2R1N6akxmeFV4WnNZdDk3OGppbFlYN2VtaGJt?=
 =?utf-8?B?LzFqaTVZV0pTVkhxODZ6QS9BME4rb0Y3NndFakNSTGNpcGJxY0lObVlCU051?=
 =?utf-8?B?U21BeGhKd0YzeWZYeW5QVUQwcEVsS2R3QUNkZUdYcGJiZHdrR2dLSTMvbTJl?=
 =?utf-8?B?ZENCNERBYVorWWFwRnlaZTdoQkpLVE1hSHp5ZUZKUzFHY0hXVGkvemh1Wjlr?=
 =?utf-8?B?L0Z4UDY1MXlHTURSUWYvSDNiUGcxMVdnUlNsN3lkdWxyTGNMQmdpLyt3TGpJ?=
 =?utf-8?B?cmd4MUQreHhXMFpRalo1L3c3Z3p2UXZ4WTBnTVJGOVIyUHZEUnBhT0M0aTBR?=
 =?utf-8?B?OUU2UDhIVUxSMi9oU2ZyQ25zRjlaTU5KaHh4ZUtpMmMvQytScTNWZEpGN0Yy?=
 =?utf-8?B?aU95Y3BTSUtVZm1rNkRmalc0OEFEd2xPV2RYZHArUExIbzl4SDFTZGhDRXVw?=
 =?utf-8?B?TC82VTZNK1BXbHErbnFrb3NkOHJYcytCcjA5UmJxd0lFK0JkRzZKcTN3QVlK?=
 =?utf-8?B?UVpJRlk1UkMyeHpycVZ5cnAvOWU4TlNjeDVzcGNkT2JKLzA1VGRCeGtheGxn?=
 =?utf-8?B?bHFiMkJVb0dSTWlubUlvdks3aElINnRIZy80Rm5tWCtHZEtPekFaUklTTG4x?=
 =?utf-8?B?YkN0bktmeXFtcmpqb0MvZklSV1ZPVVl4eVJoWCttWlVJYWZuRGNPMlhodVJq?=
 =?utf-8?B?NENhL2V2OSs0Y25WZ3dyZjRIanF6RWxza0FLeUlWa1JuYllMYlFQd2F4em5W?=
 =?utf-8?B?b3NMRW10Vyt4YS9TYUVkbVpsWERTRlNmVit5dDVsSjlGR3BkYkd4OFpaRm42?=
 =?utf-8?B?Rkd1TEQvaEpwd3ZiU1p3NXFUNmVXWUo3b2tqenh1Y1NaYTRWSHE5cFNoTWxy?=
 =?utf-8?B?TzZYZjhiT1JXNE10OUxnSG1XSWhnRy9wQzczM3FjVUh3cDVjL0l3bWR2cnZX?=
 =?utf-8?B?a29DMFkxcEpqbWxON2dOM2taeTdFMkVhYmVFK3RkRVlSLzNGdHRNa3NDa0ZH?=
 =?utf-8?B?bUw4UFNYV3JmRXVVRytIMWZOYjFKWkgxL0owNWhFYVNpZk9YMFZlMTlENzZQ?=
 =?utf-8?B?YXQ4bjRzeHlsRTFnSXR4YnpYQzZVRTFPbG11YnV0NWNFRjJJMHFaTHYvSDR1?=
 =?utf-8?B?dDFFdERtUGRVT252L0krYTNtQm1VQlpCQitQdFF1UVNLSm9YcXlubG1zUzRl?=
 =?utf-8?B?R1BiMXN5bTlXVU9pSVlGdjNFMTJHanlVcmdQZVhQMGkzeDc2TXFMM2RET052?=
 =?utf-8?B?cndjbjZOQlMyVG5YbllPWWJId1RhMVB5OVJGcjRkNXFSem9GSVIzV3pzaFJp?=
 =?utf-8?B?eW9qQzZyajl3bDB2dlgzcC9GVjdXckZ1NnFNSENDYys0ZDltNWpDWDgyeVFm?=
 =?utf-8?B?dnI1MCtmbmdQV0hYajA3eGs2MFpkSitBRm5XUGJ3U0JyTTBESll5SXhnVzNl?=
 =?utf-8?B?VVo1eGpsV1ViY3orRi95allvSU1MdHVGSFpadU51VFY2OWlwbFd6eDY3UDhx?=
 =?utf-8?B?b1EyRy9VY05Mem8vWFVlak9DcWJycks4WWx2d0dvZzlCQ294MnhiREl5Vy9D?=
 =?utf-8?B?R1FzalRJdDA0clVDUW5xOGhsYmhhN3pUaWtqWHhaOStwNkN2Nzg2NnlSK2xZ?=
 =?utf-8?B?SC9ldGdQeGNhbGQxOGNzRGMrcXlOcExNOU1sdmJpcGFNT3oxT2tEenRzY3Rh?=
 =?utf-8?B?d3gzeUJnSmNRVmdMdE9WKzFHaGlnMzRxakY4aFlidWd1czlCakFOV2lUS0o3?=
 =?utf-8?B?WlZ6ejBBZmpjUnRwb3d0VWF3WGdNRE8yTnA1c2x4T0pHMnJZTkNjelY0OThk?=
 =?utf-8?B?ckJ5S3ZwSUZwRzlWMlp6K1cvbm5hcjhKeG80K3h6V09HZHRUL2paRE01bEpH?=
 =?utf-8?Q?Go/7fQiW4+jzu0wKVdGLBOIDq?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 19b4feb8-44dd-4ee5-8b96-08dbaf10253c
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5427.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Sep 2023 19:33:28.3512 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: W8DOxIh2VSJG9s1HctrQ0NXAyjvyx1o0OQSZ5jxBJ/+V0dmdznAzAevX1BO/8YWvevrcmKQYiyNbo2zcwo7+hg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR12MB9094
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
Cc: Sebastian Wick <sebastian.wick@redhat.com>,
 Pekka Paalanen <pekka.paalanen@collabora.com>,
 Shashank Sharma <Shashank.Sharma@amd.com>, Alex Hung <alex.hung@amd.com>,
 Xaver Hugl <xaver.hugl@gmail.com>, linux-kernel@vger.kernel.org,
 kernel-dev@igalia.com, Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>,
 Joshua Ashton <joshua@froggi.es>, sungjoon.kim@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2023-08-10 12:02, Melissa Wen wrote:
> Hi all,
> 
> Here is the next version of our work to enable AMD driver-specific color
> management properties [1][2]. This series is a collection of
> contributions from Joshua, Harry, and me to enhance the AMD KMS color
> pipeline for Steam Deck/SteamOS by exposing additional pre-blending and
> post-blending color capabilities from those available in the current DRM
> KMS API[3].
> 
> The userspace case here is Gamescope which is the compositor for
> SteamOS. Gamescope is already using these features to implement its
> color management pipeline [4].
> 
> In this version, I try to address all concerns shared in the previous
> one, i.e.:
> - Replace DRM_ by AMDGPU_ prefix for transfer function enumeration; 
> - Explicitly define EOTFs and inverse EOTFs and set props accordingly;
> - Document pre-defined transfer functions;
> - Remove misleading comments;
> - Remove post-blending/MPC shaper and 3D LUT support;
> - Move driver-specific property operations from amdgpu_display.c to
>   amdgpu_dm_color.c;
> - Reset planes if any color props change;
> - Nits/small fixes;
> 
> Bearing in mind the complexity of color concepts, I believe there is a
> high chance of some misunderstanding from my side when defining EOTFs
> and documenting pre-defined TFs. So, reviews are very important and
> welcome (thanks in advance). FWIW, I added Harry as a co-developer of
> this TF documentation since I based on his description of EOTF/inv_EOTF
> and previous documentation work [5]. Let me know if there is a better
> way for credits.
> 
> Two DC patches were already applied and, therefore, removed from the
> series. I added r-b according to previous feedback. We also add plane
> CTM to driver-specific properties. As a result, this is the updated list
> of all driver-specific color properties exposed by this series:
> 
> - plane degamma LUT and pre-defined TF;
> - plane HDR multiplier;
> - plane CTM 3x4;
> - plane shaper LUT and pre-defined TF;
> - plane 3D LUT;
> - plane blend LUT and pre-defined TF;
> - CRTC gamma pre-defined TF;
> 
> Remember you can find the AMD HW color capabilities documented here:
> https://dri.freedesktop.org/docs/drm/gpu/amdgpu/display/display-manager.html#color-management-properties
> 
> Worth mentioning that the pre-blending degamma block can use ROM curves
> for some pre-defined TFs, but the other blocks use the AMD color module
> to calculate this curve considering pre-defined coefficients.
> 
> We need changes on DC gamut remap matrix to support the plane and CRTC
> CTM on drivers that support both. I've sent a previous patch to apply
> these changes to all DCN3+ families [6]. Here I use the same changes but
> limited to DCN301. Just let me know if you prefer the previous/expanded
> version.
> 
> Finally, this is the Linux/AMD color management API before and after
> blending with the driver-specific properties:
> 
> +----------------------+
> |   PLANE              |
> |                      |
> |  +----------------+  |
> |  | AMD Degamma    |  |
> |  |                |  |
> |  | EOTF | 1D LUT  |  |
> |  +--------+-------+  |
> |           |          |
> |  +--------v-------+  |
> |  |    AMD HDR     |  |
> |  |    Multiply    |  |
> |  +--------+-------+  |
> |           |          |
> |  +--------v-------+  |
> |  |  AMD CTM (3x4) |  |
> |  +--------+-------+  |
> |           |          |
> |  +--------v-------+  |
> |  | AMD Shaper     |  |
> |  |                |  |
> |  | inv_EOTF |     |  |
> |  | Custom 1D LUT  |  |
> |  +--------+-------+  |
> |           |          |
> |  +--------v-------+  |
> |  |   AMD 3D LUT   |  |
> |  |   17^3/12-bit  |  |
> |  +--------+-------+  |
> |           |          |
> |  +--------v-------+  |
> |  | AMD Blend      |  |
> |  |                |  |
> |  | EOTF | 1D LUT  |  |
> |  +--------+-------+  |
> |           |          |
> ++----------v---------++
> ||      Blending      ||
> ++----------+---------++
> |    CRTC   |          |
> |           |          |
> |   +-------v-------+  |
> |   | DRM Degamma   |  |
> |   |               |  |
> |   | Custom 1D LUT |  |
> |   +-------+-------+  |
> |           |          |
> |   +-------v-------+  |
> |   | DRM CTM (3x3) |  |
> |   +-------+-------+  |
> |           |          |
> |   +-------v-------+  |
> |   | DRM Gamma     |  |
> |   |               |  |
> |   | Custom 1D LUT |  |
> |   +---------------+  |
> |   | *AMD Gamma    |  |
> |   |   inv_EOTF    |  |
> |   +---------------+  |
> |                      |
> +----------------------+
> 
> Let me know your thoughts.
> 

Thanks again for your amazing work on this.

Patches 5, 6, 14, 16, and 24 are
Reviewed-by: Harry Wentland <harry.wentland@amd.com>

I left comments on the remaining unreviewed patches.

Harry

> Best Regards,
> 
> Melissa Wen
> 
> [1] https://lore.kernel.org/dri-devel/20230423141051.702990-1-mwen@igalia.com
> [2] https://lore.kernel.org/dri-devel/20230523221520.3115570-1-mwen@igalia.com
> [3] https://github.com/ValveSoftware/gamescope/blob/master/src/docs/Steam%20Deck%20Display%20Pipeline.png
> [4] https://github.com/ValveSoftware/gamescope
> [5] https://lore.kernel.org/dri-devel/20210730204134.21769-1-harry.wentland@amd.com
> [6] https://lore.kernel.org/dri-devel/20230721132431.692158-1-mwen@igalia.com
> 
> 
> Harry Wentland (1):
>   drm/amd/display: fix segment distribution for linear LUTs
> 
> Joshua Ashton (14):
>   drm/amd/display: add plane degamma TF driver-specific property
>   drm/amd/display: add plane HDR multiplier driver-specific property
>   drm/amd/display: add plane blend LUT and TF driver-specific properties
>   drm/amd/display: add CRTC gamma TF support
>   drm/amd/display: set sdr_ref_white_level to 80 for out_transfer_func
>   drm/amd/display: mark plane as needing reset if color props change
>   drm/amd/display: add plane degamma TF and LUT support
>   drm/amd/display: add dc_fixpt_from_s3132 helper
>   drm/amd/display: add HDR multiplier support
>   drm/amd/display: handle empty LUTs in __set_input_tf
>   drm/amd/display: add plane blend LUT and TF support
>   drm/amd/display: allow newer DC hardware to use degamma ROM for PQ/HLG
>   drm/amd/display: copy 3D LUT settings from crtc state to stream_update
>   drm/amd/display: Use 3x4 CTM for plane CTM
> 
> Melissa Wen (19):
>   drm/drm_mode_object: increase max objects to accommodate new color
>     props
>   drm/drm_property: make replace_property_blob_from_id a DRM helper
>   drm/drm_plane: track color mgmt changes per plane
>   drm/amd/display: add driver-specific property for plane degamma LUT
>   drm/amd/display: explicitly define EOTF and inverse EOTF
>   drm/amd/display: document AMDGPU pre-defined transfer functions
>   drm/amd/display: add plane 3D LUT driver-specific properties
>   drm/amd/display: add plane shaper LUT and TF driver-specific
>     properties
>   drm/amd/display: add CRTC gamma TF driver-specific property
>   drm/amd/display: add comments to describe DM crtc color mgmt behavior
>   drm/amd/display: encapsulate atomic regamma operation
>   drm/amd/display: decouple steps for mapping CRTC degamma to DC plane
>   drm/amd/display: reject atomic commit if setting both plane and CRTC
>     degamma
>   drm/amd/display: add plane shaper LUT support
>   drm/amd/display: add plane shaper TF support
>   drm/amd/display: add plane 3D LUT support
>   drm/amd/display: set stream gamut remap matrix to MPC for DCN301
>   drm/amd/display: add plane CTM driver-specific property
>   drm/amd/display: add plane CTM support
> 
>  drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h      |  71 ++
>  .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c |  34 +-
>  .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h | 101 +++
>  .../amd/display/amdgpu_dm/amdgpu_dm_color.c   | 805 ++++++++++++++++--
>  .../amd/display/amdgpu_dm/amdgpu_dm_crtc.c    |  72 ++
>  .../amd/display/amdgpu_dm/amdgpu_dm_plane.c   | 224 ++++-
>  .../amd/display/dc/dcn10/dcn10_cm_common.c    |  93 +-
>  .../drm/amd/display/dc/dcn30/dcn30_hwseq.c    |  37 +
>  .../drm/amd/display/dc/dcn30/dcn30_hwseq.h    |   3 +
>  .../drm/amd/display/dc/dcn301/dcn301_init.c   |   2 +-
>  .../gpu/drm/amd/display/include/fixed31_32.h  |  12 +
>  drivers/gpu/drm/arm/malidp_crtc.c             |   2 +-
>  drivers/gpu/drm/drm_atomic.c                  |   1 +
>  drivers/gpu/drm/drm_atomic_state_helper.c     |   1 +
>  drivers/gpu/drm/drm_atomic_uapi.c             |  43 +-
>  drivers/gpu/drm/drm_property.c                |  49 ++
>  include/drm/drm_mode_object.h                 |   2 +-
>  include/drm/drm_plane.h                       |   7 +
>  include/drm/drm_property.h                    |   6 +
>  include/uapi/drm/drm_mode.h                   |   8 +
>  20 files changed, 1446 insertions(+), 127 deletions(-)
> 

