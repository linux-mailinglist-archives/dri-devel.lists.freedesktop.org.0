Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F1C95FB70B
	for <lists+dri-devel@lfdr.de>; Tue, 11 Oct 2022 17:28:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 63E5010E218;
	Tue, 11 Oct 2022 15:27:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2089.outbound.protection.outlook.com [40.107.92.89])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF76910E218;
 Tue, 11 Oct 2022 15:27:48 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jg6h4CZfLogc9lUQtkWD1Ljko50y44xgkCQzCUlvh2tdKJhmjFufCmBqx7g7cWO5yYMxZ722/AaZ9pCGZZdKCzUYXpp5V87IVaWdhikUbxJsxOrQbcwL3JeQssxMz/LdtoPH9rGCuTM7rSPBUEwyh6uC4quXRHb76e+sOZIaSrXwduwaLwDY/Qf/f/WZsOTk2jMXx8xOJjgNehpeWv15tl36kXnrJoanPgRVCvtNCjzw6c56NgYAzr7OEG9p/M4V9kpdr9PNtZoQHDZbYEtYLCf6tKJmTgZSRr0jUHX5R41U0GVj7glMGf+M/7edfH4TP9HvxByPdbHPmPkeoLG77g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Q49Rsaw6vhPe5kxvO9qigNHUddemdcMtCWw2oMm4lrc=;
 b=mQEQXLbfttQ69yU32S0NbocbCSYpG49FSdwO1bG4F1azugkoSWUmVGyLr2B3HoZQqpzuDTHFQYIBhprsy/n4ZcTY25a1qsR6vItnXLz4UK5qdSQqnG3FERvnpxcm5ydFrSU852BPdEkAcquhTd3/afnrWtJyKi0FGNNglrfnZtXcOYlSg+jKy/hrIXi5qf6af1Suns7yNwcor3f7ATWon9JYDB9u8LJZJlJUKct4on3ZfhldlbGqgiM124EYV7QVPRAcnBlwx7mQ0Ywk5kHKoy7s/fcAVZQVvg8zonV0OZzoFiFkkUn6uw0BAlUPqfaG5rEUGUe7tnLnVbjN+xt2Yw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Q49Rsaw6vhPe5kxvO9qigNHUddemdcMtCWw2oMm4lrc=;
 b=3eus4x4GZy1LokTdUVRMPOhpARa/9rgZnflRGflR5u6MgA602QQl+QvyLRAyRISiOhSbQ62vWfp2zoDyhnrqSCSZmNiz4X5IpFET4Yopg510nBOMgNFtN/ii2OG30f1yzPs5ZSFmF6TrsApJIY49PTmOSY8szWmzpDxraQun7Zg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CO6PR12MB5427.namprd12.prod.outlook.com (2603:10b6:5:358::13)
 by DM4PR12MB6325.namprd12.prod.outlook.com (2603:10b6:8:a4::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.28; Tue, 11 Oct
 2022 15:27:46 +0000
Received: from CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::aef3:6aae:b904:e395]) by CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::aef3:6aae:b904:e395%6]) with mapi id 15.20.5709.019; Tue, 11 Oct 2022
 15:27:46 +0000
