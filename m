Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 26B08671689
	for <lists+dri-devel@lfdr.de>; Wed, 18 Jan 2023 09:52:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4CDFF10E1E5;
	Wed, 18 Jan 2023 08:52:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2050.outbound.protection.outlook.com [40.107.244.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 32D1F10E0CB;
 Wed, 18 Jan 2023 08:52:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bi70F7SfUt7jE+rrB1+uJM/U3c3jKwcBn75j5hcKRpZprOZRSrFgcis+TgLWOMHhJ9xnWK32DPYLcu280YKq56WpgyXdqYeolXjjhnawRcFOb9pD1EKwivTg6c2EgiJHET1GeorQuQ9KGFnHNCD4zWyd+lEwi8ubLm+vW4C2gCOiSiqjfMfpSO4LobO3ZLwmYojTbrb8XaiGpsMywXqgQ3ehkERTKLlU0RbdL0d+JSjGNI9s5b0U4UAUFL2V5trfboYJ/NrrKDjm1JBbTw/MxVN2Fip7pCii4DmkWeGvXT8N+3UtM/jx8sNXa4pPSIHAGBtmClj2rOENcQ+Ssbgu/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h1ECkoR+3/WDoEQ2FuO44DKpRaxHsDksYpGsGiduLVU=;
 b=E7IvKkcjdwbbuUrzNQvHIc5+/nLlw3TlZDvJiUi9HX3bNfhRgEH5klUYNw6YEr5zjK4+EtWJ490OINRWJpKwHax0GdZbZb5G+zDGFriMmxU2IzBXC/UyyEeTbC4PRhAmjnppxYuqzm0MXy00sPUE11Xu/WuZnVvCAOPmX/Or4D1iRfdmxopIwUy+cy0kqx0EqtdjXl2aCrcD/cWmnvvtHvaxhtF6j6h55i7RUKq957RzpDwYjw/xpOFODT8Y4djnm7xAto31RyzSoIFlQZI80hvmHe3AZQIYnKpq2lNl+cDvJt7oVUv2qyjnW/zWT9UmL/+tt/2DSUhIJRvEjrlPOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h1ECkoR+3/WDoEQ2FuO44DKpRaxHsDksYpGsGiduLVU=;
 b=t3Qyw1C1KSaWtBT05HiL3kJZPNSsWgFWc+SD7Up6y50i1EnT25qUiQbU5gZKLqC/Oqw1g42se8NAAsWTtTblHbkRzwtumwEj87VrYjedjOQUxgUxbaDF/A7wuO0/U/HzplzhJ+S0UQWq1Xy9ZSMsa/tSDiTAnUvfTPszbYoEwBs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BYAPR12MB3589.namprd12.prod.outlook.com (2603:10b6:a03:df::29)
 by BY5PR12MB4870.namprd12.prod.outlook.com (2603:10b6:a03:1de::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.24; Wed, 18 Jan
 2023 08:52:03 +0000
Received: from BYAPR12MB3589.namprd12.prod.outlook.com
 ([fe80::500a:d02f:5ceb:4221]) by BYAPR12MB3589.namprd12.prod.outlook.com
 ([fe80::500a:d02f:5ceb:4221%7]) with mapi id 15.20.5986.023; Wed, 18 Jan 2023
 08:52:03 +0000
Message-ID: <3c3bd64a-164b-7ff2-ebf0-c8f9c2f94b72@amd.com>
Date: Wed, 18 Jan 2023 09:51:55 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH drm-next 02/14] drm/exec: fix memory leak in
 drm_exec_prepare_obj()
Content-Language: en-US
To: Danilo Krummrich <dakr@redhat.com>, daniel@ffwll.ch, airlied@redhat.com,
 bskeggs@redhat.com, jason@jlekstrand.net, tzimmermann@suse.de,
 mripard@kernel.org, corbet@lwn.net
References: <20230118061256.2689-1-dakr@redhat.com>
 <20230118061256.2689-3-dakr@redhat.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <20230118061256.2689-3-dakr@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0070.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9a::9) To BYAPR12MB3589.namprd12.prod.outlook.com
 (2603:10b6:a03:df::29)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR12MB3589:EE_|BY5PR12MB4870:EE_
