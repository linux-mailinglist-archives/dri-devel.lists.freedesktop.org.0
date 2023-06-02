Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 05105720474
	for <lists+dri-devel@lfdr.de>; Fri,  2 Jun 2023 16:28:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7296E10E6A7;
	Fri,  2 Jun 2023 14:28:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2074.outbound.protection.outlook.com [40.107.94.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA72C10E6A2;
 Fri,  2 Jun 2023 14:28:44 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GNAtVRIrkhg4LbrWsT2QLVuMUkdpQEKk5OHuaEpI5pSt27TTBlPYyDP8AsenOzYzzvN+BAvzg8GUaolyXoUtOnkOGJqRThXQfm/pfebQeT/r031hlCyr0opSgAlvGYVFsKqNQP6JMKpGDRA9IHx99stMkJ+TOEfPKBpTAK43eJsaWaSDTRvy93DIntUUjsJZZUF/07UjocItJdcYkoorYA71tzixk1IhzQyHowoXRiwvuNd97MOZPCndmlHMTl9d1ErmC35gM07ViWdb4+2TLz3J72t6gz9JopM/qLfnH3vOkvLB3mfNu+9E6P2At7S9XAXshCj4hP8IsoX+4ELqTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VP9BDHL+/Z/bP9x+NW8iCW2ZVpkArwN6xv+H5axtb40=;
 b=GsWj4sGAVpucHDJbCXLr/Tc5hTOu/qwoF6cxZjTRz7WYl4voY659Dx4XLOTVuad3TVewQZZ0PZh75Jyu8Hkau02cCzAoxXm19ZD4ZK8ZG+DkaG/2qrhHjOY2m2K3v4fwutpGsJyWWfI/sLejV7XNqzrqHakPx2TZp4J6H6qk+3YSvUK2T3H7K2Rr00JffA5SW2xlHMnnw0V+b3qhQmxYyE65fytWfC5Tmp5MECEPG4Y0eJ73yQuLazfgk2NXsRKZEklLOBkK+NHS/uaGE5/7CwoqqMe8H6e7ToLC5dGQj3bNlLCzkT7incgHAulFsfhhrerNjXNe6Lz5ZKxKL9BlaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VP9BDHL+/Z/bP9x+NW8iCW2ZVpkArwN6xv+H5axtb40=;
 b=rY51GxgyaaYVcRDjcmAtO3/X/JUumjv29skZPN2zJLb29WTvrgT50ufpEy+GVeL2qPNt44R9++jCYcF4+Dqbn1kPg7XgPvUXqzl9PlZG4nl2nCbF78IeEcKzLajwIcIXl9ovze1IluRz33y1hFhiH8fi/xQIclRlmWjqqE0tnDY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB6280.namprd12.prod.outlook.com (2603:10b6:8:a2::11) by
 DS0PR12MB6584.namprd12.prod.outlook.com (2603:10b6:8:d0::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6455.22; Fri, 2 Jun 2023 14:28:42 +0000
Received: from DM4PR12MB6280.namprd12.prod.outlook.com
 ([fe80::fe53:2742:10f9:b8f1]) by DM4PR12MB6280.namprd12.prod.outlook.com
 ([fe80::fe53:2742:10f9:b8f1%7]) with mapi id 15.20.6433.024; Fri, 2 Jun 2023
 14:28:42 +0000
Message-ID: <53e9b63f-06da-ff0f-8776-0c5032d58aff@amd.com>
Date: Fri, 2 Jun 2023 10:28:38 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH] drm/amd/display: fix compilation error due to shifting
 negative value
Content-Language: en-US
To: "GONG, Ruiqi" <gongruiqi@huaweicloud.com>,
 Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, Pan Xinhui <Xinhui.Pan@amd.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
References: <20230602101233.1255276-1-gongruiqi@huaweicloud.com>
From: Hamza Mahfooz <hamza.mahfooz@amd.com>
In-Reply-To: <20230602101233.1255276-1-gongruiqi@huaweicloud.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YQBPR0101CA0028.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c00::41) To DM4PR12MB6280.namprd12.prod.outlook.com
 (2603:10b6:8:a2::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB6280:EE_|DS0PR12MB6584:EE_
X-MS-Office365-Filtering-Correlation-Id: 03e75c3c-d5b6-404e-e480-08db6375aa3f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: RFmjlt6CnUTAgDw/Z8Pnf6ji8pwTWzkLR23+RlWgalSHwnX/eKEdqnbHB1khX23yQzLsrzHhiycvZQYFNRYP8icEnt5fQvX/EiQqKf70h4HZ9gOrVepojRdAWuYL/iQxy2SkeUiOIXA7MctdQh+AGAcScBNbr0rkw50UTOtwMmFDKv+WXtQ7DUi3LgTmKTCshQ4gxa2DedGEvVNzpxMd4Vt0Qaboy3fGPly7lHmybdDExZfWiT8ZGupZPvgQ3Xx0T9H7Jt/O+vOdyXrmtnUb14iTSocpGqsvvlONbqScNl/Qp432zlgM6fiHLhm5mGP7zqDrOHdWBwXxZUNTm8oHHUjKeTu+SgWbp9uQq2VoIY0sSXJbX3+jxq08skD3v7sBHSFZEFVGSKoJ542KMyW17nan5Xo2oFbdfJ0DNK6sYWfNzthu7FGGWXfnKdvLx7nUCTkuWmdWoG7MacuiNOBHHwrSyWqRA3Fn2TUHAlbRsZQPGpf7f+P2eglur6vMqgic1RrosJdsbYJH9chuGC8uH/hmaOpAdj5ThIMdZMFAZstiSgZFK0w4MCkdkkAQ/ws1LpnBRVk62CVUWRCkvIBMv3dTm/tX3IA3b+K7gQ6HuhH4WQvvGGLb+ISELL83DyxJILk5Q1FzJzQMi/G93xhT5g==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB6280.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(136003)(396003)(39860400002)(346002)(376002)(366004)(451199021)(83380400001)(2906002)(66476007)(6486002)(54906003)(110136005)(44832011)(66556008)(2616005)(31696002)(86362001)(31686004)(66946007)(41300700001)(8936002)(6506007)(26005)(6512007)(53546011)(186003)(316002)(5660300002)(4326008)(8676002)(36756003)(38100700002)(6666004)(478600001)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QTduZzJVOVVtM1N3eWk5bmk0QU1LdERFelQySlhSVUFPOHV1cGhQengydkZ5?=
 =?utf-8?B?ZVVsbWNKYWpZVnVBdnZ2K1J4NkxqcDdmdVFoN01SOCtpbWNWcU41QXZRVjlI?=
 =?utf-8?B?QVVMMmI0MG5GVHdzU0JDWVVDNmRUWVNySzdBcFhwU0ZsemxXdVhhSDljSTd3?=
 =?utf-8?B?T1VBU21rRGxEcVFQMzRpMnVSSzZQT244aUVSQ2pmaWxydXFDNWYrWEtPNnVW?=
 =?utf-8?B?a2EvWnBPbU1UY0VneUNzZEhGQlFIVmV4SHdNemVPcStHMFNSMDMxbkxoa21I?=
 =?utf-8?B?VXo4RzJ0cWFadUdZSkNTS0UxbElFTUJGWTRCNWo4VldsUW5kQ2dqeE5ySHZF?=
 =?utf-8?B?VU5xUm1Cc0d6alJqTEVVSWNlY3hpOExPOWpPdmVLRVJaRmlsN1JyemRwT1RE?=
 =?utf-8?B?MDhSNDVhZElVZ3hVc1BoakpRWm53RGNFOVVlbmJ4NjY3cm16UStXZFJiclgy?=
 =?utf-8?B?SWYrYzhZbnIxaDZKODBscXZqVUxyYTM1eFYzc0JjT0Fmc3NFdlI1ZnJYN3pS?=
 =?utf-8?B?SUNJcWtaL3crYkpMcGxXVmQ2eHo0SE0vRFYramJOWkhKdzRYbWVuSUcyUjho?=
 =?utf-8?B?Q2N2OFhrRmduUHZQWUM4RVg3T2FHdzl5L1NQTHRzVjBsWVMySm9jczU0bWNE?=
 =?utf-8?B?dXVIKzNnOU4rUW1CcG5UYXlkcEwyTFYyQ05BYkczSW9DZ1EvY2JkV1psbGMz?=
 =?utf-8?B?ZTlseWdlRzdBUGJOeGs3QmxZVjFXbGxYWHZ6NWRFWXBRdUM4ZnVmbTBYVGd6?=
 =?utf-8?B?UDJzc2hKMk5UVTNIRDEvTlZTeDZKcGxVMU9VZzRmSWlKNDI1VSs4bC9md1Bk?=
 =?utf-8?B?U25TQ1cwcjk2d3BvV3JRTlhYTTJ1SURGb3JlUTJ2MHFNV2lFZStCRGlkb1Zu?=
 =?utf-8?B?NXN3dWZtemowZFlKcys3b0VNZW5xV2s1OGNHQkFUR2s2ZTFyb0tzU1dwZnZk?=
 =?utf-8?B?RWk4YVdyQkJWYTgwKy9XZ3pWTk4xVVozNzBmdGs2T29ES09GWGpQV3BWeXJC?=
 =?utf-8?B?QUlUTmUxRE95d2lodjROVjBhQnFSM3dlVDdaUXdWeUxtNCtZV3ZTT3Rtcms3?=
 =?utf-8?B?VlpBaUNyWTVOdHVjYWZmL0VyV2JzeCt2Q3U1bDArVnZkZjNoclJPQVZkVlpo?=
 =?utf-8?B?TGw0elVJSGIybTViUEdWTWNrMVRZMlV4aFB1WEJoWGlUTzczMTVic0RpVmlB?=
 =?utf-8?B?MTRyeXU0RGhIZERWbE1iRElTS0pNeXNTcTFpOWZVTDExcGZmV0FOR3ZXZitp?=
 =?utf-8?B?RktiempTUFJZYzQyNm81YjIwajU5MHVJZ0o5WFFYN3BLYmZEUVVaS1I5UCt6?=
 =?utf-8?B?TzhoRWJYUnFhQ1NEaDZMUllTN01PQzhZVTZOY013YndJWmZWWFJVdjc5dWc2?=
 =?utf-8?B?ZitPUjh3bEdxek4xOTdOT0hPaVhETWtqNXFTdEdqb2FkY3JoeXcwOW5Meklv?=
 =?utf-8?B?TktQSmp1TmJKVTVndjVzVzI4WXlsS082TEtXMUwyUlZtUnFGMWhGQmFJNHBt?=
 =?utf-8?B?MW1mMnZ1Tmx6VWFBRUVPY3ZWOFdWa21YUDFOWUxtSXBkYXRWTFYwT3M1VmZm?=
 =?utf-8?B?enhLNlNvdGQyTEJ6T3NvZDJLQWFETXJLRDFCTTJyaTRUdjdrYi9FZm5UZk53?=
 =?utf-8?B?SytlVVZXMFl2Rjk4emhUbWUwc2UzMDN6Zm1Ba1NDcXFqUGVBT291anZEbUxr?=
 =?utf-8?B?azhMYXNnRjl5RXdiN1NaOVJSL3NNbC9CcnlSTUt6akxBZG1rU2RMUWlUTEZL?=
 =?utf-8?B?WnJHZDRWYUR1di90Z0RlSWZDUTF6akwzL052UGUyUG16Y3hzcnRGRUxlNDJI?=
 =?utf-8?B?ejJxbDE2aTg1RUlVRXJ5SEN0V2t3aGV2RTVJUzVCa09zbWFaajhvZ01nb0w1?=
 =?utf-8?B?Mzk3eEFyRjZJWVdoRG84VUxTUHZWU2xFUlEzSWQwQk1NWHFJcTR1c2ZpUEkv?=
 =?utf-8?B?czIzdDdURHhrTkRkWmtUM25WUmdVTWRQQXVnQ2l0dGtFNFJINzEwMlhlR08w?=
 =?utf-8?B?clN6NnpFRjVHUjhFSWxDN1ZjWlJYS0wrZHAvZlkvNVY3RUR6eGVtRnZ3UW5Q?=
 =?utf-8?B?SmFlQm9lK0FCOTlYbWxWTHdoY21pNlpzYkN6K0pDZHR6aGFITXBWY0piRlFU?=
 =?utf-8?Q?zByD717el8TL5hFAkDcEpFq3F?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 03e75c3c-d5b6-404e-e480-08db6375aa3f
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB6280.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2023 14:28:42.3142 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /RBRE9sKERD2RdFJtGkPjMtI0Ek7UrnH3pFy9e+nZ5n99a6hm3XoBY5O7Wa41XPDqz0FKD9xAc3kxx9UB7y3zA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB6584
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
Cc: Xiu Jianfeng <xiujianfeng@huawei.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Wang Weiyang <wangweiyang2@huawei.com>,
 amd-gfx@lists.freedesktop.org, gongruiqi1@huawei.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 6/2/23 06:12, GONG, Ruiqi wrote:
> Currently compiling linux-next with allmodconfig triggers the following
> error:
> 
> ./drivers/gpu/drm/amd/amdgpu/../display/include/fixed31_32.h: In function ‘dc_fixpt_truncate’:
> ./drivers/gpu/drm/amd/amdgpu/../display/include/fixed31_32.h:528:22: error: left shift of negative value [-Werror=shift-negative-value]
>    528 |  arg.value &= (~0LL) << (FIXED31_32_BITS_PER_FRACTIONAL_PART - frac_bits);
>        |                      ^~
> 
> Use `unsigned long long` instead.
> 
> Signed-off-by: GONG, Ruiqi <gongruiqi@huaweicloud.com>

Applied, thanks!

> ---
>   drivers/gpu/drm/amd/display/include/fixed31_32.h | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/amd/display/include/fixed31_32.h b/drivers/gpu/drm/amd/display/include/fixed31_32.h
> index ece97ae0e826..d4cf7ead1d87 100644
> --- a/drivers/gpu/drm/amd/display/include/fixed31_32.h
> +++ b/drivers/gpu/drm/amd/display/include/fixed31_32.h
> @@ -525,7 +525,7 @@ static inline struct fixed31_32 dc_fixpt_truncate(struct fixed31_32 arg, unsigne
>   
>   	if (negative)
>   		arg.value = -arg.value;
> -	arg.value &= (~0LL) << (FIXED31_32_BITS_PER_FRACTIONAL_PART - frac_bits);
> +	arg.value &= (~0ULL) << (FIXED31_32_BITS_PER_FRACTIONAL_PART - frac_bits);
>   	if (negative)
>   		arg.value = -arg.value;
>   	return arg;
-- 
Hamza

