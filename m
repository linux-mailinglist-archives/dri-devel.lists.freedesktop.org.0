Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DF16C62F49
	for <lists+dri-devel@lfdr.de>; Mon, 17 Nov 2025 09:47:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6EE5E10E302;
	Mon, 17 Nov 2025 08:47:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="djc+SZqU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CY7PR03CU001.outbound.protection.outlook.com
 (mail-westcentralusazon11010006.outbound.protection.outlook.com
 [40.93.198.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6406810E302;
 Mon, 17 Nov 2025 08:47:53 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QN/5svfgYCwRSZgqiVVeHNRpi7bPK0pOB4+96Q+qUcNGsiqmtUc3KJdfRj+w6742/cJ59wf5bx4Qnu7Cc8sdw0igQjdt6AyYqXs6gdaRtvse5RIn8xFBzgPVNvCekXoFHFiJ4uDhmSQ9I+FoYIm6sWJX37DZBRRVRSPJ6R9oV1LYnRGZ/vE3aNgF0y6EqahsEtdxGmCo1mqq8PkIVJEqVjJvydbxKqiAj1BRrGpZ3e5xKArUvhklqUXBH4xv82Up5fHiEXFm6oMj0IAP9SjVUoCsY9T3fH1wK6aE7/lD7qHrrgQkCQxMv4T9V1P0PW/Ii6fcTUpOML0EmLS8CuM2SA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qamzGq7Ax7GfiXIkdYjNgKzKFHxcybrTBVtF0aBDo4Y=;
 b=h0GJFTXdff1c+ljisxg4GpVS9aMlO29YB+GSTlTs1ESW3t/yySG7pyWV5+6zg5fWfPtLwFB5iMIE/AwKVfiqEnlgZUl1BvOYigPFBjHT0ANhL44TUebS94oDUQhkk3PMeKysY2cm8rv4+wm7ZHMsbXTGWXc1aVCAfmLAUcAkxxpovt10KHtW9XcsIA/F+ss2DR8sR03U/cBjtnGp4Eie6u4KetUE8ujvg7DY9WUxlkU12BUPX9l0jdJArsTzVFM2ylVou7UV+2LLz3VG9BlRKFqheCWDu43Qzc25erT1SDs49kL3+7qgpOmIoLd7tlNjF32vLOwidFzIOj3N0PhDJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qamzGq7Ax7GfiXIkdYjNgKzKFHxcybrTBVtF0aBDo4Y=;
 b=djc+SZqUh1vAcKXhkn0Il6ZX8lJig4KMRcDCkgAw1xk/BE6K3N37wv7EsSMdY8qFXZWOrJrgvIirnxDBCAxRkP70k6l/NhYOfcPKPvnQvBU31zE3SwRDyaMI9yhEK6gdFMte9VTaht06QrsRk8rYAohMEyGwQLGXxrbU07n9rV0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from SJ0PR12MB5673.namprd12.prod.outlook.com (2603:10b6:a03:42b::13)
 by DS7PR12MB9525.namprd12.prod.outlook.com (2603:10b6:8:251::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.21; Mon, 17 Nov
 2025 08:47:51 +0000
Received: from SJ0PR12MB5673.namprd12.prod.outlook.com
 ([fe80::ec7a:dd71:9d6c:3062]) by SJ0PR12MB5673.namprd12.prod.outlook.com
 ([fe80::ec7a:dd71:9d6c:3062%4]) with mapi id 15.20.9320.021; Mon, 17 Nov 2025
 08:47:50 +0000
Message-ID: <af0e47da-81ef-4247-ae10-52048d797291@amd.com>
Date: Mon, 17 Nov 2025 09:47:39 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 11/20] drm/amdgpu: round robin through clear_entities
 in amdgpu_fill_buffer
To: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20251113160632.5889-1-pierre-eric.pelloux-prayer@amd.com>
 <20251113160632.5889-12-pierre-eric.pelloux-prayer@amd.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20251113160632.5889-12-pierre-eric.pelloux-prayer@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0041.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:c7::11) To SJ0PR12MB5673.namprd12.prod.outlook.com
 (2603:10b6:a03:42b::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR12MB5673:EE_|DS7PR12MB9525:EE_
X-MS-Office365-Filtering-Correlation-Id: be706e8f-6f3a-4193-6991-08de25b5fd71
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?QU5neWdPUzdiUmUxYzVBRUM5dVRJRTJBMERNMlFXZmlRR1BFRndia295YVZZ?=
 =?utf-8?B?cGRJbHNQMFJPdS9wcnhvTGhZalBmbGdkWitvY1hDV3laWVl6YXR2aThnaWgr?=
 =?utf-8?B?bTRUaUUxNm1XMnVPNzhjYlRXRDhvdUFnRGRiWEZ3cmVjWHkrdVBGbkxjUGtX?=
 =?utf-8?B?bU1XVlc2SnljMkRhTEtmb3EwdXpsTTdtYncreml4bGM1WTFFK25odTc2MnI2?=
 =?utf-8?B?QjFkZnE2UUdkc1FDNFY4c2Fsdk1Fb0F5eEZPY2dvV3JTSExVQTh5RTFjaUZU?=
 =?utf-8?B?TFV4WEZwVGVVRnpCaUlHdkpwVDRDdnZUaWVFaTJPRHVuNUtPZDNqVExsNEFQ?=
 =?utf-8?B?QnkvdTJMZ1hjekF3NjZUY2xma3kyRXpObkc2TVZZODNIOCtJQnVBMVJwbkcz?=
 =?utf-8?B?MDhaMzRueTAzamlla3p0Z2srZ3QwYzRWV1FueE9pS2FraGVxVlJKNCttdFhP?=
 =?utf-8?B?YjRPM0w3cWoxK0tRVE5lRFJaN1RZTHVQZEhZOHFqbEQvUW9wK0QrclJDaWFH?=
 =?utf-8?B?WWt0NDVUdENlcFNjdDU1SnNmdGs5U0xMRHFlSnFSQm84QkRZU3dBZDFYUVlV?=
 =?utf-8?B?aERWOFlwU1JVVW9qMGZSMjV3aHAveFVyNXFBbjJpNGEwRWoxdFNwSUw3Q29Q?=
 =?utf-8?B?aE5ZWkc5SWdkLzJ0WDducVBwZE0vcXE5eVR0Sk9LemhKT2J4NG5FRXNtMHk1?=
 =?utf-8?B?ak5PM3B1NTlOZE9ZZ2ZIOTY4WXhSckMwQ3ZYQXV4OXBLRTdnSmlXMEtCam1F?=
 =?utf-8?B?MnR1WXRzaVlZWS9nV2Q3M0RHQVpHN1Q5Q0ZQNVc4U1luWjNjRnlYbTg5Witw?=
 =?utf-8?B?QTBwRVJUdGNBblpZbFY1KzRjU3lMK3VFYUNZYjJIUCtqaVA3VlN2SmtBNVJ5?=
 =?utf-8?B?cVlPaGM0aXlRTDNBOW5nVHdRSVBhVHZwb1I5ck1JdFpON0lwS1NWV1JkTUtU?=
 =?utf-8?B?M2R4Nlp5UGgyRzdzQTVGNS8zSEozSVBYdmtGUzkxTEVCYUIzK2ZiTmlXTWE5?=
 =?utf-8?B?SWNtT3UyYUlWeUMxNDZIeUJReU5wQmIzbkczdHFRYllYSGw1L05VbzBuVW04?=
 =?utf-8?B?V29OUkJxVjBOekE4ZEJVNTl1QjdtYlppWU91L0F0Tk40eXpLV1V0Z1RiU2Yw?=
 =?utf-8?B?dHlBTEJhSjJxN2VTQ3Y5VFRTcytXVzJiSU9oVkNmcldHcHpsWVh2OXZuYWFS?=
 =?utf-8?B?dXhlM0hTaWVMeGoreGJQRUo5OFU0RUt0UUlTSjVzY3lkc1BHSXMxbDlhT3lV?=
 =?utf-8?B?NE5RRGM2U1g2VFo3QUhHTWhKSFJnNFdmMGtTa3hjYWtCemVoSE0rMUJ6Ymsy?=
 =?utf-8?B?OVBSRzR6TllvSkRmWGQxb0lnRXFHVTYxYXZ5ZEljNVY2eHdJUERJbnF4VTF3?=
 =?utf-8?B?eGF5ckt1SUNlL2FHV0UvaGFLbDBNbGFqRmdHZEJSZXIxL3lQa1pQeks1RXBJ?=
 =?utf-8?B?b1R6aWZFaEN2aUtDdTh4OWFrRW1GSUtJeTZiMjdBMlNsNWxFdjlZZDBORU5Z?=
 =?utf-8?B?OHpMSEVyY09IT3lneE9GTFc1ZUZkc1FCeWVFRURlZmFORTFWaUg3Y1ROeE5F?=
 =?utf-8?B?MitJM01ZUzhCalhVVWVVci94clFJbmV5RWdtdGNUM3E0QXVyV1hFcVUxa3Rr?=
 =?utf-8?B?SllSdWt0TnYvczU4RmQvV0pFcXB0bEJBT1Azd3lrdEZ2Y3JqTGZTMCtOR3Jj?=
 =?utf-8?B?YTFiN3pOVkF4NzdMSWNIV0phd21RT0NHQ081M0NjVzRIdXpSd1FnVHlLbDJk?=
 =?utf-8?B?NERNa1VKUDJaTndrZkRUZnl2Vld3cThObUs3VXlUY0RoVmpmSGxUcXRCRDlD?=
 =?utf-8?B?ZGxNbG9kMUFaOFhocEs5blJSSXNWNVE1SEdSeERFbkVqZDNQZnM5VWtxZHdu?=
 =?utf-8?B?VDJLRmFGZlhkTkVxdExHK2FsN2lnbWp4cW5HMEoycUlLU2MxelQxQlFCM3k1?=
 =?utf-8?Q?wITks5Uh2Ucp0uk9xn11RLGDAzYz+kul?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR12MB5673.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UGYxdmM2Q3l2QUlNOHpNUGhESGFQemxEMEhjQ0ZLWkpFTkNpdmpwZjdnakk5?=
 =?utf-8?B?eXZ5d3BYWWpTL3RmSWdiOVQ0VTlUSnEybWJTSUF0SWRCb3J6Zi9lcW52U3E0?=
 =?utf-8?B?SGVOazBXZDg0VW05enhKNDlGS2hkMVN0RWtDNnZNR2JmMFErbjhFZkNBRkFl?=
 =?utf-8?B?ajFLVUViRVFOcW9EWlZWNnA4QkpPcGZsc2VwWW5iTnhRclRwWDNFN1owc25D?=
 =?utf-8?B?bU5tVHVwMXpVOUlpbkJIKzd2T0c1cSs5cXJPTFBMK3RNQ2UvbzFNS0JCNkcx?=
 =?utf-8?B?VUg4UklmZHRKRTdxNHlsb2l4VVgyemdRSzlOVFRuR2FWdkorMVkwMlVnT3RF?=
 =?utf-8?B?R3J5cFRJWFYyUlRwdUtnK3NYdGVJT1J1bEVoMGpNTkdseXRjc01NcmdkNW1R?=
 =?utf-8?B?dDhUV0FqcEY4WjYrODdrbUNBN3hQZjN3Z0FrcVBGdFNpb2FxWVk5Nk03R09i?=
 =?utf-8?B?dzhDZEl6dWJUR1dMSXYxM0tXNTl0WnF4V1BlOUgxeE85QkIyT0tSUUluakE5?=
 =?utf-8?B?bzF4Mi8xeHZEVWNIMG9zdTVpMi9YMzJFWGFMZjJ2dU42eHcrMGs5b3BOdDRT?=
 =?utf-8?B?bFk5aWRTcCtUMFlESDBEQ0cwbHR2Rkh5VXlaVmhyajY2a0J4KzRrSyswdHRS?=
 =?utf-8?B?RzZRTU9wd2hSYWxDQ01PdS9oU2hXb1kxbndPREd5MXJvRGI3dTRlcFJHd2Zv?=
 =?utf-8?B?M0xHbW5ETDVCN0g4V01ZK2QzTU1INVRpSFY1Yk5Xc3JxdGNPMGM4VndPY2pz?=
 =?utf-8?B?WmdUVmtOaFgwY25EbzM3STQyOXhKZzlCT1pRYi9aVlU4NGV6a2k1Q2J3MzdL?=
 =?utf-8?B?U1JLZ0NIeEFvSWhLd0xGNCtva05KR0FORG9TS3NrQkI4NEVVTDZzWWVpRmdp?=
 =?utf-8?B?MWRuU3dvU3RORjE1dDBVVmZabC8rSklTaXpXd2ZZRHVMcmtvWmVpM0FmdlRx?=
 =?utf-8?B?Z3FJa1pBbWNTN0t1bmJBWDcwc29pTTE1eFdnVElaMHNrbEVCU0p3YTBZQzcz?=
 =?utf-8?B?aGdzalY3Q2VudlFNcXdBckRMNEhCVlljREV2TlJ6azRKRmtIVWtBbEo4QlFK?=
 =?utf-8?B?VGVVZEk5ZElIZ0ZjY2RCNjdwZDZtenhSZ2RQaTFFbGJtdUNDUW1wNXEydWxV?=
 =?utf-8?B?V3BWNGhQR3o5SkhzbmFuWW1YdWt5akh4OVpQeldKZ2ZHcTRla3o4Mk9XdGhm?=
 =?utf-8?B?L0U1OW5UNDNRSldKd2RNM2Jjc3ZiNFVlZlg2YW82dFlMVHFweFk3OThPcUhm?=
 =?utf-8?B?Nml0QzVaNytWeUZna2xXai9PUFRjYVJvZlhjZXdlYmh6dTE0aDY1d1c2NFdT?=
 =?utf-8?B?SUdnUXJYc1hxR05UV3htc0Q1a3MrRFdkZUdYc3hsM1JHNFNRcHBoMXVtTHhs?=
 =?utf-8?B?SkNEdWkxVGRSZ2hYbDBvUmRPU1dEZVd1cGdzdXpzNmh6Z3BlNXR4YzBBbGJw?=
 =?utf-8?B?MkgvdTdLUmtNMnphUWNqd3FiN1p1cEVGZjRhNFRiUEErSDc2WlpkdStjK09U?=
 =?utf-8?B?N3RUSmlDYm42TTBEMmNzRjJJSWdUTytlUTFNZXI2ZDRPRE9xVlZkb1ZzMlN4?=
 =?utf-8?B?dHE3ZEdZNWMyKzlHL0hleGJaWTljR0wzbWlwaEppOVYxY3VVL0lzaEphcXUv?=
 =?utf-8?B?dHZkcDV4aW9oMldKKzBDZDE3N0hONEpTUXlVdk56SzFPOXRjSU9PY0I1M0Iy?=
 =?utf-8?B?QnhPbXRGdkIwVDJIdUVNSVlZRHYyeVhRaDYreHRCZ2pjZnZIN05mQUx2R1Iw?=
 =?utf-8?B?Q3E5N1FzTFJLRkpqSTd0S2UrS3F1SklXVXVObHBnc3cwbWtmVXhSZ1VNNjZs?=
 =?utf-8?B?UnVmZjllYmJiWU1xSVdVaVluMUc4bXFqdFcvQkN6MlkxdDNlOXRsRU0yUlQr?=
 =?utf-8?B?a2diOGVZZWJQd1J6bWVLVjUvTkEyV2F6RmZ2cGVHZzFXRWtwRU8vZHloamxx?=
 =?utf-8?B?TzBOSDI1T2JMTmVwd29aQkJudnRKS2l1YlVPVkZ6cW9lNjBNelB2WHVzS3VY?=
 =?utf-8?B?N05DTnVUYmlmb3R3QTdZU3N3Zi83QjhLSm1jT2RqenEyejcyRDNZNERoRTB2?=
 =?utf-8?B?bG9kbHNnaWlXQ3BEaEFnc1RNbG4vanRIUnNVMHpYVmsvOU5tZmZzSkMzTkZZ?=
 =?utf-8?Q?6XeN+M2mIHoARR+EQuUEIVg2Q?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: be706e8f-6f3a-4193-6991-08de25b5fd71
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR12MB5673.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2025 08:47:50.7751 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2XOVa+N7sz6fCB3E3a445NF928AWCEPslN9G8tSyFZN2PHqzwQ4M+V+R0NjqbbqI
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB9525
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

On 11/13/25 17:05, Pierre-Eric Pelloux-Prayer wrote:
> This makes clear of different BOs run in parallel. Partial jobs to
> clear a single BO still execute sequentially.
> 
> Signed-off-by: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_object.c | 2 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c    | 9 ++++++++-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h    | 1 +
>  3 files changed, 10 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
> index be3532134e46..33b397107778 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
> @@ -1321,7 +1321,7 @@ void amdgpu_bo_release_notify(struct ttm_buffer_object *bo)
>  	if (r)
>  		goto out;
>  
> -	r = amdgpu_fill_buffer(&adev->mman.clear_entities[0], abo, 0, &bo->base._resv,
> +	r = amdgpu_fill_buffer(NULL, abo, 0, &bo->base._resv,
>  			       &fence, NULL, AMDGPU_KERNEL_JOB_ID_CLEAR_ON_RELEASE);
>  	if (WARN_ON(r))
>  		goto out;
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> index 411997db70eb..486c701d0d5b 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> @@ -2224,6 +2224,7 @@ u32 amdgpu_ttm_set_buffer_funcs_status(struct amdgpu_device *adev, bool enable)
>  		adev->mman.clear_entities = kcalloc(num_clear_entities,
>  						    sizeof(struct amdgpu_ttm_buffer_entity),
>  						    GFP_KERNEL);
> +		atomic_set(&adev->mman.next_clear_entity, 0);
>  		if (!adev->mman.clear_entities)
>  			goto error_free_entity;
>  
> @@ -2489,7 +2490,7 @@ int amdgpu_fill_buffer(struct amdgpu_ttm_buffer_entity *entity,
>  	struct amdgpu_ring *ring = adev->mman.buffer_funcs_ring;
>  	struct dma_fence *fence = NULL;
>  	struct amdgpu_res_cursor dst;
> -	int r;
> +	int r, e;
>  
>  	if (!adev->mman.buffer_funcs_enabled) {
>  		dev_err(adev->dev,
> @@ -2497,6 +2498,12 @@ int amdgpu_fill_buffer(struct amdgpu_ttm_buffer_entity *entity,
>  		return -EINVAL;
>  	}
>  
> +	if (entity == NULL) {
> +		e = atomic_inc_return(&adev->mman.next_clear_entity) %
> +				      adev->mman.num_clear_entities;
> +		entity = &adev->mman.clear_entities[e];
> +	}
> +

Oh, that is really ugly.

I think you should have something like amdgpu_ttm_next_clear_entity() which returns the pointer round robin.

And then give that as parameter to amdgpu_fill_buffer().

Regards,
Christian.

>  	amdgpu_res_first(bo->tbo.resource, 0, amdgpu_bo_size(bo), &dst);
>  
>  	mutex_lock(&entity->gart_window_lock);
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
> index e8f8165f5bcf..781b0bdca56c 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
> @@ -73,6 +73,7 @@ struct amdgpu_mman {
>  
>  	struct amdgpu_ttm_buffer_entity default_entity; /* has no gart windows */
>  	struct amdgpu_ttm_buffer_entity *clear_entities;
> +	atomic_t next_clear_entity;
>  	u32 num_clear_entities;
>  	struct amdgpu_ttm_buffer_entity move_entities[TTM_NUM_MOVE_FENCES];
>  	u32 num_move_entities;

