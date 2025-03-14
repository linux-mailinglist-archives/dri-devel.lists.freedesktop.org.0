Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 57F25A60958
	for <lists+dri-devel@lfdr.de>; Fri, 14 Mar 2025 07:55:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2570610E971;
	Fri, 14 Mar 2025 06:55:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="bxC0hTFe";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2078.outbound.protection.outlook.com [40.107.94.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8246C10E971
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Mar 2025 06:55:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hmm1moY1gEkt6d4Tgm1BgIQmbsJrJd+qIoDvNKi37uF9Xpu5akzeAdm3mEJaJveqxS7QTHXYJf/1ubqAXAy9nCUbOxf81GfkweyA+yr6XpIYKov5aqe2jVGht+eSmcbnz4LhXkADSM5Xa+aadwnSe9hzW3vtdvHoe1jivU9PDZVTMxYEbZwBtEGxk2Kpt4g64MihPdiOu6Cu9P31nJBdd4Vrpv/HqnFAytgXrFTukwlRy0rbqrDucBEppRRmrq6R+2ou20RuLpVTDwcrR4wkDc/aPnr3aSE7EBRRjuX5fkbNC+vOcJ5LVeVO+EAd0aChlpqNAu7Htpan93HtnYAJjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ztZ/38nIodEJCAZH1vYPdYqni2Hru7dGgnA1FSc7Iww=;
 b=Y/juUFUkN+2NQU2+Z3C9nOWYVwG3bQGe/katfzMAhnywxn0RzCYAlRZr0UG0W+3dF24qiC/hgIuTBqWXygXJmGIto4Zrxg/yTJ4VG+N5Oy4WEpQ+SKmtDoE7F1mxcrABhmm/eTY3+mC3qzP9xNzC0nfzJr+gF933nwmn7Op4E684F/Hw2hxOzEpROE1bsf31ipB6N9KeeylQHGAcn5o3Wg11Dyg+G81ukwv6ugcrLq7+MG+LFOervI0R5Cf5HcfRYrYc/82ZsOG2XhM+OXzyLvnxgOoKZ0v6iFh00fUveDZPjyduGTNaZNlDFlZnsoa9pKZ38wF0tIJq+Id9ZcAzng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ztZ/38nIodEJCAZH1vYPdYqni2Hru7dGgnA1FSc7Iww=;
 b=bxC0hTFeVU/dGr6I5g/WbKz0ww1e2r/4Mq6mfvsTJOMZ2StK1C414+ZZh4bZNhXDRJ9zd/48MbWlmpwAazsH0GgOY+YHPAlyhBuhav+amhBon41xTVUw+RFURZyX3PBrxwzIYTHnqOR0HFEN/o2LBpmnp4ofdRww2IlhsnwdfBU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by PH8PR12MB7230.namprd12.prod.outlook.com (2603:10b6:510:226::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.27; Fri, 14 Mar
 2025 06:55:24 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%5]) with mapi id 15.20.8511.026; Fri, 14 Mar 2025
 06:55:24 +0000
Message-ID: <738f554f-1ab3-4baa-84d1-91c76e508a53@amd.com>
Date: Fri, 14 Mar 2025 07:55:19 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/ttm/tests: fix incorrect assert in
 ttm_bo_unreserve_bulk()
