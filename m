Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A8FF7905256
	for <lists+dri-devel@lfdr.de>; Wed, 12 Jun 2024 14:23:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 41C7E10E081;
	Wed, 12 Jun 2024 12:23:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GCtO+Qzf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 67DA910E081;
 Wed, 12 Jun 2024 12:23:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718194991; x=1749730991;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=0LXyTbuADVx3RjdvSJaW1ch2HSOCgnDnAS5y43RCm2o=;
 b=GCtO+QzfrBJbGuTs8NgluEIxefMZsT06StArwgnsq47AbthSLpFwMKFJ
 nen2p9C7xO7Yimd3pigo8+QIc1IuXG4w2Dwtdyf3G6wuAc2ghWoP11Sjr
 EXJ2IaxBW91uxVJ9tyaG2MxHOIcLU+GUQbScJ8KZOXxdvnjpfpAFX8Kfj
 Tj61j0EStYS7a4GdtUYnnYtiyXmWgeoa+R+qCrsaUrWaf5laVa+TyBlr/
 us+Jx4y6BbQ44B35JaFh6F+HzYfLbiS7lGN4sOOd0ZReUiHvaSCPU6uV+
 ImHUDHtCPF+SWLy33MYhAHyQTsoO8xSU/yCMK3ygxqEx/YJdF8ZE2gatJ A==;
X-CSE-ConnectionGUID: jx5q9Op2THef/IQEwV6UGg==
X-CSE-MsgGUID: pJzguHbDRO6aLjozJ3rQOA==
X-IronPort-AV: E=McAfee;i="6700,10204,11100"; a="25631012"
X-IronPort-AV: E=Sophos;i="6.08,233,1712646000"; d="scan'208";a="25631012"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2024 05:23:10 -0700
X-CSE-ConnectionGUID: js1WuJm0Ri+cokndCzswXA==
X-CSE-MsgGUID: 5R/p+NvmSQirFoLhxK3Tkg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,233,1712646000"; d="scan'208";a="39886690"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmviesa009.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 12 Jun 2024 05:23:10 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 12 Jun 2024 05:23:09 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 12 Jun 2024 05:23:09 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 12 Jun 2024 05:23:09 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.175)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 12 Jun 2024 05:23:09 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SW+KzrTJ08T9rETJcj6CkhawIoRWzEnkFf2w6wSdd+6ifj5V+OOeqifl0hIJypJ99Ieetv2sdwyFE0WI73KZOTJ3Ep2AYlEKPsuHzGZNhjbGly5+aRtkjcTW0zi6ct5LrvhYALZYMdOZtjPMy++/eMHwtAxzZCZ784q5g5BTEYnBaZy3C4zIHGUKYKX1IbWM35fmKx++tfrfJdUlZgrm+fKoj8QuHHnh9pF4yAbdjgjj8b9QoRGIslvk4bGf9LrZVO1pEsQGVZewhL6dU/u8B5cEhNeCOyUWm2bAM5KbFQ+PlcVNK9kqwOtR+cC9qjVUA8Sva95itIbxlMxCgYfp9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0HNwJn3SDbuvU3kjuhAiN4yM23wHu5LW34shPyU7SUw=;
 b=RtcSA5Bo1fMDtGQMw4JFJOUpvbUC39J9bn2HoWRXu/MD8gyDv4WKmgfxVr3UOE/1X80uc4q2Eb41Ro60TMp+4/o+WnS6eVo5Ww4zJZ56PUCZJbIaTzDEK6mPelsoxSlyFM14LW6qrsc1gU8wG94StQAclBfbZ21ckWdmiDTI8lj3ITWU91xVjWU9K8YTaMXyEs/wz70U84p469B+yvSFexH78elffngNFo4PqFCZzgGL9gnKhCECqAOUXwpI8qDhmu+w98Xl0p9gDy1OdPesa6QzLoYykig/+MsoaEx9OmOPE559JNRySoXidLH9xVZqeZFJcd9TuylH/cgYp3O6HQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5341.namprd11.prod.outlook.com (2603:10b6:5:390::22)
 by IA1PR11MB7245.namprd11.prod.outlook.com (2603:10b6:208:42f::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.36; Wed, 12 Jun
 2024 12:23:06 +0000
Received: from DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::397:7566:d626:e839]) by DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::397:7566:d626:e839%6]) with mapi id 15.20.7633.037; Wed, 12 Jun 2024
 12:23:06 +0000
