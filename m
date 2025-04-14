Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D502A876FA
	for <lists+dri-devel@lfdr.de>; Mon, 14 Apr 2025 06:38:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 815B910E266;
	Mon, 14 Apr 2025 04:38:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="qVxu4eet";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2040.outbound.protection.outlook.com [40.107.236.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 79F3910E266;
 Mon, 14 Apr 2025 04:38:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tbiZAhVb3yuO0V2HQac79PvZh1f9LNGbx8uVpFFJctIztaCqfXjPNgpga3pooxMq398zpIYFK72zsSFosbTsuvD4uiq/NhFgeV8I1ZdpDqdIFrHCx0n53LAdsrRLdtn6+j05VR2jwSeWr0EAkTmJjUeOoUBtHfIp4ZvYldyP8GDaDAylHRag8lNyOp436mv5fg0icbPzgeSZqkkVKJSIjxlQHVyCN2nAG20EXwhHIrYpoqa+10yqZECInrwN7e8iDGXsbVEtF0iAuPTdaBSle8dHvrlDYuRZuSmh8B/j4VwiP/yVUpmArB14ARByr4CqT694xmJFRq2J6cfK/+MMlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0xHHaJj58yDtT2SbWN+HKLMYDz591wOQroOIZ6WGtUw=;
 b=K25QK3815vY9iel8MjHfdx/Au2AX/N1wwcOsUCxxglXS+LfKkrAa01wi42u/2t26k9s7DAGLc5tl93uXHK7Eqe18+9nAMJXFE1NG/cJ7d+LkWkY79l5/B/Alvrz2Y0Q0rnWtRT811L4wMWfmlgcWWrlGr4BN1Ys+tqz6iS5L7nLTAbN/iOlJCw02uKeRA/YOGS3WlQfTyUaeehTPNz+2LCAuFn1lco2Eq+o90uAhg4LnFWuSRzj/W6SDxvph57EhioVMiE9BDtk0A61ueNMypzSAB0LDeMrIAkSnUxV52DGlQr9+6Ihj5u8NxC9IryXT2NSALnw/YffQ5P/GvfF2Yg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0xHHaJj58yDtT2SbWN+HKLMYDz591wOQroOIZ6WGtUw=;
 b=qVxu4eetkAnwegGyTGgt5OP6/D8R8C5YBw3BAQdnU+9PzyxQM0cIPTCKza+Sck9u1FuzgwP8oQybU08EWam6WB1bIdMtoMeXnWdgQuIsQH8OvYYbB4iBtXKeCRIlx0KJsygEUmYx8XKct0963+zJonCrpgddAXxsfCXzA7H88Do=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN9PR12MB5052.namprd12.prod.outlook.com (2603:10b6:408:135::19)
 by MW4PR12MB6684.namprd12.prod.outlook.com (2603:10b6:303:1ee::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.28; Mon, 14 Apr
 2025 04:38:28 +0000
Received: from BN9PR12MB5052.namprd12.prod.outlook.com
 ([fe80::7714:4f80:f3e1:60cf]) by BN9PR12MB5052.namprd12.prod.outlook.com
 ([fe80::7714:4f80:f3e1:60cf%5]) with mapi id 15.20.8632.025; Mon, 14 Apr 2025
 04:38:28 +0000
Subject: Re: [PATCH v2 1/2] drm/amdgpu: Fix double free in
 amdgpu_userq_fence_driver_alloc()
To: Dan Carpenter <dan.carpenter@linaro.org>,
 Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
Cc: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Arvind Yadav <Arvind.Yadav@amd.com>,
 Shashank Sharma <shashank.sharma@amd.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <cover.1744468610.git.dan.carpenter@linaro.org>
 <d4583e103f65e850f886babcf1b290b0855ba04c.1744468610.git.dan.carpenter@linaro.org>
From: "Yadav, Arvind" <arvyadav@amd.com>
Message-ID: <f85bc3f9-c39e-e719-f94d-ac6924a27f84@amd.com>
Date: Mon, 14 Apr 2025 10:08:21 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
In-Reply-To: <d4583e103f65e850f886babcf1b290b0855ba04c.1744468610.git.dan.carpenter@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-ClientProxiedBy: PN4P287CA0131.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c01:2b1::9) To BN9PR12MB5052.namprd12.prod.outlook.com
 (2603:10b6:408:135::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR12MB5052:EE_|MW4PR12MB6684:EE_
X-MS-Office365-Filtering-Correlation-Id: 5f1299c6-7eac-4286-99f7-08dd7b0e3370
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UnUyb1pCNk9zN0xXTnV2L0hraVRUSUNJaEk3Z0lqYkRVdHgySjhBTmFuakFh?=
 =?utf-8?B?N3lRREhmMmN2OHZLODBmVmhLZno1bWJhMTR2ZUFFS1NSZVA2bUJJQllUYUdN?=
 =?utf-8?B?WlNBdkNhNXh4TGdpUytKcHkvVHZlaEluVjRMM2ZHQUlGSVhhNWdtUVZQWElr?=
 =?utf-8?B?L2pMYkt0RXM3VWFDS0orVW1pOFJ1TGZSZHp2UEQ4QlNpOTNIOGp6U01hTzRL?=
 =?utf-8?B?S2NESFlvR1BBMjNtcmRrSFpQOEhWVWdxZ3psbzJWcHd3aXAwaHJWNC9tSU95?=
 =?utf-8?B?VWNSMWhYSFBsWFlBUFB1aExZQUlaSE95Z2JJVEFNSDlWY0U1VFFCMm1KTHZX?=
 =?utf-8?B?RGJUQUJIRUtkQXIzU2RIUittTGlqUWJQSDVCN2JlcHlGQ01qcTBXcDJraWZK?=
 =?utf-8?B?akVLbEVYSENkTEpDNy9VTE1nUXJUbE9xb0lLRmZNa2lTekx4ckxDVzFhZjFE?=
 =?utf-8?B?QU52OTU0OTRoTzNQaVBhRTdFVnJEYm5PRUxPRUgrSmU1bHFENWFsUXp5bzRx?=
 =?utf-8?B?Qk5EZ1hBYU1KWjdKMzJCby9oMjlrV2loWUlRZEdNMkRBeERxVnFqbUFCaHEr?=
 =?utf-8?B?K1Vtd1d0b2JUZUg4SVZqR2lObVFmdHF0Nnd2VkU3YThZd2NiZzFyTTcrWWZG?=
 =?utf-8?B?ZDNVMWFDY0FlS3ZFZ3d0MG92dGdpMVpuTG1zRTErcWtIeVBnVjdwR2dOZ2Ra?=
 =?utf-8?B?c2JVYlpualNabjZVWDZxcDQ0aWUvNjROSnVLeW84MWxEQ0M5ZXcxMDUwOHo5?=
 =?utf-8?B?WU80SFNJYVQ1QXlLckxTQzFnblNuem1jcU5pSmFpcDVRakE0WEk3TlJUZjZY?=
 =?utf-8?B?WHF1WVhJQ05OVWNISzMySnFFT09nc1A3NzRUT3Z1OHcyaFR6d3p4TVpOWlFL?=
 =?utf-8?B?SUZUNnEyWWRkeEtsRWNXdlR5NllzYU85Zy9OY3ZjTEhMNlA5VWRHL2NxYXk1?=
 =?utf-8?B?ZzBwbTUyaFdYbjRoVyt0dXNhV3FRNzJ3MUlpVThoeGN1NzB2bXB3UEhPN3NP?=
 =?utf-8?B?NWxnVEpnbmozSjNIVnJkQWZ1eFE2eXNTTmxJT3dPWTlZZXVJV3ExejNPejhH?=
 =?utf-8?B?YSszYWVZb1FNNDhmZjZZQ0doQWxFNWNBZTllejQ5Ri9OVHk4Zitld05hTjNz?=
 =?utf-8?B?bk13Zm92ZUVSdW5ERkNsWWY5SS8zN3IxNFY1bmtFSDRRZ3JxaEJOcXkxWjhh?=
 =?utf-8?B?MEpZaEJKV2x5ZGZ1S1dGWTJyTC9rZkZxZzNjME94aVFSNVhOTk9iamM1cDhK?=
 =?utf-8?B?MnVTYXRMOExUY3V1R1Z4Mlpxc1BvYS9kUHZDWUtDS0NTY2xIMlRlc2V1NXRZ?=
 =?utf-8?B?aWRXZlFsNkJqWVkxbWprWWRrR0wvUzRuWW9wT0xXWWlsWFF3SjN1N1U4SEVQ?=
 =?utf-8?B?ZTJpR0RKWnZhNDNZT1Z6SW1TdGdvS1VDUytsd3IwNm1LTVNXYnYzK202WllZ?=
 =?utf-8?B?cjVRSStZTC83ajY2RHdzWElJZ0RBdklhR0c2SWxGRTlGR2l0b1dKelNDd3Fw?=
 =?utf-8?B?QXRqRGRmK3dFUTBSbGYvb2dncEtDTThITjUzOEJHT2kxZHNHZVdEWnMrRFdv?=
 =?utf-8?B?YWNKVW95bEx4bEJzcTdEamk0WndJWkR5MmlKTU4xWjI0dEEzV3Z0OXVOWS9i?=
 =?utf-8?B?azZsWjBhUEIwbHZFSUlEd1Rlb3pjSVZqcEt0UkEzSmhRRWdvTXJEZ3M0TzdX?=
 =?utf-8?B?dTZLUWxzVjBxVGx2TGNDbVZLbFIzSWZ3SFdtYk1jUGFUTjUwRExGWFR4RSs5?=
 =?utf-8?B?d0U5NVlIVFlKc2w5WEd2YzdYVmlYREhTdGtXUkluQUJhcUJRVkpVU2FxbWRi?=
 =?utf-8?B?ZUdFQjd3aDdmNHVzUlBueXA1U1R5T1dBQWJ3eThaOXNXdExDc2ZaVE5PUmY1?=
 =?utf-8?B?R0tvMndyVGJNODNRb05UMEk3VjJEYklkYythbm9veFk2WGFDOFd3TTZnNlFU?=
 =?utf-8?Q?X+1U/xo574g=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR12MB5052.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aTFFeGluUGpNRFdHRmNOYjhwQ3JGTDNnN1pUaGZ5TlFHbzRNdzY5RktBYmJk?=
 =?utf-8?B?cTVBQk1HVnJqVXBubmxJRkxBV2JvdDh3MERTMThFaFgwVmRIWlhZUjZheDl2?=
 =?utf-8?B?VWZYMzAybC82aXVGQ0phTXAyd01ZWDFQak5na0tEZFNLSkdKVTZQVERkWmZZ?=
 =?utf-8?B?M3hGYmVYQkt1U1FnWXI5TWo3VlVTVGtGclJKSW9lelp3NmF5UDNQb0UrZmc4?=
 =?utf-8?B?bDM2LzdPbk1pdXJrdnVoK01uQUJrM2d0bGh1eTBCMFR2RytYSUkxMjEydTZD?=
 =?utf-8?B?QUN5TlNIZllpSXNodHRBVE51SU50VWZKUWZVRDFTYXU3TEJnRGFCUmRCV0VB?=
 =?utf-8?B?WCtiMFozVkFLbEcyR2VzUlc2anY4RVR5MWRQZWpjUGxxU3ZHT2VFUmxrLzhN?=
 =?utf-8?B?cEdBaVBTby80RU9iaG9nQmhYMW5XTGNBN29Rc2M1NjJyeHJMMUVUZ0Fhem1p?=
 =?utf-8?B?TXZ6ck4vc0tRNHk1OGtOMjM4TWhibFMrSnZxT3BnbWVqejBYSXd2ZGMyNVhK?=
 =?utf-8?B?Yjh0R3hSOGV6SUJ5WjVsY1p5MmpIa2h0UFhBUi80TEM5Q2JreDdaS25yRlhU?=
 =?utf-8?B?d0I5c3NDRUJqNzljRCtYOGs3bS9sRHE0RTNPeHdJbWVMaDlLU1lLYWNJVVcx?=
 =?utf-8?B?dmVteWlnRkdWUmhSbHBDNVl3dHowZU9kSDVOL2ZOSlJTZmplallzNy9BdkFy?=
 =?utf-8?B?NS9nUUhhaHVoZitmcjVBNGh6TS9vZTN0SXNsMmt6bE1KdWVadkd3UFhjZEZD?=
 =?utf-8?B?c2QxRWQ4SnRRMktORlp4Mjl3dkd6VW9TOFF0eXR4cVJoTUJTSUowTnJrMWNQ?=
 =?utf-8?B?d3NQSnNYTXNWSDVyV0FnRVg5OENmQnNvS2dNckZNMTd1OWVuaGlVSjJFY1h6?=
 =?utf-8?B?NzJtNGxOQUlyR2N0SFZXZHo5K0U4TTYzQVVaVmJaZ0VuQlc0TzcxS1dYNEJY?=
 =?utf-8?B?djMrQ3VqcjlDM093MXd5YVNrN2lKYmRCLzczTENhR0JaMEJaNytyOXdFLy82?=
 =?utf-8?B?Z01KQ29Pay9sK3prL2NMQldhWXpVd1ZGL0JKVnB5bEN5M1piSTNnQW9uN0pB?=
 =?utf-8?B?YnNiOFIySmlSQ0ZZL2grYnpLWHN1NVVSR1RHenp3djljZmI4US92STIxdlA1?=
 =?utf-8?B?ZTB4UnExRzJ5RzBMY1BNYm9EamF5KzdSNTE4YytHK0MwK1VyZ1JqQmRtTXhJ?=
 =?utf-8?B?UGtLTDRDMTNnSVpIWUVQRXhZanpDNjgvbDBlZUtqSDRqSlNvbUI2M3pzZ2hi?=
 =?utf-8?B?VHZBWG5tK2wxRThzS1pnc3ZURXRaN0lHMXBuZTBzOTdIbWVaNGhybkhzdlR4?=
 =?utf-8?B?dStBY0o5Mk4xaCs2MkI3Z1EvNjhPMnVvbzg2ZDh3WHpXa0RMcE15ekFDeU5I?=
 =?utf-8?B?Z0UvNmtWU1AyR054NTYybVZGNVV0amRCM05UOGpPRFYxcVp0QWpjVGtIWlZL?=
 =?utf-8?B?MGdTcmpWNm4rUE56MlBkSGh3czZ0N0FQMEFtYWZ4Q3hmeEZkb29NL2ppcm1E?=
 =?utf-8?B?Y2ljODFOZFhYbEhYWHNSeFlZSTRheTNFS1JpcmtKMzc5aGJ5eHJKRC9IaGdY?=
 =?utf-8?B?R1p2V3hucTd6ZHpUM0RqTHZwRURMTjVWYldDSUxZRFVnSzBkZGdLbXV0N0hV?=
 =?utf-8?B?Sm1sY1lwT016NEhJVTIvWHI1RGQxUy9HZUhWQmxLcWVpRjNoZEdFbnBGY05U?=
 =?utf-8?B?NG1XK2FublFVclNWMjUrTTZXUDRnSXhIdmsxLzNRRnNKYjVaTE5qMkRQSHhh?=
 =?utf-8?B?ME1RMU85U2VWNWIyVzg4bXZjRklxbEVyOGtBQWw1Z3BFenpwWG5PN0dZM3lQ?=
 =?utf-8?B?YWhaQ214cmE2ZFVZT3pqbHpuZzF2QUhjUUlqMEZuUExSSk1GbzU3bGhybmo2?=
 =?utf-8?B?SFFGVFpDZXkrQ0xEVUtKY25jKzdMQ2hLN0pVdWRwZmFiZUhMMEFxTGIvTDRO?=
 =?utf-8?B?NDRaQVhVZUJSdWJVSVlDemJ6YkR4Z0ppQmQyWnhzVWt3WGd0WWdpbWtSY25x?=
 =?utf-8?B?czVuRFlQUnBoUGNhTUhtcGhMZkZEcDVqVGxWMnFTaVlqT0ZoWHVZZGQzUzdZ?=
 =?utf-8?B?bXNacExXRVRlZWZqYkl4SDMzbHBkK24veG5kQnV1TWNnQlMyOG80azMwOEZS?=
 =?utf-8?Q?F745A8g8+VriHQtSbHPEpT7R7?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5f1299c6-7eac-4286-99f7-08dd7b0e3370
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5052.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2025 04:38:28.0950 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bFlXCz1KmirFbmikfonKeX5tj5SUWGKI6swd/oQQJF9v0OM+6jVj7InqOCYvLpKIM0wv6SXk/Ysei97SfoFuzw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB6684
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

Reviewed-by:Reviewed-by:Arvind Yadav <arvind.yadav@amd.com>

On 4/12/2025 8:09 PM, Dan Carpenter wrote:
> The goto frees "fence_drv" so this is a double free bug.  There is no
> need to call amdgpu_seq64_free(adev, fence_drv->va) since the seq64
> allocation failed so change the goto to goto free_fence_drv.  Also
> propagate the error code from amdgpu_seq64_alloc() instead of hard coding
> it to -ENOMEM.
>
> Fixes: e7cf21fbb277 ("drm/amdgpu: Few optimization and fixes for userq fence driver")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> ---
> v2: No change.
>
>   drivers/gpu/drm/amd/amdgpu/amdgpu_userq_fence.c | 7 ++-----
>   1 file changed, 2 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_userq_fence.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_userq_fence.c
> index a4953d668972..b012fece91e8 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_userq_fence.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_userq_fence.c
> @@ -84,11 +84,8 @@ int amdgpu_userq_fence_driver_alloc(struct amdgpu_device *adev,
>   	/* Acquire seq64 memory */
>   	r = amdgpu_seq64_alloc(adev, &fence_drv->va, &fence_drv->gpu_addr,
>   			       &fence_drv->cpu_addr);
> -	if (r) {
> -		kfree(fence_drv);
> -		r = -ENOMEM;
> -		goto free_seq64;
> -	}
> +	if (r)
> +		goto free_fence_drv;
>   
>   	memset(fence_drv->cpu_addr, 0, sizeof(u64));
>   
