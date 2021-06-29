Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C6E213B74EE
	for <lists+dri-devel@lfdr.de>; Tue, 29 Jun 2021 17:10:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3FEF06E8A6;
	Tue, 29 Jun 2021 15:10:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2088.outbound.protection.outlook.com [40.107.220.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A7B956E8A9;
 Tue, 29 Jun 2021 15:10:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JmUyhpNQWLjVHSTpJuhZniho52UzKMDPbYNy2BrniLGHaj8H9hMHyQ0v0NOuYejT/OeObDjEVpcRrN+GIyruZ+FubSpyf0CwVOk74AZb1T+OfBydqiz5ti0JV7HjmXBROYbd+thnxu9mr9f7v2Wfm+9XuR9dwkhEhjSVyWb7459syNJ6rIotOevQ4yrfH3oOxorXAxoyD/vfhdSkLSVYUeSP9R/yXPPdnYOBw3Ww+rXU9UBc9Unja9qedVWBJIFxBxiAJ2X7CS6qtu9YnIWZANVJg6suRIf2F5fcWItXt1czJZyAhrA2ukvET/Pwf2WcWYP/htV/fPMNG1bhjnQ5tw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xb4qnCXMRkAtwTPAG0K71dqY6nzHVjaS4tCH3xBZGX0=;
 b=jJvYSmxky226woxRjQw/xHdH6xPNwhXD3D2s/s40MInsRpqK4J4aD+Ihe1/s4TE+xR8DGHsFUfCboj++xzdSWhxxrm1ch7DzIHNlicDGJnGVnDeBPy5sFywO3KSta4FwXffxheGwGQkKK7Gf5mVBCjxbikHCtwKz3YVIFcGy8H9y/ByWdx9SBYQoTpXIM7m7vd0mChvMogieuUQZf+Ui3A/owT6zg7fG94B+Ntl3m95yTUNUTLApdIMFlL6+sol4ll7n9ltQy3Q57z0RNgzHaY61k7nsa7t+UJpbeXneBiOJ2iM2yUIjUFbb2WtqACmPTFZjnZaXuUQ0kpmPH2+o/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xb4qnCXMRkAtwTPAG0K71dqY6nzHVjaS4tCH3xBZGX0=;
 b=HDK2HZ3sKOBuYCOAAHfFCZkBmy3mPOlxsLayuEvYmiphlmHig0hnVfI21U639PDO4XL0/KDFJUTQlsLPigEDMsd9LqtbonQ9Z0Rmha934O6HQc36PD52VXq5LMeUIVJTxVhuR1cq0cg8BgySwHGA+2XoT5QDwC7eMt2iwO8OVN0=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=amd.com;
Received: from CO6PR12MB5427.namprd12.prod.outlook.com (2603:10b6:5:358::13)
 by CO6PR12MB5396.namprd12.prod.outlook.com (2603:10b6:303:139::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4287.22; Tue, 29 Jun
 2021 15:10:03 +0000
Received: from CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::401d:c7a2:6495:650b]) by CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::401d:c7a2:6495:650b%3]) with mapi id 15.20.4264.019; Tue, 29 Jun 2021
 15:10:03 +0000
Subject: Re: [PATCH] drm/amd/display: Respect CONFIG_FRAME_WARN=0 in dml
 Makefile
To: Reka Norman <rekanorman@chromium.org>, amd-gfx@lists.freedesktop.org
References: <20210629112647.1.I7813d8e7298aa1a1c6bee84e6fd44a82ca24805c@changeid>
From: Harry Wentland <harry.wentland@amd.com>
Message-ID: <9e21a922-38d2-3d03-4524-c122965f7db3@amd.com>
Date: Tue, 29 Jun 2021 11:09:59 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <20210629112647.1.I7813d8e7298aa1a1c6bee84e6fd44a82ca24805c@changeid>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [198.200.67.154]
X-ClientProxiedBy: YQBPR01CA0128.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:1::28) To CO6PR12MB5427.namprd12.prod.outlook.com
 (2603:10b6:5:358::13)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.50.3] (198.200.67.154) by
 YQBPR01CA0128.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:c01:1::28) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4287.22 via Frontend Transport; Tue, 29 Jun 2021 15:10:01 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d357c19a-1853-4ba2-89fe-08d93b0ff8cd