X-MS-Office365-Filtering-Correlation-Id: 7886a82e-8e4e-4baa-df1a-08daf931448f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: SEPJWkNN8Q7M/UMg9NbgyC3vLFLyo8zmNUSk4zvVXGgdOPLgXtwZI0o+tsg4KYihdywdXwnBhFbvuuGgvHDGWWNPeH78Xy0rGCqdtq/Zd2uAQye+5rg9jZ+AIOeI1TpwU13sCMbHc6YRcZb7bKkhi0AqTavaQQLNvTnks4roVKEcdz/uikOP6XMPOyxcCxTGaGlKi7A+TPnsbkCbsuKD93SYbPnqt9BD/OqDy7EyXffu+gsGvk1q0BqrLnLCSx2lbdlaWj9YOzXwC+ppQoSa9fFl7tHi9KMMQ8dyZzoNQQ9oCs0xig2PxiQkKfeBM2W+Ep8vJmdIFwy4868ia/IeXpqebUhGlCW4E5JJuhSxipX7vOeK6ptWngmWd9Yh+rZcrcS+D/NliGCr8ICYjG+Xdq6LzLJVSinH+889ijnz17dGITWUj+MDANX63CgEIjMcoTTqcfgkcRE7iS/K11Z+uL9SMtd43Z8A0uV0wPSArgklmO/Y2i/76fv1MZuAIje3md9DKLVpjpP7NoEFmumpzniDHv4pLPajgptwaHo3lG6EgMI+DjkK0dU+fyfi5AlHYy0RGZkPhDkT/uecwhIe7ZIZY8+e9HwM4O47WI9kZjjOlJ0WpSxQVYCRSd+J4+CjJySZO9edXS83a5r0f2Z7cHCzX2Ub0If5o+hj1Nb3R1xlD5OGw5iPCAcDMjZsmc1GU6n79s75JQB1TfCuuN3LS3JL2DTmt7tf8tLq6laCh1U=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR12MB3589.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(376002)(136003)(39860400002)(396003)(346002)(366004)(451199015)(31686004)(86362001)(2906002)(7416002)(66556008)(66476007)(66946007)(4744005)(8936002)(5660300002)(31696002)(38100700002)(316002)(6666004)(6486002)(6506007)(478600001)(36756003)(41300700001)(8676002)(4326008)(186003)(6512007)(83380400001)(2616005)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZTFJYVpQRXo0VEpod1RiNXI2QllYOVlvY1k2RVJLc2tqQmxRTGtBVm9sRWZ0?=
 =?utf-8?B?Sy96TkFxanh3ZkZQOW1JbWNWRzl5ZWFQai9ZNmtMaGN4a09DTitWcXNaVVNX?=
 =?utf-8?B?RDI0czlRdFJDOW9qR1BJeC9Mc3k0Z25jK1pzYnpESjdJaWZnUzRadjlIdEpU?=
 =?utf-8?B?Qzh5K2ErNldCQ0NpSjMrQ0hNdHY2T21YTmI0VC9VV1EyaUpYaHpQTzVIcGhL?=
 =?utf-8?B?ZnhsUUV0T2xyek9qb3ZmUHNzeWdtaDcyNXc5SFpNMDFCNTdlaUxnVHNCZXRt?=
 =?utf-8?B?Vmo4Q3o4eW1taVVJbG5EcU9WQit2ZG9YVnhvcCtiWWZ3a0dDQmtQR0t1U1hx?=
 =?utf-8?B?QjBqbnNCOUhBemJmdmwrTzIrbmdySjMxcDVtTU43VDdFcC85VjJzb3h1bENH?=
 =?utf-8?B?aXBnL1JRbFdJNGVpMndjNDIzNXJEQ2dTa3FxbllZcjdGdjNGNzdXRnJ6SkRQ?=
 =?utf-8?B?cXFaaVM2S21wTEppeTA1aVl6SjFyNkxtQi9SbXhGTCtxN0JTV1F2RmZsVUNJ?=
 =?utf-8?B?blUwUlVxTnMyalh1YzErV1ZTbW5Da1FJM2RYbWVsSUMyNDB6aG5ITWFQVkY0?=
 =?utf-8?B?N3ZYTlh5Z01jZEg0SlorOXN3bFIrbXE3aEZzV1ZYMFJxUERGZFp4VGxtbnlU?=
 =?utf-8?B?L0sxZUFjazdPbUhxVitldmdJamE5dlJZWWUzL1VMTFNMeUlhb1phdEZXTVBj?=
 =?utf-8?B?aENzS3RDK0NkNVRRaERnYlpJbTVrVU41VDh6eS92cFlabkxHVyszUFZQWDdo?=
 =?utf-8?B?RHFkTWthYk5LTmhvM3pORjdicG42Nnh0V1E4M242ajJDSFlCMklRYXlBNmJS?=
 =?utf-8?B?MXNpZXZiRTdHMGZ5bHNEQ1ZFejIzVTQzWXoyT3pkYkZSY1hTRGIvZCtnOGF3?=
 =?utf-8?B?MHB6TEh6TTM1YlJYZlJwK3M2Z0NlbUNvK3lOTXVrSFVwK3hZZGphejFxOE0w?=
 =?utf-8?B?Y1FUeEg2a0JpbDhubko5WDlYR01rK3dsRUZNd24vQk1sWGpsZDl3bll3TmRP?=
 =?utf-8?B?ME4vZENYYUtUdEpKVWl2WXJRdHpEVEthc1dDcUFiZkt1ckxDTVN2c2JIaXZJ?=
 =?utf-8?B?TXRHZWE1bEFVVk1Gd3FOd0Rsc0tYcWlSQU1aRzF1RGxIL28vcisydEhiVXNT?=
 =?utf-8?B?QXlNTEZEcUFOR1pUV0hHT01lN1VlSmxLQVRmbFY5OE8wb2hNYmVjTGJma0ZX?=
 =?utf-8?B?MDVMZ3FMQ3JmWk5ySDlCU1hiVGJvVGpvdHRiMW5DVFdycVlETHNTZjN3WEhF?=
 =?utf-8?B?MHRhTlVSaHR1bTVXV2l0NzZlMDNaMUw5RUhTLzdjUTVLVENPVzFnZEhvMTJa?=
 =?utf-8?B?eDU0ZERjK0R0MVFMaE5YSDArdUVLdUtkZXRveHR4dXlzL2JublZORWZVUXZB?=
 =?utf-8?B?UTJyNDBqcEFqamlUNFhHREVOSnFVVE5ZR0Y2eDcxTVZSbnhWRTdRVVpoN1g1?=
 =?utf-8?B?SE81QXpzVDRva2F2QWxiTkpKNlQ4d2N5ZFcyZjh6WnQvUnZodXdqdzRDcFlE?=
 =?utf-8?B?Yjl3UlFKelR4Uzg3VjlMbUZmYmRuczdlWmhLQnFFc0Q4U0VkV0huWWJqVDk4?=
 =?utf-8?B?WTExRDNlQW05N1pvMmdCZWNwbVhCMWJicituRkhWZ3BtNE44NWFPc2x1eUdX?=
 =?utf-8?B?ZlJncWUzMTJIdEVFTVdZa2dOdVdKaVl6bkpVMStZNUNwM0ZTUTIzc2VRd04x?=
 =?utf-8?B?UWx4SVBIdTBnOWN3NEYzcW0vV0EvVEllNUtpVVJCR1FLRzRJSkpDeTUwNm9m?=
 =?utf-8?B?QVIzdmtrc3BOZld1c1VVMjBqem5mK0greGtGZXByUVRHUmZSMkVVbk5ISTZK?=
 =?utf-8?B?cVdUOXFMYnVVdVI4Q1VxbGlpTHFhZ3NDZjR0dld6UFppMEdxU1VJVUxVZStv?=
 =?utf-8?B?NjB1cDJLMitqWEJxSHVYeklVOXNmcGduZkFrTGwvYWpvMTRGUlltTUpId1BX?=
 =?utf-8?B?bldRQlowWmpRQmlSSWQ0Rm9vWE1EN0tkblJiZXE0K0dLZHBjOWMrcVZVNCtG?=
 =?utf-8?B?NXc5QnB6UzJCU2lZMkxOUHZ4Q2xyRkhnTStYaW9HSUE1VUtNSlJscEpDcXZO?=
 =?utf-8?B?bmpsQTBibUxFNC84ZU5qMHVpVEsydG1lRnZ4ajVCRjZ2ZkxKdnlvcGdGamxs?=
 =?utf-8?B?a3dNUE40Z2hlRklHS1JlNlV2bXgrK1JTSS9qN3c2VmVsQzhvN0IxcDZybFlR?=
 =?utf-8?Q?sXiqYQJcw0fWrRZxLJ48n1F6SDFfo9heCvn8Cq1F19tO?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7886a82e-8e4e-4baa-df1a-08daf931448f
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB3589.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jan 2023 08:52:02.8308 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9RVMhxuegYjd4hRk5bNnOcGR6v9SbwxP05r7rEOs2QRmQOvHZa4H2sqvW8L4c2De
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4870
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
Cc: nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

That one should probably be squashed into the original patch.

Christian.

Am 18.01.23 um 07:12 schrieb Danilo Krummrich:
> Don't call drm_gem_object_get() unconditionally.
>
> Signed-off-by: Danilo Krummrich <dakr@redhat.com>
> ---
>   drivers/gpu/drm/drm_exec.c | 1 -
>   1 file changed, 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/drm_exec.c b/drivers/gpu/drm/drm_exec.c
> index ed2106c22786..5713a589a6a3 100644
> --- a/drivers/gpu/drm/drm_exec.c
> +++ b/drivers/gpu/drm/drm_exec.c
> @@ -282,7 +282,6 @@ int drm_exec_prepare_obj(struct drm_exec *exec, struct drm_gem_object *obj,
>   			goto error_unlock;
>   	}
>   
> -	drm_gem_object_get(obj);
>   	return 0;
>   
>   error_unlock:

