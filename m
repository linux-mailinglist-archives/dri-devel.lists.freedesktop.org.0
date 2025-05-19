Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DD700ABBDC2
	for <lists+dri-devel@lfdr.de>; Mon, 19 May 2025 14:29:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BACB410E30F;
	Mon, 19 May 2025 12:29:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="mlQYlksw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam02on2047.outbound.protection.outlook.com [40.107.212.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 59B8A10E30F
 for <dri-devel@lists.freedesktop.org>; Mon, 19 May 2025 12:29:34 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=afgaDTOId0NuLfmBJ5Pmb5MrdM29WqTP+c4pHIhZaj95vR6igonVtOTRURKFluiTzOEDmMiGu9jeSzMxVsnF4ZEx8dVjk9OHKo3DGyhDR0dyHSzVHSKJTGMEcnLd5VBy5xSwe4ub8gRp8I8/keJZXKh2YQ4SICbSqBEBftA0lyNU5/4R5ddWR7YXGn55bD1dbA1V8MrT8hDYLOBt+3TmyqAlPClG/LcvOvMm4A4ZGpy8orCnZF274bvhXMU5kqjgMTN7h4CZ74UHb/xtBJ/3u2EzihErj6KTzMycPmnusqkkXLSvJeW+aj0Wxze4Ucu5DpdAx36Ehktk8pQfUXqPsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bCbEiDlAS6QKzWiDJO7AJJ7X9olk0CYm021Aw4nel3Q=;
 b=dhNqZvaPPfgu/1KYIgXpoqIzTdxtlflvj3ij08OadwTXXqrLXJy9WNRJgVDN/52k8GVBxPyRNEKOiYS2BqEP4ZtvA84nzxf7ZvtW8ljIubq4/wdcBjSnlxrWbsFBVgPdTdlnfcW+rqdoUqZBgltVDF+ezhvgmyReidi2vmXCiI9pbdCtPyL9Qt+WZpIfN+bk7p22iixX5hLnoVOORaMlBqY8lNhC3FOfDAEpXP/SpH+xlVKJ53XKqw9wdChCsZKh3keuQGxp3XNYLzLhNh07bOjGPC3oGfS06X5ogMEClbjUQ5hpoRrThDpD2shgTpxSada3yjpzWRh2qx8+9ls7mA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bCbEiDlAS6QKzWiDJO7AJJ7X9olk0CYm021Aw4nel3Q=;
 b=mlQYlksw8ALucRQFmcmXNEMoMdznlSaiPs0L7lDf1+FNB98latLNc24qapfD4sQcoLoleKc8HzUB1FXEFiJpiCdLwuiYO8lTf5yfYme5wB1TUudEa1YlF7TefEexiLMcbC2BfW0UANnuNsT+I/D/ebpssQ5n57lS/X6YcIGdzys=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by BL1PR12MB5779.namprd12.prod.outlook.com (2603:10b6:208:392::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.30; Mon, 19 May
 2025 12:29:27 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%7]) with mapi id 15.20.8722.031; Mon, 19 May 2025
 12:29:27 +0000
Message-ID: <9a907e58-8c18-4e38-a7a7-d2c87ab9fef1@amd.com>
Date: Mon, 19 May 2025 14:29:21 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] drm: Add DRM prime interfaces to reassign GEM handle
To: David Francis <David.Francis@amd.com>, amd-gfx@mail.freedesktop.org,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Tvrtko Ursulin <tvrtko.ursulin@igalia.com>, Simona Vetter <simona@ffwll.ch>
Cc: Felix.Kuehling@amd.com, David.YatSin@amd.com, Chris.Freehill@amd.com,
 dcostantino@meta.com, sruffell@meta.com
References: <20250516193336.3531982-1-David.Francis@amd.com>
 <20250516193336.3531982-2-David.Francis@amd.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20250516193336.3531982-2-David.Francis@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BL1PR13CA0293.namprd13.prod.outlook.com
 (2603:10b6:208:2bc::28) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|BL1PR12MB5779:EE_
