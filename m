Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D1B42A8B2A2
	for <lists+dri-devel@lfdr.de>; Wed, 16 Apr 2025 09:51:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 36AF010E16F;
	Wed, 16 Apr 2025 07:51:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="l+RyrMEs";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2054.outbound.protection.outlook.com [40.107.237.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5BFCD10E16F;
 Wed, 16 Apr 2025 07:51:12 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YEjGyVA/pGNJ0njcE3zOgt9EPw+jOru7iv1DeIwHqgq4mVMxEbjVflVEV5JaPtLjtZ8QGPxblq3PfPGSLdUiAPwPZE/CY82qfOZkuLHuQl19qbpFdG1lKFQvmrd1f5w781kn9fIzBL5TN1UbxIVHbsHpRvwox/bnIzLuVNd/afQRYlHDOZKWHAzH4WxuVaxFgAptkHrmHgt2ch+75a6Qtmqh1nqWk84LjLMVb1yUsrI+zmRwdUKCbdLdqgPynzsxpju0B9HuHpVAeILqYvxPWMKvsOPz22AyZhnIttO8kYTL/zKmiyj7kFbxlZxc9FebAmp4l5oGXPMw8b14fQryYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OXmd4EOEzKPNaBtfmn0vFjHNJVt3LHwpJlOcSdHVEmg=;
 b=CHX+KB90CDpMpjNH96pE0skunKt40ytEtsfLCjxaHHMzStoZjhBadffJ+P0t1z5GZS4/G1AH4CkElru3XUSz3TbfYX+AmWhkeVM1mvCzwTYQGB1vTdLrLRpq72dAnhx2FiByjYV5HpfOml9NFJfwy0speVgnyphMt3P0z4BdIjemOAuJHs3tQNJ4G8q98qCtl698FGr8xrN5gdPTqoIsPZGPnxa57lD2OaJuRhOTvm//HHeJQOVCZexrxv6ssCuvdJH6n53ze9YAN4YYAutd0p6R65zrPr59JAmoOe4YHoFPGK/HF9ioUscFTrIPZTBM9sOdvNU2gazA5h98sdBj0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OXmd4EOEzKPNaBtfmn0vFjHNJVt3LHwpJlOcSdHVEmg=;
 b=l+RyrMEsB1DU7kjoqihpgfdoqfu4yQHeTE83EXQmAnuVe/xFEJzNg6MCPXa0snnBplacBFweAMkhDpcgTB0Bk022s23cKWMm+ud+Od5ujqUlfqLZLMWzMTXXhP86cY6R+l6yRYSY/rIOIjgqPejpxwQXspcG4SLffPxBu81FDGk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by IA1PR12MB6138.namprd12.prod.outlook.com (2603:10b6:208:3ea::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.22; Wed, 16 Apr
 2025 07:51:08 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%5]) with mapi id 15.20.8632.025; Wed, 16 Apr 2025
 07:51:08 +0000
Message-ID: <241a9bbb-6d59-4c24-8e18-a0acebc6f536@amd.com>
Date: Wed, 16 Apr 2025 09:51:02 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC] drm/amdgpu: Block userspace mapping of IO
To: Ujwal Kundur <ujwal.kundur@gmail.com>, alexander.deucher@amd.com
Cc: airlied@gmail.com, simona@ffwll.ch, lijo.lazar@amd.com,
 sunil.khatri@amd.com, Hawking.Zhang@amd.com, Jun.Ma2@amd.com,
 Yunxiang.Li@amd.com, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20250416072825.3790-1-ujwal.kundur@gmail.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20250416072825.3790-1-ujwal.kundur@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0119.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9d::15) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|IA1PR12MB6138:EE_
