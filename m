Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D82204EE121
	for <lists+dri-devel@lfdr.de>; Thu, 31 Mar 2022 20:53:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7DA0910F49C;
	Thu, 31 Mar 2022 18:53:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam08on2073.outbound.protection.outlook.com [40.107.102.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE36210F497;
 Thu, 31 Mar 2022 18:53:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=R+4ZWyCDuXLvc7EXutwfeBT2grgrUdo+x7tR48HH7XjcsenXIg+1Y47DPEMbaOQSFbwPVgpQscoKPGbjscjjx8VV3EB8oCtDpge3cvzev2IET9Bq9j8v9k8feVLdXFg1dUHz6PszCtFybxL+0bfmnSgla87xzXVWynqQa8kLg3OaPra9ymUe25sVmAK0RncrpjYkM/j1suvQrC80kmfGqo2Oy0aBIVehDZ8Bpm8No08/nPF1dcnrzA14uDK0zpbJt3M5zReS4GJmoJ9u+XkA7bCcCbqchCsEH+JTM4S0v7Sy1v7tcOyHxOY6aCgehhxDIQn2JRAgY8ciKxg23EB1ng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mCF1UfMalkNbe5Q4Vw4pG1qHwGb8hK33xSo7tpDtpNQ=;
 b=B8aeCt7ZBl8pAHAZWZyL09UaLDEPtEG2+CxlV2h/Y9/W3vNPmuv+lTTASphjIgcNl9a1aRIFmZKe8+zXMFIgzSfXsLZL026K2VISQSw9aEm/L//zZeP988M6kqRIawaj2xTqoGuDOA8wOWG2+DgpY71RWxRtCt14QcKRc8NohEJRx7lLhJWHTEIR3YUGB+W3iatOpfWR006foI+7Ea1GOBx98108BeVXwAAYwsENa7EXsaUP6UT92AdkXDPitu9CoUT44g6wrAs47iomCKn9jIVX/o1P9NSpnbvljukWfcLvsEhrMyyOmPokDfchpo6342YN1SCTjav8TcbQxYDB/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mCF1UfMalkNbe5Q4Vw4pG1qHwGb8hK33xSo7tpDtpNQ=;
 b=05wH1cZqE+Gk10rHY0n7YAYxJ7KcERJ0ReepCU716Wr2EdFzYuNNg8okGDADjnDiLQeUFzv4WFd4ROAvTIqMhwodVhJBESn4V4/VVDiMM6sbIc7RhASUkkRjQb9QTTMZogntG5R7m7OKiQhWOZKL2kGZ+0sn7wKZlX6YUkUUWLg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CO6PR12MB5427.namprd12.prod.outlook.com (2603:10b6:5:358::13)
 by BN8PR12MB3009.namprd12.prod.outlook.com (2603:10b6:408:42::32) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5123.21; Thu, 31 Mar
 2022 18:53:16 +0000
Received: from CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::61e4:a6bf:9444:31f9]) by CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::61e4:a6bf:9444:31f9%5]) with mapi id 15.20.5123.021; Thu, 31 Mar 2022
 18:53:16 +0000
Message-ID: <bc638c66-4cf5-4a6c-0169-271c24676ba9@amd.com>
Date: Thu, 31 Mar 2022 14:53:10 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 1/1] drm: add PSR2 support and capability definition as
 per eDP 1.5
Content-Language: en-US
To: David Zhang <dingchen.zhang@amd.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
References: <20220331172652.3445223-1-dingchen.zhang@amd.com>
 <20220331172652.3445223-2-dingchen.zhang@amd.com>
