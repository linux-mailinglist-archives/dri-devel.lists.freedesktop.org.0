Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 00B44AF0CF8
	for <lists+dri-devel@lfdr.de>; Wed,  2 Jul 2025 09:49:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8FD1C10E079;
	Wed,  2 Jul 2025 07:48:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="43UEbdQX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2067.outbound.protection.outlook.com [40.107.220.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C4A310E079;
 Wed,  2 Jul 2025 07:48:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=umVlF77fZssT9M0CzyUV+GxfzT7hNM/MSiG/TG++UasTC+EggoRUQ8V+qKAc3Gc38TrxFxNx8LZJg4NGwqcCef19E1/t+fOJlGbJd6Uea4k8RC14eC6+NfnfgDGiscRAxa9OBqOeCEsP/PQI0mRcK0lXxD3CQUolWmta+XJl32d9IKyGf8g2+t1FnLO8bCepT/g/gmpOuAQmA9eZDpoWRdvcyCcPijDA+Z5ADuGGaNSp2kIMaDsC18OpkaQTOP1jWzupmy8FiHyBVga/6EROFhE/gOKfes2swTDjXG3eFjrlNhHVrJLrTUOFvemdxmvI5Du8iSzNhPM6Bp5qgcTKxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W/U8F0oOJWbG90xTe1aumRBaVXx+Br5cBuz7ajRVPlI=;
 b=cizgG+neAFS9nEvfkyP0MRAEfJqL250cY3D4MrJjw6spl0s3LjUDOlNLOwulpsFflus1NMfSPSDfDj4eNiadmznWamYTZIYx9xmwASYmhx3kCh+A9099B7aobWyFrhkqBzi1y9xf+vkkAIw+VFEbMc/Bj5qQMYLog10mhynm4cvKUnhUnZUEX7dNR/mYIZzCAEwCGNCD0eJnSBlmRlFD7xPGpq183yGRWKVhRuGhqE+NPBRrQO+ZPVXREcwysLQzbd8p2hfMPayx4FMKph4s8jjaglAr9Hq8m+eULFUno8dRGmmrg7GLub9Yv+SiNOszhchknlY7Qav2pX1GSjuw4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W/U8F0oOJWbG90xTe1aumRBaVXx+Br5cBuz7ajRVPlI=;
 b=43UEbdQXducTvbd8elkeTrzoRGPhdyoipFgUQl2RJeE0/Q7+wT+TlAJ5Lg4Dx+uoguGerPQd9d6kghyUavVzWk4E5151cGOfyQajsh0ZEEZ0NkLoGw7SgiKWGwfAHY/kSryWyTJWTM3+U13Arte+V6LO62+WyfA1KT/tOi1gRuE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by DS0PR12MB6631.namprd12.prod.outlook.com (2603:10b6:8:d1::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.20; Wed, 2 Jul
 2025 07:48:53 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%5]) with mapi id 15.20.8901.018; Wed, 2 Jul 2025
 07:48:52 +0000
Message-ID: <62ff22f5-f10d-4b32-aa04-eabb21935fdf@amd.com>
Date: Wed, 2 Jul 2025 09:48:47 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] drm/amdgpu: move GTT to SHM after eviction for
 hibernation
To: Samuel Zhang <guoqzhan@amd.com>,
 "Zhang, GuoQing (Sam)" <GuoQing.Zhang@amd.com>,
 "rafael@kernel.org" <rafael@kernel.org>,
 "len.brown@intel.com" <len.brown@intel.com>,
 "pavel@kernel.org" <pavel@kernel.org>,
 "Deucher, Alexander" <Alexander.Deucher@amd.com>,
 "Limonciello, Mario" <Mario.Limonciello@amd.com>,
 "Lazar, Lijo" <Lijo.Lazar@amd.com>
