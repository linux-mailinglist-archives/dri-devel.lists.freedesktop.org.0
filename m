Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D182CB8E61
	for <lists+dri-devel@lfdr.de>; Fri, 12 Dec 2025 14:29:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4DE7210E746;
	Fri, 12 Dec 2025 13:29:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="CkA0nWB/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SN4PR2101CU001.outbound.protection.outlook.com
 (mail-southcentralusazon11012030.outbound.protection.outlook.com
 [40.93.195.30])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE0D110E746
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Dec 2025 13:29:02 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lrwIB0iuzyfEGw/creWWNcY5JbZztNHEmgbgZf4MAHYRnIxuXvgonDPDXYDI64lXJcuOcGxbs71yhKLwXvgoSsQB/mtGy9GOoYJLG+qdQbddghut8DBCAZOUUGhr+SdujBJYTgY1DT92/tYzn3X3baTtwlgNiniSzVxONAQAtzCb3Ljse2YlK0Tc2LyuPpXGyHpW1LAs4KuVgnUNq7GobEqrU8M3AhWZHpaMLLd7XBuWDqzio7ewbj4g9wEhzecyCocZo2+Jsj16Nl1EoAWpXExLokUPouu+7O+W0SB5o5vuIDMjdMZ9TOdPqHioozMq2h5wb5zYfPoA3de2NHw5zA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1Y6bnYKKemFW+nwsxncuSlXmNdID6rxHLwkZJso9tYs=;
 b=DPMTVJZ1p3No744ECT9sAsAmpwgUJFLRyf1cbN+dRmCPx89cCIKtmKieKbsEqTjwLIuu9HpkCLsk8OMA9jxG7Bs73ON20Rf4vzedr9002EwZ+cMrbPeTN3DCDm820/D4oZZy93+100Eigvs87I7coTJhNjDAICTl/chYS99OGf8PAZythEUdi3V8779+/E6Ey7WM2j6bf68Yeuphs/YixvYPRf82NhBLfuML67TDkORKS5Cdnh6STP6jcEdCUWgSB7hEWNREyOb2Jc7y5muB+GE/773mgJhplEeMauy2vLkofIpDP5aPurScY833iWcVrfmxNkAjDwB0gQQ811X7Wg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1Y6bnYKKemFW+nwsxncuSlXmNdID6rxHLwkZJso9tYs=;
 b=CkA0nWB/1cf7xbdgidrRiBrrkpW4oHZnU3ciuqd02ev8jNLAVajejrcIJ/xZ7no6x8I9J9Edv0fygzHBf03JloiKw7lpm4K4L2rSW+k/eo11Df5And3v+r3Oyw5XDMwwNRqy3UIneIJxYRxS4ynax3o9qDcxdgb4f5Lp8UAMPrI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by MN6PR12MB8492.namprd12.prod.outlook.com (2603:10b6:208:472::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.12; Fri, 12 Dec
 2025 13:28:55 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%4]) with mapi id 15.20.9412.005; Fri, 12 Dec 2025
 13:28:55 +0000
Message-ID: <ce82901a-1c65-4aaa-a092-7b67b81253d5@amd.com>
Date: Fri, 12 Dec 2025 14:28:49 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm: Fix object leak in DRM_IOCTL_GEM_CHANGE_HANDLE
To: Karol Wachowski <karol.wachowski@linux.intel.com>, David.Francis@amd.com
Cc: felix.kuehling@amd.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
 sumit.semwal@linaro.org, andrzej.kacprowski@linux.intel.com,
 maciej.falkowski@linux.intel.com, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
