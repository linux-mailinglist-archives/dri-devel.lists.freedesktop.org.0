Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C770C30F5A4
	for <lists+dri-devel@lfdr.de>; Thu,  4 Feb 2021 15:58:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B70EF6EDB5;
	Thu,  4 Feb 2021 14:58:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2060.outbound.protection.outlook.com [40.107.243.60])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 766DE6EDB5
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Feb 2021 14:58:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UkYDdiuC/gaCBWK2+QRPxAKsxYG/n9N3O1xKnkhcwhZjs3PUSG/KjSX7UvdfTXhPBrjUTeV6F36lRotYSi/pj8oWuyPv8Iq6LS87cmUhaLvNsR9yiTXsPpAQzxfnz+wXdJSqb5jDe5xMBgNZX7pmDxBd7+rCRNQfF9AHwo3EDPCDsUvtrxHMZpcY5OEGZz0fiaLNM7gjCp1zG+IbW8oAVpDkrj/2W/hj+PxHl5d7UPw6omVpEnOEDR4qeXRdMTdPZD91vS9yucsUbRuhnqUmNRsLEzAQXjP1F6uxj0FGLuED8ltmAWiOMosCLr3aTRXxE6msejGsuur2JTS2tE5zHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zJ5n5WuTwrJ0tDK9acn6/5AqVUgpvkwuiSaQmc7Qrxo=;
 b=a/NWXQb3/z8gTjgCuSn7NUBd0f37lnr0UHnL4idYCsiV3bXsLk0R80+hrhghAX0Bky3xmOabWDFVbu7oSUQAoQ3gkXSSi3LOFoJ6vb587eKbeTlSj+RKOwtE/d/mtPeVaLme3qgWp8McQZk+cun+ig0aUbiKTQx1xeInlkwGd46MxWDPeiGknvbT2J2Rh3XsETBLQa5SFMxrVozLOzbcDeLT5Sf0s4OfBIPwJM3wL9mpO1IY+47N4MQyGohoI84YHV424Y4PUAD02nJCY6x3v77sNuzoH1Onq1xxvklQgfzw/trNFvAWdGtljzIYbh5UgrikHEAdr6Oeuyw11WK2RQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zJ5n5WuTwrJ0tDK9acn6/5AqVUgpvkwuiSaQmc7Qrxo=;
 b=1BHQ78XYmeJaIF2kfjC45FrFx8E7WOo6TN9oqfoDLJHCha9PYNbCfy1L0BRiEiwmervhIy8qHeKUF19Q/R3jZNe9q/1p6Kt6+bRQo/0zFL8SSv399xxDtS59TtLiMPU7mTBfdX1cABK9wiMNNmrqeWy7LFdzDFgAvdhByf4ZpxQ=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB4253.namprd12.prod.outlook.com (2603:10b6:208:1de::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3825.23; Thu, 4 Feb
 2021 14:58:40 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::44f:9f01:ece7:f0e5]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::44f:9f01:ece7:f0e5%3]) with mapi id 15.20.3805.024; Thu, 4 Feb 2021
 14:58:40 +0000
Subject: Re: [PATCH v6 01/10] [hack] silence ttm fini WARNING
To: Gerd Hoffmann <kraxel@redhat.com>, dri-devel@lists.freedesktop.org
References: <20210204145712.1531203-1-kraxel@redhat.com>
 <20210204145712.1531203-2-kraxel@redhat.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <1bb54d72-a9b5-0d9d-6f08-b8f9f4abe421@amd.com>
Date: Thu, 4 Feb 2021 15:58:33 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <20210204145712.1531203-2-kraxel@redhat.com>
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
X-ClientProxiedBy: AM3PR07CA0078.eurprd07.prod.outlook.com
 (2603:10a6:207:6::12) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
 (2a02:908:1252:fb60:be8a:bd56:1f94:86e7) by
 AM3PR07CA0078.eurprd07.prod.outlook.com (2603:10a6:207:6::12) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3846.11 via Frontend Transport; Thu, 4 Feb 2021 14:58:38 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: e599659a-59c9-44c9-b441-08d8c91d5b48
