Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CA4CF5B0ADA
	for <lists+dri-devel@lfdr.de>; Wed,  7 Sep 2022 18:58:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D726D10E7E3;
	Wed,  7 Sep 2022 16:58:45 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F1C410E7E0;
 Wed,  7 Sep 2022 16:58:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1662569920; x=1694105920;
 h=message-id:date:subject:from:to:cc:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=vix+Cm97+aUAjCUrs/DuFpu9aCB6LD348AM3aRkej+0=;
 b=OdZWWcZG667NIkBbiNxAqzqvnbwtB5lkBue2XgoOwW+XmwO1OaYSSgc3
 0ga9jaDjtfhF75+Y1wfPQ8cgM1teR18hx+y70Jr6NL0liP29DM4THRanR
 q03BK68tiARgRb2Sqropac15pUyC2bNjDb333zGdNLgran/rSkVIWdANb
 x52B2EundARc2/H1XCLRLRMYBOJuojihDWCbeNxKaopzKZEAnmyszR5wG
 sEUeUr5jPtNHC+Anqb10bB3vZKYcxIyNNRoRDPJJLN9QNVRl1GdGMFRHF
 1LyGJ6AvpzeCYmADQmYmiJjI5KFIdG4xd2Ip+GT07HdJVM5c6DeTNyiEJ g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10463"; a="295671257"
X-IronPort-AV: E=Sophos;i="5.93,297,1654585200"; d="scan'208";a="295671257"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Sep 2022 09:58:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,297,1654585200"; d="scan'208";a="682892332"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga004.fm.intel.com with ESMTP; 07 Sep 2022 09:58:29 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Wed, 7 Sep 2022 09:58:29 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Wed, 7 Sep 2022 09:58:28 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.43) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Wed, 7 Sep 2022 09:58:28 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DZosvhBOINMr9IcqRqTI1SNqcipTye6P59Ngx0Oo5iuzRljv4sf6uFLhOjzU+SB5V/KPvytcu+8b2lnnOksgYcAuY0DVMvUidytY7sBx8lk6IgzJ6WtOhztIO9N7atOLHTDJOAzqUHPHUnsORLcpFyeLYcm3ziEsNLs1yPMOKeikUEvByqenV8KAVzp17JOSOZKlACm9cVi13z+TpjWWd0/Ibo3gAPyoCyXuR5uXR8S27Xzo7xXt7nJfL0lpzR3GmR2QgwNBAs5ooC5Pzg2Kajs2fadfNjRu+9oMS5vHwZASvq1CbGHFuAXpcs2oZb6NJkoucqeUqAQhCtcGi08B0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GVFDNxFjciom22QHj0RxjMjWrmi9+TCoT9/4qCX/5Jw=;
 b=ik2Sn6zhNSuBtsfcGYc7dYM5VHLUq0v9Xom9msMzbfoEwf8lYuURsK8OgHDS16f3UMFdGqtVPEOAi8Bn3K23bTcg6EmQUuomgu9ISXIj44iHAdZMFFv+AZQjagZCASA04zEqwOsXGA8Sv6VraMIjybxGMhzcULqSVetFWu8B3Fj0YgAQpMvrZZsaKjPXbSwkEu3hsd0KqCyltZt1zJtLVi/Tr7iw4sIDeB8m6X/gHoqo7PSNRRTXffEkI1z25E3kHyfho9vu/aZVTLmcWV+g3NYoWdWKy6dJhbniolWM9xC/wX7q3EvNvKeUIeyp4Iq+amZCxCPH4Ga1VNw7haVXQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5488.namprd11.prod.outlook.com (2603:10b6:5:39d::5) by
 BN6PR11MB3876.namprd11.prod.outlook.com (2603:10b6:405:77::17) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5588.10; Wed, 7 Sep 2022 16:58:25 +0000
Received: from DM4PR11MB5488.namprd11.prod.outlook.com
 ([fe80::1977:59e7:5a28:24e1]) by DM4PR11MB5488.namprd11.prod.outlook.com
 ([fe80::1977:59e7:5a28:24e1%9]) with mapi id 15.20.5588.017; Wed, 7 Sep 2022
 16:58:25 +0000
Message-ID: <00e8715e-2241-0a6f-ea20-344286f942ac@intel.com>
Date: Wed, 7 Sep 2022 09:58:23 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [Intel-gfx] [PATCH v3 3/3] drm/i915/uc: Enable version reduced
 firmware files for newest platforms