X-MS-Office365-Filtering-Correlation-Id: 51a00913-9771-4193-ec78-08dd96d0cbb7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NFBZVTNtdmhGTGp3ampaVjh3eSt0NFNtNWNWdGxKTU43cjF1VkNmVjVrbEs0?=
 =?utf-8?B?UEtnYzNQR1NuNDgvZDFUOE9VNGhQbjQwZjhGaml5cktsNnpscllPZG9KN1Y3?=
 =?utf-8?B?K2dUNFVlVURJK1dHNHlIMzlyVFR1cnc5cG00WHZIeTdOSmxrY1RlQWxjbzJa?=
 =?utf-8?B?ZDNWZE40ZHo2YitURENBZ1Zzd2lvVEgyUXpUVzVwNStlL3hqbURZS0ZaWGVR?=
 =?utf-8?B?R3JFbU9NRDdjd0J3RUVkd0xDQnJWbXhCT1BuNGNXYWlIV1RQbExiZkdUM1FF?=
 =?utf-8?B?bEJwSUh2UmVLdVMxdjlvZ1hyaUpwb2g5V0hHbkF6ektHSk5yUEVEOHcvU0V5?=
 =?utf-8?B?VmY1cWo2aVVZbmxwTFl1N1lyVWMvQzc4Y3dPcldwS2JnZDVVYkJHbjZRTkk0?=
 =?utf-8?B?U0lHWG9BbWRpdmJZQ21yUEpwL3I4QjJIWEJQNGZ4eHlXQ1FwWXVuYldneGEx?=
 =?utf-8?B?SEp4Z1lKYXVSbGdDNCtEOHNyVVUrVTErSHI3OWl2ajV2NjFDZnNjOTNvcWph?=
 =?utf-8?B?alArRjFYb3d4YzZuNzk4b052Wmw0ZWdiTmVjZUN0OUhSeG5HNCtMZmRpcXdX?=
 =?utf-8?B?Ym5UdEwyaVBxQTBteVJrSi84S1paSnJLQ3h1MlZSUE1mcmltUDR1TG9ybEdu?=
 =?utf-8?B?RXg2NC8vRzhlOEM5VllrbFliRnlaaHVlcy9jN04wS2M0U1N2MHNXeThpVFJ1?=
 =?utf-8?B?ZDhZTHlUOXBQc1d3d0ZYK0R3aDdEZG1sZW15cTRERGpuTWV1a0pNdmlObTN6?=
 =?utf-8?B?akVLcVpxU3MxYmU1UUxpMDBMZTVoaXhIQURwY01VelhKbndKVE1FbzZJZzJR?=
 =?utf-8?B?TG15NG9XQjJ2ZnFmUzVhZ2FGdGJ1ZzdpT2tWY08ybmlOSmVIOHZLYkphWmxt?=
 =?utf-8?B?QjMzTHZ5L0l2cTNuNjlTb3NrVmhKOWQ4dUQ5RFpORTVQNmZ3Nk93V2grcDIv?=
 =?utf-8?B?QnovMnhrS0tXL1RISzZLbEVuZlAxcVBoV2ovQjFuSFpsNVRURlBXV1BqOUda?=
 =?utf-8?B?RlBBQ3Fmck5ibVptc0RiYk5mUTJhc2JZOGgxRHZrNDE3MmxnSE9Mc1I3cUh0?=
 =?utf-8?B?T2ZSMDJCS0l5Ri9BdmpsMWszTXk0ZjlWU05uaVFNdTU5aE90djZTTlJqT3JG?=
 =?utf-8?B?UU1tV0syc3FsWFh0MnV0WE15MnlwQ21mLy9EeW9OaWRvZGMwYWR5VkZmVzJX?=
 =?utf-8?B?Y1Z4VVIrQ0EwcXh3Nnk1S2trZ1lYZ2E3UXZpWnE4UmJXU0xCMC9VbHcxUFhN?=
 =?utf-8?B?dmMxc1pCSi9Zckc3QnNGM0lFNWRKL1NwSWhicXZXUkdRdzJZZFFhNlhmdXM4?=
 =?utf-8?B?YXVGbURWcFh0NS8wcTRNQ2dGd1o5bm45SnE1eDBHeG5vYVZGNXRsVFFsR2Uy?=
 =?utf-8?B?UHBuS0Z5YUR1UVdHTG5JSUdhTzlCbTIxcE1WUnRuR2tLYVBOVjFaRllreUFU?=
 =?utf-8?B?MlpSNTdNaVlyWTlMWWNZZG1kbjd6OGo4bExYSHMyTC9ma21WWTUwWWVmaHVS?=
 =?utf-8?B?Y3VLdFhJcGpncUZLL1kydFhlbkRlN0RhbW1yeWJEWm0xVnlzNG0vYVJaZjdX?=
 =?utf-8?B?bit1cVphYk9OM2FUSTJoU0hqdG9GZ2RkaklRRWJSVGZ2VnJoRktLRHUybjFK?=
 =?utf-8?B?MUxSYi9NZUNMZEt0TkhMWldRN2tnZG1mSmx5N3ArZXVBZ0xSQ3RjWkdhdy9n?=
 =?utf-8?B?MmxDM3VvWnQ2ZWNlMWVWdk9WTC9WUkhPd3BoQ0FOalJpZk52MmxFOXBGOEd1?=
 =?utf-8?B?WFdUb1ZuWSt6NXhNazR0NG1iZTZPVU5McjRZV3dnS2M4OUMxT2dJdDFyYTkr?=
 =?utf-8?B?ZDIrdDZNQ0ZOWFZzNFJBelVneElqbklYWHlmREJnSnhNQmVnQzhmWUZOd2dS?=
 =?utf-8?B?Y3d4R1BZclF6N2VOR2o5eUI0YW5JM0Yya3lBNjF2R2ZJVXdzby9kM3pkQ21L?=
 =?utf-8?Q?0rCmkDu4RDA=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cjRPRFFBZmpoSWRzTHI4TDhWc2w5THgrRlpiNWdocDdoOXFaVTdVL0duL3VY?=
 =?utf-8?B?RjMxZC9Xb00rUS9SVUhJYThBd1RTWWc4R2VUaVYzOGY0cTF4TWo2ZElRc1Rn?=
 =?utf-8?B?VWpxTnJGUUpYTks5aEEwTFNxSDJib1lRYzA2c2xwbjEvSVR2NEd3NVl3UTlR?=
 =?utf-8?B?RFNoWWQ4NzlVTlNCa1U2TkQxSS9CL2tnZ0FrdmdPRWxHbUxQUllQZEgzdlpG?=
 =?utf-8?B?SG9wMnAyY2ZiUFNOSkNXbHEyVTZnODZkTFpscnQ0NGlhYmk3SU9uRytralB4?=
 =?utf-8?B?KzhzR3MrSDF2RzcwV2J4YmVkdCs2dS82N0o5MTlkRFRMYnA5U05nNnk2SWpI?=
 =?utf-8?B?dWo5UHZITU1GKzZ6MGVWT0UxallqWXorRWM3WG9QbmNPT2pBbEdUVEpsQnM2?=
 =?utf-8?B?bGs5YTlHenlaRE1QWlBET3VkUnpSMHRoQ0FnNmpPY2NOUHl6K1RHZTJ6Z2s5?=
 =?utf-8?B?Sk8yN01DeEFGLzRYbmNOS0cvSGR0QktCUUVZMmp6ZVhkUjR2aERJK3BPc1JP?=
 =?utf-8?B?UFpLOFZ5YXF5bVFwdUZkTVV1eFJjRGQ0V0VkYS9ZTXF1T3NsWG1wY3FZZTJP?=
 =?utf-8?B?d2M5YTg0VThWMjlka3VPRjBNWmNRdmJMaWlkMWMyTzYzMldWTzhzaFFXY0Iw?=
 =?utf-8?B?VGhzYjcrblM0OXBZVS9mOXhiVGpWZ1oxODhCWjRORG9GOWF1aXhTZ3BlbTRa?=
 =?utf-8?B?Mmdlb3UybVhWYWZlaG9HcXlUMDJWUStKS2kvYUx3SHRHMlFNQ3IrcjN3SFB2?=
 =?utf-8?B?U1JQTDhTeGVGVzZ3b0ZGRjVOQnhPdzh6ZEZJSXZ3aU1jSFE4NkRlT2lNQkh2?=
 =?utf-8?B?Q0hnaEhId2tvNXgvNGR5SlNBZEdMamdWcy8xVEJhVW9ML1NBYUNabTZNMkRV?=
 =?utf-8?B?ZGpvMWpxaFhWS0RPSHFkRFlIMHlmMDQzdlJWRzUzaGl2aWJRbnhWNC9UQVlF?=
 =?utf-8?B?VHhQaXlGZ2FGVFFQQmpraDkrelp2OFdJdGJrUEVySnlHRUoxUlNGUjd2WFhZ?=
 =?utf-8?B?RGt6NjdKdHVaZ3ZkRk5oOFEzaitLaE5PNkc3SXlwMCtOK09CdktjTGdwaURD?=
 =?utf-8?B?OEFaL1pnUGNHdmpaVUlGLzE2bVFFVU5LSkZ6ZGcvMEtMaTdYRUJlVUl3ajR2?=
 =?utf-8?B?bWp2YVl4a1lBVnVjTitUWHZ2L01GMmFFVCtQN2NNTGp2MEVRb0xnWjJMM0VR?=
 =?utf-8?B?aERySXZFZjE1WWQ1RlRYakRRR1NlRlFPTGNJZnZIUzV5MU4zM2doTklGeEg4?=
 =?utf-8?B?aHBvZGNpYVJ4K3dJL01JR21Eb3Jab2VXT3NrTThDcXA4V00zT3NTVytrUm9u?=
 =?utf-8?B?ZWRuME5XZWx2bFQydlk5Z3pzYm1aYTlBMmlZOUNjTlBJMm5SQ1lLalpsVEpi?=
 =?utf-8?B?Q25sL0U2ZW1XUkc3NFFSUkFOdzFsME4xOG9BclE4SFFzeWpKS0RtN2Z5ZHdO?=
 =?utf-8?B?Z3pCcVg4NTY5Mzd1ZVNaWjliK2VBV0NMY255cUxnN0ZwN1NXYmVjRlpJOERY?=
 =?utf-8?B?MktTMEY5RkZqZ2NkbXpZc3NUV25tU3lna0dEbkRPR2dTMkhuNWI1b25WZ3Ni?=
 =?utf-8?B?V3l6SzBZUFFBRkp5QWNWVWp2Q29mZzRlM1VJRExDaGJSRVJVaVpYRnhmdEZ5?=
 =?utf-8?B?SnBITmlab0I2NVFvSHZtVlBlQkxNbktEcGVjcEdGbmlmSmZPcEZXcnYrZCtv?=
 =?utf-8?B?WURyZWZLNXE4cFJ4M2toRHVwdU1BVGd6cGhyMDFmUVRYai9kUWxUcS9qKytU?=
 =?utf-8?B?aktuRzNHTFBQT2VFbHJJV1B2WUI1VEdUZHYwN0FYY24rUjUydi9jZkV5eVFj?=
 =?utf-8?B?NGJQUXd1cXFOZEVvZVdaQjNWTzlDTGdoeEYrKzd6a0hjYVNUQ05yZ2t5WHNU?=
 =?utf-8?B?aDFqeFBVZEplZ2JIWUc4V09rNC9KU2orNkpvaFFhNGpZaWd1QndXSjlldFhK?=
 =?utf-8?B?Uk9hb0lkN3VFbEZTOHJ2Q2l5S2hKTVptNmtvbFRHTkJKMzA1SERMUTE0VDFj?=
 =?utf-8?B?QUEzbFhmUzUrRFl0Z2RJOXViVHpadU5JMXZYcTVkWmdGODlJNkhSS2FZMTdr?=
 =?utf-8?B?S3hsY2N2bm93bCtqWGJNa1FEakN0L21qSUoyYmVTMythbjh1WElSUVF5TVN5?=
 =?utf-8?Q?vc84=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 51a00913-9771-4193-ec78-08dd96d0cbb7
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 May 2025 12:29:27.4316 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pSPnCm3dr8zElB4+NQ1dAF0PWm+/tP0d/JcaGHa58+HhpYUtqw/47sOOy3QlXL+3
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5779
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

