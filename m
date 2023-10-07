Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 641ED7BC35D
	for <lists+dri-devel@lfdr.de>; Sat,  7 Oct 2023 02:38:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5925E10E585;
	Sat,  7 Oct 2023 00:38:54 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2496B10E585;
 Sat,  7 Oct 2023 00:38:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1696639132; x=1728175132;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Or5yiw2+7L2EbwIuyu0YBHTK1JYA1eIzVFpJZX6aW7k=;
 b=fkXNOIlSzO4zCEydH3iZiWkx56fN4ow7zoz15NPhRVQk3YJp8ICk0DL8
 zW7qPsfsnoMytXJO0KVyd6uN5n6RolLF0k7bvfwKhkb7Pa70BSEMdWZtQ
 3WFM7XGk15ECmMHOAjBsfHwy7imVbm9AdypqtW6kemly8S7/U3kcQbtsf
 i5r1y2oKEi4UEps68AfWV6GBtYvStnS8lQaL52F0H3Qlw67aodaTLwKOu
 GIoYg+VBd1G7+qxs1QoIxPFfNaydvre32cyRi7HZ9vldaDorglq9mXtYh
 9XQYajEGa1s6gLR13w9DMXC5/yMux8zgWzJiZQdiz+EG9NKIOCWe0zNXr Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10855"; a="470133014"
