Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CB73F9716DC
	for <lists+dri-devel@lfdr.de>; Mon,  9 Sep 2024 13:29:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4114D10E200;
	Mon,  9 Sep 2024 11:29:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="jWcuYoHX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2076.outbound.protection.outlook.com [40.107.244.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 56F9410E200;
 Mon,  9 Sep 2024 11:29:39 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EyjdJw8eJCsUqejPUSuswhseEH6Ve4eYxQlmZ3ruyC+6JIbmVP+JCUUki745S2jaf6I/0KdKP04MZV91Jy3VvQNU6wo00CzfkWI1zP5ppZnkQgTA6csoauzXp6RRetpHtFCFprOh6HZhqwEjyhkxIZx/WvQAUaYtIILGDtPLrpOvtExQteplRSAUMIMbJW89+OjH+2C4tg4j8nQmth+vpHKynX3Bp7/k4kT15LonZ20NNdDI6Gglyb1cfKFz0ft9nkuNnuItDvF8E96be++s+Bt44QUYP20qL3scBrLPRzYnyvCxdmIyDSd7vb1/qDIQoRM2CotP3q1TSWzdpUeHRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ENL1gst14kcAcAlCfRRTVmUsaq3ujbh1qgESY5wE4Uo=;
 b=f29FUx/32Vcx4n7T5kkd5asP2deO/xrrigNRYi7D5T391bYPyEYMZCt0yugWSOK+HhnCTwO1ZPU9W/SqGeYn03SNxtjLxu2wltbk2JXopnInne+l8tIBzL2p7cHtLnpTOcBoBuU3z09++Ud5L11pJvnnWrzP6GoDAApr4zHx3ixPifK6Iy7mkiCBd88wOqYQ+Tj6MBDEKA6+k+BY8ya/xJM0oxwX5bXVwPnzhmXMhbfivg2/BUD5Dvon1WE/aLRCM3H0GH4FMB6rvGKmeeUNQSeWdToh9AotMP70A5byLd3ndnomPfAZUuXLiTrFVo+O4xbTnHOJ/6p/2EP34Iat0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ENL1gst14kcAcAlCfRRTVmUsaq3ujbh1qgESY5wE4Uo=;
 b=jWcuYoHXZg7hpKMBjxiMTh7Tfd/NaLswpwgMqWrEfGDtOYHdACC+/pfJFavK9G50miulWCq6qssYciFfz064lqqOMU9RnZD9fj9rw26P4to1uJwe23sG+opF+XjSvAzn2rnPawyQDxalxhNesCdaMuUm57qRwlQ8B3gcODGBLfY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by SN7PR12MB7956.namprd12.prod.outlook.com (2603:10b6:806:328::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.17; Mon, 9 Sep
 2024 11:29:36 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%4]) with mapi id 15.20.7918.024; Mon, 9 Sep 2024
 11:29:36 +0000
Message-ID: <80e02cde-19e7-4fb6-a572-fb45a639a3b7@amd.com>
Date: Mon, 9 Sep 2024 13:29:27 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC 1/4] drm/sched: Add locking to drm_sched_entity_modify_sched
To: Philipp Stanner <pstanner@redhat.com>,
 Tvrtko Ursulin <tursulin@igalia.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Cc: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 Alex Deucher <alexander.deucher@amd.com>, Luben Tuikov
 <ltuikov89@gmail.com>, Matthew Brost <matthew.brost@intel.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 stable@vger.kernel.org
References: <20240906180618.12180-1-tursulin@igalia.com>
 <20240906180618.12180-2-tursulin@igalia.com>
 <8d763e5162ebc130a05da3cefbff148cdb6ce042.camel@redhat.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <8d763e5162ebc130a05da3cefbff148cdb6ce042.camel@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0148.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:98::6) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|SN7PR12MB7956:EE_