Message-ID: <1c0b7594-70f5-43e6-a849-09a0984e694b@intel.com>
Date: Wed, 12 Jun 2024 17:52:58 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] drm/i915/display: Update calculation to avoid overflow
To: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>,
 <intel-gfx@lists.freedesktop.org>, <intel-xe@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>
CC: <suraj.kandpal@intel.com>, <jani.nikula@linux.intel.com>,
 <rodrigo.vivi@intel.com>, <sfr@canb.auug.org.au>
References: <20240612095433.323342-1-mitulkumar.ajitkumar.golani@intel.com>
 <20240612095433.323342-4-mitulkumar.ajitkumar.golani@intel.com>
Content-Language: en-US
From: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>
In-Reply-To: <20240612095433.323342-4-mitulkumar.ajitkumar.golani@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0038.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:81::11) To DM4PR11MB5341.namprd11.prod.outlook.com
 (2603:10b6:5:390::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5341:EE_|IA1PR11MB7245:EE_
X-MS-Office365-Filtering-Correlation-Id: 120aa473-092e-4eac-c37f-08dc8ada69f6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230032|1800799016|366008|376006;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Q3ViWGJxekdHc1JZRzlIR0J6MFJVektkZlRCbUR2b0pVYmFGU0NJcXQxVWdk?=
 =?utf-8?B?UzRqSCtTVUJIZXBpdUhEYVZhZkFLc2h5YWFiWjc2OUIzazZaeW00VWZ6ZXBD?=
 =?utf-8?B?RWE1THZ0TmRMVDM0TnVFZ05XL2p4LytldXo4cmMza2tnM3BKZ0NyblFMSC9L?=
 =?utf-8?B?SkJmNnNwblhBaURkTE8rYTRzZmNiMU5RdDFFNWMzZWYrUnVUSS9HOU1CV2hl?=
 =?utf-8?B?TVBrV2FKYVVLRDZKbDQ3YlR6M1Y0aWtoQUpKVHo2cHVKYi9nWnMzR2J0SklW?=
 =?utf-8?B?eGxvd29aWGJYSGJHcmNYR2tpcGtQZ3MyQnJwUFAyZXVURlBLNFVyS1RsNU4z?=
 =?utf-8?B?VjN0blJlUHRyMWc4THlpVzlqZkNtdU5nSUpONmd1cVAvblZZdzB3Q09WNXRw?=
 =?utf-8?B?SldnWWtKTjdQZkJrQm8zakMrcnJzdStEbUc5QW1NSXJGS2xJV2NGWkdIUVZ0?=
 =?utf-8?B?bWROREd3M0RNV3pTeDlDMFU2bUNZclJmOG5wZzNoNkY0c3lTNzV1VlZIdStl?=
 =?utf-8?B?RWU4bFI2QitVeEw3TmNaaURFT2V6NC9CZGNTYitER2JiZXU3OC9aMmpGOG92?=
 =?utf-8?B?MmpkL3JCTlFSTy95b3Zod3hxZlhwdE1aWUZQeTZpK0NjTDlXR3JqSXFBQkN2?=
 =?utf-8?B?aDVNNXRiaXpwQm9OaEU2S0NDUU1seEFvVVZEZXBSWDdWVDlUNGFiMm55TXFu?=
 =?utf-8?B?Q3FYRS9NZmJ4ZCswNUJOR2xhU3dpMWxYY1ZiUUhIVWY1Qlo5SERjS2lYWEZP?=
 =?utf-8?B?YjlRM09FUGhkLzBobzhBdkxlcllaYjZobGtrZS9neS9hL2pYOTVNemxIUVpP?=
 =?utf-8?B?bjUvbS9hZFRLaHNpR2c1MUM3UHV5SmI2THROdGRpZ0ZLTHh3Ris2NlFKa0w5?=
 =?utf-8?B?aUozRkhJd0VnU2Fucmp1Q05DdjJrTGRqRFVqSmhmSmFoNzNDTDFsUUFlaHFB?=
 =?utf-8?B?b0RQT25TRjFmVGlXL0NpRUd2bzBGeDlFYVN1ZmFGQnhTWUtiQUFKd0lIbTV4?=
 =?utf-8?B?OFZLWFE2NXY4YjJMdW5RdmwzMnI1Mkx5RGRBUDJ3V2Y1ak0wVFdnRlhNUUZ0?=
 =?utf-8?B?VlpCMzk0YjdMUXpoV29sZU11QzNLNkdKVy9jbGlldTkvVzJaUlNqbkZnNTdv?=
 =?utf-8?B?TmJNMDNRbCtnb0t4V0Y4eHhyd0JVSzBPUElkT1c4d1hKZlJ5M0FwU0dmbkVB?=
 =?utf-8?B?NFg5enpRd1BNR1JOb0NPMnVJQm4yQkppN05ST3pVbEJKT3lTNDRZT1JEdVlO?=
 =?utf-8?B?MnpnL0hXV2x0TnpXV1d5emxibS9zU1cxNkR4ajhSUEJsazJBY3RFWUdrKzVR?=
 =?utf-8?B?UGRvTnEycS9IVmIrQzdhUW1jR2xuUVRyWkk0QTZtZnNlQ1NxbEdIQVRiNGhn?=
 =?utf-8?B?T3pzOXlVNW8yeHhxUkp2cDRwdlJWcm1uWUQwM1Q2ZFNYMEFTTGdTM1FQZVc1?=
 =?utf-8?B?TkY0Z0FoeWRMYkk1SXAwRkszM2w5UHBkcjZJTXErWjdHaGJSSTJtcmxvU0VO?=
 =?utf-8?B?bGtkK0orUWpYa04zQk1FdGovU0dNbGRxNTQyUkJtMEtyc1VGNUFRVW9YSThC?=
 =?utf-8?B?Tk5jY0t4akU4OEdyVVNUcUw1cXQ0YUFtd0lobEd5RFU3ZnI4RWFzNjZ3NGJh?=
 =?utf-8?B?NzlpR2ZaaUpsNW14R29VVUVGbG05NzhlT2owMWV2anJiTDArdVFQOXR4QUxx?=
 =?utf-8?B?eStXV3hZQ1A0ajdLeGxMYStKSG5rMk41aU5qbUMwbE1vdm9aRFpTYkhpcjBM?=
 =?utf-8?Q?VCoYUG/Lg+4FBmHpSws56vQnQstCuYq1K+RLpCr?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5341.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230032)(1800799016)(366008)(376006); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SDg0MjFyMytWOS9MMVgxUU53ZHNFa0p3aVpOeW9GT3NuN2tETU1IZjdzVGNQ?=
 =?utf-8?B?RGg3NkErUFAxUnNsZjVnNCtROWM0VUNHbGNSeWNMbU9kazBscE10MGQyZWk3?=
 =?utf-8?B?RldadzdCVE95Ni9sVkllYzgvMlZUUVAxeFFuUHNlZmxxeVcyT1g4cjZWWExC?=
 =?utf-8?B?bXJrWGJyckh5bDJPYUxzbytwM1lSdVJpL210a1lTWUVLdk5wakpDSm9pU200?=
 =?utf-8?B?ZHlWTDhUTGV2ZUt5eEpDRVMxeEtXSVU5SDM1YmNLcFRna3hMYTIwYWgzc21T?=
 =?utf-8?B?dGpRNEk2biswZXVuVVRNd05abm03eGQwZTJYVEtSZFo2dmtScUU3TVBsRStI?=
 =?utf-8?B?L041d09CaUw2aWFkNU0wNG5xRzQ1SmpDbWVVZ3hGWktSSXpDN3ZxUm40Q3h1?=
 =?utf-8?B?ZTU1dnJuZWl3eGk0L2pXWTVVNysvTzhSQVJPZnZoWW5mazM3MjhPMTg5MzVO?=
 =?utf-8?B?WWdxb2ZZNlM2b0hGZktnTXQxdzA1THJOUExBaXp1K21WbXozQjB5b0h5dURw?=
 =?utf-8?B?K1gzaWd6T3B5a1dmWkMyS1djN0JFLytuVVdKTVUvcnhnQ00xRXJENkVqNGVu?=
 =?utf-8?B?N09BSmpaQ1g3c1dGVEJuOThNOWVzeEJzNUdqcWtUcjE4akxvcmN1aStNNlRv?=
 =?utf-8?B?eU5jdVVWdmZPZDNEMTJ4UGQvc0diUjlmNGdLZ2hDOFhjbG52dUVwVkFjZU1I?=
 =?utf-8?B?M2ZGV3FqK0ZlaHFUaDJNWEk3WXJ3Qmh5VDF5cmp1Zm14MjZiaFhXZ2pUUUFP?=
 =?utf-8?B?Q2pZVVNEcndFZWhsWWxERExZUkZLSS9qeHdlWEVGTEdFdi9NK0kxQUxwNzhD?=
 =?utf-8?B?WlQ0bkdNdDNlejJudy8xaWNaRGo5VWFzd2w0aS82eW1aaWZhbDhtNUVXVXhs?=
 =?utf-8?B?U0F4VFlhZHdSbUZvblcrUUVHdVJYSEx5TzZPK0ZnbEVURldIc2F1MitBVytu?=
 =?utf-8?B?NUhFNDVBcFB1a1pGQ09hcklwcHlPK3BGbnNsZTRpWmI5M09pbkNFdllXaUpV?=
 =?utf-8?B?dWN4b3lTcDZIbDhJYnVUaXoyNjI4djNKKzdyd2dXS3dyZFY5bHNWZ0Vydmk2?=
 =?utf-8?B?WDhNREZKYmtTQm5xOEZVUjh4eDBJaHRZQVJUVUFVM053UkJNSjJqbE95SEdQ?=
 =?utf-8?B?ZG9OZDZYdkx6aG4vc3ZEZ2puOXRLQnVoV1NVN3ErSWNTODFmSkNhVFRVckh6?=
 =?utf-8?B?MU5nY0NoY1JJbTcvYllyRnQrSjZwWSs1VWhxbUs4V092MFEyRXMyWDdMcGRK?=
 =?utf-8?B?RkRleWkvYjdOVCtDS3pQTWo2Mjlubk5WdU10MlMzZzl4Vys0c0VrRk9MZ1M2?=
 =?utf-8?B?bUQ3VEpPbVFtVWZwVmpnYWZYaGM5Znl6c2FMaDRIN0RYQWErd1dmMWtpSUFJ?=
 =?utf-8?B?SmtObnhhMGJWdFFJODJzazJkVlVESE1tNCtvV0lFNWNpZmE5VHdnRXlKeUpN?=
 =?utf-8?B?N2M1QlNtZ2laMlQyUEViWUpXVGl2Wk5Nb2J4cGxMWkhtYUJEcUZEVHlPdlZG?=
 =?utf-8?B?MzVDRXk4YzBlQ3gxZkJJRXJ2VzNYUmtrdTJsemtrSjYwSkdYaEk4QXp2K0hM?=
 =?utf-8?B?eTg4cTlCOTA4SlZBRWNCbEk4STFVL0pJYnFHT0I2ZG41N0ZhaE1nTHh2Nlda?=
 =?utf-8?B?c242Z3dkNnZvM0Ewb0hvR3BGWk1xc2pnYWJRS1pRcUs1WjU1dUVsS1BWdk00?=
 =?utf-8?B?anMwTmZWaGgvMG5KNFduTUVBTEMwT3g5SWx0YWdxeU01aXdPRSsvc0R5R2py?=
 =?utf-8?B?elEweThPWkx6aW1jcUhNRU0rYlcyUFBBdWdRVUdta0RaOTNHYTJCZHZpQXdS?=
 =?utf-8?B?VWhjdTRXTEwrejRXL2R2RDBtYVVXbTc3Vy9rODc5OE5ZTDdPTWxpS0NPVGE3?=
 =?utf-8?B?T01xSUtKNGJQZE9GaEVmQVFOV2RVVzdBMHoxRDhqZm1MUEZWYWJmbjlURUE4?=
 =?utf-8?B?NjVVUWx4T24wNERqcTRNQUgzQTFsS2ptWHhWbExYQjNLOHlVY2s3RW5Rd0ow?=
 =?utf-8?B?Lzkxd0hJRHFLQy9VOTI3YU90MXhBK1dUSThtN0l4VGpMR05GN0JNT1FYQTRK?=
 =?utf-8?B?WjZlakZYeEtnSTh3WEtsdUtkZi9nWkFrMlNpeTVwZXJOdkpualNFTjQ1VmxN?=
 =?utf-8?B?L3BncHRLeXRid0FGMG5LYUJYUjdibjlZWHVSTEtKWUs1ckMvaS9UcDNDWWV5?=
 =?utf-8?B?K0E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 120aa473-092e-4eac-c37f-08dc8ada69f6
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5341.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jun 2024 12:23:06.5953 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pigGXXr8nMLPSke0cUkW1I78HCH+dkhuKRsGR4TVxcI2GQhs+DBq8YLXfczE8cg69XHg1hzPN7/wbgC+kgIEFAQfHgfeHYCL2mfcCQOGqeI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7245
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 6/12/2024 3:24 PM, Mitul Golani wrote:
> Update calculation to avoid overflow.
>
> Fixes: 1676ecd303ac ("drm/i915: Compute CMRR and calculate vtotal")
> Cc: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
> Cc: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
> Cc: Suraj Kandpal <suraj.kandpal@intel.com>
> Cc: Jani Nikula <jani.nikula@linux.intel.com>
> Cc: Stephen Rothwell <sfr@canb.auug.org.au>
>
> Signed-off-by: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>