Message-ID: <41663e73-6eb6-3624-7e7e-661745a72193@amd.com>
Date: Tue, 11 Oct 2022 11:27:41 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.2
Subject: Re: [PATCH -next] drm/amd/display: Simplify bool conversion
Content-Language: en-US
To: Yang Li <yang.lee@linux.alibaba.com>, alexander.deucher@amd.com
References: <20221010073803.88244-1-yang.lee@linux.alibaba.com>
From: Harry Wentland <harry.wentland@amd.com>
In-Reply-To: <20221010073803.88244-1-yang.lee@linux.alibaba.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YT3PR01CA0099.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:85::19) To CO6PR12MB5427.namprd12.prod.outlook.com
 (2603:10b6:5:358::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR12MB5427:EE_|DM4PR12MB6325:EE_
X-MS-Office365-Filtering-Correlation-Id: 69a25e52-9317-4a02-a47e-08daab9d25e3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: lzS+1R3Op8HnNvRTMlRiwulUnrTjGobuPNIAgHJNaFzopLWCDyrb39EABja9Q2UNiCK+f3mFDhixjqzEjwYmfclDn8m0Ry042XpnauVURgnUdPorMqYCRAI8q1BRaIsKimO2S5qbEDpzX81+n8mzaq4i+l/6w7bIhXE418KN5ZmznGHTNWizikJdu3a05bRAl8A0nSBtJJoyr8EIgNj6am7U06t7HXXrA9wqW5KY2Opp/834V6qDEpkD7nSXfS1MagkE9r/JCUEK10mfcsDpVpuorKX+sNL1JZfO3wbmE+VkgUmw3hG2lkY3zuZSpLXZVp/PmB9z1NL8g4gC+s1W06x29u7L+XLLlWSVTD01fNUX/wxpZaDby4TNAZlWTohOBJSny0QtdnAtsXv4cDGL+p9IaebFJjScCajuverANsq7pRsbqYVD3UaL2EMqMVplmmJ6b0M3Mf2AGzzZ1fQv8yMWCFbS/DUnNvmZX1+iISdNRXW1egM9r6aaAVNE6VjReqsHXiqPz3T8qLCx8lbI5Vr4jOpYq4tNzdKO/6vbBE1UIPPpD1VV+3OIvvWAzlSsxUloZWuclD1DyoaEaZdftcB93JYFXQIS/b870CU4tSrOxKYVEfYr+/PKQsTJSl8KtoNVwbTp6TW7IxGFHBzd0mFkeM+JH8iJi0CPxdPENO2tgYSxsIUKpHurXRpHYwgwuZJXD2eb5bOybHpvyoVmtIMKCicsIiMkHeD+lg1zdM/e6hBsew2ZO74X/7IIGRhfr2GnhFO3eNmClOccmdN7lZfwOcNhz0QUwQhFmIhj4eHqaTzsnxk8mlpN43XdRVqHFQ1877LOLyYOutFhIGx1og==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR12MB5427.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(136003)(346002)(39860400002)(376002)(396003)(366004)(451199015)(31686004)(6486002)(478600001)(38100700002)(316002)(31696002)(6636002)(966005)(4326008)(8676002)(2906002)(4744005)(6666004)(66476007)(66556008)(44832011)(86362001)(83380400001)(66946007)(36756003)(6506007)(41300700001)(186003)(26005)(53546011)(2616005)(8936002)(6512007)(4001150100001)(5660300002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UW5UdTNRR2RuTDBDczVydGpSK29pOGZlVGVUNHJVcTNzaTRUVXY0WWpKcHo3?=
 =?utf-8?B?cjVwYllOeHM0YTRJOVhneGhaZVR6TXZyMVFEY0RNSjJ4Wko2SlpoRmVORGxS?=
 =?utf-8?B?cTd6K09RQzh2eHo3bFpRRU84Nnl5Y0hPbVQ3SWhCWjg3K1BvWWRpZmx0OTht?=
 =?utf-8?B?VnlqNk15OXRFUmdpT1dyWEFnYldFTXdXR3phd1hvbjZtaXJzZ0RSWXBkWStw?=
 =?utf-8?B?UU55eS94TVo5ZnlnZGZSUDdadHlLMndmMFJYL0kxamtseEE5dUVxaHB3amJi?=
 =?utf-8?B?QVFjTzE0SWpqQ01QTXJONi9hczhLT05SbzZEM08xV1pJMEFQSGJSLytpdnNB?=
 =?utf-8?B?OFN1d2ZicFBheEUya3R0cEtPVUFzOTcycHRXRDFYcCsrQm53MkNGc1BVZzU4?=
 =?utf-8?B?MGZIb1ZkamVGL1FmbmhQR1FTNmdEZkowcEY0VmxtaG5BaTZXNEY5OVdIS01G?=
 =?utf-8?B?aERSS1djNitQeVdBa1pNK1dFQUEwRHJXTkgxbTV0S0pYSU1QSWVmYjlQNG1Q?=
 =?utf-8?B?NllaRFloajV0eDhDdzJKaWVIZldNY0VQRkZLczJwYVVySGlqbjBYWlhLOHAr?=
 =?utf-8?B?TGkvdXROVkhETFB1WVVwY2o3MDRVL1FXTVBjZElXR2IyRjRwcFZIK3RMcUN6?=
 =?utf-8?B?VThHNmI2RldhdXFVZlkwVU81OGd4RFVsdEpMelZ6VEROKzlRc0NpazhQdE5L?=
 =?utf-8?B?TTk4bGt2QzVwU0FlUXhIRlByOElOem9HYjZDRFpuNEwvMldZUHJEaEpFb3Zo?=
 =?utf-8?B?Q0R1dHJ2U3ZBSnlMeWdubWZnRFhGd1RGZnNCRUZQcUFHalRPV1pLSUpjRDg1?=
 =?utf-8?B?VkZDNVhLdUJmRDZaalI2b3dEM2IvY00zbU55dTJ3MTJDZitnSitPczJ0YnZu?=
 =?utf-8?B?Ukw3MjRoampHYmNzbkVqbitPZ2huQmE0NHpRMkU1KzJIdnd5MmFZYjlvells?=
 =?utf-8?B?b1NiOVlZUVhOS3BiOGRVMTZqSnM5ek5VUjR6TmN2OTZlUDBxQnY1Q1dZU1Ex?=
 =?utf-8?B?RlFPTCtmWjdNeEhWRVBFNEhxb3NyOWlhS1IzZkJzc3BCa0RTNEgvYkNHOEVv?=
 =?utf-8?B?NzBXZkdkUDVYQWdOdmpWWnBRTWNFRGNQaGNLTGVPYTBhZHZzbndoaUhnQk5H?=
 =?utf-8?B?NkdDQ2g5N0JYWXVNa09FQ0NCUDFqMFpiQ3B6OTErRGJsNVRtNklFcklUbzYx?=
 =?utf-8?B?VzNOZUdQeWRsK3FmMkdFSzVvUmlzME5pS2lIZUJtOFM1SXFlQis5ZXF0OGt5?=
 =?utf-8?B?blpUYnhtWklRbW03UGlkOWdNc3V3Sk5EYkhPWTV1aTg2dHZvcmVKaDF6aUNR?=
 =?utf-8?B?NmtDdFFLSTJUL2pWL3BsTW5OZ2QzTjZ0cDErZ3lob1Z6UkR1Wm1Zd2NYS0xh?=
 =?utf-8?B?Nmh6RTVKQzh5STkvSkRuaDdUQ1JISndvSFY5bTREeXFqbWhtaW9Lb2QvNXdL?=
 =?utf-8?B?ZGpkc2pOYVI2elhUQVFZZzZwMll1aXlZeE5MVzZHWEpOenQ0by9UWHg4UkJC?=
 =?utf-8?B?U054dnJ2RVdIUnVoaW9XQ21jemFUWGRSTHppcDQwVEtyL1V2dFFFTjhIN09L?=
 =?utf-8?B?Q0srb0poQzIzWUhEcGlxVXNhZGZBWjFVb1V3dlB5ZzlDNnBzUFV1akpwbE5u?=
 =?utf-8?B?VWhJVDdvUnc3a1dmWkExTm1qKy9jU3U5eXJmVVZ0L3d5L21HNVJXOVFTaDhU?=
 =?utf-8?B?WnhKN21VOHV2d2E4OUs5aTJacEgwRGJLdVpMM1cxSlo1ZUY4Vk85T1FXb0xl?=
 =?utf-8?B?ay96VGE1WTVkZVZWWUM4V1ZGOG1TdlljOTF0bExJYzdtcit4bUJaY09JcDg5?=
 =?utf-8?B?dEdzUVdDSHFNTnFscWp6cmFqKzZPWEQ0Y1hTdHJ6Y3RHOVVacG91V3NneDlF?=
 =?utf-8?B?SFZnSUFOR1lmSGVjMUdsOUQyRHIxMDZGdUFXN2Z5VENRSFFqY1ZscGVhcWFL?=
 =?utf-8?B?Sjg5eG1TTEJIRTFHNVVHL0tDYTUvSXdYNFNHOWgwc1ZWNjdJZGVmc0dQbWVp?=
 =?utf-8?B?WnVtUTIzWkRwcW52L2RqaUNrT3Qwakl0aXBVdzhrWnVqaVhkMkk3MVMxWnRQ?=
 =?utf-8?B?VXI1dmFlU01uQVRSc3U2VTQ5eUxPRE5JTU5kc3lYQUJvTjFpbzNxOWhJSndw?=
 =?utf-8?Q?8xR30ewxUMMTOUgBDjjUvlo/P?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 69a25e52-9317-4a02-a47e-08daab9d25e3
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5427.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Oct 2022 15:27:46.2580 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IMIu5epWKlsQmB+8w2SaxdyMObl4jZ592EkcZnjSd8Q5572AbXMRSijAPlFmk+2N/j8oZxnvCd2DJ6P/8MoB2Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6325
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
Cc: sunpeng.li@amd.com, Abaci Robot <abaci@linux.alibaba.com>,
 Xinhui.Pan@amd.com, Rodrigo.Siqueira@amd.com, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2022-10-10 03:38, Yang Li wrote:
> The result of 'pwr_status == 0' is Boolean, and the question mark
> expression is redundant.
> 
> Link: https://bugzilla.openanolis.cn/show_bug.cgi?id=2354
> Reported-by: Abaci Robot <abaci@linux.alibaba.com>
> Signed-off-by: Yang Li <yang.lee@linux.alibaba.com>

Reviewed-by: Harry Wentland <harry.wentland@amd.com>

Harry

> ---
>  drivers/gpu/drm/amd/display/dc/dcn32/dcn32_hwseq.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/amd/display/dc/dcn32/dcn32_hwseq.c b/drivers/gpu/drm/amd/display/dc/dcn32/dcn32_hwseq.c
> index 955ca273cfe1..cbda458bf040 100644
> --- a/drivers/gpu/drm/amd/display/dc/dcn32/dcn32_hwseq.c
> +++ b/drivers/gpu/drm/amd/display/dc/dcn32/dcn32_hwseq.c
> @@ -1401,7 +1401,7 @@ bool dcn32_dsc_pg_status(
>  		break;
>  	}
>  
> -	return pwr_status == 0 ? true : false;
> +	return pwr_status == 0;
>  }
>  
>  void dcn32_update_dsc_pg(struct dc *dc,

