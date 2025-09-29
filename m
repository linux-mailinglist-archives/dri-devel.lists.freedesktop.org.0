Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5086BBA8AF9
	for <lists+dri-devel@lfdr.de>; Mon, 29 Sep 2025 11:40:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D317B10E053;
	Mon, 29 Sep 2025 09:40:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="b2KvxSbB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PH8PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11012068.outbound.protection.outlook.com [40.107.209.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1AFFA10E053;
 Mon, 29 Sep 2025 09:40:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mq+nIilDK28OkjkeUqDBI8yxmftezzz6AOvg9LaChbfs1EUMcjK9Qsusvx/0kXDASDAi7ZIUUM298bCgkTyEbJNwdP8rM837JdJKdLDOf3zsdtxUf0uKDXXE0dlXbqoSjVHL/DKWY8Ged0gGZoIOxzVs86veGpwf9UMFYBemkFu2y9P/cl6UtpscZfe2664XawkSbsV/5co/xJYjpNY7P7k9PNIjL1yvYmQYJT8WtTh3g55F38jIIraqHCsx3sHZmfrZDoG6FHIuVkd2FTaRgdG2WnJwt+N285kpo0qTQ5u5Gtk4ZiSSazTyQioKC41VKqAHyxn/8nGtwVRkzMHApA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WAlvLfhOSrLyagFnlGkItZcMmxzxH8bSIgy5Q71vvlQ=;
 b=X67G2O0r3xrYjUk+yKyah4LLB12ay1JpbIUtQWdPcvKf7jihrb6GVmHK7z8pIlayH2DVn/kXyxfIeCPsWmij2mUUoTRUH9oTgpeQVnqM/OnwucLUIctV7OPH1GDYuhdumHCPnQcd/8q8i535FOTpEuX3roJCPMxBdJDyLAZdwF5kPMf96SURovp9B2G8eKupH1601h6mCSOrj115aaiFcsrXKkuU8Z3geZIIyDELIDLXl+eM5/mSTL2cio3sw/Sl/ti87Dj8NJZ07/0wlKLh6YzV7YLlHArkqAcFglnqR8egNtvfVhxgOIyXnk/U1yvo+MNdhXxwE9hrbWag6FxlTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WAlvLfhOSrLyagFnlGkItZcMmxzxH8bSIgy5Q71vvlQ=;
 b=b2KvxSbBS2aNOkC8/LkZGTuF8tWFiJrftE+oxe9qPSn/MgnJqmJZczQFR7q7m21itpEAzYazi3dfLiJDBrnyTf9XP91SgQR4ZZg9uRlnvuwX+76F8VKpiocS/yFMcRURdRiOqfYR/v8Q66eMiZ0z0tZN4PvfLRKk9nvR7I9WbpY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CO6PR12MB5427.namprd12.prod.outlook.com (2603:10b6:5:358::13)
 by CH3PR12MB9147.namprd12.prod.outlook.com (2603:10b6:610:19a::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.17; Mon, 29 Sep
 2025 09:40:27 +0000
Received: from CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::9e93:67dd:49ac:bc14]) by CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::9e93:67dd:49ac:bc14%6]) with mapi id 15.20.9160.008; Mon, 29 Sep 2025
 09:40:27 +0000
Message-ID: <52cce852-f4fb-4692-9318-1602fe878644@amd.com>
Date: Mon, 29 Sep 2025 05:40:07 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC v2 05/20] drm: Introduce
 DRM_CAP_POST_BLEND_COLOR_PIPELINE
To: Louis Chauvet <louis.chauvet@bootlin.com>,
 =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Haneen Mohammed <hamohammed.sa@gmail.com>,
 Melissa Wen <melissa.srw@gmail.com>
Cc: Alex Hung <alex.hung@amd.com>, wayland-devel@lists.freedesktop.org,
 leo.liu@amd.com, ville.syrjala@linux.intel.com,
 pekka.paalanen@collabora.com, contact@emersion.fr, mwen@igalia.com,
 jadahl@redhat.com, sebastian.wick@redhat.com, shashank.sharma@amd.com,
 agoins@nvidia.com, joshua@froggi.es, mdaenzer@redhat.com, aleixpol@kde.org,
 xaver.hugl@gmail.com, victoria@system76.com, uma.shankar@intel.com,
 quic_naseer@quicinc.com, quic_cbraga@quicinc.com, quic_abhinavk@quicinc.com,
 marcan@marcan.st, Liviu.Dudau@arm.com, sashamcintosh@google.com,
 chaitanya.kumar.borah@intel.com, mcanal@igalia.com, kernel@collabora.com,
 daniels@collabora.com, leandro.ribeiro@collabora.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 Simona Vetter <simona.vetter@ffwll.ch>