Content-Language: en-US
From: "Ceraolo Spurio, Daniele" <daniele.ceraolospurio@intel.com>
To: <John.C.Harrison@Intel.com>, <Intel-GFX@Lists.FreeDesktop.Org>
References: <20220827011702.3465334-1-John.C.Harrison@Intel.com>
 <20220827011702.3465334-4-John.C.Harrison@Intel.com>
 <1f200f90-0451-b7b3-e2f0-598c17e6b274@intel.com>
In-Reply-To: <1f200f90-0451-b7b3-e2f0-598c17e6b274@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BYAPR07CA0078.namprd07.prod.outlook.com
 (2603:10b6:a03:12b::19) To DM4PR11MB5488.namprd11.prod.outlook.com
 (2603:10b6:5:39d::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f1a93c9e-a812-4913-693a-08da90f22dec
X-MS-TrafficTypeDiagnostic: BN6PR11MB3876:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: jgkcMZ3nhQYZnVemGQm3FvPql5iu80tRDR8tVs49u5PLT8axCkzUhlCMfoZtgv5Lpt/Lfnorz8WreXgIA3mojeRJ+ZcvOTbnnU11Y5gn4Za6puVxJs63HWNstcaEa4tOUJ3UaCtfv4GYKHqpQW8VYclveKNdd0/f5A+zzIWQYDjXvKV6Dgq9+gW0/5a/KY6OeH0O52uapWYUDAXGF9grP3a/Hi8dR+3DrQsEGMnQAgwPpJR7m11wF+6zph0/tMZjfXpEiT8VYG+X/CqAq1MoA8oq1tnwpCdlkq6qoPopA9df+ChCD3Y88q/3P1p+TK1A7Vzf0kN3qzdBQz/1fLSgQ7Q6Vlx5fZ5Svycr8NSbIgZt4Wreue6b1GFmLFXUOIiMaRxKvzos+SCnVpg0LIOP8afuOJiGiGIKIpMCEi4RLLDAdPVXNu10/eKWJduSiwImXFOoJzamLbSg6SinWnuclGvTdLyEj0WeQeGOz65J+J1+7QEx1Q8K7bougrr1FpWf+94qI7niYJbFENFlS2d+RFiJEewq3INc423L17Q/i5Nez9ByIMCm0xe0SaYWEol9gewVNpAE7w0ghM17hSjhahDUN2UIDalfD+7/7nYIgwETXf9xYBJLO3VQCcmO3Q+NHaJxFOQP40OjwrRR+jJQUmwG5izoEDob85ls4OtRRxU0UX+9/8vS1YWIrrmDEvvK35DkUgNloXqhq+Ysxm5OaNbbM60kDzSmwRrvDE6dGY243v0D1NV+bW1vpA9isr8OHufrHe6kirLf/6z/NBfzIMJSWXzi8E6dnlg3U99AlNc=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5488.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(136003)(366004)(376002)(396003)(346002)(39860400002)(53546011)(66556008)(36756003)(26005)(316002)(5660300002)(82960400001)(31686004)(8936002)(4326008)(2906002)(6512007)(83380400001)(478600001)(66476007)(31696002)(2616005)(41300700001)(86362001)(6486002)(8676002)(38100700002)(6506007)(66946007)(186003)(450100002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YVE2K210SWh5TFVuTnR6MkFTQi8vcFVYWmtNMTAxQzI0N1hkWWxlU0lLNW96?=
 =?utf-8?B?WjlYRnpsSWN1TUZTckJqNXlJc1poYTlzb3NlbGRVbXdMZ2ZxSVIzNFRXVmZq?=
 =?utf-8?B?cXFTV1VJMkhHTE8vWGh5WUdndW01WUdXaGpOUzFVdzlqZUZjNFdqUWhxMmYr?=
 =?utf-8?B?czVuSEdQMWkvWnZrQVl6WVRpeFFDSU50QmkvMzZSUWQzVGgwaFNwWWZwK2Np?=
 =?utf-8?B?ZVpFaVJrYSs3Mk84Y1pNNDF4QVRtcjBjTUR6Y0VWTGFsQmpEQ1VrSDc2WG4r?=
 =?utf-8?B?T3lOT2ZiQmk5V2YrbHRiMUszVHcvZzZiRVpoaFZtdHJndTNHWG9DOFc3VHRL?=
 =?utf-8?B?SVdQNFFvbFkxR3VzbHJlaVJDWmlVNG1vd1FYbnZ6NzUzQ2lJZXFkMDc0cnhn?=
 =?utf-8?B?SVhTQjM0UDVoREZVZlI0SWMxRFk4dzZMcE54ajFJRWhjbTNHSGUrQS8zdDlF?=
 =?utf-8?B?VHdTeWZXaFhjTGRBakY5eThYLys5WXo3ZWk5QzJoNzlXelpSTjJaamdMa3lM?=
 =?utf-8?B?QXV0ZXVadUdOVHhqTGh3RWpmbVNmdzMyL3o4eW05Nmw1UHkyT0FZbTdHM3dS?=
 =?utf-8?B?Ykl6Y2RwRlFKcnJObmRSSWNXMGdGa3ZGZDN2c3h1NFkrWkhPbzVHb0FLM1pL?=
 =?utf-8?B?Qi83SFNkYURXZWxScDFUT1cyMnlkT054V0EzZ0VnVWpITjQ5QjEvRk9EbVpx?=
 =?utf-8?B?T0llVlpHNDNWT1E0dEtsd29hWUJJcDNWVzlvelpzbXhlcUZudTNVN2JtdWhw?=
 =?utf-8?B?a2lyZjAxR2g3cHM5U2w4T04yMFBtUzZhWXZPck1LWEszcDBKelhsQkpNR0Fp?=
 =?utf-8?B?QWZYMnRNUFdwb1RwT1l6K0tuaGM1V0J3R1dTL1lNRkxoRVY1K245SlBGR0dq?=
 =?utf-8?B?VFJtaFdyVWk3S1l6STlxZGtBc0tCZmZpL3E3SnFVcmZSVWRsbWMyZHVabUxU?=
 =?utf-8?B?bTZWR1BDRk04QWw2ejhreFFLUzJQOWhjSUJ6ZjV4cStmSFhZakxXQ1ZtdnUy?=
 =?utf-8?B?aXpXYkZMV0RQVWFqRUthd1JJeldxNGtVSFJ5bnZyK094eFk4N0loczJQZUVW?=
 =?utf-8?B?eU9IRFgrUmxXck1ONW1kN3JvVWZNVGNtbzQ0WmtKUVNOT2VjUm5KN2lXVnFB?=
 =?utf-8?B?bmZBVlBiZTljRm5hOGExcG1aYkw3R0dOMkVDWCs4MDIrM2Q5NFlhdG5Db2pW?=
 =?utf-8?B?am9rWUgvbEtaTkZBMVM5TVJGTGJWbHlSRng3aEhjM3hMQ2cvcytNM3RzRjhl?=
 =?utf-8?B?b0FvR1BvMFlWMUhscEpZL2s5cENBL05SajJRT29KNFlvdFNKVE8rajIyKzF1?=
 =?utf-8?B?SGhUcjRFYTdYZGRWTDQ0a1E2ZEcvMUNKZ2NzakFMZVNSalA5M3BkNGRUV2tW?=
 =?utf-8?B?SmhNWTgxSDUzS0k0WVRHeXBQY2dVU2ZLS1NKOWtyVlcrWisyL1l6ZVVHdXc3?=
 =?utf-8?B?eW5qR0hES3RqU3A1OWVibkNCM3NjL3NXWUNoVVlaSm44YXFvblNZWVVzZDBV?=
 =?utf-8?B?OXJuNUI4R293U1ByaWZReGpZbTZlOXhoVTU2VnJGNVBKUzU5d3QwS1pQRm95?=
 =?utf-8?B?TXFJLzR0dlE3QldSdG83eVllb0o0RUdQR0pHV3pJQVlZNGtaUU44U1dzUVAy?=
 =?utf-8?B?ZFVXWDYzSDdUVlZaTDR6bkc3b1BQclVvZGhZMEFVendlOEVGSkpSbnNMQmFn?=
 =?utf-8?B?VExJbUdVdVNxb1RWbG05TUNLcXJZdGNrWjRpS01DdXArdExGZWU4OTNxTExj?=
 =?utf-8?B?YmpTeGxuUElHNXArVENCU1RqaWp6b1E4WXBUZVFOcDN3d213QTJZQzdneVBl?=
 =?utf-8?B?QXI3KzNRZ0xpUGw0WWlWeEpkWjUwRCtUOXpXd1ozcE9pVkU4U29SckhMRGh5?=
 =?utf-8?B?SlM3WnpXV0NHaUt0aFNvcnY2cGxuWVNoejNMY3I0SExrUFdIS3pHaVlycElv?=
 =?utf-8?B?T01NaEh6Z0pKU3VkcHQ0eFFxdE1tbG5GTWxmS2hSa042akxjNVhyZHBmMzE1?=
 =?utf-8?B?WXdmcnU5VGljS1lnNzZxSHY2RTh6YWtIN1JxNGdEQ1Z2c3lvZGowMTZ0K0RV?=
 =?utf-8?B?VzlZOFRVdGprOGtqR1FpU2NSUEx4WXM3S3d2bGZhaEJmbHQzMFdmOVVzNFFZ?=
 =?utf-8?B?dThTQ1laQXBEUnpIT2drczBDaWIzMDFycFFmcVA5TzI1VHZiN2FpUkhVbWFn?=
 =?utf-8?B?VXc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f1a93c9e-a812-4913-693a-08da90f22dec
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5488.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Sep 2022 16:58:25.5643 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rwTFoSG94EQw4vQo3vDZ4FmbDhx2Bwv41c6eIAP62diHELwDkM0novCzewy+XSVCbbk+IQ70crzgczyiBUvnHIF1o3pP9xazx970KIOXBQw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR11MB3876
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



On 9/6/2022 1:29 PM, Ceraolo Spurio, Daniele wrote:
>
>
> On 8/26/2022 6:17 PM, John.C.Harrison@Intel.com wrote:
>> From: John Harrison <John.C.Harrison@Intel.com>
>>
>> Going forwards, the intention is for GuC firmware files to be named
>> for their major version only and HuC firmware files to have no version
>> number in the name at all. This patch adds those entries for DG1/2 and
>> ADL-P/S.
>>
>> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
>
> Reviewed-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
>
> However, looks like a new GuC minor version might land in the next 
> couple of days, so IMO better wait until that is confirmed before 
> merging this so we can do a single pull request to linux-firmware.

I've re-sent the first 2 patches by themselves for CI and merged them. 
Will close on the new blob in the next couple of days and then merge 
this as well.

Daniele

>
> Daniele
>
>> ---
>>   drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c | 8 +++++++-
>>   1 file changed, 7 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c 
>> b/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
>> index af425916cdf64..78b1198bcf39b 100644
>> --- a/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
>> @@ -72,11 +72,14 @@ void intel_uc_fw_change_status(struct intel_uc_fw 
>> *uc_fw,
>>    * security fixes, etc. to be enabled.
>>    */
>>   #define INTEL_GUC_FIRMWARE_DEFS(fw_def, guc_maj, guc_mmp) \
>> -    fw_def(DG2,          0, guc_mmp(dg2,  70, 4, 1)) \
>> +    fw_def(DG2,          0, guc_maj(dg2,  70, 4)) \
>> +    fw_def(ALDERLAKE_P,  0, guc_maj(adlp, 70, 1)) \
>>       fw_def(ALDERLAKE_P,  0, guc_mmp(adlp, 70, 1, 1)) \
>>       fw_def(ALDERLAKE_P,  0, guc_mmp(adlp, 69, 0, 3)) \
>> +    fw_def(ALDERLAKE_S,  0, guc_maj(tgl,  70, 1)) \
>>       fw_def(ALDERLAKE_S,  0, guc_mmp(tgl,  70, 1, 1)) \
>>       fw_def(ALDERLAKE_S,  0, guc_mmp(tgl,  69, 0, 3)) \
>> +    fw_def(DG1,          0, guc_maj(dg1,  70, 1)) \
>>       fw_def(DG1,          0, guc_mmp(dg1,  70, 1, 1)) \
>>       fw_def(ROCKETLAKE,   0, guc_mmp(tgl,  70, 1, 1)) \
>>       fw_def(TIGERLAKE,    0, guc_mmp(tgl,  70, 1, 1)) \
>> @@ -92,8 +95,11 @@ void intel_uc_fw_change_status(struct intel_uc_fw 
>> *uc_fw,
>>       fw_def(SKYLAKE,      0, guc_mmp(skl,  70, 1, 1))
>>     #define INTEL_HUC_FIRMWARE_DEFS(fw_def, huc_raw, huc_mmp) \
>> +    fw_def(ALDERLAKE_P,  0, huc_raw(tgl)) \
>>       fw_def(ALDERLAKE_P,  0, huc_mmp(tgl,  7, 9, 3)) \
>> +    fw_def(ALDERLAKE_S,  0, huc_raw(tgl)) \
>>       fw_def(ALDERLAKE_S,  0, huc_mmp(tgl,  7, 9, 3)) \
>> +    fw_def(DG1,          0, huc_raw(dg1)) \
>>       fw_def(DG1,          0, huc_mmp(dg1,  7, 9, 3)) \
>>       fw_def(ROCKETLAKE,   0, huc_mmp(tgl,  7, 9, 3)) \
>>       fw_def(TIGERLAKE,    0, huc_mmp(tgl,  7, 9, 3)) \
>

