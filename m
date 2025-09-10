Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EA6DB52183
	for <lists+dri-devel@lfdr.de>; Wed, 10 Sep 2025 22:00:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D848510E059;
	Wed, 10 Sep 2025 20:00:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="5kfwHxBo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2040.outbound.protection.outlook.com [40.107.236.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2755F10E059;
 Wed, 10 Sep 2025 20:00:18 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LEk1OQeoIxCBEn5Ems7H+HVaWkE9eETkzxFhRteaJPtVOw9w37VnKg7PiOtkb4gZvu/BKx05xBb4FMKYDWgg5rsdKc62IRV0dnCWBYbSl6pCEZiwbmwW4IGNd1uKum5JCRzpN0O0g96KR+I493d24CKmX1Bu1RKWC3Cbu2dS2ubE+o+RXAwJs8Ium0LVzZleLcVcKq5TzxVA5fQ3DGpedCssU+foueSmFEHu/nWkv7zmGKPQIMY4SHPGh63Xer/GGIso7slzNplsMTvAE9HqckYw1aP3XlVT6fvwM09QEZ1+Rga3DoYYurttyCVO+GTftODdzfzgylxsX9TsHBnE1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N+xfqQLxN8aTTPF8Fk25lOF+2IJOClYNCnyt7UOadoQ=;
 b=Z9PJLkOvP3Ha+GlXnKj589jKeDqnwKL4YPEBi//jG2gg4MkpksBCiHZae5hnpF4wjGUBypLuIgpXvDJKVGnCEwPg+P08pRARKVk55LH7KaEMhFpONHDjm1lTH1mTPfPbuau4yRjo4dm8tlWEu93tJ2GFTQPGSBYezuJj7k2u2UZOYJ/ML3nWkivQu/HnucmLIe8y1xbQtkDkM5n05X9LiglRSIA8Qt4wPFf4SdvhGp3q18P0f4FW2q7IKbkGqDPbYF/UYqOMWizxJ6gpf0t9lbrhIHKL02tPuOpa+R6oLhzZcX5Z6lXlBrbcPe4bXC0pNl6W8aVPWpNW/OPw8AtSYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N+xfqQLxN8aTTPF8Fk25lOF+2IJOClYNCnyt7UOadoQ=;
 b=5kfwHxBo13UfUsUfRmxkd/NB+NEK2BgBq6tmBasC3RNe7iFqp2Ttu/6KznJlHfOtfK2W7wf4gD+o0zYfktiJaRxa8BfhRUrmJbqNncBNSjBo+hkWeGuisxJ7o+02Cpc+ULU/7H21ieHtpQgQKMBYwb9m6KyriKBw0bysPKX/ASU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CO6PR12MB5427.namprd12.prod.outlook.com (2603:10b6:5:358::13)
 by DS0PR12MB8816.namprd12.prod.outlook.com (2603:10b6:8:14f::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Wed, 10 Sep
 2025 20:00:15 +0000
Received: from CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::1c2f:5c82:2d9c:6062]) by CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::1c2f:5c82:2d9c:6062%4]) with mapi id 15.20.9073.026; Wed, 10 Sep 2025
 20:00:15 +0000
Message-ID: <abce4190-7f66-4f1d-8057-fada66322b74@amd.com>
Date: Wed, 10 Sep 2025 16:00:11 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 13/14] drm/amd/display: add drm_edid to dc_sink
To: Melissa Wen <mwen@igalia.com>, Alex Hung <alex.hung@amd.com>,
 Mario Limonciello <mario.limonciello@amd.com>,
 Rodrigo Siqueira <siqueira@igalia.com>, sunpeng.li@amd.com,
 alexander.deucher@amd.com, christian.koenig@amd.com, airlied@gmail.com,
 simona@ffwll.ch
Cc: Jani Nikula <jani.nikula@linux.intel.com>,
 Michel Daenzer <michel.daenzer@mailbox.org>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, kernel-dev@igalia.com
References: <20250618152216.948406-1-mwen@igalia.com>
 <20250618152216.948406-14-mwen@igalia.com>
