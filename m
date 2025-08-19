Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D142CB2BC0E
	for <lists+dri-devel@lfdr.de>; Tue, 19 Aug 2025 10:41:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C6E9110E268;
	Tue, 19 Aug 2025 08:41:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="BbFij2rV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2065.outbound.protection.outlook.com [40.107.237.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 18BF310E268;
 Tue, 19 Aug 2025 08:41:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NEbPuM6LeAYzYiREJ8BUYmRsgl8iRLMWZh2dsAZiJTffKr7R45+jNg/eKJO9Vt4U7HG0RvZHE34UGWrrCHXs+svV/hKSds6IEb5V7neOAq4hTqtv6MUhVzKsL3M5BA6fm4LqtecxsZm0A87tNDfiGmtnb2ua+3G3K32kBEo7C+rWZABeHDRP7mRrN8j68iyBnBWebCJSQLhbvHchSIZjsALUWdx/Ri/ZqlnY2raqs9xTOP7YN2sfQhVWE5uNC7a9NOtEt3X5uvBkwywS9agC/Q/bvatvwgHleAjvxlxX+eP1TB/8VeGrYl72ECAYum8hNwrX9Y2pjstilWj+/WPPFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+WDq98Fcrjm6QI9DsOK20YDavY/3gWqaJzTajlc6Yow=;
 b=rkXLPUFUUPBCjEy4qQPBNNgBcXcwZlkCYieGJnI5pJDv2DMWSZrukZCBA3LU7wtkgy3/P4V3N/DXiu5SxiiJHnUKYKuh3Sm8op44WiGLP8Xj+6LDFRB95LBuxRulaaVygxVZmQCHBsboxU9uAZCYu/0hKSdj8jOGiiyNsfCL5qobzVI5uEnpPLeoLKm2hE5u9SEscYXl3GkXjUDELGvjoKAnG9HRaqDcnok3SF7Vh/SwHxIvmKWQ/TUvWglgLn9dOkQHm2DcIKdQBAVK4wrKAPrudSYC1w0yR2DThsxqJNQQWfuVCZpC/1Zc9JkFuU2LKUzbGKAOgqzxUAxDRgReYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+WDq98Fcrjm6QI9DsOK20YDavY/3gWqaJzTajlc6Yow=;
 b=BbFij2rVAdT9PSFJjsYl8OvbOdlUvVHPdsEPUD6S9dUi+YA/A5Zm/IusQ/x1R07kCn9o0ui+eyU6LEDL4ZRy6CJHnC4PPrpOlY22zaMmF/zrGoQJ+w39tjWFrM+OsOJLHorezKPsAf+MXj5gZ/Cg+1Fr8jWDe8zHRN1UawHAeF4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by PH7PR12MB7140.namprd12.prod.outlook.com (2603:10b6:510:200::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.19; Tue, 19 Aug
 2025 08:41:42 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%5]) with mapi id 15.20.9031.023; Tue, 19 Aug 2025
 08:41:42 +0000
Message-ID: <00e7ce33-cc0a-4249-ac18-081ab9ead243@amd.com>
Date: Tue, 19 Aug 2025 10:41:37 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/amdgpu/fence: Remove redundant 0 value initialization
To: Liao Yuanhong <liaoyuanhong@vivo.com>,
 Alex Deucher <alexander.deucher@amd.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Thomas Gleixner <tglx@linutronix.de>,
 Ingo Molnar <mingo@kernel.org>,
 Srinivasan Shanmugam <srinivasan.shanmugam@amd.com>,
 Lijo Lazar <lijo.lazar@amd.com>,
 "open list:RADEON and AMDGPU DRM DRIVERS" <amd-gfx@lists.freedesktop.org>,
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>,
 open list <linux-kernel@vger.kernel.org>
References: <20250819082524.526572-1-liaoyuanhong@vivo.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20250819082524.526572-1-liaoyuanhong@vivo.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MN2PR16CA0065.namprd16.prod.outlook.com
 (2603:10b6:208:234::34) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|PH7PR12MB7140:EE_