Cc: "Zhao, Victor" <Victor.Zhao@amd.com>, "Chang, HaiJun"
 <HaiJun.Chang@amd.com>, "Ma, Qing (Mark)" <Qing.Ma@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <20250630104116.3050306-1-guoqing.zhang@amd.com>
 <20250630104116.3050306-2-guoqing.zhang@amd.com>
 <ce04e266-6c3f-4256-aade-bafca8609ab3@amd.com>
 <DM4PR12MB5937FFB3E121E489A261785DE541A@DM4PR12MB5937.namprd12.prod.outlook.com>
 <ba843972-f564-4817-8651-b3b776c5f375@amd.com>
 <558ad3d6-7349-40f1-ba06-0fa46701b247@amd.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <558ad3d6-7349-40f1-ba06-0fa46701b247@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0082.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:cd::12) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|DS0PR12MB6631:EE_
X-MS-Office365-Filtering-Correlation-Id: 2176971e-2bbc-425c-7d3f-08ddb93ce34f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|921020;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NkZMQ0hUeDE3Qnc2dStkbjhKbFhpRkVkRFBuby9jVUdoRHhtOVpwTG5SOXIy?=
 =?utf-8?B?SCtEaDdycTgyMGp4NnV6dzBlQWw4RlQ5ZU1tWFpWT1V2SkJxVEJ2UXVubEhE?=
 =?utf-8?B?TEpvdHN6OHVDRlJzelBRREgwOU1pQ05aTlB5UFh3dUdWckFTNm1DQkhaTnZU?=
 =?utf-8?B?ZEJQaUxxVHJVc1oxVUpaNzEycUwwcnFDS1l6TkdNRFVGQ2VlSjFlQXJTQmRL?=
 =?utf-8?B?eHNOQ0VrQXdQMHVlcm1CMC9wMFpBQXhzT1hDU3VaRndEOW9VVHowSW1ZaFUr?=
 =?utf-8?B?bnFDWldYUW9lcXkrUEU1M2MxTVllTWswWEUrNmpqK09IWFVLUWtva0NXZUI5?=
 =?utf-8?B?RSs1cVhROTVrSUs5MDdGMEhYSUdla1RhcHpUb1ErazNKd2pIRURid2c3ZTVo?=
 =?utf-8?B?UVFGT29qVmg2WWNNZEJEam1vSnpaMDAvZWs1cWVCQmlWc3M3ZXZGQmVSazNx?=
 =?utf-8?B?NlRWZFg2eFZpM05QS0thR3YyczEzclQ2R003SGhOb2xJWnJHNzN3UlpFSm4v?=
 =?utf-8?B?RVZZOHpjTnB5VldPQVB0ZlljRUdnY1RpMXRldWdROWtiTkh4dzk1TU44S3N0?=
 =?utf-8?B?Q01ibXFGMUVWRnVjMFlGV3VvSk9QT1BWbzlOcnlJS1VWeWJjNDFYMC9KVVFk?=
 =?utf-8?B?ekEvVXNFMzNsWUQ2RFRYeGRqVmhmNWZmK2NzdjhZV1JiS1NMRm5oRmtYeTF1?=
 =?utf-8?B?Q2d6dy9IenBNeUo4ci9BN2pSTEtrejRSLzUwcEl6enJ2c3hIOHpSdGJHcXBW?=
 =?utf-8?B?RjJYUHN4RlhuZmxSTG5aa0lUOXBjWjBHeFVVYjVhbDZnaExEaEVXNktJT04z?=
 =?utf-8?B?TUY3REcyWlRrQ09oM0ZMcWhwcEtxN2pXb0dqVlhpWWMvRE5JT0ZXUEZLbGdZ?=
 =?utf-8?B?RFlIWUlhMW0wMkt4MkFkdFFPUHRRdWI5d2RZc3AwS0E1MzZQbUJyUWJQZllv?=
 =?utf-8?B?QUdmMjl1WDJSbUNSVzdvV0Z2SXo5QmxSMTFBSzErM3hzVTBnTWo2SzQvK2VT?=
 =?utf-8?B?UTVtTkJ6cEs1RXhBeUxHOEJWT0wrY1pCSElIeFlxazh0bGNBdm9hcVVTUFA0?=
 =?utf-8?B?dHFVWHRoVm5IM216WlE1RHFXOXF6eDhZYWNQMTNVQVpsejhMU1JlaVllQU9v?=
 =?utf-8?B?cnZ4Z21MWStQZ1oxc1ZFWjdMbnhnUDVaVlVBNFdEV1Z3c1ZTb2pGb2lyanNK?=
 =?utf-8?B?STh1Zmh6UGNpNUtuc3dZdnhkQWxXUnlVK2NMYjZhMTFPYlJjSWltaUtUd0pz?=
 =?utf-8?B?dVFjQlgxVDViMG91QXE0bFVMWjM2SEN1S0ZQaU5zWklIY1IxQ3g2a1JVb25G?=
 =?utf-8?B?VzZhaTEybkNOS3VQZUxqR0o3TUkwQUJ6YzRSbE55RWxDT04zZDBJQkk3d0lv?=
 =?utf-8?B?QVloeEVidHEyWGZVRkRqWGF1MWluVlExcXNlNVRzZHpIZjErQ1JTRmJSQm5h?=
 =?utf-8?B?UklyWWU5SlJ5SHd4NlUzSUdyTk1ZaDk3S2JydVdvM296aUNLT204NGFXMWo4?=
 =?utf-8?B?VDdHUU81VEtuR1hiY2ppQWUvRjF4ZHFZbUw0aXk2aGZLa2FZUW5RV0ZsdmNs?=
 =?utf-8?B?Y2JwNy9Ea2J3UWlkb1hUSmwzRERkNEtRUWtXbG8yemcvSVgyK0F5M2RsV0I5?=
 =?utf-8?B?bHh3anFvYjg0WE9sMnBkL1NpV3RJMFhqYzloU1BsQ21zeWQvN2x3UlFzb254?=
 =?utf-8?B?ZjMrMnA4U1ZubFRIL2dPK2YyQ3E1VnZMeWFHWW0vRmdQRE8zMWNYSURZZHc5?=
 =?utf-8?B?S3hHNUtFa2hiYmd0ZTRZQ0w2L3V1NlpOaVpadzJzZkh0dUNQN1RwVk1EN0d2?=
 =?utf-8?B?VkNyRnB3MFVTdVNIQlVqRVNNUmJpUDVpRlVEQ3VHbTNYd0VnOVBQbEprNFpL?=
 =?utf-8?B?bnk0T0QzKy8zMHY4VnZST2tGaCtPSmxyT2hIY0oxZ3BnaHFoUDNCSUlCLzdU?=
 =?utf-8?B?dDdmM3luUHpZVUp1QWZOcHdQT1REVVI4QmVLY1dkVzQvcFVRY2pyVGRiamcr?=
 =?utf-8?B?ZkNnS04wVTlnPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(921020); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Nk9DY05iM3RZQnFKM1AzUDMzYk9ESHBid3lrRkNTRzNsVnpneFk0Ylp4OFEw?=
 =?utf-8?B?TTBiRDY0bXpwV2VlKzFzNW5nRkhBNFBjL3k1eUVhR21oTmVXMkIrY0RrQTgw?=
 =?utf-8?B?cGRON2Ewd2t6T0pES1lvRE1BNjZ3WVRwazVoTjRoTEpNK0JScjh2N2c5K3Fp?=
 =?utf-8?B?UUNlbnJ4dEJiaXFzTUdyRDUyTjZOMk9yajJsMlo1QjFWV29jMGdaUms3aXo2?=
 =?utf-8?B?QWV5YnMwaW5Mcnd6V1cvbWdmVVhxVnRFc0NDSHpqVDdRdHcyd2tVTlozaDVn?=
 =?utf-8?B?Q1owd2JocGlXSkVnN0IvSnZaTVlxdFRHV2x3TzlSSFhnSEwzNE9Ea3ZaZ0c4?=
 =?utf-8?B?TWQ4eEpId0pzOUgrclhsaURwY0IzaTIzSDlscDdlREhjNkhGaVd6Z2p5RWNm?=
 =?utf-8?B?Vld6STJKK0V3Z2tTcnFlUXVGL3NTMjcxOFJMMVVwRHNMVzZFN1hqQUpLd2Fx?=
 =?utf-8?B?U01qbTlydDdjSUh3bzNXZ2xjQlpyTmhGeHJDdUtWLysyZVFPOCtCQnZ4VFo1?=
 =?utf-8?B?NWUzcVArUW9zMUE0NmF0V1pZOEwwc3FtMWRTenltcnNuZXcvV0FLMklFV2RC?=
 =?utf-8?B?TURxWll0WDNCTXZoa1RveVM3WVNIc0NiNkgyeFNVcjFBMjBYajM2Y3RHMXJX?=
 =?utf-8?B?TTQzUG5DL1F6MkgvcVc0WkRQMkxOakpsTUNjZkF5WWJZSENJUFZqbEtPQWdk?=
 =?utf-8?B?b3lId2grL0Fxd1NZKzNrZzU2R0w1aEFvMWhhRHlqSmJaaWdablFRcjNFLzZT?=
 =?utf-8?B?Y2VHUThuWitlUkJvaDYvQUwwT3cvbG51M2Y5NnhSSnZWV05GdEh3VGhPblRX?=
 =?utf-8?B?b3F1K1lINzRiLzF0azNkQklLd1dpRnY3RmQyRXRrYmRMUGVRMGZadXVzU3lY?=
 =?utf-8?B?K2pmSERJZk5QL05GTVlLbERNYjZ4aU93ZVR3cW0vR2ZBcUloT0lPeEdLb0hz?=
 =?utf-8?B?TS96MTBhUUZHdzhRcGwzVERMN0VMOWxlVlNhNVRMZjRvUktvSEE1a0IxaEZT?=
 =?utf-8?B?SVBmUThEYkpEYy82c1RraklnVmlsN2lEVzJ5emJacEJtS043dVlXMmxMc3pa?=
 =?utf-8?B?UEJmdGZZcFRlUjUxbkJIelU0NkdyTkRHSW1wKzBTOU14d0Y2VStsdGJrK3Ix?=
 =?utf-8?B?U014b1FUNGZ5VW1aVU9EcGV2RzF3TXVseW8wY1h6cGhzWjdMajFscUtwbnVw?=
 =?utf-8?B?NjltV1lkR2g0RmdkNTZ2aTl1OWU5elo4ZUM5dW9JWS9hWGMzY0hDNU5iREVR?=
 =?utf-8?B?YVNJSXY2MXhNMDd0WHBGY3JvcGVvRlBsdVVtZEwrckdod1FTSFdRNE5Eb1lW?=
 =?utf-8?B?UFZJQ0dHVlpZUkZqanZBR3dqWWRNSC9uS0xlSmt3VEIrOTBvOHZZcUJkZzJI?=
 =?utf-8?B?YThDdXlnZmN5a2dKZHlkNTAxRTBSWWtRdkEyUkpJUG85SkFGaU83WEZ3dHI0?=
 =?utf-8?B?QS9pL2FWWXRCUXc0UFJlTGp5MEdRczc0V3dOT2FuUFg3cG96RHh5QUp3c3cz?=
 =?utf-8?B?UjMzelNWcm9MOXZkWm02SEdEQTZMbEpWYnhBVkRzYU9naDBxSGZackFmSjFv?=
 =?utf-8?B?TVRPb3A2Mnd3YjBLaUJvSUw4WDRyaG5aN0JUNWxZd28vM01Zc1UzcjNEMHA1?=
 =?utf-8?B?azhabmtFdVM4TTJLN3IzM3dvcG5SNEk2dzZhTUpqdXlCNHJTM0UrSFA4dVpl?=
 =?utf-8?B?aW4wWDVuS1BQcXc2aVBVcklHWFV2Kzg5WnhCNDl4alpIOE5XQk5GYWg2d0Iy?=
 =?utf-8?B?TnlaSTArb0hXNElBbC8zVzZoU2JhWTdyL2JwMDRkZG5wL2ZJdkg1b05yeVRP?=
 =?utf-8?B?L0poZHMrUHBBMHVVU3I0bmNIWFhJemdXQ0s1NE9ZbTlhR0lZZTRMNXZpaGRq?=
 =?utf-8?B?YVl0N1JEV3d4MHJXWS9DOE11MENMWjE5d3pLbVZ3d3M3dEFQa3RnaE5mMm1I?=
 =?utf-8?B?ZEZ0ZC90TGNCS1JqOHFJMUZkeUJlazRMZytCL3VrM0hpWlFocTNpN3QwZlph?=
 =?utf-8?B?Vk9FZW5XeUQ2ME1rRDVEM2NYNjFtMFJHdHRpY21BKzNCWmRlT2QvdFdXSEov?=
 =?utf-8?B?eG1ZbkxQVWtsdzgrcmxKQWlUaURXd2ZnSEs5TGFCUlNlUVo3NEY1SkNjL0h3?=
 =?utf-8?Q?6GTwLvbjc1Yu465Z+tEEIeF9F?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2176971e-2bbc-425c-7d3f-08ddb93ce34f
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jul 2025 07:48:52.2267 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 930AvchIv9jj0AwxufH7zdDqXxbzPGxB2EbHwEegGOzBDomZfqUjTV8Ig/M5Iydr
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB6631
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