X-MS-TrafficTypeDiagnostic: CO6PR12MB5396:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <CO6PR12MB5396C80B7E98D467E0B1FABC8C029@CO6PR12MB5396.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4303;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: SJa0GSrxoaO3l9Cykdl05Euvr5AqjIgWnDv8tdMzLsnBWf/NtVVmM16osTTWmEwWlsZJ3b76ajRuywm9Ap8A3tIfTUtf/AUAVuh7CBATS3BNRdKseVpJI2r8ohU8qe5Ii3Jd8tpTjc/pNNF946taX6loojqarw4iPJuslvYyK1FyV9ndSJ0+h8wM8imUCWucc/J0tvZZ/qVKG+yn098FLYoHuSlDxZNZyoOzwouPAx96bZxdcUenwBT1CboDqFci89INXK9FsqS1kMbuQeJgpVHJIapdrG+m8ch+Uy3rt5HjqGYZj+S2gr/mqT6y32aEvKcRE2qaAZQE2OzHQjfMSN+nIt+2wiYgnzeTVQ2KkpuBN3ZZA8fkJa2aQS2SgiPQWQzHsn/hOvadQLhWt0rtGesTZgW3iH353/bLXBsyDbBYKJqj0l/z/Kf/xSiHxKvHokdeZhNreuPhD5CvMfV5Ousk3+1Oqqz/f4aJVVXRa2G1/qp3IrcNFOklPdwjwmvOse14DYAmxt0OPM79wM78JOgoxyLfyllOo6T+yplZxLYXRoYklEnsrjHxcTqsR3CheA4mOL1uef7XVIDlOFU/cSgf9WKdPGt+Jx1SQNBMFqEoh3k96NQSvdWROecQE/Wbp5XH4C1qH6qf9il/1c1H1pm7UjzKAvnS9SEQrgfGE8XbU6nuV09Z/QpQdnd1vnOm7nmXrsGgm00qvzE7vS6HBtIcyZy8lYq84LHAkiGfVK0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR12MB5427.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(366004)(376002)(396003)(39860400002)(136003)(2906002)(31686004)(316002)(16576012)(44832011)(53546011)(4326008)(8676002)(36756003)(66946007)(54906003)(8936002)(83380400001)(66556008)(66476007)(16526019)(86362001)(2616005)(38100700002)(186003)(956004)(6486002)(31696002)(5660300002)(26005)(478600001)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UXFwZHlTWXdFV3BKQm0vamtidUVtcmFMU3prQWJKdHp1Y0VxMVZrdDBDVTIx?=
 =?utf-8?B?YUxCU1JDUGFyeUVaS2IvTWVoTEFjeVRod3kvU25zS3RsVDU2NGx0NkhHYVpZ?=
 =?utf-8?B?UE9MSlBuQm51cW1ZMnVwenhqQ0lZRzl3NjVmOUJiT0hEbHNGUWxXdWp4aTVk?=
 =?utf-8?B?cDRUK3gzT2IvMk1vYytWdktYeUMvOUw1d3lVbUJETFBDeWduUU5vdEluY0hY?=
 =?utf-8?B?dlVQTkFwa3pFYS80djFZcXFwVWcwQU05SGhXaFlOQVAyZVZod0J4R3p0V1NK?=
 =?utf-8?B?cUF2eWFMNDNLaHk3aDZTa0xGb1k5b1J4dFpCTjE5WXM1STdwRjgwVmxmajg2?=
 =?utf-8?B?S2V4OFNtcEx3TTBaWVpUdk40UGlNMjVVYUlvaTd2Y0VrZitHdzRSMWVMVHFl?=
 =?utf-8?B?MHNIb3VPT0E3WXNST2pGV1JXZGpnMFZWSkRuNm54SmdoWEJwYUc2OFhqVEFZ?=
 =?utf-8?B?THFWYnJwZWMyS1JqaUJRdm14MVF0VGQ1RUxTYVNNSmYybE9mT2M4R2FuRkor?=
 =?utf-8?B?L3piSlU4QzMzWEIzOUlwUW9pbExvaUZLUlkyNS9xaWRXU3lTL3BhaUM5M0Uy?=
 =?utf-8?B?VnNlemttL3R6V1VOTmxJeUwrN1ZQb3h5b2RwVmIrcWp5UlJCbDJjYkU0bE5E?=
 =?utf-8?B?VEQ1TFpwWkRJOFoyZTBNdzlVQnVZejFNa1J6ZGg0dFROUDI1Nk13dEluTk43?=
 =?utf-8?B?TCtlUzRuRlkyQVNlMTdaMDg1aU5tM012bzVwSUlmREYrWnpTOEZNRUg4SEdp?=
 =?utf-8?B?MFFMeEw2RzVic1RwenVTY0l0VjNxZEpvWGJCRVlyQUQ4RXhXNmZQaDk3RFln?=
 =?utf-8?B?OW9QVHlwOWd4emZDZmNpdlpDUkdGN2k4MVMzSGV2Mjc5akxEZm1mMDFnT3BK?=
 =?utf-8?B?cXVQK3VlcnVlNVpkeWpEVjIya0ROUDIyazJGaHZZSjJMOTc3M3hxeFhua1pz?=
 =?utf-8?B?dW5USVhJbDlZS1czZ1ZCS2VUUDBjNUZ6NzVjTmlCWW9uMm9tTk41T2Z4Z01w?=
 =?utf-8?B?ditPSUZ2TzhuV05OVmNFR1NjOGdHOVBZUVdaMVVwUGRXTVBNYll4MUxHczNB?=
 =?utf-8?B?blRYOUZQYzUwSTQ2ZmxOZFNjWHhKRURsMGYyb01ta0ZBU3NDK2NOeElISXhy?=
 =?utf-8?B?Wkh2VkpYaFJ6TzFGY2FGRUhqMnVUd3pLWmh1cC9JZ3JRZXY4cy9OaDZiUDN0?=
 =?utf-8?B?NE1wZjExMGQ0cG85UFhnMllwdnJmaTg1VG83WkN4SEk5NGZPZGdHeUVpZDFl?=
 =?utf-8?B?amtEbWd3a2hjMFZqSVY0M1JHVGV3bFZhSDRHSDZwc1loT0k4d3N3SXdVTXdW?=
 =?utf-8?B?OWJrZm5lMGlSSlhhdFJhNFpwRlVKNTU5bnY1cGw5ZDU2N3JkektGOHl1UHVh?=
 =?utf-8?B?eHNERVZHOW1QZzJudWJTckVFd3FpZFBFWjJUMUdveUpqQytucGhic3B2N1JW?=
 =?utf-8?B?S3lYZFR0Ky8rK3FEYUZPYTViV2lYNjFGZ1J1bkNUbTZ0UjdRdWtNMWV4WUg5?=
 =?utf-8?B?cHpIcmpVVUJQVzJMRHNyQi9pL0lnc3FISFpmbElHTmp2eWJnWHRtL0dwZVkw?=
 =?utf-8?B?UXNqMDhPa09ucHhUVU0valJzZWNzcElzWk9tSUNzWjlnY05HVENCbjFkeTMr?=
 =?utf-8?B?dkNFenkvNGhlTFBoc2k0Y0hDeEowZHpTYnJDOHo5Ni9uSjBXNFI0VmcyaFpZ?=
 =?utf-8?B?cmowUG9XUTZwV0ZKT25VdXlQd0FzVjlSMWNEcUJjd2VSVTJIVjFMRXBwQlhP?=
 =?utf-8?Q?LdBFr4G0eU1Gmo0Le7AVAgOEu4Ujjilf1d2Iqqr?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d357c19a-1853-4ba2-89fe-08d93b0ff8cd
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5427.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jun 2021 15:10:03.6305 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jt/j8ugsK5w1jTvvOD55CEj6d8l9vKTL8H2sVSE+uywaDX14oOGcPlfs/dPhKIU8gRmG7aVGN5941nsHNJD3gg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR12MB5396
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
Cc: Reka Norman <rekanorman@google.com>, Will Deacon <will@kernel.org>,
 David Airlie <airlied@linux.ie>, Daniel Kolesa <daniel@octaforge.org>, "Pan,
 Xinhui" <Xinhui.Pan@amd.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Huang Rui <ray.huang@amd.com>, Alex Deucher <alexander.deucher@amd.com>,
 Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2021-06-28 9:27 p.m., Reka Norman wrote:
> Setting CONFIG_FRAME_WARN=0 should disable 'stack frame larger than'
> warnings. This is useful for example in KASAN builds. Make the dml
> Makefile respect this config.
> 
> Fixes the following build warnings with CONFIG_KASAN=y and
> CONFIG_FRAME_WARN=0:
> 
> drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn30/display_mode_vba_30.c:3642:6:
> warning: stack frame size of 2216 bytes in function
> 'dml30_ModeSupportAndSystemConfigurationFull' [-Wframe-larger-than=]
> drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn31/display_mode_vba_31.c:3957:6:
> warning: stack frame size of 2568 bytes in function
> 'dml31_ModeSupportAndSystemConfigurationFull' [-Wframe-larger-than=]
> 
> Signed-off-by: Reka Norman <rekanorman@google.com>

Reviewed-by: Harry Wentland <harry.wentland@amd.com>

Harry

> ---
> 
>  drivers/gpu/drm/amd/display/dc/dml/Makefile | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/display/dc/dml/Makefile b/drivers/gpu/drm/amd/display/dc/dml/Makefile
> index d34024fd798a..45862167e6ce 100644
> --- a/drivers/gpu/drm/amd/display/dc/dml/Makefile
> +++ b/drivers/gpu/drm/amd/display/dc/dml/Makefile
> @@ -50,6 +50,10 @@ dml_ccflags += -msse2
>  endif
>  endif
>  
> +ifneq ($(CONFIG_FRAME_WARN),0)
> +frame_warn_flag := -Wframe-larger-than=2048
> +endif
> +
>  CFLAGS_$(AMDDALPATH)/dc/dml/display_mode_lib.o := $(dml_ccflags)
>  
>  ifdef CONFIG_DRM_AMD_DC_DCN
> @@ -60,9 +64,9 @@ CFLAGS_$(AMDDALPATH)/dc/dml/dcn20/display_mode_vba_20v2.o := $(dml_ccflags)
>  CFLAGS_$(AMDDALPATH)/dc/dml/dcn20/display_rq_dlg_calc_20v2.o := $(dml_ccflags)
>  CFLAGS_$(AMDDALPATH)/dc/dml/dcn21/display_mode_vba_21.o := $(dml_ccflags)
>  CFLAGS_$(AMDDALPATH)/dc/dml/dcn21/display_rq_dlg_calc_21.o := $(dml_ccflags)
> -CFLAGS_$(AMDDALPATH)/dc/dml/dcn30/display_mode_vba_30.o := $(dml_ccflags) -Wframe-larger-than=2048
> +CFLAGS_$(AMDDALPATH)/dc/dml/dcn30/display_mode_vba_30.o := $(dml_ccflags) $(frame_warn_flag)
>  CFLAGS_$(AMDDALPATH)/dc/dml/dcn30/display_rq_dlg_calc_30.o := $(dml_ccflags)
> -CFLAGS_$(AMDDALPATH)/dc/dml/dcn31/display_mode_vba_31.o := $(dml_ccflags) -Wframe-larger-than=2048
> +CFLAGS_$(AMDDALPATH)/dc/dml/dcn31/display_mode_vba_31.o := $(dml_ccflags) $(frame_warn_flag)
>  CFLAGS_$(AMDDALPATH)/dc/dml/dcn31/display_rq_dlg_calc_31.o := $(dml_ccflags)
>  CFLAGS_$(AMDDALPATH)/dc/dml/display_mode_lib.o := $(dml_ccflags)
>  CFLAGS_REMOVE_$(AMDDALPATH)/dc/dml/display_mode_vba.o := $(dml_rcflags)
> 