X-MS-Office365-Filtering-Correlation-Id: e91b7746-547c-41df-5ec0-08dd7cbb72b7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZkFhclhMOE55T0RWMis4OFllM2YxaTlSYzlqYmpxYmsvZkJaMGNJbkZDQi9J?=
 =?utf-8?B?SmRDLzQxbnVwOVNwUGxRUGM2TE9FNm5nVm5wZnJHQURUQTdrUXFMdGZuYVNk?=
 =?utf-8?B?eUJpSERtdElMUHEvWitlQ1R6TmRHWFlDb2krRnl5KzVCQWRMQWNRS0JBZ3Qw?=
 =?utf-8?B?UVhQVjNOMmtkR1VlbnYwS3RlUkEwSHBLWHBSeVRNS0xRbTRiMHl0VEhCM24v?=
 =?utf-8?B?enlsZExKejZJVkRGOStCQkZ5MVV4YXZEdWhwUEswbGlJVEVjWHRZdEpzeTVJ?=
 =?utf-8?B?Tmt6WDM5MWE2bi8xMVlGUkhlb3AzRzZjUmZ5UVFjMm81Q3V2bjArdStFL2F1?=
 =?utf-8?B?RWRzdHloMnlBUXY3dnlOeWVDVkZQS01jMmNaNGUxak1OVjNSbW1oNkNBb0tm?=
 =?utf-8?B?a3NrSnpLVk1Vc2hRWnpWNmNpNlpzWmdxSDFnMzVHQlU5VlNweWlJaGtkRjJi?=
 =?utf-8?B?eENNL1FPci90Vm9QRVdEdEIxVDlsTmRpbjJWMFowZjNDSWtLVkxRNWNYWlFv?=
 =?utf-8?B?N1k2SEJTY0VTenFJYmdUbU9BY0J4SW8yM0J3SWMwLzVkZ2dYNnprcGdsRk44?=
 =?utf-8?B?bTkzZHhzcjdWei96N0pmcnNZYVp5anBpOU13cTFHWUVveC84OEZuSnlHMjVN?=
 =?utf-8?B?UDRHb2JPTTd2T0toelZnWXp0OHhHYW9xa2hSbjVmWFA2cHJGSnY4Ymo3UXRv?=
 =?utf-8?B?aVVCVnBOWlV2S2R5Uy85VHBldEtTZmdRL3JINmMrUzZjSXN5TWZrTE94THp6?=
 =?utf-8?B?bHVzQlF5NGxueTk1ejR1ZFdxcnpDSFpWaWJMQTZISHVpa3BXVDE3VU1jM2Y4?=
 =?utf-8?B?R3JnOWlPcWFSRTF1NjdGWGlXTGF2K3JlZWM2MTVTbkt0bUd1ZjluYSs3UFo4?=
 =?utf-8?B?bHI5ZEhOT05UV25VT00rQjkrQnBFVlZaYXoyOXV2d3FJYmR3aDhkTXlnK2xH?=
 =?utf-8?B?OVhhMmxadnNzNE5QSTNESndRbTZvMmI3RjhVMnZWSE92dU04aXVEWlV4dlY3?=
 =?utf-8?B?UjJpWi8xQXM3b1VjZ3Z1QUZmU1RLRkJ0SU14a2QrdnZ3SEpheFMzMkxEZnE1?=
 =?utf-8?B?ak1FV2Y1Y2RkTDJPSmRLWHBoSnlWY2NDNTNSTi9RaUlpcnlIUG1BT0k1dDdo?=
 =?utf-8?B?cTV6Z3RiTHQrejlaZFVzWjZIQWZKSk15dVB2WFRWTDdaRkdmVlZaT0hiVmpt?=
 =?utf-8?B?d3FnSXg5M0g3S05iUWF5emlnVnplYnJWVUJnK1NyUFpQUWowS1dBYUFub3dK?=
 =?utf-8?B?ZVNvc1dPTWNUT3g4RkdSclRCbktXQVRPb2dSS08wc0VkeS81ZldoVmtTSC9U?=
 =?utf-8?B?QjZBSTVjM2wvZ09tYUdOVWpFcFZBcDBDQ1NGTG5qMGVic0FZZy9ub2ZXU1hG?=
 =?utf-8?B?eS9zeS9MUm82aWUxUDE3WC9SSThsMWtEcW5teENjQjlxbmt5L3o1eUVJM08x?=
 =?utf-8?B?RDRtOFRLTWQ3Qmw2Wk51TEg0cjRKK25jL09OMGhOOG4xMVI1OHdXbmtITlpR?=
 =?utf-8?B?alVRU05UalFJYjJQeTZ5QzhtdXNIK1BEWU56S0kzNUx4OFVtRERNU1RHbnV4?=
 =?utf-8?B?MnVDZFV5YmdrcW9yRklsRXJvYnFlSEZyR3pRUUE5MThqUVZEQWRNaG92SGVy?=
 =?utf-8?B?c2xvbFNTVExmZzJMVXU0VWdVREVCbXFXSEFMeFRtYmRHNkNVTkxBdWxkV0pG?=
 =?utf-8?B?R1JsSytNUklDMmt0aUxkL3F6cTdaQVFzOHBxSmM5c1ZldmRqU01rWlppbFRU?=
 =?utf-8?B?WnFXZzZNL0k3cTRxY1NjTzg1Z2hVaElpUVlBVWRDa0hrQThoRzR4RGVjaVN4?=
 =?utf-8?B?d2JzNW12T3g4aXBvanFlRDBxS0FkT2pGSjlNUG9BM1VxZ3l3UnBUWDBleWc2?=
 =?utf-8?B?Y1hzdFMrRDZpMW9remU0b0EvVHJoQTZ1dnpuQ2RITitISTlibW9mUy9xTmpv?=
 =?utf-8?Q?Js4ZMMZrcK8=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Mmx3RWpqVlNvT3RITjFhU2hQNVBCbTRsNUNIZ3lKZmVtMkMyNlNyQzZ6RGk2?=
 =?utf-8?B?Zno1UVJ3bHZneHYrQU1FbFRVREtMUU9QU1FQb0plZnlnZk1mNjV5eGFhaWd2?=
 =?utf-8?B?VHdQZWo1dGNJTlR4dllQVFJoZTJneUE4dWpWSzUrYUdjaXk0ZkZBODBUZnVx?=
 =?utf-8?B?WFhyWXBib2FrNEttbXczODJJZXJCWWRDWVBpbHVyNHpTd2VZR0dMT3dNWVZ4?=
 =?utf-8?B?Zkw5MHNvOUdQcHdhcG93YyszOEswa1ZHZ1N3Z3U0SXMzZ1N5YWg2T3pSMzhZ?=
 =?utf-8?B?b2VIR3VxU1VkN1JmU3FsTm5lblV2L0s3WnY1WEFpeEVTZEJQL1h1bGdmOERX?=
 =?utf-8?B?TVJCb0h5eERxR3Nkb1ZCZnBidU5kNnVrMkRFZytOTnRFV2xJUkZxTUhSdUo4?=
 =?utf-8?B?ZUZUdmRZSXloOG43NWxOaUtENFJEVFJWdzd1SHZDRVg0cGpEZ2tlTGVpOExt?=
 =?utf-8?B?QUM1eGVVenF5LzA4dy8wbVFvWDYyKzl5cTMwVXgySENhZXpzcXhQOTVlSytI?=
 =?utf-8?B?UGRUMXZwKzI0RlNZRHVJR1JVOURPeC9QZU0yOFlKbjFzWWxJR0ttaDdMdFFT?=
 =?utf-8?B?djg4V2dNeElpYmN5dE5JYXRMNGY0YXhlQWxBcCtGb2oyRFdBZkhHUTliWFJ3?=
 =?utf-8?B?K1lkWU5LTlJPUHpNZE4yVzk1SHg1NnFwbGlVTTNlVFVEVGVsM0xhdEVHU3VZ?=
 =?utf-8?B?NTZkUDJ3MmZvaHdXMXdjd1RUNUhVZFRVK2NXV2dBcGcyRHJPQysrYUkvc0ha?=
 =?utf-8?B?R3JkYmRYNUZUOHRka2gyZ01ubmZPSFVkZlBaOTNBOURXTGtybW94aDdwcG5i?=
 =?utf-8?B?QnRlR3hQbUx6N3AxSDBoL1cyakUwTkdhNVZMVHpQbmc0QkRwczlDR29iM3k5?=
 =?utf-8?B?eERaV0pMbkpvOXE2N1ZMVGxzNUFGakFqK0lLUXhibXYvOEFJUVpnSVNvYitM?=
 =?utf-8?B?NDV3VWluOUwrZkU1R2ZSQnhoU2psOXU5UHkrbW8xcFJVWGsrbzUxRHFSRC84?=
 =?utf-8?B?K3JCU0phN3RTNi9FVFB0dzdmQXU1YkNLeHRReTd6bUZZdGo4RjNnand1NThR?=
 =?utf-8?B?Qzg0S1lqR3BHTzJydHljVkduTjEzYzVUN0p5NXozT2g3TUxraVdjc2hZNGR0?=
 =?utf-8?B?RzBlUFlvcTl3TVoyOCsvQ21NTW5WMG1PaEhZeEtTRys4amsyREYzbzNqbXVH?=
 =?utf-8?B?MlVpMy9oUTBvZUdUSlllc3hnbm5vdGRMZnNzdlNXaCtENjFlbEZYcnN6S1Nr?=
 =?utf-8?B?cm5vTXdsSzN3a21idGVuK0xLTzVndExDaFRobWR2aGQ1NXJ5YlNCNVQ3ay9h?=
 =?utf-8?B?WWlKN2thN1VyakpBMG0zKzhVN2haQzMxYm5HdEFlajl6czdYcDJVWlZpeGZi?=
 =?utf-8?B?SDFpYkZZL1ZVUjFUVVpRQ3BRTzg1aklheGNsS3JaUmI2dzltcklPZklCN3pr?=
 =?utf-8?B?bnNzSWxMVW5qR0srR2NzWFRLbkFhWU9RODdnYXFRTG5tbTRHK0lhc3djdXQ2?=
 =?utf-8?B?bTJ4ZXNoOTVKZWkxSW0zVm9hSW9CbW9VU2FQSElCVkdUb3c2MXlIVC9KMklI?=
 =?utf-8?B?RlEyVzNjbjEybURZR0tLeTFkZlRRd2RGaXk0WDVxc1VLYkJXWmFrMnlOT1BO?=
 =?utf-8?B?VnNDUTRFd0k5OUdaYjlOakdFNXRFMFdjVld4aGVHemI0ZzYzS3U3WTlXK3Fo?=
 =?utf-8?B?RHZyMFV3WWdod1R6T0xoTzBTZ1N0OTFYd3grOUhyRjVnZ2VSZStYQjQ2Yzc3?=
 =?utf-8?B?aFhkeXBFeDhsRjdpTEcxKzZrMWYwMGs3S2MrcDlCd3NndjlWMnAraFJiS3Vr?=
 =?utf-8?B?UTlCVHN4T21aNlhNZ3ZqRWR1S3hzNE1yZWpiMWsvRHp5OVF4R09YRlVGU0dk?=
 =?utf-8?B?VUUva0x6NFYxdVgxYityUWJJcklKaVBNbzBTYURVUEkyaStPeUlnam1FWmxh?=
 =?utf-8?B?cDh3L1VNeG5nMWxvNkhCVFpJQ0NuV3VwendEN25NYkZzVm8xWWVmMEsxdmlW?=
 =?utf-8?B?MXhmUCtTKzdrTnNPYmVJanFhV0FDbkhMTmRaak5UUjBQazF1empoWjJXZ1FO?=
 =?utf-8?B?RlZyVkRiWGdZczJJczRVU1ZmSzhQQkxWMFBGeDhTY0pCY3A3bUEwbGFLeUdk?=
 =?utf-8?Q?o2mjAnZpt/pzFviXDEMC+DL8u?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e91b7746-547c-41df-5ec0-08dd7cbb72b7
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2025 07:51:08.3727 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ggD6dzBWOlEdiZTJ4E2VvxcrFzCCi/z++uJ181zzZyf136k+cc5rpxZfJIhiDRO9
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6138
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

