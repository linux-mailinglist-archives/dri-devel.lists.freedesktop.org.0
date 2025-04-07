Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 44013A7DCA1
	for <lists+dri-devel@lfdr.de>; Mon,  7 Apr 2025 13:47:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7CE7810E404;
	Mon,  7 Apr 2025 11:47:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="uRV6RBlJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2045.outbound.protection.outlook.com [40.107.237.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5203F10E404
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Apr 2025 11:46:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nuNvCrezmScKQeD+fkTpJE23SdRAXUbeUsfaSGxq7nc2poIxeKixFNcrPqbFlu+F4RMmtOv+ob1EHIgL0D4a8Qpf4PxAc/biJ9e4cz1b7tteVVGE1Ac+lzMpzsKIdQX4nt6VqM1ntvPFw9VUTvXcmoHe/0tl4YS77z5K6lfqgV8oKHntent6vYTXUPJ2OG3/q8bYHqcPETsSSu3Yy1h8BOosuKqKX9XvidOgQFM4yJaR6rDscN6RSVVqKQrL3Jv0O8fDiknQRd912MfTbSC6n6rG4raVWyj3zEH2j022Eg/ClSGXu10tfLr381psIpml27C18I8aQcpjxHVmm1MyQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F5pYtYtV+PDJih8BheuTk0jYxMEO3mrbac965FfqFZY=;
 b=ydHpyOybaN9tENXHsG6MSM3zYREQWPIfNssSFQi56XlOBVVLRFRFNAhrPpAkJIIS/NjJVU61pVeyWoo4FsLf4uzgO+/HCKCi6QKnvVVZI11xS3UDnkuKHvAQy16fPvqqC4BUSslemj+Qlq1jRMKNRlMfhzUjLRiwjE3AyncxDig2DnSDPMXNYNAuQT7sHlxVlXDZEP5YI3ro+plzYIuLt9YWa2ARXJTI63RZCuTK4ssqLeyfVjFYm35CTDxuQz4QZNv5iYsjM6inBQc8pBl2UONbcfUlmttK0GcZhTP6YFyPqLAF1W/TKQK3ciBJ7rSXuPExutLl1H4KhlGLFxCe5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F5pYtYtV+PDJih8BheuTk0jYxMEO3mrbac965FfqFZY=;
 b=uRV6RBlJxpRAqLWKp0abhdM8vsvAQOaYawIdhtP1rVpj0OWQVBsLoAVam/2+2yHVbjHlHdDG+zS55RxBJnO5T0UAFNlqORmd8ln7USxhmb83KUSw21d0yLia/0UEVyPD8BtmxSZmgzpgSkQX8E1GSPLDsP4k5wg9pNZ5P+gYMBo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by SN7PR12MB8772.namprd12.prod.outlook.com (2603:10b6:806:341::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.31; Mon, 7 Apr
 2025 11:46:54 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%5]) with mapi id 15.20.8583.045; Mon, 7 Apr 2025
 11:46:54 +0000
Message-ID: <86a12909-4d40-46ec-95cc-539c346914e4@amd.com>
Date: Mon, 7 Apr 2025 13:46:45 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 00/12] dma: Enable dmem cgroup tracking
To: "T.J. Mercier" <tjmercier@google.com>
Cc: Maxime Ripard <mripard@kernel.org>, Dave Airlie <airlied@gmail.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Robin Murphy <robin.murphy@arm.com>, Sumit Semwal <sumit.semwal@linaro.org>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Brian Starkey <Brian.Starkey@arm.com>, John Stultz <jstultz@google.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Simona Vetter <simona@ffwll.ch>,
 Tomasz Figa <tfiga@chromium.org>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Ben Woodard <woodard@redhat.com>,
 Hans Verkuil <hverkuil@xs4all.nl>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org, iommu@lists.linux.dev,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org
References: <20250310-dmem-cgroups-v1-0-2984c1bc9312@kernel.org>
 <f5fdc666-dd72-4a4f-9270-b539a3179382@amd.com>
 <20250310-eccentric-wonderful-puffin-ddbb26@houat>
 <CAPM=9tzkLXOz=-3eujUbbjMHunR+_5JZ4oQaqNmbrWWF9WZJ0w@mail.gmail.com>
 <e08f10da-b0cd-444b-8e0b-11009b05b161@amd.com>
 <CAPM=9twgFt43OKqUY0TNopTmibnR_d891xmV=wFM91n604NUCw@mail.gmail.com>
 <5ed87c80-6fe3-4f8c-bb98-ca07f1db8c34@amd.com>
 <20250403-quick-salamander-of-charisma-cab289@houat>
 <202c3a58-97a3-489c-b3f2-b1fd2735bd19@amd.com>
 <CABdmKX2LhrcyDM0r1tytt2vKLuCLGsxZaGHgN+u1hUmEMXuGtw@mail.gmail.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <CABdmKX2LhrcyDM0r1tytt2vKLuCLGsxZaGHgN+u1hUmEMXuGtw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0099.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a1::16) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|SN7PR12MB8772:EE_