Content-Language: en-US
From: Harry Wentland <harry.wentland@amd.com>
In-Reply-To: <20250618152216.948406-14-mwen@igalia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YQBP288CA0042.CANP288.PROD.OUTLOOK.COM
 (2603:10b6:c01:9d::25) To CO6PR12MB5427.namprd12.prod.outlook.com
 (2603:10b6:5:358::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR12MB5427:EE_|DS0PR12MB8816:EE_
X-MS-Office365-Filtering-Correlation-Id: df7e1255-20d7-483b-6432-08ddf0a4a8a9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?c3dEVGE1MUM5Qk9LZDZLTTJFNms4ek9SelFPcEVwaFhka20zbkVzYjhDVERx?=
 =?utf-8?B?U0d5YS9hZHFiK3Voc1NCbnB2disvSjArellaSzRNTXUxZ2ltbjFPaEtoZm8r?=
 =?utf-8?B?N3lyVy9KVVdOeGNUb3FqVzM3a285VC9DVCttZm54ZWQxTCtGaWR6Vk5tTUNy?=
 =?utf-8?B?RERoQU9qZ3FObzNGV3JzR2s0a2hTUGNSK2VPMVpidVlBOW5HVzcwWmZTZ3I0?=
 =?utf-8?B?eithVFJURnRGM3phbnFWUUdvc3EwYVNaUWNFR2h3UjlqQ1R5UHRzdm1VbFpN?=
 =?utf-8?B?dkRWSFE2T3dtUTF5YnNWK1BQRjMwaWxiR1gyYWtTOE5HWkUrNll5NnlHRHR2?=
 =?utf-8?B?U3Ixbkh2VysxMHV5U1Y0alhweldGdXZpVWZEUzhJSS8rMFkvZzBsNVNldS90?=
 =?utf-8?B?ZUN6Z1FlVTlhYVVBbnJKeXhkZUlPR2xRNXpKc0J1cHozdldyd1RPRFMxVGZS?=
 =?utf-8?B?bUUvMENMVGRKR2tSbGcyaXQ4cjBJeVcrL21DU2FGQkpKQjl6dEhjcWRVZFhF?=
 =?utf-8?B?blZkRHFvNTdNci9YWXd6TzBBeWM0eFZqMTNpRU42U21CZG5MbTZDYmM5dGlW?=
 =?utf-8?B?eko3R0xiMXJzSG12TXRmblNjWHh2NEFNcUIwUnZrZUFiK3dtcWpCT2hFTEQv?=
 =?utf-8?B?blRIZzZ6NklsamlmT0FoeHE1aWVhUzBNcFE1UlI4cG56dkRBZExFdTY1SWF0?=
 =?utf-8?B?Zk9MSm1vMTZlSHYzNlhZTXV0T2FJWmdtRk5BazlhYVJNRGNFQUp2RDVYK0tZ?=
 =?utf-8?B?UWJ5REpDNXpHWCthbWltdTB6NG5uSG0rTFl0OW9MbDNJVFdzTE5wWHE2RHVG?=
 =?utf-8?B?bVpuZkFXNmVXb1NQQnBTOTlxS0FvQmdNZG1HcjBXNElZcUNTbWJiRWh5aGxu?=
 =?utf-8?B?MlJiZ2RFUnlleU43OVJtKzY2ZHoveEhPQndrN3p0V0NoZHh4eDRtcEovVjNB?=
 =?utf-8?B?MnpaN3hpcHFNOWR6WlhySURWZDVLS0Nzd1NEOFNYRklSQjRSWHJhTzh5aXQr?=
 =?utf-8?B?MGo2NGFCdC93MDdZTGFwaW13TGVVS2Y5NUEzS1FmR1Z2MlJkK0c4eUNxdnBl?=
 =?utf-8?B?WHRpSlVJaktCS0o3YVJINXlFZlQwZTdUTWpGbndHdEFMQ0s2LzByZTJETENK?=
 =?utf-8?B?MWpyaytqaDZoWTN6TUtvczhwbVBNWXU5bGwrR1U0bXFmNDV3OU9FZ09mV29k?=
 =?utf-8?B?REU0a25PeERXeXk5YmxpM0Z1cEVYVlRyRHI0bmV2ekp2UGQxZysxMGxNRjNK?=
 =?utf-8?B?ZDdmVkcvUjVOYXJCT01pMjRPelRWRzJGQUZCZWJ3VHR2b3N6b3NFcGE4YVlP?=
 =?utf-8?B?MzFXemtJekdHNzNVODFZWmR0NVlGdGEyeVl3bllrVVlNWmk0Yis3YnNLeEk5?=
 =?utf-8?B?aldwY1RIVDZGc2o5MngrK3g1TjlaVkIrekRhUlV3MmxzQitrVmdkbTIxa2FF?=
 =?utf-8?B?eVR1TjJKdXl3dHdXVS9rT0Nqb0FvdzRvM0RvcGw3eW5zbkJ5WVU3ME1ybVA2?=
 =?utf-8?B?dTNET3JNTmFDTzBsMEY3MWFxZndZMlM1clZBOW1vb0I2UWF6N0hRa3l3amNG?=
 =?utf-8?B?bmh2VlordmJmYmF3anFSQjdWcWlPQnBqTWFoemxvdEdPTlhCQmlzNUV6K1RW?=
 =?utf-8?B?ZHJxaW5YVmRoT1JINHc5cXBLcXJ5ajJKSEg5Zjd3WTFTSGxJZlFOSnlXNWZy?=
 =?utf-8?B?Mmo1dWtSOFIrQi9ZZk54UTFPbVFqYW1BVkZydk96R01ZNC9WbU1UcEE3SVgy?=
 =?utf-8?B?aW0raGdCcE9GOERYUExId2RJcUJyT0JuV0h1QTI4RTd5SlR0N3Q0emc2eWJG?=
 =?utf-8?B?TGdDUWFtTlRvaVRyTW5sUlZocnBxSHJSQ2RvaWpzblg5c3hxYmJtaHhjY050?=
 =?utf-8?B?ZWo3aU4wcXM5aytXa0Ewc21iUzJUNjFSZTZOZVdPZm5sN25MVCtOVG5PeGN6?=
 =?utf-8?Q?LztQNjyhdBo=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR12MB5427.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aFFHRlozY1hQL3N3b0J0cnNtcldlQ3dtamp0Mi9DUTM3YVVwd3hmbUQyR1lJ?=
 =?utf-8?B?NzZncllhRUhCTVN5aFVVL3NHYTBETDJMclVQcDRFbnBzMjJwNUpDdi9NWTNi?=
 =?utf-8?B?dVNwRTJtbkYyQUFQLzB1TEtpTWZVOS9xVnhJTkhGb3NUcVdlNS80OU96bk9J?=
 =?utf-8?B?RlVlZi95WEo1Sy9pUldHT29MbXJkTDFSbTBySWpnaWRocE5GK3FTenVQbW4y?=
 =?utf-8?B?RWFUTVFZOEowTXVVcDlRYlBrd0tyRG0zcExpSUtzUHlBd25NdUkyd3Z5ZTgw?=
 =?utf-8?B?Mjk5clBtV0sxdjh2cWdvM1pSN3k4K2NiTCt0YllIZ3RiQ25iL0JwWUN2RE5B?=
 =?utf-8?B?ZkVXclVlZDJFRWFtZk1wUXNPeEFpOWVlL2duUzRmT0l6T0E5emJVODJGRkoz?=
 =?utf-8?B?TVR2c1JTalN5QTJzckFLWGZjR3RVTlpENlI0dWQrZzlRWUpqVVRTbFJTYzBp?=
 =?utf-8?B?eHhYN0R5VjhQRjRRby94NjNjaENtOEZRZm95bzEvR1BqWG82VHN4RUY1OVZ3?=
 =?utf-8?B?d0hsVmNOK1pMTXRrSjh5V3ExdVhsVytjY2E3UGgweSs0RzNJbzJTNW5DSENC?=
 =?utf-8?B?bmFpdGUyMVZHVElVYmNIVThNemJLTUwzS1IxaTVtb2xnd3UvNXZrd1YrSmp2?=
 =?utf-8?B?WmpMdEpaYkdONkxGWFVWUERqSXFXU0kyRCt2SkhOK2RPNGNTMzg4V0FrUnl6?=
 =?utf-8?B?NGh2NFRCZ3ZiTHpONThQcVJSeEptUDZYL2dYTTVtSnJ0WHRubnZFbVBVb3N1?=
 =?utf-8?B?YlNCZWlFMmh6TEJlcVY1a0prNFh2LzV3eXhlZUhrOCtDLzY3eXZ1eXFJZldt?=
 =?utf-8?B?SjVLMzFkWkcrZWxYUmpwVUd5WUZCL3BrQTlHbEVXVWkzVVBkYVBVU2NwNWcw?=
 =?utf-8?B?aDFRcm1SMVNOa3ZOMmtsWEU5ckpsbU1KYkQyRlhoUFhQaVIrR0M5dnZKOHRz?=
 =?utf-8?B?bnpaM3lVR1c2bm9USFNYWEZUTllaeURNWElkNFRxSVRhVi82R3BNZjBsY2Vp?=
 =?utf-8?B?c1N4Vk9VTlhROTBzRjBtdDM3djcrblhwT3pKQjhBdllKOUcwcjFLSS83T1Yy?=
 =?utf-8?B?aWV3QW5BREJhcXE1bmtiZ0Q1c04wRDdMd2Ywb1drcnJNbjFrVWVtL1lYRnZr?=
 =?utf-8?B?eWg0cjFiUGJXdEFaaFNWM1hWN21pMUdJR0ViM1VJQTN5MjhHdUttT2R5VFRo?=
 =?utf-8?B?ODR4bUtSdkIzNWNRRzRkNk5VL0JWMEJzYjM5UDBxcHpXYlhock9MZ0MvdXRl?=
 =?utf-8?B?N3QyVURodW9mS0RUZXVOVEtnZGxPdC8vR2ZrL1hnZ0FNNkR2TEtWQlVKYmln?=
 =?utf-8?B?Um4rTUpuaTRsWTNiRGlRSm4yZlNDZDJjd3lWcXN6d3hUb3dMeTM3REtxekp3?=
 =?utf-8?B?dVp4YWp0NGUvMEFRdXQvZ0lLRWdFam03R2J4alFMczlJZUdMR3hXOG9qOWhW?=
 =?utf-8?B?eDBBcDc5RWRyYjJUWnoxVDlRdDlsUVlnSVBPS3ZRUm1HbFZxcHNac1FOYWtt?=
 =?utf-8?B?K25DdGlRRU1WbHNYT3ZMUDY3YlAzd0tOMHJyYlZNZHNGdGJ2RlhEODNHRnFu?=
 =?utf-8?B?WnE3NEUxSFRaeEJ0bXNSUHQ2Mmt1YXcyQ1kwS0Q5d1FCd3dwWGpXczE2ZCtk?=
 =?utf-8?B?Q1o5YUpoMnIzMUUyMXJ0Q0E3dTY0Yk1zeFcyNXYxWlR4cXpzTTVyUk1hYlht?=
 =?utf-8?B?UHp3UVI0SGtLZ0tjT3htVFVqbm1pNW1PN1l3M2FyN25lVEJ3T1lKbXZFUHpM?=
 =?utf-8?B?bDJRMUpNblVoeHIzRmwrV1AwdkVVbE9vTE04ZGdNNWg3T1g1aE9Zc0JGWTR3?=
 =?utf-8?B?cE5sdjJMZFIrL0hiT2VwRVM0Y2dNdEt5aGFZcS9CRXFxWlZCS2wrOFBpMEUw?=
 =?utf-8?B?dit2QTBDWnF0MjduaENjVnk4aHBHSWxVMUk1dDhlMnBZbWpSaSswYU1Ma2tk?=
 =?utf-8?B?ZElnb2tDWGVBOFljdWw1V0FDc1lCbXQ0QzM2MS9IV21FSUFuZmRBcTRjcTcy?=
 =?utf-8?B?Q1J4dTBwcnNsNzJOTmE0SG40ZjAwMWFXdUhkV0w4c2V1ak1YcENFV25aNGJZ?=
 =?utf-8?B?SUpXT2tLSzlhUjRYRVVaWm8reHNKTnFtY1o5OGI5SG9YbFlOa2MyN1NJMXEz?=
 =?utf-8?Q?nKpU9YGPJBVZZugKQxdy2HNeI?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: df7e1255-20d7-483b-6432-08ddf0a4a8a9
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5427.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2025 20:00:15.3543 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: h8fes8dJm16rcMdeSBiwySU+z4ecUnXpbT+xKQHqdn98dlO3kVxHzJhPwrd5zOlIn8iSj3xEbpEVBzq/sQZEBA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8816
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



On 2025-06-18 11:19, Melissa Wen wrote:
> Add Linux opaque object to dc_sink for storing EDID data cross driver,
> drm_edid. Also include the Linux call to free this object, the
> drm_edid_free()
> 
> Signed-off-by: Melissa Wen <mwen@igalia.com>
> 
> ---
> 
> v3:
> - remove uneccessary include (jani)
> 
> v5:
> - fix comment (Mario)
> ---
>  drivers/gpu/drm/amd/display/amdgpu_dm/dc_edid.c | 6 ++++++
>  drivers/gpu/drm/amd/display/amdgpu_dm/dc_edid.h | 1 +
>  drivers/gpu/drm/amd/display/dc/core/dc_sink.c   | 3 +++
>  drivers/gpu/drm/amd/display/dc/dc.h             | 1 +
>  4 files changed, 11 insertions(+)
> 
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/dc_edid.c b/drivers/gpu/drm/amd/display/amdgpu_dm/dc_edid.c
> index b4ccc111fa08..493815829aa5 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/dc_edid.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/dc_edid.c
> @@ -1,6 +1,7 @@
>  // SPDX-License-Identifier: MIT
>  #include "dc.h"
>  #include "dc_edid.h"
> +#include <drm/drm_edid.h>
>  
>  bool dc_edid_is_same_edid(struct dc_sink *prev_sink,
>  			  struct dc_sink *current_sink)
> @@ -25,3 +26,8 @@ void dc_edid_copy_edid_to_dc(struct dc_sink *dc_sink,
>  	memmove(dc_sink->dc_edid.raw_edid, edid, len);
>  	dc_sink->dc_edid.length = len;
>  }
> +
> +void dc_edid_sink_edid_free(struct dc_sink *sink)
> +{
> +	drm_edid_free(sink->drm_edid);
> +}
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/dc_edid.h b/drivers/gpu/drm/amd/display/amdgpu_dm/dc_edid.h
> index f42cd5bbc730..2c76768be459 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/dc_edid.h
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/dc_edid.h
> @@ -9,5 +9,6 @@ bool dc_edid_is_same_edid(struct dc_sink *prev_sink,
>  			  struct dc_sink *current_sink);
>  void dc_edid_copy_edid_to_dc(struct dc_sink *dc_sink,
>  			     const void *edid, int len);
> +void dc_edid_sink_edid_free(struct dc_sink *sink);
>  
>  #endif /* __DC_EDID_H__ */
> diff --git a/drivers/gpu/drm/amd/display/dc/core/dc_sink.c b/drivers/gpu/drm/amd/display/dc/core/dc_sink.c
> index 455fa5dd1420..3774a3245506 100644
> --- a/drivers/gpu/drm/amd/display/dc/core/dc_sink.c
> +++ b/drivers/gpu/drm/amd/display/dc/core/dc_sink.c
> @@ -26,6 +26,7 @@
>  #include "dm_services.h"
>  #include "dm_helpers.h"
>  #include "core_types.h"
> +#include "dc_edid.h"
>  
>  /*******************************************************************************
>   * Private functions
> @@ -65,6 +66,8 @@ void dc_sink_retain(struct dc_sink *sink)
>  static void dc_sink_free(struct kref *kref)
>  {
>  	struct dc_sink *sink = container_of(kref, struct dc_sink, refcount);
> +
> +	dc_edid_sink_edid_free(sink);
>  	kfree(sink->dc_container_id);
>  	kfree(sink);
>  }
> diff --git a/drivers/gpu/drm/amd/display/dc/dc.h b/drivers/gpu/drm/amd/display/dc/dc.h
> index 86feef038de6..63526b539bd3 100644
> --- a/drivers/gpu/drm/amd/display/dc/dc.h
> +++ b/drivers/gpu/drm/amd/display/dc/dc.h
> @@ -2466,6 +2466,7 @@ struct scdc_caps {
>  struct dc_sink {
>  	enum signal_type sink_signal;
>  	struct dc_edid dc_edid; /* raw edid */
> +	const struct drm_edid *drm_edid; /* Linux DRM EDID */

On second thought I think I can live with this. DC will
only ever treat this as an opaque pointer and never look
at the actual struct (or know the struct definition).

Harry

>  	struct dc_edid_caps edid_caps; /* parse display caps */
>  	struct dc_container_id *dc_container_id;
>  	uint32_t dongle_max_pix_clk;

