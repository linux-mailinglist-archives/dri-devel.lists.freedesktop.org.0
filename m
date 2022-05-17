Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 61A4F52A0D5
	for <lists+dri-devel@lfdr.de>; Tue, 17 May 2022 13:56:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C2C910E5E4;
	Tue, 17 May 2022 11:56:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2086.outbound.protection.outlook.com [40.107.243.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B01B910E5E4
 for <dri-devel@lists.freedesktop.org>; Tue, 17 May 2022 11:56:08 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iTrjXlGipLagpgBFWpbu7lxUzVvJvWNEltpaANMyTxv7nT3yZps9FXZ7KesrUbF35n767zcj2m/8EJmEEiRwYK9w0X5xkapnHwupLxFvIXrl+zMlHtC4sL57ExDzshiA4ppysbRQqMReC3Eg2Lfl0ObSbEEDOLMaQNf31ZMcQtCfC1I7EJrJHHikXpP+PRBPdkDJSAko0BYu11Uqo273w7eMDrkv5ny1lmz1GCk0YXFzd5No+XQrVU37nE7hBnRRqyDG605Gb41FSSOETF93tDzfwyTNbqwlXtYcW777KCHtDHvSRStDMUrK0f0iCtPBcVRIL9sPjggdCxFlwFSXjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tPRx3ePGRzbICgQkHnpPmQm/Jl24z/hexI8GkvH79jA=;
 b=gztEx8bvbJC1ox4O11VLEEAs6GLK/ewh8YwKhQPvxOEeb5C018JD/ejaccY1aFvqlDC96oshPBLlAUuVAU4IWGC0uWGd+ETFhs6Z0/jCqRAt0QnwNuuIJwNL/SgCP/uF99M8NUgDbgYKAaCf3TjEjepNuv9zgt76HQTIaIFthPC4jJi27E9rDNX+nVBh5LDqkSUc06ehq2wZFQt3yN1ZHUngSNJPjHzakxJUYTid5KLUyoDh/j68vvSzVazzHFkl+TBuXH2/XpBlsJtq3HhAJS7+WWf3MvLYmoVvmSdWWQyhOvvpCqvtmf7AyUqyrdK62La9iCHpZWC9XZdm0ccgUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tPRx3ePGRzbICgQkHnpPmQm/Jl24z/hexI8GkvH79jA=;
 b=5aA8UkuKdDHRz3vAdg2CsQFtQNxoN668zeq9mQNqQToSUtfVSPIiz60WmBwIRoqwqtwy8VAd6f05TIctiygu03jsJkbLne9RwWzSE1XgRpNFkr7w6BlmMjAX8/hMI+LDO5o5wGiv8U/yeLKKAujvcFWykMlXU2B3GQTtH5KOLZ8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by LV2PR12MB5991.namprd12.prod.outlook.com (2603:10b6:408:14f::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5250.18; Tue, 17 May
 2022 11:56:06 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::7146:65ee:8fd3:dd03]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::7146:65ee:8fd3:dd03%4]) with mapi id 15.20.5250.018; Tue, 17 May 2022
 11:56:06 +0000
Message-ID: <d9d8a396-cb1f-054f-1309-c483dc1724f1@amd.com>
Date: Tue, 17 May 2022 13:56:01 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH v2 0/5] drm: Ignore non-existing color planes in helpers
Content-Language: en-US
To: Thomas Zimmermann <tzimmermann@suse.de>, daniel@ffwll.ch,
 airlied@linux.ie, mripard@kernel.org, maarten.lankhorst@linux.intel.com,
 javierm@redhat.com, noralf@tronnes.org
References: <20220517113327.26919-1-tzimmermann@suse.de>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <20220517113327.26919-1-tzimmermann@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AS9PR05CA0009.eurprd05.prod.outlook.com
 (2603:10a6:20b:488::10) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8c71d1a4-b73f-4fe1-c6d2-08da37fc399c