X-MS-Office365-Filtering-Correlation-Id: 8b57b8b6-1e40-40aa-2360-08dd75c9e47c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|7416014|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MTdGR1pUSUNqY2t2Zkd5NGtCZEdMYUd3MldwWml2MHUveXFrVE9yaHljTkxD?=
 =?utf-8?B?K3dUQ1pIWFd2R0pOcitNN0NhV3pXK2tlb0pTbm9SQXNTWmVhMElieGlqZ2RH?=
 =?utf-8?B?ZnloUlhmODN1c2tmZ2hLNDBBaWVpSmRjR0M5ZEpOYURBeTFyMlY2KzVtWkFq?=
 =?utf-8?B?QWMvKzBBdkZOK2ZmTjVmeGMvMlhuL3UrZVBwSmtLWWF2aUVQcmtURVZFZHdv?=
 =?utf-8?B?TVVmc1FLYnlQZXVTL3RQUWEwWEVWM0VtL0loc2JnbnFYZzY5djZXTzNPeG9M?=
 =?utf-8?B?YzdBY1Q3amluSmtOeG5tZUhQZGxweTJ1bFhvUUg0eEV2NWFDc1Y3ZFVob2ZJ?=
 =?utf-8?B?NUovWEhFWDVTMXRQV3hPdG5TZndpVU4wU1JwNmttdngvd0phYVlJSmFzUFlY?=
 =?utf-8?B?NzBhdWJJZzhXUTc4QTFSeGg5RUlPNUYrMU5tS3VKci9rZTdBdlpXUGNYdmk3?=
 =?utf-8?B?TWwvSXRCMnNkRzBmeUdINUUyVGNOY3gzditHQ3M1RW9uSzNlY1hZNkU5dE8v?=
 =?utf-8?B?TTJhT2N1bS9pUEY4a1cycmlsOXVoanM3SDdUZ3lEMWc2eGRXeWlDdUI1eUhH?=
 =?utf-8?B?M3ovRGlPOEx1ZjZIV201M0NjZjJkbU5tWnNsZUNydG9XUlNoWFdCRlc4SExx?=
 =?utf-8?B?M24yL2h6V3orQkwyLzBSWSttNjBtekZ4Nnp1UUhrdENRSEZlWE11S204M0lL?=
 =?utf-8?B?N3pmSmRlZ2YweEs1c01oUHNmNWhXbzBKSzlaNlFadTdFdG1JVTd5b1pHOUUy?=
 =?utf-8?B?NVRoay96K3ZrNUpTL0R4Vnp1QTF2c0JvZm1FOUJBTDQ4VGQ3Mmk1WjJRdmNw?=
 =?utf-8?B?VUlJUFJWc1dlQlhrYVBHTWg2Z0IyTlNpdkdhUExRT0wwcDV6aUVTZzZqRmd3?=
 =?utf-8?B?NEZjL2hJZGUrU2hXYkRKNGlqU2JEQ3Y3MXhHaFJKaDhaYzRrTUh2LzR0RVdm?=
 =?utf-8?B?OU9TSHBtTURrMEhndmlFY3lOZWYvM0JpWHpIdGRJOHFFK3Z4eEJpTllRZDg0?=
 =?utf-8?B?NGUwZ204a1l2bkNBTTJTRGloQ3NBQ2VWdW41UnBQcVpsbHNzblBNamFnSEFJ?=
 =?utf-8?B?bW82UzQ1REdtR0VhUnV3bHlQQTZSTXVmcW9LNU1LOXRsNXN3aUJGOWJ5UGdD?=
 =?utf-8?B?eG4rdGltL2dLN0o3dndPdk1Cb1NVa2xheU5YbTJ5U2dGWjFwOGlocGJxazRx?=
 =?utf-8?B?WVZiRUo5Z2I5eWU3MXJTZmNPbTV0QS9hcC9RNGo4REgzN25CK0FiZFY1aTMw?=
 =?utf-8?B?Rk5oejdpZ0h4STQ0SkVXRzFTV0hTa0NqdTJLQXJNTlJXYWRhUHo5VW5zNFVX?=
 =?utf-8?B?M2E3STB3WUhZQ1B6cmlObVg2cVhPcDV4TUEvNDJ4U25rM0ZrRFZlb2VDS1NH?=
 =?utf-8?B?UlhmQWN1ZWMwVVdtbzd1RVA4OHBsZlI5dzhvaU5YVDJHQTV2ZzVwbTFtOE1q?=
 =?utf-8?B?VVRlVnNMSm1CdnVjZEJrMUorNTdTOFlCUWxFWnVMWDN3Z05uQjRTcUJDMTlx?=
 =?utf-8?B?dEo5dWtlYzZQS3hWaEdjSGV6aXBwV01sQmFMOU1KSlIvaUI0Z2dDdU41aktl?=
 =?utf-8?B?WExUdTYxRmJYUW5ReXYyOTJCQXlRM2k4bTBYcXc4SHY2eEUyeXpJbG9iWkNo?=
 =?utf-8?B?SmluS3ptQnZmNnJyUThpSlhVM3pqb0FEMWloNWtuYmQrN3dMaGN4VFBsM09I?=
 =?utf-8?B?bXJhSUlwSElhc0NYc3pXWFEwbk40dFZCeWsrcldIREMvVGdXZUpld0FuUVYy?=
 =?utf-8?B?SEdtOXY1Yk40YnJQNkZPS3BudkNFamxqUTBUNmlNd0c4NEFad2ZhVlBEcElp?=
 =?utf-8?B?Y2lqdXcyTTdSWHBrUDhBNHRCT3pudm1QNjYrcUlaREk1eWUvcm1sRE1Hcmhy?=
 =?utf-8?Q?Fpz1yJcX4Ftee?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(7416014)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YThsTHV1WE9jS0dWczAxNERzSFpoTXZSRnl0OXBydjZFeW0xd0duN21IWmU5?=
 =?utf-8?B?RVBpSkdJS0hyWHBBZmpNRmNSdHZoRDBObHk1TnBNTTF0bWgxZ1pGeEtvbVY4?=
 =?utf-8?B?YjUzdGQ0MlUva1daMndwMGlGWFo5VGRGYVFkZWVZSCtSS3hUY0N5a21Oc2FK?=
 =?utf-8?B?Q2w5U3JQZXpUOWJrNlpVaE9vRVdqTHhQQW9LZG1jSVRuYVlmcVpleFNSSXpC?=
 =?utf-8?B?ZWlubVdUME1WYlRHeEo3L2pBbHRyVERCTmhGc0wzaFRSeU0vTWRDUUNzUlI5?=
 =?utf-8?B?VDNVWGJFTkprKytwT0Y1WkhnVEFneUNEUWZVQ3RhNTh1dFY1T1RqaHpWWDNE?=
 =?utf-8?B?SHpYR0FXdTcyWTRkaGtYbzl4UklCS3pUZzZHVW1URUlGNjNrTmNTMzZMT0V3?=
 =?utf-8?B?emM3bnZ1djdCVHJPOGZuT3g0VE1DZnFGVVFuTjJaMDl5S1lZZ2NSWlgvb1pO?=
 =?utf-8?B?cHdST0hIV1kvNVdRMjJ0ZS9YaXU5R0QxS0pzUFFkanBqVXA5ZVgrZFdiMnlD?=
 =?utf-8?B?U0gvbmV1N2xIK2tMdVJiM3JOTTNneTFYOXpGdDhvOHBLWUhnaU5nQUhhZFVn?=
 =?utf-8?B?dTFuMEVKOEV5VEIrMkFkcVJIZUM4cUpPQkRMOWZ3WGtKQjBObEtqSkl6TW4r?=
 =?utf-8?B?VzE2dFNaMUhtNlVkdENkNzF0bFc0V3JuN3VIZDVWVktzTSt4U2o2Q2NZdTFJ?=
 =?utf-8?B?dG42aWdIRFBteXozRnFMZCtJWHl0ZGVsYnpaUkt0TUg4d0FiYjE0U2ZnTFU2?=
 =?utf-8?B?bmczZGt0ZmFldnYvRGZIbFlZUjhDc0pJQmNKQncveXdBUTBsZUpESFVnNnlG?=
 =?utf-8?B?Q1NiZ0phbFRzWjE0bkx4UHIwMDFtUEVMN0FkL0w1OGE4MEhJVHNVUWc0d2dQ?=
 =?utf-8?B?VVNlOVpWK3dGMEl5MkdGczc4clBwa1NZVkhtdlJoS1BoSXRwaVREanlPZHpY?=
 =?utf-8?B?MllRUWp6Lzh0Z3BPS0doVklRSzJFL3pvdTg2T2E4RmpFNWJKSm5RRVFiSmJj?=
 =?utf-8?B?ay80V3pody9tKzBOSVN2MzZpMW1WN252d2EwemN6UVhldExiVFlrT21FOXBU?=
 =?utf-8?B?RnpVd24rZ0lDWnl3NkxFMElZVWNYUnFrMDdaNUw4ZHV6VnNqMXV2Sk9WYzRH?=
 =?utf-8?B?NTliUzVwL2lzNE4yWEt2YXZDU2FqaGRhMVJSSit3a2tPRmRQRE5EdnFvWksv?=
 =?utf-8?B?bDA3Q1FmQ284WHJHZ0lzZHdQRkxnR3dmYURKM3NwM0szUUtaV2V2Rk1vdFhs?=
 =?utf-8?B?VmJ3MHhnZG5NWGdGRytjYzNzUTY4UmZ2a3J5M3pScTVYeEVadXlvQkxkQVZE?=
 =?utf-8?B?T041VjlCZ25tTkVXeGUxOVM2RGFFUlRTdG03a3NEZnlaWC9tNUFHWUZUWWtG?=
 =?utf-8?B?ZWFVS3lTSEFtSk14YlVkK29pWXhubjFIVzVOQjB6SDlMb09uQ2p0YWtMNVVF?=
 =?utf-8?B?SEVNTnFnclFxdVc4eUJmR2plSk9GcFA4azNzY2lOZFArVjA5bE1ZZEYxaHY0?=
 =?utf-8?B?eHA1VEN3dC9PNFg3Q0xOeVE5ZkdCMGxSRVBHZVJ5ZzIyYWUreEhVclZIZmNj?=
 =?utf-8?B?WXFwZlBIbjA0N20wbmxkbmZYdiswb21XM01vS1pYWkh3Mnhvc2orcEx6d0J2?=
 =?utf-8?B?WnBvU0ovbVFVVmY4ZFIzYlMwMnhFdGYyZVpvQldma2JPdWpvQXRBVEQvNjlv?=
 =?utf-8?B?Uyt0R3ZoNTNvZjRhNFZzS1hRcXVjMFZObDRGN2tTcnN0Y3BqY0M3ZHg4WW1v?=
 =?utf-8?B?STR2U1M2T1YrWnZYN2k0M1hZanppYTJoeXZpWU5HUThXM1hWbFpVVkp3dWRM?=
 =?utf-8?B?V0Vqa2R1SnEraDg0VXM1OTJGR3pkemlTcWdZNHJBdnRKMEg2STdOOFJ3ZG04?=
 =?utf-8?B?Y0xXL3ByUTBRaWFPT3dTNCt2TlN1enFUZUd5WWlWV1g4TTk1R25XOWhVZWZE?=
 =?utf-8?B?Qmp0dmtiRkRTaVMrcWYwNDRHSVFUZnlMUW5EcVFGQ3p5b05wYXRheDN3Q1Fv?=
 =?utf-8?B?ZUxHMWo0ZEUraXV1RUZvWlNrQTdnc2RxNlRQY21CQ1ROSjVRY1Z2UUZna1Fk?=
 =?utf-8?B?NGtYdU5RYUIyWDRKU3pEOWJTWWFFV2t0blFDbWZrWEtMcENpWTFEK2R6UVJ6?=
 =?utf-8?Q?klMmqoFnHFFX2yjn1L1CcQgr0?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8b57b8b6-1e40-40aa-2360-08dd75c9e47c
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Apr 2025 11:46:54.2247 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9qM4snG2omhWHGT1Lh8ntmZVQjowDPxBOyc8y5/SB5IkT+GawxaNW72pJ94h5MYa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB8772
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