To: Qasim Ijaz <qasdev00@gmail.com>, ray.huang@amd.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, thomas.hellstrom@linux.intel.com,
 Arunpravin.PaneerSelvam@amd.com, karolina.stolarek@intel.com,
 jeff.johnson@oss.qualcomm.com, bigeasy@linutronix.de
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20250313161424.10688-1-qasdev00@gmail.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20250313161424.10688-1-qasdev00@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0126.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:97::6) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|PH8PR12MB7230:EE_
X-MS-Office365-Filtering-Correlation-Id: f4d95a22-e1fc-44b4-b72d-08dd62c531c7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|7416014|7053199007|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VXRocnRwdWdNa3hBeE85TDRoRU5ESzc5ajJWWXhVZSttUmNWMHhCUE5lbFBy?=
 =?utf-8?B?OHNpbUV0VXJGekI4WUlGc2RHVjVOUkNGQ3JXaWxacWZ4Um9Pc2JHblUxclZ0?=
 =?utf-8?B?Unhkd0sxUTcwV3hTR25mNGxIeTNFUDgyMGFldmhtUnpPc0VOUk80Rms5aGVQ?=
 =?utf-8?B?RUxPaVJhZGFBOU9IejJFRXMyYmZqT1ZWbk9iREdWcEVRMkREL3MvaVpsRmFM?=
 =?utf-8?B?THpEVVRqbHc2OHBzWEx2blJDNTh0T25QQWZQOWZrbHo5SmNjdmYrcEUraWt2?=
 =?utf-8?B?R0Z0bXJQQUNyRDF3QkthNU9LNWh6cHdUdW5EcUZoOEIwaWhNN1QvL05nMFdP?=
 =?utf-8?B?YUJMS0NCZGxkS045Mng2N3NSaXVSSUZnamhPNDdhUDdXcEZ6dVhkU2Z2ZTlj?=
 =?utf-8?B?OERYTnkzV3JRK255aDA0VkcvQ2RoYlk0NXlpbmIrak9zbEtIUVNvU2hqZ2ZV?=
 =?utf-8?B?Vk9WVVdBOFJwZ3lwd0xXaW5JNGZkTUJpamhSeWFvcEFZd3c0djNrS2sxSFVz?=
 =?utf-8?B?RWZDVVBMOFRGWklXbE0zMjJCNlVMdHQyYUsrUGI4WXA0VFNEY2FWMDdYQUg0?=
 =?utf-8?B?WVBydTl6emJLZlhocHNJcnVhZ0NhTE5CRGFOL0MyTTVhaldBK3h2ZU0rQkVK?=
 =?utf-8?B?TGdabzd0THRFWjQxMEJSMEJucTNvM25SeUFLcW5YREJtM1llRmcvendReHNG?=
 =?utf-8?B?NVliZkxLTTgzRTJRbU5IOEhLWTR4TG45RGdPU1pNaTJwRkFLWDVDNWFDdXpr?=
 =?utf-8?B?Wm9GMEN3UmFITHhpVzlVcW9WbUswYmFad3hVUDVBOE4rUDNvdUFJZmxDQ2FV?=
 =?utf-8?B?NytKZDl0amxEZGFzK3drVUJnRnh5bU04VzFoeUh2NUh1ZHY4cmVZOFFsOFV4?=
 =?utf-8?B?MWJJYnpGSFdSOWRqU24zZVNSK0RzT0RTdlgxMUhUNm9wMTB3N2hLdy9NMG82?=
 =?utf-8?B?VWdwODdGc2lBSklpMTZxV3FUOEY0cXRVVmVqOW5jKzhTQTNsRnpMTGJqcVVG?=
 =?utf-8?B?eWNiZVFZdzBoTDZxK3ljVFdGTTJHVTRwbi82elVoR09hOTE4cURiWHhUb1dY?=
 =?utf-8?B?aldYNGIyT3FQZ0REWUN3cFhtWnhxQStGZFlNQlBGZWxEbitnK1pIVjdobmoy?=
 =?utf-8?B?cEN4U0FkZEprSkc1REw5YUpOVWZQdWRuWGd4eXZFRU9nM1BxOEhTajIraDM2?=
 =?utf-8?B?bjh2eStUZW1CQ3U3dkQxd2FmOEJLdFNmeElxaFdBamsvVVQyK2NJOFVWU3BF?=
 =?utf-8?B?RlF5S0FvRElWaWk5ZGl1MEVsS05zYnJuYjcvTS9SSFc3bjVrYWpOeUxzUkVr?=
 =?utf-8?B?ci9SQThwUU9yczFrdFc2aFhHaTdFWjdid2pMeXdaZEhLR1NTOW1CQWluaXVT?=
 =?utf-8?B?WXZ2aEY2M2l0c1I1MGYxaS9qQmdzMFNaYmdZQm92OUozcUh4Zkc1VjZKNUN6?=
 =?utf-8?B?Risrc0N3VnQ2ZDdhMVNBY3RLMTBvZkJJUkEzL3JsV3p6NWhFNTZvUWlTOGpT?=
 =?utf-8?B?Vks5VkRybXFXQWVUbjM5S2pXSWtmS1lhMEEzcXNBbW8wUlJDOUVoSlpaQWhp?=
 =?utf-8?B?RHZSK05EV0FPWEpFZ3hVWWd2a2VYTHk3aXk0UnpjT3hGZllXMWF2ZGVMcER2?=
 =?utf-8?B?bGN5d29YVmFFcDBhczdUcUhYWDh5cFRaclFyNlNwQnEySnNHZ0M2bVZsMEQw?=
 =?utf-8?B?ZmtsbkJlMGV1LzVwNGk5aTZHQk5UdXo1c0tUeHFoMk5XbGNqa1ljcW9NUzRs?=
 =?utf-8?B?KytlWjdoUHI3WFlVakZDMFhVRFAxbW04SzhiT285OTM3UFYvNzBVVHBBTTNw?=
 =?utf-8?B?SE5WSjNtSWVtcjEvSTBUMlc0RGNmMkNadWwrYyt6NFBEL2E3d3o3emc0VEJu?=
 =?utf-8?B?dmVVdEd4VjhwcVhNVVE4TFE3WU9JYkpValFMZ04vUC9kaTAxSGxBOEI0RTEv?=
 =?utf-8?Q?r5ZA/y5MPLw=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7416014)(7053199007)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?djdORkNsckxQd2laZC9DbzFGZ0o4c3VPeVdOc1dVdTNNcjl5MFdud2R2d2Nn?=
 =?utf-8?B?bTBHWHZVT0UrczViSms0Tzh4dFl2dnVvRWVVdWZDcWhYV0k0dE9VMWVWOWN5?=
 =?utf-8?B?OW9Ma3FCMHFQc09XaWFKSlY3a3FiZVNqOVd5aE1YOCtkWUozWXdyQSswN0k0?=
 =?utf-8?B?c0ozNlBRQWJ5YUFDS2Vyc2pyNGlEV1diUllrWlJUVWtpVnhpYWxOQVlBMFNl?=
 =?utf-8?B?MUxoOXFycHJ4YzZYN2tRYVZCMVdiQUh3ZmlqdFlxelpvYzYwcjhhWlR5SHZB?=
 =?utf-8?B?Mlk1UC93eS9zeVJOYVE1SFJOMkFNUWxFcC9yOC8rR3luT0ZjTTk3bjg0cXNp?=
 =?utf-8?B?SUIzU0s0ZENabU1iUENsR29ONGtOVnBQVERyNjhraFhiRk9RQ2RQL1ZMbUZX?=
 =?utf-8?B?UitvRXJMMEhPRzFUY2dLTDk2aUlOcTdFaW5DTVJlVDg4OE44MkRRZ2hla1g0?=
 =?utf-8?B?bzFWaGxEQ2lDK3RrTHZNa2Z2bVUxN3J3QXRGUmJ5RHJwWHk5RE1xZGFPUHpt?=
 =?utf-8?B?T0s2VWhoYlRrNE01RDdYeDlBbU0rUjZ4UW80cGpUR0JsNTdXR3JHWlZYMmx6?=
 =?utf-8?B?VVZtc2hRK2hBM0VaVUNXLzVpRzNZMERFNVpNOWdzejlGWnh1VHNFdjF4dHhQ?=
 =?utf-8?B?cWhYVFRoZjZOQm5KcVUwYUltWjFMRmV1WElPNFg1ZkFyVENNZk5lVStGOC91?=
 =?utf-8?B?M2ZQVldXWU42RFprNWVMWlQ0UjFGOXVaazFEMHVyQzN1VmRPQU5MbEgrVy9K?=
 =?utf-8?B?YThWV2VtaDJjNDVjdUE4OGlPUklUQzg4S3VGOEc2L29JTlNPWk1hUkxlSmx3?=
 =?utf-8?B?NWlFL2lHTnRBdllvYTVVSXRzeTVTaXBKa3FFR3Z1MHBWcXRhZUlxd3BNZzd3?=
 =?utf-8?B?YjJrb0wzVnc0U3c4TUl3VVJQc2w2c3BUajFsS1J2am16dWN5clVQeUREQWhF?=
 =?utf-8?B?UE5LazA0ZnFibUJubDIzZDNBSm11TUlEZUtDSDRHanYrYkczRUVKMjRzd2do?=
 =?utf-8?B?a1pjZVMzQWgxeHkxYzlXMXM1SjY5Z01zOUltcTZLa24xWkVJWUxXNmpYbW9N?=
 =?utf-8?B?d1FiV2FFN2picitaTExzWFNNL3RaQUhadzhHVDJydGIxTDVFZDArUk11YVNU?=
 =?utf-8?B?STAyZ1FKdW9iN3VsZkxrdVdUZmIzbUJZV3dBOVBoWVJQVWpFMDNsSnFHZzA1?=
 =?utf-8?B?WlZGZ0RiUFplbXgvN0JpQmhVcWw1SFhEVFFnYkF2YzB4UGhxN3ZET3pNRGQ2?=
 =?utf-8?B?U0ZtQnZaaVdxdWdVc2NnM3VMMUNFRk9rVW02Sm40NE1aQ1lmekFCWVpJSURq?=
 =?utf-8?B?TUZDclRKUjRlMUxCN0RhTzAyc3NYekV2cEpGS3ExcjFnaUlQd3FWMWMxeitr?=
 =?utf-8?B?NWc1aTBWQVZ5bktNSzNGY0RNNG1JNERHQWZSZnArb2E4dDZ2MDhocnZ2REdH?=
 =?utf-8?B?SEFDQXowdGl2YlJMUHN0MnJQTTlQaktTanYwaG5uNVRXMmgwL1dCTUx2RHFS?=
 =?utf-8?B?cFRJem4ySHh0K2YzejN4eS9zUkpVQzBNV3FqbEdVOXhJRXZYVnRnVFp3WWpy?=
 =?utf-8?B?QlZBWlFQZTg2QXhEeTQzZjFPYlJSVStXQ2RWWUh5Z3ZLQ1g2L1V5bWpjYnF1?=
 =?utf-8?B?N0xHcURkdENMOTYxV05IQU9YSVNqOHVZV0V5cU9zNVBYdUs0Y0dOT20waG9E?=
 =?utf-8?B?dzFDYUxaMThseHowTVNCWDZOdzhhSURKWDRkSzRmdlRiMXRzMzM2dUFBWjBY?=
 =?utf-8?B?NnpJSW42SkppQlJkZUVVUy9YWVQwKzNTUENWTnRLdVFNZ2wvOWVaNC83TU81?=
 =?utf-8?B?YmpYRWRObHUyQWhoMU1Tb08yTXhvQ1dRTDh5ZUFDK2E4NEticFFSb3lNS1Zy?=
 =?utf-8?B?cExDc0dNNEllS0UwcUh1RTZScVZ3bnlxWWo5TUxmbnZnbkNIaGY5QVBxcDU4?=
 =?utf-8?B?TEMrT0RDUnlRakJ0M0REMWRRRFZ1YngvckppSWpXMkEvQVY3Q1pqYlVRdUl0?=
 =?utf-8?B?Y2tzcmVVM3ZPbW9oWlZnZFZvMU9iV2hOOU96OUtnVE9LYnVPRUpTVDJLRUsy?=
 =?utf-8?B?aG9VRm11d045OHg2WGlpa3Q1bDFqNmV2U2NJS2NIZ202VWs2MG00aFdsQk1O?=
 =?utf-8?Q?lWHHDzAk3luHI//RbYcD5EzsN?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f4d95a22-e1fc-44b4-b72d-08dd62c531c7
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Mar 2025 06:55:24.2839 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VgRhRBZuHNLBN/ndxDT+IBoqk65rBeEPymhfh8MeA6E0kONQ422reTJvLB6rinbR
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB7230
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

