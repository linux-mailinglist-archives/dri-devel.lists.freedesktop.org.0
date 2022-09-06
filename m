Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A6FB5AF5E0
	for <lists+dri-devel@lfdr.de>; Tue,  6 Sep 2022 22:30:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F8B610E1A6;
	Tue,  6 Sep 2022 20:30:06 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4246710E1A6;
 Tue,  6 Sep 2022 20:30:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1662496201; x=1694032201;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=PhWs6P2Ut/+86luw4kwe2kGxHGoznI8/Z8w7jiI5M3w=;
 b=gRAWYxBWvcQDyyce7uJ6GkR+LnkO4AkSSNAdTdL26I932hLuoiz7q9JP
 Kra0uMFq7/MHHbP7rGBc1Cges7OV23NAV8iWqdFTlHdPUYkjQ5ihexEG5
 /rBb0C8CR32pMVTYgBqQ7OdznE4uRjqX5nKjmX44IG/OtNwyr4V+BOFGp
 8CdHK1BQrfoGZJMd9u/evxA2PgoSw1y3Ch3vp67AqDFtL3eeymsdxatvW
 n1GUozGuYRyP/LQMAW+KGcg3+CKqw9gc6cZA2Wn7TOZ55ykcM4hxlv6hE
 Y8vom4J8G/wzsRNNqpXqa4hQRK1XeGDKYnuGhj5KGvaCdwsxXXw76uynU A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10462"; a="298013542"
X-IronPort-AV: E=Sophos;i="5.93,294,1654585200"; d="scan'208";a="298013542"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Sep 2022 13:30:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,294,1654585200"; d="scan'208";a="859386948"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmsmga006.fm.intel.com with ESMTP; 06 Sep 2022 13:30:00 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Tue, 6 Sep 2022 13:29:59 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Tue, 6 Sep 2022 13:29:59 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.168)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Tue, 6 Sep 2022 13:29:59 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=H3LiPrzigHfOLly+uLsXXWkynTsr2DF1gRqg6aJrfeEAQefJ8ARI85oBQ2sog1Z2gzipNgbZ22xKbNuwcxNEu1tdjOp7s6PIEd3aes0Q5lfwgLYTo7U15EDPztdDSqUzfhW8isEUDbM34DuVOdng9l2y9XrP/IuTeVp3Q6mtMTGHwRfW/mPCdiFbe2qKCCTgGhNc9J6z7bqqZ7eSauwtDkKO/zeqxephgOrpxqGX9jWNpHWOo73eBiTeyrZ1skypEOj/rtAw+60NwMrPTgK+SIjMivFmiVfXFZiDHsJt/lqZhTA9K4F715SE3en+tEGGCkAZ8fLrvoFPSNpE0Kiopg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GRp/Xc748rU0TTi1nJ5HLHvsaKlaOEjE4M5n4WEsvNU=;
 b=b3tHEy4vjasPpSSo6exf9kPT474UaOZ9EA2VtgDZX9DcQ87dYFCj/CzK4DtTXbr8fy0qggTY6sKSakiWBXtNh/DY9s+EiJ1oIS/FMe5iJh0RU1a+IR1qHZaUaXGlfyLOIAVQrcts5o7DyvEx9sfuKfdmJ24skOrdeW1bcn/a8aI6r5CdQMjhSzRgQLDUDcXAZ+zcFIIHTXhkNgvJHNjaUxk/vSGcNhRdz1Bvl3+pxIK31w51PGlkR1zMmnMy1AOd+sR/ORHcArP+NZ2IgzCVv+wIVlwPGpvCvkznoH5srxbMHu5H+nY+1PQL4JIBmUjmjpv890TafA+TegKptGYWLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5488.namprd11.prod.outlook.com (2603:10b6:5:39d::5) by
 CH2PR11MB4373.namprd11.prod.outlook.com (2603:10b6:610:3a::21) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5588.15; Tue, 6 Sep 2022 20:29:58 +0000
Received: from DM4PR11MB5488.namprd11.prod.outlook.com
 ([fe80::1977:59e7:5a28:24e1]) by DM4PR11MB5488.namprd11.prod.outlook.com
 ([fe80::1977:59e7:5a28:24e1%9]) with mapi id 15.20.5588.017; Tue, 6 Sep 2022
 20:29:58 +0000
Message-ID: <1f200f90-0451-b7b3-e2f0-598c17e6b274@intel.com>
Date: Tue, 6 Sep 2022 13:29:55 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [Intel-gfx] [PATCH v3 3/3] drm/i915/uc: Enable version reduced
 firmware files for newest platforms