X-MS-Office365-Filtering-Correlation-Id: 6dc8a9a4-b0da-4b24-c786-08dddefc38ec
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|921020|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?K3BrbGRyaTNIcklYWUIra05oS1RUaVFFYlZmTW5kMElENFNZVHYrOGpGc1pN?=
 =?utf-8?B?bmd2QndjbWF2TGhjbnpqVzJCSDZuT3VXOVVhbXl4amVQL1p3NSsrRllCbWRI?=
 =?utf-8?B?Q3Vra3M0TjRRL1lIRkk3QVV5em5QMWRKSTV3MmgxRWRwcnVtL2pRQ1dOM0Zw?=
 =?utf-8?B?Rko1QVNiYlBnVDJQcmVIcHFsbzdpU0g0T2dkVUgyVTR5U1RsWmZqbmJCVE8v?=
 =?utf-8?B?YjVObFQyaXpGWjFOcnNsejVzWVFlWlc4aU14aUpFemx2TDNEZ0dwVnNoNzFZ?=
 =?utf-8?B?aFlSR1FQcUtFemk2citVTjlDSVQzRkZ6Vk15SnFoWWxpVzNsOVpEaUtiZGF0?=
 =?utf-8?B?Ny81Z0RPd25sK1dGdGVEWGN3QkVVbDZGbE1XWVdEd3ZnZHFiYXZJcVl3MDBy?=
 =?utf-8?B?YW0xSE9ZWXVwK0NFcUtYTTEvMmdCRHNqTWlVSjlySnY3RHJ5YkJGY0hzWTZQ?=
 =?utf-8?B?SHlZQ3NpTlVHQmVIU1RqRWtOT2xGbzZCRUNCcmxxUUt5UjFUSGZNQVZBVC9i?=
 =?utf-8?B?T1Q2dWYyd042c3g2K2hvTXdkenFrejlMMmYwQUZrRVFrNDhsYThYMnFENWNY?=
 =?utf-8?B?RzArb2tSdlFxTDByYmoza3NDMk9UZnNiYWZ2Nmg3VTJpakRyNlh4ODcxT0tv?=
 =?utf-8?B?WHdIc05jOUFVYk93d2tkdEJqZlJwSFVkci9EZyt2TnVaTCtvb1J3NkhQaXVE?=
 =?utf-8?B?aktXaVlLcVJGa0dVbjJNT0IvUVF2WVdmMkZ6OXVxYmhKWm9zOWxqczM5cVE5?=
 =?utf-8?B?WjNiN2xiU3VJR0dWcXUweEJQM3lqRzhMMzZKNmxKRk5pZkIrV0dibGdpRHVH?=
 =?utf-8?B?aTNBbHNxNTdrZDBHMng0WWloL0E1eVdoN0JSVHZIT1ZHWlg3M0FpTGV4U2Zl?=
 =?utf-8?B?aGt3SnNuTlJNQXJ3ZEJ1VUQ1Yjcydmo2eVRRRUNsZU5zeFFnTHgvb3UvVmVD?=
 =?utf-8?B?eXFZSlRkL3JxTXRjd1VJMUlGUWdoSzBVbUZtYjB2bEE2c3F1WGdFdXZvdTVN?=
 =?utf-8?B?anhnMC84dlVzYTJmZGd1RzRCNDIyNHMzSXVrUzNyVXVGN0RrZWQyYWxRbFlS?=
 =?utf-8?B?UXJ1QnZWMzJFUHFJVmpjejBQYTA4Q3FYNkJsN1ovcjlCYmpJT3BidFJ3MHdS?=
 =?utf-8?B?eFZHL1p4UFVzNzVjMlR2dUNTL0hsd1BFc1RWYzBySFVySGtuV2RmTjY3VTc2?=
 =?utf-8?B?RzNVZmZ2ZU5MRTFCUytKb1JPSkpFMm9NYWU2NjVqL2VFSlJOaThtTjZRRFZX?=
 =?utf-8?B?TWhoWTgxZVozZVozbStmYWdtNE43Vm00amlqVnFrUk5jTHU5OTZUMFNWTkN5?=
 =?utf-8?B?SVIydVgrbnMzcXpYeC9PT1hGMjVYU1JKbFdoRUVYTFpEd1cvTXhmNjdDUWM0?=
 =?utf-8?B?a1kwbFM1YXlKeElYT2MrNHExZTNKc2dld2MxdURHYUNzQ21ONjlQQ2Y3N1JU?=
 =?utf-8?B?VmpNWVgrV0JUTW1yYVNCVFl0UXJBN0o1dG5PZjF1WEoveUdUR1BnSUNoa1E2?=
 =?utf-8?B?Sm5TTk5qeGIxdi9kUnRSNzdCckcxUzJ3dWZzVS82S04waG9lUkFTMWNMM2wr?=
 =?utf-8?B?YTAwdGhGV0NBc2VMTUJxWHh6UndvZGMxdHYrYWsycGxYTGoyejdrU3pzN0RY?=
 =?utf-8?B?Qy91dmwvMVZVQmNXc1ZFUzI0VWx1Q2VZaXcrRGZobUtsVHVmeDU1NzJ5QWlr?=
 =?utf-8?B?c2VRTC9QMW1Samsya29NZVpQTGRmVEpUcHpNNjQ2TlRuamFLZ2Q4T1JDV3k0?=
 =?utf-8?B?TTlaeFNZUnMzRWZURk9GVFBnN2xxZmtuMUdCeTdJV1A2TjZtd1Q1TlNJajJi?=
 =?utf-8?B?cFR3L2tBV2ZFVGcrWDZLQ3o3MjlObWY5MlFTY1ZzbUNreUlweFRHMFRoNGxF?=
 =?utf-8?B?OHBieGc3ZzZ3UVdpYnBwWUM4UWVIZWw2TnMvQ3V2b2h3MEZZQ1JRWnZDeThM?=
 =?utf-8?B?OE5TU25URUtySEZjY1ZMdEJJQmxhNUJLa1c4aGhWN3ppZFpEMUNFT0dLbWdH?=
 =?utf-8?B?N29VWDYyQmtnPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(921020)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bVBSQnpNZUQ0aGtNNSs0YkRYTTBZOEsrRnpOMHVZWU1VL0NBYjY2Q3M1cGhY?=
 =?utf-8?B?TmJwU0M4Si9waDM1dnFncXFicytMSEpDNHVqOHRmNEkyaGNUUnJTUUV5QTNo?=
 =?utf-8?B?b1dCcFVoQUtvVjJ3dk5TREpPeFB2NXJJSExKM0xuRkcySGk1d2c4V1BLZ3pq?=
 =?utf-8?B?MzBUdVE4MXR3bEtYaXdrQW1BYUVVRmlmbGV3ZjBpUGNaZVptTktIWDUwNHVT?=
 =?utf-8?B?UG9sbkh6VWdZZHd5VThITXM0SXhvQnpDMk5Ub1o1UUoveTdPcXBnVnBxLzVR?=
 =?utf-8?B?elVXdTFXanVLcDBZazV6TUxXMmNDRVEreDhMVUVEdjlkdGZnMjZWQ2w0Y0pP?=
 =?utf-8?B?Tklua0pZUXJqcmVWZ3pyOHQ3MUwzMVhXY3ZBc2ZHbzZIaUN2ald6eHdwRmF1?=
 =?utf-8?B?L3AyYW01YWVDVE5PcWpJMCtnZk1xdG5PcnQyK2lWSmIxWC82MklkVUlVcXFD?=
 =?utf-8?B?bHkrcUs2bW9LQjc1aUFpMDk2RDRhL21PUTJaZDdIZzZQWjVBUTFvVTdkUk5N?=
 =?utf-8?B?c1pxd0FhQmRrY2VkNWRjcGJiN3FhbnZoK3NlT1hzaW11ZWt3eG91NHZTVzVS?=
 =?utf-8?B?VE1VOEpkWE8zczMveUtwcFdqN05OSlZ4OVFyUXlud2Ztb2Q0Y3F4ZWkvLzRE?=
 =?utf-8?B?SWFUV05OZVNqbnlaczNmOFRGUUtEbmIzVjFQN0dPSzlERnYzZE1JYlZWQmlC?=
 =?utf-8?B?NVFuM1ZuMWdLcCs5SExraHBhL3B3eFVMK3ovaFkrMG9May9sY25CTmFsRCtk?=
 =?utf-8?B?TVoxQVlxLzA0RWJXdWtiK3NpUWF5NnFkZE91dTB2WDJrWmlYaGVoTm5MNXpx?=
 =?utf-8?B?OVRWRnJieUluSnM3RXNQb28xMTJoWDVwcE13Nm5xQ0szS0hHYzBqZ2tnTFVw?=
 =?utf-8?B?R09qNGNoTDRtTEdtVUlwWDJ4WkxBanQvRzhWZE9QYThtWEFRMEZ3cFQwRklV?=
 =?utf-8?B?QkRCNFJON2VMSEhVcmw4WVViOEhVVnAzc0U4R1krMDgvZ2tsL3UwZmpva3M5?=
 =?utf-8?B?bXVDVlI1blNObUpFYzZPTTdMakJhT09JRWFXZ2ZHaDJrL3dCb3NCd3FFZ0My?=
 =?utf-8?B?cGtSTyswUG8zZTJWdUhoS2wyZFRiMlRGSkNrdWVMR0NSZGRBaEtXTFNsSGFk?=
 =?utf-8?B?RlpyWDkrdWZjMHZmRlZPOTl4Tmd2RzhxRnBxc2xzbUFQRHdKbFRBTlozL3Rs?=
 =?utf-8?B?Mk5LVVdnYnloRytJdmFJYmtnMXpCdWtQdWJFSHIxT01mK3YrZXpCVmNtZTRZ?=
 =?utf-8?B?N0tXUEdLaFpaczh6SkY0bDNNVmFsdWJ3dzBZUG5XbVAyRjhsQlB6ZU1sQWlG?=
 =?utf-8?B?dGlNT0RxM0NTemtobnNibCtuNmNFcXdqUUhEQmt0MWpHeWpPcUl6WHVGQ2xQ?=
 =?utf-8?B?aUpJTFR3dUJCTURoOGZwQi9yd3BFS2p2akMyUTM1R3VxbC9sS1d5RCs4MGg5?=
 =?utf-8?B?V3YvbGx1TUMzL2ZldkdLRlE3dnpEV3R0S1BLSHNhbjB0N3pEeVM1NXJ1dzRF?=
 =?utf-8?B?SXkvY1MwRTc3eU0zTUVDYUgyRHB5NUZvTUxoS0wyZDNtQ256QWl3Z24rR3lz?=
 =?utf-8?B?T0E5aUUyQS9obHpMc3JsZGF6WjhIdFpDdDFKRmVNVlEzWitsNFZtVStnTncr?=
 =?utf-8?B?ZVpUN0xwbkI3c1Y1ek1IWENWWmRyUXNhamFmUklUUnJIVGErY1FQYmR1Tzl0?=
 =?utf-8?B?RFg3dTJuRkdHQjErWkxzTWRjeWtSWE14KzFBWjR0bC9wOHBpV1JTaEowdWpp?=
 =?utf-8?B?UlhGNTJFMjV2Rzl6dHpkMTJoL1ZYd0JrT3BjRzFScnJsNkhlcEhWd0Z5ZXhx?=
 =?utf-8?B?dGpDMGx0ajNUeHZwM0gzbHhUUFdoazFkUUdQdTlVSHZMK0ttVkNmTS9YaHNI?=
 =?utf-8?B?MDc5SHVPTDdIL0VreEx6OEtZRmQ0UU5xcU94M2thY2xIWXBrVnZwUm9xK2dy?=
 =?utf-8?B?TFE2YWQvQkdPb2RKdWFtcjREdmx5OHRFc3J4Q09iZVpKQUlSWTl2ZTNGUFVW?=
 =?utf-8?B?djhMYVEybHo2cS9JS01FNnJnMXl3eW14QzN5RkN3TVNjeHJnUTZHUmhvRjVX?=
 =?utf-8?B?dkZxbHN6Qi9CVUdIVXZ2YnFLZ0N1YlVNNVVEdVFuS0c2eWlwZ016WExKOVhx?=
 =?utf-8?Q?xVkhl6eIw1bfHOg3kUYJ+t64n?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6dc8a9a4-b0da-4b24-c786-08dddefc38ec
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2025 08:41:42.6820 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5bMs2NHwG5wnsn7CsqM6qzoRhecbiDcVzYmGqEsr2IoJew2tg2p+z3GXlQ05Iivo
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7140
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

On 19.08.25 10:25, Liao Yuanhong wrote:
> The amdgpu_fence struct is already zeroed by kzalloc(). It's redundant to
> initialize am_fence->context to 0.
> 
> Signed-off-by: Liao Yuanhong <liaoyuanhong@vivo.com>

Reviewed-by: Christian König <christian.koenig@amd.com>

If you want a challenge what we would really use is a scan of all the structures defined in drivers/gpu/drm/amd/amdgpu/*.[ch] for unused fields.

The UAPI and BIOS/HW header files are full of padding fields, but there shouldn't be any in the driver core defines and we sometimes forget to remove fields from structures when they are not used any more.

Regards,
Christian.

> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c
> index bcb74286a78a..fd8cca241da6 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c
> @@ -120,7 +120,6 @@ int amdgpu_fence_emit(struct amdgpu_ring *ring, struct dma_fence **f,
>  		am_fence = kzalloc(sizeof(*am_fence), GFP_KERNEL);
>  		if (!am_fence)
>  			return -ENOMEM;
> -		am_fence->context = 0;
>  	} else {
>  		am_fence = af;
>  	}

