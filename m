Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 14DB9C59CE3
	for <lists+dri-devel@lfdr.de>; Thu, 13 Nov 2025 20:40:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5210110E92C;
	Thu, 13 Nov 2025 19:40:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="4zorFtVy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PH0PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11011027.outbound.protection.outlook.com [40.107.208.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BFFC210E2D6;
 Thu, 13 Nov 2025 19:40:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mASKhKqHgmBtQxW8deEXDMxFVcnslwe7vsaQbCmRycQzkuSjFo9MUsm75kmcIs2vMZinLgiy3Zbh5ipuBv1WYIcw1XUtvwxh/ZioMezclsHXJv3sAaMvOpM+HsEwQcoi527X56flAj4XFmjkVRuHRUx7OT0GdZyunPpyujpihOt4CRsSMpIwsdCGqUEtlovQy57/is5iGACnPlA6AmWaE+CMDNAb2Mw5TI60f8y13haSxa9zANE7Eb8UGlFT+hJF4BgPmQPyQrNp4MoBP7c0Tac6Dy8aELxfcjwS520pWG9vp/OGpcLawPIzwqOzHoUwaMNH+OsB4J42D7AJ32GlIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nlIbPtTw2EytI28VDIdLoW4+whsks+DOG6nWywnK7/4=;
 b=AvpuVJsqrKqSviKXsMD8GcozbECtJlbXtWZpw7hWp+zfp+WTMt1J97ZLI7slPnNvsKzbX+zGQfyFC9SwiN0qjFDd+eyUNcy7TKH4E5++kKG8JP4rMn2VrKfFMDV3W9SUb+XgZVP94y2vQI5bD5g32zoI+6sU3gEVFRAoErTvrQrHr49LwPuBMgFI7namTdbdGOR9BA/kuwlBd0CbK1QmHuX9RyEozAO/LRawi8KFN6l9iS9ru9QJQty1GnHwtegJqAzC80Gd/yrFm2zx2zuycc2gBmUsB3/HmdZYQ2h8TT1HceUZA9EMFiZ5TVdBLr8xW7YXQT6o9Gocy88F3Zegpw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nlIbPtTw2EytI28VDIdLoW4+whsks+DOG6nWywnK7/4=;
 b=4zorFtVyBimmYroU3HtMXt183V1lF3Mrs36l7hvOi16tj059m560CEph2ZgcXym0CmU3AUpt4Qkvp6RoDEsUF6VIgDm7ZXn1IYtjio/rgScWQN6LVUVCNKEofp0n6EkBPn6/XbnD+fKY98NKTiEpyCuLoqR5hbtzES1O+5U8F4M=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CO6PR12MB5427.namprd12.prod.outlook.com (2603:10b6:5:358::13)
 by MN2PR12MB4174.namprd12.prod.outlook.com (2603:10b6:208:15f::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.16; Thu, 13 Nov
 2025 19:40:36 +0000
Received: from CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::9e93:67dd:49ac:bc14]) by CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::9e93:67dd:49ac:bc14%6]) with mapi id 15.20.9298.015; Thu, 13 Nov 2025
 19:40:36 +0000
Message-ID: <6d14a4c8-1f74-4c30-ac1e-ec4777bdb8cd@amd.com>
Date: Thu, 13 Nov 2025 14:40:28 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V12 46/49] drm/amd/display: Ensure 3D LUT for color
 pipeline
To: Alex Hung <alex.hung@amd.com>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org
Cc: wayland-devel@lists.freedesktop.org, leo.liu@amd.com,
 ville.syrjala@linux.intel.com, pekka.paalanen@collabora.com,
 contact@emersion.fr, mwen@igalia.com, jadahl@redhat.com,
 sebastian.wick@redhat.com, shashank.sharma@amd.com, agoins@nvidia.com,
 joshua@froggi.es, mdaenzer@redhat.com, aleixpol@kde.org,
 xaver.hugl@gmail.com, victoria@system76.com, daniel@ffwll.ch,
 uma.shankar@intel.com, quic_naseer@quicinc.com, quic_cbraga@quicinc.com,
 quic_abhinavk@quicinc.com, marcan@marcan.st, Liviu.Dudau@arm.com,
 sashamcintosh@google.com, chaitanya.kumar.borah@intel.com,
 louis.chauvet@bootlin.com, mcanal@igalia.com, nfraprado@collabora.com,
 arthurgrillo@riseup.net