X-MS-Office365-Filtering-Correlation-Id: 615bb097-e54a-41ce-39bc-08dcd0c2af21
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?eE5ZcWV1eStDVEprYTNMYktabDY1cklWQ1pzZzU4WDlQcXhLM2FUQm5BQ1Ez?=
 =?utf-8?B?NHhYRE5XR2tMR0dOMFdMSzNsbG95WGVDVVRGb3F1eUt1ZTlmbTdka21kd3hN?=
 =?utf-8?B?bW4yc0V6ZVdWR1U2WmdJcjI4dG04YTllOUxMeUViUGFpSU9UREtwQ0VIMHI4?=
 =?utf-8?B?eVFzVzdqUEN0TXVqRUZKZ3kxNDVTOXhmc2xaZHdJS0hZdWUxRHoxMmswTDVo?=
 =?utf-8?B?b0dhVUsrdW1sMHp6TnNpa2ZlZ1BGYm94cWhtU1h1S3A3eGllZm1xZC9jOFJs?=
 =?utf-8?B?SjFZN2Z5cHRQQjVieE91UlA4T1VkZldtb1dWLzgvejA2aGFBSEQ5L1BpYUFC?=
 =?utf-8?B?cnZ3UStqUW03Ni9PK3ZEelp5SU9XV0dEM0ZlMUZOaFM2RXlNYkRzRU5UZ1JK?=
 =?utf-8?B?TDUrVzBrNnhXcHdmMTBiYVc0SXUxZEtaWjBIR2JnN25XaXBhUkZ3dTQxM3FP?=
 =?utf-8?B?c0VIWnBVQ3VNYWJKZkNUKzVNZWdkMVBsd0duZmV6NUJjdGw3U3JJaElkS1Ru?=
 =?utf-8?B?WkIrYWd1QlhYS1dFeTFKRnU1L005T0dMVTh5SzhUNVhtSjVzTXd5b1ZhSmRj?=
 =?utf-8?B?OEl1dUNKK0lpMW9OYnU5eWg2UFd3ZVBBR3RCYmQ1VERsMDZxQzdjWkFmZ3k5?=
 =?utf-8?B?SUduSC80NE1ISjEzMCtkc2s2eDlJeTUzUm1wWU9uQlRueThWb2UzRFhMWGZy?=
 =?utf-8?B?dHd3UHV4cnUxK09Qanhrd3FZd25LMythUnZrM1dDTkxmUCsrYjg3WDNacHRD?=
 =?utf-8?B?QUNJWTQxSDZSa2haL3NnTGs0Vi8yUHVpNHFjU0FGUUU3a0o2Nmk3ZkpnU0VB?=
 =?utf-8?B?RkJsWGhmWVZ2M0l4TzVkVkFrQzZQS0luVDhiQm9WdWFBVTNwTHRhS2JsWTB3?=
 =?utf-8?B?emFvSDNKYzY1ZDVIcWZFVXNUU2Z3R3YrczQ4NisvbjdVbTRud1FXWmlGYVR0?=
 =?utf-8?B?bzV0SVljUzlKaDNqaUMwcDdGMTM5TS9MQmlGVE1oRDNUeTRoS1lGc05ITE5o?=
 =?utf-8?B?RFBJZUZ6MEoydXhpWWl6K250YzE2Y3JxUlg1ZUR0L25mcWRBTjhWeEwzeEk4?=
 =?utf-8?B?YWJwbmJiUGZQekxEc3NQeUdRUDEwSlVyUzhQWmRzbmxhT2V5NTNpTzB3Z0JY?=
 =?utf-8?B?c2FiQzVtMmdYNUZhbjFYUHd6Y0VTdnBVWHpXSmpzcFVwQ0YzRTB4STBtVHRo?=
 =?utf-8?B?V3JlckVlUU1jdE9adFVoMGRrZ3BiTEgzZUZsTDZNV2I4Q3IrVllRSDZHTERv?=
 =?utf-8?B?N01SbVN0ZzZrWTV0MHhnWjZuZEZzRGFKTko3SnR6Rk9ITGNndjl2UWs5MWRy?=
 =?utf-8?B?YjM4blpGREhNMmZ3S2JUbmJtQmtGNzRCSmtUZGRpdkY5L0VGOXIyQkZaV29R?=
 =?utf-8?B?YTJBY01uWjlzTmQwVDlVYXhOeG5WcEJuK05rZ1REYTdyWTVzOWI0cEFndnpK?=
 =?utf-8?B?T0cxa21iTTVaUEpraG1lSzFRaXZTL2NaVGpON2krYncvMTd0WlJVRlZDY04x?=
 =?utf-8?B?WHJ6ZjhTQk1Oa0FpTjJTRGRTWXJraGhXNnV2RW9wMkVjc09wYUJFL0lnRXpo?=
 =?utf-8?B?Q2lEcmNOYVZjNXlZMnFmSG5pWU0waGZKb3ZnL1lUSDNYM3pvU2VzSlNLamM4?=
 =?utf-8?B?a3pqQUdWYjZOelNhU1FxbVo0YktLUmdrNDZONTkyMlBiUmxaN2t6aldNdUpT?=
 =?utf-8?B?L2VVdzdHVDJjSDR2NUNJT0FGTWNQYTdoZGdIMGRKV1NGNThyWkt6Tit5OWpC?=
 =?utf-8?B?bGRjOENtUHJUY3VNQ1hQK0hoSTdYQ3hwUkFSaGtEZFBqVWlNVmw5SEF5NGZ4?=
 =?utf-8?B?OGVnNXZhZGNUVk1LMXA0QT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(7416014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZFUvc0J2TUMzUzdMV1R0RUJIQjZJejlNRE92OE1SenBGY2JScGUzUGR6bENy?=
 =?utf-8?B?bmFBdEpHRUFEQmEva0h2dWZ2VDUwYm4wejlqTkpXSWh3YnNzMGRmcG5Ta2kw?=
 =?utf-8?B?Znl1N2lhR2Jpaks2d1ZZTFVSVkllaUE2Y3VWK3F3Yk1ORXJrc0FQTlBkSnBo?=
 =?utf-8?B?SjlBeG5LbTQyVzR0QlhaQnlidC9NQkY1d3dDNzZxTGwraUxJNTFtVXdUeDBX?=
 =?utf-8?B?eUoydEVNWFh1ZmY3Nm9Sa2FROTVERjNmRXBBS241ZWdEWmhVTmszZHUxNWNp?=
 =?utf-8?B?ZE5VRXhrNFZDWWFnWWY1ZHZ1TVZGMVBib1dtaUU2akpuaFNnVUt1YnBiM3g0?=
 =?utf-8?B?a0NDaXlyRDVYUjMzb1JkVk9EL3h6eXppQWlpNUtTdlFFUkhrZURFODcwU2Q1?=
 =?utf-8?B?elBOc2R5dFF6VENuUklhK1U2TW9hNjRMMmlpNTBiTzQ1UXJpRldBbk9XSnJO?=
 =?utf-8?B?b3MxQ2pSdWk3MUY5QStvcVdYWmFOVHpFdmRCSm1KZGJHRlcyOWN4NkRYQjBX?=
 =?utf-8?B?N1JKbFFRTGROeXd5WkZ1c3ZNdUhNWlQ0SElNTWNMSUlNR0lBT2pLTHNoSkJz?=
 =?utf-8?B?WjVJUU8vWmIvanRETEpubm1TM3RXUEdPeWpXWFhNTG5Zb0h6UGJsWkM0Z3Q0?=
 =?utf-8?B?amxjRHNHR3VEcWNzVmFwZnJhY2tLMEIyTDF1WVdycG50bkE3QjU0WVExeGZm?=
 =?utf-8?B?ek1QM1JHL0JHd0NMd2ordldmVlBKUzg3UWRZS3hGZ00wQUNKYzYzT1lXNUpV?=
 =?utf-8?B?Nno3dkdTYXdMcFhoRXRUZnd2RUVKQW1BTEVwamd6U05adzYzckxpOExia1Vm?=
 =?utf-8?B?Mm40Q1BMaC9wSVBzMHUzbVZsTG9HMFdWeE1PaGF2NitoOUFiNXBjUHdVRWt4?=
 =?utf-8?B?ekxTRHNrWmovcWVQWlppNlhKZ1JFOUE4TzhaaUQvUkV2b21iOEVpSVBpSEpG?=
 =?utf-8?B?WmRRYi9DVEhGMGZCM09GS3l4b3NzS0hRMC9rNjFrL1BVdTkwbGFGVGNNNmNS?=
 =?utf-8?B?ZHJ0dzhDSmFxV2JMWGY4U1p6NnVIZmQxQ09HK3NzZkllbndScGFwU0JsVnV4?=
 =?utf-8?B?TVZhcm5GUlo0WjUwVkJCU1AvN0xOWkpQRy84YXpqcFd2cnlhWkV5d3g0cHQz?=
 =?utf-8?B?NTY3dE9Ib09VYXhidjQ5RkE0bENhZTFEMmJxQUNXb2tmb1BPTkZEQVpaUnFY?=
 =?utf-8?B?NXRIb2Fpd2pEdHZEUnRzL1p3ZEdpTERpYzRlMDlLdUdUS1dCQzd3K0RmR040?=
 =?utf-8?B?bVJ6eTFPTnFIQUlyYjZFZHU2ZzlyY2hZeDFmWUlyUE5xSDVXSmZuek40WnNI?=
 =?utf-8?B?bExFNzZCYU5UU3BIS01EcWM2aUlqRUFPRnlTL1FWdS9XclBRWk1mOVE1ZmQr?=
 =?utf-8?B?SGhDVlZkVkw2N0lUMCszTXRNb1BteEFTMElPSmlRSzNDSk1zNTRoZEdBeDRB?=
 =?utf-8?B?VVRQd0ZxNGx4K2hRQlVFM09aSnQvYWFoVU5RYU9BZ1FhTW8rRVliajI4RFpp?=
 =?utf-8?B?dVk4ZjdkUzJVU1NMelhkYjdCZCt6WGVBNFpjMHpsY0svdi95SGYyNExhVS9m?=
 =?utf-8?B?b2gzYkxsM1VUWm1VNWhBdUZkYW4yYWJZbWZ0YXV0cmwzUFlrQkJQdnRjbUFj?=
 =?utf-8?B?RWhXUnhpQzRYbkFoZnljSjRXc1FOUFQzSlg4NlVKKzA4UkpLci8wdmROSnJX?=
 =?utf-8?B?UnNhb3ZQbVFzOTRzMUhxUzEvUk5QaWNsTG5wZjRXQnNGOVl1WE9yS2FOMDNy?=
 =?utf-8?B?MTJXTVpzbm9WaDFqUHZxd3R2bWpPYjRJa1Rac1U2VVpHMDZHSkM3d1g1K1VT?=
 =?utf-8?B?MGNBRnRIRzFmNE50bmFQcDVGTitKNUZ2QVYyUys5UEhHOS9tSHJQSENYMmth?=
 =?utf-8?B?cGpiYXFaR2EwZEJ3c096VU5ranJDWGNjb1pSL0EydlFTR1cvQjNjQUt3VVlQ?=
 =?utf-8?B?VGR3b3VrTCtsSWxvb2l1M3RhbTdmUVlNTUxOK0xlWFhEN0F3dmdpS2Q4QVR1?=
 =?utf-8?B?b0RmOGdIcEtvbFZ6WnFMc1VXbm5CQVk2UTlTQUlaRFJtcThvdURCYjc0N0kw?=
 =?utf-8?B?WEdVdExveHZmUmhhb0g0VmtyTW54cEk4V3AyVWZnTkNWWlppcGh2SDNhejZ1?=
 =?utf-8?Q?k0W8=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 615bb097-e54a-41ce-39bc-08dcd0c2af21
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Sep 2024 11:29:36.2861 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MXkuWrgtDLR5d0JelyNtQ8JeSAD2QKXpoHf2yM8FCkZ1zgOGna6Lx6mEAgUjfzJn
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7956
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

Am 09.09.24 um 11:44 schrieb Philipp Stanner:
> On Fri, 2024-09-06 at 19:06 +0100, Tvrtko Ursulin wrote:
>> From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
>>
>> Without the locking amdgpu currently can race
>> amdgpu_ctx_set_entity_priority() and drm_sched_job_arm(),
> I would explicitly say "amdgpu's amdgpu_ctx_set_entity_priority() races
> through drm_sched_entity_modify_sched() with drm_sched_job_arm()".
>
> The actual issue then seems to be drm_sched_job_arm() calling
> drm_sched_entity_select_rq(). I would mention that, too.
>
>
>> leading to the
>> latter accesing potentially inconsitent entity->sched_list and
>> entity->num_sched_list pair.
>>
>> The comment on drm_sched_entity_modify_sched() however says:
>>
>> """
>>   * Note that this must be called under the same common lock for
>> @entity as
>>   * drm_sched_job_arm() and drm_sched_entity_push_job(), or the driver
>> needs to
>>   * guarantee through some other means that this is never called while
>> new jobs
>>   * can be pushed to @entity.
>> """
>>
>> It is unclear if that is referring to this race or something else.
> That comment is indeed a bit awkward. Both drm_sched_entity_push_job()
> and drm_sched_job_arm() take rq_lock. But
> drm_sched_entity_modify_sched() doesn't.
>
> The comment was written in 981b04d968561. Interestingly, in
> drm_sched_entity_push_job(), this "common lock" is mentioned with the
> soft requirement word "should" and apparently is more about keeping
> sequence numbers in order when inserting.
>
> I tend to think that the issue discovered by you is unrelated to that
> comment. But if no one can make sense of the comment, should it maybe
> be removed? Confusing comment is arguably worse than no comment

Agree, we probably mixed up in 981b04d968561 that submission needs a 
common lock and that rq/priority needs to be protected by the rq_lock.

There is also the big FIXME in the drm_sched_entity documentation 
pointing out that this is most likely not implemented correctly.

I suggest to move the rq, priority and rq_lock fields together in the 
drm_sched_entity structure and document that rq_lock is protecting the two.

Then audit the code if all users of rq and priority actually hold the 
correct locks while reading and writing them.

Regards,
Christian.

>
> P.
>
>> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
>> Fixes: b37aced31eb0 ("drm/scheduler: implement a function to modify
>> sched list")
>> Cc: Christian König <christian.koenig@amd.com>
>> Cc: Alex Deucher <alexander.deucher@amd.com>
>> Cc: Luben Tuikov <ltuikov89@gmail.com>
>> Cc: Matthew Brost <matthew.brost@intel.com>
>> Cc: David Airlie <airlied@gmail.com>
>> Cc: Daniel Vetter <daniel@ffwll.ch>
>> Cc: dri-devel@lists.freedesktop.org
>> Cc: <stable@vger.kernel.org> # v5.7+
>> ---
>>   drivers/gpu/drm/scheduler/sched_entity.c | 2 ++
>>   1 file changed, 2 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/scheduler/sched_entity.c
>> b/drivers/gpu/drm/scheduler/sched_entity.c
>> index 58c8161289fe..ae8be30472cd 100644
>> --- a/drivers/gpu/drm/scheduler/sched_entity.c
>> +++ b/drivers/gpu/drm/scheduler/sched_entity.c
>> @@ -133,8 +133,10 @@ void drm_sched_entity_modify_sched(struct
>> drm_sched_entity *entity,
>>   {
>>   	WARN_ON(!num_sched_list || !sched_list);
>>   
>> +	spin_lock(&entity->rq_lock);
>>   	entity->sched_list = sched_list;
>>   	entity->num_sched_list = num_sched_list;
>> +	spin_unlock(&entity->rq_lock);
>>   }
>>   EXPORT_SYMBOL(drm_sched_entity_modify_sched);
>>   