Content-Language: en-US
To: <John.C.Harrison@Intel.com>, <Intel-GFX@Lists.FreeDesktop.Org>
References: <20220827011702.3465334-1-John.C.Harrison@Intel.com>
 <20220827011702.3465334-4-John.C.Harrison@Intel.com>
From: "Ceraolo Spurio, Daniele" <daniele.ceraolospurio@intel.com>
In-Reply-To: <20220827011702.3465334-4-John.C.Harrison@Intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BYAPR21CA0028.namprd21.prod.outlook.com
 (2603:10b6:a03:114::38) To DM4PR11MB5488.namprd11.prod.outlook.com
 (2603:10b6:5:39d::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 17816181-fbc7-4bc4-80b3-08da904690ea
X-MS-TrafficTypeDiagnostic: CH2PR11MB4373:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: QR823eJLZWCShQ7WpywMh/GhXrIzfvMAeT39sSd7KD78J/TCozc5VAOAkVf+SpiR/RrgSC0TGLf1u8UTV+PRx/fJUVHelBhQ469EELwDn8v4YJn2fl/XlTCD1xGv/hbk+yw/MWnqMlWHIP6sFz0wZo/FJGs8rHURgFoj1xTAUXb/ne3D2Idj1DJniB68ENLWyXmNLXPfPmcfjc9dH3NqUXi9Qgg9Uwp4bwd/1Rev+lho2eBR8k7OHPHplN/gK5uRGBn2tFJ7u1pyWbGXFp75O6ygeDda46pihEubv6jEyr0woUreb2TfhiWHPQfxEfD8VQXO6smajo+/dud7luPMfRxPK3zfOXi1di3vC7Qv+RTfeRXn5W2OcjabDEcMFvOyUiCUrqOuMdxGH0gjj9jv1k0KBdjSZeCzvBro2xf1z0tseNZDcdynW5Zd7FpPuIeaLjYFPrDJsdqHlw7Ot+X31in1/sDPyzIRL4pwRg0rkF/zHZ2zITsFs2PRRf69gb8yzSnua5qLi92Tmfre3I68/5eU776QR20K6bsPPYSIpH/SN/cAFyoA4IzF3yL04HTOsGL5qrj6hSQSnHPiKkckjHm6tz+rs/bDqW6B/W/DHeIwY23kArlg9HwUh+rYxcI0QCALEUcisAPW9x8GM7Dfji0TfPYayqv/4bvjV/JZ6yJ6QgzBFrl7OdenJ17FssVJz2wTo0DuyKP280gMuRjbk5w7yj0hgC1UsdF/i3dzWUsrfvfx3ClvNZXgsarAy6A71xmh1FMlskbGq1kPEAg5RKLndItlEZP+M7lxyW7GRYQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5488.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(376002)(366004)(136003)(346002)(396003)(39860400002)(8936002)(53546011)(6666004)(26005)(6506007)(82960400001)(31686004)(41300700001)(2616005)(186003)(6486002)(478600001)(6512007)(83380400001)(450100002)(316002)(31696002)(86362001)(36756003)(66946007)(4326008)(66556008)(8676002)(66476007)(38100700002)(5660300002)(2906002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Q2Q0aUlQVENqUklqNE9QYUpoVWYvSEg2TGhyMExlT28rQ0d6QXZ3Z01nV0V3?=
 =?utf-8?B?akFIMU9NUS82SzdabTJ3U0VKRUNzVks5d1h2NThSQk1LZGpmV2xERnZFRFFF?=
 =?utf-8?B?TVJTVnRtc0t3TG5WbTh1d0xmVFppT01uWm5tV1pYMU5jN05VbkNRZGFlK3Vl?=
 =?utf-8?B?QUhJNU1XZkcyOG11VjRvcFRFeVZoajg3d3VObFVWalpzZ0djVngycXUvNElP?=
 =?utf-8?B?NFFlU3o1b1VqR0FBamRlUGJwMytJejE0eEhXV1d1em55eEJxc3NFU0VpRkNx?=
 =?utf-8?B?R3VNQzdCNldCUU84cDI3dzB4Z2xOWmdudzRNRDZuSWtJSzZEQlI0NFlPdGt2?=
 =?utf-8?B?Q2JqbENlSVcvc0YxY3RUY3ViSjFvMEJ5STNpZEZIVHd5Tzc1V2FFN2l3Qy90?=
 =?utf-8?B?ZFNXRWRqQ1g2WUJ2cDB6UjA2dXhkTHRoNFhGSDRrYXJVcXVQQVNId0tEdURz?=
 =?utf-8?B?d0JiOVIxT2tKMzlheXphRTBZZ1UzQkF0d1BGci9iL0RxTlZOa0REMXZXYzhX?=
 =?utf-8?B?YWREODRRdWErejlkU01LWUw3aHpiL0xxN1dNTUFvTmJrTEp5NjlPOXZGcWVY?=
 =?utf-8?B?YkErSWdqWDJxN0hRdk1ONEVGS2d5K2JkNjFXSDhtdnJvWFhYMkFjOTJyQ0s3?=
 =?utf-8?B?RkpzcHhvd0w1Yzk1VEFuUXp6QzBjMC85MjZvdFZhOFN1T0R2SXhoazBRWWlm?=
 =?utf-8?B?N1JoMnJiNDRpbis1U2VGOEZaY296U1FqR1hNU042bmNFQmIzU054VXhCU0c5?=
 =?utf-8?B?WThKZHZOeDhPOWRUb0VnWWoxVmFVVjNjOHNKbGRwY1NJSmVOQzFhYllPMUFo?=
 =?utf-8?B?cE1xcUVuM3lvNVYwc0U5eU5zTTJFc1NXQkFONlJ6OGU3Q2JSS1czNFltWTBP?=
 =?utf-8?B?ZHF3bXFxZkE0YTZIZTd2Y3pHNzRJVUwybDFZVEhZTjIyRnl3WmJtMUNGN3B4?=
 =?utf-8?B?VGx1a3JMU1Q1NXhPMlVNdzhlVFNrWGFrTU1rRTZDSlA5Y1RId3pDZ3lVUWFP?=
 =?utf-8?B?Si9RcUduOEV0K3lOVEpQU090KzJ4OXpwZk56VWN0N0taeW5uWmVCN3FLOStL?=
 =?utf-8?B?bkZRS3pvSjl0bFNBT0VtVjBIT3puRG5vaWFIdUlHS1ZUejQ0Y2tBZy9MZjI5?=
 =?utf-8?B?bFFvVUdzeFJRRndPZEgxcllvd3ZUeVpnS2dXZkhCcytJOGZsRDJMbFNQTWlp?=
 =?utf-8?B?SGUrcFFPeTZIMUlYNUwySFMxbXJKNnd3MHhOSkFFU0VTTDlJQ1NCOVZiMElF?=
 =?utf-8?B?V0R3UHNNdnR1MjRrM1ByY2hRZVNGOEZqUmlyWnpVTWszQ3FPaWtlR0RVRWVG?=
 =?utf-8?B?Y2JiU2tGTzF0Nk1Kc0hRODNIZkdBUnF0b0JacDdFK3RsQzNoSGg1WGIzV3BU?=
 =?utf-8?B?SGU0SjZzcU9oWnpiOVVtT2NCNE1wbGszRnFSRUJnU3lJRHljclpGRG9vb2g0?=
 =?utf-8?B?ZG1BcjlHZGxhc1lrUXJaRGM5MHN6U3JKSXVBWDVQSXJFcmVLK0ZJSHdVdEVK?=
 =?utf-8?B?UkNVYzU1V3FZdkY0WkVuOE9vSVg5Y0xsRjlOVW1WaHNmaytHZnU1UzJNMXlF?=
 =?utf-8?B?WGhtZ3NOR1IrSmFyUUZvRi8rMHRxdThheG5tY0ptc2dHTlVVVCtaZzFDelA5?=
 =?utf-8?B?UWxOMlQ1TVhFODJMZ01yS2xqVE1RNC9XNHQ4ZlhrTERoSzRibFNDbDNGZExZ?=
 =?utf-8?B?d3haOVM0eG9qdTNHVkhBa3NyRVN2Z2ZYbmFOM3RocmRNenpkZ2g5c1FJRzZN?=
 =?utf-8?B?VGN0UHNvdFNmTDh3bldyZzczL2lxMEtpME5vdk8xZ2c5NXZwNHB1SFY1eHh3?=
 =?utf-8?B?blNSZTdrd09NMHNQZ1BaVnllSjF3clJpLzE1K0l5MGtEMk5VeG14NjhrOVEw?=
 =?utf-8?B?c1hUNTY5UlVEWnR0Qk56alJubWd4MFRtUUpZOWN6MEwxa0xINUdSZmE5cHhM?=
 =?utf-8?B?YStMVlBocVcwOE1xaVJRdGNHT1ZGMDVESU44Nzl2V05tb2FETU9naDdDS0lJ?=
 =?utf-8?B?eUlwQjhlY0RQcURQUzF0QU9qTjdHdFFqWGpsN2xacTZTQ2FqaXhzTlQ1M1Vp?=
 =?utf-8?B?SGdWTHdjWFR2enJ5SHBnUnRmOElGYkl4bmlhYi82NlJsZEp2Qml3SmZxRzJ3?=
 =?utf-8?B?Y2FDRzlwaWJveGdabG9RaUlSMlh2cnFBdDBUb2RqZElGVDRrNGJWT1ZEN0hy?=
 =?utf-8?Q?luAzU6v0ThszurQ52sleCHU=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 17816181-fbc7-4bc4-80b3-08da904690ea
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5488.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Sep 2022 20:29:58.1150 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vNtQ469TOZ4nY67B1VN92Z6uS/A+4OauwktU1teJmJC742bKiAc/Jn2qV0HEku0+Yvg9x2o8vg760iU5v3Pdzw2seCk1QPLT/NMHMSxdaWI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR11MB4373
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



On 8/26/2022 6:17 PM, John.C.Harrison@Intel.com wrote:
> From: John Harrison <John.C.Harrison@Intel.com>
>
> Going forwards, the intention is for GuC firmware files to be named
> for their major version only and HuC firmware files to have no version
> number in the name at all. This patch adds those entries for DG1/2 and
> ADL-P/S.
>
> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>

Reviewed-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>

However, looks like a new GuC minor version might land in the next 
couple of days, so IMO better wait until that is confirmed before 
merging this so we can do a single pull request to linux-firmware.

Daniele

> ---
>   drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c | 8 +++++++-
>   1 file changed, 7 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c b/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
> index af425916cdf64..78b1198bcf39b 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
> @@ -72,11 +72,14 @@ void intel_uc_fw_change_status(struct intel_uc_fw *uc_fw,
>    * security fixes, etc. to be enabled.
>    */
>   #define INTEL_GUC_FIRMWARE_DEFS(fw_def, guc_maj, guc_mmp) \
> -	fw_def(DG2,          0, guc_mmp(dg2,  70, 4, 1)) \
> +	fw_def(DG2,          0, guc_maj(dg2,  70, 4)) \
> +	fw_def(ALDERLAKE_P,  0, guc_maj(adlp, 70, 1)) \
>   	fw_def(ALDERLAKE_P,  0, guc_mmp(adlp, 70, 1, 1)) \
>   	fw_def(ALDERLAKE_P,  0, guc_mmp(adlp, 69, 0, 3)) \
> +	fw_def(ALDERLAKE_S,  0, guc_maj(tgl,  70, 1)) \
>   	fw_def(ALDERLAKE_S,  0, guc_mmp(tgl,  70, 1, 1)) \
>   	fw_def(ALDERLAKE_S,  0, guc_mmp(tgl,  69, 0, 3)) \
> +	fw_def(DG1,          0, guc_maj(dg1,  70, 1)) \
>   	fw_def(DG1,          0, guc_mmp(dg1,  70, 1, 1)) \
>   	fw_def(ROCKETLAKE,   0, guc_mmp(tgl,  70, 1, 1)) \
>   	fw_def(TIGERLAKE,    0, guc_mmp(tgl,  70, 1, 1)) \
> @@ -92,8 +95,11 @@ void intel_uc_fw_change_status(struct intel_uc_fw *uc_fw,
>   	fw_def(SKYLAKE,      0, guc_mmp(skl,  70, 1, 1))
>   
>   #define INTEL_HUC_FIRMWARE_DEFS(fw_def, huc_raw, huc_mmp) \
> +	fw_def(ALDERLAKE_P,  0, huc_raw(tgl)) \
>   	fw_def(ALDERLAKE_P,  0, huc_mmp(tgl,  7, 9, 3)) \
> +	fw_def(ALDERLAKE_S,  0, huc_raw(tgl)) \
>   	fw_def(ALDERLAKE_S,  0, huc_mmp(tgl,  7, 9, 3)) \
> +	fw_def(DG1,          0, huc_raw(dg1)) \
>   	fw_def(DG1,          0, huc_mmp(dg1,  7, 9, 3)) \
>   	fw_def(ROCKETLAKE,   0, huc_mmp(tgl,  7, 9, 3)) \
>   	fw_def(TIGERLAKE,    0, huc_mmp(tgl,  7, 9, 3)) \