Am 13.03.25 um 17:14 schrieb Qasim Ijaz:
> In the ttm_bo_unreserve_bulk() test function, resv is allocated using
> kunit_kzalloc(), but the subsequent assertion mistakenly verifies the
> ttm_dev pointer instead of the resv pointer.
>
> Fix the assertion to properly verify the resv pointer.
>
> Signed-off-by: Qasim Ijaz <qasdev00@gmail.com>

Reviewed and pushed.

Thanks,
Christian.

> ---
>  drivers/gpu/drm/ttm/tests/ttm_bo_test.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/ttm/tests/ttm_bo_test.c b/drivers/gpu/drm/ttm/tests/ttm_bo_test.c
> index f8f20d2f6174..e08e5a138420 100644
> --- a/drivers/gpu/drm/ttm/tests/ttm_bo_test.c
> +++ b/drivers/gpu/drm/ttm/tests/ttm_bo_test.c
> @@ -340,7 +340,7 @@ static void ttm_bo_unreserve_bulk(struct kunit *test)
>  	KUNIT_ASSERT_NOT_NULL(test, ttm_dev);
>  
>  	resv = kunit_kzalloc(test, sizeof(*resv), GFP_KERNEL);
> -	KUNIT_ASSERT_NOT_NULL(test, ttm_dev);
> +	KUNIT_ASSERT_NOT_NULL(test, resv);
>  
>  	err = ttm_device_kunit_init(priv, ttm_dev, false, false);
>  	KUNIT_ASSERT_EQ(test, err, 0);