On 02.07.25 09:28, Samuel Zhang wrote:
> 
> On 2025/7/1 16:22, Christian König wrote:
>> On 01.07.25 10:18, Zhang, GuoQing (Sam) wrote:
>>> [AMD Official Use Only - AMD Internal Distribution Only]
>>>
>>>
>>> Hi Christian,
>>>
>>>  
>>> Thank you for the feedback.
>>>
>>>  
>>> For “return ret < 0 ? ret : 0;”, it is equivalent to “return ret;” since ret is always <= 0 after the loop.
>> No it isn't.
>>
>> ttm_global_swapout() returns the number of pages swapped out and only a negative error code if something went wrong.
> 
> 
> /**
>  * move GTT BOs to shmem for hibernation.
>  *
>  * returns 0 on success, negative on failure.
>  */
> int ttm_device_prepare_hibernation(void)
> {
>     struct ttm_operation_ctx ctx = {
>         .interruptible = false,
>         .no_wait_gpu = false,
>         .force_alloc = true
>     };
>     int ret;
> 
>     do {
>         ret = ttm_global_swapout(&ctx, GFP_KERNEL);
>     } while (ret > 0);
>     return ret;
> }
> 
> This is the new code version.
> If ttm_global_swapout() return positive number, the while loop will continue to the next iteration.
> The while loop stops only when ttm_global_swapout() returns 0 or negative number. In both case, the new function can just return the ret.