X-IronPort-AV: E=Sophos;i="6.03,204,1694761200"; d="scan'208";a="470133014"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2023 17:38:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10855"; a="781832445"
X-IronPort-AV: E=Sophos;i="6.03,204,1694761200"; d="scan'208";a="781832445"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 06 Oct 2023 17:38:50 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Fri, 6 Oct 2023 17:38:49 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Fri, 6 Oct 2023 17:38:49 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.106)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Fri, 6 Oct 2023 17:38:49 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BNwMDR5j5caufOfJvTLdU70QGoDNRK6Lr7Kamc5ZynN+9XOYoGq6ggwfCzUvcKtorgds4UHqLBl9LRCAJ1Xp7jguJtK6+R8fv5beb3asRIWDY6ezzOCRvqbkEzVIubLgms3tHRML2HOXSsSG+NBelpPton6H9d1T2B7UD16/YdO7t0Pa/Q08GSoaiPOhptc9eEgqsLWoqWqY5LbgC5RG74MPxyoC1rxnWV0I+AoeMd2F6HRW9h4oy+kyLF1+pajygrpWVa3va6lumN4PN+HaXEBxF3qHOXJBxe5M2Pu6gomr7QJwL6KiILHzaE7U8ZRbre6MtKh80ZwtmTxQlLlviA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zRVKABMK5+dTmPResbaZ0jfwVD7z4RqZhZetX+evpq4=;
 b=gEAu7u5VBfjaxZVq7V7ikypnR+emBwWY/04mj4KmbDSpiL8gG9LVUYVgr6jKqdDP9H8DKEHvWuJx9W796XT7nayPojV9269QmwOMouBt8ywsb5iWEhgrXHweDz8H2CqCaC7AGBBbXeFb4ULU3mlIwO5j0M6d4ZbrTm/9u5ahNCtEYE6xHi3S8qc0irgAUPUlQgaVzHKMsSPXdDhgNnqGbPBMnLo6MUt5COfWTN0GKyxqdTBHvrsHM+1wgwGLlsynlHOOvqxRBv6N8o7ajot8bZurT1wa5FvisaTJikdq38+B6iXbQd8Mtk815Fa4fQAHiELDsUNPf/CxXmnwsdSatw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BY5PR11MB4274.namprd11.prod.outlook.com (2603:10b6:a03:1c1::23)
 by PH7PR11MB7552.namprd11.prod.outlook.com (2603:10b6:510:26a::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.25; Sat, 7 Oct
 2023 00:38:47 +0000
Received: from BY5PR11MB4274.namprd11.prod.outlook.com
 ([fe80::2d90:2991:354c:a720]) by BY5PR11MB4274.namprd11.prod.outlook.com
 ([fe80::2d90:2991:354c:a720%4]) with mapi id 15.20.6838.040; Sat, 7 Oct 2023
 00:38:47 +0000
Message-ID: <629195b0-c056-1826-2548-39a983637e3b@intel.com>
Date: Fri, 6 Oct 2023 17:38:45 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.15.1
Subject: Re: [Intel-gfx] [PATCH 3/4] drm/i915/guc: Add support for w/a KLVs
Content-Language: en-US
To: <John.C.Harrison@Intel.com>, <Intel-GFX@Lists.FreeDesktop.Org>
References: <20230915215537.220331-1-John.C.Harrison@Intel.com>
 <20230915215537.220331-4-John.C.Harrison@Intel.com>
From: "Belgaumkar, Vinay" <vinay.belgaumkar@intel.com>
In-Reply-To: <20230915215537.220331-4-John.C.Harrison@Intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BY5PR04CA0029.namprd04.prod.outlook.com
 (2603:10b6:a03:1d0::39) To BY5PR11MB4274.namprd11.prod.outlook.com
 (2603:10b6:a03:1c1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR11MB4274:EE_|PH7PR11MB7552:EE_
X-MS-Office365-Filtering-Correlation-Id: 06b768e2-80a4-4f67-cb5b-08dbc6cdc491
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: wQZgct66CCbhepzrnjzTNos3V8w+DwxAJuSLyX8BCGoja+BWWJ6491jKqKOHp6ypJgfxn6xmBbE7letteJeKSHMAY6+668BOAOpFUQ+4oqXrBqAekdzL3qzcmguC+VeoYXZSuY2b07U69L/9KgVPIt8ZywZ2U2EJ83+ZBwfPsmj7pHSzMG18ODP1wchFsk5CJACjaB2RKseP/NETbkh5scOozE4p3N7hoGKl8ZZsj7lh/VZNOoMnk8R1g/3cvIgoR3Om9wzYLOFcS3umySYWqpOWa2PkSgBoLrF19uxKZv7YNB3GERz+fZgvryXEWWJP0Q4ZRpy17/+TKQi7A2N76fXi16o5V6Bx7/FhkBKz2E83C/eFXw/2xwwdhLsLNMhfKnRu5rea99aMt7GLO9o3b/vMG4ps2xCji8bpGk+RZf4gJiFfgvu2l7EfpySVvM0g4AcbKIv0wl2uq6ORAW5W50Yc3KgcBtmkcoaWgkuYYN1QkUJvdOV1HarKdNrtz6EWvrgL2KKEnHOzUH6mBMfKH312bNJhqDcqyjm+pZ3Mxj5Mi2Sq1cuYAO3NwZ/B5enDDi8B/e/OJEBmqfcruDT6v9OPfyZ5pR8LRsyJdEm8Gaj5OQSGgw8PFLgXjsTaUiu9uPmZTcsGaspVnxH/wooOGw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB4274.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(346002)(136003)(376002)(396003)(366004)(230922051799003)(64100799003)(1800799009)(186009)(451199024)(2616005)(31686004)(2906002)(478600001)(4326008)(41300700001)(8936002)(5660300002)(8676002)(450100002)(36756003)(316002)(66946007)(82960400001)(83380400001)(6512007)(38100700002)(31696002)(6506007)(66476007)(86362001)(66556008)(26005)(6486002)(53546011)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZkhaUTBQM2FrTTErckx0WlgzVGs2L0ZrVUpnaWJZa2hjMWorWlFLWThwb25E?=
 =?utf-8?B?ZlkrSzhLSklhbVFNVVhpd2N1YlBuNGV1WVVYZjBLSCtBcHMrYlRtcUhjRjdM?=
 =?utf-8?B?VmlSMTNxakc4T0xQdU9nUGtScVpzNEw1eGJFemxiTmNSUzZxNHdSZkF6RSty?=
 =?utf-8?B?bDNNYU5mMnJvU0xsdklkakxhZk5LSkt1RSs1OGNhUlhBQWdUVjI0YzgzU2NF?=
 =?utf-8?B?eUJjdjFjODhFNlR4ZnZEUGNrUW1zeEs3UCthVnFVVGEwSVRuRllPRlhvbnlZ?=
 =?utf-8?B?UXJNTDhjb3Y5bE9TZ04wMytzU01aQ1J3a0dvT3ltbFl6TVlOZ0RlWEpJaTcv?=
 =?utf-8?B?NFRuV2ZpQ2liOVRERTJ5S3BDdGRZanJGdGEvT2QydFljMUc4TVVKSDE4dXJK?=
 =?utf-8?B?QUhrSktGeUdDZGRSbC9jWXZ5WXJZbkhkS3NVV1AyK2dBa1VzcXd1ODNRdVhw?=
 =?utf-8?B?STBhYkFDOWhOdEswbERmUTM5MG5jRWlGeENuODMrQlA0Q2xvR2NQNUpUaVpu?=
 =?utf-8?B?RDRzUGkzM2tTNmpOTGlaOVVzSzRpYlFSRm9yM252R3J4SklNWVJ2aGg1Y00w?=
 =?utf-8?B?Z2hzMmQyalRMaGVYd1pJUzVSVG1uejJZQ0xRNTJld2hrUW9pdStYbWtyWTdI?=
 =?utf-8?B?RUFHWnkzNmVlWFY5bzNxVytqOG1OUElwL0V3ckh6NkpSZVdqN3dsZklqVVlW?=
 =?utf-8?B?eUZoNXpkb0NydUYzaXBKRUFzbVNIWllIa25xS2YveDNQcTY1STVJdFJKcDJn?=
 =?utf-8?B?YWlkNk1scVV3UityRnR0WmhNOTNQMG00elEyYytVdWhvQWExOXJkK0E5WHRh?=
 =?utf-8?B?Q3BlVmw2b2MzREU3MkNnWnY3VVIyQU9VZkdBaTJWbDNlNmJoYi9PdXhlcHNP?=
 =?utf-8?B?T3N3UkpZSEcvTXlHMlkvUXhwRnppbmJCa1lod29Ha2wxRUhqSmVLOWcrdzdS?=
 =?utf-8?B?UFNHR2Y5amZnY2NaQ0loQlpqQ2FLdlBOY2Jtd1hoemxkWTlBMml6WWx4M2la?=
 =?utf-8?B?YnRaWjFodmdtVnVxRjgzWDF2UysvTmh6ZDY5Y3VLeW55SjVWU3dkWWZEYjdQ?=
 =?utf-8?B?Q0ZNTzBZbG1mMk1HWlQwMnlhczY2eXZtTloyaWZBanVZRFB1RmFraTRpd2ph?=
 =?utf-8?B?UFZkUmhtU01BYjkyZUdsTUVFRW5HalpFUUlWdU9qRjRCQVdRTTZUNkxRYTUy?=
 =?utf-8?B?UGFtaTJybVczS0FLS3kzOWNwR1pIV2ZkanA2eEExaVZRc2NlTC9ZZklERGU1?=
 =?utf-8?B?V0hGdkhmKzV5TTNTSFRudzlNdDZsZzIwSUJJODBTaUFpRmk3TWZ3c09Ca1JV?=
 =?utf-8?B?Ym1RZE9mcjRDNG9XWXU1N053R3d0R3pPcE5NNkRRejRLWEpCL1E2TFNicGFQ?=
 =?utf-8?B?NlF2SC94MlNrWW9nL1ROQjZERGE1Z1R3N3JHVzlLU2FuVjYzcHM5ZENkbFc1?=
 =?utf-8?B?NURsN0ptY2FwQy8zOTNkUVlQR1FQV0dPaFp6cFJBaHhjeW94OXNGc2R3a1Fw?=
 =?utf-8?B?WldxaVo4ZWRUUFdkMFdmRnNkcFE2azh3V0h4OFVBQ1JzWjdYaDcvb3JJZWlQ?=
 =?utf-8?B?WTc1WVFQMDdaQnFlaFJJUE9iZFhoZE1sQVRVbThxbks5QjYrSmIzZDlPaWp4?=
 =?utf-8?B?aXl4WDVwZ1dKRXBNSTJZdGhzeENhb2hsZlU4KzBEQmJqQmIxbFZ0bjRJN3Yx?=
 =?utf-8?B?ZXJ6R0tGeXNVaTJlL1pacVo5MmFmNlBvQXFDNXU5ZFhDN0VweDdmN3VjOGJh?=
 =?utf-8?B?M29qTEpqcmRvNGJUdmpUbVVYMU5rTlVqV05ZMGEvVkYvS3lwcmZpRjhtR2oy?=
 =?utf-8?B?b3UyNytyYmF2Q3dzeTRiMTFsZExBalpWYzN2QVpYRGorMkhzaFFhaDBiT0F0?=
 =?utf-8?B?ZHp3ZnA3ekNBbXZXR3ZidlZ0bUw3Rm8zOVZGSC9hZ1dtSUNZbzZjYkZPdk1h?=
 =?utf-8?B?M0xxOURFcHZwaFRtUkxXaUoxTDFnQ2c4Q1UvNmN0SytmSlhtb2c0eDVMU0NJ?=
 =?utf-8?B?NThLZUdBMDduQ1VSSW9qWmw3akV0UVJ6bHY0UTJUVmRUcEV6WGMvZnZzY3Zv?=
 =?utf-8?B?TnJDMkdIU2dia3FJbVJEZTVqUmRMWmprMmo4bTR0c01BWmtaZWk1blN5a3hY?=
 =?utf-8?B?R0FjdUhPbFp1QUJodlI0eWpGOWlLeWsxaGRtYVQ3ZWhUcVdHUGNJbXlrenV0?=
 =?utf-8?B?bFE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 06b768e2-80a4-4f67-cb5b-08dbc6cdc491
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB4274.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Oct 2023 00:38:47.2445 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1N1gmL6huZm+yFgVmdQPbF9koBcYU7GpQ029uvM/UEUWYge0FUbg4Gi+pU+4RuzSFIGqKY7Yg5dHV1Jmxi++JFfixJxeHra7/RhPT3a4Ur8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7552
X-OriginatorOrg: intel.com
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
Cc: DRI-Devel@Lists.FreeDesktop.Org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 9/15/2023 2:55 PM, John.C.Harrison@Intel.com wrote:
> From: John Harrison <John.C.Harrison@Intel.com>
>
> To prevent running out of bits, new w/a enable flags are being added
> via a KLV system instead of a 32 bit flags word.
>
> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
> ---
>   .../gpu/drm/i915/gt/uc/abi/guc_errors_abi.h   |  1 +
>   drivers/gpu/drm/i915/gt/uc/intel_guc.h        |  3 +
>   drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c    | 64 ++++++++++++++++++-
>   drivers/gpu/drm/i915/gt/uc/intel_guc_fw.c     |  6 ++
>   drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h   |  5 +-
>   5 files changed, 77 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/gt/uc/abi/guc_errors_abi.h b/drivers/gpu/drm/i915/gt/uc/abi/guc_errors_abi.h
> index dabeaf4f245f3..00d6402333f8e 100644
> --- a/drivers/gpu/drm/i915/gt/uc/abi/guc_errors_abi.h
> +++ b/drivers/gpu/drm/i915/gt/uc/abi/guc_errors_abi.h
> @@ -36,6 +36,7 @@ enum intel_guc_load_status {
>   	INTEL_GUC_LOAD_STATUS_INVALID_INIT_DATA_RANGE_START,
>   	INTEL_GUC_LOAD_STATUS_MPU_DATA_INVALID                 = 0x73,
>   	INTEL_GUC_LOAD_STATUS_INIT_MMIO_SAVE_RESTORE_INVALID   = 0x74,
> +	INTEL_GUC_LOAD_STATUS_KLV_WORKAROUND_INIT_ERROR        = 0x75,
>   	INTEL_GUC_LOAD_STATUS_INVALID_INIT_DATA_RANGE_END,
>   
>   	INTEL_GUC_LOAD_STATUS_READY                            = 0xF0,
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc.h b/drivers/gpu/drm/i915/gt/uc/intel_guc.h
> index 6c392bad29c19..3b1fc5f96306b 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc.h
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc.h
> @@ -186,6 +186,8 @@ struct intel_guc {
>   	struct guc_mmio_reg *ads_regset;
>   	/** @ads_golden_ctxt_size: size of the golden contexts in the ADS */
>   	u32 ads_golden_ctxt_size;
> +	/** @ads_waklv_size: size of workaround KLVs */
> +	u32 ads_waklv_size;
>   	/** @ads_capture_size: size of register lists in the ADS used for error capture */
>   	u32 ads_capture_size;
>   	/** @ads_engine_usage_size: size of engine usage in the ADS */
> @@ -295,6 +297,7 @@ struct intel_guc {
>   #define MAKE_GUC_VER(maj, min, pat)	(((maj) << 16) | ((min) << 8) | (pat))
>   #define MAKE_GUC_VER_STRUCT(ver)	MAKE_GUC_VER((ver).major, (ver).minor, (ver).patch)
>   #define GUC_SUBMIT_VER(guc)		MAKE_GUC_VER_STRUCT((guc)->submission_version)
> +#define GUC_FIRMWARE_VER(guc)		MAKE_GUC_VER_STRUCT((guc)->fw.file_selected.ver)
>   
>   static inline struct intel_guc *log_to_guc(struct intel_guc_log *log)
>   {
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c
> index 63724e17829a7..792910af3a481 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c
> @@ -46,6 +46,10 @@
>    *      +---------------------------------------+
>    *      | padding                               |
>    *      +---------------------------------------+ <== 4K aligned
> + *      | w/a KLVs                              |
> + *      +---------------------------------------+
> + *      | padding                               |
> + *      +---------------------------------------+ <== 4K aligned
>    *      | capture lists                         |
>    *      +---------------------------------------+
>    *      | padding                               |
> @@ -88,6 +92,11 @@ static u32 guc_ads_golden_ctxt_size(struct intel_guc *guc)
>   	return PAGE_ALIGN(guc->ads_golden_ctxt_size);
>   }
>   
> +static u32 guc_ads_waklv_size(struct intel_guc *guc)
> +{
> +	return PAGE_ALIGN(guc->ads_waklv_size);
> +}
> +
>   static u32 guc_ads_capture_size(struct intel_guc *guc)
>   {
>   	return PAGE_ALIGN(guc->ads_capture_size);
> @@ -113,7 +122,7 @@ static u32 guc_ads_golden_ctxt_offset(struct intel_guc *guc)
>   	return PAGE_ALIGN(offset);
>   }
>   
> -static u32 guc_ads_capture_offset(struct intel_guc *guc)
> +static u32 guc_ads_waklv_offset(struct intel_guc *guc)
>   {
>   	u32 offset;
>   
> @@ -123,6 +132,16 @@ static u32 guc_ads_capture_offset(struct intel_guc *guc)
>   	return PAGE_ALIGN(offset);
>   }
>   
> +static u32 guc_ads_capture_offset(struct intel_guc *guc)
> +{
> +	u32 offset;
> +
> +	offset = guc_ads_waklv_offset(guc) +
> +		 guc_ads_waklv_size(guc);
> +
> +	return PAGE_ALIGN(offset);
> +}
> +
>   static u32 guc_ads_private_data_offset(struct intel_guc *guc)
>   {
>   	u32 offset;
> @@ -791,6 +810,40 @@ guc_capture_prep_lists(struct intel_guc *guc)
>   	return PAGE_ALIGN(total_size);
>   }
>   
> +static void guc_waklv_init(struct intel_guc *guc)
> +{
> +	struct intel_gt *gt = guc_to_gt(guc);
> +	u32 offset, addr_ggtt, remain, size;
> +
> +	if (!intel_uc_uses_guc_submission(&gt->uc))
> +		return;
> +
> +	if (GUC_FIRMWARE_VER(guc) < MAKE_GUC_VER(70, 10, 0))
> +		return;
should this be <= ?
> +
> +	GEM_BUG_ON(iosys_map_is_null(&guc->ads_map));
> +	offset = guc_ads_waklv_offset(guc);
> +	remain = guc_ads_waklv_size(guc);
> +
> +	/* Add workarounds here */
> +
extra blank line?
> +	size = guc_ads_waklv_size(guc) - remain;

Hmm, am I missing something or remain is already set to 
guc_ads_walkv_size()?

Thanks,

Vinay.

> +	if (!size)
> +		return;
> +
> +	addr_ggtt = intel_guc_ggtt_offset(guc, guc->ads_vma) + offset;
> +
> +	ads_blob_write(guc, ads.wa_klv_addr_lo, addr_ggtt);
> +	ads_blob_write(guc, ads.wa_klv_addr_hi, 0);
> +	ads_blob_write(guc, ads.wa_klv_size, size);
> +}
> +
> +static int guc_prep_waklv(struct intel_guc *guc)
> +{
> +	/* Fudge something chunky for now: */
> +	return PAGE_SIZE;
> +}
> +
>   static void __guc_ads_init(struct intel_guc *guc)
>   {
>   	struct intel_gt *gt = guc_to_gt(guc);
> @@ -838,6 +891,9 @@ static void __guc_ads_init(struct intel_guc *guc)
>   	/* MMIO save/restore list */
>   	guc_mmio_reg_state_init(guc);
>   
> +	/* Workaround KLV list */
> +	guc_waklv_init(guc);
> +
>   	/* Private Data */
>   	ads_blob_write(guc, ads.private_data, base +
>   		       guc_ads_private_data_offset(guc));
> @@ -881,6 +937,12 @@ int intel_guc_ads_create(struct intel_guc *guc)
>   		return ret;
>   	guc->ads_capture_size = ret;
>   
> +	/* And don't forget the workaround KLVs: */
> +	ret = guc_prep_waklv(guc);
> +	if (ret < 0)
> +		return ret;
> +	guc->ads_waklv_size = ret;
> +
>   	/* Now the total size can be determined: */
>   	size = guc_ads_blob_size(guc);
>   
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_fw.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_fw.c
> index 0f79cb6585182..a54d58b9243b0 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_fw.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_fw.c
> @@ -115,6 +115,7 @@ static inline bool guc_load_done(struct intel_uncore *uncore, u32 *status, bool
>   	case INTEL_GUC_LOAD_STATUS_INIT_DATA_INVALID:
>   	case INTEL_GUC_LOAD_STATUS_MPU_DATA_INVALID:
>   	case INTEL_GUC_LOAD_STATUS_INIT_MMIO_SAVE_RESTORE_INVALID:
> +	case INTEL_GUC_LOAD_STATUS_KLV_WORKAROUND_INIT_ERROR:
>   		*success = false;
>   		return true;
>   	}
> @@ -241,6 +242,11 @@ static int guc_wait_ucode(struct intel_guc *guc)
>   			ret = -EPERM;
>   			break;
>   
> +		case INTEL_GUC_LOAD_STATUS_KLV_WORKAROUND_INIT_ERROR:
> +			guc_info(guc, "invalid w/a KLV entry\n");
> +			ret = -EINVAL;
> +			break;
> +
>   		case INTEL_GUC_LOAD_STATUS_HWCONFIG_START:
>   			guc_info(guc, "still extracting hwconfig table.\n");
>   			ret = -ETIMEDOUT;
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h b/drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h
> index f97af0168a66b..3266842d925e6 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h
> @@ -429,7 +429,10 @@ struct guc_ads {
>   	u32 capture_instance[GUC_CAPTURE_LIST_INDEX_MAX][GUC_MAX_ENGINE_CLASSES];
>   	u32 capture_class[GUC_CAPTURE_LIST_INDEX_MAX][GUC_MAX_ENGINE_CLASSES];
>   	u32 capture_global[GUC_CAPTURE_LIST_INDEX_MAX];
> -	u32 reserved[14];
> +	u32 wa_klv_addr_lo;
> +	u32 wa_klv_addr_hi;
> +	u32 wa_klv_size;
> +	u32 reserved[11];
>   } __packed;
>   
>   /* Engine usage stats */
