Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 33FA445F287
	for <lists+dri-devel@lfdr.de>; Fri, 26 Nov 2021 17:55:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 081366FA9F;
	Fri, 26 Nov 2021 16:55:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam08on2064.outbound.protection.outlook.com [40.107.101.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A2AD6FA9F;
 Fri, 26 Nov 2021 16:55:09 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=h6X92Fy4xPfTKYpDRrRWj9Tb9vopAfVRyZhtL8JjzVmLleCSIEXQgQuVopgZYkbsm5URkYEjRzaORm0YRXkaenejvAMKdLnEzAZGSNW74mEbT8+W24uEGOMzBNKy5e5HdMmacQDhqEN6GelMQalxbNmAbYKshMz639UPaZ93lvumPdTXseqoDaoLXTXYvYeIWAwaY8dWgud4KkbOk8ssYyRbtqzpd6s7ziiTOdy7m0HK3rJGOzUuxG3a6Drhe2/fXSab8Pjq2GaV4dTwzTzuc2QWPo0cTOYYER77++HWXVXn4ZgI5ZSW8MjX06l4ZErn+t24wnzFO9iZHnYmBc2RSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JlRbu2LcHFemgVvSUl6IK6BiMuROzqoCL/L/YUcEeCo=;
 b=OHf+TFYf0kGfeWBdoaFoUZ90OwVE6OnGPVOI56MUx3qrRzrXOLd7JB1HqJk2fOE+sI+I7dB3hgYb703XnqdiYWyr1IipE39E3JhPc/8opFmhrO55HyDiQ5peUYpn45hxvImraTv1pnR3Jjfzxao8CKeh3LLoiZBEMkYoZy7oKhtywDHuLXNlT8dqTawkAVKSoyUp28TFHzodHo5dIjuKABxULDbYcZ+oYBMghVRiqO9wquMkeBpfFlB1SOMVBnHd/05KpzeXNDfmt1MJJTx6ri/EkA4L40k9PEry6TtJwSoOUue1jW7Ujq8amVA2Pnt1LkmL77nt3hleZccYEyJ0YA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JlRbu2LcHFemgVvSUl6IK6BiMuROzqoCL/L/YUcEeCo=;
 b=Vdaq6hTHmCBTvGj8HigB7B4L1+BwF7zIRXVezT/lciiDUxwp3vs1vGoPze+SDyVzlqjWajdhpJznQozhjEQEEj+pjGWiBz3mFLuI5O06prTc2WK4tgaheSSBaIgTZSPfemr0+PkPm2l4ucOQt7E4GJPuJ+Cik+fZrsgdQRVSukM=
Authentication-Results: intel.com; dkim=none (message not signed)
 header.d=none;intel.com; dmarc=none action=none header.from=amd.com;
Received: from CO6PR12MB5427.namprd12.prod.outlook.com (2603:10b6:5:358::13)
 by MW5PR12MB5569.namprd12.prod.outlook.com (2603:10b6:303:196::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.14; Fri, 26 Nov
 2021 16:55:08 +0000
Received: from CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::e492:c86b:9906:1b46]) by CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::e492:c86b:9906:1b46%7]) with mapi id 15.20.4734.023; Fri, 26 Nov 2021
 16:55:08 +0000
Message-ID: <ab861932-4a49-6475-131d-46e3ab514cdb@amd.com>
Date: Fri, 26 Nov 2021 11:55:04 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: Re: [i-g-t 06/14] tests/kms_color: New subtests for Plane CTM
Content-Language: en-US
To: Bhanuprakash Modem <bhanuprakash.modem@intel.com>,
 igt-dev@lists.freedesktop.org, dri-devel@lists.freedesktop.org
References: <20211115094759.520955-1-bhanuprakash.modem@intel.com>
 <20211115094759.520955-7-bhanuprakash.modem@intel.com>
From: Harry Wentland <harry.wentland@amd.com>
In-Reply-To: <20211115094759.520955-7-bhanuprakash.modem@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YQBPR0101CA0152.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:e::25) To CO6PR12MB5427.namprd12.prod.outlook.com
 (2603:10b6:5:358::13)