Ok, now I at least got what you wanted to do. But that is not really what I had in mind and isn't really good coding style.

Please use ttm_device_swapout() instead of ttm_global_swapout(), apart from that we can probably keep it that way.

Regards,
Christian.

> 
> The ret values printed in the do while loop:
> [   53.745892] [TTM DEVICE] ttm_device_prepare_hibernation:164 ret 512
> [   53.950975] [TTM DEVICE] ttm_device_prepare_hibernation:164 ret 35840
> [   53.951713] [TTM DEVICE] ttm_device_prepare_hibernation:164 ret 9
> [   67.712196] [TTM DEVICE] ttm_device_prepare_hibernation:164 ret 2187264
> [   67.713726] [TTM DEVICE] ttm_device_prepare_hibernation:164 ret 512
> [   67.759212] [TTM DEVICE] ttm_device_prepare_hibernation:164 ret 32768
> [   67.761946] [TTM DEVICE] ttm_device_prepare_hibernation:164 ret 1024
> [   67.762685] [TTM DEVICE] ttm_device_prepare_hibernation:164 ret 85
> [   67.763518] [TTM DEVICE] ttm_device_prepare_hibernation:164 ret 175
> [   67.767318] [TTM DEVICE] ttm_device_prepare_hibernation:164 ret 2367
> [   67.767942] [TTM DEVICE] ttm_device_prepare_hibernation:164 ret 1
> [   67.768499] [TTM DEVICE] ttm_device_prepare_hibernation:164 ret 1
> [   67.769054] [TTM DEVICE] ttm_device_prepare_hibernation:164 ret 1
> ...
> [   67.783554] [TTM DEVICE] ttm_device_prepare_hibernation:164 ret 1
> [   67.785755] [TTM DEVICE] ttm_device_prepare_hibernation:164 ret 1
> [   67.788607] [TTM DEVICE] ttm_device_prepare_hibernation:164 ret 1
> [   67.789906] [TTM DEVICE] ttm_device_prepare_hibernation:164 ret 0
> 
> 
> Regards
> Sam
> 
> 
> 
>>
>> And it's probably not a good idea to return that from the new function.
>>
>> Regards,
>> Christian.
>>
>>>  
>>> For all other comments, I will revise the patch accordingly in v2.
>>>
>>>  
>>> Regards
>>>
>>> Sam
>>>
>>>  
>>>  
>>> *From: *Koenig, Christian <Christian.Koenig@amd.com>
>>> *Date: *Monday, June 30, 2025 at 19:54
>>> *To: *Zhang, GuoQing (Sam) <GuoQing.Zhang@amd.com>, rafael@kernel.org <rafael@kernel.org>, len.brown@intel.com <len.brown@intel.com>, pavel@kernel.org <pavel@kernel.org>, Deucher, Alexander <Alexander.Deucher@amd.com>, Limonciello, Mario <Mario.Limonciello@amd.com>, Lazar, Lijo <Lijo.Lazar@amd.com>
>>> *Cc: *Zhao, Victor <Victor.Zhao@amd.com>, Chang, HaiJun <HaiJun.Chang@amd.com>, Ma, Qing (Mark) <Qing.Ma@amd.com>, amd-gfx@lists.freedesktop.org <amd-gfx@lists.freedesktop.org>, dri-devel@lists.freedesktop.org <dri-devel@lists.freedesktop.org>, linux-pm@vger.kernel.org <linux-pm@vger.kernel.org>, linux-kernel@vger.kernel.org <linux-kernel@vger.kernel.org>
>>> *Subject: *Re: [PATCH 1/3] drm/amdgpu: move GTT to SHM after eviction for hibernation
>>>
>>> On 30.06.25 12:41, Samuel Zhang wrote:
>>>> When hibernate with data center dGPUs, huge number of VRAM BOs evicted
>>>> to GTT and takes too much system memory. This will cause hibernation
>>>> fail due to insufficient memory for creating the hibernation image.
>>>>
>>>> Move GTT BOs to shmem in KMD, then shmem to swap disk in kernel
>>>> hibernation code to make room for hibernation image.
>>> This should probably be two patches, one for TTM and then an amdgpu patch to forward the event.
>>>
>>>> Signed-off-by: Samuel Zhang <guoqing.zhang@amd.com>
>>>> ---
>>>>    drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c | 13 ++++++++++++-
>>>>    drivers/gpu/drm/ttm/ttm_resource.c      | 18 ++++++++++++++++++
>>>>    include/drm/ttm/ttm_resource.h          |  1 +
>>>>    3 files changed, 31 insertions(+), 1 deletion(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
>>>> index 4d57269c9ca8..5aede907a591 100644
>>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
>>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
>>>> @@ -2889,6 +2889,7 @@ int amdgpu_fill_buffer(struct amdgpu_bo *bo,
>>>>    int amdgpu_ttm_evict_resources(struct amdgpu_device *adev, int mem_type)
>>>>    {
>>>>          struct ttm_resource_manager *man;
>>>> +     int r;
>>>>             switch (mem_type) {
>>>>          case TTM_PL_VRAM:
>>>> @@ -2903,7 +2904,17 @@ int amdgpu_ttm_evict_resources(struct amdgpu_device *adev, int mem_type)
>>>>                  return -EINVAL;
>>>>          }
>>>>    -     return ttm_resource_manager_evict_all(&adev->mman.bdev, man);
>>>> +     r = ttm_resource_manager_evict_all(&adev->mman.bdev, man);
>>>> +     if (r) {
>>>> +             DRM_ERROR("Failed to evict memory type %d\n", mem_type);
>>>> +             return r;
>>>> +     }
>>>> +     if (adev->in_s4 && mem_type == TTM_PL_VRAM) {
>>>> +             r = ttm_resource_manager_swapout();
>>>> +             if (r)
>>>> +                     DRM_ERROR("Failed to swap out, %d\n", r);
>>>> +     }
>>>> +     return r;
>>>>    }
>>>>       #if defined(CONFIG_DEBUG_FS)
>>>> diff --git a/drivers/gpu/drm/ttm/ttm_resource.c b/drivers/gpu/drm/ttm/ttm_resource.c
>>>> index fd41b56e2c66..07b1f5a5afc2 100644
>>>> --- a/drivers/gpu/drm/ttm/ttm_resource.c
>>>> +++ b/drivers/gpu/drm/ttm/ttm_resource.c
>>>> @@ -534,6 +534,24 @@ void ttm_resource_manager_init(struct ttm_resource_manager *man,
>>>>    }
>>>>    EXPORT_SYMBOL(ttm_resource_manager_init);
>>>>    +int ttm_resource_manager_swapout(void)
>>> This needs documentation, better placement and a better name.
>>>
>>> First of all put it into ttm_device.c instead of the resource manager.
>>>
>>> Then call it something like ttm_device_prepare_hibernation or similar.
>>>
>>>
>>>> +{
>>>> +     struct ttm_operation_ctx ctx = {
>>>> +             .interruptible = false,
>>>> +             .no_wait_gpu = false,
>>>> +             .force_alloc = true
>>>> +     };
>>>> +     int ret;
>>>> +
>>>> +     while (true) {
>>> Make that:
>>>
>>> do {
>>>          ret = ...
>>> } while (ret > 0);
>>>
>>>> +             ret = ttm_global_swapout(&ctx, GFP_KERNEL);
>>>> +             if (ret <= 0)
>>>> +                     break;
>>>> +     }
>>>> +     return ret;
>>> It's rather pointless to return the number of swapped out pages.
>>>
>>> Make that "return ret < 0 ? ret : 0;
>>>
>>> Regards,
>>> Christian.
>>>
>>>> +}
>>>> +EXPORT_SYMBOL(ttm_resource_manager_swapout);
>>>> +
>>>>    /*
>>>>     * ttm_resource_manager_evict_all
>>>>     *
>>>> diff --git a/include/drm/ttm/ttm_resource.h b/include/drm/ttm/ttm_resource.h
>>>> index b873be9597e2..46181758068e 100644
>>>> --- a/include/drm/ttm/ttm_resource.h
>>>> +++ b/include/drm/ttm/ttm_resource.h
>>>> @@ -463,6 +463,7 @@ void ttm_resource_manager_init(struct ttm_resource_manager *man,
>>>>       int ttm_resource_manager_evict_all(struct ttm_device *bdev,
>>>>                                     struct ttm_resource_manager *man);
>>>> +int ttm_resource_manager_swapout(void);
>>>>       uint64_t ttm_resource_manager_usage(struct ttm_resource_manager *man);
>>>>    void ttm_resource_manager_debug(struct ttm_resource_manager *man,