References: <20251212132052.474096-1-karol.wachowski@linux.intel.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20251212132052.474096-1-karol.wachowski@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0096.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:cb::10) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|MN6PR12MB8492:EE_
X-MS-Office365-Filtering-Correlation-Id: 9002126d-3952-4990-8359-08de39826605
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|7416014|376014|366016|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cmcxVnU3ZkhpUXcyampUZGQwYTRvMHNlaS9WV0NqdzlYY0VORWdsZUtpV2NX?=
 =?utf-8?B?SHhnUndGcFdLWDY2b3ZKWGI3YmZFU1IyQmF3cER2REFpSEZXc1o1VmVxR3ZD?=
 =?utf-8?B?dVFzTW9OeXJGZE9ZeDU3R0o3MXY5OEQ4bnZGVmtvNUpGZUI2OUllRHlEalpk?=
 =?utf-8?B?eUs4Nmszc1ZIWUY3eVJSdnZ4N25YYU5xQnIzTFd3WjJJelZTMmYvd3hkcDda?=
 =?utf-8?B?b09VcUc3QklaTlBCM2JibldBUTduU1VzNG16MlRtZW40V1ZyV3hoeWtJTmhB?=
 =?utf-8?B?QXYwSTRqOWFmMEpmWTFyY1I2WlAwZzhTOXkyMmR4WTBVU0pvQmtBcmRjaUY4?=
 =?utf-8?B?ZG5hNG1Zc1FTeEdzK2VwTGdjbEtraHQ4UUVBVmhlNmhpL2NLb3dkMGZWZ2R0?=
 =?utf-8?B?cXp4TWpLT3JoeGdjYkp1YkZSYjJsSGlhNHpnRXVqN3pyaFBoNm1lWm5QQlVx?=
 =?utf-8?B?Y09yZVh3cGRmT1FXNEdicExkQ3AzVHpJMDVFK0VKaUdlMExOUjJraC9YK3JL?=
 =?utf-8?B?VVBEaTRkTy9mWURvb0RRQkI5N2NZVXRONWNNeXJTOE1tWDkyMkVhczllU3Y1?=
 =?utf-8?B?QVJ3VUtiWERNbHBRYy80cWVMVzY5NFJ4NE5FcjA4WFlJT25HbWxiR04yUkRS?=
 =?utf-8?B?c0ovUGhGSURzbW14Z0w1UCszdzJRSi9MSGtmY0dVNTRiVzRtV0tLb1M0Wm1H?=
 =?utf-8?B?WVpqQ0JDWUxCbGhwaWVyazRPT1Qvc1pTVUMzRWhCRnVRS2lqNitKM2p0TUdN?=
 =?utf-8?B?UnA3ek1pZ0U5VjVVd1laZ0RvbS8zWklIK05jc29KR0tSRm5PdFhQZkNPVmdZ?=
 =?utf-8?B?LzNJYWNBUThsZmRiN3FjZlUrL29ZbXFleGJoanZXUzA4K2JBU0k2UkREWUpK?=
 =?utf-8?B?Mi80L240aDVPWDA4NUtBLzFzL3AyRk1aYlg3RDNaVmlqb2s2d2ZpUzFnWDdX?=
 =?utf-8?B?KzFxRkNBOHRGSjdTZXpBQktxeVNLMXBycS9iUDRFZFpwL0djTVRTemk0R2FN?=
 =?utf-8?B?TXVjY3ozeHRISVRvQ2srZTR0V3BseittdDdkcjgwSUtVYnlVdVJjcmVWUU1F?=
 =?utf-8?B?bVAzY0IraFdXejdoQ01LaFpILytNbjBVSVZaNmxHNXBwOTRpNjRLeXQ1dTdU?=
 =?utf-8?B?VGdENHdqL0gzSlVLdGFmUzVWNkpMR3NWL1dhZUJTdFVuSEVrRnRDakkwY0tE?=
 =?utf-8?B?L0tSejhiNGpCMUFMSFlWQm84K2ZWYWlYbnRZOWc0UDZGeTNlU3pVYlRkODNm?=
 =?utf-8?B?MFp6VUpJSTJEUThmRzJtZU0wQStuOFJUMjI3czEzMHpDRkNRbVBNZXd2dm5k?=
 =?utf-8?B?SVVFL2NBVjMrT3NZcXBkNUZWK2ltRFlPeVRSZCtHNzd2MGVNOVdnUWlBWFpm?=
 =?utf-8?B?Mmk4a2FwMm5hL2VwSHA1NytXQ255dmZFdmVITmRoYkVvVnV0RkpPbjAraExm?=
 =?utf-8?B?T2UrZ0JndWJKdHlSM0JVUTRUVnVGcjI2cTdNdGxUc2pUclZkL0p1RFB5c0dt?=
 =?utf-8?B?V2xCTjBFYVptRVJiTkFwNE5ZcmxIbmNYbEd2dGdQQ2ZvNEpkZVI1NTdrRGFa?=
 =?utf-8?B?MzM0VE5xbkFTcS9NbG04cEdtbnZGWjMzZXo1aGxDeWxsSXRqa1RiRHJJS25h?=
 =?utf-8?B?aXpJc1ZtKzVpdnBMZUlMSmtqYTJoSnhIcTV0U0dPYzhDWGE1andNSUswRFdY?=
 =?utf-8?B?c205N3BDZm1RYWYwS1VaWExDNE1CalFlNXMvWUwxQkxwWjFuNXdHRUtsQ1Iw?=
 =?utf-8?B?SlM4OVRlQ1pic1N6by83M3RlUGhFbnFzMVhjSHBNSDFTaGR4ODZ5cmxuZDha?=
 =?utf-8?B?MjNacVc3SmJPYXZCZ0ZmQ0VnRk9kQlp5eTZhcjV2TWNUalJYeGdjZ2pHMWRu?=
 =?utf-8?B?TDZsOXZQbS81Y1VIZkMxN3ZDSURqTjY3N3BEY3lhakgvRmREdUg1Y0lQc2Y1?=
 =?utf-8?Q?7TawBkprqeE=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(7416014)(376014)(366016)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?d2pFcGRaa2o5RmI3bWl0QmYxblY4YldlaTRrUDFicHNyVVhNUzdkZWtNZy9t?=
 =?utf-8?B?WEpQUmlkRldmdEN3K1dNanBINHdROS84U2xzT0prd1JRQXFlUFlvdGN5eGI2?=
 =?utf-8?B?b2tYSlZIYXpUaDhjYlhvYm5ad0dRaFBwVmFwWTBqS0wycDJLZ1FZVEI2VTZN?=
 =?utf-8?B?NmVHckhpK2RBT0RBOTRCN0ZuWno4bTZhMUw2ZnJOL2RCTHA2UGZSQUNtV2Vi?=
 =?utf-8?B?eSsvckVJZ1BlMGhFOGJoRjF0Z2hYc1V4MUFHQWtwYzRxRVVoblJ1dGlRRjVn?=
 =?utf-8?B?ZVpHUzFSR05QT3hQWFM1T3JYMzV6a0RuNVByeEVXM2N4NDk5UTRsVVVCcnU0?=
 =?utf-8?B?NlNJWkxnOG5RenZZUzUySUlpT2lkT3FSdmdoREZ0Qmp2Wm9LZ1hwejNtOGdT?=
 =?utf-8?B?M2dwVWM5NmkyUnFYVnRxZ3BPcEVpMnJ2Z0dySXBTeCtkaUpNQWxoQTNNNkZ3?=
 =?utf-8?B?WFZ0Sk50Q3NTbS9lS3d5clZkYjlnWmNoWlBmaFdxeDF0UU9rMHhQRlZXKzdp?=
 =?utf-8?B?U3hVUTRGRXBRRlAxY0ptWk1UWHpsakJ3eFhXaXBzVlJPeWEwNmFMUGFiWkxX?=
 =?utf-8?B?Z0piaVoxZGFmdDVBb05WMm9aaDlSTk9zSmtNeU1qTDA5dkU5TG5YcnBaWktU?=
 =?utf-8?B?VmhoM1JkVSswdmZzY3M5a2t2SVE4Y1V0NXRSVkwzT3pjSUJVbWtIKzVLWS9E?=
 =?utf-8?B?ZDdCQy9IUGZudyt1R25MZkNvTFhWYnRKTWdtUkd3TG00ZXhOTEtIY2tMUWls?=
 =?utf-8?B?S1NRN0wyL1V3bjBWd1NwQ3d3Q1NSK01TMUYrQlBEVlFTa0ZKUnZ1SUh2TWNZ?=
 =?utf-8?B?RUFZSXlTRXo4WFdSeVhiNjc1L1I2a2tSVGhCK29KSFR0ZmVleFZzSmxBMnNR?=
 =?utf-8?B?eWtOb3FtajNPUXFNaXhzWkFKaEFtRkl5WUhpcksxYURKSXd2UnNFVml3cWtH?=
 =?utf-8?B?TFZQNEpUNWs5WlpsRzJ2YzZoSUVnTUJFQVJsM3FxZHhkMFdUVXorMkkyWEpO?=
 =?utf-8?B?UXVYTitJOU5DWkx5dVMwZk8xSWZoVHFGZUZZRHhXcWFHVWxxRnlFbTFFdFBp?=
 =?utf-8?B?NzZBQzZXZVlaRHpCbWhpY0ZCNHhtN2FEc0IxSFRuU0VFRHM0M3dISFZSQlcy?=
 =?utf-8?B?aUJYSy9vQmVJMU92VHJUdDhZVitzQXRhaFQ4TWx2cUkxVEt5RlV3QmhHYmh1?=
 =?utf-8?B?OWgyeEdCSEdPNzRnZFhVRWUzL1ppaFQrb0wyWTcyWkVxNjZvWG9jK1dHK0Nn?=
 =?utf-8?B?ZlZ6bWVlVUZyS3RyTXlaMkpLTXZXT2tmUm52aGt2d2ZET2NOVEEyYzA1eXdW?=
 =?utf-8?B?bmVEM2tSMEh3WjVxOEQrYkNkWGJTMVVlcElObUJKbVhZTmg5UTUwSVE3cDdL?=
 =?utf-8?B?R0VCRHVhQnBIQjVYVmVQQkViRU00MFZHWHpBVVA0bGVoaUVQcDNqYW9KazNs?=
 =?utf-8?B?cFpkVW85Wk8yNXF2Q1Y1WktUQ282anpiNkx1K0FubG9CMFBNU3RmREJ2NkZB?=
 =?utf-8?B?UGxqdlVRMmc1WTRGOVh1RDg3RGZReHZQY1dkTWxsTko2eHVwME1YYk5ZM1d3?=
 =?utf-8?B?VC9YSWMwU1RDb0VhOXdiZE9GaytJcHVsdzBEaXVxaUhQZTV2b3Nacm0zREhh?=
 =?utf-8?B?S3NXSTIraVVTaFdWeFdONkZ0bWh5dmVXejVSVTBKWG1QTnNMV2dRWitYeVZu?=
 =?utf-8?B?RFZCNlY2UENBWFdEenVUdDd6MlhSQXVRbFJ2cVlpak44eVJ6Y1Z0R1MrTEJs?=
 =?utf-8?B?R1E1eHNGTitpTHBNQ0tTOHRwbHlYNURwWDVXTWFSREVxS3lvVUtEUWE1OGdY?=
 =?utf-8?B?T1lVWGhseFprOS9ETk1TcEdXZzZJNkttanNOYk9rRkJyWkZrY2V2TWppKzhT?=
 =?utf-8?B?QWNoZkUwWkVVYkpma0F5MXBUSTNYc1lTdnRHaTJJK3RJOWcvZHpNV2F5VHpH?=
 =?utf-8?B?TWVDZkdzRXkzK2dTUk9VUHFQZFZEN1BtbFZNRTh1SFh5UXhDWTVzQnMwUldI?=
 =?utf-8?B?Y3ZuaERTaGNVRUVVNjRPREwweFhleldwM2lmTXdRbi9oZ2pxUDlIb09hZEx3?=
 =?utf-8?B?bzZsVCtPZ3Q5ZG5jOE9nVjlmejJkbFVHcWtDU2RxbmhFTU1JL25wL3RhdVRm?=
 =?utf-8?Q?/XNVW1CdbovoaNodlH5f8G65B?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9002126d-3952-4990-8359-08de39826605
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Dec 2025 13:28:55.5683 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PDQRwGBdzx9O50S3vmkFNimRhJXG7QJVqqYjhfrvtOZVrkHjgNvXJLUMpGtLiriE
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR12MB8492
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