X-MS-TrafficTypeDiagnostic: LV2PR12MB5991:EE_
X-Microsoft-Antispam-PRVS: <LV2PR12MB5991EEA4A7780AE3DC3564DA83CE9@LV2PR12MB5991.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: R0iakgj6zEJ/Y1C89sEEDTzpTr7VfmQ57Kl2WKKL8Dog+FrhSpTxQSKcJOi/Sk7s1rwEAVncDAj7NBzRVOaSJdVX9WvAThjxCZ41vg3b34mhpS2dtEU4bsvGNTS/lfrLJJh/zHWNU3sHbM0n4+vrbEZLFwISL0kr8qSpMs2rD3gLrkFjVs6i4ya2sK2/4abcF6Nvf0npmZ2YPvAUplTN4i49O3cqb5YvkWOlO72pTwq0112cf0fpAMZOOxihW8Kja14j930sg4eqO/ac1rN33TX+sPn0yRfZGmPRP+6aJZqus6sKTz/RZqgo2zv5rUx9jYqdBpmpA2ug8tXxWRgpkrkjiM3+tujfpGr6inkLqY3EYibpA0PkB3hikczw5XS3PKK0HIFIeKTMIUMeZeoknLiiWTw4U6Hj5xtHanEfsrNIFT7oOsW1i2RnlRVVY7K67QoO7geeF9CM2hmdV7MXG6t8W8/YWWAcKkSA8CTPCAekdxLGgduZ9EYoYHvHAiAAMv+5xguRVptRvYw26RnnQK376nLCLIzOmpHzV4S8JwqcNz6O1M5m5qiip0G3KInSPqmhHV4d0el3hu0V+wid+NyfPKqLQx4u8JvVvy2UNBL0AHpcbaptR0qR59mL5JsTvRV9HXehMb+DnEnknZaQUU/3v2SnZqEIDZZOvPv3wirDowLRNVwqHCjXxlmoY8jaov2+q+QQ6p6v2gIgy3re73+181LrxS3ogQ/+PKY4tw1o66eTHBnxcPgQ1ztX1Fq2VrrVTUOPmA1zLeE3kfTabFP2I4t/9fAPhgtJNIHDWjo/GT4MQ1L57hmpbDv0ye3RBaHZUgZ8tiyLNcG0dnGC6aaPAHbNPslScR3AETrmRCE=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(186003)(4326008)(31686004)(45080400002)(5660300002)(6512007)(36756003)(26005)(2906002)(66574015)(2616005)(508600001)(6486002)(316002)(31696002)(83380400001)(966005)(86362001)(6666004)(8936002)(66476007)(66556008)(66946007)(6506007)(38100700002)(8676002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VzBIcFRkQ3J5eHRzQ25XbnovMXBiQjFhakRWaHFNdnM0M0JmcDE1cmpOK0Yw?=
 =?utf-8?B?ZS9RWjgwdUNGZjhtcGVyd2V1U2FsZEppOUNiQldjSElzWkM4RkNNMVFaellt?=
 =?utf-8?B?elY4d3pJU3NUalc0eXVxSmU2WWthbmJ2Ty9yNUlLZjRtd1U1UjJIZGw3MzJZ?=
 =?utf-8?B?Z3VHMDRRNU9PeGtINE9RZXc0ZE5aRExyd0xKVUtONEh3clF3M0lzSTlLT2pw?=
 =?utf-8?B?ZDhvdE5mL1FnN0RHMmRyZzF1bEF1NVpaR25WdHNUYjJSL3JRWXlxdTJUMmFq?=
 =?utf-8?B?MDFjWkEyZDRUNkpqbk02aDJzUjBPV3FnTjMwU1p5NS9rRXRLTmc0cUZhZ0sx?=
 =?utf-8?B?OS9HVHNhNkNGTnhIdExDVUJNeGlTTmdqUnYwL2gwYTRnN0hkWjNWbk1IRmtY?=
 =?utf-8?B?cFdnTzdzNWd3NTZNU2I2dVlvWjg2TE01MGhFVnczdzU0UnlNQTQ0MFlXR2lY?=
 =?utf-8?B?VWtkYUNBSlo0dEZ3c3RvQVdwYzJQQXh4Q1RWbGxpcEpsejF1cnhpMjJhV0x0?=
 =?utf-8?B?S250K2h4eUVicmlLS3ZhMXFQdXVaRHExaWxrQ08yZkw0VFlrL2FxeTdLa2pK?=
 =?utf-8?B?dXlHdDRId0xmSWhOdXhDZjZjN0tnTHZHZjZTT0E3TEJYSnhpRE5SUHY0ekgz?=
 =?utf-8?B?ZTVDRk80dDBCWTJjU1pOV1RjTXRxell6cHVDYnZ2WWhUTHlPeEhKVWFrWTc1?=
 =?utf-8?B?c3pFQ3diOWM3MDhvai83UzN4QXR0NnVnbEN0Zy9FbkNCTjZldXdwV0NQeFg2?=
 =?utf-8?B?Qk9ud2NPK3lLWVZmNjlaaWptN1VoZXMzMHhSYmkzaURSeFFZd0FCeU9YZklS?=
 =?utf-8?B?Qm1YSGRFMmdaNTBJSFdzSzVta3hweEYzRVI2TndDWTVnOGZpaXVVeVp1cTUw?=
 =?utf-8?B?VEIydjNRQllHV1dVWVM0VVlmbVNVMnV1WTFIQy93dVZDWm9TM3VtdW5laWxU?=
 =?utf-8?B?RmIrS295aEk5NUpUZm5aOE9ycW9Od3o1MDRhNjREQlR6Sk55dHIzd0ZwUndN?=
 =?utf-8?B?NkpCUHp1dmpWL0ZyNjM0V0hiVjFJa0dXVnRlTTQxK0hmUGJEUGpCNEdDZHVZ?=
 =?utf-8?B?WGFwQWdTTnVMSGQxL0NmdjBxSVJVU3N1Vy9GaVRLdkFnQkZSNXV4VFA3N3VD?=
 =?utf-8?B?K3FiNDlKRTd1Qm1CNTEzUzR4K0N1YndTbSt1aFoza29WSktybmUrRjFBZE1Q?=
 =?utf-8?B?WDF1bVUxS1RmNUw5VVJDUVF2aXU0N3FzSWlyaHBGL2RYUzJWdnJCMnp1M1ht?=
 =?utf-8?B?WWcrOVVwcnNTbjA4NmFwSUh1ajVkeFhuT2R5aWtMOVRVK3l3QzFyUkg1MlVa?=
 =?utf-8?B?WFRCTUZXbFB5aXZnNGNwQkd4M3cyelBVdkpicXhFeTFPbUlNOVFadEIrWVpU?=
 =?utf-8?B?NzhDdHdsRUNUTU02SGlxajZ3M0FneUxxRUhNVFltaXArWUh0RGRHa1VJWWdR?=
 =?utf-8?B?T0hnb3ArTVovN1JvYUxYaXdwOEsvS1ZRUW02cjhaai9kZUpuL202bnVaaldy?=
 =?utf-8?B?Z2VoNU9rVXhWR3I4NE5NMDA0a1BMbWpEb1JDSHZJZEVmbkFsdkRQL0JyQVRj?=
 =?utf-8?B?SWVFa0V0RzlJdVNvZklnR1Mrb2FTL05RU21DL1oxeUdrdENoWEV3ZU1xMFNZ?=
 =?utf-8?B?VXkrRSthRmJaaXU4K0Y5c1BtYTMyMUlRSEJTbjRGQkExVTdVbkxkVkJtd1g4?=
 =?utf-8?B?bmcyTk92TlVEckdvbm5peDFZV210eDZoZzNRaDhwY1hNdFpLODVNQkxrNndx?=
 =?utf-8?B?RU5GUkhQdERUYmtIWjJ3ZHdCbVhtVGRoZS9pQzdGdXZUY1ZwYisxS1g2TFdH?=
 =?utf-8?B?UDJXVDAvcHdyalZremFGcUlQWTJoelZiTllEcmh2OEFIejluNGgyektwZWpp?=
 =?utf-8?B?RWhvdncyeTdValRxejBVbGgybUpiaGhYUEZrSlcxejZCNkxKQ08yNXEyaU1I?=
 =?utf-8?B?aU5CMmQ0YklhSEpwMmY1dU5uYTV2ZVJEZU5VYzd1Q2E1bFFwNk4xSVJLU1l0?=
 =?utf-8?B?Q2VINGI5U2Q2NzdDMG03cWQ0cE1VMTJwZ25HSUVLcFZlaGQwUGtacVNsYlRI?=
 =?utf-8?B?bTJFdlhzajJMSTVWUkVTdUhMWnVXV3dnampTYVNxMTNTTThuWmVNVGtNcmhC?=
 =?utf-8?B?VUNtbUUzMTZnV3JhUTMwZ0ZrWmJmMGluUlNqZFU5UDR2SVNVVzdrVGg2Vllr?=
 =?utf-8?B?MmEyUzd4b3ViRlg4MU9Nb2d1Y3BOWDlMeWNUZ1NsU00yb2NPTURhWHB3RkFt?=
 =?utf-8?B?aDdmODFzZml3R0VCMi84YmN5WkcxL01sREJjWjZueGt0Y3NCeGhNT1pmYjl2?=
 =?utf-8?B?bjlWSGlJYWUrODUwNUhrbWlybjNVWHZoK2oza2drSEVLZlViU0dadz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8c71d1a4-b73f-4fe1-c6d2-08da37fc399c
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 May 2022 11:56:06.5927 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Q6ysyKUv/IPrrloanudwZAWzrdEoA7Qw2PvA0Br8thY2fr2hdvEd0Iq4PQmcjnAz
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR12MB5991
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 17.05.22 um 13:33 schrieb Thomas Zimmermann:
> Some DRM helpers assume that all potential color planes of a framebuffer
> are available; even if the color format didn't specify them. Non-existing
> planes are silently ignored. This behavior is inconsistent with other
> helpers and apparently leads to subtle bugs with uninitialized GEM buffer
> mappings. [1]
>
> Change all affected code to look at the framebuffer format's number of
> color planes and only process these planes. The update has been discussed
> in [2] before.
>
> Tested with GEM SHMEM helpers on simpledrm and with GEM VRAM helpers on
> ast.

I'm not deep enough into all the details for a full review, but feel 
free to add an Acked-by: Christian König <christian.koenig@amd.com> to 
the series.

Thanks,
Christian.

>
> v2:
> 	* refactor GEM VRAM code before fixing it (Javier)
> 	* print more error information in #1 (Javier)
> 	* commit-message fixes (Javier)
>
> [1] https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Flore.kernel.org%2Fdri-devel%2F20210730183511.20080-1-tzimmermann%40suse.de%2FT%2F%23md0172b10bb588d8f20f4f456e304f08d2a4505f7&amp;data=05%7C01%7Cchristian.koenig%40amd.com%7Cc512a92c206f4af0691108da37f915a1%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637883840259373791%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=6fXRY%2BWlo1I47tcuRHiamAZ9JGM%2FHaYTfyGnxNrqUts%3D&amp;reserved=0
> [2] https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Flore.kernel.org%2Fdri-devel%2F877dc0d9-c6c6-022c-20d8-14b33e863934%40suse.de%2F&amp;data=05%7C01%7Cchristian.koenig%40amd.com%7Cc512a92c206f4af0691108da37f915a1%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637883840259373791%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=6iFYw5EtQNaSiPrHIAawBw87lj6M66o7j0ADY0ipifs%3D&amp;reserved=0
>
> Thomas Zimmermann (5):
>    drm/gem: Share code between drm_gem_fb_{begin,end}_cpu_access()
>    drm/gem: Ignore color planes that are unused by framebuffer format
>    drm/gem-vram: Share code between GEM VRAM's _{prepare,cleanup}_fb()
>    drm/gem-vram: Ignore planes that are unused by framebuffer format
>    drm/gem: Warn on trying to use a non-existing framebuffer plane
>
>   drivers/gpu/drm/drm_gem_atomic_helper.c      |   6 +-
>   drivers/gpu/drm/drm_gem_framebuffer_helper.c | 104 +++++++++----------
>   drivers/gpu/drm/drm_gem_vram_helper.c        |  54 ++++++----
>   include/drm/drm_gem_framebuffer_helper.h     |  10 +-
>   4 files changed, 92 insertions(+), 82 deletions(-)
>

