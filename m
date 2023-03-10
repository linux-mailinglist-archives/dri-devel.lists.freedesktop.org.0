Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C48C46B4F40
	for <lists+dri-devel@lfdr.de>; Fri, 10 Mar 2023 18:43:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F070810E30C;
	Fri, 10 Mar 2023 17:43:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2040.outbound.protection.outlook.com [40.107.236.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7FCA610E30B;
 Fri, 10 Mar 2023 17:43:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lEytnBFP8Fjm1zuJN0l075gOeWPQrDSlvElRVEnxyhquUu0xd5rznp+3AooCfWM5aXWioEl8o5AbTZZrAY/JaMPuvWGeTX5MwAosePyqWcW/cA7/5FHwBvKi3B2qMTlgex2hLbVR3yB/3BwNuo0JQ6YZfNRF7QWMGE7AKYwRpr53HvZnV/f0mZhafR6HYQAgHLVcN2npWGGgwUf05+cBo0fzqiBag9smRxPoZbSrlIyuXTU7Cn3pnzL3jHo60PilRGs7u971l7DpcTr0U9/bq8tlmRH3EWhmF9coRUkCHwEcQU8PLX1kQmoM/QsNo7uXQmhDLZELbolfaYsQm2Phmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hwwkSYXstHi+ju8cAOpPNznqEOLhxKgO8eKpmMfnDsc=;
 b=BwftcvmTWDnWp26Xub5tYjHeQrR4nsDs4OvEgoz8nwZfQ4qpHeo1nG79+rMjyPiVCU6v+9TfPpPlk06M8lTibQqt2Vcc8TINtfNGOdqxdrta1dJEJKU20cpp00k2RehB0o0MBZxLHwpsD5FbamOEADcz5wr1wYWoDcAWyPN6FxOOAPubnpP+toRoZxV7w8zl2dE8eyYu+MC9nkzRjtuACbZW8fi51oDtMLwhHEpqAsxWLI/kEFQD12XA0Wt+aF8FiAT2byAED2ZAuKt+r9aO2V2mvlzetowoYmLBiIlZ7cmEsa1qMPizSWd0Y5unLdpHA0IeEeX9kBMud4t7ysTyLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hwwkSYXstHi+ju8cAOpPNznqEOLhxKgO8eKpmMfnDsc=;
 b=ulWFwYOLyZBd+eiaBTwAqXYfpK0U/Inn5O3+aNAluY5f248UFw2/YpMa1L5KimdggA1+wrfjAsCDn6TLccnolI+GT6oqu5B9armWaVmyEeV3aQWB0d0+hy1kVJ/z8IrJtCAQNBo3Z7ERUVz0RWwUEBJenp6pufr5kjC4LZyDew4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB2941.namprd12.prod.outlook.com (2603:10b6:208:a9::12)
 by SJ0PR12MB6880.namprd12.prod.outlook.com (2603:10b6:a03:485::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.19; Fri, 10 Mar
 2023 17:42:56 +0000
Received: from MN2PR12MB2941.namprd12.prod.outlook.com
 ([fe80::699d:42b8:93ed:76da]) by MN2PR12MB2941.namprd12.prod.outlook.com
 ([fe80::699d:42b8:93ed:76da%3]) with mapi id 15.20.6178.019; Fri, 10 Mar 2023
 17:42:56 +0000
Message-ID: <300c4dd2-29bc-0f9f-1d6d-b8b65bf6c69c@amd.com>
Date: Fri, 10 Mar 2023 10:42:51 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH] drm/amd/display: use a more accurate check in
 dm_helpers_dp_read_dpcd()
Content-Language: en-US
To: Hamza Mahfooz <hamza.mahfooz@amd.com>, amd-gfx@lists.freedesktop.org
References: <20230309213027.256243-1-hamza.mahfooz@amd.com>
From: Rodrigo Siqueira Jordao <Rodrigo.Siqueira@amd.com>
In-Reply-To: <20230309213027.256243-1-hamza.mahfooz@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: CH0PR03CA0450.namprd03.prod.outlook.com
 (2603:10b6:610:10e::28) To MN2PR12MB2941.namprd12.prod.outlook.com
 (2603:10b6:208:a9::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN2PR12MB2941:EE_|SJ0PR12MB6880:EE_
X-MS-Office365-Filtering-Correlation-Id: f02582a3-5812-437e-3d20-08db218ee1b2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: nQ+CZKJ+c8EC7muRtyxC3ElamAEORNIvwAWAKyUFR2Ze5QawpaSrJk0wwaQMTDp84HY1SAAEVyzDq/qRhKqiEAj0Iob4kJTzhng/04n7Ukc12xx6eftqg+fYpID11PoB43h7CE8ZarzwkvJG5CCIRVZ+C+8Tcl560SM3RDuWPOJJ/IW3/lbDyed2klHM4DMf2NEnoCL5w+rj3ONI7IdPNyzd7PL//8x8DqNXMkut5HX5dmBJ9mK9aKwLykAR6vIz2dga9SJSp7iloPDz1TKpimh+Xfl6aPuujWJ83lUIoi3ZoAzJq6xJL4mYGD/vSTGPTXhh7BiJ6almTmcz32ZMcnsnPz6JmFeRQ25fMWtH94AOekXYo5ofMQ8N0tzOc3j0SLhLwBQvxjiF2fwLEVQ8XmfjW+wAwDOfiZQcnHlwFGGPXJKdjdBy7OjPPNxm5+WAKlhJGp2Cy2oTgGXuv9n5b2jAqGVee4gWZnHPXGz1cDjtCe9PFt7jDHGbmpLIx6SuhBsUcTf/BoIkcVShshW2/OA/q6Vxsje4BWX9J/zCI4uvXD+e1uc6xOl0ngSMhF02J+SaYigscAVYLzI7PAY91/ItesxcWij1qwFutot2LPY68o5YJDjN6I76PsvkcrvawX54J3lKo2PIlu4RWT8dehehD2RnkYGwNtUiqX0uPhA8VPfse+AaXb+4eMH/2uw2G0mz1x/Nux+YBgK+y8mCWZJ0qXG6JSu1/dDxei+HJHE=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB2941.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(376002)(396003)(39860400002)(366004)(346002)(136003)(451199018)(31686004)(54906003)(316002)(36756003)(86362001)(38100700002)(31696002)(6506007)(83380400001)(6666004)(53546011)(6512007)(186003)(2616005)(5660300002)(6486002)(478600001)(8936002)(41300700001)(2906002)(66476007)(4326008)(66556008)(8676002)(66946007)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QlQwVVdobnlseWI0RFRFUjZWSi9GaHVCblNGbnFkZnJJYTE4aVJWZ21Rb29C?=
 =?utf-8?B?QnlTbFBoNUN0YjJseEVvb2NMTWNXTlhNVXppU2ZMRkJVd09GbjE0bXQxS2hu?=
 =?utf-8?B?dnAzbHpUbER6L1drcm5ZUzhNcXk4dWUvT1h1ZGs0TDlNalg0SE5UakgxMU81?=
 =?utf-8?B?Z0c3MVZ2dzVIcW9McWlWSEp1RmJOYWY2OFNzeUR4aWh2RyszN1owbmozVVd1?=
 =?utf-8?B?VjAzd2ZRaDJ1QWY2VHVDeVFDbkVoTG93Z2JlZGMxUnJleGhjTFlyMVlFZlBB?=
 =?utf-8?B?NEZIcXhTRmhoaE91SnhHTUFMaDlvUmdEclUram5mbWZIbEluQ1hwTWFRK1RY?=
 =?utf-8?B?T2NWcjRvUVNCZEcrL2NwbTRaSW8vdGZGa3IxN0VEM05tK2lTVTJDMVEzYktp?=
 =?utf-8?B?ckNGTUp6LzRVVG1lSEM2bUtEVmFNVkRpeW9ZYytGNjRSZ3VsRDVhaGhTWDgw?=
 =?utf-8?B?WW4rUytKNFR0Ym9HZjA5b3A3UThUUDJhOGp6OS9mRnNaaTZVbXJPQ2Z2V0dR?=
 =?utf-8?B?QlN4Nk9rVG1OT3o5ZzJETUpRYy91T2FQRUNCT0xOSU83cHJQM1hkUytnaHU3?=
 =?utf-8?B?SzF2am9TRjNhaVQzN3k2eklJSTdKbTVaTXpHYjJuN0pZQ1FSOFQrRU1NcWJK?=
 =?utf-8?B?WEpHUVpHK2M4cG9BVWZaQnpDV1pZbHhmRjhQOVd1YVpxMjZVemxkemVDWnZa?=
 =?utf-8?B?ek9BVHhVTzg1Nks5ZUtYbmtud3ZvaURtK1o0UmltejRBZ0ZYaG9RMWJmSFV4?=
 =?utf-8?B?R3c2c2ZySEtEajFGeXdrNTVodG41Q3lqR0NXMGF3ZXl1a2dXakFxQXh2UnJo?=
 =?utf-8?B?Sks2bkJCNXFrb3Z0MzVjcDlhZld4WkV1bWlVcGlHNDFvOGlBdFdqa2MwODBt?=
 =?utf-8?B?YzFNT2dFTXZHWWlmMGIvUWFJTEJrK3VmR2xWYUFPOHMxU2ZrSU5pR0I5cm5J?=
 =?utf-8?B?VVM3MzZFNHorN3AxNzRSVjhQUmZ6Qys5TjhNSmZsc1Q3RDJGY01ZcmFaMjl1?=
 =?utf-8?B?b2NnK1h0aEJKQWJWS1IvWUlReitrc2c2d1d0aUdYY1h1QXNaelhSeTE1VDdq?=
 =?utf-8?B?ZS9EVHpTMENrUnVIcW9CYlRndHpUMU9DS0crSUI4T0crci9QWHZTS3FaUEhK?=
 =?utf-8?B?c0ZJbVlJWWxPTnZ2RWtiQVRWVDRuekVjYmFBcHUySWx3emhUK1Z1aWt0NzNR?=
 =?utf-8?B?UlpYY2ZXeEgvNFZKYU9BemZ4anJiVDU0bGFYYjdvYlp4SytUSkpKWm1RTWVt?=
 =?utf-8?B?QmJVMFllRGZoTFBMbzNweFVBandkNEM3dllpeVRCMEVjc3ZBQ3Z2Q2JCV2Fi?=
 =?utf-8?B?ekMyTnRzM3NrUGZIQUJlSExBa0dYaFRUZXh3RElBemdoVmYrYjNoSU9MRExJ?=
 =?utf-8?B?OEdiQU4vSnlwZHI4cHVZV01iMkx0bUdKbWNHSGh0d2pMVWFqRGdBMDBhVE4x?=
 =?utf-8?B?NVlEc1NmT0U3NGNmeEFlOGpwamxHRnBGRU9UcWRUeXZielM2bGk0QWdkc05a?=
 =?utf-8?B?ODJMYkxCd0QvS3pNUlc4dDJ5cUNPbUNJdnQ0VERiL285Wmw1OUY2R01VMmpk?=
 =?utf-8?B?N1RIZnl4WFgyaFlFVkRPNk1xQVVTSkQ2YUZXMUNrU2RsS29ValpJQllQZGlw?=
 =?utf-8?B?Q1I1RXhSNXlnd3BmR0pCSDRQS1pOSUFHSUtzWlBmN2xmYllnY01DNjU5Nzdo?=
 =?utf-8?B?aTNWWEtXWDFkWWJQaVB4cDRUSEJqMlByZzVlVW91UUlzSlFGYUZwRWV0M3Bz?=
 =?utf-8?B?TDdCOEtBSWp1N2xUeFdiQ1hxNDk0bVQwd3FreFVscGRoaWFnaFh5YVMwMFRU?=
 =?utf-8?B?TXA1Z2oybU1hekx5TVhyNGg2QWtkYUJSZnhSbWZBeTRLVFB2Mlp0YWlZUUZX?=
 =?utf-8?B?Y1hJWkx6cW04cVBDZTI2dnNUbjh2TEZXaHpSUkY4bUthVjFBcWJISU5CTVBr?=
 =?utf-8?B?UHNNQnh4My81OWVRQzNtV1I5eWtUZDRWWm5MZkZtM2xOZWtBbUIyU2ViajFw?=
 =?utf-8?B?b25lWE9HTFJ3cjA2NlRhTS92eE9KOHJkVm9wczFwa3lENjhnTkdvK0RISTZo?=
 =?utf-8?B?SEZLeUcxMWlvU1ZEK2pnemxYQmNld2dFaVpaR1NIMVlPOERlTmJxRzlXVXZo?=
 =?utf-8?B?YlpJZnkyNkdobFJOT0RveFUwc2xDd0ZpNHFtemVFenFLemNYUFovaVhoK0dQ?=
 =?utf-8?Q?2MELNqH3ksmE1AuovYO3XmGfzIzW/e93spB8TgDtraUI?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f02582a3-5812-437e-3d20-08db218ee1b2
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB2941.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2023 17:42:56.1184 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FD4zHpzNgZVCHuRSSoRMmH/+lsBRIR18HSGudd0L+2oWIB8ChX3r7eLg/VBLH91USLZpFvT+j+rHusVpoZ7jdg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB6880
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
Cc: Ian Chen <ian.chen@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Qingqing Zhuo <qingqing.zhuo@amd.com>, "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Wayne Lin <Wayne.Lin@amd.com>, Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Sung Joon Kim <sungjoon.kim@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 3/9/23 14:30, Hamza Mahfooz wrote:
> We should be checking if drm_dp_dpcd_read() returns the size that we are
> asking it to read instead of just checking if it is greater than zero.
> Also, we should WARN_ON() here since this condition is only ever met, if
> there is an issue worth investigating. So, compare the return value of
> drm_dp_dpcd_read() to size and WARN_ON() if they aren't equal.
> 
> Signed-off-by: Hamza Mahfooz <hamza.mahfooz@amd.com>
> ---
>   drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
> index 8d598b322e5b..ed2ed7b1d869 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
> @@ -511,8 +511,8 @@ bool dm_helpers_dp_read_dpcd(
>   		return false;
>   	}
>   
> -	return drm_dp_dpcd_read(&aconnector->dm_dp_aux.aux, address,
> -			data, size) > 0;
> +	return !WARN_ON(drm_dp_dpcd_read(&aconnector->dm_dp_aux.aux, address,
> +					 data, size) != size);
>   }
>   
>   bool dm_helpers_dp_write_dpcd(


Reviewed-by: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>

and pushed to amd-staging-drm-next.

Thanks
Siqueira