References: <20251030034349.2309829-1-alex.hung@amd.com>
 <20251030034349.2309829-47-alex.hung@amd.com>
Content-Language: en-US
From: Harry Wentland <harry.wentland@amd.com>
In-Reply-To: <20251030034349.2309829-47-alex.hung@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BN0PR03CA0047.namprd03.prod.outlook.com
 (2603:10b6:408:e7::22) To CO6PR12MB5427.namprd12.prod.outlook.com
 (2603:10b6:5:358::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR12MB5427:EE_|MN2PR12MB4174:EE_
X-MS-Office365-Filtering-Correlation-Id: 36c6e41d-4385-47df-2474-08de22ec8477
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dlJuWmdyOHpOWFBWajJmbW1OWUNWQ1R1ck9nc2QvK09UWW9sRy9MRFR2QjJG?=
 =?utf-8?B?MGtwUkRTZXlaTGFxUFpONHJSdEJsczgzcVJEOFJPZWFSZW05ZzZRWUtRSjVN?=
 =?utf-8?B?WGJrU0xYL1pwQm4xYkM4S3hZQlpMeEdxajB1WWJtbXNOUVloczRzRlF1YVRK?=
 =?utf-8?B?R1JBbWVydWxlVkpqUE93R011V0xCOFBiZWVkZXdnVGIvVzVJK1NLcHZ0YUND?=
 =?utf-8?B?cnRaQWZ1dEFQU3V6ZUdlcVZPck8zOXU0cU9GaE9ReUJsSGNGWlhrOFdaTVRB?=
 =?utf-8?B?UXhJRkZ3em9tQ2tZU3FKcWR0c2NnT2d6a1RLVG16ek82N2Y4Sm9tQW5PUDlN?=
 =?utf-8?B?U04wQWMwblM3bVRqck4vRzNSa3F6RGl1ZXdHTFFiRmF2SHNobTBnTDA1Vnpt?=
 =?utf-8?B?WmhKbERieE53NjZUTWhqbFB2VTMwVVU1WXNoTGhQaHcrY1lxbUVKcURPZEw0?=
 =?utf-8?B?MTlodEVwa29qQWpNd3VKMVBuZi9GelBqb2xodHRtTFMxUTFHN2R2U3E0S0hu?=
 =?utf-8?B?SGNvblFScTNEa3pIZ2dCRjRKRGRkM1hYN2NkVTdEdzZ5Z3BtQ1o0NjZxWEVw?=
 =?utf-8?B?UDlDMWxyc21scXg2U1B6ZGRZTWw0RHRCL3pHdHBpdG1PL1NqYmZaTWxiak1K?=
 =?utf-8?B?N2JzMitOL01yR3ZwYi9DL2czdWhhek9TeG8vTlpESkdBTVJoL2tkMURoNm90?=
 =?utf-8?B?VVFYaVVUMVc2QkVtaVVIdkRyMDhNWXpkMkJXU3VaaDFMYmIyZi9oUWplSnpJ?=
 =?utf-8?B?UU5PZkk3dk42cEJ5S1NFM1o0Z2lsZzhBQnFidTVwNkVsbGtsY2wwS2wxcEsr?=
 =?utf-8?B?dVVqWDJNakpBY0NWNGQ4bnFNKzZiMVY1V2lNV3dIMHRlUHZmbFBLbHU5OUVO?=
 =?utf-8?B?eGhvblRRR0VJbS9hRW1yekUwTUNUY2JRajRnRDhTbExXTWdMUXZjcVZrWUQz?=
 =?utf-8?B?bHVnZTM1VFJPU2JCQVk0d2ovQTMzWnZRYWwxUGNMQnBLSzdnRmtYVmpaQjd2?=
 =?utf-8?B?WjdjQnhIL1Npb1ZCTEU5eHFCVkk1anBobW5JeUxHeTd1UzJMOWI1eHBEWFNz?=
 =?utf-8?B?MG1waEFOOVo1aXcrdG4vRWc2N1hVcURwQ1FQODZmNGFqNlpoaVlPUm5obU1C?=
 =?utf-8?B?MC9FOTVWeTNmOHcwOVNzQ25Jak9kRUhFS004dEFxdHhRWmJQTEJUNFYyTmJV?=
 =?utf-8?B?RWd3Yi8vSGVBbDQzWFhzRlJyTGQvak5FeWV6Q3QrMUFTR3FIaHBzaXp6c3hY?=
 =?utf-8?B?MW9waTByUHlyZy8wZnlGUFptMmFaYm42RFpCbGU3OXJnOHFxQzJJZW93REh2?=
 =?utf-8?B?NUNEL2JWMDBISGQzNExxR1hpVEhOd0Y0aC9ud2R2M05TSFB2UmE5em5zQzU0?=
 =?utf-8?B?b1BINXRxVUpUS2pBdEs5WGZhMGdPZjBid0hORlo3amF1QWM0aXZkYXFBckRr?=
 =?utf-8?B?ME9JTnFGSXpFbjdLNEZxWWREeTlJdVIxTVRNdmtxa1kxYTcvUnlpamhlN2hv?=
 =?utf-8?B?ZTRaWTY0RUdVWi9vK1UyR09qTDZTSncwUzdwS0xVR1ZmRnBZRlVYR3NMUmxp?=
 =?utf-8?B?NFVqK2lLL2g3SHlxM29ZTXdCZENqOWZPQ0c5ZUxnVjVoL1JvclhXditoazUv?=
 =?utf-8?B?VEN5eWwrVEJybGxvZ1EwWk5ZRE1qK0c1Y0hTaWwxZ0Y5cldyZVAyS1BZMG5a?=
 =?utf-8?B?ZTdqaUM1V3dzT1NJeXVuUzNiMUV4MXB5ZnZOT3hUaUpwSkZzVHRBNG1CZHAx?=
 =?utf-8?B?NG9FUGxQMW1Ma29DdWVFa0lMNHpjdHhxMEM4eHJlT3ZVd0laV3B0Q0NFb1Fx?=
 =?utf-8?B?QzF6bHB5NXBRTndQRG1TM05qbVZpZk4rZVplbFp3eUxnRVVWTk5yWkVaL3FM?=
 =?utf-8?B?TW95aFVuSUkxdTgyZ2ViTmVEbWVjY0hucFE0dnUzd0JjRmJvNUNpSXI5N3ZE?=
 =?utf-8?Q?oR1r+TIDFiwlq55cInDAf5H+9jXnTKi5?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR12MB5427.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?U3h6V1RQZFJQaEJuY245S2xUSTFCcVpNQlptU3ROanN3bUQ4WTJNWHcrYW12?=
 =?utf-8?B?blNETWwzS0NoNnNsSHltQUY5cHZZYWxraGNKYVN5OCtNbFhFcU1PK2t4QTNB?=
 =?utf-8?B?UWJ0ZVA2L0pXUjdsa3VHSFdBcUZCamI0cldVS0hKc2ErMVJrNzQ5ZkdkQkF2?=
 =?utf-8?B?dklHRDRNK1Rad3gvdUZQQUdEZ1IxUzRTb244SGlOYkVGR0Q4TmdpMkVleXpE?=
 =?utf-8?B?TlhGZ2M1Mk53TDRtQzk1eGtLcGRDNVFrenhnNE91SHZSbW1GRS9KWURIK1Jj?=
 =?utf-8?B?ZnFXV1dhNXUxTmV1UHJ3VEUrU0t2OHU2QzhJUWcrQ0xyb0hxSXJYaEwySlVs?=
 =?utf-8?B?QlY2Y0hWMHNibzk0Q0M2U1BZMEdrSXhpZWFSM0JLcmxacHhHNDlTN3l4d0FB?=
 =?utf-8?B?ZlJOdlRER3BYNmVJbUQyN0djWUFTcjh1cVdDMDRuV2QvcnYwV2Q5bmlMd0Zn?=
 =?utf-8?B?cTR4Wk84S0tHWWE3SVcwcnRtY1FQaTN6R3J0cDBhNDBtL3NudnAvcXpRUmY4?=
 =?utf-8?B?SHhLS0Z4S1JVTEhxaUtCRzlaR0RYcXdGRjNZTVdCTWxqdGk2NkhNQ0N4djdL?=
 =?utf-8?B?OE03TnVNNjQxcmovUnp0MmJ4UWpZeG5KMDhhb3U3REUvSVpSeEV5alVuWWFt?=
 =?utf-8?B?b0g3L3VzYXNtcXRLVlNWT09uOWphVDlCdXlKdmFtNjAyODd3QS9uTjdwTWFs?=
 =?utf-8?B?RW4wbmhpc3VITksyN1BHbWUvZlpHT0hZeU1JSW1reEl3OUNROFB2dzR1dkly?=
 =?utf-8?B?M0hCQjk4djFiU2VYcko5MENaTWQ5Mlc0ZFpQeTVnaWIrYmkwZE1FUTI4K1ZE?=
 =?utf-8?B?QlNRTGF5SlBhLy9WOWNDQjVXZFlraUxaT0RveEI2RXVnMEtsWUtjdWFTaGxW?=
 =?utf-8?B?dkNyaU1pZjZOM2NnM002c0p3YlFYdHNQUXd0cFRtUU1kbDM2R2s3V1liNTlE?=
 =?utf-8?B?Mm9ocU03ekN5TW9lL3FqYTJhNWpoak1EbVQ5OVY0N2VSM041TFdlVENJSTQv?=
 =?utf-8?B?WHJkakZZdkRXNDAvWkNySE42Vkp0RkhNbTVKSnBENUdsWUs1MzNJTEVqcUVt?=
 =?utf-8?B?aHc0Y1NYcUpwS1gybTR4ekh3dlp4bWUzcTJLNEJJc0g1UVpuaGpjeHRDWjly?=
 =?utf-8?B?MWVYUENpUmdhYjR1VkcxbWpTeVJBZnVCUnExaGFBSnFJZUlaQWZXTjRlcUo5?=
 =?utf-8?B?enlxN0xXWmZOSFhEOGZwRFplNHlUZkpaQ2NTcEFrSXdOS2pLWm54bkhRd1Ro?=
 =?utf-8?B?Y1FJQWxIVFloelREcytzWm51YllQMmdqMEwrWUpBSGhGRnNERy95VEpQZk5U?=
 =?utf-8?B?Q0hCcXhubmcrbHZ1aWovVTBIQTBtU2VZQW9mN1Avc1NUbm1mYTZNYXdwTG14?=
 =?utf-8?B?bURsa3VjUEtFSFBNRlUxQjRicDhiQTQxanNNcG9ZcXozaFNCZjU4ZjcyN2pE?=
 =?utf-8?B?UVhyNXFwS1hKR3FoamM5VVYvZWpVVnNUeVR1ajNSVWFlU01TVHVpQ2FxazNy?=
 =?utf-8?B?cWJNdHZZQ096RVVnWWJETDFCOWRVZGJFSzN5RzZienoyNzRxeXlYSmVmT2x0?=
 =?utf-8?B?MjFidXVqK0FOQTYxbk42YU4zeVhHbzI3dk9aTVM0VkR4VnZtZU9DNU5zRXdH?=
 =?utf-8?B?WE15V2lacDBLTTF0THdpcXJsNk51ZVZ6cXVZMW9OaE5BUjY4RTg3VndEV3Nv?=
 =?utf-8?B?VC9qRlA0cVNGLzZ0YUtmQm1SUzl5VzlSNnJnaEJYamhnQWFsdjdFS3ZyQnVI?=
 =?utf-8?B?ZTFELzcyakplbWQ1OWc3Qkw3akpQRUlaUVlrL0NVZXc5SlpxME03b0Y5Nllv?=
 =?utf-8?B?ZEUzMG1xTTlxUXYxWGNGUU9JbXJkbEFaR1QrU2RsTkxKd0piT1JsWUZtT1F3?=
 =?utf-8?B?bGRVSjZKSXVOeHQvV05Lb3lRbSttMlA4NU1DRE0zVHBEbis0eVJnK1dyM3E0?=
 =?utf-8?B?SnVNVHlSejhjUnZBTStGVWJ3cUhoTS8zS1FPQ0NYV2Noc2JONHBvYnVnUzcv?=
 =?utf-8?B?bzlWSGRIeVBqV3NwYzlCaGM5YzVYV1hZdmtsUXF6eUtZMk1NQkJ3RFp6L01L?=
 =?utf-8?B?YUJmb0Rvc2pUOXEzWGZKdFFFWHJ6dkt3M292Ujk4TmFIRTNxUmVab3JKZEo0?=
 =?utf-8?Q?FhUjuzDscfkHGMXkaTNtUFE1W?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 36c6e41d-4385-47df-2474-08de22ec8477
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5427.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2025 19:40:36.5235 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aLZuFZJtNVCOoj7mFUf2ilnciJhCkSkSHNWxmMEjOHt2272MEHMwvo3ZcsxiCNRpMgHxDXkQVN0ht3rxdXKDOQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4174
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



On 2025-10-29 23:42, Alex Hung wrote:
> Check dpp.hw_3d_lut before creating shaper tf/lut and 3dlut colorops in
> colorpipeline and handling these colorops.
> 
> Signed-off-by: Alex Hung <alex.hung@amd.com>

Reviewed-by: Harry Wentland <harry.wentland@amd.com>

Harry

> ---
> v10:
>  - Check dpp.hw_3d_lut before creating shaper tf/lut and 3dlut colorops
>    (Melissa Wen)
> 
>  .../amd/display/amdgpu_dm/amdgpu_dm_color.c   |  47 ++++----
>  .../amd/display/amdgpu_dm/amdgpu_dm_colorop.c | 103 +++++++++---------
>  2 files changed, 78 insertions(+), 72 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
> index e6da42e7fcb3..c3ddf136dbc8 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
> @@ -1868,6 +1868,7 @@ amdgpu_dm_plane_set_colorop_properties(struct drm_plane_state *plane_state,
>  {
>  	struct drm_colorop *colorop = plane_state->color_pipeline;
>  	struct drm_device *dev = plane_state->plane->dev;
> +	struct amdgpu_device *adev = drm_to_adev(dev);
>  	int ret;
>  
>  	/* 1D Curve - DEGAM TF */
> @@ -1900,32 +1901,34 @@ amdgpu_dm_plane_set_colorop_properties(struct drm_plane_state *plane_state,
>  	if (ret)
>  		return ret;
>  
> -	/* 1D Curve & LUT - SHAPER TF & LUT */
> -	colorop = colorop->next;
> -	if (!colorop) {
> -		drm_dbg(dev, "no Shaper TF colorop found\n");
> -		return -EINVAL;
> -	}
> +	if (adev->dm.dc->caps.color.dpp.hw_3d_lut) {
> +		/* 1D Curve & LUT - SHAPER TF & LUT */
> +		colorop = colorop->next;
> +		if (!colorop) {
> +			drm_dbg(dev, "no Shaper TF colorop found\n");
> +			return -EINVAL;
> +		}
>  
> -	ret = __set_dm_plane_colorop_shaper(plane_state, dc_plane_state, colorop);
> -	if (ret)
> -		return ret;
> +		ret = __set_dm_plane_colorop_shaper(plane_state, dc_plane_state, colorop);
> +		if (ret)
> +			return ret;
>  
> -	/* Shaper LUT colorop is already handled, just skip here */
> -	colorop = colorop->next;
> -	if (!colorop)
> -		return -EINVAL;
> +		/* Shaper LUT colorop is already handled, just skip here */
> +		colorop = colorop->next;
> +		if (!colorop)
> +			return -EINVAL;
>  
> -	/* 3D LUT */
> -	colorop = colorop->next;
> -	if (!colorop) {
> -		drm_dbg(dev, "no 3D LUT colorop found\n");
> -		return -EINVAL;
> -	}
> +		/* 3D LUT */
> +		colorop = colorop->next;
> +		if (!colorop) {
> +			drm_dbg(dev, "no 3D LUT colorop found\n");
> +			return -EINVAL;
> +		}
>  
> -	ret = __set_dm_plane_colorop_3dlut(plane_state, dc_plane_state, colorop);
> -	if (ret)
> -		return ret;
> +		ret = __set_dm_plane_colorop_3dlut(plane_state, dc_plane_state, colorop);
> +		if (ret)
> +			return ret;
> +	}
>  
>  	/* 1D Curve & LUT - BLND TF & LUT */
>  	colorop = colorop->next;
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.c
> index f89a887c6b14..f205f3c31f6a 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.c
> @@ -31,6 +31,7 @@
>  
>  #include "amdgpu.h"
>  #include "amdgpu_dm_colorop.h"
> +#include "dc.h"
>  
>  const u64 amdgpu_dm_supported_degam_tfs =
>  	BIT(DRM_COLOROP_1D_CURVE_SRGB_EOTF) |
> @@ -55,6 +56,7 @@ int amdgpu_dm_initialize_default_pipeline(struct drm_plane *plane, struct drm_pr
>  {
>  	struct drm_colorop *ops[MAX_COLOR_PIPELINE_OPS];
>  	struct drm_device *dev = plane->dev;
> +	struct amdgpu_device *adev = drm_to_adev(dev);
>  	int ret;
>  	int i = 0;
>  
> @@ -108,57 +110,58 @@ int amdgpu_dm_initialize_default_pipeline(struct drm_plane *plane, struct drm_pr
>  
>  	i++;
>  
> -	/* 1D curve - SHAPER TF */
> -	ops[i] = kzalloc(sizeof(struct drm_colorop), GFP_KERNEL);
> -	if (!ops[i]) {
> -		ret = -ENOMEM;
> -		goto cleanup;
> -	}
> -
> -	ret = drm_plane_colorop_curve_1d_init(dev, ops[i], plane,
> -					      amdgpu_dm_supported_shaper_tfs,
> -					      DRM_COLOROP_FLAG_ALLOW_BYPASS);
> -	if (ret)
> -		goto cleanup;
> -
> -	drm_colorop_set_next_property(ops[i-1], ops[i]);
> -
> -	i++;
> -
> -	/* 1D LUT - SHAPER LUT */
> -	ops[i] = kzalloc(sizeof(struct drm_colorop), GFP_KERNEL);
> -	if (!ops[i]) {
> -		ret = -ENOMEM;
> -		goto cleanup;
> +	if (adev->dm.dc->caps.color.dpp.hw_3d_lut) {
> +		/* 1D curve - SHAPER TF */
> +		ops[i] = kzalloc(sizeof(struct drm_colorop), GFP_KERNEL);
> +		if (!ops[i]) {
> +			ret = -ENOMEM;
> +			goto cleanup;
> +		}
> +
> +		ret = drm_plane_colorop_curve_1d_init(dev, ops[i], plane,
> +						amdgpu_dm_supported_shaper_tfs,
> +						DRM_COLOROP_FLAG_ALLOW_BYPASS);
> +		if (ret)
> +			goto cleanup;
> +
> +		drm_colorop_set_next_property(ops[i-1], ops[i]);
> +
> +		i++;
> +
> +		/* 1D LUT - SHAPER LUT */
> +		ops[i] = kzalloc(sizeof(struct drm_colorop), GFP_KERNEL);
> +		if (!ops[i]) {
> +			ret = -ENOMEM;
> +			goto cleanup;
> +		}
> +
> +		ret = drm_plane_colorop_curve_1d_lut_init(dev, ops[i], plane, MAX_COLOR_LUT_ENTRIES,
> +							DRM_COLOROP_LUT1D_INTERPOLATION_LINEAR,
> +							DRM_COLOROP_FLAG_ALLOW_BYPASS);
> +		if (ret)
> +			goto cleanup;
> +
> +		drm_colorop_set_next_property(ops[i-1], ops[i]);
> +
> +		i++;
> +
> +		/* 3D LUT */
> +		ops[i] = kzalloc(sizeof(struct drm_colorop), GFP_KERNEL);
> +		if (!ops[i]) {
> +			ret = -ENOMEM;
> +			goto cleanup;
> +		}
> +
> +		ret = drm_plane_colorop_3dlut_init(dev, ops[i], plane, LUT3D_SIZE,
> +					DRM_COLOROP_LUT3D_INTERPOLATION_TETRAHEDRAL,
> +					DRM_COLOROP_FLAG_ALLOW_BYPASS);
> +		if (ret)
> +			goto cleanup;
> +
> +		drm_colorop_set_next_property(ops[i-1], ops[i]);
> +
> +		i++;
>  	}
> -
> -	ret = drm_plane_colorop_curve_1d_lut_init(dev, ops[i], plane, MAX_COLOR_LUT_ENTRIES,
> -						  DRM_COLOROP_LUT1D_INTERPOLATION_LINEAR,
> -						  DRM_COLOROP_FLAG_ALLOW_BYPASS);
> -	if (ret)
> -		goto cleanup;
> -
> -	drm_colorop_set_next_property(ops[i-1], ops[i]);
> -
> -	i++;
> -
> -	/* 3D LUT */
> -	ops[i] = kzalloc(sizeof(struct drm_colorop), GFP_KERNEL);
> -	if (!ops[i]) {
> -		ret = -ENOMEM;
> -		goto cleanup;
> -	}
> -
> -	ret = drm_plane_colorop_3dlut_init(dev, ops[i], plane, LUT3D_SIZE,
> -				     DRM_COLOROP_LUT3D_INTERPOLATION_TETRAHEDRAL,
> -				     DRM_COLOROP_FLAG_ALLOW_BYPASS);
> -	if (ret)
> -		goto cleanup;
> -
> -	drm_colorop_set_next_property(ops[i-1], ops[i]);
> -
> -	i++;
> -
>  	/* 1D curve - BLND TF */
>  	ops[i] = kzalloc(sizeof(struct drm_colorop), GFP_KERNEL);
>  	if (!ops[i]) {