MIME-Version: 1.0
Received: from [192.168.50.4] (198.200.67.104) by
 YQBPR0101CA0152.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:c01:e::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.23 via Frontend
 Transport; Fri, 26 Nov 2021 16:55:07 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 87b2e581-58a0-47ab-e267-08d9b0fd807d
X-MS-TrafficTypeDiagnostic: MW5PR12MB5569:
X-Microsoft-Antispam-PRVS: <MW5PR12MB5569E06E2095C79074B22E7D8C639@MW5PR12MB5569.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1122;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: civ7mqWhKhNuU2ig5RuW9hSlRlPkPUxTnbWkQMmNazQFuIdA7rAnROlms1aGN4BtM0zqdKXXXRTLkWrulOfMBtBPz/26xYwKd+Ohtql3vkWtZK4l65ky9b3vFgjyyABYkfXzkqYOJiM6/cFMENTlk+l1KVhKdxWMZhmdGUVtWBvEGOXLDsKZig5PpVwMacfADkvuzGeyRj66+H2yGEZlE6i42s1Of96OUKHB8FXxAIvg9EEynf3nJLtAnOPmBa7aq4q7C5v/plyE4ETe5ff4ONDZ+6A9m4tR+yHb7o/+al01vTzK6SYgSB0ld4G+ahLd7wfrdwLu40Jd/Hu/mMLaem1EEvU+QFiAX2gG1rXF6qt7+OfMCsYyU4lM1JZGt3m6d4Fsat9CK63AV1Xl1rqcFa287k9zPMHgdhOZSxV3WC6/fuTDFXX444P3r1UO/BdK1WpepwSGZm7YZT2CE9mI6DBwES63YfKplg1ITu02Q+wkDDYmcjyytVuU8c5/DA57Z+vmH+9095H4GpxQnMOibIm0aN2woUK7aASGE3heZk4HG8Lx6DEEqVUHzU10VbTBTcOkF8yFdrBjwVAmi5C106/JPylUDOoUkafdtXFS2QFvAzCcM9u4m/khVDyluMgyeSNS9kcVoFzUtfJpq6HHoHCZuaPATDU6JY6jC9iCPcGHM27ZgRe/dKmQuxfzwdRW2fedSbX/ainpnJRVc/swvq0TTXV+EpfCYxl696YzpPk=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR12MB5427.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(86362001)(53546011)(54906003)(26005)(31696002)(186003)(31686004)(6666004)(38100700002)(66946007)(66476007)(66556008)(16576012)(508600001)(2906002)(36756003)(316002)(44832011)(8676002)(956004)(8936002)(6486002)(4001150100001)(2616005)(83380400001)(66574015)(4326008)(5660300002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?V0lIMWtqMUtmQkV2MUQ5aFRHMlpVR3NHV25JMDB5dlZsWmNsU0ZhcTM2eUVH?=
 =?utf-8?B?UHpNdm9vMTRvUTlKOWVhK3g5TngraWxUWHkyYlpSK3lOcnUrNUQrY3dTckhm?=
 =?utf-8?B?N3E0SVQwbjNRVGlRT003d2p1L3RENElIcVRoZXdVMVJQRG1pYUhrMjJmRitU?=
 =?utf-8?B?VUFQQS9MMWVySUxjeC9ZbFg1Z2JkWjNRWDJYb2tZZjVEaTlEUW9laXB4YVZI?=
 =?utf-8?B?YStrZExEWEV4dExXMHRpaEx2bkVlLzF6THFmdkJXc3hRcitOMXo0N0ZvYkNp?=
 =?utf-8?B?ckwvOGRXNEZVNFpnQmtxTFFUcnpNUjJZSUpCR05mb2I0Ukx1K0hlaHJiMEJU?=
 =?utf-8?B?TW9RR2dESnFldnFKUGhPK3doMWNlS01qQ0xIYzZ0NlIwM2c0a1hmR0dmWWtR?=
 =?utf-8?B?aXRVaWt6VkZnTk0waWdFQ2d1NUZjYk9jYWZGdFJLYm11OG13NDFxNmlFbkVB?=
 =?utf-8?B?emZmU2lQTnVNNHlSMkhaOVV4REpvbndCa05nMzhBN2p6VzZZNHRKbERaKzYv?=
 =?utf-8?B?YnpzY3VRRmdFaFlFUXRpUjBuN0ZWVFJBTWhCMnpsQXFOOVlDSWtCTVh0dVRW?=
 =?utf-8?B?eXhRcktmN29jV1VLcnF6UTU4Q1ZOTUFPZGxzYkoycDY3bHdzSDJBZ0hGaC9p?=
 =?utf-8?B?clhCTUJSNUdrUGFRYVBEL01FRlVTOEhFQWo0cmFTTVlkcEdyZzVkeXZQYnBY?=
 =?utf-8?B?dWFpRjAydXFHTTUxbWlRUU9XUnBUZ1BZTVoyUVl3TldEbExQcHRSZzV5RzZD?=
 =?utf-8?B?WWdKVGpIaW0zTysyczRORG5sNjFxL29CK1RKMERLY002Y0Y2NVRHMUh5VGdT?=
 =?utf-8?B?ZVdjV2hkOVZ2ZVEzTko2UGpOWHhtbFFMNmhXMTBLczdLeEFSRGVId2dEampU?=
 =?utf-8?B?dDhiNEtmTjl2MGVna1YwWmxDdkFCZU94MVVPSGkrd1ZyNHZBa0E1Z2hJRUxh?=
 =?utf-8?B?Z0RpZEtkakttdHpwNnhtOWZSWEh1aFpJM0s1YkVtNVUxc1RkUktSVm83Tkps?=
 =?utf-8?B?YVc0bjA3RzhjWk9vZUxFNGoyTFBYK0l3UzJVZVFPRXErUU9Cdlc2bVVKRlVB?=
 =?utf-8?B?cWZLN1lHOWw0U1BxQnpPbFdhVzRNZmtlL2dRQk1mcWVmMTNWVi92L3ZwMVdz?=
 =?utf-8?B?d3VqSXFoSEd4bWpJNCtMUmVGS2FzNFZPWVduem1XcWQyUUJOZnduWXM0U2Zz?=
 =?utf-8?B?cTI3T2sxK3ZCV3ZXVXl2ZDFwZCtpZ0JIT3gzV0J4a1Z1NlBnWkVVV0V1dHRi?=
 =?utf-8?B?cGxPVWRicVpaVUhXZFRFc0dqTFI4TjJQUUhkYUFwMGtoTndGaWpMd05idWpX?=
 =?utf-8?B?L0F4cXgrNzM2a2g5elFUYWdWZFh2T3BWVDIwdm9Oc1cxUzRLbVpGZnpFYkJ5?=
 =?utf-8?B?VnFxMGlBSmZjSGQ3dzNkSGlVQkM5NTA5UzlXbjdZQlN0MW0vWnVTem9MYlB4?=
 =?utf-8?B?UTBYM0lJZW8xSG5OR0cwbENuUTluem9tRFJVcnlOcHdKY0c5Y3F2VHhEQVBB?=
 =?utf-8?B?L0lVUDVScXREQnNpV3A2cW0xZ0Fld2p6REwwZVhIK0NVMEFmWGtCeGhjTlVu?=
 =?utf-8?B?WHNEd3NrdVFXVklkcEQvNFVLT1FqaTNrQ2VmYVh3a2J5dkhTV21ML2tFcGU0?=
 =?utf-8?B?WUtwSmkxSEsxeGtPWU42TWlLR3EvY0lHTWtqZUZydFRmUFlYYmpBamNxNFd0?=
 =?utf-8?B?K0NZendsVi9nZHpPZUNiMjZCWkthM3E2aUtQdGpHNkJ4YldZS05qbWg5Mzdo?=
 =?utf-8?Q?BoBNDrB73td9gikR4IrnEHd3blAl06ziAlb7QVm?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 87b2e581-58a0-47ab-e267-08d9b0fd807d
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5427.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2021 16:55:08.0296 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QoueNLfFivGarHDXCxvBdQTIRresoRiC22XUPhhic9lbblwgjm/kjv94AHGDvf9EsxFcIPLDe19gRmiAn1Reew==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR12MB5569
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
Cc: Uma Shankar <uma.shankar@intel.com>,
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 2021-11-15 04:47, Bhanuprakash Modem wrote:
> To verify plane CTM, draw 3 rectangles using before colors with the
> ctm matrix applied and verify the CRC is equal to using after colors
> with an identify ctm matrix.
> 
> Cc: Harry Wentland <harry.wentland@amd.com>
> Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
> Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
> Cc: Uma Shankar <uma.shankar@intel.com>
> Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
> ---
>  tests/kms_color.c | 225 ++++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 225 insertions(+)
> 
> diff --git a/tests/kms_color.c b/tests/kms_color.c
> index 920a5eaadd..e14b37cb6f 100644
> --- a/tests/kms_color.c
> +++ b/tests/kms_color.c
> @@ -53,6 +53,77 @@ static bool is_valid_plane(igt_plane_t *plane)
>  	return index >= 0 && index < MAX_SUPPORTED_PLANES;
>  }
>  
> +struct {
> +	const char *test_name;
> +	int iter;
> +	color_t expected_colors[3];
> +	double ctm[9];
> +} ctm_tests[] = {
> +	{"plane-ctm-red-to-blue", 0,
> +					{{ 0.0, 0.0, 1.0 },
> +					 { 0.0, 1.0, 0.0 },
> +					 { 0.0, 0.0, 1.0 }},
> +		{ 0.0, 0.0, 0.0,
> +		  0.0, 1.0, 0.0,
> +		  1.0, 0.0, 1.0 },
> +	},
> +	{"plane-ctm-green-to-red", 0,
> +					{{ 1.0, 0.0, 0.0 },
> +					 { 1.0, 0.0, 0.0 },
> +					 { 0.0, 0.0, 1.0 }},
> +		{ 1.0, 1.0, 0.0,
> +		  0.0, 0.0, 0.0,
> +		  0.0, 0.0, 1.0 },
> +	},
> +	{"plane-ctm-blue-to-red", 0,
> +					{{ 1.0, 0.0, 0.0 },
> +					 { 0.0, 1.0, 0.0 },
> +					 { 1.0, 0.0, 0.0 }},
> +		{ 1.0, 0.0, 1.0,
> +		  0.0, 1.0, 0.0,
> +		  0.0, 0.0, 0.0 },
> +	},
> +	{"plane-ctm-max", 0,
> +					{{ 1.0, 0.0, 0.0 },
> +					 { 0.0, 1.0, 0.0 },
> +					 { 0.0, 0.0, 1.0 }},
> +		{ 100.0, 0.0, 0.0,
> +		  0.0, 100.0, 0.0,
> +		  0.0, 0.0, 100.0 },
> +	},
> +	{"plane-ctm-negative", 0,
> +					{{ 0.0, 0.0, 0.0 },
> +					 { 0.0, 0.0, 0.0 },
> +					 { 0.0, 0.0, 0.0 }},
> +		{ -1.0, 0.0, 0.0,
> +		   0.0, -1.0, 0.0,
> +		   0.0, 0.0, -1.0 },
> +	},
> +	/* We tests a few values around the expected result because
> +	 * it depends on the hardware we're dealing with, we can
> +	 * either get clamped or rounded values and we also need to
> +	 * account for odd number of items in the LUTs.
> +	 */
> +	{"plane-ctm-0-25", 5,
> +					{{ 0.0, }, { 0.0, }, { 0.0, }},
> +		{ 0.25, 0.0,  0.0,
> +		  0.0,  0.25, 0.0,
> +		  0.0,  0.0,  0.25 },
> +	},
> +	{"plane-ctm-0-50", 5,
> +					{{ 0.0, }, { 0.0, }, { 0.0, }},
> +		{ 0.5,  0.0,  0.0,
> +		  0.0,  0.5,  0.0,
> +		  0.0,  0.0,  0.5 },
> +	},
> +	{"plane-ctm-0-75", 7,
> +					{{ 0.0, }, { 0.0, }, { 0.0, }},
> +		{ 0.75, 0.0,  0.0,
> +		  0.0,  0.75, 0.0,
> +		  0.0,  0.0,  0.75 },
> +	},
> +};
> +
>  static void test_pipe_degamma(data_t *data,
>  			      igt_plane_t *primary)
>  {
> @@ -900,6 +971,99 @@ static bool plane_degamma_test(data_t *data, igt_plane_t *plane)
>  	return ret;
>  }
>  
> +static bool test_plane_ctm(data_t *data,
> +			  igt_plane_t *plane,
> +			  color_t *before,
> +			  color_t *after,
> +			  double *ctm_matrix)
> +{
> +	const double ctm_identity[] = {
> +		1.0, 0.0, 0.0,
> +		0.0, 1.0, 0.0,
> +		0.0, 0.0, 1.0
> +	};
> +	igt_output_t *output;
> +	igt_display_t *display = &data->display;
> +	drmModeModeInfo *mode;
> +	struct igt_fb fb;
> +	igt_crc_t crc_software, crc_hardware;
> +	igt_pipe_crc_t *pipe_crc = NULL;
> +	bool ret = true;
> +
> +	igt_info("Plane CTM test is running on pipe-%s plane-%s(%s)\n",
> +			kmstest_pipe_name(plane->pipe->pipe),
> +			kmstest_plane_type_name(plane->type),
> +			is_hdr_plane(plane) ? "hdr":"sdr");
> +
> +	igt_require(igt_plane_has_prop(plane, IGT_PLANE_CTM));
> +
> +	pipe_crc = igt_pipe_crc_new(data->drm_fd,
> +				  plane->pipe->pipe,
> +				  INTEL_PIPE_CRC_SOURCE_AUTO);
> +
> +	output = igt_get_single_output_for_pipe(display, plane->pipe->pipe);
> +	igt_assert(output);
> +
> +	igt_output_set_pipe(output, plane->pipe->pipe);
> +	mode = igt_output_get_mode(output);
> +
> +	/* Create a framebuffer at the size of the output. */
> +	igt_assert(igt_create_fb(data->drm_fd,
> +			      mode->hdisplay,
> +			      mode->vdisplay,
> +			      DRM_FORMAT_XRGB8888,
> +			      DRM_FORMAT_MOD_LINEAR,
> +			      &fb));
> +
> +	igt_plane_set_fb(plane, &fb);
> +
> +	/* Disable Pipe color props. */
> +	disable_degamma(plane->pipe);
> +	disable_gamma(plane->pipe);
> +	disable_ctm(plane->pipe);
> +
> +	disable_plane_gamma(plane);
> +	disable_plane_degamma(plane);
> +	igt_display_commit2(display, display->is_atomic ?
> +				COMMIT_ATOMIC : COMMIT_LEGACY);
> +
> +	/* Without CTM transformation. */
> +	paint_rectangles(data, mode, after, &fb);
> +	igt_plane_set_fb(plane, &fb);
> +	set_plane_ctm(plane, ctm_identity);
> +	igt_display_commit2(display, display->is_atomic ?
> +				COMMIT_ATOMIC : COMMIT_LEGACY);
> +	igt_wait_for_vblank(data->drm_fd,
> +			display->pipes[plane->pipe->pipe].crtc_offset);
> +	igt_pipe_crc_collect_crc(pipe_crc, &crc_software);
> +
> +	/* With CTM transformation. */
> +	paint_rectangles(data, mode, before, &fb);
> +	igt_plane_set_fb(plane, &fb);
> +	set_plane_ctm(plane, ctm_matrix);
> +	igt_display_commit2(display, display->is_atomic ?
> +				COMMIT_ATOMIC : COMMIT_LEGACY);
> +	igt_wait_for_vblank(data->drm_fd,
> +			display->pipes[plane->pipe->pipe].crtc_offset);
> +	igt_pipe_crc_collect_crc(pipe_crc, &crc_hardware);
> +
> +	/* Verify that the CRC of the software computed ouutput
> +	 * is equal to the CRC of the CTM matrix transformation
> +	 * output.
> +	 */
> +	ret = igt_check_crc_equal(&crc_software, &crc_hardware);
> +
> +	disable_plane_ctm(plane);
> +	igt_plane_set_fb(plane, NULL);
> +	igt_output_set_pipe(output, PIPE_NONE);
> +	igt_display_commit2(display, display->is_atomic ?
> +					COMMIT_ATOMIC : COMMIT_LEGACY);
> +
> +	igt_pipe_crc_free(pipe_crc);
> +
> +	return ret;
> +}
> +
>  static void
>  prep_pipe(data_t *data, enum pipe p)
>  {
> @@ -1169,8 +1333,57 @@ static void run_plane_color_test(data_t *data, enum pipe pipe, test_t test)
>  	igt_require_f(count, "No valid planes found.\n");
>  }
>  
> +static void run_plane_ctm_test(data_t *data,
> +				enum pipe pipe,
> +				color_t *expected,
> +				double *ctm,
> +				int iter)
> +{
> +	igt_plane_t *plane;
> +	bool result;
> +	int i, count = 0;
> +	double delta = 1.0 / (1 << 8);
> +	color_t red_green_blue[] = {
> +		{ 1.0, 0.0, 0.0 },
> +		{ 0.0, 1.0, 0.0 },
> +		{ 0.0, 0.0, 1.0 }
> +	};
> +
> +	for_each_plane_on_pipe(&data->display, pipe, plane) {
> +		if (!is_valid_plane(plane))
> +			continue;
> +
> +		result = false;
> +
> +		if (!iter)
> +			result |= test_plane_ctm(data, plane,
> +					red_green_blue, expected,
> +					ctm);
> +
> +		for (i = 0; i < iter; i++) {
> +			expected[0].r =
> +			expected[1].g =
> +			expected[2].b =
> +				ctm[0] + delta * (i - (iter/2));
> +

This bracketing likely depends closely on HW. I am curious if we
can get this to work on various HW.

Harry

> +			result |= test_plane_ctm(data, plane,
> +					red_green_blue,	expected,
> +					ctm);
> +			if (result)
> +				break;
> +		}
> +
> +		igt_assert(result);
> +		count++;
> +	}
> +
> +	igt_require_f(count, "No valid planes found.\n");
> +}
> +
>  static void run_tests_for_plane(data_t *data, enum pipe pipe)
>  {
> +	int i;
> +
>  	igt_fixture {
>  		igt_require_pipe(&data->display, pipe);
>  		igt_require_pipe_crc(data->drm_fd);
> @@ -1186,6 +1399,18 @@ static void run_tests_for_plane(data_t *data, enum pipe pipe)
>  	igt_subtest_f("pipe-%s-plane-degamma",
>  			kmstest_pipe_name(pipe))
>  		run_plane_color_test(data, pipe, plane_degamma_test);
> +
> +	for (i = 0; i < ARRAY_SIZE(ctm_tests); i++) {
> +		igt_describe("Compare after applying ctm matrix & identity matrix");
> +		igt_subtest_f("pipe-%s-%s",
> +				kmstest_pipe_name(pipe),
> +				ctm_tests[i].test_name) {
> +			run_plane_ctm_test(data, pipe,
> +					ctm_tests[i].expected_colors,
> +					ctm_tests[i].ctm,
> +					ctm_tests[i].iter);
> +		}
> +	}
>  }
>  
>  igt_main
> 