Reviewed-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>


> ---
>   drivers/gpu/drm/i915/display/intel_vrr.c | 9 +++++----
>   1 file changed, 5 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_vrr.c b/drivers/gpu/drm/i915/display/intel_vrr.c
> index dc9cf7ddafe9..5da9d5b9936e 100644
> --- a/drivers/gpu/drm/i915/display/intel_vrr.c
> +++ b/drivers/gpu/drm/i915/display/intel_vrr.c
> @@ -147,10 +147,11 @@ cmrr_get_vtotal(struct intel_crtc_state *crtc_state, bool video_mode_required)
>   		multiplier_n = 1000;
>   	}
>   
> -	crtc_state->cmrr.cmrr_n =
> -		desired_refresh_rate * adjusted_mode->crtc_htotal * multiplier_n;
> -	vtotal = (adjusted_mode->crtc_clock * 1000 * multiplier_n) / crtc_state->cmrr.cmrr_n;
> -	adjusted_pixel_rate = adjusted_mode->crtc_clock * 1000 * multiplier_m;
> +	crtc_state->cmrr.cmrr_n = mul_u32_u32(desired_refresh_rate * adjusted_mode->crtc_htotal,
> +					      multiplier_n);
> +	vtotal = DIV_ROUND_UP_ULL(mul_u32_u32(adjusted_mode->crtc_clock * 1000, multiplier_n),
> +				  crtc_state->cmrr.cmrr_n);
> +	adjusted_pixel_rate = mul_u32_u32(adjusted_mode->crtc_clock * 1000, multiplier_m);
>   	crtc_state->cmrr.cmrr_m = do_div(adjusted_pixel_rate, crtc_state->cmrr.cmrr_n);
>   
>   	return vtotal;