X-MS-TrafficTypeDiagnostic: MN2PR12MB4253:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB42536A5E7BA7F8A665B2021783B39@MN2PR12MB4253.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4714;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: IgG/C+0/pC5g/bi8aW0VmwyT1x+N/7jguKlw1a5AT/TwANp0v7RLlZpPJ5vrOKUKN6B49bWYwqRQzOR0euXlIDS8MR2pRJaQa3NjmicwuQL7E7JWaAfXiQF5/ucVA6yK7djIsNn9jFCFbTglGjssPiNMS8RiyRioRBau36v6kp+2LNJ206QMzUzMDYhj3nwpMCefJQgU0ZAQVjVlinR/bV5qCE52yZ+8E7weuiRsajuyOBiBDKGp/8t6KL+r92wZIHg2MUgevN8TiHY+Ngao+OE5bOkhuG+1Rfpop07r2wmYjil0eQg16DLoXYmRgJdTe6aY/TmDGdfVtBO0F4kWyMkCiwoqVQsz8oEm2aYH8lIrHS4T1OPfq+DLTfHjQcLv9jALFY3eKCVTDzjfYgymplArI29EVS5vuDiMsavMq2/Pb0JtM3g3P0SWcu6YB2HJp5jFJqQbl0SatQhRS9TANnFNUEhihLakHjDMpal8D8qQP9p6KlgUQP1wYsrFHPCS4TrPggrVIglVFPzIbn0+sT6jtxymA4G37yfws9bMM8C0s6jczJBp7Om7qa4sN9Ylio9b+NUj1Fzvl3cZEBb3DzoTps56oQmzsrw9DUeV6co=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(366004)(376002)(136003)(39860400002)(346002)(5660300002)(31686004)(4326008)(6666004)(86362001)(66946007)(66556008)(478600001)(8936002)(6486002)(16526019)(186003)(8676002)(4744005)(54906003)(316002)(2906002)(2616005)(52116002)(66476007)(83380400001)(36756003)(31696002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?SWM4VVM3UjlFcS95cTRUajNWOTl1M3kyVndlMGZEUFAvdmhWc2NQd0ZESlJM?=
 =?utf-8?B?aDMyMDJ1ZDNMQTZFSERwLzZ0MVh6dXRremE3Vk5yM2RBVWhPODZUUG41Lzdy?=
 =?utf-8?B?UFFOWnlEU0hMbUVaR3UxZnB1aGVxZzk4bUt2eGREOWZlUXI0d08wakROcTVl?=
 =?utf-8?B?Q1FGN0RtWmFRcEwrbTlXUms3UGROL2sxald2MGIyY0tkT3pReFltNk1xSFg3?=
 =?utf-8?B?ZHFndDUyVVRJNk44aEluZ0hSYUQySFFkZ3MzcUtQeHRDMmNKd21iN2REa1NW?=
 =?utf-8?B?a0gvRzFxUkkvaC9ZQUs1a2dISUtpQXVjamlJVlYyVzRZYVdtaFl4TGRJMmxC?=
 =?utf-8?B?ZlRvTmJ6aUQrbUtZSmlBQ0FSOFNEVmt1OStlSDJUNExNYTRUUGt3RC9IZjQx?=
 =?utf-8?B?aVRyWVFNVGltYVBxR0JPcFMzYTdXS1N1TWs3VHlTYUR5L25rMW5PQ0lwWTB4?=
 =?utf-8?B?Ryt6bzFtelVKMllGcHBra1VjUlNzM0ViMGVXN1g2YjdJN2lIQ0tlbnBiVklE?=
 =?utf-8?B?d1cxdEJDdXZod21DR3gxQUdFWlVHUGdtSm10a3NCVk1uMnZmdHorL2xNMFhI?=
 =?utf-8?B?M3JqQThHRGk3am5BMFZJQ0d0eDFvK2JGS0MzM3VUajcrMjYrd1VCcEZHSkJZ?=
 =?utf-8?B?N21DTTcxMm1rVUhJRlN0aCs5dy9SUWR2bUlHcjkvcGRZQlJTR0tmNjJmU0Zr?=
 =?utf-8?B?TFdjbHFvRFVUS2FOKzdiZ3VLZ1FqOFh3cDVJSWIwazJYNzduK2hBeE9VQjdF?=
 =?utf-8?B?eG5LT01jSEFaMGFwY1Nib1dDQmZVc2R3UzM0OFJ4TXBZMmg2bWdtTVMyTTdt?=
 =?utf-8?B?RUh1VUZBOU9YRTNIWHo3MlNjRm5ycng4c1l3NzAvdVFqdVlwckNZZ0lXb3RR?=
 =?utf-8?B?MHRuQ3hBNXJxSUpyT3JyN1BtV0Y0Qm15akZDS0YyS091MFN1V3lKN1J3ZjN3?=
 =?utf-8?B?QllMYTdFa0tlOElrK09ycS9wR0JUN2ZGNlJ2aDJpT2lUaVVLdXVEZTUrNW1Z?=
 =?utf-8?B?YU5aMy92eGlMT2RrR2FkWFJuVzdIRkhWOFBEdE04aWlYSnoyQnZMVWVoYXVx?=
 =?utf-8?B?d3NSUEJiYmZTRk81dkF0RHhjS2U1NmF1eXFqZklRcTl4am9DZDlKdGdxWHQw?=
 =?utf-8?B?UDNTamJWbEFGbDRpVWUzMmpuUW03VkNRU3M3czg0ZUxNTXV4STFvaUkyK3hh?=
 =?utf-8?B?QVpqUEhTQm5PaXRzK0xnZEVOYkxZY29seG1ON1BBeU91ajNWbDhSSHhDdzd4?=
 =?utf-8?B?b2ZrR2thODhjcjgwT3NYUzRidnhTWDlSeVRiWDJnZ3BVVjJvc3FOL2Nvd0I4?=
 =?utf-8?B?VjNQV1lFL3Q3bzhoWndPSE9OQ3BkRGtaSXE1WHhub1M1ZDJOS2JCVDg0ZHc5?=
 =?utf-8?B?dUt3b3lzWXozSG5saDFtYTVFbHhhMitHaCtlZzRsNmpMU0xTSmNObnk4UEU4?=
 =?utf-8?B?RTkzL2FhU05WckZZMzR1Qi80YXRjdWQxdUgzRWtodE5QQzltaFVWbWxHc2hV?=
 =?utf-8?B?ZE4yT0Q2dzdoemRxbUVweFZmdVNCTXh5SGdxNlJ3dVgvZTFFR1lFcHpDR3FJ?=
 =?utf-8?B?ODlKTnZqeTNIRi8xbFVLVE1NKzZ4OXR0Rk10WVVUeE1pV0tadnp4NURFeTd5?=
 =?utf-8?B?eC8zMHVrYWFPOVQyU1E0QkJ1YTBDS1liRUUrZmhCWEt2N1ZySkF0WkZNSjBt?=
 =?utf-8?B?eXI0bHVQSExQUDU4d2VMY2hIWVhVamxDOVVKWU9jSnRYVHpKVyt1ckFmTGlt?=
 =?utf-8?B?TytieXF1TzdFdmswSDA3MHJ6aVNteFBqOGxoV2lmN3RMWTFtWDduNHJuWG1I?=
 =?utf-8?B?bC9CUlNoMTZWa1RRMmNzdUhMZ0dOemx4MVovSGdCbEY1WXVyRmlUNSt4QTR1?=
 =?utf-8?Q?25yXXi1JNr6cs?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e599659a-59c9-44c9-b441-08d8c91d5b48
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Feb 2021 14:58:39.9628 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9eVz3NmPTziY/nOmGZ3QTiWCRSLQVKDlj4VNhG3rTEOj0cthB8mo7gt6YVLB0F0J
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4253
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
Cc: David Airlie <airlied@linux.ie>, Huang Rui <ray.huang@amd.com>,
 open list <linux-kernel@vger.kernel.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

?

What's the background here?

Christian.

Am 04.02.21 um 15:57 schrieb Gerd Hoffmann:
> kobject: '(null)' ((____ptrval____)): is not initialized, yet kobject_put() is being called.
> WARNING: CPU: 0 PID: 209 at lib/kobject.c:750 kobject_put+0x3a/0x60
> [ ... ]
> Call Trace:
>   ttm_device_fini+0x133/0x1b0 [ttm]
>   qxl_ttm_fini+0x2f/0x40 [qxl]
> ---
>   drivers/gpu/drm/ttm/ttm_device.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/ttm/ttm_device.c b/drivers/gpu/drm/ttm/ttm_device.c
> index ac0903c9e60a..b638cbb0bd45 100644
> --- a/drivers/gpu/drm/ttm/ttm_device.c
> +++ b/drivers/gpu/drm/ttm/ttm_device.c
> @@ -50,7 +50,7 @@ static void ttm_global_release(void)
>   		goto out;
>   
>   	kobject_del(&glob->kobj);
> -	kobject_put(&glob->kobj);
> +//	kobject_put(&glob->kobj);
>   	ttm_mem_global_release(&ttm_mem_glob);
>   	__free_page(glob->dummy_read_page);
>   	memset(glob, 0, sizeof(*glob));

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