References: <20250917-mtk-post-blend-color-pipeline-v2-0-ac4471b44758@collabora.com>
 <20250917-mtk-post-blend-color-pipeline-v2-5-ac4471b44758@collabora.com>
 <ff53599d-fd7f-4791-a3e1-3269386c6b3e@bootlin.com>
Content-Language: en-US
From: Harry Wentland <harry.wentland@amd.com>
In-Reply-To: <ff53599d-fd7f-4791-a3e1-3269386c6b3e@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VI1P191CA0010.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:800:1ba::18) To CO6PR12MB5427.namprd12.prod.outlook.com
 (2603:10b6:5:358::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR12MB5427:EE_|CH3PR12MB9147:EE_
X-MS-Office365-Filtering-Correlation-Id: 1acc2148-9ffa-472f-33b8-08ddff3c3890
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|1800799024|10070799003|366016|921020|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dzVXMk9FN3VhU0lxREllUENqNTF2UVE3dUl1dmovM1JlaW9uOXB1cFl4ODVT?=
 =?utf-8?B?UlJodnVwSi92N0I1dDlKdkNUZ2ZZb0hXME5BaEl1TXNsSkIxWjNzY1lMb0Vi?=
 =?utf-8?B?cUJmZlNWcTR4eDdtV3ovc1RmYlIyaGR5NS9IQTUvVjdrN3VBR0VacE81Rzkz?=
 =?utf-8?B?aHRPYnlOK3VXTmdiSnREbzFQNExJaUV5M2xhMG1TMVI4bGk3NUdvRzZFbTFI?=
 =?utf-8?B?M3RkODgrdmQvcXBVQTRUakR1MG1ERFlZQWhEeEt2M0xzc3d5QTdBa0I2Nzdi?=
 =?utf-8?B?VFRSdUErOGpMSXlpN212Y3oxUHFPY015Y092TWR2VWdFZ3hPVCsrOU85QzdM?=
 =?utf-8?B?N2dtSnRlYjBTMGVBWnhDWStxVW42c3padnpRT3RrUlNlY3hSMXhBV3c2VjhP?=
 =?utf-8?B?M1QvS0ZFTEl4a3ZSWHBNZmJra3BycU1nMjJmY2hydSt4aVZPUENlTU1TUGN2?=
 =?utf-8?B?UWRESFE1THZnY1VFVE8xYWR6U2VIQkxTSGRSYlc0QnVlaWo3MjRWOFNHTmRF?=
 =?utf-8?B?ZXBVOEQvMzJuRUdsejdwQ3pzT1cxUjVvZVgxUkd4WnJsSUtvTExxRWsxUldp?=
 =?utf-8?B?amdWRFNITktmblpIdll5THF2NSt0WHhFYW5KYWpiVnJvM09Rd002bkQvMGhq?=
 =?utf-8?B?L0Exa2duOGJlODdJdk0rM3UrNHRIVG9CZlhCZk9DWHp1LzVrOS9QOGlzeUdB?=
 =?utf-8?B?NXBybHkzZ3lMWjFlcVdXS0UzbWVRTEpQRmU5SGFYT0NiWUNpclhlcWpDSGJH?=
 =?utf-8?B?QmUvNzRmb09sYkEvckcyd0JsblJzdnZ6MHcrbGxNVlI5UXpVTXl1VEJwakE5?=
 =?utf-8?B?bEpsdEtsNnVpdmMrUFNsNVpPNUttYzZkYzRPL3FVUy9GcWdFT0FjL2Q3Skl6?=
 =?utf-8?B?cUxIVGVqYlFnUlhLbC9zTzQ3TDJHcEJMNnpzbm5BSDVhSGdQb0F2VlpNanlY?=
 =?utf-8?B?bmFqcEZHSFozdlZJRXVpOXI0U1l3YXF3dnl0dUNVZytnektIbnNNRjBkbmVE?=
 =?utf-8?B?VWRNZGg3a0ZDQytaamRMS3BkRk9hUVZLQVVhMW1tY2Y3SU9VR1BSaWtyZmJY?=
 =?utf-8?B?VU5oWG84bnVOMThlYXp5REtmL0ZRUHBQeFVBaG5rbkNrcGJKNlZWbGg1SXdF?=
 =?utf-8?B?ek91b2VraEhRckdIekczdDNUbzloWk8wam1FYm5QeFRLczByT0JxRmEvMkZ0?=
 =?utf-8?B?WEErTDNRRUFUMGhDL0N2T0lCS01MOHBxbG9ERmhsY2MrYkM4UWpncDJqWlVq?=
 =?utf-8?B?VkRlSFhIVmtpUHNXSFNMYXBSak55alRBVVh1V0RyQlpVdGpTUFA5T0VxTVha?=
 =?utf-8?B?dHF4d3RZcUllRG1MclZ0T05EQ01TdUJYRnc1MFRBMlo2aTB3RVB1SmVuMk5n?=
 =?utf-8?B?RzFJMmVxWW9JTE00a3BUMmlpNzl6VGg5YlpKa2ZxWTZPYyt4S2prSC84S0lD?=
 =?utf-8?B?RGNNblQrek1LRDlRZ3BrVDdyblJFb1dFVTk5UVZYaHFwcVVZcGZLdE1OMlY4?=
 =?utf-8?B?WHBuSFMzWFczc1BqVmtabS9hRU03ajJ6Y0FOTkpSeExLbjlnd2VyT3NCc05x?=
 =?utf-8?B?R1RzVXhlTURiUFc5RXB2czBNdk91Vjk2c2wvRkxaejlLUkNUa0JCbzBPUjZo?=
 =?utf-8?B?bjNXVUNvdUpWaDVSdTdIWEhnZWJpRFlaMmN2YjY1Qm9kdDNlWXROTDFXZk95?=
 =?utf-8?B?TStpb0tSenM1UFl2ZU1zVEhXenFWODlDN0VHOEtKdUZwa1lNdEJXeHUzd1hj?=
 =?utf-8?B?Rkh0V1RvZFJ5KzNic2NJdytwWS9qRUdzWm5WM3pNUk5rTFE4RGdYWUEwejF2?=
 =?utf-8?B?eVltTjRQTDNyNTdRbGxoa2V4ZFd4OVN2bXVBY1gwdkl4V3RMcS9xZ29aMTk3?=
 =?utf-8?B?RldOU1VzbEZ1Nms4dEFRbkNWb1l0QTEzVWdkT1BlQXFsZzluK3RvT3NaQkVo?=
 =?utf-8?B?NFpSR1pXQVNLVVFjMHdubGp5MTJIanFLc2t0andDRFdUczVhTFdreUpSVHNK?=
 =?utf-8?Q?lSgdoF7KmGziAbPnMM1VPFQZxWmJWk=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR12MB5427.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(1800799024)(10070799003)(366016)(921020)(7053199007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?U3ZjaHZUZmNhbmxTSUQzNWZJS2ZORi90SDlhU0hpNk1HY0VFYVMrNzg4TGJO?=
 =?utf-8?B?WmhZUkgybXhIRkI5c3lESHk3OVVNUldxNjF0bThERDVlb1JKVVBrTWNicTQw?=
 =?utf-8?B?Z1FubUJRdk05VVdRVTNrMUxUNjVseVBGSzRkQ2lQcXg3ZkttcEZ3QU54UDZD?=
 =?utf-8?B?cng2Z3NmV1pRRjJwZGh1bkJoSllkaENmWkIxeUNRRWJBV25HdytZckNPdnE0?=
 =?utf-8?B?VEwwNDIrcDR3UXVMa2EwalV4ZHFodFN1VEFRZ1BVL3NMdHhQbDIxM3A2NDA5?=
 =?utf-8?B?a3RYT3NUdjZOTnIrbkxETHVwTVBNUEMzY1JFV1JUd2xMeG4rMjFRb3Y4TUQv?=
 =?utf-8?B?QU9TTmtmYm8ybnZqSnRKaW5VYmdzd0xqZUNUY1lEdW0yOHdFV3BSWlZQbEsz?=
 =?utf-8?B?UUVnUW1vTUZYVGFqNnZuYnRVWnlKbTdNbTR6dklFK3l4MEs1VUxvcHBVS3N6?=
 =?utf-8?B?cnZvcmJpaUQ0UHZJTWpCa3laRHVBVnZnRXg2V0MybkV2RWUzcDRkRTNMbnR0?=
 =?utf-8?B?RkZBWXo5SGhQUWlDNUlBK0xRcDdqWGMrLytxdUFPNEFJRnkvNjdHOVVsMURa?=
 =?utf-8?B?Nnh0TEJnY1RDYXdPZnpoUU1zNXJRMUlJL1FNS3NtSU9CaVQvVHJUYm1yVWRm?=
 =?utf-8?B?NjhLc3B2Q0F4S3RMYU9VQ3haOHNjZFBwcTF0bGpoYnBPZWU1Q0pKMUt1dnh2?=
 =?utf-8?B?QWJ0cWVOalF0QVZBYWlVb2pzczhtTVFIZE42KzZMVzg3RUxtSDJWYWxldGhH?=
 =?utf-8?B?dWpGRmdHOEF2STg5UDNkYUdpS0tKSjlDLzZLTnExc3hDWURiOTR0dHFmVFk3?=
 =?utf-8?B?MTBrV0ErY29lVGpvZWhUYmVDZHdTUlVZNitITE5OZXlLemRRTGhSUkhZV1JO?=
 =?utf-8?B?Wk5tRjR6U2V0SHlGS0tLMnR3YnU3SDE2azVqMkE2bGF3dmp4blE3b1hFc0pR?=
 =?utf-8?B?bE9QTnp2cVEwUUdWNFN1c0RaTFhlRnBsbHJLMjVGMU1pQjhsS09zRWVjcks5?=
 =?utf-8?B?dEJxd3dab2ZhNTAxZDZjR29aQU9YWGZTWENxZ2tjM3FGcXhBLzloLzlVeHdT?=
 =?utf-8?B?Mm5HSm1wN1QvWlVtZ0pjKzRpeGJjaml0WDBBSUl5OHJ3MDhiM0JrTC93VWZI?=
 =?utf-8?B?R0pwU20wSjFaQTJkVmFWeFRQVlhveVpoRzVkM1ZUZTRmTEhZTTczSnhRcTBK?=
 =?utf-8?B?SlRNSUg4TFdZdFcwNVhBZlVIckhSTTFaY1IvOGMraURwdWFUblArNi8xbmVJ?=
 =?utf-8?B?Kys0cGp0SEcrOFFod1NSMitPNTE4d1piTy81cTJnd2FnQXZiUXUyc0d3aGpl?=
 =?utf-8?B?VmdvUzFKaTQ1eFkrKysrclhTMUQxNzhvR0JCUVAxSVdPbklacjh0Ym82dFd1?=
 =?utf-8?B?NitlOXFyRGU1NHNMaDNkQi90clJxWlF6OEcwWGthb0RoeFFwT0cyWkVoclZI?=
 =?utf-8?B?ZmluTWVrb2VwYU9PMk4vUEVYclRrZWdBT2l3bEJNRG9rTGdHWm5jdW9iTElF?=
 =?utf-8?B?VW5PVmpEL1c2MDVsSUhQRkNVYnRrRWQydG82bDRscllIQkx0TG1kRXdrL3hM?=
 =?utf-8?B?ZlFIUXlJNERMTktoNzRFaXpvSmhIL0tWdGJjbG93VlJHckxVaTZuMVZBcnNy?=
 =?utf-8?B?b3d1emVGd3hLYXVsM204YzM2U1R5bm9NV2NFZjFRYUt0Z3JsTFFFajM4YTdJ?=
 =?utf-8?B?MUtQUzN2bmYrdmoyS0NzNjFGU09MeDhNSUNmZ3I5VndJTUFSNmtaQWt2VDhZ?=
 =?utf-8?B?SFlYdjE2S25YcUtMNnF5STQ4eEtmSjBvTEprS0tKUnhqYXhGMFM1RWxSRUJS?=
 =?utf-8?B?RUJUbWdaTkNYb2M0Njl5MWNuZXMvYXptN3ByT1ZoOEhWSDFKTUNWTlB1THRr?=
 =?utf-8?B?dFhrVUw1R0M3OUlDZloxY2ZZZzJZSWpuYStGVFZIN2duT3BIWE5xUVlqRHhD?=
 =?utf-8?B?clc5bTVNU0xRb1d3Z2FLVmY3TVg2dkt4clE2TjhHaDBqZzlya2RWWitPY0Vo?=
 =?utf-8?B?SkowR3MrUEdKYzRwQ1ltRHdQa2FtcHJzQjBhUXFwN0FRUmo2T0RaWURzeXFI?=
 =?utf-8?B?aS9ZTzhiRTV5UGVqNzVFNzdKY3dxR2g2c2ZYblhOY2lBNStzengybDRpWmhQ?=
 =?utf-8?B?dXpEVUFxbmE2bktGVExPaXk2UnNEQnNoZWZpSHNxdlZhb3dxdlhyMFZPTmc2?=
 =?utf-8?Q?vkmoGFiLFR180NzktHyRX5M=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1acc2148-9ffa-472f-33b8-08ddff3c3890
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5427.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2025 09:40:27.2256 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wv9AIQVfJF7Xg2dH5KsP+weMOvm8QnNpROUbuAT/C08/7qbSoi8DwewB8o0eFQ1HqIVnUUjWjyQ92YnBt5YJZA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB9147
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



On 2025-09-19 08:42, Louis Chauvet wrote:
> 
> 
> Le 18/09/2025 à 02:43, Nícolas F. R. A. Prado a écrit :
>> Add a new cap that drivers can set to signal they support post-blend
>> color pipelines.
>>
>> Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
> 
> Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
> 
>> ---
>>   drivers/gpu/drm/drm_ioctl.c | 3 +++
>>   include/drm/drm_drv.h       | 6 ++++++
>>   include/uapi/drm/drm.h      | 6 ++++++
>>   3 files changed, 15 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/drm_ioctl.c b/drivers/gpu/drm/drm_ioctl.c
>> index 
>> ff193155129e7e863888d8958458978566b144f8..01592d10e3465ddceddef94bc417f98d3ec12087 100644
>> --- a/drivers/gpu/drm/drm_ioctl.c
>> +++ b/drivers/gpu/drm/drm_ioctl.c
>> @@ -304,6 +304,9 @@ static int drm_getcap(struct drm_device *dev, void 
>> *data, struct drm_file *file_
>>           req->value = drm_core_check_feature(dev, DRIVER_ATOMIC) &&
>>                    dev->mode_config.async_page_flip;
>>           break;
>> +    case DRM_CAP_POST_BLEND_COLOR_PIPELINE:
>> +        req->value = drm_core_check_feature(dev, 
>> DRIVER_POST_BLEND_COLOR_PIPELINE);
>> +        break;
>>       default:
>>           return -EINVAL;
>>       }
>> diff --git a/include/drm/drm_drv.h b/include/drm/drm_drv.h
>> index 
>> 42fc085f986dee9261f8b08c4fc7d93b8d6d9769..6b0f4904e69766232283d430c2540d30afef850f 100644
>> --- a/include/drm/drm_drv.h
>> +++ b/include/drm/drm_drv.h
>> @@ -122,6 +122,12 @@ enum drm_driver_feature {
>>        * the cursor planes to work correctly).
>>        */
>>       DRIVER_CURSOR_HOTSPOT           = BIT(9),
>> +    /**
>> +     * @DRIVER_POST_BLEND_COLOR_PIPELINE:
>> +     *
>> +     * Driver supports post-blend color pipeline.
>> +     */
>> +    DRIVER_POST_BLEND_COLOR_PIPELINE        = BIT(10),

Is this to let userspace know that the driver supports a
post-blending color pipeline? Why couldn't userspace simply
check whether crtc objects have "Color Pipeline" properties?

Harry

>>       /* IMPORTANT: Below are all the legacy flags, add new ones 
>> above. */
>> diff --git a/include/uapi/drm/drm.h b/include/uapi/drm/drm.h
>> index 
>> 27cc159c1d275c7a7fe057840ef792f30a582bb7..c6c53e57958e951204154ce41a69696a6876f0e8 100644
>> --- a/include/uapi/drm/drm.h
>> +++ b/include/uapi/drm/drm.h
>> @@ -812,6 +812,12 @@ struct drm_gem_change_handle {
>>    * commits.
>>    */
>>   #define DRM_CAP_ATOMIC_ASYNC_PAGE_FLIP    0x15
>> +/**
>> + * DRM_CAP_POST_BLEND_COLOR_PIPELINE
>> + *
>> + * If set to 1, the driver supports post-blend color pipelines.
>> + */
>> +#define DRM_CAP_POST_BLEND_COLOR_PIPELINE    0x16
>>   /* DRM_IOCTL_GET_CAP ioctl argument type */
>>   struct drm_get_cap {
>>
> 