On 5/16/25 21:33, David Francis wrote:
> CRIU restore of drm buffer objects requires the ability to create
> or import a buffer object with a specific gem handle.
> 
> Add new drm ioctl DRM_IOCTL_PRIME_CHANGE_GEM_HANDLE, which takes
> the gem handle of an object and moves that object to a
> specified new gem handle.
> 
> This ioctl needs to call drm_prime_remove_buf_handle,
> but that function acquires the prime lock, which the ioctl
> needs to hold for other purposes.
> 
> Make drm_prime_remove_buf_handle not acquire the prime lock,
> and change its other caller to reflect this.
> 
> Signed-off-by: David Francis <David.Francis@amd.com>

First of all you need to add more people and the dri-devel mailing list for review.

A few more comments below.

> ---
>  drivers/gpu/drm/drm_gem.c      |  5 ++++
>  drivers/gpu/drm/drm_internal.h |  2 ++
>  drivers/gpu/drm/drm_ioctl.c    |  1 +
>  drivers/gpu/drm/drm_prime.c    | 43 ++++++++++++++++++++++++++++++----
>  include/uapi/drm/drm.h         |  7 ++++++
>  5 files changed, 54 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_gem.c b/drivers/gpu/drm/drm_gem.c
> index ee811764c3df..f56eeed808d2 100644
> --- a/drivers/gpu/drm/drm_gem.c
> +++ b/drivers/gpu/drm/drm_gem.c
> @@ -282,7 +282,12 @@ drm_gem_object_release_handle(int id, void *ptr, void *data)
>  	if (obj->funcs->close)
>  		obj->funcs->close(obj, file_priv);
>  
> +	mutex_lock(&file_priv->prime.lock);
> +
>  	drm_prime_remove_buf_handle(&file_priv->prime, id);
> +
> +	mutex_unlock(&file_priv->prime.lock);
> +
>  	drm_vma_node_revoke(&obj->vma_node, file_priv);
>  
>  	drm_gem_object_handle_put_unlocked(obj);
> diff --git a/drivers/gpu/drm/drm_internal.h b/drivers/gpu/drm/drm_internal.h
> index b2b6a8e49dda..7437e5eaf8db 100644
> --- a/drivers/gpu/drm/drm_internal.h
> +++ b/drivers/gpu/drm/drm_internal.h
> @@ -82,6 +82,8 @@ int drm_prime_handle_to_fd_ioctl(struct drm_device *dev, void *data,
>  				 struct drm_file *file_priv);
>  int drm_prime_fd_to_handle_ioctl(struct drm_device *dev, void *data,
>  				 struct drm_file *file_priv);
> +int drm_prime_change_gem_handle_ioctl(struct drm_device *dev, void *data,
> +				 struct drm_file *file_priv);
>  
>  void drm_prime_init_file_private(struct drm_prime_file_private *prime_fpriv);
>  void drm_prime_destroy_file_private(struct drm_prime_file_private *prime_fpriv);
> diff --git a/drivers/gpu/drm/drm_ioctl.c b/drivers/gpu/drm/drm_ioctl.c
> index f593dc569d31..f9b531311aac 100644
> --- a/drivers/gpu/drm/drm_ioctl.c
> +++ b/drivers/gpu/drm/drm_ioctl.c
> @@ -658,6 +658,7 @@ static const struct drm_ioctl_desc drm_ioctls[] = {
>  
>  	DRM_IOCTL_DEF(DRM_IOCTL_PRIME_HANDLE_TO_FD, drm_prime_handle_to_fd_ioctl, DRM_RENDER_ALLOW),
>  	DRM_IOCTL_DEF(DRM_IOCTL_PRIME_FD_TO_HANDLE, drm_prime_fd_to_handle_ioctl, DRM_RENDER_ALLOW),

> +	DRM_IOCTL_DEF(DRM_IOCTL_PRIME_CHANGE_GEM_HANDLE, drm_prime_change_gem_handle_ioctl, DRM_RENDER_ALLOW),

>  
>  	DRM_IOCTL_DEF(DRM_IOCTL_SET_CLIENT_NAME, drm_set_client_name, DRM_RENDER_ALLOW),
>  
> diff --git a/drivers/gpu/drm/drm_prime.c b/drivers/gpu/drm/drm_prime.c
> index 0e3f8adf162f..8f3317fcae49 100644
> --- a/drivers/gpu/drm/drm_prime.c
> +++ b/drivers/gpu/drm/drm_prime.c
> @@ -190,8 +190,6 @@ void drm_prime_remove_buf_handle(struct drm_prime_file_private *prime_fpriv,
>  {
>  	struct rb_node *rb;
>  
> -	mutex_lock(&prime_fpriv->lock);
> -
>  	rb = prime_fpriv->handles.rb_node;
>  	while (rb) {
>  		struct drm_prime_member *member;
> @@ -210,8 +208,6 @@ void drm_prime_remove_buf_handle(struct drm_prime_file_private *prime_fpriv,
>  			rb = rb->rb_left;
>  		}
>  	}
> -
> -	mutex_unlock(&prime_fpriv->lock);
>  }
>  
>  void drm_prime_init_file_private(struct drm_prime_file_private *prime_fpriv)
> @@ -1084,3 +1080,42 @@ void drm_prime_gem_destroy(struct drm_gem_object *obj, struct sg_table *sg)
>  	dma_buf_put(dma_buf);
>  }
>  EXPORT_SYMBOL(drm_prime_gem_destroy);
> +
> +int drm_prime_change_gem_handle_ioctl(struct drm_device *dev, void *data,
> +				 struct drm_file *file_priv)

This is not a prime function, but rather a GEM function. So the new code should go into drm_gem.c, I suggest close to the drm_gem_open_ioctl() function.

> +{
> +	struct drm_prime_change_gem_handle *args = data;
> +	struct drm_gem_object *obj;
> +	int ret;
> +
> +	obj = drm_gem_object_lookup(file_priv, args->handle);
> +
> +	if (!obj)
> +		return -ENOENT;
> +
> +	get_dma_buf(obj->dma_buf);
> +
> +	mutex_lock(&file_priv->prime.lock);
> +
> +	drm_prime_remove_buf_handle(&file_priv->prime, args->handle);
> +
> +	spin_lock(&file_priv->table_lock);
> +
> +	idr_remove(&file_priv->object_idr, args->handle);
> +	ret = idr_alloc(&file_priv->object_idr, obj, args->new_handle, args->new_handle + 1, GFP_NOWAIT);

This needs to be reordered.

First call idr_alloc() to check if the new handle is actually available.

Then call drm_prime_add_buf_handle() when the GEM object actually has a DMA-buf associated with it.

When that worked call drm_prime_remove_buf_handle() and finally idr_remove().

Regards,
Christian.

> +
> +	spin_unlock(&file_priv->table_lock);
> +
> +	if (ret < 0)
> +		goto out_unlock;
> +
> +	ret = drm_prime_add_buf_handle(&file_priv->prime, obj->dma_buf, args->new_handle);
> +	if (ret < 0)
> +		goto out_unlock;
> +
> +out_unlock:
> +	mutex_unlock(&file_priv->prime.lock);
> +	dma_buf_put(obj->dma_buf);
> +
> +	return ret;
> +}
> diff --git a/include/uapi/drm/drm.h b/include/uapi/drm/drm.h
> index 7fba37b94401..ae701b8f9314 100644
> --- a/include/uapi/drm/drm.h
> +++ b/include/uapi/drm/drm.h
> @@ -625,6 +625,11 @@ struct drm_gem_open {
>  	__u64 size;
>  };
>  
> +struct drm_prime_change_gem_handle {
> +	__u32 handle;
> +	__u32 new_handle;
> +};
> +
>  /**
>   * DRM_CAP_DUMB_BUFFER
>   *
> @@ -1305,6 +1310,8 @@ extern "C" {
>   */
>  #define DRM_IOCTL_SET_CLIENT_NAME	DRM_IOWR(0xD1, struct drm_set_client_name)
>  
> +#define DRM_IOCTL_PRIME_CHANGE_GEM_HANDLE    DRM_IOWR(0xD2, struct drm_prime_change_gem_handle)
> +
>  /*
>   * Device specific ioctls should only be in their respective headers
>   * The device specific ioctl range is from 0x40 to 0x9f.