Am 05.04.25 um 03:57 schrieb T.J. Mercier:
> On Fri, Apr 4, 2025 at 1:47 AM Christian König <christian.koenig@amd.com> wrote:
>> Hi Maxime,
>>
>> Am 03.04.25 um 17:47 schrieb Maxime Ripard:
>>> On Thu, Apr 03, 2025 at 09:39:52AM +0200, Christian König wrote:
>>>>> For the UMA GPU case where there is no device memory or eviction
>>>>> problem, perhaps a configurable option to just say account memory in
>>>>> memcg for all allocations done by this process, and state yes you can
>>>>> work around it with allocation servers or whatever but the behaviour
>>>>> for well behaved things is at least somewhat defined.
>>>> We can have that as a workaround, but I think we should approach that
>>>> differently.
>>>>
>>>> With upcoming CXL even coherent device memory is exposed to the core
>>>> OS as NUMA memory with just a high latency.
>>>>
>>>> So both in the CXL and UMA case it actually doesn't make sense to
>>>> allocate the memory through the driver interfaces any more. With
>>>> AMDGPU for example we are just replicating mbind()/madvise() within
>>>> the driver.
>>>>
>>>> Instead what the DRM subsystem should aim for is to allocate memory
>>>> using the normal core OS functionality and then import it into the
>>>> driver.
>>>>
>>>> AMD, NVidia and Intel have HMM working for quite a while now but it
>>>> has some limitations, especially on the performance side.
>>>>
>>>> So for AMDGPU we are currently evaluating udmabuf as alternative. That
>>>> seems to be working fine with different NUMA nodes, is perfectly memcg
>>>> accounted and gives you a DMA-buf which can be imported everywhere.
>>>>
>>>> The only show stopper might be the allocation performance, but even if
>>>> that's the case I think the ongoing folio work will properly resolve
>>>> that.
>>> I mean, no, the showstopper to that is that using udmabuf has the
>>> assumption that you have an IOMMU for every device doing DMA, which is
>>> absolutely not true on !x86 platforms.
>>>
>>> It might be true for all GPUs, but it certainly isn't for display
>>> controllers, and it's not either for codecs, ISPs, and cameras.
>>>
>>> And then there's the other assumption that all memory is under the
>>> memory allocator control, which isn't the case on most recent platforms
>>> either.
>>>
>>> We *need* to take CMA into account there, all the carved-out, device
>>> specific memory regions, and the memory regions that aren't even under
>>> Linux supervision like protected memory that is typically handled by the
>>> firmware and all you get is a dma-buf.
>>>
>>> Saying that it's how you want to workaround it on AMD is absolutely
>>> fine, but DRM as a whole should certainly not aim for that, because it
>>> can't.
>> A bunch of good points you bring up here but it sounds like you misunderstood me a bit.
>>
>> I'm certainly *not* saying that we should push for udmabuf for everything, that is clearly use case specific.
>>
>> For use cases like CMA or protected carve-out the question what to do doesn't even arise in the first place.
>>
>> When you have CMA which dynamically steals memory from the core OS then of course it should be accounted to memcg.
>>
>> When you have carve-out which the core OS memory management doesn't even know about then it should certainly be handled by dmem.
>>
>> The problematic use cases are the one where a buffer can sometimes be backed by system memory and sometime by something special. For this we don't have a good approach what to do since every approach seems to have a draw back for some use case.
> This reminds me of memory.memsw in cgroup v1, where both resident and
> swapped memory show up under the same memcg counter. In this dmem
> scenario it's similar but across two different cgroup controllers
> instead of two different types of system memory under the same
> controller.