Am 16.04.25 um 09:28 schrieb Ujwal Kundur:
> This is a RFC patch for blocking userspace mapping of IO register(s)
> before ioremap() calls are made. Out of the available IRQ sources, CRTC
> seemed the most appropriate for this task, however I'm not quite sure
> about that as well as the type, which I've set to 0.

Hui what? Why do you think that grabbing a reference to an interrupt would block userspace mapping of IO registers?

Christian.

>
> If I understand correctly, we actually want to block certain ioctls from
> userspace that can interfere with ioremap but I don't see a dedicated
> source for that.
>
> Signed-off-by: Ujwal Kundur <ujwal.kundur@gmail.com>
> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> index a30111d2c3ea..365af52af6e5 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> @@ -47,6 +47,7 @@
>  #include <linux/vga_switcheroo.h>
>  #include <linux/efi.h>
>  #include "amdgpu.h"
> +#include "amdgpu_irq.h"
>  #include "amdgpu_trace.h"
>  #include "amdgpu_i2c.h"
>  #include "atom.h"
> @@ -4367,7 +4368,9 @@ int amdgpu_device_init(struct amdgpu_device *adev,
>  	ratelimit_set_flags(&adev->throttling_logging_rs, RATELIMIT_MSG_ON_RELEASE);
>  
>  	/* Registers mapping */
> -	/* TODO: block userspace mapping of io register */
> +	/* Block userspace mapping of io register */
> +	amdgpu_irq_put(adev, &adev->crtc_irq, 0);
> +
>  	if (adev->asic_type >= CHIP_BONAIRE) {
>  		adev->rmmio_base = pci_resource_start(adev->pdev, 5);
>  		adev->rmmio_size = pci_resource_len(adev->pdev, 5);
> @@ -4380,6 +4383,9 @@ int amdgpu_device_init(struct amdgpu_device *adev,
>  		atomic_set(&adev->pm.pwr_state[i], POWER_STATE_UNKNOWN);
>  
>  	adev->rmmio = ioremap(adev->rmmio_base, adev->rmmio_size);
> +
> +	amdgpu_irq_get(adev, &adev->crtc_irq, 0);
> +
>  	if (!adev->rmmio)
>  		return -ENOMEM;
>  