From: Harry Wentland <harry.wentland@amd.com>
In-Reply-To: <20220331172652.3445223-2-dingchen.zhang@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YT2PR01CA0014.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:38::19) To CO6PR12MB5427.namprd12.prod.outlook.com
 (2603:10b6:5:358::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 57528f2f-80d0-4609-5789-08da1347b6d4
X-MS-TrafficTypeDiagnostic: BN8PR12MB3009:EE_
X-Microsoft-Antispam-PRVS: <BN8PR12MB3009E100F2D0F19099FDBC388CE19@BN8PR12MB3009.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Tsc8qJEpd6Hw1X3ctY07dbMsdW9aXrhTHlt6DyJ6W4mYPthQUlkgsihhLgJmB6UO/ycguXYWxqd2ZSeX+2BSSLQto8AO1yE02SdhzjebIGT1p5SEUMi8/VZuZRi6+jOjkb45voz1mNgJP60zU8WrJi9ES0rNcfkPncfO9WQs440zUwlUiTMTezDZBND6/b9FI68ITiXKFsZEeQ8jQVeTlKlwpkyVmZuvGJBvgTQBKeGsxeMWtpV7FVezK8mCLixgpnpLtAtMfPVlJkHpUTo6ruYmy/c8NPJHgIzSyNL7w+NfFCmXretgFAX47xXaZYQzBXPVm0pOhYG68Rwkw2aIR0LM/vVamEbxwuE5cuuXDqh+FusqNiwb2+xfnxyjQ9wPV5gNCmSQY2Q7+Lmvp2wHiIlsIo05nS4jnJH0V1W/iQqkemufMp8VbpBMuKQukYCjS6nGDI+F1pYfgWPaOyzg6MAt/8B/0+GAOqxTuPV3vSRoR9r8GHC0S3ODfdG/9bLyTIF1gK7eYZ8+UTywsOYAdd9mpUGnGYdKoVP8kz9WFfXhPwoPbTHme7Ozzc6+hdiy+7qHSpnsB6pGk2sqlVtyarNyJ2vi7ln/Ml6uJuoUblueesLiga5l7bc8pc17z/aOkOiGOTXMTnKbeZludfo7ibUH1Xwm8TLPXaabglZ+4VMmFP/scgfP1yCcim3Ssn4TldI+AbkoI9ncYeS/XnOzE8XkKSmjH7QGMQBlOGRR9XOE5rHMOn1fC2fdgRB78mpSIuEN61VweRt5w3ENBoQOVw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR12MB5427.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(5660300002)(31686004)(38100700002)(36756003)(44832011)(8936002)(2906002)(31696002)(66946007)(53546011)(8676002)(4326008)(186003)(2616005)(26005)(86362001)(66476007)(6506007)(66556008)(6666004)(508600001)(6512007)(316002)(6486002)(21314003)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bTVmTC81Y3RyVTgrRHVtTkpwalltT3NUWEFnUW5GNXdCYzFzZjlpM1hlMXVu?=
 =?utf-8?B?Z2pUSE5UdlNUbVN3N29pd2xLTUhSMjh0OGZJRVFUM091c0pUUmR4L25pOW9K?=
 =?utf-8?B?VEtqMEdnajVNeDhaRnBTbTRQUzdxSHg2ZENCYkRUYlF3am9YT2gwbHdZZTBl?=
 =?utf-8?B?VDNXdE00LzRBc0MxRmJzU0xVazd0WWl5ZjVROWJRMVA2L3F6bkRtays2WGI4?=
 =?utf-8?B?Mk5IWVRGVkxuN1NRSFVHd2RsLzVGMUNBWi9UR29oeWtxTVI2TiszaHlYR1BR?=
 =?utf-8?B?eXJrT3pyYkNFdmQ5UXRFWGhmZzRTVFg4YnFoUnpqcDVWNjhsNXV3K1NrODRE?=
 =?utf-8?B?UDU4bTdkaUU4WXhabnBjVWJ6WnNyQ0NsNFBNVklGekNBK3ZqWXJqbm9DQ0Vh?=
 =?utf-8?B?WC9kMlNXaVhkcGdEb09TR2VOMWdWcDZoS2RKdVI2Wnc0cmJDNGdmckl5Szgr?=
 =?utf-8?B?YXhQVURtaU93aDdIUzdqSW9lYzRIZVRPWFdlQlVKWks0dm9lMXNHWVEyVXMx?=
 =?utf-8?B?ekFBK1RqSGhiU0hFS2JqNVE0c1J6N0VVajhWR2NhNVVsRlZ4MW03ejZlUVRW?=
 =?utf-8?B?T2dXTHdicmhyZFExcUQza0wrL2w0aE92UVY2K2xHWDhHeXI2Z0VzQ1h6L2NC?=
 =?utf-8?B?V1puM0o0Yk5WY1NIeVpuM01Zam1KTkNud1lWR1ZyRkpLT0RGTXY4bThKN0FL?=
 =?utf-8?B?RWNwdkFDbmhUUjkzUVNRUEltRU50OXpHU0pwWkpkS1dCK3ZZSWtreHVyaHhz?=
 =?utf-8?B?Y1BqekI3a1ROSW1NV3lLK2NuQjZ3L3pnV0tZRlhmWms1WXRCSHBZd005TjA5?=
 =?utf-8?B?RGRXNDAyMXZZNlY5ZHJOUnBXVTlYZFlaSTFLOGVodXRGYnZ6a1ZnekV4L01T?=
 =?utf-8?B?ZFhzS083bGVsSkd0eFJtWS9HSGdzVlRiQ1B0ODZ2Rm9UZXprSzVpMmtoQ1k5?=
 =?utf-8?B?OTNwRHEzU1JEU3RmbXdJYmZrN2JSWVplaVh3eiszS3Q5UW5ydjJwc250eWg0?=
 =?utf-8?B?dFZrWmNMd0MvNmFBU1I3VUNpeUd0ZFVzTHN0bHVIaGcwT2ZERm9VKzVzN1Rr?=
 =?utf-8?B?N3E1OXlSNjI0K0FRN0JYYXpicUtvcWNZblBKQ2doRUtKc3dtUmV2TGdPaDZV?=
 =?utf-8?B?QWF0aWlDKzUzSUhRRU9WcmRVV2w5eTFodDFra0psY09sT0UxMWR5dmhsOVVl?=
 =?utf-8?B?S1YvdnBoSTJwWTI0aVE2K2Uwd3kxYitWZTI0VzRSWWlkS3FnaHdwcjJ2VFhJ?=
 =?utf-8?B?b1NVbUd0N3VXSGEzNlJPZlRBWUFYcmMzbnFVMjlYaGpyTzNEMUZaSjViamZW?=
 =?utf-8?B?ZWFPM2g5eDViNXRod3UxNmFIV2NjMWR0YlluNEl0dS9JazNRWERFcFpaaXQv?=
 =?utf-8?B?dTFkRjhFRm5GSnFvaUdtTisyenh1Y1F6Sm9nV21nUHhRd0xOY01sbDFGeTRv?=
 =?utf-8?B?TmVGUWlRSzI5YmtGSXdlSTR5OFZFaXVvbVF1MG1McGs1NUNFWUg5cjB6RzVa?=
 =?utf-8?B?QWhZWTlxbDVNekJvQnBtZzI1Z3RzZCsvOU45NVAzc2h6ZGJac2ZFOGZHSkE5?=
 =?utf-8?B?S0syeWE2R3d0MFhqM0JTekt1SmJ1UThITm5tRVRUeW83SDdVK0J5b0FraWk0?=
 =?utf-8?B?RHJmcnFmeitaMURnckF6YTVrMGlYUUVWc29mRzVLcWF2enlBTkdZRFlDN0lv?=
 =?utf-8?B?YTUyQzNSbXV3RjdtM3ZPT3R3SnhPNkFJZ3VDUzVuQjFWMmFJRnl2N0ZMYlpj?=
 =?utf-8?B?Nk5JTEJBV3ZZS2RXTHV5UWg0b2tSTEEwWUNZR25CajlBdGJneEN3NUJFVW1x?=
 =?utf-8?B?UVVVNFdnOUFIdks1ZnZmWTE5d2dVeWF4ajVzSVNUVjJsdHg4S0JvYUJ5ek5O?=
 =?utf-8?B?YVloY1JzTEVNb3dHVmpLYTRheFBySi9SZ3ZSWDJ1SnBCdit1WTNNK0dmRTdv?=
 =?utf-8?B?VUg1ODRITVlRTDNkamlrcnRLZkRyekNxbU5mMTJmNHRnK0ZUYmF1bTNaRC9P?=
 =?utf-8?B?MFdQQmg5M1g2N2dKZEsyUnZ5Nk5vSmp2WGEwVFp5V056UzhlaktPNVNKMHBQ?=
 =?utf-8?B?TlVDa1A5N1QyKzlPbnc0ZjNNWHRQa1Y1N2lVcXlHc2lKTHhkNGh3b1U5VU5E?=
 =?utf-8?B?dVJTbkRCc2pIbENGdXZZelpISWdyWGFlNEY2anZvOWZHTGV5WXpzSHplTzZO?=
 =?utf-8?B?TkhBMU8ra3E0T25RZEV2Y044eE9oTC8wY0djeWR3ZklzS052VnhMekZSbjMv?=
 =?utf-8?B?WlBSWTVWNG5jWWNPTEdRZ3NKWGxYa2FNSnNwUGxXOXQ4OWh2QmRxUDF1WEFp?=
 =?utf-8?B?SHhzRXNTZTN4Mk40bmYwV3VRVmtLb0FoMmNsTkZ6czlibFc1TVNNUT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 57528f2f-80d0-4609-5789-08da1347b6d4
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5427.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Mar 2022 18:53:15.9821 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kykh+nOnYxcTLwrqS/nNzFuEgqUBNPvKXi74aKqMQnn2g5RxndTblUYZeCBAlZvhGJELdeG5ABpKnUep5lDJeg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR12MB3009
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
Cc: stylon.wang@amd.com, airlied@linux.ie, Sunpeng.Li@amd.com,
 qingqing.zhuo@amd.com, Rodrigo.Siqueira@amd.com, roman.li@amd.com,
 solomon.chiu@amd.com, jerry.zuo@amd.com, Aurabindo.Pillai@amd.com,
 wayne.lin@amd.com, Bhawanpreet.Lakha@amd.com, agustin.gutierrez@amd.com,
 pavle.kotarac@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 2022-03-31 13:26, David Zhang wrote:
> [why & how]
> In eDP 1.5 spec, some new DPCD bit fileds are defined for PSR-SU

Please fix up the type in "fileds"

> support.
> 
> Signed-off-by: David Zhang <dingchen.zhang@amd.com>

With that fixed this patch is
Reviewed-by: Harry Wentland <harry.wentland@amd.com>

Btw, you don't need to add a cover letter for a single patch.
The patch alone is fine.

Harry

> ---
>  include/drm/drm_dp_helper.h | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/include/drm/drm_dp_helper.h b/include/drm/drm_dp_helper.h
> index 30359e434c3f..ac7b7571ae66 100644
> --- a/include/drm/drm_dp_helper.h
> +++ b/include/drm/drm_dp_helper.h
> @@ -361,6 +361,7 @@ struct drm_panel;
>  # define DP_PSR_IS_SUPPORTED                1
>  # define DP_PSR2_IS_SUPPORTED		    2	    /* eDP 1.4 */
>  # define DP_PSR2_WITH_Y_COORD_IS_SUPPORTED  3	    /* eDP 1.4a */
> +# define DP_PSR2_WITH_Y_COORD_ET_SUPPORTED  4	    /* eDP 1.5, adopted eDP 1.4b SCR */
>  
>  #define DP_PSR_CAPS                         0x071   /* XXX 1.2? */
>  # define DP_PSR_NO_TRAIN_ON_EXIT            1
> @@ -375,6 +376,7 @@ struct drm_panel;
>  # define DP_PSR_SETUP_TIME_SHIFT            1
>  # define DP_PSR2_SU_Y_COORDINATE_REQUIRED   (1 << 4)  /* eDP 1.4a */
>  # define DP_PSR2_SU_GRANULARITY_REQUIRED    (1 << 5)  /* eDP 1.4b */
> +# define DP_PSR2_SU_AUX_FRAME_SYNC_NOT_NEEDED (1 << 6)/* eDP 1.5, adopted eDP 1.4b SCR */
>  
>  #define DP_PSR2_SU_X_GRANULARITY	    0x072 /* eDP 1.4b */
>  #define DP_PSR2_SU_Y_GRANULARITY	    0x074 /* eDP 1.4b */