Yeah, nailed it. Exactly that was one of the potential solutions I had in mind as well.

It's just that I abandoned that idea when I realized that it actually wouldn't help.

For example imagine you have 8GiB system and 8GiB local memory. So you set your cgroup limit to 12GiB. But when an application tries to use full 12GiB as system instead of a combination of the two you still run into the OOM killer.

> memsw doesn't exist in v2, and users are asking for it back. [1] I
> tend to agree that a combined counter is useful as I don't see a great
> way to apply meaningful limits to individual counters (or individual
> controller limits in the dmem+memcg case) when multiple cgroups are
> involved and eviction can cause memory to be transferred from one
> place to another. Sorry I'm not really offering a solution to this,
> but I feel like only transferring the charge between cgroups is a
> partial solution since the enforcement by the kernel is independent
> for each controller. So yeah as Dave and Sima said for accounting I
> guess it works, and maybe that's good enough if you have userspace
> enforcement that's smart enough to look in all the different places.
> But then there are the folks asking for kernel enforcement. Maybe just
> accounting as best we can is a good place to start?

So we would account to memcg, but don't apply it's limits?

Mhm, that's a kind of interesting idea. It at least partially solves the problem.

Regards,
Christian.

>
> [1] https://lore.kernel.org/all/20250319064148.774406-5-jingxiangzeng.cas@gmail.com/