On 12/12/25 14:20, Karol Wachowski wrote:
> Add missing drm_gem_object_put() call when drm_gem_object_lookup()
> successfully returns an object. This fixes a GEM object reference
> leak that can prevent driver modules from unloading when using
> prime buffers.
> 
> Fixes: 53096728b891 ("drm: Add DRM prime interface to reassign GEM handle")
> Signed-off-by: Karol Wachowski <karol.wachowski@linux.intel.com>

> ---
> Changes between v1 and v2:
>  - move setting ret value under if branch as suggested in review
>  - add Cc: stable 6.18+

Oh don't CC the stable list on the review mail directly, just add "CC: stable@vger.kernel.org # 6.18+" to the tags. Greg is going to complain about that :(

With that done Reviewed-by: Christian König <christian.koenig@amd.com> and please push to drm-misc-fixes.

If you don't have commit rights for drm-misc-fixes please ping me and I'm going to push that.

Thanks,
Christian.

> ---
>  drivers/gpu/drm/drm_gem.c | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_gem.c b/drivers/gpu/drm/drm_gem.c
> index ca1956608261..bcc08a6aebf8 100644
> --- a/drivers/gpu/drm/drm_gem.c
> +++ b/drivers/gpu/drm/drm_gem.c
> @@ -1010,8 +1010,10 @@ int drm_gem_change_handle_ioctl(struct drm_device *dev, void *data,
>  	if (!obj)
>  		return -ENOENT;
>  
> -	if (args->handle == args->new_handle)
> -		return 0;
> +	if (args->handle == args->new_handle) {
> +		ret = 0;
> +		goto out;
> +	}
>  
>  	mutex_lock(&file_priv->prime.lock);
>  
> @@ -1043,6 +1045,8 @@ int drm_gem_change_handle_ioctl(struct drm_device *dev, void *data,
>  
>  out_unlock:
>  	mutex_unlock(&file_priv->prime.lock);
> +out:
> +	drm_gem_object_put(obj);
>  
>  	return ret;
>  }

